#include <sys/types.h>
#include <sys/param.h>
#include <sys/resource.h>
#include <sys/select.h>
#include <sys/socket.h>
#ifdef __OpenBSD__
#include <sys/sched.h>
#endif
#include <sys/sysctl.h>
#include <sys/utsname.h>
#include <net/if.h>
#ifdef __FreeBSD__
#include <net/if_var.h>
#endif
#ifdef __OpenBSD__
#include <net/if_dl.h>
#include <net/route.h>
#endif
#include <err.h>
#include <errno.h>
#include <fcntl.h>
#ifdef __FreeBSD__
#include <kvm.h>
#endif
#include <limits.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>
#include <time.h>
#include <unistd.h>

#define NUM_SCREENS 4 

#define LCD_CLEAR() do { dev_puts("\x1b[2J"); } while (0)

#define LCD_CR 0x0d
#define LCD_COLS 20
#define LCD_ROWS 2

char* device = 
#ifdef __FreeBSD__
	"/dev/cuad1"
#elif defined(__OpenBSD__)
	"/dev/cua01"
#else
	NULL
#endif
  ;

int fd_in = -1, fd_out = -1;
int screen = 0;
int freeze = 0;
int oldch = 0;
int dflag = 0;

int quit = 0;
#ifdef __FreeBSD__
kvm_t* kvmd = NULL;
#endif

typedef void (*device_init)(void);
typedef void (*device_cleanup)(void);

device_init dev_init;
device_cleanup dev_cleanup;

u_long prev_bytes_in = 0;
u_long prev_bytes_out = 0;
u_long traffic_in = 0;
u_long traffic_out = 0;
int cp_pct[CPUSTATES];
long cp_old[CPUSTATES];

#ifdef __FreeBSD__
struct nlist nl[] = {
#define N_IFNET 0
	{ .n_name = "_ifnet" },
	{ .n_name = NULL }
};
#endif

void terminate(int x)
{
	quit++;
}

void
usage()
{
	fprintf(stderr, "usage: avr-lcd [-h] [-f device] [-s]\n\n");
	fprintf(stderr, "  -h          this help\n");
	fprintf(stderr, "  -d          daemonize after startup\n");
	fprintf(stderr, "  -f device   serial device to use\n");
	fprintf(stderr, "              default: %s\n", device);
	fprintf(stderr, "  -s          simulation mode: operate on tty\n");
}

void
sio_init()
{
	struct termios opt;

	fd_out = open(device, O_RDWR | O_NOCTTY);
	if (fd_out < 0)
		err(1, "open");
	fd_in = fd_out;

	if (tcgetattr(fd_in, &opt) < 0)
		err(1, "tcgetattr");

	/* 4800 baud */
	cfsetispeed(&opt, B4800);
	cfsetospeed(&opt, B4800);

	/* 8 bits, no parity, 1 stop bit */
	opt.c_cflag &= ~(PARENB | CSTOPB | CSIZE);
	opt.c_cflag |= CS8;

	/* no hardware/software flow control */
	opt.c_cflag &= ~CRTSCTS;
	opt.c_iflag &= ~(IXON | IXOFF | IXANY);

	/* raw input */
	opt.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
	opt.c_oflag &= ~OPOST;

	if (tcsetattr(fd_in, TCSANOW, &opt) < 0)
		err(1, "tcsetattr");
}

void
tty_init()
{
	fd_in = STDIN_FILENO;
	fd_out = STDOUT_FILENO;
}

void
init()
{
#ifdef __FreeBSD__
	char errbuf[_POSIX2_LINE_MAX];

	kvmd = kvm_openfiles(NULL, NULL, NULL, O_RDONLY, errbuf);
	if (kvmd == NULL)
		errx(1, "kvm not available: %s", errbuf);
	if (kvm_nlist(kvmd, nl) < 0)
		errx(1, "kvm_nlist: %s", kvm_geterr(kvmd));
	if (nl[0].n_type == 0 || nl[0].n_value == 0)
		errx(1, "no namelist");
#endif
}

void
sio_cleanup()
{
	if (fd_in >= 0)
		close(fd_in);
}

void
cleanup()
{
#ifdef __FreeBSD__
	if (kvmd != NULL)
		kvm_close(kvmd);
#endif
}

void
dev_putch(unsigned char ch)
{
	write(fd_out, &ch, 1);
}

void
dev_puts(const char* s)
{
	write(fd_out, s, strlen(s));
}

void
handle_input()
{
	unsigned char ch;

	if (read(fd_in, &ch, sizeof(ch)) != sizeof(ch)) {
		warn("data ready but unable to read??");
		return;
	}

	/*
	 * This detection is not bulletproof - it is possible that the user
	 * did push on the same button multiple times in a row. However, this
	 * is quite hard to detect, so this has to do for now...
	 */
	if (oldch != ch) {
		switch(ch) {
			case '1': /* up button => previous screen */
			          screen = (screen == 0 ? NUM_SCREENS : screen) - 1;
			          break;
			case '3': /* up button => next screen */
			          screen = (screen + 1) % NUM_SCREENS;
			          break;
			case '4': /* center button => toggle screen freeze */
			          freeze = !freeze;
			          break;
		}
		oldch = ch;
	}
}

#ifdef __FreeBSD__
int
kread(u_long addr, void* buf, size_t size)
{
	if (kvm_read(kvmd, addr, buf, size) != (ssize_t)size) {
		warnx("kvm_read: %s", kvm_geterr(kvmd));
		return -1;
	}
	return 0;
}
#endif

/* Update network counters */
void
update_stats_network(u_long* cur_in, u_long* cur_out)
{
#ifdef __FreeBSD__
	struct ifnet ifnet;
	struct ifnethead ifnethead;
	u_long ifnetaddr;

	if (kread(nl[N_IFNET].n_value, (char*)&ifnethead, sizeof(ifnethead)) < 0)
		return;

	for (ifnetaddr = (u_long)TAILQ_FIRST(&ifnethead); 
	     ifnetaddr != 0;
	     ifnetaddr = (u_long)TAILQ_NEXT(&ifnet, if_link)) {
		if (kread(ifnetaddr, (char*)&ifnet, sizeof(ifnet)) < 0)
			continue;
		/* skip VLANs */
		if (!strncmp(ifnet.if_xname, "vlan", 4))
			continue;

		*cur_in += ifnet.if_ibytes; *cur_out += ifnet.if_obytes;
	}
#elif defined(__OpenBSD__)
	int mib[6] = { CTL_NET, AF_ROUTE, 0, 0, NET_RT_IFLIST, 0 };
	char *buf, *next, *lim;
	struct rt_msghdr* rtm;
	struct if_msghdr ifm;
	struct if_data* ifd;
	struct sockaddr* sa;
	struct sockaddr_dl* sdl;
	size_t len;
	char ifname[IFNAMSIZ];
	int i;

	if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0)
		return;
	if ((buf = malloc(len)) == NULL)
		return;
	if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
		free(buf);
		return;
	}

	lim = buf + len;
	for (next = buf; next < lim; next += rtm->rtm_msglen) {
		rtm = (struct rt_msghdr*)next;
		if (rtm->rtm_version != RTM_VERSION)
			continue;
		if (rtm->rtm_type != RTM_IFINFO)
			continue;

		bcopy(next, &ifm, sizeof ifm);
		ifd = &ifm.ifm_data;

		/*
		 * Find the interface name section. If it's not there,
		 * skip the section altogether.
		 */
		if (!(ifm.ifm_addrs & (1 << RTAX_IFP)))
			continue;
		sa = (struct sockaddr*)(next + rtm->rtm_hdrlen);
		for (i = 0; i < RTAX_IFP; i++)
			if (ifm.ifm_addrs & (1 << i))
				sa = (struct sockaddr*)((char*)(sa) +
				    roundup(sa->sa_len, sizeof(long)));

		sdl = (struct sockaddr_dl*)sa;
		if (sdl == NULL || sdl->sdl_family != AF_LINK)
			continue;

		bzero(ifname, sizeof ifname);
		memcpy(ifname, sdl->sdl_data, MIN(IFNAMSIZ - 1, sdl->sdl_nlen));

		/* skip VLANs */
		if (!strncmp(ifname, "vlan", 4))
			continue;

		*cur_in += ifd->ifi_ibytes; *cur_out += ifd->ifi_obytes;
	}
	free(buf);
#endif
}

/*
 * This function is expected to be invoked every second.
 */
void
update_stats()
{
	u_long cur_in, cur_out;
	long cp_time[CPUSTATES], cp_diff[CPUSTATES], total;
	size_t s;
	int i;
#ifdef __OpenBSD__
	int cp_time_mib[] = { CTL_KERN, KERN_CPTIME };
#endif

	cur_in = 0; cur_out = 0;
	update_stats_network(&cur_in, &cur_out);

	if (prev_bytes_in != 0 || prev_bytes_out != 0) {
		traffic_in  = cur_in - prev_bytes_in;
		traffic_out = cur_out - prev_bytes_out;
	}
	prev_bytes_in = cur_in;
	prev_bytes_out = cur_out;

	/* fetch PCPU times */
	s = sizeof(cp_time);
#ifdef __FreeBSD__
	if (sysctlbyname("kern.cp_time", &cp_time, &s, NULL, 0) < 0 ||
#elif defined(__OpenBSD__)
	if (sysctl(cp_time_mib, 2, cp_time, &s, NULL, 0) < 0 ||
#endif
	    s != sizeof(cp_time)) {
		warn("sysctlbyname");
		return;
	}

	/*
	 * The code below is inspired by top/utils.c - the overal difference is
	 * calculated, and this is used to calculate the difference (in percent)
	 * for each individual CP_xxx value.
	 */
	total = 0;
	for (i = 0; i < CPUSTATES; i++) {
		cp_diff[i] = (int)((unsigned long)cp_time[i] - (unsigned long)cp_old[i]);
 		total += cp_diff[i];
		cp_old[i] = cp_time[i];
	}
	if (total > 0) {
		for (i = 0; i < CPUSTATES; i++) {
			cp_pct[i] = (int)(((float)cp_diff[i] / (float)total) * 100.0f);
		}
	}

}

void
draw_screen()
{
	char t[256], u[256];
	char* ptr;
	struct utsname un;
	struct timespec ts;
	time_t uptime;
	int days, hours, mins, secs;
	double la[3];

	LCD_CLEAR();
	switch (screen) {
		case 0: /*
		         *  Hostname
		         *  OS
		         */
			if (uname(&un) == 0) {
				/*
				 * Remove everything after the first '.'
				 * in the node name.
				 */
				ptr = strchr(un.nodename, '.');
				if (ptr != NULL)
					*ptr = '\0';
		        	dev_puts(un.nodename); dev_putch(LCD_CR);
		        	dev_puts(un.sysname);  dev_putch(' ');
		        	dev_puts(un.release);
			} else {
		        	dev_puts("???");
			}
		        break;
		case 1: /*
		         *  Load
		         *  Uptime
		         */
		        if(getloadavg(la, sizeof(la) / sizeof(double)) < 0) {
							strcpy(t, "???");
		        } else {
							sprintf(t, "%.2f, %.2f, %.2f", la[0], la[1], la[2]);
		        }
		        dev_puts(t);

		        /*
						 * Fetch uptime - very inspired by FreeBSD's src/usr.bin/w.c
		         */
						if (clock_gettime(CLOCK_MONOTONIC, &ts) < 0) {
							warn("clock_gettime");
							strcpy(t, "???");
		        } else {
		        	uptime = ts.tv_sec;
		        	/* Evil hack to prevent rounding */
		        	if (uptime > 60)
		        		uptime += 30;
		        	/* isolate days (24 hours * 60 minutes * 60 seconds) */
		        	days = uptime / (24 * 60 * 60);
		        	uptime %= 24 * 60 * 60;
		        	/* isolate hours (60 minutes * 60 seconds) */
		        	hours = uptime / (60 * 60);
		        	uptime %= 60 * 60;
		        	/* isolate minutes (60 seconds) / seconds */
		        	mins = uptime / 60;
		        	secs = uptime % 60;
		        	strcpy(t, "up ");
		        	if (days > 0) {
		        		sprintf(u, "%d day%s, ", days, days > 1 ? "s" : "");
		        		strcat(t, u);
		        	}
		        	if (hours > 0 && mins > 0)
		        		sprintf(u, "%d:%02d", hours, mins);
		        	else if (hours > 0)
		        		sprintf(u, "%d hr%s", hours, hours > 1 ? "s" : "");
		        	else if (mins > 0)
		        		sprintf(u, "%d min%s", mins, mins > 1 ? "s" : "");
		        	else
		        		sprintf(u, "%d sec%s", secs, secs > 1 ? "s" : "");
		        	strcat(t, u);
		        	dev_puts(t);
		        }
		        return;
		case 2: /* user x%, system x%
		         * int  x%, idle x% 
		         */
		        sprintf(t, "us %3u%% sy %3u%%",
		        	cp_pct[CP_USER], cp_pct[CP_SYS]);
		        dev_puts(t); dev_putch(LCD_CR);
		        sprintf(t, "in %3u%% id %3u%%",
		        	cp_pct[CP_INTR], cp_pct[CP_IDLE]);
		        dev_puts(t);
		        return;
		case 3: /* In : xx kb/sec
		         * Out: xx kb/sec
		         */
		        strcpy(t, "in : ");
		        if (traffic_in > 1024 * 1024)
		        	sprintf(u, "%.2f MB/s", (double)traffic_in / (1024 * 1024));
		        else
		        	sprintf(u, "%.2f KB/s", (double)traffic_in / 1024);
		        strcat(t, u);
		        dev_puts(t); dev_putch(LCD_CR);
		        strcpy(t, "out: ");
		        if (traffic_out > 1024 * 1024)
		        	sprintf(u, "%.2f MB/s", (double)traffic_out / (1024 * 1024));
		        else
		        	sprintf(u, "%.2f KB/s", (double)traffic_out / 1024);
		        strcat(t, u);
		        dev_puts(t);
		        return;
	}
}

int
main(int argc, char** argv)
{
	int ch, i;
	fd_set fds;
	struct timeval tv;

	dev_init = sio_init;
	dev_cleanup = sio_cleanup;

	while ((ch = getopt(argc, argv, "df:hs")) != -1) {
		switch (ch) {
			case 'f': device = optarg;
			          break;
			case 'd': dflag++;
			          break;
			case 's': dev_init = tty_init;
			          dev_cleanup = NULL;
			          break;
	     default:
			case 'h': usage();
			          return EXIT_SUCCESS;
		}
	}

	init();
	dev_init();

	signal(SIGINT,  terminate);
	signal(SIGTERM, terminate);

	if (dflag)
		if (daemon(0,0) < 0)
			err(1, "daemon");

	/* reset timeout to ensure it'll be filled out again */
	memset(&tv, 0, sizeof(tv));
	draw_screen();
	while(!quit) {
		/*
		 * Try to obtain input. We wait for at most one second; if
		 * this second has elapsed, 
		 */
		FD_ZERO(&fds);
		FD_SET(fd_in,&fds);
		if (tv.tv_sec == 0 && tv.tv_usec == 0) {
			/*
			 * If the timeout has fired, set it again. This is needed since the
			 * select(2) may be interrupted if data arrives, and we need to wait the
			 * remainder of the timeout and not the full interval before updating.
			 */
			tv.tv_sec = 1;
			tv.tv_usec = 0;
		}
		i = select(fd_in + 1, &fds, (fd_set*)NULL, (fd_set*)NULL, &tv);
		if (errno == EINTR)
			/*
			 * EINTR will happen if a signal happens in between - this is not
			 * fatal so we should not exit here
			 */
			break;
		else if (i < 0)
			err(1, "select");

		if(FD_ISSET(fd_in, &fds)) {
			/* input has arrived */
			handle_input();
		} else {
			/* a timeout has occured - cycle and update screen */
			if (!freeze)
				screen = (screen + 1) % NUM_SCREENS;
			draw_screen();	
			update_stats();
			/* reset old char */
			oldch = 0;
		}
	}

	cleanup();
	if (dev_cleanup != NULL)
		dev_cleanup();
	return EXIT_SUCCESS;
}

/* vim:set ts=2 sw=2: */

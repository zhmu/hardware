#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define	BAUD		4800
#define CALC_UBRR (((unsigned long)F_CPU / (16L * (unsigned long)BAUD)) - 1)
#define SIO_HASCH	(UCSRA & (1 << RXC))

#define DATA_PORT	PORTB
#define DATA_PIN	PINB
#define CTRL_PORT	PORTD
#define CTRL_PIN	PIND

#define RS		(1<<PD4)
#define	E		(1<<PD5)
#define RW		(1<<PD6)
#define MASK		(RS|E|RW)

#define STATUS_NORMAL	0
#define STATUS_ESC	1
#define STATUS_ACTIVE	2

#define LCD_COLS	16
#define LCD_LINES	2

#define MAX_ANSI_LEN	8
unsigned char ansibuf[MAX_ANSI_LEN];
unsigned char ansipos = 0;
unsigned char status = STATUS_NORMAL;

#define MAX_INPUT_LEN	((LCD_COLS * LCD_LINES) + 1)
unsigned char inputbuf[MAX_INPUT_LEN];
unsigned char input_write_pos = 0;
unsigned char input_read_pos = 0;

char lcd_x = 0;
char lcd_y = 0;

void
lcd_write4(int rs, unsigned char c)
{
	DATA_PORT = (DATA_PORT & 0xf0) | c;
	CTRL_PORT = (CTRL_PORT & ~MASK) | E;
	if (rs) CTRL_PORT |= RS;
	_delay_ms(1);
	CTRL_PORT &= ~E;
	_delay_ms(1);
}

void
lcd_write8(int rs,unsigned char c)
{
	lcd_write4(rs,c >> 4);
	lcd_write4(rs,c & 0xf);
}

void
initlcd()
{
	_delay_ms(15);


	/* function set */
	lcd_write4(0,2);
	lcd_write4(0,2);
	lcd_write4(0,4|8);	/* N=1, F=0 */
	//lcd_write4(0x06);	/* N=1, F=1 */
	_delay_ms(2);

	/* display on/off control */
	lcd_write4(0,0x00);
	lcd_write4(0,0x0c);	/* D=1, C=0, B=0 */

	/* display clear */
	lcd_write4(0,0x00);
	lcd_write4(0,0x01);

	/* entry mode set */
	lcd_write4(0,0x00);
	lcd_write4(0,0x06);	/* I/D=1, SH=0 */
}

inline void
lcd_putc(unsigned char c)
{
	lcd_write8(1,c);
	lcd_x++;
	if (lcd_x >= LCD_COLS) {
		/* next line */
		lcd_x = 0;
		lcd_y = (lcd_y + 1) % LCD_LINES;
		/* set dram offset */
		lcd_write8(0,0x80 | (0x40 * lcd_y));
	}
}

void
lcd_puts(char* s)
{
	while(*s)
		lcd_putc(*s++);	
}

void
initsio()
{
	UBRRH = CALC_UBRR / 256;
	UBRRL = CALC_UBRR % 256;
	UCSRB = (1 << RXEN) | (1 << TXEN) | (1 << RXCIE);
	/* 8bit, no parity, 1 stop bit */
	UCSRC = (1 << USBS) | (1 << UCSZ1) | (1 << UCSZ0);
}

inline void
sio_putc(unsigned char c)
{
	while (!(UCSRA & (1 << UDRE)));
	UDR = c;
}

void
sio_puts(char* s)
{
	while(*s)
		sio_putc(*s++);
}

void
lcd_backspace()
{
	lcd_write8(0,0x10);
	lcd_x--;
	if (lcd_x < 0) {
		if (lcd_y > 0)
			lcd_y--;
		else 
			lcd_y = LCD_LINES - 1;
		lcd_x = LCD_COLS - 1;
		lcd_write8(0,0x80 | (0x40 * lcd_y + lcd_x));
		lcd_write8(1,' ');
		lcd_write8(0,0x80 | (0x40 * lcd_y + lcd_x));
	} else {
		lcd_write8(1,' ');
		lcd_write8(0,0x10);
	}
}

void
handle_char(unsigned char c)
{
	unsigned char i;

	if (status == STATUS_NORMAL) {
		switch(c) {
			case 0x08: /* backspace */
			           lcd_backspace();
			           return;
			case 0x0d: /* return */
			           while (lcd_x != 0)
					lcd_putc(' ');
			           return;
			case 0x15: /* ctrl-u */
			           while (lcd_x > 0)
					lcd_backspace();
			           return;
			case 0x1b: /* escape */
			           status++;
			           return;
		}
		lcd_putc(c);
		return;
	}
	if (status == STATUS_ESC) {
		if (c != '[') {
			status = STATUS_NORMAL;
			lcd_putc(0x1b);
			lcd_putc(c);
			return;
		}
		status++;
		return;
	}

	/* fully fledged ANSI mode yeah! */
	if (c >= 64 && c <= 126) {
		/* end of the line */
		switch (c) {
			case 'h': /* show cursor */
			          lcd_write8(0,0x0e);
			          break;
			case 'J': /* clear screen */
			          lcd_x = 0; lcd_y = 0;
			          lcd_write8(0,0x01);
			          lcd_write8(0,0x02);
			          break;
			case 'l': /* hide cursor */
			          lcd_write8(0,0x0c);
			          break;
		}

		/* the code below ends ansi mode */
	} else {
		if (ansipos < MAX_ANSI_LEN) {
			ansibuf[ansipos++] = c;
			return;
		} else {
			/* too much data! flush it */
			for (i = 0; i < ansipos; i++) {
				lcd_putc(ansibuf[i]);
			}
			lcd_putc(c);
		}
	}

	/* get out of ansi mode */
	ansipos = 0;
	status = STATUS_NORMAL;
}

ISR(USART_RX_vect)
{
	unsigned char c;

	c = UDR;
	inputbuf[input_write_pos] = c;
 	input_write_pos = (input_write_pos + 1) % MAX_INPUT_LEN;
}

int
main()
{
	unsigned char a, d, i;

	DDRA = 0;
	DDRB = (1 << PB0) | (1 << PB1) | (1 << PB2) | (1 << PB3);
	DDRD = (1 << PD4) | (1 << PD5);
	PORTA = 0x03;
	PORTB = 0;
	PORTD = 0x0c;

	initsio();
	initlcd();
	lcd_puts("Booting...");

	sei();
	a = PINA; d = PIND;
	while(1) {
		while (input_read_pos != input_write_pos) {
			handle_char(inputbuf[input_read_pos]);
 			input_read_pos = (input_read_pos + 1) % MAX_INPUT_LEN;
		}

		i = PINA;
		if (i != a) {
			if (!(a & 1) && (i & 1)) {
				/* detected a pulse */
				sio_putc('1');
			}
			if (!(a & 2) && (i & 2)) {
				/* detected a pulse */
				sio_putc('2');
			}
			a = i;
		}
		i = PIND;
		if (i != d) {
			if (!(d & 4) && (i & 4)) {
				/* detected a pulse */
				sio_putc('3');
			}
			if (!(d & 8) && (i & 8)) {
				/* detected a pulse */
				sio_putc('4');
			}
			d = i;
		}
	}

	return 0;
}

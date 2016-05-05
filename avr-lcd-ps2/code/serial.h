#include <inttypes.h>

#ifndef __SERIAL_H__
#define __SERIAL_H__

#define PARITY_NONE	0
#define PARITY_EVEN	1
#define PARITY_ODD	2

#define STOP_1		0
#define STOP_2		1

struct BAUD_TO_UBRR {
	const char* baud;
	uint16_t ubrr;
};

extern struct BAUD_TO_UBRR baud_to_ubrr[];
extern int serial_curbaud_index;
extern int serial_parity;
extern int serial_stop;

void serial_init();
void serial_putc(unsigned char c);
unsigned char serial_getc();
void serial_puts(const char* s);
void serial_puthex(unsigned char c);

#endif /* __SERIAL_H__ */

#ifndef __SIO_H_
#define __SIO_H_

#include <inttypes.h>
#include <avr/io.h>

void sio_init();
void sio_putc(unsigned char c);
unsigned char sio_getc();
void sio_puts(char* s);

#ifdef DEBUG_TOUCH
void
sio_puthex(unsigned char c);
#endif

#endif

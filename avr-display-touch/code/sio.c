#include "sio.h"

#ifdef DEBUG_TOUCH
char hexmap[16] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                    'a', 'b', 'c', 'd', 'e', 'f' };
#endif

void
sio_init()
{
#if 0
        UBRRH = CALC_UBRR / 256;
        UBRRL = CALC_UBRR % 256;
#else
	// 57600 baud
	UBRRH = 0;
	UBRRL = 12;
#endif
        UCSRB = (1 << RXEN) | (1 << TXEN) | (1 << RXCIE);
        /* 8bit, no parity, 1 stop bit */
        UCSRC = (1 << URSEL) | (3 << UCSZ0);
}

void
sio_putc(unsigned char c)
{
        UDR = c;
        while (!(UCSRA & (1 << UDRE)));
}

unsigned char
sio_getc()
{
	while (!(UCSRA & (1 << RXC)));
	return UDR;
}


void
sio_puts(char* s)
{
        while(*s)
                sio_putc(*s++);
}

#ifdef DEBUG_TOUCH
void
sio_puthex(unsigned char c)
{
        sio_putc(hexmap[(c >> 4) & 0xf]);
        sio_putc(hexmap[c & 0xf]);
}
#endif

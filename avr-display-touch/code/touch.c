#include "touch.h"
#include "sio.h"
#include "spi.h"

void
touch_init()
{
	PORTB |= (1<<PB1); // internal pullup
	/* Set PB1 to input for BSF */
	DDRB &= ~(1<<PB1);
}

uint16_t
touch_read(unsigned char axis)
{
			uint16_t v = 0;
			spi_ss_select();
			// ready
			spi_send(axis); // request axis
			while ((PINB & 0x02) == 1); // busy check 
			// ready
			v = spi_getval();
			spi_ss_deselect();
			return v;
}

void
touch_send(point coordinate)
{
#ifndef DEBUG_TOUCH
	sio_putc(CMD_TOUCH_COORDS);
	sio_putc(coordinate.x & 0xff); //lowbyte
	sio_putc(coordinate.x >>8); // highbyte
	sio_putc(coordinate.y & 0xff); //lowbyte
	sio_putc(coordinate.y >>8); // highbyte
#else
	sio_puts("y=");
	sio_puthex(coordinate.y >> 8);
	sio_puthex(coordinate.y & 0xff);
	sio_puts("x=");
	sio_puthex(coordinate.x >> 8);
	sio_puthex(coordinate.x & 0xff);
	sio_puts("\r\n");
#endif
}

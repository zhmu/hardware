#include <avr/io.h>
#include <string.h>
#include <inttypes.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdlib.h>
#include "sio.h"
#include "spi.h"
#include "touch.h"
#include "display.h"
#include "extint.h"

/***** GLOBALS *****/
uint8_t	write_curic = 0;
uint8_t	write_left = 0;

uint8_t touched = 0; // See EXT INT2 ISR
uint16_t settle = 0; // settle touchscreen counter
/***** END GLOBALS ****/

/*** ISR ROUTINES ****/
ISR(INT2_vect)
{
	if (touched == 0) 
		touched = 1;
}

/** END ISR ROUTINES **/

/******** Main code ************/
void 
init()
{
	// Databus pins
	DATADDR = 0xFF;
	// Reset of the control pins
	CMDDDR = (1<<RST) | (1<<IC1) | (1<<IC2) | (1<<RS) | (1<<RW) | (1<<E);
}

int main()
{	
	unsigned char a;
	point c;

	// Initialize AVR
	init();
	// Initialize serial port
	sio_init();
	// Initialize SPI-interface as master
	spi_init();
	// Initialize external interrupts
	extint_init();
	// Initialize touchscreen
	touch_init();
	// Initialize LCD
	lcd_init();
	// Turn on display
	lcd_display(ON);
	// Clear display
	lcd_clear(IC1);
	lcd_clear(IC2);

	lcd_command(SET_STARTLINE, 0, IC1);
	lcd_command(SET_STARTLINE, 0, IC2);

	spi_send(0x91); // enable PENIRQ, differential mode

	/* go! */
	sei();

uint16_t i = 0; // settle touchscreen counter
	while(1) {
		/* Handle display input */
		while (sio_getc(&a)) {
			if (write_left == 0) {
				if (a != CMD_SYNC) {
					write_curic = (a & 0x40) ? IC2 : IC1;
					lcd_command(SET_PAGE, a & 0x07, write_curic);
					lcd_command(SET_ADDRESS, 0, write_curic);
					write_left = 64;
				} else {
					sio_putc(CMD_SYNCED);
				}
			} else {
				lcd_write(a, write_curic);
				if (--write_left == 0)
					sio_putc(CMD_DRAWN);
			}
		}
/* Handle touchscreen input */
		if ( (touched == 1) && (settle == 0) )	{
			/* Read the coordinate */
			c.y = touch_read(Y_AXIS);
			c.x = touch_read(X_AXIS);
			/* Sanity check */
			if ( (c.y == 0) || (c.x == 0) )	{
				/* ignore zero values => false reading */
				touched = 0;
			} else {	
				/* Transmit to musixbox */
				touch_send(c);
				/* Reset in progress flag */
				touched = 0;
				/* Start the `settle touchscreen` delay */
				settle = 1;
			}
		}
		if ( (settle != 0) && (settle < 20000) ) 
			settle++;
		else if (i < 20000) {
			i++;
			settle = 0;
		}
		else {
			settle = 0;
			i = 0;
		}
	} // (1)elihw

	return 0;
}

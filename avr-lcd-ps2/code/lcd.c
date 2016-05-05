#include <avr/io.h>
#include <util/delay.h>
#include <inttypes.h>
#include "config.h"
#include "lcd.h"

unsigned char lcd0_line_addr[4] = { 0x00, 0x40, 0x14, 0x54 };
unsigned char lcd1_line_addr[4] = { 0x00, 0x40, 0x14, 0x54 };

void
lcd_write8(int n, int rs, unsigned char c)
{
	
	/*
	 * PORTC governs bits 0-5, PORTD governs bits 6-7
	 * XXX Note that we implicitely clear RS in PORTD here
	 */
	PORTC = (PORTC & 0xc0) | (c & 0x3f); PORTD = (PORTD & 0x1f) | (c & 0xc0);
	if (n == 0)
		LCD_E_PORT = (LCD_E_PORT & ~(1 << LCD_E1)) | (1 << LCD_E0);
	else
		LCD_E_PORT = (LCD_E_PORT & ~(1 << LCD_E0)) | (1 << LCD_E1);
	if (rs)
		LCD_RS_PORT |=  (1 << LCD_RS);
	_delay_ms(1);
	LCD_E_PORT &= ~((1 << LCD_E0) | (1 << LCD_E1));
	_delay_ms(1);
}

void
lcd_init()
{
	/* RS and E[01], DBn (0<=n<=7) are output */
	LCD_RS_DIR   |= (1 << LCD_RS) | (1 << PD6) | (1 << PD7);
	LCD_E_DIR    |= (1 << LCD_E0) | (1 << LCD_E1);
	DDRC          = (1 << PC0) | (1 << PC1) | (1 << PC2) | (1 << PC3) |
	                (1 << PC4) | (1 << PC5);

	/* Take RS and E low */
	LCD_RS_PORT &= ~(1 << LCD_RS);
	LCD_E_PORT  &= ~((1 << LCD_E0) | (1 << LCD_E1));

	/* Initializing commands, per row a command for LCD0 and LCD1 */
	uint8_t initcmd[] = {
		0x38, 0x38,		/* function setup: 8 bit, 2 lines  */
		0x38, 0x38,		/* function setup: 8 bit, 2 lines */
		0x38, 0x38,		/* function setup: 8 bit, 2 lines */
		0x08, 0x08,		/* display off */
		0x01, 0x01,		/* display clear */
		0x06, 0x06,		/* entry mode set */
		0x02, 0x02,		/* return home */
		0x0c, 0x0c		/* display on */
	};

	uint8_t i;
	for (i = 0; i < sizeof(initcmd); i += 2) {
		lcd_write8(0, 0, initcmd[i]);
		lcd_write8(1, 0, initcmd[i+1]); 
		_delay_ms(2);
	}
}

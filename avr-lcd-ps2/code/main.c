#include <avr/io.h>
#include <string.h>
#include <inttypes.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include "lcd.h"
#include "menu.h"
#include "keyboard.h"
#include "serial.h"
#include "screen.h"

uint8_t  curbit = 0;
uint8_t  gotkey = 0;
uint16_t val = 0;

char* parities[] = { "None", "Even", "Odd", NULL };
char* stops[] = { "1", "2", NULL };

struct MENU menu_settings[] = {
	{ "Speed",   MENU_TYPE_BAUD, &serial_curbaud_index, baud_to_ubrr },
	{ "Parity",  MENU_TYPE_LIST, &serial_parity, parities },
	{ "Stop",    MENU_TYPE_LIST, &serial_stop, stops },
	{ NULL, 0, NULL }
};

int
main()
{
	uint16_t ch;

	serial_init();
	kbd_init();
	lcd_init();

	sei();

	while (1) {
		ch = serial_getc();
		if (ch != 0)
			screen_putc(ch);
		ch = kbd_getch();
		if ((ch & 0xff) != 0) {
			if ((ch & 0xff) == KBD_CHAR_CONFIG &&
			    ((ch & KBD_FLAG_CTRL) || (ch & KBD_FLAG_ALT))) {
				menu_do(menu_settings);
				serial_init();
				screen_clear();
			} else
				serial_putc(ch & 0xff);
		}
	}

	return 0;
}

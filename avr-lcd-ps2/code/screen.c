#include "config.h"
#include "lcd.h"
#include "screen.h"

unsigned char screen_x = 0;
unsigned char screen_y = 0;

#define INCREMENT_X screen_x = (screen_x + 1) % SCREEN_WIDTH
#define INCREMENT_Y screen_y = (screen_y + 1) % SCREEN_HEIGHT

void
screen_putc(unsigned char c)
{
	if (c == 8 /* backspace */) {
		if (screen_x > 0)
			screen_x--;
		else {
			if (screen_y > 0) {
				screen_y--;
				screen_x = SCREEN_WIDTH - 1;
			}
		}
		screen_gotoxy(screen_x, screen_y);
		lcd_putch((screen_x > LCD_0_WIDTH) ? 1 : 0, ' ');
		goto g;
	} else if (c == 0x0d /* newline */) {
		screen_x = 0;
		/* note: we rely on the if (screen_x == 0) to increment Y */
	} else {
		lcd_putch((screen_x > LCD_0_WIDTH) ? 1 : 0, c);
		INCREMENT_X;
	}
	if (screen_x == 0)
		INCREMENT_Y;
g:
	screen_gotoxy(screen_x, screen_y);
}

void
screen_puts(const char* s)
{
	while (*s)
		screen_putc(*s++);
}

void
screen_gotoxy(unsigned char x, unsigned char y)
{
#if LCD_ALIGNMENT == HORIZONTAL
	if (x >= LCD_0_WIDTH)
		lcd_goto(1, lcd1_line_addr[y] + (x - LCD_0_WIDTH));
	else
		lcd_goto(0, lcd0_line_addr[y] + x);
#endif
	screen_x = x; screen_y = y;
}

void
screen_clear()
{
	lcd_write8(0, 0, 1); lcd_write8(1, 0, 1);
	screen_gotoxy(0, 0);
}

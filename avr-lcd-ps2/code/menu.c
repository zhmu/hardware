#include <string.h>
#include "screen.h"
#include "menu.h"
#include "serial.h"
#include "keyboard.h"

int menu_curentry = 0;

static void
menu_putvalue(struct MENU* menu)
{	
	int v = *menu->value;
	if (menu->type == MENU_TYPE_LIST) {
		char** s = (char**)menu->data;
		while (v--) s++;
		screen_puts(*s);
	} else if (menu->type == MENU_TYPE_BAUD) {
		struct BAUD_TO_UBRR* baud = (struct BAUD_TO_UBRR*)menu->data;
		while (v--) baud++;
		screen_puts(baud->baud);
		screen_puts("00");
	} else {
		screen_puts("???");
	}
}

static void
menu_draw(struct MENU* menu)
{
	int i;
	for (i = 0; menu->entry != NULL; menu++, i++) {
		screen_puts((i == menu_curentry) ? "> " : "  ");
		screen_puts(menu->entry);
		screen_gotoxy(10, screen_y);
		menu_putvalue(menu);
		screen_putc('\r');
	}
}

static int
menu_getnumentries(struct MENU* menu)
{
	int i;
	for (i = 0; menu->entry != NULL; menu++, i++);
	return i;
}

static int
menu_getnumvalues(struct MENU* menu)
{
	int i = 0;
	if (menu->type == MENU_TYPE_LIST) {
		char** s = (char**)menu->data;
		while (*s != NULL) { s++; i++; }
	} else if (menu->type == MENU_TYPE_BAUD) {
		struct BAUD_TO_UBRR* baud = (struct BAUD_TO_UBRR*)menu->data;
		while (baud->baud != 0) { i++; baud++; }
	}
	return i;
}

void
menu_do(struct MENU* menu)
{
	int numentries = menu_getnumentries(menu);
	struct MENU* m;

	screen_clear();
	menu_draw(menu);
	while(1) {
		uint8_t c = 0;
		while (c == 0)
			c = kbd_getch();
		switch (c) {
			case KBD_CHAR_DOWN:
			case KBD_CHAR_UP:
				screen_gotoxy(0, menu_curentry);
				screen_putc(' ');
				if (c == KBD_CHAR_UP) {
					if (menu_curentry == 0)
						menu_curentry = numentries;
					menu_curentry--;
				} else
					menu_curentry = (menu_curentry + 1) % numentries;
				screen_gotoxy(0, menu_curentry);
				screen_putc('>');
				break;
			case KBD_CHAR_SEL1:
			case KBD_CHAR_SEL2:
				m = &menu[menu_curentry];
				(*(m->value))++;
				if (*(m->value) >= menu_getnumvalues(m))
					*(m->value) = 0;
				screen_gotoxy(10, menu_curentry);
				menu_putvalue(m);
				while (screen_x < SCREEN_WIDTH - 1)
					screen_putc(' ');
				break;
			case KBD_CHAR_LEAVE:
				return;
		}
	}
}

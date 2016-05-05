#include "config.h"

#ifndef __SCREEN_H__
#define __SCREEN_H__

#if LCD_ALIGNMENT == HORIZONTAL
 #define SCREEN_WIDTH  (LCD_0_WIDTH + LCD_1_WIDTH)
 #define SCREEN_HEIGHT (LCD_0_HEIGHT)
#else
 #error FIXME
#endif

void screen_putc(unsigned char c);
void screen_puts(const char* s);
void screen_gotoxy(unsigned char x, unsigned char y);
void screen_clear();

extern unsigned char screen_x;
extern unsigned char screen_y;

#endif /* __SCREEN_H__ */

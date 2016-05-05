#include <inttypes.h>

#ifndef __KEYBOARD_H__
#define __KEYBOARD_H__

/* Shorthand macro's to control keyboard clock */
#define KBD_CLOCK_HI	do { KBD_PORT_OUT |=  (1 << KBD_CLOCK); }  while (0);
#define KBD_CLOCK_LO	do { KBD_PORT_OUT &= ~(1 << KBD_CLOCK); }  while (0);

/* Modifiers for keys */
#define FLAG_SHIFT	0x01
#define FLAG_CTRL	0x02
#define FLAG_ALT	0x04

/* Scancodes */
#define SC_ALT		0x11
#define SC_LSHIFT	0x12
#define SC_CTRL		0x14
#define SC_RSHIFT	0x59
#define SC_EXT		0xE0
#define SC_RELEASE	0xF0

/* Current keyboard state */
#define STATE_NORMAL	0x00
#define STATE_RELEASE	0x01
#define STATE_EXT	0x02

#define KEYBUF_SIZE	32

/* Flags passed from getch */
#define KBD_FLAG_SHIFT	0x8000
#define KBD_FLAG_CTRL	0x4000
#define KBD_FLAG_ALT	0x2000

#define KBD_CHAR_UP	'8'	/* up arrow / keypad down*/
#define KBD_CHAR_DOWN	'2'	/* down arrow / keypad up */
#define KBD_CHAR_SEL1	' '	/* space */
#define KBD_CHAR_SEL2	0x0d	/* enter */
#define KBD_CHAR_LEAVE	0x1b	/* escape */
#define KBD_CHAR_CONFIG	'`'	/* tilde */

void		kbd_init();
uint16_t	kbd_getch();

extern uint16_t keybuf[KEYBUF_SIZE];
extern uint8_t  keybuf_writepos;
extern uint8_t  keybuf_readpos;

#endif /* __KEYBOARD_H__ */

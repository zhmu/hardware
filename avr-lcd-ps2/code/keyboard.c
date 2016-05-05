#include <avr/interrupt.h>
#include <inttypes.h>
#include "config.h"
#include "keyboard.h"

uint8_t  kbd_flags = 0;
uint8_t  kbd_curbit = 0;
uint16_t kbd_curval = 0;

uint16_t keybuf[KEYBUF_SIZE];
uint8_t  keybuf_writepos = 0;
uint8_t  keybuf_readpos  = 0;
uint8_t  state = STATE_NORMAL;

/* This table is a simple scancode -> ASCII translation map */
uint8_t sc2asc[0x80] = {
	0, 		/* 00 */
	0,   
	0,   
	0,   
	0,   
	0,   
	0,   
	0,   
	0,   		/* 08 */
	0,   
	0,   
	0,   
	0,   
	9,   
	'`', 
	0,   
	0,   		/* 10 */
	0,   
	0,   
	0,   
	0,   
	'q', 
	'1', 
	0,   
	0,   		/* 18 */
	0,   
	'a', 
	's', 
	'a', 
	'w', 
	'2', 
	0,   
	0,   		/* 20 */
	'c', 
	'x', 
	'd', 
	'e', 
	'4', 
	'3', 
	0,   
	0,   		/* 28 */
	' ',   
	'v', 
	'f', 
	't', 
	'r', 
	'5', 
	0,   
	0,   		/* 30 */
	'n', 
	'b', 
	'h', 
	'g', 
	'y', 
	'6', 
	0,   
	0,   		/* 38 */
	0,   
	'm', 
	'j', 
	'u', 
	'7', 
	'8', 
	0,   
	0,   		/* 40 */
	',', 
	'k', 
	'i', 
	'o', 
	'0', 
	'9', 
	0,   
	0,   		/* 48 */
	'.', 
	'/', 
	'l', 
	';', 
	'p',
	'-', 
	0,   
	0,   		/* 50 */
	0,   
	'\'',
	0,   
	'[', 
	'=', 
	0,   
	0,   
	0,   		/* 58 */
	0,   
	13,  
	'[', 
	0,   
	'\\',
	0,   
	0,   
	0,   		/* 60 */
	0,   
	0,   
	0,   
	0,   
	0,   
	8,   
	0,   
	0,   		/* 68 */
	'1', 
	0,   
	0,   
	'7', 
	'4', 
	0,   
	0,   
	'0', 		/* 70 */
	'.', 
	'2', 
	'5', 
	'6', 
	'8', 
	27,  
	0,   
	0,   		/* 78 */
	'+', 
	'3', 
	'-', 
	'*', 
	'9', 
	0,   
	0,   
};

static uint8_t
key2upcase(uint8_t key)
{
	if (key >= 'a' && key <= 'z')
		return key & ~0x20;
	switch (key) {
		 case '`': return '~';
		 case '1': return '!';
		 case '2': return '@';
		 case '3': return '#';
		 case '4': return '$';
		 case '5': return '%';
		 case '6': return '^';
		 case '7': return '&';
		 case '8': return '*';
		 case '9': return '(';
		 case '0': return ')';
		 case '-': return '_';
		 case '=': return '+';
		 case '[': return '{';
		 case ']': return '}';
		case '\\': return '|';
		 case ';': return ':';
		case '\'': return '"';
		 case ',': return '<';
		 case '.': return '>';
		 case '/': return '?';
	}
	return key;
}

static uint8_t
kbd_handle_sc(uint8_t key)
{
	if (state & STATE_RELEASE) {
		if (key == SC_LSHIFT || key == SC_RSHIFT)
			kbd_flags &= ~FLAG_SHIFT; 
		if (key == SC_ALT)
			kbd_flags &= ~FLAG_ALT; 
		if (key == SC_CTRL)
			kbd_flags &= ~FLAG_CTRL; 
		state &= ~STATE_RELEASE;
		return 0;
	}

	if (key == SC_RELEASE) {
		state |= STATE_RELEASE;
		return 0;
	}
	if (key == SC_EXT) {
		state |= STATE_EXT;
		return 0;
	}

	if (key == SC_LSHIFT || key == SC_RSHIFT)
		kbd_flags |= FLAG_SHIFT; 
	if (key == SC_ALT)
		kbd_flags |= FLAG_ALT; 
	if (key == SC_CTRL)
		kbd_flags |= FLAG_CTRL; 
	key = sc2asc[key & 0x7f];
	if (kbd_flags & FLAG_SHIFT)
		key = key2upcase(key);
	return key;
}

ISR(INT0_vect)
{
	kbd_curval >>= 1;
	if (KBD_PORT_IN & (1 << KBD_DATA))
		kbd_curval |= 0x800;
	if (++kbd_curbit == 11) {
		keybuf[keybuf_writepos] = kbd_curval;
		keybuf_writepos = (keybuf_writepos + 1) % KEYBUF_SIZE;
		kbd_curval = 0; kbd_curbit = 0;

#if 0
		/* Drive data line low while processing */
		PORTD &= ~(1 << KBD_CLOCK);
#endif
		/* Drive data line HI - we want more data */
		KBD_CLOCK_HI;
	}
}

void
kbd_init()
{
	/* DATA and CLOCK are inputs, but tri-state them hi  */
	KBD_PORT_DIR &= ~((1 << KBD_DATA) | (1 << KBD_CLOCK));
	KBD_PORT_OUT = (1 << KBD_DATA) | (1 << KBD_CLOCK);

	/* trigger on falling edge */
	MCUCR = (1 << ISC01) | (1 << ISC00);
	GIMSK = (1 << INT0);
}

uint16_t
kbd_getch()
{
	if (keybuf_readpos == keybuf_writepos)
		return 0;
	uint16_t curkey = keybuf[keybuf_readpos];
	keybuf_readpos = (keybuf_readpos + 1) % KEYBUF_SIZE;
	uint16_t flags = 0;
	if (kbd_flags & FLAG_SHIFT)
		flags |= KBD_FLAG_SHIFT;
	if (kbd_flags & FLAG_CTRL)
		flags |= KBD_FLAG_CTRL;
	if (kbd_flags & FLAG_ALT)
		flags |= KBD_FLAG_ALT;
	return ((uint16_t)kbd_handle_sc((curkey >> 2) & 0xff)) | flags;
}

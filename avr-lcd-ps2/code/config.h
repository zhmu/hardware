/**** Keyboard ***/
#define KBD_CLOCK		PD2
#define KBD_DATA		PD3

#define KBD_PORT_OUT		PORTD
#define KBD_PORT_IN		PIND
#define KBD_PORT_DIR		DDRD

/*** LCD ***/
#define LCD_RS_PORT	PORTD
#define LCD_RS_DIR	DDRD
#define LCD_RS		PD5

#define LCD_E_PORT	PORTB
#define LCD_E_DIR	DDRB
#define LCD_E0		PB0
#define LCD_E1		PB1

/*** LCD dimensions - 0x0 means the LCD is not present ***/
#define LCD_0_HEIGHT	4
#define LCD_0_WIDTH	20
#define LCD_1_HEIGHT	0
#define LCD_1_WIDTH	0

/* Multiplication value needed to get to the next row */
#define LCD_0_Y_MULTIPLIER	0x20
#define LCD_1_Y_MULTIPLIER	0x20

#define LCD_ALIGNMENT		HORIZONTAL

/* Size of the serial buffers */
#define SERIAL_BUFSIZE_RX	64
#define SERIAL_BUFSIZE_TX	32

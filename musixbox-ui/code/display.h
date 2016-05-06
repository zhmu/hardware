#ifndef __DISPLAY_H_
#define __DISPLAY_H_

#include <avr/io.h>
#include <util/delay.h>

// Data pins display, ICN means no IC selected
#define ICN 0
#define IC1	PD2	// Chip select IC2, active LOW
#define IC2	PD3	// Chip select IC1, ative lOW
#define E	PD4   // Send command
#define RS	PD5   // Register select [D,I]
#define RW	PD6   // Read or write bit
#define RST	PD7	// Reset

// Databus definitions
#define DATABUS PORTC
#define CMDBUS	PORTD
#define DATADDR DDRC
#define CMDDDR	DDRD

// Command types and values
#define	HIGH		1
#define	LOW		0
#define ON		HIGH
#define OFF		LOW
#define SET_DISPLAY	62	
#define SET_ADDRESS 	64
#define SET_PAGE	184
#define SET_STARTLINE	192

// Status readouts
#define BUSY 		128
#define RESET		16
#define DISPLAY		32		

void lcd_setic(unsigned char ic);
void lcd_set_commandbus(unsigned char rs_on, unsigned char rw_on);
unsigned char lcd_status();
void lcd_init();
void lcd_exec(unsigned char ic);
void lcd_command(unsigned char cmd, unsigned char value, unsigned char ic);
void lcd_write(unsigned char data, unsigned char ic);
unsigned char lcd_read(unsigned char ic);
void lcd_display(unsigned char on);
void lcd_clear(unsigned char ic);

#endif

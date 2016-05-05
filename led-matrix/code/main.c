#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdint.h>

#define RCK	PB0
#define SRCK	PB1
#define SER	PB2

uint8_t display_data[64];
uint8_t display_data_pos = 0;
uint8_t display_data_cur = 0;

ISR(USART_RX_vect)
{
	display_data[display_data_pos] = UDR;
	display_data_pos = (display_data_pos + 1) % 64;
	if ((display_data_pos % 32 == 0)) {
		display_data_cur ^= 1;
	}
}

void
clock_byte(uint8_t byte)
{
	uint8_t i;
	for (i = 0; i < 8; i++) {
		if (byte & 1)
			PORTB |=  (1 << SER);
		else
			PORTB &= ~(1 << SER);
		byte >>= 1;

		/* clock pulse */
		PORTB |=  (1 << SRCK); PORTB &= ~(1 << SRCK);
	}
}

void
sio_putch(unsigned char c)
{
	while (!(UCSRA & (1 << UDRE)));
	UDR = c;
}

int
main()
{
	/* Set up ports for the matrix */
	DDRB = (1 << RCK | 1 << SRCK | 1 << SER);
	PORTB = 0;

	/* Set up USART */
	UBRRH = 0; UBRRL = 51; /* 9600 */
  UCSRB = (1 << RXEN) | (1 << TXEN) | (1 << RXCIE);
  UCSRC = (1 << UCSZ1) | (1 << UCSZ0);
	sei();

	int i;
	for (i = 0; i < 8; i++) {
		display_data[4 * i + 0] = (1 << i);
		display_data[4 * i + 1] = (1 << i);
		display_data[4 * i + 2] = (1 << i);
		display_data[4 * i + 3] = (1 << i);

		display_data[8 * i + 0] = (1 << i);
		display_data[8 * i + 1] = (1 << i);
		display_data[8 * i + 2] = (1 << i);
		display_data[8 * i + 3] = (1 << i);
	}

	/*
	 * Order is col, row, col, row; Columns are wired to GND
	 * with a register, so enable at most one at a time.
	 */
	while (1) {
		uint8_t* ptr = display_data;
		if (!display_data_cur)
			ptr += 32;
		for (i = 0; i < 8; i++) {
			/* clock pulses */
			clock_byte(*ptr++); clock_byte(*ptr++);
			clock_byte(*ptr++); clock_byte(*ptr++);

			/* RCK pulse to clock data */
			PORTB |=  (1 << RCK); PORTB &= ~(1 << RCK);
		}
	}
	return 0;
}

/* vim:set ts=2 sw=2: */

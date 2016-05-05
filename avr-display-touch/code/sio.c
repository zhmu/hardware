#include <avr/interrupt.h>
#include "sio.h"

#define INPUT_BUF_LEN	128
uint8_t  inputbuf[INPUT_BUF_LEN];
uint8_t  input_write_pos = 0;
uint8_t  input_read_pos = 0;

#define OUTPUT_BUF_LEN 32	
uint8_t	outputbuf[OUTPUT_BUF_LEN];
uint8_t	output_write_pos = 0;
uint8_t	output_read_pos = 0;


void
sio_init()
{
#if 0
        UBRRH = CALC_UBRR / 256;
        UBRRL = CALC_UBRR % 256;
#else
	// 57600 baud
	UBRRH = 0;
	UBRRL = 12;
#endif
        UCSRB = (1 << RXEN) | (1 << TXEN) | (1 << RXCIE) | (1 << TXCIE);
        /* 8bit, no parity, 1 stop bit */
        UCSRC = (1 << URSEL) | (3 << UCSZ0);
}

void
sio_xmit()
{
	if (output_write_pos == output_read_pos)
		return;

	UDR = outputbuf[output_read_pos];
	output_read_pos = (output_read_pos + 1) % OUTPUT_BUF_LEN;
}

void
sio_putc(unsigned char c)
{
	outputbuf[output_write_pos] = c;
	output_write_pos = (output_write_pos + 1) % OUTPUT_BUF_LEN;

	/* only transmit if we are not transmitting now */
	if ((UCSRA & (1 << UDRE)))
		sio_xmit();
}

int
sio_getc(unsigned char* c)
{
	if (input_write_pos == input_read_pos)
		return 0;

	*c = inputbuf[input_read_pos];
	input_read_pos = (input_read_pos + 1 ) % INPUT_BUF_LEN;
	return 1;
}


void
sio_puts(char* s)
{
        while(*s)
                sio_putc(*s++);
}

ISR(USART_RXC_vect)
{
	unsigned char c;

	c = UDR;
	inputbuf[input_write_pos] = c;
	input_write_pos = (input_write_pos + 1) % INPUT_BUF_LEN;
}


ISR(USART_TXC_vect)
{
	sio_xmit();
}

#include <avr/io.h>
#include <avr/interrupt.h>
#include "serial.h"
#include "config.h"

struct BAUD_TO_UBRR baud_to_ubrr[] = {
#if F_CPU == 11059200
	/*
	 * These values are taken from Table 62 (page 161) of the Atmega8
	 * manual - note that baud rate names are without the trailing two
	 * zero's to make everything more compact.
	 */
	{   "24", 287 },
	{   "48", 143 }, 
	{   "96",  71 }, 
	{  "144",  47 }, 
	{  "192",  35 }, 
	{  "288",  23 }, 
	{  "384",  17 }, 
	{  "576",  11 }, 
	{  "768",   8 }, 
	{ "1152",   5 }, 
	{ "2304",   2 }, 
#else
#error Unsupported baud rate - please add
#endif
	{   NULL,   0 }
};

int serial_curbaud_index = 4; /* 19200 */
int serial_parity = PARITY_NONE;
int serial_stop = STOP_1;

uint8_t serial_buf_rx[SERIAL_BUFSIZE_RX];
uint8_t serial_buf_tx[SERIAL_BUFSIZE_TX];
uint8_t serial_rx_readpos;
uint8_t serial_rx_writepos;
uint8_t serial_tx_readpos;
uint8_t serial_tx_writepos;

ISR(USART_RXC_vect)
{
	serial_buf_rx[serial_rx_writepos] = UDR;
	serial_rx_writepos = (serial_rx_writepos + 1) % SERIAL_BUFSIZE_RX;
}

ISR(USART_TXC_vect)
{
	if (serial_tx_writepos == serial_tx_readpos)
		return;

	UDR = serial_buf_tx[serial_tx_readpos];
	serial_tx_readpos = (serial_tx_readpos + 1) % SERIAL_BUFSIZE_TX;
}

void
serial_init()
{
	uint8_t c;

	UBRRH = (uint8_t)(baud_to_ubrr[serial_curbaud_index].ubrr >> 8);
	UBRRL = (uint8_t)(baud_to_ubrr[serial_curbaud_index].ubrr & 0xff);
        UCSRB = (1 << RXEN) | (1 << TXEN) | (1 << RXCIE) | (1 << TXCIE);

	c = 0;
	if (serial_parity == PARITY_EVEN)
		c |= (1 << UPM1);
	if (serial_parity == PARITY_ODD)
		c |= (1 << UPM1) | (1 << UPM0);
	if (serial_stop == STOP_2)
		c |= (1 << USBS);
        /* 8bit, and the parity / stop bits as above */
        UCSRC = (1 << URSEL) | (1 << UCSZ1) | (1 << UCSZ0) | c;

	/* Empty the buffers */
	serial_rx_readpos = 0; serial_rx_writepos = 0;
	serial_tx_readpos = 0; serial_tx_writepos = 0;
}


void
serial_putc(unsigned char c)
{
	/* If the output buffer is empty, immediately write the char */
	if (serial_tx_readpos == serial_tx_writepos) {
		UDR = c;
		return;
	}
	serial_buf_tx[serial_tx_writepos] = c;
	serial_tx_writepos = (serial_tx_writepos + 1) % SERIAL_BUFSIZE_TX;
}

unsigned char
serial_getc()
{
	unsigned char c;
	if (serial_rx_readpos == serial_rx_writepos)
		return 0;
	c = serial_buf_rx[serial_rx_readpos];
	serial_rx_readpos = (serial_rx_readpos + 1) % SERIAL_BUFSIZE_RX;
	return c;
}

void
serial_puts(const char* s)
{
        while(*s)
                serial_putc(*s++);
}

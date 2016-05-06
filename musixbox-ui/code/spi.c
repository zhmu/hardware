#include "spi.h"

void
spi_init()
{
	// We want to control a slave, so set-up 
	// SPI interface as master
	// MOSI, SCK, SS to output
	DDRB |= (1<<PB5) | (1<<PB7) | (1<<PB4);
	// MISO to input
	DDRB &= ~(1<<PB6);

	// SS high, deselecting slave device
	PORTB |= (1<<PB4); // THIS ONE!
	//PORTB &= ~(1<<PB4);

	// Enable SPI, Master, clock rate fck/128
	SPCR = (1<<SPE) | (1<<MSTR) | (1<<SPR1) | (1<<SPR0);

	//SPCR = 0b01010010;

	// cc
	SPSR = 0x00;

	// Enable SPI interrupt (SPIF IRQ)
	/* FIRST TRY WITHOUT INTERRUPT TO KEEP IT SIMPLE */
	// SPCR = (1<<SPIE);
}

uint8_t
spi_send(char data)
{
	// Start transmission by placing byte in tx buffer
	SPDR = data;

	// No interrupts for now, simply wait for completion
	while (!(SPSR & (1<<SPIF)));

	return SPDR;
}

// specific for ads7846 data receive
uint16_t
spi_getval()
{
	uint16_t v;

	// Only start reading when the pen
	// is still down
	if ((PINB & 0x04) == 1) return 0;
	
	v  = (spi_send(0x00) << 4);
	v |= (spi_send(0x00) >> 4);

	// Read value is only valid when the
	// pen is still down
	if ((PINB & 0x04) == 1) return 0;

	return v;
}

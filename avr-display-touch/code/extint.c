#include "extint.h"

void
extint_init()
{
	// Enable external interrupt 2, falling edge
	GICR |= (1<<INT2); // enable IRQ2
	MCUCSR &= ~(1<<ISC2); // falling edge	

	// Jump to interrupt vector handler when triggered
	GIFR |= (1<<INTF2);
	
	// Interrupt 2 pen to input
	PORTB |= (1<<PB2); // pullup
	DDRB &= ~(1<<PB2);
	//PORTB &= ~(1<<PB2); // tri-stated

	// Enable global interrupts
	sei();
}

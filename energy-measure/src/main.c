// AIN[01] = LDR
// PD4 = led

#define F_CPU 4000000UL /* 4MHz */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>
#include <stdint.h>

static void
usart_init(unsigned int baud)
{
	// Set baud rate
	UBRRH = (uint8_t)(baud >> 8);
	UBRRL = (uint8_t)(baud & 0xff);
	UCSRA = 0;
	// Enable receiver and transmitter
	UCSRB = (1 << RXEN) | (1 << TXEN);
	// 8 data, 1 stop bit
	UCSRC = (1 << UCSZ1) | (1 << UCSZ0);
}

static void
usart_putch(uint8_t ch)
{
	// Wait until the transmitter buffer is empty
	while ((UCSRA & (1 << UDRE)) == 0)
		/* nothing */ ;
	UDR = ch;
}

static void
acomp_init()
{
	// disable digital inputs
	DIDR = (1 << AIN1D) | (1 << AIN0D);
	// falling output edge
	ACSR = (1 << ACIS1) | (0 << ACIS0);
	// enable interrupt
	ACSR |= (1 << ACIE);
}

ISR(WDT_OVERFLOW_vect)
{
	// Disable the watchdog (p43 attiny2313)
	cli();
	wdt_reset();
	MCUSR &= (1 << WDRF);
	WDTCSR |= (1 << WDCE) | (1 << WDE);
	WDTCSR = 0;
	sei();

	// Clear the LED and re-enable our comparator
	PORTD &= ~(1 << PD4);	
	ACSR &= ~(1 << ACD);
	ACSR |= (1 << ACIE) | (1 << ACI); // enable interrupt yet ack the first one
}

ISR(ANA_COMP_vect)
{
	PORTD |= (1 << PD4);
	usart_putch('!');

	// Disable the comparator
	ACSR &= ~(1 << ACIE);
	ACSR |= (1 << ACD);

	// Fire watchdog after 500ms
	cli();
	wdt_reset();
	WDTCSR |= (1 << WDCE);
	WDTCSR = (1 << WDIE) | (1 << WDP2) | (1 << WDP0);
	sei();
}

int
main()
{
	DDRD = (1 << PD4); // LED is output
	PORTD = 0;
	usart_init(25); // 9600 baud
	acomp_init();
	set_sleep_mode(SLEEP_MODE_IDLE);

	usart_putch('+');
	sei();
	while(1) {
		sleep_mode();
	}

	return 0;
}
	

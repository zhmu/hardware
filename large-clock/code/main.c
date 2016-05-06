#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdint.h>
#include "twi.h"

uint8_t segno   = 0;
uint8_t segdata = 0;

#define DS1307_ADDR 	0xd0
#define DS1307_SECS	0x00
#define DS1307_MINS	0x01
#define DS1307_HOURS	0x02
#define DS1307_DAY	0x03
#define DS1307_DATE	0x04
#define DS1307_MONTH	0x05
#define DS1307_YEAR	0x06
#define DS1307_CONTROL	0x07
#define DS1307_RAM	0x08

#define SH_CP	PC1
#define ST_CP	PC2
#define DS	PC3

#define SRCK	PD6
#define SERIN	PD5
#define RCK	PD7

uint8_t counter = 0;
uint8_t digits[10] = { 0x7b, 0x41, 0x37, 0x67, 0x4d, 0x6e, 0x7e, 0x43, 0x7f, 0x6f };
uint8_t vals[6] = { 5, 6, 7, 8, 9, 0 };
uint8_t valmap[6] = { 0, 1, 4, 3, 2, 5 };

uint8_t refresh = 0;

ISR(TIMER0_OVF_vect)
{
        if (counter++ < 10)
                return;
	//refresh++;
        counter = 0;
}

void
DS1307_Init()
{
	unsigned char buf[3];

	/* Ensure the Clock Halt bit (7) of the clock is cleared */
	buf[0] = DS1307_ADDR;
	buf[1] = DS1307_SECS;
	buf[2] = 0;
	TWI_Start_Transceiver_With_Data(buf, 3);

	/* XXX */
	buf[1] = DS1307_MINS;
	buf[2] = 0x53;
	TWI_Start_Transceiver_With_Data(buf, 3);
	buf[1] = DS1307_HOURS;
	buf[2] = 0x22;
	TWI_Start_Transceiver_With_Data(buf, 3);

	/* Disable the Square Wave, we don't need it */
	buf[1] = DS1307_CONTROL;
	TWI_Start_Transceiver_With_Data(buf, 3);
}

int
main()
{
	DDRC = (1 << SH_CP | 1 << ST_CP | 1 << DS);
	DDRD = (1 << SRCK  | 1 << SERIN | 1 << RCK);

	TWI_Master_Initialise();

	/* Initialize timer: fOsc/1024 scaling, interrupt on overflow */
	TCCR0 = (1 << CS02) | (1 << CS00);
	TIMSK = (1 << TOIE0);
	sei();

	DS1307_Init();

	PORTC = 0; PORTD = 0;

	uint8_t i;
	while (1) {
		segdata = digits[vals[valmap[segno]]];
		if (segno % 2 == 1) segdata |= 0x80;

		/* Disable all clocks */
		PORTC &= ~(1 << SH_CP | 1 << ST_CP);
		PORTD &= ~(1 << SRCK  | 1 <<   RCK);
		
		/* Place data in 595 and TPIC595 */
		for (i = 0; i < 8; i++) {
			/* Update data lines */
			if ((7 - segno) == i)
				PORTC |=  (1 << DS);
			else
				PORTC &= ~(1 << DS);
			if (segdata & (1 << i))
				PORTD |=  (1 << SERIN);
			else
				PORTD &= ~(1 << SERIN);

			/* Clock pulses */
			PORTC |=  (1 << SH_CP); PORTD |=  (1 << SRCK);
			PORTC &= ~(1 << SH_CP); PORTD &= ~(1 << SRCK);
		}

		/* Perform ST/RCK clock pulses to activate the data */
		PORTC |=  (1 << ST_CP); PORTD |=  (1 <<  RCK);
		PORTC &= ~(1 << ST_CP); PORTD &= ~(1 <<  RCK);

		segno = (segno + 1) % 7;

		if (refresh) {
			unsigned char buf[10];
			int i;
			for (i = 0; i < 3; i++) {
				buf[0] = DS1307_ADDR;
				buf[1] = i;
				TWI_Start_Transceiver_With_Data(buf, 2);
				buf[0] = DS1307_ADDR|1;
				TWI_Start_Transceiver_With_Data(buf, 1);
				TWI_Get_Data_From_Transceiver(buf, 2);
				vals[5 - (i * 2)] = buf[1] & 0xf;
				vals[5 - (i * 2) - 1] = (buf[1] >> 4) & 0xf;
			}
			refresh = 0;
		} else {
			_delay_ms(1);
		}
	}

	return 0;
}

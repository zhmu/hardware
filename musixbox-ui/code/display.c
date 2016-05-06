#include "display.h"

void
lcd_setic(unsigned char ic)
{
	CMDBUS |= (1<<IC1) | (1<<IC2);
	if (ic == IC1)
		CMDBUS &= ~(1<<IC1);
	if (ic == IC2)
		CMDBUS &= ~(1<<IC2);
}

// Set the commandbus (RS and R/W)
void
lcd_set_commandbus(unsigned char rs_on, unsigned char rw_on)
{
	if (rs_on)
		CMDBUS |= (1<<RS);
	else
		CMDBUS &= ~(1<<RS);

	if (rw_on)
		CMDBUS |= (1<<RW);
	else
		CMDBUS &= ~(1<<RW);
}

// Retreive internal status
// returns byte with RESET | BUSY | DISPLAY
unsigned char
lcd_status()
{
	// Set R/W and RS
	lcd_set_commandbus(LOW, HIGH); // rs|rw

	DATADDR = 0x00; // input
	// NEW
	DATABUS = 0x00; // tri-stated (pulldown req??)
	// NEW

	// Pull data from the databus
	char tmp = PINC; //DATABUS;
	
	DATADDR = 0xFF; // writing again
	return tmp;
}

void 
lcd_init()
{
	// Keep reset HIGH (disabled)
	// Chip select both HIGH (disabled)
	CMDBUS |= (1<<RST) | (1<<IC1) | (1<<IC2);
	// Reset
	CMDBUS &= ~(1 << RST); // device hw reset
    CMDBUS |= (1 << RST) | (1<<E);
    while ( (lcd_status() & RESET) == 1 );
}

void
lcd_exec(unsigned char ic)
{
	lcd_setic(ic); // Execute on display part 'ic'
	CMDBUS |= (1<<E);
	// If clock too fast then maybe needs a pauze here of 500us
	CMDBUS &= ~(1<<E);
	while ( (lcd_status() & BUSY) == 1 );
}

// Generic command type
// cmd = SET_DISPLAY | SET_PAGE | SET_ADDRESS | SET_STARTLINE
// value = ON | OFF | page/address/startline
void
lcd_command(unsigned char cmd, unsigned char value, unsigned char ic)
{
	DATABUS = cmd + value;
	lcd_set_commandbus(LOW, LOW);
	lcd_exec(ic);
}

// Write data to display RAM
void
lcd_write(unsigned char data, unsigned char ic)
{
	DATABUS = data;
	// Send write command
	lcd_set_commandbus(HIGH, LOW); // RS | RW
	lcd_exec(ic);
}

// Read data from display RAM
// untested! NOT WORKING AII
unsigned char
lcd_read(unsigned char ic)
{

#if 1
	CMDBUS |= (1<<E);
	lcd_set_commandbus(LOW, LOW);
	lcd_setic(ICN);
	DATADDR = 0x00; // input
	DATABUS = 0x00; // tri-stated, pulldown resistors in place

	// Now start reading operations
	CMDBUS &= ~(1<<E);
	lcd_set_commandbus(HIGH, HIGH);
	lcd_setic(ic);
	CMDBUS |= (1<<E);
	// Wait for data max 320ns
	_delay_us(320);
	unsigned char data = PINC;
	DATADDR = 0xff; // output
	DATABUS = 0x00;
	return data;
#endif

#if 0
	unsigned char cmd_stat = CMDBUS;
	DATADDR = 0x00;
	DATABUS = 0x00; // tri-stated
	
	// NEW
	CMDBUS &= ~(1<<E);
	// NEW

	// Set R/W and RS
	lcd_set_commandbus(HIGH, HIGH);
	lcd_setic(ic);
	//CMDBUS &= ~(1<<E);
	//_delay_us(450);
	CMDBUS |= (1<<E);
	
	// Wait untill done retreiving RAM
	_delay_ms(1000);
	//while ( (lcd_status() & BUSY) == 1 );

	// Pull data from the databus
	unsigned char tmp = PINC;
	CMDBUS = cmd_stat;
	DATADDR = 0xff;
	return tmp;
#endif
}

// Set display status
void
lcd_display(unsigned char on)
{
	lcd_command(SET_DISPLAY, ON, IC1);
	lcd_exec(IC1);
	lcd_command(SET_DISPLAY, ON, IC2);
	lcd_exec(IC2);
}

// Clear a displaypart
void
lcd_clear(unsigned char ic)
{
	uint8_t i,j;
	for(i=0; i<8; i++) {
		lcd_command(SET_PAGE, i, ic);
		for(j=0; j<64; j++)
			lcd_write(0x00, ic);
	}
}

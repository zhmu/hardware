CC=		avr-gcc
OBJCOPY=	avr-objcopy
AVRDUDE=	avrdude

OBJS=		main.o twi.o

CFLAGS=		-DF_CPU=12000000L -mmcu=atmega8 -Os -Wall

avr.hex:	avr.elf
		$(OBJCOPY) -j .text -j .data -O ihex avr.elf avr.hex

avr.elf:	$(OBJS)
		$(CC) $(CFLAGS) -o avr.elf $(OBJS)

main.o:		main.c
		$(CC) $(CFLAGS) -c -o main.o main.c

twi.o:		twi.c
		$(CC) $(CFLAGS) -c -o twi.o twi.c

clean:
		rm -f avr.hex avr.elf $(OBJS)

prog:		avr.hex
		$(AVRDUDE) -c pony-stk200 -pm8 -E noreset -U flash:w:avr.hex

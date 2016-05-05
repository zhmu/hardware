CC=		avr-gcc
OBJS=		avr.o

CFLAGS=		-DF_CPU=1000000L -mmcu=attiny2313 -Os -Wall

avr.hex:	avr.elf
		avr-objcopy -j .text -j .data -O ihex avr.elf avr.hex

avr.elf:	$(OBJS)
		$(CC) -o avr.elf $(CFLAGS) $(OBJS)

avr.o:		avr.c
		$(CC) -c -o avr.o $(CFLAGS) avr.c

clean:
		rm -f avr.hex avr.elf $(OBJS)

prog:
		avrdude -c avr910 -pt2313 -P /dev/ttyU0 -U flash:w:avr.hex

lfuse:
		avrdude -c avr910 -pt2313 -P /dev/ttyU0 -U lfuse:w:0xFF:m

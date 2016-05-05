CC=		avr-gcc
OBJCOPY=	avr-objcopy
AVRDUDE=	avrdude

OBJS=		main.o

CFLAGS=		-DF_CPU=8000000L -mmcu=attiny2313 -Os -Wall

avr.hex:	avr.elf
		$(OBJCOPY) -j .text -j .data -O ihex avr.elf avr.hex

avr.elf:	$(OBJS)
		$(CC) $(CFLAGS) -o avr.elf $(OBJS)

main.o:		main.c
		$(CC) $(CFLAGS) -c -o main.o main.c

clean:
		rm -f avr.hex avr.elf $(OBJS)

prog:		avr.hex
		$(AVRDUDE) -c pony-stk200 -pattiny2313 -E noreset -U flash:w:avr.hex

fuses:
		$(AVRDUDE) -c pony-stk200 -pattiny2313 -E noreset -U lfuse:w:0xff:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m

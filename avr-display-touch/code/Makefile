CC=		avr-gcc
OBJS=		avr.o sio.o spi.o touch.o display.o extint.o

SIODEV?=	/dev/ttyU1
CFLAGS= -DF_CPU=12000000L -mmcu=atmega16 -Os -Wall

avr.hex:	avr.elf
		avr-objcopy -j .text -j .data -O ihex avr.elf avr.hex

avr.elf:	$(OBJS)
		$(CC) -o avr.elf $(CFLAGS) $(OBJS)

avr.o:		main.c
		$(CC) -c -o avr.o $(CFLAGS) main.c

sio.o:		sio.c
		$(CC) -c -o sio.o $(CFLAGS) sio.c

spi.o:		spi.c
		$(CC) -c -o spi.o $(CFLAGS) spi.c

touch.o:	touch.c
		$(CC) -c -o touch.o $(CFLAGS) touch.c

display.o:	display.c
		$(CC) -c -o display.o $(CFLAGS) display.c

extint.o:	extint.c
		$(CC) -c -o extint.o $(CFLAGS) extint.c

clean:
		rm -f avr.hex avr.elf $(OBJS)

prog:
		avrdude -c dragon_isp -P usb -pm16 -U flash:w:avr.hex

prog-pony:
		avrdude -c pony-stk200 -pm16 -U flash:w:avr.hex

prog-rink:
		avrdude -c avr910 -pm16 -P $(SIODEV) -U flash:w:avr.hex

prog-fuses:
		avrdude -c pony-stk200 -pm16 -U lfuse:w:0x6F:m -U hfuse:w:0xD9:m 

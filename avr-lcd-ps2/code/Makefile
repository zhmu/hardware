CC=		avr-gcc
OBJS=		main.o keyboard.o lcd.o serial.o screen.o menu.o

CFLAGS=		-DF_CPU=11059200L -mmcu=atmega8 -Os -Wall

ps2.hex:	ps2.elf
		avr-objcopy -j .text -j .data -O ihex ps2.elf ps2.hex

ps2.elf:	$(OBJS)
		$(CC) -o ps2.elf $(CFLAGS) $(OBJS)

main.o:		main.c
		$(CC) -c -o main.o $(CFLAGS) main.c

keyboard.o:	keyboard.c
		$(CC) -c -o keyboard.o $(CFLAGS) keyboard.c

lcd.o:		lcd.c
		$(CC) -c -o lcd.o $(CFLAGS) lcd.c

serial.o:	serial.c
		$(CC) -c -o serial.o $(CFLAGS) serial.c

screen.o:	screen.c
		$(CC) -c -o screen.o $(CFLAGS) screen.c

menu.o:		menu.c
		$(CC) -c -o menu.o $(CFLAGS) menu.c

clean:
		rm -f ps2.hex ps2.elf $(OBJS)

prog:
		avrdude -cpony-stk200 -pm8 -U flash:w:ps2.hex

fuse:
		avrdude -cpony-stk200 -pm8 -U lfuse:w:0xFF:m

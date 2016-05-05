TARGET=		avr-lcd
CFLAGS=		-Wall -Werror -ansi -pedantic -std=c99
LDFLAGS=	-lkvm

avr-lcd:	avr-lcd.c
		$(CC) $(CFLAGS) -o avr-lcd avr-lcd.c $(LDFLAGS)

clean:
		rm -f avr-lcd

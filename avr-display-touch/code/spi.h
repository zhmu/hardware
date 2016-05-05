#ifndef __SPI_H_
#define __SPI_H_

#include <avr/io.h>

#define spi_ss_select() PORTB &= ~(1<<PB4);
#define spi_ss_deselect() PORTB |= (1<<PB4);

void spi_init();
uint8_t spi_send(char data);
uint16_t spi_getval();

#endif

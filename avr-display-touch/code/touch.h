#ifndef __TOUCH_H_
#define __TOUCH_H_

#include <inttypes.h>

#define X_AXIS					0xD1
#define Y_AXIS					0x91
#define CMD_TOUCH_COORDS	0x01

typedef struct point { 
	uint16_t x;
	uint16_t y;
} point;

void touch_init();
uint16_t touch_read(unsigned char axis);
void touch_send(point coordinate);

#endif

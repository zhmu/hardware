#ifndef __LCD_H__
#define __LCD_H__

void lcd_init();
void lcd_write8(int n, int rs, unsigned char c);

extern unsigned char lcd0_line_addr[];
extern unsigned char lcd1_line_addr[];

#define lcd_putch(n,c) lcd_write8(n,1,(c))
#define lcd_goto(n,c)  lcd_write8(n,0,0x80|(c))

#endif /* __LCD_H__ */

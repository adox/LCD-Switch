/* 
 * File:   lcd2.h
 * Author: Adam
 *
 * Created on 26 lipiec 2012, 18:23
 */

#ifndef LCD2_H
#define	LCD2_H

void lcd_write(unsigned char c);
void lcd_clear(void);
void lcd_puts(const char * s);
void lcd_putch(char c);
void lcd_goto(unsigned char lineno, unsigned char pos);
void lcd_init();
void lcd_add_char(unsigned char addr, unsigned char pattern[]);


#endif	/* LCD2_H */


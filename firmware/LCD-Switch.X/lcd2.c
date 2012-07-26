// My Modified LCD.C file to drive LCD from single PORT on PIC16F877 - USING PORTA

/*
 * LCD interface example
 * Uses routines from delay.c
 * This code will interface to a standard LCD controller
 * like the Hitachi HD44780. It uses it in 4 bit mode, with
 * the hardware connected as follows (the standard 14 pin
 * LCD connector is used):
 *
 * PORTA bits 0-3 are connected to the LCD data bits 4-7 (high nibble)
 * PORTA bit 6 is connected to the LCD RS input (register select)
 * PORTA bit 7 is connected to the LCD EN bit (enable)
 *
 * To use these routines, set up the port I/O TRISA then
 * call lcd_init(), then other routines as required.
 *
 *
 */

#ifndef _XTAL_FREQ
 // Unless specified elsewhere, 4MHz system frequency is assumed
 #define _XTAL_FREQ 4000000
#endif




#include <htc.h>

#include "lcd.h"


#define LCD_RS RA6
#define LCD_RW RA4
#define LCD_EN RA7


#define LCD_DATA PORTA



#define LCD_STROBE() ((LCD_EN = 1),(LCD_EN=0))

/* write a byte to the LCD in 4 bit mode */


 int control_store;


void
lcd_write(unsigned char c)
{
 __delay_us(40);
 LCD_DATA = ( ( c >> 4 ) & 0x0F )^control_store;
 LCD_STROBE();
 LCD_DATA = ( c & 0x0F )^control_store;
 LCD_STROBE();
}

/*
 * Clear and home the LCD
 */

void
lcd_clear(void)
{
 LCD_RS = 0;

 control_store=PORTA&240; //BITWISE AND CONTROL_STORE WITH B'11110000' to filter out upper nibble

 lcd_write(0x1);
 __delay_ms(2);
}

/* write a string of chars to the LCD */

void
lcd_puts(const char * s)
{
 LCD_RS = 1; // write characters

 control_store=PORTA&240; //BITWISE AND CONTROL_STORE WITH B'11110000' to filter out upper nibble

 while(*s)
 lcd_write(*s++);
}

/* write one character to the LCD */

void
lcd_putch(char c)
{
 LCD_RS = 1; // write characters

 control_store=PORTA&240; //BITWISE AND CONTROL_STORE WITH B'11110000' to filter out upper nibble

 lcd_write( c );
}


/*
 * Go to the specified position
 */

void
lcd_goto(unsigned char lineno, unsigned char pos)
{
 LCD_RS = 0;

 control_store=PORTA&240; //BITWISE AND CONTROL_STORE WITH B'11110000' to filter out upper nibble

 if(lineno == 1)
     lcd_write(0x80 + pos);
 else
     lcd_write(0xC0 + pos);
}

/* initialise the LCD - put into 4 bit mode */
void
lcd_init()
{
 char init_value;

 CMCON = 0x07; // Disable analog pins on PORTA

 init_value = 0x3;


 TRISA=0;

 LCD_RS = 0;
 LCD_EN = 0;
 LCD_RW = 0;

 control_store=PORTA&240; //BITWISE AND CONTROL_STORE WITH B'11110000' to filter out upper nibble


 __delay_ms(15); // wait 15mSec after power applied,
 LCD_DATA = init_value^control_store;
 LCD_STROBE();
 __delay_ms(5);
 LCD_STROBE();
 __delay_us(200);
 LCD_STROBE();
 __delay_us(200);
 LCD_DATA = 2^control_store; // Four bit mode
 LCD_STROBE();

 lcd_write(0x28); // Set interface length
 lcd_write(0x0C); // Display On, Cursor Off
 lcd_clear(); // Clear screen
 lcd_write(0x06); // Set entry Mode
}

/* TODO */
/* add character - write to cgram */
void
lcd_add_char(unsigned char addr, unsigned char pattern[]) {
    unsigned char i;

    LCD_RS = 0; // command
    control_store=PORTA&240; //BITWISE AND CONTROL_STORE WITH B'11110000' to filter out upper nibble

    addr &= 0x07;   // only 8 addresses
    lcd_write(0x40 + (addr << 3));

    
    LCD_RS = 1; // data
    control_store=PORTA&240; //BITWISE AND CONTROL_STORE WITH B'11110000' to filter out upper nibble
    
    for (i = 0; i < 8; i++)
        lcd_write(pattern[i]);

}
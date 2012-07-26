
/*
------------------------------------------------------------
Character LCD 8/4 Bit Interface 16x2, 20x4
Easily Portable to any MCU (8051, PIC, ARM, ST, Renesas, etc)

Version    : 1.0.4
Programmer : Pallav Aggarwal
Dated      : 16 June 2012
MCU        : Tested with P89V51RD2 & R8C27
------------------------------------------------------------
*/
#include <htc.h>            /* HiTech General Includes */
#include <stdint.h>         /* For uint8_t definition */
#include <stdbool.h>        /* For true/false definition */
#include "lcd.h"

/*
Example to use
main()
{
    io_port_initialisation();
    init_lcd();
    init_lcd();
    init_lcd();
    while(1)
    {
    //put_chr_lcd(LINE1,15,'3');
    //put_chr_lcd(LINE2,15,'2');
    put_str_lcd(LINE1,0,"  Hello World   ",16);
    put_str_of_dec(LINE1,0,256,4,YES_SHOW_LEADING_ZEROS);
    }
}

*/

unsigned char buff[10];//Buffer to Store Converted String

void init_lcd(void)
{
    unsigned char tmp;/*Temperary Variable*/
    unsigned char LCD_init_command[]={
                                        LCD_INIT_COMMAND_1,
                                        LCD_INIT_COMMAND_2,
                                        LCD_INIT_COMMAND_3,
                                        LCD_INIT_COMMAND_4,
                                        LCD_INIT_COMMAND_5,
                                        LCD_INIT_COMMAND_6,
                                        LCD_INIT_COMMAND_7
                                        };
    for(tmp=0;tmp<7;tmp++)
    {
        send_lcd(LCD_init_command[tmp],COMMAND);
        delay(LCD_INIT_DELAY);
    }
}

void send_lcd(unsigned char data_byte, unsigned char type)
{
    //COMMAND or DATA Selection
    if(type==COMMAND)
    {
        CLRBIT(RS_PORT,RS_PIN);
    }
    else if(type==DATA)
    {
        SETBIT(RS_PORT,RS_PIN);
    }

#if LCD_INTERFACE==EIGHT_BIT
    LCD_PORT = data_byte;
    SETBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
    CLRBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
#elif  LCD_INTERFACE==FOUR_BIT_LOW
    //Data Higher Nibble >> Port Lower Nibble
    LCD_PORT = (LCD_PORT & 0xF0) | (data_byte >> 4);
    SETBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
    CLRBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);

    //Data Lower Nibble >> Port Lower Nibble
    LCD_PORT = (LCD_PORT & 0xF0) | (data_byte & 0x0F);
    SETBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
    CLRBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
#elif  LCD_INTERFACE==FOUR_BIT_HIGH
    //Data Higher Nibble >> Port Higher Nibble
    LCD_PORT = (LCD_PORT & 0x0F) | (data_byte & 0xF0);
    SETBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
    CLRBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);

    //Data Lower Nibble >> Port Higher Nibble
    LCD_PORT = (LCD_PORT & 0x0F) | (data_byte<<4);
    SETBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
    CLRBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
#elif  LCD_INTERFACE==FOUR_BIT_RANDOM
    //Higher Nibble
    if(data_byte & 0x10) SETBIT(D4_PORT,D4_PIN);
    else CLRBIT(D4_PORT,D4_PIN);
    if(data_byte & 0x20) SETBIT(D5_PORT,D5_PIN);
    else CLRBIT(D5_PORT,D5_PIN);
    if(data_byte & 0x40) SETBIT(D6_PORT,D6_PIN);
    else CLRBIT(D6_PORT,D6_PIN);
    if(data_byte & 0x80) SETBIT(D7_PORT,D7_PIN);
    else CLRBIT(D7_PORT,D7_PIN);

    SETBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
    CLRBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);

    //Lower Nibble
    if(data_byte & 0x01) SETBIT(D4_PORT,D4_PIN);
    else CLRBIT(D4_PORT,D4_PIN);
    if(data_byte & 0x02) SETBIT(D5_PORT,D5_PIN);
    else CLRBIT(D5_PORT,D5_PIN);
    if(data_byte & 0x04) SETBIT(D6_PORT,D6_PIN);
    else CLRBIT(D6_PORT,D6_PIN);
    if(data_byte & 0x08) SETBIT(D7_PORT,D7_PIN);
    else CLRBIT(D7_PORT,D7_PIN);

    SETBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
    CLRBIT(EN_PORT,EN_PIN);delay(LCD_EN_DELAY);
#endif
}

void put_chr_lcd(unsigned char line_no,unsigned char position,char data_byte)
{
    send_lcd(line_no + position,COMMAND);
    send_lcd(data_byte,DATA);
}

void put_str_lcd(unsigned char line_no,unsigned char start_position,char *ptr,unsigned char str_len)
{
    send_lcd(line_no + start_position,COMMAND);
    while((*ptr) && (str_len>0))
        {
            send_lcd(*ptr,DATA);
            ptr++;
            str_len--;
        }
}

void put_str_of_dec(unsigned char line_no,unsigned char start_position,unsigned long dec_number,unsigned char str_len,unsigned char LeadingZero)
{
    unsigned char return_len=0;
    return_len=Dec2Str(dec_number,str_len,LeadingZero);
    put_str_lcd(line_no,start_position,buff,str_len);
}

unsigned char Dec2Str(unsigned long Number,unsigned char NoOfDigits,unsigned char lzero)//Converts max 10 Digit Number to String
{
    unsigned char tmp=0;//temperary variable
    unsigned char len=0;
    //Clear Buffer
    if(lzero==1)
    {
    for(tmp=0;tmp<10;tmp++) buff[tmp]=0x30;
    }
    else if(lzero==0)
    {
    for(tmp=0;tmp<10;tmp++) buff[tmp]=' ';
    }

    tmp=0;

    while(Number)
    {
        buff[NoOfDigits-1]=((Number % 10) + 0x30);//Divide number by 10 & put reminder in buff + convert it to ASCII charcter by adding 0x30
        Number /= 10;//Divide Number by 10
        NoOfDigits--;
        tmp++;
    }
    return tmp;//Length of the String
}

/*
void put_str_of_dec_with_dot(unsigned char line_no,unsigned char start_position,unsigned long dec_number,unsigned char dot_position,unsigned char str_len)
{

}
*/

void delay(unsigned int cycles)
{
    while(cycles) cycles--;
}

/**
 * Add a custom character
 */
void lcd_add_character(unsigned char addr, unsigned char * pattern) {
    unsigned char i;

    send_lcd(SET_CGRAM_ADDR | addr << 3, COMMAND);
    for (i = 0; i < 8; i++)
        send_lcd(pattern[i], DATA);
}
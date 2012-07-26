/*
------------------------------------------------------------
CharacterLCD.h

Character LCD 8/4 Bit Interface 16x2, 20x4
Easily Portable to any MCU (8051, PIC, ARM, ST, Renesas, etc)

Version    : 1.0.4
Programmer : Pallav Aggarwal
Dated      : 16 June 2012
MCU        : Tested with P89V51RD2 & R8C27
------------------------------------------------------------

Limitation:
1.Functions do not check validity of parameters & its range. User need to understand what needs to input to the functions before using it.
2.Port initialisation is not done, user needs to do that seperatly in some functions like LCD_io_port_init().

*/

#ifndef _LCD_H_
#define _LCD_H_

#define LCD_INTERFACE             FOUR_BIT_LOW

#define EIGHT_BIT                 0 //(WORKING OK)
#define FOUR_BIT_LOW              1 //(WORKING OK)
#define FOUR_BIT_HIGH             2 //(WORKING OK)
#define FOUR_BIT_RANDOM           3 //(WORKING OK)

#if LCD_INTERFACE==EIGHT_BIT
    //LCD Data Port Configuration
    #define LCD_PORT              PORTA
#elif  LCD_INTERFACE==FOUR_BIT_LOW
    //LCD Data Port Configuration
    #define LCD_PORT              PORTA
#elif  LCD_INTERFACE==FOUR_BIT_HIGH
    //LCD Data Port Configuration
    #define LCD_PORT              PORTA
#elif  LCD_INTERFACE==FOUR_BIT_RANDOM
    //LCD Data pins Configuration
    #define D4_PORT               PORTA
    #define D4_PIN                0
    #define D5_PORT               PORTA
    #define D5_PIN                1
    #define D6_PORT               PORTA
    #define D6_PIN                2
    #define D7_PORT               PORTA
    #define D7_PIN                3
#endif

#if LCD_INTERFACE==EIGHT_BIT
    #define LCD_INIT_COMMAND_1    0x30 /* 8bit Interface                        */
    #define LCD_INIT_COMMAND_2    0x30 /* 8bit Interface                        */
    #define LCD_INIT_COMMAND_3    0x30 /* 8bit Interface                        */
    #define LCD_INIT_COMMAND_4    0x38 /* 8bit , 2 Line                         */
    #define LCD_INIT_COMMAND_5    0x0C /* Display ON, Cursor OFF                */
    #define LCD_INIT_COMMAND_6    0x06 /* Entry Mode - No shift, Auto Increment */
    #define LCD_INIT_COMMAND_7    0x01 /* Clear LCD                             */
#elif (LCD_INTERFACE==FOUR_BIT_LOW)||(LCD_INTERFACE==FOUR_BIT_HIGH)||(LCD_INTERFACE==FOUR_BIT_RANDOM)
    #define LCD_INIT_COMMAND_1    0x20 /* 4bit Interface                        */
    #define LCD_INIT_COMMAND_2    0x20 /* 4bit Interface                        */
    #define LCD_INIT_COMMAND_3    0x20 /* 4bit Interface                        */
    #define LCD_INIT_COMMAND_4    0x28 /* 4bit , 2 Line                         */
    #define LCD_INIT_COMMAND_5    0x0C /* Display ON, Cursor OFF                */
    #define LCD_INIT_COMMAND_6    0x06 /* Entry Mode - No shift, Auto Increment */
    #define LCD_INIT_COMMAND_7    0x01 /* Clear LCD                             */
#endif

//LCD Control Pins
#define RS_PORT          PORTA
#define RS_PIN           6
#define EN_PORT          PORTA
#define EN_PIN           7

#define SETBIT(PORT,PIN) PORT |= (0x01 << PIN)
#define CLRBIT(PORT,PIN) PORT &=~(0x01 << PIN)

/*
#define LCD_INIT_DELAY   500
#define LCD_EN_DELAY     50
 */
#define LCD_INIT_DELAY   1000
#define LCD_EN_DELAY     5


#define COMMAND          0
#define DATA             1

#define LINE1            0x80
#define LINE2            0xC0
#define LINE3            0x94
#define LINE4            0xD4

#define YES_SHOW_LEADING_ZEROS     1
#define NO_SHOW_LEADING_ZEROS      0

#define SET_CGRAM_ADDR   0x40

void init_lcd(void);//8 Bit Interface or 4 Bit Interface LCD
void send_lcd(      unsigned char byte, //LCD Data
                    unsigned char type  //Type Command or Display Data
                    );
void put_chr_lcd(   unsigned char line_no,  // Line no of LCD
                    unsigned char position, // Position of character
                    char data_byte          // Character to print on LCD
                    );
void put_str_lcd(   unsigned char line_no,        //LINE no of LCD
                    unsigned char start_position, //Starting Position of String
                    char *ptr,                    //Pointer to String
                    unsigned char str_len         //String Length
                    );
void put_str_of_dec(unsigned char line_no,        //Line no of LCD
                    unsigned char start_position, //start position of string
                    unsigned long dec_number,     //Number
                    unsigned char str_len,        //Length of String
                    unsigned char LeadingZero     //if 1 then Display Leading Zero other wise don't display leading zero
                    );
unsigned char Dec2Str(unsigned long Number,unsigned char NoOfDigits,unsigned char lzero);
//void put_str_of_dec_with_dot(unsigned char line_no,unsigned char start_position,unsigned long dec_number,unsigned char dot_position,unsigned char str_len);
void delay(unsigned int cycles);
void lcd_add_character(unsigned char addr, unsigned char * pattern);
#endif
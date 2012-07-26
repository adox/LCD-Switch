/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#include <htc.h>           /* Global Header File */
#include <stdint.h>        /* For uint8_t definition */
#include <stdbool.h>       /* For true/false definition */

#include "system.h"        /* System funct/params, like osc/peripheral config */
#include "user.h"          /* User funct/params, such as InitApp */
#include "lcd2.h"

#define _XTAL_FREQ 4000000

#define SW1 RB7
#define SW2 RB6
#define SW3 RB0

#define RB_STACK_UP   0b11100111;
#define RB_STACK_BOTH 0b11010111;
#define RB_STACK_DOWN 0b11001111;

#define CHAR_UL 0
#define CHAR_UR 1
#define CHAR_DL 2
#define CHAR_DR 3
#define CHAR_L 4
#define CHAR_R 5

enum {STACK_NONE, STACK_UP, STACK_BOTH, STACK_DOWN};

unsigned char SYMBOL_UL[8] = {0x1f,0x1f,0x1f,0x1f,0x03,0x03,0x03,0x03};
unsigned char SYMBOL_UR[8] = {0x1f,0x1f,0x1f,0x1f,0x18,0x18,0x18,0x18};
unsigned char SYMBOL_DL[8] = {0x03,0x03,0x03,0x03,0x1f,0x1f,0x1f,0x1f};
unsigned char SYMBOL_DR[8] = {0x18,0x18,0x18,0x18,0x1f,0x1f,0x1f,0x1f};
unsigned char SYMBOL_L[8] = {0x1,0x1,0x1,0x1,0x1,0x1,0x1,0x1};
unsigned char SYMBOL_R[8] = {0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10};


/******************************************************************************/
/* User Global Variable Declaration                                           */
/******************************************************************************/

char mode;
char modePrev;

/******************************************************************************/
/* Main Program                                                               */
/******************************************************************************/

uint8_t main(void)
{
    /* Configure the oscillator for the device */
    ConfigureOscillator();

    /* Initialize I/O and Peripherals for application */
    InitApp();

    /* TODO <INSERT USER APPLICATION CODE HERE> */
    lcd_init();

    lcd_puts("STACK SWITCH 0.1");
    __delay_ms(1000);
    lcd_goto(1,0);
    lcd_puts("STACK SWITCH    ");
    lcd_goto(2,0);
    lcd_puts(" WAITING...     ");


    lcd_add_char(CHAR_UL, SYMBOL_UL);
    lcd_add_char(CHAR_UR, SYMBOL_UR);
    lcd_add_char(CHAR_DL, SYMBOL_DL);
    lcd_add_char(CHAR_DR, SYMBOL_DR);
    lcd_add_char(CHAR_L, SYMBOL_L);
    lcd_add_char(CHAR_R, SYMBOL_R);

    lcd_goto(1,0);
    

    mode = STACK_NONE;

    while(1)
    {
        modePrev = mode;

        if(SW1 == 0)
            mode = STACK_UP;
        else if(SW2 == 0)
            mode = STACK_BOTH;
        else if(SW3 == 0)
            mode = STACK_DOWN;

        // if mode changed
        if(mode != modePrev) {
            switch(mode) {
                case STACK_UP:
                    lcd_goto(1,14); lcd_putch(CHAR_UL);
                    lcd_goto(1,15); lcd_putch(CHAR_UR);
                    lcd_goto(2,14); lcd_putch(CHAR_L);
                    lcd_goto(2,15); lcd_putch(CHAR_R);
                    
                    lcd_goto(2,0);
                    lcd_puts("  STACK UP   ");

                    PORTB = RB_STACK_UP;
                    break;

                case STACK_BOTH:
                    lcd_goto(1,14); lcd_putch(CHAR_UL);
                    lcd_goto(1,15); lcd_putch(CHAR_UR);
                    lcd_goto(2,14); lcd_putch(CHAR_DL);
                    lcd_goto(2,15); lcd_putch(CHAR_DR);

                    lcd_goto(2,0);
                    lcd_puts("  STACK BOTH ");



                    PORTB = RB_STACK_BOTH;
                    break;

                case STACK_DOWN:
                    lcd_goto(1,14); lcd_putch(CHAR_L);
                    lcd_goto(1,15); lcd_putch(CHAR_R);
                    lcd_goto(2,14); lcd_putch(CHAR_DL);
                    lcd_goto(2,15); lcd_putch(CHAR_DR);

                    lcd_goto(2,0);
                    lcd_puts("  STACK DOWN ");

                    PORTB = RB_STACK_DOWN;
                    break;
            }

        }

    }

}

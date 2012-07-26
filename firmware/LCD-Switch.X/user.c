/******************************************************************************/
/* Files to Include                                                           */
/******************************************************************************/

#include <htc.h>            /* HiTech General Includes */
#include <stdint.h>         /* For uint8_t definition */
#include <stdbool.h>        /* For true/false definition */

#include "user.h"

/******************************************************************************/
/* User Functions                                                             */
/******************************************************************************/

/* <Initialize variables in user.h and insert code for user algorithms.> */

void InitApp(void)
{
    /* TODO Initialize User Ports/Peripherals/Project here */
    CMCON = 0x07;

    /* Setup analog functionality and port direction */
    PORTA = 0x00;
    TRISA = 0x00;
    PORTA = 0x00;

    OPTION_REG &= 0x7F; // enable weak pullup
    TRISB = 0b11000111;

    /* Initialize peripherals */

    /* Enable interrupts */
}


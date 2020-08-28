/*
** Copyright (C) ARM Limited, 2001. All rights reserved.
*/


/*
** This implements a 'retarget' layer for low-level IO.  Typically, this
** would contain your own target-dependent implementations of fputc(),
** ferror(), etc.
** 
** This example provides implementations of fputc(), ferror(),
** _sys_exit(), _ttywrch() and __user_initial_stackheap().
**
** Here, semihosting SWIs are used to display text onto the console 
** of the host debugger.  This mechanism is portable across ARMulator,
** Angel, Multi-ICE and EmbeddedICE.
**
** Alternatively, to output characters from the serial port of an 
** ARM Integrator Board (see serial.c), use:
**
**     #define USE_SERIAL_PORT
**
** or compile with 
**
**     -DUSE_SERIAL_PORT
*/

#include <stdio.h>
#include <rt_misc.h>

#ifdef __thumb
/* Thumb Semihosting SWI */
#define SemiSWI 0xAB
#else
/* ARM Semihosting SWI */
#define SemiSWI 0x123456
#endif


/* Write a character */ 
__swi(SemiSWI) void _WriteC(unsigned op, char *c);
#define WriteC(c) _WriteC (0x3,c)

/* Exit */
__swi(SemiSWI) void _Exit(unsigned op, unsigned except);
#define Exit() _Exit (0x18,0x20026)


struct __FILE { int handle;   /* Add whatever you need here */};
FILE __stdout;


extern unsigned int bottom_of_heap;     /* defined in heap.s */
extern void sendchar( char *ch );       /* defined in serial.c */


int fputc(int ch, FILE *f)
{
    /* Place your implementation of fputc here     */
    /* e.g. write a character to a UART, or to the */
    /* debugger console with SWI WriteC            */

    char tempch = ch;
#ifdef USE_SERIAL_PORT
    sendchar( &tempch);
#else
    WriteC( &tempch );
#endif
    return ch;
}


int ferror(FILE *f)
{   /* Your implementation of ferror */
    return EOF;
}


void _sys_exit(int return_code)
{
    Exit();         /* for debugging */

label:  goto label; /* endless loop */
}


void _ttywrch(int ch)
{
    char tempch = ch;
#ifdef USE_SERIAL_PORT
    sendchar( &tempch );
#else
    WriteC( &tempch );
#endif
}


__value_in_regs struct __initial_stackheap __user_initial_stackheap(
        unsigned R0, unsigned SP, unsigned R2, unsigned SL)
{
    struct __initial_stackheap config;
    
    config.heap_base = (unsigned int)&bottom_of_heap; // defined in heap.s
                                                      // placed by scatterfile   
    config.stack_base = SP;   // inherit SP from the execution environment

    return config;
}

/*
Below is an equivalent example assembler version of __user_initial_stackheap.

It will be entered with the value of the stackpointer in r1 (as set in init.s), 
this does not need to be changed and so can be passed unmodified out of the 
function. 

    IMPORT bottom_of_heap
    EXPORT __user_initial_stackheap

__user_initial_stackheap    
    LDR   r0,=bottom_of_heap
    MOV   pc,lr
*/


/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	express.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk-express specific routines.. 
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "defs.h"
#include	"esc.h"
#include "kernel.h"
#include	"dectalk.h"
#include "kernp.h" 
#include "hardw.h"

#include <conio.h>	/* for inp, outp */
#pragma intrinsic(_inp, _inpw, _outp, _outpw)

#ifdef EXPRESS_LIB_RTNS

void spc_clock(on)
unsigned char on;
{
	if (on)
		_outp(PORTB,BIT1|BIT0);
	  else
		_outp(PORTB,0);	

}


unsigned char read_gpio()
{
	return(_inp(GPIO));
}

#endif //EXPRESS_LIB_RTNS

void enable_int(intmask)
unsigned char intmask;
{
	/*this only works for the low 8 interrupts. */
	_outp(IMR0,_inp(IMR0) & ~intmask); // 0 = on
}

void disable_int(intmask)
unsigned char intmask;
{
	_outp(IMR0,_inp(IMR0) | intmask);
}

short int set_baud(baudrate)
unsigned short int baudrate;
{
	/* set the baudrate to one of the standard values. */
	/* in theory, we could set it to anything we wished, */
	/* but a bogus baudrate is likely due to an error and */
	/* that would leave us in the weeds.. */
	/* this is going to happen immediately; if there are */
	/* characters coming or going, expect errors. */
	unsigned char oldLCR;
	unsigned short int brd=0,flags;
	switch (baudrate)
	    {
	    case 110:
		brd=3551;
		break;
	    case 300:
		brd=1302;
		break;
	    case 600:
		brd=651;
		break;
	    case 1200:
		brd=326;
		break;
	    case 2400:
		brd=163;
		break;
	    case 4800:
		brd=81;
		break;
	    case 9600:
		brd=41;
		break;
	    case 19200:
		brd=20;
		break;
	    default:
		return (-1);
	    }
	flags = kernel_disable();	// don't bug me, man.. 
	oldLCR = _inp(UART_LCR);
	_outp(UART_LCR, oldLCR|LCR_DLAB);
	_outp(UART_THR, (unsigned char)(brd&0xff));
	_outp(UART_IER, (unsigned char)((brd>>8)&0xff));
	/* put everything else back.. */
	_outp(UART_LCR, oldLCR);
	kernel_enable(flags);

	return(0);
}

short int set_format(bitsper,parity,stop)
unsigned char bitsper,parity,stop;
{
	/* build the config word here.. */
	unsigned char config = 0;
	switch(bitsper)
	    {
	    case BPC_5:
		break;
	    case BPC_6:
		config |= BIT0;
		break;
	    case BPC_7:
		config |= BIT1;
		break;
	    case BPC_8:
		config |= BIT0|BIT1;
		break;
	    default:
		return(-1);
	    }
	switch(parity)
	    {
	    case PARITY_EVEN:
		config |= BIT3|BIT4;
		break;
	    case PARITY_ODD:
		config |= BIT3;
		break;
	    case PARITY_NONE:
		/* Nothing gets set.. */
		break;
	    case PARITY_0:
		config |= BIT3|BIT4|BIT5;
		break;
	    case PARITY_1:
		config |= BIT3|BIT5;
		break;
	    default:
		return(-2);
	    }
}


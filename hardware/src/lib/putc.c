/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	putc.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  put a character to the console 
 *
 ***********************************************************************
 *    Revision History:
 * 29 jun 95	...tek		added put_ring_buf().
 * 11dec95	...tek		merge DTEX
 */


#include "defs.h"
#include "esc.h"
#include "cmd.h"
#include "kernel.h"
#include "dectalk.h"
#include "pcport.h"
#include "hardw.h"

#ifdef DTEX
/* the express version needs to touch registers.. */
#include <conio.h> /* for inp, outp */
#pragma intrinsic(_inp, _inpw, _outp, _outpw)
#endif /*DTEX*/

/* the putc() routine is quite different for DTEX because
 * it has to deal with xoff state. Also, the express does
 * not (currently) use put_ring_buf, because that exists
 * to optimize the ISA DMA handler for non-express machines.
 */
#ifndef DTEX /* not an express */
void putc(c)
unsigned int c;
{

	if(KS.cmd_flush == false)
		{
		put_ring(KS.out_ring,&(unsigned char)c);
		serial_update();
		}
}

void put_ring_buf(P_RING ringptr,unsigned char far *inbuf, unsigned short count)
{
 /* this is a special version of put-ring that will load a  
    buffer at a time. This cannot ever EVER be used on a 
    lockable ring! (it will ignore the lock).
    
    How does it work?
    1:  check that there is enough room in the ring for the
    	buffer; if not, revert to a sequence of put_ring()s
    2:	Blast (count-1) characters into the ring.
    3:	use put_ring to put the last character in, so that the
    	unblocking will work right..
 */
 unsigned short flags;
 unsigned short left, size, rcount, head;
 
 	flags = kernel_disable();
 	/* have to do all this without ints.. */ 
 	size = ringptr->size;
 	rcount = ringptr->count;
	left = size - rcount;        
	head = ringptr-> head;
	if (left > count)
		{
		 /* can do it the fast way.. */
		 do 
		 	{
		 	ringptr->buff[head++] = *inbuf++;
		 	count--;         
		 	rcount++;
		 	if (head >= size)
		 		head = 0;
		 	} while (count>1);
		 ringptr->count = rcount;
		 ringptr->head = head;
		 kernel_enable(flags);
		 /* do the final put.. */
		 put_ring(ringptr,inbuf);
		}
	  else
	  	{                     
	  	kernel_enable(flags);
	  	while(count--)
	  		{
	  		put_ring(ringptr,inbuf++);
	  		}
	  	
	  	} 	
}

#else /* this IS an express.. */
void putc(c)
unsigned int c;
{
	unsigned short int count, flags;

	if(KS.cmd_flush == false)
		{
		/* we'll block at this level rather than at interrupt
		   level.. */
		while (	(count = OUT_RING.count) >= (OUT_RING.size-1))
			block(NULL_FP);

		/* deal with CRs.. */
		if ((unsigned char)c == '\n')
			putc('\r');

		put_ring(KS.out_ring,&(unsigned char)c);
		/* if there was nothing in there, turn on the */
		/* TX interrupt. I think ints need to be blocked */
		/* when we do this, though.. */
		flags=kernel_disable();
		if (OUT_RING.count == 1)
			{
			_outp(UART_IER, 
				_inp(UART_IER) | IER_ETBEI);
			/* the int handler is smart enough to handle the */
			/* case where the int really should not have been */
			/* turned on.. */
			}
		kernel_enable(flags);
		}
}

unsigned short int p_putc(c)
unsigned int c;
{
	// returns true (!=0) if there was room, but never calls block
	// (so that it's interrupt-safe..)

	unsigned short int count, flags;

		{
		/* we'll block at this level rather than at interrupt
		   level.. */

		flags=kernel_disable();

		if (	(count = KS.p_out_ring->count) >= (KS.p_out_ring->size-1))
			{
			// the int should never be off while we're
			// waiting for space in the p_out que!
			// (because p_out ignores xoff.)
			// in the case where we're stuck trying to
			// stuff something out, just kick it on.
			_outp(UART_IER, 
				_inp(UART_IER) | IER_ETBEI);
			/* the int handler is smart enough to handle the */
			/* case where the int really should not have been */
			/* turned on.. */
			kernel_enable(flags);
			return(0);
			}

		/* don't deal with CR on the prio que. */

		put_ring(KS.p_out_ring,&(unsigned char)c);
		/* if there was nothing in there, turn on the */
		/* TX interrupt. I think ints need to be blocked */
		/* when we do this, though.. (& they are, from above)*/
		// always turn the int back on (just on a cuzza..)
		// if (KS.p_out_ring->count == 1)
			{
			_outp(UART_IER, 
				_inp(UART_IER) | IER_ETBEI);
			/* the int handler is smart enough to handle the */
			/* case where the int really should not have been */
			/* turned on.. */
			}
		kernel_enable(flags);
		}
}

#endif /*DTEX specific stuff.. */




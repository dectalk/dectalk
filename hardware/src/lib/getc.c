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
 *    File Name:	getc.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  get a character from the console 
 *
 ***********************************************************************
 *    Revision History:
 * 11dec95	...tek		merge dtex
 *
 */


#include "defs.h"
#include "esc.h"
#include "cmd.h"
#include "kernel.h"
#include "dectalk.h"
#include "pcport.h"

#ifndef DTEX /* non-express code */
unsigned int getc()
{
	unsigned char c;

	get_ring(KS.in_ring,&c);
	serial_update();
	return((unsigned int)c & 0xff);
}
#else /* express code */

#include <conio.h>	/* for inp, outp */
#pragma intrinsic(_inp, _inpw, _outp, _outpw)


#define LOW_WATER ((IN_RING_MAX/2)+1)

unsigned int getc()
{
	unsigned char c, count;
	unsigned short int lowater, flags;
	P_RING inringptr;

	inringptr = KS.in_ring;

	lowater = (inringptr->size-16)/4;

	count = inringptr->count;
	/* this semaphore is used to sync up cmd flushing..*/
	if ((KS.halting) && (count==0))
		signal_semaphore(&KS.getc_empty);

	/* XON if we hit low-water OR have exactly 10 characters*/
	/* left (the 10-character point is a failsafe..)*/
	/* but not if we're in a flush, because the flush-done will */
	/* clear that out.*/
	if (
	     ( (count == 10)
		|| (count == lowater) )
	     && !KS.halting
	   )
	    {
	    p_putc(XON); 	/* may fail, but we don't care.*/
	    }
	get_ring(inringptr,&c);

	return((unsigned int)c & 0xff);
}

unsigned int push_inring(string)
unsigned char *string;
{
	/* push a character string into the FRONT of the specified ring*/
	P_RING ring;
	unsigned short int size, flags;
	for (size=0;string[size]!='\0';size++)
		;  /* find the length of the input string.*/
	
	flags=kernel_disable();	/* ints off..*/
	ring = KS.in_ring;

	if (ring->count > (ring->size - size))
		{
		kernel_enable(flags);
		return(0); /* fail.*/
		}

	size--; /* get off the null..*/

	while (size>0)
		{
		ring->buff[ring->tail] = string[size];
		if (ring->tail == 0)
			ring->tail = ring->size;
		ring->tail--;
		ring->count++;
		size--;
		}
	kernel_enable(flags);
	return(1);
}
#endif /*DTEX*/

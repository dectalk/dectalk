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
 *    File Name:	putstr.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  output a string on the console ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * 11dec95	...tek		merge DTEX, correct putc prototype,
 *				remove // comments.
 *
 */


#include "defs.h"
#include "esc.h"
#include "cmd.h"
#include "kernel.h"
#include "dectalk.h"
#include "pcport.h"
#include "libp.h"

void putc(unsigned int);

int putstring(unsigned char *str)
/*unsigned char *str;*/
{
	while(*str)
		putc(*str++);
	return(1);
}

#ifdef DTEX
unsigned short int p_putstring(str)
unsigned char *str;
{
	/* we have to be a little more careful here, to be sure*/
	/* we have enough room to put the whole sequence in the */
	/* ring. Returns false if there isn't room.*/
	unsigned short int i, room, flags;

	/* figure out the string length..*/
	for (i=0;str[i]!='\0';i++)
		;

	/* check the que..*/
	flags = kernel_disable();
	if ((KS.p_out_ring->size - KS.p_out_ring->count) < (i+2))
		{
		kernel_enable(flags);
		return(0); /* no room.*/
		}

	while (*str)
		{
		while(!p_putc(*str)); /* but there should always*/
				      /* be room..!*/ 
		str++;
		}
	kernel_enable(flags);
	return(1);
}
#endif /*DTEX*/

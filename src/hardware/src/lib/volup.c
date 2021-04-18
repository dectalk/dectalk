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
 *    File Name:	volup.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Kernel services ... this is a shared file of common routines that
 * can be included with other processes.  It uses only kernel data
 * structures (KS.xxx) and stack, both of which will resolve at link
 * time.
 *
 ***********************************************************************
 *    Revision History:
 *
 * 24oct95	...tek		added volume mapping for DTPC2
 * 26oct95	...tek		move CS out of the loop for DTPC1
 * 11dec95	...tek		merge dtex, get kernel*() protos from libp.
 * 06aug99	...tek		implenet software volume control
 * EAB		10/28/99		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include	"l_us_ph.h"
#include "pcport.h"
#include	"186.h" 
#include "hardw.h"
#include	"libp.h"

/*                                                               
 *  bump volume up count notches ...
 */

#ifdef SW_VOLUME
/*
 * tek 06aug99
 * the software volume control moves most of the work into vol_set().
 */
vol_up(int count)
{
	int iTemp;
	iTemp = KS.CurrentVolume+count;
	if (iTemp > 99)
		iTemp = 99;
	vol_set(iTemp);
}

#else /*SW_VOLUME*/

#ifdef DTPC2                      
/* this table is a piecewise-linear match to the DTPC1 gain curve */
/* from 0-75, and then a linear run to full volume from 75-100 */
unsigned char volmap[100] =
	{
	0,3,6,10,13,16, /* 0-5 */
	17,19,20,21,22, /* 6-10 */
	24,25,26,27,29, /*11-15 */
	30,31,32,34,35, /*16-20 */
	36,37,39,40,41, /*21-25 */
	41,41,42,42,43, /*26-30 */
	43,44,44,45,46, /*31-35 */
	46,47,47,48,48, /*36-40 */
	49,50,50,51,51, /*41-45 */
	52,52,53,53,54, /*46-50 */
	55,55,56,56,57, /*51-55 */
	57,58,58,59,60, /*56-60 */
	60,61,61,62,62, /*61-65 */
	63,64,64,65,65, /*66-70 */
	66,66,67,67,68, /*71-75 */
	69,71,72,73,74, /*76-80 */
	76,77,78,80,81, /*81-85 */
	82,83,85,86,87, /*86-90 */
	88,90,91,92,94, /*91-95 */
	95,96,97,99     /*96-99 */
	}   ;


vol_up(count)
int count;
{        
   int oldset, newset, newcount;
   oldset = volmap[KS.volume];
   newcount = KS.volume+count; /*calc the absolute setting */
   if (newcount>99)
   	newcount = 99;          
   newset = volmap[newcount];   
   KS.volume = newcount;
   newcount = newset - oldset; /* relative increment */
   set_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
   set_gpio0(LEFT_UP|RIGHT_UP);
   for(;newcount>0;newcount--)
	  {
	  clr_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
	  set_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
	  }     
	  return (1);
}
 
#else /* DTPC2 */

vol_up(count)
int count;
{
#ifndef DTEX /* no vol ctl */
   set_gpio(GPIO_VDIR);    
   clr_gpio(GPIO_VCS); /* move the CS out of the loop. */

	KS.volume += count;
	for(;count>0;count--)
	  {
	  clr_gpio(GPIO_VINC);
	  set_gpio(GPIO_VINC);
	  }     
 	set_gpio(GPIO_VCS);
#endif /*DTEX*/
	return (1);
}

#endif /*DTPC2*/  
#endif /*SW_VOLUME*/



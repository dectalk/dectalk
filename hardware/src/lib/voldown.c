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
 *    File Name:	voldown.c
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
 * 11dec95	...tek		merge dtex, get kernel_enable proto from libp
 * 06aug99	...tek		implement the software volume control
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
 *  bump volume down count notches ...
 */

/* tek 06aug99
 * the SW_VOLUME version is identical for all platforms.. 
 */

#ifdef SW_VOLUME
vol_down(count)
{
	int iTemp;
	iTemp = KS.CurrentVolume-count;
	if (iTemp < 0)
		iTemp = 0;
	vol_set(iTemp);
}

#else /*SW_VOLUME*/

#ifdef DTPC2 
extern unsigned char volmap[];

vol_down(count)
int count;
{       
   	int oldset, newset, newcount;
   	oldset = volmap[KS.volume];       
   	newcount = KS.volume-count;
   	if (newcount < 0) 
   		newcount = 0;
   	newset = volmap[newcount];
   	set_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
   	clr_gpio0(LEFT_UP|RIGHT_UP);
	KS.volume=newcount;
	newcount = oldset - newset;
	if (KS.volume == 0)
		newcount += 100; /* make sure we go all the way to zero. */
	for(;newcount>0;newcount--)
	  {                       
	  clr_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
	  set_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);	  
	  }       
	  return(1);
}
 
#else /* DTPC2 */ 

vol_down(count)
int count;
{
#ifndef DTEX /* has no vol ctl! */
   	clr_gpio(GPIO_VDIR);          
   	/* no need to toggle the CS every increment; pull it out of the loop. */
	clr_gpio(GPIO_VCS);
   	
	KS.volume -= count;
	for(;count>0;count--)
	  {
	  clr_gpio(GPIO_VINC);
	  set_gpio(GPIO_VINC);
	  }     
	  
	set_gpio(GPIO_VCS);
#endif /*DTEX*/	    
	  return(1);
}
 
#endif /* DTPC2 */
#endif /*SW_VOLUME*/
 

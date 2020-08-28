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
 *    File Name:	volset.c
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
 * 26oct95	...tek		made a little smarter..
 * 11dec95	...tek		merge dtex, get kernel_* protos from libp.
 * 06aug99	...tek		implement software volume control
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
 *  set volume to count (range checked, out of range values ignored) ...
 */

#ifdef SW_VOLUME
/*
 * the software volume control is philosophically different from the old
 * volume control. The old (hardware) control was implemented in a 
 * device that could only be stepped and could not be read; therefore, 
 * all the actual "control" was done in the up/down routines. The 
 * software volume control can be directly set, and doesn't have an 
 * intrinsic "step" concept.
 * So, most of the work is done here. The only vestige of the hardware
 * method is that we run the hardware control all he way up to get it
 * out of the way (on those platforms that have a hardware control).
 */
void set_vol_to_max();

/* we need this table to convert to the dB scale the VTM uses for 
 * setting gains.. 
 */
int DBtable[100]= {
	-40,	/*1*/
	-34,	/*2*/
	-30,	/*3*/
	-28,	/*4*/
	-26,	/*5*/
	-24,	/*6*/
	-23,	/*7*/
	-22,	/*8*/
	-21,	/*9*/
	-20,	/*10*/
	-19,	/*11*/
	-18,	/*12*/
	-18,	/*13*/
	-17,	/*14*/
	-16,	/*15*/
	-16,	/*16*/
	-15,	/*17*/
	-15,	/*18*/
	-14,	/*19*/
	-14,	/*20*/
	-14,	/*21*/
	-13,	/*22*/
	-13,	/*23*/
	-12,	/*24*/
	-12,	/*25*/
	-12,	/*26*/
	-11,	/*27*/
	-11,	/*28*/
	-11,	/*29*/
	-10,	/*30*/
	-10,	/*31*/
	-10,	/*32*/
	-10,	/*33*/
	-9,	/*34*/
	-9,	/*35*/
	-9,	/*36*/
	-9,	/*37*/
	-8,	/*38*/
	-8,	/*39*/
	-8,	/*40*/
	-8,	/*41*/
	-8,	/*42*/
	-7,	/*43*/
	-7,	/*44*/
	-7,	/*45*/
	-7,	/*46*/
	-7,	/*47*/
	-6,	/*48*/
	-6,	/*49*/
	-6,	/*50*/
	-6,	/*51*/
	-6,	/*52*/
	-6,	/*53*/
	-5,	/*54*/
	-5,	/*55*/
	-5,	/*56*/
	-5,	/*57*/
	-5,	/*58*/
	-5,	/*59*/
	-4,	/*60*/
	-4,	/*61*/
	-4,	/*62*/
	-4,	/*63*/
	-4,	/*64*/
	-4,	/*65*/
	-4,	/*66*/
	-3,	/*67*/
	-3,	/*68*/
	-3,	/*69*/
	-3,	/*70*/
	-3,	/*71*/
	-3,	/*72*/
	-3,	/*73*/
	-3,	/*74*/
	-2,	/*75*/
	-2,	/*76*/
	-2,	/*77*/
	-2,	/*78*/
	-2,	/*79*/
	-2,	/*80*/
	-2,	/*81*/
	-2,	/*82*/
	-2,	/*83*/
	-2,	/*84*/
	-1,	/*85*/
	-1,	/*86*/
	-1,	/*87*/
	-1,	/*88*/
	-1,	/*89*/
	-1,	/*90*/
	-1,	/*91*/
	-1,	/*92*/
	-1,	/*93*/
	-1,	/*94*/
	0,	/*95*/
	0,	/*96*/
	0,	/*97*/
	0,	/*98*/
	0,	/*99*/
	0	/*100*/
	};


vol_set(int count)
{
	unsigned int temp;
	/* load the shared variables.. */
	if (count > 99) 
		count = 99;
	if (count < 0)
		count = 0;
	KS.CurrentVolume = count;
	KS.volume = count;
	KS.CurrentVolumeDB = DBtable[count];
	/* because the volume change is actually implemented by adjusting
	 * adjusting parameters in the speakerdef that goes to the VTM, 
	 * we need to force a speakerdef load. This should probably be
	 * encapsulated into a routine, because it's used in a LOT of places..
	 */
	temp = LAST_VOICE;
	write_pipe(KS.lts_pipe,&temp,1);
	/* tek 6/24/96 */
	temp = SYNC;
	write_pipe(KS.lts_pipe,&temp,1);

	/* finally, if the hardware control exists, run it up. */
	set_vol_to_max();
}

/* we need this routine to deal with the hardware..*/
void set_vol_to_max()
{
	/* hardware-specific code to set the volume control wide open */
	int temp;
#ifdef DTPC2 /* the dtpc2 version..*/
   set_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
   set_gpio0(LEFT_UP|RIGHT_UP);
   for(temp=0;temp<100;temp++)
	  {
	  clr_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
	  set_gpio0(NOT_LEFT_INC|NOT_RIGHT_INC);
	  }     
#else /*DTPC2*/
#ifndef DTEX /* the dtpc1 version */
   set_gpio(GPIO_VDIR);    
   clr_gpio(GPIO_VCS);
	for(temp=0;temp<100;temp++)
	  {
	  clr_gpio(GPIO_VINC);
	  set_gpio(GPIO_VINC);
	  }     
 	set_gpio(GPIO_VCS);

#endif /*DTEX*/
#endif /*DTPC2*/
}

#else /*SW_VOLUME*/

vol_set(count)
int count;
{
#ifndef DTEX /* no vol ctl.. */
	int oldvol, newstep;
	oldvol = KS.volume;

	if (count==0)
		{
		vol_down(100);/* make sure we don't accumulate error*/
		KS.volume=0;
		}

	else if(count > 0 && count <= 100)
		{
		if (count == 100)
			count = 99; /* its counted 0-99 */
		newstep = count - oldvol;
		if (newstep > 0)
			vol_up(newstep);
		 else if (newstep < 0)
			vol_down(-newstep);
/*		KS.volume = count; volup/down already do this. */
		}
#endif /*DTEX*/
	return (1);
}

#endif /*SW_VOLUME*/

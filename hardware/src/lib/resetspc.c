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
 *    File Name:	resetspc.c
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
 * ...tek 23may95	removed volume changing.
 * 14jul95	...tek		changed to macros for twiddling gpio..
 * 11dec95	...tek		merge dtex, fix kernel*() protos
 * 25oct96      ...gl           rollback 6/24/96 change for DTEX
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include        "l_us_ph.h"
#include "pcport.h"
#include	"186.h"           
#include	"hardw.h"	/* machine defs.. */
#include	"libp.h"


#ifdef DTEX
void spc_clock(state)
unsigned char state;
{
	if (state)
		_outp(PORTB,BIT1|BIT0);
	  else
		_outp(PORTB,0);	

}
#endif /*DTEX*/

int reset_spc(void)
{
	unsigned int temp,old_vol;

/*	old_vol = KS.volume;*/
/*	vol_set(0);            */
                                  
	STOP_SAMPCLK;
	RESET_DSP;
#ifndef DTEX
	/* tek 6/24/96 */
	KS.spc_flush_reset = 1; /* dump all packets until speakerdef */
	RUN_DSP;
	START_SAMPCLK;
	
	KS.spc_sync.value = 0;

	temp = LAST_VOICE;
	write_pipe(KS.lts_pipe,&temp,1);
	/* tek 6/24/96 */
	temp = SYNC;
	write_pipe(KS.lts_pipe,&temp,1);

	wait_semaphore(&KS.spc_sync);
	KS.spc_sync.value = 1;
	
	if(KS.pause)
        {
           STOP_SAMPCLK;
        }
#else
	RUN_DSP;
	START_SAMPCLK;
	if(KS.pause)
        {
           STOP_SAMPCLK;
        }
	temp = LAST_VOICE;
	write_pipe(KS.lts_pipe,&temp,1);
#endif

/*	while(old_vol)*/
/*		{*/
/*		vol_up(1);*/
/*		old_vol -= 1;*/
/*		}         */
	return (1);
}
#ifdef DTEX

void dsp_sleep()
{
	unsigned short int flags;

	/* put the DSP to sleep. */
	flags = kernel_disable();
	set_gpio(DSP_RESET);	// bang.
	_outp(PORTB,0);		// kill the int line.
	set_gpio(V5BOFF);	// power off.
	KS.spc_sleeping = 1;
	KS.spc_waking = 0;
	kernel_enable(flags);
} // dsp_sleep

void dsp_wakeup()
{
	/* wake the DSP up.. */
	unsigned short int flags, i;
	flags = kernel_disable();
	KS.spc_sleeping = 0;
	KS.spc_waking = 1;
	clear_gpio(V5BOFF);	// power up.. 
	while ((read_gpio() & V5BOK) == 0)
		;	/* wait for V5B to come up.. */
	// make sure it has plenty of time to get stable..
	for (i=0;i<50;i++)
		_inp(0xec);	// sit and wait a bit, reading a dummy.
      	set_gpio(DSPDMADONE);
	clear_gpio(DSP_RESET);
      	
	// let the dsp try to come up..
	for (i=0;i<10;i++)
		_inp(0xec);	// sit and wait a bit, reading a dummy.
	
	// sampclk on..
	spc_clock(1);
	kernel_enable(flags);

} //dsp_wakeup

/* this is a hook for power management; unfortunately, a bug in the 82C315
 * makes it impossible to use..
 */
void sysclk_on_off(state)
unsigned short state;
{
#ifdef CHANGE_SYSCLK
	unsigned char temp, oldptr, oldtmp;
	unsigned short flags;
	flags = kernel_disable();
	// have to do this atomically..
	oldptr = _inp(0xEC);	// save the old index reg
	_outp(0xEC,0x13);	// index -> slpctl
	temp = _inp(0xED);	// read it..
	oldtmp = temp;
	if (state)
		temp = temp|(BIT0);	// set ensysck	
	    else
		temp = temp & ~(BIT0);	// clear ensysck
	_outp(0xED, temp);	// put it back.
	temp=_inp(0xED);
	// put back the old index..
	_outp(0xEC,oldptr);
	kernel_enable(flags);
	printf("was %02x is %02x",oldtmp,temp);
#endif
}



#endif /*DTEX*/
	

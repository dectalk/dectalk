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
 *    File Name:	startf.c
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
 *	01 16-MAY-1995 tek Corrected flush done operation.         
 *  14 jul 95	...tek		ripped out machine-specific stuff.
 * 11dec95	...tek		merge dtex, in a heavy handed way;
 *				fix protos for kernel*()
 * 16may96	...tek		move defs for kernel_* in DTEX part
 * 10Jan97      ...GL           change start_flush to "void"
 * EAB		10/28/99		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include        "l_us_ph.h"
#include "pcport.h"
#include	"186.h"    
#include "hardw.h"
#include "libp.h"


#ifndef DTEX /* non-express code.. */
/*
 *  start a system wide buffer flush ...
 */

void start_flush(int serial_mode)
/*int	serial_mode;*/
{

	unsigned int		temp,flags;
	int					old_volume,old_log;
/*	PCB _far 	*sw;*/


	status_set_update(STAT_flushing);

	flags=kernel_disable();

	old_volume = KS.volume;
	old_log = KS.logflag;
	KS.logflag = 0;
	vol_set(0);

	if(serial_mode == false)
		{
		KS.cmd_flush = CMD_flush_toss;
		flush_ring(KS.in_ring);
		status_set(STAT_rr_char);					 
		}

	flush_ring(KS.out_ring);
	KS.spc_flush_type = SPC_flush_all;
	KS.spc_flush = true;
	KS.halting = true;

#ifdef SW_VOLUME
	/* check for a tone here.. */
	while (KS.mtone_running)
	{
		kernel_enable(flags);
		sleep(1);
		flags = kernel_disable();
	}
#endif /*SW_VOLUME*/

	flush_pipe(KS.lts_pipe);
	flush_pipe(KS.ph_pipe);

	if(KS.spc_sync.queue)
		signal_semaphore(&KS.spc_sync);
	if(KS.spc_resume.queue)
		signal_semaphore(&KS.spc_resume);


/*
 *  hack time ... now the pipes may be waiting for some data (psnextra is
 *  was set, so push some data through the pipe to insure we see the sync
 *  pop out ...
 */
	
	STOP_SAMPCLK;
	KS.spc_sync.value = 0;
	temp = LAST_VOICE;						/* tek 7/20/94*/
	write_pipe(KS.lts_pipe, &temp, 1); 	/* tek 7/20/94 */
	temp = ((PFASCII<<PSFONT)+0xb);
	write_pipe(KS.lts_pipe,&temp,1);
	temp = SYNC;
	write_pipe(KS.lts_pipe,&temp,1);

	kernel_enable(flags);
	START_SAMPCLK;
	wait_semaphore(&KS.spc_sync);
	KS.spc_sync.value = 1;
	flags=kernel_disable();

	KS.spc_flush = false;
	KS.halting = false;
	KS.logflag = old_log;

	reset_spc();
	vol_set(old_volume);  
	flush_done();
	kernel_enable(flags);
	return;
}
#else /*end of non-express code, start of express code. */
#include <conio.h>	/* for inp, outp */
#pragma intrinsic(_inp, _inpw, _outp, _outpw)

void kernel_enable(unsigned int);
unsigned int kernel_disable();


// we need writeDMAreg to do some of this..
/* this is also where these fucntions are globally defined, so that they */
/* show up in the library. They should be somewhere else, but.. */
void writeDMAreg(addr,data)
unsigned short addr;
unsigned short data;
{
	unsigned short int flags;
	flags = kernel_disable(); // needs to be atomic..
	_outp(DMA_CLRPTR, 0);
	_outp(addr, (unsigned short)data&0xFF);
	_outp(addr, (unsigned short)(data>>8)&0xff);
	kernel_enable(flags);
}

unsigned short readDMAreg(addr)
unsigned short addr;
{
	unsigned short int flags, temp;
	flags = kernel_disable(); // needs to be atomic..
	_outp(DMA_CLRPTR, 0);
	temp = _inp(addr);
	temp = (_inp(addr)<<8)|temp;
	kernel_enable(flags);
	return(temp);
}

/*
 *  start a system wide buffer flush ...
 */

void start_flush(serial_mode)
int	serial_mode;
{

	unsigned int		temp,flags,wasempty;
	int					old_volume,old_log;
	PCB _far 	*sw;
        unsigned char	tempc;                                        
                                      
	// we should never do a serial flush. This is a bad thing to do,
	// because things like the command parser will get completely
	// wedged. So, if serial_mode is true, just return.
//	if (serial_mode)
//		return;

	status_set(STAT_flushing);

	flags=kernel_disable();
	
	// the wasempty optimizaton gets subverted below in an 
	// attempt to get the commande partser to never get stuck
	// in square-bracket mode.. but we'll leave it in here for
	// now in case the parser ever gets fixed..

	wasempty = (KS.in_ring->count == 0);

	old_volume = KS.volume;
	old_log = KS.logflag;
	KS.logflag = 0;
	vol_set(0);

	//stop_dsp_clock
       _outp(PORTB,_inp(PORTB)&~BIT0);

	if(serial_mode == false)
		{
		KS.cmd_flush = CMD_flush_toss;
		flush_ring(KS.in_ring);
		status_set(STAT_rr_char);
		}

	// Have to jam a ] into the parser to make sure it wasn't
	// in the middle of a [: command. Hopefully this won't
	// break anything (this should really be fixed in the 
	// parser..)
	tempc = ']';
	put_ring(KS.in_ring,&tempc);


	flush_ring(KS.out_ring);
	KS.spc_flush_type = SPC_flush_all;
	KS.spc_flush = true;
	KS.halting = true;

	// flush the pipes so that nothing else will happen, and to be
	// sure we won't get stuck when we try to write to them..
	flush_pipe(KS.lts_pipe);
	flush_pipe(KS.ph_pipe);
	// always have to push a sync through to make sure the isn't
	// a control waiting for a parameter.. Because the event
	// that started the flush could have left nextitem() with
	// something hanging, we need to make sure that we have an 
	// unambigugus control as the very first thing out of the pipe
	// after the flush. Putting it in lts_pipe will make it 
	// propagate through ph_pipe and clean out any hidden state there.
	temp = SYNC;
	write_pipe(KS.lts_pipe,&temp,1);

	if(KS.spc_sync.queue)
		signal_semaphore(&KS.spc_sync);
	if(KS.spc_resume.queue)
		signal_semaphore(&KS.spc_resume);


/*
 *  hack time ... now the pipes may be waiting for some data (psnextra is
 *  was set, so push some data through the pipe to insure we see the sync
 *  pop out ...
 */

	// here we have to signal the DMA semaphore, because we need to make
	// sure that we're not sitting around waiting for a packet to DMA
	// (which won't happen because we've stopped the clock..)
	signal_semaphore(&KS.spc_dma);

	/* reset the DMA channel */
	_outp(DMA_SINGLE_MASK,7);	/* mask channel 3 */
	writeDMAreg(DMA7_COUNT, 0xFFFF);/* fake the done count */


	// when we turn on interrupts, everything will schedule through
	// and do whatever initialization needs to happen..

	KS.spc_sync.value = 0;

	// the command parser (cmd_pars) runs at a low priority, so we have
	// to stuff a character in the input ring and then wait for it
	// to get pulled out. getc() will set the getc_empty semaphore
	// when it is about to do a get_ring that will block because of
	// an empty ring; so, the net effect is that the semaphore will
	// set after cmd_pars has *processed* the ^k that we stuffed in. 
	// this should clear out all the crap in the cmd part of the pipe,
	// so that we can later clear it out of the lts and ph pipes and 
	// restart cleanly.
	//but...
	// nobody will take the characters if serial mode is true. because
	// that means we got a [:flush x] to process and we're sitting in
	// the commmand parser waiting for this to finish!
	//also, 
	// we don't have to do this if the input ring was already empty.
	// (this is a flush-speak-char optimization..)
	if (!serial_mode && !wasempty)
		{
		KS.getc_empty.value=0; 	// init the flag that tells us we
					// got the character..
		// push a sync into the command parser..
		tempc = 0xb; //VT
		put_ring(KS.in_ring,&tempc);
		kernel_enable(flags);
		wait_semaphore(&KS.getc_empty);  // we pulled the chars out
						 // and came back for more..
		flags=kernel_disable();
		}

	// because there is someone somewhere in the command path that 
	// eats SYNCs, we always have to push the sync through this way.
	// it should be quick, though, because everything should be
	// flushed out in the (!serial_mode) case, which is the one
	// that needs to be fast..
	// at any rate, we wait for the sync to fall out the other end
	// (at spc_driv) before we continue here; that's the signal that
	// we've flushed absolutely everything out.

	// there is probably crap in one of these pipes from cmd..
	flush_pipe(KS.lts_pipe);
	flush_pipe(KS.ph_pipe);

	// have to push the SYNC first; otherwise we could have a 
	// waiting parser which thinks the 0xb is a parameter..
	temp = SYNC;
	write_pipe(KS.lts_pipe,&temp,1);
	temp = ((PFASCII<<PSFONT)+0xb);
	write_pipe(KS.lts_pipe,&temp,1);
	kernel_enable(flags);
	//OK, now, in either case we should get a SYNC out the tailpipe..

	wait_semaphore(&KS.spc_sync);
	KS.spc_sync.value = 1;
	flags=kernel_disable();

	KS.spc_sync.value = 0;

	// make sure the voice gets set..
	// need to do this while ints are disabled, so that we can make
	// sure the toss-until-you-see-speakerdef code in spc_driv
	// doesn't get cleared out by something coming through before we
	// actually reset the DSP..
	flush_pipe(KS.lts_pipe);
	flush_pipe(KS.ph_pipe);
	flush_ring(KS.in_ring);
	temp = LAST_VOICE;
	write_pipe(KS.lts_pipe,&temp,1);
	// and flush it out the exhaust..
	temp = ((PFASCII<<PSFONT)+0xb);
	write_pipe(KS.lts_pipe,&temp,1);
	temp = SYNC;
	write_pipe(KS.lts_pipe,&temp,1);


	KS.cmd_flush = false;

	KS.spc_flush = false;
	KS.halting = false;
	KS.logflag = old_log;
	KS.spc_flush_reset=true; 	// set this flag to make sure the
					// DSP gets a speakerdef before 
					// anything else.. the LAST_VOICE
					// above should cause that.

	reset_spc();

	// we have to fake the first DMA completion, so that the 
	// wait_semaphore will fall through in spc_driv.
	signal_semaphore(&KS.spc_dma);

	// restart the sample clock..
	_outp(PORTB,_inp(PORTB)|BIT0);

	vol_set(old_volume);

	flush_done();
	kernel_enable(flags);
	// XON the serial channel..
	p_putc(XON);  // we know there must be room by now.

}

#endif /*DTEX*/

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
 *    File Name:	kernserv.c
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
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include	"eng_phon.h"
#include "pcport.h"
#include	"186.h"

#ifdef	SIMULATOR
#include <stdio.h>
#define	port_out_186(p1,p2)
#endif


//void kernel_enable(unsigned int);
//unsigned int kernel_disable();

/*
 *  bump volume up count notches ...
 */

vol_up(count)
short count;
{
#ifndef	SIMULATOR

   set_gpio(GPIO_VDIR);
	KS.volume += count;
	for(;count>0;count--)
	  {
	  clr_gpio(GPIO_VCS);
	  clr_gpio(GPIO_VINC);
	  set_gpio(GPIO_VINC);
	  set_gpio(GPIO_VCS);
	  }
#endif
}

/*
 *  bump volume down count notches ...
 */

vol_down(count)
short count;
{
#ifndef	SIMULATOR

	clr_gpio(GPIO_VDIR);
	KS.volume -= count;
	for(;count>0;count--)
	  {
	  clr_gpio(GPIO_VCS);
	  clr_gpio(GPIO_VINC);
	  set_gpio(GPIO_VINC);
	  set_gpio(GPIO_VCS);
	  }

#endif
}

/*
 *  set volume to count (range checked, out of range values ignored) ...
 */

vol_set(count)
short count;
{
#ifndef	SIMULATOR

	if(count >= 0 || count <= 100)
		{
		vol_down(100);
		vol_up(count);
		KS.volume = count;
		}

#endif
}

/*
 *  allocating and sending packets to the spc driver ...
 */

#ifndef SIMULATOR

short	spc_dma_lengths[] = { 18, 22, 11, 0, 1, 0, 0, 0, 0 };

short _far *spcget(spc_type)
unsigned short spc_type;
{
#ifdef	SIMULATOR
	printf("kernserv: spcget() invoked\n");
	return (0);
#else
	struct spc_packet _far *spc_pkt;

	spc_pkt = wait_queue(&KS.spc_pool);
	(*spc_pkt).type = spc_type;
	(*spc_pkt).length = spc_dma_lengths[spc_type];
	return((short far *)&(*spc_pkt).data[0]);
#endif
}

void spcwrite(spc_data)
unsigned short _far *spc_data;
{
#ifdef	SIMULATOR
//	prshortf ("kernserv: spcwrite() invoked\n");
#else
	spc_data -= SPC_DATA_OFFSET/2;
	if(signal_queue(&KS.spc_active,spc_data))
		block(NULL_FP);
#endif
}

#endif
/*
 *  Index marks are now handled a bit diferently ... they are flushed out
 *  tighter to the spc processing the phoneme, so they are saved in a
 *  pending queue until the phoneme is ready to be placed in the spc
 *  queue, they are placed in the spc queue, and the spc driver flushes
 *  them out as the data is processed ..
 *
 *  data field usage ...
 *
 *  data[0] == symbol marker (lts-phmain-phsort)
 *  data[1] == index style (mark or reply) 
 *  data[2] == index value (user specified)
 *  data[3] == reply style (escape, text or pause) 
 *  data[4] == phone offset (phsort converts) 
 *  data[5] == allophone offset (phalloph converts)
 *
 */
#ifndef NO_INDEXES
void save_index(sym,type,value,how)
unsigned short sym,type,value,how;
{
#ifdef	SIMULATOR
	printf ("kernserv: save_index() invoked\n");
#else
	struct spc_packet _far *spc_pkt;

	spc_pkt = wait_queue(&KS.spc_pool);
	(*spc_pkt).type = SPC_type_index;
	(*spc_pkt).data[0] = sym;
	(*spc_pkt).data[1] = type;
	(*spc_pkt).data[2] = value;
	(*spc_pkt).data[3] = how;
	(*spc_pkt).data[4] = sym;
	(*spc_pkt).data[5] = sym;
	signal_queue(&KS.index_pending,spc_pkt);
#endif
}

void check_index(which_phone)
unsigned short which_phone;
{
#ifdef	SIMULATOR
	printf ("kernserv: check_index() invoked\n");
#else
	struct spc_packet _far *spc_pkt;

	while((spc_pkt = (struct spc_packet _far *)KS.index_pending.head) != NULL_SPC_PACKET)
		{
		if((*spc_pkt).data[5] > which_phone)
			break;
		spc_pkt = wait_queue(&KS.index_pending);
		signal_queue(&KS.spc_active,spc_pkt);
		}
#endif
}

void adjust_index(which,direction)
unsigned short which;
short direction;
{
	struct spc_packet _far *spc_pkt;
	if((spc_pkt = (struct spc_packet _far *)KS.index_pending.head) != NULL_SPC_PACKET)
		{
		while(spc_pkt != NULL_SPC_PACKET)
			{
			if((*spc_pkt).data[0] >= which)
				{
				(short)(*spc_pkt).data[0] += direction;
				(short)(*spc_pkt).data[4] += direction;
				(short)(*spc_pkt).data[5] += direction;
				}
			spc_pkt = (struct spc_packet _far *)(*spc_pkt).link;
			}
		}
}

void	set_index_phone(nsym,nphone)
unsigned short nsym
unsigned char nphone;
{
	struct spc_packet _far *spc_pkt;

	if((spc_pkt = (struct spc_packet _far *)KS.index_pending.head) != NULL_SPC_PACKET)
		{
		printf("ahhhhh");
		while(spc_pkt != NULL_SPC_PACKET)
			{
			if((*spc_pkt).data[0] == nsym)
				(*spc_pkt).data[4] = nphone;
			spc_pkt = (struct spc_packet _far *)(*spc_pkt).link;
			}
		}
}

void	set_index_allo(nphone,nallo)
unsigned short nallo,nphone;
char nphone;
{
	struct spc_packet _far *spc_pkt;

	if((spc_pkt = (struct spc_packet _far *)KS.index_pending.head) != NULL_SPC_PACKET)
		{
		while(spc_pkt != NULL_SPC_PACKET)
			{
			if((*spc_pkt).data[4] == nphone)
				(*spc_pkt).data[5] = nallo;
			spc_pkt = (struct spc_packet _far *)(*spc_pkt).link;
			}
		}
}

/*
 *  common routine to send an index back ...
 */

void send_index(how,value)
short how;
short value;
{
#ifdef	SIMULATOR
	printf("kernserv: send_index()\n");
#else
	SEQ	seq;

	WAIT_PRINT;
	if(how == ESCAPE_OUTPUT)
		{
		seq.s_type   = DCS;
		seq.s_pintro = 0;
		seq.s_final  = DCS_F_DECTALK;
		seq.s_ninter = 0;
		seq.s_nparam = 3;
		seq.s_dflag[0] = FALSE;
		seq.s_param[0] = P1_DECTALK;
		seq.s_param[1] = R2_IX_REPLY;
		seq.s_dflag[1] = FALSE;
		seq.s_param[2] = value;
		seq.s_dflag[2] = FALSE;
		if (seq.s_param[2] == 0)
			seq.s_dflag[2] = TRUE;
		putseq((SEQ _far *)&seq);
		seq.s_type = ST;
		putseq((SEQ _far *)&seq);
		}
	else
		printf("\n[:index %d]",value);
	SIGNAL_PRINT;
#endif
}	

#endif
/*
 *  start a system wide buffer flush ...
 */

#ifndef NO_CMD
start_flush(serial_mode)
short	serial_mode;
{

	unsigned short		temp;//,flags;
	short					old_volume,old_log;
//	PCB _far 	*sw;


	status_set_update(STAT_flushing);

//	flags=kernel_disable();

	old_volume = KS.volume;
	old_log = KS.logflag;
	KS.logflag = 0;
	vol_set(0);

	if(serial_mode == false)
		{
		KS.cmd_flush = CMD_flush_toss;
#ifndef SINGLE_THREADED
		flush_ring(KS.in_ring);
#endif
		status_set(STAT_rr_char);
		}

#ifndef SINGLE_THREADED
	flush_ring(KS.out_ring);
#endif
	KS.spc_flush_type = SPC_flush_all;
	KS.spc_flush = true;
	KS.halting = true;

#ifndef SINGLE_THREADED
	flush_pipe(KS.lts_pipe);
	flush_pipe(KS.ph_pipe);
#endif


#ifndef	SIMULATOR
	if(KS.spc_sync.queue)
		signal_semaphore(&KS.spc_sync);
	if(KS.spc_resume.queue)
		signal_semaphore(&KS.spc_resume);
#endif

/*
 *  hack time ... now the pipes may be waiting for some data (psnextra is
 *  was set, so push some data through the pipe to insure we see the sync
 *  pop out ...
 */

#ifndef	SIMULATOR
	set_gpio(GPIO_STOP);
#endif

	KS.spc_sync.value = 0;
	temp = ((PFASCII<<PSFONT)+0xb);
#ifdef SINGLE_THREADED
	lts_loop(&temp);
#else
	write_pipe(KS.lts_pipe,&temp,1);
#endif
	temp = SYNC;
#ifdef SINGLE_THREADED
	lts_loop(&temp);
#else
	write_pipe(KS.lts_pipe,&temp,1);
#endif
//	kernel_enable(flags);
#ifndef	SIMULATOR
	wait_semaphore(&KS.spc_sync);
#endif
	KS.spc_sync.value = 1;
//	flags=kernel_disable();

	KS.spc_flush = false;
	KS.halting = false;
	KS.logflag = old_log;

	reset_spc();
	vol_set(old_volume);
//	kernel_enable(flags);
}

reset_spc()
{
	unsigned short temp,old_vol;

	old_vol = KS.volume;
	vol_set(0);
#ifndef	SIMULATOR
	clr_gpio(GPIO_RESET+GPIO_STOP);
	set_gpio(GPIO_RESET+GPIO_STOP);
	if(KS.pause)
		clr_gpio(GPIO_STOP);
#endif
	temp = LAST_VOICE;
//	write_pipe(KS.lts_pipe,&temp,1);
	while(old_vol)
		{
		vol_up(1);
		old_vol -= 1;
		}
}

#endif
	
#ifndef	SIMULATOR
/*
 *  become the default language ...	the first language to have both
 *  ph and lts loaded and running become the default ...
 */

default_lang(lang_code,ready_code)
unsigned short lang_code,ready_code;
{
	unsigned short flags;
	volatile struct dtpc_language_tables _far *cp;

	KS.lang_ready[lang_code] |= ready_code;
//	flags=kernel_disable();
	if(KS.lang_ready[lang_code] == LANG_both_ready && (KS.lang_curr == LANG_none || ready_code == 0))
		{
		KS.lang_curr = lang_code;
		KS.lts_pipe = KS.lang_lts[lang_code];
		KS.ph_pipe = KS.lang_ph[lang_code];

		cp = KS.loaded_languages;
		while(cp != NULL_LT)
			{
			if((*cp).lang_id == lang_code)
				{
				KS.ascky = (*cp).lang_ascky;
				KS.ascky_size = (*cp).lang_ascky_size;
				KS.reverse_ascky = (*cp).lang_reverse_ascky;
//				KS.arpabet = (*cp).lang_arpabet;
//				KS.arpa_size = (*cp).lang_arpa_size;
//				KS.arpa_case = (*cp).lang_arpa_case;
				KS.typing_table = (*cp).lang_typing;
				KS.error_table = (*cp).lang_error;
//				}
			cp = (*cp).link;
			}
		}
//	kernel_enable(flags);
}
#endif

/*
 *  flush_done() clears the flushing bit and allows the command processor
 *  to restart ...
 */

void flush_done()
{
	KS.cmd_flush = false;
	KS.spc_sync.value = 0;
	status_clear_update(STAT_flushing);
}

/*
 *  locked status manipulation routines ...
 */
status_set(bits)
unsigned short bits;
{
//	unsigned short flags;

//	flags=kernel_disable();
	KS.isa_status |= bits;
	KS.isa_status |= STAT_new_status;
//	kernel_enable(flags);
}

status_clear(bits)
unsigned short bits;
{
//	unsigned int flags;

	bits = ~bits;
//	flags=kernel_disable();
	KS.isa_status &= bits;
	KS.isa_status |= STAT_new_status;
//	kernel_enable(flags);
}

status_abs(bits)
unsigned short bits;
{
//	unsigned int flags;

//	flags=kernel_disable();
	KS.isa_status = bits;
	KS.isa_status |= STAT_new_status;
//	kernel_enable(flags);
}

status_toggle(bits)
unsigned short bits;
{
//	unsigned int flags;

//	flags=kernel_disable();
	KS.isa_status = (KS.isa_status ^ bits);
	KS.isa_status |= STAT_new_status;
//	kernel_enable(flags);
}

status_set_update(bits)
unsigned short bits;
{
//	unsigned int flags;

//	flags=kernel_disable();
	KS.isa_status |= bits;
	KS.isa_status |= STAT_new_status;
	port_out_186(ISA_STATUS,KS.isa_status);
//	kernel_enable(flags);
}

status_clear_update(bits)
unsigned short bits;
{
//	unsigned int flags;

	bits = ~bits;
//	flags=kernel_disable();
	KS.isa_status &= bits;
	KS.isa_status |= STAT_new_status;
	port_out_186(ISA_STATUS,KS.isa_status);
//	kernel_enable(flags);
}

status_abs_update(bits)
unsigned short bits;
{
//	unsigned int flags;

//	flags=kernel_disable();
	KS.isa_status = bits;
	KS.isa_status |= STAT_new_status;
	port_out_186(ISA_STATUS,KS.isa_status);
//	kernel_enable(flags);
}

status_toggle_update(bits)
unsigned short bits;
{
//	unsigned int flags;

//	flags=kernel_disable();
	KS.isa_status = (KS.isa_status ^ bits);
	KS.isa_status |= STAT_new_status;
	port_out_186(ISA_STATUS,KS.isa_status);
//	kernel_enable(flags);
}

void serial_update()
{
//	unsigned int flags;

//	flags=kernel_disable();
	KS.isa_status &= ~(STAT_tr_char|STAT_rr_char);
	if(IN_RING.count < IN_RING_MAX)
		KS.isa_status |= STAT_rr_char;
	if(OUT_RING.count)
		KS.isa_status |= STAT_tr_char;
	KS.isa_status |= STAT_new_status;
	port_out_186(ISA_STATUS,KS.isa_status);
//	kernel_enable(flags);

}


#ifdef DECTALK_KERNEL
unsigned short kernel_disable()
{
#ifndef	SIMULATOR
	_asm	pushf
	_asm	cli
	_asm	pop	ax
#endif
}

void kernel_enable(flags)
unsigned short flags;
{
#ifndef	SIMULATOR
	_asm	mov	ax,flags
	_asm	push	ax
	_asm	popf
#endif
}
#endif

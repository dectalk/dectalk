/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	spc_driv.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk-pc spc driver ...  
 *
 ***********************************************************************
 *    Revision History:
 * 001	16jul95		tek 	added hardw.h + related changes for dtpc2
 * 002	18jul95     tek     added load of DSP for dtpc2
 * 003	09aug95     tek     fix DSP DMA INT prio from DTPC1
 * 004	15spe95     jdb     replaced the dtpc1 calls to SAMPCLK and DSP
 *                          macros with new S_GPIO and C_GPIO macros from
 *                          hardw.h - fixes dtdemo speech.
 * 005	25oct95		tek		file revert to remove 9/15/95 changes.
 * 006	14dec95		tek		merge dtex
 * 007	26apr95		tek		fix tone packet (hack) to make up for DSP fumble..
 * 008	19nov98		tek		fix digitized mode to not hang when starved for data (NWS "buzz")
 * 009 	10/16/00	CAB		Changed copyright info
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "esc.h"
#include "pcport.h"
#include	"186.h"
#include "kernp.h"      
#include <conio.h> /* for inpw, outpw */
#pragma intrinsic(_inpw, _outpw, _inp, _outp)
#include	"hardw.h"

#ifdef DTEX
unsigned short int can_beep=0;
#endif /*DTEX*/

int initcnt=22;
int blockflag =0;
int icnt=0;
extern int digfcnt;

#ifdef DTPC2
/* way big pile o'bits.. */
#define DSP_RAM_SIZE	(8*1024)
#define SPC_CODE_LEN	(4*1024) /* in words.. */
unsigned char spc_code[] =
#include "spc.h"	/* this defines the unsigned char array spc_code[]*/


#endif /* DTPC2 */

#ifdef DTPC2
void write_dsp_ram(short addr, short data)
{            
	RESET_DSP;
	_outpw(SPCIO,data);
	_outpw(SRAM_ADDR,addr);
	set_gpio2(WRITE_SRAM);
	clr_gpio2(WRITE_SRAM);

}
short read_dsp_ram(short addr)
{
	short i;           
	RESET_DSP;
	_outpw(SRAM_ADDR,addr);
	set_gpio2(READ_SRAM);
	clr_gpio2(READ_SRAM);
	i=_inpw(SPCIO);
	return(i);

}
#endif /*DTPC2 */

/*
 *  init the spc and build the packet queue ...
 */

/*extern volatile*/ int change_spc_rate;

void init_spc(void)
{
	struct spc_packet _far *spc_pkt;
	struct dgt_packet _far *dgt_pkt;
	volatile int _far *dma_addr;
	int	i;
	long	dma_phys_addr;
	long	pkt_phys_addr;
	
/*
 *  stop the spc, kill the dma, reset the spc, then stop it again ...
 */
 	STOP_SAMPCLK;
 	RESET_DSP;

#ifdef DTPC2
/*
 * at this point, load the default DSP code into bank 0 and leave the
 * SRAM Adress register pointing to bank 0.          
 * 
 * the bytes are swapped in the SPC.H file (because they are bytes, 
 * not words), so we unswap them here..
 */
	for (i=0;i<SPC_CODE_LEN;i++)
		{
		unsigned short int k;
		k = spc_code[(2*i)+1] | (spc_code[2*i]<<8);
		write_dsp_ram(i|BIT13,k);
		}
	/* dummy read to zero the pointer.. */
	read_dsp_ram(0|BIT13);

#endif /* DTPC2 */

#ifdef DTEX
	spc_rate(0); /* make sure timers and clocks are up */
	spc_clock(0);
	/* initialize the flags that are used to manage sleeping.. */
	KS.idleflag = 0;
	KS.spc_sleeping = 0;
	KS.spc_waking = 0;
	do
		{
		set_gpio(DSP_RESET);		// reset the DSP.
		dma_init();			// kill and reinit the DMA ctlr
		clear_gpio(V5BOFF);		// make sure the power is on
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

		// make sure it's alive..
		if (read_gpio() & 0x80)
			{
			printf ("init_spc: DSP error.\n");
			}
		} while (read_gpio() & 0x80);

#else /*DTEX*/
 	RUN_DSP;
 	START_SAMPCLK;
 	
	port_out_186(R186_DMA0_CW,CHG);
	port_out_186(R186_DMA0_TC,0);

	STOP_SAMPCLK;
 	RESET_DSP;  
#endif /*DTEX*/

 	RUN_DSP;
 	START_SAMPCLK;
 
/*
 *  clear the control flags ...
 */

	KS.spc_flush = false;
#ifdef DTEX
	KS.spc_flush_reset = false;
#endif /*DTEX*/

/*
 *  These queue semaphores hold the spc packets ...
 */

	KS.spc_pool.head = NULL_QS;
	KS.spc_pool.tail = (QUEUE_SEMAPHORE _far *)&KS.spc_pool.head;
	KS.spc_pool.process = NULL_PCB;
	KS.spc_active.head = NULL_QS;
	KS.spc_active.tail = (QUEUE_SEMAPHORE _far *)&KS.spc_active.head;
	KS.spc_active.process = NULL_PCB;

	KS.dgt_pool.head = NULL_QS;
	KS.dgt_pool.tail = (QUEUE_SEMAPHORE _far *)&KS.dgt_pool.head;
	KS.dgt_pool.process = NULL_PCB;
	KS.dgt_active.head = NULL_QS;
	KS.dgt_active.tail = (QUEUE_SEMAPHORE _far *)&KS.dgt_active.head;
	KS.dgt_active.process = NULL_PCB;

	KS.index_pending.head = NULL_QS;
	KS.index_pending.tail = (QUEUE_SEMAPHORE _far *)&KS.index_pending.head;
	KS.index_pending.process = NULL_PCB;
	KS.index_active.head = NULL_QS;
	KS.index_active.tail = (QUEUE_SEMAPHORE _far *)&KS.index_active.head;
	KS.index_active.process = NULL_PCB;
    
/*
 *  allocate the packets, precompute the dma addresses, and queue to free
 *  pool ...
 */

	spc_pkt = malloc(SPC_PACKET_POOL);
	dma_addr = &(*spc_pkt).type;
	dma_phys_addr = (((long)FP_SEG(dma_addr))<<4)+((long)FP_OFF(dma_addr));
	pkt_phys_addr = (((long)FP_SEG(spc_pkt))<<4)+((long)FP_OFF(spc_pkt));

	for(i=0;i<MAX_SPC_PACKETS;i++)
		{
		FP_SEG(spc_pkt) = (unsigned int)(pkt_phys_addr >> 4) & 0xffff;
		FP_OFF(spc_pkt) = (unsigned int)(pkt_phys_addr & 0xf);
		(*spc_pkt).low_addr = (unsigned int)(dma_phys_addr & 0xffff);
		(*spc_pkt).high_addr = (unsigned int)(dma_phys_addr >> 16) & 0xffff;
		signal_queue(&KS.spc_pool,spc_pkt);
		pkt_phys_addr += sizeof(struct spc_packet);
		dma_phys_addr += sizeof(struct spc_packet);
		}

	dgt_pkt = malloc(DGT_PACKET_POOL);
	dma_addr = &(*dgt_pkt).data[0];
	dma_phys_addr = (((long)FP_SEG(dma_addr))<<4)+((long)FP_OFF(dma_addr));
	pkt_phys_addr = (((long)FP_SEG(dgt_pkt))<<4)+((long)FP_OFF(dgt_pkt));

	for(i=0;i<MAX_DGT_PACKETS;i++)
		{
		FP_SEG(dgt_pkt) = (unsigned int)(pkt_phys_addr >> 4) & 0xffff;
		FP_OFF(dgt_pkt) = (unsigned int)(pkt_phys_addr & 0xf);
		(*dgt_pkt).low_addr = (unsigned int)(dma_phys_addr & 0xffff);
		(*dgt_pkt).high_addr = (unsigned int)(dma_phys_addr >> 16) & 0xffff;
		signal_queue(&KS.dgt_pool,dgt_pkt);
		pkt_phys_addr += sizeof(struct dgt_packet);
		dma_phys_addr += sizeof(struct dgt_packet);
		}

/*
 *  set the static parts of the dma engine and start the spc ...
 */

#ifndef DTEX
 	port_out_186(R186_DMA0_DPL,SPCIO);
 	port_out_186(R186_DMA0_DPH,0);
#endif /*DTEX*/
/*
 *  connect the dma semaphore ...
 */

	KS.spc_dma.value = 1;
	KS.spc_dma.queue = NULL_PCB;
#ifndef DTEX
   	connect_sem(10,&KS.spc_dma);
	port_out_186(R186_INT_DMA0,0x3); /* ...tek 8/9/95 */
#else /*DTEX*/
   	connect_sem(IRQ7_VEC,&KS.spc_dma);
	/* enable the interrupt.. */
	enable_int(IRQ7_MASK);

	// have to signal the semaphore for the first run through.. 
	signal_semaphore(&KS.spc_dma);
#endif /*DTEX*/


/*
 *  init the sync and wait semaphores ...
 */

 	KS.spc_sync.value = 0;
	KS.spc_sync.queue = NULL_PCB;
 	KS.spc_resume.value = 0;
	KS.spc_resume.queue = NULL_PCB;
  	KS.text_sync.value = 0;
	KS.text_sync.queue = NULL_PCB;


/*
 *  let the spc run ...
 */
 
	RUN_DSP;
	START_SAMPCLK;

}


/*
 *  the spc_task() is it's own far process that manages the spc when it
 *  starts ...
 */
#ifndef DTEX 	/* the express and PC are quite different, so this is a  */
		/* wholesale replacement.. */
void _far spc_task(void)
{
	struct spc_packet _far *spc_pkt;
	struct spc_packet _far *last_pkt;
	/*int	i;*/
	unsigned int flags;

	last_pkt = wait_queue(&KS.spc_pool);
	while(true)
		{

		spc_pkt = wait_queue(&KS.spc_active);

/*
 *  sync packet always happen ...
 */

		if((*spc_pkt).type == SPC_type_sync)
			{
			signal_semaphore(&KS.spc_sync);
			signal_queue(&KS.spc_pool,spc_pkt);
			continue;
			}
/*
 *  are we flushing, if so just requeue the packets in the free pool ...
 */

		if(KS.spc_flush)
			{
			if(KS.spc_flush_type == SPC_flush_all || (*spc_pkt).type != SPC_type_index)
				{
				signal_queue(&KS.spc_pool,spc_pkt);
				continue;
				}
			else if(KS.spc_flush_type == SPC_flush_until)
				{
				if((*spc_pkt).data[2] == KS.spc_flush_value)
					{
					signal_queue(&KS.index_active,spc_pkt);
					KS.spc_flush = false;
					reset_spc();
					}
				else
					signal_queue(&KS.spc_pool,spc_pkt);
				continue;
				}
			else if(KS.spc_flush_type == 	SPC_flush_mask	)
				{
				if((*spc_pkt).data[2] & KS.spc_flush_value)
					{
					signal_queue(&KS.index_active,spc_pkt);
					KS.spc_flush = false;
					reset_spc();
					}
				else
					signal_queue(&KS.spc_pool,spc_pkt);
				continue;
				}
			else if(KS.spc_flush_type == SPC_flush_after)
				{
				if((*spc_pkt).data[2] == KS.spc_flush_value)
					{
					signal_queue(&KS.index_active,spc_pkt);
					KS.spc_flush_type = SPC_flush_all;
					signal_semaphore(&KS.spc_sync);
					}
				}
			}

/*
 *  if it is a special type, then handle it ...
 */


		if((*spc_pkt).type == SPC_type_index)
			{
			KS.spc_resume.value = 0;
			KS.lastindex = (*spc_pkt).data[2];
			flags=kernel_disable();
/*			if(KS.isa_status & STAT_index_valid)
				port_out_186(ISA_DO,KS.lastindex);*/
			kernel_enable(flags);	 		  
			status_set_update(STAT_new_index);
			if((*spc_pkt).data[3] == SPC_INDEX_PAUSE)
				{
				wait_semaphore(&KS.spc_resume);
				signal_queue(&KS.spc_pool,spc_pkt);
				}
			else
				signal_queue(&KS.index_active,spc_pkt);
			continue;
			}

#define FLUSH_RESET
#ifdef FLUSH_RESET
/*
 * if the spc_flush_reset flag is set, we just toss packets that have
 * made it through all the other checks until we see a speakerdef
 * packet.
 */
                if (KS.spc_flush_reset)
                        {
                        if (spc_pkt->type == SPC_type_speaker)
                                {
                                KS.spc_flush_reset=0;
                                }
                           else
                                {
                                /* toss the packet, because we haven't*/
                                /* seen a speakerdef since the last reset.*/
                                signal_queue(&KS.spc_pool,spc_pkt);
                                continue;
                                }
                        }
#endif /*FLUSH_RESET*/


/*
 *  if not, pass it on to the dma engine ...
 */


/*	printf("a1");		*/
		while(blockflag )
			{
			sleep(1);
			}
		wait_semaphore(&KS.spc_dma);
		port_out_186(R186_DMA0_SPL,(*spc_pkt).low_addr);
 		port_out_186(R186_DMA0_SPH,(*spc_pkt).high_addr);
 		port_out_186(R186_DMA0_TC,(*spc_pkt).length);
		port_out_186(R186_DMA0_CW, SMEM|DIO|DSYN|TC|SINC|WORD|INT|CHG|START);
/*
 *  finally, return the packet to the pool ... hold dma packets until they
 *  are complete ...
 */

		signal_queue(&KS.spc_pool,last_pkt);
		last_pkt = spc_pkt;
		}
}

/*
 *  the following task takes index packets and flushes them out as
 *  needed ...
 */

void _far index_task(void)
{
	struct spc_packet _far *spc_pkt;

	while(true)
		{
		spc_pkt = wait_queue(&KS.index_active);
		if((*spc_pkt).data[1] == INDEX_REPLY)
			send_index((*spc_pkt).data[3],(*spc_pkt).data[2]);
		signal_queue(&KS.spc_pool,spc_pkt);
		}
}

/*
 *  the dgt_task() is it's own far process that manages the spc when
 *  digital data is transfered ...
 */

void _far dgt_task(void)
{
	struct dgt_packet _far *dgt_pkt;
	struct dgt_packet _far *last_pkt;
	

	last_pkt = wait_queue(&KS.dgt_pool);
	while(true)
		{
/*	printf("a2");		*/

		dgt_pkt = wait_queue(&KS.dgt_active);
		blockflag=1;
		if(change_spc_rate)
			{
			spc_rate(change_spc_rate);
			change_spc_rate=0;
			}			 
		if((*dgt_pkt).length == 0)
			{
			wait_semaphore(&KS.spc_dma);
			icnt=0;
			digfcnt=0; /* eab digfcnt is used to count digitxed transfer*/
/*	printf("a3");		*/
                                                           
                        STOP_SAMPCLK;
                        RESET_DSP;
                        RUN_DSP;
                        START_SAMPCLK;
			if(KS.text_sync.queue != NULL_PCB)
				signal_semaphore(&KS.text_sync);
			KS.spc_mode = SPC_mode_text;
			status_clear_update(STAT_digitized);
			spc_rate(0);
/*	printf("a4");		*/

			blockflag=0;
			signal_semaphore(&KS.spc_dma);					 
			}
		else if(KS.spc_flush == false)
			{
			wait_semaphore(&KS.spc_dma);

		/* DSP chip has a bug where in freewheels in text mode after data stops
			to overcome this when the output process cathches up with the input
			process (digfcnt == icnt) then don't send the last word of data to
			the SPC to causes it to hang waiting and reset it, this is ok because
			if we don't keep up it will sound just as bad anyway*/

			icnt++;
#ifndef DTPC2 // tek 11nov98 this is not needed with the current SPC, and
			  // causes the dreaded NWS "BUZZING" when starved for data.
			if(icnt>=digfcnt && icnt >1)
				{
				icnt=0;
				digfcnt=0;
				(*dgt_pkt).length=519;
				}
#endif //DTPC2
			port_out_186(R186_DMA0_SPL,(*dgt_pkt).low_addr);
 			port_out_186(R186_DMA0_SPH,(*dgt_pkt).high_addr);
 			port_out_186(R186_DMA0_TC,(*dgt_pkt).length);
			port_out_186(R186_DMA0_CW, SMEM|DIO|DSYN|TC|SINC|WORD|INT|CHG|START);
			}
		
/*
 *  finally, return the packet to the pool ... hold dma packets until they
 *  are complete ...
 */	

/* tek 4/26 this all looks like debug stuff!
#ifdef DEBUG
	  	printf("dma count=%d ",((*dgt_pkt).length));
		for(cnt=initcnt;((*dgt_pkt).length) >= cnt;cnt=cnt+18)
			{
			for(i=0;i<=10;i++)
				{
				printf(" bd=%d ",(*dgt_pkt).data[i]);
				}
			if ((*dgt_pkt).data[cnt] !=  0 )
				{
				printf(" n=%d pos=%d",(*dgt_pkt).data[cnt],cnt);
				}
			if(j>=10)
				{
				j=0;
				printf("\n");
				}
			j++;
			}
		initcnt=18;
		printf("***");		 	
#endif /*DEBUG*/
		signal_queue(&KS.dgt_pool,last_pkt);
		last_pkt = dgt_pkt;
		}
}
#else /*this is the code for the express.. */
_far spc_task()
{
	struct spc_packet _far *spc_pkt;
	struct spc_packet _far *last_pkt;
	int	i;
	unsigned long int addr_temp;
	unsigned int flags;

	if (KS.l_verbose)
		printf("SPC Task starting. SS:%04x DS:%04x ES:%04x\n",
		get__ss(),get__ds(),get__es());

	// make sure the bus clock isn't freezing..
	sysclk_on_off(1);

	wait_semaphore(&KS.spc_dma);
	set_gpio(DSP_RESET);
	/* do a read to make sure the reset is long enough*/
	read_gpio();
	clear_gpio(DSP_RESET);
	signal_semaphore(&KS.spc_dma);

	// when we get this far, put out a beep to let the user know
	// we're at least sorta alive..
	can_beep=true;
	do_beep();

#ifdef DEBUG
	printf("spc_task:DSP reset.\n");
#endif
	last_pkt = wait_queue(&KS.spc_pool);
	while(true)
		{
#ifdef DEBUG
		printf("spc_task: wait_queue(%08x)\n",&KS.spc_active);
#endif
		spc_pkt = wait_queue(&KS.spc_active);
#ifdef DEBUG
		{
		unsigned short int  far  *siptr;

		siptr = spc_pkt->data;
		siptr--;
		printf(
		  "spc_task: packet at %04x:%04x len=%04x\n  [type at %04x:%04x]:\n  ",
		  FP_SEG(spc_pkt),FP_OFF(spc_pkt),spc_pkt->length,
		  FP_SEG(siptr),FP_OFF(siptr));
		for (i=0;i<(spc_pkt->length+4);i++)
			{
			printf("%04X",siptr[i]);
			if (i == spc_pkt->length+1)
				{
				printf(" | ");
				}
			  else
				{
				printf("   ");
				}
			if ((i&0x7) == 0x7)
				{
				printf("\n  ");
				}
			}
		printf("\n");slflush();
		}
#endif
		// we have a packet. If the sleeping flag is set, wait until the
		// dsp wakes up.. 
		// if the waking flag is set, toss it unless it is a speakerdef
		// .. if it's a speaker def, clear the waking flag and move on..
		while (KS.spc_sleeping)
			{
			sleep(2);
			}
		if (KS.spc_waking && 
			((*spc_pkt).type != SPC_type_speaker) &&
			((*spc_pkt).type != SPC_type_index))
			{
			// toss the packet, because we haven't
			// seen a speakerdef since we woke up.
			signal_queue(&KS.spc_pool,spc_pkt);
			continue;
			}
		if (KS.spc_waking && ((*spc_pkt).type == SPC_type_speaker))
			{
			// OK, wakeup is complete.
			KS.spc_waking = 0;
			}
		// note the fact that we're doing something..
		KS.idleflag = 0;                    
		
/*
 *  sync packet always happen ...
 */

		if((*spc_pkt).type == SPC_type_sync)
			{
			signal_semaphore(&KS.spc_sync);
			signal_queue(&KS.spc_pool,spc_pkt);
			continue;
			}
/*
 *  are we flushing, if so just requeue the packets in the free pool ...
 */

		if(KS.spc_flush)
			{
			if(KS.spc_flush_type == SPC_flush_all || (*spc_pkt).type != SPC_type_index)
				{
				signal_queue(&KS.spc_pool,spc_pkt);
				continue;
				}
			else if(KS.spc_flush_type == SPC_flush_until)
				{
				if((*spc_pkt).data[2] == KS.spc_flush_value)
					{
					signal_queue(&KS.index_active,spc_pkt);
					KS.spc_flush = false;
					reset_spc();
					}
				else
					signal_queue(&KS.spc_pool,spc_pkt);
				continue;
				}
			else if(KS.spc_flush_type == 	SPC_flush_mask	)
				{
				if((*spc_pkt).data[2] & KS.spc_flush_value)
					{
					signal_queue(&KS.index_active,spc_pkt);
					KS.spc_flush = false;
					reset_spc();
					}
				else
					signal_queue(&KS.spc_pool,spc_pkt);
				continue;
				}
			else if(KS.spc_flush_type == SPC_flush_after)
				{
				if((*spc_pkt).data[2] == KS.spc_flush_value)
					{
					signal_queue(&KS.index_active,spc_pkt);
					KS.spc_flush_type = SPC_flush_all;
					signal_semaphore(&KS.spc_sync);
					}
				}
			}

/*
 *  if it is a special type, then handle it ...
 */

		if((*spc_pkt).type == SPC_type_index)
			{
			unsigned short int sendindex=0;
			KS.spc_resume.value = 0;
			KS.lastindex = (*spc_pkt).data[2];
			// it's really unclear whether this will work over a serial
			// line. I'm not sure what the isa_status check does..
			// Now I know. The check for index_valid is there to
			// make sure we own the data register. Unfortunately,
			// just reading isa_status here isn't good enough,
			// because someone could easily bash the status
			// between now and the time we actually build the
			// update string. So, I've moved the status check
			// down into serial_send_index, where everything
			// happens atomically.
			// serial_send_index also sets the index_valid
			// and new_index bits.
			serial_send_index(KS.lastindex);

			if((*spc_pkt).data[3] == SPC_INDEX_PAUSE)
				{
				wait_semaphore(&KS.spc_resume);
				signal_queue(&KS.spc_pool,spc_pkt);
				}
			else
				signal_queue(&KS.index_active,spc_pkt);
			continue;
			}

/*
 * if the spc_flush_reset flag is set, we just toss packets that have
 * made it through all the other checks until we see a speakerdef
 * packet.
 */
		if (KS.spc_flush_reset)
			{
			if (spc_pkt->type == SPC_type_speaker)
				{
				KS.spc_flush_reset=false;
				}
			   else
				{
				// toss the packet, because we haven't
				// seen a speakerdef since the last reset.
				signal_queue(&KS.spc_pool,spc_pkt);
				continue;
				}
			}
/*
 *  if not, pass it on to the dma engine ...
 */
		// let the world know we still have work to do..
		KS.idleflag = 0;
		// make sure the clocks are running..
		sysclk_on_off(1);

		// check for a wedged SPC..
		if (read_gpio()&0x80)
			{
			unsigned short int sitmp, flags;
			printf("spc_task: SPC error! (%04x) ",
				_inpw(0x2e0));
			_outp(0xd8,0); //clear ff
			sitmp = _inp(0xcc);
			sitmp |= (_inp(0xcc))<<8;
			printf(" curadr = %04x ",sitmp);
			sitmp = _inp(0xce);
			sitmp |= (_inp(0xce))<<8;
			printf(" cnt=%04x\n",sitmp);
			slflush();

			
			}


#ifdef DEBUG
		printf("spc_task: wait_semaphore(%08x) (spc_dma)\n",
			&KS.spc_dma);
#endif

		wait_semaphore(&KS.spc_dma);	/* no: snooze. */
		// this isn't a counted semaphore, so zero it out.
		KS.spc_dma.value=0;
		// we still have work to do..
		KS.idleflag = 0;
#ifdef DEBUG
		{
		unsigned short int foo;
		foo = _inp(0xce);	// check that the count is -1
		foo = foo & 0xFF;
		if (foo != 0xFF)
			{
			printf("spc_task: DMA not done?? count=0x%04x\n",
				foo);
			}


		}
#endif

#ifdef DEBUG
		printf("spc_task: packet at [%04x][%04x]\n",
			(*spc_pkt).high_addr,(*spc_pkt).low_addr);
		slflush();
#endif

		/* dma controller uses word addresses.. */
		/* PACKETS MUST BE WORD ALIGNED!!! */
		addr_temp = (unsigned long)(spc_pkt->high_addr) << 15;
		addr_temp = addr_temp | spc_pkt->low_addr >> 1;
#ifdef DEBUG
		printf(
		  "spc_task: addr_temp=%08x -->%04x\n",
		  addr_temp,DMA7_ADDR);
		printf(
		  "spc_task: high_addr=%04x -->%04x\n",
		  (short)((addr_temp>>15)&0xe),DMA7_PAGE);
		printf(
		  "spc_task: length=%04x -->%04x\n",
		  ((*spc_pkt).length)-1,DMA7_COUNT);
		printf(
		  "spc_task: %04x -->%04x\n",
		  3|DMA_READ|DMA_DEMAND,DMA_MODE);
		slflush();

#endif

		// WARNING WARNING //
		// this is a hack for dectalk express. The DSP code
		// has an extra hang at the end of the speakerdef packet
		// read-in that will cause a hang. To work around this,
		// pad the end of the speakerdef packet with a NOP
		// packet, and adjust the length up.
		// it's clear from all this that the packet length is off by
		// one everywhere in the code. Too dangerous to try
		// to fix..
		/* this also happens with tone packets.. */
		if ( (spc_pkt->type == SPC_type_speaker) ||
			  (spc_pkt->type == SPC_type_tone) )
			{
			spc_pkt->data[(spc_pkt->length)-1] = SPC_type_nop;
			spc_pkt->length++;
			}
		writeDMAreg(DMA7_ADDR,(unsigned short)addr_temp&0xffff);
		/* the page part of the addr.. */

		_outp(DMA7_PAGE, (unsigned short)(addr_temp>>15)&0xe);

		/* set the DMA controller mode.. */
		_outp(DMA_MODE, 3|DMA_READ|DMA_DEMAND);

		/* the length. Again, this is in words, so the packets */
		/* must be an even number of bytes. */
		writeDMAreg(DMA7_COUNT, ((*spc_pkt).length)-1);

		
		/* and let it go. */
#ifdef DEBUG
		printf("spc_task: DMA starting: %04x --> %04x\n",
			DMA_SINGLE_MASK, 3);
		slflush();
#endif
		// now, as a last gasp, we have to make sure we're not 
		// paused or flushing. If we are, and we let the DMA start, 
		// we may end up in never-never land..
		{
		unsigned short went=0;
		while (!went)
			{
			flags=kernel_disable();
			sysclk_on_off(1);	// ensure a clock..
			// in a flush, we SHOULD appear paused.. but this clause
			// will do the right thing anyway..
			if (_inp(PORTB)&BIT0)
				{
				/* we probably have a DMA_DONE bit set..*/
				/* write one to clear it.. */
				set_gpio(DSPDMADONE);
				if (!KS.spc_flush)
				    _outp(DMA_SINGLE_MASK,3);	/* DMA go! */
				went++;
				KS.idleflag = 0;
				}
			// if we managed to hit a flush or sleep, clear out the DMA count
			// and mask the channel 
			if (KS.spc_flush || KS.spc_sleeping)
				{
				/* reset the DMA channel */
				_outp(DMA_SINGLE_MASK,7);	/* mask channel 3 */
				writeDMAreg(DMA7_COUNT, 0xFFFF);/* fake the done count */
				went++;
				}
			kernel_enable(flags);
			if (!went)
				sleep(1);
			}
		}		
/*
 *  finally, return the packet to the pool ... hold dma packets until they
 *  are complete ...
 */

		signal_queue(&KS.spc_pool,last_pkt);
		last_pkt = spc_pkt;
		}
}

/*
 *  the following task takes index packets and flushes them out as
 *  needed ...
 */

_far index_task()
{
	struct spc_packet _far *spc_pkt;

	if (KS.l_verbose)
		printf("Index Task starting. SS:%04x DS:%04x ES:%04x\n",
		get__ss(),get__ds(),get__es());
	
	

	while(true)
		{
		spc_pkt = wait_queue(&KS.index_active);
		if((*spc_pkt).data[1] == INDEX_REPLY)
			send_index((*spc_pkt).data[3],(*spc_pkt).data[2]);
		signal_queue(&KS.spc_pool,spc_pkt);
		}
}

/*
 *  the dgt_task() is it's own far process that manages the spc when
 *  digital data is transfered ...
 */

_far dgt_task()
{
	struct dgt_packet _far *dgt_pkt;
	struct dgt_packet _far *last_pkt;
	int	i,j;
	unsigned long int addr_temp;
	int cnt;

	if (KS.l_verbose)
		printf("Dgt Task starting. SS:%04x DS:%04x ES:%04x\n",
		get__ss(),get__ds(),get__es());


	last_pkt = wait_queue(&KS.dgt_pool);
	while(true)
		{
		dgt_pkt = wait_queue(&KS.dgt_active);
		if(change_spc_rate)
			{
			spc_rate(change_spc_rate);
			change_spc_rate=0;
			}
		if((*dgt_pkt).length == 0)
			{
			wait_semaphore(&KS.spc_dma);
			set_gpio(DSP_RESET);
			/* do a read to make sure the reset is long enough*/
			read_gpio();
			clear_gpio(DSP_RESET);
			if(KS.text_sync.queue != NULL_PCB)
				signal_semaphore(&KS.text_sync);
			KS.spc_mode = SPC_mode_text;
			status_clear_update(STAT_digitized);
			spc_rate(0);
			signal_semaphore(&KS.spc_dma);
			}
		else if(KS.spc_flush == false)
			{
		
			wait_semaphore(&KS.spc_dma);	/* no: snooze. */

			/* we probably have a DMA_DONE bit set..*/
			/* write one to clear it.. */
			set_gpio(DSPDMADONE);

			/* dma controller uses word addresses.. */
			/* PACKETS MUST BE WORD ALIGNED!!! */
			addr_temp = (unsigned long)(dgt_pkt->high_addr) << 15;
			addr_temp = addr_temp | dgt_pkt->low_addr >> 1;

			writeDMAreg(DMA7_ADDR,(unsigned short)addr_temp&0xffff);
			/* the page part of the addr.. */
			_outp(DMA7_PAGE, (unsigned short)(addr_temp>>15)&0xe);

			/* the length. Again, this is in words, so the packets */
			/* must be an even number of bytes. */
			writeDMAreg(DMA7_COUNT, (*dgt_pkt).length-1);

			/* set the DMA controller mode.. */
			_outp(DMA_MODE, 3|DMA_READ|DMA_DEMAND);
			/* and let it go. */
			_outp(DMA_SINGLE_MASK,3);	/* DMA go! */ 

			}
/*
 *  finally, return the packet to the pool ... hold dma packets until they
 *  are complete ...
 */	
 /* this, too, looks like debug stuff.. */
#ifdef DEBUG
	  /*	printf("dma count=%d ",((*dgt_pkt).length));
		for(cnt=initcnt;((*dgt_pkt).length) >= cnt;cnt=cnt+18)
			{
			for(i=0;i<=10;i++)
				{
				printf(" bd=%d ",(*dgt_pkt).data[i]);
				}
			if ((*dgt_pkt).data[cnt] !=  0 )
				{
				printf(" n=%d pos=%d",(*dgt_pkt).data[cnt],cnt);
				}
			if(j>=10)
				{
				j=0;
				printf("/n");
				}
			j++;
			}
		initcnt=18;
		printf("***");			*/
#endif /*DEBUG*/
		signal_queue(&KS.dgt_pool,last_pkt);
		last_pkt = dgt_pkt;
		}
}

void dma_init()
{
	/* disable the DMA controller. Load default values everywhere.*/
	unsigned short i;
	/* Mask all channels.. */
	for (i=0;i<4;i++)
		{
		_outp(DMA0_SINGLE_MASK,i|BIT2); // low controller
		_outp(DMA_SINGLE_MASK,i|BIT2);  // high controller
		}
	

	/* demand-mode read on all the channels */
	for (i=0;i<4;i++)
		{
		_outp(DMA0_MODE,i|BIT3); // low controller
		_outp(DMA_MODE,i|BIT3);  // high controller
		}
	/* write an address, and a count of -1, into all addr/count regs*/
	for (i=DMA0_ADDR; i<(DMA0_ADDR+8); i++)
		writeDMAreg(i,0xFFFF);
	for (i=DMA_ADDR; i<DMA_ADDR+0xF; i += 2)
		writeDMAreg(i,0xFFFF);

	// finally, clear out the command registers, which will
	// turn on the controller as well.
	_outp(DMA0_STAT_CMD, 0);
	_outp(DMA_STAT_CMD, 0);

}



unsigned char dleseq[10];
void serial_send_index(unsigned short data)
{
	// send the index via DLE..
	// we need to atomically attach the 'index-valid' sequence
	// to the update, so we have to hack around and build a double
	// DLE sequence..

	unsigned short int flags, temp;


	if (!KS.dleseq_OK)	// make sure we are in TSR mode..
		return;


	// build a status string.

	dleseq[0] = DLE;
	dleseq[1] = 0x50;	// data to host
	dleseq[1] |= (data>>12)&0xF;
	dleseq[2] = (data>>6)&0x3F;
	if (dleseq[2]<0x20)
		dleseq[2] += 0x40;
	dleseq[3] = data&0x3F;
	if (dleseq[3]<0x20)
		dleseq[3] += 0x40;


	// atomically set the index and update the status.
	// We peek in the p_outbuf to make sure we can send the
	// index; if we can't, we just punt and flag the index 
	// not valid. 

	flags=kernel_disable();
	// if there is no room, or if someone has come in and cleared 
	// the index-valid bit since we last looked, don't do the
	// update.
	if (
	    (KS.p_out_ring->count > (KS.p_out_ring->size - 10))
	    || (!(KS.isa_status & STAT_index_valid) )
	   )
		{
		kernel_enable(flags);
		status_clear(STAT_index_valid);
		status_set_update(STAT_new_index);
		return;
		}
	// do our own version of 
	// status_set_update(STAT_index_valid|STAT_new_index);
	temp=KS.isa_status;
	temp |= (STAT_index_valid|STAT_new_index);
	KS.isa_status = temp;

	dleseq[4] = DLE;
	dleseq[5] = 0x40 | ((temp>>12)&0xf);
	dleseq[6] = ((temp>>6)&0x3f);
	if (dleseq[6]<0x20)
		dleseq[6] += 0x40;
	dleseq[7] = (temp&0x3f);
	if (dleseq[7]<0x20)
		dleseq[7] += 0x40;
	dleseq[8] = '\0';
	p_putstring(dleseq);
	kernel_enable(flags);

}

// support for the power-up beep..
#define	NWDTMF		10
short	tliproto[NWDTMF] = {		/* DTMF prototype.*/
	0,									/* [F1]				*/
	0,									/* [F2]				*/
	6550,								/* [RINU1]			*/
	4123,								/* [RINU2]			*/
	5,									/* [NRMPU]			*/
	3200,								/* [NON]	(160 ms.)*/
	6550,								/* [RIND1]			*/
	4123,								/* [RIND2]			*/
	5,									/* [NRMPD]			*/
	1200								/* [NOFF] (60 ms.)*/
};


void do_beep(void)
{
	// make a noise. build the relevant packets to make the DSP
	// beep.  This is a special case for the power-up beep.

	unsigned int key,freq,dur;
	int	i,j;
	unsigned int _far *tone;
	unsigned int packet_dur;
	unsigned int pipe_value;

	if (!can_beep)
		return;

	tone = (unsigned int _far *)spcget(SPC_type_tone);
	for (i=0; i<NWDTMF; ++i)
		tone[i] = tliproto[i];
	packet_dur = 300; 	/* samples (300 -> 30ms) */
	tone[0] = 800; //freq
	tone[1] = 0;
	tone[5] = packet_dur; //duration
	tone[9] = 0;
	spcwrite(tone);
 
}


#endif /*DTEX*/

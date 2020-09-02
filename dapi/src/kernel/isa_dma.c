/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000, 2001 Force Computers Inc. A Solectron company. All rights reserved.
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
 *    File Name:	isa_dma.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk-pc dma character driver ...
 *
 ***********************************************************************
 *    Revision History:
 *	01 16-MAY-1995 tek 	Corrected flush done operation.      
 *	02 16-jul-1995 tek 	added hardw.h etc for dtpc2
 *  03 09-aug-1995 tek 	merge with stutter "fixes" from DTPC1
 *  04 06-nov-1995 tek 	partially interlock DMA_sync char, discourage its use.
 *  05 25-sep-1997 gl  	use array for all the dictionary entry
 *					   	also use the new symbol to load the language dictionary
 *  06 14-may-2001 cab	Added force copyright
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include "pcport.h"
#include	"186.h" 
#include	"hardw.h"

/*
 *  global data storage task ...
 */

#define	DMA_IN_SIZE			0x10		/* 256 bytes per transfer, paragraphs */
#define	DMA_IN_CHARS		0x100		/* 256 bytes per transfer, chars */
char	_far		*dma_in_buff;			/* far buffer address */
char	_far		*last_alloc;			/* last memory allocated */
unsigned int	dma_in_high;			/* 80186 adjusted high address */
unsigned int	dma_in_low;
int digfcnt;


DT_SEMAPHORE					dma_sem;		/* dma tc semaphore */
extern	unsigned int	dma_new_priority;

/*
 *  dma_task is the dma based character transport for the module.
 */

void _far dma_task()
{

	union	dma_control	dcp;

	int	count,i, flags;
	/*unsigned int pipe_word;*/
	struct dgt_packet _far *dgt_pkt;
	char	out_char;

/*
 *  init the static data pointers ...
 */

	dma_in_buff = malloc(DMA_IN_SIZE);
	dma_in_low = ((FP_SEG(dma_in_buff) << 4) & 0xfff0) + FP_OFF(dma_in_buff);
	dma_in_high = ((FP_SEG(dma_in_buff) >> 12) & 0xf);

	port_out_186(R186_DMA1_CW,CHG);

	dma_sem.value = 0;
	dma_sem.queue = NULL_PCB;
   connect_sem(11,&dma_sem);
	port_out_186(R186_INT_DMA1,0x4);

	dcp.null = dma_in_buff;

/*
 *  clear the status flop to it's init state ...
 */

	status_clear(STAT_dma_state);

/*
 *  note the the first dma_get() releases the isa driver to full operation
 */

	while(true)
		{
		if(dma_new_priority)
			{
			adjust_priority(dma_new_priority);
			dma_new_priority = 0;
			} 	  
		dma_get(DMA_COMMAND_SIZE);
		switch(DDC.command)
			{

			case	DMA_single_in	:

				put_ring(KS.in_ring,&DDC.data);
				serial_update();
				break;

			case	DMA_single_out	:

				if(test_ring(KS.out_ring))
					{
					get_ring(KS.out_ring,dcp.null);
					serial_update();
					}
				dma_put(1);
				break;

/*
 *  DMA_buff_in takes bursts upto 256 characters at a time from the isa
 *  driver ...
 */

			case	DMA_buff_in		:

				count = DDC.data;
				if(count == 0)
					count = 256;
				dma_get(count);

				/* tek 8/9/95 use the block put.. */
				put_ring_buf(KS.in_ring,&DBUFF[0],count);
/*...tek 11/2/95		block(NULL_FP); /* let it go through.. */
 				serial_update();
				break;

/*
 *  DMA_buff_out sends bursts upto 128 characters at a time back to the
 *  isa driver ...
 */
			case	DMA_buff_out	:

				count = DDC.data;
				if(count == 0 || count > 128)
					count = 128;
				i = 1;
				while(OUT_RING.count && (i <= count))
					get_ring(KS.out_ring,&DBUFF[i++]);
				DBUFF[0]= i-1;
				serial_update();
				dma_put(i);
				break;

/*
 *  sync up final ring flushes ...
 */

			case	DMA_sync		:

				/* ...tek 11/2/95 make sure we don't step */
				/* on a _sync or _sync_char already in use.. */
				while (KS.cmd_flush == CMD_flush_sync)
					sleep(0);
				flush_ring(KS.in_ring);
				KS.cmd_flush = CMD_flush_sync;
				out_char = CMD_sync_char;
				put_ring(KS.in_ring,&out_char);
				block(NULL_FP); /* tek 8/9/95 let it happen..*/

				break;

			case	DMA_sync_char	:

				/* ...tek 11/2/95 make sure we don't step */
				/* on a _sync or _sync_char already in use.. */
				/* this path really shouldn't be used, */
				/* because there is no way to keep isa_task */
				/* from coming in and doing a flush before */
				/* getseq pulls the two characters out of */
				/* the ring. Do this with */
				/* CTRL_flush+FLUSH_sync_char. */

				while (KS.cmd_flush == CMD_flush_sync)
					sleep(0);

				flags = kernel_disable(); /* ...tek 11/2/95 */
				flush_ring(KS.in_ring);
				KS.cmd_flush = CMD_flush_sync;
				out_char = CMD_sync_out;
				put_ring(KS.in_ring,&out_char);
				put_ring(KS.in_ring,&DDC.data);
				kernel_enable(flags);
				block(NULL_FP); /* tek 8/9/95 let it happen..*/

				break;


			case	DMA_control	:

				switch(DDC.data)
					{
					case	DT_MEM_ALLOC	:
						
						dma_get(DMA_ALLOC_MEM_SIZE);
						DMR.addr = last_alloc = malloc(DAM.paras);
						dma_put(DMA_MEM_RESERVED_SIZE);
						break;

					case	DT_START_TASK	:

						dma_get(DMA_START_TASK_SIZE);
						(*DST.task)(0,last_alloc);
						break;

					case	DT_SET_DIC		:

						dma_get(DMA_SET_DIC_SIZE);
                                                /* GL 09/25/1997 new dictionary loading structure */

						if(DSD.type == PRIMARY_DIC)
							{
							KS.fdic[DSD.lang] = DSD.dic_start;
							KS.fdic_entries[DSD.lang] = DSD.dic_entries;
							}
						if(DSD.type == USER_DIC)
							{
							if(KS.udic_entries[DSD.lang])
								free(KS.udic[DSD.lang]);
							KS.udic[DSD.lang] = DSD.dic_start;
							KS.udic_entries[DSD.lang] = DSD.dic_entries;
							}
						if(DSD.type == ABBREV_DIC)
							{
							if(KS.adic_entries[DSD.lang])
								free(KS.adic[DSD.lang]);
							KS.adic[DSD.lang] = DSD.dic_start;
							KS.adic_entries[DSD.lang] = DSD.dic_entries;
							}

						break;


					case	DT_LOAD_MEM		:
						
						dma_get(DMA_MEM_TRANSFER_SIZE);
						port_out_186(R186_DMA1_DPL,DMT.low_addr);
						port_out_186(R186_DMA1_DPH,DMT.high_addr);
						port_out_186(R186_DMA1_SPL,DMA_BUFF);
						port_out_186(R186_DMA1_SPH,0);
						port_out_186(R186_DMA1_TC,DMT.count);
						port_out_186(R186_DMA1_CW, DMEM|SIO|SSYN|TC|DINC|INT|CHG|START);
						dma_go();
						break;

					case	DT_READ_MEM		:
						dma_get(DMA_MEM_TRANSFER_SIZE);
						port_out_186(R186_DMA1_DPL,DMA_BUFF);
						port_out_186(R186_DMA1_DPH,0);
						port_out_186(R186_DMA1_SPL,DMT.low_addr);
						port_out_186(R186_DMA1_SPH,DMT.high_addr);
						port_out_186(R186_DMA1_TC,DMT.count);
						port_out_186(R186_DMA1_CW, SMEM|DIO|DSYN|TC|SINC|INT|CHG|START);
						dma_go();
						break;

					case	DT_DIGITAL_IN		:
						digfcnt++;

						dma_get(DMA_DIGITAL_IN_SIZE);
						if(DDI.count <= MAX_DGT_FRAMES)
							{
							dgt_pkt = wait_queue(&KS.dgt_pool);
							(*dgt_pkt).length = DDI.count*DGT_WORDS_PER_FRAME;
/*							printf(" %d cont \n",DDI.count*DGT_WORDS_PER_FRAME);*/
							port_out_186(R186_DMA1_DPL,(*dgt_pkt).low_addr);
							port_out_186(R186_DMA1_DPH,(*dgt_pkt).high_addr);
							port_out_186(R186_DMA1_SPL,DMA_BUFF);
							port_out_186(R186_DMA1_SPH,0);
							port_out_186(R186_DMA1_TC,DDI.count*DGT_BYTES_PER_FRAME);
							port_out_186(R186_DMA1_CW, DMEM|SIO|SSYN|TC|DINC|INT|CHG|START);
							dma_go();
							signal_queue(&KS.dgt_active,dgt_pkt);
							}
	  					break;
		
					};
				break;
	
			};
		}
}

void dma_get(int count)
/*int	count;*/
{
	port_out_186(R186_DMA1_DPL,dma_in_low);
	port_out_186(R186_DMA1_DPH,dma_in_high);
	port_out_186(R186_DMA1_SPL,DMA_BUFF);
	port_out_186(R186_DMA1_SPH,0);
	port_out_186(R186_DMA1_TC,count);
	port_out_186(R186_DMA1_CW, DMEM|SIO|SSYN|TC|DINC|INT|CHG|START);
	dma_go();
}

dma_put(int count)
/*int count;*/
{
 	port_out_186(R186_DMA1_DPL,DMA_BUFF);
 	port_out_186(R186_DMA1_DPH,0);
 	port_out_186(R186_DMA1_SPL,dma_in_low);
 	port_out_186(R186_DMA1_SPH,dma_in_high);
 	port_out_186(R186_DMA1_TC, count);
	port_out_186(R186_DMA1_CW, SMEM|DIO|DSYN|TC|SINC|INT|CHG|START);
	dma_go();
	return(1);
}

void dma_go(void)
{
	status_set(STAT_dma_ready);
	status_toggle_update(STAT_dma_state);
	wait_semaphore(&dma_sem);
}	

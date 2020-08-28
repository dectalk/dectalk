/*
 ***********************************************************************
 *
 *                           Copyright ©
 * 	  Copyright © 2000-2001 Force Computers Inc. A Solectron Company. All rights reserved.
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
 *    File Name:	isa.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk-pc isa bus interface driver ...
 *
 ***********************************************************************
 *    Revision History:
 * 001 16jul95	tek		added hardw.h for dtpcII + related changes
 * 002 09aug95	tek		merge in the disable of IO_PRIORITY changes,
 *						change of dma_task prio from DTPC1
 * 003 31oct95	tek		change dma_task to prio 3 to get rid of
 *						dtdemo sluggishness on DTPC1
 * 004 06nov95	tek		add FLUSH_type_char subcode
 * 005 31jan96	tek		merge DTEX (ser_cmd.c)
 * 006 14may01	cab		Added force copyright
 */

#include        "defs.h"
#include        "dectalk.h"
#include        "kernel.h"
#include "cmd.h"
#include "pcport.h"
#include        "186.h"
#include        "kernp.h"  
#include "hardw.h"
#include 	"libp.h"
#include	"esc.h"

/* macros to paper over the differences in the data reg between platforms.. */
#ifdef DTEX
#define DATA_IN (KS.in_data)
#else
#define DATA_IN (port_in_186(ISA_DI))
#endif /*DTEX*/

/*
 *  global data storage for isa com task ...
 */


volatile unsigned int isa_cmd;                          /* last read command word */
volatile unsigned int _far *peek;                       /* debug control */
volatile unsigned int dma_new_priority;
DT_SEMAPHORE       isa_port_sem;
volatile int change_spc_rate;
unsigned char i_out_char;

#ifdef DTEX
unsigned char far beepstring[]=" [:sync][:tone 700 250][:sync] ";
#endif /*DTEX*/


_far isa_task()
{

	int     i,cmd,new_command;
	unsigned int pipe_word;
	struct dgt_packet _far *dgt_pkt;
	unsigned short int flags;

#ifdef DTEX

	/* this guy gets to do all the loads...*/
	loader_task();
	/* init the variable that sends us the current command.. */
	KS.command = 0;


#endif

	dma_new_priority = 0;
	status_abs(MODE_status|STAT_new_status|STAT_cmd_ready);

/*
 *  create the module reset watch dog and the character pipe control
 */

	create_process(module_check,7,ALLOCATE_STACK,512,0);

/*
 *  now, connect the semaphore to the kernel, clear out any existing edge,
 *  and enable the irq
 */

	isa_port_sem.queue = NULL_PCB;
	isa_port_sem.value = 0;
#ifndef DTEX /* done by the serial handler in the express.. */
	connect_sem(13,&isa_port_sem);
	port_out_186(R186_INT_1,0x17);
	port_out_186(RAM_ENABLE,0);
#endif /*DTEX*/

/*
 *  wait for a sync ...
 */

	isa_cmd = 0;
#ifdef DTEX /*express code */
	/* we fall asleep on the semaphore here. This has the 
	 * desirable side effect of not spewing out DLE sequences
	 * until we get at least one from the host; thus, hosts 
	 * not using the DOS driver won't have to deal with 
	 * parsing DLE sequences just to toss them.
	 */

	wait_semaphore(&isa_port_sem);
	isa_port_sem.value = 0;

	while(KS.command != CMD_sync)
		{
		if (KS.sc_flush)
			{
			start_flush(false);
			p_putc('\001');
			}
		isa_port_sem.value = 0;
		wait_semaphore(&isa_port_sem);
		}

	/*status_abs_update(MODE_ready|READY_kernel);*/

#else /*DTEX*/ /*non-express code */
	while(true)
		if(port_in_186(ISA_COMMAND) == CMD_sync)
			{
			isa_port_sem.value = 0;
			port_in_186(ISA_INT);
			break;
			}
		else if(port_in_186(ISA_COMMAND) == MODULE_reset)
			pcdt_init();
		else
			port_out_186(ISA_STATUS,(MODE_ready));
			/*xxxx 12/29/94 changed to free up flush done bit*/
#endif /*DTEX*/
/*
 *  update the status and let the dma run ...
 */
	status_set_update(MODE_status|STAT_new_status|STAT_cmd_ready|STAT_rr_char);
#ifndef DTEX /* these processes don't exist on the express.. */
	create_process(dma_task,3,ALLOCATE_STACK,512,0); /* tek 10/31/95 */
	create_process(put_status,6,ALLOCATE_STACK,512,0);
#endif /*DTEX*/

/*
 *  now, loop around doing what ever needs to be done ... note that
 *  these are boot strap compatablitiy commands and never really run
 *  here during the normal course of things but may at start up.
 */

	i = 0;
	while(true)
		{
#ifdef DTEX /* this does the ^c flush. */
		/* sc_flush is set by the serial handler on a ^c */
		if( (!KS.sc_flush) &&
		    ((KS.isa_status & MODE_mask) != MODE_test) )
			status_set_update(STAT_cmd_ready);
#endif /*DTEX*/
		wait_semaphore(&isa_port_sem);
#ifdef DTEX
		/* have to do some things atomically here.*/
		flags=kernel_disable();
		  isa_port_sem.value = 0;
		  isa_cmd = KS.command;
		  KS.command=0;
		kernel_enable(flags);
		/* deal with a ^c flush.. */
		if (KS.sc_flush)
			{
			start_flush(false);
			p_putc('\001');
			KS.sc_flush=false;
			continue;
			}

		
		/* status back to the host.. */
		status_clear(MODE_mask|STAT_new_status|STAT_cmd_ready);
		status_set_update(MODE_status);

		if(isa_cmd == 0)
			{
			status_set_update(STAT_cmd_ready);
			continue;
			}
		else if(isa_cmd == MODULE_reset)
			pcdt_init();

#else /*DTEX*/
		isa_port_sem.value = 0;
		isa_cmd = port_in_186(ISA_COMMAND);
		status_clear_update(STAT_new_status);
		if(isa_cmd == 0)
			continue;
		else if(isa_cmd == MODULE_reset)
			pcdt_init();
		status_clear_update(STAT_cmd_ready);
		while(port_in_186(ISA_COMMAND))
			; /* wait for the command to be cleared by host.. */
#endif /*DTEX*/
		switch (isa_cmd & CMD_mask)     {

				case    CMD_null                :
				case    CMD_sync                :
					status_set(STAT_int);
					break;

				case    CMD_control     :

					switch(isa_cmd & CTRL_mask)     {
						case    CTRL_null               :
							break;

						case    CTRL_vol_up             :
#ifndef DTEX
							vol_up(DATA_IN);
#endif /*DTEX*/
							break;

						case    CTRL_vol_down   :
#ifndef DTEX
							vol_down(DATA_IN);
#endif /*DTEX*/
							break;

						case    CTRL_vol_set    :
#ifndef DTEX
							vol_set(DATA_IN);
#endif /*DTEX*/
							break;

						case    CTRL_int_enable :
#ifndef DTEX						/* express doesn't do this mode */
							status_set(STAT_int);
#endif /*DTEX*/
							break;

						case    CTRL_pause              :
							flags = kernel_disable();
							KS.pause = true;     
							STOP_SAMPCLK;
							kernel_enable(flags);
							break;


						case    CTRL_resume             :
#ifndef DTEX
							/*xxx eab need to fully handshake flush*/
							if(DATA_IN == 2)
								{
								status_clear_update(FLUSH_DONE );
								break;
								}
							else if( (isa_cmd & CTRL_data) == CTRL_resume_spc)
								signal_semaphore(&KS.spc_resume);
							else
								{
								KS.pause = false;
								START_SAMPCLK;
								}
#else /*DTEX*/
							/* digitized support ripped out here. */
							flags=kernel_disable();
							KS.pause = false;
							START_SAMPCLK;
							kernel_enable(flags);
#endif /*DTEX*/
							break;


						case    CTRL_buff_free          :
#ifndef DTEX
							// tek 17oct96 return # of pkts for digitized
							if (KS.isa_status & STAT_digitized)
								{
								put_data(queue_count(&KS.dgt_pool));
								}
							  else
								{
								put_data(IN_RING.size-IN_RING.count);
								}
#endif /*DTEX*/
							break;

						case    CTRL_buff_used          :
#ifndef DTEX
							put_data(IN_RING.count);
#endif /*DTEX*/
							break;

						case    CTRL_flush              :
							switch (isa_cmd & CTRL_data)
							  {    
							  case FLUSH_type_char:
							    /* we want to do a flush, then type*/
							    /* type out a single character. */
							    start_flush(false);
							    KS.cmd_flush = CMD_flush_sync;
							    /* getseq expects an indivisible pair of */
							    /* CMD_sync_out and the character. send */
							    /* that, and wait here for it to at */
							    /* least get through to getseq(). */
							    /* the right way to do this is with */
							    /* a semaphore, but this should be */
							    /* sufficient without having to add */
							    /* yet another semaphore to the list. */
							    i_out_char = CMD_sync_out;
							    put_ring(KS.in_ring,&i_out_char);
							    i_out_char = DATA_IN;
							    put_ring(KS.in_ring,&i_out_char);
#ifdef DTEX
							    block(NULL_FP); /* this is enough to let it happen*/
#else /* not dtex */
							    sleep(0); /* let it happen..*/
#endif /*dtex*/
							  break;

							  default: 
							    if(DATA_IN)
								{
								KS.spc_flush_type = SPC_flush_all;
								KS.spc_flush = true;
								KS.text_flush = true;
								}
							      else
								start_flush(false);
							      break;
							  }
							break;

						case    CTRL_speech             :

							switch(isa_cmd & CTRL_data)     {

								case    CTRL_SP_voice   :

									KS.async_voice = DATA_IN;
									KS.async_change |= ASYNC_voice;
									break;

								case    CTRL_SP_rate    :

									KS.async_rate = DATA_IN;
									KS.async_change |= ASYNC_rate;
									break;

								case    CTRL_SP_rate_delta      :

									KS.async_rate = DATA_IN;
									KS.async_change |= ASYNC_rate_delta;
									break;


								case    CTRL_SP_period  :

									KS.async_period = DATA_IN;
									KS.async_change |= ASYNC_period;
									break;

								case    CTRL_SP_comma   :

									KS.async_comma = DATA_IN;
									KS.async_change |= ASYNC_comma;
									break;

								case    CTRL_SP_get_param       :

									put_data(KS.speaker[DATA_IN]);
									break;

								}
							break;

						case    CTRL_io_priority                :
/* tek 8/9/95 this should never be done. */
#ifdef CHANGE_IO_PRIORITY
							if(DATA_IN)
								dma_new_priority = 5;
							else
								dma_new_priority = 3;
#endif /* CHANGE_IO_PRIORITY*/
							break;

						case    CTRL_last_index         :

							put_data(KS.lastindex);
							status_clear(STAT_new_index);
							status_set(STAT_index_valid);
							break;

						case    CTRL_free_mem           :
#ifndef DTEX
							put_data(max_block());
#endif /*DTEX*/
							break;

						case    CTRL_get_lang           :

							pipe_word = 0;
							for(i=0;i<MAX_languages;i++)
								if(KS.lang_ready[i])
									pipe_word |= (1<<i);
							put_data(pipe_word);
							break;
						};
					break;

				case    CMD_id          :

					put_data(ID_kernel);
					break;

				case    CMD_spc_mode    :
					if((isa_cmd & CMD_spc_to_text) /*&& (KS.spc_mode == SPC_mode_digital)*/)
						{
#ifndef DTEX
						dgt_pkt = wait_queue(&KS.dgt_pool);
						(*dgt_pkt).length = 0;
						signal_queue(&KS.dgt_active,dgt_pkt);
#endif /*DTEX*/
						}
					else if(isa_cmd & CMD_spc_to_digit)
						{
#ifndef DTEX
						status_set(STAT_digitized);
#endif /*DTEX*/
						}
					else if(isa_cmd & CMD_spc_rate)
						{
						change_spc_rate = DATA_IN;
						if(change_spc_rate < 0 || change_spc_rate > 66)
							change_spc_rate = 0;
						}
					break;

				case    CMD_test                :

					switch  (isa_cmd & TEST_mask)
						{
						case    TEST_null               :
							break;

						case    TEST_echo               :
							put_data(DATA_IN);
							break;
#ifndef DTEX
						case    TEST_isa_int    :
							port_in_186(ISA_INT);
							break;
						case    TEST_seg                :

							*((unsigned int *)&peek+1) = DATA_IN;
							break;

						case    TEST_off                :

							*(unsigned int *)&peek = DATA_IN;
							break;

						case    TEST_peek       :
							put_data(*peek);
							break;

						case    TEST_poke       :
							*peek = DATA_IN;
							break;
#endif /*DTEX*/

						};
					status_abs(MODE_test+(isa_cmd & TEST_sub_code));
					break;

				case    CMD_reset               :

					status_abs(MODE_status|STAT_cmd_ready|STAT_int);
					put_data(0);
					break;
#ifdef DTEX

				case	CMD_console:
					/* whack the reset register, which */
					/* will drop us back into the ROMs. */
					_outp(PORTA, 0x3);
					/* never get here.. */
					break;
#endif /*DTEX*/

				case    CMD_char_in             :
				case    CMD_char_out    :
					break;

			};
#ifndef DTEX /*done at the top of the loop for express.. */
		if((KS.isa_status & MODE_mask) != MODE_test)
			status_set_update(STAT_cmd_ready);
#endif /*DTEX*/
		}
}


#ifdef DTEX /* all this stuff is platform-specific.. */
unsigned char dleseq[5]; /* can't be on the stack.. */

void put_data(data)
unsigned int data;
{
	if (!KS.dleseq_OK)	/* are we in TSR mode? */
		return;

	dleseq[0] = DLE;
	dleseq[1] = 0x50;	/* data to host */
	dleseq[1] |= (data>>12)&0xF;
	dleseq[2] = (data>>6)&0x3F;
	if (dleseq[2]<0x20)
		dleseq[2] += 0x40;
	dleseq[3] = data&0x3F;
	if (dleseq[3]<0x20)
		dleseq[3] += 0x40;
	dleseq[4] = '\0';
	status_clear_update(STAT_index_valid);
	while(!p_putstring(dleseq))
		block(NULL_FP);
}


/*
 *  module check is a small process that resets the module when all ones
 *  are detected in the isa command register ... the routine wakes up
 *  once every second to check the module state ...
 */

#define NUM_BS 5
#define BS_THRESHOLD	2
unsigned char batt_stat[NUM_BS];/* space for 5 seconds of battery status */
unsigned char time_to_beep;	/* how many ticks to the next beep */
unsigned char bs_ptr;		/* which batt_stat entry is about to be used */
unsigned short int flags;
/* #define DEBUG */
#define POWERBEEP
void _far module_check()
{
	/* checks for module restart request, implements the input timeout,
	 * watches the battery for power-low beeps, and manages sleeping (?).
	 */
	unsigned int pipe_value, i, j;
	/* initialize the battery-status stuff */
	for (i=0;i<NUM_BS;i++)
		batt_stat[i] = 1; /* 1=batt not low. */
#ifdef DEBUG
	printf("\n[:rem module_check]");
#endif
	time_to_beep = 0; /* can beep immediately. */
	bs_ptr=0;	/* no entries used. */
	KS.idleflag = 1; /* serial char flag for beep inhibits.. */
	KS.power_interval=0; /* don't do it unless asked. */
	KS.sleep_interval=0; /* unless asked.. */
	KS.idleseconds = 0;

	while(true)
		{

		if(KS.input_timeout)
			{
			KS.input_timeout -= 1;
			if((KS.input_timeout == 0) && (KS.cmd_flush == false))
				{
				pipe_value = (PFASCII<<PSFONT) + 0xb;
				write_pipe(KS.lts_pipe,&pipe_value,1);
				KS.idleflag = 0; /* we did something.. */
				}
			}
		if(KS.command == MODULE_reset)
			{
			pcdt_init();
			KS.idleflag = 0;
			}
#ifdef POWERBEEP

		/* record the power state of the module */
		if (_inp(GPIO) & BATTOK)
			batt_stat[bs_ptr++] = 1;
		  else
			batt_stat[bs_ptr++] = 0;
		if (bs_ptr >= NUM_BS)
			bs_ptr = 0;	/* wrap */

		/* deal with power-low beeps.. */
		if (KS.power_interval)
			{
			/* see if we should declare power-low.. */
			j=0;
			for (i=0;i<NUM_BS;i++)
				j += batt_stat[i];

			if (j <= BS_THRESHOLD) /* if enough low samples.. */
				{
				unsigned int tmp1=0;
				/* see if we can beep.. */


				if (time_to_beep == 0)
					{
					/* we might have to push something  */
					/* into the input ring to get the */
					/* command parser to wake up.. */
					flags=kernel_disable();
					/* see if things have been quiet for a bit.. */
					if ((KS.idleseconds > KS.power_interval))
						{
						unsigned short i;
						for (i=0;beepstring[i] != '\0'; i++)
							put_ring(KS.in_ring,&beepstring[i]);
						tmp1 = 1;
						KS.idleflag = 0;
						}
					kernel_enable(flags);
					/* if the input buffer wasn't empty, try again later. */
					time_to_beep = KS.power_interval;
					if (tmp1)
					    time_to_beep = KS.power_interval;	
					}
				
				}
			    else /* batt not below threshold.. */
				time_to_beep = KS.power_interval;
			}
		if (time_to_beep)
			time_to_beep--;
#endif //POWERBEEP

		if (KS.in_ring->count != 0)
			KS.idleflag = 0; /* busy.. (chars in the input buff) */
		if (readDMAreg(DMA7_COUNT) != 0xffff)
			KS.idleflag = 0; /* busy; dma not done. */

		/* now, keep track of how long things have been quiet.. */
		if (KS.idleflag == 0)
			{
			KS.idleseconds = 0;
			}
		  else
			{
			KS.idleseconds++;
			}
		if (KS.idleseconds > 0xFFFE)
			KS.idleseconds = 0xFFFE; /* limit range.. */
		/* see if it's time to fall asleep.. */
		if ((KS.sleep_interval) && (KS.idleseconds >= KS.sleep_interval))
			{
			dsp_sleep();
#ifdef DEBUG
			printf("[:rem sleeping]\n");
#endif
			}
		  else
			sysclk_on_off(1);
#ifdef DEBUG
		printf("[idlesec:%d flag:%01X]",
			KS.idleseconds,KS.idleflag);
		if (KS.spc_sleeping) printf("[sleeping]");
		if (KS.spc_waking) printf("[waking]");
		{
			unsigned short flags;
			unsigned char oldptr,temp;

			flags = kernel_disable();
			/* have to do this atomically.. */
			oldptr = _inp(0xEC);	/* save the old index reg */
			_outp(0xEC,0x13);	/* index -> slpctl */
			temp = _inp(0xED);	/* read it.. */
			/* put back the old index.. */
			_outp(0xEC,oldptr);
			kernel_enable(flags);
			printf("[slpctl=%02X oldptr=%02x]",temp,oldptr);
		}
#endif
		KS.idleflag = 1; /* serial & SPC drivers clear this.. */
		sleep(100);
		}
}



#else /*DTEX*/ /* non-express code.. */

_far put_status()
{
	unsigned int flags;

	while(true)
		{
		wait_semaphore(&KS.isa_sem);
		KS.isa_sem.value = 0;
		flags = kernel_disable();
		if(KS.spc_mode == SPC_mode_digital)
			status_set(STAT_digitized);
		if(KS.isa_status & STAT_int)
			port_in_186(ISA_INT);
		kernel_enable(flags);
		}
}

void put_data(unsigned int data)
/*unsigned int data;*/
{
	status_clear_update(STAT_index_valid);
	port_out_186(ISA_DO,data);
}


/*
 *  module check is a small process that resets the module when all ones
 *  are detected in the isa command register ... the routine wakes up
 *  once every two seconds to check the module state ...
 */

void _far module_check()
{
	unsigned int pipe_value;

	while(true)
		{
		if(KS.input_timeout)
			{
			KS.input_timeout -= 1;
			if(KS.input_timeout == 0 && KS.cmd_flush == false)
				{
				pipe_value = (PFASCII<<PSFONT) + 0xb;
				write_pipe(KS.lts_pipe,&pipe_value,1);
				}
			}
		if(port_in_186(ISA_COMMAND) == MODULE_reset)
			pcdt_init();
		sleep(100);
		}
}
#endif /*not DTEX*/      
/* isa.c */

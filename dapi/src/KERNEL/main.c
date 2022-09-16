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
 *    File Name:	main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *	The start of everything DECtalk(tm).
 ***********************************************************************
 *    Revision History:
 * 14jun95	...tek		explicitly initialize the GPIO regs for dtpc2
 * 13dec95	...tek		merge dtex
 * 03mar96	...tek		check that we're on the right hardware platform.
 * 22apr96	...tek		move the enable of the clock int to below
 *						the dispatch initialization..
 * 12Nov96  ...gl       initialize the local language dictionary pointer.
 * 28Feb97  ...gl       move the modeflag LATIN setting initialization from here
 *                      to cm_util.c
 * 25Sep97  ...gl       use array for dictionary entry
 * EAB		10/28/99		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 */

#include "defs.h"
#include	"esc.h"
#include "kernel.h"
#include	"dectalk.h"
#include "hardw.h" 
#include "pcport.h"  
#include "186.h"
#include <dos.h> /* for in, out */

/*
 *  global data declared in 'c'
 */


struct share_data kernel_data;

void dectalk_main(void)
{

	extern void _far null();
	int	i;      
	int	config_error;
	
	/* decide whether we should even come up.. */
	config_error=0;
                
#ifndef DTPC2
#ifndef DTEX
#define _DTPC1
#endif
#endif

#ifdef DTPC2
	if ((inpw(R186_TIM1_CNT)&0x8000) == 0)
		{
		outpw(ISA_STATUS,CMD_error|ERROR_dtpc2_expected);
		config_error=1;
		}
#endif /*dtpc2*/
#ifdef _DTPC1
	if ((inpw(R186_TIM1_CNT)&0x8000) != 0)
		{
		outpw(ISA_STATUS,CMD_error|ERROR_dtpc1_expected);
		config_error=1;
		}
#endif /*dtpc2*/

	if (config_error)
		{
		/* hang here until we get a restart request */
		while (_inpw(ISA_COMMAND) != 0xFFFF)
			;
		pcdt_init(); /* poof! */
		}                    
                     
	/* this has to happen here, because the GPIO routines
	 * touch the kernel_share..
	 */
	kernel_share = &kernel_data;


#ifdef DTPC2
	/* make sure the gpio images are valid.. */
	set_gpio0(
	  NOT_LEFT_INC|LEFT_UP|NOT_RIGHT_INC|RIGHT_UP|REFRESH_ON);
	clr_gpio0(0x60|SAMPCLK_OFF|LEFT_UP); /* unused bits, and enable the clock.. */
	clr_gpio2(0xFF);
#endif /* DTPC2 */

#ifdef DTEX
/* put a bogus (safe) number in the C315 index register to 
 * make sure nobody stomps on it.. */
	_outp(0xec,0x1c);	// "rtcmsb"
#endif /*DTEX*/


/*
 *  init the kernel
 */

	init_dispatch();
	init_pcbs();
	init_timer();
	module_clocks(10);
#ifdef DTEX
	/* as I write this during the merge of the Express code, I can't
	 * say I understand why this happens here. But, it does in the 
	 * original express code, and it works, so I'm going to leave it.
	 * (I do remember way back explicitly putting it here, but I guess
	 * i was having a "bad comment day"..) ...tek 13dec95 */
	/* moved to after the init of the dispatch etc ...tek 22apr96 */
	enable_int(1);		/* timer is IRQ0.. */
#endif /*DTEX*/
/*
 * init some data structures ...
 */


	for(i=0;i<256;i++)
		KS.code_page[i] = i;
	KS.loaded_code_pages = NULL_CP;
	iso_case_map();
	KS.loaded_languages = NULL_LT;

	KS.print_sem.queue = NULL_PCB;
	KS.print_sem.value = 1;
	KS.isa_sem.queue = NULL_PCB;
	KS.isa_sem.value = 0;
	KS.flush_sem.queue = NULL_PCB;
	KS.flush_sem.value = 0;
#ifdef DTEX
/* used to make sure flushes are fully synchronous.. */

	KS.getc_empty.queue = NULL_PCB;
	KS.getc_empty.value = 0;
#endif /*DTEX*/

    /* GL 11/12/1996, init the dictionary pointer for all language */
    /* GL 09/25/1997 use array structure */
	for (i=0; i<MAX_languages; ++i)
	{
		KS.fdic[i] = 0;
		KS.udic[i] = 0;
		KS.adic[i] = 0;
		KS.fdic_entries[i] = 0;
		KS.udic_entries[i] = 0;
		KS.adic_entries[i] = 0;
    }

#ifndef DTEX
	KS.in_ring = create_ring(4096);
	KS.out_ring = create_ring(4096);
#else
	KS.in_ring = create_ring(2048);
	KS.out_ring = create_ring(2048);
	KS.p_out_ring = create_ring(256); /*out-of-band buffer */
#endif /*DTEX*/

	for(i=0;i<MAX_languages;i++)
		KS.lang_ready[i] = 0;
	KS.lts_pipe	= NULL_PIPE;
	KS.ph_pipe = NULL_PIPE;
	KS.lang_curr = LANG_none;

	KS.cmd_flush = KS.spc_flush = KS.halting = false;
	KS.pause = false;
	KS.logflag  = 0;
    /* GL 02/28/1997  move to MODE_LATIN setting to cm_util.c */
    /* KS.modeflag = MODE_CITATION | MODE_LATIN; */
    KS.modeflag = MODE_CITATION;
	KS.sayflag = SAY_CLAUSE;
	KS.pronflag = 0;
	KS.wbreak = false;
	KS.text_flush = false;
	KS.input_timeout = 0;
	KS.spc_mode = SPC_mode_text;
	KS.async_change = false;

#ifdef SW_VOLUME  //eab 10/6/99 Lockheed Martin Functionality for hardware
	KS.ToneVolume = 100; /* tek 08aug99 init this to the default */
	KS.mtone_running=false;
#endif /*SW_VOLUME*/



#ifdef DTEX
	/* more specific init stuff.. */
	/* make sure we have bus clocks.. */
	sysclk_on_off(1);
	/* get us a serial link.. */
	serial_init();

	create_process(serial_task,6,ALLOCATE_STACK,512,0);

	/* this code allows you to plant a magic cookie (0xFEED) at physical
	 * address 0x3FE and have that set a "verbose" flag which will make
	 * the loader dumt the same info that the DECtalk-PC loader does
	 * when you give it the -v switch (namely, what it's loading and 
	 * where. */
	{
	unsigned short int _far *tmpptr;
	FP_SEG(tmpptr) = 0;
	FP_OFF(tmpptr) = 0x3fe;
	KS.l_verbose = *tmpptr;
	if (KS.l_verbose != 0xFEED)
		KS.l_verbose = 0;
	    else
		KS.l_verbose = 1;
	}
#endif /*DTEX*/

	/* vol_set(0) initializes the volume control mechanism.. */
	vol_set(0);
	vol_set(5);


	init_spc();
	/* always have to have a null task.. */
	create_process(null,0,ALLOCATE_STACK,128,0);

	create_process(spc_task,6,ALLOCATE_STACK,512,0);

	create_process(dgt_task,6,ALLOCATE_STACK,512,0);

	create_process(isa_task,6,ALLOCATE_STACK,4096,0);
	create_process(index_task,5,ALLOCATE_STACK,512,0);
	start_kernel();		  


}


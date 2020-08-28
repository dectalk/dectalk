/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000, 2001 Force Computers, a Solectron Company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:        cm_util.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------
 * 0001 GL      10/18/95       	cm_util_type_out() catch only the last 8 bits to 
 *                              index the ascky_rev[] table
 * 002 	MGS    	04/23/1996     	Added MSDOS ifdefs and changed cmd_sync to cm_cmd_sync
 * 003 	MGS		06/13/1996		Fixed timeout so phoneme mode wouldn't break
 * 004 	SIK		07/08/1996  	Cleaning up and maintenance
 * 005  GL      07/31/1996      fix bug while calling spcwrite() for DTPC2
 * 006	GL		08/29/1996		add skip_mode initialization
 * 007	SIK		09/23/1996		add some functions under VOCAL switch to support
 *								old CMD pre-processor
 * 008	GL		10/25/1996		initialize index_counter.
 * 009	GL		11/22/1996		initialize debug_switch and gender_switch.
 * 010	GL		11/27/1996		add mode option in say_string() to pass string to lts 
 *								pipe or in_ring. 
 * 011	GL		12/13/1996		add more initialization in cm_util_init()
 *								also create cm_util_flush_init()
 * 012	GL		01/22/1997		set roll_text to 0.
 * 013	GL		02/05/1997		set email_header to 0.
 * 014  GL      02/28/1997      set modeflag LATIN mode based on the
 *                              LATIN_AMERICAN switch.
 * 015	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 016  NS		05/02/1997		Removed all form-feed characters.  Needed for
 *								stripper to work properly.
 * 017  NS		05/02/1997		Removed all form-feed characters.  Needed for
 *                              stripper to work properly.
 * 018  GL		01/08/1998		BATS#547  send a dummy space to LTS pipe after sending SYNC
 * 019	MFG		03/20/1998		BATS#628 fixed command crash when no argumant is passed
 * 020	MFG		04/27/1998		when pipe is drained let some data pass through 
 * 021	MFG		05/18/1998		initialized dbglog file pointer
 * 022	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 * 023  ETT     05oct98         added linux code
 * 024	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces 
 * 025	GL		06/15/1999		BATS #896 remove unnecessary initialization of loaded_languages
 *                              in cm_util_init_type() for MSDOS
 * 026  EAB		10/28/99		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 * 027	MGS		04/13/2000		Changes for integrated phoneme set 
 * 028	CHJ		07/20/2000		French added
 * 029	CAB		07/31/2000		Capitalized name of PKSD_T gave error in CE.
 * 030	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 * 031 	CAB		10/16/2000		Changed copyright info
 * 032	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 033	CAB		05/14/2001 		Updated copyright info
 * 034	MFG		05/29/2001		Included dectalkf.h
 * 035	MGS		06/19/2001		Solaris Port BATS#972
 * 036	MGS		03/20/2002		Single threaded vtm
 * 037	MGS		03/21/2002		Single threaded ph
 * 038	MGS		04/11/2002		ARM7 port
 */
 
#include "dectalkf.h"
#include "cm_def.h"
#ifdef ARM7
#include "string.h"
#endif
/* GL 04/21/1997  add this for OSF build */
#ifdef __osf__
#include "opthread.h"
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include "opthread.h"
extern void usa_init(PKSD_T);
#endif
void usa_init(PKSD_T); // CAB Capitalize name because lower case is not a type in ce

#ifdef MSDOS
#include "hardw.h"
#endif

#include "cm_util.h"

extern unsigned char par_lower[];

/*
 *      Function Name: cm_util_initialize()     
 *
 *      Description: Initializes variables in LPTTS_HANDLE_T structure
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void cm_util_initialize(LPTTS_HANDLE_T phTTS)
{
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
/*	INPUT_SEQ command_seq; */
	int i;

	pCmd_t->error_mode = ERROR_speak;
	pCmd_t->punct_mode = PUNCT_some;
	pCmd_t->skip_mode = SKIP_none;
	pCmd_t->last_punct = 0; 
	pCmd_t->last_char=0;
	pCmd_t->timeout=0;
#ifdef ESCAPE_SEQ
	memset(pCmd_t->esc_seq,0,sizeof(INPUT_SEQ));
	pCmd_t->esc_seq->type = 0;
#endif
#ifdef MSDOS
	pCmd_t->tone_wait = 0;
#endif
	pKsd_t->phoneme_mode = PHONEME_OFF | PHONEME_SPEAK;
	pKsd_t->pitch_delta = 35;
	pCmd_t->insertflag=0;
	
	pKsd_t->debug_switch = 0;
	pKsd_t->gender_switch = 0;

	/* mfg 05/18/1998 initialize dbglog file pointer */
#ifndef ARM7_NOSWI
	pKsd_t->dbglog = 0;
#endif
    /* GL 02/28/1997  set MODE_LATIN based on the compiler switch */
    /* only for MSDOS build. DECtalk software switch is in ttsapi.c */
#ifdef MSDOS
#ifdef SPANISH_LA
    pKsd_t->modeflag = MODE_CITATION | MODE_LATIN;
#else
    pKsd_t->modeflag = MODE_CITATION;
#endif
#endif
	/* Initialize setv[] */
	for (i=0; i<10;i++)
	{
		pCmd_t->setv[i].cmd[0] = '\0'; 
	}
	 
	/* Initialize pCmd_t->param[] */
	for (i=0; i < NPARAM; i++)
	{
		pCmd_t->params[i] = 0;
	}
	
	pCmd_t->done = 0;
    pCmd_t->roll_text = 0;
    pCmd_t->email_header = 0;
    pCmd_t->index_counter = 0;
    pCmd_t->input_counter = 0;

	memset(pCmd_t->clausebuf,0,PAR_MAX_INPUT_ARRAY);
	memset(pCmd_t->wordbuf,0,50);
	memset(pCmd_t->new_input,0,PAR_MAX_INPUT_ARRAY);
	memset(pCmd_t->output_buf,0,PAR_MAX_OUTPUT_ARRAY);
	memset(pCmd_t->dict_hit_buf,0,PAR_MAX_INPUT_ARRAY);

#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	memset(pCmd_t->input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(pCmd_t->new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(pCmd_t->output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
#endif
#endif
	pCmd_t->prevword=&(pCmd_t->clausebuf[1]);
    pCmd_t->prev_word_index=0;
	pCmd_t->clausebuf[0]=' ';
	memset(&(pCmd_t->ret_value),0,sizeof(return_value_t));
	pCmd_t->ret_value.input_pos = 0;
/* 024	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
	pCmd_t->letter_mode_flag=0;
}
/*
 *      Function Name: cm_util_flush_init()     
 *
 *      Description: Initializes variables in LPTTS_HANDLE_T structure
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void cm_util_flush_init(LPTTS_HANDLE_T phTTS)
{
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	//PKSD_T pKsd_t = phTTS->pKernelShareData;
/*	INPUT_SEQ command_seq; */

	pCmd_t->last_char=0;

#if 0
	/* Initialize setv[] */
	for (i=0; i<10;i++)
	{
		pCmd_t->setv[i].cmd[0] = '\0'; 
	}
	 
	/* Initialize pCmd_t->param[] */
	for (i=0; i < NPARAM; i++)
	{
		pCmd_t->params[i] = 0;
	}
#endif

	pCmd_t->done = 0;
    pCmd_t->roll_text = 0;
    pCmd_t->email_header = 0;
    pCmd_t->index_counter = 0;
    pCmd_t->input_counter = 0;

	memset(pCmd_t->clausebuf,0,PAR_MAX_INPUT_ARRAY);
	memset(pCmd_t->wordbuf,0,50);
	memset(pCmd_t->new_input,0,PAR_MAX_INPUT_ARRAY);
	memset(pCmd_t->output_buf,0,PAR_MAX_OUTPUT_ARRAY);
	memset(pCmd_t->dict_hit_buf,0,PAR_MAX_INPUT_ARRAY);

#ifdef NEW_INDEXING
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	memset(pCmd_t->input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(pCmd_t->new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(pCmd_t->output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
#endif
#endif
	pCmd_t->prevword=&(pCmd_t->clausebuf[1]);
    pCmd_t->prev_word_index=0;
	pCmd_t->clausebuf[0]=' ';
	memset(&(pCmd_t->ret_value),0,sizeof(return_value_t));
	pCmd_t->ret_value.input_pos = 0;

}

/*
 *      Function Name: cm_util_init_type()      
 *
 *      Description:
 *
 *      Arguments: PKSD_T pKsd_t
 *
 *      Return Value:
 *
 *      Comments:
 *
 */

void cm_util_init_type(PKSD_T pKsd_t)
{
   /*
	* This will be changed when we have an architecture
	* to implement multi-language support
	*                          KM 4/29/94
	*/

#ifdef CMDDEBUG
f_fprintf("cmdtype: In init type\n");
#endif


#ifndef MSDOS
	 /* 6/15/99 GL, BATS#896 don't do this initialization for MSDOS */
	 pKsd_t->loaded_languages = 0;

	 usa_init(pKsd_t);
#endif

}
/*
 *      Function Name:  
 *
 *      Description: cm_util_say_string() receives text and/or
 *      commands which are processed (spoken, if text).
 *      Input argument instr contains character string of text and/or commands.
 *
 *      Arguments: PKSD_T pKsd_t, unsigned char _far *instr
 *
 *      Return Value:
 *
 *      Comments:
 *
 */

#ifdef DTEX
void cm_util_say_string(PKSD_T pKsd_t, unsigned char _far *instr, short mode)
{
	/* push a string into the input buffer.. */
	int pipe_value;
	unsigned short i;
	for (i=0;instr[i] != '\0'; i++)
	{
		if (mode == 0)
			put_ring(pKsd_t->in_ring,&instr[i]);
		/* GL 11/26/1996 send the string to pipe to maintain the sync. */
		else
		{
			pipe_value = (PFASCII<<PSFONT)+instr[i];
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		}
	}	

}
#endif


/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
/*
 *      Function Name: cm_util_dtpc_tones() 
 *
 *      Description: send a tone packet to the spc
 *
 *      Arguments:
 *
 *      Return Value:
 *
 *      Comments:
 *
 */

#define TONE_AMPLITUDE 32767

int cm_util_dtpc_tones( LPTTS_HANDLE_T phTTS,
						unsigned int key,
						unsigned int iFrequency,
						unsigned int iDuration )
{
  DT_PIPE_T pipe[6];
#ifndef SINGLE_THREADED
  PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
 
  /* LPTTS_HANDLE_T phTTS; */
  
  /********************************************************************/
  /*  Get the text to speech handle.                                  */
  /********************************************************************/
  
  /* phTTS = TextToSpeechGetHandle(); */
  
  /********************************************************************/
  /*  Wait for all characters previously queued to LTS to be          */
  /*  processed.                                                      */
  /********************************************************************/

  if ( cm_cmd_sync(phTTS) == CMD_flushing )
  {
	return( CMD_flushing );                        
  }

#ifndef ARM7
  WaitForLtsFlush( phTTS, 0xFFFFFFFF );
#endif
  /********************************************************************/
  /*  The packet format here is different than the DTC07. The ramp    */
  /*  duration has been eliminated. The tone generation software      */
  /*  automatically provides 3 msec. cosine squared tapering for      */
  /*  the tone pulse rise and fall time.                              */
  /*                                                                  */
  /*  Packet Index     Packet Data                 Value              */
  /*                                                                  */
  /*      0            Command Word              SPC_type_tone        */
  /*      1            Tone Duration (msec.)     0 to ?               */
  /*      2            Tone 0 Frequency          0 to Fs/2            */
  /*      3            Tone 0 Amplitude          0 to 32767           */
  /*      4            Tone 1 Frequency          0 to Fs/2            */
  /*      5            Tone 1 Amplitude          0 to 32767           */
  /*                                                                  */
  /********************************************************************/

  /********************************************************************/
  /*  params[1] is a character pointer to the duration in msec.       */
  /*  params[0] is a character pointer to the frequency in Hertz.     */
  /********************************************************************/

  pipe[0] = SPC_type_tone;
  pipe[1] = (short)iDuration;
  pipe[2] = (short)iFrequency;

  /********************************************************************/
  /*  Disable the second tone.                                        */
  /********************************************************************/

  pipe[3] = TONE_AMPLITUDE;
  pipe[4] = 1000;
  pipe[5] = 0;

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#ifndef SINGLE_THREADED
  cm_util_write_pipe( pKsd_t, pKsd_t->vtm_pipe, pipe, 6 );
#else
  vtm_loop(phTTS,pipe);
#endif
#endif

  return( CMD_success );
}
#endif /* (WIN32) || (__osf__) || (__linux__)*/

#ifdef MSDOS
/*
 *      Function Name: cm_util_dtpc_tones()
 *
 *      Description: send a tone packet to the spc ... this assumes that the spc has
 *      already been synced ...
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, unsigned int key, unsigned int freq, unsigned int dur
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

int cm_util_dtpc_tones(LPTTS_HANDLE_T phTTS, unsigned int key, unsigned int freq, unsigned int dur)
{   
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	
	int     i,j;
	unsigned int _far *tone;
	unsigned int packet_dur, pipe_value;
	unsigned short on_time, off_time;
	if(cm_cmd_sync(phTTS) == CMD_flushing)
	{
		return(CMD_flushing);
	}
#ifdef DTEX
	/* 
	 * need to make sure that the DSP is alive and well here.. if
	 * it's asleep, we have to wake it up..
	 */
	if (pKsd_t->spc_waking)
	{
		sleep(5); /* give it time to complete. */
	}
	if (pKsd_t->spc_sleeping)
	{
		/*
		 * have to re-init everything..
		 * this should eventually generate a speakerdef packet
		 * for the DSP; when PH pushes it out the DSP will 
		 * get fired up, and when the speakerdef packet gets
		 * to the DSP driver the waking flag will clear..
		 */
		pipe_value = LAST_VOICE;
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		pipe_value = 0xb; /* sync */
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);             
		/* now, sit and sleep until we're back on line.. */
		while(pKsd_t->spc_waking || pKsd_t->spc_sleeping)
			sleep(2);
	}
#endif /*DTEX*/
					
								 
	/* hard-limit the duration to 30 seconds to make sure we don't */
	/* get in trouble with overflow later.. */
	if (dur>30000)
	{
		dur = 30000;
	}
	/*								  
	 * comma causes a pause. I think this did not work correctly 
	 * prior to 30nov95, because the pause was overlapped with the 
	 * sending of tones (it just delayed the packets). It now does 
	 * the sleep to sync up with any tones that have been 
	 * sent, then returns. 
	 */
	if(key == ',')
	{
		/* finish up any tones in process.. */
		sleep(pCmd_t->tone_wait+200); /* pause is 200 ticks, 2 seconds. */
		/* we no longer have any tones to wait for.. */
		pCmd_t->tone_wait = 0;  
		pCmd_t->dtmf_start_clock = 0; /* reset the correction factor.. */
		/* get back to work. */
		return(CMD_success);
	}
	if(key == '-')
	{
		return(CMD_success);
	}
	if(key)
	{
		for(j=0;j<sizeof(tlikmap);j++)
		{
			if(key == (unsigned int)tlikmap[j])
			{
				break;
			}
		}
		if(j == sizeof(tlikmap))
		{
			return(CMD_bad_value);
		}
		tone = (unsigned int _far *)spcget(SPC_type_tone);
		for (i=0; i<NWDTMF; ++i)
		{
			tone[i] = tliproto[i];
		}
		tone[0] = tlitone0[j];          /* [F1] */
		tone[1] = tlitone1[j];          /* [F2] */

		spcwrite(tone);

		/*
		 * calculate the wait delay..           
		 * being extremely careful about overflow.. 
		 * this is a very general was to do it, and is perhaps
		 * stupid for the particular case we have here (constant 
		 * durations). But, what the heck. 
		 * the 'or' terms are to make sure we don't end up too 
		 * short due to truncation.. 
		 */
#ifdef DTPC2
		on_time = ((tone[5]/25)<<2)|1;
#else
		on_time = (tone[5]/100)|1;
#endif
		off_time = (tone[9]/100)|1;  

		pCmd_t->tone_wait = pCmd_t->tone_wait + (on_time+off_time);

		return(CMD_success);
	}   /* if(key) */
	else 
	{
		pCmd_t->tone_wait = dur/10;
		/*
		 * messy stuff here. 
		 * for the DTPC1 case , we don't do anything different. 
		 * for DTPC2 (and probably anything beyond that) the 
		 * of the NON field in the tone packet is different: for 
		 * DTPC1 it was the tone "on" time in samples; for DTPC2 
		 * it is the tone on time * 16 samples. This was done to 
		 * allow tines longer than 3.2 seconds (32767 samples).
		 * Unfortunately, this makes the longest possible tone be 
		 * more than 64K samples, so all the sample-based math that 
		 * calculated the time-to-wait-before-reset becomes overflow 
		 * city.. Rather than make a complete mess of the code with 
		 * #ifdefs, I just rewrote the whole mess. (...tek 30nov95)
		 */
#ifndef DTPC2
		while(dur)
		{
			packet_dur = (dur > 3000) ? 3000 : dur;
			tone = (unsigned int _far *)spcget(SPC_type_tone);
			for (i=0; i<NWDTMF; ++i)
			{
				tone[i] = tliproto[i];
			}
			tone[0] = freq;
			tone[1] = 0;
			tone[5] = packet_dur*10;
			tone[9] = 0;
			dur -= packet_dur;
#ifdef SW_VOLUME
			/* tek 10aug99 use the packet writer that adjusts the volume */
			write_tone_pkt(tone);
#else /*SW_VOLUME*/
			spcwrite(tone);
#endif /*SW_VOLUME*/
		}
		return(CMD_success);
#else /*DTPC2*/
		tone = (unsigned int _far *)spcget(SPC_type_tone);
		for (i=0; i<NWDTMF; ++i)
		{
			tone[i] = tliproto[i];
		}
		tone[0] = freq;
		tone[1] = 0;
		tone[5] = (unsigned int)(((unsigned long)packet_dur*10)>>4);
		tone[9] = 0;
#ifdef SW_VOLUME
			/* tek 10aug99 use the packet writer that adjusts the volume */
			write_tone_pkt(tone);
#else /*SW_VOLUME*/
			spcwrite(tone);
#endif /*SW_VOLUME*/
		return(CMD_success);
#endif /*DTPC2*/
	}
}                             
#endif /* MSDOS */
/*
 *      Function Name: cm_util_dtpc_tones_reset()       
 *
 *      Description: cm_util_dtpc_tones_reset(): Called after
 *      cm_util_dtpc_tones() to reset spc and ph.
 *      Return value is either CMD_flushing or CMD_success.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

int cm_util_dtpc_tones_reset(LPTTS_HANDLE_T phTTS)
{   
#ifdef MSDOS
	unsigned int pipe_value; 
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	
	if(cm_cmd_sync(phTTS) == CMD_flushing)
	{
		return(CMD_flushing);                   
	}
	sleep(pCmd_t->tone_wait);
	RESET_DSP;
	RUN_DSP;
	pipe_value = LAST_VOICE;
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
	pCmd_t->tone_wait = 0; 
#endif
	return(CMD_success);
}
/*
 *      Function Name: cm_util_type_out()       
 *
 *      Description: Pronounces character passed as input by piping it to PH. Input
 *      argument c is character to be pronounced.
 *
 *      Arguments: PKSD_T pKsd_t, unsigned int c
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void cm_util_type_out(LPTTS_HANDLE_T phTTS, unsigned int c)
{
	PKSD_T pKsd_t=phTTS->pKernelShareData;
	unsigned char _far *tp;
	DT_PIPE_T phone;

	phone = LAST_VOICE;
#ifndef SINGLE_THREADED
	cm_util_write_pipe(pKsd_t,pKsd_t->ph_pipe,&phone,1);
#else
#ifdef EPSON_ARM7
	fill_TTP_buffer(phTTS,&phone,1);
#else
	ph_loop(phTTS,&phone);
#endif
#endif
	for(tp = (unsigned char _far *)pKsd_t->typing_table[c];*tp;tp++)
	{
		phone = pKsd_t->reverse_ascky[(*tp) & 0xff];
#ifndef SINGLE_THREADED
		cm_util_write_pipe(pKsd_t,pKsd_t->ph_pipe,&phone,1);
#else
#ifdef EPSON_ARM7
		fill_TTP_buffer(phTTS,&phone,1);
#else
		ph_loop(phTTS,&phone);
#endif
#endif
	}
	switch (pKsd_t->lang_curr)
	{
	case LANG_english:
		phone = (PFUSA<<PSFONT) | COMMA;
		break;
	case LANG_british:
		phone = (PFUK<<PSFONT) | COMMA;
		break;
	case LANG_german:
		phone = (PFGR<<PSFONT) | COMMA;
		break;
	case LANG_spanish:
		phone = (PFSP<<PSFONT) | COMMA;
		break;
	case LANG_latin_american:
		phone = (PFLA<<PSFONT) | COMMA;
		break;
	case LANG_french:
		phone = (PFFR<<PSFONT) | COMMA;
		break;
	}
	
#ifndef SINGLE_THREADED
	cm_util_write_pipe(pKsd_t,pKsd_t->ph_pipe,&phone,1);
#else
#ifdef EPSON_ARM7
	fill_TTP_buffer(phTTS,&phone,1);
#else
	ph_loop(phTTS,&phone);
#endif
#endif
}
/*
 *      Function Name: cm_util_string_match()   
 *
 *      Description: Performs a case-insensitive string compare. Compares string *s to
 *  				 each strings in array *sa[]. Returns the index of the string in 
 * 					 *sa[] which matched *s. If no match found, returns NO_STRING_MATCH 
 *
 *      Arguments: unsigned char *sa[]
 *				   unsigned char *s
 *
 *      Return Value: int; Index of string matched in array *sa[] or NO_STRING_MATCH
 *
 *      Comments:
 *
 */

int cm_util_string_match(const unsigned char *sa[],unsigned char *s)
{
	unsigned char *t, *ta;
	int index, matches, match_index=0;

#ifdef DEBUGPARS // NAL warning removal
	int i;
#endif

	matches = 0;

if (s == NULL) //mfg check for a NULL argument BATS#628
	{
	return(NO_STRING_MATCH);
	}

#ifdef DEBUGPARS
		printf("CM_UTIL: string_match:\n");
#endif                         
#ifdef DEBUGPARS
	putc('s');
	putc('=');
	for (i=0;s[i];i++)
	{
		putc(s[i]);
	} 
	putc('\r');
	putc('\n');
#endif
	for(index=0; sa[index]; index+=1)
	{
#ifdef DEBUGPARS
		putc('s');
		putc('a');
		putc('=');
		for (i=0;sa[index][i];i++)
		{
			putc(sa[index][i]);
		} 
		putc('\r');
		putc('\n');
#endif		
		t = s;
		ta = sa[index];
		while(TRUE)
		{
			if (*ta == par_lower[*t])
			{
				if(*ta == 0)                                                       
				{
					return(index);
				}
				ta += 1;                                              
				t += 1;
			}
			else 
			{
				if(*t == 0)
				{
					matches += 1;
					match_index = index;
					break;
				}
				else
				{
					break;
				}
			}
		}
	}
	if(matches == 1)
	{
		return(match_index);
	}
	return(NO_STRING_MATCH);
}

 
#ifndef SINGLE_THREADED
/*
 *      Function Name:  cm_util_cm_util_write_pipe
 *
 *      Description:
 *          This function will write pipe data to LTS pipe.
 *
 *      Arguments:
 *          PKSD_T pKsd_t
 *          short *phone            phone code to send to PH
 *          short count             number of bytes
 *
 *      Return Value:
 *          None
 *
 *      Comments:
 *
 */
void cm_util_write_pipe(PKSD_T pKsd_t,P_PIPE kinp, short *phone, short count)
{


		/* debug switch */
		if (DT_DBG(CMD_DBG,0x800))
		{
			/*mfg 04/27/98 when pipe is drained let the following pass through*/ 
			if ((*phone != SYNC) && (*phone != BREATH_BREAK) 
				&& (*phone != KILL_TASK) && (*phone != FLUSH_SYNC))

			return;
		}

        write_pipe(kinp,phone,count);

		/* GL 01/08/98  BATS#547  force a extra space after SYNC, VT/HT to fix the
		   dropping punctuation problem. */
		if (*phone == SYNC || *phone == BREATH_BREAK)
		{
			*phone = (PFASCII<<PSFONT) + ' ';
			write_pipe(kinp,phone,1);
		}
        
		return;
} 
#endif

/****************************** OLD CODE ********************************************/
#ifdef VOCAL
/*
 *	Function Name: cm_util_sendat()	
 *
 *	Description:
 *
 *	Arguments: LPTTS_HANDLE_T phTTS,char cbuf[],
 *			   int *cbufcnt,int *pcnt,
 *			   int *isAdigit,int *sndtel,
 *			   int *modechng,int posord, char laschar
 *
 *	Return Value:
 *
 *	Comments:
 *
 */
 
int cm_util_sendat(LPTTS_HANDLE_T phTTS,char cbuf[],
				  int *cbufcnt,int *pcnt,
				  int *isAdigit,int *sndtel,
				  int *modechng,int posord, char laschar)
{
	int offset, k;
	DT_PIPE_T pipe_value;
    PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
#ifdef DEBUGPARS
		printf("CM_UTIL: sendat:\n");
#endif                                                                                  
	if(*cbufcnt==0)
	{
		return(0);
	}
	if (((char_types[pCmd_t->ParseChar] & MARK_space) >= 0) &&
		((char_types[cbuf[1]] & MARK_space) == 0) && 
		(((*pcnt==1 && *isAdigit != 1) && (pCmd_t->last_char !=')')) )&& 
		(*modechng == 0))
	{
		pipe_value = (PFASCII << PSFONT) + ' ';
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		pipe_value = (PFASCII << PSFONT) + 'd';
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		pipe_value = (PFASCII << PSFONT) + 'o';
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		pipe_value = (PFASCII << PSFONT) + 't';
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		pipe_value = (PFASCII << PSFONT) + ' ';
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		if(cbuf[(*cbufcnt)-1] != ' ')
		{
			offset=0;
		}
		else
		{
			offset=1;
		}
		if(cbuf[0] == '.')
		{
			k=1;
		}
		else
		{
			k=0;
		}
#ifdef DEBUGPARS
        printf("CM_UTIL: sendat: offset=%d \n",offset);
		printf("                  *cbufcnt%d \n",*cbufcnt);
#endif
		while( ((((*cbufcnt)-offset)-k) >= 0) )
		{
			if(cbuf[k] == '.' && (((*cbufcnt)-offset)-k) !=0)
			{
				pipe_value = (PFASCII << PSFONT) + ' ';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
				pipe_value = (PFASCII << PSFONT) + 'd';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
				pipe_value = (PFASCII << PSFONT) + 'o';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
				pipe_value = (PFASCII << PSFONT) + 't';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
				pipe_value = (PFASCII << PSFONT) + ' ';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
				k++;
			}
			pipe_value = (PFASCII << PSFONT) + cbuf[k];
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
			k++;
#ifdef DEBUGPARS
		printf("CM_UTIL: sendat: sending1 %c %d \n",cbuf[k-1],c);
		printf("                           %d \n",k-1);
#endif                                  
			if(  (((*cbufcnt)-offset)-k) <=0 )
			{
				break;
			}
		}
		if(offset ==1)
		{
			pipe_value = (PFASCII << PSFONT) + ' ';
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);					
		}
	}	/* 
		 * End of if ( ( (char_types[c] & MARK_space) >= 0) &&
		 * ((char_types[cbuf[1]] & MARK_space) == 0)
		 * && ( (*pcnt==1 && *isAdigit != 1 && last_char !=')') )
		 * && *modechng == 0  ) 
		 */
	else 
	{
		if(*pcnt>999 )
		{
			pipe_value = (PFASCII << PSFONT) + ' ';
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
			for(k=0;(*cbufcnt)-k;k++)
			{
				if(cbuf[k] != '.')
				{
					pipe_value = (PFASCII << PSFONT) + cbuf[k];
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);

				}

#ifdef DEBUGPARS
		printf("CM_UTIL: sendat: sending2 %c %d \n",cbuf[k],cbuf[k]);
#endif

			}
		}

		else 
		{
			if(*isAdigit == 1)
			{
				cm_util_sendit(phTTS,cbuf,cbufcnt,sndtel,modechng,posord,laschar);
			}
			else
			{
				for(k=0; (*cbufcnt)-k; k++)
				{
					pipe_value = (PFASCII << PSFONT) + cbuf[k];
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);

#ifdef DEBUGPARS
		printf("CM_UTIL: sendat: sending5 %c %d \n",cbuf[k],cbuf[k]);
#endif
				}
				pipe_value = (PFASCII << PSFONT) + ' ';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
			}
		}
	}	/*
		 * Matches else if(*pcnt>999 ) 
		 */
	*cbufcnt=0;
	return(1);             

}

/*
 *	Function Name: cm_util_sendit()	
 *
 *	Description:
 *
 *	Arguments: LPTTS_HANDLE_T phTTS,char cbuf[], int *cbufcnt,
 *			   int *sndtel,int *modechng,int posord, char laschar
 *
 *	Return Value:
 *
 *	Comments:
 *
 */

void cm_util_sendit(LPTTS_HANDLE_T phTTS,char cbuf[], int *cbufcnt,
					int *sndtel,int *modechng,int posord, char laschar)
{
	int k;
	DT_PIPE_T pipe_value;							
	int justone;
    PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData; 
	
#ifdef DEBUGPARS
		printf("CM_UTIL: cm_util_sendit: \n");
#endif
	justone = 1;
	if((*sndtel ==  0) && (*cbufcnt >0))    /*not a telphone number but a number*/
	{
		for(k=0;(*cbufcnt)-k;k++)
		{
			if ( *cbufcnt>0 && cbuf[k] != ')' && cbuf[k] !='(')
			{
				/*xxx EAB 9/94Doug GEO. complained that punc none speaks a lone punc mark*/

				if(!(((cbuf[k] == '.') || (cbuf[k] == ',') || (cbuf[k] == '?') || 
					(cbuf[k] == '!')) && (pCmd_t->punct_mode == PUNCT_none)) || 
					(cbuf[k] == '.') && (((cbuf[k-1] >= '0') && (cbuf[k-1] <= '9')) || ((cbuf[k+1] >= '0') && (cbuf[k+1] <= '9'))))
				{
					pipe_value = (PFASCII << PSFONT) + cbuf[k];
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);

#ifdef DEBUGPARS
		printf("CM_UTIL: cm_util_sendit: sending3 %c %d\n",cbuf[k],cbuf[k]);
#endif
					k==0;
				}
			}
		}

#ifdef DEBUGPARS
        printf("CM_UTIL: cm_util_sendit: laschar= %c ** posord=%d *modechng %d, c= %c",laschar,posord,*modechng,c);
#endif

		if ((posord != 2 && *modechng !=1) &&
			(pCmd_t->ParseChar != '/' && posord !=1)&& 
			(pKsd_t->modeflag & MODE_MATH) == 0 && 
			!(char_types[pCmd_t->ParseChar] & MARK_digit) && 
			(laschar != '-'))
			/*==2 is an ordinal or fraction don't send space*/
		{

#ifdef DEBUGPARS
		printf("CM_UTIL: cm_util_sendit: sending space in num proc  %d %c\n",c,c);
#endif
        
			pipe_value = (PFASCII << PSFONT) + ' ';
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		}
	}	/* End of if((*sndtel ==  0) && (*cbufcnt >0)) */	
	else
	/*
 	 *	02/08/95 cjl fixed boundry test, was:
 	 *	for (k=0;(*cbufcnt)-k;k++)
 	 */
	{
		k=0;
		for(k=0; ((*cbufcnt)-k) > 0; k++)
		{
			if(cbuf[k] == '(')
			{
				k++;
			}
			if(cbuf[k] == ')')
			{
				k++;
			}
			if(cbuf[k] == '.' || cbuf[k] == ',' )
			{
				k++;
				pipe_value = (PFASCII << PSFONT) + '.';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
				pipe_value = (PFASCII << PSFONT) + ' ';
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);

			}
			else
			{ 
				if(cbuf[k] == ' ')
				{
					if(justone==0)
					{
						justone=1;
						pipe_value = (PFASCII << PSFONT) + ',';
						cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);

					}
					pipe_value = (PFASCII << PSFONT) + ' ';
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);

				}
				else
				{
					pipe_value = (PFASCII << PSFONT) + ' ';
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
					pipe_value = (PFASCII << PSFONT) + cbuf[k];
					cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
					justone=0;
				}
			}
#ifdef DEBUGPARS
		printf("CM_UTIL: cm_util_sendit: sending 43 %c %d \n",cbuf[k],cbuf[k]);
#endif                                                                                  
		}	/* End of for(k=0; (*cbufcnt-k) > 0; k++) */

	}	/* End of else */
	*modechng=0;
}
#endif /* #ifdef VOCAL */

#ifdef SW_VOLUME
/* this shim adjusts the volume of the tone packet before writing it */
void write_tone_pkt(unsigned int _far *tone)
{
	unsigned long ulTemp;
	unsigned long ulVol=KS.CurrentVolume;
	unsigned long ulBal=KS.ToneVolume;
	int a,b,c,d;
	/* both of the volume values are 0-100. Multiply the base values
	 * by both, then divide by 10000 to get the scaled result.
	 *  
	 */
	

	ulTemp = (unsigned long)(tone[2])*ulVol*ulBal;
	tone[2] = ulTemp/10000;
	ulTemp = (unsigned long)(tone[3])*ulVol*ulBal;
	tone[3] = ulTemp/10000;
	ulTemp = (unsigned long)(tone[6])*ulVol*ulBal;
	tone[6] = ulTemp/10000;
	ulTemp = (unsigned long)(tone[7])*ulVol*ulBal;
	tone[7] = ulTemp/10000;
	
	/* now write it out.. */
	spcwrite(tone);
	
}


/* tek 13aug99 the on/off tone cycling command.. */
/* first, the command processor.. */

	

cm_cmd_mtone(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	unsigned int freq, on_time, off_time, cycles;
	unsigned int pipe_value;
	/* set the flag that let the world know we're running */
	KS.mtone_running = true;
	/* all params are required */
	if(   (pCmd_t->defaults[0] == true)
		||(pCmd_t->defaults[1] == true)
		||(pCmd_t->defaults[2] == true)
		||(pCmd_t->defaults[3] == true) )
	{
		return(CMD_bad_param);
	}
	/* get the parameters.. */
	freq = pCmd_t->params[0];
	on_time = pCmd_t->params[1];
	off_time = pCmd_t->params[2];
	cycles = pCmd_t->params[3];
	
	//eab 23-sep-99 Modified to less expansive limits
	// and eliminated the send tone forever command
	if ((freq > 3500) || (freq < 300))
		return (CMD_bad_param); /* 300 <= freq <= 3500 */
	if ((on_time < 6) || (on_time > 3200))
		return (CMD_bad_param); /* 6 <= time <= 3200 */
	if ((off_time < 6) || (off_time > 3200))
		return (CMD_bad_param); /* 6 <= time <= 3200 */
	if ((cycles < 0) || (cycles > 32766))
		return (CMD_bad_param); /* 0  to 1000 on/off cyles
			o cycles being a noop */
	if (!KS.halting) 
		cmd_mod_tone(freq,on_time,off_time,cycles); 
	////eab 9-24-99 use standard call 
	pCmd_t->tone_wait =0;
	cm_util_dtpc_tones_reset(phTTS);
	KS.mtone_running=false;
	
	return(CMD_success);
}

cmd_mod_tone(int freq, int on_time, int off_time, int cycles)
{
	/* note that a cycles value of zero means to run "forever" */
	/* this just queues packets, so the tones will start after 
	* whatever else is in the pipes.. so, if you want to start
	* "now", do a flush first.
	*/
	unsigned int _far *tone; /* pointer to the actual tone packet*/
	int cycle_count=0;	/* how many cycles we've done.. */
	int total_ticks;
	unsigned int on_duration, off_duration;

#ifdef DTEX
	// need to make sure that the DSP is alive and well here.. if
	// it's asleep, we have to wake it up..
	if (KS.spc_waking)
		sleep(5); // give it time to complete.
	if (KS.spc_sleeping)
		{
		unsigned int pipe_value;
		// have to re-init everything..
		// this should eventually generate a speakerdef packet
		// for the DSP; when PH pushes it out the DSP will 
		// get fired up, and when the speakerdef packet gets
		// to the DSP driver the waking flag will clear..
		pipe_value = LAST_VOICE;
		write_pipe(KS.lts_pipe,&pipe_value,1);
		pipe_value = 0xb; // sync
		write_pipe(KS.lts_pipe,&pipe_value,1);		
		// now, sit and sleep until we're back on line..
		while(KS.spc_waking || KS.spc_sleeping)
			sleep(2);
		}
#endif /*DTEX*/
			
#ifdef DTPC2
		on_duration = (unsigned int)(((unsigned long)on_time*10)>>4);
		off_duration = off_time*10;
#else /* other platforms */
		on_duration = on_time*10;
		off_duration = off_time*10;
#endif /*DTPC2*/
		

	total_ticks = (on_time+off_time)/10;
	
	/* loop and do as many cycles as we need.. */
	while (  (!KS.halting)
		   &&(  (cycles==0)
		      ||(cycle_count<cycles) 
		     ) 
		  )
	{
		unsigned int i;
		cycle_count++;
		if (   (cycle_count>2 )
			&& (cycles==0))
		{
			cycle_count=2; /* so forever never overflows */
		}

		
		/* get a tone packet.. */
		tone = (unsigned int _far *)spcget(SPC_type_tone);
		/* fill it in.. */
		/* take defaults, and then overwrite (this makes the volume work) */
		for (i=0; i<NWDTMF; ++i)
			tone[i] = tliproto[i];
		
		tone[0] = freq ; 			/* [F1]				*/
		tone[1] = 0; 				/* [F2]				*/
		//tone[2] = ; 				/* [RINU1]			*/
		//tone[3] = ; 				/* [RINU2]			*/
		//tone[4] = ; 				/* [NRMPU]			*/
		tone[5] = on_duration; 	/* [NON]		*/
		//tone[6] = ; /* [RIND1]			*/
		//tone[7] = ; /* [RIND2]			*/
		//tone[8] = ; /* [NRMPD]			*/
		/* stretch the off duration so that we actually clip the */
		/* tone with a reset */
		//Add off time for the express and reset it while it's still
		//generating the tones so that end of tone click doesn't occur
		tone[9] = off_duration+700;  /* [NOFF] (60 ms.)*/
		/* send the packet */
		write_tone_pkt(tone);
		/* wait until it's done.. */
		mtone_wait(total_ticks);//The minus one is a fudge factor for latency times
		//Using accumulated time doesn't work totally because the first tone gets distorted

		/* the DSP pops if we just let it stop; so, whack it */
		/* with a reset just before it would end. The reset  */
		/* process takes almost zero time, so this should not*/
		/* cause too much of a cumulative timing error */
		// Actually it pops only on the express but this should work
		//for the others so we'll do it this way for all
		RESET_DSP;
		RUN_DSP;
		
		
	} /* cycle count.. */

}


/* wait for this many ticks */
void mtone_wait( int ticks)
{
	unsigned long start_time, done_time;
	start_time = get_clock();
	done_time = start_time + (unsigned long)ticks;
	while (!KS.halting)
	{
		unsigned long now; //eab 9-24-99 now has to be a long -- Bats 914
		sleep(0); /* let things happen */
		now=get_clock();
		/* deal with clock rollover.. */
		if (start_time > done_time)
		{
			/* clock will roll on this one.. */
			if (   (now < start_time) /* get past the rollover time */
				&& (now > done_time) )
			{
				break;
			}
		}
		else
		{
			/* no rollover.. */
			if (now > done_time)
			{
				break;
			}
		}
	} 
}/* mtone wait */

#endif /*SW_VOLUME*/


/********************************* END OLD CODE *************************************/

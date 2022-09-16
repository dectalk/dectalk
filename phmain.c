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
 *    File Name:	phmain.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * This file contains the
 * mainline of the synthesizer task.
 * It reads phonemes from letter to
 * sound, packs them into clauses, and
 * converts them to signal processor
 * control frames.
 *
 ***********************************************************************
 *    Revision History:
 * 01	27-Dec-84 DGC	Renamed from "kl1.c". Many edits for
 *			the new synthesizer.
 * 02	02-Jan-85 DGC	Added an "mstofr" routine that watches
 *			out for overflow on 16 bit machines.
 * 03	19-Jan-85 DGC	Dennis changed "phdefs.h" so that it always
 *			included "def.h". Deleted the include line
 *			that was in this file.
 * 04	24-Jan-85 DGC	Added some code at the top of the main
 *			loop that turns WBOUND into COMMA if it
 *			looks like we are getting close to the edge.
 * 05	 31-Jan-85 DGC	Changed the way that "SYNC" is done.
 * 06	06-Mar-85 DGC	Changed the code that writes out the index
 *			reply stuff to use "PUTSEQ".
 * 07	17-Apr-85 DGC	Changes due to default/0 change in "ansi.c".
 * 08	02-Jun-85 DGC	Added LOG_PHONEME.
 * 09	07-Jun-85 DGC	"ef" => "lx" in speaker definition.
 * 10	18-Jun-85 DGC	"g5" => "lo" in speaker definition.
 * 11	19-Jun-85 DGC	Enforce limits for ":ra", ":cp", ":pp".
 * 12	26-Jul-85 DGC	"outpar" isn't  structure anymore.
 * 13	08-Aug-85 DGC	"haltsw" (FLAG) => "halting" (short), new sync.
 * ------------------	Released as C5005 V1.0 firmware.
 * 14	21-Oct-86 DGC	Changes for KRM.
 * 15	17-Nov-86 DGC	Fixed a bug in indexing found by Kurzweil.
 * 16   12-jan-90 EAB	Put in changes for NKR and SENT.(compile changes)
 * 17   16-jan-90 EAB   change rate limit from 350 to 550
 * 18   25-JUL-90 EAB	ADDED COMMA PAUSE CHANGED FOR NANCY JARRELL-CHB
 * 19   17-Sep-90 SGS	Added PR control switches
 * 20	15-Mar-95 CJL	Added debug code for printf bug; uses define DEBUG
 * 20   17-SEP-95 JDB   Replaced /n's with \n's.
 */
#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#include <stdio.h>
#endif


#ifdef	WIN32
#include "windows.h"
#endif

#include "php.h"
#include   "phdefs.h"

#define   isbound(ph)   ((ph)>=WBOUND  && (ph)<=VPSTART)
#define   ispause(ph)   ((ph)>=VPSTART && (ph)<=EXCLAIM)
#define   issmark(ph)   ((ph)>=WBOUND  && (ph)<=EXCLAIM)
#define   isdelim(ph)   ((ph)>=COMMA   && (ph)<=EXCLAIM)

/*
 *  asperation is used to dynamically adapt the period and comma pauses ...
 */

int   asperation;
int            reset_pitch;
int            default_pitch;

/*
 * Because the KRM uses a very large
 * number of index marks, Kurzweil asked for the index
 * event queue to be made larger. This was possible
 * because a lot of space was freed up in the RAM since
 * a lot of things (tasks, option buffers, and so on)
 * got deleted from the code.
 */
extern   int docitation;
//extern   P_PIPE   kinp;                  /* Link to KLSYN input pipe	*/
extern   short   simage;                  /* Switch image			*/
extern   short   compause;               /* Comma pause, frames		*/
extern   short   perpause;               /* Period pause, frames		*/
extern   short   sprate;                  /* Speaking rate		*/
extern   short   parstochip[];            /* Array of paramters to TMS.	*/
extern   PARAMETER param[];            /* Parameter array.		*/
extern   short   symbols[];               /* Where input symbols go.	*/
extern   short   nsymbtot;               /* Length of above.		*/
#ifndef MINIMAL_SYNTH
extern   short   *user_durs;               /* Where user durations go.	*/
extern   short   *user_f0;               /* Where user f0 commands go.	*/
#endif
extern   FLAG   loadspdef;               /* Flag: need to load TMS320.	*/
extern   short   last_voice;               /* Voice for tone reloads */
extern   short curspdef[];     /* current speaker definition */

int   bound;
extern char   nphone;
int   lastoffs;

/*
 *  process creation main ... this entry is called by the loader to
 *  create any static processes that are needed for this task ...
 */
#ifndef NOTNOW
ph_main(data_seg,stack_start)
unsigned int    data_seg;
unsigned int   stack_start;
{
   extern kltask();

//help   kinp = KS.lang_ph[LANG_english];

 //  create_process(kltask,4,data_seg,stack_start,0);
}
#endif
/*
 * This function is the main
 * function of the synthsizer task; this
 * task is created by the task creation loop
 * at boot time. It reads phonemes from the pipe
 * to letter to sound, packs them into clauses,
 * and calls the low level functions of the
 * wonderful Klatt synthesizer to make
 * DECtalk talk.
 */
kltask_init()
{

   default_lang(LANG_english,LANG_ph_ready);
   /*
    *  ph initialization ...
    */

   sprate = 180;
   perpause = 0;
   compause = 0;

   param[F0].outp = &parstochip[OUT_T0];
   param[F1].outp = &parstochip[OUT_F1];
   param[F2].outp = &parstochip[OUT_F2];
   param[F3].outp = &parstochip[OUT_F3];
   param[FZ].outp = &parstochip[OUT_FZ];
   param[B1].outp = &parstochip[OUT_B1];
   param[B2].outp = &parstochip[OUT_B2];
   param[B3].outp = &parstochip[OUT_B3];
   param[AV].outp = &parstochip[OUT_AV];
   param[AP].outp = &parstochip[OUT_AP];
   param[A2].outp = &parstochip[OUT_A2];
   param[A3].outp = &parstochip[OUT_A3];
   param[A4].outp = &parstochip[OUT_A4];
   param[A5].outp = &parstochip[OUT_A5];
   param[A6].outp = &parstochip[OUT_A6];
   param[AB].outp = &parstochip[OUT_AB];
   param[TILT].outp = &parstochip[OUT_TLT];

   init_phclause();

   usevoice(last_voice);
#ifndef MINIMAL_SYNTH
   saveval();
#endif
   reset_pitch = false;
   KS.speaker = (int _far *)&curspdef[0];
   symbols[0] = COMMA;
   bound = COMMA;
   lastoffs = 0;
   nsymbtot = 1;
   nphone = 0;
   asperation = 0;

   // this is where the main ph loop was. now it is a function to be called from lts

}

ph_loop(short *input_phone)
{
//	register int   nextra;
//	register short   *workp;
	int   nextra;
	short   *workp;
#ifndef MINIMAL_SYNTH
	register int   value;
#endif
	short buf[4];
	
#ifdef NO_CMD
	buf[0]=input_phone[0];
	nextra=0;
#endif

#ifndef NO_CMD
	nextra = readphone(buf,input_phone);
#endif
	
	if(KS.halting)
	{
		speak_now();
		if(reset_pitch)
		{
			setparam(3,default_pitch);
			reset_pitch = false;
		}
		if(buf[0] != SYNC)
			return 0;
	}
	/*
	*  Check for syncs and always process them ...
	*/
	if(buf[0] == SYNC || buf[0] == CNTRLK)
	{
		speak_now();
		spcwrite(spcget(SPC_type_sync));
		return 0;
	}
	/*
	*  Now process the phoneme ...  look for special async control
	*  changes ...
	*/
	if(KS.async_change)
	{
		speak_now();
		while(KS.async_change)
		{
			if(KS.async_change & ASYNC_rate)
			{
				sprate = deadstop(KS.async_rate, 75, 600);
				KS.async_change &= (~ASYNC_rate);
			}
			if(KS.async_change & ASYNC_rate_delta)
			{
				sprate = deadstop(sprate+KS.async_rate, 75, 600);
				KS.async_change &= (~ASYNC_rate_delta);
			}
			if(KS.async_change & ASYNC_voice)
			{
				usevoice(KS.async_voice);
				KS.async_change &= (~ASYNC_voice);
			}
			if(KS.async_change & ASYNC_comma)
			{
				compause = mstofr(deadstop(KS.async_comma,  -40, 30000));
				KS.async_change &= (~ASYNC_comma);
			}
			if(KS.async_change & ASYNC_period)
			{
				perpause = mstofr(deadstop(KS.async_period,  -380, 30000));
				KS.async_change &= (~ASYNC_period);
			}
		}
		return 0;
	}
	/*
	*  insert indexes into the chain ...
	*/
	if ((buf[0]&~PFONT) == SPECIALWORD)
	{
		docitation=1;
	}
	
	/*		debug eab*/
	
	if(buf[0] == INDEX || buf[0] == INDEX_REPLY)
	{
		
#ifndef NO_INDEXES
		save_index(nsymbtot,buf[0],buf[1],buf[2]);
#endif
		return 0;
	}
	/*
	*  process control phones ...
	*/
	if((buf[0]&PFONT) == (PFCONTROL<<PSFONT))
	{
		if(nsymbtot > 1)
		{
			symbols[nsymbtot] = COMMA;
#ifndef MINIMAL_SYNTH
			user_durs[nsymbtot] = 0;
			user_f0[nsymbtot++] = 0;
#else
			nsymbtot++;
#endif
			speak_now();
		}
		if (KS.logflag&LOG_PHONEMES)
		{
#ifdef DEBUG
			/*	Added to debug [:log ...] printing problem 14-MAR-95 cjl*/
			printf("This is the character %c\n\r",'c');
			/*	printf("This is the float number %f\n\r",9.0/5.0);*/
			printf("This is the string %s\n\r","test");
			printf("This is the hex number %x\n\r",'c');
			printf("This is the decimal number %d\n\r",'c');
			printf("This is the unsigned number %u\n\r",'c');
			printf("This is the octal number %o\n\r",'c');
			printf("This is the binary number %b\n\r",'c');
#endif
#ifdef PRINT_OUTPUT
			logitem(buf);
#endif
		}
#ifndef MINIMAL_SYNTH
		switch (buf[0])
		{	
		/* check for special words*
		* that wants to be handled*
			*	special if a single word clause like "to" */
		case SPECIALWORD:
			docitation = TRUE;
			break;
		case RATE:
			sprate = deadstop(buf[1], 75, 600);
			break;
		case CPAUSE:
			compause = mstofr(deadstop(buf[1],  -40, 30000));
			break;
		case PPAUSE:
			perpause = mstofr(deadstop(buf[1], -380, 30000));
			break;
		case NEW_SPEAKER:
			if(buf[1] <= 9)   /* new code, was  < 7, but that cut out some voices */
			{
				usevoice(buf[1]);
			}
			else
			{
				usevoice(1);
			}
			break;
		case NEW_PARAM:
			setparam(buf[1], buf[2]);
			break;
		case PITCH_CHANGE:
			if(reset_pitch == false)
			{
				default_pitch = curspdef[3];
				setparam(3, curspdef[3]+KS.pitch_delta);
				reset_pitch = true;
			}
			break;
		case SAVE:
			saveval();
			break;
		case   LAST_VOICE:
			loadspdef = true;
			break;
		case BREATH_BREAK:
			break;
		};
#endif
		return 0;
	}

	/*
	*  eat silence ...
	*/
	if (nextra==0 && buf[0]==SIL && symbols[lastoffs]==SIL)
		return 0;
		/*
		* Force in a comma if the clause is getting too long for the buffers.
		* This can	chomp down into the middle of a word. It should happen rarely
		* because of the "yellow line"  check (later on).
	*/
	if (nsymbtot+nextra+1 > NPHON_MAX-GUARD)
	{
		symbols[nsymbtot] = COMMA;
#ifndef MINIMAL_SYNTH
		user_durs[nsymbtot] = 0;
		user_f0[nsymbtot++] = 0;
#else
		nsymbtot++;
#endif
		speak_now();
	}
	
	
	/*
	* Kill font bits. Delete blocks of silence (I don't think this is
	* needed anymore).  Map WBOUND to COMMA if we are getting near the
	* end of the buffer.
	*/
	
	buf[0] &= ~PFONT;
	if (nsymbtot>=NPHON_MAX-GUARD && buf[0]==WBOUND)
		buf[0] = COMMA;
		/*
		* Handle explict pitch, duration.
	*/
	if(nextra != 0)
	{
		lastoffs = nsymbtot;
		symbols[nsymbtot]   = buf[0];
#ifndef MINIMAL_SYNTH
		user_durs[nsymbtot] = buf[1];
		
		if (nextra == 1)
			user_f0[nsymbtot] = 0;
		else
			user_f0[nsymbtot] = buf[2];
#endif
		nsymbtot++;
		if (ispause(buf[0]) == FALSE)
			nphone = 0;
		if (isbound(buf[0]) != FALSE)
			bound = buf[0];
		return 0;
	}
	/*
	* Adjust the strength of syntactic markers.
	*/
	if (issmark(buf[0]) && issmark(symbols[lastoffs]))
	{
		if(buf[0] == VPSTART && (bound==PPSTART || bound==VPSTART))
			return 0;
		if(symbols[lastoffs] >= buf[0])
			return 0;
		if(buf[0]==PPSTART && nphone>25)
			buf[0] = VPSTART;
		if (lastoffs != 0)
		{
#ifndef MINIMAL_SYNTH
			user_durs[lastoffs] = 0;
			user_f0[lastoffs]   = 0;
#endif
			for(workp = &symbols[lastoffs+1];workp != &symbols[nsymbtot];workp++)
				workp[-1] = workp[0];
			nsymbtot -= 1;
			/* adjust_index(lastoffs+1,-1); out eab */
		}
	}
	nphone+=1;
	if(ispause(buf[0]) == FALSE)
		nphone = 0;
	if(isbound(buf[0]))
		bound = buf[0];
	lastoffs = nsymbtot;
	
	/*
	*  finally, buffer the phone in the array and speak if it is a delimiter ...
	*/
	
	symbols[nsymbtot] = buf[0];
#ifndef MINIMAL_SYNTH
	user_durs[nsymbtot] = 0;
	user_f0[nsymbtot++] = 0;
#else
	nsymbtot++;
#endif
	if(isdelim(buf[0]))
		speak_now();
}
/*
 *  speak now is used to speak any buffered phonemes and reset the
 *  parameters ...
 */

void speak_now()
{
#ifdef DTEX
    if (KS.spc_sleeping)
	{
	/* we've put the DSP to sleep; have to wake it up before 
	 * we try to do anything else. Make sure there is a speakerdef
	 * packet in there to reinit the DSP before anything else
	 * gets to it..
	 */
	dsp_wakeup();
	setspdef();
	}
#endif /*DTEX*/
   if(nsymbtot > 1 && KS.halting == false)
   {
      if(KS.logflag&LOG_PHONEMES)
		{
#ifdef DEBUG
/*	Added to debug [:log ...] printing problem 14-MAR-95 cjl*/
	printf("This is the character %c\n\r",'c');
/*	printf("This is the float number %f\n\r",9.0/5.0);*/
	printf("This is the string %s\n\r","test");
	printf("This is the hex number %x\n\r",'c');
	printf("This is the decimal number %d\n\r",'c');
	printf("This is the unsigned number %u\n\r",'c');
	printf("This is the octal number %o\n\r",'c');
	printf("This is the binary number %b\n\r",'c');
#endif
#ifdef PRINT_OUTPUT
	logclaus(symbols,nsymbtot,user_durs,user_f0);
#endif
		}
#ifdef PRINT_OUTPUT
      if(KS.logflag&LOG_SYLLABLES)
         logsyllable();
      if(KS.sayflag == SAY_SYLLABLE)
         saysyllable();
      else
#endif
         phclause();
		/* ...tek 6/14/95 make sure this gets to the DSP.. */
#ifdef OPERATING_SYSTEM
	  block(NULL_FP); /* run a scheduler pass.. */
#endif
      if(reset_pitch)
      {
         setparam(3,default_pitch);
         reset_pitch = false;
      }
   }
  else /*tek 6/25/96 */
   {
   	/* we might have a load-speaker pending with nothing else in */
	/* process.. */
	if (loadspdef)
		{
		setspdef();
		loadspdef=0;
		}
   }
#ifndef MINIMAL_SYNTH
#ifndef NO_INDEXES
   check_index(HUGE);
#endif
#endif
   symbols[0] = COMMA;
   bound = COMMA;
   lastoffs = 0;
   nsymbtot = 1;
   nphone = 0;
   asperation = 0;
}
/*
 * Check that a "value" is between the "low" and "high" limits.
 */

deadstop(value, low, high)
int   value,low,high;
{
   if (value < low)
      return (low);
   if (value > high)
      return (high);
   return (value);
}
/*
 * Read a phoneme, along with its extra words, from the pipe to
 * letter to sound. Pack the phoneme into the supplied buffer.
 * Clear the "number of extra words" field in the phoneme, and
 * return the number of extra words.
 */
#ifndef NO_CMD

int readphone(short buf[],short *input_phone)
{
   int   nextra;
   int   i;

   while(true)
   {
#ifdef SINGLE_THREADED
		buf[0]=input_phone[0];
#else
		read_pipe(kinp,&buf[0],1);
#endif
#ifdef GLD
printf("\n(%d)",buf[0]&0xff);
#endif
      nextra = (buf[0]&PNEXTRA) >> PSNEXTRA;
      buf[0] &= ~PNEXTRA;
      for(i=1;i <= nextra;i++)
      {
#ifdef SINGLE_THREADED
		  /* This was reading the same indexed phone for each pass (input_phone[0]),
		     but should be reading successive phones (input_phone[i]) */
		  buf[i]=input_phone[i];
#else
		  read_pipe(kinp,&buf[i],1);
#endif

#ifdef GLD
printf("\n(*%d)",buf[i]&0xff);
#endif
         if(KS.halting)
         {
            if(buf[i] == SYNC)
            {
               buf[0] = SYNC;
               return(0);
            }
         }
      }

      if(KS.halting == false || buf[0] == SYNC)
         return(nextra);
	  if(KS.halting)
	  {
		  buf[0] = SYNC;
		  return(0);
	  }
   }
}
#endif
/*
 * Convert a duration from milliseconds to frames, watching out for
 * fixed point overflow. A long (32 bit) temporary variable is used to
 * do the "*10" and "\nSAMP_FRAME".
 */

#if   NSAMP_FRAME != 64
<<< Big trouble. In "PH" code too! >>>
#endif

mstofr(nms)
int nms;
{
   long   temp;

   temp = (long)nms;
   temp *= 10;
   return((int)(temp >> 6));
}

/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995, 1998. All rights reserved.
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
 *    File Name:    ph_task.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    This file contains the
 *    mainline of the synthesizer task.
 *    It reads phonemes from letter to
 *    sound, packs them into clauses, and
 *    converts them to signal processor
 *    control frames.
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------  
 * 001  DGC		12/27/1984		Renamed from "kl1.c". Many edits for
 *                      		the new synthesizer.
 * 002  DGC		01/02/1985    	Added an "mstofr" routine that watches
 *                      		out for overflow on 16 bit machines.
 * 003  DGC 	01/19/1985  	Dennis changed "phdefs.h" so that it always
 *                      		included "def.h". Deleted the include line
 *                      		hat was in this file.
 * 004  DGC		01/24/1985	    Added some code at the top of the main
 *                      		loop that turns WBOUND into COMMA if it
 *                      		looks like we are getting close to the edge.
 * 005  DGC 	01/31/1985   	Changed the way that "SYNC" is done.
 * 006  DGC 	03/06/1985	    Changed the code that writes out the index
 *                      		reply stuff to use "PUTSEQ".
 * 007  DGC 	04/17/1985	    Changes due to default/0 change in "ansi.c".
 * 008  DGC		06/02/1985	    Added LOG_PHONEME.
 * 009  DGC 	06/07/1985	    "ef" => "lx" in speaker definition.
 * 010  DGC		06/18/1985	    "g5" => "lo" in speaker definition.
 * 011  DGC 	06/19/1985	    Enforce limits for ":ra", ":cp", ":pp".
 * 012  DGC		07/26/1985    	"outpar" isn't  structure anymore.
 * 013  DGC		08/08/1985    	"haltsw" (FLAG) => "halting" (short), new sync.
 * ------------------   Released as C5005 V1.0 firmware.
 * 014  DGC		08/21/1985    	Changes for KRM.
 * 015  DGC 	11/17/1985   	Fixed a bug in indexing found by Kurzweil.
 * 016  EAB 	01/12/1990   	Put in changes for NKR and SENT.(compile changes)
 * 017  EAB		01/16/1990    	change rate limit from 350 to 550
 * 018  EAB		07/25/1990    	ADDED COMMA PAUSE CHANGED FOR NANCY JARRELL-CHB
 * 019  SGS		09/07/1990    	Added PR control switches
 * 020  CJL		03/15/1995    	Added debug code for printf bug; uses define DEBUG
 * 021  JDB		09/17/1995   	Replaced /n's with \n's.
#ifdef GERMAN 					Merged from gph_main.c
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 * 014  ATS		03/23/1987    	Phoneme table lognames[] changed for German phonemes
 * 015  BNK		07/01/1987	    changed speaking rate to 220
 * 016  kak		07/24/1990   	ifdef for KRM
 * 013  CJL		03/30/1995 		File was phmain.c. Is now gphmain.c. Changed
 *                              phdefs.h->gphdefs.h
 * 014  JDB 	09/17/1995	    Fix \n's in printfs...
 * 015  GL		08/26/1995     	update the readphone() routine to be same as phmain.c
#endif
 * 022  MGS		03/21/1996	    WIN32 code merge
 * 023	MGS		06/06/1996 		Merged spanish with english
 * 024	MGS		06/18/1996	 	Merged german with spanish/english
 * 025	SIK		07/08/1996  	Cleaning up and maintenance
 * 026	GL		07/29/1996  	Update to be same as the latest 4.2c code.
 * 027  GL		09/16/1996		Add debug switch
 * 028  GL      10/03/1996		use period to end the [:sync] or control-K
 * 029	GL		11/11/1996		Add US_AND_SP dual language support for DTEX
 * 030	GL		12/11/1996		remove the WIN32 language pipe hack
 * 031	GL		03/27/1997		for BATS#319 
 *                              add 0800 debug switch.
 * 032	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 033	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 034  EAB		10/13/97		Edited for UK
 * 035  KSB		10/17/97		Added wordclass information passesed on.
 * 036  EAB		10/19/97		add slow-talk code
 * 037  GL		11/13/97		restore the "comma" to end the control phoneme
 *                              for NWSNOAA (under MSDOS) only
 * 038 tek      11/12/97        merge in aug97 BATS404 (SAPI transport)
 * 038  GL		11/22/97		support LINKRWORD
 * 039 MGS		02/05/98		Added GetCurrentPitch function for sapi Group F
 * 040 CJL      03/18/98        Removed specific path for dectalkf.h.
 * 041 JAW      04/06/98        Added GetSpeakerParams and SetSpeakerParams functions.
 *                              Included objbase.h for CoTaskMemAlloc.
 * 042 JAW      04/27/98        Added support for glottal speed in GetSpeakerParams and
 *                              SetSpeakerParams.  Made both functions access output gain
 *                              multiplier only if WIN32 or __osf__ is defined and i386 isn't.
 * 043 JAW      05/01/98        In GetSpeakerParams, made it so CoTaskMemAlloc/CoTaskMemFree
 *                              will only be used if WIN32 is defined; otherwise, malloc/free
 *                              will be used.
 * 044 JAW      05/04/98        Made GetSpeakerParams and SetSpeakerParams only be compiled
 *                              under non-MS-DOS environments.
 * 045	MFG		05/08/98		added dbglog.txt logging for debug switch[:debug 2001]
 * 046	MFG		05/19/98		excluded dbglog logging when build 16-bit code (MSDOS)	 
 * 047  JAW      06/11/98        Fixed GetSpeakerParams and SetSpeakerParams so they will work
 *                              with the CE.
 * 048	mfg		06/22/98		Added support for LANG_latin_american
 * 049  EAB		8/98 			Added new debug option
 * 050  EAB		8/15/98			Modified behavior of wordclass so it's easier to use.
 * 051  GL		9/01/98			BATS#755 fix debug switch 2001 PH pipe data display
 * 052  ETT		10/05/98		added linux code.
 * 053  EAB		 1/25/99		Remove unused linkr code
 * 054  EAB		2/3/99			Added change from NWSNOAA->NWS_US for multi language NOAA
 */
 
#include "dectalkf.h"
#include "ph_def.h"				/* the new all inclusive include file for ph */

#ifdef __linux__
#include <stdlib.h>
#endif

#if defined(WIN32) && !defined(UNDER_CE)
#include "objbase.h" /* for CoTaskMemAlloc and CoTaskMemFree, JAW 4/6/98 */
#endif

/* #define GLD */

int              readphone (PKSD_T pKsd_t, register DT_PIPE_T buf[]);
void             speak_now (LPTTS_HANDLE_T phTTS);


#ifdef MSDOS
	extern LPTTS_HANDLE_T phTTS;
#endif

/*
 *      Function Name: kltask()       
 *
 *  	Description: This function is the main
 * 					 function of the synthsizer task; this
 *					 task is created by the task creation loop
 *					 at boot time. It reads phonemes from the pipe
 *					 to letter to sound, packs them into clauses,
 *					 and calls the low level functions of the
 *					 wonderful Klatt synthesizer to make
 *					 DECtalk talk.
 *
 *      Arguments: #ifdef MSDOS
 *						void
 *					#else
 *						LPTTS_HANDLE_T phTTS 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
#ifdef MSDOS
void far kltask (void)
#else
void far kltask (LPTTS_HANDLE_T phTTS)
#endif
{
	register int            nextra;
	register short         *workp;

	short                   buf[4];
	int                     new_phone;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	/* 
 	 *  ph initialization ...
 	 */
    /* speaking rate set to 180 as default */
	pKsd_t->sprate = 180;
#ifdef WITHOUT_CALLOC
	pDph_t->perpause = 0;
	pDph_t->compause = 0;
#endif

	pDph_t->param[F0].outp = &(pDph_t->parstochip[OUT_T0]);
	pDph_t->param[F1].outp = &(pDph_t->parstochip[OUT_F1]);
	pDph_t->param[F2].outp = &(pDph_t->parstochip[OUT_F2]);
	pDph_t->param[F3].outp = &(pDph_t->parstochip[OUT_F3]);
	pDph_t->param[FZ].outp = &(pDph_t->parstochip[OUT_FZ]);
	pDph_t->param[B1].outp = &(pDph_t->parstochip[OUT_B1]);
	pDph_t->param[B2].outp = &(pDph_t->parstochip[OUT_B2]);
	pDph_t->param[B3].outp = &(pDph_t->parstochip[OUT_B3]);
	pDph_t->param[AV].outp = &(pDph_t->parstochip[OUT_AV]);
	pDph_t->param[AP].outp = &(pDph_t->parstochip[OUT_AP]);
	pDph_t->param[A2].outp = &(pDph_t->parstochip[OUT_A2]);
	pDph_t->param[A3].outp = &(pDph_t->parstochip[OUT_A3]);
	pDph_t->param[A4].outp = &(pDph_t->parstochip[OUT_A4]);
	pDph_t->param[A5].outp = &(pDph_t->parstochip[OUT_A5]);
	pDph_t->param[A6].outp = &(pDph_t->parstochip[OUT_A6]);
	pDph_t->param[AB].outp = &(pDph_t->parstochip[OUT_AB]);
	pDph_t->param[TILT].outp = &(pDph_t->parstochip[OUT_TLT]);

	init_phclause (pDph_t);
	usevoice (phTTS, PERFECT_PAUL);
	saveval (pDph_t);
	new_phone = TRUE;
	pDph_t->reset_pitch = FALSE;
	pKsd_t->speaker = (int _far *) &(pDph_t->curspdef[0]);
	pDph_t->symbols[0] = COMMA;
	pDph_t->bound = COMMA;
	pDph_t->nsymbtot = 1;
#ifdef WITHOUT_CALLOC
	pDph_t->lastoffs = 0;
	pDph_t->nphone = 0;
	pDph_t->asperation = 0;
	pDph_t->ph_init = 0;			   /* MVP:03/18/96 */
#endif

	while (TRUE)
	{
		/* display debug switch manual once */
		if (pKsd_t->debug_switch == 0x2fff)
		{
			printf("PH debug switch description:\n");
			printf("2001 -- Incoming PH code      2002 -- log phonemes\n");
			printf("2004 -- log syllable          2008 -- log outphone\n");
			printf("2010 -- log inton commands    2020 -- not used\n");
			printf("2040 -- not used              2080 -- not used\n");
			printf("2100 -- not used              2200 -- not used\n");
            printf("2400 -- not used              2800 -- no voice output\n");
						
			/* reset to 0 again */
			pKsd_t->debug_switch = 0;
		}
		nextra = readphone (pKsd_t, buf);
		if (pKsd_t->halting)
		{
			speak_now (phTTS);
			if (pDph_t->reset_pitch)
			{
				setparam (pDph_t, 3, pDph_t->default_pitch);
				pDph_t->reset_pitch = FALSE;
			}
			if (buf[0] != SYNC)
				continue;
		}

		/* 
		 * Check for syncs and always process them ... 
		 */

		if (buf[0] == SYNC || buf[0] == CNTRLK)
		{
			speak_now (phTTS);

#ifndef SEPARATE_PROCESSES
#ifdef MSDOS
			spcwrite ((unsigned short _far *) spcget (SPC_type_sync));
#endif
/* GL 04/21/1997  change to be the same as the latest OSF code */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
			buf[0] = SPC_type_sync;
			write_pipe (pKsd_t->vtm_pipe, buf, 1);
#endif
#endif


		/* 
		 * #ifdef WIN32 buf[0] = SPC_type_sync; 
		 * write_pipe( pKsd_t->vtm_pipe, buf, 1 ); 
		 * #endif 
		 * #ifdef __osf__ buf[0] = SPC_type_sync; 
		 * write_pipe( vtm_pipe, buf, 1 ); 
		 * #endif 
		 */
			continue;
		}

		/* 
		 *  Now process the phoneme ...  look for special async control
		 *  changes ...
		 */

		if (pKsd_t->async_change)
		{
			speak_now (phTTS);
			while (pKsd_t->async_change)
			{
				if (pKsd_t->async_change & ASYNC_rate)
				{
#ifdef SLOWTALK
					pKsd_t->sprate = deadstop (pKsd_t->async_rate, 75, 600);
#else
					pKsd_t->sprate = deadstop (pKsd_t->async_rate, 50, 600);
#endif
					pKsd_t->async_change &= (~ASYNC_rate);
				}
				if (pKsd_t->async_change & ASYNC_rate_delta)
				{
#ifdef SLOWTALK
					pKsd_t->sprate = deadstop (pKsd_t->sprate + pKsd_t->async_rate, 75, 600);

#else
					pKsd_t->sprate = deadstop (pKsd_t->sprate + pKsd_t->async_rate, 50, 600);
#endif
					
					pKsd_t->async_change &= (~ASYNC_rate_delta);
				}
				if (pKsd_t->async_change & ASYNC_voice)
				{
					usevoice (phTTS, pKsd_t->async_voice);
					pKsd_t->async_change &= (~ASYNC_voice);
				}
				if (pKsd_t->async_change & ASYNC_comma)
				{
					pDph_t->compause = mstofr (deadstop (pKsd_t->async_comma, -40, 30000));
					pKsd_t->async_change &= (~ASYNC_comma);
				}
				if (pKsd_t->async_change & ASYNC_period)
				{
					pDph_t->perpause = mstofr (deadstop (pKsd_t->async_period, -380, 30000));
					pKsd_t->async_change &= (~ASYNC_period);
				}
			}
#ifdef MSDOS
			continue;
#endif
		}

		/* 
		 *  insert indexes into the chain ...
		 */
#ifdef ENGLISH
			if ((buf[0] & ~PFONT) == SPECIALWORD)
			{
				pDph_t->docitation = 1;
			}
#endif
		/* debug eab */
		if (   buf[0] == INDEX 
			|| buf[0] == INDEX_REPLY   // tek 01aug97 bats 404 new msg types
#ifdef _WIN32
			|| buf[0] == INDEX_BOOKMARK
			|| buf[0] == INDEX_WORDPOS
			|| buf[0] == INDEX_START
			|| buf[0] == INDEX_STOP
#endif //_WIN32
		   )
		{
#ifdef MSDOS
				save_index (pDph_t->nsymbtot, buf[0], buf[1], buf[2]);
#else
				save_index (pKsd_t, pDph_t->nsymbtot, buf[0], buf[1], buf[2]);
#endif



			continue;
		}

		
	/* sets wordclass but I want it marked throughout the word because I don't know where it started*/
		pDph_t->wordclass[pDph_t->nsymbtot] = pDph_t->holdwordclass;


		/* 
		 *  process control phones ...
		 */

		if ((buf[0] & PFONT) == (PFCONTROL << PSFONT))
		{
			if (buf[0] == WORD_CLASS) {
			//	printf("int ph %04x%04x\n",buf[1],buf[2]);
				pDph_t->holdwordclass = (buf[1] << 16) + buf[2];
				pDph_t->wordclass[pDph_t->nsymbtot]=pDph_t->holdwordclass;
				continue;
			}
		
			if (pDph_t->nsymbtot > 1)
			{
				/* pDph_t->symbols[pDph_t->nsymbtot] = COMMA;*/
				/* GL 10/03/1996, use period to end the control phones */
				/* GL 11/13/1997  set to comma for NWSNOAA */
#if defined (NWS_US) && defined (MSDOS)
				pDph_t->symbols[pDph_t->nsymbtot] = COMMA;
#else
				pDph_t->symbols[pDph_t->nsymbtot] = PERIOD;
#endif
				pDph_t->user_durs[pDph_t->nsymbtot] = 0;
				pDph_t->user_f0[pDph_t->nsymbtot++] = 0;
				speak_now (phTTS);
				/* Used to write SPC_type_force here WIH 3/2/94 */
			}
			/* debug switch */
			if ((pKsd_t->logflag & LOG_PHONEMES) || DT_DBG(PH_DBG,0x002))
			{
#ifdef DEBUG
/* Added to debug [:log ...] printing problem 14-MAR-95 cjl */
				printf ("This is the character %c\n\r", 'c');
/* printf("This is the float number %f\n\r",9.0/5.0); */
				printf ("This is the string %s\n\r", "test");
				printf ("This is the hex number %x\n\r", 'c');
				printf ("This is the decimal number %d\n\r", 'c');
				printf ("This is the unsigned number %u\n\r", 'c');
				printf ("This is the octal number %o\n\r", 'c');
				printf ("This is the binary number %b\n\r", 'c');
#endif
#ifdef MSDOS
				logitem (buf);
#else
				logitem (phTTS, buf);
#endif
			}
			switch (buf[0])
			{
				/* 
				 * check for special words 
				 * that wants to be handled 
				 * special if a single word clause like "to" 
				 */

#ifdef ENGLISH
			case SPECIALWORD:

				pDph_t->docitation = TRUE;
				break;
#endif
			
			case RATE:


#ifdef SLOWTALK
				pKsd_t->sprate = deadstop (buf[1], 50, 550);
#else
				pKsd_t->sprate = deadstop (buf[1], 75, 600);
#endif


				break;

			case CPAUSE:

				pDph_t->compause = mstofr (deadstop (buf[1], -40, 30000));
				break;

			case PPAUSE:

				pDph_t->perpause = mstofr (deadstop (buf[1], -380, 30000));
				break;

			case NEW_SPEAKER:

				if (buf[1] < MAX_SPEAKERS)	/* changed from <=9 to < MAX_SPEAKERS */
					/* new code, was  < 7, but that cut out some voices */
				{
					usevoice (phTTS, buf[1]);
				}
				else
				{
					usevoice (phTTS, 1);
				}
				break;
#ifdef SPANISH
			case LATIN:

				if (buf[1] == 1)
				{
					pDph_t->th_to_s = 1;
				}
				else
				{
					pDph_t->th_to_s = 0;
				}

				break;
#endif

			case NEW_PARAM:

				setparam (pDph_t, buf[1], buf[2]);
				break;

			case PITCH_CHANGE:

				if (pDph_t->reset_pitch == FALSE)
				{
					pDph_t->default_pitch = pDph_t->curspdef[3];
					setparam (pDph_t, 3, (pDph_t->curspdef[3] + pKsd_t->pitch_delta));
					pDph_t->reset_pitch = TRUE;
				}
				break;

			case SAVE:

				saveval (pDph_t);
				break;

			case LAST_VOICE:

				pDph_t->loadspdef = TRUE;
				break;

			case BREATH_BREAK:
				break;
			};
			continue;
		}

		/* 
		 *  eat silence ...
		 */

		if (nextra == 0 && buf[0] == SIL && pDph_t->symbols[pDph_t->lastoffs] == SIL)
			continue;

		/* 
		 * Force in a comma if the clause is getting too long for the buffers.
		 * This can chomp down into the middle of a word. It should happen rarely
		 * because of the "yellow line"  check (later on).
		 */

		if ((pDph_t->nsymbtot + nextra + 1) > (NPHON_MAX - 1))
		{
			pDph_t->symbols[pDph_t->nsymbtot] = COMMA;
			pDph_t->user_durs[pDph_t->nsymbtot] = 0;
			pDph_t->user_f0[pDph_t->nsymbtot++] = 0;
			speak_now (phTTS);
		}

		/* 
		 * Kill font bits. Delete blocks of silence (I don't think this is
		 * needed anymore).  Map WBOUND to COMMA if we are getting near the
		 * end of the buffer.
		 */

		buf[0] &= ~PFONT;
		if (pDph_t->nsymbtot >= (NPHON_MAX - GUARD) && (buf[0] == WBOUND))
			buf[0] = COMMA;
		/* 
		 * Handle explict pitch, duration.
		 */

		if (nextra != 0)
		{
			pDph_t->lastoffs = pDph_t->nsymbtot;
			pDph_t->symbols[pDph_t->nsymbtot] = buf[0];
			pDph_t->user_durs[pDph_t->nsymbtot] = buf[1];
			if (nextra == 1)
				pDph_t->user_f0[pDph_t->nsymbtot] = 0;
			else
				pDph_t->user_f0[pDph_t->nsymbtot] = buf[2];
			pDph_t->nsymbtot++;
			if (ispause (buf[0]) == FALSE)
				pDph_t->nphone = 0;
			if (isbound (buf[0]) != FALSE)
				pDph_t->bound = buf[0];
			continue;
		}

		/* 
		 * Adjust the strength of syntactic markers.
		 */

		if (issmark (buf[0]) && issmark (pDph_t->symbols[pDph_t->lastoffs]))
		{
			if ((buf[0] == VPSTART) && ((pDph_t->bound == PPSTART) || (pDph_t->bound == VPSTART)))
				continue;
			if (pDph_t->symbols[pDph_t->lastoffs] >= buf[0])
				continue;
			if (buf[0] == PPSTART && (pDph_t->nphone > 25))
				buf[0] = VPSTART;
			if (pDph_t->lastoffs != 0)
			{
				pDph_t->user_durs[pDph_t->lastoffs] = 0;
				pDph_t->user_f0[pDph_t->lastoffs] = 0;
				for (workp = &pDph_t->symbols[pDph_t->lastoffs + 1];
					 workp != &pDph_t->symbols[pDph_t->nsymbtot];
					 workp++)
					workp[-1] = workp[0];
				pDph_t->nsymbtot -= 1;
				/* adjust_index(pKsd_t,lastoffs+1,-1); out eab */
			}
		}

		pDph_t->nphone += 1;
		if (ispause (buf[0]) == FALSE)
			pDph_t->nphone = 0;
		if (isbound (buf[0]))
			pDph_t->bound = buf[0];
		pDph_t->lastoffs = pDph_t->nsymbtot;

		/* 
		 *  finally, buffer the phone in the array and speak if it is a delimiter ...
		 */

		pDph_t->symbols[pDph_t->nsymbtot] = buf[0];
		pDph_t->user_durs[pDph_t->nsymbtot] = 0;
		pDph_t->user_f0[pDph_t->nsymbtot++] = 0;
		if (isdelim (buf[0]))
			speak_now (phTTS);
	}
}

/*
 *      Function Name: speak_now()      
 *
 *  	Description: speak now is used to speak any buffered phonemes and reset the
 *  				 parameters ...
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void speak_now (LPTTS_HANDLE_T phTTS)
{
#ifndef MSDOS
	DT_PIPE_T               pipe_item[1];

#endif
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

#ifdef DTEX
	if (pKsd_t->spc_sleeping)
	{
		/* 
		 * we've put the DSP to sleep; have to wake it up before  
		 * we try to do anything else. Make sure there is a speakerdef 
		 * packet in there to reinit the DSP before anything else 
		 * gets to it.. 
		 */
		dsp_wakeup ();
		setspdef (phTTS);
	}
#endif								   /* DTEX */

	if ((pDph_t->nsymbtot > 1) && (pKsd_t->halting == FALSE))
	{
		/* debug switch */
		if ((pKsd_t->logflag & LOG_PHONEMES) || DT_DBG(PH_DBG,0x002))
		{
#ifdef DEBUG
/* Added to debug [:log ...] printing problem 14-MAR-95 cjl */
			printf ("This is the character %c\n\r", 'c');
/* printf("This is the float number %f\n\r",9.0/5.0); */
			printf ("This is the string %s\n\r", "test");
			printf ("This is the hex number %x\n\r", 'c');
			printf ("This is the decimal number %d\n\r", 'c');
			printf ("This is the unsigned number %u\n\r", 'c');
			printf ("This is the octal number %o\n\r", 'c');
			printf ("This is the binary number %b\n\r", 'c');
#endif
#ifdef MSDOS
			logclaus (pDph_t->symbols, pDph_t->nsymbtot, pDph_t->user_durs, pDph_t->user_f0);
#else
			logclaus (phTTS, pDph_t->symbols, pDph_t->nsymbtot, pDph_t->user_durs, pDph_t->user_f0);
#endif
		}
#if (defined ENGLISH) || (defined SPANISH) /* no syllablification in german */
		/* debug switch */
		if ((pKsd_t->logflag & LOG_SYLLABLES) || DT_DBG(PH_DBG,0x004))
			logsyllable (phTTS);
		if (pKsd_t->sayflag == SAY_SYLLABLE)
		{
				saysyllable (phTTS);
		}		
		else
#endif	
			phclause (phTTS);
#ifdef MSDOS
		block (NULL_FP);			   /* run a scheduler pass.. */
#endif
		if (pDph_t->reset_pitch)
		{
			setparam (pDph_t, 3, pDph_t->default_pitch);
			pDph_t->reset_pitch = FALSE;
		}
	}
#ifdef MSDOS
        else /*tek 6/25/96 */
        {
           /* we might have a load-speaker pending with nothing else in */
           /* process.. */
           if (pDph_t->loadspdef)
           {
                setspdef(phTTS);
                pDph_t->loadspdef=0;
            }
        }
	check_index (HUGE);
#else
	check_index (pKsd_t, HUGE);
#endif

	pDph_t->symbols[0] = COMMA;
	pDph_t->bound = COMMA;
	pDph_t->lastoffs = 0;
	pDph_t->nsymbtot = 1;
	pDph_t->nphone = 0;
	pDph_t->asperation = 0;

/* GL 04/21/1997  change to be the same as the latest OSF code */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
	/* write forced clause boundary symbol to VTM */
	pipe_item[0] = SPC_type_force;
	/* debug switch GL 3/27/1997 BATS#319 */
	if (!(DT_DBG(PH_DBG,0x800)))
	write_pipe (pKsd_t->vtm_pipe, pipe_item, 1);
#endif
}


/*
 *      Function Name: deadstop()      
 *
 *  	Description: Check that a "value" is between the "low" and "high" limits.
 *					 Returns low if value < low; high if value > high.
 *
 *      Arguments: 	int value,		Value to check
 *					int low,        Lower limit
 *					int high        Upper limit
 *
 *      Return Value: int; low or high
 *
 *      Comments:
 *
 */
int deadstop (int value, int low, int high)
{
	if (value < low)
		return (low);
	if (value > high)
		return (high);
	return (value);
}

/*
 *      Function Name: readphone ()     
 *
 *  	Description: Read a phoneme, along with its extra words, from the pipe to
 * 					 letter to sound. Pack the phoneme into the supplied buffer.
 * 					 Clear the "number of extra words" field in the phoneme, and
 * 					 return the number of extra words.
 *
 *      Arguments: 	 PKSD_T pKsd_t,  			Pointer to kernel data structure
 *					 register DT_PIPE_T buf[]   Pipe buffer
 *
 *      Return Value: int 
 *
 *      Comments:
 *
 */
static int readphone (PKSD_T pKsd_t, register DT_PIPE_T buf[])
{
	int nextra;
	int i;

	/* MVP MI declare kinp local variable and initialize */
	P_PIPE                  kinp;
	
#ifdef ENGLISH_US
		kinp = pKsd_t->lang_ph[LANG_english];
#endif
#ifdef ENGLISH_UK
		kinp = pKsd_t->lang_ph[LANG_british];
#endif
#ifdef SPANISH_SP
		kinp = pKsd_t->lang_ph[LANG_spanish];
#endif
#ifdef SPANISH_LA
		kinp = pKsd_t->lang_ph[LANG_latin_american];
#endif
#ifdef GERMAN
		kinp = pKsd_t->lang_ph[LANG_german];
#endif
#ifdef FRENCH
		kinp = pKsd_t->lang_ph[LANG_french];
#endif

	while (TRUE)
	{
		read_pipe (kinp, &buf[0], 1);
//		if (((buf[0] & 0xff)>=121)  && ((buf[0] & 0xff) <=129))
		/* GL 11/22/1997 support LINKRWORD(121) */
		if (((buf[0] & 0xff)>=PHO_SYM_TOT)  && ((buf[0] & 0xff) <=129))
			continue;

		/* debug switch */
		/* GL 09/01/1998 BATS#755  fix the PH pipe data display format to show the control section */
		if (DT_DBG(PH_DBG,0x001))
		{
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
			{
				if ((buf[0] & 0x1f00) != PFCONTROL << PSFONT)
					fprintf (pKsd_t->dbglog,"\n(%d-%d--%d-%c%c)",(buf[0] & 0xe000) >> PSNEXTRA,(buf[0] & 0x1f00) >> PSFONT,buf[0] & 0xff,
											   pKsd_t->arpabet[(buf[0] & 0xff) * 2],pKsd_t->arpabet[(buf[0] & 0xff) * 2 + 1]);
				else
				{
					fprintf (pKsd_t->dbglog,"\n(*%d-%d--%d)",(buf[0] & 0xe000) >> PSNEXTRA,(buf[0] & 0x1f00) >> PSFONT,buf[0] & 0xff);
				}
			}
#endif
			if ((buf[0] & 0x1f00) != PFCONTROL << PSFONT)
				printf ("\n(%d-%d--%d-%c%c)",(buf[0] & 0xe000) >> PSNEXTRA,(buf[0] & 0x1f00) >> PSFONT,buf[0] & 0xff,
											   pKsd_t->arpabet[(buf[0] & 0xff) * 2],pKsd_t->arpabet[(buf[0] & 0xff) * 2 + 1]);
			else
			{
				printf ("\n(*%d-%d--%d)",(buf[0] & 0xe000) >> PSNEXTRA,(buf[0] & 0x1f00) >> PSFONT,buf[0] & 0xff);
			}
		}

		nextra = (buf[0] & PNEXTRA) >> PSNEXTRA;
		buf[0] &= ~PNEXTRA;
		for (i = 1; i <= nextra; i++)
		{
			read_pipe (kinp, &buf[i], 1);

		/* debug switch */
		if (DT_DBG(PH_DBG,0x001))
		{
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
				fprintf (pKsd_t->dbglog,"\n(#%u[0x%x])",buf[i],buf[i]);
#endif
			printf ("\n(#%u[0x%x])",buf[i],buf[i]);
		}
			if (pKsd_t->halting)
			{
				if (buf[i] == SYNC)
				{
					buf[0] = SYNC;
					return (0);
				}
			}
		}
		if (pKsd_t->halting == FALSE || buf[0] == SYNC)
			return (nextra);
	}
}

/*
 *      Function Name: mstofr()     
 *
 *  	Description: Convert a duration from milliseconds to frames, watching out for
 * 					 fixed point overflow. A long (32 bit) temporary variable is used to
 * 					 do the "*10" and "/NSAMP_FRAME".
 *
 *      Arguments:  int nms;	Number of milliseconds 
 *
 *      Return Value: int; Number of frames 
 *
 *      Comments:
 *
 */
#ifdef MSDOS
#if     NSAMP_FRAME != 64
<<<Big trouble.In "PH" code too ! >>>
#endif
#endif

int mstofr (int nms)
{
        S32                     temp;

        temp = (S32) nms;
        temp *= 10;
        return ((int) (temp >> 6));
}

#ifdef WIN32
#ifdef SAPI_GROUP_F_INTERFACES
int GetCurrentPitch(LPTTS_HANDLE_T phTTS, int *pitch)
{
	PDPH_T pDph_t;
	if (phTTS==NULL)
		return(MMSYSERR_INVALPARAM);
	pDph_t = phTTS->pPHThreadData;
	*pitch=pDph_t->curspdef[SP_AP];
	return(MMSYSERR_NOERROR);
}
#endif
#endif

/* The following two functions are used for the API, so they are not compiled under MS-DOS.
   JAW 5/4/98 */
#ifndef MSDOS
/*********************************************************************************************/
/*  Function: GetSpeakerParams                                                               */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : April 6, 1998                                                                  */
/*                                                                                           */
/*  Description: This function is called by the API function TextToSpeechGetSpeakerParams.   */
/*               It returns the parameters for the current speaker, the limits for those     */
/*               parameters, and the current speaker's default parameters.                   */
/*********************************************************************************************/
MMRESULT GetSpeakerParams(LPTTS_HANDLE_T phTTS, UINT uiIndex, SPDEFS **ppspCur,
						  SPDEFS **ppspLoLimit, SPDEFS **ppspHiLimit, SPDEFS **ppspDefault)
{
	PDPH_T pDph_t;
	PKSD_T pKsd_t;
	extern LIMIT limit[];
	short speaker_num;
	short *cur_speaker=NULL;

	if (phTTS == NULL)
		return MMSYSERR_INVALPARAM;

	pDph_t = phTTS->pPHThreadData;
	pKsd_t = phTTS->pKernelShareData;

#if defined(WIN32) && !defined(UNDER_CE)
	*ppspCur     = (SPDEFS *) CoTaskMemAlloc(sizeof(SPDEFS));
#else
	*ppspCur     = (SPDEFS *) malloc(sizeof(SPDEFS));
#endif

	if (*ppspCur == NULL)
		return MMSYSERR_NOMEM;

#if defined(WIN32) && !defined(UNDER_CE)
	*ppspLoLimit = (SPDEFS *) CoTaskMemAlloc(sizeof(SPDEFS));
#else
	*ppspLoLimit = (SPDEFS *) malloc(sizeof(SPDEFS));
#endif

	if (*ppspLoLimit == NULL)
	{
#if defined(WIN32) && !defined(UNDER_CE)
		CoTaskMemFree(*ppspCur);
#else
		free(*ppspCur);
#endif
		return MMSYSERR_NOMEM;
	}

#if defined(WIN32) && !defined(UNDER_CE)
	*ppspHiLimit = (SPDEFS *) CoTaskMemAlloc(sizeof(SPDEFS));
#else
	*ppspHiLimit = (SPDEFS *) malloc(sizeof(SPDEFS));
#endif
	if (*ppspHiLimit == NULL)
	{
#if defined(WIN32) && !defined(UNDER_CE)
		CoTaskMemFree(*ppspCur);
		CoTaskMemFree(*ppspLoLimit);
#else
		free(*ppspCur);
		free(*ppspLoLimit);
#endif
		return MMSYSERR_NOMEM;
	}

#if defined(WIN32) && !defined(UNDER_CE)
	*ppspDefault = (SPDEFS *) CoTaskMemAlloc(sizeof(SPDEFS));
#else
	*ppspDefault = (SPDEFS *) malloc(sizeof(SPDEFS));
#endif
	if (*ppspDefault == NULL)
	{
#if defined(WIN32) && !defined(UNDER_CE)
		CoTaskMemFree(*ppspCur);
		CoTaskMemFree(*ppspLoLimit);
		CoTaskMemFree(*ppspHiLimit);
#else
		free(*ppspCur);
		free(*ppspLoLimit);
		free(*ppspHiLimit);
#endif
		return MMSYSERR_NOMEM;
	}

	/* Fill current speaker parameters */
	(*ppspCur)->sex                = pDph_t->curspdef[SP_SEX];
	(*ppspCur)->smoothness         = pDph_t->curspdef[SP_SM];
	(*ppspCur)->assertiveness      = pDph_t->curspdef[SP_AS];
	(*ppspCur)->average_pitch      = pDph_t->curspdef[SP_AP];
	(*ppspCur)->pitch_range        = pDph_t->curspdef[SP_PR];
	(*ppspCur)->breathiness        = pDph_t->curspdef[SP_BR];
	(*ppspCur)->richness           = pDph_t->curspdef[SP_RI];
	(*ppspCur)->num_fixed_samp_og  = pDph_t->curspdef[SP_NF];
	(*ppspCur)->laryngealization   = pDph_t->curspdef[SP_LA];
	(*ppspCur)->head_size          = pDph_t->curspdef[SP_HS];
	(*ppspCur)->formant4_res_freq  = pDph_t->curspdef[SP_F4];
	(*ppspCur)->formant4_bandwidth = pDph_t->curspdef[SP_B4];
	(*ppspCur)->formant5_res_freq  = pDph_t->curspdef[SP_F5];
	(*ppspCur)->formant5_bandwidth = pDph_t->curspdef[SP_B5];
	(*ppspCur)->parallel4_freq     = pDph_t->curspdef[SP_P4];
	(*ppspCur)->parallel5_freq     = pDph_t->curspdef[SP_P5];
	(*ppspCur)->gain_frication     = pDph_t->curspdef[SP_GF];
	(*ppspCur)->gain_aspiration    = pDph_t->curspdef[SP_GH];
	(*ppspCur)->gain_voicing       = pDph_t->curspdef[SP_GV];
	(*ppspCur)->gain_nasalization  = pDph_t->curspdef[SP_GN];
	(*ppspCur)->gain_cfr1          = pDph_t->curspdef[SP_G1];
	(*ppspCur)->gain_cfr2          = pDph_t->curspdef[SP_G2];
	(*ppspCur)->gain_cfr3          = pDph_t->curspdef[SP_G3];
	(*ppspCur)->gain_cfr4          = pDph_t->curspdef[SP_G4];
	(*ppspCur)->loudness           = pDph_t->curspdef[SP_LO];
	(*ppspCur)->spectral_tilt      = pDph_t->curspdef[SP_FT];
	(*ppspCur)->baseline_fall      = pDph_t->curspdef[SP_BF];
	(*ppspCur)->lax_breathiness    = pDph_t->curspdef[SP_LX];
	(*ppspCur)->quickness          = pDph_t->curspdef[SP_QU];
	(*ppspCur)->hat_rise           = pDph_t->curspdef[SP_HR];
	(*ppspCur)->stress_rise        = pDph_t->curspdef[SP_SR];
	(*ppspCur)->glottal_speed      = pDph_t->curspdef[SP_GS];
#if (defined (WIN32) || defined (__osf__) || defined (__linux__)) && !defined (i386)
	(*ppspCur)->output_gain_mult   = pDph_t->curspdef[SP_OS];
#endif


	/* Fill low limits for speaker parameters */
	/* The limits are taken from the limit array, which is defined in ph_vdefi.c. */
	(*ppspLoLimit)->sex                = limit[SP_SEX].l_min;
	(*ppspLoLimit)->smoothness         = limit[SP_SM].l_min;
	(*ppspLoLimit)->assertiveness      = limit[SP_AS].l_min;
	(*ppspLoLimit)->average_pitch      = limit[SP_AP].l_min;
	(*ppspLoLimit)->pitch_range        = limit[SP_PR].l_min;
	(*ppspLoLimit)->breathiness        = limit[SP_BR].l_min;
	(*ppspLoLimit)->richness           = limit[SP_RI].l_min;
	(*ppspLoLimit)->num_fixed_samp_og  = limit[SP_NF].l_min;
	(*ppspLoLimit)->laryngealization   = limit[SP_LA].l_min;
	(*ppspLoLimit)->head_size          = limit[SP_HS].l_min;
	(*ppspLoLimit)->formant4_res_freq  = limit[SP_F4].l_min;
	(*ppspLoLimit)->formant4_bandwidth = limit[SP_B4].l_min;
	(*ppspLoLimit)->formant5_res_freq  = limit[SP_F5].l_min;
	(*ppspLoLimit)->formant5_bandwidth = limit[SP_B5].l_min;
	(*ppspLoLimit)->parallel4_freq     = limit[SP_P4].l_min;
	(*ppspLoLimit)->parallel5_freq     = limit[SP_P5].l_min;
	(*ppspLoLimit)->gain_frication     = limit[SP_GF].l_min;
	(*ppspLoLimit)->gain_aspiration    = limit[SP_GH].l_min;
	(*ppspLoLimit)->gain_voicing       = limit[SP_GV].l_min;
	(*ppspLoLimit)->gain_nasalization  = limit[SP_GN].l_min;
	(*ppspLoLimit)->gain_cfr1          = limit[SP_G1].l_min;
	(*ppspLoLimit)->gain_cfr2          = limit[SP_G2].l_min;
	(*ppspLoLimit)->gain_cfr3          = limit[SP_G3].l_min;
	(*ppspLoLimit)->gain_cfr4          = limit[SP_G4].l_min;
	(*ppspLoLimit)->loudness           = limit[SP_LO].l_min;
	(*ppspLoLimit)->spectral_tilt      = limit[SP_FT].l_min;
	(*ppspLoLimit)->baseline_fall      = limit[SP_BF].l_min;
	(*ppspLoLimit)->lax_breathiness    = limit[SP_LX].l_min;
	(*ppspLoLimit)->quickness          = limit[SP_QU].l_min;
	(*ppspLoLimit)->hat_rise           = limit[SP_HR].l_min;
	(*ppspLoLimit)->stress_rise        = limit[SP_SR].l_min;
	(*ppspLoLimit)->glottal_speed      = limit[SP_GS].l_min;
	(*ppspLoLimit)->output_gain_mult   = limit[SP_OS].l_min;


	/* Fill high limits for speaker parameters */
	(*ppspHiLimit)->sex                = limit[SP_SEX].l_max;
	(*ppspHiLimit)->smoothness         = limit[SP_SM].l_max;
	(*ppspHiLimit)->assertiveness      = limit[SP_AS].l_max;
	(*ppspHiLimit)->average_pitch      = limit[SP_AP].l_max;
	(*ppspHiLimit)->pitch_range        = limit[SP_PR].l_max;
	(*ppspHiLimit)->breathiness        = limit[SP_BR].l_max;
	(*ppspHiLimit)->richness           = limit[SP_RI].l_max;
	(*ppspHiLimit)->num_fixed_samp_og  = limit[SP_NF].l_max;
	(*ppspHiLimit)->laryngealization   = limit[SP_LA].l_max;
	(*ppspHiLimit)->head_size          = limit[SP_HS].l_max;
	(*ppspHiLimit)->formant4_res_freq  = limit[SP_F4].l_max;
	(*ppspHiLimit)->formant4_bandwidth = limit[SP_B4].l_max;
	(*ppspHiLimit)->formant5_res_freq  = limit[SP_F5].l_max;
	(*ppspHiLimit)->formant5_bandwidth = limit[SP_B5].l_max;
	(*ppspHiLimit)->parallel4_freq     = limit[SP_P4].l_max;
	(*ppspHiLimit)->parallel5_freq     = limit[SP_P5].l_max;
	(*ppspHiLimit)->gain_frication     = limit[SP_GF].l_max;
	(*ppspHiLimit)->gain_aspiration    = limit[SP_GH].l_max;
	(*ppspHiLimit)->gain_voicing       = limit[SP_GV].l_max;
	(*ppspHiLimit)->gain_nasalization  = limit[SP_GN].l_max;
	(*ppspHiLimit)->gain_cfr1          = limit[SP_G1].l_max;
	(*ppspHiLimit)->gain_cfr2          = limit[SP_G2].l_max;
	(*ppspHiLimit)->gain_cfr3          = limit[SP_G3].l_max;
	(*ppspHiLimit)->gain_cfr4          = limit[SP_G4].l_max;
	(*ppspHiLimit)->loudness           = limit[SP_LO].l_max;
	(*ppspHiLimit)->spectral_tilt      = limit[SP_FT].l_max;
	(*ppspHiLimit)->baseline_fall      = limit[SP_BF].l_max;
	(*ppspHiLimit)->lax_breathiness    = limit[SP_LX].l_max;
	(*ppspHiLimit)->quickness          = limit[SP_QU].l_max;
	(*ppspHiLimit)->hat_rise           = limit[SP_HR].l_max;
	(*ppspHiLimit)->stress_rise        = limit[SP_SR].l_max;
	(*ppspHiLimit)->glottal_speed      = limit[SP_GS].l_max;
	(*ppspHiLimit)->output_gain_mult   = limit[SP_OS].l_max;


	speaker_num = pDph_t->curspdef[SP_NM];

	if (pKsd_t->uiSampleRate < 8763) /* 8-bit */
		switch (speaker_num) {
			case 0:	cur_speaker = paul_8;   break;
			case 1:	cur_speaker = betty_8;  break;
			case 2:	cur_speaker = harry_8;  break;
			case 3:	cur_speaker = frank_8;  break;
			case 4:	cur_speaker = dennis_8; break;
			case 5:	cur_speaker = kit_8;    break;
			case 6:	cur_speaker = ursula_8; break;
			case 7:	cur_speaker = rita_8;   break;
			case 8:	cur_speaker = wendy_8;  break;
		}
	else /* 16-bit */
		switch (speaker_num) {
			case 0:	cur_speaker = paul;   break;
			case 1:	cur_speaker = betty;  break;
			case 2:	cur_speaker = harry;  break;
			case 3:	cur_speaker = frank;  break;
			case 4:	cur_speaker = dennis; break;
			case 5:	cur_speaker = kit;    break;
			case 6:	cur_speaker = ursula; break;
			case 7:	cur_speaker = rita;   break;
			case 8:	cur_speaker = wendy;  break;
		}

	/* Fill default speaker parameters for current speaker */
	/* The default speaker parameters are taken from the appropriate array, which is defined */
	/* in p_??_vdf.c.                                                                        */
	(*ppspDefault)->sex                = cur_speaker[SP_SEX];
	(*ppspDefault)->smoothness         = cur_speaker[SP_SM];
	(*ppspDefault)->assertiveness      = cur_speaker[SP_AS];
	(*ppspDefault)->average_pitch      = cur_speaker[SP_AP];
	(*ppspDefault)->pitch_range        = cur_speaker[SP_PR];
	(*ppspDefault)->breathiness        = cur_speaker[SP_BR];
	(*ppspDefault)->richness           = cur_speaker[SP_RI];
	(*ppspDefault)->num_fixed_samp_og  = cur_speaker[SP_NF];
	(*ppspDefault)->laryngealization   = cur_speaker[SP_LA];
	(*ppspDefault)->head_size          = cur_speaker[SP_HS];
	(*ppspDefault)->formant4_res_freq  = cur_speaker[SP_F4];
	(*ppspDefault)->formant4_bandwidth = cur_speaker[SP_B4];
	(*ppspDefault)->formant5_res_freq  = cur_speaker[SP_F5];
	(*ppspDefault)->formant5_bandwidth = cur_speaker[SP_B5];
	(*ppspDefault)->parallel4_freq     = cur_speaker[SP_P4];
	(*ppspDefault)->parallel5_freq     = cur_speaker[SP_P5];
	(*ppspDefault)->gain_frication     = cur_speaker[SP_GF];
	(*ppspDefault)->gain_aspiration    = cur_speaker[SP_GH];
	(*ppspDefault)->gain_voicing       = cur_speaker[SP_GV];
	(*ppspDefault)->gain_nasalization  = cur_speaker[SP_GN];
	(*ppspDefault)->gain_cfr1          = cur_speaker[SP_G1];
	(*ppspDefault)->gain_cfr2          = cur_speaker[SP_G2];
	(*ppspDefault)->gain_cfr3          = cur_speaker[SP_G3];
	(*ppspDefault)->gain_cfr4          = cur_speaker[SP_G4];
	(*ppspDefault)->loudness           = cur_speaker[SP_LO];
	(*ppspDefault)->spectral_tilt      = cur_speaker[SP_FT];
	(*ppspDefault)->baseline_fall      = cur_speaker[SP_BF];
	(*ppspDefault)->lax_breathiness    = cur_speaker[SP_LX];
	(*ppspDefault)->quickness          = cur_speaker[SP_QU];
	(*ppspDefault)->hat_rise           = cur_speaker[SP_HR];
	(*ppspDefault)->stress_rise        = cur_speaker[SP_SR];
	(*ppspDefault)->glottal_speed      = cur_speaker[SP_GS];
#if (defined (WIN32) || defined (__osf__) || defined (__linux__)) && !defined (i386)
	(*ppspDefault)->output_gain_mult   = cur_speaker[SP_OS];
#endif


	return MMSYSERR_NOERROR;
}

/*********************************************************************************************/
/*  Function: SetSpeakerParams                                                               */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : April 6, 1998                                                                  */
/*                                                                                           */
/*  Description: This function is called by the API function TextToSpeechSetSpeakerParams.   */
/*               It receives a SPDEFS structure and sets the current speaker's parameters    */
/*               to the values in that SPDEFS structure.                                     */
/*********************************************************************************************/
MMRESULT SetSpeakerParams(LPTTS_HANDLE_T phTTS, SPDEFS *pspSet)
{
	PDPH_T pDph_t;

	if (phTTS == NULL)
		return MMSYSERR_INVALPARAM;

	pDph_t = phTTS->pPHThreadData;

	/* Set current speaker parameters */
	pDph_t->curspdef[SP_SEX] = pspSet->sex ;
	pDph_t->curspdef[SP_SM]  = pspSet->smoothness;
	pDph_t->curspdef[SP_AS]  = pspSet->assertiveness ;
	pDph_t->curspdef[SP_AP]  = pspSet->average_pitch ;
	pDph_t->curspdef[SP_PR]  = pspSet->pitch_range  ;
	pDph_t->curspdef[SP_BR]  = pspSet->breathiness ;
	pDph_t->curspdef[SP_RI]  = pspSet->richness ;
	pDph_t->curspdef[SP_NF]  = pspSet->num_fixed_samp_og;
	pDph_t->curspdef[SP_LA]  = pspSet->laryngealization;
	pDph_t->curspdef[SP_HS]  = pspSet->head_size    ;
	pDph_t->curspdef[SP_F4]  = pspSet->formant4_res_freq;
	pDph_t->curspdef[SP_B4]  = pspSet->formant4_bandwidth ;
	pDph_t->curspdef[SP_F5]  = pspSet->formant5_res_freq;
	pDph_t->curspdef[SP_B5]  = pspSet->formant5_bandwidth;
	pDph_t->curspdef[SP_P4]  = pspSet->parallel4_freq;
	pDph_t->curspdef[SP_P5]  = pspSet->parallel5_freq;
	pDph_t->curspdef[SP_GF]  = pspSet->gain_frication;
	pDph_t->curspdef[SP_GH]  = pspSet->gain_aspiration;
	pDph_t->curspdef[SP_GV]  = pspSet->gain_voicing ;
	pDph_t->curspdef[SP_GN]  = pspSet->gain_nasalization;
	pDph_t->curspdef[SP_G1]  = pspSet->gain_cfr1;
	pDph_t->curspdef[SP_G2]  = pspSet->gain_cfr2 ;
	pDph_t->curspdef[SP_G3]  = pspSet->gain_cfr3;
	pDph_t->curspdef[SP_G4]  = pspSet->gain_cfr4 ;
	pDph_t->curspdef[SP_LO]  = pspSet->loudness;
	pDph_t->curspdef[SP_FT]  = pspSet->spectral_tilt;
	pDph_t->curspdef[SP_BF]  = pspSet->baseline_fall;
	pDph_t->curspdef[SP_LX]  = pspSet->lax_breathiness;
	pDph_t->curspdef[SP_QU]  = pspSet->quickness ;
	pDph_t->curspdef[SP_HR]  = pspSet->hat_rise;
	pDph_t->curspdef[SP_SR]  = pspSet->stress_rise ;
	pDph_t->curspdef[SP_GS]  = pspSet->glottal_speed;
#if (defined (WIN32) || defined (__osf__) || defined (__linux__)) && !defined (i386)
	pDph_t->curspdef[SP_OS]  = pspSet->output_gain_mult;
#endif

	pDph_t->loadspdef = TRUE; /* inform PH to reload the VTM on the next utterance */

	return MMSYSERR_NOERROR;
}
#endif

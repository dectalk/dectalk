/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1995, 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
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
 * 034  EAB		10/13/1997		Edited for UK
 * 035  KSB		10/17/1997		Added wordclass information passesed on.
 * 036  EAB		10/19/1997		add slow-talk code
 * 037  GL		11/13/1997		restore the "comma" to end the control phoneme
 *                              for NWSNOAA (under MSDOS) only
 * 038 tek      11/12/1997      merge in aug97 BATS404 (SAPI transport)
 * 038  GL		11/22/1997		support LINKRWORD
 * 039 MGS		02/05/1998		Added GetCurrentPitch function for sapi Group F
 * 040 CJL      03/18/1998      Removed specific path for dectalkf.h.
 * 041 JAW      04/06/1998      Added GetSpeakerParams and SetSpeakerParams functions.
 *                              Included objbase.h for CoTaskMemAlloc.
 * 042 JAW      04/27/1998      Added support for glottal speed in GetSpeakerParams and
 *                              SetSpeakerParams.  Made both functions access output gain
 *                              multiplier only if WIN32 or __osf__ is defined and i386 isn't.
 * 043 JAW      05/01/1998      In GetSpeakerParams, made it so CoTaskMemAlloc/CoTaskMemFree
 *                              will only be used if WIN32 is defined; otherwise, malloc/free
 *                              will be used.
 * 044 JAW      05/04/1898      Made GetSpeakerParams and SetSpeakerParams only be compiled
 *                              under non-MS-DOS environments.
 * 045	MFG		05/08/1998		added dbglog.txt logging for debug switch[:debug 2001]
 * 046	MFG		05/19/1998		excluded dbglog logging when build 16-bit code (MSDOS)	 
 * 047  JAW		06/11/1998		Fixed GetSpeakerParams and SetSpeakerParams so they will work
 *								with the CE.
 * 048	mfg		06/22/1998		Added support for LANG_latin_american
 * 049  EAB		08/1998 		Added new debug option
 * 050  EAB		08/15/1998		Modified behavior of wordclass so it's easier to use.
 * 051  GL		09/01/1998		BATS#755 fix debug switch 2001 PH pipe data display
 * 052  ETT		10/05/1998		added linux code.
 * 053  EAB		01/25/1999		Remove unused linkr code
 * 054  EAB		02/3/1999		Added change from NWSNOAA->NWS_US for multi language NOAA
 * 055  EAB		02/02/1999		Added code to handle where you want to promote verbs
								because they're not the helper anymore but the
								one and onl verb
 * 056	NAL		01/24/2000		Added GetPhVdefParams function
								Modified GetSpeakerParams and SetSpeakerParams to strip/addon the
								tuned params making them "invisible" on the outside
 * 057  EAB		03/14/2000		Changed Spanish voice to preferred harry "Sounds more Spanish"
 * 058  EAB		04/17/2000		Modified for 4.6 release 
 * 059  eab		04/07/2000 		Modified SP_ for universal phonemes
 * 060  EAB		06/28/2000		Unified Phoneme Set Changes
 * 061  MGS		07/14/2000		Sapi 5 additions
 * 062	MGS		08/22/2000		BATS #935, fixed 2 concurrency problems
 * 063	EAb		09/16/2000 		Removed noop debug code.
 * 064	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 * 065 	CAB		10/16/2000		Changed copyright info and formatted comments
 * 067	CAB		01/29/2001		Merged Michel Divay's changes for French
 * 068  CAB		02/09/2001		Added missing line as per Michel Divay.
 * 069	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 070	CAB		05/14/2001		Updated copyright info
 * 071	MGS		06/19/2001		Solaris Port BATS#972
 * 072	MGS		02/26/2002		Trail SDK Noise
 * 073	MGS		03/20/2002		Single threaded vtm
 * 074	MGS		03/21/2002		Single threaded ph
 * 075	MGS		04/11/2002		ARM7 port
 * 076	CAB		04/25/2002		Removed warnings by typecast as per ph_data.h
 *	//							Removed missing #if to readphone
 * 077	MFG		09/19/2002	 	Added support for new chris voice
 * 078	CAB		09/19/2002		Changed chris voice to us only
 */
 
#include "dectalkf.h"
#include "ph_def.h"				/* the new all inclusive include file for ph */


#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
#include <stdlib.h>
#endif

#if defined(WIN32) && !defined(UNDER_CE)
#include "objbase.h" /* for CoTaskMemAlloc and CoTaskMemFree, JAW 4/6/98 */
#endif

#ifdef ARM7
#ifndef EPSON_ARM7
extern short	cur_packet_number;
extern short	max_packet_number;
#endif
#endif
/* #define GLD */

#ifndef SINGLE_THREADED
int              readphone (PKSD_T pKsd_t, register DT_PIPE_T buf[]);
#else
int              readphone (PKSD_T pKsd_t, register DT_PIPE_T buf[], DT_PIPE_T input[]);
#endif
void             speak_now (LPTTS_HANDLE_T phTTS);


#ifdef MSDOS
	extern LPTTS_HANDLE_T phTTS;
#endif


/* ******************************************************************
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
 * *****************************************************************/

#ifdef MSDOS
void far kltask (void)
#else
void far kltask (LPTTS_HANDLE_T phTTS)
#endif
{
#ifndef SINGLE_THREADED
	register int            nextra;
	register short         *workp;
	short                   buf[4];
#endif
	int                     new_phone;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	/* 
 	 *  ph initialization ...
 	 */
    /* speaking rate set to 180 as default */

#ifdef EPSON_ARM7
	pDph_t->tunedef_8[0] = (short*)default_tune;
	pDph_t->tunedef_8[1] = (short*)default_tune;
	pDph_t->tunedef_8[2] = (short*)default_tune;
	pDph_t->tunedef_8[3] = (short*)default_tune;
	pDph_t->tunedef_8[4] = (short*)default_tune;
	pDph_t->tunedef_8[5] = (short*)default_tune;
	pDph_t->tunedef_8[6] = (short*)default_tune;
	pDph_t->tunedef_8[7] = (short*)default_tune;
	pDph_t->tunedef_8[8] = (short*)default_tune;
	pDph_t->tunedef_8[9] = (short*)default_tune;
	pDph_t->tunedef[0] = (short*)default_tune;
	pDph_t->tunedef[1] = (short*)default_tune;
	pDph_t->tunedef[2] = (short*)default_tune;
	pDph_t->tunedef[3] = (short*)default_tune;
	pDph_t->tunedef[4] = (short*)default_tune;
	pDph_t->tunedef[5] = (short*)default_tune;
	pDph_t->tunedef[6] = (short*)default_tune;
	pDph_t->tunedef[7] = (short*)default_tune;
	pDph_t->tunedef[8] = (short*)default_tune;
	pDph_t->tunedef[9] = (short*)default_tune;
#else
	if(pKsd_t->lang_curr == LANG_english)
	{
	pDph_t->tunedef_8[0] = (short*)us_paul_8_tune;
	pDph_t->tunedef_8[1] = (short*)us_betty_8_tune;
	pDph_t->tunedef_8[2] = (short*)us_harry_8_tune;
	pDph_t->tunedef_8[3] = (short*)us_frank_8_tune;
	pDph_t->tunedef_8[4] = (short*)us_dennis_8_tune;
	pDph_t->tunedef_8[5] = (short*)us_kit_8_tune;
	pDph_t->tunedef_8[6] = (short*)us_ursula_8_tune;
	pDph_t->tunedef_8[7] = (short*)us_rita_8_tune;
	pDph_t->tunedef_8[8] = (short*)us_wendy_8_tune;
	}
	
	if(pKsd_t->lang_curr == LANG_british)
	{
	pDph_t->tunedef_8[0] = (short*)uk_paul_8_tune;
	pDph_t->tunedef_8[1] = (short*)uk_betty_8_tune;
	pDph_t->tunedef_8[2] = (short*)uk_harry_8_tune;
	pDph_t->tunedef_8[3] = (short*)uk_frank_8_tune;
	pDph_t->tunedef_8[4] = (short*)uk_dennis_8_tune;
	pDph_t->tunedef_8[5] = (short*)uk_kit_8_tune;
	pDph_t->tunedef_8[6] = (short*)uk_ursula_8_tune;
	pDph_t->tunedef_8[7] = (short*)uk_rita_8_tune;
	pDph_t->tunedef_8[8] = (short*)uk_wendy_8_tune;
	}
	
	if(pKsd_t->lang_curr == LANG_latin_american)
	{
	pDph_t->tunedef_8[0] = (short*)la_paul_8_tune;
	pDph_t->tunedef_8[1] = (short*)la_betty_8_tune;
	pDph_t->tunedef_8[2] = (short*)la_harry_8_tune;
	pDph_t->tunedef_8[3] = (short*)la_frank_8_tune;
	pDph_t->tunedef_8[4] = (short*)la_dennis_8_tune;
	pDph_t->tunedef_8[5] = (short*)la_kit_8_tune;
	pDph_t->tunedef_8[6] = (short*)la_ursula_8_tune;
	pDph_t->tunedef_8[7] = (short*)la_rita_8_tune;
	pDph_t->tunedef_8[8] = (short*)la_wendy_8_tune;
	}
	
	if(pKsd_t->lang_curr == LANG_french)
	{
	pDph_t->tunedef_8[0] = (short*)fr_paul_8_tune;
	pDph_t->tunedef_8[1] = (short*)fr_betty_8_tune;
	pDph_t->tunedef_8[2] = (short*)fr_harry_8_tune;
	pDph_t->tunedef_8[3] = (short*)fr_frank_8_tune;
	pDph_t->tunedef_8[4] = (short*)fr_dennis_8_tune;
	pDph_t->tunedef_8[5] = (short*)fr_kit_8_tune;
	pDph_t->tunedef_8[6] = (short*)fr_ursula_8_tune;
	pDph_t->tunedef_8[7] = (short*)fr_rita_8_tune;
	pDph_t->tunedef_8[8] = (short*)fr_wendy_8_tune;
	}
	if(pKsd_t->lang_curr == LANG_german)
	{
	pDph_t->tunedef_8[0] = (short*)gr_paul_8_tune;
	pDph_t->tunedef_8[1] = (short*)gr_betty_8_tune;
	pDph_t->tunedef_8[2] = (short*)gr_harry_8_tune;
	pDph_t->tunedef_8[3] = (short*)gr_frank_8_tune;
	pDph_t->tunedef_8[4] = (short*)gr_dennis_8_tune;
	pDph_t->tunedef_8[5] = (short*)gr_kit_8_tune;
	pDph_t->tunedef_8[6] = (short*)gr_ursula_8_tune;
	pDph_t->tunedef_8[7] = (short*)gr_rita_8_tune;
	pDph_t->tunedef_8[8] = (short*)gr_wendy_8_tune;
	}

#endif

	pKsd_t->sprate = 180;
#ifdef WITHOUT_CALLOC
	pDph_t->perpause = 0;
	pDph_t->compause = 0;
#endif

	pDph_t->number_verbs=0;
	pDph_t->promote_helper_verb = 0;

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
	pDph_t->param[AREAG].outp = &(pDph_t->parstochip[OUT_AG]);
	pDph_t->param[AREAL].outp = &(pDph_t->parstochip[OUT_AL]);
	pDph_t->param[AREAN].outp = &(pDph_t->parstochip[OUT_AN]);
	pDph_t->param[AREAB].outp = &(pDph_t->parstochip[OUT_ABLADE]);
	pDph_t->param[OUT_PS].outp = &(pDph_t->parstochip[OUT_PS]);
	pDph_t->param[OUT_CNK].outp = &(pDph_t->parstochip[OUT_CNK]);
	pDph_t->param[OUT_UE].outp = &(pDph_t->parstochip[OUT_UE]);
	pDph_t->param[OUT_DC].outp = &(pDph_t->parstochip[OUT_DC]);
	init_phclause (pDph_t);
#if defined SPANISH && !defined EPSON_ARM7

	pKsd_t->async_voice =HUGE_HARRY;
	
	usevoice (phTTS, HUGE_HARRY);//redundant for 16 bits eab 4/12/00
	
#else
	pKsd_t->async_voice =PERFECT_PAUL;
	usevoice (phTTS, PERFECT_PAUL);
#endif
	saveval (pDph_t);
	new_phone = TRUE;
	pDph_t->reset_pitch = FALSE;
	pKsd_t->speaker = (int _far *) &(pDph_t->curspdef[0]);
	pDph_t->symbols[0] = GEN_SIL;
	pDph_t->bound = COMMA;
	pDph_t->nsymbtot = 1;
	pDph_t->sentstruc [0] = 0; // FRENCH : important for French

#ifdef WITHOUT_CALLOC
	pDph_t->lastoffs = 0;
	pDph_t->nphone = 0;
	pDph_t->asperation = 0;
	pDph_t->ph_init = 0;			   /* MVP:03/18/96 */
#endif
#ifdef SINGLE_THREADED
}

/* ******************************************************************
 *      Function Name: ph_loop()       
 *
 *  	Description: 
 *
 *      Arguments: #ifdef SINGLE_THREADED
 *					LPTTS_HANDLE_T phTTS
 *					unsigned short *input
 *
 *      Return Value: void
 *
 *      Comments:
 * ******************************************************************/
void ph_loop(LPTTS_HANDLE_T phTTS,unsigned short *input)
{
	register int            nextra;
	register short         *workp;

	short                   buf[4];
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
#endif // SINGLE_THREADED

#ifndef SINGLE_THREADED
	//int                     new_phone;

	while (TRUE)
#endif
	{
#ifdef SINGLE_THREADED
		nextra = readphone (pKsd_t, buf, input);
		if (nextra==-1)
			return;
#else
		nextra = readphone (pKsd_t, buf);
#endif
		/* display debug switch manual once */
#ifndef ARM7_NOSWI
		if (pKsd_t->debug_switch == 0x2fff)
		{
			printf("PH debug switch description:\n");
			printf("2001 -- Incoming PH code      2002 -- log phonemes\n");
			printf("2004 -- log syllable          2008 -- log outphone\n");
			printf("2010 -- log inton commands    2020 -- log kl parameters (no hlsyn)\n");
			printf("2040 -- hlsyn parameters -in  2080 -- hlsyn rules\n");
			printf("2100 -- hlsyn parameters--out 2200 -- not used\n");
            printf("2400 -- not used              2800 -- no voice output\n");
						
			/* reset to 0 again */
			pKsd_t->debug_switch = 0;
		}
#endif		

		if (pKsd_t->halting)
		{
			speak_now (phTTS);
			if (pDph_t->reset_pitch)
			{
				setparam (phTTS, 3, pDph_t->default_pitch);
				pDph_t->reset_pitch = FALSE;
			}
#ifdef SINGLE_THREADED
			if (buf[0] != SYNC)
				return;
#else
			if (buf[0] != SYNC)
				continue;
#endif
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
#ifndef MSDOS
//#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
			buf[0] = SPC_type_sync;
#ifndef SINGLE_THREADED
			write_pipe (pKsd_t->vtm_pipe, buf, 1);
#else
			vtm_loop(phTTS,buf);
#endif
#endif // #ifndef MSDOS
#endif // SEPARATE_PROCESSES
		/* 
		 * #ifdef WIN32 buf[0] = SPC_type_sync; 
		 * write_pipe( pKsd_t->vtm_pipe, buf, 1 ); 
		 * #endif 
		 * #ifdef __osf__ buf[0] = SPC_type_sync; 
		 * write_pipe( vtm_pipe, buf, 1 ); 
		 * #endif 
		 */
#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
		}

		/* 
		 *  Now process the phoneme ...  look for special async control
		 *  changes ...
		 */

		if (pKsd_t->async_change)
		{
#ifdef EPSON_ARM7
			if (pDph_t->nsymbtot>1)
				phTTS->PTS_special_change=6; //PTS_BACKUP_ONE_PHONE
#endif
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
					pDph_t->compause = mstofr (deadstop (pKsd_t->async_comma, -280, 30000));
					pKsd_t->async_change &= (~ASYNC_comma);
				}
				if (pKsd_t->async_change & ASYNC_period)
				{
					pDph_t->perpause = mstofr (deadstop (pKsd_t->async_period, -420, 30000));
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
			if ((buf[0] & PVALUE) == SPECIALWORD)
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
			|| buf[0] == INDEX_SENTENCE
			|| buf[0] == INDEX_VOLUME
			|| buf[0] == INDEX_NOISE
#endif //_WIN32
		   )
		{
#ifdef MSDOS
				save_index (pDph_t->nsymbtot, buf[0], buf[1], buf[2]);
#else
				if (buf[0]==INDEX_START && pDph_t->nsymbtot==1)
				{
					save_index (pKsd_t, 0, buf[0], buf[1], buf[2]);
				}
				else
				{
					save_index (pKsd_t, pDph_t->nsymbtot, buf[0], buf[1], buf[2]);
				}
#endif

#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
		}
		
	/* sets wordclass but I want it marked throughout the word because I don't know where it started*/
		pDph_t->wordclass[pDph_t->nsymbtot] = pDph_t->holdwordclass;

		/* 
		 *  process control phones ...
		 */

		if ((buf[0] & PFONT) == (PFCONTROL << PSFONT))
		{
			if (buf[0] == WORD_CLASS) {
				//printf("int ph %04x%04x\n",buf[1],buf[2]);
				pDph_t->holdwordclass = (buf[1] << 16) + buf[2];
				pDph_t->wordclass[pDph_t->nsymbtot] = pDph_t->holdwordclass;

				/*EAB 2/10/99 Special code to deal with "helper verbs that
				are marked as functors and unstress they need to be handled
				differently if they're the only verb in the phrase in which case
				they are the verb and not a "helper", this affects intonation timing 
				and stress. Remember also that we will make mistakes because all
				verbs are not in the dictionary so the rules must find a midle 
				ground in perceptual effects */
#ifdef AD_BASE
				if(pDph_t->holdwordclass & FC_VERB
				|| pDph_t->holdwordclass & FC_ED
				|| pDph_t->holdwordclass & FC_BE
				|| pDph_t->holdwordclass & FC_ING)
				{
					pDph_t->number_verbs++;
					if(pDph_t->number_verbs >1)
						pDph_t->promote_helper_verb = 0;
#ifndef GERMAN  //German doesn't mark helper verbs as functor- we may nee to redo the dicitonary POS
					else if(pDph_t->holdwordclass & FC_FUNC)
#endif
					{
						pDph_t->promote_helper_verb = 1;
				    }
				}
					
#endif // AD_BASE

#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
			}
			if (buf[0]==PREAMBLE)
			{
				switch(buf[1])
				{
				case 0:
					pDph_t->last_preamble_command=0;
					break;
				case 1:
					pDph_t->last_preamble_command=1;
					break;
				case 2:
					pDph_t->last_preamble_command=2;
					break;
				case 3:
					pDph_t->last_preamble_command=3;
					break;

				}
				// insert appropriate preamble stuff here
				// we have to remember the last preamble command number
				// to be able to put the correct end on the preamble
#ifdef SINGLE_THREADED
				return;
#else
				continue;
#endif
			}
		
			if (pDph_t->nsymbtot > 1)
			{
				/* pDph_t->symbols[pDph_t->nsymbtot] = COMMA;*/
				/* GL 10/03/1996, use period to end the control phones */
				/* GL 11/13/1997  set to comma for NWSNOAA */

				pDph_t->symbols[pDph_t->nsymbtot] = PERIOD;
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
				pDph_t->compause = mstofr (deadstop (buf[1], -280, 30000));
				break;
			case PPAUSE:
				pDph_t->perpause = mstofr (deadstop (buf[1], -420, 30000));
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
			case LATIN:
if (pKsd_t->lang_curr==LANG_spanish || 
	pKsd_t->lang_curr==LANG_latin_american)
{
				if (buf[1] == 1)
				{
					pDph_t->th_to_s = 1;
				}
				else
				{
					pDph_t->th_to_s = 0;
				}
			}
				break;
			case NEW_PARAM:
				setparam (phTTS, buf[1], buf[2]);
				break;
			case PITCH_CHANGE:
				if (pDph_t->reset_pitch == FALSE)
				{
					pDph_t->default_pitch = pDph_t->curspdef[3];
					setparam (phTTS, 3, (pDph_t->curspdef[3] + pKsd_t->pitch_delta));
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
#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
		}

		/* 
		 *  eat silence ...
		 */

		if (nextra == 0 && buf[0] ==  0 && pDph_t->symbols[pDph_t->lastoffs] == GEN_SIL)
#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif

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
if (pKsd_t->lang_curr==LANG_french)
{
		if ( (buf [0] & PFONT) == (FRGC << PSFONT) )
		{
			/* memorise the word grammatical category */
			pDph_t->sentstruc [pDph_t->nsymbtot] = buf [0] & 0xFF;
			
#ifdef GC_DEBUG
			if (dbgpros)
				printf ("phmain.c kltask grammatical categ. sentstruc [%3d] %8x\n",
				pDph_t->nsymbtot, pDph_t->sentstruc [pDph_t->nsymbtot]);
#endif
#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
      }
}

		/* 
		 * Kill font bits. Delete blocks of silence (I don't think this is
		 * needed anymore).  Map WBOUND to COMMA if we are getting near the
		 * end of the buffer.
		 */

		//buf[0] &= PVALUE;
		//EAB 5/15/00 For unified phonemics I will jam control phones to have a null langauge filed
		if((buf[0] & PVALUE) >= 100)
			buf[0] = buf[0] & PVALUE;
		if (pDph_t->nsymbtot >= (NPHON_MAX - GUARD) && ((buf[0] & PVALUE) == WBOUND))
			buf[0]  = COMMA;
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
			if (ispause ((buf[0] & PVALUE)) == FALSE)
				pDph_t->nphone = 0;
			if (isbound ((buf[0] & PVALUE)) != FALSE)
				pDph_t->bound = buf[0];
#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
		}

		/* 
		 * Adjust the strength of syntactic markers.
		 */

		if (issmark ((buf[0] & PVALUE)) && issmark (pDph_t->symbols[pDph_t->lastoffs]))
		{
			if (((buf[0] & PVALUE) == VPSTART) && ((pDph_t->bound == PPSTART) || (pDph_t->bound == VPSTART)))
#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
			if (pDph_t->symbols[pDph_t->lastoffs] >= (buf[0] & PVALUE))
#ifdef SINGLE_THREADED
			return;
#else
			continue;
#endif
			if ((buf[0] & PVALUE) == PPSTART && (pDph_t->nphone > 25))
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
		if (ispause ((buf[0] & PVALUE)) == FALSE)
			pDph_t->nphone = 0;
		if (isbound ((buf[0] & PVALUE)))
			pDph_t->bound = buf[0];
		pDph_t->lastoffs = pDph_t->nsymbtot;

		/* 
		 *  finally, buffer the phone in the array and speak if it is a delimiter ...
		 */

		pDph_t->symbols[pDph_t->nsymbtot] = buf[0];
		pDph_t->user_durs[pDph_t->nsymbtot] = 0;
		pDph_t->user_f0[pDph_t->nsymbtot++] = 0;
		pDph_t->sentstruc [pDph_t->nsymbtot] = 0; // default value for next phone
                                                  // important for French
		if (isdelim ((buf[0] & PVALUE)))
			speak_now (phTTS);
	}	// while (TRUE)
}	// kltask()

/* ******************************************************************
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
 * *****************************************************************/
void speak_now (LPTTS_HANDLE_T phTTS)
{
#ifndef MSDOS
	DT_PIPE_T               pipe_item[1];
#endif
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	int n=0;
	pDph_t->holdwordclass = 0;
if (pKsd_t->lang_curr!=LANG_french)
{
	for (n = 0; n < pDph_t->nsymbtot; n++)
	// SENSTRUC is really allofeats and and is used earlier in french and thus can't
	{
		// be are initalized
		pDph_t->sentstruc[n] = 0;
	}	
}
	pDph_t->nphonelast=-1; //init to an impossible value
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
#if (defined ENGLISH) || (defined SPANISH) || (defined FRENCH) /* no syllablification in german */
		/* debug switch */
		if ((pKsd_t->logflag & LOG_SYLLABLES) || DT_DBG(PH_DBG,0x004))
			logsyllable (phTTS);
		if (pKsd_t->sayflag == SAY_SYLLABLE)
		{
//				saysyllable (phTTS);
//#ifdef saysyllmodification
//				phclause(phTTS);
//#endif
		}		
		else
#endif	
		{
#ifdef DEBGFRENCH // for FRENCH
			{
				int i;
				
				printf ("\n");
				printf ("         sym   sent  user_ user_  ph_task.c speak_now\n");
				printf ("         bols  struc durs  f0\n");
				for (i=0; i<pDph_t->nsymbtot; i++) 
				{
					printf ("%3d %2s %6x%6x%6x%6x", i, phprint (pDph_t->symbols [i]),
						pDph_t->symbols [i], pDph_t->sentstruc [i], pDph_t->user_durs[i], 
						pDph_t->user_f0[i]);
					
					if (pDph_t->sentstruc [i] != 0) 
					{
						switch ( pDph_t->sentstruc [i] ) 
						{
						case CgConj    : printf (" CgConj   "); break;
						case CgPPS     : printf (" CgPPS    "); break;
						case CgVA      : printf (" CgVA     "); break;
						case CgArt     : printf (" CgArt    "); break;
						case CgDivers  : printf (" CgDivers "); break;
						case CgPrep    : printf (" CgPrep   "); break;
						case CgPosDem  : printf (" CgPosDem "); break;
						case CgInterr  : printf (" CgInter  "); break;
						case CgDe      : printf (" CgDe     "); break;
						case CgPrep2   : printf (" CgPrep2  "); break;
						} /* switch */
					} /* if */
					printf ("\n");
				} /* for */
				printf ("\n\n");
			}
#endif  // DEBGFRENCH
			//saysyllable (phTTS);
			phclause (phTTS);
#ifdef EPSON_ARM7
			if (phTTS->PTS_return_code!=5)
				return;
#endif
		}
#ifdef MSDOS
		block (NULL_FP);			   /* run a scheduler pass.. */
#endif
		if (pDph_t->reset_pitch)
		{
			setparam (phTTS, 3, pDph_t->default_pitch);
			pDph_t->reset_pitch = FALSE;
		}
	}	// (pDph_t->nsymbtot > 1) && (pKsd_t->halting == FALSE)
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
	check_index (PHONE_HUGE);
#else
	check_index (phTTS, PHONE_HUGE);
#endif // MSDOS

	pDph_t->symbols[0] = GEN_SIL;
	pDph_t->bound = COMMA;
	pDph_t->lastoffs = 0;
	pDph_t->nsymbtot = 1;
	pDph_t->nphone = 0;
	pDph_t->asperation = 0;

/* GL 04/21/1997  change to be the same as the latest OSF code */
	if (pDph_t->nsymbtot>1)
	{
#ifndef MSDOS
	//#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
	/* write forced clause boundary symbol to VTM */
	pipe_item[0] = SPC_type_force;
	/* debug switch GL 3/27/1997 BATS#319 */
	if (!(DT_DBG(PH_DBG,0x800)))
#ifndef SINGLE_THREADED
	write_pipe (pKsd_t->vtm_pipe, pipe_item, 1);
#else
	vtm_loop(phTTS,pipe_item);
#endif
#endif // MSDOS
	}
#ifdef ARM7
#ifndef EPSON_ARM7
	cur_packet_number=0;
	max_packet_number=0;
#endif
#endif
}	// speak_now


/* ******************************************************************
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
 * *****************************************************************/
int deadstop (int value, int low, int high)
{
	if (value < low)
		return (low);
	if (value > high)
		return (high);
	return (value);
}

/* ******************************************************************
 *      Function Name: readphone ()     
 *
 *  	Description: Read a phoneme, along with its extra words, from the pipe to
 * 					 letter to sound. Pack the phoneme into the supplied buffer.
 * 					 Clear the "number of extra words" field in the phoneme, and
 * 					 return the number of extra words.
 *
 *      Arguments: 	#ifndef SINGLE_THREADED 
 *						PKSD_T pKsd_t  	Pointer to kernel data structure
 *						register DT_PIPE_T buf[]
 *					#else
 *						PKSD_T pKsd_t  	Pointer to kernel data structure
 *						register DT_PIPE_T buf[]
 *						DT_PIPE_T input[]
 *
 *      Return Value: int 
 *
 *      Comments:
 *
 * *****************************************************************/
#ifndef SINGLE_THREADED
int readphone(PKSD_T pKsd_t, register DT_PIPE_T buf[])
#else
int readphone (PKSD_T pKsd_t, register DT_PIPE_T buf[], DT_PIPE_T input[])
#endif
{
	int nextra;
	int i;
#ifndef SINGLE_THREADED
	unsigned short local_buf[4];
#else
	int count=0;
	unsigned short *local_buf=input;
#endif
#ifndef SINGLE_THREADED
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
#endif // SINGLE_THREADED
	while (TRUE)
	{
		// read the entire packet out of the pipe 
#ifdef SINGLE_THREADED
		if (count)	return -1;
		count++;
#else
		read_pipe (kinp, &local_buf[0], READ_WORD_PIPE_PACKET);
#endif
		//read_pipe (kinp, &buf[0], 1);
		// fake the read...
		buf[0]=local_buf[0];

//		if (((buf[0] & 0xff)>=121)  && ((buf[0] & 0xff) <=129))
		/* GL 11/22/1997 support LINKRWORD(121) */
		if (((buf[0] & 0xff)>=PHO_SYM_TOT)  && ((buf[0] & 0xff) <=129))
#ifdef SINGLE_THREADED
			return(-1);
#else
			continue;
#endif

		/* debug switch */
		/* GL 09/01/1998 BATS#755  fix the PH pipe data display format to show the control section */
		if (DT_DBG(PH_DBG,0x001))
		{
#ifndef ARM7_NOSWI
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
#endif // ARM7_NOSWI
		}

		nextra = (buf[0] & PNEXTRA) >> PSNEXTRA;
		buf[0] &= ~PNEXTRA;
		for (i = 1; i <= nextra; i++)
		{
			//read_pipe (kinp, &buf[i], 1);
			// fake the read again..
			buf[i]=local_buf[i];

		/* debug switch */
		if (DT_DBG(PH_DBG,0x001))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
				fprintf (pKsd_t->dbglog,"\n(#%u[0x%x])",buf[i],buf[i]);
#endif
			printf ("\n(#%u[0x%x])",buf[i],buf[i]);
#endif // ARM7_NOSWI
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
		if (pKsd_t->halting)
		
			buf[0] = SYNC;
		return (0);
		
	}
}

/* ******************************************************************
 *      Function Name: mstofr()     
 *
 *  	Description: Convert a duration from milliseconds to frames, watching out for
 * 					 fixed point overflow. A long (32 bit) temporary variable is used to
 * 					 do the "*10" and "/NSAMP_FRAME".
 *
 *      Arguments:  int nms		Number of milliseconds 
 *
 *      Return Value: int	Number of frames 
 *
 *      Comments:
 *
 * *****************************************************************/

#ifdef MSDOS
#if     NSAMP_FRAME != 64
<<<Big trouble.In "PH" code too ! >>>
#endif
#endif // MSDOS

int mstofr (int nms)
{
        S32                     temp;

        temp = (S32) nms;
        temp *= 10;
        return ((int) (temp >> 6));
}

/* ******************************************************************
 *      Function Name: GetCurrentPitch()
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   int *pitch
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
#ifdef WIN32
#ifdef SAPI_GROUP_F_INTERFACES
int GetCurrentPitch(LPTTS_HANDLE_T phTTS, int *pitch)
{
	PDPH_T pDph_t;
	if (phTTS==NULL)
		return(MMSYSERR_INVALPARAM);
	pDph_t = phTTS->pPHThreadData;
	*pitch=pDph_t->curspdef[SPD_AP];
	return(MMSYSERR_NOERROR);
}
#endif

/* ******************************************************************
 *      Function Name: GetDefaultPitch()
 *
 *  	Description:
 *
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   int *pitch
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
#ifdef SAPI5DECTALK
int GetDefaultPitch(LPTTS_HANDLE_T phTTS, int *pitch)
{
	PKSD_T pKsd_t;
	PDPH_T pDph_t;

	short			*newspdef;
	short			*tunespdef;

	if (phTTS==NULL)
		return(MMSYSERR_INVALPARAM);
	
	pKsd_t=phTTS->pKernelShareData;
	pDph_t=phTTS->pPHThreadData;

	if (pKsd_t->uiSampleRate < 8763)
	{
		newspdef = pDph_t->voidef_8[pKsd_t->last_voice];
		tunespdef = pDph_t->tunedef_8[pKsd_t->last_voice];
	}
	else
	{
		newspdef = pDph_t->voidef[pKsd_t->last_voice];
		tunespdef = pDph_t->tunedef[pKsd_t->last_voice];
	}

	*pitch=(newspdef[SPD_AP]+tunespdef[SPD_AP]);
	return(MMSYSERR_NOERROR);
}

/* ******************************************************************
 *      Function Name: GetDefaultPitchRange()
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   int *pitch
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int GetDefaultPitchRange(LPTTS_HANDLE_T phTTS, int *pitch_range)
{
	PKSD_T pKsd_t;
	PDPH_T pDph_t;

	short			*newspdef;
	short			*tunespdef;

	if (phTTS==NULL)
		return(MMSYSERR_INVALPARAM);
	
	pKsd_t=phTTS->pKernelShareData;
	pDph_t=phTTS->pPHThreadData;

	if (pKsd_t->uiSampleRate < 8763)
	{
		newspdef = pDph_t->voidef_8[pKsd_t->last_voice];
		tunespdef = pDph_t->tunedef_8[pKsd_t->last_voice];
	}
	else
	{
		newspdef = pDph_t->voidef[pKsd_t->last_voice];
		tunespdef = pDph_t->tunedef[pKsd_t->last_voice];
	}

	*pitch_range=(newspdef[SPD_PR]+tunespdef[SPD_PR]);
	return(MMSYSERR_NOERROR);
}

#endif
#endif

/* The following two functions are used for the API, so they are not compiled under MS-DOS.
   JAW 5/4/98 */
#ifndef MSDOS

#ifndef ARM7

/* ******************************************************************
 *		Function: GetPhVdefParams()                                      
 *		By      : Nathan LeStage                                         
 *		Date    : January 17, 2000                                       
 *                                                                   
 *		Description:	This function is called by the API function 
 *						TextToSpeechGetPhVdefParams. It returns a copy
 *						of the default parameters for the specified voice.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *				   UNIT index
 *
 *      Return Value: short
 *
 *      Comments:
 * *****************************************************************/
short *GetPhVdefParams(LPTTS_HANDLE_T phTTS, UINT index)
{
	short *params=NULL;
	
#if defined(WIN32) && !defined(UNDER_CE)
	params = (short *) CoTaskMemAlloc(sizeof(SPDEFS));
#else
	params = (short *) malloc(sizeof(SPDEFS));
#endif

	if (params == NULL)
	{
#if defined(WIN32) && !defined(UNDER_CE)
		CoTaskMemFree(params);
#else
		free(params);
#endif
		return NULL;
	}
	switch (index) 
	{	// CAB Removed warnings by typecast
		case 0:	 memcpy(params, paul_8, sizeof(paul_8));     break;
		case 1:	 memcpy(params, betty_8, sizeof(betty_8));   break;
		case 2:	 memcpy(params, harry_8, sizeof(harry_8));   break;
		case 3:	 memcpy(params, frank_8, sizeof(frank_8));   break;
		case 4:	 memcpy(params, kit_8, sizeof(kit_8));       break;
		case 5:	 memcpy(params, ursula_8, sizeof(ursula_8)); break;
		case 6:	 memcpy(params, rita_8, sizeof(rita_8));	 break;
		case 7:	 memcpy(params, wendy_8, sizeof(wendy_8));	 break;
		case 8:	 memcpy(params, dennis_8, sizeof(dennis_8)); break;
		case 9:  memcpy(params, paul, sizeof(paul));		 break;
		case 10: memcpy(params, betty, sizeof(betty));		 break;
		case 11: memcpy(params, harry, sizeof(harry));		 break;
		case 12: memcpy(params, frank, sizeof(frank));       break;
		case 13: memcpy(params, kit, sizeof(kit));			 break;
		case 14: memcpy(params, ursula, sizeof(ursula));	 break;
		case 15: memcpy(params, rita, sizeof(rita));	     break;
		case 16: memcpy(params, wendy, sizeof(wendy));	     break;
		case 17: memcpy(params, dennis, sizeof(dennis));	 break;
	}
	return params;
}

/********************************************************************
 *  Function: GetSpeakerParams
 *  By      : Jason Warlikowski
 *  Date    : April 6, 1998
 *
 *  Description:	This function is called by the API function 
 *					TextToSpeechGetSpeakerParams. It returns the parameters 
 *					for the current speaker, the limits for those parameters,
 *					and the current speaker's default parameters.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *					UINT uiIndex
 *					SPDEFS **ppspCur
 *					SPDEFS **ppspLoLimit
 *					SPDEFS **ppspHiLimit
 *					SPDEFS **ppspDefault
 *
 *      Return Value:	MMRESULT
 *						MMSYSERR_NOERROR	
 *						MMSYSERR_NVALPARAM	Invalid parameter
 *						MMSYSERR_NOMEM		Memory could not be allocated
 *
 *      Comments:
 *********************************************************************************************/
 
MMRESULT GetSpeakerParams(LPTTS_HANDLE_T phTTS, UINT uiIndex, SPDEFS **ppspCur,
						  SPDEFS **ppspLoLimit, SPDEFS **ppspHiLimit, SPDEFS **ppspDefault)
{
	PDPH_T pDph_t;
	PKSD_T pKsd_t;

	extern const LIMIT limit[];
	short speaker_num;
	short *cur_speaker=NULL;
	int voice;

	if (phTTS == NULL)
		return MMSYSERR_INVALPARAM;

	pDph_t = phTTS->pPHThreadData;
	pKsd_t = phTTS->pKernelShareData;
	voice = pKsd_t->last_voice;

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
	(*ppspCur)->sex                = pDph_t->curspdef[SPD_SEX] -(pDph_t->tunedef[voice][SPD_SEX]);
	(*ppspCur)->smoothness         = pDph_t->curspdef[SPD_SM] - (pDph_t->tunedef[voice][SPD_SM]);
	(*ppspCur)->assertiveness      = pDph_t->curspdef[SPD_AS] - (pDph_t->tunedef[voice][SPD_AS]);
	(*ppspCur)->average_pitch      = pDph_t->curspdef[SPD_AP] - (pDph_t->tunedef[voice][SPD_AP]);
	(*ppspCur)->pitch_range        = pDph_t->curspdef[SPD_PR] - (pDph_t->tunedef[voice][SPD_PR]);
	(*ppspCur)->breathiness        = pDph_t->curspdef[SPD_BR] - (pDph_t->tunedef[voice][SPD_BR]);
	(*ppspCur)->richness           = pDph_t->curspdef[SPD_RI] - (pDph_t->tunedef[voice][SPD_RI]);
	(*ppspCur)->num_fixed_samp_og  = pDph_t->curspdef[SPD_NF] - (pDph_t->tunedef[voice][SPD_NF]);
	(*ppspCur)->laryngealization   = pDph_t->curspdef[SPD_LA] - (pDph_t->tunedef[voice][SPD_LA]);
	(*ppspCur)->head_size          = pDph_t->curspdef[SPD_HS] - (pDph_t->tunedef[voice][SPD_HS]);
	(*ppspCur)->formant4_res_freq  = pDph_t->curspdef[SPD_F4] - (pDph_t->tunedef[voice][SPD_F4]);
	(*ppspCur)->formant4_bandwidth = pDph_t->curspdef[SPD_B4] - (pDph_t->tunedef[voice][SPD_B4]);
	(*ppspCur)->formant5_res_freq  = pDph_t->curspdef[SPD_F5] - (pDph_t->tunedef[voice][SPD_F5]);
	(*ppspCur)->formant5_bandwidth = pDph_t->curspdef[SPD_B5] - (pDph_t->tunedef[voice][SPD_B5]);
	(*ppspCur)->parallel4_freq     = pDph_t->curspdef[SPD_P4] - (pDph_t->tunedef[voice][SPD_P4]);
	(*ppspCur)->parallel5_freq     = pDph_t->curspdef[SPD_P5] - (pDph_t->tunedef[voice][SPD_P5]);
	(*ppspCur)->gain_frication     = pDph_t->curspdef[SPD_GF] - (pDph_t->tunedef[voice][SPD_GF]);
	(*ppspCur)->gain_aspiration    = pDph_t->curspdef[SPD_GH] - (pDph_t->tunedef[voice][SPD_GH]);
	(*ppspCur)->gain_voicing       = pDph_t->curspdef[SPD_GV] - (pDph_t->tunedef[voice][SPD_GV]);
	(*ppspCur)->gain_nasalization  = pDph_t->curspdef[SPD_GN] - (pDph_t->tunedef[voice][SPD_GN]);
	(*ppspCur)->gain_cfr1          = pDph_t->curspdef[SPD_G1] - (pDph_t->tunedef[voice][SPD_G1]);
	(*ppspCur)->gain_cfr2          = pDph_t->curspdef[SPD_G2] - (pDph_t->tunedef[voice][SPD_G2]);
	(*ppspCur)->gain_cfr3          = pDph_t->curspdef[SPD_G3] - (pDph_t->tunedef[voice][SPD_G3]);
	(*ppspCur)->gain_cfr4          = pDph_t->curspdef[SPD_G4] - (pDph_t->tunedef[voice][SPD_G4]);
	(*ppspCur)->loudness           = pDph_t->curspdef[SPD_LO] - (pDph_t->tunedef[voice][SPD_LO]);
	(*ppspCur)->spectral_tilt      = pDph_t->curspdef[SPD_FT] - (pDph_t->tunedef[voice][SPD_FT]);
	(*ppspCur)->baseline_fall      = pDph_t->curspdef[SPD_BF] - (pDph_t->tunedef[voice][SPD_BF]);
	(*ppspCur)->lax_breathiness    = pDph_t->curspdef[SPD_LX] - (pDph_t->tunedef[voice][SPD_LX]);
	(*ppspCur)->quickness          = pDph_t->curspdef[SPD_QU] - (pDph_t->tunedef[voice][SPD_QU]);
	(*ppspCur)->hat_rise           = pDph_t->curspdef[SPD_HR] - (pDph_t->tunedef[voice][SPD_HR]);
	(*ppspCur)->stress_rise        = pDph_t->curspdef[SPD_SR] - (pDph_t->tunedef[voice][SPD_SR]);
	(*ppspCur)->avg_glot_open      = pDph_t->curspdef[SPD_AGO] - (pDph_t->tunedef[voice][SPD_AGO]);
	(*ppspCur)->avg_glot_voicd_open      = pDph_t->curspdef[SPD_AGVO] - (pDph_t->tunedef[voice][SPD_AGVO]);
	(*ppspCur)->area_chink      = pDph_t->curspdef[SPD_CHINK] - (pDph_t->tunedef[voice][SPD_CHINK]);
	(*ppspCur)->open_quo      = pDph_t->curspdef[SPD_OQ] - (pDph_t->tunedef[voice][SPD_OQ]);


#if (defined (WIN32) || defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_) && !defined (i386)
	(*ppspCur)->output_gain_mult   = pDph_t->curspdef[SPD_OS];
#endif

	/* Fill low limits for speaker parameters */
	/* The limits are taken from the limit array, which is defined in ph_vdefi.c. */
	(*ppspLoLimit)->sex                = limit[SPD_SEX].l_min;
	(*ppspLoLimit)->smoothness         = limit[SPD_SM].l_min;
	(*ppspLoLimit)->assertiveness      = limit[SPD_AS].l_min;
	(*ppspLoLimit)->average_pitch      = limit[SPD_AP].l_min;
	(*ppspLoLimit)->pitch_range        = limit[SPD_PR].l_min;
	(*ppspLoLimit)->breathiness        = limit[SPD_BR].l_min;
	(*ppspLoLimit)->richness           = limit[SPD_RI].l_min;
	(*ppspLoLimit)->num_fixed_samp_og  = limit[SPD_NF].l_min;
	(*ppspLoLimit)->laryngealization   = limit[SPD_LA].l_min;
	(*ppspLoLimit)->head_size          = limit[SPD_HS].l_min;
	(*ppspLoLimit)->formant4_res_freq  = limit[SPD_F4].l_min;
	(*ppspLoLimit)->formant4_bandwidth = limit[SPD_B4].l_min;
	(*ppspLoLimit)->formant5_res_freq  = limit[SPD_F5].l_min;
	(*ppspLoLimit)->formant5_bandwidth = limit[SPD_B5].l_min;
	(*ppspLoLimit)->parallel4_freq     = limit[SPD_P4].l_min;
	(*ppspLoLimit)->parallel5_freq     = limit[SPD_P5].l_min;
	(*ppspLoLimit)->gain_frication     = limit[SPD_GF].l_min;
	(*ppspLoLimit)->gain_aspiration    = limit[SPD_GH].l_min;
	(*ppspLoLimit)->gain_voicing       = limit[SPD_GV].l_min;
	(*ppspLoLimit)->gain_nasalization  = limit[SPD_GN].l_min;
	(*ppspLoLimit)->gain_cfr1          = limit[SPD_G1].l_min;
	(*ppspLoLimit)->gain_cfr2          = limit[SPD_G2].l_min;
	(*ppspLoLimit)->gain_cfr3          = limit[SPD_G3].l_min;
	(*ppspLoLimit)->gain_cfr4          = limit[SPD_G4].l_min;
	(*ppspLoLimit)->loudness           = limit[SPD_LO].l_min;
	(*ppspLoLimit)->spectral_tilt      = limit[SPD_FT].l_min;
	(*ppspLoLimit)->baseline_fall      = limit[SPD_BF].l_min;
	(*ppspLoLimit)->lax_breathiness    = limit[SPD_LX].l_min;
	(*ppspLoLimit)->quickness          = limit[SPD_QU].l_min;
	(*ppspLoLimit)->hat_rise           = limit[SPD_HR].l_min;
	(*ppspLoLimit)->stress_rise        = limit[SPD_SR].l_min;
	(*ppspLoLimit)->avg_glot_open      = limit[SPD_AGO].l_min;
	(*ppspLoLimit)->avg_glot_voicd_open      = limit[SPD_AGVO].l_min;
	(*ppspLoLimit)->avg_glot_unv_open      = limit[SPD_AGUO].l_min;
	(*ppspLoLimit)->avg_glot_unv_open      = limit[SPD_AGUO].l_min;
	(*ppspLoLimit)->area_chink      = limit[SPD_CHINK].l_min;
	(*ppspLoLimit)->open_quo   = limit[SPD_OS].l_min;

	/* Fill high limits for speaker parameters */
	(*ppspHiLimit)->sex                = limit[SPD_SEX].l_max;
	(*ppspHiLimit)->smoothness         = limit[SPD_SM].l_max;
	(*ppspHiLimit)->assertiveness      = limit[SPD_AS].l_max;
	(*ppspHiLimit)->average_pitch      = limit[SPD_AP].l_max;
	(*ppspHiLimit)->pitch_range        = limit[SPD_PR].l_max;
	(*ppspHiLimit)->breathiness        = limit[SPD_BR].l_max;
	(*ppspHiLimit)->richness           = limit[SPD_RI].l_max;
	(*ppspHiLimit)->num_fixed_samp_og  = limit[SPD_NF].l_max;
	(*ppspHiLimit)->laryngealization   = limit[SPD_LA].l_max;
	(*ppspHiLimit)->head_size          = limit[SPD_HS].l_max;
	(*ppspHiLimit)->formant4_res_freq  = limit[SPD_F4].l_max;
	(*ppspHiLimit)->formant4_bandwidth = limit[SPD_B4].l_max;
	(*ppspHiLimit)->formant5_res_freq  = limit[SPD_F5].l_max;
	(*ppspHiLimit)->formant5_bandwidth = limit[SPD_B5].l_max;
	(*ppspHiLimit)->parallel4_freq     = limit[SPD_P4].l_max;
	(*ppspHiLimit)->parallel5_freq     = limit[SPD_P5].l_max;
	(*ppspHiLimit)->gain_frication     = limit[SPD_GF].l_max;
	(*ppspHiLimit)->gain_aspiration    = limit[SPD_GH].l_max;
	(*ppspHiLimit)->gain_voicing       = limit[SPD_GV].l_max;
	(*ppspHiLimit)->gain_nasalization  = limit[SPD_GN].l_max;
	(*ppspHiLimit)->gain_cfr1          = limit[SPD_G1].l_max;
	(*ppspHiLimit)->gain_cfr2          = limit[SPD_G2].l_max;
	(*ppspHiLimit)->gain_cfr3          = limit[SPD_G3].l_max;
	(*ppspHiLimit)->gain_cfr4          = limit[SPD_G4].l_max;
	(*ppspHiLimit)->loudness           = limit[SPD_LO].l_max;
	(*ppspHiLimit)->spectral_tilt      = limit[SPD_FT].l_max;
	(*ppspHiLimit)->baseline_fall      = limit[SPD_BF].l_max;
	(*ppspHiLimit)->lax_breathiness    = limit[SPD_LX].l_max;
	(*ppspHiLimit)->quickness          = limit[SPD_QU].l_max;
	(*ppspHiLimit)->hat_rise           = limit[SPD_HR].l_max;
	(*ppspHiLimit)->stress_rise        = limit[SPD_SR].l_max;
	(*ppspHiLimit)->avg_glot_open      = limit[SPD_AGO].l_max;
	(*ppspHiLimit)->avg_glot_voicd_open      = limit[SPD_AGVO].l_max;
	(*ppspHiLimit)->avg_glot_unv_open      = limit[SPD_AGUO].l_max;
	(*ppspLoLimit)->area_chink      = limit[SPD_CHINK].l_max;
	(*ppspLoLimit)->open_quo      = limit[SPD_OQ].l_max;
	(*ppspHiLimit)->output_gain_mult   = limit[SPD_OS].l_max;

	speaker_num = pDph_t->curspdef[SPD_NM];
//#ifdef BROKEN
	if (pKsd_t->uiSampleRate < 8763) /* 8-bit */
		switch (speaker_num)
		{	// CAB Removed warnings by typecast
			case 0:	cur_speaker = (short *)paul_8;   break;
			case 1:	cur_speaker = (short *)betty_8;  break;
			case 2:	cur_speaker = (short *)harry_8;  break;
			case 3:	cur_speaker = (short *)frank_8;  break;
			case 4:	cur_speaker = (short *)dennis_8; break;
			case 5:	cur_speaker = (short *)kit_8;    break;
			case 6:	cur_speaker = (short *)ursula_8; break;
			case 7:	cur_speaker = (short *)rita_8;   break;
			case 8:	cur_speaker = (short *)wendy_8;  break;

		}
	else /* 16-bit */
		switch (speaker_num)
		{	// CAB Removed warnings by typecast
			case 0:	cur_speaker = (short *)paul;   break;
			case 1:	cur_speaker = (short *)betty;  break;
			case 2:	cur_speaker = (short *)harry;  break;
			case 3:	cur_speaker = (short *)frank;  break;
			case 4:	cur_speaker = (short *)dennis; break;
			case 5:	cur_speaker = (short *)kit;    break;
			case 6:	cur_speaker = (short *)ursula; break;
			case 7:	cur_speaker = (short *)rita;   break;
			case 8:	cur_speaker = (short *)wendy;  break;

		}
//#endif
	/* Fill default speaker parameters for current speaker */
	/* The default speaker parameters are taken from the appropriate array, which is defined */
	/* in p_??_vdf.c.                                                                        */

	(*ppspDefault)->sex                = cur_speaker[SPD_SEX];
	(*ppspDefault)->smoothness         = cur_speaker[SPD_SM];
	(*ppspDefault)->assertiveness      = cur_speaker[SPD_AS];
	(*ppspDefault)->average_pitch      = cur_speaker[SPD_AP];
	(*ppspDefault)->pitch_range        = cur_speaker[SPD_PR];
	(*ppspDefault)->breathiness        = cur_speaker[SPD_BR];
	(*ppspDefault)->richness           = cur_speaker[SPD_RI];
	(*ppspDefault)->num_fixed_samp_og  = cur_speaker[SPD_NF];
	(*ppspDefault)->laryngealization   = cur_speaker[SPD_LA];
	(*ppspDefault)->head_size          = cur_speaker[SPD_HS];
	(*ppspDefault)->formant4_res_freq  = cur_speaker[SPD_F4];
	(*ppspDefault)->formant4_bandwidth = cur_speaker[SPD_B4];
	(*ppspDefault)->formant5_res_freq  = cur_speaker[SPD_F5];
	(*ppspDefault)->formant5_bandwidth = cur_speaker[SPD_B5];
	(*ppspDefault)->parallel4_freq     = cur_speaker[SPD_P4];
	(*ppspDefault)->parallel5_freq     = cur_speaker[SPD_P5];
	(*ppspDefault)->gain_frication     = cur_speaker[SPD_GF];
	(*ppspDefault)->gain_aspiration    = cur_speaker[SPD_GH];
	(*ppspDefault)->gain_voicing       = cur_speaker[SPD_GV];
	(*ppspDefault)->gain_nasalization  = cur_speaker[SPD_GN];
	(*ppspDefault)->gain_cfr1          = cur_speaker[SPD_G1];
	(*ppspDefault)->gain_cfr2          = cur_speaker[SPD_G2];
	(*ppspDefault)->gain_cfr3          = cur_speaker[SPD_G3];
	(*ppspDefault)->gain_cfr4          = cur_speaker[SPD_G4];
	(*ppspDefault)->loudness           = cur_speaker[SPD_LO];
	(*ppspDefault)->spectral_tilt      = cur_speaker[SPD_FT];
	(*ppspDefault)->baseline_fall      = cur_speaker[SPD_BF];
	(*ppspDefault)->lax_breathiness    = cur_speaker[SPD_LX];
	(*ppspDefault)->quickness          = cur_speaker[SPD_QU];
	(*ppspDefault)->hat_rise           = cur_speaker[SPD_HR];
	(*ppspDefault)->stress_rise        = cur_speaker[SPD_SR];
	(*ppspDefault)->avg_glot_open      = cur_speaker[SPD_AGO];
#if (defined (WIN32) || defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_) && !defined (i386)
	(*ppspDefault)->output_gain_mult   = cur_speaker[SPD_OS];
#endif

	return MMSYSERR_NOERROR;
}

/********************************************************************
 *  Function: SetSpeakerParams
 *  By      : Jason Warlikowski
 *  Date    : April 6, 1998
 *
 *  Description:	This function is called by the API function 
 *					TextToSpeechSetSpeakerParams. It receives a SPDEFS 
 *					structure and sets the current speaker's parameters
 *					to the values in that SPDEFS structure.
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS		Text-to-speech handle
 *					SPDEFS **pspSet
 *
 *      Return Value:	MMRESULT
 *						MMSYSERR_NOERROR	
 *						MMSYSERR_NVALPARAM	Invalid parameter
 *
 *      Comments:
 * ********************************************************************************************/
MMRESULT SetSpeakerParams(LPTTS_HANDLE_T phTTS, SPDEFS *pspSet)
{
	PDPH_T pDph_t;
	PKSD_T pKsd_t;
	int voice;

	if (phTTS == NULL)
		return MMSYSERR_INVALPARAM;

	pDph_t = phTTS->pPHThreadData;
	pKsd_t = phTTS->pKernelShareData;
	voice = pKsd_t->last_voice;

	/* Set current speaker parameters */
	pDph_t->curspdef[SPD_SEX] = pspSet->sex				 +	(pDph_t->tunedef[voice][SPD_SEX]);
	pDph_t->curspdef[SPD_SM]  = pspSet->smoothness		 +	(pDph_t->tunedef[voice][SPD_SM]);
	pDph_t->curspdef[SPD_AS]  = pspSet->assertiveness	 +	(pDph_t->tunedef[voice][SPD_AS]);
	pDph_t->curspdef[SPD_AP]  = pspSet->average_pitch	 +	(pDph_t->tunedef[voice][SPD_AP]);
	pDph_t->curspdef[SPD_PR]  = pspSet->pitch_range		 +	(pDph_t->tunedef[voice][SPD_PR]);
	pDph_t->curspdef[SPD_BR]  = pspSet->breathiness		 +	(pDph_t->tunedef[voice][SPD_BR]);
	pDph_t->curspdef[SPD_RI]  = pspSet->richness			 +	(pDph_t->tunedef[voice][SPD_RI]);
	pDph_t->curspdef[SPD_NF]  = pspSet->num_fixed_samp_og  +	(pDph_t->tunedef[voice][SPD_NF]);
	pDph_t->curspdef[SPD_LA]  = pspSet->laryngealization  +	(pDph_t->tunedef[voice][SPD_LA]);
	pDph_t->curspdef[SPD_HS]  = pspSet->head_size		 +	(pDph_t->tunedef[voice][SPD_HS]);
	pDph_t->curspdef[SPD_F4]  = pspSet->formant4_res_freq  +	(pDph_t->tunedef[voice][SPD_F4]);
	pDph_t->curspdef[SPD_B4]  = pspSet->formant4_bandwidth  +	(pDph_t->tunedef[voice][SPD_B4]);
	pDph_t->curspdef[SPD_F5]  = pspSet->formant5_res_freq  +	(pDph_t->tunedef[voice][SPD_F5]);
	pDph_t->curspdef[SPD_B5]  = pspSet->formant5_bandwidth  + (pDph_t->tunedef[voice][SPD_B5]);
	pDph_t->curspdef[SPD_P4]  = pspSet->parallel4_freq	 +	(pDph_t->tunedef[voice][SPD_P4]);
	pDph_t->curspdef[SPD_P5]  = pspSet->parallel5_freq	 +	(pDph_t->tunedef[voice][SPD_P5]);
	pDph_t->curspdef[SPD_GF]  = pspSet->gain_frication	 +	(pDph_t->tunedef[voice][SPD_GF]);
	pDph_t->curspdef[SPD_GH]  = pspSet->gain_aspiration	 +	(pDph_t->tunedef[voice][SPD_GH]);
	pDph_t->curspdef[SPD_GV]  = pspSet->gain_voicing		 +	(pDph_t->tunedef[voice][SPD_GV]);
	pDph_t->curspdef[SPD_GN]  = pspSet->gain_nasalization  +	(pDph_t->tunedef[voice][SPD_GN]);
	pDph_t->curspdef[SPD_G1]  = pspSet->gain_cfr1		 +	(pDph_t->tunedef[voice][SPD_G1]);
	pDph_t->curspdef[SPD_G2]  = pspSet->gain_cfr2		 +	(pDph_t->tunedef[voice][SPD_G2]);
	pDph_t->curspdef[SPD_G3]  = pspSet->gain_cfr3		 +	(pDph_t->tunedef[voice][SPD_G3]);
	pDph_t->curspdef[SPD_G4]  = pspSet->gain_cfr4		 +	(pDph_t->tunedef[voice][SPD_G4]);
	pDph_t->curspdef[SPD_LO]  = pspSet->loudness			 +	(pDph_t->tunedef[voice][SPD_LO]);
	pDph_t->curspdef[SPD_FT]  = pspSet->spectral_tilt	 +	(pDph_t->tunedef[voice][SPD_FT]);
	pDph_t->curspdef[SPD_BF]  = pspSet->baseline_fall	 +	(pDph_t->tunedef[voice][SPD_BF]);
	pDph_t->curspdef[SPD_LX]  = pspSet->lax_breathiness	 +	(pDph_t->tunedef[voice][SPD_LX]);
	pDph_t->curspdef[SPD_QU]  = pspSet->quickness		 +	(pDph_t->tunedef[voice][SPD_QU]);
	pDph_t->curspdef[SPD_HR]  = pspSet->hat_rise			 +	(pDph_t->tunedef[voice][SPD_HR]);
	pDph_t->curspdef[SPD_SR]  = pspSet->stress_rise		 +	(pDph_t->tunedef[voice][SPD_SR]);
	pDph_t->curspdef[SPD_AGO]  = pspSet->avg_glot_open	 +	(pDph_t->tunedef[voice][SPD_AGO]);
	pDph_t->curspdef[SPD_AGVO]  = pspSet->avg_glot_open	 +	(pDph_t->tunedef[voice][SPD_AGVO]);
	pDph_t->curspdef[SPD_AGUO]  = pspSet->avg_glot_open	 +	(pDph_t->tunedef[voice][SPD_AGUO]);
	pDph_t->curspdef[SPD_CHINK]  = pspSet->area_chink	 +	(pDph_t->tunedef[voice][SPD_CHINK]);
	pDph_t->curspdef[SPD_OQ]  = pspSet->open_quo	 +	(pDph_t->tunedef[voice][SPD_OQ]);

#if (defined (WIN32) || defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_) && !defined (i386)
	pDph_t->curspdef[SPD_OS]  = pspSet->output_gain_mult;
#endif

	pDph_t->loadspdef = TRUE; /* inform PH to reload the VTM on the next utterance */

	return MMSYSERR_NOERROR;
}
#endif // ARM7
#endif // MSDOS
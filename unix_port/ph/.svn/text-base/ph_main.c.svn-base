/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:    ph_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * 	  This file contains the
 * 	  mainline of the synthesizer task.
 * 	  It reads phonemes from letter to
 * 	  sound, packs them into clauses, and
 * 	  converts them to signal processor
 * 	  control frames.
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------  
 * 001  DGC    	12/27/1984		Renamed from "kl1.c". Many edits for
 *                      		the new synthesizer.
 * 002  DGC   	01/02/1985		Added an "mstofr" routine that watches
 *                      		out for overflow on 16 bit machines.
 * 003  DGC		01/19/1985    	Dennis changed "phdefs.h" so that it always
 *                      		included "def.h". Deleted the include line
 *                      		that was in this file.
 * 004  DGC		01/24/1985    	Added some code at the top of the main
 *                      		loop that turns WBOUND into COMMA if it
 *                      		looks like we are getting close to the edge.
 * 005  DGC		01/31/1985    	Changed the way that "SYNC" is done.
 * 006  DGC		03/06/1985    	Changed the code that writes out the index
 *                      		reply stuff to use "PUTSEQ".
 * 007  DGC		04/17/1985    	Changes due to default/0 change in "ansi.c".
 * 008  DGC 	06/02/1985   	Added LOG_PHONEME.
 * 009  DGC		06/07/1985    	"ef" => "lx" in speaker definition.
 * 010  DGC 	06/18/1985   	"g5" => "lo" in speaker definition.
 * 011  DGC 	06/19/1985	    Enforce limits for ":ra", ":cp", ":pp".
 * 012  DGC		07/26/1985	    "outpar" isn't  structure anymore.
 * 013  DGC		08/08/1985	    "haltsw" (FLAG) => "halting" (short), new sync.
 * ------------------   Released as C5005 V1.0 firmware.
 * 014  DGC 	10/21/1985   	Changes for KRM.
 * 015  DGC 	11/07/1985	    Fixed a bug in indexing found by Kurzweil.
 * 016  EAB 	01/12/1990  	Put in changes for NKR and SENT.(compile changes)
 * 017  EAB 	01/16/1990  	change rate limit from 350 to 550
 * 018  EAB 	07/25/1990	    ADDED COMMA PAUSE CHANGED FOR NANCY JARRELL-CHB
 * 019  SGS		09/17/1990    	Added PR control switches
 * 020  CJL		03/15/1995    	Added debug code for printf bug; uses define DEBUG
 * 021  JDB		09/17/1995   	Replaced /n's with \n's.
 * 022  MGS 	03/21/1996	  	WIN32 code merge 
 * 023	MGS	 	05/31/1996		kltask moved to ph_task.c file
 * 024	MGS		05/31/1996		Merged spanish with english
 * 025	MGS		06/06/1996		Changed file name from phmain.c ph_main.c
 * 026	SIK		07/08/1996  	Cleaning up and maintenance
 * 030  GL		10/26/1996		merge the TEK 8/13/96 change into the code
 * 031  GL		12/05/1996		remove the language pipe hack for DTEX.
 * 032  GL		12/11/1996		initialize the lang_curr only for MSDOS
 *								also remove the WIN32 language pipe hack
 * 033	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 034	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 035  DR		09/30/1997		UK BUILD: added UK STUFF
 * 036	MGS		10/14/1997		BATS #470 Fixed crashing due to reset
 * 037	ET		06/04/1998		Merged in code from PHEDIT2
*/

#include "ph_def.h"		/* the new all inclusive include file for ph */

#ifdef SEPARATE_PROCESSES
struct share_data      *kernel_share;

#endif

#ifdef PHEDIT2 /* ET merged from PHEDIT2 */
#ifdef ENGLISH
short int TOT_ALLOPHONES = 57;
#else
short int TOT_ALLOPHONES = (PH_LAST_PH+1);  /* total number of phones */
#endif
#endif /* PHEDIT2 */
											
/* 
 * #ifdef __osf__ this is the opaque PIPE input handle    
 * MVP : Now it is same as for NT. extern void *vtm_pipe; 
 * #endif 
 */


/* 
 *  asperation is used to dynamically adapt the period and comma pauses ...
 */

/* unsigned int    asperation; 	  *//* MVP MI Made instance specific in DPH_T */
/* int             reset_pitch;   *//* MVP MI Made instance specific in DPH_T */
/* int             default_pitch; *//* MVP MI Made instance specific in DPH_T */

/***************************************************************************/
/* MVP: The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* Input arrays (set by call to PH_SETAR.C whenever time for new phone)    */
/* extern PARAMETER param[];        Struc of input vars for each par       */
/* extern  short   parstochip[];    Array of paramters to TMS.             */
/* extern  short   symbols[];       Where input symbols go.                */
/* extern  short   nsymbtot;        Length of above.                       */
/* extern  short   *user_durs;      Where user durations go.               */
/* extern  short   *user_f0;        Where user f0 commands go.             */
/* extern  short curspdef[];        current speaker definition             */
/* extern  FLAG    loadspdef;       Flag: need to load TMS320.             */
/* extern  short   compause;        Comma pause, frames                    */
/* extern  short   perpause;        Period pause, frames                   */
/* int     bound;                                                          */
/* int     nphone;                                                         */
/* int     lastoffs;                                                       */
/* MVP MI :                       Now kinp made local wherever it is used  */
/* extern  P_PIPE  kinp;          Link to KLSYN input pipe                 */
/* extern  short   simage;        Switch image(NOT USED)                   */
/* extern  short   sprate;     MVP :Is now an element of Kernel_share_data */
/* Speaking rate                										   */
/* extern  short   last_voice;  MVP MI Not used                            */
/* Voice for tone reloads 												   */
/* extern  short curspdef[];    current speaker definition                 */
/* extern   int docitation;                                                */
/***************************************************************************/

/* 
 * Because the KRM uses a very large
 * number of index marks, Kurzweil asked for the index
 * event queue to be made larger. This was possible
 * because a lot of space was freed up in the RAM since
 * a lot of things (tasks, option buffers, and so on)
 * got deleted from the code.
 */

/* MVP : Function prototypes */
#ifndef MSDOS
void FreePHInstanceData (PDPH_T pDph_t);

#endif

/* Static function declarations */

/*
 *      Function Name: 
 *						#ifdef MSDOS
 *							main()
 *						#else
 *							ph_main()      
 *
 *  	Description: process creation main ... this entry is called by the 
 *					 loader to create any static processes that are needed 
 *					 for this task ...
 *
 *      Arguments: 		
 *                 	#ifdef MSDOS
 *						data_seg, stack_start 
 *					#else
 *						LPTTS_HANDLE_T phTTS
 *      Return Value: int 0
 *
 *      Comments:
 *
 */

#ifdef WIN32

int __stdcall ph_main (LPTTS_HANDLE_T phTTS)

#endif

#ifdef MSDOS
struct TTS_HANDLE_TAG   hTTS;
LPTTS_HANDLE_T          phTTS;
DPHSETTAR_ST            STphsettar;
DPH_T                   Dph_t;

#define WITHOUT_CALLOC               
#ifndef NULL
#define NULL ((void *)0)
#endif

main (data_seg, stack_start)
	unsigned int            data_seg;
	unsigned int            stack_start;
#endif


/* GL 04/21/1997  change to be the same as the latest OSF code */
#ifdef __osf__	
OP_THREAD_ROUTINE(ph_main, LPTTS_HANDLE_T phTTS)
#endif

{
	/* Added a variable to get the handle of Current instance krenel_share_data */
	PKSD_T                  pKsd_t;
	PDPH_T                  pDph_t = NULL;
	PDPHSETTAR_ST           pDphsettar_st = NULL;	/* Pointer to PHSETTAR.C file STATIC structure */

#ifdef WITHOUT_CALLOC
	int                     i;		   /* MVP : 03/18/96 */
#endif

#ifdef MSDOS
	phTTS = &hTTS;
	phTTS->pKernelShareData = kernel_share;		/* set a pointer to the KS structure */
	pKsd_t = phTTS->pKernelShareData;
	phTTS->pPHThreadData = &Dph_t;
	pDph_t = phTTS->pPHThreadData;
	pDph_t->pSTphsettar = &STphsettar;
	pDphsettar_st = pDph_t->pSTphsettar;
#else
	pKsd_t = phTTS->pKernelShareData;

#ifdef __osf__
    /* GL 04/21/1997  add this as the latest OSF code */
    /* Initialize thread error field to no error */
    phTTS->uiThreadError = MMSYSERR_NOERROR;
#endif

#ifdef SEPARATE_PROCESSES
	kernel_share = (struct share_data *) malloc (sizeof (struct share_data));

#endif
	/* MVP MI kinp is not used in this function  kinp = pKsd_t->lang_ph[LANG_english]; */
	if ((pDph_t = (PDPH_T) calloc (1, sizeof (DPH_T))) == NULL)
#ifdef WIN32
		return (MMSYSERR_NOMEM);
#endif
#ifdef __osf__
		phTTS->uiThreadError = MMSYSERR_NOMEM;
        else
        {
#endif
		/* Associate this PH thread instance specific structure with current speech object */
		phTTS->pPHThreadData = pDph_t;
#ifndef MSDOS
		/* MGS BATS 470 Fixed crashing due to reset */
		pDph_t->phTTS=phTTS;
#endif
		/* MVP : Initialize all structure pointers in DPH_T to NULL. */
		pDph_t->pSTphsettar = NULL;

	/****************************************************************************/
	/* MVP : Allocation of structures specific to STATIC varaibles in each file */
	/****************************************************************************/

		/* Structure for PHSETTAR.C file specific static variables */
		/* MVP: 03/19/96 Use calloc() to initialize all elements to zero. */
		if ((pDphsettar_st = (PDPHSETTAR_ST) calloc (1, sizeof (DPHSETTAR_ST))) == NULL)
		{
			FreePHInstanceData (pDph_t);
			phTTS->pPHThreadData = NULL;
#ifdef WIN32
			return (MMSYSERR_NOMEM);
		}
#endif
#ifdef __osf__
			phTTS->uiThreadError = MMSYSERR_NOMEM;
		}
		}
#endif

#ifdef WIN32
	SetEvent (phTTS->hMallocSuccessEvent);	/* Malloc s are success,set the event */
#endif
#ifdef __osf__
        /* CP: Set the event, even if malloc eerror occurred. User
         * will look at uiThreadError for actual error code.
         */
		OP_SetEvent(phTTS->hMallocSuccessEvent);
        if (phTTS->uiThreadError != MMSYSERR_NOERROR)
		{
			OP_ExitThread(phTTS->uiThreadError);
			OP_THREAD_RETURN;
		}
#endif
#endif

	/* Associate this structure handle with current PH thread data structure */
	pDph_t->pSTphsettar = pDphsettar_st;
	/* MVP :Do required initialization of certain elements of DPHSETTAR_ST structure */
#ifdef WITHOUT_CALLOC
	pDphsettar_st->drawinitsw = 0;
	pDphsettar_st->breathyah = 0;
	pDphsettar_st->breathytilt = 0;
	pDphsettar_st->nrises_sofar = 0;
	pDphsettar_st->hatsize = 0;    
#ifdef NWSNOAA
	pDphsettar_st->lastbound = 0; 
#endif
	pDphsettar_st->tarbas=0;
	pDphsettar_st->hat_loc_re_baseline = 0;
	pDphsettar_st->initsw = 0;		   	/* MVP :03/19/96 */

	pDphsettar_st->sprlast = 0;		   	/* MVP :03/19/96 */

	pDphsettar_st->strucstressprev = 0;	/* MVP :03/19/96 */      

	pDphsettar_st->phonex_drawt0 = 0;  	/* MVP :03/19/96 */

	pDphsettar_st->tarseg = 0;		   	/* MVP :03/19/96 */

	pDphsettar_st->tarseg1 = 0;		   	/* MVP :03/19/96 */

	pDphsettar_st->nimp = 0;		   	/* MVP :03/19/96 */

	pDphsettar_st->timecos10 = 0;	   	/* MVP :03/19/96 */

	pDphsettar_st->timecos15 = 0;	   	/* MVP :03/19/96 */

	pDphsettar_st->timecosvib = 0;	/* MVP :03/19/96 */
	/* MVP : 03/15/96 Do required initialization of certain elements of  DPH_T structure    */
	pDph_t->initpardelay = 0;
	/* MVP: 03/18/96 */
	for (i = 0; i < VOICE_PARS; i++)
		pDph_t->parstochip[i] = 0;
	pDph_t->shrink=0;
	pDph_t->shrib=0;
	pDph_t->shrif=0;
#ifdef SPANISH
		pDph_t->th_to_s=0;			/* From p_sp_st1.c 						*/
	    pDph_t->istrill=0;	  		/* TRUE if curr. phoneme is /rr/  		*/
	    pDph_t->trillcount=0;	   	/* Modulation index for /rr/ trill      */
	    pDph_t->trillend=0;	   		/* Stop trill 25 msec. before durphon   */
		pDph_t->trillclosed = 0;	/* The trill is gone                    */
		// from sphdrwt0.c
		pDph_t->special_phrase = 0;
		pDph_t->delta_special = 0;
		pDph_t->lastf0 = 0;
		pDph_t->evryoth = 0;
		pDph_t->emphasisflag = 0;
		pDph_t->pbvalue = NULL;	    /* Pointer into boundary value table  	*/
		pDph_t->p_bvalue = NULL;    /* Pointer into boundary value table  	*/
	    pDph_t->specdur=0;
#endif
#ifdef GERMAN
		pDph_t->curr_insph=0;
		pDph_t->modulcount=0;	 	/* for uvular /R/ modulation 			*/
		pDph_t->new_sentence=0;  	/* for german sentence intonation 		*/
		pDph_t->old_delay=0;	   	/* for intonation 						*/	
		pDph_t->nstep=0;
		pDph_t->gain=0;
		pDph_t->tarold=0;
		pDph_t->dur1=0;
		pDph_t->slope=0;
		pDph_t->oldval=0;
		pDph_t->tcount=0;
		pDph_t->dirchange=0;
		pDph_t->osil=0;
		memset(pDph_t->pars,0,sizeof(SENT_PARS)*MAXSPA);
		pDph_t->hat_seen=0;
		pDph_t->wordcount=0;
		memset(pDph_t->Intonation,0,sizeof(SENTENCE_INTONATION));
		pDph_t->old_delay=0;
#endif
#endif

	/* MVP : Initialize the speaker param arrays voidef,voidef_8 here */
	pDph_t->voidef_8[0] = paul_8;
	pDph_t->voidef_8[1] = betty_8;
	pDph_t->voidef_8[2] = harry_8;
	pDph_t->voidef_8[3] = frank_8;
	pDph_t->voidef_8[4] = dennis_8;
	pDph_t->voidef_8[5] = kit_8;
	pDph_t->voidef_8[6] = ursula_8;
	pDph_t->voidef_8[7] = rita_8;
	pDph_t->voidef_8[8] = wendy_8;
	pDph_t->voidef_8[9] = pDph_t->var_val;

	pDph_t->voidef[0] = paul;
	pDph_t->voidef[1] = betty;
	pDph_t->voidef[2] = harry;
	pDph_t->voidef[3] = frank;
	pDph_t->voidef[4] = dennis;
	pDph_t->voidef[5] = kit;
	pDph_t->voidef[6] = ursula;
	pDph_t->voidef[7] = rita;
	pDph_t->voidef[8] = wendy;
	pDph_t->voidef[9] = pDph_t->var_val;

#ifdef MSDOS
	pKsd_t->lang_curr = LANG_none;	/* KM added for initilizing lang tables */
#endif

#ifdef MSDOS
#ifdef ENGLISH_US
		default_lang (LANG_english, LANG_ph_ready);
#endif
#ifdef ENGLISH_UK
		default_lang (LANG_british, LANG_ph_ready);
#endif
#ifdef SPANISH
		default_lang (LANG_spanish, LANG_ph_ready);
#endif
#ifdef GERMAN                        
		default_lang (LANG_german, LANG_ph_ready);
#endif

	create_process (kltask, 4, data_seg, stack_start, 0);

#else
#ifdef ENGLISH_US
		default_lang (pKsd_t, LANG_english, LANG_ph_ready);
#endif
#ifdef ENGLISH_UK
		default_lang (pKsd_t, LANG_british, LANG_ph_ready);
#endif
#ifdef SPANISH
		default_lang (pKsd_t, LANG_spanish, LANG_ph_ready);
#endif
#ifdef GERMAN
		default_lang (pKsd_t, LANG_german, LANG_ph_ready);
#endif
#ifdef FRENCH
		default_lang (pKsd_t, LANG_french, LANG_ph_ready);
#endif

	kltask (phTTS);
	/* Free the allocated instance specific structure,before the thread returns */
	FreePHInstanceData (pDph_t);
	phTTS->pPHThreadData = pDph_t = NULL;
#endif
#if defined (MSDOS) || defined (WIN32)
	return 0;						/* No error MVP */
#endif
#ifdef __osf__
	OP_ExitThread(MMSYSERR_NOERROR);
	OP_THREAD_RETURN;
#endif
}

#ifndef MSDOS
void FreePHInstanceData(PDPH_T pDph_t)
{
	if (pDph_t->pSTphsettar)
		free (pDph_t->pSTphsettar);
	pDph_t->pSTphsettar = NULL;

	// tek 13aug96 have to free the last delaypars
	if(pDph_t->delaypars)
		spcfree(pDph_t->delaypars);

	if (pDph_t)
		free (pDph_t);
	pDph_t = NULL;

}
#endif
/*****************************end of phmain.c**************************************/

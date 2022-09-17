/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997 All rights reserved.
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
 *    File Name:    ph_claus.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * 	  Synthesize a clause from phonemic ascii input
 *    Assumes all voice changing commands have been removed
 *    and acted upon by higher-level code.
 *    Assumes optional user-specified durations in user_durs[]
 *    Assumes optional user-specified f0\notes in user_f0[]
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK		09/01/1984	    Initial creation
 * 0002 DGC		12/27/1984      Modified as required for 80186.
 * 0003 DK		07/84/1985      Add one-frame delay to all pars except AV,T0,TL
 * 0004 DGC		08/08/1985	    Haltsw (FLAG) => halting (short), new sync.
#ifdef ENGLISH_US from phclaus.c
 * 0005 CJL		02/15/1996	    Removed all KRM code. 
 * 0006 MGS		03/25/1996	    Merged WIN 95 code with 42c
#endif
#ifdef SPANISH  from sphclaus.c
 * 0005 MM		03/26/1986	    Dennis' changes
 * 0006 DF		06/02/1986	    DT3 updates: nbrphone -> nphonetot (Eng. base)
 * 0007 MM 		07/11/1986	    Merge 68000 updates (trillend)
#endif
#ifdef GERMAN 	from gphclaus.c
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 * 0005 BNK		07/21/1986	    allow use of german phonemes
 * 0006 BNK		09/12/1986	    variable initialization
 * 0007 BNK		01/12/1987	    prepare link to bk-package
 * 0008 CJL		03/30/1995	    File was phclause.c. Is now gphclaus.c. Changed
 *                      		phdefs.h->gphdefs.h
#endif
 * 0008 MGS		05/31/1996	 	Mergd spanish with english
 * 0009	MGS		06/06/1996		Changed file name from phcluase.c to ph_claus.c
 * 0010 MGS		06/17/1996		Merged German with english/spanish 
 * 0011 SIK		07/09/1996  	Cleaning up and maintenance
 * 0012 EDB		01/10/1997		remove some comment.
 * 0013	GL		03/27/1997		for BATS#319 
 *                              add 0800 debug switch.
 * 0014	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 * 0015	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 0016 TQL		06/03/1997		Fix an incorrect #if statement
 * 0017 DR		09/30/1997		UK BUILD: added UK STUFF
 * 0018 EAB		10/19/1997		remove the SPANISH trillend code
 * 0019 GL		12/12/1997		add the code for UK_English to support LINKRWORD
 * 0020 EAB     3/11/98                 Added new VTM control parameters enabled in dectalkf.h with NEW_VTM
 * 0021 CJL     03/20/98                Fix include path for dectalkf.h
 * 0022	gl		03/25/1998		Added DBGV command for PH debug variable passing
 *								For BATS#639 to change phinton() to use argument phTTS instead of pDph_t
 */

#include "ph_def.h"
 
#include "dectalkf.h"


/***************************************************************************/
/* MVP: The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* Output of PHCLAUSE() is set of commands to SENDC()                      */
/* extern short parstochip[];   Array of output pars for frame             */
/* extern short tcum;       Current time in frames re phone begin          */
/* Used by PHDRAW(), initialized here                                      */
/* extern short durfon;     Duration in frames of current phone            */
/* extern short allophons[];   Integer rep of phonetic string              */
/* extern short allofeats[];   Structural features                         */
/* extern short allodurs[];    Duration in frames for each phone           */
/* Output of PHALLOPH()                                                    */
/* extern short nallotot;      Number of phones in phonetic string         */
/* extern short symbols[];     Integer represent of input string           */
/* extern short nsymbtot;      Number of input symbols                     */
/* extern short *user_durs;    Array of user-specified durs (optional)     */
/* extern short *user_f0;      Array of user-specified f0 (optional)       */
/* Input variables to PHCLAUSE()                                           */
/* extern short *user_offset;  Array of user-specified f0 time offsets     */
/* Output of PHSORT()                                                      */
/* extern short *phonemes;    Integer represent of real phonemes           */
/* extern short *sentstruc;   Struct feats, (mod phone[],nphonetot)        */
/* extern short nphonetot;    Number of input symbols                      */
/* Output also reordered user_durs[],user_f0[]; 						   */	
/* extern FLAG  loadspdef;    Convert curspdef[] to spdeftochip[], and     */
/* extern short curspdef[];   Speaker definition                           */
/* extern short f0tar[];      F0 target commands, in Hz*10                 */
/* extern short f0tim[];      Times between commands, in frames            */
/* Used by PHDRAWT0(), initialized here                                    */
/* Used here                                                               */
/* extern short nf0ev;      Index to current f0 command in f0tar[]         */
/* Output of PHINTON()                                                     */
/* extern short nf0tot;     Number of commands for cur clause              */
/* extern short ph_init;    Initialize program (at startup time or         */
/* after DT_STOP emergency halt) if = 0                                    */
/* Output of PHTMING()                                                     */
/* extern S32 longcumdur;   For waveform simulation printout only          */
/* extern unsigned int asperation;  lung stuff                             */
/* extern short nphone;     Index to current phone in allophons[]          */
/* extern docitation;                                                      */
/* short initpardelay=0;                                                   */
/* short far *delaypars;                                                   */
/***************************************************************************/

/* Input variables to PHCLAUSE()                                        */
/* send this speaker def array to chip if=1 */

/* Input variables used in subroutines called from here:                */
/* extern short sprate;       Nominal speaking rate in words/minute     */
/* extern short compause;     Extra pause between clauses (DELETE?)     */
/* extern short perpause;     Extra pause between sentences (DELETE?)   */

/* Used here and by PH_SETAR.C,                    */
extern short            lineartilt[];  /* Linearize tilt @ 2500 Hz     */

/* static short n; *//* MVP : Moved to exit_if_done() */

/* Added function declaration for  send_pars and made static */
static void send_pars (LPTTS_HANDLE_T phTTS);
static int  exit_if_done (PDPH_T pDph_t);
static void init_pars (PDPH_T pDph_t);
static void init_clause (PDPH_T pDph_t);
void        init_phclause (PDPH_T pDph_t);

/* 
 * moved from phclause to allow syllables to be broken up after
 * allophonics ... 
 */
 

/*
 *      Function Name: phclause()      
 *
 *  	Description: Pronounces clauses
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void phclause (LPTTS_HANDLE_T phTTS)
{
/* GL 04/21/1997  add this for OSF build */
#if defined  (WIN32) || defined (__osf__) 
	DT_PIPE_T               pipe_item[1];
#endif
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	
	
	/* Initialization (init variables, zero arrays) */

	init_clause (pDph_t);

	/* 
	 * 1. If speaker def changed, now it time to really change it.          
	 * The old (KL) code used to set "initsw". This gets done in the        
	 * "send_pars" routine now (it only mattered on halt).                  
	 */

	if (pDph_t->loadspdef != FALSE)
	{
		pDph_t->loadspdef = FALSE;
		setspdef (phTTS);
	}

	/*
     * for (i=0;i<pDph_t->nsymbtot;i++)
     * {
     * 	printf("symbols[%d]=%d\n",i,pDph_t->symbols[i]);
     *   }  
	 */
	 
	/* 2. Sort input symbols into real phonemes vs. structural features          */

	if (phsort (phTTS) == FALSE)
		return;						   /* INPUT ARRAY:   symbols[nsymbtot]    */
	/* (optional):   user_durs[nsymbtot]  */
	/* OUTPUT ARRAYS: phonemes[nphonetot]  */
	/* sentstruc[nphonetot] */
    
	/*    
	 * for (i=0;i<pDph_t->nphonetot;i++)
	 * {
	 * 	  printf("phonemes[%d]=%d sentstruc[%d]=%d\n",i,pDph_t->phonemes[i],i,pDph_t->sentstruc[i]);
	 * }
	 */ 


	/* 3. Phonological rules, select allophones                             */
    /* INPUT ARRAYS: phonemes[nphonetot]    */
	phalloph (phTTS);				   
	/* sentstruc[nphonetot]   */
	/* OUTPUT ARRAYS: allophons[nallotot]   */
	/* allofeats[nallotot]   */
	
	/*	
	 * for (i=0;i<pDph_t->nallotot;i++)
	 *	{
	 *		printf("allophons[%d]=%d allofeats[%d]=%d\n",i,pDph_t->allophons[i],i,pDph_t->allofeats[i]);
	 *		printf("user_durs[%d]=%d\n",i,pDph_t->user_durs[i]);
	 *	}
	 */

#ifdef ENGLISH
		/* Docitation is a special flag that needs to be cleared after visiting 
		 * PHALLOPH. It is set in LTS to indicate that this word should be sited  
		 * if a single word. lTS can see the word but only ph sees the clause.    
		 */
		pDph_t->docitation = FALSE;
#ifdef ENGLISH_UK
		pDph_t->ends_in_r = FALSE;
#endif
#endif

	/* 4. Duration rules */
    /* INPUT ARRAYS: allophons[nallotot]    */
	phtiming (phTTS);				   
	/* allofeats[nallotot] */
	/* OUTPUT ARRAY: allodurs[nallotot]     */ 
	
	/*
  	 * for (i=0;i<pDph_t->nallotot;i++)
	 * {
	 *		printf("allodurs[%d]=%d user_durs[%d]=%d\n",i,pDph_t->allodurs[i],i,pDph_t->user_durs[i]);
	 * }
	 */

	/* 5. Fundamental frequency rules       */
    /* INPUT ARRAYS: allophons[nallotot]    */

/* GL 03/25/1998,  BATS#639 use phTTS argument instead of pDph_t */
	phinton(phTTS);

	/* allofeats[nallotot]    				*/
	/* allodurs[nallotot]     				*/
	/* OUTPUT ARRAYS: f0tim[nf0tot]         */
	/* f0tar[nf0tot]         				*/

	/* for (i=0;i<pDph_t->nf0tot;i++)
	 * {
	 *		printf("f0tim[%d]=%d  f0tar[%d]=%d\n",i,pDph_t->f0tim[i],i,pDph_t->f0tar[i]);
	 * }
	 */
		
 
	


	/* 6. Phonetic Component (draw parameter values every 6.4 ms)           */

	init_pars (pDph_t);				   /* Initialize, routine included below   */

#ifdef GERMAN
	pDph_t->modulcount=0;
#endif

	/* For each 6.4 msec frame of current clause */

	while (TRUE)
	{
		/* If time exceeds duration of current phone, Move to next one */

		if (++(pDph_t->tcum) >= pDph_t->durfon)
		{

			/* Handle index and index reply commands. */
#ifdef ENGLISH
				if (pDph_t->nphone != -1)
#endif
#ifdef SPANISH
				if (pDph_t->nphone >= 0)
#endif
#ifdef GERMAN
				if (pDph_t->nphone >= 0)
#endif
#ifdef MSDOS
					check_index (pDph_t->nphone);
#endif
/* GL 04/21/1997  add this for OSF build */
#if defined (WIN32) || defined (__osf__)
					check_index (pKsd_t, pDph_t->nphone);
#endif
			pDph_t->nphone++;

			/* Graceful exit if phonemes used up */

			if (exit_if_done (pDph_t))
			{

/* GL 04/21/1997  change this as the latest OSF code */
/* write forced clause boundary symbol to VTM */
#if defined (WIN32) || defined (__osf__)
				pipe_item[0] = SPC_type_force;
				write_pipe (pKsd_t->vtm_pipe, pipe_item, 1);
#endif
				return;
			}

			/* Reset tcum to time re begin curr phone */

			pDph_t->tcum -= pDph_t->durfon;
			pDph_t->durfon = pDph_t->allodurs[pDph_t->nphone];

/* EAB 10/19/1997 dummy code for Spanish */
#ifdef SPANISH_obsolete
				/* New for Spanish */
				if (pDph_t->allophons[pDph_t->nphone] == E_RR
					|| pDph_t->allophons[pDph_t->nphone] == E_R)
				{
					pDph_t->istrill = TRUE;
					 pDph_t->trillcount = 3;      
					/* start in open phrase  */  
				
					/* 
				 	 * Trillend ensures that the [r] ends with an
				 	 * "open" phase.
				 	 */
					if (pDph_t->durfon > 3)
					{
						pDph_t->trillend = pDph_t->durfon - NF25MS;
					}
					else
						pDph_t->trillend = pDph_t->durfon;
				}
				else
				{
					pDph_t->istrill = FALSE;
				}
#endif	/* #ifdef SPANISH */
			/* Call subroutine to reset targets and trans specs (PHSETTAR.C) */

			phsettar (phTTS);
			/* INPUT ARRAYS: allophons[nallotot] */
			/* allofeats[nallotot] */
			/* allodurs[nallotot], */
			/* OUTPUT ARRAY: Parameters[]       */     
			
		} /* if (++(pDph_t->tcum) >= pDph_t->durfon) */

		/* Determine next value of f0 contour, period and TILT (PHDRAWT0.C)  */

		pht0draw (phTTS);

		/* Call draw routine to set next value for 15 control pars (PHDRAW.C) */

		phdraw (phTTS);

		/* Send pars to synthesizer (or print/save them) */

		/* debug switch GL 03/27/97 for BATS#319 */
		if (!(DT_DBG(PH_DBG,0x800)))
		send_pars (phTTS);

	} /* while(TRUE) */
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: init_clause()      
 *
 *  	Description: Initialize variables for clause processing.
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void init_clause (PDPH_T pDph_t)
{

	/* Initialization */

	if (pDph_t->ph_init == 0)
	{
		pDph_t->ph_init = 1;
		pDph_t->loadspdef = TRUE;	   /* Force re-init of synthesizer */
	}
	if (pDph_t->loadspdef == TRUE)
	{
		pDph_t->nf0ev = -2;			   /* Make f0 jump to initial value */
	}
	else
	{
		pDph_t->nf0ev = -1;			   /* Weak initialization  phdrawt0.c */
	}
#ifdef GERMAN
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* initialization for sentence intonation                */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	pDph_t->old_delay = 0;
#endif
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


/*
 *      Function Name: init_phclause()      
 *
 *  	Description: THIS ROUTINE MUST BE CALLED BEFORE CALLING KLPARSE THE 
 *					 FIRST TIME 
 * 					 The logic of array sharing is as follows.  
 *					 (1) Input phonemes are converted to allophones in PH_ALOPH.C. 
 *					 Once converted to allophones, phonemes are not used again and
 *					 can be zapped.  The conversion process tends 
 * 					 to delete symbols, only occationally generating a new symbol.
 *					 Therefore, if one puts phonemes at the back end of the 
 *					 allophone array, no conflicts should occur.  The exact same 
 *					 argument holds for sentstruc[], user_durs[], and user_reply[].
 *					 (2) The arrays f0tar[] and f0tim[] are used in   
 * 					 PHINTON to hold f0 commands.  If user-specified f0 commands 
 *					 for SINGING, USER_SPECIFIED_F0_TARS, or USER_SPECIFIED_HATS 
 * 					 are input, they can be placed at the ends of these arrays.  
 *					 In the case of singing and F0_TARS, the commands are synched 
 * 					 with the phonemes, and the same argument as (1)   
 * 					 holds.  In the case of HATS, there is one command per ['] 
 *					 or ["] symbol in the input, and each such command results in 
 *					 the creation of 2 output commands during execution of PHINTON.  
 *					 For this case, HATS commands can be put in the back of the f0tar[],
 *					 f0tim[] arrays in every other position. 
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
void init_phclause (PDPH_T pDph_t)
{
	int                     i;

	for (i = 0; i < (NPHON_MAX + SAFETY + 2); i++)
	{
		pDph_t->f0tar[i] = 0;
		pDph_t->allophons[i] = 0;
		pDph_t->allofeats[i] = 0;
		pDph_t->allodurs[i] = 0;
		pDph_t->f0tim[i] = 0;
	}
	/* MVP: 03/19/96 Started adding initializing stuff here */
	pDph_t->fvvtran = 0;
	pDph_t->bvvtran = 0;

	/* Share array since fewer phonemes */
	/* Note SAFETY offset to allow a few inserts to allophons[] output string */

	pDph_t->phonemes = &(pDph_t->allophons[SAFETY]);
	pDph_t->sentstruc = &(pDph_t->allofeats[SAFETY]);
	pDph_t->user_durs = &(pDph_t->allodurs[SAFETY]);
	pDph_t->user_f0 = &(pDph_t->f0tar[SAFETY]);
	pDph_t->user_offset = &(pDph_t->f0tim[SAFETY]);
#ifdef GERMAN
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */

	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* initializiation of special german variables           */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	pDph_t->new_sentence = TRUE;			   /* for sentence intonation */
#endif
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 *      Function Name: init_pars()      
 *
 *  	Description: Initializing vars. for phoneme processing.
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
static void init_pars (PDPH_T pDph_t)
{

	pDph_t->tcum = -1;				   /* Time in frames relative to begin current phoneme */
	pDph_t->nphone = -1;			   /* Pointer to current phoneme */
	pDph_t->durfon = 0;				   /* Duration of current phoneme in frames */
#ifdef SPANISH
	pDph_t->istrill = FALSE;		   /* True if doing an /rr/ trill now */
#endif
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 *      Function Name: exit_if_done()     
 *
 *  	Description: Graceful exits if phonemes used up.
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

static int exit_if_done (PDPH_T pDph_t)
{
	short n;

	if (pDph_t->nphone >= pDph_t->nallotot)
	{								   /* See if done */

		/* Zero arrays whose contents must be zero upon re-entry to phclause() */
		for (n = 0; n <= pDph_t->nsymbtot; n++)
		{
			pDph_t->user_durs[n] = 0;
			pDph_t->user_f0[n] = 0;
			pDph_t->user_offset[n] = 0;
		}   
#ifdef GERMAN
		if ((pDph_t->allofeats[pDph_t->nallotot - 1] & FPERNEXT) != 0)
		{
			pDph_t->new_sentence = TRUE;
		}
		else
		{
			pDph_t->new_sentence = FALSE;
		}
#endif		
		return (TRUE);
	}
	return (FALSE);
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 *      Function Name: send_pars()     
 *
 *  	Description: Moves frames into the output buffer and
 *					 sends the output buffer.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void send_pars (LPTTS_HANDLE_T phTTS)
{

	int                     asp_bump = 0;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	/* Special buffer to delay all pars except AV, TILT, & T0 by one frame */
	/* 1. Move non-delayed pars to output buffer.        */
	/* 2. Send output buffer.                                    */
	/* 3. Move delayed pars to output buffer.                    */

	if (pDph_t->initpardelay == 0)
	{
		pDph_t->initpardelay++;
#ifdef SEPARATE_PROCESSES
		pDph_t->delaypars = (short *) calloc (sizeof (short), VOICE_PARS);

#else
		pDph_t->delaypars = (short _far *) spcget (SPC_type_voice);
#endif
	}
	else
	{
		if (pDph_t->delaypars[OUT_AV] = pDph_t->parstochip[OUT_AV])
			asp_bump = TRUE;
		/* 
		 * Linearize the actual tilt to be more like the requested tilt
		 */
		pDph_t->delaypars[OUT_TLT] = lineartilt[pDph_t->parstochip[OUT_TLT]];
		pDph_t->delaypars[OUT_T0] = pDph_t->parstochip[OUT_T0];

		/* 
		 * Panic halt. Kill off this clause. The SPC handler notes that
		 * the "halting" is non 0, and discards packets.
 		 */

		if (pKsd_t->halting)
		{
			pDph_t->tcum = pDph_t->durfon;	/* Clobber the clause.  */
			pDph_t->nphone = pDph_t->nallotot;
			pDph_t->ph_init = 0;	   /* May be heavy-handed. */
			return;
		}

		/* Send frame of output parameters to synthesizer chip (in PH_CLAUS.C) */

#ifdef SPANISH_obsolete
	if (!pDph_t->trillclosed) 
	{ 
		spcwrite(pDph_t->delaypars); 
		pDph_t->delaypars=(short far *)spcget(SPC_type_voice); 
	}
#endif

#ifdef SEPARATE_PROCESSES
		fwrite (&vc, sizeof (short), 1, stdout);
		fwrite (pDph_t->delaypars, sizeof (short), VOICE_PARS, stdout);

		fflush (stdout);
#else
#ifdef MSDOS
		spcwrite (pDph_t->delaypars);
#endif
/* GL 04/21/1997  add this for OSF build */
#if defined (WIN32) || defined (__osf__)
		spcwrite (pKsd_t, pDph_t->delaypars);
#endif
		pDph_t->delaypars = (short far *) spcget (SPC_type_voice);
#endif
	}
	pDph_t->delaypars[OUT_F1] = pDph_t->parstochip[OUT_F1];
	pDph_t->delaypars[OUT_B1] = pDph_t->parstochip[OUT_B1];
	pDph_t->delaypars[OUT_F2] = pDph_t->parstochip[OUT_F2];
	pDph_t->delaypars[OUT_B2] = pDph_t->parstochip[OUT_B2];
	pDph_t->delaypars[OUT_F3] = pDph_t->parstochip[OUT_F3];
	pDph_t->delaypars[OUT_B3] = pDph_t->parstochip[OUT_B3];
	pDph_t->delaypars[OUT_FZ] = pDph_t->parstochip[OUT_FZ];
	if (pDph_t->delaypars[OUT_A2] = pDph_t->parstochip[OUT_A2])
		asp_bump = TRUE;
	if (pDph_t->delaypars[OUT_A3] = pDph_t->parstochip[OUT_A3])
		asp_bump = TRUE;
	if (pDph_t->delaypars[OUT_A4] = pDph_t->parstochip[OUT_A4])
		asp_bump = TRUE;
	if (pDph_t->delaypars[OUT_A5] = pDph_t->parstochip[OUT_A5])
		asp_bump = TRUE;
	if (pDph_t->delaypars[OUT_A6] = pDph_t->parstochip[OUT_A6])
		asp_bump = TRUE;
	if (pDph_t->delaypars[OUT_AB] = pDph_t->parstochip[OUT_AB])
		asp_bump = TRUE;
	pDph_t->delaypars[OUT_AP] = pDph_t->parstochip[OUT_AP];
/* GL 04/21/1997  add this for OSF build */
#if defined (WIN32) || defined (__osf__)
	pDph_t->delaypars[OUT_PH] = pDph_t->parstochip[OUT_PH];
	pDph_t->delaypars[OUT_DU] = pDph_t->parstochip[OUT_DU];
#endif

#ifdef NEW_VTM
		pDph_t->delaypars[OUT_FNP] = pDph_t->parstochip[OUT_FNP];
		pDph_t->delaypars[OUT_GS] = pDph_t->parstochip[OUT_GS];
#endif
/* 
 *  add to asperation if there is sound ...
 */

#ifdef ENGLISH
	pDph_t->asperation += asp_bump;
#endif

}
/*********************************end of phclause.c**************************/

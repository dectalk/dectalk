/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:    ph_aloph.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  	Convert string of phonemes (with accent/boundary features) into
 *    integer allophone sequence with accent/boundary features
 *    Add features FHAT_RISE and FHAT_FALL where appropriate
 *    No phonetic insertions or deletions allowed after this module
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK		12/16/1984     	Initial creation
 * 0002 DGC		12/27/1984		Make version for 80186
 * 0003 DK		01/16/1984      Fix f0mode handling, fix flap rule
 * 0004 DK		01/29/1985		Minor fix to palatalization rule
 * 0005 DK		02/14/1985      [dh] -> [d$] (a dental stop) after [t,d,n]
 * 0006 DK		02/26/1985      Can't flap [t] in [nt] until after [n] dur computed
#ifdef ENGLISH_US               From phalloph.c
 * 0007 DK 		04/25/1985      [t#y] -> [C] only if [y] not primary stressed
 * 0008 DK		05/15/1985		Fix [t] -> [ch] rule, realization of "to", "into"
 * 0009 DK		05/28/1985      "For" not reduced before vowel or silence
 * 0010 DK		07/16/1985      Word-internal flapping only if post-stressed, not [nd]
 * 0011 DK 		08/08/1985		or if involve "weak" vowels [x,|,R,i]
 * 0012 DK		08/23/1985		Remove rule changing [yu] to [uw] after palatal
 * 0013 DK		08/28/1985		Correct rule 1b, require unstressed [fR]
 * 0014 MGS		03/25/1996		Merged WIN 95 code with 42c  
 * 0015 MGS		04/01/1996		Added MSDBBG blocks for debugging
 * 0016 MGS		04/02/1996		Initialized all local variables
#endif
#ifdef SPANISH              From sphallph.c
 * 0007 MM		04/02/1985		68000 hacks.
 * 0008 MM		05/02/1986		Added phonemic dump
 * 0009 DF		06/10/1986		DT3 updates: nbrphone -> nphonetot
#endif
#ifdef GERMAN               	From gphallph.c
 * 0014 BNK		07/22/1986		preliminary change to secondary stress, take
 *                      		tertiary stress into account
 *                      		ormal FSTRESS-masking only refers to S1, S2, SEMPH
 *                      		introduction of new phonemes
 * 0015 BNK		01/14/1987		german allophonic rules
 * 0016 CJL		03/30/1995		File was phalloph.c. Is now gphallph.c. Changed
 *                      		phdefs.h->gphdefs.h
 * 0017 JDB		08/02/1995  	merged with EAB's pre-beta changes...
#endif
 * 0017	MGS		05/31/1996		Merged Spanish with english
 * 0018 MGS		06/06/1996 		File name changed from ph_alloph.c to ph_aloph.c
 * 0019	MGS		06/17/1996		Merged German with English/Spanish
 * 0020 SIK		07/09/1996  	Cleaning up and maintenance
 * 0021 EDB		01/10/1997		change allop rule in EL/EM/EN area.
 * 0022 EDB		02/14/1997		fix Spanish early stress drop off.
 * 0023 EAB		03/25/1997		EAB unifiy phnemic codes dz df, BATS# 302
 * 0024	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 0025 DR		09/30/1997		UK BUILD: added UK STUFF
 * 0026 EAB		10/19/1997		use Cite_it variable and add syllable count support.
 * 0027 EAB		12/12/1997		fix many UKP_English code.with Carolines direction
 * 0028 EAB		01/22/1998		Modified UK to handle secondary stresses-this should eventually migrate to all
 *								languages PART OF BATS 574
 * 0029 EAB		12/17/1998		Fix BATS 459 vowel for unreduce and wrong....
 * 0030 EAB		04/27/1998		Modified behavior of various elements to process German better
 * 0031 EAB     07/08/1998		BATS 711 Changed feature bit array size to hold more feature bits.
 * 0032 EAB		09/11/1998		Improved Spanish rules
 * 0033 EAB		09/29/1998 		EAB removed wx semi-vowel for now research it but for now leave u in place
 * 0034 EAB 					Rules handle dipthong better without semi-vowels get rid of them 
 * 0035 EAB		01/12/1999		Revised t->flap rule 
 * 0036 EAB		02/02/1999 		Modified NWSNOAA to NWS_US for more languages for NOAA
 * 0036 EAB		02/02/1999		Unrevised flap rule needs more study because it breaks words
								bigot shouldn't flap but other words ending  in t should
								so when to and when not to that is the question
 * 0037 EAB		03/21/2000		Flap rule should be only after no-stress i.e. FTSRESS not FSTRESS_1
 * 0038 MGS		04/13/2000		Changes for integrated phoneme set 
 * 0039 EAB 	04/07/2000 		cleanup
 * 0040 EAB		06/28/2000		Unified Phoneme Set Changes
 * 0041 EAB		07/11/2000 		Delete is a privleage worrd so change to dodelete
 * 0042 NAL		06/12/2000		signed/unsigned mismatch (warning removal)
 * 0043	CHJ		07/20/2000		Added French. And removed unneccesary or to set the language bits when they
								were already set.
 * 0044 EAB		07/28/2000 		Conditional safety check used wrong pointer
 * 0045 CHJ 	07/28/2000		French feature bit modifications
 * 0046	CAB		09/21/2000		Fixed copyright info and formated and edited comment section.
 * 0047 CAB		10/19/2000		Removed this line from copyright section
 *								WINprintf ("to  %d \n", ((pDph_t->allodurs[endcnt] * NSAMP_FRAME) / 10));
 * 0048 EAB		12/12/2000 		Fixed cite_it bug in slowtalk with "to"
 * 0049 CAB		01/16/2001		Merged Michel Divay Changes for French
 * 0050 CAB		01/22/2001		1. Added #endif for french and moved fn prphonol()
 * 								2. Added comments to #if
 * 0051 CAB		01/25/2001		Double check this Michel comment out pDph_t->f0tar[pDph_t->nallotot] = curr_inf0;
 * 0052 EAB 	03/22/2001 		As part of bats 945 found citing problem which was causing confusion
 * 0053 EAB 	03/13/2001 		Add rule to change unstressed long vowels into short type
 * 0054	eab 	03/21/2001 		As a result of the MRT I decided to not flap in shorter uterrances with less
 *								context to improve intelligibility addresses bats 943
 */
/* #define MSDBG6 */
/* #define MSDBG7 */

/* #include "phdefs.h" */
/* #include "phinst.h" *//* MVP : new instance header file */

#include "ph_def.h"

/* #define DEBUGALLO 1 *//* debugiing eab */
/****************************************************************************/
/* MVP : The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                	*/
/* Input arrays:                                                           	*/
/* extern short *phonemes;     Integer represent of real phonemes          	*/
/* extern short *sentstruc;    Struct feats, (mod phone[],nphonetot)       	*/
/* extern short *user_durs;    Optional user-specified durations           	*/
/* extern short *user_f0;      Optional user-specified f0 commands         	*/
/* extern short nphonetot;     Number of input symbols                     	*/
/* extern short f0mode;        State variable controlling f0 strategy      	*/
/* extern short symbols[];                                                 	*/
/* int docitation;                                                         	*/
/* Output arrays:                                                       	*/
/* extern short allophons[];   Integer rep of phonetic string              	*/
/* extern short allofeats[];   Structural features                         	*/
/* extern short nallotot;      Number of phones in phonetic string         	*/
/****************************************************************************/

/* From PHROM.C                                                      */
//extern __inline short phone_feature(PDPH_T pDph_t, int phone);
	/* static short n,curr_outph,curr_outstruc; */
	/* static short curr_indur,curr_inf0;     */
	/* static short hatposition,emphasislock,stresses_in_phrase; */

	/* extern short remaining_stresses_til(short, short); */
	/* extern short promote_last_2(short); */
/* MVP added declaration of set_index_allo (defined in services.c)  */

#ifndef MSDOS
	extern void set_index_allo (PKSD_T pKsd_t, unsigned int nphone, unsigned int nallo);
#endif	// MSDOS

/* Static function declarations MVP */
static void make_out_phonol (LPTTS_HANDLE_T phTTS, short n,
							 short curr_outph, U32 curr_outstruc,
							 short curr_indur, short curr_inf0);
static short remaining_stresses_til (PDPH_T pDph_t, short msym, short b_type);
static short promote_last_2 (PDPH_T pDph_t, short msym);

#ifdef SPANISH
static short hphone[] =
{
	GEN_SIL,
	HAT_RISE,
	HAT_FALL,
	HAT_RF
};

static short sphone[] =
{
	GEN_SIL,
	S1,
	S2,
	SEMPH
};

#if 0
static short bphone[] =
{
	MBOUND,							   /* FMBNEXT      */
	WBOUND,							   /* FWBNEXT      */
	PPSTART,						   /* FPPNEXT      */
	VPSTART,						   /* FVPNEXT      */
	RELSTART,						   /* FRELNEXT     */
	COMMA,							   /* FCBNEXT      */
	PERIOD,							   /* FPERNEXT     */
	QUEST,							   /* FQUENEXT     */
	EXCLAIM							   /* FEXCLNEXT    */
}; //eab is this used anywhere
#endif	// 0

#endif // SPANISH

/*
 *      Function Name: phalloph()      
 *
 *  	Description: Generates allophones for phoneme code. 
 *					 Input symbols are taken from phonemes[],
 *					 output symbols are put in array allophons[].
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
// Beginning of French ======================================================

#ifdef FRENCH // French is too different to be merged now  Michel

void phalloph (LPTTS_HANDLE_T phTTS) {
  PKSD_T         pKsd_t = phTTS->pKernelShareData;
  PDPH_T         pDph_t = phTTS->pPHThreadData;

  long  Traits_Temp;
  short curr_indur   = 0;
  short curr_inf0    = 0; 
  short n;                    /* loop for */
  short Cons_Suite   = 0;     /* Nb of consonants in a row */
  short Syll_Mot     = 0;     /* Nb of syllables in the word */
  short Syll_Synt    = 0;     /* Nb of syllables in the clause */
  short Syll_Tot     = 0;     /* Nb of syllables in the sentence */
  short NbAcc        = 0;     /* Nb of stressed words in a row */

  char  IAp;                  /* Insert after */
  FLAG  Nouv_Val_Mot = FALSE; /* New word */
  short Pos_Deb      = 0;     /* Beginning of preceding word for Raise */
  short Pos_Deb_Mot  = -1;    /* Beginning of word to add the number of syllables */
  short Pos_Deb_Cons = 0;     /* First consonant position */
  short Pos_Deb_Synt = 0;     /* Beginning of the clause */
  short Pos_Dern_Acc = -1;    /* Last stressed word in the clause */
  FLAG  Mot_Accentue = FALSE; /* Stressed or not */

  short SegG3;                /* char. in the window */
  short SegG2;
  short SegGauche;
  short curr_inph = 0;
  short SegDroite;
  short SegD2;
  short SegD3;
  short a_SegG3;        /* char. features */
  short a_SegG2;
  short a_SegGauche;
  U32   curr_instruc = 0;
  short s_SegDroite;
  short s_SegD2;
  short s_SegD3;

  pDph_t->nallotot = 0;


  /* Main loop: for each input symbol, see if modify before pass to output */
  for (n = 0; n < pDph_t->nphonetot; n++) {

    /* init window */
    curr_inph    = pDph_t->phonemes [n];
    curr_instruc = pDph_t->sentstruc [n];
    pDph_t->sentstruc[n] = 0;

    if (pDph_t->nallotot-1 >= 0) {
      SegGauche   = pDph_t->allophons [pDph_t->nallotot-1];
      a_SegGauche = pDph_t->allofeats [pDph_t->nallotot-1];
    } else {
      SegGauche   = GEN_SIL;
      a_SegGauche = 0;
    }

    if (pDph_t->nallotot-2>=0) {
      SegG2       = pDph_t->allophons [pDph_t->nallotot-2];
      a_SegG2     = pDph_t->allofeats [pDph_t->nallotot-2];
    } else {
      SegG2       = GEN_SIL;
      a_SegG2     = 0;
    }

    if (pDph_t->nallotot-3>=0) {
      SegG3       = pDph_t->allophons [pDph_t->nallotot-3];
      a_SegG3     = pDph_t->allofeats [pDph_t->nallotot-3];
    } else {
      SegG3       = GEN_SIL;
      a_SegG3     = 0;
    }

    if (n+1 < pDph_t->nphonetot) {
      SegDroite   = pDph_t->phonemes [n+1];
      s_SegDroite = pDph_t->sentstruc [n+1];
    } else {
      SegDroite   = GEN_SIL;
      s_SegDroite = 0;
    }

    if (n+2 < pDph_t->nphonetot) {
      SegD2       = pDph_t->phonemes [n+2];
      s_SegD2     = pDph_t->sentstruc [n+2];
    } else {
      SegD2       = GEN_SIL;
      s_SegD2     = 0;
    }

    if (n+3 < pDph_t->nphonetot) {
      SegD3       = pDph_t->phonemes [n+3];
      s_SegD3     = pDph_t->sentstruc [n+3];
    } else {
      SegD3       = GEN_SIL;
      s_SegD3     = 0;
    }

    curr_indur = pDph_t->user_durs[n];     /* User-specified durations */
    pDph_t->user_durs[n] = 0;
    curr_inf0  = pDph_t->user_f0[n];       /* User-specified f0 commands */
    pDph_t->user_f0[n]   = 0;              /* that are locked to phones */

    if (curr_instruc & FMOT) { /* word or clause boundary */

      /* if last boundary was a FMOT, we just finished a word
         if last boundary was a FSYNT, do not add */
      if (Nouv_Val_Mot) {
        Nouv_Val_Mot  = FALSE;
        Syll_Synt    += Syll_Mot;
      }

      if ( Cons_Suite > 0  )  {  /* how many consonants in a row : aSTR */
        pDph_t->allofeats  [Pos_Deb_Cons] = (Cons_Suite & 0xF) << 12; 
        //pDph_t->fconsfeats  [Pos_Deb_Cons] = (Cons_Suite & 0xF) << 4;
        Cons_Suite = 0;
      }

      if (curr_instruc & ACCEN) {
        NbAcc += 1;
      } else {
        if (NbAcc > 1) pDph_t->allofeats [Pos_Deb] |= RAISE;
        NbAcc = 0;
      }
      Pos_Deb = pDph_t->nallotot;

      if (curr_instruc & FSYNT) {    /* clause boundary */
        pDph_t->allofeats[Pos_Deb_Synt] |= (Syll_Synt & 0xFFFF) << 8;
        //pDph_t->fconsfeats[Pos_Deb_Synt] |= Syll_Synt;

        /* FGROU at the end of a clause is suppressed */
        if (curr_instruc & FGROU) pDph_t->allofeats [Pos_Deb_Mot] &= 0xFFF7;
        /* chj removes the ACCEN bit from allofeats[Pos_Deb_Mot] */
        //pDph_t->allofeats[Pos_Deb_Mot] &= (0xFFFF ^ ACCEN);

        Syll_Tot     = Syll_Tot + Syll_Synt;
        Pos_Deb_Synt = pDph_t->nallotot;
        Syll_Synt    = 0;

      } else  { /* word boundary */
        Nouv_Val_Mot = TRUE;
        Pos_Deb_Mot  = pDph_t->nallotot;
        Mot_Accentue = (curr_instruc & ACCEN) >> 3;
        if (Mot_Accentue) Pos_Dern_Acc = pDph_t->nallotot;
        Syll_Mot     = 0;
      }
    } /* if word or clause boundary */


    /* Insert Aspiration if needed */
    IAp = 0;

    switch (curr_inph & PVALUE) {

    case F_B: case F_D: case F_G:
      /* du raB, ... */
      if (s_SegDroite & FSYNT) IAp = F_AP;
      break;

    case F_P: case F_T: case F_K:
      /* cèpe, sec. */
      if (s_SegDroite & FSYNT) IAp = F_AP;
      break;

    case F_L: case F_R: 
    case F_W: case F_WU: case F_Y:
    case F_M: case F_N:  case F_GN: case F_NG:
      if (s_SegDroite & FSYNT) {
        /* bar, ame */
        if ( phone_feature(pDph_t, SegGauche) & TSonore ) IAp = F_AP;
        /* e1nigme, rythme. */
        if ( phone_feature(pDph_t, SegGauche) & TOcclusive ) IAp = F_AP;
      } else if (s_SegDroite & FMOT) {
        Traits_Temp = phone_feature(pDph_t, SegGauche);
        if ( ( !(Traits_Temp & TVoisee) || Traits_Temp & TNasale )
          && !(phone_feature(pDph_t, SegDroite) & TVoyelle) ) {
          /* KOuPL DE ..., SAKR DE */
          IAp = F_AP;
        }
      }
      break;
    }  /* switch */


    switch (curr_inph & PVALUE) {

    case F_A:  case F_A3: case F_E2: case F_AN: case F_E:
    case F_AU: case F_E1: case F_EU: case F_I:  case F_IN:
    case F_O:  case F_O6: case F_ON: case F_OU: case F_U:
    case F_UN:
      Syll_Mot++; /* count the syllables */
      if ( Cons_Suite > 0 ) { /* How many consonants */
        pDph_t->allofeats [Pos_Deb_Cons] |= (Cons_Suite & 0xF) << 12;
        //pDph_t->fconsfeats[Pos_Deb_Cons] |= (Cons_Suite & 0xF) << 4;
        Cons_Suite = 0;  /* once for every serie of consonant */
      }
      break;

    case F_B:  case F_CH: case F_D: case F_F: case F_G:
    case F_GN: case F_J:  case F_K: case F_L: case F_M:
    case F_N:  case F_NG: case F_P: case F_R: case F_RX:
    case F_S:  case F_T:  case F_V: case F_W: case F_WU:
    case F_Y:  case F_Z:
      if (Cons_Suite == 0) Pos_Deb_Cons = pDph_t->nallotot; /* new serie */
      Cons_Suite++;
      break;

    }  /* switch */


    /*?? some of this is redundant, the language bits should already be set right */
    if ((curr_inph & PVALUE) != SIL) 
      make_out_phonol (phTTS, n, (short)((PFFR<<8) | curr_inph), curr_instruc, curr_indur, curr_inf0);
    else if ((curr_inph & PVALUE) == SIL)
      make_out_phonol (phTTS, n, GEN_SIL, curr_instruc, curr_indur, curr_inf0);

    if (IAp != 0) { // we add the AP phoneme
      make_out_phonol (phTTS, n, (short)((PFFR<<8) | IAp), 0, 0, 0);
    }

  } /* for (n = 0; n < pDph_t->nphonetot; n++) */


  /* 18/08/94 we have added a new phoneme; keep duration and f0 for the right phoneme */
  /*  for (i=pDph_t->nallotot; i>=0; i--) {
    pDph_t->user_durs[i] = pDph_t->allodurs [i];
    pDph_t->user_f0[i] = pDph_t->f0tar[i];
  }
  */

  pDph_t->NbSyllabes = Syll_Tot; 
  pDph_t->allofeats [Pos_Dern_Acc] |= DERACC; /* last stressed word */

  /* Zap last position in array */
  pDph_t->allophons [pDph_t->nallotot] = GEN_SIL;
  pDph_t->allofeats [pDph_t->nallotot] = 0;

} // phalloph for French

// End of French ======================================================
#else
void phalloph (LPTTS_HANDLE_T phTTS)
{
	short                   curr_inph = 0;
	U32						curr_instruc = 0;
	short                   next_inph = 0, last_outph = 0;
	int                     ph_delcnt = 0;
	short					dodelete = 0, tmp=0;
	short                   n, curr_outph = 0; 
	U32						curr_outstruc = 0;
	short					curr_indur = 0, curr_inf0 = 0;	/* MVP made local */
	short                   hatposition = 0, emphasislock = 0, stresses_in_phrase = 0;
	short					offset = 0, temp = 0;       
	short					doitlater=0;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

#ifdef ENGLISH
	short					symlas = 0;
	short					sylcount;
	short					Cite_It;
#endif

  	short          count=0;

#if defined (GERMAN) || defined (SPANISH) 
	short					m;
#endif

	/* Main loop: for each input symbol, see if modify before pass to output */
	pDph_t->nallotot = 0;
	dodelete = FALSE;
	hatposition = AT_BOTTOM_OF_HAT;	   /* Must be reset because */
	emphasislock = FALSE;			   /* of possibility of an */
	stresses_in_phrase = 0;			   /* emergency halt.      */
	curr_inf0 = 0;
	last_outph = GEN_SIL;

#ifdef ENGLISH	// ENGLISH (1)
	if (pDph_t->nphonetot >= 10)
	{
		pDph_t->docitation = 0;		   /* phrase is too long for citing */
	}
	else 
		pDph_t->docitation =1; //force it to unreduce in short phrases eab 3/21/00
	Cite_It= 0;
	/* EAB 10/7/97 Changed the claculation od cit-it becuase it only needs to be calculated
	once per phrase and it was being calculated many times for each phoneme also wanted to modify
	it's setting for slowtalk*/

	if((pKsd_t->modeflag & MODE_CITATION) && pDph_t->docitation)
			Cite_It = 1;

		if (pKsd_t->sprate < 100)
			Cite_It=TRUE;


#ifdef ENGLISH
	sylcount=0;
#endif	// ENGLISH 
	
#endif	// ENGLISH (1)
	
	/* Main loop: for each input symbol, see if modify before pass to output */
	for (n = 0; n < pDph_t->nphonetot; n++)
	{
#ifdef ENGLISH
	if( (pDph_t->sentstruc[n] & FFIRSTSYL )IS_PLUS )
		sylcount=1;
	else if((phone_feature(pDph_t, pDph_t->phonemes[n]) & FSYLL) IS_PLUS)
		sylcount++;
#endif	// ENGLISH
		
#ifdef GERMAN_OUT
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* by default, don't insert any phonemes              					  */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		pDph_t->curr_insph = -1;
#endif	// GREMAN_OUT
		/* 
		 * Input symbols are taken from phonemes[], and this array is never    
		 * changed.  Variables that refer to aspects of the input arrary are:  
		 */

		curr_inph = pDph_t->phonemes[n];

#ifdef DEBUGALLO
		printf ("input phonenme to alloph is %d", curr_inph);
#endif	// DEBUGALLO
		curr_instruc = pDph_t->sentstruc[n];
		if (n < pDph_t->nphonetot - 1)       
		{
			next_inph = pDph_t->phonemes[n + 1];
		}
		else
		{
			next_inph = GEN_SIL;
		}
		/* printf(" cur=%d ,nx = %d tot= %d \n ",curr_inph,next_inph,pDph_t->nphonetot); */

		/* 
		 * Output symbols are put in array allophons[].  Variables that refer   
		 * to this array are:                                                  
		 */

		curr_outph = curr_inph;
		curr_outstruc = curr_instruc;
		if (n > 0)
		{
			last_outph = pDph_t->allophons[pDph_t->nallotot - 1];
		}

		/* 
		 * Deal carefully with user specified durations or f0-commands because  
		 * input symbols may be deleted or combined.                           
		 */

#if defined (ENGLISH) || defined (GERMAN)
		curr_indur = pDph_t->user_durs[n];	/* User-specified durations */
		pDph_t->user_durs[n] = 0;
#endif	// defined (ENGLISH) || defined (GERMAN)

#ifdef SPANISH
		curr_indur = pDph_t->user_durs[n+offset];	/* User-specified durations */
		pDph_t->user_durs[n+offset] = 0;
#endif	// SPANISH

		if (pDph_t->f0mode != HAT_F0_SIZES_SPECIFIED)
		{
			curr_inf0 = pDph_t->user_f0[n];		/* User-specified f0 commands */
			pDph_t->user_f0[n] = 0;	   /* that are locked to phones */
		}

		/* Skip allophone rules if current phoneme has feature +FBLOCK */
		if ((curr_instruc & FBLOCK) != 0)
		{
			goto skiprules;
		}
		if ((curr_instruc & FSTRESS) IS_MINUS)
		{//reduce unstress long vowels into short
			
			
			switch (curr_inph)
			{
			case GRP_UH:
				curr_outph  = GRP_U1;
				break;
			case GRP_OH:
				curr_outph  = GRP_O1;
				break;
			case GRP_UEH:
				curr_outph  = GRP_Y1;
				break;
			case GRP_EH:
				curr_outph  = GRP_E1;
			default:
				break;
			}
		}





		/* eab second half of delaying rule 12/95 eab 
		 imporved 4/27/98 */
		if ( doitlater && (phone_feature(pDph_t,curr_inph) & FSYLL) IS_PLUS)
		{
			count--;
			if (((pDph_t->nphonetot - n) < 4 && count ==1) || count == 0)
			{
				curr_outstruc |= FHAT_ENDS;
				hatposition = AT_BOTTOM_OF_HAT;
				stresses_in_phrase = 0;
				doitlater = 0;
			}
		}
		

		switch (last_outph)
		{
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* make transition from I, IH into vowel more clear     				  */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* eab 9/95 new rule from sonia ch after a/o/u/au is changed to a kh */
		case GRP_A:
		case GRP_O:
		case GRP_U:
		case GRP_AU:
		case GRP_OH:
			if (curr_outph == GRP_CH)
			{
				curr_outph = GRP_KH;
			}
			break;


		}
		/* switch */

		switch (curr_inph)
		{
		case GRP_R:
#ifdef GERMAN
		case USP_R:
#endif
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* use /RR/ instead of /R/ before syllabic and eab 5/12/98 need to remove   
			   insertion of RR before glottal stop at a word boundary                 */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */


		
			if((phone_feature(pDph_t,next_inph) & FSYLL) IS_PLUS)   
			{
				curr_outph = GRP_RR;
			}
			break;

		case GRP_L:
		case GRP_M:
		case GRP_N:
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* use syllabic for /EL/, /EM/, /EN/ at high speaking rates      */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

			if ((curr_instruc & (FSTRESS | FWINITC)) IS_PLUS )
			{
				break;
			}
			if (pDph_t->phonemes[n - 1] == GRP_EX && 
				phone_feature(pDph_t,pDph_t->phonemes[n - 2]) & FNASAL IS_MINUS)
			{
				switch (curr_inph)
				{


				case GRP_L:
								
						pDph_t->allophons[pDph_t->nallotot - 1] = GRP_EL;
						dodelete = TRUE;
					
					break;



				case GRP_M:
									
						pDph_t->allophons[pDph_t->nallotot - 1] = GRP_EM;
						dodelete = TRUE;
					
					break;
				case GRP_N:
						pDph_t->allophons[pDph_t->nallotot - 1] = GRP_EN;
						dodelete = TRUE;
					
					break;
				}					   /* switch */

			}						   /* if last one was EX */
			break;
		}							   /* switch */


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
/* Morpho-phonemic Rules: (Most have already been applied)   */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

#ifdef GERMAN
	if(curr_inph == GRP_T &&
		pDph_t->phonemes[n +1] == GRP_S)
	{
		pDph_t->phonemes[n + 1] = GRP_TS;
			dodelete = TRUE;
	}
#endif	

#ifdef ENGLISH_US	// ENGLISH_US (1)
		/* Rule 1a: The word "the" should be /dh iy/ before a syllabic */
		//eab 7/28/00 Nphonetot is the total numb of phones but array start at
		//zero so index size is -1 and if we're check for following phone(+1)
		//then we must have index of n+1 < nhonetot
		if(n>0 && ((n+1) < (pDph_t->nphonetot)))
		{
			if (((phone_feature(pDph_t,pDph_t->phonemes[n + 1]) & FSYLL) IS_PLUS)
			&& (curr_inph == USP_AX)
			&& ((curr_instruc & FBOUNDARY) IS_PLUS)
			&& (pDph_t->phonemes[n - 1] == USP_DH)
			&& ((pDph_t->sentstruc[n - 1] & FWINITC) IS_PLUS)
			)
			{
			curr_outph = USP_IY;
			}
		}
		/* rule 1c make a long a be ah */
/*		Cite_It= 0;

		if((pKsd_t->modeflag & MODE_CITATION) && pDph_t->docitation)to go fro
			Cite_It = 1;  */

		if ((curr_inph == USP_AX) && (next_inph == GEN_SIL)
			&& n == 1 && (Cite_It) )
		{
			curr_outph = USP_EY;
		}
//#ifndef NWS_US
		/* Rule 1b:  Unreduce vowel in "for" if following segment is vowel or sil */
		if ((curr_inph == USP_F) && (next_inph == USP_RR)
			&& ((((pDph_t->sentstruc[n + 1] & FSTRESS) IS_MINUS) && ((pDph_t->sentstruc[n +1 ] & FTYPESYL) == FMONOSYL))
				|| Cite_It))
		{
			if (((phone_feature(pDph_t,pDph_t->phonemes[n + 2]) & FSYLL) IS_PLUS)
				|| (pDph_t->phonemes[n + 2] == GEN_SIL))
			{
				pDph_t->phonemes[n + 1] = USP_OR;
				next_inph = USP_OR;
#ifdef DEBUGALLO
				printf ("for rr->or rule firing");
#endif	// DEBUGALLO
			}
		}
//#else /*NWS_US*/
//		/* eab 10/15/97 */
//		if ((curr_inph == F) && (next_inph == RR))
//			if (((pDph_t->sentstruc[n +1 ] & 030/*FTYPESYL*/) == 00 /*FMONOSYL*/))
//			//	|| Cite_It))
//		{
//				pDph_t->phonemes[n + 1] = OR;
//				next_inph = OR;
//			
//		}
//#endif /*NWS_US*/
		/* Rule 1c:  Unreduce vowel in clause-initial "and" to be [ae] */
		/* BATS 459 vowel for unreduce and wrong.... note-comment above was correct who changed it and why
		(it wasn't me) EAB 3/17/98*/

		if ((curr_inph == GEN_SIL)
			&& (pDph_t->phonemes[n + 1] == USP_AE)
			&& (pDph_t->phonemes[n + 2] == USP_N)
			&& (pDph_t->phonemes[n + 3] == USP_D)
			&& ((((pDph_t->sentstruc[n + 1] & FSTRESS) IS_MINUS) && ((pDph_t->sentstruc[n + 3] & FSTRESS) IS_MINUS))
				|| Cite_It))
		{
#ifdef DEBUGALLO
			printf ("and eh->ae rule firing");
#endif	// DEBUGALLO
			pDph_t->phonemes[n + 1] = USP_AE;
			next_inph = USP_AE;
		}

		/* Rule 1d:  Unreduce vowel in "to,into" if next segment is vowel or sil */
		/* [See code below involving flapping rule] */

		/* Rule 1c:  Unreduce vowel in citation mode for  "at" to be [ae] */
		if ((curr_inph == GEN_SIL) && (pDph_t->phonemes[n + 1] == USP_EH) && (pDph_t->phonemes[n + 2] == USP_T)
			&& Cite_It )
		{

#ifdef DEBUGALLO
			printf ("at eh->ae rule firing");
#endif	// DEBUGALLO
				
			pDph_t->phonemes[n + 1] = USP_AE;
			next_inph = USP_AE;
		}

		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
		/* Phonological rules I:                                     	   */
		/* (rules involving glottal attack are in PHDRAWT0.C)      		   */
		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

		/* Rule 2: Postvocalic allophones of /R/ and /LL/ are special */

		if (((curr_instruc & (FSTRESS | FWINITC)) IS_MINUS) && n>0
			&& ((phone_feature(pDph_t,pDph_t->phonemes[n - 1]) & FVOWEL) IS_PLUS))
		{
			if (curr_inph == USP_LL)
				curr_outph = USP_LX;

			/* See if one of the special vowel + R combinations */
			/* if so, replace last output symbol and discard input symbol */
			if (curr_inph == USP_R)
			{
				curr_outph =USP_RX;
				symlas = pDph_t->phonemes[n - 1];
				if (symlas == USP_AX)
				{
					pDph_t->allophons[pDph_t->nallotot - 1] = USP_RR;
					dodelete = TRUE;
				}

				if ((symlas == USP_IY) || (symlas == USP_IH))
				{
					pDph_t->allophons[pDph_t->nallotot - 1] = USP_IR;
					dodelete = TRUE;
				}

				if ((symlas == USP_EY)
					|| (symlas == USP_EH) || (symlas == USP_AE))
				{
					pDph_t->allophons[pDph_t->nallotot - 1] = USP_ER;
					dodelete = TRUE;
				}

				if ((symlas == USP_AA) || (symlas == USP_AH))
				{
					pDph_t->allophons[pDph_t->nallotot - 1] = USP_AR;
					dodelete = TRUE;
				}

				if ((symlas == USP_OW) || (symlas == USP_AO))
				{
					pDph_t->allophons[pDph_t->nallotot - 1] = USP_OR;
					dodelete = TRUE;
				}

				if ((symlas == USP_UW) || (symlas == USP_UH))
				{
					pDph_t->allophons[pDph_t->nallotot - 1] = USP_UR;
					dodelete = TRUE;
				}
			}
		}

		/* Rule 3: Select appropriate allophones for unstressed /t/ and /d/ */

		/* Palatalize /t/ or /d/ if next phoneme is unstressed /y/ */
		if (((next_inph == USP_YU) || (next_inph == USP_Y))
			&& ((pDph_t->sentstruc[n + 1] & FSTRESS) IS_MINUS))
		{
			if (curr_inph == USP_T)
			{
				curr_outph = USP_CH;
				goto endrul3;
			}
			if (curr_inph == USP_D)
			{
				curr_outph = USP_JH;
				goto endrul3;
			}
		}



		/* 
		 * Rule to correct mis-transcriptions of e.g. "chew" as [chyu] 
		 * OUT 23-Aug-85 because applied inappropriately to "average users" 
		 * if ((last_outph == CH) || (last_outph == JH)) { if (curr_inph == Y) delete = 
 		 * TRUE; if (curr_inph == YU) curr_outph = UW; } END OUT 
 		 */

		/* Glottalize word-final /t/ before a word-init sonor cons or /dh/ */

		if (curr_inph == USP_T)
		{
			if ((next_inph == USP_LL) || (next_inph == USP_DH)
				|| ((((curr_instruc & FBOUNDARY) >= FMBNEXT)
					 && (((phone_feature(pDph_t, next_inph) & FSON2) IS_PLUS)
						 || (next_inph == USP_HX)))
					|| (next_inph == USP_EN)))
			{
				curr_outph = USP_D;
				if ((phone_feature(pDph_t,last_outph) & FSON1) IS_PLUS)
				{
					curr_outph = USP_TX;
				}
				goto endrul3;
			}
				/* Unreduce the O in "to" if following segment is a vowel */
#ifndef NWS_US
			if((next_inph == USP_UH) && Cite_It)
				pDph_t->phonemes[n + 1] = USP_UW;
			if (next_inph == USP_UH)
			{
				pDph_t->phonemes[n + 1] = USP_UW;	
			}
#endif	// NWS_US

			if ((next_inph == USP_UH) &&
				(((curr_instruc & FSTRESS) IS_MINUS)))
				
			{
				if (((phone_feature(pDph_t,pDph_t->phonemes[n + 2]) & FSYLL) IS_PLUS) ||
					(pDph_t->phonemes[n + 2] == SIL) ||
					Cite_It)
				{
					pDph_t->phonemes[n + 1] = USP_UW;
				}
			
				/* And flap the initial /t/ of 'to' if preceeding syllabic */
				else if ((Cite_It) == 0 && ((phone_feature(pDph_t,last_outph) & FSYLL) IS_PLUS)
						 && ((phone_feature(pDph_t,last_outph) & FNASAL) IS_MINUS))
				{
#ifndef NWS_US
					curr_outph = USP_DF;
					goto endrul3;
#endif	// NWS_US
				}
			}
		}
#ifndef NWS_US
		/* Flapping rule:  for non-stressed /t/ and /d/ */
		/* (can't flap [t] in [nt] until after durs computed) */
		//Flap rule should be only after no-stress i.e. FTSRESS not FSTRESS_1 eab 3/21/00
		if (((curr_inph == USP_D) || (curr_inph == USP_T))
			&& ((curr_instruc & FSTRESS) IS_MINUS)
			 && pDph_t->nallotot > 11)
		{
			/* Consonant must be preceded by vowel,rx,en,G,el */
			if (((phone_feature(pDph_t,last_outph) & FSON1) IS_PLUS)
				&& (last_outph != USP_M)
				&& (last_outph != USP_NX)
				&& (last_outph != USP_N)
				/* And followed by a syllabic */
				&& ((phone_feature(pDph_t,next_inph) & FSYLL) IS_PLUS))
			{
				/* Flap if consonant is word-final */
				
				if ((curr_instruc & FBOUNDARY) >= FMBNEXT)
				{

					if(curr_inph == USP_T)
					{
						curr_outph = USP_DF;

					}
					else
						curr_outph = USP_DX;

				}

				/* Flap word-initial /t,d/ if next vowel is reduced */
				 else if ((curr_instruc & FWINITC) IS_PLUS)
				{
					if ((next_inph == USP_AX) || (next_inph == USP_IX))
					{
						if (curr_inph == USP_T)
						{
							curr_outph = USP_DF;

						}
						else
							curr_outph = USP_DX;

					}
				}
				/* 
 				 * Flap if [t,d] is word-internal and 
 				 * (1) next vowel is "weak", or 
 				 * (2) previous vowel stressed and next vowel is
 				 * [ow] 
 				 */
			 else if((((pDph_t->allofeats[pDph_t->nallotot - 1] & FSTRESS) IS_PLUS)
						  && (next_inph == USP_OW))
						 || (next_inph == USP_AX)
						 || (next_inph == USP_RR)
						 || (next_inph == USP_IY)
						 || (next_inph == USP_IX)
						 || (next_inph == USP_EL))
				{
					if (curr_inph == USP_T)
					{
						curr_outph = USP_DF;

					}
					else
						curr_outph = USP_DX;

				}

				/* 
				 *  HISTORY of the flap rule:  It used to work well without the prior stress 
				 *  alternative, except for words with a [ow] following the [t]. 
				 *  It is my hunch that the safest course at this late date is to go back 
				 *  to the requirement that the next vowel be [ow] when triggering the 
				 *  rule by a prior stress. (Problem words: 
				 *   "photo, tomato, potato, monotone, protest, detail, detour, pretense" 
 			     */
			} /* if (((phone_feature(pDph_t,[last_outph] & FSON1) IS_PLUS) */
		} /* if (((curr_inph == D) || (curr_inph == T)) */
#endif /* NWS_US */
		/* Rule 4: Unstressed [dh] becomes dental stop after [t,d], nasal after [n] */

		if ((curr_inph == USP_DH)
			&& ((curr_instruc & FSTRESS) IS_MINUS))
		{
			if ((last_outph == USP_T)
				|| (last_outph == USP_TX)
				|| (last_outph == USP_D))
			{
				curr_outph = USP_DZ;
			}
			if (last_outph == USP_N)
			{
				curr_outph = USP_N;
			}
		}

#ifdef  NEVER_USED
		/* Rule 5: Delete unstressed [hx] between two voiced segments */

		if ((curr_inph == HX)
			&& ((phone_feature(pDph_t,[last_outph] & FVOICD) IS_PLUS)
			&& ((curr_instruc & FSTRESS) IS_MINUS))
		{
			dodelete = TRUE;
		}
		/* eab latin mode rule */
		if ((pKsd_t->modeflag & MODE_LATIN) && (curr_inph == TH))
			curr_inph = E_S;
#endif	// NEVER_USED

		/* Rule 6: Determine locations of hat pattern rises and falls */
#endif	/* ENGLISH_US (1) */
		
#ifdef ENGLISH_UK
	if (n > 0 && n < (pDph_t->nphonetot-1))
	{
		/* Rule 1a: The word "the" should be /dh iy/ before a syllabic */
		if (((phone_feature(pDph_t,pDph_t->phonemes[n + 1]) & FSYLL) IS_PLUS)
			&& (curr_inph == UKP_AX)
			&& ((curr_instruc & FBOUNDARY) IS_PLUS)
			&& (pDph_t->phonemes[n - 1] == UKP_DH)
			&& ((pDph_t->sentstruc[n - 1] & FWINITC) IS_PLUS))
		{
			curr_outph = UKP_IY;
		}
		/* rule 1c make a long a be ah */
		Cite_It= 0;
		Cite_It = ((pKsd_t->modeflag & MODE_CITATION) && pDph_t->docitation);
		if (pKsd_t->sprate < 100)
			Cite_It=TRUE;
		if ((curr_inph == UKP_AX) && (next_inph == GEN_SIL)
			&& n == 1 && (Cite_It) )
		{
			curr_outph = UKP_EY;
		}

		/* Rule 1b:  Unreduce vowel in "for" if following segment is vowel or sil */

		if ((curr_inph == UKP_F) && (next_inph == UKP_AX)
			&& ((((pDph_t->sentstruc[n + 1] & FSTRESS) IS_MINUS) && ((pDph_t->sentstruc[n + 1] & FTYPESYL) == FMONOSYL))
				|| Cite_It))
		{
			if (((phone_feature(pDph_t,pDph_t->phonemes[n + 2]) & FSYLL) IS_PLUS)
				|| (pDph_t->phonemes[n + 2] == GEN_SIL))
			{
				pDph_t->phonemes[n + 1] = UKP_AO;
				next_inph = UKP_AO;

#ifdef DEBUGALLO
				printf ("for rr->or rule firing");
#endif	// DEBUGALLO

			}
		}
	} //if 0 < n <pDph_t->nphonetot
		/* Rule 1c:  Reduce vowel in clause-initial "and" to be  */

		if (curr_inph == GEN_SIL)
		
			if(pDph_t->phonemes[n + 1] == UKP_AX)
			if (pDph_t->phonemes[n + 2] == UKP_N)
			if (pDph_t->phonemes[n + 3] == UKP_D)
			if ((((pDph_t->sentstruc[n + 1] & FSTRESS) IS_MINUS) && ((pDph_t->sentstruc[n + 3] & FSTRESS) IS_MINUS))
				|| Cite_It)
			{

#ifdef DEBUGALLO
			printf ("and eh->ae rule firing");
#endif	// DEBUGALLO

			pDph_t->phonemes[n + 1] = UKP_AE;
			next_inph = UKP_AE;
		}

		/* Rule 1d:  Unreduce vowel in "to,into" if next segment is vowel or sil */
		//BATS 963 chnage to american version of to variant rduction for now
	if ((curr_inph == UKP_T) && (next_inph == UKP_UH)
			&& ((((pDph_t->sentstruc[n + 1] & FSTRESS) IS_MINUS) && ((pDph_t->sentstruc[n + 1] & FTYPESYL) == FMONOSYL))
				|| Cite_It))
		{
			if (((phone_feature(pDph_t,pDph_t->phonemes[n + 2]) & FSYLL) IS_PLUS)
				|| (pDph_t->phonemes[n + 2] == GEN_SIL))
			{
				pDph_t->phonemes[n + 1] = UKP_UW;
				next_inph = UKP_UW;

			}
		}

		/* Rule 1c:  Unreduce vowel in citation mode for  "at" to be [ae] */
		if((curr_inph == GEN_SIL) && (pDph_t->phonemes[n + 1] == UKP_AX) && (pDph_t->phonemes[n + 2] == UKP_T)
			&& Cite_It )
		{

#ifdef DEBUGALLO
			printf ("at eh->ae rule firing");
#endif	// DEBUGALLO

			pDph_t->phonemes[n + 1] = UKP_AE;
			next_inph = UKP_AE;
		}

		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
		/* Phonological rules I:                                     	   */
		/* (rules involving glottal attack are in PHDRAWT0.C)      		   */
		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

		/* Rule 2: Postvocalic allophones of /R/ and /LL/ are special */
	if(n > 0)
	{
		if (((curr_instruc & (FSTRESS | FWINITC)) IS_MINUS)
			&& ((phone_feature(pDph_t,pDph_t->phonemes[n - 1]) & FVOWEL) IS_PLUS))
		{
			if (curr_inph == UKP_LL)
				curr_outph = UKP_LX;

		}
	}

		/* Rule 3: Select appropriate allophones for unstressed /t/ and /d/ */

		/* Palatalize /t/ or /d/ if next phoneme is unstressed /y/ */
		if (((next_inph == UKP_YU) || (next_inph == UKP_Y))
			&& ((pDph_t->sentstruc[n + 1] & FSTRESS) IS_MINUS))
		{
			if (curr_inph == UKP_T)
			{
				curr_outph = UKP_CH;
				goto endrul3;
			}
			if (curr_inph == UKP_D)
			{
				curr_outph = UKP_JH;
				goto endrul3;
			}
		}
		/* 
		 * Rule to correct mis-transcriptions of e.g. "chew" as [chyu] 
		 * OUT 23-Aug-85 because applied inappropriately to "average users" 
		 * if ((last_outph == CH) || (last_outph == JH)) { if (curr_inph == Y) delete = 
 		 * TRUE; if (curr_inph == YU)    curr_outph = UW; } END OUT 
 		 */

		/* Glottalize word-final /t/ before a word-init sonor cons or /dh/ */
		/* eab 11/21/97 modified per caroline so that tx only occurs before
		the nasal en and ll ditto for d->dz but it needs to be added harden leaden*/
		if (curr_inph == UKP_T )
		{
			if ((next_inph == UKP_EL) 
				&& ((((curr_instruc & FBOUNDARY) >= FMBNEXT)
					 && (((phone_feature(pDph_t,next_inph) & FSON2) IS_PLUS)))
					|| (next_inph == UKP_EN)))
			{
				
				if ((phone_feature(pDph_t,last_outph & FSON1) IS_PLUS))
					curr_outph = UKP_TX;
				
				goto endrul3;
			}
			/* Unreduce the O in "to" if following segment is a vowel */
#ifndef NWS_US /* Leave in as it may change from noaa to announce_mode*/
			if((next_inph == UKP_UH) && Cite_It)
				pDph_t->phonemes[n + 1] = UKP_UW;
#else
			if(next_inph == USP_UH)
				pDph_t->phonemes[n + 1] = UKP_UW;
#endif	// NWS_US
			if ((next_inph == UKP_UH) &&
				((curr_instruc & FSTRESS) IS_MINUS))
			{
				if (((phone_feature(pDph_t,pDph_t->phonemes[n + 2]) & FSYLL) IS_PLUS) ||
					(pDph_t->phonemes[n + 2] == GEN_SIL))
				{
					pDph_t->phonemes[n + 1] = UKP_UW;
				}
				
#ifndef NWS_US
					curr_outph = UKP_DF;
					goto endrul3;
#endif	// NWS_US
				
			}
		}

		/* Rule 4: Unstressed [dh] becomes dental stop after [t,d], nasal after [n] */

		if ((curr_inph == UKP_DH)
			&& ((curr_instruc & FSTRESS) IS_MINUS))
		{
			if ((last_outph == UKP_T)
				|| (last_outph == UKP_TX)
				|| (last_outph == UKP_D))
			{
				curr_outph = UKP_DZ;
			}
			if (last_outph == UKP_N)
			{
				curr_outph = UKP_N;
			}
		}

#ifdef NEVER
		/* Rule 5: Delete unstressed [hx] between two voiced segments */

		if ((curr_inph == HX)
			&& ((phone_feature(pDph_t,[last_outph] & FVOICD) IS_PLUS)
			&& ((curr_instruc & FSTRESS) IS_MINUS))
		{
			dodelete = TRUE;
		}
		/* eab latin mode rule */
		


#endif	// NEVER
#endif /*ENGLISH_UK*/

#ifdef ENGLISH

	endrul3:
#endif /* ENGLISH */
		
		/* Rule 6: Determine locations of hat pattern rises and falls */
	
#ifdef SPANISH_SP
		if ((pKsd_t->modeflag & MODE_LATIN) && curr_inph == SPP_TH)
		{
			curr_outph = SPP_S;
		}

		/* Rule 1: Remove geminates and combine dipthongs.   
		Here just check that we have a vowel contendor for dipth */
		if ((phone_feature(pDph_t,curr_inph) & (FVOWEL | FSEMIV)) IS_MINUS
			/*|| (phone_feature(pDph_t,[last_outph] & (FVOWEL | FSEMIV)) IS_MINUS*/)
			goto nodipth;			   /* Can't be a dipthong          */
		else if ((curr_instruc & FSBOUND) IS_PLUS)
		{
			goto nodipth;
		}
		else if (curr_inph == last_outph)
		{
		}

		/* 
		 * The test for [nallotot-2] is to properly position
		 * the dipthong in phrases such as "uno u otro"->['uno wx'otro]
		 EAb 10/29/98 Doesn't check that preceding phoneme was a vowel causing
		 inappropriate changes But since the rules seem to handle the shortening and combination
		 by thems selves the semi-vowel seems to cause more trouble than it's worth it will be verified
		 by Juan it was already removed from another place in the code 
		 */
		else if ((curr_outstruc & FSTRESS) IS_PLUS
				 && (pDph_t->allofeats[pDph_t->nallotot - 1] & FBOUNDARY) >= FWBNEXT
				 && (pDph_t->allofeats[pDph_t->nallotot - 2] & FBOUNDARY) < FWBNEXT)
		{
		}
#ifdef SPANISH_OUT
		else if ((pDph_t->allofeats[pDph_t->nallotot - 1] & FSTRESS) IS_MINUS)
			if(/*
				 &&*/ (phone_feature(pDph_t,[last_outph] & FDIPTH) IS_PLUS)
		{
			/* 
			 * rising dipthong (semivowel-vowel): i a -> yx a, etc.
			 */
			switch (last_outph)
			{
			case E_I:
				last_outph = E_YX;
				break;
			case E_U:
				break;
				//last_outph = E_WX; 
				//let's try not using this semovowel and just use the vowel per JUAN
				//	eab sep 28,1998
				break;
			default:
				goto nodipth;
			}
			pDph_t->allophons[pDph_t->nallotot - 1] = last_outph;
			pDph_t->allofeats[pDph_t->nallotot - 1] &= ~FBOUNDARY;
		}
#endif	// SPANISH_OUT

#ifdef SPANISH_OUT
		else if ((curr_outstruc & FSTRESS) IS_MINUS
				 && (phone_feature(pDph_t,[curr_inph] & FDIPTH) IS_PLUS)
		{
			/* 
			 * First, check whether we should defer dipthongization
			 * to the following segment: "uno u otro" -> ['uno wx'otro]
			 */
			if ((phone_feature(pDph_t,[next_inph] & (FVOWEL | FDIPTH)) == FVOWEL
				&& (pDph_t->sentstruc[n + 1] & FSBOUND) IS_MINUS)
			{
				goto nodipth;
			}
			/* 
			 * Falling dipthong (vowel-semivowel): ou -> owx
			 */
			switch (curr_inph)
			{
			case E_I:
				curr_outph = E_YX;
				break;
			case E_U:
				//last_outph = E_WX; 
				//let's try not using this semovowel and just use the vowel per JUAN
				//	eab sep 28,1998
				//curr_outph = E_WX;
				break;
			default:
				goto nodipth;
			}
			/* allofeats[nallotot-1] &= ~FBOUNDARY; */
		}							   /* geminate/dipthong    */
#endif	// SPANISH_OUT

	  nodipth:;

#endif 	/* #ifdef SPANISH_SP */  	

	  	if (curr_inph == GEN_SIL)
		{
			emphasislock = FALSE;
		}

		/* Locate a stressed syllabic */
#ifdef GERMAN
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* masking with FSTRESS and FSTRESS_2 also takes S3 into account  		  */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
#endif	// GERMAN

		if ((pDph_t->f0mode == NORMAL)
			&& ((phone_feature(pDph_t,curr_inph)& FSYLL) IS_PLUS)
			&& ((curr_instruc & FSTRESS) IS_PLUS)	/* 1-str 2-str emph */  /* S1 S2 S3 SENPH in GERMAN */
			&& (emphasislock == FALSE))
		{

			/* Rise occurs on first stress of any type in phrase */
			/* (If curr stress is not a primary stress, routine  */
			/* checks if there will be a primary stress to fall on later) */

			if ((hatposition != AT_TOP_OF_HAT)
				&& ((curr_instruc & FSTRESS)
					|| (remaining_stresses_til (pDph_t, n, FCBNEXT) > 0)))

			{

				curr_outstruc |= FHAT_BEGINS;

				hatposition = AT_TOP_OF_HAT;
			}

			/* Count number of primary stresses */
			if ((curr_instruc & FSTRESS) IS_PLUS)
			{
				stresses_in_phrase++;
			}

			/*
			 * Fall occurs 
			 * 	(1) on any emphasized syll, 
			 *  (2) on last 1 stress of clause, 
			 *  (3) on last 1 stress of phrase containing 2 or more stresses 
			 *  followed by phrase with 2 or more stresses 
			 */
			if ((hatposition == AT_TOP_OF_HAT)
				&& ((curr_instruc & FSTRESS) IS_PLUS))
			{						   /* 1-str emph */
				/* Emphasis: prevent any more hat rises until end of clause */
				if ((curr_instruc & FEMPHASIS) == FEMPHASIS)
				{
					emphasislock = TRUE;
				}
#ifndef NWS_US
				/* eab 10/19/97 This isn't working correct for embeeded emphasis commands
				and effectly cancels them I'll figure out how it "suppose" towork later*/
				/* Fall now if emphasis */
				if (emphasislock == TRUE)
				{
					curr_outstruc |= FHAT_ENDS;
					hatposition = AT_BOTTOM_OF_HAT;
					stresses_in_phrase = 0;
				}
#endif /*NWS_US*/

				/* Fall now if last stress in clause */
#ifdef GERMAN
				/* But in German we can have many unstressed vowels left so we don't want to do this too soon or it will sound real bad eab 12/95 so
				 * if we put it off set flag to do it later */
/*				tmp = remaining_stresses_til (pDph_t,n, FCBNEXT);            */ /* useless value is never used */
#endif	// GERMAN
				if ((remaining_stresses_til(pDph_t, n, FCBNEXT) == 0)
		
#if defined (GERMAN) || defined (SPANISH)   
					|| doitlater
#endif	// defined (GERMAN) || defined (SPANISH)   
				)
				{
					/* 
					 * First check if this is phrase boundary and there exist 
					 * secondary stresses in the remaining phrasal fragment   
					 */
#if defined (ENGLISH) || defined (SPANISH) || defined (GERMAN)
					if ((curr_instruc & FBOUNDARY) == FVPNEXT)
					{
						promote_last_2 (pDph_t, n);
						/* Last secondary stress of next phrase promoted */
					}
#endif	// defined (ENGLISH) || defined (SPANISH) || defined (GERMAN)

/* doitlater suffers from the problem of unknown deletes so you don't really know how far from the end you really are*/
#if defined (GERMAN) || defined (SPANISH) 
					if(pDph_t->clausetype == DECLARATIVE)
					{
					if ((pDph_t->nphonetot - n) > 4)
					{
						count=0;
						for (m = n+1; m < pDph_t->nphonetot; m++)
						{
							if ((phone_feature(pDph_t,pDph_t->phonemes[m]) & FSYLL) IS_PLUS)
							{
								count++;
								
							}
						}
						if(count >=2)
						{
							doitlater = 1;
						}
						else
						{
							curr_outstruc |= FHAT_ENDS;
							hatposition = AT_BOTTOM_OF_HAT;
							stresses_in_phrase = 0;
							doitlater=0;
						}
					}
#endif	// defined (GERMAN) || defined (SPANISH) 
					else   

					{
						curr_outstruc |= FHAT_ENDS;
						hatposition = AT_BOTTOM_OF_HAT;
						stresses_in_phrase = 0;
#if defined (GERMAN) || defined (SPANISH)
						doitlater=0;
#endif	// defined (GERMAN) || defined (SPANISH)
					}
#if defined (GERMAN) || defined (SPANISH) 
					}/* clausetype if closure */
#endif	// defined (GERMAN) || defined (SPANISH)
				
				
				/* Fall now if last str in phrase and both phrases have 2 str */
				if ((stresses_in_phrase > 1)
					&& (remaining_stresses_til (pDph_t, n, FVPNEXT) == 0)
					&& (remaining_stresses_til (pDph_t, n, FCBNEXT) > 1))
				{
					curr_outstruc |= FHAT_ENDS;
					hatposition = AT_BOTTOM_OF_HAT;
					stresses_in_phrase = 0;
				}
			}
		}
	}

	  skiprules:
		if (dodelete)
		{
#if defined ENGLISH || defined SPANISH || defined GERMAN
			ph_delcnt++;
#ifdef DEBUGALLO

			printf ("adjusting in alloph,n= %d n+del=%d  \n", n, n + ph_delcnt);

#endif	// DEBUGALLO

#ifdef MSDOS
				adjust_allo (n + ph_delcnt, -1);
#else
				adjust_allo (pKsd_t, n + ph_delcnt, -1);
#endif	// MSDOS

			if (curr_indur != 0)
			{
#ifdef DEBUG_USER_PROSODICS
				printf (
						   "\t  Delete [%s], add dur=%d ms to that of previous phone [%s]\n",
						   phprint (curr_inph), curr_indur, phprint (curr_outph));
				pDph_t->user_durs[pDph_t->nallotot - 1] += curr_indur;
#endif	// DEBUG_USER_PROSODICS
			}
#endif	/* #if defined ENGLISH || defined SPANISH || defined GERMAN */

#ifdef GERMAN
			pDph_t->nphonetot--;
#endif
			if (curr_inf0 != 0)
				pDph_t->user_f0[pDph_t->nallotot - 1] = curr_inf0;
			dodelete = FALSE;
		}

		else
		{
			/* 
			 * if (curr_inph != curr_outph) { printf("changed phonene %d from %d to %d\n",
			 * n,curr_inph,curr_outph); } 
			 */
			make_out_phonol (phTTS, n, curr_outph, curr_outstruc, curr_indur, curr_inf0);		
						/* Save curr_outph in allophons[] */
#ifdef SPANISH_SP
			if (curr_outph == SPP_NH &&  /* Realize [nh] as      */
				(curr_instruc & FBLOCK) == 0)
			{
				curr_outph = SPP_IX;	   /* as [nh ix].          */
				curr_outstruc &= ~FSBOUND;	/* No syllable now      */
				/* 
				 * eab 2/19/95 UGLY BUG User durs reused so all 
					userdurs get broken without
				 * this code to realign values after an insert
				 */
				for (temp = pDph_t->nphonetot; temp >= pDph_t->nallotot; temp--)

				{
					pDph_t->user_durs[temp + 1] = pDph_t->user_durs[temp];
					/* printf("correc %d at %d \n",user_durs[temp],temp); */
					/* printf("correc++ %d at %d \n",user_durs[temp+1],temp+1); */
				}
				/* 
				 * shifting array by different index so need to keep track of ugly 
				 * offsets so we don't get lost. 
				 */
				offset++; 
				pDph_t->user_durs[pDph_t->nallotot - 1] = 0;
				make_out_phonol (phTTS, n, curr_outph, curr_outstruc, curr_indur, curr_inf0);
			}		
#endif	// SPANISH_SP

#ifdef SPANISH_LA
			if (curr_outph == LAP_NH &&  /* Realize [nh] as      */
				(curr_instruc & FBLOCK) == 0)
			{
				curr_outph = LAP_IX;	   /* as [nh ix].          */
				curr_outstruc &= ~FSBOUND;	/* No syllable now      */
				/* 
				 * eab 2/19/95 UGLY BUG Userd durs reused so all userdurs get broken without
				 * this code to realign values after an insert
				 */
				for (temp = pDph_t->nphonetot; temp >= pDph_t->nallotot; temp--)

				{
					pDph_t->user_durs[temp + 1] = pDph_t->user_durs[temp];
					/* printf("correc %d at %d \n",user_durs[temp],temp); */
					/* printf("correc++ %d at %d \n",user_durs[temp+1],temp+1); */
				}
				/* 
				 * shifting array by different index so need to keep track of ugly 
				 * offsets so we don't get lost. 
				 */
				offset++; 
				pDph_t->user_durs[pDph_t->nallotot - 1] = 0;
				make_out_phonol (phTTS, n, curr_outph, curr_outstruc, curr_indur, curr_inf0);
			}		
#endif	// SPANISH_LA
		}
	}

	/* 
	 * After string blocked from Rule 4 via the f0mode=HAT_LOCATIONS_SPECIFIED 
	 * state variable, set back to normal 
	 */
	if(pDph_t->f0mode == HAT_LOCATIONS_SPECIFIED)
	{
		pDph_t->f0mode = NORMAL;
	}

	/* Zap last position in array */
	pDph_t->allophons[pDph_t->nallotot] = GEN_SIL;
	pDph_t->allofeats[pDph_t->nallotot] = 0; 
	pDph_t->user_durs[pDph_t->nallotot] = 0;
//#endif


	/* Print summary of output results   */
	prphonol ();
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */                              
/*
 *      Function Name: remaining_stresses_til()      
 *
 *  	Description: Process rest of input string from position arg1, 
 *					 count primary-stressed vowels, return when encounter 
 * 					 feature arg2
 *
 *      Arguments:	PDPH_T pDph_t, 
 *					short msym, 
 *					short b_type 
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */
static short remaining_stresses_til (PDPH_T pDph_t, short msym, short b_type)
{

	register int m, count;
#ifndef ENGLISH_UK
	/* EAB 1/21/98 This was propbably  wrong for all languages but needs to be verified 
	before enabling for all languages  i.e enabling secondary stress*/
	count = 0;
	for (m = msym; m < pDph_t->nphonetot; m++)
	{

		if ((m != msym)
			&& ((pDph_t->sentstruc[m] & FSTRESS) IS_PLUS)
			&& ((phone_feature(pDph_t,pDph_t->phonemes[m]) & FSYLL) IS_PLUS))
		{
			count++;
		}
		if (((pDph_t->sentstruc[m] & FBOUNDARY) >= (unsigned short)b_type) // NAL warning removal
			|| (pDph_t->phonemes[m] == GEN_SIL))
		{
			return (count);
		}
	}
	return (count);
#else
		count = 0;
	for (m = msym; m < pDph_t->nphonetot; m++)
	{

		if ((m != msym)
			&& ((pDph_t->sentstruc[m] & FSTRESS) IS_PLUS)
			&& ((phone_feature(pDph_t,pDph_t->phonemes[m]) & FSYLL) IS_PLUS))
		{
			count++;
		}
		if (((pDph_t->sentstruc[m] & FBOUNDARY) >= (unsigned short)b_type) // NAL warning removal
			|| (pDph_t->phonemes[m] == GEN_SIL))
		{
			return (count);
		}
	}
	return (count);

#endif	// ENGLISH_UK

}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 *      Function Name: promote_last_2()      
 *
 *  	Description: Promote secondary stress in phrases like "J'ohn ) is h`im", 
 *					 but not in phrases like "J'ohn ) s'aw h`im".
 *
 *      Arguments:	PDPH_T pDph_t, 
 *					short msym 
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */
static short promote_last_2 (PDPH_T pDph_t, short msym)
{

	short done_it, m;

	done_it = 0;
	for (m = msym; m < pDph_t->nphonetot; m++)
	{

		if ((m != msym)
#if defined ENGLISH || defined SPANISH || defined FRENCH
			&& ((pDph_t->sentstruc[m] & FSTRESS) == FSTRESS_2)
#endif	// defined ENGLISH || defined SPANISH || defined FRENCH

#ifdef GERMAN
			&& ((pDph_t->sentstruc[m] & FSTRESS) == FSTRESS_2)
#endif	// GERMAN
			&& ((phone_feature(pDph_t,pDph_t->phonemes[m]) & FSYLL) IS_PLUS))
		{
			done_it = m;			   /* pointer to last secondary stress */
		}
		if (((pDph_t->sentstruc[m] & FBOUNDARY) >= FCBNEXT)
			|| (pDph_t->phonemes[m] == GEN_SIL))
		{
			if (done_it != 0)
			{
				pDph_t->sentstruc[done_it] &= ~FSTRESS_2;
				pDph_t->sentstruc[done_it] |= FSTRESS_1;
#ifdef MSDBG7
					printf ("sentstruc[done_it] |= FSTRESS_1 sentstruc[%d]=%d\n", done_it, pDph_t->sentstruc[done_it]);
#endif	// MSDBG7

				return (TRUE);
			}
		}
	}
	return (FALSE);
}



/*
 *      Function Name: prphonol()      
 *
 *  	Description: 
 *
 *      Arguments: 
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
void prphonol ()
{

}

#endif // ifdef FRENCH


/*
 *      Function Name: make_out_phonol()      
 *
 *  	Description: 
 *
 *      Arguments: 	LPTTS_HANDLE_T phTTS, 
 *					short n,
 *				 	short curr_outph, 
 *					short curr_outstruc,
 *				 	short curr_indur, 
 *					short curr_inf0
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void make_out_phonol (LPTTS_HANDLE_T phTTS, short n,
				 short curr_outph, U32 curr_outstruc,
				 short curr_indur, short curr_inf0)
{
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

#ifdef DEBUGALLO
	struct spc_packet _far *spc_pkt;   /* debug eab */

#endif	// DEBUGALLO                 

    /* printf("nallotot %d n %d curr_outph %d curr_outstruc %d curr_indur %d curr_inf0 %d\n",
	   pDph_t->nallotot,n,curr_outph,curr_outstruc,curr_indur,curr_inf0); 
	*/

#ifdef MSDOS
	set_index_allo (n, pDph_t->nallotot);	/* At minimum do set_index eab */
#else
	set_index_allo (pKsd_t, n, pDph_t->nallotot);	/* At minimum do set_index eab */
#endif	// MSDOS

#ifdef DEBUGALLO

	if ((spc_pkt = (struct spc_packet _far *) pKsd_t->index_pending.head) != NULL_SPC_PACKET)
	{
		printf ("n = %d pDph_t->nallotot = %d\n", n, pDph_t->nallotot);
		if (n >= pDph_t->nallotot)
		{
			while (spc_pkt != NULL_SPC_PACKET)
			{
				WAIT_PRINT;
				printf ("1 index %d = symbol %d \n", (*spc_pkt).data[0], pDph_t->symbols[(*spc_pkt).data[0]]);
				printf ("2 index %d = symbol %d \n", (*spc_pkt).data[4], pDph_t->phonemes[(*spc_pkt).data[4]]);
				printf ("3 index %d = symbol %d \n", (*spc_pkt).data[5], pDph_t->allophons[(*spc_pkt).data[5]]);
				SIGNAL_PRINT;
				spc_pkt = (struct spc_packet _far *) (*spc_pkt).link;
			}
		}
	}								   /* debug eab  */
#endif	// DEBUGALLO

	
#ifdef DEBUGALLO
	printf ("outputting phoneme %d\n ", curr_outph);
#endif	// DEBUGALLO

	if (pDph_t->nallotot > (n + 8))
	{
		return ;
	}
	/* Put phoneme away */

	pDph_t->allophons[pDph_t->nallotot] = curr_outph;
	pDph_t->allofeats[pDph_t->nallotot] = curr_outstruc;
	/* printf("hah %d %d %d  \n",user_durs[nallotot],curr_indur,nallotot); */

#ifdef MSDBG6
		printf ("allofeats[nallotot] allofeats[%d]=%d\n", pDph_t->nallotot, pDph_t->allofeats[pDph_t->nallotot]);
#endif	// MSDBG6

	pDph_t->user_durs[pDph_t->nallotot] = curr_indur;

#ifndef FRENCH
	if (pDph_t->f0mode != HAT_F0_SIZES_SPECIFIED)
	{
		pDph_t->user_f0[pDph_t->nallotot] = curr_inf0;	/* Move user_f0 if phone moved */
	}
#endif	// FRENCH

#ifdef FRENCH
	pDph_t->user_f0[pDph_t->nallotot] = curr_inf0;
	//pDph_t->f0tar[pDph_t->nallotot] = curr_inf0;
	//return;
#endif	// FRENCH

#ifdef DEBUG_USER_PROSODICS
	if (curr_indur != 0)
	{
		printf ("\tFound user_dur[%s] = %3d ms in PHALLOPH\n",
				phprint (curr_outph), curr_indur);
	}
	if ((curr_inf0 != 0) && (pDph_t->f0mode != HAT_F0_SIZES_SPECIFIED))
	{
		printf ("\tFound  user_f0[%s] = %3d Hz in PHALLOPH, f0mode = %d\n",
				phprint (curr_outph), curr_inf0, pDph_t->f0mode);
	}
#endif	// DEBUG_USER_PROSODICS

	/* See if there is room for next phoneme */
	if (pDph_t->nallotot < NPHON_MAX)
	{
		pDph_t->nallotot++;
	}

}
/*********************************end of phalloph.c******************************************/

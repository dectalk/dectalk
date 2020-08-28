/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:    ph_sort.c
 *    Author:       Dennis Klatt
 *    Creation Date:16-SEP-1984
 *
 *    Functionality:
 *    Convert int string of phonemes/accents/boundaries into
 *    integer phoneme sequence with parallel structure features.
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------  
 * 0001 DK 		09/16/1984	    Initial creation
 * 0002 DC		12/27/1984     	Modify to work on 80186
 * 0003 DK 		01/08/1984	    Correct the location of FHAT_ENDS feature
 *           					and treatment of f0mode state variable
 * 0004 DK		01/29/1985      Clause-final function word promoted to secondary stress
 *           					(kludge to compensate for lack of a decent parser)
 * 0005 DK		03/01/1985      Add cbsymbol, set to QUEST if see "?" in input
#ifdef ENGLISH_US               From phsort.c
 * 0006 DK		04/25/1985      Promote [(] to [)] or [,], and [)] to [,] at slow sprate
 * 0007 DK		05/15/1985      Promote stress of [(...] to primary
 * 0008 DK		05/23/1985     	Fix error in promotion of [(`^p] to [ '^p], default str
 *           					placed on first vowel of last word if no stressed words
 * 0009 DK		06/25/1985     	Fix dangling stress, /, or \ movement routine
 * 0010 DK 		07/23/1985    	Fix get_stress_of_conson() using CONROY algorithm
 * 0011 DK		08/26/1985    	Any phrase must have one primary stress
 * 0012 EAB		11/22/1989	    EDIT OUT TROJAN HORSE 
 * 0013 MGS		03/25/1996    	Merged WIN 95 code to 42c
 * 0014 MGS		04/01/1996	    Added MSDBG statements for debugging
 * 0015 MGS 	04/02/1996 		made sure all local variables are initialized
 * 0016 MGS		04/23/1996    	initialized more variables
#endif
#ifdef SPANISH                  from sphsort.c
 * 0006 MM 		04/02/1985		68000 hacks (removed English specific code.
 * 0007 MM		04/23/1986		Changes per suggestions from Dr. Quilis.
 * 0008 MM		05/08/1986		Blocked 'z' rules.
 * 0009 MM		05/22/1986		Locate function words (set FFUNWORD bit)
 * 0010 DF		06/02/1986	    DT3 updates: isemphasis -> emphasisflag
 *                       		isquestion -> cbsymbol
 *                       		nbrphone   -> nphonetot
#endif 
#ifdef GERMAN					From gphsort.c
 * 0012 BNK		24-Jul-86 		introduce german tertiary stress and add debug stuff
 * 0013	BNK		25-Sep-86 		add german sentence intonation handling
 * 0014 CJL		30-MAR-95   	File was phsort.c. Is now gphsort.c. Changed
 *								phdefs.h->gphdefs.h
 * 0015 eab		1-24-96  		I am tuning many different things rapdily so the
 * 								detailed comments are in the code.
#endif
 * 0017	MGS		06/05/1996		Merged Spanish wth english
 * 0018 MGS		06/06/1996 		Changed file name from phsort.c to ph_sort.c 
 * 0019	MGS		06/18/1996		Merged German with English/Spanish
 * 0020 EDB		12/10/1996		Change code in German and Spanish section
 * 0021 EDB		01/10/1997		Many change. Add many Spanish code.
 * 0022 GL		03/27/1997		for BATS#270 fix German index(high light) delay problem.
 *								The problem/fix is located by Ed bruckert
 * 0022	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 0023 KSB		08/19/1997		Fixed problem based on insertphone moving the index array
 *								during the addition of S1, causes usually by find_syll_in_clause
 *								creating a stress (BATS 445)
 * 0024 EAB		08/26/1997		In anyalyzing weather forecast found that reduce from for to "fir"
								was occuring in such contexts as For Tuesday, corrected vowel 
								and stress reduction. Made other general improvements for
								prosody improvements by providing more information
								for later modules.
 * 0025 EAB		10/13/1997		Edited for UK
 * 0026 EAB		10/15/1997		Added more information to use later. The way the code used to work
 *								you didn't know what kind of clause it was til the end of the clause
 *								and you didn't know how long it was. I've added variables to note
 *								this information. This beongs in the base code.
 * 0027 MGS		11/20/1997		removed spaces and tabs before all #'s
 * 0028 eab		12/05/1997		Added linkr code and refined the rule see comments at ends_in_r
 * 0029 MGS		12/29/1997 		removed TABS before all #'s AGAIN
 * 0030 EAB		02/05/1998		Put in fix for BATS 590
 * 0031 EAB		03/20/1998		Slowtalk not in base code why????
 * 0032 EAB		03/31/1998		We found that p+f did a good job of creating the pf phoneme so we 
 *								added code to effect that change.
 * 0033 EAB		03/31/1998		Added code to lengthen a final S sound if the word contained stress and
								also added code to reduce a primary to a secondary stress if compund destress
								was trure (second primary stress in a single word--caused when two words
								are combined with the compund word marke in between
 * 0034 EAB		04/27/1998		Added several changes for German and other general chnages for new
								intonation. The new language suff typically supplies more information to the 
								intonation code and doesn't really DO anything here....
 * 0035 MGS		05/06/1998 		removed TABS before all #'s AGAIN
 * 0036 eab		05/13/1998		BATS 674 Should be inseting a glotal stop not silence 
 * 0037 EAB		05/18/1998		BATS 677 Found other Spanish glotal stop problems
 * 0036 EAB		07/02/1998		BATS 709 Per Oliver this code allows for vowels before double consonants to have a faster duration
 * 0037 EAB		07/14/1998		BATS 711 Remove obsolete code that was useless but burning computes
 * 0038 EAB		07/14/1998		Added wordclass info for AD German may use this very soon
 * 0039 EAB		08/15/1998		Spanish improvements
 * 0040 EAB		09/01/1998		Found bug where E_q is being at postion becuase it looks at wordclass[0-1] which is garbage.
 * 0041 EAB		09/11/1998		Mark out SPANISH where it doesn't compile and improve Spanish intonation
 * 0042 EAB		09/24/1998		delete Spanish_out plus improved rules with Juan
 * 0043 EAB		10/15/1998		Removed some spanish_out code for clarity and modified some glotal
 *								stop insertion rules for spanish
   044	EAB		10/16/1998		More cleanup
 * 045  EAB		10/23/1998		Eliminated use of glotal stops per info Juan found 
 *    							in University of Chicago Spanish Dic(we had reduced them alot already) .
 * 046 	EAB		01/19/1998 		Add in boiler plate code to solve problem in case a get w aord 
								that ends in R and doesn't have an r in actuality. BATS 855 However the dictionary is still broken
   047 	EAB 					Opps doesn't drop R now becuase we assumed flag is at begiining or word not ends
   048 	EAB 					Totally reworte the r code to encompass the safety code in case there's no r and to
   								handle the other situations correctly\
   049 	GL		01/27/1999		BAT#860  remove the broken code that crash function words.
 * 050 	EAB		02/03/1999		Added change from NWSNOAA->NWS_US for multi language NOA
 * 051 	EAB		02/18/1999		Cleaned up SPANISH_OUT stuff
								The new code consists of smarter intonation utilizing part of speech
								etc. and the affects on stress timing on breaking previously
								"acceptable code"
 * 052 	MGS		09/24/1999		removed an extra # from the file
 * 053	MGS		04/13/2000		Changes for integrated phoneme set 
 * 053	EAB		12/12/2000		Fixed slowing speaking bug found by benetech
 * 059  NAL		04/14/2000		Fixed extern featb[] to extern *featb to match ph_rom.c files
 * 060  NAL		06/12/2000		Warning removal
 * 061	CHJ		07/20/2000		French added. And removed incorrect masking when comparing to SPP_*
 *								and LAP_*. The language bits need to be set or it will never match.
 * 062 	EAB		09/15/2000 		Changed GR_ to language specific GRP_ phoneme
 * 063	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 * 064 	CAB		10/18/2000		Changed copyright info and formatted comments
 * 065  EAB		10/07/2000 		number_words broken via lts input also found la diff from english
 * 066 	CAB		01/15/2001		Merged Michel Divay changes for French		
 * 067	CAB		01/22/2001		Fixed compile by removing extra fn call to
 *								phsort(LPTTS_HANDLE_T phTTS)
 * 068  EAB		03/15/2001 		Insert glotal stop before voiced not just fsonor
 * 069  CAB		03/21/2001		Added changes by Michel for French
 * 070	CAB		09/04/2001		Added declaration for ntmp and consolidated #ifdef
 * 071	MGS		04/17/2002		ARM7 port
 * 072	CAB		04/25/2002		Removed warnings by typecast
 * 073	CAB		05/23/2002		Updated copyright info
 * 074	MGS		04/09/2003		fixed indexing problem #10190
 */                

#include "dectalkf.h"
#include "ph_def.h"
/***************************************************************************/
/* MVP : The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* extern short symbols[];   Integer represent of input string             */
/* extern short pDph_t->nsymbtot;    Number of input symbols               */
/* extern short *user_durs;  Optional array user-specified durs            */
/* extern short *user_f0;    Optional array user-specified f0              */
/* extern short *user_offset;Optional array of f0 offset times             */
/* extern short *phonemes;   Output array for phonemes only                */
/* extern short *sentstruc;  Output array sentence struc features          */
/* extern short nphonetot;   Number of output phonemes                     */
/* extern FLAG newparagsw;   Set to 1 here if see [{] in input             */
/* extern short f0mode;      State variable indicting type of f0           */
/* extern short cbsymbol;    Indicates if clause is a question             */
/***************************************************************************/

/* From PHROM.C */
//extern short *featb;	   /* Feature assignment to each phonetype */

/* #define DEBUGIND      1 *//* for degbuggin eab */
#define CURRPHONE   pDph_t->nphonetot - 1
#define NEXTPHONE   pDph_t->nphonetot


/* static short n,curr_dur,curr_f0,compound_destress; */
/* static short curr_in_sym,word_init_sw,in_rhyme,m,mf0,nstresses; */
/* static short nstartphrase; */
/* static int did_del;   *//* MVP : changed to static as it is used only in this file */

/* MVP : static function declarations */
static void insertphone (LPTTS_HANDLE_T phTTS, short loc, short fone);

static void find_syll_to_stress (LPTTS_HANDLE_T phTTS, short *locend,
											 short nstartphrase);

static void delete_symbol (LPTTS_HANDLE_T phTTS, short msym);

static void move_stdangle (LPTTS_HANDLE_T phTTS, short msym);

#if defined ENGLISH || defined GERMAN || defined FRENCH
static void zap_weaker_bound (LPTTS_HANDLE_T phTTS, short msym1, short msym2);
#endif

static int  is_wboundary (short symb);

static void raise_last_stress (PDPH_T pDph_t, short msym);

static void interp_user_f0 (PDPH_T pDph_t, short *psCurr_dur, short *psCurr_f0,
							short curr_in_sym, short *psMf0);

static void make_phone (PDPH_T pDph_t, short phoname, short n,
						short curr_dur, short curr_f0);

//static void init_med_final (LPTTS_HANDLE_T phTTS, short msym);

static void get_stress_of_conson (LPTTS_HANDLE_T phTTS, short msym, short compound_destress);

static void add_feature (PDPH_T pDph_t, long feaname, short location);

static void get_next_bound_type (LPTTS_HANDLE_T phTTS, short msym);
__inline short phone_feature(PDPH_T pDph_t, int phone);

extern const short *all_featb[];
// HELPME
const short durdic[] = 
{
#ifdef SUEB
	8,USP_R,S1,USP_EY,EOS,40,0,200,-1,
#else
	8,USP_R,S1,USP_EY,EOS,40,0,100,-1,
#endif
	12,USP_K,WBOUND,USP_YX,S1,USP_RR,EOS,20,0,30,60,0,-1,
	//10,WBOUND,S1,USP_IH,USP_N,EOS,0,0,110, 0,-1,
	8,WBOUND,FP_OU,WBOUND,EOS,0,130,0,-1,
	12,WBOUND,USP_M,S1,USP_IH,USP_D,EOS,0,0,0,85,0,-1,
	6,LAP_NH,LAP_I,EOS,60,30,-1,
	6,SPP_NH,SPP_I,EOS,60,30,-1,
	6,LAP_LL,LAP_I,EOS,60,30,-1,
	6,GRP_T,GRP_Z,EOS,60,110,-1,
	8,GRP_T,WBOUND,GRP_Z,EOS,60,0,110,-1,
	6,SPP_LL,SPP_I,EOS,60,30,-1,
	11,WBOUND,USP_DH,USP_AX,WBOUND,EOS,0,40,60,0,0,-1,
	12,WBOUND,USP_LL,S1,USP_AA,USP_T,EOS,0,0, 60,160,0,-1,
	12,WBOUND,USP_S,S1,USP_IH,USP_T,EOS,0,0,0,65,0,-1,
	10,WBOUND,S1,USP_EH,USP_N,EOS,0,0,80,70,-1,
	10,WBOUND,S1,USP_AE,USP_D,EOS,0,0,110, 0,-1,
	12,WBOUND,USP_W,S1,USP_AO,USP_N,EOS,0,0,0,130,0,-1,   
	14,WBOUND,USP_W,S1,USP_AH,USP_N,USP_S,EOS,0,0,0,80,0,0,-1, 
	12,WBOUND,USP_N,S1,USP_EH,USP_V,EOS,0,0,0,90,0,-1, 
	12,WBOUND,S1,USP_IY,USP_V,USP_EN,EOS,0,0,142,0,0,-1, 
	14,WBOUND,USP_P,USP_R,S1,USP_AA,USP_D,EOS,0,0,0,0,140,0,-1,
	EOS
};



#include "ph_sort1.c"	/* language dependent code from phsort */
#include "ph_sort2.c"	/* language dependent code for multiple languages */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *      Function Name: phsort()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/

int phsort (LPTTS_HANDLE_T phTTS)
{
  PKSD_T            pKsd_t     = phTTS->pKernelShareData;
	if (pKsd_t->lang_curr==LANG_french)
	{

		return(fr_phsort(phTTS));
	}
	else
	{
		return(all_phsort(phTTS));
	}
}


int fr_phsort (LPTTS_HANDLE_T phTTS) 
{
  PKSD_T            pKsd_t     = phTTS->pKernelShareData;
  PDPH_T            pDph_t     = phTTS->pPHThreadData;
  PDPHSETTAR_ST     pDphsettar = pDph_t->pSTphsettar;
	short *cp;
	short  *durlookup(PDPH_T pDph_t,short *symbol , short table[]);
	short tmp;
  short curr_in_sym = 0; // current symbol
  short n           = 0; // loop for
  short curr_dur    = 0;
  short curr_f0     = 0;
  FLAG  QuestionDeb = FALSE;
  short NbMots      = 0; // Nb words in the clause

  short CGPrec          = CgBas;  /* Grammatical category of preceding word */
  FLAG  PrecAccentue    = FALSE;  /* Preceding word stressed or not */
  short PosDebutPrecMot = 1;      /* Index on beginning of preceding word */
  short CGCour          = CgBas;  /* Grammatical category of current word */
  FLAG  MotAccentue     = TRUE;   /* current word stressed or not */
  short PosDebutMot     = 1;      /* Index on beginning of current word */
  short PosFGROUPrec    = 0;      /* Index of preceding word of type FGROU */

  pDph_t->f0mode  = NORMAL;
  pDph_t->sentstruc [0] = 0;
  pDph_t->cbsymbol = 0;

  /* Main loop 1: Clean up input string re mis-orderings & extra boundaries */
  pDph_t->nphonetot = 0;

// n== 1 becuase french send it's own beginning silence. 
  for (n = 0; n < pDph_t->nsymbtot; n++) {

    if (pKsd_t->halting) return FALSE;

    curr_in_sym = pDph_t->symbols[n] & PVALUE;  /* Precompute useful variable */
    curr_dur    = pDph_t->user_durs[n];  /* User-specified dur if non-zero */
    curr_f0     = pDph_t->user_f0[n];    /* User-specified f0 if non-zero  */
    pDph_t->user_durs[n] = 0;
    pDph_t->user_f0[n]   = 0;

	if ( (cp = durlookup(pDph_t, &pDph_t->symbols[n], (short *)&durdic[0])) != NULL)
		{	
			tmp=n;
			do{
			if(*cp != 0 && tmp == n)
			{
				curr_dur=*cp;
			}
			else
			{
				pDph_t->user_durs[tmp]=*cp;
			}
			tmp++;
			cp++;
			}
			while (*cp != -1);
			
		}
	

    if (curr_f0>0)
	 if( (curr_f0%1000)<38) 
		 pDph_t->f0mode = SINGING;

    //printf ("**** ph_sort n:%d, curr_in_sym:%d, pDph_t->sentstruc [n]:%d\n", 
    //  n, curr_in_sym, pDph_t->sentstruc [n]);

    /*  Switch on the current input symbol */
    if (curr_in_sym < FR_TOT_ALLOPHONES) {  /* a phoneme */
      if (pDph_t->nphonetot < NPHON_MAX) {
        //printf ("===>  ph_sort boucle nphonetot %d, n %d\n", pDph_t->nphonetot, n);
        //printf ("===>  ph_sort boucle pDph_t->sentstruc [n] %d\n", pDph_t->sentstruc [n]);
        if (pDph_t->sentstruc [n] != 0) { /* phoneme + grammatical category */
          CGPrec = CGCour;
          CGCour = (char) pDph_t->sentstruc [n];
          MotAccentue = (char) Stressed (CGPrec, CGCour);
          //printf ("===>  ph_sort boucle for n %d, CGPrec %x, CGCour %x, MotAccentue %d\n",
          //         CGPrec, CGCour, MotAccentue);
          if ( (NbMots==0) && (pDph_t->sentstruc[n]==CgInterr) ) QuestionDeb = TRUE;
          pDph_t->sentstruc [n] = 0;
        }
        if (curr_in_sym != SIL) {
          pDph_t->phonemes[pDph_t->nphonetot] = ((PFFR << 8) | curr_in_sym);
        } else {
          pDph_t->phonemes[pDph_t->nphonetot] = GEN_SIL;
        }
        pDph_t->sentstruc [pDph_t->nphonetot] = 0;
        pDph_t->user_durs [pDph_t->nphonetot] = curr_dur;
        pDph_t->user_f0   [pDph_t->nphonetot] = curr_f0;
        pDph_t->nphonetot++;
      }
    } else if (curr_in_sym <= LAST_PHONE) {  /* word or clause boundary */

      //printf ("ph_sort word or clause boundary n:%d, pDph_t->nphonetot:%d\n",
      //  n, pDph_t->nphonetot);

      NbMots++;

      /* modify the features for the first phoneme of the word */
      //MotAccentue = TRUE;  // stressed every word (slow rate ??) 
      if (MotAccentue) pDph_t->sentstruc [PosDebutMot] |= ACCEN;
      pDph_t->sentstruc [PosDebutMot] |= FMOT;

      //printf ("phsort  PosDebutMot %d, sentstruc [%d] %8x\n",
      //    PosDebutMot, PosDebutMot, pDph_t->sentstruc [PosDebutMot]);

      if( curr_in_sym == FrontMot) { /* Word boundary : a space */
        Word_Bd (pDph_t, PrecAccentue, MotAccentue, CGCour, PosDebutPrecMot, &PosFGROUPrec);
        //Word_Bd (pDph_t, PrecAccentue, MotAccentue, &CGCour, PosDebutPrecMot);
        PrecAccentue = MotAccentue;
      } else if( curr_in_sym == VPSTART || curr_in_sym == PPSTART ) { 
        //used in number like 1400 or 1999
        // VPSTART is not used for French; maybe later; keep it here
        Word_Bd (pDph_t, PrecAccentue, MotAccentue, CGCour, PosDebutPrecMot, &PosFGROUPrec);
        //Word_Bd (pDph_t, PrecAccentue, MotAccentue, &CGCour, PosDebutPrecMot);
        PrecAccentue = MotAccentue;
      } else { /* clause boundary */
        Synt_Bd (pDph_t, curr_in_sym, QuestionDeb);
        /* only one (function) word is stressed : nous, vous. */
        if (NbMots==1) pDph_t->sentstruc [PosDebutMot] |= ACCEN;

        //printf ("ph_sort.c  %d mot, PosDebutMot %d %4x\n", 
        //    NbMots, PosDebutMot, pDph_t->sentstruc [PosDebutMot]);

        NbMots       = 0;
        CGCour       = CgBas;  /* init for next clause */
        PrecAccentue = FALSE;
      } /* frontiere */

      PosDebutPrecMot = PosDebutMot;
      PosDebutMot     = pDph_t->nphonetot;
      MotAccentue     = TRUE; /* default for next word */
    } /* else if */
  } //for

  // The last word is always stressed. Ex : le petit a.
  pDph_t->sentstruc [PosDebutPrecMot] |= ACCEN;

  return TRUE;
} // phsort () for FRENCH

int all_phsort (LPTTS_HANDLE_T phTTS)
{
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
//	int ntmp;
	short *cp;
	short  *durlookup(PDPH_T pDph_t,short *symbol , short table[]);
	

	short                   snphonetot = 0;		/* MVP 03/19/96 changed to short from unsigned int */
	short                   n = 0, curr_dur = 0, compound_destress = 0, curr_f0 = 0;	/* MVP : Made local */
	short                   curr_in_phone =0, curr_in_sym = 0, word_init_sw = 0, in_rhyme = 0, m, mf0, nstresses;		/* MVP : made local */
	short                   nstartphrase = 0;

	short wordstress;
 	short Ge_ma_found_r=0;
	short ntmp=0;
	short ntmpr=0;



	short	nextvowel=0;
	short   nextthing=0;

	short tmp=0;
	short doneit=0;


		short	phrase_after_quote = 0;
		short	nsyll;	   /* Nbr. syllables       */
		short	syllclass; /* Set if open syllable */
		U32		iscoda;	   /* Set after nucleus    */

		pDph_t->special_phrase=0;
	



	//eab 10/087/00 The used to be one less but now in english at least it's changed and I need to modify
	//the initaliazation and check for all languages...


	pDph_t->number_words=0; /* eab init there is one less word boundary than number of 
							words*/


	pDphsettar->did_del = 0;



	pDph_t->f0mode = NORMAL;

#ifdef SPANISH
	pDph_t->emphasisflag = FALSE; 
#endif
	pDph_t->cbsymbol = 0;
	

	/* Main loop 1: Clean up input string re mis-orderings & extra boundaries */
	pDph_t->nphonetot = 0;
	nstresses = 0;
	nstartphrase = 0; 
	/*  due to different people stuffing the pipe a word boundary is not always sent before the first word
	of a claue so insert it if needed eab 8/26/00 */
	if(pDph_t->nsymbtot >2 && pDph_t->symbols[1] !=111)
		insertphone (phTTS,(1),( 111));

if(pKsd_t->lang_curr == LANG_german)
{
	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		if (((pDph_t->symbols[n] ) == S1 ||
			  (pDph_t->symbols[n]) == S2 ||
			  (pDph_t->symbols[n]) == S3)
			 && !(phone_feature( pDph_t,  pDph_t->symbols[n + 1]) & FVOWEL))
		{
			/* BATS 711 Slight improvement in loop performance start at n+2 not n */
		
			
			for (nextvowel = n+2; nextvowel < pDph_t->nsymbtot; nextvowel++)
			{
				if (phone_feature( pDph_t,  pDph_t->symbols[nextvowel]) & FVOWEL)
				{
					tmp = pDph_t->symbols[n];
					for (ntmp = n; ntmp < (nextvowel - 1); ntmp++)
					{
						pDph_t->symbols[ntmp]  = pDph_t->symbols[ntmp + 1];
					}
					pDph_t->symbols[nextvowel - 1] = tmp;
					n = nextvowel;	   /* done to this point so jump ahead */
					break;
				}
			}
		}
	}

}


	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		if (pDphsettar->did_del)
		{
			n--;	/* delete was done so back up one to process shifted phoneme eab */
			pDphsettar->did_del = 0;
			/* del_cnt++; *//* MVP : Value is never used */
		}

if(pKsd_t->lang_curr == LANG_german)
{
						if((n > 1)&& (pDph_t->symbols[n] ) >= WBOUND
							&& (pDph_t->symbols[n]  <= RELSTART ))
							
							//if (phone_feature(pDph_t, pDph_t->symbols[n-1]) & FSONOR)		/* RSM */
							//{																/* RSM */
								for (nextthing = n+1; nextthing < pDph_t->nsymbtot; nextthing++)
								{	
									if ( (pDph_t->symbols[nextthing] & PVALUE) < 100)
									{
										// y wbound y where y==y then we need a glottal stop to indicate wbound
										// or if followed by a sonorant
										//if((pDph_t->symbols[n-1] == pDph_t->symbols[nextthing])						/* RSM */
										//	||( (pDph_t->symbols[n-1] == GRP_R || pDph_t->symbols[n-1] == GRP_RR) &&	/* RSM */
										//	(phone_feature(pDph_t,pDph_t->symbols[nextthing])&FSONOR )))				/* RSM */
										if((pDph_t->symbols[n-1] == pDph_t->symbols[nextthing])						/* RSM */
											||	(phone_feature(pDph_t,pDph_t->symbols[n-1])&FVOICD ) &&
											(phone_feature(pDph_t,pDph_t->symbols[nextthing])&FVOICD)
												&& !(phone_feature(pDph_t,pDph_t->symbols[nextthing])&FSTOP) )
										{
									//	insertphone (phTTS, (short) (n+1), GRP_Q);	
										}
										break;
									}
									
								//} /* RSM */
							}
}
//eab depending on situation ending may be wbound pp or just pp delete wboundary in 
//wbound pp case as it is redundant

/// eab temporary pause code
			if( pDph_t->symbols[n] == NEW_PARAGRAPH
				&& pDph_t->symbols[n+1] == NEW_PARAGRAPH)
			{
			//	pDph_t->symbols[n] = COMMA;
				delete_symbol (phTTS, n);
			}

			if( pDph_t->symbols[n] == WBOUND && 
				pDph_t->symbols[n+1] == PERIOD )
			{
				delete_symbol (phTTS, n);
			}
///reiner rule to compensate for bachus putting in a glottal stop in front of first 
								//word in an uttereance
			if( pDph_t->symbols[n] == GRP_Q && n <= 2)
			{
				delete_symbol (phTTS, n);
			}


			if( pDph_t->symbols[n] == GRP_TS && pDph_t->symbols[n+1] == GRP_S)
			{
				delete_symbol (phTTS, n);
			}
		if( pDph_t->symbols[n] == GRP_TJ)
		{
			pDph_t->symbols[n] = GRP_T;
			insertphone (phTTS, (short)(n+1), ( GRP_SH));
		}
		if ((pDph_t->symbols[n] ) == GRP_PF)
			
			{
				pDph_t->symbols[n]  = ( GRP_P);
				insertphone (phTTS, (short)(n+1), ( GRP_F)); // NAL warning removal
					/* 12/10/1996 EDB */
				n++;
		}
		if (pDph_t->symbols[n]  == LAP_NH
			|| pDph_t->symbols[n]  == LAP_LL)
			
		{
			
			insertphone (phTTS, (short)(n+1), ( LAP_I)); // NAL warning removal
			/* 12/10/1996 EDB */
			n++;
		}
		if (pDph_t->symbols[n]  == SPP_NH
			|| pDph_t->symbols[n]  == SPP_LL)
			
		{
			
			insertphone (phTTS, (short)(n+1), ( SPP_I)); // NAL warning removal
			/* 12/10/1996 EDB */
			n++;
		}



		if(pDph_t->symbols[n] == GRP_TS)
		{
			pDph_t->symbols[n] = GRP_T;
			insertphone (phTTS, (n+1), GRP_S);
		}

if(pKsd_t->lang_curr == LANG_spanish || LANG_ITALIAN)
{
		/* kludge we need to have a word boundary at the begiining to make things
		coding more straight forward n=0 is becuase of no inital wbound.*/
		if (pDph_t->symbols[n] == WBOUND || n==0)
		{
			/* allophonic rule for grapheme Y->e 
			before an I as in Y india pronounced e india */
			if((pDph_t->symbols[n+1] == SPP_I)
				&& (pDph_t->symbols[n+2] == WBOUND))
			{
			/*then look ahead to see if the 
			  next real phoneme is the vowel SPP_I*/
				ntmp = n+2;
			/* step past any non-phonemes such as stress*/
				while ( ((pDph_t->symbols[tmp] & PVALUE) > 100 ||
					(pDph_t->symbols[tmp] & PVALUE)==SPP_Q )
					&& ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* Is next thing a the vowel*/
				if ((pDph_t->symbols[tmp] /*& PVALUE*/) == SPP_I)	
				{
					pDph_t->symbols[n+1]=SPP_E;
				}
			}
			/* allophonic rule for "or" O->e
			before an I as in Y india pronounced e india*/
			if((pDph_t->symbols[n+2] == SPP_O)
			 && (pDph_t->symbols[n+3] == WBOUND))
			{
			/* then look ahead to see if the next real phoneme is the vowel SPP_I*/
				ntmp = n+3;
			/* step past any non-phonemes such as stress */
				while ( ((pDph_t->symbols[tmp] & PVALUE) > 100 ||
					(pDph_t->symbols[tmp]) == SPP_Q )
					&& ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
			    /* Is next thing SPP_O */
				if ((pDph_t->symbols[tmp]) == SPP_O)		
				{
					pDph_t->symbols[n+2]=SPP_U;
				}
			}
				
			
#ifdef BOOK_SAYS_DIFFERENT
			// from previous input perhaps a castillion/latin difference or
			// maybe anna was wrong/anglicanixzed
		    /* 12/27/96 EAB insert a glotal stop bewteen s#s V#s and s#v and 
			   Juan would like it with sonor #sonor  */
			if(pDph_t->symbols[n-1] == SPP_S || pDph_t->symbols[n-1] == SPP_TH)
			{
				ntmp = n;
				/* step past any non-phonemes such as stress */
				while((pDph_t->symbols[ntmp] & PVALUE) > 100 && ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* If next thing an S use sil instead of  a voiced
				glotal stop*/
				if((pDph_t->symbols[ntmp] ) == SPP_S || (pDph_t->symbols[ntmp] ) == SPP_TH)
				{
					insertphone(phTTS, n, GEN_SIL);
					n=ntmp;
				}

				/* Is next thing a vowel*/
				else if (phone_feature( pDph_t,  (pDph_t->symbols[tmp] & PVALUE)] & FVOWEL	)
				{
					if((pDph_t->wordclass[n] & 0x020))
						insertphone (phTTS, n, SPP_Q);
					/* BATS 677 Found another spot it was doing it wrong
					EAB 5/18/98 */
					if(!(pDph_t->wordclass[n-1] & 0x00800000)
						&& !(pDph_t->wordclass[n+1] & 0x00800000))
					{
						insertphone (phTTS, n, SPP_Q);
					/* 12/10/1996 EDB */
					n=ntmp;
					}
				}
			}
				else if(phone_feature( pDph_t,  pDph_t->symbols[n-1]] & FSONOR)
			{
				ntmp = n;
				/* step past any non-phonemes such as stress */
				while ((pDph_t->symbols[tmp] & PVALUE) > 100 && ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* Is next thing an s or a vowel i.e. vowel wbound vowel gets a glotal also 
				BATS 677 EAB 5/18/98 */
				if (phone_feature( pDph_t,  (pDph_t->symbols[tmp] & PVALUE)] & FSONOR
					|| 	(pDph_t->symbols[tmp]) == SPP_S || (pDph_t->symbols[tmp]) == SPP_TH)
				{
					/*last phoneme of word equals next phoneme so glotal stop it*/
					if(pDph_t->symbols[n-1]==(pDph_t->symbols[tmp] & PVALUE))
					{
						insertphone (phTTS, n, SPP_Q);
					}
			/* BATS 674 Should be inserting a glotal stop not silence eab 5/13/98*/
			/* now trying to refine so that we don't put in tooo many glotal stops
			but we must be careful because we can cause confusion eab 8/7/98 */
					

			/* BATS 677 Found another spot it was doing it wrong
			EAB 5/18/98 EAB Found a behavior problem because N+1 can be end
			marker with no silence at the end yet */

					else if(n>0 && !(pDph_t->wordclass[n-1] & 0x00800000))
					{
						if((pDph_t->symbols[n+1]& PVALUE) != GEN_SIL  )
							if( !((pDph_t->symbols[n+1]& PVALUE) >= 115
								&& (pDph_t->symbols[n+1]& PVALUE) <= 118))
							insertphone (phTTS, n, SPP_Q);

					/* 12/10/1996 EDB */
					}
					n=ntmp;
				}
			}
#endif // BOOK_SAYS_DIFFERENT
							
		}
}

		
if(pKsd_t->lang_curr == LANG_latin_american)
{
		/* kludge we need to have a word boundary at the begiining to make things
		coding more straight forward n=0 is becuase of no inital wbound.*/
		if (pDph_t->symbols[n] == WBOUND || n==0)
		{
			/* allophonic rule for grapheme Y->e 
			before an I as in Y india pronounced e india */
			if((pDph_t->symbols[n+1] == LAP_I)
				&& (pDph_t->symbols[n+2] == WBOUND))
			{
			/*then look ahead to see if the 
			  next real phoneme is the vowel LAP_I*/
				ntmp = n+2;
			/* step past any non-phonemes such as stress*/
				while ( ((pDph_t->symbols[tmp] & PVALUE) > 100 ||
					(pDph_t->symbols[tmp])==LAP_Q )
					&& ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* Is next thing a the vowel*/
				if ((pDph_t->symbols[tmp]) == LAP_I)		
				{
					pDph_t->symbols[n+1]=LAP_E;
				}
			}
			/* allophonic rule for "or" O->e
			before an I as in Y india pronounced e india*/
			if((pDph_t->symbols[n+2] == LAP_O)
			 && (pDph_t->symbols[n+3] == WBOUND))
			{
			/* then look ahead to see if the next real phoneme is the vowel LAP_I*/
				ntmp = n+3;
			/* step past any non-phonemes such as stress */
				while ( ((pDph_t->symbols[tmp] & PVALUE) > 100 ||
					(pDph_t->symbols[tmp]) == LAP_Q )
					&& ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
			    /* Is next thing LAP_O */
				if ((pDph_t->symbols[tmp]) == LAP_O)		
				{
					pDph_t->symbols[n+2]=LAP_U;
				}
			}
				
			
#ifdef BOOK_SAYS_DIFFERENT
			// from previous input perhaps a castillion/latin difference or
			// maybe anna was wrong/anglicanixzed
		    /* 12/27/96 EAB insert a glotal stop bewteen s#s V#s and s#v and 
			   Juan would like it with sonor #sonor  */
			if(pDph_t->symbols[n-1] == LAP_S || pDph_t->symbols[n-1] == LAP_TH)
			{
				ntmp = n;
				/* step past any non-phonemes such as stress */
				while((pDph_t->symbols[tmp] & PVALUE) > 100 && ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* If next thing an S use sil instead of  a voiced
				glotal stop*/
				if((pDph_t->symbols[tmp]) == LAP_S || (pDph_t->symbols[tmp]) == LAP_TH)
				{
					insertphone(phTTS, n, GEN_SIL);
					n=ntmp;
				}

				/* Is next thing a vowel*/
				else if (phone_feature( pDph_t,  (pDph_t->symbols[tmp] & PVALUE)] & FVOWEL	)
				{
					if((pDph_t->wordclass[n] & 0x020))
						insertphone (phTTS, n, LAP_Q);
					/* BATS 677 Found another spot it was doing it wrong
					EAB 5/18/98 */
					if(!(pDph_t->wordclass[n-1] & 0x00800000)
						&& !(pDph_t->wordclass[n+1] & 0x00800000))
					{
						insertphone (phTTS, n, LAP_Q);
					/* 12/10/1996 EDB */
					n=ntmp;
					}
				}
			}
				else if(phone_feature( pDph_t,  pDph_t->symbols[n-1]] & FSONOR)
			{
				ntmp = n;
				/* step past any non-phonemes such as stress */
				while ((pDph_t->symbols[tmp] & PVALUE) > 100 && ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* Is next thing an s or a vowel i.e. vowel wbound vowel gets a glotal also 
				BATS 677 EAB 5/18/98 */
				if (phone_feature( pDph_t,  (pDph_t->symbols[tmp] & PVALUE)] & FSONOR
					|| 	(pDph_t->symbols[tmp]) == LAP_S || (pDph_t->symbols[tmp]) == LAP_TH)
				{
					/*last phoneme of word equals next phoneme so glotal stop it*/
					if(pDph_t->symbols[n-1]==(pDph_t->symbols[tmp] & PVALUE))
					{
						insertphone (phTTS, n, LAP_Q);
					}
			/* BATS 674 Should be inserting a glotal stop not silence eab 5/13/98*/
			/* now trying to refine so that we don't put in tooo many glotal stops
			but we must be careful because we can cause confusion eab 8/7/98 */
					

			/* BATS 677 Found another spot it was doing it wrong
			EAB 5/18/98 EAB Found a behavior problem because N+1 can be end
			marker with no silence at the end yet */

					else if(n>0 && !(pDph_t->wordclass[n-1] & 0x00800000))
					{
						if(pDph_t->symbols[n+1] & PVALUE) != GEN_SIL  )
							if( !((pDph_t->symbols[n+1] & PVALUE) >= 115
								&& (pDph_t->symbols[n+1]& PVALUE) <= 118))
							insertphone (phTTS, n, LAP_Q);

					/* 12/10/1996 EDB */
					}
					n=ntmp;
				}
			}
#endif // BOOK_SAYS_DIFFERENT
							
		}}

if(pKsd_t->lang_curr == LANG_german)
{
		/* code to insert a secondary stress in a polysyllabic or compound word on the second +syl after
           a stress*/
		if(pDph_t->Word_has_stress == 1)
		{
			if ((phone_feature( pDph_t,  pDph_t->symbols[n]) & FSYLL)IS_PLUS)
			{
				pDph_t->number_fsyls++;
				if(pDph_t->number_fsyls == 4)
				{
					insertphone (phTTS, n, S2);
				}
			}
		}


		if (pDph_t->symbols[n] == S1 )
		{
			pDph_t->Word_has_stress =1; // eab 3/37 /98 set word stress marker
		
			if(compound_destress)
			{
				/* xxx new code to do compound destress correctly eab 8/94 */
				pDph_t->symbols[n] = S2;
				compound_destress = FALSE;
			}
		}

}

if(pKsd_t->lang_curr == LANG_british)
{
		/* linking r rule 12/3/97 eab*/
		if ((pDph_t->symbols[n] ) == LINKRWORD)
		{
			/*EAB This is new code to tell when to drop the final R. The LINKRWORD tells us
			that it's a candididate for liason but we need to look at the ending because it could
			have s suffix. If it does end in R and the next word doesn't begin with a vowel we can
			drop it*/
			Ge_ma_found_r=0;
			ntmp=n+1;
			/* fixed a bug with linkrword where it would walk past the end of the world */
			while ((pDph_t->symbols[ntmp] & PVALUE) <= MBOUND && ntmp <= (pDph_t->nsymbtot-1))
			{
				if((pDph_t->symbols[ntmp] ) == UKP_R )
				{
					//we move up through the word and didn't find an "R" even though
					//there should be by verture of linkrword
					//This is a dictioary or letter to sound error conition so punt
					// EAB 1/19/99  BATS 855
					Ge_ma_found_r=1;
					ntmpr=ntmp;
				}
				ntmp++;
			}

			ntmp++; //move pointer to "thing follwoing r				
			if(Ge_ma_found_r==1) //protection code it souhld always find a n R
			{
				//move pointer to next valid phoneme
				while ((pDph_t->symbols[ntmp] & PVALUE) >= 100 && ntmp <= (pDph_t->nsymbtot-1))
				{
					ntmp++;
				}
		
				// BATS 590*/
		
				//If next thing a vowel don't delete it 
				// BATS 590 if it is the suffex ED (ix d) 
				// or S (z phoneme) then don't delete the r 
				
				//This thing (BATS 590) doesn't make sense and we don't understand
				//exactly what it should be doing so ginger and I have eliminated
				//it. It wasn't firing because in these case the lts wasn't sending 
				//nor the r the ix d suffix  anyway
				
				//The pDph_t->symbols[ntmp] > 100 is becuase featb is yeilding a negative
				// number insetad of zero like it should (featb out of phedit not correct
				
				if ( !(phone_feature( pDph_t,  pDph_t->symbols[ntmp ]) & FVOWEL))
				{
					
					delete_symbol (phTTS, ntmpr);
				}
			}		
		}
		
}
		

if(pKsd_t->lang_curr == LANG_latin_american
   || pKsd_t->lang_curr == LANG_spanish )
{

		/* xxx new code to do compound destress correctly eab 8/94 */
		if (pDph_t->symbols[n] == HYPHEN)
		{
			compound_destress = TRUE;
		}

		if (pDph_t->symbols[n] == S1 && compound_destress)
			/* xxx new code to do compound destress correctly eab 8/94 */
		{
			pDph_t->symbols[n] = S2;
			compound_destress = FALSE;
		}

		if (pDph_t->symbols[n] == SPECIALWORD)
		{
			if (phrase_after_quote)
			{
				pDph_t->special_phrase = 1;
			}
			phrase_after_quote = 0;
			delete_symbol (phTTS, n);
		}

		if(pDph_t->symbols[n] == SPP_I 	|| pDph_t->symbols[n] == LAP_I)

		{
			if ((pDph_t->symbols[n - 1] & PVALUE) == WBOUND
				&& (pDph_t->symbols[n + 1] & PVALUE)== WBOUND)
			{
				pDph_t->wordclass[n] |= 0x00800000;
			}
		}
		/* Move identiical phones seperated by 
		a wbound code to PH_timing so we can control duration*/
	
}

		/* Check for user F0 commands in input string for this clause     */

		/* RULES for input of a user f0 command                   */
		/* 1. If no f0 commands in input, set f0mode = NORMAL     */
		/* 2. If explicit [/] or [\] phonemes in input,           */
		/* set f0mode = HAT_LOCATIONS_SPECIFIED           		  */
		/* 3. If first f0 command is attached to phoneme and has  */
		/* value <= 37, set f0mode = SINGING                      */
		/* 4. If first f0 command is attached to phoneme and has  */
		/* value > 37, set f0mode = PHONE_TARGETS_SPECIFIED       */
		/* 5. If first f0 command is attached to non-phoneme ['], */
		/* [/], or [\], set f0mode = HAT_F0_SIZES_SPECIFIED       */
		/* NOTE cases are mutually exclusive except 2&5 so all    */
		/* f0 commands must be of same category within clause 	  */

		/* RULES for interpretation of user f0 commands           */
		/* SINGING:  e.g. [a<500,22>].                            */
		/* If duration attached to phoneme, convert to frames     */
		/* If note number attached to phoneme, convert to Hz      */
		/* Go to new note linearly in freq over 160 ms, start     */
		/* at begin time of phoneme.                              */
		/* Add vibratto of +/-1.8 Hz, at 6.5 Hz repetition rate   */
		/* PHONE_TARGETS_SPECIFIED:  e.g. [a<,125>]               */
		/* If duration attached to phoneme, convert to frames     */
		/* If f0 target attached to phoneme, convert to Hz        */
		/* Go to new f0 target linearly in freq over duration     */
		/* of phoneme, start at beginning of phoneme              */
		/* All Hz values are absolute, there is no spdef scaling  */
		/* HAT_LOCATIONS_SPECIFIED:  e.g. [/'ab\a]                */
		/* Example: hat rise on first stressed vowel (as is       */
		/* usual in DECtalk), but fall on final unstressed V      */
		/* Usual practice of Dectalk determining hat locations    */
		/* is totally disabled, rises and falls occur only on     */
		/* phone following the rise or fall symbol.               */
		/* Phone following rise and/or fall must be +syllabic     */
		/* or PHSORT will produce garbage                 		  */
		/* Rise and fall pDph_t->symbols must alternate,          */
		/* first is rise    									  */
		/* If syllable will have rise, stress pulse, & fall, it   */
		/* is best to specify them in that order, i.e. [/'\a] 	  */
		/* HAT_F0_SIZES_SPECIFIED:  e.g. [/'<,12>\<,40>a]         */
		/* Example: use normal hat rise, 12 Hz stress impulse,    */
		/* and 40 Hz hat fall, times of events are normal 		  */
		/* Disable prediction of where to insert hat rises &      */
		/* falls if there are [/] and [\] pDph_t->symbols         */
		/* present, or     										  */
		/* if ['] has an attached user f0 command         		  */
		/* Override computed values for hat rise, fall, and       */
		/* stress pulses if a user-specified f0 command is        */
		/* attached to [/], [\], or [']                   		  */
		/* Continue to add continuation rises at commas and       */
		/* add question intonation by rule                        */
		/* If duration attached, it is time of f0 event onset     */
		/* relative to onset of next phone (can be negative)      */
		/* F0 targets attached to [/] are step rises, attached    */
		/* to [\] are step falls, and attached to ['] are 		  */
		/* stress impulses; amount is given in nominal Hz 		  */
		/* All Hz values are subjected to spdef scalings  		  */
		/* No more than one rise, one stress pulse and one fall   */
		/* allowed on each vowel, in that order           		  */
		if (((pDph_t->symbols[n]& PVALUE) >= HAT_RISE) && ((pDph_t->symbols[n] & PVALUE)<= HAT_RF))
		{
			if (pDph_t->f0mode == NORMAL)
			{
				pDph_t->f0mode = HAT_LOCATIONS_SPECIFIED;
			}
		}

		/* Clause-final function word (preceded by [(]) should be stressed */
		if (pDph_t->symbols[n] == PPSTART)
		{
			/* Examine input for next bound, see if cbound or greater */
			m = n + 1;
			while (m < pDph_t->nsymbtot)
			{
				if (is_wboundary ( (short)(pDph_t->symbols[m] & PVALUE) ) )
				{
					if ((pDph_t->symbols[m] & PVALUE) == WBOUND)
						m++;
					if (((pDph_t->symbols[m] & PVALUE) >= COMMA)

						|| (((pDph_t->symbols[m] & PVALUE) == PPSTART) && (pDph_t->symbols[m + 1] != USP_W)))

						

					{
						pDph_t->symbols[n] = WBOUND;	/* Replace [(] by [ ] */
						/* Raise PPSTART to VPSTART to set off verbal particle */
						if ((pDph_t->symbols[m] & PVALUE) == PPSTART)
						{
							pDph_t->symbols[m]  = VPSTART;
						}
						/* Unreduce the vowel in "for, to, into" */

						if ((pDph_t->symbols[n + 1] == USP_F) && (pDph_t->symbols[n + 2] == USP_RR))
						{
							pDph_t->symbols[n + 2] = USP_OR;
						}
						if ((pDph_t->symbols[m - 2] == USP_T) && (pDph_t->symbols[m - 1] == USP_UH))
						{
							pDph_t->symbols[n + 2] = USP_UW;
						}

						if ((pDph_t->symbols[n + 1] == UKP_F) && (pDph_t->symbols[n + 2] == UKP_RR))
						{
							pDph_t->symbols[n + 2] = UKP_OR;
						}
						if ((pDph_t->symbols[m - 2] == UKP_T) && (pDph_t->symbols[m - 1] == UKP_UH))
						{
							pDph_t->symbols[n + 2] = UKP_UW;
						}

						/* Promote init secondary stress, or find V to stress */
						if (pDph_t->symbols[n + 1] == S2)
						{
							pDph_t->symbols[n + 1] = S1;	/* Replace [`] by ['] */
						}
						else
						{
							insertphone (phTTS, (short)(n + 1), S1);		/* Insert dangling ['] */
							move_stdangle (phTTS, (short)(n + 1) );	/* Move to right place */
						}
					}

if(pKsd_t->lang_curr == LANG_latin_american
   || pKsd_t->lang_curr == LANG_spanish )
{
					if ((pDph_t->symbols[m] & PVALUE) >= COMMA)
					{
						pDph_t->symbols[n]= S2;	   /* Replace [(] by [`]  */
					}
					/* Should be an insert instead   */
}
					break;
				}

				m++;
			}
		}

	
		}
//	  stzapped:


		/* Remove weaker of two boundary pDph_t->symbols in a row */
		if (((pDph_t->symbols[n] & PVALUE) >= SBOUND) && ((pDph_t->symbols[n] & PVALUE) <= EXCLAIM))
		{
/* for (m=n+1; m<pDph_t->nsymbtot; m++) out-goofs up when trying to do all at once { */

		if (pKsd_t->sprate <= 140)
		{
			if (pDph_t->symbols[n] == PPSTART)
			{
				pDph_t->symbols[n] = VPSTART;
			}
		}



		/* Every breath group must have at least one 1-stress */
		if (((pDph_t->symbols[n]& PVALUE) >= COMMA) && ((pDph_t->symbols[n]& PVALUE) <= EXCLAIM))
		{

			if ((n > 0) && (nstresses == 0))
			{
				find_syll_to_stress (phTTS, &n, nstartphrase);	/* MVP : was n and n was static */
				nstresses = 1;

			}
		}

		/* Reset to new phrase if encounter [ } , . ? ! ] */
		/* 
		 * NOTE: Phoneme RELSTART = [}] not currently defined.  When it is, 
		 * all words in FUNWRD1.DIC that introduce relative clauses, such as
		 * "when, that, which" should have [}] symbol appended to front. 
		 */
		if (((pDph_t->symbols[n] & PVALUE) >= RELSTART) && ((pDph_t->symbols[n] & PVALUE) <= EXCLAIM))
		{
			nstresses = 0;
			nstartphrase = n;
		}

		/* Exclamation point raises last stress of sentence to emphasis */
		if ((pDph_t->symbols[n] & PVALUE) == EXCLAIM)
		{
			raise_last_stress (pDph_t, n);
		}
		/* Set varaible to indicate a question sentence */
		if ((pDph_t->symbols[n] & PVALUE) == QUEST)
		{
			pDph_t->cbsymbol = TRUE;
		}
	}

if(pKsd_t->lang_curr == LANG_spanish
   || pKsd_t->lang_curr == LANG_latin_american)
{
	sp_spanish_allophonics (phTTS);
}

	/* Main loop 2: for each input symbol, pass to output array or turn into */
	/* a feature value */

	mf0 = 0;
	pDph_t->nphonetot = 0;
	word_init_sw = FALSE;
	in_rhyme = FALSE;
	pDph_t->newparagsw = FALSE;


	nsyll = 0;						   /* Monosyllabic for now          */
	syllclass = 0;					   /* Assume closed syllable     	*/
	iscoda = 0;						   /* Haven't seen vowel yet        */
	wordstress = 0;					   /* Word isn't stressed           */
	compound_destress = FALSE;

	pDph_t->hat_seen = 0;
	pDph_t->wordcount = 1;


	for (n = 0; n < pDph_t->nsymbtot; n++)
	{

		/* MGS fixed indexing problem #10190 */
		snphonetot = pDph_t->nphonetot;

		if (pKsd_t->halting)
			return (FALSE);

		curr_in_phone = pDph_t->symbols[n];
		curr_in_sym = pDph_t->symbols[n] & PVALUE;	/* Precompute useful variable */

		curr_dur = pDph_t->user_durs[n];	/* User-specified dur if non-zero */
		pDph_t->user_durs[n] = 0;

		curr_f0 = pDph_t->user_f0[n];  /* User-specified f0 if non-zero  */
		pDph_t->user_f0[n] = 0;

		/* Check to see if user-specified f0 hats/stress-pulses */

		interp_user_f0 (pDph_t, &curr_dur, &curr_f0, curr_in_sym, &mf0);

		/* Switch on the current input symbol */
				
		/* added wordclass info for AD */
		
		// CAB Removed warnings by typecast
		if ( (cp = durlookup(pDph_t, &pDph_t->symbols[n], (short *)&durdic[0])) != NULL)
		{	
			tmp=n;
			do{
			if(*cp != 0 && tmp == n)
			{
				curr_dur=*cp;
			}
			else
			{
				//need to not overide user durations
				if(pDph_t->user_durs[tmp] ==0)
				pDph_t->user_durs[tmp]=*cp;
			}
			tmp++;
			cp++;
			}
			while (*cp != -1);
		}
	
		if (curr_in_sym < MAX_PHONES)
		{							   /* A real phoneme */
			make_phone (pDph_t, curr_in_phone, n, curr_dur, curr_f0);		/* eab try handling stuff in make */

if(pKsd_t->lang_curr == LANG_spanish
   || pKsd_t->lang_curr == LANG_latin_american)
		{
			if (word_init_sw)
			{
				nsyll = countsyll (pDph_t, n); 	/* Get nbr of syllables     */
				syllclass = 0;		   			/* Setup for new syll   */
				iscoda = 0;			   			/* Haven't seen vowel   */
				wordstress = getwordstress (pDph_t,n);
				if ((phone_feature( pDph_t,  curr_in_phone) & FSYLL) IS_MINUS)
				{
					add_feature (pDph_t, FWINITC, (short)(CURRPHONE) ); // NAL warning removal

				}
				word_init_sw = FALSE;
			}
		}

			/* If syllabic, look ahead to see initial/medial/final syll */
			if ((phone_feature( pDph_t,  curr_in_phone) & FSYLL) IS_PLUS)
			{
				in_rhyme = TRUE;
				word_init_sw = FALSE;
				init_med_final (phTTS, n);

if(pKsd_t->lang_curr == LANG_spanish
   ||pKsd_t->lang_curr == LANG_latin_american)
{
				if (iscoda == 0)
				{
if(pKsd_t->lang_curr == LANG_spanish)
		syllclass = sp_getsyllclass (pDph_t, (short)(n + 1)); // NAL warning removal
if( pKsd_t->lang_curr == LANG_spanish)
					syllclass = la_getsyllclass (pDph_t, (short)(n + 1)); // NAL warning removal
					iscoda = FCODA;
				}
				add_feature (pDph_t, nsyll + syllclass + wordstress, (short)(CURRPHONE) ); // NAL warning removal
}
			}
			/* Assign stress feature to consonants */
			else
			{
				get_stress_of_conson (phTTS, n, compound_destress);
if(pKsd_t->lang_curr == LANG_spanish
   || pKsd_t->lang_curr == LANG_latin_american)
{
				/* Do we need to set "wordstress" here? */
				add_feature (pDph_t,nsyll + syllclass + iscoda, (short)(CURRPHONE) ); // NAL warning removal
}
			}
			/* Assign word-initial feature to consonant(s) */
#if defined ENGLISH || defined GERMAN 
			if (word_init_sw == TRUE)
			{
				add_feature (pDph_t, FWINITC, (short)(CURRPHONE)); // NAL warning removal
			}
#endif // efined ENGLISH || defined GERMAN

			/* Assign boundary type to segments of rhyme */
			if (in_rhyme == TRUE)
			{
				get_next_bound_type (phTTS, n);
			}
		}
		else
		{							   /* A non-phoneme */
			switch (curr_in_sym)
			{
/* Per Oliver this code allows for vowels before double consonants to have a faster duration
	BATS 709	EAB 7/2/98*/

			case DOUBLCONS:

				add_feature (pDph_t, FDOUBLECONS, NEXTPHONE);
				break;

			case S1:

					add_feature (pDph_t, FSTRESS_1, NEXTPHONE);

#ifdef MSDBG8
				printf ("add_feature(FSTRESS_1,NEXTPHONE)\n");
#endif
		 		break;
			case S2:

				add_feature (pDph_t, FSTRESS_2, NEXTPHONE);

#ifdef MSDBG8
					printf ("add_feature(FSTRESS_2,NEXTPHONE)\n");
#endif
				break;

			case S3:
				/* 
				 * This is being used in the spanish as a marker for ", which causes 
				 * the next clause to be treated differently didn't use feature
				 * bits because there is now room for S3 
				 */
				phrase_after_quote = 1;

				break;

			case SEMPH:
				
				add_feature (pDph_t, FEMPHASIS, NEXTPHONE);

#ifdef MSDBG8
				printf ("add_feature(FEMPHASIS,NEXTPHONE\n");

#endif

				break;
			case HYPHEN:
				compound_destress = FALSE;
			case MBOUND:

			case SBOUND:

				add_feature (pDph_t, FISBOUND, (short)(CURRPHONE) ); // NAL warning removal
				add_feature (pDph_t, FSBOUND, (short)(CURRPHONE) ); // NAL warning removal
				iscoda = 0;
				syllclass = 0;
				break;


			case WBOUND:

				pDph_t->number_words++; /* EAB Let's count  up the number of words*/
				doneit =0;
					/* eab AT slow speaking rate insert a glottal stop that later 
				gets it's timing adjusted and voicing reduced*/
				
				word_init_sw = TRUE;
					/* eab AT slow speaking rate insert a glottal stop that later 
				gets it's timing adjusted and voicing reduced*/

				if(pKsd_t->sprate <115)
//					insertphone (phTTS, (short) (n+1), USP_Q);


				


if(pKsd_t->lang_curr == LANG_latin_american
   || pKsd_t->lang_curr == LANG_spanish )
{
/* printf("at boun  %d \n ",n); */
				if (n > 1)
				{
					add_feature (pDph_t, FISBOUND, (short)(CURRPHONE) ); // NAL warning removal
				}
}
				break;
			case PPSTART:
						word_init_sw = TRUE;
				//	add_feature (pDph_t, FPPNEXT, (short)(CURRPHONE) ); 
						break;
			case VPSTART:
						word_init_sw = TRUE;
					//	add_feature (pDph_t, FVPNEXT, (short)(CURRPHONE) ); 
						break;
			case RELSTART:
				word_init_sw = TRUE;
if(pKsd_t->lang_curr == LANG_english)
{
				if (pDph_t->symbols[n + 1] == HYPHEN)
				{
					break;			   /* xxx here to allow compound noun insert */
				}
}
				word_init_sw = TRUE;
				nsyll = 0;
				compound_destress = FALSE;

				break;

				case COMMA:
				pDph_t->clausetype = COMMACLAUSE;
				pDph_t->clausenumber++;
					pDph_t->dcommacnt++;
				if(pDph_t->dcommacnt > 1 || pDph_t->number_words > 4)
				{
					pDph_t->clausetype = DECLARATIVE;
				}
if(pKsd_t->lang_curr == LANG_spanish)
{
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, (short)(CURRPHONE) ); // NAL warning removal
				}
            	nsyll=0;
}
				make_phone (pDph_t, GEN_SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			case PERIOD:
			pDph_t->clausetype = DECLARATIVE;
			add_feature (pDph_t, FSENTENDS, NEXTPHONE);
			pDph_t->clausenumber=0;
if(pKsd_t->lang_curr == LANG_latin_american
   || pKsd_t->lang_curr == LANG_spanish )
{
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, (short)(CURRPHONE) ); // NAL warning removal
				}
            	nsyll=0;
}
				add_feature (pDph_t, FSENTENDS, NEXTPHONE);
				make_phone (pDph_t, GEN_SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			case EXCLAIM:
			pDph_t->clausetype = EXCLAIMCLAUSE;
			pDph_t->clausenumber=0;
if(pKsd_t->lang_curr == LANG_latin_american
   || pKsd_t->lang_curr == LANG_spanish )
{
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, (short)(CURRPHONE) ); // NAL warning removal
				}
            	nsyll=0;
}
				make_phone (pDph_t, GEN_SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
				
			case QUEST:          			
			pDph_t->clausetype = QUESTION;
			pDph_t->clausenumber=0;
if(pKsd_t->lang_curr == LANG_latin_american
   || pKsd_t->lang_curr == LANG_spanish )
{
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, (short)(CURRPHONE) ); // NAL warning removal
				}
            	nsyll=0;
}
				make_phone (pDph_t, GEN_SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;


			case HAT_RISE:
				pDph_t->hat_seen++;
			
				add_feature (pDph_t, FHAT_BEGINS, NEXTPHONE);

#ifdef MSDBG8
				printf ("add_feature(FHAT_BEGINS,NEXTPHONE)\n");
#endif
				break;
			case HAT_FALL:

				pDph_t->hat_seen++;

				add_feature (pDph_t, FHAT_ENDS, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FHAT_ENDS,NEXTPHONE)\n");
#endif
				break;

			case HAT_RF:
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* german DECtalk uses also HAT_RF                   					  */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				pDph_t->hat_seen++;
				add_feature (pDph_t, FHAT_ROOF, NEXTPHONE);
				break;

			case BLOCK_RULES:
				add_feature (pDph_t, FBLOCK, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FBLOCK,NEXTPHONE)\n");
#endif
				break;
			case NEW_PARAGRAPH:
				add_feature (pDph_t, PRESSBOUND, NEXTPHONE);
				add_feature (pDph_t, PRESSBOUND, pDph_t->nphonetot+1);
				pDph_t->newparagsw = TRUE;
				break;
			default:
				break;
			}
		}
		if ((pDph_t->nphonetot == snphonetot))	/* eab */
		{
#ifdef MSDOS
			adjust_index ((n + 1), -1, 0);	/* eab n+1 to bind forward */
#else
			adjust_index (pKsd_t, (n + 1), -1, 0);	/* eab n+1 to bind forward */
#endif
#ifdef DEBUGIND

			printf ("adj -1 on %d %d \n", curr_in_sym, (n + 1));
#endif
		}
	}
	return (TRUE);
}	// pbsort()

/*
 *      Function Name: interp_user_f0()      
 *
 *  	Description: 
 *
 *      Arguments:	PDPH_T pDph_t, 
 *					short *psCurr_dur, 
 *					short *psCurr_f0,
 *					short curr_in_sym, 
 *					short *psMf0 
 *
 *      Return Value: void 
 *
 *      Comments:
 *
 */

static void interp_user_f0 (PDPH_T pDph_t, short *psCurr_dur, short *psCurr_f0,
				short curr_in_sym, short *psMf0)
{
	/* If attached to a 1-stress symbol, dur,f0 mean stress-impulse commands */

	if (((curr_in_sym == S1) || (curr_in_sym == SEMPH)
		|| (curr_in_sym == HAT_RISE) || (curr_in_sym == HAT_FALL))
		&& (pDph_t->f0mode != PHONE_TARGETS_SPECIFIED)
		&& (pDph_t->f0mode != SINGING))
	{
		if ((*psCurr_f0 != 0) || (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED))
		{
			/* Truncate f0 gestures that are unreasonable */
			if (*psCurr_f0 < 0)
				*psCurr_f0 = -(*psCurr_f0);
			if (*psCurr_f0 > 199)
				*psCurr_f0 = 199;	   /* Should be about 50 */
			/* Attach flags to identify what kind of f0 gesture */
			if (curr_in_sym == HAT_RISE)
				*psCurr_f0 += 200;
			else if (curr_in_sym == HAT_FALL)
				*psCurr_f0 += 400;
			else
				*psCurr_f0 += 1000;
			pDph_t->user_f0[*psMf0] = *psCurr_f0;
			pDph_t->user_offset[*psMf0] = *psCurr_dur;
			*psCurr_dur = 0;
			*psCurr_f0 = 0;
			pDph_t->f0mode = HAT_F0_SIZES_SPECIFIED;
		}
		/* mf0 counts # of HAT_RISE, HAT_FALL, S1, & SEMPH pDph_t->symbols */
		(*psMf0)++;
	}
	/* Otherwise, they are note commands for singing, or f0 targets for segs */
	else if (*psCurr_f0 != 0)
	{
		if (pDph_t->f0mode != HAT_F0_SIZES_SPECIFIED)
		{
			if ((pDph_t->f0mode != PHONE_TARGETS_SPECIFIED)
				&& ((*psCurr_f0%1000) <= 37))
			{
				pDph_t->f0mode = SINGING;
			}
			else if (pDph_t->f0mode != SINGING)
			{
				pDph_t->f0mode = PHONE_TARGETS_SPECIFIED;
			}
			else
			{

#ifdef DEBUG_USER_PROSODICS
				printf (
						   "ERROR in PHSORT: f0 commands for singing and phoneme-targets intermixed\n");
#endif
#ifndef TOMBUCHLER
				*psCurr_dur = 0;
				*psCurr_f0 = 0;
#endif
			}
		}
		else
		{

#ifdef DEBUG_USER_PROSODICS
			printf (
					   "ERROR in PHSORT: f0 commands for phonemes and stress/hat pDph_t->symbols intermixed\n");
#endif

			*psCurr_dur = 0;
			*psCurr_f0 = 0;
		}
	}
}
 
/*
 *      Function Name: is_wboundary()      
 *
 *  	Description:	If symbol passed as argument is a word boundary or a 
 *						stronger boundary, 
 * 						return TRUE, otherwise return FALSE  
 *
 *      Arguments: short symb
 *
 *      Return Value: int; 
 *						TRUE
 *						FALSE
 *
 *      Comments:
 *
 */

static int is_wboundary (short symb)
{
	if ((symb >= WBOUND) && (symb <= EXCLAIM))
	{
		return (TRUE);
	}
	return (FALSE);
}
 
/*
 *      Function Name: insertphone()      
 *
 *  	Description: Insert a phoneme 'fone' at location 'loc', push down all future phones
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, 
 *				   short loc, 
 *				   short fone 
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void insertphone (LPTTS_HANDLE_T phTTS, short loc, short fone)
{
	short                   m;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	if (pDph_t->nsymbtot >= NPHON_MAX)
		return;						   /* No room, do nothing */
	for (m = pDph_t->nsymbtot; m > loc; m--)
	{
		pDph_t->symbols[m]  = pDph_t->symbols[m - 1];
		pDph_t->user_durs[m] = pDph_t->user_durs[m - 1];	/* Push down */
		pDph_t->user_f0[m] = pDph_t->user_f0[m - 1];	/* user dur/f0 */
	}
	pDph_t->symbols[loc] = fone;
		pDph_t->user_durs[loc] = 0;
	pDph_t->user_f0[loc] = 0;
	pDph_t->nsymbtot++;
	if (fone != S1) {				/* KSB - Fixed for index marks */
#ifdef MSDOS
		adjust_index ((loc + 1), 1, 0);
#else
		adjust_index (pKsd_t, (loc + 1), 1, 0);
#endif
	}
#ifdef DEBUGIND
	printf ("loc %d pDph_t->nsymbtot %d \n", loc, pDph_t->nsymbtot);
	printf ("adj +1 inserting %d \n", fone);
#endif
	return;
}
 
/*
 *      Function Name: raise_last_stress()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, short msym
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void raise_last_stress (PDPH_T pDph_t, short msym)
{
	short m;

	for (m = msym - 1; m > 0; m--)
	{
		if ((pDph_t->symbols[m] & PVALUE) == S1)
		{
			pDph_t->symbols[m] = SEMPH;
			return;
		}
	}
}
 
/*
 *      Function Name: zap_weaker_bound()      
 *
 *  	Description: Args point to two boundary markers in pDph_t->symbols[].  
 *					 Zap weaker of two 
 * 					 and promote first one if weaker 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, short msym1, short msym2
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void zap_weaker_bound (LPTTS_HANDLE_T phTTS, short msym1, short msym2)
{
	/* short m; *//* MVP :Unreferenced variable */
	//PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	if (pDph_t->symbols[msym1] < pDph_t->symbols[msym2])
	{
		pDph_t->symbols[msym1] = pDph_t->symbols[msym2];	/* Boundarys can't have */
		if (pDph_t->symbols[msym1] != HYPHEN)
			delete_symbol (phTTS, msym1);
		return;

	}
	/* user durs or f0 */
	if (pDph_t->symbols[msym2] != HYPHEN)
		delete_symbol (phTTS, msym2);
}
 
/*
 *      Function Name: delete_symbol()      
 *
 *  	Description: Delete the input symbol in position msym of array pDph_t->symbols[] 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, short msym
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void delete_symbol (LPTTS_HANDLE_T phTTS, short msym)
{
	short                   m;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

#ifdef DEBUGIND
	printf ("adj -1 del sym %d at %d \n ", pDph_t->symbols[msym], msym);
#endif
	pDph_t->nsymbtot--;
	pDphsettar->did_del = 1;
	for (m = msym; m < pDph_t->nsymbtot; m++)
	{
		pDph_t->symbols[m] = pDph_t->symbols[m + 1];
		pDph_t->user_durs[m] = pDph_t->user_durs[m + 1];	/* If deleted sym has dur or */
		pDph_t->user_f0[m] = pDph_t->user_f0[m + 1];	/* f0, it will be lost */
	}
#ifdef DEBUGIND

	WAIT_PRINT;
	printf ("\n sym num %d   ", msym);
	printf ("now %d  \n\n ", pDph_t->symbols[msym]);
	SIGNAL_PRINT;
#endif
#ifdef MSDOS
	adjust_index (msym + 1, -1, 1);
#else
	adjust_index (pKsd_t, msym + 1, -1, 1);
	/* 
	 * plus one because index may be pointing at this
	 * very one in which case it promotes forward (i.e. stays the same) 
	 */
#endif
}
 


short  *durlookup(PDPH_T pDph_t,short *symbol , short table[])
{
	short *lp;
	/* GL 03/20/1998, BATS#633  use "unsigned char" instead of "char" */
	short  	*cp;
	short  	*tp;
	int   	len;

	tp = &table[0];                 /* Start at the start.  */
	while ((len = *tp++) != 0) 
	{            					/* 0 => end of table.   */
		lp = symbol;              
		cp = tp;                    /* Start of text.       */
		for (;;) 
		{
			if (*lp != *cp++)         /* Lose match process   */
				break;
			if (*lp == GEN_SIL)         /* Input string end reached   */
				break;
			if (*cp == EOS)           /* Win.                 */
            {
                 return (++cp);    	/* Return phonemes.     */
            }
			++lp;
		   
		}
		tp += len;                  /* Next.                */
	}
	return (NULL);
}
 





/*
 *      Function Name: make_phone()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short phoname, 
 *				   short n,
 *				   short curr_dur, 
 *				   short curr_f0
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void make_phone (PDPH_T pDph_t, short phoname, short n,
			short curr_dur, short curr_f0)
{

	if (pDph_t->nphonetot > n)
	{

		return;
	}
	/* Put phoneme away */
	pDph_t->phonemes[pDph_t->nphonetot] = phoname;
	pDph_t->user_durs[pDph_t->nphonetot] = curr_dur;	/* Move user-specified dur */
	if (pDph_t->f0mode != HAT_F0_SIZES_SPECIFIED)
	{
		pDph_t->user_f0[pDph_t->nphonetot] = curr_f0;	/* Move user-specified f0 */
	}

#ifdef DEBUG_USER_PROSODICS
	if (curr_dur != 0)
	{
		printf ("\tFound user_dur[%s] = %3d ms in PHSORT\n",
				phprint (phoname), curr_dur);
	}
	if (curr_f0 != 0)
	{
		printf ("\tFound  pDph_t->user_f0[%s] = %3d Hz in PHSORT, pDph_t->f0mode = %d\n",
				phprint (phoname), curr_f0, pDph_t->f0mode);
	}
#endif

	/* tag this index */

	/* set_index_phone(n,nphonetot); */
	/* See if there is room for next phoneme */
	if (pDph_t->nphonetot < NPHON_MAX)
		pDph_t->nphonetot++;
#ifdef DEBUGIND

	printf ("tot= %d phoname=%d \n ", pDph_t->nphonetot, phoname);
#endif
}
 
/*
 *      Function Name: add_feature()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short feaname, 
 *				   short location
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void add_feature (PDPH_T pDph_t, long feaname, short location)
{
	if ((location < 0) || (location >= NPHON_MAX))
	{
		return;
	}
	if ((feaname <= 0) || (feaname > FMAXIMUM))
	{
		return;
	}                                          

	/* Do it */
	pDph_t->sentstruc[location] |= feaname;

}
/* * * * * * * * * * * * * * * * end of ph_sort.c**** * * * * * * * * * * * * * * * * */

__inline short phone_feature(PDPH_T pDph_t, int phone)
{
	return(all_featb[phone>>8][phone &0xFF]);
/* *****************************************************************/
#if 0
	//PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	//PDPH_T                  pDph_t = phTTS->pPHThreadData;
	//PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
//#include "ph_def.h"
extern short us_featb[];
extern short uk_featb[];
extern short gr_featb[];
extern short la_featb[];
extern short sp_featb[];
extern short fr_featb[];

	int tmp;
	tmp = phone & PFONT;
	if((phone & PVALUE) >= 100 )
		return(0);
	phone= phone & PVALUE;
	if(tmp == PFUSA<<PSFONT)
	{
		return(us_featb[phone]);
	}
	else if(tmp == PFUK<<PSFONT)
	{
		return(uk_featb[phone]);
	}
	else if(tmp == PFGR<<PSFONT)
	{
		return(gr_featb[phone]);
	}
	else if(tmp == PFLA<<PSFONT)
	{
		return(la_featb[phone]);
	}
	else if(tmp == PFSP<<PSFONT)
	{
		return(sp_featb[phone]);
	}
	else if(tmp == PFFR<<PSFONT)
	{
		return(fr_featb[phone]);
	}
	else 
	{
#ifdef _DEBUG
	printf("OH MY GOD! THEY'VE KILLED JENNY\n");
#endif
	return(us_featb[phone]);
	}
#endif // 0
/* *****************************************************************/
}



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
 *    File Name:    p_sp_tim.c
 *    Author:		Matthew Schnee
 *    Creation Date:06-Jun-1996
 *
 *    Functionality:
 *		Spanish DURATION RULES
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK 		09/01/1984	    Initial creation
 * 0002 DGC		12/27/1984		Modified for the 80186.
 * 0003 DGC		01/02/1985	    Added some conditional calls to the "mstofr"
 *                      		routine. Some of the conversions from MS to
 *                      		frames caused overflow on 16 bit machines.
 * 0004 DK		02/26/1985    	[nt] cluster too long
 * 0005 DK		03/18/1985     	period pause and comma pause code had a bug
 
 * 0006 MM		04/02/1985    	68000 hacks.
 * 0007 MM		05/29/1985     	Stuffed in the grotesque Spanish code.
 * 0008 GL		02/13/1996     	make sure pDph_t->allodurs[] will not go below zero.
 * 0009 MGS		06/06/1996		Moved spanish phtiming to here
 * 0010 SIK		07/12/1996  	Cleaning up and maintenance                    
 * 0011 EDB 	12/10/1996		Many changes...
 * 0012 EDB		01/10/1997		Add "NOTYET" block. 
 * 0013 EAB		10/12/97        Added typing mode and remove obsolete prphdurs debug routine
 * 0014 EDB		10/19/1997	    use phTTS handler to replace pDph_t
 * 0015 EAB		5/12/98		    BATS 660 Fastalk alignment and SLOWTALK e_q lengthening
 *
 */
                               
/* Tables located in PHROM.C */
extern short            place[];	   /* Phonetic "place" features */

#define   FVDSTOP (FVOICD+FOBST+FPLOSV+FCONSON+FBURST)

/* 
 * Some extra percentages:
 */


/* 
 * This table contains durations for rule 2.
 */
static short            dur_2_tab[] =
{
	N100PRCNT,						   /* Monosyllabic   */
	N80PRCNT,						   /* Bisyllabic     */
	N75PRCNT,						   /* Trisyllabic    */
	N67PRCNT						   /* Multisyllabic  */
};

/* 
 * This table contains durations for rule 3A.
 */

static short            dur_3a_tab[] =
{
	/* Decreased all unstressed (no boundary) by 20%                  		   */
	N80PRCNT,						   /* unstressed, closed, no boundary next */
	N95PRCNT,						   /* unstressed, closed,    boundary next */
	N65PRCNT,						   /* unstressed,   open, no boundary next */
	N90PRCNT,						   /* unstressed,   open,    boundary next */
	/* Increased all stressed by 10%                                  		   */
	N117PRCNT,						   /* stressed, closed, no boundary next   */
	N132PRCNT,						   /* stressed, closed,    boundary next   */
	N120PRCNT,						   /* stressed,   open, no boundary next   */
	N160PRCNT						   /* stressed,   open,    boundary next   */
};


/* 
 * Rule 4a is a mess.  The tables are as follows:
 *      con_4a_class[]          Classifies each consonant into one
 *                              of six rule types.  The values are random
 *                              (they follow the original rule encoding).
 *      dur_4a_tab[]            Each rule type gives different values
 *                              for two "special" vowels, and for the others.
 *                              This table is indexed by the con_4a_class[]
 *                              code.
 * For example, suppose the sequence is [O CH] in an open syllable.
 * con_4a_class[CH] gives 2.
 * tst_4a_tabl[2].v1 equals [O] and the syllable is open, so the
 * duration index is set to 2 and the duration is thus
 * tst_4a_tab[2].dur[2].
 *
 * The values have the following "meaning":
 * 0    SON2 and NASAL (nasals)
 * 1    SON2 and not NASAL (Lateral and liquid)
 * 2    CH
 * 3    R
 * 4    OBST and PLOSIV (occlusives)
 * 5    OBST and not PLOSIV (voiceless fricitives)
 * 6    Not OBST (voiced fricitives)
 */

static short            con_4a_class[E_PH - E_WX + 1] =
{
	6, 6,							   /* WX YX                 	*/
	6, 1, 1, 0, 0, 0, 5, 5,			   /* RR  L LL  M  N NH  F  S   */
	5, 5, 6, 6, 6, 6, 4, 4,			   /* J TH BH DH GH YH  P  B    */
	4, 4, 4, 4, 2, 5, 3, 6,			   /* T  D  K  G CH  Y  R  Q    */
	6, 5, 0, 5, 6, 0, 5				   /* Z  W NX SH  V MX PH       */
};

/* 
 * durations in dur_4a_tab are organized as follows:
 * 0    not v1 or v2,   open syllable
 * 1    not v1 or v2, closed syllable
 * 2        v1 or v2,    open syllable
 * 3        v1 or v2,  closed syllable
 */

struct rule_4a
{
	short                   v1, v2;	   /* Special vowels */
	short                   dur[4];	   /* Durations      */
};

static struct rule_4a   dur_4a_tab[7] =
{
	  /* 0 */ 
 {E_U, E_I, N97PRCNT, N92PRCNT, N100PRCNT, N90PRCNT},
	  /* 1 */ 
 {E_U, E_I, N100PRCNT, N87PRCNT, N100PRCNT, N90PRCNT},
	  /* 2 */ 
 {E_O, E_U, N115PRCNT, N80PRCNT, N90PRCNT, N97PRCNT},
	  /* 3 */ 
 {E_A, E_E, N115PRCNT, N120PRCNT, N97PRCNT, N107PRCNT},
	  /* 4 */ 
 {E_I, E_E, N110PRCNT, N82PRCNT, N90PRCNT, N97PRCNT},
	  /* 5 */ 
 {E_I, E_E, N115PRCNT, N80PRCNT, N100PRCNT, N90PRCNT},
	  /* 6 */ 
 {E_A, E_O, N95PRCNT, N105PRCNT, N100PRCNT, N87PRCNT}
};

static short            dur_6_tab[8] =
{
	  /* unstressed   stressed  */
	  /* mono- or bisyllabic    */
	N82PRCNT, N100PRCNT,			   /* I _          */
	N87PRCNT, N100PRCNT,			   /* U _          */
	  /* tri-  or multisyll.    */
	N74PRCNT, N90PRCNT,				   /* I _          */
	N78PRCNT, N90PRCNT				   /* U _           */
};


void phtiming (LPTTS_HANDLE_T phTTS)
{
	int                     stcnt = 0;
	int                     syldur = 0;
	int                     ncnt = 0;
	int                     endcnt = 0;
	int                     vowcnt = 0;
	int                     adjust = 0;
	int                     index;	   /* Table pointer */
	int                     temp;
	struct rule_4a         *tp;
	short                   strucsylcur=0;	/* Syllable structure     */
	short                   strucopensyl=0;	/* TRUE if open syllable  */
	short					arg1,arg2,arg3;	/* arguments for the phmath routines. */

	short                   psonsw = 0, posvoc = 0;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	short                   emphasissw = FALSE;		/* Made local and initialized */
	short                   pholas = SIL;			/* Made local and initialized */
	short                   struclas = 0;			/* Made local and initialized */
	short                   fealas = featb[SIL];	/* Made local and initialized */
	short                   prcnt = 0, durinh = 0, durmin = 0, deldur = 0, nphon = 0;
	short                   phocur = 0, feacur = 0, feasyllabiccur = 0;
	short                   struccur = 0, strucboucur = 0, strucstresscur = 0;
	short                   strboulas = 0;
	short                   dpause = 0;
#ifdef NEWTYPING_MODE
	short					numbersonor;
	short					minsize;
#endif
	/* Initialization  (Set pDphsettar->sprat1,pDphsettar->sprat2, zero counters, print debug) */

	init_timing (phTTS);

	
	
#ifdef NEWTYPING_MODE

	numbersonor=0;
	for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
	{
		feacur=featb[pDph_t->allophons[nphon]];
		if((feacur & FSONOR) IS_PLUS && pDph_t->allophons[nphon] != SIL)
			numbersonor +=1;
	}
#endif
/* MAIN LOOP, for each output phoneme */

	for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
	{
		if (nphon > 0)
		{
			pholas = pDph_t->allophons[nphon - 1];
			struclas = pDph_t->allofeats[nphon - 1];
			strboulas = struclas & FBOUNDARY;
			fealas = featb[pholas];
		}
		/* printf("the current phone is %d ",nphon);   */
		/* dologphoneme(pDph_t->allophons[nphon],0,0); */
		/* printf("\n"); */
		/* printf(" alp %d at %d has struc %o \n",pDph_t->allophons[nphon],nphon,pDph_t->allofeats[nphon]); */
		/* printf("pDph_t->user_durs[%d] =%d \n",nphon,pDph_t->user_durs[nphon]); */
		phocur = pDph_t->allophons[nphon];
		struccur = pDph_t->allofeats[nphon];
		strucboucur = struccur & FBOUNDARY;
		feacur = featb[phocur];
		feasyllabiccur = feacur & FSYLL;	/* TRUE if +FSYLL      */
		strucstresscur = struccur & FSTRESS;
		strucsylcur = struccur & FTYPESYL;
		strucopensyl = struccur & FOPEN_SYL;

		/* printf("struc=%d bou=%d stress=%d syl=%d open=%d\n",struccur,strucboucur,strucstresscur,strucsylcur,strucopensyl); */
		/* printf("feacur=%d feasyl=%d user_durs[%d]=%d\n",feacur,feasyllabiccur,nphon,pDph_t->user_durs[nphon]); */
		
		if (nphon < (pDph_t->nallotot - 1))
		{
			pDphsettar->phonex_timing = pDph_t->allophons[nphon + 1];
			pDphsettar->strucnex = pDph_t->allofeats[nphon + 1];
			pDphsettar->feanex = featb[pDphsettar->phonex_timing];
		}
		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
		/* Duration Rules                         						   */
		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

		/* Use user-specified duration if one exists.                      */
		/* User durations can be huge; call the conversion routine.        */
		if (pDph_t->user_durs[nphon] != 0)
		{
			pDphsettar->durxx = mstofr (pDph_t->user_durs[nphon] + 4);

			goto break3;
		}                    
		/* printf("AAAA"); */
	
		/* Convert inherent and minimum duration in msec to frames.       */
		/* Fixed overflow in 16 bits is not possible on these ones.       */
		durinh = mstofr (inhdr[phocur]);
		durmin = mstofr (mindur[phocur]);
		/* Additive increment */
		deldur = 0;
		/* Multiplicative constant (let 128 be 100%) */
		prcnt = 128;

		/* Rule 1: Pause durations depend on syntax */
		if (phocur == SIL)
		{
			/* 
			 * Clause-initial pause should be minimal, i.e. NF64MS (enough 
			 * time for initial fricative to build up amp gradually) 
			 */
			dpause = NF64MS;

			/* Treatment of other than clause-initial pauses: */
			if (nphon > 1)
			{
				/* If this clause ends in a comma, use short pause */
				if (strboulas == FCBNEXT)
				{
					/* Note extra compause added if user command [:dv cp __] */
					dpause = NF_COMMA + pDph_t->compause;
				}
				/* End of clause has long pause if ends with "." "!" or "?"  */
				if ((strboulas & FSENTENDS) IS_PLUS)
				{
					/* Note extra perpause added if user command [:dv pp __] */
					dpause = NF_PERIOD + pDph_t->perpause;
				}
			}
			/* Make sentence-initial pause long if this is a new paragraph */
			else if (pDph_t->newparagsw != FALSE)
				dpause = NF_PERIOD;
			/* Effect of speaking rate greatest on pauses */
			arg1 = dpause;
			arg2 = pDphsettar->sprat1;
			dpause = mlsh1 (arg1,arg2);

			/* Minimum pause is NF64MS */
			if (dpause < NF64MS)
				dpause = NF64MS;
			/* Skip over remaining duration rules if input is SIL 	*/
			pDphsettar->durxx = dpause;
			durinh = pDphsettar->durxx;	/* for debugging print only */
			durmin = pDphsettar->durxx;
			prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 1);
			goto break3;
		}
		/* printf("BBBB"); */

		/* 
		 * Adjust minimum duration -- adjusts compressability of segments:
		 *        unstressed segments.
		 *        consonants except at clause start
		 *        voiced stop in context [_] ... [/o/ or /u/]
		 *        nasal-nasal
		 */

		/* 
		 * Out 24-Jul-86 DK-eab 2/94 eab 2/94 in again but need to add code to 
		 * avergae syallable length for syllabic timined rythm 
		 */
		if (strucstresscur IS_MINUS)
		{
			/* Non-stressed segs more compressible (except obstruents) */
			if ((durmin < durinh)
				&& ((feacur & FOBST) IS_MINUS))
			{
				pDphsettar->durxx = -NF15MS;
				durmin >>= 1;
			}
			prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 101);
		}
		if ((fealas & FCONSON) IS_PLUS
			&& strboulas < FVPNEXT)
		{
			durmin -= (durmin >> 2);
			prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 102);
		}
		else if (((feacur & FVDSTOP) == FVDSTOP)
				 && (pholas == SIL || strboulas >= FVPNEXT)
				 && (pDphsettar->phonex_timing == E_O || pDphsettar->phonex_timing == E_U))
		{
			durmin >>= 1;
			durinh -= (durinh >> 2);
			prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 103);
		}

		if ((feacur & FNASAL) IS_PLUS
			&& ((fealas & FNASAL) IS_PLUS
				|| (pDphsettar->feanex & FNASAL) IS_PLUS))
		{
			durmin -= (durmin >> 2);
			prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 104);
		}

		/* printf("CCCC"); */
		/* 
		 * Rule 2: if a syllabic segement, adjust duration dependent on
		 * the number of syllables.
		 */
		if ((feacur & FSYLL) IS_PLUS)
		{
			prcnt=mlsh1(dur_2_tab[strucsylcur >> FSYL_SHIFT],prcnt);
			prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 2);
			/* 
			 * Rule 3: (for multi-syllabics).  Modify duration based
			 * on accent, structure of the syllable, and end of word.
			 */
			if (strucsylcur != FMONOSYL)
			{
				index = 0;
				if (strucboucur >= FWBNEXT)
					index++;
				if (strucopensyl IS_PLUS)
					index += 2;
				if (strucstresscur == FSTRESS_1)
					index += 4;
				prcnt=mlsh1(dur_3a_tab[index],prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 32);
			}
			else if (strucboucur == FWBNEXT
					 && strucstresscur == FSTRESS_1)
			{
				/* 
				 * Note: this doesn't apply at clause-final position.
				 */
				prcnt=mlsh1(N125PRCNT,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 33);
			}
			if (strucstresscur == FSTRESS_2)
			{
				/* 
				 * Note: this doesn't apply at clause-final position.
				 */
				deldur = deldur + NF15MS;
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 34);
			}

			/* 
			 * Rule 4a.  Takes into account the effect of the next
			 * segment on the duration of the vowel.  See comments
			 * before the table for the gory details.
			 * Note that rule 4a actually contains three separate
			 * rules, one for stress, one for syllable structure,
			 * and one for the next phoneme class.
			 *
			 * We know that phocur is a vowel!
			 */
			if ((pDphsettar->feanex & FCONSON) IS_PLUS)
			{
				tp = &dur_4a_tab[con_4a_class[pDphsettar->phonex_timing - E_WX]];
				index = 0;
				if (tp->v1 == phocur
					|| tp->v2 == phocur)
					index += 2;
				if (strucopensyl IS_MINUS)
					index++;
				prcnt=mlsh1(tp->dur[index],prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 4);
			}
			/* 
			 * Rule 4.  Take into account phrase-final position.
			 */
			if (strucboucur >= FPPNEXT)
			{
				prcnt=mlsh1(N110PRCNT,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 41);
			}

#if 0
			/* 
			 * Removed 28-Jul-86 to make room (in structure) for
			 * the FDUMMY_VOWEL bit.  Hopefully, other timing rule
			 * changes will make it unnecessary.
			 */
			/* 
			 * Rule 4.5 Shorten vowels in function words
			 */
			if ((struccur & FFUNWORD) IS_PLUS)
			{
				prcnt=mlsh1(N80PRCNT,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 42);
			}
#endif

			/* 
			 * Rule 5.  Homorganic vowel durations.
			 */
			if ((phocur == pDphsettar->phonex_timing
				 && strucboucur < FPPNEXT
				 && (struccur & FSBOUND) IS_MINUS)
				|| (phocur == pholas
					&& strboulas < FPPNEXT
					&& (struclas & FSBOUND) IS_MINUS))
			{
				prcnt=mlsh1(((strucstresscur == FSTRESS_1)? N80PRCNT : N67PRCNT),prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 5);
			}
			/* 
			 * Rule 6. Duration of the semiconsonant on dipthongs.
			 * Rule 7. Duration of the vowel in [vowel][semivowel] dipth.
			 */
			else if ((fealas & FSEMIV) IS_PLUS)
			{
				index = 0;
				if (strucsylcur >= FTRISYL)
					index = 4;
				if (pholas == E_WX || pholas == E_W)
					index += 2;
				if (strucstresscur != FSTRESS_1)
					index++;
				prcnt=mlsh1(dur_6_tab[index],prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 6);
			}
			/* 
			 * More dipthong hacking.  Shorten the vowel if
			 * it is the first part of a dipthong (next segment
			 * is yx or wx.)
			 */
			else if (((feacur & FVOWEL) IS_PLUS)
					 && ((struccur & FSBOUND) IS_MINUS)
					 && ((pDphsettar->feanex & FSEMIV) IS_PLUS))
			{
				prcnt=mlsh1(((strucstresscur == FNOSTRESS)? N85PRCNT : N90PRCNT),prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 7);
			}
			/* 
			 * Rule 9. Unstressed vowels.
			 *
			 * An unstressed vowel in a vowel-vowel sequence is
			 * shortened if there isn't a boundary separating the
			 * two vowels.
			 *
			 * The vowel is lengthened after ~n
			 */
			if (strucstresscur == FNOSTRESS)
			{
				if ((((pDphsettar->feanex & FSYLL) IS_PLUS)
					 && ((pDphsettar->strucnex & FSBOUND) IS_MINUS)
					 && (strucboucur == FNO_BOUNDARY))
					|| (((fealas & FSYLL) IS_PLUS)
						&& ((struccur & FSBOUND) IS_MINUS)
						&& (strboulas == FNO_BOUNDARY)))
				{
					prcnt=mlsh1(N60PRCNT,prcnt);
					prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 9);
				}
			}
			/* 
			 * Lengthen all vowels after ~n                4-Feb-86
			 */
			if (pholas == E_NH)
			{
				prcnt=mlsh1(N125PRCNT,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 91);
			}
		}
		/* End of vowel rules             */
		/* printf("DDDD"); */
		
		if ((feacur & FCONSON) IS_PLUS)
		{
			/* 
			 * Consonant rules.
			 */
			if (phocur == E_S)
			{
				/* 
				 * Rule 10. adjust duration of [s].
				 */
				temp = N100PRCNT;
				if ((strucopensyl IS_PLUS)			/* Open syll.      */
					|| (strucsylcur != FMONOSYL		/* or end of       */
						&& strucboucur >= FWBNEXT))	/* multi-syll.     */
					temp = N92PRCNT;
				else if ((strucopensyl IS_MINUS)
						 && strucboucur < FWBNEXT)
					temp = N70PRCNT;
				if ((pDphsettar->feanex & FPLOSV) IS_PLUS)
				{
					temp = N47PRCNT;
					durmin = durmin >> 1;
				}
				prcnt=mlsh1(temp,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 10);
			}
			else if (phocur == E_R || phocur == E_RR)
			{
				/* 
				 * Rule 11. Set duration for /r/ and /rr/.
				 * R  before boundary or consonant is longer.
				 * R  otherwise is a short trill, except after
				 *      certain consonants, where it is a flap.
				 * RR lengthens before boundary.
				 *
				 * Word-init RR is about one trill shorter. 28-Jul-86
				 */
				temp = N100PRCNT;
				if (phocur == E_R)
				{
					if ((strucboucur >= FMBNEXT)
						|| ((pDphsettar->feanex & FCONSON) IS_PLUS))
						temp = N150PRCNT;
					else if (pholas == E_S
							 || pholas == E_J
							 || pholas == E_TH)
						temp = N60PRCNT;
				}
				else
					/* if (phocur == E_RR) */
				{
					if (strucboucur >= FMBNEXT)
						temp = N120PRCNT;
					else if ((struccur & FWINITC) IS_PLUS)
						deldur -= NF30MS;
				}
				prcnt=mlsh1(temp,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 11);
			}
			else if ((phocur == E_L || phocur == E_N)
					 && (strucopensyl IS_PLUS))

			{

				/* 
				 * Rule 12.  Adjust duration of [l] and [n]
				 * in open syllables.
				 */

				/* percentage(N85PRCNT); */

				prcnt=mlsh1(N105PRCNT,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 12);
			}
			else if ((feacur & FSONOR) IS_MINUS)
			{
				/* 
				 * Rule 13. Adjust durations for all voiceless
				 * consonants except [s]:
				 * Shorten after N                          28-May-86
				 * Shorten unstressed after sonorants       23-Jul-86
				 * in unstressed syllable, but not after
				 * silence.
				 */
				temp = N100PRCNT;
				if ((pholas == E_N)
					&& (feacur & FBURST) IS_PLUS)
					temp = N70PRCNT;
				else if (((feacur & FBURST) IS_PLUS)
						 && (((fealas & FSONOR) IS_PLUS) && pholas != SIL)
						 && (strucstresscur == FNOSTRESS))
					temp = N70PRCNT;
				else if ((pDphsettar->phonex_timing == E_R || pDphsettar->phonex_timing == E_L)
						 && (strucopensyl IS_PLUS))
					temp = N90PRCNT;
				else if (strucopensyl IS_MINUS)
					temp = N110PRCNT;
				prcnt=mlsh1(temp,prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 13);
			}
			/* 
			 * New geminate rule (first try)
			 * Rule 14.  Adjust durations for geminates.
			 */
			if ((phocur == pDphsettar->phonex_timing
				 && strucboucur < FPPNEXT
				 && (struccur & FSBOUND) IS_MINUS)
				|| (phocur == pholas
					&& strboulas < FPPNEXT
					&& (struclas & FSBOUND) IS_MINUS))
			{
				prcnt=mlsh1(((strucstresscur == FSTRESS_1)? N80PRCNT : N67PRCNT),prcnt);
				prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 14);
			}
			/* 
			 * Lengthen [m], [n], but not ~n in the context
			 *     _ [phrase_final]
			 * Nasal rule (hack): shorten nasal in / ... [-syll, -stop]
			 * Rearranged above so phrase final [n] lengthens. 13-May-86
			 * Don't shorten [n] before [ptk]              28-May-86
			 */
			if ((feacur & FNASAL) IS_PLUS)
			{
				if ((phocur != E_NH)
					&& ((struccur & FBOUNDARY) >= FVPNEXT))
				{
					prcnt=mlsh1(N125PRCNT,prcnt);
					prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 15);
				}
				else if ((pDphsettar->feanex & (FSYLL | FBURST)) == 0)
				{
					prcnt=mlsh1(N70PRCNT,prcnt);	/* Just a guess          */
					prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 151);
				}
				/* eab 3-94 new rule needs more verification and perhaps refinement nasal in front of plosive gets shortened */
				else if ((pDphsettar->feanex & FPLOSV) IS_PLUS)
				{
					temp = N47PRCNT;
					durmin = durmin >> 1;
					prcnt=mlsh1(temp,prcnt);
					prdurs (pDph_t, phocur, durinh, durmin, deldur, prcnt, 152);
				}
			}
			/* eab may want to adjust but looking a spectrograms we need to
			and in a pause at wourd boundary for s contexts*/
#ifdef NOTYET
			if ((featb[pDph_t->allophons[nphon+1]] & WBOUND) IS_PLUS
			&& pDph_t->allophons[nphon] == E_S )
			{
				if(pDph_t->allophons[nphon+2] == E_S
				{
					/* two ss in a row so shorten one overall actually the longest*/
					deldur=-NF30MS;
					WINprintf("found S#S\n");
				}
				else if(pDph_t->allophons[nphon+2] == E_S
				{
					/* two ss in a row so shorten one overall actually the longest*/
					deldur=-NF30MS;
					WINprintf("found S#S\n");
				}
#endif
		}
		/* End of consonant rules */
		

		/* Finish up */

		/* Set duration from durinh, durmin, and percent */
		pDphsettar->durxx = (prcnt * (durinh - durmin)) DIV_BY128;
		pDphsettar->durxx += durmin;

		/* Rule for slow speaking lengthen inserted glotal stop*/

	/* Rule for slow speaking lengthen inserted glotal stop*/
#ifdef SLOWTALK

		if(phocur == E_Q && pKsd_t->sprate< 75)
			pDphsettar->durxx = 1+((80-pKsd_t->sprate) );


#endif

	/* Rule for slow speaking lengthen inserted glotal stop*/
		/* eab 5/11/98 bats 660 */
#ifdef SLOWTALK

		if(phocur == E_Q && pKsd_t->sprate< 75)
			pDphsettar->durxx = 1+((80-pKsd_t->sprate) );

#endif

		/* Effect of speaking rate */
		if ((pDphsettar->sprat0 != 180) && (pDphsettar->durxx != 0))
		{
			arg1 = pDphsettar->durxx;
			arg2 = pDphsettar->sprat2;
			pDphsettar->durxx = mlsh1 (arg1,arg2) + 1;	/* Round upwards */

			/* Effect of speaking rate on additive increment to dur */
			arg1 = deldur;
			arg2 = pDphsettar->sprat1;
			deldur = mlsh1 (arg1,arg2);
		}
		/* Add in rule-governed additive increment to dur  */

		pDphsettar->durxx += deldur;
		/* for debuggin spanish rate stuff eab */
		/* printf("%d durmin, %d deldur\n, ",durmin,deldur); */


	  break3:


		/* Check for gross error */
		if (pDphsettar->durxx < 0)
		{
			pDphsettar->durxx = 2;
		}
		pDph_t->allodurs[nphon] = pDphsettar->durxx;	   /* Save in array for phonetic comp */
		if (pDph_t->allophons[nphon] != 0)	   			   /* don't count silence 			  */
		{
			/* printf("add %d for phon %d\n",pDphsettar->durxx,pDph_t->allophons[nphon]); 	  */
			syldur += pDphsettar->durxx;
		}
		/* 
		 * if( pDph_t->allophons[nphon] > 0 && pDph_t->allophons[nphon] <= 7 )      
		 * don't count silence 
		 */
		/* Instead of counting vowels now count sonorants */
		if ((feacur & FSONOR) IS_PLUS && pDph_t->allophons[nphon] != 0)
		{
						
			/* printf("+voe on  %d vowcnt=%d\n",pDph_t->allophons[nphon],vowcnt); */
			vowcnt++;
		}
		if ((((struccur & FISBOUND) == FISBOUND) && nphon != 0 || nphon == pDph_t->nallotot - 2))
		{
			/* printf("strucc=%o of phon %d at %d",struccur,pDph_t->allophons[nphon],nphon); */
#ifdef DEBUGPHT
#if defined (WIN32) && defined (PRINTFDEBUG)
			WINprintf (" 2fbound struccur%o, p= %d\n", struccur, pDph_t->allophons[nphon]);
			WINprintf ("syldur = %d \n ", (syldur * 64) / 10);
			WINprintf ("vowcnt=%d\n", vowcnt);
#endif
#endif
			switch (vowcnt)
			{
			case 1:

				adjust = (20 - (syldur >> 1) >> 1);
				break;
			case 2:
				adjust = ((20 - (syldur >> 1)) >> 1);
				break;
			case 3:
				/* do 3/8 instead of divide by 3 */
				adjust = ((20 - (syldur >> 1)) >> 3) * 3;
				break;
			case 4:
				adjust = ((20 - (syldur >> 1)) >> 2);
				break;
			case 5:
				adjust = ((20 - (syldur >> 1)) >> 1);
				break;

			default:

#ifdef DEBUGPHT
				printf ("WHY HERE??");
				printf ("vowcnt=%d phon= %d nphon= %d\n", vowcnt, pDph_t->allophons[nphon], nphon);
				printf ("vowcnt=%d phon= %d nphon= %d\n", vowcnt, pDph_t->allophons[nphon], nphon);
#endif
				
				/* adjust=0; */ /*turns off syllable timed rythum*/
				adjust = adjust>>1;
				break;
			}
		/* 0015 EAB     05/11/98		Added in Fasttalk time alignement feature */
			/* BATS 660 ADD FASTTALK*/
		if (pDphsettar->sprat0 <= 250) /* note above 250 sprat0=250+(sprat-250)>>1 */
			{
			adjust=0;
			}
		else if(pDphsettar->sprat0 >= 325)
			adjust=adjust>>1;
		else if(pDphsettar->sprat0 >= 250)
			adjust=adjust>>2;
		
			if (pDph_t->user_durs[nphon] != 0 || pDph_t->f0mode == SINGING)
			{
				adjust = 0;
			}

			/* printf("stcnt %d endcnt %d \n",stcnt,nphon); */

			 //adjust = 0;

			for (endcnt = nphon; stcnt - (endcnt); endcnt--)
			{
				/* dologphoneme(pDph_t->allophons[endcnt],0,0); */
				/* printf("nphon %d ",endcnt); printf("p=%d ",pDph_t->allophons[endcnt]); */

				/* printf("ph=%d ",pDph_t->allophons[endcnt]); */
				/* if( pDph_t->allophons[endcnt] <= 7 && pDph_t->allophons[endcnt] >0) */
				/* change from adjusting just vowels to any sonorant */
				

				if ((featb[pDph_t->allophons[endcnt]] & FSONOR) IS_PLUS)
				{
					/* 
					 * printf("set  %d dur %d syldur=%d adj=%d \n",
					 * pDph_t->allophons[endcnt],pDph_t->allodurs[endcnt],
					 * (syldur*64)/10,adjust); 
					 */

#ifdef DEBUGPHT
					printf ("set  %d dur %d syldur=%d adj=%d", pDph_t->allophons[endcnt], pDph_t->allodurs[endcnt], (syldur * 64) / 10, adjust);
#endif
	

					pDph_t->allodurs[endcnt] += adjust;
					/* If real short to beign with don't touch*/
					if(pDph_t->allodurs[endcnt] <=6)
					{
#ifdef DEBUGPHT
#if defined (WIN32) && defined (PRINTFDEBUG)
						WINprintf("BINGO");
#endif
#endif
						pDph_t->allodurs[endcnt]=6;
					}
					/* if(pDph_t->allodurs[endcnt] <= 5) pDph_t->allodurs[endcnt]=5; */
#ifdef DEBUGPHT
					printf ("to  %d \n", ((pDph_t->allodurs[endcnt] * NSAMP_FRAME) / 10));
#endif
					ncnt++;
				}
			}
			 	 
#if defined (WIN32) && defined (PRINTFDEBUG)
			  /* WINprintf("set  syldur from %d to %d in %d adjusts.\n",
			  ((syldur)*64)/10,((syldur+(ncnt*adjust))*64)/10,ncnt ); */
#endif
			 
			ncnt = 0;
			/* printf("-- \n"); */
			stcnt = nphon;
			/* reset slydur */
			syldur = 0;
			vowcnt = 0;

		}
		
#ifdef NEWTYPING_MODE

		if(phTTS->bInTypingMode == TRUE)
		{
			minsize= 30/numbersonor;
			if (minsize < 6)
				minsize=6;
			if((feacur & FSONOR) IS_PLUS && phocur != SIL) 
			pDph_t->allodurs[nphon]= minsize;
			else
			{

				if(pDph_t->allophons[nphon] == E_S)

				{
					pDph_t->allodurs[nphon]=5;
				}
				else
					pDph_t->allodurs[nphon]=3;
			}
		}
#endif /* typping mode*/



#if DEBUG_PHTIMING
		printf ("final dur of allodurs[%d]%d = %d\n",nphon, pDph_t->allophons[nphon], pDphsettar->durxx * 64 / 10);
		printf ("final dur of allodurs[%d]%d = %d\n",nphon, pDph_t->allophons[nphon], pDph_t->allodurs[nphon] * 64 / 10);
		printf ("user_durs[%d]=%d\n",nphon,pDph_t->user_durs[nphon]);

#endif

		if (pDph_t->allophons[nphon] == E_R && (pDphsettar->feanex & FVOWEL))
		{
			pDph_t->allodurs[nphon] -= NF25MS;
			/* make sure duration will not go to less than zero */
			if (pDph_t->allodurs[nphon] < 0)
				pDph_t->allodurs[nphon] = 2;

		}
        /* Cum dur in waveform samples     */
		pDph_t->longcumdur += (pDphsettar->durxx * NSAMP_FRAME);	   
	}
	/* post processing timing for syllable timed rythm */
	/* debug code */
    /* prphdurs (pDph_t) */	
}

                               

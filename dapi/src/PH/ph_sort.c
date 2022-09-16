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
 * 0006 MM 	04/02/1985		    68000 hacks (removed English specific code.
 * 0007 MM  04/23/1986		    Changes per suggestions from Dr. Quilis.
 * 0008 MM	05/08/1986		    Blocked 'z' rules.
 * 0009 MM  05/22/1986		    Locate function words (set FFUNWORD bit)
 * 0010 DF	06/02/1986	        DT3 updates: isemphasis -> emphasisflag
 *                       		isquestion -> cbsymbol
 *                       		nbrphone   -> nphonetot
#endif 
#ifdef GERMAN					From gphsort.c
 * 0012 BNK 24-Jul-86 			introduce german tertiary stress and add debug stuff
 * 0013	BNK 25-Sep-86 			add german sentence intonation handling
 * 0014 CJL 30-MAR-95   		File was phsort.c. Is now gphsort.c. Changed
 *								phdefs.h->gphdefs.h
 * 0015 eab 1-24-96  			I am tuning many different things rapdily so the
 * 								detailed comments are in the code.
#endif
 * 0017	MGS 06/05/1996 			Merged Spanish wth english
 * 0018 MGS 06/06/1996 			Changed file name from phsort.c to ph_sort.c 
 * 0019	MGS 06/18/1996			Merged German with English/Spanish
 * 0020 EDB 12/10/1996			Change code in German and Spanish section
 * 0021 EDB	01/10/1997			Many change. Add many Spanish code.
 * 0022 GL	03/27/1997			for BATS#270 fix German index(high light) delay problem.
 *                              The problem/fix is located by Ed bruckert
 * 0022	GL	04/21/1997			BATS#360  remove spaces before "#define" or "#if" 
 * 0023 KSB 08/19/1997			Fixed problem based on insertphone moving the index array
 *                              during the addition of S1, causes usually by find_syll_in_clause
 *                              creating a stress (BATS 445)
 * 0024 EAB 8/26/97             In anyalyzing weather forecast found that reduce from for to "fir"
                               was occuring in such contexts as For Tuesday, corrected vowel 
                                 and stress reduction. Made other general improvements for
                                 prosody improvements by providing more information
                                 for later modules.
 * 0025 EAB 10/13/97			 Edited for UK
 * 0026 EAB 10/15/97			Added more information to use later. The way the code used to work
 *								you didn't know what kind of clause it was til the end of the clause
 *								and you didn't know how long it was. I've added variables to note
 *								this information. This beongs in the base code.
 * 0027 MGS 11/20/1997           removed spaces and tabs before all #'s
 * 0028 eab 12/5/97				Added linkr code and refined the rule see comments at ends_in_r
 * 0029 MGS 12/29/1997 		removed TABS before all #'s AGAIN
 * 0030 EAB 2/5/98			Put in fix for BATS 590
 * 0031 EAB 3/20/98			Slowtalk not in base code why????
 * 0032 EAB 3/31/98			We found that p+f did a good job of creating the pf phoneme so we 
 *							added code to effect that change.
 * 0033 EAB	3/31/98			Added code to lengthen a final S sound if the word contained stress and
							also added code to reduce a primary to a secondary stress if compund destress
							was trure (second primary stress in a single word--caused when two words
							are combined with the compund word marke in between
 * 0034 EAB  4/27/98		Added several changes for German and other general chnages for new
                                intonation. The new language suff typically supplies more information to the 
				intonation code and doesn't really DO anything here....
 * 0035 MGS 5/6/1998 		removed TABS before all #'s AGAIN
 * 0036 eab 5/13/98			BATS 674 Should be inseting a glotal stop not silence 
 * 0037 EAB	5/18/98			BATS 677 Found other Spanish glotal stop problems
 * 0036 EAB	7/2/98			BATS 709 Per Oliver this code allows for vowels before double consonants to have a faster duration
 * 0037 EAB 7/14/98			BATS 711 Remove obsolete code that was useless but burning computes
 * 0038 EAB 7/14/98			Added wordclass info for AD German may use this very soon
 * 0039 EAB 8/15/98		Spanish improvements
 * 0040 EAB	9/1/98		Found bug where E_q is being at postion becuase it looks at wordclass[0-1] which is garbage.
 * 0041 EAB 9/11/98		Mark out SPANISH where it doesn't compile and improve Spanish intonation
 * 0042 EAB9/24/98		delete Spanish_out plus improved rules with Juan
 * 0043 EAB 10/15/98	Removed some spanish_out code for clarity and modified some glotal
 *			stop insertion rules for spanish
   044	EAB 10/16/98   More cleanup
 * 045  EAB 10/23/98  Eliminated use of glotal stops per info Juan found 
 *    in University of Chicago Spanish Dic(we had reduced them alot already) .
 * 046 EAB 1/19/98 Add in boiler plate code to solve problem in case a get w aord 
	that ends in R and doesn't have an r in actuality. BATS 855 However the dictionary is still broken
   047 EAB Opps doesn't drop R now becuase we assumed flag is at begiining or word not ends
   048 EAB Totally reworte the r code to encompass the safety code in case there's no r and to
   handle the other situations correctly\
   049 GL	01/27/99	BAT#860  remove the broken code that crash function words.
 * 050 EAB	2/3/99			Added change from NWSNOAA->NWS_US for multi language NOA
 * 051 EAB 2/18/99      Cleaned up SPANISH_OUT stuff
						The new code consists of smarter intonation utilizing part of speech
						etc. and the affects on stress timing on breaking previously
						"acceptable code"
 * 052 MGS 09/24/1999	removed an extra # from the file
 *
 */                
 
/* #define MSDBG7 */
/* #define MSDBG8 */
#if defined NWS_US || defined ENGLISH_UK

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
extern short featb[];	   /* Feature assignment to each phonetype */

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

static void zap_weaker_bound (LPTTS_HANDLE_T phTTS, short msym1, short msym2);

static int  is_wboundary (short symb);

static void raise_last_stress (PDPH_T pDph_t, short msym);

static void interp_user_f0 (PDPH_T pDph_t, short *psCurr_dur, short *psCurr_f0,
							short curr_in_sym, short *psMf0);

static void make_phone (PDPH_T pDph_t, short phoname, short n,
						short curr_dur, short curr_f0);

static void init_med_final (PDPH_T pDph_t, short msym);

static void get_stress_of_conson (PDPH_T pDph_t, short msym, short compound_destress);

static void add_feature (PDPH_T pDph_t, long feaname, short location);

static void get_next_bound_type (PDPH_T pDph_t, short msym);

#include "ph_sort1.c"	/* language dependent code from phsort */
#include "ph_sort2.c"	/* language dependent code for multiple languages */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: phsort()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

int phsort (LPTTS_HANDLE_T phTTS)
{
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	short                   snphonetot = 0;		/* MVP 03/19/96 changed to short from unsigned int */

	short                   n = 0, curr_dur = 0, compound_destress = 0, curr_f0 = 0;	/* MVP : Made local */
	short                   curr_in_sym = 0, word_init_sw = 0, in_rhyme = 0, m, mf0, nstresses;		/* MVP : made local */
	short                   nstartphrase = 0, Ge_ma_found_r =0;
#ifdef GERMAN 
		SENT_PARS			*pp;
		short				nextvowel=0;
		short				tmp,ntmp;
#endif
#ifdef ENGLISH_UK
	
		short				ntmp,ntmpr;
#endif
	
	pDphsettar->did_del = 0;
	pDph_t->number_words=1; /* eab init there is one less word boundary than number of 
							words*/
	/* Added for wordcalss info for AD*/
	//pDph_t->number_verbs =0 ;

#ifdef GERMAN_OBSOLETE // BATS 711 Useless compute burner
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* clear parsing structure, even if syntax() isn't called        */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	for (pp = pDph_t->pars; pp <= &pDph_t->pars[pDph_t->nsymbtot]; pp++)
	{
		pp->phopoint = 0;
		pp->wordclass = 0;
		pp->bouflag = 0;
	}
	/* for */
#endif

	/* Clear structure array */

	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		pDph_t->sentstruc[n] = 0;
	}
	pDph_t->f0mode = NORMAL;

	pDph_t->cbsymbol = 0;

	/* Main loop 1: Clean up input string re mis-orderings & extra boundaries */
	pDph_t->nphonetot = 0;
	nstresses = 0;
	nstartphrase = 0; 
	
#ifdef GERMAN
	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		if ((pDph_t->symbols[n] == S1 ||
			  pDph_t->symbols[n] == S2 ||
			  pDph_t->symbols[n] == S3)
			 && !(featb[pDph_t->symbols[n + 1]] & FVOWEL))
		{
			/* BATS 711 Slight improvement in loop performance start at n+2 not n */
			for (nextvowel = n+2; nextvowel < pDph_t->nsymbtot; nextvowel++)
			{
				if (featb[pDph_t->symbols[nextvowel]] & FVOWEL)
				{

					tmp = pDph_t->symbols[n];
					for (ntmp = n; ntmp < (nextvowel - 1); ntmp++)
					{
						pDph_t->symbols[ntmp] = pDph_t->symbols[ntmp + 1];
					}
					pDph_t->symbols[nextvowel - 1] = tmp;
					n = nextvowel;	   /* done to this point so jump ahead */
					break;
				}
			}
		}
	}

									

#endif /* #ifdef GERMAN */


	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		if (pDphsettar->did_del)
		{
			n--;					   /* delete was done so back up one to process shifted phoneme eab */
			pDphsettar->did_del = 0;
			
		}




#ifdef ENGLISH_UK
		/* linking r rule 12/3/97 eab*/
		if (pDph_t->symbols[n] == LINKRWORD)
		{
		/*EAB This is new code to tell when to drop the final R. The LINKRWORD tells us
			that it's a candididate for liason but we need to look at the ending because it could
			have s suffix. If it does end in R and the next word doesn't begin with a vowel we can
			drop it*/
			Ge_ma_found_r=0;
			ntmp=n+1;
			while (pDph_t->symbols[ntmp] <= MBOUND )
				{
					if(pDph_t->symbols[ntmp] == R )
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
					while (pDph_t->symbols[ntmp] >= 100 && ntmp <= (pDph_t->nsymbtot-2))
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
				
				if (pDph_t->symbols[ntmp] > 100 || !(featb[pDph_t->symbols[ntmp ]] & FVOWEL))
				{

					delete_symbol (phTTS, ntmpr);
				}
					

				}
				
			}
		
			
#endif
#ifdef GERMAN



		/*3/18/98 eab inhibit for R becuase we'll glotalize the r in phdraw*/
		if (pDph_t->symbols[n] == WBOUND )
			
		{
						
			
			ntmp = n;
				/* step past any non-phonemes such as stress */
			while (pDph_t->symbols[ntmp] > 100 && ntmp < pDph_t->nsymbtot)
			{
				ntmp++;
			}
			if(pDph_t->symbols[n-1] == L) && pDph_t->symbols[ntmp] == K )
			{
				insertphone (phTTS, n, Q);
			}

				/* Is next thing a vowel */
			if (featb[pDph_t->symbols[ntmp]] & FVOWEL && pDph_t->symbols[n-1] != R))
			
			{
				insertphone (phTTS, n, Q);

					/* 12/10/1996 EDB */
				n=ntmp;
			}
			
		}
		/* eab 11/95 and add glotal bewteen vowels in a word */
		/* redo code later for clealiness 12/16/96 out*/
		if (featb[pDph_t->symbols[n - 1]] & FVOWEL)
		{
			ntmp = n;
			/* step past any non-phonemes such as stress */
			while (pDph_t->symbols[ntmp] > 100 && ntmp < pDph_t->nsymbtot)
			{
				ntmp++;
			}
			/* printf(" %x %x %d %d \n",featb[symbols[ntmp]],featb[symbols[ntmp]] & FVOWEL, ntmp,symbols[ntmp]); */

			if (featb[pDph_t->symbols[ntmp]] & FVOWEL)
			{
			/* Eab We need to check this out next Tuesday with SOnia in out or modified */
			/* insertphone(n,Q); */
			/* printf("insert q\n"); */
			}
		}

#endif /* #ifdef GERMAN */
		

#if defined ENGLISH 
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
			delete_symbol (phTTS, n);
		}
		if (pKsd_t->halting)
			return (FALSE);
#ifdef DEBUGIND
		printf ("pDph_t->symbols[n] =	%d n=%d \n", pDph_t->symbols[n], n);
#endif                
#endif /* #if defined ENGLISH_US || defined SPANISH */
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
		if ((pDph_t->symbols[n] >= HAT_RISE) && (pDph_t->symbols[n] <= HAT_RF))
		{
			if (pDph_t->f0mode == NORMAL)
			{
				pDph_t->f0mode = HAT_LOCATIONS_SPECIFIED;
			}
		}
				/*EAB added special code to improve NOAA*/
#if (defined ENGLISH) && (defined NOAA)
		if( pDph_t->number_words == 1)
		{
			if ((pDph_t->symbols[n + 1] == F) && (pDph_t->symbols[n + 2] == RR))
			{
				pDph_t->symbols[n + 2] = OR;
				insertphone (phTTS, n + 2, S1);		
			}
			if ((pDph_t->symbols[m - 2] == T) && (pDph_t->symbols[m - 1] == UH))
			{
			pDph_t->symbols[n + 2] = UW;
			insertphone (phTTS, n + 2, S1);
			}
		}
#endif
		

		/* Clause-final function word (preceded by [(]) should be stressed */
		if (pDph_t->symbols[n] == PPSTART)
		{
			/* Examine input for next bound, see if cbound or greater */
			m = n + 1;
			while (m < pDph_t->nsymbtot)
			{
				if (is_wboundary (pDph_t->symbols[m]))
				{
#if defined ENGLISH || defined GERMAN
					if ((pDph_t->symbols[m] >= COMMA)
#ifdef ENGLISH
						|| ((pDph_t->symbols[m] == PPSTART) && (pDph_t->symbols[m + 1] != W)))
#endif
#ifdef GERMAN
						|| ((pDph_t->symbols[m] == PPSTART)))
#endif
					{
#if (defined NWS_US) || (defined ENGLISH_UK)

/* eab need to evaluate the effecct but this breaks word counts when special word next*/
						pDph_t->symbols[n] = S2;	/* Replace [(] by [ ] */
#else
						pDph_t->symbols[n] = WBOUND;
#endif
						/* Raise PPSTART to VPSTART to set off verbal particle */
						if (pDph_t->symbols[m] == PPSTART)
						{
							pDph_t->symbols[m] = VPSTART;
						}
						/* Unreduce the vowel in "for, to, into" */
#ifdef ENGLISH
						if ((pDph_t->symbols[n + 1] == F) && (pDph_t->symbols[n + 2] == RR))
						{
							pDph_t->symbols[n + 2] = OR;
						}
						if ((pDph_t->symbols[m - 2] == T) && (pDph_t->symbols[m - 1] == UH))
						{
							pDph_t->symbols[n + 2] = UW;
						}
#endif



						/* Promote init secondary stress, or find V to stress */
						if (pDph_t->symbols[n + 1] == S2)
						{
							pDph_t->symbols[n + 1] = S1;	/* Replace [`] by ['] */
						}
						else
						{
							insertphone (phTTS, n + 1, S1);		/* Insert dangling ['] */
							move_stdangle (phTTS, n + 1);	/* Move to right place */
						}
					}
#endif /* #if defined ENGLISH || defined GERMAN */

					break;
				}

				m++;
			}
		}

		/* Look for dangling stress mark (i.e. not followed by +SYLL) */
#ifdef GERMAN
		if ((pDph_t->symbols[n] >= S3) && (pDph_t->symbols[n] <= HAT_RF))
#endif
#if defined ENGLISH 
		if ((pDph_t->symbols[n] >= S2) && (pDph_t->symbols[n] <= SEMPH))
#endif
		{
			/* if ((pDph_t->symbols[n] == S1) || (pDph_t->symbols[n] == SEMPH)) */ /* english *
																				   /
		/*	if (pDph_t->symbols[n] != S2)		/* these are the same */		   /* spanish */
			/* eab 4/24/98 all stress now count! for all Languages*/
				nstresses++;		   /* Count # stresses to this point */
			
			/* Examine following input for next segment, see if syllabic */
			m = n + 1;
			while ((pDph_t->symbols[m] >= TOT_ALLOPHONES) && (m < pDph_t->nsymbtot))
			{
#ifdef ENGLISH
				if (pDph_t->symbols[m] > WBOUND && pDph_t->symbols[m] < NEW_PARAGRAPH
					&& pDph_t->symbols[m] != HYPHEN /* xxx for auto compunds */ )
#endif
#ifdef GERMAN 
				if (pDph_t->symbols[m] >= SBOUND)
#endif
				{
					nstresses--;
					delete_symbol (phTTS, n);	/* Ignore stress at end of */
					goto stzapped;	   /* syllable or word     */
				}
				m++;
			}

			if ((featb[pDph_t->symbols[m]] & FSYLL) IS_MINUS)
			{
				move_stdangle (phTTS, n);
			}
		}
	  stzapped:

#if defined ENGLISH || defined GERMAN
		/* Remove weaker of two boundary pDph_t->symbols in a row */
		if ((pDph_t->symbols[n] >= SBOUND) && (pDph_t->symbols[n] <= EXCLAIM))
		{
/* for (m=n+1; m<pDph_t->nsymbtot; m++) out-goofs up when trying to do all at once { */
#ifdef ENGLISH
			m = n + 1;
			if (m < pDph_t->nsymbtot)
			{
				/* if (pDph_t->symbols[m] < TOT_ALLOPHONES)    break; */
				if ((pDph_t->symbols[m] >= SBOUND) && (pDph_t->symbols[m] <= EXCLAIM))
				{
					zap_weaker_bound (phTTS, n, m);
				}
			}
#endif
#ifdef GERMAN
			for (m = n + 1; m < pDph_t->nsymbtot; m++)
			{
				if (pDph_t->symbols[m] < TOT_ALLOPHONES)
					break;
				if ((pDph_t->symbols[m] >= SBOUND) && (pDph_t->symbols[m] <= EXCLAIM))
				{
					zap_weaker_bound (phTTS, n, m);
				}
			}
#endif
		}

		/* Replace weak boundaries by stronger ones at slow rates */
		if (pKsd_t->sprate <= 120)
		{
			if ((pDph_t->symbols[n] == VPSTART) || (pDph_t->symbols[n] == PPSTART))
			{
				pDph_t->symbols[n] = COMMA;
			}
		}
		else if (pKsd_t->sprate <= 140)
		{
			if (pDph_t->symbols[n] == PPSTART)
			{
				pDph_t->symbols[n] = VPSTART;
			}
		}
#endif	/* #if defined ENGLISH_US || defined GERMAN*/

		/* Every breath group must have at least one 1-stress */
		if ((pDph_t->symbols[n] >= COMMA) && (pDph_t->symbols[n] <= EXCLAIM))
		{

			if ((n > 0) && (nstresses == 0))
			{
				find_syll_to_stress (phTTS, &n, nstartphrase);	/* MVP : was n and n was static */
			}
		}
#if defined ENGLISH || defined GERMAN
		/* Reset to new phrase if encounter [ } , . ? ! ] */
		/* 
		 * NOTE: Phoneme RELSTART = [}] not currently defined.  When it is, 
		 * all words in FUNWRD1.DIC that introduce relative clauses, such as
		 * "when, that, which" should have [}] symbol appended to front. 
		 */
		if ((pDph_t->symbols[n] >= RELSTART) && (pDph_t->symbols[n] <= EXCLAIM))
		{
			nstresses = 0;
			nstartphrase = n;
		}
#endif
		/* Exclamation point raises last stress of sentence to emphasis */
		if (pDph_t->symbols[n] == EXCLAIM)
		{
			raise_last_stress (pDph_t, n);
		}
		

	}


	/* Main loop 2: for each input symbol, pass to output array or turn into */
	/* a feature value */

	mf0 = 0;
	pDph_t->nphonetot = 0;
	word_init_sw = FALSE;
	in_rhyme = FALSE;
	pDph_t->newparagsw = FALSE;
	
#ifdef GERMAN


	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* initialization of german variables                					  */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

	pDph_t->hat_seen = 0;
	pDph_t->wordcount = 1;

#ifdef GERMAN_OBSOLETE // BATS 711 Useless compute burner

	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* do syntactical check if no hat markers were seen      				  */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

	if (pDph_t->f0mode == NORMAL)
	{
		german_syntax (pDph_t);
	}

	compound_destress = FALSE;

#endif

#endif        

	for (n = 0; n < pDph_t->nsymbtot; n++)
	{

	/* GL 03/27/1997 BATS#270 fix German index delay problem(fixed by Ed bruckert) */
/*#if defined (ENGLISH_US) || defined (SPANISH)*/

		snphonetot = pDph_t->nphonetot;

/*#endif*/

		if (pKsd_t->halting)
			return (FALSE);

		curr_in_sym = pDph_t->symbols[n];	/* Precompute useful variable */

		curr_dur = pDph_t->user_durs[n];	/* User-specified dur if non-zero */
		pDph_t->user_durs[n] = 0;

		curr_f0 = pDph_t->user_f0[n];  /* User-specified f0 if non-zero  */
		pDph_t->user_f0[n] = 0;

		/* Check to see if user-specified f0 hats/stress-pulses */

		interp_user_f0 (pDph_t, &curr_dur, &curr_f0, curr_in_sym, &mf0);

		/* Switch on the current input symbol */

		if (curr_in_sym < TOT_ALLOPHONES)
		{							   /* A real phoneme */

			make_phone (pDph_t, curr_in_sym, n, curr_dur, curr_f0);		/* eab try handling stuff in make */

			/* If syllabic, look ahead to see initial/medial/final syll */
			if ((featb[curr_in_sym] & FSYLL) IS_PLUS)
			{
				in_rhyme = TRUE;
#if defined (ENGLISH) || defined (GERMAN)
				word_init_sw = FALSE;
				init_med_final (pDph_t, n);
#endif
			}
			/* Assign word-initial feature to consonant(s) */
#if defined ENGLISH || defined GERMAN
			if (word_init_sw == TRUE)
			{
				add_feature (pDph_t, FWINITC, CURRPHONE);
			}
#endif
			/* Assign boundary type to segments of rhyme */
			if (in_rhyme == TRUE)
			{
				get_next_bound_type (pDph_t, n);
			}
		}
		else
		{							   /* A non-phoneme */

			switch (curr_in_sym)
			{
			case S1:
				
#ifdef GERMAN
				if (compound_destress == TRUE)
				{
					add_feature (pDph_t,  FSTRESS_2, NEXTPHONE);
				}
				else
				{
#endif
					add_feature (pDph_t, FSTRESS_1, NEXTPHONE);
#ifdef GERMAN
				}
#endif
#ifdef MSDBG8
				printf ("add_feature(FSTRESS_1,NEXTPHONE)\n");
#endif
		 		break;
			case S2:
#ifdef GERMAN
			
				if (compound_destress == FALSE)
				{
					
					add_feature (pDph_t, FSTRESS_2,  NEXTPHONE );
				}
#endif
#ifdef ENGLISH 
				add_feature (pDph_t, FSTRESS_2, NEXTPHONE);
#endif
#ifdef MSDBG8
					printf ("add_feature(FSTRESS_2,NEXTPHONE)\n");
#endif
				break;

#ifdef GERMAN
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* add tertiary stress for german DECtalk                				  */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			case S3:
				if (compound_destress == FALSE)
				{
					
					add_feature (pDph_t, FSTRESS_3, NEXTPHONE  );
				}
				break;
#endif
			case SEMPH:
				add_feature (pDph_t, FEMPHASIS, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FEMPHASIS,NEXTPHONE\n");
#endif

				break;
			case HYPHEN:


#ifdef GERMAN
				compound_destress = TRUE;
#endif
				break;
#ifdef GERMAN
			case COMMA:
				pDph_t->clausetype = COMMACLAUSE;
				pDph_t->clausenumber++;
				
			case PERIOD:
			pDph_t->clausetype = DECLARATIVE;
			pDph_t->clausenumber=0;
			
			case EXCLAIM:
			pDph_t->clausetype = EXCLAIMCLAUSE;
			pDph_t->clausenumber=0;
			
					add_feature (pDph_t, FSENTENDS, NEXTPHONE);
			case QUEST:          			
			pDph_t->clausetype = QUESTION;
			pDph_t->clausenumber=0;
			
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
#endif
				break;
			case WBOUND:
		
				pDph_t->number_words++; /* EAB Let's count  up the number of words*/
					/* eab AT slow speaking rate insert a glottal stop that later 
				gets it's timing adjusted and voicing reduced*/
#ifdef SLOWTALK
				if(pKsd_t->sprate <75)

					insertphone (phTTS, n+1, Q);

#endif /*SLOWTALK*/
				

			case PPSTART:
			case VPSTART:
			case RELSTART:
#ifdef ENGLISH
				if (pDph_t->symbols[n + 1] == HYPHEN)
				{
					break;			   /* xxx here to allow compound noun insert */
				}
#endif
				word_init_sw = TRUE;

#ifdef GERMAN
				word_init_sw = TRUE;
				compound_destress = FALSE;
#endif
				break;
#ifdef ENGLISH 
			case COMMA:
				pDph_t->clausetype = COMMACLAUSE;
				pDph_t->clausenumber++;
				
		
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				add_feature (pDph_t, FSENTENDS, CURRPHONE);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			case PERIOD:
				pDph_t->clausetype = DECLARATIVE;
				pDph_t->clausenumber=0;
			
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				add_feature (pDph_t, FSENTENDS, CURRPHONE);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			case EXCLAIM:
				pDph_t->clausetype = EXCLAIMCLAUSE;
				pDph_t->clausenumber=0;
			
				add_feature (pDph_t, FSENTENDS, NEXTPHONE);
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				add_feature (pDph_t, FSENTENDS, CURRPHONE);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			case QUEST:          			
				pDph_t->clausetype = QUESTION;
				pDph_t->clausenumber=0;
				pDph_t->cbsymbol = TRUE;
			
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				add_feature (pDph_t, FSENTENDS, CURRPHONE);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
#endif      /* #if defined ENGLISH_US || defined SPANISH */
			case HAT_RISE:
#ifdef GERMAN
				pDph_t->hat_seen++;
				add_feature (pDph_t, FHAT_BEGINS, NEXTPHONE );
#endif
#ifdef ENGLISH
				add_feature (pDph_t, FHAT_BEGINS, NEXTPHONE);
#endif
#ifdef MSDBG8
				printf ("add_feature(FHAT_BEGINS,NEXTPHONE)\n");
#endif
				break;
			case HAT_FALL:
#ifdef GERMAN
				pDph_t->hat_seen++;
#endif
				add_feature (pDph_t, FHAT_ENDS, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FHAT_ENDS,NEXTPHONE)\n");
#endif
				break;
#ifdef GERMAN
			case HAT_RF:
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* german DECtalk uses also HAT_RF                   					  */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				pDph_t->hat_seen++;
				add_feature (pDph_t, FHAT_ROOF, NEXTPHONE);
				break;
#endif
			
				
			case BLOCK_RULES:
				add_feature (pDph_t, FBLOCK, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FBLOCK,NEXTPHONE)\n");
#endif
				break;
			case NEW_PARAGRAPH:
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
}
 
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
#if defined ENGLISH || defined GERMAN
	if ((curr_in_sym == S1) || (curr_in_sym == SEMPH)
		|| (curr_in_sym == HAT_RISE) || (curr_in_sym == HAT_FALL)
		&& (pDph_t->f0mode != PHONE_TARGETS_SPECIFIED)
		&& (pDph_t->f0mode != SINGING))
#endif
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
				&& (*psCurr_f0 <= 37))
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

				*psCurr_dur = 0;
				*psCurr_f0 = 0;
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
		pDph_t->symbols[m] = pDph_t->symbols[m - 1];
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
		if (pDph_t->symbols[m] == S1)
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
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	if (pDph_t->symbols[msym1] < pDph_t->symbols[msym2])
	{
#ifdef GERMAN
		pDph_t->symbols[msym1] = pDph_t->symbols[msym2];	/* Boundarys can't have */
#endif
#ifdef ENGLISH 
		/* pDph_t->symbols[msym1] = pDph_t->symbols[msym2];    Boundarys can't have */
		if (pDph_t->symbols[msym1] != HYPHEN)
			delete_symbol (phTTS, msym1);
		return;
#endif
	}
	/* user durs or f0 */
#ifdef ENGLISH 
	if (pDph_t->symbols[msym2] != HYPHEN)
#endif
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
#ifdef GERMAN
	if ((phoname < 0) || (phoname >= TOT_ALLOPHONES))
	{
		return;						   /* Ignore this phoneme */
	}
#endif
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
#ifdef ENGLISH	
	if ((feaname <= 0) || (feaname > FMAXIMUM))
	{
		return;
	}                                          
#endif
#ifdef GERMAN
#ifdef CKFEAT
	if ((feaname <= 0) || (feaname > FMAXIMUM))
	{
		return;
	}                                          
#endif
#endif
	/* Do it */
	pDph_t->sentstruc[location] |= feaname;

}
/* * * * * * * * * * * * * * * * end of ph_sort.c**** * * * * * * * * * * * * * * * * */
#else /*ifdef NWS_US || ENGLISH_UK */

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
extern short featb[];	   /* Feature assignment to each phonetype */

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

static void zap_weaker_bound (LPTTS_HANDLE_T phTTS, short msym1, short msym2);

static int  is_wboundary (short symb);

static void raise_last_stress (PDPH_T pDph_t, short msym);

static void interp_user_f0 (PDPH_T pDph_t, short *psCurr_dur, short *psCurr_f0,
							short curr_in_sym, short *psMf0);

static void make_phone (PDPH_T pDph_t, short phoname, short n,
						short curr_dur, short curr_f0);

static void init_med_final (PDPH_T pDph_t, short msym);

static void get_stress_of_conson (PDPH_T pDph_t, short msym, short compound_destress);

static void add_feature (PDPH_T pDph_t, long feaname, short location);

static void get_next_bound_type (PDPH_T pDph_t, short msym);

#include "ph_sort1.c"	/* language dependent code from phsort */
#include "ph_sort2.c"	/* language dependent code for multiple languages */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: phsort()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

int phsort (LPTTS_HANDLE_T phTTS)
{
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	short                   snphonetot = 0;		/* MVP 03/19/96 changed to short from unsigned int */

	short                   n = 0, curr_dur = 0, compound_destress = 0, curr_f0 = 0;	/* MVP : Made local */
	short                   curr_in_sym = 0, word_init_sw = 0, in_rhyme = 0, m, mf0, nstresses;		/* MVP : made local */
	short                   nstartphrase = 0; 
	short	nextvowel=0;
#ifdef SPANISH
		short				ntmp;
		short				phrase_after_quote = 0;
		short               nsyll;	   /* Nbr. syllables       */
		short               syllclass; /* Set if open syllable */
		short               iscoda;	   /* Set after nucleus    */
		short               wordstress;/* TRUE if any stress   */
		pDph_t->special_phrase=0;
		pDph_t->specdur = 0;
#endif 
#ifdef GERMAN
		SENT_PARS			*pp;
		short				tmp,ntmp;

	pDph_t->Word_has_stress =0;
	pDph_t->number_fsyls  = 0;
#endif
	pDph_t->number_words=1; /* eab init there is one less word boundary than number of 
							words*/

	pDphsettar->did_del = 0;
	

#ifdef GERMAN
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* clear parsing structure, even if syntax() isn't called        */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	for (pp = pDph_t->pars; pp <= &pDph_t->pars[pDph_t->nsymbtot]; pp++)
	{
		pp->phopoint = 0;
		pp->wordclass = 0;
		pp->bouflag = 0;
	}
	/* for */
#endif
#ifdef ENGLISH /*2/12/99 eab new code first very specific for find " that" and a hat fall to the previous
						word and stress the word following the that as starters
						search ahead this code is messsy for now but it is just a test */

						for (n = 0; n < pDph_t->nsymbtot; n++)
						{
							if(pDph_t->symbols[n] == WBOUND)
							
							if ((pDph_t->symbols[n -3] == DH) && (pDph_t->symbols[n - 2] == AE)
								&& (pDph_t->symbols[n - 1] == T))
							{
								//insertphone (phTTS,nextvowel-3 , HAT_FALL);
										
								for (nextvowel = n+1; nextvowel < pDph_t->nsymbtot; nextvowel++)
								{
									if (featb[pDph_t->symbols[nextvowel]] & FVOWEL)
									{
										/* don't stress a helper verb following that*/
										if(!(pDph_t->wordclass[pDph_t->nsymbtot] & FC_FUNC
											&& pDph_t->wordclass[pDph_t->nsymbtot] & FC_VERB))
											//insertphone (phTTS,nextvowel , S2);


										break;
									}
								}
							}
						}
#endif



	/* Clear structure array */

	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		pDph_t->sentstruc[n] = 0;
	}
	pDph_t->f0mode = NORMAL;
#ifdef SPANISH
	pDph_t->emphasisflag = FALSE; 
#endif
	pDph_t->cbsymbol = 0;
	

	/* Main loop 1: Clean up input string re mis-orderings & extra boundaries */
	pDph_t->nphonetot = 0;
	nstresses = 0;
	nstartphrase = 0; 
	
#ifdef GERMAN
	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		if ((pDph_t->symbols[n] == S1 ||
			  pDph_t->symbols[n] == S2 ||
			  pDph_t->symbols[n] == S3)
			 && !(featb[pDph_t->symbols[n + 1]] & FVOWEL))
		{
			/* BATS 711 Slight improvement in loop performance start at n+2 not n */
			for (nextvowel = n+2; nextvowel < pDph_t->nsymbtot; nextvowel++)
			{
				if (featb[pDph_t->symbols[nextvowel]] & FVOWEL)
				{
					tmp = pDph_t->symbols[n];
		
					for (ntmp = n; ntmp < (nextvowel - 1); ntmp++)
					{
						pDph_t->symbols[ntmp] = pDph_t->symbols[ntmp + 1];
					}
					pDph_t->symbols[nextvowel - 1] = tmp;
					n = nextvowel;	   /* done to this point so jump ahead */
					break;
				}
			}
		}
	}

#endif /* #ifdef GERMAN */


	for (n = 0; n < pDph_t->nsymbtot; n++)
	{
		if (pDphsettar->did_del)
		{
			n--;					   /* delete was done so back up one to process shifted phoneme eab */
			pDphsettar->did_del = 0;
			/* del_cnt++; *//* MVP : Value is never used */
		}






#ifdef GERMAN
// Solution of trilled R not allows Ng to function properly so I removed substitution this is better
		//eab 6/9/98
				/*EAB 3/25/98 try using p+ f to imitate pf*/
		if (pDph_t->symbols[n] == PF)
			
			{
				pDph_t->symbols[n] = P;
				insertphone (phTTS, n+1, F);

					/* 12/10/1996 EDB */
				n++;
			}
				/* eab 3/120/98 Make final S much longer by inserting another S
		 if word final position in a stressed word 7/28/98 appears to have too much affect
		 I thought it one was suppose to be shortened-out until interact review with oliver*/
		if (pDph_t->symbols[n] == WBOUND )
		{

			if( pDph_t->symbols[n-1] == S && pDph_t->Word_has_stress == 1)
			{
			/*	insertphone (phTTS, (n-1), S);*/
				n++;
			}
			pDph_t->Word_has_stress = 0; //clear word stress flag eab 3/27/98
			pDph_t->number_fsyls  = 0; //clear numberfylls eab 4/2/98
		}

			/*3/18/98 eab inhibit for R becuase we'll glotalize the r in phdraw*/
		if (pDph_t->symbols[n] == WBOUND
			&& (pDph_t->symbols[n-1] != R))
		{
		
					
				/* 12/10/1996 EDB,
				 according to caroline always insert a word inital when a vowel*/
				
			
			ntmp = n;
				/* step past any non-phonemes such as stress */
			while (pDph_t->symbols[ntmp] > 100 && ntmp < pDph_t->nsymbtot)
			{
				ntmp++;
			}
				/* Is next thing a vowel*/
			if (featb[pDph_t->symbols[ntmp]] & FVOWEL)
			{
				insertphone (phTTS, n, Q);

					/* 12/10/1996 EDB */
				n=ntmp;
			}
			
		}
		/* eab 11/95 and add glotal bewteen vowels in a word */
		/* redo code later for clealiness 12/16/96 out*/
		if (featb[pDph_t->symbols[n - 1]] & FVOWEL)
		{
			ntmp = n;
			/* step past any non-phonemes such as stress */
			while (pDph_t->symbols[ntmp] > 100 && ntmp < pDph_t->nsymbtot)
			{
				ntmp++;
			}
			/* printf(" %x %x %d %d \n",featb[symbols[ntmp]],featb[symbols[ntmp]] & FVOWEL, ntmp,symbols[ntmp]); */

			if (featb[pDph_t->symbols[ntmp]] & FVOWEL)
			{
			/* Eab We need to check this out next Tuesday with SOnia in out or modified */
			/* insertphone(n,Q); */
			/* printf("insert q\n"); */
			}
		}

#endif /* #ifdef GERMAN */
		
	

#ifdef SPANISH


		/* kludge we need to have a word boundary at the begiining to make things
		coding more straight forward n=0 is becuase of no inital wbound.*/
		if (pDph_t->symbols[n] == WBOUND || n==0)
		{
			/* allophonic rule for grapheme Y->e 
			before an I as in Y india pronounced e india */
			if((pDph_t->symbols[n+1] == E_I)
				&& (pDph_t->symbols[n+2] == WBOUND))
			{
			/*then look ahead to see if the 
			  next real phoneme is the vowel E_I*/
				ntmp = n+2;
			/* step past any non-phonemes such as stress*/
				while ( (pDph_t->symbols[ntmp] > 100 ||
					pDph_t->symbols[ntmp]==E_Q )
					&& ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* Is next thing a the vowel*/
				if (pDph_t->symbols[ntmp] == E_I)		
				{
					pDph_t->symbols[n+1]=E_E;
				}
			}
			/* allophonic rule for "or" O->e
			before an I as in Y india pronounced e india*/
			if((pDph_t->symbols[n+2] == E_O)
			 && (pDph_t->symbols[n+3] == WBOUND))
			{
			/* then look ahead to see if the next real phoneme is the vowel E_I*/
				ntmp = n+3;
			/* step past any non-phonemes such as stress */
				while ( (pDph_t->symbols[ntmp] > 100 ||
					pDph_t->symbols[ntmp] == E_Q )
					&& ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
			    /* Is next thing E_O */
				if (pDph_t->symbols[ntmp] == E_O)		
				{
					pDph_t->symbols[n+2]=E_U;
				}
			}
				
			
#ifdef BOOK_SAYS_DIFFERENT
			// from previous input perhaps a castillion/latin difference or
			// maybe anna was wrong/anglicanixzed
		    /* 12/27/96 EAB insert a glotal stop bewteen s#s V#s and s#v and 
			   Juan would like it with sonor #sonor  */
			if(pDph_t->symbols[n-1] == E_S || pDph_t->symbols[n-1] == E_TH)
			{
				ntmp = n;
				/* step past any non-phonemes such as stress */
				while(pDph_t->symbols[ntmp] > 100 && ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* If next thing an S use sil instead of  a voiced
				glotal stop*/
				if(pDph_t->symbols[ntmp] == E_S || pDph_t->symbols[ntmp] == E_TH)
				{
					insertphone(phTTS, n, SIL);
					n=ntmp;
				}

				/* Is next thing a vowel*/
				else if (featb[pDph_t->symbols[ntmp]] & FVOWEL	)
				{
					if((pDph_t->wordclass[n] & 0x020))
						insertphone (phTTS, n, E_Q);
					/* BATS 677 Found another spot it was doing it wrong
					EAB 5/18/98 */
					if(!(pDph_t->wordclass[n-1] & 0x00800000)
						&& !(pDph_t->wordclass[n+1] & 0x00800000))
					{
						insertphone (phTTS, n, E_Q);
					/* 12/10/1996 EDB */
					n=ntmp;
					}
				}
			}
				else if(featb[pDph_t->symbols[n-1]] & FSONOR)
			{
				ntmp = n;
				/* step past any non-phonemes such as stress */
				while (pDph_t->symbols[ntmp] > 100 && ntmp < pDph_t->nsymbtot)
				{
					ntmp++;
				}
				/* Is next thing an s or a vowel i.e. vowel wbound vowel gets a glotal also 
				BATS 677 EAB 5/18/98 */
				if (featb[pDph_t->symbols[ntmp]] & FSONOR
					|| 	pDph_t->symbols[ntmp] == E_S || pDph_t->symbols[ntmp] == E_TH)
				{
					/*last phoneme of word equals next phoneme so glotal stop it*/
					if(pDph_t->symbols[n-1]==pDph_t->symbols[ntmp])
					{
						insertphone (phTTS, n, E_Q);
					}
			/* BATS 674 Should be inserting a glotal stop not silence eab 5/13/98*/
			/* now trying to refine so that we don't put in tooo many glotal stops
			but we must be careful because we can cause confusion eab 8/7/98 */
					

			/* BATS 677 Found another spot it was doing it wrong
			EAB 5/18/98 EAB Found a behavior problem because N+1 can be end
			marker with no silence at the end yet */

					else if(n>0 && !(pDph_t->wordclass[n-1] & 0x00800000))
					{
						if(pDph_t->symbols[n+1] != SIL  )
							if( !(pDph_t->symbols[n+1] >= 115
								&& pDph_t->symbols[n+1] <= 118))
							insertphone (phTTS, n, E_Q);

					/* 12/10/1996 EDB */
					}
					n=ntmp;
				}
			}
#endif
							
		}
#endif
#ifdef GERMAN

		/* code to insert a secondary stress in a polysyllabic or compound word on the second +syl after
           a stress*/
		if(pDph_t->Word_has_stress == 1)
		{
			if ((featb[pDph_t->symbols[n]] & FSYLL) IS_PLUS)
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



#endif
		
#if defined ENGLISH_US || defined SPANISH
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
#ifdef SPANISH
			if (phrase_after_quote)
			{
				pDph_t->special_phrase = 1;
			}
			phrase_after_quote = 0;
#endif
			delete_symbol (phTTS, n);
		}

#ifdef SPANISH
		/* EAB I known this code is ugly but it's to recognize that the i
		in numbers generated but the number routines is the functor i  and
		the wordclass info has to be marked 
		eab 9/4/98 is really wb-i-wb with not stress mark it a functor */

		if(pDph_t->symbols[n] == E_I)
		{
			if (pDph_t->symbols[n - 1] == WBOUND
				&& pDph_t->symbols[n + 1] == WBOUND)
			{
				pDph_t->wordclass[n] |= 0x00800000;
			}
		}
		/* Move identiical phones seperated by 
		a wbound code to PH_timing so we can control duration*/
	


#endif
		if (pKsd_t->halting)
			return (FALSE);
#ifdef DEBUGIND
		printf ("pDph_t->symbols[n] =	%d n=%d \n", pDph_t->symbols[n], n);
#endif                
#endif /* #if defined ENGLISH_US || defined SPANISH */
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
		if ((pDph_t->symbols[n] >= HAT_RISE) && (pDph_t->symbols[n] <= HAT_RF))
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
				if (is_wboundary (pDph_t->symbols[m]))
				{
#if defined ENGLISH_US || defined GERMAN
					if ((pDph_t->symbols[m] >= COMMA)
#ifdef ENGLISH_US
						|| ((pDph_t->symbols[m] == PPSTART) && (pDph_t->symbols[m + 1] != W)))
#endif
#ifdef GERMAN
						|| ((pDph_t->symbols[m] == PPSTART)))
#endif
					{
						pDph_t->symbols[n] = WBOUND;	/* Replace [(] by [ ] */
						/* Raise PPSTART to VPSTART to set off verbal particle */
						if (pDph_t->symbols[m] == PPSTART)
						{
							pDph_t->symbols[m] = VPSTART;
						}
						/* Unreduce the vowel in "for, to, into" */
#ifdef ENGLISH_US
						if ((pDph_t->symbols[n + 1] == F) && (pDph_t->symbols[n + 2] == RR))
						{
							pDph_t->symbols[n + 2] = OR;
						}
						if ((pDph_t->symbols[m - 2] == T) && (pDph_t->symbols[m - 1] == UH))
						{
							pDph_t->symbols[n + 2] = UW;
						}
#endif
						/* Promote init secondary stress, or find V to stress */
						if (pDph_t->symbols[n + 1] == S2)
						{
							pDph_t->symbols[n + 1] = S1;	/* Replace [`] by ['] */
						}
						else
						{
							insertphone (phTTS, n + 1, S1);		/* Insert dangling ['] */
							move_stdangle (phTTS, n + 1);	/* Move to right place */
						}
					}
#endif /* #if defined ENGLISH_US || defined GERMAN */
#ifdef SPANISH
					if (pDph_t->symbols[m] >= COMMA)
					{
						pDph_t->symbols[n]= S2;	   /* Replace [(] by [`]  */
					}
					/* Should be an insert instead   */
#endif /* #ifdef SPANISH */
					break;
				}

				m++;
			}
		}

		/* Look for dangling stress mark (i.e. not followed by +SYLL) */
#ifdef GERMAN
		if ((pDph_t->symbols[n] >= S3) && (pDph_t->symbols[n] <= HAT_RF))
#endif
#if defined ENGLISH_US || defined SPANISH
		if ((pDph_t->symbols[n] >= S2) && (pDph_t->symbols[n] <= SEMPH))
#endif
		{
			/* if ((pDph_t->symbols[n] == S1) || (pDph_t->symbols[n] == SEMPH)) */ /* english */
			if (pDph_t->symbols[n] != S2)		/* these are the same */		   /* spanish */
			{
				nstresses++;		   /* Count # stresses to this point */
			}
			/* Examine following input for next segment, see if syllabic */
			m = n + 1;
			while ((pDph_t->symbols[m] >= TOT_ALLOPHONES) && (m < pDph_t->nsymbtot))
			{
#ifdef ENGLISH_US
				if (pDph_t->symbols[m] > WBOUND && pDph_t->symbols[m] < NEW_PARAGRAPH
					&& pDph_t->symbols[m] != HYPHEN /* xxx for auto compunds */ )
#endif
#if defined SPANISH || defined GERMAN 
				if (pDph_t->symbols[m] >= SBOUND)
#endif
				{
					nstresses--;
					delete_symbol (phTTS, n);	/* Ignore stress at end of */
					goto stzapped;	   /* syllable or word     */
				}
				m++;
			}

			if ((featb[pDph_t->symbols[m]] & FSYLL) IS_MINUS)
			{
				move_stdangle (phTTS, n);
			}
		}
	  stzapped:

#if defined ENGLISH_US || defined GERMAN
		/* Remove weaker of two boundary pDph_t->symbols in a row */
		if ((pDph_t->symbols[n] >= SBOUND) && (pDph_t->symbols[n] <= EXCLAIM))
		{
/* for (m=n+1; m<pDph_t->nsymbtot; m++) out-goofs up when trying to do all at once { */
#ifdef ENGLISH_US
			m = n + 1;
			if (m < pDph_t->nsymbtot)
			{
				/* if (pDph_t->symbols[m] < TOT_ALLOPHONES)    break; */
				if ((pDph_t->symbols[m] >= SBOUND) && (pDph_t->symbols[m] <= EXCLAIM))
				{
					zap_weaker_bound (phTTS, n, m);
				}
			}
#endif
#ifdef GERMAN
			for (m = n + 1; m < pDph_t->nsymbtot; m++)
			{
				if (pDph_t->symbols[m] < TOT_ALLOPHONES)
					break;
				if ((pDph_t->symbols[m] >= SBOUND) && (pDph_t->symbols[m] <= EXCLAIM))
				{
					zap_weaker_bound (phTTS, n, m);
				}
			}
#endif
		}
		/* Replace weak boundaries by stronger ones at slow rates */
		if (pKsd_t->sprate <= 120)
		{
			if ((pDph_t->symbols[n] == VPSTART) || (pDph_t->symbols[n] == PPSTART))
			{
				pDph_t->symbols[n] = COMMA;
			}
		}
		else if (pKsd_t->sprate <= 140)
		{
			if (pDph_t->symbols[n] == PPSTART)
			{
				pDph_t->symbols[n] = VPSTART;
			}
		}
#endif	/* #if defined ENGLISH_US || defined GERMAN*/

		/* Every breath group must have at least one 1-stress */
		if ((pDph_t->symbols[n] >= COMMA) && (pDph_t->symbols[n] <= EXCLAIM))
		{

			if ((n > 0) && (nstresses == 0))
			{
				find_syll_to_stress (phTTS, &n, nstartphrase);	/* MVP : was n and n was static */
#ifdef SPANISH
				nstresses = 1;
#endif			
			}
		}
#if defined ENGLISH_US || defined GERMAN
		/* Reset to new phrase if encounter [ } , . ? ! ] */
		/* 
		 * NOTE: Phoneme RELSTART = [}] not currently defined.  When it is, 
		 * all words in FUNWRD1.DIC that introduce relative clauses, such as
		 * "when, that, which" should have [}] symbol appended to front. 
		 */
		if ((pDph_t->symbols[n] >= RELSTART) && (pDph_t->symbols[n] <= EXCLAIM))
		{
			nstresses = 0;
			nstartphrase = n;
		}
#endif
		/* Exclamation point raises last stress of sentence to emphasis */
		if (pDph_t->symbols[n] == EXCLAIM)
		{
			raise_last_stress (pDph_t, n);
		}
		/* Set varaible to indicate a question sentence */
		if (pDph_t->symbols[n] == QUEST)
		{
			pDph_t->cbsymbol = TRUE;
		}
	}

#ifdef SPANISH
	spanish_allophonics (phTTS);
#endif

	/* Main loop 2: for each input symbol, pass to output array or turn into */
	/* a feature value */

	mf0 = 0;
	pDph_t->nphonetot = 0;
	word_init_sw = FALSE;
	in_rhyme = FALSE;
	pDph_t->newparagsw = FALSE;

#ifdef SPANISH
	nsyll = 0;						   /* Monosyllabic for now          */
	syllclass = 0;					   /* Assume closed syllable     	*/
	iscoda = 0;						   /* Haven't seen vowel yet        */
	wordstress = 0;					   /* Word isn't stressed           */
	compound_destress = FALSE;
#endif
	
#ifdef GERMAN
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* initialization of german variables                					  */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	pDph_t->hat_seen = 0;
	pDph_t->wordcount = 1;


#ifdef OBSLETE_CODE
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* do syntactical check if no hat markers were seen      				  */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	if (pDph_t->f0mode == NORMAL)
	{
		german_syntax (pDph_t);
	}
	compound_destress = FALSE;
#endif
#endif        

	for (n = 0; n < pDph_t->nsymbtot; n++)
	{

	/* GL 03/27/1997 BATS#270 fix German index delay problem(fixed by Ed bruckert) */
/*#if defined (ENGLISH_US) || defined (SPANISH)*/
		snphonetot = pDph_t->nphonetot;
/*#endif*/
		if (pKsd_t->halting)
			return (FALSE);


		curr_in_sym = pDph_t->symbols[n];	/* Precompute useful variable */

		curr_dur = pDph_t->user_durs[n];	/* User-specified dur if non-zero */
		pDph_t->user_durs[n] = 0;

		curr_f0 = pDph_t->user_f0[n];  /* User-specified f0 if non-zero  */
		pDph_t->user_f0[n] = 0;

		/* Check to see if user-specified f0 hats/stress-pulses */

		interp_user_f0 (pDph_t, &curr_dur, &curr_f0, curr_in_sym, &mf0);

		/* Switch on the current input symbol */
				
		/* added wordclass info for AD */
#if (defined ENGLISH) || (defined GERMAN) 
		if(pDph_t->wordclass[n] & FC_NOUN)
		{
			add_feature (pDph_t,  F_NOUN, NEXTPHONE);
			//printf("FOUND a NOUN %d\n",pDph_t->wordclass[n] & FC_NOUN);
		}
		else if(pDph_t->wordclass[n] & FC_ADJ )
		{
			add_feature (pDph_t,  F_ADJ, NEXTPHONE);
		//	printf("FOUND an ADJ \n",pDph_t->wordclass[n] & FC_NOUN);
		}
		else if(pDph_t->wordclass[n] & FC_VERB
			|| pDph_t->wordclass[n] & FC_ED)/* eab and ed word is a verb 9/31/98 */
		{
			//printf("FOUND a VERB %d\n",pDph_t->wordclass[n] & FC_VERB);
			//pDph_t->number_verbs++;
			add_feature (pDph_t,  F_VERB, pDph_t->nphonetot);
		}
		if(pDph_t->wordclass[n] & FC_FUNC)
		{
			add_feature (pDph_t,  F_FUNC, pDph_t->nphonetot);
			if(pDph_t->promote_helper_verb)
			{
				for (m = n ; n <= pDph_t->nsymbtot; m++)
					{
					if(featb[pDph_t->symbols[m]] & FVOWEL)
					{
						insertphone (phTTS, m, S2);					
						if(m==n) //Changed the phoneme where we're at
						{
							curr_in_sym = S2;
							curr_dur = 0;
							curr_f0 = pDph_t->user_f0[n]; 
							pDph_t->user_f0[n] = 0;
						}
						break;
					}
					}
				pDph_t->promote_helper_verb=0;
			}

		} 


/*
				if(pDph_t->wordclass[n] & FC_ART)
					printf("FOUND a article word %d /n",pDph_t->wordclass[n] & FC_ART);


		if(pDph_t->wordclass[n] & FC_PRON)
		{
			add_feature (pDph_t,  FSTRESS_1, n);
		} 
		if(pDph_t->wordclass[n] & FC_FUNC)
		{
			//	printf("FOUND a FUNCTOR at  %d/n",pDph_t->wordclass[n] & FC_FUNC);
		} */

				
			
#endif


		if (curr_in_sym < TOT_ALLOPHONES)
		{							   /* A real phoneme */

			make_phone (pDph_t, curr_in_sym, n, curr_dur, curr_f0);		/* eab try handling stuff in make */
#ifdef SPANISH
			if (word_init_sw)
			{
				nsyll = countsyll (pDph_t, n); 	/* Get nbr of syllables     */
				syllclass = 0;		   			/* Setup for new syll   */
				iscoda = 0;			   			/* Haven't seen vowel   */
				wordstress = getwordstress (pDph_t,n);
				if ((featb[curr_in_sym] & FSYLL) IS_MINUS)
				{
					add_feature (pDph_t, FWINITC, CURRPHONE);

				}
				word_init_sw = FALSE;
			}
#endif
			/* If syllabic, look ahead to see initial/medial/final syll */
			if ((featb[curr_in_sym] & FSYLL) IS_PLUS)
			{
				in_rhyme = TRUE;
#if defined (ENGLISH_US) || defined (GERMAN)
				word_init_sw = FALSE;
				init_med_final (pDph_t, n);
#endif
#ifdef SPANISH
				if (iscoda == 0)
				{
					syllclass = getsyllclass (pDph_t, n + 1);
					iscoda = FCODA;
				}
				add_feature (pDph_t, nsyll + syllclass + wordstress, CURRPHONE);
#endif
			}
			/* Assign stress feature to consonants */
			else
			{
				get_stress_of_conson (pDph_t, n, compound_destress);
#ifdef SPANISH
				/* Do we need to set "wordstress" here? */
				add_feature (pDph_t,nsyll + syllclass + iscoda, CURRPHONE);
#endif
			}
			/* Assign word-initial feature to consonant(s) */
#if defined ENGLISH_US || defined GERMAN
			if (word_init_sw == TRUE)
			{
				add_feature (pDph_t, FWINITC, CURRPHONE);
			}
#endif
			/* Assign boundary type to segments of rhyme */
			if (in_rhyme == TRUE)
			{
				get_next_bound_type (pDph_t, n);
			}
		}
		else
		{							   /* A non-phoneme */

			switch (curr_in_sym)
			{
/* Per Oliver this code allows for vowels before double consonants to have a faster duration
	BATS 709	EAB 7/2/98*/

#ifdef GERMAN
			case DOUBLCONS:

				add_feature (pDph_t, FDOUBLECONS, NEXTPHONE);
				break;
#endif

			case S1:

				
#ifdef GERMAN
				pDph_t->Word_has_stress =1; // eab 3/37 /98 set word stress marker 
				if (compound_destress == TRUE)
				{
					add_feature (pDph_t, FSTRESS_2, NEXTPHONE);
				}
				else
				{
#endif
					add_feature (pDph_t, FSTRESS_1, NEXTPHONE);
#ifdef GERMAN
				}
#endif
#ifdef MSDBG8
				printf ("add_feature(FSTRESS_1,NEXTPHONE)\n");
#endif
		 		break;
			case S2:
#ifdef GERMAN
				if (compound_destress == FALSE)
				{
					// add_feature (pDph_t, FSTRESS_2, n + 1 /* NEXTPHONE */ );
					add_feature (pDph_t, FSTRESS_2,  NEXTPHONE );
				}
#endif
#if defined (ENGLISH_US) || defined (SPANISH)
				add_feature (pDph_t, FSTRESS_2, NEXTPHONE);
#endif
#ifdef MSDBG8
					printf ("add_feature(FSTRESS_2,NEXTPHONE)\n");
#endif
				break;
#ifdef SPANISH
			case S3:
				/* 
				 * This is being used in the spanish as a marker for ", which causes 
				 * the next clause to be treated differently didn't use feature
				 * bits because there is now room for S3 
				 */
				phrase_after_quote = 1;

				break;
#endif
#ifdef GERMAN
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* add tertiary stress for german DECtalk                				  */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			case S3:
				if (compound_destress == FALSE)
				{
					// add_feature (pDph_t, FSTRESS_3, n + 1  /* NEXTPHONE */ );
					add_feature (pDph_t, FSTRESS_3, NEXTPHONE  );
				}
				break;
#endif
			case SEMPH:
				add_feature (pDph_t, FEMPHASIS, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FEMPHASIS,NEXTPHONE\n");
#endif
#ifdef SPANISH
					pDph_t->emphasisflag = TRUE; /* Reduce other f0 gestures */
#endif
				break;
			case HYPHEN:

#ifdef SPANISH
/* compound_destress = TRUE;         break; 6/94 eab for spanish this is not correct this is an english rule per tony */
				compound_destress = FALSE;
			case MBOUND:

			case SBOUND:
/* printf("\n at syl at %d ",n); */

				add_feature (pDph_t, FISBOUND, CURRPHONE);
				add_feature (pDph_t, FSBOUND, CURRPHONE);
				iscoda = 0;
				syllclass = 0;
#endif
#ifdef GERMAN
				compound_destress = TRUE;
#endif
				break;


#ifdef GERMAN
			case COMMA:
				pDph_t->clausetype = COMMACLAUSE;
				pDph_t->clausenumber++;
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;				
			case PERIOD:
				pDph_t->clausetype = DECLARATIVE;
				pDph_t->clausenumber=0;
				add_feature (pDph_t, FSENTENDS, NEXTPHONE);
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			
			case EXCLAIM:
				pDph_t->clausetype = EXCLAIMCLAUSE;
				pDph_t->clausenumber=0;
				add_feature (pDph_t, FSENTENDS, NEXTPHONE);
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			
					
			case QUEST:          			
				pDph_t->clausetype = QUESTION;
				pDph_t->clausenumber=0;
				add_feature (pDph_t, FSENTENDS, NEXTPHONE);
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			
				
#endif

				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
			case WBOUND:

				pDph_t->number_words++; /* EAB Let's count  up the number of words*/
					/* eab AT slow speaking rate insert a glottal stop that later 
				gets it's timing adjusted and voicing reduced*/
				
			
					/* eab AT slow speaking rate insert a glottal stop that later 
				gets it's timing adjusted and voicing reduced*/
#ifdef SLOWTALK
				if(pKsd_t->sprate <75)
#ifndef SPANISH
					insertphone (phTTS, n+1, Q);
#else
					insertphone (phTTS, n+1, E_Q);
#endif
#endif /*SLOWTALK*/

#ifdef SPANISH
/* printf("at boun  %d \n ",n); */
				if (n > 1)
				{
					add_feature (pDph_t, FISBOUND, CURRPHONE);
				}
#endif
			case PPSTART:
			case VPSTART:
			case RELSTART:
#ifdef ENGLISH_US
				if (pDph_t->symbols[n + 1] == HYPHEN)
				{
					break;			   /* xxx here to allow compound noun insert */
				}
#endif
				word_init_sw = TRUE;
#ifdef SPANISH
				nsyll = 0;
				compound_destress = FALSE;
#endif    
#ifdef GERMAN
				word_init_sw = TRUE;
				compound_destress = FALSE;
#endif
				break;
#if defined ENGLISH_US || defined SPANISH
				case COMMA:
				pDph_t->clausetype = COMMACLAUSE;
				pDph_t->clausenumber++;
#ifdef SPANISH
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, CURRPHONE);
				}
            	nsyll=0;
#endif
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			case PERIOD:
			pDph_t->clausetype = DECLARATIVE;
			pDph_t->clausenumber=0;
#ifdef SPANISH
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, CURRPHONE);
				}
            	nsyll=0;
#endif
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
			case EXCLAIM:
			pDph_t->clausetype = EXCLAIMCLAUSE;
			pDph_t->clausenumber=0;
#ifdef SPANISH
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, CURRPHONE);
				}
            	nsyll=0;
#endif
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;
				
			case QUEST:          			
			pDph_t->clausetype = QUESTION;
			pDph_t->clausenumber=0;
#ifdef SPANISH
				if (n > 1)
				{
					add_feature (pDph_t,FISBOUND, CURRPHONE);
				}
            	nsyll=0;
#endif
				make_phone (pDph_t, SIL, n, curr_dur, curr_f0);
				word_init_sw = TRUE;
				compound_destress = FALSE;
				break;

#endif      /* #if defined ENGLISH_US || defined SPANISH */
			case HAT_RISE:
#ifdef GERMAN
				pDph_t->hat_seen++;
				add_feature (pDph_t, FHAT_BEGINS, NEXTPHONE );
#endif
#if defined ENGLISH_US || defined SPANISH
				add_feature (pDph_t, FHAT_BEGINS, NEXTPHONE);
#endif
#ifdef MSDBG8
				printf ("add_feature(FHAT_BEGINS,NEXTPHONE)\n");
#endif
				break;
			case HAT_FALL:
#ifdef GERMAN
				pDph_t->hat_seen++;
#endif
				add_feature (pDph_t, FHAT_ENDS, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FHAT_ENDS,NEXTPHONE)\n");
#endif
				break;
#ifdef GERMAN
			case HAT_RF:
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* german DECtalk uses also HAT_RF                   					  */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				pDph_t->hat_seen++;
				add_feature (pDph_t, FHAT_ROOF, NEXTPHONE);
				break;
#endif
			case BLOCK_RULES:
				add_feature (pDph_t, FBLOCK, NEXTPHONE);
#ifdef MSDBG8
				printf ("add_feature(FBLOCK,NEXTPHONE)\n");
#endif
				break;
			case NEW_PARAGRAPH:
#ifdef SPANISH
				pDph_t->nf0ev = -2;			   /* Force f0 to power-up value  */
#endif
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
}
 
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
#if defined ENGLISH_US || defined GERMAN
	if ((curr_in_sym == S1) || (curr_in_sym == SEMPH)
		|| (curr_in_sym == HAT_RISE) || (curr_in_sym == HAT_FALL)
		&& (pDph_t->f0mode != PHONE_TARGETS_SPECIFIED)
		&& (pDph_t->f0mode != SINGING))
#endif
#ifdef SPANISH
	if (((curr_in_sym == S1) || (curr_in_sym == SEMPH)
		|| (curr_in_sym == HAT_RISE) || (curr_in_sym == HAT_FALL))
		&& ((pDph_t->f0mode != PHONE_TARGETS_SPECIFIED)
		&& (pDph_t->f0mode != SINGING)))
#endif
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
				&& (*psCurr_f0 <= 37))
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

				*psCurr_dur = 0;
				*psCurr_f0 = 0;
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
		pDph_t->symbols[m] = pDph_t->symbols[m - 1];
		pDph_t->user_durs[m] = pDph_t->user_durs[m - 1];	/* Push down */
		pDph_t->user_f0[m] = pDph_t->user_f0[m - 1];	/* user dur/f0 */
	}
	pDph_t->symbols[loc] = fone;
#ifdef SPANISH
	if(pDph_t->specdur >0)
	{
		pDph_t->user_durs[loc] = pDph_t->specdur;
		pDph_t->specdur=0;
	}
	else
#endif
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
		if (pDph_t->symbols[m] == S1)
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
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	if (pDph_t->symbols[msym1] < pDph_t->symbols[msym2])
	{
#ifdef GERMAN
		pDph_t->symbols[msym1] = pDph_t->symbols[msym2];	/* Boundarys can't have */
#endif
#if defined ENGLISH_US || defined SPANISH
		/* pDph_t->symbols[msym1] = pDph_t->symbols[msym2];    Boundarys can't have */
		if (pDph_t->symbols[msym1] != HYPHEN)
			delete_symbol (phTTS, msym1);
		return;
#endif
	}
	/* user durs or f0 */
#if defined ENGLISH_US || defined SPANISH
	if (pDph_t->symbols[msym2] != HYPHEN)
#endif
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
#ifdef GERMAN
	if ((phoname < 0) || (phoname >= TOT_ALLOPHONES))
	{
		return;						   /* Ignore this phoneme */
	}
#endif
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
#ifdef ENGLISH_US	
	if ((feaname <= 0) || (feaname > FMAXIMUM))
	{
		return;
	}                                          
#endif
#ifdef GERMAN
#ifdef CKFEAT
	if ((feaname <= 0) || (feaname > FMAXIMUM))
	{
		return;
	}                                          
#endif
#endif
	/* Do it */
	pDph_t->sentstruc[location] |= feaname;

}
/* * * * * * * * * * * * * * * * end of ph_sort.c**** * * * * * * * * * * * * * * * * */
#endif /* NWS_US || ENGLISH_UK */

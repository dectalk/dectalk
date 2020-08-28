/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997,1998. All rights reserved.
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
 ***********************************************************************
 *    File Name:    p_gr_tim.c
 *    Author:       Ed Bruckert
 *    Creation Date:MAR 12,1998
 *
 *    Functionality:          
 *		German duration rules copied from Amercian English Duration Rules
 *		because these are a more updated(by Dennis no less) set than the German base
 *		and are very similiar except for the improvements
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------
 * 0001 DK 		09/01/1984		Initial creation
 * 0002 DGC		12/27/1984		Modified for the 80186.
 * 0003 DGC		01/02/1985		Added some conditional calls to the "mstofr"
 *          					routine. Some of the conversions from MS to
 *          					frames caused overflow on 16 bit machines.
 * 0004 DK		02/26/1985		[nt] cluster too long
 * 0005 DK		03/18/1985		period pause and comma pause code had a bug
 * 0006 DK		03/25/1985		Let phrase-final lengthening apply to word before prep
 * 0007 DK		04/17/1985		Reduce compound shortening and short-word lengthening
 * 0008 DK		04/23/1985		Word-final fricatives longer
 * 0009 DK		04/25/1985		Final lengthing before preposition only at slow sprate
 * 0010 DK		05/15/1985		Fix [nt] cluster reduction to happen only at word end
 * 0011 DK		05/17/1985		Make word-init stressed vowels longer, final ptk shorter
 * 0012 DK		05/23/1985		Word-initial vowels not quite so short, less vowel
 *           					lengthening induced by postvoc voiced fric
 * 0013 DK		06/20/1985		Fix nasal durs for "pense,pen,pend"
 * 0014 EAB		06/16/1990		Allow speaking rate to 550 word per min. (from 350)
 * 0015 EAB		07/25/1990		ADDED CHANGE TO ALLOW VARIABLE SETTING OF COMMA PAUSE
 *          					FOR NANCY JARRELL OF CHB TO GET IT TO ZERO. NOTE
 *          					-300 SETTING OF COMPAUSE ALLOWS SETTING TO ZERO BUT
 *          					THE CODE HAS NOT BEEN CHECKED FOR ERRORS.
 *
 *              DURATION RULES
 * 0016 EAB		05/03/1993		ADDED NEW PHONE DF TO DIFFERENTIATE T FROM D FLAP
 *                             	and added rules to make use of it.
 * 0017 EAB		05/02/1993		restrucutred a bunch of stuff-reduced 
 *                              
 * 0018 EAB		05/02/1993		ADDED PETROCELLI'S NEW DURATION RULES.
 * 0019 MGS		03/25/1996		Merged win 95 code to 42c
 * 0020 MGS		04/01/1996		Added MSDBG statements for debugging
 * 0021 MGS		04/02/1996		made sure all local variable are initialized
 * 0022 MGS		06/06/1996		moved phtiming here.
 * 0023 SIK		07/12/1996		Cleaning up and maintenance
 * 0024 GL		10/30/1996		merge the change from V43 code base.
 * 0025 GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 0026 MGS		08/26/1997		Merged in fasttalk
 * 0027 EAB		09/08/1997		Added in changes to improve fastalk typing and SLOWSPEAK
 * 0028 EAB		10/12/1907		Removed Obsolete prphdurs and prdurs bats 495(performance)
 *								And improved typing_mode
 * 0029 EAB		03/12/1998		After evaluation of the German code I determined that it was
 *								not worth bothering with and the "OLD" p_gr_tim.c is in the 
 *								trashcan along with all of it's useless history
 * 0030 EAB		04/27/1998		Tuned for German with Oliver-many changes 
 * 0031 EAB     04/29/1998		slowed down speaking rate for new listeners better not have it too fast on
								the default. Also added some new rules to help the long confounded 
								compounded words.
 * 0032 EAB		04/29/1998		increased vowel count for duration rule of edit 31 to make demostration be
								unaffected. 
 * 0033 EAB		05/12/1998		Found a way to solve German I then silence then H problem. The aspiration
 *								(high for German) was able to glitch the filters when ramping too rapidly from silence
								BATS 667
 * 0034 EAB		06/09/1998		Fixed BATS 709 This problem  exists in all languages. When a plosive is folloed by another plosive
								the second one is slower......

 * 0035 EAB		07/02/1998		BATS 709 Per Oliver this code allows for vowels before double consonants to have a faster duration
 * 0036 EAB		07/08/1998		BATS 709-MISC
 * 0037 EAB		07/13/1998		Found redundant tcumdur code that was not needed. It's calculated
 *								in phinton1/2 now.BATS 713 tcumdur addition removed
 * 0038 EAB		08/05/1998		BATS 734
 * 0039 EAB		02/03/1999		Did some more work on syllable timed rythm
 * 0040 MGS		04/13/2000		Changes for integrated phoneme set 
 * 0041 EAB		08/02/2000		Unified Phoneme Set Changes
 * 0042 CAB		10/16/2000		Changed copyright info
 * 0043 EAB		10/26/2000		Modifiy adjust timing
 * 0044 EAB		02/23/2001		Updated copyright info
 * 0045 EAB		03/13/2001		Modify per work with Winfried - final r in word shortened
 * 0046 EAB		07/10/2001		Modified timing os greman short vowels 
 * 0047 CAB		05/02/2002		Updated copyright info
 */

extern int min_timing(LPTTS_HANDLE_T phTTS, int phone);
extern int inh_timing(LPTTS_HANDLE_T phTTS, int phone);
//extern __inline short phone_feature(PDPH_T pDph_t, int phone);
 
/* ******************************************************************
 *      Function Name: phtiming()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS Text-to-speech handle
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
//#define DEBUGPHT
void gr_phtiming (LPTTS_HANDLE_T phTTS)
{
	short                   psonsw = 0, posvoc = 0;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	short                   stcnt = 0;
	short                   syldur = 0;
	short                   ncnt = 0;
	short                   endcnt = 0;
	short                   sonocnt = 0;
	short					vowcnt=0;
	short                   adjust = 0;
	short                   emphasissw = FALSE;/* Made local and initialized */
	short                   pholas = GEN_SIL;	   /* Made local and initialized */
	short                   struclas = 0;	   /* Made local and initialized */
	short                   fealas = phone_feature( pDph_t,GEN_SIL); /* Made local and initialized */
	short                   prcnt = 0, durinh = 0, durmin = 0, deldur = 0, nphon = 0;
	short                   phocur = 0, feacur = 0, feasyllabiccur = 0;
#ifdef _DEBUG
	short					phontmp;
#endif
	short                   struccur = 0, strucboucur = 0, strucstresscur = 0;
	short                   dpause = 0;
	short					arg1,arg2;	/* arguments for the phmath routines. */
#ifdef NEWTYPING_MODE
	short					numbersonor;
#endif

#ifdef TYPING_MODE
	short					minsize;
#endif

	/* Initialization  (Set sprat1,sprat2, zero counters, print debug) */

	init_timing (phTTS);


	pDph_t->tcumdur =0;/* 9/97EAB Since durations are done differently 
					   in typing mode calculation
					   of total dur must be moved to here also
						NOTE TO CARL THIS MAY HAVE ALREADY BEEN SUBMITTED BY DOUG*/

#ifdef NEWTYPING_MODE
	numbersonor=0;
	for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
	{
		feacur=phone_feature( pDph_t,pDph_t->allophons[nphon]];
		if((feacur & FSONOR) IS_PLUS && pDph_t->allophons[nphon] != GEN_SIL)
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
			fealas = phone_feature( pDph_t,pholas);
		}
		phocur =  pDph_t->allophons[nphon];
#ifdef _DEBUG
		phontmp = phocur & PVALUE;
#endif
		struccur = pDph_t->allofeats[nphon];
		strucboucur = struccur & FBOUNDARY;
		if (strucboucur & FWBNEXT)
		{
			/*wboundary zero vowcnt*/
			vowcnt=0;
		}
		// This code recognizes that stres is set on non-syll's in german and therefore
		//we need to hold stress value until after a syllable nucleus
		if(strucstresscur)
			//had stress phone was a syllablic 
			if(feacur)
				//reset strucstresscur to zero
				strucstresscur=0;

		feacur = phone_feature( pDph_t,phocur);
		//Note this is NOT equiv to an else on the ablove code
		if(!strucstresscur)
			feasyllabiccur = feacur & FSYLL;
		
			
		strucstresscur = struccur & FSTRESS;

		if (nphon < (pDph_t->nallotot - 1))
		{
			pDphsettar->phonex_timing = pDph_t->allophons[nphon + 1];
			pDphsettar->strucnex = pDph_t->allofeats[nphon + 1];
			pDphsettar->feanex = phone_feature( pDph_t,pDphsettar->phonex_timing);
		}
		if((struccur & FSTRESS) IS_PLUS)
		{
			pDphsettar->numstresses++;
		}	
		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
		/* Duration Rules                         						   */
		/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

		/* Use user-specified duration if one exists.         */
		/* User durations can be huge; call the conversion routine.   */
		if (pDph_t->user_durs[nphon] != 0)
		{
			pDphsettar->durxx = mstofr (pDph_t->user_durs[nphon] + 4);
#ifdef MSDBG5
			printf ("durxx = mstofr(user_durs[nphon]+4) durxx=%d\n", pDphsettar->durxx);
#endif

#ifdef DEBUG_USER_PROSODICS
			printf ("\tFound user_dur[%s] = %3d frames in PHTIMING\n",
					phprint (phocur), pDphsettar->durxx);
#endif

			goto break3;
		}

		/* Convert inherent and minimum duration in msec to frames.   */
		/* Fixed overflow in 16 bits is not possible on these ones.   */
		/* EAB fix this for German normalization, my guess is the plus 50 is
		a rounding thing         */
		/* eab 6/9/98 Prentke-Romich feel default should be slower so I changed
		(inhdr[phocur] * 11) to ... BATS709  */

		durinh = (((inh_timing(phTTS,phocur) * 10) + 50) >> 6)+2;
		durmin = (((min_timing(phTTS,phocur) * 10) + 50) >> 6)+2;

		/* Additive increment */
		deldur = 0;
		/* Multiplicative constant (let 128 be 100%) */
		prcnt = 128;

		/* 
		 * Rule 1: Pause durations depend on syntax
		 *         Clause-initial pause should be minimal, i.e. NF64MS (enough
		 *         time for initial fricative to build up amp gradually)
		 *         Shortened to 0, except for fricitive and plosive in next phone
		 *         we go do 7...
		 */

		if (phocur == GEN_SIL)
		{
			if (((pDphsettar->feanex & FVOICD) && (pDphsettar->feanex & FOBST)) || (pDphsettar->feanex & FPLOSV))
				/* GL 10/30/1996, merge the change from V43 code base */
				/* dpause = NF7MS; */
				dpause = 2;
			else
				/* dpause = 0; */
				dpause = 3; /* EAB BATS 667 When the previous thing spoken (by anybody) was a high
							front vowel and the next thing (new clause) begins with an H
							then the effect is to ramp f2 too rapidly later this can
							possibly be fixed by better initalization code but for now this is good*/

			pDph_t->asperation = (pDph_t->asperation - BASE_ASP) / 10;

			/* Treatment of other than clause-initial pauses: */
			if (nphon > 1)
			{
				/* If this clause ends in a comma, use short pause */
				/* Note extra compause added if user command [:dv cp __ ] */
				if ((struclas & FBOUNDARY) == FCBNEXT)
				{
#ifdef MSDEBUG
					printf ("asperation 1111 asperation=%d\n", pDph_t->asperation);
#endif

					if (pDph_t->asperation > MAX_ASP_COMMA)
						pDph_t->asperation = MAX_ASP_COMMA;
					else if (pDph_t->asperation < MIN_ASP_COMMA);

					pDph_t->asperation = MIN_ASP_COMMA;
#ifdef MSDEBUG
					printf ("asperation is now screwed up 1111\n");
#endif
					dpause = pDph_t->nfcomma + pDph_t->compause + pDph_t->asperation;
				}
				/* End of clause has long pause if ends with "." "!" or "?" */
				/* Note extra perpause added if user command[:dv pp __ ] */
				else
				{
#ifdef MSDEBUG
					printf ("asperation 2222 asperation=%d\n", pDph_t->asperation);
#endif
					if (pDph_t->asperation > MAX_ASP_PERIOD)
						pDph_t->asperation = MAX_ASP_PERIOD;
					else if (pDph_t->asperation < MIN_ASP_PERIOD);
					pDph_t->asperation = MIN_ASP_PERIOD;
#ifdef MSDEBUG
					printf ("asperation is now screwed up 2222\n");
#endif
					dpause = pDph_t->nfperiod + pDph_t->perpause + pDph_t->asperation;
				}

			}
			/* Make sentence-initial pause long if this is a new paragraph */
			else if (pDph_t->newparagsw != FALSE)
			{
				dpause = pDph_t->nfperiod;
			}
			pDph_t->asperation = 0;

			/* Effect of speaking rate greatest on pauses */

			arg1 = dpause;
			arg2 = pDphsettar->sprat1;
			dpause = mlsh1 (arg1, arg2);
			/* Minimum pause is NF64MS */
			/* EDIT 7/25/90-EAB CHANGED MINUMUM FROM 64MS TO 7MS AND ADDED MAGIC */
			/* NUMBER COMAPAUSE TO SET IT TO 0 FOR TESTING */
			if (dpause < NF7MS)
				dpause = NF7MS;

			/* Skip over remaining duration rules if input is GEN_SIL */

			pDphsettar->durxx = dpause;
#ifdef MSDBG5
			printf ("durxx = dpause durxx=%d\n", pDphsettar->durxx);
#endif

			durinh = pDphsettar->durxx;		/* for debugging print only */
			durmin = pDphsettar->durxx;
			
			goto break3;
		}
 // bats 709 back in for now as a result of finer tuning of other arreas  7/8/98
 /* For German this is at least way to strong and may not be true at all*/		
		/* Rule 2: Lengthening of segments in clause-final rime */
		if (strucboucur >= FCBNEXT)
		{
			deldur = NF50MS;
			/* Except for plosives and voiced fricatives */
			if (((feacur & FVOICD) IS_PLUS)
				&& ((feacur & FOBST) IS_PLUS))
			{
				deldur = NF15MS;
			}
			if ((feacur & FPLOSV) IS_PLUS)
			{
				deldur = 0;
			}

			/* Less lengthening if next seg is sonorant in same rime */
			if ((pDphsettar->feanex & FSON1) IS_PLUS)
			{
				deldur -= NF15MS;
			}
			
		}



		/* Lengthening of phrase-final postvocalic nasal */
		 if (((feacur & FNASAL) IS_PLUS) && (strucstresscur IS_MINUS) && 
		  (strucboucur >= FVPNEXT)) 
		 {
			 deldur = deldur;
		 }

		 /* prdurs(pDph_t,phocur,durinh,durmin,deldur,prcnt,3);  
		 * END OUT 
		 */

		/* Rule 4: Shorten syll segs in syll-init and medial positions, */
		/* and in unstressed monosyllables */
		 /* BATS 709 eab 6/10/98 It appears that single syllable 
		 words has the vowel greatly compressed excep that for next round with
		 oliver try less reduction if it's a noun */

		if (feasyllabiccur IS_PLUS)
		{
			if (((strucstresscur & FSTRESS_1) IS_MINUS)
				&& ((struccur & FTYPESYL) == FMONOSYL) )
			{
		
				/* Secondary-stressed monosyllables shortened by 85% 
				note lie 15% multplier is .85*/
				/* BAT 734--monosyllabic words shortened too much eab 8/4/98*/ 
				arg1 = N75PRCNT;
				

				if (strucstresscur IS_MINUS)
				{
					/* Unstressed monosyllable shorted by 70% */

					arg1 = N70PRCNT;
				}
				arg2 = prcnt;
				prcnt = mlsh1 (arg1, arg2);
				
			}
			else if((strucstresscur & FSTRESS_1) IS_MINUS)
				//unstressed ex 
					if(phocur == GRP_EX)
					{
						if(pDphsettar->feanex & FNASAL)
						{
						durmin -= ( durmin >> 2);
						}
						arg1= N70PRCNT;
						prcnt = mlsh1 (arg1, prcnt);
						

					}


			else if (((struccur & FTYPESYL) != FMONOSYL))
			{
				arg1 = N100PRCNT;
				
				/* Initial vowel of each word is shorter by  0.7)
				EAB		7/8/98		BATS 709 tuning*/
				arg1 = N70PRCNT;
			


				if ((struccur & FTYPESYL) > FFIRSTSYL)
				{
					/* Other nonfinal syllables shortened by .85)*/

					arg1 = N85PRCNT;
				}
				arg2 = prcnt;
				prcnt = mlsh1 (arg1, arg2);
				/* Stressed vowels are more compressible if in nonfinal syll */
				/* OUT
				 * if (strucstresscur IS_PLUS) { durmin -= (durmin>>2); }                  
				 * END OUT 
				 */
				
			}
			/* break1: *//* MVP :Never used this label commented out */
#ifdef RIENER
			/* Rule 5: Shorten vowels in polysyllabic words */
			if ((struccur & FTYPESYL) != FMONOSYL)
			{
				/* Multiply by 0.8 change to .90 */
				/* eab 4/19/98 hack change to help long complex words not be said too fast
				6/13/98 change back now that we're fixing compound words 
				EAB		7/8/98		BATS 709*/
			
				arg1 = prcnt;
				arg2 = N80PRCNT;
				prcnt = mlsh1 (arg1, arg2);
				
				
			}
#endif
		}
		
		
		/* Rule 6: Shortening of non-word-initial consonants */
		if ((feasyllabiccur IS_MINUS) && ((struccur & FWINITC) IS_MINUS))
		{
			if (((feacur & FOBST) IS_PLUS)
				&& ((feacur & FPLOSV) IS_MINUS)
				&& ((struccur & FBOUNDARY) == FWBNEXT))
			{
				/* Except that word-final fricatives are lengthened */
				deldur += NF20MS;
			}
			else
			{
				/* Multiply by 0.85 */
				arg1 = prcnt;
				arg2 = N85PRCNT;
				prcnt = mlsh1 (arg1, arg2);

			}
			
		}
#ifdef notinfornow
		/* Rule 7: Shortening of unstressed segs */			
		/* if there is stress is it secondary in which case shorten less so*/
		if ((strucstresscur & FSTRESS_2) IS_PLUS)
			{
				arg1 = prcnt;
				arg2 = N47PRCNT;
				prcnt = mlsh1 (arg1, arg2);
			}
#endif
#ifdef notinfornow
		if ((strucstresscur & FSTRESS) IS_MINUS)
		{

			if ((durmin < durinh) && ((feacur & FOBST) IS_MINUS))
			{
				/* Non-stressed segs more compressible (except obstruents) */
				if (strucstresscur IS_MINUS)
				{
					durmin -=  (durmin >> 2);
				}
				else
				{
					durmin -= (durmin >> 3);	/* 2-stress */
				}
			}

			/* Non-primary-stressed syllabic segments shorter */
			if (feasyllabiccur IS_PLUS)
			{
				/* Shorten word - medial syllable more */
				if ((struccur & FTYPESYL) == FMEDIALSYL)
				{

					prcnt = prcnt >> 2;
				}
				else
				{
					/* Multiply by 0.7 */

					arg1 = prcnt;
					arg2 = N80PRCNT;
					prcnt = mlsh1 (arg1, arg2);
				}
				/* Special case: Schwa next to a flap or followed by HX */
				if ((phocur == GRP_EX) )
				{
					if( pDphsettar->phonex_timing == GRP_H)
					{
						deldur += NF25MS;
					}
				}
			}
		}
#endif
		//Rule 7A eab 3/14/01 Rule to shorten r at end of word...

		if (phocur == GRP_R
			&& (struccur & FBOUNDARY) >= FWBNEXT)
		{
			prcnt -= 50;
		}

		/* Rule 8: Lengthen each seg of an emphasized syllable, including rime */
		if (((struccur & FWINITC) IS_PLUS)
			|| ((feasyllabiccur IS_PLUS) && (strucstresscur != FEMPHASIS)))
		{
			emphasissw = FALSE;
		}
		if (strucstresscur == FEMPHASIS)
		{
			emphasissw = TRUE;
		}
		if (emphasissw == TRUE)
		{
			deldur = deldur + NF20MS;
			if (feasyllabiccur IS_PLUS)
				deldur = deldur + NF40MS;
			
		}
		//EAB This rule must be modified for German for the code to operate 
		//correctly so let's start now 12/29/99
		/* Rule 9: Influence of final conson on vowels and postvoc sonor */
		/* Switch to indicate presence of a postvocalic sonorant */
		psonsw = 0;	/* Set to 1 if +syl is followed by sonor */
		arg1 = FRAC_ONE; /* Default if posvoc not obst */
		posvoc = GEN_SIL; /* Default postvocalic consonant */
		/* Does rule apply ? */

		if ((feasyllabiccur IS_PLUS)
				&& ((struccur & (FSTRESS | FWINITC)) IS_MINUS)
				&& ((pDphsettar->feanex & FOBST) IS_PLUS))
		{
			/* Determine whether next segment is postvocalic consonant */
			if (((pDphsettar->feanex & FSYLL) IS_MINUS)
				&& ((pDphsettar->strucnex & (FSTRESS | FWINITC)) IS_MINUS))
			{
				posvoc = pDphsettar->phonex_timing;
				/* See if postvocalic consonant is a sonorant */
				/* or if postvoc sonor is followed by an obst cons */
				if ( (((phone_feature( pDph_t,pDph_t->allophons[nphon + 1]) & FCONSON) IS_PLUS)
					&& ((phone_feature( pDph_t,pDph_t->allophons[nphon + 1]) & FSONOR) IS_PLUS))
					&& ((phone_feature( pDph_t,pDph_t->allophons[nphon + 2]) & FOBST) IS_PLUS)
					&& ((pDph_t->allofeats[nphon + 2] & (FSTRESS | FWINITC)) IS_MINUS))
				{
					psonsw = 1;
					posvoc = pDph_t->allophons[nphon + 2];
				}
				/* If posvoc is now voicless or obst or nasal, do something */
				if (posvoc != GEN_SIL)
				{
					if ((phone_feature( pDph_t,posvoc) & FVOICD) IS_MINUS)
					{
						deldur = deldur - (deldur >> 2);
						/* Multiply by 0.8 if a voiceless fric */

						arg1 = N80PRCNT;
						if (((phone_feature( pDph_t,posvoc) & FPLOSV) IS_PLUS)
							|| (posvoc == GRP_CH))
						{
							/* Multiply by 0.7 if a voiceless plosive */

							arg1 = N80PRCNT;
						}
					}
					/* Postvocalic segment is voiced */
					else
					{

						/* Assume voiced plosive, multiply by 1.2 */
						/*EAB found that this rule lenghthened syallbic n by
						too much in final position 11/13/97 This I left in
						because it is very specific and safe */
						if ((phone_feature( pDph_t,posvoc) & FOBST) IS_PLUS && phocur != GRP_EN)
						{

							arg1 = N120PRCNT;
							/* Voiced fricative, add 25 ms to +syl */
							if (((phone_feature( pDph_t,posvoc) & FPLOSV) IS_MINUS)
							/* OUT                && (strucboucur >= FVPNEXT)   END OUT */

								&& ((feacur & FSYLL) IS_PLUS))
							{
								deldur = deldur + NF15MS;
							}

						}
						/* Nasal, multiply by 0.85 */
						else if ((phone_feature( pDph_t,posvoc) & FNASAL) IS_PLUS)
						{
							arg1 = N85PRCNT;
						}
					}
				}
			}
			
			/* Attenuate effect if not phrase-final or +syl followed by sonor */
			/* or if postvoc sonor next */
			if ((strucboucur < FVPNEXT) || (psonsw == 1))
			{
				arg1 = FRAC_HALF + (arg1 >> 1);
			}
			/* Multiply by 0.1 if [nt] is  postvocalic cluster (T non word init) */
			if (((phocur == GRP_N) && (pDphsettar->phonex_timing == GRP_T))
				&& ((pDphsettar->strucnex & (FWINITC | FSTRESS)) IS_MINUS))
			{

				arg1 = N10PRCNT;
				if (((phone_feature( pDph_t,pDph_t->allophons[nphon + 2]) & FSYLL) IS_PLUS)
					&& ((pDph_t->allofeats[nphon + 2] & FMEDIALSYL) IS_MINUS))
				{
					pDph_t->allophons[nphon + 1] = GRP_D;	/* Change to [d] after durs */

					arg1 = N70PRCNT;
				}
			}
			arg2 = prcnt;
			prcnt = mlsh1 (arg1, arg2);
			if (arg1 != FRAC_ONE);
				
		}
		/* Rule 10: Lengthen first vowel of a two vowel sequence */
		if (feasyllabiccur IS_PLUS)
		{
			if ((pDphsettar->feanex & FSYLL) IS_PLUS)
			{
				deldur = deldur + NF30MS;
				
			}
#ifdef DONTBELIEVEIT
			/* Rule 11: Lengthen word-initial stressed vowel of polysyllabic word */
			if (((struccur & FTYPESYL) == FFIRSTSYL)
				&& ((struccur & FSTRESS_1) IS_PLUS)
				&& ((struclas & FWINITC) IS_MINUS))
			{
				deldur += NF25MS;
				
			}
#endif
		}

		/* Rule 13: Shorten consonant clusters */
		else
		{
			if ((feacur & FCONSON) IS_PLUS
				&& (pholas != GRP_S))
			{
				if (((pDphsettar->feanex & FCONSON) IS_PLUS)
					&& (strucboucur < FVPNEXT))
				{
					/* First consonant of a two - consonant sequence */
					/* Default shortening is 70 percent */
					arg1 = N70PRCNT;
					/* Length nasal by 1.5 if next cons is word-init */
					if (((feacur & FNASAL) IS_PLUS)
						&& ((pDphsettar->strucnex & FWINITC) IS_PLUS))
					{
						arg1 = N150PRCNT;
					}
					/* Also make min duration shorter for C's in a cluster */
					else
						durmin -= (durmin >> 2);
					/* Shorten [S,TH] followed by a plosive or [SH] */
					if ((phocur == GRP_S) )
					{
					
						if ((pDphsettar->feanex & FPLOSV) IS_PLUS)
						{
							/* Multiply by 0.5 */
							arg1 = FRAC_HALF;
							
						}
						if (pDphsettar->phonex_timing == GRP_SH)
						{
							pDphsettar->durxx = NF20MS;
#ifdef MSDBG5
							printf ("durxx = NF20MS durxx=%d\n", pDphsettar->durxx);
#endif
							goto break3;
						}
						/* eab 3/27/98 if phonex == s (double s) then shorten it because full double s is too LONG*/
					if(pDph_t->allophons[nphon+1] == GRP_S)
						{
							durmin=0;
							arg1 = N10PRCNT;
						}
						

					}
					arg2 = prcnt;
					prcnt = mlsh1 (arg1, arg2);
					
				}
				if (((fealas & FCONSON) IS_PLUS)
					&& ((struclas & FBOUNDARY) < FVPNEXT))
					/* eab 4/15/98 German measurements indicate this is only slightly
					true for an mn-sequence if allows for mm and nn conditions but these
					should never occur in actuality */
				{
					/* Second consonant of a two-consonant sequence */
					/* Multiply by 0.7 */
					if((phocur == GRP_M || phocur == GRP_N ) && (pholas == GRP_M || pholas == GRP_N ))
					{
						arg1=N80PRCNT;
					}
					else
					{
						arg1 = N70PRCNT;
					}
					/* Also make min duration shorter for C's in a cluster */
					durmin -= (durmin >> 2);
					if ((feacur & FPLOSV) IS_PLUS)
					{
						/* Shorten plosive if preceded by [s] */
						/* Multiply by 0.6 */
						if (pholas == GRP_S)
						{
							arg1 = N60PRCNT;
						}
						/* Shorten unstr plos if preceded by nasal */
						if ((fealas & FNASAL) IS_PLUS)
						{
							/* Multiply by 0.1 */
							if (strucstresscur IS_MINUS)
								arg1 = 1638;
						}
						/* OUT                      Do not shorten a plos preceded by a plos if ((fealas & FPLOSV) IS_PLUS) arg1 = FRAC_ONE;
						 * END OUT */
					}
					arg2 = prcnt;
					prcnt = mlsh1 (arg1, arg2);
					
				}
			}
		}
		
		/* Rule 14: Increase sonor dur if preceding plosive is aspirated */
		if ((feacur & FSON1) IS_PLUS)
		{
			if (((fealas & FVOICD) IS_MINUS)
				&& ((fealas & FPLOSV) IS_PLUS))
			{
				deldur = deldur + NF20MS;
				
			}
		}
		
		/* Rule 15: Increase duration of phrase-initial vowels (following silence) */
		if ((feacur & FVOWEL) IS_PLUS)
		{
			if (pholas == GEN_SIL)
			{
				deldur = deldur + NF20MS;
				
			}
		}
		
		/* Rule 16: Increase vowel dur if preceeded by non-nasal sonor conson */
		/* (May not apply to function words such as "was,were") */

		if ((feacur & FVOWEL) IS_PLUS)
		{
			if (((fealas & FSON2) IS_PLUS)
				&& ((fealas & FNASAL) IS_MINUS) 
				&& pholas != GRP_RR)
			{
				if (deldur == 0)
					deldur = NF20MS;
				
			}
		}
		/* eab 4/28/98 TS has a strong influence on following vowel especailly back vowels
		and therefore if they precede a back or rounded vowel they're duration needs to be increased
		to allow time for vowel stabilization and perception but not fully studied first attempt will
		be the most general lengthening a voewl after TS*/
		if(pDph_t->allophons[nphon-1] == GRP_TS
			&& (feacur & FVOWEL) IS_PLUS  )
		{
			if(pDph_t->allophons[nphon] == GRP_OH)
			{
				prcnt +=75; 
			}
			else
			{
				prcnt +=25;/* eab from 50 7/29/98 BATS734*/
			}
		}


#ifdef NEVER_USED
		/* xxxx testing showed new rules not good */
			
		// hurt		influence
		/* 
		 * Rule 18:Shortening of prevocalic clustered semivowels clustered 
		 * on left by stop or frcative. Before this rule, many sounded like 
		 * syllabic reduced segmanents, so fruit sounded like feruit. 
		 */

		if((feacur & FSONCON) IS_PLUS && ((fealas & FOBST) IS_PLUS))
		{
			arg1 = prcnt;
			arg2 = N60PRCNT;
			prcnt = mlsh1 (arg1, arg2);
		}

#endif

#ifdef REWRITERULEFORGERMAN
		/* RULE 19: Shorten function word final TH as in "with: */
		if((phocur == TH) && ((struccur & FTYPESYL) == FMONOSYL) &&
								                         (strucboucur >= FWBNEXT) &&
								                         (strucstresscur == FNOSTRESS))
		{
			arg1 = prcnt;
			arg2 = N60PRCNT;
			prcnt = mlsh1 (arg1, arg2);
			

		}
#endif

#ifdef NOTGERMAN
		/* RULE 20: lengthen i in "the"("me,he" also OK followed by vowel */
		if ((phocur == IY) && ((struccur & FBOUNDARY) > FMBNEXT) &&
			(strucstresscur == FNOSTRESS) &&
			((struccur & FTYPESYL) == FMONOSYL))
		{
			arg1 = prcnt;
			arg2 = N150PRCNT;
			prcnt = mlsh1 (arg1, arg2);
			
		}
#endif
		/* 
		 * RULE 21 SHorten stop following a stop and preceding a fricative 
		 * within the same sylable. Before this words like products have just as long 
		 * a /k/ and /t/ as a word missing the other stop would have, whereas in
		 * reality the /t/ should be reduced greatly. Cut minimum duration in
		 * half, and reduce the multiplier a lot. Probably actually want to reduce 
		 * this eve more. 
		 */

		if (((feacur & FPLOSV) IS_PLUS) &&
			((fealas & FPLOSV) IS_PLUS) &&
			((pDphsettar->feanex & FOBST) IS_PLUS) &&
			(strucboucur > FMBNEXT))

		{
			durmin = durmin >> 1;
			arg1 = prcnt;
			arg2 = N25PRCNT;
			prcnt = mlsh1 (arg1, arg2);
			
		}

		/*EAB		7/8/98		BATS 709*/
		/* EAB GRBUG2 If plosive followed by a plosive then duration of second plosive longer this should be true for ALL
		   languages
		*/
		if (((phone_feature( pDph_t,pDph_t->allophons[nphon]) & FPLOSV) IS_PLUS) && ((phone_feature( pDph_t,pDph_t->allophons[nphon-1]) & FPLOSV) IS_PLUS))
		{
			durmin += NF40MS;
		}
		/*EAB		7/8/98		BATS 709*/
		/* Per Oliver this code allows for vowels before double consonants to have a faster duration
		   but not for monosyllabic words like stammt which get reduced by the mono syllable reduction rule
		   EAB 7/2/98
		*/

		if((pDph_t->allofeats[nphon+1] & FDOUBLECONS)
			&& ((struccur & FTYPESYL) != FMONOSYL))
		{	
			prcnt -= 40;
			if(prcnt <=0)
				prcnt=1;
		}

		pDphsettar->strucstressprev = strucstresscur;

		/* Finish up */

		/* Set duration from durinh, durmin, and percent */
		/* eab 4/28/98 BUG This overides earlier durzz rules*/

		pDphsettar->durxx = (prcnt * (durinh - durmin)) DIV_BY128;
#ifdef MSDBG5
		printf ("durxx = (prcnt * (durinh - durmin)) DIV_BY128 durxx=%d\n", pDphsettar->durxx);
#endif
		pDphsettar->durxx += durmin;   /* SHOULD BE DONE AFTER SPRATE ADJUSTMENT */
#ifdef MSDBG5
		printf ("durxx += durmin durxx=%d\n", pDphsettar->durxx);
#endif

		/* Rule for slow speaking lengthen inserted glotal stop*/
		if(phocur == USP_Q && pKsd_t->sprate< 75) 
			pDphsettar->durxx = 1+((80-pKsd_t->sprate) );

		/* Effect of speaking rate */
		if ((pDphsettar->sprat0 != 180) && (pDphsettar->durxx != 0))
		{
			arg1 = pDphsettar->durxx;
			arg2 = pDphsettar->sprat2;
			pDphsettar->durxx = mlsh1 (arg1, arg2) + 1;		/* Round upwards */
#ifdef MSDBG5
			printf ("durxx = mlsh1(arg1,arg2)+1 durxx=%d\n", pDphsettar->durxx);
#endif

			/* Effect of speaking rate on additive increment to dur */
			arg1 = deldur;
			arg2 = pDphsettar->sprat1;
			deldur = mlsh1 (arg1, arg2);
		}
		/* Add in rule-governed additive increment to dur  */
		pDphsettar->durxx = pDphsettar->durxx + deldur;
#ifdef MSDBG5
		printf ("durxx = durxx + deldur durxx=%d\n", pDphsettar->durxx);
#endif

	if (pDphsettar->durxx < 0 ) /*eab oct 93 found dur could get set =0 compromise*/
		pDphsettar->durxx=1;    /*over putting command later(safer) see comment above*/
break3:  //Need to change this location for stressed timed and singing to both work correctly eab 12/1/98

		pDph_t->allodurs[nphon] = pDphsettar->durxx;	   /* Save in array for phonetic comp */
		if (pDph_t->allophons[nphon] != GEN_SIL)	   			   /* don't count silence 			  */
		{
		/*   printf("add %d for phon %d\n",pDphsettar->durxx,pDph_t->allophons[nphon]); 	  */
			syldur += pDphsettar->durxx;
		}
		/* Count  vowels in word */
		if ((feacur & FVOWEL) IS_PLUS && pDph_t->allophons[nphon] != 0)
		{
			/* printf("+voe on  %d sonocnt=%d\n",pDph_t->allophons[nphon],sonocnt); */
			vowcnt++;
		}

		/* Instead of counting vowels now count sonorants */
		if ((feacur & FSON1) IS_PLUS && pDph_t->allophons[nphon] != 0)
		{
			/* printf("+voe on  %d sonocnt=%d\n",pDph_t->allophons[nphon],sonocnt); */
			sonocnt++;
		}
		//EAB 11/20/98 Found that consonants before vowel are also marked with stress and these we want to ignore here
		if( pDph_t->number_words >= 3)
		{
			if( ((struccur & FSTRESS) IS_PLUS))
				if((feasyllabiccur IS_PLUS) )
				{
				/* printf("strucc=%o of phon %d at %d",struccur,pDph_t->allophons[nphon],nphon); */
#ifdef DEBUGPHT
					printf (" 2fbound struccur%o, p= %d\n", struccur, pDph_t->allophons[nphon]);
					printf ("syldur = %d \n ", (syldur * 64) / 10);
					printf ("vowcnt=%d\n", vowcnt);
#endif
					switch (sonocnt)
					{
						case 1:
							adjust = (pDph_t->timeref - (syldur ));
							break;
						case 2:
							adjust = ((pDph_t->timeref - (syldur )) >> 1);
							break;
						case 3:
							/* do 3/8 instead of divide by 3 */
							adjust = ((pDph_t->timeref - (syldur )) >> 3) * 3+1;
							break;
						case 4:
							adjust = ((pDph_t->timeref - (syldur )) >> 3);
							break;
						case 5:
							adjust = ((pDph_t->timeref - (syldur )) >> 4);
							break;
						case 6:
							adjust = ((pDph_t->timeref - (syldur )) >> 5 );
							break;
						case 7:
							adjust = ((pDph_t->timeref - (syldur )) >> 5);
							break;
						case 8:
							adjust = ((pDph_t->timeref - (syldur )) >> 6);
							break;
						case 9:
							adjust = ((pDph_t->timeref - (syldur )) >> 6);
							break;
						case 10:
							adjust = ((pDph_t->timeref - (syldur )) >> 7);
							break;
						default:
							adjust = ((pDph_t->timeref - (syldur )) >> 7);
#ifdef DEBUGPHT
							printf ("WHY HERE??");
							printf ("sonocnt=%d phon= %d nphon= %d\n", sonocnt, pDph_t->allophons[nphon], nphon);
#endif
			
							//	WINprintf("%d vcnt %d\n ",adjust,vowcnt);
							break;
					}

#ifdef FASTTALK
					/* 0015 EAB     06/11/97	Added in Fasttalk time alignement feature   */

					if (pDphsettar->sprat0 <= 250) /*note above 250 sprat0=250+(sprat-250)>>1 */
					{
						adjust=0;
					}
					else if(pDphsettar->sprat0 >= 325)
						adjust=adjust>>1;
					else if(pDphsettar->sprat0 >= 250)
						adjust=adjust>>2;
		
#endif
					//if(nphon <=3) //first stress at begining vowel of a stessed word reduce effect
					//	adjust=adjust>>2;
					//else
						//ROund Up
				
						adjust = 0; // (adjust+1)>>1;

					if (pDph_t->user_durs[nphon] != 0 || pDph_t->f0mode == SINGING)
					{
						adjust = 0;
					}
			
					//WINprintf("stcnt %d endcnt %d \n",stcnt,nphon);
					//adjust = 0;

					for (endcnt = nphon-1; stcnt - (endcnt); endcnt--)
					{
						/* dologphoneme(pDph_t->allophons[endcnt],0,0); */
						// WINprintf("nphon %d ",endcnt); printf("p=%d ",pDph_t->allophons[endcnt]);

						/*  printf("ph=%d ",pDph_t->allophons[endcnt]); */
						/* if( pDph_t->allophons[endcnt] <= 7 && pDph_t->allophons[endcnt] >0) */
						/* change from adjusting just vowels to any sonorant */
						/* 0028 MGS 09/29/1997 Comment out the bad dologphoneme */
						//dologphoneme(phTTS,pDph_t->allophons[endcnt],0,0); 
						if ((phone_feature( pDph_t,pDph_t->allophons[endcnt]) & FSONOR) IS_PLUS)
						{	
							/* WINprintf(" dur %d syldur=%d adj=%d \n"
						         ,pDph_t->allodurs[endcnt], (syldur*64)/10,adjust); 
							*/
					
#ifdef DEBUGPHT
							WINprintf ("set  %d dur %d syldur=%d adj=%d", pDph_t->allophons[endcnt], pDph_t->allodurs[endcnt], syldur , adjust);
#endif

							pDph_t->allodurs[endcnt] += adjust;
							if (pDph_t->allodurs[endcnt] <=6)
								pDph_t->allodurs[endcnt]=6;
							
#ifdef DEBUGPHT
							printf ("to  %d \n", pDph_t->allodurs[endcnt] );
#endif
							ncnt++;
					}
				}
				/* 
				* printf("set  syldur from %d to %d in %d adjusts.\n",
				* ((syldur)*64)/10,((syldur+(ncnt*adjust))*64)/10,ncnt ); 
				*/
				ncnt = 0;
				/* printf("-- \n"); */
				stcnt = nphon;
				/* reset slydur */
				syldur = 0;
				sonocnt = 0;
				}
		} // if( pDph_t->number_words >= 3)

#ifdef EABDEBUG
		printf ("final duration = %d  durxx  \n", ((pDphsettar->durxx * NSAMP_FRAME) + 5) / 10);

#endif
		//break3:
	
		if(phocur == GRP_EU || phocur == GRP_EI || phocur == GRP_AU)
		{
			if (pDphsettar->durxx <= (((min_timing(phTTS,phocur) * 11) + 50) >> 6) -8)
			{
				pDphsettar->durxx = (((min_timing(phTTS,phocur) * 11) + 50) >> 6)-8;
			}
		}
	
#ifdef NEWTYPING_MODE
		/* Note to CARL we need to check this with TOM it's a bettter algorithm
		becuase the thing that really counts is the number of sonorants not the number
		of phonemes also the ifdef Spanish was dumb as this is a US only file
		Better fic of BATS 465 */
		if(phTTS->bInTypingMode == TRUE)
		{
			minsize= 30/numbersonor;
			if (minsize < 6)
				minsize=6;
			if((feacur & FSONOR) IS_PLUS && phocur != GEN_SIL) 
			{
				pDph_t->allodurs[nphon]= minsize;
			}
			else
			{
				if(pDph_t->allophons[nphon] == S)
				{
					pDph_t->allodurs[nphon]=5;
				}
				else
				{
					pDph_t->allodurs[nphon]=3;
				}
			}
		}
#endif /* typing mode*/

#ifdef TYPING_MODE  /*-DR 09/24/1997 Added to FIX BATS465*/	
		if(phTTS->bInTypingMode == TRUE)
		{
			minsize= 30/(pDph_t->nallotot-1);
			if (minsize < 6)
				minsize=6;
			if((feacur & FSONOR) IS_PLUS && phocur != GEN_SIL) 
				pDph_t->allodurs[nphon]= minsize;
			else
			{
				if(pDph_t->allophons[nphon] == GRP_S)
					pDph_t->allodurs[nphon]=5;
				else
					pDph_t->allodurs[nphon]=1;
			}
		}
#endif

#ifdef MSDBG4
		printf ("allodurs[nphon] = durxx allodurs[%d]=%d\n", nphon, pDph_t->allodurs[nphon]);
#endif		
		pDph_t->longcumdur += (pDphsettar->durxx * NSAMP_FRAME);	/* Cum dur in waveform samples */
	} // for (nphon = 0; nphon < pDph_t->nallotot; nphon++)
}
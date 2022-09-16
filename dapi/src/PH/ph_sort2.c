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
 *    File Name:    ph_sort2.c
 *    Author:       Matthew Schnee
 *    Creation Date:19-Jun-1995
 *
 *    Functionality:
 *		Language dependent code from phsort.c for multiple languages 
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 01	??		??			    Initial creation
 * 01	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 0002 DR		09/30/1997		UK BUILD: added UK STUFF
 * 003  EAB		04/21/98		Remove bad rule from German
 */

#if defined ENGLISH || defined GERMAN
 
/*
 *      Function Name: init_med_final()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, short msym)
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void init_med_final (PDPH_T pDph_t, short msym)
{
	short m, sylltype;

	sylltype = FMONOSYL;			   /* Assume curr word is monosyllabic */

	/* Examine output string to see if any sylls at beginning of word */
	for (m = CURRPHONE - 1; m > 0; m--)
	{
		if ((pDph_t->sentstruc[m] & FBOUNDARY) >= FWBNEXT)
		{
			break;					   /* Beginning of word found */
		}
		else if ((featb[pDph_t->phonemes[m]] & FSYLL) IS_PLUS)
		{
			sylltype = FFINALSYL;	   /* Syll exists befor this one */
		}
	}
	/* Examine input string to see if any sylls in remainder of word */
	for (m = msym + 1; m < pDph_t->nsymbtot; m++)
	{
		if ((pDph_t->symbols[m] >= WBOUND)
			&& (pDph_t->symbols[m] <= EXCLAIM))
		{							   /* Look for next boundary */
			if (sylltype != FMONOSYL)
			{
				add_feature (pDph_t, sylltype, CURRPHONE);
#ifdef MSDBG8
				printf ("add_feature(sylltype,CURRPHONE) sylltype=%d\n", sylltype);
#endif
			}
			return;
		}
		else if ((featb[pDph_t->symbols[m]] & FSYLL) IS_PLUS)
		{
			if (sylltype == FFINALSYL)
			{
				sylltype = FMEDIALSYL; /* Syll exists before & after */
			}
			if (sylltype == FMONOSYL)
			{
				sylltype = FFIRSTSYL;  /* Syll exists after only */
			}
		}
	}

}

 
/*
 *      Function Name: find_syll_to_stress()      
 *
 *  	Description: Clause contains no primary stresses; raise first secondary stress 
 * 					 encountered to primary; else stress first vowel of last word 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, short *locend,
 *				   short nstartphrase
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void find_syll_to_stress (LPTTS_HANDLE_T phTTS, short *locend,
					 short nstartphrase)
{
	short                   m, locbeg = 0;	// MVP: Initialized 

	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

#ifndef  GERMAN
	/* Try to promote a secondary stress to primary, working from back */
	for (m = *locend - 1; m >= nstartphrase; m--)
	{
  /* eab 4/21/98 This code is wierd in that in German we don't want to do this
	and English never has really had secondary stress until Tony added it to the dictionary which was
	way after this code was writeen by Dennis*/
		if (pDph_t->symbols[m] == S2)
		{
			pDph_t->symbols[m] = S1;
			return;
		}
	}
#endif
	/* Else try to find a vowel to stress in last word */
	for (m = *locend - 1; m >= nstartphrase; m--)
	{
		if (pDph_t->symbols[m] >= WBOUND)
		{

			locbeg = m;
			break;
		}
	}
	for (m = locbeg; m < *locend; m++)
	{
		if ((featb[pDph_t->symbols[m]] & FSYLL) IS_PLUS)
		{

			insertphone (phTTS, m, S1);		/* Insert S1 at location m */
			(*locend)++;			   /* Move pointer in calling loop *//* MVP : was n++ and n was static */
			return;
		}
	}
	/* Else give up, clause contains no primary stresses */

}


#endif /* #if defined ENGLISH || defined GERMAN */

#if defined ENGLISH || defined SPANISH
 
/*
 *      Function Name: get_next_bound_type()      
 *
 *  	Description: Gets next clause boundary type.
 *
 *      Arguments: PDPH_T pDph_t, short msym
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
 
static void get_next_bound_type (PDPH_T pDph_t, short msym)
{
	extern short bounftab[];		/* MVP : defined in PHROM.C (a Look up table) */
	short        m;

	for (m = msym + 1; m < pDph_t->nsymbtot; m++)
	{
		if ((pDph_t->symbols[m] >= SBOUND)
			&& (pDph_t->symbols[m] <= EXCLAIM))
		{							   /* Look for next boundary */
			add_feature (pDph_t, bounftab[pDph_t->symbols[m] - SBOUND], CURRPHONE);
#ifdef MSDBG8
			printf ("add_feature(bounftab[symbols[m] - SBOUND], CURRPHONE) bounftab[%d]=%d\n", pDph_t->symbols[m] - SBOUND, bounftab[pDph_t->symbols[m] - SBOUND]);
#endif
			return;
		}
		else if ((featb[pDph_t->symbols[m]] & FSYLL) IS_PLUS)
		{
			return;					   /* Abort if see vowel first */
		}
	}

}

 
/*
 *      Function Name: move_stdangle()      
 *
 *  	Description: Move a stress symbol further into the word so as to either replace a 
 * 					 weaker stress or to appear just before
 * 					 the next syllabic segment.  If reach strong boundary first, delete stress 
 * 					 if reach another stress mark first, replace it if first stress stronger 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, short msym
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void move_stdangle (LPTTS_HANDLE_T phTTS, short msym)
{
	short   m, stdangle, durdangle, f0dangle;
	PKSD_T  pKsd_t = phTTS->pKernelShareData;
	PDPH_T  pDph_t = phTTS->pPHThreadData;

	stdangle = pDph_t->symbols[msym];
	durdangle = pDph_t->user_durs[msym];
	f0dangle = pDph_t->user_durs[msym];

	/* 1. If emphasis, replace strongest stress in current word */
	if (stdangle == SEMPH)
	{
		for (m = msym + 1; m < pDph_t->nsymbtot; m++)
		{
			if (pDph_t->symbols[m] == S1)
			{
				pDph_t->symbols[m] = SEMPH;
				pDph_t->user_durs[m] = durdangle;
				pDph_t->user_f0[m] = f0dangle;
				delete_symbol (phTTS, msym);
#ifdef DEBUGIND

				printf ("delete rule 2\n");
#endif

				return;
			}
			if (is_wboundary (pDph_t->symbols[m]))
			{
				break;	/* No longer current word, give up S1 search */
			}
		}
	    for (m = msym + 1; m < pDph_t->nsymbtot; m++)
		{
			if (pDph_t->symbols[m] == S2)
			{
				pDph_t->symbols[m] = SEMPH;
				pDph_t->user_durs[m] = durdangle;
				pDph_t->user_f0[m] = f0dangle;
				delete_symbol (phTTS, msym);
#ifdef DEBUGIND

				printf ("delete rule S2\n");
#endif

				return;
			}
			if (is_wboundary (pDph_t->symbols[m]))
			{
				break;	/* No longer current word, give up S2 search */
			}
		}
	}
	/* 2. If primary stress, replace the first secondary stress encountered */
	/* in word; if none, attach to first vowel in word via step 3 below.    */
	if (stdangle == S1)
	{
		for (m = msym + 1; m < pDph_t->nsymbtot; m++)
		{
			if (pDph_t->symbols[m] == S2)
			{
				pDph_t->symbols[m] = S1;
				pDph_t->user_durs[m] = durdangle;
				pDph_t->user_f0[m] = f0dangle;
#ifdef DEBUGIND

				printf ("delete rule 4\n");
#endif

				delete_symbol (phTTS, msym);
				return;
			}
			if (is_wboundary (pDph_t->symbols[m]))
			{
				break;	/* No longer current word, give up S2 search */
			}
		}
	}
	/* 3. Attach to first vowel encountered, use stronger of two stresses if */
	/* another stress encountered before vowel encountered */
	for (m = msym + 1; m < pDph_t->nsymbtot; m++)
	{
		if (is_wboundary (pDph_t->symbols[m]))
		{
#ifdef DEBUGIND

			printf ("delete rule 5\n");
#endif

			delete_symbol (phTTS, m - 1);
			return;
		}
		if ((pDph_t->symbols[m] >= S2) && (pDph_t->symbols[m] <= SEMPH))
		{
			if (pDph_t->symbols[m] < stdangle)
			{
				pDph_t->symbols[m] = stdangle;
				pDph_t->user_durs[m] = durdangle;
				pDph_t->user_f0[m] = f0dangle;
			}
#ifdef DEBUGIND

			printf ("delete rule 6\n");
#endif

			delete_symbol (phTTS, m - 1);
			return;
		}
		else if ((featb[pDph_t->symbols[m]] & FSYLL) IS_PLUS)
		{
			pDph_t->symbols[m - 1] = stdangle;	/* Found syllabic, put stress here */
			pDph_t->user_durs[m - 1] = durdangle;
			pDph_t->user_f0[m - 1] = f0dangle;
			return;
		}
		else
		{
			pDph_t->symbols[m - 1] = pDph_t->symbols[m];	/* Move symbol backward one */
			pDph_t->user_durs[m - 1] = pDph_t->user_durs[m];
			pDph_t->user_f0[m - 1] = pDph_t->user_f0[m];
		}
	}
}

#endif /* #if defined ENGLISH || defined SPANISH */

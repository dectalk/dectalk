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
 *    File Name:    p_gr_sr1.c
 *    Author:       Matthew Schnee
 *    Creation Date:18-Jun-1995
 *
 *    Functionality:
 *		German code from phsort.c
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001	GL		04/21/1997		BATS#357 Add/remove code for __osf__ build 
 * 002  EAB		04/29/98 		Remove old non-functioning German code I'll
 *								also add a Bat report to really remove this
 *								and the non-function phsyl.c code. 
 */

#define NOCLUSTER   	0
#define CLUSTER      	1
#define CLUSTER_TRYS   	2 

/*
 *      Function Name: get_stress_of_conson()      
 *
 *  	Description: Scan forward to see if this consonant is followed by a stress symbol 
 * 					 before encounter vowel or boundary.  
 *					 If so, check to see if legal cluster.
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short msym,
 *				   short compound_destress
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */                      
static void get_stress_of_conson (PDPH_T pDph_t, short msym, short compound_destress)
{
	short                   m, mcl, cl, sy, stresslevel;
	/* GL 04/21/1997  add this as the latest OSF code */
	/* extern short            phcluster ();*/

	stresslevel = FNOSTRESS;
	for (m = msym + 1; m < pDph_t->nsymbtot; m++)
	{
		return;

		sy = pDph_t->symbols[m];
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* add tertiary stress for german DECtalk             					  */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* Search forward from present consonant for nonconsonant */
		if ((sy == S1) || (sy == S2) || (sy == S3) || (sy == SEMPH))
		{
			/* Number of consonants in potential legal cluster */
			mcl = m - msym;
			/* 1st of more than 3 consonants in a row is not member of cluster */
			if (mcl > 3)
				return;
			/* One consonant is always stressable */
			if (mcl != 1)
			{
				/* See if pair of consonants next to vowel is legal cluster */
				/* 
				 * phcluster is not used in german dectalk 
				 * cl = phcluster (pDph_t->symbols[m - 2], pDph_t->symbols[m - 1]);
				 * if (cl == NOCLUSTER)
				 *	return;
				 */
				/* See if triple of consonants next to vowel is legal cluster */
				if ((mcl == 3)
					&& ((cl != CLUSTER_TRYS)))
					return;
			}
			if (sy == S1)
			{
				if (compound_destress == TRUE)
				{
					/* printf ("at sy stuff");*/
					add_feature (pDph_t,FSTRESS_2, CURRPHONE);
				}
				else
				{
					add_feature (pDph_t,FSTRESS_1, CURRPHONE);
				}
			}
			if (sy == S2)
			{
				if (compound_destress == FALSE)
				{
					add_feature (pDph_t,FSTRESS_2, CURRPHONE);
				}
			}
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* add tertiary stress for german DECtalk              					  */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			if (sy == S3)
			{
				if (compound_destress == FALSE)
				{
					add_feature (pDph_t,FSTRESS_3, CURRPHONE);
				}
			}
			if (sy == SEMPH)
			{
				add_feature (pDph_t,FEMPHASIS, CURRPHONE);
			}
			return;
		}
		if ((featb[sy] & FSYLL) IS_PLUS)
		{
			return;					   /* No stress before vowel */
		}

		if ((sy >= SBOUND) && (sy <= EXCLAIM))
		{
			return;					   /* No vowel before syllable ends */
		}
	}

}
 
/*
 *      Function Name: get_next_bound_type()      
 *
 *  	Description: Gets the next clause boundary type
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short msym
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void get_next_bound_type (PDPH_T pDph_t, short msym)
{
	extern short            bounftab[];
	short                   m;
	short                   btyp;

	for (m = msym + 1; m < pDph_t->nsymbtot; m++)
	{
		if ((pDph_t->symbols[m] >= SBOUND)
			&& (pDph_t->symbols[m] <= EXCLAIM))
		{	
			/* Look for next boundary */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* determine standard boundary type                */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			btyp = bounftab[pDph_t->symbols[m] - SBOUND];
			if (pDph_t->symbols[m] == WBOUND)
			{						   /* hat_seen may carry over other */

				if (pDph_t->hat_seen != 0)
				{
					btyp = FNPNEXT;
					pDph_t->hat_seen = 0;
				}
#ifdef THISCODE /* eab 4/20/98 is broken and doesn't work*/
				else if (pDph_t->pars[pDph_t->wordcount].phopoint = m)
				{
					if (pDph_t->pars[pDph_t->wordcount].bouflag == TRUE)
					{
						btyp = FNPNEXT;
					}
				}
#endif
			}
			if (pDph_t->symbols[m] >= HYPHEN)
			{
				if (--m == msym)
				{
					/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
					/* operations for sentence intonation at end of word     */
					/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
					pDph_t->hat_seen = 0;	   /* reset only after word */
					pDph_t->wordcount++;	   /* not original GER %%% */
					/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
					/* mark last phoneme of word for german dectalk          */
					/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
					btyp |= FWBEND;
				}
			}
			add_feature (pDph_t,btyp, CURRPHONE);

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
 * 					 the next syllabic segment.  If reach strong boundary first, 
 *					 delete stress. If reach another stress mark first, 
 *					 replace it if first stress stronger
 *
 *      Arguments:  LPTTS_HANDLE_T phTTS, 
 *					short msym
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void move_stdangle (LPTTS_HANDLE_T phTTS, short msym)
{
	short                   m, stdangle, durdangle, f0dangle, symtmp, mtmp;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;

	stdangle = pDph_t->symbols[msym];
	durdangle = pDph_t->user_durs[msym];
	f0dangle = pDph_t->user_durs[msym];

	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* if symbol is a hat marker, put it in front of emphatic stress 		  */
	/* if possible.                          								  */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	if ((stdangle >= HAT_RISE) && (stdangle <= HAT_RF))
	{
		mtmp = msym;
		mtmp++;
		for (m = mtmp; m < pDph_t->nsymbtot; m++)
		{
			if ((symtmp = pDph_t->symbols[m]) == SEMPH)
			{
				while (mtmp < m)
				{	
					/* rotate %%% */
					pDph_t->symbols[mtmp - 1] = pDph_t->symbols[mtmp];
					pDph_t->user_durs[mtmp - 1] = pDph_t->user_durs[mtmp];
					pDph_t->user_f0[mtmp - 1] = pDph_t->user_f0[mtmp];
					mtmp++;
				}
				/* while */
				pDph_t->symbols[--mtmp] = stdangle;
				pDph_t->user_durs[mtmp] = durdangle;
				pDph_t->user_f0[mtmp] = f0dangle;
				return;
			}
			if (is_wboundary (pDph_t->symbols[m]))
			{
				break;				   /* passed current word, give up search */
			}
		}
		/* for */
	}
	/* if hat */

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
				break;			   /* No longer current word, give up S1 search */
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
				break;				   /* No longer current word, give up S2 search */
			}
		}
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* same treatment for tertiary stress in german version       			  */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		for (m = msym + 1; m < pDph_t->nsymbtot; m++)
		{
			if (pDph_t->symbols[m] == S3)
			{
				pDph_t->symbols[m] = SEMPH;
				pDph_t->user_durs[m] = durdangle;
				pDph_t->user_f0[m] = f0dangle;
				delete_symbol (phTTS, msym);
				return;
			}
			if (is_wboundary (pDph_t->symbols[m]))
			{
				break;				   /* No longer current word, give up S3 search */
			}
		}
		
	}
	/* 2. If primary stress, replace the first secondary stress encountered */
	/* in word; if none, attach to first vowel in word via step 3 below. */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* also replace following tertiary stress                				  */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	if (stdangle == S1)
	{
		for (m = msym + 1; m < pDph_t->nsymbtot; m++)
		{
			if ((pDph_t->symbols[m] == S2) || (pDph_t->symbols[m] == S3))
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
				break;				   /* No longer current word, give up S2 search */
			}
		}
	}
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* same thing for secondary stress                   					  */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	if (stdangle == S2)
	{
		for (m = msym + 1; m < pDph_t->nsymbtot; m++)
		{
			if ((pDph_t->symbols[m] == S3))
			{
				pDph_t->symbols[m] = S2;
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
				break;				   /* No longer current word, give up S2 search */
			}
		}
	}
	/* 3. Attach to first vowel encountered, use stronger of two stresses if */
	/* another stress encountered before vowel encountered */
	for (m = msym + 1; m < pDph_t->nsymbtot; m++)
	{
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* take movement into account                 							  */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if (is_wboundary (pDph_t->symbols[m]))
		{
#ifdef DEBUGIND

			printf ("delete rule 5\n");
#endif

			delete_symbol (phTTS, m - 1);
			return;
		}
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* expand also to tertiary stress                 						  */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if ((pDph_t->symbols[m] >= S3) && (pDph_t->symbols[m] <= SEMPH))
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
		else if (((featb[pDph_t->symbols[m]] & FSYLL) IS_PLUS) &&
				 (pDph_t->symbols[m] != EX))
		{
			pDph_t->symbols[m - 1] = stdangle;	/* Found syllabic, put stress here */
			pDph_t->user_durs[m - 1] = durdangle;
			pDph_t->user_f0[m - 1] = f0dangle;
			return;
		}
		pDph_t->symbols[m - 1] = pDph_t->symbols[m];	/* Move symbol backward one */
		pDph_t->user_durs[m - 1] = pDph_t->user_durs[m];
		pDph_t->user_f0[m - 1] = pDph_t->user_f0[m];
	}
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


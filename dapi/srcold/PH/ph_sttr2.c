/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:    ph_sttr2.c
 *    Author:		Matthew Schnee
 *    Creation Date:18-Jun-1996
 *
 *    Functionality:
 *    functions from phsettar.c common to two languages
 *
 ***********************************************************************
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	--------------------------------------------
 *  001 MGS     06/18/1996  file created
 *	002	EDB		01/10/1997	let transition reduction apply to all language.		
 *  003 EAB		10/13/1997	edited for UK
 *  004 EAB		12/12/1997	add more code for UK
 *  005 EAB		03/31/1998	Code had more locus types than need just causing confusion
							effectively removed the low vowel type using back in stead. 
 *  006 EAB		06/28/2000	Unified Phoneme Set Changes
 *  007	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 *  008 CAB		10/16/2000	Changed copyright info
 *	009	MGS		01/18/2001	Removed arg1 arg2 and arg3 from calculations
 * 	009	CAB		01/15/2001	Merged Michel Divay changes to French
 *	010	CAB		01/22/2001	Fixed compile error by removing extra }
 *	011	MGS		03/27/2001	Fixed spaces before #ifdef.....
 *	071	MGS		04/17/2002	ARM7 port
 */


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* F.                      S E T L O C                              */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */ 
/*
 *      Function Name:       
 *
 *  	Description: Set formant freq bouval and pDphsettar->durtran 
 *					 between obstruent and sonorant
 *
 *      Arguments:   short nfonobst, Segment thought to be an obstruent      
 *					 short nfonsonor, Segment thought to be a sonorant 
 *					 char initfinso, Set to 'i' if use init part of sonor 
 *					 short nfonvowel, Segment (vowel?) on other side of obst 
 *					 short feanex
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
//#define DEBUG_TARGETS
static short setloc (LPTTS_HANDLE_T phTTS,
					 short nfonobst,	/* Segment thought to be an obstruent */
					 short nfonsonor,	/* Segment thought to be a sonorant  */
					 char initfinso,	/* Set to 'i' if use init part of sonor */
					 short nfonvowel,	/* Segment (vowel?) on other side of obst */
					 short feanex)

{
	/* Automatic variables */
	short                   fonobst, fonsonor, fonvowel, typob, typso, f2backaffil, curval, tarvowel;
	short                   sontyx, ploc=0, locus, prcnt, delta_freq,tmp;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	/* Convert phoneme pointers into phoneme names */
	fonobst = get_phone (pDph_t, nfonobst);
	fonsonor = get_phone (pDph_t, nfonsonor);
	fonvowel = get_phone (pDph_t, nfonvowel);


	/* Use values at beginning of the sonorant */
	if (initfinso == 'i') 
	{
		typob = endtyp(fonobst);
		typso = begtyp(fonsonor);
	} 
	else 
	{	/* Or at the end of the sonorant */
		typob = begtyp(fonobst);
		typso = endtyp(fonsonor);
	}
#ifdef needs_completion //HELP
	if ( fonobst == GRP_L
		|| fonobst == USP_LL 
		|| fonobst == USP_LX)
	{
		typob = OBSTRUENT;
		if(typso == OBSTRUENT)
			typso = BACK_UNROUNDED_VOWEL;
	}
	else
#endif
	{	
	if ((pDphsettar->np > &PF3) || (typob != OBSTRUENT) || (typso == OBSTRUENT)) 
	{
		return (0);					   /* Not obstruent-sonorant tran, as assumed */
	}
	}
	if (initfinso == 'i') 
	{
		// wrong! need to make language specific
		f2backaffil = place(fonsonor )& F2BACKI;
		curval = getbegtar (phTTS, nfonsonor);
	} 
	else 
	{	/* Or at the end of the sonorant */
		f2backaffil = place(fonsonor) & F2BACKF;
		curval = getendtar(phTTS, nfonsonor);
	}
	sontyx = typso;


	if (typso == ROUNDED_SONOR_CONS)   /* If sonorant is rounded conson, */
		sontyx = BACK_ROUNDED_VOWEL;   /* use C locus for rounded vowel  */

	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* 'low' class is fourth entry in plocu                                   */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

	//eab We can get rid of this if we eliminates low_vowels from german phrom
	if (typso == 6) //LOW_VOWEL)
	{								/* If sonorant is low vowel */
		sontyx = 2;					/* use back instead */
	}


	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
	/* Pointer into locus data comes from one of 4 tables for        */
	/* front-unrounded, back, front-rounded, low vowels.             */
	/* sontyx now equals 1, 2, 3, or 4                               */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

	/* Pointer into locus data comes from one of 3 tables for front, back, */
	/* and rounded vowels, sontyx now equals 1, 2, or 3 */
	
	tmp = fonobst & PFONT;
	//fonobst = fonobst & PVALUE;
	if(tmp == PFUSA<<PSFONT)
	{
		ploc = plocu( (fonobst + (US_TOT_ALLOPHONES * (sontyx - 1) ) ) );
		if(pDph_t->malfem == MALE)
		{
			pDph_t->p_locus = (short *)us_maleloc;
		}
		else
		{
			pDph_t->p_locus = (short *)us_femloc;	   	
		}
	}
	else if(tmp == PFUK<<PSFONT)
	{
		ploc = plocu( (fonobst + (UK_TOT_ALLOPHONES * (sontyx - 1) ) ) );
		if(pDph_t->malfem == MALE)
		{
			pDph_t->p_locus = (short *)uk_maleloc;
		}
		else
		{
			pDph_t->p_locus = (short *)uk_femloc;	   	
		}
	}
	else if(tmp == PFGR<<PSFONT)
	{
		ploc = plocu( (fonobst + (GR_TOT_ALLOPHONES * (sontyx - 1) ) ) );
			if(pDph_t->malfem == MALE)
		{
			pDph_t->p_locus = (short *)gr_maleloc;
		}
		else
		{
			pDph_t->p_locus = (short *)gr_femloc;	   	
		}
	}
	else if(tmp == PFLA<<PSFONT)
	{
		ploc = plocu( (fonobst + (LA_TOT_ALLOPHONES  * (sontyx - 1) ) ) );
			if(pDph_t->malfem == MALE)
		{
			pDph_t->p_locus = (short *)la_maleloc;
		}
		else
		{
			pDph_t->p_locus = (short *)la_femloc;	   	
		}
	}
	else if(tmp == PFSP<<PSFONT)
	{
		ploc = plocu( (fonobst + (SP_TOT_ALLOPHONES * (sontyx - 1) ) ) );
			if(pDph_t->malfem == MALE)
		{
			pDph_t->p_locus = (short *)sp_maleloc;
		}
		else
		{
			pDph_t->p_locus = (short *)sp_femloc;	   	
		}
	}
	else if(tmp == PFFR<<PSFONT)
	{
		ploc = plocu( (fonobst + (40 * (sontyx - 1) ) ) );
		//printf ("setloc  fonobst : %x, sontyx %d, ploc %d\n", 
    	  //       fonobst, sontyx, ploc);
/*		if(pDph_t->malfem == MALE)
		{
			pDph_t->p_locus = (short *)fr_maleloc;
		}
		else
		{
			pDph_t->p_locus = (short *)fr_femloc;	   	
		} 
*/
	}
		
	if (ploc == 0)					   /* Pointer to locus, zero means */
		return (0);					   /* no locus, use default calc  */
	ploc = ploc + (3 * (pDphsettar->np - &PF1));	/* Table has 3 entries/formant  */

	locus = pDph_t->p_locus[ploc];	   /* First entry is locus freq   */
	prcnt = pDph_t->p_locus[ploc + 1]; /* Second entry is % toward V  */

	pDphsettar->durtran = mstofr(pDph_t->p_locus[ploc + 2]);	/* 3rd is tran dur in msec  */


#ifdef DEBGFRENCH
    if (dbgphs) {
      printf ("phsettar.c setloc ploc %d, locus %d, prcnt %d, pDphsettar->durtran %d\n",
               ploc, locus, prcnt, pDphsettar->durtran);
    }
#endif

//	printf ("phsettar.c setloc ploc %d, locus %d, prcnt %d, pDphsettar->durtran %d\n",
  //             ploc, locus, prcnt, pDphsettar->durtran);
/* #ifdef ENGLISH 1/3/97 eab I think this should apply generally*/
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* take transition reduction out for german DECtalk      */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* Reduce F2 and F3 transition in a sonor conson adj to nonpalatal obst */
	// worng! make language specific or gnerneal 
	if ((typso == ROUNDED_SONOR_CONS) && (pDphsettar->np > &PF1)
		&& ((place(fonobst) & (FPALATL | FDENTAL)) IS_MINUS))
	{
		prcnt = (prcnt >> 1) + 50;
	} 
	
	/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
/*#endif*/
	/* Ditto for vowel/sonor with F2 assoc with back cavity, e.g. [iy] */
	if ((f2backaffil IS_PLUS) && (pDphsettar->np == &PF2))
	{
		prcnt += (25 - (prcnt >> 2));  /* Reduce trans extent by 1/4 */
		pDphsettar->durtran = (pDphsettar->durtran >> 1) + 2;	/* And shorten tran dur */
	}
	/* Let bouval = locus + ((prcnt * (curval-locus)) / 100); */
	/* Old approximation (no divides):                       */
	/* delta_freq = (prcnt * (curval-locus)) >> 7;            */
	/* bouval = locus + delta_freq + (delta_freq >> 2);    */
	/* End of old approximation                              */
	tmp = prcnt;
#ifdef ENGLISH_UK
	
	/*eab 11/19/97  first cut just for ch but probably should be for all plos*/
	if (initfinso != 'i' && fonobst == 54)
	{
		tmp = prcnt+40;
		if(tmp >100 )
			tmp=100;
	}
#endif

	//pDph_t->arg2 = curval - locus;
	//pDph_t->arg3 = 100;
	delta_freq = muldv (tmp, (curval - locus), 100);
  	pDphsettar->bouval = locus + delta_freq;

#ifdef DEBUG_TARGETS
    printf ("locus %d delta_freq %d \n", locus, delta_freq);
    printf ("pDphsettar->bouval %d \n", pDphsettar->bouval);
#endif

/* V-V coarticulation across an obst consonant: */
	if (((phone_feature( pDph_t,fonsonor) & FVOWEL) IS_PLUS)
		&& ((phone_feature( pDph_t,fonvowel) & FVOWEL) IS_PLUS)
		&& (pDphsettar->np == &PF2))
{
		/* Find target values for both vowels */
		if (initfinso == 'i')
		{
			tarvowel = getendtar (phTTS, nfonvowel);
		}
		else
		{
			tarvowel = getbegtar (phTTS, nfonvowel);
		}
		/* Set vvbouval, the offset to boundary value due to the remote vowel */
		vv_coartic_across_c (pDph_t, fonvowel, tarvowel, fonsonor, curval,
							 fonobst, pDph_t->allodurs[nfonobst]);
		/* Now recompute boundary value taking into account this offset */
		curval += pDphsettar->vvbouval;
		//pDph_t->arg1 = prcnt;
		//pDph_t->arg2 = curval - locus;
		//pDph_t->arg3 = 100;
		delta_freq = muldv (prcnt, (curval - locus), 100);
		pDphsettar->bouval = locus + delta_freq;
		pDphsettar->bouval -= pDphsettar->vvbouval;		/* pDphsettar->vvbouval will be added in phdraw */
	}

#ifdef DEBUG_TARGETS
	printf ("\t\t\t      (vtar = %4d  locus[%d] = %4d Hz  prcnt = %3d)\n",
			curval, ploc, locus, pDph_t->p_locus[ploc + 1]);
#endif
	
	return (1);						   /* Indicate success */
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* G.      V V - C O A R T I C - A C R O S S - C                    */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: vv_coartic_across_c()      
 *
 *  	Description: 
 *
 *      Arguments:  PDPH_T pDph_t, 
 *					short remoteV, 
 *					short remotetar,
 *					short currentV,
 *					short currenttar,
 *					short middleC,
 *					short dur_cons
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

static void vv_coartic_across_c (PDPH_T pDph_t, short remoteV, short remotetar,
					 			 short currentV, short currenttar, short middleC,
					 			 short dur_cons)
{
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	if (dur_cons > NF100MS)
	{
		pDphsettar->vvbouval = 0;
		pDphsettar->vvdurtran = 0;
	}
	else
	{
		//pDph_t->arg1 = (remotetar - currenttar) * (NF100MS - dur_cons);
		//pDph_t->arg2 = 460;			   /* 45% of pDph_t->arg1, also divided by 16 frames */
		pDphsettar->vvbouval = 0;//mlsh1 (((remotetar - currenttar) * (NF100MS - dur_cons)), 460);
		pDphsettar->vvdurtran = 0;//NF80MS - (dur_cons >> 2);
	}

#ifdef DEBUG_TARGETS
	printf ("\t -> BV=%d TC=%d\n", pDphsettar->vvbouval, pDphsettar->vvdurtran);
#endif
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* S H R D U R                              */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

 
/*
 *      Function Name: shrdur()      
 *
 *  	Description: SHRINK OR EXPAND DURIN NONLINEARLY IN A DIPHTHONG TO PRESERVE 
 * 					 TENDENCY TOWARD CONSTANT DURATION OF TRANSITION PORTION 
 * 					 WITH CHANGES IN VOWEL DURATION
 *
 *      Arguments: 	PDPH_T pDph_t, 
 *				   	short durin, 
 *				   	short inhdr_frames,
 *				   	short shrink
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

static int shrdur (PDPH_T pDph_t, short durin, short inhdr_frames,
				   short shrink)
{
	short halfinhdr, halfmaxdur, foldswitch, localinhdr;
//	PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;

	/* Convert from ms to number of frames * 64 */
	durin = (durin * 10) + 5;
	localinhdr = inhdr_frames * NSAMP_FRAME;
	halfinhdr = inhdr_frames * NSAMP_FRAME >> 1;
	//pDph_t->arg1 = halfinhdr;
	//pDph_t->arg2 = shrink;
	halfmaxdur = mlsh1 (halfinhdr, shrink);

	/* Fold durin over about halfinhdr */
	foldswitch = 0;
	if (durin > halfinhdr)
	{
		durin = localinhdr - durin;
		foldswitch = 1;
	}
	/* Turn time around (measure from middle of inhdur */
	durin = halfinhdr - durin;

	/* Shrink this time by less than full requested shrinkage */
	//pDph_t->arg2 = ((unsigned) shrink + FRAC_ONE) >> 1;
	//pDph_t->arg1 = durin;
	durin = mlsh1 ((((unsigned) shrink + FRAC_ONE) >> 1), durin);

	/* See that this time does not exceed halfmaxdur */
	if (durin > halfmaxdur)
		durin = halfmaxdur;

	/* Convert back to true time */
	durin = halfmaxdur - durin;
	if (foldswitch == 1)
		durin = halfmaxdur + halfmaxdur - durin;

	/* Minimum value is one */
	if (durin < NSAMP_FRAME)
		durin = NSAMP_FRAME;

	return (durin >> 6);
}

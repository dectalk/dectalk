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
 *    File Name:    p_sp_st1.c
 *    Author:		Matthew Schnee
 *    Creation Date:04-Jun-1996
 *
 *    Functionality:
 *    Spanish specific functions from sphsetar.c
 *
 ***********************************************************************
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	--------------------------------------------
 *	001	MGS		06/04/1996	file created
 *  002	GL		10/30/1996  Merge the changes from V43 code base.
 *	003 EDB		12/10/1996  code change to fix bug.
 *  004 EDB		01/10/1997	reduce tartemp for E_R and E_RR
 *							from 24 to 14.
 *  005 EDB		10/19/1997	use phTTS handler to replace pDph_t
 *  007 EAB		5/13/98		Added slowtalk code BATS660
 *	008 EAB		5/20/98     BATS681  Remove unneeded code--debugforward && debugbackwards
 *	009 GL		5/27/98     BATS685  Remove unwanted debug code. fix the compiling problem
 */


/*
 *      Function Name: gettar()      
 *
 *  	Description: Get target value (or a pointer to first value of diphthong specification
 *                   (do not compute any coarticulatory influences of adjacent phones) 
 *      Arguments: PDPH_T pDph_t, 
 *				   short nphone_temp
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */
static short gettar (LPTTS_HANDLE_T phTTS, short nphone_temp)
{
	short                   phone_temp, phlas_temp, phnex_temp, tartemp, pphotr, begtypnex, npar;
	short                   phone_feat, phnex_feat;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	npar = pDphsettar->np - &PF1;
	if (pDphsettar->np < &PFZ)
		pphotr = (npar) * TOT_ALLOPHONES;
	else
	pphotr = (npar - 1) * TOT_ALLOPHONES;
	/* No table entries for PAP parameter */
	phlas_temp = get_phone(pDph_t,nphone_temp - 1);
	phone_temp = get_phone(pDph_t,nphone_temp);
	phnex_temp = get_phone(pDph_t,nphone_temp + 1);
	/* 
	 * Spanish nasal assimilation                            8-May-86
	 * [m] and [n] assimilate to a following obstruent.
	 * NOTE: we do not (currently) implement the
	 * rule that partially assimilates "nm" as in "inmovil".
	 */
	if ((pDphsettar->np == &PF2 || pDphsettar->np == &PF3)
		&& ((featb[phnex_temp] & FOBST) IS_PLUS)
		&& (phone_temp == E_M
			|| phone_temp == E_N))
	{
		phone_temp = phnex_temp;
	}
	phone_feat = featb[phone_temp];

	/* FORMANT FREQUENCIES AND BANDWIDTHS */
	if ((pDphsettar->par_type = partyp[npar]) IS_FORM_FREQ_OR_BW)
	{
		if ((tartemp = pDph_t->p_tar[phone_temp + pphotr]) <-1)
		{
			return (tartemp);		   /* Pointer to diph info in p_diph[] */
		}
		else if (tartemp == -1)
		{
			/* Tar undefined, use tarval of next segment */
			if ((tartemp = pDph_t->p_tar[phnex_temp + pphotr]) == -1)
			{
				/* Tar still undefined, use tarval of second-next segment */

				if ((tartemp = pDph_t->p_tar[get_phone(pDph_t, nphone_temp + 2) + pphotr]) == -1)
				{
					/* Tar still undefined, use previous phone */
					if ((tartemp = pDph_t->p_tar[phlas_temp + pphotr]) < -1)
					{
						/* Diphthonized seg, use last target value */
						tartemp = -tartemp;
						while (pDph_t->p_diph[tartemp] != -1)
						{
							tartemp++;
						}
						tartemp = pDph_t->p_diph[tartemp - 1];
					}

					/* If this doesn't work, use default value */

					if (tartemp == -1)
					{
						tartemp = parini[npar];
					}
				}
			}
		}

		/* Special rule for B3 of /n/ adjacent to /i/ */
		if ((npar == (B3 - F1))
			&& (phone_temp == E_N
				|| phone_temp == E_NH
				|| phone_temp == E_NX)
			&& (((place[phnex_temp] & F2BACKI) IS_PLUS)
				|| ((place[phlas_temp] & F2BACKI) IS_PLUS)
			)
			)
		{
			tartemp = 300; /* 12/10/1996 EDB, was 1600 */
		}
		/* 
	 	 * Special rule for /i/ following /f/
	 	 */
		if ((npar == (B3 - F1))
			&& ((place[phone_temp] & F2BACKI) IS_PLUS)
			&& (phlas_temp == E_F))
		{
			tartemp = 90;
		}
		/* 
	 	 * Special rule for /r/ and /rr/ after "back" vowel.        8-Jul-86
	 	 */
		if ((phone_temp == E_R || phone_temp == E_RR)
			&& (phlas_temp == E_O || phlas_temp == E_U))
		{
			switch (npar)
			{
				case (F1 - F1):
					tartemp -= 100;
					break;

			}
		}
		if (tartemp < -1)
		{
			tartemp = pDph_t->p_diph[-tartemp];
		}
	}

	/* SOURCE AMPLITUDE TARGETS (AV & AP) */
	else if (pDphsettar->par_type IS_AV_OR_AH)
	{

		/* Rules for voicing amplitude */
		if (npar == AV - 1)
		{
			tartemp = pDph_t->p_tar[phone_temp + pphotr];

#ifdef SLOWTALK
			/* BATS 660 EAB 5/11/98*/
			if(pKsd_t->sprate <100)
				if (phone_temp == E_Q)
					tartemp -=20;
#endif

			/* No voicing for stop-release dummy vowels      30-Jul-86       */
			if ((pDph_t->allofeats[nphone_temp] & FDUMMY_VOWEL) IS_PLUS)
			{
				tartemp = 0;
			}
				/* Reduce amplitudes if unstressed */
			if ((pDph_t->allofeats[nphone_temp] & FSTRESS) IS_MINUS)
			{
				/*12/10/96 EDB, -1 db isn't enough destress*/
				tartemp -= 3;
				if (tartemp < 0)
					tartemp = 0;
			}
		}

		/* Rules for aspiration amplitude */

		else
		{
			tartemp = 0;
			if(phone_temp == E_R || phone_temp == E_RR)
				tartemp=33;

		}

	
	}

	/* PARALLEL FORMANT AMPLITUDES */

	else if (pDphsettar->par_type IS_PARALLEL_FORM_AMP)
	{
		/* Source spectral tilt: highly tilted for obstruents */

		/* (Voiced obstruents are special case, set F1=0 to signal voicebar) */
		if (pDphsettar->np == &PTILT)
		{
			tartemp = 0;
			if (phone_temp == SIL)
			{
				tartemp = 30 - 17;	   /* eab */
			}
			else if ((phone_feat & FOBST) IS_PLUS)
			{
				tartemp = 12;

			}
			else if (phone_temp == E_L && (phnex_temp == E_U || phlas_temp == E_U))
			{
				tartemp = 10 - 5 - 5;
			}
    		else if ((phone_feat & (FVOICD | FPLOSV)) == (FVOICD | FPLOSV)
					 && phone_temp != E_DH || (phone_temp == E_YH))
			{
				tartemp = 24;
			}
			else if (phone_temp == E_I)
			{
				tartemp = 14 - 5;
			}
			/* 
			 * Added 7-Jul-86 (MM) to increase tilt for [r] and [rr].
			 */
			else if (phone_temp == E_R || phone_temp == E_RR)
			{
				tartemp = 14;
			}
			/* 
			 * Added 12-Apr-86 (MM) to set tilt for pseudo-voicebars
			 * Modified 17-Apr-86 (MM) to take value from table.
			 */
			else if ((phone_temp >= E_BH)
					 && (phone_temp <= E_GH))
			{
				tartemp = bdgtilt[phone_temp - E_BH];
			}
			/* eab removed wrong bracket from here */
			else if ((phone_feat & FNASAL) IS_PLUS)
			{
				tartemp = 14;	/* +5 eab Tilt down nasal murmurs */
			}
		}

		/* If ptram > 0, it is a pointer in obstruent array taram */

		else if ((tartemp = ptram[phone_temp]) > 0)
		{

			begtypnex = begtyp[phnex_temp] - 1;

			if (phnex_temp == SIL)
				begtypnex = endtyp[phlas_temp] - 1;
			if (begtypnex == OBSTRUENT)
				begtypnex = BACK_UNROUNDED_VOWEL;
			tartemp += (npar - A2 + 1 + (6 * begtypnex));
			tartemp = pDph_t->p_amp[tartemp];

		}

		/* Reduce amplitudes if dummy vowel next   30-Jul-86 */
		/* Actual value is just a guess */

		if ((pDph_t->allofeats[nphone_temp + 1] & FDUMMY_VOWEL) IS_PLUS)
		{
			tartemp -= 6;
			if (tartemp < 0)
				tartemp = 0;

		}
	}

	/* NASAL ZERO */

	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ)
	{
		tartemp = 290;	/* Default for non-nasalized, cancel FP=280 */
		if ((phone_feat & FNASAL) IS_PLUS)
		{
			tartemp = 400;  /* Value dur nasal murmur (527=max) */

		}
	}
	return (tartemp);
}


/*
 *      Function Name: special_coartic()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short nfon, 
 *				   short diphpos
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
static short special_coartic (PDPH_T pDph_t, short nfon, short diphpos)
{

/* Note: Gen coartic of 5% with adjacent segs elsewhere, so stuff here is big */
/* This routine is only called if the current segment is diph (i.e. a vowel) */
/* 
 * Completely redone for Spanish                                16-Apr-86
 */
	short                   temp, fonnex, foncur, fonlas;

	temp = 0;
	foncur = get_phone(pDph_t,nfon);
	fonnex = get_phone(pDph_t,nfon + 1);
	fonlas = get_phone(pDph_t,nfon - 1);

	/* 
	 * This assumes that changes are mostly symmetric.
	 */
	temp += span_spec_coart (pDph_t,foncur, fonlas);
	temp += span_spec_coart (pDph_t,foncur, fonnex);

	return (temp);
}

/*
 *      Function Name: span_spec_coart()      
 *
 *  	Description: Compute vowel coarticulation.  The "rule" was derived by examining
 * 					 a table of nonsense syllables.  It might be a bit overdone.
 *					 Note that it applies after general coarticulation.  The proper
 *					 way to determine the proper values is to disable this routine,
 *					 then generate CVCV nonsense syllables (using -d1024 to print
 *					 only the mid-vowel values), comparing them with natural CVCV
 *					 syllables.
 *					 Note: this function is called only for vowels.
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short vowel,   Current phoneme              
 *				   short other   Other (next/last) phoneme  
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */
static int span_spec_coart (PDPH_T pDph_t,
							short vowel,   /* Current phoneme              */
							short other)   /* Other (next/last) phoneme    */
/* unused param MGS */							/*short initial)*/ /* TRUE if other-vowel          */

{
	int            			loc;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	if (other == E_IX)
		other = E_NH;
	loc = place[other];
	if (pDphsettar->np == &PF1)
	{
#if 1
		/* OUT because "me" sounds like "mi"                    30-Jul-86       */
		if (vowel == E_E
			&& other == E_M)
			return (-50);
#endif
	}
	else if (pDphsettar->np == &PF2)
	{
		switch (vowel)
		{
		case E_A:
			if (loc == FLABIAL)
			{
#if 0
				/* OUT 30-Jul-86  */
				if (other != E_M)	   /* Not [m], 23-Apr-86 */
					return (-50);
#endif
			}
			else
			{
				switch (other)
				{
				case E_CH:
				case E_YH:
				case E_Y:
				case E_NH:
					return (100);
				case E_J:
					return (-50);
				}
			}
			break;

		case E_E:
			switch (other)
			{
			case E_M:
				return (150);
			case E_N:
				return (125);
			case E_NH:
				return (75);
			}
			break;

#if 0
			WORKS ? case E_I :		   /* 9-May-86    */
				if (other == E_F)
				return (75);		   /* Guess        */
			break;
#endif

		case E_O:
#if 01
/* OUT to prevent overload                              30-Apr-86       */
/* Back in again                                        30-Jul-86       */
			if (loc == FLABIAL
				&& other != E_F)
				return (-50);
#endif
			if (other == E_Y
				|| other == E_YH)
				return (100);
			break;

		case E_U:
#if 01
/* OUT to prevent overload                              30-Apr-86       */
/* Back in again                                        30-Jul-86       */
			if (other == E_M
				|| other == E_F)
				return (-50);
#endif
			if (loc == FDENTAL
				|| other == E_S
				|| loc == FPALATL)
				return (75);
			break;
		}
	}
	else if (pDphsettar->np == &PF3)
	{
		switch (vowel)
		{
		case E_A:
			if (loc == FLABIAL
				&& other != E_M)
				return (-100);
			else if (loc == FDENTAL)
				return (75);
			else if (loc == FVELAR)
				return (-75);
			else
			{
				switch (other)
				{
				case E_N:
					return (200);
				case E_S:
					return (100);
				case E_LL:
				case E_Y:
					return (-200);
				case E_NH:
					return (50);
				}
			}
			break;

		case E_E:
			switch (other)
			{
			case E_M:
				return (300);
			case E_N:
				return (150);
			case E_LL:
				return (-50);
			case E_NH:
				return (75);
			case E_K:
			case E_G:
			case E_GH:
				return (150);
			}
			break;

		case E_I:
			switch (other)
			{
			case E_M:
			case E_NH:
			case E_N:
				return (150);
			}
			break;

		case E_O:
			switch (other)
			{
			case E_M:
				return (75);
			case E_N:
				return (175);
			case E_NH:
				return (125);
			case E_Y:
			case E_YH:
				return (100);
			case E_J:
			case E_F:
				break;
			default:
				if (loc == FLABIAL)
					return (-50);
				else if (loc == FVELAR)
					return (-100);
			}
			break;

		case E_U:
			switch (other)
			{
			case E_M:
			case E_N:
			case E_NH:
			case E_LL:
			case E_G:
			case E_GH:
				return (-75);
			}
		}
	}
	return (0);
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* F.                      S E T L O C                              */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*
 *      Function Name: setloc()      
 *
 *  	Description: Set formant freq bouval and durtran between obstruent and sonorant.
 * 				 	 Return TRUE if it set bouval (for //debug printout).
 *
 *					 We know np is F1, F2, or F3
 *
 *      Arguments:  short nfonobst,				   Segment thought to be an obstruent      
 *					short nfonsonor,			   Segment thought to be a sonorant  
 *					char initfinso,				   Set to 'i' if use init part of sonor 
 *					short nfonvowel,			   Segment (vowel?) on other side of obst 
 *					short feanex
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */
 static short setloc (LPTTS_HANDLE_T phTTS,
					 short nfonobst,	/* Segment thought to be an obstruent      */
					 short nfonsonor,	/* Segment thought to be a sonorant  */
					 char initfinso,	/* Set to 'i' if use init part of sonor */
					 short nfonvowel,	/* Segment (vowel?) on other side of obst */
					 short feanex)
{
	/* Automatic variables */
	short                   fonobst, fonsonor, fonvowel, typob, typso, f2backaffil, curval, tarvowel;
	short                   sontyx, ploc, prcnt;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;


	/* Convert phoneme pointers into phoneme names */
	fonobst = get_phone(pDph_t, nfonobst);
	fonsonor = get_phone(pDph_t,nfonsonor);
	fonvowel = get_phone(pDph_t,nfonvowel);
	/* 
	 * Special rule to assimilate [m] and [n] nasals                8-May-86
	 * If [m] or [n] are followed by an obstruent, use
	 * the obstruent's boundary values.
	 */
	if ((pDphsettar->np > &PF1)
		&& (initfinso == FINAL)
		&& ((featb[fonvowel] & FOBST) IS_PLUS)
		&& (fonobst == E_M
			|| fonobst == E_N))
	{
		fonobst = fonvowel;			   /* Nasal assimilates to obst    */
	}
	/* Use values at beginning of the sonorant */
	if (initfinso == INITIAL)
	{
		typob = endtyp[fonobst];
		typso = begtyp[fonsonor];
	}
	else
	{								   /* Or at the end of the sonorant */
		typob = begtyp[fonobst];
		typso = endtyp[fonsonor];
	}           
	/* printf("fonobst %d pbvalue[%d]=%d\n",fonobst,pDph_t->pbvalue[fonobst]); */
	if (((ploc = pDph_t->pbvalue[fonobst]) == 0)
		|| (typob != OBSTRUENT)		   /* Remove when malbound[] clean */
		|| (typso == OBSTRUENT))
	{
		return (1);					   /* Not obstruent-sonorant tran, as assumed */
	}
	/* printf("ploc %d\n",ploc); */
	sontyx =(fonsonor >= E_A && fonsonor <= E_U) ? (fonsonor - E_A)
		: sonequivindex[typso];
	
	/* printf("sontyx %d\n",sontyx); */
	

	/* printf("phcur %d typso %d\n",phcur typso); */
	/* 
	 * New boundary value computation.  Note that the table has
	 * been revised.
	 *                             
	 * (sontyx * 6) generates a muls instruction on the 68000
	 * which is about as fast as doing a couple of shifts.
	 */
	ploc += (sontyx * 6);			   /* -> [vowel] entry     */
	/* printf("ploc %d\n",ploc); */
	ploc += ((pDphsettar->np - &PF1) * 2);		   /* -> formant entry     */
	
	/*	printf("ploc %d %d %d %d\n",ploc,pDphsettar->np,&PF1,pDphsettar->np-&PF1); */
	pDphsettar->bouval = pDph_t->p_bvalue[ploc];		   /* Boundary value       */
	pDphsettar->durtran = mstofr (pDph_t->p_bvalue[ploc + 1]);	/* Transition duration  */
	/* 
	 * Shorten the transition for a vowel/sonorant with F2
	 * associated with a back cavity, such as English [iy].
	 */
	if (initfinso == INITIAL)
	{
		f2backaffil = place[fonsonor] & F2BACKI;
		curval = getbegtar (phTTS,nfonsonor);
	}
	else
	{								   /* Or at the end of the sonorant */
		f2backaffil = place[fonsonor] & F2BACKF;
		curval = getendtar (phTTS,nfonsonor);
	}
	if ((f2backaffil IS_PLUS) && (pDphsettar->np == &PF2) && !(feanex & FVOWEL))
	{
		pDphsettar->durtran -= (pDphsettar->durtran >> 1);	   /* 25% shorter.         */
	}
	/* 
	 * Do vowel-vowel coarticulation across an obstruent consonant.
	 */
	if (((featb[fonsonor] & FVOWEL) IS_PLUS)
		&& ((featb[fonvowel] & FVOWEL) IS_PLUS)
		&& (pDphsettar->np == &PF2))
	{
		tarvowel = (initfinso == INITIAL)
			? getendtar (phTTS,nfonvowel)
			: getbegtar (phTTS,nfonvowel);
		/* 
		 * Set vvbouval, the offset to the boundary value due to
		 * the remote vowel and vvdurtran, the change in transition
		 * duration.
		 */
		if ((pDphsettar->vvdurtran = pDph_t->allodurs[nfonobst]) > NF100MS)
		{
			pDphsettar->vvbouval = 0;
			pDphsettar->vvdurtran = 0;
		}
		else
		{
			pDph_t->arg1 = ((tarvowel - curval) * (NF100MS - pDphsettar->vvdurtran));
			pDph_t->arg2 = 460;				   /* 45% of arg1, also divided by 16 frames */
			pDphsettar->vvbouval = mlsh1 (pDph_t->arg1,pDph_t->arg2);
			pDphsettar->vvdurtran = NF80MS - (pDphsettar->vvdurtran >> 2);
		}
		/* 
		 * Now recompute boundary value taking into account this offset
		 */
		pDphsettar->bouval -= pDphsettar->vvbouval;			   /* Will be added in phdraw      */
	}

	return (1);						   /* Indicate success             */
}

/*
 *      Function Name: forw_smooth_rules()      
 *
 *  	Description: Determine parameters of forward smoothing  f(pholas,phcur) 
 *
 *      Arguments: 	PDPH_T pDph_t, 
 *				   	short shrif, 
 *				   	short pholas,
 *				    short fealas, 
 *				    short feacur, 
 *				    short struclas,
 *				    short struccur, 
 *				    short feanex
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
				   short fealas, short feacur, short struclas,
				   short struccur, short feanex)
{
	short                   temp;	   /* MVP MI : This variable is made local */
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
 	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	//debugforward ("Set default", pDphsettar->np);

/* Formant frequencies */
/* Dipthongs first     */
	if (pDphsettar->par_type IS_FORM_FREQ_OR_BW
		&& (feacur & FVOWEL) IS_PLUS
		&& (fealas & FSEMIV) IS_PLUS
		&& (struccur & FBOUNDARY) == 0)
	{
		pDphsettar->durtran = pDph_t->durfon >> 1;
		pDphsettar->bouval = (pDphsettar->np->tarlas + pDphsettar->np->tarcur) >> 1;
		//debugforward (" dipthong (vowel) transition",pDphsettar->np);
	}
	else if (pDphsettar->par_type IS_FORM_FREQ_OR_BW
			 && (feacur & FSEMIV) IS_PLUS
			 && (fealas & FVOWEL) IS_PLUS
			 && (struccur & FBOUNDARY) == 0)
	{
		pDphsettar->durtran = pDph_t->durfon >> 1;
		pDphsettar->bouval = (pDphsettar->np->tarlas + pDphsettar->np->tarcur) >> 1;
		//debugforward (" dipthong (semivowel) transition",pDphsettar->np);
	}
	else if (pDphsettar->par_type IS_FORM_FREQ)
	{
		/* 0. Use default values for obst-obst transition */
		if ((feacur & FSONOR) IS_PLUS)
		{
			if ((feacur & FSONCON) IS_MINUS)
			{
				pDphsettar->durtran = NF45MS;
				if (pDphsettar->phcur == E_YH)	   /* Faster for y */
					pDphsettar->durtran = NF25MS;  /* 23-Apr-86    */
				if ((fealas & FSONCON) IS_PLUS)
				{
					/* 1. Soncon-vowel transition, use 25-75% rule */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarlas) >> 1;
					/* Make F1 discontinuous for light /l/           */
					/* Block if transition into silence              */
					/* (Suggestion from DHK, June 5)                 */
					if (pDphsettar->phcur != SIL
						&& (pholas == E_L) && (pDphsettar->np == &PF1))
					{
						pDphsettar->bouval += 80;
					}
#if 0
					/* Make F3 & F2 transitions slower out of /r/ */
					if (((pholas == E_R) || (pholas == E_RR))
						&& (pDphsettar->np != &PF1))
					{
						pDphsettar->durtran = NF70MS;
					}
#endif
					//debugforward (" soncon /vowel transition",pDphsettar->np);
				}
				else
				{
					/* 2. Vowel-[vowel/dh,gh,bh,E_J] transition */
					/* Preceeding seg has strong influence on [h] init val */
					/* if (phonex == E_DH) { bouval = (bouval + np->tarlas) >> 1;
					 * 
 					 * }            
 					 */

				}
			}
			else
			{
				/* Phcur is a sonorant conson */
				if ((fealas & FSONCON) IS_MINUS)
				{
					/* 3. Vowel-soncon trans, use 75-25% rule */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarcur) >> 1;
					pDphsettar->durtran = NF30MS;
				}
				else
				{
					/* 4. Soncon-soncon transition */
					pDphsettar->durtran = NF30MS;
				}
			}
		}
		//debugforward (" sonorant transition",pDphsettar->np);

		/* Bound value = previous target if current phone is sil */
		if (pDphsettar->phcur == SIL)
		{
			/* GL 10/30/96 changed to be same as English */
			if (pDph_t->nphone > 1)
			{
				pDphsettar->bouval = pDphsettar->np->tarlas;
			}
			else
			{
				pDphsettar->bouval = pDphsettar->np->tarnex;
			}
            pDphsettar->durtran = pDph_t->durfon;
            /*
			pDphsettar->bouval = pDphsettar->np->tarlas;
			pDphsettar->durtran = pDph_t->durfon;
			*/
		}
		else
		{
			if (pDphsettar->np <= &PF3)
			{
				/* 5. pholas=obst, phcur=sonor transition */
				setloc (phTTS,pDph_t->nphone - 1, pDph_t->nphone, INITIAL, pDph_t->nphone - 2,feanex);
				/* 6. pholas=sonor, phcur=obst transition */
				setloc (phTTS,pDph_t->nphone, pDph_t->nphone - 1, FINAL, pDph_t->nphone + 1,feanex);
			}
#if 0
			/* 
			 * Doesn't work.
			 */
			/* Dummy vowel for final plosive release into silence is too */
			/* short for an extensive formant transition, make tran less */
			if ((struccur & FDUMMY_VOWEL) IS_PLUS)
			{
/* OUT                  xx += ((bouval - np->tarend) >> 1); np->tarend += xx;   (DOESN'T WORK) END OUT */
			}
#endif

			/* Transitions modified inside obstruents */
			if ((feacur & FOBST) IS_PLUS)
			{
				pDphsettar->durtran = NF30MS;
				if (pDphsettar->np == &PF1)
					pDphsettar->durtran = NF20MS;
				/* Transitions take all of plosive duration */
				if ((feacur & FPLOSV) IS_PLUS)
				{
					pDphsettar->durtran = pDph_t->durfon;
				}
			}

			/* Higher formant transitions slow inside a nasal */
			if ((feacur & FNASAL) IS_PLUS)
			{
				pDphsettar->durtran = pDph_t->durfon;
				/* Except F1, which jumps to value above FNZRO */
				if (pDphsettar->np == &PF1)
				{
					pDphsettar->durtran = 0;
				}
				/* Lower F2 & F3 of [n] nasal murmur before front vowels */
				else if (((pDphsettar->phcur == E_N))
						 && (begtyp[pDphsettar->phonex] == 1))
				{
					if (pDphsettar->np == &PF2)
					{
						pDphsettar->bouval -= 100;
						if ((place[pDphsettar->phonex] & F2BACKI) IS_PLUS)
						{
							pDphsettar->bouval -= 100;
						}
					}
					if (pDphsettar->np == &PF3)
						pDphsettar->bouval -= 100;
				}
				/* Lower F2 of [m] nasal murmur near [i,e,ix] */
				else if ((pDphsettar->np == &PF2)
						 && (pDphsettar->phcur == E_M
							 || pDphsettar->phcur == E_MX)
						 && ((place[pholas] & F2BACKF) IS_PLUS))
				{
					pDphsettar->bouval -= 150;
				}
				//debugforward (" nasals",pDphsettar->np);
			}
		}

		/* Shrink transition dur inside sonor if sonor short */
		if (((feacur & FOBST) IS_MINUS)
			&& (endtyp[pholas] != OBSTRUENT)	/* Unless prev seg is obst */
			&& (pDphsettar->durtran > 0))
		{
			pDph_t->arg1 = pDphsettar->durtran;
			pDph_t->arg2 = shrif;
			pDphsettar->durtran = mlsh1 (pDph_t->arg1,pDph_t->arg2) + 1;
		}
		//debugforward (" Other formant frequency rule",pDphsettar->np);
	}

	/* Formant bandwidths */
	else if (pDphsettar->par_type IS_FORM_BW)
	{
		/* Default transition duration is 40 ms */
		pDphsettar->durtran = NF40MS;
		/* Widen first formant bw if preceeding seg voiceless */
		if ((feacur & FVOICD) IS_PLUS)
		{
			if ((pDphsettar->np == &PB1)
				&& ((fealas & FVOICD) IS_MINUS))
			{
				pDphsettar->durtran = NF50MS;
				/* More increase for low vowels (F1 high) */
				pDphsettar->bouval = pDphsettar->np->tarcur + (PF1.tarcur >> 3);
			}
		}
		else
		{
			pDphsettar->durtran = NF20MS;
		}
		//debugforward (" After BW initial setup",pDphsettar->np);

		/* Treat boundary with silence */
		/* 
		 * This widens the glottis (?) for transitions from
		 * silence.  If you do this for [L] and [LL], it
		 * sounds like [al].
		 */
		if (pholas == SIL && ((feacur & FSONCON) IS_MINUS))
		{
			pDphsettar->bouval = pDphsettar->np->tarcur + ((&PB3 - pDphsettar->np) * 50);
			//debugforward (" Transition from silence",pDphsettar->np);
		}
		else if (pDphsettar->phcur == SIL)
		{
			pDphsettar->bouval = pDphsettar->np->tarlas + ((&PB3 - pDphsettar->np) * 50);
			if (((featb[pDph_t->allophons[pDph_t->nphone - 2]] & FVOICD) IS_MINUS)
				&& (pDphsettar->np == &PB1))
			{
				pDphsettar->bouval = 260;	   /* Kluge to avoid discontinutiy */
			}
			pDphsettar->durtran = NF50MS;
			//debugforward (" Transition into silence",pDphsettar->np);
		}
		/* BW1 widen, to nasalize transition out of previous nasal */
		if ((fealas & FNASAL) IS_PLUS)
		{
			pDphsettar->bouval = pDphsettar->np->tarcur;   /* B2,B3 not influ by nasal */
			if (pDphsettar->np == &PB1)
			{
				pDphsettar->durtran = NF100MS;
				pDphsettar->bouval += 70;
			}
			//debugforward (" Transition from nasal",pDphsettar->np);
		}
		/* Nasals have constant bandwidths at target values */
		if ((feacur & FNASAL) IS_PLUS)
		{
			pDphsettar->durtran = 0;
			//debugforward (" Nasal has const par val",pDphsettar->np);
		}
		/* Special rule for [fi] */
		if ((pDphsettar->np == &PB3)
			&& ((place[pDphsettar->phcur] & F2BACKI) IS_PLUS)
			&& (pholas == E_F))
		{
			pDphsettar->durtran = 0;
			//debugforward (" [fi] special rule",pDphsettar->np);
		}
		//debugforward (" Other bandwidth rule",pDphsettar->np);
	}

	/* Source amplitudes, including parallel formant amplitudes */
	/* Default is max of [average,tarcur-12,tarlas-12] */
	else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP)
			 || (pDphsettar->par_type IS_AV_OR_AH))
	{
		/* See if onset, i.e. plosive or large source intensity increase */
		temp = pDphsettar->np->tarcur - 10;
		if ((pDphsettar->bouval < temp) || ((fealas & FPLOSV) IS_PLUS)
			|| (pholas == E_YH))
		{					   /* 7-May-86    */
			pDphsettar->bouval = temp;
			/* 
			 * No onset transition for B, D, G (22-Jan-86, MM)
			 */
			if ((feacur & FOBST) IS_MINUS)
			{
				pDphsettar->durtran = NF15MS;
				if (fealas ==
					(FVOICD + FOBST + FPLOSV + FCONSON + FBURST + FVBAR))
					pDphsettar->durtran = 0;
			}
			/* Voicing is special */
			if (pDphsettar->np == &PAV)
			{
				/* Gradual buildup of voicing */
				if (pholas == SIL)
				{
					if ((feacur & FVOICD) IS_PLUS)
					{
						pDphsettar->durtran = NF45MS;
						pDphsettar->bouval -= 8;
					}
				}
				/* Obstruent voicing onset is abrupt */
				if ((fealas & FOBST) IS_PLUS)
				{
					pDphsettar->bouval = temp + 6;
				}
				/* Plosive onset is abrupt (used mainly for [bdg]) */
				if ((fealas & FPLOSV) IS_PLUS)
				{
					pDphsettar->bouval = pDphsettar->np->tarcur - 2;
				}
			}
			//debugforward (" Onset",pDphsettar->np);
		}
		/* If last nasal, and source amp increased, abrupt onset */
		if (((fealas & FNASAL) IS_PLUS)
			&& ((feacur & FVOICD) IS_PLUS))
		{
			pDphsettar->durtran = 0;
			//debugforward (" Onset from nasal",pDphsettar->np);
		}
		/* Voicing source amp const in intervocalic nasal */
		if ((feacur & FNASAL) IS_PLUS)
		{
			if ((fealas & FVOICD) IS_PLUS)
			{
				if (pDphsettar->np == &PAV)
					pDphsettar->durtran = 0;
			}
		}
		/* See if offset, i.e. source intensity decreasing */
		temp = pDphsettar->np->tarlas - 10;
		if (pDphsettar->bouval < temp)
		{
			/* Reduce bounval by 3 dB because bval time is onset */
			/* of next phoneme */
			pDphsettar->bouval = temp - 3;
			/* Source amplitudes fall gradually into silence */
			/* 
			 * Added to shorten stop burst               1-May-86
			 * Changed 20msec to 30msec                 22-Jul-86
			 */
			if (pDphsettar->phcur == SIL)
			{
				pDphsettar->durtran = ((fealas & FBURST) IS_PLUS) ? NF30MS : NF70MS;
			}
			/* Except voicing offset is abrupt */
			if (pDphsettar->np == &PAV)
				pDphsettar->durtran = 0;
			//debugforward (" Offset",pDphsettar->np);
		}
		/* Buildup A4 gradually in [CH and YH] */
		if (pDphsettar->np == &PA4)
		{
			if ((pDphsettar->phcur == E_CH)
				|| (pDphsettar->phcur == E_YH))
			{
				pDphsettar->durtran = pDph_t->durfon - NF15MS;
				pDphsettar->bouval = pDphsettar->np->tarcur - 30;
				//debugforward (" CH/YH rule",pDphsettar->np);
			}
		}

		/* Offset of a vowel into voiceless open vocal tract is breathy */
		if (pDphsettar->np == &PAP)
		{
			if ((pDphsettar->phcur == SIL)
				|| feacur == (FOBST | FCONSON))
			{
				/* 
				 * [SI], [F], [TH], [S], [SH]
				 */
				if ((fealas & FSYLL) IS_PLUS)
				{
					if (pDphsettar->phcur == SIL)
					{
						/* 
						 * Changed 56 -> 40             22-Jul-86
						 */
						pDphsettar->bouval = 40;
						pDphsettar->durtran = NF80MS;
					}
					else
					{
						/* 
						 * Changed 52 -> 36             22-Jul-86
						 */
						pDphsettar->bouval = 36;
						pDphsettar->durtran = NF45MS;
					}
				}
				//debugforward (" Spanish AH si/f/th/s/sh rule",pDphsettar->np);
			}
		}
		/* Tilt parameter jumps to target values */
		if (pDphsettar->np == &PTILT)
		{
			pDphsettar->durtran = 0;
		}
	}
	/* Nasal antiformant frequency */
	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ)
	{
		pDphsettar->durtran = 0;
		if (((fealas & FNASAL) IS_PLUS)
			&& ((feacur & FNASAL) IS_MINUS))
		{
			pDphsettar->bouval = 400;
			/* 
			 * Changed to give quick transition         28-Apr-86
			 * for "normal" nasals, slow for ~n
			 */
			pDphsettar->durtran = (pholas == E_NH) ? NF80MS : NF40MS;
		}
	}

	/* Truncate tran dur if exceeds duration of current phone */
	if (pDphsettar->durtran > pDph_t->durfon)
		pDphsettar->durtran = pDph_t->durfon;
	/* Or duration of 20 frames */
	if (pDphsettar->durtran > NF130MS)
		pDphsettar->durtran = NF130MS;
	/* Do not allow amplitude value to go below zero */
	if (pDphsettar->bouval < 0)
		pDphsettar->bouval = 0;
}

/*
 *      Function Name: back_smooth_rules()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short shrib, 
 *				   short feacur,
 *				   short feanex, 
 *				   short strucnex
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
static void back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
				   short feanex, short strucnex)
{
	short                   temp;	   /* MVP MI : This varaible is made local */
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;

	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	    //debugbackward("Backward (cur/nex) default",pDphsettar->np);
	/* Formant frequencies */
	if (pDphsettar->par_type IS_FORM_FREQ_OR_BW
		&& (feacur & FVOWEL) IS_PLUS
		&& (feanex & FSEMIV) IS_PLUS
		&& (strucnex & FBOUNDARY) == 0)
	{
		pDphsettar->durtran = pDph_t->durfon >> 1;
		pDphsettar->bouval = (pDphsettar->np->tarnex + pDphsettar->np->tarcur) >> 1;
		//debugbackward (" dipthong (vowel) transition",pDphsettar->np);
	}
	else if (pDphsettar->par_type IS_FORM_FREQ_OR_BW
			 && (feacur & FSEMIV) IS_PLUS
			 && (feanex & FVOWEL) IS_PLUS
			 && (strucnex & FBOUNDARY) == 0)
	{
		pDphsettar->durtran = pDph_t->durfon >> 1;
		pDphsettar->bouval = (pDphsettar->np->tarnex + pDphsettar->np->tarcur) >> 1;
		//debugbackward (" dipthong (semivowel) transition",pDphsettar->np);
	}
	else if (pDphsettar->par_type IS_FORM_FREQ)
	{        
		/* 0. Use default values for obst-obst transition */
		if ((feacur & FSONOR) IS_PLUS)
		{
			pDphsettar->durtran = NF45MS;
#if 0
		  NOTE:[y] and[yh] are now     obstruents
			if                      (pDphsettar->phcur == E_YH)		/* Faster for y */
				pDphsettar->durtran = NF25MS;	/* 23-Apr-86    */
#endif
			if ((feacur & FSONCON) IS_MINUS)
			{
				if ((feanex & FSONCON) IS_PLUS)
				{
					/* 1. Vowel-soncon trans, use 75-25% rule */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarnex) >> 1;
					/* F3 transitions slower esp for [r,l] */
					if (pDphsettar->np == &PF3)
					{
						pDphsettar->durtran = NF64MS;
					}
					/* First formant jumps down 80 Hz in /l/ */
					/* Block if transition from silence              */
					/* Suggestion from DHK, June 5, 85               */
					if (pDphsettar->phcur != SIL
						&& (pDphsettar->phonex == E_L) && (pDphsettar->np == &PF1))
					{
						pDphsettar->bouval += 80;
					}
				}
				else
				{
				}
			}
			else
			{
				pDphsettar->durtran = NF40MS;
				if ((feanex & FSONCON) IS_MINUS)
				{
					/* 3. Soncon-vowel trans, use 25-75% rule */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarend) >> 1;
					pDphsettar->durtran = NF20MS;
				}
				else
				{
					/* 4. Soncon-soncon transition */
					/* Use defaults */
				}
			}
		}
		/* No backward smoothing if next phone is silence */
		if (pDphsettar->phonex == SIL)
		{
			pDphsettar->durtran = 0;
		}
		else
		{
			if (pDphsettar->np <= &PF3)
			{
				/* 5. phcur=sonor, phonex=obst transition */
				setloc (phTTS,pDph_t->nphone + 1, pDph_t->nphone, FINAL, pDph_t->nphone + 2,feanex);
				/* 6. phcur=obst, phonex=sonor transition */
				setloc (phTTS,pDph_t->nphone, pDph_t->nphone + 1, INITIAL, pDph_t->nphone - 1,feanex);
			}
			/* Transitions slow inside obstruents */
			if ((feacur & FOBST) IS_PLUS)
			{
				pDphsettar->durtran = (pDphsettar->np == &PF1) ? NF20MS : NF30MS;
				/* Transitions take all of plosive duration */
				if ((feacur & FPLOSV) IS_PLUS)
				{
					pDphsettar->durtran = pDph_t->durfon;
				}
				//debugbackward (" Obstruent",pDphsettar->np);
			}

			/* Higher formant transitions slow inside a nasal */
			if ((feacur & FNASAL) IS_PLUS)
			{
				pDphsettar->durtran = pDph_t->durfon;
				/* Except F1, which jumps to value below FNZRO */
				if (pDphsettar->np == &PF1)
				{
					pDphsettar->durtran = 0;
				}
				/* Lower F2 of [m] murmur near [i,y,yx] */
				else if ((pDphsettar->np == &PF2)
						 && (pDphsettar->phcur == E_M || pDphsettar->phcur == E_MX)
						 && ((place[pDphsettar->phonex] & F2BACKI) IS_PLUS))
				{
					pDphsettar->bouval -= 150;
				}
			}
		}

		/* Shrink tran dur inside sonorant if sonorant short */
		if (((feacur & FOBST) IS_MINUS)
			&& (begtyp[pDphsettar->phonex] != OBSTRUENT)	/* Unless next seg is obst */
			&& (pDphsettar->durtran > 0))
		{
			pDph_t->arg1 = pDphsettar->durtran;
			pDph_t->arg2 = shrib;
			pDphsettar->durtran = mlsh1 (pDph_t->arg1,pDph_t->arg2) + 1;
		}
		//debugbackward (" Other formant freq. rule",pDphsettar->np);
	}
	/* Formant bandwidths */
	else if (pDphsettar->par_type IS_FORM_BW)
	{
		pDphsettar->durtran = NF40MS;
		if ((feacur & FVOICD) IS_PLUS)
		{
			/* Glottis opens early before -voice C, widen B1 */
			if (pDphsettar->np == &PB1)
			{
				if ((feanex & FVOICD) IS_MINUS)
				{
					pDphsettar->durtran = NF50MS;
					/* More increase for low vowels (F1 high) */
					pDphsettar->bouval = pDphsettar->np->tarend + (PF1.tarcur >> 3);
					/* Effect is greater for a female voice */
					if (pDph_t->malfem == FEMALE)
					{
						pDphsettar->durtran = NF100MS;
					}
				}
			}
		}
		else
		{
			pDphsettar->durtran = NF20MS;
		}
		//debugbackward (" After BW initial setup",pDphsettar->np);
		/* Treat boundary with silence */
		/* OUT ??? */ 
		if (pDphsettar->phonex == SIL)
		{
			pDphsettar->bouval = pDphsettar->np->tarend + ((&PB3 - pDphsettar->np) * 50);
			pDphsettar->durtran = NF50MS;
			//debugbackward (" Transition to silence",pDphsettar->np);
		}
		else if (pDphsettar->phcur == SIL)
		{
			pDphsettar->bouval = pDphsettar->np->tarnex + ((&PB3 - pDphsettar->np) * 50);
			pDphsettar->durtran = NF50MS;
			/* 
			 * Faster transition into [L] and [LL]
			 */
			if ((feanex & FSONCON) IS_PLUS)
				pDphsettar->durtran = NF15MS;
			//debugbackward (" Transition from silence",pDphsettar->np);
		}

		/* BW1 widen, to nasalize transition into next nasal */
		if ((feanex & FNASAL) IS_PLUS)
		{
			pDphsettar->bouval = pDphsettar->np->tarend;
			if (pDphsettar->np == &PB1)
			{
				/* 
				 * Changed 20ms -> 40ms                 28-Apr-86
				 */
				pDphsettar->durtran = NF40MS;	/* shorter transition   */
				pDphsettar->bouval += 100;
			}
			//debugbackward (" Transition to nasal",pDphsettar->np);
		}
		/* Nasals have constant bandwidths at target values */
		if ((feacur & FNASAL) IS_PLUS)
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Nasal has const. par val",pDphsettar->np);
		}
		//debugbackward (" Bandwidth result",pDphsettar->np);
	}

	/* Source amplitudes, including parallel formant amplitudes */
	else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP)
			 || (pDphsettar->par_type IS_AV_OR_AH))
	{
		/* See if onset, i.e. source intensity increasing */
		temp = pDphsettar->np->tarnex - 10;
		if (pDphsettar->bouval < temp)
		{
			pDphsettar->bouval = temp;
			/* Onset of an init fricative or /h/ is very gradual */
			if (pDphsettar->phcur == SIL)
			{
				pDphsettar->durtran = NF70MS;
			}
			//debugbackward (" Onset",pDphsettar->np);
		}
		/* Voicing is special:  onset is abrupt, except if a voiced fric */
		if ((pDphsettar->np == &PAV) && (pDphsettar->bouval < pDphsettar->np->tarnex)
#if 0
			&& feacur != (FVOICD | FSONOR | FCONSON))
		{
			/* 
			 * All but BH, DH, GH, YH, V, Z
			 */
#else
#ifdef E_V
			&& pDphsettar->phcur != E_V
#endif
			&& pDphsettar->phcur != E_YH   /* 7-May-86    */
			&& pDphsettar->phcur != E_Z)
		{
			/* 
			 * All but Y, V, Z
			 */
#endif
			pDphsettar->durtran = 0;
			//debugbackward (" Make next onset abrupt",pDphsettar->np);
			/* Voicebar dies out in a voiced plosive */
			if (((feacur & FPLOSV) IS_PLUS)
				|| (pDphsettar->phcur == E_CH)
				|| (pDphsettar->phcur == E_YH)
				|| (pDphsettar->phcur == E_BH)
			/* || (phcur == E_DH) */
				|| (pDphsettar->phcur == E_GH))
			{
				if ((feacur & FPLOSV) IS_PLUS)
				{
					if ((feacur & FVOICD) IS_PLUS)
					{
						pDphsettar->bouval = pDphsettar->np->tarend - 3;
						pDphsettar->durtran = NF45MS;
						//debugbackward (" Voicebar dies out",pDphsettar->np);
					}		   /* out eab dh etc is not a voice bar */
					/* Do not allow prevoicing in a voiceless plosive */
					else
					{
						pDphsettar->bouval = 0;
					}
					goto endbsmo;
				}
			}
		}
		/* 
		 * Spanish prevoices [s] and [th]               8-May-86
		 * before voiced consonants
		 * (The exact amount is dialectical and depends
		 * on the pronunciation style.  We'll try 50%
		 * for want of anything better.
		 *
		 * This is essentially the allophonic rule
		 *      [s]->[z] / _ [+voice]
		 */
		if ((pDphsettar->np == &PAV)
			&& (pDphsettar->phcur == E_S || pDphsettar->phcur == E_TH)
			&& ((feanex & (FCONSON | FVOICD)) == (FCONSON | FVOICD)))
		{
			pDphsettar->durtran = pDph_t->durfon >> 1;
			//debugbackward (" [s, th] prevoicing rule",pDphsettar->np);
		}
		if (pDphsettar->phcur == E_TH && pDph_t->th_to_s == TRUE)
		{
			pDphsettar->phcur = E_S;
		}
		/* If next nasal, and current phone is voiced, set AV const */
		if (((feanex & FNASAL) IS_PLUS)
			&& ((feacur & FVOICD) IS_PLUS))
		{
			pDphsettar->durtran = 0;
			//debugbackward (" AV const in voiced to nasal",pDphsettar->np);
		}
		/* If current phone nasal, and next phone is voiced, AV constant */
		if (((feacur & FNASAL) IS_PLUS)
			&& ((feanex & FVOICD) IS_PLUS))
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Make murmur const AV",pDphsettar->np);
		}
		/* See if offset, i.e. source intensity decreasing */
		temp = pDphsettar->np->tarend - 10;
		/* Plosive burst does not get attenuated during offset */
		if ((feacur & FPLOSV) IS_PLUS)
		{
			/* 
			 * Change from "always NF15MS"              22-Jul-86
			 * The value is changed by a special rule.
			 */
			if ((feacur & FBURST) IS_MINUS)
				pDphsettar->durtran = mstofr (burdr[pDphsettar->phcur]);	/* Use inherent */
			if (pDphsettar->phcur != E_CH && pDphsettar->phcur != E_YH)
			{
				temp = pDphsettar->np->tarend;
			}
			//debugbackward ("Plosive burst duration",pDphsettar->np);
		}
		if (pDphsettar->bouval < temp)
		{
			pDphsettar->bouval = temp - 3;
#if 0
			/* Out (fix kiki problem) */
			pDphsettar->durtran = NF20MS;  /* Guess */
#endif
			if (pDphsettar->np == &PAV)
			{
				pDphsettar->bouval = temp + 4;
				/* Voicing amp falls gradually at end of phrase */
				if (pDphsettar->phonex == SIL)
				{
					pDphsettar->bouval = pDphsettar->bouval - 6;
					pDphsettar->durtran = NF40MS;	/* Guess                */
				}
			}
			if (pDphsettar->np == &PAP)
			{
				pDphsettar->bouval = PAP.tarend - 36;
			}
			//debugbackward (" Offset to noise",pDphsettar->np);
		}
		/* No smoothing of source amps if next segment has burst */
		if (((feanex & FPLOSV) IS_PLUS)
			|| (pDphsettar->phonex == E_YH)
			|| (pDphsettar->phonex == E_CH))
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Stop closure next",pDphsettar->np);
		}

		/* Onset of a vowel from voiceless open vocal tract is breathy */
		if (pDphsettar->np == &PAP)
		{
			if ((pDphsettar->phcur == SIL)
				|| feacur == (FOBST | FCONSON))
			{
				/* 
				 * (Select F, TH, S, SH)
				 * Select vowels only, so [l] and [ll] sound ok.
				 */
				if (((feanex & FSYLL) IS_PLUS))
				{
					/* 
					 * 56->40                           22-Jul-86
					 */
					pDphsettar->bouval = 40;
					pDphsettar->durtran = NF40MS;
				}
				//debugbackward (" Onset of vowel from vless voc tract",pDphsettar->np);
			}
			/* Offset of a vowel into silence is breathy */
			if (((feacur & FSYLL) IS_PLUS)
				&& (pDphsettar->phonex == SIL))
			{
				/* 
				 * Less effect for Spanish              22-Jul-86
				 */
				pDphsettar->bouval = 40;
				pDphsettar->durtran = NF50MS;
				//debugbackward (" Breathy offset of vowel to silence",pDphsettar->np);
			}
		}

		/* Tilt parameter jumps to target values except before voiceless */
		if (pDphsettar->np == &PTILT)
		{
			pDphsettar->durtran = 10;	   /* eab changed from 0 don't believe in 0 time */
			if (((feacur & FVOICD) IS_PLUS)
				&& ((feacur & FNASAL) IS_MINUS)
				&& ((feanex & FVOICD) IS_MINUS))
			{
				pDphsettar->durtran = NF50MS;
				pDphsettar->bouval = pDphsettar->np->tarnex >> 1;
				/* Breathy offset to a vowel */
				if (pDphsettar->phonex == SIL)
				{
					pDphsettar->durtran = NF130MS;
					pDphsettar->bouval = pDphsettar->np->tarnex;
				}
			}
			//debugbackward ("tilt",pDphsettar->np);
		}
	}

	/* Nasal antiresonator frequency */
	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ)
	{
		pDphsettar->durtran = 0;
		/* Nasalization cue: place zero between F1 and FP */
		if (((feanex & FNASAL) IS_PLUS)
			&& ((feacur & FNASAL) IS_MINUS))
		{
			pDphsettar->bouval = 400;
			pDphsettar->durtran = NF20MS;
		}
		//debugbackward ("nasals",pDphsettar->np);
	}

	/* Truncate back transition so as not to exceed 20 frames */
  endbsmo:
	if (pDphsettar->durtran > NF130MS)
		pDphsettar->durtran = NF130MS;
	/* Truncate backward tran so as not to exceed dur of phone */
	if (pDphsettar->durtran > pDph_t->durfon)
		pDphsettar->durtran = pDph_t->durfon;
	pDphsettar->np->tbacktr = pDph_t->durfon - pDphsettar->durtran;
	/* No parameter can take on negative values */
	if (pDphsettar->bouval < 0)
		pDphsettar->bouval = 0;
}

/*
 *      Function Name: special_rules()      
 *
 *  	Description: 
 *
 *      Arguments:  PDPH_T pDph_t, 
 *				   	short fealas,
 *			   		short feacur, 
 *			   		short feanex, 
 *			   		short struclm2,
 *			   		short struccur, 
 *			   		short pholas, 
 *			   		short struclas
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void special_rules (LPTTS_HANDLE_T phTTS, short fealas,
			   short feacur, short feanex, short struclm2,
			   short struccur, short pholas, short struclas)
{
	short                   bdur, vot; /* MVP made as a local variable */
	short                   closure_dur;	/* MVP made as a local variable */

	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	/* SPECIAL RULE 1: Burst duration for plosives and affricates             */

	bdur = burdr[pDphsettar->phcur];	   /* Inherent burst duration in msec.     */
	if ((feacur & FBURST) IS_PLUS)
	{
		if (pDphsettar->phcur == E_CH
			|| pDphsettar->phcur == E_YH)
		{
			/* 
			 * For [ch], set the closure to 9/16 of the phoneme
			 * duration and the affrication 7/16.  This follows
			 * Prof. Quilis analysis (92 msec. closure, 73 msec.
			 * frication.)
			 *
			 * Use the same values for [yh] until told otherwise.
			 */
			bdur = (pDph_t->durfon >> 1) + (pDph_t->durfon >> 4);
		}
		else
		{
			bdur = mstofr (bdur);
			/* 
			 * Shrink burst duration if closure duration is short
			 */
			if ((pDph_t->durfon - bdur) < NF50MS && bdur > 1)
			{
				bdur--;
			}
			/* 
			 * More shrinkage after sonorants               1-May-86
			 * But not after SIL                            22-Jul-86
			 */
			if ((fealas & FSONOR) IS_PLUS
				&& pholas != SIL
				&& bdur > 1)
			{
				bdur--;
			}
			/* 
			 * Don't release plosive in plos-nasal or plos-plos sequence
			 */
			if (((feanex & (FNASAL | FPLOSV)) != 0)
				&& place[pDphsettar->phcur] >= place[pDphsettar->phonex])
				bdur = 0;
		}
		closure_dur = pDph_t->durfon - bdur;
		for (pDphsettar->np = &PA2; pDphsettar->np <= &PAB; pDphsettar->np++)
		{					   /* All fric gains to */
			pDphsettar->np->tspesh = closure_dur;	/* zero during closur */
			pDphsettar->np->pspesh = 0;
		}
	}
	/* SPECIAL RULE 2: Voice onset time for aspirated plosives */
	/* 
	 * Aspiration amplitude
	 */
	vot = 0;
	if ((((fealas & FPLOSV) IS_PLUS)
		 && ((fealas & FVOICD) IS_MINUS)
		 && ((feacur & FSONOR) IS_PLUS)))
	{
		switch (place[pDphsettar->phcur])
		{
			case FDENTAL:
			case FLABIAL:
				PAP.pspesh = ASPIRATION_AMPLITUDE - (8);	/* eab */
				break;

			default:
				PAP.pspesh = ASPIRATION_AMPLITUDE;
				break;
		}
		PAV.pspesh = 0;		   /* Amplitude of voicing during aspir */
		/* Increase aspiration level when F1 low */
		PAP.pspesh += ((500 - PF1.tarcur) >> 6);
		/* 
		 * Voice onset time and amplitude modifications.
		 */
		if (pholas == E_K)
		{
			vot = NF7MS;	   /* Vot before unstressed vowel  */
		}
		switch (pDphsettar->phcur)
		{					   /* Vot of ptk before high vowel */
			case E_I:
			case E_U:
			case E_YX:
			case E_WX:
				vot = NF15MS;
		}
		if ((feacur & FSONCON) IS_PLUS)		/* Longer in sonor cons. */
			vot += NF7MS;
		if (vot >= pDph_t->durfon)
		{
			vot = pDph_t->durfon - 1;
		}
		/* Vot cannot exceed 1/2 duration of a stressed vowel */
		if ((vot > (pDph_t->durfon >> 1))
			&& ((feacur & FSYLL) IS_PLUS)
			&& ((struccur & FSTRESS_1) IS_PLUS))
		{
			vot = pDph_t->durfon >> 1;
		}
#if 0
		/* 
		 * Removed so Spanish doesn't release stop at end of clause     28-Apr-86
		 */
		if ((struclas & FBOUNDARY) >= FWBNEXT)
		{
			vot = NF25MS;
			PAP.pspesh -= 3;
		}
#endif
		PAV.tspesh = vot;
		PAP.tspesh = vot;
		/* Widen 1st and 2nd formant bws when glottis open for aspir */
		PB1.tspesh = vot;
		PB2.tspesh = vot;
		PB1.pspesh = PB1.tarcur + 200;
		PB2.pspesh = PB2.tarcur + 70;
	}

	/* SPECIAL RULE 3: Create realistic voicebar, avoid pops and clicks */

	/* 
	 * Spanish prevoices in all contexts.
	 */
	if ((feacur & FVBAR) IS_PLUS)
	{
		PAV.tspesh = pDph_t->durfon;
		PF1.tspesh = pDph_t->durfon;
		PB1.tspesh = pDph_t->durfon;
		PB2.tspesh = pDph_t->durfon;
		PB3.tspesh = pDph_t->durfon;
		PTILT.tspesh = pDph_t->durfon;
		/* 
		 * The voicebar amplitude will be raised by PHDRAW to compensate
		 * for the large tilt.                              10-Apr-86 MM
		 */
		/* 12/10/1996 EDB, was 67 - 10 */
		PAV.pspesh = 67 - 20;  /* Amp of voicebar, AV target invalid   */
		PF1.pspesh = 180;	   /* Set to under 250 to signal voicebar  */
		PB1.pspesh = 300;	   /* change from 600, Mar 26 (DHK)        */
		PB2.pspesh = 600;
		PB3.pspesh = 600;
		PTILT.pspesh = 24 - 6;
		PA2.tspesh = 0;
		PA3.tspesh = 0;		   /* If rules below set to non-zero, substitute */
		PA4.tspesh = 0;		   /* pspesh for computed value over time      */
		PA5.tspesh = 0;		   /* interval from beginning of phone (done   */
		PA6.tspesh = 0;		   /* in JPHDRAW.C                             */
		PAB.tspesh = 0;

		/* 
		 * Lower F2 and F3 amplitude for [be, bi] and        7-May-86
		 * [de, di]. Suggestion from Dr. Quilis.  Actual
		 * number is a guess.
		 */
		if (pDphsettar->phcur != E_G
			&& (pDphsettar->phonex == E_I
				|| pDphsettar->phonex == E_E))
			PAV.pspesh = 67 - 6 - 7;
	}
}


/*
 *      Function Name: shrdur      
 *
 *  	Description: SHRINK OR EXPAND DURIN NONLINEARLY IN A DIPHTHONG TO PRESERVE 
 * 					 TENDENCY TOWARD CONSTANT DURATION OF TRANSITION PORTION 
 *					 WITH CHANGES IN VOWEL DURATION
 *
 *      Arguments:	PDPH_T pDph_t, 
 *					short durin, 
 *					short inhdr_frames,
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
	short                   halfinhdr, quarterinhdr, foldswitch, temp;
	short 					arg1,arg2;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	/* Convert from ms to number of frames */
	durin = mstofr (durin);
	halfinhdr = inhdr_frames >> 1;
	quarterinhdr = halfinhdr >> 1;
	/* Fold durin over about halfinhdr */
	foldswitch = 0;
	if (durin > halfinhdr)
	{
		durin = inhdr_frames - durin;
		foldswitch = 1;
	}
	if (durin < quarterinhdr)
	{
		/* Extra shrinkage about quartertime */
		if (shrink > FRAC_ONE)
		{
			/* Shrink/4 + (3/4 * FRAC_ONE) */
			arg2 = (shrink >> 2) + FRAC_3_4THS;
		}
		else
		{
			/* (2 * shrink) - FRAC_ONE */
			arg2 = (shrink - FRAC_ONE) + shrink;
		}
		if (arg2 <= 0)
			arg2 = 1;
		arg1 = durin;
		durin = mlsh1 (arg1,arg2);
	}
	else
	{
		/* Extra shrinkage about quartertime */
		if (shrink > FRAC_ONE)
		{
			/* (3/2 * FRAC_ONE ) - (shrink/2) */
			arg2 = FRAC_3_HALVES - (shrink >> 1);
		}
		else
		{
			arg1 = shrink;
			if (arg1 < 8193)
				arg1 = 8193;
			/* (3 * FRAC_ONE ) - (2 * shrink) */
			arg2 = ((((FRAC_ONE - arg1) + FRAC_ONE) - arg1)
					+ FRAC_ONE);
		}
		if (arg2 <= 0)
			arg2 = 1;
		arg1 = halfinhdr - durin;
		durin = halfinhdr - mlsh1 (arg1,arg2);
	}
	if (foldswitch == 1)
		durin = inhdr_frames - durin;
	arg1 = durin;
	arg2 = shrink;
	temp = mlsh1 (arg1,arg2) + 1;
	return (temp);
}

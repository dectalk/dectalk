/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:    p_uk_st1.c
 *    Author:		Matthew Schnee
 *    Creation Date:04-Jun-1996
 *
 *    Functionality:
 *	  English specific functions from phsettar.c
 *
 ***********************************************************************
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	--------------------------------------------
 *	001	MGS		06/04/1996	file created
 *	002 MGS		06/18/1996  moved setloc, vv_coartic_across_c, shrdur to ph_sttr2.c
 *  003 SIK		07/12/1996  Cleaning up and maintenance
 *  004	EAB		07/31/1996	Fixed typo with silence for single vowel phrases 
 *  005	GL		10/30/1996  Merge the changes from V43 code base.
 * 	006 EAB		02/06/1997 	Isolated problem that was causing spa and pa to have the same VOT time.
 *  007 EAB		10/13/1997  copied from p_us_st1.c
 *  008 EAB		12/29/1997  Fixed JH overload found while tuning and testing voices. Bats 543
 *	009 EAB		05/11/1998	BAYS 660 add slowtalk
 *  010 EAB		05/20/1998  BATS681  Remove unneeded code--debugforward && debugbackwards
 *  011 eab 	11/06/1998  BATS  807 Tuning for 5.0 release (hard coded levels)
 *  012 EAB		03/26/1999 	BATS 878 Fixed the burst-plosive and plosive-plosive problem 
 *	013 EAB		06/07/ 		Modify to support Nasal value definitions
 *	013	MGS		04/13/2000	Changes for integrated phoneme set 
 *	014	EAB		06/28/2000	Unified Phoneme Set Changes
 *	015	MGS		12/13/2000	Further optimization on gettar
 *	016	MGS		01/18/2001	Removed arg1 arg2 and arg3 from calculations
 *  017	MGS		04/11/2002	ARM7 port
 *	018	CAB		05/23/2002	Removed warnings
 *	
 *
 */


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* C.                      G E T T A R                              	 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
 
/* ******************************************************************
 *      Function Name: uk_gettar()
 *
 *  	Description: Get target value (or a pointer to first value of diphthong specification 
 * 					 (do not compute any coarticulatory influences of adjacent phones)         
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				   int nphone_temp
 *
 *      Return Value: short 
 *
 *      Comments:
 *
 *	
 * *****************************************************************/
short uk_gettar(LPTTS_HANDLE_T phTTS, int nphone_temp)
{
	short                   phone_temp, phlas_temp, phnex_temp, tartemp=0, pphotr, begtypnex, npar;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;


	npar = pDphsettar->np - &PF1;
	if (pDphsettar->np < &PFZ)                      
		pphotr = (npar) * UK_TOT_ALLOPHONES;
	else
		pphotr = (npar - 1) * UK_TOT_ALLOPHONES;
		/* No table entries for PAP parameter */

	phlas_temp = get_phone (pDph_t, nphone_temp - 1);
	phone_temp = get_phone (pDph_t, nphone_temp);
	phnex_temp = get_phone (pDph_t, nphone_temp + 1);

	/* GETTAR:  F1, F2, F3, B1, B2, B3 */
	if ((pDphsettar->par_type = partyp[npar]) IS_FORM_FREQ_OR_BW)
	{
		if ((tartemp = pDph_t->p_tar[(phone_temp & PVALUE) + pphotr]) < -1)
		{
			/* printf("tartem1 %d of %d \n",*tartemp,(phone_temp & PVALUE)); */
			return (tartemp);		   /* Pointer to diph info in p_diph[] */
		}
		
		if (tartemp < -1)
		{
			tartemp = pDph_t->p_diph[-tartemp];
		}
		/* Fricatives have higher F1 if preceeded by a vowel */
		if ((npar == F1 - 1)
			&& ((phone_feature( pDph_t,phone_temp) & FOBST) IS_PLUS)
			&& ((phone_feature( pDph_t,phone_temp) & FSTOP) IS_MINUS)
			&& ((phone_feature( pDph_t,phlas_temp) & FSYLL) IS_PLUS))
		{
			tartemp += 40;
		}
		/* Special rule for B2 of \n/ before non-front vowels */
		if (((phone_temp == UKP_N) || (phone_temp == UKP_EN))
			&& (npar == B2 - 1))
		{
			if (begtyp(phnex_temp ) != 1)
			{
				tartemp += 60;
			}
		}
		/* Special rule for B3 of \n/ adjacent to high-front vowels */
		if (((phone_temp == UKP_N) || (phone_temp == UKP_EN) || (phone_temp == UKP_NX))
			&& (npar == B3 - 1))
		{
			if (((uk_place[phnex_temp & PVALUE] & F2BACKI) IS_PLUS)
				|| ((uk_place[(phlas_temp & PVALUE)] & F2BACKF) IS_PLUS))
			{
				tartemp = 1600;
			}
		}
	}
	/* 
	 * eab do nasals differently by nasalizing vowel before it and then 
	 * reduce dur on n not vowel in rule 22 context. The code actually nasalizes
	 * anything in front of it 
	 */
	/* GETTAR:  FZ */
	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ)
	{
		tartemp = NON_NASAL_ZERO;				   /* Default for non-nasalized, cancel FP=280 */
		if ((phone_feature( pDph_t,phone_temp) & FNASAL) IS_PLUS)
		{
			tartemp = NASAL_ZERO_CONS;			   /* Value dur nasal murmur (527=max) */
		}
		
/* if ((pDphsettar->phonex == N  || pDphsettar->phonex == M) && (phone_temp != R )) { tartemp = 300; pDphsettar->nasvowel=1; }        */
	}
	/* GETTAR:  AV, AP */
	else if (pDphsettar->par_type IS_AV_OR_AH)
	{
		/* Rules for voicing amplitude */
		if (npar == AV - 1)
		{
			tartemp = pDph_t->p_tar[(phone_temp & PVALUE)+ pphotr];
/* EAB 5/11/98 BATS 660 */
			if(pKsd_t->sprate <100)
				if (phone_temp == USP_Q)
					tartemp -=30;

			/* Dummy vowel has less intensity */
			if ((pDph_t->allofeats[nphone_temp] & FDUMMY_VOWEL) IS_PLUS)
			{
				tartemp -= 7;
			}
			/* Voiced stop devoiced if preceding seg voiceless */
			if (((phone_feature( pDph_t,phone_temp) & FPLOSV) IS_PLUS)
				&& ((phone_feature( pDph_t,phlas_temp) & FVOICD) IS_MINUS))
			{
				tartemp = 0;
			}
			/* Voice [h] if unstressed and preceeded by voiced seg */
			if ((phone_temp == UKP_HX)
				&& ((phone_feature( pDph_t,phlas_temp) & FVOICD) IS_PLUS)
				&& ((pDph_t->allofeats[nphone_temp] & FSTRESS_1) IS_MINUS))
			{
				tartemp = 54;
			}
		}
		/* Rules for aspiration amplitude */
		else
		{
			if (phone_temp == UKP_HX)
			{
				tartemp = 50;
				if (begtyp(phnex_temp) != 1)
				{
					tartemp = 52;	   /* Stronger asp before +back */
				}
			}
			else
			{
				tartemp = 0;
			}
		}
		/* Reduce amplitudes if unstressed */
		/*	eab 2/96 This only handles stressted unstress and doesn't
			accomadate other stress levels today*/
		if ((pDph_t->allofeats[nphone_temp] & FSTRESS) IS_MINUS)
		{
			tartemp -= 4;
			if (tartemp < 0)
				tartemp = 0;
		}
	}
#ifndef HLSYN
	/* GETTAR:  A2, A3, A4, A5, A6, AB */
	else if (pDphsettar->par_type IS_PARALLEL_FORM_AMP)
	{
		/* If ptram >0, it is a pointer in obstruent array taram */
		if ((pDphsettar->np != &PTILT) && ((tartemp = ptram(phone_temp)) > 0))
		{
			begtypnex = begtyp(phnex_temp) - 1;
			if (phnex_temp == GEN_SIL)
				begtypnex = endtyp(phlas_temp) - 1;
			if (begtypnex == 4)
				begtypnex = 2;

			tartemp += (npar - A2 + 1 + (6 * begtypnex));
			tartemp = pDph_t->p_amp[tartemp];

			/* Burst has less intensity if dummy vowel next */
			if ((pDph_t->allofeats[nphone_temp + 1] & FDUMMY_VOWEL) IS_PLUS)
			{
				if (tartemp >= 4)
				{
					tartemp -= 4;
				}
			}
		}
		/* GETTAR:  TLT */

		/* Source spectral tilt: highly tilted for obstruents */
		/* (Voiced obstruents are special case, set F1=0 to signal voicebar) */
		if (pDphsettar->np == &PTILT)
		{
			tartemp = 0;
			if (phone_temp == GEN_SIL)
			{
				tartemp = 0;
			}
			/* eab hx energy too high at high frequency try controling with tilt */
			if (phone_temp == UKP_HX)
			{
				tartemp = 20;
			}

			else if ((pDph_t->allofeats[nphone_temp] & FDUMMY_VOWEL) IS_PLUS)
			{
				tartemp = 20;
			}
			else if ((phone_feature( pDph_t,phone_temp) & FOBST) IS_PLUS)
			{
				tartemp = 7;
				if (((phone_feature( pDph_t,phone_temp) & FVOICD) IS_PLUS)
					&& (((phone_feature( pDph_t,phone_temp) & FPLOSV) IS_PLUS)
						|| (pDphsettar->phcur == UKP_JH)))
				{
					tartemp = 40;	   /* Max tilt for [b,d,g] */
				}
			}
			else if ((phone_feature( pDph_t,phone_temp) & FNASAL) IS_PLUS)
			{
				tartemp = 6;		   /* Tilt down nasal murmurs */
			}

			/* Female front vowels should be tilted down slightly */
			else if ((begtyp(phone_temp) == 1) || (endtyp(phone_temp ) == 1))
			{
				if (pDph_t->malfem == FEMALE)
				{
					tartemp += 6;
				}
				else
				{
					tartemp += 3;
				}
			}
			else if(phone_temp == UKP_OW)
				tartemp +=10;

		}
	}
	return (tartemp);
#endif
}

/* ******************************************************************
 *      Function Name: special_coartic()      
 *
 *  	Description: 
 *
 *      Arguments: 	PDPH_T pDph_t, 
 *					short nfon, 
 *					short diphpos
 *
 *      Return Value: 
 *
 *      Comments:
 *
 * *****************************************************************/
static short UKP_special_coartic(PDPH_T pDph_t, short nfon, short diphpos)
{
	/* Note: Gen coartic of 5% with adjacent segs elsewhere, so stuff here is big */
	/* This routine is only called if the current segment is diph (i.e. a vowel) */

	short                   temp, fonnex, foncur, fonlas;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	temp = 0;
	foncur = get_phone(pDph_t, nfon);
	fonnex = get_phone(pDph_t, nfon + 1);
	fonlas = get_phone(pDph_t, nfon - 1);

	/* F3 target of selected vowels */
	if (pDphsettar->np == &PF3)
	{
		if (((phone_feature( pDph_t,foncur) & FVOWEL) IS_PLUS) && (foncur != UKP_RR))
		{
			if (((fonlas == UKP_W) || (fonlas == UKP_R) )
				|| ((fonnex == UKP_W) || (fonnex == UKP_R) ))
			{
				temp = -150;
			}
		}
		/*  F3 target raised before [LX] */
		if (fonnex == UKP_LX)
		{
			if (diphpos == 0)
			{
				temp = +150;
			}
			if (diphpos == 1)
			{
				temp = +250;
			}
			if ( diphpos > 1)
			{
				temp = +350;

			}
		}
	}
	/* F2 target of selected vowels */
	if (pDphsettar->np == &PF2)
	{
		/*  F2 target lowered before [LX] */
		if (fonnex == UKP_LX)
		{
			if (diphpos == 0)
			{
				temp = -150;
			}
			if (diphpos == 1)
			{
				temp = -250;
			}
			if ( diphpos > 1)
			{
				temp = -350;
			}
		}

		/*  F2 target lowered after [W], [L] (DO ALSO FOR F3 of [W] */
		if ((fonlas == UKP_W) || (fonlas == UKP_LL) || (fonlas == UKP_LX))
		{
			if (((foncur >= UKP_IY) && (foncur <= UKP_AE)) || (foncur == UKP_IX))
			{
				temp = -150;		   /* las and nex effects not cumulative */
			}
		}

		/* eab 11/18/97 Found that first this rule is basically in twice and the affects are much too strong
		with oobserved data (Caroline's ears isolated this problem  the affects of the previous rule which
		is important are wiped out by these rules in words like stool, My preliminary observations say that
		the adjacenies affects can be handled by locus. Notice this is a double change in that previous rule 
		used to be for front vowels only I think the answer is to use alevelar sonorants not consonants */

		/* [UW] F2 target raised adjacent to an alveolar */
		if (foncur == UKP_UW && ((phone_feature( pDph_t,fonlas) & FSONOR) IS_PLUS))
		{
			if ((uk_place[fonlas & PVALUE] & FALVEL) IS_PLUS)
			{
				if(diphpos > 0)
				{
					temp += 200;
				}
				else
				{
					temp = 200;
				}
			}
		}
	
#ifdef OUTFORUK

		/* Effects are greater for unstressed vowels */
		if ((pDph_t->allofeats[nfon] & FSTRESS) IS_MINUS)
		{
			temp += (temp >> 1);
/* This rule is not good for British English for YU need to evaluate others*/
			/* Unstressed YU has a fronted U part */
		/*	if ((foncur == UKP_YU) && (diphpos > 0))
			{
				temp =400;
			} */
		}
#endif
		/* Reduce effects for phrase-final stressed vowels */
	/*	else */if ((pDph_t->allofeats[nfon] & FBOUNDARY) >= FVPNEXT)
		{
			temp = temp >> 1;
		}
		/* Maximum change should not be excessive */
		if (temp > 400)
			temp = 400;
		if (temp < -400)
			temp = -400;
	}

	return (temp);
}

/* ******************************************************************
 *      Function Name: forw_smooth_rules()      
 *
 *  	Description: Determine parameters of forward smoothing  
 *					 f(pholas,pDphsettar->phcur)
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					short shrif
 * 					short pholas
 *				   	short fealas
 *				   	short feacur
 *				   	short struclas
 *				   	short struccur, short feanex
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void uk_forw_smooth_rules(LPTTS_HANDLE_T phTTS, short shrif, short pholas, short fealas,
								 short feacur, short struclas, short struccur, short feanex)
{
	short                   temp;	   /* MVP MI : This variable is made local */
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	//debugforward ("Set default", pDphsettar->np);
	/* FORWARD SMOOTH: F1, F2, F3 */
	if (pDphsettar->par_type IS_FORM_FREQ)
	{
		/* 0. Use default values for obst-obst transition */
		if ((feacur & FSONOR) IS_PLUS)
		{
			if ((feacur & FSONCON) IS_MINUS)
			{
				pDphsettar->durtran = NF45MS;
				if ((fealas & FSONCON) IS_PLUS)
				{
					/* 1. Soncon-vowel transition, use 25-75% rule */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarlas) >> 1;
					/* Make F1 discontinuous for light /l/ */
					if ((pholas == UKP_LL) && (pDphsettar->np == &PF1))
					{
						pDphsettar->bouval += 80;
					}
					/* Make F3 & F2 transitions slower out of /r/ */
					if ((pholas == UKP_R) && (pDphsettar->np != &PF1))
					{
						pDphsettar->durtran = NF70MS;
					}
				}
				else
				{
					/* 2. Vowel-[vowel/h] transition */
					/* Preceeding seg has strong influence on [h] init val */
					if (pDphsettar->phcur == UKP_HX)
					{
						pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarlas) >> 1;
					}
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
		/* Bound value = previous target if current phone is sil */
		/* eab not if it's the first sil EAB 4/apr/95 I've fixed this once before */
		if (pDphsettar->phcur == GEN_SIL)
		{
			/*Eab 7/31/96 changed > 2 to >1 for ending sil*/
			if (pDph_t->nphone > 1)
			{
				pDphsettar->bouval = pDphsettar->np->tarlas;
			}
			else
			{
				pDphsettar->bouval = pDphsettar->np->tarnex;
			}
            pDphsettar->durtran = pDph_t->durfon;
		}
		else
		{
			/* 5. pholas=obst, pDphsettar->phcur=sonor transition */
			if (setloc (phTTS, (short)(pDph_t->nphone - 1), pDph_t->nphone, 'i', (short)(pDph_t->nphone - 2), feanex))
			{
				//debugforward (" Use locus,percent", pDphsettar->np);
			}
			/* 6. pholas=sonor, pDphsettar->phcur=obst transition */
			if (setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone - 1), 'f', (short)(pDph_t->nphone + 1),feanex))
			{
				//debugforward (" Use locus,percent", pDphsettar->np);
			}
			/* Dummy vowel for final plosive release into silence is too */
			/* short for an extensive formant transition, make tran less */
			if ((struccur & FDUMMY_VOWEL) IS_PLUS)
			{
				/* OUT                      xx += ((pDphsettar->bouval - pDphsettar->np->tarend) >> 1); pDphsettar->np->tarend += xx;   (DOESN'T
				 * WORK) END OUT */
			}
			/* F1 raised at onset of voiceless plosive release */
			if (((fealas & FPLOSV) IS_PLUS)
				&& ((fealas & FVOICD) IS_MINUS))
			{
				if (pDphsettar->np == &PF1)
					pDphsettar->bouval += 100;
			}
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
#if (defined  FAKE_HLSYN || !(defined HLSYN) )
				/* Lower F2 & F3 of [n] nasal murmur after front vowels */
				else if (((pDphsettar->phcur == UKP_N) || (pDphsettar->phcur == UKP_EN))
						 && (endtyp(pholas) == 1))
				{
					if (pDphsettar->np == &PF2)
					{
						pDphsettar->bouval -= 100;
						if ((uk_place[pholas & PVALUE] & F2BACKF) IS_PLUS)
						{
							pDphsettar->bouval -= 100;
						}
					}
					if (pDphsettar->np == &PF3)
						pDphsettar->bouval -= 100;;
				}
				/* Lower F2 of [m] nasal murmur near [i,e] */
				else if ((pDphsettar->np == &PF2) && (pDphsettar->phcur == UKP_M)
						 && ((uk_place[pholas & PVALUE] & F2BACKF) IS_PLUS))
				{
					pDphsettar->bouval -= 150;
				}
#endif
			}
		}
		/* Shrink transition dur inside sonor if sonor short */
		if (((feacur & FOBST) IS_MINUS)
			&& (endtyp(pholas) != OBSTRUENT)   /* Unless prev seg is obst */
			&& (pDphsettar->durtran > 0))
		{
			//pDph_t->arg1 = pDphsettar->durtran;
			//pDph_t->arg2 = shrif;
			pDphsettar->durtran = mlsh1 (pDphsettar->durtran, shrif) + 1;
		}
	}
	/* FORWARD SMOOTH:  FN */
	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ)
	{
		pDphsettar->durtran = 0;
		if (((fealas & FNASAL) IS_PLUS)
			&& ((feacur & FNASAL) IS_MINUS))
		{
			pDphsettar->bouval = NASAL_ZERO_BOUNDARY;
			pDphsettar->durtran = NF80MS;
		}
	}
	/* FORWARD SMOOTH:  B1, B2, B3 */
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
		/* Treat boundary with silence */
		if (pholas == GEN_SIL)
		{
			pDphsettar->bouval = pDphsettar->np->tarcur + ((&PB3 - pDphsettar->np) * 50);
			pDphsettar->durtran = NF50MS;
		}
		else if (pDphsettar->phcur == GEN_SIL)
		{
			pDphsettar->bouval = pDphsettar->np->tarlas + ((&PB3 - pDphsettar->np) * 50);
			if (((phone_feature( pDph_t,pDph_t->allophons[pDph_t->nphone - 2]) & FVOICD) IS_MINUS)
				&& ((struclas & FDUMMY_VOWEL) IS_PLUS)
				&& (pDphsettar->np == &PB1))
			{
				pDphsettar->bouval = 260;	/* Kluge to avoid discontinutiy */
			}
			pDphsettar->durtran = NF50MS;
		}



		/* BW1 widen, to nasalize transition out of previous nasal */
		if ((fealas & FNASAL) IS_PLUS)
		{
			pDphsettar->bouval = pDphsettar->np->tarcur;	/* B2,B3 not influ by nasal */
			/* Except F2 of [n], which is wider in a non-front vowel */
			if ((pDphsettar->np == &PB2) && ((pholas == UKP_N) || (pholas == UKP_EN))
				&& (begtyp(pDphsettar->phcur) != 1))
			{
				pDphsettar->bouval += 60;
				pDphsettar->durtran = NF60MS;
			}
			if (pDphsettar->np == &PB1)
			{
				pDphsettar->durtran = NF100MS;
				pDphsettar->bouval += 70;
			}
		}
		/* Nasals have constant bandwidths at target values */
		if ((feacur & FNASAL) IS_PLUS)
		{
			pDphsettar->durtran = 0;
			//debugforward (" Nasal has const par val", pDphsettar->np);
		}
	}
	/* FORWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB */

	/* Default pDphsettar->bouval is average of tarcur & tarend, default tc is 30 ms */
	else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP)
			 || (pDphsettar->par_type IS_AV_OR_AH))
	{

		/* See if onset, i.e. plosive or large source intensity increase */
		temp = pDphsettar->np->tarcur - 10;
		if ((pDphsettar->bouval < temp) || ((fealas & FPLOSV) IS_PLUS)
			|| (pholas == UKP_JH))
		{
			pDphsettar->bouval = temp;
			if ((feacur & FOBST) IS_MINUS)
				pDphsettar->durtran = NF20MS;
			/* Voicing is special */
			if (pDphsettar->np == &PAV)
			{
				/* Gradual buildup of voicing */
				if (pholas == GEN_SIL)
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
					pDphsettar->bouval = pDphsettar->np->tarcur - 5;
				}
			}
			//debugforward (" Onset", pDphsettar->np);
		}
		/* If last nasal, and source amp increased, abrupt onset */
		if (((fealas & FNASAL) IS_PLUS)
			&& ((feacur & FVOICD) IS_PLUS))
		{
			pDphsettar->durtran = 0;
			//debugforward (" Onset from nasal", pDphsettar->np);
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
			if (pDphsettar->phcur == GEN_SIL)
				pDphsettar->durtran = NF70MS;
			/* Except voicing offset is abrupt */
			if (pDphsettar->np == &PAV)
				pDphsettar->durtran = 0;
			//debugforward (" Offset", pDphsettar->np);
		}
		/* Buildup A3 gradually in [C, J] */
		if (pDphsettar->np == &PA3)
		{
			if ((pDphsettar->phcur == UKP_CH) || (pDphsettar->phcur == UKP_JH))
			{
				pDphsettar->durtran = pDph_t->durfon - NF15MS;
				pDphsettar->bouval = pDphsettar->np->tarcur - 30;
				//debugforward (" CH/JH rule", pDphsettar->np);
			}
		}
		/* Offset of a vowel into voiceless open vocal tract is breathy */
		if (pDphsettar->np == &PAP)
		{
			if ((pDphsettar->phcur == GEN_SIL) || (pDphsettar->phcur == UKP_F) || (pDphsettar->phcur == UKP_TH)
				|| (pDphsettar->phcur == UKP_S) || (pDphsettar->phcur == UKP_SH))
			{
				if (((fealas & FVOICD) IS_PLUS)
					&& ((fealas & FOBST) IS_MINUS))
				{
					if (pDphsettar->phcur == GEN_SIL)
					{
						pDphsettar->bouval = 52;
						pDphsettar->durtran = NF80MS;
					}
					else
					{
						pDphsettar->bouval = 48;
						pDphsettar->durtran = NF45MS;
					}
				}
			}
		}
		/* FORWARD SMOOTH:  TLT */

		/* Tilt parameter jumps to target values near stops and silence */
		if (pDphsettar->np == &PTILT)
		{
			pDphsettar->durtran = NF25MS;
			if (pholas == GEN_SIL)
			{
				pDphsettar->bouval = pDphsettar->np->tarcur;
			}
			if (pDphsettar->phcur == GEN_SIL)
			{
				/* Reach into par buffer to get actual previous value */
				pDphsettar->bouval = pDph_t->parstochip[OUT_TLT];
			}
			if (((fealas & FSTOP) IS_PLUS)
				|| ((feacur & FSTOP) IS_PLUS))
			{
				pDphsettar->durtran = 0;
			}
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


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 * I. Determine parameters of backward smoothing  f(pDphsettar->phur,pDphsettar->phonex)
 * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 *
 *      Function Name: back_smooth_rules()      
 *
 *  	Description: 
 *				   	 
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 * 					short shrib
 *					short feacur
 *				   	short feanex
 *				   	short strucn
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void uk_back_smooth_rules(LPTTS_HANDLE_T phTTS, short shrib, short feacur,
				   			   short feanex, short strucnex)
{
	short                   temp;	   /* MVP MI : This varaible is made local */
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	//debugbackward ("Set default", pDphsettar->np);

	/* BACKWARD SMOOTH:  F1, F2, F3 */
	if (pDphsettar->par_type IS_FORM_FREQ)
	{
		/* 0. Use default values for obst-obst transition */
		if ((feacur & FSONOR) IS_PLUS)
		{
			pDphsettar->durtran = NF45MS;
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
					if ((pDphsettar->phonex == UKP_LL) && (pDphsettar->np == &PF1))
					{
						pDphsettar->bouval += 80;
					}
				}
				else
				{
					/* 2. Vowel-[vowel/h] transition */
					/* Following [h] has little influence on pDphsettar->bouval */
					if (pDphsettar->phonex == UKP_HX)
					{
						pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarend) >> 1;
					}
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
		if (pDphsettar->phonex == GEN_SIL)
		{
			pDphsettar->durtran = 0;
		}
		else
		{
			/* 5. pDphsettar->phcur=sonor, pDphsettar->phonex=obst transition */
			if (setloc (phTTS, (short)(pDph_t->nphone + 1), pDph_t->nphone, 'f', (short)(pDph_t->nphone + 2),feanex)) // NAL warning removal
			{
				//debugbackward (" Use locus,percent", pDphsettar->np);
			}
			/* 6. pDphsettar->phcur=obst, pDphsettar->phonex=sonor transition */
			if (setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone + 1), 'i', (short)(pDph_t->nphone - 1),feanex)) // NAL warning removal
			{
				//debugbackward (" Use locus,percent", pDphsettar->np);
			}
			/* Transitions slow inside obstruents */
			if ((feacur & FOBST) IS_PLUS)
			{
				pDphsettar->durtran = NF30MS;
				if (pDphsettar->np == &PF1)
					pDphsettar->durtran = NF20MS;
				/* Transitions take all of plosive duration */
				if ((feacur & FPLOSV) IS_PLUS)
				{
					pDphsettar->durtran = pDph_t->durfon;
					if ((pDphsettar->np == &PF1) && ((feacur & FVOICD) IS_MINUS))
					{
						pDphsettar->bouval += 100;
					}
				}
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
#if (defined  FAKE_HLSYN || !(defined HLSYN) )
				/* Lower F2 & F3 of [n] nasal murmur before front vowels */
				else if (((pDphsettar->phcur == UKP_N) || (pDphsettar->phcur == UKP_EN))
						 && (begtyp(pDphsettar->phonex) == 1))
				{
					if (pDphsettar->np == &PF2)
					{
						pDphsettar->bouval -= 100;
						if ((uk_place[pDphsettar->phonex & PVALUE] & F2BACKI) IS_PLUS)
						{
							pDphsettar->bouval -= 100;
						}
					}
					if (pDphsettar->np == &PF3)
						pDphsettar->bouval -= 100;
				}
				/* Lower F2 of [m] murmur near [i,y,yu,ir] */
				else if ((pDphsettar->np == &PF2) && (pDphsettar->phcur == UKP_M)
						 && ((uk_place[pDphsettar->phonex & PVALUE] & F2BACKI) IS_PLUS))
				{
					pDphsettar->bouval -= 150;
				}
#endif
			}
		}
		/* Shrink tran dur inside sonorant if sonorant short */
		if (((feacur & FOBST) IS_MINUS)
			&& (begtyp(pDphsettar->phonex) != 4)	/* Unless next seg is obst */
			&& (pDphsettar->durtran > 0))
		{
			//pDph_t->arg1 = pDphsettar->durtran;
			//pDph_t->arg2 = shrib;
			pDphsettar->durtran = mlsh1 (pDphsettar->durtran, shrib) + 1;
		}
	}
	/* BACKWARD SMOOTH:  FN */
	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ)
	{
		pDphsettar->durtran = 0;
		/* Nasalization cue: place zero between F1 and FP */
		if (((feanex & FNASAL) IS_PLUS)
			&& ((feacur & FNASAL) IS_MINUS))
		{
			pDphsettar->bouval = NASAL_ZERO_BOUNDARY;
			pDphsettar->durtran = NF80MS;
			if (pDphsettar->phonex == UKP_EN)
				pDphsettar->durtran = NF130MS;
		}
	}
	/* BACKWARD SMOOTH:  B1, B2, B3 */
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
		/* Treat boundary with silence */
		/* OUT ??? */
		if (pDphsettar->phonex == GEN_SIL)
		{
			pDphsettar->bouval = pDphsettar->np->tarend + ((&PB3 - pDphsettar->np) * 50);
			pDphsettar->durtran = NF50MS;
		}
		else if (pDphsettar->phcur == GEN_SIL)
		{
			pDphsettar->bouval = pDphsettar->np->tarnex + ((&PB3 - pDphsettar->np) * 50);
			pDphsettar->durtran = NF50MS;
		}
		/* BW1 widen, to nasalize transition into next nasal */
		if ((feanex & FNASAL) IS_PLUS)
		{
			pDphsettar->bouval = pDphsettar->np->tarend;
			/* Except F2 of [n], which is wider before a non-front vowel */
			if ((pDphsettar->np == &PB2) && ((pDphsettar->phonex == UKP_N) || (pDphsettar->phonex == UKP_EN))
				&& (endtyp(pDphsettar->phcur) != 1))
			{
				pDphsettar->bouval += 60;
				pDphsettar->durtran = NF60MS;
			}
			if (pDphsettar->np == &PB1)
			{
				pDphsettar->durtran = NF100MS;
				pDphsettar->bouval += 100;
			}
		}
		/* Nasals have constant bandwidths at target values */
		if ((feacur & FNASAL) IS_PLUS)
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Nasal has const. par val", pDphsettar->np);
		}
	}
	/* BACKWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB */
	else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP)
			 || (pDphsettar->par_type IS_AV_OR_AH))
	{
		/* See if onset, i.e. source intensity increasing */
		temp = pDphsettar->np->tarnex - 10;
		if (pDphsettar->bouval < temp)
		{
			pDphsettar->bouval = temp;
			/* Onset of an init fricative or /h/ is very gradual */
			if (pDphsettar->phcur == GEN_SIL)
			{
				pDphsettar->durtran = NF70MS;
			}
			//debugbackward (" Onset", pDphsettar->np);
		}
		/* Voicing is special:  onset is abrupt, except if a voiced fric */
		if ((pDphsettar->np == &PAV) && (pDphsettar->bouval < pDphsettar->np->tarnex)
			&& (pDphsettar->phcur != UKP_V) && (pDphsettar->phcur != UKP_DH)
			&& (pDphsettar->phcur != UKP_JH) && (pDphsettar->phcur != UKP_ZH) && (pDphsettar->phcur != UKP_Z))
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Make next onset abrupt", pDphsettar->np);
			/* Voicebar dies out in a voiced plosive */
			if (((feacur & FPLOSV) IS_PLUS) || (pDphsettar->phcur == UKP_CH))
			{
				if ((feacur & FVOICD) IS_PLUS)
				{
					pDphsettar->bouval = pDphsettar->np->tarend - 3;
					pDphsettar->durtran = NF45MS;
					//debugbackward (" Voicebar dies out", pDphsettar->np);
				}
				/* Do not allow prevoicing in a voiceless plosive */
				else
				{
					pDphsettar->bouval = 0;
				}
				goto endbsmo;
			}
		}
		/* If next nasal, & curr phone is voiced, set AV const */
		if (((feanex & FNASAL) IS_PLUS)
			&& ((feacur & FVOICD) IS_PLUS))
		{
			pDphsettar->durtran = 0;
			//debugforward (" AV const in voiced to  nasal", pDphsettar->np);
		}
		/* If curr phone nasal, and next is voiced non-obst, AV const */
		if ((feacur & FNASAL) IS_PLUS)
		{
			if (((feanex & FVOICD) IS_PLUS)
				&& ((feanex & FOBST) IS_MINUS)
				&& ((strucnex & FDUMMY_VOWEL) IS_MINUS))
			{
				pDphsettar->durtran = 0;
				//debugbackward (" Make murmur const AV", pDphsettar->np);
			}
			else
			{
				pDphsettar->durtran = NF40MS;
			}
		}
		/* See if offset, i.e. source intensity decreasing */
		temp = pDphsettar->np->tarend - 10;
		/* Plosive burst does not get attenuated during offset */
		if (pDphsettar->phcur >= UKP_P)
		{
			pDphsettar->durtran = NF15MS;
			if (pDphsettar->phcur < UKP_CH)
			{
				temp = pDphsettar->np->tarend;
			}
		}
		if (pDphsettar->bouval < temp)
		{							   /* Or does it ??? */
			pDphsettar->bouval = temp - 3;
			pDphsettar->durtran = NF20MS;
		}
		/* Voicing amp falls gradually at end of phrase */
		/* (Source sudden offset, or next seg is a dummy vowel) */
		if (pDphsettar->np == &PAV)
		{
			if ((pDphsettar->bouval < temp) || ((temp > 0)
												&& (pDphsettar->np == &PAV) && ((strucnex & FDUMMY_VOWEL) IS_PLUS)))
			{
				pDphsettar->bouval = temp + 3;
				if ((pDphsettar->phonex == GEN_SIL)
					|| ((strucnex & FDUMMY_VOWEL) IS_PLUS))
				{
					pDphsettar->durtran = NF75MS;
				}
			}
			else if (pDphsettar->np == &PAP)
				pDphsettar->bouval = PAP.tarend - 6;
			//debugbackward (" Offset to noise", pDphsettar->np);
		}
		/* No smoothing of source amps if next segment has burst */
		if ((pDphsettar->phonex >= UKP_P)
			&& (((feacur & FNASAL) IS_MINUS) || (pDphsettar->np != &PAV)))
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Stop closure next", pDphsettar->np);
		}
		/* Onset of a vowel from voiceless open vocal tract is breathy */
		if (pDphsettar->np == &PAP)
		{
			if (
			/* OUT                    (pDphsettar->phcur == GEN_SIL) ||                         END OUT */
				   (pDphsettar->phcur == UKP_F) || (pDphsettar->phcur == UKP_TH)
				   || (pDphsettar->phcur == UKP_S) || (pDphsettar->phcur == UKP_SH))
			{
				if (((feanex & FVOICD) IS_PLUS)
					&& ((feanex & FOBST) IS_MINUS))
				{
					pDphsettar->bouval = 52;
					pDphsettar->durtran = NF40MS;
				}
			}
			/* Offset of a vowel into silence is breathy */
			if (((feacur & FSYLL) IS_PLUS)
				&& (pDphsettar->phonex == GEN_SIL))
			{
				pDphsettar->bouval = 52;
				pDphsettar->durtran = NF130MS;
			}
		}
		/* BACKWARD SMOOTH:  TLT */

		/* Tilt parameter jumps to target values near stops and silence */
		if (pDphsettar->np == &PTILT)
		{
			pDphsettar->durtran = NF25MS;
			if (pDphsettar->phonex == GEN_SIL)
			{
				pDphsettar->bouval = pDphsettar->np->tarend;
			}
			if (pDphsettar->phcur == GEN_SIL)
			{
				pDphsettar->bouval = pDphsettar->np->tarnex;
			}
			if (((feanex & FSTOP) IS_PLUS)
				|| ((feacur & FSTOP) IS_PLUS))
			{
				pDphsettar->durtran = 0;
			}
			/* Long breathy offset into silence */
			if (((feacur & FVOICD) IS_PLUS)
				&& ((feacur & FNASAL) IS_MINUS))
			{
				if (pDphsettar->phonex == GEN_SIL)
				{
					pDphsettar->bouval = 15;
					pDphsettar->durtran = NF130MS;
				}
			}
		}
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


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * J.              S P E C I A L - R U L E S                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *      Function Name:       
 *
 *  	Description: special_rules()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS
 *					short fealas
 *			   		short feacur
 *			   		short feanex
 *			   		short struclm2
 *			   		short struccur
 *			   		short pholas
 *			   		short struclas
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void uk_special_rules (LPTTS_HANDLE_T phTTS, short fealas, short feacur, short feanex,
							  short struclm2, short struccur, short pholas, short struclas)
{
	short                   bdur, vot; /* MVP made as a local variable */
	short                   closure_dur;	/* MVP made as a local variable */
	

	PDPH_T                  pDph_t = phTTS->pPHThreadData;
#ifdef TYPING_MODE
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
#endif
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	/* SPECIAL RULE 1: Burst duration for plosives and affricates             */

	bdur = burdr(pDphsettar->phcur);   /* Look up inher. burst dur in msec in table */

	if ((feacur & FBURST) IS_PLUS)
	{
		bdur = mstofr (bdur);		   /* Convert to frames         */

		/* Don't release burst in homorganic plosiv-nasal & plos-plos sequence */
		/* bats 878 EAB 4/2/99*/


/* Dennis had a rule that said in homorganic (meaning
in this case the same place of articulation) nasal plosives
and plosive plosive one should not release the burst of the 
initial plosive. This is incorrect place because a nasal
doesn't have a place of articulation so it can never match 
plus the homorganic I don't believe really means exact same 
place of articulation. A plosive followed by a nasal will 
not be realeased-period. Secondly, a plosive that has 
similiar place of artculation should follow the rule.
i=(i.e an aveloar or a dental are equivalent)
	So, I added new masks to group places into "homorganic
groupings"

*/
#if (defined  FAKE_HLSYN || !(defined HLSYN) )
		if ((feanex & (FNASAL | FPLOSV)) IS_PLUS)
		{
			//EAB Don't release a plosive followed by a nasal period
			// The former comment is not quite correct becaue the place of articulation
			//between a nasal and a plosive can't be the same becuase the nasal's
			// doesn't have a place of articulation 2/26/99
			if((feacur & FPLOSV ) IS_PLUS)
				bdur=0;
			if ((uk_place[pDphsettar->phcur & PVALUE] | MASKFRONT )== (uk_place[pDphsettar->phonex & PVALUE] | MASKFRONT ))
			{		/* yes they're both done up front */
				bdur = 0;
			}
			else if ((uk_place[pDphsettar->phcur & PVALUE] )== (uk_place[pDphsettar->phonex & PVALUE] ))
			{		
				bdur = 0;
			}
		
		}
#endif
		if (bdur > 1)
		{
			if (((feacur & FPLOSV) IS_PLUS)
				&& ((feanex & FOBST) IS_PLUS))
			{
				bdur--;				   /* Shorten burst before obst by 6 ms */
			}
			else if (pDph_t->durfon < NF50MS)
			{
				bdur--;				   /* Shorten burst if closure short */
			}
		}

		closure_dur = pDph_t->durfon - bdur;

		if ((pDphsettar->phcur == UKP_CH) || (pDphsettar->phcur == UKP_JH))
		{
			if (closure_dur > NF80MS)
				closure_dur = NF80MS;
		}

		for (pDphsettar->np = &PA2; pDphsettar->np <= &PAB; pDphsettar->np++)
		{							   /* All fric gains to */
				if(uk_place[pDphsettar->phcur & PVALUE] & FLABIAL)
			{
				PAREAL.tspesh=closure_dur;
				PAREAB.tspesh =0;
				PTONGUEBODY.tspesh=0;
			}
			else if(uk_place[pDphsettar->phcur & PVALUE] & BLADEAFFECTED )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=closure_dur;
				PTONGUEBODY.tspesh=0;
			}
				else if(uk_place[pDphsettar->phcur & PVALUE] & FVELAR )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=0;
				PTONGUEBODY.tspesh=closure_dur;
			}
			pDphsettar->np->tspesh = closure_dur;	/* zero during closur */
			pDphsettar->np->pspesh = 0;
		}
	}
	/* SPECIAL RULE 2: Voice onset time for aspirated plosives */

	vot = 0;
	if ((((fealas & FPLOSV) IS_PLUS)
		 && ((fealas & FVOICD) IS_MINUS)
		 && ((feacur & FSONOR) IS_PLUS ))) 
	{
		PAP.pspesh = 52;			   /* Amplitude of aspiration in dB     */
		if (begtyp(pDphsettar->phcur) != 1)
		{
			PAP.pspesh = 54;		   /* Stronger asp before +back */
		}
		PAV.pspesh = 0;				   /* Amplitude of voicing during aspir */


		vot = NF40MS;				   /* Asp dur for /p,t,k/ before stressed sonor */
		if ((struccur & FSTRESS_1) IS_MINUS)
		{
			vot = NF25MS;			   /* Vot shorter if vowel not stressed */
			PAP.pspesh -= 3;
		}
		if (((feacur & FSONCON) IS_PLUS) || (pDphsettar->phcur == UKP_RR))
		{
			PAP.pspesh += 3;		   /* Aspiration stronger in sonor cons */
		}

		/* eab 2/6/976 Found code that was causing after Murhty port. Vlaue of pholm2
		was not being retained- substituted global variables that already exsist
		after release the old and I think vestigal variables need to be removed
		this problem affect all languages but in fact the code didn't exist in German
		at all but was needed don't know is struclm2 is working either*/

		if ( phone_feature( pDph_t,pDph_t->allophons[pDph_t->nphone -2]) == (FOBST+FCONSON ))          
		{
			if ((struclm2 & FBOUNDARY) IS_MINUS )
			{
				vot = NF15MS;	   
			}
		}
		else if (((feacur & FSYLL) IS_MINUS))
		{
			vot += NF20MS;			   /* Vot longer in a sonorant consonant */
		}
		if (vot >= pDph_t->durfon)
		{
			vot = pDph_t->durfon - 1;
			PAP.pspesh=0;
		}
		/* Vot cannot exceed 1/2 duration of a stressed vowel */
		if ((vot > (pDph_t->durfon >> 1))
			&& ((feacur & FSYLL) IS_PLUS)
			&& ((struccur & FSTRESS_1) IS_PLUS))
		{
			vot = pDph_t->durfon >> 1;
		}
		
		/* eab in fast mode we simply when to model a much reduced faster
		release--no time to build up large pressures*/
#ifdef TYPING_MODE
		if(phTTS->bInTypingMode == TRUE || pKsd_t->sprate >300)
		{
			
			vot=vot>>2;
			if(vot == 0)
				vot=1;
	
		PAV.pspesh +=20;
		PAP.pspesh -=5;
		}
#endif
		PAV.tspesh = vot;
		PAP.tspesh = vot;

		/* Widen 1st and 2nd formant bws when glottis open for aspir */
		PB1.tspesh = vot;
		PB2.tspesh = vot;
		PB1.pspesh = PB1.tarcur + 250;
		PB2.pspesh = PB2.tarcur + 70;
	}
	/* SPECIAL RULE 3: Create realistic voicebar, avoid pops and clicks */
	/* Amp of voicebar set here, AV target in table invalid */
	/* Set AV=0 for last 12.8 ms, let AV die out, thus avoid click */
	/* Set to under 250 to signal voicebar */

	/* Problem: spectrum has too much F4 if f2,3 are high, as in [i] */
	if (((feacur & FBURST) IS_PLUS)
		&& ((feacur & FVOICD) IS_PLUS)
		&& ((fealas & FVOICD) IS_PLUS)
		&& ((feanex & FVOICD) IS_MINUS)		/* Voicebar only if next -V */
		&& (pDphsettar->phcur != UKP_TX))
	{
		PAV.tspesh = pDph_t->durfon - NF15MS;
		PB1.tspesh = pDph_t->durfon;
		PB2.tspesh = pDph_t->durfon;
		PB3.tspesh = pDph_t->durfon;
		PAV.pspesh = 63;			   /* Large since low-pass TILT attenuates it */
		/* eab temporary hack to fix cage. JH had no aspiration to much av
		This code really needs to be rewritten Part of BATS 543 fix*/
		PB1.pspesh = 1000;
		PB2.pspesh = 1000;
		PB3.pspesh = 1500;
		if(pDphsettar->phcur == UKP_JH)
		{
			PAV.pspesh = 50;
			PAP.pspesh = 50;
		
			PB1.pspesh = 500;
			PB2.pspesh = 500;
			PB3.pspesh = 800;
		}
	}
}
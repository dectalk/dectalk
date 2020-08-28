/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.s
 *	  Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.
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
 *    File Name:    p_gr_st1.c
 *    Author:		Matthew Schnee
 *    Creation Date:18-Jun-1996
 *
 *    Functionality:
 *	  German specific functions from phsettar.c
 *
 ***********************************************************************
 *
 *	Rev	Who		Date		Description
 *	---	---		-----------	--------------------------------------------
 *	001	MGS		06/18/96	file created
 *	002	EDB		12/10/96	Many changes for bug fix.
 *	003	EDB		01/10/97	Fix many data.
 *	004	EAB		02/06/97	Isolated problem that was causing spa and pa to have the same VOT time.
 *	005 EDB		10/19/97	use phTTS handler to replace pDph_t
 *	006 EAB		01/17/98	Fixed MAJOR BUG in malamp lookup if the begtynex was six it reached over and
                            grabbed the wrong phoneme
	007 EAB		03/02/98	At least temporarily reduce aspiration for [ n oe ]it's too hot
	008 EAB		03/20/98	Several modifications to improve the German these are commented seperately
							and identified as improv330
 *	009 EAB		04/04/98	Found problem where stess was modifying aspiration aas well as av because it was in
 *							the wrong place.
 *	010 EAB		04/10/98	Removed WINprint from fatal error exit
 *	011 EAB		04/27/98	Tuned many values with Oliver for German
 *	012 GL		05/04/98	use dt_abort to replace exit(1)
 *	013 EAB		05/13/98	Added slowtalk code BATS660
 *	014 EAB		05/18/98  	BATS249 removed unused variable pholm2.
 *	015 EAB		05/20/98	BATS681  Remove unneeded code--debugforward && debugbackwards
 *	016	EAB		07/08/98	BATS 709
 *	017 EAB		08/05/98	BATS 734
 *	018 EAB					Reuduce aspiration release levels
 *	019 EAB		03/26/99	BATS 878 Fixed the burst-plosive and plosive-plosive problem 
	020 EAB		06/07/99	Modify to support Nasal value definitions
 *	021	MGS		04/13/00	Changes for integrated phoneme set 
 *	022 EAB					Modified code to be on English definitions completely fot type BATS 928
 *	023 EAB		06/28/00	Unified Phoneme Set Changes
 *	024 CAB		10/16/00	Changed copyright info and edited mistakes in comment
 *	025	MGS		12/13/00	Further optimization on gettar
 *	026	MGS		01/18/01	Removed arg1 arg2 and arg3 from calculations
 *	027 EAB		02/28/01 	lower h aspiration for H.
 *	028	EAB					Fix problem in glottal stop insertion.
 *	029 EAB		03/15/01	Part of fix for voiced unvoiced h variations
 *							other part in PH_draw  
 *	030 EAB		07/10/01	BATS 982 eab 
 *	031 CAB		07/25/01	Edited comment section
 *	032 MGS		04/17/2002	ARM7 port
 */

 
/*
 *      Function Name: gettar()      
 *
 *  	Description: Get target value (or a pointer to first value of) 
 *					 diphthong specification 
 * 					(do not compute any coarticulatory influences of adjacent phones) 
 *
 *      Arguments: PDPH_T pDph_t, short nphone_temp
 *
 *      Return Value: short
 *
 *      Comments:
 *
 */
short gr_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp)
{
	short                   phone_temp, phlas_temp, phnex_temp, tartemp=0, pphotr, begtypnex, npar;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;


	phlas_temp = get_phone(pDph_t,nphone_temp - 1);
	phone_temp = get_phone(pDph_t,nphone_temp);
	phnex_temp = get_phone(pDph_t,nphone_temp + 1);
	
	npar = pDphsettar->np - &PF1;
	if (pDphsettar->np < &PFZ)
		pphotr = (npar) * GR_TOT_ALLOPHONES;
	else
		pphotr = (npar - 1) * GR_TOT_ALLOPHONES;
	/* No table entries for PAP parameter */
	/* GETTAR:  F1, F2, F3, B1, B2, B3 */
	
	if ((pDphsettar->par_type = partyp[npar]) IS_FORM_FREQ_OR_BW)
	{
		if (phone_temp == GRP_KH) 
			//cheat in german to make it follow the formants of the 
			//previous vowel and never look forward big hammer but works good
			phone_temp = phlas_temp;

		if ((tartemp = pDph_t->p_tar[(phone_temp & PVALUE)  + pphotr]) < -1)
		{
			return (tartemp);		   
		}
		

		if (tartemp < -1)
		{
			tartemp = pDph_t->p_diph[-tartemp];
		}
			if ((npar == F1 - 1)
			&& phone_temp == GRP_KH)
//			  tartemp -= 400;
			if ((npar == F2 - 1)
			&& phone_temp == GRP_KH)
			  tartemp -= 600;

		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* (check)                                */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* Fricatives have higher F1 if preceeded by a vowel */
		if ((npar == F1 - 1)
			&& ((phone_feature( pDph_t,phone_temp) & FOBST) IS_PLUS)
			&& ((phone_feature( pDph_t,phone_temp) & FSTOP) IS_MINUS)
			&& ((phone_feature( pDph_t,phlas_temp) & FSYLL) IS_PLUS))
		{
			tartemp += 40;
		}
		/* Special rule for B2 of \n/ before non-front vowels */
		if (((phone_temp == GRP_N) || (phone_temp == GRP_EN))
			&& (npar == B2 - 1))
		{
			if (begtyp(phnex_temp) != 1)
			{
				tartemp += 60;
			}
		}
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* special rule for B3 of /N/ before /i/  ((old))         */
		/* if (((phone_temp == QQN) || (phone_temp == QQEN)       */
		/* || (phone_temp == QQNX)) && (npar == B3-1)) {  */
		/* if (((gr_place[phnex_temp] & F2BACKI) IS_PLUS)        */
		/* || ((gr_place[phlas_temp] & F2BACKF) IS_PLUS)) {      */
		/* tartemp = 1600;                    */
		/* }                          */
		/* }                              */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if ((phone_temp == GRP_N) && (npar == B3 - 1))
		{
			switch (phnex_temp)
			{
			case GRP_IH:
				tartemp = 800;

			}
			/* switch */
		}
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
	}
	/* GETTAR:  FZ */
	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ)
	{
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* introduce special german nasalized vowels                              */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */


		tartemp = NON_NASAL_ZERO;	/* Default for non-nasalized, cancel FP=280 */
		switch (phone_temp)
		{
		case GRP_AN:
		case GRP_IM:
		case GRP_UM:
		case GRP_ON:
			tartemp = 350;
			break;
		default:
			if ((phone_feature( pDph_t,phone_temp) & FNASAL) IS_PLUS)
			{
				tartemp = NASAL_ZERO_BOUNDARY; /* Value dur nasal murmur (527=max) */
			}
			break;
		}
	}
	/* GETTAR:  AV, AP */
	else if (pDphsettar->par_type IS_AV_OR_AH)
	{
		/* Rules for voicing amplitude */

		if (npar == AV - 1)
		{
			tartemp = pDph_t->p_tar[(phone_temp & PVALUE)+ pphotr];

			/* BATS 660 EAB 5/11/98*/
			if(pKsd_t->sprate <100)
				if (phone_temp == USP_Q)
					tartemp -= 30;

			/*      Dummy vowel has less intensity                                   */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
			/* voicing of german schwa if used as plosive release (adapt!)           */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

			if ((pDph_t->allofeats[nphone_temp] & FDUMMY_VOWEL) IS_PLUS)
			{
				tartemp -= 7;
			}


		/* Voiced stop devoiced if preceding seg voiceless  */
			
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* voicing of german [H] after voiced segment */
		/* Voice [H] if unstressed and preceeded by voiced seg */
		/* also applies for emphatic stress */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
			//if ((phone_temp == GRP_H)
              // 	&& ((phone_feature( pDph_t,phlas_temp) & FVOICD) IS_PLUS)
			//	&& ((pDph_t->allofeats[nphone_temp] & FSTRESS_1) IS_MINUS)
		//		&& (pDph_t->allofeats[phone_temp] & WBOUND) IS_MINUS)
		//	{
		//		tartemp = 54;
		//	}

		/*  Reduce amplitudes if unstressed 4/4/98 Found another problem the original code was in the 
		    wrong place so it effected both aspiration and av and in the right circumstances could 
			cause problems this needs to be shecked in all the langauges. 
		*/


		/*	improv330
		 *  eab 4/3/98 Modified to handle two levels of stress
		 */

		if ((pDph_t->allofeats[nphone_temp] & FSTRESS_2) IS_PLUS)
		{
			tartemp -= 1;
		}
		else if ((pDph_t->allofeats[nphone_temp] & FSTRESS) IS_MINUS)
		{
			/* 12/10/1996 EAB change from " rartemp -= 4" back to -4 per oliver */

			tartemp -= 2;
		
		}
		
		if (tartemp < 0)
			tartemp = 0;
		if(tartemp) //EAB HACK LETS FIX IT LATER HELPME
			tartemp += 5;
		}

		/* Rules for aspiration amplitude */
		else
		{
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* increase aspiration of german [H]               */
			/* if (phone_temp == H) {              */
			/* tartemp = 58;                   */
			/* if (gr_begtyp[phnex_temp] != 1) {          */
			/* tartemp = 62;   Stronger asp before +back   */
			/* }                           */
			/* }                           */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			if (phone_temp == GRP_H )
			{
				tartemp = 52;
				if (begtyp(phnex_temp) != 1)
				{
					tartemp = 55;	   /* Stronger asp before +back */
				}
				if(pDph_t->allophons[pDph_t->nphone +1] == GEN_SIL)
					tartemp -= 12;

			}
			else  /* 	improv330 eab 3/30/98 add for kh as well */
			if (phone_temp == GRP_KH )
			{
				tartemp = 42;
				if (begtyp(phnex_temp) != 1)
				{
					tartemp = 44;	   /* Stronger asp before +back */
				}
			}
			else
			{
				tartemp = 0;
			}
		}
	
		
	}
#ifndef HLSYN
	/* GETTAR:  A2, A3, A4, A5, A6, AB */
	else if (pDphsettar->par_type IS_PARALLEL_FORM_AMP)
	{
		/* If ptram >0, it is a pointer in obstruent array taram */
		if ((pDphsettar->np != &PTILT) && ((tartemp = ptram(phone_temp)) > 0))
		{
			/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* adapt to new class low in malamp, femamp            */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			
			begtypnex = begtyp(phnex_temp) -1 ;
			if (phnex_temp == GEN_SIL)
				begtypnex = endtyp(phlas_temp) -1 ;
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
							improv330 eab 3/30/98
						   old 6 == back vowel (2)
				           old 5 WAS ELIMATED WAY BACK WHEN????? SO IT SOHULD NEVER HAPPENS
						   old 4 is still a 4 a null
						   note here types are all -1 becuase c convention
						   changes array 1's to zero (original orug fortran) 
						   Modified to support comon(English definitions)BATS 928
						   EAB 5/22/00 4=5-1== beginng round
						   */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			if(begtypnex == 5)
			{
				begtypnex = 1;
			}
			/* switch */
			/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */

			tartemp += (npar - A2 + 1 + (6 * begtypnex));

			tartemp = pDph_t->p_amp[tartemp];


			/* Burst has less intensity in word final position
			Eab 4/27/98 much less so in German */

			if ((pDph_t->allofeats[nphone_temp + 1] & WBOUND) IS_PLUS)
			{
				if (tartemp >= 4)
				{
					tartemp -= 1;
				}
			}

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
			if ((phone_feature( pDph_t,phone_temp) & FNASAL) IS_PLUS)
			{
				tartemp = 6;
			}
			if (phone_temp == GEN_SIL)
			{
				tartemp = 0;
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
						|| (pDphsettar->phcur == GRP_DJ)))
				{
					tartemp = 40;	   /* Max tilt for [b,d,g] */
				}
			}

			/* Female front vowels should be tilted down slightly */
			else if ((begtyp(phone_temp) == 1) || (endtyp(phone_temp) == 1))
			{
				if (pDph_t->malfem == FEMALE)
				{
					tartemp += 10;/* 12/10/1996 EDB, was 3*/
				}
			}
			if (phone_temp == GRP_U)
			{
				tartemp =10;
			}
			/* 	improv330 eab 3/30/98 l highly tilted*/
			if (phone_temp == GRP_L)
			{
				tartemp += 8;
			}

		}
	}
#endif
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
static short gr_special_coartic (PDPH_T pDph_t, short nfon, short diphpos)
{
	/* Note: Gen coartic of 5% with adjacent segs elsewhere, so stuff here is big */
	/* This routine is only called if the current segment is diph (i.e. a vowel) */

	short                   temp, fonnex, foncur, fonlas;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	temp = 0;
	foncur = get_phone(pDph_t, nfon);
	fonnex = get_phone(pDph_t, nfon + 1);
	fonlas = get_phone(pDph_t, nfon - 1);
	

			


	/* F2 target of selected vowels */
	if (pDphsettar->np == &PF2)
	{
		/* Front vowel F2 target lowered before [L] */
		if (fonnex == GRP_L)
		{
			if ((foncur == GRP_E) && (foncur == GRP_AE) || (foncur == GRP_I)
				|| (foncur == GRP_EH)
				|| (foncur == GRP_AEH)
				|| (foncur == GRP_IH)
				)
			{
				temp = -150;
			}
			if (((foncur == GRP_AU) || (foncur == GRP_EU))
				&& (diphpos == 1))
			{
				temp = -250;
			}
			if (((foncur == GRP_AU) || (foncur == GRP_EU))
				&& (diphpos > 1))
			{
				temp = -350;

			}
		}
		/* Front vowel F2 target lowered after [W], [L] (DO ALSO FOR F3 of [W] */
		//if ((fonlas == W) || (fonlas == LL) || (fonlas == LX))
		if(fonlas == GRP_L)
		{
				if ((foncur == GRP_E) && (foncur == GRP_AE) || (foncur == GRP_I)
				|| (foncur == GRP_EH)
				|| (foncur == GRP_AEH)
				|| (foncur == GRP_IH)
				)

			{
				temp = -150;		   /* las and nex effects not cumulative */
			}
		}
		/* [UW] F2 target raised adjacent to an alveolar */
		if (foncur == GRP_UE)
		{
			if ((gr_place[fonlas & PVALUE] & FALVEL) IS_PLUS)
			{
				temp = 200;
			}
		}
		if ((foncur == GRP_UE)
			|| ((foncur == GRP_U) && (diphpos > 0)))
		{
			if ((gr_place[fonnex & PVALUE] & FALVEL) IS_PLUS)
			{
				temp += 200;
			}
		}
		/* Effects are greater for unstressed vowels */
		if ((pDph_t->allofeats[nfon] & FSTRESS) IS_MINUS)
		{
			temp += (temp >> 1);

			/* Unstressed YU has a fronted U part */
			if ((foncur == GRP_U) && (diphpos > 0))
			{
				temp = 400;
			}
		}
		/* Reduce effects for phrase-final stressed vowels */
		else if ((pDph_t->allofeats[nfon] & FBOUNDARY) >= FVPNEXT)
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



/*
 *      Function Name: forw_smooth_rules()      
 *
 *  	Description: Determine parameters of forward smoothing  
 *					 f(pholas,pDphsettar->phcur)
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short shrif, 
 *				   short pholas,
 *				   short fealas, 
 *				   short feacur, 
 *				   short struclas,
 *				   short struccur, 
 *                 short feanex
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void gr_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
				   short fealas, short feacur, short struclas,
				   short struccur, short feanex)
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
				}
				else
				{
					/* 2. Vowel-[vowel/h] transition */
					/* Preceeding seg has strong influence on [h] init val */
				}
			}
			else
			{
				/* pDphsettar->phcur is a sonorant conson */
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
			if (pDph_t->nphone >= (pDph_t->nphonetot - 2))
			{
				pDphsettar->bouval = pDphsettar->np->tarlas;
				pDphsettar->durtran = pDph_t->durfon;
			}
			else
			{
				pDphsettar->bouval = pDphsettar->np->tarnex;
				pDphsettar->durtran = pDph_t->durfon;
			}
		}
		else
		{
			/* 5. pholas=obst, pDphsettar->phcur=sonor transition */
			if (setloc (phTTS, (short)(pDph_t->nphone - 1), pDph_t->nphone, 'i', (short)(pDph_t->nphone - 2), feanex))
			{
				//debugforward (" Use locus,percent", pDphsettar->np);
			}
			/* 6. pholas=sonor, pDphsettar->phcur=obst transition */
			if (setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone - 1), 'f', (short)(pDph_t->nphone + 1), feanex))
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
#ifndef HLSYN_KEN
			/* F1 raised at onset of voiceless plosive release */
			if (((fealas & FPLOSV) IS_PLUS)
				&& ((fealas & FVOICD) IS_MINUS))
			{
				if (pDphsettar->np == &PF1)
					pDphsettar->bouval += 100;
			}
#endif
			/* Transitions modified inside obstruents */
			if ((feacur & FOBST) IS_PLUS
				&&  pDphsettar->phcur != GRP_L)
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
				/* Lower F2 & F3 of [n] nasal murmur after front vowels */
				/* Lower F2 of [m] nasal murmur near [i,e] */
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
			if ((pDphsettar->np == &PB2) && (gr_begtyp[pDphsettar->phcur] != 1))
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
			|| (pholas == GRP_DJ))
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
		}
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* gradual transition into [PF, TS, DJ, TJ, KS] of A4     */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if (pDphsettar->np == &PA4)
		{
			if (pDphsettar->phcur >= GRP_PF)
			{
				pDphsettar->durtran = pDph_t->durfon - NF15MS;
				pDphsettar->bouval = pDphsettar->np->tarcur - 40;

			}
		}
		/* Offset of a vowel into voiceless open vocal tract is breathy */
		if (pDphsettar->np == &PAP)
		{
			if ((pDphsettar->phcur == GEN_SIL))
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

/*
 *      Function Name: back_smooth_rules()      
 *
 *  	Description: Determine parameters of backward smoothing  
 *					 f(pDphsettar->phcur,pDphsettar->phonex) 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short shrib,
 *				   short feacur,
 *				   short feanex, 
 *				   short strucnex
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
static void gr_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
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
					
				}
				else
				{
					/* 2. Vowel-[vowel/h] transition */
					/* Following [h] has little influence on pDphsettar->bouval */
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
			if (setloc (phTTS, (short)(pDph_t->nphone + 1), pDph_t->nphone, 'f', (short)(pDph_t->nphone + 2), feanex))
			{
				//debugbackward (" Use locus,percent", pDphsettar->np);
			}
			/* 6. pDphsettar->phcur=obst, pDphsettar->phonex=sonor transition */
			if (setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone + 1), 'i', (short)(pDph_t->nphone - 1), feanex))
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
#ifndef HLSYN_KEN
					if ((pDphsettar->np == &PF1) && ((feacur & FVOICD) IS_MINUS))
					{
						pDphsettar->bouval += 100;
					}
#endif
				}
			}
#ifndef HLSYN_KENnever
						/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* transitions out of 'L' in german DECtalk            */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			if (pDphsettar->phcur == GRP_L)
			{
				pDphsettar->durtran = NF15MS;

			}
#endif
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* fast transition from burst of a plosive to a sonorant       */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			 if ((feacur & FPLOSV) IS_PLUS
				 && pDphsettar->phcur != GRP_L)
			{
				pDphsettar->durtran = NF25MS;

			}
#ifdef NOTABELIEVER
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* following 'r' requires early adaption               */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			if (pDphsettar->np != &PF1)
			{
				if ((pDphsettar->phcur >= GRP_AH) && (pDphsettar->phcur <= GRP_UEH))
				{
					if ((pDphsettar->phonex == GRP_RR) || (pDphsettar->phonex == GRP_R))
					{
						pDphsettar->durtran = NF640MS;

					}
				}
			}
#endif
			/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
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
				/* Lower F2 of [m] murmur near [i,y,yu,ir] */
				if ((pDphsettar->np == &PF2) 
						 && ((gr_place[pDphsettar->phonex & PVALUE] & F2BACKI) IS_PLUS))
				{
					pDphsettar->bouval -= 150;
				}
#endif
			}
		}
		/* Shrink tran dur inside sonorant if sonorant short */
		if (((feacur & FOBST) IS_MINUS)
			&& (gr_begtyp[pDphsettar->phonex] != 4)	/* Unless next seg is obst */
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
			if ((pDphsettar->np == &PB2) && (endtyp(pDphsettar->phcur) != 1))
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
		if ((pDphsettar->np == &PAV) && (pDphsettar->bouval < pDphsettar->np->tarnex))
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Make next onset abrupt", pDphsettar->np);
			/* Voicebar dies out in a voiced plosive */
			if (((feacur & FPLOSV) IS_PLUS))
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
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* introduce german plosives, special treatments for affricates   */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if (pDphsettar->phcur >= GRP_P)
		{
			pDphsettar->durtran = NF15MS;
			if (pDphsettar->phcur < GRP_PF)
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
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* bursts in german DECtalk also begin with [P].          */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if ((pDphsettar->phonex >= GRP_P)
			&& (((feacur & FNASAL) IS_MINUS) || (pDphsettar->np != &PAV)))
		{
			pDphsettar->durtran = 0;
			//debugbackward (" Stop closure next", pDphsettar->np);
		}
		/* Onset of a vowel from voiceless open vocal tract is breathy */
		if (pDphsettar->np == &PAP)
		{
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

/*
 *      Function Name: special_rules()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short fealas,
 *				   short feacur, 
 *				   short feanex, 
 *				   short struclm2,
 *				   short struccur, 
 *				   short pholas, 
 *				   short struclas
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
static void gr_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
			   short feacur, short feanex, short struclm2,
			   short struccur, short pholas, short struclas)
{
	short                   bdur, vot; /* MVP made as a local variable */
	short                   closure_dur;	/* MVP made as a local variable */
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
//	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	/* SPECIAL RULE 1: Burst duration for plosives and affricates             */

	bdur = burdr(pDphsettar->phcur);   /* Look up inher. burst dur in msec in table */

	if ((feacur & FBURST) IS_PLUS)
	{
		bdur = mstofr (bdur);		   /* Convert to frames         */

		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* Don't release burst in homorganic plosiv-nasal & plos-plos */
		/* sequence. (but only for plosives)              */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

		
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
groupings" */
#if (defined  FAKE_HLSYN || !(defined HLSYN) )
		if ((feanex & (FNASAL | FPLOSV)) IS_PLUS)
		{
			//EAB Don't release a plosive followed by a nasal period
			// The former comment is not quite correct becaue the place of articulation
			//between a nasal and a plosive can't be the same becuase the nasal's
			// doesn't have a place of articulation 2/26/99
		
			if ((gr_place[pDphsettar->phcur & PVALUE] | MASKFRONT )== (gr_place[pDphsettar->phonex & PVALUE] | MASKFRONT ))
			{		/* yes they're both done up front */
				bdur = 0;
			}
			else if (gr_place[pDphsettar->phcur & PVALUE]  == gr_place[pDphsettar->phonex & PVALUE] )
			{		/* yes they're both done up front */
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

		for (pDphsettar->np = &PA2; pDphsettar->np <= &PAB; pDphsettar->np++)
		{							   /* All fric gains to */

				if(gr_place[pDphsettar->phcur & PVALUE] & FLABIAL)
			{
				PAREAL.tspesh=closure_dur;
				PAREAB.tspesh =0;
				PTONGUEBODY.tspesh=0;
			}
			else if(gr_place[pDphsettar->phcur & PVALUE] & BLADEAFFECTED )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=closure_dur;
				PTONGUEBODY.tspesh=0;
			}
				else if(gr_place[pDphsettar->phcur & PVALUE] & FVELAR )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=0;
				PTONGUEBODY.tspesh=closure_dur;
			}
			pDphsettar->np->tspesh = closure_dur;	/* zero during closur */
			pDphsettar->np->pspesh = 0;


			
//Set it once per loop whne PAB
			if(pDphsettar->np == &PAB)
			{
			if(gr_place[pDphsettar->phcur & PVALUE] & FLABIAL)
			{
				PAREAL.tspesh=closure_dur;
				PAREAB.tspesh =0;
				PTONGUEBODY.tspesh=0;
			}
			else if(gr_place[pDphsettar->phcur & PVALUE] & BLADEAFFECTED )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=closure_dur;
				PTONGUEBODY.tspesh=0;
			}
				else if(gr_place[pDphsettar->phcur & PVALUE] & FVELAR )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=0;
				PTONGUEBODY.tspesh=closure_dur;
			}
		}
		} // if np == &pab
		//pDph_t->in_closure =1;
		//pDph_t->in_release =0;
	} //if burst
	

	
	/* SPECIAL RULE 2: Voice onset time for aspirated plosives */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* check if there are any problems with values set in gettar!    */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

	vot = 0;
	if ((((fealas & FPLOSV) IS_PLUS)
		 && ((fealas & FVOICD) IS_MINUS)
		 && ((feacur & FSONOR) IS_PLUS)))
	{
		/* EAB		3/2/98		At least temporarily reduce aspiration for now it's too hot*/
		PAP.pspesh = 57;			   /* Amplitude of aspiration in dB     */
		if (gr_begtyp[pDphsettar->phcur] != 1)
		{
			PAP.pspesh = 61;		   /* Stronger asp before +back */
		}
		PAV.pspesh = 0;				   /* Amplitude of voicing during aspir */

		vot = NF40MS;				   /* Asp dur for /p,t,k/ before stressed sonor */
		if ((struccur & FSTRESS_1) IS_MINUS)
		{
			vot = NF25MS;			   /* Vot shorter if vowel not stressed */
			PAP.pspesh -= 3;
		}
		if (((feacur & FSONCON) IS_PLUS) )
		{
			PAP.pspesh += 3;		   /* Aspiration stronger in sonor cons */
		}
		
		 /*eab 2/6/976 Found code that was causing after Murhty port. Vlaue of pholm2
		was not being retained- substituted global variables that already exsist
		after release the old and I think vestigal variables need to be removed
		this problem affect all languages but in fact the code didn't exist in German
		at all but was needed don't know is struclm2 is working either*/


		if ( phone_feature( pDph_t,pDph_t->allophons[pDph_t->nphone -2]) == (FOBST+FCONSON ))          
		{
//			if ((struclm2 & FBOUNDARY) IS_MINUS )
//			{
				vot = NF15MS;
//			}			
		}
		else if (((feacur & FSYLL) IS_MINUS))
		{
			vot += NF20MS;			   /* Vot longer in a sonorant consonant */
		}
	
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
		/* A dummy vowel is used to release a voiceless plosive into silence */
		if ((struccur & FDUMMY_VOWEL) IS_PLUS)
		{
			vot = pDph_t->durfon;
			PAP.pspesh -= 3;
		}
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
		&& ((feanex & FVOICD) IS_MINUS))		/* Voicebar only if next -V */
	{
		PAV.tspesh = pDph_t->durfon - NF15MS;
		PB1.tspesh = pDph_t->durfon;
		PB2.tspesh = pDph_t->durfon;
		PB3.tspesh = pDph_t->durfon;
		/* EAB BATS 709  It was way tooo hot!*/
		/* per Oliver was still too hot The voicebar should be almost non-existant 
		 BATS 734 still hot */ 
		PAV.pspesh = 10;			   /* Large since low-pass TILT attenuates it */
		PB1.pspesh = 1000;
		PB2.pspesh = 1000;
		PB3.pspesh = 1500;
	}
}

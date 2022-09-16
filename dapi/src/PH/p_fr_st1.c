/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:    p_fr_st1.c
 *    Author:		
 *    Creation Date:
 *
 *    Functionality:
 *	  French specific functions from phsettar.c
 *
 ***********************************************************************
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	--------------------------------------------
 *  001	CHJ		07/20/2000	Created from p_us_st1.c and old fphsetar.c.    
 *  002	CAB		09/21/2000	Fixed copyright info
 *	003	MGS		09/21/2000	Fixed Whitespace before #ifdefs and friends 
 *	004	MGS		12/13/2000	Further optimization on gettar
 *	005	MGS		01/18/2001	Removed arg1 arg2 and arg3 from calculations
 * 	005	CAB		01/17/2001	Merged Michel Divay changes for French
 *  006	CAB		01/24/2001	Readded optimization by MGS
 * 007 eab 3/2/01 Eab femamp should no longer be used femamp = malamp is just fine.
 */    



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* C.                      G E T T A R                              	 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
 
/*
 *      Function Name:       
 *
 *  	Description: Get target value (or a pointer to first value of diphthong specification 
 * 					 (do not compute any coarticulatory influences of adjacent phones)         
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short nphone_temp
 *
 *      Return Value: short 
 *
 *      Comments:
 *
 *	
 */
extern short Cibles_MALE[42][N_PARAM];
extern short Cibles_FEMALE[42][N_PARAM];
extern short fr_place[];

#ifdef DEBG
#define dbgphs  0
#define DEBGFIN 0
	char* phprint (short c);
#endif

short fr_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp)
{
	short                   phone_temp , phlas_temp , phnex_temp, tartemp, pphotr, begtypnex, npar;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PKSD_T                  pKsd_t = phTTS->pKernelShareData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar; 

	if( PFFR != pDph_t->last_lang)
	{
		pDph_t->last_lang = PFFR;
		if(pDph_t->malfem == MALE)
		{
			pDph_t->Cibles_Defaut=(short *)Cibles_MALE;
			pDph_t->p_locus = fr_maleloc;	   		
			pDph_t->p_diph = us_maldip;
			pDph_t->p_tar = us_maltar;
			pDph_t->p_amp = fr_malamp;
		}
		else
		{
			pDph_t->Cibles_Defaut=(short *)Cibles_FEMALE;
			pDph_t->p_locus = fr_femloc;	   	
			pDph_t->p_diph = us_femdip;
			pDph_t->p_tar = us_femtar;
			pDph_t->p_amp = fr_malamp;
		}
	} 
	
	npar = pDphsettar->np - &PF1;
	/*	if (pDphsettar->np < &PFZ)                      
		pphotr = (npar) * US_TOT_ALLOPHONES;
	else
		pphotr = (npar - 1) * US_TOT_ALLOPHONES;*/
		/* No table entries for PAP parameter */

	phlas_temp = (get_phone (pDph_t, nphone_temp - 1));
	phone_temp = (get_phone (pDph_t, nphone_temp)) ;
	phnex_temp = (get_phone (pDph_t, nphone_temp + 1));

	/* GETTAR:  F1, F2, F3, B1, B2, B3 */
	if ((pDphsettar->par_type = partyp[npar]) IS_FORM_FREQ_OR_BW)
	{	pphotr = npar + 9; /* for F1:npar:0 pphotr=9; F2, F3, FNZ, B1, B2, B3 */
		if ((tartemp = (*(pDph_t->Cibles_Defaut+((phone_temp & PVALUE)*N_PARAM)+pphotr))) == -1) 
		{
      		/* F1 de - in _vaz; use F1 of v */
      		if ((tartemp = (*(pDph_t->Cibles_Defaut+((phnex_temp & PVALUE)*N_PARAM)+pphotr))) == -1) 
			{
        		/* Tar still undefined, use tarval of second-next segment */
        		if ((tartemp = (*(pDph_t->Cibles_Defaut+(N_PARAM*(get_phone(pDph_t, nphone_temp+2) & PVALUE))+pphotr)))==-1) 
				{
          			/* Tar still undefined, use previous phone */
          			if ((tartemp = (*(pDph_t->Cibles_Defaut+(N_PARAM*(phlas_temp & PVALUE))+pphotr))) < -1) 
					{
            			/* Diphthonized seg, use last target value */
            			while (pDph_t->p_diph [-tartemp] != -1) tartemp--;
            				tartemp = pDph_t->p_diph [-tartemp-1];
          			}
          			/* If this doesn't work, use default value : _ in vaz_ ("vase.") */
          			if (tartemp == -1) tartemp = parini [npar];
        		}
      		}
    	}
    	/* Fricatives have higher F1 if preceeded by a vowel
      	   F1 in vaSe, gliSSe, biCHe 
		*/
    	if ( npar == F1-1 && phone_feature(pDph_t, phone_temp) & TFricative
        	&& phone_feature(pDph_t, phlas_temp) & TSyllabique ) 
		{
      		tartemp += 40;
    	}

    	/* Special rule for B2 of /n/ before non-front vowels
      		B2 of N in AN (ane), BON (bonne) 
  		*/
    	if ( (phone_temp) == FP_N && npar == B2-1 ) 
		{
      		if (begtyp (phnex_temp) != 1) tartemp += 60;
    	}

#ifdef NEVER_EVER_EVER_NEVER
    	/* Special rule for B3 of /n/ adjacent to high-front vowels
       	   B3 of N in NI (ni), LIN (line) 
		*/
    	if ( (phone_temp) == FP_N && npar == B3-1) 
		{
      		if ( place [(phnex_temp & PVALUE)] & F2BACKI || place [(phlas_temp & PVALUE)] & F2BACKF) 
			{
        		tartemp = 1600;
      		}
    	}
#endif
		} 
		else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ) {
    		tartemp = *(pDph_t->Cibles_Defaut+(N_PARAM*(phone_temp & PVALUE))+12);
  		}
		else if (pDphsettar->par_type IS_AV_OR_AH) 
		{
    		/* Rules for voicing amplitude */
    		if (npar == AV-1) 
			{
      			tartemp = *(pDph_t->Cibles_Defaut+(N_PARAM*(phone_temp & PVALUE))+7);

#ifdef NEVER_EVER_EVER_NEVER
      			/* Voiced stop devoiced if preceding seg voiceless AV=0 for b,d,g */
      			if ( phone_feature(pDph_t, phone_temp) & TPlosive && !(phone_feature(pDph_t, phlas_temp) & TVoisee) ) 
				{
        			tartemp = 0;
      			}
#endif

    		}
			else { /* AH */
      			tartemp = 0; /* aspiration */  
      			/*  for On, An, In, Un; added aout 95 */
      			if ( (phone_feature(pDph_t, phone_temp) & TNasale) &&  (phone_feature(pDph_t, phone_temp) & TVoyelle) ) 
				{
        			tartemp = 40;
      			}
    		}
		} 
		else if (pDphsettar->par_type IS_PARALLEL_FORM_AMP) 
		{
    		/* GETTAR:  A2, A3, A4, A5, A6, AB
       		   If ptram > 0, it is a pointer in obstruent array taram 
            */
    		if ( pDphsettar->np != &PTILT) 
			{
      			if ( (tartemp = ptram (phone_temp)) > 0 ) 
				{
        			begtypnex = begtyp (phnex_temp) - 1;
					if (phnex_temp == GEN_SIL) begtypnex = endtyp(phlas_temp)- 1;
					if (begtypnex == 4) begtypnex = 2;
        
					tartemp += (npar - A2 + 1 + (6 * begtypnex));
        			tartemp = pDph_t->p_amp [tartemp];

        			/* Burst has less intensity if FP_AP vowel next */
					/* if ( phnex_temp == FP_AP ) {
          		       if (tartemp >= 4) tartemp -= 4;
          		       if (tartemp >= 2) tartemp -= 2 ; eab 11/95 too severe I think
				       was 4 }
                    */
      		 	}
 				else { /* A2-AB for FP_R */
        			pphotr = npar - 9; /* for A2:npar:9 pphotr=0; A2 to AB */

#ifdef DEBGFIN
          			if (dbgphs) 
					{
            			printf ("phsettar.c gettar A2-AB npar : %d, pphotr %d, phone_temp %s\n",
              			npar, pphotr, phprint (phone_temp));
            			printf ("  Cibles_Defaut [(phone_temp & PVALUE)] [pphotr] %d\n",
              			*(pDph_t->Cibles_Defaut+(N_PARAM*(phone_temp & PVALUE))+pphotr);          		
					}
#endif

        			tartemp = *(pDph_t->Cibles_Defaut+(N_PARAM*(phone_temp & PVALUE))+pphotr);
      			}
    } /* if ( pDphsettar->np != &PTILT) */

    		/* GETTAR:  TLT
           	   Source spectral tilt: highly tilted for obstruents
           	   (Voiced obstruents are special case, set F1=0 to signal voicebar) 
        	*/

    		if (pDphsettar->np == &PTILT) {
      			tartemp = 0;      /* for vowel */
      			if (phone_temp == GEN_SIL) {
        			tartemp = 0;
      			}
				else if ( (phone_temp) == FP_AP ) {
         			tartemp = 20;
      			}
				else if ( phone_feature(pDph_t, phone_temp) & TPlosive || phone_feature(pDph_t, phone_temp) & TFricative ) {
        			tartemp = 7;
        			if ( ((phone_feature(pDph_t, phone_temp) & TVoisee) && (phone_feature(pDph_t, phone_temp) & TPlosive))
          				|| pDphsettar->phcur == FP_J ) {
          				tartemp = 40; /* Max tilt for [b, d, g, j] */
        			}
      			}
				else if (phone_feature(pDph_t, phone_temp) & TNasale) 
				{
        			tartemp = 6;    /* Tilt down nasal murmurs */
      			}
				else if ((pDph_t->malfem == FEMALE)
        			&& ( begtyp(phone_temp) == 1 || endtyp(phone_temp) == 1) ) 
				{
        			/* Female front vowels should be tilted down slightly */
        			tartemp += 3;
      			}
    		} /* if (pDphsettar->np == &PTILT) */
  		} /* else if parameter type */

#ifdef DEBG
    	if (dbgphs)
		{
    		// printf ("phsettar.c gettar %4s %5d\n", phprint (phone_temp), tartemp);
    	}
#endif

  	return (tartemp);
} /* gettar */
		

/*
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
 */

 static short fr_special_coartic (PDPH_T pDph_t, short nfon, short diphpos)
{	/* Note: Gen coartic of 5% with adjacent segs elsewhere, so stuff here is big */
	/* This routine is only called if the current segment is diph (i.e. a vowel) */

	short                   temp, fonnex, foncur, fonlas;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
	extern short fr_place[];
	temp = 0;
	foncur = get_phone(pDph_t, nfon);
	fonnex = get_phone(pDph_t, nfon + 1);
	fonlas = get_phone(pDph_t, nfon - 1);

	/* F3 target of selected vowels */
	if (pDphsettar->np == &PF3)
	{
		if (((phone_feature( pDph_t,foncur) & FVOWEL) IS_PLUS) && (foncur != US_RR))
		{
			if (((fonlas == FP_W) || (fonlas == FP_R) || (fonlas == FP_RX))
				|| ((fonnex == FP_W) || (fonnex == FP_R) || (fonnex == FP_RX)))
			{
				temp = -150;
			}
		}
	}
	
	/* F2 target of selected vowels */
	if (pDphsettar->np == &PF2)
	{
#ifdef MICHELE
		/* Front vowel F2 target lowered before [LX] */
		if (fonnex == FP_LX)
		{
			if (((foncur >= FP_I) && (foncur <= FP_A)) || (foncur == FP_IX))
			{
				temp = -150;
			}
			if (((foncur == FP_AY) || (foncur == FP_OY))
				&& (diphpos == 1))
			{
				temp = -250;
			}
			if (((foncur == FP_AY) || (foncur == FP_OY))
				&& (diphpos > 1))
			{
				temp = -350;

			}
		}
		/* Front vowel F2 target lowered after [W], [L] (DO ALSO FOR F3 of [W] */
		if ((fonlas == FP_W) || (fonlas == FP_LL) || (fonlas == FP_LX))
		{
			if (((foncur >= FP_IY) && (foncur <= FP_AE)) || (foncur == FP_IX))
			{
				temp = -150;		   /* las and nex effects not cumulative */
			}
		}
		/* [UW] F2 target raised adjacent to an alveolar */
		if (foncur == FP_UW)
		{
			if ((fr_place[fonlas & PVALUE] & FALVEL) IS_PLUS)
			{
				temp = 200;
			}
		}
		if ((foncur == FP_UW)
			|| ((foncur == FP_YU) && (diphpos > 0)))
		{
			if ((fr_place(fonnex  & PVALUE) & FALVEL) IS_PLUS)
			{
				temp += 200;
			}
		}
		/* Effects are greater for unstressed vowels */
		if ((pDph_t->allofeats[nfon] & FSTRESS) IS_MINUS)
		{
			temp += (temp >> 1);

			/* Unstressed YU has a fronted U part */
			if ((foncur == US_YU) && (diphpos > 0))
			{
				temp = 400;
			}
		}

		/* Reduce effects for phrase-final stressed vowels */
		else 
#endif //michele
			if ((pDph_t->allofeats[nfon] & FBOUNDARY) >= FVPNEXT)
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
 *      Arguments:	PDPH_T pDph_t, 
 *					short shrif, 
 * 					short pholas,
 *				   	short fealas, 
 *				   	short feacur, 
 *				   	short struclas,
 *				   	short struccur, short feanex
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
static void fr_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
				   			   short fealas, short feacur, short struclas,
				   			   short struccur, short feanex)
{
	short temp;
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

#ifdef DEBGFRENCH
    printf ("forw_... entry bouval %d, durtran : %d\n", 
             pDphsettar->bouval, pDphsettar->durtran);
#endif

  	if (pDphsettar->par_type IS_FORM_FREQ) {    /* FORWARD SMOOTH: F1, F2, F3 */
  		/* 0. Use default values for obst-obst transition */
    	if ( feacur & TSonore ) {        /* Vowels, semi-vowels, L and R */
      		if ( !(feacur & TLiqGli) ) {   /* a vowel */
				pDphsettar->durtran = NF45MS;
        		if (fealas & TLiqGli)
			 	{
          			/* 1. A in LA, RA (Soncon-vowel transition, use 25-75% rule) */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarlas) >> 1;
          			/* Make F1 discontinuous for L; F1 of A in LA */
          			if ( pholas == FP_L && pDphsettar->np == &PF1 ) pDphsettar->bouval += 80;
          			/* Make F3 & F2 transitions slower out of /r/ ex: A in RA */
          			if ( pholas == FP_R && pDphsettar->np != &PF1 ) pDphsettar->durtran = NF70MS;
				}
      		}
			else if ( !(fealas & TLiqGli) ) {  /* soncon : semi-vowel or L or R */
        		/* Phcur is a sonorant conson; Vowel-soncon trans, use 75-25%
           		   L in LA; R in RA; Y in SYOn; R in RYOn (not Y in RYOn) 
				*/
				pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarcur) >> 1;
				pDphsettar->durtran = NF30MS;
      		} 
			else 
			{
        		/* 4. Soncon-soncon transition ex : R in LRI, Y in LYOn or RYOn */
			   	pDphsettar->durtran = NF30MS;
			}
#ifdef DEBG
        	if (dbgphs) 
			{
        		printf ("phsettar.c forw_smooth_rules pDphsettar->bouval %d, pDphsettar->durtran %d\n",
            	pDphsettar->bouval, pDphsettar->durtran);
			}
#endif
    	} /* TSonore */

		/* Bound value = previous target if current phone is sil */
    	if (pDphsettar->phcur == GEN_SIL) 
		{
			/*Eab  8/16/00 */
			if (pDph_t->nphone > 1)
			{	pDphsettar->bouval = pDphsettar->np->tarlas;
			}
			else
			{	pDphsettar->bouval = pDphsettar->np->tarnex;
			}
            pDphsettar->durtran = pDph_t->durfon;
    } 
	else
	{
    	if ( setloc (phTTS, (short)(pDph_t->nphone-1), pDph_t->nphone, INITIAL, (short)(pDph_t->nphone-2), feanex) ) 
		{
        	/* pholas=obst, pDphsettar->phcur=sonor transition B A */
#ifdef DEBGFRENCH
          	printf ("Use locus, bouval %d, durtran : %d\n", 
                     pDphsettar->bouval, pDphsettar->durtran);
#endif
      	}
 		else if ( setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone-1), FINAL, 
        	(short)(pDph_t->nphone+1), feanex) ) 
		{
        	/* pholas=sonor, pDphsettar->phcur=obst transition A B */
#ifdef DEBGFRENCH
          	printf ("Use locus, bouval %d, durtran : %d\n", 
                     pDphsettar->bouval, pDphsettar->durtran);
#endif
		}
#ifdef DEBGFRENCH
        else if (dbgphs) 
		{
        	printf ("phsettar.c forw_sm... Locus does not apply\n");
		}
#endif

      	// Michel 
      	if (pDphsettar->np == &PF1 && pDphsettar->phcur == FP_W) {
        	pDphsettar->bouval -= 100; // ?????? avoid a clic for MWA for instance
         	//printf ("pDphsettar->bouval -= 100 : %d\n", pDphsettar->bouval);
      	}

      	/* beginning of P, T, K
           F1 raised at onset of voiceless plosive release 
        */
      	if ( fealas & TPlosive && !(fealas & TVoisee) ) {
#ifdef DEBG
        	if (dbgphs) printf ("phsettar.c forw_... plosive %d\n", pDphsettar->bouval);
#endif
        	if (pDphsettar->np == &PF1) pDphsettar->bouval += 100;
		}

      	/* beginning of F, S, Ch, V, Z, J
           Transitions modified inside obstruents
      	*/
      	if (feacur & TFricative) { /* begin of S in _SA, AS */
			pDphsettar->durtran = NF30MS;
        
			if (pDphsettar->np == &PF1) pDphsettar->durtran = NF20MS;
		}
 		else if (feacur & TPlosive) 
		{
        	/* Transitions take all of plosive duration */
           	pDphsettar->durtran = pDph_t->durfon;
		}
      
      	/* beginning of M, N, Gn, Ng
           Higher formant transitions slow inside a nasal 
		*/
      	if ( !(feacur & TVoyelle) && feacur & TNasale ) 
		{
			pDphsettar->durtran = pDph_t->durfon;
			if (pDphsettar->np == &PF1) 
			{
				pDphsettar->durtran = 0;
        	}
			else if ( pDphsettar->phcur == FP_N && endtyp (pholas) == 1 ) 
			{
				/* Lower F2 & F3 of [n] nasal murmur after front vowels */
          		if (pDphsettar->np == &PF2) 
				{
					pDphsettar->bouval -= 100;
            		if ( place (pholas) & F2BACKF ) pDphsettar->bouval -= 100;
          		}
				else if (pDphsettar->np == &PF3) 
				{
					pDphsettar->bouval -= 100;
				}
        	}
	 		else if ( pDphsettar->np == &PF2 && pDphsettar->phcur == FP_M && 
            	place (pholas) & F2BACKF ) 
			{
				/* Lower F2 of [m] nasal murmur near [i,e] */
				pDphsettar->bouval -= 150;
			}
		}
    } /* if GEN_SIL or not */

	/*eab rw boundary does not act like en english coarticulated are but really
	needs a bouval 12/95*/
    //if( pDphsettar->np == &PF2 && pDphsettar->phcur == FP_W && pholas== FP_R ) {
    //  pDphsettar->bouval -=400; 
    //}

    /* (vowel, Liqglide) . <vowel, Liqglide, nasal>
       Shrink or lengthen transition duration inside a sonorant
       unless previous segment is obstruent 
    */
    if ( !(feacur & TPlosive) && !(feacur & TFricative)
    	&& endtyp (pholas) != 4 && pDphsettar->durtran > 0 ) {
      	/* L in PAL; R, L, Ap in ARLAp */

#ifdef DEBG
        if (dbgphs) {
        	printf ("phsettar.c forw_sm... 1 %s durtran %d\n",
            phprint (pDphsettar->phcur), pDphsettar->durtran);
        }
#endif
		//pDph_t->arg1 = pDphsettar->durtran;
		//pDph_t->arg2 = shrif;
			pDphsettar->durtran = mlsh1 (pDphsettar->durtran, shrif) + 1;
#ifdef DEBG
        if (dbgphs) {
          printf("phsettar.c forw_sm... 2 %s durtran %d\n",
          phprint(pDphsettar->phcur), pDphsettar->durtran);
		}
#endif
    } /* shrink or lengthen */
  	} 
	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ) { /* FORWARD SMOOTH:  FN */
		pDphsettar->durtran = 0;

    	/* (M, N, Gn, Ng) . <not M, N, Gn, Ng>
           beginning of A in MA or of On in MOn 
        */
    	if ( !(fealas & TVoyelle) && fealas & TNasale
      		&& ( feacur & TVoyelle || !(feacur & TNasale) ) ) {
      		pDphsettar->bouval  = NASAL_ZERO_BOUNDARY ;
			pDphsettar->durtran = NF80MS;
		}

  		} 
		else if (pDphsettar->par_type IS_FORM_BW) {  /* FORWARD SMOOTH:  B1, B2, B3 */
    		/* Widen first formant bw if preceeding segment is voiceless */
    		if (feacur & TVoisee) {
      			pDphsettar->durtran = NF40MS;       /* Default B1, B2, B3 : 40 ms */
      			if ( pDphsettar->np == &PB1 && !(fealas & TVoisee) ) {
        			/* B1 of beginning of A in PA */
					pDphsettar->durtran = NF50MS;
        			pDphsettar->bouval  = pDphsettar->np->tarcur + (PF1.tarcur >> 3); /* based on F1 */
#ifdef DEBG
          			if (dbgphs) printf ("BW1 pDphsettar->durtran %d, pDphsettar->bouval\n", pDphsettar->durtran, pDphsettar->bouval);
#endif
				}
    		}
 			else {
      			pDphsettar->durtran = NF20MS;   /* beginning of P in PA */
			}
		
			/* <GEN_SIL>  or (GEN_SIL).<>
        	   Treat boundary with silence +100 pour B1, +50 pour B2
    		*/
    		if (pholas == GEN_SIL) {
      			pDphsettar->bouval  = pDphsettar->np->tarcur + (&PB3 - pDphsettar->np) * 50;
				pDphsettar->durtran = NF50MS;
    		}
 			else if (pDphsettar->phcur == GEN_SIL) {  /* B1, B2, B3 of beginning of _ in PA_ */
      			pDphsettar->bouval  = pDphsettar->np->tarlas + (&PB3 - pDphsettar->np) * 50;
				pDphsettar->durtran = NF50MS;
#ifdef DEBG
        		if (dbgphs) {
          			printf ("phsettar.c forw_sm... pDphsettar->durtran %d, pDphsettar->bouval %d, pDphsettar->np->tarlas %d\n",
	            	pDphsettar->durtran, pDphsettar->bouval, pDphsettar->np->tarlas);
        		}
#endif
			}

    		/* (M, N, Gn, Ng) . <>
       			BW widen, to nasalize transition out of previous nasal : A in MA 
			*/
    		if (!(fealas & TVoyelle) && fealas & TNasale) {
				pDphsettar->bouval = pDphsettar->np->tarcur;	/* B2,B3 not influ by nasal */
      			if (pDphsettar->np == &PB1) {
        			pDphsettar->durtran = NF100MS;
        			pDphsettar->bouval += 70;       /* B1 of A in MA */
      			}
		 		else if ( pDphsettar->np == &PB2 && pholas == FP_N && begtyp (pDphsettar->phcur) != 1 ) {
        			/* F2 of [n] is wider in a non-front vowel */
					pDphsettar->bouval += 60;
					pDphsettar->durtran = NF60MS;
				}
#ifdef DEBG
        		if (dbgphs) {
          			printf ("BW3 pDphsettar->durtran %d, pDphsettar->bouval %d, pDphsettar->np->tarcur %d\n",
            		pDphsettar->durtran, pDphsettar->bouval, pDphsettar->np->tarcur);
				}
#endif
			}

    		/* Beginning of <M, N, Gn, Ng>
      		   Nasals consonants have constant bandwidths
       	       ex : B1, B2, B3 of beginning of M in MA 
           */
    		if (!(feacur & TVoyelle) && feacur & TNasale) {
				pDphsettar->durtran = 0;
				// debugforward ("Nasal has const par val", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
			}
  		} 
		else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP) || 
        	(pDphsettar->par_type IS_AV_OR_AH)) 
		{
    		/* FORWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB, TL
      		   Default bouval is average of tarcur & tarend
      		   default tc is 30 ms
      		   See if onset, i.e. plosive or large source intensity increase
    		*/
    		temp = pDphsettar->np->tarcur - 10; if (temp<0) temp=0;

    		if ( pDphsettar->bouval < temp || fealas & TPlosive || pholas == FP_J ) 
			{
				pDphsettar->bouval = temp;
      			if ( !(feacur & TPlosive) && !(feacur & TFricative) ) pDphsettar->durtran = NF20MS;

      			if (pDphsettar->np == &PAV) {  /* Voicing is special */
        			/* (GEN_SIL).<Vowel, LiqGlid, nasal> */
        			if (pholas == GEN_SIL && feacur & TVoisee ) 
					{
          				pDphsettar->durtran = NF45MS;  /* Gradual buildup of voicing */
						pDphsettar->bouval -= 8;
					}

				/* Obstruent voicing onset is abrupt */
        		if (fealas & TFricative) pDphsettar->bouval = temp + 6;

				/* Plosive onset is abrupt (used mainly for [bdg]) */
        		if (fealas & TPlosive) pDphsettar->bouval = pDphsettar->np->tarcur - 5;
			}
			
			// debugforward ("Onset", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
		}

    	/* (M, N, Gn, Ng) . <vowel, LiqGli, Nasal>
      	   If last nasal, and source amp increased, abrupt onset
           ex : AV, AH, A2-A6 for beginning of A in MA
    	*/
    	if ( !(fealas & TVoyelle) && fealas & TNasale && feacur & TVoisee ) {
			pDphsettar->durtran = 0;
			// debugforward ("Onset from nasal", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
		}

    	/* (vowel, LiqGli, Nasal) . <M, N, Gn, Ng>
           Voicing source amp const in intervocalic nasal
           ex : AV for beginning of M in AM
       	*/
      	if ( !(feacur & TVoyelle) && feacur & TNasale ) {
      		if ( fealas & TVoisee && pDphsettar->np == &PAV) pDphsettar->durtran = 0;
		}

    	/* AV, AH, A2-A6 DECREASING
      	   See if offset, i.e. source intensity decreasing
           ex :  for beginning of A in MA
    	*/
		temp = pDphsettar->np->tarlas - 10;
    	if (pDphsettar->bouval < temp) {
      		/* Reduce boundary value by 3 dB */
			pDphsettar->bouval = temp - 3;

			/* Source amplitudes fall gradually into silence */
      		if (pDphsettar->phcur == GEN_SIL) pDphsettar->durtran = NF70MS;
			
			/* Except voicing offset is abrupt */
      		if (pDphsettar->np == &PAV) pDphsettar->durtran = 0;

			// debugforward ("Offset",pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
		}

#ifdef NEVER_EVER_EVER_NEVER
		/* Buildup A3 gradually in [C, J] */
    	if (pDphsettar->np == &PA3) {
      		if ( pDphsettar->phcur == FP_CH || pDphsettar->phcur == FP_J ) {
				pDphsettar->durtran = pDph_t->durfon - NF15MS;
				pDphsettar->bouval = pDphsettar->np->tarcur - 30;
        		debugforward ("CH/J rule", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
			}
		}
#endif

    	/* (vowel, LiqGli, B,D,G, V,J,Z) . <GEN_SIL, F, S>
      	   Offset of a vowel into voiceless open vocal tract is breathy
      	   ex : beginning of S in AS
    	*/
    	if (pDphsettar->np == &PAP) {
			/* eab ap phoneme has a sudden onset of aspiration cauisng it
			   to be percieved as a plosive 
            */
        	pDphsettar->durtran = NF130MS;

      	if ( /*pDphsettar->phcur == GEN_SIL ||*/ pDphsettar->phcur == FP_F || pDphsettar->phcur == FP_S ) {
        	if ( fealas & TVoisee && !(fealas & TPlosive) && !(fealas & TFricative) ) {
				if (pDphsettar->phcur == GEN_SIL) {
					pDphsettar->bouval = 52;
					pDphsettar->durtran = NF80MS;
          		}
 				else {
            		pDphsettar->bouval  = 48-20;
					pDphsettar->durtran = NF45MS;
				}
#ifdef DEBG
            	if (dbgphs) {
              		printf ("PAP pDphsettar->durtran %d, pDphsettar->bouval %d\n", pDphsettar->durtran, pDphsettar->bouval);
				}
#endif
			}
		}
    } /* PAP */

    /* FORWARD SMOOTH:  TLT
      Tilt parameter jumps to target values near stops and silence
    */
    if (pDphsettar->np == &PTILT) {
		pDphsettar->durtran = NF25MS;

      	if (pholas == GEN_SIL) pDphsettar->bouval = pDphsettar->np->tarcur;
      	
		if (pDphsettar->phcur == GEN_SIL) 
		{
			/* Reach into par buffer to get actual previous value */
			pDphsettar->bouval = pDph_t->parstochip[OUT_TLT];
		}
      /* plosives or nasals */
      if ( fealas & TOcclusive || feacur & TOcclusive ) pDphsettar->durtran = 0;
	}
	} /* else if */

  	if (pDphsettar->durtran > pDph_t->durfon)  pDphsettar->durtran = pDph_t->durfon;
  	if (pDphsettar->durtran > NF130MS) pDphsettar->durtran = NF130MS; /* < 20 frames */
  	if (pDphsettar->bouval < 0) pDphsettar->bouval = 0;
} // fr_forw_smooth_rules


/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
/* I. Determine parameters of backward smoothing  f(pDphsettar->phcur,pDphsettar->phonex) */
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

/*
 *      Function Name: back_smooth_rules()      
 *
 *  	Description: PDPH_T pDph_t, short shrib, short feacur,
 *				   	 short feanex, short strucnex
 *
 *      Arguments:	PDPH_T pDph_t, 
 * 					short shrib, 
 *					short feacur,
 *				   	short feanex, 
 *				   	short strucnex
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
static void fr_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
				   			   short feanex, short strucnex)
{
	PDPH_T                  pDph_t = phTTS->pPHThreadData;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
  	short temp;

#ifdef DEBG
    //printf ("Set default  bouval %d, durtran :%d\n", 
    //         pDphsettar->bouval, pDphsettar->durtran);
#endif
  	if (pDphsettar->par_type IS_FORM_FREQ) {   /* BACKWARD SMOOTH : F1, F2, F3 */
		/* 0. Use default values for obst-obst transition */
    	if (feacur & TSonore) { /* Vowels, semi-vowels, L and R */
			pDphsettar->durtran = NF45MS;
      		if ( !(feacur & TLiqGli) ) { /* vowel */
        		if (feanex & TLiqGli) {
          			/* 1. end of A in AL or AR : vowel-soncon trans, use 75-25% */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarnex) >> 1;
					if (pDphsettar->np == &PF3)
			  			pDphsettar->durtran = NF64MS; /* F3 trans. slower for [R, L] */

          			/* First formant jumps down 80 Hz in /L/ */
          			if ( pDphsettar->phonex == FP_L && pDphsettar->np == &PF1 ) pDphsettar->bouval += 80;
				}

      		} 
			else { /* LiqGli */
				pDphsettar->durtran = NF40MS;
        		if ( !(feanex & TLiqGli) ) { /* vowel; ex : end of L in LA */
          			/* 3. Soncon-vowel trans, use 25-75% */
					pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarend) >> 1;
					pDphsettar->durtran = NF20MS;
        		}
 				else {
          			/* 4. Soncon-soncon transition : use defaults; ex : L in LR */
				}
			}
#ifdef DEBG
        	if (dbgphs) 
			{
          		printf ("phsettar.c back_sm... pDphsettar->bouval %d, pDphsettar->durtran %d\n",
            	pDphsettar->bouval, pDphsettar->durtran);
		}
#endif
    } /* TSonore */

	/* No backward smoothing if next phone is silence */
    if (pDphsettar->phonex == GEN_SIL) {
			pDphsettar->durtran = 0;
    }
 	else
 	{
    	if ( setloc (phTTS, (short)(pDph_t->nphone+1), pDph_t->nphone, FINAL, (short)(pDph_t->nphone+2), feanex) ) 
		{
      		/* phcur=sonor, phonex=obst transition */
			// debugbackward ("Use locus, percent", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
    	} 
		else if ( setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone+1), INITIAL, (short)(pDph_t->nphone-1), feanex) ) 
		{
        	/* phcur=obst, phonex=sonor transition */
			// debugbackward ("Use locus, percent", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
		}
#ifdef DEBG
    	else if (dbgphs) 
		{	
			printf ("phsettar.c back_sm... Locus does not apply\n");
		}
#endif

    	/* <Fricatives, Plosives>
       	   F1, F2, F3 slow inside obstruents; ex : end of S in SA
    	*/
    	if (feacur & TFricative) {
			pDphsettar->durtran = NF30MS;
			if (pDphsettar->np == &PF1)
				pDphsettar->durtran = NF20MS;
    	} 
		else if (feacur & TPlosive) 
		{
        	/* Transitions take all of plosive duration; end of P in PA */
			pDphsettar->durtran = pDph_t->durfon;
        	if ( pDphsettar->np == &PF1 && !(feacur & TVoisee) ) 
				pDphsettar->bouval += 100;
		}

    	/* <M, N, Gn, Ng>
        	Higher formant transitions slow at end of a nasal
    	*/
    	if ( !(feacur & TVoyelle) && feacur & TNasale ) {
			pDphsettar->durtran = pDph_t->durfon;
    		if (pDphsettar->np == &PF1) {
          		pDphsettar->durtran = 0;      /* Except F1 */
        	}
 			else if ( pDphsettar->phcur == FP_N && begtyp (pDphsettar->phonex) == 1 ) 
			{
				/* Lower F2 & F3 of [n] nasal murmur before front vowels */
          		if (pDphsettar->np == &PF2) 
				{
            		pDphsettar->bouval -= 100;   /* end of N in NI */
            		if ( place (pDphsettar->phonex) & F2BACKI ) 
						pDphsettar->bouval -= 100;
          			}
			 		else if (pDphsettar->np == &PF3) 
					{
						pDphsettar->bouval -= 100;
					}
        		} 
				else if (pDphsettar->np == &PF2 && pDphsettar->phcur == FP_M && place(pDphsettar->phonex) & F2BACKI) 
				{
          			pDphsettar->bouval -= 150;    /* Lower F2 of [m] murmur near [Y] */
				}
			}
    	} /* GEN_SIL or not */

    	/*	(vowel, Liqglide) . <vowel, Liqglide, nasal>
      		Shrink or lengthen transition duration inside a sonorant
      		unless previous segment is obstruent
      		ex : F1, F2, F3 of end of A in PAL
    	*/
    	if ( !(feacur & TPlosive) && !(feacur & TFricative)
      		&& begtyp (pDphsettar->phonex) != 4 && pDphsettar->durtran > 0 ) 
		{
			//pDph_t->arg1 = pDphsettar->durtran;
			//pDph_t->arg2 = shrib;
			pDphsettar->durtran = mlsh1 (pDphsettar->durtran, shrib) + 1;
		}
  	}
 	else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ) { /* BACKWARD SMOOTH:  FN */
		pDphsettar->durtran = 0;

    	/*
      		<not M, N, Gn, Ng> . (M, N, Gn, Ng)
      		end of A in AM or of On in OnM
    	*/
    	if ( !(feanex & TVoyelle) && feanex & TNasale
      		&& ( feacur & TVoyelle || !(feacur & TNasale) ) ) {
      		pDphsettar->bouval  = NASAL_ZERO_BOUNDARY;
			pDphsettar->durtran = NF80MS;
		}
  	}
 	else if (pDphsettar->par_type IS_FORM_BW) {    /* BACKWARD SMOOTH:  B1, B2, B3 */
    	if (feacur & TVoisee) {
			pDphsettar->durtran = NF40MS;

      		if (pDphsettar->np == &PB1) {
				/* Glottis opens early before -voice C, widen B1 */
        		if ( !(feanex & TVoisee) ) { /* ex : end of A in AP */
					pDphsettar->durtran = NF50MS;
					/* More increase for low vowels (F1 high) */
					pDphsettar->bouval = pDphsettar->np->tarend + (PF1.tarcur >> 3);
					/* Effect is greater for a female voice */
          			if (pDph_t->malfem == FEMALE) pDphsettar->durtran = NF100MS;
				}
			}
    	}
 		else
 		{	pDphsettar->durtran = NF20MS;
		}

		/* Treat boundary with silence */
    	if (pDphsettar->phonex == GEN_SIL) {
      		pDphsettar->bouval  = pDphsettar->np->tarend + (&PB3 - pDphsettar->np) * 50;
			pDphsettar->durtran = NF50MS;
    	}
 		else if (pDphsettar->phcur == GEN_SIL) {
     		pDphsettar->bouval  = pDphsettar->np->tarnex + (&PB3 - pDphsettar->np) * 50;
			pDphsettar->durtran = NF50MS;
		}

    	/*	<> . (M, N, Gn, Ng)
      		BW1 widen, to nasalize transition into next nasal
      		ex : B1, B2, B3 at end of A in AM
    	*/
    	if ( !(feanex & TVoyelle) && feanex & TNasale) {
			pDphsettar->bouval = pDphsettar->np->tarend;
    		if (pDphsettar->np == &PB1) {
				pDphsettar->durtran = NF100MS;
				pDphsettar->bouval += 100;
     		} 
			else if ( pDphsettar->np == &PB2 && pDphsettar->phonex == FP_N && endtyp (pDphsettar->phcur) != 1 ) 
			{
        		/* F2 of [n] is wider before a non-front vowel */
        		pDphsettar->bouval += 60;
        		pDphsettar->durtran = NF60MS;
			}
		}

    	/*	<M, N, Gn, Ng>
      		B1, B2, B3 : nasals have constant bandwidths at target values
      		end of M in MA
    	*/
    	if ( !(feacur & TVoyelle) && feacur & TNasale ) 
		{
			pDphsettar->durtran = 0;
			// debugbackward ("Nasal has const. par val", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
		}
 	}
 	else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP) || (pDphsettar->par_type IS_AV_OR_AH)) {
		/* BACKWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB, TL */

    	/*	INCREASING
      		See if onset, i.e. source intensity increasing
      		AV, AP, A2-A6, TL
    	*/
		temp = pDphsettar->np->tarnex - 10;
    	if (pDphsettar->bouval < temp) {
			pDphsettar->bouval = temp;
			if (pDphsettar->phcur == GEN_SIL) pDphsettar->durtran = NF70MS;
			//  debugbackward ("Onset", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
		}

    	/*	AV INCREASING
      		Voicing is special:  onset is abrupt, except if a voiced fric
    	*/
    	if ( pDphsettar->np == &PAV && (pDphsettar->bouval < pDphsettar->np->tarnex)
      		&& pDphsettar->phcur != FP_V && pDphsettar->phcur != FP_J && pDphsettar->phcur != FP_Z ) {
			pDphsettar->durtran = 0;
		// debugbackward ("Make next onset abrupt", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);

      	/*	Pb with AV of last frame if this is ifdef ex: OPI
        	Voicebar dies out in a voiced plosive
        	end of B in BA or P in PA
      	*/
      	if ( feacur & TPlosive || pDphsettar->phcur == FP_CH ) 
		{
        	if (feacur & TVoisee) 
			{
				pDphsettar->bouval = pDphsettar->np->tarend - 3;
				pDphsettar->durtran = NF45MS;
				// debugbackward ("Voicebar dies out", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
        	}
 			else
			{
          		/* Do not allow prevoicing in a voiceless plosive
                   ex AV for P is 0 even for the last frame
            	*/
				pDphsettar->bouval = 0;
			}
        	if (pDphsettar->durtran > NF130MS) pDphsettar->durtran = NF130MS;
        	if (pDphsettar->durtran > pDph_t->durfon) pDphsettar->durtran = pDph_t->durfon;
        	if (pDphsettar->bouval < 0) pDphsettar->bouval = 0;
        	pDphsettar->np->tbacktr = pDph_t->durfon - pDphsettar->durtran;
#ifdef DEBG
          	if (dbgphs) 
			{
            	printf ("phsettar.c back_sm... RETURN pDphsettar->bouval %d, pDphsettar->durtran %d\n",
              	pDphsettar->bouval, pDphsettar->durtran);
			}
#endif
        	return;
		}
	}

    /* AV for <vowel, LiqGli, B,D,G, V,Z,J, nasal> . <M, N, Gn, Ng>
       If curr phone is voiced and next is nasal, set AV const
       AV for end of A in AM
    */
    if ( pDphsettar->np == &PAV && feacur & TVoisee
     	&& !(feanex & TVoyelle) && feanex & TNasale ) 
	{
		pDphsettar->durtran = 0;
		// debugforward ("AV const in voiced to nasal", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
	}

    /* AV for <M, N, Gn, Ng>
       If curr phone nasal, and next is voiced non-obst, AV const
       ex : AV for end of M in MA
    */
    if ( pDphsettar->np == &PAV && !(feacur & TVoyelle) && feacur & TNasale) 
	{
    	if ( feanex & TVoisee && !(feanex & TPlosive) && !(feanex & TFricative)
        	&& pDphsettar->phonex != FP_AP) 
		{
        	pDphsettar->durtran = 0;   /* vowels, LigGli, nasal */
			// debugbackward ("Make murmur const AV", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
      	} 
		else
 		{	
			pDphsettar->durtran = NF40MS;
		}
	}

    /* DECREASING
       See if offset, i.e. source intensity decreasing
    */
	temp = pDphsettar->np->tarend - 10;

    /* Plosive burst does not get attenuated during offset
       AV, AH, A2-A6, TL
    */
    if (feacur & TPlosive) {
     	pDphsettar->durtran = NF15MS;        /* Amplitudes at the end of P */
		temp = pDphsettar->np->tarend;
    } 
	else if (pDphsettar->phcur == FP_J || pDphsettar->phcur == FP_CH) 
	{
     	pDphsettar->durtran = NF15MS;
	}
    
	if (pDphsettar->bouval < temp) 
	{
		pDphsettar->bouval = temp - 3;
		pDphsettar->durtran = NF20MS;
	}

#ifdef NEVER_EVER_EVER_NEVER
    /*
      Pb : last frame of plosive for AV not 0 in OPI for ex:
      Voicing amp falls gradually at end of phrase
      Source sudden offset, or next seg is a dummy vowel
    */
    if (pDphsettar->np == &PAV) {
    	if ( pDphsettar->bouval < temp || (temp > 0 && pDphsettar->phonex == FP_AP) )  {
			pDphsettar->bouval = temp + 3;
        	if ( pDphsettar->phonex == GEN_SIL || pDphsettar->phonex == FP_AP ) pDphsettar->durtran = NF75MS;
		}
      	debugbackward ("Offset to noise", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
	}
#endif

    /* except AV : <> . (Plosive, J, Ch)
       No smoothing of source amps if next segment has burst
    */
    if ( pDphsettar->np != &PAV
     	&& (feanex & TPlosive || pDphsettar->phonex == FP_J || pDphsettar->phonex == FP_CH) ) {
		pDphsettar->durtran = 0;
 		// debugbackward ("Stop closure next", pDphsettar->np, pDphsettar->bouval, pDphsettar->durtran);
	}

	/* Onset of a vowel from voiceless open vocal tract is breathy */
    if (pDphsettar->np == &PAP) 
	{
		if ( pDphsettar->phcur == FP_F || pDphsettar->phcur == FP_S ) 
		{
        	if ( feanex & TVoisee && !(feanex & TPlosive) && !(feanex & TFricative) ) 
			{
          		/* AP for  <F, S> . (vowel, LiqGli, nasal) */
				pDphsettar->bouval = 52;
				pDphsettar->durtran = NF40MS;
			}
		}

      	if ( feacur & TSyllabique && pDphsettar->phonex == GEN_SIL ) {
			/* Offset of a vowel into silence is breathy */
        	pDphsettar->bouval  = 32;       /* AP for <vowel sauf FP_AP> . GEN_SIL */
			/* eab ap phoneme has a sudden onset of aspiration cauisng it
			   to be percieved as a plosive This was 52 changing it to see if this
			   is the code causing the problem
            */
			pDphsettar->durtran = NF130MS;
		}
	}

    /* BACKWARD SMOOTH:  TLT
       Tilt parameter jumps to target values near stops and silence
    */
    if (pDphsettar->np == &PTILT) {
			pDphsettar->durtran = NF25MS;

      if (pDphsettar->phonex == GEN_SIL) pDphsettar->bouval = pDphsettar->np->tarend;
      if (pDphsettar->phcur  == GEN_SIL) pDphsettar->bouval = pDphsettar->np->tarnex;

      /* <>.(plosives, fricatives) */
      if ( feanex & TOcclusive || feacur & TOcclusive ) pDphsettar->durtran = 0;

      if ( feacur & TVoisee && !(feacur & TNasale) ) {
        if (pDphsettar->phonex == GEN_SIL) {   /* Long breathy offset into silence */
					pDphsettar->bouval = 15;
					pDphsettar->durtran = NF130MS;
				}
			}

    } /* tilt */

  } /* else if type parameter */

  if (pDphsettar->durtran > NF130MS) pDphsettar->durtran = NF130MS;
  if (pDphsettar->durtran > pDph_t->durfon) pDphsettar->durtran = pDph_t->durfon;
  if (pDphsettar->bouval < 0) pDphsettar->bouval = 0;
	pDphsettar->np->tbacktr = pDph_t->durfon - pDphsettar->durtran;

} // fr_back_smooth_rules

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* J.              S P E C I A L - R U L E S                        */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*
 *      Function Name:       
 *
 *  	Description: special_rules 
 *
 *      Arguments:	PDPH_T pDph_t,  
 *					short fealas,
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
static void fr_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
			   				short feacur, short feanex, short struclm2,
			   				short struccur, short pholas, short struclas)
{

	PDPH_T                  pDph_t = phTTS->pPHThreadData;
  	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;
  	/*static*/ short closure_dur;
  	short  vot;
  	short  bdur;

  	/* SPECIAL RULE 1: Burst duration for plosives */
  	bdur = burdr (pDphsettar->phcur);      /* Look up inher. burst dur in msec in table */

#ifdef DEBG
    if (dbgphs) {
     	printf ("phsettar.c special_rules entree pDphsettar->phcur %d, %s\n",
        pDphsettar->phcur, phprint (pDphsettar->phcur));
      	printf ("phsettar.c special_rules feacur %8x\n", feacur);
	}
#endif
  	/* <plosives> . (nasals or plosives)
       ex : P in PM  P and M are FLABIAL; or D in TN (T and N are FALVEL)
  	*/
  	if ( feacur & TPlosive ) {
    	bdur = mstofr (bdur);    /* Convert to frames */
    	/* Don't release burst in homorganic plosiv-nasal & plos-plos sequence */
    	if ( !(feanex & TVoyelle) && feanex & TNasale || feanex & TPlosive ) {
      		if (place (pDphsettar->phcur) == place (pDphsettar->phonex)) 
		  		bdur = 0;
    	}

    	if (bdur > 1) {
      		/* P in OPTE; S in OSTIL */
      		if ( (feacur & TPlosive || feacur & TFricative) && feanex & TPlosive ) {
        		bdur--;    /* Shorten burst before obst by 6 ms */
      		}
 			else if (pDph_t->durfon < NF50MS) 
			{
        		bdur--;    /* Shorten burst if closure short */
      		}
    	}

    	closure_dur = pDph_t->durfon - bdur;

    	for (pDphsettar->np = &PA2; pDphsettar->np <= &PAB; pDphsettar->np++) { /* All fric gains to */
      		pDphsettar->np->tspesh = closure_dur;   /* zero during closure */
      		pDphsettar->np->pspesh = 0;
    	}

#ifdef DEBG
    	if (dbgphs) 
		{
      		printf ("phsettar.c special_rules bdur %d, closure_dur %d\n",
        	bdur, closure_dur);
    	}
#endif

  	} /* if plosive */


  	/* if preceding phoneme is p, t, k
       (p, t, k) . <vowel, liquide, glide, nasal>
       SPECIAL RULE 2: Voice onset time for aspirated plosives
       for SegAXP in [c][a][p][SegAXP], or è in [c][a][p][è]  ("cap est" : 2 words)
       for l in pli, for r in pra 
	*/
  	vot = 0;
  	if ( fealas & TPlosive && !(fealas & TVoisee) && feacur & TSonore ) 
	{
   		/* pli, pra, pi */

    	PAP.pspesh = 50;  // Amplitude of aspiration in dB
     	//PAP.pspesh = 37;   //Amplitude of aspiration in dB 

    	/* Stronger asp before +back; ex:pra */
    	//if (begtyp (pDphsettar->phonex) != 1) PAP.pspesh = 61-30;
    	PAV.pspesh = 0;     /* Amplitude of voicing during aspir */
    	vot = NF40MS;       /* 6 frames; Asp dur for /p, t, k/ before stressed sonor */
    	if ( pholas == FP_P ) vot = NF25MS; // 4 frames

    	/*  Aspiration stronger in sonor cons : l in pli : AP=60 
            r in pra, autre AP=64 
    	*/
    	/* if (feacur & TLiqGli) PAP.pspesh += 3; */ 

    	/* Vot longer in a sonorant consonant : l in pli, r in pra */
    	if ( !(feacur & TSyllabique) ) vot += NF20MS;

    	if (vot >= pDph_t->durfon) vot = pDph_t->durfon - 1;

    	/* Vot cannot exceed 1/2 duration of a stressed vowel */
    	if ( vot > (pDph_t->durfon >> 1) && feacur & TSyllabique ) vot = pDph_t->durfon >> 1;

    	/* c a p SegAXP; SegAXP added in phalloph.c */
    	if ( pDphsettar->phcur == FP_AP ) 
		{
      		vot = pDph_t->durfon;
      		PAP.pspesh -= 6;
    	}

    	PAV.tspesh = vot;
    	PAP.tspesh = vot;

    	/* Widen 1st and 2nd formant bws when glottis open for aspir.
       	   Ex: A in PA during vot; very little effect */
    	//PB1.tspesh = vot;
    	//PB2.tspesh = vot;
    	//PB1.pspesh = PB1.tarcur + 250;
    	//PB2.pspesh = PB2.tarcur + 70;
  	} /* if p,t,k followed by sonorant */


#if 0
  	/* Problem: spectrum has too much F4 if f2,3 are high, as in [i] */
  	if ( feacur & TPlosive && feacur & TVoisee && fealas & TVoisee
    	&& !(feanex & TVoisee) ) 
	{ 
    	/* not very often used : "agpi" or "rag sur"; give a bad sound */
    	//printf ("p_fr_st1.c  RULE 3 ????????????\n");
    	PAV.tspesh = pDph_t->durfon - NF15MS;
    	PB1.tspesh = pDph_t->durfon;
    	PB2.tspesh = pDph_t->durfon;
    	PB3.tspesh = pDph_t->durfon;
    	PAV.pspesh = 63;    /* Large since low-pass TILT attenuates it */
    	PB1.pspesh = 1000;
    	PB2.pspesh = 1000;
    	PB3.pspesh = 1500;
  	}
#endif
} // fr_special_rules

#ifdef DEBG
void print_parameters (LPTTS_HANDLE_T phTTS, short ph) 
{
  int i;
  PDPH_T          pDph_t = phTTS->pPHThreadData;

  printf ("phprint.c print_parameters : %s\n", phprint (ph) );
  printf ("\n           F0   F1   F2   F3  FZ  B1  B2  B3  AV  AP  A2  A3  A4  A5  A6  AB  TL\n");
  printf ("\ntarcur  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].tarcur);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].tarcur);
  printf ("\ndurlin  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].durlin);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].durlin);
  printf ("\ndeldip  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].deldip);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].deldip);
  printf ("\ndipcum  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].dipcum);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].dipcum);
  printf ("\nftran   ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].ftran>>3);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].ftran>>3);
  printf ("\ndftran  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].dftran>>3);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].dftran>>3);
  printf ("\nbtran   ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].btran>>3);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].btran>>3);
  printf ("\ndbtran  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].dbtran>>3);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].dbtran>>3);
  printf ("\ntbacktr ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].tbacktr);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].tbacktr);
  printf ("\ntspesh  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].tspesh);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].tspesh);
  printf ("\npspesh  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].pspesh);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].pspesh);
  printf ("\ntarnex  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].tarnex);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].tarnex);
  printf ("\ntarlas  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].tarlas);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].tarlas);
  printf ("\ntarend  ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].tarend);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].tarend);
  printf ("\nndip    ");
  for (i=0; i<4; i++) printf ("%5d", pDph_t->param[i].ndip);
  for (i=4; i<17;i++) printf ("%4d", pDph_t->param[i].ndip);
  printf ("\noutp    ");
  //for (i=0; i<4; i++) printf ("%5d", *param[i].outp);
  //for (i=4; i<17;i++) printf ("%4d", *param[i].outp);
  printf ("\n\n");
}
#endif	// DEBG

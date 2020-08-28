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
 *    French specific functions from phsettar.c
 *
 ***********************************************************************
 *
 *  Rev  Who  Date        Description
 *  ---  ---  ----------  --------------------------------------------
 *  001  CHJ  07/20/2000  Created from p_us_st1.c and old fphsetar.c.
 *  002  CAB  09/21/2000  Fixed copyright info
 *  003  MGS  09/21/2000  Fixed Whitespace before #ifdefs and friends 
 *  004  MGS  12/13/2000  Further optimization on gettar
 *  005  MGS  01/18/2001  Removed arg1 arg2 and arg3 from calculations
 *  005  CAB  01/17/2001  Merged Michel Divay changes for French
 *  006  CAB  01/24/2001  Readded optimization by MGS
 *  007  eab  03/02/2001  Eab femamp should no longer be used femamp = malamp is just fine.
 */

extern short Cibles_MALE   [42][N_PARAM];
extern short Cibles_FEMALE [42][N_PARAM];
extern const short fr_place[];

#ifdef DEBG
#define dbgphs  0
#define DEBGFIN 0
char* phprint (short c);
#endif

// Description: Get target value (or a pointer to first value of diphthong specification 
// (do not compute any coarticulatory influences of adjacent phones)
short fr_gettar (LPTTS_HANDLE_T phTTS, int nphone_temp) {
  short          phone_temp , phlas_temp, phnex_temp, tartemp=0, pphotr, begtypnex, npar;
  PDPH_T         pDph_t = phTTS->pPHThreadData;
  PKSD_T         pKsd_t = phTTS->pKernelShareData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;

	if( (PFFR <<PSFONT) != pDph_t->last_lang)
	{
		pDph_t->last_lang = (PFFR<<PSFONT);
		if(pDph_t->malfem == MALE)
		{
			pDph_t->Cibles_Defaut=(short *)Cibles_MALE;
			// CAB Removed warnings by typecast
//			pDph_t->p_locus = (short *)fr_maleloc;	   		
			pDph_t->p_diph = (short *)us_maldip;
			pDph_t->p_tar = (short *)us_maltar;
		}
		else
		{
			pDph_t->Cibles_Defaut=(short *)Cibles_FEMALE;
			// CAB Removed warnings by typecast
//			pDph_t->p_locus = (short *)fr_femloc;	   	
			pDph_t->p_diph = (short *)us_femdip;
			pDph_t->p_tar = (short *)us_femtar;
		
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

  } else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ) {
    tartemp = pDph_t->Cibles_Defaut [N_PARAM*(phone_temp & PVALUE)+12];

  } else if (pDphsettar->par_type IS_AV_OR_AH) {
    // Rules for voicing amplitude
    if (npar == AV-1) {
      tartemp = pDph_t->Cibles_Defaut [N_PARAM*(phone_temp & PVALUE)+7];

    } else { // AH, value number 6 in Cibles_Defaut
      tartemp = pDph_t->Cibles_Defaut [N_PARAM*(phone_temp & PVALUE)+6];
      //printf ("tartemp AH %d\n", tartemp);
    }
  }
#ifndef HLSYN
   else if (pDphsettar->par_type IS_PARALLEL_FORM_AMP) {

    // GETTAR:  A2, A3, A4, A5, A6, AB, TILT (partype = 2)
    // if ptram > 0, it is a pointer in obstruent array taram 
    if ( pDphsettar->np != &PTILT) {
      if ( (tartemp = ptram (phone_temp)) > 0 ) {
        begtypnex = begtyp (phnex_temp) - 1;
        if (phnex_temp == GEN_SIL) begtypnex = endtyp(phlas_temp)- 1;
        if (begtypnex == 4) begtypnex = 2;
        tartemp += (npar - A2 + 1 + (6 * begtypnex));
        tartemp  = pDph_t->p_amp [tartemp];

      } else { // A2-AB for FP_R;otherwise 0
        pphotr = npar - 9; // for A2:npar:9 pphotr=0; A2 to AB
        tartemp = pDph_t->Cibles_Defaut [N_PARAM*(phone_temp & PVALUE)+pphotr];
      }

    } // if ( pDphsettar->np != &PTILT)

    if (pDphsettar->np == &PTILT) {
      // Source spectral tilt: highly tilted for obstruents
      // (Voiced obstruents are special case, set F1=0 to signal voicebar) 
      // TLT is the value number 8 of a line of Cibles_Defaut[]
      tartemp = *(pDph_t->Cibles_Defaut+((phone_temp & PVALUE)*N_PARAM)+8);
    } // if (pDphsettar->np == &PTILT)

  } // elseif parameter type

  //  printf ("phsettar.c gettar %4s %5d\n", phprint (phone_temp), tartemp);
#endif
  return tartemp;
} // gettar



// not called for French
static short fr_special_coartic (PDPH_T pDph_t, short nfon, short diphpos) {
  // Note: Gen coartic of 5% with adjacent segs elsewhere, so stuff here is big
  // This routine is only called if the current segment is diph (i.e. a vowel)
  short          temp, fonnex, foncur, fonlas;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;
	extern const short fr_place[];
	temp = 0;
  foncur = get_phone (pDph_t, nfon);
  fonnex = get_phone (pDph_t, nfon + 1);
  fonlas = get_phone (pDph_t, nfon - 1);

  // F3 target of selected vowels
  if (pDphsettar->np == &PF3) {
    if (((phone_feature (pDph_t,foncur) & FVOWEL) IS_PLUS) && (foncur != US_RR)) {
      if ( ((fonlas == FP_W) || (fonlas == FP_R) || (fonlas == FP_RX))  ||
           ((fonnex == FP_W) || (fonnex == FP_R) || (fonnex == FP_RX))) {
        temp = -150;
      }
    }
  }

  // F2 target of selected vowels
  if (pDphsettar->np == &PF2) {
    // Reduce effects for phrase-final stressed vowels
    if ((pDph_t->allofeats[nfon] & FBOUNDARY) >= FVPNEXT) temp = temp >> 1;
    // Maximum change should not be excessive
    if (temp > 400)  temp = 400;
    if (temp < -400) temp = -400;
  }  // F2 target

  return temp;
}  // fr_special_coartic



#ifdef DEBUG
#ifndef UNDER_CE
// write values for forward transition (the left transition of a phoneme)
void writeTransF (LPTTS_HANDLE_T phTTS, char* message, short pholas) {
  PDPH_T         pDph_t     = phTTS->pPHThreadData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;
  printf ("fr_forw_smooth_rules %s[%s] %s, bouval %d, durtran %d\n", 
           phprint (pholas), phprint (pDphsettar->phcur),message, pDphsettar->bouval, pDphsettar->durtran);
}

// write values for backward transition (the right transition of a phoneme)
void writeTransB (LPTTS_HANDLE_T phTTS, char* message) {
  PDPH_T         pDph_t     = phTTS->pPHThreadData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;
  printf ("fr_back_smooth_rules [%s]%s %s bouval, %d, durtran %d\n", 
          phprint (pDphsettar->phcur), phprint (pDphsettar->phonex), message, pDphsettar->bouval, pDphsettar->durtran);
}
#endif
#endif



// Determine parameters of forward smoothing;
// by default, before this function is called :
//   bouval  = (tarlas + tarcur) / 2
//   durtran = NF30MS;
// main parameters are : pDphsettar->bouval, pDphsettar->durtran
static void fr_forw_smooth_rules (LPTTS_HANDLE_T phTTS, short shrif, short pholas,
                    short fealas, short feacur, short struclas,
                    short struccur, short feanex) {
  PDPH_T         pDph_t     = phTTS->pPHThreadData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;
  short temp;

  //writeTransF (phTTS, "entry before modification", pholas);

  // =========
  if (pDphsettar->par_type IS_FORM_FREQ) {  // FORWARD SMOOTH: F1, F2, F3

    if (feacur & FVOWEL || feacur & TLiqGli) {  // ['V', L, R, W, Y, Wu]
      //writeTransF (phTTS, "before modification", pholas);

      if ((fealas & TLiqGli) && (feacur & FVOWEL)) {
        // (L,R,Y,W,Wu).['V']
        pDphsettar->durtran = NF45MS;
        // 1. [L]A, [R]A (LiqGli-vowel transition, use 25-75% rule)
        pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarlas) >> 1;
        // Make F1 discontinuous for L; F1 of A in L[A]
        if ( pholas == FP_L && pDphsettar->np == &PF1 ) pDphsettar->bouval += 80;
        // Make F2 & F3 transitions slower out of /R/ ex: A in R[A]
        if ( pholas == FP_R && pDphsettar->np != &PF1 ) pDphsettar->durtran = NF70MS;
        //writeTransF (phTTS, "after 25-75", pholas);
      }

      if ( !(fealas & TLiqGli) && (feacur & TLiqGli)) {
        // (not L,R,W,Y,Wu).[L,R,W,Y,Wu]
        // Phcur is a sonorant conson; Vowel-soncon trans, use 75-25%
        // _[L]A; _[R]A; S[Y]On; M[W]A; _[R]YOn (not R[Y]On); PA[L]M
        pDphsettar->bouval  = (pDphsettar->bouval + pDphsettar->np->tarcur) >> 1;
        if (pDphsettar->phcur == FP_M) pDphsettar->bouval  = pDphsettar->np->tarcur;
        //writeTransF (phTTS, "after 75-25", pholas);
        pDphsettar->durtran = NF30MS;
      }

      if ( (fealas & TLiqGli) && (feacur & TLiqGli)) {
        // (L,R,W,Y,Wu).[L,R,W,Y,Wu]
        // 4. Soncon-soncon transition ex :L[R]I, L[Y]On or R[Y]In
        pDphsettar->durtran = NF30MS;
        //writeTransF (phTTS, "50%-50% for (L,R,W,Y,Wu).[L,R,W,Y,Wu]", pholas);
      }

      // else nothing :
      // like B[A], T[I]  : use locus below
      // or A[Ou]T        : 'V' ['V'] : use default 50% 50%
      //writeTransF (phTTS, "End of TSonore", pholas);
    } // FSONOR


    // Boundary values = previous target if current phone is sil
    if (pDphsettar->phcur == GEN_SIL) {
      if (pDph_t->nphone > 1) {
        pDphsettar->bouval = pDphsettar->np->tarlas;
      } else {
        pDphsettar->bouval = pDphsettar->np->tarnex;
      }
      pDphsettar->durtran = pDph_t->durfon;

    } else if (!(feacur & TLiqGli)) {  //'V', PTKBDG, FSChVZJ, MNGnNg
      if ( setloc (phTTS, (short)(pDph_t->nphone-1), pDph_t->nphone, INITIAL, 
                   (short)(pDph_t->nphone-2), feanex) ) {
        // pholas=obst, pDphsettar->phcur=sonor transition; ex : P[A]PA
        //writeTransF (phTTS, "Use locus (CV)", pholas);
      } else if ( setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone-1), FINAL, 
                   (short)(pDph_t->nphone+1), feanex) ) {
        // pholas=sonor, pDphsettar->phcur=obst transition; ex : PA[P]A
        //writeTransF (phTTS, "Use locus (VC)", pholas);
      } else {
        //BA[L], BAu[A], RY[In], _[P]APA
        //writeTransF (phTTS, "Locus does not apply", pholas);
      }

      // [P,T,K,B,D,G]
      if (feacur & FPLOSV) {
        // Transitions take all of plosive duration
        pDphsettar->durtran = pDph_t->durfon;
        //writeTransF (phTTS, "plosives", pholas);
      }

    } // if GEN_SIL or not


    // (vowel, Liqglide).[vowel, Liqglide, nasal]
    // Shrink or lengthen transition duration inside a sonorant
    // unless previous segment is obstruent 
    if ( !(feacur & FPLOSV) && !(feacur & TFricative)
         && endtyp (pholas) != 4 && pDphsettar->durtran > 0 ) {
      //L[A]PIn, PA[L]è; PAL[è]; R, L, Ap in ARLAp
      //writeTransF (phTTS, "before shrink", pholas);
      //printf ("shrif : %d\n", shrif);
      pDphsettar->durtran = mlsh1 (pDphsettar->durtran, shrif) + 1;
      //writeTransF (phTTS, "after shrink", pholas);
    } // shrink or lengthen

  // ========= FN
  } else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ) { // FORWARD SMOOTH:  FN
    pDphsettar->durtran = 0;
    // (M, N, Gn, Ng)['V' or consonant except M, N, Gn, Ng]
    // beginning of A in M[A] or of On in M[On]; Michel : not really useful
    if ( !(fealas & FVOWEL) && fealas & FNASAL
         && ( feacur & FVOWEL || !(feacur & FNASAL) ) ) {
      pDphsettar->bouval  = NASAL_ZERO_BOUNDARY ;  // 370
      pDphsettar->durtran = NF80MS;
      //writeTransF (phTTS, "Nasal zero", pholas);
    }

  // ========= B1, B2, B3
  } else if (pDphsettar->par_type IS_FORM_BW) {  // FORWARD SMOOTH:  B1, B2, B3
    // Widen first formant bw if preceeding segment is voiceless
    if (feacur & FVOICD) {
      pDphsettar->durtran = NF40MS;       // Default B1, B2, B3 : 40 ms
      if ( pDphsettar->np == &PB1 && !(fealas & FVOICD) ) {
        // B1 of beginning of A in P[A]
        pDphsettar->durtran = NF50MS;
        pDphsettar->bouval  = pDphsettar->np->tarcur + (PF1.tarcur >> 3); // based on F1
        //writeTransF (phTTS, "B1", pholas);
      }
    } else {
      pDphsettar->durtran = NF20MS;   // beginning of P in [P]A
    }

    // [GEN_SIL]  or (GEN_SIL).[]
    // Treat boundary with silence +100 pour B1, +50 pour B2
    if (pholas == GEN_SIL) {
      // VIKTORHUGAu_[L]E2...
      pDphsettar->bouval  = pDphsettar->np->tarcur + (&PB3 - pDphsettar->np) * 50;
      pDphsettar->durtran = NF50MS;
    } else if (pDphsettar->phcur == GEN_SIL) {  // B1, B2, B3 of beginning of _ in PA_
      pDphsettar->bouval  = pDphsettar->np->tarlas + (&PB3 - pDphsettar->np) * 50;
      pDphsettar->durtran = NF50MS;
      // printf ("phsettar.c forw_sm... pDphsettar->durtran %d, pDphsettar->bouval %d, pDphsettar->np->tarlas %d\n",
      // pDphsettar->durtran, pDphsettar->bouval, pDphsettar->np->tarlas);
    }

    // (M, N, Gn, Ng) . []
    // BW widen, to nasalize transition out of previous nasal : A in M[A] 
    if (!(fealas & FVOWEL) && fealas & FNASAL) {    // [M, N, Gn, Ng]
      pDphsettar->bouval = pDphsettar->np->tarcur;  // B2,B3 not influ by nasal
      if (pDphsettar->np == &PB1) {
        pDphsettar->durtran = NF100MS;
        pDphsettar->bouval += 70;       // B1 of A in MA
      } else if ( pDphsettar->np == &PB2 && pholas == FP_N && 
                  begtyp (pDphsettar->phcur) != 1 ) {
        // F2 of [N] is wider in a non-front vowel
        pDphsettar->bouval += 60;
        pDphsettar->durtran = NF60MS;
      }
      //writeTransF (phTTS, "(M, N, Gn, Ng).[ ]", pholas);
    }

    // [M, N, Gn, Ng]
    // Nasals consonants have constant bandwidths
    // ex : B1, B2, B3 of beginning of M in [M]A 
    if (!(feacur & FVOWEL) && feacur & FNASAL) {
      pDphsettar->durtran = 0;
    }

  // ========= AV, AP, A2, A3, A4, A5, A6, AB, TL
  } else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP) || 
             (pDphsettar->par_type IS_AV_OR_AH)) {
    
    // FORWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB, TL
    // Default bouval is average of tarcur & tarend
    // default tc is 30 ms
    // See if onset, i.e. plosive or large source intensity increase
    temp = pDphsettar->np->tarcur - 10;
    if (temp<0) temp=0;

    if ( pDphsettar->bouval < temp || fealas & FPLOSV || pholas == FP_J ) {
      pDphsettar->bouval = temp;
      if ( !(feacur & FPLOSV) && !(feacur & TFricative) ) pDphsettar->durtran = NF20MS;
      if (pDphsettar->np == &PAV) {  // Voicing is special
        // (GEN_SIL).[Vowel, LiqGlid, nasal]
        if (pholas == GEN_SIL && feacur & FVOICD ) {
           pDphsettar->durtran = NF45MS;  // Gradual buildup of voicing
           pDphsettar->bouval -= 8;
        }
        // Obstruent voicing onset is abrupt
        if (fealas & TFricative) pDphsettar->bouval = temp + 6;
        // Plosive onset is abrupt (used mainly for [bdg])
        if (fealas & FPLOSV) pDphsettar->bouval = pDphsettar->np->tarcur - 5;
      }
    }

    // (M, N, Gn, Ng) . [vowel, LiqGli, Nasal]
    //  if last nasal, and source amp increased, abrupt onset
    //  ex : AV, AH, A2-A6 for beginning of A in M[A]
    if ( !(fealas & FVOWEL) && fealas & FNASAL && feacur & FVOICD ) {
      pDphsettar->durtran = 0;
    }

    // (vowel, LiqGli, Nasal) . [M, N, Gn, Ng]
    //   Voicing source amp const in intervocalic nasal
    //   ex : AV for beginning of M in A[M]
    if ( !(feacur & FVOWEL) && feacur & FNASAL ) {
      if ( fealas & FVOICD && pDphsettar->np == &PAV) pDphsettar->durtran = 0;
    }

    // AV, AH, A2-A6 DECREASING
    //   See if offset, i.e. source intensity decreasing
    //   ex :  for beginning of A in M[A]
    temp = pDphsettar->np->tarlas - 10;
    if (pDphsettar->bouval < temp) {
      // Reduce boundary value by 3 dB
      pDphsettar->bouval = temp - 3;
      // Source amplitudes fall gradually into silence
      if (pDphsettar->phcur == GEN_SIL) pDphsettar->durtran = NF70MS;
      // Except voicing offset is abrupt
      if (pDphsettar->np == &PAV) pDphsettar->durtran = 0;
    }


    // (vowel, LiqGli, B,D,G, V,J,Z) . [GEN_SIL, F, S]
    //  Offset of a vowel into voiceless open vocal tract is breathy
    //  ex : beginning of S in A[S]
    if (pDphsettar->np == &PAP) {
      pDphsettar->durtran = NF130MS;

      if ( //pDphsettar->phcur == GEN_SIL ||
             pDphsettar->phcur == FP_F || 
             pDphsettar->phcur == FP_S ) {
        if ( fealas & FVOICD && !(fealas & FPLOSV) && !(fealas & TFricative) ) {
          if (pDphsettar->phcur == GEN_SIL) {
            pDphsettar->bouval = 52;
            pDphsettar->durtran = NF80MS;
          } else {
            // A[S]I (assis)
            pDphsettar->bouval  = 48-20;
            pDphsettar->durtran = NF45MS;
            //writeTransF (phTTS, "PAP ", pholas);
          }
          // printf ("PAP pDphsettar->durtran %d, pDphsettar->bouval %d\n", 
          //         pDphsettar->durtran, pDphsettar->bouval);
        }
      }
    } // PAP

    // FORWARD SMOOTH:  TLT
    // Tilt parameter jumps to target values near stops and silence
    if (pDphsettar->np == &PTILT) {
      pDphsettar->durtran = NF25MS;
      if (pholas == GEN_SIL) pDphsettar->bouval = pDphsettar->np->tarcur;
      if (pDphsettar->phcur == GEN_SIL) {
        // Reach into par buffer to get actual previous value
        pDphsettar->bouval = pDph_t->parstochip[OUT_TLT];
      }
      // plosives or nasals
      if ( fealas & FOBST || feacur & FOBST ) pDphsettar->durtran = 0;
    }
    
  } // else if

  if (pDphsettar->durtran > pDph_t->durfon)  pDphsettar->durtran = pDph_t->durfon;
  if (pDphsettar->durtran > NF130MS)         pDphsettar->durtran = NF130MS; // < 20 frames
  if (pDphsettar->bouval  < 0)               pDphsettar->bouval  = 0;
  //writeTransF (phTTS, "exit after modification", pholas);

} // fr_forw_smooth_rules



// determine parameters of backward smoothing :
// end of the current phoneme and of the next one.
// bouval and durtran have been calculated by default;
// bouval (boundary value) is the average of tarcur and tarnex
static void fr_back_smooth_rules (LPTTS_HANDLE_T phTTS, short shrib, short feacur,
                    short feanex, short strucnex) {
  PDPH_T         pDph_t     = phTTS->pPHThreadData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;
  short temp;

  //writeTransB (phTTS, "before modification");

  // ========= 
  if (pDphsettar->par_type IS_FORM_FREQ) {   // BACKWARD SMOOTH : F1, F2, F3

    if (feacur & FVOWEL || feacur & TLiqGli) {  // ['V', L, R, W, Y, Wu]

      pDphsettar->durtran = NF45MS;
      if ( (feacur & FVOWEL) && (feanex & TLiqGli)) {
        // ['V'].(L,R,Y,W,Wu)
        // 1. end of A in [A]L or [A]R : vowel-soncon trans, use 75-25%
        pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarnex) >> 1;
        // F3 trans. slower for [R, L]
        if (pDphsettar->np == &PF3) pDphsettar->durtran = NF64MS;
        // First formant jumps down 80 Hz in /L/
        if ( pDphsettar->phonex == FP_L && pDphsettar->np == &PF1 ) pDphsettar->bouval += 80;
      }

      if ((feacur & TLiqGli) && !(feanex & TLiqGli) ) {
        // [L, R, W, Y, Wu] (not L, R, W, Y, Wu)
        // 3. Soncon-vowel trans, use 25-75%
        pDphsettar->bouval = (pDphsettar->bouval + pDphsettar->np->tarend) >> 1;
        pDphsettar->durtran = NF20MS;
      }

      if ((feacur & TLiqGli) && (feanex & TLiqGli) ) {
        pDphsettar->durtran = NF40MS;
        // 4. Soncon-soncon transition : use 50-50; ex : L in [L]R
        //writeTransB (phTTS, "[LigGli](LiqGli)");
     }

      // else nothing :
      // like [A]B, [I]T  : use locus below
      // or [A]OuT        : ['V'] ('V') : use default 50% 50%
      //writeTransB (phTTS, "End of TSonore");
    } // Vowels, liquids or glides


    // No backward smoothing if next phone is silence
    if (pDphsettar->phonex == GEN_SIL) {
      pDphsettar->durtran = 0;

    } else if (!(feacur & TLiqGli)) {  
      //'V', PTKBDG, FSChVZJ, MNGnNg
      if ( setloc (phTTS, (short)(pDph_t->nphone+1), pDph_t->nphone, FINAL, 
           (short)(pDph_t->nphone+2), feanex) ) {
        // phcur=sonor, phonex=obst transition
        // end of A in [A]TOu (Vowel:A; Consonant:T)
        //writeTransB (phTTS, "Use locus ([V]C)");
      } else if ( setloc (phTTS, pDph_t->nphone, (short)(pDph_t->nphone+1), INITIAL, 
           (short)(pDph_t->nphone-1), feanex) ) {
        // phcur=obst, phonex=sonor transition [T]Ou; boundary T and Ou
        //writeTransB (phTTS, "Use locus ([C]V)");
      } else {
        // end of O in B[O]A : [Vowel] (Vowel)
        //writeTransB (phTTS, "Locus does not apply");
      }

      // [Plosives]
      if (feacur & FPLOSV) {  //PTK BDG
        // Transitions take all of plosive duration; end of P in [P]A
        pDphsettar->durtran = pDph_t->durfon;
        //writeTransB (phTTS, "Plosives");
      }

    } // GEN_SIL or not


    //  [vowel, Liqglide, nasal] (vowel, Liqglide)
    //  Shrink or lengthen right transition duration inside a sonorant
    //    unless previous segment is obstruent
    //  ex : F1, F2, F3 of end of A in P[A]L
    if ( !(feacur & FPLOSV) && !(feacur & TFricative) &&
         (begtyp (pDphsettar->phonex) != 4) && (pDphsettar->durtran > 0) ) {
      // PA[L]è; transition between L and è
      //writeTransB (phTTS, "before shrib");
      //printf ("shrib : %d\n", shrib);
      //pDphsettar->durtran = mlsh1 (pDphsettar->durtran, shrib) + 1;
      //writeTransB (phTTS, "after shrib");
    }


  // ========= FN
  } else if (pDphsettar->par_type IS_NASAL_ZERO_FREQ) { // BACKWARD SMOOTH:  FN
    pDphsettar->durtran = 0;

    // [vowels except An, In, On, Un] . (M, N, Gn, Ng)
    // ex: end of A in [A]M
    if ( !(feanex & FVOWEL) &&  (feanex & FNASAL) &&
          (feacur & FVOWEL  || !(feacur & FNASAL) ) ) {
      pDphsettar->bouval  = NASAL_ZERO_BOUNDARY;
      pDphsettar->durtran = NF80MS;
    }


  // ========= B1 B2 B3
  } else if (pDphsettar->par_type IS_FORM_BW) {    // BACKWARD SMOOTH:  B1, B2, B3

    if (feacur & FVOICD) {
      pDphsettar->durtran = NF40MS;
      if (pDphsettar->np == &PB1) {
        // Glottis opens early before -voice C, widen B1
        if ( !(feanex & FVOICD) ) { //ex : B1 end of A in [A]P
          pDphsettar->durtran = NF50MS;
          // More increase for low vowels (F1 high)
          pDphsettar->bouval = pDphsettar->np->tarend + (PF1.tarcur >> 3);
          // Effect is greater for a female voice
          if (pDph_t->malfem == FEMALE) pDphsettar->durtran = NF100MS;
        }
      }
    } else {
      pDphsettar->durtran = NF20MS;
    }

    // B1, B2, B3 : treat boundary with silence
    if (pDphsettar->phonex == GEN_SIL) {
      pDphsettar->bouval  = pDphsettar->np->tarend + (&PB3 - pDphsettar->np) * 50;
      pDphsettar->durtran = NF50MS;
      // ex: end of A in P[A]_
      //writeTransB (phTTS, " B1, B2, B3 []_");
    } else if (pDphsettar->phcur == GEN_SIL) {
      pDphsettar->bouval  = pDphsettar->np->tarnex + (&PB3 - pDphsettar->np) * 50;
      pDphsettar->durtran = NF50MS;
      //writeTransB (phTTS, " B1, B2, B3 [_]");
    }

    //  [].(M, N, Gn, Ng)
    //  B1 widen, to nasalize transition into next nasal
    //  ex : B1, B2, B3 at end of A in [A]M
    if ( !(feanex & FVOWEL) && feanex & FNASAL) {  // [ ] (M, N, Gn, Ng)
      pDphsettar->bouval = pDphsettar->np->tarend;
      if (pDphsettar->np == &PB1) {
        pDphsettar->durtran = NF100MS;
        pDphsettar->bouval += 100;
      } else if ( pDphsettar->np == &PB2 && pDphsettar->phonex == FP_N && 
                  endtyp (pDphsettar->phcur) != 1 ) {
            // B2 of [N] is wider before a non-front vowel
            pDphsettar->bouval += 60;
            pDphsettar->durtran = NF60MS;
      }
    }

    //  [M, N, Gn, Ng]
    //  B1, B2, B3 : nasals have constant bandwidths at target values
    //  end of M in [M]A
    if ( !(feacur & FVOWEL) && feacur & FNASAL ) {  // M, N, Gn, Ng
      pDphsettar->durtran = 0;
    }

  // =========  AV, AP, A2, A3, A4, A5, A6, AB, TL
  } else if ((pDphsettar->par_type IS_PARALLEL_FORM_AMP) || 
             (pDphsettar->par_type IS_AV_OR_AH)) {
    // BACKWARD SMOOTH:  AV, AP, A2, A3, A4, A5, A6, AB, TL

    //  INCREASING
    //  See if onset, i.e. source intensity increasing
    //  AV, AP, A2-A6, TL
    temp = pDphsettar->np->tarnex - 10;
    if (pDphsettar->bouval < temp) {
      pDphsettar->bouval = temp;
      if (pDphsettar->phcur == GEN_SIL) pDphsettar->durtran = NF70MS;
    }

    // AV INCREASING
    // Voicing is special:  onset is abrupt, except if a voiced fric
    if ( pDphsettar->np == &PAV && (pDphsettar->bouval < pDphsettar->np->tarnex) &&
         pDphsettar->phcur != FP_V && pDphsettar->phcur != FP_J && pDphsettar->phcur != FP_Z ) {
      pDphsettar->durtran = 0;

      // Pb with AV of last frame if this is ifdef ex: OPI
      // Voicebar dies out in a voiced plosive
      // end of B in BA or P in PA
      if ( feacur & FPLOSV || pDphsettar->phcur == FP_CH ) {
        if (feacur & FVOICD) {
          pDphsettar->bouval  = pDphsettar->np->tarend - 3;
          pDphsettar->durtran = NF45MS;
        } else {
          // Do not allow prevoicing in a voiceless plosive
          // ex AV for P is 0 even for the last frame
          pDphsettar->bouval = 0;
        }
        if (pDphsettar->durtran > NF130MS)        pDphsettar->durtran = NF130MS;
        if (pDphsettar->durtran > pDph_t->durfon) pDphsettar->durtran = pDph_t->durfon;
        if (pDphsettar->bouval < 0)               pDphsettar->bouval  = 0;
        pDphsettar->np->tbacktr = pDph_t->durfon - pDphsettar->durtran;
        // printf ("phsettar.c back_sm... RETURN pDphsettar->bouval %d, pDphsettar->durtran %d\n",
        //      pDphsettar->bouval, pDphsettar->durtran);
        return;
      }
    }

    // AV for [vowel, LiqGli, B,D,G, V,Z,J, nasal].(M, N, Gn, Ng)
    // If curr phone is voiced and next is nasal, set AV const
    // AV for end of A in AM
    if ( (pDphsettar->np == &PAV) && (feacur & FVOICD) &&
         !(feanex & FVOWEL)       && (feanex & FNASAL) ) {
      pDphsettar->durtran = 0;
      //writeTransB (phTTS, "AV for [voiced].(M, N, Gn, Ng)");
   }

    // AV for <M, N, Gn, Ng>
    //   If curr phone nasal, and next is voiced non-obst, AV const
    //   ex : AV for end of M in [M]A
    if ( pDphsettar->np == &PAV && !(feacur & FVOWEL) && feacur & FNASAL) {
      if ( feanex & FVOICD && !(feanex & FPLOSV) && !(feanex & TFricative) &&
        pDphsettar->phonex != FP_AP) {
        pDphsettar->durtran = 0;   // [M, N, Gn, Ng].('V', LigGli, nasal)
      } else {	// end of Gn in MOnTA[Gn]Ap
        pDphsettar->durtran = NF40MS;
        //writeTransB (phTTS, "AV for [M, N, Gn, Ng].(PTK,FSCh,BDG,VZJ,Ap)");
      }
    }

    // DECREASING: See if offset, i.e. source intensity decreasing
    // AV, AH, A2-A6, TL  Plosive burst does not get attenuated during offset    
    temp = pDphsettar->np->tarend - 10;
    if (feacur & FPLOSV) {
      pDphsettar->durtran = NF15MS;   // Amplitudes at the end of P
      temp = pDphsettar->np->tarend;
    } else if (pDphsettar->phcur == FP_J || pDphsettar->phcur == FP_CH) {
      pDphsettar->durtran = NF15MS;
    }

    if (pDphsettar->bouval < temp) {
      pDphsettar->bouval = temp - 3;
      pDphsettar->durtran = NF20MS;
    }


    // Onset of a vowel from voiceless open vocal tract is breathy
    if (pDphsettar->np == &PAP) {
      if ( pDphsettar->phcur == FP_F || pDphsettar->phcur == FP_S ) {
        if ( feanex & FVOICD && !(feanex & FPLOSV) && !(feanex & TFricative) ) {
          // AP for  [F, S] . (vowel, LiqGli, nasal)
          pDphsettar->bouval  = 52;
          pDphsettar->durtran = NF40MS;
        }
      }

      // AP for ['V']._ (end of clause)
      if ( feacur & FSYLL && (pDphsettar->phonex == GEN_SIL) ) {
        // Offset of a vowel into silence is breathy
        // UG[Au]_, NWu[I]_, InKON[U]_, L[A]_
        pDphsettar->bouval  = 52;       // AP for [vowel sauf FP_AP] . GEN_SIL
        pDphsettar->durtran = NF130MS;
       //writeTransB (phTTS, "AP for end of ['V']._");
      }
    }

    // BACKWARD SMOOTH:  TLT
    // Tilt parameter jumps to target values near stops and silence
    if (pDphsettar->np == &PTILT) {
      pDphsettar->durtran = NF25MS;
      if (pDphsettar->phonex == GEN_SIL) pDphsettar->bouval = pDphsettar->np->tarend;
      if (pDphsettar->phcur  == GEN_SIL) pDphsettar->bouval = pDphsettar->np->tarnex;
      // [].(PTKBDG MNGnNg)
      // [PTKBDG MNGnNg]
      if ( feanex & FSTOP || feacur & FSTOP ) pDphsettar->durtran = 0;
      if ( feacur & FVOICD && !(feacur & FNASAL) ) {
        if (pDphsettar->phonex == GEN_SIL) {   // Long breathy offset into silence
          pDphsettar->bouval  = 15;
          pDphsettar->durtran = NF130MS;
        }
      }

    } // tilt

  } // else if type parameter

  if (pDphsettar->durtran > NF130MS)        pDphsettar->durtran = NF130MS;
  if (pDphsettar->durtran > pDph_t->durfon) pDphsettar->durtran = pDph_t->durfon;
  if (pDphsettar->bouval < 0)               pDphsettar->bouval  = 0;
  pDphsettar->np->tbacktr = pDph_t->durfon - pDphsettar->durtran;
  //writeTransB (phTTS, "exit, after modification");
  //printf ("  \n");

} // fr_back_smooth_rules



// special rules for burst and vot
static void fr_special_rules (LPTTS_HANDLE_T phTTS, short fealas,
                 short feacur,   short feanex, short struclm2,
                 short struccur, short pholas, short struclas) {

  PDPH_T         pDph_t     = phTTS->pPHThreadData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;
  short closure_dur;
  short vot;
  short bdur;

  // SPECIAL RULE 1: Burst duration for plosives
  bdur = burdr (pDphsettar->phcur);      // Look up inher. burst dur in msec in table
  // printf ("phsettar.c special_rules entree pDphsettar->phcur %d, %s\n",
  // pDphsettar->phcur, phprint (pDphsettar->phcur));
  // printf ("phsettar.c special_rules feacur %8x\n", feacur);

  // [PTKBDG].(PTKBGG, MNGnNg)
  // ex : P in [P]M  P and M are FLABIAL; or D in TN (T and N are FALVEL)
  if (feacur & FPLOSV) {
    bdur = mstofr (bdur);    // Convert to frames
    // Don't release burst in homorganic plosiv-nasal & plos-plos sequence
    if ( !(feanex & FVOWEL) && feanex & FNASAL || feanex & FPLOSV ) {
      if (place (pDphsettar->phcur) == place (pDphsettar->phonex)) 
      //UNNA[T]DE (une natte de)
      //printf ("phsettar.c special_rules phcur %s, phonex %s\n",
      //    phprint (pDphsettar->phcur), phprint (pDphsettar->phonex));
      bdur = 0;
    }
    if (bdur > 1) {
      // O[P]TE; O[S]TIL
      if ( (feacur & FPLOSV || feacur & TFricative) && feanex & FPLOSV ) {
        // [PTKBDG].(PTKBDG, MNGnNg)
        // ex: VI[K]TOR
        bdur--;    // Shorten burst before obst by 6 ms
        //printf ("phsettar.c special_rules phcur %s, phonex %s\n",
        //    phprint (pDphsettar->phcur), phprint (pDphsettar->phonex));
      } else if (pDph_t->durfon < NF50MS) {
        bdur--;    // Shorten burst if closure short
      }
    }
#if (defined  FAKE_HLSYN || !(defined HLSYN) )
    if ( pDphsettar->phcur == FP_B ) bdur = 0; // no burst for B
	//eab I claim physiologically impossible
#endif
    closure_dur = pDph_t->durfon - bdur;


    for (pDphsettar->np = &PA2; pDphsettar->np <= &PAB; pDphsettar->np++) {
      // All fric gains to zero during closure
			if(fr_place[pDphsettar->phcur & PVALUE] & FLABIAL)
			{
				PAREAL.tspesh=closure_dur;
				PAREAB.tspesh =0;
				PTONGUEBODY.tspesh=0;
			}
			else if(fr_place[pDphsettar->phcur & PVALUE] & BLADEAFFECTED )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=closure_dur;
				PTONGUEBODY.tspesh=0;
			}
				else if(fr_place[pDphsettar->phcur & PVALUE] & FVELAR )
			{
				PAREAL.tspesh=0;
				PAREAB.tspesh=0;
				PTONGUEBODY.tspesh=closure_dur;
			}
      pDphsettar->np->tspesh = closure_dur;
      pDphsettar->np->pspesh = 0;
      //printf ("phsettar.c special_rules bdur %d, closure_dur %d\n",
      //  bdur, closure_dur);
   
      // Set it once per loop when PAB  ifdef HLSYN Michel  ???????
      if(pDphsettar->np == &PAB) {
        if(fr_place[pDphsettar->phcur & PVALUE] & FLABIAL) {
          PAREAL.     tspesh = closure_dur;
          PAREAB.     tspesh = 0;
          PTONGUEBODY.tspesh = 0;
        } else if(fr_place[pDphsettar->phcur & PVALUE] & BLADEAFFECTED ) {
          PAREAL.     tspesh = 0;
          PAREAB.     tspesh = closure_dur;
          PTONGUEBODY.tspesh = 0;
        } else if(fr_place[pDphsettar->phcur & PVALUE] & FVELAR ) {
          PAREAL.     tspesh = 0;
          PAREAB.     tspesh = 0;
          PTONGUEBODY.tspesh = closure_dur;
        }
      }

    }  // if np == &PAB

  }  // if plosive


  // (PTK).['V', L,R, Y,W,Wu, MNGnNg]
  //   (p, t, k) . <vowel, liquide, glide, nasal>
  //   SPECIAL RULE 2: Voice onset time for aspirated plosives
  //   ex: CAP[Ap], CAP[è]  ("cap est" : 2 words)
  //   P[L]I, P[R]A 
  vot = 0;
  if ( fealas & FPLOSV && !(fealas & FVOICD) && feacur & FSONOR ) {
    PAP.pspesh = 50;      // Amplitude of aspiration in dB
    PAV.pspesh = 0;       // Amplitude of voicing during aspir
    vot = NF20MS;         // 3 frames; Asp dur for /p, t, k/ before stressed sonor
    if (pholas == FP_P) {
      vot = NF15MS;  // 2 frames
      if (feacur &  FVOWEL) PAP.pspesh = 45;  // PAPA, PIPI; not PLI
    } else if (pholas == FP_T) {
       vot = NF15MS;  // 2 frames for TATA
       if (pDphsettar->phcur == FP_I) vot = NF20MS; // 3 frames for TITI
       if (feacur &  FVOWEL) PAP.pspesh = 45; // TATA not TRAu
    }

    //  Aspiration stronger in sonor cons : L in PLI; R in PRA
    //  PWuI, PWIn
    if (feacur & TLiqGli) PAP.pspesh += 5;
    // Vot longer in a sonorant consonant : L in P[L]I, R in P[R]A
    if ( !(feacur & FVOWEL) )  vot += NF20MS;  // T[R]Au
    if (vot >= pDph_t->durfon) vot  = pDph_t->durfon - 1;

    // Vot cannot exceed 1/2 duration of a stressed vowel
    if ( vot > (pDph_t->durfon >> 1) && feacur & FSYLL ) vot = pDph_t->durfon >> 1;

    // CAP[Ap]; AP added in phalloph.c
    if ( pDphsettar->phcur == FP_AP ) {
      vot = pDph_t->durfon;
      PAP.pspesh -= 6;
    }

    PAV.tspesh = vot;
    PAP.tspesh = vot;

    // Widen 1st and 2nd formant bws when glottis open for aspir.
    //    Ex: A in PA during vot; very little effect
    //PB1.tspesh = vot;
    //PB2.tspesh = vot;
    //PB1.pspesh = PB1.tarcur + 250;
    //PB2.pspesh = PB2.tarcur + 70;
  } // if p,t,k followed by sonorant


} // fr_special_rules



#if 0
void print_parameters (LPTTS_HANDLE_T phTTS, short ph) {
  char* phprint (short c);
  PDPH_T pDph_t = phTTS->pPHThreadData;
  int    i;

  printf ("p_fr_st1.c print_parameters : %s\n", phprint (ph) );
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
#endif  // DEBG

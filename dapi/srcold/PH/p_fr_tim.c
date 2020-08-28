/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.
 *      Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.
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
 *    File Name:    p_fr_tim.c
 *    Author:       Matthew Schnee
 *    Creation Date:08-Jun-1996
 *
 *    Functionality:          
 *        English Duration Rules
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------
 * 0001 DK      09/01/1984      Initial creation
 * 0002 DGC     12/27/1984      Modified for the 80186.
 * 0003 DGC     01/02/1985      Added some conditional calls to the "mstofr"
 *                              routine. Some of the conversions from MS to
 *                              frames caused overflow on 16 bit machines.
 * 0004 DK      02/26/1985      [nt] cluster too long
 * 0005 DK      03/18/1985      period pause and comma pause code had a bug
 * 0006 DK      03/25/1985      Let phrase-final lengthening apply to word before prep
 * 0007 DK      04/17/1985      Reduce compound shortening and short-word lengthening
 * 0008 DK      04/23/1985      Word-final fricatives longer
 * 0009 DK      04/25/1985      Final lengthing before preposition only at slow sprate
 * 0010 DK      05/15/1985      Fix [nt] cluster reduction to happen only at word end
 * 0011 DK      05/17/1985      Make word-init stressed vowels longer, final ptk shorter
 * 0012 DK      05/23/1985      Word-initial vowels not quite so short, less vowel
 *                              lengthening induced by postvoc voiced fric
 * 0013 DK      06/20/1985      Fix nasal durs for "pense,pen,pend"
 * 0014 EAB     06/16/1990      Allow speaking rate to 550 word per min. (from 350)
 * 0015 EAB     07/25/1990      ADDED CHANGE TO ALLOW VARIABLE SETTING OF COMMA PAUSE
 *                              FOR NANCY JARRELL OF CHB TO GET IT TO ZERO. NOTE
 *                              -300 SETTING OF COMPAUSE ALLOWS SETTING TO ZERO BUT
 *                              THE CODE HAS NOT BEEN CHECKED FOR ERRORS.
 *
 *              DURATION RULES
 * 0016 EAB     05/03/1993      ADDED NEW PHONE DF TO DIFFERENTIATE T FROM D FLAP
 *                              and added rules to make use of it.
 * 0017 EAB     05/02/1993      restrucutred a bunch of stuff-reduced 
 *                              
 * 0018 EAB     05/02/1993      ADDED PETROCELLI'S NEW DURATION RULES.
 * 0019 MGS     03/25/1996      Merged win 95 code to 42c
 * 0020 MGS     04/01/1996      Added MSDBG statements for debugging
 * 0021 MGS     04/02/1996      made sure all local variable are initialized
 * 0022 MGS     06/06/1996      moved phtiming here.
 * 0023 SIK     07/12/1996      Cleaning up and maintenance
 * 0024 GL      10/30/1996      merge the change from V43 code base.
 * 0025 GL      04/21/1997      BATS#360  remove spaces before "#define" or "#if" 
 * 0026 MGS     08/26/1997      Merged in fasttalk
 * 0027 EAB     09/08/1997      Added in changes to improve fastalk typing and SLOWSPEAK
 * 0028 EAB     10/12/1997      Removed Obsolete prphdurs and prdurs bats 495(performance)
 *                              And improved typing_mode
 * 0029 EAB     04/04/1998      Found problem where stess was modifying aspiration as well as av because it was in
 *                              the wrong place. This had potential of causing other nasty problems. 
 * 0030 EAB     07/13/1998      Found redundant tcumdur code that was not needed. It's calculated
 *                              in phinton1/2 now.BATS 713 tcumdur addition removed
 * 0031 eab     07/22/1998      Modified duration rules to support all levels of reduction on a monosylable
 * 0032 EAB     08/17/1998      Refinfed and added some rules for ENGLISH DECTALK
 * 0033 EAB     09/11/1998      Refinfed and added some rules for ENGLISH DECTALK (ditto)
 * 0034 EAB     02/03/1999      Improved some rules that were compounded to too strong an effct in some place
                                Changed vowcnt to sonocnt becuase we're now wounting sonorants
                                did further tuning to improve stressed timed rythm
 * 0035 EAB     05/26/1999      BATS 894 Inter vocalic the are no longer flapped for better articualtion but
                                the timing rule of American English still needs to fire.
 * 0036 EAB     07/09/1999      BATS 905 and 906 for NWS_NOAA
 * 0037 EAB     04/17/2000      Tuned some paramters for 4.6 release
 * 0037 MGS     04/13/2000      Changes for integrated phoneme set 
 * 0038 NAL     04/18/2000      Change for integrated phoneme set
 * 0039 CJH     07/20/2000      French added.
 * 0040 EAB     09/30/2000      FIxed masking problem with syll_synt
 * 0041 CAB     10/16/2000      Added copyright info
 * 0042 MGS     01/18/2001      Removed arg1 arg2 and arg3 from calculations
 * 0042 CAB     01/17/2001      Merged Michel Divay changes for French
 * 0043 CAB     01/22/2001      1. Fixed compile error by correcting comment 
 *                              2. Fixed compile error by removing {} from if 
 * 0044 MGS     01/25/2001      Fixed targets so it speaks.  Fixed speaking rate.
 * 0045 CAB     02/09/2001      Added changes by Michel for French
 * 0046 CAB     02/13/2001      Removed define for phprint
 * 0047 CAB     03/21/2001      Changes by Michel, addef #if DEBG and eliminate version2
 */  
	 
//extern __inline short phone_feature(PDPH_T pDph_t, int phone);
extern __inline short place(int phone); 

extern int inh_timing(LPTTS_HANDLE_T phTTS, int phone);
extern int min_timing(LPTTS_HANDLE_T phTTS, int phone);

//#define dbgdur 0
//#define DEBG   0
char*   phprint (short c);


// Is nphon+n a word boundary?; n is positive or negative
int FMot (PDPH_T pDph_t, short nphon, int n) {
    short Num = nphon + n;
    if ( (Num>=0) && (Num<pDph_t->nallotot) ) {
      return (pDph_t->allofeats[Num] & FMOT);
    } else {
      return (FALSE);
    }
}  // FMot


// Number of syllabes in the word beginning at nphon
short F1_NbSyll (PDPH_T pDph_t, short nphon) {
  short NbS = 0;
  short i   = nphon;

  do {
    if ( phone_feature(pDph_t, pDph_t->allophons[i]) & FSYLL ) NbS++;
    i++;
  } while ( !(pDph_t->allofeats[i] & FMOT) && i<pDph_t->nallotot);

#ifdef DEBG
    if (dbgdur) printf ("p_fr_tim.c F1_NbSyll()  NbS=%d\n", NbS);
#endif

  return NbS;
}  // F1_NbSyll


void regle (short phocur, char* mes) {
#ifdef DEBG
    if (dbgdur) printf ("p_fr_tim.c  regle() %2s %s\n",
        phprint (phocur), mes);
#endif
}


//  Lengthen consonants at the end of a clause
//  Modify PCent (adding or multiplying) 
//  Ex: B of aube. or S T R of astre.
//  (at the end of a clause: before comma or period) 
short Allonge_Cons_Finale (PDPH_T pDph_t, short Seg_Prec, short Cons, short pcnt) {
    //printf ("Allonge_Cons_Finale cons %d %x\n", Cons, Cons);

#ifdef DEBG
    if (dbgdur) printf ("p_fr_tim.c  Allonge_Cons_Finale entree %2x [%2x] pcnt = %d\n",
      phprint (Seg_Prec), phprint (Cons), pcnt);
#endif

  switch (Cons & PVALUE) {
  case F_F: case F_S: case F_CH:
  case F_P: case F_T: case F_K:
    pcnt = mlsh1 (pcnt, N135PRCNT);  //NEuF, LIS, LèCh, BOT, BAK, BIP
    regle (Cons, "Allonge_Cons_Finale F_F F_S F_CH F_P F_T F_K  1.35");
    break;
  case F_R:
    pcnt = mlsh1 (pcnt, N105PRCNT);  // R of ARK. or of MAR
    regle (Cons, "Allonge_Cons_Finale F_R  1.05");
    break;
  case F_L:
    pcnt = mlsh1 (pcnt, N130PRCNT);  // BO[L], SO6[L]
    regle (Cons, "Allonge_Cons_Finale F_L pcnt  1.30");
    break;
  case F_M: case F_N: case F_GN: case F_NG:
    pcnt = mlsh1 (pcnt, N120PRCNT);  // RU[M]., PA[Gn].
    regle (Cons, "C2 Allonge_Cons_Finale F_M F_N F_GN F_NG  1.20");
    break;
  case F_V: case F_Z: case F_J:
    pcnt = mlsh1 (pcnt, N120PRCNT);  // BI[Z]. rè[V].
    regle (Cons, "Allonge_Cons_Finale F_V F_J F_Z pcnt 1.20");
    
    if( phone_feature (pDph_t, Seg_Prec) & FNASAL) {
      //|| phone_feature (pDph_t, Seg_Prec) & TArrondie)  // delete TArrondie
      if (Cons == FP_J) {
        pcnt -= PCent15; // RAn[J]., ROu[J].
        regle (Cons, "Allonge_Cons_Finale F_J  -%15");
      } else {
        pcnt += PCent20; // BOn[Z]., BU[V].
        regle (Cons, "Allonge_Cons_Finale F_V F_Z +%19");
      }
    }
    break;
  case F_B: case F_D: case F_G:     // Au[B]. or I[D]R.
    pcnt = mlsh1 (pcnt, N120PRCNT); // GRO[G].
    regle (Cons, "Allonge_Cons_Finale F_B F_D F_G  1.20");
    break;
  case F_W: case F_WU: case F_Y:
    pcnt = mlsh1 (pcnt, N140PRCNT); // FI[Y].
    regle (Cons, "Allonge_Cons_Finale F_W F_WU F_Y  1.40");
    break;
  }  // switch

#ifdef DEBG
  if (dbgdur) {
    printf ("p_fr_tim.c  Allonge_Cons_Finale()  sortie pcnt= %d\n", pcnt);
  }
#endif

  return pcnt;
}  // Allonge_Cons_Finale




void fr_phtiming (LPTTS_HANDLE_T phTTS) {
  PDPH_T         pDph_t     = phTTS->pPHThreadData;
  PKSD_T         pKsd_t     = phTTS->pKernelShareData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;

  short pcnt;
  extern short fr_inhdr[];

#define NbSyll_Phrase_Courte  6
#define Duree_Min_Syll        45
#define Fact_Elongation       PCent6

  FLAG  Mot_Accentue   = TRUE;
  FLAG  Fin_Groupe     = FALSE;
  FLAG  DerAcc         = FALSE;
  FLAG  Phrase_Courte;
  short nphon;
  short Raise              = FALSE;
  short Syll_Mot           = 0;
  short Syll_Mot_Restantes = 0;
  short Syll_Phrase_Restantes;
  short Syll_Synt_Restantes;
  short PCent_Elongation;     // lengthen short sentence
  short D_Base;               // Inherent duration of the phoneme
  short SegG3;
  short SegG2;
  short SegD2;
  short SegD3;

  short pholas = GEN_SIL;
  short phocur = 0;

#ifdef DEBG
    if (dbgdur) printf ("p_fr_tim.c  phtiming  entree pDph_t->NbSyllabes = %d\n",
                        pDph_t->NbSyllabes);
#endif

  init_timing (phTTS); // for speech rate

  pDph_t->tcumdur = 0;

  if (pDph_t->NbSyllabes < NbSyll_Phrase_Courte ) {
    Phrase_Courte    = TRUE;
    PCent_Elongation = (NbSyll_Phrase_Courte-pDph_t->NbSyllabes) * Fact_Elongation;
  } else {
    Phrase_Courte    = FALSE;
    PCent_Elongation = 0;
  }

  Syll_Synt_Restantes   = (pDph_t->allofeats [0] & 0xFFFF) >> 8;  // Lg 1st clause
  Syll_Phrase_Restantes = pDph_t->NbSyllabes - Syll_Synt_Restantes;

#ifdef DEBG
  if (dbgdur) {
    printf ("p_fr_tim.c  phtiming  PCent_Elongation %d\n", PCent_Elongation);
    printf ("p_fr_tim.c  phtiming  pDph_t->nallotot %3d\n", pDph_t->nallotot);
  }
#endif


  for (nphon=0; nphon<pDph_t->nallotot; nphon++) {
    if (nphon-3>=0) SegG3   = pDph_t->allophons [nphon-3]; else SegG3  = GEN_SIL;
    if (nphon-2>=0) SegG2   = pDph_t->allophons [nphon-2]; else SegG2  = GEN_SIL;
    if (nphon-1>=0) pholas  = pDph_t->allophons [nphon-1]; else pholas = GEN_SIL;
    phocur =  pDph_t->allophons[nphon];
    if (nphon+1<pDph_t->nallotot) {
      pDphsettar->phonex_timing = pDph_t->allophons [nphon+1]; 
    } else {
      pDphsettar->phonex_timing = GEN_SIL;
    }
    if (nphon+2<pDph_t->nallotot) SegD2  = pDph_t->allophons [nphon+2]; else SegD2 = GEN_SIL;
    if (nphon+3<pDph_t->nallotot) SegD3  = pDph_t->allophons [nphon+3]; else SegD3 = GEN_SIL;

#ifdef DEBG
    if (dbgdur) {
      printf ("\n\n--->  %2s\np_fr_tim.c  phtiming  nphon %3d, phocur %2x\n",
              phprint (phocur), nphon, phocur);
    }
#endif

    if (FMot (pDph_t, nphon, 0) ) {   // word or clause boundary
      Raise = (pDph_t->allofeats [nphon] & RAISE) >> 6;

#ifdef DEBG
        if (dbgdur) {
          printf ("p_fr_tim.c  phtiming  word or clause boundary Raise %d, pDph_t->allofeats [nphon]=  %4x\n",
                   Raise, pDph_t->allofeats [nphon]);
        }
#endif

      if ( pDph_t->allofeats [nphon] & FSYNT ) {  // clause boundary
        Syll_Synt_Restantes    = (pDph_t->allofeats [nphon] & 0xFFFF) >> 8;
        Syll_Phrase_Restantes -= Syll_Synt_Restantes;
#ifdef DEBG
        if (dbgdur) printf ("******* Clause boundary  Syll_Synt_Restantes %d\n", 
                             Syll_Synt_Restantes);
#endif
      } else {  // Word boundary
        Fin_Groupe   = (pDph_t->allofeats[nphon] & FGROU) >> 4;
#ifdef DEBG
        if (dbgdur) printf ("Fin Groupe %d\n", Fin_Groupe);
#endif
        Mot_Accentue = (pDph_t->allofeats[nphon] & ACCEN)  >> 3;
        DerAcc       = (pDph_t->allofeats[nphon] & DERACC) >> 5;
        Syll_Mot     = F1_NbSyll (pDph_t, nphon);
        Syll_Mot_Restantes = Syll_Mot;
      }
    } // word or clause boundary

#ifdef DEBG
    if (dbgdur) printf ("  Syll_Mot_Restantes %d, Syll_Synt_Restantes %d\n",
                           Syll_Mot_Restantes,    Syll_Synt_Restantes);
#endif
    if (pDph_t->user_durs[nphon] != 0) {
      pDphsettar->durxx = mstofr (pDph_t->user_durs [nphon] + 4);
    } else {

      pcnt   = PCent100;
      D_Base = inh_timing (phTTS, phocur);

#ifdef DEBG
        if (dbgdur) printf ("p_fr_tim.c  phtiming()  D_Base %3d\n", D_Base);
#endif

      switch (phocur & PVALUE) {

      case F_AP:
        pDphsettar->durxx = D_Base;
        break;

      case GEN_SIL & PVALUE :  // pDphsettar->durxx : number of frames
        if (pDph_t->allofeats [nphon] & FPROP) { // end of the sentence
          pDphsettar->durxx =  pDph_t->nfperiod + pDph_t->perpause;  // phdefs.h 75 frames
        } else {
          pDphsettar->durxx = pDph_t->nfcomma + pDph_t->compause;  // 16 frames
        }
		//this code is to crush a phrase of silence sent by tv raman so
		//that the screen reader doesn't go slower than heck
        if (pDphsettar->durxx < NF64MS) pDphsettar->durxx = NF64MS; // 10 frame minimum
		if(nphon <= 1)
			pDphsettar->durxx = 1;
		if((pDph_t->allophons[nphon-1] & PVALUE) == 0)
				pDphsettar->durxx = 1;

        break;

      case F_A:  case F_A3: case F_E2: case F_AN:
      case F_AU: case F_E1: case F_EU: case F_I:
      case F_E:  case F_IN: case F_O:  case F_O6:
      case F_ON: case F_OU: case F_U:  case F_UN:
/*
        // [vowel].(End of word)  or [vowel].(vowel)
        if (FMot (pDph_t, nphon, 1)) {
          // D[Au]_, BO[A]_, BRU[An]_
          regle (phocur, "[vowel].(End of word), coeff: 1");
        } else if (phone_feature (pDph_t, pDphsettar->phonex_timing) & FVOWEL ) {
          // B[O]A, BR[U]An
          regle (phocur, "[vowel].(vowel), coeff: 1");

        } else {

          FLAG Voy_Ouverte = FALSE;    // True if low vowel
          // open vowel; was a feature TOuverte before
          if (phocur == FP_A  || phocur == FP_A3 || phocur == FP_O ||
              phocur == FP_O6 || phocur == FP_AN || phocur == FP_ON) {
            Voy_Ouverte = TRUE;
          }

#ifdef DEBG
          if (dbgdur) {
            printf ("p_fr_tim.c  phtiming()  D_Base %d\n", D_Base);
            printf ("p_fr_tim.c  pcnt %d, Voy_Ouverte %d\n",
                     pcnt, Voy_Ouverte);
          }
#endif

          if ( phone_feature (pDph_t, phocur) & FNASAL ) {
            // [An,In,On,Un].(Consonant)    Vowels or EOW processed before
            if ( !(phone_feature(pDph_t, pDphsettar->phonex_timing) & FPLOSV) 
                || phone_feature(pDph_t, pDphsettar->phonex_timing) & FVOICD ) {
              // [An,In,On,Un].(fricatives, nasals, B, D, G, L, R, W, Wu, Y)
              if (FMot (pDph_t, nphon, 2) || SegD2 == FP_AP) {
                // t[On]B or T[On]BAp, m[AN]j, l[ON]j, b[ON]z, v[AN]v
                pcnt += PCent15;  // this rule is not very effective
                regle (phocur, "[An,In,On,Un].(not plosive or voiced plosive).(EOW or Ap):+15%");
              }
            }
          } else {  // not nasal vowels

            switch (pDphsettar->phonex_timing & PVALUE) {

#if 0
            case F_R:
              if (!FMot (pDph_t, nphon, 2) && phone_feature(pDph_t, SegD2) & FVOWEL ) {
                if (Voy_Ouverte) { // A, A3, O, O6
                  // J[A]RIVRE2, DEM[O6]RE1, F[O]RE2, DE[O]RAp
                  pcnt += PCent10;
                  regle (phocur, "[A,A3,O,O6].(R).(Vowel in the same word): +10%");
                } else {
                  // S[E]RA, MARCh[E]RE2, REGARD[E]RE2 
                  pcnt += PCent15; 
                  regle (phocur, "[vowel except A,A3,O,O6].(R).(Vowel in the same word): +15%");
                }
              }
              break;
#endif

            case F_P: case F_T: case F_K:
              if (Voy_Ouverte) {  // nasal vowels already processed
                pcnt -= PCent10; // VW[A]TU, M[A]TAn, D[A]T
                regle (phocur, "[A,A3,0,06].(P,T,K).  -10%");
              }
              break;

            case F_L:
              if (!FMot (pDph_t, nphon, 2)) {
                if ( !(phone_feature(pDph_t, SegD2) & FVOICD) ) {
                  // [A]LP, [A]LTITUD, SK[A]LPE1
                  pcnt += PCent10;
                  regle (phocur, "[vowel].(L).(Not End of word and not voiced:PTK, FSCh) +10%");
                }
              }
              break;

            case F_V: case F_J: case F_Z:
              // R[E2]V, R[OU]JATR, JAR[I]VERE2 
              // not KRW[A]ZE1
              pcnt += PCent15;
              regle (phocur, "[vowel].(V,J,Z)  +15%");
              break;

            case F_W: case F_WU: case F_Y:
              if (Voy_Ouverte) {
                if ( FMot (pDph_t, nphon, 2) || phone_feature(pDph_t, SegD2) & FVOICD ) {
                  // V[O6]Y, [A]Y, [A]Y06R
                  pcnt += PCent20;
                  regle (phocur, "[A,A3,O,O6,An].(W,Wu,Y).(End of Word or voiced) +20%");
                }
              }
              break;

            }  // switch
          }  // nasals or not

        } // if vowel not followed by a space or another vowel

        switch (pholas) { // depend on the preceding phoneme
        case FP_W:
          if (phocur == FP_A) {
            // SW[A]R, MW[A], VW[A]L, VW[A]R, KRW[A]ZE1
            pcnt -= PCent20;
            regle (phocur, "(W).[A] -20%");
            if (SegG2 == FP_T || SegG2 == FP_S) {
              // TW[A], ASW[A]RAp
              pcnt -= PCent10;
              regle (phocur, "(T,S).(W).[A] -10%");
            }
          }
          break;
        }
*/

#ifdef DEBG
          if (dbgdur) printf ("p_fr_tim.c  section vowel  sortie pcnt %d\n", pcnt);
#endif

        Syll_Mot_Restantes--;
        Syll_Synt_Restantes--;

        // Modifications for stressed or unstressed vowels depending on 
        // the remaining number of vowels in the clause or in the word
        if (!Mot_Accentue) {
          // unstressed word : reduce the vowel
          pcnt = mlsh1 (pcnt, N70PRCNT);
          regle (phocur, "Unstressed vowel 0.70");

        } else if (Syll_Synt_Restantes == 0) {
          // Last vowel of the clause (word stressed)
          if ( (phocur != FP_E) && (phocur != FP_AP)) {
            if (FMot (pDph_t, nphon, 1)) {
              // phocur = last vowel in clause (no consonant after) ex: ser[A]
              if (phocur == FP_E1 || phocur == FP_E2 || phocur == FP_U) {
                // PAnS[E1]. KRWAZ[E1], COURB[E1], FOR[E2]. JARIVR[E2]
                // INKON[U], VWAT[U]
                pcnt = mlsh1 (pcnt, N140PRCNT);
                regle (phocur, "[E1, E2, U], last vowel in clause (no consonant after) 1.40");
              } else {
                pcnt = mlsh1 (pcnt, N120PRCNT);
                regle (phocur, "Last vowel in clause (no consonant after) 1.20");
              }
            } else {
              // last vowel in clause, but consonants after
              // L[Au]B, T[On]B
              pcnt = mlsh1 (pcnt, N120PRCNT);
              regle (phocur, "Last vowel of the clause but consonants after 1.20");
            }
          }

        } else if (Syll_Mot_Restantes == 0) {
          // the last vowel of a stressed word (unstressed is already processed)
          // but not the last word of the clause
          // default coeff : 1 //BLAnCh[I] A LA CHAu
          regle (phocur, "The last vowel of the word coeff: 1");
        } else {
          // a vowel but not the last vowel of a word
          // [Au]KUn, [In]KONU, [A]RFLO6R
          // D[E]MIn, BL[An]ChI
          pcnt = mlsh1 (pcnt, N75PRCNT);
          regle (phocur, "Not the last vowel of a word 0.75");
        }
#ifdef DEBG
        if (dbgdur) printf ("p_fr_tim.c End of a vowel (stressed or not) : pcnt : %d\n", pcnt);
#endif
      break; // vowels


      case F_B:  case F_D:  case F_CH: case F_F: case F_G:
      case F_GN: case F_J:  case F_K:  case F_L: case F_M:
      case F_N:  case F_NG: case F_P:  case F_R: case F_RX:
      case F_S:  case F_T:  case F_V:  case F_W: case F_WU:
      case F_Y:  case F_Z:

          // depending on the following phoneme
          switch (phocur & PVALUE) {
          case F_P:
            switch (pDphsettar->phonex_timing & PVALUE) {
            case F_L: // [P]LU, KOnTAn[P]LASYOn
              pcnt = mlsh1 (pcnt, N90PRCNT);
              regle (phocur, "[P].(L)  0.90");
              break;
            }
          break;
          case F_T:
            switch (pDphsettar->phonex_timing & PVALUE) {
            case F_AN: // MA[T]An, LOn[T]An, AnT[An]DR
              pcnt = mlsh1 (pcnt, N120PRCNT);
              regle (phocur, "[T].(An)  1.20");
            break;
            case F_R: // ME2[T]RE2, [T]RIST
              pcnt = mlsh1 (pcnt, N70PRCNT);
              regle (phocur, "[T].(R)  0.70");
            break;
            }
          break;
          case F_K:
            switch (pDphsettar->phonex_timing & PVALUE) {
            case F_S: case F_T: // FI[K]SE1, VI[K]TOR
              pcnt = mlsh1 (pcnt, N70PRCNT);
              regle (phocur, "[K].(S,T)  0.70");
            break;
            case F_AN: case F_O: // [K]AnPAGn, [K]OM, In[K]ONU
              pcnt = mlsh1 (pcnt, N120PRCNT);
              regle (phocur, "[K].(An,O)  1.20");
            break;
            }
          break;

          case F_D:
            switch (pDphsettar->phonex_timing & PVALUE) {
            case F_R: // AnTAn[D]R
              pcnt = mlsh1 (pcnt, N70PRCNT);
              regle (phocur, "[D].(R)  0.70");
            break;
            }
          break;

          case F_S: case F_Z:
            switch (pDphsettar->phonex_timing & PVALUE) {
            case F_E1: // PAn[S]E1, KRWA[Z]E1
              pcnt = mlsh1 (pcnt, N120PRCNT);
              regle (phocur, "[S,Z].(E1)  1.20");
            break;
            case F_T: // TRI[S]T
              pcnt = mlsh1 (pcnt, N70PRCNT);
              regle (phocur, "[S].(T)  0.70");
            break;
            }
          break;
          }


        // Modify consonant duration depending on the position in the word 
        // and in the clause
        if (!Mot_Accentue) { // word not stressed: reduced every consonant
          pcnt = mlsh1 (pcnt, N80PRCNT);
          regle (phocur, "Unstressed consonant 0.80");

        // Stressed word
        } else if (Syll_Synt_Restantes == 1) {
          // consonant(s) in the syllable before the last one in the clause
          // default coeff = 1 // DE[M]In, MA[T]An, BLAn[Ch]I
          regle (phocur, "The consonant(s) before the last vowel of clause 1.00");
        } else if (Syll_Mot_Restantes == 1) {
          // consonant(s) in the syllable before the last one in the word
          // default coeff = 1 // BLAn[Ch]I, [V]WAR
         pcnt = mlsh1 (pcnt, N90PRCNT);
         regle (phocur, "The consonant(s) before the last vowel of a stressed word 1.00");
        } else if (Syll_Synt_Restantes == 0) {
          // The last consonant(s) of the clause (word stressed)
          // LAu[B]
          pcnt = Allonge_Cons_Finale (pDph_t, pholas, phocur, pcnt);
        } else if (Syll_Mot_Restantes == 0 ) {
          // The final consonant(s) of the word, but not of the clause
          // default coeff = 1 // A[STR]
          regle (phocur, "The final consonant(s) of the word 1.00");
        } else if (FMot (pDph_t, nphon, 0)) {
          // word begins by this consonant
          pcnt = mlsh1 (pcnt, N90PRCNT); // [K]RWAZE1, [S]ERA
          regle (phocur, "The first consonant of the word 0.90");
        } else { 
          // Not the first nor the final consonant(s) of the word
          pcnt = mlsh1 (pcnt, N80PRCNT); // K[R]WAZE1 or KR[W]AZE1
          regle (phocur, "Not the first nor the final consonant(s) of the word 0.80");
        }

#ifdef DEBG
        if (dbgdur) printf ("End of a consonant section pcnt : %d\n", pcnt);
#endif

        break; // consonant
      }  // switch vowel or consonant



      // =============== Now for vowel or consonant, except GEN_SIL

      if (phocur != GEN_SIL) {    // already in frames for GEN_SIL

#if 0
        // End of a group, but not at the end of the clause
        if (Fin_Groupe && (Syll_Mot_Restantes==0) && (Syll_Synt_Restantes != 0)) {
          if ( phone_feature (pDph_t, phocur) & FVOWEL ) {
            /* Last vowel in a group : ...['V', not F_E]. (_, 'C') */
            if (phocur != F_E) {
              pcnt = mlsh1 (pcnt, N105PRCNT);
              regle (phocur, "Last vowel of a group  1.05");
            }
          } else { /* Last consonants of a group : ...'V' ['C']._ */           
            if ( phone_feature (pDph_t, phocur) & FPLOSV ) { //'V'.[P,T,K,B,D,G]._
              if ( (phone_feature (pDph_t, pholas) & FVOWEL) && 
                   FMot (pDph_t, nphon, 1) ) {
                pcnt = mlsh1 (pcnt, N120PRCNT);
                regle (phocur, "Last consonant (plosives) of a group  1.20");
              }
            } else if ( (phone_feature (pDph_t, pholas) & FVOWEL) && 
                        FMot (pDph_t, nphon, 1) ) {
              pcnt = mlsh1 (pcnt, N105PRCNT); // 'V'.['C except plosives']._
              regle (phocur, "Last consonant of a group  1.05");
            }
          }
        } else if (Raise && (Syll_Synt_Restantes != 0)) { 
          // last of several stressed words
          //  last vowel or consonant of a group of stressed word (A:accentué)
          //  le peti(A) chA(A) de
          if (FMot (pDph_t, nphon, 1) ) {
            pcnt = mlsh1 (pcnt, N105PRCNT);
            regle (phocur, "Raise  1.05");
          }
        }
#endif

        if (pcnt<0) pcnt = 0; // duration in ms
        pDphsettar->durxx = muldv (D_Base, pcnt, PCent100);

#ifdef DEBG
        if (dbgdur) {
          printf ("p_fr_tim.c  phtiming()  pcnt %d, pDphsettar->durxx %d\n",
                   pcnt, pDphsettar->durxx);
        }
#endif

        // duration depending on speech rate (in ms)
        //printf ("pDphsettar->durxx 1 %d\n", pDphsettar->durxx);
        pDphsettar->durxx = mlsh1 (pDphsettar->durxx, pDphsettar->sprat1);
        //printf ("pDphsettar->durxx 2 %d\n", pDphsettar->durxx);

#if 0
        if (Phrase_Courte) {   // Lengthen short sentence
          // Michel : duration too long for short clause; better without
          pDphsettar->durxx = muldv (pDphsettar->durxx, PCent100 + PCent_Elongation, PCent100);

#ifdef DEBG
          if (dbgdur) {
            printf ("p_fr_tim.c  phtiming() Phrase_Courte pDphsettar->durxx %d\n", 
                     pDphsettar->durxx);
          }
#endif
        }
#endif

        // convert in frame of 6.4 ms
        pDphsettar->durxx = ((pDphsettar->durxx * 10) + 50) >> 6;

      } // if (phocur != GEN_SIL)
    } // if user_durs [nphon] != 0

#ifdef DEBG
      if (dbgdur) {
        printf ("p_fr_tim.c  %2s ", phprint (phocur));
        printf ("p_fr_tim.c  pDphsettar->durxx (frames) = %4d\n", pDphsettar->durxx);
        //printf ("%2s : %3d\n", 
        //         phprint (phocur & PVALUE), (short) ((float)pDphsettar->durxx*6.4));
      }
#endif

    pDph_t->allodurs[nphon]  = pDphsettar->durxx;
    pDph_t->longcumdur      += pDphsettar->durxx;

  } // for (nphon=0; nphon<pDph_t->nallotot; nphon++)

} // phtiming


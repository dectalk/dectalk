/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *
 *     U.S. Government Rights: Consistent with FAR 12.211 and 12.212, 
 *     Commercial Computer Software, Computer Software Documentation, 
 *     and Technical Data for Commercial Items are licensed to the U.S. 
 *     Government under vendor's standard commercial license.
 *
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    ph_fr_inton2.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    FUNDAMENTAL FREQUENCY RULES
 *
 *********************************************************************** */
 
 /***********************************************************************
 *    Revision History:
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 MD		11/20/2000		Created file
 * 0002	CAB		01/24/2001		Commented out begtyp
 * 0003	CAB		02/09/2001		Added additional changes by Michel
 * 0004 CAB		02/13/2001		Modified phprint
 * 0005  CAB		03/21/2001		Changes by Michel
 * 0006  MGS		03/27/2001		Fixed spaces before #ifdef...
*/ 


#include "ph_def.h"

#define ON_TOP_OF_HAT    1


extern short *featb;
#define phone_feature(a,b) (all_featb[(b)>>8][(b)&0x00ff])

#ifdef DEBUGFRENCH
char*  phprint (short c);
#endif


static void make_f0_command (LPTTS_HANDLE_T phTTS,short type, short rulenumber, 
                     short tar, short delay, short length, short *psCumdur, short nphon);

// Number of vowels in the word from nphon included
short F_Nb_Syll (PDPH_T pDph_t, short nphon) {
  short NbS = 0;
  short i   = nphon;

  do {
    if (phone_feature (pDph_t, pDph_t->allophons [i]) & FSYLL) NbS++;
    i++;
  } while ( !(pDph_t->allofeats[i] & FMOT) && i<(pDph_t->nallotot));

  //printf ("ph_fr_inton2.c F_Nb_Syll()  nphon=%d, phoneme:%s, NbS=%d\n",
  //         nphon, phprint (pDph_t->allophons [nphon]), NbS);

  return NbS;
}  //  F_Nb_Syll


// print the rule for debug
static void regle (short phocur, char* mes) {
  //printf ("p_fr_inton2.c  regle() %s %s\n", phprint (phocur), mes);
}

void fr_phinton (LPTTS_HANDLE_T phTTS) {
  PKSD_T         pKsd_t     = phTTS->pKernelShareData;
  PDPH_T         pDph_t     = phTTS->pPHThreadData;
  PDPHSETTAR_ST  pDphsettar = pDph_t->pSTphsettar;

  // Stress-related rise/fall amount in Hz*10 for first, 
  // second, ... accent in a phrase
#define NB_PH_POS 6  // Number of values in f0_mphrase_position
  short f0_mphrase_position [NB_PH_POS]   = {30,   0, 65,  0, 50, 45};
  //short f0_mphrase_position [NB_PH_POS] = {30,  40, 65, 60, 50, 45};
  //short f0_fphrase_position [NB_PH_POS] = {40,  50, 70, 70, 60, 55};
  //short f0_mphrase_position[NB_PH_POS]   = {210, 90, 60, 40, 0 };

  // f0 rise as f(stress-level)
  // Order is                 unstr,     primary,   secondary, emphasis
  //                          FNOSTRESS, FSTRESS_1, FSTRESS_2, FEMPHASIS
  short f0_stress_level [] = {30,        120,       80,       281 };
  short nphon     = 0;   // phone number for the loop and arrays
  short phocur    = 0;   // current phone
  short struccur  = 0;   // current phone structure features (allofeat)
  short strucnex  = 0;   // next phone structure features (FMOT, FSYNT,etc.))
  short feacur    = 0;   // current phone features (FSYLL, FVOICD, etc.)
  short targf0    = 0;   // target of the next f0 event (Step, impulse, etc.)
  short delayf0   = 0;   // delay in frame of the next event from the beginning of the phone
  short f0fall    = 0;   // Extra fall below baseline at end of clause

  FLAG  Mot_Accentue;        // word stressed or not (ACCEN)
  FLAG  Dernier_Mot_Acc;     // Last stressed word in the sentence (DERACC)
  FLAG  Raise;               // Last stressed in a serie of stressed words (RAISE)
  FLAG  Fin_Groupe;          // End of a syntagme (FGROU)
  short Syll_Mot;            // Nb of syllables in the word
  short Syll_Synt;           // Nb of syllables in the syntagme (clause)
  short Syll_Mot_Restantes;  // Nb of syllables left in the word
  short Syll_Synt_Restantes; // Nb of syllables left in the clause (syntagme)
  short inputscrewup  = 0;   // inputscrewup = FALSE; (f0 user specified value incorrect)
  short mf0           = 0;   // if f0 is specified by the user
  short cumdur        = 0;   // time of last event in frame

  Syll_Synt           = (pDph_t->allofeats [0] & 0xFFFF) >> 8;
  Syll_Synt_Restantes = Syll_Synt;
  pDph_t->hatpos      = AT_BOTTOM_OF_HAT; // by default, at the beginning of the clause
  pDph_t->nf0tot      = 0;                // number of events in f0tim[] and f0tar[]
  pDphsettar->hat_loc_re_baseline = 0;
  pDphsettar->nrises_sofar        = 0;

  //printf ("phinton.c phinton before main loop   Syll_Synt %d\n", Syll_Synt);

  // MAIN LOOP, for each output phoneme
  for (nphon = 0; nphon < pDph_t->nallotot; nphon++) {

    phocur    = pDph_t->allophons [nphon];
    struccur  = pDph_t->allofeats [nphon];
    feacur    = phone_feature (pDph_t, phocur);

    if (nphon < (pDph_t->nallotot - 1)) {
      strucnex = pDph_t->allofeats [nphon + 1];
    } else {
      strucnex = 0;
    }

    //if (struccur & FMOT) printf ("\n");  // New word
    //printf ("ph_fr_inton2.c phinton()  nphon : %3d, %s\n",
    //         nphon, phprint (phocur) );

    if (struccur & FMOT) {  // word or clause boundary

      if (struccur & FSYNT) {  // new clause
        Syll_Synt = (struccur & 0xFFFF) >> 8;
        Syll_Synt_Restantes = Syll_Synt;
        // printf ("ph_fr_inton2.c phinton()  FSYNT Syll_Synt %d\n", Syll_Synt);

      } else  { // new word

        Mot_Accentue      = (struccur & ACCEN)  >> 3;
        Fin_Groupe        = (struccur & FGROU)  >> 4;
        Dernier_Mot_Acc   = (struccur & DERACC) >> 5;
        Raise             = (struccur & RAISE)  >> 6;

        if (Mot_Accentue) {
          Syll_Mot           = F_Nb_Syll (pDph_t, nphon);
          Syll_Mot_Restantes = Syll_Mot;
        }

        //printf ("ph_fr_inton2.c phinton()  Dernier_Mot_Acc %d, Mot_Accentue %d, Fin_Groupe %d\n",
        //           Dernier_Mot_Acc, Mot_Accentue, Fin_Groupe);
        //printf("ph_fr_inton2.c phinton() Syll_Mot : %d\n", Syll_Mot);

      } // clause or word
    } // word or clause boundary
 
    // User-specified commands for phoneme f0 targets or singing
    if ((pDph_t->f0mode == PHONE_TARGETS_SPECIFIED) ||
        (pDph_t->f0mode == SINGING)) {
      if (pDph_t->user_f0 [nphon] != 0) {
        regle (phocur, "f0 SINGING");
        make_f0_command (phTTS, USER, 0, (short)(2000 + pDph_t->user_f0 [nphon]), 
                         0, 0, &cumdur, nphon);
      }

    } else if ((pDph_t->f0mode == NORMAL) || 
               (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)) {
      if ( (feacur & FSYLL) && Mot_Accentue) {
        // vowel of a stressed word
        // AT_BOTTOM_OF_HAT before first stressed vowel of the clause
        // AT_TOP_OF_HAT for and after the first stressed vowel
        if (pDph_t->hatpos == AT_BOTTOM_OF_HAT) { // first vowel of a stressed

          if (pDph_t->f0mode == NORMAL) {
            //printf ("ph_fr_inton2.c phinton() Rule 1 %d\n", 
            //                  pDph_t->size_hat_rise);
            pDphsettar->hatsize  = pDph_t->size_hat_rise;  // speaker-def param
            if (pDph_t->cbsymbol) pDphsettar->hatsize = pDphsettar->hatsize >> 1;
            // Begin gesture toward the end of the vowel if long
            delayf0 = 0;
            if (Syll_Synt_Restantes == 1) delayf0 =  -NF80MS;
            regle (phocur, "AT_BOTTOM_OF_HAT + NORMAL : step of hatsize");
            make_f0_command (phTTS, STEP, 1, pDphsettar->hatsize, 
                             delayf0, 20, &cumdur, nphon);

          } else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED) {
            pDphsettar->hatsize = ((pDph_t->user_f0 [mf0] - 200) * 10) + 2;
            if ((pDphsettar->hatsize >= 2000) || 
                (pDphsettar->hatsize <= 0)    || (inputscrewup == TRUE)) {
              pDphsettar->hatsize = 2;  // Must be even, greater than 0
              // logscrewup (phocur);
            }
            delayf0 = mstofr (pDph_t->user_offset[mf0]);
            mf0++;
            // Make hat rise occur at user_dur ms re vowel onset
            regle (phocur, "AT_BOTTOM_OF_HAT + HAT_F0_SIZES_SPECIFIED : step of hatsize");
            make_f0_command (phTTS, STEP, 1, pDphsettar->hatsize, 
                             delayf0, 20, &cumdur, nphon);
          } // pDph_t->f0mode == NORMAL 

          pDphsettar->hat_loc_re_baseline += pDphsettar->hatsize; // 0 + hatsize
          pDph_t->hatpos = AT_TOP_OF_HAT;
        } // if pDph_t->hatpos == AT_BOTTOM_OF_HAT


        // Begin gesture 1/4 of way into the vowel
        delayf0 = pDph_t->allodurs [nphon] >> 2;  //MD
        //delayf0 = pDph_t->allodurs [nphon] >> 1;  //MD  
        // Begin impulse much earlier when last stress of phrase 
        //if ((Syll_Synt_Restantes == 1) && (Syll_Mot == 1)) delayf0 = -NF60MS;
        // Except when syllable is emphasized

        if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED) {
          targf0 = (pDph_t->user_f0 [mf0]-1000) * 10 + 1; // Odd
          if (targf0 >= 2000 || targf0 <= 0 || inputscrewup) {
            targf0 = 1; // Must be odd, greater than 0 
            // logscrewup (phocur, &inputscrewup);
          }
          delayf0 = mstofr (pDph_t->user_offset [mf0]);
          mf0++;
          // Scale by speaker def parameter SR, unless emphasized
          pDph_t->arg1 = pDph_t->scale_str_rise;  // 32 for Paul
          targf0 = muldv (pDph_t->arg1, targf0, 32);
          make_f0_command (phTTS, IMPULSE, 2, targf0, delayf0, 20, &cumdur, nphon);

        } else if ((Syll_Synt_Restantes > 1) ) {
        // Calculate targf0 : the value of the impulse and delayf0 : time of impulse
          if (Syll_Mot_Restantes == 1  && (Syll_Mot > 1) ) {
          //if (Syll_Mot_Restantes == 1) {
            // last syllable of a stressed word
          //printf ("Ph_fr_inton2.c  pDphsettar->nrises_sofar %d, f0_mphrase_position[] %d\n",
          //          pDphsettar->nrises_sofar, f0_mphrase_position [pDphsettar->nrises_sofar]);
          targf0 = f0_stress_level [FSTRESS_1] +
                   f0_mphrase_position [pDphsettar->nrises_sofar];
          regle (phocur, "Last vowel of a stressed word");
          if (pDphsettar->nrises_sofar < NB_PH_POS - 1) pDphsettar->nrises_sofar++;
        } else {
          // Stressed word, but not final syllable of word = Secondary stressed
          targf0 = f0_stress_level [FSTRESS_2]; 
          regle (phocur, "Stressed word, but not final vowel of the word");
        }
          // Scale by speaker def parameter SR, unless emphasized
          pDph_t->arg1 = pDph_t->scale_str_rise;  // 32 for Paul
          targf0 = muldv (pDph_t->arg1, targf0, 32);
          make_f0_command (phTTS, IMPULSE, 2, targf0, delayf0, 10, &cumdur, nphon); 
          // MD : was 20
        }

        // If presently at top of hat, return to base shortly after
        // vowel onset of the last stressed syllable in the clause
        if ((Syll_Synt_Restantes == 1) && (pDph_t->hatpos == AT_TOP_OF_HAT)) {
          if (pDph_t->f0mode == NORMAL) {

            // Make fall try to go below baseline by 21 Hz in a 
            // declarative sentence with stressed final syllable
            // printf ("ph_fr_inton2.c phinton() Rule 3\n");
            // f0fall = 212; // F0_FINAL_FALL;
            // printf ("pDph_t->allofeats [pDph_t->nallotot-1] %4x\n", 
            //    pDph_t->allofeats [pDph_t->nallotot-1]);

            if ((pDph_t->allofeats [pDph_t->nallotot-1]) & FPROP) {
              f0fall = 212; // F0_FINAL_FALL;
              //printf ("f0fall FPROP %d\n", f0fall);
            } else {
              f0fall = 112; // NOT F0_FINAL_FALL;
              f0fall = 50;
              //printf ("f0fall NOT FPROP %d\n", f0fall);
        }

            // Make fall start 160 ms from end of this vowel
            delayf0 = pDph_t->allodurs [nphon] - NF160MS;
            // But not too early
            if (delayf0 < NF25MS) delayf0 = NF25MS;

            // Pitch falls are less pronounced for some speakers 
            // to reduce impression of assertive personality
            //f0fall = frac4mul (f0fall, pDph_t->assertiveness);

            //if (pDph_t->cbsymbol) f0fall = f0fall >> 1;  // Gest reduced in ?

            // Total fall is hatsize + f0fall below baseline
            f0fall += pDphsettar->hatsize;
            regle (phocur, "Return to base : last stressed vowel of the clause");
            make_f0_command (phTTS, STEP, 3, (short) -f0fall, delayf0, 
                             20, &cumdur, nphon);
          
          } else if (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED ) {
            // Unless user->specified fall
            f0fall = ((pDph_t->user_f0[mf0] - 400) * 10) + 2;  // Even
            if ((f0fall >= 2000) || (f0fall <= 0) || (inputscrewup == TRUE)) {
              f0fall = 2;  // Must be even greater than 0
            }
            delayf0 = mstofr(pDph_t->user_offset[mf0]);
            mf0++;
          regle (phocur, "Return to base : last stressed vowel of the clause");
          make_f0_command (phTTS, STEP, 3, (short) -f0fall , delayf0, 
                           20, &cumdur, nphon);
          }
        } // Syll_Synt_Restantes == 1 && pDph_t->hatpos == AT_TOP_OF_HAT


      } else if (feacur & FSYLL) {   // unstressed vowel
        delayf0 = pDph_t->allodurs [nphon] >> 2;
        targf0  = f0_stress_level [FNOSTRESS]; 
        make_f0_command (phTTS, IMPULSE, 2, targf0, delayf0, 20, &cumdur, nphon);
        regle (phocur, "Unstressed word");
      } // feacur & FSYLL && Mot_Accentue


      if (feacur & FSYLL) {  // stressed or not
        Syll_Mot_Restantes--;
        Syll_Synt_Restantes--;
      }

  
    }  // else if (pDph_t->f0mode == NORMAL) || (pDph_t->f0mode == HAT_F0_SIZES_SPECIFIED)

    // Update cumdur to time at end of current phone
    cumdur += pDph_t->allodurs[nphon];

    // add up duration for phdrawt0  eab 8/96 don't count final silence 
    // eab 7/8/98 Bats 711
    if ( ( nphon <= (pDph_t->nallotot-1) && 
            (nphon > 0 && (pDph_t->allophons[nphon] & PVALUE) != 0)  )
	|| nphon==0 ) 
      pDph_t->tcumdur += pDph_t->allodurs[nphon];
    //1st two lines check end of clause
      //This counts inital silence (we don't want final silence 
      // EAB It turns out that there are two possibilites for the way things
      // get transmitted one is with and end of clause symbols and the other is without(implied)
      // therefore you have to do two checks to know whether or not your at the last real phoneme
      // or at a silence phoneme BATS 897

  } // for

//#define DEBUGFRENCH

#ifdef DEBUGFRENCH
  { // block for local variables
      short nseg       = 0;
      short cumdur     = 0;
      short cumdursegs = 0;
    extern short notetab[];  // f0 target for notes C2-C5 (1-37)

    if (1) {
	short n;
	printf ("\nph_fr_inton2.c phinton() f0 gestures (Hz*10) and times (ms)\n");
	printf ("\n  Phone  Time  F0gest  Gesture-type");
	for (n=0; n<pDph_t->nf0tot; n++) {
	  cumdur += pDph_t->f0tim [n];
        // List all allophones that occur before this f0 gesture
	  while (cumdursegs <= cumdur) {
	    printf ("\n  %s  %4d",
		    phprint (pDph_t->allophons [nseg]), (short) (((long) cumdursegs*64)/10));
	    cumdursegs += pDph_t->allodurs [nseg++];
          if (nseg >= pDph_t->nallotot)  break;  // For safety
	  }
	  printf ("\n    %4d  %4d  ", (short)(((long)cumdur*64)/10), pDph_t->f0tar[n]);
	  if (pDph_t->f0tar [n] == 0) {
	    printf ("Baseline Reset and Hat Reset");
	  } else if (pDph_t->f0tar [n] >= 2000) {
	    if (pDph_t->f0tar [n] <= 2037) {
	      printf ("Sung note %d = %d Hz*10",
		      pDph_t->f0tar [n]-2000, notetab [pDph_t->f0tar[n]-2001]);
	    } else {
	      printf ("F0 target of %d Hz at phone end", pDph_t->f0tar [n]-2000);
	    }
	    //} else if (pDph_t->f0tar [n] & 01) {
	    } else if ( pDph_t->f0type [n] == IMPULSE) {
          printf ("Impulsive Command %d", pDph_t->f0tar [n]);
	    } else {
          printf ("Step Command %d", pDph_t->f0tar [n]);
	    }
	}
	while (nseg < pDph_t->nallotot) {
	  printf ("\n  %s  %4d",
		  phprint (pDph_t->allophons[nseg]), (short)(((long)cumdursegs*64)/10));
	  cumdursegs += pDph_t->allodurs [nseg++];
	}
	printf ("\n\n");

    } // if
    }  // end of block for local variables
#endif

} // phinton

#ifdef now_in_PHINTON2
// Description: put an f0 command into f0tar and f0tim arrays
static void make_f0_command (LPTTS_HANDLE_T phTTS, short type, short rulenumber, 
			     short tar, short delay, short length, short* psCumdur, short nphon) {
  PKSD_T  pKsd_t = phTTS->pKernelShareData;
  PDPH_T  pDph_t = phTTS->pPHThreadData;

  // Cumdur reflects time (in frames) since last f0 command
  // Cumdur+delay should never be less than zero
  // static short prpholas, temp; *//* MVP : Never Used,comment it out
  // If requested time is earlier than last f0 command, zero offset

  if ((delay + *psCumdur) < 0) delay = -(*psCumdur);

  // Save commands
  pDph_t->f0tim [pDph_t->nf0tot] = *psCumdur + delay;
  pDph_t->f0tar [pDph_t->nf0tot] = tar;
  pDph_t->f0type[pDph_t->nf0tot] = type;
  // eab 1/10/98 We need to be able to specifiy the length of the event 
  // instead of having only one choice. Initally some commands will ignore length
  pDph_t->f0length[pDph_t->nf0tot] = length;
 
#ifdef DEBUGFRENCH
  if (1) {
    if ((nphon%10) == 0) {
      printf ("make_f0_command (type rulenumber tar delay length *psCumdur nphon phon");
      printf ("     (nf0tot f0tim f0tar f0type)\n");
    }

    printf ("make_f0_command  %4s %2d %2d %4d %4d %2d %4d %2d\n",
       phprint (pDph_t->allophons [nphon]),
       type, rulenumber, tar, delay, length, *psCumdur, nphon);

    printf ("     %2d %4d, %4d, %4d, %4d\n", pDph_t->nf0tot, 
	    pDph_t->f0tim [pDph_t->nf0tot], 
	    pDph_t->f0tar [pDph_t->nf0tot],
       pDph_t->f0type  [pDph_t->nf0tot],
       pDph_t->f0length[pDph_t->nf0tot]);
  }
#endif

  // "Zero" counter of time since last command
  *psCumdur = (-delay);

  // Increment counter of number of f0 commands issued
  if (pDph_t->nf0tot < NPHON_MAX - 1) pDph_t->nf0tot++;

} // make_f0_command
#endif

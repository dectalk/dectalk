/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *      Copyright  1984		      by Dennis H. Klatt
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
 *    File Name:	phinton.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *			FUNDAMENTAL FREQUENCY RULES
 *
 ***********************************************************************
 *    Revision History:
 * 0001 16-Dec-84 DK	Initial creation
 * 0002 27-Dec-84 DGC	Version for 80186, use mstofr()
 * 0003  9-Jan-85 DK	Fix handling of user inputted f0 commands
 * 0004 21-Jan-85 DK	Fix bug causing f0 to drift down in long sentences
 * 0005  1-Mar-85 DK	Reduce pitch gestures in a clause ended by "?"
 * 0006 18-Apr-85 DK	Try releasing final nasals into silence for intellig.
 * 0007 25-Apr-85 DK	Fix continuation rise so not too early
 * 0008 17-May-85 DK	F0 fall cannot occur too early in a long vowel
 * 0009 14-Jun-85 DK	Fix f0 fall for f0mode=HAT_LOCATIONS_SPECIFIED
 * 0010 19-Jun-85 DK	Fix insertion of dummy-vowel phoneme
 *
 *
 */
#include	"dectalk.h"

#ifdef   vax
#include   <stdio.h>
#endif

#include   "phdefs.h"

/*    Input variables:							  */
extern char allophons[];  /* Integer rep of phonetic string	  */
extern short allofeats[];  /* Structural features		  */
extern short allodurs[];   /* Duration in frames for each phone   */
#ifndef MINIMAL_SYNTH
extern short *user_f0;      /* User-specified f0 commands, optional */
//extern short *user_offset; /* User-specified f0 command time offset */
#endif
extern short nallotot;      /* Number of phones in phonetic string */
#ifndef MINIMAL_SYNTH
extern FLAG  newparagsw;   /* Make f0 higher initially if =1	  */
#endif
/* Set to 0 here after raising f0	  */
extern short assertiveness;/* Speaker def parameter		  */
extern short size_hat_rise;/* Speaker def parameter		  */
extern short scale_str_rise;/*Speaker def parameter		  */
extern short cbsymbol;      /* Equals QUEST if clause ends in ?	  */

/*    Output variables:							  */
extern short f0tar[];   /* F0 target commands, in Hz*10		  */
extern short f0tim[];   /* Times between commands, in frames	  */
extern short nf0tot;   /* Number of commands for cur clause	  */
extern short f0mode;   /* State variable determine if rules used */

/*  TABLES located in PHROM.C						*/
extern short f0_stress_level[];      /* F0 rise as f(stress-level)   */
extern short f0_phrase_position[]; /* F0 rise as f(phrase-position) */
extern short featb[];      /* Phonetic features		*/

extern short arg1,arg2,arg3;   /* Used for muldv()		*/

#ifdef   vax
extern short  printsw;   /* If (printsw & PRF0COMM)  print output */
extern short notetab[];
short nseg,cumdursegs;
#endif

static short n;
static short cumdur,phocur;


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

phinton()
{
   static short nrises_sofar;   /* Number of accents in clause to now */
#ifndef MINIMAL_SYNTH
   static short emphasissw;
#endif
   static short hatpos;
   static short hatsize;
   static short hat_loc_re_baseline;

   /* Automatic variables */
   short nphon,mf0;
   short pholas,struclas,fealas;
   short struccur,feacur,stresscur;
   short phonex,strucnex,feanex;
   short targf0,delayf0;
   short f0fall;   /* Extra fall below baseline at end of clause */
   short nphonx;

   /* Beginning of initialization */
   
   cumdur = 0;
   nf0tot = 0;
   pholas = SIL;
   fealas = featb[SIL];
   struclas = 0;
   hatpos = 0;
   hatpos = AT_BOTTOM_OF_HAT;   /* I think ??? */
   mf0 = 0;
   /* Should set nrises_sofar to zero after a ph_init=0 hard reset */
   /* End of initialization */

   /* MAIN LOOP, for each output phoneme */

   for (nphon=0; nphon<nallotot; nphon++)
   {
      if (nphon > 0)
      	{
         pholas = allophons[nphon - 1];
         struclas = allofeats[nphon - 1];
         fealas = featb[pholas];
      	}
      phocur = allophons[nphon];
      struccur = allofeats[nphon];
      stresscur = struccur & FSTRESS;
      feacur = featb[phocur];
      if (nphon < (nallotot-1))
      {
         phonex = allophons[nphon + 1];
         strucnex = allofeats[nphon + 1];
         feanex = featb[phonex];
      }
#ifndef MINIMAL_SYNTH
      /* Rule 0: User-specified commands for phoneme f0 targets or singing */
      if ( (f0mode == PHONE_TARGETS_SPECIFIED)
         || (f0mode == SINGING) )
      {
         if (user_f0[nphon] != 0)
         {
            make_f0_command(0,2000+user_f0[nphon],0);
         }
         goto skiprules;
      }
#endif
      /* Rule 1: If at bottom of hat, goto top on +HAT_RISE +syllabic */
      if ((f0mode == NORMAL) || (f0mode == HAT_F0_SIZES_SPECIFIED))
      {
         if ((feacur & FSYLL) IS_PLUS)
         {
            if ( ((struccur & FHAT_BEGINS) IS_PLUS)
               && (hatpos == AT_BOTTOM_OF_HAT))
            {
               if (f0mode == NORMAL)
               {
                  hatsize = size_hat_rise;   /* speaker-def param */
                  /* PUT IN CODE TO REDUCE HATSIZE IN SHORTER OF TWO HAT PATTERNS OF A SENTENCE */
                  if (cbsymbol == QUEST)
                  {
                     hatsize = hatsize>>1;   /* All gest reduced */
                  }
                  hatsize &= 037776;      /* Must be even */
                  hatsize |= 02;      /* Must be non-zero */

                  /* Begin gesture toward the end of the vowel if long */
                  delayf0 = 0;
                  /* Begin gesture earlier if also hat fall on same vowel */
                  if ((struccur&FHAT_ENDS) IS_PLUS)
                  {
                     delayf0 =  -NF80MS;
                  }
                  make_f0_command(1,hatsize,delayf0);
               }
               else if (f0mode == HAT_F0_SIZES_SPECIFIED)
               {
#ifndef MINIMAL_SYNTH
                  hatsize = ((user_f0[mf0] - 200) * 10) + 2;
#endif
                  if ((hatsize >= 2000) || (hatsize <= 0))
                  {
                     hatsize = 2; /* Must be even, greater than 0 */
                     
                  }
#ifdef NOT_USED
//                  delayf0 = mstofr(user_offset[mf0]);
#endif
                  mf0++;
                  /* Make hat rise occur at user_dur ms re vowel onset */
                  make_f0_command(1,hatsize,delayf0);
               }
               hat_loc_re_baseline += hatsize;
               hatpos = AT_TOP_OF_HAT;
            }
            /* Rule 2: Add stress pulse to every stressed vowel, smaller pulse at end */
            if ((stresscur&FSTRESS_1) IS_PLUS)
            {  /* Primary or emph */

               /* Make stress impulse prop. to degree of stress */
               /* and stress position relative to clause onset */
               targf0 = f0_stress_level[stresscur]
               + f0_phrase_position[nrises_sofar];

               if (cbsymbol == QUEST)
               {
                  targf0 = targf0>>1;   /* All gestures reduced in ? */
               }
               /* Begin gesture 1/4 of way into the vowel */
               delayf0 = allodurs[nphon]>>2;
               /* Begin impulse much earlier when last stress of phrase */
               if (((struccur & FHAT_ENDS) IS_PLUS)
                  || ((struccur & FPERNEXT) IS_PLUS))
               {
                  delayf0 = -NF60MS;
               }
               /* Except when syllable is emphasized */
               if (stresscur == FEMPHASIS)
               {
                  delayf0 = 0;
               }
               if (f0mode == HAT_F0_SIZES_SPECIFIED)
               {
#ifndef MINIMAL_SYNTH
                  targf0 = ((user_f0[mf0]-1000) * 10) + 1; /* Odd */
#endif
                  if ((targf0 >= 2000) || (targf0 <= 0))
                  {
                     targf0 = 1; /* Must be odd, greater than 0 */
                     
                  }
#ifndef MINIMAL_SYNTH
//                  delayf0 = mstofr(user_offset[mf0]);
#endif
                  mf0++;
               }
               /* Scale by speaker def paramter SR, unless emphasized */
               arg1 = scale_str_rise;
               if ((stresscur == FEMPHASIS) && (arg1 < 16))
               {
                  arg1 = 16;
               }
               arg2 = targf0;
               arg3 = 32;
               targf0 = muldv();
               targf0 |= 01;   /* Must be odd */

               /* Save stress impulse in command string */
               make_f0_command(2,targf0, delayf0);

               /* Increment stressed syllable counter */
               if (nrises_sofar < 4)    nrises_sofar++;
            }
            /* Rule 3: Execute hat fall */

            /* If presently at top of hat, return to base shortly after */
            /* vowel onset if this is last stressed syllable in phrase */
            if ( ((struccur & FHAT_ENDS) IS_PLUS)
               && (hatpos == AT_TOP_OF_HAT) )
            {
               if (f0mode == NORMAL)
               {
                  /* Default assumptions: */
                  /* Make fall try to go below baseline by 21 Hz in a
                   *			  declarative sentence with stressed final syllable */
                  f0fall = 212;
                  /* Make fall start 160 ms from end of this vowel */
                  delayf0 = allodurs[nphon] - NF160MS;
                  /* But not too early */
                  if (delayf0 < NF25MS)    delayf0 = NF25MS;

                  /* Non-final clause, don't go too far below baseline */
                  if ((struccur & FBOUNDARY) == FCBNEXT)
                  {
                     f0fall = 120;
                  }
                  /* Non-final phrase, don't go below baseline at all */
                  if ((struccur & FBOUNDARY) == FVPNEXT)
                  {
                     f0fall = 0;
                  }
                  /* Non-final syllable, see what boundary is next */
                  if ((struccur & FBOUNDARY) < FVPNEXT)
                  {
                     /* LEFT SHIFT 4 x 4 SPACES SO FITS ON LINE */
                     for (nphonx=nphon+1; nphonx<nallotot; nphonx++)
                     {
                        if ((featb[allophons[nphonx]] & FSYLL) IS_PLUS)
                        {
                           if ((allofeats[nphonx] & FHAT_BEGINS) IS_PLUS)
                           {
                              /* Don't go below baseline if another hatrise in phrase */
                              f0fall = 0;
                              goto bfound;
                           }
                           if ((allofeats[nphonx] & FSTRESS) IS_MINUS)
                           {
                              /* Delay fall if next syll unstressed */
                              /* MINOR BUG:		  (should only depend on first syllabic encountered) */
                              delayf0 = allodurs[nphon] - NF50MS;
                           }
                           if ((allofeats[nphonx] & FBOUNDARY) == FVPNEXT)
                           {
                              /* This syll is last of a phrase */
                              f0fall = 0;      /* More of clause coming */
                              goto bfound;
                           }
                           if ((allofeats[nphonx] & FBOUNDARY) > FVPNEXT)
                           {
                              /* This syll is last of a clause */
                              f0fall = 120;   /* Go slightly below baseline */
                              goto bfound;
                           }
                           /* Else continue looking for last syll of this phrase */
                        }
                     }
                  }
                  /* END OF LEFT SHIFT */

                  /* Or because question rise on same syllable */
                  bfound:             if ((struccur & FBOUNDARY) == FQUENEXT)
                  {
                     f0fall = 80;
                  }
                  /* Pitch falls are less pronounced for some speakers
                   *			  to reduce impression of assertive personality */
                  f0fall = frac4mul(f0fall, assertiveness);

                  if (cbsymbol == QUEST)
                  {
                     f0fall = f0fall>>1;   /* Gest reduced in ? */
                  }
                  f0fall &= 037776;    /* Must be even */
                  /* Total fall is hatsize + f0fall below baseline */
                  f0fall += hatsize;
               }
               /* Unless user-specified fall */
#ifndef MINIMAL_SYNTH
               else if (f0mode == HAT_F0_SIZES_SPECIFIED)
               {

                  f0fall = ((user_f0[mf0] - 400) * 10) + 2;   /* Even */

                  if ((f0fall >= 2000) || (f0fall <= 0))
                  {
                     f0fall = 2; /* Must be even, greaterthan 0 */
                     
                  }
#ifndef MINIMAL_SYNTH
//                  delayf0 = mstofr(user_offset[mf0]);
#endif
                  mf0++;
               }
#endif
               make_f0_command(3,-f0fall, delayf0);
               hat_loc_re_baseline -= f0fall;
               hatpos = AT_BOTTOM_OF_HAT;
            }
            /* Rule 4: Add positive pulse to approximate nonterminal fall-rise
             *	   in stressed clause-final but non-sentence-final syllable,
             *	   or in sentence ending in a question mark */
            if (((struccur & FBOUNDARY) == FCBNEXT)
               || ((struccur & FBOUNDARY) == FQUENEXT))
            {
               /* Time rise to begin near end of vowel */
               delayf0 = allodurs[nphon] - NF80MS;
               if ((struccur & FBOUNDARY) == FQUENEXT)
               {
                  /* Sent.-final stressed vowel followed by q-mark */
                  make_f0_command(4,181, delayf0);
                  make_f0_command(4,251, allodurs[nphon]);
               }
               else
               {
                  /* Phrase-final stressed vowel followed by comma */
                  delayf0 += NF20MS;
                  make_f0_command(4, 71, delayf0);
                  make_f0_command(4,101, allodurs[nphon]);
               }
            }
         }
         /* Rule 5: Final fall on unstress clause-final syl, or on stressed
          *	   clause-final syll that didn't have hat fall due to earlier emphasis */
         if ((feacur & FSYLL) IS_PLUS)
         {
            if (((stresscur & FSTRESS_1) IS_MINUS)    /* 2-str or 0-str */
               || ((struccur & FHAT_ENDS) IS_MINUS))
            {  /* or 1-str nofall */

               /* Pitch falls (glottalize) at end of declar. sent. */
               if (((struccur & FBOUNDARY) == FPERNEXT)
                  || ((struccur & FBOUNDARY) == FEXCLNEXT))
               {
                  targf0 = -131;
                  /* Pitch falls are less pronounced for some speakers
                   *	  to reduce impression of assertive personality */
                  targf0 = frac4mul(targf0, assertiveness);
                  targf0 |= 01;    /* Must be odd */
                  /* Sent.-final unstressed vowel followed by a period */
                  make_f0_command(5,targf0, allodurs[nphon]-NF100MS);
               }
               /* Rule 6: Continuation rise on unstress clause-final syll before  comma or ? */

               /* Rise occurs just before end of vowel */
               delayf0 = allodurs[nphon] - NF80MS;
               if ((struccur & FBOUNDARY) == FQUENEXT)
               {
                  /* Unstressed vowel followed by a question mark */
                  make_f0_command(6,181, delayf0);
                  make_f0_command(6,251, allodurs[nphon]);
               }
               if ((struccur & FBOUNDARY) == FCBNEXT)
               {
                  /* Unstressed vowel followed by a comma */
                  delayf0 += NF20MS;
                  make_f0_command(6, 71, delayf0);
                  make_f0_command(6,101, allodurs[nphon]);
               }
            }
         }
         /* Rule 7: Reset baseline at end of sentence */
         if (phocur == SIL)
         {
            /* Reset f0 to hat bottom from sub-hat-bottom */
            if ((hat_loc_re_baseline != 0) && (nf0tot > 0))
            {
               make_f0_command(7,-hat_loc_re_baseline, 0);
               hat_loc_re_baseline = 0;
            }
            if (nphon > 0)   nrises_sofar = 1;   /* Soft reset */

            /* Rule 8: Reset baseline and hat position to brim if end of a sentence */
            /* ** Add condition to reset if long clause followed by comma and long clause */
            if ((struclas & FSENTENDS) IS_PLUS)
            {
               make_f0_command(8, 0, 0);
               hat_loc_re_baseline = 0;
               /* Hard reset counter of stressed sylls in clause */
               nrises_sofar = 0;
            }
         }
      }
#ifndef MINIMAL_SYNTH
      skiprules:  
#endif

      /* Update cumdur to time at end of current phone */
      cumdur += allodurs[nphon];

      /* Rule 9: Add short schwa vowel to create release of [p,t,k,b,d,g] into sil.
       *	  Logically, this kind of rule should appear in PHALLOPH.C, but
       *	  delaying it to here makes all dur and f0 rules much simpler */
      if ((phonex == SIL)
         && (((phocur >= P) && (phocur <= G))   /* p t k b d g */
       /*  || ((feacur & FNASAL) IS_PLUS)*/)      /* m n nx en */
         && (nallotot < NPHON_MAX))
      {
         for (n=nallotot; n>nphon; n--)
         {
            allophons[n] = allophons[n-1];
            allofeats[n] = allofeats[n-1];
            allodurs[n] = allodurs[n-1];
//            user_f0[n] = user_f0[n-1];
         }
         allophons[nphon+1] = AX;
         if ((pholas < AE)
            || ((phocur >= T) && (phocur <= D)))
         {
            allophons[nphon+1] = IX;
         }
         allodurs[nphon+1] = NF25MS;
         cumdur += NF25MS;
         allofeats[nphon+1] = allofeats[nphon] | FDUMMY_VOWEL;
         nallotot++;
         nphon++;
      }
/*    printf("\ndur \t\t%4d\t%4d fotar nphone %d", ((cumdur*64)/10), f0tar[n],nphon);*/

   }


}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*   Return TRUE if FEA1 seen in input string before FEA2 is seen    */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

int firstfeature(short FEA1,short FEA2,short nseg)
{
//   register int n;
   int n;

   for (n=nseg; n<nallotot; n++)
   {
      if ((allofeats[n] & FEA1) IS_PLUS)    return(TRUE);
      if ((allofeats[n+1] & FEA2) IS_PLUS)    return(FALSE);
   }
   return(FALSE);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	   Put an f0 command into f0tar and f0tim arrays	     */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

static make_f0_command(short rulenumber, short   tar, short delay)
{
   /* Cudur reflects time (in frames) since last f0 command	 */
   /* Cumdur+delay should never be less than zero	 */

#ifndef MINIMAL_SYNTH
   static short prpholas, temp;
#endif

   /* If requested time is earlier than last f0 command, zero offset */

   if ( (delay+cumdur) < 0)
   {
      delay = -cumdur;
   }
   /* Save commands */
   f0tim[nf0tot] = cumdur + delay;
   f0tar[nf0tot] = tar;

   /* "Zero" counter of time since last command */
   cumdur = (-delay);

   /* Increment counter of number of f0 commands issued */
   if (nf0tot < NPHON_MAX-1)
   {
      nf0tot++;
   }

#ifdef   vax
   else
   {
      printf("ERROR in PHINTON.C:");
      printf(" nf0tot >= NPHON_MAX (%d), zap previous f0 command\n",
      NPHON_MAX);
   }
#endif
}



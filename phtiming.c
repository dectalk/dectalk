/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *      Copyright  1984				by Dennis H. Klatt
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
 *    File Name:	phtiming.c
 *    Author:		Dennis Klatt
 *    Creation Date:01-SEP-1984
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 * 0001  1-Sep-84 DK	Initial creation
 * 0002 27-Dec-84 DGC	Modified for the 80186.
 * 0003 02-Jan-85 DGC	Added some conditional calls to the "mstofr"
 *			routine. Some of the conversions from MS to
 *			frames caused overflow on 16 bit machines.
 * 0004 26-Feb-85 DK	[nt] cluster too long
 * 0005 18-Mar-85 DK	period pause and comma pause code had a bug
 * 0006 25-Mar-85 DK	Let phrase-final lengthening apply to word before prep
 * 0007 17-Apr-85 DK	Reduce compound shortening and short-word lengthening
 * 0008 23-Apr-85 DK	Word-final fricatives longer
 * 0009 25-Apr-85 DK	Final lengthing before preposition only at slow sprate
 * 0010 15-May-85 DK	Fix [nt] cluster reduction to happen only at word end
 * 0011 17-May-85 DK	Make word-init stressed vowels longer, final ptk shorter
 * 0012 23-May-85 DK	Word-initial vowels not quite so short, less vowel
 *			 lengthening induced by postvoc voiced fric
 * 0013 20-Jun-85 DK	Fix nasal durs for "pense,pen,pend"
 * 0014 16-jan-90 EAB	Allow speaking rate to 550 word per min. (from 350)
 * 0015 25-JUL-90 EAB	 ADDED CHANGE TO ALLOW VARIABLE SETTING OF COMMA PAUSE
 *			FOR NANCY JARRELL OF CHB TO GET IT TO ZERO. NOTE
 *			-300 SETTING OF COMPAUSE ALLOWS SETTING TO ZERO BUT
 *			THE CODE HAS NOT BEEN CHECKED FOR ERRORS.
 *
 *			    DURATION RULES
 * 0016 3-MAY-93	EAB 	ADDED NEW PHONE DF TO DIFFERENTIATE T FROM D FLAP
 *							   and added rules to make use of it.
 * 0017 2-MAY-93	EAB 	restrucutred a bunch of stuff-reduced 
 *								
 * 0018 2-MAY-93	EAB 	ADDED PETROCELLI'S NEW DURATION RULES.
 */

#ifdef   vax
#include   <stdio.h>
#endif
/* #define EABDEBUG 1; *//* uncomment to get debug printout*/
#include   "phdefs.h"
#include "dectalk.h"
//#include "port.h

/*    Input variables:							*/
extern char allophons[];  /* Integer rep of phonetic string	*/
extern short allofeats[];  /* Structural features		*/
extern short nallotot;      /* Number of phones in phonetic strin */
extern FLAG  newparagsw;/* If 1, pause before this clause long	*/
extern short sprate;   /* Requested speaking rate, this clause	*/
extern short compause;   /* Extra pause at comma, user set by :dv */
extern short perpause;   /* Extra pause at period,   "		*/
#ifndef MINIMAL_SYNTH
extern short *user_durs;/* User-specified durations (optional)	*/
#endif

/*    Output variables */
extern short allodurs[]; /* Duration in frames for each phone   */
extern long longcumdur;    /* For waveform simulation printout    */

/*    Tables located in PHROM.C					*/
extern unsigned char inhdr[];   /* Inherent duration for each phone	*/
extern unsigned char mindur[];   /* Minimum duration for each phone	*/
extern short featb[];   /* Phonetic features			*/

/*    Arguments for fractional multiply instruction mlsh1() and muldv() */
extern short arg1,arg2,arg3;

#ifdef   vax
extern short  printsw;   /* Print debugging output		*/
#endif

#define   IAPX86   0

static short sprlast;   /* Sprate during last clause		*/
static short sprat1;   /* Sprate factor for pauses and deldur	*/
static short sprat2;   /* Sprate factor for segments		*/
static short emphasissw;
static short prcnt,durinh,durmin,deldur,nphon;
static short pholas,struclas,fealas;
static short phocur,feacur,feasyllabiccur;
static short struccur,strucboucur,strucstresscur,strucstressprev;
static short phonex,strucnex,feanex;
static short dpause,sprat0,durxx,posvoc,nrises_sofar;
 
/* commented out as unused var - 8/9/95  JDB
static short durmax;
*/
 
/*
 *  Asperation is used to dynamically adjust the comma and period
 *  pauses based on what has come before it.
 */

extern int asperation;

#define   BASE_ASP               500
#define   MAX_ASP_COMMA         (8)
#define   MIN_ASP_COMMA         (-4)
#define   MAX_ASP_PERIOD         (20)
#define   MIN_ASP_PERIOD         (-10)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

phtiming()
{
   short psonsw,posvoc;
	int i;
   /* Initialization  (Set sprat1,sprat2, zero counters, print debug) */

   init_timing();

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
      strucboucur = struccur & FBOUNDARY;
      feacur = featb[phocur];
      feasyllabiccur = feacur & FSYLL;
      strucstresscur = struccur & FSTRESS;

      if (nphon < (nallotot-1))
      {
         phonex = allophons[nphon + 1];
         strucnex = allofeats[nphon + 1];
         feanex = featb[phonex];
      }
      /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
      /* Duration Rules                         */
      /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

      /* Use user-specified duration if one exists.			*/
      /* User durations can be huge; call the conversion routine.	*/
#ifndef MINIMAL_SYNTH
      if (user_durs[nphon] != 0)
      {
         durxx = mstofr(user_durs[nphon]+4);

#ifdef DEBUG_USER_PROSODICS
         printf("\tFound user_dur[%s] = %3d frames in PHTIMING\n",
         phprint(phocur), durxx);
#endif

         goto break3;
      }
#endif
      /* Convert inherent and minimum duration in msec to frames.	*/
      /* Fixed overflow in 16 bits is not possible on these ones.	*/
      durinh = ((inhdr[phocur]*10)+50)>>6;
      durmin = ((mindur[phocur]*10)+50)>>6;

      /* Additive increment */
      deldur = 0;
      /* Multiplicative constant (let 128 be 100%) */
      prcnt = 128;

      /*
       * Rule 1: Pause durations depend on syntax
       *	      Clause-initial pause should be minimal, i.e. NF64MS (enough
       *	      time for initial fricative to build up amp gradually)
       *		  Shortened to 0, except for fricitive and plosive in next phone
       *		  we go do 7 ...
       */
      if (phocur == SIL)
      {
         if (((feanex & FVOICD) && (feanex & FOBST)) || (feanex & FPLOSV))
            dpause = 1;
         else
            dpause = 1;

         asperation = (asperation-BASE_ASP)/10;

         /* Treatment of other than clause-initial pauses: */
         if (nphon > 1)
         {
            /* If this clause ends in a comma, use short pause */
            /* Note extra compause added if user command [:dv cp __] */
            if ((struclas & FBOUNDARY) == FCBNEXT)
            {
               if(asperation > MAX_ASP_COMMA)
                  asperation = MAX_ASP_COMMA;
               else if(asperation < MIN_ASP_COMMA);
               asperation = MIN_ASP_COMMA;
			
               dpause = NF_COMMA + compause + asperation;
            }
            /* End of clause has long pause if ends with "." "!" or "?" */
            /* Note extra perpause added if user command [:dv pp __] */
            if (((struclas & FBOUNDARY) & FSENTENDS) IS_PLUS)
            {
               if(asperation > MAX_ASP_PERIOD)
                  asperation = MAX_ASP_PERIOD;
               else if(asperation < MIN_ASP_PERIOD);
               asperation = MIN_ASP_PERIOD;
               dpause = NF_PERIOD + perpause + asperation;
            }


         }
#ifdef NOT_USED
         /* Make sentence-initial pause long if this is a new paragraph */
         else if (newparagsw != FALSE)
				{
            dpause = NF_PERIOD;
				}
#endif
         asperation = 0;

         /* Effect of speaking rate greatest on pauses */

         arg1 = dpause;
         arg2 = sprat1;
         dpause = mlsh1();
         /* Minimum pause is NF64MS */
         /* EDIT 7/25/90-EAB CHNAGED MINUMUM FROM 64MS TO 7MS AND ADDED MAGIC */
         /* NUMBER COMAPAUSE TO SET IT TO 0 FOR TESTING */
         if (dpause < NF7MS)
            dpause = NF7MS;

         /* Skip over remaining duration rules if input is SIL */

         durxx = dpause;
         durinh = durxx;   /* for debugging print only */
         durmin = durxx;
         goto break3;
      }
      /* Rule 2: Lengthening of segments in clause-final rime */
      if (strucboucur >= FCBNEXT)
      {
         deldur = NF40MS;
         /* Except for plosives and voiced fricatives */
         if (((feacur & FVOICD) IS_PLUS)
            && ((feacur & FOBST) IS_PLUS))
         {
            deldur = NF20MS;
         }
         if ((feacur & FPLOSV) IS_PLUS)
         {
            deldur = 0;
         }
         /* Except for sonor conson [rx, lx] followed by voiceless obst */
         if ( ((phocur == RX) || (phocur == LX))
            && ((feanex & FOBST) IS_PLUS)
            && ((feanex & FVOICD) IS_MINUS))
         {
            deldur = NF15MS;
         }
         /* More lengthening of a vowel if in a short phrase */
         if ( (nallotot < 10)
            && (feasyllabiccur IS_PLUS)
            && (strucstresscur IS_PLUS) )
         {
            deldur += (NF30MS - (nallotot>>1));
         }
         /* Less lengthening if next seg is sonorant in same rime */
         if ((feanex & FSON1) IS_PLUS)
         {
            deldur -=NF20MS;
         }

      }
      /* Rule 3: Shortening of non-phrase-final syllabics (pp counted as phrase
       *	     only at slow speaking rates) */
      if (feasyllabiccur IS_PLUS)
      {
         if (((strucboucur < FVPNEXT) && (sprate > 160))
            || (strucboucur < FPPNEXT))
         {
            /* Reduce percent by factor of 0.7 */
            arg1 = N70PRCNT;    arg2 = prcnt;
            prcnt = mlsh1();

         }
      }
      /* Lengthening of phrase-final postvocalic nasal */
      /* OUT	    else {
       if (((feacur & FNASAL) IS_PLUS)
       && (strucstresscur IS_MINUS)
       && (strucboucur >= FVPNEXT)) {
       deldur = deldur + NF20MS;
       prdurs(3);
       }
       } END OUT */

      /* Rule 4: Shorten syll segs in syll-init and medial positions, */
      /* and in unstressed monosyllables */
      if (feasyllabiccur IS_PLUS)
      {
         if (((strucstresscur & FSTRESS_1) IS_MINUS)
            && ((struccur & FTYPESYL) == FMONOSYL))
         {
            /* Secondary-stressed monosyllables shortened by 85% */
            arg1 = N85PRCNT;
 
            if (strucstresscur IS_MINUS)
            {
               /* Unstressed monosyllable shorted by 70% */
 
               arg1 = N70PRCNT;
            }
            arg2 = prcnt; prcnt = mlsh1();
         }
         else if (((struccur & FTYPESYL) != FMONOSYL)
            && (strucboucur < FWBNEXT) )
         {
            /* Initial vowel of each word is shorter by .85 (was 0.7) */
            arg1 = N85PRCNT;
 
            if ((struccur & FTYPESYL) > FFIRSTSYL)
            {
               /* Other nonfinal syllables shortened by 0.85 */
 
               arg1 = N85PRCNT;
            }
            arg2 = prcnt; prcnt = mlsh1();
            /* Stressed vowels are more compressible if in nonfinal syll */
            /* OUT		    if (strucstresscur IS_PLUS) {
             durmin -= (durmin>>2);
             }					END OUT */

         }
         break1:

         /* Rule 5: Shorten vowels in polysyllabic words */
         if ((struccur & FTYPESYL) != FMONOSYL)
         {
            /* Multiply by 0.8 */
 
            arg1 = prcnt; arg2 = N80PRCNT; prcnt = mlsh1();

         }
      }
      /* Rule 6: Shortening of non-word-initial consonants */
      if ((feasyllabiccur IS_MINUS) && ((struccur & FWINITC) IS_MINUS))
      {
         if (((feacur & FOBST) IS_PLUS)
            && ((feacur & FPLOSV) IS_MINUS)
            && ((struccur & FBOUNDARY) == FWBNEXT))
         {
            /* Except that word-final fricatives are lengthened */
            deldur += NF20MS;
         }
         else
         {
            /* Multiply by 0.85 */
            arg1 = prcnt; arg2 = N85PRCNT; prcnt = mlsh1();
 
         }

      }
      /* Rule 7: Shortening of unstressed segs */
      if ((strucstresscur & FSTRESS_1) IS_MINUS)
      {
         if ((durmin < durinh) && ((feacur & FOBST) IS_MINUS))
         {
            /* Non-stressed segs more compressible (except obstruents) */
            if (strucstresscur IS_MINUS)
            {
               durmin = durmin >> 1;
            }
            else
            {
               durmin -= (durmin >> 2);   /* 2-stress */
            }
         }
         /* Non-primary-stressed syllabic segments shorter */
         if (feasyllabiccur IS_PLUS)
         {
            /* Shorten word - medial syllable more */
            if ((struccur & FTYPESYL) == FMEDIALSYL)
            {
 
               prcnt = prcnt >> 1;
            }
            else
            {
               /* Multiply by 0.7 */
 
               arg1 = prcnt; arg2 = N70PRCNT;
               prcnt = mlsh1();
            }
            /* Special case: Schwa next to a flap or followed by HX */
            if ((phocur == AX) || (phocur == IX))
            {
               if ((pholas== DX) || (phonex== DX) || (phonex== HX))
               {
                  deldur += NF25MS;
               }
            }
         }
         else
         {
            /* Extra shortening of w,y,r,l */
            if ((phocur >= W) && (phocur <= LL))
            {
               prcnt = prcnt >> 1;
            }
            else
            {
               /* All other consonants */
               /* Multiply by 0.7 */
 
               arg1 = prcnt; arg2 = N70PRCNT;
               prcnt = mlsh1();
            }
         }

      }
      /* Penultimate lengthening of stressed syllabic if hat fall f0 gesture */
      else
      {
         if (feasyllabiccur IS_PLUS)
         {
            if ( ((struccur & FHAT_ENDS) IS_PLUS)
               && (strucboucur < FVPNEXT)
               && (strucboucur > FMBNEXT) )
            {
               deldur = deldur + NF25MS;
            }
         }
      }
      /* Rule 8: Lengthen each seg of an emphasized syllable, including rime */
      if (((struccur & FWINITC) IS_PLUS)
         || ((feasyllabiccur IS_PLUS) && (strucstresscur != FEMPHASIS)))
      {
         emphasissw = FALSE;
      }
      if (strucstresscur == FEMPHASIS)
      {
         emphasissw = TRUE;
      }
      if (emphasissw == TRUE)
      {
         deldur = deldur + NF20MS;
         if (feasyllabiccur IS_PLUS)    deldur = deldur + NF40MS;

      }
      /* Rule 9: Influence of final conson on vowels and postvoc sonor */
      /* Switch to indicate presence of a postvocalic sonorant */
      psonsw = 0;      /* Set to 1 if +syl is followed by sonor */
      arg1 = FRAC_ONE;   /* Default if posvoc not obst */
      posvoc = SIL;   /* Default postvocalic consonant */
      /* Does rule apply ? */


      if ( (feasyllabiccur IS_PLUS)
         || ( (phocur >= RX) && (phocur <= NX)
         &&   ((struccur & (FSTRESS | FWINITC)) IS_MINUS)
         &&   ((feanex & FOBST) IS_PLUS) ) )
      {
         /* Determine whether next segment is postvocalic consonant */
         if ( ((feanex & FSYLL) IS_MINUS)
            && ((strucnex & (FSTRESS | FWINITC)) IS_MINUS) )
         {
            posvoc = phonex;
            /* See if postvocalic consonant is a sonorant */
            /* or if postvoc sonor is followed by an obst cons */
            if (((posvoc >= RX) && (posvoc <= NX))
               && ((featb[allophons[nphon + 2]] & FOBST) IS_PLUS)
               && ((allofeats[nphon+2] & (FSTRESS | FWINITC)) IS_MINUS))
            {
               psonsw = 1;
               posvoc = allophons[nphon + 2];
            }
            /* If posvoc is now voicless or obst or nasal, do something */
            if (posvoc != SIL)
            {
               if ((featb[posvoc] & FVOICD) IS_MINUS)
               {
                  deldur = deldur - (deldur >> 1);
                  /* Multiply by 0.8 if a voiceless fric */
 
                  arg1 = N80PRCNT;
                  if (((featb[posvoc] & FPLOSV) IS_PLUS)
                     || (posvoc == CH))
                  	{
                     /* Multiply by 0.7 if a voiceless plosive */
 
                     arg1 = N70PRCNT;
                  	}
					  
               }
               /* Postvocalic segment is voiced */
               else
               {

                  /* Assume voiced plosive, multiply by 1.2 */
                  if ((featb[posvoc] & FOBST) IS_PLUS)
                  {
 

                     arg1 = N120PRCNT;
                     /* Voiced fricative, add 25 ms to +syl */
                     if (((featb[posvoc] & FPLOSV) IS_MINUS)
                        /* OUT				  && (strucboucur >= FVPNEXT)   END OUT */
                        && (posvoc != DX)
                        && ((feacur & FSYLL) IS_PLUS))
                     {
                        deldur = deldur + NF25MS;
                     }

                  }
                  /* Nasal, multiply by 0.85 */
                  else if ((featb[posvoc] & FNASAL) IS_PLUS)
                  {
 
                     arg1 = N85PRCNT;
                  }
               }
            }
         }
         /* Attenuate effect if not phrase-final or +syl followed by sonor */
         /* or if postvoc sonor next */
         if ((strucboucur < FVPNEXT) || (psonsw == 1))
         {
            arg1 = FRAC_HALF + (arg1 >> 1);
         }
         /* Multiply by 0.1 if [nt] is  postvocalic cluster (T nonwordinit) */
         if (((phocur == N) && (phonex == T))
            && ((strucnex & (FWINITC | FSTRESS)) IS_MINUS))
         {
 
            arg1 = N10PRCNT;
            if (((featb[allophons[nphon+2]] & FSYLL) IS_PLUS)
               && ((allofeats[nphon+2] & FMEDIALSYL) IS_MINUS))
            {
               allophons[nphon+1] = D;   /* Change to [d] after durs */
 
               arg1 = N70PRCNT;
            }
         }
			

         arg2 = prcnt;
			prcnt = mlsh1();
      }
      /* Rule 10: Lengthen first vowel of a two vowel sequence */
      if (feasyllabiccur IS_PLUS)
      {
         if ((feanex & FSYLL) IS_PLUS)
         {
            deldur = deldur + NF30MS;

         }
         /* Rule 11: Lengthen word-initial stressed vowel of polysyllabic word */
         if ( ((struccur & FTYPESYL) == FFIRSTSYL)
            && ((struccur & FSTRESS_1) IS_PLUS)
            && ((struclas & FWINITC) IS_MINUS))
         {
            deldur += NF25MS;
         }
         /* Rule 12: Shorten vowels before postvocalic L */
         if (phonex == LX)
         {
            deldur -= NF20MS;
         }
      }
      /* Rule 13: Shorten consonant clusters */
      else
      {
         if ((feacur & FCONSON) IS_PLUS)
         {
            if (((feanex & FCONSON) IS_PLUS)
               && (strucboucur < FVPNEXT))
            {
               /* First consonant of a two - consonant sequence */
               /* Default shortening is 70 percent */
               arg1 = N70PRCNT;
               /* Length nasal by 1.5 if next cons is word-init */
               if (((feacur & FNASAL) IS_PLUS)
                  && ((strucnex & FWINITC) IS_PLUS))
               {
                  arg1 = N150PRCNT;
               }
               /* Also make min duration shorter for C's in a cluster */
               else durmin -= (durmin>>2);
               /* Shorten [S,TH] followed by a plosive or [SH] */
               if ((phocur == S) || (phocur == TH))
               {
                  if ((feanex & FPLOSV) IS_PLUS)
                  {
                     /* Multiply by 0.5 */
                     arg1 = FRAC_HALF;
                  }
                  if (phonex == SH)
                  {
                     durxx = NF15MS;
                     goto break3;
                  }
               }
               arg2 = prcnt;    prcnt = mlsh1();

            }
            if (((fealas & FCONSON) IS_PLUS)
               && ((struclas & FBOUNDARY) < FVPNEXT))
            {
               /* Second consonant of a two-consonant sequence */
               /* Multiply by 0.7 */
               arg1 = N70PRCNT;
               /* Also make min duration shorter for C's in a cluster */
               durmin -= (durmin>>2);
               if ((feacur & FPLOSV) IS_PLUS)
               {
                  /* Shorten plosive if preceded by [s] */
                  /* Multiply by 0.6 */
                  if (pholas == S)
							{
							arg1 = N60PRCNT;
							}
                  /* Shorten unstr plos if preceded by nasal */
                  if ((fealas & FNASAL) IS_PLUS)
                  {
                     /* Multiply by 0.1 */
                     if (strucstresscur IS_MINUS)    arg1 = 1638;
                  }
                  /* OUT	                  Do not shorten a plos preceded by a plos
                   if ((fealas & FPLOSV) IS_PLUS)
                   arg1 = FRAC_ONE;
                   END OUT */
               }
               arg2 = prcnt;    prcnt = mlsh1();

            }
         }
      }
      /* Rule 14: Increase sonor dur if preceding plosive is aspirated */
      if ((feacur & FSON1) IS_PLUS)
      {
         if (((fealas & FVOICD) IS_MINUS)
            && ((fealas & FPLOSV) IS_PLUS))
         {
            deldur = deldur + NF20MS;

         }
      }
      /* Rule 15: Increase duration of phrase-initial vowels (following silence) */
      if ((feacur & FVOWEL) IS_PLUS)
      {
         if (pholas == SIL)
         {
            deldur = deldur + NF20MS;

         }
      }
      /* Rule 16: Increase vowel dur if preceeded by non-nasal sonor conson */
      /* (May not apply to function words such as "was,were") */
	  
      if ((feacur & FVOWEL) IS_PLUS)
      {
         if (((fealas & FSON2) IS_PLUS)
            && ((fealas & FNASAL) IS_MINUS))
         {
            if (deldur == 0)    deldur = NF20MS;

         }
      }
      /* Rule 17: More lengthening of segments if in a short phrase */
		/* added df temporarily -need to refine rule wtih tony. */

      if ((nallotot < 15) && (durinh != durmin))
		{

         /* Each segment of [bab] lengthened by 19 ms */
         deldur += (NF30MS - (nallotot>>1))+3;

		// prcnt =+ 10;
		 //deldur += 4;

      }
/*#define NEVER*/
#ifdef NEVER
		/* xxxx testing shouwed new rules not good*/

	hurt influence
	/*		Rule 18:Shortening of prevocalic clustered semivowels clustered *
		on left by stop or frcative. Before this rule, many sounded like *
		syllabic reduced segmanents, so fruit sounded like feruit. */
		if ((feacur & FSONCON) IS_PLUS &&
			((fealas & FOBST) IS_PLUS))
			{
			arg1=prcnt;
			arg2=N60PRCNT;
			prcnt = mlsh1();
			}
#endif

		/* RULE 19: Shorten function word final TH as in "with: */
		if ((phocur == TH) && ((struccur & FTYPESYL) == FMONOSYL)  &&
			(strucboucur >= FWBNEXT) &&
			(strucstresscur == FNOSTRESS))
			{
			arg1=prcnt;
			arg2 =  N60PRCNT;
			prcnt = mlsh1();

 
			}

		/*RULE 20: lengthen i in "the"("me,he" also OK followed by vowel*/
		if ((phocur ==IY) && ((struccur &FBOUNDARY) > FMBNEXT) &&
			(strucstresscur == FNOSTRESS) &&
			((struccur & FTYPESYL) == FMONOSYL))
			{
			arg1 = prcnt;
			arg2 = N150PRCNT;
			prcnt = mlsh1();

			}
		/*RULE 21 SHorten stop following a stop and preceding a fricative
			within the same sylable. Before this words like products have
			just as long a /k/ and /t/ as a word missing the other stop
			would have, whereas in reality the /t/ should be reduced greatly.
			Cut minimum duration in half, and reduce the multiplier a lot.
			Probably actually want to reduce this eve more.*/

		   if(((feacur & FPLOSV) IS_PLUS) &&
			((fealas & FPLOSV) IS_PLUS) &&
			((feanex & FOBST) IS_PLUS) &&
			(strucboucur > FMBNEXT)) 

			{
			durmin = durmin >>1;
			arg1= prcnt;
			arg2 = N25PRCNT;
			prcnt = mlsh1();

			}


		/* rule 23  shorten vowel if phonex == df writing versus riding*/
			if (phonex == DF)
			{
			arg1=prcnt;
			arg2 =  N35PRCNT;
			prcnt = mlsh1();

			}
	/* eab 3-94 new rule needs more verification and perhaps refinement*/
			if ( (feanex & FPLOSV) IS_PLUS && (feacur & FCONSON) IS_PLUS)
				{
				arg1=prcnt;
				arg2=N50PRCNT;
				durmin=durmin>>1;
           	prcnt=mlsh1();

				}


			
		strucstressprev = strucstresscur;

      /* Finish up */

      /* Set duration from durinh, durmin, and percent */
      durxx = (prcnt * (durinh - durmin)) DIV_BY128;
      durxx += durmin;   /* SHOULD BE DONE AFTER SPRATE ADJUSTMENT */

      /* Effect of speaking rate */
      if ((sprat0 != 180) && (durxx != 0))
      {
         arg1 = durxx;
         arg2 = sprat2;
         durxx = mlsh1()+1;   /* Round upwards */

         /* Effect of speaking rate on additive increment to dur */
         arg1 = deldur;
         arg2 = sprat1;
         deldur = mlsh1();
      }
      /* Add in rule-governed additive increment to dur  */
      durxx = durxx + deldur;
		
#ifdef EABDEBUG 
		printf("final duration = %d  durxx  \n",((durxx*NSAMP_FRAME)+5)/10);

#endif

      break3:

		/*ccc change for 1/2 sample*/

if (NSAMP_FRAME == 128) 
      durxx =  (durxx>>1);    /* Save in array for phonetic comp */

		if (durxx <=0)
			durxx=1;

      allodurs[nphon] = (durxx);    /* Save in array for phonetic comp */



      longcumdur += (durxx * NSAMP_FRAME);   /* Cum dur in waveform samples     */
   }

}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			I N I T - T I M I N G			     */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifdef   vax
/*    Indication whether duration file exists, and array for expected durs */
extern FILE *fdin;
extern int edurs[]; 

/* commented out as unused var - 8/9/95  JDB
static float fac;                           
*/

#endif

init_timing()
{
   if (sprate != sprlast)
   {
      if (sprate < 75)
         sprate = 75;
      else if (sprate > 600)
         sprate = 600;
      sprlast = sprate;

      /* Linearize (calibrate) high speaking rates by a fudge */
      /* Tuned to perform on 300 word standard passage published on p. 114
       of G. Fairbanks ^^Voice and Articulation Drill Book^^ */
      if (sprate > 250)
         sprat0 = 250 + ((sprate - 250)>>1);
      else
         sprat0 = sprate;

      /* For sprat0 = 300, sprat1 = 0.4, sprat2 = 0.56 */
      /* For sprat0 = 240, sprat1 = 0.7, sprat2 = 0.8  */
      /* For sprat0 = 180, sprat1 = 1.0, sprat2 = 1.0  */
      /* For sprat0 = 120, sprat1 = 1.5, sprat2 = 1.25 */

      /* Effect of speaking rate on additive pauses (sprat1) */
      if (sprat0 >= 180)
      {
         arg3 = 220;
         arg2 = 425 - sprat0;
      }
      else
      {
         arg3 = 120;
         arg2 = 300 - sprat0;
      }
      arg1 = FRAC_ONE;
      if(arg2 < 0)
         arg2=1;
      sprat1 = muldv();

      /* Effect of sp. rate on compressible part of seg dur (sprat2) */
      if (sprat0 > 180)
      {
         arg2 = 460 - sprat0;
         arg3 = 280;
         if(arg2 <= 0)
            arg2 = 1;
         sprat2 = muldv();
      }
      else
      {
         sprat2 = ((unsigned)sprat1 + FRAC_ONE) >> 1;
      }
   }
   /* Zero counters */

   nrises_sofar = 0;   /* Number of accent rises in clause sofar  */
   pholas = SIL;
   fealas = featb[SIL];
   struclas = 0;
   longcumdur = 0;
   emphasissw = FALSE;
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

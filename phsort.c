/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *	Copyright 1984					Dennis H. Klatt
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
 *    File Name:	phsort.c
 *    Author:		Dennis Klatt
 *    Creation Date:16-SEP-1984
 *
 *    Functionality:
 *	Convert int string of phonemes/accents/boundaries into
 *	  integer phoneme sequence with parallel structure features.
 *
 ***********************************************************************
 *    Revision History:
 * 0001 16-Sep-84 DK	Initial creation
 * 0002 27-Dec-84 DC	Modify to work on 80186
 * 0003  8-Jan-84 DK	Correct the location of FHAT_ENDS feature
 *			 and treatment of f0mode state variable
 * 0004 29-Jan-85 DK	Clause-final function word promoted to secondary stress
 *			 (kludge to compensate for lack of a decent parser)
 * 0005  1-Mar-85 DK	Add cbsymbol, set to QUEST if see "?" in input
 * 0006 25-Apr-85 DK	Promote [(] to [)] or [,], and [)] to [,] at slow sprate
 * 0007 15-May-85 DK	Promote stress of [(...] to primary
 * 0008 23-May-85 DK	Fix error in promotion of [(`^p] to [ '^p], default str
 *			 placed on first vowel of last word if no stressed words
 * 0009 25-Jun-85 DK	Fix dangling stress, /, or \ movement routine
 * 0010 23-Jul-85 DK	Fix get_stress_of_conson() using CONROY algorithm
 * 0011 26-Aug-85 DK	Any phrase must have one primary stress
 * 0012 22-NOV-89 EAB	 EDIT OUT TROJAN HORSE
 *
 */

#include "phdefs.h"

/*    Input arrays: */
extern short symbols[];  /* Integer represent of input string   */
extern short nsymbtot;   /* Number of input symbols		*/
#ifndef MINIMAL_SYNTH
extern short *user_durs; /* Optional array user-specified durs  */
extern short *user_f0;    /* Optional array user-specified f0	*/
//extern short *user_offset;/* Optional array of f0 offset times	*/
extern short sprate;    /* Promote weak boundaries at slow rate */
#endif

/*    Output arrays: */
extern char *phonemes;    /* Output array for phonemes only	*/
extern short *sentstruc; /* Output array sentence struc features */
extern short nphonetot;    /* Number of output phonemes		*/
#ifdef newpargrnotused
extern FLAG newparagsw;  /* Set to 1 here if see [{] in input	*/
#endif
extern short f0mode;    /* State variable indicting type of f0 */
extern short emphasisflag;/* Set to TRUE if clause contains emph */
extern short cbsymbol;    /* Indicates if clause is a question	*/

/*    From PHROM.C */
extern short featb[];   /* Feature assignment to each phonetype	*/
/*#define DEBUGIND	1 /*  for degbuggin eab*/
#define CURRPHONE   nphonetot-1
#define NEXTPHONE   nphonetot
static short n=0,curr_dur=0,curr_f0=0;
static short compound_destress=0;
static short curr_in_sym=0,word_init_sw=0,in_rhyme,m,mf0,nstresses=0;
static short nstartphrase=0;
unsigned int snphonetot=0;
int did_del=0;
int del_cnt=0;
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

phsort()
{
	did_del = 0;
	del_cnt=0;
   /* Clear structure array */

   for (n=0; n<nsymbtot; n++)
   	{
      sentstruc[n] = 0;
   	}
   f0mode = NORMAL;
   emphasisflag = FALSE;
   cbsymbol = 0;

   /* Main loop 1: Clean up input string re mis-orderings & extra boundaries */

   nstresses = 0;
   nstartphrase = 0;
   for (n=0; n<nsymbtot; n++)
   {
		if(did_del)
			{
			n--;/*delete was done so back up one to process shifted phoneme eab*/
			did_del =0;
			del_cnt++;
			}
		/*xxx new code to do compound destress correctly eab 8/94*/
		if(symbols[n]==HYPHEN)
			{
			compound_destress=TRUE;
			}

      if(symbols[n]==S1 && compound_destress)
		/*xxx new code to do compound destress correctly eab 8/94*/
			{
			symbols[n]=S2;
			compound_destress=FALSE;
			}
		
      if(symbols[n]==SPECIALWORD)
      	{
         delete_symbol(n);
      	}

      if(KS.halting)
         return(false);
#ifdef DEBUGIND
		printf("symbols[n] =	%d n=%d \n",symbols[n],n );
#endif
      /* Check for user F0 commands in input string for this clause	*/

      /* RULES for input of a user f0 command			*/
      /* 1. If no f0 commands in input, set f0mode = NORMAL	*/
      /* 2. If explicit [/] or [\] phonemes in input,		*/
      /* set f0mode = HAT_LOCATIONS_SPECIFIED		*/
      /* 3. If first f0 command is attached to phoneme and has	*/
      /* value <= 37, set f0mode = SINGING			*/
      /* 4. If first f0 command is attached to phoneme and has	*/
      /* value > 37, set f0mode = PHONE_TARGETS_SPECIFIED	*/
      /* 5. If first f0 command is attached to non-phoneme ['],	*/
      /* [/], or [\], set f0mode = HAT_F0_SIZES_SPECIFIED	*/
      /* NOTE cases are mutually exclusive except 2&5 so all	*/
      /* f0 commands must be of same category within clause */

      /* RULES for interpretation of user f0 commands		*/
      /* SINGING:  e.g. [a<500,22>].				*/
      /* If duration attached to phoneme, convert to frames	*/
      /* If note number attached to phoneme, convert to Hz	*/
      /* Go to new note linearly in freq over 160 ms, start	*/
      /* at begin time of phoneme.				*/
      /* Add vibratto of +/-1.8 Hz, at 6.5 Hz repetition rate */
      /* PHONE_TARGETS_SPECIFIED:  e.g. [a<,125>]		*/
      /* If duration attached to phoneme, convert to frames	*/
      /* If f0 target attached to phoneme, convert to Hz	*/
      /* Go to new f0 target linearly in freq over duration	*/
      /* of phoneme, start at beginning of phoneme		*/
      /* All Hz values are absolute, there is no spdef scaling */
      /* HAT_LOCATIONS_SPECIFIED:  e.g. [/'ab\a]		*/
      /* Example: hat rise on first stressed vowel (as is	*/
      /* usual in DECtalk), but fall on final unstressed V	*/
      /* Usual practice of Dectalk determining hat locations	*/
      /* is totally disabled, rises and falls occur only on	*/
      /* phone following the rise or fall symbol.		*/
      /* Phone following rise and/or fall must be +syllabic	*/
      /* or PHSORT will produce garbage			*/
      /* Rise and fall symbols must alternate, first is rise	*/
      /* If syllable will have rise, stress pulse, & fall, it */
      /* is best to specify them in that order, i.e. [/'\a] */
      /* HAT_F0_SIZES_SPECIFIED:  e.g. [/'<,12>\<,40>a]		*/
      /* Example: use normal hat rise, 12 Hz stress impulse,	*/
      /* and 40 Hz hat fall, times of events are normal	*/
      /* Disable prediction of where to insert hat rises &	*/
      /* falls if there are [/] and [\] symbols present, or	*/
      /* if ['] has an attached user f0 command		*/
      /* Override computed values for hat rise, fall, and	*/
      /* stress pulses if a user-specified f0 command is	*/
      /* attached to [/], [\], or [']			*/
      /* Continue to add continuation rises at commas and	*/
      /* add question intonation by rule			*/
      /* If duration attached, it is time of f0 event onset	*/
      /* relative to onset of next phone (can be negative)	*/
      /* F0 targets attached to [/] are step rises, attached	*/
      /* to [\] are step falls, and attached to ['] are	*/
      /* stress impulses; amount is given in nominal Hz	*/
      /* All Hz values are subjected to spdef scalings	*/
      /* No more than one rise, one stress pulse and one fall */
      /* allowed on each vowel, in that order		*/
      if ((symbols[n] >= HAT_RISE) && (symbols[n] <= HAT_RF))
      {
         if (f0mode == NORMAL)
         {
            f0mode = HAT_LOCATIONS_SPECIFIED;
         }
      }

      /* Clause-final function word (preceded by [(]) should be stressed */
      if (symbols[n] == PPSTART)
      {
         /* Examine input for next bound, see if cbound or greater */
         m = n + 1;
         while (m < nsymbtot)
         {
            if (is_wboundary(symbols[m]))
            {
               if ((symbols[m] >= COMMA)
                  || ((symbols[m] == PPSTART) && (symbols[m+1] != W)))
               {
                  symbols[n] = WBOUND;   /* Replace [(] by [ ] */
                  /* Raise PPSTART to VPSTART to set off verbal particle */
                  if (symbols[m] == PPSTART)
                  {
                     symbols[m] = VPSTART;
                  }
                  /* Unreduce the vowel in "for, to, into" */
                  if ((symbols[n+1] == F) && (symbols[n+2] == RR))
                  {
                     symbols[n+2] = OR;
                  }
                  if ((symbols[m-2] == T) && (symbols[m-1] == UH))
                  {
                     symbols[n+2] = UW;
                  }
                  /* Promote init secondary stress, or find V to stress */
                  if (symbols[n+1] == S2)
                  {
                     symbols[n+1] = S1;   /* Replace [`] by ['] */
                  }
#ifndef MINIMAL_SYNTH
                  else
                  {
                     insertphone(n+1,S1);   /* Insert dangling ['] */
                     move_stdangle(n+1);    /* Move to right place */
                  }
#endif
               }
               break;
            }

            m++;
         }
      }

      /* Look for dangling stress mark (i.e. not followed by +SYLL) */
      if ((symbols[n] >= S2) && (symbols[n] <= SEMPH))
      {
         if ((symbols[n] == S1) || (symbols[n] == SEMPH))
         {
            nstresses++;   /* Count # stresses to this point */
         }
         /* Examine following input for next segment, see if syllabic */
         m = n + 1;
         while ((symbols[m] >= TOT_ALLOPHONES) && (m < nsymbtot))
         {
            if (symbols[m] > WBOUND && symbols[m] < NEW_PARAGRAPH
					&& symbols[m] != HYPHEN /*xxx for auto compunds*/)
            {
               nstresses--;
#ifdef DEBUGIND

	printf("delete rule 1\n");
#endif

			
               delete_symbol(n);   /* Ignore stress at end of */

               goto stzapped;      /* syllable or word	   */
            }
            m++;
         }
#ifndef MINIMAL_SYNTH
         if ((featb[symbols[m]] & FSYLL) IS_MINUS)
         {
            move_stdangle(n);
         }
#endif
      }
      stzapped:

#ifndef MINIMAL_SYNTH
      /* Remove weaker of two boundary symbols in a row */
      if ((symbols[n] >= SBOUND) && (symbols[n] <= EXCLAIM))
      {
/*         for (m=n+1; m<nsymbtot; m++) out-goofs up when trying to do all at once
         { */

		m=n+1;
		if(m<nsymbtot)
			{
            /*  if (symbols[m] < TOT_ALLOPHONES)    break;*/
            if ((symbols[m] >= SBOUND) && (symbols[m] <= EXCLAIM))
            {

               zap_weaker_bound(n,m);
            }
         } 
      }
#endif
#ifndef MINIMAL_SYNTH
      /* Replace weak boundaries by stronger ones at slow rates */
      if (sprate <= 120)
      {
         if ((symbols[n] == VPSTART) || (symbols[n] == PPSTART))
         {
            symbols[n] = COMMA;
         }
      }
      else if (sprate <= 140)
      {
         if (symbols[n] == PPSTART)
         {
            symbols[n] = VPSTART;
         }
      }
		
      /* Every breath group must have at least one 1-stress */
      if ((symbols[n] >= COMMA) && (symbols[n] <= EXCLAIM))
      {

         if ((n > 0) && (nstresses == 0))
         {
            find_syll_to_stress(n);
         }
      }
#endif
      /* Reset to new phrase if encounter [ } , . ? ! ] */
      /* NOTE: Phoneme RELSTART = [}] not currently defined.  When it is,
       *       all words in FUNWRD1.DIC that introduce relative clauses, such as
       *       "when, that, which" should have [}] symbol appended to front. */
      if ((symbols[n] >= RELSTART) && (symbols[n] <= EXCLAIM))
      {
         nstresses = 0;
         nstartphrase = n;
      }
      /* Exclamation point raises last stress of sentence to emphasis */
#ifndef MINIMAL_SYNTH
      if (symbols[n] == EXCLAIM)
      {
         raise_last_stress(n);
      }
      /* Set varaible to indicate a question sentence */
      if (symbols[n] == QUEST)
      {
         cbsymbol = QUEST;
      }
#endif
   }
   /* Main loop 2: for each input symbol, pass to output array or turn into */
   /* a feature value */

   mf0 = 0;
   nphonetot = 0;
   word_init_sw = FALSE;
   in_rhyme = FALSE;
#ifdef newpargrnotused
   newparagsw = FALSE;
#endif
   for (n=0; n<nsymbtot; n++)
   {
      snphonetot=nphonetot;

      if(KS.halting)
         return(false);

      curr_in_sym = symbols[n];   /* Precompute useful variable */
#ifndef MINIMAL_SYNTH
      curr_dur = user_durs[n];   /* User-specified dur if non-zero */
      user_durs[n] = 0;

      curr_f0 = user_f0[n];   /* User-specified f0 if non-zero  */
      user_f0[n] = 0;

      /* Check to see if user-specified f0 hats/stress-pulses */

      interp_user_f0();
#endif

      /* Switch on the current input symbol */

      if (curr_in_sym < TOT_ALLOPHONES)
      {      /* A real phoneme */

         make_phone(curr_in_sym); /* eab try handling stuff in make */

         /* If syllabic, look ahead to see initial/medial/final syll */
         if ((featb[curr_in_sym] & FSYLL) IS_PLUS)
         {
            word_init_sw = FALSE;
            in_rhyme = TRUE;
            init_med_final(n);
         }
         /* Assign stress feature to consonants */
         else
         {
            get_stress_of_conson(n);
         }
         /* Assign word-initial feature to consonant(s) */
         if (word_init_sw == TRUE)
         {
            add_feature(FWINITC,CURRPHONE);
         }
         /* Assign boundary type to segments of rhyme */
         if (in_rhyme == TRUE)
         {
            get_next_bound_type(n);
         }
      }
      else
      {               /* A non-phoneme */

         switch(curr_in_sym)
         {
            case S1:
                  add_feature(FSTRESS_1,NEXTPHONE);
               break;
            case S2:
                  add_feature(FSTRESS_2,NEXTPHONE);
               break;
            case SEMPH:
               add_feature(FEMPHASIS,NEXTPHONE);
               emphasisflag = TRUE;  /* Reduce other f0 gestures */
               break;
            case HYPHEN:
               break;
            case WBOUND:
            case PPSTART:
            case VPSTART:
            case RELSTART:

					if(symbols[n+1] == HYPHEN)
						{

						break;/*xxx here to allow compound noun insert*/
					}
               word_init_sw = TRUE;

               break;
            case COMMA:
            case PERIOD:
            case QUEST:
            case EXCLAIM:
               make_phone(SIL);
               word_init_sw = TRUE;
               compound_destress = FALSE;

               break;
            case HAT_RISE:
               add_feature(FHAT_BEGINS,NEXTPHONE);
               break;
            case HAT_FALL:
               add_feature(FHAT_ENDS,NEXTPHONE);
               break;
            case BLOCK_RULES:
               add_feature(FBLOCK,NEXTPHONE);
               break;
            case NEW_PARAGRAPH:
#ifdef newpargrnotused
               newparagsw = TRUE;
#endif
               break;
            default:
               break;
         }
      }
      if ((nphonetot == snphonetot) )/* eab */
      {
#ifndef MINIMAL_SYNTH
#ifndef NO_INDEXES
         	adjust_index((n+1),-1,0); /* eab n+1 to bind forward */
#endif
#endif
#ifdef DEBUGIND

			printf("adj -1 on %d %d \n",curr_in_sym,(n+1));
#endif
      }
   }
   return(true);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#ifndef MINIMAL_SYNTH
interp_user_f0()
{
   /* If attached to a 1-stress symbol, dur,f0 mean stress-impulse commands */
   if ((curr_in_sym == S1) || (curr_in_sym == SEMPH)
      || (curr_in_sym == HAT_RISE) || (curr_in_sym == HAT_FALL)
      && (f0mode != PHONE_TARGETS_SPECIFIED)
      && (f0mode != SINGING))
   {
      if ( (curr_f0 != 0) || (f0mode == HAT_F0_SIZES_SPECIFIED) )
      {
         /* Truncate f0 gestures that are unreasonable */
         if (curr_f0 < 0)    curr_f0 = -curr_f0;
         if (curr_f0 > 199)    curr_f0 = 199;   /* Should be about 50 */
         /* Attach flags to identify what kind of f0 gesture */
         if (curr_in_sym == HAT_RISE)
            curr_f0 += 200;
         else if (curr_in_sym == HAT_FALL)
            curr_f0 += 400;
         else
            curr_f0 += 1000;
         user_f0[mf0] = curr_f0;
//         user_offset[mf0] = curr_dur;
         curr_dur = 0;
         curr_f0 = 0;
         f0mode = HAT_F0_SIZES_SPECIFIED;
      }
      /* mf0 counts # of HAT_RISE, HAT_FALL, S1, & SEMPH symbols */
      mf0++;      
   }
   /* Otherwise, they are note commands for singing, or f0 targets for segs */
   else if (curr_f0 != 0)
   {
      if (f0mode != HAT_F0_SIZES_SPECIFIED)
      {
         if ( (f0mode != PHONE_TARGETS_SPECIFIED)
            && (curr_f0 <= 37))
         {
            f0mode = SINGING;
         }
         else if (f0mode != SINGING)
         {
            f0mode = PHONE_TARGETS_SPECIFIED;
         }
         else
         {

#ifdef DEBUG_USER_PROSODICS
            printf(
            "ERROR in PHSORT: f0 commands for singing and phoneme-targets intermixed\n");
#endif

            curr_dur = 0;
            curr_f0 = 0;
         }
      }
      else
      {

#ifdef DEBUG_USER_PROSODICS
         printf(
         "ERROR in PHSORT: f0 commands for phonemes and stress/hat symbols intermixed\n");
#endif

         curr_dur = 0;
         curr_f0 = 0;
      }
   }
}
#endif
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void init_med_final(short msym)
//short msym;
{
   short m,sylltype;

   sylltype = FMONOSYL;      /* Assume curr word is monosyllabic */

   /* Examine output string to see if any sylls at beginning of word */
   for (m=CURRPHONE-1; m>0; m--)
   {
      if ((sentstruc[m] & FBOUNDARY) >= FWBNEXT)
      {
         break;         /* Beginning of word found */
      }
      else if ((featb[phonemes[m]] & FSYLL) IS_PLUS)
      {
         sylltype = FFINALSYL;      /* Syll exists befor this one */
      }
   }
   /* Examine input string to see if any sylls in remainder of word */
   for (m=msym+1; m<nsymbtot; m++)
   {
      if ((symbols[m] >= WBOUND)
         && (symbols[m] <= EXCLAIM))
      {   /* Look for next boundary */
         if (sylltype != FMONOSYL)
         {
            add_feature(sylltype, CURRPHONE);
         }
         return;
      }
      else if ((featb[symbols[m]] & FSYLL) IS_PLUS)
      {
         if (sylltype == FFINALSYL)
         {
            sylltype = FMEDIALSYL;   /* Syll exists before & after */
         }
         if (sylltype == FMONOSYL)
         {
            sylltype = FFIRSTSYL;   /* Syll exists after only */
         }
      }
   }

#ifdef   vax
   printf("SENTENCE ENDS WITHOUT A BOUNDARY 2 ???\n");
#endif
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Scan forward to see if this consonant is followed by a stress symbol
 * before encounter vowel or boundary.  If so, check to see if legal cluster */

#define NOCLUSTER   0
#define CLUSTER      1
#define CLUSTER_TRYS   2

void get_stress_of_conson(short msym)
//short msym;
{
   short m,mcl,cl,sy,stresslevel;

   stresslevel = FNOSTRESS;
   for (m=msym+1; m<nsymbtot; m++)
   {
      sy = symbols[m];
      /* Search forward from present consonant for nonconsonant */
      if ((sy == S1) || (sy == S2) || (sy == SEMPH))
      {
         /* Number of consonants in potential legal cluster */
         mcl = m - msym;
         /* 1st of more than 3 consonants in a row is not member of cluster */
         if (mcl > 3)
            return;
         /* One consonant is always stressable */
         if (mcl != 1)
         {
            /* See if pair of consonants next to vowel is legal cluster */
            cl = phcluster(symbols[m-2],symbols[m-1]);
            if (cl == NOCLUSTER)
               return;
            /* See if triple of consonants next to vowel is legal cluster */
            if ((mcl == 3)
               && ((cl != CLUSTER_TRYS) || (symbols[m-3] != S)))
               return;
         }
         if (sy == S1)
         {
               add_feature(FSTRESS_1,CURRPHONE);
         }
         if (sy == S2)
         {
               add_feature(FSTRESS_2, CURRPHONE);
         }
         if (sy == SEMPH)
         {
            add_feature(FEMPHASIS, CURRPHONE);
         }
         return;
      }
      if ((featb[sy] & FSYLL) IS_PLUS)
      {
         return;      /* No stress before vowel */
      }
      if ((sy >= SBOUND) && (sy <= EXCLAIM))
      {
         return;      /* No vowel before syllable ends */
      }
   }

#ifdef   vax
   printf("SENTENCE ENDS WITHOUT A BOUNDARY 1 ???\n");
#endif
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* If f & s are first and second elements of potential cluster, return
 *  either CLUSTER, NOCLUSTER, or CLUSTER_TRYS (true and look for prior [s] */

short phcluster(short f,short s)
//short f,s;
{
   switch (f)
   {
      case P:
         if ((s == LL) || (s == R))
            return(CLUSTER_TRYS);
         break;
      case B:
         if ((s == LL) || (s == R))
            return(CLUSTER);
         break;
      case F:
         if (s == R)
            return(CLUSTER_TRYS);
         if (s == LL)
            return(CLUSTER);
         break;
      case T:
         if (s == R)
            return(CLUSTER_TRYS);
         if (s == W)
            return(CLUSTER);
         break;
      case D:
      case TH:
         if ((s == R) || (s == W))
            return(CLUSTER);
         break;
      case K:
         if ((s == R) || (s == LL) || (s == W))
            return(CLUSTER_TRYS);
         break;
      case G:
         if ((s == R) || (s == LL) || (s == W))
            return(CLUSTER);
         break;
      case S:
         if ((s == W) || (s == LL) || (s == P) || (s == T)
            ||  (s == K) || (s == M) || (s == N) || (s == F))
            return(CLUSTER);
         break;
      case SH:
         if ((s == W) || (s == LL) || (s == P) || (s == T)
            ||  (s == R) || (s == M) || (s == N))
            return(CLUSTER);
         break;
   }
   return(NOCLUSTER);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void get_next_bound_type(short msym)
//short msym;
{
   extern short bounftab[];
   short m;

   for (m=msym+1; m<nsymbtot; m++)
   {
      if ((symbols[m] >= SBOUND)
         && (symbols[m] <= EXCLAIM))
      {   /* Look for next boundary */
         add_feature(bounftab[symbols[m] - SBOUND], CURRPHONE);
         return;
      }
      else if ((featb[symbols[m]] & FSYLL) IS_PLUS)
      {
         return;            /* Abort if see vowel first */
      }
   }

#ifdef   vax
   printf("SENTENCE ENDS WITHOUT A BOUNDARY 3 ???\n");
#endif
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Move a stress symbol further into the word so as to either replace a */
/* weaker stress or to appear just before */
/* the next syllabic segment.  If reach strong boundary first, delete stress */
/* If reach another stress mark first, replace it if first stress stronger */
#ifndef MINIMAL_SYNTH
void move_stdangle(msym)
short msym;
{
   short m,stdangle,durdangle,f0dangle;

   stdangle = symbols[msym];
#ifndef MINIMAL_SYNTH
   durdangle = user_durs[msym];
   f0dangle = user_durs[msym];
#endif

   /* 1. If emphasis, replace strongest stress in current word */
   if (stdangle == SEMPH)
   {
      for (m=msym+1; m<nsymbtot; m++)
      {
         if (symbols[m] == S1)
         {
            symbols[m] = SEMPH;
            user_durs[m] = durdangle;
            user_f0[m] = f0dangle;
            delete_symbol(msym);
#ifdef DEBUGIND

	printf("delete rule 2\n");
#endif

				
            return;
         }
         if (is_wboundary(symbols[m]))
         {
            goto br1;   /* No longer current word, give up S1 search */
         }
      }
      br1:       for (m=msym+1; m<nsymbtot; m++)
      {
         if (symbols[m] == S2)
         {
            symbols[m] = SEMPH;
            user_durs[m] = durdangle;
            user_f0[m] = f0dangle;
            delete_symbol(msym);
#ifdef DEBUGIND

	printf("delete rule S2\n");
#endif

            return;
         }
         if (is_wboundary(symbols[m]))
         {
            break;   /* No longer current word, give up S2 search */
         }
      }
   }

   /* 2. If primary stress, replace the first secondary stress encountered */
   /* in word; if none, attach to first vowel in word via step 3 below. */
   if (stdangle == S1)
   {
      for (m=msym+1; m<nsymbtot; m++)
      {
         if (symbols[m] == S2)
         {
            symbols[m] = S1;
            user_durs[m] = durdangle;
            user_f0[m] = f0dangle;
#ifdef DEBUGIND

	printf("delete rule 4\n");
#endif

            delete_symbol(msym);
            return;
         }
         if (is_wboundary(symbols[m]))
         {
            break;   /* No longer current word, give up S2 search */
         }
      }
   }
   /* 3. Attach to first vowel encountered, use stronger of two stresses if */
   /* another stress encountered before vowel encountered */
   for (m=msym+1; m<nsymbtot; m++)
   {
      if (is_wboundary(symbols[m]))
      {
#ifdef DEBUGIND

	printf("delete rule 5\n");
#endif

        delete_symbol(m-1);
		  return;
      }
      if ((symbols[m] >= S2) && (symbols[m] <= SEMPH))
      {
         if (symbols[m] < stdangle)
         {
            symbols[m] = stdangle;
            user_durs[m] = durdangle;
            user_f0[m] = f0dangle;
         }
#ifdef DEBUGIND

	printf("delete rule 6\n");
#endif

         delete_symbol(m-1);
         return;
      }
      else if ((featb[symbols[m]] & FSYLL) IS_PLUS)
      {
         symbols[m-1] = stdangle;  /* Found syllabic, put stress here */
         user_durs[m-1] = durdangle;
         user_f0[m-1] = f0dangle;
         return;
      }
      else
      {
         symbols[m-1] = symbols[m];   /* Move symbol backward one */
         user_durs[m-1] = user_durs[m];
         user_f0[m-1] = user_f0[m];
      }
   }
}
#endif
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* If symbol passed as argument is a word boundary or a stronger boundary, */
/* return TRUE, otherwise return FALSE */

is_wboundary(short symb)
{
   if ( (symb >= WBOUND) && (symb <= EXCLAIM) )
   {
      return(TRUE);
   }
   return(FALSE);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Clause contains no primary stresses; raise first secondary stress */
/* encountered to primary; else stress first vowel of last word */
#ifndef MINIMAL_SYNTH
void find_syll_to_stress(locend)
short locend;
{
   short m,locbeg;
   /* Try to promote a secondary stress to primary, working from back */
   for (m=locend-1; m>=nstartphrase; m--)
   {
      if (symbols[m] == S2)
      {
         symbols[m] = S1;
         return;
      }
   }
   /* Else try to find a vowel to stress in last word */
   for (m=locend-1; m>=nstartphrase; m--)
   {
      if (symbols[m] >= WBOUND)
      {

         locbeg = m;
         break;
      }
   }
#ifndef MINIMAL_SYNTH
   for (m=locbeg; m<locend; m++)
   {
      if ((featb[symbols[m]] & FSYLL) IS_PLUS)
      {

         insertphone(m,S1);   /* Insert S1 at location m */
         n++;         /* Move pointer in calling loop */
         return;
      }
   }
   /* Else give up, clause contains no primary stresses */
#endif
#ifdef   vax
   printf(
   "WARNING in PHSORT: Can't find vowel to stress in this phrase.\n");
#endif
}
#endif
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Insert a phoneme 'fone' at location 'loc', push down all future phones */

void insertphone(loc,fone)
short loc,fone;
{
   short m;
   if (nsymbtot >= NPHON_MAX)    return;   /* No room, do nothing */
   for (m=nsymbtot; m>loc; m--)
   {
      symbols[m] = symbols[m-1];
#ifndef MINIMAL_SYNTH
      user_durs[m] = user_durs[m-1];   /* Push down */
      user_f0[m] = user_f0[m-1];      /* user dur/f0 */
#endif
   }
   symbols[loc] = fone;
#ifndef MINIMAL_SYNTH
   user_durs[loc] = 0;
   user_f0[loc] = 0;
#endif
   nsymbtot++;
#ifndef MINIMAL_SYNTH
#ifndef NO_INDEXES
   adjust_index((loc+1),1,0);
#endif
#endif
#ifdef DEBUGIND
	printf("loc %d nsymbtot %d \n",loc,nsymbtot);
	printf("adj +1 inserting %d \n",fone);
#endif
   return;
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#ifndef MINIMAL_SYNTH
void raise_last_stress(msym)
short msym;
{
   short m;

   for (m=msym-1; m>0; m--)
   {
      if (symbols[m] == S1)
      {
         symbols[m] = SEMPH;
         return;
      }
   }
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Args point to two boundary markers in symbols[].  Zap weaker of two */
/* eab and promote first one if weaker*/
void zap_weaker_bound(msym1,msym2)
short msym1,msym2;
{
   short m;
   if (symbols[msym1] < symbols[msym2])
   {
/*     symbols[msym1] = symbols[msym2];    Boundarys can't have */
		if(symbols[msym1] != HYPHEN)
			delete_symbol(msym1);
		return;				 
   }
   /* user durs or f0 */
	if(symbols[msym2] != HYPHEN)

   delete_symbol(msym2);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#endif
/* Delete the input symbol in position msym of array symbols[] */

void delete_symbol(short msym)
//short msym;
{
   short m;
#ifdef DEBUGIND
	printf("adj -1 del sym %d at %d \n ",symbols[msym],msym);
#endif

   nsymbtot--;
	did_del=1;
   for (m=msym; m<nsymbtot; m++)
   {
      symbols[m] = symbols[m+1];
#ifndef MINIMAL_SYNTH
      user_durs[m] = user_durs[m+1];   /* If deleted sym has dur or */
      user_f0[m] = user_f0[m+1];      /* f0, it will be lost */
#endif
   }
#ifdef DEBUGIND

	WAIT_PRINT;
	printf("\n sym num %d   ",msym);
	printf("now %d  \n\n ",symbols[msym]);
	SIGNAL_PRINT;
#endif
#ifndef MINIMAL_SYNTH
#ifndef NO_INDEXES
	adjust_index(msym+1,-1,1); /* plus one because index may be pointing
	at this very one in which case it promotes forward (i.e. stays the same)*/
#endif
#endif

}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void make_phone(short phoname)

//short phoname;
{
   if (nphonetot > n)
   {

#ifdef   vax
      printf(
      "ERROR in PHSORT.C: output index nphonetot=%d > input index n=%d\n",
      nphonetot, n);
#endif

      return;
   }
   /* Put phoneme away */
   phonemes[nphonetot] = phoname;
#ifndef MINIMAL_SYNTH
   user_durs[nphonetot] = curr_dur;   /* Move user-specified dur */
#endif
#ifndef MINIMAL_SYNTH
   if (f0mode != HAT_F0_SIZES_SPECIFIED)
   {
      user_f0[nphonetot] = curr_f0;   /* Move user-specified f0 */
   }
#endif
#ifdef DEBUG_USER_PROSODICS
   if (curr_dur != 0)
   {
      printf("\tFound user_dur[%s] = %3d ms in PHSORT\n",
      phprint(phoname), curr_dur);
   }
   if (curr_f0 != 0)
   {
      printf("\tFound  user_f0[%s] = %3d Hz in PHSORT, f0mode = %d\n",
      phprint(phoname), curr_f0, f0mode);
   }
#endif

   /* tag this index */

   /* set_index_phone(n,nphonetot); */
   /* See if there is room for next phoneme */
   if (nphonetot < NPHON_MAX)   nphonetot++;
#ifdef DEBUGIND

	printf("tot= %d phoname=%d \n ",nphonetot,phoname);
#endif
#ifdef   vax
   else
   {
      printf("ERROR in PHSORT.C: nphonetot > %d, ignore [%s]\n",
      NPHON_MAX, phprint(phoname));
   }
#endif
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void add_feature(short feaname,short location)
//short feaname;
//short location;
{
   if ((location < 0) || (location >= NPHON_MAX))
   {

#ifdef   vax
      printf(
      "ERROR in PHSORT.C: Try to put feature at phonemes[%d] = \n",
      location);
      feprint(feaname);
#endif

      return;
   }
   if ((feaname <= 0) || (feaname > FMAXIMUM))
   {

#ifdef   vax
      printf(
      "ERROR in PHSORT.C: Try to add illegal feature 0%o to phonemes[%d]\n",
      feaname, location);
#endif

      return;
   }
   /* Do it */
   sentstruc[location] |= feaname;
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


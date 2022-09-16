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
 *    File Name:	phalloph.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *	Convert string of phonemes (with accent/boundary features) into
 *	  integer allophone sequence with accent/boundary features
 *	  Add features FHAT_RISE and FHAT_FALL where appropriate
 *	  No phonetic insertions or deletions allowed after this module
 *
 ***********************************************************************
 *    Revision History:
 * 0001 16-Dec-84 DK	Initial creation
 * 0002 27-Dec-84 DGC	Make version for 80186
 * 0003 16-Jan-84 DK	Fix f0mode handling, fix flap rule
 * 0004 29-Jan-85 DK	Minor fix to palatalization rule
 * 0005 14-Feb-85 DK	[dh] -> [d$] (a dental stop) after [t,d,n]
 * 0006 26-Feb-85 DK	Can't flap [t] in [nt] until after [n] dur computed
 * 0007 25-Apr-85 DK	[t#y] -> [C] only if [y] not primary stressed
 * 0008 15-May-85 DK	Fix [t] -> [ch] rule, realization of "to", "into"
 * 0009 28-May-85 DK	"For" not reduced before vowel or silence
 * 0010 16-Jul-85 DK	Word-internal flapping only if post-stressed, not [nd]
 * 0011  8-Aug-85 DK	 or if involve "weak" vowels [x,|,R,i]
 * 0012 23-Aug-85 DK	Remove rule changing [yu] to [uw] after palatal
 * 0013 28-Aug 85 DK	Correct rule 1b, require unstressed [fR]
 */

#ifdef   vax
#include <stdio.h>
#endif
#include "phdefs.h"
//#define DEBUGALLO 1 /* debugiing eab*/
/*    Input arrays:							  */
extern char *phonemes; /* Integer represent of real phonemes     */
extern short *sentstruc;/* Struct feats, (mod phone[],nphonetot)  */
#ifndef MINIMAL_SYNTH
extern short *user_durs;/* Optional user-specified durations	  */
extern short *user_f0;   /* Optional user-specified f0 commands	  */
#endif
extern short nphonetot; /* Number of input symbols		  */
#ifndef MINIMAL_SYNTH
extern short f0mode;   /* State variable controlling f0 strategy */
#endif
int docitation;

extern short symbols[];

/*    Output arrays:							  */
extern char allophons[];  /* Integer rep of phonetic string	  */
extern short allofeats[];  /* Structural features		  */
extern short nallotot;      /* Number of phones in phonetic string */

/*    From PHROM.C							*/
extern short featb[];   /* Phonetic feature values for phonemes */

static short n,curr_outph,curr_outstruc;
#ifndef MINIMAL_SYNTH
static short curr_indur,curr_inf0;
#endif
#ifndef CALLER_ID
static short hatposition,emphasislock,stresses_in_phrase;
#endif
//extern short remaining_stresses_til();   /* Subroutine below */
//extern short promote_last_2();      /* Subroutine below */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */


phalloph()
{
   short curr_inph,curr_instruc;
#ifndef CALLER_ID
   short next_inph,last_outph;
#endif
	int ph_delcnt;
   short symlas,delete;
   /* Main loop: for each input symbol, see if modify before pass to output */
	ph_delcnt=0;
   nallotot = 0;
   delete = FALSE;
   //hatposition = AT_BOTTOM_OF_HAT;      /* Must be reset because */
#ifndef CALLER_ID
   emphasislock = FALSE;         /* of possibility of an */
#endif
   //stresses_in_phrase = 0;         /* emergency halt.	 */
   //curr_inf0 = 0;
   //last_outph = SIL;
	if (nphonetot >= 6)
		{
		docitation =0; /* phrase is too long for citing */
		}
   for (n=0; n<nphonetot; n++)
   {
      /* Input symbols are taken from phonemes[], and this array is never	*/
      /* changed.  Variables that refer to aspects of the input arrary are:	*/
      curr_inph = phonemes[n];
#ifdef DEBUGALLO
		printf("input phonenme to alloph is %d",curr_inph);
#endif
      curr_instruc = sentstruc[n];
#ifndef MINIMAL_SYNTH
      if (n < nphonetot-1)  next_inph = phonemes[n+1];
      else      next_inph = SIL;
#endif
  /*		printf(" cur=%d ,nx = %d tot= %d \n ",curr_inph,next_inph,nphonetot);*/
      /* Output symbols are put in array allophons[].  Variables that refer	*/
      /* to this array are:							*/

      curr_outph = curr_inph;
      curr_outstruc = curr_instruc;
#ifndef MINIMAL_SYNTH
      if (n > 0)    last_outph = allophons[nallotot-1];
#endif
      /* Deal carefully with user specified durations or f0-commands because	*/
      /* input symbols may be deleted or combined.				*/
#ifndef MINIMAL_SYNTH
      curr_indur = user_durs[n];      /* User-specified durations */
      user_durs[n] = 0;
#endif
#ifndef MINIMAL_SYNTH
      if (f0mode != HAT_F0_SIZES_SPECIFIED)
      {
         curr_inf0 = user_f0[n];      /* User-specified f0 commands */
         user_f0[n] = 0;         /* that are locked to phones */
      }

      /* Skip allophone rules if current phoneme has feature +FBLOCK */
      if ((curr_instruc & FBLOCK) != 0)
      {
         goto skiprules;
      }
      /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
      /* Morpho-phonemic Rules: (Most have already been applied)   */
      /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
#ifndef BETTER_PROSODY /*if not in raise AP to compenstae for no hat_rise*/
      /* Rule 1a: The word "the" should be /dh iy/ before a syllabic */
      if (((featb[phonemes[n+1]] & FSYLL) IS_PLUS)
         && (curr_inph == AX)
         && ((curr_instruc & FBOUNDARY) IS_PLUS)
         && (phonemes[n-1] == DH)
         && ((sentstruc[n-1] & FWINITC) IS_PLUS) )
      {
         curr_outph = IY;
      }
	/*rule 1c make a long a be ah */

	      if ((curr_inph == AX) && (next_inph == SIL )
         && n==1 && ( (KS.modeflag & MODE_CITATION) && docitation))
				{
            curr_outph = EY;
				}

      /* Rule 1b:  Unreduce vowel in "for" if following segment is vowel or sil */
      if ((curr_inph == F) && (next_inph == RR )
         && ((((sentstruc[n+1] & FSTRESS) IS_MINUS) && ((sentstruc[n+1] & FTYPESYL) == FMONOSYL))
         || ((KS.modeflag & MODE_CITATION) && docitation)))
      {
         if (((featb[phonemes[n+2]] & FSYLL) IS_PLUS)
            || (phonemes[n+2] == SIL))
         {
            phonemes[n+1] = OR;
            next_inph = OR;
#ifdef DEBUGALLO
			printf("for rr->or rule firing");
#endif

         }
      }
      /* Rule 1c:  Unreduce vowel in clause-initial "and" to be [ae] */

      if ((curr_inph == SIL)
         && (phonemes[n+1] == EH)
         && (phonemes[n+2] == N)
         && (phonemes[n+3] == D)
         && ((((sentstruc[n+1] & FSTRESS) IS_MINUS) && ((sentstruc[n+3] & FSTRESS) IS_MINUS))
         || ((KS.modeflag & MODE_CITATION) && docitation)))
      {
#ifdef DEBUGALLO
			printf("and eh->ae rule firing");
#endif
         phonemes[n+1] = AE;
         next_inph = AE;
      }
      /* Rule 1d:  Unreduce vowel in "to,into" if next segment is vowel or sil */
      /* [See code below involving flapping rule] */

	/* Rule 1c:  Unreduce vowel in citation mode for  "at" to be [ae] */
      if ( (curr_inph == SIL) && (phonemes[n+1] == EH) && (phonemes[n+2] == T)
         && ( (KS.modeflag & MODE_CITATION) && docitation ) ) 
      {
#ifdef DEBUGALLO
		printf("at eh->ae rule firing");
#endif
         phonemes[n+1] = AE;
         next_inph = AE;
      }

      /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
      /* Phonological rules I:					   */
      /* (rules involving glottal attack are in PHDRAWT0.C)	   */
      /* - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */
#endif
#endif
      /* Rule 2: Postvocalic allophones of /R/ and /LL/ are special */
      if (((curr_instruc & (FSTRESS | FWINITC)) IS_MINUS)
         && ((featb[phonemes[n-1]] & FVOWEL) IS_PLUS ))
      {
         if (curr_inph == LL)   curr_outph = LX;

         /* See if one of the special vowel + R combinations */
         /* if so, replace last output symbol and discard input symbol */
         if (curr_inph == R)
         {
            curr_outph = RX;
            symlas = phonemes[n-1];
            if (symlas == AX)
            {
               allophons[nallotot-1] = RR;
               delete = TRUE;
            }
            if ((symlas == IY) || (symlas == IH))
            {
               allophons[nallotot-1] = IR;
               delete = TRUE;

            }
            if ((symlas == EY)
               || (symlas == EH) || (symlas == AE))
            {
               allophons[nallotot-1] = ER;
               delete = TRUE;

            }
            if ((symlas == AA) || (symlas == AH))
            {
               allophons[nallotot-1] = AR;
               delete = TRUE;

            }
            if ((symlas == OW) || (symlas == AO))
            {
               allophons[nallotot-1] = OR;
               delete = TRUE;

            }
            if ((symlas == UW) || (symlas == UH))
            {
               allophons[nallotot-1] = UR;
               delete = TRUE;

            }
         }
      }
      /* Rule 3: Select appropriate allophones for unstressed /t/ and /d/ */
#ifndef CALLER_ID
     /* Palatalize /t/ or /d/ if next phoneme is unstressed /y/ */
      if (((next_inph == YU) || (next_inph == Y))
         && ((sentstruc[n+1] & FSTRESS) IS_MINUS))
      {
         if (curr_inph == T)
         {
            curr_outph = CH;
            goto endrul3;
         }
         if (curr_inph == D)
         {
            curr_outph = JH;
            goto endrul3;
         }
      }
      /* Rule to correct mis-transcriptions of e.g. "chew" as [chyu] */
      /* OUT 23-Aug-85 because applied inappropriately to "average users"
       if ((last_outph == CH) || (last_outph == JH)) {
       if (curr_inph == Y)
			{
			delete = TRUE;
			}
       if (curr_inph == YU)    curr_outph = UW;
       }
       END OUT */

      /* Glottalize word-final /t/ before a word-init sonor cons or /dh/ */
      if (curr_inph == T)
      {

         if ((next_inph == LL) || (next_inph == DH)
            || ((((curr_instruc & FBOUNDARY) >= FMBNEXT)
            && (((featb[next_inph] & FSON2) IS_PLUS)
            || (next_inph == HX)))
            || (next_inph == EN)))
         {
            curr_outph = D;
            if ((featb[last_outph] & FSON1) IS_PLUS)
            {
            curr_outph = TX;
            }
            goto endrul3;
         }
         /* Unreduce the O in "to" if following segment is a vowel */
         if ((next_inph == UH) && ((  (curr_instruc & FSTRESS) IS_MINUS  )   || ( (KS.modeflag & MODE_CITATION) && docitation)) )
         {
            if (   ( (featb[phonemes[n+2]] & FSYLL) IS_PLUS)   || (phonemes[n+2] == SIL)  )
            {
               phonemes[n+1] = UW;
            }
            /* And flap the initial /t/ of 'to' if preceeding syllabic */
            else if ( (KS.modeflag & MODE_CITATION) == 0 &&((featb[last_outph] & FSYLL) IS_PLUS)
               && ((featb[last_outph] & FNASAL) IS_MINUS))
            {
               curr_outph = DF;
               goto endrul3;
            }
         }
      }
      /* Flapping rule:  for non-stressed /t/ and /d/ */
      /* (can't flap [t] in [nt] until after durs computed) */
      if (((curr_inph == D) || (curr_inph == T))
         && ((curr_instruc & FSTRESS) IS_MINUS))
      {
			
         /* Consonant must be preceded by vowel,rx,en,G,el */
         if (((featb[last_outph] & FSON1) IS_PLUS)
            && (last_outph != M)
            && (last_outph != NX)
            && ((last_outph != N))
            /* And followed by a syllabic */
            && ((featb[next_inph] & FSYLL) IS_PLUS))
         {
            /* Flap if consonant is word-final */
            if ((curr_instruc & FBOUNDARY) >= FMBNEXT)
            {
               if (curr_inph == T)
						{
						curr_outph = DF;

						}
					else
						curr_outph = DX;

            }
            /* Flap word-initial /t,d/ if next vowel is reduced */
            else if ((curr_instruc & FWINITC) IS_PLUS)
            {
               if ((next_inph == AX) || (next_inph == IX))
               {
                  if (curr_inph == T)
						{
						curr_outph = DF;

						}
					else
						curr_outph = DX;

               }
            }
            /* Flap if [t,d] is word-internal and
             *		   (1) next vowel is "weak", or
             *                 (2) previous vowel stressed and next vowel is [ow] */
            else if ((((allofeats[nallotot-1] & FSTRESS) IS_PLUS)
               && (next_inph == OW))
               || (next_inph == AX)
               || (next_inph == RR)
               || (next_inph == IY)
               || (next_inph == IX)
               || (next_inph == EL))
            {
               if (curr_inph == T)
						{
						curr_outph = DF;

						}
					else
						curr_outph = DX;

            }
            /* HISTORY of the flap rule:  It used to work well without the prior stress
             *  alternative, except for words with a [ow] following the [t].
             *  It is my hunch that the safest course at this late date is to go back
             *  to the requirement that the next vowel be [ow] when triggering the
             *  rule by a prior stress. (Problem words:
             *   "photo, tomato, potato, monotone, protest, detail, detour, pretense"
             */
         }
      }
      /* Rule 4: Unstressed [dh] becomes dental stop after [t,d], nasal after [n] */
      if ((curr_inph == DH)
         && ((curr_instruc & FSTRESS) IS_MINUS))
      {
         if ((last_outph == T)
            || (last_outph == TX)
            || (last_outph == D))
         {
            curr_outph = D_DENTALIZED;
         }
         if (last_outph == N)
         {
            curr_outph = N;
         }
      }
/*#define NEVER*/
#ifdef NEVER
      /* Rule 5: Delete unstressed [hx] between two voiced segments */
      if ((curr_inph == HX)
         && ((featb[last_outph] & FVOICD) IS_PLUS)
         && ((curr_instruc & FSTRESS) IS_MINUS))
      {
         delete = TRUE;

      }
      /* eab latin mode rule */
      if ((KS.modeflag & MODE_LATIN) && (curr_inph == TH))
         curr_inph = E_S;
#endif

      /* Rule 6: Determine locations of hat pattern rises and falls */

      endrul3:    if (curr_inph == SIL)
      {
         emphasislock = FALSE;
      }
      /* Locate a stressed syllabic */

      if (
		  
#ifndef MINIMAL_SYNTH
		  (f0mode == NORMAL)

         && 

#endif	
		 ((featb[curr_inph] & FSYLL) IS_PLUS)
         && ((curr_instruc & FSTRESS) IS_PLUS)   /* 1-str 2-str emph */
         && (emphasislock == FALSE) )
      {

         /* Rise occurs on first stress of any type in phrase */
         /* (If curr stress is not a primary stress, routine  */
         /* checks if there will be a primary stress to fall on later) */
         if ((hatposition != AT_TOP_OF_HAT)
            && (((curr_instruc & FSTRESS_1) IS_PLUS)
            || (remaining_stresses_til(n,FCBNEXT) > 0) ))
         {
            curr_outstruc |= FHAT_BEGINS;
            hatposition = AT_TOP_OF_HAT;
         }
         /* Count number of primary stresses */
         if ((curr_instruc & FSTRESS_1) IS_PLUS)
         {
            stresses_in_phrase++;
         }
         /* Fall occurs
          *	       (1) on any emphasized syll,
          *	       (2) on last 1 stress of clause,
          *	       (3) on last 1 stress of phrase containing 2 or more stresses
          *		    followed by phrase with 2 or more stresses
          */
         if ((hatposition == AT_TOP_OF_HAT)
            && ((curr_instruc & FSTRESS_1) IS_PLUS))
         {   /* 1-str emph */
            /* Emphasis: prevent any more hat rises until end of clause */
            if ((curr_instruc & FEMPHASIS) == FEMPHASIS)
            {
               emphasislock = TRUE;
            }
            /* Fall now if emphasis */
            if (emphasislock == TRUE)
            {
               curr_outstruc |= FHAT_ENDS;
               hatposition = AT_BOTTOM_OF_HAT;
               stresses_in_phrase = 0;
            }
            /* Fall now if last stress in clause */
            if (remaining_stresses_til(n,FCBNEXT) == 0)
            {
#ifndef CALLER_ID
               /* First check if this is phrase boundary and there exist */
               /* secondary stresses in the remaining phrasal fragment   */
               if (((curr_instruc & FBOUNDARY) == FVPNEXT)
                 /* && (promote_last_2(n))*/)
               {
                  /* Last secondary stress of next phrase promoted */
               }
#endif
               else
               {
                  curr_outstruc |= FHAT_ENDS;
                  hatposition = AT_BOTTOM_OF_HAT;
                  stresses_in_phrase = 0;
               }
            }
            /* Fall now if last str in phrase and both phrases have 2 str */
            if ( (stresses_in_phrase > 1)
               && (remaining_stresses_til(n,FVPNEXT) == 0)
               && (remaining_stresses_til(n,FCBNEXT) > 1) )
            {
               curr_outstruc |= FHAT_ENDS;
               hatposition = AT_BOTTOM_OF_HAT;
               stresses_in_phrase = 0;
            }
         }
      }
      /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

      skiprules:
#endif
      if (delete)
      {
			ph_delcnt++;
#ifdef DEBUGALLO

			printf("adjusting in alloph,n= %d n+del=%d  \n",n,n+ph_delcnt);

#endif
/*			printf("changed phonemes %d and %d into single phone %d at pos %d\n"
				,symlas,curr_inph,allophons[nallotot-1],n-1);*/

#ifdef MINIMAL_SYNTH
#ifndef NO_INDEXES
			adjust_allo(n+ph_delcnt,-1);

         if (curr_inf0 != 0)       user_f0[nallotot-1] = curr_inf0;
#endif
#endif
         delete = FALSE;

      }
      else
      {
/*		if (curr_inph != curr_outph)
			{
			printf("changed phonene %d from %d to %d\n",n,curr_inph,curr_outph);
			}*/
      make_out_phonol();   /* Save curr_outph in allophons[] */
      }
   }
   /* After string blocked from Rule 4 via the f0mode=HAT_LOCATIONS_SPECIFIED
    *    state variable, set back to normal */
#ifndef MINIMAL_SYNTH
   if (f0mode == HAT_LOCATIONS_SPECIFIED)
   {
      f0mode = NORMAL;
   }
#endif
   /* Zap last position in array */
   allophons[nallotot] = SIL;
   allofeats[nallotot] = 0;

   
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Process rest of input string from position arg1, count primary-stressed */
/* vowels, return when encounter feature arg2				   */
#ifndef CALLER_ID
short remaining_stresses_til(msym,b_type) short msym,b_type;
{
   register int m,count;

   count = 0;
   for (m=msym; m<nphonetot; m++)
   {
      if ( (m != msym)
         && ((sentstruc[m] & FSTRESS_1) IS_PLUS)
         && ((featb[phonemes[m]] & FSYLL) IS_PLUS) )
      {
         count++;
      }
      if ( ((sentstruc[m] & FBOUNDARY) >= b_type)
         || (phonemes[m] == SIL) )
      {
         return(count);
      }
   }


   return(count);
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Promote secondary stress in phrases like "J'ohn ) is h`im", but not  */
/*  in phrases like "J'ohn ) s'aw h`im".				*/
#ifndef MINIMAL_SYNTH
short promote_last_2(msym) short msym;
{
   short done_it,m;

   done_it = 0;
   for (m=msym; m<nphonetot; m++)
   {
      if ( (m != msym)
         && ((sentstruc[m] & FSTRESS) == FSTRESS_2)
         && ((featb[phonemes[m]] & FSYLL) IS_PLUS) )
      {
         done_it = m;   /* pointer to last secondary stress */
      }
      if ( ((sentstruc[m] & FBOUNDARY) >= FCBNEXT)
         || (phonemes[m] == SIL) )
      {
         if (done_it != 0)
         {
            sentstruc[done_it] &= ~FSTRESS_2;
            sentstruc[done_it] |= FSTRESS_1;
            return(TRUE);
         }
      }
   }
   return(FALSE);
}
#endif
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#endif
void make_out_phonol(void)
{
#ifdef DEBUGALLO
   struct spc_packet _far *spc_pkt; /* debug eab */
#endif

#ifdef MINIMAL_SYNTH
#ifndef NO_INDEXES
   set_index_allo(n,nallotot);/* At minimum do set_index eab */
#endif
#endif
#ifdef DEBUGALLO

	if((spc_pkt = (struct spc_packet _far *)KS.index_pending.head) != NULL_SPC_PACKET)
    	{
		printf("n = %d nallotot = %d\n",n,nallotot);
    	if (n >= nallotot)
    		{
    		while(spc_pkt != NULL_SPC_PACKET)
    			{
    			WAIT_PRINT;
    			printf("1 index %d = symbol %d \n",(*spc_pkt).data[0],symbols[(*spc_pkt).data[0]]);
    			printf("2 index %d = symbol %d \n",(*spc_pkt).data[4],phonemes[(*spc_pkt).data[4]]);
    			printf("3 index %d = symbol %d \n",(*spc_pkt).data[5],allophons[(*spc_pkt).data[5]]);
    			SIGNAL_PRINT;
    			spc_pkt = (struct spc_packet _far *)(*spc_pkt).link;
    			}
    		}
    	}		 /*	debug eab  */
#endif

   if ((curr_outph < 0 )  || (curr_outph > TOT_ALLOPHONES ))

   		{
#ifdef DEBUGALLO
		 printf("Error outputing phoneme \n");
		 printf("outputting phoneme %d\n ",curr_outph);
     	return;
#endif
  		}
#ifdef DEBUGALLO
		 printf("outputting phoneme %d\n ",curr_outph);
#endif

  		if (nallotot > (n+8))
  			{

#ifdef   vax
      printf(
      "ERROR in PHALLOPH.C: output index nallotot=%d > input index n=%d\n",
      nallotot, n);
      printf("\t Do not insert phone [%s]\n", phprint(curr_outph));
#endif

     		return;
  			}
   /* Put phoneme away */

  		allophons[nallotot] = curr_outph;
  		allofeats[nallotot] = curr_outstruc;
#ifndef MINIMAL_SYNTH
  		user_durs[nallotot] = curr_indur;

  		if (f0mode != HAT_F0_SIZES_SPECIFIED)
  			{	
     		user_f0[nallotot] = curr_inf0;   /* Move user_f0 if phone moved */
  			}
#endif

#ifdef DEBUG_USER_PROSODICS
  		if (curr_indur != 0)
  			{
     		printf("\tFound user_dur[%s] = %3d ms in PHALLOPH\n",
     		phprint(curr_outph), curr_indur);
  			}
  		if ((curr_inf0 != 0) && (f0mode != HAT_F0_SIZES_SPECIFIED))
  			{
     		printf("\tFound  user_f0[%s] = %3d Hz in PHALLOPH, f0mode = %d\n",
     		phprint(curr_outph), curr_inf0, f0mode);
  			}
#endif

   /* See if there is room for next phoneme */
  		if (nallotot < NPHON_MAX)
  			{
     		nallotot++;
  			}
}
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */



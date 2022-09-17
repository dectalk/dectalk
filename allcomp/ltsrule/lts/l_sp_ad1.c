/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	l_la_ad1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Letter to sound syllabification for Spanish DECtalk.
 *    The guts of the routine go into a separate file that is #included
 *    in both the letter to sound and phonetics tasks.  The two tasks
 *    have independent "header" files that define the movearound
 *    and "access the phoneme/flags" operations as primitives (macros
 *    or functions.
 * 
 *    That way, the following paths through the code exist:
 *    ordinary word       -> lts -> syll -> stress -> ph task
 *    dictionary text word        -> as above
 *    dictionary phonemes -> maybe destress -> ph task -> maybe do syll
 *    user dict. phonemes -> maybe destress -> ph task -> maybe do syll
 *    user phonetic text  -> ph task -> syllabification
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date			Description
 * ---	-----	-----------		---------------------------------------
 * 001	MM		03/24/1986 		From DECtalk 1.
 * 002	MM		07/17/1986		Dr. Quilis's fixes and Brenda's dipthong hacks
 * 003	JDB		07/19/1996		Fix problem of "SPA" null pointer crash case in WIN95 
 * 004	GL		09/27/1996		Fix the problem of "tr..." words crash.
 * 005	MFG		06/17/1998		Copied from l_sp_ad1.c
 * 006  EAB		11/6/1998		BATS#802 Fixed syllabification bug for cuidado code agrees with notes but not
 *								native speakers
 * 007	EAB		11/16/1998		ST is NOT a legal onset cluster in Spanish BATS 794
 * 008	MGS		04/13/2000		Changes for integrated phoneme set
 * 009	CAB		10/18/2000		Changed copyright info 
 * 010	CAB		04/24/2002		Added const to place_sp_lts & featb_sp_lts as per l_sp_cons.c
 */
 
 
/* To do:
 *      When the dictionary modules are changed so they feed the
 *      syll/stress routine, this code must be enhanced to understand
 *      how dipthong offglides [yx] and [wx] work.  (They are
 *      unstressed high vowels.)
 *
 * Overview:
 *      Input is a phonemic transcription of the word.  Very similar
 *      to the orthography -- essentially only orthographic clusters
 *      such as 'ch', 'th', 'qu', and 'x' have been changed and the
 *      stop->continuant rules have been applied.
 *
 *      Goes right-to-left through the word, marking syllable boundaries.
 *      Also marks phonemic stress (if it hasn't been done by the orthography).
 *
 *       Note: input may contain multiple words (souvenier of the dictionary).
 *
 *      Return wordstart if ok, NULL if not (stuff must be spelled out).
 *      Note that this algorithm DEFINES pronouncable sequences.  I.e.,
 *      it will force spelling of, for example, "FBI" and "IBM"
 *
 * Algorithm (mostly) from Saporta and Contreras, A Phonological Grammar
 * of Spanish, Seattle, Univ. of Washington Press, 1962.
 * Some stuff from Madrid notes.
 *
 * Spanish words consist of a string of syllables.  A syllable consists of
 * three parts, an optional consonant sequence called the Onset, a mandatory
 * vowel sequence called the Nucleus, and an optional consonant sequence
 * called the Coda.  Because some consonants are "illegal" in the Onset,
 * the code can (I hope) properly mark syllable boundaries.
 *
 * After boundaries are marked, it is a "mere matter of programming" to
 * assign stress.
 */

#include        "tts.h"    /* For the declarartion of LPTTS_HANDLE_T */
#ifdef WIN32
#include <windows.h>
#endif

#if !defined OS_PALM && !defined CASIO_SH3
#include <stdio.h>
#endif
#include <string.h>

#include "port.h"  
#include "kernel.h"
#include "ls_char.h"
#include "ls_dict.h"
#include "ls_defs.h"
#include "ls_data.h"
#include "ph_def.h"

#include "ls_prot.h"

#ifdef ACNA
#include "ls_acna.h"
#include "l_ac_con.c"
#endif

#define   VOWEL     0x01      	/* Vowel (not final coda)        */
#define   SCODA     0x02      	/* Intermediate coda before S    */
#define   CODA      0x04       	/* Other intermediate coda       */
#define   RLONSET   0x08    	/* Onset before R or L         	 */
#define   RONSET    0x10     	/* Onset before R                */
#define   HIGH      0x20      	/* High vowel (I, U)             */
#define   MIDLOW    0x40      	/* Mid or low vowel (E, O, A)    */

#if SYL_DEBUG
extern    char   *sppname[];
#define SPPNAME(phone)   (sppname[phone]+1)

#define   XRULE(lsp, endp, wstart, wend, what)            \
if (DEBUG(SYL_DEBUG | STR_DEBUG))
{            \
   log("Syl:\t%s:\t%s", SPPNAME(lsp->p_phone), what);   \
   ls_pdump(lsp, endp, NULL, TRUE);            \
   log("\t\t");                  \
   ls_pdump(wstart, wend, "(word)", TRUE);         \
}
#define   SYLRULE(lsp, endp, what)               \
if (DEBUG(SYL_DEBUG))
{                  \
   log("Syl:\t%s:\t%s", SPPNAME(lsp->p_phone), what);      \
   ls_pdump(lsp, endp, NULL, TRUE);            \
}
#define   STRRULE(lsp, endp, what)               \
if (DEBUG(STR_DEBUG))
{                  \
   log("Syl:\t%s:\t%s", SPPNAME(lsp->p_phone), what);      \
   ls_pdump(lsp, endp, NULL, TRUE);            \
}
#define   MARKS(lsp, what)                  \
MARK(lsp, LSSBOUND);                  \
SYLRULE(lsp, NULL, what)
#define   MARKV(lsp, what)                  \
MARK(lsp, LSVOWEL);                  \
SYLRULE(lsp, NULL, what)
#endif

#ifndef   XRULE
#define XRULE(lsp, endp, wstart, wend, what)
#endif

#ifndef   SYLRULE
#define   SYLRULE(lsp, endp, what)
#endif

#ifndef   STRRULE
#define   STRRULE(lsp, endp, what)
#endif

#ifndef   MARKS
#define   MARKS(lsp, what)   MARK(lsp, LSSBOUND)
#endif

#ifndef   MARKV
#define   MARKV(lsp, what)   MARK(lsp, LSVOWEL)
#endif

extern  const short   featb_sp_lts[];
#define   isstress(lsp)   	(LSISSTRESS(lsp))
#define   lts_isbound(lsp)   	(LSISSBOUND(lsp))
#define   isvowel(phone)   	((syllfeatb[phone] & VOWEL)   IS_PLUS)
#define   iscons(phone)   	((syllfeatb[phone] & VOWEL)   IS_MINUS)
#define   ishigh(phone)   	((syllfeatb[phone] & HIGH)    IS_PLUS)
#define   ismidlow(phone)   ((syllfeatb[phone] & (HIGH | VOWEL)) == VOWEL)
#define   iscoda(phone)   	((syllfeatb[phone] & CODA)    IS_PLUS)
#define   isscoda(phone)   	((syllfeatb[phone] & SCODA)   IS_PLUS)
#define   isfcoda(phone)   	((syllfeatb[phone] & VOWEL)   IS_MINUS)
#define   isonset(phone)   	((syllfeatb[phone] & VOWEL)   IS_MINUS)
#define   isronset(phone)   ((syllfeatb[phone] & RONSET)  IS_PLUS)
#define   isrlonset(phone) 	((syllfeatb[phone] & RLONSET) IS_PLUS)

extern const short   place_sp_lts[];

/*
 * Note: all Spanish phonemes must have entries (to handle dictionary)
 */

const short syllfeatb[SP_TOT_ALLOPHONES] = {
      /* [ SIL ]  */   0,
      /* [ SP_A ]  */   VOWEL                  ,
      /* [ SP_E ]  */   VOWEL                  ,
      /* [ SP_I ]  */   VOWEL   | HIGH               ,
      /* [ SP_O ]  */   VOWEL                  ,
      /* [ SP_U ]  */   VOWEL   | HIGH               ,
      /* [ SP_WX ] */   VOWEL   | HIGH               ,
      /* [ SP_YX ] */   VOWEL   | HIGH               ,
      /* [ SP_RR ] */   0                  ,
      /* [ SP_L ]  */   0   | SCODA   | CODA            ,
      /* [ SP_LL ] */   0                  ,
      /* [ SP_M ]  */   0                  ,
      /* [ SP_N ]  */   0   | SCODA   | CODA            ,
      /* [ SP_NH ] */   0                  ,
      /* [ SP_F ]  */   0      | CODA      | RLONSET   ,
      /* [ SP_S ]  */   0                  ,
      /* [ SP_J ]  */   0                  ,
      /* [ SP_TH ] */   0      | CODA            ,
      /* [ SP_BH ] */   0      | CODA      | RLONSET   ,
      /* [ SP_DH ] */   0      | CODA   | RONSET      ,
      /* [ SP_GH ] */   0      | CODA      | RLONSET   ,
      /* [ SP_YH ] */   0                  ,
      /* [ SP_P ]  */   0   | SCODA   | CODA      | RLONSET   ,
      /* [ SP_B ]  */   0      | CODA      | RLONSET   ,
      /* [ SP_T ]  */   0   | SCODA   | CODA   | RONSET      ,
      /* [ SP_D ]  */   0      | CODA   | RONSET      ,
      /* [ SP_K ]  */   0   | SCODA   | CODA      | RLONSET   ,
      /* [ SP_G ]  */   0            | RLONSET   ,
      /* [ SP_CH ] */   0                  ,
      /* [ SP_Y ]  */   0                  ,
      /* [ SP_R ]  */   0                  ,
      /* [ SP_Q ]  */   0                  ,
      /* [ SP_Z ]  */   0                  ,
      /* [ SP_W ]  */   0                  ,
      /* [ SP_NX ] */   0                  ,

#ifdef SP_SH
      /* [ SP_SH ] */   0                  ,
#endif

#ifdef SP_V
      /* [ SP_V ]  */   0            | RLONSET   ,
#endif

#ifdef SP_IX
      /* [ SP_IX ] */   0                  ,
#endif

      /* [ SP_MX]  */   0                  ,
      /* [ SP_PH ] */   0            | RLONSET
      };

const char   pl_mente[] = {      /* The -mente ending */
      SP_M, SP_E, SP_N, SP_T, SP_E
      };


/*
 * Programming note:
 
 */
#define   MARK(lsp, bit)   (lsp->p_flag |= (bit))
 
/*
 *      Function Name:       
 *
 *  	Description: 
 *		to delete the current segment:
 *      	lsp = ls_delete(lsp)->prev;     (note: nextp is wrong)
 *   	to delete the next segment
 *      	ls_delete(nextp);               (note: nextp is wrong)
 *   	to insert a segment:
 *      	lsp = ls_append(lsp)            (note: nextp points after new)
 * Note also:
 *      NEXT(lsp) next segment.         NULL is a bug.
 *      PREV(lsp) previous segment.     NULL is a bug.
 *
 *      Arguments: 	PLTS_T pLts_t, 
 *				   	PHONE * wordp, 
 *					PHONE * endp
 *
 *      Return Value: PHONE *
 *
 *      Comments: Syllabification and stress assignment.  return NULL if failure.
 * 				  Understand stress and boundary stuff (from the dictionary).
 *
 */
PHONE * l_sp_ad1_syll(PLTS_T pLts_t, PHONE * wordp, PHONE * endp)
{
   PHONE   *startp;
   int   phone;
   int   has_bound;


   /*
    * For each word in the source,
    */
   while (endp != wordp)
   {
      while ((startp = PREV(endp)) != wordp && startp->p_letter == EOS)
	 endp = startp;
      if (startp == wordp)      /* Can't happen         */
	 return (NULL);
      /*
       * endp -> just past end of word (space, comma, or EOS)
       * startp -> last byte of the word.
       */
      has_bound = FALSE;
      while (startp->p_letter != EOS)
	  {   /* Locate start of word    */
	    if ((phone = startp->p_phone) == S1 || phone == S2 
	      || phone == SEMPH)
	    {
	    	startp = (PHONE *)ls_rule_delete(pLts_t, startp);
	    	if (isvowel(startp->p_phone))
	    	{
	       		switch (phone)
		   		{
		  			case S1:   startp->p_flag |= LS_STRESS_1;   break;
		  			case S2:   startp->p_flag |= LS_STRESS_2;   break;
		  			case SEMPH:   startp->p_flag |= LS_STRESS_3;   break;
		    	}
	     	}
	  	}
	 	else if (phone == SBOUND)
	    {
	    	startp = (PHONE *)ls_rule_delete(pLts_t, startp);
	    	startp->p_flag |= LSSBOUND;
	    	has_bound = TRUE;
	    }
	 	startp = PREV(startp);
	  }
      if (has_bound);            /* Done already                */
      else if (!l_sp_ad1_syllword(pLts_t, NEXT(startp), endp))
	  return (NULL);         /* Fail to spellout     */
      endp = startp;         /* -> end of prev. word    */
   }
   return (wordp);            /* Normal return  */
}
 
/*
 *      Function Name: l_sp_ad1_syllword()      
 *
 *  	Description: Break the word into syllables.  Spanish syllables have three components:
 *      onset   consonants before the vowel
 *      nuleus  vowel or dipthong
 *      coda    consonants after the nucleus
 * 		Final syllables are treated differently from non-final.
 * 		Stress may be orthographic or implied.
 *
 * 		Return TRUE on success, FALSE if the word must be spelled out.
 *
 *      Arguments:	PLTS_T pLts_t, 
 *					PHONE * wstart,
 *					PHONE * wend 
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

int l_sp_ad1_syllword(PLTS_T pLts_t, PHONE * wstart,PHONE * wend)
{
   PHONE *lsp;
   PHONE *endp;
   int   isfinal;
   int   syllcount;

   if (wstart == wend)         /* Make sure there's      */
      return (FALSE);          /* something present      */
   isfinal = TRUE;
   syllcount = 0;
   MARKS(wend, "syllable mark at end of word");
   for (endp = wend; endp != wstart; endp = lsp)
   {
      SYLRULE(wstart, endp, "Before syllable parse");
      if ((lsp = l_sp_ad1_dosyllable(pLts_t, wstart, endp, isfinal)) == NULL)
	  {
	 	return (FALSE);
	  }
      isfinal = FALSE;
      if (PREV(lsp) == wstart)
	 lsp = l_sp_ad1_wordstart(pLts_t, wstart, lsp);
      syllcount++;
   }
   l_sp_ad1_stress(wstart, wend, syllcount);
   return (TRUE);
}

 
/*
 *      Function Name: l_sp_ad1_dosyllable()      
 *
 *  	Description: Do the dirty work.  Return -> start of syllable.
 * 					 Syllable structure consists of
 *   				 Onset:     optional initial consonant (cluster)
 *   				 Nucleus:   mandatory vowel or vowels
 *   			 	 Coda:      optional final consonant (cluster)
 *
 *      Arguments:  PLTS_T pLts_t, 
 *					PHONE * wstart, 
 *					PHONE * endp,
 *                  int isfinal
 *
 *      Return Value: PHONE *
 *
 *      Comments:
 *
 */
PHONE * l_sp_ad1_dosyllable(PLTS_T pLts_t, PHONE * wstart, PHONE * endp,
                    			   int isfinal)
/*
 * 
 */
{
   endp = (isfinal) ? l_sp_ad1_fin_coda(wstart, endp) : l_sp_ad1_int_coda(wstart, endp);
   if (endp == NULL)
      return (NULL);
   if ((endp = l_sp_ad1_nucleus(pLts_t, wstart, endp, isfinal)) == NULL)
      return (NULL);
   if (lts_isbound(endp))
   {
      SYLRULE(endp, endp, "syllable boundary marked");
   }
   else
   {
      endp = l_sp_ad1_onset(wstart, endp);
      MARKS(endp, "syllable scan complete");
   }
   return (endp);
}
 
/*
 *      Function Name: l_sp_ad1_fin_coda()      
 *
 *  	Description: Matches final coda.  NULL on bug or garbage phoneme string.
 *
 *      Arguments: PHONE *wstart, PHONE *endp
 *
 *      Return Value: PHONE *
 *
 *      Comments:
 *
 */
PHONE * l_sp_ad1_fin_coda(PHONE *wstart, PHONE *endp)
{
   PHONE *lsp;

   if (endp == wstart)
   {
      SYLRULE(wstart, endp, "final coda at start of word -- bug.");
      return (NULL);
   }
   /*
    * Hack to accept foreign clusters, such as "ng" in "smoking"
    */
   while ((lsp = PREV(endp)) != wstart && isfcoda(lsp->p_phone))
      endp = lsp;
   SYLRULE(endp, NULL, "final coda");
   return (endp);
}
 
/*
 *      Function Name:       
 *
 *  	Description: Matches intermediate coda.  NULL on bug or garbage phoneme string.
 *
 *      Arguments: 
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
PHONE * l_sp_ad1_int_coda(PHONE *wstart, PHONE *endp)
{
   PHONE *lsp;
   PHONE *prev;
   int   phone;

   if (endp == wstart)
   {
      SYLRULE(wstart, endp, "intermediate coda at start of word -- bug.");
      return (NULL);
   }
   lsp = PREV(endp);
   phone = lsp->p_phone;
   if (lsp != wstart
      && phone == SP_S)
   {
      /*
       * -s may build an intermediate coda cluster.
       */
      lsp = PREV(lsp);
      phone = lsp->p_phone;
      if (lsp != wstart && isscoda(phone))
	   		goto check_cluster;
      if (isvowel(phone))
	  {
	     SYLRULE(NEXT(lsp), endp, "s intermediate coda");
	     return (NEXT(lsp));
	  }
   }
   else if (lsp != wstart && iscoda(phone))
      goto check_cluster;
   if (isvowel(phone))
   {
      SYLRULE(endp, endp, "no intermediate coda");
      return (endp);
   }
   /*
    * Saporta and Contreras require M to be followed by P, B, or F.
    * However, "ymca" is considered pronouncable.  So we allow M
    * preceeded by a vowel as a coda.  This is generalized as follows:
    *
    * For other foreign words, such as "starter" (which translates
    * to English "choke") with unpronouncable intermediate coda
    * sequences, we accept the phoneme if it is a valid final coda.
    */
   if ((lsp = l_sp_ad1_fin_coda(wstart, NEXT(lsp))) != NULL)
   {
      SYLRULE(lsp, endp, "intermediate coda fallback");
      return (lsp);
   }
   XRULE(lsp, endp, wstart, endp,
   "** unpronouncable intermediate coda sequence");
   return (NULL);

   check_cluster:
   /*
    * We have a coda (lsp -> start).  Peek at the previous phoneme
    * to see if we have a cluster, such as [mp] in simpatico.
    * (Hmm, why isn't this [sim-patico]?)
    */
   prev = PREV(lsp);
   if ((featb_sp_lts[phone] & FPLOSV) IS_PLUS
      && place_sp_lts[phone] != FLABIAL)
   {         /* k, g, t, d   */
      switch (prev->p_phone)
	  {
	    case SP_N:
	    if (PREV(prev)->p_phone == SP_S)
	       prev = PREV(prev);
	    case SP_S:
	    goto is_cluster;
	  }
      goto no_cluster;
   }
   switch (phone)
   {
      case SP_P:
      case SP_F:
      case SP_B:
	 if (prev->p_phone == SP_S)
	 {
	    if (PREV(prev)->p_phone == SP_N)
	       prev = PREV(prev);
	    goto is_cluster;
	 }
	 if (prev->p_phone == SP_M)
	 {
	    is_cluster:   SYLRULE(prev, endp, "coda cluster");
	    return (prev);
	 }
   }
   no_cluster:
   SYLRULE(lsp, endp, "coda -- not cluster");
   return (lsp);
}
 
/*
 *      Function Name: l_sp_ad1_nucleus()      
 *
 *  	Description: Parse the nucleus.  Nucleus structure:
 * 					 Nucleus  :== [Vowel, opt stress] (opt high vowel)
 *           		 || [high vowel] {[e] or [o], opt stress} (opt [i])
 *           		 || [high vowel] {[a], opt stress} (opt high vowel)
 * 					 Where
 *      			 [high vowel] == {[i] or [u]}, (or [y])
 * 					 Note:
 *      			 The primary vowel of the nucleus is marked by setting LSVOWEL
 *      			 to help the stress assignment routine in its arduous task.
 *      			 There are also hacks for 'y':
 *          		 [y] -> [i] / [-vowel]      ... [+vowel]
 *                	 ||   / [+vowel](1,2) ... [-vowel]
 *      			 Thus, [y] can be a component of a dipthong or last component of
 *      			 a tripthong, but not the middle or first component of a tripthong.
 *
 * 				     Note also:
 *      			 'iV   -> 'i-V   syllable boundary if orthographic stress
 *      			 'uV   -> 'u-V   syllable boundary if orthographic stress
 *      			 uir#  -> u-ir   for verb infinitives
 *      			 uido(s)# -> u-ido (ui, ua, uo) followed by da, do -- for p. participles
 *      			 pi'e  -> pi-'e  monosyllabic words with orthographic stress
 *      			 iu => i'u       stress attracted to last element
 *      			 ui => u'i       stress attracted to last element
 *      			 [+vowel,+stress] -> [sbound] / ... vowel
 *
 *      Arguments:  PLTS_T pLts_t, 
 *					PHONE * wstart, 
 *					PHONE * endp,
 *                	int isfinal
 *
 *      Return Value: PHONE *
 *
 *      Comments:
 *
 */

PHONE * l_sp_ad1_onset(PHONE* wstart, PHONE* endp);

PHONE * l_sp_ad1_nucleus(PLTS_T pLts_t, PHONE * wstart, PHONE * endp,
                 				int isfinal)
{
   PHONE    *lsp;
   int      last_phone;
   PHONE    *mid, *first;
   int      mid_phone, first_phone;
   int      temp;

   if (endp == wstart)
   {
      SYLRULE(wstart, endp, "no word at nucleus");
      return (NULL);
   }
   lsp = PREV(endp);
   last_phone = lsp->p_phone;
   /*
    * Stressed [i] or [u] cannot be the semivowel end of a dipthong.
    */
   if (isstress(lsp) && ishigh(last_phone))
   {
      MARKV(lsp, "stressed high vowel");
      return (lsp);
   }
   if (lts_isbound(lsp))
   {
      MARKV(lsp, "syllable boundary marked");
      return (lsp);
   }
   if (lsp == wstart)
      goto no_dipthong;
   mid = PREV(lsp);
   if (isstress(mid))
   {
      MARKV(lsp, "[vowel,stress] - [vowel]");
      return (lsp);
   }
   mid_phone = mid->p_phone;
   /*
    * A sequence of three unstressed mid/low phonemes
    * deletes one if at least two adjacent ones are identical.
    * (rule from Saporta and Contreas, Transformation 3(j), 3(k).
    */

	if ((mid_phone == last_phone
      || mid_phone == PREV(mid)->p_phone)
      && !isstress(lsp)
      && !isstress(mid)
      && !isstress(PREV(mid))
      && ismidlow(last_phone)
      && ismidlow(mid_phone)
      && ismidlow(PREV(mid)->p_phone))
    {
      SYLRULE(PREV(mid), endp, "delete one of 3 mid/low unstressed");
      ls_rule_delete(pLts_t, mid);
      mid = PREV(lsp);
      mid_phone = mid->p_phone;
    }
    if (!isvowel(mid_phone))
    {
      	no_dipthong:
      	MARKV(lsp, "non-dipthong");
      	return (lsp);
    }
    if (mid_phone == SP_U         /* Verb infinitive test */
      && last_phone == SP_I
      && endp->p_phone == SP_R
      && lts_isbound(NEXT(endp)))
    {
      	MARKV(lsp, "verb infinitive");
      	return (lsp);
    }
   	if (mid_phone == SP_U         /* Past participle test 	 */
      && (last_phone == SP_I      /* for -ada, -odo, etc.     */
      || last_phone == SP_A
      || last_phone == SP_O)
      && endp->p_phone == SP_D
      && ((temp = NEXT(endp)->p_phone) == SP_O
      || temp == SP_A))
    {
		//EAB BATS 802 
      	if (/*lts_isbound(NEXT(NEXT(endp)))
	 		|| */ (NEXT(NEXT(endp))->p_phone == SP_S   /* -ados, etc.  */
	 		&& lts_isbound(NEXT(NEXT(NEXT(endp))))))
	 	{
	 		MARKV(lsp, "past participle");
	 		return (lsp);
	 	}
    }
   /*
    * Brenda's revised monosyllabic hack for fi'e.
    */
    if (isfinal         		/* Final syllable                */
      && isstress(lsp)      	/* Final vowel has ortho stress  */
      && ((lts_isbound(endp)      	/* Either vowel is word final    */
      && (lsp->p_phone == SP_O   /* and is either "o" or "u"    	 */
      || lsp->p_phone == SP_E))
      || (lsp->p_phone == SP_O   /* Or word ends in "on"          */
      && endp->p_phone == SP_N
      && lts_isbound(NEXT(endp)))))
    {
      /*
       * Check for a monosyllabic word with one member of a
       * vowel cluster stressed.  Make it two syllables if so.
       */
      for (first = PREV(mid); first != wstart; first = PREV(first))
	  {
	  	if (isvowel(first->p_phone))
	    goto nomono;
	  }
      MARKV(lsp, "pseudo-monosyllable w. ortho stress");
      return (lsp);
    }
    nomono:   first = PREV(mid);        /* Guard element lets   */
    first_phone = first->p_phone;      	/* us always do this    */
    if (ismidlow(last_phone))
    {
      	if (ishigh(mid_phone)      		/* i or u, not stressed */
	 	&& !isstress(mid))
	 	{
	 		MARKV(lsp, "semivowel-vowel -- {i u} {a e o}");
	 		return (mid);
	 	}
      	MARKV(lsp, "vowel with preceeding vowel, non-dipthong");
      	return (lsp);
     }
     if (mid == wstart || lts_isbound(mid))
     	 goto no_tripthong;
   	if (isstress(first)
    	  || !ishigh(first_phone))
    {
      no_tripthong:
      if (ishigh(mid_phone))
	  {
	 	MARKV(lsp, "[iu] or [ui], stress last");
	 	return (mid);
	  }
      MARKV(mid, "vowel-semivowel {a e o } {i u}");
      return (mid);
    }
   /*
    * Tripthong tester:
    * last_phone        last vowel   in tripthong       (@ lsp)
    * mid_phone middle vowel in tripthong       (@ mid)
    * first_phone       first phone  in tripthong       (@ first)
    * Test for u-umlaut comes here
    */
   MARKV(mid, "possible tripthong");
   if (last_phone == SP_I
      && ismidlow(mid_phone)
      && ishigh(first_phone))
   {
      SYLRULE(first, endp, "[..i] tripthong");
      return (first);
   }
   if (last_phone == SP_U
      && mid_phone == SP_A
      && ishigh(first_phone))
   {
      SYLRULE(first, endp, "[.au] tripthong");
      return (first);
   }
   SYLRULE(mid, endp, "dipthong, i/u final");
   return (mid);
}
 
/*
 *      Function Name: l_sp_ad1_onset()      
 *
 *  	Description:	Do any consonant cluster at syllable start.
 * 						Returns -> just before syllable.
 * 						Can't fail, as onset is optional.
 * 						Magic for s-clusters, as in obscura
 * 						More magic for dictionary junk. 
 *
 *      Arguments:	PHONE* wstart, 
 *					PHONE* endp
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
PHONE * l_sp_ad1_onset(PHONE* wstart, PHONE* endp)
{
   PHONE      *lsp;

   PHONE      *prev;
   int      phone;

   if (endp == wstart)
   {
      SYLRULE(endp, endp, "no onset (at word start)");
      return (endp);
   }
   lsp = PREV(endp);
   phone = lsp->p_phone;
   if (lsp == wstart && isonset(phone))
      goto at_word_start;
   prev = PREV(lsp);
   if ((phone == SP_R || phone == SP_L)
      && isrlonset(prev->p_phone))
   {
      if (prev->p_phone == SP_P && prev != wstart && l_sp_ad1_sonset(prev))
	  { 
	 	prev = PREV(prev);         /* spr, spl */
	  }
      /* SYLRULE(prev, endp, "lateral cluster onset"); */
      return (prev);
   }
   if (phone == SP_R
      && isronset(prev->p_phone))
   {
      if (prev->p_phone == SP_T && l_sp_ad1_sonset(prev))
	 	prev = PREV(prev);         /* str, stl */
      SYLRULE(prev, endp, "[.r] cluster onset");
      lsp = prev;
      goto found_onset;
   }
   if (isonset(phone))
   {
      if ((phone == SP_P
	 || phone == SP_T
	 || phone == SP_K
	 || phone == SP_M)            /* smoking */
	 && l_sp_ad1_sonset(lsp))
	 lsp = prev;            /* sp, st, sk   */
      at_word_start:
      /* SYLRULE(lsp, endp, "single-phoneme onset"); */
     	 goto found_onset;
   }
   SYLRULE(wstart, endp, "no onset");
   lsp = endp;
   found_onset:
   /*
    * Scan off any junk (stress marks and dictionary razzamatazz.
    */
   while (lsp != wstart
      && lsp->p_phone >= SP_TOT_ALLOPHONES)
   {
      SYLRULE(lsp, endp, "scanning off junk");
      lsp = PREV(lsp);
   }
   return (lsp);
}
 
/*
 *      Function Name: l_sp_ad1_sonset()      
 *
 *  	Description: Checks for 's' clusters.  TRUE if the [s] is part of the onset.
 *
 *      Arguments: PHONE *lsp
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
int l_sp_ad1_sonset(PHONE *lsp)
{
   volatile  int temp = 0;

   
   lsp = lsp->p_bp;
   
   /* 
    * JDB: 7/19/96 Spanish will try to reference into a null ptr if we don't
    * stop it. Prevent this from happening, and return TRUE, to give
    * the same return as the PC.
	*/
//   if (!lsp || !(PREV(lsp)) || !(PREV(PREV(lsp))))
   /*
    * GL 9/27/96  fix this to take care all words including span.. and tr...
    */
   if (lsp == NULL || PREV(lsp) == NULL || PREV(PREV(lsp)) == NULL)
       return (FALSE);

   if ((lsp->p_phone) == SP_S
	  && (temp  != SP_T) //EAB 11/16/98 ST is NOT a legal onset cluster in Spanish BATS 794
	  && (temp  != SP_P) //EAB 11/16/98 ST is NOT a legal onset cluster in Spanish BATS 794
      && !(temp = PREV(PREV(lsp))->p_phone) != SP_N
      && !isvowel(temp))
      return (TRUE);
   return (FALSE);
}

 
/*
 *      Function Name: l_sp_ad1_wordstart()      
 *
 *  	Description: Do some magic cleanups if at the start of the word.
 *      			 pseudo          ->      [suedo]
 *      			 mnemonotecnia   ->      [nemotecnia]
 *      			 gnosticismo     ->      [nosticismo]
 *
 *      Arguments:	PLTS_T pLts_t, 
 *					PHONE * wstart, 
 *					PHONE * endp 
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
PHONE * l_sp_ad1_wordstart(PLTS_T pLts_t, PHONE * wstart, PHONE * endp)
{
   int   phone;

   SYLRULE(wstart, endp, "beginning of word test");
   phone = endp->p_phone;
   switch (wstart->p_phone)
   {
      case SP_P:
	 	if (phone == SP_S)
	    	goto do_delete;
	 	break;
      case SP_G:
	 	if (phone == SP_N)
	    	goto do_delete;
	 	break;
      case SP_M:
	 	if (phone == SP_N)
	    {
	    	do_delete:   wstart->p_phone = phone;
	    	wstart->p_flag = endp->p_flag;
	    	ls_rule_delete(pLts_t, endp);
	    	SYLRULE(wstart, wstart, "initial cluster simplification");
	    	return (wstart);
	    }
	 	break;
   }
   return (endp);
}

 
/*
 *      Function Name: l_sp_ad1_stress()      
 *
 *  	Description: Assign stress.  Words ending in -mente might get two stresses:
 *     				 "pl'acidamente" -> [pl'acidam'ente].
 * 					 Otherwise:
 * 					 1.   stress is marked -- put it there
 * 					 2.   monosyllabic or the word ends a consonant (except -Vn and -Vs)
 *      			 	  gives ultimate stress.  -y is a consonant in this case.
 * 					 3.   otherwise, stress goes to the penultimate syllable.
 * 					 4.   [yx][vowel] and [wx][vowel] stress the [yx/wx].
 *
 * 					 Caller guarantees that wstart != wend -- i.e., the word is non-null.
 *
 *      Arguments:	PHONE * wstart, 
 *					PHONE * wend, 
 *					int syllcount 
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void l_sp_ad1_stress(PHONE * wstart, PHONE * wend, int syllcount)
{
   PHONE      *lsp;
   int         index;

   /*
    * Check for words ending in -mente.  They get two stresses.
    */
   for (index = 5, lsp = PREV(wend); lsp != wstart; lsp = PREV(lsp))
   {
      if (lsp->p_phone != pl_mente[--index])
	 		break;
      if (index == 0)
	  {
	 	MARK(NEXT(lsp), LS_STRESS_1);
	 	STRRULE(lsp, wend, "-mente stress");
	 	if (syllcount < 4)
	    {
	    	STRRULE(wstart, wend, "-mente word gets one stress");
	    	return;
	    }
	 	else
	    {
	    	wend = lsp;
	    	STRRULE(wstart, wend, "-mente word gets two stresses");
	    	syllcount -= 2;
	    	break;
	    }
	  }
   }
   /*
    * Scan through word looking for an orthographic stress.
    * Note that there must be a word present.
    */
   lsp = wend;
   do
   {
      lsp = PREV(lsp);
      if (isstress(lsp))
	  {
	 	STRRULE(lsp, wend, "stress marked orthographically");
	 	return;
	  }
   } while (lsp != wstart);
   lsp = PREV(wend);         /* -> end of syllable      */
   if (syllcount <= 1)
   {
      STRRULE(wstart, wend, "stress only syllable");
      goto mark_this;
   }
   /*
    * This hack gives final stress to "jai alai"
    */
   if (lsp->p_phone == SP_I
      && !lts_isbound(lsp)
      && isvowel(PREV(lsp)->p_phone))
   {
      STRRULE(PREV(lsp), wend, "[+vowel] i # (jai alai) hack");
      goto mark_this;
   }
   if (isvowel(lsp->p_phone))
   {
      STRRULE(wstart, wend, "word ends in vowel, stress penultimate");
      goto mark_penultimate;
   }
   if ((lsp->p_phone == SP_S || lsp->p_phone == SP_N)
      && isvowel(PREV(lsp)->p_phone))
   {
      STRRULE(wstart, wend, "ends in Vowel {s, n}, stress penultimate");
      goto mark_penultimate;
   }
   STRRULE(lsp, wend, "consonant or cluster final");
   goto mark_this;         /* Ends in consonant or cluster      */
   /*
    * Search for the penultimate syllable.
    */
   mark_penultimate:
   while (lsp != wstart)
   {
      if (lts_isbound(lsp))
	 		goto found_penultimate;
      lsp = PREV(lsp);
   }
   STRRULE(wstart, wend, "what? no penultimate (bug)");
   lsp = wend;
   found_penultimate:
   lsp = PREV(lsp);
   STRRULE(lsp, wend, "stressing penultimate");
   mark_this:
   /*
    * Mark the primary vowel in this syllable.
    */
   for (;;)
   {
      if (LSISVOWEL(lsp))
	  { 
	 		MARK(lsp, LS_STRESS_1);
	 		STRRULE(lsp, wend, "stress specified vowel");
	 		return;
	  }
      if (lsp == wstart)
	 	break;
      lsp = PREV(lsp);
   }
   XRULE(wstart, wend, wstart, wend, "What, no stress?");
}

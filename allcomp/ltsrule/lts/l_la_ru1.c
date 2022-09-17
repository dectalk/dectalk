/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:	l_la_ru1.c
 *    Author:       JDB
 *    Creation Date:30-May-1996 
 *
 *    Functionality:
 * 	  The functions in this file
 * 	  make up the heart of the letter to
 * 	  sound system. They handle all of
 * 	  the rule matching.
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001  GL      07/29/1996  	use ls_util_write_pipe() to replace write_pipe()
 * 002  GL		10/23/1996	    remove the unused index handling code.
 * 003	MFG		06/17/1998		Copied from l_la_ru1.c
 * 004	MGS		04/13/2000		Changes for integrated phoneme set 
 * 005 	CAB		10/18/2000		Changed copyright info
 */
#include "ls_def.h"
#include "ls_rule.h"

/* JDB: these just in for compile            
#include "port.h"
#include "ls_defs.h"
#include "ls_data.h"                         
*/
  
#ifndef LTS_DEBUG
#define LTS_DEBUG 0
#endif
                 
#if LTS_DEBUG
#define RULE(what)                                              \
	if (DEBUG(LTS_DEBUG))                                   \
	    log("Lts:\t%s\n", what)
#else
#define RULE(what)
#endif

extern PHONE *ls_rule_unfix(PLTS_T pLts_t, int c, PHONE *outp);
PHONE * l_la_ru1_orthophon(PLTS_T pLts_t, PHONE * lsp);
extern PHONE * ls_rule_lts_unfix(PLTS_T pLts_t, LETTER *word, LETTER *wend);
extern PHONE *ls_rule_dic_unfix(PLTS_T pLts_t);


extern  char    *sppname[];
#define SPPNAME(phone)  (sppname[phone]+1)

/* Prototype Declaration */
PHONE * ls_rule_append(PLTS_T pLts_t, PHONE *current, int c);
PHONE * ls_rule_phone_alloc (PLTS_T pLts_t);
void ls_rule_phone_free (PLTS_T pLts_t, struct PHONE *pp);
void ls_rule_lts_out(LPTTS_HANDLE_T pLts_t, PHONE *lsp, PHONE *endp,int context);
void ls_rule_lts_index (LPTTS_HANDLE_T phTTS, PHONE *ip);
     
     
/*
 * This table translates Multinational characters to their seven-bit
 * equivalents.  There are several possiblities:
 *      0       Illegal character -- word is spelled out.
 *      [aeiou] Ordinary letter, unstressed.
 *      [AEIOU] Ordinary letter, orthographic stress.
 *      [01-05] Index to two letter strings in fix_text[].
 * There are a couple of hacks to be aware of:
 *      ~n and ~N become @ (making them 7-bit characters).
 *      "u becomes the two-letter string 'uu' which is
 *              further hacked by the letter to sound rules.
 */

const  char   unfix_out[] = {
/*    0     1     2     3     4     5     6     7                       */
     'a',  'A',  'a',  'a',  'a',  'a',  001,  002,     /* C0-C7        */
     'e',  'E',  'e',  'e',  'i',  'I',  'i',  'i',     /* C8-CF        */
     000,  '@',  'o',  'O',  'o',  'o',  'o',  003,     /* D0-D7        */
     'o',  'u',  'U',  'u',  004,  'y',  000,  005,     /* D8-DF        */
     'a',  'A',  'a',  'a',  'a',  'a',  001,  002,     /* E0-E7        */
     'e',  'E',  'e',  'e',  'i',  'I',  'i',  'i',     /* E8-EF        */
     000,  '@',  'o',  'O',  'o',  'o',  'o',  003,     /* F0-F7        */
     'o',  'u',  'U',  'u',  004,  'y',  000,  000      /* F8-FF        */
};

/*
 * Actually, the only one of these that we should see is "uu" as
 * the others would have been eaten by the lscrush table in ls1.c.
 */

const char   fix_text[][2] = {
	'\0','\0',      /* Unused                                       */
	'a','e',        /* 001  C6,D6   ae ligature                     */
	't','h',        /* 002  C7,D7   c, c-cedilla                    */
	'o','e',        /* 003  D7,D8   oe ligature                     */
	'u','u',        /* 004  DC,EC   u" u-umlaut			*/
	's','s'         /* 005  DF      ss (German sharp s)             */
};

//PHONE   *pflp;                  /* Head of free phoneme chain           */
                       
/*
 *      Function Name:       
 *
 *  	Description: This is the main driving routine for letter to sound.  It is called
 * 		with two pointers; these bracket the text to be spoken.  This routine
 * 		makes a private copy  of the text, using a doubly-linked list format.
 * 		Overview:
 *      Letter to sound proceeds in several discrete stages, each requiring
 *      a single left-to-right (or right-to-left) scan of the word:
 *      1. The word is tidied up, and orthographic stress put in a "flag"
 *      2. A first pass letter to phoneme conversion handles certain
 *         letters and letter sequences, such as "ch" and "th".
 *         The output is a linked list of phonemes (with the stress flag
 *         tucked away).  The grapheme is kept around for debugging only.
 *      3. A right-to-left pass syllabifies the word, assigning phonemic
 *         stress.
 *      4. A final pass performs "allophonic" conversions.  The output
 *         is a fully phonemicized utterance.
 *
 *      Arguments:  LETTER          *llp;
 *					LETTER          *rlp;
 *					int             isdict        TRUE if this is a dictionary call   
 *					int             context;      context for dictionary stripping    
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */                       
void ls_rule_lts(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, int isdict, int context)

{
	PHONE          *lsp;         		/* -> word string       */
	PHONE          *endp;          		/* -> trailing w.bound  */

    PLTS_T pLts_t = phTTS->pLTSThreadData;                    
	/*
	 * Fix multinationals. Input is a word in lowercase
	 * (or multinational letters) output -- in ls_phoneme list
	 * -- is lowercase alpha, '~n' is represented as '@', and
	 * orthographic stress is marked by setting p_flag.
	 */
	if (isdict)
	{
	    if ((pLts_t->phead.p_fp = lsp = ls_rule_dic_unfix(pLts_t)) == NULL)
		goto oops;
	}
	else
	{
	    if ((pLts_t->phead.p_fp = lsp = ls_rule_lts_unfix(pLts_t, llp, rlp)) == NULL)
		goto oops;
	}

	if ((endp = l_la_ru1_orthophon(pLts_t, lsp)) == NULL)
	    goto oops;
	    

#ifdef SLTS_DEBUG
ls_util_dump_lsp_endp(0,lsp,endp,"p_letter");
ls_util_dump_lsp_endp(1,lsp,endp,"p_phone");
//goto done;
#endif

#if LTS_DEBUG
	if (DEBUG(LTS_DEBUG))
	    ls_rule_pdump(lsp, NULL, "after orthophon", TRUE);
#endif
	if (l_la_ad1_syll(pLts_t, lsp, endp) == NULL) {        /* Syllabify & stress   */
oops:       ls_spel_spell(phTTS, llp, rlp);              /* Out of room!         */
	    goto done;
	}

#if LTS_DEBUG
	if (DEBUG(STR_DEBUG))
	    ls_rule_pdump(lsp, NULL, "after all ortho", TRUE);
#endif

	ls_rule_lts_out(phTTS, NEXT(lsp), endp, context);       /* Skip guard entry     */
done:   for (lsp = pLts_t->phead.p_fp; lsp != NULL; lsp = endp) {
	    endp = NEXT(lsp);
	    ls_rule_phone_free(pLts_t, lsp);
	}
}                      


/*
 *      Function Name: ls_rule_lts_unfix()      
 *
 *  	Description: This converts the word from Multinational to the 7-bit autocompose
 * 					 format which is needed to set word stress (accent?) correctly.
 * 					 Output is in the phoneme linked list (letters are in the range ' ' .. '~'). 
 * 					 unfix returns a pointer to the initial guard element, or NULL
 * 					 on garbage or overly-long words.
 *
 * 					 Random apostrophes are tossed here.
 *
 * 					 The list has the format:
 *      			 guard -> byte1 -> byte2 -> guard -> guard
 * 					 where the guard words have their letter set to EOS.
 * 					 the initial guard phoneme allows deleting the first letter (hacia).
 * 					 Two trailing guard words are needed to properly handle look-ahead.
 * 					 lsortho() converts the first guard to a WBOUND.
 *
 *
 *
 *      Arguments: (PLTS_T pLts_t, LETTER *word, LETTER *wend
 *
 *      Return Value:  PHONE *
 *
 *      Comments:
 *
 */
PHONE * ls_rule_lts_unfix(PLTS_T pLts_t, LETTER *word, LETTER *wend)
{
	 PHONE          *wordp;
	 PHONE          *outp;
	 int            c;
                       
	if ((outp = wordp = ls_rule_phone_alloc(pLts_t)) == NULL)
	    return (NULL);

	outp->p_letter = EOS;                   /* Initial guard        */
	for (; word < wend; word++) {
        outp->p_phone = 0;
		if ((c = word->l_ch) == '\'') {     /* Random apostrophe?   */
		continue;                       	/* Ignore leftover '    */
	    }
	    if ((outp = ls_rule_append(pLts_t, outp, c)) == NULL)
		return (NULL);
	    if ((outp = ls_rule_unfix(pLts_t, c, outp)) == NULL)
		return (NULL);
	}
	/*
	 * Terminate with two dummy letters.
	 */
   
	if ((outp = ls_rule_append(pLts_t, outp, EOS)) == NULL)
	    return (NULL);
	if ((outp = ls_rule_append(pLts_t, outp, EOS)) == NULL)
	    return (NULL);

	return (wordp);
}

/*
 *      Function Name: ls_rule_dic_unfix()      
 *
 *  	Description: Called with a text dictionary entry.
 *
 *      Arguments: 
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */
PHONE *ls_rule_dic_unfix(PLTS_T pLts_t)
{
    int    offset;
    PHONE  *outp;
    PHONE  *wordp;

	offset = pLts_t->dic_offset;
	if ((outp = wordp =ls_rule_phone_alloc(pLts_t)) == NULL)
	    return (NULL);
	outp->p_letter = EOS;
	
/* JDB: this is pointless, dic_fetch automatically returned
   EOS.  
	while ((c = dic_fetch(offset++)) != EOS) {
	    if ((outp = ls_rule_append(pLts_t, outp, c)) == NULL)
		return (NULL);
	    if ((outp = ls_rule_unfix(pLts_t, c, outp)) == NULL)
		return (NULL);
	}
*/
	/*
	 * Terminate with two dummy letters.
	 */
	if ((outp = ls_rule_append(pLts_t, outp, EOS)) == NULL)
	    return (NULL);
	if ((outp = ls_rule_append(pLts_t, outp, EOS)) == NULL)
	    return (NULL);
	return (wordp);
}
                         

/*
 *      Function Name: ls_rule_unfix()      
 *
 *  	Description: Fix up letters, building the phoneme structure.
 *
 *      Arguments: PLTS_T pLts_t, int c, PHONE *outp
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */                         
PHONE *ls_rule_unfix(PLTS_T pLts_t, int c, PHONE *outp)
{

	if (c >= ' ' && c <= '~')
	    ;                           /* Normal letter        */
	else if (c >= 0xC0 && (c = unfix_out[c - 0xC0]) != 000) 
	{
	    if (c < '@') 
	    {
			/*
		 	 * One of the special cases, such as u-dieresis.
		 	 */
			outp->p_letter = fix_text[c][0];
			if ((outp = ls_rule_append(pLts_t, outp, fix_text[c][1])) == NULL)
			{ 
		    	return (NULL);              /* Urk                  */
			}
	    }                                   /* Marked stress?       */
	    else if (ISUPPER(c)) 
	    {              
			outp->p_flag = LS_STRESS_1;     /* Orthographic stress  */
			outp->p_letter = _TOLOWER(c); 	/* Get true vowel */
	    }
	    else 
	    {
			outp->p_letter = c;
	    }
	}
	else 
	{
#ifdef VMS
	    log("garbage character '%c'\n", c);
#endif
	    return (NULL);
	}
	return (outp);
}

 

/*
 *      Function Name: ls_rule_append()      
 *
 *  	Description:  Append a phoneme to the chain after the specified one.
 * 					  A letter is passed to fool the syllabification routine.
 *
 *      Arguments: PLTS_T pLts_t, PHONE *current, int c
 *
 *      Return Value: PHONE *
 *
 *      Comments:
 *
 */

PHONE *ls_rule_append(PLTS_T pLts_t, PHONE *current, int c)
{
	 PHONE          *new;
	 PHONE          *next;

	if ((new = ls_rule_phone_alloc(pLts_t)) != NULL) {
	    next = NEXT(current);
	    PREV(new)           = current;
	    NEXT(new)           = next;
	    NEXT(current)       = new;
	    if (next != NULL)
		PREV(next)      = new;
	    new->p_letter = c;
	    new->p_flag = 0;
#ifdef VMS
	    new->p_phone = SIL;                 /* For debug printouts  */
#endif
	}
	return (new);
}


/*
 *      Function Name: ls_rule_delete()      
 *
 *  	Description:  Delete this phoneme from the list.   Return what was "next"
 * 					  Hack index chains, too.
 *
 *      Arguments: PLTS_T pLts_t, PHONE *lsp
 *
 *      Return Value: PHONE *
 *
 *      Comments:
 *
 */
PHONE *ls_rule_delete(PLTS_T pLts_t, PHONE *lsp)
{
	 PHONE          *result;
	 PHONE          *index;

	if ((result = PREV(lsp)) != NULL) {
	    NEXT(result) = NEXT(lsp);
	    index = NULL;                       /* Don't attach twice   */
	}
	if ((result = NEXT(lsp)) != NULL) {
	    PREV(result) = PREV(lsp);
	}
	ls_rule_phone_free(pLts_t, lsp);
	return (result);
}



/*
 * This is the output routine for the
 * letter to sound process. It is called after letter to
 * sound has processed its word, to write the generated phonemes
 * out to the synthesizer task. After a phoneme is written out,
 * any index marks in the index chain are written out. It is not
 * obvious why the "phead" can have an index chain. This happens
 * any time a block of graphemes, containing an index, in word
 * initial position, generate no phonemes.
 */

#if LS_ANY_STRESS != 7
#error the following will not work
#endif
#if LS_STRESS_1 != 1 || LS_STRESS_2 != 2 || LS_STRESS_3 != 4
#error the following will not work
#endif

const static  char    stress_phone_tab[LS_ANY_STRESS] = {
	SIL,                    /* No stress            */
	S1,
	S2,
	S1,
	SEMPH,
	SEMPH,
	SEMPH,
};                    


/*
 *      Function Name: ls_rule_lts_out()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, 
 *				   PHONE *lsp, 
 *				   PHONE *endp,int context
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void ls_rule_lts_out(LPTTS_HANDLE_T phTTS, PHONE *lsp, PHONE *endp,int context)
{
	PHONE          *startp;
	int            stress_phone;        
	 
//    PLTS_T pLts_t = phTTS->pLTSThreadData;

   	
	/*      Don't use rule_lts_index anymore...
 	 *		ls_rule_lts_index(phTTS, pLts_t->phead.p_ip);
 	 */
	for (startp = lsp; lsp != endp; lsp = lsp->p_fp) {

//		if (context == SNOPARS // NAL warning removal
//		 && (phone == PPSTART || phone == VPSTART))
//		    goto onward;                /* Too lazy to indent   */
		if (LSISSBOUND(lsp)
		 && lsp->p_phone != WBOUND
		 && lsp != startp)
			ls_util_send_phone(phTTS, SBOUND);
		stress_phone = stress_phone_tab[lsp->p_flag & LS_ANY_STRESS];
		if (stress_phone != SIL)
		    ls_util_send_phone(phTTS, stress_phone);
		ls_util_send_phone(phTTS, lsp->p_phone);
//		onward: ; // NAL warning removal
		/* ls_rule_lts_index(phTTS, lsp->p_ip); */
	}
}


/*
 *      Function Name: ls_rule_lts_index()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS, 
 *				   PHONE *ip  				Pointer to the index chain
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void ls_rule_lts_index(LPTTS_HANDLE_T phTTS, PHONE *ip)
{
	PLTS_T pLts_t;
	PKSD_T  pKsd_t;

	pLts_t = phTTS->pLTSThreadData;
	pKsd_t = phTTS->pKernelShareData;   

}


#if LTS_DEBUG || SYL_DEBUG || STR_DEBUG

/* JDB: not in English */ 

/*
 *      Function Name: ls_rule__pdump()      
 *
 *  	Description:  Dump phonemes (TRUE), letters (FALSE)
 *
 *      Arguments: 	PHONE *lsp, 
 *				   	PHONE *endp, 
 *					char *why, 
 *					int dump_phonemes
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void ls_rule__pdump(PHONE *lsp, PHONE *endp, char *why, int dump_phonemes)
{
	 int    i;
	 PHONE  *dumpp;

	for (i = 0, dumpp = lsp;
		dumpp != endp && dumpp != NULL;
		dumpp = NEXT(dumpp)) 
	{
	    i++;
	}
	if (why != NULL)
	{
	    log("%s dump %s, %d phonemes",
		(dump_phonemes) ? "Phoneme" : "Letter",
		why, i);
	}
	log(": \"");
	for (dumpp = lsp;
		dumpp != endp && dumpp != NULL;
		dumpp = NEXT(dumpp)) 
	{
	    if (!dump_phonemes) 
	    {
			dchar(dumpp->p_letter);
			continue;
	    }
	    if (LSISSBOUND(dumpp)
	     && dumpp->p_phone != WBOUND)
			log("%s", SPPNAME(SBOUND));
			
	    if (LSISSTRESS(dumpp)) 
	    {
			log("%s",
		    phprint(stress_phone_tab[dumpp->p_flag & LS_ANY_STRESS]));
	    }
	    log("%s", SPPNAME(dumpp->p_phone));
	}
	log("\"\n");
}
#endif
                         
/******************************************************************
 * This code was taken from the old "sls5.c" file.
 * Real letter to sound is here.
 ******************************************************************
 */

/*
 * fonemequiv[] translates between Ascii bytes and the "default"
 * phoneme for a particular letter.  An entry of NOVALID indicates an
 * illegal (in this context) character.  It is accessed by
 *      value = fonemequiv[ascii_byte - '@']; (after merging case)
 * Letters are guaranteed to be in the range ' ' to '~'.
 *
 * Note: a few letters are marked NOVALID because they are completely
 * handled by the orthographic rules.
 */

const static  char fonemequiv[] = {
      /* @ .. G */   LA_NH,   LA_A,   LA_B,   NOVALID,LA_D,   LA_E,   LA_F,   NOVALID,
      /* H .. O */   NOVALID,LA_I,   LA_J,   LA_K,   LA_L,   LA_M,   LA_N,   LA_O,
      /* P .. W */   LA_P,   NOVALID,NOVALID,NOVALID,LA_T,   NOVALID,LA_B,   NOVALID,
      /* X .. Z */   NOVALID,LA_Y,   LA_TH,   NOVALID,NOVALID,NOVALID,NOVALID,NOVALID
      };


extern PHONE      *ls_rule_delete(PLTS_T, PHONE *);

/*
 *      Function Name: l_la_ru1_orthophon()      
 *
 *  	Description: Orthographic to phonemic transcription.
 *                   Programming note:
 *   				 to delete the current segment:
 *   				 lsp = PREV(ls_delete(lsp));     (note: nextp is wrong)
 *   				 to delete the next segment
 *   				 ls_delete(nextp);               (note: nextp is wrong)
 *   				 to insert a segment:
 *   				 lsp = ls_rule_append(lsp, c)         (note: nextp points after new)
 *   				 at the exit from the big switch, lsp must point to the current
 *   				 symbol.  If symbols were inserted, it must point to the last
 *   				 one inserted.  nextp need not be preserved.
 *
 *      Arguments:  PLTS_T pLts_t, 
 *					PHONE * lsp
 *
 *      Return Value: PHONE * 
 *
 *      Comments:
 *
 */
PHONE * l_la_ru1_orthophon(PLTS_T pLts_t, PHONE * lsp)
{
   	int      c;   	 /* Current letter in the word */
   	PHONE    *nextp;
   	int      next;   /* Next letter in the word  */
   	int      last;   /* Previous letter in word  */
   	int      newlast;

   	for (lsp = NEXT(lsp);;)
    {
    	/* For all words   */
      	last = EOS;            /* Note word begin */
      	for (;;)
	 	{
	 		c = lsp->p_letter;

	 		if (!ISALPHA(c) && c != '@'/* n-tilde  */    && c != '?')/* Phoneme hack       */
	    		break;
	 		nextp = NEXT(lsp);
	 		if ((next = nextp->p_letter) == ' ')
	 		next = EOS;
	 		newlast = c;
	 		switch (c)
	    	{
	    		case '?':
	     			break;      /* We already have the phoneme */
	    		case 'c':
	       			/*
				 	 * CH -> [ch]                            Charco
				 	 * C  -> [th] / ... {e, i, or y}         Lucia, cinco
				 	 *    || [k]                               Casa
				 	 */
	    			switch (next)
	       			{
	       				case 'h':
	       					/* RULE("ch -> [ch]"); */
	       					lsp->p_phone = LA_CH;
	       					ls_rule_delete(pLts_t, nextp);
							break;
	       				case 'e':
	       				case 'i':
	       				case 'y':
	       					/* RULE("c -> [th] / ... {e, i, y}"); */
	       					lsp->p_phone = LA_TH;
							break;
	       				default:
	       					/* RULE("c -> [k]"); */
	       					lsp->p_phone = LA_K;
							break;
	       			}
	    			break;
	    		case 'g':
	    			/*
	    		 	 * GU -> [g] / ... {u, i, e}         Gues
	    		 	 * note: GU, not G'U
	    		 	 * G  -> [j] / ... {e, i}            Gila
	    		 	 *    || [g]                         Gasa
	    		 	 * Note: this predicts "gues"  -> [ges],   not [gues]
	    		 	 * Also,   it predicts "g'ues" -> [g'ues], not [ges]
	    		 	 * and "gu'es" -> [gu'es], not [ges]
	    		 	 * Note also that u-diaresis is handled "magically"
	    		 	 * because unfix turned u-diaresis into "uu".
	    		 	 */
	    			switch (next)
	        		{
	       				case 'e':
	       				case 'i':
	       					/* RULE("g -> [j] / ... {e, i}"); */
	       					lsp->p_phone = LA_J;
						break;
	       				case 'u':
	       					if (!LSISSTRESS(nextp))
		  					{
		  						switch (NEXT(nextp)->p_letter)
		     					{
		     						case 'e':
		     						case 'i':
		     						case 'u':
		     							/* RULE("gu(-str) -> [g] / ... {e, i, u}"); */
		     							ls_rule_delete(pLts_t, nextp);   /* Skip the 'u' */
		     					}
		  					}
	       				default:
	       					lsp->p_phone = LA_G;
							break;
	       			}
	    			break;
	    		case 'h':
	    			/*
	             	 * HI -> [y] / ... [+vowel]
	    		 	 *    || []   / elsewhere
	    		 	 */
	    			if (next == 'i'
	      				&& !LSISSTRESS(nextp)
	      				&& ISVOWEL(NEXT(nextp)->p_letter))
	       			{
	       				lsp->p_phone = LA_Y;
	       				/* RULE("hi -> [y] / ... [vowel]"); */
	       				ls_rule_delete(pLts_t, nextp);
	       			}
	    			else
	       			{
		       			/* RULE("h -> []"); */
	    	   			lsp = PREV(ls_rule_delete(pLts_t, lsp));   /* Delete 'h'      */
	       			}
	    			break;
	    		case 'l':
	    			/*
	    	 	 	* LL -> [ll] / ... l                Calle
	    	 	 	* L  -> [l]                         Luna
	    	 	 	*/
	    			if (next != 'l')
	       			{
		       			/* RULE("l -> [l] / ... {not l}"); */
	       				lsp->p_phone = LA_L;
	       			}
	    			else
	       			{   /* 'll'             */
		       			/* RULE("ll -> [ll]"); */
	       				lsp->p_phone = LA_LL;
	       				ls_rule_delete(pLts_t, nextp);      /* Skip 2nd 'l'   */
	       			}
	    			break;
	    		case 'q':
		    		/*
	    		 	 * QU -> [K] / ... {e, i, y}
	    		 	 * Q  -> [K]
	    		 	 * Note: "qu'e" -> [ku'e], not [k'e]
	    		 	 */
	    			lsp->p_phone = LA_K;
	    			/* RULE("q -> [k]"); */
	    			if (next == 'u')
	       			{      /* "que" or "qui" */
		       			switch (NEXT(nextp)->p_letter)
		  				{ /* not quantum      */
			  				case 'e':
		  					case 'i':
		  					case 'y':
			  					/* RULE("u -> [] / {q} ... {e, i, y}"); */
		  						ls_rule_delete(pLts_t, nextp);
		  				}
	       			}       	
	    			break;
	    		case 'r':
		    		/*
	    		 	 * RR -> [rr]
	    		 	 *  R -> [rr] / {wbound, N, L, S} ...
	    		 	 * R -> [r]
	    		 	 */
	    			if (next == 'r')
	       			{
		       			/* RULE("rr -> [rr]"); */
	       				lsp->p_phone = LA_RR;
	       				ls_rule_delete(pLts_t, nextp);
	       			}
	    			else if (last == EOS
		   				 	|| last == 'n'
		   				 	|| last == 'l'
		   				 	|| last == 's')
	       			{
	       				/* RULE("r -> [rr] / {wbound, n, l, s} ..."); */
	       				lsp->p_phone = LA_RR;
	       			}
	    			else
	       			{
		       			lsp->p_phone = LA_R;
	       			}
	    			break;
	    		case 's':
	    			/*
	    		 	 * SC -> [th] / {n} ... {i, e}
	    		 	 *    || [s]
	    		 	 */
	    			if (last == 'n' && next == 'c'
	       				&& (NEXT(nextp)->p_letter == 'i'
	       				|| NEXT(nextp)->p_letter == 'e'))
	       			{
	       				/* RULE("sc -> [th] / {n} ... {i, e}"); */
	       				lsp->p_phone = LA_TH;
	       				ls_rule_delete(pLts_t, nextp);
	       			}
	    			else
	      			{
	      				lsp->p_phone = LA_S;
	      			}
	    			break;
	    		case 'u':
	    			/*
	    			 * uu -> [u]         (cleanup leftover dieresis)
	    			 */
	      			if (next == 'u')
	       			{
	       				/* RULE("uu -> [u]"); */
	       				ls_rule_delete(pLts_t, nextp);
	       			}
	    			lsp->p_phone = LA_U;
	    			break;
	    		case 'w':
	    			/*
	    		 	 * Foreign words only.  dictionary says "originally
	    			 * pronounced like 'v' or 'b'; nowadays, in imitation
	    			 * of the English [w], it is pronounced like [gu] in
	    			 * "Guam", "guacamole".  We'll stuff in a [g] and
	    			 * see what happens.
	    			 *
	    			 *    W -> [w] / {wbound} _          washington
	    			 *     || [gu]                       whisky
	    			 */
	    			if (next == 'h')
	       			{
	       				/* RULE("wh -> [w]"); */
	       				lsp->p_phone = LA_W;
	       				ls_rule_delete(pLts_t, nextp);
	       			}
	    			else
	       			{
	       				/* RULE("w -> [gu]"); */
	       				lsp->p_phone = LA_G;
	       				if ((nextp = ls_rule_append(pLts_t, lsp, 'u')) == NULL)
		  					return (NULL);
	       				lsp->p_phone = LA_U;
	       			}
	    			break;
	    		case 'x':
	    			/*
	    	 		 *   X -> [ks]  / ... [+vowel]
	    	 		 *     || [s]
	    	 		 * Note: Mexico, Xaviar are mispronounced.
	    	 		 * Syllabification is not clear: should it be
	    	 		 * eks-perto or ek-sperto.  Probably doesn't make                            
	    	 		 * a whole lot of difference.  'y' is a vowel here
	    	 		 */
	    			if (ISVOWEL(next) || next == 'y')
	       			{
	       				/* RULE("x -> [k s] / ... [yvowel]"); */
	       				lsp->p_phone = LA_K;
	       				if ((lsp = ls_rule_append(pLts_t,lsp, 's')) == NULL)
	       					return (NULL);
	       				lsp->p_phone = LA_S;
	       			}
	    			else
	       			{
	       				/* RULE("x -> [s]"); */
		       			lsp->p_phone = LA_K;
	       				if ((lsp = ls_rule_append(pLts_t, lsp, 's')) == NULL)
						{
		      				return (NULL);
						}
	       				lsp->p_phone = LA_S;
	       			}
	    			break;
	    		case 'y':
	    			/*
	    			 * Y -> [i]  / [-vowel] ... [-vowel] whisky, ymca
	    			 *   -> [i]  / ... [wbound]                  muy
	    			 *   -> [y]
	    			 * Note: 'y' by itself goes in dictionary.
	    			 */
	    			if (!ISVOWEL(next) && !ISVOWEL(last))
	        		{
	       				/* RULE("y -> [i] / [-vowel] ... [-vowel]"); */
	       				lsp->p_phone = LA_I;
	       			}
	    			else if (next == EOS)
	       			{
		       			/* RULE("y -> [i] / ... [wbound]"); */
		       			lsp->p_phone = LA_I;
	    	   		}
	    			else
	       			{
	       				lsp->p_phone = LA_Y;
	       			}
	    			break;
	    		default:
	    		/*
	   		 	 * Fold case to shorten the table.
	   			 */
	    		lsp->p_phone = fonemequiv[c & 0x1F];
	    		break;
	    	} /* switch(c) */
	 	last = newlast;
	 	lsp = NEXT(lsp);
	 }
     /* Loop through word      */
     /*
      * Word finished, c is the first byte after the word.
      * Now, output the word boundary and/or comma
      * pause.  At this point, lsp points to the letter following
      * the word (space or comma), or to the first EOS that trails
      * the word or string of words.  On exit from this section,
      * lsp points to the first byte of the next word (or to an EOS).
      * The only way punctuation appears here is from the built-in
      * dictionary (and only ',' may appear.)
      */
     switch (c)
	 {
	 	case EOS:
	 		goto done_words;
	 	case ' ':
	 		lsp->p_phone = WBOUND;
	  		break;
	 	case ',':
	 		lsp->p_phone = COMMA;
	  		break;
	 	default:
	 		lsp = PREV(ls_rule_delete(pLts_t, lsp));
	 }
      	lsp->p_letter = EOS;      /* For lstress          */
      	lsp = NEXT(lsp);
    } /* for (lsp = NEXT(lsp);;) */
   done_words:
   lsp->p_phone = WBOUND;         /* At end of word     */
   return (lsp);            /* Return -> end    */
}
		

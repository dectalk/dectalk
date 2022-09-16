/*
 ***********************************************************************
 *                                                                      
 *                           Coryright (c)                              
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
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
 *    File Name:	ls_spel.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    ls_spel_say_it() returns true if we should pass this string through letter to
 *    sound ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date            Description                    
 * ---	-----	----------      ---------------------------------------
 * 001	MGS		02/07/1996		Moved code from lsspell.c to ls_spel.c 
 * 002	MGS		02/22/1996		removed KRM code
 * 003	MGS		02/26/1996		Added function headers
 * 004	MGS		02/26/1996		ls_spel_spell now uses ls_lower for case folding
 * 005	MGS		02/26/1996		NON_VOWEL changed to !IS_VOWEL 
 * 006	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 * 007	GL		07/29/1996		use ls_util_write_pipe() to replace write_pipe()
 * 008	GL		11/22/1996		remove extra SIL in ls_spel_spell()
 * 009	DR		07/21/1997		UK BUILD: ENGLISH_US was changed to ENGLISH or added a copy as ENGLISH_UK 
 * 010  GL		05/14/1999		BATS#865 use OHpunits[] for NWS_US time reading 
 *
 */
 
#include	"ls_def.h"
#include 	"ls_spel1.c"

                     
/*
 *	Function Name:	                            
 *		ls_spel_spell
 *
 *	Description:
 * 	Spell a word. The "lp1" and
 * 	"lp2" pointers enclose the word in the
 * 	standard way. The dictionary entries for the
 * 	letters are of the form " a". Handcraft the block
 * 	in an array of LETTER, and hand it to the common
 * 	lookup code. The "-" is special because of the
 * 	MODE_MATH stuff.
 *		this function actually does the lookup into the typing table
 *		for each letter in the word
 *
 *	Arguments:                     
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp		The right bounding pointer the word
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */
void ls_spel_spell(LPTTS_HANDLE_T phTTS,LETTER *lp1, LETTER *lp2)
{
	LETTER  lbuf[2];
	unsigned char _far *tp;
	unsigned int phone;           
	PKSD_T pKsd_t;
	
	pKsd_t = phTTS->pKernelShareData;

	/* 
	 * if (how != FAST)
	 * ls_util_send_phone(phTTS,COMMA); eab out-I don't think this does anything
	 */


	while (lp1 < lp2)
	{
			/*
			 * eab kludge becuase at this level we don't presently know
			 * what punc is on so dash will normally not be spelled except
			 * if it occurs in the enviroment space-dash-space in which
			 * case it comes from gok: with dashnfast on
			 * where it should be pronounced   
			 *
			 * if(lp1->l_ch == '-' )
			 * {
			 *	lp1->l_ch=' ';
			 * }                         
			 * eab-out-now handled in cmd_pars
			 */
							

		if(ls_math_do_math(pKsd_t,(unsigned char)lp1->l_ch) == false)
		{
			lbuf[0].l_ch = lp1->l_ch;
								
			/*
			 * All upper case letters are mapped to
			 * lower case. This makes it unnecessary to have
			 * the letters in the dictionary twice. The funny
			 * letters in the multinational set are in the
			 * dictionary twice, because it (effectively) puts
			 * a case folding table into the dictionary.
			 */
			
			lbuf[0].l_ch=ls_lower[lbuf[0].l_ch]; /* case folding for all characters now */	
												 /* why are we folding the case anyway */
			lbuf[0].l_ip = NULL;
#ifdef ENGLISH
			if(lbuf[0].l_ch == 'a')
			{
				ls_util_send_phone(phTTS,S1);
				ls_util_send_phone(phTTS,EY);
			}
			else
#endif
#if (defined SPANISH) || (defined GERMAN)
			if(1)
#endif
			{
				if (lbuf[0].l_ch>='0' && lbuf[0].l_ch<='9')
				{

#ifdef NWS_US
					ls_util_send_phone_list(phTTS,OHpunits[(lbuf[0].l_ch-'0')]);
#else
					ls_util_send_phone_list(phTTS,punits[(lbuf[0].l_ch-'0')]);
#endif
					/* ls_util_send_phone(phTTS,SIL); */
				}
				else
				{
                	
					for(tp = (unsigned char _far *)pKsd_t->typing_table[lbuf[0].l_ch];*tp;tp++)
					{
						phone = pKsd_t->reverse_ascky[*tp];
						/* printf("lbuf = %02x, tp= %02x,phone %04x\n",lbuf[0].l_ch,*tp,phone);  */
						ls_util_write_pipe(pKsd_t,(short *)&phone,1);
					}

				 		/* if (ls_dict_blook(&lbuf[0], &lbuf[1], SINGLE_CHAR) == MISS) */
						/* ls_util_send_phone(phTTS,EY);*/
				}
			}
		}
		++lp1;
		if (lp1 != lp2)
		{
#if defined (ENGLISH) || defined (GERMAN)
			ls_util_send_phone(phTTS,WBOUND);
#endif
#ifdef SPANISH
			ls_util_send_phone(phTTS, COMMA);
#endif
		
		}
	}
}
	
/*
 *	Function Name:
 *		ls_spel_spell_speed	
 *
 *	Description:
 *		determine the spelling speed of a word to be spelled
 *
 *	Arguments:                                              
 *		LETTER *llp		The left bounding pointer to the word
 *		LETTER *rlp		The right bounding pointer the word
 *
 *	Return Value:
 *		FAST	Spell using fast spelling speed
 *		SLOW	Spell using slow spelling speed
 *
 *	Comments:
 * 		One letter words are always spelled quickly, for
 * 		compatability with DECtalk I (I almost missed this before
 * 		the 23 class release). Things 2 or 3 letters long that are
 * 		all alphabetic are spelled fast (CBS). Things 2, 3, or 4
 * 		long that are all alphabetic except for 1 "&" character
 * 		are spelled fast (AT&T, FA&T, R&B). The rest are done
 * 		slowly.
 *
 */
int ls_spel_spell_speed(LETTER *llp, LETTER *rlp)
{
	  int   c;
	  int   nchar;
	  int   namper;

	if (llp+1 == rlp)                       /* 1 letter words are   */
		return (FAST);                  	/* always fast.         */
	nchar  = 0;
	namper = 0;
	while (llp != rlp) 
	{
		c = (llp++)->l_ch;
		++nchar;
		if (c == '&')                   /* Count "&"            */
			++namper;
		else 
		{
			/* if (c>='A' && c<='Z')   / * Fold case.           * /
				c += 'a'-'A'; */
			c = ls_lower[c];		/* fold case using the case table */
			/* if (c<'a' || c>'z')     / * Slow if not alpha.   * /
				return (SLOW); */
			if (!IS_ALPHA(c))		/* use the macro to lookup in table */ 
				return(SLOW);
		}
	}
	if (nchar < 4)                          /* Short word.          */
		return (FAST);
	if (nchar==4 && namper==1)              /* "FA&T"               */
		return (FAST);
	return (SLOW);
}
		

/*
 ***********************************************************************
 *                                                                      
 *                           Copyright (c)                              
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.    
 *    © SMART Modular Technologies 1999. All rights reserved.    
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
 *    File Name:	ls_dict.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *	  dictionary search routines.
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	TEK		09/15/1995		fix the search routines.
 * 002	CJL		09/20/1995		also included as slsdic.c w/ SPANISH_DIC defined.
 * 003	GL		09/20/1995		change for German.
 * 004	CJL		09/21/1995		also included as glsdic.c w/GERMAN_DIC defined
 * 005	CJL		10/04/1995		Add German & generic DICDEBUG PRINTF changes.
 * 006	CJL		10/23/1995		Correct bugs in DICDEBUG printf statements.
 * 007	GL		01/28/1996		allow Spanish to search "i" and "a" from dictionary.
 * 008	GL		02/02/1996		Add codes to support Spanish and German user dictionary.
 * 009	MGS		02/07/1996		Moved code to ls_dict.c
 * 010 	MGS		02/27/1996		Added function headers and reformatted code
 * 011	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 * 012  GL		05/12/1996		Add codes to support French dictionary search
 *								also allow "I" to perform dictionary search.
 * 013  GL		05/15/1996		limit should point to DICT_ENTRY
 * 014  MGS     06/03/1996      add change to fix user dic. WIN95 problem.
 * 015  GL      07/11/1996      fix ms. ft. miss problem.
 * 016  GL      08/14/1996      fix the missing dictionary problem of "on." , "dectalk."
 * 017	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 018	GL		06/23/1997		BATS#393  support abbreviation for user dictionary search.
 * 019	GL      09/25/1997		add abbreviation dictionary support
 *                              also add one more argument for ufind_word() and
 *                              user_dict_look()
 * 020  DR		09/30/1997 		UK BUILD: use ENGLISH to replace ENGLISH_US
 * 021  DR		10/08/1997 		For BATS#487 fix the ending period crash problem.
 * 022	GL		04/28/1998		BATS#659 fix German -ig to -ige, -iger, -igen, iges  conversion problem
 * 023  JAW     07/07/1998      Added lexical functions DictionaryHit, DumpDictionary,
 *								UserDictionaryHit, DumpUserDictionary, AddUserEntry,
 *								DeleteUserEntry, and ChangeUserPhoneme.
 * 024	JAW		07/22/1998      Allocated additional byte for null character in phoneme strings
 *                              in DumpDictionary and DumpUserDictionary.
 * 025	MFG		07/24/1998		#ifdef out, reallocLock when building Windows CE
 * 026  JAW     08/07/1998		Added functions GetNumUserEntries, GetUserEntry, and 
 *                              SaveUserDictionary.
 * 027	GL		09/02/98	    block away the new API code from msdos.
 * 028  ETT		10/05/1998      Added Linux code.
 * 029	GL		11/20/1998		BATS#828 use LTS_DEBUG to replace _DEBUG
 * 030	GL		12/17/1998		BATS#846 add say_fletter mode to skip control character 
 * 031	MGS		08/22/1999		Change #ifdef LTS_DEBUG to #if LTS_DEBUG because of VMS debugging code
 *								that was turned on by accident
 ***********************************************************************************/
 
/*  #define DICDEBUG */

#include "ls_def.h"
#include "mmalloc.h" // tek 18jun98 

#ifdef __linux__
#include <stdlib.h>
#endif

/*
 *  find a word in the dictionary ...
 */

/*
 * dictionary private lookup areas ...
 */
/*
 *	Function Name:	
 *		ls_dict_blook
 *
 *	Description:
 *
 *	Arguments:	LPTTS_HANDLE_T phTTS,
 *				LETTER *llp,
 *				LETTER *rlp,
 *				int type
 *
 *	Return Value: int
 *
 *	Comments:
 *
 */
int ls_dict_blook(LPTTS_HANDLE_T phTTS,LETTER *llp,LETTER *rlp,int type)
{
	int	i; /* j not used ...tek 9/18/95 */
	unsigned char  __far *str_end;                                      
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PLTS_T pLts_t = phTTS->pLTSThreadData;

	/*
	 *  if this is a single character lookup, do it quickly since we usually have
	 *  a lot of them to do ...
	 */

	pLts_t->abbrev_look = pLts_t->no_pars = FALSE;
	pLts_t->str_vowel = 0;
	pLts_t->hit_type=MISS;
	if((type == SINGLE_CHAR) || (pKsd_t->sayflag == SAY_LETTER) || (pKsd_t->sayflag == SAY_FLETTER))
	{
		pLts_t->comp_str[0] = (unsigned char)((*llp).l_ch);
		pLts_t->comp_str[1] = 0;
		pLts_t->no_pars = TRUE;
#ifdef GERMAN
		if((UDICT_ENTRY != 0) && (ls_dict_ufind_word(phTTS,0,0) == HIT))
#else
		if((UDICT_ENTRY != 0) && (ls_dict_ufind_word(phTTS,0) == HIT))
#endif
		{
			return(pLts_t->hit_type);
		}
		/* Use the correct KS entry based on language being compiled */
		if(DICT_ENTRY != 0)
#ifdef GERMAN
			ls_dict_find_word(phTTS,0);
#else
			ls_dict_find_word(phTTS);
#endif
		else
			return(MISS);
		 return(pLts_t->hit_type); 
	}

	/*
	 *  standard lookup ... set up the parameters ...
	 */

	if(type == FABBREV)
	{
		pLts_t->abbrev_look = TRUE;
	}
	else
	{
		if(type == SNOPARS)
			pLts_t->no_pars = TRUE;
	}
	/* 4/94 eab if suffix stripper has eaten the whole word abandon ship*/

	if(llp == rlp)
	{
		return(MISS);
	}
	for(i=0;llp < rlp;i++)
	{
		pLts_t->comp_str[i] = (unsigned char)((*llp++).l_ch);
		if(pLts_t->str_vowel == 0)
		{
			if(IS_VOWEL(pLts_t->comp_str[i]))
				pLts_t->str_vowel = &pLts_t->comp_str[i];
		}
	}

	pLts_t->comp_str[i] = 0;
	str_end = &pLts_t->comp_str[i-1];
	/*
	 *  try the abbrev and user dictionary first if they are loaded ...
	 */
	/* 
	   GL 06/23/1997  BATS#393 support the abbreviation search for user
	   dictionary by appending the period before search then remove it
	   before moving forward to master dictionary search
	*/
	/* 
	   GL 10/08/1997  BATS#487 fix the ending period crash problem
	   since we support the period(like abbreviation) in the user
	   dictionary now, any words with ending period need to try with and
	   without period to cover all the possible cases
	 */
	if(UDICT_ENTRY != 0)
	{
		if(type == FABBREV)
		{
			pLts_t->comp_str[i] = '.';
			pLts_t->comp_str[i+1] = 0;
			str_end = &pLts_t->comp_str[i];
#ifdef GERMAN
			if(ls_dict_ufind_word(phTTS,0,0) == HIT)
#else
			if(ls_dict_ufind_word(phTTS,0) == HIT)
#endif
			{
				/* restore the original word structure */
				pLts_t->comp_str[i] = 0;
				str_end = &pLts_t->comp_str[i-1];
				pLts_t->hit_type = ABBREV;

#ifdef DICDEBUG
				printf("*");
#endif /*DICDEBUG*/
				return(pLts_t->hit_type);
			}
			else
			{
				/* restore the original word structure */
				/* Try again without the period. */
				pLts_t->comp_str[i] = 0;
				str_end = &pLts_t->comp_str[i-1];
#ifdef GERMAN
				if(ls_dict_ufind_word(phTTS,0,0) == HIT)
#else
				if(ls_dict_ufind_word(phTTS,0) == HIT)
#endif
				{
					pLts_t->hit_type = HIT;

#ifdef DICDEBUG
					printf("*");
#endif /*DICDEBUG*/
					return(pLts_t->hit_type);
				}
			}
		}
		else
		{
#ifdef GERMAN
			if(ls_dict_ufind_word(phTTS,0,0) == HIT)
#else
			if(ls_dict_ufind_word(phTTS,0) == HIT)
#endif
			{
				pLts_t->hit_type = HIT;

#ifdef DICDEBUG
				printf("*");
#endif /*DICDEBUG*/
				return(pLts_t->hit_type);
			}
		}
	}

	/*
	   GL 09/25/1997 use same ufind_word() rouitne for abbr. dictionary search except passing
	   1 for second argument
	*/
	/* 
	   GL 10/08/1997  BATS#487 fix the ending period crash problem
	   since we support the period(like abbreviation) in the abbr
	   dictionary now, any words with ending period need to try with and
	   without period to cover all the possible cases
	 */
	if(ADICT_ENTRY != 0)
	{
		if(type == FABBREV)
		{
			pLts_t->comp_str[i] = '.';
			pLts_t->comp_str[i+1] = 0;
			str_end = &pLts_t->comp_str[i];
#ifdef GERMAN
			if(ls_dict_ufind_word(phTTS,1,0) == HIT)
#else
			if(ls_dict_ufind_word(phTTS,1) == HIT)
#endif
			{
				/* restore the original word structure */
				pLts_t->comp_str[i] = 0;
				str_end = &pLts_t->comp_str[i-1];
				pLts_t->hit_type = ABBREV;

#ifdef DICDEBUG
				printf("*");
#endif /*DICDEBUG*/
				return(pLts_t->hit_type);
			}
			else
			{
				/* restore the original word structure */
				/* Try again without the period. */
				pLts_t->comp_str[i] = 0;
				str_end = &pLts_t->comp_str[i-1];
#ifdef GERMAN
				if(ls_dict_ufind_word(phTTS,1,0) == HIT)
#else
			    if(ls_dict_ufind_word(phTTS,1) == HIT)
#endif
				{
					pLts_t->hit_type = HIT;

#ifdef DICDEBUG
					printf("*");
#endif /*DICDEBUG*/
					return(pLts_t->hit_type);
				}
			}
		}
		else
		{
#ifdef GERMAN
			if(ls_dict_ufind_word(phTTS,1,0) == HIT)
#else
			if(ls_dict_ufind_word(phTTS,1) == HIT)
#endif
			{
				pLts_t->hit_type = HIT;

#ifdef DICDEBUG
				printf("*");
#endif /*DICDEBUG*/
				return(pLts_t->hit_type);
			}
		}
	}

	/*
 	 *  make sure a primary dictionary is loaded ...
	 */

	/* Use the correct KS entry based on language being compiled */
	if(DICT_ENTRY == 0)
	{
		return(MISS);
	}

	/*
 	 *  don't let 'a', 'A' through for English only
 	 */
	/* GL 8/17/95, not TRUE for German and Spanish */
#ifdef ENGLISH
	if(i == 1 && (ls_lower[pLts_t->comp_str[0]] == 'a'))
		/* Must be |gls_lower| when we do German later */
		return(MISS);
#endif

#ifdef GERMAN
	if(ls_dict_find_word(phTTS,0) == MISS)
#else
	if(ls_dict_find_word(phTTS) == MISS)
#endif
	{
		/* Spanish has no suffixes as of 9/20/95, so rtn MISS. cjl per eab */
#if defined (ENGLISH) || defined (GERMAN)
		if (i>2 )
		{
			pLts_t->abbrev_look=FALSE;
			/* Use the correct find routine based on language being compiled */
			return(ls_suff_suffix_find(phTTS,str_end,1));
		}				 				 
		else
#endif
		return(MISS);
	}
	return(pLts_t->hit_type);
}
/*
 *	Function Name:	
 *		ls_dict_find_word
 *
 *	Description:         
 *		this function searches the main dictionary for a word;
 * 		look up the word in pLts_t->comp_str, returning HIT or MISS and updating	
 * 		a pile of globals (see below).					
 *
 *	Arguments:                                              
 *		None
 *
 *	Return Value:
 *		HIT		the word was found in the dictionary
 *		MISS	The word was not found in the dictinary
 *
 *	Comments:
 *		this entire routine was rewritten 9/18/95 by ...tek		
 *
 */
#ifdef GERMAN
int ls_dict_find_word(LPTTS_HANDLE_T phTTS,short nosend)
#else
int ls_dict_find_word(LPTTS_HANDLE_T phTTS)
#endif
{
	long offset;/* how far we move to do the next lookup */
	int stat;	/* what the lookup returned */
	long base;	/* where we are looking now */
	long limit;

	int	localoff;	/* MVP MI New */
	long new_base = 0;		/* where we'll go look.. */
	
   
   	struct   dic_entry far *pent;		 /* MVP MI New */
	unsigned short cap;	/* the word is capitalized */ 
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PLTS_T pLts_t = phTTS->pLTSThreadData;
                                             
	
	
	/* Use the correct KS dic entry based on language being compiled */
	limit = (DICT_ENTRY); /* this is last_index+1 */
    /* 
     * pretend that the last time through we 	
	 * were offsetting by 1/2 the dic size, so	
	 * that when we enter the loop and cut the	
	 * offset in half we end up with 1/4 dic as 	
	 * the first move.			
	 */
	offset = limit>>1; 
	base=offset;	/* start in the middle of the dictionary.	*/
	                                                                  
	limit--;		/* now = the last valid index.			*/
	                                                                  
	/* 
	 * we now need to start searching, and continue until we either	
	 * have a hit or the offset has gone to 0. For dic sizes that 	
	 * are not a power of two, we may have to do one additional 	
	 * lookup after this loop completes.				
	 */
	        
	stat = MISS;	        
	do
	{
		offset = offset>>1;	/* narrow the range */
		if ( (stat=ls_dict_dlook(phTTS,base,&localoff,&pent)) == HIT)
			/* found it. */
			break; 
		
		/* wasn't this one. Move to the next candidate. 	*/
		if (stat == LOOK_HIGHER)
		{
			/* debug switch */
			if (DT_DBG(LTS_DBG,0x010))
			{
				printf("ls_dict_find_word:  up \n");
			}

#ifdef DICDEBUG
			printf("LSDIC.C; ls_dict_find_word;  up \n");
#endif /*DICDEBUG*/
			base += offset;
		}
	    else
	    {
		    base -= offset;
			/* debug switch */
			if (DT_DBG(LTS_DBG,0x010))
			{
				printf("ls_dict_find_word:  down \n");
			}
#ifdef DICDEBUG
			printf("LSDIC.C; ls_dict_find_word;  down \n");
#endif /*DICDEBUG*/
		}
	} while (offset != 0);
	
	/* 
	 * at this point, if we haven't hit we might have to walk a 	
	 * 'few' entries. We don't exactly know how many (probably 	
	 * log2(entries) in the worst case. We'll walk until we're 	
	 * told to go in the other direction. (ls_dict_dlook should be bounded	
	 * to turn the search away from the ends of the dictionary..) 	
	 */
	
	if (stat != HIT)
	{
		/* have to keep looking in the same direction */
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_find_word:  crawling, stat=%x\n",stat);
		}
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_find_word;  crawling, stat=%x \n",stat);
#endif /*DICDEBUG*/
		if (stat == LOOK_HIGHER)
		{
			while(stat == LOOK_HIGHER)
			{
				base++;
				stat = ls_dict_dlook(phTTS,base,&localoff,&pent);
			}
		}
		else 
		{
			if (stat == LOOK_LOWER)
			{
		    	while(stat == LOOK_LOWER)
		    		{
		    		base--;
		    		stat = ls_dict_dlook(phTTS,base,&localoff,&pent);
		    	}
		    }
		}
	} /* if (stat != HIT ) */
	                                     
	/* *** this is the end of the binary search. */
		                                
	/* if we don't have stat == HIT now, it's a miss. */
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_find_word:  miss \n");
	}
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_find_word;  miss. \n");
#endif /*DICDEBUG*/
	if (stat != HIT)
		return(MISS); /* all done. */
        /*************************************************************/
         /*  We have HIT the word. The word has been found at index   */
         /*  base.                                                    */
         /*************************************************************/


	
	/* 
	 * The dictionary allows words with an initial uppercase to 	
	 * signal a homograph. To detect the *possibility* of this, 	
	 * we look for the first character to be uppercase, and the 	
	 * second character to be lower case (this eliminates the 	
	 * possibility of capslock on..) .. then we'll go take a 	
	 * peek 							
	 * Be careful here folks.. we also have to make sure that 	
	 * the reverse hasn't happened (namely, that the word is NOT	
	 * capitalized and we hit the capitalized version) .. but..	
	 * ls_dict_dlook() won't match uppercase dictionary letters with 	
	 * lowercase incoming letters. It will, however, match an	
	 * incoming uppercase character with upper or lowercase 	
	 * dictionary letters. So, the cases that we have to look for	
	 * are:								
	 *	1) all-uppercase incoming, which could hit either	
	 *		1A)all lower case dict entry			
	 *		1B)capitalized dict entry   			
	 * 	2) capitalized incoming, which could hit either		
	 *		2A)all lower case dict entry		
	 *		2B)capitalized dict entry			
	 */
	
	/* figure out if the incoming word is "capitalized".. 		*/                                                                  
	cap = (IS_UPPER(pLts_t->comp_str[0])) && (IS_LOWER(pLts_t->comp_str[1]));	                                                                  
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_find_word:  cap:%x\n",cap);
	}
#ifdef DICDEBUG
	printf("LSDIC.C; ls_dict_find_word;  cap:%x \n",cap);
#endif /*DICDEBUG*/
	                                              
	/* cases 1A and 2B are correct, so we don't have to do anything	*/
	/* for them. We just have to go looking if we have the other 	*/
	/* two cases..							*/	                                              
	if(   (cap && IS_LOWER(pent->text[0])) 	/*2A*/
	   || (!cap && IS_UPPER(pent->text[0])) )	/*1B*/
	{                    
		/* at this point, the incoming word's capitalization	*/
		/* doesn't match the dictionary entry. 			*/
                                                                          
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_find_word:  capit. homograph reverse");
	}
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_find_word;  capit. homograph reverse \n");
#endif /*DICDEBUG*/								     
				                                     
		/* 
		 * the dictionary is sorted such that the capitalized	
		 * entry would be immediately before the uncap'd 	
		 * entry. We know we're on the wrong entry, and we know	
		 * which way we have to look..				
		 */
		if (cap)
			new_base = base-1;
		else
		  	new_base = base+1;		
		
		
		if((stat = ls_dict_dlook(phTTS, new_base,&localoff,&pent)) != HIT)
		{
			ls_dict_dlook(phTTS, base,&localoff,&pent);
		}						 

	}                                                         
		
	/* now just blurt it out.. */
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_find_word:  HIT complete.\n");
	}
#ifdef DICDEBUG
	printf("LSDIC.C; ls_dict_find_word;  HIT complete. \n");
#endif /*DICDEBUG*/
	
	pKsd_t->pronflag &= (~PRON_DIC_ALTERNATE);
	if(pLts_t->fc_struct[pLts_t->fc_index] == 0)
		pLts_t->fc_struct[pLts_t->fc_index] = pent->fc;
	else 
	{
		if(pent->fc & FC_HOMOGRAPH)
		{
			pLts_t->fc_struct[pLts_t->fc_index] = pLts_t->fc_struct[pLts_t->fc_index] | FC_HOMOGRAPH;
		}
	}
	/*
	 * eab 8/94 if suff stripper overrides
	 * form_class on a homograph we need to remember it's a homograph
	 */
        if((pent->fc & PPHRASE) == PPHRASE) 
		/* Use the correct ls_util_send_phone routine based on language being compiled */
		ls_util_send_phone(phTTS,PPSTART);
	if((((pent->fc & VPHRASE) == VPHRASE) || (pent->fc == FC_VERB)) && pLts_t->no_pars == FALSE)
		ls_util_send_phone(phTTS,VPSTART);
#ifdef GERMAN
	for(localoff += 1;pent->text[localoff+nosend] != '\0';localoff++)
#else
	for(localoff += 1;pent->text[localoff] != '\0';localoff++)
#endif
	{
		ls_util_send_phone(phTTS,pent->text[localoff]);
	}
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_find_word:  HIT");
	}
#ifdef DICDEBUG
	printf("*");
#endif /*DICDEBUG*/
	return(HIT);


} /* ls_dict_find_word(phTTS) */


/*
 *	Function Name:	
 *		ls_dict_dlook
 *
 *	Description:
 * 	compare the word in pLts_t->comp_str with the main dictionary entry at 	
 * 	DICT_HEAD[index]; return HIT, LOOK_HIGHER, or LOOK_LOWER as 		
 * 	appropriate and also set hit_type to ABBREV if appropriate.		
 * 	(the global pLts_t->abbrev_look allows abbreviation hits.. )			
 * 	Leave the global *ent pointing to the dictionary entry, which might	
 * 	not be the same as DICT_HEAD[base] in the case of homographs.	
 * 	also leave *pLocaloff set such that pent->text[*pLocaloff+1] is the start	
 * 	of the phoneme string.						
 * 	Lower case letters in pLts_t->comp_str can only match lower case in the 	
 * 	dictionary, but upper case letters can match either.			
 * 	this was cleaned up a little on 9/18/95 by ...tek.			
 * 	First, the non-hit cases set hit_type to MISS before returing; as 	
 * 	far as I know, nobody looks at hit_type in the case of a miss, but 	
 * 	I hate to leave bad info laying around in a global variable. 	
 * 	Also, this routine would happily match off either end of the 	
 * 	dictionary, so if you passed it a bogus index you might never	
 * 	find yourself again. If now looks at the global 'limit' to find the	
 * 	end of the dictionary and stop.
 *		
 *	Arguments:	LPTTS_HANDLE_T phTTS,
 *				long index,
 *				int *pLocaloff,
 *				struct dic_entry far **ppent
 *
 *	Return Value: int
 *
 *	Comments:
 *
 */
int ls_dict_dlook(LPTTS_HANDLE_T phTTS,long index,int *pLocaloff,struct dic_entry far **ppent)
{

	int	i;
	long limit;
	              
	PKSD_T pKsd_t;
	PLTS_T pLts_t;
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;
	limit = ((int)DICT_ENTRY) - 1;

	/* first, bail out if we've fallen off the end of the list.. 	*/
	if (index<0)
	{
		pLts_t->hit_type=MISS;
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_dlook:  limit. LOOK_HIGHER\n");
		}
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_dlook;  limit, LOOK_HIGHER \n");
#endif /*DICDEBUG*/
		return(LOOK_HIGHER);
	}
	if (index>limit)
	{
		pLts_t->hit_type=MISS;
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_dlook:  limit. LOOK_LOWER\n");
		}
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_dlook;  limit. LOOK_LOWER \n");
#endif /*DICDEBUG*/
		return(LOOK_LOWER);
	}
	
	*ppent = (struct dic_entry far *)DICT_HEAD[index];
	pLts_t->hit_type = HIT;                                                   
	
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_dlook:");
		for (i=0;(*ppent)->text[i];i++)
		printf("%c",(*ppent)->text[i]);
		printf("\n");
	}
#ifdef DICDEBUG
	printf("LSDIC.C; ls_dict_dlook;");
	for (i=0;(*ppent)->text[i];i++)
		printf("%c",(*ppent)->text[i]);
	printf("\n");
#endif /*DICDEBUG*/

	/* this loop is written to 'continue' on matching charaters	*/
	for(i=0;(*ppent)->text[i] != '\0';i++)
	{
		if(pLts_t->comp_str[i] == '\0')
		{
			if(pLts_t->abbrev_look && ((*ppent)->text[i] == '.') && ((*ppent)->text[i+1]) == '\0')
			{
				pLts_t->hit_type = ABBREV;
				break;
			}
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_dlook:  short string. LOOK_LOWER\n");
	}
#ifdef DICDEBUG
			printf("LSDIC.C; ls_dict_dlook;  short string, LOOK_LOWER\n");
#endif /*DICDEBUG*/
			pLts_t->hit_type = MISS;
                        /* Change 7/11/96 to fix the ms. miss probelm, GL.
			 * when entry is line up like
			 * ...
			 * ms-dos
			 * ms.
			 * ...
			 * And the input word is "ms."  The "." of input word will be
			 * replaced with 0 in comp_str[2].
		         * So if (*ppent)->text[] is "ms-dos" we need to check "-" against "."
			 * to decide the LOOK_LOWER or LOOK_UPPER. (need LOOK_UPPER here)
			 *
                         * Change 8/13/96, GL
			 * when entry is line up like
                         * ...
                         * on
                         * on-line
                         * ...
			 * And the input word is "on." 
		         * So if (*ppent)->text[] is "on-line" we need to check "-" against "."
			 * to decide the LOOK_LOWER or LOOK_UPPER.(need LOOK_LOWER here)
                         *
                         * I think this is a bug for current search routine. I will let pre-process take care of
                         * "ms." if possible
			 */
                          return(LOOK_LOWER);

		}
		if(pLts_t->comp_str[i] == (*ppent)->text[i])
		{
			continue;
		}

		if(IS_LOWER((*ppent)->text[i])  && (pLts_t->comp_str[i] == ls_upper[(*ppent)->text[i]]))
			continue;
		/* must be a miscompare.. */
		pLts_t->hit_type=MISS;
		/* don't even ask where to look if we're at the edge */
		if (index==0)
		{
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_dlook:  limit. LOOK_HIGHT\n");
		}
#ifdef DICDEBUG
			printf("LSDIC.C; ls_dict_dlook;  Limit, LOOK_HIGHER \n");
#endif /*DICDEBUG*/
			return(LOOK_HIGHER); /* bound.. */
		}
		if (index==limit)
		{
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_dlook:  limit. LOOK_LOWER\n");
		}
#ifdef DICDEBUG
			printf("LSDIC.C; ls_dict_dlook;  Limit. LOOK_LOWER \n");
#endif /*DICDEBUG*/			
			return(LOOK_LOWER); /* boune.. */
		}
		return(ls_dict_where_to_look(phTTS,*ppent));
	}
	
	/* 
	 * if we got here, we got to the end of the dictionary string	
	 * without bailing out on a miscompare. 		
	 * if this is also the end of the incoming string, it's a hit.	
	 */
	if(pLts_t->comp_str[i] == '\0')
	{             
		/* get past the period in an abbreviation.. */
		if(pLts_t->hit_type == ABBREV)
			i += 1;
		/* eab out 3/95 not imple for Spanish yet */
		/* GL 8/17/95, German don't do homograph at this point */
#ifdef ENGLISH
		/* check for homograph.. */
		if((*ppent)->fc & FC_HOMOGRAPH)
		{
			*ppent = ls_homo_homo(phTTS,index);
		}
#endif
		/* save the index of the end of the graphemes.. 	*/
		*pLocaloff=i;
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_find_word:  HIT\n");
		}
#ifdef DICDEBUG
		printf("*");
#endif /*DICDEBUG*/
		return(HIT);
	}
	/* was a match, but the incoming string was longer.. */
	pLts_t->hit_type = MISS;
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_dlook:  long string. LOOK_HIGHER\n");
	}
#ifdef DICDEBUG
	printf("LSDIC.C; ls_dict_dlook;  long string, LOOK_HIGHER \n");
#endif /*DICDEBUG*/
	return(LOOK_HIGHER);
}
/*
 *	Function Name:	
 *		ls_dict_where_to_look
 *
 *	Description:             
 *		this function decides whether the string is greater or less than 
 *		the current entry
 *
 *	Arguments:
 *		struct dic_entry far *ent	The string being searched for
 *
 *	Return Value:                                                
 *		LOOK_HIGHER		look for an entry greater than the current entry
 *		LOOK_LOWER		look for an entry less than the current entry
 *
 *	Comments:
 *
 */
int ls_dict_where_to_look(LPTTS_HANDLE_T phTTS,struct dic_entry far *pent)
{	
	int	i;
	unsigned char	pivot_char = '\0';
	PKSD_T pKsd_t;
	PLTS_T pLts_t;
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;
  	
	for(i=0;pLts_t->comp_str[i];i++)
	{
		pivot_char = ls_upper[pent->text[i]];
		if(ls_upper[pLts_t->comp_str[i]] != pivot_char)
			break;
	}	                           
	/* 
	 * ...tek 03oct95 I think this is broken; we have to check for 
	 * the case where the two appear to match, and if that happens 
	 * we must have matched but the dic was capitalized and the    
	 * incoming was lower. If that's the case, we have to go HIGHER
	 * because uppercase comes before lower in the dictionary.     
	 */

	if ( (pLts_t->comp_str[i]=='\0') && (pent->text[i]=='\0'))
	{
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_where_to_look:  w-t-l match. LOOK_HIGHER\n");
		}
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_where_to_look;  w-t-l match: LOOK_HIGHER \n");
#endif /*DICDEBUG*/
		return(LOOK_HIGHER);
	}
	if(ls_upper[pLts_t->comp_str[i]] > pivot_char)
	{
		/* debug switch */
		if (DT_DBG(LTS_DBG,0x010))
		{
			printf("ls_dict_where_to_look:  w-t-l. LOOK_HIGHER\n");
		}
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_where_to_look;  w-t-l: LOOK_HIGHER \n");
#endif /*DICDEBUG*/
		return(LOOK_HIGHER);
	}
	/* debug switch */
	if (DT_DBG(LTS_DBG,0x010))
	{
		printf("ls_dict_where_to_look:  w-t-l. LOOK_LOWER\n");
	}
#ifdef DICDEBUG
	printf("LSDIC.C; ls_dict_where_to_look;  w-t-l: LOOK_LOWER \n");
#endif /*DICDEBUG*/
	return(LOOK_LOWER);
}
				       
/*
 *	Function Name:
 *		ls_dict_ufind_word	
 *		
 *	Description:
 *		user dictionary binary search code          
 *		The 'thing' being searched for must always exist between
 * 		first and last. Each time a compare is done:
 * 		return HIT if its a match,
 * 		move first halfway down if the match is lower, or
 * 		move last halfway up if the match is higher.
 * 		If while competes before a match, return (MISS)
 *
 *	Arguments:
 *		phTTS
 *      abbr      0 - for non-abbr
 *                1 - for abbr
 *
 *	Return Value:
 *		HIT		The word was found in the user dictionary
 *		MISS	The word was not found in the user dictionary
 *		
 *	Comments:
 *
 */
#ifdef GERMAN
int ls_dict_ufind_word(LPTTS_HANDLE_T phTTS,short abbr,short nosend)
#else
int ls_dict_ufind_word(LPTTS_HANDLE_T phTTS,short abbr)
#endif
{
	/* Simpler bsearch code 19-JAN-1995 cjl adn */
 
	long first,base;
	long last;     
	int stat;

	PKSD_T pKsd_t;
	pKsd_t = phTTS->pKernelShareData;
	first = 0;							/* 0 is the bottom */
	if (abbr == 0)
	last  =	UDICT_ENTRY - 1;		 	/* max number of entries */
	else
	last  =	ADICT_ENTRY - 1;		 	/* max number of entries */

	while (first <= last)				/* search until list is empty */
	{
		base = (first + last) >> 1;				/* find the mid point for compare */
#ifdef GERMAN
		if ((stat = ls_dict_user_dict_look(phTTS,base,abbr,nosend)) == LOOK_LOWER)							/* match */
#else
		if ((stat = ls_dict_user_dict_look(phTTS,base,abbr)) == LOOK_LOWER)							/* match */
#endif
		{
#ifdef DICDEBUG
				printf("lower stat = %d\n",stat);
#endif
			last = base - 1;
		}
		else                                    	/*search lower */
		{			
			if (stat == LOOK_HIGHER)			 	/* search higher */
			{
#ifdef DICDEBUG
					printf("higher stat = %d\n",stat);
#endif
				first = base + 1;
			}
			else											
			{
#ifdef DICDEBUG
					printf("hit stat = %d\n",stat);
#endif
				return(HIT);
			}
		}    
	}
	return (MISS);
}

/* end of 19-JAN-1995 code */
/*
 *	Function Name:	
 *		ls_dict_user_dict_look
 *
 *	Description:
 *		do a somewhat case sensitive compare for the word          
 *		uppercase characters in dictionary entries only match uppercase    
 *		lowercase characters in entries match either case
 *		
 *
 *	Arguments:
 *		int uindex	The index in the user dictionary
 *
 *	Return Value:                                   
 *		HIT 		The word was found
 *		LOOK_LOWER  Look at a lower index
 *		LOOK_HIGHER	Look at a higher index
 *
 *	Comments:
 *
 */
#ifdef GERMAN
int ls_dict_user_dict_look(LPTTS_HANDLE_T phTTS,long uindex,short abbr,short nosend)
#else
int ls_dict_user_dict_look(LPTTS_HANDLE_T phTTS,long uindex,short abbr)
#endif
{
    char _far *ent;
    int     i; 
	PKSD_T pKsd_t;
	PLTS_T pLts_t;
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;


        /* add for WIN95.  6/03/96.  by MGS */
#ifdef MSDOS
		if (abbr == 0)
        	ent = UDICT_HEAD[uindex];
        else
        	ent = ADICT_HEAD[uindex];
#else
		if (abbr == 0)
        	ent = UDICT_HEAD[uindex]->text;
		else
        	ent = ADICT_HEAD[uindex]->text;
#endif
	/*	pLts_t->hit_type=HIT; */
#ifdef DICDEBUG
		printf("LSDIC.C; ls_dict_user_dict_look;  %d in lk\n",uindex);
#endif

	for(i=0;ent[i] != '\0';i++)
	{
		if(pLts_t->comp_str[i] == ent[i])
			continue;
		if(pLts_t->comp_str[i] == '\0')
		{   
#ifdef DICDEBUG
				printf("leaving ls_dict_user_dict_look lower 1\n");
#endif
			return(LOOK_LOWER);
		}
		if(IS_LOWER(ent[i])  && (pLts_t->comp_str[i] == ls_upper[ent[i]]))
			continue;                       
#ifdef DICDEBUG
		printf("leaving ls_dict_user_dict_look  where to look\n");
#endif
		return(ls_dict_where_to_ulook(pLts_t,ent));
	}
	if(pLts_t->comp_str[i] == '\0')
	{
#ifdef GERMAN
		for(i += 1;ent[i+nosend] != 0x00;i++)
#else
		for(i += 1;ent[i] != 0x00;i++)
#endif
			/* Use the correct ls_util_send_phone routine based on language being compiled */
			ls_util_send_phone(phTTS,ent[i]);
#ifdef DICDEBUG
		printf("leaving ls_dict_user_dict_look hit\n");
#endif /*DICDEBUG*/
		return(HIT);
	}
#ifdef DICDEBUG
	printf("leaving ls_dict_user_dict_look higher\n");
#endif
	return(LOOK_HIGHER);
}
/*
 *	Function Name:	
 *		ls_dict_where_to_ulook
 *
 *	Description:              
 *		This function decides to the string is greater or less than
 *  	the current entry
 *
 *	Arguments:
 *		char far *ent	The string begin searched for
 *
 *	Return Value:                                
 *		LOOK_LOWER 		Look at a lower index
 *		LOOK_HIGHER		Look at a higher index
 *
 *	Comments:
 *
 */
int ls_dict_where_to_ulook(PLTS_T pLts_t,char far *ent)
{	

	int	i;
	unsigned char	pivot_char = '\0';
#ifdef DICDEBUG
	printf("in ls_dict_where_to_ulook\n");
#endif
	for(i=0;pLts_t->comp_str[i];i++)
	{
		pivot_char = ls_upper[ent[i]];
		if(ls_upper[pLts_t->comp_str[i]] != pivot_char)
			break;
	}
	if(ls_upper[pLts_t->comp_str[i]] > pivot_char)
	{
#ifdef DICDEBUG
		printf("leaving ls_dict_where_to_ulook higher\n");
#endif
		return(LOOK_HIGHER);                         
	}
#ifdef DICDEBUG
		printf("leaving ls_dict_where_to_ulook lower\n");
#endif
	return(LOOK_LOWER);
}


/* All of the lexical functions I wrote won't be compiled for MSDOS.  The reason for this is
   because the functions are only used for the API, which isn't supported under MSDOS.
   JAW 7/7/98 */
#ifndef MSDOS
/*********************************************************************************************/
/*  Function: DictionaryHit                                                                  */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This function is passed a dictionary entry.  If the grapheme the            */
/*               dictionary entry contains is in the dictionary, it returns the entry's      */
/*               index.  If it's not in the dictionary, it returns -1.                       */
/*                                                                                           */
/*               Something interesting I noticed with ls_dict_where_to_look is that it       */
/*               appears to return LOOK_HIGHER when the entry it's comparing is equal to     */
/*               the compare string.                                                         */
/*********************************************************************************************/
long DictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	PKSD_T pKsd_t;
	PLTS_T pLts_t;
	long first, last, mid;
	int temp;


	pKsd_t = phTTS->pKernelShareData;

	if (DICT_ENTRY == 0)
		return -1;

	pLts_t = phTTS->pLTSThreadData;
	first = 0;
	last = DICT_ENTRY - 1;
	mid = last >> 1;

	if (strcmp(entry->text, DICT_HEAD[first]->text) == 0)
		return first; /* a form of the word is in the dictionary */

	if (strcmp(entry->text, DICT_HEAD[last]->text) == 0)
		return last; /* a form of the word is in the dictionary */

	/* first we check to see if the entry is not within the range of the current entries */
	strcpy(pLts_t->comp_str, DICT_HEAD[first]->text);
	if (ls_dict_where_to_look(phTTS, entry) == LOOK_HIGHER)
		return -1;

	strcpy(pLts_t->comp_str, DICT_HEAD[last]->text);
	if (ls_dict_where_to_look(phTTS, entry) == LOOK_LOWER)
		return -1;

	/* do a binary search */

	while ((last - first) >> 1 != 0)
	{
		strcpy(pLts_t->comp_str, DICT_HEAD[mid]->text);
		temp = ls_dict_where_to_look(phTTS, entry);
		if (strcmp(entry->text, pLts_t->comp_str) == 0)
			return mid; /* a form of the word is in the dictionary */
		if (temp == LOOK_LOWER)
			first = mid;
		else if (temp == LOOK_HIGHER)
			last = mid;

		mid = first + ((last - first) >> 1);
	}
			
	/* At this point, first and last are two consecutive indexes, with the entry at first being
	   less than the entry we're looking for and the entry at last being greater than the entry
	   we're looking for. */

	return -1;
}


/*********************************************************************************************/
/*  Function: DumpDictionary                                                                 */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This function dumps the main dictionary to the file name that's passed to   */
/*               it.  It dumps the contents of the dictionary in the following format:       */
/*					grapheme, arpabet phoneme, ascky phoneme, form class                     */
/*********************************************************************************************/
MMRESULT DumpDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	FILE *outfile;
	PKSD_T pKsd_t;
	unsigned char *phoneme_ptr;
	unsigned char arpabet_ph[253], ascky_ph[127];
	long fc_mask;
	extern unsigned char *form_class_strings[];
	int lcv, lcv2; /* loop-control variables */


	if ((outfile = fopen(filename, "w")) == NULL)
		return MMSYSERR_ERROR;

	pKsd_t = phTTS->pKernelShareData;

	fprintf(outfile, "Total dictionary entries: %d\n\n", DICT_ENTRY);
	for (lcv = 0; lcv < DICT_ENTRY; lcv++)
	{
		for (phoneme_ptr = DICT_HEAD[lcv]->text + (strlen(DICT_HEAD[lcv]->text) + 1), lcv2 = 0;
			 *phoneme_ptr != '\0'; phoneme_ptr++, lcv2++)
		{
			arpabet_ph[lcv2 * 2]     = pKsd_t->arpabet[(*phoneme_ptr) * 2];
			arpabet_ph[lcv2 * 2 + 1] = pKsd_t->arpabet[(*phoneme_ptr) * 2 + 1];
			ascky_ph[lcv2]           = pKsd_t->ascky[*phoneme_ptr];
		}
		arpabet_ph[lcv2 * 2] = ascky_ph[lcv2] = '\0';
		fprintf(outfile, "%s, %s, %s,", DICT_HEAD[lcv]->text, arpabet_ph, ascky_ph);
		if (DICT_HEAD[lcv]->fc)
		{
			fc_mask = 1;
			for (lcv2 = 0; lcv2 < 32; lcv2++)
			{
				if (DICT_HEAD[lcv]->fc & fc_mask)
					fprintf(outfile, "%s", form_class_strings[lcv2]);
				fc_mask *= 2;
			}
		}
		else
			fprintf(outfile, " none");
		fprintf(outfile, "\n");
	}

	fclose(outfile);
	return MMSYSERR_NOERROR;
}


/*********************************************************************************************/
/*  Function: UserDictionaryHit                                                              */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This function is passed a dictionary entry.  If the grapheme the            */
/*               dictionary entry contains is in the dictionary, it returns the entry's      */
/*               index.  If it's not in the dictionary, it returns -1.                       */
/*                                                                                           */
/*               Something interesting I noticed with ls_dict_where_to_ulook is that it      */
/*               appears to return LOOK_LOWER when the entry it's comparing is equal to      */
/*               the compare string.                                                         */
/*********************************************************************************************/
long UserDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	PKSD_T pKsd_t;
	PLTS_T pLts_t;
	long first, last, mid;
	int temp;


	pKsd_t = phTTS->pKernelShareData;

	if (UDICT_ENTRY == 0)
		return -1;

	pLts_t = phTTS->pLTSThreadData;
	first = 0;
	last = UDICT_ENTRY - 1;
	mid = last >> 1;

	if (strcmp(entry->text, UDICT_HEAD[first]->text) == 0)
		return first; /* a form of the word is in the dictionary */

	if (strcmp(entry->text, UDICT_HEAD[last]->text) == 0)
		return last; /* a form of the word is in the dictionary */

	/* first we check to see if the entry is not within the range of the current entries */
	strcpy(pLts_t->comp_str, UDICT_HEAD[first]->text);
	if (ls_dict_where_to_ulook(pLts_t, entry->text) == LOOK_HIGHER)
		return -1;

	strcpy(pLts_t->comp_str, UDICT_HEAD[last]->text);
	if (ls_dict_where_to_ulook(pLts_t, entry->text) == LOOK_LOWER)
		return -1;

	/* do a binary search */

	while ((last - first) >> 1 != 0)
	{
		strcpy(pLts_t->comp_str, UDICT_HEAD[mid]->text);
		temp = ls_dict_where_to_ulook(pLts_t, entry->text);
		if (strcmp(entry->text, pLts_t->comp_str) == 0)
			return mid; /* a form of the word is in the dictionary */
		if (temp == LOOK_LOWER)
			first = mid;
		else if (temp == LOOK_HIGHER)
			last = mid;

		mid = first + ((last - first) >> 1);
	}
			
	/* At this point, first and last are two consecutive indexes, with the entry at first being
	   less than the entry we're looking for and the entry at last being greater than the entry
	   we're looking for. */

	return -1;
}


/*********************************************************************************************/
/*  Function: DumpUserDictionary                                                             */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This function dumps the user dictionary to the file name that's passed to   */
/*               it.  It dumps the contents of the dictionary in the following format:       */
/*					grapheme, arpabet phoneme, ascky phoneme                                 */
/*********************************************************************************************/
MMRESULT DumpUserDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	FILE *outfile;
	PKSD_T pKsd_t;
	unsigned char *phoneme_ptr;
	unsigned char arpabet_ph[253], ascky_ph[127];
	int lcv, lcv2; /* loop-control variables */


	if ((outfile = fopen(filename, "w")) == NULL)
		return MMSYSERR_ERROR;

	pKsd_t = phTTS->pKernelShareData;

	fprintf(outfile, "Total user dictionary entries: %d\n\n", UDICT_ENTRY);
	for (lcv = 0; lcv < UDICT_ENTRY; lcv++)
	{
		for (phoneme_ptr = UDICT_HEAD[lcv]->text + (strlen(UDICT_HEAD[lcv]->text) + 1), 
			 lcv2 = 0; *phoneme_ptr != '\0'; phoneme_ptr++, lcv2++)
		{
			arpabet_ph[lcv2 * 2]     = pKsd_t->arpabet[(*phoneme_ptr) * 2];
			arpabet_ph[lcv2 * 2 + 1] = pKsd_t->arpabet[(*phoneme_ptr) * 2 + 1];
			ascky_ph[lcv2]           = pKsd_t->ascky[*phoneme_ptr];
		}
		arpabet_ph[lcv2 * 2] = ascky_ph[lcv2] = '\0';
		fprintf(outfile, "%s, %s, %s\n", UDICT_HEAD[lcv]->text, arpabet_ph, ascky_ph);
	}

	fclose(outfile);
	return MMSYSERR_NOERROR;
}


/*********************************************************************************************/
/*  Function: UserDictionaryHead                                                             */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This is a helper function for AddUserDictionaryEntry and                    */
/*               DeleteUserDictionaryEntry.  It is used to return a pointer to the real      */
/*               dictionary head (including the 4 bytes at the beginning that store the      */
/*               dictionary size in bytes).                                                  */
/*********************************************************************************************/
void *UserDictionaryHead(PKSD_T pKsd_t)
{
	return (void *) ((long) UDICT_HEAD - 4);
}


/*********************************************************************************************/
/*  Function: GetUserEntrySize                                                               */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This is a helper function for AddUserDictionaryEntry and                    */
/*               DeleteUserDictionaryEntry.  It returns the size of an entry.                */
/*********************************************************************************************/
int GetUserEntrySize(struct dic_entry *entry)
{
	unsigned char *phoneme_ptr;
	int entry_size;


	phoneme_ptr = entry->text + (strlen(entry->text) + 1);

	/* add the lengths of the grapheme and phoneme strings (including the null characters) */
	entry_size = strlen(entry->text) + strlen(phoneme_ptr) + 2;

	return entry_size;
}


/*********************************************************************************************/
/*  Function: AddUserEntry                                                                   */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This function adds the entry passed to it to the dictionary, as long as     */
/*               there's not already an entry in the dictionary with the same grapheme.      */
/*                                                                                           */
/*               Something interesting I noticed with ls_dict_where_to_ulook is that it      */
/*               appears to return LOOK_LOWER when the entry it's comparing is equal to      */
/*               the compare string.                                                         */
/*                                                                                           */
/*               Note: &UDICT_HEAD[UDICT_ENTRY] is not the address of an actual pointer.     */
/*               It is the address of the beginning of the entries immediately following     */
/*               the pointer list.                                                           */
/*********************************************************************************************/
MMRESULT AddUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	PKSD_T pKsd_t;
	PLTS_T pLts_t;
	long first, last, mid, index; /* index is where the new entry belongs */
	int temp;
	long dict_bytes, new_size, end_addr, bytes_to_scoot;
	int entry_size;
	void *old_addr;
	long modifier; /* for shifting entry addresses after the dictionary has been reallocated */
	int lcv; /* loop-control variable */


	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;
	first = 0;
	last = UDICT_ENTRY - 1;
	mid = last >> 1;

	if (UDICT_HEAD == NULL)
	{
		/* The user dictionary does not exist, so we must create it. */
		entry_size = GetUserEntrySize(entry);
		dict_bytes = 8 + entry_size; /* 4 bytes for dict_bytes, 4 bytes for the pointer */
#if (defined WIN32) && (!defined UNDER_CE)
		if (!(UDICT_HEAD = (void *) mallocLock(dict_bytes)))
#else
		if (!(UDICT_HEAD = (void *) malloc(dict_bytes)))
#endif
			return MMSYSERR_NOMEM;
		UDICT_HEAD = (void *) ((long) UDICT_HEAD + 4);

		*((long *) UserDictionaryHead(pKsd_t)) = dict_bytes;
		UDICT_HEAD[0] = (struct dic_entry *) UDICT_HEAD;
		memmove((void *) ((long) UDICT_HEAD + sizeof(void *)), entry->text, entry_size);
		UDICT_ENTRY++;
#if LTS_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp, "Allocated user dictionary; UDICT_HEAD:%08lx\n",
				UDICT_HEAD);
			OutputDebugString(szTemp);
		}
#endif //LTS_DEBUG

		return MMSYSERR_NOERROR;	
	}

	if (strcmp(entry->text, UDICT_HEAD[first]->text) == 0)
		return MMSYSERR_ERROR; /* a form of the word is already in the dictionary */

	if (strcmp(entry->text, UDICT_HEAD[last]->text) == 0)
		return MMSYSERR_ERROR; /* a form of the word is already in the dictionary */

	/* first we check to see if the new entry is not within the range of the current entries */
	strcpy(pLts_t->comp_str, UDICT_HEAD[first]->text);
	if (ls_dict_where_to_ulook(pLts_t, entry->text) == LOOK_HIGHER)
		index = 0;
	else
	{
		strcpy(pLts_t->comp_str, UDICT_HEAD[last]->text);
		if (ls_dict_where_to_ulook(pLts_t, entry->text) == LOOK_LOWER)
			index = last + 1;
		else /* do a binary search to figure out where the new entry belongs */
		{
			while ((last - first) >> 1 != 0)
			{
				strcpy(pLts_t->comp_str, UDICT_HEAD[mid]->text);
				temp = ls_dict_where_to_ulook(pLts_t, entry->text);
				if (strcmp(entry->text, pLts_t->comp_str) == 0)
					return MMSYSERR_ERROR; /* a form of the word is already in the dictionary
										      */
				if (temp == LOOK_LOWER)
					first = mid;
				else if (temp == LOOK_HIGHER)
					last = mid;

				mid = first + ((last - first) >> 1);
			}
			
			/* At this point, first and last are two consecutive indexes, with the entry at
			   first being less than the new entry and the entry at last being greater than the
			   new entry.  We assign the index for the new entry to be mid + 1. */
			index = mid + 1;
		}
	}

	/* figure out the new size of the dictionary */
	dict_bytes = *((long *) UserDictionaryHead(pKsd_t));
	entry_size = GetUserEntrySize(entry);
	new_size = dict_bytes + sizeof(void *) + entry_size;

	/* reallocate the dictionary */

	old_addr = UserDictionaryHead(pKsd_t);

	UDICT_HEAD = UserDictionaryHead(pKsd_t);

#if defined (WIN32) && !defined (UNDER_CE)
	//tek 18jun98 this is inconsistent; use reallocLock.
	if ((UDICT_HEAD = reallocLock(UDICT_HEAD, new_size)) == NULL)
	{
		UDICT_HEAD = (void *) ((long) UDICT_HEAD + 4);
		return MMSYSERR_NOMEM;
	}
#else
	if ((UDICT_HEAD = realloc(UDICT_HEAD, new_size)) == NULL)
	{
		UDICT_HEAD = (void *) ((long) UDICT_HEAD + 4);
		return MMSYSERR_NOMEM;
	}
#endif

	UDICT_HEAD = (void *) ((long) UDICT_HEAD + 4);

#if LTS_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp, "Reallocated user dictionary; UDICT_HEAD:%08lx\n",
				UDICT_HEAD);
			OutputDebugString(szTemp);
		}
#endif //LTS_DEBUG

	if (UserDictionaryHead(pKsd_t) == old_addr)
		modifier = 0;
	else /* had to move it */
		modifier = (long) UserDictionaryHead(pKsd_t) - (long) old_addr;

	/* get the address of the last byte of the dictionary */
	end_addr = ((long) UserDictionaryHead(pKsd_t) + dict_bytes) - 1;

	/* put entry at end of dictionary */
	memmove((void *) (end_addr + 1 + sizeof(void *)), entry->text, entry_size);

	bytes_to_scoot = (end_addr - (long) &UDICT_HEAD[index]) + 1;
	memmove((void *) ((long) &UDICT_HEAD[index] + sizeof(void *)), &UDICT_HEAD[index],
			bytes_to_scoot);

	/* fix up pointers */
	UDICT_ENTRY++;

	for (lcv = 0; lcv < index; lcv++)
		UDICT_HEAD[lcv] = (struct dic_entry *) ((long) UDICT_HEAD[lcv] + modifier + 
						  sizeof(void *));
	UDICT_HEAD[index] = (struct dic_entry *) (end_addr + 1); /* the way the user dictionary
															    works is to point 4 bytes
																before the actual entry */
	for (lcv = index + 1; lcv < UDICT_ENTRY; lcv++)
		UDICT_HEAD[lcv] = (struct dic_entry *) ((long) UDICT_HEAD[lcv] + modifier +
						  sizeof(void *));

	*((long *) UserDictionaryHead(pKsd_t)) = new_size;

	return MMSYSERR_NOERROR;
}


/*********************************************************************************************/
/*  Function: DeleteUserEntry                                                                */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This function searches for an entry in the dictionary with a grapheme       */
/*               matching the one in entry.  If it successfully finds such an entry, it will */
/*               remove it from the dictionary.                                              */
/*                                                                                           */
/*               Note: &UDICT_HEAD[UDICT_ENTRY] is not the address of an actual pointer.     */
/*               It is the address of the beginning of the entries immediately following     */
/*               the pointer list.                                                           */
/*********************************************************************************************/
MMRESULT DeleteUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	PKSD_T pKsd_t;
	int index;
	long dict_bytes, new_size, end_addr, deleted_entry_addr, bytes_to_scoot;
	int entry_size;
	void *old_addr;
	long modifier; /* for shifting entry addresses after the dictionary has been reallocated */
	int lcv; /* loop-control variable */


	pKsd_t = phTTS->pKernelShareData;

	index = UserDictionaryHit(phTTS, entry);
	if (index == -1)
		return MMSYSERR_ERROR;

	/* figure out the new size of the dictionary */
	dict_bytes = *((long *) UserDictionaryHead(pKsd_t));
	entry_size = GetUserEntrySize(UDICT_HEAD[index]);
	new_size = dict_bytes - sizeof(void *) - entry_size;
	
	if (new_size == 4) /* We're deleting the only entry in the user dictionary, so we free the
					      memory block it's occupying and return. */
	{
		UDICT_HEAD = UserDictionaryHead(pKsd_t);

#if LTS_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp, "Freeing user dictionary; UDICT_HEAD:%08lx\n",
				UDICT_HEAD);
			OutputDebugString(szTemp);
		}
#endif //LTS_DEBUG

#if (defined WIN32) && (!defined UNDER_CE)
		freeLock(UDICT_HEAD);
#else
		free(UDICT_HEAD);
#endif
		UDICT_HEAD = (void *) NULL;
		UDICT_ENTRY = 0;
		return MMSYSERR_NOERROR;
	}

	/* get the address of the last byte of the dictionary */
	end_addr = ((long) UserDictionaryHead(pKsd_t) + dict_bytes) - 1;

	/* remove entry from dictionary */

	deleted_entry_addr = (long) UDICT_HEAD[index];

	bytes_to_scoot = (end_addr - ((long) &UDICT_HEAD[index]->text + entry_size)) + 1;
	memmove((void *) &UDICT_HEAD[index]->text, (void *) ((long) &UDICT_HEAD[index]->text +
			entry_size), bytes_to_scoot);

	bytes_to_scoot = ((end_addr - entry_size) - (long) &UDICT_HEAD[index + 1]) + 1;
	memmove((void *) &UDICT_HEAD[index], (void *) &UDICT_HEAD[index + 1], bytes_to_scoot);

	/* reallocate the dictionary */

	old_addr = UserDictionaryHead(pKsd_t);

	UDICT_HEAD = UserDictionaryHead(pKsd_t);

#if defined (WIN32) && !defined (UNDER_CE)
	// tek 18jun98 must be reallocLock..
	UDICT_HEAD = reallocLock(UDICT_HEAD, new_size);
#else
	UDICT_HEAD = realloc(UDICT_HEAD, new_size);
#endif

	UDICT_HEAD = (void *) ((long) UDICT_HEAD + 4);

#if LTS_DEBUG
		{
			char szTemp[256];
			sprintf(szTemp, "Reallocated user dictionary; UDICT_HEAD:%08lx\n",
				UDICT_HEAD);
			OutputDebugString(szTemp);
		}
#endif //LTS_DEBUG

	if (UserDictionaryHead(pKsd_t) == old_addr)
		modifier = 0;
	else /* had to move it */
		modifier = (long) UserDictionaryHead(pKsd_t) - (long) old_addr;

	/* fix up pointers */
	UDICT_ENTRY--;

	for (lcv = 0; lcv < UDICT_ENTRY; lcv++)
		if ((long) UDICT_HEAD[lcv] < deleted_entry_addr)
			UDICT_HEAD[lcv] = (struct dic_entry *) ((long) UDICT_HEAD[lcv] + modifier -
							  sizeof(void *));
		else
			UDICT_HEAD[lcv] = (struct dic_entry *) ((long) UDICT_HEAD[lcv] + modifier - 
							  sizeof(void *) - entry_size);

	*((long *) UserDictionaryHead(pKsd_t)) = new_size;

	return MMSYSERR_NOERROR;
}


/*********************************************************************************************/
/*  Function: ChangeUserPhoneme                                                              */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : July 7, 1998                                                                   */
/*                                                                                           */
/*  Description: This function searches for an entry in the dictionary with a grapheme       */
/*               matching the one in entry.  If it successfully finds such an entry, it will */
/*               replace its phoneme with new_phoneme.                                       */
/*********************************************************************************************/
MMRESULT ChangeUserPhoneme(LPTTS_HANDLE_T phTTS, struct dic_entry *entry, 
						   unsigned char *new_phoneme)
{
	PKSD_T pKsd_t;
	int index;
	unsigned char *phoneme_ptr;
	int i;
	

	pKsd_t = phTTS->pKernelShareData;

	index = UserDictionaryHit(phTTS, entry);
	if (index == -1)
		return MMSYSERR_ERROR;
	
	entry->fc = UDICT_HEAD[index]->fc;
	DeleteUserEntry(phTTS, entry);
	phoneme_ptr = entry->text + (strlen(entry->text) + 1);
	strcpy(phoneme_ptr, new_phoneme);
	i = AddUserEntry(phTTS, entry);
	if (i == MMSYSERR_NOMEM)
		return MMSYSERR_NOMEM;
	/* If there's an error adding the entry with the new phoneme to the dictionary, the entry
	   with the original phoneme will still be deleted. */

	return MMSYSERR_NOERROR;
}

/*********************************************************************************************/
/*  Function: GetNumUserEntries                                                              */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : August 7, 1998                                                                 */
/*                                                                                           */
/*  Description: This function returns the number of entries in the user dictionary.  It is  */
/*               called by TextToSpeechReserved3 in ttsapi.c.                                */
/*********************************************************************************************/
long GetNumUserEntries(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	return UDICT_ENTRY;
}

/*********************************************************************************************/
/*  Function: GetUserEntry                                                                   */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : August 7, 1998                                                                 */
/*                                                                                           */
/*  Description: This function puts the grapheme/phoneme string for the user dictionary      */
/*               entry at index in data.  It also returns the starting index of the          */
/*               phoneme.                                                                    */
/*********************************************************************************************/
int GetUserEntry(LPTTS_HANDLE_T phTTS, char *gr_ph, int index)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	unsigned char *phoneme_ptr;
	unsigned char arpabet_ph[252];
	int lcv; /* loop-control variable */

	strcpy(gr_ph, UDICT_HEAD[index]->text); /* copy the grapheme */

	for (phoneme_ptr = UDICT_HEAD[index]->text + (strlen(UDICT_HEAD[index]->text) + 1),
		 lcv = 0; *phoneme_ptr != '\0'; phoneme_ptr++, lcv++)
	{
		arpabet_ph[lcv * 2]     = pKsd_t->arpabet[(*phoneme_ptr) * 2];
		arpabet_ph[lcv * 2 + 1] = pKsd_t->arpabet[(*phoneme_ptr) * 2 + 1];
	}
	arpabet_ph[lcv * 2] = '\0';

	phoneme_ptr = gr_ph + (strlen(gr_ph) + 1);
	strcpy(phoneme_ptr, arpabet_ph); /* copy the phoneme */
	
	return strlen(gr_ph) + 1; /* returns the starting index of the phoneme */
}

/*********************************************************************************************/
/*  Function: SaveUserDictionary                                                             */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : August 7, 1998                                                                 */
/*                                                                                           */
/*  Description: This function saves the user dictionary to the file name that's passed to   */
/*               it.                                                                         */
/*                                                                                           */
/*               Note: &UDICT_HEAD[UDICT_ENTRY] is not the address of an actual pointer.     */
/*               It is the address of the beginning of the entries immediately following     */
/*               the pointer list.                                                           */
/*********************************************************************************************/
MMRESULT SaveUserDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	FILE *outfile;
	PKSD_T pKsd_t;
	long pointer_list_size, bytes, offset;
	long lcv; /* loop-control variable */


	pKsd_t = phTTS->pKernelShareData;

	if (UDICT_HEAD == NULL) /* no user dictionary to save */
		return MMSYSERR_ERROR;

	if ((outfile = fopen(filename, "wb")) == NULL)
		return MMSYSERR_ERROR;

	/* output number of entries */
	fwrite(&UDICT_ENTRY, 4, 1, outfile);

	pointer_list_size = sizeof(void *) * UDICT_ENTRY;
	bytes = (*((long *) UserDictionaryHead(pKsd_t)) - 4) - pointer_list_size;

	/* output number of bytes */
	fwrite(&bytes, 4, 1, outfile);

	/* output the offsets */
	for (lcv = 0; lcv < UDICT_ENTRY; lcv++)
	{
		offset = ((long) (UDICT_HEAD[lcv]->text) - 4 - (long) &UDICT_HEAD[UDICT_ENTRY]);
		fwrite(&offset, 4, 1, outfile);
	}

	/* output all of the entries */
	fwrite(&UDICT_HEAD[UDICT_ENTRY], bytes, 1, outfile);

	fclose(outfile);
	return MMSYSERR_NOERROR;
}
#endif /* #ifndef MSDOS */

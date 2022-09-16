/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	lsdic.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *					***WARNING*** changing this file impacts slsdic.c.
 *					***WARNING*** changing this file impacts glsdic.c.
 *
 ***********************************************************************
 *    Revision History:
 * 15sep95  ...tek		fix the search routines.
 * 20sep95  ...cjl		also included as slsdic.c w/ SPANISH_DIC defined.
 * 20sep95  ...gl       	change for German.
 * 21sep95  ...cjl      	also included as glsdic.c w/GERMAN_DIC defined
 * 04oct95  ...cjl		Add German & generic DICDEBUG PRINTF changes.
 * 23oct95  ...cjl		Correct bugs in DICDEBUG printf statements.
 * 28Jan96  ...gl		allow Spanish to search "i" and "a" from dictionary.
 * 02Feb96  ...gl		Add codes to support Spanish and German user dictionary.
 * 12Apr96  ...gl		Add codes to support French dictionary search
 * 29Apr96	...gl		Allow "I" to go for dictionary search.  Need this formclass
 *						information from dictionary.
 */


#ifdef FRENCH_DIC
/* Use for French */
#include "flsdef.h"
#include "dict.h"
#include "lschar.h"


//extern unsigned char ls_lower[];
extern unsigned char ls_upper[];
extern unsigned char ls_char_feat[];

#define	DICT_HEAD	((struct dic_entry far * huge *)KS.frdic)
#define	UDICT_HEAD	((char far * far *)KS.ufdic)
#define	DICT_ENTRY	KS.frdic_entries
#define	UDICT_ENTRY	KS.ufdic_entries

#else

#ifdef GERMAN_DIC
/* Use for German */
#include "lsdef.h"
#include "glsconst.h"
#define	DICT_HEAD	((struct dic_entry far * huge *)KS.gdic)
#define	UDICT_HEAD	((char far * far *)KS.ugdic)
#define	DICT_ENTRY	KS.gdic_entries
#define	UDICT_ENTRY	KS.ugdic_entries

#else

#ifdef SPANISH_DIC
/* Use for Spanish */
#include "slsdef.h"
#include "slsconst.h"
#define	DICT_HEAD	((struct dic_entry far * far *)KS.sdic)
#define	UDICT_HEAD	((char far * far *)KS.usdic)
#define	DICT_ENTRY	KS.sdic_entries
#define	UDICT_ENTRY	KS.usdic_entries

#else
/* Use for English, the default */
#include "lsdef.h"
#include "lsconst.h"
#define	DICT_HEAD	((struct dic_entry far * far *)KS.fdic)
#define	UDICT_HEAD	((char far * far *)KS.udic)
#define	DICT_ENTRY	KS.fdic_entries
#define	UDICT_ENTRY	KS.udic_entries

extern const unsigned char main_dict[];

#endif
#endif
#endif




#define	VPHRASE		(FC_VERB|FC_CHARACTER)
#define	PPHRASE		(FC_PREP|FC_CHARACTER)

/*
 *  find a word in the dictionary ...
 */

//#define LSDICDEBUG 1; /* DEFINE FOR DEBUG*/
#define	DE		(*ent)
extern P_PIPE	kinp;

/*
 * dictionary private lookup areas ...
 */

#ifdef LOW_MEMORY
unsigned char comp_str[32];
#else
unsigned char comp_str[128];
#endif
unsigned char	*str_vowel;
unsigned char dic_last_feat;
unsigned int abbrev_look;
int type_flag;
unsigned int no_pars;
unsigned int hit_type;
struct dic_entry far *ent;


extern unsigned long fc_struct[];
extern int fc_index;


int localoff;
                 
int limit;	/* the end of the dictionary, to bound searches */
	                 
/*#define	CS 	comp_str*/

#define	LOOK_HIGHER		0xffff
#define	LOOK_LOWER		0xfffe

blook(llp,rlp,type)
LETTER *llp;
LETTER *rlp;
int	type;
{
	int	i; /* j not used ...tek 9/18/95 */
#ifndef CALLER_ID /*mfgdebug*/
	unsigned char  __far *str_end;
#endif
/*
 *  if this is a single character lookup, do it quickly since we usually have
 *  a lot of them to do ...
 */

	abbrev_look = no_pars = false;
	str_vowel = 0;
	if((type == SINGLE_CHAR) || (KS.sayflag == SAY_LETTER))
		{
		comp_str[0] = (unsigned char)((*llp).l_ch);
		comp_str[1] = 0;
		no_pars = true;
		if((UDICT_ENTRY != 0) && (ufind_word() == HIT))
			{
			return(hit_type);
			}
/* Use the correct KS entry based on language being compiled */
		if(DICT_ENTRY != 0)
			find_word();
		else
			return(MISS);
		return(hit_type);
		}

/*
 *  standard lookup ... set up the parameters ...
 */

	if(type == FABBREV)
		{
		abbrev_look = true;
		}
	else if(type == SNOPARS)
		no_pars = true;
	/* 4/94 eab if suffix stripper has eaten the whole word abandon ship*/

	if(llp == rlp)
		{
#ifdef LSDICDEBUG
		printf("LSDIC.C; blook; quit lptr=rptr\n");
#endif
		return(MISS);
		}
	for(i=0;llp < rlp;i++)
		{
		comp_str[i] = (unsigned char)((*llp++).l_ch);
		if(str_vowel == 0)
			{
			if(IS_VOWEL(comp_str[i]))
				str_vowel = &comp_str[i];
			}
		}

	comp_str[i] = 0;
#ifndef CALLER_ID /*mfgdebug*/
	str_end = &comp_str[i-1];
#endif
/*
 *  try the abbrev and user dictionary first if they are loaded ...
 */
#ifdef LSDICDEBUG
	printf("LSDIC.C; blook; checking userdictionary \n");
#endif

	if((UDICT_ENTRY != 0) && (ufind_word() == HIT))
		{
#ifdef LSDICDEBUG
	printf("LSDIC.C; blook; userdictionary hit \n");
#endif

#ifdef DICDEBUG
		printf("*");
#endif /*DICDEBUG*/
		return(HIT);
		}


/*
 *  make sure a primary dictionary is loaded ...
 */

#ifdef LSDICDEBUG
	printf("LSDIC.C; blook; checking big dictionary \n");
#endif

/* Use the correct KS entry based on language being compiled */
	if(DICT_ENTRY == 0)
		{
		return(MISS);
		}

/*
 *  don't let 'a', 'A' through  ...
 */
/* GL 8/17/95, not true for German and Spanish */
#ifndef FRENCH_DIC
#ifndef GERMAN_DIC
#ifndef SPANISH_DIC
	if(i == 1 && (ls_lower[comp_str[0]] == 'a'))
/*       Must be |gls_lower| when we do German later */
		return(MISS);
#endif
#endif
#endif

#ifdef LSDICDEBUG
	printf("LSDIC.C; blook; going into find word.  \n");
#endif

	if(find_word() == MISS)
		{
#ifndef CALLER_ID /*mfgdebug*/ // NO suffixes for DSPG

/* Spanish has no suffixes as of 9/20/95, so rtn MISS. cjl per eab */
/* French has no suffixes as of 4/16/96, so rtn MISS. gl */
#ifndef SPANISH_DIC
#ifndef FRENCH_DIC
		if (i>2 )
			{
			abbrev_look=false;
/* Use the correct find routine based on language being compiled */
#ifdef GERMAN_DIC
			return(gsuffix_find(str_end,1));
#else
			return(suffix_find(str_end,1));
#endif
			}				 				 
		else
#endif
#endif
#endif //DSPG
			return(MISS);
		}									 
#ifdef LSDICDEBUG
	printf("LSDIC.C; blook; big dictionary hit hit_type=%d  \n",hit_type);
#endif

	return(hit_type);
}

int find_word()
/* look up the word in comp_str, returning HIT or MISS and updating	*/
/* a pile of globals (see below).					*/
/* this entire routine was rewritten 9/18/95 by ...tek			*/
{
	int offset; 	/* how far we move to do the next lookup */
	int stat;	/* what the lookup returned */
	int base;	/* where we are looking now */    
	unsigned short cap;	/* the word is capitalized */
	
	
	
	/* there are some globals involved here too: 			*/
	/*	*ent		struct dic_entry that ?look(base) 	*/
	/*			returned.				*/
	/*	localoff	set by ?look() to point to the end of	*/
	/*			the grapheme string in the dic entry;	*/
	/*			Incremented by one after a lookup, it	*/
	/*			points to the phoneme string in the 	*/
	/*			dict entry.				*/
	/* ?	hit_type	set by dlook and partially by ulook;	*/
	/*			this seems to want to hold the type	*/
	/*			of hit, but it actually holds 'HIT'	*/
	/*			if it's a miss. 			*/
	/* 	fc_struct[]	from ls1, has something to do with 	*/
	/*			form-class info				*/
	/*	fc_index	index into fc_struct from ls1..		*/
	/* 	limit		holds the index of the last entry	*/
	/*			in the dictionary. Used to bound	*/
	/* 			searches in dlook()			*/
	
	/* this binary search is just like the one that appears below	*/
	/* in ufind_word(); eventually we can probably unify this whole	*/
	/* mess, but for now it's a cut-and-paste because I don't want	*/
	/* to bite off too much. 					*/
	
	/* remember where the end of the dictionary is, so that we can 	*/
	/* bounds-check. THIS WHOLE MESS ASSUMES THAT THERE ARE LESS	*/
	/* THAN 32K ENTRIES, BECAUSE ALL THE INDICES ARE SIGNED AND 	*/
	/* BAD THINGS HAPPEN WHEN THE INDEX GOES NEGATIVE.		*/
	
	/* *** this is the start of the bsearch.. */
	
/* Use the correct KS dic entry based on language being compiled */
	limit = ((int)DICT_ENTRY); /* this is last_index+1 */

	offset = limit>>1; /* pretend that the last time through we 	*/
			   /* were offsetting by 1/2 the dic size, so	*/
			   /* that when we enter the loop and cut the	*/
			   /* offset in half we end up with 1/4 dic as 	*/
			   /* the first move.				*/
	base=offset;	/* start in the middle of the dictionary.	*/
	                                                                  
	limit--;	/* now = the last valid index.			*/
	                                                                  
	/* we now need to start searching, and continue until we either	*/
	/* have a hit or the offset has gone to 0. For dic sizes that 	*/
	/* are not a power of two, we may have to do one additional 	*/
	/* lookup after this loop completes.				*/
	        
	stat = MISS;	        
	do
		{
		offset = offset>>1;	/* narrow the range */
		if ( (stat=dlook(base)) == HIT)
			break; /* found it. */
		
		/* wasn't this one. Move to the next candidate. 	*/
		if (stat == LOOK_HIGHER)
			{
#ifdef DICDEBUG
			printf("LSDIC.C; find_word;  up \n");
#endif /*DICDEBUG*/
			base += offset;
			}
		    else
		    {
		    base -= offset;
#ifdef DICDEBUG
			printf("LSDIC.C; find_word;  down \n");
#endif /*DICDEBUG*/
			}
		} while (offset != 0);
	
	/* at this point, if we haven't hit we might have to walk a 	*/
	/* 'few' entries. We don't exactly know how many (probably 	*/
	/* log2(entries) in the worst case. We'll walk until we're 	*/
	/* told to go in the other direction. (dlook should be bounded	*/
	/* to turn the search away from the ends of the dictionary..) 	*/
	
	if (stat != HIT)
		{
		/* have to keep looking in the same direction */
#ifdef DICDEBUG
		printf("LSDIC.C; find_word;  crawling, stat=%x \n",stat);
#endif /*DICDEBUG*/
		if (stat == LOOK_HIGHER)
			{
			while(stat == LOOK_HIGHER)
				{
				base++;
				stat = dlook(base);
				}
			}
		    else if (stat == LOOK_LOWER)
		    	{
		    	while(stat == LOOK_LOWER)
		    		{
		    		base--;
		    		stat = dlook(base);
		    		}
		    	}
		} /* if (stat != HIT ) */
	                                     
	/* *** this is the end of the binary search. */
		                                
	/* if we don't have stat == HIT now, it's a miss. */
#ifdef DICDEBUG
		printf("LSDIC.C; find_word;  miss. \n");
#endif /*DICDEBUG*/
	if (stat != HIT)
		return(MISS); /* all done. */
	
	/* if we get this far, we hit. */
	
	/* The dictionary allows words with an initial uppercase to 	*/
	/* signal a homograph. To detect the *possibility* of this, 	*/
	/* we look for the first character to be uppercase, and the 	*/
	/* second character to be lower case (this eliminates the 	*/
	/* possibility of capslock on..) .. then we'll go take a 	*/
	/* peek 							*/
	/* Be careful here folks.. we also have to make sure that 	*/
	/* the reverse hasn't happened (namely, that the word is NOT	*/
	/* capitalized and we hit the capitalized version) .. but..	*/
	/* dlook() won't match uppercase dictionary letters with 	*/
	/* lowercase incoming letters. It will, however, match an	*/
	/* incoming uppercase character with upper or lowercase 	*/
	/* dictionary letters. So, the cases that we have to look for	*/
	/* are:								*/
	/*	1) all-uppercase incoming, which could hit either	*/
	/*		1A)all lower case dict entry			*/
	/*		1B)capitalized dict entry   			*/
	/* 	2) capitalized incoming, which could hit either		*/
	/*		2A)all lower case dict entry			*/
	/*		2B)capitalized dict entry			*/
	
	/* figure out if the incoming word is "capitalized".. 		*/                                                                  
	cap = (IS_UPPER(comp_str[0])) && (IS_LOWER(comp_str[1]));	                                                                  
#ifdef DICDEBUG
	printf("LSDIC.C; find_word;  cap:%x \n",cap);
#endif /*DICDEBUG*/
	                                              
	/* cases 1A and 2B are correct, so we don't have to do anything	*/
	/* for them. We just have to go looking if we have the other 	*/
	/* two cases..							*/	                                              
	if(   (cap && IS_LOWER(DE.text[0])) 	/*2A*/
	   || (!cap && IS_UPPER(DE.text[0])) )	/*1B*/
		{                    
		/* at this point, the incoming word's capitalization	*/
		/* doesn't match the dictionary entry. 			*/
		                                                          
		int new_base = 0;		/* where we'll go look.. */
#ifdef DICDEBUG
		printf("LSDIC.C; find_word;  capit. homograph reverse \n");
#endif /*DICDEBUG*/								     
				                                     
		/* the dictionary is sorted such that the capitalized	*/
		/* entry would be immediately before the uncap'd 	*/
		/* entry. We know we're on the wrong entry, and we know	*/
		/* which way we have to look..				*/
		if (cap)
			new_base = base-1;
		  else
		  	new_base = base+1;		
		
		
		if((stat = dlook(new_base)) != HIT)
			{
			dlook(base);
			}						 

		}                                                         
		
	/* now just blurt it out.. */
#ifdef DICDEBUG
	printf("LSDIC.C; find_word;  HIT complete. \n");
#endif /*DICDEBUG*/
	
	KS.pronflag &= (~PRON_DIC_ALTERNATE);

#ifdef FULL_LTS
	if(fc_struct[fc_index] == 0)
		fc_struct[fc_index] = DE.fc;
	else if(DE.fc & FC_HOMOGRAPH)
		fc_struct[fc_index] = fc_struct[fc_index] | FC_HOMOGRAPH;
#endif

	/*eab 8/94 if suff stripper overrides
	form_class on a homograph we need to remember it's a homograph*/
        if((DE.fc & PPHRASE) == PPHRASE) 
/* Use the correct sendphone routine based on language being compiled */
#ifdef GERMAN_DIC
		gsendphone(PPSTART);
	if((((DE.fc & VPHRASE) == VPHRASE) || (DE.fc == FC_VERB)) && no_pars == false)
		gsendphone(VPSTART);
	for(localoff += 1;DE.text[localoff] != '\0';localoff++)
		{
		gsendphone(DE.text[localoff]);
#else
		sendphone(PPSTART);
	if((((DE.fc & VPHRASE) == VPHRASE) || (DE.fc == FC_VERB)) && no_pars == false)
		sendphone(VPSTART);
	for(localoff += 1;DE.text[localoff] != '\0';localoff++)
		{
		sendphone(DE.text[localoff]);
#endif
		}
#ifdef DICDEBUG
	printf("*");
#endif /*DICDEBUG*/
	return(HIT);

} /* find_word() */


#if 0
ulook(llp,rlp,type)
LETTER *llp;
LETTER *rlp;
int	type;
{
	return(MISS);
}

#endif

 

dlook(index)
int index;
{
/* compare the word in comp_str with the main dictionary entry at 	*/
/* DICT_HEAD[index]; return HIT, LOOK_HIGHER, or LOOK_LOWER as 		*/
/* appropriate and also set hit_type to ABBREV if appropriate.		*/
/* (the global abbrev_look allows abbreviation hits.. )			*/
/* Leave the global *ent pointing to the dictionary entry, which might	*/
/* not be the same as DICT_HEAD[base] in the case of homographs.	*/
/* also leave localoff set such that DE.text[localoff+1] is the start	*/
/* of the phoneme string.						*/
/* Lower case letters in comp_str can only match lower case in the 	*/
/* dictionary, but upper case letters can match either.			*/

/* this was cleaned up a little on 9/18/95 by ...tek.			*/
/* First, the non-hit cases set hit_type to MISS before returing; as 	*/
/* far as I know, nobody looks at hit_type in the case of a miss, but 	*/
/* I hate to leave bad info laying around in a global variable. 	*/
/* Also, this routine would happily match off either end of the 	*/
/* dictionary, so if you passed it a bogus index you might never	*/
/* find yourself again. If now looks at the global 'limit' to find the	*/
/* end of the dictionary and stop.					*/

//	unsigned int phone;
//	unsigned char pivot_char;
	int	i;              
	int dict_base;
	int dict_offset;
	int dict_index;

	/* first, bail out if we've fallen off the end of the list.. 	*/
	if (index<0)
		{
		hit_type=MISS;
#ifdef DICDEBUG
		printf("LSDIC.C; find_word;  limit, LOOK_HIGHER \n");
#endif /*DICDEBUG*/
		return(LOOK_HIGHER);
		}
	if (index>limit)
		{
		hit_type=MISS;
#ifdef DICDEBUG
		printf("LSDIC.C; find_word;  limit. LOOK_LOWER \n");
#endif /*DICDEBUG*/
		return(LOOK_LOWER);
		}

//	ent = DICT_HEAD[index] + (int)DICT_HEAD;	
	dict_base=(int)(main_dict+8);
	dict_index=((int *)(main_dict))[index+2];
	dict_offset=(*(int *)(main_dict))*4;
//	ent = (struct dic_entry *)(((int)(((int *)(main_dict))[index+2]))+(int)(main_dict+8))+(*(int *)(main_dict))*4;
	ent=(struct dic_entry *)(dict_base+dict_index+dict_offset);
	hit_type = HIT;                                                   
	
#ifdef DICDEBUG
	printf("LSDIC.C; find_word;");
	for (i=0;DE.text[i];i++)
		printf("%c",DE.text[i]);
	printf("\n");
#endif /*DICDEBUG*/

	/* this loop is written to 'continue' on matching charaters	*/
	for(i=0;DE.text[i] != '\0';i++)
		{
#ifdef LSDICDEBUG
			printf("LSDIC.C; find_word; looking for char %c %x pos %d index %d got %c %x \n",comp_str[i],comp_str[i],i,index,DE.text[i],DE.text[i]);
			printf("next char in dic = %c %x \n",DE.text[i+1],DE.text[i+1]);
#endif
		if(comp_str[i] == '\0')
			{
			if(abbrev_look && (DE.text[i] == '.') && (DE.text[i+1]) == '\0')
				{
				hit_type = ABBREV;
				break;
				}
#ifdef DICDEBUG
			printf("LSDIC.C; find_word;  short string, LOOK_LOWER\n");
#endif /*DICDEBUG*/
			hit_type = MISS;
			return(LOOK_LOWER);
			}
		if(comp_str[i] == DE.text[i])
			{
#ifdef LSDICDEBUG
			printf("LSDIC.C; find_word; GOT MATCH %c %c \n",comp_str[i],DE.text[i]);
#endif
			continue;
			}

/* Use the correct ls_upper routine based on language being compiled */
#ifdef GERMAN_DIC
		if(IS_LOWER(DE.text[i])  && (comp_str[i] == gls_upper[DE.text[i]]))
#else
		if(IS_LOWER(DE.text[i])  && (comp_str[i] == ls_upper[DE.text[i]]))
#endif
			continue;
		/* must be a miscompare.. */
		hit_type=MISS;
		/* don't even ask where to look if we're at the edge */
		if (index==0)
			{
#ifdef DICDEBUG
			printf("LSDIC.C; find_word;  Limit, LOOK_HIGHER \n");
#endif /*DICDEBUG*/
			return(LOOK_HIGHER); /* bound.. */
			}
		if (index==limit)
			{
#ifdef DICDEBUG
			printf("LSDIC.C; find_word;  Limit. LOOK_LOWER \n");
#endif /*DICDEBUG*/			
			return(LOOK_LOWER); /* boune.. */
			}
		return(where_to_look(ent));
		}
	
	/* if we got here, we got to the end of the dictionary string	*/
	/* without bailing out on a miscompare. 			*/
	/* if this is also the end of the incoming string, it's a hit.	*/
	if(comp_str[i] == '\0')
		{             
		/* get past the period in an abbreviation.. */
		if(hit_type == ABBREV)
			i += 1;
#ifdef HOMOGRAPHS
/* eab out 3/95 not imple for Spanish yet */
/* GL 8/17/95, German don't do homograph at this point */
#ifndef FRENCH_DIC
#ifndef SPANISH_DIC
#ifndef GERMAN_DIC
		/* check for homograph.. */
		if(DE.fc & FC_HOMOGRAPH)
			{
			ent = homo(index);
			}
#endif
#endif
#endif
#endif
		/* save the index of the end of the graphemes.. 	*/
		localoff=i;
#ifdef DICDEBUG
		printf("*");
#endif /*DICDEBUG*/
		return(HIT);
		}
	/* was a match, but the incoming string was longer.. */
	hit_type = MISS;
#ifdef DICDEBUG
	printf("LSDIC.C; find_word;  long string, LOOK_HIGHER \n");
#endif /*DICDEBUG*/
	return(LOOK_HIGHER);
}
 
/*
 *  where_to_look() decides to the string is greater or less than
 *  the current entry
 */

int where_to_look(ent)
struct dic_entry far *ent;
{	
	int	i;
	unsigned char	pivot_char;
  	
	for(i=0;comp_str[i];i++)
		{
/* Use the correct ls_upper routine based on language being compiled */
#ifdef GERMAN_DIC
		pivot_char = gls_upper[DE.text[i]];
		if(gls_upper[comp_str[i]] != pivot_char)
#else
		pivot_char = ls_upper[DE.text[i]];
		if(ls_upper[comp_str[i]] != pivot_char)
#endif
			break;
		}	
/**/
	/* ...tek 03oct95 I think this is broken; we have to check for */
	/* the case where the two appear to match, and if that happens */
	/* we must have matched but the dic was capitalized and the    */
	/* incoming was lower. If that's the case, we have to go HIGHER*/
	/* because uppercase comes before lower in the dictionary.     */
	if ( (comp_str[i]=='\0') && (DE.text[i]=='\0'))
		{
#ifdef DICDEBUG
		printf("LSDIC.C; find_word;  w-t-l match: LOOK_HIGHER \n");
#endif /*DICDEBUG*/
		return(LOOK_HIGHER);
		}
/**/
#ifdef GERMAN_DIC
	if(gls_upper[comp_str[i]] > pivot_char)
#else
	if(ls_upper[comp_str[i]] > pivot_char)
#endif
		{
#ifdef DICDEBUG
		printf("LSDIC.C; find_word;  w-t-l: LOOK_HIGHER \n");
#endif /*DICDEBUG*/
		return(LOOK_HIGHER);
		}
#ifdef DICDEBUG
	printf("LSDIC.C; find_word;  w-t-l: LOOK_LOWER \n");
#endif /*DICDEBUG*/
	return(LOOK_LOWER);
}

/*
 *  where_to_look() decides to the string is greater or less than
 *  the current entry
 */

cswhere_to_look(ent)
struct dic_entry far *ent;
{	
	int
		i;
	unsigned char	pivot_char;
  	
	for(i=0;comp_str[i];i++)
		{
		pivot_char = DE.text[i];
		if( comp_str[i] != pivot_char )
			break;
		}

	if(comp_str[i] > pivot_char)
		{
		return(LOOK_HIGHER);
		}
	return(LOOK_LOWER);
}

/********************************************************
 *  user dictionary code ... basically the same as above
 *  but with the form class stuff stripped out to make it
 *  run quicker ...
 ********************************************************/

				       
ufind_word()
{
/*
 *  binary search the dictionary ...
 */

/* Simpler bsearch code 19-JAN-1995 cjl adn 
 *
 * The 'thing' being searched for must always exist between
 * first and last. Each time a compare is done:
 * return HIT if its a match,
 * move first halfway down if the match is lower, or
 * move last halfway up if the match is higher.
 * If while competes before a match, return (MISS)
*/

	int	first,last,base,stat;
	last  =	(int)UDICT_ENTRY;		 	/* max number of entries */
	first = 0;										/* 0 is the bottom */

	while (first <= last)						/* search until list is empty */
		{
/*		printf ("\nDEBUG-ufind_word: first: %d, last: %d, base: %d, stat: %d, len: %d\n",first,last,base,stat,len);*/
		base = (first + last) / 2;				/* find the mid point for compare */
		stat = udlook(base); 					/* compare string */

		if (stat == HIT)							/* match */
			{
#ifdef DICDEBUG
			printf("*");
#endif /*DICDEBUG*/
			return(HIT);
			}
		if (stat == LOOK_HIGHER)			 	/* search higher */
			first = base + 1;
		else											/*search lower */
			last = base - 1;
		}
	return (MISS);
}

/* end of 19-JAN-1995 code */

udlook(uindex)
int uindex;
{
	unsigned char _far *ent;
	int	i;


	ent = UDICT_HEAD[uindex]+ (int)UDICT_HEAD;
//	ent = (struct dic_entry *)(((int)(((int *)KS.fdic)[uindex]))+(int)KS.fdic);

	hit_type = HIT;
/*	printf("LSDIC.C; find_word;  %d in lk\n",uindex);*/

	for(i=0;ent[i] != '\0';i++)
		{

		if(comp_str[i] == ent[i])
			continue;
		if(comp_str[i] == '\0')
			{
			return(LOOK_LOWER);
			}
/* Use the correct ls_upper routine based on language being compiled */
#ifdef GERMAN_DIC
		if(IS_LOWER(ent[i])  && (comp_str[i] == gls_upper[ent[i]]))
#else
		if(IS_LOWER(ent[i])  && (comp_str[i] == ls_upper[ent[i]]))
#endif
			continue;
		return(where_to_ulook(ent));
		}

	if(comp_str[i] == '\0')
		{
		for(i += 1;ent[i] != 0x00;i++)
/* Use the correct sendphone routine based on language being compiled */
#ifdef GERMAN_DIC
			gsendphone(ent[i]);
#else
			sendphone(ent[i]);
#endif
#ifdef DICDEBUG
		printf("*");
#endif /*DICDEBUG*/
		return(HIT);
		}
	return(LOOK_HIGHER);
}

/*
 *  where_to_ulook() decides to the string is greater or less than
 *  the current entry
 */

where_to_ulook(ent)
char far *ent;
{	

	int	i;
	unsigned char	pivot_char;

	for(i=0;comp_str[i];i++)
		{
/* Use the correct ls_upper routine based on language being compiled */
#ifdef GERMAN_DIC
		pivot_char = gls_upper[ent[i]];
		if(gls_upper[comp_str[i]] != pivot_char)
			break;
		}
	if(gls_upper[comp_str[i]] > pivot_char)
#else
		pivot_char = ls_upper[ent[i]];
		if(ls_upper[comp_str[i]] != pivot_char)
			break;
		}
	if(ls_upper[comp_str[i]] > pivot_char)
#endif
		return(LOOK_HIGHER);
	return(LOOK_LOWER);
}


#ifndef VOCAL
/*
 ********************************************************************************************
 *                                                                      
 *                           Copyright ©                              
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved.
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
 ******************************************************************************************** 
 *    File Name:	par_dict.c
 *    Author:		Ginger Lin                                         
 *    Creation Date:05/12/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    The routines in this module will be used to check the dictionary
 *    search result of input word.
 *                                                                             
 *                                                                             
 *******************************************************************************************
 *                                                                             
 * Rev	Who		Date		Description                    
 * ---	-----	-----------	----------------------------------------------------------------
 * 001 	GL		5/12/96		modify the lsdic.c to create this file
 * 002	MGS		5/20/96		Made par_dict_lookup an int instead of void
 * 003	GL		7/29/96		Use the runtime variable to pick up dictionary entry.
 * 004	GL		8/02/96		add user dictionary search support.
 * 005	GL		8/27/96		replace "ABBREV" with "HIT" 
 * 006 SIK		10/10/96	Add VOCAL #ifndef switch to support the VOCAL build 
 * 007  GL		02/01/97	add debug switch for tracing the hit/miss     
 * 008	GL		04/21/1997	BATS#360  remove spaces before "#define" or "#if" 
 * 009  GL		09/25/1997	use array for dictionary entry structure.
 *                          also use "huge" pointer for DICT_HEAD
 * 010	MGS		11/13/1997	BATS #520 changed parser_char_types to short
 * 011	GL		04/01/1998	BATS #645 changed all "char *word" to "unsigned char *word"
 * 012	MFG		04/28/98	added dbglog.txt logging for debug switch[:debug 8020]
 * 013  MFG		05/19/98	excluded dbglog logging when build 16-bit code (MSDOS)	 
 * 014  GL		03/03/1999	BATS#676,697 and 744 add second pass dictionary search after removing "."
 *                          so we can handle both "Chrysler" and "Chrysler."
 * 015	MGS		10/14/1999	BATS#876 fix for UK phone numbers (part of it) 
 * 016	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 017 	CAB		10/16/00	Changed copyright info
 * 018	MGS		12/13/2000	Increased the size of the temp_word buffer in par_dict_lookup
 *							it was smaller than the largest possible word.
 * 019	MGS		01/11/2001	Added Foreigh langauge dictioanry
 * 020	MFG		05/29/2001	Included dectalkf.h
 * 021	CAB		06/01/2001	Updated copyright info
 * 022	MGS		02/22/2002	Added abbreivation lookups for the parser
 * 023	MGS		04/11/2002		ARM7 port
 */

#include "dectalkf.h"
#include "defs.h"
#include "port.h"
#include "kernel.h"
#include "dectalk.h"
#include "par_def.h"
#include "tts.h"
#include <stdio.h> // NAL warning removal

#ifdef ARM7
#include "stdlib.h"
#include "string.h"
#endif

 
/* declare the dictionary entry pointer and size */
#ifndef DIC_ENTRY
#define DIC_ENTRY
struct  dic_entry
{
#ifdef CHEESY_DICT_COMPRESSION
	unsigned char           fc[1];
#else
	U32			fc;
#endif
   unsigned char     text[128];
};
#endif

#define MISS   0
#define HIT    1
#define ABBREV 2
#define LOOK_HIGHER             0xffff
#define LOOK_LOWER              0xfffe
#define IS_LOWER(c)             (parser_char_types[(c)&0xff] & TYPE_lower)
#define IS_UPPER(c)             (parser_char_types[(c)&0xff] & TYPE_upper)

extern unsigned short parser_char_types[];
extern unsigned char par_lower[];
extern unsigned char par_upper[];
#ifndef ARM7_NOSWI
void WINprintf(char *fmt, ...); // NAL warning removal
#endif
/* function declaration */
// * 015	MGS		10/14/1999	BATS#876 fix for UK phone numbers (part of it) 
int _far par_dict_lookup(PKSD_T pKsd_t,  unsigned char *word, int in_flag);
int par_dict_find_word(long DICT_ENTRY,
                       S32 *DICT_INDEX, unsigned char *DICT_DATA,
                       unsigned char *word);
int par_dict_dlook(long DICT_ENTRY,
                   	S32 *DICT_INDEX, unsigned char *DICT_DATA,
                        long index,
                        struct dic_entry far **ppent,
                        unsigned char *word);
int par_dict_where_to_look(struct dic_entry far *pent,
                           unsigned char *word);

int par_dict_ufind_word(long UDICT_ENTRY,
                        S32 *UDICT_INDEX, unsigned char *UDICT_DATA,
		        unsigned char *word);
int par_dict_udlook(long UDICT_ENTRY,
                   S32 *UDICT_INDEX, unsigned char *UDICT_DATA,
                   long uindex,unsigned char *word);
int par_dict_where_to_ulook(char far *pent,
                            unsigned char *word);

#ifdef SAPI5DECTALK
extern int ls_sapi_find_word(LPTTS_HANDLE_T phTTS, unsigned char *, short);
#endif


/*
 *	Function Name:	
 *		par_dict_lookup
 *
 *	Description:
 *		lookup routine to call find_word() for dictionary search
 *
 *	Arguments:
 *		PKSD_T pKsd_t
 *		unsigned char *word
 *
 *	Return Value:
 *	0       - MISS
 *	NO-ZERO - HIT
 *
 *	Comments:
 *
 */
// * 015	MGS		10/14/1999	BATS#876 fix for UK phone numbers (part of it) 
int _far par_dict_lookup(PKSD_T pKsd_t,unsigned char *word, int in_flag)
{
	long DICT_ENTRY=0;
	long UDICT_ENTRY=0;
	long FDICT_ENTRY=0;

	S32 *DICT_INDEX=0; 
	unsigned char *DICT_DATA=0; 
	S32 *UDICT_INDEX=0; 
	unsigned char *UDICT_DATA=0; 
	S32 *FDICT_INDEX=0; 
	unsigned char *FDICT_DATA=0; 

	// increased the size of this buffer.

	char temp_word[350];
	short flag=0;
	short word_size=0;
	int a=0,b=0;

	// 015	MGS		10/14/1999	BATS#876 fix for UK phone numbers (part of it) 
	// fixed the dictionary search so it woud know where the end of a clause was.
	if (in_flag==1)
	{		
		word_size = strlen(word);
		if (word[word_size-1] == '.')
		{
			memcpy(temp_word,word,word_size-1);
			temp_word[word_size-1] = '\0';
			flag=1;
		}
	}
	/* decide which language, point to right dictionary entry */
	/* GL 09/25/1997 use array structure for dictionary entry */
	DICT_ENTRY = pKsd_t->fdic_entries[pKsd_t->lang_curr]; 
	DICT_INDEX = pKsd_t->fdic_index[pKsd_t->lang_curr];
	DICT_DATA = pKsd_t->fdic_data[pKsd_t->lang_curr];

	UDICT_ENTRY = pKsd_t->udic_entries[pKsd_t->lang_curr]; 
    UDICT_INDEX = pKsd_t->udic_index[pKsd_t->lang_curr];
    UDICT_DATA = pKsd_t->udic_data[pKsd_t->lang_curr];

	FDICT_ENTRY = pKsd_t->foreigndic_entries[pKsd_t->lang_curr]; 
	FDICT_INDEX = pKsd_t->foreigndic_index[pKsd_t->lang_curr];
	FDICT_DATA = pKsd_t->foreigndic_data[pKsd_t->lang_curr];

	/* return MISS if receive null string */
	if(word == 0 || word[0] == '\0')
	{
		return(MISS);
	}

#ifdef SAPI5DECTALK
	a=MISS;
	b=MISS;
	/* return the search result HIT/MISS from SAPI lexicon search */
	if( (a=ls_sapi_find_word(pKsd_t->phTTS, word, 1) == HIT)||
		(flag == 1 && (b=ls_sapi_find_word(pKsd_t->phTTS, temp_word, 1) == HIT)) )
	{
		if (a==MISS && b!=MISS)
		{
			return(ABBREV);
		}
		else
		{
			return HIT;
		}
	}
#endif




	a=MISS;
	b=MISS;
	/* return the search result HIT/MISS from user dictionary search */
	if (UDICT_ENTRY != 0 && (((a=par_dict_ufind_word(UDICT_ENTRY,UDICT_INDEX, UDICT_DATA,word)) != MISS) ||
		(flag == 1 && (b=par_dict_ufind_word(UDICT_ENTRY,UDICT_INDEX,UDICT_DATA,temp_word)) != MISS)))
	{
		/* debug switch */
		if (DT_DBG(CMD_DBG,0x020))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt suport*/
				fprintf(pKsd_t->dbglog,"\n(%s)(PUHIT)",word);
#endif
			printf("\n(%s)(PUHIT)",word);		
#endif
		}
		//printf("%s UHIT\n",word);
		if (a==MISS && b!=MISS)
		{
			return(ABBREV);
		}
		return(HIT);
	}
	
	a=MISS;
	b=MISS;
	/* return the search result HIT/MISS from foreign language dictionary search */
	if (FDICT_ENTRY != 0 && (((a=par_dict_ufind_word(FDICT_ENTRY,FDICT_INDEX, FDICT_DATA,word)) != MISS) ||
		(flag == 1 && (b=par_dict_ufind_word(FDICT_ENTRY,FDICT_INDEX,FDICT_DATA,temp_word)) != MISS)))
	{
		/* debug switch */
		if (DT_DBG(CMD_DBG,0x020))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt suport*/
				fprintf(pKsd_t->dbglog,"\n(%s)(PFHIT)",word);
#endif
			printf("\n(%s)(PFHIT)",word);		
#endif
		}
		//printf("%s UHIT\n",word);
		if (a==MISS && b!=MISS)
		{
			return(ABBREV);
		}
		return(HIT);
	}
	/* do regular dictionary search if miss in user dictionary */
	/* return the search result HIT/MISS */
	a=MISS;
	b=MISS;
	if (DICT_ENTRY != 0 && (((a=par_dict_find_word(DICT_ENTRY,DICT_INDEX,DICT_DATA,word)) != MISS)||
	   (flag == 1 && (b=par_dict_find_word(DICT_ENTRY,DICT_INDEX,DICT_DATA,temp_word)) != MISS)))
	{
		/* debug switch */
		if (DT_DBG(CMD_DBG,0x020))
		{
#ifndef ARM7_NOSWI
#ifndef MSDOS
			if (pKsd_t->dbglog)		/* mfg added for dbglog.txt suport*/
				fprintf(pKsd_t->dbglog,"\n(%s)(PHIT)",word);
#endif
			printf("\n(%s)(PHIT)",word);
#endif
		}
		   //printf("%s HIT\n",word);

		if (a==ABBREV || (a==MISS && b!=MISS))
		{
			return(ABBREV);
		}
		return(HIT);
	}

	/* debug switch */
	if (DT_DBG(CMD_DBG,0x020))
	{
#ifndef ARM7_NOSWI
#ifndef MSDOS
		if (pKsd_t->dbglog)		/* mfg added for dbglog.txt suport*/
			fprintf(pKsd_t->dbglog,"\n(%s)(PMISS)",word);
#endif
		printf("\n(%s)(PMISS)",word);
#endif
	}
	//printf("%s %d %x MISS\n",word,strlen(word),word[0]);
	return(MISS);

}


/*
 *	Function Name:	
 *		par_dict_find_word
 *
 *	Description:         
 *		this function searches the main dictionary for a word
 *
 *	Arguments:                                              
 *              long DICT_ENTRY
 *              struct dic_entry _far * _far *DICT_HEAD
 *		unsigned char *word
 *
 *	Return Value:
 *		HIT	the word was found in the dictionary
 *		MISS	The word was not found in the dictinary
 *
 *	Comments:
 *
 */
int par_dict_find_word(long DICT_ENTRY,
					   S32 *DICT_INDEX,
                       unsigned char *DICT_DATA, 
                       unsigned char *word)
{
	long offset;  	/* how far we move to do the next lookup */
	int stat;	/* what the lookup returned */
	long base;	/* where we are looking now */
	long limit;

	//long new_base = 0;		/* where we'll go look.. */
	
   
   	struct   dic_entry far *pent;		 /* MVP MI New */
/*	unsigned short cap;*/	/* the word is capitalized */ 
                                             
	
	
/* Use the correct KS dic entry based on language being compiled */
	limit = DICT_ENTRY;/* this is last_index+1 */

	offset = limit>>1; /* pretend that the last time through we 	*/
			   /* were offsetting by 1/2 the dic size, so	*/
			   /* that when we enter the loop and cut the	*/
			   /* offset in half we end up with 1/4 dic as 	*/
			   /* the first move.				*/
	base=offset;	   /* start in the middle of the dictionary.	*/
	                                                                  
	limit--;	    /* now = the last valid index.		*/
	                                                                  
	/* we now need to start searching, and continue until we either	*/
	/* have a hit or the offset has gone to 0. For dic sizes that 	*/
	/* are not a power of two, we may have to do one additional 	*/
	/* lookup after this loop completes.				*/
	        
	stat = MISS;	        
	do
	{
		offset = offset>>1;	/* narrow the range */
		if ( (stat=par_dict_dlook(DICT_ENTRY,DICT_INDEX,DICT_DATA,base,&pent,word)) == HIT || stat == ABBREV)
			break; /* found it. */
		
		/* wasn't this one. Move to the next candidate. 	*/
		if (stat == LOOK_HIGHER)
		{
		    base += offset;
		}
	        else
	        {
		    base -= offset;
		}
	} while (offset != 0);
	
	if (stat != HIT && stat!=ABBREV)
	{
		/* have to keep looking in the same direction */
		if (stat == LOOK_HIGHER)
		{
			while(stat == LOOK_HIGHER && base < limit)
			{
				base++;
				stat = par_dict_dlook(DICT_ENTRY,DICT_INDEX,DICT_DATA,base,&pent,word);
			}
		}
		else 
		{
			if (stat == LOOK_LOWER)
			{
		    	   while(stat == LOOK_LOWER && base > 0)
		    	   {
		    		base--;
		    		stat = par_dict_dlook(DICT_ENTRY,DICT_INDEX,DICT_DATA,base,&pent,word);
		    	   }
		    	}
		}
	} /* if (stat != HIT ) */
	                                     
	if (stat != HIT && stat!=ABBREV)
	    return(MISS); /* all done. */
		
	return(stat);


} /* par_dict_find_word(word) */
/*
 *	Function Name:	
 *		par_dict_ufind_word
 *
 *	Description:         
 *		this function searches the user dictionary for a word
 *
 *	Arguments:                                              
 *              long UDICT_ENTRY
 *              struct dic_entry _far * _far *UDICT_HEAD
 *		unsigned char *word
 *
 *	Return Value:
 *		HIT	the word was found in the dictionary
 *		MISS	The word was not found in the dictinary
 *
 *	Comments:
 *
 */
int par_dict_ufind_word(long UDICT_ENTRY,
						S32 *UDICT_INDEX,
						unsigned char *UDICT_DATA,
                        unsigned char *word)
{

	long first,base;
	long last;     
	int stat;

	first = 0;					/* 0 is the bottom */
	last  =	UDICT_ENTRY - 1;		 	/* max number of entries */

	while (first <= last)				/* search until list is empty */
	{
		base = (first + last) >> 1;		/* find the mid point for compare */
		if ((stat = par_dict_udlook(UDICT_ENTRY,UDICT_INDEX,UDICT_DATA,base,word)) == LOOK_LOWER)							/* match */
		{
			last = base - 1;
		}
		else                                    /*search lower */
		{			
			if (stat == LOOK_HIGHER)	/* search higher */
			{
				first = base + 1;
			}
			else											
			{
				return(HIT);
			}
		}    
	}
	return (MISS);

} /* par_dict_ufind_word */

 
/*
 *	Function Name:	
 *		par_dict_dlook
 *
 *	Description:     
 *		please see the description of ls_dict_dlook()
 *      of ls_dict.c
 *
 *	Arguments:
 *              long DICT_ENTRY
 *              struct dic_entry _far * _far *DICT_HEAD
 *              long index
 *              struct dic_entry far **ppent
 *		unsigned char *word
 *
 *
 *	Return Value:
 *
 *	Comments:
 *
 */
int par_dict_dlook(long DICT_ENTRY,
                   S32 *DICT_INDEX,
				   unsigned char *DICT_DATA,
                   long index,struct dic_entry far **ppent,unsigned char *word)
{
	int	i;
	long limit;
	              
	limit = ((int)DICT_ENTRY) - 1;

	/* first, bail out if we've fallen off the end of the list.. 	*/
	if (index<0)
	{
		return(LOOK_HIGHER);
	}
	if (index>limit)
	{
		return(LOOK_LOWER);
	}
	
	*ppent = (struct dic_entry *)(&DICT_DATA[DICT_INDEX[index]]);

	/* this loop is written to 'continue' on matching charaters	*/
	for(i=0;(*ppent)->text[i] != '\0';i++)
	{
		if(word[i] == '\0')
		{
			return(LOOK_LOWER);
		}
		if(word[i] == (*ppent)->text[i])
		{
			continue;
		}

		if(IS_LOWER((*ppent)->text[i])  && (word[i] == par_upper[(*ppent)->text[i]]))
		   continue;

		/* don't even ask where to look if we're at the edge */
		if (index==0)
		{
			return(LOOK_HIGHER); /* bound.. */
		}
		if (index==limit)
		{
			return(LOOK_LOWER); /* boune.. */
		}
		return(par_dict_where_to_look(*ppent,word));
	}
	
	/* if we got here, we got to the end of the dictionary string	*/
	/* without bailing out on a miscompare. 			*/
	/* if this is also the end of the incoming string, it's a hit.	*/
	if(word[i] == '\0')
	{
		if (word[i-1] == '.')
				return(ABBREV);	// return HIT instead of ABBREV
		// restore abbrev
            else
				return(HIT);
	}
	/* was a match, but the incoming string was longer.. */
	return(LOOK_HIGHER);
}
/*
 *	Function Name:	
 *		par_dict_udlook
 *
 *	Description:
 *		do a somewhat case sensitive compare for the word          
 *		uppercase characters in dictionary entries only match uppercase    
 *		lowercase characters in entries match either case
 *		
 *
 *	Arguments:
 *		int uindex	The index in the user dictionary
 *              unsigned char *word      The incoming word
 *
 *	Return Value:                                   
 *		HIT 		The word was found
 *		LOOK_LOWER  Look at a lower index
 *		LOOK_HIGHER	Look at a higher index
 *
 *	Comments:
 *
 */
int par_dict_udlook(long UDICT_ENTRY,
                   S32 *UDICT_INDEX,
				   unsigned char *UDICT_DATA,
                   long uindex,unsigned char *word)
{
	unsigned char *ent;
	int     i; 


        /* add for WIN95.  6/03/96.  by MGS */
    ent = ((struct dic_entry *)&(UDICT_DATA[UDICT_INDEX[uindex]]))->text;

	for(i=0;ent[i] != '\0';i++)
	{
		if(word[i] == ent[i])
			continue;
		if(word[i] == '\0')
		{
			return(LOOK_LOWER);
		}
		if(IS_LOWER(ent[i])  && (word[i] == par_upper[ent[i]]))
			continue;                       
		return(par_dict_where_to_ulook(ent,word));
	}
	if(word[i] == '\0')
	{
		return(HIT);
	}
	return(LOOK_HIGHER);
}
 
/*
 *	Function Name:	
 *		par_dict_where_to_look
 *
 *	Description:             
 *		this function decides whether the string is greater or less than 
 *		the current entry
 *
 *	Arguments:
 *		struct dic_entry far *ent	The string being searched for
 *              unsigned char   *word                    The incoming word
 *
 *	Return Value:                                                
 *		LOOK_HIGHER		look for an entry greater than the current entry
 *		LOOK_LOWER		look for an entry less than the current entry
 *
 *	Comments:
 *
 */
int par_dict_where_to_look(struct dic_entry far *pent,unsigned char *word)
{	
	int	i;
	unsigned char	pivot_char=0;
  	
	for(i=0;word[i];i++)
	{
		pivot_char = par_upper[pent->text[i]];
		if(par_upper[word[i]] != pivot_char)
			break;
	}	

	if ( (word[i]=='\0') && (pent->text[i]=='\0'))
	{
		return(LOOK_HIGHER);
	}
	
	if(par_upper[word[i]] > pivot_char)
	{
		return(LOOK_HIGHER);
	}
	
	return(LOOK_LOWER);
}
/*
 *	Function Name:	
 *		par_dict_where_to_ulook
 *
 *	Description:              
 *		This function decides to the string is greater or less than
 *  	        the current entry for user dictionary
 *
 *	Arguments:
 *		char far *ent	The string begin searched for
 *              unsigned char *word      The incoming word
 *
 *	Return Value:                                
 *		LOOK_LOWER 		Look at a lower index
 *		LOOK_HIGHER		Look at a higher index
 *
 *	Comments:
 *
 */
int par_dict_where_to_ulook(char *ent,unsigned char *word)
{	

	int	i;
	unsigned char	pivot_char=0;
	for(i=0;word[i];i++)
	{
		pivot_char = par_upper[(int)ent[i]];
		if(par_upper[word[i]] != pivot_char)
			break;
	}
	if(par_upper[word[i]] > pivot_char)
	{
		return(LOOK_HIGHER);                         
	}
	return(LOOK_LOWER);
}
#endif /* end of #ifndef VOCAL */

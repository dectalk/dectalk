/*
 * @DEC_COPYRIGHT@
 */
/*
 * MGS 11/20/1997	Added UK code
 * HISTORY
	6	08/01/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code,
                                        tested (16 & 32 bit) 11/17/97 cjl
	5	08/01/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release,
	                                tested (16 & 32 bit) 10/31/97 cjl
	4	08/01/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and
                                        code ONLY English UK). Also represents latest working (verified)
                                        ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 
                                        10/27/97        cjl
	3	08/01/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA
                                        and code ONLY English UK). Also represents latest working
                                        (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT
                                         has a build bug. 10/27/97 cjl
	2	08/01/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	08/01/97	leeber	Initial Version
 * Revision 1.1.2.2  1995/07/05  18:09:49  Krishna_Mangipudi
 * 	Moved from ./src/clients
 * 	[1995/07/05  18:09:03  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  22:41:57  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:45:39  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 * $EndLog$
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
/***************************************************************************
**
**  Copyright © 2000 Force Computers, Inc., a Solectron company. All rights reserved.
**  Copyright (c) Digital Equipment Corporation, 1994 All Rights Reserved.
**
**  Unpublished rights reserved under the copyright laws of the United States.
**  The software contained on this media is proprietary to and embodies the
**  confidential technology of Force Computers Incoporated. Possession, use,
**  duplication or dissemination of the software and media is authorized only
**  pursuant to a valid written license from Force Computers Incoporated.
**
**  RESTRICTED RIGHTS LEGEND   Use, duplication, or disclosure by the U.S.
**  Government is subject to restrictions as set forth in Subparagraph
**  (c)(1)(ii) of DFARS 252.227-7013, or in FAR 52.227-19, as applicable.
**
****************************************************************************/

/*****************************************************************************
**  PROGRAM:
**     compile_dict.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**      Routines to generate dictionary entries.
**	This was adapted from the DECtalk PC V4.10 version
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi  
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
** 0010	KM		Sep 27, 94  Added parseString and the routines it calls
**                      	to validate input strings.
** 0011	KM		Oct 06, 94  Changed entry names to avoid conflict with DECtalk
**                      	routines.
** 0012	NAL		Mar 16, 00  Parses lines properly to compile
** 0013	NAL		Apr 24, 00  Changes for integrated phoneme set
** 0014	MGS		10/05/2000	Redhat 6.2 and linux warning removal
** 0015 CAB		10/17/2000	Changed copyright info
**
****************************************************************************/

#include <stddef.h>
#include <stdlib.h>
#include <ctype.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <time.h>
#include <malloc.h>
#include "port.h"
#include "cmd.h"

#include "ptab.h"

#include "usa_def.h"
#include "uk_def.h"
#include "spa_def.h"
#include "la_def.h"
#include "ger_def.h"
#include "fr_def.h"

#include "usa_phon.tab"
#include "uk_phon.tab"
#include "spa_phon.tab"
#include "la_phon.tab"
#include "ger_phon.tab"
#include "fr_phon.tab"

unsigned char *arpabet = NULL;

#define NPTAB (sizeof(ptab)/sizeof(struct PTAB))

/*
 * general defines ...
 */

#define	true	1
#define	false   0
//#define	failure 1
//#define	success 0

#ifdef ENGLISH_US
#define main_lang 0
#endif
#ifdef ENGLISH_UK
#define main_lang 1
#endif
#ifdef SPANISH_SP
#define main_lang 2
#endif
#ifdef GERMAN
#define main_lang 3
#endif
#ifdef SPANISH_LA
#define main_lang 4
#endif 
#ifdef FRENCH
#define main_lang 5
#endif

/*
 *  User dictionary structure and size defines ...
 */

#define	UDICT_MAX_ENTS		(1024)
#define	UDICT_MAX_TEXT		(16*1024)

struct	dict_link	{
	U32     	text;
	unsigned int	link;
};

unsigned int first_ent;

unsigned char	dict_text[UDICT_MAX_TEXT];	/* actual user dictionary */
unsigned int text_bytes;
unsigned int temp_text_bytes;

struct dict_link entries[UDICT_MAX_ENTS];	/* sort array */
unsigned int free_ent;
unsigned int first_ent;

#define	ENT	(entries[free_ent])

unsigned int line_number;
unsigned char line[256];
char errorStr[512];
int curr_char;
FILE	*fdic;
int     idx;
int     errorStatus = FALSE;
int     phon_lang;

int multi_lang_phon = FALSE;
int start_of_entry = TRUE;

unsigned char language_prefixes[] = 
{
  'u', 's',
  'u', 'k',
  's', 'p',
  'g', 'r',
  'l', 'a'
};

int language_size = sizeof(language_prefixes);

unsigned char *arpabet_arrays[] =
{
  usa_arpa,
  uk_arpa,
  spanish_arpa,
  german_arpa,
  la_arpa,
  french_arpa
};

unsigned int arpabet_sizes[]  =
{ 
  sizeof(usa_arpa),
  sizeof(uk_arpa),
  sizeof(spanish_arpa),
  sizeof(german_arpa),
  sizeof(la_arpa),
  sizeof(french_arpa)
};

unsigned int arpabet_lang_flags[] = 
{
  LANG_english,
  LANG_british,
  LANG_spanish,
  LANG_german,
  LANG_latin_american,
  LANG_french
};

unsigned int arpabet_lang_fonts[] = 
{
  PFUSA,
  PFUK,
  PFSP,
  PFGR,
  PFLA,
  PFFR
};
/*
unsigned char usa_arpa[];
unsigned char spa_arpa[];
unsigned char ger_arpa[];
unsigned char uk_arpa[];
unsigned char la_arpa[];
*/

/*
 *  prototypes ...
 */

void toAscky();
void lookupAscky();
void toArpabet();
int lookupArpabet();
void pushEntry();
unsigned char nonWhite();
unsigned char getAlpha();
int look_for_prefix(char, char);


/*
 *  Upper case folding table ...
 */

unsigned char case_upper[] = {

	0x00,		0x01,		0x02,		0x03,		0x04,		0x05,		0x06,		0x07,
	0x08,		0x09,		0x0a,		0x0b,		0x0c,		0x0d,		0x0e,		0x0f,
	0x10,		0x11,		0x12,		0x13,		0x14,		0x15,		0x16,		0x17,
	0x18,		0x19,		0x1a,		0x1b,		0x1c,		0x1d,		0x1e,		0x1f,
	0x20,		0x21,		0x22,		0x23,		0x24,		0x25,		0x26,		0x27,
	0x28,		0x29,		0x2a,		0x2b,		0x2c,		0x2d,		0x2e,		0x2f,
	0x30,		0x31,		0x32,		0x33,		0x34,		0x35,		0x36,		0x37,
	0x38,		0x39,		0x3a,		0x3b,		0x3c,		0x3d,		0x3e,		0x3f,
	0x40,		0x41,		0x42,		0x43,		0x44,		0x45,		0x46,		0x47,
	0x48,		0x49,		0x4a,		0x4b,		0x4c,		0x4d,		0x4e,		0x4f,
	0x50,		0x51,		0x52,		0x53,		0x54,		0x55,		0x56,		0x57,
	0x58,		0x59,		0x5a,		0x5b,		0x5c,		0x5d,		0x5e,		0x5f,
	0x60,		'A',		'B',		'C',		'D',		'E',		'F',		'G',
	'H',		'I',		'J',		'K',		'L',		'M',		'N',		'O',
	'P',		'Q',		'R',		'S',		'T',		'U',		'V',		'W',
	'X',		'Y',		'Z',		0x7b,		0x7c,		0x7d,		0x7e,		0x7f,
	0x80,		0x81,		0x82,		0x83,		0x84,		0x85,		0x86,		0x87,
	0x88,		0x89,		0x8a,		0x8b,		0x8c,		0x8d,		0x8e,		0x8f,
	0x90,		0x91,		0x92,		0x93,		0x94,		0x95,		0x96,		0x97,
	0x98,		0x99,		0x9a,		0x9b,		0x9c,		0x9d,		0x9e,		0x9f,
	0xa0,		0xa1,		0xa2,		0xa3,		0xa4,		0xa5,		0xa6,		0xa7,
	0xa8,		0xa9,		0xaa,		0xab,		0xac,		0xad,		0xae,		0xaf,
	0xb0,		0xb1,		0xb2,		0xb3,		0xb4,		0xb5,		0xb6,		0xb7,
	0xb8,		0xb9,		0xba,		0xbb,		0xbc,		0xbd,		0xbe,		0xbf,
	0xc0,		0xc1,		0xc2,		0xc3,		0xc4,		0xc5,		0xc6,		0xc7,
	0xc8,		0xc9,		0xca,		0xcb,		0xcc,		0xcd,		0xce,		0xcf,
	0xd0,		0xd1,		0xd2,		0xd3,		0xd4,		0xd5,		0xd6,		0xd7,
	0xd8,		0xd9,		0xda,		0xdb,		0xdc,		0xdd,		0xde,		0xdf,
	0xe0,		0xe1,		0xe2,		0xe3,		0xe4,		0xe5,		0xe6,		0xe7,
	0xe8,		0xe9,		0xea,		0xeb,		0xec,		0xed,		0xee,		0xef,
	0xf0,		0xf1,		0xf2,		0xf3,		0xf4,		0xf5,		0xf6,		0xf7,
	0xf8,		0xf9,		0xfa,		0xfb,		0xfc,		0xfd,		0xfe,		0xff,
};

compile_dictonary(char *DictFile, char *text, char *errStr)
{

	char	 fnam_d[80];
	unsigned int next;
	U32      tl;
	U32      sizes;
        int      slen;
        char     err_str[100];

        errorStatus = FALSE;
        errorStr[0] = '\0';
        if(strlen(DictFile) > 1)
                strcpy(fnam_d,DictFile);
        else
                strcpy(fnam_d,"user.dic");

        if ((fdic=fopen(fnam_d,"w+b")) == NULL)
                {
                sprintf(err_str, "Can't open user dictionary file : %s",fnam_d);
                strcpy( errStr, err_str );
                return;
                }

	text_bytes = free_ent = line_number = 0;
	first_ent = 0xffff;

        slen = strlen (text);
        idx = 0;

        while ((text[idx] != '\0') && (idx <= slen))
        {
           if (get_entry(text) )
           {
              if ( !parseString(line) )
              {
                 strcpy( errStr, errorStr );
                 return;
              }

              scan_entry();
              if ( errorStatus )
              {
                 strcpy( errStr, errorStr );
                 return;
              }
              sort_entry();
              if ( errorStatus )
              {
                 strcpy( errStr, errorStr );
                 return;
              }
           }
	   else{
	     scan_error("Bad syntax: The syntax for a line is: string [phoneme string]\n");
	     strcpy(errStr, errorStr);
	     return;
	   }
   
        }
/*
 *  convert the sizes to longs for the write	...
 */
	sizes = free_ent;
	fwrite(&sizes,4,1,fdic);
	sizes = text_bytes;
	fwrite(&sizes,4,1,fdic);

/*
 *  expand the links to far pointer ... when this is loaded, the first
 *  text byte will be 4*number of links, so add this to each offset and
 *  write a zero out for the segment to be fixed up by the loader.
 */
	for(next=first_ent;next!= 0xffff;next=entries[next].link)
		{
		tl = entries[next].text-4;
		fwrite(&tl,4,1,fdic);
		}
	fwrite(&dict_text[0],text_bytes,1,fdic);

	fclose(fdic);
}

/*
 *  sort_entry() sets the flink/blink for the current entry ...
 */


sort_entry()
{
	unsigned char *ct,*dt;
	unsigned int *blink,next;

	blink = &first_ent;
	next = first_ent;
	while(next != 0xffff)
		{
		ct = &dict_text[ENT.text];
		dt = &dict_text[entries[next].text];
		while (*ct != 0x00 && *dt != 0x00)
			{
			if(case_upper[*ct] != case_upper[*dt])
				break;
			ct += 1;
			dt += 1;
			}
		if(*ct == 0x00 && *dt == 0x00)
                        {
			scan_error("Duplicate entry");
                        return;
                        }
		if((case_upper[*ct] < case_upper[*dt]) || (*ct == 0x00))
			break;
		if(case_upper[*ct] > case_upper[*dt])
			{
			blink = &entries[next].link;
			next = entries[next].link;
			}
		}
	ENT.link = next;
	*blink = free_ent;
	free_ent+=1;
}

/*
 *  scan_entry_line() takes the input text and makes it into a
 *  valid dictionary entry ...
 *     entry format is ...
 *
 *  <entry> [2 char phonemes]
 *  <entry> {1 char phonemes}
 */

scan_entry()
{
	unsigned char c;

	if(free_ent == UDICT_MAX_ENTS)
                {
		scan_error("Too many entries");
                return;
                }

	ENT.text = text_bytes;
	while(true)
		{
		c = getAlpha();
                if ( errorStatus )
                   return;
		if(c == ' ')
			break;
		else
                        {
			pushEntry(c);
                        if ( errorStatus )
                           return;
                        }
		}
	pushEntry(0x00);
        if ( errorStatus )
           return;
        
	c = nonWhite();
	if(c == '[')
                {
		toArpabet();
                if ( errorStatus )
                   return;
                }
	else if(c == '{')
                {
		toAscky();
                if ( errorStatus )
                   return;
                }
	else
                { 
		scan_error("Unknown phoneme type");
                return;
                }
}

/*
 *  get_entry() reads in a line from the file and returns it to
 *  the caller if it is a dictionary entry.
 *  Puts everything upto ] into line[], ignoring anything after upto
 *  the newline (0xa)
 */

int get_entry(char *text)
{
  int j = 0;
  char temp[256];

  /*
   * Strip all the leading 0xa
   */
  
  /*Skip any empty lines*/
  while ( text[idx] == 0xa )
    {
      idx++;
      line_number++;
    }
  
  if (text[idx] != '\0')
    {
      while( text[idx] != ']' )
	{
	  if(text[idx] == '\0' || text[idx] == 0xa)
	    {
	      line[j] = '\0';
	      return FALSE;
	    }
	  
	  line[j++] = text[idx++];
	}
      line[j++] = text[idx++];
      line[j] = '\0';

      while(text[idx] != 0xa && text[idx] != '\0')
	idx++;
      
      
      curr_char = 0;
      line_number ++;
      idx++;
      
      if(legal_alpha(line[0]))
	{
	  return TRUE;
	}
    }
  else
    return TRUE;

  return FALSE;
}


void toAscky()
{
	unsigned char ph;

	while(line[curr_char] != '\0')
		{
		ph = nonWhite();
		if(ph == '}')
			return;
		lookupAscky(ph);
                if ( errorStatus )
                   return;
		}
	scan_error("No ascky terminator found");
        return;
}

void lookupAscky(ph)
unsigned char ph;
{
	int	i;	

	for(i=0;i<NPTAB;i++)
		if(ph == ptab[i].p_graph)
			{
			pushEntry(ptab[i].p_phone);
			return;
			}
	scan_error("Unknown ascky phoneme found");
        return;
}


/*
 *  this routine scans the input line for arpabet phonemes ...
 */


void toArpabet()
{
  int restarted = FALSE;
  int	i;
  unsigned char ph1,ph2,count;
  int temp_curr_char;
  
  temp_curr_char = curr_char;
  temp_text_bytes = text_bytes;

  count = 2;
  
  while(1)
    {
      if(count == 2)
	ph1 = nonWhite();
      if(ph1 == ']')
	{
	  multi_lang_phon = FALSE;
	  start_of_entry = TRUE;
	  pushEntry(0);
	  return;
	}
      
      if(!legal_alpha(ph1))
	ph1 = nonWhite();
      
      ph2 = nonWhite();
      
      if(look_for_prefix(ph1, ph2))
	{
	  ph1 = nonWhite();
	  if(ph1 == ']')
	    {
	      multi_lang_phon = FALSE;
	      start_of_entry = TRUE;
	      pushEntry(0);
	      return;
	    }
	
	  if(!legal_alpha(ph1))
	    ph1 = nonWhite();
	  
	  ph2 = nonWhite();
	}
      
      if( (multi_lang_phon && restarted) || (!multi_lang_phon) )
	{
	  count = lookupArpabet(ph1,ph2);
	  if ( errorStatus )
	    return;
	  if(count == 0)
	    {
	      scan_error("Unknown arpabet phoneme");
	      return;
	    }
	  if(count == 1)
	    ph1 = ph2;
	}
      if(multi_lang_phon && !restarted)
	{
	  restarted = TRUE;
	  curr_char = temp_curr_char;
	  text_bytes = temp_text_bytes;
	  count = 2;
	}
    }
  scan_error("No arpabet terminator found");
  return;
}

int lookupArpabet(p1,p2)
  unsigned char p1,p2;
{
  int	i;
  int p2bad = 0;
  
  if(p1 >= 'A' && p1 <= 'Z')
    p1 |= 0x20;
  if(p2 >= 'A' && p2 <= 'Z')
    p2 |= 0x20;
  //if( (p2<'a' || p2>'z') && p2!=']')
  if(!legal_alpha(p2) && p2 != ']')
    p2bad = 1;;
  
  for(i=0;i<strlen(arpabet);i+=2)
    if(p1 == arpabet[i] && (p2 == arpabet[i+1] || (p2bad && arpabet[i+1] == ' ')))
      {
	pushEntry(i/2);
	return(2);
      }
  
  for(i=0;i<strlen(arpabet);i+=2)
    if(p1 == arpabet[i] && arpabet[i+1] == ' ' && !p2bad)
      {
	pushEntry(i/2);
	return(1);
      }
  
  fprintf(stderr, "No phoneme pair \"%c%c\".\n", p1, p2);	
  return(0);
}

/*
 *  scan_error() is used to display an error message during the building
 *  of the user dictionary ...
 */

scan_error(es)
char *es;
{
	int	i;

	sprintf(errorStr, "Error at line %d : %s ::  %s",line_number,es, line);
	fclose(fdic);
        errorStatus = TRUE;
}

/*
 *  nonWhite() is used to return the next non white space character
 *  and bump the pointer ...
 */

unsigned char nonWhite()
{
	while(line[curr_char] == ' ' || line[curr_char] == '\t')
		curr_char++;
	return(line[curr_char++]);
}

/*
 *  This routine checks for legal graphemes in the user dict grapheme
 *  string.
 */

unsigned char getAlpha()
{
	if(legal_alpha(line[curr_char]))
			return(line[curr_char++]);
	if(line[curr_char] == ' ' || line[curr_char] == '\t')
		return(' ');
	scan_error("Unknown alphabetic character");
        return;
}

unsigned char legal_graphs[] = "_-()&@*!\\/";
legal_alpha(c)
char c;
{
	int	i;

	if((c >= 'a' && c <= 'z')	||
		 (c >= 'A' && c <= 'Z') ||
		  (c >= '0' && c <= '9'))
			return(true);
	for(i=0;i<sizeof(legal_graphs);i++)
		if(c == legal_graphs[i])
			return(true);
	return(false);
}
	
void pushEntry(c)
unsigned char c;
{
  if(!multi_lang_phon)
    {
      if(text_bytes == UDICT_MAX_TEXT)
	{  
	  scan_error("Dictionary too big");
	  return;
	}
      dict_text[text_bytes++] = c;
    }
  else
    {
      if(text_bytes+1 >= UDICT_MAX_TEXT)
	{  
	  scan_error("Dictionary too big");
	  return;
	}
      if(start_of_entry)
	{
	  dict_text[text_bytes++] = 0xFF;
	  start_of_entry = FALSE;
	}
      
      dict_text[text_bytes++] = arpabet_lang_fonts[phon_lang];
      dict_text[text_bytes++] = c;
    }
}

int parseString( char *text )
{

   char prefixStr[256];
   char postfixStr[256];
   char tempStr[256];
   int  sLength;

   /*
    * Break up the string into prefix string
    * and postfix string.
    */

   sLength = strcspn(text, "[");

   if ( sLength == strlen(text) )
   {
      scan_error("Bad syntax: The syntax for a line is: string [phoneme string]\n");
     return (FALSE);
   }

   strncpy( prefixStr, text, sLength);
   prefixStr[sLength] = '\0';

   strcpy( tempStr, text);
   strcpy(postfixStr, (char *)strstr( tempStr, "[") );

   if  ( ! validatePrefixStr( prefixStr) )
      return( FALSE );
 
   if ( ! validatePostfixStr( postfixStr ) )
      return( FALSE );

   return( TRUE );
}
                                           
int validatePrefixStr( char * prefixStr )
{
   int  len=0;
   int  idx=0;
   int  prefixLen;
   int  validStr=TRUE;

   len = skipBlanks(prefixStr);
   prefixLen = strlen(prefixStr);

   if ( prefixLen == len )
   {
      scan_error("Bad syntax: The syntax for a line is: string [phoneme string]\n");
      return( FALSE );
   }
   
   for (idx=0; idx <= prefixLen; idx++)
   {
      if ( (!isalnum(prefixStr[idx])) && 
           (prefixStr[idx] != ' ') && 
           (prefixStr[idx] != 0) )
      {
         scan_error("Not alpha numeric 0x%x\n", prefixStr[idx]);
         validStr = FALSE; 
         break;
      }
   } 
   
   return( validStr );
}

int validatePostfixStr( char * postfixStr )
{
   int  len=0;
   int  postfixLen=0;
   int  validStr=TRUE;

   len = skipBlanks(postfixStr);
   postfixLen = strlen(postfixStr);

   if ( postfixLen == len )
   {
      scan_error("Bad syntax: The syntax for a line is: string [phoneme string]\n");
      return FALSE;
   }

   if ( !((postfixStr[0] == '[') && (postfixStr[postfixLen-1] == ']')) )
   {
      scan_error("Bad syntax: The syntax for a line is: string [phoneme string]\n");
      return FALSE;
   }

   return TRUE;
}

int skipBlanks(char *inputStr)
{
   int idx=0;
   int strLen;

   strLen = strlen( inputStr );
   
   while((inputStr[idx] == ' ' || inputStr[idx] == '\t') 
          && (idx <= strLen)) 
      idx++;
   return(idx);
}

/* look_for_prefix checks to see if the phoneme is part of the extended multi-language
/* set and points lookup_arpabet to the proper phoneme table. Otherwise, makes
/* sure that it's pointing at the main table for the language*/
int look_for_prefix(char p1, char p2)
{
  int i;
    
  for(i=0; i<language_size; i+=2)
    {
      if(p1 == language_prefixes[i] && p2 == language_prefixes[i+1])
	{
	  if(line[curr_char] == '_')
	    {
	      if(!multi_lang_phon)
		{
		  multi_lang_phon = TRUE;
		}
	      phon_lang = i/2;
	      curr_char++;    // Move past the underscore
	      
	      arpabet = arpabet_arrays[phon_lang];
	      return TRUE;
	    }
	}
    }
  
  phon_lang = main_lang;
  arpabet = arpabet_arrays[phon_lang];
  return FALSE;
}              

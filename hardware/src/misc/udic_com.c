/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1995,1999. All rights reserved.
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
 *    File Name:	udic_com.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  User dictionary compiler ... This is the common code for all langs.
 *
 ***********************************************************************
 *    Revision History:
 *	001	29mar99		tek		new file, extracted from udic_us. Contains all common
 *							udic code except for the alphabet.c routines. Links
 *							with alphabet.c, rather than shelling to it.
 *	002	21apr00		mgs		Added linux changes
 *  003	24apr00     nal     Added changes for the integrated phoneme set
 *  004	10/05/2000	MGS		Redhat 6.2 and linux warning removal
 *  005 10/16/00	CAB		Changed copyright info
 *  006	02/12/2001	CAB		Updated copyright info
 */



#include <stddef.h>
#include <stdlib.h>
/*#include <dos.h>  // removed tek 11feb99 */
/*#include <bios.h> // removed tek 11feb99 */
#include <ctype.h>
#include <fcntl.h>  
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
/*#include <conio.h> // removed tek 11feb99 */
#include <time.h>
#include <malloc.h>

#include "udic_com.h"
#include "userdic.h" /* this gets all the language-specific tables etc. */

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

#define TRUE     1
#define FALSE    0

unsigned int first_ent;

unsigned char	dict_text[UDICT_MAX_TEXT];		/* actual user dictionary */
unsigned int text_bytes;
unsigned int temp_text_bytes;

struct dict_link entries[UDICT_MAX_ENTS];		/* sort array */
unsigned int free_ent;
unsigned int first_ent;

#define	ENT	(entries[free_ent])
#define	NPTAB	(sizeof(ptab)/sizeof(struct PTAB))

unsigned char line[256];
int curr_char;
FILE	*fdic;

unsigned char	LANG_flag;
//int	        def_lang = 1;
int             phon_lang = 0;
int             multi_lang_phon = FALSE;
int             start_of_entry = TRUE;

unsigned char language_prefixes[] = {
	'u', 's',
	'u', 'k',
	's', 'p',
	'g', 'r',
	'l', 'a',
	'f', 'r'
};

int language_size=sizeof(language_prefixes);

unsigned char *arpabet_arrays[]= {
	usa_arpa,
	uk_arpa,
	spanish_arpa,
	german_arpa,
	la_arpa,
	french_arpa
};

unsigned char	*arpabet=NULL;

unsigned int arpabet_sizes[] = {
	sizeof(usa_arpa),
	sizeof(uk_arpa),
	sizeof(spanish_arpa),
	sizeof(german_arpa),
	sizeof(la_arpa),
	sizeof(french_arpa)
};

/*unsigned int arpabet_lang_flags[] = {
	LANG_english,
	LANG_british,
	LANG_spanish,
	LANG_german,
	LANG_latin_american,
	LANG_french
	};*/

unsigned int arpabet_lang_fonts[] = {
	PFUSA,
	PFUK,
	PFSP,
	PFGR,
	PFLA,
	PFFR
};

int look_for_prefix(char p1, char p2);


main(int argc,char *argv[])

{
#if defined __linux__ || defined __osf__
	char	fnam_t[255], fnam_d[255];
#else
	char	fnam_t[_MAX_FNAME], fnam_d[_MAX_FNAME];
#endif

	unsigned int next;
	FarPointer	tl; /* tek 11feb99 be portable */
	long	sizes;
	int iI;

/*
 *  check out the input line parameters ...
 */
	printf("DECtalk-pc user dictionary compiler version 2.0\n");
	printf("Last Revised April 24, 2000\n");
	if (argc < 2)
	  {
	    printf("\nUsage : user_dic <input text file> <output dictionary file>\n");
	    exit(1);
	  }

/*
 *  open the build file ...
 */

	arpabet = arpabet_arrays[main_lang];

	strcpy(fnam_t,argv[1]);


	text_bytes = free_ent =  0;

	first_ent = 0xffff;

	/* open the output dictionary file.. */
	if(argc > 2)
		strcpy(fnam_d,argv[2]);
	else
		strcpy(fnam_d,argv[1]);

	iI = strcspn(fnam_d,".");
	strcpy(&fnam_d[iI],".dtu");
	if ((fdic=fopen(fnam_d,"w+b")) == NULL)
		{
		printf("\n Can't open user dictionary file : %s",fnam_d);
		exit(1);
		}
	/* do the read/construct */
	ReadAndAlphabetize(fnam_t);


	   
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
		unsigned long ulTemp;
		/* make sure we didn't overflow the segment.. */
		ulTemp=(free_ent*4)+entries[next].text;
		if (ulTemp > 0xFFFF)
		{
			scan_error("Compiled dictionary exceeds 64K!");
		}
		tl.segoff.segment = 0;
		tl.segoff.offset = (unsigned short)(ulTemp);
		fwrite(&tl,4,1,fdic);
		}
	fwrite(&dict_text[0],text_bytes,1,fdic);
	printf("\nComplete.  %d entries in %d total bytes\n",free_ent,text_bytes);
	fclose(fdic);
	return(0); /* tek 11feb99 we should set exitstatus..*/
}

/**********************************************************************
 *  sort_entry() sets the flink/blink for the current entry ...
 */


void sort_entry()
{
	unsigned char *ct,*dt;
	unsigned int *blink,next;

	blink = &first_ent;
	next = first_ent;
	while(next != 0xffff)
		{
		ct = &dict_text[ENT.text];
		dt = &dict_text[entries[next].text];
/* mfg 02/06/98 fixed duplicate entry to hit correctly */
		while (*ct != 0x00 && *dt != 0x00)
			{
			if(case_upper[*ct] != case_upper[*dt])
				break;
			ct += 1;
			dt += 1;
			}
		if(*ct == 0x00 && *dt == 0x00)
			scan_error("Duplicate entry");
		if((case_upper[*ct] < case_upper[*dt]) || (*ct == 0x00))
			{
			break;
			}
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

void scan_entry(char *szIn)
{
	unsigned char c;
	unsigned int iI=0;

	if(free_ent == UDICT_MAX_ENTS)
		scan_error("Too many entries");
	/* take the string we were passed and put it in the line global..*/
	for (iI=0;szIn[iI]!='\0';iI++)
	{
		line[iI] = szIn[iI];
	}
	/* to be consistent with the DOS version, fill in the rest of the line. */
	for (;iI<256;iI++)
		line[iI]='\0';

	curr_char=0; /* start at the beginning of the line.. */

	ENT.text = text_bytes;
	while(true)
		{
		c = get_alpha();
		if(c == ' ')
			break;
		else
			push_entry(c);
		}
	push_entry(0x00);
	c = non_white();
	if(c == '[')
		to_arpabet();
	else if(c == '{')   
		to_ascky();
	else
		scan_error("Unknown phoneme type");
	push_entry(0xff);

}


/*
 *  single character phoneme conversion ...
 */


void to_ascky()
{
	unsigned char ph;

	while(line[curr_char] != '\0')
		{
		ph = non_white();
		if(ph == '}')	 
			{
			/*clean up and terminate*/
			push_entry('\0');
			return;
			}
		lookup_ascky(ph);
		}
	scan_error("No ascky terminator found");
}

void lookup_ascky(unsigned char ph)
{
	int	i;	

	for(i=0;i<NPTAB;i++)
		if(ph == ptab[i].p_graph)
			{
			push_entry(ptab[i].p_phone_phone);
			return;
			}
	scan_error("Unknown ascky phoneme found");
}


/*
 *  this routine scans the input line for arpabet phonemes ...
 */


void to_arpabet()
{
  unsigned char ph1='\0',ph2='\0';
  int count;
  int restarted = FALSE;
  int temp_curr_char;
  
  temp_curr_char = curr_char;
  temp_text_bytes = text_bytes;
  
  count = 2;
  while(line[curr_char] != '\0')
    {
      if(count==2)
	ph1 = non_white();
      if(ph1 == ']')
	{
	  multi_lang_phon = FALSE;
	  start_of_entry = TRUE;
	  push_entry('\0');
	  return;
	}
      /* tek 16feb99 make this work correctly with single-character arpa */
      /* phonemes followed by a space */
      if (line[curr_char] == ' ')
	{
	  ph2=' '; /* space allows non-distinct first chars.. */
	}
      else
	{
	  ph2 = non_white();
	}
      
      
      if(look_for_prefix(ph1, ph2))
	{
	  ph1 = non_white();
	  if(ph1 == ']')
	    {
	      multi_lang_phon = FALSE;
	      start_of_entry = TRUE;
	      push_entry('\0');
	      return;
	    }
	  if (line[curr_char] == ' ')
	    {
	      ph2=' ';
	    }
	  else
	    {
	      ph2 = non_white();
	    }
	}

      if( (multi_lang_phon && restarted) || (!multi_lang_phon) )
	{
	  count = lookup_arpabet(ph1,ph2);
	  if(count == 0)
	    {
	      fprintf(stderr, "p1:%c  p2:%c\n", ph1, ph2);
	      scan_error("Unknown arpabet phoneme. Bite me.");
	    }
	  
	  if(count == 1)
	    ph1 = ph2;
	  if (ph2==']')
	    {
	      /*clean up and terminate*/
	      multi_lang_phon = FALSE;
	      start_of_entry = TRUE;
	      push_entry('\0');
	      return;
	    }
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
}

int lookup_arpabet(unsigned char p1,unsigned char p2)
{
  int	i;
  
  if(p1 >= 'A' && p1 <= 'Z')
    {
      p1 |= 0x20;
    }
  if(p2 >= 'A' && p2 <= 'Z')
  {
    p2 |= 0x20;
  }

  
  for(i=0; i<arpabet_sizes[main_lang]; i+=2)
    {
      //      fprintf(stderr, "a1:[%c]  a2:[%c]\n", arpabet[i], arpabet[i+1]);
      if(p1 == arpabet[i] && p2 == arpabet[i+1])
	{
	  push_entry(i/2);
	  return(2);
	}
    }
  for(i=0; i<arpabet_sizes[main_lang]; i+=2)
  { 
    //fprintf(stderr, "a1:[%c]  a2:[%c]\n", arpabet[i], arpabet[i+1]);
    if(p1 == arpabet[i] && arpabet[i+1] == ' ')
      {
	push_entry(i/2);
	return(1);
      }
  }
  return(0);
}

/*
 *  scan_error() is used to display an error message during the building
 *  of the user dictionary ...
 */

void scan_error(char *es)
{
	int	i;

	printf("\nError in line: %s",es);
	printf("\n--> %s",line);
	printf("\n    ");
	for(i=0;i<curr_char-1;i++)
		printf(" ");
	printf("^");
	fclose(fdic);
	exit(1);
}

/*
 *  non_white() is used to return the next non white space character
 *  and bump the pointer ...
 */

unsigned char non_white()
{
	while(line[curr_char] == ' ' || line[curr_char] == '\t')
		curr_char++;
	return(line[curr_char++]);
}

/*
 *  This routine checks for legal graphemes in the user dict grapheme
 *  string.
 */

unsigned char get_alpha()
{
	if(legal_alpha(line[curr_char]))
			return(line[curr_char++]);
	if(line[curr_char] == ' ' || line[curr_char] == '\t')
		return(' ');
	scan_error("Unknown alphabetic character");
}

unsigned char legal_graphs[] = "_-()&@*!\\/'";

int legal_alpha(char c) /* tek 11feb99 declare return type.. */
{
			/* really allow any grapheme except ' ','\n' MGS */
/*	int	i;
	if((c >= 'a' && c <= 'z')	||
		 (c >= 'A' && c <= 'Z') ||
		  (c >= '0' && c <= '9'))
			return(true); */
/*	for(i=0;i<sizeof(legal_graphs);i++)
		if(c == legal_graphs[i])
			return(true);	 eab allow any grapheme except  ' ','\n','	'*/
			
	if(c == ' ' || c == '\n' || c == '	')
		return(false);
	return(true);
}



void push_entry(unsigned char c)
{
  if(!multi_lang_phon)
    {
      if(text_bytes == UDICT_MAX_TEXT)
	{  
	  scan_error("Dictionary too big");
	  return;
	}
      dict_text[text_bytes++] = c;
#ifdef DEBUG1
      printf("%c %d \n",dict_text[text_bytes-1],dict_text[text_bytes-1]);
#endif
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

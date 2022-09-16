/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1998. All rights reserved.
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
 *    File Name:	usedic.c
 *    Author:		
 *    Creation Date:
 *
 *    Functionality:
 *		User dictionary compiler ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date		Description
 * ---	----	-----------	--------------------------------------------
 * 001	TQL		04/02/1997	For BATS #302.  Fixed the d_dentalized symbol.
 * 							For BATS #325.  Added ptab and arpabet tables for
 *							SPANISH and GERMAN. Also changed the upper_case[]
 *							table to handle all languages.
 * 002	GL		07/18/1997	For BATS#372 and 373 to allow all the alphabet and "."
 *							also use "unsigned char" for legal_alpha() argument
 * 003	GL		10/20/1997	Add ENGLISH_UK support.
 * 004  GL		10/28/1997  Add ir,er,ar,or,ur,df for US.
 * 005	MGs		01/07/1998	Converted to ML support
 * 006  JAW		02/04/1998  For BATS #252.  When compiling, dictionary files are now closed before
 *                          the Success box is displayed.
 * 007  MFG		02/06/1998  BATS #592 had the legal char ignore appostrophy "'"
 * 008  NAL		06/22/2000	Changes for integrated phoneme set
 * 009	CAB		10/26/2000	Added copyright info
 * 010	CAB		02/21/2001	Added French
 */



#include <windows.h>

#include "resource.h"
#include <commdlg.h>
#include <mmsystem.h>
#include <stdio.h>
#include <tchar.h>	      // For TCHAR types
// CB ADDED file
#include <commctrl.h>	  // Command bar menu
#include <string.h>
#include <stdlib.h>
#include <process.h>
#include <afxwin.h>			// For GetMenu() fn 
#include <wingdi.h>			// For GetStockObject()
#include "dlgs.h"
#include "cderr.h"


#include <ctype.h> 
#include <time.h>
#include <malloc.h>
#include "port.h"
#include "cmd.h"
#include "tts.h"
#include "ttsapi.h"
#include "windic.h"

// CB ADDED in ttsapi.h
// U32 TextToSpeechReserved3(LPTTS_HANDLE_T phTTS, int type, char *data, int max_size);


/* Arpabet tables */
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

//extern "C"
//{
extern 	int current_language;
//}

int main_phon_lang;

// Main language for the current dictionary being compiled
#define MAIN_PHON_US 0
#define MAIN_PHON_UK 1
#define MAIN_PHON_SP 2
#define MAIN_PHON_GR 3
#define MAIN_PHON_LA 4
#define MAIN_PHON_FR 5



/*
* general defines 
*/

//#define	true	1
//#define	false   0
//#define	failure 1
//#define	success 0

/* User dictionary structure and size defines ... */

#define  AVERAGE_WORD_LENGTH  20

typedef struct dict_link
{
	U32     	text;
	unsigned int	link;
} DICT_LINK_T;

unsigned int first_ent;

unsigned int uiMaxDictEntries;
unsigned int uiMaxTextLength;

unsigned char *	pDictText;
unsigned int text_bytes;

DICT_LINK_T * pEntries;    /* sort array */
unsigned int free_ent;

unsigned int line_number;
unsigned char line[256];
int curr_char;

HANDLE hTab, hDic;		// For creating.tab and .dic files
FILE	*ftab,*fdic;

HWND hWnd;

/* the phtts pointer to be bale to get the phoneme tables */
extern LPTTS_HANDLE_T phTTS[10];
extern int tts_cur;

unsigned char  *arpabet=NULL;

//unsigned char	LANG_flag;
BOOL			multi_lang_phon = FALSE;
BOOL			start_of_entry = TRUE;

/*
 *  single character phoneme conversion ...
 */

typedef	struct PTAB
{
	char	p_graph;		/* Graphic code.		*/
	char	p_phone;		/* Phonemic code.		*/
}	PTAB;


static PTAB	*ptab=NULL;			/* Phoneme name table (again)	*/


int arpa_size;
int NPTAB;
int asky_size;
int phon_lang;

/*
 *  prototypes ...
 */

BOOL to_ascky();
BOOL lookup_ascky(unsigned char);
BOOL to_arpabet();
int lookup_arpabet(unsigned char, unsigned char);
BOOL push_entry(unsigned char);
unsigned char non_white();
unsigned char get_alpha();
BOOL scan_entry();
BOOL sort_entry();
BOOL get_entry();
BOOL scan_error( TCHAR *);
BOOL legal_alpha( unsigned char );
BOOL look_for_prefix(char, char);


/* Tables for the integrated phoneme set */
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

//unsigned char	*arpabet=NULL;

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
LANG_latin_american
};*/

unsigned int arpabet_lang_fonts[] = {
	PFUSA,
	PFUK,
	PFSP,
	PFGR,
	PFLA,
	PFFR
};


/*
 *  Upper case folding table ...  sort of like above but only the 
 *  lower case ascii is folded to upper and the full eight bits are
 *  kept.
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
	'À',		'Á',		'Â',		'Ã',		'Ä',		'Å',		0xe6,		'Ç',
	'È',		'É',		'Ê',		'Ë',		'Ì',		'Í',		'Î',		'Ï',
	0xf0,		'Ñ',		'Ò',		'Ó',		'Ô',		'Õ',		'Ö',		0xf7,
	'Ø',		'Ù',		'Ú',		'Û',		'Ü',		'Ý',		0xfe,		0xff
};


BOOL UserDic( HWND hWindow, UINT uiDictEntries, UINT uiTextLength, TCHAR *fnam_t, TCHAR *fnam_d )
{
	int	i;
	unsigned int next;
	U32     tl;
	U32     sizes;
	TCHAR   szMsg[256];
	HANDLE hFile = L'\0';

	hWnd = hWindow;

	switch(current_language)	// Use the current_language info to work with the above tables
	{
	case ID_LANGUAGE_ENGLISH:
		main_phon_lang = MAIN_PHON_US;
		break;
	case ID_LANGUAGE_SPANISH:
		main_phon_lang = MAIN_PHON_SP;
		break;
	case ID_LANGUAGE_GERMAN:
		main_phon_lang = MAIN_PHON_GR;
		break;
	case ID_LANGUAGE_LATIN_AMERICAN:
		main_phon_lang = MAIN_PHON_LA;
		break;
	case ID_LANGUAGE_BRITISH:
		main_phon_lang = MAIN_PHON_UK;
		break;
	case ID_LANGUAGE_FRENCH:
		main_phon_lang = MAIN_PHON_FR;
		break;
	default:
		swprintf(szMsg, L"Bad language ID!" , fnam_t );
		MessageBox( hWnd, szMsg, L"Error", MB_OK | MB_ICONSTOP );
		return(FALSE);
	}

	
	if (arpabet != NULL)
	{
		free(arpabet);
		arpabet = NULL;
	}

	arpabet=(unsigned char *)malloc(arpabet_sizes[main_phon_lang]*sizeof(char));
	if (arpabet == NULL)
	{
		wsprintf(szMsg, L"Unable to allocate enough memory."
			L"\n\nCompile was unsuccessful.");
		MessageBox( hWnd, szMsg, L"Error", MB_OK | MB_ICONSTOP );
		return FALSE;
	}

	arpabet = arpabet_arrays[main_phon_lang];

	asky_size = TextToSpeechReserved3(phTTS[tts_cur], 3, NULL, 0);
	if (ptab != NULL)
	{
		free(ptab);
		ptab = NULL;
	}
	
	ptab = (PTAB *)malloc(asky_size * sizeof(char));
	if (ptab == NULL)
	{
	    wsprintf(szMsg, L"Unable to allocate enough memory."
		         L"\n\nCompile was unsuccessful.", fnam_t );
		MessageBox( hWnd, szMsg, L"Error", MB_OK | MB_ICONSTOP );
		return FALSE;
	}
	
	if (TextToSpeechReserved3(phTTS[tts_cur], 4, (char *)ptab,asky_size) < 0)
	{
	    wsprintf(szMsg, L"Unable to retrieve phoneme table."
		         L"\n\nCompile was unsuccessful.", fnam_t );
		MessageBox( hWnd, szMsg, L"Error", MB_OK | MB_ICONSTOP );
		return FALSE;
	}

	NPTAB = asky_size / sizeof(PTAB);

	/********************************************************************/
	/*  Allocate memory for dictionary data and entries.                */
	/********************************************************************/

	uiMaxDictEntries = uiDictEntries;
	uiMaxTextLength = uiTextLength;
	
	pEntries = (DICT_LINK_T *)malloc(uiDictEntries * sizeof(DICT_LINK_T));
	pDictText = (unsigned char *)malloc(uiTextLength * sizeof(char));
	
	if (( pEntries == NULL ) || ( pDictText == NULL ))
	{
		wsprintf(szMsg, L"Unable to allocate enough memory."
                 L"\n\nCompile was unsuccessful.", fnam_t );
		MessageBox( hWnd, szMsg, L"Error", MB_OK | MB_ICONSTOP );
		
		
		free( pEntries );
		free( pDictText );

		return FALSE;
	}

	/*
	*  check out the input line parameters ...
	*/
	/*	printf("DECtalk user dictionary compiler version 1.0\n");
	if (argc < 2)
	{
	printf("\n Usage : userdic <input text file>");
	printf(" <output dictionary file>\n");
	exit(1);
	}
	*/
	/*
	*  open the build file ...
	*/

	/*	strcpy(fnam_t,argv[1]);
	i = strcspn(fnam_t,".");
	strcpy(&fnam_t[i],".tab");
	*/
	
	
	if ( (ftab = _wfopen(fnam_t, L"r")) == NULL )
	{
		wsprintf(szMsg, L"Input dictionary table file %s\ncan not be found."
			     L"\n\nCompile was unsuccessful.", fnam_t );
		MessageBox( hWnd, szMsg, L"Error", MB_OK | MB_ICONSTOP );
		return FALSE;
	}


	/*	if(argc > 2)
		strcpy(fnam_d,argv[2]);
	else
		strcpy(fnam_d,argv[1]);
	*/

	i = wcscspn(fnam_d, L".");
	wcscpy(&fnam_d[i], L".dic");
	if ( (fdic = _wfopen(fnam_d, L"w+b")) == NULL  )					//|| (SizeOfFile == 0xFFFFFFFF)  )
	{
		wsprintf( szMsg, L"Can't open user dictionary file %s\nCompile was unsuccessful.",
			      fnam_d );
		MessageBox( hWnd, szMsg, L"Error", MB_OK | MB_ICONSTOP );
		return FALSE;
	}

	text_bytes = free_ent = line_number = 0;
    first_ent = 0xFFFFFFFF;


	while( get_entry() )
	{
		if( !scan_entry())
		{
			free( pEntries );
			free( pDictText );
			
	        // Delete 0 byte file
			DeleteFile(fnam_d);
			return FALSE;
		}
		
		if( !sort_entry())
		{
			free( pEntries );
			free( pDictText );
			
			      // Delete 0 byte file
			      DeleteFile(fnam_d);
                  return FALSE;
		}
	}
	

	//  convert the sizes to longs for the write	...
	sizes = free_ent;

	fwrite(&sizes, 4, 1, fdic);
	sizes = text_bytes;
	
	fwrite(&sizes, 4, 1, fdic);

	//  expand the links to far pointer ... when this is loaded, the first
	//	text byte will be 4*number of links, so add this to each offset and
	//	write a zero out for the segment to be fixed up by the loader.
 
	for( next = first_ent; next != 0xFFFFFFFF; next =(pEntries+next)->link )
	{
		tl = (pEntries+next)->text-4;
		fwrite(&tl, 4, 1, fdic);
	}

	fwrite(pDictText, text_bytes, 1, fdic);
	

	fclose(fdic);
	fclose(ftab);
	wsprintf( szMsg, L"Saving text file as %s\n\nSaving dictionary file as %s\n\n",
	   		  fnam_t, fnam_d );
	wsprintf( &szMsg[wcslen(szMsg)], L"Compiled %d user dictionary entries into %d bytes.",
		      free_ent, text_bytes);
	MessageBox( hWnd, szMsg, L"Success!", MB_OK );


	free( pEntries );
	free( pDictText );
	
	return TRUE;
	
}

/* ********************************************************************************************* */
/*  sort_entry() sets the flink/blink for the current entry ...
/* ********************************************************************************************* */
BOOL sort_entry()
{
	unsigned char *ct, *dt;
	unsigned int *blink, next;

	blink = &first_ent;
	next = first_ent;
	while(next != 0xFFFFFFFF)
	{
		ct = pDictText+((pEntries+free_ent)->text);
		dt = pDictText+((pEntries+next)->text);
		while (*ct != 0x00 && *dt != 0x00)
		{
			if(case_upper[*ct] != case_upper[*dt])
			{
				break;
			}
			ct += 1;
			dt += 1;
		}
		if(*ct == 0x00 && *dt == 0x00)
		{
			return( scan_error(L"Duplicate entry"));
		}

		if((case_upper[*ct] < case_upper[*dt]) || (*ct == 0x00))
		{
			break;
		}

		if(case_upper[*ct] > case_upper[*dt])
		{
			blink = &((pEntries+next)->link);
			next = (pEntries+next)->link;
		}
	}
	(pEntries+free_ent)->link = next;
	*blink = free_ent;
	free_ent+=1;
	return( TRUE );
}


/* ****************************************************************************************** *
 *  scan_entry_line() takes the input text and makes it into a
 *  valid dictionary entry ...
 *     entry format is ...
 *
 *  <entry> [2 char phonemes]
 *  <entry> {1 char phonemes}
 * ****************************************************************************************** */
BOOL scan_entry()
{
	unsigned char c;

	if(free_ent == uiMaxDictEntries )
	{
		return( scan_error(L"Too many entries"));
	}

	(pEntries+free_ent)->text = text_bytes;
	while(true)
	{
		c = get_alpha();
	
		if(c == ' ')
		{
		    break;
		}
		else 
			if(c == (unsigned char)NULL )
				return( scan_error(L"Bad alphabetic character") );	
		else 
			if( !push_entry(c))
				return( FALSE );
	}



	if( !push_entry(0x00))
	{
		return( FALSE );
	}
	
	c = non_white();
	if(c == '[')
	{
		return( to_arpabet() );
	}
	else if(c == '{')
	{
		return( to_ascky());
	}
	else
	{
		return( scan_error(L"Unknown phoneme type") );
	}	
	return ( TRUE );
}

/*
 *  get_entry() reads in a line from the file and returns it to
 *  the caller if it is a dictionary entry.
 */
BOOL get_entry()
{
	curr_char = 0;
	while(fgets( (char*)line, sizeof(line), ftab ) )
	{
		line_number += 1;
		if(legal_alpha(line[0]))
			return TRUE;
	}
	return FALSE ;
}

BOOL to_ascky()
{
	unsigned char ph;

	while(line[curr_char] != '\0')
	{
		ph = non_white();
		if(ph == '}')
		{
			return TRUE ;
		}

		if( !lookup_ascky(ph))
		{
			return FALSE ;
		}
	}
	return( scan_error(L"No ascky terminator found")) ;
}
/* ************************************END OF:to_ascky()**************************************** */

BOOL lookup_ascky(unsigned char ph)
{
	int	i;

	for(i = 0; i < NPTAB; i++)
	{
		if(ph == ptab[i].p_graph)
		{
			return( push_entry(ptab[i].p_phone));
		}
	}
	return ( scan_error(L"Unknown ascky phoneme found"));
}


/*
 *  this routine scans the input line for arpabet phonemes ...
 */


BOOL to_arpabet()
{
	BOOL restarted = FALSE;
	unsigned char ph1,ph2,count;
	int temp_curr_char;
	unsigned int temp_text_bytes;
	
	temp_curr_char  = curr_char;	// Need to remember the first place in line for restart
	temp_text_bytes = text_bytes;	// as well as the staring point in the dic

	count = 2;
	while(( line[curr_char] != '\0' ) || ( line[curr_char] != EOF ))
	{
		
		if(count == 2)
		{
			ph1 = non_white();
		}
		if(ph1 == ']')
		{
			multi_lang_phon = FALSE;
			start_of_entry = TRUE;
			push_entry(0);  /* WIH Added 12/7/93 */
			return( TRUE );
		}
		ph2 = non_white();
		
		if(look_for_prefix(ph1,ph2))
		{
			ph1 = non_white();
			if(ph1 == ']')
			{
				multi_lang_phon = FALSE;
				start_of_entry = TRUE;
				push_entry(0);  /* WIH Added 12/7/93 */
				return( TRUE );
			}
			ph2 = non_white();
		}
		
		if( (multi_lang_phon && restarted) || (!multi_lang_phon) )
		{
			
			count = lookup_arpabet(ph1,ph2);
			if(count == 0)
				return( scan_error(L"Unknown arpabet phoneme"));
			if(count == 1)
				ph1 = ph2;
		}
		
		if( multi_lang_phon && !restarted)
		{
			restarted = TRUE;
			curr_char = temp_curr_char;
			text_bytes = temp_text_bytes;
			count = 2;
		}
	}
	return( scan_error(L"No arpabet terminator found"));
}

int lookup_arpabet(unsigned char p1, unsigned char p2)
{
	unsigned int	i;

	if(p1 >= 'A' && p1 <= 'Z')
	{
		p1 |= 0x20;
	}

	if(p2 >= 'A' && p2 <= 'Z')
	{
		p2 |= 0x20;
	}
	for(i=0;i<arpabet_sizes[phon_lang];i+=2)

		if(p1 == arpabet[i] && p2 == arpabet[i+1])
		{
			if( !push_entry(i/2))
			{
				return( 0 );
			}
			return(2);
		}
	for(i=0;i<arpabet_sizes[phon_lang];i+=2)

		if(p1 == arpabet[i] && arpabet[i+1] == ' ')
		{
			if( !push_entry(i/2) )
			{
				return( 0 );
			}
			return(1);
		}
	return(0);
}


/*
 *  scan_error() is used to display an error message during the building
 *  of the user dictionary ...
 */
BOOL scan_error(TCHAR *es)
{
	 static TCHAR szError[128];
	 TCHAR temp[256];		// Stores line as TCHAR
	
	// Converts from multibyte to wide char
	
	mbstowcs(temp, (char *)line, 256);

	wsprintf( szError, L"Error at line %d : %s\n--> %s", line_number, es, temp);
	MessageBox( hWnd, szError, L"Dictionary compiler error", MB_OK | MB_ICONSTOP );
	
	
	fclose(ftab);
	fclose(fdic);
	return FALSE;
}
/* ***********************************END OF: scan_error()*************************************** */

/*
 *  non_white() is used to return the next non white space character
 *  and bump the pointer ...
 */

unsigned char non_white()
{
	while(line[curr_char] == ' ' || line[curr_char] == '\t')
	{
		curr_char++;
	}
	return(line[curr_char++]);
}

/*
 *  This routine checks for legal graphemes in the user dict grapheme
 *  string.
 */
unsigned char get_alpha()
{
	if(legal_alpha(line[curr_char]))
	{
		return (line[curr_char++]);
	}
	
	if(line[curr_char] == ' ' || line[curr_char] == '\t')
	{
		return(' ');
	}
	scan_error(L"Unknown alphabetic character");
	return( (unsigned char) NULL );
}

unsigned char legal_graphs[] = "._-()&@*!\\/'";

BOOL legal_alpha(unsigned char c)
{
	/* mfg allow any grapheme except  ' ','\n','\t'*/
    if(c == ' ' || c == '\n' || c == '\t')
    {
		return false;
	}
	return true;
}



BOOL push_entry(unsigned char c)
{
	if(!multi_lang_phon)
	{
		if(text_bytes == uiMaxTextLength)
			return( scan_error(L"Dictionary too big") );
		
		*(pDictText + text_bytes++) = c;
	}
	else	
	{
		if(text_bytes+1 >= uiMaxTextLength)
			return( scan_error(L"Dictionary too big") );
		
		if(start_of_entry)
		{
			*(pDictText + text_bytes++) = 0xFF;			// Start entry with FF to signify a 2 byte/phon entry
			start_of_entry = FALSE;
		}

		*(pDictText + text_bytes++) = arpabet_lang_fonts[phon_lang];	// What language
		*(pDictText + text_bytes++) = c;								// The phoneme
	}
	
	return( TRUE );
}

/* look_for_prefix checks to see if the phoneme is part of the extended multi-language
/* set and points lookup_arpabet to the proper phoneme table. Otherwise, makes
/* sure that it's pointing at the main table for the language*/
BOOL look_for_prefix(char p1, char p2)
{
	int i;
	
	for(i=0; i<language_size; i+=2)
	{
		if(p1 == language_prefixes[i] && p2 == language_prefixes[i+1])
		{
			if(line[curr_char] == '_')
			{
				if(!multi_lang_phon)
					multi_lang_phon = TRUE;
				
				curr_char++;	// Move past the underscore
				phon_lang = i/2;
				
				arpabet = arpabet_arrays[phon_lang];
				return TRUE;
			}
		}
	}
	
	phon_lang = main_phon_lang;
	arpabet = arpabet_arrays[phon_lang];
	return FALSE;
}

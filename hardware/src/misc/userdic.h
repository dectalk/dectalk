/*                          
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996,1999. All rights reserved.
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
 *    File Name:	userdic.h
 *    Author:		Matthew Schnee
 *    Creation Date:02/02/96
 *
 *    Functionality:
 *  	Header file for userdic.exe suserdic.exe guserdic.exe
 *		Changed to this file impact userdic.c guserdic.c and suserduc.c
 *
 ***********************************************************************
 *    Revision History:
 *	001	02/02/96	Removed tables from userdic.c and placed them here
 * 					MGS
 *	002 03/25/97	for BATS#302
 *					EAB Changed definitions of FX and denatl d phonemes in arpa definition
 *					so that we could have a unified phonemic coding and to fix that 'd' in
 *					arpabet was used multiple times
 *  003 10/28/97    Add ir,er,ar,or,ur.df for US
 *  004 01/21/98    Added '^' array member to  arpabet[], BATS#561
 *	005 06/23/98	Added supoort for latin american
 *	006	11feb99		tek		correct a syntax typo. remove tables to 
 *							language-specific modules
 *	007	31mar99		tek remerge for NWS userdic; set up USERDIC_COMPILE macro
 */
/* propagate macros.. */
#ifdef SPANISH_SP
#define SPANISH_USERDIC
#define USERDIC_COMPILE
#endif

#ifdef GERMAN
#define GERMAN_USERDIC
#define USERDIC_COMPILE
#endif

#ifdef FRENCH
#define FRENCH_USERDIC
#define USERDIC_COMPILE
#endif

#ifdef ENGLISH_UK 
#define BRITISH_USERDIC
#define USERDIC_COMPILE
#endif

#ifdef  SPANISH_LA
#define LATIN_USERDIC
#define USERDIC_COMPILE
#endif
#ifdef  ENGLISH_US
#define ENGLISH_USERDIC
#define USERDIC_COMPILE
#endif

#ifndef SPANISH_LA
#ifndef GERMAN
#ifndef FRENCH
#ifndef ENGLISH_UK
#ifndef SPANISH_SP
#ifndef ENGLISH_US
#define ENGLISH_US /* default to english_us */
#define USERDIC_COMPILE
#define ENGLISH_USERDIC
#endif 
#endif
#endif
#endif
#endif
#endif


/* pick up Language-specific things.. */
#include "phonlist.h"


/*
 *  Upper case folding table ...
 */

unsigned char case_upper[] = { /* case table taken from lschar.c */

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
            

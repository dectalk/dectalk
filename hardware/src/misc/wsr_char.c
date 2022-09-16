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
 *    File Name:	wsr_char.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Each letter that is read in has certain characteristics associated with
 *  it.
 *
 ***********************************************************************
 *    Revision History:
 */

#include	"wsr.h"

unsigned char char_types[]= {

	MARK_null,					MARK_null,					/* 0x00 to 0x0f */	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_clause,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,					/* 0x10 to 0x1f */
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_punct+MARK_clause,		/* 0x20 to 0x2f */
	MARK_punct,					MARK_non_alpha,
	MARK_non_alpha,			MARK_non_alpha, 	
	MARK_null,					MARK_punct+MARK_clause,
	MARK_non_alpha,		  	MARK_non_alpha,  	
	MARK_non_alpha,			MARK_non_alpha,
	MARK_punct+MARK_clause,	MARK_punct,		
	MARK_punct+MARK_clause,	MARK_punct,
	MARK_digit,					MARK_digit,						/* 0x30 to 0x3f */
	MARK_digit,					MARK_digit,
	MARK_digit,					MARK_digit,
	MARK_digit,					MARK_digit,
	MARK_digit,					MARK_digit,
	MARK_punct+MARK_clause,	MARK_punct+MARK_clause,
	MARK_non_alpha,			MARK_non_alpha,	
	MARK_non_alpha,			MARK_punct+MARK_clause,
	MARK_non_alpha,			MARK_upper+MARK_vowel,	/* 0x40 to 0x4f */
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons,
	MARK_upper+MARK_cons,	MARK_upper+MARK_vowel,	
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons,
	MARK_upper+MARK_cons,	MARK_upper+MARK_vowel,	
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons,
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons,	
	MARK_upper+MARK_cons,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons,	/* 0x50 to 0x5f */			
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons,
	MARK_upper+MARK_cons,	MARK_upper+MARK_vowel,				
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons,
	MARK_upper+MARK_cons,	MARK_upper+MARK_cons+MARK_vowel,	
	MARK_upper+MARK_cons,	MARK_null,
	MARK_punct,					MARK_non_alpha,						
	MARK_non_alpha,			MARK_null,
	MARK_non_alpha,			MARK_vowel,					/* 0x60 to 0x6f */
	MARK_cons,					MARK_cons,
	MARK_cons,					MARK_vowel,	
	MARK_cons,					MARK_cons,
	MARK_cons,					MARK_vowel,
	MARK_cons,					MARK_cons,
	MARK_cons,					MARK_cons,
	MARK_cons,					MARK_vowel,
	MARK_cons,					MARK_cons,					/* 0x70 to 0x7f */					
	MARK_cons,					MARK_cons,
	MARK_cons,					MARK_vowel,					
	MARK_cons,					MARK_cons,
	MARK_cons,					MARK_cons+MARK_vowel,	
	MARK_cons,					MARK_non_alpha,
	MARK_non_alpha,			MARK_non_alpha,			
	MARK_non_alpha,			MARK_null,
	MARK_null,					MARK_null,					/* 0x80 to 0x8f */	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,					/* 0x90 to 0x9f */
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,					/* 0xa0 to 0xaf */
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,					/* 0xb0 to 0xbf */	
	MARK_digit,					MARK_digit,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_null,					MARK_null,	
	MARK_null,					MARK_null,
	MARK_digit,					MARK_digit,	
	MARK_digit,					MARK_null,
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,	/* 0xc0 to 0xcf */
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_null,					MARK_null,
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_null,					MARK_null,					/* 0xd0 to 0xdf */
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_vowel,	MARK_null,
	MARK_null,					MARK_upper+MARK_vowel,	
	MARK_upper+MARK_vowel,	MARK_upper+MARK_vowel,
	MARK_upper+MARK_vowel,	MARK_null,
	MARK_null,					MARK_null,
	MARK_vowel,					MARK_vowel,					/* 0xe0 to 0xef */			
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_vowel,			
	MARK_null,					MARK_null,			
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_vowel,			
	MARK_null,					MARK_null,					/* 0xf0 to 0xff */
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_null,			
	MARK_null,					MARK_vowel,			
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_vowel,			
	MARK_vowel,					MARK_null,			
	MARK_null,					MARK_null,			
};



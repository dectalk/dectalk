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
 *    File Name:	l_ac_con.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/13/96                                                   
 *                                                                             
 *    Functionality:        
 *	  acna prefix table
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001 	MGS		02/07/1996		Moved lswtab from ls5_acna.c to l_ac_con.c
 * 002  GL		03/14/1997		BATS#294, add stress refusal rule to fix all
 *								"disa-" stress problem. 
 */
  
#include "ls_def.h"

#ifdef ENGLISH_US

char name[64];
int name_size;

struct	langs	lp[NO_LANGS] = {

		{spanish, 0, 0, ' ', 0L, NAME_SPANISH},
		{english, 0, 0, ' ', 0L, NAME_ENGLISH},
		{irish, 0, 0, ' ', 0L, NAME_IRISH},
		{japan, 0, 0, ' ', 0L, NAME_JAPANESE},
		{french, 0, 0, ' ', 0L, NAME_FRENCH},
		{german, 0, 0, ' ', 0L, NAME_GERMANIC},
		{slavic, 0, 0, ' ', 0L, NAME_SLAVIC},
		{italian, 0, 0, ' ', 0L, NAME_ITALIAN}
};



unsigned char *name_types[] =  {

	"English",
	"French",
	"Germanic",
	"Irish",
	"Italian",
	"Japanese",
	"Slavic",
	"Spanish"

};

/*
 *  elimination rules force the language to english, since they are
 *  so small, they are hand entered ... briefly, the format is ...
 *  
 *		{ type, min, max }
 *
 *     where type is seg		(any single character)  		($)
 *		               voc<1-2>	(1 or 2 vowels)					(V)
 *                   con<1-n> (atleast one consonant)			(C)
 *                   con<0-n> (atleast one consonant)			(N)
 *                   bound 	(begin or end of word) 			(#)
 *                   any 		(anything goes)				 	(*)
 *
 *     Note that when we start the scan, the name is all lower case, so
 *     we can use upper chars for our tokens.
 */

unsigned char *elim_rules[] = {

	"eiC*",
	"CVN#",
	"eCVN#",
	"yCVN#",
	0
};

  

unsigned char	preftab[] = {
	-1,			2,				AA,	B,
	-1,			4+PCONT+P2SYL,	AH,	N,	D,	RR,
	-1,			2+PCONT,		AX,	N,
	-1,			3,				B,	AY,	D,
	-1,			3,				B,	AY,	F,
	-1,			3,				B,	AY,	K,
	-1,			3,				B,	AY,	LL,
	-1,			3,				B,	AY,	N,
	-1,			3,				B,	AY,	P,
	-1,			3,				B,	AY,	R,
	-1,			3,				B,	AY,	S,
	-1,			2+PRCON,		B,	EH,
	-1,			2+PRCON,		B,	IY,
	-1,			2+PRCON,		D,	EH,

	/* GL 03/14/1997 for BATS#294, add this rule to fix all
	   disa- word stress problem */
	-1,			4+PCONT+P2SYL,	D,	IH,	S, AE,

	-1,			3+PCONT,		D,	IH,	S,
	-1,			2+PRCON,		D,	IH,
	-1,			4,				D,	IX,	M,	EH,
	-1,			4,				D,	IX,	M,	IH,
	-1,			3,				D,	IX,	P,
	-1,			3,				D,	IX,	R,
	-1,			3,				D,	IX,	V,
	-1,			2+PRCON,		D,	IY,	
	-1,			2,				EH,	K,
	-1,			2,				EH,	M,
	-1,			2,				EH,	N,
	-1,			2,				EH,	R,
	-1,			3,				F,	AO,	R,
	NAME_IRISH,	4,				F,	IH,	T,	S,
	-1,			3,				K,	AA,	LL,
	-1,			3,				K,	AA,	M,
	-1,			3,				K,	AA,	N,
	-1,			3,				K,	AO,	R,
	-1,			4+PCONT+P2SYL,	IH,	N,	T,	RR,
	-1,			2+PCONT,		IH,	N,
	NAME_IRISH,	3,				M,	IX,	K,
	-1,			3+PCONT,		M,	IH,	S,
	-1,			3+PCONT,		N,	AA,	N,
	NAME_IRISH,	1,				OW,
	-1,			3+PCONT+P2SYL,	OW,	V,	RR,
	-1,			3,				P,	R,	AA,
	-1,			3,				P,	R,	IY,
	-1,			2+PCONT+PRCON,	R,	EH,
	-1,			3,				S,	AH,	P,
	-1,			3,				S,	AH,	S,
	-1,			5,				T,	R,	AE,	N,	S,
	-1,			3,				W,	IH,	TH,
	-1,			0	
};

#endif

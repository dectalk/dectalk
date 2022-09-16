/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.                                                                  
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
 * 003	MGS		04/13/2000		Changes for integrated phoneme set 
 * 004 	CAB		10/16/00		Changed copyright info
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
	-1,			2,				US_AA,	US_B,
	-1,			4+PCONT+P2SYL,	US_AH,	US_N,	US_D,	US_RR,
	-1,			2+PCONT,		US_AX,	US_N,
	-1,			3,				US_B,	US_AY,	US_D,
	-1,			3,				US_B,	US_AY,	US_F,
	-1,			3,				US_B,	US_AY,	US_K,
	-1,			3,				US_B,	US_AY,	US_LL,
	-1,			3,				US_B,	US_AY,	US_N,
	-1,			3,				US_B,	US_AY,	US_P,
	-1,			3,				US_B,	US_AY,	US_R,
	-1,			3,				US_B,	US_AY,	US_S,
	-1,			2+PRCON,		US_B,	US_EH,
	-1,			2+PRCON,		US_B,	US_IY,
	-1,			2+PRCON,		US_D,	US_EH,

	/* GL 03/14/1997 for BATS#294, add this rule to fix all
	   disa- word stress problem */
	-1,			4+PCONT+P2SYL,	US_D,	US_IH,	US_S, US_AE,
	-1,			3+PCONT,		US_D,	US_IH,	US_S,
	-1,			2+PRCON,		US_D,	US_IH,
	-1,			4,				US_D,	US_IX,	US_M,	US_EH,
	-1,			4,				US_D,	US_IX,	US_M,	US_IH,
	-1,			3,				US_D,	US_IX,	US_P,
	-1,			3,				US_D,	US_IX,	US_R,
	-1,			3,				US_D,	US_IX,	US_V,
	-1,			2+PRCON,		US_D,	US_IY,	
	-1,			2,				US_EH,	US_K,
	-1,			2,				US_EH,	US_M,
	-1,			2,				US_EH,	US_N,
	-1,			2,				US_EH,	US_R,
	-1,			3,				US_F,	US_AO,	US_R,
	NAME_IRISH,	4,				US_F,	US_IH,	US_T,	US_S,
	-1,			3,				US_K,	US_AA,	US_LL,
	-1,			3,				US_K,	US_AA,	US_M,
	-1,			3,				US_K,	US_AA,	US_N,
	-1,			3,				US_K,	US_AO,	US_R,
	-1,			4+PCONT+P2SYL,	US_IH,	US_N,	US_T,	US_RR,
	-1,			2+PCONT,		US_IH,	US_N,
	NAME_IRISH,	3,				US_M,	US_IX,	US_K,
	-1,			3+PCONT,		US_M,	US_IH,	US_S,
	-1,			3+PCONT,		US_N,	US_AA,	US_N,
	NAME_IRISH,	1,				US_OW,
	-1,			3+PCONT+P2SYL,	US_OW,	US_V,	US_RR,
	-1,			3,				US_P,	US_R,	US_AA,
	-1,			3,				US_P,	US_R,	US_IY,
	-1,			2+PCONT+PRCON,	US_R,	US_EH,
	-1,			3,				US_S,	US_AH,	US_P,
	-1,			3,				US_S,	US_AH,	US_S,
	-1,			5,				US_T,	US_R,	US_AE,	US_N,	US_S,
	-1,			3,				US_W,	US_IH,	US_TH,
	-1,			0	
};

#endif

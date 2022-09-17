/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.    
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.    
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	l_us_con.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:        
 *    DECtalk p3 and beyond ... constant tabular data is collected here
 *    just to make dealing with it a bit easier ...
 *    This file contains a number
 * 	  of canned phoneme strings. These are
 * 	  used by the number rules, etc.
 *    All are streams of bytes with a SI
 *    phoneme on the end.
                                                                         
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001  DGC		04/05/1985 		Changed [s] to [z] in "thousand".
 * 002  DGC		04/08/1985 		Added "pdegree".
 * 003  DGC		04/24/1985 		Fix some phomenes to agree with some
 *								dictionary changes.
 * 004  DGC		06/14/1985 		The "pplus" array isn't needed anymore.
 * 005  DGC		06/27/1985 		Remove last [d] from "thousand".
 * 006  DGC		07/24/1985 		[f'owr] to [f'or] and related forms.
 * 007  DGC		08/20/1985 		Undid 05; sounded bad.
 * 008  MGS		02/07/1996		Moved code from lsconst.c to l_us_con.c
 * 009	MGS		02/22/1996		ifdef out the lscrush table it is unused
 * 010	MGS		02/25/1996		moved sdic and whdic from ls_task.c
 * 011	MGS 	03/15/1996		Changed lsctype from unsigned int to U16
 * 012	MGS		05/23/1996		Added support for billion trillion quadrillion
 * 013  GL		01/02/1997		miss one "IGNORE" in lsctype[] before "degree symbol"
 * 014  GL		03/14/1997		BATS#294, add stress refusal rule to fix all
 *								"disa-" stress problem.
 * 015  GL      03/18/1997      BATS#300, add LS+RS for ' of lsctype[]
 * 016  GL      10/28/1997      Add NWSNOAA support for "for" pronunciation
 * 017  GL      02/10/1998      BATS#593 use "oh" for p0
 * 018  GL      10/21/1998      BATS#770 add "pthe" and "pof"
 * 019  GL      11/04/1998      BATS#478 use "Y" instead of "IY" for million, billion
 *                              trillion in nwdtab[]
 * 020	MGS		11/23/1998		BATS #329 fixed 02-apr-2001
 * 021  EAB		02/02/1999 		Fixed BATS 863 which corrected the number before 
								a quatitiy (hudred thousand ect ) from stressed to unstressed
								Plus Made NWSNOAA->NWS_US
								change to support more than nwsnooa for english only
 * 022  EAB		03/04/1999 		Correct typo in up8 
 * 023  GL		05/14/1999		BATS#865 create OHpunits[] for NWS_US 
 * 024	MGS		04/13/2000		Changes for integrated phoneme set 
 * 025  NAL		06/12/2000		Warning removal (FVELAR chnged to FLTSVELAR)
 * 026 	CAB		10/18/2000		Changed copyright info
 * 027  EAb 	03/22/2001		fix bats 945
 * 028 	CAB		03/26/2001		Updated copyright info
 * 029	MGS		04/11/2002		ARM7 port
 */
  
#include "ls_def.h"
  
/*
 * This rather large table is
 * used to obtain the attributes of characters
 * in the ASCII_G and DEC multinational character
 * set. It is indexed by character code, with ASCII_G
 * in GL, ASCII_C in C0, the DEC multinational set
 * in GR, and the supplimental control set in C1.
 * The major client of this table is the word
 * reading stuff.
 */ 
#ifdef OS_PALM 
#pragma pcrelconstdata off
#endif
const U16 lsctype[] = {

	IGNORE,				/* NUL							*/
	IGNORE,				/* SOH							*/
	IGNORE,				/* STX				            */
	IGNORE,				/* ETX				            */
	IGNORE,				/* EOT				            */
	IGNORE,				/* ENQ				            */
	IGNORE,				/* ACK				            */
	IGNORE,				/* BEL				            */
	BACKUP,				/* BS				            */
	NEVER,				/* HT				            */
	NEVER,				/* LF				            */
	NEVER,				/* VT				            */
	NEVER,				/* FF				            */
	NEVER,				/* CR				            */
	IGNORE,				/* SO				            */
	IGNORE,				/* SI				            */
	IGNORE,				/* DLE				            */
	IGNORE,				/* DC1				            */
	IGNORE,				/* DC2				            */
	IGNORE,				/* DC3				            */
	IGNORE,				/* DC4				            */
	IGNORE,				/* NAK				            */
	IGNORE,				/* SYN				            */
	IGNORE,				/* ETB				            */
	IGNORE,				/* CAN				            */
	IGNORE,				/* EM				            */
	IGNORE,				/* SUB				            */
	IGNORE,				/* ESC				            */
	IGNORE,				/* FS				            */
	IGNORE,				/* GS				            */
	IGNORE,				/* RS				            */
	IGNORE,				/* US				            */
	NEVER,		 		/* SP				            */
	MIGHT+PR,			/* !				            */
	ALWAYS+LS+RS+PR,	/* "				            */
	ALWAYS+PR,			/* #				            */
	ALWAYS+PR,			/* $				            */
	ALWAYS+PR,			/* %				            */
	ALWAYS+PR,			/* &				            */
	
        /* GL 03/18/1997 for BATS#300 add LS and RS for ' */
	ALWAYS+LS+RS+PR,	/* '				            */

	ALWAYS+LS+FB+PR,	/* (				            */
	ALWAYS+RS+FB+PR,	/* )				            */
	ALWAYS+PR,			/* *				            */
	ALWAYS+PR,			/* +				            */
	MIGHT+PR,		   	/* ,				            */
	ALWAYS+PR,			/* -				            */
	MIGHT+PR,     		/* .				            */
	ALWAYS+PR,			/* /				            */
	ALWAYS+PR,			/* 0				            */
	ALWAYS+PR,			/* 1				            */
	ALWAYS+PR,			/* 2				            */
	ALWAYS+PR,			/* 3				            */
	ALWAYS+PR,			/* 4				            */
	ALWAYS+PR,			/* 5				            */
	ALWAYS+PR,			/* 6				            */
	ALWAYS+PR,			/* 7				            */
	ALWAYS+PR,			/* 8				            */
	ALWAYS+PR,			/* 9				            */
	MIGHT+PR,			/* :				            */
	MIGHT+PR,			/* ;				            */
	ALWAYS+LS+FB+PR,	/* <				            */
	ALWAYS+PR,			/* =				            */
	ALWAYS+RS+FB+PR,	/* >				            */
	MIGHT+PR,			/* ?				            */
	ALWAYS+PR,			/* @				            */
	ALWAYS+UU+OO+PR,	/* A				            */
	ALWAYS+UU+C+PR,		/* B				            */
	ALWAYS+UU+C+PR,		/* C				            */
	ALWAYS+UU+C+PR,		/* D				            */
	ALWAYS+UU+OO+PR,	/* E				            */
	ALWAYS+UU+C+PR,		/* F				            */
	ALWAYS+UU+C+PR,		/* G				            */
	ALWAYS+UU+C+PR,		/* H				            */
	ALWAYS+UU+OO+PR,	/* I				            */
	ALWAYS+UU+C+PR,		/* J				            */
	ALWAYS+UU+C+PR,		/* K				            */
	ALWAYS+UU+C+PR,		/* L				            */
	ALWAYS+UU+C+PR,		/* M				            */
	ALWAYS+UU+C+PR,		/* N				            */
	ALWAYS+UU+OO+PR,	/* O				            */
	ALWAYS+UU+C+PR,		/* P				            */
	ALWAYS+UU+C+PR,		/* Q				            */
	ALWAYS+UU+C+PR,		/* R				            */
	ALWAYS+UU+C+PR,		/* S				            */
	ALWAYS+UU+C+PR,		/* T				            */
	ALWAYS+UU+OO+PR,	/* U				            */
	ALWAYS+UU+C+PR,		/* V				            */
	ALWAYS+UU+C+PR,		/* W				            */
	ALWAYS+UU+C+PR,		/* X				            */
	ALWAYS+UU+PR,		/* Y (-US_V, -C)		            */
	ALWAYS+UU+C+PR,		/* Z				            */
	ALWAYS+LS+FB+PR,	/* [				            */
	ALWAYS+PR,			/* \				            */
	ALWAYS+RS+FB+PR,	/* ]				            */
	ALWAYS+PR,			/* ^				            */
	ALWAYS+II+PR,		/* _				            */
	ALWAYS+PR,			/* `				            */
	ALWAYS+OO+PR,		/* a				            */
	ALWAYS+C+PR,		/* b				            */
	ALWAYS+C+PR,		/* c				            */
	ALWAYS+C+PR,		/* d				            */
	ALWAYS+OO+PR,		/* e				            */
	ALWAYS+C+PR,		/* f				            */
	ALWAYS+C+PR,		/* g				            */
	ALWAYS+C+PR,		/* h				            */
	ALWAYS+OO+PR,		/* i				            */
	ALWAYS+C+PR,		/* j				            */
	ALWAYS+C+PR,		/* k				            */
	ALWAYS+C+PR,		/* l				            */
	ALWAYS+C+PR,		/* m				            */
	ALWAYS+C+PR,		/* n				            */
	ALWAYS+OO+PR,		/* o				            */
	ALWAYS+C+PR,		/* p				            */
	ALWAYS+C+PR,		/* q							*/
	ALWAYS+C+PR,		/* r							*/
	ALWAYS+C+PR,		/* s							*/
	ALWAYS+C+PR,		/* t							*/
	ALWAYS+OO+PR,		/* u							*/
	ALWAYS+C+PR,		/* v							*/
	ALWAYS+C+PR,		/* w							*/
	ALWAYS+C+PR,		/* x							*/
	ALWAYS+PR,			/* y (-US_V, -C)					*/
	ALWAYS+C+PR,		/* z							*/
	ALWAYS+LS+FB+PR,	/* {							*/
	ALWAYS+PR,			/* |							*/
	ALWAYS+RS+FB+PR,	/* }							*/
	ALWAYS+PR,			/* ~							*/
	IGNORE,				/* DEL							*/
	ALWAYS+PR,			/* euro symbol                  */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,				/* IND							*/
	IGNORE,				/* NEL							*/
	IGNORE,				/* SSA							*/
	IGNORE,				/* ESA							*/
	IGNORE,				/* HTS							*/
	IGNORE,				/* HTJ							*/
	IGNORE,				/* VTS							*/
	IGNORE,				/* PLD							*/
	IGNORE,				/* PLU							*/
	IGNORE,				/* RI							*/
	IGNORE,				/* SS2							*/
	IGNORE,				/* SS3							*/
	IGNORE,				/* DCS							*/
	IGNORE,				/* PU1							*/
	IGNORE,				/* PU2							*/
	IGNORE,				/* STS							*/
	IGNORE,				/* CCH							*/
	IGNORE,				/* MW							*/
	IGNORE,				/* SPA							*/
	IGNORE,				/* EPA							*/
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,				/* CSI							*/
	IGNORE,				/* ST							*/
	IGNORE,				/* OSC							*/
	IGNORE,				/* PM							*/
	IGNORE,				/* APC							*/
	NEVER+PR,			/* SP							*/
	ALWAYS+LS+PR,		/* Inverted !					*/
	ALWAYS+PR, 			/* Cent symbol					*/
	ALWAYS+PR,			/* UK currency symbol 			*/
	IGNORE,
	ALWAYS+PR,			/* Yen symbol					*/
	IGNORE,
	ALWAYS+PR,			/* Section symbol				*/
	ALWAYS+PR,			/* Blob with 4 little spikes	*/
	ALWAYS+PR,			/* Copyright symbol				*/
	ALWAYS+PR,			/* Underlined "a"				*/
	ALWAYS+LS+PR,		/* <<							*/
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,
	ALWAYS+PR,			/* Degree symbol				*/
	ALWAYS+PR,			/* Plus-Minus					*/
	ALWAYS+PR,			/* Superscript 2				*/
	ALWAYS+PR,			/* Superscript 3				*/
	IGNORE,
	ALWAYS+PR,			/* Mu							*/
	ALWAYS+PR,			/* Paragraph					*/
	ALWAYS+PR,			/* Solid circle					*/
	IGNORE,
	ALWAYS+PR,			/* Superscript 1				*/
	ALWAYS+PR,			/* Underlined "o"				*/
	ALWAYS+RS+PR,		/* >>							*/
	ALWAYS+PR,			/* 1/4							*/
	ALWAYS+PR,			/* 1/2							*/
	IGNORE,
	ALWAYS+LS+PR,		/* Inverted ?					*/
	ALWAYS+UU+OO+PR,	/* A grave						*/
	ALWAYS+UU+OO+PR,	/* A acute						*/
	ALWAYS+UU+OO+PR,	/* A circumflex					*/
	ALWAYS+UU+OO+PR,	/* A tilde						*/
	ALWAYS+UU+OO+PR,	/* A diarasis					*/
	ALWAYS+UU+OO+PR,	/* A with circle				*/
	ALWAYS+PR,			/* AE							*/
	ALWAYS+UU+C+PR,		/* C cdl.						*/
	ALWAYS+UU+OO+PR,	/* E grave						*/
	ALWAYS+UU+OO+PR,	/* E acute						*/
	ALWAYS+UU+OO+PR,	/* E circumflex					*/
	ALWAYS+UU+OO+PR,	/* E diarasis					*/
	ALWAYS+UU+OO+PR,	/* I grave						*/
	ALWAYS+UU+OO+PR,	/* I acute						*/
	ALWAYS+UU+OO+PR,	/* I circumflex					*/
	ALWAYS+UU+OO+PR,	/* I diarasis					*/
	IGNORE,
	ALWAYS+UU+C+PR,		/* N tilde						*/
	ALWAYS+UU+OO+PR,	/* O grave						*/
	ALWAYS+UU+OO+PR,	/* O acute						*/
	ALWAYS+UU+OO+PR,	/* O circumflex					*/
	ALWAYS+UU+OO+PR,	/* O tilde						*/
	ALWAYS+UU+OO+PR,	/* O diarasis					*/
	ALWAYS+UU+PR,		/* O E							*/
	ALWAYS+UU+OO+PR,	/* O with backslash				*/
	ALWAYS+UU+OO+PR,	/* U grave						*/
	ALWAYS+UU+OO+PR,	/* U acute						*/
	ALWAYS+UU+OO+PR,	/* U circumflex					*/
	ALWAYS+UU+OO+PR,	/* U diarasis					*/
	ALWAYS+UU+C+PR,		/* Y diarasis					*/
	IGNORE,
	ALWAYS+PR,			/* The "Beta" German thing.		*/
	ALWAYS+OO+PR,		/* a grave						*/
	ALWAYS+OO+PR,		/* a acute						*/
	ALWAYS+OO+PR,		/* a circumflex					*/
	ALWAYS+OO+PR,		/* a tilde						*/
	ALWAYS+OO+PR,		/* a diarasis					*/
	ALWAYS+OO+PR,		/* a with little circle			*/
	ALWAYS+PR,			/* ae							*/
	ALWAYS+C+PR,		/* c cdl.						*/
	ALWAYS+OO+PR,		/* e grave						*/
	ALWAYS+OO+PR,		/* e acute						*/
	ALWAYS+OO+PR,		/* e circumflex					*/
	ALWAYS+OO+PR,		/* e diarasis					*/
	ALWAYS+OO+PR,		/* i grave						*/
	ALWAYS+OO+PR,		/* i acute						*/
	ALWAYS+OO+PR,		/* i circumflex					*/
	ALWAYS+OO+PR,		/* i diarasis					*/
	IGNORE,
	ALWAYS+C+PR,		/* n tilde						*/
	ALWAYS+OO+PR,		/* O grave						*/
	ALWAYS+OO+PR,		/* O acute						*/
	ALWAYS+OO+PR,		/* O curcumflex					*/
	ALWAYS+OO+PR,		/* O tilde						*/
	ALWAYS+OO+PR,		/* O diarasis					*/
	ALWAYS+PR,			/* o e							*/
	ALWAYS+OO+PR,		/* O with line					*/
	ALWAYS+OO+PR,		/* U grave						*/
	ALWAYS+OO+PR,		/* U acute						*/
	ALWAYS+OO+PR,		/* U circumflex					*/
	ALWAYS+OO+PR,		/* U diarasis					*/
	ALWAYS+C+PR,		/* y diarasis					*/
	IGNORE,
	IGNORE
};

/*
 * This table contains a list of
 * "number abbreviations" and the desired
 * phoneme string. There are actually two strings, that
 * sit side by side with a "SIL" phoneme between them. The
 * caller will scan over the first one (the singular format
 * of the abbreviation) if the plural form is the one
 * that is desired. Used by heuristics. It would be
 * nice if there was a way to make C count the
 * blocks, like you can in MACRO and other very
 * high level languages.
 */

const unsigned char nabtab[] = {

	28,	'c',	'm',	EOS,
	US_S,	S1,	US_EH,	US_N,	US_T,	US_AX,	US_M,	S2,
	US_IY,	US_T,	US_RR,	SIL,
	US_S,	S1,	US_EH,	US_N,	US_T,	US_AX,	US_M,	S2,
	US_IY,	US_T,	US_RR,	US_Z,	SIL,

	26,	'm','m',EOS,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_M,	S2,	US_IY,
	US_T,	US_RR,	SIL,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_M,	S2,	US_IY,
	US_T,	US_RR,	US_Z,	SIL,

	24,	'k','m',EOS,
	US_K,	US_IX,	US_LL,	S1,	US_AA,	US_M,	US_AX,	US_T,
	US_RR,	SIL,
	US_K,	US_IX,	US_LL,	S1,	US_AA,	US_M,	US_AX,	US_T,
	US_RR,	US_Z,	SIL,

	15,	'i','n',EOS,
	S1,	US_IH,	US_N,	US_SH,	SIL,
	S1,	US_IH,	US_N,	US_SH,	US_IX,	US_Z,	SIL,

	18,	'i','n','s',EOS,
	S1,	US_IH,	US_N,	US_SH,	US_IX,	US_Z,	SIL,
	S1,	US_IH,	US_N,	US_SH,	US_IX,	US_Z,	SIL,

	13,	'f','t',EOS,
	US_F,	S1,	US_UH,	US_T,	SIL,
	US_F,	S1,	US_IY,	US_T,	SIL,

	16,	'y','d',EOS,
	US_Y,	S1,	US_AA,	US_R,	US_D,	SIL,
	US_Y,	S1,	US_AA,	US_R,	US_D,	US_Z,	SIL,

	18,	'y','d','s',EOS,
	US_Y,	S1,	US_AA,	US_R,	US_D,	US_Z,	SIL,
	US_Y,	S1,	US_AA,	US_R,	US_D,	US_Z,	SIL,

	14,	'm',	'i',	EOS,
	US_M,	S1,	US_AY,	US_LL,	SIL,
	US_M,	S1,	US_AY,	US_LL,	US_Z,	SIL,

	18,	'h',	'a',	EOS,
	US_HX,	S1,	US_EH,	US_K,	US_T,	US_RR,	SIL,
	US_HX,	S1,	US_EH,	US_K,	US_T,	US_RR,	US_Z,	SIL,

	24,	'm',	'l',	EOS,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_LL,	US_IY,	US_T,
	US_RR,	SIL,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_LL,	US_IY,	US_T,
	US_RR,	US_Z,	SIL,


	25,	't',	's',	'p',	EOS,
	US_T,	S1,	US_IY,	MBOUND,	US_S,	US_P,	S1,	US_UW,
	US_N,	SIL,
	US_T,	S1,	US_IY,	MBOUND,	US_S,	US_P,	S1,	US_UW,
	US_N,	US_Z,	SIL,

	27,	't',	's',	'p',	's',	EOS,
	US_T,	S1,	US_IY,	MBOUND,	US_S,	US_P,	S1,	US_UW,
	US_N,	US_Z,	SIL,
	US_T,	S1,	US_IY,	MBOUND,	US_S,	US_P,	S1,	US_UW,
	US_N,	US_Z,	SIL,

	30,	't',	'b',	's',	'p',	EOS,
	US_T,	S1,	US_EY,	US_B,	US_EL,	MBOUND,	US_S,	US_P,
	S1,	US_UW,	US_N,	SIL,
	US_T,	S1,	US_EY,	US_B,	US_EL,	MBOUND,	US_S,	US_P,
	S1,	US_UW,	US_N,	US_Z,	SIL,

	32,	't',	'b',	's',	'p',	's',	EOS,
	US_T,	S1,	US_EY,	US_B,	US_EL,	MBOUND,	US_S,	US_P,
	S1,	US_UW,	US_N,	US_Z,	SIL,
	US_T,	S1,	US_EY,	US_B,	US_EL,	MBOUND,	US_S,	US_P,
	S1,	US_UW,	US_N,	US_Z,	SIL,

	18,	'q',	't',	EOS,
	US_K,	US_W,	S1,	US_OW,	US_R,	US_T,	SIL,
	US_K,	US_W,	S1,	US_OW,	US_R,	US_T,	US_S,	SIL,

	16,	'g',	'm',	EOS,
	US_G,	US_R,	S1,	US_AE,	US_M,	SIL,
	US_G,	US_R,	S1,	US_AE,	US_M,	US_Z,	SIL,

	24,	'm',	'g',	EOS,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_G,	US_R,	US_AE,
	US_M,	SIL,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_G,	US_R,	US_AE,
	US_M,	US_Z,	SIL,

	24,	'k',	'g',	EOS,
	US_K,	S1,	US_IH,	US_LL,	US_AX,	US_G,	US_R,	US_AE,
	US_M,	SIL,
	US_K,	S1,	US_IH,	US_LL,	US_AX,	US_G,	US_R,	US_AE,
	US_M,	US_Z,	SIL,

	16,	'l',	'b',	EOS,
	US_P,	S1,	US_AW,	US_N,	US_D,	SIL,
	US_P,	S1,	US_AW,	US_N,	US_D,	US_Z,	SIL,
	
	18,	'l',	'b',	's',	EOS,
	US_P,	S1,	US_AW,	US_N,	US_D,	US_Z,	SIL,
	US_P,	S1,	US_AW,	US_N,	US_D,	US_Z,	SIL,

	15,	'o',	'z',	EOS,
	S1,	US_AW,	US_N,	US_S,	SIL,
	S1,	US_AW,	US_N,	US_S,	US_IX,	US_Z,	SIL,

	18,	'o',	'z',	's',	EOS,
	S1,	US_AW,	US_N,	US_S,	US_IX,	US_Z,	SIL,
	S1,	US_AW,	US_N,	US_S,	US_IX,	US_Z,	SIL,

	32,	'n',	's',	'e',	'c',	EOS,
	US_N,	S1,	US_AE,	US_N,	US_OW,	US_S,	S1,	US_EH,
	US_K,	US_AX,	US_N,	US_D,	SIL,
	US_N,	S1,	US_AE,	US_N,	US_OW,	US_S,	S1,	US_EH,
	US_K,	US_AX,	US_N,	US_D,	US_Z,	SIL,

	34,	'u',	's',	'e',	'c',	EOS,
	US_M,	S1,	US_AY,	US_K,	US_R,	US_AX,	US_S,	S1,
	US_EH,	US_K,	US_AX,	US_N,	US_D,	SIL,
	US_M,	S1,	US_AY,	US_K,	US_R,	US_AX,	US_S,	S1,
	US_EH,	US_K,	US_AX,	US_N,	US_D,	US_Z,	SIL,

	32,	'm',	's',	'e',	'c',	EOS,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_S,	S1,	US_EH,
	US_K,	US_AX,	US_N,	US_D,	SIL,
	US_M,	S1,	US_IH,	US_LL,	US_AX,	US_S,	S1,	US_EH,
	US_K,	US_AX,	US_N,	US_D,	US_Z,	SIL,

	21,	's',	'e',	'c',	EOS,
	US_S,	S1,	US_EH,	US_K,	US_AX,	US_N,	US_D,	SIL,
	US_S,	S1,	US_EH,	US_K,	US_AX,	US_N,	US_D,	US_Z,
	SIL,

	22,	's',	'e',	'c',	's',	EOS,
	US_S,	S1,	US_EH,	US_K,	US_AX,	US_N,	US_D,	SIL,
	US_S,	S1,	US_EH,	US_K,	US_AX,	US_N,	US_D,	US_Z,
	SIL,

	19,	'm',	'i',	'n',	EOS,
	US_M,	S1,	US_IH,	US_N,	US_IX,	US_T,	SIL,
	US_M,	S1,	US_IH,	US_N,	US_IX,	US_T,	US_S,	SIL,

	12,	'h',	'r',	EOS,
	S1,	US_AW,	US_R,	SIL,
	S1,	US_AW,	US_R,	US_Z,	SIL,

	19,	'd',	'e',	'g',	EOS,
	US_D,	US_AX,	US_G,	US_R,	S1,	US_IY,	SIL,
	US_D,	US_AX,	US_G,	US_R,	S1,	US_IY,	US_Z,	SIL,

	14,	'k',	't',	EOS,
	US_N,	S1,	US_AA,	US_T,	SIL,
	US_N,	S1,	US_AA,	US_T,	US_S,	SIL,

	16,	'k',	't',	's',	EOS,
	US_N,	S1,	US_AA,	US_T,	US_S,	SIL,
	US_N,	S1,	US_AA,	US_T,	US_S,	SIL,

	0
};

/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronounciation of the number words.
 * There is only a single phoneme string.
 */

const unsigned char nwdtab[] = {
	17,	'h',	'u',	'n',	'd',	'r',	'e',	'd',
	EOS,
	US_HX,	S1,	US_AH,	US_N,	US_D,	US_R,	US_AX,	US_D,
	SIL,

	17,	't',	'h',	'o',	'u',	's',	'a',	'n',
	'd',	EOS,
	US_TH,	S1,	US_AW,	US_S,	US_AX,	US_N,	US_D,	SIL,

	16,	'm',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	US_M,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,	SIL,

	16,	'b',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	US_B,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,	SIL,

	18,	't',	'r',	'i',	'l',	'l',	'i',	'o',
	'n',	EOS,
	US_T,	US_R,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,
	SIL,

	16,	'z',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	US_Z,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,	SIL,

	0
};


const unsigned char m_jan[] = "jan";
const unsigned char m_feb[] = "feb";
const unsigned char m_mar[] = "mar";
const unsigned char m_apr[] = "apr";
const unsigned char m_may[] = "may";
const unsigned char m_jun[] = "jun";
const unsigned char m_jul[] = "jul";
const unsigned char m_aug[] = "aug";
const unsigned char m_sep[] = "sep";
const unsigned char m_oct[] = "oct";
const unsigned char m_nov[] = "nov";
const unsigned char m_dec[] = "dec";

#ifdef OS_PALM
const unsigned char * months[] = {
#else
const unsigned char *const months[] = {
#endif
   m_jan,
   m_feb,
   m_mar,
   m_apr,
   m_may,
   m_jun,
   m_jul,
   m_aug,
   m_sep,
   m_oct,
   m_nov,
   m_dec
};

const unsigned char pdegree[] = {
	US_D,	US_IX,	US_G,	US_R,	S1,	US_IY,	SIL
};

/* 
 * const unsigned char pdash[] = {
 *	US_D,	S1,	US_AE,	US_SH,	SIL
 * };	eab out-found no longer used
 */
                                                        
const unsigned char pminus[] = {
	US_M,	S1,	US_AY,	US_N,	US_AX,	US_S,	SIL
};

const unsigned char pplus[] = {
	US_P, US_LL,	S1, US_AH,	US_S,	SIL
};


const unsigned char pstreet[] = {
	US_S,	US_T,	US_R,	S2,	US_IY,	US_T,	SIL
};

const unsigned char psaint[]  = {
	US_S,	US_EY,	US_N,	US_T,	SIL
};

const unsigned char pdoctor[] = {
	US_D,	US_AA,	US_K,	US_T,	US_RR,	SIL
};

const unsigned char pdrive[] = {
	US_D,	US_R,	S1,	US_AY,	US_V,	SIL
};

/* 020	MGS	11/23/1998	BATS #329 fixed 02-apr-2001 */
const unsigned char pOH[] = {
	S1,	US_OW,	SIL
};


const unsigned char p0[]	= {
	US_Z,	S1,	US_IY,	US_R,	US_OW,	SIL
};

const unsigned char p1[]	= {
	US_W,	S1,	US_AH,	US_N,	SIL
};

const unsigned char p2[]	= {
	US_T,	S1,	US_UW,	SIL
};

const unsigned char p3[]	= {
	US_TH,	US_R,	S1,	US_IY,	SIL
};

const unsigned char p4[]	= {
	US_F,	S1,	US_OR,	SIL
};

const unsigned char p5[]	= {
	US_F,	S1,	US_AY,	US_V,	SIL
};

const unsigned char p6[]	= {
	US_S,	S1,	US_IH,	US_K,	US_S,	SIL
};

const unsigned char p7[]	= {
	US_S,	S1,	US_EH,	US_V,	US_AX,	US_N,	SIL
};

const unsigned char p8[]	= {
	S1,	US_EY,	US_T,	SIL
};

const unsigned char p9[]	= {
	US_N,	S1,	US_AY,	US_N,	SIL
};

const unsigned char up0[]	= {
	US_Z,	S1,	US_IY,	US_R,	US_OW,	SIL
};

const unsigned char up1[]	= {
	US_W,		US_AH,	US_N,	SIL
};

const unsigned char up2[]	= {
	US_T,		US_UW,	SIL
};

const unsigned char up3[]	= {
	US_TH,	US_R,	US_IY,	SIL
};

const unsigned char up4[]	= {
	US_F,	US_OR,	SIL
};

const unsigned char up5[]	= {
	US_F,	US_AY,	US_V,	SIL
};

const unsigned char up6[]	= {
	US_S,	US_IH,	US_K,	US_S,	SIL
};

const unsigned char up7[]	= {
	US_S,	US_EH,	US_V,	US_AX,	US_N,	SIL
};

const unsigned char up8[]	= {
		US_EY,	US_T,	SIL
};

const unsigned char up9[]	= {
	US_N,	US_AY,	US_N,	SIL
};


#ifdef OS_PALM
const unsigned char * punits[] = {
#else
const unsigned char *const punits[] = {
#endif
	p0,	p1,	p2,	p3,	p4,
	p5,	p6,	p7,	p8,	p9
};

//BATS 841 -Allow for ustressed digits before hundrd, thousand etc. 
//EAB 2/2/99
#ifdef OS_PALM
const unsigned char * upunits[] = {
#else
const unsigned char *const upunits[] = {
#endif
	up0,	up1,	up2,	up3,	up4,
	up5,	up6,	up7,	up8,	up9
};


const unsigned char phundred[] = {
	US_HX,	S1,	US_AH,	US_N,	US_D,	US_R,	US_AX,	US_D,	SIL
};

const unsigned char pthousand[] = {
	US_TH,	S1,	US_AW,	US_Z,	US_AX,	US_N,	US_D,	SIL
};

const unsigned char pmillion[] = {
	US_M,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,	SIL
};

const unsigned char pbillion[] = {
	US_B,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,	SIL
};

const unsigned char ptrillion[] = {
	US_T,	US_R,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,	SIL
};

const unsigned char pquadrillion[] = {
	US_K,	US_W,	US_AO,	US_D,	US_R,	S1,	US_IH,	US_LL,	US_Y,	US_AX,	US_N,	SIL
};

const unsigned char p10[]	= {
	US_T,	S1,	US_EH,	US_N,	SIL
};

const unsigned char p11[]	= {
	US_AX,	US_LL,	S1,	US_EH,	US_V,	US_AX,	US_N,	SIL
};

const unsigned char p12[]	= {
	US_T,	US_W,	S1,	US_EH,	US_LL,	US_V,	SIL
};

const unsigned char p13[]	= {
	US_TH,	S1,	US_RR,	MBOUND,	US_T,	S1,	US_IY,	US_N,
	SIL
};

const unsigned char p14[]	= {
	US_F,	S1,	US_OR,	MBOUND,	US_T,	S1,	US_IY,	US_N,
	SIL
};

const unsigned char p15[]	= {
	US_F,	S1,	US_IH,	US_F,	MBOUND,	US_T,	S1,	US_IY,
	US_N,	SIL
};

const unsigned char p16[]	= {
	US_S,	S1,	US_IH,	US_K,	US_S,	MBOUND,	US_T,	S1,
	US_IY,	US_N,	SIL
};

const unsigned char p17[]	= {
	US_S,	S1,	US_EH,	US_V,	US_AX,	US_N,	MBOUND,	US_T,
	S1,	US_IY,	US_N,	SIL
};

const unsigned char p18[]	= {
	S1,	US_EY,	MBOUND,	US_T,	S1,	US_IY,	US_N,	SIL
};

const unsigned char p19[]	= {
	US_N,	S1,	US_AY,	US_N,	MBOUND,	US_T,	S1,	US_IY,
	US_N,	SIL
};

#ifdef OS_PALM
const unsigned char * pteens[] = {
#else
const unsigned char *const pteens[] = {
#endif
	p10,	p11,	p12,	p13,	p14,
	p15,	p16,	p17,	p18,	p19
};

const unsigned char pnone[]	= {
	SIL
};

const unsigned char p20[]	= {
	US_T,	US_W,	S1,	US_EH,	US_N,	US_T,	US_IY,	SIL
};

const unsigned char p30[]	= {
	US_TH,	S1,	US_RR,	US_T,	US_IY,	SIL
};

const unsigned char p40[]	= {
	US_F,	S1,	US_OR,	US_T,	US_IY,	SIL
};

const unsigned char p50[]	= {
	US_F,	S1,	US_IH,	US_F,	US_T,	US_IY,	SIL
};

const unsigned char p60[]	= {
	US_S,	S1,	US_IH,	US_K,	US_S,	US_T,	US_IY,	SIL
};

const unsigned char p70[]	= {
	US_S,	S1,	US_EH,	US_V,	US_AX,	US_N,	US_T,	US_IY,
	SIL
};

const unsigned char p80[]	= {
	S1,	US_EY,	US_T,	US_IY,	SIL
};

const unsigned char p90[]	= {
	US_N,	S1,	US_AY,	US_N,	US_T,	US_IY,	SIL
};

#ifdef OS_PALM
const unsigned char * ptens[]	= {
#else
const unsigned char *const ptens[]	= {
#endif
	pnone,	pnone,	p20,	p30,	p40,
	p50,	p60,	p70,	p80,	p90
};

const unsigned char ppence[] = {
	US_P,	S1,	US_EH,	US_N,	US_S,	SIL
};

const unsigned char ppercent[] = {
	WBOUND, US_P,	US_RR,	US_S,	S1,	US_EH,	US_N,	US_T,
	SIL
};
	
const unsigned char pcent[] = {
	US_S,	S1,	US_EH,	US_N,	US_T,	SIL
};

const unsigned char peuro[] = {
	WBOUND,	US_Y,	S1,	US_UW,	US_R,	US_OW,	SIL
};

const unsigned char ppound[] = {
	WBOUND,	US_P,	S1,	US_AW,	US_N,	US_D,	SIL
};

const unsigned char pdollar[] = {
	WBOUND,	US_D,	S1,	US_AA,	US_LL,	US_RR,	SIL
};

const unsigned char pand[] = {
	WBOUND,	VPSTART, US_EH,	US_N,	US_D,	WBOUND,	SIL
};

const unsigned char ppoint[] = {
	US_P,	S1,	US_OY,	US_N,	US_T,	SIL
};

const unsigned char ptt2tp[] = {
	WBOUND,	US_T,	S2,	US_AY,	US_M,	US_Z,	WBOUND,
	US_T,	S1,	US_EH,	US_N,	WBOUND,	US_T,	US_UH,
	WBOUND,	US_DH,	US_AX,	WBOUND,	US_P,	S1,	US_AW,
	US_RR,	WBOUND,	SIL
};

const unsigned char pjan[] = {
	US_JH,	S1,	US_AE,	US_N,	US_YU,	US_EH,	US_R,	US_IY,
	SIL
};

const unsigned char pfeb[] = {
	US_F,	S1,	US_EH,	US_B,	US_R,	US_UW,	US_EH,	US_R,
	US_IY,	SIL
};

const unsigned char pmar[] = {
	US_M,	S1,	US_AA,	US_R,	US_CH,	SIL
};

const unsigned char papr[] = {
	S1,	US_EY,	US_P,	US_R,	US_EL,	SIL
};

const unsigned char pmay[] = {
	US_M,	S1,	US_EY,	SIL
};

const unsigned char pjun[] = {
	US_JH,	S1,	US_UW,	US_N,	SIL
};

const unsigned char pjul[] = {
	US_JH,	US_IX,	US_LL,	S1,	US_AY,	SIL
};

const unsigned char	paug[] = {
	S1,	US_AO,	US_G,	US_AX,	US_S,	US_T,	SIL
};

 
const unsigned char	psep[] = {
	US_S,	US_EH,	US_P,	US_T,	S1,	US_EH,	US_M,	US_B,
	US_RR,	SIL
};

 
const unsigned char	poct[] = {
	US_AA,	US_K,	US_T,	S1,	US_OW,	US_B,	US_RR,	SIL
};

 
const unsigned char	pnov[] = {
	US_N,	US_OW,	US_V,	S1,	US_EH,	US_M,	US_B,	US_RR,
	SIL
};

 
const unsigned char	pdec[] = {
	US_D,	US_IX,	US_S,	S1,	US_EH,	US_M,	US_B,	US_RR,
	SIL
};


#ifdef OS_PALM 
const unsigned char * pmonths[] = {
#else
const unsigned char *const pmonths[] = {
#endif
	pjan, pfeb,	pmar,	papr,	pmay,	pjun,
	pjul,	paug,	psep,	poct,	pnov,	pdec
};

 
const unsigned char	p0th[] = {
	US_Z,	S1,	US_IY,	US_R,	US_OW,	US_TH,	SIL
};

 
const unsigned char	p1st[] = {
	US_F,	S1,	US_RR,	US_S,	US_T,	SIL
};

 
const unsigned char	p2nd[] = {
	US_S,	S1,	US_EH,	US_K,	US_AX,	US_N,	US_D,	SIL
};

 
const unsigned char	p3rd[] = {
	US_TH,	S1,	US_RR,	US_D,	SIL
};

 
const unsigned char	p4th[] = {
	US_F,	S1,	US_OR,	US_TH,	SIL
};

 
const unsigned char	p5th[] = {
	US_F,	S1,	US_IH,	US_F,	US_TH,	SIL
};

 
const unsigned char	p6th[] = {
	US_S,	S1,	US_IH,	US_K,	US_S,	US_TH,	SIL
};

 
const unsigned char	p7th[] = {
	US_S,	S1,	US_EH,	US_V,	US_AX,	US_N,	US_TH,	SIL
};

 
const unsigned char	p8th[] = {
	S1,	US_EY,	US_TH,	SIL
};

 
const unsigned char	p9th[] = {
	US_N,	S1,	US_AY,	US_N,	US_TH,	SIL
};

 
#ifdef OS_PALM
const unsigned char * pordin[] = {
#else
const unsigned char *const pordin[] = {
#endif
	p0th,	p1st,	p2nd,	p3rd,	p4th,
	p5th,	p6th,	p7th,	p8th,	p9th
};

 
const unsigned char	phalf[] = {
	US_HX,	S1,	US_AE,	US_F,	SIL
};

 
const unsigned char	phalves[] = {
	US_HX,	S1,	US_AE,	US_V,	US_Z,	SIL
};

const unsigned char	pthe[] = {
	US_DH,	S1,	US_AX,	SIL
};
const unsigned char	pof[] = {
	S1,	US_AX,	US_V,	SIL
};

/*
 * This table, indexed by the grapheme
 * codes, returns the basic set of features.
 * The "[+GEM]" feature, and the setting of the
 * "[+VOC]" and "[+CONS]" on the letter "Y" are
 * special, and get done by "ls_rule_add_graph" with
 * some special code.
 */

const U16 feats[]	= {
	0,									/* End mark			*/
	FSEG+FVOC+FSYL,						/* A				*/
	FSEG+FCONS+FVOICE,					/* B				*/
	FSEG+FCONS+FC,						/* C				*/
	FSEG+FCONS+FVOICE+FCOR,				/* D				*/
	FSEG+FVOC+FSYL,						/* E				*/
	FSEG+FCONS,							/* F				*/
	FSEG+FCONS+FVOICE+FLTSVELAR,			/* G				*/
	FSEG+FCONS,							/* H				*/
	FSEG+FVOC+FHIGH+FSYL,				/* I				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,		/* J				*/
	FSEG+FCONS+FLTSVELAR,					/* K				*/
	FSEG+FCONS+FVOICE+FLIQ+FCOR+FL,		/* L				*/
	FSEG+FCONS+FVOICE+FNAS,				/* M				*/
	FSEG+FCONS+FVOICE+FNAS+FCOR,		/* N				*/
	FSEG+FVOC+FSYL,						/* O				*/
	FSEG+FCONS,							/* P				*/
	FSEG+FCONS,							/* Q				*/
	FSEG+FCONS+FVOICE+FLIQ+FR,			/* R				*/
	FSEG+FCONS+FSIB,					/* S				*/
	FSEG+FCONS+FCOR,					/* T				*/
	FSEG+FVOC+FHIGH+FSYL,				/* U				*/
	FSEG+FCONS+FVOICE,					/* V				*/
	FSEG+FCONS+FVOICE+FCOR,				/* W				*/
	FSEG+FCONS+FSIB+FX,					/* X				*/
	FSEG,								/* Y				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,		/* Z				*/
	FSEG+FCONS+FVOICE+FLTSVELAR,			/* GU				*/
	FSEG+FCONS,							/* QU				*/
	0,									/* '				*/
	0									/* +				*/
};

/*
 * Feature table.
 * Index by phoneme.
 */

const U16 pfeat[] = {
	0,							/* SIL						*/
	PVOC+PVOICE,				/* IY						*/
	PVOC+PVOICE,				/* IH						*/
	PVOC+PVOICE,				/* EY						*/
	PVOC+PVOICE,				/* EH				        */
	PVOC+PVOICE,				/* AE				        */
	PVOC+PVOICE,				/* AA				        */
	PVOC+PVOICE,				/* AY				        */
	PVOC+PVOICE,				/* AW				        */
	PVOC+PVOICE,				/* AH				        */
	PVOC+PVOICE,				/* AO				        */
	PVOC+PVOICE,				/* OW				        */
	PVOC+PVOICE,				/* OY				        */
	PVOC+PVOICE,				/* UH				        */
	PVOC+PVOICE,				/* UW				        */
	PBOTH+PVOICE,				/* RR				        */
	PVOC+PVOICE,				/* US_YU,				        */
	PVOC+PVOICE,				/* AX				        */
	PVOC+PVOICE,				/* IX				        */
	0,							/* IR	(No translation)	*/
	0,							/* ER	(No translation)	*/
	0,							/* AR	(No translation)	*/
	0,							/* OR	(No translation)	*/
	0,							/* UR	(No translation)	*/
	PCONS,						/* W				        */
	PCONS,						/* Y				        */
	PCONS+PVOICE,				/* R				        */
	PCONS+PVOICE,				/* LL				        */
	PCONS,						/* HX				        */
	0,							/* RX	(No translation)	*/
	0,							/* LX	(No translation)	*/
	PCONS+PVOICE+POBS,			/* M						*/
	PCONS+PVOICE+POBS,			/* N				        */
	PCONS+PVOICE,				/* NX				        */
	PBOTH+PVOICE,				/* EL				        */
	0,							/* D_DENTALIZED				*/
	PBOTH+PVOICE,				/* EN				        */
	PCONS+POBS,					/* F				        */
	PCONS+PVOICE+POBS, 			/* V				        */
	PCONS+POBS,					/* TH				        */
	PCONS+PVOICE+POBS,			/* DH				        */
	PCONS+PSIB+POBS,			/* S				        */
	PCONS+PVOICE+PSIB+POBS,		/* Z				        */
	PCONS+PSIB+POBS,			/* SH				        */
	PCONS+PVOICE+PSIB+POBS,		/* ZH				        */
	PCONS+POBS,					/* P				        */
	PCONS+PVOICE+POBS,			/* B				        */
	PCONS+POBS+PTD,				/* T				        */
	PCONS+PVOICE+POBS+PTD,		/* D				        */
	PCONS+POBS,					/* K				        */
	PCONS+PVOICE+POBS,			/* G				        */
	PCONS,						/* DX				        */
	PCONS,						/* TX				        */
	0,							/* Q				        */
	PCONS+PSIB,					/* CH				        */
	PCONS+PVOICE+PSIB,			/* JH				        */
	PCONS,						/* DX				        */
	0,0,0,0,0,0,0,0,0,0,		/* place holder for null phones */
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,
	0,							/* BLOCK_RULES				*/
	0,							/* S2				        */
	0,							/* S1				        */
	0,							/* SEMPH			        */
	0,							/* HAT_RISE			        */
	0,							/* HAT_FALL			        */
	0,							/* HAT_RF			        */
	0,							/* DASH		(SBOUND)		*/
	0,							/* STAR		(MBOUND)		*/
	0,							/* HASH		(HYPHEN)		*/
	0,							/* WBOUND			        */
	0,							/* PPSTART			        */
	0,							/* VPSTART			        */
	0,							/* RELSTART			        */
	0,							/* EQUAL	(COMMA)			*/
	0,							/* PLUS		(PERIOD)		*/
	0,							/* QUEST			        */
	0,							/* EXCLAM			        */
	0,							/* NEW_PARAGRAPH			*/
	0							/* Special_word         	*/
};                              

const unsigned char sdic[] = 
{

	9,'f','o','r',EOS,SPECIALWORD,PPSTART,US_F,US_RR,SIL,
	10,'a','n','d',EOS,SPECIALWORD,PPSTART,US_AE,US_N,US_D,SIL,
	12,'m','w','i','z','i',EOS,PPSTART,US_K,US_AO,US_P,US_IY,SIL,
	8,'t','o',EOS,SPECIALWORD,PPSTART,US_T,US_UH,SIL,
	0	
};

#ifdef WORK_IN_PROGRESS
const signed char predic[] = 
{
	6,'i','n',EOS,US_IX,US_N,SIL,
	6,'i','m','m',-1,EOS,US_IX,SIL,
	6,'i','m',EOS,US_IX,US_M,SIL,
	7,'i','r','r','e',-2,EOS,US_IX,SIL,

	//9,'f','o','r',EOS,SPECIALWORD,PPSTART,F,OR,SIL,
	//10,'a','n','d',EOS,SPECIALWORD,PPSTART,EH,N,D,SIL,
	//12,'m','w','i','z','i',EOS,PPSTART,K,AO,P,IY,SIL,
	//8,'t','o',EOS,SPECIALWORD,PPSTART,T,UH,SIL,
	0	
};

#endif


const unsigned char whdic[] = 
{
	6,'w','h','a','t',EOS,SIL,
	6,'w','h','e','n',EOS,SIL,
	7,'w','h','e','r','e',EOS,SIL,
	5,'w','h','y',EOS,SIL,
	5,'w','h','o',EOS,SIL,
	5,'h','o','w',EOS,SIL,
	7,'w','h','i','c','h',EOS,SIL,
	7,'w','h','o','s','e',EOS,SIL,
	6,'w','h','o','m',EOS,SIL,
	0	
};



#ifndef ACNA
const unsigned char	preftab[] = {
	2,				US_AA,	US_B,
	4+PCONT+P2SYL,	US_AH,	US_N,	US_D,	US_RR,
	2+PCONT,		US_AX,	US_N,
	3,				US_B,	US_AY,	US_D,
	3,				US_B,	US_AY,	US_F,
	3,				US_B,	US_AY,	US_K,
	3,				US_B,	US_AY,	US_LL,
	3,				US_B,	US_AY,	US_N,
	3,				US_B,	US_AY,	US_P,
	3,				US_B,	US_AY,	US_R,
	3,				US_B,	US_AY,	US_S,
	2+PRCON,		US_B,	US_EH,
	2+PRCON,		US_B,	US_IY,
	2+PRCON,		US_D,	US_EH,

	/* GL 03/14/1997 for BATS#294, add this rule to fix all
	   disa- word stress problem */
	4+PCONT+P2SYL,	US_D,	US_IH,	US_S, US_AE,

	3+PCONT,		US_D,	US_IH,	US_S,
	2+PRCON,		US_D,	US_IH,
	4,				US_D,	US_IX,	US_M,	US_EH,
	4,				US_D,	US_IX,	US_M,	US_IH,
	3,				US_D,	US_IX,	US_P,
	3,				US_D,	US_IX,	US_R,
	3,				US_D,	US_IX,	US_V,
	2+PRCON,		US_D,	US_IY,	
	2,				US_EH,	US_K,
	2,				US_EH,	US_M,
	2,				US_EH,	US_N,
	2,				US_EH,	US_R,
	3,				US_F,	US_AO,	US_R,
	3,				US_K,	US_AA,	US_LL,
	3,				US_K,	US_AA,	US_M,
	3,				US_K,	US_AA,	US_N,
	3,				US_K,	US_AO,	US_R,
	4+PCONT+P2SYL,	US_IH,	US_N,	US_T,	US_RR,
	2+PCONT,		US_IH,	US_N,
	3+PCONT,		US_M,	US_IH,	US_S,
	3+PCONT,		US_N,	US_AA,	US_N,
	3+PCONT+P2SYL,	US_OW,	US_V,	US_RR,
	3,				US_P,	US_R,	US_AA,
	3,				US_P,	US_R,	US_IY,
	2+PCONT+PRCON,	US_R,	US_EH,
	3,				US_S,	US_AH,	US_P,
	3,				US_S,	US_AH,	US_S,
	5,				US_T,	US_R,	US_AE,	US_N,	US_S,
	3,				US_W,	US_IH,	US_TH,
	0
};                              
#ifdef OS_PALM 
#pragma pcrelconstdata on
#endif



#endif /* #ifndef ACNA */

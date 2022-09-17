/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
 *                                                                      
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.    
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.                                
 *                                                                      
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.                                       
 *                                                                       
 *********************************************************************** 
 *    File Name:	l_uk_con.c
 *    Author:		Doug Robinson/Ginger Lin                                         
 *    Creation Date:10/01/97                                                   
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
 * 003  DGC		04/24/1985 		Fixed some phonemes to agree with some
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
 * 016  DR/GL   10/01/1997      modified from l_us_con.c for UK_english
 * 017  GL      10/31/1997      add pthe[] and pof[]
 * 018  GL      11/03/1997      use "oh" for p0(zero), also reset phoneme for "for" and "to"
 * 019  EAB		12/03/1997		Change vowels in sdic to reduce form
 * 020  GL		12/09/1997		reset the "Y" feature in pfeat[] to be same as US.
 * 021	MGS		04/13/2000		Changes for integrated phoneme set 
 * 022 	CAB		10/18/2000		Changed copyright info
 * 023	CAB		04/25/2002		Fixed changed to const as per ls_cons.h
 */
  
#include "ls_def.h"
  
/*
 * This rather large table is
 * used to obtain the attributes of characters
 * in the ASCII_G and DEC multinational character
 * set. It is indexed by character code, with ASCII_G
 * in GL, ASCII_C in C0, the DEC multinational set
 * in GR, and the supplemental control set in C1.
 * The major client of this table is the word
 * reading stuff.
 */ 

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
	ALWAYS+UU+PR,		/* Y (-UK_V, -C)		            */
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
	ALWAYS+PR,			/* y (-UK_V, -C)					*/
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
	ALWAYS+PR,			/* International currency symbol ¤ */
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
	ALWAYS+UU+OO+PR,	/* A dieresis					*/
	ALWAYS+UU+OO+PR,	/* A with circle				*/
	ALWAYS+PR,			/* AE							*/
	ALWAYS+UU+C+PR,		/* C cdl.						*/
	ALWAYS+UU+OO+PR,	/* E grave						*/
	ALWAYS+UU+OO+PR,	/* E acute						*/
	ALWAYS+UU+OO+PR,	/* E circumflex					*/
	ALWAYS+UU+OO+PR,	/* E dieresis					*/
	ALWAYS+UU+OO+PR,	/* I grave						*/
	ALWAYS+UU+OO+PR,	/* I acute						*/
	ALWAYS+UU+OO+PR,	/* I circumflex					*/
	ALWAYS+UU+OO+PR,	/* I dieresis					*/
	IGNORE,
	ALWAYS+UU+C+PR,		/* N tilde						*/
	ALWAYS+UU+OO+PR,	/* O grave						*/
	ALWAYS+UU+OO+PR,	/* O acute						*/
	ALWAYS+UU+OO+PR,	/* O circumflex					*/
	ALWAYS+UU+OO+PR,	/* O tilde						*/
	ALWAYS+UU+OO+PR,	/* O dieresis					*/
	ALWAYS+UU+PR,		/* O E							*/
	ALWAYS+UU+OO+PR,	/* O with backslash				*/
	ALWAYS+UU+OO+PR,	/* U grave						*/
	ALWAYS+UU+OO+PR,	/* U acute						*/
	ALWAYS+UU+OO+PR,	/* U circumflex					*/
	ALWAYS+UU+OO+PR,	/* U dieresis					*/
	ALWAYS+UU+C+PR,		/* Y dieresis					*/
	IGNORE,
	ALWAYS+PR,			/* Scharfes S (Beta GR thing) ß */
	ALWAYS+OO+PR,		/* a grave						*/
	ALWAYS+OO+PR,		/* a acute						*/
	ALWAYS+OO+PR,		/* a circumflex					*/
	ALWAYS+OO+PR,		/* a tilde						*/
	ALWAYS+OO+PR,		/* a dieresis					*/
	ALWAYS+OO+PR,		/* a with little circle			*/
	ALWAYS+PR,			/* ae							*/
	ALWAYS+C+PR,		/* c cdl.						*/
	ALWAYS+OO+PR,		/* e grave						*/
	ALWAYS+OO+PR,		/* e acute						*/
	ALWAYS+OO+PR,		/* e circumflex					*/
	ALWAYS+OO+PR,		/* e dieresis					*/
	ALWAYS+OO+PR,		/* i grave						*/
	ALWAYS+OO+PR,		/* i acute						*/
	ALWAYS+OO+PR,		/* i circumflex					*/
	ALWAYS+OO+PR,		/* i dieresis					*/
	IGNORE,
	ALWAYS+C+PR,		/* n tilde						*/
	ALWAYS+OO+PR,		/* O grave						*/
	ALWAYS+OO+PR,		/* O acute						*/
	ALWAYS+OO+PR,		/* O curcumflex					*/
	ALWAYS+OO+PR,		/* O tilde						*/
	ALWAYS+OO+PR,		/* O dieresis					*/
	ALWAYS+PR,			/* o e							*/
	ALWAYS+OO+PR,		/* O with line					*/
	ALWAYS+OO+PR,		/* U grave						*/
	ALWAYS+OO+PR,		/* U acute						*/
	ALWAYS+OO+PR,		/* U circumflex					*/
	ALWAYS+OO+PR,		/* U dieresis					*/
	ALWAYS+C+PR,		/* y dieresis					*/
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
	UK_S,	S1,	UK_EH,	UK_N,	UK_T,	UK_IX,	UK_M,	S2,
	UK_IY,	UK_T,	UK_AX,	SIL,
	UK_S,	S1,	UK_EH,	UK_N,	UK_T,	UK_IX,	UK_M,	S2,
	UK_IY,	UK_T,	UK_AX,	UK_Z,	SIL,

	26,	'm','m',EOS,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_M,	S2,	UK_IY,
	UK_T,	UK_AX, SIL,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_M,	S2,	UK_IY,
	UK_T,	UK_AX,	UK_Z,	SIL,

	26,	'k','m',EOS,
	UK_K,	UK_IH,	UK_LL,	S1,	UK_AX,	UK_M,	UK_IY,	UK_T,
	UK_AX,	UK_R, SIL,
	UK_K,	UK_IH,	UK_LL,	S1,	UK_AX,	UK_M,	UK_IY,	UK_T,
	UK_AX,	UK_R, UK_Z,	SIL,

	15,	'i','n',EOS,
	S1,	UK_IH,	UK_N,	UK_CH,	SIL,
	S1,	UK_IH,	UK_N,	UK_CH,	UK_IX,	UK_Z,	SIL,

	18,	'i','n','s',EOS,
	S1,	UK_IH,	UK_N,	UK_CH,	UK_IX,	UK_Z,	SIL,
	S1,	UK_IH,	UK_N,	UK_CH,	UK_IX,	UK_Z,	SIL,

	13,	'f','t',EOS,
	UK_F,	S1,	UK_UH,	UK_T,	SIL,
	UK_F,	S1,	UK_IY,	UK_T,	SIL,

	14,	'y','d',EOS,
	UK_Y,	S1,	UK_AA,	UK_D,	SIL,
	UK_Y,	S1,	UK_AA,	UK_D,	UK_Z,	SIL,

	16,	'y','d','s',EOS,
	UK_Y,	S1,	UK_AA,	UK_D,	UK_Z,	SIL,
	UK_Y,	S1,	UK_AA,	UK_D,	UK_Z,	SIL,

	14,	'm',	'i',	EOS,
	UK_M,	S1,	UK_AY,	UK_LX,	SIL,
	UK_M,	S1,	UK_AY,	UK_LX,	UK_Z,	SIL,

	18,	'h',	'a',	EOS,
	UK_HX,	S1,	UK_EH,	UK_K,	UK_T,	UK_ER,	SIL,
	UK_HX,	S1,	UK_EH,	UK_K,	UK_T,	UK_ER,	UK_Z,	SIL,

	24,	'm',	'l',	EOS,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_LL,	UK_IH,	UK_T,
	UK_AX,	SIL,                      //-DR 8/29/97 Changed RR to AX.  That looks just like all the other *eters...
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_LL,	UK_IH,	UK_T,
	UK_AX,	UK_Z,	SIL,


	25,	't',	's',	'p',	EOS,
	UK_T,	S1,	UK_IY,	MBOUND,	UK_S,	UK_P,	S1,	UK_UW,
	UK_N,	SIL,
	UK_T,	S1,	UK_IY,	MBOUND,	UK_S,	UK_P,	S1,	UK_UW,
	UK_N,	UK_Z,	SIL,

	27,	't',	's',	'p',	's',	EOS,
	UK_T,	S1,	UK_IY,	MBOUND,	UK_S,	UK_P,	S1,	UK_UW,
	UK_N,	UK_Z,	SIL,
	UK_T,	S1,	UK_IY,	MBOUND,	UK_S,	UK_P,	S1,	UK_UW,
	UK_N,	UK_Z,	SIL,

	30,	't',	'b',	's',	'p',	EOS,
	UK_T,	S1,	UK_EY,	UK_B,	UK_EL,	MBOUND,	UK_S,	UK_P,
	S1,	UK_UW,	UK_N,	SIL,
	UK_T,	S1,	UK_EY,	UK_B,	UK_EL,	MBOUND,	UK_S,	UK_P,
	S1,	UK_UW,	UK_N,	UK_Z,	SIL,

	32,	't',	'b',	's',	'p',	's',	EOS,
	UK_T,	S1,	UK_EY,	UK_B,	UK_EL,	MBOUND,	UK_S,	UK_P,
	S1,	UK_UW,	UK_N,	UK_Z,	SIL,
	UK_T,	S1,	UK_EY,	UK_B,	UK_EL,	MBOUND,	UK_S,	UK_P,
	S1,	UK_UW,	UK_N,	UK_Z,	SIL,

	16,	'q',	't',	EOS,
	UK_K,	UK_W,	S1,	UK_AO,	UK_T,	SIL, 
	UK_K,	UK_W,	S1,	UK_AO,	UK_T,	UK_S,	SIL,

	16,	'g',	'm',	EOS,
	UK_G,	UK_R,	S1,	UK_AE,	UK_M,	SIL,
	UK_G,	UK_R,	S1,	UK_AE,	UK_M,	UK_Z,	SIL,

	24,	'm',	'g',	EOS,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_G,	UK_R,	UK_AE,
	UK_M,	SIL,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_G,	UK_R,	UK_AE,
	UK_M,	UK_Z,	SIL,

	24,	'k',	'g',	EOS,
	UK_K,	S1,	UK_IH,	UK_LL,	UK_AX,	UK_G,	UK_R,	UK_AE,
	UK_M,	SIL,
	UK_K,	S1,	UK_IH,	UK_LL,	UK_AX,	UK_G,	UK_R,	UK_AE,
	UK_M,	UK_Z,	SIL,

	16,	'l',	'b',	EOS,
	UK_P,	S1,	UK_AW,	UK_N,	UK_D,	SIL,
	UK_P,	S1,	UK_AW,	UK_N,	UK_D,	UK_Z,	SIL,
	
	18,	'l',	'b',	's',	EOS,
	UK_P,	S1,	UK_AW,	UK_N,	UK_D,	UK_Z,	SIL,
	UK_P,	S1,	UK_AW,	UK_N,	UK_D,	UK_Z,	SIL,

	15,	'o',	'z',	EOS,
	S1,	UK_AW,	UK_N,	UK_S,	SIL,
	S1,	UK_AW,	UK_N,	UK_S,	UK_IX,	UK_Z,	SIL,

	18,	'o',	'z',	's',	EOS,
	S1,	UK_AW,	UK_N,	UK_S,	UK_IX,	UK_Z,	SIL,
	S1,	UK_AW,	UK_N,	UK_S,	UK_IX,	UK_Z,	SIL,

	32,	'n',	's',	'e',	'c',	EOS,
	UK_N,	S1,	UK_EY,	UK_N,	UK_OW,	UK_S,	S1,	UK_EH,
	UK_K,	UK_AX,	UK_N,	UK_D,	SIL,
	UK_N,	S1,	UK_EY,	UK_N,	UK_OW,	UK_S,	S1,	UK_EH,
	UK_K,	UK_AX,	UK_N,	UK_D,	UK_Z,	SIL,

	34,	'u',	's',	'e',	'c',	EOS,
	UK_M,	S1,	UK_AY,	UK_K,	UK_R,	UK_OW,	UK_S,	S1,
	UK_EH,	UK_K,	UK_AX,	UK_N,	UK_D,	SIL,
	UK_M,	S1,	UK_AY,	UK_K,	UK_R,	UK_OW,	UK_S,	S1,
	UK_EH,	UK_K,	UK_AX,	UK_N,	UK_D,	UK_Z,	SIL,

	32,	'm',	's',	'e',	'c',	EOS,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_S,	S1,	UK_EH,
	UK_K,	UK_AX,	UK_N,	UK_D,	SIL,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_IX,	UK_S,	S1,	UK_EH,
	UK_K,	UK_AX,	UK_N,	UK_D,	UK_Z,	SIL,

	21,	's',	'e',	'c',	EOS,
	UK_S,	S1,	UK_EH,	UK_K,	UK_AX,	UK_N,	UK_D,	SIL,
	UK_S,	S1,	UK_EH,	UK_K,	UK_AX,	UK_N,	UK_D,	UK_Z,
	SIL,

	22,	's',	'e',	'c',	's',	EOS,
	UK_S,	S1,	UK_EH,	UK_K,	UK_AX,	UK_N,	UK_D,	SIL,
	UK_S,	S1,	UK_EH,	UK_K,	UK_AX,	UK_N,	UK_D,	UK_Z,
	SIL,

	19,	'm',	'i',	'n',	EOS,
	UK_M,	S1,	UK_IH,	UK_N,	UK_IX,	UK_T,	SIL,
	UK_M,	S1,	UK_IH,	UK_N,	UK_IX,	UK_T,	UK_S,	SIL,

	10,	'h',	'r',	EOS,
	S1,	UK_AR,	SIL,
	S1,	UK_AR,	UK_Z,	SIL,

	19,	'd',	'e',	'g',	EOS,
	UK_D,	UK_IX,	UK_G,	UK_R,	S1,	UK_IY,	SIL,
	UK_D,	UK_IX,	UK_G,	UK_R,	S1,	UK_IY,	UK_Z,	SIL,

	14,	'k',	't',	EOS,   //-DR 8/29/87 kt has three abbs  -> KNIGHT, KARAT, and KNOT
	UK_N,	S1,	UK_OH,	UK_T,	SIL,		//But, KARAT is a variation of CARAT with abbriviation of ct.
	UK_N,	S1,	UK_OH,	UK_T,	UK_S,	SIL,	//And and Knight is abb Kt.

	16,	'k',	't',	's',	EOS,
	UK_N,	S1,	UK_OH,	UK_T,	UK_S,	SIL,
	UK_N,	S1,	UK_OH,	UK_T,	UK_S,	SIL,

	0
};

/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronunciation of the number words.
 * There is only a single phoneme string.
 */

const unsigned char nwdtab[] = {
	17,	'h',	'u',	'n',	'd',	'r',	'e',	'd',
	EOS,
	UK_HX,	S1,	UK_AH,	UK_N,	UK_D,	UK_R,	UK_AX,	UK_D,
	SIL,

	17,	't',	'h',	'o',	'u',	's',	'a',	'n',
	'd',	EOS,
	UK_TH,	S1,	UK_AW,	UK_S,	UK_AX,	UK_N,	UK_D,	SIL,

	16,	'm',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	UK_M,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,	SIL,

	16,	'b',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	UK_B,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,	SIL,

	18,	't',	'r',	'i',	'l',	'l',	'i',	'o',
	'n',	EOS,
	UK_T,	UK_R,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,
	SIL,

	16,	'z',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	UK_Z,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,	SIL,

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

const unsigned char  *const months[] = {
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
	UK_D,	UK_IX,	UK_G,	UK_R,	S1,	UK_IY,	SIL
};

/* 
 * unsigned char pdash[] = {
 *	UK_D,	S1,	UK_AE,	SH,	SIL
 * };	eab out-found no longer used
 */
                                                        
const unsigned char pminus[] = {
	UK_M,	S1,	UK_AY,	UK_N,	UK_AX,	UK_S,	SIL
};

const unsigned char pplus[] = {
	UK_P, UK_LL,	S1, UK_AH,	UK_S,	SIL
};


const unsigned char pstreet[] = {
	UK_S,	UK_T,	UK_R,	S2,	UK_IY,	UK_T,	SIL
};

const unsigned char psaint[]  = {
	UK_S,	UK_AX,	UK_N,	UK_T,	SIL
};

const unsigned char pdoctor[] = {
	UK_D,	UK_OH,	UK_K,	UK_T,	UK_AX,	SIL
};

const unsigned char pdrive[] = {
	UK_D,	UK_R,	S1,	UK_AY,	UK_V,	SIL
};

const unsigned char p0[]	= {
/* GL 11/03/1997 use "oh" for zero */
//	UK_Z,	S1,	UK_IR,	UK_OW,	SIL
	S1,	UK_OW,	SIL
};

const unsigned char p1[]	= {
	UK_W,	S1,	UK_AH,	UK_N,	SIL
};

const unsigned char p2[]	= {
	UK_T,	S1,	UK_UW,	SIL
};

const unsigned char p3[]	= {
	UK_TH,	UK_R,	S1,	UK_IY,	SIL
};

const unsigned char p4[]	= {
	UK_F,	S1,	UK_AO,	SIL
};

const unsigned char p5[]	= {
	UK_F,	S1,	UK_AY,	UK_V,	SIL
};

const unsigned char p6[]	= {
	UK_S,	S1,	UK_IH,	UK_K,	UK_S,	SIL
};

const unsigned char p7[]	= {
	UK_S,	S1,	UK_EH,	UK_V,	UK_AX,	UK_N,	SIL
};

const unsigned char p8[]	= {
	S1,	UK_EY,	UK_T,	SIL
};

const unsigned char p9[]	= {
	UK_N,	S1,	UK_AY,	UK_N,	SIL
};

const unsigned char *const punits[] = {
	p0,	p1,	p2,	p3,	p4,
	p5,	p6,	p7,	p8,	p9
};

const unsigned char phundred[] = {
	UK_HX,	S1,	UK_AH,	UK_N,	UK_D,	UK_R,	UK_AX,	UK_D,	SIL
};

const unsigned char pthousand[] = {
	UK_TH,	S1,	UK_AW,	UK_Z,	UK_AX,	UK_N,	UK_D,	SIL
};

const unsigned char pmillion[] = {
	UK_M,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,	SIL
};

const unsigned char pbillion[] = {
	UK_B,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,	SIL
};

const unsigned char ptrillion[] = {
	UK_T,	UK_R,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,	SIL
};

const unsigned char pquadrillion[] = {
	UK_K,	UK_W,	UK_OH,	UK_D,	UK_R,	S1,	UK_IH,	UK_LL,	UK_Y,	UK_AX,	UK_N,	SIL
};

const unsigned char p10[]	= {
	UK_T,	S1,	UK_EH,	UK_N,	SIL
};

const unsigned char p11[]	= {
	UK_IX,	UK_LL,	S1,	UK_EH,	UK_V,	UK_AX,	UK_N,	SIL
};

const unsigned char p12[]	= {
	UK_T,	UK_W,	S1,	UK_EH,	UK_LL,	UK_V,	SIL
};

const unsigned char p13[]	= {
        UK_TH,     UK_RR, MBOUND,     UK_T,      S1,     UK_IY,     UK_N,
	SIL
};

const unsigned char p14[]	= {
	UK_F,	S1,	UK_AO,	MBOUND,	UK_T,	S1,	UK_IY,	UK_N,
	SIL
};

const unsigned char p15[]	= {
	UK_F,	S1,	UK_IH,	UK_F,	MBOUND,	UK_T,	S1,	UK_IY,
	UK_N,	SIL
};

const unsigned char p16[]	= {
	UK_S,	S1,	UK_IH,	UK_K,	UK_S,	MBOUND,	UK_T,	S1,
	UK_IY,	UK_N,	SIL
};

const unsigned char p17[]	= {
	UK_S,	S1,	UK_EH,	UK_V,	UK_AX,	UK_N,	MBOUND,	UK_T,
	S1,	UK_IY,	UK_N,	SIL
};

const unsigned char p18[]	= {
	S1,	UK_EY,	MBOUND,	UK_T,	S1,	UK_IY,	UK_N,	SIL
};

const unsigned char p19[]	= {
	UK_N,	S1,	UK_AY,	UK_N,	MBOUND,	UK_T,	S1,	UK_IY,
	UK_N,	SIL
};

const unsigned char *const pteens[] = {
	p10,	p11,	p12,	p13,	p14,
	p15,	p16,	p17,	p18,	p19
};

const unsigned char pnone[]	= {
	SIL
};

const unsigned char p20[]	= {
	UK_T,	UK_W,	S1,	UK_EH,	UK_N,	UK_T,	UK_IY,	SIL
};

const unsigned char p30[]	= {
	UK_TH,	S1,	UK_RR,	UK_T,	UK_IY,	SIL
};

const unsigned char p40[]	= {
	UK_F,	S1,	UK_AO,	UK_T,	UK_IY,	SIL
};

const unsigned char p50[]	= {
	UK_F,	S1,	UK_IH,	UK_F,	UK_T,	UK_IY,	SIL
};

const unsigned char p60[]	= {
	UK_S,	S1,	UK_IH,	UK_K,	UK_S,	UK_T,	UK_IY,	SIL
};

const unsigned char p70[]	= {
	UK_S,	S1,	UK_EH,	UK_V,	UK_AX,	UK_N,	UK_T,	UK_IY,
	SIL
};

const unsigned char p80[]	= {
	S1,	UK_EY,	UK_T,	UK_IY,	SIL
};

const unsigned char p90[]	= {
	UK_N,	S1,	UK_AY,	UK_N,	UK_T,	UK_IY,	SIL
};

const unsigned char *const ptens[]	= {
	pnone,	pnone,	p20,	p30,	p40,
	p50,	p60,	p70,	p80,	p90
};

const unsigned char ppence[] = {
	UK_P,	S1,	UK_EH,	UK_N,	UK_S,	SIL
};

const unsigned char ppercent[] = {
	WBOUND, UK_P,	UK_AX,	UK_S,	S1,	UK_EH,	UK_N,	UK_T,
	SIL
};
	
const unsigned char pcent[] = {
	UK_S,	S1,	UK_EH,	UK_N,	UK_T,	SIL
};

const unsigned char peuro[] = {
	WBOUND, S1, UK_YU, UK_R, UK_OW, SIL
};

const unsigned char ppound[] = {
	WBOUND,	UK_P,	S1,	UK_AW,	UK_N,	UK_D,	SIL
};

const unsigned char pdollar[] = {
	WBOUND,	UK_D,	S1,	UK_OH,	UK_LL,	UK_AX,	SIL
};

const unsigned char pand[] = {
	WBOUND,	VPSTART, UK_AE,	UK_N,	UK_D,	WBOUND,	SIL
};

const unsigned char ppoint[] = {
	UK_P,	S1,	UK_OY,	UK_N,	UK_T,	SIL
};

const unsigned char ptt2tp[] = {
	WBOUND,	UK_T,	S2,	UK_AY,	UK_M,	UK_Z,	WBOUND,
	UK_T,	S1,	UK_EH,	UK_N,	WBOUND,	UK_T,	UK_AX,
	WBOUND,	UK_DH,	UK_AX,	WBOUND,	UK_P,	S1,	UK_AR,	
	WBOUND,	SIL
};

const unsigned char pjan[] = {
	UK_JH,	S1,	UK_AE,	UK_N,	UK_Y,	UK_UR,	UK_R,	UK_IY,
	SIL
};

const unsigned char pfeb[] = {
	UK_F,	S1,	UK_EH,	UK_B,	UK_R,	UK_UW,	UK_AX,	UK_R,
	UK_IY,	SIL
};

const unsigned char pmar[] = {
	UK_M,	S1,	UK_AA,	UK_CH,	SIL
};

const unsigned char papr[] = {
	S1,	UK_EY,	UK_P,	UK_R,	UK_IX, UK_LX, SIL
};

const unsigned char pmay[] = {
	UK_M,	S1,	UK_EY,	SIL
};

const unsigned char pjun[] = {
	UK_JH,	S1,	UK_UW,	UK_N,	SIL
};

const unsigned char pjul[] = {
	UK_JH,	UK_AX,	UK_LL,	S1,	UK_AY,	SIL
};

const unsigned char	paug[] = {
	S1,	UK_AO,	UK_G,	UK_AX,	UK_S,	UK_T,	SIL
};
 
const unsigned char	psep[] = {
	UK_S,	UK_EH,	UK_P,	UK_T,	S1,	UK_EH,	UK_M,	UK_B,
	UK_AX,	SIL
};
 
const unsigned char	poct[] = {
	UK_OH,	UK_K,	UK_T,	S1,	UK_OW,	UK_B,	UK_AX,	SIL
};
 
const unsigned char	pnov[] = {
	UK_N,	UK_OW,	UK_V,	S1,	UK_EH,	UK_M,	UK_B,	UK_AX,
	SIL
};
 
const unsigned char	pdec[] = {
	UK_D,	UK_IX,	UK_S,	S1,	UK_EH,	UK_M,	UK_B,	UK_AX,
	SIL
};
 
const unsigned char *const pmonths[] = {
	pjan, pfeb,	pmar,	papr,	pmay,	pjun,
	pjul,	paug,	psep,	poct,	pnov,	pdec
};
 
const unsigned char	p0th[] = {
	UK_Z,	S1,	UK_IR,	UK_OW,	UK_TH,	SIL
};
 
const unsigned char	p1st[] = {
	UK_F,	S1,	UK_RR,	UK_S,	UK_T,	SIL
};
 
const unsigned char	p2nd[] = {
	UK_S,	S1,	UK_EH,	UK_K,	UK_AX,	UK_N,	UK_D,	SIL
};
 
const unsigned char	p3rd[] = {
	UK_TH,	S1,	UK_RR,	UK_D,	SIL
};
 
const unsigned char	p4th[] = {
	UK_F,	S1,	UK_AO,	UK_TH,	SIL
};
 
const unsigned char	p5th[] = {
	UK_F,	S1,	UK_IH,	UK_F,	UK_TH,	SIL
};
 
const unsigned char	p6th[] = {
	UK_S,	S1,	UK_IH,	UK_K,	UK_S,	UK_TH,	SIL
};
 
const unsigned char	p7th[] = {
	UK_S,	S1,	UK_EH,	UK_V,	UK_AX,	UK_N,	UK_TH,	SIL
};
 
const unsigned char	p8th[] = {
	S1,	UK_EY,	UK_T, UK_TH,	SIL
};
 
const unsigned char	p9th[] = {
	UK_N,	S1,	UK_AY,	UK_N,	UK_TH,	SIL
};

const unsigned char *const pordin[] = {
	p0th,	p1st,	p2nd,	p3rd,	p4th,
	p5th,	p6th,	p7th,	p8th,	p9th
};
 
const unsigned char	phalf[] = {
	UK_HX,	S1,	UK_AA,	UK_F,	SIL
};

 
const unsigned char	phalves[] = {
	UK_HX,	S1,	UK_AA,	UK_V,	UK_Z,	SIL
};

const unsigned char	pthe[] = {
	UK_DH,	S1,	UK_AX,	SIL
};

const unsigned char	pof[] = {
	S1,	UK_AX,	UK_V,	SIL
};

/*
 * This table, indexed by the grapheme
 * codes, returns the basic set of features.
 * The "[+GEM]" feature, and the setting of the
 * "[+VOC]" and "[+CONS]" on the letter "Y" are
 * special, and get done by "ls_rule_add_graph" with
 * some special code.
 */

const U16 feats[] = {
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
	/* GL 12/09/1997, the new setting will break the words like tiny.
	   Y should have the same feature as US */
	FSEG,								/* Y				*/
//	FSEG+FCONS+FHIGH,					/* Y				*/
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
	PVOC+PVOICE,				/* RR				        */
	PVOC+PVOICE,				/* YU				        */
	PVOC+PVOICE,				/* AX				        */
	PVOC+PVOICE,				/* IX				        */
	PVOC+PVOICE,				/* IR						*/
	PVOC+PVOICE,				/* UR	                	*/
	PVOC+PVOICE,				/* ER	                    */
	PVOC+PVOICE,				/* OR	                	*/
	PVOC+PVOICE,				/* AR						*/
	PCONS,						/* W				        */
	PCONS,						/* Y				        */
	PCONS+PVOICE,				/* R				        */
	PCONS+PVOICE,				/* LL				        */
	PCONS,						/* HX				        */
	PVOC+PVOICE,				/* OH						*/
    0,                          /* LX   PCONS+PVOICE            */
	PCONS+PVOICE+POBS,			/* M						*/
	PCONS+PVOICE+POBS,			/* N				        */
	PCONS+PVOICE,				/* NX				        */
	PBOTH+PVOICE,				/* EL				        */
        PCONS+POBS+PTD+PVOICE,           /* DZ                                           */
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
	PVOC+PVOICE,				/* YR						*/
	PCONS,						/* TX				        */
	0,							/* Q				        */
	PCONS+PSIB,					/* CH				        */
	PCONS+PVOICE+PSIB,			/* UK_JH,				        */
	0,							/* DF	(dummy one)			*/
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

/* EAB 12/2/7 oh expects reduced form and unreduces them and special word cause them
to be cite(unreduced in short phrase*/

const unsigned char sdic[] = 
{
	//9,'f','o','r',EOS,SPECIALWORD,PPSTART,UK_F,UK_AX,SIL,  //CH  11/17/1997  AO->AX
	//10,'a','n','d',EOS,SPECIALWORD,PPSTART,UK_AX,UK_N,UK_D,SIL, //CH  11/17/1997  AE->AX 
	//8,'a','t',EOS,SPECIALWORD,PPSTART,UK_AX,UK_T,SIL, //CH  11/17/1997  AE->AX 
	12,'m','w','i','z','i',EOS,PPSTART,UK_K,UK_AO,UK_P,UK_IY,SIL,
	//BATS 963 chnage to american version of to variant rduction for now
	//8,'t','o',EOS,SPECIALWORD,PPSTART,UK_T,UK_UH,SIL,  //CH  11/17/1997  UW->AX
	0	
};

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
	9,'w','h','e','t','h','e','r',EOS,SIL,	
	0	
};



#ifndef ACNA
const unsigned char	preftab[] = {
	2,				UK_OH,	UK_B,
	4+PCONT+P2SYL,	UK_AH,	UK_N,	UK_D,	UK_AX,
	2+PCONT,		UK_AX,	UK_N,
	3,				UK_B,	UK_AY,	UK_D,
	3,				UK_B,	UK_AY,	UK_F,
	3,				UK_B,	UK_AY,	UK_K,
	3,				UK_B,	UK_AY,	UK_LL,
	3,				UK_B,	UK_AY,	UK_N,
	3,				UK_B,	UK_AY,	UK_P,
	3,				UK_B,	UK_AY,	UK_R,
	3,				UK_B,	UK_AY,	UK_S,
	2+PRCON,		UK_B,	UK_EH,
	2+PRCON,		UK_B,	UK_IY,
	2+PRCON,		UK_D,	UK_EH,

	/* GL 03/14/1997 for BATS#294, add this rule to fix all
	   disa- word stress problem */
	4+PCONT+P2SYL,	UK_D,	UK_IH,	UK_S, UK_AE,

	3+PCONT,		UK_D,	UK_IH,	UK_S,
	2+PRCON,		UK_D,	UK_IH,
	4,				UK_D,	UK_IX,	UK_M,	UK_EH,
	4,				UK_D,	UK_IX,	UK_M,	UK_IH,
	3,				UK_D,	UK_IX,	UK_P,
	3,				UK_D,	UK_IX,	UK_R,
	3,				UK_D,	UK_IX,	UK_V,
	2+PRCON,		UK_D,	UK_IY,	
	2,				UK_EH,	UK_K,
	2,				UK_EH,	UK_M,
	2,				UK_EH,	UK_N,
	2,				UK_EH,	UK_R,
        2,                              UK_F,      UK_AO,
	3,				UK_K,	UK_OH,	UK_LL,
	3,				UK_K,	UK_OH,	UK_M,
	3,				UK_K,	UK_OH,	UK_N,
	3,				UK_K,	UK_OH,	UK_R,
	4+PCONT+P2SYL,	UK_IH,	UK_N,	UK_T,	UK_AX,
	2+PCONT,		UK_IH,	UK_N,
	3+PCONT,		UK_M,	UK_IH,	UK_S,
	3+PCONT,		UK_N,	UK_OH,	UK_N,
	3+PCONT+P2SYL,	UK_OW,	UK_V,	UK_AX,
	3,				UK_P,	UK_R,	UK_OW,
	3,				UK_P,	UK_R,	UK_IY,
	2+PCONT+PRCON,	UK_R,	UK_EH,
	3,				UK_S,	UK_AH,	UK_P,
	3,				UK_S,	UK_AH,	UK_S,
	5,				UK_T,	UK_R,	UK_AA, UK_N,	UK_S,
	3,				UK_W,	UK_IH,	UK_DH,
	0
};                              



#endif /* #ifndef ACNA */

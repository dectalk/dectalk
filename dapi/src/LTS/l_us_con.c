/*
 ***********************************************************************
 *                                                                      
 *                           Coryright (c)                              
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.        
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
 * 021  EAB		2/2/99 Fixed BATS 863 which corrected the number before 
				a quatitiy (hudred thousand ect ) from stressed to unstressed
				Plus Made NWSNOAA->NWS_US
				change to support more than nwsnooa for english only
 * 022 EAB		3/4/99 Correct typo in up8 
 * 023 GL		05/14/1999		BATS#865 create OHpunits[] for NWS_US 
 */
  
  
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

U16 lsctype[] = {

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
	ALWAYS+UU+PR,		/* Y (-V, -C)		            */
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
	ALWAYS+PR,			/* y (-V, -C)					*/
	ALWAYS+C+PR,		/* z							*/
	ALWAYS+LS+FB+PR,	/* {							*/
	ALWAYS+PR,			/* |							*/
	ALWAYS+RS+FB+PR,	/* }							*/
	ALWAYS+PR,			/* ~							*/
	IGNORE,				/* DEL							*/
	IGNORE,
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

unsigned char nabtab[] = {

	28,	'c',	'm',	EOS,
	S,	S1,	EH,	N,	T,	AX,	M,	S2,
	IY,	T,	RR,	SIL,
	S,	S1,	EH,	N,	T,	AX,	M,	S2,
	IY,	T,	RR,	Z,	SIL,

	26,	'm','m',EOS,
	M,	S1,	IH,	LL,	AX,	M,	S2,	IY,
	T,	RR,	SIL,
	M,	S1,	IH,	LL,	AX,	M,	S2,	IY,
	T,	RR,	Z,	SIL,

	24,	'k','m',EOS,
	K,	IX,	LL,	S1,	AA,	M,	AX,	T,
	RR,	SIL,
	K,	IX,	LL,	S1,	AA,	M,	AX,	T,
	RR,	Z,	SIL,

	15,	'i','n',EOS,
	S1,	IH,	N,	SH,	SIL,
	S1,	IH,	N,	SH,	IX,	Z,	SIL,

	18,	'i','n','s',EOS,
	S1,	IH,	N,	SH,	IX,	Z,	SIL,
	S1,	IH,	N,	SH,	IX,	Z,	SIL,

	13,	'f','t',EOS,
	F,	S1,	UH,	T,	SIL,
	F,	S1,	IY,	T,	SIL,

	16,	'y','d',EOS,
	Y,	S1,	AA,	R,	D,	SIL,
	Y,	S1,	AA,	R,	D,	Z,	SIL,

	18,	'y','d','s',EOS,
	Y,	S1,	AA,	R,	D,	Z,	SIL,
	Y,	S1,	AA,	R,	D,	Z,	SIL,

	14,	'm',	'i',	EOS,
	M,	S1,	AY,	LL,	SIL,
	M,	S1,	AY,	LL,	Z,	SIL,

	18,	'h',	'a',	EOS,
	HX,	S1,	EH,	K,	T,	RR,	SIL,
	HX,	S1,	EH,	K,	T,	RR,	Z,	SIL,

	24,	'm',	'l',	EOS,
	M,	S1,	IH,	LL,	AX,	LL,	IY,	T,
	RR,	SIL,
	M,	S1,	IH,	LL,	AX,	LL,	IY,	T,
	RR,	Z,	SIL,


	25,	't',	's',	'p',	EOS,
	T,	S1,	IY,	MBOUND,	S,	P,	S1,	UW,
	N,	SIL,
	T,	S1,	IY,	MBOUND,	S,	P,	S1,	UW,
	N,	Z,	SIL,

	27,	't',	's',	'p',	's',	EOS,
	T,	S1,	IY,	MBOUND,	S,	P,	S1,	UW,
	N,	Z,	SIL,
	T,	S1,	IY,	MBOUND,	S,	P,	S1,	UW,
	N,	Z,	SIL,

	30,	't',	'b',	's',	'p',	EOS,
	T,	S1,	EY,	B,	EL,	MBOUND,	S,	P,
	S1,	UW,	N,	SIL,
	T,	S1,	EY,	B,	EL,	MBOUND,	S,	P,
	S1,	UW,	N,	Z,	SIL,

	32,	't',	'b',	's',	'p',	's',	EOS,
	T,	S1,	EY,	B,	EL,	MBOUND,	S,	P,
	S1,	UW,	N,	Z,	SIL,
	T,	S1,	EY,	B,	EL,	MBOUND,	S,	P,
	S1,	UW,	N,	Z,	SIL,

	18,	'q',	't',	EOS,
	K,	W,	S1,	OW,	R,	T,	SIL,
	K,	W,	S1,	OW,	R,	T,	S,	SIL,

	16,	'g',	'm',	EOS,
	G,	R,	S1,	AE,	M,	SIL,
	G,	R,	S1,	AE,	M,	Z,	SIL,

	24,	'm',	'g',	EOS,
	M,	S1,	IH,	LL,	AX,	G,	R,	AE,
	M,	SIL,
	M,	S1,	IH,	LL,	AX,	G,	R,	AE,
	M,	Z,	SIL,

	24,	'k',	'g',	EOS,
	K,	S1,	IH,	LL,	AX,	G,	R,	AE,
	M,	SIL,
	K,	S1,	IH,	LL,	AX,	G,	R,	AE,
	M,	Z,	SIL,

	16,	'l',	'b',	EOS,
	P,	S1,	AW,	N,	D,	SIL,
	P,	S1,	AW,	N,	D,	Z,	SIL,
	
	18,	'l',	'b',	's',	EOS,
	P,	S1,	AW,	N,	D,	Z,	SIL,
	P,	S1,	AW,	N,	D,	Z,	SIL,

	15,	'o',	'z',	EOS,
	S1,	AW,	N,	S,	SIL,
	S1,	AW,	N,	S,	IX,	Z,	SIL,

	18,	'o',	'z',	's',	EOS,
	S1,	AW,	N,	S,	IX,	Z,	SIL,
	S1,	AW,	N,	S,	IX,	Z,	SIL,

	32,	'n',	's',	'e',	'c',	EOS,
	N,	S1,	AE,	N,	OW,	S,	S1,	EH,
	K,	AX,	N,	D,	SIL,
	N,	S1,	AE,	N,	OW,	S,	S1,	EH,
	K,	AX,	N,	D,	Z,	SIL,

	34,	'u',	's',	'e',	'c',	EOS,
	M,	S1,	AY,	K,	R,	AX,	S,	S1,
	EH,	K,	AX,	N,	D,	SIL,
	M,	S1,	AY,	K,	R,	AX,	S,	S1,
	EH,	K,	AX,	N,	D,	Z,	SIL,

	32,	'm',	's',	'e',	'c',	EOS,
	M,	S1,	IH,	LL,	AX,	S,	S1,	EH,
	K,	AX,	N,	D,	SIL,
	M,	S1,	IH,	LL,	AX,	S,	S1,	EH,
	K,	AX,	N,	D,	Z,	SIL,

	21,	's',	'e',	'c',	EOS,
	S,	S1,	EH,	K,	AX,	N,	D,	SIL,
	S,	S1,	EH,	K,	AX,	N,	D,	Z,
	SIL,

	22,	's',	'e',	'c',	's',	EOS,
	S,	S1,	EH,	K,	AX,	N,	D,	SIL,
	S,	S1,	EH,	K,	AX,	N,	D,	Z,
	SIL,

	19,	'm',	'i',	'n',	EOS,
	M,	S1,	IH,	N,	IX,	T,	SIL,
	M,	S1,	IH,	N,	IX,	T,	S,	SIL,

	12,	'h',	'r',	EOS,
	S1,	AW,	R,	SIL,
	S1,	AW,	R,	Z,	SIL,

	19,	'd',	'e',	'g',	EOS,
	D,	AX,	G,	R,	S1,	IY,	SIL,
	D,	AX,	G,	R,	S1,	IY,	Z,	SIL,

	14,	'k',	't',	EOS,
	N,	S1,	AA,	T,	SIL,
	N,	S1,	AA,	T,	S,	SIL,

	16,	'k',	't',	's',	EOS,
	N,	S1,	AA,	T,	S,	SIL,
	N,	S1,	AA,	T,	S,	SIL,

	0
};

/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronounciation of the number words.
 * There is only a single phoneme string.
 */

unsigned char nwdtab[] = {
	17,	'h',	'u',	'n',	'd',	'r',	'e',	'd',
	EOS,
	HX,	S1,	AH,	N,	D,	R,	AX,	D,
	SIL,

	17,	't',	'h',	'o',	'u',	's',	'a',	'n',
	'd',	EOS,
	TH,	S1,	AW,	S,	AX,	N,	D,	SIL,

	16,	'm',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	M,	S1,	IH,	LL,	Y,	AX,	N,	SIL,

	16,	'b',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	B,	S1,	IH,	LL,	Y,	AX,	N,	SIL,

	18,	't',	'r',	'i',	'l',	'l',	'i',	'o',
	'n',	EOS,
	T,	R,	S1,	IH,	LL,	Y,	AX,	N,
	SIL,

	16,	'z',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	Z,	S1,	IH,	LL,	Y,	AX,	N,	SIL,

	0
};


unsigned char m_jan[] = "jan";
unsigned char m_feb[] = "feb";
unsigned char m_mar[] = "mar";
unsigned char m_apr[] = "apr";
unsigned char m_may[] = "may";
unsigned char m_jun[] = "jun";
unsigned char m_jul[] = "jul";
unsigned char m_aug[] = "aug";
unsigned char m_sep[] = "sep";
unsigned char m_oct[] = "oct";
unsigned char m_nov[] = "nov";
unsigned char m_dec[] = "dec";

unsigned char  *months[] = {
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

unsigned char pdegree[] = {
	D,	IX,	G,	R,	S1,	IY,	SIL
};

/* 
 * unsigned char pdash[] = {
 *	D,	S1,	AE,	SH,	SIL
 * };	eab out-found no longer used
 */
                                                        
unsigned char pminus[] = {
	M,	S1,	AY,	N,	AX,	S,	SIL
};

unsigned char pplus[] = {
	P, LL,	S1, AH,	S,	SIL
};


unsigned char pstreet[] = {
	S,	T,	R,	S2,	IY,	T,	SIL
};

unsigned char psaint[]  = {
	S,	EY,	N,	T,	SIL
};

unsigned char pdoctor[] = {
	D,	AA,	K,	T,	RR,	SIL
};

unsigned char pdrive[] = {
	D,	R,	S1,	AY,	V,	SIL
};

/* 020	MGS	11/23/1998	BATS #329 fixed 02-apr-2001 */
unsigned char pOH[] = {
	S1,	OW,	SIL
};


unsigned char p0[]	= {
	Z,	S1,	IY,	R,	OW,	SIL
};

unsigned char p1[]	= {
	W,	S1,	AH,	N,	SIL
};

unsigned char p2[]	= {
	T,	S1,	UW,	SIL
};

unsigned char p3[]	= {
	TH,	R,	S1,	IY,	SIL
};

unsigned char p4[]	= {
	F,	S1,	OR,	SIL
};

unsigned char p5[]	= {
	F,	S1,	AY,	V,	SIL
};

unsigned char p6[]	= {
	S,	S1,	IH,	K,	S,	SIL
};

unsigned char p7[]	= {
	S,	S1,	EH,	V,	AX,	N,	SIL
};

unsigned char p8[]	= {
	S1,	EY,	T,	SIL
};

unsigned char p9[]	= {
	N,	S1,	AY,	N,	SIL
};

unsigned char up0[]	= {
	Z,	S1,	IY,	R,	OW,	SIL
};

unsigned char up1[]	= {
	W,		AH,	N,	SIL
};

unsigned char up2[]	= {
	T,		UW,	SIL
};

unsigned char up3[]	= {
	TH,	R,	IY,	SIL
};

unsigned char up4[]	= {
	F,	OR,	SIL
};

unsigned char up5[]	= {
	F,	AY,	V,	SIL
};

unsigned char up6[]	= {
	S,	IH,	K,	S,	SIL
};

unsigned char up7[]	= {
	S,	EH,	V,	AX,	N,	SIL
};

unsigned char up8[]	= {
		EY,	T,	SIL
};

unsigned char up9[]	= {
	N,	AY,	N,	SIL
};

#ifdef NWS_US
/* GL 05/14/1999, BATS#865 take care of both decimal number and time" */
/*                force 12:04 to use this Ounit[] */
unsigned char *OHpunits[] = {
	pOH, p1,	p2,	p3,	p4,
	p5,	p6,	p7,	p8,	p9
};
#endif

unsigned char *punits[] = {
	p0,	p1,	p2,	p3,	p4,
	p5,	p6,	p7,	p8,	p9
};

//BATS 841 -Allow for ustressed digits before hundrd, thousand etc. 
//EAB 2/2/99
unsigned char *upunits[] = {
	up0,	up1,	up2,	up3,	up4,
	up5,	up6,	up7,	up8,	up9
};


unsigned char phundred[] = {
	HX,	S1,	AH,	N,	D,	R,	AX,	D,	SIL
};

unsigned char pthousand[] = {
	TH,	S1,	AW,	Z,	AX,	N,	D,	SIL
};

unsigned char pmillion[] = {
	M,	S1,	IH,	LL,	Y,	AX,	N,	SIL
};

unsigned char pbillion[] = {
	B,	S1,	IH,	LL,	Y,	AX,	N,	SIL
};

unsigned char ptrillion[] = {
	T,	R,	S1,	IH,	LL,	Y,	AX,	N,	SIL
};

unsigned char pquadrillion[] = {
	K,	W,	AO,	D,	R,	S1,	IH,	LL,	Y,	AX,	N,	SIL
};

unsigned char p10[]	= {
	T,	S1,	EH,	N,	SIL
};

unsigned char p11[]	= {
	AX,	LL,	S1,	EH,	V,	AX,	N,	SIL
};

unsigned char p12[]	= {
	T,	W,	S1,	EH,	LL,	V,	SIL
};

unsigned char p13[]	= {
	TH,	S1,	RR,	MBOUND,	T,	S1,	IY,	N,
	SIL
};

unsigned char p14[]	= {
	F,	S1,	OR,	MBOUND,	T,	S1,	IY,	N,
	SIL
};

unsigned char p15[]	= {
	F,	S1,	IH,	F,	MBOUND,	T,	S1,	IY,
	N,	SIL
};

unsigned char p16[]	= {
	S,	S1,	IH,	K,	S,	MBOUND,	T,	S1,
	IY,	N,	SIL
};

unsigned char p17[]	= {
	S,	S1,	EH,	V,	AX,	N,	MBOUND,	T,
	S1,	IY,	N,	SIL
};

unsigned char p18[]	= {
	S1,	EY,	MBOUND,	T,	S1,	IY,	N,	SIL
};

unsigned char p19[]	= {
	N,	S1,	AY,	N,	MBOUND,	T,	S1,	IY,
	N,	SIL
};

unsigned char *pteens[] = {
	p10,	p11,	p12,	p13,	p14,
	p15,	p16,	p17,	p18,	p19
};

unsigned char pnone[]	= {
	SIL
};

unsigned char p20[]	= {
	T,	W,	S1,	EH,	N,	T,	IY,	SIL
};

unsigned char p30[]	= {
	TH,	S1,	RR,	T,	IY,	SIL
};

unsigned char p40[]	= {
	F,	S1,	OR,	T,	IY,	SIL
};

unsigned char p50[]	= {
	F,	S1,	IH,	F,	T,	IY,	SIL
};

unsigned char p60[]	= {
	S,	S1,	IH,	K,	S,	T,	IY,	SIL
};

unsigned char p70[]	= {
	S,	S1,	EH,	V,	AX,	N,	T,	IY,
	SIL
};

unsigned char p80[]	= {
	S1,	EY,	T,	IY,	SIL
};

unsigned char p90[]	= {
	N,	S1,	AY,	N,	T,	IY,	SIL
};

unsigned char *ptens[]	= {
	pnone,	pnone,	p20,	p30,	p40,
	p50,	p60,	p70,	p80,	p90
};

unsigned char ppence[] = {
	P,	S1,	EH,	N,	S,	SIL
};

unsigned char ppercent[] = {
	WBOUND, P,	RR,	S,	S1,	EH,	N,	T,
	SIL
};
	
unsigned char pcent[] = {
	S,	S1,	EH,	N,	T,	SIL
};

unsigned char ppound[] = {
	WBOUND,	P,	S1,	AW,	N,	D,	SIL
};

unsigned char pdollar[] = {
	WBOUND,	D,	S1,	AA,	LL,	RR,	SIL
};

unsigned char pand[] = {
	WBOUND,	VPSTART, EH,	N,	D,	WBOUND,	SIL
};

unsigned char ppoint[] = {
	P,	S1,	OY,	N,	T,	SIL
};

unsigned char ptt2tp[] = {
	WBOUND,	T,	S2,	AY,	M,	Z,	WBOUND,
	T,	S1,	EH,	N,	WBOUND,	T,	UH,
	WBOUND,	DH,	AX,	WBOUND,	P,	S1,	AW,
	RR,	WBOUND,	SIL
};

unsigned char pjan[] = {
	JH,	S1,	AE,	N,	YU,	EH,	R,	IY,
	SIL
};

unsigned char pfeb[] = {
	F,	S1,	EH,	B,	R,	UW,	EH,	R,
	IY,	SIL
};

unsigned char pmar[] = {
	M,	S1,	AA,	R,	CH,	SIL
};

unsigned char papr[] = {
	S1,	EY,	P,	R,	EL,	SIL
};

unsigned char pmay[] = {
	M,	S1,	EY,	SIL
};

unsigned char pjun[] = {
	JH,	S1,	UW,	N,	SIL
};

unsigned char pjul[] = {
	JH,	IX,	LL,	S1,	AY,	SIL
};

unsigned char	paug[] = {
	S1,	AO,	G,	AX,	S,	T,	SIL
};

 
unsigned char	psep[] = {
	S,	EH,	P,	T,	S1,	EH,	M,	B,
	RR,	SIL
};

 
unsigned char	poct[] = {
	AA,	K,	T,	S1,	OW,	B,	RR,	SIL
};

 
unsigned char	pnov[] = {
	N,	OW,	V,	S1,	EH,	M,	B,	RR,
	SIL
};

 
unsigned char	pdec[] = {
	D,	IX,	S,	S1,	EH,	M,	B,	RR,
	SIL
};

 
unsigned char *pmonths[] = {
	pjan, pfeb,	pmar,	papr,	pmay,	pjun,
	pjul,	paug,	psep,	poct,	pnov,	pdec
};

 
unsigned char	p0th[] = {
	Z,	S1,	IY,	R,	OW,	TH,	SIL
};

 
unsigned char	p1st[] = {
	F,	S1,	RR,	S,	T,	SIL
};

 
unsigned char	p2nd[] = {
	S,	S1,	EH,	K,	AX,	N,	D,	SIL
};

 
unsigned char	p3rd[] = {
	TH,	S1,	RR,	D,	SIL
};

 
unsigned char	p4th[] = {
	F,	S1,	OR,	TH,	SIL
};

 
unsigned char	p5th[] = {
	F,	S1,	IH,	F,	TH,	SIL
};

 
unsigned char	p6th[] = {
	S,	S1,	IH,	K,	S,	TH,	SIL
};

 
unsigned char	p7th[] = {
	S,	S1,	EH,	V,	AX,	N,	TH,	SIL
};

 
unsigned char	p8th[] = {
	S1,	EY,	TH,	SIL
};

 
unsigned char	p9th[] = {
	N,	S1,	AY,	N,	TH,	SIL
};

 
unsigned char *pordin[] = {
	p0th,	p1st,	p2nd,	p3rd,	p4th,
	p5th,	p6th,	p7th,	p8th,	p9th
};

 
unsigned char	phalf[] = {
	HX,	S1,	AE,	F,	SIL
};

 
unsigned char	phalves[] = {
	HX,	S1,	AE,	V,	Z,	SIL
};

unsigned char	pthe[] = {
	DH,	S1,	AX,	SIL
};
unsigned char	pof[] = {
	S1,	AX,	V,	SIL
};

/*
 * This table, indexed by the grapheme
 * codes, returns the basic set of features.
 * The "[+GEM]" feature, and the setting of the
 * "[+VOC]" and "[+CONS]" on the letter "Y" are
 * special, and get done by "ls_rule_add_graph" with
 * some special code.
 */

U16 feats[]	= {
	0,									/* End mark			*/
	FSEG+FVOC+FSYL,						/* A				*/
	FSEG+FCONS+FVOICE,					/* B				*/
	FSEG+FCONS+FC,						/* C				*/
	FSEG+FCONS+FVOICE+FCOR,				/* D				*/
	FSEG+FVOC+FSYL,						/* E				*/
	FSEG+FCONS,							/* F				*/
	FSEG+FCONS+FVOICE+FVELAR,			/* G				*/
	FSEG+FCONS,							/* H				*/
	FSEG+FVOC+FHIGH+FSYL,				/* I				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,		/* J				*/
	FSEG+FCONS+FVELAR,					/* K				*/
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
	FSEG+FCONS+FVOICE+FVELAR,			/* GU				*/
	FSEG+FCONS,							/* QU				*/
	0,									/* '				*/
	0									/* +				*/
};

/*
 * Feature table.
 * Index by phoneme.
 */

U16 pfeat[] = {
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
	PVOC+PVOICE,				/* YU				        */
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

unsigned char sdic[] = 
{
#ifndef NWS_US
	9,'f','o','r',EOS,SPECIALWORD,PPSTART,F,RR,SIL,
#else
	9,'f','o','r',EOS,SPECIALWORD,PPSTART,F,OR,SIL,
#endif
	10,'a','n','d',EOS,SPECIALWORD,PPSTART,EH,N,D,SIL,
	12,'m','w','i','z','i',EOS,PPSTART,K,AO,P,IY,SIL,
	8,'t','o',EOS,SPECIALWORD,PPSTART,T,UH,SIL,
	0	
};

unsigned char whdic[] = 
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
unsigned char	preftab[] = {
	2,				AA,	B,
	4+PCONT+P2SYL,	AH,	N,	D,	RR,
	2+PCONT,		AX,	N,
	3,				B,	AY,	D,
	3,				B,	AY,	F,
	3,				B,	AY,	K,
	3,				B,	AY,	LL,
	3,				B,	AY,	N,
	3,				B,	AY,	P,
	3,				B,	AY,	R,
	3,				B,	AY,	S,
	2+PRCON,		B,	EH,
	2+PRCON,		B,	IY,
	2+PRCON,		D,	EH,

	/* GL 03/14/1997 for BATS#294, add this rule to fix all
	   disa- word stress problem */
	4+PCONT+P2SYL,	D,	IH,	S, AE,

	3+PCONT,		D,	IH,	S,
	2+PRCON,		D,	IH,
	4,				D,	IX,	M,	EH,
	4,				D,	IX,	M,	IH,
	3,				D,	IX,	P,
	3,				D,	IX,	R,
	3,				D,	IX,	V,
	2+PRCON,		D,	IY,	
	2,				EH,	K,
	2,				EH,	M,
	2,				EH,	N,
	2,				EH,	R,
	3,				F,	AO,	R,
	3,				K,	AA,	LL,
	3,				K,	AA,	M,
	3,				K,	AA,	N,
	3,				K,	AO,	R,
	4+PCONT+P2SYL,	IH,	N,	T,	RR,
	2+PCONT,		IH,	N,
	3+PCONT,		M,	IH,	S,
	3+PCONT,		N,	AA,	N,
	3+PCONT+P2SYL,	OW,	V,	RR,
	3,				P,	R,	AA,
	3,				P,	R,	IY,
	2+PCONT+PRCON,	R,	EH,
	3,				S,	AH,	P,
	3,				S,	AH,	S,
	5,				T,	R,	AE,	N,	S,
	3,				W,	IH,	TH,
	0
};                              



#endif /* #ifndef ACNA */

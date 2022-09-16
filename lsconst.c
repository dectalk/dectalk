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
 *    File Name:	lsconst.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk p3 and beyond ... constant tabular data is collected here
 *  just to make dealing with it a bit easier ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -------         ---------------------------------------
 * 001  ??      05/25/93        Changed pronunciation of dash default to nothing
 * 002  GL      06/03/96        add pbillion[], ptrillion[] and pquadrillion[]
 *
 */
#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include "lsdef.h"

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
//#ifndef CALLER_ID   //was ifdef CALLER_ID  MFG

const unsigned short lsctype[] = {

	IGNORE,				/* NUL				*/
	IGNORE,				/* SOH				*/
	IGNORE,				/* STX				*/
	IGNORE,				/* ETX				*/
	IGNORE,				/* EOT				*/
	IGNORE,				/* ENQ				*/
	IGNORE,				/* ACK				*/
	IGNORE,				/* BEL	(Could be a word)	*/
	BACKUP,				/* BS				*/
	NEVER,				/* HT				*/
	NEVER,				/* LF				*/
	NEVER,				/* VT				*/
	NEVER,				/* FF				*/
	NEVER,				/* CR				*/
	IGNORE,				/* SO				*/
	IGNORE,				/* SI				*/
	IGNORE,				/* DLE				*/
	IGNORE,				/* DC1				*/
	IGNORE,				/* DC2				*/
	IGNORE,				/* DC3				*/
	IGNORE,				/* DC4				*/
	IGNORE,				/* NAK				*/
	IGNORE,				/* SYN				*/
	IGNORE,				/* ETB				*/
	IGNORE,				/* CAN				*/
	IGNORE,				/* EM				*/
	IGNORE,				/* SUB	(Is this right?)	*/
	IGNORE,				/* ESC				*/
	IGNORE,				/* FS				*/
	IGNORE,				/* GS				*/
	IGNORE,				/* RS				*/
	IGNORE,				/* US				*/
	NEVER,		 		/* SP				*/
	MIGHT+PR,			/* !				*/
	ALWAYS+LS+RS+PR,	/* "				*/
	ALWAYS+PR,			/* #				*/
	ALWAYS+PR,			/* $				*/
	ALWAYS+PR,			/* %				*/
	ALWAYS+PR,			/* &				*/
	ALWAYS+PR,			/* '				*/
	ALWAYS+LS+FB+PR,	/* (				*/
	ALWAYS+RS+FB+PR,	/* )				*/
	ALWAYS+PR,			/* *				*/
	ALWAYS+PR,			/* +				*/
	MIGHT+PR,		   /* ,				*/
	ALWAYS+PR,			/* -				*/
	MIGHT+PR,     		/* .				*/
	ALWAYS+PR,			/* /				*/
	ALWAYS+PR,			/* 0				*/
	ALWAYS+PR,			/* 1				*/
	ALWAYS+PR,			/* 2				*/
	ALWAYS+PR,			/* 3				*/
	ALWAYS+PR,			/* 4				*/
	ALWAYS+PR,			/* 5				*/
	ALWAYS+PR,			/* 6				*/
	ALWAYS+PR,			/* 7				*/
	ALWAYS+PR,			/* 8				*/
	ALWAYS+PR,			/* 9				*/
	MIGHT+PR,			/* :				*/
	MIGHT+PR,			/* ;				*/
	ALWAYS+LS+FB+PR,	/* <				*/
	ALWAYS+PR,			/* =				*/
	ALWAYS+RS+FB+PR,	/* >				*/
	MIGHT+PR,			/* ?				*/
	ALWAYS+PR,			/* @				*/
	ALWAYS+UU+OO+PR,		/* A				*/
	ALWAYS+UU+C+PR,		/* B				*/
	ALWAYS+UU+C+PR,		/* C				*/
	ALWAYS+UU+C+PR,		/* D				*/
	ALWAYS+UU+OO+PR,		/* E				*/
	ALWAYS+UU+C+PR,		/* F				*/
	ALWAYS+UU+C+PR,		/* G				*/
	ALWAYS+UU+C+PR,		/* H				*/
	ALWAYS+UU+OO+PR,		/* I				*/
	ALWAYS+UU+C+PR,		/* J				*/
	ALWAYS+UU+C+PR,		/* K				*/
	ALWAYS+UU+C+PR,		/* L				*/
	ALWAYS+UU+C+PR,		/* M				*/
	ALWAYS+UU+C+PR,		/* N				*/
	ALWAYS+UU+OO+PR,	/* O				*/
	ALWAYS+UU+C+PR,		/* P				*/
	ALWAYS+UU+C+PR,		/* Q				*/
	ALWAYS+UU+C+PR,		/* R				*/
	ALWAYS+UU+C+PR,		/* S				*/
	ALWAYS+UU+C+PR,		/* T				*/
	ALWAYS+UU+OO+PR,		/* U				*/
	ALWAYS+UU+C+PR,		/* V				*/
	ALWAYS+UU+C+PR,		/* W				*/
	ALWAYS+UU+C+PR,		/* X				*/
	ALWAYS+UU+PR,		/* Y (-V, -C)			*/
	ALWAYS+UU+C+PR,		/* Z				*/
	ALWAYS+LS+FB+PR,	/* [				*/
	ALWAYS+PR,			/* \				*/
	ALWAYS+RS+FB+PR,	/* ]				*/
	ALWAYS+PR,			/* ^				*/
	ALWAYS+II+PR,		/* _				*/
	ALWAYS+PR,			/* `				*/
	ALWAYS+OO+PR,		/* a				*/
	ALWAYS+C+PR,		/* b				*/
	ALWAYS+C+PR,		/* c				*/
	ALWAYS+C+PR,		/* d				*/
	ALWAYS+OO+PR,		/* e				*/
	ALWAYS+C+PR,		/* f				*/
	ALWAYS+C+PR,		/* g				*/
	ALWAYS+C+PR,		/* h				*/
	ALWAYS+OO+PR,		/* i				*/
	ALWAYS+C+PR,		/* j				*/
	ALWAYS+C+PR,		/* k				*/
	ALWAYS+C+PR,		/* l				*/
	ALWAYS+C+PR,		/* m				*/
	ALWAYS+C+PR,		/* n				*/
	ALWAYS+OO+PR,		/* o				*/
	ALWAYS+C+PR,		/* p				*/
	ALWAYS+C+PR,		/* q				*/
	ALWAYS+C+PR,		/* r				*/
	ALWAYS+C+PR,		/* s				*/
	ALWAYS+C+PR,		/* t				*/
	ALWAYS+OO+PR,		/* u				*/
	ALWAYS+C+PR,		/* v				*/
	ALWAYS+C+PR,		/* w				*/
	ALWAYS+C+PR,		/* x				*/
	ALWAYS+PR,			/* y (-V, -C)			*/
	ALWAYS+C+PR,		/* z				*/
	ALWAYS+LS+FB+PR,	/* {				*/
	ALWAYS+PR,			/* |				*/
	ALWAYS+RS+FB+PR,	/* }				*/
	ALWAYS+PR,			/* ~				*/
	IGNORE,				/* DEL				*/
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,				/* IND				*/
	IGNORE,				/* NEL				*/
	IGNORE,				/* SSA				*/
	IGNORE,				/* ESA				*/
	IGNORE,				/* HTS				*/
	IGNORE,				/* HTJ				*/
	IGNORE,				/* VTS				*/
	IGNORE,				/* PLD				*/
	IGNORE,				/* PLU				*/
	IGNORE,				/* RI				*/
	IGNORE,				/* SS2				*/
	IGNORE,				/* SS3				*/
	IGNORE,				/* DCS				*/
	IGNORE,				/* PU1				*/
	IGNORE,				/* PU2				*/
	IGNORE,				/* STS				*/
	IGNORE,				/* CCH				*/
	IGNORE,				/* MW				*/
	IGNORE,				/* SPA				*/
	IGNORE,				/* EPA				*/
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,				/* CSI				*/
	IGNORE,				/* ST				*/
	IGNORE,				/* OSC				*/
	IGNORE,				/* PM				*/
	IGNORE,				/* APC				*/
	NEVER+PR,			/* SP				*/
	ALWAYS+LS+PR,		/* Inverted !			*/
	ALWAYS+PR, 			/* Cent symbol			*/
	ALWAYS+PR,			/* UK currency symbol		*/
	IGNORE,
	ALWAYS+PR,			/* Yen symbol			*/
	IGNORE,
	ALWAYS+PR,			/* Section symbol		*/
	ALWAYS+PR,			/* Blob with 4 little spikes	*/
	ALWAYS+PR,			/* Copyright symbol		*/
	ALWAYS+PR,			/* Underlined "a"		*/
	ALWAYS+LS+PR,		/* <<				*/
	IGNORE,
	IGNORE,
	IGNORE,
	ALWAYS+PR,			/* Degree symbol		*/
	ALWAYS+PR,			/* Plus-Minus			*/
	ALWAYS+PR,			/* Superscript 2		*/
	ALWAYS+PR,			/* Superscript 3		*/
	IGNORE,
	ALWAYS+PR,			/* Mu				*/
	ALWAYS+PR,			/* Paragraph			*/
	ALWAYS+PR,			/* Solid circle			*/
	IGNORE,
	ALWAYS+PR,			/* Superscript 1		*/
	ALWAYS+PR,			/* Underlined "o"		*/
	ALWAYS+RS+PR,		/* >>				*/
	ALWAYS+PR,			/* 1/4				*/
	ALWAYS+PR,			/* 1/2				*/
	IGNORE,
	ALWAYS+LS+PR,		/* Inverted ?			*/
	ALWAYS+UU+OO+PR,		/* A grave			*/
	ALWAYS+UU+OO+PR,		/* A acute			*/
	ALWAYS+UU+OO+PR,		/* A circumflex			*/
	ALWAYS+UU+OO+PR,		/* A tilde			*/
	ALWAYS+UU+OO+PR,		/* A diarasis			*/
	ALWAYS+UU+OO+PR,		/* A with circle (angstroms?)	*/
	ALWAYS+PR,			/* AE				*/
	ALWAYS+UU+C+PR,		/* C cdl.			*/
	ALWAYS+UU+OO+PR,		/* E grave			*/
	ALWAYS+UU+OO+PR,		/* E acute			*/
	ALWAYS+UU+OO+PR,		/* E circumflex			*/
	ALWAYS+UU+OO+PR,		/* E diarasis			*/
	ALWAYS+UU+OO+PR,		/* I grave			*/
	ALWAYS+UU+OO+PR,		/* I acute			*/
	ALWAYS+UU+OO+PR,		/* I circumflex			*/
	ALWAYS+UU+OO+PR,		/* I diarasis			*/
	IGNORE,
	ALWAYS+UU+C+PR,		/* N tilde			*/
	ALWAYS+UU+OO+PR,		/* O grave			*/
	ALWAYS+UU+OO+PR,		/* O acute			*/
	ALWAYS+UU+OO+PR,		/* O circumflex			*/
	ALWAYS+UU+OO+PR,		/* O tilde			*/
	ALWAYS+UU+OO+PR,		/* O diarasis			*/
	ALWAYS+UU+PR,		/* O E				*/
	ALWAYS+UU+OO+PR,		/* O with backslash		*/
	ALWAYS+UU+OO+PR,		/* U grave			*/
	ALWAYS+UU+OO+PR,		/* U acute			*/
	ALWAYS+UU+OO+PR,		/* U circumflex			*/
	ALWAYS+UU+OO+PR,		/* U diarasis			*/
	ALWAYS+UU+C+PR,		/* Y diarasis			*/
	IGNORE,
	ALWAYS+PR,			/* The "Beta" German thing.	*/
	ALWAYS+OO+PR,		/* a grave			*/
	ALWAYS+OO+PR,		/* a acute			*/
	ALWAYS+OO+PR,		/* a circumflex			*/
	ALWAYS+OO+PR,		/* a tilde			*/
	ALWAYS+OO+PR,		/* a diarasis			*/
	ALWAYS+OO+PR,		/* a with little circle		*/
	ALWAYS+PR,			/* ae				*/
	ALWAYS+C+PR,		/* c cdl.			*/
	ALWAYS+OO+PR,		/* e grave			*/
	ALWAYS+OO+PR,		/* e acute			*/
	ALWAYS+OO+PR,		/* e circumflex			*/
	ALWAYS+OO+PR,		/* e diarasis			*/
	ALWAYS+OO+PR,		/* i grave			*/
	ALWAYS+OO+PR,		/* i acute			*/
	ALWAYS+OO+PR,		/* i circumflex			*/
	ALWAYS+OO+PR,		/* i diarasis			*/
	IGNORE,
	ALWAYS+C+PR,		/* n tilde			*/
	ALWAYS+OO+PR,		/* O grave			*/
	ALWAYS+OO+PR,		/* O acute			*/
	ALWAYS+OO+PR,		/* O curcumflex			*/
	ALWAYS+OO+PR,		/* O tilde			*/
	ALWAYS+OO+PR,		/* O diarasis			*/
	ALWAYS+PR,			/* o e				*/
	ALWAYS+OO+PR,		/* O with line			*/
	ALWAYS+OO+PR,		/* U grave			*/
	ALWAYS+OO+PR,		/* U acute			*/
	ALWAYS+OO+PR,		/* U circumflex			*/
	ALWAYS+OO+PR,		/* U diarasis			*/
	ALWAYS+C+PR,		/* y diarasis			*/
	IGNORE,
	IGNORE
};
//#endif


/*
 * This table, indexed in the same
 * way as the above table, is used to crush out
 * case distinctions and diacriticals. An entry of
 * NOMAP means no change; otherwise the table contains
 * the result of the mapping.
 */
#ifndef CALLER_ID
const unsigned char lscrush[] = {
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	'a',		'b',		'c',		'd',		'e',		'f',		'g',
	'h',		'i',		'j',		'k',		'l',		'm',		'n',		'o',
	'p',		'q',		'r',		's',		't',		'u',		'v',		'w',
	'x',		'y',		'z',		NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
/* 8 */
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
/* 9 */
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
/* A */
	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
	NOMAP,	NOMAP,	'a',		NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
/* B */	
	NOMAP,	NOMAP,	'2',		'3',		NOMAP,	'u',		NOMAP,	NOMAP,
	NOMAP,	'1',		'o',		NOMAP,	NOMAP,	NOMAP,	NOMAP,	NOMAP,
/* C */
	'a',		'a',		'a',		'a',		'a',		'a',		'e',		'c',
	'e',		'e',		'e',		'e',		'i',		'i',		'i',		'i',
/* D */	
	NOMAP,	'n',		'o',		'o',		'o',		'o',		'o',		'e',
	'o',		'u',		'u',		'u',		'u',		'y',		NOMAP,	's',
/* E */
	'a',		'a',		'a',		'a',		'a',		'a',		'e',		'c',
	'e',		'e',		'e',		'e',		'i',		'i',		'i',		'i',
/* F */																	
	NOMAP,	'n',		'o',		'o',		'o',		'o',		'o',		'e',
	'o',		'u',		'u',		'u',		'u',		'y',		NOMAP,	NOMAP
};

#endif

#ifndef CALLER_ID

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
	S,	S1,	EH,	N,	T,	AX,	M,	S2,
	IY,	T,	RR,	SIL,
	S,	S1,	EH,	N,	T,	AX,	M,	S2,
	IY,	T,	RR,	Z,	SIL,

	26,	'm',	'm',	EOS,
	M,	S1,	IH,	LL,	AX,	M,	S2,	IY,
	T,	RR,	SIL,
	M,	S1,	IH,	LL,	AX,	M,	S2,	IY,
	T,	RR,	Z,	SIL,

	24,	'k',	'm',	EOS,
	K,	IX,	LL,	S1,	AA,	M,	AX,	T,
	RR,	SIL,
	K,	IX,	LL,	S1,	AA,	M,	AX,	T,
	RR,	Z,	SIL,

	15,	'i',	'n',	EOS,
	S1,	IH,	N,	SH,	SIL,
	S1,	IH,	N,	SH,	IX,	Z,	SIL,

	18,	'i',	'n',	's',	EOS,
	S1,	IH,	N,	SH,	IX,	Z,	SIL,
	S1,	IH,	N,	SH,	IX,	Z,	SIL,

	13,	'f',	't',	EOS,
	F,	S1,	UH,	T,	SIL,
	F,	S1,	IY,	T,	SIL,

	16,	'y',	'd',	EOS,
	Y,	S1,	AA,	R,	D,	SIL,
	Y,	S1,	AA,	R,	D,	Z,	SIL,

	18,	'y',	'd',	's',	EOS,
	Y,	S1,	AA,	R,	D,	Z,	SIL,
	Y,	S1,	AA,	R,	D,	Z,	SIL,

	14,	'm',	'i',	EOS,
	M,	S1,	AY,	LL,	SIL,
	M,	S1,	AY,	LL,	Z,	SIL,

	18,	'h',	'a',	EOS,
	HX,	S1,	EH,	K,	T,	ER,	SIL,
	HX,	S1,	EH,	K,	T,	ER,	Z,	SIL,

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

const unsigned char nwdtab[] = {
	17,	'h',	'u',	'n',	'd',	'r',	'e',	'd',
	EOS,
	HX,	S1,	AH,	N,	D,	R,	AX,	D,
	SIL,

	17,	't',	'h',	'o',	'u',	's',	'a',	'n',
	'd',	EOS,
	TH,	S1,	AW,	S,	AX,	N,	D,	SIL,

	16,	'm',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	M,	S1,	IH,	LL,	IY,	AX,	N,	SIL,

	16,	'b',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	B,	S1,	IH,	LL,	IY,	AX,	N,	SIL,

	18,	't',	'r',	'i',	'l',	'l',	'i',	'o',
	'n',	EOS,
	T,	R,	S1,	IH,	LL,	IY,	AX,	N,
	SIL,

	16,	'z',	'i',	'l',	'l',	'i',	'o',	'n',
	EOS,
	Z,	S1,	IH,	LL,	IY,	AX,	N,	SIL,

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

const unsigned char  *months[] = {
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

/*
 * This file contains a number
 * of canned phoneme strings. These are
 * used by the number rules, etc.
 * All are streams of bytes with a SI
 * phoneme on the end.
 *
 * Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
 *
 * 01 05-Apr-85 DGC	Changed [s] to [z] in "thousand".
 * 02 08-Apr-85 DGC	Added "pdegree".
 * 03 24-Apr-85 DGC	Fix some phomenes to agree with some
 *							dictionary changes.
 * 04 14-Jun-85 DGC	The "pplus" array isn't needed anymore.
 * 05 27-Jun-85 DGC	Remove last [d] from "thousand".
 * 06 24-Jul-85 DGC	[f'owr] to [f'or] and related forms.
 * 07 20-Aug-85 DGC	Undid 05; sounded bad.
 */


const unsigned char pdegree[] = {
	D,	IX,	G,	R,	S1,	IY,	SIL
};

/* unsigned char pdash[] = {
	D,	S1,	AE,	SH,	SIL
};	eab out-found no longer used*/

const unsigned char pminus[] = {
	M,	S1,	AY,	N,	AX,	S,	SIL
};

const unsigned char pplus[] = {
	P, LL,	S1, AH,	S,	SIL
};


const unsigned char pstreet[] = {
	S,	T,	R,	S2,	IY,	T,	SIL
};

const unsigned char psaint[]  = {
	S,	EY,	N,	T,	SIL
};

const unsigned char pdoctor[] = {
	D,	AA,	K,	T,	RR,	SIL
};

const unsigned char pdrive[] = {
	D,	R,	S1,	AY,	V,	SIL
};

#endif

//#ifndef CALLER_ID
const unsigned char p0[]	= {
	Z,	S1,	IY,	R,	OW,	SIL
};

const unsigned char p1[]	= {
	W,	S1,	AH,	N,	SIL
};

const unsigned char p2[]	= {
	T,	S1,	UW,	SIL
};

const unsigned char p3[]	= {
	TH,	R,	S1,	IY,	SIL
};

const unsigned char p4[]	= {
	F,	S1,	OR,	SIL
};

const unsigned char p5[]	= {
	F,	S1,	AY,	V,	SIL
};

const unsigned char p6[]	= {
	S,	S1,	IH,	K,	S,	SIL
};

const unsigned char p7[]	= {
	S,	S1,	EH,	V,	AX,	N,	SIL
};

const unsigned char p8[]	= {
	S1,	EY,	T,	SIL
};

const unsigned char p9[]	= {
	N,	S1,	AY,	N,	SIL
};

const unsigned char *punits[] = {
	p0,	p1,	p2,	p3,	p4,
	p5,	p6,	p7,	p8,	p9
};
//#endif
const unsigned char pa[]	= {
	S1, EY,	SIL
};

const unsigned char pb[]	= {
	B, S1, IY, SIL
};

const unsigned char pc[]	= {
	S, S1, IY, SIL
};

const unsigned char pd[]	= {
	D, S1, IY, SIL
};

const unsigned char pe[]	= {
	S1, IY,	SIL
};

const unsigned char pf[]	= {
	S1, EH, F,SIL
};

const unsigned char pg[]	= {
	JH, S1, IY,	SIL
};

const unsigned char ph[]	= {
	S1, EY, CH,	SIL
};

const unsigned char pi[]	= {
	AY,	SIL
};

const unsigned char pj[]	= {
	JH, S1, EY, SIL
};

const unsigned char pk[]	= {
	K, S1, EY, SIL
};

const unsigned char pl[]	= {
	S1, EH, LL, SIL
};

const unsigned char pm[]	= {
	S1, EH,	M, SIL
};

const unsigned char pn[]	= {
	S1, EH, N,SIL
};

const unsigned char po[]	= {
	S1, OW,	SIL
};

const unsigned char pp[]	= {
	P, S1, IY,	SIL
};

const unsigned char pq[]	= {
	K, S1, YU, SIL
};

const unsigned char pr[]	= {
	S1, AA, R,	SIL
};

const unsigned char ps[]	= {
	S1, EH,	S ,SIL
};

const unsigned char pt[]	= {
	T, S1, IY, SIL
};

const unsigned char pu[]	= {
	Y, S1, UW,	SIL
};

const unsigned char pv[]	= {
	V, S1, IY,	SIL
};

const unsigned char pw[]	= {
	D, S1, AH, B, EL, Y, UW, SIL
};

const unsigned char px[]	= {
	S1, EH, K, S, SIL
};

const unsigned char py[]	= {
	W, S1, AY,	SIL
};

const unsigned char pz[]	= {
	Z, S1, IY,	SIL
};


const unsigned char *pspell[] = {
	pa,	pb,	pc,	pd,	pe,
	pf,	pg,	ph,	pi,	pj,
	pk, pl, pm, pn, po,
	pp, pq, pr, ps, pt,
	pu, pv, pw, px, py, 
	pz
};


#ifndef CALLER_ID
const unsigned char phundred[] = {
	HX,	S1,	AH,	N,	D,	R,	AX,	D,	SIL
};

const unsigned char pthousand[] = {
	TH,	S1,	AW,	Z,	AX,	N,	D,	SIL
};

const unsigned char pmillion[] = {
	M,	S1,	IH,	LL,	Y,	AX,	N,	SIL
};

const unsigned char pbillion[] = {
        B,      S1,     IH,     LL,     Y,      AX,     N,      SIL
};

const unsigned char ptrillion[] = {
        T,      R,      S1,     IH,     LL,     Y,      AX,     N,      SIL
};

const unsigned char pquadrillion[] = {
        K,      W,      AO,     D,      R,      S1,     IH,     LL,     Y,      AX,     N,      SIL
};

const unsigned char p10[]	= {
	T,	S1,	EH,	N,	SIL
};

const unsigned char p11[]	= {
	AX,	LL,	S1,	EH,	V,	AX,	N,	SIL
};

const unsigned char p12[]	= {
	T,	W,	S1,	EH,	LL,	V,	SIL
};

const unsigned char p13[]	= {
	TH,	S1,	RR,	MBOUND,	T,	S1,	IY,	N,
	SIL
};

const unsigned char p14[]	= {
	F,	S1,	OR,	MBOUND,	T,	S1,	IY,	N,
	SIL
};

const unsigned char p15[]	= {
	F,	S1,	IH,	F,	MBOUND,	T,	S1,	IY,
	N,	SIL
};

const unsigned char p16[]	= {
	S,	S1,	IH,	K,	S,	MBOUND,	T,	S1,
	IY,	N,	SIL
};

const unsigned char p17[]	= {
	S,	S1,	EH,	V,	AX,	N,	MBOUND,	T,
	S1,	IY,	N,	SIL
};

const unsigned char p18[]	= {
	S1,	EY,	MBOUND,	T,	S1,	IY,	N,	SIL
};

const unsigned char p19[]	= {
	N,	S1,	AY,	N,	MBOUND,	T,	S1,	IY,
	N,	SIL
};

const unsigned char *pteens[] = {
	p10,	p11,	p12,	p13,	p14,
	p15,	p16,	p17,	p18,	p19
};

const unsigned char pnone[]	= {
	SIL
};

const unsigned char p20[]	= {
	T,	W,	S1,	EH,	N,	T,	IY,	SIL
};

const unsigned char p30[]	= {
	TH,	S1,	RR,	T,	IY,	SIL
};

const unsigned char p40[]	= {
	F,	S1,	OR,	T,	IY,	SIL
};

const unsigned char p50[]	= {
	F,	S1,	IH,	F,	T,	IY,	SIL
};

const unsigned char p60[]	= {
	S,	S1,	IH,	K,	S,	T,	IY,	SIL
};

const unsigned char p70[]	= {
	S,	S1,	EH,	V,	AX,	N,	T,	IY,
	SIL
};

const unsigned char p80[]	= {
	S1,	EY,	T,	IY,	SIL
};

const unsigned char p90[]	= {
	N,	S1,	AY,	N,	T,	IY,	SIL
};

const unsigned char *ptens[]	= {
	pnone,	pnone,	p20,	p30,	p40,
	p50,	p60,	p70,	p80,	p90
};

const unsigned char ppence[] = {
	P,	S1,	EH,	N,	S,	SIL
};

const unsigned char ppercent[] = {
	WBOUND, P,	RR,	S,	S1,	EH,	N,	T,
	SIL
};
	
const unsigned char pcent[] = {
	S,	S1,	EH,	N,	T,	SIL
};

const unsigned char ppound[] = {
	WBOUND,	P,	S1,	AW,	N,	D,	SIL
};

const unsigned char pdollar[] = {
	WBOUND,	D,	S1,	AA,	LL,	RR,	SIL
};

const unsigned char pand[] = {
	WBOUND,	VPSTART, EH,	N,	D,	WBOUND,	SIL
};

const unsigned char ppoint[] = {
	P,	S1,	OY,	N,	T,	SIL
};


const unsigned char ptt2tp[] = {
	WBOUND,	T,	S2,	AY,	M,	Z,	WBOUND,
	T,	S1,	EH,	N,	WBOUND,	T,	UH,
	WBOUND,	DH,	AX,	WBOUND,	P,	S1,	AW,
	RR,	WBOUND,	SIL
};


const unsigned char pjan[] = {
	JH,	S1,	AE,	N,	YU,	EH,	R,	IY,
	SIL
};

const unsigned char pfeb[] = {
	F,	S1,	EH,	B,	R,	UW,	EH,	R,
	IY,	SIL
};

const unsigned char pmar[] = {
	M,	S1,	AA,	R,	CH,	SIL
};

const unsigned char papr[] = {
	S1,	EY,	P,	R,	EL,	SIL
};

const unsigned char pmay[] = {
	M,	S1,	EY,	SIL
};

const unsigned char pjun[] = {
	JH,	S1,	UW,	N,	SIL
};

const unsigned char pjul[] = {
	JH,	IX,	LL,	S1,	AY,	SIL
};

const unsigned char	paug[] = {
	S1,	AO,	G,	AX,	S,	T,	SIL
};

 
const unsigned char	psep[] = {
	S,	EH,	P,	T,	S1,	EH,	M,	B,
	RR,	SIL
};

 
const unsigned char	poct[] = {
	AA,	K,	T,	S1,	OW,	B,	RR,	SIL
};

 
const unsigned char	pnov[] = {
	N,	OW,	V,	S1,	EH,	M,	B,	RR,
	SIL
};

 
const unsigned char	pdec[] = {
	D,	IX,	S,	S1,	EH,	M,	B,	RR,
	SIL
};

 
const unsigned char *pmonths[] = {
	pjan, pfeb,	pmar,	papr,	pmay,	pjun,
	pjul,	paug,	psep,	poct,	pnov,	pdec
};

 
const unsigned char	p0th[] = {
	Z,	S1,	IY,	R,	OW,	TH,	SIL
};

 
const unsigned char	p1st[] = {
	F,	S1,	RR,	S,	T,	SIL
};

 
const unsigned char	p2nd[] = {
	S,	S1,	EH,	K,	AX,	N,	D,	SIL
};

 
const unsigned char	p3rd[] = {
	TH,	S1,	RR,	D,	SIL
};

 
const unsigned char	p4th[] = {
	F,	S1,	OR,	TH,	SIL
};

 
const unsigned char	p5th[] = {
	F,	S1,	IH,	F,	TH,	SIL
};

 
const unsigned char	p6th[] = {
	S,	S1,	IH,	K,	S,	TH,	SIL
};

 
const unsigned char	p7th[] = {
	S,	S1,	EH,	V,	AX,	N,	TH,	SIL
};

 
const unsigned char	p8th[] = {
	S1,	EY,	TH,	SIL
};

const unsigned char	p9th[] = {
	N,	S1,	AY,	N,	TH,	SIL
};

 
const unsigned char *pordin[] = {
	p0th,	p1st,	p2nd,	p3rd,	p4th,
	p5th,	p6th,	p7th,	p8th,	p9th
};

 
const unsigned char	phalf[] = {
	HX,	S1,	AE,	F,	SIL
};

 
const unsigned char	phalves[] = {
	HX,	S1,	AE,	V,	Z,	SIL
};

#endif

/*
 * This table, indexed by the grapheme
 * codes, returns the basic set of features.
 * The "[+GEM]" feature, and the setting of the
 * "[+VOC]" and "[+CONS]" on the letter "Y" are
 * special, and get done by "addgraph" with
 * some special code.
 */

const unsigned int feats[]	= {
	0,											/* End mark			*/
	FSEG+FVOC+FSYL,						/* A				*/
	FSEG+FCONS+FVOICE,					/* B				*/
	FSEG+FCONS+FC,							/* C				*/
	FSEG+FCONS+FVOICE+FCOR,				/* D				*/
	FSEG+FVOC+FSYL,						/* E				*/
	FSEG+FCONS,								/* F				*/
	FSEG+FCONS+FVOICE+FVELAR,			/* G				*/
	FSEG+FCONS,								/* H				*/
	FSEG+FVOC+FHIGH+FSYL,				/* I				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,		/* J				*/
	FSEG+FCONS+FVELAR,					/* K				*/
	FSEG+FCONS+FVOICE+FLIQ+FCOR+FL,	/* L				*/
	FSEG+FCONS+FVOICE+FNAS,				/* M				*/
	FSEG+FCONS+FVOICE+FNAS+FCOR,		/* N				*/
	FSEG+FVOC+FSYL,						/* O				*/
	FSEG+FCONS,								/* P				*/
	FSEG+FCONS,								/* Q				*/
	FSEG+FCONS+FVOICE+FLIQ+FR,			/* R				*/
	FSEG+FCONS+FSIB,						/* S				*/
	FSEG+FCONS+FCOR,						/* T				*/
	FSEG+FVOC+FHIGH+FSYL,				/* U				*/
	FSEG+FCONS+FVOICE,					/* V				*/
	FSEG+FCONS+FVOICE+FCOR,				/* W				*/
	FSEG+FCONS+FSIB+FX,					/* X				*/
	FSEG,										/* Y				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,		/* Z				*/
	FSEG+FCONS+FVOICE+FVELAR,			/* GU				*/
	FSEG+FCONS,								/* QU				*/
	0,											/* '				*/
	0											/* +				*/
};

/*
 * Feature table.
 * Index by phoneme.
 */

const unsigned int pfeat[] = {
	0,								/* SIL				*/
	PVOC+PVOICE,				/* IY				*/
	PVOC+PVOICE,				/* IH				*/
	PVOC+PVOICE,				/* EY				*/
	PVOC+PVOICE,				/* EH				*/
	PVOC+PVOICE,				/* AE				*/
	PVOC+PVOICE,				/* AA					*/
	PVOC+PVOICE,				/* AY				*/
	PVOC+PVOICE,				/* AW				*/
	PVOC+PVOICE,				/* AH				*/
	PVOC+PVOICE,				/* AO				*/
	PVOC+PVOICE,				/* OW				*/
	PVOC+PVOICE,				/* OY				*/
	PVOC+PVOICE,				/* UH				*/
	PVOC+PVOICE,				/* UW				*/
	PBOTH+PVOICE,				/* RR				*/
	PVOC+PVOICE,				/* YU				*/
	PVOC+PVOICE,				/* AX				*/
	PVOC+PVOICE,				/* IX				*/
	0,								/* IR	(No translation)	*/
	0,								/* ER	(No translation)	*/
	0,								/* AR	(No translation)	*/
	0,								/* OR	(No translation)	*/
	0,								/* UR	(No translation)	*/
	PCONS,						/* W				*/
	PCONS,						/* Y				*/
	PCONS+PVOICE,				/* R				*/
	PCONS+PVOICE,				/* LL				*/
	PCONS,						/* HX				*/
	0,								/* RX	(No translation)	*/
	0,								/* LX	(No translation)	*/
	PCONS+PVOICE+POBS,		/* M				*/
	PCONS+PVOICE+POBS,		/* N				*/
	PCONS+PVOICE,				/* NX				*/
	PBOTH+PVOICE,				/* EL				*/
	0,								/* D_DENTALIZED			*/
	PBOTH+PVOICE,				/* EN				*/
	PCONS+POBS,					/* F				*/
	PCONS+PVOICE+POBS, 		/* V				*/
	PCONS+POBS,					/* TH				*/
	PCONS+PVOICE+POBS,		/* DH				*/
	PCONS+PSIB+POBS,			/* S				*/
	PCONS+PVOICE+PSIB+POBS,	/* Z				*/
	PCONS+PSIB+POBS,			/* SH				*/
	PCONS+PVOICE+PSIB+POBS,	/* ZH				*/
	PCONS+POBS,					/* P				*/
	PCONS+PVOICE+POBS,		/* B				*/
	PCONS+POBS+PTD,			/* T				*/
	PCONS+PVOICE+POBS+PTD,	/* D				*/
	PCONS+POBS,					/* K				*/
	PCONS+PVOICE+POBS,		/* G				*/
	PCONS,						/* DX				*/
	PCONS,						/* TX				*/
	0,								/* Q				*/
	PCONS+PSIB,					/* CH				*/
	PCONS+PVOICE+PSIB,		/* JH				*/
	PCONS,						/* DX				*/
	0,0,0,0,0,0,0,0,0,0,					/* place holder for null phones */
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,
	0,								/* BLOCK_RULES			*/
	0,								/* S2				*/
	0,								/* S1				*/
	0,								/* SEMPH			*/
	0,								/* HAT_RISE			*/
	0,								/* HAT_FALL			*/
	0,								/* HAT_RF			*/
	0,								/* DASH		(SBOUND)	*/
	0,								/* STAR		(MBOUND)	*/
	0,								/* HASH		(HYPHEN)	*/
	0,								/* WBOUND			*/
	0,								/* PPSTART			*/
	0,								/* VPSTART			*/
	0,								/* RELSTART			*/
	0,								/* EQUAL	(COMMA)		*/
	0,								/* PLUS		(PERIOD)	*/
	0,								/* QUEST			*/
	0,								/* EXCLAM			*/
	0,								/* NEW_PARAGRAPH		*/
	0								/* Special_word */
};

//#ifndef CALLER_ID
#if 0 //MFG

const char	preftab[] = {
	2,		AA,	B,
	4+PCONT+P2SYL,	AH,	N,	D,	RR,
	2+PCONT,	AX,	N,
	3,		B,	AY,	D,
	3,		B,	AY,	F,
	3,		B,	AY,	K,
	3,		B,	AY,	LL,
	3,		B,	AY,	N,
	3,		B,	AY,	P,
	3,		B,	AY,	R,
	3,		B,	AY,	S,
	2+PRCON,	B,	EH,
	2+PRCON,	B,	IY,
	2+PRCON,	D,	EH,
	3+PCONT,	D,	IH,	S,
	2+PRCON,	D,	IH,
	4,		D,	IX,	M,	EH,
	4,		D,	IX,	M,	IH,
	3,		D,	IX,	P,
	3,		D,	IX,	R,
	3,		D,	IX,	V,
	2+PRCON,	D,	IY,	
	2,		EH,	K,
	2,		EH,	M,
	2,		EH,	N,
	2,		EH,	R,
	3,		F,	AO,	R,
	3,		K,	AA,	LL,
	3,		K,	AA,	M,
	3,		K,	AA,	N,
	3,		K,	AO,	R,
	4+PCONT+P2SYL,	IH,	N,	T,	RR,
	2+PCONT,	IH,	N,
	3+PCONT,	M,	IH,	S,
	3+PCONT,	N,	AA,	N,
	3+PCONT+P2SYL,	OW,	V,	RR,
	3,		P,	R,	AA,
	3,		P,	R,	IY,
	2+PCONT+PRCON,	R,	EH,
	3,		S,	AH,	P,
	3,		S,	AH,	S,
	5,		T,	R,	AE,	N,	S,
	3,		W,	IH,	TH,
	0
};
#endif

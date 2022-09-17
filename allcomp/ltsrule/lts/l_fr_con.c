/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *    File Name:	l_fr_con.c
 *    Author:                                     
 *    Creation Date:                                               
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
 * 001	CHJ		07/20/2000		Created from old French files and l_us_con.c
 * 002 	CAB		10/16/2000		Changed copyright info
 * 003 	CAB		01/15/2001		Merged Michel Divay changes to French
 * 004  CAB		02/09/2001		Additional changes by Michel
 * 005  CAB		03/23/2001		Added changes by Michel
 * 006	CAB		04/25/2002		Fixed change to const per as ls_cons.h
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
const U16 lsctype[] = {

	IGNORE,				/* NUL							*/
	IGNORE,				/* SOH							*/
	IGNORE,				/* STX				            */
	IGNORE,				/* ETX				            */
	IGNORE,				/* EOT				            */
	IGNORE,				/* ENQ				            */
	IGNORE,				/* ACK				            */
    IGNORE,          /* BEL (Could be a word) */
	BACKUP,				/* BS				            */
	NEVER,				/* HT				            */
	NEVER,				/* LF				            */
	NEVER,				/* VT				            */
	NEVER,				/* FF				            */
	NEVER,				/* CR				            */
	IGNORE,				/* SO				            */
	IGNORE,				/* SI				            */

/* 1 */ IGNORE,          /* DLE */
	IGNORE,				/* DC1				            */
	IGNORE,				/* DC2				            */
	IGNORE,				/* DC3				            */
	IGNORE,				/* DC4				            */
	IGNORE,				/* NAK				            */
	IGNORE,				/* SYN				            */
	IGNORE,				/* ETB				            */
	IGNORE,				/* CAN				            */
	IGNORE,				/* EM				            */
    IGNORE,          /* SUB (Is this right?) */
	IGNORE,				/* ESC				            */
	IGNORE,				/* FS				            */
	IGNORE,				/* GS				            */
	IGNORE,				/* RS				            */
	IGNORE,				/* US				            */

/* 2 */ NEVER,                      /* SP */
	MIGHT+PR,			/* !				            */
	ALWAYS+LS+RS+PR,	/* "				            */
	ALWAYS+PR,			/* #				            */
	ALWAYS+PR,			/* $				            */
	ALWAYS+PR,			/* %				            */
	ALWAYS+PR,			/* &				            */
    ALWAYS             +PR, /* '  */
	ALWAYS+LS+FB+PR,	/* (				            */
	ALWAYS+RS+FB+PR,	/* )				            */
	ALWAYS+PR,			/* *				            */
	ALWAYS+PR,			/* +				            */
	MIGHT+PR,		   	/* ,				            */
	ALWAYS+PR,			/* -				            */
	MIGHT+PR,     		/* .				            */
	ALWAYS+PR,			/* /				            */

/* 3 */ ALWAYS             +PR, /* 0  */
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

/* 4 */ ALWAYS             +PR, /* @  */
    ALWAYS  +U         +O  +PR, /* A  */
    ALWAYS  +U           +C+PR, /* B  */
    ALWAYS  +U           +C+PR, /* C  */
    ALWAYS  +U           +C+PR, /* D  */
    ALWAYS  +U         +O  +PR, /* E  */
    ALWAYS  +U           +C+PR, /* F  */
    ALWAYS  +U           +C+PR, /* G  */
    ALWAYS  +U           +C+PR, /* H  */
    ALWAYS  +U         +O  +PR, /* I  */
    ALWAYS  +U           +C+PR, /* J  */
    ALWAYS  +U           +C+PR, /* K  */
    ALWAYS  +U           +C+PR, /* L  */
    ALWAYS  +U           +C+PR, /* M  */
    ALWAYS  +U           +C+PR, /* N  */
    ALWAYS  +U         +O  +PR, /* O  */

/* 5 */ ALWAYS  +U           +C+PR, /* P  */
    ALWAYS  +U           +C+PR, /* Q  */
    ALWAYS  +U           +C+PR, /* R  */
    ALWAYS  +U           +C+PR, /* S  */
    ALWAYS  +U           +C+PR, /* T  */
    ALWAYS  +U         +O  +PR, /* U  */
    ALWAYS  +U           +C+PR, /* V  */
    ALWAYS  +U           +C+PR, /* W  */
    ALWAYS  +U           +C+PR, /* X  */
    ALWAYS  +U         +O  +PR, /* Y */
    ALWAYS  +U           +C+PR, /* Z  */
	ALWAYS+LS+FB+PR,	/* [				            */
	ALWAYS+PR,			/* \				            */
	ALWAYS+RS+FB+PR,	/* ]				            */
	ALWAYS+PR,			/* ^				            */
    ALWAYS+I               +PR, /* _  */

/* 6 */ ALWAYS                 +PR, /* `  */
    ALWAYS             +O  +PR, /* a  */
	ALWAYS+C+PR,		/* b				            */
	ALWAYS+C+PR,		/* c				            */
	ALWAYS+C+PR,		/* d				            */
    ALWAYS             +O  +PR, /* e  */
	ALWAYS+C+PR,		/* f				            */
	ALWAYS+C+PR,		/* g				            */
	ALWAYS+C+PR,		/* h				            */
    ALWAYS             +O  +PR, /* i  */
	ALWAYS+C+PR,		/* j				            */
	ALWAYS+C+PR,		/* k				            */
	ALWAYS+C+PR,		/* l				            */
	ALWAYS+C+PR,		/* m				            */
	ALWAYS+C+PR,		/* n				            */
    ALWAYS             +O  +PR, /* o  */

/* 7 */ ALWAYS               +C+PR, /* p  */
	ALWAYS+C+PR,		/* q							*/
	ALWAYS+C+PR,		/* r							*/
	ALWAYS+C+PR,		/* s							*/
	ALWAYS+C+PR,		/* t							*/
    ALWAYS             +O  +PR, /* u  */
	ALWAYS+C+PR,		/* v							*/
	ALWAYS+C+PR,		/* w							*/
	ALWAYS+C+PR,		/* x							*/
    ALWAYS             +O  +PR, /* y  */
	ALWAYS+C+PR,		/* z							*/
	ALWAYS+LS+FB+PR,	/* {							*/
	ALWAYS+PR,			/* |							*/
	ALWAYS+RS+FB+PR,	/* }							*/
	ALWAYS+PR,			/* ~							*/
	IGNORE,				/* DEL							*/

/* 8 */ 	ALWAYS+PR,				/* euro symbol                  */
	IGNORE,
    ALWAYS         +O  +PR, /* é 82 */
    ALWAYS         +O  +PR, /* â 83 */
	IGNORE,				/* IND							*/
    ALWAYS         +O  +PR, /* à 85 */
	IGNORE,				/* SSA							*/
    ALWAYS           +C+PR, /* ç 87 */
    ALWAYS         +O  +PR, /* ê 88 */
    ALWAYS         +O  +PR, /* ë 89 */
    ALWAYS         +O  +PR, /* è 8a */
    ALWAYS         +O  +PR, /* ï 8b */
    ALWAYS         +O  +PR, /* î 8c */
	IGNORE,				/* RI							*/
	IGNORE,				/* SS2							*/
	IGNORE,				/* SS3							*/

/* 9 */ IGNORE,             /* DCS  */
    IGNORE,             /* æ    */
	IGNORE,				/* PU2							*/
    ALWAYS        +O   +PR, /* ó 93 */
	IGNORE,				/* CCH							*/
	IGNORE,				/* MW							*/
    ALWAYS        +O   +PR, /* û 96 */
    ALWAYS        +O   +PR, /* ú 97 */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,				/* CSI							*/
	IGNORE,				/* ST							*/
	IGNORE,				/* OSC							*/
	IGNORE,				/* PM							*/
	IGNORE,				/* APC							*/

/* A */ NEVER              +PR, /* SP */
	ALWAYS+LS+PR,		/* Inverted !					*/
	ALWAYS+PR, 			/* Cent symbol					*/
	ALWAYS+PR,			/* UK currency symbol 			*/
	IGNORE,
	ALWAYS+PR,			/* Yen symbol					*/
	IGNORE,
    SINGLE                 +PR, /* Section symbol */
    SINGLE             +PR, /* Blob with 4 little spikes */
    SINGLE             +PR, /* Copyright symbol */
	ALWAYS+PR,			/* Underlined "a"				*/
	ALWAYS+LS+PR,		/* <<							*/
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,

/* B */ ALWAYS             +PR, /* Degree symbol        */
    SINGLE             +PR, /* Plus-Minus           */
	ALWAYS+PR,			/* Superscript 2				*/
	ALWAYS+PR,			/* Superscript 3				*/
	IGNORE,
    SINGLE             +PR, /* Mu               */
    SINGLE             +PR, /* Paragraph            */
    SINGLE             +PR, /* Solid circle         */
	IGNORE,
	ALWAYS+PR,			/* Superscript 1				*/
	ALWAYS+PR,			/* Underlined "o"				*/
	ALWAYS+RS+PR,		/* >>							*/
    SINGLE             +PR, /* 1/4              */
    SINGLE             +PR, /* 1/2              */
	IGNORE,
	ALWAYS+LS+PR,		/* Inverted ?					*/

/* C */ ALWAYS  +U         +O  +PR, /* A grave          */
    ALWAYS  +U         +O  +PR, /* A acute          */
    ALWAYS  +U         +O  +PR, /* A circumflex         */
    ALWAYS  +U         +O  +PR, /* A tilde          */
    ALWAYS  +U         +O  +PR, /* A diarasis           */
    ALWAYS  +U         +O  +PR, /* A with circle (angstroms?)   */
    SINGLE                 +PR, /* AE               */
    ALWAYS  +U           +C+PR, /* C cdl.           */
    ALWAYS  +U         +O  +PR, /* E grave          */
    ALWAYS  +U         +O  +PR, /* E acute          */
    ALWAYS  +U         +O  +PR, /* E circumflex         */
    ALWAYS  +U         +O  +PR, /* E diarasis           */
    ALWAYS  +U         +O  +PR, /* I grave          */
    ALWAYS  +U         +O  +PR, /* I acute          */
    ALWAYS  +U         +O  +PR, /* I circumflex         */
    ALWAYS  +U         +O  +PR, /* I diarasis           */

/* D */ IGNORE,
    ALWAYS  +U           +C+PR, /* N tilde          */
    ALWAYS  +U         +O  +PR, /* O grave          */
    ALWAYS  +U         +O  +PR, /* O acute          */
    ALWAYS  +U         +O  +PR, /* O circumflex         */
    ALWAYS  +U         +O  +PR, /* O tilde          */
    ALWAYS  +U         +O  +PR, /* O diarasis           */
    SINGLE  +U             +PR, /* OE               */
    ALWAYS  +U         +O  +PR, /* O with backslash     */
    ALWAYS  +U         +O  +PR, /* U grave          */
    ALWAYS  +U         +O  +PR, /* U acute          */
    ALWAYS  +U         +O  +PR, /* U circumflex         */
    ALWAYS  +U         +O  +PR, /* U diarasis           */
    ALWAYS  +U           +C+PR, /* Y diarasis           */
	IGNORE,
    SINGLE                 +PR, /* The "Beta" German thing. */

/* E */ ALWAYS             +O  +PR, /* a grave          */
    ALWAYS             +O  +PR, /* a acute          */
    ALWAYS             +O  +PR, /* a circumflex         */
    ALWAYS             +O  +PR, /* a tilde          */
    ALWAYS             +O  +PR, /* a diarasis           */
    ALWAYS             +O  +PR, /* a with little circle     */
    SINGLE                 +PR, /* ae               */
	ALWAYS+C+PR,		/* c cdl.						*/
    ALWAYS             +O  +PR, /* e grave          */
    ALWAYS             +O  +PR, /* e acute          */
    ALWAYS             +O  +PR, /* e circumflex         */
    ALWAYS             +O  +PR, /* e diarasis           */
    ALWAYS             +O  +PR, /* i grave          */
    ALWAYS             +O  +PR, /* i acute          */
    ALWAYS             +O  +PR, /* i circumflex         */
    ALWAYS             +O  +PR, /* i diarasis           */

/* F */ IGNORE,
	ALWAYS+C+PR,		/* n tilde						*/
    ALWAYS             +O  +PR, /* o grave          */
    ALWAYS             +O  +PR, /* o acute          */
    ALWAYS             +O  +PR, /* o curcumflex         */
    ALWAYS             +O  +PR, /* o tilde          */
    ALWAYS             +O  +PR, /* o diarasis           */
    SINGLE                 +PR, /* oe               */
    ALWAYS             +O  +PR, /* o with line          */
    ALWAYS             +O  +PR, /* u grave          */
    ALWAYS             +O  +PR, /* u acute          */
    ALWAYS             +O  +PR, /* u circumflex         */
    ALWAYS             +O  +PR, /* u diarasis           */
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
   7,'m',EOS,            F_M, F_E2, F_T, F_R, SIL,
  12,'c','m',EOS,        F_S, F_AN, F_T, F_I, F_M, F_E2, F_T, F_R, SIL,
  12,'m','m',EOS,        F_M,F_I,F_L,F_I,F_M,F_E2,F_T,F_R,SIL,
  12,'k','m',EOS,        F_K,F_I,F_L,F_AU,F_M,F_E2,F_T,F_R,SIL,
   9,'h','a',EOS,        F_E2,F_K,F_T,F_A,F_R,SIL,
   7,'l',EOS,            F_L,F_I,F_T,F_R,SIL,
  12,'m','l',EOS,        F_M,F_I,F_L,F_I,F_L,F_I,F_T,F_R,SIL,
   7,'g',EOS,            F_G,F_R,F_A,F_M,SIL,
   8,'g','m',EOS,        F_G,F_R,F_A,F_M,SIL,
  12,'m','g',EOS,        F_M,F_I,F_L,F_I,F_G,F_R,F_A,F_M,SIL,
  12,'k','g',EOS,        F_K,F_I,F_L,F_AU,F_G,F_R,F_A,F_M,SIL,
  15,'n','s','e','c',EOS,    F_N,F_A,F_N,F_AU,F_S,F_E,F_G,F_ON,F_D,SIL,
  16,'u','s','e','c',EOS,    F_M,F_I,F_K,F_R,F_AU,F_S,F_E,F_G,F_ON,F_D,SIL,
  15,'m','s','e','c',EOS,    F_M,F_I,F_L,F_I,F_S,F_E,F_G,F_ON,F_D,SIL,
  10,'s','e','c',EOS,        F_S,F_E,F_G,F_ON,F_D,SIL,
   9,'m','n',EOS,        F_M,F_I,F_N,F_U,F_T,SIL,
   6,'h','r',EOS,        F_O6,F_R,SIL,
   0
};

/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronounciation of the number words.
 * There is only a single phoneme string.
 */

const unsigned char nwdtab[] = { 
	9,	's',	'a',	'n', EOS,
	F_A,	S1,	F_A,	F_N, SIL,

	9,	'm', 'i', 'l', EOS,
	F_M,	S1,	F_I,	F_L, SIL,

	15,	'm',	'i',	'l',	'y',	'o',	'n',
	EOS,
	F_M,	S1,	F_I,	F_L,	F_Y,	F_O,	F_N,	SIL,

	15,	'b',	'i',	'l',	'y',	'o',	'n',
	EOS,
	F_B,	S1,	F_I,	F_L,	F_Y,	F_O,	F_N,	SIL,

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
const unsigned char m_feb[] = "fev";
const unsigned char m_mar[] = "mar";
const unsigned char m_apr[] = "avr";
const unsigned char m_may[] = "mai";
const unsigned char m_jun[] = "jun";
const unsigned char m_jul[] = "jui";
const unsigned char m_aug[] = "aou";
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

/*
  hyphenated word sent to lts, important for liaison
*/
const unsigned char apres_tiret[] = {
  5,'t','-','i','l',EOS,              /* sera-t-il */
  7,'t','-','e','l','l','e',EOS,      /* sera-t-elle */
  5,'t','-','o','n',EOS,              /* sera-t-on, va-t-on */
  5,'t','-','e','n',EOS,              /* va-t-en guerre */
  0
};

const unsigned char une[]     = { F_U, F_N, EOS };
const unsigned char francs[]  = { F_F, F_R, F_AN, EOS };
const unsigned char heure[]   = { F_O6, F_R, EOS };
const unsigned char pminus[]  = { F_M, F_W, F_IN, EOS };
const unsigned char peuro[] = {F_EU, F_R,F_AU};
/* CAB Removed
unsigned char ptiret[]  = { F_T, F_I, F_R, F_E2, EOS };
*/

const unsigned char phalf[]   = { F_D, F_E, F_M, F_I, EOS };
const unsigned char ptiers[]  = { F_T, F_Y, F_E2, F_R, EOS };
const unsigned char pquart[]  = { F_K, F_A, F_R, EOS };
const unsigned char pcent[]   = { F_S, F_AN, EOS };
const unsigned char pdegree[] = { F_D, F_E, F_G, F_R, F_E1, EOS };
const unsigned char dizieme[] = { F_D, F_I, F_Z, F_Y, F_E2, F_M, EOS };

const unsigned char p0[] = { F_Z, F_E1, F_R, F_AU, EOS };
const unsigned char p1[] = { F_UN, EOS };
const unsigned char p2[] = { F_D, F_EU, EOS };
const unsigned char p3[] = { F_T, F_R, F_W, F_A, EOS };
const unsigned char p4[] = { F_K, F_A, F_T, F_R, EOS };
const unsigned char p5[] = { F_S, F_IN, F_K, EOS };
const unsigned char p6[] = { F_S, F_I, F_S, EOS };
const unsigned char p7[] = { F_S, F_E2, F_T, EOS };
const unsigned char p8[] = { F_WU, F_I, F_T, EOS };          /* without a T ??? : 7, 8, 9 */

const unsigned char p9[] = { F_N, F_O6, F_F, EOS };

#ifdef OS_PALM
const unsigned char * punits[] = {
#else
const unsigned char *const punits[] = {
#endif
  p0,   p1,     p2,     p3,     p4,
  p5,   p6,     p7,     p8,     p9
};

#ifdef OS_PALM
const unsigned char * upunits[] = {
#else
const unsigned char *const upunits[] = {
#endif
	p0, p1,		p2,		p3,		p4,
	p5, p6,		p7,		p8,		p9
};

/* idem punits but with a linking phoneme at the end */
const unsigned char p0l[] = { F_Z, F_E1, F_R, F_AU, EOS };
const unsigned char p1l[] = { F_U, F_N, EOS };            /* feminine */
const unsigned char p2l[] = { F_D, F_EU, F_Z, EOS };
const unsigned char p3l[] = { F_T, F_R, F_W, F_A, F_Z, EOS };
const unsigned char p4l[] = { F_K, F_A, F_T, F_R, EOS };
const unsigned char p5l[] = { F_S, F_IN, F_K, EOS };
const unsigned char p6l[] = { F_S, F_I, F_Z, EOS };
const unsigned char p7l[] = { F_S, F_E2, F_T, EOS };
const unsigned char p8l[] = { F_WU, F_I, F_T, EOS };
const unsigned char p9l[] = { F_N, F_O6, F_V, EOS };

#ifdef OS_PALM
const unsigned char * punitsl[] = {
#else
const unsigned char *const punitsl[] = {
#endif
  p0l,  p1l,    p2l,    p3l,    p4l,
  p5l,  p6l,    p7l,    p8l,    p9l
};

const unsigned char pmillion[]  = { F_M, F_I, F_L, F_Y, F_ON, EOS };
const unsigned char pthousand[] = { F_M, F_I, F_L, EOS };
const unsigned char phundred[]  = { F_S, F_AN, EOS };
const unsigned char ieme[]      = { F_Y, F_E2, F_M, EOS};
const unsigned char premier[]   = { F_P, F_R, F_E, F_M, F_Y, F_E1, EOS};
const unsigned char premiere[]  = { F_P, F_R, F_E, F_M, F_Y, F_E2, F_R, EOS};

const unsigned char p10[] = { F_D, F_I, F_S, EOS };
const unsigned char p11[] = { F_ON, F_Z, EOS };
const unsigned char p12[] = { F_D, F_OU, F_Z, EOS };
const unsigned char p13[] = { F_T, F_R, F_E2, F_Z, EOS };
const unsigned char p14[] = { F_K, F_A, F_T, F_O, F_R, F_Z, EOS };
const unsigned char p15[] = { F_K, F_IN, F_Z, EOS };
const unsigned char p16[] = { F_S, F_E2, F_Z, EOS };
const unsigned char p17[] = { F_D, F_I, F_S, F_S, F_E2, F_T, EOS };
const unsigned char p18[] = { F_D, F_I, F_Z, F_WU, F_I, F_T, EOS };
const unsigned char p19[] = { F_D, F_I, F_Z, F_N, F_O6, F_F, EOS };

#ifdef OS_PALM
const unsigned char * pteens[] = {
#else
const unsigned char *const pteens[] = {
#endif
  p10,  p11,    p12,    p13,    p14,
  p15,  p16,    p17,    p18,    p19
};

const unsigned char pnone[] = { EOS };

const unsigned char p20t[] = { F_V, F_IN, F_T, EOS };
const unsigned char p20[]  = { F_V, F_IN, EOS };
const unsigned char p30[]  = { F_T, F_R, F_AN, F_T, EOS };
const unsigned char p40[]  = { F_K, F_A, F_R, F_AN, F_T, EOS };
const unsigned char p50[]  = { F_S, F_IN, F_K, F_AN, F_T, EOS };
const unsigned char p60[]  = { F_S, F_W, F_A, F_S, F_AN, F_T, EOS };
const unsigned char p70[]  = { F_S, F_W, F_A, F_S, F_AN, F_T, F_D, F_I, F_S, EOS };
const unsigned char p80[]  = { F_K, F_A, F_T, F_R, F_E, F_V, F_IN, EOS };
const unsigned char p90[]  = { F_K, F_A, F_T, F_R, F_E, F_V, F_IN,
        F_D, F_I, F_S, EOS };

#ifdef OS_PALM
const unsigned char * ptens[] = {
#else
const unsigned char *const ptens[] = {
#endif
  pnone, pnone, p20t,   p30,    p40,
  p50,   p60,   p70,    p80,    p90
};

const unsigned char ppercent[] = { WBOUND, F_P, F_OU, F_R, F_S, F_AN, EOS };
const unsigned char pand[]     = { WBOUND, F_E1, WBOUND, EOS };
const unsigned char ppoint[]   = { F_P, F_W, F_IN, WBOUND, EOS };
const unsigned char ptt2tp[]   = { WBOUND, F_F, F_W, F_A, F_D, F_I, F_S, WBOUND,
            F_A, F_L, F_A, WBOUND,
            F_P, F_WU, F_I, F_S, F_AN, F_S, WBOUND, EOS };

const unsigned char pjan[]  = { F_J, F_AN, F_V, F_Y, F_E1, EOS};
const unsigned char pfeb[]  = { F_F, F_E1, F_V, F_R, F_I, F_Y, F_E1, EOS};
const unsigned char pmar[]  = { F_M, F_A, F_R, F_S, EOS};
const unsigned char pavr[]  = { F_A, F_V, F_R, F_I, F_L, EOS};
const unsigned char pmai[]  = { F_M, F_E2, EOS};
const unsigned char pjuin[] = { F_J, F_WU, F_IN, EOS};
const unsigned char pjui[]  = { F_J, F_WU, F_I, F_Y, F_E2, EOS};
const unsigned char paou[]  = { F_OU, F_T, EOS};
const unsigned char psep[]  = { F_S, F_E2, F_P, F_T, F_AN, F_B, F_R, EOS};
const unsigned char poct[]  = { F_O, F_K, F_T, F_O, F_B, F_R, EOS};
const unsigned char pnov[]  = { F_N, F_AU, F_V, F_AN, F_B, F_R, EOS};
const unsigned char pdec[]  = { F_D, F_E1, F_S, F_AN, F_B, F_R, EOS};

#ifdef OS_PALM
const unsigned char * pmonths[] = {
#else
const unsigned char *const pmonths[] = {
#endif
  pjan, pfeb, pmar, pavr, pmai, pjuin,
  pjui, paou, psep, poct, pnov, pdec
};                       

/* These arrays are used to determine the grammatical category
of the current word
1  elision

2  conjonction, introducteur de proposition (qu')
  comme, et, jusque, jusqu'à, jusqu'au, lorsque, lorsqu'(on, il, ils,
  elle, elles), mais, ou, or, puis, puisque, qu'est-ce, si, tandis

3  pronom personnel : elle, elles, il, ils, je, lui, nous, tu, vous

4  verbe auxilliaire :
  a, ai, aie, ait, aient, as, aurais,
  auraient, aurait, aurez, auriez, aurions, aurons, auront, avaient,
  avais, avait, avons, avez, aviez, avions, ayons, ayez
  est, ont, sont, suis, étaient, étais, était, étiez, étions, êtes

5  article     : des, du, la, le, un, une

6  div         : celle, celles, celui, ceux, ne, parce, se, ça,

7  preposition : au, aux, avec, chez, dans, depuis, dès, hors, par,

8  demonstratif et possessif
  ce, ces, cet, cette,
  leur, leurs, ma, me, mes, mon, nos, notre, sa, ses, son, ta, ton,
  vos, votre,

9  interrogation : combien, comment, pourquoi, quand, que, quel, quels,
  quelle, quelles, qui, quoi, qu'il, qu'ils, qu'elle, qu'elles, qu'on,
  qu'à

10 de          : de
11 prep2       : à, pour
12 av          : en,
*/

const char cat_a[] = {
   3, 'a', EOS,                     			   CgVA,
   4, 'a', 'i', EOS,                        	   CgVA,
   5, 'a', 'i', 'e', EOS,                   	   CgVA,
   5, 'a', 'i', 't', EOS,                   	   CgVA,
   7, 'a', 'i', 'e', 'n', 't', EOS,         	   CgVA,
   4, 'a', 's', EOS,                        	   CgVA,
   4, 'a', 'u', EOS,                        	   CgPrep,
   5, 'a', 'u', 'x', EOS,                   	   CgPrep,
   8, 'a', 'u', 'r', 'a', 'i', 's', EOS,     	   CgVA,
  10, 'a', 'u', 'r', 'a', 'i', 'e', 'n', 't', EOS, CgVA,
   8, 'a', 'u', 'r', 'a', 'i', 't', EOS,           CgVA,
   7, 'a', 'u', 'r', 'e', 'z', EOS,                CgVA,
   8, 'a', 'u', 'r', 'i', 'e', 'z', EOS,           CgVA,
   9, 'a', 'u', 'r', 'i', 'o', 'n', 's', EOS,      CgVA,
   8, 'a', 'u', 'r', 'o', 'n', 's', EOS,           CgVA,
   8, 'a', 'u', 'r', 'o', 'n', 't', EOS,           CgVA,
   9, 'a', 'v', 'a', 'i', 'e', 'n', 't', EOS,      CgVA,
   7, 'a', 'v', 'a', 'i', 's', EOS,                CgVA,
   7, 'a', 'v', 'a', 'i', 't', EOS,                CgVA,
   7, 'a', 'v', 'o', 'n', 's', EOS,                CgVA,
   6, 'a', 'v', 'e', 'c', EOS,                     CgPrep,
   6, 'a', 'v', 'e', 'z', EOS,                     CgVA,
   7, 'a', 'v', 'i', 'e', 'z', EOS,                CgVA,
   8, 'a', 'v', 'i', 'o', 'n', 's', EOS,           CgVA,
   7, 'a', 'y', 'o', 'n', 's', EOS,                CgVA,
   6, 'a', 'y', 'e', 'z', EOS,                     CgVA,
   EOS
};

const char cat_c[] = {
 7, 'c', 'e', 'l', 'l', 'e', EOS,               CgDivers,
 8, 'c', 'e', 'l', 'l', 'e', 's', EOS,          CgDivers,
 7, 'c', 'e', 'l', 'u', 'i', EOS,               CgDivers,
 4, 'c', 'e', EOS,                              CgPosDem,
 5, 'c', 'e', 's', EOS,                         CgPosDem,
 5, 'c', 'e', 't', EOS,                         CgPosDem,
 7, 'c', 'e', 't', 't', 'e', EOS,               CgPosDem,
 6, 'c', 'e', 'u', 'x', EOS,                    CgDivers,
 6, 'c', 'h', 'e', 'z', EOS,                    CgPrep,
 9, 'c', 'o', 'm', 'b', 'i', 'e', 'n', EOS,     CgInterr,
 7, 'c', 'o', 'm', 'm', 'e', EOS,               CgConj,
 9, 'c', 'o', 'm', 'm', 'e', 'n', 't', EOS,     CgInterr,
 EOS
};

const char cat_d[] = {
  6, 'd', 'a', 'n', 's', EOS,               CgPrep,
  4, 'd', 'e', EOS,                         CgDe,
  8, 'd', 'e', 'p', 'u', 'i', 's', EOS,     CgPrep,
  5, 'd', 'e', 's', EOS,                    CgArt,
  5, 'd', 0xe8, 's', EOS,                    CgPrep, /* de2s */	//0xe8='è'
  4, 'd', 'u', EOS,                         CgArt,
  EOS
};

const char cat_e[] = {
  6, 'e', 'l', 'l', 'e', EOS,           CgPPS,
  7, 'e', 'l', 'l', 'e', 's', EOS,      CgPPS,
  4, 'e', 'n', EOS,                     12,
  4, 'e', 't', EOS,                     CgConj,
  5, 'e', 's', 't', EOS,                CgVA,
  EOS
};

const char cat_h[] = {
  6, 'h', 'o', 'r', 's', EOS,           CgPrep,
  EOS
};

const char cat_i[] = {
  4, 'i', 'l', EOS,                     CgPPS,
  5, 'i', 'l', 's', EOS,                CgPPS,
  EOS
};

const char cat_j[] = {
  4, 'j', 'e', EOS,                                     CgPPS,
  8, 'j', 'u', 's', 'q', 'u', 'e', EOS,                 CgConj,
  9, 'j', 'u', 's', 'q', 'u', '\'', 0xe0, EOS,           CgConj,  /* a2 */	//0xe0='à'
  10, 'j', 'u', 's', 'q', 'u', '\'', 'a', 'u', EOS,     CgConj,
  EOS
};

const char cat_l[] = {
  4, 'l', 'a', EOS,                                 CgArt,
  4, 'l', 'e', EOS,                                 CgArt,
  5, 'l', 'e', 's', EOS,                            CgArt,
  6, 'l', 'e', 'u', 'r', EOS,                       CgPosDem,
  7, 'l', 'e', 'u', 'r', 's', EOS,                  CgPosDem,
  9, 'l', 'o', 'r', 's', 'q', 'u', 'e', EOS,                CgConj,
  11, 'l', 'o', 'r', 's', 'q', 'u', '\'', 'o', 'n', EOS,    CgConj,
  11, 'l', 'o', 'r', 's', 'q', 'u', '\'', 'i', 'l', EOS,    CgConj,
  12, 'l', 'o', 'r', 's', 'q', 'u', '\'', 'i', 'l', 's', EOS,           CgConj,
  13, 'l', 'o', 'r', 's', 'q', 'u', '\'', 'e', 'l', 'l', 'e', EOS,      CgConj,
  14, 'l', 'o', 'r', 's', 'q', 'u', '\'', 'e', 'l', 'l', 'e', 's', EOS, CgConj,
  5, 'l', 'u', 'i', EOS,                            CgPPS,
  EOS
};

const char cat_m[] = {
  6, 'm', 'a', 'i', 's', EOS,   CgConj,
  4, 'm', 'a', EOS,         CgPosDem,
  4, 'm', 'e', EOS,         CgPosDem,
  5, 'm', 'e', 's', EOS,    CgPosDem,
  5, 'm', 'o', 'n', EOS,    CgPosDem,
  EOS
};

const char cat_n[] = {
  4, 'n', 'e', EOS,                 CgDivers,
  4, 'n', 'i', EOS,                 CgDivers,
  5, 'n', 'o', 's', EOS,            CgPosDem,
  7, 'n', 'o', 't', 'r', 'e', EOS,  CgPosDem,
  6, 'n', 'o', 'u', 's', EOS,       CgPPS,
  EOS
};

const char cat_o[] = {
  4, 'o', 'n', EOS,             CgPosDem,
  5, 'o', 'n', 't', EOS,        CgVA,
  4, 'o', 'u', EOS,             CgConj,
  4, 'o', 0xf9, EOS,             9,  /* ou2 */	//0xf9='ù'
  4, 'o', 'r', EOS,             CgConj,
  EOS
};

const char cat_p[] = {
   5, 'p', 'a', 'r', EOS,               CgPrep,
   7, 'p', 'a', 'r', 'c', 'e', EOS,                 CgDivers,
   6, 'p', 'o', 'u', 'r', EOS,                  11,
  10, 'p', 'o', 'u', 'r', 'q', 'u', 'o', 'i', EOS,  CgInterr,
//6, 'p', 'u', 'i', 's', EOS,                      CgConj,
   9, 'p', 'u', 'i', 's', 'q', 'u', 'e', EOS,       CgConj,
  EOS
};

const char cat_q[] = {
   7, 'q', 'u', 'a', 'n', 'd', EOS,                      CgInterr, 
   5, 'q', 'u', 'e', EOS,                                CgInterr,
   6, 'q', 'u', 'e', 'l', EOS,                           CgInterr,
   7, 'q', 'u', 'e', 'l', 's', EOS,                      CgInterr,
   8, 'q', 'u', 'e', 'l', 'l', 'e', EOS,                 CgInterr,
   9, 'q', 'u', 'e', 'l', 'l', 'e', 's', EOS,            CgInterr,
   5, 'q', 'u', 'i', EOS,                                CgInterr, 
   6, 'q', 'u', 'o', 'i', EOS,                           CgInterr,
   7, 'q', 'u', '\'', 'i', 'l', EOS,                     CgInterr,
   8, 'q', 'u', '\'', 'i', 'l', 's', EOS,                CgInterr,
   9, 'q', 'u', '\'', 'e', 'l', 'l', 'e', EOS,           CgInterr,
  10, 'q', 'u', '\'', 'e', 'l', 'l', 'e', 's', EOS,      CgInterr,
   7, 'q', 'u', '\'', 'o', 'n', EOS,                     CgInterr,
   6, 'q', 'u', '\'', 0xe0, EOS,                          CgInterr,  /* a2 */	//0xe0='à'
  11, 'q', 'u', '\'', 'e', 's', 't', '-', 'c', 'e', EOS, CgConj,
  EOS
};

const char cat_s[] = {
  4, 's', 'a', EOS,                     CgPosDem,
  6, 's', 'a', 'n', 's', EOS,           CgPrep,
  4, 's', 'e', EOS,                     CgDivers,
  5, 's', 'e', 's', EOS,                CgPosDem,
  4, 's', 'i', EOS,                     CgConj,
  8, 's', 'o', 'm', 'm', 'e', 's', EOS, CgVA,
  5, 's', 'o', 'n', EOS,                CgPosDem,
  6, 's', 'o', 'n', 't', EOS,           CgVA,
  6, 's', 'u', 'i', 's', EOS,           CgVA,
  5, 's', 'u', 'r', EOS,                CgPrep,
  6, 's', 'o', 'u', 's', EOS,           CgPrep,
  EOS
};

const char cat_t[] = {
  4, 't', 'a', EOS,                     CgPosDem,
  8, 't', 'a', 'n', 'd', 'i', 's', EOS, CgConj,
  4, 't', 'e', EOS,                     CgPosDem,
  5, 't', 'o', 'n', EOS,                CgPosDem,
  4, 't', 'u', EOS,                     CgPPS,
  EOS
};

const char cat_u[] = {
  4, 'u', 'n', EOS,             CgArt,
  5, 'u', 'n', 'e', EOS,        CgArt,
  EOS
};

const char cat_v[] = {
  6, 'v', 'e', 'r', 's', EOS,       CgPrep,
  5, 'v', 'o', 's', EOS,            CgPosDem,
  7, 'v', 'o', 't', 'r', 'e', EOS,  CgPosDem,
  6, 'v', 'o', 'u', 's', EOS,       CgPPS,
  EOS
};

const char cat_div[] = {
  3, 0xe0, EOS,                      11,     /* a2 */	//0xe0='à'
  4, 0xe7, 'a', EOS,                     CgDivers,      /* c5a */	//0xe7='ç'
  9, 0xe9, 't', 'a', 'i', 'e', 'n', 't', EOS,    CgVA,   /* e1taient */	//0xe9='é'
  7, 0xe9, 't', 'a', 'i', 's', EOS,      CgVA,	//0xe9='é'
  7, 0xe9, 't', 'a', 'i', 't', EOS,      CgVA,	//0xe9='é'
  7, 0xe9, 't', 'i', 'e', 'z', EOS,      CgVA,	//0xe9='é'
  8, 0xe9, 't', 'i', 'o', 'n', 's', EOS,     CgVA,	//0xe9='é'
  6, 0xea, 't', 'e', 's', EOS,               CgVA,   /* e3tes */	//0xea='ê'
  EOS
};

#ifdef OS_PALM
const unsigned char * categ[] = {
#else
const unsigned char *const categ[] = {
#endif
  cat_a,   NULL,     cat_c,     cat_d,  cat_e,  NULL,
  NULL,    cat_h,    cat_i,     cat_j,  NULL,   cat_l,
  cat_m,   cat_n,    cat_o,     cat_p,  cat_q,  NULL,
  cat_s,   cat_t,    cat_u,     cat_v,  NULL,   NULL,
  NULL,    NULL,     cat_div
};

const unsigned char p0th[] = { F_Z, F_E1, F_R, F_AU, F_Y, F_E2, F_M, EOS };
const unsigned char p1th[] = { F_U, F_N, F_Y, F_E2, F_M, EOS };
const unsigned char p2th[] = { F_D, F_EU, F_Z, F_Y, F_E2, F_M, EOS };
const unsigned char p3th[] = { F_T, F_R, F_W, F_A, F_Z, F_Y, F_E2, F_M, EOS };
const unsigned char p4th[] = { F_K, F_A, F_T, F_R, F_Y, F_E2, F_M, EOS };
const unsigned char p5th[] = { F_S, F_IN, F_K, F_Y, F_E2, F_M, EOS };
const unsigned char p6th[] = { F_S, F_I, F_Z, F_Y, F_E2, F_M, EOS };
const unsigned char p7th[] = { F_S, F_E2, F_T, F_Y, F_E2, F_M, EOS };
const unsigned char p8th[] = { F_WU, F_I, F_T, F_Y, F_E2, F_M, EOS };
const unsigned char p9th[] = { F_N, F_O6, F_V, F_Y, F_E2, F_M, EOS };

#ifdef OS_PALM
const unsigned char * pordin[] = {
#else
const unsigned char *const pordin[] = {
#endif
  p0th, p1th, p2th, p3th, p4th,
  p5th, p6th, p7th, p8th, p9th
};

/* chj 8/17/00 used in l_fr_ru1.c for now to fool french lts into working by converting special characters to their old
 * equivalents 
 */
#include	"iso_char.h"

//int	code_page_number = 850;
const unsigned char code_page_table[] = {
	0x00,	0x01,	0x02,	0x03,	0x04,	0x05,	0x06,	0x07,	0x08,	0x09,
	0x0a,	0x0b,	0x0c,	0x0d,	0x0e,	0x0f,	0x10,	0x11,	0x12,	0x13,
	0x14,	C_SECT,	0x16,	0x17,	0x18,	0x19,	0x1a,	0x1b,	0x1c,	0x1d,
	0x1e,	0x1f,	0x20,	0x21,	0x22,	0x23,	0x24,	0x25,	0x26,	0x27,	
	0x28,	0x29,	0x2a,	0x2b,	0x2c,	0x2d,	0x2e,	0x2f,	0x30,	0x31,
	0x32,	0x33,	0x34,	0x35,	0x36,	0x37,	0x38,	0x39,	0x3a,	0x3b,
	/*60*/
	0x3c,	0x3d,	0x3e,	0x3f,	0x40,	0x41,	0x42,	0x43,	0x44,	0x45,
	0x46,	0x47,	0x48,	0x49,	0x4a,	0x4b,	0x4c,	0x4d,	0x4e,	0x4f,
	0x50,	0x51,	0x52,	0x53,	0x54,	0x55,	0x56,	0x57,	0x58,	0x59,
	0x5a,	0x5b,	0x5c,	0x5d,	0x5e,	0x5f,	0x60,	0x61,	0x62,	0x63,
	/*100*/
	0x64,	0x65,	0x66,	0x67,	0x68,	0x69,	0x6a,	0x6b,	0x6c,	0x6d,
	0x6e,	0x6f,	0x70,	0x71,	0x72,	0x73,	0x74,	0x75,	0x76,	0x77,
	0x78,	0x79,	0x7a,	0x7b,	0x7c,	0x7d,	0x7e,	0x7f,
/* 0x80 - 0x8f */	
	C_CD_C, C_UM_u,
	C_AC_e,	C_CF_a,	C_UM_a,	C_GR_a,	C_RI_a,	C_CD_c,	C_CF_e,	C_UM_e,	C_GR_e,	C_UM_i,
	C_CF_i,	C_GR_i,	C_UM_A,	C_RI_A,
/* 0x90 - 0x9f */	
	C_AC_E,	C_ae,		0x00,		C_AC_o,	C_UM_o,	C_GR_o,
	C_CF_u,	C_AC_u,	C_UM_y,	C_UM_O,	C_UM_U,	C_SL_o,	C_POUN,	C_OB_O,	C_MULT,	0x00,
/* 0xa0 - 0xaf */
	C_AC_a,	C_AC_i,	C_AC_o,	C_AC_u,	C_TL_n,	C_TL_N,	C_FORD,	C_MORD,	C_IQU,	C_REG,
	C_NOT,	C_F12,	C_F14,	C_IEX,	C_DAPL,	C_DAPR,
/* 0xb0 - 0xbf */	
	0x00,		0x00,		0x00,		C_PIPE,
	0x00,		C_AC_A,		C_CF_A,		C_GR_A,
	C_COPY,		0x00,		0x00,		0x00,
	0x00,		C_CENT,		C_YEN,		0x00,
/* 0xc0 - 0xcf */	
	0x00,		0x00,		0x00,		0x00,
	0x00,		0x00,		C_TL_a,		C_TL_A,
	0x00,		0x00,		0x00,		0x00,
	0x00,		0x00,		0x00,		0x00,
/* 0xd0 - 0xdf */	
	0x00,		0x00,		C_CF_E,		C_UM_E,
	C_GR_E,		0x00,		C_GR_I,		C_CF_I,
	C_UM_I,		0x00,		0x00,		0x00,
	0x00,		0x00,		C_AC_I,		0x00,
/* 0xe0 - 0xef */	
	C_AC_O, 	C_esZ,		C_CF_O,		C_GR_O,
	C_TL_o,		C_TL_O,		0x00,		C_thorn,
	C_THORN,	C_AC_U,		C_CF_U,		C_AC_Y,
	C_AC_y,		0x00,		0x00,		0x00,
/* 0xf0 - 0xff */	
	0x00,		C_PLMI,		0x00,		C_F34,
	C_PARA,		0x00,		C_DIV,		0x00,
	C_RING,		0x00,		C_CDOT,		C_S1,
	C_S3,		C_S2,		0x00,		0x00	
};

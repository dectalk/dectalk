/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
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
 *	  authorized sublicensor.   
 *
 ***********************************************************************
 *    File Name:	l_gr_con.c
 *    Author:       JDB
 *    Creation Date:6/17/96
 *
 *    Functionality:
 *
 *    Merged code from glsconst.c 
 *    DECtalk p3 and beyond ... constant tabular data is collected here
 *    just to make dealing with it a bit easier ...
 *    (German version)
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -------         ---------------------------------------
 * 001  GL      07/11/1996      fix problem in nabtab[]
 * 002  GL		11/21/1996		add pminute[] and psecond[] and plural for large number
 * 003  GL		01/02/1997		miss one "IGNORE" in lsctype[] before "degree symbol"
 * 004  GL		03/16/1998		For BATS#613 add the following number abbrivation:
 *                              "°C", "hz", "km/h", "kj", "kWh", "kHz",
 *                              "V", "Pf" etc and many other.  also fix the offset error
 *								of "nsec", "msec" and "usec".
 * 005	GL		04/10/1998		BATS#651  fix 4 digits number reading problem. add stress mark
 *                              for pthousand[]
 * 006	GL		04/28/1998		Use S2 instead of S1 for "mrd"
 * 007	GL		04/29/1998		BATS#661 remove "in" number abbr. and add ptexr[], pstexr[]
 *                              add ending R for all single digit ordinal number
 * 008  EAB		03/13/2000		Change ig suffix from ch->k (CH is entirely wrong 
								it must be SH or K)
 * 009	MGS		04/13/2000		Changes for integrated phoneme set 
 * 010	NAL		05/23/2000		Changed FVELAR to FLTSVELAR (warning removal)
 * 011 	CAB		10/18/2000		Changed copyright info								
 * 012  CAB		02/23/2001		Updated copyright info
 * 013	MGS		04/25/2001		Fixed german times BATS#968
 * 014	CAB		04/24/2002		Fixed change to const as per ls_cons.h
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

	IGNORE,                         /* NUL                          */
	IGNORE,                         /* SOH                          */
	IGNORE,                         /* STX                          */
	IGNORE,                         /* ETX                          */
	IGNORE,                         /* EOT                          */
	IGNORE,                         /* ENQ                          */
	IGNORE,                         /* ACK                          */
	IGNORE,                         /* BEL  (Could be a word)       */
	BACKUP,                         /* BS                           */
	NEVER,                          /* HT                           */
	NEVER,                          /* LF                           */
	NEVER,                          /* VT                           */
	NEVER,                          /* FF                           */
	NEVER,                          /* CR                           */
	IGNORE,                         /* SO                           */
	IGNORE,                         /* SI                           */
	IGNORE,                         /* DLE                          */
	IGNORE,                         /* DC1                          */
	IGNORE,                         /* DC2                          */
	IGNORE,                         /* DC3                          */
	IGNORE,                         /* DC4                          */
	IGNORE,                         /* NAK                          */
	IGNORE,                         /* SYN                          */
	IGNORE,                         /* ETB                          */
	IGNORE,                         /* CAN                          */
	IGNORE,                         /* EM                           */
	IGNORE,                         /* SUB  (Is this right?)        */
	IGNORE,                         /* ESC                          */
	IGNORE,                         /* FS                           */
	IGNORE,                         /* GS                           */
	IGNORE,                         /* RS                           */
	IGNORE,                         /* US                           */
	NEVER,                          /* SP                           */
	MIGHT+PR,                       /* !                            */
	ALWAYS+LS+RS+PR,                /* "				*/
	ALWAYS+PR,                      /* #                            */
	ALWAYS+PR,                      /* $                            */
	ALWAYS+PR,                      /* %                            */
	ALWAYS+PR,                      /* &                            */
	ALWAYS+PR,                      /* '                            */
	ALWAYS+LS+FB+PR,                /* (                            */
	ALWAYS+RS+FB+PR,                /* )                            */
	ALWAYS+PR,                      /* *                            */
	ALWAYS+PR,                      /* +                            */
	MIGHT+PR,                       /* ,                            */
	ALWAYS+PR,                      /* -                            */
	MIGHT+PR,                       /* .                            */
	ALWAYS+PR,                      /* /                            */
	ALWAYS+PR,                      /* 0                            */
	ALWAYS+PR,                      /* 1                            */
	ALWAYS+PR,                      /* 2                            */
	ALWAYS+PR,                      /* 3                            */
	ALWAYS+PR,                      /* 4                            */
	ALWAYS+PR,                      /* 5                            */
	ALWAYS+PR,                      /* 6                            */
	ALWAYS+PR,                      /* 7                            */
	ALWAYS+PR,                      /* 8                            */
	ALWAYS+PR,                      /* 9                            */
	MIGHT+PR,                       /* :                            */
	MIGHT+PR,                       /* ;                            */
	ALWAYS+LS+FB+PR,                /* <                            */
	ALWAYS+PR,                      /* =                            */
	ALWAYS+RS+FB+PR,                /* >                            */
	MIGHT+PR,                       /* ?                            */
	ALWAYS+PR,                      /* @                            */
	ALWAYS+UU+OO+PR,                /* A                            */
	ALWAYS+UU+C+PR,         /* B                            */
	ALWAYS+UU+C+PR,         /* C                            */
	ALWAYS+UU+C+PR,         /* D                            */
	ALWAYS+UU+OO+PR,        /* E                            */
	ALWAYS+UU+C+PR,         /* F                            */
	ALWAYS+UU+C+PR,         /* G                            */
	ALWAYS+UU+C+PR,         /* H                            */
	ALWAYS+UU+OO+PR,        /* I                            */
	ALWAYS+UU+C+PR,         /* J                            */
	ALWAYS+UU+C+PR,         /* K                            */
	ALWAYS+UU+C+PR,         /* L                            */
	ALWAYS+UU+C+PR,         /* M                            */
	ALWAYS+UU+C+PR,         /* N                            */
	ALWAYS+UU+OO+PR,        /* O                            */
	ALWAYS+UU+C+PR,         /* P                            */
	ALWAYS+UU+C+PR,         /* Q                            */
	ALWAYS+UU+C+PR,         /* R                            */
	ALWAYS+UU+C+PR,         /* S                            */
	ALWAYS+UU+C+PR,         /* T                            */
	ALWAYS+UU+OO+PR,        /* U                            */
	ALWAYS+UU+C+PR,         /* V                            */
	ALWAYS+UU+C+PR,         /* W                            */
	ALWAYS+UU+C+PR,         /* X                            */
	ALWAYS+UU+PR,           /* Y (-V, -C)                   */
	ALWAYS+UU+C+PR,         /* Z                            */
	ALWAYS+LS+FB+PR,        /* [                            */
	ALWAYS+PR,              /* \                            */
	ALWAYS+RS+FB+PR,        /* ]                            */
	ALWAYS+PR,              /* ^                            */
	ALWAYS+II+PR,           /* _                            */
	ALWAYS+PR,              /* `                            */
	ALWAYS+OO+PR,           /* a                            */
	ALWAYS+C+PR,            /* b                            */
	ALWAYS+C+PR,            /* c                            */
	ALWAYS+C+PR,            /* d                            */
	ALWAYS+OO+PR,           /* e                            */
	ALWAYS+C+PR,            /* f                            */
	ALWAYS+C+PR,            /* g                            */
	ALWAYS+C+PR,            /* h                            */
	ALWAYS+OO+PR,           /* i                            */
	ALWAYS+C+PR,            /* j                            */
	ALWAYS+C+PR,            /* k                            */
	ALWAYS+C+PR,            /* l                            */
	ALWAYS+C+PR,            /* m                            */
	ALWAYS+C+PR,            /* n                            */
	ALWAYS+OO+PR,           /* o                            */
	ALWAYS+C+PR,            /* p                            */
	ALWAYS+C+PR,            /* q                            */
	ALWAYS+C+PR,            /* r                            */
	ALWAYS+C+PR,            /* s                            */
	ALWAYS+C+PR,            /* t                            */
	ALWAYS+OO+PR,           /* u                            */
	ALWAYS+C+PR,            /* v                            */
	ALWAYS+C+PR,            /* w                            */
	ALWAYS+C+PR,            /* x                            */
	ALWAYS+PR,              /* y (-V, -C)                   */
	ALWAYS+C+PR,            /* z                            */
	ALWAYS+LS+FB+PR,        /* {                            */
	ALWAYS+PR,              /* |                            */
	ALWAYS+RS+FB+PR,        /* }                            */
	ALWAYS+PR,              /* ~                            */
	IGNORE,                 /* DEL                          */
	ALWAYS+PR,				/* euro symbol                  */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,                 /* IND                          */
	IGNORE,                 /* NEL                          */
	IGNORE,                 /* SSA                          */
	IGNORE,                 /* ESA                          */
	IGNORE,                 /* HTS                          */
	IGNORE,                 /* HTJ                          */
	IGNORE,                 /* VTS                          */
	IGNORE,                 /* PLD                          */
	IGNORE,                 /* PLU                          */
	IGNORE,                 /* RI                           */
	IGNORE,                 /* SS2                          */
	IGNORE,                 /* SS3                          */
	IGNORE,                 /* DCS                          */
	IGNORE,                 /* PU1                          */
	IGNORE,                 /* PU2                          */
	IGNORE,                 /* STS                          */
	IGNORE,                 /* CCH                          */
	IGNORE,                 /* MW                           */
	IGNORE,                 /* SPA                          */
	IGNORE,                 /* EPA                          */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,                 /* CSI                          */
	IGNORE,                 /* ST                           */
	IGNORE,                 /* OSC                          */
	IGNORE,                 /* PM                           */
	IGNORE,                 /* APC                          */
	NEVER+PR,               /* SP                           */
	ALWAYS+LS+PR,           /* Inverted !                   */
	ALWAYS+PR,              /* Cent symbol                  */
	ALWAYS+PR,              /* UK currency symbol           */
	IGNORE,
	ALWAYS+PR,              /* Yen symbol                   */
	IGNORE,
	ALWAYS+PR,              /* Section symbol               */
	ALWAYS+PR,              /* Blob with 4 little spikes    */
	ALWAYS+PR,              /* Copyright symbol             */
	ALWAYS+PR,              /* Underlined "a"               */
	ALWAYS+LS+PR,           /* <<                           */
	IGNORE,
	IGNORE,
	IGNORE,
	IGNORE,
	ALWAYS+PR,              /* Degree symbol                */
	ALWAYS+PR,              /* Plus-Minus                   */
	ALWAYS+PR,              /* Superscript 2                */
	ALWAYS+PR,              /* Superscript 3                */
	IGNORE,
	ALWAYS+PR,              /* Mu                           */
	ALWAYS+PR,              /* Paragraph                    */
	ALWAYS+PR,              /* Solid circle                 */
	IGNORE,
	ALWAYS+PR,              /* Superscript 1                */
	ALWAYS+PR,              /* Underlined "o"               */
	ALWAYS+RS+PR,           /* >>                           */
	ALWAYS+PR,              /* 1/4                          */
	ALWAYS+PR,              /* 1/2                          */
	IGNORE,
	ALWAYS+LS+PR,           /* Inverted ?                   */
	ALWAYS+UU+OO+PR,        /* A grave                      */
	ALWAYS+UU+OO+PR,        /* A acute                      */
	ALWAYS+UU+OO+PR,        /* A circumflex                 */
	ALWAYS+UU+OO+PR,        /* A tilde                      */
	ALWAYS+UU+OO+PR,        /* A diarasis                   */
	ALWAYS+UU+OO+PR,        /* A with circle (angstroms?)   */
	ALWAYS+PR,              /* AE                           */
	ALWAYS+UU+C+PR,         /* C cdl.                       */
	ALWAYS+UU+OO+PR,        /* E grave                      */
	ALWAYS+UU+OO+PR,        /* E acute                      */
	ALWAYS+UU+OO+PR,        /* E circumflex                 */
	ALWAYS+UU+OO+PR,        /* E diarasis                   */
	ALWAYS+UU+OO+PR,        /* I grave                      */
	ALWAYS+UU+OO+PR,        /* I acute                      */
	ALWAYS+UU+OO+PR,        /* I circumflex                 */
	ALWAYS+UU+OO+PR,        /* I diarasis                   */
	IGNORE,
	ALWAYS+UU+C+PR,         /* N tilde                      */
	ALWAYS+UU+OO+PR,        /* O grave                      */
	ALWAYS+UU+OO+PR,        /* O acute                      */
	ALWAYS+UU+OO+PR,        /* O circumflex                 */
	ALWAYS+UU+OO+PR,        /* O tilde                      */
	ALWAYS+UU+OO+PR,        /* O diarasis                   */
	ALWAYS+UU+PR,           /* O E                          */
	ALWAYS+UU+OO+PR,        /* O with backslash             */
	ALWAYS+UU+OO+PR,        /* U grave                      */
	ALWAYS+UU+OO+PR,        /* U acute                      */
	ALWAYS+UU+OO+PR,        /* U circumflex                 */
	ALWAYS+UU+OO+PR,        /* U diarasis                   */
	ALWAYS+UU+C+PR,         /* Y diarasis                   */
	IGNORE,
	ALWAYS+PR,              /* The "Beta" German thing.     */
	ALWAYS+OO+PR,           /* a grave                      */
	ALWAYS+OO+PR,           /* a acute                      */
	ALWAYS+OO+PR,           /* a circumflex                 */
	ALWAYS+OO+PR,           /* a tilde                      */
	ALWAYS+OO+PR,           /* a diarasis                   */
	ALWAYS+OO+PR,           /* a with little circle         */
	ALWAYS+PR,              /* ae                           */
	ALWAYS+C+PR,            /* c cdl.                       */
	ALWAYS+OO+PR,           /* e grave                      */
	ALWAYS+OO+PR,           /* e acute                      */
	ALWAYS+OO+PR,           /* e circumflex                 */
	ALWAYS+OO+PR,           /* e diarasis                   */
	ALWAYS+OO+PR,           /* i grave                      */
	ALWAYS+OO+PR,           /* i acute                      */
	ALWAYS+OO+PR,           /* i circumflex                 */
	ALWAYS+OO+PR,           /* i diarasis                   */
	IGNORE,
	ALWAYS+C+PR,            /* n tilde                      */
	ALWAYS+OO+PR,           /* O grave                      */
	ALWAYS+OO+PR,           /* O acute                      */
	ALWAYS+OO+PR,           /* O curcumflex                 */
	ALWAYS+OO+PR,           /* O tilde                      */
	ALWAYS+OO+PR,           /* O diarasis                   */
	ALWAYS+PR,              /* o e                          */
	ALWAYS+OO+PR,           /* O with line                  */
	ALWAYS+OO+PR,           /* U grave                      */
	ALWAYS+OO+PR,           /* U acute                      */
	ALWAYS+OO+PR,           /* U circumflex                 */
	ALWAYS+OO+PR,           /* U diarasis                   */
	ALWAYS+C+PR,            /* y diarasis                   */
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
	27,     'c',    'm',    EOS,
	GR_TS,     S1,     GR_E,      GR_N,      GR_T,      GR_I,      GR_M,
	GR_EH,     GR_T,      GR_EX,     GR_R,      SIL,
	GR_TS,     S1,     GR_E,      GR_N,      GR_T,      GR_I,      GR_M,
	GR_EH,     GR_T,      GR_EX,     GR_R,      SIL,

	27,     'm',    'm',    EOS,
	GR_M,      S1,     GR_I,      GR_L,      GR_I,      GR_M,      S2,
	GR_EH,     GR_T,      GR_EX,     GR_R,      SIL,
	GR_M,      S1,     GR_I,      GR_L,      GR_I,      GR_M,      S2,
	GR_EH,     GR_T,      GR_EX,     GR_R,      SIL,
    
	29,     'k',    'm',    EOS,
	GR_K,      S1,     GR_I,      GR_L,      GR_OH,     MBOUND, GR_M,
	S2,     GR_EH,     GR_T,      GR_EX,     GR_R,      SIL,
	GR_K,      S1,     GR_I,      GR_L,      GR_OH,     MBOUND, GR_M,
	S2,     GR_EH,     GR_T,      GR_EX,     GR_R,      SIL,
    
/* GL 04/29/98  BATS#661 remove "in" abbr */
/*
	11,     'i',    'n',     EOS,
	GR_TS,     GR_O,      GR_L,      SIL,
	GR_TS,     GR_O,      GR_L,      SIL,
*/
/* No translation for plural! add Ginger's guess */
	12,     'i',    'n',    's',     EOS,
	GR_TS,     GR_O,      GR_L,      SIL,
	GR_TS,     GR_O,      GR_L,      SIL,
/* No translation for plural! add Ginger's guess */
	11,     'f',    't',    EOS,
	GR_F,      GR_UH,     GR_SH,     SIL,
	GR_F,      GR_UH,     GR_SH,     SIL,
/* No translation for plural! add Ginger's guess */
	13,     'y',    'd',    EOS,
	GR_J,      GR_AH,     GR_R,      GR_T,      SIL,
	GR_J,      GR_AH,     GR_R,      GR_T,     SIL,

	14,     'y',    'd',    's',    EOS,
	GR_J,      GR_AH,     GR_R,      GR_TS,     SIL,
	GR_J,      GR_AH,     GR_R,      GR_TS,     SIL,

	16,      'm',    'i',    EOS,
	GR_M,      S1,     GR_EI,     GR_L,      GR_EX,     SIL,  
	GR_M,      S1,     GR_EI,     GR_L,      GR_EX,     GR_N,	SIL,  
/* No translation for plural ! add Ginger's guess */
	19,     'h',    'a',    EOS,
	GR_H,      S1,     GR_E,      GR_K,      GR_T,      GR_A,      GR_R,
	SIL,
	GR_H,      S1,     GR_E,      GR_K,      GR_T,      GR_A,      GR_R,
	SIL,

	27,     'm',    'l',    EOS,
	GR_M,      S1,     GR_I,      GR_L,      GR_IH,     MBOUND, GR_L,
	GR_I,      GR_T,      GR_EX,     GR_R,      SIL,
	GR_M,      S1,     GR_I,      GR_L,      GR_IH,     MBOUND, GR_L,
	GR_I,      GR_T,      GR_EX,     GR_R,      SIL,

/* **************** NOT USED ****************************************/
/* these group of unit is in English.  We need to find out for German */
#if 0
	5,     't',    's',    'p',     EOS,
	SIL,
/* No translation for "tsp" ! */
	6,     't',    's',    'p',    's',    EOS,
	SIL,
/* No translation for "tsps" ! */
	6,     't',    'b',    's',    'p',    EOS,
	SIL,
/* No translation for "tbsp" ! */
	7,     't',    'b',    's',    'p',    's',    EOS,
	SIL, 
/* No translation for "tbsps" ! */

	4,     'q',    't',    EOS,
	SIL,
/* No translation for "qt" ! */
#endif // 0
/* ***************************************************************** */
	15,     'g',    'm',    EOS,
	GR_G,      GR_RR,     S1,     GR_AH,     GR_M,      SIL,
	GR_G,      GR_RR,     S1,     GR_AH,     GR_M,      SIL,

	27,     'm',    'g',    EOS,
	GR_M,      S1,     GR_I,      GR_L,      GR_IH,     MBOUND, GR_G,
	GR_RR,     S2,     GR_A,      GR_M,      SIL,
	GR_M,      S1,     GR_I,      GR_L,      GR_IH,     MBOUND, GR_G,
	GR_RR,     S2,     GR_A,      GR_M,      SIL,

	27,     'k',    'g',    EOS,
	GR_K,      S1,     GR_I,      GR_L,      GR_OH,     MBOUND, GR_G,
	GR_RR,     S2,     GR_A,      GR_M,      SIL,
	GR_K,      S1,     GR_I,      GR_L,      GR_OH,     MBOUND, GR_G,
	GR_RR,     S2,     GR_A,      GR_M,      SIL,

	15,     'l',    'b',    EOS,
	GR_PF,     S1,     GR_U,      GR_N,      GR_T,      SIL,
	GR_PF,     S1,     GR_U,      GR_N,      GR_T,      SIL,

	
	16,     'l',    'b',    's',    EOS,
	GR_PF,     S1,     GR_U,      GR_N,      GR_T,      SIL,
	GR_PF,     S1,     GR_U,      GR_N,      GR_T,      SIL,


	18,     'o',    'z',    EOS,
	GR_Q,      S1,     GR_U,      GR_N,      GR_TS,     GR_EX,     SIL,
	GR_Q,      S1,     GR_U,      GR_N,      GR_TS,     GR_EX,     GR_N,
	SIL,

	20,     'o',    'z',    's',    EOS,
	GR_Q,      S1,     GR_U,      GR_N,      GR_TS,     GR_EX,     GR_N,
	SIL,
	GR_Q,      S1,     GR_U,      GR_N,      GR_TS,     GR_EX,     GR_N,
	SIL,

	36,     'n',    's',    'e',    'c',    EOS,
	GR_N,      S1,     GR_A,      GR_N,      GR_OH,     MBOUND, GR_Z,
	GR_EH,     GR_K,      S1,		GR_U,     	GR_N,      GR_D,      GR_EX,     SIL,
	GR_N,      S1,     GR_A,      GR_N,      GR_OH,     MBOUND, GR_Z,
	GR_EH,     GR_K,      S1,		GR_U,     GR_N,      GR_D,      GR_EX,     GR_N,	SIL,
/* No translation for plural !  add Ginger's guess */
	38,     'u',    's',    'e',    'c',    EOS,
	GR_M,      S1,     GR_I,      GR_K,      GR_RR,     GR_OH,     MBOUND,
	GR_Z,      GR_EH,     GR_K,      S1,		GR_U,     	GR_EN,     GR_EI,     GR_EX,     SIL,
	GR_M,      S1,     GR_I,      GR_K,      GR_RR,     GR_OH,     MBOUND,
	GR_Z,      GR_EH,     GR_K,      S1,		GR_U,     GR_EN,     GR_EI,     GR_EX,     GR_N,	SIL,
/* No translation for plural !  add Ginger's guess */
	36,     'm',    's',    'e',    'c',    EOS,
	GR_M,      S1,     GR_I,      GR_L,      GR_IH,     MBOUND, GR_Z,
	GR_EH,     GR_K,      S1,		GR_U,     	GR_N,      GR_D,      GR_EX,     SIL,
	GR_M,      S1,     GR_I,      GR_L,      GR_IH,     MBOUND, GR_Z,
	GR_EH,     GR_K,      S1,		GR_U,     	GR_N,      GR_D,      GR_EX,     GR_N,	SIL,
/* No translation for plural !  add Ginger's guess */
	23,     's',    'e',    'k',    EOS,
	GR_Z,      GR_EH,     GR_K,      S1,     GR_U,     GR_N,      GR_D,
	GR_EX,     SIL,
	GR_Z,      GR_EH,     GR_K,      S1,     GR_U,     GR_N,      GR_D,
	GR_EX,     GR_N,      SIL,

/* **************** NOT USED ************************************* */
#if 0
	25,     's',    'e',    'c',    's',    EOS,
	GR_Z,      GR_EH,     GR_K,      S1,     GR_U,     GR_N,      GR_D,
	GR_EX,     GR_N,      SIL,
	GR_Z,      GR_EH,     GR_K,      S1,     GR_U,     GR_N,      GR_D,
	GR_EX,     GR_N,      SIL,
#endif // 0
/* *************************************************************** */

	21,     'm',    'i',    'n',    EOS,
	GR_M,      GR_IH,      GR_N,      S1,     GR_UH,     GR_T,      GR_EX,
	SIL,
	GR_M,      GR_IH,      GR_N,      S1,     GR_UH,     GR_T,      GR_EX,
	GR_N,      SIL,

/* **************** NOT USED *************************************** */
/* these group of unit is in English.  We need to find out for German */
#if 0	
	4,     'h',    'r',    EOS,
	SIL,
/* No translation for "hr" ! */
	5,     'd',    'e',    'g',    EOS,
	SIL,
/* No translation for "deg" */
	4,     'k',    't',    EOS,
	SIL,
/* No translation for "kt" */
	5,     'k',    't',    's',    EOS,
	SIL,
/* No translation for "kts" */
#endif // 0
/* **************************************************************** */

/* these group of unit is in German but not in the English. */
	14,     'g',    EOS,
	GR_G, GR_RR, S1, GR_AH, GR_M, SIL,
	GR_G, GR_RR, S1, GR_AH, GR_M, SIL,

	16,     'l',    EOS,
	GR_L, S1, GR_I, GR_T, GR_EX, GR_R, SIL,
	GR_L, S1, GR_I, GR_T, GR_EX, GR_R, SIL,

	16,     'm',    EOS,
	GR_M, S1, GR_EH, GR_T, GR_EX, GR_R, SIL,
	GR_M, S1, GR_EH, GR_T, GR_EX, GR_R, SIL,

	22,     '%',    EOS,
	GR_P, GR_RR, GR_O, MBOUND, GR_TS, S1, GR_E, GR_N, GR_T, SIL,
	GR_P, GR_RR, GR_O, MBOUND, GR_TS, S1, GR_E, GR_N, GR_T, SIL,

/*  GL 03/16/1998, don't need this, input from Oliver */
/*
	23,     'm',	'i',	'n',	's',    EOS,
	GR_M, GR_I, GR_N, S1, GR_UH, GR_T, GR_EX, GR_N, SIL,
	GR_M, GR_I, GR_N, S1, GR_UH, GR_T, GR_EX, GR_N, SIL,
*/
	42,     'q',	'k',	'm',    EOS,
	GR_K, GR_V, GR_A, GR_T, GR_RR, S1, GR_AH, GR_T, MBOUND, GR_K, GR_I, GR_L, GR_OH, GR_M, GR_EH, GR_T, GR_EX, GR_R, SIL,
	GR_K, GR_V, GR_A, GR_T, GR_RR, S1, GR_AH, GR_T, MBOUND, GR_K, GR_I, GR_L, GR_OH, GR_M, GR_EH, GR_T, GR_EX, GR_R, SIL,

	33,     'q',	'm',    EOS,
	GR_K, GR_V, GR_A, GR_T, GR_RR, S1, GR_AH, GR_T, MBOUND, GR_M, GR_EH, GR_T, GR_EX, GR_R, SIL,
	GR_K, GR_V, GR_A, GR_T, GR_RR, S1, GR_AH, GR_T, MBOUND, GR_M, GR_EH, GR_T, GR_EX, GR_R, SIL,

	19,     'h',    EOS,
	GR_SH, GR_T, S1, GR_U, GR_N, GR_D, GR_EX, SIL,
	GR_SH, GR_T, S1, GR_U, GR_N, GR_D, GR_EX, GR_N, SIL,

	32,     'm',	's',    EOS,
	GR_M, S1, GR_I, GR_L, GR_IH, MBOUND, GR_Z, GR_EX, GR_K, GR_UH, GR_N, GR_D, GR_EX, SIL,
	GR_M, S1, GR_I, GR_L, GR_IH, MBOUND, GR_Z, GR_EX, GR_K, GR_UH, GR_N, GR_D, GR_EX, GR_N, SIL,

	32,     'n',	's',    EOS,
	GR_N, S1, GR_A, GR_N, GR_OH, MBOUND, GR_Z, GR_EX, GR_K, GR_UH, GR_N, GR_D, GR_EX, SIL,
	GR_N, S1, GR_A, GR_N, GR_OH, MBOUND, GR_Z, GR_EX, GR_K, GR_UH, GR_N, GR_D, GR_EX, GR_N, SIL,

	34,     0xb5,	's',    EOS,	//0xb5='µ'
	GR_M, S1, GR_I, GR_K, GR_RR, GR_OH, MBOUND, GR_Z, GR_EX, GR_K, GR_UH, GR_N, GR_D, GR_EX, SIL,
	GR_M, S1, GR_I, GR_K, GR_RR, GR_OH, MBOUND, GR_Z, GR_EX, GR_K, GR_UH, GR_N, GR_D, GR_EX, GR_N, SIL,

	/* GL 03/16/1998, additional abbr. from Oliver */ 
	33,		0xb0,	'c',	EOS,	//0xb0='°'
	GR_G, GR_R, S1, GR_AH, GR_T, MBOUND,  GR_TS, S1, GR_EX, GR_L, GR_S, GR_I, GR_U, GR_S, SIL,
	GR_G, GR_R, S1, GR_AH, GR_T, MBOUND,  GR_TS, S1, GR_EX, GR_L, GR_S, GR_I, GR_U, GR_S, SIL,

	15,		'h',	'z',	EOS,
	GR_H, S1, GR_E, GR_R, GR_TS, SIL,
	GR_H, S1, GR_E, GR_R, GR_TS, SIL,

	
	53,		'k',	'm',	'/',	'h',	EOS,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_M, S1, GR_EH, GR_T, GR_EX, GR_R, MBOUND, GR_P, GR_R, GR_OH, MBOUND, GR_SH, GR_T, S1, GR_U, GR_N, GR_D, GR_EX, SIL,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_M, S1, GR_EH, GR_T, GR_EX, GR_R, MBOUND, GR_P, GR_R, GR_OH, MBOUND, GR_SH, GR_T, S1, GR_U, GR_N, GR_D, GR_EX, SIL,

	21,		'k',	'j',	EOS,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_DJ, GR_UH, GR_L, SIL,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_DJ, GR_UH, GR_L, SIL,

	38,		'k',	'w',	'h',	EOS,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_V, S1, GR_A, GR_T, GR_SH, GR_T, GR_U, GR_N, GR_D, GR_EX, GR_N, SIL,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_V, S1, GR_A, GR_T, GR_SH, GR_T, GR_U, GR_N, GR_D, GR_EX, GR_N, SIL,

	26,		'k',	'h',	'z',	EOS,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_H, S1, GR_E, GR_R, GR_TS, SIL,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_H, S1, GR_E, GR_R, GR_TS, SIL,

	14,		'v',	EOS,
	GR_V, S1, GR_O, GR_L, GR_T, SIL,
	GR_V, S1, GR_O, GR_L, GR_T, SIL,

	24,		'k',	'b',	'y',	't',	'e',	EOS,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_B, GR_EI, GR_T, SIL,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_B, GR_EI, GR_T, SIL,

	21,		'k',	'b',	EOS,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_B, GR_EI, GR_T, SIL,
	GR_K, S1, GR_IH, GR_L, GR_OH, GR_B, GR_EI, GR_T, SIL,

	24,		'm',	'b',	'y',	't',	'e',	EOS,
	GR_M, S1, GR_E, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,
	GR_M, S1, GR_E, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,

	21,		'm',	'b',	EOS,
	GR_M, S1, GR_E, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,
	GR_M, S1, GR_E, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,

	24,		'g',	'b',	'y',	't',	'e',	EOS,
	GR_G, S1, GR_I, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,
	GR_G, S1, GR_I, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,

	21,		'g',	'b',	EOS,
	GR_G, S1, GR_I, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,
	GR_G, S1, GR_I, GR_G, GR_A, GR_B, GR_EI, GR_T, SIL,

	18,		'p',	'f',	EOS,
	GR_PF, S1, GR_E, GR_N, GR_I, GR_K, SIL,
	GR_PF, S1, GR_E, GR_N, GR_I, GR_G, GR_EX, SIL,

	29,     0xb5,    'm',    EOS,	//0xb5='µ'
	GR_M, S1, GR_I, GR_K, GR_RR, GR_OH, MBOUND, GR_M, GR_EH, GR_T, GR_EX, GR_R, SIL,
	GR_M, S1, GR_I, GR_K, GR_RR, GR_OH, MBOUND, GR_M, GR_EH, GR_T, GR_EX, GR_R, SIL,
    
	22,		'm',	'i',	'o',	EOS,
	GR_M, GR_I, GR_L, GR_IH, S1, GR_OH, GR_N, SIL,
	GR_M, GR_I, GR_L, GR_IH, S1, GR_OH, GR_N, GR_EX, GR_N, SIL,

	25,		'm',	'r',	'd',	EOS,
	GR_M, GR_I, GR_L, GR_IH, S2, GR_A, GR_R, GR_D, GR_EX, SIL,
	GR_M, GR_I, GR_L, GR_IH, S2, GR_A, GR_R, GR_D, GR_EX, GR_N, SIL,

	19,		'k',	'n',	EOS,
	GR_K, GR_N, S1, GR_OH, GR_T, GR_EX, GR_N, SIL,
	GR_K, GR_N, S1, GR_OH, GR_T, GR_EX, GR_N, SIL,

	23,		'm',	'b',	'a',	'r',	EOS,
	GR_M, S1, GR_I, GR_L, GR_IH, GR_B, GR_AH, GR_R, SIL,
	GR_M, S1, GR_I, GR_L, GR_IH, GR_B, GR_AH, GR_R, SIL,

	0
};

/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronounciation of the number words.
 * There is only a single phoneme string.
 */

const unsigned char nwdtab[] = {
        17,     'h',    'u',    'n',    'd',    'e',     'r',    't',
        EOS,
        GR_H,        S1,     GR_U,     GR_N,      GR_D,      GR_EX,      GR_R,     GR_T,     SIL,

        16,     't',    'a',    'u',    's',    'e',    'n',    'd',
        EOS,
        GR_T,     S1,     GR_AU,     GR_Z,      GR_EX,     GR_N,      GR_T,      SIL,

        16,     'm',    'i',    'l',    'l',    'i',    'o',    'n',
        EOS,
        GR_M,      GR_I,     GR_L,      GR_AH,     S1,      GR_OH,     GR_N,      SIL,

        16,     'b',    'i',    'l',    'l',    'i',    'o',    'n',
        EOS,
        GR_B,      GR_I,     GR_L,      GR_AH,     S1,      GR_OH,     GR_N,      SIL,

	18,     't',    'r',    'i',    'l',    'l',    'i',    'o',
	'n',    EOS,
        GR_T,      GR_R,	GR_I,     GR_L,      GR_AH,     S1,      GR_OH,     GR_N,      SIL,

	16,     'z',    'i',    'l',    'l',    'i',    'o',    'n',
	EOS,
        GR_Z,      GR_I,     GR_L,      GR_AH,     S1,      GR_OH,     GR_N,      SIL,

	0
};

const unsigned char m_jan[] = "jan";
const unsigned char m_feb[] = "feb";
const unsigned char m_mar[] = "mär";
const unsigned char m_apr[] = "apr";
const unsigned char m_may[] = "mai";
const unsigned char m_jun[] = "jun";
const unsigned char m_jul[] = "jul";
const unsigned char m_aug[] = "aug";
const unsigned char m_sep[] = "sep";
const unsigned char m_oct[] = "okt";
const unsigned char m_nov[] = "nov";
const unsigned char m_dec[] = "dez";

const unsigned char *const months[] = {
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
 * 01 05-Apr-85 DGC     Changed [s] to [z] in "thousand".
 * 02 08-Apr-85 DGC     Added "pdegree".
 * 03 24-Apr-85 DGC     Fix some phomenes to agree with some
 *                                                      dictionary changes.
 * 04 14-Jun-85 DGC     The "pplus" array isn't needed anymore.
 * 05 27-Jun-85 DGC     Remove last [d] from "thousand".
 * 06 24-Jul-85 DGC     [f'owr] to [f'or] and related forms.
 * 07 20-Aug-85 DGC     Undid 05; sounded bad.
 */

/* no translation! */
const unsigned char pdegree[] = {
	SIL
};

/* unsigned char gpdash[] = {
	GR_D,      S1,     GR_AE,     GR_SH,     SIL
};      eab out-found no longer used*/

const unsigned char pminus[] = {
	GR_M,      GR_IH,     GR_N,     GR_U,      GR_S,     SIL,     
};

const unsigned char pplus[] = {
	GR_P,      GR_L,      GR_U,     GR_S,      SIL
};

const unsigned char pstreet[] = {
	GR_SH,     GR_T,     GR_RR,     S1,    GR_AH,      GR_S,       GR_EX,     SIL
};
		     
/* no translation! */                     
const unsigned char psaint[]  = {
	SIL
};

const unsigned char pdoctor[] = {
	GR_D,      S1,     GR_O,      GR_K,     GR_T,      GR_OH,       GR_R,      SIL 
};
    
/* no translation! */
const unsigned char pdrive[] = {
	SIL
};

const unsigned char p0[]     = {
	GR_N,      S1,     GR_U,      GR_L,    SIL
};

const unsigned char p1[]     = {
	GR_Q,      S1,     GR_EI,     GR_N,    SIL
};

const unsigned char p1a[]     = {
	GR_Q,      S1,     GR_EI,     GR_N,    GR_S,	SIL
};

const unsigned char p1s[]     = {
	GR_S,	SIL
};

const unsigned char p1e[]     = {
	GR_EX,	SIL
};

const unsigned char p1b[]     = {
	GR_Q,      S1,     GR_EI,     GR_N,    GR_EX,      SIL
};

const unsigned char p2[]     = {
	GR_TS,     GR_V,      S1,     GR_EI,   SIL
};

const unsigned char p3[]     = {
	GR_D,      GR_R,     S1,     GR_EI,   SIL
};

const unsigned char p4[]     = {
	GR_F,      S1,     GR_IH,     GR_R,    SIL
};

const unsigned char p5[]     = {
	GR_F,      S1,     GR_UE,     GR_N,    GR_F,      SIL
};

const unsigned char p6[]     = {
	GR_Z,      S1,     GR_E,      GR_K,   GR_S,      SIL
};

const unsigned char p7[]     = {
	GR_Z,      S1,     GR_IH,     GR_B,    GR_EX,     GR_N,        SIL
};

const unsigned char p8[]     = {
	GR_Q,      S1,     GR_A,      GR_KH,   GR_T,      SIL 
};

const unsigned char p9[]     = {
	GR_N,      S1,     GR_EU,     GR_N,    SIL
};

const unsigned char *const punits[] = {
	p0,    p1,    p2,    p3,   p4,
	p5,    p6,    p7,    p8,   p9
};

const unsigned char phundred[] = {
	GR_H,      GR_U,      GR_N,      GR_D,    	GR_EX,     GR_R,	GR_T,	SIL
};

const unsigned char pthousand[] = {
	GR_T,      S1,    GR_AU,     GR_Z,      GR_EX,   	GR_N,      GR_T,	SIL
};

const unsigned char pmillion[] = {
	GR_M,	GR_I,	GR_L,      GR_J,      S2,     GR_OH,	GR_N,	SIL
};

const unsigned char pmillions[] = {
	GR_M,	GR_I,	GR_L,      GR_J,      S2,     GR_OH,	GR_N,	GR_EX,	GR_N,	SIL
};

const unsigned char pbillion[] = {
	GR_M,	GR_I,	GR_L,      GR_J,      S2,     GR_AH,	GR_R,	GR_D,	GR_EX, SIL
};

const unsigned char pbillions[] = {
	GR_M,	GR_I,	GR_L,      GR_J,      S2,     GR_AH,	GR_R,	GR_D,	GR_EX, GR_N,	SIL
};

const unsigned char ptrillion[] = {
	GR_B,	GR_I,	GR_L,      GR_J,      S2,     GR_OH,	GR_N,	SIL
};

const unsigned char ptrillions[] = {
	GR_B,	GR_I,	GR_L,      GR_J,      S2,     GR_OH,	GR_N,	GR_EX,	GR_N,	SIL
};

const unsigned char pquadrillion[] = {
	GR_B,	GR_I,	GR_L,      GR_J,      S2,     GR_AH,	GR_R,	GR_D,	GR_EX, SIL
};

const unsigned char pquadrillions[] = {
	GR_B,	GR_I,	GR_L,      GR_J,      S2,     GR_AH,	GR_R,	GR_D,	GR_EX, GR_N,	SIL
};


const unsigned char p10[]    = {
	GR_TS,     S1,     GR_EH,     GR_N,    SIL
};

const unsigned char p11[]    = {
	GR_Q,     S1,     GR_E,      GR_L,    GR_F,      SIL
};

const unsigned char p12[]    = {
	GR_TS,    GR_V,      S1,     GR_OE,   GR_L,      GR_F,        SIL
};

const unsigned char p13[]    = {
	GR_D,     GR_R,      S1,     GR_EI,   MBOUND, GR_TS,       GR_EH,     GR_N,
	SIL
};

const unsigned char p14[]    = {
	GR_F,     S1,     GR_I,      GR_R,    MBOUND, GR_TS,       GR_EH,     GR_N,
	SIL
};

const unsigned char p15[]    = {
	GR_F,     S1,     GR_UE,     GR_N,    GR_F,      MBOUND,   GR_TS,     GR_EH,
	GR_N,       SIL
};

const unsigned char p16[]    = {
	GR_Z,     S1,     GR_E,      GR_CH,   MBOUND, GR_TS,       GR_EH,     GR_N,
	SIL
};

const unsigned char p17[]    = {
	GR_Z,     S1,     GR_IH,     GR_P,    MBOUND, GR_TS,       GR_EH,     GR_N,   
	SIL
};

const unsigned char p18[]    = {
	GR_Q,     S1,     GR_A,      GR_KH,   MBOUND, GR_TS,       GR_EH,      GR_N,
	SIL
};

const unsigned char p19[]    = {
	GR_N,     S1,     GR_EU,     GR_N,    MBOUND, GR_TS,       GR_EH,      GR_N,
	SIL
};

const unsigned char *const pteens[] = {
	p10,   p11,   p12,   p13,   p14,
	p15,   p16,   p17,   p18,   p19
};

const unsigned char pnone[]  = {
	SIL
};

const unsigned char p20[]    = {
	GR_TS,	GR_V,     S1,      GR_A,      GR_N,   MBOUND, GR_TS,       GR_I,       GR_K,
	SIL
};

const unsigned char p30[]    = {
	GR_D,     GR_RR,      S1,     GR_EI,  MBOUND, GR_S,        GR_I,       GR_K,
	SIL
};

const unsigned char p40[]    = {
	GR_F,     S1,      GR_I,      GR_R,   MBOUND, GR_TS,       GR_I,       GR_K,
	SIL
};

const unsigned char p50[]    = {
	GR_F,     S1,      GR_UE,     GR_N,   GR_F,      MBOUND,   GR_TS,      GR_I,
	GR_K,       SIL
};

const unsigned char p60[]    = {
	GR_Z,     S1,      GR_E,      GR_CH,  MBOUND, GR_TS,       GR_I,       GR_K,
	SIL
};

const unsigned char p70[]    = {
	GR_Z,     S1,      GR_I,      GR_P,   MBOUND, GR_TS,       GR_I,       GR_K,
	SIL
};

const unsigned char p80[]    = {
	GR_Q,     S1,      GR_A,      GR_KH,  MBOUND, GR_TS,       GR_I,       GR_K,
	SIL
};

const unsigned char p90[]    = {
	GR_N,     S1,      GR_EU,     GR_N,   MBOUND, GR_TS,       GR_I,       GR_K,
	SIL
};

const unsigned char *const ptens[] = {
	pnone, pnone, p20,   p30,   p40,
	p50,   p60,   p70,   p80,   p90
};

const unsigned char ppence[] = {
	GR_P,      S1,     GR_E,      GR_N,      GR_TS,     SIL
};      

const unsigned char ppercent[] = {
	GR_P,      GR_RR,     GR_O,      MBOUND, GR_TS,     S1,      GR_E,
	GR_N,      GR_T,      SIL
};
	
const unsigned char pcent[] = {
	GR_TS,     S1,     GR_E,      GR_N,      GR_T,      SIL
};

const unsigned char peuro[] = {
	S1, GR_EU, GR_R, GR_O1, SIL
};

const unsigned char ppound[] = {
	GR_PF,     S1,     GR_U,      GR_N,      GR_T,      SIL
};

const unsigned char pdollar[] = {
	GR_D,      S1,     GR_O,      GR_L,      GR_A,      GR_R,       SIL
};

const unsigned char pand[] = {
	GR_U,       GR_N,      GR_T,		SIL
};

const unsigned char ppoint[] = {
	GR_P,       S1,     GR_U,      GR_NG,     GR_K,      GR_T,       SIL
};

const unsigned char pcomma[] = {
        GR_K,       S1,     GR_O,      GR_M,     GR_AH,       SIL
};                                                           

/* no translation */
const unsigned char ptt2tp[] = {
	SIL
};

const unsigned char pjan[] = {
	GR_J,      S1,     GR_A,      GR_N,      GR_U,      GR_AH,      GR_R,
	SIL
};

const unsigned char pfeb[] = {
	GR_F,      S1,     GR_EH,     GR_B,      GR_RR,     GR_U,       GR_AH,     GR_R,
	SIL
};

const unsigned char pmar[] = {
	GR_M,      GR_AE,     GR_R,      GR_TS,      SIL
};

const unsigned char papr[] = {
	GR_Q,      GR_A,      GR_P,      GR_RR,      S1,    GR_I,       GR_L,      SIL
};

const unsigned char pmay[] = {
	GR_M,	GR_EI,	SIL
};

const unsigned char pjun[] = {
	GR_J,     S1,     GR_UH,      GR_N,      GR_IH,      SIL
};

const unsigned char pjul[] = {
	GR_J,     S1,     GR_UH,      GR_L,      GR_IH,      SIL
};

const unsigned char paug[] = {
	GR_Q,     GR_AU,     GR_G,       S1,     GR_U,       GR_S,      GR_T,
	SIL
};
 
const unsigned char psep[] = {
	GR_Z,     GR_E,      GR_P,       GR_T,      S1,      GR_E,      GR_M,
	GR_B,      GR_EX,    GR_R,      SIL
};
 
const unsigned char poct[] = {
	GR_O,     GR_K,      GR_T,       S1,     GR_OH,      GR_B,      GR_EX,
	GR_R,      SIL
};
 
const unsigned char pnov[] = {
	GR_N,     GR_O,      GR_V,       S1,     GR_E,       GR_M,      GR_B,      GR_EX,
	GR_R,          SIL
};

const unsigned char pdec[] = {
	GR_D,     GR_E,      GR_TS,      S1,     GR_E,       GR_M,      GR_B,      GR_EX,
	GR_R,      SIL
};
 
const unsigned char *const pmonths[] = {
	pjan, pfeb,  pmar,  papr,  pmay,  pjun,
	pjul, paug,  psep,  poct,  pnov,  pdec
};                                        
 
const unsigned char p0th[] = {
	SIL
/* no translation */
};
 
const unsigned char p1st[] = {
	GR_Q, S1, GR_EH, GR_R, GR_S, GR_T, GR_EX, GR_R, SIL
};

const unsigned char p2nd[] = {
	S1,	GR_TS,	GR_V,	GR_EI,	GR_T,	GR_EX, GR_R,
	SIL
};
 
const unsigned char p3rd[] = {
	S1,	GR_D,	GR_RR,	GR_I,	GR_T,	GR_EX, GR_R,
	SIL
};
 
const unsigned char p4th[] = {
	S1,	GR_F,	GR_IH,	GR_R,	GR_T,	GR_EX, GR_R,
	SIL
};
 
const unsigned char p5th[] = {
	S1,	GR_F,	GR_UE,	GR_N,	GR_F,	GR_T,	GR_EX,  GR_R,
	SIL
};
 
const unsigned char p6th[] = {
	GR_Z,	S1,	GR_E,	GR_K,	GR_S,	GR_T,	GR_EX, GR_R,
	SIL
};
 
const unsigned char p7th[] = {
	GR_Z,	S1,	GR_IH,	GR_P,	GR_T,	GR_EX, GR_R,
	SIL
};
 
const unsigned char p8th[] = {
	GR_Q,	S1,	GR_A,	GR_KH,	GR_T,	GR_EX, GR_R,
	SIL
};
 
const unsigned char p9th[] = {
	GR_N,	S1,	GR_EU,	GR_N,	GR_T,	GR_EX, GR_R,
	SIL
};
 
const unsigned char *const pordin[] = {
	p0th,  p1st,  p2nd,  p3rd,  p4th,
	p5th,  p6th,  p7th,  p8th,  p9th
};
 
const unsigned char phalf[] = {
	GR_H,     GR_A,     GR_L,     GR_B,      SIL
};
 
const unsigned char phalves[] = {
	GR_H,     S1,     GR_AE,     GR_V,      GR_Z,      SIL
};

const unsigned char phour[] = {
	S1, GR_UH, GR_R, SIL
};

const unsigned char pminute[] = {
	GR_M,     GR_IH,     GR_N,     S1,      GR_UH,      GR_T,	GR_EX,	SIL
};

const unsigned char pminutes[] = {
	GR_M,     GR_IH,     GR_N,     S1,      GR_UH,      GR_T,	GR_EX,	GR_N,	SIL
};

const unsigned char psecond[] = {
	GR_Z,      GR_EH,     GR_K,      S1,     GR_U,     GR_N,      GR_D,
	GR_EX,     SIL
};

const unsigned char pseconds[] = {
	GR_Z,      GR_EH,     GR_K,      S1,     GR_U,     GR_N,      GR_D,
	GR_EX,     GR_N,      SIL
};

const unsigned char pstex[] = {
	GR_S,	GR_T,	GR_EX,  SIL
};

const unsigned char ptex[] = {
	GR_T,	GR_EX,  SIL
};

const unsigned char pstexr[] = {
	GR_S,	GR_T,	GR_EX,  GR_R,  SIL
};

const unsigned char ptexr[] = {
	GR_T,	GR_EX,  GR_R,	 SIL
};

/*
 * This table, indexed by the grapheme
 * codes, returns the basic set of features.
 * The "[+GEM]" feature, and the setting of the
 * "[+VOC]" and "[+CONS]" on the letter "Y" are
 * special, and get done by "addgraph" with
 * some special code.
 */

const U16 feats[]	= {
	0,								/* End mark			*/
	FSEG+FVOC+FSYL,					/* A				*/
	FSEG+FCONS+FVOICE,				/* B				*/
	FSEG+FCONS+FC,					/* C				*/
	FSEG+FCONS+FVOICE+FCOR,			/* D				*/
	FSEG+FVOC+FSYL,					/* E				*/
	FSEG+FCONS,						/* F				*/
	FSEG+FCONS+FVOICE+FLTSVELAR,		/* G				*/
	FSEG+FCONS,						/* H				*/
	FSEG+FVOC+FHIGH+FSYL,			/* I				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,	/* J				*/
	FSEG+FCONS+FLTSVELAR,				/* K				*/
	FSEG+FCONS+FVOICE+FLIQ+FCOR+FL,	/* L				*/
	FSEG+FCONS+FVOICE+FNAS,			/* M				*/
	FSEG+FCONS+FVOICE+FNAS+FCOR,	/* N				*/
	FSEG+FVOC+FSYL,					/* O				*/
	FSEG+FCONS,						/* P				*/
	FSEG+FCONS,						/* Q				*/
	FSEG+FCONS+FVOICE+FLIQ+FR,		/* R				*/
	FSEG+FCONS+FSIB,				/* S				*/
	FSEG+FCONS+FCOR,				/* T				*/
	FSEG+FVOC+FHIGH+FSYL,			/* U				*/
	FSEG+FCONS+FVOICE,				/* V				*/
	FSEG+FCONS+FVOICE+FCOR,			/* W				*/
	FSEG+FCONS+FSIB+FX,				/* X				*/
	FSEG,							/* Y				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,	/* Z				*/
	FSEG+FVOC+FSYL,					/* Ä				*/
	FSEG+FVOC+FSYL,					/* Ö				*/
	FSEG+FCONS+FSIB,				/* ß				*/
	FSEG+FVOC+FHIGH+FSYL,			/* Ö				*/
	FSEG+FCONS+FVOICE+FLTSVELAR,		/* GU				*/
	FSEG+FCONS,						/* QU				*/
	0,								/* '				*/
	0								/* +				*/
};

/*
 * Feature table for German
 * Index by phoneme.
 */

const U16 pfeat[] = {

	0,						/* SIL				*/
	PVOC+PVOICE+PBACK,		/* A				*/
	PVOC+PVOICE,			/* E				*/
	PVOC+PVOICE,			/* AE				*/
	PVOC+PVOICE,			/* EX				*/
	PVOC+PVOICE,			/* I				*/
	PVOC+PVOICE+PBACK,		/* O				*/
	PVOC+PVOICE,			/* OE				*/
	PVOC+PVOICE+PBACK,		/* U				*/
	PVOC+PVOICE,			/* UE				*/
	PVOC+PVOICE+PBACK+PLONG,/* AH				*/
	PVOC+PVOICE+PLONG,		/* EH				*/
	PVOC+PVOICE+PLONG,		/* AEH				*/
	PVOC+PVOICE+PLONG,		/* IH				*/
	PVOC+PVOICE+PBACK+PLONG,/* OH				*/
	PVOC+PVOICE+PLONG,		/* OEH				*/
	PVOC+PVOICE+PBACK+PLONG,/* UH				*/
	PVOC+PVOICE+PLONG,		/* UEH				*/
	PVOC+PVOICE,			/* EI				*/
	PVOC+PVOICE+PBACK,		/* AU				*/
	PVOC+PVOICE,			/* EU				*/
	PVOC+PVOICE,			/* AN				*/
	PVOC+PVOICE,			/* IM				*/
	PVOC+PVOICE,			/* UM				*/
	PVOC,					/* ON				*/
	PVOC,					/* J				*/
	PCONS+PVOICE,			/* L				*/
	PCONS+PVOICE,			/* RR				*/
	PCONS+PVOICE,			/* R				*/
	PCONS,					/* H				*/
	PCONS+PVOICE+POBS,		/* M				*/
	PCONS+PVOICE+POBS,		/* N				*/
	PCONS+PVOICE+POBS,		/* NG				*/
	PVOC+PVOICE+POBS,		/* EM				*/
	PVOC+PVOICE+POBS,		/* EN				*/
	PVOC+PVOICE+POBS,		/* EL				*/
	PCONS+POBS,				/* F				*/
	PCONS+PVOICE+POBS,		/* V				*/
	PCONS+PSIB+POBS,		/* S				*/
	PCONS+PVOICE+PSIB+POBS,	/* Z				*/
	PCONS+PSIB+POBS,		/* SH				*/
	PCONS+PVOICE+PSIB+POBS,	/* ZH				*/
	PCONS+POBS,				/* CH				*/
	PCONS+PVOICE+PSIB,		/* JH				*/
	PCONS+POBS,				/* KH				*/
	PCONS+POBS,				/* P				*/
	PCONS+PVOICE+POBS,		/* B				*/
	PCONS+POBS+PTD,			/* T				*/
	PCONS+PVOICE+POBS+PTD,	/* D				*/
	PCONS+POBS,				/* K				*/
	PCONS+PVOICE+POBS,		/* G				*/
	PCONS,					/* Q				*/
	PCONS+POBS,				/* PF				*/
	PCONS+POBS,				/* TS				*/
	PCONS+PVOICE+POBS,		/* DJ				*/
	PCONS+POBS,				/* TJ				*/
	PCONS,					/* KSX				*/
	0,0,0,0,0,0,0,0,0,0,	/* place holder for null phones */
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,
	0,				/* BLOCK_RULES			*/
	0,				/* S3				*/
	0,				/* S2				*/
	0,				/* S1				*/
	0,				/* SEMPH			*/
	0,				/* HAT_RISE			*/
	0,				/* HAT_FALL			*/
	0,				/* HAT_RF			*/
	0,				/* DASH		(SBOUND)	*/
	0,				/* STAR		(MBOUND)	*/
	0,				/* HASH		(HYPHEN)	*/
	0,				/* WBOUND			*/
	0,				/* PPSTART			*/
	0,				/* VPSTART			*/
	0,				/* RELSTART			*/
	0,				/* EQUAL	(COMMA)		*/
	0,				/* PLUS		(PERIOD)	*/
	0,				/* QUEST			*/
	0,				/* EXCLAM			*/
	0,				/* NEW_PARAGRAPH		*/
	0				/* Special_word */
};

const unsigned char whdic[] = {
        5,'w','e','r',GGEOS,SIL,
        4,'w','o',GGEOS,SIL,
        5,'w','a','s',GGEOS,SIL,
        5,'w','i','e',GGEOS,SIL,
        7,'w','a','r','u','m',GGEOS,SIL,
        9,'w','i','e','v','i','e','l',GGEOS,SIL,
        7,'w','o','h','i','n',GGEOS,SIL,
        7,'w','o','h','e','r',GGEOS,SIL,
        5,'w','e','m',GGEOS,SIL,
        5,'w','e','n',GGEOS,SIL,
        8,'w','e','s','s','e','n',GGEOS,SIL,
        8,'w','e','l','c','h','e',GGEOS,SIL,
        9,'w','e','l','c','h','e','r',GGEOS,SIL,
        9,'w','e','l','c','h','e','s',GGEOS,SIL,
        9,'w','e','l','c','h','e','n',GGEOS,SIL,
        9,'w','e','l','c','h','e','m',GGEOS,SIL,
        0
};
 
/*
 * stress refusal table
 */
  
const unsigned char	preftab[] = {
	3,		GR_E,	GR_M,	GR_P,		/* emp-            [E][m][p] */
	3,		GR_E,	GR_N,	GR_T,		/* ent-            [E][n][t] */
	3,		GR_F,	GR_E,	GR_RR,		/* ver-            [f][E][r] */	
	3,		GR_F,	GR_E,	GR_R,		/* ver-            [f][E][R] */	
	3,		GR_TS,	GR_E,	GR_RR,		/* zer-            [C/][E][r] */
	3,		GR_TS,	GR_E,	GR_R,		/* zer-            [C/][E][R] */
	3,		GR_TS,	GR_EX,	GR_RR,		/* zer-            [C/][E][r] */
	3,		GR_TS,	GR_EX,	GR_R,		/* zer-            [C/][E][R] */
	2,		GR_B,	GR_EX,			/* be-             [b][@] */
	2,		GR_E,	GR_RR,			/* er-             [E][r] */
	2,		GR_E,	GR_R,			/* er-             [E][R] */
	2,		GR_G,	GR_EX,			/* ge-             [g][@] */
	0
};
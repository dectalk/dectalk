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
 * 001  GL      7/11/96         fix problem in nabtab[]
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
	IGNORE,
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

unsigned char nabtab[] = {

	27,     'c',    'm',    EOS,
	TS,     S1,     E,      N,      T,      I,      M,
	EH,     T,      EX,     R,      SIL,
	TS,     S1,     E,      N,      T,      I,      M,
	EH,     T,      EX,     R,      SIL,

	27,     'm',    'm',    EOS,
	M,      S1,     I,      L,      I,      M,      S2,
	EH,     T,      EX,     R,      SIL,
	M,      S1,     I,      L,      I,      M,      S2,
	EH,     T,      EX,     R,      SIL,
    
	29,     'k',    'm',    EOS,
	K,      S1,     I,      L,      OH,     MBOUND, M,
	S2,     EH,     T,      EX,     R,      SIL,
	K,      S1,     I,      L,      OH,     MBOUND, M,
	S2,     EH,     T,      EX,     R,      SIL,
    
/* GL 04/29/98  BATS#661 remove "in" abbr *
/*
	11,     'i',    'n',     EOS,
	TS,     O,      L,      SIL,
	TS,     O,      L,      SIL,
*/
/* No translation for plural! add Ginger's guess */

	12,     'i',    'n',    's',     EOS,
	TS,     O,      L,      SIL,
	TS,     O,      L,      SIL,
/* No translation for plural! add Ginger's guess */
	

	11,     'f',    't',    EOS,
	F,      UH,     SH,     SIL,
	F,      UH,     SH,     SIL,
/* No translation for plural! add Ginger's guess */

	13,     'y',    'd',    EOS,
	J,      AH,     R,      T,      SIL,
	J,      AH,     R,      T,     SIL,

	14,     'y',    'd',    's',    EOS,
	J,      AH,     R,      TS,     SIL,
	J,      AH,     R,      TS,     SIL,

	16,      'm',    'i',    EOS,
	M,      S1,     EI,     L,      EX,     SIL,  
	M,      S1,     EI,     L,      EX,     N,	SIL,  
/* No translation for plural ! add Ginger's guess */

	19,     'h',    'a',    EOS,
	H,      S1,     E,      K,      T,      A,      R,
	SIL,
	H,      S1,     E,      K,      T,      A,      R,
	SIL,

	27,     'm',    'l',    EOS,
	M,      S1,     I,      L,      IH,     MBOUND, L,
	I,      T,      EX,     R,      SIL,
	M,      S1,     I,      L,      IH,     MBOUND, L,
	I,      T,      EX,     R,      SIL,


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
#endif

	15,     'g',    'm',    EOS,
	G,      RR,     S1,     AH,     M,      SIL,
	G,      RR,     S1,     AH,     M,      SIL,

	27,     'm',    'g',    EOS,
	M,      S1,     I,      L,      IH,     MBOUND, G,
	RR,     S2,     A,      M,      SIL,
	M,      S1,     I,      L,      IH,     MBOUND, G,
	RR,     S2,     A,      M,      SIL,

	27,     'k',    'g',    EOS,
	K,      S1,     I,      L,      OH,     MBOUND, G,
	RR,     S2,     A,      M,      SIL,
	K,      S1,     I,      L,      OH,     MBOUND, G,
	RR,     S2,     A,      M,      SIL,

	15,     'l',    'b',    EOS,
	PF,     S1,     U,      N,      T,      SIL,
	PF,     S1,     U,      N,      T,      SIL,

	
	16,     'l',    'b',    's',    EOS,
	PF,     S1,     U,      N,      T,      SIL,
	PF,     S1,     U,      N,      T,      SIL,


	18,     'o',    'z',    EOS,
	Q,      S1,     U,      N,      TS,     EX,     SIL,
	Q,      S1,     U,      N,      TS,     EX,     N,
	SIL,

	20,     'o',    'z',    's',    EOS,
	Q,      S1,     U,      N,      TS,     EX,     N,
	SIL,
	Q,      S1,     U,      N,      TS,     EX,     N,
	SIL,

	36,     'n',    's',    'e',    'c',    EOS,
	N,      S1,     A,      N,      OH,     MBOUND, Z,
	EH,     K,      S1,		U,     	N,      D,      EX,     SIL,
	N,      S1,     A,      N,      OH,     MBOUND, Z,
	EH,     K,      S1,		U,     N,      D,      EX,     N,	SIL,
/* No translation for plural !  add Ginger's guess */

	38,     'u',    's',    'e',    'c',    EOS,
	M,      S1,     I,      K,      RR,     OH,     MBOUND,
	Z,      EH,     K,      S1,		U,     	EN,     EI,     EX,     SIL,
	M,      S1,     I,      K,      RR,     OH,     MBOUND,
	Z,      EH,     K,      S1,		U,     EN,     EI,     EX,     N,	SIL,
/* No translation for plural !  add Ginger's guess */

	36,     'm',    's',    'e',    'c',    EOS,
	M,      S1,     I,      L,      IH,     MBOUND, Z,
	EH,     K,      S1,		U,     	N,      D,      EX,     SIL,
	M,      S1,     I,      L,      IH,     MBOUND, Z,
	EH,     K,      S1,		U,     	N,      D,      EX,     N,	SIL,
/* No translation for plural !  add Ginger's guess */

	23,     's',    'e',    'k',    EOS,
	Z,      EH,     K,      S1,     U,     N,      D,
	EX,     SIL,
	Z,      EH,     K,      S1,     U,     N,      D,
	EX,     N,      SIL,

#if 0
	25,     's',    'e',    'c',    's',    EOS,
	Z,      EH,     K,      S1,     U,     N,      D,
	EX,     N,      SIL,
	Z,      EH,     K,      S1,     U,     N,      D,
	EX,     N,      SIL,
#endif

	21,     'm',    'i',    'n',    EOS,
	M,      IH,      N,      S1,     UH,     T,      EX,
	SIL,
	M,      IH,      N,      S1,     UH,     T,      EX,
	N,      SIL,

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
#endif	


/* these group of unit is in German but not in the English. */
	14,     'g',    EOS,
	G, RR, S1, AH, M, SIL,
	G, RR, S1, AH, M, SIL,

	16,     'l',    EOS,
	L, S1, I, T, EX, R, SIL,
	L, S1, I, T, EX, R, SIL,

	16,     'm',    EOS,
	M, S1, EH, T, EX, R, SIL,
	M, S1, EH, T, EX, R, SIL,

	22,     '%',    EOS,
	P, RR, O, MBOUND, TS, S1, E, N, T, SIL,
	P, RR, O, MBOUND, TS, S1, E, N, T, SIL,

/*  GL 03/16/1998, don't need this, input from Oliver */
/*
	23,     'm',	'i',	'n',	's',    EOS,
	M, I, N, S1, UH, T, EX, N, SIL,
	M, I, N, S1, UH, T, EX, N, SIL,
*/
	42,     'q',	'k',	'm',    EOS,
	K, V, A, T, RR, S1, AH, T, MBOUND, K, I, L, OH, M, EH, T, EX, R, SIL,
	K, V, A, T, RR, S1, AH, T, MBOUND, K, I, L, OH, M, EH, T, EX, R, SIL,

	33,     'q',	'm',    EOS,
	K, V, A, T, RR, S1, AH, T, MBOUND, M, EH, T, EX, R, SIL,
	K, V, A, T, RR, S1, AH, T, MBOUND, M, EH, T, EX, R, SIL,

	19,     'h',    EOS,
	SH, T, S1, U, N, D, EX, SIL,
	SH, T, S1, U, N, D, EX, N, SIL,

	32,     'm',	's',    EOS,
	M, S1, I, L, IH, MBOUND, Z, EX, K, UH, N, D, EX, SIL,
	M, S1, I, L, IH, MBOUND, Z, EX, K, UH, N, D, EX, N, SIL,

	32,     'n',	's',    EOS,
	N, S1, A, N, OH, MBOUND, Z, EX, K, UH, N, D, EX, SIL,
	N, S1, A, N, OH, MBOUND, Z, EX, K, UH, N, D, EX, N, SIL,

	34,     'µ',	's',    EOS,
	M, S1, I, K, RR, OH, MBOUND, Z, EX, K, UH, N, D, EX, SIL,
	M, S1, I, K, RR, OH, MBOUND, Z, EX, K, UH, N, D, EX, N, SIL,

	/* GL 03/16/1998, additional abbr. from Oliver */ 
	33,		'°',	'c',	EOS,
	G, R, S1, AH, T, MBOUND,  TS, S1, EX, L, S, I, U, S, SIL,
	G, R, S1, AH, T, MBOUND,  TS, S1, EX, L, S, I, U, S, SIL,

	15,		'h',	'z',	EOS,
	H, S1, E, R, TS, SIL,
	H, S1, E, R, TS, SIL,

	
	53,		'k',	'm',	'/',	'h',	EOS,
	K, S1, IH, L, OH, M, S1, EH, T, EX, R, MBOUND, P, R, OH, MBOUND, SH, T, S1, U, N, D, EX, SIL,
	K, S1, IH, L, OH, M, S1, EH, T, EX, R, MBOUND, P, R, OH, MBOUND, SH, T, S1, U, N, D, EX, SIL,

	21,		'k',	'j',	EOS,
	K, S1, IH, L, OH, DJ, UH, L, SIL,
	K, S1, IH, L, OH, DJ, UH, L, SIL,

	38,		'k',	'w',	'h',	EOS,
	K, S1, IH, L, OH, V, S1, A, T, SH, T, U, N, D, EX, N, SIL,
	K, S1, IH, L, OH, V, S1, A, T, SH, T, U, N, D, EX, N, SIL,

	26,		'k',	'h',	'z',	EOS,
	K, S1, IH, L, OH, H, S1, E, R, TS, SIL,
	K, S1, IH, L, OH, H, S1, E, R, TS, SIL,

	14,		'v',	EOS,
	V, S1, O, L, T, SIL,
	V, S1, O, L, T, SIL,

	24,		'k',	'b',	'y',	't',	'e',	EOS,
	K, S1, IH, L, OH, B, EI, T, SIL,
	K, S1, IH, L, OH, B, EI, T, SIL,

	21,		'k',	'b',	EOS,
	K, S1, IH, L, OH, B, EI, T, SIL,
	K, S1, IH, L, OH, B, EI, T, SIL,

	24,		'm',	'b',	'y',	't',	'e',	EOS,
	M, S1, E, G, A, B, EI, T, SIL,
	M, S1, E, G, A, B, EI, T, SIL,

	21,		'm',	'b',	EOS,
	M, S1, E, G, A, B, EI, T, SIL,
	M, S1, E, G, A, B, EI, T, SIL,

	24,		'g',	'b',	'y',	't',	'e',	EOS,
	G, S1, I, G, A, B, EI, T, SIL,
	G, S1, I, G, A, B, EI, T, SIL,

	21,		'g',	'b',	EOS,
	G, S1, I, G, A, B, EI, T, SIL,
	G, S1, I, G, A, B, EI, T, SIL,

	18,		'p',	'f',	EOS,
	PF, S1, E, N, I, K, SIL,
	PF, S1, E, N, I, G, EX, SIL,

	29,     'µ',    'm',    EOS,
	M, S1, I, K, RR, OH, MBOUND, M, EH, T, EX, R, SIL,
	M, S1, I, K, RR, OH, MBOUND, M, EH, T, EX, R, SIL,
    
	22,		'm',	'i',	'o',	EOS,
	M, I, L, IH, S1, OH, N, SIL,
	M, I, L, IH, S1, OH, N, EX, N, SIL,

	25,		'm',	'r',	'd',	EOS,
	M, I, L, IH, S2, A, R, D, EX, SIL,
	M, I, L, IH, S2, A, R, D, EX, N, SIL,

	19,		'k',	'n',	EOS,
	K, N, S1, OH, T, EX, N, SIL,
	K, N, S1, OH, T, EX, N, SIL,

	23,		'm',	'b',	'a',	'r',	EOS,
	M, S1, I, L, IH, B, AH, R, SIL,
	M, S1, I, L, IH, B, AH, R, SIL,


	0
};

/*
 * This table, which has the same basic
 * format as the number abbreviation table, contains
 * the names and the pronounciation of the number words.
 * There is only a single phoneme string.
 */

unsigned char nwdtab[] = {
        17,     'h',    'u',    'n',    'd',    'e',     'r',    't',
        EOS,
        H,        S1,     U,     N,      D,      EX,      R,     T,     SIL,

        16,     't',    'a',    'u',    's',    'e',    'n',    'd',
        EOS,
        T,     S1,     AU,     Z,      EX,     N,      T,      SIL,

        16,     'm',    'i',    'l',    'l',    'i',    'o',    'n',
        EOS,
        M,      I,     L,      AH,     S1,      OH,     N,      SIL,

        16,     'b',    'i',    'l',    'l',    'i',    'o',    'n',
        EOS,
        B,      I,     L,      AH,     S1,      OH,     N,      SIL,

	18,     't',    'r',    'i',    'l',    'l',    'i',    'o',
	'n',    EOS,
        T,      R,	I,     L,      AH,     S1,      OH,     N,      SIL,

	16,     'z',    'i',    'l',    'l',    'i',    'o',    'n',
	EOS,
        Z,      I,     L,      AH,     S1,      OH,     N,      SIL,

	0
};


unsigned char m_jan[] = "jan";
unsigned char m_feb[] = "feb";
unsigned char m_mar[] = "mär";
unsigned char m_apr[] = "apr";
unsigned char m_may[] = "mai";
unsigned char m_jun[] = "jun";
unsigned char m_jul[] = "jul";
unsigned char m_aug[] = "aug";
unsigned char m_sep[] = "sep";
unsigned char m_oct[] = "okt";
unsigned char m_nov[] = "nov";
unsigned char m_dec[] = "dez";

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
unsigned char pdegree[] = {
	SIL
};

/* unsigned char gpdash[] = {
	D,      S1,     AE,     SH,     SIL
};      eab out-found no longer used*/

unsigned char pminus[] = {
	M,      IH,     N,     U,      S,     SIL,     
};

unsigned char pplus[] = {
	P,      L,      U,     S,      SIL
};


unsigned char pstreet[] = {
	SH,     T,     RR,     S1,    AH,      S,       EX,     SIL
};
		     
/* no translation! */                     
unsigned char psaint[]  = {
	SIL
};

unsigned char pdoctor[] = {
	D,      S1,     O,      K,     T,      OH,       R,      SIL 
};
    
/* no translation! */
unsigned char pdrive[] = {
	SIL
};

unsigned char p0[]     = {
	N,      S1,     U,      L,    SIL
};

unsigned char p1[]     = {
	Q,      S1,     EI,     N,    SIL
};
unsigned char p1a[]     = {
	Q,      S1,     EI,     N,    S,	SIL
};
unsigned char p1s[]     = {
	S,	SIL
};
unsigned char p1e[]     = {
	EX,	SIL
};
unsigned char p1b[]     = {
	Q,      S1,     EI,     N,    EX,      SIL
};

unsigned char p2[]     = {
	TS,     V,      S1,     EI,   SIL
};

unsigned char p3[]     = {
	D,      R,     S1,     EI,   SIL
};

unsigned char p4[]     = {
	F,      S1,     IH,     R,    SIL
};

unsigned char p5[]     = {
	F,      S1,     UE,     N,    F,      SIL
};

unsigned char p6[]     = {
	Z,      S1,     E,      K,   S,      SIL
};

unsigned char p7[]     = {
	Z,      S1,     IH,     B,    EX,     N,        SIL
};

unsigned char p8[]     = {
	Q,      S1,     A,      KH,   T,      SIL 
};

unsigned char p9[]     = {
	N,      S1,     EU,     N,    SIL
};

unsigned char *punits[] = {
	p0,    p1,    p2,    p3,   p4,
	p5,    p6,    p7,    p8,   p9
};

unsigned char phundred[] = {
	H,      U,      N,      D,    	EX,     R,	T,	SIL
};

unsigned char pthousand[] = {
	T,      S1,    AU,     Z,      EX,   	N,      T,	SIL
};

unsigned char pmillion[] = {
	M,	I,	L,      J,      S2,     OH,	N,	SIL
};
unsigned char pmillions[] = {
	M,	I,	L,      J,      S2,     OH,	N,	EX,	N,	SIL
};

unsigned char pbillion[] = {
	M,	I,	L,      J,      S2,     AH,	R,	D,	EX, SIL
};
unsigned char pbillions[] = {
	M,	I,	L,      J,      S2,     AH,	R,	D,	EX, N,	SIL
};

unsigned char ptrillion[] = {
	B,	I,	L,      J,      S2,     OH,	N,	SIL
};
unsigned char ptrillions[] = {
	B,	I,	L,      J,      S2,     OH,	N,	EX,	N,	SIL
};

unsigned char pquadrillion[] = {
	B,	I,	L,      J,      S2,     AH,	R,	D,	EX, SIL
};
unsigned char pquadrillions[] = {
	B,	I,	L,      J,      S2,     AH,	R,	D,	EX, N,	SIL
};


unsigned char p10[]    = {
	TS,     S1,     EH,     N,    SIL
};
    

unsigned char p11[]    = {
	Q,     S1,     E,      L,    F,      SIL
};

unsigned char p12[]    = {
	TS,    V,      S1,     OE,   L,      F,        SIL
};

unsigned char p13[]    = {
	D,     R,      S1,     EI,   MBOUND, TS,       EH,     N,
	SIL
};

unsigned char p14[]    = {
	F,     S1,     I,      R,    MBOUND, TS,       EH,     N,
	SIL
};

unsigned char p15[]    = {
	F,     S1,     UE,     N,    F,      MBOUND,   TS,     EH,
	N,       SIL
};

unsigned char p16[]    = {
	Z,     S1,     E,      CH,   MBOUND, TS,       EH,     N,
	SIL
};

unsigned char p17[]    = {
	Z,     S1,     IH,     P,    MBOUND, TS,       EH,     N,   
	SIL
};

unsigned char p18[]    = {
	Q,     S1,     A,      KH,   MBOUND, TS,       EH,      N,
	SIL
};

unsigned char p19[]    = {
	N,     S1,     EU,     N,    MBOUND, TS,       EH,      N,
	SIL
};

unsigned char *pteens[] = {
	p10,   p11,   p12,   p13,   p14,
	p15,   p16,   p17,   p18,   p19
};

unsigned char pnone[]  = {
	SIL
};

unsigned char p20[]    = {
	TS,	V,     S1,      A,      N,   MBOUND, TS,       I,       CH,
	SIL
};

unsigned char p30[]    = {
	D,     RR,      S1,     EI,  MBOUND, S,        I,       CH,
	SIL
};

unsigned char p40[]    = {
	F,     S1,      I,      R,   MBOUND, TS,       I,       CH,
	SIL
};

unsigned char p50[]    = {
	F,     S1,      UE,     N,   F,      MBOUND,   TS,      I,
	CH,       SIL
};

unsigned char p60[]    = {
	Z,     S1,      E,      CH,  MBOUND, TS,       I,       CH,
	SIL
};

unsigned char p70[]    = {
	Z,     S1,      I,      P,   MBOUND, TS,       I,       CH,
	SIL
};

unsigned char p80[]    = {
	Q,     S1,      A,      KH,  MBOUND, TS,       I,       CH,
	SIL
};

unsigned char p90[]    = {
	N,     S1,      EU,     N,   MBOUND, TS,       I,       CH,
	SIL
};

unsigned char *ptens[] = {
	pnone, pnone, p20,   p30,   p40,
	p50,   p60,   p70,   p80,   p90
};

unsigned char ppence[] = {
	P,      S1,     E,      N,      TS,     SIL
};      

unsigned char ppercent[] = {
	P,      RR,     O,      MBOUND, TS,     S1,      E,
	N,      T,      SIL
};
	
unsigned char pcent[] = {
	TS,     S1,     E,      N,      T,      SIL
};

unsigned char ppound[] = {
	PF,     S1,     U,      N,      T,      SIL
};

unsigned char pdollar[] = {
	D,      S1,     O,      L,      A,      R,       SIL
};

unsigned char pand[] = {
	U,       N,      T,		SIL
};

unsigned char ppoint[] = {
	P,       S1,     U,      NG,     K,      T,       SIL
};                                                           
unsigned char pcomma[] = {
        K,       S1,     O,      M,     AH,       SIL
};                                                           

/* no translation */
unsigned char ptt2tp[] = {
	SIL
};

unsigned char pjan[] = {
	J,      S1,     A,      N,      U,      AH,      R,
	SIL
};

unsigned char pfeb[] = {
	F,      S1,     EH,     B,      RR,     U,       AH,     R,
	SIL
};

unsigned char pmar[] = {
	M,      AE,     R,      TS,      SIL
};

unsigned char papr[] = {
	Q,      A,      P,      RR,      S1,    I,       L,      SIL
};

unsigned char pmay[] = {
	M,	EI,	SIL
};

unsigned char pjun[] = {
	J,     S1,     UH,      N,      IH,      SIL
};

unsigned char pjul[] = {
	J,     S1,     UH,      L,      IH,      SIL
};

unsigned char paug[] = {
	Q,     AU,     G,       S1,     U,       S,      T,
	SIL
};

 
unsigned char psep[] = {
	Z,     E,      P,       T,      S1,      E,      M,
	B,      EX,    R,      SIL
};

 
unsigned char poct[] = {
	O,     K,      T,       S1,     OH,      B,      EX,
	R,      SIL
};

 
unsigned char pnov[] = {
	N,     O,      V,       S1,     E,       M,      B,      EX,
	R,          SIL
};

 
unsigned char pdec[] = {
	D,     E,      TS,      S1,     E,       M,      B,      EX,
	R,      SIL
};

 
unsigned char *pmonths[] = {
	pjan, pfeb,  pmar,  papr,  pmay,  pjun,
	pjul, paug,  psep,  poct,  pnov,  pdec
};                                        
 
unsigned char p0th[] = {
	SIL
/* no translation */
};

 
unsigned char p1st[] = {
	Q, S1, EH, R, S, T, EX, R, SIL
};

unsigned char p2nd[] = {
	S1,	TS,	V,	EI,	T,	EX, R,
	SIL
};

 
unsigned char p3rd[] = {
	S1,	D,	RR,	I,	T,	EX, R,
	SIL
};

 
unsigned char p4th[] = {
	S1,	F,	IH,	R,	T,	EX, R,
	SIL
};

 
unsigned char p5th[] = {
	S1,	F,	UE,	N,	F,	T,	EX,  R,
	SIL
};

 
unsigned char p6th[] = {
	Z,	S1,	E,	K,	S,	T,	EX, R,
	SIL
};

 
unsigned char p7th[] = {
	Z,	S1,	IH,	P,	T,	EX, R,
	SIL
};

 
unsigned char p8th[] = {
	Q,	S1,	A,	KH,	T,	EX, R,
	SIL
};

 
unsigned char p9th[] = {
	N,	S1,	EU,	N,	T,	EX, R,
	SIL
};

 
unsigned char *pordin[] = {
	p0th,  p1st,  p2nd,  p3rd,  p4th,
	p5th,  p6th,  p7th,  p8th,  p9th
};

 
unsigned char phalf[] = {
	H,     A,     L,     B,      SIL
};

 
unsigned char phalves[] = {
	H,     S1,     AE,     V,      Z,      SIL
};


unsigned char phour[] = {
	UH, R, SIL
};


unsigned char pminute[] = {
	M,     IH,     N,     S1,      UH,      T,	EX,	SIL
};

unsigned char pminutes[] = {
	M,     IH,     N,     S1,      UH,      T,	EX,	N,	SIL
};


unsigned char psecond[] = {
	Z,      EH,     K,      S1,     U,     N,      D,
	EX,     SIL
};

unsigned char pseconds[] = {
	Z,      EH,     K,      S1,     U,     N,      D,
	EX,     N,      SIL
};

unsigned char pstex[] = {
	S,	T,	EX,  SIL
};

unsigned char ptex[] = {
	T,	EX,  SIL
};

unsigned char pstexr[] = {
	S,	T,	EX,  R,  SIL
};

unsigned char ptexr[] = {
	T,	EX,  R,	 SIL
};

/*
 * This table, indexed by the grapheme
 * codes, returns the basic set of features.
 * The "[+GEM]" feature, and the setting of the
 * "[+VOC]" and "[+CONS]" on the letter "Y" are
 * special, and get done by "addgraph" with
 * some special code.
 */

U16 feats[]	= {
	0,								/* End mark			*/
	FSEG+FVOC+FSYL,					/* A				*/
	FSEG+FCONS+FVOICE,				/* B				*/
	FSEG+FCONS+FC,					/* C				*/
	FSEG+FCONS+FVOICE+FCOR,			/* D				*/
	FSEG+FVOC+FSYL,					/* E				*/
	FSEG+FCONS,						/* F				*/
	FSEG+FCONS+FVOICE+FVELAR,		/* G				*/
	FSEG+FCONS,						/* H				*/
	FSEG+FVOC+FHIGH+FSYL,			/* I				*/
	FSEG+FCONS+FVOICE+FSIB+FCOR,	/* J				*/
	FSEG+FCONS+FVELAR,				/* K				*/
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
	FSEG+FCONS+FVOICE+FVELAR,		/* GU				*/
	FSEG+FCONS,						/* QU				*/
	0,								/* '				*/
	0								/* +				*/
};
/*
 * Feature table for German
 * Index by phoneme.
 */

U16 pfeat[] = {

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

unsigned char whdic[] = {
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
  
unsigned char	preftab[] = {
	3,		E,	M,	P,		/* emp-            [E][m][p] */
	3,		E,	N,	T,		/* ent-            [E][n][t] */
	3,		F,	E,	RR,		/* ver-            [f][E][r] */	
	3,		F,	E,	R,		/* ver-            [f][E][R] */	
	3,		TS,	E,	RR,		/* zer-            [C/][E][r] */
	3,		TS,	E,	R,		/* zer-            [C/][E][R] */
	2,		B,	EX,			/* be-             [b][@] */
	2,		E,	RR,			/* er-             [E][r] */
	2,		E,	R,			/* er-             [E][R] */
	2,		G,	EX,			/* ge-             [g][@] */
	0
};

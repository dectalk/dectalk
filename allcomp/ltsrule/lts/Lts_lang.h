/***********************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1995, 1996
**
**    All Rights Reserved.  Unpublished rights  reserved  under
**    the copyright laws of the United States.
**
**    The software contained on this media  is  proprietary  to
**    and  embodies  the  confidential  technology  of  Digital
**    Equipment Corporation.  Possession, use,  duplication  or
**    dissemination of the software and media is authorized only
**    pursuant to a valid written license from Digital Equipment
**    Corporation.
**
** NAME OF FILE
**    lts_lang.h
**
** DESCRIPTION
**
**    The module inlcude all pname[] and gname[] definition
**    for all the different local language
**
**    epname[], and egname[] are for English
**    gpname[], and ggname[] are for German
**    fpname[], and fgname[] are for French
**    spname[], and sgname[] are for Spanish
**
**
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         6/26/95         initial code.
**  G. Lin         9/29/97         add uk_epname[] for UK_englosh support.
**  G. Lin         6/29/98         add DOUBLCONS support for German
**
**
*/

#define GNAME_SIZE	50
#define PNAME_SIZE	200
/*
 * Grapheme name table for English
 * Indexed by grapheme code. Contains
 * the one character name of the
 * grapheme.
 */

char	egname[]	= {
	'?',				/* End mark			*/
	'A',				/* Plain letters		*/
	'B',
	'C',
	'D',
	'E',
	'F',
	'G',
	'H',
	'I',
	'J',
	'K',
	'L',
	'M',
	'N',
	'O',
	'P',
	'Q',
	'R',
	'S',
	'T',
	'U',
	'V',
	'W',
	'X',
	'Y',
	'Z',
	'g',				/* GU				*/
	'q',				/* QU				*/
	'\'',				/* '				*/
	'+',				/* +				*/
	'<',				/* Range			*/
	'{',				/* Disjunction			*/
	'[',				/* Feature			*/
	'#'				/* Word boundry			*/
};
/*
 * Phoneme name table for English
 * Indexed by phoneme code. Contains
 * the one character name for the phoneme.
 */
char	epname[]	= {
	' ',				/* SIL				*/
	'i',				/* IY				*/
	'I',				/* IH				*/
	'e',				/* EY				*/
	'E',				/* EH				*/
	'@',				/* AE				*/
	'a',				/* AA				*/
	'A',				/* AY				*/
	'W',				/* AW				*/
	'^',				/* AH				*/
	'c',				/* AO				*/
	'o',				/* OW				*/
	'O',				/* OY				*/
	'U',				/* UH				*/
	'u',				/* UW				*/
	'R',				/* RR				*/
	'Y',				/* YU				*/
	'x',				/* AX				*/
	'|',				/* IX				*/
	'?',				/* IR	(No translation)	*/
	'?',				/* ER	(No translation)	*/
	'?',				/* AR	(No translation)	*/
	'?',				/* OR	(No translation)	*/
	'?',				/* UR	(No translation)	*/
	'w',				/* W				*/
	'y',				/* Y				*/
	'r',				/* R				*/
	'l',				/* LL				*/
	'h',				/* HX				*/
	'?',				/* RX	(No translation)	*/
	'?',				/* LX	(No translation)	*/
	'm',				/* M				*/
	'n',				/* N				*/
	'G',				/* NX				*/
	'L',				/* EL				*/
	'?',				/* D_DENTALIZED			*/
	'N',				/* EN				*/
	'f',				/* F				*/
	'v',				/* V				*/
	'T',				/* TH				*/
	'D',				/* DH				*/
	's',				/* S				*/
	'z',				/* Z				*/
	'S',				/* SH				*/
	'Z',				/* ZH				*/
	'p',				/* P				*/
	'b',				/* B				*/
	't',				/* T				*/
	'd',				/* D				*/
	'k',				/* K				*/
	'g',				/* G				*/
	'&',				/* DX				*/
	'Q',				/* TX				*/
	'q',				/* Q				*/
	'C',				/* CH				*/
	'J',				/* JH				*/
	'F',				/* DF */

	'?',				/* place holder 57 */
	'?',				/* place holder 58 */
	'?',				/* place holder 59 */
	'?',				/* place holder 60 */
	'?',				/* place holder 61 */
	'?',				/* place holder 62 */
	'?',				/* place holder 63 */
	'?',				/* place holder 64 */
	'?',				/* place holder 65 */
	'?',				/* place holder 66 */
	'?',				/* place holder 67 */
	'?',				/* place holder 68 */
	'?',				/* place holder 69 */
	'?',				/* place holder 70 */
	'?',				/* place holder 71 */
	'?',				/* place holder 72 */
	'?',				/* place holder 73 */
	'?',				/* place holder 74 */
	'?',				/* place holder 75 */
	'?',				/* place holder 76 */
	'?',				/* place holder 77 */
	'?',				/* place holder 78 */
	'?',				/* place holder 79 */
	'?',				/* place holder 80 */
	'?',				/* place holder 81 */
	'?',				/* place holder 82 */
	'?',				/* place holder 83 */
	'?',				/* place holder 84 */
	'?',				/* place holder 85 */
	'?',				/* place holder 86 */
	'?',				/* place holder 87 */
	'?',				/* place holder 88 */
	'?',				/* place holder 89 */
	'?',				/* place holder 90 */
	'?',				/* place holder 91 */
	'?',				/* place holder 92 */
	'?',				/* place holder 93 */
	'?',				/* place holder 94 */
	'?',				/* place holder 95 */
	'?',				/* place holder 96 */
	'?',				/* place holder 97 */
	'?',				/* place holder 98 */
	'?',				/* place holder 99 */
	'~',				/* BLOCK_RULES			*/
	'?',				/* S3				*/
	'`',				/* S2				*/
	'\'',				/* S1				*/
	'?',				/* SEMPH			*/
	'?',				/* HAT_RISE			*/
	'?',				/* HAT_FALL			*/
	'?',				/* HAT_RF			*/
	'-',				/* DASH		(SBOUND)	*/
	'*',				/* STAR		(MBOUND)	*/
	'#',				/* HASH		(HYPHEN)	*/
        '?',                            /* WBOUND                       */
	'?',				/* PPSTART			*/
	'?',				/* VPSTART			*/
	'?',				/* RELSTART			*/
	'=',				/* EQUAL	(COMMA)		*/
	'+',				/* PLUS		(PERIOD)	*/
	'?',				/* QUEST			*/
	'?',				/* EXCLAM			*/
	'?',				/* NEW_PARAGRAPH		*/
	'?',				/*						*/
	'&',				/* LINKRWORD		*/
	'>',				/* DOUBLCONS */
	' '				/* END here			*/
};
/*
 * Phoneme name table for UK English
 * Indexed by phoneme code. Contains
 * the one character name for the phoneme.
 */
char    uk_epname[]        = {
	' ',				/* SIL				*/
	'i',				/* IY				*/
	'I',				/* IH				*/
	'e',				/* EY				*/
	'E',				/* EH				*/
	'@',				/* AE				*/
	'a',				/* AA				*/
	'A',				/* AY				*/
	'W',				/* AW				*/
	'^',				/* AH				*/
	'c',				/* AO				*/
	'o',				/* OW				*/
	'O',				/* OY				*/
	'U',				/* UH				*/
	'u',				/* UW				*/
	'R',				/* RR				*/
	'Y',				/* YU				*/
	'x',				/* AX				*/
	'|',				/* IX				*/
    'F',                /* IR           */
    'j',                /* UR           */
    'K',                /* ER           */
    'M',                /* OR           */
    'P',                /* AR           */
	'w',				/* W				*/
	'y',				/* Y				*/
	'r',				/* R				*/
	'l',				/* LL				*/
	'h',				/* HX				*/
    'B',                /* OH           */
    'X',                /* LX           */
	'm',				/* M				*/
	'n',				/* N				*/
	'G',				/* NX				*/
	'L',				/* EL				*/
    'H',                /* D_DENTALIZED                 */
	'N',				/* EN				*/
	'f',				/* F				*/
	'v',				/* V				*/
	'T',				/* TH				*/
	'D',				/* DH				*/
	's',				/* S				*/
	'z',				/* Z				*/
	'S',				/* SH				*/
	'Z',				/* ZH				*/
	'p',				/* P				*/
	'b',				/* B				*/
	't',				/* T				*/
	'd',				/* D				*/
	'k',				/* K				*/
	'g',				/* G				*/
    'V',                /* YR                           */
	'Q',				/* TX				*/
	'q',				/* Q				*/
	'C',				/* CH				*/
	'J',				/* JH				*/
    '?',                /* DF */

	'?',				/* place holder 57 */
	'?',				/* place holder 58 */
	'?',				/* place holder 59 */
	'?',				/* place holder 60 */
	'?',				/* place holder 61 */
	'?',				/* place holder 62 */
	'?',				/* place holder 63 */
	'?',				/* place holder 64 */
	'?',				/* place holder 65 */
	'?',				/* place holder 66 */
	'?',				/* place holder 67 */
	'?',				/* place holder 68 */
	'?',				/* place holder 69 */
	'?',				/* place holder 70 */
	'?',				/* place holder 71 */
	'?',				/* place holder 72 */
	'?',				/* place holder 73 */
	'?',				/* place holder 74 */
	'?',				/* place holder 75 */
	'?',				/* place holder 76 */
	'?',				/* place holder 77 */
	'?',				/* place holder 78 */
	'?',				/* place holder 79 */
	'?',				/* place holder 80 */
	'?',				/* place holder 81 */
	'?',				/* place holder 82 */
	'?',				/* place holder 83 */
	'?',				/* place holder 84 */
	'?',				/* place holder 85 */
	'?',				/* place holder 86 */
	'?',				/* place holder 87 */
	'?',				/* place holder 88 */
	'?',				/* place holder 89 */
	'?',				/* place holder 90 */
	'?',				/* place holder 91 */
	'?',				/* place holder 92 */
	'?',				/* place holder 93 */
	'?',				/* place holder 94 */
	'?',				/* place holder 95 */
	'?',				/* place holder 96 */
	'?',				/* place holder 97 */
	'?',				/* place holder 98 */
	'?',				/* place holder 99 */
	'~',				/* BLOCK_RULES			*/
	'?',				/* S3				*/
	'`',				/* S2				*/
	'\'',				/* S1				*/
	'?',				/* SEMPH			*/
	'?',				/* HAT_RISE			*/
	'?',				/* HAT_FALL			*/
	'?',				/* HAT_RF			*/
	'-',				/* DASH		(SBOUND)	*/
	'*',				/* STAR		(MBOUND)	*/
	'#',				/* HASH		(HYPHEN)	*/
        '?',                            /* WBOUND                       */
	'?',				/* PPSTART			*/
	'?',				/* VPSTART			*/
	'?',				/* RELSTART			*/
	'=',				/* EQUAL	(COMMA)		*/
	'+',				/* PLUS		(PERIOD)	*/
	'?',				/* QUEST			*/
	'?',				/* EXCLAM			*/
	'?',				/* NEW_PARAGRAPH		*/
	'?',				/*						*/
	'&',				/* LINKRWORD		*/
	'>',				/* DOUBLCONS */
	' '				/* END here			*/
};
/*
 * Grapheme name table for German
 * Indexed by grapheme code. Contains
 * the one character name of the
 * grapheme.
 */

char	ggname[]	= {
	'?',				/* End mark			*/
	'A',				/* Plain letters		*/
	'B',
	'C',
	'D',
	'E',
	'F',
	'G',
	'H',
	'I',
	'J',
	'K',
	'L',
	'M',
	'N',
	'O',
	'P',
	'Q',
	'R',
	'S',
	'T',
	'U',
	'V',
	'W',
	'X',
	'Y',
	'Z',
	'Ä',				/* Plain letters		*/
	'Ö',
	'ß',
	'Ü',
	'g',				/* reserved for future		*/
	'q',				/* reserved for future		*/
	'\'',				/* '				*/
	'+',				/* +				*/
	'<',				/* Range			*/
	'{',				/* Disjunction			*/
	'[',				/* Feature			*/
	'#'				/* Word boundry			*/
};
/*
 * Phoneme name table for German
 * Indexed by phoneme code. Contains
 * the one character name for the phoneme.
 */
char	gpname[]	= {
	' ',				/* SIL				*/
	'a',				/* A				*/
	'E',				/* E				*/
	'V',				/* AE				*/
	'@',				/* EX				*/
	'I',				/* I				*/
	'c',				/* O				*/
	'Q',				/* OE				*/
	'U',				/* U				*/
	'Y',				/* UE				*/
	'1',				/* AH				*/
	'2',				/* EH				*/
	'7',				/* AEH				*/
	'3',				/* IH				*/
	'4',				/* OH				*/
	'q',				/* OEH				*/
	'5',				/* UH				*/
	'6',				/* UEH				*/
	'A',				/* EI				*/
	'W',				/* AU				*/
	'H',				/* EU				*/
	'8',				/* AN				*/
	'^',				/* IM				*/
	'9',				/* UM				*/
	'%',				/* ON				*/
	'j',				/* J				*/
	'l',				/* L				*/
	'r',				/* RR				*/
	'R',				/* R				*/
	'h',				/* H				*/
	'm',				/* M				*/
	'n',				/* N				*/
	'G',				/* NG				*/
	'L',				/* EL				*/
	'M',				/* EM				*/
	'N',				/* EN				*/
	'f',				/* F				*/
	'v',				/* V				*/
	's',				/* S				*/
	'z',				/* Z				*/
	'S',				/* SH				*/
	'Z',				/* ZH				*/
	'x',				/* CH				*/
	'X',				/* KH				*/
	'p',				/* P				*/
	'b',				/* B				*/
	't',				/* T				*/
	'd',				/* D				*/
	'k',				/* K				*/
	'g',				/* G				*/
	'|',				/* Q				*/
	'P',				/* PF				*/
	'T',				/* TS				*/
	'J',				/* DJ				*/
	'C',				/* TJ				*/
	'?',				/* KSX				*/

	'i',				/* i1 */
	'e',				/* e1 */
	'o',				/* o1 */
	'u',				/* u1 */
	'y',				/* y1 */
	'B',				/* er */
	'?',				/* place holder 62 */
	'?',				/* place holder 63 */
	'?',				/* place holder 64 */
	'?',				/* place holder 65 */
	'?',				/* place holder 66 */
	'?',				/* place holder 67 */
	'?',				/* place holder 68 */
	'?',				/* place holder 69 */
	'?',				/* place holder 70 */
	'?',				/* place holder 71 */
	'?',				/* place holder 72 */
	'?',				/* place holder 73 */
	'?',				/* place holder 74 */
	'?',				/* place holder 75 */
	'?',				/* place holder 76 */
	'?',				/* place holder 77 */
	'?',				/* place holder 78 */
	'?',				/* place holder 79 */
	'?',				/* place holder 80 */
	'?',				/* place holder 81 */
	'?',				/* place holder 82 */
	'?',				/* place holder 83 */
	'?',				/* place holder 84 */
	'?',				/* place holder 85 */
	'?',				/* place holder 86 */
	'?',				/* place holder 87 */
	'?',				/* place holder 88 */
	'?',				/* place holder 89 */
	'?',				/* place holder 90 */
	'?',				/* place holder 91 */
	'?',				/* place holder 92 */
	'?',				/* place holder 93 */
	'?',				/* place holder 94 */
	'?',				/* place holder 95 */
	'?',				/* place holder 96 */
	'?',				/* place holder 97 */
	'?',				/* place holder 98 */
	'?',				/* place holder 99 */
	'~',				/* BLOCK_RULES			*/
	'?',				/* S3				*/
	'`',				/* S2				*/
	'\'',				/* S1				*/
	'?',				/* SEMPH			*/
	'?',				/* HAT_RISE			*/
	'?',				/* HAT_FALL			*/
	'?',				/* HAT_RF			*/
	'-',				/* DASH		(SBOUND)	*/
	'*',				/* STAR		(MBOUND)	*/
	'#',				/* HASH		(HYPHEN)	*/
	'?',				/* WBOUND			*/
	'?',				/* PPSTART			*/
	'?',				/* VPSTART			*/
	'?',				/* RELSTART			*/
	'=',				/* EQUAL	(COMMA)		*/
	'+',				/* PLUS		(PERIOD)	*/
	'?',				/* QUEST			*/
	'?',				/* EXCLAM			*/
	'?',				/* NEW_PARAGRAPH		*/
	'?',				/*						*/
	'&',				/* LINKRWORD		*/
	'>',				/* DOUBLCONS */
	' '				/* END here			*/
};
/*
 * Grapheme name table for French
 * Indexed by grapheme code. Contains
 * the one character name of the
 * grapheme.
 */

char	fgname[]	= {
	'?',				/* End mark			*/
	'A',				/* Plain letters		*/
	'B',
	'C',
	'D',
	'E',
	'F',
	'G',
	'H',
	'I',
	'J',
	'K',
	'L',
	'M',
	'N',
	'O',
	'P',
	'Q',
	'R',
	'S',
	'T',
	'U',
	'V',
	'W',
	'X',
	'Y',
	'Z',
	'g',				/* GU				*/
	'q',				/* QU				*/
	'\'',				/* '				*/
	'+',				/* +				*/
	'<',				/* Range			*/
	'{',				/* Disjunction			*/
	'[',				/* Feature			*/
	'#'				/* Word boundry			*/
};
/*
 * Phoneme name table for French
 * Indexed by phoneme code. Contains
 * the one character name for the phoneme.
 */
char	fpname[]	= {
	' ',				/* SIL				*/
	'i',				/* IY				*/
	'I',				/* IH				*/
	'e',				/* EY				*/
	'E',				/* EH				*/
	'@',				/* AE				*/
	'a',				/* AA				*/
	'A',				/* AY				*/
	'W',				/* AW				*/
	'^',				/* AH				*/
	'c',				/* AO				*/
	'o',				/* OW				*/
	'O',				/* OY				*/
	'U',				/* UH				*/
	'u',				/* UW				*/
	'R',				/* RR				*/
	'Y',				/* YU				*/
	'x',				/* AX				*/
	'|',				/* IX				*/
	'?',				/* IR	(No translation)	*/
	'?',				/* ER	(No translation)	*/
	'?',				/* AR	(No translation)	*/
	'?',				/* OR	(No translation)	*/
	'?',				/* UR	(No translation)	*/
	'w',				/* W				*/
	'y',				/* Y				*/
	'r',				/* R				*/
	'l',				/* LL				*/
	'h',				/* HX				*/
	'?',				/* RX	(No translation)	*/
	'?',				/* LX	(No translation)	*/
	'm',				/* M				*/
	'n',				/* N				*/
	'G',				/* NX				*/
	'L',				/* EL				*/
	'?',				/* D_DENTALIZED			*/
	'N',				/* EN				*/
	'f',				/* F				*/
	'v',				/* V				*/
	'T',				/* TH				*/
	'D',				/* DH				*/
	's',				/* S				*/
	'z',				/* Z				*/
	'S',				/* SH				*/
	'Z',				/* ZH				*/
	'p',				/* P				*/
	'b',				/* B				*/
	't',				/* T				*/
	'd',				/* D				*/
	'k',				/* K				*/
	'g',				/* G				*/
	'&',				/* DX				*/
	'Q',				/* TX				*/
	'q',				/* Q				*/
	'C',				/* CH				*/
	'J',				/* JH				*/

	'?',				/* place holder 56 */
	'?',				/* place holder 57 */
	'?',				/* place holder 58 */
	'?',				/* place holder 59 */
	'?',				/* place holder 60 */
	'?',				/* place holder 61 */
	'?',				/* place holder 62 */
	'?',				/* place holder 63 */
	'?',				/* place holder 64 */
	'?',				/* place holder 65 */
	'?',				/* place holder 66 */
	'?',				/* place holder 67 */
	'?',				/* place holder 68 */
	'?',				/* place holder 69 */
	'?',				/* place holder 70 */
	'?',				/* place holder 71 */
	'?',				/* place holder 72 */
	'?',				/* place holder 73 */
	'?',				/* place holder 74 */
	'?',				/* place holder 75 */
	'?',				/* place holder 76 */
	'?',				/* place holder 77 */
	'?',				/* place holder 78 */
	'?',				/* place holder 79 */
	'?',				/* place holder 80 */
	'?',				/* place holder 81 */
	'?',				/* place holder 82 */
	'?',				/* place holder 83 */
	'?',				/* place holder 84 */
	'?',				/* place holder 85 */
	'?',				/* place holder 86 */
	'?',				/* place holder 87 */
	'?',				/* place holder 88 */
	'?',				/* place holder 89 */
	'?',				/* place holder 90 */
	'?',				/* place holder 91 */
	'?',				/* place holder 92 */
	'?',				/* place holder 93 */
	'?',				/* place holder 94 */
	'?',				/* place holder 95 */
	'?',				/* place holder 96 */
	'?',				/* place holder 97 */
	'?',				/* place holder 98 */
	'?',				/* place holder 99 */
	'~',				/* BLOCK_RULES			*/
	'?',				/* S3				*/
	'`',				/* S2				*/
	'\'',				/* S1				*/
	'?',				/* SEMPH			*/
	'?',				/* HAT_RISE			*/
	'?',				/* HAT_FALL			*/
	'?',				/* HAT_RF			*/
	'-',				/* DASH		(SBOUND)	*/
	'*',				/* STAR		(MBOUND)	*/
	'#',				/* HASH		(HYPHEN)	*/
	'?',				/* WBOUND			*/
	'?',				/* PPSTART			*/
	'?',				/* VPSTART			*/
	'?',				/* RELSTART			*/
	'=',				/* EQUAL	(COMMA)		*/
	'+',				/* PLUS		(PERIOD)	*/
	'?',				/* QUEST			*/
	'?',				/* EXCLAM			*/
	'?',				/* NEW_PARAGRAPH		*/
	'?',				/*						*/
	'&',				/* LINKRWORD		*/
	'>',				/* DOUBLCONS */
	' '				/* END here			*/
};
/*
 * Grapheme name table for Spanish
 * Indexed by grapheme code. Contains
 * the one character name of the
 * grapheme.
 */

char	sgname[]	= {
	'?',				/* End mark			*/
	'A',				/* Plain letters		*/
	'B',
	'C',
	'D',
	'E',
	'F',
	'G',
	'H',
	'I',
	'J',
	'K',
	'L',
	'M',
	'N',
	'O',
	'P',
	'Q',
	'R',
	'S',
	'T',
	'U',
	'V',
	'W',
	'X',
	'Y',
	'Z',
	'g',				/* GU				*/
	'q',				/* QU				*/
	'\'',				/* '				*/
	'+',				/* +				*/
	'<',				/* Range			*/
	'{',				/* Disjunction			*/
	'[',				/* Feature			*/
	'#'				/* Word boundry			*/
};
/*
 * Phoneme name table for Spanish
 * Indexed by phoneme code. Contains
 * the one character name for the phoneme.
 */
char	spname[]	= {
	'_',				/* SIL				*/
	'a',				/* E_A				*/
	'e',				/* E_E				*/
	'i',				/* E_I				*/
	'o',				/* E_O				*/
	'u',				/* E_U				*/
	'W',				/* E_WX				*/
	'Y',				/* E_YX				*/
	'R',				/* E_RR				*/
	'l',				/* E_L				*/
	'L',				/* E_LL				*/
	'm',				/* E_M				*/
	'n',				/* E_N				*/
	'1',				/* E_NH				*/
	'f',				/* E_F				*/
	's',				/* E_S				*/
	'j',				/* E_J				*/
	'T',				/* E_TH				*/
	'B',				/* E_BH				*/
	'D',				/* E_DH				*/
	'G',				/* E_GH				*/
	'2',				/* E_YH				*/
	'p',				/* E_P				*/
	'b',				/* E_B				*/
	't',				/* E_T				*/
	'd',				/* E_D				*/
	'k',				/* E_K				*/
	'g',				/* E_G				*/
	'C',				/* E_CH				*/
	'y',				/* E_Y				*/
	'r',				/* E_R				*/
	'q',				/* E_Q				*/
	'z',				/* E_Z				*/
	'w',				/* E_W				*/
	'N',				/* E_NX				*/
	'V',				/* E_V				*/
	'I',				/* E_IX				*/
	'M',				/* E_MX				*/
	'P',				/* E_PH				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/
	'?',				/* 				*/

	'?',				/* place holder 56 */
	'?',				/* place holder 57 */
	'?',				/* place holder 58 */
	'?',				/* place holder 59 */
	'?',				/* place holder 60 */
	'?',				/* place holder 61 */
	'?',				/* place holder 62 */
	'?',				/* place holder 63 */
	'?',				/* place holder 64 */
	'?',				/* place holder 65 */
	'?',				/* place holder 66 */
	'?',				/* place holder 67 */
	'?',				/* place holder 68 */
	'?',				/* place holder 69 */
	'?',				/* place holder 70 */
	'?',				/* place holder 71 */
	'?',				/* place holder 72 */
	'?',				/* place holder 73 */
	'?',				/* place holder 74 */
	'?',				/* place holder 75 */
	'?',				/* place holder 76 */
	'?',				/* place holder 77 */
	'?',				/* place holder 78 */
	'?',				/* place holder 79 */
	'?',				/* place holder 80 */
	'?',				/* place holder 81 */
	'?',				/* place holder 82 */
	'?',				/* place holder 83 */
	'?',				/* place holder 84 */
	'?',				/* place holder 85 */
	'?',				/* place holder 86 */
	'?',				/* place holder 87 */
	'?',				/* place holder 88 */
	'?',				/* place holder 89 */
	'?',				/* place holder 90 */
	'?',				/* place holder 91 */
	'?',				/* place holder 92 */
	'?',				/* place holder 93 */
	'?',				/* place holder 94 */
	'?',				/* place holder 95 */
	'?',				/* place holder 96 */
	'?',				/* place holder 97 */
	'?',				/* place holder 98 */
	'?',				/* place holder 99 */
	'~',				/* BLOCK_RULES			*/
	'?',				/* S3				*/
	'`',				/* S2				*/
	'\'',				/* S1				*/
	'?',				/* SEMPH			*/
	'?',				/* HAT_RISE			*/
	'?',				/* HAT_FALL			*/
	'?',				/* HAT_RF			*/
	'-',				/* DASH		(SBOUND)	*/
	'*',				/* STAR		(MBOUND)	*/
	'#',				/* HASH		(HYPHEN)	*/
	'?',				/* WBOUND			*/
	'?',				/* PPSTART			*/
	'?',				/* VPSTART			*/
	'?',				/* RELSTART			*/
	'=',				/* EQUAL	(COMMA)		*/
	'+',				/* PLUS		(PERIOD)	*/
	'?',				/* QUEST			*/
	'?',				/* EXCLAM			*/
	'?',				/* NEW_PARAGRAPH		*/
	'?',				/*						*/
	'&',				/* LINKRWORD		*/
	'>',				/* DOUBLCONS */
	' '				/* END here			*/
};

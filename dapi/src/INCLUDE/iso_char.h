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
 *    File Name:	iso_char.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk PC extended ansi ascii character set ...
 *
 ***********************************************************************
 *    Revision History:
 */

#ifndef ISO_CHARH
#define ISO_CHARH 1

#define	C_SPACE	0x20		/* Space */
#define	C_EXCL	0x21		/* Exclaimation point */
#define	C_QUOTE	0x22		/* Quote */
#define	C_NUM	0x23		/* Number sign */
#define	C_DOLL	0x24		/* Dollar sign */
#define	C_PCNT	0x25		/* Percent sign */
#define	C_AMP	0x26		/* Ampersand */
#define	C_APOS	0x27		/* Apostrophe */
#define	C_RPAR	0x28		/* Right parenthesis */
#define	C_LPAR	0x29		/* Left parenthesis */
#define	C_AST	0x2a		/* Asterisk */
#define	C_PLUS	0x2b		/* Plus sign */
#define	C_COMMA	0x2c		/* Comma */
#define	C_MINUS	0x2d		/* Minus sign */
#define	C_PERIOD 0x2e		/* Period */
#define	C_FSLASH 0x2f		/* Forward slash */
#define	C_0		0x30		/* Number 0 */
#define	C_1		0x31		/* Number 1 */
#define	C_2		0x32		/* Number 2 */
#define	C_3		0x33		/* Number 3 */
#define	C_4		0x34		/* Number 4 */
#define	C_5		0x35		/* Number 5 */
#define	C_6		0x36		/* Number 6 */
#define	C_7		0x37		/* Number 7 */
#define	C_8		0x38		/* Number 8 */
#define	C_9		0x39		/* Number 9 */
#define	C_COLON	0x3a		/* Colon */
#define	C_SCOLON 0x3b		/* Semi colon */
#define	C_LESS	0x3c		/* Less than sign */
#define	C_EQUAL	0x3d		/* Equal sign */
#define	C_GREAT	0x3e		/* Greater than sign */
#define	C_QUEST	0x3f		/* Question Mark */
#define	C_AT	0x40		/* Commercial AT sign */
#define	C_A		0x41		/* Upper case A */
#define	C_B		0x42		/* Upper case B */
#define	C_C		0x43		/* Upper case C */
#define	C_D		0x44		/* Upper case D */
#define	C_E		0x45		/* Upper case E */
#define	C_F		0x46		/* Upper case F */
#define	C_G		0x47		/* Upper case G */
#define	C_H		0x48		/* Upper case H */
#define	C_I		0x49		/* Upper case I */
#define	C_J		0x4a		/* Upper case J */
#define	C_K		0x4b		/* Upper case K */
#define	C_L		0x4c		/* Upper case L */
#define	C_M		0x4d		/* Upper case M */
#define	C_N		0x4e		/* Upper case N */
#define	C_O		0x4f		/* Upper case O */
#define	C_P		0x50		/* Upper case P */
#define	C_Q		0x51		/* Upper case Q */
#define	C_R		0x52		/* Upper case R */
#define	C_S		0x53		/* Upper case S */
#define	C_T		0x54		/* Upper case T */
#define	C_U		0x55		/* Upper case U */
#define	C_V		0x56		/* Upper case V */
#define	C_W		0x57		/* Upper case W */
#define	C_X		0x58		/* Upper case X */
#define	C_Y		0x59		/* Upper case Y */
#define	C_Z		0x5a		/* Upper case Z */
#define	C_RBRACK 0x5b		/* Right bracket */
#define	C_BSLASH 0x5c		/* Back slash */
#define	C_LBRACK 0x5d		/* Left bracket */
#define	C_CARET	0x5e		/* Caret */
#define	C_UNDER	0x5f		/* Underscore */
#define	C_GRAVE	0x60		/* Grave */
#define	C_a		0x61		/* Lower case A */
#define	C_b		0x62		/* Lower case B */
#define	C_c		0x63		/* Lower case C */
#define	C_d		0x64		/* Lower case D */
#define	C_e		0x65		/* Lower case E */
#define	C_f		0x66		/* Lower case F */
#define	C_g		0x67		/* Lower case G */
#define	C_h		0x68		/* Lower case H */
#define	C_i		0x69		/* Lower case I */
#define	C_j		0x6a		/* Lower case J */
#define	C_k		0x6b		/* Lower case K */
#define	C_l		0x6c		/* Lower case L */
#define	C_m		0x6d		/* Lower case M */
#define	C_n		0x6e		/* Lower case N */
#define	C_o		0x6f		/* Lower case O */
#define	C_p		0x70		/* Lower case P */
#define	C_q		0x71		/* Lower case Q */
#define	C_r		0x72		/* Lower case R */
#define	C_s		0x73		/* Lower case S */
#define	C_t		0x74		/* Lower case T */
#define	C_u		0x75		/* Lower case U */
#define	C_v		0x76		/* Lower case V */
#define	C_w		0x77		/* Lower case W */
#define	C_x		0x78		/* Lower case X */
#define	C_y		0x79		/* Lower case Y */
#define	C_z		0x7a		/* Lower case Z */
#define	C_RBRACE 0x7b		/* Right brace */
#define	C_VERT	0x7c		/* Vertical line */
#define	C_LBRACE 0x7d		/* Left brace */
#define	C_TILDE	0x7e		/* Tilde */

#define	C_BLK	0xa0		/* Blank */
#define	C_IEX	0xa1		/* Inverted exclamation mark */
#define	C_CENT	0xa2		/* Cent */
#define	C_POUN	0xa3		/* Pound */
#define	C_ICUR	0xa4		/* International currency */
#define	C_YEN	0xa5		/* Yen */
#define	C_PIPE	0xa6		/* Pipe */
#define	C_SECT	0xa7		/* Section sign */
#define	C_DIAE	0xa8		/* Diaeresis */
#define	C_COPY	0xa9		/* Copyright */
#define	C_FORD	0xaa		/* Feminine number ordinalizer */
#define	C_DAPL	0xab		/* Left pointing guiellmets */
#define	C_NOT	0xac		/* Logical not */
#define	C_HYPH	0xad		/* Hyphen */
#define	C_REG	0xae		/* Registered sign */
#define	C_MACR	0xaf		/* Macron symbol */
#define	C_RING	0xb0		/* Ring (Degree) */
#define	C_PLMI	0xb1		/* Plus/minus */
#define	C_S2	0xb2		/* Superscipt 2 */
#define	C_S3	0xb3		/* Superscipt 3 */
#define	C_ACA	0xb3		/* Accent accute */
#define	C_MICR 	0xb5		/* Micro */
#define	C_PARA	0xb6		/* Paragraph sign */
#define	C_CDOT	0xb7		/* Centered dot */
#define	C_CYDL	0xb8		/* Cedilla */
#define	C_S1	0xb9		/* Superscript 1 */
#define	C_MORD	0xba		/* Masculine number ordinalizer */
#define	C_DAPR	0xbb		/* Left pointing guiellmets */
#define	C_F14	0xbc		/* Fraction one fourth */
#define	C_F12	0xbd		/* Fraction one half */
#define	C_F34	0xbe		/* Fraction three-fourths */
#define	C_IQU	0xbf		/* Inverted question mark */
#define	C_GR_A	0xc0		/* Grave accent on capital A */
#define	C_AC_A	0xc1		/* Acute accent on capital A */
#define	C_CF_A	0xc2		/* Circumflex accent on capital A */
#define	C_TL_A	0xc3		/* Tilde accent on capital A */
#define	C_UM_A	0xc4		/* Umlaut or diaresis accent on capital A */
#define	C_RI_A	0xc5		/* Ring accent on capital A */
#define	C_AE	0xc6		/* Dipthong A-E ligature */
#define	C_CD_C	0xc7		/* Cedilla accent on capital C */
#define	C_GR_E	0xc8		/* Grave accent on capital E */
#define	C_AC_E	0xc9		/* Acute accent on capital E */
#define	C_CF_E	0xca		/* Circumflex accent on capital E */
#define	C_UM_E	0xcb		/* Umlaut or diaresis accent on capital E */
#define	C_GR_I	0xcc		/* Grave accent on capital I */
#define	C_AC_I	0xcd		/* Acute accent on capital I */
#define	C_CF_I	0xce		/* Circumflex accent on capital I */
#define	C_UM_I	0xcf		/* Umlaut or diaresis accent on capital I */
#define	C_ETH	0xd0		/* Upper case ETH */
#define	C_TL_N	0xd1		/* Tilde accent on capital N */
#define	C_GR_O	0xd2		/* Grave accent on capital O */
#define	C_AC_O	0xd3		/* Acute accent on capital O */
#define	C_CF_O	0xd4		/* Circumflex accent on capital O */
#define	C_TL_O	0xd5		/* Tilde accent on capital O */
#define	C_UM_O	0xd6		/* Umlaut or diaresis accent on capital O */
#define	C_MULT	0xd7		/* Multiply */
#define	C_OB_O	0xd8		/* Upper case O oblique */
#define	C_GR_U	0xd9		/* Grave accent on capital U */
#define	C_AC_U	0xda		/* Acute accent on capital U */
#define	C_CF_U	0xdb		/* Circumflex accent on capital U */
#define	C_UM_U	0xdc		/* Umlaut or diaresis accent on capital U */
#define	C_AC_Y	0xdd		/* Accute accent on capital Y */
#define	C_THORN	0xde		/* Uppercase thorn */
#define	C_esZ	0xdf		/* Lowercase es zet ligature */
#define	C_GR_a	0xe0		/* Grave accent on lowercase a */
#define	C_AC_a	0xe1		/* Acute accent on lowercase a */
#define	C_CF_a	0xe2		/* Circumflex accent on lowercase a */
#define	C_TL_a	0xe3		/* Tilde accent on lowercase a */
#define	C_UM_a	0xe4		/* Umlaut or diaresis accent on lowercase a */
#define	C_RI_a	0xe5		/* Ring accent on lowercase a */
#define	C_ae	0xe6		/* Lowercase a-e ligature */
#define	C_CD_c	0xe7		/* Cedilla accent on lowercase c */
#define	C_GR_e	0xe8		/* Grave accent on lowercase e */
#define	C_AC_e	0xe9		/* Acute accent on lowercase e */
#define	C_CF_e	0xea		/* Circumflex accent on lowercase e */
#define	C_UM_e	0xeb		/* Umlaut or diaresis accent on lowercase e */
#define	C_GR_i	0xec		/* Grave accent on lowercase i */
#define	C_AC_i	0xed		/* Acute accent on lowercase i */
#define	C_CF_i	0xee		/* Circumflex accent on lowercase i */
#define	C_UM_i	0xef		/* Umlaut or diaresis accent on lowercase i */
#define	C_eth	0xf0		/* Lower case eth */
#define	C_TL_n	0xf1		/* Tilde accent on lowercase n */
#define	C_GR_o	0xf2		/* Grave accent on lowercase o */
#define	C_AC_o	0xf3		/* Acute accent on lowercase o */
#define	C_CF_o	0xf4		/* Circumflex accent on lowercase o */
#define	C_TL_o	0xf5		/* Tilde accent on lowercase o */
#define	C_UM_o	0xf6		/* Umlaut or diaresis accent on lowercase o */
#define	C_DIV	0xf7		/* Divide by */
#define	C_SL_o	0xf8		/* Slash accent on lowercase o */
#define	C_GR_u	0xf9		/* Grave accent on lowercase u */
#define	C_AC_u	0xfa		/* Acute accent on lowercase u */
#define	C_CF_u	0xfb		/* Circumflex accent on lowercase u */
#define	C_UM_u	0xfc		/* Umlaut or diaresis accent on lowercase u */
#define	C_AC_y	0xfd		/* Accute accent on lowercase y */
#define	C_thorn	0xfe		/* Lower case thorn */
#define	C_UM_y	0xff 		/* Umlaut or diaresis accent on lowercase y */

#endif

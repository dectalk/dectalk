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
 *    File Name:	dict.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  suffix table entries ...
 *
 ***********************************************************************
 *    Revision History:
 * 22-FEB-1995 CJL, Added diffs from Ed B's spanish version.
 */

#ifndef DICTH
#define DICTH 1

//#pragma pack (1)
//struct	suff_rule	{
//	short				next;
//	long				fc;
//	unsigned char		rule[256];
//};

//#pragma pack ()

/*
 *  dtpc dictionary defines ...
 */

struct	dic_entry	{

	long	int			fc;
	unsigned char 		text[64];
};

/*
 *  form class bit defines ....
 */

#define FC_ADJ				0x00000001L
#define FC_ADV				0x00000002L
#define FC_ART				0x00000004L
#define FC_AUX				0x00000008L
#define FC_BE				0x00000010L
#define FC_BEV				0x00000020L
#define FC_CONJ				0x00000040L
#define FC_ED				0x00000080L
#define FC_HAVE				0x00000100L
#define FC_ING				0x00000200L
#define FC_NOUN				0x00000400L
#define FC_POS				0x00000800L
#define FC_PREP				0x00001000L
#define FC_PRON				0x00002000L
#define FC_SUBCONJ			0x00004000L
#define FC_THAT				0x00008000L
#define FC_TO				0x00010000L
#define FC_VERB				0x00020000L
#define FC_WHO				0x00040000L
#define FC_NEG				0x00080000L
#define FC_INTER			0x00100000L
#define FC_REF				0x00200000L
#define FC_PART				0x00400000L
#define FC_FUNC				0x00800000L
#define FC_CONT				0x01000000L
#define FC_CHARACTER		0x02000000L
#define FC_REFR  			0x04000000L
/* out FOR NOW NO ROOM EAB 6/94 #define FC_DET				0x04000000L*/
#define FC_FC_MARKER		0x20000000L
#define FC_CONTRACTION		0x40000000L
#define FC_HOMOGRAPH		0x80000000L

/*
 * Added from Ed B. spanish version 22-feb-1995 cjl
 */
#define FC_PRONS			0x00002000L
#define FC_PRONP			0x00004000L
#define FC_DET				0x04000000L

/*
 *  special encoding of the form class field ....
 */


#define FC_NEGATE			0x04000000L		/* add for negation on test */
#define FC_STRUCTURE		0x08000000L		/* word structure definition */

/*
 *  Word characteristic fields
 */

#define	MARK_null			0x0000			/* null marker for place holder */
#define	MARK_start			0x0001			/* start of a sentence */
#define	MARK_end			0x0002			/* end of a sentence */
#define	MARK_comma			0x0004			/* has a comma */
#define	MARK_first_upper	0x0008			/* first character upper */
#define	MARK_vowel			0x0010			/* has a vowel */
#define	MARK_upper			0x0020			/* has an upper */
#define	MARK_cons			0x0040			/* has a consonant*/
#define	MARK_digit			0x0080			/* has a digit */
#define	MARK_hyphen			0x0100			/* has a hyphen */
#define	MARK_ques_excl		0x0200			/* has a question or exclaim mark */
#define	MARK_non_alpha		0x0400			/* has a non-alpha numic*/
#define	MARK_slash			0x0800
#define	MARK_numeric		0x1000	
#define	MARK_period			0x2000
#define	MARK_dquote			0x4000
#define	MARK_squote			0x8000


#define		FC_ALWAYS		FC_STRUCTURE+0
#define		FC_START		FC_STRUCTURE+MARK_START
#define		FC_END			FC_STRUCTURE+MARK_END
#define		FC_COMMA		FC_STRUCTURE+MARK_COMMA

#define		FC_TARGET		0xffffffffL
#define		FC_CONSIDER		0x00ffffffL
#define		FC_KEEP			0xff000000L


/*
 * These defines are used to communicate
 * with the dictionary lookup code. The first four
 * tell the lookup routines if this is the first search
 * or one of the extra searches, and if an abbreviation
 * can be matched. The last three are returned by the
 * lookup routine to tell you what happened. Caveat!
 * These numbers are known by assembler code.
 */

#define	FIRST		0				/* First probe.			*/
#define	FABBREV	   	1				/* First probe, abbreviation.	*/
#define	SECOND	   	2				/* Additional probe.		*/
#define	SNOPARS	   	3				/* Additional probe, strip ")".	*/
#define	SINGLE_CHAR 4				/* Single character quick lookup */

#define	MISS	   	0				/* Miss.			*/
#define	HIT			1 				/* Hit.				*/
#define	ABBREV		2				/* Hit in abbreviation context.	*/

#endif

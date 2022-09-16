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
 *    File Name:	lsdefs.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  new lts defs files ... included with the master lsdef file but
 *  split out for the tools ...
 *
 ***********************************************************************
 *    Revision History:
 */

#ifndef LSDEFSH
#define LSDEFSH 1

#include "defs.h"
#include "dectalk.h"
#include "cmd.h"

#ifdef GERMAN
#include "ger_phon.h"
#else
#include "eng_phon.h"
#endif

#include "esc.h"
/*
 *  external segment defines ...
 */
#ifdef LOW_MEMORY
#define	NGWORD		40			/* # of graphemes in a word	*/
#define	NPNODE		40			/* # of phonemes in the pool	*/
#else
#define	NGWORD		128			/* # of graphemes in a word	*/
#define	NPNODE		128			/* # of phonemes in the pool	*/
#endif
#ifndef CALLER_ID
#define	NOMAP		0			/* No "lscrush" remapping	*/
#endif
#define	NSYL		10			/* # of sylables (maximum) for English	*/
#define	GNSYL		20			/* # of sylables (maximum) for German	*/
#define	FORW		0			/* Forward flag			*/
#define	BACK		1			/* Backward flag		*/
#define	TWOPH		0x80			/* Flag for [ab] phoneme.	*/
#define	MSKPH		0x7F			/* Extract mask			*/

#define	UNK_WH	0				/* "Wh" state is unknown.	*/
#define	IS_WH		1			/* A "wh" sentence.		*/
#define	NOT_WH	2				/* Not a "wh" sentence.		*/

#define	FAST		0			/* Spell mode = fast		*/
#define	SLOW		1			/* Spell mode = slow		*/
#define DASHNFAST 2				/* Spell mode = fast and say dash*/
/*
 * When an item is read from the letter to sound
 * input pipe, the data gets stored into an ITEM structure.
 * The "i_nword" is the number of words (between 1 and 4).
 * An empty structure has an "i_nword" of 0. The basic
 * code is in "i_word[0]". The "extra words" are stored
 * in the remaining words of the "i_word" array.
 */

typedef	struct ITEM_struct	{
	short	i_nword;		/* # of words (1-4).		*/
	short	i_word[4];		/* The words.			*/
}	ITEM;

/*
 * As a word is translated, it is kept in a
 * double linked list of PHONE structures. The double
 * links make insertion and deletion easier. Attached to
 * the PHONE node is a single linked list of index marks,
 * also packed into PHONE nodes. We don't put the index marks
 * into the main chain because it complicates the rules
 * that perform allophonic transformations. Unfortunately,
 * it is a little wasteful of space. The format of the
 * node is determined by which list it is in.
 */

typedef	struct	PHONE_T {
	struct	PHONE_T	*p_fp;			/* Link forward			*/
	struct	PHONE_T	*p_bp;			/* Link backward		*/
#ifndef NO_INDEXES
	struct	PHONE_T	*p_ip;			/* Link to index chain		*/
#endif
	union	{
		int	p_c[6];			/* Data for plain version	*/
		int	p_i[3];			/* Data for index version	*/
	}	p_u;
}	PHONE;

#define	p_flag		p_u.p_c[0]	/* Flags			*/
#define	p_stress	p_u.p_c[1]	/* Stress code			*/
#define	p_sphone	p_u.p_c[2]	/* USA phoneme if stressed	*/
#define	p_uphone	p_u.p_c[3]	/* USA phoneme if unstressed	*/

#define	p_itype		p_u.p_i[0]	/* Index type			*/
#define	p_value		p_u.p_i[1]	/* Index value			*/
#define	p_iret		p_u.p_i[2]	/* Return style			*/

#define	PFDASH	0x01		  		/* [-] boundry.			*/
#define	PFSTAR	0x02				/* [*] boundry.			*/
#define	PFHASH	0x04				/* [#] boundry.			*/
#define	PFPLUS	0x08				/* [+] boundry.			*/
#define	PFSYLAB	0x10				/* [=] boundry.			*/
#define	PFRFUSE	0x20				/* Sylable refuses stress.	*/
#define	PFLEFTC	0x40				/* In left cluster.		*/
#define	PFBLOCK	0x80				/* Block vowel reductions.	*/

/*
 * Most routines never see a word
 * with a [-], [#], or [*] in it. The exception
 * is "allo2", which scans the whole word as a block,
 * because it is easier to do so. It considers all
 * of these to be equal strength.
 */

#define	PFBOUND	(PFDASH|PFSTAR|PFHASH)
#define	PFMORPH	(PFDASH|PFSTAR|PFHASH|PFPLUS)

#define	DASH	(SBOUND)		/* Standard codes.		*/
#define	STAR	(MBOUND)
#define	HASH	(HYPHEN)
#define	PLUS	(PERIOD)		/* These two just hide overtop	*/
#define	EQUAL	(COMMA)			/* of two impossible ones.	*/

/*
 * Special internal phonemes.
 * All are beyond the end of the ones
 * that Dennis defines ("def.h").
 */


#define	NPHONE		(PHO_SYM_TOT)			/* Loop limit for lookups	*/
#define	SNONE		(PHO_SYM_TOT+ 0)		/* [0]				*/
#define	SUN		(PHO_SYM_TOT+ 1)		/* [1]				*/
#define	SSEC		(PHO_SYM_TOT+ 2)		/* [2]				*/
#define	SPRI		(PHO_SYM_TOT+ 3)		/* [3]				*/
#define	S1LEFT		(PHO_SYM_TOT+ 4)		/* [4]				*/
#define	S2LEFT		(PHO_SYM_TOT+ 5)		/* [5]				*/

/*
 * A LETTER structure holds a letter in
 * a word. Each letter consists of an ASCII code
 * and the front of an index list. The old GRAPH and GBLOCK
 * stuff was made to go away because it sucked.
 */

typedef	struct LETTER_struct	{
	short	l_ch;				/* The character code		*/
#ifndef NO_INDEXES
	PHONE	*l_ip;			/* Index list			*/
#endif
}	LETTER;

/*
 * English Grapheme codes. We use an encoded,
 * case insensitive alphabet to make a number of
 * tables, indexed by character, smaller. There are
 * special codes for the "GU" and "QU" clusters,
 * and for the few punctuation marks that are
 * considered "letters". The last 4 codes are
 * used by environments.
 */
#ifndef GERMAN

#define	GEOS			0 		/* End mark			*/
#define	GA			1 		/* Plain letters		*/
#define	GB			2
#define	GC			3
#define	GD			4
#define	GE			5
#define	GF			6
#define	GG			7
#define	GH			8
#define	GI			9
#define	GJ			10
#define	GK			11
#define	GL			12
#define	GM			13
#define	GN			14
#define	GO			15
#define	GP			16
#define	GQ			17
#define	GR			18
#define	GS			19
#define	GT			20
#define	GU			21
#define	GV			22
#define	GW			23
#define	GX			24
#define	GY			25
#define	GZ			26
#define	GGU		27		/* GU pseudo-consonant		*/
#define	GQU		28		/* QU pseudo-consonant		*/
#define	GQUOTE		29		/* "'", as in contractions	*/
#define	GMBOUND		30		/* "+", the morpheme boundry	*/

#define	NGRAPH		31	 	/* # of codes, lookup		*/

#define	GRANGE		31	 	/* Range			*/
#define	GDISJ		32		/* Disjunction			*/
#define	GFEAT		33		/* Feature			*/
#define	GWBOUND		34	 	/* Word boundry			*/
#endif
/*
 * German Grapheme codes. We use an encoded,
 * case insensitive alphabet to make a number of
 * tables, indexed by character, smaller. There are
 * special codes for the "GU" and "GD" clusters,
 * and for the few punctuation marks that are
 * considered "letters". The last 4 codes are
 * used by environments.
 */

#ifdef GERMAN
#define	GGEOS		0 		/* End mark			*/
#define	GGA		1 		/* Plain letters		*/
#define	GGB		2
#define	GGC		3
#define	GGD		4
#define	GGE		5
#define	GGF		6
#define	GGG		7
#define	GGH		8
#define	GGI		9
#define	GGJ		10
#define	GGK		11
#define	GGL		12
#define	GGM		13
#define	GGN		14
#define	GGO		15
#define	GGP		16
#define	GGQ		17
#define	GGR		18
#define	GGS		19
#define	GGT		20
#define	GGUu		21
#define	GGV		22
#define	GGW		23
#define	GGX		24
#define	GGY		25
#define	GGZ		26
#define	GGAx		27
#define	GGOx		28
#define	GGSx		29
#define	GGUx		30
#define	GGGU		31		/* GU pseudo-consonant		*/
#define	GGQU		32		/* QU pseudo-consonant		*/
#define	GGQUOTE		33		/* "'", as in contractions	*/
#define	GGMBOUND	34		/* "+", the morpheme boundry	*/

#define	GNGRAPH		35	 	/* # of codes, lookup		*/

#define	GGRANGE		35	 	/* Range			*/
#define	GGDISJ		36		/* Disjunction			*/
#define	GGFEAT		37		/* Feature			*/
#define	GGWBOUND	38	 	/* Word boundry			*/
#endif

/*
 * Features. The code is
 * the bit mask for the feature.
 * The features fit in a 16 bit
 * word; two bytes hold it in the
 * data.
 */

#define	FSEG		0x0001			/* Segmental			*/
#define	FVOC		0x0002			/* Vocalic			*/
#define	FCONS		0x0004			/* Consonantal			*/
#define	FHIGH		0x0008			/* High				*/
#define	FVOICE		0x0010			/* Voiced			*/
#define	FLIQ		0x0020			/* Liquid			*/
#define	FSIB		0x0040			/* Sibalent			*/
#define	FVELAR		0x0080			/* Velar			*/
#define	FNAS		0x0100			/* Nasal			*/
#define	FGEM		0x0200			/* Geminate			*/
#define	FCOR		0x0400			/* Coronal			*/
#define	FC		0x0800			/* C				*/
#define	FL		0x1000			/* L				*/
#define	FX		0x2000			/* X				*/
#define	FR		0x4000			/* R				*/
#define	FSYL		0x8000			/* Sylable exists to the left	*/

#define	NFSYM		16			/* # of F symbols		*/

/*
 * Phoneme features.
 * These are a distinct set from
 * the grapheme features. They don't
 * have anything in common with the
 * grapheme features.
 */

#define	PCONS		0x0001			/* Consonant			*/
#define	PVOC		0x0002			/* Vowel			*/
#define	PBOTH		0x0004			/* Both (like "L", "R")		*/
#define	PVOICE		0x0008			/* Voiced			*/
#define	PSIB		0x0010			/* Sibalent			*/
#define	POBS		0x0020			/* Obstruent			*/
#define	PTD		0x0040			/* has t or d sound 		*/
#define	PBACK		0x0080			/* back vowel 			*/
#define	PLONG		0x0100			/* long vowel 			*/

#define	NPSYM		9			/* # of P symbols		*/


#define	TYPE		0x000F			/* Character type.		*/
#define	II		0x0010			/* 1 if invisable		*/
#define	UU		0x0020			/* 1 if upper case character.	*/
#define	LS		0x0040			/* 1 if left  side stripable.	*/
#define	RS		0x0080			/* 1 if right side stripable.	*/
#define	FB		0x0100			/* 1 if forced clause break.	*/
#define	OO		0x0200			/* 1 if a vowel (kludge name)	*/
#define	C		0x0400			/* 1 if a consonant.		*/
#define	PR		0x0800			/* 1 if printing character.	*/

#define	IGNORE		0			/* Always discarded.		*/
#define	BACKUP		1			/* Backup the word cursor.	*/
#define	NEVER		2			/* Never in a word.		*/
#define	MIGHT		3			/* Goes in word if imbedded.	*/
#define	ALWAYS		4			/* Always kept.			*/
#define	PHONEME		5			/* An out of band signal.	*/


/*
 *  all routines that expect a far pointer must be prototyped ...
 */

extern	PHONE	phead;			/* Listhead for phonemes	*/
extern	short	fchar;			/* "." in USA, "," in Europe.	*/
extern	short	schar;			/* "," in USA, "." in Europe.	*/

#define	PLENGTH	0x0F			/* Length, in phonemes.		*/
#define	PCONT	0x10			/* Continue.			*/
#define	PRCON	0x20			/* Require a consonant.		*/
#define	PRVOC	0x40			/* Require a vowel.		*/
#define	P2SYL	0x80			/* Destress two sylables.	*/


#endif

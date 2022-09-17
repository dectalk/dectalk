/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved.
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
 *    File Name:	ls_defs.h
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *
 *    Functionality:
 *    new lts defs files ... included with the master lsdef file but
 *    split out for the tools ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-------			---------------------------------------
 *	001 MGS		02/02/1996		Moved lsdefs.h to ls_def.h
 *	002	MGS		02/02/1996		Moved other #defines and typedefs to ls_defs.h	
 *	003	MGS		02/22/1996		Changed NON_VOWEL(C) macro to special characters
 *	004	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *	005	DR		07/21/1997		UK BUILD: Changed ENGLISH_US to ENGLISH or added ENGLISH_UK
 *  006	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 *  007	MGS		04/13/2000		Changes for integrated phoneme set 
 *  008	NAL		05/23/2000		FVELAR to FLTSVELAR
 *  009	CHJ		07/20/2000		FRENCH support added
 *  010 CAB		10/18/2000		Changed copyright info
 *  011	MGS		12/28/2000		Removed l_ip from LETTER structure
 *  012	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  013 CAB		05/14/2001		Updated copyright
 *  014	MGS		06/19/2001		Solaris Port BATS#972
 *  015	MGS		02/25/2002		Removed unsued indexing code
 *	016 CAB		04/30/2002		Removed _arm
 */

#ifndef LS_DEFSH
#define LS_DEFSH 1

#include "dectalkf.h"
#include "defs.h"
#include "dectalk.h"
#include "cmd.h"

#ifdef NEW_PHONES
#include "l_all_ph.h"
#else
#ifdef SPANISH_SP
#include "l_sp_ph.h"
#endif // SPANISH_SP
#ifdef ITALIAN
#include "l_it_ph.h"
#endif // SPANISH_SP

#ifdef SPANISH_LA
#include "l_la_ph.h"
#endif

#ifdef GERMAN
#include "mn_char.h"
#endif

#ifdef ENGLISH_US
#include "l_us_ph.h"
#endif

#ifdef ENGLISH_UK
#include "l_uk_ph.h"
#endif

#ifdef FRENCH
#include "l_fr_ph.h"
#endif
#endif // NEW_PHONES

#include "esc.h"

#if !defined _UNIX_LIKE_ && !defined  ARM7
#ifndef NULL
#define NULL    ((void *)0)
#endif
#endif
/* #define NULL 0 */
/*
 *  external segment defines ...
 */
        
#ifdef SPANISH
#define FIRST 	0
#define FABBREV 1
#define SECOND 	2
#define SNOPARS 3
#define MISS 	0
#define HIT 	1
#define ABBREV 	2
#endif

#ifdef GERMAN
#define FIRST 	0
#define FABBREV 1
#define SECOND 	2
#define SNOPARS 3
#define MISS 	0
#define HIT 	1
#define ABBREV 	2
#define NNODE 	64
#define OVF 	(PVALUE + (PFCONTROL << PSFONT))
#define DBGLSD 	0
#define DBGLTS 	0

struct wb {
   char graph;
   unsigned char phon;   
   unsigned char gramm;
   unsigned char akzent;
};
#endif // GERMAN

#ifdef FRENCH
#define FIRST   0     /* First probe */
#define FABBREV 1     /* First probe, abbreviation */
#define SECOND  2     /* Additional probe */
#define SNOPARS 3     /* Additional probe, strip ")" */

#define MISS    0     /* Miss */
#define HIT     1     /* Hit */
#define ABBREV  2     /* Hit in abbreviation context */
#endif	// FRENCH

#define	NGWORD		128			/* # of graphemes in a word	*/
#define	NPNODE		128			/* # of phonemes in the pool	*/
#define	NOMAP		0			/* No "lscrush" remapping	*/
#define	NSYL		10			/* # of sylables (maximum) for English	*/
#define	GNSYL		20			/* # of sylables (maximum) for German	*/
#define	FORW		0			/* Forward flag			*/
#define	BACK		1			/* Backward flag		*/
#define	TWOPH		0x80		/* Flag for [ab] phoneme.	*/
#define	MSKPH		0x7F		/* Extract mask			*/

#define	UNK_WH		0			/* "Wh" state is unknown.	*/
#define	IS_WH		1			/* A "wh" sentence.		*/
#define	NOT_WH		2			/* Not a "wh" sentence.		*/

#define	FAST		0			/* Spell mode = fast		*/
#define	SLOW		1			/* Spell mode = slow		*/
#define DASHNFAST 	2			/* Spell mode = fast and say dash*/
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

typedef	struct	PHONE 
{
	struct	PHONE	*p_fp;	/* Link forward			*/
	struct	PHONE	*p_bp;	/* Link backward		*/
//	struct	PHONE	*p_ip;	/* Link to index chain		*/
	union	{
		int	p_c[6];			/* Data for plain version	*/
		int	p_i[3];			/* Data for index version	*/
	}	p_u;
}	PHONE;
                           
/* SPANISH specific definitions */                           
#ifdef SPANISH
#define p_letter    	p_u.p_c[1]
#define p_phone     	p_u.p_c[2]
#define LS_ANY_STRESS 	7
#define LS_STRESS_1   	1
#define LS_STRESS_2   	2
#define LS_STRESS_3   	4
#define LSSBOUND      	8
#define LSVOWEL       	16
#define PREV(lsp)       (lsp->p_bp)
#define NEXT(lsp)       (lsp->p_fp)
#define LSISSTRESS(lsp) (((lsp)->p_flag & LS_ANY_STRESS) != 0)
#define LSISSBOUND(lsp) (((lsp)->p_flag & LSSBOUND) != 0)
#define LSISVOWEL(lsp)  (((lsp)->p_flag & LSVOWEL) != 0)
#define LSNULL          ((PHONE *) NULL)
#endif                                  


#ifdef ITALIAN
#define p_letter    	p_u.p_c[1]
#define p_phone     	p_u.p_c[2]
#define LS_ANY_STRESS 	7
#define LS_STRESS_1   	1
#define LS_STRESS_2   	2
#define LS_STRESS_3   	4
#define LSSBOUND      	8
#define LSVOWEL       	16
#define PREV(lsp)       (lsp->p_bp)
#define NEXT(lsp)       (lsp->p_fp)
#define LSISSTRESS(lsp) (((lsp)->p_flag & LS_ANY_STRESS) != 0)
#define LSISSBOUND(lsp) (((lsp)->p_flag & LSSBOUND) != 0)
#define LSISVOWEL(lsp)  (((lsp)->p_flag & LSVOWEL) != 0)
#define LSNULL          ((PHONE *) NULL)
#endif     


#define	p_flag		p_u.p_c[0]	/* Flags			*/
#define	p_stress	p_u.p_c[1]	/* Stress code			*/
#define	p_sphone	p_u.p_c[2]	/* USA phoneme if stressed	*/
#define	p_uphone	p_u.p_c[3]	/* USA phoneme if unstressed	*/

#define	p_itype		p_u.p_i[0]	/* Index type			*/
#define	p_value		p_u.p_i[1]	/* Index value			*/
#define	p_iret		p_u.p_i[2]	/* Return style			*/

#define	PFDASH		0x01		/* [-] boundry.			*/
#define	PFSTAR		0x02		/* [*] boundry.			*/
#define	PFHASH		0x04		/* [#] boundry.			*/
#define	PFPLUS		0x08		/* [+] boundry.			*/
#define	PFSYLAB		0x10		/* [=] boundry.			*/
#define	PFRFUSE		0x20		/* Sylable refuses stress.	*/
#define	PFLEFTC		0x40		/* In left cluster.		*/
#define	PFBLOCK		0x80		/* Block vowel reductions.	*/

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


#define	NPHONE	(PHO_SYM_TOT)			/* Loop limit for lookups	*/
#define	SNONE	(PHO_SYM_TOT+ 0)		/* [0]				*/
#define	SUN		(PHO_SYM_TOT+ 1)		/* [1]				*/
#define	SSEC	(PHO_SYM_TOT+ 2)		/* [2]				*/
#define	SPRI	(PHO_SYM_TOT+ 3)		/* [3]				*/
#define	S1LEFT	(PHO_SYM_TOT+ 4)		/* [4]				*/
#define	S2LEFT	(PHO_SYM_TOT+ 5)		/* [5]				*/

/*
 * A LETTER structure holds a letter in
 * a word. Each letter consists of an ASCII code
 * and the front of an index list. The old GRAPH and GBLOCK
 * stuff was made to go away because it sucked.
 */

typedef	struct LETTER_struct	{
	short	l_ch;			/* The character code		*/
//	PHONE	*l_ip;			/* Index list				*/
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
#ifdef ENGLISH

#define	GEOS		0 		/* End mark				*/
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
#define	GGU			27		/* GU pseudo-consonant		*/
#define	GQU			28		/* QU pseudo-consonant		*/
#define	GQUOTE		29		/* "'", as in contractions	*/
#define	GMBOUND		30		/* "+", the morpheme boundry	*/

#define	NGRAPH		31	 	/* # of codes, lookup		*/

#define	GRANGE		31	 	/* Range			*/
#define	GDISJ		32		/* Disjunction			*/
#define	GFEAT		33		/* Feature			*/
#define	GWBOUND		34	 	/* Word boundry			*/
#endif /* #ifdef ENGLISH */
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
#define	GGA			1 		/* Plain letters		*/
#define	GGB			2
#define	GGC			3
#define	GGD			4
#define	GGE			5
#define	GGF			6
#define	GGG			7
#define	GGH			8
#define	GGI			9
#define	GGJ			10
#define	GGK			11
#define	GGL			12
#define	GGM			13
#define	GGN			14
#define	GGO			15
#define	GGP			16
#define	GGQ			17
#define	GGR			18
#define	GGS			19
#define	GGT			20
#define	GGUu		21
#define	GGV			22
#define	GGW			23
#define	GGX			24
#define	GGY			25
#define	GGZ			26
#define	GGAx		27
#define	GGOx		28
#define	GGSx		29
#define	GGUx		30
#define	GGGU		31		/* GU pseudo-consonant		*/
#define	GGQU		32		/* QU pseudo-consonant		*/
#define	GGQUOTE		33		/* "'", as in contractions	*/
#define	GGMBOUND	34		/* "+", the morpheme boundry	*/
#define GGSYLBOUND  35      /* "=", A Syllable boundry   */
#define GGTHINGY1	36
#define GGTHINGY2	37
#define GGTHINGY3	38
#define GGTHINGY4	39
#define GGTHINGY5	40
#define GGTHINGY6	41
#define GGTHINGY7	42
#define GGTHINGY8	43
#define GGTHINGY9	44


#endif /* #ifdef GERMAN */

#ifdef FRENCH

#define GEOS   0   /* End mark */
#define GA     1   /* Plain letters */
#define GB     2
#define GC     3
#define GD     4
#define GE     5
#define GF     6
#define GG     7
#define GH     8
#define GI     9
#define GJ     10
#define GK     11
#define GL     12
#define GM     13
#define GN	   14
#define GO     15
#define GP     16
#define GQ     17
#define GR     18
#define GS     19
#define GT      20
#define GU      21
#define GV      22
#define GW      23
#define GX      24
#define GY      25
#define GZ      26
#define GGU     27   /* GU pseudo-consonant */
#define GQU     28   /* QU pseudo-consonant */
#define GQUOTE  29   /* "'", as in contractions */
#define GMBOUND 30   /* "+", the morpheme boundry */

#define NGRAPH  31   /* # of codes, lookup */

#define GRANGE  31   /* Range */
#define GDISJ   32   /* Disjunction  */
#define GFEAT   33   /* Feature */
#define GWBOUND 34   /* Word boundry */

#endif	// FRENCH

#if defined (GERMAN) || defined (LDS_BUILD)
#define	GNGRAPH		45	 	/* # of codes, lookup		*/
#endif

#if defined (GERMAN) || defined (LDS_BUILD)
#define	GGRANGE		45	 	/* Range			*/
#define	GGDISJ		46		/* Disjunction			*/
#define	GGFEAT		47		/* Feature			*/
#define	GGWBOUND	48	 	/* Word boundry			*/
#endif 

/*
 * Features. The code is
 * the bit mask for the feature.
 * The features fit in a 16 bit
 * word; two bytes hold it in the
 * data.
 */
#if defined (ENGLISH) || defined (GERMAN) || defined (FRENCH)
#define	FSEG		0x0001			/* Segmental */
#define	FVOC		0x0002			/* Vocalic */
#define	FCONS		0x0004			/* Consonantal */
#define	FHIGH		0x0008			/* High		*/
#define	FVOICE		0x0010			/* Voiced	*/
#define	FLIQ		0x0020			/* Liquid	*/
#define	FSIB		0x0040			/* Sibalent	*/
#define	FLTSVELAR	0x0080			/* Velar	*/
#define	FNAS		0x0100			/* Nasal	*/
#define	FGEM		0x0200			/* Geminate	*/
#define	FCOR		0x0400			/* Coronal	*/
#define	FC			0x0800			/* C		*/
#define	FL			0x1000			/* L		*/
#define	FX			0x2000			/* X		*/
#define	FR			0x4000			/* R		*/
#define	FSYL		0x8000			/* Sylable exists to the left */

#define	NFSYM		16				/* # of F symbols */

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
#define	PTD			0x0040			/* has t or d sound 		*/
#define	PBACK		0x0080			/* back vowel 			*/
#define	PLONG		0x0100			/* long vowel 			*/

#define	NPSYM		9				/* # of P symbols		*/

#ifdef FRENCH
//extern PHONE phead;     /* Listhead for phonemes */

//extern PHONE *palloc(); /* Allocate a new PHONE */
#endif // FRENCH
#endif /* #if defined(ENGLISH) || defined(GERMAN) || defined(FRENCH) */


#define	TYPE		0x000F			/* Character type.		*/
#define	II			0x0010			/* 1 if invisable		*/
#define	UU			0x0020			/* 1 if upper case character.	*/
#define	LS			0x0040			/* 1 if left  side stripable.	*/
#define	RS			0x0080			/* 1 if right side stripable.	*/
#define	FB			0x0100			/* 1 if forced clause break.	*/
#define	OO			0x0200			/* 1 if a vowel (kludge name)	*/
#define	C			0x0400			/* 1 if a consonant.		*/
#define	PR			0x0800			/* 1 if printing character.	*/

#ifdef SPANISH

#define L       	0x1000
#define LC      	0x2000        
#define ISUPPER(c) 	((lsctype[(c)]&UU)!=0)
#define ISLOWER(c) 	((lsctype[(c)]&LC)!=0)
#define ISALPHA(c) 	((lsctype[(c)]&L)!=0)
#define ISVOWEL(c) 	((lsctype[(c)]&OO)!=0)
#define _TOLOWER(c) (c += ('a' - 'A'))  /* Known to be uppercase */

#ifdef VMS
#define NBR_DEBUG       1
#define LTS_DEBUG       2
#define SYL_DEBUG       4
#define STR_DEBUG       8
#define DIC_DEBUG       16
#define DEBUG(what)     ((lprintsw & (what)) != 0)
#define dt_lock()                                                
#define dt_unlock()
#else
#define NBR_DEBUG       0
#define SYL_DEBUG       0
#define STR_DEBUG       0
#define DIC_DEBUG       16      
#endif // VMS

#endif // SPANISH

#ifdef ITALIAN

#define L       	0x1000
#define LC      	0x2000        
#define ISUPPER(c) 	((lsctype[(c)]&UU)!=0)
#define ISLOWER(c) 	((lsctype[(c)]&LC)!=0)
#define ISALPHA(c) 	((lsctype[(c)]&L)!=0)
#define ISVOWEL(c) 	((lsctype[(c)]&OO)!=0)
#define _TOLOWER(c) (c += ('a' - 'A'))  /* Known to be uppercase */

#ifdef VMS
#define NBR_DEBUG       1
#define LTS_DEBUG       2
#define SYL_DEBUG       4
#define STR_DEBUG       8
#define DIC_DEBUG       16
#define DEBUG(what)     ((lprintsw & (what)) != 0)
#define dt_lock()                                                
#define dt_unlock()
#else
#define NBR_DEBUG       0
#define SYL_DEBUG       0
#define STR_DEBUG       0
#define DIC_DEBUG       16      
#endif // VMS

#endif // ITALIAN

#ifndef FRENCH
#define	IGNORE	0		/* Always discarded. */
#define	BACKUP	1		/* Backup the word cursor. */
#define	NEVER	2		/* Never in a word. */
#define	MIGHT	3		/* Goes in word if imbedded. */
#define	ALWAYS	4		/* Always kept. */
#define	PHONEME	5		/* An out of band signal. */
#else
#define IGNORE  0		/* Always discarded */
#define BACKUP  1       /* Backup the word cursor */
#define NEVER   2       /* Never in a word */
#define SINGLE  3       /* Special single byte word */
#define MIGHT   4       /* Goes in word if imbedded */
#define ALWAYS  5       /* Always kept */
#define PHONEME 6       /* An out of band signal */

#define SHORT 	unsigned short  /* de 0 a 65535 */
#define BYTE unsigned char  /* de 0 a 255 */
#define FLAG short          /* Bool‚en */
#endif	// FRENCH


#if defined ARM7 && !defined FRENCH
//#define SHORT 	unsigned short  /* de 0 a 65535 */
#define BYTE unsigned char  /* de 0 a 255 */
//#define FLAG short          /* Bool‚en */
#endif

/*
 *  all routines that expect a far pointer must be prototyped ...
 */

#define	PLENGTH	0x0F			/* Length, in phonemes.		*/
#define	PCONT	0x10			/* Continue.			*/
#define	PRCON	0x20			/* Require a consonant.		*/
#define	PRVOC	0x40			/* Require a vowel.		*/
#define	P2SYL	0x80			/* Destress two sylables.	*/

/* moved from ls1.c ->ls_task.c */
/*
 * Flags (lflag).
 */
#define LSTRIP  0x0001                  /* Left  stripping was done.    */
#define RSTRIP  0x0002                  /* Right stripping was done.    */
#define DIGSLSH 0x0004                  /* Word has digit or slash.     */
#define SQUOTE  0x0008                  /* Word has a single quote.     */
#define HVOWEL  0x0010                  /* Has a vowel.                 */
#define HCONS   0x0020                  /* Has a consonant.             */
#define HHYPHEN 0x0040                  /* Has a hyphen; compound.      */
#define HNONY   0x0080                  /* Has a non-y.                 */

/*
 * Used by number reading.
 */
typedef struct  NUM_struct {
	LETTER  *n_ilp;                 /* Integer part: left           */
	LETTER  *n_irp;                 /* Integer part: right          */
	LETTER  *n_flp;                 /* Fractional part: left        */
	LETTER  *n_frp;                 /* Fractional part: right       */
	LETTER  *n_elp;                 /* Exponent: left               */
	LETTER  *n_erp;                 /* Exponent: right              */
}       NUM;

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
#if defined (ENGLISH) || defined (SPANISH)  || defined (FRENCH)
#define I       0x0010                  /* 1 if invisable               */
#define U       0x0020                  /* 1 if upper case character.   */
#define O       0x0200                  /* 1 if a vowel (kludge name)   */
#endif

/* from ls4.c -> ls_rule.c */

typedef	struct GRAPH_struct	{
#if defined (VMS) || defined (LDS_BUILD)
	short g_graph;			/* Grapheme code		*/
	short g_feats;			/* Set of features		*/
#else
	S16	g_graph;			/* Grapheme code		*/
	S16	g_feats;			/* Set of features		*/
#endif
//	PHONE	*g_ip;			/* List of index nodes	*/
}	GRAPH;
/* from ls1.c -> ls_task.c*/
                                            
/* from ls5.c -> ls_adju.c */
#define	ILLEGAL		0			/* Illegal cluster		*/
#define	DT_OK		1 			/* Ok cluster			*/
#define	TRYS		2 			/* Try for "s" or "S" on left	*/

#define	DGC			1			/* Try stuff.			*/
 
 
/* from lsspell.c ->ls_spel.c */
#define	TC		(tlp->l_ch)
#define	NON_VOWEL(C)	(C != 'A' && C != 'E' && C != 'I' && C != 'O' && C != 'U' && \
						 !(C >= 0xC0 && C<=0xC5) && !(C >= 0xC8 && C<=0xCF) && \
						 !(C >= 0xD2 && C<=0xD6) && !(C >= 0xD8 && C<=0xDD) )

/* #define	NON_VOWEL(C)	(C != 'A' && C != 'E' && C != 'I' && C != 'O' && C != 'U') */

#define	BC1	((llp->l_ch)-'A')
#define	BC2	(((llp+1)->l_ch)-'A')
#define	EC1	(((rlp-1)->l_ch)-'A')
#define	EC2	(((rlp-2)->l_ch)-'A')

#define	SPELL_END		0x01	/* spell if end pair */
#define	SPELL_BEGIN		0x02	/* spell if begin pair */


/* from ls7.c ->ls_util.c */
#define	INGS	1				/* Use "-ings".	     */
#define	ERS		1				/* Use "-ers".		 */
#define	SSES	1				/* Use "ss-es" code. */
#ifdef MOVED_TO_THREAD
extern ITEM    citem;       /* Current item.             */
extern ITEM    nitem;       /* Next item, for lookahead. */
#endif
/* from lsdic.c -> ls_dict.c */
#define	VPHRASE		(FC_VERB|FC_CHARACTER)
#define	PPHRASE		(FC_PREP|FC_CHARACTER)
#define	DE (*ent)
#define	LOOK_HIGHER		0xffff
#define	LOOK_LOWER		0xfffe
#ifdef MOVED_TO_THREAD
	extern unsigned long fc_struct[];
	extern int fc_index;
	extern struct dic_entry far *ent;
#endif                            

#endif /* ifndef LS_DEFSH */
                                         

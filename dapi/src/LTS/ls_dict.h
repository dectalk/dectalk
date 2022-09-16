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
 *    File Name:    ls_dict.h
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    suffix table entries ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-----------		---------------------------------------
 *	001	CJL		02/22/1995		Added diffs from Ed B's spanish version.
 *	002 MGS		03/18/1996		added #pragma directives for win32 compatility
 *	003	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *  004 GL      07/29/1996      Remove the MARK_*  symbols. These symbols are not used.
 *                              They are also used in CMD codes with different definition.
 *	005	GL		08/01/1996		Add WIN95 udic switch
 *  006 GL		11/11/1996		Add US_AND_SP switch for DTEX
 *  007 GL		12/05/1996		remove the DTEX language pipe hack
 *  008	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *  009 TQL		05/13/1997		BATS#360  Remove spaces before "#define" or "#if"
 *  010 GL		09/25/1997		use array for dictionary entry structure.
 *                              also add UK_english support
 *  011 GL		07/08/1998      For BATS#706, include fc_def.tab to catch the shared FC definition
 *  012 JAW     07/13/1998      Made dic_entry only be defined if it hasn't already been
 *  011	mfg		06/22/1998		Added support for LANG_latin_american
 *                              defined (it's also being defined in ttsapi.h).
 */

#ifndef LS_DICTH
#define LS_DICTH 

#include "ls_def.h"     

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
#pragma pack(push,enter_ls_dict,1)
#endif
#ifdef MSDOS
#pragma pack(1)
#endif

struct  suff_rule
{
	/* GL 04/21/1997  change this for OSF build */
	U32				next;
	U32				fc;
	unsigned char	rule[256];
};    

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
#pragma pack(pop,enter_ls_dict,1)
#endif
#ifdef MSDOS
#pragma pack()
#endif

/*
 *  dtpc dictionary defines ...
 */

#ifndef DIC_ENTRY
#define DIC_ENTRY
struct  dic_entry       
{

	U32                     fc;
	unsigned char           text[128];
};
#endif

/* 07/08/1998 GL for BATS#706 include fc_def.tab to catch form class definition */
#include "fc_def.tab"

/*
 *  Word characteristic fields
 */

#if 0
/*
 *  special encoding of the form class field ....
 */


#define FC_NEGATE               0x04000000L             /* add for negation on test */
#define FC_STRUCTURE            0x08000000L             /* word structure definition */

#define MARK_null               0x0000                  /* null marker for place holder */
#define MARK_start              0x0001                  /* start of a sentence */
#define MARK_end                0x0002                  /* end of a sentence */
#define MARK_comma              0x0004                  /* has a comma */
#define MARK_first_upper        0x0008                  /* first character upper */
#define MARK_vowel              0x0010                  /* has a vowel */
#define MARK_upper              0x0020                  /* has an upper */
#define MARK_cons               0x0040                  /* has a consonant*/
#define MARK_digit              0x0080                  /* has a digit */
#define MARK_hyphen             0x0100                  /* has a hyphen */
#define MARK_ques_excl          0x0200                  /* has a question or exclaim mark */
#define MARK_non_alpha          0x0400                  /* has a non-alpha numic*/
#define MARK_slash              0x0800
#define MARK_numeric            0x1000  
#define MARK_period             0x2000
#define MARK_dquote             0x4000
#define MARK_squote             0x8000 

#define         FC_ALWAYS               FC_STRUCTURE+0
#define         FC_START                FC_STRUCTURE+MARK_START
#define         FC_END                  FC_STRUCTURE+MARK_END
#define         FC_COMMA                FC_STRUCTURE+MARK_COMMA
#endif


#define         FC_TARGET               0xffffffffL
#define         FC_CONSIDER             0x00ffffffL
#define         FC_KEEP                 0xff000000L


/*
 * These defines are used to communicate
 * with the dictionary lookup code. The first four
 * tell the lookup routines if this is the first search
 * or one of the extra searches, and if an abbreviation
 * can be matched. The last three are returned by the
 * lookup routine to tell you what happened. Caveat!
 * These numbers are known by assembler code.
 */

#define FIRST           0            /* First probe.                 */
#define FABBREV         1            /* First probe, abbreviation.   */
#define SECOND          2            /* Additional probe.            */
#define SNOPARS         3            /* Additional probe, strip ")". */
#define SINGLE_CHAR 	4            /* Single character quick lookup */

#define MISS            0            /* Miss.                        */
#define HIT             1            /* Hit.                         */
#define ABBREV          2            /* Hit in abbreviation context. */

/*
 * dictionary pointer used in ls_dict.c and ls_suff.c
 */
/* GL 09/25/1997 use array structure for dictionary entry */
/*               also add UK_english code */
#ifdef ENGLISH_UK
/* Use for English, the default */
#define DICT_HEAD       ((struct dic_entry far * huge *)pKsd_t->fdic[LANG_british])
#ifdef MSDOS
#define UDICT_HEAD      ((char far * far *)pKsd_t->udic[LANG_british])
#define ADICT_HEAD      ((char far * far *)pKsd_t->adic[LANG_british])
#else
#define UDICT_HEAD      ((struct dic_entry far * far *)pKsd_t->udic[LANG_british])
#define ADICT_HEAD      ((struct dic_entry far * far *)pKsd_t->adic[LANG_british])
#endif
#define DICT_ENTRY      pKsd_t->fdic_entries[LANG_british]
#define UDICT_ENTRY     pKsd_t->udic_entries[LANG_british]
#define ADICT_ENTRY     pKsd_t->adic_entries[LANG_british]
#endif

#ifdef ENGLISH_US
/* Use for English, the default */
#define DICT_HEAD       ((struct dic_entry far * huge *)pKsd_t->fdic[LANG_english])
#ifdef MSDOS
#define UDICT_HEAD      ((char far * far *)pKsd_t->udic[LANG_english])
#define ADICT_HEAD      ((char far * far *)pKsd_t->adic[LANG_english])
#else
#define UDICT_HEAD      ((struct dic_entry far * far *)pKsd_t->udic[LANG_english])
#define ADICT_HEAD      ((struct dic_entry far * far *)pKsd_t->adic[LANG_english])
#endif
#define DICT_ENTRY      pKsd_t->fdic_entries[LANG_english]
#define UDICT_ENTRY     pKsd_t->udic_entries[LANG_english]
#define ADICT_ENTRY     pKsd_t->adic_entries[LANG_english]
#endif

#ifdef SPANISH_SP
/* Use for Spanish */
#define DICT_HEAD       ((struct dic_entry far * huge *)pKsd_t->fdic[LANG_spanish])
#ifdef MSDOS
#define UDICT_HEAD      ((char far * far *)pKsd_t->udic[LANG_spanish])
#define ADICT_HEAD      ((char far * far *)pKsd_t->adic[LANG_spanish])
#else
#define UDICT_HEAD      ((struct dic_entry far * far *)pKsd_t->udic[LANG_spanish])
#define ADICT_HEAD      ((struct dic_entry far * far *)pKsd_t->adic[LANG_spanish])
#endif
#define DICT_ENTRY      pKsd_t->fdic_entries[LANG_spanish]
#define UDICT_ENTRY     pKsd_t->udic_entries[LANG_spanish]
#define ADICT_ENTRY     pKsd_t->adic_entries[LANG_spanish]
#endif

#ifdef SPANISH_LA
/* Use for Latin american */
#define DICT_HEAD       ((struct dic_entry far * huge *)pKsd_t->fdic[LANG_latin_american])
#ifdef MSDOS
#define UDICT_HEAD      ((char far * far *)pKsd_t->udic[LANG_latin_american])
#define ADICT_HEAD      ((char far * far *)pKsd_t->adic[LANG_latin_american])
#else
#define UDICT_HEAD      ((struct dic_entry far * far *)pKsd_t->udic[LANG_latin_american])
#define ADICT_HEAD      ((struct dic_entry far * far *)pKsd_t->adic[LANG_latin_american])
#endif
#define DICT_ENTRY      pKsd_t->fdic_entries[LANG_latin_american]
#define UDICT_ENTRY     pKsd_t->udic_entries[LANG_latin_american]
#define ADICT_ENTRY     pKsd_t->adic_entries[LANG_latin_american]
#endif

#ifdef GERMAN
/* Use for German */
#define DICT_HEAD       ((struct dic_entry far * huge *)pKsd_t->fdic[LANG_german])
#ifdef MSDOS
#define UDICT_HEAD      ((char far * far *)pKsd_t->udic[LANG_german])
#define ADICT_HEAD      ((char far * far *)pKsd_t->adic[LANG_german])
#else
#define UDICT_HEAD      ((struct dic_entry far * far *)pKsd_t->udic[LANG_german])
#define ADICT_HEAD      ((struct dic_entry far * far *)pKsd_t->adic[LANG_german])
#endif
#define DICT_ENTRY      pKsd_t->fdic_entries[LANG_german]
#define UDICT_ENTRY     pKsd_t->udic_entries[LANG_german]
#define ADICT_ENTRY     pKsd_t->adic_entries[LANG_german]
#endif

#ifdef FRENCH
#define DICT_HEAD       ((struct dic_entry far * huge *)pKsd_t->fdic[LANG_french])
#ifdef MSDOS
#define UDICT_HEAD      ((char far * far *)pKsd_t->udic[LANG_french])
#define ADICT_HEAD      ((char far * far *)pKsd_t->adic[LANG_french])
#else
#define UDICT_HEAD      ((struct dic_entry far * far *)pKsd_t->udic[LANG_french])
#define ADICT_HEAD      ((struct dic_entry far * far *)pKsd_t->adic[LANG_french])
#endif
#define DICT_ENTRY      pKsd_t->fdic_entries[LANG_french]
#define UDICT_ENTRY     pKsd_t->udic_entries[LANG_french]
#define ADICT_ENTRY     pKsd_t->adic_entries[LANG_french]
#endif

#endif

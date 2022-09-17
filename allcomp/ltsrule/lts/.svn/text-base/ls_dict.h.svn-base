/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.   
 *                                                                    
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.    
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.                                
 *                                                                      
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
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
 * 	004 GL      07/29/1996      Remove the MARK_*  symbols. These symbols are not used.
 *                              They are also used in CMD codes with different definition.
 *	005	GL		08/01/1996		Add WIN95 udic switch
 *	006 GL		11/11/1996		Add US_AND_SP switch for DTEX
 *	007 GL		12/05/1996		remove the DTEX language pipe hack
 *	008	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *	009 TQL		05/13/1997		BATS#360  Remove spaces before "#define" or "#if"
 *	010 GL		09/25/1997		use array for dictionary entry structure.
 *                              also add UK_english support
 *	011 GL		07/08/1998      For BATS#706, include fc_def.tab to catch the shared FC definition
 *	012 JAW     07/13/1998      Made dic_entry only be defined if it hasn't already been
 *	011	mfg		06/22/1998		Added support for LANG_latin_american
 *                              defined (it's also being defined in ttsapi.h).
 *	013	mgs		06/12/2000	    Dictionary reduction
 *	014 mfg		07/07/2000	    In #ifdef SPANISH_SP fixed typo of Lang_english to Lang_spanish.
 *	015	mfg		07/13/2000		Added dictiotionary memory mappping typedef 		
 *	016 CAB		10/18/2000		Changed copyright info
 *	017	mfg		10/20/2000		Turned memory mapping off for sh3 not supported mfg hack fix later
 *	018	MGS		01/11/2001		Added Foreigh langauge dictioanry
 *	019	MFG		02/19/2001		Turned back on dictionary memory mapping for now supported platforms 
 *  020 CAB		02/23/2001		Updated copyright info
 *  021	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  022 CAB		05/14/2001		Fixed copyright
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

/**********************************************************************/
/*  DICTIONARY MEMORY MAP Type Definitions.                                                 */
/**********************************************************************/

typedef DWORD MEMMAP_T;

#if defined(_WIN32_WCE_EMULATION) || defined VXWORKS
#define MEMMAP_ON	0 //turn memory mapping off for sh3 not supported mfg hack fix later
#else
#define MEMMAP_ON	1
#endif
#define MEMMAP_OFF	0


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

#ifdef CHEESY_DICT_COMPRESSION
	unsigned char           fc[1];
#else
	U32			fc[1];
#endif

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

#if defined ARM7 && !defined EPSON_ARM7
#define DICT_LANG 0
#else

#ifdef ENGLISH_US
#define DICT_LANG LANG_english
#endif
#ifdef ENGLISH_UK
#define DICT_LANG LANG_british
#endif
#ifdef GERMAN
#define DICT_LANG LANG_german
#endif
#ifdef SPANISH_SP
#define DICT_LANG LANG_spanish
#endif
#ifdef SPANISH_LA
#define DICT_LANG LANG_latin_american
#endif
#ifdef FRENCH
#define DICT_LANG LANG_french
#endif
#ifdef ITALIAN
#define DICT_LANG LANG_italian
#endif


#endif

#define DICT_INDEX       ((U32 *)pKsd_t->fdic_index[DICT_LANG])
#define FDICT_INDEX      ((U32 *)pKsd_t->foreigndic_index[DICT_LANG])
#define UDICT_INDEX      ((U32 *)pKsd_t->udic_index[DICT_LANG])
#define ADICT_INDEX      ((U32 *)pKsd_t->adic_index[DICT_LANG])

#define DICT_DATA       (((pKsd_t->fdic_data[DICT_LANG])))
#define FDICT_DATA      (((pKsd_t->foreigndic_data[DICT_LANG])))
#define UDICT_DATA      (((pKsd_t->udic_data[DICT_LANG])))
#define ADICT_DATA      (((pKsd_t->adic_data[DICT_LANG])))

#define DICT_ACCESS(x)       ((struct dic_entry *)(&(pKsd_t->fdic_data[DICT_LANG][((U32 *)pKsd_t->fdic_index[DICT_LANG])[(x)]])))
#define FDICT_ACCESS(x)      ((struct dic_entry *)(&(pKsd_t->foreigndic_data[DICT_LANG][((U32 *)pKsd_t->foreigndic_index[DICT_LANG])[(x)]])))
#define UDICT_ACCESS(x)      ((struct dic_entry *)(&(pKsd_t->udic_data[DICT_LANG][((U32 *)pKsd_t->udic_index[DICT_LANG])[(x)]])))
#define ADICT_ACCESS(x)      ((struct dic_entry *)(&(pKsd_t->adic_data[DICT_LANG][((U32 *)pKsd_t->adic_index[DICT_LANG])[(x)]])))

#define DICT_ENTRY      pKsd_t->fdic_entries[DICT_LANG]
#define FDICT_ENTRY     pKsd_t->foreigndic_entries[DICT_LANG]
#define UDICT_ENTRY     pKsd_t->udic_entries[DICT_LANG]
#define ADICT_ENTRY     pKsd_t->adic_entries[DICT_LANG]

#define DICT_BYTES      pKsd_t->fdic_bytes[DICT_LANG]
#define FDICT_BYTES     pKsd_t->foreigndic_bytes[DICT_LANG]
#define UDICT_BYTES     pKsd_t->udic_bytes[DICT_LANG]
#define ADICT_BYTES     pKsd_t->adic_bytes[DICT_LANG]

#ifdef CHEESY_DICT_COMPRESSION
#define DICT_FC_ACCESS(x)       (pKsd_t->fdic_fc_entry[DICT_LANG][x])
#else
#define DICT_FC_ACCESS(x)       (x)
#endif

#endif // LS_DICTH

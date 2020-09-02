/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved. 
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	ls_data.h
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *	  Data structure definitions for LTS
 *                                                                             
 ***********************************************************************       
 *    Revision History:
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-----------		---------------------------------------
 *	001	MGS		02/29/1996		Added LTS_T instance data structure for WIN32 merge
 *	002	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *  003 GL		10/03/1996		change rpart to U16 instead of S16.(to take care of the longer
 *								rule table indexing.    
 *  004	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *  005	MGS		10/17/1997		add old_fc_index in LTS_TAG 
 *  006	GL		06/12/1998		"rpart" should be "unsigned short" for LDS_BUILD
 *  007 CHJ		07/20/2000		French added
 *  008 CAB		10/18/2000		Changed copyright info
 *  009	MGS		02/25/2002		ACNA threading and new LTS parsing stuff
 *  010	MGS		04/03/2002		Single threaded lts
 *	011	CAB		08/09/2002		Updated copyright info
 *	012	CAB		08/13/2002		Fixed typo of extra ; for define
 */
/* 
 * Description : This file contains the declaration of instance specific
 * structure for LTS thread
 */   

#ifndef LS_DATAH
#define LS_DATAH

#if defined GERMAN || defined EPSON_ARM7
/* BACHUS INCLUDED HERE REWT:*/
#include "bachus.h" 
#endif

#if defined FRENCH || defined EPSON_ARM7
#define	LgPile	30
typedef struct {
  short LgPhon;    /* longueur max de Phon et PhonT */

  BYTE *Phon;
  short DebFen;    /* limite gauche pour l'examen des contextes gauches de Phon */
  short DebPhon;   /* indice du premier car. de Phon à traduire */
  short PtcPhon;   /* indice courant sur Phon */
  short FinPhon;   /* indice du dernier car. inclus de Phon à traduire */
  short FinFen;    /* limite droite incluse pour l'examen des contextes droits */

  BYTE *PhonTS;
  short PtPhonT;   /* indice du premier libre ds PhonTS */
} TypTamp;
#endif // FRENCH

#ifdef NEW_LTS
typedef struct command_data_tag
{
	U16 command;
	U16 nextra[3];
} command_data_t;

typedef struct word_struct_tag
{
	U32 mode_flag;
	U32 parse_flags;
	U32 lts_flags;
	U32 form_class;
	U16 data_index;
	U16 dict_index;
	U16 suff_index;
	U16 pron_flag;
	U8 dict_type;
	U8 dict_hit_type;
	U8 command_index;
	U8 num_commands;
	U8 homograph;
} word_struct_t;

#define MAIN_DICT_HIT		1
#define USER_DICT_HIT		2
#define FOREIGH_DICT_HIT	3
#define WORD_IS_HOMOGRAPH	0x01
#define HOMO_PRIMARY		0x02
#define HOMO_SECONDARY		0x04
#define MAX_WORDS			500
#endif // NEW_LTS

typedef struct index_info {
	U16 pos;
	S16 data[3];
} index_info_t;

#define PRO_OPEN_PAREN	0x00000001
#define PRO_CLOSE_PAREN	0x00000002
#define PRO_OPEN_QUOTE	0x00000004
#define PRO_CLOSE_QUOTE	0x00000008
#define PRO_DASH		0x00000010
#define PRO_CONJ		0x00000020
#define PRO_FUNC		0x00000040
#define PRO_PREP		0x00000080
#define PRO_THAT		0x00000100
#define PRO_MULTI_CONJ	0x00000200

#define PRO_OPT_BREAK	0x00400000
#define PRO_REQ_BREAK	0x00800000

/*
 * lts flags description
 */
#define LTS_FLAG_DONE			0x00000001
#define LTS_FLAG_HOMOGRAPH		0x00000006
#define LTS_FLAG_IS_PHONES		0x00000008
#define LTS_FLAG_DICT_HIT_TYPE	0x00000030


typedef struct LTS_TAG 
{
#if defined (VMS) || defined (LDS_BUILD)
	unsigned short	rpart;
#else
	U16  	rpart;
#endif

#if defined GERMAN || defined EPSON_ARM7
/* ifdef BACHUS_I_INCLUDED */
	wordgrammarinfo *bachus_wordgrammarinfo;    /* BACHUS REWT */
// eab updated for bts10187 new junk node
//	HPatterns	*bachus_trennung;	
#endif 

	GRAPH   graph[NGWORD];
	PHONE 	*pflp;           
	PHONE   *sylp[NSYL];    
	short   nsyl;                                   
	short   rsyl;                   
	short   psyl;                   
	short   lphone;
	unsigned char comp_str[128];
	unsigned char *str_vowel;

#ifdef SINGLE_THREADED
	index_info_t indexes[256];
	int num_indexes;
	int cur_index;
	int	first_pass;
	int pro_markers[256];
	int length;

	unsigned char input_array[500];
	int cur_input_pos;
	int cur_read_pos;	
#endif

#ifdef NEW_LTS
	word_struct_t word_info[MAX_WORDS];
	unsigned char word_data[500];
	command_data_t command_data[200];
	int		current_word_pos;
	U16		last_phones[20];
	int		last_phone_pos;
	int		num_words;
	int		end_of_sentence_found;
	int		cur_word_index;
#else
	U32 	fc_struct[256];
	int 	fc_index;
	int 	old_fc_index;
#endif

	short   wstate;
	PHONE   phead;
	short   fchar;
	short   schar;
	unsigned int no_pars;
	unsigned int  abbrev_look;
	int 	lflag;
	int 	isnumabr;
	ITEM    citem;                          /* Current item.                     */
	ITEM    nitem;                          /* Next item, for ls_task_lookahead. */
	LETTER  cword[NGWORD];                  /* Current word.                     */
	LETTER  nword[NGWORD];                  /* Next word, for ls_task_lookahead. */
	int 	tlflag;  
	int		sign;
	int		lbphone;
	int		rbphone;
	int   	pflag;
	unsigned int hit_type;

#if (defined ENGLISH && defined ACNA) || defined EPSON_ARM7
	char name[64];
	int name_size;
	struct	langs	lp[NO_LANGS];
#endif

	PHONE   pnode[NPNODE];                  /* Phoneme pool.                     */
	int namef; 							    /* this flag seems useless           */ 

#if defined SPANISH || defined EPSON_ARM7
    int ord;
    int flag; 
    short dic_offset;
    int got_quote;
#endif

#if defined FRENCH || defined EPSON_ARM7
	char precedent [80]; //contains the preceding word in ascii
	/* left string shorter than the current one */
	short PilSauv [LgPile];
	short PtPilSauv;  	/* first free in PilSauv */
	TypTamp Tamp;
	BYTE F_CodBl;  /* this must be defined before Ph1 and Ph2 */
	BYTE Ph1 [100];
	BYTE Ph2 [100];
  	FLAG  contgc;  /* current word is left context for next word */
#endif
} LTS_T;
typedef LTS_T *PLTS_T;
typedef LTS_T **PPLTS_T;
  
/* GL 04/21/1997  change this for OSF build */
#ifdef MSDOS
typedef struct share_data far *PKSD_T;
struct TTS_HANDLE_TAG
{
	PKSD_T	pKernelShareData;
	PLTS_T	pLTSThreadData;
}; 
typedef struct TTS_HANDLE_TAG  *LPTTS_HANDLE_T;
#endif /* #ifdef MSDOS */

#endif // LS_DATAH
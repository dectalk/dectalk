#ifndef VOCAL
/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    (c) Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *    File Name:	par_pars.c
 *    Author:       Matthew Schnee
 *    Creation Date:04/08/96
 *
 *    Functionality:
 * 		Text preprocessor main file
 *
 ***********************************************************************
 *    Revision History:                    
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	---------------------------------------
 *	001	MGS		04/23/1996	Some of the parser is working, 
 *							added par_print_rule_error for debugging
 *	002	MGS		04/23/1996	All actions except optional work
 *							character types sizes with commas work 
 *							exact character matching and save and replace work
 *	003	MGS		04/25/1996	Added save state code, lots-o-bug fixes
 *	004	MGS		04/30/1996	fixed about 6 bugs: L<*>, compund rules, recursive rules, L<3-*>
 *	005	MGS		05/01/1996	more work for optional, STOP to defines, changed every '/' to define
 *	006	MGS		05/02/1996	moved par_match_string code for normal string matching to a function.  
 *	007	MGS		05/06/1996	Digit ranges work, lookahead is well under way
 *	008	MGS		05/06/1996	only digit ranges with one range i.e. D[4-20] work
 *	009	MGS		05/07/1996	Digit ranges of any kind are working
 *	010	MGS		05/08/1996	Look ahead for exact charcters works, 
 * 							par_match_standard has been rewritten, 
 *							ends of string have been dealt with better
 *	011	MGS		05/08/1996	optional is now tested with an optional exact string
 *							lookahead workd for most character types
 *	012	MGS		05/08/1996	optional is now tested with an optional exact string
 *							and with 1 level of nested states
 *	013	MGS		05/09/1996	Added par_match_set and par_match_sets_and_ranges for set S{}<> support
 *	014	MGS		05/10/1996	Sets work, sets of all types and conditional replacements of sets work.
 *	015	MGS		05/13/1996	Modes, Languages, Hit and Miss rules have been added
 *	016	MGS		05/13/1996	Save_char_type has been added to par_get_char_type
 *	017	MGS		05/15/1996	Rule table has been moved to par_rule.h
 *	018 MGS     05/24/1996	Optional now fails correctly on the end of a string
 *	019 MGS     05/24/1996	look_ahead fails if the string was of 0 length
 *	020	MGS		05/24/1996	Lookahead was called on the currrent character but 
 *							should have been called on the next character
 *	021 MGS     06/23/1996	Changed the ambiguity table to support the ~ operator
 *	022 MGS     06/23/1996	Changed match_string, match_digits, match_standard and match_sets_with_ranges 
 *                          to support faster look_ahead processing
 *	023 MGS     06/24/1996	Added the dictionary searching for incoming words
 *                          DM  process if dictionary miss
 *                          DH  process if dictionary hit
 *	024 MGS     06/24/1996	added character types VOWEL_NON_Y and PUNCT_SOME
 *                          they are 'Y' and 'T' respectively 
 *	025	MGS		06/25/1996	Added GM# anf GH#, subroutine callling from the hit or miss of a rule
 *							The subroutine hit/miss (GH/GM) is called before the hit/miss (H/M) rule
 *	026	MGS     07/01/1996	Added rule Macros, syntax p/R##/
 *	027	MGS		07/10/1996	Added domain dictionary searching to the parser
 *							h/dict_name,matching/hit_action|miss_action/
 *	028	MGS		07/12/1996	Added word state w/matching/
 *	029	MGS     07/19/1996	Fixed a bug with sets and more than 1 match
 *                          the length was returned wrong
 *	030	MGS     07/23/1996	Fixed another bug with sets and multiple matching
 *                          the character matched before the min was always the first chracter
 *                          not the following characters 
 *	031	MGS		07/26/1996	Updated to use the binary rule file
 *	032	MGS		07/26/1996	Moved the rule file to par_rule.c and added extern's for the variables
 *	033	MGS		07/29/1996	Cleaned up and added missing headers
 *	034	MGS     08/06/1996  Fixed a bug in set matching involving a set that matches nothing
 *                          a thing that has no length but is successful at matching that
 *                          thing.  it used to return a failure, but now it succeedes.
 *	035	MGS		08/08/1996	Added new indexing code, affected functions
 *							par_process_input, par_skip_white_space, par_copy_string_data
 *							par_copy_word_to_output, par_replace_string, par_delete_string
 *							par_insert_string_before, par_match_rule, par_perform_action
 *							functiions in command that were changed
 *							cm_text_getclause, cm_util_initialize, cm_cmd_match_command
 *							cm_cmd_index, cm_cmd_build_param
 *	036	MGS		08/14/1996	Added code so hit rule would only have to move the entire array over
 *							to the right if there wasn't enough room to put the data closer to the
 *							front of the array
 *	037	SIK		10/10/1996  Added VOCAL ifndef to support VOCAL build
 *	038	GL		10/25/1996	initialize the index_counter
 *	039	GL		02/08/1997	Added STATUS_STATE and releated code.
 *	040	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 *	041	GL		04/21/1997	BATS#360  remove spaces before "#define" or "#if" 
 *	042	TQL		05/02/1997	Removed form-feed characters.  Needed for stipper to work properly.
 *	043	MGS		08/22/1997	BATS #449 (long words)
 *	044	MGS		09/24/1997	BATS#469 Fix for NWS parser problem
 *	045	MGS		04/06/1998	Fixed problem with macro state
 *	046	MGS		04/05/1998	Added Copy Hit rule tag to the code
 *	047	GL		04/16/1998	reset the debug switch for rule number calculation
 *	048	MGS		06/08/1998	Added code for german compound nouns and parser file loading
 *	049	MGS		06/11/1998	Made the forst letter of any words that get broken apart by 
 *							the compound noun breaker code to be capatilized 
 *	050	MGS		06/15/1998	Made the compound breaker put a - between the words so lts 
 *							could put the compound noun markers there.
 *	051	ETT		10/12/1998	Added some linux stuff, changes for data union change
 *							in compnoun.h
 *	052	MGS		11/09/1998	Added debug 8200 code for rules tested
 *	053	MGS		03/03/1998	BATS 874 fixed word state 
 *	054	MGS		06/02/1999	BATS 895 Fixed problem with spanish phone numbers with 9 
 *	055	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
 *	056	MGS		04/05/2000	fixed problem with "this is com2" pronounced as "this is c om 2" with indexing
 *	057	NAL		06/12/2000	Warning removal
 *	058	CAB		10/16/2000	Changed copyright info
 *	059	MFG		12/21/2000	fixed Windows CE warning 
 *	060	MFG		01/16/2001	omited Wince 300 from Windows CE warning 
 *  061	MGS		05/09/2001	Some VxWorks porting BATS#972
 *  062	MGS		05/21/2001	More VxWorks porting BATS#972
 * 	063	MGS		06/19/2001	Solaris Port BATS#972
 *	064	MGS		02/22/2002	Added Abbreviation processing
 *	065	MGS		04/11/2002	ARM7 port
 *	066	CAB		05/20/2002	Removed warning by typecast
 */

/*
 *	ToDo list in the parser
 *		1.	the ability to shuffle save a string that is built with par_build_string_from_rule
 *		2.	implementing output array bounds checking
 *		3.	implementing new_input array bounds checking
 *		4.	Adding the capability to par_match_standard and par_match_digits so par_look_ahead can
 * 			be performed from sets, not to sets
 *				(this can be done, but the decision was made to not do it for speed considerations)
 *      5.	conditional processing of rules from sets or digit ranges
 *		6.	compliments of sets with a specified universe.... or a set with a removed item
 *          set operations like intersection and union deletion addition 
 *											
 */
#ifndef PARSER_STANDALONE_DEBUG

#ifdef WIN32
#include <windows.h>
#include "tts.h"
#endif

/* GL 04/21/1997  add this for OSF build */
#ifdef __osf__
#include "tts.h"
#endif
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include <stdlib.h>
#include "tts.h"
#endif
#ifdef ARM7
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "tts.h"
#endif

void cm_util_flush_init(LPTTS_HANDLE_T); // NAL warning removal

#endif /* PARSER_STANDALONE_DEBUG */

#ifdef PARSER_STANDALONE_DEBUG
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

#if defined (WIN32) && defined (PRINTFDEBUG)
#include "dbgwins.h"
#define printf WINprintf
#endif 


struct kernel_share
{
	long modeflag;
	long lang_curr;
	unsigned short debug_switch;
};                                                      

#ifdef TIMING
#include <time.h>
#endif

typedef struct kernel_share *PKSD_T;	
typedef struct kernel_share KSD_T;

KSD_T Ksd_t;
PKSD_T pKsd_t;

#include "port.h"
#include "par_def.h"

#ifdef GERMAN_COMPOUND_NOUNS
#include "compnoun.h"
#endif

#else    /* #ifdef PARSER_STANDALONE_DEBUG */

#ifdef VXWORKS
#include <ctype.h>
#endif

#include <stdlib.h>
#include <string.h>
#include <limits.h>

#include "defs.h"
#include "port.h"
#include "kernel.h"
#include "dectalk.h"
#include "cm_defs.h"
#include "par_def.h"

#ifdef GERMAN_COMPOUND_NOUNS
#include "compnoun.h"
#endif

#include "cm_data.h"
#endif // PARSER_STANDALONE_DEBUG

#ifndef NULL
#define NULL ((void *)0)
#endif

//#define DISPLAY_RULES_HIT
//#define PARSER_DEBUG       
//#define LOOK_DEBUG
//#define DIGIT_DEBUG
//#define INDEX_DEBUG
//#define NEW_DEBUG
//#define DEBUG_RULES



/* the externs from the rule table */
extern const int num_rule_sections;
extern const int rule_sections[];
extern const int num_rules;
extern const int rule_index_table[];
extern const unsigned char rule_data_table[];
extern const dict_pointers_t dict_point[];
extern const int dict_index_table[];
extern const unsigned char dict_data_table[];

/* from par_char.c */
extern const unsigned short parser_char_types[];
extern const unsigned char par_lower[];
extern const unsigned char par_upper[];

#ifdef GERMAN_COMPOUND_NOUNS
/* from comp_dict.h or comp_dummy.h */
extern const int noun_num_character_in_mapping;
extern const int noun_character_mapping_table[];
extern const int noun_number_of_conjunctions;
extern const comp_noun_conjunction noun_conjunction[];
extern const int noun_index_table[];
extern const char noun_data_table[];
#endif

const unsigned int char_type_table[16] = {
	TYPE_null,
	TYPE_alpha_num,
	TYPE_alpha,
	TYPE_any_char,
	TYPE_clause,
	TYPE_consonant,
	TYPE_lower,
	TYPE_non_alpha,
	TYPE_number,
	TYPE_punct_some,
	TYPE_punct,
	TYPE_upper,
	TYPE_vowel,
	TYPE_vowel_non_y,
	TYPE_white,
	TYPE_digit
};

#ifdef UNDER_CE
#if	(UNDER_CE == 200) || (UNDER_CE == 211)
_stricmp(const char *, const char *);
#endif
#endif

/* ******************************************************************
 *      Function Name:_stricmp()
 *
 *      Description: 
 *
 *      Arguments:
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
#if defined VXWORKS || defined ARM7
int _stricmp(const char *string1, const char *string2)
{
	int cnt;

	for (cnt = 0; cnt < ((int)strlen(string1)); cnt++) 
	{
		if (toupper(string1[cnt]) != toupper(string2[cnt]))	return 1;
	}
	if (cnt != ((int)strlen(string2)))		return 1;
	return 0;
}
#endif


/* function prototypes */ 
int par_match_set(unsigned char *current_rule,
					unsigned char *input_array,
					int rule_p,
					int sect_p,
					int ipos,
					pmatch_arrays_t match_array,
					prange_value_t range_value,
					preturn_value_t ret_value,
					int lookahead);
int par_match_sets_with_ranges(unsigned char *current_rule,
							   unsigned char *input_array,
							   pmatch_arrays_t match_array,
							   preturn_value_t ret_value,
							   prange_value_t range_value,
							   int lookahead,
							   int break_on_min_match);
int par_match_digits(unsigned char *current_rule,
					 unsigned char *input_array,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value,
					 prange_value_t range_value,
					 int lookahead,
					 int break_on_min_match);
int par_match_standard(unsigned char *current_rule,
					   int char_type,
					   unsigned char *input_array,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   int lookahead,
					   int break_on_min_match);
#ifdef PARSER_DEBUG
void par_copy_return_value(preturn_value_t dest, 
						   preturn_value_t src);
#endif
void par_print_rule_error(char *message,
						  unsigned char *current_rule,
						  int pos);
int par_copy_word_to_output(unsigned char *input_array,
							unsigned char *output_array,
							pindex_data_t input_indexes,
							pindex_data_t output_indexes,
							preturn_value_t ret_value);
int par_skip_white_space(unsigned char *input_array,
						 pindex_data_t input_indexes,
						 unsigned char *output_array, 
						 pindex_data_t output_indexes,
						 preturn_value_t ret_value);
int par_look_ahead(register unsigned char *current_rule,
					 unsigned char *input_array,
					 register int ipos,
					 int find_type,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value);
int par_get_int_length(register int i);
int par_convert_number_new2(unsigned char *string);
void par_copy_string_data(unsigned char *input_array,
						  pindex_data_t input_indexes,
						  unsigned char *output_array,  
						  pindex_data_t output_indexes,
						  int num_chars,
						  preturn_value_t ret_value);
int par_match_string(register unsigned char *current_rule,
					 int char_type,
					 unsigned char *input_array,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value,
					 prange_value_t range_value,
					 int lookahead,
					 int break_on_min_match);
unsigned char *par_build_string_from_rule(unsigned char *current_rule,
										  unsigned char *buf,
										  unsigned char *output_array,
										  pmatch_arrays_t match_array,
										  preturn_value_t ret_value,
										  prange_value_t range_value,
										  int state,
										  int *length,
										  int in_rule_index);
void par_status_string(unsigned char *current_rule,
					   unsigned char *input_array,
					   unsigned char *output_array,
					   pindex_data_t input_indexes,
					   pindex_data_t output_indexes,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   prange_value_t range_value,
					   int save_num,
					   int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_check_word_string(unsigned char *current_rule,
						   unsigned char *input_array,
						   unsigned char *output_array,
						   pindex_data_t input_indexes,
						   pindex_data_t output_indexes,
						   pmatch_arrays_t match_array,
						   preturn_value_t ret_value,
						   prange_value_t range_value,
						   int save_num,
						   int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_save_string(unsigned char *current_rule,
					 unsigned char *input_array,
					 unsigned char *output_array,
					 pindex_data_t input_indexes,
					 pindex_data_t output_indexes,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value,
					 prange_value_t range_value,
					 int save_num,
					 int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_insert_string_before(unsigned char *current_rule,
							  unsigned char *input_array,
							  unsigned char *output_array,
							  pindex_data_t input_indexes,
							  pindex_data_t output_indexes,
							  pmatch_arrays_t match_array,
							  preturn_value_t ret_value,
							  prange_value_t range_value,
							  int save_num,
							  int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_insert_string_after(unsigned char *current_rule,
							 unsigned char *input_array,
							 unsigned char *output_array,
							 pindex_data_t input_indexes,
							 pindex_data_t output_indexes,
							 pmatch_arrays_t match_array,
							 preturn_value_t ret_value,
							 prange_value_t range_value,
							 int save_num,
							 int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_insert_string(unsigned char *current_rule,
					 unsigned char *input_array,
					 unsigned char *output_array,
					 pindex_data_t input_indexes,
					 pindex_data_t output_indexes,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value,
					 prange_value_t range_value,
					 int save_num,
					 int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
#ifdef GERMAN_COMPOUND_NOUNS
void par_compound_break(unsigned char *current_rule,
					   unsigned char *input_array,
					   unsigned char *output_array,
					   pindex_data_t input_indexes,
					   pindex_data_t output_indexes,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   prange_value_t range_value,
					   int save_num,
					   int dict_state_flag,
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_replace_string(unsigned char *current_rule,
						unsigned char *input_array,
						unsigned char *output_array,
						pindex_data_t input_indexes,
						pindex_data_t output_indexes,
						pmatch_arrays_t match_array,
						preturn_value_t ret_value,
						prange_value_t range_value,
						int save_num,
						int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_delete_string(unsigned char *current_rule,
					   unsigned char *input_array,
					   unsigned char *output_array,
					   pindex_data_t input_indexes,
					   pindex_data_t output_indexes,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   prange_value_t range_value,
					   int save_num,
					   int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
int par_search_for_word(unsigned char *input,
						  int input_length,
						  unsigned char *output,
						  int dict_num,
						  int dict_state_flag);
int par_look_ahead_dictionary(
							  unsigned char *current_rule,
							  unsigned char *input_array,
							  pmatch_arrays_t match_array,
							  preturn_value_t ret_value);
void par_dom_dict_search(unsigned char *current_rule,
					 unsigned char *input_array,
					 unsigned char *output_array,
					 pindex_data_t input_indexes,
					 pindex_data_t output_indexes,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value,
					 prange_value_t range_value,
					 int dict_num,
					 int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index);
#else
					   int in_rule_index,
					   int insert_operation_flags);
#endif
void par_perform_action(unsigned char *current_rule,
						int state,
						unsigned char *input_array,
						unsigned char *output_array,
						pindex_data_t input_indexes,
						pindex_data_t output_indexes,
						pmatch_arrays_t match_array,
						preturn_value_t ret_value,
						prange_value_t range_value,
						int save_num,
						int dict_state_flag,
						int in_rule_index);
void par_match_rule(unsigned char *current_rule,
					int state,
					unsigned char *input_array,
					unsigned char *output_array,
					pindex_data_t input_indexes,
					pindex_data_t output_indexes,
					pmatch_arrays_t match_array,
					preturn_value_t ret_value,
					int dict_state_flag);
__inline void par_copy_index(pindex_data_t dest_index,
							 int		   dest_pos,
							 pindex_data_t src_index,
							 int		   src_pos);
__inline void par_copy_index_list(pindex_data_t dest_index,
								  int		   dest_pos,
								  pindex_data_t src_index,
								  int		   src_pos,
								  int		   length);
__inline int par_is_index_set(pindex_data_t indexes,
								int pos);
__inline void par_set_return_level(int *return_rule,
								   int *return_level,
								   int go_rule);
__inline int par_get_return_level(int *return_rule,
									int *return_level,
									int current_rule_number);


void ERROR_func1(unsigned char *current_rule,
				 unsigned char *input_array,
				 unsigned char *output_array,
				 pindex_data_t input_indexes,
				 pindex_data_t output_indexes,
				 pmatch_arrays_t match_array,
				 preturn_value_t ret_value,
				 prange_value_t range_value,
				 int save_num,
				 int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index,
					   int insert_operation_flags)
#endif
{
	strcpy(output_array+ret_value->output_pos,"I am a pud-fart. ");
	ret_value->output_offset=strlen("I am a pud-fart. ");
	return;
}

void ERROR_func2(unsigned char *current_rule,
				 unsigned char *input_array,
				 unsigned char *output_array,
				 pindex_data_t input_indexes,
				 pindex_data_t output_indexes,
				 pmatch_arrays_t match_array,
				 preturn_value_t ret_value,
				 prange_value_t range_value,
				 int save_num,
				 int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index,
					   int insert_operation_flags)
#endif
{
	return;
}

const void (*(perform_action_funcs[0x20]))(unsigned char *current_rule,
									 unsigned char *input_array,
									 unsigned char *output_array,
									 pindex_data_t input_indexes,
									 pindex_data_t output_indexes,
									 pmatch_arrays_t match_array,
									 preturn_value_t ret_value,
									 prange_value_t range_value,
									 int save_num,
									 int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
									 int in_rule_index) = {
#else
									 int in_rule_index,
									 int insert_operation_flags) = {
#endif
	/* 0x00 */	ERROR_func2,	
	/* 0x01 */	ERROR_func1,	
	/* 0x02 */	ERROR_func1,	
	/* 0x03 */	ERROR_func1,	
	/* 0x04 */	ERROR_func1,	
	/* 0x05 */	ERROR_func1,	
	/* 0x06 */	ERROR_func1,	
	/* 0x07 */	ERROR_func1,	
	/* 0x08 */	ERROR_func1,	
	/* 0x09 */	ERROR_func1,	
	/* 0x0A */	ERROR_func1,	
	/* 0x0B */	ERROR_func1,	
	/* 0x0C */	ERROR_func1,	
	/* 0x0D */	ERROR_func1,	
	/* 0x0E */	ERROR_func1,	
	/* 0x0F */	ERROR_func1,	
	/* 0x10 */	ERROR_func1,	
	/* 0x11 */	ERROR_func1,	
	/* 0x12 */	ERROR_func1,	
	/* 0x13 */	ERROR_func1,	
	/* 0x14 */	ERROR_func2,	
	/* 0x15 */	par_delete_string,	
	/* 0x16 */	ERROR_func2,	
	/* 0x17 */	par_save_string,	
	/* 0x18 */	ERROR_func2,	
	/* 0x19 */	par_replace_string,	
	/* 0x1A */	par_insert_string,	
#ifndef GERMAN_COMPOUND_NOUNS
	/* 0x1B */	par_insert_string_after,	
	/* 0x1C */	par_insert_string_before,	
#else
	/* 0x1B */	par_compound_break,	
	/* 0x1C */	ERROR_func2,	
#endif
	/* 0x1D */	par_dom_dict_search,	
	/* 0x1E */	par_status_string,	
	/* 0x1F */	par_check_word_string
};



#ifdef PARSER_STANDALONE_DEBUG
preturn_value_t par_process_input(PKSD_T pKsd_t,
#else
								  preturn_value_t par_process_input(LPTTS_HANDLE_T phTTS,
#endif
                                  unsigned char *input_array, 
                                  unsigned char *new_input,
                                  unsigned char *output_array,                                  
                                  unsigned char *dict_hit_array,
                                  pindex_data_t input_indexes,
                                  pindex_data_t	new_input_indexes,
                                  pindex_data_t	output_indexes,
                                  U32 in_lang_flag,
                                  U32 in_mode_flag,
                                  int rule,
                                  int go_until,
								  pmatch_arrays_t match_array,
                                  preturn_value_t ret_value);
__inline void par_initialize_arrays(pmatch_arrays_t match_arrays);

#ifdef PARSER_STANDALONE_DEBUG
void par_initialize_variables(unsigned char *input_array,
							  unsigned char *output_array,
							  unsigned char *dict_hit_array);
void par_print_output(unsigned char *output_array,
					  pindex_data_t output_indexes);
int par_read_input(unsigned char *input_array); 

/* ******************************************************************
 *      Function Name: main()
 *
 *      Description: 
 *
 *      Arguments:
 *
 *      Return Value: int
 *
 *      Comments: It is here for the testing only version of the text parser
 *
 * *****************************************************************/
int main(void)
{
	unsigned char input_array[PAR_MAX_INPUT_ARRAY];			/* the input array */
	unsigned char new_input_array[PAR_MAX_INPUT_ARRAY];		/* the input array */
	unsigned char output_array[PAR_MAX_OUTPUT_ARRAY];		/* the ouput array */
	unsigned char dict_hit_array[PAR_MAX_INPUT_ARRAY];		/* the dictionar hit array */
	index_data_t input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t new_input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t output_indexes[PAR_MAX_OUTPUT_ARRAY];
#ifdef SET_INDEXES
	int i,j,k;
#endif
#ifdef TIMING
	int start,end;
#endif
	match_arrays_t 		match_array; /* this is 300 bytes, maybe it should be passed instead of allocated */
	
	
#ifndef NEW_PARSER_FILE_LOADING
	return_value_t	ret_value = { 0,0,0,0,0,0,0,0  };                           
#else
	return_value_t	ret_value = { 0,0,0,0,0,0,0,0 ,NULL };                           
#endif	

	pKsd_t= &Ksd_t;
	pKsd_t->modeflag=0x55555555;
	pKsd_t->lang_curr=0xAAAAAAAA;
	
	
#ifdef PARSER_DEBUG
	printf("entering	\n");
#endif
	memset(input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
	memset(new_input_array,0,PAR_MAX_INPUT_ARRAY);
	par_initialize_variables(input_array,output_array,dict_hit_array);		/* initialize the variables */
#ifdef TIMING
	start=clock();
	fprintf(stderr,"start clock=%d\n",start);
#endif
	while (par_read_input(input_array))			            /* read the input from the keyboard */
	{                                       			
#ifdef SET_INDEXES
		for (i=0,j=1;i<(int)strlen(input_array);i++)
		{
			if (input_array[i]==' ')
			{
				for (k=strlen(input_array);k>(i+1);k--)
				{
					input_array[k]=input_array[k-1];
				}				 
				input_array[i+1]=PAR_INDEX_DUMMY_CHAR;
				input_indexes[i+1].index[0]=j%10+'0';
				j++;
			}
		}
#endif		
		/* 
		*	this is the actual parser function.  it expects pointers to the input array
		*	and the output array, the starting rule number, a parameter about how far to parse,
		*	and a pointer to a return value strucutre 
		*/
		memset(&ret_value,0,sizeof(return_value_t));
		par_process_input(pKsd_t,input_array,new_input_array,output_array,dict_hit_array,input_indexes,new_input_indexes,output_indexes,0x00000048,0x00000020,0,0,&match_array,&ret_value);
		output_array[ret_value.output_offset]='\0';
#ifndef SINGLE_PRINT
#ifndef NO_PRINT
		par_print_output(output_array,output_indexes);
#endif
#endif
#ifndef SINGLE_CALL
		memset(input_array,0,PAR_MAX_INPUT_ARRAY);
		memset(new_input_array,0,PAR_MAX_INPUT_ARRAY);
        memset(new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
        
		strcpy(input_array,output_array);
		par_copy_index_list(input_indexes,0,output_indexes,0,strlen(output_array));
		
		memset(output_array,0,PAR_MAX_OUTPUT_ARRAY);
		memset(&ret_value,0,sizeof(return_value_t));
		memset(output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
		
		par_process_input(pKsd_t,input_array,new_input_array,output_array,dict_hit_array,input_indexes,new_input_indexes,output_indexes,0x00000048,0x00000002,1,0,&match_array,&ret_value);
#ifndef SINGLE_PRINT
#ifndef NO_PRINT
		par_print_output(output_array,output_indexes);						/* print the results of the matching */
#endif
#endif // SINGLE_PRINT
		
		memset(input_array,0,PAR_MAX_INPUT_ARRAY);
		memset(new_input_array,0,PAR_MAX_INPUT_ARRAY);
        memset(new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
        
		strcpy(input_array,output_array);
		par_copy_index_list(input_indexes,0,output_indexes,0,strlen(output_array));
		
		memset(output_array,0,PAR_MAX_OUTPUT_ARRAY);
		memset(&ret_value,0,sizeof(return_value_t));
		memset(output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
		
		par_process_input(pKsd_t,input_array,new_input_array,output_array,dict_hit_array,input_indexes,new_input_indexes,output_indexes,0x00000048,0x00000FFF,2,0,&match_array,&ret_value);
#ifndef NO_PRINT
		par_print_output(output_array,output_indexes);						/* print the results of the matching */
#endif
#endif // SINGLE_CALL
		memset(new_input_array,0,PAR_MAX_INPUT_ARRAY);
		memset(input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
		memset(new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
		memset(output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
		par_initialize_variables(input_array,output_array,dict_hit_array);	/* reinit the arrays */
	}     
#ifdef TIMING
	end=clock();
	fprintf(stderr,"start clock=%d\n",start);
	fprintf(stderr,"end   clock=%d\n",end);
	fprintf(stderr,"difference =%d\n",end-start);
	fprintf(stderr,"seconds =%6.3f\n",(double)(end-start) / CLOCKS_PER_SEC);
#endif
#ifdef PARSER_DEBUG
	printf("leaving main\n");
#endif
	return(0);
}

int par_read_input(unsigned char *input_array)	/* read input from the keyboard */
/* this is temporary */
{
#ifdef PARSER_DEBUG
	printf("entering par_read_input\n");
#endif
	if ((fgets(input_array,PAR_MAX_INPUT_ARRAY-1,stdin))==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_read_input 0\n");
#endif
		return(0);
	}
	input_array[strlen(input_array)-1]='\0';
#ifdef PARSER_DEBUG
	printf("leaving par_read_input 1\n");
#endif
	return(1);
}
void par_print_output(unsigned char *output_array,pindex_data_t output_indexes)	/* display the output */
/* this is temporary */
{
#ifdef SET_INDEXES
#ifdef PRINT_INDEXES
	int i;
#endif
#endif
	printf("%s\n",output_array);
#ifdef SET_INDEXES
#ifdef PRINT_INDEXES
	for (i=0;i<(int)strlen(output_array);i++)
	{
		if (output_indexes[i].index[0]!='\0')
		{
			printf("%c",output_indexes[i].index[0]);
		}
		else
		{
			printf(".");
		}
	}
	printf("\n");
#endif
#endif	
}

/* ******************************************************************
 *	Function Name:
 *		par_initialize_variables()
 *
 *	Description:
 *		this function initializes the input and output arrays
 *
 *	Arguments:                                 
 *		I/O		unsigned char *input_array		The input array;
 *		I/O		unsigned char *output_array		The output array
 *		I/O		unsigned char *dict_hit_array	the dictionary hit array
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *
 * *****************************************************************/
/* initialize the input and output arrays used in the matching */
void par_initialize_variables(unsigned char *input_array, unsigned char *output_array, unsigned char *dict_hit_array)
{
#ifdef PARSER_DEBUG
	printf("entering par_initialize_variables\n");
#endif
	memset(input_array,0,PAR_MAX_INPUT_ARRAY);
	memset(output_array,0,PAR_MAX_OUTPUT_ARRAY);
	memset(dict_hit_array,0,PAR_MAX_INPUT_ARRAY);
#ifdef PARSER_DEBUG
	printf("leaving par_initialize_variables\n");
#endif
}                             
#endif /* #ifdef PARSER_STANDALONE_DEBUG */

/* ******************************************************************
 *	Function Name:
 *		par_initialize_arrays()
 *
 *	Description:	
 *		This function initializes the temporary matching arrays for shuffle
 *
 *	Arguments:
 *		INPUT/OUTPUT	match_arrays	the structure of arrays for shuffle
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *
 * *****************************************************************/
__inline void par_initialize_arrays(pmatch_arrays_t match_arrays)
{                               
#ifdef PARSER_DEBUG
	printf("entering par_initialize_arrays\n");
#endif
	memset(match_arrays,0,sizeof(match_arrays_t));

#ifdef PARSER_DEBUG
	printf("leaving par_initialize_arrays\n");
#endif
}

/* ******************************************************************
 *	Function Name:
 *		par_process_input()
 *
 *	Description:
 *		this is the top level text processing function in the matching
 *
 *	Arguments:
 *		INPUT	unsigned char *input_array		The array with the input string
 *		OUTPUT	unsigned char *output_array		The array where the output goes
 *		INPUT	short	lang_flag				The value of the language flag that is going to be used
 *		INPUT	short	mode_flag				The value of the mode flag that is going to be used
 *		INPUT	short 	rule					The first rule to process section
 *		INPUT	short   go_until				If it is 0 process to the end of the input
 *												If it is 1 process 2/3 of the input
 *		OUTPUT	preturn_value_t	ret_value		The strucutre used for returning the positions 
 *												of the input and output arrays already processed
 *
 *	Return Value:
 *		preturn_value_t		a pointer to the ret_value strucuture passed
 *
 *	Comments:                       
 *		This function currently does not check for overrunning the output array with data
 *		
 *
 * *****************************************************************/
#ifdef PARSER_STANDALONE_DEBUG
preturn_value_t par_process_input(PKSD_T pKsd_t,
#else
								  preturn_value_t par_process_input(LPTTS_HANDLE_T phTTS,
#endif
                                  unsigned char *input_array, 
                                  unsigned char *new_input,
                                  unsigned char *output_array,                                  
                                  unsigned char *dict_hit_array,
                                  pindex_data_t input_indexes,
                                  pindex_data_t	new_input_indexes,
                                  pindex_data_t	output_indexes,
                                  U32 in_lang_flag,
                                  U32 in_mode_flag,
                                  int rule,
                                  int go_until,
								  pmatch_arrays_t match_array,
                                  preturn_value_t ret_value)
{
/* 
 *	this structure holds the information about where the
 *	current search left off in the search of the array
	*/
	/* GL 02/08/1997  add one more item for parser_flag */
#ifndef NEW_PARSER_FILE_LOADING
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0 }; 
	return_value_t		hit_ret = { 0,0,0,0,0,0,0,0 }; 
	return_value_t		save_ret = { 0,0,0,0,0,0,0,0 };
#else
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,NULL }; 
	return_value_t		hit_ret = { 0,0,0,0,0,0,0,0,NULL }; 
	return_value_t		save_ret = { 0,0,0,0,0,0,0,0,NULL };
#endif
	U8 *		 		current_rule;	/* a pointer to the current rule */
#if (defined DISPLAY_RULES_HIT) || !(defined PARSER_STANDALONE_DEBUG)
	unsigned int		current_rule_R_value=0;
#endif
	int 				cur_rule_next_hit;
	int					cur_rule_next_miss;
	int					cur_rule_next_go_hit;
	int					cur_rule_next_go_miss;
	int					cur_rule_copy_hit;
	unsigned int		current_value;
	int  				done=0;
	int 				i;
	int					j;
	int					k;
	int					last_rule_was_hit=0;
	int 				current_rule_number=0;
	int					return_rule[PAR_MAX_RETURN_LEVEL];
	int					return_level=0;
	int					input_length=0;
	int					new_input_diff=0;
	int					input_size,output_size,size_diff;
	int					rule_p;
	int					temp,do_not_copy_next_word=0;
	U32 *				rule_modes;
	U16	*				rule_flags;
	
#ifndef PARSER_STANDALONE_DEBUG
	PCMD_T pCmd_t;
	PKSD_T  pKsd_t;
	pCmd_t=phTTS->pCMDThreadData;
	pKsd_t=phTTS->pKernelShareData;
#endif
	
#ifdef PARSER_DEBUG
	printf("entering par_process_input\n");
#endif
	new_ret.input_pos=ret_value->input_pos+ret_value->input_offset;	
	new_ret.input_offset=0;
	new_ret.output_pos=ret_value->output_pos+ret_value->output_offset;
	new_ret.output_offset=0;                 
	/* GL 02/08/1997 set the initial parser_flag value */
	new_ret.parser_flag = ret_value->parser_flag;
#ifdef NEW_PARSER_FILE_LOADING
#ifdef PARSER_STANDALONE_DEBUG
	new_ret.phTTS=NULL;
#else
	new_ret.phTTS=phTTS;
#endif
#endif
	
	if (rule>num_rule_sections)
	{
#ifndef ARM7_NOSWI
		printf("par_process_input; no such rule section %d\n",rule);
#endif
		strcpy(output_array,"Invalid rule section. ");
		return(ret_value);
	}
	memset(return_rule,-1,sizeof(return_rule));

	input_length=strlen(input_array);
	
	strcpy(new_input,input_array);
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	memcpy(new_input_indexes,input_indexes,input_length*sizeof(index_data_t));
#endif
	
	input_length=(input_length*2)/3; /* input_length * 2/3 */
	/* copy the input array to a temporary location for hit next rules */
    
    while (((new_input[new_ret.input_pos+new_ret.input_offset]!='\0') && (go_until==0)) ||    	   
    	   (((new_ret.input_pos+new_ret.input_offset-new_input_diff)<input_length) && (go_until==1) ) )
	{
#ifndef PARSER_STANDALONE_DEBUG
		/* checking cmd_flushing */
		if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
		{
			cm_util_flush_init(phTTS);
			return(&pCmd_t->ret_value);
		}              
#endif
		if (par_skip_white_space(new_input,new_input_indexes,output_array,output_indexes,&new_ret)== -1)
			/* skip whitespace between words */		
			/* copies one whitespace to the output array */
			/* if there is an index, an extra space may end up in the output */
		{
			done=1;
		}  	               
		par_copy_return_value(&save_ret,&new_ret);	/* save the values if the matching ends on a non white */
		current_rule=NULL;                     
		current_rule_number=rule_sections[rule];
		last_rule_was_hit=0;
#ifdef PARSER_DEBUG
		par_print_rule_error("par_process_input;1 the input is",new_input,new_ret.input_pos+new_ret.input_offset);
		par_print_rule_error("par_process_input;1 the output is",output_array,new_ret.output_pos+new_ret.output_offset);
#endif
		while (!done)
		{  	
#ifndef PARSER_STANDALONE_DEBUG
			/* checking cmd_flushing */
			if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
			{
				cm_util_flush_init(phTTS);
				return(&pCmd_t->ret_value);
			}              
#endif
			/* MGS commented out for speed */
			//			par_initialize_arrays(match_array);
//			memset(match_array->array_lengths,0,sizeof(match_array->array_lengths));
			// CAB	05/20/02	Removed warnings by typecast
			current_rule=(unsigned char*)&(rule_data_table[(rule_index_table[current_rule_number])]); /* this line will change for the new rule tables */
			rule_p=0;
#ifdef PARSER_DEBUG
			par_print_rule_error("par_process_input;2 the input is",new_input,new_ret.input_pos+new_ret.input_offset);
			par_print_rule_error("par_process_input;2 the output is",output_array,new_ret.input_pos+new_ret.output_offset);
#endif
			/* 
			* check for stop. if the last rule was a hit rule, 
			* put the old values for the input and output back
			*/
			rule_flags=(U16 *)current_rule;
			current_value=*rule_flags;
//			current_value=(*((U16 *)(current_rule)));
			if (current_value & BIN_SPECIAL_RULE_MASK)
			{
				switch (current_value & BIN_SPECIAL_RULE_MASK)
				{
				case BIN_STOP:
					done=1;
					/* 
					* potential bug if the matching is down a return level and 
					* encounters a stop, the return level is left in place and could start
					* to overwrite memory 
					*/
					return_level=0;
					if (last_rule_was_hit>0)
					{
						//new_ret.output_offset=hit_ret.output_offset;
						par_copy_return_value(&new_ret,&hit_ret);
					}
					continue;          
				case BIN_RETURN:
					current_rule_number=par_get_return_level(return_rule,&return_level,current_rule_number);
					continue;
				case BIN_GOTO:
//					current_rule_number=(*((U16 *)(current_rule+2)));
					current_rule_number=*(rule_flags+1);
					continue;
					/* put in goret and return here */
				case BIN_GORET:
					par_set_return_level(return_rule,&return_level,current_rule_number+1);
					current_rule_number=*(rule_flags+1);
// 					current_rule_number=(*((U16 *)(current_rule+2)));
					continue;
				default:
#ifndef ARM7_NOSWI
					printf("special rule value is out of range\n");
#endif
					break;
				}
				break;
			}
/* GL 04/16/98  add this for rule number caculation under debug mode */
/*              keep the debug setting for DISPLAY_RULES_HIT         */
#ifndef PARSER_STANDALONE_DEBUG
			if (DT_DBG(CMD_DBG,0x0010))
			{
				rule_p+=2; /* advance past the special rule value flags */
				current_rule_R_value=(*((U16 *)(current_rule+rule_p)));
				rule_p+=2;;
			}
			else
			{
				rule_p+=4;
			}
#endif
#ifdef DISPLAY_RULES_HIT
			rule_p+=2; /* advance past the special rule value flags */
			current_rule_R_value=(*((U16 *)(current_rule+rule_p)));
			rule_p+=2;;
//#else
//			rule_p+=4;
#endif

//			new_ret.rule=0;
			new_ret.value=FAIL;
//			i=0;
			/* check the language tag */
			/* get the language flag */
			rule_modes=(U32 *)(current_rule+rule_p);
#ifdef PARSER_DEBUG
			printf("the language flag is 0x%08X\n",*rule_modes);
#endif
			/* check the language flag against the kernel langauge flag for the correct langauage */
			
			if ((last_rule_was_hit==0) && (((*rule_modes) & in_lang_flag)==0))
			{
				current_rule_number++;	/* go to the next rule */
				if (current_rule_number>=num_rules)		
					done=1;
				continue;
			}                                          
			/* check the rule mode here */
#ifdef PARSER_DEBUG
			printf("the mode flag is 0x%08X\n",rule_modes[1]);
#endif
			/*	044	MGS		09/24/1997	BATS#469 Fix for NWS parser problem */
			if (last_rule_was_hit==0)
			{
				if ((rule_modes[1] != 0xFFFFFFFF) &&
					((rule_modes[1] & in_mode_flag)==0))	
				{
					current_rule_number++;	/* go to the next rule */
					if (current_rule_number>=num_rules)		
						done=1;
					continue;
				}
			}
			rule_p+=8;
			if ((current_value & (BIN_DICT_HIT | BIN_DICT_MISS)))
			{
				if ((current_value & BIN_DICT_HIT) && (current_value & BIN_DICT_MISS) &&
					(dict_hit_array[new_ret.input_pos+new_ret.input_offset]==DICT_ABBREV_VALUE))
				{
#ifdef PARSER_DEBUG
					printf("processing rule because of dictionary ABBREV on the word\n");
#endif			
				}
				else
				{	
					if ((current_value & BIN_DICT_HIT) && 
						(dict_hit_array[new_ret.input_pos+new_ret.input_offset]!=DICT_MISS_VALUE))
					{
#ifdef PARSER_DEBUG
						printf("processing rule because of dictionary HIT on the word\n");
#endif				
					}
					else
					{
						if ((current_value & BIN_DICT_MISS) && 
							(dict_hit_array[new_ret.input_pos+new_ret.input_offset]==DICT_MISS_VALUE))
						{
#ifdef PARSER_DEBUG
							printf("processing rule because of dictionary MISS on the word\n");
#endif
						}
						else
						{
							current_rule_number++;
							if (current_rule_number>=num_rules)		
								done=1;
							else
								done= -1;
						}
					}
				}
			} /* if (current_rule->dict_flag!=UNSET_PARAM) */
			if (done)
			{
				if (done<0)
					done=0;
				continue;
			}
			
			if (current_value & BIN_NEXT_HIT)
			{
				cur_rule_next_hit = *((U16 *)(current_rule+rule_p));
				rule_p+=2;
			}
			else
			{
				cur_rule_next_hit=-1;
			}
			if (current_value & BIN_NEXT_MISS)
			{
				cur_rule_next_miss = *((U16 *)(current_rule+rule_p));
				rule_p+=2;
			}
			else
			{
				cur_rule_next_miss=-1;
			}
			if (current_value & BIN_GORET_HIT)
			{
				cur_rule_next_go_hit = *((U16 *)(current_rule+rule_p));
				rule_p+=2;
			}
			else
			{
				cur_rule_next_go_hit=-1;
			}
			if (current_value & BIN_GORET_MISS)
			{
				cur_rule_next_go_miss = *((U16 *)(current_rule+rule_p));
				rule_p+=2;
			}
			else
			{
				cur_rule_next_go_miss=-1;
			}
			if (current_value & BIN_COPY_HIT)
			{
				cur_rule_copy_hit = *((U16 *)(current_rule+rule_p));
				rule_p+=2;
			}
			else
			{
				cur_rule_copy_hit=-1;
			}
			
#ifdef DEBUG_RULES
#ifdef PARSER_STANDALONE_DEBUG
			fprintf(stderr,"rule number is R%d\n",current_rule_R_value);
			fprintf(stderr,"next hit rule is %d\n",cur_rule_next_hit);
			fprintf(stderr,"next_miss_rule is %d\n",cur_rule_next_miss);
#else
			printf("rule number is R%d\n",current_rule_R_value);
			printf("next hit rule is %d\n",cur_rule_next_hit);
			printf("next_miss_rule is %d\n",cur_rule_next_miss);
#endif
#endif
			
			
#ifdef DISPLAY_RULES_TESTED
#ifdef OUTPUT_HITS_NORMAL
			printf("rule number is R%d\n",current_rule_R_value);
#else
			fprintf(stderr,"rule number is R%d\n",current_rule_R_value);
#endif
#endif
#ifndef PARSER_STANDALONE_DEBUG
			if (DT_DBG(CMD_DBG,0x0200))
			{
#ifndef ARM7_NOSWI
				printf("rule number is R%d\n",current_rule_R_value);
#endif
				//par_print_rule_error("input before match",new_input,new_ret.input_pos+new_ret.input_offset);
			}
#endif

			
#ifdef PARSER_DEBUG
			par_print_rule_error("par_process_input; before par_match_rule",current_rule,new_ret.rule);
#endif
			
#ifndef PARSER_STANDALONE_DEBUG
			/* checking cmd_flushing */
			if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
			{
				cm_util_flush_init(phTTS);
				return(&pCmd_t->ret_value);
			}              
#endif
			new_ret.rule=rule_p;
			par_match_rule(current_rule,BIN_END_OF_RULE,new_input,output_array,new_input_indexes,output_indexes,match_array,&new_ret,0);
			
#ifndef PARSER_STANDALONE_DEBUG
			/* checking cmd_flushing */
			if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
			{
				cm_util_flush_init(phTTS);
				return(&pCmd_t->ret_value);
			}              
#endif
			//printf("C parser_flag is %d\n",new_ret.parser_flag);
            /* GL 02/08/1997, set the parser_flag back to the caller */
			ret_value->parser_flag = new_ret.parser_flag;
			
			/* 
			* at this point in the matching, either a rule has hit and was processed or the 
			* current word has to be copied to the output 
			*/
			if (new_ret.value == SUCCESS)
			{         
				/*	check to be sure the matching left off at the end of a word */
				temp=new_ret.input_pos+new_ret.input_offset;
			//	temp1=parser_char_types[new_input[temp]];
				if (!((new_input[temp]=='\0') ||
				      ((parser_char_types[new_input[temp]] & (TYPE_white))!=0) ||
				      (((parser_char_types[new_input[temp]] & (TYPE_clause))!=0) &&
				       ((new_input[temp+1]=='\0') || 
				        (parser_char_types[new_input[temp+1]] & (TYPE_white))!=0)) ||
				      (((parser_char_types[output_array[new_ret.output_pos+new_ret.output_offset-1]] & (TYPE_white))!=0) &&
					   /*((parser_char_types[new_input[temp]] & (TYPE_white))==0) && */ (do_not_copy_next_word=1))					 
					 ))



/*				if (
					(
					 (new_input[new_ret.input_pos+new_ret.input_offset]!='\0') &&					
					 !(
					  ((parser_char_types[new_input[new_ret.input_pos+new_ret.input_offset]] & (TYPE_white))!=0)  ||
					  (
					   ((parser_char_types[new_input[new_ret.input_pos+new_ret.input_offset]] & (TYPE_clause))!=0) &&
					   ( 
					    (new_input[new_ret.input_pos+new_ret.input_offset+1]=='\0') ||
					    ((parser_char_types[new_input[new_ret.input_pos+new_ret.input_offset+1]] & (TYPE_white))!=0) 
					   )
					  )
					 )
					) 
				   )
*/
				{
					par_copy_return_value(&new_ret,&save_ret);
					if (cur_rule_next_go_miss!= -1)
					{
						if (cur_rule_next_miss!= -1)
						{
							par_set_return_level(return_rule,&return_level,cur_rule_next_miss);
							//return_rule[return_level++]=next_miss_rule;
						}
						else
						{
							par_set_return_level(return_rule,&return_level,current_rule_number+1);
							//return_rule[return_level++]=current_rule_number+1;
						}
						current_rule_number=cur_rule_next_go_miss;
						last_rule_was_hit= -1;
					}
					else
					{
						if (cur_rule_next_miss!= -1)	/* this is also a miss */
						{
							current_rule_number=cur_rule_next_miss;
							last_rule_was_hit= -1;				/* reset the last_rule_was_hit flag */
						}
						else
						{
							current_rule_number++;      		/* go to the next rule in the rule table */
							last_rule_was_hit=0;				/* reset the last_rule_was_hit flag */
						}
					}
					
				} /* if (((new_input[new_ret.input_pos+new_ret.input_offset]!='\0') && */
				else                      
				{
					/* here is where next hit rules have to be done */
					/* 	
					*	the amount of data that was writen o the output array if the difference 
					*	between new_ret.output_offset and save_ret.output_offset
					*	The amount of data read is the difference between new_ret.input_offset
					*	and save_ret.input_offset
					*/          
					/*  
					*	the data in the output starting at save_ret.output_offset has to be 
					*	copied into new_input starting at save_ret.input_offset
					*/ 
					/*	if the output is larger than the input, move the input over output-input characters
					*	if the output is the same size as the input, overwrite the input with the output
					*	if the output is smaller than the input, place the output input-output 
					*		characters to the right
					*/
					/* debug switch */
#ifndef PARSER_STANDALONE_DEBUG
					if (DT_DBG(CMD_DBG,0x0010))
					{
#ifndef ARM7_NOSWI
						printf("Rule hit:R%d\n",current_rule_R_value);
#endif
					}
#endif
#ifdef DISPLAY_RULES_HIT
#ifdef PARSER_STANDALONE_DEBUG
#ifdef OUTPUT_HITS_NORMAL
					fprintf(stderr,"H");
					printf("the rule hit was R%d\n",current_rule_R_value);
					printf("output array=%s\n",output_array);
#else
					fprintf(stderr,"the rule hit was R%d\n",current_rule_R_value);
					printf("output array=%s\n",output_array);
#endif
#else
					printf("the rule hit was R%d\n",current_rule_R_value);
#endif

#endif // DISPLAY_RULES_HIT
					 
/* ****************************** NOT USED **************************/
#if 0
					if (((parser_char_types[output_array[new_ret.output_pos+new_ret.output_offset-1]] & (TYPE_white))!=0) &&
					   ((temp1 & (TYPE_white))==0))
					{
						do_not_copy_next_word=1;
					}
#endif // 0
/* *****************************************************************/

					if (cur_rule_copy_hit!=-1)
					{
						last_rule_was_hit=1;
						current_rule_number=cur_rule_copy_hit;
						par_copy_return_value(&save_ret,&new_ret);
					}
					else

					if ((cur_rule_next_hit!= -1) || (cur_rule_next_go_hit!= -1))
					{
						par_copy_return_value(&hit_ret,&new_ret);
						input_size=new_ret.input_offset-save_ret.input_offset;
						output_size=new_ret.output_offset-save_ret.output_offset;
						if (output_size>input_size)
						{
#ifdef PARSER_DEBUG
							printf("par_process_input;the output is larger than the input\n");
#endif
							size_diff=output_size-input_size;
							/* should check for overrunning the new input array */
							/* copy the input to its new location */
#ifdef NEW_DEBUG
							par_print_rule_error("the input_array before moving, changing",new_input,new_ret.input_pos+new_ret.input_offset);
							par_print_rule_error("the output_array before moving, changing",output_array,new_ret.output_pos+new_ret.output_offset);
#endif
							
							if (save_ret.input_offset > size_diff)
							{
								memcpy(new_input+(save_ret.input_pos+save_ret.input_offset-size_diff),output_array+(save_ret.output_offset+save_ret.output_pos),output_size);
								/* copy the index data */
								// MGS 04/05/2000 fixed problem with "this is com2" pronounced as "this is c om 2" with indexing
								par_copy_index_list(new_input_indexes,(save_ret.input_pos+save_ret.input_offset-size_diff),output_indexes,(save_ret.output_offset+save_ret.output_pos),output_size);
								/* hit_ret.input_offset+=size_diff; */
								new_ret.input_offset=save_ret.input_offset-size_diff;
								new_ret.output_offset=save_ret.output_offset;
								save_ret.input_offset-=size_diff;
							}
							else
							{
								j=new_ret.input_offset+new_ret.input_pos;
								for (i=strlen(new_input)+size_diff;i>j;i--)
								{
									k=i-size_diff;
#ifdef PARSER_DEBUG
									printf("process_input;copying new_input[%d]%c(%0X)=new_input[%d]%c(%0X)\n",i,new_input[i],new_input[i],k,new_input[k],new_input[k]);
#endif
									new_input[i]=new_input[k];
									par_copy_index(new_input_indexes,i,new_input_indexes,k);
									dict_hit_array[i]=dict_hit_array[k];
									
								}
								new_input_diff+=size_diff;
#ifdef PARSER_DEBUG
								par_print_rule_error("111 input",new_input,new_ret.input_pos+new_ret.input_offset);
								par_print_rule_error("111 output",output_array,new_ret.output_pos+new_ret.output_offset);
#endif
								/* copy the changed data */
								memcpy(new_input+(save_ret.input_offset+save_ret.input_pos),output_array+(save_ret.output_offset+save_ret.output_pos),output_size);
								/* copy the index data */
								par_copy_index_list(new_input_indexes,(save_ret.input_offset+save_ret.input_pos),output_indexes,(save_ret.output_offset+save_ret.output_pos),output_size);
								hit_ret.input_offset+=size_diff;
								new_ret.input_offset=save_ret.input_offset;
								new_ret.output_offset=save_ret.output_offset;
							}
#ifdef PARSER_DEBUG
							par_print_rule_error("222 input",new_input,new_ret.input_pos+new_ret.input_offset);
							par_print_rule_error("222 output",output_array,new_ret.output_pos+new_ret.output_offset);
#endif
#ifdef NEW_DEBUG
							par_print_rule_error("the input_array after moving, changing",new_input,new_ret.input_pos+new_ret.input_offset);
							par_print_rule_error("the output_array after moving, changing",output_array,new_ret.output_pos+new_ret.output_offset);
#endif
						} /* if (output_size>input_size) */
						else
						{
							if (input_size==output_size)
							{
#ifdef PARSER_DEBUG
								printf("par_process_input;the output is the same size as the input\n");
#endif              
								/* overwrite the input with the output */
								memcpy(new_input+save_ret.input_offset+save_ret.input_pos,output_array+save_ret.output_offset+save_ret.output_pos,input_size);
								/* overwrite the index data with the output index data */
								par_copy_index_list(new_input_indexes,save_ret.input_offset+save_ret.input_pos,output_indexes,save_ret.output_offset+save_ret.output_pos,input_size);
								new_ret.input_offset=save_ret.input_offset;
								new_ret.output_offset=save_ret.output_offset;
							} /* if (input_size==output_size) */
							else
							{
#ifdef PARSER_DEBUG
								printf("par_process_input;the output is smaller than the input\n");
#endif                                   
								/* 
								* place the output in the input array so the end of the output
								* matches up with the end of the input that was just processed 
								*/
								size_diff=input_size-output_size;
								/* copy the output to the proper place in the input */
								memcpy(new_input+save_ret.input_offset+save_ret.input_pos+size_diff,output_array+save_ret.output_offset+save_ret.output_pos,output_size);
								/* copy the indexes into their new home */
								par_copy_index_list(new_input_indexes,save_ret.input_offset+save_ret.input_pos+size_diff,output_indexes,save_ret.output_offset+save_ret.output_pos,output_size);
								new_ret.input_offset=save_ret.input_offset+size_diff;
								new_ret.output_offset=save_ret.output_offset;
							} /* if (input_size==output_size) */
						} /* if (output_size>input_size) */
						if (cur_rule_next_go_hit!= -1)
						{
							if (cur_rule_next_hit!= -1)
							{
								par_set_return_level(return_rule,&return_level,cur_rule_next_hit);
							}
							else
							{
								par_set_return_level(return_rule,&return_level,current_rule_number+1);
							}
							current_rule_number=cur_rule_next_go_hit;
						}
						else
						{						
							current_rule_number=cur_rule_next_hit;         
						}
						par_copy_return_value(&save_ret,&new_ret);
						last_rule_was_hit=1;
					} /* if ((current_rule->next_hit_rule!= -1) || (current_rule->next_goret_hit!= -1)) */
					else
					{
						done=1;
						last_rule_was_hit=0;
					} /* if ((current_rule->next_hit_rule!= -1) || (current_rule->next_goret_hit!= -1)) */
				} /* if (((new_input[new_ret.input_pos+new_ret.input_offset]!='\0') && */
			} /* if (new_ret.value == SUCCESS) */
			else                  
			{
				/* next miss rules are done here */
				if (cur_rule_next_go_miss!= -1)
				{
					if (cur_rule_next_miss!= -1)
					{
						par_set_return_level(return_rule,&return_level,cur_rule_next_miss);
					}
					else
					{
						par_set_return_level(return_rule,&return_level,current_rule_number+1);
					}
					current_rule_number=cur_rule_next_go_miss;
					last_rule_was_hit= -1;
				}
				else
				{
					if (cur_rule_next_miss!= -1)	/* this is also a miss */
					{
						current_rule_number=cur_rule_next_miss;
						last_rule_was_hit= -1;				/* reset the last_rule_was_hit flag */
					}
					else
					{
						current_rule_number++;      		/* go to the next rule in the rule table */
						last_rule_was_hit=0;				/* reset the last_rule_was_hit flag */
					}
				}
			} /* if (new_ret.value == SUCCESS) */
			  /*
			  * the processing has tried all the rules and either the
			  * last rule has hit or none of them hit 
			*/
			if ((current_rule_number>=num_rules) || (current_rule_number<0))
				done=1;         
#ifdef PARSER_DEBUG
			printf("process_input done = %d\n",done);
#endif
			
		}	/* while (!done) */
		/* copy the word to the output */
		/* this copies the data from the current position in the input until it hits a whitespace */
		/* -1 signals that the end of the input string has been reached */
		/* should check for overrunning the output array */
		if (do_not_copy_next_word==1)
		{
			do_not_copy_next_word=0;
			done=0;
		}
		else
		{
			if (par_copy_word_to_output(new_input,output_array,new_input_indexes,output_indexes,&new_ret)== -1)
			{
				done=1;
			}
			else
			{
				done=0;
			}
		}
		
	}	/* while (new_input[]!='\0') */
	output_array[new_ret.output_pos+new_ret.output_offset]='\0';
	
	ret_value->input_offset=new_ret.input_offset-new_input_diff;	 /* the offsets are the change from the current pos */
	ret_value->output_offset=new_ret.output_offset; /* so add the values to the callers offsets */
#ifdef PARSER_DEBUG
	printf("leaving par_process_input\n");
#endif
	return(ret_value);
}                       

/* ******************************************************************
 *	Function Name:
 *		par_get_return_level()
 *
 *	Description:
 *		this function gets a value out of the return_rule array
 *
 *	Arguments:
 *		INPUT	short	*return_rule			the array of return_rule values to read from
 *		I/O		short	*return_level			the current return level in the return_rule array
 *		INPUT	short   current_rule_number		the_rule_number that is being processed now
 *
 *	Return Value:
 *		#ifdef PARSER_DEBUG
 *			int		the rule number to process next
 *		#else
 *			_inline int
 *
 *	Comments:                       
 *		This function checks for no data in the array
 *			on a underflow condition the return value is the current rule number plus one
 *		
 *
 * *****************************************************************/
#ifdef PARSER_DEBUG
int par_get_return_level(int *return_rule, int *return_level, int current_rule_number)
{
	if (*return_level>0)
	{   
		printf("par_get_return_level;going to rule %d the level is %d\n",return_rule[(*return_level)-1],(*return_level)-1);
		return(return_rule[--(*return_level)]);
	}
	else
	{
		printf("par_get_return_level;no place to go to, going to next rule %d\n",current_rule_number);
		return(current_rule_number+1);
	}
}
#else
__inline int par_get_return_level(int *return_rule,
									int *return_level,
									int current_rule_number)
{
	if (*return_level>0)
	{   
		return(return_rule[--(*return_level)]);
	}
	else
	{
#ifndef ARM7_NOSWI
		printf("par_get_return_level;no place to go to, going to next rule %d\n",current_rule_number);
#endif
		return(current_rule_number+1);
	}
}
#endif // PARSER_DEBUG

/* ******************************************************************
 *	Function Name:
 *		par_set_return_level()
 *
 *	Description:
 *		this function places a value into the return_rule array 
 *
 *	Arguments:
 *		INPUT	short	*return_rule			the array of return_rule values to read from
 *		I/O		short	*return_level			the current return level in the return_rule array
 *		INPUT	short   go_rule					The value to save in the retrun_rule array
 *
 *	Return Value:
 *		void
 *
 *	Comments:                       
 *		This function checks for data overflow in the array
 *		
 *
 * *****************************************************************/
#ifdef PARSER_DEBUG
void par_set_return_level(int *return_rule, int *return_level, int go_rule)
{
	if (*return_level<PAR_MAX_RETURN_LEVEL)
	{
		//#ifdef PARSER_DEBUG
		printf("par_set_return_level;saving rule %d in level %d\n",go_rule,*return_level);
		//#endif
		return_rule[(*return_level)++]=go_rule;
	}
	else
	{
		//#ifdef PARSER_DEBUG
		printf("par_set_return_level;too many levels of gorets throwing away %d\n",go_rule);
		//#endif
	}
}
#else
__inline void par_set_return_level(int *return_rule,
								   int *return_level,
								   int go_rule)
{
	if (*return_level<PAR_MAX_RETURN_LEVEL)
	{
		return_rule[(*return_level)++]=go_rule;
	}
	else
	{
#ifndef ARM7_NOSWI
		printf("par_set_return_level;too many levels of gorets throwing away %d\n",go_rule);
#endif
	}
}
#endif // PARSER_DEBUG

/* ******************************************************************
 *	Function Name:
 *		par_copy_index_list
 *
 *	Description:
 *		thios function copies a list of indexes from src_index[src_pos] to dest_index[dest_pos]
 *
 *	Arguments:
 *		OUTPUT	pindex_data_t	dest_index		The destination array of indexes
 *		INPUT	short			 dest_pos		The destination position in dest_index
 *		INPUT	pindex_data_t	src_index		The source array of indexes
 *		INPUT	short			 src_pos		The source position in src_index
 *		INPUT	short			 length			The number of entries to copy
 *
 *	Return Value:
 *		void
 *
 *	Comments:                       
 *		
 *
 * *****************************************************************/
#ifdef PARSER_DEBUG
void par_copy_index_list(pindex_data_t dest_index,
						 int		   dest_pos,
						 pindex_data_t src_index,
						 int		   src_pos,
						 int		   length)
{
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	//	int i;
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,length*sizeof(index_data_t));
	//	for (i=0;i<length;i++)
	//	{
	//		par_copy_index(dest_index,dest_pos+i,src_index,src_pos+i);
	//	}
#endif
}
#else // PARSER_DEBUG
__inline void par_copy_index_list(pindex_data_t dest_index,
								  int		    dest_pos,
								  pindex_data_t src_index,
								  int		    src_pos,
								  int		    length)
{
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	//	int i;
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,length*sizeof(index_data_t));
	//	for (i=0;i<length;i++)
	//	{
	//		par_copy_index(dest_index,dest_pos+i,src_index,src_pos+i);
	//	}
#else
;
#endif // ARM7
}
#endif // PARSER_DEBUG

/* ******************************************************************
 *	Function Name:
 *		par_copy_index
 *
 *	Description:
 *		thios function copies src_index[src_pos] to dest_index[dest_pos]
 *
 *	Arguments:
 *		OUTPUT	pindex_data_t	dest_index		The destination array of indexes
 *		INPUT	short			 dest_pos		The destination position in dest_index
 *		INPUT	pindex_data_t	src_index		The source array of indexes
 *		INPUT	short			 src_pos		The source position in src_index
 *
 *	Return Value:
 *		void
 *
 *	Comments:                       
 *		
 *
 * *****************************************************************/
#ifdef PARSER_DEBUG
void par_copy_index(pindex_data_t dest_index,
					int			  dest_pos,
					pindex_data_t src_index,
					int		  src_pos)
{
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,sizeof(index_data_t));
#endif
}
#else // PARSER_DEBUG
__inline void par_copy_index(pindex_data_t dest_index,
							 int		   dest_pos,
							 pindex_data_t src_index,
							 int		   src_pos)
{
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,sizeof(index_data_t));
#else
;
#endif
}
#endif // PARSER_DEBUG

/* ******************************************************************
 *	Function Name:
 *		par_is_index_set()
 *
 *	Description:
 *		this function checks to see if thewre is an index marker in indexes at
 *		position pos
 *
 *	Arguments:
 *		INPUT	pindex_data_t	indexes			The array of indexes
 *		INPUT	short			pos				The position to check
 *
 *	Return Value:
 *		short     	SUCCESS		Something there
 *					FAIL		Nothing there
 *
 *	Comments:                       
 *		
 *
 * *****************************************************************/
#ifdef PARSER_DEBUG
int par_is_index_set(pindex_data_t indexes, int pos)
{
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	if (indexes[pos].index[0]!=0 || indexes[pos].index[1]!=0 || indexes[pos].index[2]!=0)
	{
		return(1);
	}
#endif
	return(0);
}
#else
__inline int par_is_index_set(pindex_data_t indexes,
								int pos)
{
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
	if (indexes[pos].index[0]!=0 || indexes[pos].index[1]!=0 || indexes[pos].index[2]!=0)
	{
		return(1);
	}
#endif
	return(0);
}
#endif // PARSER_DEBUG

/* ******************************************************************
 *	Function Name:
 *		par_match_rule()
 *
 *	Description:  
 *		This function does all the work for matching one action state. 
 *		The rule pointer is left at the position just after the ending slash in the state
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		INPUT	int 			state			the current state to match
 *		INPUT	unsigned char 	*input_array	the input array
 *		OUTPUT	unsigned char 	*output_array	the output array
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle                
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and 
 * 												ending points of the matching, and exit conditions
 *		INPUT	short			dict_state_flag	if 0 do the entire search and return te value in $9
 *												if 1 just return success or failure in the dict
 *
 *	Return Value:
 *		preturn_value_t		a pointer to the return value strucutre passed as ret_value
 *
 *	Comments:
 *		this function is recursive.
 *
 * ******************************************************************/
void par_match_rule(unsigned char *current_rule, int state,
					unsigned char *input_array, unsigned char *output_array,
					pindex_data_t input_indexes, pindex_data_t output_indexes,
					pmatch_arrays_t match_array, preturn_value_t ret_value, int dict_state_flag)
{
	
	//	int end_marker=End_Is_Slash;		/* used to store the end of state marker for comparison */
	return_value_t	new_ret;				/* the return_value data */
	int new_operation=BIN_END_OF_RULE;		/* the current_operation */
	int num_chars_matched=0; 				/* the number of characters matched by par_match_string */
	int save_state_num=0;					/* the number of the array to save the matching result into or
											 * the dictionary number */
	range_value_t range_value = {0,0,0,0};	/* 
											*	a structure to store the minimum and maximum values of 
											* 	a digit range find 
											*/
	U8 *new_rule;
	int in_rule_index;
	int next_rule_number,rule_p;
	//int length=0;
	int length_of_input;
	int temp;
#ifdef GERMAN_COMPOUND_NOUNS
	int insert_operation_flags=0;
#endif
	U8 end_of_match=0;
//	U8 end_of_action;
//	U8 end_of_hit;
											
#ifdef PARSER_DEBUG
	printf("entering par_match_rule state=%d\n",state);
#endif

#ifdef SANITY_CHECKING
	/* check the inputs or bail out at this point */                                      
	if (ret_value==NULL) /* there was no input structure,  bail and return NULL */
	{
#ifdef PARSER_DEBUG
		printf("leaving par_match_rule ret_value is NULL\n");
#endif
		return;
	}	
	if (current_rule==NULL || input_array==NULL || output_array==NULL || match_array==NULL)
	{	/* return a failed value */
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_match_rule some input is NULL returning FAIL\n");
#endif
		return;
	}
#endif // SANITY_CHECKING
	length_of_input=strlen(input_array);

	/* update the state information and pointer to ret_value for par_look_ahead */                   
	new_ret.input_pos=ret_value->input_pos+ret_value->input_offset;	
	new_ret.input_offset=0;
	new_ret.output_pos=ret_value->output_pos+ret_value->output_offset;
	new_ret.output_offset=0;
	new_ret.value=SUCCESS;
	/* GL 02/08/1997 set the initial parser_flag */
	new_ret.parser_flag = ret_value->parser_flag;   
#ifdef NEW_PARSER_FILE_LOADING
	new_ret.phTTS=ret_value->phTTS;
#endif

	/* 
	*	NULL_STATE is used for the first call to the par_match_rule function to 
	*	tell it to go into COPY_STATE and that the end of state marker is a NULL 
	*/
	new_ret.rule=in_rule_index=ret_value->rule;
	if (state==BIN_END_OF_RULE) 	
	{
		//		state=BIN_COPY;
		end_of_match=255;
	}

	/* set the optional flag if the state is optional */
	if (state==BIN_OPTIONAL)
	{                                         
#ifdef PARSER_DEBUG
		printf("set optional to 1\n");
#endif
		new_ret.optional=1;
	}     
	else
	{
		new_ret.optional=ret_value->optional;
	}
	/* 
	* copy the return value data from the input to the temporary location for the
	* children of this function to use 
	*/
	/*
	*	if this is in save state the array number has to be retrieved here to 
	*  know which array to place the data into 
	*/
	if (state==BIN_SAVE)
	{
		/* get the number from the rule to save the result in */
		new_ret.rule++;	/* skip the operation */
		save_state_num=current_rule[new_ret.rule];
	}
	if (state==BIN_DICTIONARY)
	{
		new_ret.rule++;
		save_state_num=current_rule[new_ret.rule];
	}
#ifdef GERMAN_COMPOUND_NOUNS
	if (state==BIN_INSERT)
	{
		insert_operation_flags=current_rule[new_ret.rule];
	}
#endif
	if (state==BIN_MACRO)
	{
		rule_p=new_ret.rule;
		rule_p++; /* skip state identifier */
		next_rule_number=get_short(&current_rule[rule_p]);
		rule_p+=2;
		// CAB	05/20/02	Removed warnings by typecast
		new_rule= (unsigned char*)(&(rule_data_table[rule_index_table[next_rule_number]]));
		new_ret.rule=0;
		if (new_rule[0] & BIN_NEXT_HIT)	 new_ret.rule+=2;
		if (new_rule[0] & BIN_NEXT_MISS)  new_ret.rule+=2;
		if (new_rule[0] & BIN_GORET_HIT)  new_ret.rule+=2;
		if (new_rule[0] & BIN_GORET_MISS) new_ret.rule+=2;
		if (new_rule[0] & BIN_COPY_HIT) new_ret.rule+=2;
		new_ret.rule+=12;
		
		par_match_rule(new_rule,BIN_END_OF_RULE,input_array,output_array,input_indexes,output_indexes,match_array,&new_ret,0);
		/* fixed macro state */
		new_ret.rule=rule_p;
		if ((new_ret.input_pos+new_ret.input_offset > length_of_input)) 
		{
			if (new_ret.optional==1)
			{
//				new_ret.optional= -1;
				ret_value->value=OPT_FAIL;
//				ret_value->rule=rule_p;
				return;
			}
			else
			{
//				new_ret.value=END_OF_STRING;
				ret_value->value=END_OF_STRING;
				return;
			}
		}
		if ((new_ret.value==FAIL) && (new_ret.optional))
		{
//			new_ret.optional= -1;
			ret_value->value=OPT_FAIL;
//			ret_value->rule=new_ret.rule;
			return;
		}                                                                 
	}
	else
	{
		/* extract the state data */
		if (state>=BIN_COPY)
		{
			new_ret.rule++;	/* skip the operation */
			end_of_match=current_rule[new_ret.rule];
			new_ret.rule++;
#ifndef GERMAN_COMPOUND_NOUNS
			if (state>=BIN_REPLACE && state <=BIN_BEFORE)
#else
			if (state>=BIN_REPLACE && state <=BIN_INSERT)
#endif
			{
				new_ret.rule++;
				if (current_rule[in_rule_index] & BIN_CONDITIONAL_REPLACE)
				{
					new_ret.rule+=current_rule[new_ret.rule];
					new_ret.rule++; /* add 1 for the conditional number */
				}
			}
			else
			{
				if (state==BIN_DICTIONARY)
				{
					new_ret.rule+=2;
				}
				else
				{
					if (state==BIN_STATUS)
					{
						new_ret.rule++;
					}
				}
			}
		}
		
		/* 
		* decide whether the string in the position being processed is another rule 
		* or if it is a character type or string to be matched.
		*/
/* ************************ NOT USED *******************************/
#if 0
		while ((current_rule[new_ret.rule]!=0) && (new_ret.rule <= end_of_match) && (new_ret.optional!=-1) &&
			(new_ret.value!=FATAL_FAIL) && (new_ret.value!=FAIL) && (new_ret.value!=END_OF_STRING)) /* && */
#endif // 0
/*******************************************************************/

		while ((new_ret.rule <= end_of_match) && ((temp=current_rule[new_ret.rule])!=0) &&  (new_ret.value==SUCCESS))
			/*(new_ret.input_pos+new_ret.input_offset < (int)strlen(input_array))*/ 	/* slow ?? */
			/* process all the data in this action state that is before the ending slash */
		{
			new_operation=temp & BIN_OPERATION_MASK;
			if ((new_operation <= BIN_SETS))
			{
				num_chars_matched=par_match_string(current_rule,new_operation,input_array,match_array,&new_ret,&range_value,1,0);
				
				/* copy matched data to the output string */
				if (num_chars_matched== -1)
				{
#ifdef PARSER_DEBUG
					printf("leaving par_match_rule; end of string reached in string\n");
#endif
					if (new_ret.optional==1)
					{
						new_ret.value=OPT_FAIL;
						break;
					}
					else
					{
						ret_value->value=END_OF_STRING;                         
						return;
					}
				}
				if (num_chars_matched== 0 && new_ret.optional)
				{
					new_ret.value=OPT_FAIL;
					break;
				}
#ifdef PARSER_DEBUG
				par_print_rule_error("after par_match_string",current_rule,new_ret.rule);
#endif
				par_copy_string_data(input_array,input_indexes,output_array,output_indexes,num_chars_matched,&new_ret);
				/* update new_ret output_offset */
				new_ret.output_offset+=num_chars_matched;
				new_ret.input_offset+=num_chars_matched; 
			}
			else
			{
					/* recursively call the par_match_rule function with the new action state */
				par_match_rule(current_rule,new_operation,input_array,output_array,input_indexes,output_indexes,match_array,&new_ret,0);
				
#ifdef PARSER_DEBUG
				par_print_rule_error("after par_match_rule",current_rule,new_ret.rule);
#endif
				if (new_ret.value==END_OF_STRING)
				{
#ifdef PARSER_DEBUG
					printf("leaving par_match_rule; end of string reached in rule\n");
#endif
					if (new_ret.optional==1)
					{
						new_ret.value=OPT_FAIL;
						break;
					}
					else						
					{
						ret_value->value=END_OF_STRING;
						return;
					}
				}
				/* the matched expression should already be in the output buffer */
			}                              
			/* processing continues here after a call to either par_match_string() or to par_match_rule() */
			if ((new_ret.input_pos+new_ret.input_offset > length_of_input)) 
			{
				if (new_ret.optional==1)
				{
					new_ret.value=OPT_FAIL;
					break;
				}
				else
				{
					new_ret.value=END_OF_STRING;
				}
			}
		}
	}
	/* the end of state slash marker was found or there was a failure in the matching */
	if (new_ret.value==FAIL)
	{
	/* on failure of a rule just send back FAIL. the caller will then send FAIL back to its caller
	* and so on, until the outer loop is reached with FAIL.  The original ret_value array 
	* should remain unchanged for the following rules to use 
		*/
		ret_value->value=FAIL;
#ifdef INDEX_DEBUG2
		printf("cleared indexes from %d to %d in the output, failure\n",new_ret.output_pos,new_ret.output_pos+new_ret.output_offset);
#endif
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
		memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
#endif
#ifdef PARSER_DEBUG
		printf("leaving par_match_rule failure of the rule\n");
#endif
		
		return;
	}
	if (new_ret.value==END_OF_STRING)
	{
		/* on finding the end of the string, return END_OF_STRING to the caller */
#ifdef INDEX_DEBUG2
		printf("cleared indexes from %d to %d in the output, end_of_string\n",new_ret.output_pos,new_ret.output_pos+new_ret.output_offset);
#endif
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
		memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
#endif
		ret_value->value=END_OF_STRING;
#ifdef PARSER_DEBUG
		printf("leaving par_match_rule; the end of the string was encountered\n");
#endif
		return;
	}
	
	/* this should be the ending slash of the state */
	if (new_ret.value!=OPT_FAIL)
	{
		if ((state!=BIN_END_OF_RULE) && (state!=BIN_MACRO))
		{
			if (new_ret.rule!=(end_of_match+1))
			{
				par_print_rule_error("par_match_rule;end of state slash not found",current_rule,new_ret.rule);
				ret_value->value=FATAL_FAIL;
				return;
			}
		}
		/* performing the action of this state */  
#ifdef PARSER_DEBUG
		printf("the current output is:%s\n",output_array);
		printf("output_pos=%d output_offset=%d\n",new_ret.output_pos,new_ret.output_offset);
#endif
		if (state!=BIN_END_OF_RULE)
		{
#ifndef GERMAN_COMPOUND_NOUNS
			(perform_action_funcs[state])(current_rule,input_array,output_array,input_indexes,output_indexes,match_array,&new_ret,&range_value,save_state_num,dict_state_flag,in_rule_index);
#else
			(perform_action_funcs[state])(current_rule,input_array,output_array,input_indexes,output_indexes,match_array,&new_ret,&range_value,save_state_num,dict_state_flag,in_rule_index,insert_operation_flags);
#endif
		}

		//printf("B parser_flag is %d\n",new_ret.parser_flag);
		/* GL 02/08/1997 set the parser_flag to caller */
		ret_value->parser_flag = new_ret.parser_flag;
		
		/* updating ret_value */
		/* only the value of offset is updated with the change in the offset */
		/* pos values have the value of what they were at the beginning of the rule matching */
#ifdef PARSER_DEBUG
		printf("par_match_rule;the output after the action has been performed\n is %s\n",output_array);
#endif
		if (new_ret.value==FATAL_FAIL)
		{
			ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
			printf("leaving par_match_rule fatal failure of the rule\n");
#endif
			return;
		}
		if (new_ret.value==FAIL)
		{
#ifdef INDEX_DEBUG2
			printf("cleared indexes from %d to %d in the output, fail-fail\n",new_ret.output_pos,new_ret.output_pos+new_ret.output_offset);
#endif
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
			memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
#endif
			ret_value->value=FAIL;
#ifdef PARSER_DEBUG
			printf("leaving par_match_rule failure of the rule\n");
#endif
			return;

		}
		ret_value->value=SUCCESS;
		/* 
		*	make the callers return value atructure know how much data was processed 
		*/
		/* 	
		*	these have to be changed with the change in the input value because 
		*	offsets may have been non zero when the call to this function was made 
		*/
		ret_value->input_offset+=new_ret.input_offset;	 /* the offsets are the change from the current pos */
		ret_value->output_offset+=new_ret.output_offset; /* so add the values to the callers offsets */
	}
	else
	{
#ifdef PARSER_DEBUG
		printf("par_match_rule;optional set to OPT_FAIL\n");
#endif
#ifdef INDEX_DEBUG2
		printf("cleared indexes from %d to %d in the output, opt_fail\n",new_ret.output_pos,new_ret.output_pos+new_ret.output_offset);
#endif
#if !defined ARM7 || (defined ARM7 && defined ACCESS_SOLUTIONS)
		memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
#endif
		if (state==BIN_OPTIONAL)
		{
			ret_value->rule=end_of_match+1;
			ret_value->value=SUCCESS;
			return;
		}
		ret_value->value=OPT_FAIL;
	}
	/* ret_value->rule should be pointing to the character afterh the rule now */
	ret_value->rule=new_ret.rule;
#ifdef PARSER_DEBUG
	printf("leaving par_match_rule success\n");
#endif
}

/* ******************************************************************
 *	Function Name:
 *		par_perform_action()
 *
 *	Description:
 *		this function performs the action specified by state on the characters
 *		in the range of ret_value->output_pos to ret_value->output_offset
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		INPUT	int 			state			the action state
 *		INPUT	unsigned char 	*input_array	the input array
 *		OUTPUT	unsigned char 	*output_array	the output array
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and 
 * 												ending points of the matching, and exit conditions
 *		INPUT	prange_value_t	range_value		The structure that passes information about 
 * 												conditional replacements
 *		INPUT	int				save_num		The number of the match_array for shuffle to put its data in
 *		INPUT	short			dict_state_flag	if 0 do the entire search and return te value in $9
 *												if 1 just return success or failure in the dict
 *
 *	Return Value:                                
 *		void
 *
 *	Comments:
 *		this function just calls other finction that really do the actions
 *		the rule index is left at the position just after the ending slash in the action state
 *
 * *****************************************************************/
/* ***************************** NOT USED ***************************/
#if 0

void par_perform_action(unsigned char *current_rule, int state, unsigned char *input_array,
						unsigned char *output_array, pindex_data_t input_indexes,
						pindex_data_t output_indexes, pmatch_arrays_t match_array,
						preturn_value_t ret_value, prange_value_t range_value,
						int save_num, int dict_state_flag, int in_rule_index)
{                                                                                            
	int length=0;
	unsigned char buf[10];
	
#ifdef PARSER_DEBUG
	printf("entering perform action\n");
#endif

#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving perform action ret_value is NULL\n");
#endif
		return;
	}
	if ((current_rule==NULL) || (output_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving perform action inputs are NULL\n");
#endif
		return;
	}
#endif // SANITY_CHECKING

//#if 0
	if (state<=BIN_BEFORE)
	{
		if (state>=BIN_REPLACE)
		{
			(perform_action_funcs[state])(current_rule,output_array,output_indexes,match_array,ret_value,range_value,in_rule_index);
			return;
		}
		else
		{
			/* BIN_DELETE */
			if (state==BIN_DELETE)
			{
				par_delete_string(output_array,output_indexes,ret_value);	
				return;
			}
			else
			{
				par_save_string(output_array,save_num,match_array,ret_value);
				return;
			}
		}
	}
	else /* (state<=BIN_BEFORE) */
	{
		if (state==BIN_DICTIONARY)
		{
			par_dom_dict_search(current_rule,input_array,output_array,input_indexes,output_indexes,match_array,save_num,ret_value,dict_state_flag,in_rule_index);
			return;
		}
		else
		{
			if (state==BIN_WORD)
			{
				par_check_word_string(output_array,ret_value);
				return;
			}
			else
			{
				/* BIN_STATUS */
				par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_STATUS,&length,in_rule_index);
				ret_value->parser_flag = atoi(buf);
				//printf("A parser_flag is %d\n",ret_value->parser_flag);
				return;
			}
		}
	}

//#endif

/* **************************** NOT USED ***************************/
#if 0
	switch(state)
	{
	case BIN_REPLACE:
		par_replace_string(current_rule,output_array,output_indexes,match_array, ret_value,range_value,in_rule_index);
		return;
	case	BIN_DELETE:
		par_delete_string(output_array,output_indexes,ret_value);
		return;
	case	BIN_INSERT:
		par_insert_string(current_rule,output_array,output_indexes,match_array,ret_value,range_value,in_rule_index);
		return;
	case	BIN_AFTER:
		par_insert_string_after(current_rule,output_array,output_indexes,match_array,ret_value,range_value,in_rule_index);
		return;
	case	BIN_BEFORE:
		par_insert_string_before(current_rule,output_array,output_indexes,match_array,ret_value,range_value,in_rule_index);
		return;
	case	BIN_SAVE:
		par_save_string(output_array,save_num,match_array,ret_value);
		return;
		/* this should not be necessary as MACRO_STATE is never passed as a state to match_rule */
	case    BIN_DICTIONARY: 
		par_dom_dict_search(current_rule,input_array,output_array,input_indexes,output_indexes,match_array,save_num,ret_value,dict_state_flag,in_rule_index);
		return;
	case	BIN_WORD:
		par_check_word_string(output_array,ret_value);
		return;
		/* GL 02/08/1997 add STATUS_STATE */
	case	BIN_STATUS:
		/* set status word into parser_status kernel variable */
		/* 
		*	build the string that is going to be set
		*/
	int length=0;
	unsigned char buf[10];
		par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_STATUS,&length,in_rule_index);
		ret_value->parser_flag = atoi(buf);
		//printf("A parser_flag is %d\n",ret_value->parser_flag);
		return;
	}
#endif // 0
/* *****************************************************************/

#ifdef PARSER_DEBUG
	printf("leaving perform action;the action is done\n");
#endif
}

#endif // 0
/* *****************************************************************/

/* ******************************************************************
 *	Function Name:
 *		par_delete_string()
 *
 *	Description:
 *		this function deletes the string inthe range of ret_value->output_pos
 *		to ret_value->output_offset from the output_array
 *
 *	Arguments:
 *		I/O		unsigned char 	*output_array	a pointer to the output array
 *		I/O		preturn_value_t	ret_value		the return value strucutre
 *
 *	Return Value:                                                         
 *		void
 *
 *	Comments:
 *
 * *****************************************************************/
void par_delete_string(unsigned char *current_rule, unsigned char *input_array,
					   unsigned char *output_array, pindex_data_t input_indexes,
					   pindex_data_t output_indexes, pmatch_arrays_t match_array,
					   preturn_value_t ret_value, prange_value_t range_value,
					   int save_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	int	i,j,save_offset=0;
//055	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
	index_data_t temp_index;
#ifdef PARSER_DEBUG
	printf("entering par_delete_string\n");
#endif
	/*
	*	check the inputs for valid data 
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_delete_string ret_value is NULL\n");
#endif
		return;
	}
	if ((output_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_delete_string input is NULL\n");
#endif
		return;
	}                 
#endif // SANITY_CHECKING 
	//055	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
	save_offset=ret_value->output_offset+ret_value->output_pos;             
	/* blank out the data being deleted */
	memset((output_array+(ret_value->output_pos)),0,ret_value->output_offset);                              
	/* set the ouput_offset to 0 to logically delete the data from processing */
	memset(&temp_index,0,sizeof(temp_index));
	ret_value->output_offset=0;
	for (j=i=ret_value->output_pos;i<save_offset;i++)
	{
		if (par_is_index_set(output_indexes,i))
		{
#ifdef INDEX_DEBUG
			printf("copying index in delete state from %d to %d\n",i,j);
#endif
			par_copy_index(output_indexes,j,output_indexes,i);
			/* kill the old index */
			par_copy_index(output_indexes,i,&temp_index,0);
			output_array[j]=PAR_INDEX_DUMMY_CHAR;
			j++;
			ret_value->output_offset++;
		}
	}
#ifdef PARSER_DEBUG
	printf("leaving par_delete_string string deleted\n");
#endif
}
						
/* ******************************************************************
*	Function Name:
*		par_replace_string
*
*	Description:
*		this function replaces the data in the output_array between ret_value->output_pos 
*		and ret_value->output_offset with the string indicated by the section in current_rule
*
*	Arguments:                                 
*		INPUT	unsigned char 	*current_rule	pointer to the current rule
*		I/O		unsigned char 	*output_array	a pointer to the output array
*		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle                
*		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
* 												ending points of the matching, and exit conditions
*		INPUT	prange_value_t	range_value		The structure that passes information about 
* 												conditional replacements
*
*	Return Value:                                                         
*		void
*
*	Comments:
*
* ******************************************************************/
void par_replace_string(unsigned char *current_rule, unsigned char *input_array,
						unsigned char *output_array, pindex_data_t input_indexes,
						pindex_data_t output_indexes, pmatch_arrays_t match_array,
						preturn_value_t ret_value, prange_value_t range_value,
						int save_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	int length;
	int i,j;
	unsigned char buf[100];
	index_data_t  temp_index[100];
	
	
#if defined (PARSER_DEBUG) || defined (INDEX_DEBUG)
	printf("entering par_replace_string\n");
#endif
	
	memset(temp_index,0,100*sizeof(index_data_t));
	/* 
	*	check the inputs for valid data 
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_replace_string ret_value is NULL\n");
#endif
		return;
	}
	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_replace_string inputs are invalid\n");
#endif
		return;
	}
#endif // SANITY_CHECKING
	/* 
	*	build the string that is going to replace the current string bounded by
	*	by output_pos and output_offset
	*	then just copy the string built (null and all) on top of the current string
	*/
	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_REPLACE,&length,in_rule_index);
		/* have to do something with indexes so they don't appear in the middle of a word */
	for (j=0,i=ret_value->output_pos;i<ret_value->output_pos+ret_value->output_offset;i++)
	{
		if (par_is_index_set(output_indexes,i))
		{
			/* find a space if there is one */
			for (;j<length && buf[j]!=' ';j++);
			if (j<length)
			{
#ifdef INDEX_DEBUG
				printf("copying index in replace 1 from %d to buf %d\n",i,j);
#endif
				par_copy_index(temp_index,j,output_indexes,i);
				//055	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
				buf[j]=PAR_INDEX_DUMMY_CHAR;
				j++;
			}
			else
			{
				/* use the dummy character for the moved index */
				buf[j]=PAR_INDEX_DUMMY_CHAR;
				buf[j+1]='\0';     
#ifdef INDEX_DEBUG
				printf("copying index in replace 2 from %d to buf %d\n",i,j);
#endif
				par_copy_index(temp_index,j,output_indexes,i);
				j++;
				length++;
			}       
		}
	}
								
	strcpy((output_array+(ret_value->output_pos)),buf);
	/* copy the indexes too */
	par_copy_index_list(output_indexes,ret_value->output_pos,temp_index,0,length);
	/* 
	* the output offset is now the length of of the new output string 
	*/
#ifdef PARSER_DEBUG
	printf("par_replace_string; length=%d\n",length);
#endif	
	ret_value->output_offset=length;
	//	ret_value->rule++;
#ifdef PARSER_DEBUG
	printf("leaving replace_state replacement is successful\n");
#endif
}

#ifdef GERMAN_COMPOUND_NOUNS
void par_compound_break(unsigned char *current_rule,
					   unsigned char *input_array,
					   unsigned char *output_array,
					   pindex_data_t input_indexes,
					   pindex_data_t output_indexes,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   prange_value_t range_value,
					   int save_num,
					   int dict_state_flag,
					   int in_rule_index,
					   int insert_operation_flags)
{
	int num_matched;
	char new_input[100];
	char new_output[100];

#ifdef PARSER_DEBUG
	printf("entering par_compound_break\n");
#endif

	if (noun_num_character_in_mapping==0)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_compound_break, no table loaded\n");
#endif
		return;
	}

	memcpy(new_input,output_array+ret_value->output_pos,ret_value->output_offset);
	new_input[ret_value->output_offset]='\0';
	memset(new_output,0,100);

	num_matched=par_break_down_word(new_input,new_output);

	if (num_matched>0)
	{
		memcpy(output_array+ret_value->output_pos,new_output,num_matched);
		ret_value->output_offset=num_matched;
	}
	else
	{

		ret_value->value=FAIL;

		if (ret_value->optional==1)
		{
#ifdef PARSER_DEBUG
			printf("set optional to opt_fail\n");
#endif
			ret_value->value=OPT_FAIL;
		}
	}

#ifdef PARSER_DEBUG
	printf("leaving par_compound_break\n");
#endif

	/* rewrite the word breaker code and the word finder code */
	/* the word breaker should return the number of characters
	   that are in the output if successful, or -1 if failed */
	/* create a new header file for the structure used in here */


	/* write a file loader */
	/* the file loader has to be load the file for german, and not for any other language */
	/* the file loader has to globally allocate the memory, and the other threads
	   have to use it */
}

int par_break_down_word(unsigned char *input,unsigned char *output)
{
	int i,j;
	int head=1;
	int number_of_pos=0;
	int positions[10];
	int result;

#ifdef PARSER_DEBUG
	printf("entering par_break_down_word %s\n",input);
#endif
	result=par_find_word_in_dict(head,input,positions,0,&number_of_pos);
	if (result==0)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_break_down_word no matches\n");
#endif
		return(-1);
	}
	for (i=number_of_pos-1;i>=0;i--)
	{
		memcpy(output,input,positions[i]);
		/* MGS make the first character of the new word uppercase */
		output[0]=par_upper[output[0]];
		output[positions[i]]='\0';
		output[positions[i]+1]='\0';
		if (input[positions[i]]=='\0')
		{
			return(positions[i]);
		}
		if (noun_number_of_conjunctions>0)
		{
			for (j=0;j<noun_number_of_conjunctions;j++)
			{
				if (noun_conjunction[j].length==0)
				{
					result=par_break_down_word(input+positions[i],output+positions[i]+1);
					if (result>0)
					{
						output[positions[i]]='-';
#ifdef PARSER_DEBUG
						printf("leaving par_break_down_word no conj %s %s %d\n",input,output,result+positions[i]+1);
#endif
						return(result+positions[i]+1);
					}
				}
				else
				{
					if (memcmp(noun_conjunction[j].conj,input+positions[i],noun_conjunction[j].length)==0)
					{
						result=par_break_down_word(input+positions[i]+noun_conjunction[j].length,output+positions[i]+noun_conjunction[j].length+1);
						if (result>0)
						{
							memcpy(output+positions[i],noun_conjunction[j].conj,noun_conjunction[j].length);
							output[positions[i]+noun_conjunction[j].length]='-';

#ifdef PARSER_DEBUG
							printf("leaving par_break_down_word conj %s %s %d\n",input,output,result+positions[i]+1);
#endif
							return(result+positions[i]+noun_conjunction[j].length+1);
						}
					}
				}
			}
		}
		/* insert code for connecting characters here */
		/* remove the connections in reverse order from longest to shortest */
	}
#ifdef PARSER_DEBUG
	printf("leaving par_break_down_word failure %s %s\n",input,output);
#endif
	return(-1);

}

int par_find_word_in_dict(int head, unsigned char *word, int *positions, int depth,int *num_pos)
{
	//removed unused vairable 
	int i;
	comp_noun_table_entry *cur;
	if (head==NOUN_UNUSED_ENTRY)
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	if (head==0)
	{
		positions[*num_pos]=depth;
		(*num_pos)++;
		return(1);
	}
	cur= (comp_noun_table_entry *)(&(noun_data_table[noun_index_table[head]]));
	if (cur->word_ending & 1)
	{
		positions[*num_pos]=depth;
		(*num_pos)++;
	}
	if (cur->word_ending & 2)
	{
	  if (memcmp(word,cur->foo.rest_of_word,cur->length)==0)
		{
			positions[*num_pos]=depth+cur->length;
			(*num_pos)++;
			return(1);
		}
		else
		{
			if (*num_pos>0)
			{
				return(1);
			}
			else
			{
				return(0);
			}
		}
	}
	if (word[0]=='\0')
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	if (noun_character_mapping_table[word[0]]==NOUN_UNUSED_ENTRY)
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	if (cur->word_ending & 4)
	{
		for (i=0;i<cur->length;i++)
		{
			if (word[0]==(cur->foo.sentry[i].character))
			{
				return(par_find_word_in_dict(cur->foo.sentry[i].entry,word+1,positions,depth+1,num_pos));
			}
		}
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}		
	}
	if (noun_character_mapping_table[word[0]]>(cur->length))
	{
		if (*num_pos>0)
		{
			return(1);
		}
		else
		{
			return(0);
		}
	}
	return(par_find_word_in_dict(cur->foo.entries[noun_character_mapping_table[word[0]]],word+1,positions,depth+1,num_pos));
}

#endif // GERMAN_OMPOUND_NOUNS

/* ******************************************************************
*	Function Name:
*		par_insert_string()
*
*	Description:
*		this function inserts the string build from current_rule between every character
*		in the output_array between ret_vlaue->output_pos and ret_value->output_offset
*
*	Arguments:                                 
*		INPUT	unsigned char 	*current_rule	pointer to the current rule
*				unsigned char	*input_array
*		I/O		unsigned char 	*output_array	a pointer to the output array
*				pindex_data_t	input_indexes
*				pindex_data_t	output_indexes
*		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle                
*		I/O		preturn_value_t ret_value		the return value which controls and signals starting and 
* 												ending points of the matching, and exit conditions
*		INPUT	prange_value_t	range_value		The structure that passes information about 
* 												conditional replacements
*				int save_num
*				int dict_state_flag
*
*	Return Value:                                                         
*		void
*
*	Comments:
*		this function does the insert in a reverse method and therefoor does not need
*		a temporory array for the insert
*
* ******************************************************************/
void par_insert_string(unsigned char *current_rule, unsigned char *input_array,
					   unsigned char *output_array, pindex_data_t input_indexes,
					   pindex_data_t output_indexes, pmatch_arrays_t match_array,
					   preturn_value_t ret_value, prange_value_t range_value,
					   int save_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	unsigned char buf[100];
	int length,new_length;
	int pos,new_loc,off;
	//055	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
	int i;
	index_data_t temp_index={{0,0,0}};
	
#ifdef GERMAN_COMPOUND_NOUNS
	if (insert_operation_flags & BIN_AFTER_FLAG)
	{
		par_insert_string_after(current_rule,input_array,output_array,input_indexes,output_indexes,match_array,ret_value,range_value,save_num,dict_state_flag,in_rule_index,insert_operation_flags);
		return;
	}
	if (insert_operation_flags & BIN_BEFORE_FLAG)
	{
		par_insert_string_before(current_rule,input_array,output_array,input_indexes,output_indexes,match_array,ret_value,range_value,save_num,dict_state_flag,in_rule_index,insert_operation_flags);
		return;
	}
#endif
#ifdef PARSER_DEBUG
	printf("entering par_insert_string\n");
#endif
	/* 
	*	check the inputs for valid data 
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_insert_string ret_value is NULL\n");
#endif
		return;
	}
	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_insert_string; inputs are invalid\n");
#endif
		return;
	}
#endif /* SANITY_CHECKING */
	/* 
	*	build the string that is going to be inserted 
	*/
	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_INSERT,&length,in_rule_index);
	/* 
	*	the new length of the ouput string is
	*	the number of characters inserted into minus 1 (the insert is only between)
	*	times the length of the string to be inserted plus one (the original character)
	*	plus one (the last character)
	*/
	new_length=(ret_value->output_offset-1)*(length+1)+1;
	
	/* pos is the current position */
	pos=ret_value->output_pos;
	/* off is the pos plus the offset minus 1 (the offset is positioned for the next insert) */
	off=ret_value->output_offset+ret_value->output_pos-1;
	/* new is the place where the last character of the inserted string will be placed */
	new_loc=new_length+ret_value->output_pos-1;
	while (pos<off) /* go until the offset if equal to the position */
	{
		/* copy the character in the current string into its new location */
		output_array[new_loc]=output_array[off];                                
		par_copy_index(output_indexes,new_loc,output_indexes,off);
		par_copy_index(output_indexes,off,output_indexes,PAR_MAX_OUTPUT_ARRAY-1);
		/* move off back to the previous character */
		off--;                                       
		/* move new back for the insert of the inset string */
		new_loc-=length;                                          
		/* copy the insert string to new */
		memcpy(output_array+new_loc,buf,length);
		//055	MGS		10/14/1999	BATS#900 Fixed indexing in spanish phone numbers
		/* blank the indexes in the inserted range */
		for (i=new_loc;i<new_loc+length;i++)
		{
			par_copy_index(output_indexes,new_loc,&temp_index,0);
		}
		/* move new back one character */
		new_loc--;
	}                                    
	/* the output offset is equal to the total length of the new string */
	ret_value->output_offset=new_length;

#ifdef PARSER_DEBUG
	printf("leaving par_insert_string; insert is done\n");
#endif
	return;
}

/* ******************************************************************
*	Function Name:
*		par_insert_string_after()
*
*	Description:           
*		this function inserts the string built from current_rule into output_array 
*		after ret_value->output_pos+ret_value->output_offset;
*
*	Arguments:
*		INPUT	unsigned char 	*current_rule	pointer to the current rule
*				unsigned char	*input_array
*		I/O		unsigned char 	*output_array	a pointer to the output array
*				pindex_data_t	input_indexes
*				pindex_data_t	output_indexes
*		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
*		I/O		preturn_value_t ret_value		the return value which controls and signals starting and 
* 												ending points of the matching, and exit conditions
*		INPUT	prange_value_t	range_value		The structure that passes information about
* 												conditional replacements
*				int save_num
*				int dict_state_flag
*
*	Return Value:                                                         
*		void
*
*	Comments:
*
* ******************************************************************/
void par_insert_string_after(unsigned char *current_rule, unsigned char *input_array,
							 unsigned char *output_array, pindex_data_t input_indexes,
							 pindex_data_t output_indexes, pmatch_arrays_t match_array,
							 preturn_value_t ret_value, prange_value_t range_value,
							 int save_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	int length;
	unsigned char buf[100];
	
#ifdef PARSER_DEBUG
	printf("entering par_insert_string_after\n");
#endif
	/*
	*	check the input values
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_insert_string_after ret_value is NULL\n");
#endif
		return;
	}
	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_insert_string_after inputs are invalid\n");
#endif
		return;
	}
#endif // SANITY_CHECKING
	/*
	*	build the string for the insert after 
	*/
#ifndef GERMAN_COMPOUND_NOUNS
	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_AFTER,&length,in_rule_index);
#else
	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_INSERT | BIN_AFTER_FLAG,&length,in_rule_index);
#endif
	/* copy the inserted string into its place */
	/* the indexes will have been copied by copy_string _data */
	strcpy((output_array+(ret_value->output_pos+ret_value->output_offset)),buf);
	memcpy((output_array+(ret_value->output_pos+ret_value->output_offset)),buf,length);
	/* add the length of the inserted atring to the offset */
	ret_value->output_offset+=length;
#ifdef PARSER_DEBUG
	printf("leaving par_insert_string_after insert after is done\n");
#endif
	return;
}                                                                             

/* ******************************************************************
*	Function Name:
*		par_insert_string_before()
*
*	Description:
*		this function inserts the string built from the rule into the output array before
*		ret_value->output_pos
*
*	Arguments:
*		INPUT	unsigned char 	*current_rule	pointer to the current rule
*				unisgned char	*input_array
*		I/O		unsigned char 	*output_array	a pointer to the output array
*				pindex_data_t	input_indexes
*				pindex_data_t	output_indexes
*		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
*		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
* 												ending points of the matching, and exit conditions
*		INPUT	prange_value_t	range_value		The structure that passes information about
* 												conditional replacements
*			
*				int save_num
*				int dict_state_flag
*	Return Value:
*		void
*
*	Comments:
*		the current string in the output array is moved to its final location before 
*		the new string is placed into the array
*
* ******************************************************************/
void par_insert_string_before(unsigned char *current_rule, unsigned char *input_array,
							  unsigned char *output_array, pindex_data_t input_indexes,
							  pindex_data_t output_indexes, pmatch_arrays_t match_array,
							  preturn_value_t ret_value, prange_value_t range_value,
							  int save_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	int length;
	int i,j;
	unsigned char buf[100];           
	
#ifdef PARSER_DEBUG
	printf("entering par_insert_string_before\n");
#endif
	/*
	*	check the input values
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_insert_string_before ret_value is NULL\n");
#endif
		return;
	}
	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_insert_string_before; inputs are invalid\n");
#endif
		return;
	}
#endif // SANITY_CHECKING
	
	/* build the string to be inserted before the input string */
#ifndef GERMAN_COMPOUND_NOUNS
	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_BEFORE,&length,in_rule_index);
#else
	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_INSERT | BIN_BEFORE_FLAG,&length,in_rule_index);
#endif
	/* move the current string length characters to the right to make room for the insert string */
	j=ret_value->output_pos+ret_value->output_offset;
	for (i=j-1;i>=ret_value->output_pos;i--)
	{
		output_array[i+length]=output_array[i];
		par_copy_index(output_indexes,i+length,output_indexes,i);
	}
	/* insert the string */
	memcpy((output_array+(ret_value->output_pos)),buf,length);
	for (i=0;i<length;i++)
	{
		par_copy_index(output_indexes,ret_value->output_pos+i,output_indexes,PAR_MAX_OUTPUT_ARRAY-1);
	}
	/* add the length of the inserted string to the offset */
	ret_value->output_offset+=length;
	//	ret_value->rule++;
#ifdef PARSER_DEBUG
	printf("leaving par_insert_string_before; insert before is done\n");
#endif
	return;
}    

/*
*	Function Name:
*		par_save_string
*
*	Description:
*		this function saves the string in the output_array that is between ret_value->output_pos
*		and ret_value->output_offset into the num'th element of match_array
*
*	Arguments:                                 
*				unsigned char	*current_rule
*				unsgined char	*input_array
*		I/O		unsigned char 	*output_array	a pointer to the output array
*				pindex_data_t	input_indexes
*				pindex_data_t	output_indexes
*		INPUT	int				num				the nubmer of the array to copy the data to
*		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
*		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
* 												ending points of the matching, and exit conditions
*				int save_num
*				int dict_state_flag
*
*	Return Value:
*		void
*
*	Comments:
*
* ******************************************************************/
void par_save_string(unsigned char *current_rule, unsigned char *input_array,
					 unsigned char *output_array, pindex_data_t input_indexes,
					 pindex_data_t output_indexes, pmatch_arrays_t match_array,
					 preturn_value_t ret_value, prange_value_t range_value,
					 int save_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	/* this should be the last thing in the output array, but to be sure strncpy is used */
#ifdef PARSER_DEBUG
	printf("entering par_save_string\n");
#endif
	/* 
	*	check the input values 
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_save_string ret_value is NULL\n");
#endif
		return;
	}
	if ((output_array==NULL) || (match_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_save_string; inputs are invalid\n");
#endif
		return;
	}
	if (save_num<0 || save_num >PAR_MAX_ARRAYS)
	{
#ifndef ARM7_NOSWI
		printf("$%d is out of range\n",save_num);
#endif
		ret_value->value=FATAL_FAIL;
		return;
	}
#endif // SANITY_CHECKING
	
	/* MGS BATS #449 */
	if (ret_value->output_offset>=PAR_MAX_MATCH_ARRAY)
	{
		ret_value->value=FATAL_FAIL;
		return;
	}
	/* copy the output string to the temporoar array num */
	memcpy(match_array->array[save_num],(output_array+(ret_value->output_pos)),ret_value->output_offset);
	match_array->array_lengths[save_num]=ret_value->output_offset;
	/* null terminate the string */
	match_array->array[save_num][ret_value->output_offset]='\0';
#ifdef PARSER_DEBUG
	printf("leaving par_save_string; string is saved in array %d\n",save_num);
#endif
	return;
}

/* ******************************************************************
*	Function Name:
*      par_dom_dict_search()
*
*	Description:
*      this function searches the domain dictionary dict_num for the word in the current output
*      
*	Arguments:
*		INPUT	unsigned char 	*current_rule	pointer to the current rule
*		I/O		unsigned char 	*input_array	a pointer to the input array
*		I/O		unsigned char 	*output_array	a pointer to the output array
*				pindex_data_t	input_indexes
*				pindex_data_t	output_indexes
*		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
*		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
* 												ending points of the matching, and exit conditions
*				prange_value_t	range_value
*		INPUT	short			dict_num		The number of the domian dictionary
*		INPUT	short			dict_state_flag	if 0 do the entire search and return te value in $9
*												if 1 just return success or failure in the dict
*	Return Value:
*		void
*
*	Comments:                                          
*		$7 is used to store the actual string in the input
*		$8 is used to store the incomoing string to the search
*		$9 is used to store the outgoing string 
*		ret_value->input_offset is moved back to the beginning of the state
*
* ******************************************************************/
void par_dom_dict_search(unsigned char *current_rule, unsigned char *input_array,
					 unsigned char *output_array, pindex_data_t input_indexes,
					 pindex_data_t output_indexes, pmatch_arrays_t match_array,
					 preturn_value_t ret_value, prange_value_t range_value,
					 int dict_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	int	ipos,opos;
	int	result=FAIL;
#ifdef PARSER_DEBUG
	printf("entering par_dom_dict_search\n");
#endif
	ipos=ret_value->input_pos;
	opos=ret_value->output_pos;
	
	/* MGS BATS #449 */
	if (ret_value->input_offset>=PAR_MAX_MATCH_ARRAY)
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_dom_dict_search fatal failure of the rule\n");
#endif
		return;
	}
	if (ret_value->output_offset>=PAR_MAX_MATCH_ARRAY)
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_dom_dict_search fatal failure of the rule\n");
#endif
		return;
	}
	memcpy(match_array->array[7],input_array+ipos,ret_value->input_offset);
	match_array->array[7][ret_value->input_offset]='\0';
	match_array->array_lengths[7]=ret_value->input_offset;
	memcpy(match_array->array[8],output_array+opos,ret_value->output_offset);
	match_array->array[8][ret_value->output_offset]='\0';
	match_array->array_lengths[8]=ret_value->output_offset;
	result=par_search_for_word(match_array->array[8],ret_value->output_offset,match_array->array[9],dict_num,dict_state_flag);
	if (dict_state_flag)
	{
		if (result)
		{
#ifdef PARSER_DEBUG
			printf("leaving par_dom_dict_search 1 success\n");
#endif
			ret_value->value=SUCCESS;
			return;
		}
#ifdef PARSER_DEBUG
		printf("leaving par_dom_dict_search 1 failure\n");
#endif
		return;		
	}
	if (result==1)
	{
		match_array->array_lengths[9]=strlen(match_array->array[9]);
		if (current_rule[in_rule_index] & BIN_DICT_HIT_FAIL)
		{
			ret_value->value=FAIL;
			if (ret_value->optional==1)
			{
#ifdef PARSER_DEBUG
				printf("par_dom_dict_search hit set optinal to -1\n");
#endif
//				ret_value->optional= -1;
				ret_value->value=OPT_FAIL;
				return;
			}
			else
			{
#ifdef PARSER_DEBUG
				par_print_rule_error("",current_rule,ret_value->rule);
				printf("leaving par_dom_dict_search because of a fail hit_action\n");
#endif
				return;
			}
		}
		ret_value->input_offset=0;	/* reset for rematching */
		ret_value->output_offset=0; /* reset for rematching */
		par_match_rule(current_rule,BIN_COPY,input_array,output_array,input_indexes,output_indexes,match_array,ret_value,dict_state_flag);
#ifdef PARSER_DEBUG
		printf("input_off = %d output_off =%d\n",ret_value->input_offset,ret_value->output_offset);
#endif
		/* skip the miss_action */ /* copy the code for this from the compiler */
		ret_value->rule=current_rule[in_rule_index+4]+1;
	}
	else    /* if (result==1) */
	{
		ret_value->rule=current_rule[in_rule_index+3]+1;
		
		/* skip the hit action state */ /* copy the code for this from the compiler */
		if (current_rule[in_rule_index] & BIN_DICT_MISS_FAIL)
		{
			ret_value->value=FAIL;
			if (ret_value->optional==1)
			{
#ifdef PARSER_DEBUG
				printf("par_dom_dict_search miss set optinal to -1\n");
#endif
//				ret_value->optional= -1;
				ret_value->value=OPT_FAIL;
				return;
			}
#ifdef PARSER_DEBUG
			printf("leaving par_dom_dict_search because of a fail miss_action\n");
			par_print_rule_error("",current_rule,ret_value->rule);
#endif
			return;
		}
		ret_value->input_offset=0;	/* reset for rematching */
		ret_value->output_offset=0; /* reset for rematching */
		par_match_rule(current_rule,BIN_COPY,input_array,output_array,input_indexes,output_indexes,match_array,ret_value,dict_state_flag);
	}       
#ifdef PARSER_DEBUG
	printf("leaving par_dom_dict_search\n");
	par_print_rule_error("",current_rule,ret_value->rule);
#endif
}

/* ******************************************************************
 *	Function Name:
 *		par_look_ahead_dictionary()
 *
 *	Description:  
 *		this function handles calling match_rule for lookahead for dictionary searching
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		INPUT	unsigned char 	*input_array	the input array
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle                
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and 
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		int			1 on success
 *					0 on failure
 *
 *	Comments:
 *	
 *
 * *****************************************************************/
int par_look_ahead_dictionary(unsigned char *current_rule, unsigned char *input_array,
							  pmatch_arrays_t match_array, preturn_value_t ret_value)
{           
	unsigned char temp_output[100];
	index_data_t temp_indexes[100]; 
#ifdef PARSER_DEBUG
	printf("entering par_look_ahead_dictionary\n");
#endif
	ret_value->output_pos=0;
	ret_value->output_offset=0;
	ret_value->value=SUCCESS;	
	par_match_rule(current_rule,BIN_DICTIONARY,input_array,temp_output,temp_indexes,temp_indexes,match_array,ret_value,1);
	if (ret_value->value==SUCCESS)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_look_ahead_dictionary success\n");
#endif
		return(1);
	}
#ifdef PARSER_DEBUG
	printf("leaving par_look_ahead_dictionary failure\n");
#endif                                                    
	return(0);
}

/* ******************************************************************
 *	Function Name:
 *      par_search_for_word()
 *
 *	Description:
 *		This function searches the dictionary for the input word and 
 *		places the output in the output word
 *		capital dictionary entry matches an exact string, lower case matches either.
 *
 *	Arguments:
 *      INPUT   unsigned char 	*input			The current action state of the parser
 *				int				input_length
 *      OUTPUT  unsigned char 	*output			The length of the string placed into buf
 *		IUPUT	short			dict_num		the number of the citionary to search in
 *		INPUT	short			dict_state_flag	0 do the entire search
 *												1 stop on any match
 *
 *	Return Value:
 *		short		1 if found
 *					0 if not found
 *
 *	Comments:
 *
 * *****************************************************************/

int par_search_for_word( unsigned char *input, int input_length, unsigned char *output,
						 int dict_num, int dict_state_flag)
{
	int high,low,pos=0;
	int dict_number;
	int value=0;
	int rev_same=0,for_same=0,npos=0;
	int save_for;
#ifdef PARSER_DEBUG
	printf("entering par_search_for_word\n");
#endif                        
	dict_number=dict_num-1;	
	low=dict_point[dict_number].start;
	rev_same=low;
	high=dict_point[dict_number].end;
	for_same=high;
	while (rev_same<=for_same)
	{
		pos=((rev_same+for_same)>>1); /* divide the offset by 2 */
#ifdef PARSER_DEBUG
		printf("comparing %s to %d %s\n",input,pos,(unsigned char *)(dict_data_table+dict_index_table[pos]));
#endif
		if ((value=_stricmp(input,(unsigned char *)(dict_data_table+dict_index_table[pos])))==0)
		{
			break;
		}
		else
		{
			if (value<0)
			{
				for_same=pos-1;;
			}
			else
			{
				rev_same=pos+1;
			}
		}
	}
	if (dict_state_flag)
	{
		if (value==0)
		{
#ifdef PARSER_DEBUG
			printf("leaving par_search_for_word in dict and short search\n");
#endif
			return(1);
		}
	}                                    
	if (value!=0)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_search_for_word not in dic\n");
#endif
		return(0);
	}
	/* do the case sensitive part of the search */
	rev_same=pos-1;
	while ((rev_same>=low) && (_stricmp(input,(unsigned char *)(dict_data_table+dict_index_table[rev_same]))==0))
	{
		rev_same--;
	}                  
	for_same=pos+1;
	/* BATS 895 Fixed problem with spanish phone numbers with 9 */
	while ((for_same<=high) && (_stricmp(input,(unsigned char *)(dict_data_table+dict_index_table[for_same]))==0))
	{
		for_same++;
	}                  
	rev_same++;
	for_same--;    
	low=rev_same;
	save_for=for_same;	/* take the last insensitive match, it will be lower case it any are */
	while ((for_same!=rev_same) && !(parser_char_types[dict_data_table[dict_index_table[for_same]]] & TYPE_upper))
	{
		for_same--;
	}
	if (rev_same!=for_same)
	{
		while (rev_same<=for_same)
		{
			npos=((rev_same+for_same)>>1); /* divide the offset by 2 */
#ifdef PARSER_DEBUG
			printf("comapring case %s to %d %s\n",input,npos,(unsigned char *)(dict_data_table+dict_index_table[npos]));
#endif
			if ((value=strcmp(input,(unsigned char *)(dict_data_table+dict_index_table[npos])))==0)
			{
				break;
			}
			else
			{
				if (value<0)
				{
					for_same=npos-1;
				}
				else
				{
					rev_same=npos+1;
				}
			}
		}
		if (value==0)
		{
			save_for=npos;
		}
		else
		{
			if ((parser_char_types[dict_data_table[dict_index_table[save_for]]] & TYPE_upper))
			{
#ifdef PARSER_DEBUG
				printf("leaving par_dom_dict_search capitilization doesn't match\n");
#endif
				return(0);
			}
		}
	}
	if (value==0)
	{
//		strcpy(output,((unsigned char *)(dict_data_table+dict_index_table[save_for]))+(strlen((unsigned char *)(dict_data_table+dict_index_table[save_for]))+1));
		strcpy(output,((unsigned char *)(dict_data_table+dict_index_table[save_for]))+(input_length+1));
#ifdef PARSER_DEBUG
		printf("leaving par_search_for_word success\n");
#endif
		return(1);
	}             
	return(0);
#ifdef PARSER_DEBUG
	printf("leaving par_search_for_word failure\n");
#endif
}

/* ******************************************************************
 *	Function Name:
 *		par_check_word_string()
 *
 *	Description:
 *		this function checks the string in the range of ret_value->output_pos
 *		to ret_value->output_offset in the output array for being a possible word
 *		i.e. a consonant and a vowel.  The string is 2 characters long and can have only
 *		alpha charcters
 *
 *	Arguments:
 *				unsigned char	*current_rule
 *				unsigned char	*input_array
 *		I/O		unsigned char	*output_array		a pointer to the output array
 *				pindex_data_t	input_indexes
 *				pindex_data_t	output_indexes
 *				pmatch_arrays_t match_array
 *		I/O		preturn_value_t	ret_value		the return value strucutre
 *				prange_value_t	range_value
 *				int save_num
 *				int dict_state_flag
 *
 *	Return Value:                                                         
 *		preturn_value_t		a pointer to the return value structure passed
 *
 *	Comments:
 *
 * *****************************************************************/
void par_check_word_string(unsigned char *current_rule, unsigned char *input_array,
						   unsigned char *output_array, pindex_data_t input_indexes,
						   pindex_data_t output_indexes, pmatch_arrays_t match_array,
						   preturn_value_t ret_value, prange_value_t range_value,
						   int save_num, int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	register int i;
	int has_cons=0,has_vowel=0;
	int temp;
#ifdef PARSER_DEBUG
	printf("entering par_check_word_string\n");
#endif
	/*
	*	check the inputs for valid data 
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_check_word_string ret_value is NULL\n");
#endif
		return;
	}
	if ((output_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_check_word_string input is NULL\n");
#endif
		return;
	}                 
#endif // SANITY_CHECKING
	i=ret_value->output_pos;		
	/* BATS 874 MGS 03/03/1999 fixed word state */
	while (i<(ret_value->output_offset+ret_value->output_pos) && ((has_cons & has_vowel)==0))
	{
		temp=parser_char_types[output_array[i]];
		if (temp & TYPE_consonant)
		{
			has_cons=1;
		}
		if (temp & TYPE_vowel)
		{
			has_vowel=1;
		}                                
		if ((temp & TYPE_alpha) == 0)
		{
			if (ret_value->optional)
			{
				ret_value->value=OPT_FAIL;
			}
			else
			{	
				ret_value->value=FAIL;
			}
#ifdef PARSER_DEBUG
			printf("the output is not a word\n");
#endif
			return;
		}			
		i++;
	}
	/* BATS 874 MGS 03/03/1999 fixed word state */
	if (has_cons && has_vowel && (ret_value->output_offset)>=2)
	{
#ifdef PARSER_DEBUG
		printf("the output may be a word\n");
#endif
	}         
	else
	{
		if (ret_value->optional)
		{
			ret_value->value=OPT_FAIL;
		}
		else
		{	
			ret_value->value=FAIL;
		}
#ifdef PARSER_DEBUG
		printf("the output is not a word\n");
#endif
	}
#ifdef PARSER_DEBUG
	printf("leaving par_check_word_string\n");
#endif
	return;
}


void par_status_string(unsigned char *current_rule,
					   unsigned char *input_array,
					   unsigned char *output_array,
					   pindex_data_t input_indexes,
					   pindex_data_t output_indexes,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   prange_value_t range_value,
					   int save_num,
					   int dict_state_flag,
#ifndef GERMAN_COMPOUND_NOUNS
					   int in_rule_index)
#else
					   int in_rule_index, int insert_operation_flags)
#endif
{
	int length=0;
	unsigned char buf[10];

	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,BIN_STATUS,&length,in_rule_index);
	ret_value->parser_flag = atoi(buf);
}




/* ******************************************************************
 *	Function Name:
 *      par_build_string_from_rule()
 *
 *	Description:
 *      This function builds the replacement string from the current rule. it
 *      takes into account conditional replacements and saved strings
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *      I/O     unsigned char   *buf            A pointer to the location the the built
 *                                                string is going to be placed
 *		I/O		unsigned char 	*output_array	a pointer to the output array
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *		INPUT	prange_value_t	range_value		The structure that passes information about
 * 												conditional replacements
 *      INPUT   int             state           The current action state of the parser
 *      OUTPUT  int             *length         The length of the string placed into buf
 *				int	in_rule_index
 *
 *	Return Value:
 *      unsigned char *     a pointer to buf
 *
 *	Comments:
 *      the rule index pointer is left at the position after the ending slash of the state
 *      build the string that is going to be used for the replacement or insertion
 *      this function does the replacement for $1's
 *      it returns a pointer to the string built
 *      the string is NULL terminated
 *      the ret_value->rule is left pointing at the character after the slash
 *      this isn't called from copy_string so its not a problem to have the rule index
 *      after the slash
 *      the rule pointer is left at the character after the ending slash of the rule
 *      when conditionals are encountered, the conditional with number 0 is already built
 *      so it doesn't have to be built
 *
 * *****************************************************************/
unsigned char *par_build_string_from_rule(unsigned char *current_rule, unsigned char *buf,
										  unsigned char *output_array, pmatch_arrays_t match_array,
										  preturn_value_t ret_value, prange_value_t range_value,
										  int state, int *length, int in_rule_index)
{
	int is_cond=0;						/* is the current replacement conditional */
	int cond_num=0;						/* what number conditioal thing to replace with */
	int rule_p;							/* a temporary rule pointer */
	int buf_ind=0;						/* the current index into the temp buffer */
	int match_l=0;						/* the length of the string in the save array */
	int match_num;						/* the index of the save array to be used */
	U8 end_of_action;
	U8 end_of_build;
	
#ifdef PARSER_DEBUG
	printf("entering par_build_string_from_rule\n");
#endif
	/*
	*	check input values
	*/
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_build_string_from_rule ret_value is NULL\n");
#endif
		return(NULL);
	}
	if ((current_rule==NULL) || (buf == NULL) || (match_array == NULL) ||
		(state == BIN_END_OF_RULE) || (length==NULL))
	{
#ifdef PARSER_DEBUG
		printf("leaving par_build_string_from_rule; inputs are invalid\n");
#endif
		ret_value->value=FATAL_FAIL;
		return(NULL);
	}
#endif // SANITY_CHECKING
	
	rule_p=ret_value->rule;
	end_of_action=current_rule[in_rule_index+2];
	end_of_build=end_of_action;
#ifdef PARSER_DEBUG
	printf("current_rule[%d]=%c\n",rule_p,current_rule[rule_p]);
	if (current_rule[rule_p]==BIN_EXACT)
		printf("found an exact character delimiter\n");
#endif
	buf[0]='\0';	/* clear buf just in case */
	/* build the string until a '/' is hit */
	
	if (current_rule[in_rule_index] & BIN_CONDITIONAL_REPLACE)
	{
		is_cond=-1;
#ifndef GERMAN_COMPOUND_NOUNS
		switch (state)
#else
		switch(state & BIN_OPERATION_MASK)
#endif
		{
#ifndef GERMAN_COMPOUND_NOUNS
			/* MGS fixed this, it was BIN_INSERT but it should be BIN_BEFORE */
		case BIN_BEFORE:
#endif
#ifdef GERMAN_COMPOUND_NOUNS
		case BIN_INSERT:
			if (state & BIN_BEFORE_FLAG)
			{
#endif
			/* read the first character in the output range */
			if (range_value->range_set==2)
			{
				cond_num=range_value->start;
			}
			else
			{
				cond_num=output_array[ret_value->output_pos]-'0';
				if (cond_num<0 || cond_num>9)
					cond_num=0;
			}
			break;
#ifndef GERMAN_COMPOUND_NOUNS
		case BIN_AFTER:
#else
			}
			if (state & BIN_AFTER_FLAG)
			{
#endif
			/* convert the last character in the range */
			if (range_value->range_set==2)
			{
				cond_num=range_value->start;
			}
			else
			{
				cond_num=output_array[ret_value->output_pos+ret_value->output_offset-1]-'0';
				if (cond_num<0 || cond_num>9)
					cond_num=0;
			}
			break;
#ifdef GERMAN_COMPOUND_NOUNS
			}
			/* for GERMAN_COMPOUND_NOUNS, it is intended to not have a break after 
			   the case for BIN_INSERT so it can do the right thing */
#endif

		default:
			if (range_value->range_set==2)
			{
				cond_num=range_value->start;
			}
			else
			{
				/* convert all the character in the range */
				/*	a range_value->range_set == -1 cant have any fancy conditionals
				so it just does the normal stuff of converting the digits
				*/
				output_array[ret_value->output_offset+ret_value->output_pos]='\0';
				cond_num=par_convert_number_new2(output_array+ret_value->output_pos);
				if (range_value->range_set==1)
				{
					cond_num-=range_value->start;
				}
			}
		}
		if (cond_num > (current_rule[in_rule_index+3]))
		{
			cond_num=0;
		}
		if (cond_num==0)
		{
			end_of_build=current_rule[in_rule_index+4];
		}
		else
		{
			if (cond_num == (current_rule[in_rule_index+3]))
			{
				rule_p=current_rule[in_rule_index+3+cond_num]+1;
				end_of_build=current_rule[in_rule_index+2];
			}
			else
			{
				rule_p=current_rule[in_rule_index+3+cond_num]+1;
				end_of_build=current_rule[in_rule_index+4+cond_num];
			}
		}
		
	}
	while (rule_p<=end_of_build)
	{
		/* build the string until either a slash is found or a conditional is found */
		switch (current_rule[rule_p] & BIN_OPERATION_MASK)
		{
		case BIN_EXACT:		/* an exact string was found */
			rule_p++;
			match_l=current_rule[rule_p];
			rule_p++;
			memcpy(&buf[buf_ind],&current_rule[rule_p],match_l);
			rule_p+=match_l;
			buf_ind+=match_l;
			break;
		case BIN_RESTORE:						/* a $# sequence was found. */
			rule_p++;
			match_num=current_rule[rule_p];
			match_l=match_array->array_lengths[match_num];	/* get the length of the strig in the array */
			memcpy(buf+buf_ind,match_array->array[match_num],match_l);
			buf_ind+=match_l;   		/* add the length of the string in the array to buff_ind */
			rule_p++;
			break;
		case BIN_HEXADECIMAL:
			/* a hexadecimal value was found */
			/* hexadecimal values have to be specified in the format 0xab */
			/* they must have 2 legal letters after the x */
			rule_p++;
			buf[buf_ind]=current_rule[rule_p]; /* put the value into the buffer array */
			buf_ind++;
			rule_p++;
			break;
		default:
			/* the current character is not a recognized type */
#ifdef PARSER_DEBUG
			par_print_rule_error("build_string;unrecognized delimiter",current_rule,rule_p);
#endif
			ret_value->value=FATAL_FAIL;
			return(NULL);
		}
	}
	/* the end of the rule has been hit */
	buf[buf_ind]='\0';
	*length=buf_ind;
	ret_value->rule=end_of_action+1;
#ifdef DEBUG2
	par_print_rule_error("no error, just debugging output position",current_rule,rule_p);
#endif
#ifdef 	PARSER_DEBUG
	printf("leaving par_build_string_from_rule buf=%s\n",buf);
#endif
	return(buf);
}

/* ******************************************************************
 *	Function Name:
 *      par_match_string()
 *
 *	Description:
 *      this function takes care of the details involved in matching all the different
 *      character types in the parser
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *      INPUT   int             char_type       The current character type being matched
 *		INPUT	unsigned char 	*input_array	the input array
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *		INPUT	prange_value_t	range_value		The structure that passes information about
 * 												conditional replacements
 *      INPUT   int             lookahead       If this is 1 perform lookahead
 *                                              if this is 0 do not perform lookahead and fail quietly
 *      INPUT   int             break_on_min_match  if 1 stop processing the type on the minimum 
 *                                                  matched string
 *
 *	Return Value:
 *      int     the length of the string matched
 *              -1 if the end of the string was reached
 *
 *	Comments:
 *      ranges for digits can still be processed, but the range replacement will not work properly
 *      if range_value->range_set ==0 and there is a range set the range value
 *      this function has to perform the lookahead to try to resolv ambiguity in rules
 *      this resolution will not be perfect
 *      leave the rule pointer pointing to the character after the first character type definition
 *      this character will be a rule type, a character type, a single quote, or a slash
 *
 * *****************************************************************/
int par_match_string(register unsigned char *current_rule, int char_type,
					 unsigned char *input_array, pmatch_arrays_t match_array,
					 preturn_value_t ret_value,prange_value_t range_value,
					 int lookahead, int break_on_min_match)
{
	register int rule_p;
	register int ipos;
	int length=0;
	int value;
	
	
#ifdef PARSER_DEBUG
	printf("entering par_match_string\n");
#endif
	

	
	rule_p=ret_value->rule;
	ipos=ret_value->input_pos+ret_value->input_offset;
	
	if (char_type<=BIN_DIGIT)
	{
		if (current_rule[rule_p] & BIN_DIGIT_RANGE)
		{
			/* check for the special digit type and if it is there */
			/* use the special digit matching function. */
			/* use the normal one otherwise */
			length=par_match_digits(current_rule,input_array,match_array,ret_value,range_value,lookahead,break_on_min_match);
		}
		else
		{
			length=par_match_standard(current_rule,char_type,input_array,match_array,ret_value,lookahead,break_on_min_match);
		}
		rule_p=ret_value->rule;
	}
	else	/* if (char_type<=BIN_DIGIT) */
	{
		if (char_type<=BIN_HEXADECIMAL)
		{
			
			if (char_type==BIN_EXACT)
			{
				rule_p++;
				length=0;
				value=current_rule[rule_p];
				rule_p++;
				if (current_rule[ret_value->rule] & BIN_CASE_INSEN)
				{
					while (length<value)
					{
						if (par_lower[current_rule[rule_p]]!=par_lower[input_array[ipos+length]])
						{
#ifdef PARSER_DEBUG
							printf("leaving par_match_string; exact characters dont match\n");
#endif
							if (ret_value->optional==1)
							{
#ifdef PARSER_DEBUG
								printf("par_match_string; exact optional set to -1\n");
#endif
//								ret_value->optional= -1;
								ret_value->value=OPT_FAIL;
							}
							else
							{
								ret_value->value=FAIL;
							}
							return(0);
						}
						length++;
						rule_p++;
					}
				}
				else
				{
					if (current_rule[rule_p]!=input_array[ipos])
					{
#ifdef PARSER_DEBUG
						printf("leaving par_match_string; exact characters dont match\n");
#endif
						if (ret_value->optional==1)
						{
#ifdef PARSER_DEBUG
							printf("par_match_string; exact optional set to -1\n");
#endif
							//ret_value->optional= -1;
							ret_value->value=OPT_FAIL;
						}
						else
						{
							ret_value->value=FAIL;
						}
						return(0);
					}
					if (memcmp(input_array+ipos,current_rule+rule_p,value)!=0)
					{
#ifdef PARSER_DEBUG
						printf("leaving par_match_string; exact characters dont match\n");
#endif
						if (ret_value->optional==1)
						{
#ifdef PARSER_DEBUG
							printf("par_match_string; exact optional set to -1\n");
#endif
			//				ret_value->optional= -1;
							ret_value->value=OPT_FAIL;
							
						}
						else
						{
							ret_value->value=FAIL;
						}
						return(0);
					}
					rule_p+=value;
					length=value;
				}
			}
			else /* if (char_type==BIN_EXACT) */
			{
				/* BIN_HEXADECIMAL */
				rule_p++;
				if (input_array[ipos]!=current_rule[rule_p])
				{
					if (ret_value->optional==1)
					{
#ifdef PARSER_DEBUG
						printf("par_match_string; hex optional set to -1\n");
#endif
		//				ret_value->optional= -1;
						ret_value->value=OPT_FAIL;
					}
					else
					{
						ret_value->value=FAIL;
					}
#ifdef PARSER_DEBUG
					printf("leaving par_match_string hexadecimal value %02X mismatch\n",value);
#endif
					return(0);
				}
				length=1;
				rule_p++;
			}
		}
		else /* if (char_type<=BIN_HEXADECIMAL) */
		{
			if (char_type==BIN_RESTORE)
			{
				rule_p++;
				value=current_rule[rule_p];					/* get the array number */
				length=match_array->array_lengths[value];	/* get the length of the strig in the array */
				if ((memcmp(input_array+ipos,match_array->array[value],length)!=0))
				{
					if (ret_value->optional==1)
					{
#ifdef PARSER_DEBUG
						printf("par_match_string; save optional set to -1\n");
#endif
//						ret_value->optional= -1;
						ret_value->value=OPT_FAIL;
						return(0);

					}
					ret_value->value=FAIL;
					return(0);
				}
				rule_p++;
			}
			else /* if (char_type==BIN_RESTORE) */
			{
				/* BIN_SETS */	
				length=par_match_sets_with_ranges(current_rule,input_array,match_array,ret_value,range_value,lookahead,break_on_min_match);
				rule_p=ret_value->rule;
				/* find the { */ /* } */
				/* find the first thing to search for */
				/* save the rule pointer for multiple matches */
				/* loop calling par_match_string pointing to each thing to match before the comma
				and if all of them are successful, return the total nubmer of characters matched
				if not, go on to the next section */
				/* the ret_value structure passed is the same one that is passed to the current
				par_match_string, so the rule field will be corrupted */
				/* repeat the loop for each time iteration of the <#> thing */
				/* set the range if only one is found */
			} /* if (char_type==BIN_RESTORE) */
		} /* if (char_type<=BIN_HEXADECIMAL) */
	} /* if (char_type<=BIN_DIGIT) */



	if (length==0)
	{
		if (ret_value->optional==1)
		{
			ret_value->value=OPT_FAIL;
		}
		else
		{
			ret_value->value=FAIL;
		}
	}
	if (length==-2)
	{
		length=0;
	}
	ret_value->rule=rule_p;
#ifdef PARSER_DEBUG
	printf("leaving par_match_string length = %d ret_value->value=%d\n",length,ret_value->value);
#endif
	return(length);
}




/* ******************************************************************
 *	Function Name:
 *      par_copy_string_data()
 *
 *	Description:
 *      this function copies num_chars bytes of dat from the input_array
 *      to the ouput_array
 *
 *	Arguments:
 *		INPUT	unsigned char 	*input_array	the input array
 *				pindex_data_t	input_indexes
 *		OUTPUT	unsigned char 	*output_array	the output array
 *				pindex_data_t	output_indexes
 *      INPUT   int             num_chars       The number of characters to copy
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *      void
 *
 *	Comments:
 *
 * *****************************************************************/
void par_copy_string_data(unsigned char *input_array, pindex_data_t input_indexes,
						  unsigned char *output_array, pindex_data_t output_indexes,
						  int num_chars, preturn_value_t ret_value)
{
#ifdef PARSER_DEBUG
	printf("entering par_copy_string_data\n");
#endif
	memcpy(&output_array[ret_value->output_pos+ret_value->output_offset],&input_array[ret_value->input_pos+ret_value->input_offset],num_chars);
	
	par_copy_index_list(output_indexes,ret_value->output_pos+ret_value->output_offset,input_indexes,ret_value->input_pos+ret_value->input_offset,num_chars);
	/* turn this into two memcpy's */
/* *********************** NOT USED ********************************/
#if 0
	for (i=0;i<num_chars;i++)
	{
		output_array[ret_value->output_pos+ret_value->output_offset+i]=input_array[ret_value->input_pos+ret_value->input_offset+i];
		par_copy_index(output_indexes,ret_value->output_pos+ret_value->output_offset+i,input_indexes,ret_value->input_pos+ret_value->input_offset+i);
	}
#endif // 0
/* *****************************************************************/

#ifdef PARSER_DEBUG
	printf("leaving par_copy_string_data\n");
#endif
}


/* ******************************************************************
 *	Function Name:
 *      par_convert_number
 *
 *	Description:
 *      this function converts a decimal number to a short
 *
 *	Arguments:
 *      INPUT   unsigned char   *string     a pointer to a string with a number in it
 *      INPUT   int             num         The number of digits to convert
 *
 *	Return Value:
 *      short       the converted decimal value
 *                  or -1 on error
 *
 *	Comments:
 *      testing shows that this function is about 10%-20% faster than atoi()
 *
 * *****************************************************************/
int par_convert_number(unsigned char *string, int num)
{
	register int i,total=0,temp;
	
	for (i=0;i<num;i++)
	{
		temp=string[i]-'0';
		if ((temp<0) || (temp>9))
			return(total);
		total=total*10+temp;
	}
	return(total);
}

/* ******************************************************************
 *	Function Name:
 *      par_convert_number_new2()
 *
 *	Description:
 *      this function converts a decimal number to a short
 *
 *	Arguments:
 *      INPUT   unsigned char   *string     a pointer to a string with a number in it
 *
 *	Return Value:
 *      short       the converted decimal value
 *               
 *
 *	Comments:
 *      testing shows that this function is about 10%-20% faster than atoi()
 *      this function converts the number until a non number is found
 *
 * *****************************************************************/
int par_convert_number_new2(unsigned char *string)
{
	register int i,total=0,temp;
	
	for (i=0;;i++)
	{
		temp=string[i]-'0';
		if ((temp<0) || (temp>9))
			return(total);
		total=total*10+temp;
	}
	return(total);
}

/* ******************************************************************
 *	Function Name:
 *      par_get_int_length()
 *
 *	Description:
 *      this function calculates the length of a decimal integer
 *
 *	Arguments:
 *      INPUT short i	the number to calculate the length of
 *
 *	Return Value:
 *      short	The length of i
 *
 *	Comments:
 *      the number zero has a length of 1
 *      this function only converts positive numbers correctly
 *
 * *****************************************************************/
int par_get_int_length(register int i)
{
	if (i<10)
		return(1);
	else if (i<100)
		return(2);
	else if (i<1000)
		return(3);
	else if (i<10000)
		return(4);
	else
		return(5);

/* **************** NOT USED ***************************************/
#if 0
	register int j;
#ifdef PARSER_DEBUG
	printf("entering par_get_int_length\n");
#endif

	if (i==0)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_get_int_length length=1\n");
#endif
		return(1);
	}
	for (j=0;i;j++)
		i/=10;
#ifdef PARSER_DEBUG
	printf("leaving par_get_int_length length=%d\n",j);
#endif
	return(j);
#endif // 0
/* *****************************************************************/
}

/* ******************************************************************
 *	Function Name:
 *      par_look_ahead()
 *
 *	Description:
 *      this function tries to resolve ambigous rules by looking ahead in
 *      the rule to find the next character type and then trying to match it
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		I/O		unsigned char 	*input_array	a pointer to the input array
 *      INPUT   int             ipos			The current input position
 *		I/O		int				*find_index		The position of the chracter type found in the rule
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		short		1 for par_look_ahead success
 *					0 four failure
 *
 *	Comments:
 *		this function will either succeed in lookahead
 *		or it will fail quietly in all other cases (including bad syntax in rules)
 *
 * *****************************************************************/
int par_look_ahead( register unsigned char *current_rule, unsigned char *input_array,
					register int ipos, int find_index, pmatch_arrays_t match_array,
					preturn_value_t ret_value)
{
#ifndef NEW_PARSER_FILE_LOADING
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0 };
#else
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,NULL };
#endif
	range_value_t		range_value = {0,0,0,0};
	int char_length=0;
	int value;
	register int rule_p;
	int char_type;

	rule_p=find_index;
#ifdef PARSER_DEBUG
	printf("entering par_look_ahead\n");
	par_print_rule_error("par_look_ahead; the current position is",current_rule,ret_value->rule);
#endif
	char_type=current_rule[find_index] & BIN_OPERATION_MASK;

	if (char_type==BIN_EXACT)
	{
		rule_p++;			/* skip the single quote */
		value=current_rule[rule_p]+ipos;
		rule_p++;
		if (current_rule[find_index] & BIN_CASE_INSEN)
		{
			if (par_lower[current_rule[rule_p]]!=par_lower[input_array[ipos]])
			{
#ifdef PARSER_DEBUG
				printf("leaving par_look_ahead; exact failure\n");
#endif
				return(0);
			}
			while (ipos<value)
			{
				if (par_lower[current_rule[rule_p]]!=par_lower[input_array[ipos]])
				{
#ifdef PARSER_DEBUG
					printf("leaving par_look_ahead; exact failure\n");
#endif
					return(0);
				}
				ipos++;
				rule_p++;
			}
#ifdef PARSER_DEBUG
			printf("leaving par_look_ahead; exact success\n");
#endif
			return(1);
		}
		else /* if (current_rule[find_index] & BIN_CASE_INSEN) */
		{
			if (current_rule[rule_p]!=input_array[ipos])
			{
#ifdef PARSER_DEBUG
				printf("leaving par_look_ahead; exact failure\n");
#endif
				return(0);
			}

			while (ipos<value)
			{
				if (current_rule[rule_p]!=input_array[ipos])
				{
#ifdef PARSER_DEBUG
					printf("leaving par_look_ahead; exact failure\n");
#endif
					return(0);
				}
				ipos++;
				rule_p++;
			}
#ifdef PARSER_DEBUG
			printf("leaving par_look_ahead; exact success\n");
#endif
			return(1);
		}
#ifdef PARSER_DEBUG
		printf("leaving par_look_ahead; exact failure\n");
#endif
		return(0);
	}
	else /* if (char_type==BIN_EXACT) */
	{
		if (char_type<=BIN_DIGIT)
		{
			if (current_rule[find_index] & BIN_DIGIT_RANGE)
			{
				/* check for the special digit type and if it is there */
				/* use the special digit matching function. */
				/* use the normal one otherwise */
				new_ret.rule= find_index;
				new_ret.value=SUCCESS;
				new_ret.input_pos=ipos;
				char_length=par_match_digits(current_rule,input_array,match_array,&new_ret,&range_value,0,1);
				if (new_ret.value==SUCCESS)
				{
					if (char_length>0)
					{
#ifdef PARSER_DEBUG
						printf("leaving par_look_ahead;digit range success\n");
#endif
						return(1);
					}
				}
#ifdef PARSER_DEBUG
				printf("leaving par_look_ahead;digit range fail\n");
#endif
				return(0);
			}
			else
			{	/* most types */
				
				new_ret.rule= find_index;
				new_ret.value=SUCCESS;
				new_ret.input_pos=ipos;
				char_length=par_match_standard(current_rule,char_type ,input_array,match_array,&new_ret,0,1);
				if (new_ret.value==SUCCESS)
				{
					if (char_length>0)
					{
#ifdef PARSER_DEBUG
						printf("leaving par_look_ahead;standard success\n");
#endif
						return(1);
					}
				}
#ifdef PARSER_DEBUG
				printf("leaving par_look_ahead;standard fail\n");
#endif
				return(0);
			}
			
		}
		else /* if (char_type<=BIN_DIGIT) */
		{
			if (char_type==BIN_HEXADECIMAL)
			{
				rule_p++;
				if (input_array[ipos]==current_rule[rule_p])
				{
#ifdef PARSER_DEBUG
					printf("leaving par_look_ahead; hex number success\n");
#endif
					return(1);
				}
#ifdef PARSER_DEBUG
				printf("leaving par_look_ahead; hex number failure\n");
#endif
				return(0);
			}
			else /* if (char_type==BIN_HEXADECIMAL) */
			{
				if (char_type==BIN_RESTORE)
				{
					rule_p++;
					value=current_rule[rule_p];		/* get the array number */
					char_length=match_array->array_lengths[value];	/* get the length of the strig in the array */
					if ((memcmp(input_array+ipos,match_array->array[value],char_length)==0))
					{
						if (match_array->array[value][0]!='\0')
						{
#ifdef PARSER_DEBUG
							printf("leaving par_look_ahead; par_save_string success\n");
#endif
							return(1);
						}
					}
#ifdef PARSER_DEBUG
					printf("leaving par_look_ahead; par_save_string failure\n");
#endif
					return(0);
				}
				else if (char_type==BIN_SETS)
				{
					new_ret.rule= find_index;
					new_ret.value=SUCCESS;
					new_ret.input_pos=ipos;
					char_length=par_match_sets_with_ranges(current_rule,input_array,match_array,&new_ret,&range_value,0,1);
					
					if (new_ret.value==SUCCESS)
					{
						if (char_length>0)
						{
#ifdef PARSER_DEBUG
							printf("leaving par_look_ahead;sets success\n");
#endif
							return(1);
						}
					}
#ifdef PARSER_DEBUG
					printf("leaving par_look_ahead;sets fail\n");
#endif
					return(0);
				}
				else /* (char_type==BIN_RESTORE) */
				{	/* BIN_DICTIONARY */
					par_copy_return_value(&new_ret,ret_value);			  
					new_ret.input_pos=ipos;
					if (par_look_ahead_dictionary(current_rule,input_array,match_array,&new_ret))
					{
#ifdef PARSER_DEBUG
						printf("par_look_ahead;dictionary_state dict entry found\n");
#endif
						return(1);
					}
#ifdef PARSER_DEBUG
					printf("par_look_ahead;dictionary_state dict entry not found\n");
#endif
					return(0);			   
					
				} /* (char_type==BIN_RESTORE) */
			} /* if (char_type<=BIN_HEXADECIMAL) */
		} /* if (char_type<=BIN_DIGIT) */
	} /* if (char_type==BIN_EXACT) */

#ifdef PARSER_DEBUG
	printf("leaving par_look_ahead; how did it get here??\n");
#endif
	return(0);
	
}

/* ******************************************************************
 *	Function Name:
 *		par_copy_word_to_output()
 *
 *	Description:
 *      this function copies the next word in the input_array to
 *		the output_array
 *
 *	Arguments:
 *		INPUT	unsigned char 	*input_array	a pointer to the input_array
 *		OUTPUT	unsigned char	*output_array	a pointer to the output_array
 *				pindex_data_t	input_indexes
 *				pindex_data_t	output_indexes
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		int		0 if the copying completed without errors
 *				-1 if the copying ended at the end of the string
 *
 *	Comments:
 *
 * *****************************************************************/
int par_copy_word_to_output(unsigned char *input_array, unsigned char *output_array,
							pindex_data_t input_indexes, pindex_data_t output_indexes,
							preturn_value_t ret_value)
{
	int i,ipos,opos;
	
#ifdef PARSER_DEBUG
	printf("entering par_copy_word_to_output\n");
#endif
	if ((ret_value==NULL) || (input_array==NULL) || (output_array==NULL))
	{
#ifdef PARSER_DEBUG
		printf("leaving par_copy_word_to_output a 0\n");
#endif
		return(0);
	}                      
	ipos=ret_value->input_pos+ret_value->input_offset;
	opos=ret_value->output_pos+ret_value->output_offset;
	i=0;
	/* this function only copies non whitespace, so it never has to check for indexes */
	while (((parser_char_types[(int)(input_array[ipos+i])] & TYPE_white)==0) && (input_array[ipos+i]!='\0'))
	{
		output_array[opos+i]=input_array[ipos+i];        
		/* copy the index anyway even if it isn't there */
		par_copy_index(output_indexes,opos+i,input_indexes,ipos+i);
#ifdef PARSER_DEBUG
		printf("output_array[%d]=%c ",opos+i,output_array[opos+i]);
#endif
		i++;
	}
	ret_value->input_offset+=i;
	ret_value->output_offset+=i;
	if (input_array[ipos+i]=='\0')
	{
#ifdef PARSER_DEBUG
		printf("leaving par_copy_word_to_output b -1\n");
#endif
		return(-1);
	}
#ifdef PARSER_DEBUG
	printf("leaving par_copy_word_to_output b \n");
#endif
	return(0);
}

/* ******************************************************************
 *	Function Name:
 *		par_skip_white_space()
 *
 *	Description:
 *		this function skips the whitespace in the input and only copies the
 *		first whitespace character it encounters to the output
 *
 *	Arguments:
 *		INPUT	unsigned char 	*input_array	a pointer to the input_array
 *				pindex_data_t	input_indexes
 *		OUTPUT	unsigned char	*output_array	a pointer to the output_array
 *				pindex_data_t	output_indexes
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		int		0 if the copying completed without errors
 *				-1 if the copying ended at the end of the string
 *
 *	Comments:
 *		if the starting position ret_value->rule is not whitespace,
 *		no action is taken
 * *****************************************************************/
int par_skip_white_space(unsigned char *input_array, pindex_data_t input_indexes,
						 unsigned char *output_array, pindex_data_t output_indexes,
						 preturn_value_t ret_value)
{
	int i,ipos,opos,j;
	
#ifdef PARSER_DEBUG
	printf("entering par_skip_white_space\n");
#endif
	if ((ret_value==NULL) || (input_array==NULL) || (output_array==NULL))
	{
#ifdef PARSER_DEBUG
		printf("leaving par_skip_white_space a 0\n");
#endif
		return(0);
	}
	ipos=ret_value->input_pos+ret_value->input_offset;
	opos=ret_value->output_pos+ret_value->output_offset;
	i=0;                                             
	j=0;
	while (((parser_char_types[(int)(input_array[ipos+i])] & TYPE_white)!=0) && (input_array[ipos+i]!='\0'))
	{
		if (i==0 || par_is_index_set(input_indexes,ipos+i))
		{
			output_array[opos+j]=input_array[ipos+i];
			if (par_is_index_set(input_indexes,ipos+i))
			{                                       
#ifdef INDEX_DEBUG
				printf("copying index from %d to %d\n",ipos+i,opos+j);
#endif
				par_copy_index(output_indexes,opos+j,input_indexes,ipos+i);
				j++;
			}
			else
			{
				j++;
			}
#ifdef INDEX_DEBUG
			if (i!=0)
			{
				printf("copied extra space because of index\n");
			}
			printf("output_array[%d]=%c\n",opos+i,output_array[opos+i]);
#endif
		}
		i++;
	}
	ret_value->input_offset+=i;
	if (i>0)
		ret_value->output_offset+=j;
	if (input_array[ipos+i]=='\0')
	{
#ifdef PARSER_DEBUG
		printf("leaving par_skip_white_space b -1\n");
#endif
		return(-1);
	}
#ifdef PARSER_DEBUG
	printf("leaving par_skip_white_space b 0\n");
#endif
	return(0);
}

/* ******************************************************************
 *	Function Name:
 *		par_print_rule_error()
 *
 *	Description:
 *		this function prints an error in a rule by printing the message,
 *		the rule position that the error was in, the rule itself and a carret
 *		charcter under the character that corresponds to the position
 *
 *	Arguments:
 *		INPUT	unsigned char 	*message		A pointer to the message to be printed
 *      INPUT	unsigned char	*current_rule	A pointer to the current rule
 *		INPUT	int				pos				the position he error occurred at
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *
 * ******************************************************************/
void par_print_rule_error(char *message, unsigned char *current_rule, int pos)
{
#ifndef ARM7_NOSWI
	int i;
	printf("%s\n",message);
	printf("error in rule at position %d\n",pos);
	printf("rule, %s\n",current_rule);
	printf("      ");
	for (i=0;i<pos;i++)
	{
		printf(" ");
	}
	printf("^\n");
#endif
}

/* ******************************************************************
 *	Function Name:
 *		copy_return_value()
 *
 *	Description:
 *		the function copies one return_value strictire to another
 *
 *	Arguments:
 *		OUTPUT	preturn_value_t		dest		The destination of the copy
 *		INPUT	preturn_value_t		src			the source of the copy
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *
 * *****************************************************************/
#ifdef PARSER_DEBUG
void par_copy_return_value(preturn_value_t dest, preturn_value_t src)
{
	memcpy(dest,src,sizeof(return_value_t));
}
#endif

/* *****************************************************************
 *	Function Name:
 *		par_match_standard()
 *
 *	Description:
 *		this function matches most of the charcter types
 *		it handles matching of all the types that have the form
 *			A<3> A~<3>
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule		pointer to the current rule
 *      INPUT   int             char_type			The current character type being matched
 *		INPUT	unsigned char 	*input_array		the input array
 *		I/O		pmatch_arrays_t match_array			the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value			the return value which controls and signals starting and
 * 													ending points of the matching, and exit conditions
 *      INPUT   int             lookahead			If this is 1 perform lookahead
 *													if this is 0 do not perform lookahead and fail quietly
 *      INPUT   int             break_on_min_match  if 1 stop processing the type on the minimum 
 *                                                  matched string
 *
 *	Return Value:
 *      int     the length of the string matched
 *              -1 if the end of the string was reached
 *				-2 if the string had no matching length but was a successful match
 *
 *	Comments:
 *
 * *****************************************************************/
int par_match_standard(unsigned char *current_rule, int char_type,
					   unsigned char *input_array, pmatch_arrays_t match_array,
					   preturn_value_t ret_value, int lookahead, int break_on_min_match)
{
	int rule_p;
	int length=0;
	int ipos;
	int min_range= -1,max_range= -1;
	int match_is_over=0;
	int satisfied_min_cond= -1;
    int new_char_type;
	int i=0,counter;          
	int match_non_match=1;         /* 1 is match 0 is non-match */
//	int find_type= -2;
	int temp;
	int temp2;
	int in_rule_p;
	int next_type=0;
	int num_desc;
	int large_desc=0;
	
	
#ifdef PARSER_DEBUG
	printf("entering par_match_standard\n");
#endif

#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_match_standard a 0\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_match_standard b 0\n");
#endif
		return(0);
	}
#endif // SANITY_CHECKING
	rule_p=ret_value->rule;
	in_rule_p=rule_p;
	ipos=ret_value->input_pos+ret_value->input_offset;
	/* skip past the type delimiter */
	new_char_type=char_type_table[char_type];
	if (current_rule[rule_p] & BIN_LOOK_FROM_DISABLE)
	{
		lookahead=0;
#ifdef PARSER_DEBUG
		printf("match_standard set no lookahead\n");
#endif
	}
	rule_p++; /* move past operation */
	temp=current_rule[rule_p];
	if (temp & BIN_COMPLIMENT)
	{
#ifdef PARSER_DEBUG
		printf("match_standard set to non matches\n");
#endif
		match_non_match=0;
	}
	if (temp & BIN_LARGE_DESC)
	{
		large_desc=1;
#ifdef PARSER_DEBUG
		printf("match_standard using large descriptors\n");
#endif
	}
	num_desc=(temp & BIN_SIZE_DESC_MASK);
	counter=0;
	rule_p++; /* move past number of descrpitors */
	if (lookahead!=0)
	{
		next_type=current_rule[rule_p];
		rule_p++; /* move past next type */
	}
	/* either there is a number or there is a star of a plus */ 
	while ((counter<num_desc) && (match_is_over==0))
	{
		if (large_desc)
		{
			temp=get_short(current_rule+rule_p);
			rule_p+=2;
			counter++;
			min_range = temp & BIN_MAX_LARGE_DESC;
			max_range=min_range;
			if (temp & BIN_LARGE_ANY_NUMBER)
			{
				max_range=INT_MAX;
			}
			else
			{
				if (temp & BIN_LARGE_CONTINUE)
				{
					temp=get_short(current_rule+rule_p);
					rule_p+=2;
					counter++;
					max_range = temp & BIN_MAX_LARGE_DESC;
					if (temp & BIN_LARGE_ANY_NUMBER)
					{
						max_range=INT_MAX;
					}
				}
			}
		}
		else
		{
			temp=current_rule[rule_p];
			rule_p++;
			counter++;
			min_range = temp & BIN_MAX_SMALL_DESC;
			max_range=min_range;
			if (temp & BIN_SMALL_ANY_NUMBER)
			{
				max_range=INT_MAX;
			}
			else
			{
				if (temp & BIN_SMALL_CONTINUE)
				{
					temp=current_rule[rule_p];
					rule_p++;
					counter++;
					max_range = temp & BIN_MAX_SMALL_DESC;
					if (temp & BIN_SMALL_ANY_NUMBER)
					{
						max_range=INT_MAX;
					}
				}
			}
		}
		
		
		
		/* do the character matching starting at length until min_length */
		/* then match from min_length to max_length */
		/* once min_length is reached, do lookahead for the next char type if necessary */
		if (min_range==0)
		{
			/* signal that there could be success on a zero length string */
			/* or the end of string could be successful too */
			satisfied_min_cond= -2;                          
			if (length==0)
			{
				if (lookahead)
				{
					if ((par_look_ahead(current_rule,input_array,ipos,next_type,match_array,ret_value)==1))
					{
						break;
					}
				}
			}
		}
		if (match_non_match==1)
		{
			
			for (i=length;i<max_range;i++)
			{
				temp2=input_array[ipos+i];
				
				if ((((parser_char_types[temp2]) & new_char_type)==0) || (temp2=='\0'))
				{   
					/* the matching failed in the section between the last range and the current range */
					/* return length as the number of character matched */
					match_is_over=1;
					break;
				}
				temp=i+1;
				if ((temp)>=min_range)
				{
					satisfied_min_cond=length=temp;
					if (break_on_min_match==1)
					{
						match_is_over=1;
						break;
					}					    
					if ((lookahead) && ((counter<num_desc) || ( ((temp)<max_range))))
					{
						if (par_look_ahead(current_rule,input_array,ipos+temp,next_type,match_array,ret_value)==1)
						{
							match_is_over=1;
							break;
						}
					}
				}
			}
		}
		else
		{
			for (i=length;i<max_range;i++)
			{
				temp2=input_array[ipos+i];
				
				if ((((parser_char_types[temp2]) & new_char_type)!=0) || (temp2=='\0'))
				{   
					/* the matching failed in the section between the last range and the current range */
					/* return length as the number of character matched */
					match_is_over=1;
					break;
				}
				temp=i+1;
				if ((temp)>=min_range)
				{
					satisfied_min_cond=length=temp;
					if (break_on_min_match==1)
					{
						match_is_over=1;
						break;
					}					    
					if ((lookahead) && ((counter<num_desc) || (((temp)<max_range))))
					{
						if (par_look_ahead(current_rule,input_array,ipos+temp,next_type,match_array,ret_value)==1)
						{
							match_is_over=1;
							break;
						}
					}
				}
			}
		}
	}
#ifdef PARSER_DEBUG
	printf("par_match_standard;rule_p=%d\n",rule_p);
#endif
	/* look for the next format type specifier */
	/* look up in the table of ambiguity to know whether or not to do the lookahead parsing */
	/* start mathcing the string */
	/* once the minimum requirement for the type is met, start checking for the next type if required */
	/* end the matching once the lookahead is successful or the current match hits the maximum 
	number of characters */                
	if (satisfied_min_cond== -1)
	{   /* changed for speed */ 
//		ret_value->value=FAIL;
		return(0);
	}
	if (satisfied_min_cond== -2)
	{
		if (length==0)
		{
			length= -2;
		}
	}
	else
	{
		if (input_array[ipos+i]=='\0')
		{
			if (length==0)
			{	/* changed for speed */
				return(-1);
			}
		}                                        
	}
	if (counter!=num_desc)
	{
		temp=in_rule_p;
		temp+=2;
		if (lookahead)
			temp++;
		if (large_desc)
		{
			temp+=num_desc<<1;
		}
		else
		{
			temp+=num_desc;
		}
		rule_p=temp;
	}
	ret_value->rule=rule_p;
#ifdef PARSER_DEBUG
	printf("leaving par_match_standard length=%d ret_value->value=%d\n",length,ret_value->value);
#endif
	return(length);
}

/* ******************************************************************
*	Function Name:
*		par_match_digits()
*
*	Description:
*		this function matches the digit charaacter types of the form
*		D[4-20]
*
*	Arguments:
*		INPUT	unsigned char 	*current_rule		pointer to the current rule
*		INPUT	unsigned char 	*input_array		the input array
*		I/O		pmatch_arrays_t match_array			the array of temporary arrays for shuffle
*		I/O		preturn_value_t ret_value			the return value which controls and signals starting and
* 													ending points of the matching, and exit conditions
*		INPUT   int             lookahead			If this is 1 perform lookahead
*													if this is 0 do not perform lookahead and fail quietly
*		INPUT	prange_value_t	range_value			The structure that passes information about
* 													conditional replacements
*		INPUT   int             break_on_min_match  if 1 stop processing the type on the minimum 
*													matched string
*
*	Return Value:
*      int     the length of the string matched
*              -1 if the end of the string was reached
*
*	Comments:
*
* ******************************************************************/
int par_match_digits(unsigned char *current_rule, unsigned char *input_array,
					 pmatch_arrays_t match_array, preturn_value_t ret_value,
					 prange_value_t range_value, int lookahead, int break_on_min_match)
{
	int rule_p;							/* a temproary rule pointer */
	int	length=0;						/* the length of the matched characters */
	int	ipos;							/* the input_pos+input_offset from ret_value */
	int min_range= -1;					/* the minimum value of the current range */
	int	max_range= -1;					/* the maximum value of the range */
	int	match_is_over=0;				/* a flag to signal that the matching has failed */
	int	satisfied_min_cond= -1;			/* holds the value of the largest number that
										* is still in the range found so far */
	int	satisfied_start= -1;			/* holds the starting value of the number in satisfied_min_cond */
	int temp_num=0;						/* a temporary variable to hold the current number being processes */
	//int end_of_type=0;				/* flag that signals the end of the type specifier has been reached in the rule */
	register int i=0;
	int counter;          
	//int find_type= -2;				/* the type that par_look_ahead found */
	int temp;
	int in_rule_p;
	int next_type=0;
	int num_desc;
	int new_char_type;
	int large_desc=0;
	
	
#ifdef PARSER_DEBUG
	printf("entering par_match_digits\n");
#endif
	
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_match_digits a 0\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL) ||
		(range_value==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_match_digits b 0\n");
#endif
		return(0);
	}
#endif // SANITY_CHECKING
	
	rule_p=ret_value->rule;
	in_rule_p=rule_p;
	ipos=ret_value->input_pos+ret_value->input_offset;
	/* skip past the type delimiter */
	new_char_type=char_type_table[BIN_DIGIT];
	if (current_rule[rule_p] & BIN_LOOK_FROM_DISABLE)
	{
		lookahead=0;
#ifdef PARSER_DEBUG
		printf("match_standard set no lookahead\n");
#endif
	}
	rule_p++; /* move past operation */
	if (current_rule[rule_p] & BIN_LARGE_DESC)
	{
		large_desc=1;
#ifdef PARSER_DEBUG
		printf("match_standard using large descriptors\n");
#endif
	}
	num_desc=(current_rule[rule_p] & BIN_SIZE_DESC_MASK);
	counter=0;
	rule_p++; /* move past number of descrpitors */
	if (lookahead!=0)
	{
		next_type=current_rule[rule_p];
		rule_p++; /* move past next type */
	}
	/* either there is a number or there is a star of a plus */ 
	
	while ((counter<num_desc) && (match_is_over==0))
	{
		if (large_desc)
		{
			temp=get_short(current_rule+rule_p);
			rule_p+=2;
			counter++;
			min_range = temp & BIN_MAX_LARGE_DESC;
			max_range=min_range;
			if (temp & BIN_LARGE_ANY_NUMBER)
			{
				max_range=INT_MAX;
			}
			else
			{
				if (temp & BIN_LARGE_CONTINUE)
				{
					temp=get_short(current_rule+rule_p);
					rule_p+=2;
					counter++;
					max_range = temp & BIN_MAX_LARGE_DESC;
					if (temp & BIN_LARGE_ANY_NUMBER)
					{
						max_range=INT_MAX;
					}
				}
			}
		}
		else
		{
			temp=current_rule[rule_p];
			rule_p++;
			counter++;
			min_range = temp & BIN_MAX_SMALL_DESC;
			max_range=min_range;
			if (temp & BIN_SMALL_ANY_NUMBER)
			{
				max_range=INT_MAX;
			}
			else
			{
				if (temp & BIN_SMALL_CONTINUE)
				{
					temp=current_rule[rule_p];
					rule_p++;
					counter++;
					max_range = temp & BIN_MAX_SMALL_DESC;
					if (temp & BIN_SMALL_ANY_NUMBER)
					{
						max_range=INT_MAX;
					}
				}
			}
		}
		
		/* do the character matching starting at length until min_length */
		/* then match from min_length to max_length */
		/* once min_length is reached, do lookahead for the next char type if necessary */
		/* this is the conversion from actual number to number lengths */
		if (range_value->range_set==0)
		{
			range_value->range_set=1;
			range_value->start=min_range;
		}
		else
		{
			if (range_value->range_set==2)
			{
				range_value->range_set= -1;
			}
			if (range_value->range_set==1)
			{
				range_value->start+=((min_range-range_value->end)-1);
			}
		}
		range_value->min=min_range;
		range_value->end=max_range;
		min_range=par_get_int_length(min_range);
		max_range=par_get_int_length(max_range);
#ifdef DIGIT_DEBUG
		printf("par_match_digits; before match length=%d match_is_over=%d satisfied_min_cond=%d\n",length,match_is_over,satisfied_min_cond);
		printf("par_match_digits; before match min_range=%d max_range=%d\n",min_range,max_range);
#endif
		for (i=0;(((parser_char_types[input_array[ipos+i]] & TYPE_digit)!=0) &&
			((temp_num=par_convert_number(input_array+ipos,i+1))<=range_value->end) &&
			(i<max_range))
			;i++)
		{
#ifdef DIGIT_DEBUG
			printf("looping in par_match_digits i=%d temp_num=%d\n",i,temp_num);
#endif
			if (temp_num>=range_value->min)
			{
#ifdef DIGIT_DEBUG
				printf("matched %d\n",temp_num);
#endif
				temp=length=i+1;
				satisfied_min_cond=temp_num;
				satisfied_start=range_value->start;
				if (break_on_min_match==1)
				{
					match_is_over=1;
					break;
				}
				if ((lookahead) && ((counter<num_desc) || (((temp)<max_range))))
				{
					if (par_look_ahead(current_rule,input_array,ipos+temp,next_type,match_array,ret_value)==1)
					{
						match_is_over=1;
						break;
					}
				}
			}
		}
		if ((temp_num>range_value->end) && (counter==num_desc))
		{
			break;
		}
	}                              
#ifdef DIGIT_DEBUG
	printf("take 2 length=%d match_is_over=%d satisfied_min_cond=%d\n",length,match_is_over,satisfied_min_cond);
	printf("take 2 min_range=%d max_range=%d\n",min_range,max_range);
#endif
#ifdef PARSER_DEBUG
	printf("par_match_digits;rule_p=%d\n",rule_p);
#endif
	if (counter!=num_desc)
	{
		temp=in_rule_p;
		temp+=2;
		if (lookahead)
			temp++;
		if (large_desc)
		{
			temp+=num_desc<<1;
		}
		else
		{
			temp+=num_desc;
		}
		rule_p=temp;
	}
	
	/* if satisfied_min_cond was not changed, there was no successful matching */
   	if (satisfied_min_cond== -1)
   	{
		return(0);
	}
	else
   	{   
	/* if there was a successful match that was not the last one set range_value->start to 
   		   the value of start at the when the match was hit */
		if (range_value->start!=satisfied_start)
		{
			range_value->start=satisfied_start;
		}
	}
	if (input_array[ipos+i]=='\0')
	{
		if (length==0)
		{	/* changed for speed */
			return(-1);
		}
	}                                        
	ret_value->rule=rule_p; 
#ifdef DIGIT_DEBUG    
	par_print_rule_error("par_match_digits;testing the rule_p index",current_rule,rule_p);
#endif

#ifdef PARSER_DEBUG
	printf("leaving par_match_digits length=%d\n",length);
#else
#ifdef DIGIT_DEBUG
	printf("leaving par_match_digits length=%d ret_value->value=%d\n",length,ret_value->value);
#endif
#endif // PARSER_DEBUG
   	return(length);
}

/* ******************************************************************
 *	Function Name:
 *		par_match_sets_with_ranges()
 *
 *	Description:
 *		this function matches sets that have numbers of occurrances
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule		pointer to the current rule
 *		INPUT	unsigned char 	*input_array		the input array
 *		I/O		pmatch_arrays_t match_array			the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value			the return value which controls and signals starting and
 * 													ending points of the matching, and exit conditions
 *		INPUT	prange_value_t	range_value			The structure that passes information about
 * 													conditional replacements
 *      INPUT   int             lookahead			If this is 1 perform lookahead
 *													if this is 0 do not perform lookahead and fail quietly
 *      INPUT   int             break_on_min_match  if 1 stop processing the type on the minimum 
 *                                                  matched string
 *
 *	Return Value:
 *      int     the length of the string matched
 *              -1 if the end of the string was reached
 *				-2 if the string had no matching length but was a successful match
 *
 *	Comments:
 *
 * *****************************************************************/
int par_match_sets_with_ranges(unsigned char *current_rule, unsigned char *input_array,
							   pmatch_arrays_t match_array, preturn_value_t ret_value,
							   prange_value_t range_value, int lookahead, int break_on_min_match)
{
	int rule_p;
	int times=0,length=0,ipos,total_length=0;
	int min_range= -1,max_range= -1;
	int match_is_over=0;                              
	int satisfied_min_cond= -1;
	//	int par_look_ahead_success=0;
	int i=0;
	int temp;
	int counter;
	int sect_p,section_p;
	int end_of_all_types,num_desc;
	int large_desc;
	//	int num_sections;
	/* int find_type= -2; */ /* uncomment when look_ahead is implimented from sets */
#ifndef NEW_PARSER_FILE_LOADING
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0 }; 
#else
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,NULL }; 
#endif
	
#ifdef PARSER_DEBUG
	printf("entering par_match_sets_and_ranges\n");
#endif

#ifdef SANITY_CHECKING	
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_match_sets_and_ranges a 0\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_match_sets_and_ranges b 0\n");
#endif
		return(0);
	}
#endif // SANITY_CHECKING
	rule_p=ret_value->rule;
	ipos=ret_value->input_pos+ret_value->input_offset;
	
	/* skip past the type delimiter */
	
	rule_p++;
	
	new_ret.input_pos=ret_value->input_pos+ret_value->input_offset;	
	new_ret.input_offset=0;
	new_ret.output_pos=ret_value->output_pos+ret_value->output_offset;
	new_ret.output_offset=0;
	new_ret.value=SUCCESS;
#ifdef NEW_PARSER_FILE_LOADING
	new_ret.phTTS=ret_value->phTTS;
#endif
	
	section_p=rule_p; /* the location of the number of sections */
	
	//	num_sections=current_rule[rule_p];	
	
	
	end_of_all_types=current_rule[section_p+current_rule[rule_p]]+1;
	
	rule_p+=(current_rule[rule_p])+1;	/* the location of the descriptors */
	
	if (current_rule[rule_p] & BIN_LARGE_DESC)
	{
		large_desc=1;
		sect_p=rule_p+(current_rule[rule_p] <<1)+1;
	}
	else
	{
		large_desc=0;
		sect_p=rule_p+(current_rule[rule_p])+1; // the for the start of the sections of the sets 
	}
	//	new_ret.rule=section_p;
	
	num_desc=(current_rule[rule_p] & BIN_SIZE_DESC_MASK);
	counter=0;
	rule_p++; /* move past number of descrpitors */
	
	/* either there is a number or there is a star of a plus */
	while ((counter<num_desc) && (match_is_over==0))
	{
		if (large_desc)
		{
			temp=get_short(current_rule+rule_p);
			rule_p+=2;
			counter++;
			min_range = temp & BIN_MAX_LARGE_DESC;
			max_range=min_range;
			if (temp & BIN_LARGE_ANY_NUMBER)
			{
				max_range=INT_MAX;
			}
			else
			{
				if (temp & BIN_LARGE_CONTINUE)
				{
					temp=get_short(current_rule+rule_p);
					rule_p+=2;
					counter++;
					max_range = temp & BIN_MAX_LARGE_DESC;
					if (temp & BIN_LARGE_ANY_NUMBER)
					{
						max_range=INT_MAX;
					}
				}
			}
		}
		else
		{
			temp=current_rule[rule_p];
			rule_p++;
			counter++;
			min_range = temp & BIN_MAX_SMALL_DESC;
			max_range=min_range;
			if (temp & BIN_SMALL_ANY_NUMBER)
			{
				max_range=INT_MAX;
			}
			else
			{
				if (temp & BIN_SMALL_CONTINUE)
				{
					temp=current_rule[rule_p];
					rule_p++;
					counter++;
					max_range = temp & BIN_MAX_SMALL_DESC;
					if (temp & BIN_SMALL_ANY_NUMBER)
					{
						max_range=INT_MAX;
					}
				}
			}
		}
		
		
		/* do the character matching starting at length until min_length */
		/* then match from min_length to max_length */
		/* once min_length is reached, do lookahead for the next char type if necessary */
		if (min_range==0)
		{
			/* signal that there could be success on a zero length string */
			/* or the end of string could be successful too */
			satisfied_min_cond= -2;
			if (break_on_min_match==1)
			{
				break;
			}
		}
		for (i=times;i<max_range;i++)
		{
			/* place the call to par_match_set here */
			/* return the length of the thing matched */
			length=par_match_set(current_rule,input_array,section_p,sect_p,ipos,match_array,range_value,&new_ret,lookahead);
			if (length== -1)
			{
				match_is_over=1;     
				if (satisfied_min_cond>0)
				{
					length=total_length;
				}
				else
				{
					total_length= -1;
				}
				break;
			}
			if (length==0 && new_ret.value==SUCCESS)
			{
				if (total_length==0)
				{
#ifdef PARSER_DEBUG
					printf("set satisfied_min_cond to -2\n");
#endif
					satisfied_min_cond= -2;
					match_is_over=1;
					break;
				}
			}
			if (length>0)
			{
				ipos+=length;
				total_length+=length;
			}
			if (new_ret.value==FAIL)
			{
				match_is_over=1;
				break;
			}
			if ((i+1)>=min_range)
			{
				satisfied_min_cond=total_length;
				times=i+1;
				/* par_look_ahead cannot be done from here */
				if (break_on_min_match==1)
				{
					match_is_over=1;
					break;
				}						    
				
			}
			else
			{
				if (length==0)
				{
					match_is_over=1;
					break;
				}
			}
			
		}
#ifdef PARSER_DEBUG
		printf("par_match_sets_and_ranges;rule_p=%d\n",rule_p);
#endif
	}	/* while loop inner */
    /* look for the next format type specifier */
    /* look up in the table of ambiguity to know whether or not to do the lookahead parsing */
    /* start mathcing the string */
	/* once the minimum requirement for the type is met, start checking for the next type if required */
    /* end the matching once the lookahead is successful or the current match hits the maximum 
	number of characters */                
	
	
	rule_p=end_of_all_types;
	
   	if (satisfied_min_cond== -1)
   	{                                               
		return(0);
   	}
   	if (satisfied_min_cond== -2)
   	{
		if (total_length==0)
		{
			total_length= -2;
		}
   	}
   	else
	{
		if (input_array[ipos]=='\0')
		{
			if (total_length==0)
			{	/* changed fo speed */
				return(-1);
			}
		}                                        
	}
	ret_value->rule=rule_p;
#ifdef PARSER_DEBUG
	printf("leaving par_match_sets_and_ranges length=%d total_length=%d ret_value->value=%d\n",length,total_length,ret_value->value);
#endif
   	return(total_length);
}

/* ******************************************************************
 *	Function Name:
 *		par_match_set()
 *
 *	Description:
 *		this function matches a set that is between { and }
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		INPUT	unsigned char 	*input_array	the input array
 *		INPUT	int				rule_p          The start of the types in the sections
 *		INPUT	int				sect_p			The number of sections marker
 *		INPUT	int				ipos			The current position in the input
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		INPUT	prange_value_t	range_value		The structure that passes information about
 * 												conditional replacements
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and 
 * 												ending points of the matching, and exit conditions
 *      INPUT   int             lookahead       If this is 1 perform lookahead
 *                                              if this is 0 do not perform lookahead and fail quietly
 *
 *	Return Value:
 *      int     the length of the string matched
 *              -1 if the end of the string was reached
 *				-2 if the string had no matching length but was a successful match
 *
 *	Comments:
 *
 * *****************************************************************/
int par_match_set(unsigned char *current_rule, unsigned char *input_array,
					int rule_p, 					/* the position of the sections marker*/
					int sect_p,						/* the position of the start of the types */
					int ipos, pmatch_arrays_t match_array,
					prange_value_t range_value, preturn_value_t ret_value, int lookahead)
{
#ifndef NEW_PARSER_FILE_LOADING
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0 }; 	/* for par_match_string to use */
	return_value_t		save_ret = { 0,0,0,0,0,0,0,0 };	/* a copy to restore new_ret */
#else
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,NULL }; 	/* for par_match_string to use */
	return_value_t		save_ret = { 0,0,0,0,0,0,0,0,NULL };	/* a copy to restore new_ret */
#endif
	int length=0;
	int a_success=FAIL;
	int this_success=0;
	int num_chars_matched=0;
	int num_match=0;
	int new_char_type;
	int num_sections;
	int end_of_all_sections;
	
#ifdef PARSER_DEBUG
	printf("entering par_match_set\n");
#endif
#ifdef SANITY_CHECKING
	if (ret_value==NULL)
	{
#ifdef PARSER_DEBUG
		printf("leaving par_match_set ret_value is NULL\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL) || 
		(match_array==NULL) || (range_value==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef PARSER_DEBUG
		printf("leaving par_match_set, inputs are bad\n");
#endif
		return(0);
	}
#endif // SANITY_CHECKING
	new_ret.rule=sect_p;
	new_ret.input_pos=ipos;
	new_ret.optional=ret_value->optional;
	new_ret.value=SUCCESS;
	
	par_copy_return_value(&save_ret,&new_ret);
	
	num_sections=current_rule[rule_p];
	end_of_all_sections=current_rule[rule_p+num_sections];
	
	while ((new_ret.rule<=end_of_all_sections) && (a_success==FAIL))
	{
		this_success=SUCCESS;     
		length=0;
		rule_p++; /* go to the next section */
		while ((new_ret.rule<=current_rule[rule_p]) && (a_success==FAIL))
		{
			if ((new_char_type=(current_rule[new_ret.rule] & BIN_OPERATION_MASK)))
			{
				num_chars_matched=par_match_string(current_rule,new_char_type,input_array,match_array,&new_ret,range_value,0,0);
				length+=num_chars_matched;
				new_ret.input_pos+=num_chars_matched;
				if (num_chars_matched== -1)
				{	/* changed for speed */
					return(-1);
				}
#ifdef PARSER_DEBUG
				par_print_rule_error("par_match_set;after par_match_string",current_rule,new_ret.rule);
#endif
			}
			else
			{
				if (lookahead)
				{
					par_print_rule_error("par_match_set; no charcter type found",current_rule,new_ret.rule);
				}
				ret_value->value=FATAL_FAIL;
				return(0);
			}
			if (new_ret.value==FAIL)
			{
#ifdef PARSER_DEBUG
				printf("par_match_set;this section has failed, look for the next section\n");
#endif
				this_success=FAIL;
				new_ret.rule=current_rule[rule_p]+1;
			} 
			else
			{
#ifdef PARSER_DEBUG
				printf("this type has succeeded, matching next type\n");
#endif
			}
		}    
#ifdef PARSER_DEBUG
		par_print_rule_error("par_match_set;after a comma or brace has been found",current_rule,new_ret.rule);
#endif
		if (this_success==SUCCESS)
		{
			a_success=SUCCESS;
#ifdef PARSER_DEBUG
			printf("par_match_set;this section has succeeded\n");
#endif
			if (range_value->range_set==0)
			{
				range_value->range_set=2;
				range_value->start=num_match;
			}
			else
			{	
				range_value->range_set= -1;
			}
		}            
		else
		{
			if (num_match==num_sections)
			{
#ifdef PARSER_DEBUG
				printf("par_match_set;all sections failed\n");
#endif
			}
			else
			{
#ifdef PARSER_DEBUG
				printf("par_match_set;this section has failed, going to next section\n");
#endif
				par_copy_return_value(&new_ret,&save_ret);
				num_match++;
				new_ret.rule=current_rule[rule_p]+1;
			}
		}
	}
	if (a_success==FAIL)
	{
		ret_value->value=FAIL;
#ifdef PARSER_DEBUG
		printf("par_match_set; it failed\n");
#endif
	}    
#ifdef PARSER_DEBUG
	printf("leaving par_match_set length=%d ret_value->value=%d\n",length,ret_value->value);
#endif
	return(length);
}	
#endif /* end of #ifndef VOCAL */
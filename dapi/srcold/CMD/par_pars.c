#ifndef VOCAL
/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2001 Force Computers Inc. A Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
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
 *  018 MGS     05/24/1996	Optional now fails correctly on the end of a string
 *  019 MGS     05/24/1996	look_ahead fails if the string was of 0 length
 *	020	MGS		05/24/1996	Lookahead was called on the currrent character but 
 *							should have been called on the next character
 *  021 MGS     06/23/1996	Changed the ambiguity table to support the ~ operator
 *  022 MGS     06/23/1996	Changed match_string, match_digits, match_standard and match_sets_with_ranges 
 *                          to support faster look_ahead processing
 *  023 MGS     06/24/1996	Added the dictionary searching for incoming words
 *                          DM  process if dictionary miss
 *                          DH  process if dictionary hit
 *  024 MGS     06/24/1996	added character types VOWEL_NON_Y and PUNCT_SOME
 *                          they are 'Y' and 'T' respectively 
 *	025	MGS		06/25/1996	Added GM# anf GH#, subroutine callling from the hit or miss of a rule
 *							The subroutine hit/miss (GH/GM) is called before the hit/miss (H/M) rule
 *  026 MGS     07/01/1996	Added rule Macros, syntax p/R##/
 *	027	MGS		07/10/1996	Added domain dictionary searching to the parser
 *							h/dict_name,matching/hit_action|miss_action/
 *	028	MGS		07/12/1996	Added word state w/matching/
 *  029 MGS     07/19/1996	Fixed a bug with sets and more than 1 match
 *                          the length was returned wrong
 *  030 MGS     07/23/1996	Fixed another bug with sets and multiple matching
 *                          the character matched before the min was always the first chracter
 *                          not the following characters 
 *	031	MGS		07/26/1996	Updated to use the binary rule file
 *	032	MGS		07/26/1996	Moved the rule file to par_rule.c and added extern's for the variables
 *	033	MGS		07/29/1996	Cleaned up and added missing headers
 *  034 MGS     08/06/1996  Fixed a bug in set matching involving a set that matches nothing
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
 *  038	GL		10/25/1996	initialize the index_counter
 *  039	GL		02/08/1997	Added STATUS_STATE and releated code.
 *  040	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 *  041	GL		04/21/1997	BATS#360  remove spaces before "#define" or "#if" 
 *  042 TQL		05/02/1997	Removed form-feed characters.  Needed for stipper to work properly.
 *	043	MGS		08/22/1997	BATS #449 (long words)
 *	044	MGS		09/24/1997	BATS#469 Fix for NWS parser problem
 *	045 MGS		03/12/1998	Added code for the new binary parser
 *							The new parser code is in par_pars1.c... Make changes to that file
 *  046 CJL     03/18/1998  Removed specific path for dectalkf.h.
 *	047	MFG		04/28/1998	added dbglog.txt logging for debug switch[:debug 8001]
 *  048 MFG		05/19/1998	excluded dbglog logging when build 16-bit code (MSDOS)	 
 *  009 ETT    	10/05/1998  added linux code
 *	050	MGS		03/03/1998  BATS 874 fixed word state (for nws)
 *	051	MGS		05/09/2001	Some VxWorks porting BATS#972
 *  052 CAB		05/14/2001	Added force copyright
 *	053	CAB		05/06/2002	Updated copyright info
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
#include "dectalkf.h"

#ifdef NEW_BINARY_PARSER
#include "par_pars1.c"
#else

#ifndef PARSER_STANDALONE_DEBUG

#ifdef WIN32
#include <windows.h>
#include "tts.h"
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#include "tts.h"
#include <stdlib.h>
#endif

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

typedef struct kernel_share *PKSD_T;	
typedef struct kernel_share KSD_T;

KSD_T Ksd_t;
PKSD_T pKsd_t;

#include "port.h"
#include "par_def.h"

#else /* #ifdef PARSER_STANDALONE_DEBUG */

#include <string.h>
#include <limits.h>

#include "defs.h"
#include "port.h"
#include "kernel.h"
#include "dectalk.h"
#include "cm_defs.h"
#include "par_def.h"
#include "cm_data.h"
#endif // #ifdef PARSER_STANDALONE_DEBUG

#ifndef NULL
#define NULL ((void *)0)
#endif

//#define DISPLAY_RULES_HIT
//#define DEBUG       
//#define LOOK_DEBUG
//#define DIGIT_DEBUG
//#define INDEX_DEBUG
//#define NEW_DEBUG
//#define DEBUG_RULES

/* the externs from the rule table */
extern S16 num_rule_sections;
extern S16 rule_sections[];
extern S16 num_rules;
extern S16 rule_index_table[];
extern unsigned char rule_data_table[];
extern dict_pointers_t dict_point[];
extern S16 dict_index_table[];
extern unsigned char dict_data_table[];

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
extern void cm_util_flush_init(LPTTS_HANDLE_T);
#endif

/* from par_char.c */
extern unsigned short parser_char_types[];
extern unsigned char par_lower[];
extern unsigned char par_upper[];

/* from par_ambi.c */
extern char ambiguous_char[15][20];

/* function prototypes */ 
short par_match_set(unsigned char *current_rule,
					unsigned char *input_array,
					int save_p,
					int rule_p,
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
void par_copy_return_value(preturn_value_t dest,
						   preturn_value_t src);
void par_print_rule_error(char *message,
						  unsigned char *current_rule,
						  int pos);
int par_copy_word_to_output(unsigned char *input_array,
							unsigned char *output_array,
							pindex_data_t input_indexes,
							pindex_data_t output_indexes,
							preturn_value_t ret_value);
void par_skip_set(char *rule,
				  preturn_value_t ret_value);
void par_skip_digit(char *rule,
					preturn_value_t ret_value);
void par_skip_standard(char *rule,
					   preturn_value_t ret_value);
void par_skip_string(char *rule,
					 preturn_value_t ret_value,
					 short char_type);
void par_skip_action(char *rule,
					 preturn_value_t ret_value,
					 short state);
void par_skip_states(char *rule,
					 preturn_value_t ret_value,
					 short state,
					 char end);
int par_skip_white_space(unsigned char *input_array,
						 pindex_data_t input_indexes,
						 unsigned char *output_array, 
						 pindex_data_t output_indexes,
						 preturn_value_t ret_value);
short par_convert_to_new(unsigned short i);
short par_lookup_ambiguous(int  cur_type,
						   int from_reverse,
						   int new_type,
						   int to_reverse);
short par_look_ahead(unsigned char *current_rule,
					 unsigned char *input_array,
					 int ipos,
					 int rule_p,
					 int cur_type,
					 int from_reverse,
					 int *find_type,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value);
short par_get_int_length(short i);
short par_convert_number_new(unsigned char *string,
							 short *length);
short par_convert_number_new2(unsigned char *string);
short par_convert_number(unsigned char *string,
						 short num);
short par_convert_hex_number(unsigned char *string,
							 int num);
void par_copy_string_data(unsigned char *input_array,
						  pindex_data_t input_indexes,
						  unsigned char *output_array,  
						  pindex_data_t output_indexes,
						  int num_chars,
						  preturn_value_t ret_value);
int par_find_end_of_rule(unsigned char *current_rule,
						 int rule_p);
int par_find_conditional_number(unsigned char *current_rule,
								int rule_p,
								int cond_num);
int par_match_string(unsigned char *current_rule,
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
										  int *length);
void par_check_word_string(unsigned char *output_array,
		 				   preturn_value_t ret_value);
void par_save_string(unsigned char *output_array,
					 int num,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value);
void par_insert_string_before(unsigned char *current_rule,
							  unsigned char *output_array,
							  pindex_data_t output_indexes,
							  pmatch_arrays_t match_array,
							  preturn_value_t ret_value,
							  prange_value_t range_value);
void par_insert_string_after(unsigned char *current_rule,
							 unsigned char *output_array,
							 pmatch_arrays_t match_array,
							 preturn_value_t ret_value,
							 prange_value_t range_value);
void par_insert_string(unsigned char *current_rule,
					   unsigned char *output_array,
					   pindex_data_t output_indexes,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   prange_value_t range_value);
void par_replace_string(unsigned char *current_rule,
						unsigned char *output_array,
						pindex_data_t output_indexes,
						pmatch_arrays_t match_array,
						preturn_value_t ret_value,
						prange_value_t range_value);
void par_delete_string(unsigned char *output_array,
					   pindex_data_t output_indexes,
					   preturn_value_t ret_value);
int par_get_state(unsigned char c);
int par_get_char_type(unsigned char c);
short par_search_for_word(unsigned char *input,
						  unsigned char *output,
						  short dict_num,
						  short dict_state_flag);
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
						 short dict_num,
						 preturn_value_t ret_value,
						 short dict_state_flag);
void par_perform_action(unsigned char *current_rule,
						int state,
						unsigned char *input_array,
						unsigned char *output_array,
						pindex_data_t input_indexes,
						pindex_data_t output_indexes,
						pmatch_arrays_t match_array,
						preturn_value_t ret_value,
						prange_value_t range_value,
						short save_num,
						short dict_state_flag);
void par_match_rule(unsigned char *current_rule,
					int state,
					unsigned char *input_array,
					unsigned char *output_array,
					pindex_data_t input_indexes,
					pindex_data_t output_indexes,
					pmatch_arrays_t match_array,
					preturn_value_t ret_value,
					short end_marker,
					short dict_state_flag);
void par_copy_index(pindex_data_t dest_index,
					short		  dest_pos,
					pindex_data_t src_index,
					short		  src_pos);
void par_copy_index_list(pindex_data_t dest_index,
						 short		   dest_pos,
						 pindex_data_t src_index,
						 short		   src_pos,
						 short		   length);
short par_is_index_set(pindex_data_t indexes,
					   short pos);
void par_set_return_level(short *return_rule,
						  short *return_level,
						  short go_rule);
short par_get_return_level(short *return_rule,
						   short *return_level,
						   short current_rule_number);

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
                                  short rule,
                                  short go_until,
                                  preturn_value_t ret_value);
void par_initialize_arrays(pmatch_arrays_t match_arrays);

#ifdef PARSER_STANDALONE_DEBUG
void par_initialize_variables(unsigned char *input_array,
							  unsigned char *output_array,
							  unsigned char *dict_hit_array);
void par_print_output(unsigned char *output_array,
					  pindex_data_t output_indexes);
int par_read_input(unsigned char *input_array); 

/* this is the main function. it is here for the testing only version of the text parser */
int main(void)
{
	unsigned char input_array[PAR_MAX_INPUT_ARRAY];			/* the input array */
	unsigned char new_input_array[PAR_MAX_INPUT_ARRAY];			/* the input array */
	unsigned char output_array[PAR_MAX_OUTPUT_ARRAY];		/* the ouput array */
	unsigned char dict_hit_array[PAR_MAX_INPUT_ARRAY];		/* the dictionar hit array */
	index_data_t input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t new_input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t output_indexes[PAR_MAX_OUTPUT_ARRAY];
	int i,j,k;

	
	return_value_t	ret_value = { 0,0,0,0,0,0,0,0,0 };                           
	
	pKsd_t= &Ksd_t;
	pKsd_t->modeflag=0x55555555;
	pKsd_t->lang_curr=0xAAAAAAAA;
	
	
#ifdef DEBUG
		printf("entering main\n");
#endif
	memset(input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
	memset(output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
	memset(new_input_array,0,PAR_MAX_INPUT_ARRAY);
	par_initialize_variables(input_array,output_array,dict_hit_array);		/* initialize the variables */
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
#endif // SET_INDEXES
		/* 
		 *	this is the actual parser function.  it expects pointers to the input array
		 *	and the output array, the starting rule number, a parameter about how far to parse,
		 *	and a pointer to a return value strucutre 
		 */
		memset(&ret_value,0,sizeof(return_value_t));
		par_process_input(pKsd_t,input_array,new_input_array,output_array,dict_hit_array,input_indexes,new_input_indexes,output_indexes,0x00000001,0x00000020,0,0,&ret_value);
		output_array[ret_value.output_offset]='\0';
#ifndef SINGLE_PRINT
		par_print_output(output_array,output_indexes);
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
		
		par_process_input(pKsd_t,input_array,new_input_array,output_array,dict_hit_array,input_indexes,new_input_indexes,output_indexes,0x00000001,0x00000002,1,0,&ret_value);
		par_print_output(output_array,output_indexes);						/* print the results of the matching */

		memset(input_array,0,PAR_MAX_INPUT_ARRAY);
		memset(new_input_array,0,PAR_MAX_INPUT_ARRAY);
        memset(new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
        
		strcpy(input_array,output_array);
		par_copy_index_list(input_indexes,0,output_indexes,0,strlen(output_array));

		memset(output_array,0,PAR_MAX_OUTPUT_ARRAY);
		memset(&ret_value,0,sizeof(return_value_t));
		memset(output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
		
		par_process_input(pKsd_t,input_array,new_input_array,output_array,dict_hit_array,input_indexes,new_input_indexes,output_indexes,0x00000001,0x00000100,2,0,&ret_value);
		par_print_output(output_array,output_indexes);						/* print the results of the matching */
#endif // SINGLE_CALL
		memset(new_input_array,0,PAR_MAX_INPUT_ARRAY);
		memset(input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
		memset(new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));
		memset(output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));
		par_initialize_variables(input_array,output_array,dict_hit_array);	/* reinit the arrays */
	}     
#ifdef DEBUG
		printf("leaving main\n");
#endif
	return(0);
}

/* ******************************************************************
 *      Function Name: par_read_input()
 *
 *      Description:
 *
 *      Arguments: unsigned char *input_array
 *
 *      Return Value: int:
 *
 *      Comments:
 *
 * *****************************************************************/
int par_read_input(unsigned char *input_array)	/* read input from the keyboard */
/* this is temporary */
{
#ifdef DEBUG
		printf("entering par_read_input\n");
#endif
	if ((fgets(input_array,PAR_MAX_INPUT_ARRAY-1,stdin))==NULL)
	{
#ifdef DEBUG
		printf("leaving par_read_input 0\n");
#endif
		return(0);
	}
	input_array[strlen(input_array)-1]='\0';
#ifdef DEBUG
		printf("leaving par_read_input 1\n");
#endif
	return(1);
}

/* ******************************************************************
 *      Function Name: par_print_output()
 *
 *      Description:
 *
 *      Arguments:	unsigned char *output_array
 *					pindex_data_t output_indexes
 *
 *      Return Value: int:
 *
 *      Comments:
 *
 * *****************************************************************/
void par_print_output(unsigned char *output_array,pindex_data_t output_indexes)	/* display the output */
/* this is temporary */
{
	int i;
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
#endif // SET_INDEXES
}
   
/* ******************************************************************
 *	Function Name:
 *		par_initialize_variables
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
void par_initialize_variables(unsigned char *input_array,unsigned char *output_array, unsigned char *dict_hit_array)
{
#ifdef DEBUG
		printf("entering par_initialize_variables\n");
#endif
	memset(input_array,0,PAR_MAX_INPUT_ARRAY);
	memset(output_array,0,PAR_MAX_OUTPUT_ARRAY);
	memset(dict_hit_array,0,PAR_MAX_INPUT_ARRAY);
#ifdef DEBUG
		printf("leaving par_initialize_variables\n");
#endif
}
#endif /* #ifdef PARSER_STANDALONE_DEBUG */

/* *****************************************************************
 *	Function Name:
 *		par_initialize_arrays
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
void par_initialize_arrays(pmatch_arrays_t match_arrays)
{                               
	int i;
#ifdef DEBUG
	printf("entering par_initialize_arrays\n");
#endif
	for (i=0;i<PAR_MAX_ARRAYS;i++)
	{
		memset(match_arrays->array[i],0,PAR_MAX_MATCH_ARRAY);
	}
#ifdef DEBUG
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
 *		#ifdef PARSER_STANDALONE_DEBUG
 *			PKSSD_T pKsd_t
 *		#else
 *			LPTTS_HANDLE_T phTTS				Text-to-speech handle
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
                                  short rule,
                                  short go_until,
                                  preturn_value_t ret_value)
{
	match_arrays_t 		match_array; /* this is 300 bytes, maybe it should be passed instead of allocated */
		/* 
		 *	this structure holds the information about where the
		 *	current search left off in the search of the array
		 */
	/* GL 02/08/1997  add one more item for parser_flag */
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,0,0 }; 
	return_value_t		hit_ret = { 0,0,0,0,0,0,0,0,0,0 }; 
	return_value_t		save_ret = { 0,0,0,0,0,0,0,0,0,0 };
	prule_t		 		current_rule;	/* a pointer to the current rule */
	short 				done=0;
	short				i,j;
	short 				current_rule_number=0;
	short				return_rule[PAR_MAX_RETURN_LEVEL];
	short               return_level=0;
	short				last_rule_was_hit=0;
	short				input_length=0;
	short				new_input_diff=0;
	short				input_size,output_size,size_diff;

#ifndef PARSER_STANDALONE_DEBUG
	PCMD_T pCmd_t;
	PKSD_T  pKsd_t;
	pCmd_t=phTTS->pCMDThreadData;
	pKsd_t=phTTS->pKernelShareData;
#endif
	                                                                 
#ifdef DEBUG
    	printf("entering par_process_input\n");
#endif
	new_ret.input_pos=ret_value->input_pos+ret_value->input_offset;	
	new_ret.input_offset=0;
	new_ret.output_pos=ret_value->output_pos+ret_value->output_offset;
	new_ret.output_offset=0;                 
	new_ret.state=NULL_STATE;
	new_ret.prev=NULL;
	/* GL 02/08/1997 set the initial parser_flag value */
	new_ret.parser_flag = ret_value->parser_flag;
	
	if (rule>num_rule_sections)
	{
		printf("par_process_input; no such rule section %d\n",rule);
		strcpy(output_array,"Invalid rule section. ");
		return(ret_value);
	}
	for (i=0;i<PAR_MAX_RETURN_LEVEL;i++)
	{
		return_rule[i]= -1;
	}
	input_length=strlen(input_array);

	strcpy(new_input,input_array);
	memcpy(new_input_indexes,input_indexes,input_length*sizeof(index_data_t));

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
#ifdef DEBUG
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
			par_initialize_arrays(&match_array);
			current_rule=(prule_t)(&(rule_data_table[rule_index_table[current_rule_number]])); /* this line will change for the new rule tables */
#ifdef DEBUG
				par_print_rule_error("par_process_input;2 the input is",new_input,new_ret.input_pos+new_ret.input_offset);
				par_print_rule_error("par_process_input;2 the output is",output_array,new_ret.input_pos+new_ret.output_offset);
#endif
			/* 
			 * check for stop. if the last rule was a hit rule, 
			 * put the old values for the input and output back
			 */
			if (current_rule->special_rule!=NORMAL_TAG_VALUE)
			{
				if (current_rule->special_rule==STOP_TAG_VALUE)
				{
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
					break;                                                        
				}                   
				if (current_rule->special_rule==GOTO_TAG_VALUE)
				{
					current_rule_number=current_rule->special_value;
					continue;
				}                                                              
				/* put in goret and return here */
				if (current_rule->special_rule==GORET_TAG_VALUE)
				{
					par_set_return_level(return_rule,&return_level,current_rule_number+1);
					current_rule_number=current_rule->special_value;
					continue;
				}
				if (current_rule->special_rule==RETURN_TAG_VALUE)
				{
					current_rule_number=par_get_return_level(return_rule,&return_level,current_rule_number);
					continue;
				}
				printf("special rule value is out of range\n");
				break;
			}
									
			new_ret.rule=0;
			new_ret.value=FAIL;
			i=0;
			/* check the language tag */
			/* get the language flag */
#ifdef DEBUG
				printf("the language flag is 0x%04X\n",current_rule->lang_flag);
#endif
			/* check the language flag against the kernel langauge flag for the correct langauage */
			if ((last_rule_was_hit==0) && ((current_rule->lang_flag & in_lang_flag)==0))
			{
				current_rule_number++;	/* go to the next rule */
				if (current_rule_number>=num_rules)		
					done=1;
				continue;
			}                                          
			/* check the rule mode here */
#ifdef DEBUG
				printf("the mode flag is 0x%04X\n",current_rule->mode_flag);
#endif
			/*	044	MGS		09/24/1997	BATS#469 Fix for NWS parser problem */
			if (last_rule_was_hit==0)
			{
				if ((current_rule->mode_flag != 0xFFFFFFFF) &&
					((current_rule->mode_flag & in_mode_flag)==0))	
				{
					current_rule_number++;	/* go to the next rule */
					if (current_rule_number>=num_rules)		
						done=1;
					continue;
				}
			}
			if (current_rule->dict_flag!=UNSET_PARAM)
			{
				if ((current_rule->dict_flag==DICT_HIT_VALUE) && 
				    (dict_hit_array[new_ret.input_pos+new_ret.input_offset]!=DICT_MISS_VALUE))
				{
#ifdef DEBUG
						printf("processing rule because of dictionary HIT on the word\n");
#endif				
				}
				else
				{
					if ((current_rule->dict_flag==DICT_MISS_VALUE) && 
				    	(dict_hit_array[new_ret.input_pos+new_ret.input_offset]==DICT_MISS_VALUE))
					{
#ifdef DEBUG
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
			} /* if (current_rule->dict_flag!=UNSET_PARAM) */
			if (done)
			{
				if (done<0)
					done=0;
				continue;
			}
#ifdef DEBUG_RULES
#ifdef PARSER_STANDALONE_DEBUG
				fprintf(stderr,"rule number is R%d\n",current_rule->rule_number);
				fprintf(stderr,"next hit rule is %d\n",current_rule->next_hit_rule);
				fprintf(stderr,"next_miss_rule is %d\n",current_rule->next_miss_rule);
#else
				printf("rule number is R%d\n",current_rule->rule_number);
				printf("next hit rule is %d\n",current_rule->next_hit_rule);
				printf("next_miss_rule is %d\n",current_rule->next_miss_rule);
#endif
#endif // DEBUG_RULES
#ifdef DEBUG
				par_print_rule_error("par_process_input; before par_match_rule",current_rule->rule,new_ret.rule);
#endif

#ifndef PARSER_STANDALONE_DEBUG
			/* checking cmd_flushing */
			if (pKsd_t->text_flush || (pKsd_t->cmd_flush == CMD_flush_toss))
			{
				cm_util_flush_init(phTTS);
				return(&pCmd_t->ret_value);
			}              
#endif
			par_match_rule(current_rule->rule,NULL_STATE,new_input,output_array,new_input_indexes,output_indexes,&match_array,&new_ret,'\0',0);

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
				if (
				    (
				     (new_input[new_ret.input_pos+new_ret.input_offset]!='\0') &&					
					 !(
					  ((parser_char_types[new_input[new_ret.input_pos+new_ret.input_offset]] & (TYPE_white))!=0)  ||
					  (
					   ((parser_char_types[new_input[new_ret.input_pos+new_ret.input_offset]] & (TYPE_clause))!=0) &&
					   ( 
					    ((parser_char_types[new_input[new_ret.input_pos+new_ret.input_offset+1]] & (TYPE_white))!=0) ||
					    (new_input[new_ret.input_pos+new_ret.input_offset+1]=='\0')
					   )
					  )
					 )
					) ||
					(new_ret.value==END_OF_STRING)
				   )
				{
					par_copy_return_value(&new_ret,&save_ret);
					if (current_rule->next_goret_miss!= -1)
					{
						if (current_rule->next_miss_rule!= -1)
						{
							par_set_return_level(return_rule,&return_level,current_rule->next_miss_rule);
							//return_rule[return_level++]=next_miss_rule;
						}
						else
						{
							par_set_return_level(return_rule,&return_level,current_rule_number+1);
							//return_rule[return_level++]=current_rule_number+1;
						}
						current_rule_number=current_rule->next_goret_miss;
						last_rule_was_hit= -1;
					}
					else
					{
						if (current_rule->next_miss_rule!= -1)	/* this is also a miss */
						{
							current_rule_number=current_rule->next_miss_rule;
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
					if (DT_DBG(CMD_DBG,0x010))
					{

#ifndef MSDOS
					if (pKsd_t->dbglog)		/* mfg added for dbglog.txt logging support*/
						fprintf(pKsd_t->dbglog,"Rule hit:R%d\n",current_rule->rule_number);
#endif	
					printf("Rule hit:R%d\n",current_rule->rule_number);
					}
#endif // PARSER_STANDALONE_DEBUG
#ifdef DISPLAY_RULES_HIT
#ifdef PARSER_STANDALONE_DEBUG
#ifdef OUTPUT_HITS_NORMAL
					fprintf(stderr,"H");
					printf("the rule hit was R%d\n",current_rule->rule_number);
#else
					fprintf(stderr,"the rule hit was R%d\n",current_rule->rule_number);
#endif // OUTPUT_HITS_NORMAL
#else
				    printf("the rule hit was R%d\n",current_rule->rule_number);
#endif

#endif // DISPLAY_RULES_HIT
					                           
					if ((current_rule->next_hit_rule!= -1) || (current_rule->next_goret_hit!= -1))
					{
						par_copy_return_value(&hit_ret,&new_ret);
						input_size=new_ret.input_offset-save_ret.input_offset;
						output_size=new_ret.output_offset-save_ret.output_offset;
						if (output_size>input_size)
						{
#ifdef DEBUG
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
								par_copy_index_list(new_input_indexes,(save_ret.input_pos+save_ret.input_pos-size_diff),output_indexes,(save_ret.output_offset+save_ret.output_pos),output_size);
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
#ifdef DEBUG
										printf("process_input;copying new_input[%d]%c(%0X)=new_input[%d]%c(%0X)\n",i,new_input[i],new_input[i],i-size_diff,new_input[i-size_diff],new_input[i-size_diff]);
#endif
									new_input[i]=new_input[i-size_diff];
									par_copy_index(new_input_indexes,i,new_input_indexes,i-size_diff);
									dict_hit_array[i]=dict_hit_array[i-size_diff];
									
								}
								new_input_diff+=size_diff;
#ifdef DEBUG
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
#ifdef DEBUG
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
#ifdef DEBUG
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
#ifdef DEBUG
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
						if (current_rule->next_goret_hit!= -1)
						{
							if (current_rule->next_hit_rule!= -1)
							{
								par_set_return_level(return_rule,&return_level,current_rule->next_hit_rule);
							}
							else
							{
								par_set_return_level(return_rule,&return_level,current_rule_number+1);
							}
							current_rule_number=current_rule->next_goret_hit;
						}
						else
						{						
							current_rule_number=current_rule->next_hit_rule;         
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
			    if (current_rule->next_goret_miss!= -1)
				{
				    if (current_rule->next_miss_rule!= -1)
					{
						par_set_return_level(return_rule,&return_level,current_rule->next_miss_rule);
					}
				    else
					{
						par_set_return_level(return_rule,&return_level,current_rule_number+1);
					}
				    current_rule_number=current_rule->next_goret_miss;
				    last_rule_was_hit= -1;
				}
			    else
			  	{
				    if (current_rule->next_miss_rule!= -1)	/* this is also a miss */
					{
					    current_rule_number=current_rule->next_miss_rule;
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
#ifdef DEBUG
				printf("process_input done = %d\n",done);
#endif
			
		}	/* while (!done) */
		/* copy the word to the output */
		/* this copies the data from the current position in the input until it hits a whitespace */
		/* -1 signals that the end of the input string has been reached */
		/* should check for overrunning the output array */
		if (par_copy_word_to_output(new_input,output_array,new_input_indexes,output_indexes,&new_ret)== -1)
		{
			done=1;
		}
		else
		{
			done=0;
		}

	}	/* while (new_input[]!='\0') */
	output_array[new_ret.output_pos+new_ret.output_offset]='\0';

	ret_value->input_offset=new_ret.input_offset-new_input_diff;	 /* the offsets are the change from the current pos */
	ret_value->output_offset=new_ret.output_offset; /* so add the values to the callers offsets */
#ifdef DEBUG
		printf("leaving par_process_input\n");
#endif
	return(ret_value);
}                       
 
/* ******************************************************************
 *	Function Name:
 *		par_get_return_level
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
 *		short		the rule number to process next
 *
 *	Comments:                       
 *		This function checks for no data in the array
 *			on a underflow condition the return value is the current rule number plus one
 *		
 *
 * *****************************************************************/
short par_get_return_level(short *return_rule,
						   short *return_level,
						   short current_rule_number)
{
	if (*return_level>0)
	{   
#ifdef DEBUG
		printf("par_get_return_level;going to rule %d the level is %d\n",return_rule[(*return_level)-1],(*return_level)-1);
#endif
		return(return_rule[--(*return_level)]);
	}
	else
	{
//#ifdef DEBUG
			printf("par_get_return_level;no place to go to, going to next rule %d\n",current_rule_number);
//#endif
		return(current_rule_number+1);
	}
}
 
/* ******************************************************************
 *	Function Name:
 *		par_set_return_level
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
void par_set_return_level(short *return_rule,
						  short *return_level,
						  short go_rule)
{
	if (*return_level<PAR_MAX_RETURN_LEVEL)
	{
#ifdef DEBUG
		printf("par_set_return_level;saving rule %d in level %d\n",go_rule,*return_level);
#endif
		return_rule[(*return_level)++]=go_rule;
	}
	else
	{
//#ifdef DEBUG
		printf("par_set_return_level;too many levels of gorets throwing away %d\n",go_rule);
//#endif
	}
}
 
/* ******************************************************************
 *	Function Name:
 *		par_copy_index_list
 *
 *	Description:
 *		thios function copies a list of indexes from src_index[src_pos] to dest_index[dest_pos]
 *
 *	Arguments:
 *		OUTPUT	pindex_data_t	dest_index		The destination array of indexes
 *		INPUT	short			dest_pos		The destination position in dest_index
 *		INPUT	pindex_data_t	src_index		The source array of indexes
 *		INPUT	short			src_pos			The source position in src_index
 *		INPUT	short			length			The number of entries to copy
 *
 *	Return Value:
 *		void
 *
 *	Comments:                       
 *		
 *
 * *****************************************************************/
void par_copy_index_list(pindex_data_t dest_index,
						 short		   dest_pos,
						 pindex_data_t src_index,
						 short		   src_pos,
						 short		   length)
{
//	int i;
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,length*sizeof(index_data_t));
//	for (i=0;i<length;i++)
//	{
//		par_copy_index(dest_index,dest_pos+i,src_index,src_pos+i);
//	}
}
 
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
void par_copy_index(pindex_data_t dest_index,
					short		  dest_pos,
					pindex_data_t src_index,
					short		  src_pos)
{
	memcpy(dest_index[dest_pos].index,src_index[src_pos].index,sizeof(index_data_t));
}
 
/* ******************************************************************
 *	Function Name:
 *		par_is_index_set
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
short par_is_index_set(pindex_data_t indexes,
					   short pos)
{
	if (indexes[pos].index[0]!=0 || indexes[pos].index[1]!=0 || indexes[pos].index[2]!=0)
	{
		return(1);
	}
	return(0);
}
                     
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
 *		INPUT	short			end_marker		The ending charcter of the state
 *		INPUT	short			dict_state_flag	if 0 do the entire search and return te value in $9
 *												if 1 just return success or failure in the dict
 *
 *	Return Value:
 *		preturn_value_t		a pointer to the return value strucutre passed as ret_value
 *
 *	Comments:
 *		this function is recursive.
 *
 * *****************************************************************/
void par_match_rule(unsigned char *current_rule,
					int state,
					unsigned char *input_array,
					unsigned char *output_array,
					pindex_data_t input_indexes,
					pindex_data_t output_indexes,
					pmatch_arrays_t match_array,
					preturn_value_t ret_value,
					short end_marker,
					short dict_state_flag)
{

//	int end_marker=End_Is_Slash;			/* used to store the end of state marker for comparison */
	return_value_t	new_ret;				/* the return_value data */
	int new_action_state=NULL_STATE;		/* the current action state */
	int new_char_type=NULL_TYPE;			/* the current unsigned characer type */
	int num_chars_matched=0; 				/* the number of characters matched by par_match_string */
	int save_state_num=0;					/* the number of the array to save the matching result into or
											 * the dictionary number */
	range_value_t range_value = {0,0,0,0};		/* 
											 *	a structure to store the minimum and maximum values of 
											 * 	a digit range find 
											 */
	prule_t new_rule;
	short next_rule_number,rule_p,length=0;
    short length_of_input;
	
#ifdef DEBUG
		printf("entering par_match_rule state=%d\n",state);
#endif
	/* check the inputs or bail out at this point */                                      
	if (ret_value==NULL) /* there was no input structure,  bail and return NULL */
	{
#ifdef DEBUG
		printf("leaving par_match_rule ret_value is NULL\n");
#endif
		return;
	}	
	if (current_rule==NULL || input_array==NULL || output_array==NULL || match_array==NULL)
	{	/* return a failed value */
		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
		printf("leaving par_match_rule some input is NULL returning FAIL\n");
#endif
		return;
	}
        length_of_input=strlen(input_array);
	/* 
	 *	NULL_STATE is used for the first call to the par_match_rule function to 
	 *	tell it to go into COPY_STATE and that the end of state marker is a NULL 
	 */
	if (state==NULL_STATE) 	
	{
		end_marker=End_Is_Null;   
		state=COPY_STATE;
	}                       
	/* update the state information and pointer to ret_value for par_look_ahead */                   
	new_ret.prev=ret_value;
	new_ret.state=state;
	/* set the optional flag if the state is optional */
	if (state==OPTIONAL_STATE)
	{                                         
#ifdef DEBUG
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
	new_ret.input_pos=ret_value->input_pos+ret_value->input_offset;	
	new_ret.input_offset=0;
	new_ret.output_pos=ret_value->output_pos+ret_value->output_offset;
	new_ret.output_offset=0;
	new_ret.value=SUCCESS;
	new_ret.rule=ret_value->rule;
	/* GL 02/08/1997 set the initial parser_flag */
	new_ret.parser_flag = ret_value->parser_flag;   
	/*
	 *	if this is in save state the array number has to be retrieved here to 
	 *  know which array to place the data into 
	 */
	if (state==SAVE_STATE)
	{
		end_marker=End_Is_Paren;
		/* get the number from the rule to save the result in */
		if (current_rule[new_ret.rule]!=SAVE_DELIMITER)
		{
			par_print_rule_error("par_match_rule;expected a $ in save state",current_rule,new_ret.rule);
			ret_value->value=FATAL_FAIL;
			return;
		}
		new_ret.rule++;
		save_state_num=current_rule[new_ret.rule]-'0';
		if ((save_state_num<0) || (save_state_num>9))
		{
			par_print_rule_error("par_match_rule;save state number out of range",current_rule,new_ret.rule);
			ret_value->value=FATAL_FAIL;
			return;
		}
		new_ret.rule++;
		if (current_rule[new_ret.rule]!=',')
		{
			par_print_rule_error("par_match_rule;expected a , after the save state number",current_rule,new_ret.rule);
			ret_value->value=FATAL_FAIL;
			return;
		}
		new_ret.rule++;
	}
	if (state==DICTIONARY_STATE)
	{
		save_state_num=par_convert_number_new(current_rule+new_ret.rule,&length);
		new_ret.rule+=length;
		if (current_rule[new_ret.rule]!=',')
		{
			par_print_rule_error("no comma found after the number in a dictionary search state",current_rule,new_ret.rule);
			ret_value->value=FATAL_FAIL;
			return;
		}
		new_ret.rule++;
	}
	if (state==MACRO_STATE)
	{
		rule_p=new_ret.rule;
		if (current_rule[rule_p]!=RULE_NUMBER_DELIM)
		{
			par_print_rule_error("no rule tag found",current_rule,rule_p);
			ret_value->value=FATAL_FAIL;
			return;
		}
		rule_p++;
		next_rule_number=par_convert_number_new(current_rule+rule_p,&length);
		rule_p+=length;
		new_rule=(prule_t)(&(rule_data_table[rule_index_table[next_rule_number]]));
		new_ret.rule=0;

		par_match_rule(new_rule->rule,NULL_STATE,input_array,output_array,input_indexes,output_indexes,match_array,&new_ret,'/',0);

		new_ret.rule=rule_p;
		if ((new_ret.input_pos+new_ret.input_offset > (int)strlen(input_array))) 
		{
			if (new_ret.optional==1)
			{
				new_ret.optional= -1;
			}
			else
			{
				new_ret.value=END_OF_STRING;
			}
		}
		if (((new_ret.value==FAIL) && (new_ret.optional==1)) || (new_ret.optional== -1))
		{
			new_ret.optional= -1;
			new_ret.value=OPT_FAIL;
		}                                                                 
	}
	else
	{
	/* 
	 * decide whether the string in the position being processed is another rule 
	 * or if it is a character type or string to be matched.
	 */
	while ((current_rule[new_ret.rule]!=end_marker) && 
		   (new_ret.value!=FATAL_FAIL) && (new_ret.value!=FAIL) && (new_ret.value!=END_OF_STRING)/* && */
		   /*(new_ret.input_pos+new_ret.input_offset < (int)strlen(input_array))*/ )	/* slow ?? */
	/* process all the data in this action state that is before the ending slash */
	{
		if ((new_char_type=par_get_char_type(current_rule[new_ret.rule]))!=NULL_TYPE)
		{
			if (new_char_type==NO_LOOKAHEAD)
			{
				new_ret.rule++;
				new_char_type=par_get_char_type(current_rule[new_ret.rule]);
			}

			num_chars_matched=par_match_string(current_rule,new_char_type,input_array,match_array,&new_ret,&range_value,1,0);
	
			/* copy matched data to the output string */
			if (num_chars_matched== -1)
			{
#ifdef DEBUG
					printf("leaving par_match_rule; end of string reached in string\n");
#endif
				if (new_ret.optional==1)
				{
				    new_ret.optional= -1;
					num_chars_matched=0;
				}
				else
				{
				    ret_value->value=END_OF_STRING;                         
					return;
				}
			}                    
#ifdef DEBUG
				par_print_rule_error("after par_match_string",current_rule,new_ret.rule);
#endif
			par_copy_string_data(input_array,input_indexes,output_array,output_indexes,num_chars_matched,&new_ret);
	    	/* update new_ret output_offset */
	    	new_ret.output_offset+=num_chars_matched;
	    	new_ret.input_offset+=num_chars_matched; 
		}
		else
		{
			if ((new_action_state=par_get_state(current_rule[new_ret.rule]))!=NULL_STATE)
			{
				new_ret.rule++;
				/* if it is SAVE_STATE, the $ comes next and has to be parsed by the next level down */
				/* the slash is not there and the $ has to be the character being pointed to */
				if (new_action_state!=SAVE_STATE)
				{
					if (current_rule[new_ret.rule] != STATE_PART_DELIM)
					{
						par_print_rule_error("par_match_rule;first slash of a state not found",current_rule,new_ret.rule);
						ret_value->value=FATAL_FAIL;
						return;
					}
					new_ret.rule++;
				}
				/* recursively call the par_match_rule function with the new action state */
				par_match_rule(current_rule,new_action_state,input_array,output_array,input_indexes,output_indexes,match_array,&new_ret,'/',0);

#ifdef DEBUG
					par_print_rule_error("after par_match_rule",current_rule,new_ret.rule);
#endif
				if (new_ret.value==END_OF_STRING)
				{
#ifdef DEBUG
						printf("leaving par_match_rule; end of string reached in rule\n");
#endif
					if (new_ret.optional==1)
					{
						new_ret.optional= -1;
						new_ret.value=FAIL;
					}
					else
					{
						ret_value->value=END_OF_STRING;
						return;
					}
				}
					
				/* the matched expression should already be in the output buffer */
			}
			else
			{
				par_print_rule_error("par_match_rule;no action state or character type found",current_rule,new_ret.rule);
				ret_value->value=FATAL_FAIL;
				return;
			}           
		}                              
	/* processing continues here after a call to either par_match_string() or to par_match_rule() */
                if ((new_ret.input_pos+new_ret.input_offset > length_of_input)) 
		{
			if (new_ret.optional==1)
			{
				new_ret.optional= -1;
			}
			else
			{
				new_ret.value=END_OF_STRING;
			}
		}
		if (((new_ret.value==FAIL) && (new_ret.optional==1)) || (new_ret.optional== -1))
		{
			new_ret.optional= -1;
			new_ret.value=OPT_FAIL;
			/* clear the indexes on a missed rule */
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
		memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
#ifdef DEBUG
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
		memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
		ret_value->value=END_OF_STRING;
#ifdef DEBUG
			printf("leaving par_match_rule; the end of the string was encountered\n");
#endif
		return;
	}
	  
	/* this should be the ending slash of the state */
	if (current_rule[new_ret.rule]!=end_marker)
	{
		par_print_rule_error("par_match_rule;end of state slash not found",current_rule,new_ret.rule);
		ret_value->value=FATAL_FAIL;
		return;
	}
	else
	{
		if (end_marker!=End_Is_Null)
		{
			new_ret.rule++; /* skip past the ending marker only if this is not NULL */
			/* new_ret.rule is now at the chrarcter after the slash */
		}
	}
	/* performing the action of this state */  
#ifdef DEBUG
		printf("the current output is:%s\n",output_array);
		printf("output_pos=%d output_offset=%d\n",new_ret.output_pos,new_ret.output_offset);
#endif
	par_perform_action(current_rule,state,input_array,output_array,input_indexes,output_indexes,match_array,&new_ret,&range_value,save_state_num,dict_state_flag);
//printf("B parser_flag is %d\n",new_ret.parser_flag);
    /* GL 02/08/1997 set the parser_flag to caller */
    ret_value->parser_flag = new_ret.parser_flag;
     
	/* updating ret_value */
	/* only the value of offset is updated with the change in the offset */
	/* pos values have the value of what they were at the beginning of the rule matching */
#ifdef DEBUG
    	printf("par_match_rule;the output after the action has been performed\n is %s\n",output_array);
#endif                       
    if (new_ret.value==FAIL)
    {
#ifdef INDEX_DEBUG2
		printf("cleared indexes from %d to %d in the output, fail-fail\n",new_ret.output_pos,new_ret.output_pos+new_ret.output_offset);
#endif
		memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
    	if (new_ret.optional==1)
    	{
    		new_ret.optional= -1;
    	}
    	else
    	{
			ret_value->value=FAIL;
#ifdef DEBUG
			printf("leaving par_match_rule failure of the rule\n");
#endif
			return;
		}
    }
    ret_value->rule=new_ret.rule;
	if (new_ret.optional!= -1)
	{
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
#ifdef DEBUG
		printf("par_match_rule;optional set to OPT_FAIL\n");
#endif
#ifdef INDEX_DEBUG2
		printf("cleared indexes from %d to %d in the output, opt_fail\n",new_ret.output_pos,new_ret.output_pos+new_ret.output_offset);
#endif
		memset(output_indexes+new_ret.output_pos,0,new_ret.output_offset*sizeof(index_data_t));
		ret_value->value=OPT_FAIL;
	}
	/* unset the optional flag if this state is optional */
	if (state!=OPTIONAL_STATE)
	{                         
		ret_value->optional=new_ret.optional;
	}
	/* ret_value->rule should be pointing to the character afterh the rule now */
	ret_value->rule=new_ret.rule;
#ifdef DEBUG
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
 *				pindex_data_t	input_indexes
 *				pindex_data_t	output_indexes
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
void par_perform_action(unsigned char *current_rule,
						int state,
						unsigned char *input_array,
						unsigned char *output_array,
						pindex_data_t input_indexes,
						pindex_data_t output_indexes,
						pmatch_arrays_t match_array,
						preturn_value_t ret_value,
						prange_value_t range_value,
						short save_num,
						short dict_state_flag)
{                                                                                            
	int length=0;
	unsigned char buf[10];
	
#ifdef DEBUG
	printf("entering perform action\n");
#endif
	if (ret_value==NULL)
	{
#ifdef DEBUG
		printf("leaving perform action ret_value is NULL\n");
#endif
		return;
	}
	if ((current_rule==NULL) || (output_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
		printf("leaving perform action inputs are NULL\n");
#endif
		return;
	}
	switch(state)
	{
		case COPY_STATE:
			/* this state has already been done, so no more processing has to be done */
			break;		                                                                                 
		case REPLACE_STATE:
			par_replace_string(current_rule,output_array,output_indexes,match_array, ret_value,range_value);
		    break;
		case DELETE_STATE:
			par_delete_string(output_array,output_indexes,ret_value);
			break;
		case INSERT_STATE:
			par_insert_string(current_rule,output_array,output_indexes,match_array,ret_value,range_value);
			break;
		case INSERT_AFTER_STATE:
			par_insert_string_after(current_rule,output_array,match_array,ret_value,range_value);
		    break;
		case INSERT_BEFORE_STATE:
			par_insert_string_before(current_rule,output_array,output_indexes,match_array,ret_value,range_value);
		    break;
		case OPTIONAL_STATE:
			/* this will now occur */
			break;
		case SAVE_STATE:
			par_save_string(output_array,save_num,match_array,ret_value);
			break;
			/* this should not be necessary as MACRO_STATE is never passed as a state to match_rule */
		case MACRO_STATE: 
			break;
		case DICTIONARY_STATE: 
			par_dom_dict_search(current_rule,input_array,output_array,input_indexes,output_indexes,match_array,save_num,ret_value,dict_state_flag);
			break;  
		case WORD_STATE:
			par_check_word_string(output_array,ret_value);
			break;
		/* GL 02/08/1997 add STATUS_STATE */
		case STATUS_STATE:
			/* set status word into parser_status kernel variable */
			/* 
	 		 *	build the string that is going to be set
	 		 */
    		par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,STATUS_STATE,&length);
			ret_value->parser_flag = atoi(buf);
//printf("A parser_flag is %d\n",ret_value->parser_flag);
			ret_value->rule++;
		default:
			break;
	}            
#ifdef DEBUG
		printf("leaving perform action;the action is done\n");
#endif
}
 
/* ******************************************************************
 *	Function Name:
 *		par_get_char_type
 *
 *	Description:
 *		this function looks at the character passed to it and returns the
 *		number of the character type if it is a character type
 *
 *	Arguments:                                                 
 *		INPUT	unsigned char	c	the character to check
 *
 *	Return Value:                                                 
 *		int		The number associated with the character type specified or NULL_TYPE
 *
 *	Comments:
 *
 * *****************************************************************/
int par_get_char_type(unsigned char c)
{
#ifdef DEBUG
		printf("in par_get_char_type type=%d\n",c);
#endif
	switch(c)
	{
		case DIGIT_CHAR_DELIM:
			return(DIGIT_CHAR_TYPE);
		case UPPER_CHAR_DELIM:
			return(UPPER_CHAR_TYPE);
		case ANY_ALPHA_CHAR_DELIM:
			return(ANY_ALPHA_CHAR_TYPE);
		case ANY_CHAR_CHAR_DELIM:
			return(ANY_CHAR_CHAR_TYPE);
		case WHITE_CHAR_DELIM:
			return(WHITE_CHAR_TYPE);
		case PUNCT_CHAR_DELIM:
			return(PUNCT_CHAR_TYPE);
		case LOWER_CHAR_DELIM:
			return(LOWER_CHAR_TYPE);
		case NON_ALPHA_CHAR_DELIM:
			return(NON_ALPHA_CHAR_TYPE);
		case SET_CHAR_DELIM:
			return(SET_CHAR_TYPE);
		case VOWEL_CHAR_DELIM:
			return(VOWEL_CHAR_TYPE);
		case CONSONANT_CHAR_DELIM:
			return(CONSONANT_CHAR_TYPE);
		case NUMBER_CHAR_DELIM:
			return(NUMBER_CHAR_TYPE);
		case CLAUSE_CHAR_DELIM:
			return(CLAUSE_CHAR_TYPE);
		case ALPHA_NUM_DELIM:
			return(ALPHA_NUM_CHAR_TYPE);
		case VOWEL_NON_Y_DELIM:
			return(VOWEL_NON_Y_TYPE);
		case SOME_PUNCT_DELIM:
			return(SOME_PUNCT_TYPE);
		case EXACT_CHAR_DELIM: 
			return(EXACT_CHAR_TYPE);
		case EXACT_CASE_DELIM: 
			return(EXACT_CASE_TYPE);
		case HEXADECIMAL_DELIM:
			return(HEXADECIMAL_TYPE);
		case SAVE_DELIMITER:
			return(SAVE_CHAR_TYPE);
		case NO_LOOKAHEAD:
			return(NO_LOOKAHEAD);
		default:
			return(NULL_TYPE);
	}                         
}

/* ******************************************************************
 *	Function Name:
 *		par_get_state()
 *
 *	Description:
 *		this function looks at the character passed to it and returns the
 *		number of the action state if it is an action state
 *
 *	Arguments:
 *		INPUT	unsigned char 	c	The character to check
 *
 *	Return Value:                                         
 *		the number of the associated action state
 *
 *	Comments:
 *
 * *****************************************************************/
int par_get_state(unsigned char c)
{
#ifdef DEBUG
		printf("in par_get_state state=%d\n",c);
#endif
	switch(c)
	{
		case COPY_DELIMITER:
			return(COPY_STATE);
		case REPLACE_DELIMITER:
			return(REPLACE_STATE);
		case DELETE_DELIMITER:
			return(DELETE_STATE);
		case INSERT_DELIMITER:
			return(INSERT_STATE);
		case INSERT_AFTER_DELIM:
			return(INSERT_AFTER_STATE);
		case INSERT_BEFORE_DELIM:
			return(INSERT_BEFORE_STATE);
		case OPTIONAL_DELIMITER:
			return(OPTIONAL_STATE);
		case START_SAVE_STATE:
			return(SAVE_STATE);
		case MACRO_DELIMITER:
			return(MACRO_STATE);
		case DICTIONARY_STATE_DELIM:
			return(DICTIONARY_STATE);
		case WORD_STATE_DELIM:
			return(WORD_STATE);
		/* GL 02/08/1997 add STATUS_STATE */
		case STATUS_STATE_DELIM:
			return(STATUS_STATE);
		default:
			return(NULL_STATE);
	}
}	
 
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
 *				pindex_data_t output_indexes	
 *		I/O		preturn_value_t	ret_value		the return value strucutre
 *
 *	Return Value:                                                         
 *		void
 *
 *	Comments:
 *
 * *****************************************************************/
void par_delete_string(unsigned char *output_array,
					   pindex_data_t output_indexes,
					   preturn_value_t ret_value)
{
	short	i,j,save_offset=0;

#ifdef DEBUG
 	printf("entering par_delete_string\n");
#endif
	/*
 	 *	check the inputs for valid data 
 	 */
 	if (ret_value==NULL)
 	{
#ifdef DEBUG
 		printf("leaving par_delete_string ret_value is NULL\n");
#endif
 		return;
 	}
 	if ((output_array==NULL))
 	{
 		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
 		printf("leaving par_delete_string input is NULL\n");
#endif
 		return;
 	}                     
 	save_offset=ret_value->output_offset;             
	/* blank out the data being deleted */
	if (ret_value->optional!= -1)
	{
		memset((output_array+(ret_value->output_pos)),0,ret_value->output_offset);                              
		/* set the ouput_offset to 0 to logically delete the data from processing */
		ret_value->output_offset=0;
	}
	for (j=i=ret_value->output_pos;i<save_offset;i++)
	{
		if (par_is_index_set(output_indexes,i))
		{
#ifdef INDEX_DEBUG
			printf("copying index in delete state from %d to %d\n",i,j);
#endif
			par_copy_index(output_indexes,j,output_indexes,i);
			/* kill the old index */
			par_copy_index(output_indexes,i,output_indexes,PAR_MAX_OUTPUT_ARRAY-1);
			output_array[i]=PAR_INDEX_DUMMY_CHAR;
			j++;
			ret_value->output_offset++;
		}
	}
#ifdef DEBUG
		printf("leaving par_delete_string string deleted\n");
#endif
}
 
/* ******************************************************************
 *	Function Name:
 *		par_replace_string()
 *
 *	Description:
 *		this function replaces the data in the output_array between ret_value->output_pos 
 *		and ret_value->output_offset with the string indicated by the section in current_rule
 *
 *	Arguments:                                 
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		I/O		unsigned char 	*output_array	a pointer to the output array
 *				pindex_data_t	output_indexes
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
 * *****************************************************************/
void par_replace_string(unsigned char *current_rule,
						unsigned char *output_array,
						pindex_data_t output_indexes,
						pmatch_arrays_t match_array,
						preturn_value_t ret_value,
						prange_value_t range_value)
{
	int length;
	short i,j;
	unsigned char buf[100];
	index_data_t  temp_index[100];
	
	
#if defined (DEBUG) || defined (INDEX_DEBUG)
 	printf("entering par_replace_string\n");
#endif

	memset(temp_index,0,100*sizeof(index_data_t));
 	/* 
 	 *	check the inputs for valid data 
 	 */
 	if (ret_value==NULL)
 	{
#ifdef DEBUG
 		printf("leaving par_replace_string ret_value is NULL\n");
#endif
 		return;
 	}
 	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
 	{
 		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
 		printf("leaving par_replace_string inputs are invalid\n");
#endif
 		return;
 	}
	/* 
	 *	build the string that is going to replace the current string bounded by
	 *	by output_pos and output_offset
	 *	then just copy the string built (null and all) on top of the current string
	 */
	par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,REPLACE_STATE,&length);
	if (ret_value->optional!= -1)
	{
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
#ifdef DEBUG
		printf("par_replace_string; length=%d\n",length);
#endif	
		ret_value->output_offset=length;
	}
	ret_value->rule++;
#ifdef DEBUG
	printf("leaving replace_state replacement is successful\n");
#endif
}
 
/* ******************************************************************
 *	Function Name:
 *		par_insert_string
 *
 *	Description:
 *		this function inserts the string build from current_rule between every character
 *		in the output_array between ret_vlaue->output_pos and ret_value->output_offset
 *
 *	Arguments:                                 
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		I/O		unsigned char 	*output_array	a pointer to the output array
 *				pindex_data_t	output_indexes	
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
 *		this function does the insert in a reverse method and therefoor does not need
 *		a temporory array for the insert
 *
 * *****************************************************************/
void par_insert_string(unsigned char *current_rule,
					   unsigned char *output_array,
					   pindex_data_t output_indexes,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   prange_value_t range_value)
{
	unsigned char buf[100];
	int length,new_length;
	int pos,new_int,off;
 	
#ifdef DEBUG
 	printf("entering par_insert_string\n");
#endif
 	/* 
 	 *	check the inputs for valid data 
 	 */
 	if (ret_value==NULL)
 	{
#ifdef DEBUG
 		printf("leaving par_insert_string ret_value is NULL\n");
#endif
 		return;
 	}
 	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
 	{
 		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
 		printf("leaving par_insert_string; inputs are invalid\n");
#endif
 		return;
 	}
	/* 
	 *	build the string that is going to be inserted 
	 */
    par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,INSERT_STATE,&length);
	/* 
	 *	the new length of the ouput string is
	 *	the number of characters inserted into minus 1 (the insert is only between)
	 *	times the length of the string to be inserted plus one (the original character)
	 *	plus one (the last character)
	 */
	if (ret_value->optional!= -1)
	{
		new_length=(ret_value->output_offset-1)*(length+1)+1;
	
		/* pos is the current position */
		pos=ret_value->output_pos;
		/* off is the pos plus the offset minus 1 (the offset is positioned for the next insert) */
		off=ret_value->output_offset+ret_value->output_pos-1;
		/* new is the place where the last character of the inserted string will be placed */
		new_int=new_length+ret_value->output_pos-1;
		while (pos<off) /* go until the offset if equal to the position */
		{
			/* copy the character in the current string into its new location */
			output_array[new_int]=output_array[off];                                
			par_copy_index(output_indexes,new_int,output_indexes,off);
			par_copy_index(output_indexes,off,output_indexes,PAR_MAX_OUTPUT_ARRAY-1);
			/* move off back to the previous character */
			off--;                                       
			/* move new back for the insert of the inset string */
			new_int-=length;                                          
			/* copy the insert string to new */
			memcpy(output_array+new_int,buf,length);
			/* move new back one character */
			new_int--;
		}                                    
		/* the output offset is equal to the total length of the new string */
		ret_value->output_offset=new_length;
	}
	ret_value->rule++;
#ifdef DEBUG
	printf("leaving par_insert_string; insert is done\n");
#endif
	return;
}
 
/* ******************************************************************
 *	Function Name:
 *		par_insert_string_after
 *
 *	Description:           
 *		this function inserts the string built from current_rule into output_array 
 *		after ret_value->output_pos+ret_value->output_offset;
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
 * *****************************************************************/
void par_insert_string_after(unsigned char *current_rule,
							 unsigned char *output_array,
							 pmatch_arrays_t match_array,
							 preturn_value_t ret_value,
							 prange_value_t range_value)
{
 	int length;
 	unsigned char buf[100];

#ifdef DEBUG
		printf("entering par_insert_string_after\n");
#endif
 	/*
 	 *	check the input values
 	 */
 	if (ret_value==NULL)
 	{
#ifdef DEBUG
 		printf("leaving par_insert_string_after ret_value is NULL\n");
#endif
 		return;
 	}
 	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
 	{
 		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
 		printf("leaving par_insert_string_after inputs are invalid\n");
#endif
 		return;
 	}
    /*
     *	build the string for the insert after 
	 */
    par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,INSERT_AFTER_STATE,&length);
    /* copy the inserted string into its place */
    if (ret_value->optional!= -1)
    {
    	/* the indexes will have been copied by copy_string _data */
    	strcpy((output_array+(ret_value->output_pos+ret_value->output_offset)),buf);
    	/* add the length of the inserted atring to the offset */
    	ret_value->output_offset+=length;
    }
	ret_value->rule++;
#ifdef DEBUG
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
 *		the current string in the output array is moved to its final location before 
 *		the new string is placed into the array
 *
 * *****************************************************************/
void par_insert_string_before(unsigned char *current_rule,
							  unsigned char *output_array,
							  pindex_data_t output_indexes,
							  pmatch_arrays_t match_array,
							  preturn_value_t ret_value,
							  prange_value_t range_value)
{
 	int length;
    int i, j;
 	unsigned char buf[100];

#ifdef DEBUG
	printf("entering par_insert_string_before\n");
#endif
 	/*
 	 *	check the input values
 	 */
 	if (ret_value==NULL)
 	{
#ifdef DEBUG
 		printf("leaving par_insert_string_before ret_value is NULL\n");
#endif
 		return;
 	}
 	if ((current_rule==NULL) || (output_array==NULL) || (match_array==NULL))
 	{
 		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
 		printf("leaving par_insert_string_before; inputs are invalid\n");
#endif
 		return;
 	}
 		
    /* build the string to be inserted before the input string */
    par_build_string_from_rule(current_rule,buf,output_array,match_array,ret_value,range_value,INSERT_BEFORE_STATE,&length);
    /* move the current string length characters to the right to make room for the insert string */
    if (ret_value->optional!= -1)
    {
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
    }
	ret_value->rule++;
#ifdef DEBUG
		printf("leaving par_insert_string_before; insert before is done\n");
#endif
    return;
}    
 
/* ******************************************************************
 *	Function Name:
 *		par_save_string()
 *
 *	Description:
 *		this function saves the string in the output_array that is between ret_value->output_pos
 *		and ret_value->output_offset into the num'th element of match_array
 *
 *	Arguments:                                 
 *		I/O		unsigned char 	*output_array	a pointer to the output array
 *		INPUT	int				num				the nubmer of the array to copy the data to
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		preturn_value_t		a pointer to the return value structure passed
 *
 *	Comments:
 *
 * *****************************************************************/
void par_save_string(unsigned char *output_array,
					 int num,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value)
{
	/* this should be the last thing in the output array, but to be sure strncpy is used */
#ifdef DEBUG
	printf("entering par_save_string\n");
#endif
	/* 
	 *	check the input values 
	 */
 	if (ret_value==NULL)
 	{
#ifdef DEBUG
 		printf("leaving par_save_string ret_value is NULL\n");
#endif
 		return;
 	}
 	if ((output_array==NULL) || (match_array==NULL))
 	{
 		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
 		printf("leaving par_save_string; inputs are invalid\n");
#endif
 		return;
 	}
 	if (num<0 || num >PAR_MAX_ARRAYS)
 	{
 		printf("$%d is out of range\n",num);
 		ret_value->value=FATAL_FAIL;
 		return;
 	}
	if (ret_value->optional!= -1)
	{
		/* MGS BATS #449 */
		if (ret_value->output_offset>=PAR_MAX_MATCH_ARRAY)
		{
			ret_value->value=FAIL;
			return;
		}
		/* copy the output string to the temporoar array num */
		memcpy(match_array->array[num],(output_array+(ret_value->output_pos)),ret_value->output_offset);
		/* null terminate the string */
		match_array->array[num][ret_value->output_offset]='\0';
	}
#ifdef DEBUG
	printf("leaving par_save_string; string is saved in array %d\n",num);
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
 *		INPUT	short			dict_num		The number of the domian dictionary
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
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
 */
void par_dom_dict_search(unsigned char *current_rule,
						 unsigned char *input_array,
						 unsigned char *output_array,
						 pindex_data_t input_indexes,
						 pindex_data_t output_indexes,
						 pmatch_arrays_t match_array,
						 short dict_num,
						 preturn_value_t ret_value,
						 short dict_state_flag)
{
	short	ipos,opos;
	short	result=FAIL;
#ifdef DEBUG
	printf("entering par_dom_dict_search\n");
#endif
	ipos=ret_value->input_pos;
	opos=ret_value->output_pos;

	/* MGS BATS #449 */
	if (ret_value->input_offset>=PAR_MAX_MATCH_ARRAY)
	{
		ret_value->value=FAIL;
		return;
	}
	if (ret_value->output_offset>=PAR_MAX_MATCH_ARRAY)
	{
		ret_value->value=FAIL;
		return;
	}
	memcpy(match_array->array[7],input_array+ipos,ret_value->input_offset);
	match_array->array[7][ret_value->input_offset]='\0';
	memcpy(match_array->array[8],output_array+opos,ret_value->output_offset);
	match_array->array[8][ret_value->output_offset]='\0';
	result=par_search_for_word(match_array->array[8],match_array->array[9],dict_num,dict_state_flag);
	if (dict_state_flag)
	{
		if (result)
		{
#ifdef DEBUG
			printf("leaving par_dom_dict_search 1 success\n");
#endif
			ret_value->value=SUCCESS;
			return;
		}
#ifdef DEBUG
		printf("leaving par_dom_dict_search 1 failure\n");
#endif
		return;		
	}
	if (result==1)
	{
		if (memcmp(current_rule+ret_value->rule,"FAIL",4)==0)
		{
			ret_value->value=FAIL;
			if (ret_value->optional==1)
			{
#ifdef DEBUG
				printf("par_dom_dict_search hit set optinal to -1\n");
#endif
				ret_value->optional= -1;
				ret_value->rule+=5;
			}
			else
			{
#ifdef DEBUG
				par_print_rule_error("",current_rule,ret_value->rule);
				printf("leaving par_dom_dict_search because of a fail hit_action\n");
#endif
				return;
			}
		}
		ret_value->input_offset=0;	/* reset for rematching */
		ret_value->output_offset=0; /* reset for rematching */
		par_match_rule(current_rule,COPY_STATE,input_array,output_array,input_indexes,output_indexes,match_array,ret_value,'|',dict_state_flag);
#ifdef DEBUG
			printf("input_off = %d output_off =%d\n",ret_value->input_offset,ret_value->output_offset);
#endif
		/* skip the miss_action */ /* copy the code for this from the compiler */
		if (memcmp(current_rule+ret_value->rule,"FAIL",4)==0)
		{
			ret_value->rule+=5;
		}
		else
		{
			par_skip_states(current_rule,ret_value,COPY_STATE,'/');
		}
		
	}
	else    /* if (result==1) */
	{
		if (memcmp(current_rule+ret_value->rule,"FAIL",4)==0)
		{
			ret_value->rule+=5;
		}
		else
		{
			par_skip_states(current_rule,ret_value,COPY_STATE,'|');
		}
		/* skip the hit action state */ /* copy the code for this from the compiler */
		if (memcmp(current_rule+ret_value->rule,"FAIL",4)==0)
		{
			ret_value->value=FAIL;
			if (ret_value->optional==1)
			{
#ifdef DEBUG
				printf("par_dom_dict_search miss set optinal to -1\n");
#endif
				ret_value->optional= -1;
				ret_value->rule+=5;
			}
#ifdef DEBUG
				printf("leaving par_dom_dict_search because of a fail miss_action\n");
				par_print_rule_error("",current_rule,ret_value->rule);
#endif
			return;
		}
		ret_value->input_offset=0;	/* reset for rematching */
		ret_value->output_offset=0; /* reset for rematching */
		par_match_rule(current_rule,COPY_STATE,input_array,output_array,input_indexes,output_indexes,match_array,ret_value,'/',dict_state_flag);
	}       
#ifdef DEBUG
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
int par_look_ahead_dictionary(unsigned char *current_rule,
							  unsigned char *input_array,
							  pmatch_arrays_t match_array,
							  preturn_value_t ret_value)
{           
	unsigned char temp_output[100];
	index_data_t temp_indexes[100]; 
#ifdef DEBUG
	printf("entering par_look_ahead_dictionary\n");
#endif
	ret_value->output_pos=0;
	ret_value->output_offset=0;
	ret_value->value=SUCCESS;	
	par_match_rule(current_rule,DICTIONARY_STATE,input_array,temp_output,
		           temp_indexes,temp_indexes,match_array,ret_value,'/',1);
	if (ret_value->value==SUCCESS)
	{
#ifdef DEBUG
		printf("leaving par_look_ahead_dictionary success\n");
#endif
		return(1);
	}
#ifdef DEBUG
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
 * ******************************************************************/
short par_search_for_word(unsigned char *input,
						  unsigned char *output,
						  short dict_num,
						  short dict_state_flag)
{
	short high,low,pos=0;
	short dict_number;
	short value=0;
	short rev_same=0,for_same=0,npos=0;
	short save_for;
#ifdef DEBUG
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
#ifdef DEBUG
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
#ifdef DEBUG
			printf("leaving par_search_for_word in dict and short search\n");
#endif
			return(1);
		}
	}                                    
	if (value!=0)
	{
#ifdef DEBUG
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
	while ((for_same>=low) && (_stricmp(input,(unsigned char *)(dict_data_table+dict_index_table[for_same]))==0))
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
#ifdef DEBUG
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
#ifdef DEBUG
				printf("leaving par_dom_dict_search capitilization doesn't match\n");
#endif
				return(0);
			}
		}
	}
	if (value==0)
	{
		strcpy(output,((unsigned char *)(dict_data_table+dict_index_table[save_for]))+(strlen((unsigned char *)(dict_data_table+dict_index_table[save_for]))+1));
#ifdef DEBUG
		printf("leaving par_search_for_word success\n");
#endif
		return(1);
	}             
	return(0);
#ifdef DEBUG
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
 *		I/O		unsigned char 	*output_array	a pointer to the output array
 *		I/O		preturn_value_t	ret_value		the return value strucutre
 *
 *	Return Value:                                                         
 *		preturn_value_t		a pointer to the return value structure passed
 *
 *	Comments:
 *
 * *****************************************************************/
void par_check_word_string(unsigned char *output_array,
		 				   preturn_value_t ret_value)
{
 	int i,has_cons=0,has_vowel=0;

#ifdef DEBUG
 	printf("entering par_check_word_string\n");
#endif
	/*
 	 *	check the inputs for valid data
 	 */
 	if (ret_value==NULL)
 	{
#ifdef DEBUG
 		printf("leaving par_check_word_string ret_value is NULL\n");
#endif
 		return;
 	}
 	if ((output_array==NULL))
 	{
 		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
 		printf("leaving par_check_word_string input is NULL\n");
#endif
 		return;
 	}                                  
	if (ret_value->optional!= -1)
	{
		i=ret_value->output_pos;
		 //	053	MGS		03/03/1998  BATS 874 fixed word state 
		while (i<(ret_value->output_offset+ret_value->output_pos) && (has_cons==0 || has_vowel==0))
		{
			if (parser_char_types[output_array[i]] & TYPE_consonant)
			{
				has_cons=1;
			}
			if (parser_char_types[output_array[i]] & TYPE_vowel)
			{
				has_vowel=1;
			}                                
			if ((parser_char_types[output_array[i]] & TYPE_alpha) == 0)
			{
				ret_value->value=FAIL;
#ifdef DEBUG
				printf("the output is not a word\n");
#endif
				return;
			}			
			i++;
		}
		 //	053	MGS		03/03/1998  BATS 874 fixed word state 
		if (has_cons && has_vowel && (ret_value->output_offset)>=2)
		{
#ifdef DEBUG
			printf("the output may be a word\n");
#endif
		}         
		else
		{
			ret_value->value=FAIL;
#ifdef DEBUG
			printf("the output is not a word\n");
#endif
		}
	} /* if (ret_value->optional!= -1) */
#ifdef DEBUG
		printf("leaving par_check_word_string\n");
#endif
	return;
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
unsigned char *par_build_string_from_rule(unsigned char *current_rule,
										  unsigned char *buf,
										  unsigned char *output_array,
										  pmatch_arrays_t match_array,
										  preturn_value_t ret_value,
										  prange_value_t range_value,
										  int state,
										  int *length)
{
	short temp_hex;                     /* this must be signed */
	int is_cond=0;						/* is the current replacement conditional */
	int cond_num=0;						/* what number conditioal thing to replace with */
	int rule_p;							/* a temporary rule pointer */
	int buf_ind=0;						/* the current index into the temp buffer */
	int match_l=0;						/* the length of the string in the save array */
	int match_num;						/* the index of the save array to be used */

#ifdef DEBUG
	printf("entering par_build_string_from_rule\n");
#endif
	/*
	 *	check input values
	 */
	if (ret_value==NULL)
	{
#ifdef DEBUG
		printf("leaving par_build_string_from_rule ret_value is NULL\n");
#endif
		return(NULL);
	}
	if ((current_rule==NULL) || (buf == NULL) || (match_array == NULL) ||
		(state == NULL_STATE) || (length==NULL))
	{
#ifdef DEBUG
		printf("leaving par_build_string_from_rule; inputs are invalid\n");
#endif
		ret_value->value=FATAL_FAIL;
		return(NULL);
	}
	rule_p=ret_value->rule;
#ifdef DEBUG
		printf("current_rule[%d]=%c\n",rule_p,current_rule[rule_p]);
		if (current_rule[rule_p]==EXACT_CHAR_DELIM)
			printf("found an exact character delimiter\n");
#endif
	buf[0]='\0';	/* clear buf just in case */
	/* build the string until a '/' is hit */
	while (current_rule[rule_p] != STATE_PART_DELIM)
	{
		/* build the string until either a slash is found or a conditional is found */
		while ((current_rule[rule_p]!=STATE_PART_DELIM) && is_cond<=0)
		{
			switch (current_rule[rule_p])
			{
				case EXACT_CHAR_DELIM:		/* an exact string was found */
				    rule_p++;	/* skip the first exact character delimiter */
					while ((current_rule[rule_p] != '\0') && (current_rule[rule_p]!=EXACT_CHAR_DELIM))
					/* copy the string to output buffer */
					{
						if (current_rule[rule_p]==ESCAPE_DELIM)		/* check for \' and \\ */
						{
							rule_p++;
						}
#ifdef DEBUG
						printf("build_string %c ",current_rule[rule_p]);
#endif
						if (ret_value->optional!= -1)
						{
							buf[buf_ind]=current_rule[rule_p];
							buf_ind++;
						}
						rule_p++;
					}
					if (current_rule[rule_p]!=EXACT_CHAR_DELIM)		/* be sure there is an ending quote */
					{
						par_print_rule_error("build_string;end of exact character string not found",current_rule,rule_p);
						ret_value->value=FATAL_FAIL;
						return(NULL);
					}
					rule_p++; /* eat the trailing quote */
					break;
				case EXACT_CASE_DELIM:
					par_print_rule_error("case insensitive string building is impossible",current_rule,rule_p);
					ret_value->value=FATAL_FAIL;
					break;
				case SAVE_DELIMITER: /* a $# sequence was found. */
					rule_p++;
					if (ret_value->optional!= -1)
					{
						match_num=current_rule[rule_p]-'0';		/* get the array number */
						if ((match_num<0) || (match_num>PAR_MAX_ARRAYS))
						{
							printf("build_string;shuffle index %d out of range",match_num);
							par_print_rule_error("",current_rule,rule_p);
							ret_value->value=FATAL_FAIL;
							return(NULL);
						}
						match_l=strlen(match_array->array[match_num]);	/* get the length of the strig in the array */
						memcpy(buf+buf_ind,match_array->array[match_num],match_l);
						buf_ind+=match_l;   		/* add the length of the string in the array to buff_ind */
					}
					rule_p++;
					break;
				case CONDITIONAL_DELIM:
					/* 	when a conditional is found, the first conditional replacement
					 *	is already built.
					 *	the proper string has to be build, so the number of the conditional has to
					 *	be calculated
					 *	replace and insert both use the whole value for the calculation
					 *	insert before and after use the first and last characters respectively
					 *	the range replacement is zero based unless a range of values 
					 *	was specified in a D[3-5].  in this case the replacement is based on 3
					 */
					if (is_cond== -1)	/* 	when is_cond== -1 the conditional was found after the
										 *	correct string was build.	break out of the loop now
										 * and find the end of state */
					{
						is_cond=2;		/* 	set to 2 to signal the string was build and the
										 *	end of state has to be found */
						break;
					}
					is_cond=1;			/* this is now going to be a conditional replacement */
					/* make sure the output array is correctly null terminated */
					output_array[ret_value->output_offset+ret_value->output_pos]='\0';
					
					switch (state)
					{
						case INSERT_BEFORE_STATE:
							/* read the first character in the output range */
							if (ret_value->optional!= -1)
							{
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
							}
							else
							{
								cond_num=0;
							}
							break;
						case INSERT_AFTER_STATE:
							/* convert the last character in the range */
							if (ret_value->optional!= -1)
							{
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
							}
							else
							{
								cond_num=0;
							}
							break;
						default:
							if (ret_value->optional!= -1)
							{
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
							else
							{
								cond_num=0;
							}
					}
					break;
				case HEXADECIMAL_DELIM:
					/* a hexadecimal value was found */
					/* hexadecimal values have to be specified in the format 0xab */
					/* they must have 2 legal letters after the x */
					if (ret_value->optional!= -1)
					{
						if (current_rule[rule_p+1]!='x')
						{
							par_print_rule_error("build_string;zero found without an x",current_rule,rule_p);
							ret_value->value=FATAL_FAIL;
							return(NULL);
						}
						temp_hex=par_convert_hex_number(current_rule+rule_p,2);
						if (temp_hex<0)      /* check for a valid hexidecimal value */
						{
							par_print_rule_error("build_string;invalid hex value",current_rule,rule_p);
							ret_value->value=FATAL_FAIL;
							return(NULL);
						}
						buf[buf_ind]=(unsigned char)temp_hex; /* put the value into the buffer array */
						buf_ind++;
					}
					rule_p+=4;			/* move past the hexadecimal value */
					break;
				default:
					/* the current character is not a recognized type */
					par_print_rule_error("build_string;unrecognized delimiter",current_rule,rule_p);
					ret_value->value=FATAL_FAIL;
					return(NULL);
			}
		}
		/*	the number of the conditional replacemnt is greater than zero and
		 *	a conditional replacement is specified
		 *	when the conditional replacement number is zero the conditional is already built
		 */
		if (cond_num >0 && is_cond==1)
		{
			rule_p=par_find_conditional_number(current_rule,rule_p,cond_num);
			is_cond= -1;
			buf_ind=0;
			buf[0]='\0';
		}
		/* the conditional string is already built, so find the end of the state */
		if (is_cond==2 || cond_num==0)
		{
			rule_p=par_find_end_of_rule(current_rule,rule_p);
			is_cond=0;
		}
	}
	/* then end of the rule has been hit */
	if (ret_value->optional!= -1)
	{
		buf[buf_ind]='\0';
		*length=buf_ind;
	}
	ret_value->rule=rule_p;
#ifdef DEBUG2
		par_print_rule_error("no error, just debugging output position",current_rule,rule_p);
#endif
#ifdef 	DEBUG
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
int par_match_string(unsigned char *current_rule,
					 int char_type,
					 unsigned char *input_array,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value,
					 prange_value_t range_value,
					 int lookahead,
					 int break_on_min_match)
{
	int rule_p,ipos,length=0;
	int temp_hex;

#ifdef DEBUG
	printf("entering par_match_string\n");
#endif
	rule_p=ret_value->rule;
	ipos=ret_value->input_pos+ret_value->input_offset;

	switch(char_type)
	{
		case EXACT_CHAR_TYPE:
			rule_p++;			/* skip the single quote */
			while ((current_rule[rule_p]!=EXACT_CHAR_DELIM))
			{
				if (current_rule[rule_p]==ESCAPE_DELIM)
				{
					rule_p++;
				}
				if (ret_value->optional!= -1)
				{
					if (current_rule[rule_p]!=input_array[ipos+length])
					{
						ret_value->value=FAIL;
#ifdef DEBUG
						printf("leaving par_match_string; exact characters dont match\n");
#endif
						if (ret_value->optional==1)
						{
#ifdef DEBUG
							printf("par_match_string; exact optional set to -1\n");
#endif
							ret_value->optional= -1;
						}
						length= -1; /* set to -1 because of the length++ later */
					}
					length++;
				}
				rule_p++;
			}
			rule_p++;
			break;
		case EXACT_CASE_TYPE:
			rule_p++;			/* skip the single back quote */
			while ((current_rule[rule_p]!=EXACT_CASE_DELIM))
			{
				if (current_rule[rule_p]==ESCAPE_DELIM)
				{
					rule_p++;
				}
				if (ret_value->optional!= -1)
				{
					if (par_lower[current_rule[rule_p]]!=par_lower[input_array[ipos+length]])
					{
						ret_value->value=FAIL;
#ifdef DEBUG
						printf("leaving par_match_string; exact case characters dont match\n");
#endif
						if (ret_value->optional==1)
						{
#ifdef DEBUG
							printf("par_match_string; exact case optional set to -1\n");
#endif
							ret_value->optional= -1;
						}
						length= -1; /* set to -1 because of the length++ later */
					}
					length++;
				}
				rule_p++;
			}
			rule_p++;
			break;
		case HEXADECIMAL_TYPE:
			if (ret_value->optional!= -1)
			{
				if (current_rule[rule_p+1]!='x')
				{
					par_print_rule_error("par_match_string;zero found without an x",current_rule,rule_p);
					ret_value->value=FATAL_FAIL;
					return(0);
				}
				temp_hex=par_convert_hex_number(current_rule+rule_p,2);
				if (temp_hex<0)      /* check for a valid hexidecimal value */
				{
					par_print_rule_error("par_match_string;invalid hex value",current_rule,rule_p);
					ret_value->value=FATAL_FAIL;
					return(0);
				}
				if (input_array[ipos]!=temp_hex)
				{
					ret_value->value=FAIL;
					if (ret_value->optional==1)
					{
#ifdef DEBUG
						printf("par_match_string; hex optional set to -1\n");
#endif
						ret_value->optional= -1;
					}
#ifdef DEBUG
						printf("leaving par_match_string hexadecimal value %02X mismatch\n",temp_hex);
#endif
					return(0);
				}
				length=1;
			}
			rule_p+=4;			/* move past the hexadecimal value */
			break;
		case SAVE_CHAR_TYPE:						/* a $# sequence was found. */
			rule_p++;
			if (ret_value->optional!= -1)
			{
				temp_hex=current_rule[rule_p]-'0';		/* get the array number */
				if ((temp_hex<0) || (temp_hex>PAR_MAX_ARRAYS))
				{
					printf("par_match_string;shuffle index %d out of range",temp_hex);
					par_print_rule_error("",current_rule,rule_p);
					ret_value->rule=rule_p+1;
					ret_value->value=FATAL_FAIL;
					return(0);
				}
				length=strlen(match_array->array[temp_hex]);	/* get the length of the strig in the array */
				if ((memcmp(input_array+ipos,match_array->array[temp_hex],length)!=0))
				{
					ret_value->value=FAIL;
                    length=0;
					if (ret_value->optional==1)
					{
#ifdef DEBUG
						printf("par_match_string; save optional set to -1\n");
#endif
						ret_value->optional= -1;
					}
				}
			}
			rule_p++;
			break;
		case SET_CHAR_TYPE:
			length=par_match_sets_with_ranges(current_rule,input_array,match_array,ret_value,range_value,lookahead,break_on_min_match);
			rule_p=ret_value->rule;
			/* find the { */
			/* find the first thing to search for */
			/* save the rule pointer for multiple matches */
			/* loop calling par_match_string pointing to each thing to match before the comma
			   and if all of them are successful, return the total nubmer of characters matched
			   if not, go on to the next section */
			/* the ret_value structure passed is the same one that is passed to the current
			   par_match_string, so the rule field will be corrupted */
			/* repeat the loop for each time iteration of the <#> thing */
            /* set the range if only one is found */
            break;
		case DIGIT_CHAR_TYPE:    
			/* find the type of digit thing to match */
			/* if it is a range, calculate the nubmer of digits to match */
				/* do digit matching as usual for the specified number of characters
				   making sure the value doesn't go too high */
				   /* if it does go too high go back one character only if it doesn't go too low from that */
			/* if it is a number of characters, find the number of characters as usual */
			if ((current_rule[rule_p+1]=='[') || (current_rule[rule_p+2]=='['))
			{
				/* check for the special digit type and if it is there */
				/* use the special digit matching function. */
				/* use the normal one otherwise */
				length=par_match_digits(current_rule,input_array,match_array,ret_value,range_value,lookahead,break_on_min_match);
				rule_p=ret_value->rule;
				break;
			}

		case UPPER_CHAR_TYPE:
        case ANY_ALPHA_CHAR_TYPE:
        case ANY_CHAR_CHAR_TYPE:
        case WHITE_CHAR_TYPE:
        case PUNCT_CHAR_TYPE:
        case LOWER_CHAR_TYPE:
        case NON_ALPHA_CHAR_TYPE:
        case VOWEL_CHAR_TYPE:
        case CONSONANT_CHAR_TYPE:
		case NUMBER_CHAR_TYPE:
		case CLAUSE_CHAR_TYPE:
        case ALPHA_NUM_CHAR_TYPE:
        case VOWEL_NON_Y_TYPE:
        case SOME_PUNCT_TYPE:
			length=par_match_standard(current_rule,char_type,input_array,match_array,
									  ret_value,lookahead,break_on_min_match);
			rule_p=ret_value->rule;
        	break;
        default:               
        	par_print_rule_error("par_match_string; character format specifier not found",current_rule,rule_p);
        	break;
	}
	ret_value->rule=rule_p;
	if (length== -2)
	{
		length=0;
	}
	else
	{
		if (input_array[ipos+length]=='\0')
		{
			if (length<=0)
			{
				if (ret_value->optional==1 || ret_value->optional== -1)
				{
				  ret_value->optional= -1;
				  ret_value->value=FAIL;
				  length=0;
				}
				else
				{
				  length= -1;
				}
			}
		}
	}
#ifdef DEBUG
	printf("leaving par_match_string length = %d ret_value->value=%d\n",length,ret_value->value);
#endif
	return(length);
}
 
/* ******************************************************************
 *	Function Name:
 *      par_find_conditional_number
 *
 *	Description:
 *      this function finds the conditional with number cond_num in the current rule
 *      starting at the rule_p. it skips all the syntax until the proper conditional is found
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *      INPUT   int             rule_p          The current rule index
 *      INPUT   int             cond_num        The conditional nubmer that you are looking for
 *
 *	Return Value:
 *      int         the new value of rule_p
 *
 *	Comments:
 *      the return value points to the first character in the proper conditional string to build
 *      this function is not called when the conditional number is 0
 *
 *  ****************************************************************/
int par_find_conditional_number(unsigned char *current_rule,
								int rule_p,
								int cond_num)
{
	/* rule_p currently points to the '|' after the first item in the conditional replacement */
#ifdef DEBUG
		printf("entering par_find_conditional_number\n");
#endif
	if ((current_rule==NULL))
	{
#ifdef DEBUG
			printf("leaving find_contitional_number a 0\n");
#endif
		return(rule_p);
	}
	while (cond_num>0)
	{
		switch (current_rule[rule_p])
		{
			case CONDITIONAL_DELIM:
				cond_num--;
				break;
			case EXACT_CHAR_DELIM:                                                  
				rule_p++;
				while (current_rule[rule_p]!=EXACT_CHAR_DELIM)
				{
					if (current_rule[rule_p]==ESCAPE_DELIM)
					{
						rule_p++;
					}
					rule_p++;
				}   
				break;
			case EXACT_CASE_DELIM:
				par_print_rule_error("replacement string can never be case insensitive",current_rule,rule_p);
				rule_p++;
				while (current_rule[rule_p]!=EXACT_CASE_DELIM)
				{
					if (current_rule[rule_p]==ESCAPE_DELIM)
					{
						rule_p++;
					}
					rule_p++;
				}   
				break;
			case STATE_PART_DELIM:
				par_print_rule_error("conditional number not found before the end of the rule",current_rule,rule_p);
				cond_num= -1;                        
				rule_p--;
				break;
		}
		rule_p++;
	}
#ifdef DEBUG
	printf("leaving par_find_conditional_number 1\n");
#endif
	return(rule_p);
}
 
/* ******************************************************************
 *	Function Name:
 *      par_find_end_of_rule()
 *
 *	Description:
 *      this function finds the ending slash of a rule after the conditional string
 *      has been built
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *      INPUT   int             rule_p          The current rule index
 *
 *	Return Value:
 *      int         the new value of rule index pointer
 *
 *	Comments:
 *      rule_p is left pointing at the chracter after the slash
 *
 * *****************************************************************/
int par_find_end_of_rule(unsigned char *current_rule,
						 int rule_p)
{
	/* rule_p currently points to the '|' or the '/' after the processed in the conditional replacement */
#ifdef DEBUG
	printf("entering par_find_end_of_rule\n");
#endif
	if ((current_rule==NULL))
	{
#ifdef DEBUG
		printf("leaving par_find_end_of_rule a 0\n");
#endif
		return(rule_p);
	}                                               
	while (current_rule[rule_p]!=STATE_PART_DELIM)
	{
		switch (current_rule[rule_p])
		{
			case EXACT_CHAR_DELIM:
				rule_p++;
				while (current_rule[rule_p]!=EXACT_CHAR_DELIM)
				{
					if (current_rule[rule_p]==ESCAPE_DELIM)
					{
						rule_p++;
					}
					rule_p++;
				}   
				break;
			case EXACT_CASE_DELIM:
				par_print_rule_error("replacement string can never be case insensitive",current_rule,rule_p);
				rule_p++;
				while (current_rule[rule_p]!=EXACT_CASE_DELIM)
				{
					if (current_rule[rule_p]==ESCAPE_DELIM)
					{
						rule_p++;
					}
					rule_p++;
				}   
				break;
		}
		rule_p++;
	}   
#ifdef DEBUG
		printf("leaving par_find_end_of_rule 1\n");
#endif
	return(rule_p);					
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
void par_copy_string_data(unsigned char *input_array,
						  pindex_data_t input_indexes,
						  unsigned char *output_array,  
						  pindex_data_t output_indexes,
						  int num_chars,
						  preturn_value_t ret_value)
{
	int i;
#ifdef DEBUG
	printf("entering par_copy_string_data\n");
#endif
	for (i=0;i<num_chars;i++)
	{
		output_array[ret_value->output_pos+ret_value->output_offset+i]=input_array[ret_value->input_pos+ret_value->input_offset+i];
		par_copy_index(output_indexes,ret_value->output_pos+ret_value->output_offset+i,input_indexes,ret_value->input_pos+ret_value->input_offset+i);
	}
#ifdef DEBUG
	printf("leaving par_copy_string_data\n");
#endif
}
 
/* ******************************************************************
 *	Function Name:
 *      par_convert_hex_number()
 *
 *	Description:
 *      this function converts the hexadecimal number at the beginning of
 *      into a short.
 *
 *	Arguments:
 *      INPUT   unsigned char   *string     The string with the hexadecimal value to convert
 *      INPUT   int             num         The number of hexadecimal digits to convert
 *
 *	Return Value:
 *      short       The converted hexadecimal value
 *                  or -1 on an error
 *
 *	Comments:
 *      this function expects to find a 0 (zero) an x (lowercase) and
 *      num upper case hexadecimal digits
 *
 * *****************************************************************/
short par_convert_hex_number(unsigned char *string,
							 int num)
{
	register short total=0,temp=0,i=2;
#ifdef DEBUG
	printf("entering par_convert_hex_number\n");
#endif
	if ((*string)!='0')
		return(-1);
	if (*(string+1)!='x')
		return(-1);
	num+=2;
	while (i<num)
	{
		if (string[i]>'9')
		{
			temp=string[i]-'A'+10;
		}
		else
		{
			temp=string[i]-'0';
		}
		if ((temp<0) || (temp>15))
			return(-1);
		total=(total<<4)+temp; 
		i++;
	}                                            
#ifdef DEBUG
	printf("leaving par_convert_hex_number 1\n");
#endif
	return(total);
}
 
/* ******************************************************************
 *	Function Name:
 *      par_convert_number()
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
short par_convert_number(unsigned char *string, short num)
{
	register int i, total=0, temp;

	for (i=0;i<num;i++)
	{
		temp=string[i]-'0';
		if ((temp<0) || (temp>9))
			return(total);
		total=total*10+temp;
	}
	return(total);
}
 
/* ?*****************************************************************
 *	Function Name:
 *      par_convert_number_new()
 *
 *	Description:
 *      this function converts a decimal number to a short
 *
 *	Arguments:
 *      INPUT   unsigned char   *string     a pointer to a string with a number in it
 *      OUTPUT  int             *length     The length of the converted string
 *
 *	Return Value:
 *      short       the converted decimal value
 *                 
 *
 *	Comments:
 *      testing shows that this function is about 40% faster than atoi() and get_int_length() together
 *      this function comverts the number until a non digit is found
 *
 * *****************************************************************/
short par_convert_number_new(unsigned char *string, short *length)
{
    register int i,total=0,temp;

	for (i=0;;i++)
	{
		temp=string[i]-'0';
		if ((temp<0) || (temp>9))
		  {
			*length=i;
			return(total);
		  }
		total=total*10+temp;
	}
	*length=i;
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
 *      INPUT unsigned char *string     a pointer to a string with a number in it
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
short par_convert_number_new2(unsigned char *string)
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
 
/*
 *	Function Name:
 *      par_get_int_length
 *
 *	Description:
 *      this function calculates the length of a decimal integer
 *
 *	Arguments:
 *      INPUT   short           i       the number to calculate the length of
 *
 *	Return Value:
 *      short       The length of i
 *
 *	Comments:
 *      the number zero has a length of 1
 *      this function only converts positive numbers correctly
 *
 */
short par_get_int_length(short i)
{
	int j;
#ifdef DEBUG
		printf("entering par_get_int_length\n");
#endif
	if (i==0)
	{
#ifdef DEBUG
			printf("leaving par_get_int_length length=1\n");
#endif
		return(1);
	}
	for (j=0;i;j++)
		i/=10;
#ifdef DEBUG
		printf("leaving par_get_int_length length=%d\n",j);
#endif
	return(j);
}
 
/*
 *	Function Name:
 *      par_look_ahead
 *
 *	Description:
 *      this function tries to resolve ambigous rules by looking ahead in
 *      the rule to find the next character type and then trying to match it
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		I/O		unsigned char 	*input_array	a pointer to the input array
 *      INPUT   int             ipos			The current input position
 *		INPUT	int				rule_p			the current position in the rule
 *		INPUT	int				cur_type		The current type in the matching
 *		I/O		int				*find_type		The position of the chracter type found in the rule
 *												or -1 for the end of the rule
 *												starts out life at -2
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
 */
short par_look_ahead(unsigned char *current_rule,
					 unsigned char *input_array,
					 int ipos,
					 int rule_p,
					 int cur_type,
					 int from_reverse,
					 int *find_type,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value)
{
	preturn_value_t		temp_ret;
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,0 };
	range_value_t		range_value = {0,0,0,0};
	int 				new_find=0;
	int					i=0;
        unsigned short                           temp_type=0;
	int char_length=0;
	int to_reverse=1;   /* 1 for match, 0 for non_match */
	int state;

#ifdef DEBUG
		printf("entering par_look_ahead\n");
		par_print_rule_error("par_look_ahead; the current position is",current_rule,ret_value->rule);
#endif

	if (*find_type== -1)
	{
#ifdef DEBUG
			printf("leaving par_look_ahead end of string reached \n");
#endif
		return(0);
	}
	if (*find_type== -2)
	{
		temp_type=0;
	}
	else
	{
		temp_type=par_get_char_type(current_rule[*find_type]);
	}
	/* if find_type==0, look for the type and then check ambiguity */
	temp_ret=ret_value;
	/* first, find the end of the currrent type specifer */
	if (temp_type==0)
	{
		/* i think that rule_p is pointing to the character after the > at this point */
#ifdef LOOK_DEBUG
			par_print_rule_error("par_look_ahead;the current position the rule is a",current_rule,rule_p);
#endif
		if ((current_rule[rule_p-1]!='>') && (current_rule[rule_p-1]!=']'))
		{
			while ((current_rule[rule_p]!='>') && (current_rule[rule_p]!=']'))
			{
				rule_p++;
			}
			/* once the end is found, skip the ending chracter */
#ifdef LOOK_DEBUG
			par_print_rule_error("par_look_ahead;the current position the rule is b",current_rule,rule_p);
#endif
			if ((current_rule[rule_p]=='>') && (current_rule[rule_p]==']'))
				rule_p++;
#ifdef LOOK_DEBUG
			par_print_rule_error("par_look_ahead;the current position the rule is c",current_rule,rule_p);
#endif
		}
		while (((temp_type=par_get_char_type(current_rule[rule_p]))==0) && (current_rule[rule_p]!='\0'))
		{
#ifdef LOOK_DEBUG
			par_print_rule_error("the current position in the rule is d",current_rule,rule_p);
#endif
			if ((state=par_get_state(current_rule[rule_p]))!=0)
			{
			  if (state==DICTIONARY_STATE)
			  {
			      par_copy_return_value(&new_ret,ret_value);			  
			      new_ret.rule=rule_p+2;	/* skip the h and the slash */
			      new_ret.input_pos=ipos;
			      if (par_look_ahead_dictionary(current_rule,input_array,match_array,&new_ret))
			      {
#ifdef DEBUG
			      		printf("par_look_ahead;dictionary_state dict entry found\n");
#endif
			      	return(1);
			      }
#ifdef DEBUG
			      	printf("par_look_ahead;dictionary_state dict entry not found\n");
#endif
			      return(0);			   
			  }
			  if (state==MACRO_STATE)
				{
#ifdef DEBUG
				  printf("macro state found, no lookahead performed\n");
#endif				  
				  *find_type= -1;
				  return(0);
				}
			  rule_p++;
			}
			else
			{
				if (((current_rule[rule_p]==STATE_PART_DELIM) || (current_rule[rule_p]==END_SAVE_STATE)) && 
					   (temp_ret!=NULL) && 
					   (current_rule[rule_p]!='\0'))
				{
					switch (temp_ret->state)
					{
						case NULL_STATE:
							*find_type= -1;
							par_print_rule_error("par_look_ahead;the position when it found the end of string",current_rule,rule_p);
#ifdef DEBUG
								printf("par_look_ahead;end of string has been found\n");
#endif
							return(0);
					    case SAVE_STATE:
                    		 /* just skip the ')' done later */
							break;
                    	case COPY_STATE:
                    	case DELETE_STATE:
						case OPTIONAL_STATE:
						case WORD_STATE:
                    		//rule_p++;	/* these states only have a closing slash in them */
							/* done later */
                    		break;                                                          
                    	case REPLACE_STATE:
                    	case INSERT_STATE:
                    	case INSERT_AFTER_STATE:
                    	case INSERT_BEFORE_STATE:
						/* GL 02/08/1997 add STATUS_STATE */
                    	case STATUS_STATE:
                    		rule_p++;	/* skip the slash */
                    		while ((current_rule[rule_p]!=STATE_PART_DELIM))
								/* find the end of this state */
                    		{
								if (current_rule[rule_p]==EXACT_CHAR_DELIM)
                    				/* skip any exact character strings */
                    			{
                    				rule_p++;
                    				while (current_rule[rule_p]!=EXACT_CHAR_DELIM)
									{
                    					if (current_rule[rule_p]==ESCAPE_DELIM)
                    					{
											rule_p++;
                    					}
                    					rule_p++;
									}
                    			} 
								else if (current_rule[rule_p]==EXACT_CASE_DELIM)
                    				/* skip any exact character strings */
                    			{
                    				rule_p++;
                    				while (current_rule[rule_p]!=EXACT_CASE_DELIM)
									{
                    					if (current_rule[rule_p]==ESCAPE_DELIM)
                    					{
											rule_p++;
                    					}
                    					rule_p++;
									}
                    			}
								rule_p++;
                    		}
                    	   	/* the ending character of the state was found. it is skipped later */
                    		break;
                    	case DICTIONARY_STATE:
                    		rule_p++;/* skip the shash */
                    		/* skip the hit action */
							if (memcmp(current_rule+rule_p,"FAIL",4)==0)
							{
								rule_p+=5;
							}
							else
							{                              
								new_ret.rule=rule_p;
								par_skip_states(current_rule,&new_ret,COPY_STATE,'|');
								rule_p=new_ret.rule;
							}                         
							/* skip the miss action */
							if (memcmp(current_rule+rule_p,"FAIL",4)==0)
							{
								rule_p+=5;
							}
							else
							{
								new_ret.rule=rule_p;						
								par_skip_states(current_rule,&new_ret,COPY_STATE,'/');
								rule_p=new_ret.rule;
							}                    		
                    		break;
                    }
                  	temp_ret=temp_ret->prev;                  	
                }   /* if (current_rule[rule_p]==STATE_PART_DELIM) */
			} /* else -- if (par_get_state) */
			rule_p++;
		}	/* while ((*find_type=par_get_char_type(current_rule[rule_p]))==0) */
        *find_type=rule_p;
	}	/* if (temp_type==0)*/
	else
	{
		rule_p= *find_type;
	}
	/* 
	 *	a character type has been found or there is an error in the rule
	 */ 
	if (temp_type==NO_LOOKAHEAD)
	{
		*find_type= -1;
#ifdef DEBUG
			printf("lookahead disabled by the type\n");
#endif
		return(0);
	}
	if (current_rule[rule_p]=='\0')
	{
#ifdef DEBUG
			printf("leaving par_look_ahead; end of the rule was reached before a type was found\n");
#endif              
		*find_type= -1;
		return(0);
	}
	if (current_rule[rule_p+1]==NON_MATCH_DELIM)
	{
		to_reverse=0;
	}
	/* look for the character type in the input_array */
	/* check the current_type and the find_type for ambiguity in the rules */
	cur_type=par_convert_to_new(cur_type);
	new_find=par_convert_to_new(temp_type);
#ifdef LOOK_DEBUG
		printf("current_type=%d new_find=%d\n",cur_type,new_find);
#endif
	switch(temp_type)
	{
		case EXACT_CHAR_TYPE:
			rule_p++;
			/*
			 * compare the entire exact string, if it is there, return success 
			 */
			i=0;
#ifdef LOOK_DEBUG
				printf("matching chracters are ");
#endif
			while (current_rule[rule_p]!=EXACT_CHAR_DELIM)
			{
				if (current_rule[rule_p]==ESCAPE_DELIM)
				{
					rule_p++;
				}
#ifdef LOOK_DEBUG
					printf("%c",current_rule[rule_p]);
#endif
				if (input_array[ipos+i]!=current_rule[rule_p])
				{
#ifdef LOOK_DEBUG
						printf("\n");
#endif
#ifdef DEBUG
						printf("leaving par_look_ahead exact chars failed\n");
#endif
					return(0);
				}               
				i++;
				rule_p++;
			}
#ifdef LOOK_DEBUG
				printf("\n");
#endif
#ifdef DEBUG
				printf("leaving par_look_ahead exact chars matched\n");
#endif
			if (i>0)
			  return(1);
			else
			  return(0);
		case EXACT_CASE_TYPE:
			rule_p++;
			/*
			 * compare the entire exact case string, if it is there, return success 
			 */
			i=0;
#ifdef LOOK_DEBUG
				printf("matching chracters are ");
#endif
			while (current_rule[rule_p]!=EXACT_CASE_DELIM)
			{
				if (current_rule[rule_p]==ESCAPE_DELIM)
				{
					rule_p++;
				}
#ifdef LOOK_DEBUG
					printf("%c",current_rule[rule_p]);
#endif
				if (par_lower[input_array[ipos+i]]!=par_lower[current_rule[rule_p]])
				{
#ifdef LOOK_DEBUG
						printf("\n");
#endif
#ifdef DEBUG
						printf("leaving par_look_ahead exact case chars failed\n");
#endif
					return(0);
				}               
				i++;
				rule_p++;
			}
#ifdef LOOK_DEBUG
				printf("\n");
#endif
#ifdef DEBUG
				printf("leaving par_look_ahead exact case chars matched\n");
#endif
			if (i>0)
			  return(1);
			else
			  return(0);
		case HEXADECIMAL_TYPE:
			/*
			 * convert the number in the rule and compare it to the value in the input_array
			 */
			i=par_convert_hex_number(current_rule+rule_p,2);
			if (input_array[ipos]==i)
			{
#ifdef DEBUG
					printf("leaving par_look_ahead; hex number success\n");
#endif
				return(1);
			}
#ifdef DEBUG
				printf("leaving par_look_ahead; hex number failure\n");
#endif
			return(0);
		case SAVE_CHAR_TYPE:						/* a $# sequence was found. */
			rule_p++;		
			i=current_rule[rule_p]-'0';		/* get the array number */
			if ((i<0) || (i>9))
			{
				return(0);
			}
			if ((memcmp(input_array+ipos,match_array->array[i],strlen(match_array->array[i]))==0))
			{
#ifdef DEBUG
					printf("leaving par_look_ahead; par_save_string success\n");
#endif
				if (match_array->array[i][0]!='\0')
					return(1);
				else
					return(0);
			}
#ifdef DEBUG
				printf("leaving par_look_ahead; par_save_string failure\n");
#endif
			return(0);
		case SET_CHAR_TYPE:
			/*
			 * sets are never checked for ambiguity, because there may be too many posbilities
			 */
#ifdef DEBUG
				printf("leaving lookahead; next type is a set \n");
#endif
			return(0);
		case DIGIT_CHAR_TYPE:
			if (par_lookup_ambiguous(cur_type,from_reverse,new_find,to_reverse)==0)
			{
#ifdef DEBUG
					printf("leaving par_look_ahead; non ambigous combination\n");
#endif
				return(0);
			}
			if ((current_rule[rule_p+1]=='[') || (current_rule[rule_p+2]=='['))
			{
				new_ret.rule= *find_type;
				new_ret.value=SUCCESS;
				new_ret.input_pos=ipos;
				char_length=par_match_digits(current_rule,input_array,match_array,&new_ret,&range_value,0,1);
				if (new_ret.value==SUCCESS)
				{
#ifdef DEBUG
						printf("leaving par_look_ahead;digit range success\n");
#endif
					if (char_length>0)
					  return(1);
					else
					  return(0);
				}
#ifdef DEBUG
					printf("leaving par_look_ahead;digit range fail\n");
#endif
				return(0);
			}				
		case UPPER_CHAR_TYPE:
		case LOWER_CHAR_TYPE:
		case ANY_ALPHA_CHAR_TYPE:
		case ANY_CHAR_CHAR_TYPE:
		case WHITE_CHAR_TYPE:
		case PUNCT_CHAR_TYPE:
		case NON_ALPHA_CHAR_TYPE:
		case VOWEL_CHAR_TYPE:
		case CONSONANT_CHAR_TYPE:
		case NUMBER_CHAR_TYPE:
		case CLAUSE_CHAR_TYPE:
		case ALPHA_NUM_CHAR_TYPE:
        case VOWEL_NON_Y_TYPE:
        case SOME_PUNCT_TYPE:
			if (par_lookup_ambiguous(cur_type,from_reverse,new_find,to_reverse)==0)
			{
#ifdef DEBUG
					printf("leaving par_look_ahead; non ambigous combination\n");
#endif
				return(0);
			}
			new_ret.rule= *find_type;
			new_ret.value=SUCCESS;
			new_ret.input_pos=ipos;
			char_length=par_match_standard(current_rule,temp_type,input_array,match_array,&new_ret,0,1);
			if (new_ret.value==SUCCESS)
			{
#ifdef DEBUG
					printf("leaving par_look_ahead;standard success\n");
#endif
				if (char_length>0)
				  return(1);
				else
				  return(0);
			}
#ifdef DEBUG
				printf("leaving par_look_ahead;standard fail\n");
#endif
			return(0);
		default:
#ifdef DEBUG
				printf("leaving par_look_ahead; non recognized type\n");
#endif
			return(0);
	}             
#ifdef DEBUG
		printf("leaving par_look_ahead; how did it get here??\n");
#endif
	return(0);

}
 
/*
 *	Function Name:
 *		par_lookup_ambibuous
 *
 *	Description:
 *		this function lookup up the porper bit in the ambiguous_cahr
 *		table for the types specified and the compliments specified
 *		
 *
 *	Arguments:
 *      INPUT   int  cur_type
 *		INPUT   int from_reverse
 *		INPUT   int new_type
 *		INPUT   int to_reverse
 *
 *	Return Value:
 *		short		0 if the combination is not ambiguous
 *                  non zero otherwise
 *
 *	Comments:
 *
 */
short par_lookup_ambiguous(int cur_type,
						   int from_reverse,
						   int new_type,
						   int to_reverse)
{
  char bit_to_check=0x01;
#ifdef DEBUG
  	printf("entering par_lookup_ambiguous\n");
#endif
  if (!from_reverse)
	{
	  bit_to_check<<=2;
	}
  if (!to_reverse)
	{
	  bit_to_check<<=1;
	}   
#ifdef DEBUG
  	printf("leaving par_lookup_ambiguous with %02X\n",ambiguous_char[cur_type][new_type] & bit_to_check);
#endif
  return(ambiguous_char[cur_type][new_type] & bit_to_check);
}
 
/*
 *	Function Name:
 *		par_convert_to_new
 *
 *	Description:
 *		this function converts the bit masks of the chracter types to consecutive integers
 *
 *	Arguments:
 *		INPUT	unsigned short	i		The value to convert
 *
 *	Return Value:
 *		short		The converted value
 *					-1 on error
 *
 *	Comments:
 *
 */
short par_convert_to_new(unsigned short i)
{
	switch(i)
	{
		case DIGIT_CHAR_TYPE:
			return(DIGIT_CHAR_TYPE2);
		case UPPER_CHAR_TYPE:
			return(UPPER_CHAR_TYPE2);
		case LOWER_CHAR_TYPE:
			return(LOWER_CHAR_TYPE2);
		case ANY_ALPHA_CHAR_TYPE:
			return(ANY_ALPHA_CHAR_TYPE2);
		case ANY_CHAR_CHAR_TYPE:
			return(ANY_CHAR_CHAR_TYPE2);
		case WHITE_CHAR_TYPE:
			return(WHITE_CHAR_TYPE2);
		case PUNCT_CHAR_TYPE:
			return(PUNCT_CHAR_TYPE2);
		case NON_ALPHA_CHAR_TYPE:
			return(NON_ALPHA_CHAR_TYPE2);
		case VOWEL_CHAR_TYPE:
			return(VOWEL_CHAR_TYPE2);
		case CONSONANT_CHAR_TYPE:
			return(CONSONANT_CHAR_TYPE2);
		case NUMBER_CHAR_TYPE:
			return(NUMBER_CHAR_TYPE2);
		case CLAUSE_CHAR_TYPE:
			return(CLAUSE_CHAR_TYPE2);
		case ALPHA_NUM_CHAR_TYPE:
			return(ALPHA_NUM_CHAR_TYPE2);
		case VOWEL_NON_Y_TYPE:
			return(VOWEL_NON_Y_TYPE2);
		case SOME_PUNCT_TYPE:
			return(SOME_PUNCT_TYPE2);
		case SET_CHAR_TYPE:
			return(SET_CHAR_TYPE2);
 		case EXACT_CHAR_TYPE:
			return(EXACT_CHAR_TYPE2);
 		case EXACT_CASE_TYPE:
			return(EXACT_CASE_TYPE2);
		case HEXADECIMAL_TYPE:
	 		return(HEXADECIMAL_TYPE2);
		case SAVE_CHAR_TYPE:
	 		return(SAVE_CHAR_TYPE2);
		default:
			return(-1);
	}
}
 
/*
 *	Function Name:
 *		par_copy_word_to_output
 *
 *	Description:
 *      this function copies the next word in the input_array to
 *		the output_array
 *
 *	Arguments:
 *		INPUT	unsigned char 	*input_array	a pointer to the input_array
 *		OUTPUT	unsigned char	*output_array	a pointer to the output_array
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		int		0 if the copying completed without errors
 *				-1 if the copying ended at the end of the string
 *
 *	Comments:
 *
 */
int par_copy_word_to_output(unsigned char *input_array,
							unsigned char *output_array,
							pindex_data_t input_indexes,
							pindex_data_t output_indexes,
							preturn_value_t ret_value)
{
	int i,ipos,opos;

#ifdef DEBUG
		printf("entering par_copy_word_to_output\n");
#endif
	if ((ret_value==NULL) || (input_array==NULL) || (output_array==NULL))
	{
#ifdef DEBUG
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
#ifdef DEBUG
			printf("output_array[%d]=%c ",opos+i,output_array[opos+i]);
#endif
		i++;
	}
	ret_value->input_offset+=i;
	ret_value->output_offset+=i;
	if (input_array[ipos+i]=='\0')
	{
#ifdef DEBUG
			printf("leaving par_copy_word_to_output b -1\n");
#endif
		return(-1);
	}
#ifdef DEBUG
		printf("leaving par_copy_word_to_output b \n");
#endif
	return(0);
}
 
/*
 *	Function Name:
 *		par_skip_states
 *
 *	Description:       
 *		this function skips an action state
 *
 *	Arguments:
 *		INPUT	char 			*rule			The current rule
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *		INPUT	short			state			The current action state
 *		INPUT	char			end				The ending charcter fo the state
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *		This function was adapted from par_comp.c -- the parser compiler
 *
 */
void par_skip_states(char *rule,preturn_value_t ret_value,short state,char end)
{
	short new_num,new_char,new_state;
	short new_len;
	
#ifdef DEBUG
	printf("entering par_skip_states\n");
#endif
	if (state==NULL_STATE)
	{
		end='\0';
	}
	if (state==SAVE_STATE)
	{
		(ret_value->rule)++;	/* skip the $ */
		if ((rule[(ret_value->rule)]<'0') || (rule[(ret_value->rule)]>'9'))
		{
			par_print_rule_error("invalid save state found in rule",rule,(ret_value->rule));
			ret_value->value=FATAL_FAIL;
#ifdef DEBUG
				printf("leaving par_skip_states\n");
#endif
			return;
		}
		end=')';
		(ret_value->rule)+=2; /* skip the digit and the comma */
	}       
	if (state==DICTIONARY_STATE)
	{
		new_num=par_convert_number_new(rule+(ret_value->rule),&new_len);
		(ret_value->rule)+=new_len;
		(ret_value->rule)++; /* skip the comma */
	}	
	if (state==MACRO_STATE)
	{
		if (rule[(ret_value->rule)]!=RULE_NUMBER_DELIM)
		{
			par_print_rule_error("no rule delimiter found in a macro state",rule,(ret_value->rule));
			ret_value->value=FATAL_FAIL;
#ifdef DEBUG
				printf("leaving par_skip_states\n");
#endif
			return;
		}
		(ret_value->rule)++;/* skip the R */
		new_num=par_convert_number_new(rule+(ret_value->rule),&new_len);
		(ret_value->rule)+=new_len;
		/* place the new number into the rule at position index */
	}
	else
	{
		while (rule[(ret_value->rule)]!=end)
		{
			if ((new_char=par_get_char_type(rule[(ret_value->rule)]))!=NULL_TYPE)
			{
				if (new_char==NO_LOOKAHEAD)
				{
					ret_value->rule++;
					new_char=par_get_char_type(rule[(ret_value->rule)]);
				}
				par_skip_string(rule,ret_value,new_char);
			}
			else
			{
				if ((new_state=par_get_state(rule[(ret_value->rule)]))!=NULL_STATE)
				{
					(ret_value->rule)++;/* skip the state delimiter */
					if (new_state!=SAVE_STATE)
					{
						if (rule[(ret_value->rule)]!=STATE_PART_DELIM)
						{
							par_print_rule_error("no state delimiter found in rule",rule,(ret_value->rule));
							ret_value->value=FATAL_FAIL;
#ifdef DEBUG
								printf("leaving par_skip_states\n");
#endif
							return;
						}
						(ret_value->rule)++;	/* skip the shash */
					}
					par_skip_states(rule,ret_value,new_state,'/');
				}
				else
				{
					par_print_rule_error("par_skip_states;no action state or character type found in rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
#ifdef DEBUG
						printf("leaving par_skip_states\n");
#endif
					return;
				}
			}
			if (ret_value->value==FATAL_FAIL)
			{
#ifdef DEBUG
					printf("leaving par_skip_states syntax error in the rule\n");
#endif
				return;
			}
		}
	}
	if (rule[(ret_value->rule)]!=end)
	{
		par_print_rule_error("end of state slash not found in rule",rule,(ret_value->rule));
		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
			printf("leaving par_skip_states\n");
#endif
		return;
	}
	if (state!=NULL_STATE)
		(ret_value->rule)++;
	par_skip_action(rule,ret_value,state);
#ifdef DEBUG
		printf("leaving par_skip_states, action dome \n");
#endif
}
 
/*
 *	Function Name:
 *		par_skip_action
 *
 *	Description:       
 *		this function skips the action part of the state
 *
 *	Arguments:
 *		INPUT	char 			*rule			The current rule
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *		INPUT	short			state			The current action state 
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *		This function was adapted from par_comp.c -- the parser compiler
 *
 */
void par_skip_action(char *rule,preturn_value_t ret_value,short state)
{
#ifdef DEBUG
	printf("entering par_skip_action\n");
#endif
	switch(state)
	{
		case	COPY_STATE:
		case	DELETE_STATE:
		case	OPTIONAL_STATE:
		case    MACRO_STATE: 
		case	SAVE_STATE:
			break;
		case	REPLACE_STATE:
		case	INSERT_STATE:
		case	INSERT_AFTER_STATE:
		case	INSERT_BEFORE_STATE:
		/* GL 02/08/1997 add STATUS_STATE */
		case	STATUS_STATE:
			while (rule[(ret_value->rule)]!='/')
			{
				if (rule[(ret_value->rule)]=='|')
					(ret_value->rule)++;
				par_skip_string(rule,ret_value,par_get_char_type(rule[(ret_value->rule)]));
				if (rule[(ret_value->rule)]=='|')
					(ret_value->rule)++;
			}
			(ret_value->rule)++;
			break;
		case DICTIONARY_STATE:
			if (memcmp(rule+(ret_value->rule),"FAIL",4)==0)
			{
				(ret_value->rule)+=5;
			}
			else
			{
				par_skip_states(rule,ret_value,COPY_STATE,'|');
				if (rule[(ret_value->rule)]=='\0')
				{
					par_print_rule_error("unexpected end of rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
					return;
				}
			}
			if (memcmp(rule+(ret_value->rule),"FAIL",4)==0)
			{
				(ret_value->rule)+=5;
			}
			else
			{
				par_skip_states(rule,ret_value,COPY_STATE,'/');
				if (rule[(ret_value->rule)]=='\0')
				{
					par_print_rule_error("unexpected end of rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
#ifdef DEBUG
						printf("leaving par_skip_action FAIL\n");
#endif
					return;
				}
			}
			break;
		default:
			break;
	}                     
#ifdef DEBUG
		printf("leaving par_skip_action normal\n");
#endif	
}            
 
/*
 *	Function Name:
 *		par_skip_string
 *
 *	Description:       
 *		this function skips a string matching type
 *
 *	Arguments:
 *		INPUT	char 			*rule			The current rule
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *		INPUT	short			char_type		The current character type
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *		This function was adapted from par_comp.c -- the parser compiler
 *
 */
void par_skip_string(char *rule,preturn_value_t ret_value,short char_type)
{
#ifdef DEBUG
	printf("entering par_skip_string\n");
#endif
	switch(char_type)
	{
		case	EXACT_CHAR_TYPE:
			(ret_value->rule)++;
			while (rule[(ret_value->rule)]!=EXACT_CHAR_DELIM)
			{
				if (rule[(ret_value->rule)]==ESCAPE_DELIM)
				{
					(ret_value->rule)++;
				}
				(ret_value->rule)++;
			}
			(ret_value->rule)++;
			break;
		case	EXACT_CASE_TYPE:
			(ret_value->rule)++;
			while (rule[(ret_value->rule)]!=EXACT_CASE_DELIM)
			{
				if (rule[(ret_value->rule)]==ESCAPE_DELIM)
				{
					(ret_value->rule)++;
				}
				(ret_value->rule)++;
			}
			(ret_value->rule)++;
			break;
		case	HEXADECIMAL_TYPE:
			if (par_convert_hex_number(rule+(ret_value->rule),2)<0)
			{
				par_print_rule_error("error in hexadecimal type in rule",rule,(ret_value->rule));
				ret_value->value=FATAL_FAIL;
				return;
			}
			(ret_value->rule)+=4;
			break;
		case	SAVE_CHAR_TYPE:
			(ret_value->rule)++;
			if (rule[(ret_value->rule)]<'0' || rule[(ret_value->rule)]>'9')
			{
				par_print_rule_error("invalid save state found in rule",rule,(ret_value->rule));
				ret_value->value=FATAL_FAIL;
				return;
			}
			(ret_value->rule)++;
			break;
		case	SET_CHAR_TYPE:
			par_skip_set(rule,ret_value);
			break;
		case	DIGIT_CHAR_TYPE:
			if ((rule[(ret_value->rule)+1]=='[') || (rule[(ret_value->rule)+2]=='['))
			{
				par_skip_digit(rule,ret_value);
				break;
			}              
		case	UPPER_CHAR_TYPE:
        case	ANY_ALPHA_CHAR_TYPE:
        case	ANY_CHAR_CHAR_TYPE:
        case	WHITE_CHAR_TYPE:
        case	PUNCT_CHAR_TYPE:
        case	LOWER_CHAR_TYPE:
        case	NON_ALPHA_CHAR_TYPE:
        case	VOWEL_CHAR_TYPE:
        case	CONSONANT_CHAR_TYPE:
		case	NUMBER_CHAR_TYPE:
		case	CLAUSE_CHAR_TYPE:
        case	ALPHA_NUM_CHAR_TYPE:
        case	VOWEL_NON_Y_TYPE:
        case	SOME_PUNCT_TYPE:
			par_skip_standard(rule,ret_value);
			break;
		default:
			par_print_rule_error("character type specifier not found",rule,(ret_value->rule));
			ret_value->value=FATAL_FAIL;
			return;
	}
#ifdef DEBUG
	printf("leaving par_skiip_string\n");
#endif
}
 
/*                                                                        
 *	Function Name:
 *		par_skip_standard
 *
 *	Description:         
 *		this function skips a standard string match
 *
 *	Arguments:
 *		INPUT	char 			*rule			The current rule
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *		This function was adapted from par_comp.c -- the parser compiler
 *
 */
void par_skip_standard(char *rule,preturn_value_t ret_value)
{
	short length;
	(ret_value->rule)++;
	if (rule[(ret_value->rule)]==NO_LOOKAHEAD)
	{
		(ret_value->rule)++;
	}
	if (rule[(ret_value->rule)]=='~')
	{
		(ret_value->rule)++;
	}
	if (rule[(ret_value->rule)]!='<')
	{
		par_print_rule_error("no < found at the beginning of the character type in rule",rule,(ret_value->rule));
		ret_value->value=FATAL_FAIL;
		return;
	}           
	(ret_value->rule)++;
	while (rule[(ret_value->rule)]!='>')
	{
		switch(rule[(ret_value->rule)])
		{
			case '*':
				(ret_value->rule)++;
				if (rule[(ret_value->rule)]!='>')
				{
					par_print_rule_error("> not found after * in rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
					return;
				}
				break;
			case '+':
				(ret_value->rule)++;
				if (rule[(ret_value->rule)]!='>')
				{
					par_print_rule_error("> not found after + in rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
					return;
				}
				break;                         
			default:      
				par_convert_number_new(rule+(ret_value->rule),&length);
				(ret_value->rule)+=length;
				switch(rule[(ret_value->rule)])
				{
					case ',':
						(ret_value->rule)++;
						break;
					case '>':
						break;
					case '-':
						switch (rule[(ret_value->rule)])
						{
							case '*':
							case '+':
								(ret_value->rule)++;
								if (rule[(ret_value->rule)]!='>')
								{
									par_print_rule_error("> not found after * or + in rule",rule,(ret_value->rule)); 
									ret_value->value=FATAL_FAIL;
									return;
								}
								break;
							default:
								(ret_value->rule)++; /* skip the - */ 
								par_convert_number_new(rule+(ret_value->rule),&length);
								(ret_value->rule)+=length;
								if (rule[(ret_value->rule)]!='>' && rule[(ret_value->rule)]!=',')
								{
									par_print_rule_error("expected > or , after range in rule",rule,(ret_value->rule));
									ret_value->value=FATAL_FAIL;
									return;
								}
						}
						break;
					default:
						par_print_rule_error("error in rule syntax in rule",rule,(ret_value->rule));
						ret_value->value=FATAL_FAIL;
						return;
				}               
		}
	}
	(ret_value->rule)++;
}
 
/*
 *	Function Name:
 *		par_skip_digit
 *
 *	Description:      
 *		this function skips a digit specifier type 
 *
 *	Arguments:
 *		INPUT	char 			*rule			The current rule
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *		This function was adapted from par_comp.c -- the parser compiler
 *
 */
void par_skip_digit(char *rule,preturn_value_t ret_value)
{
	short length;
	(ret_value->rule)++;
	if (rule[(ret_value->rule)]=='x')
	{
		ret_value->rule++;
	}
	if (rule[(ret_value->rule)]!='[')
	{
		par_print_rule_error("no [ found at the beginning of the character type in rule",rule,ret_value->rule);
		ret_value->value=FATAL_FAIL;
		return;
	}           
	(ret_value->rule)++;
	while (rule[(ret_value->rule)]!=']')
	{
		switch(rule[(ret_value->rule)])
		{
			case '*':
				(ret_value->rule)++;
				if (rule[(ret_value->rule)]!=']')
				{
					par_print_rule_error("] not found after * in rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
					return;
				}
				break;
			case '+':
				(ret_value->rule)++;
				if (rule[(ret_value->rule)]!=']')
				{
					par_print_rule_error("] not found after + in rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
					return;
				}
				break;                         
			default:
				par_convert_number_new(rule+(ret_value->rule),&length);
				(ret_value->rule)+=length;
				switch(rule[(ret_value->rule)])
				{
					case ',':
						(ret_value->rule)++;
						break;
					case ']':
						break;
					case '-':
						switch (rule[(ret_value->rule)])
						{
							case '*':
							case '+':
								(ret_value->rule)++;
								if (rule[(ret_value->rule)]!=']')
								{
									par_print_rule_error("] not found after * or + in rule",rule,(ret_value->rule)); 
									ret_value->value=FATAL_FAIL;
									return;
								}
								break;
							default:
								(ret_value->rule)++; /* skip the - */
								par_convert_number_new(rule+(ret_value->rule),&length);
								(ret_value->rule)+=length;
								if (rule[(ret_value->rule)]!=']' && rule[(ret_value->rule)]!=',')
								{
									par_print_rule_error("expected ] or , after range in rule",rule,(ret_value->rule));
									ret_value->value=FATAL_FAIL;
									return;
								}
						}
						break;
					default:
						par_print_rule_error("error in rule syntax in rule",rule,(ret_value->rule));
						ret_value->value=FATAL_FAIL;
						return;
				}               
		}
	}
	(ret_value->rule)++;
}
 
/*
 *	Function Name:
 *		par_skip_set
 *
 *	Description:    
 *		this function skips a set type
 *
 *	Arguments:
 *		INPUT	char 			*rule			The current rule
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *
 *	Return Value:
 *		void
 *
 *	Comments:
 *		This function was adapted from par_comp.c -- the parser compiler
 *
 */
void par_skip_set(char *rule,preturn_value_t ret_value)
{
	short length;
	(ret_value->rule)++;
	if (rule[(ret_value->rule)]!='{')
	{
		par_print_rule_error("no { found at the beginning of the set in rule",rule,(ret_value->rule));
		ret_value->value=FATAL_FAIL;
		return;
	}   
	(ret_value->rule)++;                
	while (rule[(ret_value->rule)]!='}')
	{
		while ((rule[(ret_value->rule)]!=',') && (rule[(ret_value->rule)]!='}'))
		{
			par_skip_string(rule,ret_value,par_get_char_type(rule[(ret_value->rule)]));
		}
		if (rule[(ret_value->rule)]!='}')
			(ret_value->rule)++;
	}
	(ret_value->rule)++;					
	if (rule[(ret_value->rule)]!='<')
	{
		par_print_rule_error("no < found at the beginning of the character type in rule",rule,ret_value->rule);
		ret_value->value=FATAL_FAIL;
		return;
	}           
	(ret_value->rule)++;
	while (rule[(ret_value->rule)]!='>')
	{
		switch(rule[(ret_value->rule)])
		{
			case '*':
				(ret_value->rule)++;
				if (rule[(ret_value->rule)]!='>')
				{
					par_print_rule_error("> not found after * in rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
					return;
				}
				break;
			case '+':
				(ret_value->rule)++;
				if (rule[(ret_value->rule)]!='>')
				{
					par_print_rule_error("> not found after + in rule",rule,(ret_value->rule));
					ret_value->value=FATAL_FAIL;
					return;
				}
				break;                         
			default:
				par_convert_number_new(rule+(ret_value->rule),&length);
				(ret_value->rule)+=length;
				switch(rule[(ret_value->rule)])
				{
					case ',':
						(ret_value->rule)++;
						break;
					case '>':
						break;
					case '-':
						switch (rule[(ret_value->rule)])
						{
							case '*':
							case '+':
								(ret_value->rule)++;
								if (rule[(ret_value->rule)]!='>')
								{
									par_print_rule_error("> not found after * or + in rule",rule,(ret_value->rule)); 
									ret_value->value=FATAL_FAIL;
									return;
								}
								break;
							default:
								(ret_value->rule)++;
								par_convert_number_new(rule+(ret_value->rule),&length);
								(ret_value->rule)+=length;
								if (rule[(ret_value->rule)]!='>' && rule[(ret_value->rule)]!=',')
								{
									par_print_rule_error("expected > or , after range in rule",rule,(ret_value->rule));
									ret_value->value=FATAL_FAIL;
									return;
								}
						}
						break;
					default:
						par_print_rule_error("error in rule syntax in rule",rule,(ret_value->rule));
						ret_value->value=FATAL_FAIL;
						return;
				}               
		}
	}
	(ret_value->rule)++;
}
 
/*
 *	Function Name:
 *		par_skip_white_space
 *
 *	Description:
 *		this function skips the whitespace in the input and only copies the
 *		first whitespace character it encounters to the output
 *
 *	Arguments:
 *		INPUT	unsigned char 	*input_array	a pointer to the input_array
 *		OUTPUT	unsigned char	*output_array	a pointer to the output_array
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
 */
int par_skip_white_space(unsigned char *input_array,
						 pindex_data_t input_indexes,
						 unsigned char *output_array,  
						 pindex_data_t output_indexes,
						 preturn_value_t ret_value)
{
	int i,ipos,opos,j;

#ifdef DEBUG
		printf("entering par_skip_white_space\n");
#endif
	if ((ret_value==NULL) || (input_array==NULL) || (output_array==NULL))
	{
#ifdef DEBUG
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
#ifdef DEBUG
			printf("leaving par_skip_white_space b -1\n");
#endif
		return(-1);
	}
#ifdef DEBUG
		printf("leaving par_skip_white_space b 0\n");
#endif
	return(0);
}
 
/*
 *	Function Name:
 *		par_print_rule_error
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
 */
void par_print_rule_error(char *message,
						  unsigned char *current_rule,
						  int pos)
{
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
}
 
/*
 *	Function Name:
 *		copy_return_value
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
 */
void par_copy_return_value(preturn_value_t dest,
						   preturn_value_t src)
{
	memcpy(dest,src,sizeof(return_value_t));
}
 
/*
 *	Function Name:
 *		par_match_standard
 *
 *	Description:
 *		this function matches most of the charcter types
 *		it handles matching of all the types that have the form
 *			A<3> A~<3>
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *      INPUT   int             char_type       The current character type being matched
 *		INPUT	unsigned char 	*input_array	the input array
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *      INPUT   int             lookahead       If this is 1 perform lookahead
 *                                              if this is 0 do not perform lookahead and fail quietly
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
 */
int par_match_standard(unsigned char *current_rule,
					   int char_type,
					   unsigned char *input_array,
					   pmatch_arrays_t match_array,
					   preturn_value_t ret_value,
					   int lookahead,
					   int break_on_min_match)
{
	int rule_p,length=0,ipos;
	int min_range= -1,max_range= -1;
	int match_is_over=0;
	int satisfied_min_cond= -1;
	int end_of_type=0;
	int par_look_ahead_success=0;
	int i=0;          
	int match_non_match=1;         /* 1 is match 0 is non-match */
	int find_type= -2;
	short temp;
		

#ifdef DEBUG
		printf("entering par_match_standard\n");
#endif
	if (ret_value==NULL)
	{
#ifdef DEBUG
			printf("leaving par_match_standard a 0\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
			printf("leaving par_match_standard b 0\n");
#endif
		return(0);
	}
	rule_p=ret_value->rule;
	ipos=ret_value->input_pos+ret_value->input_offset;
        	/* skip past the type delimiter */
	rule_p++;             
	if (current_rule[rule_p]==NO_LOOKAHEAD )
	{
#ifdef DEBUG
			printf("match_standard set no lookahead\n");
#endif
		lookahead=0;
		rule_p++;
	}
	if (current_rule[rule_p]==NON_MATCH_DELIM )
	{
#ifdef DEBUG
			printf("match_standard set to non matches\n");
#endif
		match_non_match=0;
		rule_p++;
	}
    if (current_rule[rule_p]!='<')
	{
    	if (lookahead)
    	{
			par_print_rule_error("par_match_standard;no < found after a character type",current_rule,rule_p);
    	}
    	ret_value->value=FATAL_FAIL;
    	return(0);
    }
    rule_p++;	/* skip the < */
	/* either there is a number or there is a star of a plus */ 
	while ((current_rule[rule_p]!='>') && (end_of_type==0))
	{      
		while ((current_rule[rule_p]!='>') && (match_is_over==0) && (par_look_ahead_success==0) && (end_of_type==0))
		{
			switch(current_rule[rule_p])
			{
				case '*':
					if (min_range== -1)
					{
						min_range=0;
					}
					max_range=INT_MAX;
					rule_p++;
					if (current_rule[rule_p]!='>')
					{		/* once a star is found, there is no point in having any more more in the range */
						if (lookahead)
						{
							par_print_rule_error("par_match_standard;> not found after an astersik",current_rule,rule_p);
						}
						ret_value->value=FATAL_FAIL;
						return(0);
					}        
					end_of_type=2;
					rule_p++;
					break;
				case '+':
					if ((min_range<1))
					{
						min_range=1;
					}
					max_range=INT_MAX;
					rule_p++;
					if (current_rule[rule_p]!='>')
					{		/* once a plus is found, there is no point in having any more more in the range */
						if (lookahead)
						{
							par_print_rule_error("par_match_standard;> not found after a plus",current_rule,rule_p);
						}
						ret_value->value=FATAL_FAIL;
						return(0);
					}   
					end_of_type=2;
					rule_p++;
					break;         
				default:
					min_range=par_convert_number_new(current_rule+rule_p,&temp);
					rule_p+=temp; 
					switch (current_rule[rule_p])
					{
						case ',':
							max_range=min_range;
							rule_p++;
							break;
						case '>':
							max_range=min_range;
							end_of_type=2;
							rule_p++;
							break;                
						case '-':
							rule_p++;
							switch (current_rule[rule_p])
							{
								case '+':
								case '*':
									max_range=INT_MAX;
									rule_p++;
									if (current_rule[rule_p]!='>')
									{		/* once a star is found, there is no point in having any more more in the range */
										if (lookahead)
										{
											par_print_rule_error("par_match_standard;> not found after an asterisk or a plus",current_rule,rule_p);
										}
										ret_value->value=FATAL_FAIL;
										return(0);
									}        
									break;                      
								default:
									max_range=par_convert_number_new(current_rule+rule_p,&temp);		
									rule_p+=temp;
									if ((current_rule[rule_p]!='>') && (current_rule[rule_p]!=','))
									{
										if (lookahead)
										{
											par_print_rule_error("par_match_standard;expected a , or a > after a range",current_rule,rule_p);
										}
										ret_value->value=FATAL_FAIL;
										return(0);
									}
							}
							if (current_rule[rule_p]=='>')
							{
								end_of_type=2;
							}
							rule_p++;									
							break;
						default:
							if (lookahead)
							{
								par_print_rule_error("par_match_standard;error in rule syntax",current_rule,rule_p);
							}
							ret_value->value=FATAL_FAIL;
							return(0);
					}
					if (max_range<min_range)
					{
						max_range=min_range;
					}
					break;
			}		/* end switch(current_rule[rule_p]) */
			/* do the character matching starting at length until min_length */
			/* then match from min_length to max_length */
			/* once min_length is reached, do lookahead for the next char type if necessary */
			if (ret_value->optional!= -1)
			{
				if (min_range==0)
				{
					/* signal that there could be success on a zero length string */
					/* or the end of string could be successful too */
					satisfied_min_cond= -2;                          
					if (length==0)
					{
						if (lookahead)
						{
							if ((par_look_ahead(current_rule,input_array,ipos,rule_p,char_type,match_non_match,&find_type,match_array,ret_value)==1))
							{
								par_look_ahead_success=1;
							}
						}
					}
				}
				for (i=length;i<max_range && par_look_ahead_success!=1;i++)
				{
					if ((((parser_char_types[input_array[ipos+i]] & char_type)==0) && match_non_match==1) ||
						(((parser_char_types[input_array[ipos+i]] & char_type)!=0) && match_non_match==0) || 
						(input_array[ipos+i]=='\0'))
					{   
						/* the matching failed in the section between the last range and the current range */
						/* return length as the number of character matched */
						match_is_over=1;
						break;
					}              
					if ((i+1)>=min_range)
					{
						satisfied_min_cond=length=i+1;
					    if (break_on_min_match==1)
						{
							match_is_over=1;
							break;
						}					    
						if ((lookahead) && ((end_of_type==0) || ((end_of_type==2) && ((i+1)<max_range))))
						{
							if (par_look_ahead(current_rule,input_array,ipos+i+1,rule_p,char_type,match_non_match,&find_type,match_array,ret_value)==1)
							{
								par_look_ahead_success=1;
								break;
							}
						}
					}
				}
			} /* if (ret_value->optional!= -1) */
		}
#ifdef DEBUG
			printf("par_match_standard;rule_p=%d\n",rule_p);
#endif
		if (end_of_type!=2)
			rule_p++;	
	}	/* while loop inner */
    /* look for the next format type specifier */
    /* look up in the table of ambiguity to know whether or not to do the lookahead parsing */
    /* start mathcing the string */
    /* once the minimum requirement for the type is met, start checking for the next type if required */
    /* end the matching once the lookahead is successful or the current match hits the maximum 
       number of characters */                
   	if (current_rule[rule_p]=='>')
   	{
   		rule_p++;
   	}
	if (satisfied_min_cond== -1)
   	{                                               
   		if (ret_value->optional==1 || ret_value->optional== -1)
		{
#ifdef DEBUG
				printf("par_match_standard; optional set to -1\n");
#endif
			ret_value->optional= -1;
		}
	   	ret_value->value=FAIL;
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
			  {
				if (ret_value->optional==1 || ret_value->optional== -1)
				  {
					ret_value->optional= -1;
					ret_value->value=FAIL;
				  }
				else
				  {
					length= -1;
				  }
			  }
		}                                        
	}
	ret_value->rule=rule_p;
#ifdef DEBUG
		printf("leaving par_match_standard length=%d ret_value->value=%d\n",length,ret_value->value);
#endif
	return(length);
}
 
/*
 *	Function Name:
 *		par_match_digits
 *
 *	Description:
 *		this function matches the digit charaacter types of the form
 *		D[4-20]
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		INPUT	unsigned char 	*input_array	the input array
 *		I/O		pmatch_arrays_t match_array		the array of temporary arrays for shuffle
 *		I/O		preturn_value_t ret_value		the return value which controls and signals starting and
 * 												ending points of the matching, and exit conditions
 *      INPUT   int             lookahead       If this is 1 perform lookahead
 *                                              if this is 0 do not perform lookahead and fail quietly
 *		INPUT	prange_value_t	range_value		The structure that passes information about
 * 												conditional replacements
 *      INPUT   int             break_on_min_match  if 1 stop processing the type on the minimum 
 *                                                  matched string
 *
 *	Return Value:
 *      int     the length of the string matched
 *              -1 if the end of the string was reached
 *
 *	Comments:
 *
 */
int par_match_digits(unsigned char *current_rule,
					 unsigned char *input_array,
					 pmatch_arrays_t match_array,
					 preturn_value_t ret_value,
					 prange_value_t range_value,
					 int lookahead,
					 int break_on_min_match)
{
	int rule_p;							/* a temproary rule pointer */
	int	length=0;						/* the length of the matched characters */
	int	ipos;							/* the input_pos+input_offset from ret_value */
	int min_range= -1;					/* the minimum value of the current range */
	int	max_range= -1;					/* the maximum value of the range */
	int	match_is_over=0;				/* a flag to signal that the matching has failed */
	int	satisfied_min_cond= -1;			/* holds the value of the largest number that
										   is still in the range found so far */
	int	satisfied_start= -1;				/* holds the starting value of the number in satisfied_min_cond */
	int temp_num=0;						/* a temporary variable to hold the current number being processes */
	int end_of_type=0;					/* flag that signals the end of the type specifier has been reached in the rule */
	int par_look_ahead_success=0;			/* a flag that signals if par_look_ahead() has succeeded */
	int i=0;								/* just a loop variable */
	int find_type= -2;						/* the type that par_look_ahead found */
	short temp;
		
	
#ifdef DEBUG
		printf("entering par_match_digits\n");
#endif                      
	if (ret_value==NULL)
	{
#ifdef DEBUG
			printf("leaving par_match_digits a 0\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL) ||
		(range_value==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
			printf("leaving par_match_digits b 0\n");
#endif
		return(0);
	}
	rule_p=ret_value->rule;
	ipos=ret_value->input_pos+ret_value->input_offset;
   	/* skip past the type delimiter */
    rule_p++;                                      
	if (current_rule[rule_p]==NO_LOOKAHEAD )
	{
#ifdef DEBUG
			printf("match_digits set no lookahead\n");
#endif
		lookahead=0;
		rule_p++;
	}
	if (current_rule[rule_p]!='[')
    {
    	if (lookahead)
		{
    		par_print_rule_error("par_match_digits;no [ found after a character type",current_rule,rule_p);
    	}
		ret_value->value=FATAL_FAIL;
    	return(0);
    }
    rule_p++;	/* skip the [ */                                
	/* either there is a number or there is a star of a plus */ 
	while ((current_rule[rule_p]!=']') && (end_of_type==0))
	{      
		while ((current_rule[rule_p]!=']') && (match_is_over==0) && (par_look_ahead_success==0) && (end_of_type==0))
		{
			switch(current_rule[rule_p])
			{
				default:
					min_range=par_convert_number_new(current_rule+rule_p,&temp);
					rule_p+=temp;  
					switch (current_rule[rule_p])
					{
						case ',':
							max_range=min_range;
							rule_p++;
							break;
						case ']':
							max_range=min_range;
							end_of_type=2;
							rule_p++;
							break;                
						case '-':
							rule_p++;
							switch (current_rule[rule_p])
							{
								case '+':
								case '*':
									max_range=INT_MAX;
									rule_p++;
									if (current_rule[rule_p]!=']')
									{		/* once a star is found, there is no point in having any more more in the range */
										if (lookahead)
										{
											par_print_rule_error("par_match_digits;] not found after an asterisk or a plus",current_rule,rule_p);
										}
										ret_value->value=FATAL_FAIL;
										return(0);
									}
									break;                      
								default:										
									max_range=par_convert_number_new(current_rule+rule_p,&temp);
									rule_p+=temp;
									if ((current_rule[rule_p]!=']') && (current_rule[rule_p]!=','))
									{
										if (lookahead)
										{
											par_print_rule_error("par_match_digits;expected a , or a ] after a range",current_rule,rule_p);
										}
										ret_value->value=FATAL_FAIL;
										return(0);
									}
							}
							if (current_rule[rule_p]==']')
							{
								end_of_type=2;
							}
							rule_p++;
							break;
						default:
							if (lookahead)
							{
								par_print_rule_error("par_match_digits;error in rule syntax",current_rule,rule_p);
							}
							ret_value->value=FATAL_FAIL;
							return(0);
					}
					if (max_range<min_range)
					{
						max_range=min_range;
					}
					break;
			}
			/* do the character matching starting at length until min_length */
			/* then match from min_length to max_length */
			/* once min_length is reached, do lookahead for the next char type if necessary */
			if (ret_value->optional!= -1)                
			{
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
						range_value->start+=(min_range-range_value->end);
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
				for (i=0;(((parser_char_types[input_array[ipos+i]] & DIGIT_CHAR_TYPE)!=0) &&
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
						length=i+1;
						satisfied_min_cond=temp_num;
						satisfied_start=range_value->start;
					    if (break_on_min_match==1)
						{
							match_is_over=1;
							break;
						}
						if ((lookahead) && ((end_of_type==0) || ((end_of_type==2) && ((i+1)<max_range))))
						{
							if (par_look_ahead(current_rule,input_array,ipos+i+1,rule_p,DIGIT_CHAR_TYPE,1,&find_type,match_array,ret_value)==1)
							{
								par_look_ahead_success=1;
								break;
							}
						}
					}
				}
				if ((temp_num>range_value->end) && (end_of_type==2))
				{
					match_is_over=1;
				}
			} /* if (ret_value->optional!= -1) */
		}                              
#ifdef DIGIT_DEBUG
			printf("take 2 length=%d match_is_over=%d satisfied_min_cond=%d\n",length,match_is_over,satisfied_min_cond);
			printf("take 2 min_range=%d max_range=%d\n",min_range,max_range);
#endif
#ifdef DEBUG
			printf("par_match_digits;rule_p=%d\n",rule_p);
#endif
		if (end_of_type!=2)	/* get to the end of the specifier no matter what happens in the matching */
			rule_p++;	
	}	/* while loop inner */
   	/* make sure the rule pointer is at the character after this type specifier */
   	if (current_rule[rule_p]==']')	
	{
   		rule_p++;
   	}                                                                            
	/* if satisfied_min_cond was not changed, there was no successful matching */
   	if (satisfied_min_cond== -1)
   	{
   		if (ret_value->optional==1)
   		{
#ifdef DEBUG
				printf("par_match_digits; optional set to -1\n");
#endif
			ret_value->optional= -1;
		}
   		ret_value->value=FAIL;
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
	      {
		if (ret_value->optional==1 || ret_value->optional== -1)
		  {
		    ret_value->optional= -1;
		    ret_value->value=FAIL;
		  }
		else
		  {
		    length= -1;
		  }
	      }
	  }                                        
	ret_value->rule=rule_p; 
#ifdef DIGIT_DEBUG    
		par_print_rule_error("par_match_digits;testing the rule_p index",current_rule,rule_p);
#endif
#ifdef DEBUG
		printf("leaving par_match_digits length=%d\n",length);
#else
#ifdef DIGIT_DEBUG
			printf("leaving par_match_digits length=%d ret_value->value=%d\n",length,ret_value->value);
#endif
#endif
   	return(length);
}
 
/*
 *	Function Name:
 *		par_match_sets_with_ranges
 *
 *	Description:
 *		this function matches sets that have numbers of occurrances
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
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
 *				-2 if the string had no matching length but was a successful match
 *
 *	Comments:
 *
 */
int par_match_sets_with_ranges(unsigned char *current_rule,
							   unsigned char *input_array,
							   pmatch_arrays_t match_array,
							   preturn_value_t ret_value,
							   prange_value_t range_value,
							   int lookahead,
							   int break_on_min_match)
{
	int rule_p,save_p,times=0,length=0,ipos,total_length=0;
	int min_range= -1,max_range= -1;
	int match_is_over=0;                              
	int satisfied_min_cond= -1;
	int end_of_type=0;
	int par_look_ahead_success=0;
	int i=0;
	short temp;
/* int find_type= -2; */ /* uncomment when look_ahead is implimented from sets */
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,0 }; 
		
	
#ifdef DEBUG
		printf("entering par_match_sets_and_ranges\n");
#endif
	if (ret_value==NULL)
	{
#ifdef DEBUG
			printf("leaving par_match_sets_and_ranges a 0\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
			printf("leaving par_match_sets_and_ranges b 0\n");
#endif
		return(0);
	}
	rule_p=ret_value->rule;
	ipos=ret_value->input_pos+ret_value->input_offset;

        	/* skip past the type delimiter */

	rule_p++;
    /* save the position of the { */                   
	save_p=rule_p;
	new_ret.input_pos=ret_value->input_pos+ret_value->input_offset;	
	new_ret.input_offset=0;
	new_ret.output_pos=ret_value->output_pos+ret_value->output_offset;
	new_ret.output_offset=0;
	new_ret.value=SUCCESS;
	new_ret.state=ret_value->state;
	new_ret.prev=ret_value->prev;
	
	new_ret.rule=save_p+1; /* this is for skip_states */
    while ((current_rule[new_ret.rule]!='}') && (current_rule[new_ret.rule]!='\0'))
    {
    	while ((current_rule[new_ret.rule]!=',') && (current_rule[new_ret.rule]!='}') && (current_rule[new_ret.rule]!='\0'))
    	{
    		par_skip_string(current_rule,&new_ret,par_get_char_type(current_rule[new_ret.rule]));
    	}
    	if (current_rule[new_ret.rule]!='}')
    	{
    		new_ret.rule++;
    	}
	}
    rule_p=new_ret.rule+1;	/* skip the '}' */
    new_ret.rule=save_p;
    /* search for the < and set rule_p to that value */
    if (current_rule[rule_p]!='<')
    {
    	if (lookahead)
    	{
    		par_print_rule_error("par_match_sets_and_ranges;no < found after a character type",current_rule,rule_p);
    	}
    	ret_value->value=FATAL_FAIL;
    	return(0);
    }
    rule_p++;	/* skip the < */
	/* either there is a number or there is a star of a plus */
	while ((current_rule[rule_p]!='>') && (end_of_type==0))
	{      
		while ((current_rule[rule_p]!='>') && (match_is_over==0) && (par_look_ahead_success==0) && (end_of_type==0))
		{
			switch(current_rule[rule_p])
			{
				case '*':
					if (min_range== -1)
					{
						min_range=0;
					}
					max_range=INT_MAX;
					rule_p++;
					if (current_rule[rule_p]!='>')
					{		/* once a star is found, there is no point in having any more more in the range */
						if (lookahead)
						{
							par_print_rule_error("par_match_sets_and_ranges;> not found after an astersik",current_rule,rule_p);
						}
						ret_value->value=FATAL_FAIL;
						return(0);
					}
					end_of_type=2;
					rule_p++;
					break;
				case '+':
					if ((min_range<1))
					{
						min_range=1;
					}
					max_range=INT_MAX;
					rule_p++;
					if (current_rule[rule_p]!='>')
					{		/* once a plus is found, there is no point in having any more more in the range */
						if (lookahead)
						{
							par_print_rule_error("par_match_sets_and_ranges;> not found after a plus",current_rule,rule_p);
						}
						ret_value->value=FATAL_FAIL;
						return(0);
					}   
					end_of_type=2;
					rule_p++;
					break;
				default:
					min_range=par_convert_number_new(current_rule+rule_p,&temp);
					rule_p+=temp;
					switch (current_rule[rule_p])
					{
						case ',':
							max_range=min_range;
							rule_p++;
							break;
						case '>':
							max_range=min_range;
							end_of_type=2;
							rule_p++;
							break;                
						case '-':
							rule_p++;
							switch (current_rule[rule_p])
							{
								case '+':
								case '*':
									max_range=INT_MAX;
									rule_p++;
									if (current_rule[rule_p]!='>')
									{		/* once a star is found, there is no point in having any more more in the range */
										if (lookahead)
										{
											par_print_rule_error("par_match_sets_and_ranges;> not found after an asterisk or a plus",current_rule,rule_p);
										}
										ret_value->value=FATAL_FAIL;
										return(0);
									}        
									break;                      
								default:										
									max_range=par_convert_number_new(current_rule+rule_p,&temp);
									rule_p+=temp;
									if ((current_rule[rule_p]!='>') && (current_rule[rule_p]!=','))
									{
										if (lookahead)
										{
											par_print_rule_error("par_match_sets_and_ranges;expected a , or a > after a range",current_rule,rule_p);
										}
										ret_value->value=FATAL_FAIL;
										return(0);
									}
							}
							if (current_rule[rule_p]=='>')
							{
								end_of_type=2;
							}
							rule_p++;
							break;
						default:
							if (lookahead)
							{
								par_print_rule_error("par_match_sets_and_ranges;error in rule syntax",current_rule,rule_p);
							}
							ret_value->value=FATAL_FAIL;
							return(0);
					}
					if (max_range<min_range)
					{
						max_range=min_range;
					}
					break;
			}		/* end switch(current_rule[rule_p]) */
			/* do the character matching starting at length until min_length */
			/* then match from min_length to max_length */
			/* once min_length is reached, do lookahead for the next char type if necessary */
			if (ret_value->optional!= -1)
			{
				if (min_range==0)
				{
					/* signal that there could be success on a zero length string */
					/* or the end of string could be successful too */
				    satisfied_min_cond= -2;
				    if (break_on_min_match==1)
					{
						match_is_over=1;
						break;
					}
				}
				for (i=times;i<max_range;i++)
				{
					/* place the call to par_match_set here */
					/* return the length of the thing matched */
					length=par_match_set(current_rule,input_array,save_p,rule_p,ipos,match_array,range_value,&new_ret,lookahead);
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
#ifdef DEBUG
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
						  }
					  }

				}
			} /* if (ret_value->optional!= -1) */
		}                              
#ifdef DEBUG
			printf("par_match_sets_and_ranges;rule_p=%d\n",rule_p);
#endif
		if (end_of_type!=2)
			rule_p++;	
	}	/* while loop inner */
    /* look for the next format type specifier */
    /* look up in the table of ambiguity to know whether or not to do the lookahead parsing */
    /* start mathcing the string */
	/* once the minimum requirement for the type is met, start checking for the next type if required */
    /* end the matching once the lookahead is successful or the current match hits the maximum 
       number of characters */                
   	if (current_rule[rule_p]=='>')
	{
   		rule_p++;
	}
   	if (satisfied_min_cond== -1)
   	{                                               
   		if (ret_value->optional==1)
   		{
#ifdef DEBUG
				printf("par_match_sets_and_ranges; optional set to -1\n");
#endif
			ret_value->optional= -1;
		}
	   	ret_value->value=FAIL;
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
		{
		  if (ret_value->optional==1 || ret_value->optional== -1)
		    {
		      ret_value->optional= -1;
		      ret_value->value=FAIL;
		    }
		  else
		    {
		      total_length= -1;
		    }
		}
	    }                                        
	}
	ret_value->rule=rule_p;
#ifdef DEBUG
	printf("leaving par_match_sets_and_ranges length=%d total_length=%d ret_value->value=%d\n",length,total_length,ret_value->value);
#endif
   	return(total_length);
}
 
/*
 *	Function Name:
 *		par_match_set
 *
 *	Description:
 *		this function matches a set that is between { and }
 *
 *	Arguments:
 *		INPUT	unsigned char 	*current_rule	pointer to the current rule
 *		INPUT	unsigned char 	*input_array	the input array
 *		INPUT	int				save_p			The position of the { in the rule
 *		INPUT	int				rule_p          The position that par_match_sets_and_ranges is at in the rule
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
 */
short par_match_set(unsigned char *current_rule,
					unsigned char *input_array,
					int save_p, 					/* the position of the { */
					int rule_p,						/* the position that par_match_sets_and_ranges is at */
					int ipos,
					pmatch_arrays_t match_array,
					prange_value_t range_value,
					preturn_value_t ret_value,
					int lookahead)
{
	return_value_t		new_ret = { 0,0,0,0,0,0,0,0,0 }; 	/* for par_match_string to use */
	return_value_t		save_ret = { 0,0,0,0,0,0,0,0,0 };	/* a copy to restore new_ret */
	int length=0;
	int a_success=FAIL;
	int this_success=0;
	int num_chars_matched=0;
	int num_match=0;
	int new_char_type;

#ifdef DEBUG
		printf("entering par_match_set\n");
#endif
	if (ret_value==NULL)
	{
#ifdef DEBUG
			printf("leaving par_match_set ret_value is NULL\n");
#endif
		return(0);
	}
	if ((current_rule==NULL) || (input_array==NULL) || 
		(match_array==NULL) || (range_value==NULL))
	{
		ret_value->value=FATAL_FAIL;
#ifdef DEBUG
			printf("leaving par_match_set, inputs are bad\n");
#endif
		return(0);
	}
	new_ret.rule=save_p;
	new_ret.input_pos=ipos;
	new_ret.optional=ret_value->optional;
	new_ret.prev=ret_value->prev;  /* this is to trick par_look_ahead */	/* an attempt */
	new_ret.state=ret_value->state;
	new_ret.value=SUCCESS;
	
	par_copy_return_value(&save_ret,&new_ret);
	
	if (current_rule[new_ret.rule]!='{')
	{
		if (lookahead)
		{
			par_print_rule_error("par_match_set; no { found at the beginning of the set",current_rule,new_ret.rule);
		}
		ret_value->value=FATAL_FAIL;
		return(0);
	}   
	new_ret.rule++;	/* skip the { */ 
	while ((current_rule[new_ret.rule]!='}') && (current_rule[new_ret.rule]!='\0') && (a_success==FAIL))
	{
		this_success=SUCCESS;            
		length=0;
		while ((current_rule[new_ret.rule]!=',') && (current_rule[new_ret.rule]!='}') && (current_rule[new_ret.rule]!='\0') && (a_success==FAIL))
		{
			if ((new_char_type=par_get_char_type(current_rule[new_ret.rule]))!=NULL_TYPE)
			{
				num_chars_matched=par_match_string(current_rule,new_char_type,input_array,match_array,&new_ret,range_value,0,0);
				length+=num_chars_matched;
				new_ret.input_pos+=num_chars_matched;
				if (num_chars_matched== -1)
				{
					if (ret_value->optional==1 || ret_value->optional== -1)
					{
						ret_value->optional= -1;
						ret_value->value=FAIL;
					}
					else
					{
						if (current_rule[new_ret.rule]=='}')
						{
							ret_value->value=END_OF_STRING;                         
#ifdef DEBUG
						  	printf("leaving par_match_set; end of string reached in string\n");
#endif
							return(-1);
					  	}
					}
				}
#ifdef DEBUG
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
#ifdef DEBUG
					printf("par_match_set;this section has failed, look for the next section\n");
#endif
				this_success=FAIL;
				while ((current_rule[new_ret.rule]!=',') && (current_rule[new_ret.rule]!='}') && (current_rule[new_ret.rule]!='\0'))
				{
				  /* fixed the skipping of a missed section 7/32/96 MGS */
				  par_skip_string(current_rule,&new_ret,par_get_char_type(current_rule[new_ret.rule]));
				}
			} 
			else
			{
#ifdef DEBUG
					printf("this type has succeeded, matching next type\n");
#endif
			}
		}    
#ifdef DEBUG
			par_print_rule_error("par_match_set;after a comma or brace has been found",current_rule,new_ret.rule);
#endif
		if (this_success==SUCCESS)
		{
			a_success=SUCCESS;
#ifdef DEBUG
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
			if (current_rule[new_ret.rule]=='}')
			{
#ifdef DEBUG
					printf("par_match_set;all sections failed\n");
#endif
			}
			else
			{
#ifdef DEBUG
					printf("par_match_set;this section has failed, going to next section\n");
#endif
				rule_p=new_ret.rule;
				par_copy_return_value(&new_ret,&save_ret);
				num_match++;
				if (current_rule[rule_p]==',')
				{
					new_ret.rule=rule_p+1;
				}                   
			}
		}
	}
	if (a_success==FAIL)
	{
		ret_value->value=FAIL;
#ifdef DEBUG
			printf("par_match_set; it failed\n");
#endif
	}    
#ifdef DEBUG
		printf("leaving par_match_set length=%d ret_value->value=%d\n",length,ret_value->value);
#endif
	return(length);
}	
#endif // NEW_BINARY_PARSER
#endif /* end of #ifndef VOCAL */


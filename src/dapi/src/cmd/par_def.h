/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995, 1998. All rights reserved.
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
 *    File Name:	par_def.h
 *    Author:		Matthew Schnee
 *    Creation Date:4/12/96
 *
 *    Functionality:
 *    include file for par_pars.c
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev	Who		Date		Description
 *	---	-----	-----------	-----------------------------------------------
 * 	001	MGS		05/12/1996	first release 
 *	002	MGS		05/15/1996	changed MAX_ * defines to PAR_MAX_ 
 *	003	MGS		05/24/1996	Changed the max rule length to 200
 *  004	MGS		06/24/1996	Added types TYPE_punct_some and TYPE_vowel_non_y
 *                          'Y' and 'T' respectively
 *	005	MGS		08/05/1996	Added define and struct for indexes
 *	006	GL		08/30/1996	Add PAR_INIT AND PAR_INDEX_INIT macro
 *	007 GL		10/01/1996  Add TYPE_quot
 *  008 GL		02/08/1997	Add STATUS_DELIMITER
 *  						also add a parser_flag in return_value structure.
 *	009	MGS		03/12/1998	Added code for the new parser
 *                                                      new changes go in the file par_def1.h
 *  010 CJL             03/18/1998      Removed specific path for dectalkf.h.
 */

#include "dectalkf.h"

#ifdef NEW_BINARY_PARSER
#include "par_def1.h"
#else

#ifndef PAR_DEFH
#define PAR_DEFH 1

#define PAR_MAX_MATCH_ARRAY			30
#ifdef WIN32
#ifdef PRINTFDEBUG
#define printf WINprintf
#endif
#define PAR_MAX_INPUT_ARRAY			500
#define PAR_MAX_OUTPUT_ARRAY		500
#define PAR_MAX_RULE_LENGTH			300
#define PAR_ROLLING_STOP_VALUE      300
#else
#define PAR_MAX_INPUT_ARRAY			300
#define PAR_MAX_OUTPUT_ARRAY		300
#define PAR_MAX_RULE_LENGTH			200
#define PAR_ROLLING_STOP_VALUE      200
#endif

#define PAR_MAX_ARRAYS				10 
#define PAR_MAX_RETURN_LEVEL		10
#define PAR_MIN_INPUT_SIZE          5

//#define PAR_ROLLING_STOP_VALUE                144
//#define PAR_ROLLING_STOP_VALUE          72
  
  
  
#define FAIL					0    

#ifndef SUCCESS 
#define SUCCESS					1
#endif

#define OPT_FAIL				2
#define END_OF_STRING			3  
#define FATAL_FAIL				4
#define STOP					5


#define	End_Is_Slash 			'/'
#define	End_Is_Null 			'\0'
#define End_Is_Paren            ')'

#define	NULL_STATE				0
#define	COPY_STATE				1
#define	REPLACE_STATE			2
#define	DELETE_STATE			3
#define	INSERT_STATE			4
#define	INSERT_AFTER_STATE		5
#define	INSERT_BEFORE_STATE		6
#define	OPTIONAL_STATE			7
#define SAVE_STATE				8
#define MACRO_STATE				9
#define DICTIONARY_STATE		10 
#define WORD_STATE				11
#define STATUS_STATE			12

#define COPY_DELIMITER			'c'
#define REPLACE_DELIMITER		'r'
#define DELETE_DELIMITER		'd'
#define INSERT_DELIMITER		'i'
#define INSERT_AFTER_DELIM		'a'
#define INSERT_BEFORE_DELIM		'b'
#define OPTIONAL_DELIMITER		'o'
#define MACRO_DELIMITER		    'p'
#define DICTIONARY_STATE_DELIM  'h'
#define WORD_STATE_DELIM		'w'
#define STATUS_STATE_DELIM		's'

#define START_SAVE_STATE		'('
#define END_SAVE_STATE			')'
#define SAVE_DELIMITER			'$'


/* these are the types used in par_char.c */

#define TYPE_null				0x0000
#define TYPE_digit				0x0001
#define TYPE_upper				0x0002
#define TYPE_lower				0x0004
#define TYPE_alpha				0x0008
#define TYPE_any_char			0x0010
#define TYPE_white				0x0020
#define TYPE_punct				0x0040
#define TYPE_non_alpha			0x0080
#define TYPE_vowel				0x0100
#define TYPE_consonant			0x0200
#define TYPE_number				0x0400
#define TYPE_clause				0x0800
#define TYPE_alpha_num			0x1000
#define TYPE_vowel_non_y		0x2000
#define TYPE_punct_some			0x4000
#define TYPE_quot				0x8000


/* these defines are used in par_pars.c */
#define NULL_TYPE				0
#define DIGIT_CHAR_TYPE			TYPE_digit
#define UPPER_CHAR_TYPE			TYPE_upper
#define LOWER_CHAR_TYPE			TYPE_lower
#define ANY_ALPHA_CHAR_TYPE		TYPE_alpha
#define ANY_CHAR_CHAR_TYPE		TYPE_any_char
#define WHITE_CHAR_TYPE			TYPE_white
#define PUNCT_CHAR_TYPE			TYPE_punct
#define NON_ALPHA_CHAR_TYPE		TYPE_non_alpha
#define VOWEL_CHAR_TYPE			TYPE_vowel
#define CONSONANT_CHAR_TYPE		TYPE_consonant
#define NUMBER_CHAR_TYPE		TYPE_number
#define CLAUSE_CHAR_TYPE		TYPE_clause
#define ALPHA_NUM_CHAR_TYPE		TYPE_alpha_num
#define VOWEL_NON_Y_TYPE		TYPE_vowel_non_y			
#define SOME_PUNCT_TYPE			TYPE_punct_some			
#define SOME_PUNCT_DEL_TYPE		TYPE_punct_some_del
#define SET_CHAR_TYPE			9911
#define EXACT_CHAR_TYPE			9913
#define EXACT_CASE_TYPE			9917
#define HEXADECIMAL_TYPE		9919
#define SAVE_CHAR_TYPE			9923

/* the following symbols will be used to index the ambigous_char[][] */
/* the table is in par_ambi.tab.  this table is generated by par_tab.tab */
#define NULL_TYPE					0
#define DIGIT_CHAR_TYPE2			0/* this is to zero base the numbers to save space in the table */
#define UPPER_CHAR_TYPE2			1
#define LOWER_CHAR_TYPE2			2
#define ANY_ALPHA_CHAR_TYPE2		3
#define ANY_CHAR_CHAR_TYPE2			4
#define WHITE_CHAR_TYPE2			5
#define PUNCT_CHAR_TYPE2			6
#define NON_ALPHA_CHAR_TYPE2		7
#define VOWEL_CHAR_TYPE2			8
#define CONSONANT_CHAR_TYPE2		9
#define NUMBER_CHAR_TYPE2			10
#define CLAUSE_CHAR_TYPE2			11
#define ALPHA_NUM_CHAR_TYPE2		12
#define VOWEL_NON_Y_TYPE2			13	
#define SOME_PUNCT_TYPE2			14	
#define SET_CHAR_TYPE2				15
#define EXACT_CHAR_TYPE2			16
#define EXACT_CASE_TYPE2			17
#define HEXADECIMAL_TYPE2			18
#define SAVE_CHAR_TYPE2				19

#define DIGIT_CHAR_DELIM		'D'
#define UPPER_CHAR_DELIM		'U'
#define ANY_ALPHA_CHAR_DELIM	'A'
#define ANY_CHAR_CHAR_DELIM		'C'
#define WHITE_CHAR_DELIM		'W'
#define PUNCT_CHAR_DELIM		'P'
#define LOWER_CHAR_DELIM		'L'
#define NON_ALPHA_CHAR_DELIM	'N'
#define SET_CHAR_DELIM			'S'
#define VOWEL_CHAR_DELIM		'V'
#define CONSONANT_CHAR_DELIM	'O'
#define NUMBER_CHAR_DELIM		'B'
#define CLAUSE_CHAR_DELIM		'E'
#define ALPHA_NUM_DELIM			'H'
#define VOWEL_NON_Y_DELIM		'Y'	
#define SOME_PUNCT_DELIM		'T'	               
#define EXACT_CHAR_DELIM		'\''
#define EXACT_CASE_DELIM		'`'
#define HEXADECIMAL_DELIM		'0'		/* the number 0 */


#define NO_LOOKAHEAD			'x'

#define ESCAPE_DELIM			'\\'
#define CONDITIONAL_DELIM		'|'   
#define STATE_PART_DELIM		'/'
#define RULE_NUMBER_DELIM		'R' /* this is also used for macro state processing */
#define HIT_NUMBER_DELIM		'H'
#define MISS_NUMBER_DELIM		'M'
#define DICTIONARY_DELIM		'D'
#define DICTIONARY_HIT			'H'
#define DICTIONARY_MISS			'M'
#define NON_MATCH_DELIM			'~'
#define GORET_NUMBER_DELIM		'G'
#define GORET_HIT_DELIM			'H'
#define GORET_MISS_DELIM		'M'

/* these are for looking up values in the ambiguous_char table */
/* reverse is the compliment of a set */
#define NORMAL_TO_NORMAL                0x01
#define NORMAL_TO_REVERSE               0x02
#define REVERSE_TO_NORMAL               0x04
#define REVERSE_TO_REVERSE              0x08

#define ALL_TO_ALL                      ( NORMAL_TO_NORMAL | NORMAL_TO_REVERSE | REVERSE_TO_NORMAL | REVERSE_TO_REVERSE )
#define ALL_TO_NORMAL                   ( NORMAL_TO_NORMAL | REVERSE_TO_NORMAL )
                 

/* stuff for the new compiler rule format */

#define UNSET_PARAM        	-1
#define	NORMAL_TAG_VALUE	0
#define STOP_TAG_VALUE     	1
#define RETURN_TAG_VALUE   	2
#define GOTO_TAG_VALUE     	3
#define GORET_TAG_VALUE    	4
#define DICT_HIT_VALUE     	1
#define DICT_MISS_VALUE    	0

/* for phoneme translation */

#define PAR_OUTPUT_CHARS	1
#define PAR_OUTPUT_PHONES	2

/* the phonemes are ascky !!!!! */

#define	PAR_PHONES_ON_D			0x81
#define PAR_PHONES_OFF_D		0x82

#define PAR_INDEX_DUMMY_CHAR	0x83
	
#pragma pack(2)
struct rule_struct
{
  S16 special_rule;                      /* 0 normal rule  1 stop  2 return  3 goto  4 goret */
  S16 special_value;                     /* the data for the special rule */
  S32 lang_flag;                         /* the langauge flag */
  S32 mode_flag;                         /* the mode flag */
  S16 rule_number;                       /* the rule number */
  S16 next_hit_rule;                     /* the rule to go to on a hit */
  S16 next_miss_rule;                    /* the rule to go to on a miss */
  S16 next_goret_hit;                    /* the rule to subroutine to on a hit */
  S16 next_goret_miss;                   /* the rule to subroutine to on a miss */
  S16 dict_flag;                         /* the dictionary hit miss flag */
  unsigned char rule[PAR_MAX_RULE_LENGTH]; /* the rest of the rule, left as is */
};
#pragma pack()

typedef struct rule_struct rule_t;
typedef struct rule_struct *prule_t;

struct dict_pointers_s
{
	S16 start;
	S16 end;
	S16 num_entries;
};

typedef struct dict_pointers_s dict_pointers_t;

struct return_value_s
{
	S16 input_pos;		/* the positiion to start the matching at */
	S16 input_offset;	/* the number of characters that were matched in the input */
	S16 output_pos;  	/* the position to start writiing the output into the array */
	S16 output_offset;	/* the number of characters written into the output array */
	S16 rule;			/* the offset from the beginning of the rule the matching is at */
	S16 value;			/* return value of the function */ /* the actual intent of this structure */
	S16 optional;		/* the flag for optional failures */
	S16 state;			/* the current state for lookahead to use */
	U16 parser_flag;	/* status_state setting, will store the variable into kernel variable */
	struct return_value_s *prev;           /* a pointer to the callers ret_value structure for lookahead */
};

typedef struct return_value_s return_value_t;
typedef struct return_value_s *preturn_value_t;

struct range_value_s
{
	S16 start;   			/* the start of range of numbers for matching for DIGIT type only */
	S16 end;				/* the end of a range of numbers for matching for DIGIT type only */
	S16 min;
	S16 range_set;
};
 
typedef struct range_value_s range_value_t;
typedef struct range_value_s *prange_value_t;

struct match_arrays_s
{
	unsigned char array[PAR_MAX_ARRAYS][PAR_MAX_MATCH_ARRAY];	/* 10 arrays for temporory storage in the rule matcher */
};
	                 
typedef struct match_arrays_s match_arrays_t;
typedef struct match_arrays_s *pmatch_arrays_t;

struct index_data_s
{
	DT_PIPE_T	index[3];
};

typedef struct index_data_s index_data_t;
typedef struct index_data_s *pindex_data_t;


/* define PAR_INIT and PAR_INDEX_INIT */
#define PAR_INIT \
		memset(pCmd_t->clausebuf,0,PAR_MAX_INPUT_ARRAY);\
		memset(pCmd_t->wordbuf,0,50);\
		memset(pCmd_t->new_input,0,PAR_MAX_INPUT_ARRAY);\
		memset(pCmd_t->output_buf,0,PAR_MAX_OUTPUT_ARRAY);\
		memset(&(pCmd_t->ret_value),0,sizeof(return_value_t));\
		memset(pCmd_t->dict_hit_buf,0,PAR_MAX_INPUT_ARRAY);		



#define PAR_INDEX_INIT \
		memset(pCmd_t->input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));\
		memset(pCmd_t->new_input_indexes,0,PAR_MAX_INPUT_ARRAY*sizeof(index_data_t));\
		memset(pCmd_t->output_indexes,0,PAR_MAX_OUTPUT_ARRAY*sizeof(index_data_t));\


#endif
#endif // #ifdef NEW_BINARY_PARSER

/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved. 
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved. 
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
 *    File Name:        cm_data.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    new command main include file ...
 *
 ***********************************************************************
 *    Revision History: 
 *
 * Rev  Who 	Date        	Description
 * ---  -----   ----------- 	--------------------------------------------
 * 001  cjl     02/05/1996  	Made Span Abbrev[] and RULESET[] extern from cmd_pars.c.
 * 002  gl      04/03/1996      add cmd_number into thread data structure.
 * 003  MGS     04/18/1996	    added MSDOS ifdefs
 * 004	MGS		05/15/1996		moved PKSD_T typedef to kernel.h
 * 005  GL		08/05/1996		move data from cm_cons.h to end of this file 
 * 006	MGS		08/06/1996		Added new_indexing stuff
 * 007	GL		08/29/1996		Add skip_mode 
 * 008  SIK		10/10/1996		Added extern definition for nchar_types to 
 *									support vocal build 
 * 009	GL		10/25/1996		Add index_counter varialbe
 * 010	GL		11/08/1996		Add bracket_space in CMD_TAG
 * 011  GL		01/22/1997		Add roll_text in CMD_TAG
 * 012  GL		02/05/1997		Add email_header in CMD_TAG
 * 013  MGS		08/22/1997		For BATS#449, fix the Xerox Cash problem
 * 									increase woodbuf[] size to same as input buffer
 * 014	MGS		03/12/1998		Added code for the new binary parser
 * 015  CJL     03/18/1998      Removed specific path for dectalkf.h.
 * 016	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces 
 * 017	MGS		04/13/2000		Changes for integrated phoneme set 
 * 018 	CAB		10/16/2000		Changed copyright info
 * 019	MGS		02/08/2001		Fixed linux compiler/envrionment issue
 * 020	CAB		02/09/2001		Updated copyright info
 * 021	MGS		04/16/2002		ARM7 port
 * 022	CAB		08/08/2002		Updated copyright info
 */

#ifndef CMDATAH
#define CMDATAH 1

#include "dectalkf.h"


/*
 * command dispatch table, ascii strings, zero terminated number of
 * parameters, and a routine address for the dispatcher.  Commands
 * can be any length ascii strings, params is a zero terminated ascii
 * that uses 'd' for decimal value, 'h' for hex value, 'b' for binary
 * value, 'o' for octal value, 'a' for ascii string, and '*' for execute
 * routine and conditionally reset the parser.  The esc value is the 
 * compatable value that the esc parser returns in p1 or the command.
 * c_routine is a pointer to the actual execution code for the routine.
 */
 typedef struct ICOMM_TAG   
 {
	char cmd[60];
		
 }ICOMM_T,*PICOMM_T;

struct  dtpc_command    
{
	unsigned char   *c_name;                        /* command string name */
	unsigned char   *c_format;                      /* format of command params */
	int             n_params;                       /* number of params */
	unsigned int    esc_value;                      /* value for escaped version */
	int             (*c_routine)(PVOID);            /* pointer to execution code */
};


/*
 * This structure is used to pass pre-parsed ANSI control sequences around
 * inside DECtalk. This is a little bit different from the old version of
 * the structure. The default-ness of a parameter used to be implied in its
 * zero value. Now there is an array of default flags (the "s_dflag" field)
 * that carries this    information.
 */
 
typedef struct  input_esc_struct 
{
	short   type;                                   /* Type code.                   */
	char    badf;                                   /* TRUE if sequence is bad.     */
	char    pintro;                                 /* Non zero if private intro.   */
	short   nparam;                                 /* # of parameters.             */
	short   ninter;                                 /* # of intermediates.          */
	short   param[NUM_PARAM];                       /* Parameters.                  */
	char    dflag[NUM_PARAM];                       /* Default parameter flags.     */
	char    inter[NUM_INTER];                       /* Intermediates.               */
	char    final;                                  /* Final.                       */
} INPUT_SEQ;


/*
 *  ascky to pipe code conversion structure ...
 */

typedef struct  ascky_table 
{
	char    p_graph;                /* Graphic code.                */
	char    p_phone_phone;                /* Phonemic code.               */
}       ASCKY_TAB;

/*****************************MVP New***********************************************/
/* The following structure is an instance specific CMD thread structure.           */
/* The elements of the structure will have state information of a particular CMD   */
/* thread instance.                                                                */
/***********************************************************************************/
typedef struct CMD_TAG 
{
	unsigned int    params[NPARAM];             /* array of params built */
	ICOMM_T         setv[10];
	unsigned char*  pString[NPARAM];
	unsigned int    defaults[NPARAM];
	unsigned int    param_index;
	int             p_count;
	int             cmd_p_flag;                     /* negation flag */
	int             q_flag;                     /* 
												 * quote flag. It is used
   												 * when parsing phoneme info 
   												 * (ie. stuff inside < >'s or 
   												 * between \'s). q_flag is set 
   												 * to the character we expect to 
   												 * terminate the string, and we 
   												 * check against this to
   												 * know when we reach the end of it.
   												 */
	int				international_flag;
	int				international_temp;
	int				international_phon_lang;
#ifdef ARM7
 	short			cm[60]; // This has to updated when a new command is added
#else
	short             *cm;
#endif
	int             total_matches;              /* currently matching buffers */
	int             cmd_index;                  /* array index of active command */
	unsigned int    last_char;                  /* last accepted character */
	unsigned char   string_buff[STRING_MAX];    /* 
												 * string param array 
												 * This is used only to give 
							   					 * a buffer and pString will point
							   					 * to this buffer.
							   					 */
	int             next_char;   
	unsigned int    format_index;               /* next free character in string buffer */
	int             parse_state;                /* current state of CMD parser */            
	int             error_mode;                 /* current error mode */
	int             punct_mode;                 /* current punctuation mode */
	int             skip_mode;                  /* current skip mode */
#ifdef CUP28PROJECT
	int				lastchar;	//eab temp in for MITsubishi
#endif
	unsigned int    last_punct;                 /* last non-strip punctuation */
	int             esc_command;                /* command execution via escape code */
	short           cmd_count;                  /* Used only in cmd_parse.c cmd_cmd.c */
	short           cmd_number;                 /* used for MS_DOS platform */
	short           insertflag;                 /* 
												 * Flag to inducate when it is time to 
												 * process internally stored command string
												 * from setv command. 0 == not processing
												 * internal string; 1 == processing.
												 */
	/* Removed all escape sequence code. SIK */
#ifdef ESCAPE_SEQ
	 INPUT_SEQ   	*esc_seq;                   /* input escape sequences */
#endif
	/*MVP : List of static variables in process_char() in CMD_PARS.C */
	unsigned short	ParseChar;                  /* 
												 * MVP :This represents earlier global
							   					 * variable 'c' in CMD_PARS.C file.
							   					 * It is used only in this file.
							   					 * The name is changed to ParseChar.
							   					 * Don't confuse with 'c' used in 
							   					 * Function arguments (stack variable)
							   					 */ 
#ifdef MSDOS
	unsigned int    tone_wait;
	unsigned int    last_wait;
#endif
												 
	unsigned long   dtmf_start_clock;
	unsigned long   dtmf_stop_clock;                                                                                          
	/* List of variables used in text pre-processor (cm_text.c) */
	short			input_counter;
	short			index_counter;
    short           roll_text;
    short           email_header;
	unsigned char   clausebuf[PAR_MAX_INPUT_ARRAY];
	/* MGS 8/22/1997 for BATS#449  increase size from 50 to PAR_MAX_INPUT_ARRAY */
	unsigned char   wordbuf[PAR_MAX_INPUT_ARRAY];
	unsigned char	output_buf[PAR_MAX_OUTPUT_ARRAY];
	unsigned char	new_input[PAR_MAX_OUTPUT_ARRAY];
	unsigned char 	dict_hit_buf[PAR_MAX_INPUT_ARRAY];
#ifdef ARM7
#ifdef ACCESS_SOLUTIONS
	index_data_t	input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t	new_input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t	output_indexes[PAR_MAX_OUTPUT_ARRAY];
#else
	index_data_t	input_indexes[1];
	index_data_t	new_input_indexes[1];
	index_data_t	output_indexes[1];
#endif
#else
	index_data_t	input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t	new_input_indexes[PAR_MAX_INPUT_ARRAY];
	index_data_t	output_indexes[PAR_MAX_OUTPUT_ARRAY];
#endif
#ifdef NEW_BINARY_PARSER
	match_arrays_t 		match_array; /* this is 300 bytes, maybe it should be passed instead of allocated */
#endif
	unsigned char	*prevword;
    short			prev_word_index;
	short     	    done;
	return_value_t	ret_value;
	
	/* timeout value to fix phomene mode */
	short			timeout;

	/* bracket_space  to mark the extra space before "[" */
	short			bracket_space;
/* 016	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
	short			letter_mode_flag;

#ifdef VOCAL
	/* Variables from old parser code */
	unsigned int lpchar;
	int postel;
	int digcnt;
	char laschar;
	unsigned int dcnt;
	char heldchar[2];
#endif

} CMD_T;

typedef CMD_T *PCMD_T;
typedef CMD_T **PPCMD_T ;

#ifdef MSDOS 
	/*
	 * TTS_HANDLE_TAG struct contains handles to the thread-specific data 
	 * for kernel share memory (pKernelShareData) and the struct of global variables
	 * (pCMDThreadData).
	 */
	typedef struct TTS_HANDLE_TAG
	{
		PKSD_T pKernelShareData;
		PCMD_T pCMDThreadData;
	} *LPTTS_HANDLE_T;
#endif  

extern const int      total_commands;                  /* number of commands in table */
#ifndef ARM7
extern short	cm[];
#endif
/*
 *  character types ...
 */

extern const unsigned char char_types[];

#ifdef VOCAL
/* SIK 10/10/96 Added to support VOCAL build */
extern unsigned int nchar_types[];
#endif

extern  const struct  dtpc_command command_table[];				  
  
#endif  /*    CMDATAH  */

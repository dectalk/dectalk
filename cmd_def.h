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
 *    File Name:	cmd_def.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  new command main include file ...
 *
 ***********************************************************************
 *    Revision History:
 * 001 02/05/96 cjl Made Span Abbrev[] and RULESET[] extern from cmd_pars.c.
 */

#ifndef CMD_DEFH
#define CMD_DEFH 1

#include        "defs.h"
#include        "kernel.h"
#include        "dectalk.h"
#include        "cmdp.h"
#include        "esc.h"
#include        "cmd.h"
#include        "iso_char.h"
/*#include        "kernp.h"*/

/*
 *  command parser control states ...
 */

#define STATE_NORMAL            0                               /* passing characters */
#define STATE_BRACKET           1                               /* found a [ */
#define STATE_COMMAND           2                               /* found [: */
#define STATE_PHONEME           3                               /* found [, no :, in phonemic */
#define STATE_PARAM             4                               /* matched command, parsing */
#define STATE_TOSS              5                               /* bad [:, waiting for ] */                             
#define STATE_KEEP              6                               /* hold parse data */

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
 struct icomm   
 {
		char cmd[60];
		
	};

struct  dtpc_command    {

	unsigned char                                   *c_name;                                                /* command string name */
	unsigned char                                   *c_format;                                      /* format of command params */
	int                                              n_params;                                       /* number of params */
	unsigned int                                     esc_value;                                      /* value for escaped version */
	int                                            (*c_routine)();                 /* pointer to execution code */
};

#define NULL_COMMAND            ((unsigned char *)0)

/*
 * This structure is used to pass pre-parsed ANSI control sequences around
 * inside DECtalk. This is a little bit different from the old version of
 * the structure. The default-ness of a parameter used to be implied in its
 * zero value. Now there is an array of default flags (the "s_dflag" field)
 * that carries this    information.
 */

#ifdef ESCAPE_SEQUENCES
#define NUM_INTER               20                      /* Intermediates, ANSI sequence */
#define NUM_PARAM               20                      /* Parameters, ANSI sequence    */


typedef struct  input_esc_struct {
	short   type;                                   /* Type code.                   */
	char    badf;                                   /* TRUE if sequence is bad.     */
	char    pintro;                                 /* Non zero if private intro.   */
	short   nparam;                                 /* # of parameters.             */
	short   ninter;                                 /* # of intermediates.          */
	short   param[NUM_PARAM];                       /* Parameters.                  */
	char    dflag[NUM_PARAM];                       /* Default parameter flags.     */
	char    inter[NUM_INTER];                       /* Intermediates.               */
	char    final;                                  /* Final.                       */
}       INPUT_SEQ;

#define SP      (*esc_seq)
#endif
/*
 *  ascky to pipe code conversion structure ...
 */

typedef struct  ascky_table {
	char    p_graph;                /* Graphic code.                */
	char    p_phone;                /* Phonemic code.               */
}       ASCKY_TAB;


extern  struct  dtpc_command command_table[];
#define CT                        command_table

/*
 *  params are stored in this global array for all the routines to see, if
 *  a number is desired, then that number is in the proper array index, if
 *  a string is the parameter, then the array index is an index into the
 *  string buffer ...  params[] stores the parameters ... next_param tells
 *  how many of the parameters the user entered and acts as a pointer
 *  into the array for the parameters ...       p_count counts the characters
 *  entered for this command ... p_flag is used to store state about numeric
 *  and string parases
 */

#define CURR_PARAM              (params[param_index])
#define CURR_DEFAULT            (defaults[param_index])
#define PUSH_PHONE              (params[param_index++])
#define CURR_PHONE              (params[param_index-1])
#define FORMAT_PARAM            (CT[cmd_index].c_format[format_index])

extern unsigned short params[];                    /* array of params built */
extern unsigned char*  pString[];			 /* Character pointer */
extern unsigned int defaults[];                  /* use default value */
extern int param_index;                          /* current param being worked on */
extern int format_index;                         /* current command format specifier */
extern int      p_count;                         /* chars in this param */
extern int      p_flag;                          /* negation flag */
extern int      q_flag;                          /* quote flag */

/*
 *  command match parse control ...
 */

extern int      cm[];                            /* command match parse array */
extern int      total_matches;                   /* currently matching buffers */
extern int      cmd_index;                       /* array index of active command */
extern int      total_commands;                  /* number of commands in table */
extern unsigned int last_char;                   /* last char for error parsing */
/*
 *  parameter string buffers ... the string buffer is used to save string
 *  based parameters, note for this to properly wrap, it must be a power
 *  of two ...  the next char pointer continues counting but will store only
 *  STRING_MAX characters ...
 */

#define STRING_MAX              (0x10)
#define STRING_MASK             (0x0f)
#define STRING_BYTE             string_buff[next_char & STRING_MASK]
#define PUSH_BYTE               string_buff[next_char++ & STRING_MASK]

extern unsigned char string_buff[];                /* string param array */
extern int      next_char;                         /* next free character in string buffer */

/*
 *  main parse state control ... this single variable controls what action
 *  the parser takes on each and every character.  This makes it easier for
 *  us to return to the init state on various sync and flush commands ...
 */

extern int      parse_state;

/*
 * phonemic mode and error mode control ...
 */

extern int      error_mode;
extern int      punct_mode;
extern int      timeout;
extern unsigned int last_punct;

/*
 *  escape sequence storage ...
 */

//extern INPUT_SEQ        command_seq,*esc_seq;
extern int esc_command;

/*
 *  digitized data control ...
 */
     
/* commented out as unused vars - 8/9/95  JDB
extern int digitized_offset;
extern int digitized_enable;                 
*/

/*
 *  tone output control ...
 */

//extern unsigned int tone_wait;
//extern unsigned int last_wait;

/*
 * command error codes ...
 */

#define CMD_success             0
#define CMD_bad_string          1
#define CMD_bad_value           2
#define CMD_bad_command         3
#define CMD_bad_param           4
#define CMD_bad_phoneme         5
#define CMD_flushing            6

#define NO_STRING_MATCH         0xffff

/*
 *  error processing modes ...
 */

#define ERROR_ignore            0
#define ERROR_text              1
#define ERROR_escape            2
#define ERROR_speak             3
#define ERROR_tone              4

/*
 *  punctuation modes ...
 */

#define PUNCT_none              0
#define PUNCT_some              1
#define PUNCT_all               2
#define PUNCT_pass              3

/*
 *  min/max things ...
 */

#define MAX_VOICES              10
#define MIN_RATE               100
#define MAX_RATE               550

/*
 *  character types ...
 */

extern const unsigned char char_types[];

extern const unsigned int nchar_types[];

extern int ruleset[];

#define MARK_null              0x00                    /* null marker for place holder */
#define MARK_vowel             0x01                    /* has a vowel */
#define MARK_upper             0x02                    /* has an upper */
#define MARK_cons              0x04                    /* has a consonant*/
#define MARK_digit             0x08                    /* has a digit */
#define MARK_non_alpha         0x10                    /* has a non-alpha character */
#define MARK_punct             0x20                    /* has some MARK of punctuation */
#define MARK_clause            0x40                    /* punctuation used as clause terminator */
#define MARK_space             0x80                    /* white space character */


#define TYPE_null              0x0000                    /* null marker for place holder */
#define TYPE_vowel             0x0001                    /* has a vowel */
#define TYPE_upper             0x0002                    /* has an upper */
#define TYPE_cons              0x0004                    /* has a consonant*/
#define TYPE_digit             0x0008                    /* has a digit */
#define TYPE_non_alpha         0x0010                    /* has a non-alpha character */
#define TYPE_punct             0x0020                    /* has some type of punctuation */
#define TYPE_clause            0x0040                    /* punctuation used as clause terminator */
#define TYPE_space             0x0080                    /* white space character */
#define TYPE_number            0x0100                    /* char can be part of number */

/*
 * Rule engine variables
 */
 
#define MAXRULES  500

extern int	tmp,tmpcntr,incntr;
extern int rulsuc[];
extern unsigned char clausebuf[];
extern int index;
extern int rcntr; /* rulecounter*/
extern int	outcntr;
extern char *prevwbound;
extern int done;
extern int previnserts;
extern int charseqcnt;/*count of the number of the same characters in a row*/
extern unsigned int c;
extern int rulenum; /*number of the rule being run*/
extern int ruleset[];
extern char abbrev[];

#endif

/************************************************************
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
 *    File Name:    cm_vars.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    All the global vars. that I dont't know what to do with: 
 ***********************************************************************
 *    Revision History:
 *  because uf the Windows code merge, this file is unneeded. MGS 
 *  18-Apr-1996
 */   
 
#include "cm_def.h"

int   cmd_index;        /* array index of active command */  

short cmd_number, cmd_count;    /* Used in cm_cmd_setv(), cm_cmd_loadv(),
				 * cm_pars_icommand()
				 */ 
short insertflag;               /* Initialized in main() Used in cm_cmd_insert_param(), 
				 * cm_cmd_build_param(), cm_cmd_setv(), cm_pars_loop(), cm_pars_new_state(),
				 * cm_pars_icommand()
				 */
unsigned int params[NPARAM];    /* array of params built */
unsigned int defaults[NPARAM];  /* use default value */
int     param_index;        /* current param being worked on */
int     format_index;       /* current command format specifier */
int     p_count;        /* chars in this param */
int     p_flag;         /* negation flag */
int     q_flag;         /* quote flag */
unsigned char string_buff[STRING_MAX];  /* string param array */
unsigned int last_char;                 /* last accepted character */
int     next_char;                      /* next free character in string buffer */
int     parse_state;                    /* current parser state */
int     error_mode;                     /* current error mode */
int     punct_mode;                     /* current punctuation mode */
unsigned int    last_punct;             /* last non-strip punctuation */
int     esc_command;                    /* command execution via escape code */
int     timeout;                        /* Initialized in main(), used in cm_cmd-timeout(),
					 * cm_pars_getseq()
					 */
unsigned int tone_wait;         /* ticks to wait for last tone */

char cbuf[120];             /* Character input buffer */
signed int cbufcnt=0;           /* Number of char's in of cbuf */
unsigned int dcnt;              /* Number of dashs processed */
unsigned int pcnt=0;                    /* Number of periods seen in current parse */
unsigned int prcnt=0;                   /* Used in cm_pars_proc_char() */
/*int isdigit; */

//int isdigit=1;              /* Used in cm_pars_proc_char(), cm_util_sendat() */
int sndtel=0;               /* Used in cm_pars_proc_char(), cm_util_sendit() */
int digcnt=0;                           /* Used in cm_pars_proc_char() */
int postel=0;                           /* Used in cm_pars_proc_char() */
int modechng=0;                         /* Used in cm_pars_loop(), cm_pars_process_char(),
					 * cm_util_sendit(), cm_util_sendat()
					 */
int posord;                             /* Used in cm_pars_process_char(), cm_util_sendit() */
char laschar;                           /* Used in cm_pars_loop(), cm_util_sendit() */
unsigned int lpchar;            /*last punctuation mark processed*/ 
struct icomm setv[10];          /* struct for setv and loadv */
INPUT_SEQ       command_seq, *esc_seq;  /* input escape sequences */
unsigned int c;             /* This is THE c !!!!!!! */


/* these need to be global because we need to reset start on */
/* the occurance of a "," ... */
unsigned long dtmf_start_clock,dtmf_stop_clock;


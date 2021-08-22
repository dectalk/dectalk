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
 *    File Name:	cm_cons.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    All the externs for global vars. that I dont't know what to do with: 
 ***********************************************************************
 *    Revision History:
 * Rev	Who	Date		Description
 * ---	-----	-----------	--------------------------------------------
 */   

#ifndef CMCONSH
#define CMCONSH 1

/* #include "cm_data.h" */

/**************************MVP MI **************************************************/
/* The commented and variables later orgainzed in CMD thread specific structure are*/
/* listed here MVP								   */
/* extern unsigned int params[];  */                      /* array of params built */
/* extern unsigned char * pString[]; */               /* array for string pointers */
/* extern unsigned int defaults[];   */                       /* use default value */
/* extern unsigned int param_index;  */           /* current param being worked on */
/* extern int      p_count;          */                     /* chars in this param */
/* extern int      p_flag;           */                           /* negation flag */
/* extern int      q_flag;           */                              /* quote flag */
/*										   */
/*  command match parse control ...						   */
/*										   */
/* extern int      cm[];           */                 /* command match parse array */
/* extern int      total_matches;  */                /* currently matching buffers */
/* extern int      cmd_index;      */             /* array index of active command */
/* extern unsigned int last_char;  */               /* last char for error parsing */
/* extern unsigned char string_buff[];  */                   /* string param array */
/* extern int      phoneme_mode;	            				   */
/* extern unsigned int format_index; */        /* current command format specifier */
/* extern int      next_char; */           /* next free character in string buffer */
/*										   */
/*  main parse state control ... this single variable controls what action	   */
/*  the parser takes on each and every character.  This makes it easier for	   */
/*  us to return to the init state on various sync and flush commands ...	   */
/*										   */
/* extern int      parse_state;							   */
/* extern int      error_mode;							   */
/* extern int      punct_mode;							   */
/* extern int      timeout;   							   */
/* extern INPUT_SEQ        command_seq,*esc_seq;                         	   */
/*										   */
/*  phonemic mode and error mode control ...					   */
/*										   */
/* extern unsigned int last_punct;						   */
/*										   */
/*  escape sequence storage ...							   */
/*										   */
/* extern int esc_command;							   */
/***********************************************************************************/

extern int      total_commands;                  /* number of commands in table */
extern int	cm[];

/*
 *  character types ...
 */

extern unsigned char char_types[];
extern unsigned int nchar_types[];
extern  struct  dtpc_command command_table[];				  

#endif

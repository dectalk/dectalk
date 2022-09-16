#ifndef NO_CMD
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
 *    File Name:	cmd_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  Main command driver entry point ... all data is initialized here then we
 *  spawn the command task ...
 *
 ***********************************************************************
 *    Revision History:
 * 15dec95	...tek		merge dtex; this includes adding the 
 *				undocumented :vs command which only 
 *				worked before because there were no other
 *				:v commands. Note that the dtex version 
 *				command isn't enabled for the dtpc.
 *
 *
 */


#ifdef	WIN32
#include	"windows.h"
#include	"winbase.h"
#endif

#ifdef SIMULATOR
#include <stdio.h>
#endif

#include        "cmd_def.h"

extern insertflag;

int     cmd_rate();                                     /* set the speaking rate */
int     cmd_name();                                     /* change the voice */
//int     cmd_latin();                            /*theta to s */
int     cmd_comma();                            /* comma pause time */
int     cmd_period();                           /* period pause time */
//int     cmd_volume();                           /* volume setting */
//int     cmd_mark();                                     /* set index marks in text */
int     cmd_error();                            /* set error mode */
int     cmd_phoneme();                          /* set phonemic mode */
//int     cmd_log();                                      /* set event logging */
int     cmd_mode();                                     /* set text interpretations */
int     cmd_punct();                            /* set punctuation interpretations */
//int     cmd_pause();                            /* pause speech output */
//int     cmd_resume();                           /* resume speech output */
int     cmd_sync();                                     /* sync cmd/lts/ph */
int     cmd_flush();                            /* flush all bufered text and commands */
int     cmd_enable();                           /* selective enable of the flush */
int     cmd_dial();                                     /* generate dial tones */
int     cmd_tone();                                     /* generate user tone */
int     cmd_define();                           /* define custom voices */
int     cmd_say();                                      /* how to break up text */
int     cmd_timeout();                          /* when to flush text */
int     cmd_pronounce();                        /* how to say certain things */
//int     cmd_digitized();                        /* switch to digitized mode */
int     cmd_language();                 /* switch to an alternate language */
//int     cmd_remove();                           /* remove a language from the board */
int     cmd_stress();                           /* set typing table stress */
//int     cmd_break();                            /* word bound pauses */
//int     cmd_cpu_rate();                 /* change default clock rates */
//int     cmd_code_page();                        /* change default code page table */
//int     cmd_plang();                            /* show and speak the phonemic alphabet */
int     cmd_setv();                             /* send a stored set of changes */
int   cmd_loadv();            /* load changes to setv */
//int	cmd_vs();		/* special entry for :vs */
#ifdef DTEX
int	cmd_power();				/* battery and power related stuff */
int	cmd_version();				/* say/return version.*/
int	cmd_tsr();			/* [:tsr modes.. */
#endif /*DTEX*/


struct  icomm setv[10] =
{
	"\0",
	"\0",
	"\0",
	"\0",
	"\0",
	"\0",
	"\0",
	"\0",
	"\0",
	"\0"
};


struct  dtpc_command command_table[] = {

	{"rate","d",1,DCS_RATE,cmd_rate},
	{"latin","d",1,DCS_LATIN,cmd_name},
	{"name","a",1,DCS_NAME,cmd_name},
		{"np",0,0,DCS_NAME_PAUL,cmd_name},
		{"nb",0,0,DCS_NAME_BETTY,cmd_name},
		{"nh",0,0,DCS_NAME_HARRY,cmd_name},
		{"nf",0,0,DCS_NAME_FRANK,cmd_name},
		{"nd",0,0,DCS_NAME_DENNIS,cmd_name},
		{"nk",0,0,DCS_NAME_THE_KID,cmd_name},
		{"nu",0,0,DCS_NAME_URSULA,cmd_name},
		{"nr",0,0,DCS_NAME_RITA,cmd_name},
		{"nw",0,0,DCS_NAME_WILLY,cmd_name},
		{"nv",0,0,DCS_NAME_VAL,cmd_name},
	{"comma","d",1,DCS_COMMA,cmd_comma},
	{"cp","d",1,DCS_COMMA,cmd_comma},
	{"period","d",1,DCS_PERIOD,cmd_period},
	{"pp","d",1,DCS_PERIOD,cmd_period},
//	{"volume","ad",2,DCS_VOLUME_SET,cmd_volume},
//		{NULL_COMMAND,0,0,DCS_VOLUME_UP,cmd_volume},
//		{NULL_COMMAND,0,0,DCS_VOLUME_DOWN,cmd_volume},
//	{"vs","d",1,DCS_VOLUME_SET,cmd_vs},
#ifndef NO_INDEXES
	{"index","ad",2,DCS_INDEX,cmd_mark},
		{NULL_COMMAND,0,0,DCS_INDEX_REPLY,cmd_mark},
		{NULL_COMMAND,0,0,DCS_INDEX_QUERY,cmd_mark},
#endif
	{"error","a",1,DCS_ERROR,cmd_error},
	{"phoneme","aaa",3,DCS_PHONEME,cmd_phoneme},
//	{"log","aa",2,DCS_LOG,cmd_log},
	{"mode","aa",2,DCS_MODE,cmd_mode},
	{"say","a",1,DCS_SAY,cmd_say},
	{"punctuation","a",1,DCS_PUNCT,cmd_punct},
//	{"pause","d",1,DCS_PAUSE,cmd_pause},
//	{"resume","",0,DCS_RESUME,cmd_resume},
	{"sync","",0,DCS_SYNC,cmd_sync},
	{"flush","ad",2,DCS_FLUSH,cmd_flush},
	{"enable","",1,DCS_ENABLE,cmd_enable},
#ifndef	SIMULATOR
	{"dial","a",1,DCS_DIAL,cmd_dial},
	{"tone","dd",1,DCS_TONE,cmd_tone},
#endif
//	{"timeout","d",1,DCS_TIMEOUT,cmd_timeout},
	{"pronounce","aa",2,DCS_PRONOUNCE,cmd_pronounce},
//	{"digitized",0,0,DCS_DIGITIZED,cmd_digitized},
//	{"language","a",1,DCS_LANGUAGE,cmd_language},
#ifndef SINGLE_THREADED
//	{"remove","",1,DCS_REMOVE,cmd_remove},
#endif
	{"pitch","d",1,DCS_STRESS,cmd_stress},
	{"define_voice","ad*",2,DCS_DEFINE,cmd_define},
	{"dv","ad*",2,DCS_DEFINE,cmd_define},
//	{"clk_rate","d",1,DCS_CPU_RATE,cmd_cpu_rate},
//	{"code_page","d",1,DCS_CODE_PAGE,cmd_code_page}//,
//	{"plang","d",1,0,cmd_plang},
//	{"break","a",1,DCS_BREAK,cmd_break}//,
//	{"setv","d",1,0,cmd_setv},
//	{"loadv","d",1,0,cmd_loadv}
#ifdef DTEX
	,{"power","ad",2,0,cmd_power},
	{"version","a",1,0,cmd_version}	,
	{"tsr","a",1,0,cmd_tsr}
#endif /*DTEX*/
};

#define         TOTAL_COMMANDS (sizeof(command_table)/sizeof(struct dtpc_command))

unsigned short params[NPARAM];                                    /* array of params built */
unsigned char*  pString[NPARAM];						/* array of pointers to string */
unsigned int defaults[NPARAM];                          /* use default value */
 int param_index;                                               /* current param being worked on */
int format_index;                                               /* current command format specifier */
int     p_count;                                                                                /* chars in this param */
int     p_flag;                                                                         /* negation flag */
int     q_flag;                                                                         /* quote flag */
#ifdef PROTO_BUILD
int     cm[20];                                         /* command match parse array */
#else
int     cm[TOTAL_COMMANDS];                                             /* command match parse array */
#endif
int     total_matches;                                                          /* currently matching buffers */
int     cmd_index;                                                                      /* array index of active command */
unsigned int last_char;                                                 /* last accepted character */
unsigned char string_buff[STRING_MAX];          /* string param array */
int     next_char;                                                                      /* next free character in string buffer */
int     parse_state;                                                            /* current parser state */
int     error_mode;                                                                     /* current error mode */
int     punct_mode;                                                                     /* current punctuation mode */
unsigned int    last_punct;                                             /* last non-strip punctuation */
int     esc_command;                                                            /* command execution via escape code */
//INPUT_SEQ       command_seq,*esc_seq;                   /* input escape sequences */
int     total_commands;                         
int     timeout;                        

#ifdef	SIMULATOR
cmdmain(data_seg,stack_start)
#else
main(data_seg,stack_start)
#endif

unsigned int data_seg;
unsigned int stack_start;
{

#ifdef	SIMULATOR
	printf ("cmdmain: enter\n");
#endif

	total_commands = TOTAL_COMMANDS;
//	esc_seq = &command_seq;
//	SP.type = 0;
	reset_command(STATE_NORMAL);
	KS.phoneme_mode = PHONEME_OFF | PHONEME_SPEAK;
	KS.modeflag=MODE_NAME;
	error_mode = ERROR_ignore;
	punct_mode = PUNCT_some;
	last_punct = 0;
	timeout = 0;
#ifndef	SIMULATOR
	tone_wait = 0;
#endif
	KS.pitch_delta = 35;
	insertflag=0;

#ifndef SINGLE_THREADED
	create_process(dtpc_cmd,2,data_seg,stack_start,0); /* tek 10/31 */
#endif

#ifdef	SIMULATOR
	printf ("cmdmain: exit\n");
#endif
	return(1);
}
#endif
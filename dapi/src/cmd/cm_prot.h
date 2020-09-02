/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2001 Force Computers Inc., a Solectron Company. All rights reserved.
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
 *    File Name:        cm_prot.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *
 *  Rev    	Who     Date            Description
 *  ---    	-----   -----------     --------------------------------------------
 *  001		MGS		04/23/1996		changed a few prototypes
 *									added an MSDOS ifdef            
 *  002		MGS		05/15/1996		Added the parser's prototypes
 *  003		MGS		05/21/1996		removed cm_text_ablook prototype
 *  004		MGS		08/07/1996		Added and changed protos for new_indexing
 *  005		SIK		09/23/1996		Added function declaration for VOCAL codes
 *  005		GL		11/22/1996		Added function declaration for cm_cmd_gender()
 *  006		GL		11/26/1996		Added mode argument for say_string()
 *  007		GL		12/13/1996		Added cm_util_flush_init()
 *  008		GL		04/21/1997		BATS#357  Add the code for __osf__ build
 *									also remove some dummy declaration
 *  009		MGS		03/12/1998		added code for the new binary parser
 *  010		CJL		03/18/1998		Removed specific path for dectalkf.h.
 *  011		gl		03/25/1998		Added cm_cmd_dbgv() function declaration
 *  012		ETT		10/05/1998		added linux code
 *  013		MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 
 *  014		MGS		05/09/2001		Some VxWorks porting BATS#972
 *  015		CAB		05/14/2001		Added Force copyright
 *  015		MGS		06/19/2001		Solaris Port BATS#972
 *  016		MGS		03/20/2002		Single threaded vtm
 *  017		MGS		03/21/2002		Single threaded ph
 *  018		MGS		04/03/2002		Single threaded lts
 *  019		MGS		04/11/2002		ARM7 port
 *	020		CAB		04/30/2002		Condense #ifdef for NEW_BINARY_PARSER
 */
#ifndef CMPROTH
#define CMPROTH 1

#include "dectalkf.h"

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
#include "ttsapi.h"
#endif

#ifdef ARM7
#include "tts.h"
#endif

extern int      cm_cmd_rate(LPTTS_HANDLE_T phTTS);      		/* set the speaking rate */
extern int      cm_cmd_name(LPTTS_HANDLE_T phTTS);              /* change the voice */
extern int      cm_cmd_latin(LPTTS_HANDLE_T phTTS);             /* theta to s */
extern int      cm_cmd_comma(LPTTS_HANDLE_T phTTS);             /* comma pause time */
extern int      cm_cmd_period(LPTTS_HANDLE_T phTTS);            /* period pause time */
extern int      cm_cmd_volume(LPTTS_HANDLE_T phTTS);            /* volume setting */
extern int      cm_cmd_mark(LPTTS_HANDLE_T phTTS);              /* set index marks in text */
extern int      cm_cmd_preamble(LPTTS_HANDLE_T phTTS);              /* set index marks in text */
extern int      cm_cmd_error(LPTTS_HANDLE_T phTTS);             /* set error mode */
extern int      cm_cmd_phoneme(LPTTS_HANDLE_T phTTS);           /* set phonemic mode */
extern int      cm_cmd_log(LPTTS_HANDLE_T phTTS);               /* set event logging */
extern int      cm_cmd_mode(LPTTS_HANDLE_T phTTS);              /* set text interpretations */
extern int      cm_cmd_punct(LPTTS_HANDLE_T phTTS);             /* set punctuation interpretations */
extern int      cm_cmd_skip(LPTTS_HANDLE_T phTTS);              /* set skip interpretations */
extern int      cm_cmd_pause(LPTTS_HANDLE_T phTTS);             /* pause speech output */
extern int      cm_cmd_play(LPTTS_HANDLE_T phTTS);              /* play a wave file */
extern int      cm_cmd_resume(LPTTS_HANDLE_T phTTS);            /* resume speech output */
extern int      cm_cmd_sync(LPTTS_HANDLE_T phTTS);              /* sync cmd/lts/ph */
extern int      cm_cmd_flush(LPTTS_HANDLE_T phTTS);             /* flush all bufered text and commands */
extern int      cm_cmd_enable(PKSD_T pKsd_t);                   /* selective enable of the flush */
extern int      cm_cmd_dial(LPTTS_HANDLE_T phTTS);              /* generate dial tones */
extern int      cm_cmd_tone(LPTTS_HANDLE_T phTTS);              /* generate user tone */
extern int      cm_cmd_define(LPTTS_HANDLE_T phTTS);            /* define custom voices */
extern int      cm_cmd_say(LPTTS_HANDLE_T phTTS);               /* how to break up text */
extern int      cm_cmd_timeout(LPTTS_HANDLE_T phTTS);           /* when to flush text */
extern int      cm_cmd_pronounce(LPTTS_HANDLE_T phTTS);         /* how to say certain things */
extern int      cm_cmd_digitized(LPTTS_HANDLE_T phTTS);         /* switch to digitized mode */
extern int      cm_cmd_language(LPTTS_HANDLE_T phTTS);          /* switch to an alternate language */
extern int      cm_cmd_remove(PKSD_T pKsd_t);                   /* remove a language from the board */
extern int      cm_cmd_stress(LPTTS_HANDLE_T phTTS);            /* set typing table stress */
extern int      cm_cmd_break(LPTTS_HANDLE_T phTTS);             /* word bound pauses */
extern int      cm_cmd_cpu_rate(LPTTS_HANDLE_T phTTS);          /* change default clock rates */
extern int      cm_cmd_code_page(LPTTS_HANDLE_T phTTS);         /* change default code page table */
extern int      cm_cmd_plang(LPTTS_HANDLE_T phTTS);             /* show and speak the phonemic alphabet */
extern int      cm_cmd_debug(LPTTS_HANDLE_T phTTS);             /* debug command */
extern int      cm_cmd_gender(LPTTS_HANDLE_T phTTS);            /* gender command */
extern int      cm_cmd_gender(LPTTS_HANDLE_T phTTS);            /* gender command */

#ifdef DBGV_ON
extern int      cm_cmd_dbgv(LPTTS_HANDLE_T phTTS);              /* dbgv command */
#endif

extern int      cm_cmd_setv(LPTTS_HANDLE_T phTTS);              /* send a stored set of changes */
extern int      cm_cmd_loadv(LPTTS_HANDLE_T phTTS);             /* load changes to setv */  
extern int      cm_cmd_vs(LPTTS_HANDLE_T phTTS);                /* special entry for :vs */

#ifdef DTEX
extern int      cm_cmd_power(LPTTS_HANDLE_T phTTS);          /* battery and power related stuff */
extern int      cm_cmd_version(LPTTS_HANDLE_T phTTS);        /* say/return version.*/
extern int      cm_cmd_tsr(LPTTS_HANDLE_T phTTS);            /* [:tsr modes.. */
#endif /*DTEX*/

#ifndef MSDOS
extern  int OpenLogFile(LPTTS_HANDLE_T phTTS);
extern  void CloseLogFile(LPTTS_HANDLE_T phTTS);
void StereoVolumeControl( LPTTS_HANDLE_T,int, int, BOOL, BOOL );
void SetStereoVolume( LPTTS_HANDLE_T,int, int );
#endif

extern void cm_util_flush_init(LPTTS_HANDLE_T phTTS);
extern void cm_util_initialize(LPTTS_HANDLE_T phTTS);
extern void cm_util_init_type(PKSD_T pKsd_t);

#ifdef DTEX
extern void cm_util_say_string(PKSD_T pKsd_t, unsigned char _far *instr, short mode);
#endif

extern int 	cm_util_dtpc_tones(LPTTS_HANDLE_T phTTS,
				 			  unsigned int key,
				 			  unsigned int iFrequency,
				 			  unsigned int iDuration);
extern int 	cm_util_dtpc_tones_reset(LPTTS_HANDLE_T phTTS);
extern void cm_util_type_out(LPTTS_HANDLE_T phTTS, unsigned int c);
extern int 	cm_util_string_match(const unsigned char *sa[],unsigned char *s);

#ifndef SINGLE_THREADED
extern void cm_util_write_pipe(PKSD_T pKsd_t,P_PIPE kinp, short *phone, short count);
#endif

extern unsigned long get_clock(void);                                   
extern int 	cm_pars_icommand(PCMD_T pCmd_t);

#ifdef MSDOS
extern void _far cm_pars_loop(void);
#else
extern void _far cm_pars_loop(LPTTS_HANDLE_T phTTS);
#endif

#ifdef VOCAL
void cm_pars_proc_char(LPTTS_HANDLE_T phTTS,unsigned int c, 
						char *cbuf,int *cbufcnt,
						int *pcnt,int *isAdigit,
						int *sndtel,int *modechng,
						int *posord, char laschar);
extern void cm_util_sendit(LPTTS_HANDLE_T phTTS,char cbuf[], int *cbufcnt,
					int *sndtel,int *modechng,int posord, char laschar);
extern int cm_util_sendat(LPTTS_HANDLE_T phTTS,char cbuf[],
				  int *cbufcnt,int *pcnt,
				  int *isAdigit,int *sndtel,
				  int *modechng,int posord, char laschar);						
#else
extern void cm_pars_proc_char(LPTTS_HANDLE_T phTTS,
							  unsigned short c);
#endif /* end of #ifndef VOCAL */

extern void cm_pars_new_state(PCMD_T pCmd_t, int state);
extern unsigned int cm_pars_getseq(LPTTS_HANDLE_T phTTS);
extern void cm_cmd_match_comm(LPTTS_HANDLE_T phTTS, unsigned int c);
extern void cm_cmd_do_command(LPTTS_HANDLE_T phTTS, unsigned int new_state);
extern void cm_cmd_build_param(LPTTS_HANDLE_T phTTS, unsigned int c);
extern void cm_cmd_reset_comm(PCMD_T pCmd_t, unsigned int state);
extern void cm_cmd_error_comm(LPTTS_HANDLE_T phTTS, int type);
extern int  cm_phon_lookup_asc(LPTTS_HANDLE_T phTTS, unsigned int ph);
extern int 	cm_phon_lookup_arpa(LPTTS_HANDLE_T phTTS, unsigned int ph1, unsigned int ph2);
extern int 	cm_phon_param_check(LPTTS_HANDLE_T phTTS, unsigned int c);
extern void cm_phon_flush(LPTTS_HANDLE_T phTTS);
extern void cm_phon_match(LPTTS_HANDLE_T phTTS, unsigned int c);
extern int 	cm_cmd_sync(LPTTS_HANDLE_T phTTS); 
extern void cm_text_getclause(LPTTS_HANDLE_T phTTS);

#ifdef MSDOS
extern int 	OutputCharacter( unsigned char c );
#else
extern void OutputCharacter( LPTTS_HANDLE_T phTTS,unsigned char c );
#endif

#if defined (WIN32) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
extern  void save_index(PKSD_T pKsd_t,unsigned int sym,unsigned int type,unsigned int value,unsigned int how);
/* 
 * MVP : This function is used only in PH subsystem
 * extern  void check_index(unsigned int which_phone);
 */
extern  void send_index(int how, int value );
extern  void start_flush(int serial_mode);
extern  void reset_spc(void);
extern  void default_lang(PKSD_T pKsd_t,unsigned int lang_code,unsigned int ready_code);
extern  void flush_done(PKSD_T pKsd_t);
extern  void set_gpio( int );
extern  void clr_gpio( int );

#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
extern  int putseq(struct SEQ_struct __far *sp);
#endif

extern  int putn(unsigned int n);
extern  int puthex(unsigned int n);

#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
extern  int putstring(char *str);
#endif
#endif //defined (WIN32) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

#ifdef NEW_BINARY_PARSER
preturn_value_t par_process_input(LPTTS_HANDLE_T phTTS,
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
__inline void par_copy_index(pindex_data_t dest_index,
					int		  dest_pos,
					pindex_data_t src_index,
					int		  src_pos);
__inline void par_copy_index_list(pindex_data_t dest_index,
						 int		   dest_pos,
						 pindex_data_t src_index,
						 int		   src_pos,
						 int		   length);
__inline int par_is_index_set(pindex_data_t indexes,
					   int pos);

#else
preturn_value_t par_process_input(LPTTS_HANDLE_T phTTS,
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
#endif // NEW_BINARY_PARSER

//  MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 
int _far par_dict_lookup(PKSD_T pKsd_t,  char *word,int in_flag);
int par_dict_dlook(PKSD_T pKsd_t,
		   		   long index,
		   		   int *hit_type,
		   		   struct dic_entry far **ppent,
		   		   char *word);
int par_dict_find_word(PKSD_T pKsd_t,
		       		   char *word,
		       		   int *hit_type);
int par_dict_dlook(PKSD_T pKsd_t,
		   		   long index,
		   		   int *hit_type,
		   		   struct dic_entry far **ppent,
		   		   char *word);
int par_dict_where_to_look(struct dic_entry far *pent,
			   			   char *word);


#ifdef SINGLE_THREADED
#ifndef EPSON_ARM7
int vtm_loop(LPTTS_HANDLE_T phTTS,unsigned short *input);
void ph_loop(LPTTS_HANDLE_T phTTS,unsigned short *input);
#endif
void lts_loop(LPTTS_HANDLE_T phTTS,unsigned short *input);
#endif

#ifdef EPSON_ARM7
extern void fill_TTP_buffer(LPTTS_HANDLE_T phTTS,short *phone,int count);
#endif


#endif // CMPROTH

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
 *    File Name:		dtt_prot.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest function prototype file
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	initial release
 *  002     G.L		09/16/1996  code cleanup.
 *  003		MFG		04/06/1998  added dtt_diff_diffBlocks() function call
 *  004		MFG		07/13/1998  added dtt_util_mkdir() function call
 *
 */

#ifndef DDTPROT
#define DDTPROT

extern	void test(void );
extern	void install(int modnum);
extern	int sendb(unsigned char *thebuf,int count,int modnum);
extern	int send_char(unsigned char schar,int modnum);
extern	unsigned char get_char(unsigned char schar,int modnum);
extern	int getb(unsigned char *thebuf,int modnum);
extern	int flush(int modnum);
extern	int dtstart(int argc1,unsigned char **argv1 );
extern	void dtdemo(int argc1,unsigned char **argv1 );
extern	int index(void);
extern	int sendfil(struct _iobuf *ptr);
extern	int sayit(int bsize,unsigned int *outj);
extern	int get_index(void);
extern	int resume(void );
extern	int stopit(void );
extern	int flush_char(unsigned char fchar);
extern	int gt_stat(int dtport);
extern	unsigned char gtdch(int);
extern	int io_prior(void );
extern	int up_vol(void );
extern	int status(void );
extern	int dwn_vol(void );
extern	int set_vol(int vol);
extern	int dtpc_cmd(int cmd,int value);
extern	int play_wave(void );
extern	void play_sb(void );
extern	unsigned char get_byte(void );
extern	void pack_buff(void );
extern	void zero_buff(unsigned int pcount);
extern	void send_frame(void );
extern int create_test_entry_dst(TEST_ENTRY **test_entry, COMMAND_STRING **st_cmd_ptr);
extern int dtt_input_check_casename(TEST_ENTRY *test_entry);
extern void dtt_input_dump_test_seq(TEST_ENTRY *test_entry);
extern int create_bg_dst(TEST_GROUP **group, COMMAND_STRING **g_cmd_ptr);
extern int create_sg_dst(TEST_GROUP **group, COMMAND_STRING **g_cmd_ptr);
extern int create_case_dst(TEST_CASE **case_p, COMMAND_STRING **case_cmd_ptr);
extern int create_req_dst(TEST_REQUEST **req, COMMAND_STRING **req_cmd_ptr);
extern int create_command_dst(COMMAND_STRING **p, char ch_p[][FILENAMESIZE]);
extern int is_file_name(unsigned char *cptr);
extern void install(int modnum);
extern int sendb(unsigned char *thebuf,int count, int modnum);
extern int send_char(unsigned char schar, int modnum);                                                         
extern int declisten();
extern unsigned char gtdch(int dt);
extern int clean();
extern int read_input_file(FILE *fptr, char buff[][FILENAMESIZE]);
extern int read_bg_file(FILE *bg_fptr, char bg_stuff[][FILENAMESIZE], char sg_stuff[][FILENAMESIZE]);
extern int read_sg_file(FILE *sg_fptr, char sg_stuff[][FILENAMESIZE], char case_stuff[][FILENAMESIZE]);
extern int read_case_file(FILE *case_fptr, char case_stuff[][FILENAMESIZE], char req_stuff[][FILENAMESIZE]);
extern int read_req_file(FILE *req_fptr, char req_stuff[][FILENAMESIZE], char txt_stuff[]);
extern int dectalk(unsigned char *s_ptr, FILE *output_fp);
extern FILE *open_input_file(char *char_ptr);
extern int dtt_in(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_out(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_process(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_build_test_seq(char bg_stuff[][FILENAMESIZE], COMMAND_STRING *bg_cmd_ptr, TEST_ENTRY *test_entry);
extern int dtt_input_show(TEST_ENTRY *test_entry);
extern int dtt_pro_execute(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_int_dectalk(char *send_ptr, char *receive_ptr, FILE *flogptr, char speak_enable[FILENAMESIZE]);
extern int dtt_pro_compare(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_pro_check_bat(char *send_ptr); //mfg
extern int dtt_output_review(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_output_update(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_output_remove(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int read_input_string(FILE *fptr, char buff[]);
extern int dtt_pro_result(char bg_stuff[][FILENAMESIZE], TEST_ENTRY *test_entry);
extern int dtt_exit(FILE *fptr, char *func_name, int value, char *message);
extern char *dtt_util_file_compare(char *case_name,short mode);
extern int dtt_int_send_data(char *s_ptr);
extern int dtt_int_receive_data(char *s_ptr);
void dtt_int_cleanup(short mode);
void dtt_util_mkdir(void);
extern int dtt_diff_diffBlocks(char *chk_file_name);
#endif

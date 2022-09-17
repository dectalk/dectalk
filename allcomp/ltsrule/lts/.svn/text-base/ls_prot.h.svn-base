/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996,1997. All rights reserved.    
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
 *    File Name:    ls_prot.h
 *    Author:       Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *  Rev Who     Date            Description                    
 *  --- -----   --------        ---------------------------------------
 *  001 MGS		02/08/1996		Renamed from ltsp.h    
 *  002 MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 *  003 jdb		06/12/1996		added spanish prototypes, if-def'd english
 *  004 GL		11/15/1996		add un_flag as the argument for Spanish do_group()
 *								pass TRUE if want "1 --> uno"
 *  005 GL		11/19/1996		add eflag as the argument for German do_digit_group()
 * 								pass TRUE if want "1 --> eine"
 *  006 GL		11/20/1996		add zflag as the argument for German do_2_digits()
 *								pass TRUE if want "0" in "0x" to spell
 *  007 GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *  008 MGS		07/22/1997		BATS#412  fixed ½ and ¼ problem 
 *  009	MGS		08/20/1997		Added kerzweil code for first word vowels stressing
 *  010 DR 		09/30/1997		UK BUILD:ADDED UK STUFF
 *  011	GL		10/01/1997		add one more argument for ufind_word() and
 *								user_dict_look()
 *  012	GL		04/28/1998		for BATS#659, add the argument offset to find_word() and ufind_word
 *								and user_dict_look()
 *  013 ETT		10/05/1998		Added Linux code.
 *  014	NAL		05/24/2000		Fixed function defs
 *  015 CHJ		07/20/2000		French added
 *  016 CAB		10/18/2000		Changed copyright info
 *  017	MGS		12/18/2000		add for german ae oe ue processing to umlated vowels after dic search
 *  018	MGS		02/28/2001		Changed for linux build
 *  019 CAB		03/01/2001		Updated copyright info.
 *  019	MGS		03/13/2001		Fixed inserting + in a rule
 *  020	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  021 CAB		05/14/2001		Fixed copyright
 *  022	MGS		06/19/2001		Solaris Port BATS#972
 *  023	MGS		02/25/2002		New LTS parsing stuff
 *  024	MGS		03/21/2002		Single threaded ph
 *  025	MGS		04/03/2002		Single threaded lts
 *  021	MGS		04/11/2002		ARM7 port
 *  022	CAB		04/24/2002		Fixed warnings for ls_task_wlookup variable to unsigned char
 *								Condense #if
 *	023	CAB		08/15/2002		Removed warnings changed parameter in ls_dict_find_word() to int
 *  024	MGS		08/28/2002		Fixed double speaking of user dictionary words
 */

#ifndef LS_PROT_H
#define LS_PROT_H

#ifdef SPANISH_SP
extern  struct PHONE *l_sp_ad1_syll(PLTS_T pLts_t, struct PHONE *wordp, struct PHONE *endp);
extern  int l_sp_ad1_syllword(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *wend);
extern  struct PHONE *l_sp_ad1_dosyllable(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp, int isfinal);
extern  struct PHONE *l_sp_ad1_fin_coda(struct PHONE *wstart, struct PHONE *endp);
extern  struct PHONE *l_sp_ad1_int_coda(struct PHONE *wstart, struct PHONE *endp);
extern  struct PHONE *l_sp_ad1_nucleus(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp, int isfinal);
extern  struct PHONE *l_sp_ad1_onset(struct PHONE *wstart, struct PHONE *endp);
extern  int l_sp_ad1_sonset(struct PHONE *lsp);
extern  struct PHONE *l_sp_ad1_wordstart(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp);
extern  void l_sp_ad1_stress(struct PHONE *wstart, struct PHONE *wend, int syllcount);
#endif
#ifdef SPANISH_LA
extern  struct PHONE *l_la_ad1_syll(PLTS_T pLts_t, struct PHONE *wordp, struct PHONE *endp);
extern  int l_la_ad1_syllword(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *wend);
extern  struct PHONE *l_la_ad1_dosyllable(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp, int isfinal);
extern  struct PHONE *l_la_ad1_fin_coda(struct PHONE *wstart, struct PHONE *endp);
extern  struct PHONE *l_la_ad1_int_coda(struct PHONE *wstart, struct PHONE *endp);
extern  struct PHONE *l_la_ad1_nucleus(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp, int isfinal);
extern  struct PHONE *l_la_ad1_onset(struct PHONE *wstart, struct PHONE *endp);
extern  int l_la_ad1_sonset(struct PHONE *lsp);
extern  struct PHONE *l_la_ad1_wordstart(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp);
extern  void l_la_ad1_stress(struct PHONE *wstart, struct PHONE *wend, int syllcount);
#endif
#ifdef ITALIAN
extern  struct PHONE *l_it_ad1_syll(PLTS_T pLts_t, struct PHONE *wordp, struct PHONE *endp);
extern  int l_it_ad1_syllword(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *wend);
extern  struct PHONE *l_it_ad1_dosyllable(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp, int isfinal);
extern  struct PHONE *l_it_ad1_fin_coda(struct PHONE *wstart, struct PHONE *endp);
extern  struct PHONE *l_it_ad1_int_coda(struct PHONE *wstart, struct PHONE *endp);
extern  struct PHONE *l_it_ad1_nucleus(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp, int isfinal);
extern  struct PHONE *l_it_ad1_onset(struct PHONE *wstart, struct PHONE *endp);
extern  int l_it_ad1_sonset(struct PHONE *lsp);
extern  struct PHONE *l_it_ad1_wordstart(PLTS_T pLts_t, struct PHONE *wstart, struct PHONE *endp);
extern  void l_it_ad1_stress(struct PHONE *wstart, struct PHONE *wend, int syllcount);

#endif


/* GL 04/21/1997  change this for OSF build */
#ifdef MSDOS
extern int main(unsigned int data_seg, unsigned int stack_start);
#endif

extern PHONE *ls_rule_delete(PLTS_T pLts_t, PHONE *lsp);
extern void ls_rule_do_lts(LPTTS_HANDLE_T phTTS, LETTER *lp2, LETTER *lp1);
extern int ls_util_is_name(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined _UNIX_LIKE_ || defined ARM7
extern  void ls_task_main(LPTTS_HANDLE_T phTTS);
#endif

#ifdef MSDOS
extern  void __far ls_task_main(void);
#endif

extern  void ls_proc_do_sign(LPTTS_HANDLE_T phTTS, int sign);
extern  void ls_proc_do_part_number(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);

#ifndef FRENCH
extern  void ls_rule_lts(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, int def_lang, int sel_lang);
#else
extern void ls_rule_lts(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, FLAG ContD);
#endif

#if defined (ENGLISH) || defined (GERMAN)
extern  void ls_rule_lts_out(LPTTS_HANDLE_T phTTS);
#endif

#ifdef SPANISH
extern void ls_rule_lts_out(LPTTS_HANDLE_T phTTS, PHONE *lsp, PHONE *endp, int context);
#endif

extern  int ls_rule_add_graph(PLTS_T pLts_t, GRAPH *gp, int g, int insert);
extern  int ls_util_is_vowel(int g);
extern  GRAPH *ls_rule_rule_match(LPTTS_HANDLE_T phTTS, GRAPH *gp1, int def_lang, int sel_lang);
extern  GRAPH *ls_rule_env_match(PLTS_T pLts_t, int ep1, GRAPH *gp, int d);
extern  void ls_rule_add_phone(PLTS_T pLts_t, int sph, int uph);
extern  PHONE *ls_rule_phone_alloc(PLTS_T pLts_t);
extern  void ls_rule_phone_free(PLTS_T pLts_t,PHONE *pp);
extern  void ls_rule_delete_geminate_pairs(PLTS_T pLts_t);
extern  void ls_adju_sylables(PHONE *fpp, PHONE *lpp);
extern  int ls_adju_is_voc(PHONE *pp);
extern  void ls_adju_stress(LPTTS_HANDLE_T phTTS, PHONE *fpp, PHONE *lpp, int pstype, int sel_lang);

#ifdef ENGLISH
extern  int ls_adju_unstressed(PLTS_T pLts_t, int n);
extern  int ls_adju_is_cons(PHONE *pp);
extern  int ls_adju_cluster(int f, int s);
extern  int ls_adju_suffixscan(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp);
extern  int ls_adju_prefixscan(LPTTS_HANDLE_T phTTS, PHONE *fpp, PHONE *lpp, int lang_tag);
extern  int ls_adju_is_obs(PHONE *pp);
extern  int ls_adju_ins_phone(PLTS_T pLts_t, PHONE *fpp, int sph, int uph, int stress);
#endif // ENGLISH

extern  void ls_adju_bestdefault(PLTS_T pLts_t);
extern  void ls_adju_best2syl(PLTS_T pLts_t);
extern  void ls_adju_final_fixes(PLTS_T pLts_t);
extern  void ls_adju_allo1(PLTS_T pLts_t, PHONE *fpp, PHONE *lpp);
extern  void ls_adju_allo2(PLTS_T pLts_t);
extern  void ls_adju_delgemphone(PLTS_T pLts_t, PHONE *pp, int ph);
extern  void ls_adju_del_phone(PLTS_T pLts_t, PHONE *dpp);
extern  int  ls_util_lookup(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, int context);
extern  void ls_util_pluralize(LPTTS_HANDLE_T phTTS);
extern  int  ls_suff_suffix_find(LPTTS_HANDLE_T phTTS, unsigned char __far *str_end, short which_dic);
extern  void ls_suff_append_pron(LPTTS_HANDLE_T phTTS, unsigned char __far *pb);
extern  void ls_suff_print_fc(LPTTS_HANDLE_T phTTS);
extern  int  ls_spel_say_it(LETTER *llp, LETTER *rlp);
extern  int  ls_math_do_math(PKSD_T pKsd_t, unsigned char check_char);
extern  void ls_math_flush_ascky(PKSD_T pKsd_t, unsigned char *str);
extern  void ls_proc_do_group(LPTTS_HANDLE_T phTTS, unsigned char buf[3], int oflag, int pflag, int un_flag);
extern  int  ls_dict_blook(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, int type);

extern  int ls_dict_ufind_word(LPTTS_HANDLE_T phTTS, short abbr, short nosend);
extern  int ls_dict_user_dict_look(LPTTS_HANDLE_T phTTS, long uindex, short abbr, short nosend);

// CAB 08/15/2002	Removed warnings changed to int
extern  int ls_dict_find_word(LPTTS_HANDLE_T phTTS, int nosend);

extern  int ls_dict_dlook(LPTTS_HANDLE_T phTTS, long index, int *pLocaloff, struct dic_entry far **ppent);
extern  int ls_dict_where_to_look(LPTTS_HANDLE_T phTTS, struct dic_entry far *pent);
extern  int ls_dict_where_to_ulook(PLTS_T pLts_t, char __far *ent);
extern  struct dic_entry __far *ls_homo_homo(LPTTS_HANDLE_T phTTS, long index);
extern  void ls_util_send_phone_list(LPTTS_HANDLE_T phTTS, const char *pp);
extern  void ls_util_send_phone(LPTTS_HANDLE_T phTTS, int ph);
extern  void ls_spel_spell(LPTTS_HANDLE_T phTTS,LETTER *lp1, LETTER *lp2);

#if defined (ENGLISH) || defined SPANISH || defined ITALIAN
extern  void ls_proc_do_2_digits(LPTTS_HANDLE_T phTTS, LETTER *lp);
#endif

#ifdef GERMAN
extern  void ls_proc_do_2_digits(LPTTS_HANDLE_T phTTS, LETTER *lp, int zflag);
#endif

#ifdef FRENCH
extern void ls_proc_do_2_digits(LPTTS_HANDLE_T phTTS, LETTER *lp, FLAG sp, FLAG masc);
extern void ls_proc_do_3_digits(LPTTS_HANDLE_T phTTS, LETTER *lp, FLAG sp, FLAG masc);
extern void ls_proc_do_4_digits(LPTTS_HANDLE_T phTTS, LETTER *lp, FLAG sp, FLAG masc);
#else
extern void ls_proc_do_4_digits(LPTTS_HANDLE_T phTTS, LETTER *lp);
#endif // FRENCH

#if defined (ENGLISH) || defined (GERMAN) || defined (SPANISH) || defined (ITALIAN)
extern void ls_proc_do_3_digits(LPTTS_HANDLE_T phTTS, LETTER *lp);
#endif

#if defined (ENGLISH) || defined (FRENCH)
extern void ls_proc_do_digit_group(LPTTS_HANDLE_T phTTS, unsigned char buf[3], int oflag);
#endif

#ifdef GERMAN
extern void ls_proc_do_digit_group(LPTTS_HANDLE_T phTTS, unsigned char buf[3], int oflag, int eflag);
#endif

extern  int    ls_proc_is_a_part(int c);
extern  int    ls_spel_spell_speed(LETTER *llp, LETTER *rlp);
extern  int    ls_proc_non_zero(char *p, int n);
extern  void   ls_util_write_item(LPTTS_HANDLE_T phTTS);
extern  void   ls_util_read_item(LPTTS_HANDLE_T phTTS);
extern  void   ls_task_readword(LPTTS_HANDLE_T phTTS, LETTER word[]);
extern  int    ls_util_is_dot(PLTS_T pLts_t);
extern  int    ls_util_is_clause(PLTS_T pLts_t);
extern  int    ls_util_is_white(ITEM *ip);
extern  int    ls_proc_do_number(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp, int oflag);
extern  int    ls_util_is_index(ITEM *ip);
extern  int    ls_util_is_might(LPTTS_HANDLE_T phTTS);
extern  void   ls_util_copyword(LETTER *tlp, LETTER *flp);
extern  int    ls_util_is_year(LETTER *llp, LETTER *rlp);
extern  int    ls_util_is_ordinal(LPTTS_HANDLE_T phTTS, NUM *np);
extern  void   ls_util_next_item(LPTTS_HANDLE_T phTTS);
extern  int    ls_proc_is_frac(LETTER *llp, LETTER *rlp);
extern  void   ls_proc_do_frac(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp);
extern  void   ls_proc_do_date(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp);
extern  int    ls_proc_is_date(LETTER *llp, LETTER *rlp);
extern  void   ls_proc_do_time(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp);
extern  int    ls_proc_is_am_pm(LETTER *llp, LETTER *rlp);
extern  int    ls_proc_is_time(PLTS_T pLts_t,LETTER *llp, LETTER *rlp);
extern  LETTER *ls_task_parse_number(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp, NUM *np);

// CAB 04/24/2002 Changed char to unsigned char due to warnings
extern  char *ls_task_wlookup(PLTS_T pLts_t, LETTER word[], unsigned char table[]);

extern char *ls_task_prelookup(PLTS_T pLts_t, LETTER word[], int *count, char table[]);
extern void ls_task_lookahead(PLTS_T pLts_t);
extern void ls_task_do_right_punct(LPTTS_HANDLE_T phTTS, int flag);
extern void ls_util_dump_lsp_endp(short type, PHONE *lsp, PHONE *endp, char *message);
extern void ls_util_dump_llp_rlp(LETTER *llp, LETTER *rlp, char *message);
extern void ls_util_dump_cword(LETTER word[], char *message);
extern void ls_task_spell_word(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp); 
extern void ls_task_read_next_word(LPTTS_HANDLE_T phTTS);
extern int  ls_task_set_what_state(LPTTS_HANDLE_T phTTS, PLTS_T pLts_t);
extern void ls_task_find_end_of_word(LETTER *llp, LETTER **rlp, LETTER **elp);
extern int  ls_task_spell_mode(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern int  ls_task_minidic_search(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern int  ls_task_math_mode(PKSD_T pKsd_t, LETTER *llp, LETTER *rlp);
extern int  ls_task_dictionary_search(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern void ls_task_strip_left_punctuation(PLTS_T pLts_t, LETTER **llp, LETTER *rlp);
extern void ls_task_strip_right_punctuation(PLTS_T pLts_t, LETTER *llp, LETTER **rlp);
extern int  ls_task_spell_all_punct(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, LETTER *lp1, LETTER *lp2);
extern int  ls_task_dictionary_after_punct(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER **rlp);
extern int  ls_task_spell_vs_speak(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern int  ls_task_single_letter_spell_rules(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern void ls_task_remove_case(LETTER *llp, LETTER *rlp);

#ifdef ENGLISH // NAL warning removal
extern  int ls_task_Dr_St_process(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
#endif

extern  int ls_task_set_sign_flag(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, LETTER **lp1);

#ifndef FRENCH
extern  int ls_task_currency_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
#else
extern int ls_task_currency_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *lp1, LETTER *rlp);
extern void ls_task_categ_gram(LPTTS_HANDLE_T phTTS);
#endif

extern int  ls_task_date_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern int  ls_task_frac_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern int  ls_task_plain_number_processing(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp, LETTER *lp1);
extern int  ls_task_part_number(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern int  ls_task_process_word(LPTTS_HANDLE_T phTTS, LETTER *llp, LETTER *rlp);
extern void ls_util_lts_init( PLTS_T pLts_t, PKSD_T pKsd_t);
#ifdef _DEBUG
extern void f_fprintf(char *str);
#endif
extern void ls_util_write_pipe(PKSD_T pKsd_t, short *phone, short count);
extern int  ls_task_lookup_first_verbs(LPTTS_HANDLE_T phTTS);
//extern int  ls_task_fix_german_vowels(PLTS_T pLts_t, LETTER *llp, LETTER **rlp);

#ifdef NEW_LTS
void ls_task_read_sentence(LPTTS_HANDLE_T phTTS);
#endif

#ifdef SINGLE_THREADED
#ifndef EPSON_ARM7
void ph_loop(LPTTS_HANDLE_T phTTS,unsigned short *input);
#endif
void lts_loop(LPTTS_HANDLE_T phTTS,unsigned short *input);
void lts_main_loop(LPTTS_HANDLE_T phTTS);
int ls_util_next_item_new(LPTTS_HANDLE_T phTTS, short *local_buf);
#endif

#ifdef EPSON_ARM7
extern void fill_TTP_buffer(LPTTS_HANDLE_T phTTS,short *phone,int count);
#endif

#ifdef ARM7
int lts_main(LPTTS_HANDLE_T phTTS);
#endif

extern void ls_util_send_asky_phone_list(LPTTS_HANDLE_T phTTS, const char *pp);


#endif // LS_PROT_H

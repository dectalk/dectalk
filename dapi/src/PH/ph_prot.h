/***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:	ph_prot.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------
 * 001	SIK		07/18/1996  	Cleaning up and maintenance 
 * 002	GL		04/21/1997		BATS#357  Add the code for __osf__ build 
 *                              also fix some error declaration.
 * 003	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 004	GL		03/25/1998		Added DBGV command for PH debug variable passing
 *								For BATS#639 to change phinton() to use argument phTTS instead of pDph_t
 * 005  ETT		10/05/1998      Added Linux code.
 */

/* GL 04/21/1997  add this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__)
#include "tts.h"
#endif

#ifdef MSDOS
extern int vol_up (int count);
extern int vol_down (int count);
extern int vol_set (int count);
#endif


#ifdef MSDOS
extern void check_index (unsigned int which_phone);
extern void adjust_index (unsigned int which, int direction, int del);
extern void adjust_allo (unsigned int which, int direction);

#else
extern void *spcget (unsigned short spc_type);
extern int  spcwrite (PKSD_T pKsd_t, unsigned short __far * spc_data);
extern void save_index (PKSD_T pKsd_t, unsigned int sym, unsigned int type, unsigned int value, unsigned int how);
extern void check_index (PKSD_T pKsd_t, unsigned int which_phone);
extern void adjust_index (PKSD_T pKsd_t, unsigned int which, int direction, int del);
extern void adjust_allo (PKSD_T pKsd_t, unsigned int which, int direction);
extern void send_index(int how, int value );
#endif

#ifdef DTEX
extern void start_flush (int serial_mode);
#else
extern void start_flush (int serial_mode);
#endif

#ifdef MSDOS
extern int reset_spc (void);
#endif 

/* GL 04/21/1997  change this for OSF build */
#ifdef MSDOS
        extern void default_lang (unsigned int lang_code, unsigned int ready_code);
		extern void flush_done (void);
#else
        extern void default_lang (PKSD_T pKsd_t, unsigned int lang_code, unsigned int ready_code);
		extern void flush_done (PKSD_T pKsd_t);
#endif

extern int  putseq (SEQ __far * sp);
extern int  putn (unsigned int n);
extern int  puthex (unsigned int n);
#ifndef __linux__
extern int  putstring (unsigned char *str);
#endif

#ifdef MSDOS
extern unsigned int     getc (void);
extern void             putc (unsigned int c);

#endif
/* MVP Added prototype of dologphoneme here as it is used only in PH sub-system */

#ifdef MSDOS
extern void dologphoneme (short phone, short dur, short f0);
extern void logclaus (short *sym, short nsym, short *ud, short *uf0);
extern void logitem (register short *buf);
#else
extern void dologphoneme (LPTTS_HANDLE_T phTTS, short phone, short dur, short f0);
extern void logclaus (LPTTS_HANDLE_T phTTS, short *sym, short nsym, short *ud, short *uf0);
extern void logitem (LPTTS_HANDLE_T phTTS, register short *buf);
#endif 
extern void phalloph (LPTTS_HANDLE_T phTTS);

extern void             prphonol (void);
extern void             phclause (LPTTS_HANDLE_T phTTS);
extern void             init_phclause (PDPH_T pDph_t);

extern void             phdraw (LPTTS_HANDLE_T phTTS);
extern void             pht0draw (LPTTS_HANDLE_T phTTS);

/* GL 03/25/1998,  BATS#639 use phTTS argument instead of pDph_t */
extern void             phinton (LPTTS_HANDLE_T phTTS);

extern int              firstfeature (short FEA1, short FEA2, short nseg);

extern void logscrewup (short phocur, short *inputscrewup);

#ifdef MSDOS
extern int main (unsigned int data_seg, unsigned int stack_start);
#endif

#ifdef MSDOS
void far kltask (void);
#else
void far kltask (LPTTS_HANDLE_T phTTS);
#endif

extern int deadstop (int value, int low, int high);
extern int mstofr (int nms);
extern void phsettar (LPTTS_HANDLE_T phTTS);
extern void debugforward (char *message, PARAMETER * nparameter);
extern void debugbackward (char *message, PARAMETER * nparameter);


extern void  debug1 (void);
extern int   phsort (LPTTS_HANDLE_T phTTS);
extern short phcluster (short f, short s);


extern void  phtiming (LPTTS_HANDLE_T phTTS);

extern void  prdurs (PDPH_T pDph_t, short phocur, short durinh, short durmin, short deldur, short prcnt, int n);
extern void  prphdurs (PDPH_T pDph_t);
extern void  setparam (LPTTS_HANDLE_T phTTS, int which, int value);
extern void  usevoice (LPTTS_HANDLE_T phTTS, int voice);
extern void  saveval (PDPH_T pDph_t);
extern void  setspdef (LPTTS_HANDLE_T phTTS);
extern short syl_find_vowel (short *ph);
extern short syl_find_cons (short *ph);
extern void  logsyllable (LPTTS_HANDLE_T phTTS);
extern void  saysyllable (LPTTS_HANDLE_T phTTS);
#ifdef GERMAN
	extern void german_syntax (PDPH_T pDph_t);

#endif




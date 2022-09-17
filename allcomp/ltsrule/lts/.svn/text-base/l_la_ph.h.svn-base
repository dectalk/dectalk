/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000,2001 Force computers Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	l_la_ph.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * 		Spanish Language phonemes
 *      This file contains the definition of all Spanish
 *      phonemes, as well as the definition of all control
 *      and internal phonemes.
 *  
 *      It also contains the definition of bits in the
 *      featb[] and place[] tables (in phrom.c) that are
 *      used to characterize the phonemes.
 *  
 *  	internationalization
 *  
 *      Must be redone for every language.
 *
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001	CJL		03/26/1997		Duplicate file; Replaced w/ \include
 *                                              BATS#310
 * 002  MGS     07/28/1997      Added code for __osf build 
 * 003  MGS     07/28/1997		Added code for __osf__ build
 * 004	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 005	MGS		06/17/1998		Added code for PHEDIT2
 * 006	MFG		06/17/1998		Copied from l_sp_ph.h
 * 007	MGS		12/27/1999		Fix for SAPI
 * 008 	CAB		10/16/2000		Changed copyright info
 * 009	CAB		09/04/2001		Added #error
 */

#error This file is no longer used 

#ifndef L_LA_PHH
#define L_LA_PHH 1

#include        "l_com_ph.h"



#define SIL                     0               /*       Must be zero   */
#define E_A                     1               /*       Palabra        */
#define E_E                     2               /*       Leo            */
#define E_I                     3               /*       Hilo           */
#define E_O                     4               /*       Hola           */
#define E_U             		5               /*       Lunes          */
#define E_WX            		6               /* Rounded dipth semiv. */
#define E_YX            		7               /* Unround dipth semiv. */
#define E_RR            		8               /*       Rama           */
#define E_L                     9               /*       Luna           */
#define E_LL            		10              /*       Calle          */
#define E_M                     11              /*       Mama'          */
#define E_N                     12              /*       Nana           */
#define E_NH            		13              /*       Munoz          */
#define E_F                     14              /*       Feo            */
#define E_S                     15              /*       Casa           */
#define E_J                     16              /*       Caja           */
#define E_TH            		17              /*       Caza           */
#define E_BH            		18              /*       Haba           */
#define E_DH            		19              /*       Hada           */
#define E_GH            		20              /*       Haga           */
#define E_YH            		21              /*       Yate affricate */
#define E_P                     22              /*       Papa'          */
#define E_B                     23              /*       Barco          */
#define E_T                     24              /*       Tela           */
#define E_D                     25              /*       Dama           */
#define E_K                     26              /*       Casa           */
#define E_G                     27              /*       Gasa           */
#define E_CH            		28              /*       Charco         */
#define E_Y                     29              /*       Haya fricitive */
#define E_R                     30              /*       Sara           */
#define E_Q                     31              /*       ~n offglide    */
#define E_Z                     32              /*       Desde          */
#define E_W                     33              /*       Hueso          */
#define E_NX            		34              /*       Mango          */
#define E_V                     35              /*       Afgano         */
#define E_IX            		36              /*       ~n offglide    */
#define E_MX            		37              /*       Infierno (nf)  */
#define E_PH            		38              /*       Observar       */

/* 
 * Added 9-FEB-1995 CJL to satisfy missing definitions 
 * yu and dx should not be gernerated also if you add a phone it needs
 * to be in order and tot_allophones must be changed as well eab 23-mar-95
 */

/* #define YU		16 */
/* #define YU		50 */
/* #define DX		51 out 3/23/95 eab */

 /*
  * The phoneme list ends here.
  * TOT_ALLOPHONES is used to dimension vectors of spoken phonemes.
  * Stress and boundary phonemes are excluded.
  */

#ifndef PHEDIT2
//#define TOT_ALLOPHONES  (39)                            /* Last allophone + 1   */
#define NOVALID                 (SP_TOT_ALLOPHONES+ 0)     /* Used by parser, etc. */
#else
extern short TOT_ALLOPHONES;
#define NOVALID                 (39+ 0)     /* Used by parser, etc. */
#endif 


/*
 * TOT_SP_PHONEMES is the total number of phonemes in the Spanish Font.
 */

//#define PHO_SYM_TOT             (NEW_PARAGRAPH+1)		/* # of symbols in this table   */
#define TOT_SP_PHONEMES (NEW_PARAGRAPH+1)

 
#define MAX_CONTROL     (BREATH_BREAK & PVALUE) 		/* End of ph_control[]  */
#define LENGTH_PHODEF   4                       		/* Longest [...] name   */
 
/*
 * Phonetic feature values allowed in featb[]
 */
#ifdef NOWOUT

#define FSYLL   0000001 /* Syllabic: vowels + dipthongs                 */
#define FVOICD  0000002 /* Voiced segments                              */
#define FVOWEL  0000004 /* Vowels                                       */
#define FSEMIV  0000010 /* Semivowels (Y, W, YX, WX)                    */
#define FSONOR  0000020 /* [-obst], except /q/ is [-sonor, -obst]       */
#define FOBST   0000040 /* Regular, except /q/ is [-obst]               */
#define FPLOSV  0000100 /* Plosives, excluding affricates               */
#define FNASAL  0000200 /* Nasals                                       */
#define FCONSON 0000400 /* [-syll], except for /si/ and /q/             */
#define FSONCON 0001000 /* Voiced liq. and glides /rr/, laterals, /yh/  */
#define FDIPTH  0002000 /* [i], [u], [yx], [wx]                         */
#define FBURST  0004000 /* plosives and affricates                      */
#define FSTMARK 0010000 /* [', `, !]                                    */
#define FGLOTL  0020000 /* The glottal stop                             */
#define FVBAR   0040000 /* b, d, g, bh, dh, gh                          */
/*
 * Phonetic feature values allowed in place[]
 * Note: example phonemes are wrong.
 */
#define FLABIAL 0000001         /* p, b, m, f, v                        */
#define FDENTAL 0000002         /* th, dh, d$                           */
#define FPALATL 0000004         /* sh, zh, ch, jh                       */
#define FALVEL  0000010         /* t, d, n, en, s, z, tx (not l,r,dx)   */

#define FVELAR  0000020         /* k, g, nx                             */

#define FGLOTAL 0000040         /* h, q, tq                             */
#define F2BACKI 0000100         /* iy, y, yu                            */
#define F2BACKF 0000200         /* iy, y, ey (not ay,oy)                */
#endif	// NOWOUT	

#define IS_PLUS !=0     /* If feature value is plus, some bit is set    */
#define IS_MINUS ==0
#define LA_FONT      (PFLA << PSFONT)     /* Spanish font         */
#define LA(ph)       (LA_FONT | (ph))     /* Phone in Spanish     */

 /*
  * Some useful right-side graphics characters.  Most of these are
  * only needed by heuristics and number processing (ls1*.c and ls2.c)
  */

#define CENT            0xA2            /* Cent sign                    */
#define STERLING        0xA3            /* Pound sterling               */
#define YEN             0xA5            /* Yen                          */
#define SECTION         0xA7            /* Section sign                 */
#define DEGREE          0xB0            /* Degree sign                  */
#define PLUS_MINUS      0xB1            /* +- sign                      */
#define PARAGRAPH       0xB6            /* Paragraph sign               */
#define FOURTH          0xBC            /* 1/4                          */
#define HALF            0xBD            /* 1/2                          */
#define SUPER_1         0xB9            /* Raised 1                     */
#define SUPER_2         0xB2            /* Raised 2                     */
#define SUPER_3         0xB3            /* Raised 3                     */
#define SUPER_O         0xBA            /* Raised letter o              */
#define SUPER_A         0xAA            /* Raised letter a              */
 
 /*
  * Languages that are recognized.
  */

#define L_USA           1               /* General American             */
#define L_GB            2               /* RP                           */
#define L_ENGLISH       L_GB    		/* LANGUAGE <= L_ENGLISH        */
#define L_SPAIN         3               /* Spanish (European)           */
#define L_LA			L_SPAIN          /* Spanish (Latin American)           */

 
// 004	MGS		12/27/1999		Fix for SAPI
//#define LANGUAGE        L_LA
  
#endif /* #ifndef L_LA_PHH */

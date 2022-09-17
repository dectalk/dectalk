/* 
 ***********************************************************************
 *                                                                      
 *                           Copyright ©
 *    Copyright © 2000,2001 Force computers Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
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
 *    File Name:	l_fr_ph.h
 *    Author:                                        
 *    Creation Date:                                              
 *                                                                             
 *    Functionality:                                                           
 *  	french phoneme codes ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-----------		---------------------------------------
 *
 * 	001 CAB		10/16/00		Changed copyright info
 *	002	CAB		09/04/01		Added #error		
 */

//#error This file is no longer used 

#ifndef L_FR_PHH
#define L_FR_PHH 1

#include	"l_com_ph.h"

#define FRGC     0x18   /* grammatical category */

#define SIL      0  /* Must be zero */
#define F_A      1
#define F_A3     2
#define F_E2     3
#define F_AU     4
#define F_E      5
#define F_E1     6
#define F_EU     7
#define F_I      8
#define F_O      9
#define F_O6     10
#define F_OU     11
#define F_U      12
#define F_AN     13
#define F_IN     14
#define F_ON     15
#define F_UN     16
#define F_AP     17
#define F_L      18
#define F_R      19
#define F_W      20
#define F_WU     21
#define F_Y      22
#define F_CH     23
#define F_F      24
#define F_J      25
#define F_RX     26
#define F_S      27
#define F_V      28
#define F_Z      29
#define F_B      30
#define F_D      31
#define F_G      32
#define F_K      33
#define F_P      34
#define F_T      35
#define F_GN     36
#define F_M      37
#define F_N      38
#define F_NG     39
#define SegX     40
#define SegSil   41
/* chj 7/31/00 there is no need for there to be two names for     *
 * each phoneme, all uses of these changed to their F_ equivalent */
/*
#define PhonA    F_A
#define PhonA3   F_A3
#define PhonE2   F_E2
#define PhonAu   F_AU
#define PhonE    F_E
#define PhonE1   F_E1
#define PhonEu   F_EU
#define PhonI    F_I
#define PhonO    F_O
#define PhonO6   F_O6
#define PhonOu   F_OU
#define PhonU    F_U
#define PhonAn   F_AN
#define PhonIn   F_IN
#define PhonOn   F_ON
#define PhonUn   F_UN
#define SegAXP   F_AP
#define PhonL    F_L
#define PhonR    F_R
#define PhonW    F_W
#define PhonWu   F_WU
#define PhonY    F_Y
#define PhonCh   F_CH
#define PhonF    F_F
#define PhonJ    F_J
#define PhonRx   F_RX
#define PhonS    F_S
#define PhonV    F_V
#define PhonZ    F_Z
#define PhonB    F_B
#define PhonD    F_D
#define PhonG    F_G
#define PhonK    F_K
#define PhonP    F_P
#define PhonT    F_T
#define PhonGn   F_GN
#define PhonM    F_M
#define PhonN    F_N
#define PhonNg   F_NG
*/
//#define TOT_ALLOPHONES 41 /*see below*/
 
#ifdef NEVERNEVERNEVER    /* theses values have been changed in the English Dectalk */
#define FSyntVirg   0x62
#define FinNorm     0x5b
#define FinInterr   0x67
#define FrontMot    0x68     /* a space : 104 */
#define BLANC       0x68     /* a space */
#define LAST_PHONE  0x68
#endif

#define FSyntVirg   COMMA
#define FinNorm     PERIOD
#define FinInterr   QUEST
#define FrontMot    WBOUND     
#define BLANC       WBOUND    
#define LAST_PHONE  SPECIALWORD 



/*
  Stress symbols are before boundry symbols.
  Caveat: the numeric values of the PPSTART and VPSTART defines are known
  to the builtin and user dictionary lookup routines,
  written in assembler (LSMCH.A86, [T]USRDIC.A86).
*/ 

#ifdef OLDCODE
#define BLOCK_RULES (56)      /* Block allophone substitutes */
#define S2          (56+ 1)   /* Secondary stress */
#define S1          (56+ 2)   /* Primary stress */
#define SEMPH       (56+ 3)   /* Emphatic stress */
#define HAT_RISE    (56+ 4)   /* Explicit hat rise */
#define HAT_FALL    (56+ 5)   /* Explicit hat fall */
#define HAT_RF      (56+ 6)   /* Explicit hat rise-fall */
#define SBOUND      (56+ 7)   /* Syllable boundary */
#define MBOUND      (56+ 8)   /* Morpheme boundary */
#define HYPHEN      (56+ 9)   /* For noun compounds */
#define WBOUND      104       /* Word boundary */
#define PPSTART     (56+11)   /* Prep phrase start */
#define VPSTART     (56+12)   /* Verb phrase start */
#define RELSTART    (56+13)   /* Intro. to sentence or clause */
#define COMMA       98        /* end of clause */
#define PERIOD      91        /* End of sentence */
#define QUEST       103       /* End of question */
#define EXCLAIM     95    /* End of exclamatory sentence! */
#define NEW_PARAGRAPH   (56+18)   /* Explicit new paragraph */

#define PHO_SYM_TOT 75    /* # of symbols in this table */
#endif

//#define PHO_SYM_TOT (SPECIALWORD + 1)     /* # of symbols in this table */

#define FIRST_ARG   (RATE)    /* Some phonemes */
#define LAST_ARG    (PPAUSE)  /* have a single numeric arg */

/* Grammatical categories; used in ls3.c phmain.c phsort.c */
#define CgBas           0
#define CgElision       0
#define CgConj          2
#define CgPPS           3
#define CgVA            4
#define CgArt           5
#define CgDivers        6
#define CgPrep          7
#define CgPosDem        8
#define CgInterr        9
#define CgDe            10
#define CgPrep2         11
#define CgAV            12

#define FIRST_MAJ       40   /* used in lookup.c for case insensitive */
#define DERN_MAJ        80
#define ECART_MAJ_MIN   73

#define G_A2    40
#define G_A3    41
#define G_A6    42
#define G_E1    43
#define G_E2    44
#define G_E3    45
#define G_E4    46
#define G_I3    47
#define G_I4    48
#define G_O3    49
#define G_O6    50
#define G_O4    57
#define G_U2    51
#define G_U3    52
#define G_U4    53
#define G_C5    60
#define G_QUOTE 100
#define G_TIRET 105




/* Total number of phones.	*/
#ifndef PHO_SYM_TOT
#define	PHO_SYM_TOT		(SPECIALWORD + 1)
#endif 	/* # of biggest symbol-used to be number of symbols total
            so danger exists that someplace actually
			cares about the total number of symbols */
#ifndef IS_PLUS
#define IS_PLUS !=0


#endif

#endif  /* ifndef L_FR_PHH */

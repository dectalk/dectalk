/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000,2001 Force Computers Inc., a Solectron company. All rights reserved. 
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
 *    File Name:	l_gr_ph.h
 *    Author:       JDB
 *    Creation Date:06/19/96
 *
 *    Functionality:
 *  	german phonme defs ...
 *
 ***********************************************************************
 *    Revision History:
 *
Rev		Who     Date            Description
---  	-----   -----------     -------------------------------------------- 
001		MGS		06/17/1998		Added code for PHEDIT2
002		GL		09/01/1998	    BATS#758 change PFD to PFGR.
003 	CAB		10/16/2000		Changed copyright info
004		EAB		02/28/2001		Changed AE comment
005  	CAB		03/01/2001		Added copyright info
006		CAB		09/04/2001		Added #error
 */ 

#error This file is no longer used 

#ifndef L_GR_PHH
#define L_GR_PHH 1

#include "l_com_ph.h"

#define PFGR 0x1E            /* German Phonemes              */

/*
 * Definitions for the phonemes, under the
 * "PFGR" font. These are offsets into the font,
 * not absolute font codes. The font code is made
 * by saying "(PFGR<<PSFONT) + code". May tables are
 * indexed by these values; don't change them unless
 * you are very careful. Dennis made some changes
 * to these for the new synthesizer.
 */

/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
/*      german phonemes from DECtalk 1                                  */
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

#define SIL                                      0              /* Silence, must be zero        */
#define A                                        1              /* mAnn                         */
#define E                                        2              /* Englisch                     */
#define AE                                       3              /* cAt(american)                       */
#define EX                                       4              /* gabE                         */
#define I                                        5              /* mIt                          */
#define O                                        6              /* pOst                         */
#define OE                                       7              /* kOEnnen                      */
#define U                                        8              /* mUnd                         */
#define UE                                       9              /* lUEcke                       */
#define AH                                      10              /* sAgen                        */
#define EH                                      11              /* gEben                        */
#define AEH                                     12              /* wAEhlen                      */
#define IH                                      13              /* lIEb                         */
#define OH                                      14              /* mOnd                         */
#define OEH                                     15              /* mOEgen                       */
#define UH                                      16              /* hUt                          */
#define UEH                                     17              /* hUEten                       */
#define EI                                      18              /* klEId                        */
#define AU                                      19              /* hAUs                         */
#define EU                                      20              /* hEUte                        */
#define AN                                      21              /* pENsion                      */
#define IM                                      22              /* tIMbre                       */
#define UM                                      23              /* parfUM                       */
#define ON                                      24              /* fONdue                       */
#define J                                       25              /* Ja                           */
#define L                                       26              /* Luft                         */
#define RR                                      27              /* Rund                         */
#define R                                       28              /* waR                          */
#define H                                       29              /* Hut                          */
#define M                                       30              /* Mut                          */
#define N                                       31              /* NeiN                         */
#define NG                                      32              /* riNG                         */
#define EL                                      33              /* nabEL                        */
#define EM                                      34              /* grossEM                      */
#define EN                                      35              /* badEN                        */
#define F                                       36              /* Fall                         */
#define V                                       37              /* Was                          */      
#define S                                       38              /* meSSen                       */
#define Z                                       39              /* doSe                         */
#define SH                                      40              /* SCHule                       */
#define ZH                                      41              /* Genie                        */
#define CH                                      42              /* niCHt                        */
#define KH                                      43              /* noCH                         */
#define P                                       44              /* Park                         */
#define B                                       45              /* Ball                         */
#define T                                       46              /* Turm                         */
#define D                                       47              /* Dort                         */
#define K                                       48              /* Kalt                         */
#define G                                       49              /* Gast                         */
#define Q                                       50              /* be_amtet                     */
#define PF                                      51              /* PFerd                        */
#define TS                                      52              /* Zahl                         */
#define DJ                                      53              /* Gin                          */
#define TJ                                      54              /* maTSCH                       */
#define KSX                                     55              /* eXtra                        */
#define PH_LAST_PH      KSX              /* Last real phoneme            */

#ifndef PHEDIT2
#define TOT_ALLOPHONES  (PH_LAST_PH+1)  /* total number of phones */
#else
extern short int TOT_ALLOPHONES;
#endif

#define CLSTART                 RELSTART
#define PH_LAST_BS              NEW_PARAGRAPH   /* Last boundary or stress      */

/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
/*      german word classes from DECtalk 1                              */
/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

#define G_FIRST                 (PH_LAST_BS+1)          /* first word class "phoneme"           */
#define G_ART                           (G_FIRST+0)                     /* articles : der, die, das ...         */
#define G_CON                           (G_FIRST+1)                     /* conjunctions : und, oder, weil ...   */
#define G_PRO                           (G_FIRST+2)                     /* pronouns : du, ich, man, dich ...    */
#define G_INT                           (G_FIRST+3)                     /* interjections : oh, ach, ah ...      */
#define G_PRE                           (G_FIRST+4)                     /* prepositions : auf, in, von ...      */
#define G_POS                           (G_FIRST+5)                     /* possesive pronouns : unser, mein ... */
#define G_HEL                           (G_FIRST+6)                     /* auxiliaries : haben, sind ...        */
#define G_ADV                           (G_FIRST+7)                     /* adverbs : sehr, auch, darum ...      */
#define G_VER_ADJ               (G_FIRST+8)                     /* verbs and adjectives                 */
#define G_NOU                           (G_FIRST+9)                     /* nouns                                */
#define G_LAST                          G_NOU                                   /* last word class "phoneme"            */
#define PH_END                          G_LAST
#define PH_ORTHO_LAST   PH_END  /* Last orthographic                    */

//#define PHO_SYM_TOT             (PH_END+1)      /* # of symbols in this table   */

#endif /* #ifndef L_GR_PHH */














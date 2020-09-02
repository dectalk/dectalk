/* 
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000-2001 Force computers Inc., a Solectron company. All rights reserved.        
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
 *    File Name:	l_all_ph.h
 *    Author:		Matthew Schnee                                         
 *    Creation Date:03/16/2000                                                   
 *                                                                             
 *    Functionality:                                                           
 *  	all phoneme codes ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 *	Rev		   Date		Who		Description                    
 *	---		----------	---		--------------------
 *  001		09/20/2000	cab		Fixed copyright info
 *	002		02/22/2001 	EAB 	ADD NEW GERMAN PHONEMES FOR SHORT VOWELS 
 *  003		02/23/2001 	CAB		Updated copyright info
 *  004		12/13/2001	CAB		Recheck in branch version 1.9 because of UK_YR
 *								
 */

#ifndef L_ALL_PHH
#define L_ALL_PHH 1

#include	"l_com_ph.h"

#define	PFUSA		0x1E		/* American English Phonemes	*/
#define PFUK		0x1D        /* UK English Phonemes          */
#define PFGR		0x1C        /* German Phonemes              */
#define PFSP		0x1B        /* Spanish Phonemes	            */ 
#define PFLA		0x1A        /* Latin Phonemes 		        */ 
#define PFFR		0x19		/* French Phonemes				*/
#define FRGC		0x18		/* French Grammatical Category  */

/*
 * Definitions for the phonemes, under the
 * "PFUSA" font. These are offsets into the font,
 * not absolute font codes. The font code is made
 * by saying "(PFUSA<<PSFONT) + code". May tables are
 * indexed by these values; don't change them unless
 * you are very careful. Dennis made some changes
 * to these for the new synthesizer.
 */

#define SIL			 0		/* Must be zero			*/
#define US_IY		 1
#define US_IH		 2
#define US_EY		 3
#define US_EH		 4
#define US_AE		 5
#define US_AA		 6
#define US_AY		 7
#define US_AW		 8
#define US_AH		 9
#define US_AO		10
#define US_OW		11
#define US_OY		12
#define US_UH		13
#define US_UW		14
#define US_RR		15
#define US_YU		16
#define US_AX		17
#define US_IX		18
#define US_IR		19
#define US_ER		20
#define US_AR		21
#define US_OR		22
#define US_UR		23
#define US_W		24
#define US_Y		25
#define US_R		26
#define US_LL		27
#define US_HX		28
#define US_RX		29
#define US_LX		30
#define US_M		31
#define US_N		32
#define US_NX		33
#define US_EL		34
#define US_DZ		35
#define US_EN		36
#define US_F		37
#define US_V		38
#define US_TH		39
#define US_DH		40
#define US_S		41
#define US_Z		42
#define US_SH		43
#define US_ZH		44
#define US_P		45
#define US_B		46
#define US_T		47
#define US_D		48
#define US_K		49
#define US_G		50
#define US_DX		51
#define US_TX		52
#define US_Q		53		/* glottal stop			*/
#define US_CH		54
#define US_JH		55
#define US_DF		56
#define US_TZ		57
#define US_CZ		58
#define US_LY		59
#define US_RE		60
#define US_X1		61
#define US_X2		62
#define US_X3		63
#define US_X4		64
#define US_X5		65
#define US_X6		66
#define US_X7		67
#define US_X8		68
#define US_X9		69
#define US_Z1		70

#define UK_IY		 1
#define UK_IH		 2
#define UK_EY		 3
#define UK_EH		 4
#define UK_AE		 5
#define UK_AA		 6
#define UK_AY		 7
#define UK_AW		 8
#define UK_AH		 9
#define UK_AO		10
#define UK_OW		11
#define UK_OY		12
#define UK_UH		13
#define UK_UW		14
#define UK_RR		15
#define UK_YU		16
#define UK_AX		17
#define UK_IX		18
#define UK_IR		19
#define UK_ER		20
#define UK_AR		21
#define UK_OR		22
#define UK_UR		23
#define UK_W		24
#define UK_Y		25
#define UK_R		26
#define UK_LL		27
#define UK_HX		28
#define UK_OH		29
#define UK_LX		30
#define UK_M		31
#define UK_N		32
#define UK_NX		33
#define UK_EL		34
#define UK_DZ		35
#define UK_EN		36
#define UK_F		37
#define UK_V		38
#define UK_TH		39
#define UK_DH		40
#define UK_S		41
#define UK_Z		42
#define UK_SH		43
#define UK_ZH		44
#define UK_P		45
#define UK_B		46
#define UK_T		47
#define UK_D		48
#define UK_K		49
#define UK_G		50
#define UK_YR		51		/***** Is this supposed to be this way - two '51's ?? */
/* GL 09/30/1997  need to remove the next definition after PH/UK fully function */
#define UK_DX		51
#define UK_TX		52
#define UK_Q		53		/* glottal stop			*/
#define UK_CH		54
#define UK_JH		55
#define UK_DF		56

#define GR_A		 1              /* mAnn                         */
#define GR_E		 2              /* Englisch                     */
#define GR_AE		 3              /* cAt(american)                */
#define GR_EX		 4              /* gabE                         */
#define GR_I		 5              /* mIt                          */
#define GR_O		 6              /* pOst                         */
#define GR_OE		 7              /* kOEnnen                      */
#define GR_U		 8              /* mUnd                         */
#define GR_UE		 9              /* lUEcke                       */
#define GR_AH		10              /* sAgen                        */
#define GR_EH		11              /* gEben                        */
#define GR_AEH		12              /* wAEhlen                      */
#define GR_IH		13              /* lIEb                         */
#define GR_OH		14              /* mOnd                         */
#define GR_OEH		15              /* mOEgen                       */
#define GR_UH		16              /* hUt                          */
#define GR_UEH		17              /* hUEten                       */
#define GR_EI		18              /* klEId                        */
#define GR_AU		19              /* hAUs                         */
#define GR_EU		20              /* hEUte                        */
#define GR_AN		21              /* pENsion                      */
#define GR_IM		22              /* tIMbre                       */
#define GR_UM		23              /* parfUM                       */
#define GR_ON		24              /* fONdue                       */
#define GR_J		25              /* Ja                           */
#define GR_L		26              /* Luft                         */
#define GR_RR		27              /* Rund                         */
#define GR_R		28              /* waR                          */
#define GR_H		29              /* Hut                          */
#define GR_M		30              /* Mut                          */
#define GR_N		31              /* NeiN                         */
#define GR_NG		32              /* riNG                         */
#define GR_EL		33              /* nabEL                        */
#define GR_EM		34              /* grossEM                      */
#define GR_EN		35              /* badEN                        */
#define GR_F		36              /* Fall                         */
#define GR_V		37              /* Was                          */      
#define GR_S		38              /* meSSen                       */
#define GR_Z		39              /* doSe                         */
#define GR_SH		40              /* SCHule                       */
#define GR_ZH		41              /* Genie                        */
#define GR_CH		42              /* niCHt                        */
#define GR_KH		43              /* noCH                         */
#define GR_P		44              /* Park                         */
#define GR_B		45              /* Ball                         */
#define GR_T		46              /* Turm                         */
#define GR_D		47              /* Dort                         */
#define GR_K		48              /* Kalt                         */
#define GR_G		49              /* Gast                         */
#define GR_Q		50              /* be_amtet                     */
#define GR_PF		51              /* PFerd                        */
#define GR_TS		52              /* Zahl                         */
#define GR_DJ		53              /* Gin                          */
#define GR_TJ		54              /* maTSCH                       */
#define GR_KSX		55              /* eXtra                        */
#define GR_I1		56				/* short I */
#define GR_E1		57				/* short E */
#define GR_O1		58				/* short O */
#define GR_U1		59				/* short U */
#define GR_Y1		60				/* short Y */
#define GR_ER		61				/*er double phone*/



#define LA_A		 1               /*       Palabra        */
#define LA_E		 2               /*       Leo            */
#define LA_I		 3               /*       Hilo           */
#define LA_O		 4               /*       Hola           */
#define LA_U		 5               /*       Lunes          */
#define LA_WX		 6               /* Rounded dipth semiv. */
#define LA_YX		 7               /* Unround dipth semiv. */
#define LA_RR		 8               /*       Rama           */
#define LA_L		 9               /*       Luna           */
#define LA_LL		10              /*       Calle          */
#define LA_M		11              /*       Mama'          */
#define LA_N		12              /*       Nana           */
#define LA_NH		13              /*       Munoz          */
#define LA_F		14              /*       Feo            */
#define LA_S		15              /*       Casa           */
#define LA_J		16              /*       Caja           */
#define LA_TH		17              /*       Caza           */
#define LA_BH		18              /*       Haba           */
#define LA_DH		19              /*       Hada           */
#define LA_GH		20              /*       Haga           */
#define LA_YH		21              /*       Yate affricate */
#define LA_P		22              /*       Papa'          */
#define LA_B		23              /*       Barco          */
#define LA_T		24              /*       Tela           */
#define LA_D		25              /*       Dama           */
#define LA_K		26              /*       Casa           */
#define LA_G		27              /*       Gasa           */
#define LA_CH		28              /*       Charco         */
#define LA_Y		29              /*       Haya fricitive */
#define LA_R		30              /*       Sara           */
#define LA_Q		31              /*       ~n offglide    */
#define LA_Z		32              /*       Desde          */
#define LA_W		33              /*       Hueso          */
#define LA_NX		34              /*       Mango          */
#define LA_V		35              /*       Afgano         */
#define LA_IX		36              /*       ~n offglide    */
#define LA_MX		37              /*       Infierno (nf)  */
#define LA_PH		38              /*       Observar       */


#define SP_A		 1               /*       Palabra        */
#define SP_E		 2               /*       Leo            */
#define SP_I		 3               /*       Hilo           */
#define SP_O		 4               /*       Hola           */
#define SP_U 		 5               /*       Lunes          */
#define SP_WX		 6               /* Rounded dipth semiv. */
#define SP_YX		 7               /* Unround dipth semiv. */
#define SP_RR		 8               /*       Rama           */
#define SP_L		 9               /*       Luna           */
#define SP_LL		10              /*       Calle          */
#define SP_M		11              /*       Mama'          */
#define SP_N		12              /*       Nana           */
#define SP_NH		13              /*       Munoz          */
#define SP_F		14              /*       Feo            */
#define SP_S		15              /*       Casa           */
#define SP_J		16              /*       Caja           */
#define SP_TH		17              /*       Caza           */
#define SP_BH		18              /*       Haba           */
#define SP_DH		19              /*       Hada           */
#define SP_GH		20              /*       Haga           */
#define SP_YH		21              /*       Yate affricate */
#define SP_P		22              /*       Papa'          */
#define SP_B		23              /*       Barco          */
#define SP_T		24              /*       Tela           */
#define SP_D		25              /*       Dama           */
#define SP_K		26              /*       Casa           */
#define SP_G		27              /*       Gasa           */
#define SP_CH		28              /*       Charco         */
#define SP_Y		29              /*       Haya fricitive */
#define SP_R		30              /*       Sara           */
#define SP_Q		31              /*       ~n offglide    */
#define SP_Z		32              /*       Desde          */
#define SP_W		33              /*       Hueso          */
#define SP_NX		34              /*       Mango          */
#define SP_V		35              /*       Afgano         */
#define SP_IX		36              /*       ~n offglide    */
#define SP_MX		37              /*       Infierno (nf)  */
#define SP_PH		38              /*       Observar       */


#ifndef PHEDIT2
#ifndef TOT_ALLOPHONES
//#define TOT_ALLOPHONES	57
#define US_TOT_ALLOPHONES	71
#define UK_TOT_ALLOPHONES	57
#define GR_TOT_ALLOPHONES  (62)  /* total number of phones */
#define LA_TOT_ALLOPHONES  (39)  /* Last allophone + 1     */
#define SP_TOT_ALLOPHONES  (39)  /* Last allophone + 1     */
#define FR_TOT_ALLOPHONES  (40)
#define NOVALID (SP_TOT_ALLOPHONES+ 0) /* Used by parser, etc. */
#endif
#else
extern short TOT_ALLOPHONES;
#define NOVALID                 (39+ 0)     /* Used by parser, etc. */
#endif
#define MAX_PHONES 99 //eab TOT_ALLOPHONES IS REALLY TOTAL PHONES WHICH WIL FORCE TO THE MAX NUMBER OF POSSIBLE 
		// PHONES 
  
#define FVBAR   0040000 /* b, d, g, bh, dh, gh                          */

#ifdef NOWOUT
/*
 * Phonetic feature values allowed in featb[]
 */

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
#endif
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
 
/*french starts here, from fre_phon.h*/
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

#define FSyntVirg   COMMA
#define FinNorm     PERIOD
#define FinInterr   QUEST
#define FrontMot    WBOUND     
#define BLANC       WBOUND    
#define LAST_PHONE  SPECIALWORD 

#define FIRST_ARG   (RATE)    /* Some phonemes */
#define LAST_ARG    (PPAUSE)  /* have a single numeric arg */

/* Grammatical categories; used in ls3.c ph_task.c ph_sort.c */
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


#ifndef PHEDIT2
#ifndef TOT_ALLOPHONES
#endif
#else
extern short TOT_ALLOPHONES;
#endif

/* Total number of phones.	*/
#ifndef PHO_SYM_TOT
#define	PHO_SYM_TOT		(SPECIALWORD + 1)
#endif 	/* # of biggest symbol-used to be number of symbols total
            so danger exists that someplace actually
			cares about the total number of symbols */
#ifndef IS_PLUS
#define IS_PLUS !=0
#endif

 
#endif /* #ifndef L_ALL_PHH */

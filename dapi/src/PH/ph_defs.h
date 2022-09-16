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
 *
 *
 ***********************************************************************
 *    File Name:        ph_defs.h
 *    Author:
 *    Creation Date:
 *    
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *

 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK		09/01/1984	    Initial creation
 * 0002 DGC		12/27/1984		Moved some stuff to defs.h for 80186
 * 0003 DGC		01/19/1985		Moved the LIMIT structure def. to here.
 * 0004 DK		02/19/1985	    Rename spdef variables not sent to chip, add tltoff
 * 0005 DK		02/28/1985	    Define a few more constants, new place[] features
 * 0006 DGC		03/06/1985	    Added system call PUTSEQ.
#ifdef ENGLISH_US
 * 0007 DK		07/24/1985		Remove tltoff from set of spdefs sent to chip
 *                      		rename OUTPAR structure to be parstochip[]
 *                              array.
 * 0008 EAB		06/01/1994 		Added time_value_specfied for merge of ph88
 * 0009 CJL		12/15/1994 		Added pre-processor code to prevent dupilcate
 *                              inclusions.
 * 0010 MGS		03/25/1996	    Merged WIN 95 code with 42c 
#endif
#ifdef SPANISH
 * 0007 MM		05/14/1985	    Cleaned up OUT_ junk
 * 0008 MM		04/10/1986	    Removed English specific stuff -- error prone.
 * 0009 CJL		02/08/1995	    Add include excusion pre-processor code, FMEDIALSYL,
 *                              and FFINALSYL.
#endif                  
#ifdef GERMAN
 * 0008 BK 		07/21/1986	   	Add tertiary and lowest stress flag and move
 *           					initial word consonant flag
 * 0009 BK		09/24/1986     	add definitions for sentence intonation
 * 0010 CJL		03/30/1995		File was phdefs.h. Id now gphdefs.h
 * 0011 EAB		02/21/1996		Modified comma pause per Sonia
#endif
 * 0011 MGS		03/31/1996 		Merged Spanish with english
 * 0012	MGS		06/06/1996		Changed file name from phdefs.h to ph_defs.h
 * 0013 MGS		06/14/1996		Merged spanish with english for real this time.
 * 0014 MGS		06/18/1996		Fixed math macros so there would be parens around the argumants 
 * 0015	MGS		06/19/1996		Merged German with English/Spanish
 * 0016	GL		04/21/1997	    BATS#357  Add the code for __osf__ build 
 * 0017 TQL		06/03/1997		Fix an incorrect #if statement
 * 0018 EAB		09/08/1997		Temporary hack fix NSAMP for now.
 * 0019 DR		09/30/1997		UK BUILD: added UK STUFF
 * 0020 EAB		10/22/1997		use sample rate 71 for 11 Khz build(win32 and osf).
 * 0021 EAB      3/20/1998		Added new definitons for new_vtm and expanded definitions
 *								for languages and removed ifdef'ed stuff for NWSNOAA that aren't
 *								needed any more and caused problems and added new include for dectalk.f
 * 0022 EAB		4/7/98			Cleaned up phinton defines for languages
 * 0023 GL		4/15/1998		For BATS#492 convert get_phone() to macro
 * 0024 EAB     4/27/98         Many tuning changes for German
 * 0025 EAB		7/13/98			Changes for BATS 711 to allow for the use of form class and
 *								expanded feature bits size to allow for more features
 * 0026	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 * 0027 EAB		7/16/98			Found Fmaximum redefinition warning- deleted old German entry
 *								a result of BATS 711 German enhancement
 * 0028 EAB		9/11/98			Improved Spanish intonation
 * 0029 EAB		9/29/98 	Tuned intonation values(shuld these be moved to ph_inton??? 
 * 0030 ETT		10/05/98		added linux code.
 * 0031 EAB		10/15/98 	More intonation gesture tuning
 * 0031 EAB		11/4/98		Final glotalization gestures values needed tuning (F0_GLOTTALIZE)
							BATS796 Also made other languages very small value but in the correct direction
							
 ***************************************************************************************************/

#ifndef PHDEFSH
#define PHDEFSH

#include "dectalkf.h"
#include "fc_def.tab"    //feature bit definitions  eab 7/15/98
#define NEW_SPANISH

#include "defs.h"
#include "kernel.h"
#include "dectalk.h"
#include "esc.h"
#include "cmd.h"
#ifdef ENGLISH_US
#include "l_us_ph.h"
#endif
#ifdef ENGLISH_UK
#include "l_uk_ph.h"
#endif
#ifdef SPANISH_SP
#include "l_sp_ph.h"
#endif
#ifdef SPANISH_LA
#include "l_la_ph.h"
#endif                
#ifdef GERMAN
#include "l_gr_ph.h"
#endif



#define QUESTION 3
#define EXCLAIMCLAUSE 2
#define COMMACLAUSE 1
#define DECLARATIVE 0

/* eab added explicit command types rather than this odd even >2000 garbage*/

#define  USER		0
#define	 IMPULSE	1
#define  STEP		2
#define	 F0_RESET	3
#define  GLOTAL		4
#define	 GLIDE		5
#define  SHORTIMPULSE   6


/* The following stuff is all unique to modules named ph*.c */
 
#ifdef SPANISH
#define NEVEREVER   1 /*...compile this code eab 3/23/95 eab*/ 
#define PRBOUND         1024		   /* PRPARAM, but for one segment only    */
/* 
 * These values must track the phoneme printout tables in phalloph.c
 */
#define FSTRESS_SHIFT      0		   /* Shift for stress feature bits        */

#endif
 
#ifdef MSDOS
#define NULL    ((void *)0)
#endif
 
#ifdef GERMAN
/* add tertiary and lowest stress for german DECtalk        */
/* lowest stress can be used for unstressed vowels and consonants   */
/* as wells as prevocalic phonemes                  */
/* IMPORTANT!!! FSTRESS doesn't cover all stress bits       */
/* this compensates the fact, that many rules af DECtalk 3 do not   */
/* apply for tertiary stress                    */

#define FSTRESS		  06			   /* original stress feature bits			*/
#define	FIFSTRESS	  07			   /* mask all stress bits           		*/
#define FNOSTRESS	   0			   /* Value of FSTRESS if not stressed   	*/
#define FSTRESS_1	  04			   /* Value of FSTRESS for primary stress   */
#define FSTRESS_2	  02			   /* Value of FSTRESS for secondary stres 	*/
#define FSTRESS_3	  03			   /* Value of FSTRESS for tert. stress  	*/
#define FEMPHASIS	  06			   /* Value of FSTRESS for emphasis  		*/
#define FSTRESS_4	  01			   /* Value of FSTRESS for lowest stress 	*/
#define	POSTVOC_UNSTR	FNOSTRESS
#define	UNSTR_V_OR_PREVOC_UNSTR_C	F_STRESS_4

#endif

//EAB		7/13/98			Changes for BATS 711
#define WORDFEAT		0xffff0000
#if defined ENGLISH ||  defined SPANISH
         
#define FSTRESS           03		   /* Stress feature bits                  	*/


#define FNOSTRESS          0		   /* Value of FSTRESS if not stressed    	*/
#define FSTRESS_1         01		   /* Value of FSTRESS for primary stress 	*/
#define FSTRESS_2         02		   /* Value of FSTRESS for secondary stres 	*/
#define FEMPHASIS         03		   /* Value of FSTRESS for emphasis       	*/
#endif

#ifdef ENGLISH
#define FWINITC           04		   /* Word-initial consonant               	*/
#endif



#ifdef SPANISH
#define FOPEN_SYL         04		   /* Vowel in open syllable or            	*/
#define FOPEN_SYL_SHIFT    2		   /* "explosive" consonant                	*/

#define FSYL_SHIFT         3		   /* Shift for syllable structure bits    	*/
#define FMONOSYL         000		   /* Value for monosyllabic word         	*/
#define FBISYL           010		   /* Value for bisyllabic word           	*/
#define FTRISYL          020		   /* Value for trisyllabic word          	*/
#define FMULTISYL        030		   /* Value for more than 3 syll. word    	*/
#define FSYBNEXT        0040		   /* Value of FBOUNDARY if syllable bound 	*/
#endif

#if defined ENGLISH || defined GERMAN
#define FFIRSTSYL        010		   /* Value of FSYL_STRUC for first syll  	*/
#define FMONOSYL           0		   /* Value of FSYL_STRUC for monosyll    	*/
#define FSYBNEXT        0040		   /* Value of FBOUNDARY if syllable bound 	*/
#endif

#define FTYPESYL         030		   /* Syllable structure feature bits      	*/
#define FMEDIALSYL       020		   /* Value of FSYL_STRUC for medial syll 	*/
#define FFINALSYL        030		   /* Value of FSYL_STRUC for final syll  	*/

#define FBOUNDARY       0740		   /* Following boundary type feature bits 	*/
#define FNO_BOUNDARY       0		   /* Value of FBOUNDARY if rhyme not final */

/* eab 4/94 marks a sylb at word breaks too */

#define FMBNEXT         0100		   /* Value of FBOUNDARY if morpheme bound 	*/
#define FWBNEXT         0140		   /* Value of FBOUNDARY if word boundary 	*/
#define FPPNEXT         0200		   /* Value of FBOUNDARY if prep phrase   	*/
#define FVPNEXT         0240		   /* Value of FBOUNDARY if verb phrase   	*/
#define FRELNEXT        0300		   /* Value of FBOUNDARY if rel clause    	*/
#define FCBNEXT         0340		   /* Value of FBOUNDARY if comma         	*/
#define FPERNEXT        0400		   /* Value of FBOUNDARY if period        	*/
#define FQUENEXT        0440		   /* Value of FBOUNDARY if quest mark    	*/
#define FEXCLNEXT       0500		   /* Value of FBOUNDARY if excalation    	*/

#ifdef GERMAN
#define FNPNEXT	FRELNEXT			   /* Value of FBOUNDARY for special intonation */
#endif

#define FSENTENDS       0400		   /* Next boundary is a sentence end      	*/ 

#ifdef SPANISH
#define FHAT_SHIFT      9
#define FHAT_MASK       03000
#endif

#define FHAT_BEGINS     01000
#define FHAT_ENDS       02000

#define AT_BOTTOM_OF_HAT        1
#define AT_TOP_OF_HAT           2

#define FDUMMY_VOWEL    004000		   /* Do not count this plosive release gesture */

#if defined ENGLISH || defined GERMAN /* ENGLISH_US or GERMAN */

#define FHYPHENATED     010000

#define FBLOCK          020000

//EAB		7/13/98			Changes for BATS 711
#define FDOUBLECONS		0x40000
#ifdef ENGLISH
/* EAB 6/29/98 Comment out prior to delete I don't believe this as ever used
#define PHO_FEA_MAX     14	  # of features in struc[] structure   		*/
//#define FMAXIMUM        037777		   /* Any feature > this is illegal        		*/

#endif


#define F_NOUN			000002000000	/* added noun and adjective of types to stress*/
#define F_ADJ			000004000000
#define F_VERB			000010000000
#define F_FUNC			000020000000

#define FMAXIMUM        010000000000
#ifdef GERMAN
/* put word initial consonent here to make room for 								*/
/* tertiary stress in german DECtalk.               								*/
/* introduce feature bits for hat-roof.             								*/
/* since FHYPHENATED unused, use this bit combination to denounce   				*/
/* last phoneme of word.                        									*/
#define FWINITC		040000			   /* Word-initial consonant 					*/
#define	FHAT_ROOF	0100000			   /* hat roof marker, dangerous!!!!			*/
#define	FWBEND		010000			   /* last phone of word 						*/

#define	FCADENCE	(FHAT_ROOF | FHAT_BEGINS | FHAT_ENDS)
/* EAB 6/29/98 Comment out prior to delete I don't believe this as ever used
#define PHO_FEA_MAX	16	*/			   /* # of features in struc[] structure 		*/
/* Faeture BITS expaded EAB 7/14/98 */
//#define FMAXIMUM	0177777			   /* Any feature > this is illegal  			*/
#endif
#ifndef SPANISH /* in inlcude l_sp_ph.h but differently */
/* 4.  Phonetic feature values allowed in featb[]          							*/

#define FSYLL   0000001				   /* Syllabic: vowels + /el/, /em/, /en/       */
#define FVOICD  0000002				   /* Regular, except /tq/ is [+voicd]          */
#define FVOWEL  0000004				   /* Vowels                                    */
#define FSON1   0000010				   /* [+sonor], except not /si/ and /h/         */
#define FSONOR  0000020				   /* [-obst], except /q/ is [-sonor, -obst]    */
#define FOBST   0000040				   /* Regular, except /q/ is [-obst]            */
#define FPLOSV  0000100				   /* Plosives, excluding affricates            */
#define FNASAL  0000200				   /* Nasals                                    */
#define FCONSON 0000400				   /* [-syll], except for /si/ and /q/          */
#define FSONCON 0001000				   /* Voiced liq. and glides: w, y, r, l, rx, lx*/
#define FSON2   0002000				   /* /w, y, r, l, yu/, /m, n, ng, em, en/      */
#define FBURST  0004000				   /* plosives and affricates                   */
#define FSTMARK 0010000				   /* [', `, !]                                 */
#define FSTOP   0020000				   /* Plosives, affricates, and nasals          */
#endif
/* 4.  Phonetic feature values allowed in place[]          							*/

#define FLABIAL 0000001				   /* p, b, m, f, v                        */
#define FDENTAL 0000002				   /* th, dh, d$                           */
#define FPALATL 0000004				   /* sh, zh, ch, jh                       */
#define FALVEL  0000010				   /* t, d, n, en, s, z, tx (not l,r,dx)   */
#define FVELAR  0000020				   /* k, g, nx                             */
#define FGLOTAL 0000040				   /* h, q, tq                             */
#define F2BACKI 0000100				   /* iy, y, yu                            */
#define F2BACKF 0000200				   /* iy, y, ey (not ay,oy)                */
#endif /* #if defined ENGLISH_US || defined GERMAN */
 
#ifdef SPANISH
#if 0
/* 
 * Removed (possibly temporary) to make room in the structure
 * for the FDUMMY_VOWEL bit.
 */
#define FFUNWORD        004000		   /* Unstressed (function) word           		*/
#define FFUNWORD_SHIFT      11
#else
#define FDUMMY_VOWEL    004000		   /* Do not count this plosive release gesture */
#define FDUMMY_SHIFT        11
#endif

#define FOTHER          (FSBOUND | FCODA | FBLOCK | FWINITC)
#define FOTHER_SHIFT    12
#define FISBOUND        030000		   /* Value of FBOUNDARY if syllable bound */
#define FSBOUND 010000
#define FCODA           020000
#define FBLOCK          040000
#define FWINITC 0100000				   /* The dreaded 16th bit                 */
/* EAB 6/29/98 Comment out prior to delete I don't believe this as ever used
#define PHO_FEA_MAX     16	*/		   /* # of features in struc[] structure   */

#endif /* #ifdef SPANISH */
 
#define IS_PLUS !=0					   /* If feature value is plus, some bit is set    */
#define IS_MINUS ==0

/* 6. Various constants  */

#if defined (__osf__) || defined (__linux__)
#define NSAMP_FRAME     71			/* # of samples per output frame 11 KHz. */
#ifdef NEW_VTM
#define VOICE_PARS	25			   /* EAB found looking for BAT3 667 this should
				                      not really cause a problem
						      at the moment BUT IT COULD BE NASTY LATER!*/
#else //!NEW_VTM
#define VOICE_PARS      20			   /* # of words in a voice block.         */
#endif //NEW_VTM
#define SPDEF_PARS      24			   /* # of words in a speaker definition.  */
#define SYNC_PARS        0			   /* There are no sync parameters. */
#define INDEX_PARS       2			   /* # of words in an index mark block */
#define TONE_PARS        5			   /* # of words in a tone packet */

#elif defined MSDOS
#define NSAMP_FRAME     64			   /* # of samples per output frame 10 KHz. */
#define VOICE_PARS      18			   /* # of words in a voice block.         */
#define SPDEF_PARS      22			   /* # of words in a speaker definition.  */

#else  // !msdos !osf !linux
#define NSAMP_FRAME     71 			   /* # of samples per output frame 11 KHz. */
#ifdef NEW_VTM
#define VOICE_PARS	25			   /* EAB found looking for BAT3 667 this should
				                      not really cause a problem
						      at the moment BUT IT COULD BE NASTY LATER!*/
#else //!NEW_VTM
#define VOICE_PARS      20			   /* # of words in a voice block.         */
#endif //NEW_VTM
#define SPDEF_PARS      24			   /* # of words in a speaker definition.  */
#define SYNC_PARS        0			   /* There are no sync parameters. */
#define INDEX_PARS       2			   /* # of words in an index mark block */
#define TONE_PARS        5			   /* # of words in a tone packet */

#endif // 6. Various Constants

#ifdef ENGLISH
#define NPHON_MAX       300			   /* Size of phone[] and struc[] arrays.  */
#define SIZTARTAB       57			   /* # eab-fix this with sizeof later entries/param in maltar[], phrom.c    */
#define MALLINE 9					   /* # of parameters in a line of locus code(phrom.c)     */
#endif 

#ifdef SPANISH
#define NPHON_MAX       250			   /* Size of phone[] and struc[] arrays.  */
#define SPC_MSG_MAX     SPDEF_PARS	   /* Size of spc message          */
//EAB		7/13/98			Wrong value(english value) breaks when locus theory added
 //i.e NEW_SPANISH otherwise it's unused(old code)
#define SIZTARTAB		39
#if SPC_MSG_MAX < VOICE_PARS
#define SPC_MSG_MAX     VOICE_PARS
#endif
#endif
         
#ifdef GERMAN
#define NPHON_MAX       250			   /* Size of phone[] and struc[] arrays.  */
#define SIZTARTAB	56				   /* # entries/param in maltar[], phrom.c   */
#define MAXSPA	NPHON_MAX			   /* size of sentence parameter structure */
#endif
         
#define DIV_BY8         >> 3
#define DIV_BY128       >> 7

#define MSTOFR(msec)    (((msec+4)*10)/NSAMP_FRAME)
#define frtoms(x)       ((((x) * NSAMP_FRAME)+5)/10)

/* Within the synthesizer, values are represented as fractions. * 1.0 is thus 2**14 == 040000 == 16384 */

#define FRAC_ONE        16384		   /* 1.0                          */
#define FRAC_HALF        8192		   /* 1.0 * 0.50                   */
#define FRAC_3_4THS     12288		   /* 1.0 * 0.75                   */
#define FRAC_3_HALVES   24567		   /* 1.0 * 1.50                   */

/* Used in PHSETTAR.C to determine type of current parameter:           */
/* (see also partyp[] in KLROM.C)                                       */

#define IS_AV_OR_AH             ==0
#define IS_NASAL_ZERO_FREQ      ==1
#define IS_PARALLEL_FORM_AMP    ==2
#define IS_FORM_FREQ            ==3
#define IS_FORM_BW              ==4
#define IS_FORM_FREQ_OR_BW       >2

/* Number of frames in xx milliseconds.  I.e., NF15MS is the number * of synthesizer frames in 15 msec. */

#define NF7MS           1
#define NF15MS  2
#define NF20MS  3
#define NF25MS  4
#define NF30MS  5
#define NF40MS  6
#define NF45MS  7
#define NF50MS  8
#define NF60MS  9
#define NF64MS  10
#define NF70MS  11
#define NF75MS  12
#define NF80MS  13
#define NF100MS 16
#define NF115MS 18
#define NF130MS 20
#define NF160MS 25
#define NF480MS 75
#define NF640MS 100

/* Pause at comma and period (actual pause is NF64MS longer)               */
/* (see also compause and perpause variables settable by user)             */

#ifdef GERMAN
#define NF_COMMA	34
#define NF_PERIOD	150
#endif
#ifdef NWSNOAA
#define NF_COMMA        60
#define NF_PERIOD       120
#else
#if (defined ENGLISH_US) || (defined SPANISH)
#define NF_COMMA        16
#define NF_PERIOD       75
#endif
#if defined ENGLISH_UK
#define NF_COMMA        14
#define NF_PERIOD       70
#endif
#endif /*NWSNOAA*/
/* Fraction corresponding to xx percent of (1.0 = 16384) */

#define	N5PRCNT		  	  819 		   /* 1.0 * 0.05        */
#define N8PRCNT          1311		   /* 1.0 * 0.08        */
#define N10PRCNT         1638		   /* 1.0 * 0.10        */
#define N15PRCNT         2457		   /* 1.0 * 0.15        */
#define N20PRCNT         3277		   /* 1.0 * 0.20        */
#define N25PRCNT         4096		   /* 1.0 * 0.25        */
#define	N30PRCNT	 	 4915		   /* 1.0 * 0.30        */
#define	N35PRCNT	 	 5734	 	   /* 1.0 * 0.35        */
#define	N40PRCNT	 	 6554		   /* 1.0 * 0.40        */
#define N47PRCNT   		 7700 		   /* 1.0 * 0.47		*/
#define N50PRCNT         8192		   /* 1.0 * 0.50    	*/
#define N55PRCNT		 9011
#define N60PRCNT         9831		   /* 1.0 * 0.60        */	
#define N65PRCNT		10650
#define N67PRCNT		10977
#define N70PRCNT        11469		   /* 1.0 * 0.70        */
#define N74PRCNT   		12124
#define N75PRCNT		12288
#define N78PRCNT   		12780
#define N80PRCNT        13108		   /* 1.0 * 0.80        */
#define N82PRCNT   		13435
#define N85PRCNT        13927		   /* 1.0 * 0.85        */
#define N87PRCNT   		14254
#define N90PRCNT        13927		   /* 1.0 * 0.90        */
#define N92PRCNT   		15073
#define N95PRCNT   		15565		   /* 1.0 * 0.95 		*/
#define N97PRCNT   		15892
#define N100PRCNT       16384		   /* 1.0               */
#define N105PRCNT  		17203
#define N107PRCNT  		17531
#define N110PRCNT       18022		   /* 1.0 * 1.10        */
#define N115PRCNT   	18841		   /* 1.0 * 1.15 		*/
#define N117PRCNT   	19169
#define N120PRCNT       19661		   /* 1.0 * 1.20        */
#define N122PRCNT  		19988
#define N125PRCNT   	20480
#define	N130PRCNT		21298		   /* 1.0 * 1.30        */
#define N132PRCNT   	21626
#define	N140PRCNT		22936	       /* 1.0 * 1.40        */
#define	N145PRCNT		23755		   /* 1.0 * 1.45        */
#define N150PRCNT       24576		   /* 1.0 * 1.50        */
#define N160PRCNT       26215		   /* 1.0 * 1.60        */
#define N175PRCNT   	28672		   /* 1.0 * 1.75 		*/
#define	N180PRCNT		29492		   /* 1.0 * 1.80        */
#define	N200PRCNT		32768		   /* 1.0 * 2.00        */



/* 
 * These definitions describe the offsets
 * for the parameters in the "param" array. Code
 * in "kl4", "kl5", and "kl6" knows the order of these
 * entries, for performance. Don't move any of these
 * or you will be sorry.
 */
#define F0      0
#define F1      1
#define F2      2
#define F3      3
#define FZ      4
#define B1      5
#define B2      6
#define B3      7
#define AV      8
#define AP      9
#define A2      10
#define A3      11
#define A4      12
#define A5      13
#define A6      14
#define AB      15
#define TILT    16

/* 
 * These definitions describe the
 * order of the frame data parameters in the
 * actual data block sent to the SPC. They may be
 * edited independently of the above def'ns.
 * Ed can rearrange the block all he wants and
 * it's no problem.
 */

#define OUT_AP  0
#define OUT_F1  1
#define OUT_A2  2
#define OUT_A3  3
#define OUT_A4  4
#define OUT_A5  5
#define OUT_A6  6
#define OUT_AB  7
#define OUT_TLT 8
#define OUT_T0  9
#define OUT_AV  10
#define OUT_F2  11
#define OUT_F3  12
#define OUT_FZ  13
#define OUT_B1  14
#define OUT_B2  15
#define OUT_B3  16

#define OUT_PH  17
#define OUT_DU  18
#ifdef NEW_VTM
#define OUT_FNP 19
#define OUT_GS	20 /* GS controls the glotalstep making a much more sinusoidal type excitation initially for
					nasals (especially German ones) */
#define OUT_OQ  21
#define OUT_BR	22
#define OUT_CB  23 /*Breathiness due to a chink in the vocal folds is more predominant when folds are closed
					and gives a constant background then*/
#define OUT_DP  24
#endif

/* 
 * The parameter structure contains all information needed to compute
 * a synthesizer parameter.  Note, not all entries are used for all
 * parameters, but the structure is optimized for performance.
 */
typedef struct Parameters
{
	short                   tarcur;	   /* Current target value.                */
	short                   durlin;	   /* Duration of current dipthong line,   */
	/* duration of phone if not dipthong.  */
	short                   deldip;	   /* Delta-value per update interval for  */
	/* dipthong specification.             */
	short                   dipcum;	   /* Cumulative amount of dipthongization */
	/* since start of straight line.       */
	short                   ftran;	   /* Forward transition                   */
	short                   dftran;	   /* Delta-value for forward transition   */
	short                   btran;	   /* Backward transition                  */
	short                   dbtran;	   /* Delta-value for backward transition  */
	short                   tbacktr;   /* Beginning time of backward trans.,   */
	/* relative to phoneme onset.          */
	short                   tspesh;	   /* Duration of special constant value   */
	/* at beginning of phoneme.            */
	short                   pspesh;	   /* Value of special constant value at   */
	/* beginning of phoneme.               */
	short                   tarnex;	   /* Next target value                    */
	short                   tarlas;	   /* Last target value                    */
	short                   tarend;	   /* End of last phonememe target value   */
	short                  *ndip;	   /* Pointer to dipthong specification in */
	/* dipspec[] if any for this param.    */
	short                  *outp;	   /* Pointer to where the output goes.    */
}
PARAMETER;

/* 
 * NOTE:        .durlin and .deldip apply only to
 *                      F1, F2, F3, B1, B2, and B3.
 *              .tspesh and .psepsh apply only to
 *                      B1, B2, AV, AP, A2, A3, A4, A5, A6, AB
 * Parameters are stored in param[].  The following define static pointers
 * to param[].  They are in order.
 */
#define PF0     pDph_t->param[F0]
#define PF1     pDph_t->param[F1]
#define PF2     pDph_t->param[F2]
#define PF3     pDph_t->param[F3]
#define PFZ     pDph_t->param[FZ]
#define PB1     pDph_t->param[B1]
#define PB2     pDph_t->param[B2]
#define PB3     pDph_t->param[B3]
#define PAV     pDph_t->param[AV]
#define PAP     pDph_t->param[AP]
#define PA2     pDph_t->param[A2]
#define PA3     pDph_t->param[A3]
#define PA4     pDph_t->param[A4]
#define PA5     pDph_t->param[A5]
#define PA6     pDph_t->param[A6]
#define PAB     pDph_t->param[AB]
#define PTILT   pDph_t->param[TILT]

/* 8.    Speaker definitions                               */

/* 
 * This structure describes a
 * speaker. The first "SPDEF_PARS" words
 * are sent to the chip.  Note that the state
 * field is removed since the driver now appends 
 * it ... kak
 */
typedef struct
{
	short                   r4cb;	   /* Resonator 4, cascade, bandwidth      */
	short                   r4cc;	   /* center freq.    */
	short                   r5cb;
	short                   r5cc;
	short                   r4pb;	   /* Resonator 4, parallel, bandwidth     */
	short                   r5pb;
	short                   t0jit;	   /* Jitter                               */
	short                   r5ca;	   /* Resonator 5, cascade, amplitude      */
	short                   r4ca;
	short                   r3ca;
	short                   r2ca;
	short                   r1ca;
	short                   nopen1;
	short                   nopen2;
	short                   aturb;
	short                   fnscale;
	short                   afgain;
	short                   rnpgain;
	short                   azgain;
	short                   apgain;
	short                   notused;   /* was tltoff, Tilt offset      */
	short                   osgain;
	short                   speaker;
}
SP_CHIP;

#ifdef  MSDOS
#define ZAPF    2500				   /* Magic f  value to zap b constant of diff eqn  */
#define ZAPB    2048				   /* Magic bw value to zap c constant of diff eqn */
#else
#define ZAPF	6000				   /* Magic f  value to zap b constant of diff eqn    */
#define ZAPB	6000				   /* Magic bw value to zap c constant of diff eqn */
#endif

#define F2max   2500				   /* Limit to keep SPC from overloading */
#define F3max   3500				   /* Limit to keep SPC from overloading */

#define MALE    1					   /* Value of malfem for male voice */
#define FEMALE  0					   /* Value of malfem for female voice */

#define NORMAL                  1	   /* Implies rule-generated f0 (default)     */
#define HAT_LOCATIONS_SPECIFIED 2	   /* User specified location of hatrise/fall */
#define HAT_F0_SIZES_SPECIFIED  3	   /* User attached steps and impulses to  */
				  					   /* hatrise, hatfall, and stress phones  */

#define SINGING                 4	   /* Implies, user-requested sung notes   */
#define PHONE_TARGETS_SPECIFIED 5	   /* Implies, user-spec f0 targets for phones */
#define TIME_VALUE_SPECIFIED    6	   /* Implies, user-spec f0 targets at t=time  */

#define SAFETY  8					   /* Offset between shared arrays such as phonemes[SAFETY] * and allophons[0] */

/* 
 * Speaker def. limit table entry.
 */
typedef struct
{
	short                   l_min;	   /* Minimum value                */
	short                   l_max;	   /* Maximum value                */
}
LIMIT;

typedef struct
{
	short                   i_offset;  /* Offset into "symbols"        */
	short                   i_type;	   /* Type, "INDEX", "INDEX_REPLY" */
	short                   i_value;   /* The value of the index       */
}
IQUEUE;

#define NIQUEUE 250					   /* # of index events            */
#define GUARD   25					   /* WBOUND => COMMA guardband    */

/* 
 *  math function prototypes ...
 */

#ifdef MSDOS

S32                     klrmul (S32, S32);
S32                     kllmul (S32, S32 *);
S32                     klrdiv (S32, S32);
S32                     klldiv (S32, S32 *);
short                   muldv ();
short                   mlsh1 ();
short                   mlsh2 ();
short                   mlsh3 ();
short                   frac1mul ();
short                   frac4mul ();

#else

/* !! These definitions need to be checked to make sure they are right */

#define klrmul(x,y)     ((x) * (y))
#define kllmul(x,y)     ((x) * (*(y)))
#define klrdiv(x,y)     ((x) / (y))
#define klldiv(x,y)     ((x) / (*(y)))
#define muldv(x,y,z)         (((x) * (y)) / (z))
#define mlsh1(x,y)         (((x) * (y)) >> 14)
/* 
 * #define mlsh2()         ((arg1*arg2) << 3) #define mlsh3() ((arg1*arg2) << 4) */

#define  frac4mul(x,y)  (((x)*(S32)(y))>>12)
#define  frac1mul(x,y)  (((x)*(S32)(y))>>15)

#endif								   /* #ifdef MSDOS */

/* moved from phmain.c */
#define isbound(ph)     ((ph)>=WBOUND  && (ph)<=VPSTART)
#define ispause(ph)     ((ph)>=VPSTART && (ph)<=EXCLAIM)
#define issmark(ph)     ((ph)>=WBOUND  && (ph)<=EXCLAIM)
#define isdelim(ph)     ((ph)>=COMMA   && (ph)<=EXCLAIM)

#ifdef GERMAN
/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* necessary definitions for sentence intonation            */
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

typedef struct Sentence_Intonation
{
	unsigned                Final_Cadence:1;		/* Flag for final cadence */
	unsigned                Last_Str_Sentence:1;	/* Flag for begin of falling cadence */
	unsigned                Cont_Cadence:1;			/* Flag for begin of rising cadence */
	unsigned                Question:1;				/* Flag for indicating question */
	unsigned                Exclamation:1;			/* Flag for indicating exclamation */
	unsigned                Top:1;	   				/* Flag for top in final cadence */
}
SENTENCE_INTONATION;

#define EMPH_FALL	1				   /* stress reduce shift for emph. stress 	*/
#define DELTAEMPH_SPEC  505			   /* special value for fast emphatic str 	*/
#define DELTAEMPH	501				   /* normal value for emphatic stress 		*/
#define DELTASTR1	201-100			   /* primary stress         				*/
#define DELTASTR2	71-20			   /* secondary stress           			*/
#define DELTASTR3	41-10			   /* tertiary stress            			*/
#define DELTARISE	200				   /* rise for continuing cadence        	*/
#define DELTAFINAL	100				   /* delta to remain at top in final cad. 	*/
#define FINAL_FALL	1				   /* stress reduce shift for str. at top 	*/
#define DELTAFALL	200-100			   /* delta for stress fall at end       	*/
#define DELTAQUEST	600-100			   /* delta for question         			*/

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
/* structure needed for sentence intonation         					 */
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
typedef struct sent_pars
{
	char                    phopoint;  		/* table index of current phoneme     */
	unsigned                wordclass:7;	/* word class of phoneme in phopoint  */
	unsigned                bouflag:1; 		/* flag to insert syntactic boundary  */
}
SENT_PARS;

#endif
 

#ifdef GERMAN

/*eab 2/26/97 EAB Group hardcoded items into one file to be 
handled differently later*/
/*Note F0_Final _fall is the number of hertz *10 that it
will try to fall below the baseline on a declarative stressed final syllable.*/

#define SCHWA1 4
#define SCHWA2 4
#define F0_QGesture1 181
#define F0_QGesture2 251
#define F0_CGesture1  100
#define F0_CGesture2  380
#define GEST_SHIFT 1
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	160
#define   F0_NON_FINAL_FALL  100
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -20 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define Reduce_last 100

#endif
 
#ifdef SPANISH_LA
#define   F0_MORE_FALL     150
#define   F0_QBOUND_PULSE   1000
#define   F0_CBOUND_PULSE   700
#define   F0_GLOTTALIZE    -2 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define SCHWA1 36
#define SCHWA2 36
#define F0_QGesture1 381
#define F0_QGesture2 551
#define F0_CGesture1 -81
#define F0_CGesture2  151
#define GEST_SHIFT 2
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	212
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define Reduce_last 70

#endif

#ifdef SPANISH_SP
#define   F0_MORE_FALL     150
#define   F0_QBOUND_PULSE   1000
#define   F0_CBOUND_PULSE   700
#define   F0_GLOTTALIZE     -2 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define SCHWA1 36
#define SCHWA2 36
#define F0_QGesture1 381
#define F0_QGesture2 551
#define F0_CGesture1 -90
#define F0_CGesture2  171
#define GEST_SHIFT 2
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	212
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define Reduce_last 150

#endif


#ifdef ENGLISH_US
#define SCHWA1 17
#define SCHWA2 18
#define F0_QGesture1 351
#define F0_QGesture2 451
#define F0_CGesture1 -101
#define F0_CGesture2 271
#define GEST_SHIFT 1
#define   MAX_NRISES   5   	
#define   F0_FINAL_FALL   	212
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -20 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define Reduce_last 50




#endif

#ifdef ENGLISH_UK
#define SCHWA1 17
#define SCHWA2 18
#define F0_QGesture1 351
#define F0_QGesture2 451
#define F0_CGesture1 -50
#define F0_CGesture2  +100
#define GEST_SHIFT 1
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	212
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -10 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define Reduce_last 50


#endif


/* GL 04/15/98, BATS#492  create get_phone() macro */
#define get_phone(X, Y)   ( (((Y) >= 0) && ((Y) < X->nallotot)) ? (X->allophons[(Y)]) : (SIL) )

	
#endif


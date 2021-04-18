/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    U.S. Government Rights: Consistent with FAR 12.211 and 12.212, 
 *    Commercial Computer Software, Computer Software Documentation, 
 *    and Technical Data for Commercial Items are licensed to the U.S. 
 *    Government under vendor's standard commercial license.
 *
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a  valid written license from Force or an
 *    authorized sublicensor.  
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
 * 0007 DK		07/24/1985		Remove tltoff from set of spdefs sent to chip
 *                      		rename OUTPAR structure to be parstochip[]
 *                              array.
 * 0008 EAB		06/01/1994 		Added time_value_specfied for merge of ph88
 * 0009 CJL		12/15/1994 		Added pre-processor code to prevent dupilcate
 *                              inclusions.
 * 0010 MGS		03/25/1996	    Merged WIN 95 code with 42c 
 * 0007 MM		05/14/1985	    Cleaned up OUT_ junk
 * 0008 MM		04/10/1986	    Removed English specific stuff -- error prone.
 * 0009 CJL		02/08/1995	    Add include excusion pre-processor code, FMEDIALSYL,
 *                              and FFINALSYL.
 * 0010 EAB		02/16/1999		Removed out_cb until and if we decide to model vocal chinks
 * 0008 BK 		07/21/1986	   	Add tertiary and lowest stress flag and move
 *           					initial word consonant flag
 * 0009 BK		09/24/1986     	add definitions for sentence intonation
 * 0010 CJL		03/30/1995		File was phdefs.h. Id now gphdefs.h
 * 0011 EAB		02/21/1996		Modified comma pause per Sonia
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
 * 0021 EAB     03/20/1998		Added new definitons for new_vtm and expanded definitions
 *								for languages and removed ifdef'ed stuff for NWSNOAA that aren't
 *								needed any more and caused problems and added new include for dectalk.f
 * 0022 EAB		04/7/1998		Cleaned up phinton defines for languages
 * 0023 GL		04/15/1998		For BATS#492 convert get_phone() to macro
 * 0024 EAB     04/27/1998      Many tuning changes for German
 * 0025 EAB		07/13/1998		Changes for BATS 711 to allow for the use of form class and
 *								expanded feature bits size to allow for more features
 * 0026	MFG		06/18/1998		SPANISH_SP & SPANISH_LA support added
 * 0027 EAB		07/16/1998		Found Fmaximum redefinition warning- deleted old German entry
 *								a result of BATS 711 German enhancement
 * 0028 EAB		09/11/1998		Improved Spanish intonation
 * 0029 EAB		09/29/1998 		Tuned intonation values(shuld these be moved to ph_inton??? 
 * 0030 ETT		10/05/1998		added linux code.
 * 0031 EAB		10/15/1998 		More intonation gesture tuning
 * 0031 EAB		11/4/1998		Final glotalization gestures values needed tuning (F0_GLOTTALIZE)
								BATS796 Also made other languages very small value but in the correct direction
 * 054  EAB		02/03/1999		Added change from NWSNOAA->NWS_US for multi language NOA plus new code for Evan Blalban
								and tuning of some values for new intonation
 * 055  eab     04/17/2000 		New_vocal_tract_nasal changes for 4.6 relelase
 * 055  EAB		04/15/2000		SPD_CHIP change
 * 055  EAB 	02/23/1999 		Added new time define; updated copright and gov reg notice and  stop using asterixs on comments
 * 056  EAB 	03/26/1999 		Added masks to support BATS 878 in p_us_st1
 * 057  EAB 	05/26/2000		Added GEN_SIL for integrated phonemes
 * 058  CHJ 	07/20/2000		French added					
 * 059  EAB 	07/28/2000		Added ouput of phone+1 for SAPI
 * 060  CHJ 	07/28/2000		Major changes to the French feature bits
 * 061 	CAB		10/18/2000		Changed copyright info
 * 062	CAB		01/16/2001		Merged Michel Divay changes for French
 * 063  EAB 	02/28/2001 		Reduce question gest for german
 * 064  EAB	03/02/2001 		Add ifdef to force 8khz
 * 065	MGS	04/03/2001		Fixed ZAPF and ZAPB for french
 * 066	MGS	05/09/2001		Some VxWorks porting BATS#972
 * 067	MGS	06/19/2001		Solaris Port BATS#972
 * 068  eab 	7/10/01 ADED OUT_GF FOR HLSYN INT VOCAL TRACTS
 * 069 MGS	04/17/2002	ARM7 port
 ***************************************************************************************************/

#ifndef PHDEFSH
#define PHDEFSH

#include "dectalkf.h"
#include "fc_def.tab"    //feature bit definitions  eab 7/15/98


#include "defs.h"
#include "kernel.h"
#include "dectalk.h"
#include "esc.h"
#include "cmd.h"

#define GEN_SIL 0x01E00

//#define SUEB
#define DIANE
//#define OLD_VOICES


#define Dont_flap_after_r
#ifdef NEW_PHONES
#include "p_all_ph.h"
#else
#ifdef ENGLISH_US
#define Dont_flap_after_r 
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
#ifdef ITALIAN
#include "l_it_ph.h"
#endif                
#ifdef GERMAN
#include "l_gr_ph.h"
#endif
#ifdef FRENCH
#include "l_fr_ph.h"
#endif
#endif
//#define FASTTALK
//#define PH_SWAPDATA //Special code for Evan Balaban
#define BLADEAFFECTED ( FDENTAL | FPALATL | FALVEL  )
#define QUESTION 3
#define EXCLAIMCLAUSE 2
#define COMMACLAUSE 1
#define DECLARATIVE 0

#define NON_NASAL_ZERO 290
#define NASAL_ZERO_BOUNDARY 370
#define NASAL_ZERO_CONS 400
//#define TUNE_8KHZ_VOICE


#define  USER		0
#define	 IMPULSE	1
#define  STEP		2
#define	 F0_RESET	3
#define  GLOTTAL		4
#define	 GLIDE		5
#define  SHORTIMPULSE   6


/* The following stuff is all unique to modules named ph*.c */
 
 
#ifdef MSDOS
#define NULL    ((void *)0)
#endif
 

//EAB		7/13/98			Changes for BATS 711
#define WORDFEAT		0xffff0000
         
#define FSTRESS           03		   /* Stress feature bits                  	*/


#define FNOSTRESS          0		   /* Value of FSTRESS if not stressed    	*/
#define FSTRESS_1         01		   /* Value of FSTRESS for primary stress 	*/
#define FSTRESS_2         02		   /* Value of FSTRESS for secondary stres 	*/
#define FEMPHASIS         03		   /* Value of FSTRESS for emphasis       	*/


#define FWINITC           04		   /* Word-initial consonant               	*/



#define FOPEN_SYL         04		   /* Vowel in open syllable or            	*/




#define FBISYL           010		   /* Value for bisyllabic word           	*/
#define FTRISYL          020		   /* Value for trisyllabic word          	*/
#define FMULTISYL        030		   /* Value for more than 3 syll. word    	*/

#define FSYBNEXT        0040		   /* Value of FBOUNDARY if syllable bound 	*/
#define FSYL_SHIFT         3		   /* Shift for syllable structure bits    	*/

#define FMONOSYL         000		   /* Value for monosyllabic word         	*/
#define FFIRSTSYL        010		   /* Value of FSYL_STRUC for first syll  	*/
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


#define FSENTENDS       0400		   /* Next boundary is a sentence end      	*/ 


#define FHAT_BEGINS     01000
#define FHAT_ENDS       02000

#define AT_BOTTOM_OF_HAT        1
#define AT_TOP_OF_HAT           2

#define FDUMMY_VOWEL    004000		   /* Do not count this plosive release gesture */



//#define FHYPHENATED     010000 Not USed

#define FBLOCK          020000 

//EAB		7/13/98			Changes for BATS 711
#define FDOUBLECONS		0x40000

#define FOTHER          (FSBOUND | FCODA | FBLOCK | FWINITC)
#define FOTHER_SHIFT    12
#define FISBOUND        03000000		   /* Value of FBOUNDARY if syllable bound */
#define FSBOUND			01000000
#define FCODA           02000000
#define PRESSBOUND		04000000

//#define FMAXIMUM        037777		   /* Any feature > this is illegal        		*/



#define F_TIME_RISE		000001000000
#define F_NOUN			000002000000	/* added noun and adjective of types to stress*/
#define F_ADJ			000004000000
#define F_VERB			000010000000
#define F_FUNC			000020000000


#define F_IRESET		004000000000
#define FMAXIMUM        010000000000


#define	FWBEND		010000			   /* last phone of word 						*/
#define	FHAT_ROOF	0100000			   /* hat roof marker, dangerous!!!!			*/

// 4.  Phonetic feature values allowed in featb[]
//eab 6/13/00 Combined featb definitions



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
#define TLiqGli FSONCON

#define FSON2   0002000				   /* /w, y, r, l, yu/, /m, n, ng, em, en/      */
#define FBURST  0004000				   /* plosives and affricates                   */
#define FSTMARK 0010000				   /* [', `, !]                                 */
// for French, see below : #define TFricative           FSTMARK
#define FSTOP   0020000				   /* Plosives, affricates, and nasals          */
#define FSEMIV  0040000 /* Semivowels (Y, W, YX, WX)                    */
#define FDIPTH  0100000 /* [i], [u], [yx], [wx]                         */


// 4. Phonetic feature values allowed in place[]

#define FLABIAL 0000001				   /* p, b, m, f, v                        */
#define FDENTAL 0000002				   /* th, dh, d$                           */
#define FPALATL 0000004				   /* sh, zh, ch, jh                       */
#define FALVEL  0000010				   /* t, d, n, en, s, z, tx (not l,r,dx)   */
#define FVELAR  0000020				   /* k, g, nx                             */
#define FGLOTTAL 0000040				   /* h, q, tq                             */
#define F2BACKI 0000100				   /* iy, y, yu                            */
#define F2BACKF 0000200				   /* iy, y, ey (not ay,oy)                */



#define MASKFRONT	0000017

 
#define IS_PLUS !=0					   /* If feature value is plus, some bit is set    */
#define IS_MINUS ==0

/* 6. Various constants  */

#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_ 
#define NSAMP_FRAME     71			/* # of samples per output frame 11 KHz. */

#ifdef NEW_VTM
#define VOICE_PARS	40			   /* EAB found looking for BAT3 667 this should
				                      not really cause a problem
						      at the moment BUT IT COULD BE NASTY LATER!*/
#else //!NEW_VTM
#define VOICE_PARS      21			   /* # of words in a voice block.         */
#endif //NEW_VTM
#define SPDEF_PARS      SPDEF+1			   /* # of words in a speaker definition.  */
#define SYNC_PARS        0			   /* There are no sync parameters. */
#define INDEX_PARS       2			   /* # of words in an index mark block */
#define TONE_PARS        5			   /* # of words in a tone packet */

#elif defined MSDOS
#define NSAMP_FRAME     64			   /* # of samples per output frame 10 KHz. */
#define VOICE_PARS      18			   /* # of words in a voice block.         */
#define SPDEF_PARS      SPDEF+1			   /* # of words in a speaker definition.  */

#else  // !msdos !osf !linux
#define NSAMP_FRAME     71 			   /* # of samples per output frame 11 KHz. */
#ifdef NEW_VTM

#define VOICE_PARS		40			   /* EAB found looking for BAT3 667 this should
				                      not really cause a problem
						      at the moment BUT IT COULD BE NASTY LATER!*/
#else //!NEW_VTM
#define VOICE_PARS      21			   /* # of words in a voice block.         */
#endif //NEW_VTM
#define SPDEF_PARS      SPDEF+1			   /* # of words in a speaker definition.  */
#define SYNC_PARS        0			   /* There are no sync parameters. */
#define INDEX_PARS       2			   /* # of words in an index mark block */
#define TONE_PARS        5			   /* # of words in a tone packet */

#endif // 6. Various Constants


#ifdef ARM7
#define NPHON_MAX       150			   /* Size of phone[] and struc[] arrays.  */
#else
#ifdef TOMBUCHLER
#define NPHON_MAX       2800			   /* Size of phone[] and struc[] arrays.  */
#else 
#define NPHON_MAX       300
#endif //tombuchler
#endif //arm7
#define MALLINE 9					   /* # of parameters in a line of locus code(phrom.c)     */


         
         
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
#define NF90MS  14
#define NF100MS 16
#define NF115MS 18
#define NF130MS 20
#define NF160MS 25
#define NF480MS 75
#define NF640MS 100

/* Pause at comma and period (actual pause is NF64MS longer)               */
/* (see also compause and perpause variables settable by user)             */


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
#define N58PRCNT         9502		   /* 1.0 * 0.58        */
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
#define N135PRCNT       22118		   /* 1.0 * 1.35        */
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
#define AREAB	17
#define AREAL	18	
#define AREAG	19
#define AREAN	20
#define PRESS	21
#define TONGUEBODY 22
#define CHINK	23
#define UEL		24
#define DC		35
#define	OQU		36
#define BRST	37

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
#define OUT_PH2 19

#ifdef NEW_VTM

#define OUT_FNP 20 

#define OUT_GF  21 
 

#define OUT_F4  22
#define OUT_SEX	23
#define OUT_DP  24
#define OUT_AG  25
#define OUT_AL	26
#define OUT_AN	27
#define OUT_ABLADE	28
#define OUT_PS	29
#define OUT_CNK 30
#define OUT_DC	31
#define OUT_UE	32
#define OUT_OQ  33
#define OUT_BNP 34
#define OUT_BRST 35
#define OUT_ATB  36
#define OUT_PLACE 37


#endif //NEW_VTM



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
	short					a_g;
	short					a_n;
	short					a_l;
	short					a_b;
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
#define PAREAG	pDph_t->param[AREAG]
#define PAREAL	pDph_t->param[AREAL]
#define PAREAN	pDph_t->param[AREAN]
#define PAREAB	pDph_t->param[AREAB]
#define PTONGUEBODY pDph_t->param[TONGUEBODY]
#define PPRESS  pDph_t->param[PRESS]
#define PUEL  pDph_t->param[UEL]
#define PDC  pDph_t->param[DC]


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
	short					sex;
}
SPD_CHIP;

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
#define muldv(x,y,z)         (((S32)(x) * (S32)(y)) / (S32)(z))
#define mlsh1(x,y)         (S16)(((S32)((S32)(x) * (S32)(y))) >> ((S32)14) )
/* 
 * #define mlsh2()         ((arg1*arg2) << 3) #define mlsh3() ((arg1*arg2) << 4) */

#define  frac4mul(x,y)  (((S32)(x)*(S32)(y))>>12)
#define  frac1mul(x,y)  (((S32)(x)*(S32)(y))>>15)

#endif								   /* #ifdef MSDOS */

/* moved from phmain.c */
#define isbound(ph)     ((ph)>=WBOUND  && (ph)<=VPSTART)
#define ispause(ph)     ((ph)>=VPSTART && (ph)<=EXCLAIM)
#define issmark(ph)     ((ph)>=WBOUND  && (ph)<=EXCLAIM)
#define isdelim(ph)     ((ph)>=COMMA   && (ph)<=EXCLAIM)



#ifndef HLSYN
#ifdef GERMAN

/* eab 2/26/97 EAB Group hardcoded items into one file to be 
handled differently later */
/* Note F0_Final _fall is the number of hertz *10 that it
   will try to fall below the baseline on a declarative stressed final syllable.
*/

#define SCHWA1 GRP_EX
#define SCHWA2 GRP_EX
#define F0_QGesture1 281-100
#define F0_QGesture2 351-100
#define F0_CGesture1  160-60
#define F0_CGesture2  140-60
#define GEST_SHIFT 1
#define   MAX_NRISES  6
#define   F0_FINAL_FALL 180
#define   F0_NON_FINAL_FALL  80
#define	  F0_QSYLL_FALL	80
#define   F0_GLOTTALIZE  -100
#define Reduce_last 50

#endif
 
#ifdef SPANISH_LA


#define   F0_CBOUND_PULSE   700
#define   F0_GLOTTALIZE    -60 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define SCHWA1 LAP_IX
#define SCHWA2 LAP_IX
#define F0_QGesture1 -150
#define F0_QGesture2 -350
#define F0_CGesture1 -81
#define F0_CGesture2  171
#define GEST_SHIFT 2
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	180
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define Reduce_last 70

#endif
#ifdef ITALIAN


#define   F0_CBOUND_PULSE   700
#define   F0_GLOTTALIZE    -60 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define SCHWA1 LAP_IX
#define SCHWA2 LAP_IX
#define F0_QGesture1 -150
#define F0_QGesture2 -350
#define F0_CGesture1 -81
#define F0_CGesture2  171
#define GEST_SHIFT 2
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	180
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define Reduce_last 70
#endif 

#ifdef SPANISH_SP


#define   F0_CBOUND_PULSE   700
#define   F0_GLOTTALIZE     -60 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define SCHWA1 SPP_IX
#define SCHWA2 SPP_IX
#define F0_QGesture1 -150
#define F0_QGesture2 -350
#define F0_CGesture1 -81
#define F0_CGesture2  171
#define GEST_SHIFT 2
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	180
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define Reduce_last 70

#endif


#ifdef ENGLISH_US
#define SCHWA1 USP_AX
#define SCHWA2 USP_IX
#define F0_QGesture1 351
#define F0_QGesture2 451
#define F0_CGesture1 171
#define F0_CGesture2 250
#define GEST_SHIFT 1
#define   MAX_NRISES   7   	
#define   F0_FINAL_FALL   	180 
#define   F0_NON_FINAL_FALL  	150
#define	  F0_COMMA_FALL		120
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -60 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define   Reduce_last 50

#endif

#ifdef FRENCH
#define SCHWA1 FP_AP
#define SCHWA2 FP_E
#define F0_QGesture1 351
#define F0_QGesture2 451
#define F0_CGesture1 171
#define F0_CGesture2 250
#define GEST_SHIFT 1
#define   MAX_NRISES   7   	
#define F0_FINAL_FALL       80
#define   F0_NON_FINAL_FALL  	150
#define	  F0_COMMA_FALL		60
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -410 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define   Reduce_last 50

#endif

#ifdef ENGLISH_UK
#define SCHWA1 UKP_AX
#define SCHWA2 UKP_IX
#define F0_QGesture1 351
#define F0_QGesture2 451
#define F0_CGesture1 -50
#define F0_CGesture2  220
#define GEST_SHIFT 1
#define   MAX_NRISES      	6
#define   F0_FINAL_FALL   	180
#define   F0_NON_FINAL_FALL  	150
#define	  F0_QSYLL_FALL		80
#define   F0_GLOTTALIZE    -10 //New method that drops per cycle rather than impulse BATS 796 EAB 11/4/98
#define	  F0_COMMA_FALL		120
#define Reduce_last 50

#endif
#endif



/* GL 04/15/98, BATS#492  create get_phone() macro */
#define get_phone(X, Y)   ( (((Y) >= 0) && ((Y) < X->nallotot)) ? (X->allophons[(Y)]) : (GEN_SIL) )


// french stuff starts
// features for French phonemes : featb array in p_fr_rom.c
#define TFricative           FSTMARK  // 16 bits only for short in fr_featb;
                                      // FSTMARK is not used for French
#define N_PARAM              17       // from 0 to 16




#define FMOT       0x0001
#define FSYNT      0x0002
#define FPROP      0x0004
#define ACCEN      0x0008
#define FGROU      0x0010
#define DERACC     0x0020
#define RAISE      0x0040
//#define FEMPHASIS  0x0080


// phtiming.c
#define PCent0               0
#define PCent1               1
#define PCent2               2
#define PCent3               2
#define PCent4               3
#define PCent5               4
#define PCent6               4
#define PCent7               5
#define PCent8               6
#define PCent9               6
#define PCent10              7
#define PCent11              8
#define PCent12              8
#define PCent13              9
#define PCent14              9
#define PCent15              10
#define PCent16              11
#define PCent17              11
#define PCent18              12
#define PCent19              13
#define PCent20              13
#define PCent21              14
#define PCent22              15
#define PCent23              15
#define PCent24              16
#define PCent25              16
#define PCent26              17
#define PCent27              18
#define PCent28              18
#define PCent29              19
#define PCent30              20
#define PCent31              20
#define PCent32              21
#define PCent33              22
#define PCent34              22
#define PCent35              23
#define PCent36              24
#define PCent37              24
#define PCent38              25
#define PCent39              25
#define PCent40              26
#define PCent41              27
#define PCent42              27
#define PCent43              28
#define PCent44              29
#define PCent45              29
#define PCent46              30
#define PCent47              31
#define PCent48              31
#define PCent49              32
#define PCent50              32
#define PCent51              33
#define PCent52              34
#define PCent53              34
#define PCent54              35
#define PCent55              36
#define PCent56              36
#define PCent57              37
#define PCent58              38
#define PCent59              38
#define PCent60              39
#define PCent61              40
#define PCent62              40
#define PCent63              41
#define PCent64              41
#define PCent65              42
#define PCent66              43
#define PCent67              43
#define PCent68              44
#define PCent69              45
#define PCent70              45
#define PCent71              46
#define PCent72              47
#define PCent73              47
#define PCent74              48
#define PCent75              48
#define PCent76              49
#define PCent77              50
#define PCent78              50
#define PCent79              51
#define PCent80              52
#define PCent81              52
#define PCent82              53
#define PCent83              54
#define PCent84              54
#define PCent85              55
#define PCent86              56
#define PCent87              56
#define PCent88              57
#define PCent89              57
#define PCent90              58
#define PCent91              59
#define PCent92              59
#define PCent93              60
#define PCent94              61
#define PCent95              61
#define PCent96              62
#define PCent97              63
#define PCent98              63
#define PCent99              64
#define PCent100             64

#define Duree_Trame          6



	


#endif // PHDEFSH

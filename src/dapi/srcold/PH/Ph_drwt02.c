/*				P H D R A W T 0 . C 			*/
/* Copyright	1988,				by Dennis H. Klatt	*/
/* 
***********************************************************************
*
*							 Copyright ©
*	  Copyright © 2002 Fonix Corporation. All rights reserved. 
*	  Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved. 
*	  © Digital Equipment Corporation 1995,1998,1999. All rights reserved.
*	  Copyright    1984 			   by Dennis H. Klatt
*
*	  U.S. Government Rights: Consistent with FAR 12.211 and 12.212, 
*	  Commercial Computer Software, Computer Software Documentation, 
*	  and Technical Data for Commercial Items are licensed to the U.S. 
*	  Government under vendor's standard commercial license.*
*
*	  This software is proprietary to and embodies the confidential
*	  technology of Fonix Corporation and other parties.
*	  Possession, use, or copying of this software and media is authorized
*	  only pursuant to a valid written license from Fonix or an
*	  authorized sublicensor.
*
***********************************************************************
*	  File Name:	phdrawt0.c
*	  Author:
*	  Creation Date:
*
*	  Functionality:
*	  Extend f0 contour to obtain next value for period T0
*		(low-pass filter a set of step and impulse commands)
*
***********************************************************************
*	  Revision History:
* 0001  1-Dec-84	DK		Initial creation
* 0002	27-Dec-84	DGC		Modify for 80186
* 0003  3-Jan-85	DK		Fix handling of user f0 input commands
* 0004	16-Jan-85	DK		Investigate desirability of adding rand var to target
* 0005	29-Jan-85	DK		Cause AV to go down during glottal stop gesture
* 0006	11-Feb-85	DK		Reduce random waver in f0
* 0007  1-Mar-85	DK		Move scale_str_rise to PHINTON.C where it belongs
* 0008	19-Mar-85	DK		Make segmental f0 gestures fast
* 0009	17-Apr-85	DK		Segmental effects: only voiceless C fast, -stress less,
*							effect larger at beginning of V than at end.
* 0010	13-May-85	DK		Make getcosine() into a table, cos[0] = 1.0 = 164
* 0011	17-May-85	DK		Reduce frequencies of cosine pseudojitter
* 0012  8-Aug-85	DK		Fix linear_interp() bug, overshoot of singing targets
* 0013	25-Mar-96	MGS		Merged WIN 95 Code with 42c
* 0014	01-Apr-96	MGS		Made sure all local varialbes were being initialized.
*/


/*
* Edit history
* 0001 1-Dec-84	DK		Initial creation
* 0002 31-Aug-85	DK		DECtalk 3.0 frozen
* 0003 23-May-86	DK		Random fluctuations in f0 are too fast, amount of
fluctuation should be a speaker def parameter
* 0004 19-Sep-86	DK		Make stress impulse more like a rising ramp
* 0005 13-Jan-87	DK		New f0mode option: TIME_VALUE_SPECIFIED {time,value}
* 0006 11-Mar-87	DK		Fix bugs in TIME_VALUE_SPECIFIED
* 0007 24-Mar-88	DK		Use separate filter for segmental effects
* 0008 10-jul-96	EAB 	New code major changes preparinf for re-write
* 0009 7-aug-96	eab 	Modifying code to allow for newbasline tmeplate.
*	
* 0010 03/30/97			EAB Merging in French and AD code the merge was simpler
*							by merging the production file into the AD file so for 
*							more history see previous versions of the file. 
* 0011 04/11/97	EAB 	Found that some variables (cos functions) were getting initialized at the wrong time 
*							feating their function.
* 0012 8/17/98 	EAB 	Added seperate baseline for spanish_la
* 0014 10/26/00	EAB 		Enable length function. 
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
* 0013 BNK 	07/29/2986		preliminary adaption for german phonemes
* 0014 BNK 	01/15/1987		implementation of german sentence intonation
* 0015 BNK 	07/26/1987		change DECtalk-1 shift-operations for DECtalk-3
* 0016 CJL 	03/30/1995		File was phdrawt0.c. Is now gphdrawt0.c. Changed
*								phdefs.h->gphdefs.h
* 0017 JDB 	09/21/1995		removed some QQ* terms from test conditions
* 0018 EAb 	04/07/1996		Modified FASFIL and ramp time to reduce speed of
*								gestures. Perceptual we wnat to re-write code to
*								allow for nmore gestures
* 0019 EAB 3/13/01 EAB Tuning of intonation with winfried
Later edit history of old ph_drwt0.c
* 0013 MGS 	03/25/1996		Merged WIN 95 Code with 42c
* 0014 MGS 	04/01/1996		Made sure all local varialbes were being initialized.
* 0015 MGS 	06/03/1996		Merged Spanish with English
* 0016 MGS 	06/06/1996		Changed file name from phdrawt0.c to ph_drwt0.c 
* 0017 SIK 	07/12/1996		Cleaning up and maintenance
* 0018 GL		09/10/1996		Add printf("\n") for WIN95 dologphone()
* 0019 GL		09/10/1996		Add debug switch to dump phone logging.
* 0020 EDB 	01/10/1997		Fix many data. simplify the Spanish code.
* 0021 EAB 	7/8/97			More tuning of merged vocal tract.
* 0022 EAB 	9/29/98 		Refining and tuning the new intonation lot's of small
changes 
End old comments

  *	0021 EAB		04/02/97		Merged to support both French and 5.0 merges
  Added new variables also need to update phinton.c because these
  are partner files. Chnages too numerous to iterate because this version
  is architectually different from the old. Consider it a new file.
  *	0022 EAB		04/04/97		EAB Removed new_sentence from german it existed but did nothing
  *	0023 EAB		04/14/97		Moved functional ifdef NEWBASELINE to phdefs because it wil encompass
  *									changes to more than just ph_inton.
  *	0024 KSB		05/20/1997		Moved f0 and place to gl_phones
  *	0025 EAB		9/8/97			Merged into RND for NOAA and possibly KURZ forget about diffing
  *	0026 EAB/CJL	11/07/97		Female NWSNOAA & GRAPHF0 code. Instead of adding all the peices
  toegther and then scaling the entire mess. I broke the f0 code into it's 
  constiuent pieces and added at the end. This is both for the US and for NOAA.
  This makes it possible to have diferent parts scale differently in the female
  (and male) voices. ALso he base DC level the baseline was also sent through the low
  pass filter. It agains reduces flexibility and their is no reason to do this.
  
	*	0027  EAB		11/11/97		Since the code issue is very sensitive I have added a MALFEM switch so that you get
	EXactly the OLD code if it's a male voice and the new code I need for the female voice
	Acutally this may be good for a while to try to improve the female voice weithout worrying
	about breaking the amle voice.
	*	0028  EAB		11/22/97		Remove glotalization from UK_ENGLISH per Caroline.
	*	0029  EAB		11/24/97		Remove creek from male voice only per noaa/carl
	*	0030  EAB		01/10/98		Added length parameter to code (glide command first to use
	*	0031  EAB		01/21/98		Added the glide command which cause a pitch rise or fall that occurs over the length
	*									of the phoneme linearly and then remains at the level reached
	*	0032  EAB		01/21/98		Added baseline profile per caroline as well as disabled unsed UK commands 
	by adding a break;
	*	0033  EAB		02./16/98		Removing old garbage (get_cos routine, experminental code ifdef newbase, unifying into one source structure, 
	and separating out gestures by sex(or voice later don't touch nwsnoaa)
	*	0034  EAB		04/6/98 		Oliver made me do it....I tuned the German intonation, in general he feels if should be quite flat so we're
	adding things trying to make it more natural and "alive" without overdoing it....
	0035  EAB		04/27/98		Many tuning changes for German and new version of languages, since this code is enabled by NEW_INTONATION
	which presently is only valid for German I didn't ifdef out the new stuff because it will be pervasive
	and I've already started tuning American English This file should be viewed conceptually as a new
	replaement for ph_drwt01.c being first submitted now for German 
	0036  EAB		5/18/98 		Found clauseposition after break instead of before in case statements 
	0037  EAB		7/13/98 		BATS 711 Whole file needs to be moved to RND.....
	0038  EAB		7/15/98 		BATS 704 see 0036 change
	0039  EAB		7/22/98 		scaled intonation in female voices to aovid over driving filter
	0040  EAB		8/17/98 		Modified segtars 3000 too strongon some also modified behavior on sentnences
	with multiple comma caluses.
	0041  EAB		09/11/1998		Evaluated new code base and made fixes and improvements, more work to be done.
	0042  EAB		10/16/1998		Tuned for new release of all languages on new_intonation platform.
	0043  EAB						Putting ENGLISH_UK onto this development base
	0044  EAB						Refinesd F1 F0 relationship 
	0055  EAB		10/20/1998		Reduce effect further for Spanish (f1 f0)
	0056  EAB	0044 11/09/1998 	UK_English male and female voice BATS 777
	if (new_intonation enabled for UK) This as part of the overall 5.0
	tuning process file in AD already contains changes 
	057  EAB		02/23/1999		Added in copyright plus new gov wording plus removed incorrect
	time adjustment(found Bill Hallhan had added comp in
	vtm
	*	056  EAB	05/03/1999		Fixed BATS 887
	*	057  MGS	12/17/1999		Fix for SAPI symbol conflict
	*	058  EAB	04/17/2000		Many tuning changes for 4.6 release 
	*	058  MGS	04/13/2000		Changes for integrated phoneme set 
	*	059  NAL	04/14/2000		Fixed externs featb, place to match ph_rom.c files
	*	060  CHJ	07/20/2000		French added. The female part needs to be in for French
	*	061  CHJ	07/28/2000		French female voices work now
	*	062  CAB	09/21/2000		Fixed copyright info and formatted comment section.
	*	066  MGS	09/21/2000		Fixed Whitespace before #ifdefs and friends 
	*	067  EAB	09/16/2000		Found it missing a line. Also bosted female declar pitch baseline
	*	068  MGS	01/18/2001		Removed arg1 arg2 and arg3 from calculations
	*	069  eab	03/22/2001		MODIFIED to improve discrimtaion between df and dx flaps. 
	*	069  CAB	03/23/2001		Added changes by Michel
	*	070  EAB	03/23/2001		Michele found a bug that Chris brought to my attetion the comma 
									arrays had lost an element but not perceptial concequences are presently know
	*	071	 CAB	03/27/2001		Added missing semicolon for GERMAN
	*	072	 MGS	03/21/2002		Warning removal
	*	073	 MGS	04/17/2002		ARM7 port
	*   074  CAB	05/23/2002		Removed warnings
	*	075  CAB	09/19/2002		Added missing comment
	*	076  MFG	09/30/2002		removed Winpreintf for windows CE
*/

/* This is now the normal defalut code when re-write completed NWSNOAA has been saved plus oldcode for now*/
/* eab 2/16/98 */ 

/*	  Extend f0 contour one frame to obtain next value for period T0	 */
/*		(low-pass filter a set of step and impulse commands)		 */

/* f0mode:
*
*	1  NORMAL
*		pDph_t->f0tar[] contains step (f0 even), impulse (f0 odd), and baseline
*		 reset (f0=0) commands created by rules.
*		pDph_t->f0tim[] contains incremental time in frames since last command.
*		A slow psuedo-random variation is added to f0 so as to prevent
*		 an interval of constant f0.  Any glottal stop gestures are
*		 added in at the end. 
*		NEW STUFF-Note we occasionally want a few frames at near constant f0 to give
*			a soft tonal quality to a voice esp female eab 96
*
*	2  HAT_LOCATIONS_SPECIFIED
*		User specified location of hatrise/fall.  Same as NORMAL as
*		 far as this module is concerned.
*
*	3  HAT_F0_SIZES_SPECIFIED
*		User attached steps and impulses to hatrise, hatfall,
*		 and stress phones.  Same as NORMAL as far as this module
*		 is concerned.
*
*	4  SINGING
*		pDph_t->f0tar[] contains note requests [1 - 37], offset by 2000, that
*		 have been selected by user <time,f0> requests attached to
*		 selected phonemes, usually vowels, usually one per syllable.
*		pDph_t->f0tim[] contains incremental time in frames since last note.
*		Movement to a new note begins at start of segment and takes
*		 100 ms.  A 6 Hz vibratto of magnitude +/- 2 Hz is added to f0.
*
*
*	5  PHONE_TARGETS_SPECIFIED
*		pDph_t->f0tar[] contains f0 requests in Hz that have been selected
*		 by user <dur,f0> requests attached to selected phonemes,
*		 in which case f0 ramps linearly from previous value to pDph_t->f0tar[]
*		 over the duration of the phoneme.
*		pDph_t->f0tim[] contains incremental time in frames since last command.
*		A slow psuedo-random variation is imposed on f0 to prevent
*		 an interval of constant f0.
*
*	6  TIME_VALUE_SPECIFIED
*		pDph_t->f0tar[] contains f0 requests in Hz that have been selected
*		 by user {time,f0} requests, in which case f0 ramps linearly
*		 from previous value to pDph_t->f0tar[] over the time interval since
*		 the last {time,f0} command.
*		pDph_t->f0tim[] contains incremental time in frames since last command.
*		A slow psuedo-random variation is imposed on f0 to prevent
*		 an interval of constant f0.Bats 349
*/

#include "ph_def.h"





//#define CREEKMALE
#define TWOPI 4096			/* For getcosine() function below */
#define PI 2048
#define PIOVER2 1024
#define DT_ONE	(PIOVER2*PIOVER2)
//#define GRAPHF0
//#define DEBUGF0
/* #define DEBUG_USER_PROSODICS */

#define HIGHEST_F0	  5121	/*	Maximum F0 in Hz*10 */
#define LOWEST_F0	   500	/*	Minimum F0 in Hz*10 */
#define F_SEG_LOWPASS	  3000	/* Nominal cutoff freq of 1-pole low-pass	 */
#define DELAY_SEG_LOWPASS	 3	/* Delay in frames to half-way of step resp. */
#define F0SHFT			 3	/* Shift to avoid roundoff errors in		 */
/*	 filtering f0 commands			 */

/*	  External constants from PHROM.C */
/* extern short f0glstp[]; *//* F0 dip for a glottal stop */
// eab 2/17/98 No longer used extern short			  f0segtars[];	 /* Array of segmental influences */
//	extern short *featb;		/* Feature values for phonemes */
extern short notetab[]; 	/* f0 target for notes C2-C5 (1-37) */
extern short getcosine[];	/* Cos tab for jitter and/or vibratto */
//extern short randnum();

//	extern int begtyp(int phone);
//	extern int endtyp(int phone);

#define phone_feature(a,b) (all_featb[(b)>>8][(b)&0x00ff])
#define place(b) all_place[(b)>>8][(b)&0xFF]


/* MVP : static function declarations*/
static void set_user_target(PDPH_T pDph_t,short *psF0command); 
static void filter_commands(PDPH_T pDph_t,short f0in); 
static void filter_seg_commands(PDPH_T pDph_t,short f0in);
static void linear_interp(PDPH_T pDph_t); 
static void set_tglst(PDPH_T pDph_t);

const short gst_delta[9] = {  90, 80,70, 60,50, 43, 20, 0};
//int oarcnt=0;

#ifndef HLSYN
const short	uk_f0msegtars[] =
{	
	/* SI    IY	 IH    EY	 EH    AE	 AA    AY	 AW    AH	*/
	50,  100,	 60,   40,	 20,   0,	 0,    0,	 0,    20,
		
	/* AO    OW	 OY    UH	 UW    RR	 YU    AX	 IX    IR	*/
	0,   30,	 50,   60,	 100,  50,	100, 30, 60, 100,
		
	/* ER    AR	 OR    UR	  W 	Y	  R 	L	 HX    OH	*/
	60,	0,	 30,   80,	 60,   60,	  0,	0,	 200,  0,
		
	/* LX 	M	  N    NG	 EL    D$	 EN 	F	  V    TH	*/
	0,   -50,  -50,  -50,  0, -50, -50, 300-150, -50, 300-150,
		
	/* DH 	S	  Z    SH	 ZH 	P	  B 	T	  D 	K	*/
	-50, 300-150, -50, 300-150, -50, 300-150, -50, 300-150, -50, 300-150,
		
	/* G	  YR	TQ	   Q	CH	  JH  DF						 */
	-50, -10, 30, 0, 300-150, -50, -10
};

const short	uk_f0fsegtars[] =
{
	
	/* SI    IY	 IH    EY	 EH    AE	 AA    AY	 AW    AH	*/
	50,  100,	 60,   40,	 20,   0,	 0,    0,	 0,    20,
		
	/* AO    OW	 OY    UH	 UW    RR	 YU    AX	 IX    IR	*/
	0,   30,	 50,   60,	 100,  50,	100, 30, 60, 100,
	
	/* ER    AR	 OR    UR	  W 	Y	  R 	L	 HX    OH	*/
	60,	0,	 30,   80,	 60,   60,	  0,	0,	 200,  0,
	
	/* LX 	M	  N    NG	 EL    D$	 EN 	F	  V    TH	*/
	0,   -50,  -50,  -50,  0,   -50,	-50,  300-150,	-50,  300-150,
	
	/* DH 	S	  Z    SH	 ZH 	P	  B 	T	  D 	K	*/
	-50,   300-150, -50,  300-150,	-50,  300-150,	-50,  300-150,	-50,  300-150,
	
	/* G	  YR	TQ	   Q	CH	  JH  DF */
	-50, -10, 30, 0, 300-150, -50, -10
};

const short sp_f0msegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30,	0,	  150,	200,  30,	60, -50 , -50,
		
	/* E_RR	E_L  E_LL	   E_M		 E_N  E_NH	 E_F   E_S	 E_J  E_TH	*/
	-50, -50, -50 + 20, -50 + 20, -80, -50 , 300-150, 300-150, 300-150, 300-150,
	
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150, -50, 300-150, -50, 300-150 , -50,
	
	/* E_CH	E_Y   E_R	E_Q */
	300-150 , -50, -50, 0,
	
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH */
	-50, -50, -50, -50, 0, -50, 300 - 150
};

const short sp_f0fsegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30, 	0,	 150,	200, 30,   60, -50 , -50,
		
	/* E_RR	E_L  E_LL	E_M   E_N  E_NH   E_F	E_S   E_J  E_TH  */
	-50, -50, -50 + 20, -50 + 20, -80 , -50 , 300-150 , 300-150, 300-150, 300-150 ,
		
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150 , -50, 300-150, -50, 300-150 , -50,
		
	/* E_CH	E_Y   E_R	E_Q */
	300-150 , -50, -50, 0,
				
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH */
	-50, -50, -50, -50, 0, -50, 300 - 150
};

const short la_f0msegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30,	0,	  50,	50,  30,   60, -50 , -50,
		
	/* E_RR	E_L  E_LL	   E_M		 E_N  E_NH	 E_F   E_S	 E_J  E_TH	*/
	-50, -50, -50 + 20, -50 + 20, -50 , -50 , 300-150 , 300-150, 300-150, 300-150 ,
		
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150 , -50, 300-150, -50, 300-150 , -50,
		
	/* E_CH	E_Y   E_R	E_Q */
	300-150 , -50, -50, 0,
	
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH */
	-50, -50, -50, -50, 0, -50, 300 - 150
};

const short la_f0fsegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30, 	0,	 70,	70, 30,   60, -50 , -50,
		
	/* E_RR	E_L  E_LL	E_M   E_N  E_NH   E_F	E_S   E_J  E_TH  */
	-50, -50, -50 + 20, -50 + 20, -80 , -50 , 300-150 , 300-150, 300-150, 300-150 ,
	
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150 , -50, 300-150, -50, 300-150 , -50,
	
	/* E_CH	E_Y   E_R	E_Q */
	300-150 , -50, -50, 0,
			
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH */
	-50, -50, -50, -50, 0, -50, 300 - 150
};


/*	  Incremental changes to F0 caused by segmental influences */

const short gr_f0msegtars[] = {	
	/* GEN_SIL	 A	   E	AE	  EX	 I	   O	OE	   U	UE	*/
		10,	 40,   60,	   10,	  80,	0,   0,	0,   0,	0,
	/* AH    EH	AZ	  IH	OH	 OZ    UH	UZ	  EI	AU	*/
	20,   20,	 60,  60,	80,  80,   60,	40,   0,	 0,
	/* EU    AN	 IM    UM	 ON 	J	  L    RR	  R 	H	*/
	0,   0,	 0,   0,	 0,   0,	  -10,	  -10,	-10,	0,
	/* M	   N	NG	  EL	EM	  EN	 F	   V	 S	   Z	*/
	0,  0,	0,   0,  0,  0,  0,  0,	 0,   0,
	/* SH    ZH	 CH    KH	  P 	B	  T 	D	  K 	G	*/
	0,  0,	0,  0,	0,  0,	0,  0,	0,  0,
	/* Q	  PF	TS	  DJ	TJ	  KS */
	0,    0,	 0,    0,	 0,    0
};
/*	  Incremental changes to F0 caused by segmental influences */

const short gr_f0fsegtars[] = {
	/* GEN_SIL	  A 	E	 AE    EX	  I 	O	 OE 	U	 UE */
	70,	 15,   15,	   15,	  10,	70,   45,	70,   26,	100,
	/* AH    EH	AZ	  IH	OH	 OZ    UH	UZ	  EI	AU	*/
	26,   26,	 60,  60,	80,   80,  60,	40,   80,	45,
	/* EU    AN	 IM    UM	 ON 	J	  L    RR	  R 	H	*/
	60,   10,	45,   45,	60,   60,	 -15,	 -15,  -15,    0,
	/* M	   N	NG	  EL	EM	  EN	 F	   V	 S	   Z	*/
	-70,  -70,	-70,   0,  -70,  -70,  400,  -70,  -70,  -70,
	/* SH    ZH	 CH    KH	  P 	B	  T 	D	  K 	G	*/
	400,  -70,	400,  400,	400,  -70,	400,  -70,	400,  -70,
	/* Q	  PF	TS	  DJ	TJ	  KS */
	-70,	  0,	0,	  0,	0,	  0
};



const short	us_f0msegtars[] =
{
	/* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH	*/
	50,  140,  80,    50,   30,    0,    0,    0,   0,    20,

	/* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR	*/
	0,   30,   60,   80,  140,   50,  140,   30,   70,  110,

	/* ER    AR    OR    UR     W     Y     R     L    HX    RX	*/
	50,    0,   0,   90,   -60,  -60,    0,    0,  200,    0,

	/* LX     M     N    NX    EL    D$    EN     F     V    TH	*/
	0,    0,   0,    0,    0,  -20,    0,  0,  0,  0,

	/* DH     S     Z    SH    ZH     P     B     T     D     K	*/
	0,   0,   0,   0,      0,  0,  0,  0,  0,  0,

	/* G	  DX	TQ	   Q	CH	   JH	DF	   TZ  CZ */
	0,		0,	0,	   0,   0,    0,	0,		0, 0 
};

/* Incremental changes to F0 caused by segmental influences */

const short	us_f0fsegtars[] =
{
	/* SI    IY	 IH    EY	 EH    AE	 AA    AY	 AW    AH */
	50,   160,    80,  60,   40,   0,     0,    0,    0, 40,
		
	/* AO    OW	 OY    UH	 UW    RR	 YU    AX	 IX    IR */
	0,   60, 80,   190,   190,   80,  150,  60,   80,   120,
		
	/* ER    AR	 OR    UR	  W 	Y	  R 	L	 HX    RX */
	80, 0, 50, 120, 80, 80, 0, 0, 90, 0,
		
	/* LX 	M	  N    NG	 EL    D$	 EN 	F	  V    TH */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		
	/* DH 	S	  Z    SH	 ZH 	P	  B 	T	  D 	K */
	-200, 200,	-20, 200, 0, 0, 0, 200, 0, 200,
		
	/* G	  DX	TQ	   Q	CH	  JH  DF CZ TZ */
	0, 0, 0, 0, 0, 0, 0	,0,0,

	/* ly re x1 x2 x3 x4 x5 x6 x7 x8 x9 z1 */
	    0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

/* Incremental changes to F0 caused by segmental influences 
eab prelimary test indicate that the 300 values are an exageration
while -50 for d look good*/

const short	fr_f0msegtars[] = {
	/* SI 	A	 A3    E2	 Au 	E	 E1    Eu	  I 	O	*/
	50,	0,	  0,	100,	  0,	0,	  200,	0,	  300,	0,
		
	/* O6    Ou	  U    An	 In    On	 Un  SegAXP   L 	R  */
	0,	0,	  0,	200,	  0,	0,	  0,	0,	  0,	0,
		
	/*  W    Wu	  Y    Ch	  F 	J	 Rx 	S	  V 	Z  */
	0,	0,	  0,  150,	150, -70,	40,  150, -70, -70,
		
	/*  B 	D	  G 	K	  P 	T	 Gn 	M	  N    Ng  */
	-70, -70,   -70,	0,	0,	  0,  -70,	-70, -70, -70,
		
	/* SegX  SegSil */
	0,   0
};

const short *fr_f0fsegtars = fr_f0msegtars;
/* Incremental changes to F0 caused by segmental influences */
#else // #ifndef HLSYN

const short	uk_f0msegtars[] =
{
	/* SI    IY	 IH    EY	 EH    AE	 AA    AY	 AW    AH	*/
	50,  100,	 60,   40,	 20,   0,	 0,    0,	 0,    20,
		
	/* AO    OW	 OY    UH	 UW    RR	 YU    AX	 IX    IR	*/
	0,   30,	 50,   60,	 100,  50,	100, 30, 60, 100,
		
	/* ER    AR	 OR    UR	  W 	Y	  R 	L	 HX    OH	*/
	60,	0,	 30,   0,	 0,   0,	  0,	0,	 0,  0,
		
	/* LX 	M	  N    NG	 EL    D$	 EN 	F	  V    TH	*/
	0,   0,  0,  0,  0, 0, 0, 0, 0, 0,
		
	/* DH 	S	  Z    SH	 ZH 	P	  B 	T	  D 	K */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		
	/* G	  YR	TQ	   Q	CH	  JH  DF */
	0, 0, 0, 0, 0, 0, 0
};

const short	uk_f0fsegtars[] =
{
	/* SI    IY	 IH    EY	 EH    AE	 AA    AY	 AW    AH	*/
	50,  100,	 60,   40,	 20,   0,	 0,    0,	 0,    20,
		
	/* AO    OW	 OY    UH	 UW    RR	 YU    AX	 IX    IR	*/
	0,   30,	 50,   60,	 100,  50,	100, 30, 60, 100,
	
	/* ER    AR	 OR    UR	  W 	Y	  R 	L	 HX    OH	*/
	60,	0,	 30,   80,	 60,   60,	  0,	0,	 200,  0,
	
	/* LX 	M	  N    NG	 EL    D$	 EN 	F	  V    TH	*/
	0,   -50,  -50,  -50,  0,   -50,	-50,  300-150,	-50,  300-150,
	
	/* DH 	S	  Z    SH	 ZH 	P	  B 	T	  D 	K	*/
	-50,   300-150, -50,  300-150,	-50,  300-150,	-50,  300-150,	-50,  300-150,
	
	/* G	  YR	TQ	   Q	CH	  JH  DF */
	-50, -10, 30, 0, 300-150, -50, -10
};

const short sp_f0msegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30,	0,	  150,	200,  30,	60, -50 , -50,
		
	/* E_RR	E_L  E_LL	   E_M		 E_N  E_NH	 E_F   E_S	 E_J  E_TH	*/
	-50, -50, -50 + 20, -50 + 20, -80 , -50 , 300-150 , 300-150, 300-150, 300-150 ,
		
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150 , -50, 300-150, -50, 300-150 , -50,
		
	/* E_CH	E_Y   E_R	E_Q */
	300-150 , -50, -50, 0,
		
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH */
	-50, -50, -50, -50, 0, -50, 300 - 150
};

const short sp_f0fsegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30, 	0,	 150,	200, 30,   60, -50 , -50,
		
	/* E_RR	E_L  E_LL	E_M   E_N  E_NH   E_F	E_S   E_J  E_TH  */
	-50, -50, -50 + 20, -50 + 20, -80 , -50 , 300-150 , 300-150, 300-150, 300-150 ,
	
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150 , -50, 300-150, -50, 300-150 , -50,
	
	/* E_CH	E_Y   E_R	E_Q */
	300-150 , -50, -50, 0,
			
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH */
	-50, -50, -50, -50, 0, -50, 300 - 150
};

const short la_f0msegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30,	0,	  50,	50,  30,   60, -50 , -50,
		
	/* E_RR	E_L  E_LL	   E_M		 E_N  E_NH	 E_F   E_S	 E_J  E_TH	*/
	-50, -50, -50 + 20, -50 + 20, -50 , -50 , 300-150 , 300-150, 300-150, 300-150 ,
		
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150 , -50, 300-150, -50, 300-150 , -50,
		
	/* E_CH	E_Y   E_R	E_Q */
	300-150 , -50, -50, 0,
		
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH */
	-50, -50, -50, -50, 0, -50, 300 - 150
};

const short la_f0fsegtars[] =
{
	/* E_SI	E_A   E_E	E_I   E_O	E_U E_WX  E_YX */
	30, 	0,	 70,	70, 30,   60, -50 , -50,
		
	/* E_RR	E_L  E_LL	E_M   E_N  E_NH   E_F	E_S   E_J  E_TH  */
	-50, -50, -50 + 20, -50 + 20, -80 , -50 , 300-150 , 300-150, 300-150, 300-150 ,
		
	/* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T	 E_D   E_K	 E_G  */
	-50,	-50, -50,	-50, 300-150 , -50, 300-150, -50, 300-150 , -50,
		
	/* E_CH	E_Y   E_R	E_Q 									 */
	300-150 , -50, -50, 0,
				
	/* E_Z   E_W	E_NX  E_V	E_IX  E_MX	E_PH*/
	-50, -50, -50, -50, 0, -50, 300 - 150
};

/*	  Incremental changes to F0 caused by segmental influences */

const short gr_f0msegtars[] = {	
	/* GEN_SIL	 A	   E	AE	  EX	 I	   O	OE	   U	UE	*/
	10,	  40,   60,	   10,	  80,	0,   0,	0,   0,	0,
	
	/* AH    EH	AZ	  IH	OH	 OZ    UH	UZ	  EI	AU	*/
	20,   20,	 60,  60,	80,  80,   60,	40,   0,	 0,
	
	/* EU    AN	 IM    UM	 ON 	J	  L    RR	  R 	H	*/
	0,   0,	 0,   0,	 0,   0,	  -10,	  -10,	-10,	0,
	
	/* M	   N	NG	  EL	EM	  EN	 F	   V	 S	   Z	*/
	0,  0,	0,   0,  0,  0,  0,  0,	 0,   0,
	
	/* SH    ZH	 CH    KH	  P 	B	  T 	D	  K 	G	*/
	0,  0,	0,  0,	0,  0,	0,  0,	0,  0,
	
	/* Q	  PF	TS	  DJ	TJ	  KS */
	0,    0,	 0,    0,	 0,    0
};
/*	  Incremental changes to F0 caused by segmental influences */

const short gr_f0fsegtars[] = {
	/* GEN_SIL	 A	   E	   AE	  EX	 I	   O	OE	   U	UE	*/
	10,	 40,   60,	   10,	  0,	90,   0,	0,   0,	0,
	
	/* AH    EH	AZ	  IH	OH	 OZ    UH	UZ	  EI	AU	*/
	20,   20,	 60,  60,	80,  80,   60,	40,   70,	 0,
	
	/* EU    AN	 IM    UM	 ON 	J	  L    RR	  R 	H	*/
	0,   0,	 0,   0,	 0,   0,	  -10,	  -10,	-10,	0,
	
	/* M	   N	NG	  EL	EM	  EN	 F	   V	 S	   Z	*/
	0,  0,	0,   0,  0,  0,  0,  0,	 0,   0,
	
	/* SH    ZH	 CH    KH	  P 	B	  T 	D	  K 	G	*/
	0,  0,	0,  0,	0,  0,	0,  0,	0,  0,
	
	/* Q	  PF	TS	  DJ	TJ	  KS */
	0,    0,	 0,    0,	 0,    0		  
};

/* Incremental changes to F0 caused by segmental influences 
eab prelimary test indicate that the 300 values are an exageration
while -50 for d look good*/

const short	us_f0msegtars[] =
{
	/* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH	*/
	50,  140,  80,    50,   30,    0,    0,    0,   0,    20,

	/* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR	*/
	0,   30,   60,   80,  140,   50,  140,   30,   70,  110,

	/* ER    AR    OR    UR     W     Y     R     L    HX    RX	*/
	0,    0,   0,   0,   100,  140,    0,    0,  0,    0,

	/* LX     M     N    NX    EL    D$    EN     F     V    TH	*/
	0,    0,   0,    0,    0,  0,    0,  0,  0,  0,

	/* DH     S     Z    SH    ZH     P     B     T     D     K	*/
	0,   0,   -200,   0,      0,  0,  0,  0,  0,  0,

	/* G DX	TQ	   Q	CH	   JH	DF	   TZ  CZ */
	0,		0,	0,	   0,   0,    0,	0,		0, 0 
};

const short	us_f0fsegtars[] =
{	
/* Incremental changes to F0 caused by segmental influences */

/*           SI    IY    IH    EY    EH    AE    AA    AY    AW    AH	*/
	     50,  140,  80,    50,   30,    0,    0,    0,   0,    20,

/*           AO    OW    OY    UH    UW    RR    YU    AX    IX    IR	*/
			0,   30,   60,   80,  /*140*/40,   50,  140,   30,   70,  110,

/*           ER    AR    OR    UR     W     Y     R     L    HX    RX	*/
	     50,    0,   30,   90,  -60,  -60,    0,    0,  200,    0,

/*           LX     M     N    NX    EL    D$    EN     F     V    TH	*/
	      0,    0,    0,    0,    0,  -20,    0,  300,  -60,  300,

/*           DH     S     Z    SH    ZH     P     B     T     D     K	*/
			-60,  00,  -60,  00,  -60,  300,  300,  300,  -20,  300,

/*            G    DX    TQ     Q    CH    JH				*/
	    -20,  -10,    0,    0,  300,  -20,

/*      LY	*/
		0, 1, 2, 3, 4, 0, 0, 0, 0, 0, 0, 
	};
#ifdef OLD_values
const short	us_f0fsegtars[] =
{
	/* SI    IY	 IH    EY	 EH    AE	 AA    AY	 AW    AH */
	50,   400,  100, 120, 90,   110,     0,    0,    0, 40,
		
	/* AO    OW	 OY    UH	 UW    RR	 YU    AX	 IX    IR */
	0,   60, 80,   120,   120,   80,  150,  60,   80,   120,
		
	/* ER    AR	 OR    UR	  W 	Y	  R 	L	 HX    RX */
	   80,    0, 50,   120,   80,   80,   0,    0,   600,  0,
		
	/* LX 	M	  N    NG	 EL    D$	 EN 	F	  V    TH */
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		
	/* DH 	S	  Z    SH	 ZH 	P	  B 	T	  D 	K */
	0, 300,	-20,   300,  0,    0,    300, 300,   0,  300,
		
	/* G	  DX	TQ	   Q	CH	  JH  DF CZ TZ */
	0, 0, 0, 0, 0, 0, 0	,0,0
};
#endif
/* Incremental changes to F0 caused by segmental influences 
eab prelimary test indicate that the 300 values are an exageration
while -50 for d look good*/

const short	fr_f0msegtars[] = {
	/* SI 	A	 A3    E2	 Au 	E	 E1    Eu	  I 	O	*/
	50,	0,	  0,	100,	  0,	0,	  200,	0,	  300,	0,
		
	/* O6    Ou	  U    An	 In    On	 Un  SegAXP   L 	R  */
	0,	0,	  0,	200,	  0,	0,	  0,	0,	  0,	0,
	
	/*  W    Wu	  Y    Ch	  F 	J	 Rx 	S	  V 	Z  */
	0,	0,	  0,  150,	150, -70,	40,  150, -70, -70,
	
	/*  B 	D	  G 	K	  P 	T	 Gn 	M	  N    Ng  */
	-70, -70,   -70,	0,	0,	  0,  -70,	-70, -70, -70,
	
	/* SegX  SegSil */
	0,   0
};

const short *fr_f0fsegtars = fr_f0msegtars;
/* Incremental changes to F0 caused by segmental influences */

#endif // #ifndef HLSYN

/* ******************************************************************
 *      Function Name: pht0draw()
 *
 *      Description: Searches through parameters given to the phoneme
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void pht0draw(LPTTS_HANDLE_T phTTS) 
{	
	/*	  Automatic variables */
#ifdef GRAPHF0
	int icnt;
	char prntbuf[121];
#endif
	int temp,dtglst,pseudojitter=0;	
	PKSD_T pKsd_t;
	PDPH_T pDph_t;
	PDPHSETTAR_ST pDphsettar;
	short f0seg=0,f0in=0;
	short tmp;
	
	pKsd_t = phTTS->pKernelShareData;
	pDph_t = phTTS->pPHThreadData;
	pDphsettar = pDph_t->pSTphsettar;
	/* Initialize , GL  6/11/1996*/
	/* this code is re-entrant and these variables must only be re-initialized at a hard or soft init*/
	
	/*pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0;*/
		
	if (pDph_t->malfem == MALE)
	{	
		/*	  Initialize */
		if (pDph_t->nf0ev <= -2) 
		{
			
			/* Hard initialization */
			/* for now hardcode baseline for init experimentation eab 8/96*/
			/* EAB BUG- found problem with f0command, it needs to be a global variable
			or it sometimes doesn't get handled correctly*/
			pDph_t->clausepos=0;
			pDphsettar->phocur = GEN_SIL;

			/* redundant and incorrectly placed code since a soft init automatically follows a hard init
			the code only has to be in once*/
			
			/*		  Time since last reset of baseline fall, in frames */
			pDphsettar->nframb = 0;
			
			pDphsettar->basetime = 0;
			pDphsettar->basecntr = 0;
			pDphsettar->f0delta  = 0;
			
			/*eab 4/11/97 Moved these variables to a proper place of initlaization*/
		pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0; 
			
			/*		  If within 32 ms (5 frames) of nframg, glottal stop gesture */
			/*		  is in progress */
			pDphsettar->tglstp = -200;
			
			/*		  Set filter memory to init baseline fall (f0 in hz*10) */
//			oarcnt = 0;
			pDphsettar->tarhat = 0;
			pDphsettar->tarimp = 0;
			pDphsettar->delimp = 0;
			
			/*		Set smoothing constants for ( critical-damped? ) 2nd-order sys	*/
			
			pDphsettar->f0a2 = pDph_t->f0_lp_filter;	/* Impulse and hat commands */
			pDphsettar->f0b = FRAC_ONE - pDphsettar->f0a2;
			pDphsettar->f0a1 = pDphsettar->f0a2 << F0SHFT;
			
			pDphsettar->f0sa2 =  F_SEG_LOWPASS; /* Segmental influences */
			
			pDphsettar->f0sb = FRAC_ONE - pDphsettar->f0sa2;
			pDphsettar->f0sa1 = pDphsettar->f0sa2 << F0SHFT;
			
			/*		Variables  relevent only if f0mode >= SINGING */
			
			pDphsettar->newnote = 1000;
			pDphsettar->delnote = 0;
			pDphsettar->delcum = 0;
			pDphsettar->f0start = pDph_t->f0;
			pDphsettar->vibsw = 0;
			
			/*		Initialize pointer to f0 command string */
			
			pDph_t->nf0ev = -1;
	}
	
	/*	  Reinit pointer and time of first f0 command if new clause */
	if( pDph_t->nf0ev == -1 ) 
	{		
		pDphsettar->nimpcnt = 0;
		/* Soft initialization */
		pDphsettar->tarimp =0;
		pDph_t->enddrop =0;
		/*	  Set Beginning and final frequency of baseline fall */
		switch (pDph_t->clausetype)
		{
		case 0: /*	declarative  */
			pDph_t->clausepos=0;
			pDph_t->dcommacnt =0;
			break; //BATS 704
			
		case 1: /*	comma  First one goes up but later ones are more declarative*/
			// But long ones tend to be declarative! eab 4/15/00
			// MOve clausetype selection earlier as cbsym has to be decide as well
			//pDph_t->dcommacnt++;

			
			break; //BATS 704
			
		case 2: /*	exclaimatory  */
			//4/15/00 EAB short one clasify as exclamatory but long ones suffer
			//from the don't know which part to emphasize problem so better devalrative.
	
			pDph_t->clausepos =0;
			pDph_t->dcommacnt =0;
			break;
			
			
		case 3: /*	question  */

			pDph_t->clausepos =0;
			pDph_t->dcommacnt =0;
			break;
			
		default:
			
			break;
		}
			
//		oarcnt=0;
		pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
		pDphsettar->f0slas2 = 0;	

	

	
		
#ifdef DEBUGF0
		WINprintf ("At newpar sw %d %d	beginfall and endfall \n", pDphsettar->beginfall, pDphsettar->endfall);
#endif
		
		pDphsettar->nframb = 0;
		pDphsettar->basetime=0;
		pDphsettar->basecntr =0;
		pDphsettar->f0delta =0;
		pDph_t->special_phrase = 0;
//		oarcnt=0;
		/*	  Raise baseline for first sentence of a paragraph */
		if (pDph_t->newparagsw != FALSE) 
		{
			pDphsettar->beginfall += 120;
			pDphsettar->endfall += 70;
			pDph_t->newparagsw = FALSE;
			//WINprintf ("New paragraph  beginfall %d, endfall %d\n", pDphsettar->beginfall, pDphsettar->endfall );
		}
		
		/*		  Time between 0 and first	f0 command, in frames */
		pDphsettar->dtimf0 = pDph_t->f0tim[0];
		/*		   Pointer into dur and phone arrays */
		pDphsettar->np_drawt0 = -1;
		pDphsettar->npg = -1;
		pDph_t->nf0ev = 0;
				
		/*		  Time since last f0 command, in frames */
		
		/* INITIALIZE NFRAM TO DELAY THROUGH FILTER THIS USED TO BE IN AND WAS NOT IN
		88 STUFF BUT IS REALLY NEEDED*/
//		oarcnt=0;
		pDphsettar->nframs = 0;
		pDphsettar->nfram =0;
		pDphsettar->nframg = 6- ((pDph_t->f0_lp_filter-1300)>>8);
		
		if (pDph_t->f0mode< SINGING) 
		{
			pDphsettar->nfram = pDphsettar->nframs >> 1;
		}
		else 
		{
			pDphsettar->nfram = 0;	/* Start note slightly early if singing */
		}
				
		/* Time since beginning of cur phonetic segment, in frames */
//		oarcnt=0;
		pDphsettar->nframs = 0; 	
		/* Used in computing segmental effects */
		
		
		/*		  Extra time, in frames, used to delay or advance f0 gesture assoc. */
		/*		  with a particular segment, e.g. at delayed vot, or anticipate in V-V */
		pDphsettar->extrad = -DELAY_SEG_LOWPASS; /* Start gesture toward next seg early */
		/*		  Duration of current segment, in frames */
		pDphsettar->segdur = 0;
		pDphsettar->segdrg = 0;
		pDph_t->lastallo=0;
		pDph_t->keepallo=0;
#ifdef GFAPHF0
		pDph_t->lastone=-1;
		pDph_t->keepdur=0;
#endif
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
		pDphsettar->glide_tot=0;
		pDphsettar->glide_inc =0;
		/*	  Must be at bottom of hat */
		pDphsettar->tarhat = 0; 	/* should be anyway, except for emergency halt */
		pDph_t->addjit = 305;
		
		
		}
		/*	  End of initialization */
		
		
		
		/*	See if new f0 commands issued					*/
		/*	  To get f0 commands to occur at right times, need to take		*/
		/*	  into account delay introduced by low-pass filter. Response to */
		/*	  a step command begins xx frames earlier than f0time[] request */
		/*	  so f0 gets half-way to target at nominal step onset time		*/
		
		while ((pDphsettar->nfram >= pDphsettar->dtimf0) && 
			(pDph_t->nf0ev < pDph_t->nf0tot)) 
		{
			
			pDphsettar->f0command = pDph_t->f0tar[pDph_t->nf0ev];	/* New target f0 */
			pDphsettar->type = pDph_t->f0type[pDph_t->nf0ev];
			pDphsettar->nfram -= pDphsettar->dtimf0;
			/* eab 1/10/98 added length parameter*/
			pDphsettar->length = pDph_t->f0length[pDph_t->nf0ev];
/* ********************** NOT USED *********************************/			
#if 0
			printf ("Ph_drwt02.c nfram %d, dtimf0 %d, f0command %d\n",
				pDphsettar->nfram, pDphsettar->dtimf0, pDphsettar->f0command);
#endif // 0
/* *****************************************************************/
			
			if (pDph_t->f0mode== TIME_VALUE_SPECIFIED) {
				pDphsettar->dtimf0 = pDph_t->f0tim[pDph_t->nf0ev];
				pDph_t->nf0ev++;
				set_user_target(pDph_t,&pDphsettar->f0command);
			}
			else {
				pDph_t->nf0ev++;	/* Achieve target at next time */
				pDphsettar->dtimf0 = pDph_t->f0tim[pDph_t->nf0ev];
				switch(pDphsettar->type)
				{
				case USER: /*user specified f0 target*/
					set_user_target(pDph_t,&pDphsettar->f0command);
					break;
					
				case F0_RESET: /* f0 reset*/
					
							   pDphsettar->tarhat = 0;		/* Go to bottom of hat pattern 
															and for UK init glide, note glide is not ifdefed _uk becuase
							   it is a command we ant to allow others to use*/
							   pDph_t->glotalize =0;
							   pDphsettar->glide_step=0;
							   pDphsettar->glide_tot=0;
							   pDphsettar->glide_inc=0;
							   break; //BATS 704
				case STEP:
#ifdef ENGLISH_UK
					break;
#endif
					pDphsettar->tarhat += pDphsettar->f0command;
					/* Command is a step, reset pDphsettar->tarhat */
					
					if (pDphsettar->f0command < 0) 
					{	/* Cancel previous impulse if step */
						/* is of opposite sign */
						if (pDphsettar->tarimp > 0) 
						{	
							pDphsettar->tarimp = 0;
							pDphsettar->delimp = 0;
						}
					}
					else
					{
						if (pDphsettar->tarimp < 0) 
						{
							pDphsettar->tarimp = 0;
							pDphsettar->delimp = 0;
						}
					}
					break;
				case GLIDE:/* eab 1/10/98 work in progress */
					
					pDphsettar->glide_step = pDphsettar->f0command;
					pDphsettar->glide_inc =(pDphsettar->glide_step/pDphsettar->length);
					
					break;
					
				case GLOTTAL:
#ifdef ENGLISH_UK
					break;
#endif
					
 if(pKsd_t->lang_curr != LANG_french)
{
					pDph_t->enddrop= -pDphsettar->f0command;
					pDph_t->glotalize =1;
}
					break;
					
				case IMPULSE:
					
					/* Odd, command is impulse	*/
					/*			  Impulse realized as 24-frame "step plus ramp" from f0command */
					/*			  to three times focommand */
					/* eab old ocde used to have an impulse as a 2*f0command that would be realized as an 
					16 frame wide pulse. This new scheme proposed by Dennis Klatt uses 
					imp=f0command+(f0command _ f0command>>4 meaning it will take 16 farmes to
					reach double height. The old one never reached target so this new approach I think 
					presently has two problems it's dealyed too much and it lasts too long causing higher f0 values
					and more percieved effect. I want to try it differently starting out close to the old code with a pulse command that 
					trails off.
					with a downward slope think of it as a rectangular pulse with a triangle placed on
					top instead of a second rectangular pulse- by the way it's not working correctly at
					the moment*/
					
					//			if (pDphsettar->tarbas == 1200)
					//				pDphsettar->tarbas = 1300;
					//			else
					//			pDphsettar->tarbas= (int)(.94 * (float)pDphsettar->tarbas);

					pDphsettar->tarimp = 0;//pDphsettar->f0command<<1;
					
					
					//pDphsettar->delimp = pDphsettar->f0command>>1;
					// pDphsettar->nimp = 24 - ((pDph_t->f0_lp_filter-1300)>>8);
					pDphsettar->nimp = pDphsettar->length;
					pDphsettar->delimp = (pDphsettar->f0command/pDphsettar->nimp)<<1;
					pDphsettar->nimpcnt = 0;
					break;
				}
			}
			/*        Loop back to look for more f0 commands */
        }
#ifndef HLSYN
if (pKsd_t->lang_curr == LANG_british)
{
		
		/*EAB Drop pitch rapidly at  end of utterance
		enddrop now reflects pitch dropoff at end of utterance and not final creek
		hence the removal of the tcumdur stuff
		9/19/97 */
		if(  pDph_t->enddrop 
			&& pDph_t->glotalize  && pDph_t->number_words >= 3)
		{
			if(pDphsettar->tarbas > 500)
			{
				pDph_t->enddrop += pDph_t->enddrop>>1;
			}
		}
}
#endif // HLSYN	
		

		pDphsettar->nframb++;		

		/*    Impulse duration fixed at 24 frames, count down to zero */
		/*    (actually, duration is function of speaker def par "quickness" */
		
        if (pDphsettar->nimpcnt == (pDphsettar->nimp)) {
			pDphsettar->nimpcnt = 0;
			pDphsettar->tarimp = 0;
			pDphsettar->delimp = 0;
			pDphsettar->nimp = 0;
		}
		else  if (pDphsettar->nimpcnt < (pDphsettar->nimp>>1)) {
			//pDphsettar->nimp--;
			pDphsettar->tarimp += pDphsettar->delimp;
			//pDphsettar->nimp = 0;
			pDphsettar->nimpcnt++;
		}
		else
		{
			pDphsettar->nimpcnt++;
			pDphsettar->tarimp -= pDphsettar->delimp;
		}
		
		/*    Segmental effect on f0, reset pDphsettar->tarseg if time exceeds cum dur */
		
        if ((pDphsettar->nframs >= (pDphsettar->segdur + pDphsettar->extrad)) 
			&& (pDphsettar->np_drawt0 < (pDph_t->nallotot-1))) {
			
			pDphsettar->nframs -= pDphsettar->segdur;
            pDphsettar->segdur = pDph_t->allodurs[++pDphsettar->np_drawt0];
            pDphsettar->phocur = pDph_t->allophons[pDphsettar->np_drawt0];
			
			/* EAB Found long standing bug-- due to the compensation for the delay through the filters
			the first phoneme is getting cheated on duration */
			if(pDphsettar->np_drawt0 == 1)
			{
				pDphsettar->nframs = -DELAY_SEG_LOWPASS;
			}
			
            if (pDphsettar->np_drawt0 < pDph_t->nallotot)  
				pDphsettar->phonex_drawt0 = pDph_t->allophons[pDphsettar->np_drawt0+1];
			
			
			/*        Set next f0 segmental incremental target */
			
			//f0seg = pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[phocur].f0segtars;
			tmp = pDphsettar->phocur & PFONT;
			if(tmp == PFUSA<<PSFONT)
			{
				f0seg = us_f0msegtars[pDphsettar->phocur & 0xff];	
			}
			else if(tmp == PFGR<<PSFONT)
			{
				f0seg = gr_f0msegtars[pDphsettar->phocur & PVALUE];	
			}
			else if(tmp == PFLA<<PSFONT)
			{
				f0seg = la_f0msegtars[pDphsettar->phocur & PVALUE];
			}
			else if(tmp == PFSP<<PSFONT)
			{
				f0seg = sp_f0msegtars[pDphsettar->phocur & PVALUE];
			}
			else if(tmp==PFFR<<PSFONT)
			{
                f0seg = fr_f0msegtars[pDphsettar->phocur & PVALUE];
			}
			
            pDphsettar->extrad = -DELAY_SEG_LOWPASS;	/* Assume like V-V trans */
			/* so start new target early */
			/*        Delay start of f0 rise for upcoming voiceless segment until boundary */
            if ((phone_feature( pDph_t,pDphsettar->phonex_drawt0) & FVOICD) IS_MINUS) {
                pDphsettar->extrad = 0;			/* All of rise during voicless */
            }
			/*        Delay f0 fall from voiceless plosive until vot (when glottis closes)*/
			if ((phone_feature( pDph_t,pDphsettar->phocur) & FVOICD) IS_MINUS) 
			{	
				 pDphsettar->tarseg1 = f0seg;  /* Gesture fast, go to only 1 lpfilter */
				pDphsettar->tarseg = 0;
				pDphsettar->extrad = 1;	/* -V fric, fall starts at voicing onset */
				if ((phone_feature( pDph_t,pDphsettar->phocur) & FPLOSV) IS_PLUS) {
					pDphsettar->extrad = 5;		/* -V plos, assume VOT = 32 ms */
					if ((pDph_t->allofeats[pDphsettar->np_drawt0] & FSTRESS) IS_MINUS) {
						pDphsettar->extrad = 3;
					}
				}
            }
			else {
				pDphsettar->tarseg = f0seg;	  /* Normal gesture for voiced segments is */
				pDphsettar->tarseg1 = 0;	  /* slow, use both segmental 1-pole filters */
			}
        }
		
		/*    Glottal stop gesture, test at beginning of each phoneme */
		/* eab 11/22/97 per caroline remove glotalization */

		set_tglst(pDph_t);		
		/* Set times of f0 fall pDphsettar->tglstp,pDphsettar->tglstn */
		
		if (pDph_t->f0mode< SINGING) {
			
			/*	  Filter f0 step and impulse commands to produce next value f0 */
			/* increment gilde towards target and cancel increment when as close as poss to target
			eab 1/21/98 */
			pDphsettar->glide_tot += pDphsettar->glide_inc;

	if(pKsd_t->lang_curr == LANG_british)
	{
			if(pDphsettar->glide_tot && pDphsettar->glide_inc ==0)
					pDphsettar->glide_tot -= (pDphsettar->glide_tot>>4); 
	}
			pDphsettar->glide_step -= pDphsettar->glide_inc;
			/*EAB 1/10/98 set glide_inc to zero if we've reached target*/
			if(pDphsettar->glide_inc > 0 )
			{
				if ( pDphsettar->glide_step <= pDphsettar->glide_inc)
				{
					pDphsettar->glide_inc =0;
				}
			}
			else
				if(pDphsettar->glide_inc < 0 )
				{
					if ( pDphsettar->glide_step >= pDphsettar->glide_inc)
					{
						pDphsettar->glide_inc =0;
					}
				}
				
				f0in = (pDph_t->f0minimum + pDphsettar->tarhat + (pDphsettar->tarimp));
#ifdef DEBUGF0
				//WINprintf("f0in %d  tarbas %d,tarbat %d tarimp %d \n",pDphsettar->tarbas,pDphsettar->tarhat,pDphsettar->tarimp,f0in);
#endif
				//WINprintf("phon %d tarbat %d tarimp %d glide %d\n",pDphsettar->np_drawt0,pDphsettar->tarhat,pDphsettar->tarimp,pDphsettar->glide_tot);
				

				pDphsettar->tarseg = mlsh1(pDphsettar->tarseg,16064);
				filter_seg_commands(pDph_t,pDphsettar->tarseg);	/* Input is pDphsettar->tarseg, output is pDphsettar->f0s */
				

				f0in += pDphsettar->glide_tot;
				// CAB 05/24/2002 Removed warnings by typecast
				filter_commands(pDph_t, (short)(f0in));		/* Input is f0in, output is f0  */
				
				/* Add in glide value to F0 eab 1/21/98 */
				//Olivertest 

				pDph_t->f0prime = pDph_t->f0 + pDph_t->f0s ;	/* This will be spdef-scaled output value */

				//		WINprintf("maleseg f0s %d tarseg %d tarseg1 %d \n", pDph_t->f0s,pDphsettar->tarseg,pDphsettar->tarseg1); 
				
				/* WINprintf (" f0 %4d f0s %4d f0prime %4d, ",
				   pDph_t->f0, pDph_t->f0s, pDph_t->f0prime );
                */
				
#ifdef DEBUGF0
				WINprintf("maleseg f0s %d tarseg %d tarseg1 %d \n", pDph_t->f0s,pDphsettar->tarseg,pDphsettar->tarseg1); 
				WINprintf("male %d %d %d pDph_t->f0 %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0],
					pDph_t->f0prime, pDph_t->f0); 
#endif
				
				
				/* 11/23/97 Eab creek for male voice only for now*/
				/*BATS 709 EAB 7/15/98 left number_words >5 out in ad code this
				isn't right or wrong but for overall perception not creeking except for longer
				utternce should be better */

#ifdef CREEKMALE
				if( pDphsettar->nframb >  pDph_t->tcumdur-4
					&& pDph_t->clausetype == DECLARATIVE 
					&& pDph_t->number_words > 5 )
				{
					pDph_t->avcreek = -6;
					pDph_t->f0prime = pDph_t->f0prime >>1;
				}
				else
				{
					pDph_t->avcreek = 0;
				}
				
			//	WINprintf("phocur %d %d %d F0in %d \n",pDphsettar->phocur, pDphsettar->tarbas, pDph_t->enddrop, pDph_t->f0prime);
				
#endif
				
		}
		else 
		{

			/*	  Linear interpolation to 'pDphsettar->newnote' over 100 ms or phoneme duration */
			/*    Add vibratto if pDphsettar->vibsw=1  */

			linear_interp(pDph_t);
		}

 //printf("phocur %d %d %d F0in %d \n",pDphsettar->phocur, pDphsettar->tarbas, pDph_t->enddrop, pDph_t->f0prime);

		/*    Glottalization gesture */
		/*    F0 dip by 60 Hz linear ramp in 8 frames each direction about pDphsettar->tglstp */
		dtglst = pDphsettar->nframg - pDphsettar->tglstp;
		if (dtglst < 0)
			dtglst = (-dtglst);

        if (dtglst <= 7)
		{
			
            pDph_t->f0prime += ((dtglst * 70) - 550);
			
		}
	
		/*    Add f0 drift or flutter (approx 3 and 5-Hz sine waves, each +/-1.0 Hz) */
		if (pDph_t->f0mode< SINGING) {
			pDphsettar->timecos5 += 131;		/* Prime number to reduce coincidence */
			if (pDphsettar->timecos5 > TWOPI)    pDphsettar->timecos5 -= TWOPI;
			pDphsettar->timecos3 += 79;
			if (pDphsettar->timecos3 > TWOPI)    pDphsettar->timecos3 -= TWOPI;
			pseudojitter = getcosine[pDphsettar->timecos5>>6]
				- getcosine[pDphsettar->timecos3>>6];
			//pDph_t->arg1 = pseudojitter;
			/* eab found flutter is not a speaker def yet*/
			//pDph_t->arg2 = 700;//pDph_t->f0flutter;
			/* "FLUTTER" spdef parameter, 10% -> +/-1 Hz, */
			pDph_t->f0prime += mlsh1(pseudojitter,700);	
			if(pDph_t->clausetype == 2)
			{
			//	pDph_t->f0prime += mlsh1(pseudojitter,pDph_t->addjit);
				pDph_t->addjit = -pDph_t->addjit;
			}
			
			
			/*  100% corresp. to +/- 10 Hz max flutter */
		}
		
		/*    Introduce variability to period at startup from a voiceless interval */
		/*	not implemented */
		
		/*    Scale f0 according to current speaker definition, the number 120 is
		*    the nominal average pitch of Paul's voice (AP in spdef)  */

		if (pDph_t->f0mode< SINGING) {
			if(pDph_t->clausetype == 2)
			{
				pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - pDph_t->f0minimum), pDph_t->f0scalefac+1000);
				
			}
			else
			{
				//WINprintf ("\nf0prime1 %d ", pDph_t->f0prime);
				pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - pDph_t->f0minimum), pDph_t->f0scalefac);
				//WINprintf ("f0prime2 %d \n", pDph_t->f0prime);
			}
		}
				//WINprintf ("f0prime2 %d \n", pDph_t->f0prime);
	
		/*    See if f0 exceeds legal bounds, truncate  */
        if (pDph_t->f0prime > HIGHEST_F0) {
			pDph_t->f0prime = HIGHEST_F0;
		}
        else if (pDph_t->f0prime < LOWEST_F0) {
			pDph_t->f0prime = LOWEST_F0;
		}
		
		/*    Change from Middle C = 256 Hz (A = 430.4) to A = 440 Hz (SHOULD RE-DO */
		/*    TABLE INSTEAD) */
		if (pDph_t->f0mode== SINGING) 
		{
			pDph_t->f0prime = frac4mul(pDph_t->f0prime,4190);
		}
		
		/*    Save value of period t0 in parameter array  */
		/*    (ONLY ESSENTIAL DIVIDE INSTRUCTION IN ALL OF DECTALK) */
		//pDph_t->arg1 = 400;
		/* 2/12/99  eab adjusted for sample in vtm.c*/
		//pDph_t->arg2 = 1000;
		//pDph_t->arg3 = pDph_t->f0prime;
        temp = muldv(400, 1000, pDph_t->f0prime);
	

#if (defined  FAKE_HLSYN || !(defined HLSYN) )
	pDph_t->parstochip[OUT_T0]  = temp;
#else
		pDph_t->parstochip[OUT_T0]  =pDph_t->f0prime;
#endif	


		
		
#ifdef GRAPHF0
		for (icnt=0;icnt<=120;icnt++)
		{
			prntbuf[icnt]=' ';
		}
		prntbuf[120]='\0';
		if(pDph_t->malfem == FEMALE) /* Female or childs voice scale to fit*/
			icnt=((pDph_t->f0prime)/30);
		else
			icnt=((pDph_t->f0prime)/10)-50;
		if(icnt >=120)
			icnt=119;
		prntbuf[icnt]='*';
		WINprintf("%d",pDph_t->f0prime);
		WINprintf("%s\n",prntbuf);
#endif
		/*
		WINprintf("TARBAS %d phone %d  tarhat=%3d tarimp=%3d  f0 =%d \n",
        pDphsettar->tarbas,pDph_t->allophons[pDphsettar->npg],pDphsettar->tarhat, pDphsettar->tarimp,
		pDph_t->f0prime); */
		//	 if(0)
//		//	 pDph_t->parstochip[OUT_T0]=of0array[oarcnt++];
		
		/* debug switch */
		if (((pKsd_t->logflag) & LOG_OUTPHON) || DT_DBG(PH_DBG,0x008))
		{
#ifdef MSDBG4
			if (pDphsettar->lastone==-1)
			{
				for (keepdur=0;keepdur<TOT_ALLOPHONES;keepdur++)
				{
					printf("phone#=%d == %c%c\n",keepdur,pKsd_t->arpabet[keepdur <<1],pKsd_t->arpabet[(keepdur <<1)+1]);
				}  
			}
#endif
			/* if (np == 0 && allophons[np] == GEN_SIL) { lastone=np; }   */
			if (pDphsettar->np_drawt0 != pDphsettar->lastone)
			{
#ifdef MSDBG4 
				printf("lastone=%d f0prime=%d\n",pDphsettar->lastone,pDph_t->f0prime/10);
				printf ("allophons[%d]=%d ", pDphsettar->np_drawt0, pDph_t->allophons[pDphsettar->np_drawt0]);
				printf ("allodurs[%d]=%d\n", pDphsettar->np_drawt0, pDph_t->allodurs[pDphsettar->np_drawt0]*64/10);
#endif
				if ((pDphsettar->np_drawt0 >= 0))
				{
					
#ifdef MSDOS
					/*WAIT_PRINT;*/
					dologphoneme (pDph_t->allophons[pDphsettar->np_drawt0],
						(pDph_t->allodurs[pDphsettar->np_drawt0] * 64 / 10),
						(pDph_t->f0prime / 10));
					printf("\n");
					/*SIGNAL_PRINT;*/
#else
					dologphoneme (phTTS, pDph_t->allophons[pDphsettar->np_drawt0],
						(short)  (pDph_t->allodurs[pDphsettar->np_drawt0] * 64 / 10),
						(short) (pDph_t->f0prime / 10));
#ifdef PRINTFDEBUG
					printf ("\n");
#endif
#ifndef ARM7
					if (pKsd_t->logflag & LOG_OUTPHON)
					{
						if (fprintf (phTTS->pLogFile, "\n") < 0)
						{
							TextToSpeechErrorHandler (phTTS,
								ERROR_WRITING_FILE,
								0L);
						}
					}
#endif
#endif // MSDOS
				}
				/* keepdur = (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10); */		/* eab need to keep orig value of dur */ 
				/* keepallo = pDph_t->allophons[pDphsettar->np_drawt0]; */
				pDphsettar->lastone = pDphsettar->np_drawt0;
			}
		}
		
		/*    Increment time counters */
        pDphsettar->nfram++;
        pDphsettar->nframs++;
        pDphsettar->nframg++;
		
#ifndef MSDOS
		//eab BATS 887 this is the wrong place to output them....
		//pDph_t->parstochip[OUT_PH] = pDph_t->allophons[pDphsettar->np_drawt0];
		//pDph_t->parstochip[OUT_DU] = pDph_t->allodurs[pDphsettar->np_drawt0];
#endif
		
		
		
		
}/*end of if malfem==male*/
else
{
	if (pDph_t->nf0ev <= -2) 
	{
		/* Hard initialization */
		/* for now hardcode baseline for init experimentation eab 8/96*/
		/* eab BUG- found problem with f0command, it needs to be a global variable
		or it sometimes doesn't get handled correctly*/
		pDph_t->clausepos=0;
		pDphsettar->phocur = GEN_SIL;
		
		/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
	
		/*        Time since last reset of baseline fall, in frames */
		pDphsettar->nframb = 0;
		
		pDphsettar->basetime =0;
		pDphsettar->basecntr =0;
		pDphsettar->f0delta =0;
				
		/*eab 4/11/97 Moved these variables to a proper place of initlaization*/
		pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0;	
		
		/*        If within 32 ms (5 frames) of nframg, glottal stop gesture */
		/*        is in progress */
		pDphsettar->tglstp = -200;
		
		/*        Set filter memory to init baseline fall (f0 in hz*10) */
		/* eab 7/22/98 changed to >>1 to account for scaling of female voice*/
//		oarcnt = 0;
		pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
		pDphsettar->f0slas2 = 0;
	
		pDphsettar->tarhat = 0;
		pDphsettar->tarimp = 0;
		pDphsettar->delimp = 0;
		
		/*      Set smoothing constants for ( critical-damped? ) 2nd-order sys  */
		
		pDphsettar->f0a2 = pDph_t->f0_lp_filter;	/* Impulse and hat commands */
		pDphsettar->f0b = FRAC_ONE - pDphsettar->f0a2;
		pDphsettar->f0a1 = pDphsettar->f0a2 << F0SHFT;
		
		pDphsettar->f0sa2 =  F_SEG_LOWPASS;	/* Segmental influences */
		
		pDphsettar->f0sb = FRAC_ONE - pDphsettar->f0sa2;
		pDphsettar->f0sa1 = pDphsettar->f0sa2 << F0SHFT;
		
		/*      Variables  relevent only if f0mode >= SINGING */
		
		pDphsettar->newnote = 1600;
		pDphsettar->delnote = 0;
		pDphsettar->delcum = 0;
		pDphsettar->f0start = pDph_t->f0;
		pDphsettar->vibsw = 0;
		
		/*      Initialize pointer to f0 command string */
		
		pDph_t->nf0ev = -1;
	}
	
	/*    Reinit pointer and time of first f0 command if new clause */
    if( pDph_t->nf0ev == -1 ) 
	{		
		/* Soft initialization */
		pDphsettar->nimpcnt = 0;
		pDphsettar->tarimp =0;
		pDph_t->enddrop =0;


		pDphsettar->nframb = 0;
		pDphsettar->basetime=0;
		pDphsettar->basecntr =0;
		pDphsettar->f0delta =0;
		pDph_t->special_phrase = 0;
//		oarcnt=0;
		/*	  Raise baseline for first sentence of a paragraph */
		if (pDph_t->newparagsw != FALSE) 
		{
			pDphsettar->beginfall += 120;
			pDphsettar->endfall += 70;
			pDph_t->newparagsw = FALSE;
		}
		
		/*        Time between 0 and first  f0 command, in frames */
		pDphsettar->dtimf0 = pDph_t->f0tim[0];
		/*         Pointer into dur and phone arrays */
		pDphsettar->np_drawt0 = -1;
		pDphsettar->npg = -1;
		pDph_t->nf0ev = 0;
		
		
		
		/*        Time since last f0 command, in frames */
		
		/* INITIALIZE NFRAM TO DELAY THROUGH FILTER THIS USED TO BE IN AND WAS NOT IN
		88 STUFF BUT IS REALLY NEEDED*/
//		oarcnt=0;
		pDphsettar->nframs = 0;
		pDphsettar->nfram =  0;
        pDphsettar->nframg = 6- ((pDph_t->f0_lp_filter-1300)>>8);
		
		if (pDph_t->f0mode< SINGING) 
		{
			pDphsettar->nfram = pDphsettar->nframs >> 1;
		}
		else 
		{
			pDphsettar->nfram = 0;	/* Start note slightly early if singing */
		}
		
		pDphsettar->f0slas1 = 0;
		pDphsettar->f0slas2 = 0;
       
        pDphsettar->nframs = 0;		
		/* Used in computing segmental effects */
		
		
		/*        Extra time, in frames, used to delay or advance f0 gesture assoc. */
		/*        with a particular segment, e.g. at delayed vot, or anticipate in V-V */
		pDphsettar->extrad = -DELAY_SEG_LOWPASS; /* Start gesture toward next seg early */
		/*        Duration of current segment, in frames */
		pDphsettar->segdur = 0;
		pDphsettar->segdrg = 0;
		pDph_t->lastallo=0;
		pDph_t->keepallo=0;
#ifdef GFAPHF0
		pDph_t->lastone=-1;
		pDph_t->keepdur=0;
#endif
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
		pDphsettar->glide_tot=0;
		pDphsettar->glide_inc =0;
		/*	  Must be at bottom of hat */
		pDphsettar->tarhat = 0;	    /* should be anyway, except for emergency halt */
		pDph_t->addjit = 305;
		
		
        }
		/*    End of initialization */
		
		
		
		/*  See if new f0 commands issued					*/
		/*    To get f0 commands to occur at right times, need to take		*/
		/*    into account delay introduced by low-pass filter. Response to	*/
		/*    a step command begins xx frames earlier than f0time[] request	*/
		/*    so f0 gets half-way to target at nominal step onset time		*/
		
        while ((pDphsettar->nfram >= pDphsettar->dtimf0) && 
			(pDph_t->nf0ev < pDph_t->nf0tot)) 
		{
			
            pDphsettar->f0command = pDph_t->f0tar[pDph_t->nf0ev];	/* New target f0 */
			pDphsettar->type = pDph_t->f0type[pDph_t->nf0ev];
            pDphsettar->nfram -= pDphsettar->dtimf0;
			/* eab 1/10/98 added length parameter*/
			pDphsettar->length = pDph_t->f0length[pDph_t->nf0ev];
			
			if (pDph_t->f0mode== TIME_VALUE_SPECIFIED) {
				pDphsettar->dtimf0 = pDph_t->f0tim[pDph_t->nf0ev];
				pDph_t->nf0ev++;
				set_user_target(pDph_t,&pDphsettar->f0command);
			}
			else {
				pDph_t->nf0ev++;	/* Achieve target at next time */
				pDphsettar->dtimf0 = pDph_t->f0tim[pDph_t->nf0ev];
				switch(pDphsettar->type)
				{
				case USER: /*user specified f0 target*/
					set_user_target(pDph_t,&pDphsettar->f0command);
					break;
					
				case F0_RESET: /* f0 reset*/
					
							   pDphsettar->tarhat = 0;		/* Go to bottom of hat pattern 
															and for UK init glide, note glide is not ifdefed _uk becuase
							   it is a command we ant to allow others to use*/
							   pDph_t->glotalize =0;
							   pDphsettar->glide_step=0;
							   pDphsettar->glide_tot=0;
							   pDphsettar->glide_inc=0;
							   break;
				case STEP:
if (pKsd_t->lang_curr == LANG_british)
					break;

					pDphsettar->tarhat += pDphsettar->f0command;
					/* Command is a step, reset pDphsettar->tarhat */
					
					if (pDphsettar->f0command < 0) 
					{	/* Cancel previous impulse if step */
						/* is of opposite sign */
						if (pDphsettar->tarimp > 0) 
						{   
							pDphsettar->tarimp = 0;
							
						}
					}
					else
					{
						if (pDphsettar->tarimp < 0) 
						{
							pDphsettar->tarimp = 0;
							
						}
					}
					break;
				case GLIDE:/* eab 1/10/98 work in progress */
					
					pDphsettar->glide_step = pDphsettar->f0command;
					pDphsettar->glide_inc =(pDphsettar->glide_step/pDphsettar->length);
					
					break;
					
				case GLOTTAL:
if (pKsd_t->lang_curr == LANG_british)
					break;

					pDph_t->enddrop= -pDphsettar->f0command;
					pDph_t->glotalize =1;
					break; //BATS 704	
				case IMPULSE:
					
					/* Odd, command is impulse  */
					/*	          Impulse realized as 24-frame "step plus ramp" from f0command */
					/*	          to three times focommand */
					/* eab old ocde used to have an impulse as a 2*f0command that would be realized as an 
					16 frame wide pulse. This new scheme proposed by Dennis Klatt uses 
					imp=f0command+(f0command _ f0command>>4 meaning it will take 16 farmes to
					reach double height. The old one never reached target so this new approach I think 
					presently has two problems it's dealyed too much and it lasts too long causing higher f0 values
					and more percieved effect. I want to try it differently starting out close to the old code with a pulse command that 
					trails off.
					with a downward slope think of it as a rectangular pulse with a triangle placed on
					top instead of a second rectangular pulse- by the way it's not working correctly at
					the moment*/

					pDphsettar->tarimp = 0;//pDphsettar->f0command<<1;
					
					
					//pDphsettar->delimp = pDphsettar->f0command>>1;
					// pDphsettar->nimp = 24 - ((pDph_t->f0_lp_filter-1300)>>8);
					pDphsettar->nimp = pDphsettar->length;
					pDphsettar->delimp = (pDphsettar->f0command/pDphsettar->nimp)<<1;
					pDphsettar->nimpcnt = 0;


					break;
					
				}
			}
					
			/*        Loop back to look for more f0 commands */
        }
		


		
		pDphsettar->nframb++;
		
      if (pDphsettar->nimpcnt == (pDphsettar->nimp)) {
			pDphsettar->nimpcnt = 0;
			pDphsettar->tarimp = 0;
			pDphsettar->delimp = 0;
			pDphsettar->nimp = 0;
		}
		else  if (pDphsettar->nimpcnt <= (pDphsettar->nimp>>1)) {
			//pDphsettar->nimp--;
			pDphsettar->tarimp += pDphsettar->delimp;
			//pDphsettar->nimp = 0;
			pDphsettar->nimpcnt++;
		}
		else
		{
			pDphsettar->nimpcnt++;
			pDphsettar->tarimp -= pDphsettar->delimp;
		}
		
		//WINprintf("tarimp %d \n", pDphsettar->tarimp);
		/*    Segmental effect on f0, reset pDphsettar->tarseg if time exceeds cum dur */
		
        if ((pDphsettar->nframs >= (pDphsettar->segdur + pDphsettar->extrad)) 
			&& (pDphsettar->np_drawt0 < (pDph_t->nallotot-1))) {
			
			pDphsettar->nframs -= pDphsettar->segdur;
            pDphsettar->segdur = pDph_t->allodurs[++pDphsettar->np_drawt0];
            pDphsettar->phocur = pDph_t->allophons[pDphsettar->np_drawt0];
			/* EAB Found long standing bug-- due to the compensation for the delay through the filters
			the first phoneme is getting cheated on duration */
			if(pDphsettar->np_drawt0 == 1)
			{
				pDphsettar->nframs = -DELAY_SEG_LOWPASS;
			}
			
            if (pDphsettar->np_drawt0 < pDph_t->nallotot)  
				pDphsettar->phonex_drawt0 = pDph_t->allophons[pDphsettar->np_drawt0+1];
			
			
			/*        Set next f0 segmental incremental target */
			tmp = pDphsettar->phocur & PFONT;
			if(tmp == PFUSA<<PSFONT)
			{
				f0seg = 2*us_f0fsegtars[pDphsettar->phocur & PVALUE];	
			}
			else if(tmp == PFGR<<PSFONT)
			{
				f0seg = gr_f0fsegtars[pDphsettar->phocur & PVALUE];	
			}
			else if(tmp == PFLA<<PSFONT)
			{
				f0seg = la_f0fsegtars[pDphsettar->phocur & PVALUE];
			}
			else if(tmp == PFSP<<PSFONT)
			{
				f0seg = sp_f0fsegtars[pDphsettar->phocur & PVALUE];
			}
			else if(tmp == PFFR<<PSFONT)
			{
                f0seg = fr_f0fsegtars[pDphsettar->phocur & PVALUE];
			}
			// f0seg = pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[phocur].f0segtars;
			//	f0seg = f0fsegtars[pDphsettar->phocur & PVALUE];
			/*	  Effect is half as much in unstressed segments */
            pDphsettar->extrad = -DELAY_SEG_LOWPASS;	/* Assume like V-V trans */
			/* so start new target early */
			/*        Delay start of f0 rise for upcoming voiceless segment until boundary */
            if ((phone_feature( pDph_t,pDphsettar->phonex_drawt0) & FVOICD) IS_MINUS) {
                pDphsettar->extrad = 0;			/* All of rise during voicless */
            }
			/*        Delay f0 fall from voiceless plosive until vot (when glottis closes)*/
			//ah but this goofs up onset into voicelee it should be phocur -1 I think
			if ((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->np_drawt0-1]) & FVOICD) IS_MINUS) 
			{	
				pDphsettar->tarseg1 = f0seg;  /* Gesture fast, go to only 1 lpfilter */
				pDphsettar->tarseg = 0;
				pDphsettar->extrad = 1;	/* -V fric, fall starts at voicing onset */
				if ((phone_feature( pDph_t,pDphsettar->phocur) & FPLOSV) IS_PLUS) {
					pDphsettar->extrad = 5;		/* -V plos, assume VOT = 32 ms */
					if ((pDph_t->allofeats[pDphsettar->np_drawt0] & FSTRESS) IS_MINUS) {
						pDphsettar->extrad = 3;
					}
				}
            }
			else {
				pDphsettar->tarseg = f0seg;	  /* Normal gesture for voiced segments is */
				pDphsettar->tarseg1 = 0;	  /* slow, use both segmental 1-pole filters */
			}
        }
		
		/*    Glottal stop gesture, test at beginning of each phoneme */
		/* eab 11/22/97 per caroline remove glotalization */

		set_tglst(pDph_t);		


		/* Set times of f0 fall pDphsettar->tglstp,pDphsettar->tglstn */
		
		if (pDph_t->f0mode< SINGING) {
			
			/*	  Filter f0 step and impulse commands to produce next value f0 */
			/* increment gilde towards target and cancel increment when as close as poss to target
			eab 1/21/98 */
			pDphsettar->glide_tot += pDphsettar->glide_inc;
if (pKsd_t->lang_curr == LANG_british)
{
			if(pDphsettar->glide_tot && pDphsettar->glide_inc ==0)
					pDphsettar->glide_tot -= (pDphsettar->glide_tot>>4);
			//	WINprintf("female %d %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0]);
}
			//	WINprintf("female %d %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0]);
			pDphsettar->glide_step -= pDphsettar->glide_inc;
			/*EAB 1/10/98 set glide_inc to zero if we've reached target*/
			if(pDphsettar->glide_inc > 0 )
			{
				if ( pDphsettar->glide_step <= pDphsettar->glide_inc)
				{
					pDphsettar->glide_inc =0;
				}
			}
			else
				if(pDphsettar->glide_inc < 0 )
				{
					if ( pDphsettar->glide_step >= pDphsettar->glide_inc)
					{
						pDphsettar->glide_inc =0;
					}
				}
				
				f0in = (pDph_t->f0minimum + pDphsettar->tarhat + pDphsettar->tarimp);
#ifdef DEBUGF0
				WINprintf(" tarbas %d,tarHat %d tarimp %d \n",pDphsettar->tarbas,pDphsettar->tarhat,pDphsettar->tarimp);
#endif
				

	//WINprintf("f0seg %d  %d tarimp %d glide %d\n",f0seg,pDphsettar->tarhat,pDphsettar->tarimp,pDphsettar->glide_tot);
	//WINprintf(" f0in %d,tarHat %d tarimp %d \n",f0in,pDphsettar->tarhat,pDphsettar->tarimp);			
	
				/*	  Reduce segmental tongue height effect of sonorants toward */
				/*	  end of segment (98% per frame)  */
				
				//pDph_t->arg1 = pDphsettar->tarseg; 
				//pDph_t->arg2 = 16064;    
				
				pDphsettar->tarseg = mlsh1(pDphsettar->tarseg,16064);
				
				
				//WINprintf("tarseg = %d f0in %d \n,",(pDphsettar->tarseg +pDphsettar->tarseg1),f0in);
				//f0in=f0in>>1; //eab 7/21/98 scale to avoid overload
				filter_seg_commands(pDph_t,pDphsettar->tarseg);	/* Input is pDphsettar->tarseg, output is pDphsettar->f0s */
				f0in += pDphsettar->glide_tot;

				// CAB 05/24/2002 Removed warnings by typecast
			
				filter_commands(pDph_t, (short)(f0in));
				//filter_commands(pDph_t,f0in);		/* Input is f0in,   output is f0  */

				//pDph_t->f0 = pDph_t->f0<<1;
				/* Add in glide value to F0 eab 1/21/98*/
				/* reduce segmental influence per Oliver*/

				pDph_t->f0prime = pDph_t->f0 + pDph_t->f0s ;	/* This will be spdef-scaled output value */


				
				
#ifdef DEBUGF0
				WINprintf("femalef0 %d \n", pDph_t->f0prime); 
				WINprintf("female %d %d  f0in %d \n", pDph_t->f0prime, 
					pDphsettar->tarseg, f0in); 
#endif
					//WINprintf("female %d %d  tarimp %d f0in %d \n", pDph_t->f0prime, 
				//	pDphsettar->tarseg,pDphsettar->tarimp, f0in); 
				
#ifdef CREEKFEMALE
				if( pDphsettar->nframb >  pDph_t->tcumdur-4 
					&& pDph_t->clausetype == DECLARATIVE 
					&& pDph_t->number_words > 5)
				{
					pDph_t->avcreek = -6;
					pDph_t->f0prime = pDph_t->f0prime >>1;
				}
				else
				{
					pDph_t->avcreek = 0;
				}
				
				//	WINprintf( "phocur %d %d %d F0in %d \n",pDphsettar->phocur, pDphsettar->tarbas, pDph_t->enddrop, pDph_t->f0prime);
#endif
				
		}
		
		else 
		{
			/*	  Linear interpolation to 'pDphsettar->newnote' over 100 ms or phoneme duration */
			/* Add vibratto if pDphsettar->vibsw=1  */
			linear_interp(pDph_t);
		}
		//filter_seg_commands(pDph_t,pDphsettar->tarseg);
	//	pDph_t->f0 += pDph_t->f0s;
		/*    Glottalization gesture */
		/*    F0 dip by 60 Hz linear ramp in 8 frames each direction about pDphsettar->tglstp */
		dtglst = pDphsettar->nframg - pDphsettar->tglstp;
		if (dtglst < 0)
			dtglst = (-dtglst);

        if (dtglst <= 7)
		{
			
            pDph_t->f0prime += ((dtglst * 70) - 550);
			
		}

		
		/*	  And reduce AV somewhat (ugly code, but F0 computed before AV) */
        if (dtglst <= 5) {
			pDph_t->avglstop = (6 - dtglst);	/* Global variable, used in PHDRAW.C */
        }
		else 
		{
			pDph_t->avglstop = 0;
			
		}

		/*    Add f0 drift or flutter (approx 3 and 5-Hz sine waves, each +/-1.0 Hz) */
		if (pDph_t->f0mode< SINGING) {
			pDphsettar->timecos5 += 131;		/* Prime number to reduce coincidence */
			if (pDphsettar->timecos5 > TWOPI)    pDphsettar->timecos5 -= TWOPI;
			pDphsettar->timecos3 += 79;
			if (pDphsettar->timecos3 > TWOPI)    pDphsettar->timecos3 -= TWOPI;
			pseudojitter = getcosine[pDphsettar->timecos5>>6] - getcosine[pDphsettar->timecos3>>6];
			pDph_t->arg1 = pseudojitter;
#ifndef TOMBUCHLER
			/* eab found flutter is not a speaker def yet*/
			pDph_t->arg2 = 700;//pDph_t->f0flutter;//4/16/98 eab higher for female voice
			/* "FLUTTER" spdef parameter, 10% -> +/-1 Hz, */
			pDph_t->f0prime += mlsh1(pDph_t->arg1,pDph_t->arg2);	
#endif
			if(pDph_t->clausetype == 2)
			{
				pDph_t->f0prime += mlsh1(pseudojitter,pDph_t->f0flutter);
				pDph_t->addjit = -pDph_t->addjit;
			}
			//WINprintf("after adjit %d \n",pDph_t->f0prime);
			
			/*  100% corresp. to +/- 10 Hz max flutter */
		}
		
		/*    Introduce variability to period at startup from a voiceless interval */
		/*	  not implemented */
		
		/*    Scale f0 according to current speaker definition, the number 120 is
		*    the nominal average pitch of Paul's voice (AP in spdef)  */
		if (pDph_t->f0mode< SINGING) {
			if(pDph_t->clausetype == 2)
			{
				pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - pDph_t->f0minimum), pDph_t->f0scalefac+500);
				
			}
			else
			{
				pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - pDph_t->f0minimum), pDph_t->f0scalefac);
			}
		}
		
		/*    See if f0 exceeds legal bounds, truncate  */
        if (pDph_t->f0prime > HIGHEST_F0) {
			pDph_t->f0prime = HIGHEST_F0;
		}
        else if (pDph_t->f0prime < LOWEST_F0) {
			pDph_t->f0prime = LOWEST_F0;
		}
		
		/*    Change from Middle C = 256 Hz (A = 430.4) to A = 440 Hz (SHOULD RE-DO */
		/*    TABLE INSTEAD) */
		if (pDph_t->f0mode== SINGING) {
			pDph_t->f0prime = frac4mul(pDph_t->f0prime,4190);
		}
		
		/*    Save value of period t0 in parameter array  */
		/*    (ONLY ESSENTIAL DIVIDE INSTRUCTION IN ALL OF DECTALK) */
		//pDph_t->arg1 = 400;
		//pDph_t->arg2 = 1000;
		//pDph_t->arg3 = pDph_t->f0prime;
		temp = muldv(400, 1000, pDph_t->f0prime);
#if (defined  FAKE_HLSYN || !(defined HLSYN) )
	pDph_t->parstochip[OUT_T0]  = temp;
#else
		pDph_t->parstochip[OUT_T0]  =pDph_t->f0prime;
#endif	
		
#ifdef GRAPHF0
		
		for (icnt=0;icnt<=120;icnt++)
			prntbuf[icnt]=' ';
		prntbuf[120]='\0';
		if(pDph_t->malfem == FEMALE) /* Female or childs voice scale to fit*/
			icnt=((pDph_t->f0prime)/25);
		else
			icnt=((pDph_t->f0prime)/10)-50;
		if(icnt >=120)
			icnt=120;
		prntbuf[icnt]='*';
		WINprintf("%d",pDph_t->f0prime);
		WINprintf("%s\n",prntbuf);
		
		
#endif
		
		//	WINprintf("TARBAS %d phone %d  tarhat=%3d tarimp=%3d  f0 =%d \n",
		//      pDphsettar->tarbas,pDph_t->allophons[pDphsettar->npg],pDphsettar->tarhat, pDphsettar->tarimp,
		//	pDph_t->f0prime); 
		//	 if(0)
//		//	 pDph_t->parstochip[OUT_T0]=of0array[oarcnt++];
		
		/* debug switch */
		if (((pKsd_t->logflag) & LOG_OUTPHON) || DT_DBG(PH_DBG,0x008))
		{
#ifdef MSDBG4
			if (pDphsettar->lastone==-1)
			{
				for (keepdur=0;keepdur<TOT_ALLOPHONES;keepdur++)
				{
					printf("phone#=%d == %c%c\n",keepdur,pKsd_t->arpabet[keepdur <<1],pKsd_t->arpabet[(keepdur <<1)+1]);
				}  
			}
#endif
			/* if (np == 0 && allophons[np] == GEN_SIL) { lastone=np; }                  */
			if (pDphsettar->np_drawt0 != pDphsettar->lastone)
			{
#ifdef MSDBG4 
				printf("lastone=%d f0prime=%d\n",pDphsettar->lastone,pDph_t->f0prime/10);
				printf ("allophons[%d]=%d ", pDphsettar->np_drawt0, pDph_t->allophons[pDphsettar->np_drawt0]);
				printf ("allodurs[%d]=%d\n", pDphsettar->np_drawt0, pDph_t->allodurs[pDphsettar->np_drawt0]*64/10);
#endif
				if ((pDphsettar->np_drawt0 >= 0))
				{
					
#ifdef MSDOS
					/*WAIT_PRINT;*/
					dologphoneme (pDph_t->allophons[pDphsettar->np_drawt0],
						(pDph_t->allodurs[pDphsettar->np_drawt0] * 64 / 10),
						(pDph_t->f0prime / 10));
					printf("\n");
					/*SIGNAL_PRINT;*/
#else
					dologphoneme (phTTS, pDph_t->allophons[pDphsettar->np_drawt0],
						(short)(pDph_t->allodurs[pDphsettar->np_drawt0] * 64 / 10),
						(short)(pDph_t->f0prime / 10));  // NAL warning removal
#ifdef PRINTFDEBUG
					printf ("\n");
#endif
#ifndef ARM7
					if (pKsd_t->logflag & LOG_OUTPHON)
					{
						if (fprintf (phTTS->pLogFile, "\n") < 0)
						{
							TextToSpeechErrorHandler (phTTS,
								ERROR_WRITING_FILE,
								0L);
						}
					}
#endif
#endif // MSDOS
				}
				/* keepdur = (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10); */		/* eab need to keep orig value of dur */ 
				/* keepallo = pDph_t->allophons[pDphsettar->np_drawt0]; */
				pDphsettar->lastone = pDphsettar->np_drawt0;
			}
		}
		
		/*    Increment time counters */
        pDphsettar->nfram++;
        pDphsettar->nframs++;
        pDphsettar->nframg++;
		
#ifndef MSDOS
		//eab BATS 887 this is the wrong place to output them....
		//pDph_t->parstochip[OUT_PH] = pDph_t->allophons[pDphsettar->np_drawt0];
		//pDph_t->parstochip[OUT_DU] = pDph_t->allodurs[pDphsettar->np_drawt0];
#endif
		
		
		
} /* end of fem stuff*/
}

/* ******************************************************************
 *      Function Name: set_user_target()
 *
 *      Description: Set user target
 *
 *      Arguments:	PDPH_T pDph_t
 *					short *psF0command
 *
 *      Return Value: void
 *
 *      Comments:
 *
 ******************************************************************/
static void set_user_target(PDPH_T pDph_t, short *psF0command)
{
	short trandur=0;
    PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;
	int tmp;

	if (*psF0command > 1500)  
	{
		tmp = 	(*psF0command / 1000);
		if(tmp > 0)
		{
		tmp = (6-tmp)*100;
		pDph_t->spressure = tmp;
		}
		else
		{
			pDph_t->spressure =0;
		}
	}
	*psF0command = *psF0command%1000;   /* 2000 is offset flag */
	
	
	if (*psF0command <= 37) 
	{	/* Pointer to C5, highest possible sung note */
		
		pDphsettar->newnote = notetab[*psF0command-1];
		pDphsettar->vibsw = 1;
		/*	  Set pDphsettar->delnote*4 so transition happens over 16 frames (100 ms) */
		pDphsettar->delnote = ((pDphsettar->newnote - pDph_t->f0) >> 2);
	}
	else {						/* Straight-lines */
		*psF0command *= 10;
		if (*psF0command < LOWEST_F0) 
		{
			*psF0command = LOWEST_F0;
		}
		else if (*psF0command > HIGHEST_F0) 
		{
			*psF0command = HIGHEST_F0;
		}
		pDphsettar->newnote = *psF0command;
		pDphsettar->vibsw = 0;
		/*	  Compute duration of linear transition */
		if (pDph_t->f0mode== TIME_VALUE_SPECIFIED) {
			trandur = pDphsettar->dtimf0;	
			/*		Dur since last f0 command		*/
			/* OUT		printf("trandur = %d, target=%d, curf0=%d\n",
			trandur, pDphsettar->newnote, f0);  END OUT */
			if (trandur == 0)  
				pDph_t->f0 = pDphsettar->newnote;
		}
		else {	
			trandur = pDph_t->allodurs[pDphsettar->npg+1];	/* Dur of cur phoneme */
		}
		/*	  Compute incremental change to f0*10 every frame */
		pDphsettar->delnote = (pDphsettar->newnote - pDph_t->f0) << 2;	/* f0 change times 40 */
		if (pDphsettar->delnote > 0) {
			pDphsettar->delnote += (trandur - 1);	/* Round upward */
		}
		if (pDphsettar->delnote < 0) {
			pDphsettar->delnote -= (trandur - 1);	/* Round downward */
		}
		if (trandur != 0) {
			pDphsettar->delnote /= trandur;
		}
		/*	  ELSE INSTANTANEOUS JUMP, was  8-frame (50 ms) transition */
		/*	  OUT	    else {
		pDphsettar->delnote = pDphsettar->delnote >> 1;
		}
		END OUT */
	}
	pDphsettar->delcum = 0;
	pDphsettar->f0start = pDph_t->f0;
}

/* ******************************************************************
 *      Function Name: set_tglst()
 *
 *      Description: 
 *
 *      Arguments:	PDPH_T pDph_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void set_tglst(PDPH_T pDph_t)
{
	PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;
	
	if (pDphsettar->nframg >= pDphsettar->segdrg) {
		pDphsettar->nframg -= pDphsettar->segdrg;
		pDphsettar->segdrg = pDph_t->allodurs[++pDphsettar->npg];
		/*        Cancel glottal stop gesture that occurred at last phone onset */
		if (pDphsettar->tglstp == 0)    
			pDphsettar->tglstp = -200;
		/*        Start second half of glottal stop gesture */
		if (pDphsettar->tglstp > 0) 
		{
			pDphsettar->tglstp = 0;
		}
		
		/*        Insert glottal stop after cur seg */
		/*         if next segment a vowel? */
		/*         and is next segment in first syllable? */
		/*         and is current segment in word-final rime? */
		/*         and is next segment not the diphthong /YU/? */
		pDphsettar->tglstn = -200;
		//new rule 8/14/01 don't do it with a functor
		//8/15/01 too broad narrow it to a and an...
		//n
		if(pDph_t->allofeats[pDphsettar->npg-1] & F_FUNC )
		{
			//an
			if(pDph_t->allophons[pDphsettar->npg] == USP_N
				&& pDph_t->allophons[pDphsettar->npg-1] == USP_EH
				&& (pDph_t->allofeats[pDphsettar->npg-1] & FBOUNDARY) >= FWBNEXT)
						return;
			//a 
			if(pDph_t->allophons[pDphsettar->npg] == USP_AX
				&& (pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FWBNEXT)
						return;

		}
		if (((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg+1]) & FVOWEL) IS_PLUS)
			&& ((pDph_t->allofeats[pDphsettar->npg+1] & (FMEDIALSYL & FFINALSYL)) IS_MINUS)
			&& ((pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FWBNEXT)
			&& (pDph_t->allophons[pDphsettar->npg+1] != USP_YU)) {
			/*	      If cur seg is vowel, don't do it unless vowel ident, or pbound */
			if ((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg]) & FSYLL) IS_PLUS) {
				if (((pDph_t->allophons[pDphsettar->npg] == pDph_t->allophons[pDphsettar->npg+1])
					&& ((pDph_t->allofeats[pDphsettar->npg+1] & FSTRESS_1) IS_PLUS) )
					|| ((pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FVPNEXT)) {
					pDphsettar->tglstn = pDphsettar->segdrg;
				}
			}
			/*	      If  next segment primary stressed, */
			/*	      and if curr seg a consonant other than a plosive, do it */
			//eab helpme imdying
			//need new method getting into trouble
			else if ( ((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg]) & FPLOSV) IS_MINUS)
				&& (pDph_t->allophons[pDphsettar->npg] != USP_DX)
				&& ((pDph_t->allofeats[pDphsettar->npg+1] & FSTRESS_1) IS_PLUS) ) {
				//pDphsettar->tglstn = pDphsettar->segdrg;
			}
		}
		/*        And at beginning and end of glottalized segs TQ and Q */
        //    if ((pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[pDph_t->allophons[pDphsettar->npg+1]].place & FGLOTTAL) IS_PLUS) {
		//      pDphsettar->tglstn = pDphsettar->segdrg;
		
		//}
		//if ((pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[pDph_t->allophons[pDphsettar->npg]].place & FGLOTTAL) IS_PLUS) 
		//{
		//  pDphsettar->tglstn = pDphsettar->segdrg;
		//}
		//wrong! fix later
		if((pDphsettar->npg + 1 <= pDph_t->nallotot) &&
			(place(pDph_t->allophons[pDphsettar->npg + 1] ) & FGLOTTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}
		
		if ((place(pDph_t->allophons[pDphsettar->npg]) & FGLOTTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}

	}
	
	/*    Wait until current gl stop gesture over before setting time of next one */
	else if ((pDphsettar->nframg == 8) || (pDphsettar->nframg == (pDphsettar->segdrg - 1))) 
	{
		pDphsettar->tglstp = pDphsettar->tglstn;
	}
}

/*******************************************************************
 *      Function Name: filter_commands()
 *
 *      Description: Filter-hat / Impulse-commands
 *
 *      Arguments:	PDPH_T pDph_t
 *					short f0in
 *
 *      Return Value: void
 *
 *      Comments:
 *
 ******************************************************************/

static void filter_commands(PDPH_T pDph_t,short f0in) 
{	/* Convert 'f0in' command to smoothed 'f0' */
	//short f0outa, f0outb, f0outc, f0outd, f0out1, f0out2;
	
	PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;
	
	/*    First pole (separate into 2 poles to min truncation errors) */
	//pDph_t->arg1 = pDphsettar->f0a1;
	//pDph_t->arg2 = f0in;
	//f0outa = mlsh1(pDphsettar->f0a1,f0in);
	//pDph_t->arg1 = pDphsettar->f0b;
	//pDph_t->arg2 = pDphsettar->f0las1;
	//f0outb = mlsh1(pDphsettar->f0b,pDphsettar->f0las1);
	//f0out1 = f0outa + f0outb;
	//pDphsettar->f0las1 = f0out1;
	/*    Second pole */
	//pDph_t->arg1 = pDphsettar->f0a2;
	//pDph_t->arg2 = f0out1;
	//f0outc = mlsh1(pDphsettar->f0a2,f0out1);
	//pDph_t->arg1 = pDphsettar->f0b;
	//pDph_t->arg2 = pDphsettar->f0las2;
	//f0outd = mlsh1(pDphsettar->f0b,pDphsettar->f0las2);
	//f0out2 = f0outc + f0outd;
	//pDphsettar->f0las2 = f0out2;
//	pDph_t->f0 = f0out2 >> F0SHFT;	/* Unscaled fundamental frequency	   */
		pDph_t->f0 += (f0in - pDph_t->f0 )>>2;
/* ****************** NOT USED *************************************/
#if 0
	//	printf(
	//"[%s] pDphsettar->tarbas=%4d pDphsettar->tarhat=%3d pDphsettar->tarimp=%3d tarsum=%4d\n",
	//        phprint(pDph_t->allophons[pDphsettar->npg]), pDphsettar->tarbas, pDphsettar->tarhat, pDphsettar->tarimp, f0in);
	
	/*    (Check for overloads if change filter tc or size of impulses) */
	WINprintf("f0in=%6d   a=%6d b=%6d 1=%6d c=%6d d=%6d 2=%6d\n",
		f0in, f0outa, f0outb, f0out1, f0outc, f0outd, f0out2);
#endif // 0
/* *****************************************************************/
}

/* ******************************************************************
 *      Function Name: filter_seg_commands()
 *
 *      Description: Filter-segmental - commands
 *
 *      Arguments:	PDPH_T pDph_t
 *					short f0in
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void filter_seg_commands(PDPH_T pDph_t, short f0in) 
{	/* Convert 'f0in' command to smoothed 'pDphsettar->f0s' 
	Input is realy tarseg comment about f0in is wrong*/
	
	short f0souta, f0soutb, f0soutc, f0soutd, f0sout1, f0sout2;
	PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;
	/*    First pole (separate into 2 poles to min truncation errors) */
	pDph_t->arg1 = pDphsettar->f0sa1;
	pDph_t->arg2 = pDphsettar->tarseg;
	f0souta = mlsh1(pDphsettar->f0sa1,pDphsettar->tarseg);
	pDph_t->arg1 = pDphsettar->f0sb;
	pDph_t->arg2 = pDphsettar->f0slas1;
	f0soutb = mlsh1(pDphsettar->f0sb,pDphsettar->f0slas1);
	f0sout1 = f0souta + f0soutb;
	pDphsettar->f0slas1 = f0sout1;
	/*    Second pole */
	pDph_t->arg1 = pDphsettar->f0sa2;
	pDph_t->arg2 = f0sout1 + (pDphsettar->tarseg1 << F0SHFT);	/* Use only one pole */
	f0soutc = mlsh1(pDphsettar->f0sa2,(f0sout1 + (pDphsettar->tarseg1 << F0SHFT)));
	pDph_t->arg1 = pDphsettar->f0sb;
	pDph_t->arg2 = pDphsettar->f0slas2;
	f0soutd = mlsh1(pDphsettar->f0sb,pDphsettar->f0slas2);
	f0sout2 = f0soutc + f0soutd;
	pDphsettar->f0slas2 = f0sout2;
	pDph_t->f0s = f0sout2 >> F0SHFT;  /* Unscaled fundamental frequency	   */
	
/* ******************* NOT USED ************************************/
#if 0
	WINprintf("[%s] pDphsettar->tarseg=%3d pDphsettar->tarseg1=%3d\n",
			  phprint(pDph_t->allophons[pDphsettar->npg]), pDphsettar->tarseg, pDphsettar->tarseg1);

	/*    (Check for overloads if change filter tc or size of impulses) */

	WINprintf("  a=%6d b=%6d 1=%6d c=%6d d=%6d 2=%6d  pDphsettar->f0s=%4d\n",
			  f0souta, f0soutb, f0sout1, f0soutc, f0soutd, f0sout2, pDphsettar->f0s);
#endif // 0
/* *****************************************************************/
}

/* ******************************************************************
 *
 * 
 *      Function Name: linear_interp()
 *
 *      Description: Sing-or-linear - Interp
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
static void linear_interp(PDPH_T pDph_t) 
{
	PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;
	pDphsettar->delcum += pDphsettar->delnote;
	pDph_t->f0 = pDphsettar->f0start + (pDphsettar->delcum >> 2);
#ifdef TOMBUCHLER
	pDphsettar->vibsw = 1;

#endif
	
	if (pDphsettar->delnote >= 0)
	{	/* Do not overshoot pDphsettar->newnote */
		if (pDph_t->f0 > pDphsettar->newnote) {
			pDph_t->f0 = pDphsettar->newnote;
			pDphsettar->f0start = pDphsettar->newnote;
			pDphsettar->delcum = 0;
			pDphsettar->delnote = 0;
		}
	}
	else
	{
		if (pDph_t->f0 < pDphsettar->newnote)
		{
			pDph_t->f0 = pDphsettar->newnote;
			pDphsettar->f0start = pDphsettar->newnote;
			pDphsettar->delcum = 0;
			pDphsettar->delnote = 0;
		}
	}
	pDph_t->f0prime = pDph_t->f0;	/* To be scaled by spdef */
	
	if (pDphsettar->vibsw == 1) 
	{	/* Singing */
		/*	  Add vibratto of 6.2 Hz (25 frames/cycle), +/- 2.05 Hz ampl. */
		pDphsettar->timecosvib += 165;
		if (pDphsettar->timecosvib > TWOPI)    
			pDphsettar->timecosvib -= TWOPI;
		pDph_t->f0prime += getcosine[pDphsettar->timecosvib>>6] >> 3;
	}
}
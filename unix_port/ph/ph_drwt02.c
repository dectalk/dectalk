/*			    P H D R A W T 0 . C				*/
/* Copyright	1988,				by Dennis H. Klatt	*/
/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995,. All rights reserved.
 * Copyright    1984                by Dennis H. Klatt
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
 *    File Name:    phdrawt0.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    Extend f0 contour to obtain next value for period T0
 *      (low-pass filter a set of step and impulse commands)
 *
 ***********************************************************************
 *    Revision History:
 * 0001  1-Dec-84 DK    Initial creation
 * 0002 27-Dec-84 DGC   Modify for 80186
 * 0003  3-Jan-85 DK    Fix handling of user f0 input commands
 * 0004 16-Jan-85 DK    Investigate desirability of adding rand var to target
 * 0005 29-Jan-85 DK    Cause AV to go down during glottal stop gesture
 * 0006 11-Feb-85 DK    Reduce random waver in f0
 * 0007  1-Mar-85 DK    Move scale_str_rise to PHINTON.C where it belongs
 * 0008 19-Mar-85 DK    Make segmental f0 gestures fast
 * 0009 17-Apr-85 DK    Segmental effects: only voiceless C fast, -stress less,
 *           effect larger at beginning of V than at end.
 * 0010 13-May-85 DK    Make getcosine() into a table, cos[0] = 1.0 = 164
 * 0011 17-May-85 DK    Reduce frequencies of cosine pseudojitter
 * 0012  8-Aug-85 DK    Fix linear_interp() bug, overshoot of singing targets
 * 0013 25-Mar-96 MGS	Merged WIN 95 Code with 42c
 * 0014 01-Apr-96 MGS	Made sure all local varialbes were being initialized.
 */


/*
 * Edit history
 * 0001  1-Dec-84 DK	Initial creation
 * 0002 31-Aug-85 DK	DECtalk 3.0 frozen
 * 0003 23-May-86 DK	Random fluctuations in f0 are too fast, amount of
			 fluctuation should be a speaker def parameter
 * 0004 19-Sep-86 DK	Make stress impulse more like a rising ramp
 * 0005 13-Jan-87 DK	New f0mode option: TIME_VALUE_SPECIFIED {time,value}
 * 0006 11-Mar-87 DK	Fix bugs in TIME_VALUE_SPECIFIED
 * 0007 24-Mar-88 DK	Use separate filter for segmental effects
 * 0008	10-jul-96    EAB New code major changes preparinf for re-write
 * 0009  7-aug-96	eab Modifying code to allow for newbasline tmeplate.
 *	
 * 0010  03/30/97		EAB Merging in French and AD code the merge was simpler
 *			`			by merging the production file into the AD file so for 
 *						more history see previous versions of the file. 
 * 0011  04/11/97 EAB	Found that some variables (cos functions) were getting initialized at the wrong time 
 *						feating their function.
 * 
 #ifdef GERMAN
 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 * 0013 BNK 	07/29/2986	    preliminary adaption for german phonemes
 * 0014 BNK		01/15/1987	    implementation of german sentence intonation
 * 0015 BNK		07/26/1987      change DECtalk-1 shift-operations for DECtalk-3
 * 0016 CJL		03/30/1995	    File was phdrawt0.c. Is now gphdrawt0.c. Changed
 *                      		phdefs.h->gphdefs.h
 * 0017 JDB 	09/21/1995	    removed some QQ* terms from test conditions
 * 0018 EAb		04/07/1996      Modified FASFIL and ramp time to reduce speed of
 *                              gestures. Perceptual we wnat to re-write code to
 *                              allow for nmore gestures
Later edit history of old ph_drwt0.c
 * 0013 MGS		03/25/1996	   	Merged WIN 95 Code with 42c
 * 0014 MGS		04/01/1996	   	Made sure all local varialbes were being initialized.
 * 0015	MGS		06/03/1996		Merged Spanish with English
 * 0016	MGS		06/06/1996	 	Changed file name from phdrawt0.c to ph_drwt0.c 
 * 0017 SIK		07/12/1996  	Cleaning up and maintenance
 * 0018 GL		09/10/1996		Add printf("\n") for WIN95 dologphone()
 * 0019 GL		09/10/1996		Add debug switch to dump phone logging.
 * 0020 EDB		01/10/1997		Fix many data. simplify the Spanish code.
 * 0021  EAB		7/8/97			More tuning of merged vocal tract.
 *
	End old comments

 *	0021 EAB    04/02/97		Merged to support both French and 5.0 merges
								Added new variables also need to update phinton.c because these
								are partner files. Chnages too numerous to iterate because this version
								is architectually different from the old. Consider it a new file.
 *	0022 EAB	04/04/97		EAB Removed new_sentence from german it existed but did nothing
 *  0023 EAB    04/14/97		Moved functional ifdef NEWBASELINE to phdefs because it wil encompass
 *								chnages to more than just ph_inton.
 *  0024 KSB             05/20/1997      Moved f0 and place to gl_phones
 *  0025 EAB	9/8/97			Merged into RND for NOAA and possibly KURZ forget about diffing
 *  0026 EAB/CJL         11/07/97       Female NWSNOAA & GRAPHF0 code. Instead of adding all the peices
								toegther and then scaling the entire mess. I broke the f0 code into it's 
								constiuent pieces and added at the end. This is both for the US and for NOAA.
								This makes it possible to have diferent parts scale differently in the female
								(and male) voices. ALso he base DC level the baseline was also sent through the low
								pass filter. It agains reduces flexibility and their is no reason to do this.

 *	0027  EAB      11/11/97		Since the code issue is very sensitive I have added a MALFEM switch so that you get
								EXactly the OLD code if it's a male voice and the new code I need for the female voice
								Acutally this may be good for a while to try to improve the female voice weithout worrying
								about breaking the amle voice.
 *	0028  EAB		11/22/97	Remove glotalization from UK_ENGLISH per Caroline.
 *  0029  EAB		11/24/97	Remove creek from male voice only per noaa/carl
 *  0030  EAB		01/10/98	Added length parameter to code (glide command first to use
 *  0031  EAB		01/21/98	Added the glide command which cause a pitch rise or fall that occurs over the length
 *								of the phoneme linearly and then remains at the level reached
 *	0032  EAB		01/21/98	Added baseline profile per caroline as well as disabled unsed UK commands 
								by adding a break;
 *	0033  EAB		02./16/98	Removing old garbage (get_cos routine, experminental code ifdef newbase, unifying into one source structure, 
								and separating out gestures by sex(or voice later don't touch nwsnoaa)
 *  0034  EAB		04/6/98		Oliver made me do it....I tuned the German intonation, in general he feels if should be quite flat so we're
								adding things trying to make it more natural and "alive" without overdoing it....
	0035  EAB		04/27/98	Many tuning changes for German and new version of languages, since this code is enabled by NEW_INTONATION
								which presently is only valid for German I didn't ifdef out the new stuff because it will be pervasive
								and I've already started tuning American English This file should be viewed conceptually as a new
								replaement for ph_drwt01.c being first submitted now for German 
 */

 
 
/* This is now the normal defalut code when re-write completed NWSNOAA has been saved plus oldcode for now*/
/* eab 2/16/98 */ 

/*    Extend f0 contour one frame to obtain next value for period T0	 */
/*      (low-pass filter a set of step and impulse commands)		 */

/* f0mode:
 *
 *  1  NORMAL
 *		pDph_t->f0tar[] contains step (f0 even), impulse (f0 odd), and baseline
 *		 reset (f0=0) commands created by rules.
 *		pDph_t->f0tim[] contains incremental time in frames since last command.
 *		A slow psuedo-random variation is added to f0 so as to prevent
 *		 an interval of constant f0.  Any glottal stop gestures are
 *		 added in at the end. 
 *		NEW STUFF-Note we occasionally want a few frames at near constant f0 to give
 *			a soft tonal quality to a voice esp female eab 96
 *
 *  2  HAT_LOCATIONS_SPECIFIED
 *		User specified location of hatrise/fall.  Same as NORMAL as
 *		 far as this module is concerned.
 *
 *  3  HAT_F0_SIZES_SPECIFIED
 *		User attached steps and impulses to hatrise, hatfall,
 *		 and stress phones.  Same as NORMAL as far as this module
 *		 is concerned.
 *
 *  4  SINGING
 *		pDph_t->f0tar[] contains note requests [1 - 37], offset by 2000, that
 *		 have been selected by user <time,f0> requests attached to
 *		 selected phonemes, usually vowels, usually one per syllable.
 *		pDph_t->f0tim[] contains incremental time in frames since last note.
 *		Movement to a new note begins at start of segment and takes
 *		 100 ms.  A 6 Hz vibratto of magnitude +/- 2 Hz is added to f0.
 *
 *
 *  5  PHONE_TARGETS_SPECIFIED
 *		pDph_t->f0tar[] contains f0 requests in Hz that have been selected
 *		 by user <dur,f0> requests attached to selected phonemes,
 *		 in which case f0 ramps linearly from previous value to pDph_t->f0tar[]
 *		 over the duration of the phoneme.
 *		pDph_t->f0tim[] contains incremental time in frames since last command.
 *		A slow psuedo-random variation is imposed on f0 to prevent
 *		 an interval of constant f0.
 *
 *  6  TIME_VALUE_SPECIFIED
 *		pDph_t->f0tar[] contains f0 requests in Hz that have been selected
 *		 by user {time,f0} requests, in which case f0 ramps linearly
 *		 from previous value to pDph_t->f0tar[] over the time interval since
 *		 the last {time,f0} command.
 *		pDph_t->f0tim[] contains incremental time in frames since last command.
 *		A slow psuedo-random variation is imposed on f0 to prevent
 *		 an interval of constant f0.Bats 349
 */


#include "ph_def.h"
#define ENDDROP
#define CREEKMALE
#define TWOPI	4096			/* For getcosine() function below */
#define PI	2048
#define PIOVER2	1024
#define ONE	(PIOVER2*PIOVER2)
 //#define GRAPHF0
/*#define DEBUGF0*/
/* #define DEBUG_USER_PROSODICS */

#define HIGHEST_F0	  5121	/*  Maximum F0 in Hz*10	*/
#define LOWEST_F0	   500	/*  Minimum F0 in Hz*10	*/
#define F_SEG_LOWPASS	  3000	/* Nominal cutoff freq of 1-pole low-pass    */
#define DELAY_SEG_LOWPASS    3	/* Delay in frames to half-way of step resp. */
#define F0SHFT		     3	/* Shift to avoid roundoff errors in	     */
				/*   filtering f0 commands		     */

/*    External constants from PHROM.C */
										/* extern short f0glstp[]; *//* F0 dip for a glottal stop */
	// eab 2/17/98 No longer used extern short            f0segtars[];   /* Array of segmental influences */
	extern short             place[];	/* Feature values for phonemes */
	extern short featb[];		/* Feature values for phonemes */
	extern short notetab[];		/* f0 target for notes C2-C5 (1-37) */
	extern short getcosine[];	/* Cos tab for jitter and/or vibratto */
	extern short randnum();


	
	/* MVP : static function declarations*/
static void set_user_target(PDPH_T pDph_t,short *psF0command); 
static void filter_commands(PDPH_T pDph_t,short f0in); 
static void filter_seg_commands(PDPH_T pDph_t,short f0in);
static void linear_interp(PDPH_T pDph_t); 
static void set_tglst(PDPH_T pDph_t);



#ifdef Hand_tune /*swan.txt The next two arrays are for eperimentation and should not be include in a production build
	the ifdef;s should not be defined.*/
	int of0array[]={400,400,400,400,400,400,400,200,200,200,
				200,200,200,400,200,200,200,200,174,174,/*start ov voicing*/
				174,178,174,174,174,174,174,174,174,174,
				174,174,174,174,174,174,174,174,174,174,
				174,175,174,174,174,174,174,174,174,174,
				174,174,174,174,174,174,174,174,174,174,
				174,174,174,174,174,174,174,165,165,165,/*end of vowel*/
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				165,165,165,165,165,165,165,165,165,165,
				200,200,200,200,200,200,200,200,200,200,
				200,200,200,200,200,200,200,200,200,200,
				200,200,200,200,200,200,200,200,200,200,
				200,200,200,200,200,200,200,200,200,200,
				200,200,200,200,200,200,200,200,200,200,
				200,200,200,200,200,200,200,200,200,200};
#endif
//#define TALK
#ifdef TALK /* to hnad nodify talk.txt*/
		int of0array[]={

				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,356,356,/*start ov voicing*/
				356,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				155,155,155,155,155,154,154,154,154,154,
				153,153,153,153,152,152,152,152,151,151,
				151,156,156,156,156,156,156,156,156,156,/*end of vowel*/
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,156,156,156,
				156,156,156,156,156,156,156,200,200,200,
				200,200,200,200,200,200,200,200,200,200,
				200,200,200,200,200,200,200,200,200,200};
#endif 			

			int	oarcnt=0;

#ifdef ENGLISH_UK
short                   f0msegtars[] =
{

	  /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
	     50,  100,   60,   40,   20,   0,    0,    0,    0,    20,

	  /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
	      0,   30,   50,   60,   100,  50,  100, 30, 60, 100,

	  /* ER    AR    OR    UR     W     Y     R     L    HX    OH   */
	     60,    0,   30,   80,   60,   60,    0,    0,   200,  0,

	  /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
	      0,   -50,  -50,  -50,  0, -50, -50, 300, -50, 300,

	  /* DH     S     Z    SH    ZH     P     B     T     D     K   */
	-50, 300, -50, 300, -50, 300, -50, 300, -50, 300,

	  /* G    YR    TQ     Q    CH    JH  DF                         */
	-50, -10, 30, 0, 300, -50, -10
};
short                   f0fsegtars[] =
{

	  /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
	     50,  100,   60,   40,   20,   0,    0,    0,    0,    20,

	  /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
	      0,   30,   50,   60,   100,  50,  100, 30, 60, 100,

	  /* ER    AR    OR    UR     W     Y     R     L    HX    OH   */
	     60,    0,   30,   80,   60,   60,    0,    0,   200,  0,

	  /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
	      0,   -50,  -50,  -50,  0, -50, -50, 300, -50, 300,

	  /* DH     S     Z    SH    ZH     P     B     T     D     K   */
	    -50, 300, -50, 300, -50, 300, -50, 300, -50, 300,

	  /* G    YR    TQ     Q    CH    JH  DF                         */
	    -50, -10, 30, 0, 300, -50, -10
};

#endif

#ifdef SPANISH
	
short f0msegtars[TOT_ALLOPHONES] =
{
	  /* E_SI   E_A   E_E   E_I   E_O   E_U E_WX  E_YX               */
		30,		0,	 150,	200, 30,   60, -50 , -50,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH  */
	-50, -50, -50 + 20, -50 + 20, -80 , -50 , 300 , 300, 300, 300 ,

	  /* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T   E_D   E_K   E_G  */
		-50,	-50, -50,	-50, 300 , -50, 300, -50, 300 , -50,

	  /* E_CH   E_Y   E_R   E_Q                                      */
		  300 , -50, -50, 0,

	  /* E_Z   E_W  E_NX  E_V   E_IX  E_MX  E_PH                     */
	-50, -50, -50, -50, 0, -50, 300 - 150
};

	
short f0fsegtars[TOT_ALLOPHONES] =
{
	  /* E_SI   E_A   E_E   E_I   E_O   E_U E_WX  E_YX               */
		30,		0,	 150,	200, 30,   60, -50 , -50,

	  /* E_RR   E_L  E_LL   E_M   E_N  E_NH   E_F   E_S   E_J  E_TH  */
	-50, -50, -50 + 20, -50 + 20, -80 , -50 , 300 , 300, 300, 300 ,

	  /* E_BH  E_DH  E_GH  E_YH   E_P		 E_B   E_T   E_D   E_K   E_G  */
		-50,	-50, -50,	-50, 300 , -50, 300, -50, 300 , -50,

	  /* E_CH   E_Y   E_R   E_Q                                      */
		  300 , -50, -50, 0,



	  /* E_Z   E_W  E_NX  E_V   E_IX  E_MX  E_PH                     */
	-50, -50, -50, -50, 0, -50, 300 - 150
};


#endif

#ifdef GERMAN
/*    Incremental changes to F0 caused by segmental influences */

short f0msegtars[] = {


      /* SIL     A     E    AE    EX     I     O    OE     U    UE	*/
      	  50,    10,   10,     10,    10,   95,   30,   95,   20,   100,
      /* AH    EH   AZ    IH    OH   OZ    UH   UZ    EI    AU	*/
     	 20,   20,   60,  60,   80,  80,   60,  40,   100,   30,
      /* EU    AN    IM    UM    ON     J     L    RR     R     H	*/
      	 60,   10,   30,   30,   60,   60,    -10,    -10,  -10,    0,
      /* M     N    NG    EL    EM    EN     F     V     S     Z	*/
        -50,  -50,  -50,   0,  -50,  -50,  300,  -50,    50,   50,
      /* SH    ZH    CH    KH     P     B     T     D     K     G	*/
        300,  -50,  300,  300,  300,  -50,  300,  -30,  300,  -50,
      /* Q    PF    TS    DJ    TJ    KS				*/
       -50,    0,    0,    0,    0,    0
      };
/*    Incremental changes to F0 caused by segmental influences */

short f0fsegtars[] = {


	   /* SIL     A     E    AE    EX     I     O    OE     U    UE	*/
      	  70,    15,   15,     15,    10,   70,   45,   70,   26,   100,
      /* AH    EH   AZ    IH    OH   OZ    UH   UZ    EI    AU	*/
     	 26,   26,   60,  60,   80,   80,  60,  40,   80,   45,
      /* EU    AN    IM    UM    ON     J     L    RR     R     H	*/
      	60,   10,   45,   45,   60,   60,    -15,    -15,  -15,    0,
      /* M     N    NG    EL    EM    EN     F     V     S     Z	*/
        -70,  -70,  -70,   0,  -70,  -70,  400,  -70,  -70,  -70,
      /* SH    ZH    CH    KH     P     B     T     D     K     G	*/
        400,  -70,  400,  400,  400,  -70,  400,  -70,  400,  -70,
      /* Q    PF    TS    DJ    TJ    KS				*/
      -70,    0,    0,    0,    0,    0

      };


#endif


#ifdef ENGLISH_US

/* Incremental changes to F0 caused by segmental influences */

short                   f0msegtars[] =
{

	  /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
	50, 100, 60, 40, 20, 0, 0, 0, 0, 20,

	  /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
	0, 30, 50, 60, 100, 50, 100, 30, 60, 100,

	  /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
	60, 0, 30, 80, 60, 60, 0, 0, 200, 0,

	  /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
	0, -50, -50, -50, 0, -50, -50, 300, -50, 300,

	  /* DH     S     Z    SH    ZH     P     B     T     D     K   */
	-50, 300, -50, 300, -50, 300, -50, 300, -50, 300,

	  /* G    DX    TQ     Q    CH    JH  DF                         */
	-50, -10, 0, 0, 300, -50, -10
};

/* Incremental changes to F0 caused by segmental influences */

short                   f0fsegtars[] =
{

	  /* SI    IY    IH    EY    EH    AE    AA    AY    AW    AH   */
	50, 100, 60, 40, 20, 0, 0, 0, 0, 20,

	  /* AO    OW    OY    UH    UW    RR    YU    AX    IX    IR   */
	0, 30, 50, 60, 100, 50, 100, 30, 60, 100,

	  /* ER    AR    OR    UR     W     Y     R     L    HX    RX   */
	60, 0, 30, 80, 60, 60, 0, 0, 200, 0,

	  /* LX     M     N    NG    EL    D$    EN     F     V    TH   */
	0, -50, -50, -50, 0, -50, -50, 300, -50, 300,

	  /* DH     S     Z    SH    ZH     P     B     T     D     K   */
	-50, 300, -50, 300, -50, 300, -50, 300, -50, 300,

	  /* G    DX    TQ     Q    CH    JH  DF                         */
	-50, -10, 0, 0, 300, -50, -10
};


#endif




void pht0draw(LPTTS_HANDLE_T phTTS) 
{


/*    Automatic variables */
    
#ifdef GRAPHF0
	int icnt;
	char prntbuf[120];
#endif
int temp,dtglst,pseudojitter;	
	PKSD_T pKsd_t;
	PDPH_T pDph_t;
    PDPHSETTAR_ST pDphsettar;
	short f0seg=0,f0in=0;

	pKsd_t = phTTS->pKernelShareData;
	pDph_t = phTTS->pPHThreadData;
   pDphsettar = pDph_t->pSTphsettar;
 /* Initialize , GL  6/11/1996*/
 /* this code is re-entrant and these variables must only be re-initialized at a hard or soft init*/

 /*pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0;*/
   


	if (pDph_t->malfem == MALE)
		{	
/*    Initialize */
	  if (pDph_t->nf0ev <= -2) 
	{



		/* Hard initialization */
		/* for now hardcode baseline for init experimentation eab 8/96*/
		/* eab BUG- found problem with f0command, it needs to be a global variable
		or it sometimes doesn't get handled correctly*/
		pDph_t->clausepos=0;
		pDphsettar->phocur = SIL;
#ifdef GERMAN
		


			/* DECLARATIVE*/

		pDph_t->f0basetypes[0][0]=1155;
		pDph_t->f0basetypes[0][1]=1145;
		pDph_t->f0basetypes[0][2]=1139;
		pDph_t->f0basetypes[0][3]=1127;
		pDph_t->f0basetypes[0][4]=1113;
		pDph_t->f0basetypes[0][5]=1109;
		pDph_t->f0basetypes[0][6]=1095;
		pDph_t->f0basetypes[0][7]=1082;
		pDph_t->f0basetypes[0][8]=1079;
		pDph_t->f0basetypes[0][9]=1065;
		pDph_t->f0basetypes[0][10]=1023;
		pDph_t->f0basetypes[0][11]=1011;
		pDph_t->f0basetypes[0][12]=999;
		pDph_t->f0basetypes[0][13]=987;
		pDph_t->f0basetypes[0][14]=985;
		pDph_t->f0basetypes[0][15]=984;
		pDph_t->f0basetypes[0][16]=982;
			;

		/*eab  less drop for short phrases*/
	
			pDph_t->f0basetypes[4][0]=1160;
			pDph_t->f0basetypes[4][1]=1150;
			pDph_t->f0basetypes[4][2]=1150;
			pDph_t->f0basetypes[4][3]=1152;
			pDph_t->f0basetypes[4][4]=1132;
			pDph_t->f0basetypes[4][5]=1120;
			pDph_t->f0basetypes[4][6]=1100;
			pDph_t->f0basetypes[4][7]=1104;
			pDph_t->f0basetypes[4][8]=1100;
			pDph_t->f0basetypes[4][9]=1080;
			pDph_t->f0basetypes[4][10]=1070;
			pDph_t->f0basetypes[4][11]=1060;
			pDph_t->f0basetypes[4][12]=1050;
			pDph_t->f0basetypes[4][13]=1040;
			pDph_t->f0basetypes[4][14]=1030;
			pDph_t->f0basetypes[4][15]=1000;
			pDph_t->f0basetypes[4][16]=1000;

			/* comma*/
		pDph_t->f0basetypes[1][0]=1157;
		pDph_t->f0basetypes[1][1]=1145;
		pDph_t->f0basetypes[1][2]=1139;
		pDph_t->f0basetypes[1][3]=1127;
		pDph_t->f0basetypes[1][4]=1113;
		pDph_t->f0basetypes[1][5]=1109;
		pDph_t->f0basetypes[1][6]=1085;
		pDph_t->f0basetypes[1][7]=1062;
		pDph_t->f0basetypes[1][8]=1049;
		pDph_t->f0basetypes[1][9]=1035;
		pDph_t->f0basetypes[1][10]=1043;
		pDph_t->f0basetypes[1][11]=1045;
		pDph_t->f0basetypes[1][12]=1095;
		pDph_t->f0basetypes[1][13]=1140;
		pDph_t->f0basetypes[1][14]=1217;
		pDph_t->f0basetypes[1][15]=1254;

		/*exclamation*/
		pDph_t->f0basetypes[2][0]=1157+80;
		pDph_t->f0basetypes[2][1]=1145+80;
		pDph_t->f0basetypes[2][2]=1139+80;
		pDph_t->f0basetypes[2][3]=1127+80;
		pDph_t->f0basetypes[2][4]=1113+80;
		pDph_t->f0basetypes[2][5]=1109+80;
		pDph_t->f0basetypes[2][6]=1095+80;
		pDph_t->f0basetypes[2][7]=1082+80;
		pDph_t->f0basetypes[2][8]=1079+80;
		pDph_t->f0basetypes[2][9]=1065+80;
		pDph_t->f0basetypes[2][10]=1053+80;
		pDph_t->f0basetypes[2][11]=1040+80;
		pDph_t->f0basetypes[2][12]=1038+80;
		pDph_t->f0basetypes[2][13]=1024+80;
		pDph_t->f0basetypes[2][14]=980+70;
		pDph_t->f0basetypes[2][15]=952+60;
		pDph_t->f0basetypes[2][16]=943+40;

					/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
		pDph_t->f0basetypes[3][0]=1187;
		pDph_t->f0basetypes[3][1]=1165;
		pDph_t->f0basetypes[3][2]=1139;
		pDph_t->f0basetypes[3][3]=1127;
		pDph_t->f0basetypes[3][4]=1113;
		pDph_t->f0basetypes[3][5]=1109;
		pDph_t->f0basetypes[3][6]=1095;
		pDph_t->f0basetypes[3][7]=1082;
		pDph_t->f0basetypes[3][8]=1079;
		pDph_t->f0basetypes[3][9]=1065;
		pDph_t->f0basetypes[3][10]=1053;
		pDph_t->f0basetypes[3][11]=940;
		pDph_t->f0basetypes[3][12]=938;
		pDph_t->f0basetypes[3][13]=924;
		pDph_t->f0basetypes[3][14]=1010;
		pDph_t->f0basetypes[3][15]=1014;
		pDph_t->f0basetypes[3][16]=1018;

#endif

		
	


#ifdef ENGLISH_US



/* DECLARATIVE*/

		pDph_t->f0basetypes[0][0]=1157;
		pDph_t->f0basetypes[0][1]=1145;
		pDph_t->f0basetypes[0][2]=1139;
		pDph_t->f0basetypes[0][3]=1127;
		pDph_t->f0basetypes[0][4]=1113;
		pDph_t->f0basetypes[0][5]=1109;
		pDph_t->f0basetypes[0][6]=1095;
		pDph_t->f0basetypes[0][7]=1082;
		pDph_t->f0basetypes[0][8]=1079;
		pDph_t->f0basetypes[0][9]=1065;
		pDph_t->f0basetypes[0][10]=1053;
		pDph_t->f0basetypes[0][11]=1040;
		pDph_t->f0basetypes[0][12]=1038;
		pDph_t->f0basetypes[0][13]=1024;
		pDph_t->f0basetypes[0][14]=980;
		pDph_t->f0basetypes[0][15]=952;
		pDph_t->f0basetypes[0][16]=943;

		/*eab  less drop for short phrases*/
	
			pDph_t->f0basetypes[4][0]=1160;
			pDph_t->f0basetypes[4][1]=1150;
			pDph_t->f0basetypes[4][2]=1150;
			pDph_t->f0basetypes[4][3]=1152;
			pDph_t->f0basetypes[4][4]=1132;
			pDph_t->f0basetypes[4][5]=1120;
			pDph_t->f0basetypes[4][6]=1100;
			pDph_t->f0basetypes[4][7]=1104;
			pDph_t->f0basetypes[4][8]=1100;
			pDph_t->f0basetypes[4][9]=1080;
			pDph_t->f0basetypes[4][10]=1070;
			pDph_t->f0basetypes[4][11]=1060;
			pDph_t->f0basetypes[4][12]=1050;
			pDph_t->f0basetypes[4][13]=1040;
			pDph_t->f0basetypes[4][14]=1030;
			pDph_t->f0basetypes[4][15]=1000;
			pDph_t->f0basetypes[4][16]=1000;

			/* comma*/
		pDph_t->f0basetypes[1][0]=1157;
		pDph_t->f0basetypes[1][1]=1145;
		pDph_t->f0basetypes[1][2]=1139;
		pDph_t->f0basetypes[1][3]=1127;
		pDph_t->f0basetypes[1][4]=1113;
		pDph_t->f0basetypes[1][5]=1109;
		pDph_t->f0basetypes[1][6]=1085;
		pDph_t->f0basetypes[1][7]=1062;
		pDph_t->f0basetypes[1][8]=1049;
		pDph_t->f0basetypes[1][9]=1035;
		pDph_t->f0basetypes[1][10]=1043;
		pDph_t->f0basetypes[1][11]=1045;
		pDph_t->f0basetypes[1][12]=1035;
		pDph_t->f0basetypes[1][13]=1040;
		pDph_t->f0basetypes[1][14]=1057;
		pDph_t->f0basetypes[1][15]=1064;

		/*exclamation*/
		pDph_t->f0basetypes[2][0]=1157+80;
		pDph_t->f0basetypes[2][1]=1145+80;
		pDph_t->f0basetypes[2][2]=1139+80;
		pDph_t->f0basetypes[2][3]=1127+80;
		pDph_t->f0basetypes[2][4]=1113+80;
		pDph_t->f0basetypes[2][5]=1109+80;
		pDph_t->f0basetypes[2][6]=1095+80;
		pDph_t->f0basetypes[2][7]=1082+80;
		pDph_t->f0basetypes[2][8]=1079+80;
		pDph_t->f0basetypes[2][9]=1065+80;
		pDph_t->f0basetypes[2][10]=1053+80;
		pDph_t->f0basetypes[2][11]=1040+80;
		pDph_t->f0basetypes[2][12]=1038+80;
		pDph_t->f0basetypes[2][13]=1024+80;
		pDph_t->f0basetypes[2][14]=980+70;
		pDph_t->f0basetypes[2][15]=952+60;
		pDph_t->f0basetypes[2][16]=943+40;

					/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
		pDph_t->f0basetypes[3][0]=1187;
		pDph_t->f0basetypes[3][1]=1165;
		pDph_t->f0basetypes[3][2]=1139;
		pDph_t->f0basetypes[3][3]=1127;
		pDph_t->f0basetypes[3][4]=1113;
		pDph_t->f0basetypes[3][5]=1109;
		pDph_t->f0basetypes[3][6]=1095;
		pDph_t->f0basetypes[3][7]=1082;
		pDph_t->f0basetypes[3][8]=1079;
		pDph_t->f0basetypes[3][9]=1065;
		pDph_t->f0basetypes[3][10]=1053;
		pDph_t->f0basetypes[3][11]=940;
		pDph_t->f0basetypes[3][12]=938;
		pDph_t->f0basetypes[3][13]=924;
		pDph_t->f0basetypes[3][14]=1010;
		pDph_t->f0basetypes[3][15]=1014;
		pDph_t->f0basetypes[3][16]=1018;


#ifdef OLDER		
/* DECLARATIVE*/

		pDph_t->f0basetypes[0][0]=1157;
		pDph_t->f0basetypes[0][1]=1145;
		pDph_t->f0basetypes[0][2]=1139;
		pDph_t->f0basetypes[0][3]=1127;
		pDph_t->f0basetypes[0][4]=1113;
		pDph_t->f0basetypes[0][5]=1109;
		pDph_t->f0basetypes[0][6]=1095;
		pDph_t->f0basetypes[0][7]=1082;
		pDph_t->f0basetypes[0][8]=1079;
		pDph_t->f0basetypes[0][9]=1065;
		pDph_t->f0basetypes[0][10]=1053;
		pDph_t->f0basetypes[0][11]=1040;
		pDph_t->f0basetypes[0][12]=1038;
		pDph_t->f0basetypes[0][13]=1024;
		pDph_t->f0basetypes[0][14]=980;
		pDph_t->f0basetypes[0][15]=952;
		pDph_t->f0basetypes[0][16]=943;

		/*eab  less drop for short phrases*/
	
			pDph_t->f0basetypes[4][0]=1160;
			pDph_t->f0basetypes[4][1]=1150;
			pDph_t->f0basetypes[4][2]=1150;
			pDph_t->f0basetypes[4][3]=1152;
			pDph_t->f0basetypes[4][4]=1132;
			pDph_t->f0basetypes[4][5]=1120;
			pDph_t->f0basetypes[4][6]=1100;
			pDph_t->f0basetypes[4][7]=1104;
			pDph_t->f0basetypes[4][8]=1100;
			pDph_t->f0basetypes[4][9]=1080;
			pDph_t->f0basetypes[4][10]=1070;
			pDph_t->f0basetypes[4][11]=1060;
			pDph_t->f0basetypes[4][12]=1050;
			pDph_t->f0basetypes[4][13]=1040;
			pDph_t->f0basetypes[4][14]=1030;
			pDph_t->f0basetypes[4][15]=1000;
			pDph_t->f0basetypes[4][16]=1000;

			/* comma*/
		pDph_t->f0basetypes[1][0]=1157;
		pDph_t->f0basetypes[1][1]=1145;
		pDph_t->f0basetypes[1][2]=1139;
		pDph_t->f0basetypes[1][3]=1127;
		pDph_t->f0basetypes[1][4]=1113;
		pDph_t->f0basetypes[1][5]=1109;
		pDph_t->f0basetypes[1][6]=1085;
		pDph_t->f0basetypes[1][7]=1062;
		pDph_t->f0basetypes[1][8]=1049;
		pDph_t->f0basetypes[1][9]=1035;
		pDph_t->f0basetypes[1][10]=1043;
		pDph_t->f0basetypes[1][11]=1045;
		pDph_t->f0basetypes[1][12]=1035;
		pDph_t->f0basetypes[1][13]=1040;
		pDph_t->f0basetypes[1][14]=1057;
		pDph_t->f0basetypes[1][15]=1064;

		/*exclamation*/
		pDph_t->f0basetypes[2][0]=1157+80;
		pDph_t->f0basetypes[2][1]=1145+80;
		pDph_t->f0basetypes[2][2]=1139+80;
		pDph_t->f0basetypes[2][3]=1127+80;
		pDph_t->f0basetypes[2][4]=1113+80;
		pDph_t->f0basetypes[2][5]=1109+80;
		pDph_t->f0basetypes[2][6]=1095+80;
		pDph_t->f0basetypes[2][7]=1082+80;
		pDph_t->f0basetypes[2][8]=1079+80;
		pDph_t->f0basetypes[2][9]=1065+80;
		pDph_t->f0basetypes[2][10]=1053+80;
		pDph_t->f0basetypes[2][11]=1040+80;
		pDph_t->f0basetypes[2][12]=1038+80;
		pDph_t->f0basetypes[2][13]=1024+80;
		pDph_t->f0basetypes[2][14]=980+70;
		pDph_t->f0basetypes[2][15]=952+60;
		pDph_t->f0basetypes[2][16]=943+40;

					/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
		pDph_t->f0basetypes[3][0]=1187;
		pDph_t->f0basetypes[3][1]=1165;
		pDph_t->f0basetypes[3][2]=1139;
		pDph_t->f0basetypes[3][3]=1127;
		pDph_t->f0basetypes[3][4]=1113;
		pDph_t->f0basetypes[3][5]=1109;
		pDph_t->f0basetypes[3][6]=1095;
		pDph_t->f0basetypes[3][7]=1082;
		pDph_t->f0basetypes[3][8]=1079;
		pDph_t->f0basetypes[3][9]=1065;
		pDph_t->f0basetypes[3][10]=1053;
		pDph_t->f0basetypes[3][11]=940;
		pDph_t->f0basetypes[3][12]=938;
		pDph_t->f0basetypes[3][13]=924;
		pDph_t->f0basetypes[3][14]=1010;
		pDph_t->f0basetypes[3][15]=1014;
		pDph_t->f0basetypes[3][16]=1018;
#ifdef OLDER
		/* DECLARATIVE*/
		pDph_t->f0basetypes[0][0]=930;
		pDph_t->f0basetypes[0][1]=910;
		pDph_t->f0basetypes[0][2]= 920;
		pDph_t->f0basetypes[0][3]=925;
		pDph_t->f0basetypes[0][4]=920;
		pDph_t->f0basetypes[0][5]=918;
		pDph_t->f0basetypes[0][6]=920;
		pDph_t->f0basetypes[0][7]=930;
		pDph_t->f0basetypes[0][8]=927;
		pDph_t->f0basetypes[0][9]=920;
		pDph_t->f0basetypes[0][10]=915;
		pDph_t->f0basetypes[0][11]=919;
		pDph_t->f0basetypes[0][12]=920;
		pDph_t->f0basetypes[0][13]=910;
		pDph_t->f0basetypes[0][14]=912;
		pDph_t->f0basetypes[0][15]=900;
		pDph_t->f0basetypes[0][16]=890;

				/*eab  less drop for short phrases*/
	
			pDph_t->f0basetypes[1][0]=1160;
			pDph_t->f0basetypes[1][1]=1150;
			pDph_t->f0basetypes[1][2]=1150;
			pDph_t->f0basetypes[1][3]=1152;
			pDph_t->f0basetypes[1][4]=1132;
			pDph_t->f0basetypes[1][5]=1120;
			pDph_t->f0basetypes[1][6]=1100;
			pDph_t->f0basetypes[1][7]=1104;
			pDph_t->f0basetypes[1][8]=1100;
			pDph_t->f0basetypes[1][9]=1080;
			pDph_t->f0basetypes[1][10]=1070;
			pDph_t->f0basetypes[1][11]=1060;
			pDph_t->f0basetypes[1][12]=1050;
			pDph_t->f0basetypes[1][13]=1040;
			pDph_t->f0basetypes[1][14]=1030;
			pDph_t->f0basetypes[1][15]=1000;
			pDph_t->f0basetypes[1][16]=1000;

		/* commaphrase*/
		pDph_t->f0basetypes[2][0]=1187;
		pDph_t->f0basetypes[2][1]=1165;
		pDph_t->f0basetypes[2][2]=1139;
		pDph_t->f0basetypes[2][3]=1127;
		pDph_t->f0basetypes[2][4]=1113;
		pDph_t->f0basetypes[2][5]=1109;
		pDph_t->f0basetypes[2][6]=1095;
		pDph_t->f0basetypes[2][7]=1082;
		pDph_t->f0basetypes[2][8]=1079;
		pDph_t->f0basetypes[2][9]=1065;
		pDph_t->f0basetypes[2][10]=1053;
		pDph_t->f0basetypes[2][11]=1042;
		pDph_t->f0basetypes[2][12]=1044;
		pDph_t->f0basetypes[2][13]=1033;
		pDph_t->f0basetypes[2][14]=1040;
		pDph_t->f0basetypes[2][15]=1054;
		pDph_t->f0basetypes[2][16]=1068;

			
					/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
		pDph_t->f0basetypes[3][0]=1187;
		pDph_t->f0basetypes[3][1]=1165;
		pDph_t->f0basetypes[3][2]=1139;
		pDph_t->f0basetypes[3][3]=1127;
		pDph_t->f0basetypes[3][4]=1113;
		pDph_t->f0basetypes[3][5]=1109;
		pDph_t->f0basetypes[3][6]=1095;
		pDph_t->f0basetypes[3][7]=1082;
		pDph_t->f0basetypes[3][8]=1079;
		pDph_t->f0basetypes[3][9]=1065;
		pDph_t->f0basetypes[3][10]=1053;
		pDph_t->f0basetypes[3][11]=940;
		pDph_t->f0basetypes[3][12]=938;
		pDph_t->f0basetypes[3][13]=924;
		pDph_t->f0basetypes[3][14]=1010;
		pDph_t->f0basetypes[3][15]=1014;
		pDph_t->f0basetypes[3][16]=1018;
#endif
#endif
#endif


#ifdef ENGLISH_UK

/* DECLARATIVE Added base profile per caroline*/
		pDph_t->f0basetypes[0][0]=1157;
		pDph_t->f0basetypes[0][1]=1145;
		pDph_t->f0basetypes[0][2]=1139;
		pDph_t->f0basetypes[0][3]=1127;
		pDph_t->f0basetypes[0][4]=1113;
		pDph_t->f0basetypes[0][5]=1109;
		pDph_t->f0basetypes[0][6]=1095;
		pDph_t->f0basetypes[0][7]=1082;
		pDph_t->f0basetypes[0][8]=1079;
		pDph_t->f0basetypes[0][9]=1065;
		pDph_t->f0basetypes[0][10]=1053;
		pDph_t->f0basetypes[0][11]=1040;
		pDph_t->f0basetypes[0][12]=1038;
		pDph_t->f0basetypes[0][13]=1024;
		pDph_t->f0basetypes[0][14]=1040;
		pDph_t->f0basetypes[0][15]=1050;
		pDph_t->f0basetypes[0][16]=1060;
		



		/*eab  less drop for short phrases*/
	
			pDph_t->f0basetypes[4][0]=1160;
			pDph_t->f0basetypes[4][1]=1150;
			pDph_t->f0basetypes[4][2]=1150;
			pDph_t->f0basetypes[4][3]=1152;
			pDph_t->f0basetypes[4][4]=1132;
			pDph_t->f0basetypes[4][5]=1120;
			pDph_t->f0basetypes[4][6]=1100;
			pDph_t->f0basetypes[4][7]=1104;
			pDph_t->f0basetypes[4][8]=1100;
			pDph_t->f0basetypes[4][9]=1080;
			pDph_t->f0basetypes[4][10]=1070;
			pDph_t->f0basetypes[4][11]=1060;
			pDph_t->f0basetypes[4][12]=1050;
			pDph_t->f0basetypes[4][13]=1040;
			pDph_t->f0basetypes[4][14]=1030;
			pDph_t->f0basetypes[4][15]=1000;
			pDph_t->f0basetypes[4][16]=1000;

			
					/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
		pDph_t->f0basetypes[3][0]=1187;
		pDph_t->f0basetypes[3][1]=1165;
		pDph_t->f0basetypes[3][2]=1139;
		pDph_t->f0basetypes[3][3]=1127;
		pDph_t->f0basetypes[3][4]=1113;
		pDph_t->f0basetypes[3][5]=1109;
		pDph_t->f0basetypes[3][6]=1095;
		pDph_t->f0basetypes[3][7]=1082;
		pDph_t->f0basetypes[3][8]=1079;
		pDph_t->f0basetypes[3][9]=1065;
		pDph_t->f0basetypes[3][10]=1053;
		pDph_t->f0basetypes[3][11]=940;
		pDph_t->f0basetypes[3][12]=938;
		pDph_t->f0basetypes[3][13]=924;
		pDph_t->f0basetypes[3][14]=1010;
		pDph_t->f0basetypes[3][15]=1014;
		pDph_t->f0basetypes[3][16]=1018;

#endif /*ENGLISH_UK*/
	
		/* redundant and incorrectly placed code since a soft init automatically follows a hard init
		the code only has to be in once*/


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
		pDphsettar->f0las1 = pDphsettar->f0basestart << F0SHFT;
		pDphsettar->f0las2 = pDphsettar->f0basestart << F0SHFT;
		oarcnt = 0;
		pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
		pDphsettar->f0slas2 = 0;
		pDph_t->f0 = pDphsettar->f0basestart;
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

		pDphsettar->newnote = pDphsettar->f0basestart;
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

	pDph_t->enddrop =0;
/*	  Set Beginning and final frequency of baseline fall */
	switch (pDph_t->clausetype)
	{
	case 0: /*  declarative  */
		if(pDph_t->number_words > 1)
			pDph_t->f0baseline = pDph_t->f0basetypes[0];
		else
			pDph_t->f0baseline = pDph_t->f0basetypes[4];
		break;
		pDph_t->clausepos=0;

	case 1: /*  comma  */
		
		
		pDph_t->f0baseline = pDph_t->f0basetypes[1];
		
	case 2: /*  exclaimatory  */
		pDph_t->f0baseline = pDph_t->f0basetypes[2];
		pDph_t->clausepos =0;
		break;
		

	case 3: /*  question  */
		pDph_t->f0baseline = pDph_t->f0basetypes[3];
		pDph_t->clausepos =0;
		break;

	default:

		break;

	}
	/*	  Set Beginning and final frequency of baseline fall */
		pDphsettar->f0basestart = pDph_t->f0baseline[0];
	
		pDphsettar->f0endfall = pDph_t->f0baseline[16];

		pDphsettar->beginfall = pDphsettar->f0basestart;
	    pDphsettar->endfall = pDphsettar->f0endfall;

			



		oarcnt=0;

	


#ifdef SPANISH
		if (pDph_t->special_phrase == 1)
		{
			pDphsettar->beginfall = pDphsettar->f0basestart - 50 + pDph_t->delta_special;
			pDphsettar->endfall = pDphsettar->f0endfall - 100; /* lastf0-(f0basefall>>1); */
			pDph_t->special_phrase = 0; 
		}
		else
		{
			pDphsettar->lastbase=pDphsettar->f0basestart;
			pDphsettar->beginfall = pDphsettar->f0basestart;
			pDphsettar->endfall = pDphsettar->f0endfall;
		}
#else
		
		pDphsettar->lastbase=pDphsettar->f0basestart;
		pDphsettar->beginfall = pDphsettar->f0basestart;
		pDphsettar->endfall = pDphsettar->f0endfall;
		
#ifdef DEBUGF0
			WINprintf ("At newpar sw %d %d	beginfall and endfall \n", pDphsettar->beginfall, pDphsettar->endfall);
#endif
	
#endif
	    pDphsettar->nframb = 0;
		pDphsettar->basetime=0;
		pDphsettar->basecntr =0;
		pDphsettar->f0delta =0;
		pDph_t->special_phrase = 0;
		oarcnt=0;
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
				oarcnt=0;
		pDphsettar->nframs = 0;
		pDphsettar->nfram = 6- ((pDph_t->f0_lp_filter-1300)>>8);
        pDphsettar->nframg = 0;
 /*eab 0 works much better 
 6- ((pDph_t->f0_lp_filter-1300)>>8);*/
 
	    if (pDph_t->f0mode< SINGING) 
		{
			pDphsettar->nfram = pDphsettar->nframs >> 1;
	    }
	    else 
		{
			pDphsettar->nfram = 0;	/* Start note slightly early if singing */
	    }


		


/* Time since beginning of cur phonetic segment, in frames */
	pDphsettar->f0las1 = pDphsettar->f0basestart << F0SHFT;
            pDphsettar->f0las2 = pDphsettar->f0basestart << F0SHFT;
			oarcnt=0;
	    pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
	    pDphsettar->f0slas2 = 0;
        pDph_t->f0 = pDphsettar->f0basestart;
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
		pDph_t->addjit = 10;
	
	
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
			
		case GLOTAL:
#ifdef ENGLISH_UK
			break;
#endif
			pDph_t->enddrop= -pDphsettar->f0command;
			pDph_t->glotalize =1;
				
		case IMPULSE:
#ifdef ENGLISH_UK
			break;
#endif			
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
			pDphsettar->tarimp = pDphsettar->f0command;
			
			pDphsettar->delimp = pDphsettar->f0command>>2;
			// pDphsettar->nimp = 24 - ((pDph_t->f0_lp_filter-1300)>>8);
			pDphsettar->nimp = 20 - ((pDph_t->f0_lp_filter-1300)>>8);
			break;

		}
		}
		
		
            

/*        Loop back to look for more f0 commands */
        }
#ifdef  ENDDROP

		/*EAB Drop pitch rapidly at very end of utterance
		9/19/97 */
		if( pDphsettar->nframb >  pDph_t->tcumdur-12
			&& pDph_t->glotalize  && pDph_t->number_words >= 3)
		{
			 if( pDph_t->enddrop < 2000)
			 {
				 pDph_t->enddrop += pDph_t->enddrop;
			 }
			 else
				 pDph_t->enddrop=0;
		}
		
#endif
					




		/* 8/96 eab have baseline follow profile in basline array*/
		/* since we use nframb <<4 and array is 16 then stepsize == tcumdur*16/16
		This code works by starting from a base value and then a difference bewteeen where we are
		and where we want to be is done modulo sixteen, The lastbase keeps the acutal position,
		we don't enforce the values int he code but targets them over time. F0delta is a cumulative
		offset since hte last synchro point i.e. every sixteen */
		if(pDphsettar->nframb<<4 >= pDphsettar->basetime)
		{
					
			pDphsettar->basestep=pDphsettar->lastbase-pDph_t->f0baseline[pDphsettar->basecntr+1];
		/*WINprintf("pos %d target %d step %d bas %d act %d \n",pDphsettar->basecntr,
		pDph_t->f0baseline[pDphsettar->basecntr], pDphsettar->basestep, pDphsettar->lastbase,
		pDphsettar->tarbas);*/
			pDphsettar->basetime += pDph_t->tcumdur;
			if(pDphsettar->basecntr <=15)
			{
				pDphsettar->basecntr++;
				 
			}
		if (pDph_t->tcumdur == 0)	pDph_t->tcumdur = 1;


	
		
		}
		

		pDphsettar->f0delta =pDphsettar->basestep<<4;
		pDphsettar->lastbase -= (((pDphsettar->f0delta)/pDph_t->tcumdur));


			
		if(	pDphsettar->tarbas > 500)
		{
			/* Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality */
				pDph_t->scaled_enddrop= frac4mul ( pDph_t->enddrop, pDph_t->assertiveness);
				pDphsettar->tarbas = pDphsettar->lastbase-pDph_t->scaled_enddrop;
		}
		else
				pDphsettar->tarbas = pDphsettar->lastbase;
	

  //WINprintf("dur %d pDphsettar->tarbas %d phon %d \n",pDphsettar->basetime,pDphsettar->tarbas,pDph_t->allophons[pDphsettar->np_drawt0]);

	pDphsettar->nframb++;




/*    Impulse duration fixed at 24 frames, count down to zero */
/*    (actually, duration is function of speaker def par "quickness" */

        if (--pDphsettar->nimp < 0) {
	    pDphsettar->tarimp = 0;
	    pDphsettar->delimp = 0;
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

	   // f0seg = pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[phocur].f0segtars;
	f0seg = f0msegtars[pDphsettar->phocur];
/*	  Effect is half as much in unstressed segments */
#ifndef GERMAN /*The Fstress marker isn't valid for the whole segment so this is wrong as often as right
	I need time to sort out what Fstress etc should really be doing*/
	    if ((pDph_t->allofeats[pDphsettar->np_drawt0] & FSTRESS) IS_MINUS) {
		f0seg = f0seg >> 1;
	    }
#endif
            pDphsettar->extrad = -DELAY_SEG_LOWPASS;	/* Assume like V-V trans */
						/* so start new target early */
/*        Delay start of f0 rise for upcoming voiceless segment until boundary */
            if ((featb[pDphsettar->phonex_drawt0] & FVOICD) IS_MINUS) {
                pDphsettar->extrad = 0;			/* All of rise during voicless */
            }
/*        Delay f0 fall from voiceless plosive until vot (when glottis closes)*/
        if ((featb[pDphsettar->phocur] & FVOICD) IS_MINUS) 
		{	
			pDphsettar->tarseg1 = f0seg;  /* Gesture fast, go to only 1 lpfilter */
			pDphsettar->tarseg = 0;
			pDphsettar->extrad = 1;	/* -V fric, fall starts at voicing onset */
	        if ((featb[pDphsettar->phocur] & FPLOSV) IS_PLUS) {
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
#ifndef ENGLISH_UK
	set_tglst(pDph_t);		
#endif
	/* Set times of f0 fall pDphsettar->tglstp,pDphsettar->tglstn */

	if (pDph_t->f0mode< SINGING) {

/*	  Filter f0 step and impulse commands to produce next value f0 */
		/* increment gilde towards target and cancel increment when as close as poss to target
		eab 1/21/98 */
		pDphsettar->glide_tot += pDphsettar->glide_inc;
//	WINprintf("male %d %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0]);
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
		
            f0in = (pDphsettar->tarbas + pDphsettar->tarhat + (pDphsettar->tarimp));
	//debug code deleted eab 1/10/98
	    if (pDphsettar->tarimp != 0)   
			pDphsettar->tarimp += pDphsettar->delimp;
					/* Strange way to  */
					/* make f0 rise gradually for a	  */
					/* stress-impulse command	  */
					//	pDphsettar->delimp -=1;
					pDphsettar->delimp= pDphsettar->delimp>>1;
/*	  Reduce segmental tongue height effect of sonorants toward */
/*	  end of segment (98% per frame)  */

			pDph_t->arg1 = pDphsettar->tarseg; 
            pDph_t->arg2 = 16064;    
            pDphsettar->tarseg = mlsh1(pDph_t->arg1,pDph_t->arg2);
		
	/* eab new code 4/6/98 to add in a segmental dc offset based on f1 to account for shifts due to 
	vocal tract postition as implemented this effect is quite weak (better safe than sorry) no time for a long
			detailed evaluation but this should add some positive variability*/
		if(pDph_t->parstochip[OUT_F1] < 500)
			f0in += ((500-pDph_t->parstochip[1] ));

			//WINprintf("tarseg = %d f0in %d \n,",(pDphsettar->tarseg +pDphsettar->tarseg1),f0in);
	    filter_seg_commands(pDph_t,f0in);	/* Input is pDphsettar->tarseg, output is pDphsettar->f0s */
#ifdef NWSNOAALATER
		pDph_t->f0s += frac4mul(pDph_t->f0s, pDph_t->f0segscalefac+7000);
#endif
		
	    filter_commands(pDph_t,f0in);		/* Input is f0in,   output is f0  */
		/* Add in glide value to F0 eab 1/21/98*/

	    pDph_t->f0prime = pDph_t->f0 /* + pDph_t->f0s */+pDphsettar->glide_tot;	/* This will be spdef-scaled output value */
		//WINprintf("maleseg %d \n", pDph_t->f0s); 
/*		WINprintf("male %d %d  pDph_t->f0 %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0],
			pDph_t->f0); */

	/* 11/23/97 Eab creek for male voice only for now*/
#ifdef CREEKMALE
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

	//WINprintf("phocur %d %d %d F0in %d \n",pDphsettar->phocur, pDphsettar->tarbas, pDph_t->enddrop, pDph_t->f0prime);

#endif

	}

	else 
	{

/*	  Linear interpolation to 'pDphsettar->newnote' over 100 ms or phoneme duration */
						/* Add vibratto if pDphsettar->vibsw=1  */
	    linear_interp(pDph_t);
	}

/*    Glottalization gesture */
/*    F0 dip by 60 Hz linear ramp in 8 frames each direction about pDphsettar->tglstp */
	dtglst = pDphsettar->nframg - pDphsettar->tglstp;
	if ( dtglst < 0 )
	     dtglst = (-dtglst);
        if (dtglst <= 7)
		{
            pDph_t->f0prime += ((dtglst * 70) - 550);
			
		}
	
/*	  And reduce AV somewhat (ugly code, but F0 computed before AV) */

        if (dtglst <= 5) 
		{
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
	    pseudojitter = getcosine[pDphsettar->timecos5>>6]
			 - getcosine[pDphsettar->timecos3>>6];
	    pDph_t->arg1 = pseudojitter;
		/* eab found flutter is not a speaker def yet*/
	    pDph_t->arg2 = 500;//pDph_t->f0flutter;
		/* "FLUTTER" spdef parameter, 10% -> +/-1 Hz, */
	    pDph_t->f0prime += mlsh1(pDph_t->arg1,pDph_t->arg2);	
		if(pDph_t->clausetype == 2)
		{
			pDph_t->f0prime +=	pDph_t->addjit;
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
			pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - 1000), pDph_t->f0scalefac+1000);
				
		}
		else
		{
			pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - 1000), pDph_t->f0scalefac);
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
	pDph_t->arg1 = 400;
	/* eab need to adjust here for 11 khz*/
	pDph_t->arg2 = 1100;
	pDph_t->arg3 = pDph_t->f0prime;
        temp = muldv(pDph_t->arg1, pDph_t->arg2, pDph_t->arg3);
		pDph_t->parstochip[OUT_T0]  = temp;



#ifdef GRAPHF0

	for (icnt=0;icnt<=120;icnt++)
		prntbuf[icnt]=' ';
	prntbuf[120]='\0';
	if(pDph_t->malfem == FEMALE) /* Female or childs voice scale to fit*/
			icnt=((pDph_t->f0prime)/10)-120;
	else
		icnt=((pDph_t->f0prime)/10)-50;
	if(icnt >=120)
		icnt=120;
	prntbuf[icnt]='*';
	WINprintf("%d",pDph_t->f0prime);
	WINprintf("%s\n",prntbuf);


#endif

/*	WINprintf("TARBAS %d phone %d  tarhat=%3d tarimp=%3d  f0 =%d \n",
        pDphsettar->tarbas,pDph_t->allophons[pDphsettar->npg],pDphsettar->tarhat, pDphsettar->tarimp,
		pDph_t->f0prime); */
//	 if(0)
//	 pDph_t->parstochip[OUT_T0]=of0array[oarcnt++];

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
		/* if (np == 0 && allophons[np] == SIL) { lastone=np; }                  */
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
							  (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10),
							  (pDph_t->f0prime / 10));
				printf("\n");
				/*SIGNAL_PRINT;*/
#else
				dologphoneme (phTTS, pDph_t->allophons[pDphsettar->np_drawt0],
							  (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10),
							  (pDph_t->f0prime / 10));
#ifdef PRINTFDEBUG
				printf ("\n");
#endif
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
	pDph_t->parstochip[OUT_PH] = pDph_t->allophons[pDphsettar->np_drawt0];
	pDph_t->parstochip[OUT_DU] = pDph_t->allodurs[pDphsettar->np_drawt0];
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
		pDphsettar->phocur = SIL;
		
		/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;


#ifdef GERMAN

		/* DECLARATIVE*/		
		pDph_t->f0basetypes[0][0]=1887-6; 
		pDph_t->f0basetypes[0][1]=1865-6; 
		pDph_t->f0basetypes[0][2]=1839-6; 
		pDph_t->f0basetypes[0][3]=1827-6; 
		pDph_t->f0basetypes[0][4]=1813-6; 
		pDph_t->f0basetypes[0][5]=1809-6; 
		pDph_t->f0basetypes[0][6]=1795-6; 
		pDph_t->f0basetypes[0][7]=1782-6; 
		pDph_t->f0basetypes[0][8]=1779-6; 
		pDph_t->f0basetypes[0][9]=1765-6; 
		pDph_t->f0basetypes[0][10]=1763-6; 
		pDph_t->f0basetypes[0][11]=1750-6; 
		pDph_t->f0basetypes[0][12]=1738-6; 
		pDph_t->f0basetypes[0][13]=1714-6; 
		pDph_t->f0basetypes[0][14]=1700-6; 
		pDph_t->f0basetypes[0][15]=1694-6; 
		pDph_t->f0basetypes[0][16]=1678-6; 

		/*comma*/
		pDph_t->f0basetypes[1][0]=1887-6; 
		pDph_t->f0basetypes[1][1]=1865-6; 
		pDph_t->f0basetypes[1][2]=1839-6; 
		pDph_t->f0basetypes[1][3]=1827-6; 
		pDph_t->f0basetypes[1][4]=1813-6; 
		pDph_t->f0basetypes[1][5]=1809-6; 
		pDph_t->f0basetypes[1][6]=1785-6; 
		pDph_t->f0basetypes[1][7]=1762-6; 
		pDph_t->f0basetypes[1][8]=1749-6; 
		pDph_t->f0basetypes[1][9]=1725-6; 
		pDph_t->f0basetypes[1][10]=1703-6; 
		pDph_t->f0basetypes[1][11]=1710-6; 
		pDph_t->f0basetypes[1][12]=1718-6; 
		pDph_t->f0basetypes[1][13]=1764-6; 
		pDph_t->f0basetypes[1][14]=1810-6; 
		pDph_t->f0basetypes[1][15]=1864-6; 
		pDph_t->f0basetypes[1][16]=1928-6; 

		/*excalamatory*/
		pDph_t->f0basetypes[2][0]=1887; 
		pDph_t->f0basetypes[2][1]=1865; 
		pDph_t->f0basetypes[2][2]=1839; 
		pDph_t->f0basetypes[2][3]=1827; 
		pDph_t->f0basetypes[2][4]=1813; 
		pDph_t->f0basetypes[2][5]=1809; 
		pDph_t->f0basetypes[2][6]=1785; 
		pDph_t->f0basetypes[2][7]=1762; 
		pDph_t->f0basetypes[2][8]=1749; 
		pDph_t->f0basetypes[2][9]=1725; 
		pDph_t->f0basetypes[2][10]=1706; 
		pDph_t->f0basetypes[2][11]=1986; 
		pDph_t->f0basetypes[2][12]=1966; 
		pDph_t->f0basetypes[2][13]=1944; 
		pDph_t->f0basetypes[2][14]=1910; 
		pDph_t->f0basetypes[2][15]=1884; 
		pDph_t->f0basetypes[2][16]=1858; 

		/*question*/
		pDph_t->f0basetypes[3][0]=1887-6; 
		pDph_t->f0basetypes[3][1]=1865-6; 
		pDph_t->f0basetypes[3][2]=1839-6; 
		pDph_t->f0basetypes[3][3]=1827-6; 
		pDph_t->f0basetypes[3][4]=1813-6; 
		pDph_t->f0basetypes[3][5]=1809-6; 
		pDph_t->f0basetypes[3][6]=1785-6; 
		pDph_t->f0basetypes[3][7]=1762-6; 
		pDph_t->f0basetypes[3][8]=1749-6; 
		pDph_t->f0basetypes[3][9]=1725-6; 
		pDph_t->f0basetypes[3][10]=1703-6; 
		pDph_t->f0basetypes[3][11]=1980-6; 
		pDph_t->f0basetypes[3][12]=1968-6; 
		pDph_t->f0basetypes[3][13]=1944-6; 
		pDph_t->f0basetypes[3][14]=1960-6; 
		pDph_t->f0basetypes[3][15]=1974-6; 
		pDph_t->f0basetypes[3][16]=1718-6; 

		
			/* short phrase */	
			pDph_t->f0basetypes[4][0]=1890-6; 
			pDph_t->f0basetypes[4][1]=1880-6; 
			pDph_t->f0basetypes[4][2]=1870-6; 
			pDph_t->f0basetypes[4][3]=1850-6; 
			pDph_t->f0basetypes[4][4]=1860-6; 
			pDph_t->f0basetypes[4][5]=1840-6; 
			pDph_t->f0basetypes[4][6]=1820-6; 
			pDph_t->f0basetypes[4][7]=1814-6; 
			pDph_t->f0basetypes[4][8]=1828-6; 
			pDph_t->f0basetypes[4][9]=1804-6; 
			pDph_t->f0basetypes[4][10]=1790-6; 
			pDph_t->f0basetypes[4][11]=1780-6; 
			pDph_t->f0basetypes[4][12]=1770-6; 
			pDph_t->f0basetypes[4][13]=1760-6; 
			pDph_t->f0basetypes[4][14]=1750-6; 
			pDph_t->f0basetypes[4][15]=1732-6; 
			pDph_t->f0basetypes[4][16]=1700-6; 

#endif
		


#ifdef ENGLISH_UK

/* DECLARATIVE Added base profile per caroline*/
		pDph_t->f0basetypes[0][0]=1657;
		pDph_t->f0basetypes[0][1]=1645;
		pDph_t->f0basetypes[0][2]=1639;
		pDph_t->f0basetypes[0][3]=1627;
		pDph_t->f0basetypes[0][4]=1613;
		pDph_t->f0basetypes[0][5]=1609;
		pDph_t->f0basetypes[0][6]=1595;
		pDph_t->f0basetypes[0][7]=1582;
		pDph_t->f0basetypes[0][8]=1579;
		pDph_t->f0basetypes[0][9]=1565;
		pDph_t->f0basetypes[0][10]=1553;
		pDph_t->f0basetypes[0][11]=1540;
		pDph_t->f0basetypes[0][12]=1538;
		pDph_t->f0basetypes[0][13]=1524;
		pDph_t->f0basetypes[0][14]=1540;
		pDph_t->f0basetypes[0][15]=1550;
		pDph_t->f0basetypes[0][16]=1560;

	

		/*comma*/
		pDph_t->f0basetypes[1][0]=1887-6; 
		pDph_t->f0basetypes[1][1]=1865-6; 
		pDph_t->f0basetypes[1][2]=1839-6; 
		pDph_t->f0basetypes[1][3]=1827-6; 
		pDph_t->f0basetypes[1][4]=1813-6; 
		pDph_t->f0basetypes[1][5]=1809-6; 
		pDph_t->f0basetypes[1][6]=2085-6; 
		pDph_t->f0basetypes[1][7]=2062-6; 
		pDph_t->f0basetypes[1][8]=2049-6; 
		pDph_t->f0basetypes[1][9]=2025-6; 
		pDph_t->f0basetypes[1][10]=2003-6; 
		pDph_t->f0basetypes[1][11]=2010-6; 
		pDph_t->f0basetypes[1][12]=2018-6; 
		pDph_t->f0basetypes[1][13]=2024-6; 
		pDph_t->f0basetypes[1][14]=2030-6; 
		pDph_t->f0basetypes[1][15]=2044-6; 
		pDph_t->f0basetypes[1][16]=2058-6; 

		/*excalamatory*/
		pDph_t->f0basetypes[2][0]=1887-6; 
		pDph_t->f0basetypes[2][1]=1865-6; 
		pDph_t->f0basetypes[2][2]=1839-6; 
		pDph_t->f0basetypes[2][3]=1827-6; 
		pDph_t->f0basetypes[2][4]=1813-6; 
		pDph_t->f0basetypes[2][5]=1809-6; 
		pDph_t->f0basetypes[2][6]=2085-6; 
		pDph_t->f0basetypes[2][7]=2062-6; 
		pDph_t->f0basetypes[2][8]=2049-6; 
		pDph_t->f0basetypes[2][9]=2025-6; 
		pDph_t->f0basetypes[2][10]=2003-6; 
		pDph_t->f0basetypes[2][11]=1980-6; 
		pDph_t->f0basetypes[2][12]=1968-6; 
		pDph_t->f0basetypes[2][13]=1944-6; 
		pDph_t->f0basetypes[2][14]=1910-6; 
		pDph_t->f0basetypes[2][15]=1884-6; 
		pDph_t->f0basetypes[2][16]=1858-6; 

		/*question*/
		pDph_t->f0basetypes[3][0]=1887-6; 
		pDph_t->f0basetypes[3][1]=1865-6; 
		pDph_t->f0basetypes[3][2]=1839-6; 
		pDph_t->f0basetypes[3][3]=1827-6; 
		pDph_t->f0basetypes[3][4]=1813-6; 
		pDph_t->f0basetypes[3][5]=1809-6; 
		pDph_t->f0basetypes[3][6]=2085-6; 
		pDph_t->f0basetypes[3][7]=2062-6; 
		pDph_t->f0basetypes[3][8]=2049-6; 
		pDph_t->f0basetypes[3][9]=2025-6; 
		pDph_t->f0basetypes[3][10]=2003-6; 
		pDph_t->f0basetypes[3][11]=1980-6; 
		pDph_t->f0basetypes[3][12]=1968-6; 
		pDph_t->f0basetypes[3][13]=1944-6; 
		pDph_t->f0basetypes[3][14]=1960-6; 
		pDph_t->f0basetypes[3][15]=1974-6; 
		pDph_t->f0basetypes[3][16]=2018-6; 

		
			/* short phrase */	
			pDph_t->f0basetypes[4][0]=1830-6; 
			pDph_t->f0basetypes[4][1]=2040-6; 
			pDph_t->f0basetypes[4][2]=1920-6; 
			pDph_t->f0basetypes[4][3]=2000-6; 
			pDph_t->f0basetypes[4][4]=1960-6; 
			pDph_t->f0basetypes[4][5]=1920-6; 
			pDph_t->f0basetypes[4][6]=1910-6; 
			pDph_t->f0basetypes[4][7]=1804-6; 
			pDph_t->f0basetypes[4][8]=1801-6; 
			pDph_t->f0basetypes[4][9]=1794-6; 
			pDph_t->f0basetypes[4][10]=1780-6; 
			pDph_t->f0basetypes[4][11]=1790-6; 
			pDph_t->f0basetypes[4][12]=1770-6; 
			pDph_t->f0basetypes[4][13]=1750-6; 
			pDph_t->f0basetypes[4][14]=1730-6; 
			pDph_t->f0basetypes[4][15]=1720-6; 
			pDph_t->f0basetypes[4][16]=1710-6; 

#endif

			

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
		pDphsettar->f0las1 = pDphsettar->f0basestart << F0SHFT;
		pDphsettar->f0las2 = pDphsettar->f0basestart << F0SHFT;
		oarcnt = 0;
		pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
		pDphsettar->f0slas2 = 0;
		pDph_t->f0 = pDphsettar->f0basestart;
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

		pDphsettar->newnote = pDphsettar->f0basestart;
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

	pDph_t->enddrop =0;
/*	  Set Beginning and final frequency of baseline fall */
	switch (pDph_t->clausetype)
	{
	case 0: /*  declarative  */
		if(pDph_t->number_words > 1)
			pDph_t->f0baseline = pDph_t->f0basetypes[0];
		else
			pDph_t->f0baseline = pDph_t->f0basetypes[4];
		break;
	
	case 1: /*  comma  */
	
		pDph_t->f0baseline = pDph_t->f0basetypes[1];
	case 2: /*  exclaimatory  */
		pDph_t->f0baseline = pDph_t->f0basetypes[2];
		pDph_t->clausepos =0;
		break;
		

	case 3: /*  question  */
		pDph_t->f0baseline = pDph_t->f0basetypes[3];
		pDph_t->clausepos =0;
		break;

	
	default:

		break;

	}
	/*	  Set Beginning and final frequency of baseline fall */
		pDphsettar->f0basestart = pDph_t->f0baseline[0];
	
		pDphsettar->f0endfall = pDph_t->f0baseline[16];

		pDphsettar->beginfall = pDphsettar->f0basestart;
	    pDphsettar->endfall = pDphsettar->f0endfall;

			



		oarcnt=0;

	


#ifdef SPANISH
		if (pDph_t->special_phrase == 1)
		{
			pDphsettar->beginfall = pDphsettar->f0basestart - 50 + pDph_t->delta_special;
			pDphsettar->endfall = pDphsettar->f0endfall - 100; /* lastf0-(f0basefall>>1); */
			pDph_t->special_phrase = 0; 
		}
		else
		{
			pDphsettar->lastbase=pDphsettar->f0basestart;
			pDphsettar->beginfall = pDphsettar->f0basestart;
			pDphsettar->endfall = pDphsettar->f0endfall;
		}
#else
		
		pDphsettar->lastbase=pDphsettar->f0basestart;
		pDphsettar->beginfall = pDphsettar->f0basestart;
		pDphsettar->endfall = pDphsettar->f0endfall;
		
#ifdef DEBUGF0
			WINprintf ("At newpar sw %d %d	beginfall and endfall \n", pDphsettar->beginfall, pDphsettar->endfall);
#endif
	
#endif
	    pDphsettar->nframb = 0;
		pDphsettar->basetime=0;
		pDphsettar->basecntr =0;
		pDphsettar->f0delta =0;
		pDph_t->special_phrase = 0;
		oarcnt=0;
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
				oarcnt=0;
		pDphsettar->nframs = 0;
		pDphsettar->nfram = 6- ((pDph_t->f0_lp_filter-1300)>>8);
        pDphsettar->nframg = 0;
 /*eab 0 works much better 
 6- ((pDph_t->f0_lp_filter-1300)>>8);*/
 
	    if (pDph_t->f0mode< SINGING) 
		{
			pDphsettar->nfram = pDphsettar->nframs >> 1;
	    }
	    else 
		{
			pDphsettar->nfram = 0;	/* Start note slightly early if singing */
	    }


		


/* Time since beginning of cur phonetic segment, in frames */
	pDphsettar->f0las1 = pDphsettar->f0basestart << F0SHFT;
            pDphsettar->f0las2 = pDphsettar->f0basestart << F0SHFT;
			oarcnt=0;
	    pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
	    pDphsettar->f0slas2 = 0;
        pDph_t->f0 = pDphsettar->f0basestart;
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
		pDph_t->addjit = 10;

		
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
			
		case GLOTAL:
#ifdef ENGLISH_UK
			break;
#endif
			pDph_t->enddrop= -pDphsettar->f0command;
			pDph_t->glotalize =1;
				
		case IMPULSE:
#ifdef ENGLISH_UK
			break;
#endif			
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
			pDphsettar->tarimp = pDphsettar->f0command;
			
			pDphsettar->delimp = pDphsettar->f0command>>2;
			// pDphsettar->nimp = 24 - ((pDph_t->f0_lp_filter-1300)>>8);
			pDphsettar->nimp = 20 - ((pDph_t->f0_lp_filter-1300)>>8);
			break;

		}
		}
		
		
            

/*        Loop back to look for more f0 commands */
        }
#ifdef  ENDDROP

		/*EAB Drop pitch rapidly at very end of utterance
		9/19/97 */
		if( pDphsettar->nframb >  pDph_t->tcumdur-12
			&& pDph_t->glotalize  && pDph_t->number_words >= 3)
		{
			 if( pDph_t->enddrop < 2000)
			 {
				 pDph_t->enddrop += pDph_t->enddrop;
			 }
			 else
				 pDph_t->enddrop=0;
		}
		
#endif
					




		/* 8/96 eab have baseline follow profile in basline array*/
		/* since we use nframb <<4 and array is 16 then stepsize == tcumdur*16/16
		This code works by starting from a base value and then a difference bewteeen where we are
		and where we want to be is done modulo sixteen, The lastbase keeps the acutal position,
		we don't enforce the values int he code but targets them over time. F0delta is a cumulative
		offset since hte last synchro point i.e. every sixteen */
		if(pDphsettar->nframb<<4 >= pDphsettar->basetime)
		{
					
			pDphsettar->basestep=pDphsettar->lastbase-pDph_t->f0baseline[pDphsettar->basecntr+1];
		/*WINprintf("pos %d target %d step %d bas %d act %d \n",pDphsettar->basecntr,
		pDph_t->f0baseline[pDphsettar->basecntr], pDphsettar->basestep, pDphsettar->lastbase,
		pDphsettar->tarbas);*/
			pDphsettar->basetime += pDph_t->tcumdur;
			if(pDphsettar->basecntr <=15)
			{
				pDphsettar->basecntr++;
				 
			}
		if (pDph_t->tcumdur == 0)	pDph_t->tcumdur = 1;


	
		
		}
		

		pDphsettar->f0delta =pDphsettar->basestep<<4;
		pDphsettar->lastbase -= (((pDphsettar->f0delta)/pDph_t->tcumdur));


			
		if(	pDphsettar->tarbas > 500)
		{
			/* Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality */
				pDph_t->scaled_enddrop= frac4mul ( pDph_t->enddrop, pDph_t->assertiveness);
				pDphsettar->tarbas = pDphsettar->lastbase-pDph_t->scaled_enddrop;
		}
		else
				pDphsettar->tarbas = pDphsettar->lastbase;
	

  //WINprintf("dur %d pDphsettar->tarbas %d phon %d \n",pDphsettar->basetime,pDphsettar->tarbas,pDph_t->allophons[pDphsettar->np_drawt0]);

	pDphsettar->nframb++;




/*    Impulse duration fixed at 24 frames, count down to zero */
/*    (actually, duration is function of speaker def par "quickness" */

        if (--pDphsettar->nimp < 0) {
	    pDphsettar->tarimp = 0;
	    pDphsettar->delimp = 0;
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

	   // f0seg = pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[phocur].f0segtars;
	f0seg = f0fsegtars[pDphsettar->phocur];
/*	  Effect is half as much in unstressed segments */
#ifndef GERMAN /*The Fstress marker isn't valid for the hwole segment so this is wrong as ften as right
	I need time to sort out what Fstress etc should really be doing*/
	    if ((pDph_t->allofeats[pDphsettar->np_drawt0] & FSTRESS) IS_MINUS) {
		f0seg = f0seg >> 1;
	    }
#endif
            pDphsettar->extrad = -DELAY_SEG_LOWPASS;	/* Assume like V-V trans */
						/* so start new target early */
/*        Delay start of f0 rise for upcoming voiceless segment until boundary */
            if ((featb[pDphsettar->phonex_drawt0] & FVOICD) IS_MINUS) {
                pDphsettar->extrad = 0;			/* All of rise during voicless */
            }
/*        Delay f0 fall from voiceless plosive until vot (when glottis closes)*/
        if ((featb[pDphsettar->phocur] & FVOICD) IS_MINUS) 
		{	
			pDphsettar->tarseg1 = f0seg;  /* Gesture fast, go to only 1 lpfilter */
			pDphsettar->tarseg = 0;
			pDphsettar->extrad = 1;	/* -V fric, fall starts at voicing onset */
	        if ((featb[pDphsettar->phocur] & FPLOSV) IS_PLUS) {
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
#ifndef ENGLISH_UK
	set_tglst(pDph_t);		
#endif
	/* Set times of f0 fall pDphsettar->tglstp,pDphsettar->tglstn */

	if (pDph_t->f0mode< SINGING) {

/*	  Filter f0 step and impulse commands to produce next value f0 */
		/* increment gilde towards target and cancel increment when as close as poss to target
		eab 1/21/98 */
		pDphsettar->glide_tot += pDphsettar->glide_inc;
//	WINprintf("male %d %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0]);
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
		
            f0in = (pDphsettar->tarbas + pDphsettar->tarhat + (pDphsettar->tarimp<<1));
	//debug code deleted eab 1/10/98
	    if (pDphsettar->tarimp != 0)   
			pDphsettar->tarimp += pDphsettar->delimp;
					/* Strange way to  */
					/* make f0 rise gradually for a	  */
					/* stress-impulse command	  */
					//	pDphsettar->delimp -=1;
					pDphsettar->delimp= pDphsettar->delimp>>1;
/*	  Reduce segmental tongue height effect of sonorants toward */
/*	  end of segment (98% per frame)  */

			pDph_t->arg1 = pDphsettar->tarseg; 
            pDph_t->arg2 = 16064;    
            pDphsettar->tarseg = mlsh1(pDph_t->arg1,pDph_t->arg2);
		
	/* eab new code 4/6/98 to add in a segmental dc offset based on f1 to account for shifts due to 
	vocal tract postition as implemented this effect is quite weak (better safe than sorry) no time for a long
			detailed evaluation but this should add some positive variability*/
		if(pDph_t->parstochip[OUT_F1] < 500)
			f0in += ((500-pDph_t->parstochip[1] ));

			//WINprintf("tarseg = %d f0in %d \n,",(pDphsettar->tarseg +pDphsettar->tarseg1),f0in);
	    filter_seg_commands(pDph_t,f0in);	/* Input is pDphsettar->tarseg, output is pDphsettar->f0s */
#ifdef NWSNOAALATER
		pDph_t->f0s += frac4mul(pDph_t->f0s, pDph_t->f0segscalefac+7000);
#endif
		
	    filter_commands(pDph_t,f0in);		/* Input is f0in,   output is f0  */
		/* Add in glide value to F0 eab 1/21/98*/

		/* reduce segmental influence per Oliver*/
	    pDph_t->f0prime = pDph_t->f0  + pDph_t->f0s +pDphsettar->glide_tot;	/* This will be spdef-scaled output value */

		//WINprintf("maleseg %d \n", pDph_t->f0s); 
/*		WINprintf("male %d %d  pDph_t->f0 %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0],
			pDph_t->f0); */

	
#ifdef CREEKFEMALE
		if( pDphsettar->nframb >  pDph_t->tcumdur-4 
			&& pDph_t->clausetype == DECLARATIVE 
			&& pDph_t->number_words > 5)
		{
		f	pDph_t->avcreek = -6;
			pDph_t->f0prime = pDph_t->f0prime >>1;
		}
		else
		{
			pDph_t->avcreek = 0;
		}
	
	//	WINprintf( "phocur %d %d %d F0in %d \n",pDphsettar->phocur, pDphsettar->tarbas, pDph_t->enddrop, pDph_t->f0prime);
#endif

	}

	else {

/*	  Linear interpolation to 'pDphsettar->newnote' over 100 ms or phoneme duration */
						/* Add vibratto if pDphsettar->vibsw=1  */
	    linear_interp(pDph_t);
	}

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
	    pseudojitter = getcosine[pDphsettar->timecos5>>6]
			 - getcosine[pDphsettar->timecos3>>6];
	    pDph_t->arg1 = pseudojitter;
		/* eab found flutter is not a speaker def yet*/
	    pDph_t->arg2 = 1200;//pDph_t->f0flutter;4/16/98 eab higher for female voice
		/* "FLUTTER" spdef parameter, 10% -> +/-1 Hz, */
	    pDph_t->f0prime += mlsh1(pDph_t->arg1,pDph_t->arg2);	
		if(pDph_t->clausetype == 2)
		{
			pDph_t->f0prime +=	pDph_t->addjit;
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
			pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - 1900), pDph_t->f0scalefac+1000);
				
		}
		else
		{
			pDph_t->f0prime = pDph_t->f0minimum	+ frac4mul((pDph_t->f0prime - 1900), pDph_t->f0scalefac);
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
	pDph_t->arg1 = 400;
	/* eab need to adjust here for 11 khz*/
	pDph_t->arg2 = 1100;
	pDph_t->arg3 = pDph_t->f0prime;
        temp = muldv(pDph_t->arg1, pDph_t->arg2, pDph_t->arg3);
		pDph_t->parstochip[OUT_T0]  = temp;



#ifdef GRAPHF0

	for (icnt=0;icnt<=120;icnt++)
		prntbuf[icnt]=' ';
	prntbuf[120]='\0';
	if(pDph_t->malfem == FEMALE) /* Female or childs voice scale to fit*/
			icnt=((pDph_t->f0prime)/10)-120;
	else
		icnt=((pDph_t->f0prime)/10)-50;
	if(icnt >=120)
		icnt=120;
	prntbuf[icnt]='*';
	WINprintf("%d",pDph_t->f0prime);
	WINprintf("%s\n",prntbuf);


#endif

	//WINprintf("TARBAS %d phone %d  tarhat=%3d tarimp=%3d  f0 =%d \n",
      //  pDphsettar->tarbas,pDph_t->allophons[pDphsettar->npg],pDphsettar->tarhat, pDphsettar->tarimp,
		//pDph_t->f0prime); 
//	 if(0)
//	 pDph_t->parstochip[OUT_T0]=of0array[oarcnt++];

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
		/* if (np == 0 && allophons[np] == SIL) { lastone=np; }                  */
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
							  (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10),
							  (pDph_t->f0prime / 10));
				printf("\n");
				/*SIGNAL_PRINT;*/
#else
				dologphoneme (phTTS, pDph_t->allophons[pDphsettar->np_drawt0],
							  (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10),
							  (pDph_t->f0prime / 10));
#ifdef PRINTFDEBUG
				printf ("\n");
#endif
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
	pDph_t->parstochip[OUT_PH] = pDph_t->allophons[pDphsettar->np_drawt0];
	pDph_t->parstochip[OUT_DU] = pDph_t->allodurs[pDphsettar->np_drawt0];
#endif

	

} /* end of fem stuff*/
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			S E T - U S E R - T A R G E T			 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

static void set_user_target(PDPH_T pDph_t,short *psF0command)
{
	short trandur=0;
    PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;

	if (*psF0command >= 2000)   *psF0command -= 2000;   /* 2000 is offset flag */
	if (*psF0command <= 37) {	/* Pointer to C5, highest possible sung note */

	    pDphsettar->newnote = notetab[*psF0command-1];
	    pDphsettar->vibsw = 1;
/*	  Set pDphsettar->delnote*4 so transition happens over 16 frames (100 ms) */
	    pDphsettar->delnote = ((pDphsettar->newnote - pDph_t->f0) >> 2);
	}
	else {						/* Straight-lines */
	    *psF0command *= 10;
	    if (*psF0command < LOWEST_F0) {
		*psF0command = LOWEST_F0;
	    }
	    else if (*psF0command > HIGHEST_F0) {
		*psF0command = HIGHEST_F0;
	    }
	    pDphsettar->newnote = *psF0command;
	    pDphsettar->vibsw = 0;
/*	  Compute duration of linear transition */
	    if (pDph_t->f0mode== TIME_VALUE_SPECIFIED) {
		trandur = pDphsettar->dtimf0;		/* Dur since last f0 command */
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



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*			S E T - T G L S T				 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
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
            if (((featb[pDph_t->allophons[pDphsettar->npg+1]] & FVOWEL) IS_PLUS)
              && ((pDph_t->allofeats[pDphsettar->npg+1] & (FMEDIALSYL & FFINALSYL)) IS_MINUS)
              && ((pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FWBNEXT)
             /* && (pDph_t->allophons[pDphsettar->npg+1] != YU)*/) {
/*	      If cur seg is vowel, don't do it unless vowel ident, or pbound */
		if ((featb[pDph_t->allophons[pDphsettar->npg]] & FSYLL) IS_PLUS) {
		    if (((pDph_t->allophons[pDphsettar->npg] == pDph_t->allophons[pDphsettar->npg+1])
		      && ((pDph_t->allofeats[pDphsettar->npg+1] & FSTRESS_1) IS_PLUS) )
		      || ((pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FVPNEXT)) {
			pDphsettar->tglstn = pDphsettar->segdrg;
			}
		}
/*	      If  next segment primary stressed, */
/*	      and if curr seg a consonant other than a plosive, do it */
		else if ( ((featb[pDph_t->allophons[pDphsettar->npg]] & FPLOSV) IS_MINUS)
		  /*&& (pDph_t->allophons[pDphsettar->npg] != DX)*/
	          && ((pDph_t->allofeats[pDphsettar->npg+1] & FSTRESS_1) IS_PLUS) ) {
	            pDphsettar->tglstn = pDphsettar->segdrg;
		}
            }
/*        And at beginning and end of glottalized segs TQ and Q */
        //    if ((pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[pDph_t->allophons[pDphsettar->npg+1]].place & FGLOTAL) IS_PLUS) {
          //      pDphsettar->tglstn = pDphsettar->segdrg;

            //}
            //if ((pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[pDph_t->allophons[pDphsettar->npg]].place & FGLOTAL) IS_PLUS) 
			//{
              //  pDphsettar->tglstn = pDphsettar->segdrg;
            //}

		if ((place[pDph_t->allophons[pDphsettar->npg + 1]] & FGLOTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}

		if ((place[pDph_t->allophons[pDphsettar->npg]] & FGLOTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}
#ifdef GERMAN
		/*EAB 2/25/98 This is applying more broadly than  it suppose to I will review this with
		oliver and refine it it doesn't check for stress in next syllable and is it the sequence der 
		or the word wbound not being checked either*/
		
			/* Rule 1a: The word "der" the r is an allophonic glottal stop before an unstressed syllable */
			if ((pDph_t->allophons[pDphsettar->npg] == R)
				&& ((featb[pDph_t->allophons[pDphsettar->npg + 1]] & FVOWEL) IS_PLUS)
				&& (pDph_t->allofeats[pDphsettar->npg] & FWBNEXT))
			{
				pDphsettar->tglstn = pDphsettar->segdrg;
			}
#endif

       }

/*    Wait until current gl stop gesture over before setting time of next one */
        else if ((pDphsettar->nframg == 8) || (pDphsettar->nframg == (pDphsettar->segdrg - 1))) 
		{
	    pDphsettar->tglstp = pDphsettar->tglstn;
		
	}
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	  F I L T E R - H A T / I M P U L S E - C O M M A N D S		 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
static void filter_commands(PDPH_T pDph_t,short f0in) 

{		/* Convert 'f0in' command to smoothed 'f0' */

        short f0outa, f0outb, f0outc, f0outd, f0out1, f0out2;
	
		 PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;

/*    First pole (separate into 2 poles to min truncation errors) */
        pDph_t->arg1 = pDphsettar->f0a1;
        pDph_t->arg2 = f0in;
        f0outa = mlsh1(pDph_t->arg1,pDph_t->arg2);
        pDph_t->arg1 = pDphsettar->f0b;
        pDph_t->arg2 = pDphsettar->f0las1;
        f0outb = mlsh1(pDph_t->arg1,pDph_t->arg2);
        f0out1 = f0outa + f0outb;
        pDphsettar->f0las1 = f0out1;
/*    Second pole */
        pDph_t->arg1 = pDphsettar->f0a2;
        pDph_t->arg2 = f0out1;
        f0outc = mlsh1(pDph_t->arg1,pDph_t->arg2);
        pDph_t->arg1 = pDphsettar->f0b;
        pDph_t->arg2 = pDphsettar->f0las2;
        f0outd = mlsh1(pDph_t->arg1,pDph_t->arg2);
        f0out2 = f0outc + f0outd;
        pDphsettar->f0las2 = f0out2;
        pDph_t->f0 = f0out2 >> F0SHFT;	/* Unscaled fundamental frequency	   */

#if 0
//	printf(
//"[%s] pDphsettar->tarbas=%4d pDphsettar->tarhat=%3d pDphsettar->tarimp=%3d tarsum=%4d\n",
 //        phprint(pDph_t->allophons[pDphsettar->npg]), pDphsettar->tarbas, pDphsettar->tarhat, pDphsettar->tarimp, f0in);
#endif


/*    (Check for overloads if change filter tc or size of impulses) */
#if 0
	WINprintf("f0in=%6d   a=%6d b=%6d 1=%6d c=%6d d=%6d 2=%6d\n",
	 f0in, f0outa, f0outb, f0out1, f0outc, f0outd, f0out2);
#endif
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*	    F I L T E R - S E G M E N T A L - C O M M A N D S		 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
static void filter_seg_commands(PDPH_T pDph_t,short f0in) 

{		/* Convert 'f0in' command to smoothed 'pDphsettar->f0s' 
		Input is realy tarseg comment about f0in is wrong*/

        short f0souta, f0soutb, f0soutc, f0soutd, f0sout1, f0sout2;
		PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;
/*    First pole (separate into 2 poles to min truncation errors) */
        pDph_t->arg1 = pDphsettar->f0sa1;
        pDph_t->arg2 = pDphsettar->tarseg;
        f0souta = mlsh1(pDph_t->arg1,pDph_t->arg2);
        pDph_t->arg1 = pDphsettar->f0sb;
        pDph_t->arg2 = pDphsettar->f0slas1;
        f0soutb = mlsh1(pDph_t->arg1,pDph_t->arg2);
        f0sout1 = f0souta + f0soutb;
        pDphsettar->f0slas1 = f0sout1;
/*    Second pole */
        pDph_t->arg1 = pDphsettar->f0sa2;
        pDph_t->arg2 = f0sout1 + (pDphsettar->tarseg1 << F0SHFT);	/* Use only one pole */
		pDphsettar->tarseg1 -=1;
        f0soutc = mlsh1(pDph_t->arg1,pDph_t->arg2);
        pDph_t->arg1 = pDphsettar->f0sb;
        pDph_t->arg2 = pDphsettar->f0slas2;
        f0soutd = mlsh1(pDph_t->arg1,pDph_t->arg2);
        f0sout2 = f0soutc + f0soutd;
        pDphsettar->f0slas2 = f0sout2;
        pDph_t->f0s = f0sout2 >> F0SHFT;  /* Unscaled fundamental frequency	   */

#if 0
	WINprintf("[%s] pDphsettar->tarseg=%3d pDphsettar->tarseg1=%3d\n",
	phprint(pDph_t->allophons[pDphsettar->npg]), pDphsettar->tarseg, pDphsettar->tarseg1);
#endif
/*    (Check for overloads if change filter tc or size of impulses) */
#if 0
	WINprintf("  a=%6d b=%6d 1=%6d c=%6d d=%6d 2=%6d  pDphsettar->f0s=%4d\n",
	 f0souta, f0soutb, f0sout1, f0soutc, f0soutd, f0sout2, pDphsettar->f0s);
#endif
}



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*		S I N G - O R - L I N E A R - I N T E R P		 */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
static void linear_interp(PDPH_T pDph_t) 

 {
	PDPHSETTAR_ST pDphsettar = pDph_t->pSTphsettar;
	pDphsettar->delcum += pDphsettar->delnote;
	pDph_t->f0 = pDphsettar->f0start + (pDphsettar->delcum >> 2);

	if (pDphsettar->delnote >= 0) {			/* Do not overshoot pDphsettar->newnote */
	    if (pDph_t->f0 > pDphsettar->newnote) {
		pDph_t->f0 = pDphsettar->newnote;
		pDphsettar->f0start = pDphsettar->newnote;
		pDphsettar->delcum = 0;
		pDphsettar->delnote = 0;
	    }
	}
	else {
	    if (pDph_t->f0 < pDphsettar->newnote) {
		pDph_t->f0 = pDphsettar->newnote;
		pDphsettar->f0start = pDphsettar->newnote;
		pDphsettar->delcum = 0;
		pDphsettar->delnote = 0;
	    }
	}
	pDph_t->f0prime = pDph_t->f0;				/* To be scaled by spdef */

	if (pDphsettar->vibsw == 1) 
	{			/* Singing */
/*	  Add vibratto of 6.2 Hz (25 frames/cycle), +/- 2.05 Hz ampl. */
	    pDphsettar->timecosvib += 165;
	    if (pDphsettar->timecosvib > TWOPI)    
			pDphsettar->timecosvib -= TWOPI;
	    pDph_t->f0prime += getcosine[pDphsettar->timecosvib>>6] >> 3;
	}
}


 

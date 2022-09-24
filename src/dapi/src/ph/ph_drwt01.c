/*			    P H D R A W T 0 . C				*/
/* Copyright	1988				by Dennis H. Klatt	*/
/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 * 0011  04/11/97 EAB	Found that some variables (cos functions) were getting niialized at the wrong time 
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
 *	0033  EAB		04/8/98		Ginger found ENGLISH UK in code instead of ENGLISH_UK this would affect NWSNOAA
 *	0034  GL		5/04/98		use dt_abort to replace exit(1)
 *	0035  EAB		5/23/94		Glotal stop not reset in Spanish BATS 674
 */


 

 
//#define NWSNOAA
#if (defined NWSNOAA) || (defined ENGLISH_UK)

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
#define TWOPI	4096			/* For getcosine() function below */
#define PI	2048
#define PIOVER2	1024
#define ONE	(PIOVER2*PIOVER2)
/* #define GRAPHF0*/
/*#define DEBUGF0*/
/* #define DEBUG_USER_PROSODICS */

#define HIGHEST_F0	  5121	/*  Maximum F0 in Hz*10	*/
#define LOWEST_F0	   500	/*  Minimum F0 in Hz*10	*/
#define NEWBASELINE 
#define F_SEG_LOWPASS	  3000	/* Nominal cutoff freq of 1-pole low-pass    */
#define DELAY_SEG_LOWPASS    4	/* Delay in frames to half-way of step resp. */
#define F0SHFT		     3	/* Shift to avoid roundoff errors in	     */
				/*   filtering f0 commands		     */

/*    External constants from PHROM.C */
										/* extern short f0glstp[]; *//* F0 dip for a glottal stop */
	extern short            us_f0segtars[];   /* Array of segmental influences */
	extern short             us_place[];	/* Feature values for phonemes */
	//extern short us_featb[];		/* Feature values for phonemes */
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
	short f0seg=0,f0in=0;/*,pDphsettar->f0command=0*/;			  /*MVP : Made as local variable*/

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

		pDphsettar->phocur = SIL;
#ifdef NEWBASELINE
		/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
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
		pDph_t->f0basetypes[2][11]=940;
		pDph_t->f0basetypes[2][12]=938;
		pDph_t->f0basetypes[2][13]=924;
		pDph_t->f0basetypes[2][14]=1010;
		pDph_t->f0basetypes[2][15]=1014;
		pDph_t->f0basetypes[2][16]=1018;
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
#else
		
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
		pDph_t->f0basetypes[0][14]=1010;
		pDph_t->f0basetypes[0][15]=980;
		pDph_t->f0basetypes[0][16]=880;
#endif

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

	
		if(pDph_t->number_words > 3)
			pDph_t->f0baseline = pDph_t->f0basetypes[0];
		
		else
			pDph_t->f0baseline = pDph_t->f0basetypes[1];


#endif 
	
		/*NEWBASELINE*/
/*	  Set Beginning and final frequency of baseline fall */
#ifndef NEWBASELINE
	    pDphsettar->f0basestart = 1070 + (pDph_t->f0basefall>>1);	/* 107 Hz plus */
	    pDphsettar->f0endfall = 1070 - (pDph_t->f0basefall>>1);
		
#else
		pDphsettar->f0basestart = pDph_t->f0baseline[0];
	
		pDphsettar->f0endfall = pDph_t->f0baseline[16];
#endif
		pDphsettar->beginfall = pDphsettar->f0basestart;
	    pDphsettar->endfall = pDphsettar->f0endfall;
/*        Time since last reset of baseline fall, in frames */
		pDphsettar->nframb = 0;
#ifdef NEWBASELINE
		pDphsettar->basetime =0;
		pDphsettar->basecntr =0;
		pDphsettar->f0delta =0;

	
#endif /*NEWBASELINE*/
		/*eab 4/11/97 Moved these variables to a proper place of initlaization*/
		pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0;	
	
/*        If within 32 ms (5 frames) of nframg, glottal stop gesture */
/*        is in progress */
		pDphsettar->tglstp = -200;
			
/*        Set filter memory to init baseline fall (f0 in hz*10) */
		pDphsettar->f0las1 = pDphsettar->f0basestart << F0SHFT;
		pDphsettar->f0las2 = pDphsettar->f0basestart << F0SHFT;
		oarcnt=0;
		pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
		pDphsettar->f0slas2 = 0;
		pDph_t->f0 = pDphsettar->f0basestart;
		pDphsettar->tarhat = 0;
		pDphsettar->tarimp = 0;
		pDphsettar->delimp = 0;
/*        Set smoothing constants for (critical-damped?) 2nd-order sys */
		pDphsettar->f0a2 = pDph_t->f0_lp_filter;	/* Impulse and hat commands */
		pDphsettar->f0b = FRAC_ONE - pDphsettar->f0a2;
		pDphsettar->f0a1 = pDphsettar->f0a2 << F0SHFT;
		pDphsettar->f0sa2 =  F_SEG_LOWPASS;	/* Segmental influences */
		pDphsettar->f0sb = FRAC_ONE - pDphsettar->f0sa2;
		pDphsettar->f0sa1 = pDphsettar->f0sa2 << F0SHFT;
/*	  Variables relevent only if f0mode>=SINGING */
		pDphsettar->newnote = pDphsettar->f0basestart;
		pDphsettar->delnote = 0;
		pDphsettar->delcum = 0;
		pDphsettar->f0start = pDph_t->f0;
		pDphsettar->vibsw = 0;      
/*        Initialize pointer to f0 command string */
		pDph_t->nf0ev = -1;
	}

/*    Reinit pointer and time of first f0 command if new clause */
    if (pDph_t->nf0ev == -1) 
	{			/* Soft initialization */
/*	  Set Beginning and final frequency of baseline fall */
	switch (pDph_t->clausetype)
	{
	case 0:

		if(pDph_t->number_words > 3)
			pDph_t->f0baseline = pDph_t->f0basetypes[0];
		
		else
			pDph_t->f0baseline = pDph_t->f0basetypes[1];
		break;
	case 2:
		break;
	case 3:
		pDph_t->f0baseline = pDph_t->f0basetypes[3];
		break;
	default:
		break;
	}

			



		oarcnt=0;
#ifdef NEWBASELINE
	if(pDph_t->number_words >= 3)
			{
				pDph_t->f0baseline = pDph_t->f0basetypes[0];

			}
			else
				pDph_t->f0baseline = pDph_t->f0basetypes[1];
#endif /*NEWBASELINE*/

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
		pDphsettar->f0basestart;
		oarcnt=0;
/*	  Raise baseline for first sentence of a paragraph */
	    if (pDph_t->newparagsw != FALSE) {
		pDphsettar->beginfall += 120;
		pDphsettar->endfall += 70;
		pDph_t->newparagsw = FALSE;
	    }

/*        Time between next and last f0 command, in frames */
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


		pDphsettar->nfram = 0;
        pDphsettar->nframg = 0;


/* Time since beginning of cur phonetic segment, in frames */
		  pDphsettar->f0las1 = pDphsettar->f0basestart << F0SHFT;
            pDphsettar->f0las2 = pDphsettar->f0basestart << F0SHFT;
			oarcnt=0;
	    pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
	    pDphsettar->f0slas2 = 0;
        pDph_t->f0 = pDphsettar->f0basestart;
        pDphsettar->nframs = 0;		
		/* Used in computing segmental effects */
#ifdef NEWBASELINE
	if(pDph_t->number_words >= 3)
			{
				pDph_t->f0baseline = pDph_t->f0basetypes[0];

			}
			else
				pDph_t->f0baseline = pDph_t->f0basetypes[1];
#endif /*NEWBASELINE*/
	
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
			
		case GLOTTAL:
#ifdef ENGLISH_UK
			break;
#endif
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
					with a downward slope think of it as a rectangular pulse with a triangle placed on\
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
#if  defined (NEWBASELINE) && defined (ENDDROP)

		/*EAB Drop pitch rapidly at very end of utterance
		9/19/97 */
		if(pDphsettar->nframb >  pDph_t->tcumdur-12
			&& pDph_t->glotalize  && pDph_t->number_words > 3)
		{
			 if( pDph_t->enddrop <900)
			 {
				 pDph_t->enddrop +=100;
			 }
			
		}
		else
			pDph_t->enddrop=0;
#endif
					



#ifdef NEWBASELINE			
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
#endif /*NEWBASELINE*/
#ifndef NEWBASELINE
	
		pDphsettar->tarbas = pDphsettar->f0basestart - pDphsettar->nframb;
#else
			
		if(	pDphsettar->tarbas > 500)
		{
			/* Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality */
				pDph_t->scaled_enddrop= frac4mul ( pDph_t->enddrop, pDph_t->assertiveness);
				pDphsettar->tarbas = pDphsettar->lastbase-pDph_t->scaled_enddrop;
		}
		else
				pDphsettar->tarbas = pDphsettar->lastbase;
	
#endif
  //WINprintf("dur %d pDphsettar->tarbas %d phon %d \n",pDphsettar->basetime,pDphsettar->tarbas,pDph_t->allophons[pDphsettar->np_drawt0]);
#ifndef NEWBASELINE
   if (pDphsettar->tarbas > pDphsettar->endfall)
	{
		
	pDphsettar->nframb++;
	}
#else
	pDphsettar->nframb++;
#endif



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
			
            if (pDphsettar->np_drawt0 < pDph_t->nallotot)  
					pDphsettar->phonex_drawt0 = pDph_t->allophons[pDphsettar->np_drawt0+1];
		

/*        Set next f0 segmental incremental target */

	   // f0seg = pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[phocur].us_f0segtars;
	f0seg = us_f0segtars[pDphsettar->phocur & PVALUE];
/*	  Effect is half as much in unstressed segments */
	    if ((pDph_t->allofeats[pDphsettar->np_drawt0] & FSTRESS) IS_MINUS) {
		f0seg = f0seg >> 1;
	    }
            pDphsettar->extrad = -DELAY_SEG_LOWPASS;	/* Assume like V-V trans */
						/* so start new target early */
/*        Delay start of f0 rise for upcoming voiceless segment until boundary */
            if ((phone_feature( pDph_t,pDphsettar->phonex_drawt0) & FVOICD) IS_MINUS) {
                pDphsettar->extrad = 0;			/* All of rise during voicless */
            }
/*        Delay f0 fall from voiceless plosive until vot (when glottis closes)*/
            if ((phone_feature( pDph_t,pDphsettar->phocur) & FVOICD) IS_MINUS) {
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
#ifndef ENGLISH_UK
	set_tglst(pDph_t);		
#endif
	/* Set times of f0 fall pDphsettar->tglstp,pDphsettar->tglstn */

	if (pDph_t->f0mode< SINGING) {

/*	  Filter f0 step and impulse commands to produce next value f0 */
		/* increment gilde towards target and cancel increment when as close as poss to target
		eab 1/21/98 */
		pDphsettar->glide_tot += pDphsettar->glide_inc;
//	WINprintf("male%d %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0]);
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

	//	pDphsettar->tarseg += pDphsettar->glide_tot;
	    filter_seg_commands(pDph_t,f0in);	/* Input is pDphsettar->tarseg, output is pDphsettar->f0s */
#ifdef NWSNOAALATER
		pDph_t->f0s += frac4mul(pDph_t->f0s, pDph_t->f0segscalefac+7000);
#endif
		
	    filter_commands(pDph_t,f0in);		/* Input is f0in,   output is f0  */
		/* Add in glide value to F0 eab 1/21/98*/
	    pDph_t->f0prime = pDph_t->f0+ pDph_t->f0s +pDphsettar->glide_tot;	/* This will be spdef-scaled output value */
	//	WINprintf("male%d %d  pDph_t->f0 %d \n", pDphsettar->glide_tot, pDph_t->allophons[pDphsettar->np_drawt0],
//			pDph_t->f0);

	/* 11/23/97 Eab creek for male voice only for now*/
#ifdef CREEKMALE
		if(pDph_t->scaled_enddrop > 600  )
		{
			pDph_t->f0prime = pDph_t->f0prime >>1;
		}
		WINprintf( "phocur %d %d %d F0in %d \n",pDphsettar->phocur, pDphsettar->tarbas, pDph_t->enddrop, pDph_t->f0prime);
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
	    pDph_t->arg2 = 500;//pDph_t->f0flutter;
		/* "FLUTTER" spdef parameter, 10% -> +/-1 Hz, */
	    pDph_t->f0prime += mlsh1(pDph_t->arg1,pDph_t->arg2);	
		/*  100% corresp. to +/- 10 Hz max flutter */
	}

/*    Introduce variability to period at startup from a voiceless interval */
/*	not implemented */

/*    Scale f0 according to current speaker definition, the number 120 is
 *    the nominal average pitch of Paul's voice (AP in spdef)  */
#ifdef Experimenting
	pDph_t->f0what = pDph_t->f0prime - pDph_t->f0primelast;
	if(pDph_t->f0what <0)
		pDph_t->f0what=-pDph_t->f0what;
	pDph_t->f0temp=pDph_t->f0prime;

	if(pDph_t->f0what <600 && pDph_t->doit)
	{
		pDph_t->f0prime=pDph_t->f0primelast;
	}

#endif
	if (pDph_t->f0mode< SINGING) {
	    pDph_t->f0prime = pDph_t->f0minimum
		+ frac4mul((pDph_t->f0prime - 1200), pDph_t->f0scalefac);
	}
		
	pDph_t->f0primelast= pDph_t->f0prime; /*tense mode*/
//pDph_t->f0primelast= pDph_t->f0temp;
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
	/*WINprintf("TARBAS %d phone %d  tarhat=%3d tarimp=%3d  f0 =%d \n",
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

		pDphsettar->phocur = SIL;
#ifdef NEWBASELINE
		/*Question*/
		pDph_t->glotalize =0;
		pDphsettar->glide_step=0;
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
		pDph_t->f0basetypes[2][11]=940;
		pDph_t->f0basetypes[2][12]=938;
		pDph_t->f0basetypes[2][13]=924;
		pDph_t->f0basetypes[2][14]=1010;
		pDph_t->f0basetypes[2][15]=1014;
		pDph_t->f0basetypes[2][16]=1018;

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
		pDph_t->f0basetypes[0][14]=1010;
		pDph_t->f0basetypes[0][15]=980;
		pDph_t->f0basetypes[0][16]=880;

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

	
		if(pDph_t->number_words > 3)
			pDph_t->f0baseline = pDph_t->f0basetypes[0];
		
		else
			pDph_t->f0baseline = pDph_t->f0basetypes[1];


#endif 

		/*NEWBASELINE*/
/*	  Set Beginning and final frequency of baseline fall */
#ifndef NEWBASELINE
	    pDphsettar->f0basestart = 1070 + (pDph_t->f0basefall>>1);	/* 107 Hz plus */
	    pDphsettar->f0endfall = 1070 - (pDph_t->f0basefall>>1);
		
#else
		pDphsettar->f0basestart = pDph_t->f0baseline[0];
	
		pDphsettar->f0endfall = pDph_t->f0baseline[16];
#endif
		pDphsettar->beginfall = pDphsettar->f0basestart;
	    pDphsettar->endfall = pDphsettar->f0endfall;
/*        Time since last reset of baseline fall, in frames */
		pDphsettar->nframb = 0;
#ifdef NEWBASELINE
		pDphsettar->basetime =0;
		pDphsettar->basecntr =0;
		pDphsettar->f0delta =0;

	
#endif /*NEWBASELINE*/
		/*eab 4/11/97 Moved these variables to a proper place of initlaization*/
		pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0;	
	
/*        If within 32 ms (5 frames) of nframg, glottal stop gesture */
/*        is in progress */
		pDphsettar->tglstp = -200;
			
/*        Set filter memory to init baseline fall (f0 in hz*10) */
		pDphsettar->f0las1 = 0;//pDphsettar->f0basestart << F0SHFT;
		pDphsettar->f0las2 = 0;//pDphsettar->f0basestart << F0SHFT;
		oarcnt=0;
		pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
		pDphsettar->f0slas2 = 0;
		pDph_t->f0 = pDphsettar->f0basestart;
		pDphsettar->tarhat = 0;
		pDphsettar->tarimp = 0;
		pDphsettar->delimp = 0;
/*        Set smoothing constants for (critical-damped?) 2nd-order sys */
		pDphsettar->f0a2 = pDph_t->f0_lp_filter;	/* Impulse and hat commands */
		pDphsettar->f0b = FRAC_ONE - pDphsettar->f0a2;
		pDphsettar->f0a1 = pDphsettar->f0a2 << F0SHFT;
		pDphsettar->f0sa2 =  F_SEG_LOWPASS;	/* Segmental influences */
		pDphsettar->f0sb = FRAC_ONE - pDphsettar->f0sa2;
		pDphsettar->f0sa1 = pDphsettar->f0sa2 << F0SHFT;
/*	  Variables relevent only if f0mode>=SINGING */
		pDphsettar->newnote = pDphsettar->f0basestart;
		pDphsettar->delnote = 0;
		pDphsettar->delcum = 0;
		pDphsettar->f0start = pDph_t->f0;
		pDphsettar->vibsw = 0;      
/*        Initialize pointer to f0 command string */
		pDph_t->nf0ev = -1;
	}

/*    Reinit pointer and time of first f0 command if new clause */
    if (pDph_t->nf0ev == -1) 
	{			/* Soft initialization */
/*	  Set Beginning and final frequency of baseline fall */
	switch (pDph_t->clausetype)
	{
	case 0:

		if(pDph_t->number_words > 3)
			pDph_t->f0baseline = pDph_t->f0basetypes[0];
		
		else
			pDph_t->f0baseline = pDph_t->f0basetypes[1];
		break;
	case 2:
		break;
	case 3:
		pDph_t->f0baseline = pDph_t->f0basetypes[3];
		break;
	default:
		break;
	}

			



		oarcnt=0;
#ifdef NEWBASELINE
	if(pDph_t->number_words >= 3)
			{
				pDph_t->f0baseline = pDph_t->f0basetypes[0];

			}
			else
				pDph_t->f0baseline = pDph_t->f0basetypes[1];
#endif /*NEWBASELINE*/

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
		pDphsettar->f0basestart;
		oarcnt=0;
/*	  Raise baseline for first sentence of a paragraph */
	    if (pDph_t->newparagsw != FALSE) {
		pDphsettar->beginfall += 120;
		pDphsettar->endfall += 70;
		pDph_t->newparagsw = FALSE;
	    }

/*        Time between next and last f0 command, in frames */
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


		pDphsettar->nfram = 0;
        pDphsettar->nframg = 0;


/* Time since beginning of cur phonetic segment, in frames */
		  pDphsettar->f0las1 = 0;//pDphsettar->f0basestart << F0SHFT;
            pDphsettar->f0las2 =0;// pDphsettar->f0basestart << F0SHFT;
			oarcnt=0;
	    pDphsettar->f0slas1 = 0;	/* Segmental filter avg output is zero */
	    pDphsettar->f0slas2 = 0;
        pDph_t->f0 = pDphsettar->f0basestart;
        pDphsettar->nframs = 0;		
		/* Used in computing segmental effects */
#ifdef NEWBASELINE
	if(pDph_t->number_words >= 3)
			{
				pDph_t->f0baseline = pDph_t->f0basetypes[0];

			}
			else
				pDph_t->f0baseline = pDph_t->f0basetypes[1];
#endif /*NEWBASELINE*/
	
/*        Extra time, in frames, used to delay or advance f0 gesture assoc. */
/*        with a particular segment, e.g. at delayed vot, or anticipate in V-V */
            pDphsettar->extrad = -DELAY_SEG_LOWPASS; /* Start gesture toward next seg early */
/*        Duration of current segment, in frames */
            pDphsettar->segdur = 0;
            pDphsettar->segdrg = 0;
			pDph_t->lastallo=0;
			pDph_t->keepallo=0;
#ifdef GFAPHF0
			pDphsettar->lastone=-1;
			pDph_t->keepdur=0;
#endif
			pDph_t->glotalize =0;
			pDph_t->glotalize =0;
			pDphsettar->glide_step=0;
			pDphsettar->glide_tot=0;
			pDphsettar->glide_inc =0;
/*	  Must be at bottom of hat */
	    pDphsettar->tarhat = 0;	    /* should be anyway, except for emergency halt */
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

			 pDphsettar->tarhat = 0;		/* Go to bottom of hat pattern */
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
		case GLOTTAL:
#ifdef ENGLISH_UK
			break;
#endif
			
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
					with a downward slope think of it as a rectangular pulse with a triangle placed on\
					top instead of a second rectangular pulse- by the way it's not working correctly at
					the moment*/
			pDphsettar->tarimp = pDphsettar->f0command;
			
			pDphsettar->delimp = pDphsettar->f0command>>2;
			// pDphsettar->nimp = 24 - ((pDph_t->f0_lp_filter-1300)>>8);
			pDphsettar->nimp = 20 - ((pDph_t->f0_lp_filter-1300)>>8);
			break;

			case SHORTIMPULSE:
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
					with a downward slope think of it as a rectangular pulse with a triangle placed on\
					top instead of a second rectangular pulse- by the way it's not working correctly at
					the moment*/
			pDphsettar->tarimp = pDphsettar->f0command;
			
			pDphsettar->delimp = 0;pDphsettar->f0command>>2;
			// pDphsettar->nimp = 24 - ((pDph_t->f0_lp_filter-1300)>>8);
			pDphsettar->nimp = 5 - ((pDph_t->f0_lp_filter-1300)>>8);
			break;


		}
		}
		
		
            

/*        Loop back to look for more f0 commands */
        }
#if  (defined NEWBASELINE) && (defined ENDDROP)

		/*EAB Drop pitch rapidly at very end of utterance
		9/19/97 */
		if(pDphsettar->nframb >  pDph_t->tcumdur-14
			&& pDph_t->glotalize  && pDph_t->number_words > 3)
		{
			 if( pDph_t->enddrop <1600)
			{
				 pDph_t->enddrop +=180;
			 }
			 			
		}
		else
			pDph_t->enddrop=0;
		
	
		

#endif
					



#ifdef NEWBASELINE			
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
#endif /*NEWBASELINE*/
#ifndef NEWBASELINE
	
		pDphsettar->tarbas = pDphsettar->f0basestart - pDphsettar->nframb;
#else
		pDph_t->scaled_enddrop= frac4mul ( pDph_t->enddrop, pDph_t->assertiveness);	
		if(	pDphsettar->tarbas > 500)
		{
			/* Pitch falls are less pronounced for some speakers 
						 * to reduce impression of assertive personality */
				
				pDphsettar->tarbas = pDphsettar->lastbase-pDph_t->scaled_enddrop;
		}
		else
				pDphsettar->tarbas = pDphsettar->lastbase;
	
#endif
  //WINprintf("dur %d pDphsettar->tarbas %d phon %d \n",pDphsettar->basetime,pDphsettar->tarbas,pDph_t->allophons[pDphsettar->np_drawt0]);
#ifndef NEWBASELINE
   if (pDphsettar->tarbas > pDphsettar->endfall)
	{
		
	pDphsettar->nframb++;
	}
#else
	pDphsettar->nframb++;
#endif



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
			
            if (pDphsettar->np_drawt0 < pDph_t->nallotot)  
					pDphsettar->phonex_drawt0 = pDph_t->allophons[pDphsettar->np_drawt0+1];
		

/*        Set next f0 segmental incremental target */

	   // f0seg = pDph_t->gl_phones[pDph_t->gl_lang][pDph_t->gl_group].phonames[phocur].us_f0segtars;
	f0seg = us_f0segtars[pDphsettar->phocur & PVALUE];
/*	  Effect is half as much in unstressed segments */
	    if ((pDph_t->allofeats[pDphsettar->np_drawt0] & FSTRESS) IS_MINUS) {
		f0seg = f0seg >> 1;
	    }
            pDphsettar->extrad = -DELAY_SEG_LOWPASS;	/* Assume like V-V trans */
						/* so start new target early */
/*        Delay start of f0 rise for upcoming voiceless segment until boundary */
            if ((phone_feature( pDph_t,pDphsettar->phonex_drawt0) & FVOICD) IS_MINUS) {
                pDphsettar->extrad = 0;			/* All of rise during voicless */
            }
/*        Delay f0 fall from voiceless plosive until vot (when glottis closes)*/
            if ((phone_feature( pDph_t,pDphsettar->phocur) & FVOICD) IS_MINUS) {
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

	set_tglst(pDph_t);		
	/* Set times of f0 fall pDphsettar->tglstp,pDphsettar->tglstn */

	if (pDph_t->f0mode< SINGING) {
		//pDphsettar->glide_tot +=pDphsettar->glide_inc;
		//WINprintf("female %d %d \n", pDphsettar->glide_tot,pDph_t->allophons[pDphsettar->np_drawt0]);
		pDphsettar->glide_step -=pDphsettar->glide_inc;
		/*EAB 1/10/98 set glide_inc to zero if we've reached target*/
#ifdef OLDCODE
		if(pDphsettar->glide_inc > 0 )
		{
			if ( pDphsettar->glide_step < 3)
			{
				pDphsettar->glide_inc =0;
			}
		}
		else
		if(pDphsettar->glide_inc < 0 )
		{
			if ( pDphsettar->glide_step > -3)
			{
				pDphsettar->glide_inc =0;
			}
		}
#endif 

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
/*	  Filter f0 step and impulse commands to produce next value f0 */
		pDphsettar->glide_tot +=pDphsettar->glide_inc;
		

        f0in = ( pDphsettar->tarhat + (pDphsettar->tarimp));
		
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

		//pDphsettar->tarseg += pDphsettar->glide_tot;
	    filter_seg_commands(pDph_t,f0in);	/* Input is pDphsettar->tarseg, output is pDphsettar->f0s */

#ifdef NWSNOAALATER
		pDph_t->f0s += (pDph_t->f0s, pDph_t->f0segscalefac+7000);
#endif
		
	    filter_commands(pDph_t,f0in);		/* Input is f0in,   output is f0  */
	    pDph_t->f0prime = pDph_t->f0+pDphsettar->glide_tot;//+ pDph_t->f0s;	/* This will be spdef-scaled output value */
	

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
	    pDph_t->arg2 = 500;//pDph_t->f0flutter;
		/* "FLUTTER" spdef parameter, 10% -> +/-1 Hz, */
	    pDph_t->f0prime += mlsh1(pDph_t->arg1,pDph_t->arg2);	
		/*  100% corresp. to +/- 10 Hz max flutter */
	}

/*    Introduce variability to period at startup from a voiceless interval */
/*	not implemented */


/* Scale voice realtive to 1200 as a normal for paul*/

	if (pDph_t->f0mode< SINGING) {
	    
		pDph_t->f0prime = frac4mul((pDph_t->f0prime ), pDph_t->f0scalefac);
		/* make tarbas really an offset to average pitch so here 
		f0min is really average pitch*/
		pDph_t->f0prime += frac4mul((pDphsettar->tarbas -1000 ), 4100/* strength of deviation*/);
		 /* note 4100 ==1 i.e. no change*/
		pDph_t->f0prime += pDph_t->f0minimum -200;///eab 200 is a fudge factor*/
		/* eab where 200 is temp fudge factor while testing*/
		/* temporarily f0minimum is really tarbas scale factor*/
	}
	/* eab As a first step seperate baseline f0 scaling from segmental effects
	can't hurt should provide improvement path 11/2/97*/
	 pDph_t->f0prime +=  frac4mul(pDph_t->f0s, 000); 
/* This code should eventually be opened up to both the male and female code by
adjusting assertiveness etc. and adding in the creek code By=ut to keep the world flat
we wait til after NOAA*/


	 if(pDph_t->scaled_enddrop > 600 )
		{
			pDph_t->f0prime = pDph_t->f0prime >>1;
		}


		/*WINprintf( "phocur %d %d %d F0in %d \n",pDphsettar->phocur, pDphsettar->tarbas, pDph_t->enddrop, pDph_t->f0prime);*/
		
	 
#ifdef  NWSNOAA
if(pDph_t->oddeven == 1)
{
    pDph_t->oddeven =0;
	pDph_t->f0prime  = pDph_t->f0prime +(( pDph_t->f0primelast-pDph_t->f0prime)>>1);

	
}
else
{
	pDph_t->oddeven = 1;

}

#endif
	pDph_t->f0primelast= pDph_t->f0prime; /*tense mode*/

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
	/*WINprintf("TARBAS %d phone %d  tarhat=%3d tarimp=%3d  f0 =%d \n",
        pDphsettar->tarbas,pDph_t->allophons[pDphsettar->npg],pDphsettar->tarhat, pDphsettar->tarimp,
		pDph_t->f0prime); */
//	 if(0)
//	 pDph_t->parstochip[OUT_T0]=of0array[oarcnt++];


#ifdef GRAPHF0

	for (icnt=0;icnt<=80;icnt++)
		prntbuf[icnt]=' ';
	prntbuf[80]='\0';
	if(pDph_t->f0prime >2000) /* Female or childs voice scale to fit*/
			icnt=((pDph_t->f0prime)/10)>>1-50;
	else
		icnt=(pDph_t->f0prime)/10-70;
	if(icnt >=110)
		icnt=110;
	prntbuf[icnt]='*';
	//WINprintf("f0= %d\n",pDph_t->f0prime);
	WINprintf("%s\n",prntbuf);

	if(1)
		{

		 if(pDphsettar->np_drawt0 != pDphsettar->lastone)
			{
			if (pDphsettar->np_drawt0 >= 0)
				{
/*				dologphoneme(keepallo,keepdur,(f0prime/10));*/
				dologphoneme(phTTS,pDph_t->allophons[pDphsettar->np_drawt0],((pDph_t->allodurs[pDphsettar->np_drawt0]*NSAMP_FRAME/10)),(pDph_t->f0prime/10));
				WINprintf("\n");
				}
			pDph_t->keepdur = (pDph_t->allodurs[pDphsettar->np_drawt0]*NSAMP_FRAME/10);/*eab need to keep orig value of dur*/
			pDph_t->keepallo = pDph_t->allophons[pDphsettar->np_drawt0];
			pDphsettar->lastone = pDphsettar->np_drawt0;
			}
		}


	

#endif


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
/* dologphoneme(keepallo,keepdur,(pDph_t->f0prime/10)); */
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
			/* keepdur = (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10); */		
			/* eab need to keep orig value of dur */ 
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

} /* end of malfem stuff*/
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
            if (((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg+1]) & FVOWEL) IS_PLUS)
              && ((pDph_t->allofeats[pDphsettar->npg+1] & (FMEDIALSYL & FFINALSYL)) IS_MINUS)
              && ((pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FWBNEXT)
             /* && (pDph_t->allophons[pDphsettar->npg+1] != YU)*/) {
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
		else if ( ((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg]) & FPLOSV) IS_MINUS)
		  /*&& (pDph_t->allophons[pDphsettar->npg] != DX)*/
	          && ((pDph_t->allofeats[pDphsettar->npg+1] & FSTRESS_1) IS_PLUS) ) {
	            pDphsettar->tglstn = pDphsettar->segdrg;
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

		if ((us_place[pDph_t->allophons[pDphsettar->npg + 1] & PVALUE] & FGLOTTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}

		if ((us_place[pDph_t->allophons[pDphsettar->npg] & PVALUE] & FGLOTTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}
#ifdef GERMAN
		
			/* Rule 1a: The word "der" the r is an allophonic glottal stop before an unstressed syllable */
			if ((pDph_t->allophons[pDphsettar->npg] == GRP_RR)
				&& ((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg + 1]) & FVOWEL) IS_PLUS))
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



#if 0		/* OUT because using table generated by this routine */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/*                                                                     */
/*                   S U B R O U T I N E   G E T C O S I N E           */
/*                                                                     */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* Get next value of cosine, update time */

/* TEMPORARY Compute values for getcosine[] table in PHROM.C */
	static short initcosine;

	if (initcosine == 0) {
	    for (initcosine=0; initcosine<64; initcosine++) {
		WINprintf("cos[%2d] = %5d\n",
		 initcosine, getcosine(initcosine*64)>>6);
	    }
	    /*exit(1);*/
		dt_abort;

	}

getcosine(time) short time; {

	short temptime;
	int cosine;

/*    See if argument to sine function should be pi reversed		*/
	if (time > PI)    time = TWOPI - time;
/*    See if answer will be plus or minus				*/
	temptime = time;
	if (temptime > PIOVER2)    temptime = PI - temptime;
/*    Approximate sine by one minus t squared				*/
	cosine = (temptime * temptime) - ONE;
	if (time != temptime)    return(cosine);
	else    return(-cosine);
}
#endif
#else /*Non-NWSNOAA & Non-ENGLISH_UK next*/


/* #include        "phdefs.h" */
/* #include "phinst.h" */
#include "ph_def.h"
/* #define MSDBG */
/* #define MSDBG2 */
/* #define MSDBG3   #define MSDBG4 */

// #define DEBUGF0        

#define TWOPI   4096				   /* For getcosine() function below */
#define PI      2048
#define PIOVER2 1024
#define ONE     (PIOVER2*PIOVER2)

#ifdef GERMAN
/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* if CANIMP is set then impulses before steps of opposite sign */
/* are cancelled.                           */
/* if FASFIL is set then fast filter dynamics may be used.      */
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
						   /* #define   CANIMP   0 *//* cancel impulses before steps of opposite sign */
/* #define   FASFIL   9    enable fast filter */

#define   TSHIFT   5				   /* shift reach in target calculation */
/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
#endif

/***************************************************************************/
/* MVP : The following extern variables are now become elements of instance */
/* specific PH thread data structure DPH_T.                                */
/* Input arrays (set by call to PHSETTAR.C whenever time for new phone)    */
/* extern short    f0;              Unscaled current f0                    */
/* Output parameters:                                                      */
/* extern short parstochip[];       we modify T0 of output array           */
/* extern short avglstop;           Used to reduce AV during glstop        */
/* extern short    allophons[];     For calc of segmental influences       */
/* extern short    allofeats[];                                            */
/* extern short    allodurs[];                                             */
/* extern short    nallotot;                                               */
/* extern short    malfem;          Speaker def param indicating sex       */
/* Arguments for mlsh1, muldv(pDph_t->arg1,pDph_t->arg2,pDph_t->arg3)                                            */
/* extern short arg1, arg2, arg3;                                          */
/* extern   short   *user_durs;     Where user durations go.               */
/* extern   short   *user_f0;       Where user f0 commands go.             */
/* extern FLAG     newparagsw;      Set to 1 if new paragraph              */
/* extern short    f0mode;          NORMAL or USER_SPECIFIED               */
/* extern short    f0_lp_filter;    Cuttoff freq of f0 low-pass filter     */
/* extern short    f0minimum,f0scalefac,f0basefall;                        */
/* extern short    f0tar[];                                                */
/* extern short    f0tim[];                                                */
/* extern short    nf0ev;           Hard reset if enter with = -2          */
/* Soft reset if enter with = -1          */
/* extern short    nf0tot;                                                 */
/* extern short    f0prime;         Scaled output f0 (actual out is T0)    */
/* int             i, scnt = 0;		used in spanish for debugging		   */
/***************************************************************************/

/* Input variables */

#define HIGHEST_F0        5121		   /* Maximum F0 in Hz*10                  */
#define LOWEST_F0          500		   /* Minimum F0 in Hz*10                  */

#define F0SHFT               3		   /* Shift to avoid roundoff errors in    */
				/* filtering f0 commands              */

/* External constants from PHROM.C */
										/* extern short f0glstp[]; *//* F0 dip for a glottal stop */
extern short            us_f0segtars[];   /* Array of segmental influences */
extern short            us_featb[], us_place[];	/* Feature values for phonemes */

										/* extern short vibdel[]; *//* Trapezoidal vibratto spec */
extern short            notetab[];	   /* f0 target for notes C2-C5 (1-37) */
extern short            getcosine[];   /* Cos tab for jitter and/or vibratto */
extern short            randnum ();
short temp; /*for debugiing only*/
/* MVP : static function declarations */
static void             set_user_target (PDPH_T pDph_t, short *psF0command);
static void             filter_commands (PDPH_T pDph_t, short f0in);
static void             linear_interp (PDPH_T pDph_t);
static void             set_tglst (PDPH_T pDph_t);

/* Incremental time counters */
										  /* short keepdur,keepallo,lastallo; *//* MVP : They Made local to pht0draw() */
	/* static short nfram, nframb, nframs, nframg; */
	/* static short extrad, tglstp, tglstn, segdur, segdrg; */
/* Fundamental frequency variables */
	/* static short f0las1, f0las2, tarhat, tarimp, f0a2, f0b, f0a1; */
	/* static short dtimf0, phonex, f0seg, tarseg, tarseg1, beginfall, f0in; */
	/* static short firsttime,lastone,np, npg, nimp, pDphsettar->tarbas, endfall, phocur, f0command; */
	/* static short timecos6,timecos10,timecos15,timecosvib; */
	/* static short f0beginfall,f0endfall; */
/* For user-specified targets/singing notes */
	/* static short vibsw,newnote,delnote,delcum,f0start; */

 
/*
 *      Function Name: pht0draw()      
 *
 *  	Description: 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

void pht0draw (LPTTS_HANDLE_T phTTS)
{

	/* Automatic variables */
	short                   dtglst = 0;
	int                     pseudojitter = 0;
	short                   keepdur = 0, keepallo = 0;	/* MVP : short lastallo; value is never used */
	PKSD_T                  pKsd_t;
	PDPH_T                  pDph_t;
	PDPHSETTAR_ST           pDphsettar;
	short                   f0seg = 0, f0in = 0, phocur = 0, f0command = 0;		/* MVP : Made as local variable */

	pKsd_t = phTTS->pKernelShareData;
	pDph_t = phTTS->pPHThreadData;
	pDphsettar = pDph_t->pSTphsettar;

 /* Initialize , GL  6/11/1996*/
 /* EAB 4/11/1997 BATS#349 This code is re-intrant and these variables must be
    initalized only at a hard initaliazation otherwise the variablity there
	suppose to give doesn't happen moved init below to hard
	inital(occurrs with speaker def) */
/* pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0;*/

	if (pDph_t->nf0ev <= -2)
	{								   /* Hard initialization */
#ifdef GERMAN
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* hard initialization means also new sentence.           */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		pDph_t->new_sentence = TRUE;
		phocur = SIL;
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
#endif
		/* Set Beginning and final frequency of baseline fall */
		pDphsettar->f0beginfall = 1070 + (pDph_t->f0basefall >> 1);		/* 107 Hz plus */
		pDphsettar->f0endfall = 1070 - (pDph_t->f0basefall >> 1);
		/* Time since last reset of baseline fall, in frames */
		pDphsettar->nframb = 0;
		/* 
		 * If within 32 ms (5 frames) of nframg, glottal stop gesture 
		 * is in progress 
		 */
		pDphsettar->tglstp = -200;
		/* Set filter memory to init baseline fall (f0 in hz*10) */
		pDphsettar->f0las1 = pDphsettar->f0beginfall << F0SHFT;
		pDphsettar->f0las2 = pDphsettar->f0beginfall << F0SHFT;
		pDph_t->f0 = pDphsettar->f0beginfall;
		pDphsettar->tarhat = 0;
		/* firsttime = 1;  *//* MVP : Value is never used */
		pDphsettar->tarimp = 0;
		/* Set smoothing constants for critical-damped 2nd-order sys */
		pDphsettar->f0a2 = pDph_t->f0_lp_filter;
		pDphsettar->f0b = FRAC_ONE - pDph_t->f0_lp_filter;
		pDphsettar->f0a1 = pDphsettar->f0a2 << F0SHFT;
		/* Variables relevent only if f0mode=SINGING */
		pDphsettar->newnote = pDphsettar->f0beginfall;
		pDphsettar->delnote = 0;
		pDphsettar->delcum = 0;
		pDphsettar->f0start = pDph_t->f0;
		pDphsettar->vibsw = 0;
		/* EAB 4/11/97 BATS#349 Moved from enrance of code to initalization section*/
		 pDphsettar->timecos10=0; pDphsettar->timecos15=0; pDphsettar->timecosvib=0;
		/* Initialize pointer to f0 command string */
		pDph_t->nf0ev = -1;
	}

	/* Reinit pointer and time of first f0 command if new clause */
	if (pDph_t->nf0ev == -1)
	{								   /* Soft initialization */
		/* Set filter memory to init baseline fall (f0 in hz*10), GL 6/11/96 */
		pDphsettar->f0las1 = pDphsettar->f0beginfall << F0SHFT;
		pDphsettar->f0las2 = pDphsettar->f0beginfall << F0SHFT;

		/* Set Beginning and final frequency of baseline fall */
#ifdef SPANISH
		if (pDph_t->special_phrase == 1)
		{
			pDphsettar->beginfall = pDph_t->lastf0 - 50 + pDph_t->delta_special;
			pDphsettar->endfall = pDphsettar->f0endfall - 100; /* lastf0-(f0basefall>>1); */
			pDph_t->special_phrase = 0; 
		}
		else
		{
#endif
		pDphsettar->beginfall = pDphsettar->f0beginfall;
		pDphsettar->endfall = pDphsettar->f0endfall;
#ifdef SPANISH
		}
#endif
#ifdef DEBUGF0
		printf ("beginfall = %d endfall = %d\n", pDphsettar->beginfall, pDphsettar->endfall);
#endif
		pDphsettar->nframb = 0;

		/* Raise baseline for first sentence of a paragraph */
		if (pDph_t->newparagsw != FALSE)
		{
			pDphsettar->beginfall += 120;
			pDphsettar->endfall += 70;
#ifdef DEBUGF0
			printf ("At newpar sw %d %d	beginfall and endfall\n", pDphsettar->beginfall, pDphsettar->endfall);
#endif
			pDph_t->newparagsw = FALSE;
		}

		/* Time between next and last f0 command, in frames */
		pDphsettar->dtimf0 = pDph_t->f0tim[0];
		/* Pointer into dur and phone arrays */
		pDphsettar->np_drawt0 = -1;
		pDphsettar->npg = -1;
		pDph_t->nf0ev = 0;
		/* Time since beginning of cur phonetic segment, in frames */
		pDphsettar->nframs = 12 - (pDph_t->f0_lp_filter >> 8);
		/* Offset (in frames) to internal cum dur  */
		/* to compensate for low-pass filter time */
		/* constant (so that segmental influences */
		/* occur at right times.                  */
		/* Time since last f0 command, in frames */
		if (pDph_t->f0mode < SINGING)
		{
			pDphsettar->nfram = (pDphsettar->nframs >> 1);	/* Start note slightly early */
		}
		else
		{
			pDphsettar->nfram = 0;
		}
		pDphsettar->nframg = 0;
		/* 
		 * Extra time, in frames, used to delay f0 gesture assoc. 
		 * with a particular segment, e.g. at delayed vot 
		 */
		pDphsettar->extrad = 0;
		/* Duration of current segment, in frames */
		pDphsettar->segdur = 0;
		pDphsettar->segdrg = 0;
		/* lastallo =0; *//* MVP :Value is never used */
		keepallo = 0;
#ifdef GERMAN
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* tarhat is only set to 0 in case of soft initialization if a    */
		/* new sentence started.                      */
		/* reset working variables.                   */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if (pDph_t->new_sentence == TRUE)
		{
			pDphsettar->tarhat = 0;
		}
		pDph_t->gain = 0;
		pDph_t->dur1 = 0;
		pDph_t->tarold = 0;
		pDph_t->nstep = 0;
#endif
#ifdef ENGLISH
		pDphsettar->lastone = -1;
#endif
#ifdef GERMAN
		pDphsettar->lastone = -1;
#endif
#ifdef SPANISH
		pDphsettar->lastone = -1;
#endif

		keepdur = 0;
		/* Must be at bottom of hat */
		pDphsettar->tarhat = 0;		   /* should be anyway, except for emergency halt */
	}
	/* End of initialization */

	/* See if new f0 commands issued                                       */
	/* 
	 * To get f0 commands to occur at right times, need to take          
	 * into account delay introduced by low-pass filter. Response to     
	 * a step command begins xx frames earlier than f0time[] request     
	 * so f0 gets half-way to target at nominal step onset time          
	 */

	while ((pDphsettar->nfram >= pDphsettar->dtimf0) &&
		   ((pDph_t->nf0ev) < (pDph_t->nf0tot)))
	{

		f0command = pDph_t->f0tar[pDph_t->nf0ev];	/* New target f0 */

		pDphsettar->nfram -= pDphsettar->dtimf0;
		pDphsettar->dtimf0 = pDph_t->f0tim[++(pDph_t->nf0ev)];	/* Reset counter to begin of command */

		if (f0command == 0)
		{							   /* Reset baseline */
			pDphsettar->nframb = 0;	   /* Time from last reset in frames */
			pDphsettar->tarhat = 0;	   /* And go to bottom of hat pattern */
		}

		else if (f0command >= 2000)
		{
			set_user_target (pDph_t, &f0command);	/* Must be pDph_t->f0mode < SINGING */
		}

		else if ((f0command & 01) == 0)
#if defined (ENGLISH) || defined (SPANISH)
		{							   /* If f0command is even */
			pDphsettar->tarhat += f0command;	/* Command is a step, reset tarhat */
			if (f0command < 0)		   /* Cancel previous impulse if step */
				pDphsettar->tarimp = 0;

		}
#endif
#ifdef GERMAN
		{
			/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* tarhat is used differently in german DECtalk.           */
			/* step hight (tarhat) is added after filtering pass.      */
			/* this leads to independent baseline concerning lowpass filter.   */
			/* linear smooth of steps is achieved using gain factor.       */
			/* In german DECtalk, an impulse followed by a step of opposite    */
			/* sign may not be canceled (CANIMP 0) or emphatic stress in last  */
			/* syllable of sentence is not correctly treated.          */
			/* tarhat += f0command;    Command is a step, reset tarhat */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			pDph_t->tarold = pDphsettar->tarhat;
			pDphsettar->tarhat = f0command;		   /* used differently in german DECtalk */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* linear smooth of new target value during phoneme duration   */
			/* "(12 - (f0_lp_filter>>8))" compensates for delay introduced */
			/* by lowpass filter.                      */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			if ((pDphsettar->nframs >= (pDphsettar->segdur + pDphsettar->extrad)) && (pDphsettar->np_drawt0 < (pDph_t->nallotot - 1)))
			{
				pDph_t->dur1 = pDph_t->allodurs[pDphsettar->np_drawt0 + 1];
			}
			else
			{
				pDph_t->dur1 = pDph_t->allodurs[pDphsettar->np_drawt0] - pDphsettar->nframs +
					((12 - (pDph_t->f0_lp_filter >> 8)) >> 1);
			}
			if (pDph_t->dur1 > 0)
			{
				pDph_t->gain = ((pDphsettar->tarhat - pDph_t->tarold) << TSHIFT) / pDph_t->dur1;
			}
			else
			{
				pDph_t->gain = ((pDphsettar->tarhat - pDph_t->tarold) << TSHIFT);
			}
			pDph_t->nstep = 0;


			/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		}
#endif 
		else
		{							   /* Odd, command is impulse  */
			/* Impulse realized as 16-frame step of doubled amp */
			pDphsettar->tarimp = f0command + f0command;
#ifdef GERMAN
			pDphsettar->nimp =16 - ((pDph_t->f0_lp_filter - 1300) >> 8);
//endif
//#if defined (ENGLISH) || defined (SPANISH)
#else
			pDphsettar->nimp = 16 - ((pDph_t->f0_lp_filter - 1300) >> 8);
#endif
		}
#ifdef GERMAN
#ifdef FASFIL
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* if f0command is multiple of 5, then filter dynamics are set to  */
			/* fast. else restore normal filter parameters         */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			pDphsettar->f0a2 = pDph_t->f0_lp_filter;
			pDphsettar->f0b = FRAC_ONE - pDph_t->f0_lp_filter;
			pDph_t->arg1 = f0command / 10;
			if ((f0command - (10 * pDph_t->arg1)) == 5)
			{
				pDphsettar->f0b -= 10;
				pDphsettar->f0a2 += 50;
				pDphsettar->nimp = 12;

			}
			pDphsettar->f0a1 = pDphsettar->f0a2 << F0SHFT;
#endif
#endif
	/* Loop back to look for more f0 commands */
	}

/* Make baseline fall slowly (0.1 Hz / 6.4 ms) until it reaches endfall */


	pDphsettar->tarbas = pDphsettar->beginfall - pDphsettar->nframb;

	if (pDphsettar->tarbas > pDphsettar->endfall)
		pDphsettar->nframb++;

	/* Impulse duration fixed at 16 frames, count down to zero */
	/* (actually, duration is function of speaker def par "quickness" */

	if (--(pDphsettar->nimp) < 0)
	{
		pDphsettar->tarimp = 0;
#ifdef GERMAN
#ifdef FASFIL
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* if impulse was released with fast filter dynamics, change  */
		/* filter dynamics to allow pitch to go quickly back to the   */
		/* baseline.                          */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if (pDphsettar->nimp == 0)
		{
			if (pDphsettar->f0a2 > pDph_t->f0_lp_filter)
			{
				pDphsettar->f0a2 += 2100;
				pDphsettar->f0b -= 2000;
				pDphsettar->f0a1 = pDphsettar->f0a2 << F0SHFT;

			}
		}

#endif
#endif
	}

/* Segmental effect on f0, reset tarseg if time exceeds cum dur */
#ifdef MSDBG3
	printf ("nframs=%d segdur=%d extrad=%d np_drawt0=%d nallotot=%d\n", pDphsettar->nframs,
			pDphsettar->segdur, pDphsettar->extrad, pDphsettar->np_drawt0, pDph_t->nallotot);
#endif
	if ((pDphsettar->nframs >= (pDphsettar->segdur + pDphsettar->extrad)) &&
#ifdef GERMAN
		(pDphsettar->np_drawt0 < (pDph_t->nallotot -1  )))
#endif
#if defined (ENGLISH) || defined (SPANISH)
		(pDphsettar->np_drawt0 < (pDph_t->nallotot - 1)))
#endif
	{
		pDphsettar->nframs -= pDphsettar->segdur;
		pDphsettar->segdur = pDph_t->allodurs[++(pDphsettar->np_drawt0)];
		pDphsettar->extrad = 0;
		phocur = pDph_t->allophons[pDphsettar->np_drawt0];

		if (pDphsettar->np_drawt0 < pDph_t->nallotot)
		{
			pDphsettar->phonex_drawt0 = pDph_t->allophons[pDphsettar->np_drawt0 + 1];
		}
		/* Set next f0 segmental incremental target */
		f0seg = us_f0segtars[phocur & PVALUE];
#ifdef MSDBG
		printf ("f0seg=%d\n", f0seg);
#endif
		/* Effect is less in unstressed segments */
		if ((pDph_t->allofeats[pDphsettar->np_drawt0] & FSTRESS) IS_MINUS)
		{
			f0seg = f0seg >> 1;
		}
		/* Delay start of f0 rise for voiceless segment until bound */
		if ((phone_feature( pDph_t,pDphsettar->phonex_drawt0) & FVOICD) IS_MINUS)
		{
#ifdef GERMAN
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			/* use 2 instead of 4 for german DECtalk              */
			/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
			pDphsettar->extrad = 2;	   /* Was 4 when f0_lp_filter was 1536 */
#else
//#endif
//#if defined (ENGLISH) || defined (SPANISH)
			pDphsettar->extrad = 2;	   /* Was 4 when f0_lp_filter was 1536 */
#endif
		}
		/* Delay f0 fall from voiceless plosive until vot */
		if ((phone_feature( pDph_t,phocur) & FVOICD) IS_MINUS)
		{
			pDphsettar->tarseg1 = f0seg;	/* Gesture fast, go to only 1 lpfilter */
			pDphsettar->tarseg = 0;
			pDphsettar->extrad = 0;
			if ((phone_feature( pDph_t,phocur) & FPLOSV) IS_PLUS)
			{
#if defined (ENGLISH) || defined (SPANISH)
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				/* remove for german DECtalk, else intonation errors       */
				/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
				pDphsettar->extrad = 5;		/* Was 11 when f0_lp_filter was 1536 */
#endif
			}
#ifdef MSDBG
			printf ("if   tarseg=%d tarseg1=%d\n", pDphsettar->tarseg, pDphsettar->tarseg1);
#endif
		}
		else
		{
			pDphsettar->tarseg = f0seg;		/* Gesture slow, go to both lp filters */
			pDphsettar->tarseg1 = 0;
#ifdef MSDBG
			printf ("else tarseg=%d tarseg1=%d\n", pDphsettar->tarseg, pDphsettar->tarseg1);
#endif
		}
	}
	/* Glottal stop gesture, test at beginning of each phoneme */

	set_tglst (pDph_t);				   /* Set times of f0 fall tglstp,tglstn */

	if (pDph_t->f0mode < SINGING)
	{

	/* Filter f0 step and impulse commands to produce next value f0 */
	


#ifdef GERMAN

		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* tarhat influences f0 only after filter, take out old operation.    */
		/* f0in = (tarbas + tarhat + tarimp + tarseg);        */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	//	f0in = (pDphsettar->tarbas + pDphsettar->tarimp + pDphsettar->tarseg);

#endif
/* #if defined (ENGLISH) || defined (SPANISH) */

                f0in = (pDphsettar->tarbas + pDphsettar->tarhat +
                                pDphsettar->tarimp + pDphsettar->tarseg);

/* #endif */


#ifdef DEBUGF0
		WINprintf ("pDphsettar->tarbas %d tarhat %d	tarimp %d tarseg %d \n", pDphsettar->tarbas, pDphsettar->tarhat, pDphsettar->tarimp, pDphsettar->tarseg);
#endif
	
		/* Reduce segmental effect toward end of segment (98% per frame)  */

		pDph_t->arg1 = pDphsettar->tarseg;
		pDph_t->arg2 = 16064;
		pDphsettar->tarseg = mlsh1 (pDph_t->arg1, pDph_t->arg2);
#ifdef MSDBG2
		printf ("mlsh1 arg1=%d arg2=%d output=%d\n", pDph_t->arg1, pDph_t->arg2, pDphsettar->tarseg);
#endif

		filter_commands (pDph_t, f0in);
#ifdef GERMANtryout
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* linear step smooth operation for german DECtalk            */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if (pDph_t->nstep < pDph_t->dur1)
		{
			pDph_t->f0prime += pDph_t->tarold + ((pDph_t->gain * pDph_t->nstep++) >> TSHIFT);
		}
		else
		{
			pDph_t->f0prime += pDphsettar->tarhat;
		}
		/* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
#endif
	}

	else
	{

		/* Linear interpolation to 'newnote' over 100 ms or phoneme duration */
		/* Add vibratto if vibsw=1  */
		linear_interp (pDph_t);
	}

	/* Glottalization gesture */
	/* F0 dip by 60 Hz linear ramp in 8 frames each direction about tglstp */
	dtglst = pDphsettar->nframg - pDphsettar->tglstp;
	if (dtglst <0)
		dtglst = (-dtglst);
	if (dtglst <= 7)
		pDph_t->f0prime += ((dtglst * 70) - 550);
	/* And reduce AV somewhat (ugly code, but F0 computed before AV) */
	if (dtglst <= 5)
	{
		pDph_t->avglstop = (6 - dtglst);	/* Global variable, used in PHDRAW.C */
	}
	else
		pDph_t->avglstop = 0;

	/* Introduce variability to period at startup from a voiceless interval */

	/* See if f0 exceeds legal bounds, truncate  */
	if (pDph_t->f0prime > HIGHEST_F0)
	{
		pDph_t->f0prime = HIGHEST_F0;
	}
	else if (pDph_t->f0prime < LOWEST_F0)
	{
		pDph_t->f0prime = LOWEST_F0;
	}

	/* Scale f0 according to current speaker definition, the number 120 is *    the nominal average pitch of Paul's voice (AP in spdef)  */
	if (pDph_t->f0mode < SINGING)
	{
		pDph_t->f0prime = pDph_t->f0minimum
			+ frac4mul ((pDph_t->f0prime - 1200), pDph_t->f0scalefac);
#ifdef MSDBG
		printf ("f0prime=f0minimum f0prime=%d\n", pDph_t->f0prime);
#endif

		/* Add pseudo-jitter (approx 6,10,15-Hz sine waves, each +/-0.5 Hz) */
		pDphsettar->timecos15 += 43;   /* Prime number to reduce coincidence */
		/* WAS      timecos15 += 419; */
		if (pDphsettar->timecos15 > TWOPI)
			pDphsettar->timecos15 -= TWOPI;
		pDphsettar->timecos10 += 97;
		/* WAS      timecos10 += 277; */
		if (pDphsettar->timecos10 > TWOPI)
			pDphsettar->timecos10 -= TWOPI;
		/* MVP : The following lines are commented as the value of timecos6 is never used */
		/* timecos6 += 157; if (timecos6 > TWOPI)    timecos6 -= TWOPI;  */

		pseudojitter = getcosine[pDphsettar->timecos15 >> 6]
			+ getcosine[pDphsettar->timecos10 >> 6];
#ifdef MSDBG
		printf ("pseudojitter = getcosine[timecos15>>6] pseudojitter=%d\n", pseudojitter);
#endif
		/* OUT                   + getcosine[timecos6>>6];               END OUT */
		pDph_t->f0prime += (pseudojitter >> 5);
#ifdef MSDBG
		printf ("f0prime+=(pseudojitter >> 5) f0prime=%d\n", pDph_t->f0prime);
#endif

		/* See if f0 exceeds legal bounds, truncate */
		if (pDph_t->f0prime > HIGHEST_F0)
		{
			pDph_t->f0prime = HIGHEST_F0;
		}
		else if (pDph_t->f0prime < LOWEST_F0)
		{
			pDph_t->f0prime = LOWEST_F0;
		}
	}
	/* Change from Middle C = 256 Hz (A = 430.4) to A = 440 Hz */
	else if (pDph_t->f0mode == SINGING)
	{
		pDph_t->f0prime = frac4mul (pDph_t->f0prime, 4190);
#ifdef MSDBG
		printf ("frac4mul(f0prime,4190) f0prime=%d\n", pDph_t->f0prime);
#endif
	}

	/* Save value of period t0 in parameter array  */
	/* (ONLY ESSENTIAL DIVIDE INSTRUCTION IN ALL OF DECTALK) */
	pDph_t->arg1 = 400;
	pDph_t->arg2 = 1000;
	pDph_t->arg3 = pDph_t->f0prime;
	pDph_t->parstochip[OUT_T0]= temp = muldv (pDph_t->arg1, pDph_t->arg2, pDph_t->arg3);

#ifdef SPANISH
/* scnt++; 
 * if(scnt>=4) 
 * { 
 *	for (i=0;80-i;i++) 
 *	{ 
 *		printf(" "); 
 *		if(i==(int)((f0prime/10)>>1)-35) 
 *		{ 
 *			printf(" * "); break; 
 *		}
 *	} 
 *	scnt=0; 
 *	printf(" "); 
 * } 
 */

#endif
#ifdef MSDBG
	printf ("muldv arg1=%d arg2=%d arg3=%d result=%d\n", pDph_t->arg1, pDph_t->arg2, pDph_t->arg3, pDph_t->parstochip[OUT_T0]);
#endif
         
	/* printf("%d %d\n",f0prime,parstochip[OUT_T0]); */

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
/* dologphoneme(keepallo,keepdur,(pDph_t->f0prime/10)); */
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
			/* keepdur = (pDph_t->allodurs[pDphsettar->np_drawt0] * NSAMP_FRAME / 10); */		
			/* eab need to keep orig value of dur */ 
			/* keepallo = pDph_t->allophons[pDphsettar->np_drawt0]; */
			pDphsettar->lastone = pDphsettar->np_drawt0;
		}
	}
#ifdef SPANISH
	if (pDph_t->f0prime > 50)
	{
		pDph_t->lastf0 = pDph_t->f0prime;
	}         
#endif              
#ifdef GERMAN
	pDph_t->oldval=pDph_t->f0prime;
#endif

	/* Increment time counters */
	pDphsettar->nfram++;
	pDphsettar->nframs++;
	pDphsettar->nframg++;

#ifndef MSDOS
	pDph_t->parstochip[OUT_PH] = pDph_t->allophons[pDphsettar->np_drawt0];
	pDph_t->parstochip[OUT_DU] = pDph_t->allodurs[pDphsettar->np_drawt0];
#endif
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* S E T - U S E R - T A R G E T                    */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: set_user_target()      
 *
 *  	Description: 
 *
 *      Arguments:  PDPH_T pDph_t, 
 *					short *psF0command
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void set_user_target (PDPH_T pDph_t, short *psF0command)
{

	short                   trandur = 0;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	*psF0command -= 2000;
#ifdef DEBUG_USER_PROSODICS
	printf ("\tFound user *psF0command[%s] = %d in PHDRAWT0, pDph_t->f0mode = %d\n",
			phprint (phocur), *psF0command, pDph_t->f0mode);
#endif
	if (*psF0command <= 37)
	{								   /* Pointer to C5, highest possible sung note */

		pDphsettar->newnote = notetab[*psF0command - 1];
		pDphsettar->vibsw = 1;
		/* Set pDphsettar->delnote*4 so transition happens over 16 frames (100 ms) */
		pDphsettar->delnote = ((pDphsettar->newnote - pDph_t->f0) >> 2);
	}
	else
	{								   /* Straight-lines */
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
		/* Compute incremental change to f0*10 every frame */
		pDphsettar->delnote = (pDphsettar->newnote - pDph_t->f0) << 2;	/* f0 change times 40 */
		trandur = pDph_t->allodurs[pDphsettar->npg + 1];	/* Change to occur over next phone */
		if (pDphsettar->delnote > 0)
		{
			pDphsettar->delnote += (trandur - 1);	/* Round upward */
		}
		if (pDphsettar->delnote < 0)
		{
			pDphsettar->delnote -= (trandur - 1);	/* Round downward */
		}
		if (trandur != 0)
		{
			pDphsettar->delnote /= trandur;
		}
		else
		{
			pDphsettar->delnote = pDphsettar->delnote >> 3;		/* 8-frame (50 ms) transition */
		}
	}
	pDphsettar->delcum = 0;
	pDphsettar->f0start = pDph_t->f0;
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* S E T - T G L S T                                */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: set_tglst()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void set_tglst (PDPH_T pDph_t)
{
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	if (pDphsettar->nframg >= pDphsettar->segdrg)
	{
		pDphsettar->nframg -= pDphsettar->segdrg;
		pDphsettar->segdrg = pDph_t->allodurs[++(pDphsettar->npg)];
		/* Cancel glottal stop gesture that occurred at last phone onset */
		if (pDphsettar->tglstp == 0)
			pDphsettar->tglstp = -200;
		/* Start second half of glottal stop gesture */
		if (pDphsettar->tglstp > 0)
			pDphsettar->tglstp = 0;
		/* BATS 674 EAB 5/13/98 This code needs to be outside of ifdef */
		pDphsettar->tglstn = -200;
#if defined (ENGLISH) || defined (GERMAN)
		/* Insert glottal stop after cur seg */
		/* if next segment a vowel */
		/* and is next segment in first syllable */
		/* and is current segment in word-final rime */
		/* and is next segment not the diphthong /YU/ */
	
		if (((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg + 1]) & FVOWEL) IS_PLUS)
			&& ((pDph_t->allofeats[pDphsettar->npg + 1] & (FMEDIALSYL & FFINALSYL)) IS_MINUS)
			&& ((pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FWBNEXT)
#ifdef ENGLISH
			&& (pDph_t->allophons[pDphsettar->npg + 1] != USP_YU))
#endif
#ifdef GERMAN
			)
#endif
		{
			/* If cur seg is vowel, don't do it unless vowel ident, or pbound */
			if ((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg]) & FSYLL) IS_PLUS)
			{
				if (((pDph_t->allophons[pDphsettar->npg] == pDph_t->allophons[pDphsettar->npg + 1])
					 && ((pDph_t->allofeats[pDphsettar->npg + 1] & FSTRESS_1) IS_PLUS))
					|| ((pDph_t->allofeats[pDphsettar->npg] & FBOUNDARY) >= FVPNEXT))
				{
					pDphsettar->tglstn = pDphsettar->segdrg;
				}
			}
#ifdef GERMAN
			/* Rule 1a: The word "der" the r is an allophonic glottal stop before an unstressed syllable */
			if ((pDph_t->allophons[pDphsettar->npg] == GRP_RR)
				&& ((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg + 1]) & FVOWEL) IS_PLUS))
			{
				pDphsettar->tglstn = pDphsettar->segdrg;
			}
#endif
			
			/* If  next segment primary stressed, 
			 * and if curr seg a consonant other than a plosive, do it 
			 */
			else if (((phone_feature( pDph_t,pDph_t->allophons[pDphsettar->npg]) & FPLOSV) IS_MINUS)
#ifdef ENGLISH
					 && (pDph_t->allophons[pDphsettar->npg] != USP_DX)
#endif
					 && ((pDph_t->allofeats[pDphsettar->npg + 1] & FSTRESS_1) IS_PLUS))
			{
				pDphsettar->tglstn = pDphsettar->segdrg;
			}
		}
#endif /* #ifdef ENGLISH || GERMAN  */
		/* And at beginning and end of glottalized segs TQ and Q */
		if ((us_place[pDph_t->allophons[pDphsettar->npg + 1] & PVALUE] & FGLOTTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}
		if ((us_place[pDph_t->allophons[pDphsettar->npg] & PVALUE] & FGLOTTAL) IS_PLUS)
		{
			pDphsettar->tglstn = pDphsettar->segdrg;
		}
	}

	/* Wait until current gl stop gesture over before setting time of next one */
	else if ((pDphsettar->nframg == 8) ||
			 (pDphsettar->nframg == (pDphsettar->segdrg - 1)))
	{
		pDphsettar->tglstp = pDphsettar->tglstn;
	}
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* F I L T E R - C O M M A N D S                    */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

 
/*
 *      Function Name: filter_commands()      
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t, 
 *				   short f0in
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void filter_commands (PDPH_T pDph_t, short f0in)
{									   /* Convert 'f0in' command to smoothed 'f0' */

	short                   f0outa, f0outb, f0outc, f0outd, f0out1, f0out2;
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	/* First pole (separate into 2 poles to min truncation errors) */
	pDph_t->arg1 = pDphsettar->f0a1;
	pDph_t->arg2 = f0in;
	f0outa = mlsh1 (pDph_t->arg1, pDph_t->arg2);
#ifdef MSDBG2
	printf ("mlsh1 111 arg1=%d arg2=%d result=%d\n", pDph_t->arg1, pDph_t->arg2, f0outa);
#endif
	pDph_t->arg1 = pDphsettar->f0b;
	pDph_t->arg2 = pDphsettar->f0las1;
	f0outb = mlsh1 (pDph_t->arg1, pDph_t->arg2);
	f0out1 = f0outa + f0outb;
#ifdef MSDBG2
	printf ("mlsh1 222 arg1=%d arg2=%d result=%d\n", pDph_t->arg1, pDph_t->arg2, f0outb);
#endif
	pDphsettar->f0las1 = f0out1;
	/* Second pole */
	pDph_t->arg1 = pDphsettar->f0a2;
	pDph_t->arg2 = f0out1 + (pDphsettar->tarseg1 << F0SHFT);	/* Use only one pole */
	f0outc = mlsh1 (pDph_t->arg1, pDph_t->arg2);
#ifdef MSDBG2
	printf ("mlsh1 333 arg1=%d arg2=%d result=%d\n", pDph_t->arg1, pDph_t->arg2, f0outc);
#endif
	pDph_t->arg1 = pDphsettar->f0b;
	pDph_t->arg2 = pDphsettar->f0las2;
	f0outd = mlsh1 (pDph_t->arg1, pDph_t->arg2);
#ifdef MSDBG2
	printf ("mlsh1 444 arg1=%d arg2=%d result=%d\n", pDph_t->arg1, pDph_t->arg2, f0outd);
#endif
	f0out2 = f0outc	 + f0outd;
	pDphsettar->f0las2 = f0out2;
	pDph_t->f0 = f0out2 >> F0SHFT;	   /* Unscaled fundamental frequency          */
	pDph_t->f0prime = pDph_t->f0;	   /* This is going to be scaled output value */
#ifdef MSDBG
	printf ("mlsh1 f0las1=%d f0las2=%d f0=%d f0prime=%d\n", pDphsettar->f0las1, pDphsettar->f0las2, pDph_t->f0, pDph_t->f0prime);
#endif

#ifdef NOTHING
	printf (
			   "[%s] pDphsettar->tarbas=%4d tarhat=%3d tarseg=%3d tarseg1=%3d tarimp=%3d tarsum=%4d\n",
			   phprint (pDph_t->allophons[npg]), pDphsettar->tarbas, tarhat, tarseg, tarseg1,
			   tarimp, f0in);
#endif
/* (Check for overloads if change filter tc or size of impulses) */
#ifdef NOTHING
	printf ("f0in=%6d   a=%6d b=%6d 1=%6d c=%6d d=%6d 2=%6d\n",
			f0in, f0outa, f0outb, f0out1, f0outc, f0outd, f0out2);
#endif
}

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* S I N G - O R - L I N E A R - I N T E R P                */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/*
 *      Function Name: linear_interp()      
 *
 *  	Description: 
 *
 *      Arguments:  PDPH_T pDph_t
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static void linear_interp (PDPH_T pDph_t)
{
	PDPHSETTAR_ST           pDphsettar = pDph_t->pSTphsettar;

	pDphsettar->delcum += pDphsettar->delnote;
	pDph_t->f0 = pDphsettar->f0start + (pDphsettar->delcum >> 2);

	if (pDphsettar->delnote >= 0)
	{								   /* Do not overshoot newnote */
		if (pDph_t->f0 > pDphsettar->newnote)
		{
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
	pDph_t->f0prime = pDph_t->f0;	   /* To be scaled by spdef */

	if (pDphsettar->vibsw == 1)
	{								   /* Singing */
		/* Add vibratto of 6.2 Hz (25 frames/cycle), +/- 2.05 Hz ampl. */
		pDphsettar->timecosvib += 165;
		if (pDphsettar->timecosvib > TWOPI)
			pDphsettar->timecosvib -= TWOPI;
		pDph_t->f0prime += getcosine[pDphsettar->timecosvib >> 6] >> 3;
	}
}

#ifdef UNUSED_CODE_NOW_A_TABLE		   /* OUT because using table generated by this routine */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* */
/* S U B R O U T I N E   G E T C O S I N E           */
/* */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
/* Have no idea what to do with this... SIK */
 
/* Get next value of cosine, update time */

/* TEMPORARY Compute values for getcosine[] table in PHROM.C */
static short initcosine;

if (initcosine == 0)
{
	for (initcosine = 0; initcosine < 64; initcosine++)
	{
		printf ("cos[%2d] = %5d\n",
				initcosine, getcosine (initcosine * 64) >> 6);
	}
	/*exit (1);*/
	dt_abort;

}
 
/*
 *      Function Name: getcosine()     
 *
 *  	Description: 
 *
 *      Arguments: short time
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

int getcosine (short time)
{

	short                   temptime;
	int                     cosine;

	/* See if argument to sine function should be pi reversed            */
	if (time > PI)
		time = TWOPI - time;
	/* See if answer will be plus or minus                               */
	temptime = time;
	if (temptime > PIOVER2)
		temptime = PI - temptime;
	/* Approximate sine by one minus t squared                           */
	cosine = (temptime * temptime) - ONE;
	if (time != temptime)
		return (cosine);
	else
		return (-cosine);
}
#endif
/******************************end of phdrawt0.c***********************************/
#endif /*NWSNOAA*/

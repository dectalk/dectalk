/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incoporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    p_uk_vdf.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *      Speaker defs for:
 *              1. PAUL
 *              2. BETTY
 *              3. HARRY
 *              4. FRANK
 *              5. DENNIS
 *              6. KIT
 *              7. URSULA
 *              8. RITA
 *              9. WENDY
 *             10. VAL
 *
 *      Cur speaker def does not really change until loadspdef set to TRUE
 *
 *      Thus one can load a new speaker into curspdef[] at any time
 *      without ever really changing the output voice until PHCLAUSE()
 *      is called with a new input phonemic clause.
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK		12/06/1984	    Adopted from DECtalk klvdef.c
 * 0002 DGC		12/27/1984      Added the "readonly" things for the 80186.
 * 0003 DK		01/14/1985	    Fine tune voices to new tilt(f0) function
 * 0004 DK		01/21/1985      Increase richness of Paul (less base, more like old Paul)
 * 0005 DK		04/22/1985      Fix Betty to better match Diane Br.
 * 0006 DK		04/30/1985      Overload calibration for 3.0 for all voices
 * 0007 DK		06/03/1985      Increase SR for more lively voices
 * 0008 DK		06/10/1985	    Paul: ap down, Betty: ap up, Dennis: less breathy
 * 0009 DK		06/20/1985      Betty: ap back down a bit
 * 0010 DK 		07/24/1985      Boost LO so don't have to shift R1c output
 * 0011 DK		07/29/1985      Adjust spdef levels to avoid overloads during aspiration
 * 0012 DK		08/26/1985      Ursula still overloads, back off gains
 * 0013 DGC		09/06/1985      Harry head size to 115, from 120.
 * 0014 EAB 	01/07/1991	    re-evaluated and adjusted gains for all voices for 
 *                      		DECtalk-PC release
 * 0015 eab		05/03/1993      Changed betty's values to match 88 code except for new
 * 0016 WIH		08/19/1993      Added definitions for 8 kHz. sample rate.
 * 0017 EAB		03/22/1995	    Merged VTM definitions from Alpha group.
 * 0018 SIK		01/16/1996    	Removed white space inbetween # and include in places
 *                    			where #include is commented out.
 * 0019 MGS		03/25/1996	    Merged 42c code to WIN 95 42a code 
 * 0020 MGS		05/29/1996	 	Merged ED's changed since 0019
 * 0021	MGS		06/06/1996  	Changed file name from phvdef,c to ph_vdef.c
 * 0022 MGS     07/29/1996      Rolled back changed to the BR (breathiness parameter)
 * 0023 EDB     12/10/1996      Change kit_8[] breathness from 47 to 47-20
 * 0024 EAB     01/23/1997		Checked and modified gh and gf balance after vocal tract.
 * 0025	TQL		01/23/1997		Tuned the gains for code freeze.
 * 0026 TQL		02/20/1997		Tuned the gains for code freeze.
 * 0027 TQL		05/08/1997		Tuned the gains for code freeze.
 * 0028 EAB/CJL 08/14/1997      Hand tuned changes.
 * 0029 DR		09/30/1997		UK BUILD: copied from p_us_vdf.c 
 *								created 10/1
 * 0029 EAB		16/DEC/1997		Tuned 10 KHZ paul and betty for UK
 * 0030 EAB		12/29/1997		Tuned both 8K and 11K ALL voices for UK English 
 * 0031 EAB		1/29/1998		Refined tuning of frank and usrsula to make less "hot" 
								reduce's each gv by 3db  gn of paul by 2 and  lowered the avergae
								pitch for ursula from 240 (too high to 180) and slower  
								and took 3db off of output gain multiplier for both. Bats 573
 * 0032 JAW     04/27/1998      Added default glottal speeds.
 * 0033 EAB 					Refined after tuning by Jenny 11/5/98
 * 0034 CAB		10/18/2000		Changed copyright info and formatted and edited comments
 */

/**********************************************************************/
/**********************************************************************/
/* SPEAKER DEFINITIONS FOR 8 kHz.                                     */
/**********************************************************************/
/**********************************************************************/
/* 
 * Actually means that we are running an integer vocal tract model.
 * In the MSVC++ environment, we define it on the compiler option
 * line as /D FP_VTM
 */

/* Perfect Paul */

short                   paul_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	3,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % (Was 100) */
	122,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3650,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	330,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifndef FP_VTM
	73,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
#else
	68,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
#endif
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	76,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	48,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	60,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	83,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max)frm 75 to 90 for 10to8     */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz, was 18) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-2 - 43 + 26,					   /* Output gain multiplier  */
#endif
/* PAUL */
};

/* Beautiful Betty */

short                   betty_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	4,								   /* SM (smoothness in %, actually spectral tilt offset) */
	35,								   /* AS (assertiveness, degree of final f0 fall in % */
	208,							   /* AP (Average pitch in Hz) (was 208) */
	140,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4250,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	330,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifndef FP_VTM
	72,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
#else
	67,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#endif
	75,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	72,								   /* G1 (gain of input to cascade 5th formant in dB) */
	71,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	74,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	55,								   /* QU (quickness of larynx gestures in % of max quickness) */
	14,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	0 - 35 + 18,					   /* Output gain multiplier  */
#endif
  /* BETTY */
};

/* Huge Harry */

short                   harry_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	12,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	89,								   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	86,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	115,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3850,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	240,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3200,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4000,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	72,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	73,								   /* G1 (gain of input to cascade 5th formant in dB) */
	73,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	73,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-5 - 32 + 23,					   /* Output gain multiplier  */
#endif
	/* HARRY */
};

/* Frail Frank */

short                   frank_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	46,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	155,							   /* AP (Average pitch in Hz) */
	90,								   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	5,								   /* LA (laryngealization, in percent) */
	90,								   /* HS (head size, in percent relative to normal for SEX) */
	3650,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	280,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4200,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	300,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3500,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4050,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifndef FP_VTM
	62,								   /* GF (gain of frication source in dB) */
	62,								   /* GH (gain of aspiration source in dB) */
	73,								   /* GV (gain of voicing source in dB ) */
#else
	62,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
#endif
	72,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	74,								   /* G1 (gain of input to cascade 5th formant in dB) */
	74,								   /* G2 (gain of input to cascade 4th formant in dB) */
	60,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	64,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	64,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	66,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	4 - 45 + 18-3,					   /* Output gain multiplier  */
#endif
	  /* FRANK */
};

/* Kit the Kid */

short                   kit_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	5,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	306,							   /* AP (Average pitch in Hz) */
	210,							   /* PR (pitch range in percent of Paul's range) */
	/* 12/10/1996 EDB, change from 47 */
	47-20,							   /* BR (breathiness in dB) */

	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	80 + 8,							   /* HS (head size, in percent relative to normal for SEX) */
	ZAPF,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4450 + 3000,					   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifndef FP_VTM
	63,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#else
	69,								   /* GF (gain of frication source in dB) */
	76,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
#endif
	75,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	74,								   /* G1 (gain of input to cascade 5th formant in dB) */
	71,								   /* G2 (gain of input to cascade 4th formant in dB) */
	46,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	76,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	10 - 32 + 17,					   /* Output gain multiplier  */
#endif
	/* KIT */
};

/* Uppity Ursula */

short                   ursula_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	60,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	240,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	100,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	95,								   /* HS (head size, in percent relative to normal for SEX) */
	4450,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4300,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifndef FP_VTM
	77,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#else
	74,								   /* GF (gain of frication source in dB) */
	67,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#endif
	78,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	73,								   /* G1 (gain of input to cascade 5th formant in dB) */
	70,								   /* G2 (gain of input to cascade 4th formant in dB) */
	55,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	51,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	71,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3 - 30 + 15-3,					   /* Output gain multiplier  */
#endif
	/* URSULA */
};

/* Rough Rita ROBY ROBOT */
#if     0
short                   rita_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	8,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	95,								   /* AP (Average pitch in Hz) */
	5,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	86,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3850,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	240,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3200,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4000,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	70 + 6 + 2,						   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	70,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60 + 14,						   /* G2 (gain of input to cascade 4th formant in dB) */
	52 - 8 - 2,						   /* G3 (gain of input to cascade 3rd formant in dB) */
	62 - 1 - 2,						   /* G4 (gain of input to cascade 2nd formant in dB) */
	81 + 2,							   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	12,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	0,								   /* Output gain multiplier  */
#endif
   /* RITA */
};

#else
/* Old Rita, removed 25-apr-1988                    */
short                   rita_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	24,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	106,							   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	46,								   /* BR (breathiness in dB) */
	20,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	4,								   /* LA (laryngealization, in percent) */
	95,								   /* HS (head size, in percent relative to normal for SEX) */
	4000,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifndef FP_VTM
	731,							   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#else
	67,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
#endif
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	71,								   /* G2 (gain of input to cascade 4th formant in dB) */
	51,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	75,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1 - 32 + 18,					   /* Output gain multiplier  */
#endif
	 /* RITA */
};

#endif

/* Whispery Wendy */
short wendy_8[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,								   /* AS (assertiveness, degree of final f0 fall in % */
	200,							   /* AP (Average pitch in Hz) */
	175,							   /* PR (pitch range in percent of Paul's range) */
	55,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4500,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	64,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	75,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	74,								   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	51,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	52,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	79,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	1 - 26 + 18,					   /* Output gain multiplier  */
#endif
	   /* WENDY */
};

/* Doctor Dennis */

short dennis_8[] =
{
	MALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	38,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3200,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3600,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,								   /* GF (gain of frication source in dB) */
	62,								   /* GH (gain of aspiration source in dB) */
	62,								   /* GV (gain of voicing source in dB ) */
	74,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	78,								   /* G1 (gain of input to cascade 5th formant in dB) */
	74,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	78,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-10 - 22 + 23,					   /* Output gain multiplier  */
#endif
	   /* DENNIS */
};

/**********************************************************************/
/**********************************************************************/
/* SPEAKER DEFINITIONS FOR 10 khz and 11 kHz.                         */
/**********************************************************************/
/**********************************************************************/

/* Perfect Paul */

short         paul[SPDEF] =
{
	MALE,							   /* SEX = m */
	3,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	122,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	3500,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3850,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	330,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    69,                                /* GF (gain of frication source in dB) */
    68,                                /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	68,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	65,								   /* G1 (gain of input to cascade 5th formant in dB) */
	70,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	84,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
/* PAUL  */
};

/* Beautiful Betty */

short                   betty[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	4,								   /* SM (smoothness in %, actually spectral tilt offset) */
	35,								   /* AS (assertiveness, degree of final f0 fall in % */
	208,							   /* AP (Average pitch in Hz) */
	240,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4450,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
        69,                                                                /* GF (gain of frication source in dB) */
        67,                                                                /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
	69,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	66,								   /* G1 (gain of input to cascade 5th formant in dB) */
	71,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	74,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	40,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	55,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
 /* BETTY */
};

/* Huge Harry */

short                   harry[SPDEF] =
{
	MALE,							   /* SEX = m */
	12,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	92,								   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	86,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	115,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3850,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	240,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3200,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4000,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    69,                                /* GF (gain of frication source in dB) */
    68,                                /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	64,								   /* G1 (gain of input to cascade 5th formant in dB) */
	70,								   /* G2 (gain of input to cascade 4th formant in dB) */
	50,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	65,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	75,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
	/* HARRY */
};

/* Frail Frank */

short                   frank[SPDEF] =
{
	MALE,							   /* SEX = m */
	46,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	155,							   /* AP (Average pitch in Hz) */
	90,								   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	4,								   /* LA (laryngealization, in percent) */
	90,								   /* HS (head size, in percent relative to normal for SEX) */
	3650,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	280,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4200,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	300,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3500,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4050,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank on all sources */
	68,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	69,								   /* GV (gain of voicing source in dB ) */
	69,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	72,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
	58,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	70,								   /* G4 (gain of input to cascade 2nd formant in dB) */
    79,                                /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	3-3,								   /* Output gain multiplier  */
#endif
	  /* FRANK */
};

/* Kit the Kid */

short                   kit[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	5,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	306 - 10,							   /* AP (Average pitch in Hz) */
	210 - 30,						   /* PR (pitch range in percent of Paul's range) */
	47,								   /* BR (breathiness in dB) */
	40 + 30,						   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	80 - 3,							   /* HS (head size, in percent relative to normal for SEX) */
	ZAPF,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4450,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	68,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
	68,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	72,								   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	52,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	68,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
	   /* KIT */
};

/* Uppity Ursula */

short                   ursula[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	60,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	190,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	100,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	95,								   /* HS (head size, in percent relative to normal for SEX) */
	4450,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4300,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    68,                                                              /* GF (gain of frication source in dB) */
    67,                                                                /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	52,								   /* G2 (gain of input to cascade 4th formant in dB) */
    62,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	77,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	71,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75, 							   /* FT (f0-dependent spectral tilt in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	0-3,								   /* Output gain multiplier  */
#endif
	/* URSULA */
};

/* Rough Rita */

short                   rita[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	24,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	106,							   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	46,								   /* BR (breathiness in dB) */
	20,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	4,								   /* LA (laryngealization, in percent) */
	95,								   /* HS (head size, in percent relative to normal for SEX) */
	4000,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    68,                                                              /* GF (gain of frication source in dB) */
    68,                                                                /* GH (gain of aspiration source in dB) */
	68,								   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	70,								   /* G1 (gain of input to cascade 5th formant in dB) */
	68,								   /* G2 (gain of input to cascade 4th formant in dB) */
	55,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	71,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
  /* RITA */
};

/* Whispery Wendy */

short                   wendy[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,								   /* AS (assertiveness, degree of final f0 fall in % */
	200,							   /* AP (Average pitch in Hz) */
	175,							   /* PR (pitch range in percent of Paul's range) */
	45,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4500,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	70,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	69,							   /* GV (gain of voicing source in dB ) */
	69,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	62,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	57,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	80,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	6,								   /* Output gain multiplier  */
#endif
   /* WENDY */
};

/* Doctor Dennis */

short                   dennis[] =
{
	MALE,							   /* SEX = m */
	50,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	125,							   /* PR (pitch range in percent of Paul's range) */
	38,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3200,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3600,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	65,								   /* GF (gain of frication source in dB) */
	65,								   /* GH (gain of aspiration source in dB) */
	68,								   /* GV (gain of voicing source in dB ) */
	69,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	78,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
    56,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	78,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,							   /* FT (f0-dependent spectral tilt in % of max) */
	 9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
/* DENNIS */
};

/****************************end of phvdef.c**********************************/

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
 *
 ***********************************************************************
 *    File Name:    p_gr_vdf.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *      Speaker defs for:
 *      1. PAUL
 *      2. BETTY
 *      3. HARRY
 *      4. FRANK
 *      5. DENNIS
 *      6. KIT
 *      7. URSULA
 *      8. RITA
 *      9. WENDY
 *      10. VAL
 *
 *      Cur speaker def does not really change until loadspdef set to TRUE
 *
 *      Thus one can load a new speaker into curspdef[] at any time
 *      without ever really changing the output voice until PHCLAUSE()
 *  	is called with a new input phonemic clause.
 *
 ***********************************************************************
 *    Revision History:
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 0001 DK		12/06/1984     	Adopted from DECtalk klvdef.c
 * 0002 DGC		12/27/1984    	Added the "readonly" things for the 80186.
 * 0003 DK 		01/14/1985    	Fine tune voices to new tilt(f0) function
 * 0004 DK		01/21/1985     	Increase richness of Paul (less base, more like old Paul)
 * 0005 DK		04/22/1985     	Fix Betty to better match Diane Br.
 * 0006 DK		04/30/1985      Overload calibration for 3.0 for all voices
 * 0007 DK		06/03/1985      Increase SR for more lively voices
 * 0008 DK		06/10/1985     	Paul: ap down, Betty: ap up, Dennis: less breathy
 * 0009 DK		06/20/1985     	Betty: ap back down a bit
 * 0010 DK		07/24/1985     	Boost LO so don't have to shift R1c output
 * 0011 DK		07/29/1985    	Adjust spdef levels to avoid overloads during aspiration
 * 0012 DK		08/26/1985     	Ursula still overloads, back off gains
 * 0013 DGC		09/06/1985    	Harry head size to 115, from 120.
 * 0014 BNK		02/16/1987    	adaptions for german DECtalk
 * 0015 EAB		08/18/1987    	Dropped gains except for F3 which I raised.
 * 0016 CJL		03/30/1995 		File was phvdef.c. Is now gphvdef.c. Changed
 *                      		phdefs.h->gphdefs.h
 * 0017 EAB		12/12/1995	    Quick tuning of the feamle voices before we ship
 *                       		them-for safety everythin less hot, never hotter so we don't
 *                       		break anything
 * 0018 EAB		04/04/1996	    Modified breathy voices to improve intell.
 * 0019	MGS		06/18/1996		added 8khz speaker defs
 * 0020	MGS		06/18/1996		Merged english changes
 * 0021 EDB		11/13/1996		Increase the voice volume
 * 0022 EDB		12/10/1996		Many change to fix bug
 * 0023 EDB		01/10/1997		Fix many data.
 * 0024 NCS     01/17/1997      Fixed broken compiler -- Commas
 * 0025 EAB		02/14/1997		Trung and I tuned gains
 * 0026	EAB		02/14/1997		Previous version the wrong one rechecking in
 * 0027 TQL		02/20/1997		Tuned the gains for code freeze.
 * 0028 TQL		03/17/1997		Tuned the gains for code freeze.
 * 0029 TQL		05/08/1997		Tuned the gains for code freeze.
 * 0030 EAB		03/30/1998		Uncompleted changes for new GERMAN
 * 0031 JAW     04/27/1998      Added default glottal speeds.
 * 0032 EAB		04/27/1998		Preliminary tune for GERMAN submission.
 * 0033 EAB		04/29/1998		Fast manual tune for submission and wave file
								WARNING 8K VOICES ARE NOT TUNE AT ALL
 * 0034 EAB		04/29/1998      Readjust some gains
 * 0035 CAB		10/18/2000		Changed copyright info
 */


/* Perfect Paul */

short                   paul_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	20,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	100,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70 + 10,						   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100 + 8,						   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 + 30,						   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3650 + 200,						   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	330 + 40,						   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	70,								   /* GF (gain of frication source in dB) */
	63,								   /* GH (gain of aspiration source in dB) */
	62 - 1,							   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	58,								   /* G2 (gain of input to cascade 4th formant in dB) */
	58,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	65,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	86,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-2 - 43 + 26,					   /* Output gain multiplier  */
#endif
};

/* Beautiful Betty */

short                   betty_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	4,								   /* SM (smoothness in %, actually spectral tilt offset) */
	35 + 10,						   /* AS (assertiveness, degree of final f0 fall in % */
	180,							   /* AP (Average pitch in Hz) */
	140,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	80,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	  /* changed HS from 100 to 97                  */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4410,							   /* 4450F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 + 100,						   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	72 - 15,						   /* GF (gain of frication source in dB) */
	70 - 7,							   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	72 ,							   /* GN (gain of input to cascade nasal pole pair in dB) */
	69 - 7,							   /* G1 (gain of input to cascade 5th formant in dB) */
	67,								   /* G2 (gain of input to cascade 4th formant in dB) */
	50,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	57,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	  /* reduce loudness from 81 to 79                  */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	79 ,							   /* LO (Loudness, gain input to cascade 1st formant in dB) */
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
	70,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	73,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
	52,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	81,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-5 - 32 + 23,					   /* Output gain multiplier  */
#endif
};

/* Frail Frank */

short                   frank_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	46,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	155,							   /* AP (Average pitch in Hz) */
	90,								   /* PR (pitch range in percent of Paul's range) */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	  /* reduce breathiness from 50 to 40               */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	20,								   /* BR (breathiness in dB) */
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
	70,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65 + 3,							   /* GV (gain of voicing source in dB ) */
	75,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	63,								   /* G1 (gain of input to cascade 5th formant in dB) */
	58,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	86,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	4 - 45 + 18,					   /* Output gain multiplier  */
#endif
};

/* Kit the Kid */

short                   kit_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	5,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	306,							   /* AP (Average pitch in Hz) */
	210,							   /* PR (pitch range in percent of Paul's range) */
	3,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	80,								   /* HS (head size, in percent relative to normal for SEX) */
	ZAPF,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4450,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	  /* reduce from 53 to 45                       */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	45,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	50,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	73,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	10 - 32 + 17,					   /* Output gain multiplier  */
#endif
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
	70,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	74,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	67,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	51,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	  /* reduce loudness from 80 to 76                  */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	76,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3 - 30 + 15,					   /* Output gain multiplier  */
#endif
};

/* Rough Rita */

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
	72,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	72,								   /* G2 (gain of input to cascade 4th formant in dB) */
	48,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	83,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
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
};

/* Whispery Wendy */

short                   wendy_8[SPDEF] =
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
	72,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	53 + 3,							   /* GV (gain of voicing source in dB ) */
	75,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	62,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	55,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	83,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
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
};

/* Doctor Dennis */

short                   dennis_8[] =
{
	MALE,							   /* SEX = m */
	50,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	28,								   /* BR (breathiness in dB) */
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
	70,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65+2,								   /* GV (gain of voicing source in dB ) */
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60+2,								   /* G2 (gain of input to cascade 4th formant in dB) */
	52-1,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	61,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	84,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
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
};

short paul[SPDEF] =
{
	MALE,							   /* SEX = m */
	20,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	100,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70 ,						   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105 ,						   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 ,						   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3650 ,						   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	330,						   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	67,						   /* GF (gain of frication source in dB) */
	64,						   /* GH (gain of aspiration source in dB) */
	66,							   /* GV (gain of voicing source in dB ) */
	72,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69+2,								   /* G1 (gain of input to cascade 5th formant in dB) */
	66,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	63,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	80,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	 0,								   /* FT (f0-dependent spectral tilt in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	14,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
};

/* Beautiful Betty */

short                   betty[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	35 ,						   /* AS (assertiveness, degree of final f0 fall in % */
	180,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	50,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4410,							   /* 4450F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 + 50,						   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65,						   /* GF (gain of frication source in dB) */
	70,							   /* GH (gain of aspiration source in dB) */
	70,								   /* GV (gain of voicing source in dB ) */
	69,							   /* GN (gain of input to cascade nasal pole pair in dB) */
	70,							   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	  /*                         reduce loudness from 81 to 79                  */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	76,							   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	30,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80+6,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	32,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
};

/* Huge Harry */

short                   harry[SPDEF] =
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
	65+1,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	74,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	73+1,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	81,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60-20,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
};

/* Frail Frank */

short frank[SPDEF] =
{
	MALE,							   /* SEX = m */
	10,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	93,								   /* PR (pitch range in percent of Paul's range) */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	  /* reduce breathiness from 50 to 40               */
	  /* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	20,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	40,								   /* NF (additional fixed number of samples in nopen) */
	2,								   /* LA (laryngealization, in percent) */
	95,								   /* HS (head size, in percent relative to normal for SEX) */
	3650,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	280,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4200,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	300,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3500,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4050,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65+1,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	79,						   /* GN (gain of input to cascade nasal pole pair in dB) */
	63,							   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
	60,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	69,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	82,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80-20,								   /* FT (f0-dependent spectral tilt in % of max) */
	19,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	10,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	3,								   /* Output gain multiplier  */
#endif
};

/* Kit the Kid */

short    kit[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	5,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	270,							   /* AP (Average pitch in Hz) */
	180,							   /* PR (pitch range in percent of Paul's range) */
	3,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	83,								   /* HS (head size, in percent relative to normal for SEX) */
	4100,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4250,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4700,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	62,								   /* GF (gain of frication source in dB) */
	65,								   /* GH (gain of aspiration source in dB) */
	68,								   /* GV (gain of voicing source in dB ) */
	77,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	68,								   /* G2 (gain of input to cascade 4th formant in dB) */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* reduce from 53 to 45                       */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	50,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	72,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75-20,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
};

/* Uppity Ursula */

short                   ursula[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	120,							   /* AS (assertiveness, degree of final f0 fall in % */
	220,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	40,								   /* BR (breathiness in dB) */
	90,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	15,								   /* NF (additional fixed number of samples in nopen) */
	1,								   /* LA (laryngealization, in percent) */
	97,								   /* HS (head size, in percent relative to normal for SEX) */
	4450,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4300,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65,								   /* GF (gain of frication source in dB) */
	70-7,							   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	81,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	73,								   /* G2 (gain of input to cascade 4th formant in dB) */
	58,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	61,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100-40,							   /* FT (f0-dependent spectral tilt in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	50,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	0,								   /* Output gain multiplier  */
#endif
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
	72,								   /* GF (gain of frication source in dB) */
	65,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	70,								   /* G2 (gain of input to cascade 4th formant in dB) */
	55,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	63,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	73+2,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
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
};

/* Whispery Wendy */

short wendy[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	50,							   /* SM (smoothness in %, actually spectral tilt offset) */
	80,								   /* AS (assertiveness, degree of final f0 fall in % */
	210,							   /* AP (Average pitch in Hz) */
	175,							   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	98, 							   /* HS (head size, in percent relative to normal for SEX) */
	4500,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65,								   /* GF (gain of frication source in dB) */
	63,								   /* GH (gain of aspiration source in dB) */
	68,								   /* GV (gain of voicing source in dB ) */
	76,							   /* GN (gain of input to cascade nasal pole pair in dB) */
	73,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,							   /* G2 (gain of input to cascade 4th formant in dB) */
	57,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	64,							   /* G4 (gain of input to cascade 2nd formant in dB) */
	78,							   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,							   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	6,								   /* Output gain multiplier  */
#endif
};

/* Doctor Dennis , Dieter */

short dennis[] =
{
	MALE,							   /* SEX = m */
	30,								   /* SM (smoothness in %, actually spectral tilt offset) */
	80,							   /* AS (assertiveness, degree of final f0 fall in % */
	108,							   /* AP (Average pitch in Hz) */
	120,							   /* PR (pitch range in percent of Paul's range) */
	30,								   /* BR (breathiness in dB) */
	50,						   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	106 ,						   /* HS (head size, in percent relative to normal for SEX) */
	3350,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 ,						   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3800 ,						   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	330,						   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3450,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	67,						   /* GF (gain of frication source in dB) */
	64,						   /* GH (gain of aspiration source in dB) */
	69,							   /* GV (gain of voicing source in dB ) */
	72,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69+2,								   /* G1 (gain of input to cascade 5th formant in dB) */
	66,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	63,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	80,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	 0,								   /* FT (f0-dependent spectral tilt in % of max) */
	22,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	90,								   /* QU (quickness of larynx gestures in % of max quickness) */
	22,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	65,                                 /* GS (glottal speed) */

                               /* GS (glottal speed) */
#ifndef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
};




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
 *    File Name:    p_la_vdf.c
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
 * 0001 DK	 	12/06/1984      Adopted from DECtalk klvdef.c
 * 0002 DGC		12/27/1984      Added the "readonly" things for the 80186.
 * 0003 DK		01/14/1985	    Fine tune voices to new tilt(f0) function
 * 0004 DK		01/21/1985      Increase richness of Paul (less base, more like old Paul)
 * 0005 DK		04/22/1985      Fix Betty to better match Diane Br.
 * 0006 DK		04/30/1985    	Overload calibration for 3.0 for all voices
 * 0007 DK		06/03/1985      Increase SR for more lively voices
 * 0008 DK		06/10/1985      Paul: ap down, Betty: ap up, Dennis: less breathy
 * 0009 DK		06/20/1985      Betty: ap back down a bit
 * 0010 DK		07/24/1985	    Boost LO so don't have to shift R1c output
 * 0011 DK		07/29/1985      Adjust spdef levels to avoid overloads during aspiration
 * 0012 DK		04/29/1985     	Ursula still overloads, back off gains
 * 0013 DGC		09/06/1985		Harry head size to 115, from 120.
 * 0014 DK		05/21/1986      All voices spectral tilt upward due to spc change
 *                       		and Betty more breathy
 * 0015 DK		09/19/1986      Reduce hat & stress gestures for Paul ala Bell rules
 *                       		Richness, smoothness and NF no longer have any meaning
 * 0016 DK		03/13/1987      Make Betty vowels conform to analysis of bVbVbVb
 * 0017 DK		03/25/1988     	Replace FT by FL (f0flutter in % of max)
 * 0018	MGS		06/04/1996 		Added 8 kHz speaker definitions
 * 0019 EDB		11/13/1996		increase voice volume.
 * 0020 EDB 	12/10/1996		Many changes...
 * 0021 EDB		01/10/1997		data change in two places.
 * 0022 NCS     01/17/1997      Fixed broken compile time error -- commas.
 * 0023 EAB		02/14/1997		Trung and I tuned gains for demo release
 * 0024 TQL		02/20/1997		Tuned the gains for code freeze.
 * 0025 TQL		03/17/1997		Tuned the gains for code freeze.
 * 0026 TQL		05/08/1997		Tuned the gains for code freeze.
 * 0027 MGS     02/17/1998      Tuned to fix Ursula overload.
 * 0028 JAW     04/27/1998      Added default glottal speeds.
 * 0029	MFG		06/17/1998		Copied from p_la_vdf.c
 * 0030 CAB		10/18/2000		Changed copyright info and formatted comment section
 */

/* Perfect Paul */

short                   paul_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	90,								   /* AS (assertiveness, degree of final f0 fall in % (Was 100) */
	117,							   /* AP (Average pitch in Hz) */
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
	3350,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	3850,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	63,								   /* GV (gain of voicing source in dB ) */
	72,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	66,								   /* G1 (gain of input to cascade 5th formant in dB) */
	59,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	64,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	86,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	5,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz, was 18) */
	25,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-2 - 43 + 26,					   /* Output gain multiplier  */
#endif
};


/* Beautiful Betty */

short                   betty_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	4,								   /* SM (smoothness in %, actually spectral tilt offset) (was 52) */
	35,								   /* AS (assertiveness, degree of final f0 fall in %) (was 35) */
	200,							   /* AP (Average pitch in Hz) (was 175) */
	140,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4250,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	220 + 100,						   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,							   /* GF (gain of frication source in dB) */
	66 - 1,							   /* GH (gain of aspiration source in dB) */
	62,								   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	72,								   /* G2 (gain of input to cascade 4th formant in dB) was */
	52,								   /* G3 (gain of input to cascade 3rd formant in dB) was */
	55,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	85,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	10,								   /* BF (baseline f0 fall in Hz) (was 0) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	55,								   /* QU (quickness of larynx gestures in % of max quickness) */
	12,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
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
	8,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	94,								   /* AP (Average pitch in Hz) */
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
	3200,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	4000,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	70,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
	52,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	81,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	12,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
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
	30,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	145,							   /* AP (Average pitch in Hz) */
	90,								   /* PR (pitch range in percent of Paul's range) */
	25,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	15,								   /* LA (laryngealization, in percent) */
	50,								   /* HS (head size, in percent relative to normal for SEX) */
	3650,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	280,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4200,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	300,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3500,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	4050,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70-6,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	75,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	63,								   /* G1 (gain of input to cascade 5th formant in dB) */
	58,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	86,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	20,								   /* FL (f0 drift or flutter in % of max) */
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
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	0,								   /* AS (assertiveness, degree of final f0 fall in % */
	230,							   /* AP (Average pitch in Hz) */
	210,							   /* PR (pitch range in percent of Paul's range) */
	43,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	80,								   /* HS (head size, in percent relative to normal for SEX) */
	ZAPF,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4450,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	50,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	73,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
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
	50,								   /* SM (smoothness in %, actually spectral tilt offset) */
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
	4300,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	74,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	67,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	51,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	80,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
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
	4,								   /* SM (smoothness in %, actually spectral tilt offset) */
	35,								   /* AS (assertiveness, degree of final f0 fall in % */
	96,							   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	20,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	4,								   /* LA (laryngealization, in percent) */
	95,								   /* HS (head size, in percent relative to normal for SEX) */
	4000,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	65,								   /* GH (gain of aspiration source in dB) */
	67,								   /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	72,								   /* G2 (gain of input to cascade 4th formant in dB) */
	48,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	75,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
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
	50,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4500,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	57,								   /* GV (gain of voicing source in dB ) */
	75,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	62,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	55,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	83,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	56,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
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
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	35,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3200,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3600,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
	52,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	61,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	84,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
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

/* Perfect Paul */

short                   paul[SPDEF] =
{
	MALE,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	90,								   /* AS (assertiveness, degree of final f0 fall in % (Was 100) */
	110,							   /* AP (Average pitch in Hz) */
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
	3350,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	3850,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	70,								   /* G1 (gain of input to cascade 5th formant in dB) */
	66,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	64,								   /* G4 (gain of input to cascade 2nd formant in dB) */
    83,                                /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	18+15,							   /* BF (baseline f0 fall in Hz) */
	5,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz, was 18) */
	25,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
};

/* Beautiful Betty */

short                   betty[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	4,								   /* SM (smoothness in %, actually spectral tilt offset) (was 52) */
	35,								   /* AS (assertiveness, degree of final f0 fall in %) (was 35) */
	200,							   /* AP (Average pitch in Hz) (was 175) */
	140,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4250,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	220 + 100,						   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	65,								   /* GH (gain of aspiration source in dB) */
	63,							       /* GV (gain of voicing source in dB ) */
	74,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	72,								   /* G1 (gain of input to cascade 5th formant in dB) */
	72,								   /* G2 (gain of input to cascade 4th formant in dB) was */
	57,								   /* G3 (gain of input to cascade 3rd formant in dB) was */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	71,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	10,								   /* BF (baseline f0 fall in Hz) (was 0) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	55,								   /* QU (quickness of larynx gestures in % of max quickness) */
	12,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
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
	8,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	94,								   /* AP (Average pitch in Hz) */
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
	3200,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	4000,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	77,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	70,								   /* G1 (gain of input to cascade 5th formant in dB) */
	68,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	61,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	79,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	12,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
};

/* Frail Frank */

short                   frank[SPDEF] =
{
	MALE,							   /* SEX = m */
	46,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	155,							   /* AP (Average pitch in Hz) */
	90,								   /* PR (pitch range in percent of Paul's range) */
	45,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	5,								   /* LA (laryngealization, in percent) */
	90,								   /* HS (head size, in percent relative to normal for SEX) */
	3650,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	280,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4200,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	300,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3500,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	4050,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	77,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	63,								   /* G1 (gain of input to cascade 5th formant in dB) */
    69,                                /* G2 (gain of input to cascade 4th formant in dB) */
    62,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	64,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	81,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	20,								   /* FL (f0 drift or flutter in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	3,								   /* Output gain multiplier  */
#endif
};

/* Kit the Kid */

short                   kit[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	216,							   /* AP (Average pitch in Hz) */
	160-80,							   /* PR (pitch range in percent of Paul's range) */
	43-20,								   /* BR (breathiness in dB) */
	40+10,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	80+2,								   /* HS (head size, in percent relative to normal for SEX) */
	ZAPF,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4450,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	70,								   /* G2 (gain of input to cascade 4th formant in dB) */
	62,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	53,								   /* G4 (gain of input to cascade 2nd formant in dB) */
    65,                                /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
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
	50,								   /* SM (smoothness in %, actually spectral tilt offset) */
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
	4300,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	67,								   /* G1 (gain of input to cascade 5th formant in dB) */
    74,                                /* G2 (gain of input to cascade 4th formant in dB) */
	59,								   /* G3 (gain of input to cascade 3rd formant in dB) */
    60,                                /* G4 (gain of input to cascade 2nd formant in dB) */
	74,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-4, /* gain multiplier  */
#endif
};

/* Rough Rita */

short                   rita[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	4,								   /* SM (smoothness in %, actually spectral tilt offset) */
	35,								   /* AS (assertiveness, degree of final f0 fall in % */
	156,							   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	 0,								   /* BR (breathiness in dB) */
	20,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	4,								   /* LA (laryngealization, in percent) */
	95,								   /* HS (head size, in percent relative to normal for SEX) */
	4000,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	72,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	74,								   /* G2 (gain of input to cascade 4th formant in dB) */
	55,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	76,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
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

short                   wendy[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,								   /* AS (assertiveness, degree of final f0 fall in % */
	200,							   /* AP (Average pitch in Hz) */
	175,							   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4500,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70+5,								/* GH (gain of aspiration source in dB) */
	63,									/* GV (gain of voicing source in dB ) */
	77,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	73,								   /* G1 (gain of input to cascade 5th formant in dB) */
	60,								   /* G2 (gain of input to cascade 4th formant in dB) */
	63,								   /* G3 (gain of input to cascade 3rd formant in dB) */
    58,                                /* G4 (gain of input to cascade 2nd formant in dB) */
    77,                                /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
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

/* Doctor Dennis */

short                   dennis[] =
{
	MALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	35,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3200,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3600,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* P4 (frequency in Hz of parallel 4th formant = P4) */
	ZAPF,							   /* P5 (frequency in Hz of parallel 5th formant = P5) */
	65,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	80,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	61,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	59,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	81,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FL (f0 drift or flutter in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifndef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
};


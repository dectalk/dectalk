/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *    Copyright © 2000-2001 Force Computers Inc., a Solectron Company. All rights reserved.
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
 *    File Name:    p_us_vdf.c
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
 * 0024 EAB     1/23/97			Checked and modified gh and gf balance after vocal tract.
 * 0025	TQL		01/23/97		Tuned the gains for code freeze.
 * 0026 TQL		02/20/97		Tuned the gains for code freeze.
 * 0027 TQL		05/08/97		Tuned the gains for code freeze.
 * 0028 EAB/CJL 08/14/97        Hand tuned changes.
 * 0029 EDB     10/19/1997      add NWSNOAA support
 * 0030 CJL     11/07/1997      EAB Made NWSNOAA Female voice changes.
 * 0031 EAB		1/27/98			Checked tunnig of 8k voices seems ok exxcept Paul's
								frication level was at 84 (propbably a typo chnged to 74)
								Bats 491 && 554
 * 0032 JAW     04/27/1998      Added default glottal speeds.
 * 0033 EAB	    7/13/98         AD tuning 
 * 0034 EAB		7/21/98			Tune smoothness parameter voices had too little tilt 
 * 0035 EAB		7/22/98		    Quick tune for new_intonation voices for AD
 * 0036 EAB		9/29/98  	    More minor tuning
 * 0037 EAB 	10/16/98        New tuning for new release
 * 0038 eab 	11/5 98         Refined after Jenny's tuning 8 and 11 khz.BATS 807
 * 0039 EAB 	11/16/98	    As part of bats 804(not submitted yet) found illegal value for Kit's F7 also noticed
 *					            that GF and gh were too high (BATS 818)
 * 0040 EAB 	2/23/99 		Working on Betty (female voice)
 * 0041 EAB 	3/26/99 		"To every gain  tune, tune.... tune... 
 * 0042 EAB 	10/10/00 		Revert to earlier version,, the 4 and 5th formants are not correct and Ken and I discussed this
 *								and the only thing we're sure of is that Dennis had a reason for what he did. Also the VTM has 
 *								some bill hallahan code to zap formants over 4500.
 * 0043 CAB		10/13/00		Formated comment section and fixed copyright info
 * 0045 CAB		02/22/01		Updated copyright info.
 * 0046 eab 	3/1/5/01 adJUSTED SOME F5 ABD B5 TO AID WITH DISCRIMATION
 * 0047 EAB		3/28/01 Fixed autotune overload problem Bats 955
 * 0048	MGS		04/11/2002		ARM7 port
 * 0049	MFG		09/19/2002	 	Added support for new chris voice
 */

#ifdef HLSYN

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


/* Perfect Paul */
//hlsyn
const short                   paul_8[SPDEF] =
{
	1,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	122,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,				  				   /* LA (laryngealization, in percent) */
	100,		 			 		   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	4300,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3400,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	65,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66, 							   /* G4 (gain of input to cascade 2nd formant in dB) */
	70, 						 	   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	73,						 		   /* FT (f0-dependent spectral tilt in % of max) */
	18,					 			   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	400,                                 /* AGO */
	800,								/*agvo */
	2100,								/*aguo */
	0,	//chink area 
	60, //open quotient
#ifdef FP_VTM
	-18								   /* Output gain multiplier  */
#endif
/* PAUL  */
};


/*Crusty Chris */
//hlsyn
const short                   chris_8[SPDEF] =
{
	0,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	90,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,				  				   /* LA (laryngealization, in percent) */
	125,		 			 		   /* HS (head size, in percent relative to normal for SEX) */
	3600,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3600,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4700,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	65,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66, 							   /* G4 (gain of input to cascade 2nd formant in dB) */
	70, 						 	   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	73,						 		   /* FT (f0-dependent spectral tilt in % of max) */
	18,					 			   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	400,                                 /* AGO */
	800,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	50, //open quotient
#ifdef FP_VTM
	-18								   /* Output gain multiplier  */
#endif
/* CHRIS  */
};

/* Beautiful Betty */
//hlsyn

const short                   betty_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	40,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	180,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	45,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	40,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4550,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4150,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	0,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    60,                               /* GF (gain of frication source in dB) */
    57,                              /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	63,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	66,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	60,							   /* G3 (gain of input to cascade 3rd formant in dB) */
	65,							   /* G4 (gain of input to cascade 2nd formant in dB) */
	63,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	30,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	60,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	45,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	15,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	400,                                 /* AGO */
	750,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	45, //open quotient
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
 /* BETTY */
};


/* Huge Harry */
//hlsyn
const short                   harry_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	22,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	62,								   /* AP (Average pitch in Hz) */
	100,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	86,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	110,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3850,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3200,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4000,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	62,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	67,								   /* G1 (gain of input to cascade 5th formant in dB) */
	50,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,     						   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	57,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	15,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	500,                                 /* AGO */
	750,								/*agvo */
	2300,								/*aguo */
	0,	//chink area 
	30, //open quotient
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
	/* HARRY */
};

/* Frail Frank */

//hlsyn

const short frank_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	60,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	95,       						   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	0,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	97,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 ,						   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3650 ,						   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,						   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65,					               /* GF (gain of frication source in dB) */
	60,						           /* GH (gain of aspiration source in dB) */
	55,							       /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	76,								   /* G1 (gain of input to cascade 5th formant in dB) */
	76,								   /* G2 (gain of input to cascade 4th formant in dB) */
	63,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	56,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	30,								   /* FT (f0-dependent spectral tilt in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	25,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	290,                                 /* AGO */
	700,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	70, //open quotient
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif

}; /*fRANK*/

//hlsyn
/* Kit the Kid */

const short                   kit_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	50,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	290,							   /* AP (Average pitch in Hz) */
	120,						   /* PR (pitch range in percent of Paul's range) */
	47,								   /* BR (breathiness in dB) */
	40,						   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	90,							   /* HS (head size, in percent relative to normal for SEX) */
	4200,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	500,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4700,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	600,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4250,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65,								   /* GF (gain of frication source in dB) */
	60,								   /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	68,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	65,								   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	60,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	55,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	65,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	15,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	400,                                 /* AGO */
	700,								/*agvo */
	2100,								/*aguo */
	0,	//chink area 
	50, //open quotient
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
	   /* KIT */
};
//hlsyn
/* Uppity Ursula */

const short                   ursula_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	60,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	160,							   /* AP (Average pitch in Hz) */
	115,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	100,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	92,								   /* HS (head size, in percent relative to normal for SEX) */
	4450,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4400,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4900,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade  pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	77,								   /* G2 (gain of input to cascade 4th formant in dB) */
    55,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	59,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	66,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,								   /* FT (f0-dependent spectral tilt in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	15,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	18,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	300,                                 /* AGO */
	600,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	65, //open quotient
#ifdef FP_VTM
	0,								   /* Output gain multiplier  */
#endif
	/* URSULA */
};
//hlsyn
/* Rough Rita */

const short                   rita_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	44,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	165,							   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	36,								   /* BR (breathiness in dB) */
	20,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	1,								   /* LA (laryngealization, in percent) */
	110,								   /* HS (head size, in percent relative to normal for SEX) */
	4000,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	700,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4700,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB)  */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB )   */
	69,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	80,								   /* G2 (gain of input to cascade 4th formant in dB) */
	48,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	73,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	15,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	500,                                 /* AGO */
	800,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	60, //open quotient
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
  /* RITA */
};
//hlsyn
/* Whispery Wendy */

const short                   wendy_8[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,	   							   /* AS (assertiveness, degree of final f0 fall in % */
	150,							   /* AP (Average pitch in Hz) */
	80,							   /* PR (pitch range in percent of Paul's range) */
	55,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	4500,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	600,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4200,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4900,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	65,								   /* GF (gain of frication source in dB) */
	60,								   /* GH (gain of aspiration source in dB) */
	60,							       /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	78,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	57,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	68,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	15,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	28,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	850,                                 /* AGO */
	1100,								/*agvo */
	1900,								/*agUo */
	30,	//chink area 
	75, //open quotient
#ifdef FP_VTM
	6,								   /* Output gain multiplier  */
#endif
   /* WENDY */
};
//hlsyn
/* Doctor Dennis */

const short                   dennis_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	105,							   /* AP (Average pitch in Hz) */
	125,							   /* PR (pitch range in percent of Paul's range) */
	38,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3400,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	65,								   /* GF (gain of frication source in dB) */
	60,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	72,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	800,                                 /* AGO */
	1400,								/*agvo */
	2300,								/*aguo */
	0,	//chink area 
	70, //open quotient
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
/* DENNIS */

 
};
/**********************************************************************/
/**********************************************************************/
/* SPEAKER DEFINITIONS FOR 10 khz and 11 kHz.                         */
/**********************************************************************/
/**********************************************************************/
//#define KEN
#ifdef KEN
//hlsyn
/* Perfect Paul */

const short                   paul[SPDEF] =
{
	1,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	120,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,				  				   /* LA (laryngealization, in percent) */
	100,		 			 		   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	4300,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3400,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	65,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66, 							   /* G4 (gain of input to cascade 2nd formant in dB) */
	70, 						 	   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	73,						 		   /* FT (f0-dependent spectral tilt in % of max) */
	18,					 			   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	25,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-18								   /* Output gain multiplier  */
#endif
/* PAUL  */
};
#else

/* Perfect Paul */
//hlsyn
const short                   paul[SPDEF] =
{
	1,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	120,							   /* AS (assertiveness, degree of final f0 fall in % */
	117,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,				  				   /* LA (laryngealization, in percent) */
	100,		 			 		   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	4300,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3400,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	65,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66, 							   /* G4 (gain of input to cascade 2nd formant in dB) */
	70, 						 	   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	73,						 		   /* FT (f0-dependent spectral tilt in % of max) */
	18,					 			   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	25,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	400,                                 /* AGO */
	800,								/*agvo */
	1800,								/*aguo */
	0,	//chink area 
	50, //open quotient

#ifdef FP_VTM
	-18								   /* Output gain multiplier  */
#endif
/* PAUL  */
};
#endif //ken

/* crusty chris */
//hlsyn
const short                   chris[SPDEF] =
{
	0,							   /* SEX = m */
	20,								   /* SM (smoothness in %, actually spectral tilt offset) */
	135,							   /* AS (assertiveness, degree of final f0 fall in % */
	130,							   /* AP (Average pitch in Hz) */
	80,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,				  				   /* LA (laryngealization, in percent) */
	125,		 			 		   /* HS (head size, in percent relative to normal for SEX) */
	3600,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	4700,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3600,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4700,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	65,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66, 							   /* G4 (gain of input to cascade 2nd formant in dB) */
	70, 						 	   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	73,						 		   /* FT (f0-dependent spectral tilt in % of max) */
	18,					 			   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	400,                                 /* AGO */
	800,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	50, //open quotient
#ifdef FP_VTM
	-18								   /* Output gain multiplier  */
#endif
/* CHRIS  */
};

//hlsyn
/* Beautiful Betty */


#ifdef OLD_VOICES

const short betty[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	30,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	190,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	45,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	40,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	4550,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4150,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	0,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    60,                               /* GF (gain of frication source in dB) */
    57,                              /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	63,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	66,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	60,							   /* G3 (gain of input to cascade 3rd formant in dB) */
	65,							   /* G4 (gain of input to cascade 2nd formant in dB) */
	63,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	30,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	60,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	45,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	15,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	400,                                 /* AGO */
	750,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	45, //open quotient
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
 /* BETTY */
};
#endif
//hlsyn
/* Huge Harry */

const short                   harry[SPDEF] =
{
	MALE,							   /* SEX = m */
	12,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	85,								   /* AP (Average pitch in Hz) */
	100,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	86,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	110,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3850,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3200,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4000,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	62,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	67,								   /* G1 (gain of input to cascade 5th formant in dB) */
	50,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,     						   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	57,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	10,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	15,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	500,                                 /* AGO */
	750,								/*agvo */
	2300,								/*aguo */
	0,	//chink area 
	50, //open quotient
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
	/* HARRY */
};


//hlsyn
/* Frail Frank */



const short frank[SPDEF] =
{
	MALE,							   /* SEX = m */
	60,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	155,       						   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	0,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	97,							   /* HS (head size, in percent relative to normal for SEX) */
	3300,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 ,						   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3650 ,						   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,						   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65,					               /* GF (gain of frication source in dB) */
	60,						           /* GH (gain of aspiration source in dB) */
	55,							       /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	76,								   /* G1 (gain of input to cascade 5th formant in dB) */
	76,								   /* G2 (gain of input to cascade 4th formant in dB) */
	63,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	56,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	30,								   /* FT (f0-dependent spectral tilt in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	290,                                 /* AGO */
	700,								/*agvo */
	2300,								/*aguo */
	90,	//chink area 
	75, //open quotient
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif

}; /*fRANK*/


/* Kit the Kid */
//hlsyn
const short                   kit[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	50,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	306,							   /* AP (Average pitch in Hz) */
	130,						   /* PR (pitch range in percent of Paul's range) */
	47,								   /* BR (breathiness in dB) */
	40,						   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	20,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	95,							   /* HS (head size, in percent relative to normal for SEX) */
	4700,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	500,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4450,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	65,								   /* GF (gain of frication source in dB) */
	60,								   /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	68,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	65,								   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	60,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	55,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	65,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	400,                                 /* AGO */
	700,								/*agvo */
	2100,								/*aguo */
	0,	//chink area 
	50, //open quotient
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
	   /* KIT */
};
//hlsyn
/* Uppity Ursula */

const short                   ursula[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	20,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	160,							   /* AP (Average pitch in Hz) */
	115,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	100,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	103,				   /* HS (head size, in percent relative to normal for SEX) */
	4350,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4900,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	500,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4300,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4900,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade  pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	77,								   /* G2 (gain of input to cascade 4th formant in dB) */
    55,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	59,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	66,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,								   /* FT (f0-dependent spectral tilt in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	400,                                 /* AGO */
	800,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	50, //open quotient
#ifdef FP_VTM
	0,								   /* Output gain multiplier  */
#endif
	/* URSULA */
};
//hlsyn
/* Rough Rita */

const short                   rita[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	44,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	125,							   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	36,								   /* BR (breathiness in dB) */
	20,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	1,								   /* LA (laryngealization, in percent) */
	110,								   /* HS (head size, in percent relative to normal for SEX) */
	4000,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	700,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4700,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    65,                                /* GF (gain of frication source in dB)  */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB )   */
	69,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	80,								   /* G2 (gain of input to cascade 4th formant in dB) */
	48,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	73,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	500,                                 /* AGO */
	800,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	60, //open quotient
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
  /* RITA */
};

/* Whispery Wendy */

const short                   wendy[SPDEF] =
{

//hlsyn
	FEMALE,							   /* SEX = m */
	80,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,	   							   /* AS (assertiveness, degree of final f0 fall in % */
	200,							   /* AP (Average pitch in Hz) */
	80,							   /* PR (pitch range in percent of Paul's range) */
	5,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	4200,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	600,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4200,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	65,								   /* GF (gain of frication source in dB) */
	60,								   /* GH (gain of aspiration source in dB) */
	60,							       /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	78,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	57,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	68,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	20,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	850,                                 /* AGO */
	1100,								/*agvo */
	2500,								/*aguo */
	30,	//chink area 
	75, //open quotient
	
#ifdef FP_VTM
	6,								   /* Output gain multiplier  */
#endif
   /* WENDY */
};

/* Doctor Dennis */
//hlsyn
const short                   dennis[SPDEF] =
{
	MALE,							   /* SEX = m */
	80,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	125,							   /* PR (pitch range in percent of Paul's range) */
	38,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	65,								   /* GF (gain of frication source in dB) */
	60,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	72,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	400,                                 /* AGO */
	800,								/*agvo */
	1900,								/*aguo */
	0,	//chink area 
	50, //open quotient
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
/* DENNIS */

 
};
#else

/* Perfect Paul */

const short                   paul_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	30,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % (Was 100) */
	92,								   /* AP (Average pitch in Hz) */
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
#ifdef FP_VTM
	73,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	61,								   /* GV (gain of voicing source in dB ) */
#else
	74,								   /* GF (gain of frication source in dB) */
	59,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#endif
	69,							       /* GN (gain of input to cascade nasal pole pair in dB) */
	74,								   /* G1 (gain of input to cascade 5th formant in dB) */
	61,								   /* G2 (gain of input to cascade 4th formant in dB) */
	52,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	65,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	78,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max)frm 75 to 90 for 10to8     */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz, was 18) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-2 - 43 + 26,					   /* Output gain multiplier  */
#endif
/* PAUL */
};

/* crusty chris */

const short                   chris_8[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	30,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % (Was 100) */
	110,								   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	125,							   /* HS (head size, in percent relative to normal for SEX) */
	3600,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	330,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3650,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifdef FP_VTM
	73,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	61,								   /* GV (gain of voicing source in dB ) */
#else
	74,								   /* GF (gain of frication source in dB) */
	59,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#endif
	69,							       /* GN (gain of input to cascade nasal pole pair in dB) */
	74,								   /* G1 (gain of input to cascade 5th formant in dB) */
	61,								   /* G2 (gain of input to cascade 4th formant in dB) */
	52,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	65,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	78,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max)frm 75 to 90 for 10to8     */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	18,								   /* HR (hat-pattern fundamental frequency rise in Hz, was 18) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-2 - 43 + 26,					   /* Output gain multiplier  */
#endif
/* CHRIS */
};

/* Beautiful Betty */

const short                   betty_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	30,								   /* AS (assertiveness, degree of final f0 fall in % */
	170,							   /* AP (Average pitch in Hz) (was 208) */
	140,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	110,							   /* HS (head size, in percent relative to normal for SEX) */
	4950,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	180,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4990,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	200,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifdef FP_VTM
	73,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#else
	67,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
#endif
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	74,								   /* G1 (gain of input to cascade 5th formant in dB) */
	67,								   /* G2 (gain of input to cascade 4th formant in dB) */
	63,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	51,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	67,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	69,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	55,								   /* QU (quickness of larynx gestures in % of max quickness) */
	14,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	20,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	0 - 35 + 18,					   /* Output gain multiplier  */
#endif
  /* BETTY */
};

/* Huge Harry */

const short                   harry_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	22,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	80,								   /* AP (Average pitch in Hz) */
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
	62,								   /* GV (gain of voicing source in dB ) */
	77,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	77,								   /* G1 (gain of input to cascade 5th formant in dB) */
	73,								   /* G2 (gain of input to cascade 4th formant in dB) */
	48,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	76,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-5 - 32 + 23,					   /* Output gain multiplier  */
#endif
	/* HARRY */
};

/* Frail Frank */

const short                   frank_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	46,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	125,							   /* AP (Average pitch in Hz) */
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
#ifdef FP_VTM
	68,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,						 		   /* GV (gain of voicing source in dB ) */
#else
	62,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
#endif
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	70,								   /* G2 (gain of input to cascade 4th formant in dB) */
	61,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	52,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	62,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,								   /* QU (quickness of larynx gestures in % of max quickness) */
	14,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	4 - 45 + 18,					   /* Output gain multiplier  */
#endif
	  /* FRANK */
};

/* Kit the Kid */

const short                   kit_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	50,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	290,							   /* AP (Average pitch in Hz) */
	160,							   /* PR (pitch range in percent of Paul's range) */
	/* 12/10/1996 EDB, change from 47 */
	47-20,							   /* BR (breathiness in dB) */
	40,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	80 + 4,				 			   /* HS (head size, in percent relative to normal for SEX) */
	ZAPF,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	ZAPF,				 			   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
#ifdef FP_VTM
	63,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#else
	64,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	63,								   /* GV (gain of voicing source in dB ) */
#endif
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	77,								   /* G1 (gain of input to cascade 5th formant in dB) */
	71,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	70,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	10 - 32 + 17,					   /* Output gain multiplier  */
#endif
	/* KIT */
};

/* Uppity Ursula */

const short                   ursula_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	20,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	160,							   /* AP (Average pitch in Hz) */
	115,							   /* PR (pitch range in percent of Paul's range) */
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
#ifdef FP_VTM
	64,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#else
	64,								   /* GF (gain of frication source in dB) */
	64,						 		   /* GH (gain of aspiration source in dB) */
	63,								   /* GV (gain of voicing source in dB ) */
#endif
	78,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	73,								   /* G1 (gain of input to cascade 5th formant in dB) */
	72,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	69,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	16,								   /* QU (quickness of larynx gestures in % of max quickness) */
	15,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	18,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-3 - 30 + 15,					   /* Output gain multiplier  */
#endif
	/* URSULA */
};
/* Rough Rita ROBY ROBOT */
#if     0
const short                   rita_8[SPDEF] =
{
	MALE,							   /* SEX = m */
	44,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	165,								   /* AP (Average pitch in Hz) */
	5,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	86,	poe,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	1as,								   /* NF (additional fixed number of samples in nopen) */
	2,								   /* LA (laryngealization, in percent) */
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
	73,					  			   /* GN (gain of input to cascade nasal pole pair in dB) */
	78,								   /* G1 (gain of input to cascade 5th formant in dB) */
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
#ifdef FP_VTM
	0,								   /* Output gain multiplier  */
#endif
   /* RITA */
};

#else
/* Old Rita, removed 25-apr-1988                    */
const short                   rita_8[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	44,								   /* SM (smoothness in %, actually spectral tilt offset) */
	65,								   /* AS (assertiveness, degree of final f0 fall in % */
	165,							   /* AP (Average pitch in Hz) */
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
#ifdef FP_VTM
	731,							   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
#else
	67,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
#endif
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	78,								   /* G1 (gain of input to cascade 5th formant in dB) */
	67,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	51,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	70,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-1 - 32 + 18,					   /* Output gain multiplier  */
#endif
	 /* RITA */
};

#endif

/* Whispery Wendy */
const short                   wendy_8[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	50,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,								   /* AS (assertiveness, degree of final f0 fall in % */
	150,							   /* AP (Average pitch in Hz) */
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
	62,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	74,						 		   /* GN (gain of input to cascade nasal pole pair in dB) */
	76,								   /* G1 (gain of input to cascade 5th formant in dB) */
	70,								   /* G2 (gain of input to cascade 4th formant in dB) */
	61,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	54,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	71,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	1 - 26 + 18,					   /* Output gain multiplier  */
#endif
	   /* WENDY */
};

/* Doctor Dennis */

const short                   dennis_8[] =
{
	MALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	105,							   /* AP (Average pitch in Hz) */
	125,							   /* PR (pitch range in percent of Paul's range) */
	38,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3600,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3400,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	70,								   /* GF (gain of frication source in dB) */
	70,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
	76,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	77,								   /* G1 (gain of input to cascade 5th formant in dB) */
	76,								   /* G2 (gain of input to cascade 4th formant in dB) */
	53,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	71,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
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

const short                   paul[SPDEF] =
{
	MALE,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							       /* AS (assertiveness, degree of final f0 fall in % */
	92,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,				  				   /* LA (laryngealization, in percent) */
	100,		 			 		   /* HS (head size, in percent relative to normal for SEX) */
	3500,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3950,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    64,                                /* GF (gain of frication source in dB) */
    64,                                /* GH (gain of aspiration source in dB) */
	55,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	76,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66, 							   /* G4 (gain of input to cascade 2nd formant in dB) */
	60, 						 	   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	73,						 		   /* FT (f0-dependent spectral tilt in % of max) */
	18,					 			   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	400,                               /* AGO */
#ifdef FP_VTM
	-18								   /* Output gain multiplier  */
#endif
/* PAUL  */
};

/* Crusty Chris */

const short                   chris[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	0,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							       /* AS (assertiveness, degree of final f0 fall in % */
	110,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	70,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	105,				  				   /* LA (laryngealization, in percent) */
	125,		 			 		   /* HS (head size, in percent relative to normal for SEX) */
	3500,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	3950,							   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,							   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    64,                                /* GF (gain of frication source in dB) */
    64,                                /* GH (gain of aspiration source in dB) */
	55,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	71,								   /* G1 (gain of input to cascade 5th formant in dB) */
	76,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	66, 							   /* G4 (gain of input to cascade 2nd formant in dB) */
	60, 						 	   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	73,						 		   /* FT (f0-dependent spectral tilt in % of max) */
	18,					 			   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-18								   /* Output gain multiplier  */
#endif
/* CHRIS  */
};

/* Beautiful Betty */

const short                   betty[SPDEF] =
{
		FEMALE,							   /* SEX = f */
	60,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	180,							   /* AP (Average pitch in Hz) */
	135,							   /* PR (pitch range in percent of Paul's range) */
	30,								   /* BR (breathiness in dB) */
	100,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	92,								   /* HS (head size, in percent relative to normal for SEX) */
	4450,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	500,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4300,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    60,                                /* GF (gain of frication source in dB) */
    60,                                /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade  pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	77,								   /* G2 (gain of input to cascade 4th formant in dB) */
    55,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	59,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	66,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,								   /* FT (f0-dependent spectral tilt in % of max) */
	8,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	16,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	0,								   /* Output gain multiplier  */
#endif

};

/* Huge Harry */

const short                   harry[SPDEF] =
{
	MALE,							   /* SEX = m */
	22,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	80,								   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	86,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	115,							   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4250,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	160,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	3800,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    64,                                /* GF (gain of frication source in dB) */
    66,                                /* GH (gain of aspiration source in dB) */
	65,								   /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	67,								   /* G1 (gain of input to cascade 5th formant in dB) */
	50,								   /* G2 (gain of input to cascade 4th formant in dB) */
	54,     						   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	57,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,								   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	30,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
	/* HARRY */
};

/* Frail Frank */



const short frank[SPDEF] =
{
	MALE,							   /* SEX = m */
	80,								   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	125,       						   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	50,								   /* BR (breathiness in dB) */
	0,								   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	5,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	3500,							   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
	260 ,						   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
	4350,						   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,						   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
	3350,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4350,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	64,					               /* GF (gain of frication source in dB) */
	64,						           /* GH (gain of aspiration source in dB) */
	59,							       /* GV (gain of voicing source in dB ) */
	73,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	76,								   /* G1 (gain of input to cascade 5th formant in dB) */
	76,								   /* G2 (gain of input to cascade 4th formant in dB) */
	63,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	56,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	30,								   /* FT (f0-dependent spectral tilt in % of max) */
	18,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,								   /* QU (quickness of larynx gestures in % of max quickness) */
	7,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif

}; /*fRANK*/


/* Kit the Kid */

const short                   kit[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	50,								   /* SM (smoothness in %, actually spectral tilt offset) */
	0,								   /* AS (assertiveness, degree of final f0 fall in % */
	290,							   /* AP (Average pitch in Hz) */
	30,						   /* PR (pitch range in percent of Paul's range) */
	47,								   /* BR (breathiness in dB) */
	40,						   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	90,							   /* HS (head size, in percent relative to normal for SEX) */
	4200,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	480,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4700,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	500,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4250,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4900,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	58/*72*/,								   /* GF (gain of frication source in dB) */
	64,								   /* GH (gain of aspiration source in dB) */
	60,								   /* GV (gain of voicing source in dB ) */
	65,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	66,								   /* G1 (gain of input to cascade 5th formant in dB) */
	69,								   /* G2 (gain of input to cascade 4th formant in dB) */
	60,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	55,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	60,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	75,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	0,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-1,								   /* Output gain multiplier  */
#endif
	   /* KIT */
};

/* Uppity Ursula */

const short                   ursula[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	60,								   /* SM (smoothness in %, actually spectral tilt offset) */
	340,							   /* AS (assertiveness, degree of final f0 fall in % */
	143,							   /* AP (Average pitch in Hz) */
	100,							   /* PR (pitch range in percent of Paul's range) */
	0,								   /* BR (breathiness in dB) */
	100,							   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,								   /* HS (head size, in percent relative to normal for SEX) */
	4230,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4850,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	400,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4400,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4800,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    64,                                /* GF (gain of frication source in dB) */
    64,                                /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB ) */
	70,								   /* GN (gain of input to cascade  pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	77,								   /* G2 (gain of input to cascade 4th formant in dB) */
    55,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	59,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	66,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,							   /* FT (f0-dependent spectral tilt in % of max) */
	58,								   /* BF (baseline f0 fall in Hz) */
	50,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	10,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	10,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	0,								   /* Output gain multiplier  */
#endif
	/* URSULA */
};

/* Rough Rita */

const short                   rita[SPDEF] =
{
	FEMALE,							   /* SEX = f */
	44,								   /* SM (smoothness in %, actually spectral tilt offset) */
	85,								   /* AS (assertiveness, degree of final f0 fall in % */
	165,							   /* AP (Average pitch in Hz) */
	80,								   /* PR (pitch range in percent of Paul's range) */
	36,								   /* BR (breathiness in dB) */
	20,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	100,							   /* HS (head size, in percent relative to normal for SEX) */
	3700,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	500,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4700,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4900,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
    	67,                                /* GF (gain of frication source in dB)  */
    	66,                                /* GH (gain of aspiration source in dB) */
	64,								   /* GV (gain of voicing source in dB )   */
	69,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	80,								   /* G2 (gain of input to cascade 4th formant in dB) */
	48,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	58,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	73,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,								   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	0,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,								   /* QU (quickness of larynx gestures in % of max quickness) */
	25,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	32,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
  /* RITA */
};

/* Whispery Wendy */

const short                   wendy[SPDEF] =
{
	FEMALE,							   /* SEX = m */
	50,							   /* SM (smoothness in %, actually spectral tilt offset) */
	50,	   							   /* AS (assertiveness, degree of final f0 fall in % */
	150,							   /* AP (Average pitch in Hz) */
	125,							   /* PR (pitch range in percent of Paul's range) */
	55,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	4400,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	4800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	400,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	4900,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	65,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	64,							       /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	69,								   /* G1 (gain of input to cascade 5th formant in dB) */
	78,								   /* G2 (gain of input to cascade 4th formant in dB) */
	56,								   /* G3 (gain of input to cascade 3rd formant in dB) */
	57,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	68,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	0,								   /* BF (baseline f0 fall in Hz) */
	80,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,								   /* QU (quickness of larynx gestures in % of max quickness) */
	20,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	6,								   /* Output gain multiplier  */
#endif
   /* WENDY */
};

/* Doctor Dennis */

const short                   dennis[] =
{
	MALE,							   /* SEX = m */
	100,							   /* SM (smoothness in %, actually spectral tilt offset) */
	100,							   /* AS (assertiveness, degree of final f0 fall in % */
	105,							   /* AP (Average pitch in Hz) */
	125,							   /* PR (pitch range in percent of Paul's range) */
	38,								   /* BR (breathiness in dB) */
	0,								   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,								   /* NF (additional fixed number of samples in nopen) */
	0,								   /* LA (laryngealization, in percent) */
	105,							   /* HS (head size, in percent relative to normal for SEX) */
	3400,							   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,							   /* B4 (bandwidth in Hz of cascade 4th formant) */
	3800,							   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	180,							   /* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,							   /* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,							   /* F8 (frequency in Hz of parallel 5th formant = F8) */
	/* complaints that whisper voice sometimes overload-dropped source  2db for Wendy doctor and frank */
	68,								   /* GF (gain of frication source in dB) */
	68,								   /* GH (gain of aspiration source in dB) */
	66,								   /* GV (gain of voicing source in dB ) */
	71,								   /* GN (gain of input to cascade nasal pole pair in dB) */
	75,								   /* G1 (gain of input to cascade 5th formant in dB) */
	65,								   /* G2 (gain of input to cascade 4th formant in dB) */
	57,                                /* G3 (gain of input to cascade 3rd formant in dB) */
	62,								   /* G4 (gain of input to cascade 2nd formant in dB) */
	72,								   /* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,							   /* FT (f0-dependent spectral tilt in % of max) */
	9,								   /* BF (baseline f0 fall in Hz) */
	70,								   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,								   /* QU (quickness of larynx gestures in % of max quickness) */
	15,								   /* HR (hat-pattern fundamental frequency rise in Hz) */
	22,								   /* SR (height of max stress-rise impulse of f0 in Hz) */
	0,                                 /* GS (glottal speed) */
#ifdef FP_VTM
	-3,								   /* Output gain multiplier  */
#endif
/* DENNIS */

 
};
#endif

/****************************end of phvdef1.c**********************************/

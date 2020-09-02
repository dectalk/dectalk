/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000,2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computer Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	fphvdef.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *   - definition of parameters for each locutor
 *   Speaker defs for:
 *   1. PAUL     2. BETTY     3. HARRY     4. FRANK
 *   5. DENNIS   6. KIT       7. URSULA    8. RITA
 *   9. WENDY    10. VAL
 *
 * Cur speaker def does not really change until loadspdef set to TRUE
 * Thus one can load a new speaker into curspdef[] at any time
 * without ever really changing the output voice until PHCLAUSE()
 * is called with a new input phonemic clause.
 *
 ***********************************************************************
 *    Revision History:
 * 001	Michel	86			INITIAL VERSION FOR FRENCH
 * 002	Michel	07-05-1992	Clean up file
 * 003	Michel	29-08-1994  Reduce GF for feminine voices; need a femamp table
 * 004	Michel  			BR = 0 for test
 * 005	WIH		31-08-1994 	Added definitions for 8 kHz. sample rate.
 * 006  CAB		10-18-2000	Changed copyright info and formatted comments
 * 007 	CAB		01-17-2000	Merged Michel Divay changes for French
 * 008	CAB		08-31-2001	Added ifdef NEW_PHONES
 */

#ifdef NEW_PHONES
#include "l_all_ph.h"
#else
#include "l_fr_ph.h"
#endif


/* SPEAKER DEFINITIONS FOR 10 khz and 11 kHz */

/* Perfect Paul */
short paul [SPDEF] = {
	MALE,   /* SEX = m */
		3,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		122,   /* AP (Average pitch in Hz) */
		100,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		40,   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		100,   /* HS (head size, in percent relative to normal for SEX) */
		3500,   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
		260,   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
		3900,   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
		330,   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
		3350,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		3850,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		67,   /* GF (gain of frication source in dB) */
		65,   /* GH (gain of aspiration source in dB) */
		63,   /* GV (gain of voicing source in dB ) */
		72,   /* GN (gain of input to cascade nasal pole pair in dB) */
		68,   /* G1 (gain of input to cascade 5th formant in dB) */
		60,   /* G2 (gain of input to cascade 4th formant in dB) */
		49,   /* G3 (gain of input to cascade 3rd formant in dB) */
		64,   /* G4 (gain of input to cascade 2nd formant in dB) */
		86,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		75,   /* FT (f0-dependent spectral tilt in % of max) */
		18,   /* BF (baseline f0 fall in Hz) */
		0,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		40,   /* QU (quickness of larynx gestures in % of max quickness) */
		18,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		32,   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
		0		/* GS (glotal speed) */
#ifndef MSDOS
		,-1  /* Output gain multiplier  */
		/*PAUL*/
#endif
};

/* Beautiful Betty */
/* Michel GF reduced until we have a female amplitude table */
short betty[SPDEF] = {
	FEMALE,   /* SEX = f */
		4,   /* SM (smoothness in %, actually spectral tilt offset) */
		35,   /* AS (assertiveness, degree of final f0 fall in % */
		208,   /* AP (Average pitch in Hz) */
		140,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		40,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		100,   /* HS (head size, in percent relative to normal for SEX) */
		4450,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		260,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF was 72 (gain of frication source in dB) */
		/* amplitudes for female are different : sh is reduced */
		70,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		72,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		67,   /* G2 (gain of input to cascade 4th formant in dB) */
		50,   /* G3 (gain of input to cascade 3rd formant in dB) */
		57,   /* G4 (gain of input to cascade 2nd formant in dB) */
		81,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		75,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		80,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		55,   /* QU (quickness of larynx gestures in % of max quickness) */
		14,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		20,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-1  /* Output gain multiplier  */
		//BETTY
#endif
};

/* Huge Harry */
short harry[SPDEF] = {
	MALE,   /* SEX = m */
		12,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		89,   /* AP (Average pitch in Hz) */
		80,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		86,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		115,   /* HS (head size, in percent relative to normal for SEX) */
		3300,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		200,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		3850,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		240,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		3200,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		4000,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		70-5,   /* GF (gain of frication source in dB) */
		70-10,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		73,   /* GN (gain of input to cascade nasal pole pair in dB) */
		73,   /* G1 (gain of input to cascade 5th formant in dB) */
		60,   /* G2 (gain of input to cascade 4th formant in dB) */
		52,   /* G3 (gain of input to cascade 3rd formant in dB) */
		62,   /* G4 (gain of input to cascade 2nd formant in dB) */
		81,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		60,   /* FT (f0-dependent spectral tilt in % of max) */
		9,   /* BF (baseline f0 fall in Hz) */
		0,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		10,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		30,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-3    /* Output gain multiplier  */
		//HARRY
#endif
};

/* Frail Frank */
short frank[SPDEF] = {
	MALE,   /* SEX = m */
		46,   /* SM (smoothness in %, actually spectral tilt offset) */
		65,   /* AS (assertiveness, degree of final f0 fall in % */
		155,   /* AP (Average pitch in Hz) */
		90,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 50 (breathiness in dB) */
		40,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		5,   /* LA (laryngealization, in percent) */
		90,   /* HS (head size, in percent relative to normal for SEX) */
		3650,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		280,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		4200,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		300,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		3500,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		4050,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		68,   /* E: 68 GF (gain of frication source in dB) */
		68,   /* GH (gain of aspiration source in dB) */
		63,   /* E: 63 GV (gain of voicing source in dB ) */
		75,   /* GN (gain of input to cascade nasal pole pair in dB) */
		63,   /* G1 (gain of input to cascade 5th formant in dB) */
		58,   /* G2 (gain of input to cascade 4th formant in dB) */
		56,   /* G3 (gain of input to cascade 3rd formant in dB) */
		66,   /* G4 (gain of input to cascade 2nd formant in dB) */
		86,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		9,   /* BF (baseline f0 fall in Hz) */
		50,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		0,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0		/* GS (glotal speed) */
#ifndef MSDOS
		,3    /* Output gain multiplier  */
		//FRANK
#endif
};

/* Kit the Kid */
short kit[SPDEF] = {
	FEMALE,   /* SEX = f */
		5,   /* SM (smoothness in %, actually spectral tilt offset) */
		65,   /* AS (assertiveness, degree of final f0 fall in % */
		306,   /* AP (Average pitch in Hz) */
		210,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 47 (breathiness in dB) */
		40,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		80,   /* HS (head size, in percent relative to normal for SEX) */
		ZAPF,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		ZAPB,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4450,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF was 72 (gain of frication source in dB) */
		66,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		71,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		69,   /* G2 (gain of input to cascade 4th formant in dB) */
		53,   /* G3 (gain of input to cascade 3rd formant in dB) */
		50,   /* G4 (gain of input to cascade 2nd formant in dB) */
		73,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		75,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		75,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		50,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-1    /* Output gain multiplier  */
		//KIT
#endif
};

/* Uppity Ursula */
short ursula[SPDEF] = {
	FEMALE,   /* SEX = f */
		60,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		240,   /* AP (Average pitch in Hz) */
		135,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		100,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		95,   /* HS (head size, in percent relative to normal for SEX) */
		4450,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		260,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4300,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF (gain of frication source in dB) */
		70,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		74,   /* GN (gain of input to cascade nasal pole pair in dB) */
		67,   /* G1 (gain of input to cascade 5th formant in dB) */
		65,   /* G2 (gain of input to cascade 4th formant in dB) */
		51,   /* G3 (gain of input to cascade 3rd formant in dB) */
		58,   /* G4 (gain of input to cascade 2nd formant in dB) */
		80,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		8,   /* BF (baseline f0 fall in Hz) */
		50,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		30,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		32,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,0    /* Output gain multiplier  */
		//URSULA
#endif
};

/* Rough Rita */
short rita[SPDEF] = {
	FEMALE,   /* SEX = f */
		24,   /* SM (smoothness in %, actually spectral tilt offset) */
		65,   /* AS (assertiveness, degree of final f0 fall in % */
		106,   /* AP (Average pitch in Hz) */
		80,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 46 (breathiness in dB) */
		20,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		4,   /* LA (laryngealization, in percent) */
		95,   /* HS (head size, in percent relative to normal for SEX) */
		4000,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		250,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF was 72 (gain of frication source in dB) */
		70,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		73,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		72,   /* G2 (gain of input to cascade 4th formant in dB) */
		48,   /* G3 (gain of input to cascade 3rd formant in dB) */
		54,   /* G4 (gain of input to cascade 2nd formant in dB) */
		83,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		0,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		0,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		30,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		32,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-3    /* Output gain multiplier  */
		//RITA
#endif
};

/* Whispery Wendy */
short wendy[SPDEF] = {
	FEMALE,	/* SEX = m */
		100,   /* SM (smoothness in %, actually spectral tilt offset) */
		50,   /* AS (assertiveness, degree of final f0 fall in % */
		200,   /* AP (Average pitch in Hz) */
		175,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 55 (breathiness in dB) */
		0,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		100,   /* HS (head size, in percent relative to normal for SEX) */
		4500,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		400,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF (gain of frication source in dB) */
		68,   /* GH (gain of aspiration source in dB) */
		51,   /* GV (gain of voicing source in dB ) */
		75,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		62,   /* G2 (gain of input to cascade 4th formant in dB) */
		53,   /* G3 (gain of input to cascade 3rd formant in dB) */
		55,   /* G4 (gain of input to cascade 2nd formant in dB) */
		83,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		80,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		10,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,6    /* Output gain multiplier  */
		//WENDY
#endif
};

/* Doctor Dennis */
short dennis[] = {
	MALE,    /* SEX = m */
		100,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		110,   /* AP (Average pitch in Hz) */
		135,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 38 (breathiness in dB) */
		0,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		105,   /* HS (head size, in percent relative to normal for SEX) */
		3200,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		240,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		3600,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		280,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		68,   /* GF (gain of frication source in dB) */
		68,   /* GH (gain of aspiration source in dB) */
		63,   /* GV (gain of voicing source in dB ) */
		76,   /* GN (gain of input to cascade nasal pole pair in dB) */
		75,   /* G1 (gain of input to cascade 5th formant in dB) */
		60,   /* G2 (gain of input to cascade 4th formant in dB) */
		52,   /* G3 (gain of input to cascade 3rd formant in dB) */
		61,   /* G4 (gain of input to cascade 2nd formant in dB) */
		84,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		9,   /* BF (baseline f0 fall in Hz) */
		70,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		50,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */	
#ifndef MSDOS
		,-3   /* Output gain multiplier */
		//DENNIS
#endif
};

/* Variable Val (initially not defined) */
//extern short var_val[SPDEF];

/*
This table, indexed by the speaker definition code (the "SP_" symbols),
is used to range check user specified voice definition ":dv" commands.
*/
#if 0
LIMIT limit[] = {
	    0,	1,	  	  /* SEX */
		0,	100,	  /* SM  */
		0,	100,	  /* AS  */
		50,	350,	  /* AP  */
		0,	250,	  /* PR  */
		0, 	72,	  	  /* BR  */
		0,	100,	  /* RI  */
		0,	100,	  /* NF  */
		0,	100,	  /* LA  */
		65,	145,	  /* HS  */
		2000,	4650,	  /* F4  */
		100,	ZAPB,	  /* B4  */
		2500,	4950,	  /* F5  */
		100,	ZAPB,	  /* B5  */
		2500,	4950,	  /* P4  */
		2500,	4950,	  /* P5  */
		0,	86,	  /* GF  */
		0, 	86,	  /* GH  */
		0,	86,	  /* GV  */
		0,	86,	  /* GN  */
		0,	86,	  /* G1  */
		0,	86,	  /* G2  */
		0,	86,	  /* G3  */
		0,	86,	  /* G4  */
		0,	86,	  /* LO  */
		0,	100,	  /* FT  */
		0,	40,	  /* BF md */
		0,	100,	  /* LX  */
		0,	100,	  /* QU  */
		2,	100,	  /* HR md  */
		1,	100	  /* SR md  */
};
#endif

/* Perfect Paul */
short paul_8 [SPDEF] = {
	MALE,   /* SEX = m */
		3,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		122+10,   /* AP (Average pitch in Hz) */
		100,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		70,   /* RI (was 45,Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		100,   /* HS (head size, in percent relative to normal for SEX) */
		3500,   /* F4 (was 3350, frequency in Hz of cascade 4th formant = F4*100/HS) */
		260,   /* B4 (was 230, bandwidth in Hz of cascade 4th formant) */
		3900,   /* F5 (was 3900, frequency in Hz of cascade 5th formant = F5*100/HS) */
		330,   /* B5 (was 180, bandwidth in Hz of cascaded 5th formant) */
		3350,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		3850,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		67,   /* GF (gain of frication source in dB) */
		65,   /* GH (gain of aspiration source in dB) */
		63,   /* GV (gain of voicing source in dB ) */
		72,   /* GN (gain of input to cascade nasal pole pair in dB) */
		68,   /* G1 (gain of input to cascade 5th formant in dB) */
		60,   /* G2 (gain of input to cascade 4th formant in dB) */
		49,   /* G3 (gain of input to cascade 3rd formant in dB) */
		64,   /* G4 (gain of input to cascade 2nd formant in dB) */
		86,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		75,   /* FT (f0-dependent spectral tilt in % of max) */
		18,   /* BF (baseline f0 fall in Hz) */
		0,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		40,   /* QU (quickness of larynx gestures in % of max quickness) */
		10,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		32,   /* SR (height of max stress-rise impulse of f0 in Hz, was 32) */
		0		/* GS (glotal speed) */
#ifndef MSDOS
		,-1  /* Output gain multiplier  */
		/*PAUL*/
#endif
};

/* Beautiful Betty */
/* Michel GF reduced until we have a female amplitude table */
short betty_8[SPDEF] = {
	FEMALE,   /* SEX = f */
		4,   /* SM (smoothness in %, actually spectral tilt offset) */
		35,   /* AS (assertiveness, degree of final f0 fall in % */
		208,   /* AP (Average pitch in Hz) */
		140,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		40,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		100,   /* HS (head size, in percent relative to normal for SEX) */
		4450,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		260,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF was 72 (gain of frication source in dB) */
		/* amplitudes for female are different : sh is reduced */
		70,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		72,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		67,   /* G2 (gain of input to cascade 4th formant in dB) */
		50,   /* G3 (gain of input to cascade 3rd formant in dB) */
		57,   /* G4 (gain of input to cascade 2nd formant in dB) */
		81,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		75,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		80,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		55,   /* QU (quickness of larynx gestures in % of max quickness) */
		14,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		20,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-1  /* Output gain multiplier  */
		//BETTY
#endif
};

/* Huge Harry */
short harry_8[SPDEF] = {
	MALE,   /* SEX = m */
		12,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		89,   /* AP (Average pitch in Hz) */
		80,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		86,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		115,   /* HS (head size, in percent relative to normal for SEX) */
		3300,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		200,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		3850,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		240,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		3200,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		4000,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		70-5,   /* GF (gain of frication source in dB) */
		70-10,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		73,   /* GN (gain of input to cascade nasal pole pair in dB) */
		73,   /* G1 (gain of input to cascade 5th formant in dB) */
		60,   /* G2 (gain of input to cascade 4th formant in dB) */
		52,   /* G3 (gain of input to cascade 3rd formant in dB) */
		62,   /* G4 (gain of input to cascade 2nd formant in dB) */
		81,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		60,   /* FT (f0-dependent spectral tilt in % of max) */
		9,   /* BF (baseline f0 fall in Hz) */
		0,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		10,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		30,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-3    /* Output gain multiplier  */
		//HARRY
#endif
};

/* Frail Frank */
short frank_8[SPDEF] = {
	MALE,   /* SEX = m */
		46,   /* SM (smoothness in %, actually spectral tilt offset) */
		65,   /* AS (assertiveness, degree of final f0 fall in % */
		155,   /* AP (Average pitch in Hz) */
		90,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 50 (breathiness in dB) */
		40,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		5,   /* LA (laryngealization, in percent) */
		90,   /* HS (head size, in percent relative to normal for SEX) */
		3650,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		280,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		4200,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		300,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		3500,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		4050,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		68,   /* E: 68 GF (gain of frication source in dB) */
		68,   /* GH (gain of aspiration source in dB) */
		63,   /* E: 63 GV (gain of voicing source in dB ) */
		75,   /* GN (gain of input to cascade nasal pole pair in dB) */
		63,   /* G1 (gain of input to cascade 5th formant in dB) */
		58,   /* G2 (gain of input to cascade 4th formant in dB) */
		56,   /* G3 (gain of input to cascade 3rd formant in dB) */
		66,   /* G4 (gain of input to cascade 2nd formant in dB) */
		86,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		9,   /* BF (baseline f0 fall in Hz) */
		50,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		0,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0		/* GS (glotal speed) */
#ifndef MSDOS
		,3    /* Output gain multiplier  */
		//FRANK
#endif
};

/* Kit the Kid */
short kit_8[SPDEF] = {
	FEMALE,   /* SEX = f */
		5,   /* SM (smoothness in %, actually spectral tilt offset) */
		65,   /* AS (assertiveness, degree of final f0 fall in % */
		306,   /* AP (Average pitch in Hz) */
		210,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 47 (breathiness in dB) */
		40,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		80,   /* HS (head size, in percent relative to normal for SEX) */
		ZAPF,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		ZAPB,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4450,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF was 72 (gain of frication source in dB) */
		66,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		71,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		69,   /* G2 (gain of input to cascade 4th formant in dB) */
		53,   /* G3 (gain of input to cascade 3rd formant in dB) */
		50,   /* G4 (gain of input to cascade 2nd formant in dB) */
		73,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		75,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		75,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		50,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-1    /* Output gain multiplier  */
		//KIT
#endif
};

/* Uppity Ursula */
short ursula_8[SPDEF] = {
	FEMALE,   /* SEX = f */
		60,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		240,   /* AP (Average pitch in Hz) */
		135,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR (breathiness in dB) */
		100,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		95,   /* HS (head size, in percent relative to normal for SEX) */
		4450,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		260,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4300,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF (gain of frication source in dB) */
		70,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		74,   /* GN (gain of input to cascade nasal pole pair in dB) */
		67,   /* G1 (gain of input to cascade 5th formant in dB) */
		65,   /* G2 (gain of input to cascade 4th formant in dB) */
		51,   /* G3 (gain of input to cascade 3rd formant in dB) */
		58,   /* G4 (gain of input to cascade 2nd formant in dB) */
		80,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		8,   /* BF (baseline f0 fall in Hz) */
		50,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		30,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		32,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,0    /* Output gain multiplier  */
		//URSULA
#endif
};

/* Rough Rita */
short rita_8[SPDEF] = {
	FEMALE,   /* SEX = f */
		24,   /* SM (smoothness in %, actually spectral tilt offset) */
		65,   /* AS (assertiveness, degree of final f0 fall in % */
		106,   /* AP (Average pitch in Hz) */
		80,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 46 (breathiness in dB) */
		20,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		0,   /* NF (additional fixed number of samples in nopen) */
		4,   /* LA (laryngealization, in percent) */
		95,   /* HS (head size, in percent relative to normal for SEX) */
		4000,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		250,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF was 72 (gain of frication source in dB) */
		70,   /* GH (gain of aspiration source in dB) */
		65,   /* GV (gain of voicing source in dB ) */
		73,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		72,   /* G2 (gain of input to cascade 4th formant in dB) */
		48,   /* G3 (gain of input to cascade 3rd formant in dB) */
		54,   /* G4 (gain of input to cascade 2nd formant in dB) */
		83,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		0,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		0,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		30,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		32,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,-3    /* Output gain multiplier  */
		//RITA
#endif
};

/* Whispery Wendy */
short wendy_8[SPDEF] = {
	FEMALE,	/* SEX = m */
		100,   /* SM (smoothness in %, actually spectral tilt offset) */
		50,   /* AS (assertiveness, degree of final f0 fall in % */
		200,   /* AP (Average pitch in Hz) */
		175,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 55 (breathiness in dB) */
		0,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		100,   /* HS (head size, in percent relative to normal for SEX) */
		4500,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		400,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		ZAPF,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		ZAPB,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		55,   /* GF (gain of frication source in dB) */
		68,   /* GH (gain of aspiration source in dB) */
		51,   /* GV (gain of voicing source in dB ) */
		75,   /* GN (gain of input to cascade nasal pole pair in dB) */
		69,   /* G1 (gain of input to cascade 5th formant in dB) */
		62,   /* G2 (gain of input to cascade 4th formant in dB) */
		53,   /* G3 (gain of input to cascade 3rd formant in dB) */
		55,   /* G4 (gain of input to cascade 2nd formant in dB) */
		83,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		0,   /* BF (baseline f0 fall in Hz) */
		80,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		10,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */
#ifndef MSDOS
		,6    /* Output gain multiplier  */
		//WENDY
#endif
};

/* Doctor Dennis */
short dennis_8[] = {
	MALE,    /* SEX = m */
		100,   /* SM (smoothness in %, actually spectral tilt offset) */
		100,   /* AS (assertiveness, degree of final f0 fall in % */
		110,   /* AP (Average pitch in Hz) */
		135,   /* PR (pitch range in percent of Paul's range) */
		0,   /* BR was 38 (breathiness in dB) */
		0,   /* RI (Richness in %, actually nopen is 100-RI % of T0) */
		10,   /* NF (additional fixed number of samples in nopen) */
		0,   /* LA (laryngealization, in percent) */
		105,   /* HS (head size, in percent relative to normal for SEX) */
		3200,   /* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
		240,   /* B4 (bandwidth in Hz of cascade 4th formant) */
		3600,   /* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
		280,   /* B5 (bandwidth in Hz of cascaded 5th formant) */
		4100,   /* F7 (frequency in Hz of parallel 4th formant = F7) */
		ZAPF,   /* F8 (frequency in Hz of parallel 5th formant = F8) */
		68,   /* GF (gain of frication source in dB) */
		68,   /* GH (gain of aspiration source in dB) */
		63,   /* GV (gain of voicing source in dB ) */
		76,   /* GN (gain of input to cascade nasal pole pair in dB) */
		75,   /* G1 (gain of input to cascade 5th formant in dB) */
		60,   /* G2 (gain of input to cascade 4th formant in dB) */
		52,   /* G3 (gain of input to cascade 3rd formant in dB) */
		61,   /* G4 (gain of input to cascade 2nd formant in dB) */
		84,   /* LO (Loudness, gain input to cascade 1st formant in dB) */
		100,   /* FT (f0-dependent spectral tilt in % of max) */
		9,   /* BF (baseline f0 fall in Hz) */
		70,   /* LX (lax folds adjacent to voiceless sound -> breathiness) */
		50,   /* QU (quickness of larynx gestures in % of max quickness) */
		20,   /* HR (hat-pattern fundamental frequency rise in Hz) */
		22,   /* SR (height of max stress-rise impulse of f0 in Hz) */
		0	/* GS (glotal speed) */	
#ifndef MSDOS
		,-3   /* Output gain multiplier */
		//DENNIS
#endif
};


#ifndef MSDOS
short *voidef_8[] = {  /* Voice table for 8 kHz.  */
	paul_8,
		betty_8,
		harry_8,
		frank_8,
		dennis_8,       /* Whispery voice */
		kit_8,
		ursula_8,
		rita_8,
		wendy_8,        /* Whispery voice */
		NULL
		//	var_val
};
#endif

short *voidef[] = {     /* Voice table.*/
	paul,
		betty,
		harry,
		frank,
		dennis,         /* Whispery voice */
		kit,
		ursula,
		rita,
		wendy,          /* Whispery voice */
		NULL
		//	var_val
};


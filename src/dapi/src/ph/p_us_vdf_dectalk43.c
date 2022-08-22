/*
 * Extracted from: SPEAK43.EXE
 */
const short paul_8[SPDEF] =
{
	MALE,				/* SEX */
	3,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	122,				/* AP (Average pitch in Hz) */
	100,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	70,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	100,				/* HS (head size, in percent relative to normal for SEX) */
	3300,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	3650,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	330,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	3350,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	73,				/* GF (gain of frication source in dB) */
	68,				/* GH (gain of aspiration source in dB) */
	61,				/* GV (gain of voicing source in dB ) */
	77,				/* GN (gain of input to cascade nasal pole pair in dB) */
	66,				/* G1 (gain of input to cascade 5th formant in dB) */
	79,				/* G2 (gain of input to cascade 4th formant in dB) */
	42,				/* G3 (gain of input to cascade 3rd formant in dB) */
	60,				/* G4 (gain of input to cascade 2nd formant in dB) */
	84,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,				/* FT (f0-dependent spectral tilt in % of max) */
	18,				/* BF (baseline f0 fall in Hz) */
	0,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,				/* QU (quickness of larynx gestures in % of max quickness) */
	18,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	32,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* PAUL_8 */

const short betty_8[SPDEF] =
{
	FEMALE,				/* SEX */
	4,				/* SM (smoothness in %, actually spectral tilt offset) */
	35,				/* AS (assertiveness, degree of final f0 fall in % */
	208,				/* AP (Average pitch in Hz) */
	140,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	40,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	100,				/* HS (head size, in percent relative to normal for SEX) */
	4250,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	330,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	73,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	72,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	67,				/* G2 (gain of input to cascade 4th formant in dB) */
	50,				/* G3 (gain of input to cascade 3rd formant in dB) */
	57,				/* G4 (gain of input to cascade 2nd formant in dB) */
	81,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	80,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	55,				/* QU (quickness of larynx gestures in % of max quickness) */
	14,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	20,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* BETTY_8 */

const short harry_8[SPDEF] =
{
	MALE,				/* SEX */
	12,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	89,				/* AP (Average pitch in Hz) */
	80,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	86,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	115,				/* HS (head size, in percent relative to normal for SEX) */
	3300,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	3850,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	240,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	3200,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	4000,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	75,				/* GN (gain of input to cascade nasal pole pair in dB) */
	70,				/* G1 (gain of input to cascade 5th formant in dB) */
	75,				/* G2 (gain of input to cascade 4th formant in dB) */
	45,				/* G3 (gain of input to cascade 3rd formant in dB) */
	59,				/* G4 (gain of input to cascade 2nd formant in dB) */
	79,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,				/* FT (f0-dependent spectral tilt in % of max) */
	9,				/* BF (baseline f0 fall in Hz) */
	0,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	30,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* HARRY_8 */

const short frank_8[SPDEF] =
{
	MALE,				/* SEX */
	46,				/* SM (smoothness in %, actually spectral tilt offset) */
	65,				/* AS (assertiveness, degree of final f0 fall in % */
	155,				/* AP (Average pitch in Hz) */
	90,				/* PR (pitch range in percent of Paul's range) */
	50,				/* BR (breathiness in dB) */
	40,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	5,				/* LA (laryngealization, in percent) */
	90,				/* HS (head size, in percent relative to normal for SEX) */
	3650,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	280,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	4200,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	300,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	3500,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	4050,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	68,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	77,				/* GN (gain of input to cascade nasal pole pair in dB) */
	63,				/* G1 (gain of input to cascade 5th formant in dB) */
	70,				/* G2 (gain of input to cascade 4th formant in dB) */
	64,				/* G3 (gain of input to cascade 3rd formant in dB) */
	58,				/* G4 (gain of input to cascade 2nd formant in dB) */
	67,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	9,				/* BF (baseline f0 fall in Hz) */
	50,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* FRANK_8 */

const short kit_8[SPDEF] =
{
	FEMALE,				/* SEX */
	5,				/* SM (smoothness in %, actually spectral tilt offset) */
	65,				/* AS (assertiveness, degree of final f0 fall in % */
	306,				/* AP (Average pitch in Hz) */
	210,				/* PR (pitch range in percent of Paul's range) */
	43,				/* BR (breathiness in dB) */
	40,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	88,				/* HS (head size, in percent relative to normal for SEX) */
	ZAPF,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	7450,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	63,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	74,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	77,				/* G2 (gain of input to cascade 4th formant in dB) */
	33,				/* G3 (gain of input to cascade 3rd formant in dB) */
	50,				/* G4 (gain of input to cascade 2nd formant in dB) */
	81,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	80,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	75,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* KIT_8 */

const short ursula_8[SPDEF] =
{
	FEMALE,				/* SEX */
	60,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	240,				/* AP (Average pitch in Hz) */
	135,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	100,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	95,				/* HS (head size, in percent relative to normal for SEX) */
	4450,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4300,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	77,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	78,				/* GN (gain of input to cascade nasal pole pair in dB) */
	67,				/* G1 (gain of input to cascade 5th formant in dB) */
	78,				/* G2 (gain of input to cascade 4th formant in dB) */
	49,				/* G3 (gain of input to cascade 3rd formant in dB) */
	50,				/* G4 (gain of input to cascade 2nd formant in dB) */
	74,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	8,				/* BF (baseline f0 fall in Hz) */
	50,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	32,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* URSULA_8 */

const short rita_8[SPDEF] =
{
	FEMALE,				/* SEX */
	24,				/* SM (smoothness in %, actually spectral tilt offset) */
	65,				/* AS (assertiveness, degree of final f0 fall in % */
	106,				/* AP (Average pitch in Hz) */
	80,				/* PR (pitch range in percent of Paul's range) */
	46,				/* BR (breathiness in dB) */
	20,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	4,				/* LA (laryngealization, in percent) */
	95,				/* HS (head size, in percent relative to normal for SEX) */
	4000,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	73,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	73,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	72,				/* G2 (gain of input to cascade 4th formant in dB) */
	48,				/* G3 (gain of input to cascade 3rd formant in dB) */
	54,				/* G4 (gain of input to cascade 2nd formant in dB) */
	83,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	0,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	32,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* RITA_8 */

const short wendy_8[SPDEF] =
{
	FEMALE,				/* SEX */
	100,				/* SM (smoothness in %, actually spectral tilt offset) */
	50,				/* AS (assertiveness, degree of final f0 fall in % */
	200,				/* AP (Average pitch in Hz) */
	175,				/* PR (pitch range in percent of Paul's range) */
	55,				/* BR (breathiness in dB) */
	0,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	100,				/* HS (head size, in percent relative to normal for SEX) */
	4500,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	53,				/* GV (gain of voicing source in dB ) */
	75,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	62,				/* G2 (gain of input to cascade 4th formant in dB) */
	53,				/* G3 (gain of input to cascade 3rd formant in dB) */
	55,				/* G4 (gain of input to cascade 2nd formant in dB) */
	83,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	80,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* WENDY_8 */

const short dennis_8[SPDEF] =
{
	MALE,				/* SEX */
	100,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	110,				/* AP (Average pitch in Hz) */
	135,				/* PR (pitch range in percent of Paul's range) */
	38,				/* BR (breathiness in dB) */
	0,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	105,				/* HS (head size, in percent relative to normal for SEX) */
	3200,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	3600,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	70,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	76,				/* GN (gain of input to cascade nasal pole pair in dB) */
	75,				/* G1 (gain of input to cascade 5th formant in dB) */
	60,				/* G2 (gain of input to cascade 4th formant in dB) */
	52,				/* G3 (gain of input to cascade 3rd formant in dB) */
	61,				/* G4 (gain of input to cascade 2nd formant in dB) */
	84,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	9,				/* BF (baseline f0 fall in Hz) */
	70,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* DENNIS_8 */

const short paul[SPDEF] =
{
	MALE,				/* SEX */
	3,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	122,				/* AP (Average pitch in Hz) */
	100,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	70,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	100,				/* HS (head size, in percent relative to normal for SEX) */
	3300,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	3650,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	330,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	3350,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	3850,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	70,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	74,				/* GN (gain of input to cascade nasal pole pair in dB) */
	68,				/* G1 (gain of input to cascade 5th formant in dB) */
	60,				/* G2 (gain of input to cascade 4th formant in dB) */
	48,				/* G3 (gain of input to cascade 3rd formant in dB) */
	64,				/* G4 (gain of input to cascade 2nd formant in dB) */
	86,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,				/* FT (f0-dependent spectral tilt in % of max) */
	18,				/* BF (baseline f0 fall in Hz) */
	0,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	40,				/* QU (quickness of larynx gestures in % of max quickness) */
	18,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	32,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* PAUL */

const short betty[SPDEF] =
{
	FEMALE,				/* SEX */
	4,				/* SM (smoothness in %, actually spectral tilt offset) */
	35,				/* AS (assertiveness, degree of final f0 fall in % */
	208,				/* AP (Average pitch in Hz) */
	240,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	40,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	100,				/* HS (head size, in percent relative to normal for SEX) */
	4450,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	72,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	65,				/* G2 (gain of input to cascade 4th formant in dB) */
	50,				/* G3 (gain of input to cascade 3rd formant in dB) */
	56,				/* G4 (gain of input to cascade 2nd formant in dB) */
	81,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	80,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	55,				/* QU (quickness of larynx gestures in % of max quickness) */
	14,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	20,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* BETTY */

const short harry[SPDEF] =
{
	MALE,				/* SEX */
	12,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	89,				/* AP (Average pitch in Hz) */
	80,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	86,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	115,				/* HS (head size, in percent relative to normal for SEX) */
	3300,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	200,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	3850,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	240,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	3200,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	4000,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	70,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	73,				/* GN (gain of input to cascade nasal pole pair in dB) */
	71,				/* G1 (gain of input to cascade 5th formant in dB) */
	60,				/* G2 (gain of input to cascade 4th formant in dB) */
	52,				/* G3 (gain of input to cascade 3rd formant in dB) */
	62,				/* G4 (gain of input to cascade 2nd formant in dB) */
	81,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	60,				/* FT (f0-dependent spectral tilt in % of max) */
	9,				/* BF (baseline f0 fall in Hz) */
	0,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	30,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* HARRY */

const short frank[SPDEF] =
{
	MALE,				/* SEX */
	46,				/* SM (smoothness in %, actually spectral tilt offset) */
	65,				/* AS (assertiveness, degree of final f0 fall in % */
	155,				/* AP (Average pitch in Hz) */
	90,				/* PR (pitch range in percent of Paul's range) */
	50,				/* BR (breathiness in dB) */
	40,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	5,				/* LA (laryngealization, in percent) */
	90,				/* HS (head size, in percent relative to normal for SEX) */
	3650,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	280,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	4200,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	300,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	3500,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	4050,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	68,				/* GF (gain of frication source in dB) */
	68,				/* GH (gain of aspiration source in dB) */
	63,				/* GV (gain of voicing source in dB ) */
	75,				/* GN (gain of input to cascade nasal pole pair in dB) */
	63,				/* G1 (gain of input to cascade 5th formant in dB) */
	58,				/* G2 (gain of input to cascade 4th formant in dB) */
	56,				/* G3 (gain of input to cascade 3rd formant in dB) */
	66,				/* G4 (gain of input to cascade 2nd formant in dB) */
	86,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	9,				/* BF (baseline f0 fall in Hz) */
	50,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	0,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* FRANK */

const short kit[SPDEF] =
{
	FEMALE,				/* SEX */
	5,				/* SM (smoothness in %, actually spectral tilt offset) */
	65,				/* AS (assertiveness, degree of final f0 fall in % */
	306,				/* AP (Average pitch in Hz) */
	210,				/* PR (pitch range in percent of Paul's range) */
	47,				/* BR (breathiness in dB) */
	40,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	80,				/* HS (head size, in percent relative to normal for SEX) */
	ZAPF,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	ZAPB,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4450,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	71,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	69,				/* G2 (gain of input to cascade 4th formant in dB) */
	52,				/* G3 (gain of input to cascade 3rd formant in dB) */
	50,				/* G4 (gain of input to cascade 2nd formant in dB) */
	73,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	75,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	75,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* KIT */

const short ursula[SPDEF] =
{
	FEMALE,				/* SEX */
	60,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	240,				/* AP (Average pitch in Hz) */
	135,				/* PR (pitch range in percent of Paul's range) */
	0,				/* BR (breathiness in dB) */
	100,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	95,				/* HS (head size, in percent relative to normal for SEX) */
	4450,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	260,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4300,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	70,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	74,				/* GN (gain of input to cascade nasal pole pair in dB) */
	67,				/* G1 (gain of input to cascade 5th formant in dB) */
	65,				/* G2 (gain of input to cascade 4th formant in dB) */
	51,				/* G3 (gain of input to cascade 3rd formant in dB) */
	58,				/* G4 (gain of input to cascade 2nd formant in dB) */
	80,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	8,				/* BF (baseline f0 fall in Hz) */
	50,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	32,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* URSULA */

const short rita[SPDEF] =
{
	FEMALE,				/* SEX */
	24,				/* SM (smoothness in %, actually spectral tilt offset) */
	65,				/* AS (assertiveness, degree of final f0 fall in % */
	106,				/* AP (Average pitch in Hz) */
	80,				/* PR (pitch range in percent of Paul's range) */
	46,				/* BR (breathiness in dB) */
	20,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	0,				/* NF (additional fixed number of samples in nopen) */
	4,				/* LA (laryngealization, in percent) */
	95,				/* HS (head size, in percent relative to normal for SEX) */
	4000,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	250,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	72,				/* GF (gain of frication source in dB) */
	70,				/* GH (gain of aspiration source in dB) */
	65,				/* GV (gain of voicing source in dB ) */
	73,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	72,				/* G2 (gain of input to cascade 4th formant in dB) */
	48,				/* G3 (gain of input to cascade 3rd formant in dB) */
	54,				/* G4 (gain of input to cascade 2nd formant in dB) */
	83,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	0,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	0,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	30,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	32,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* RITA */

const short wendy[SPDEF] =
{
	FEMALE,				/* SEX */
	100,				/* SM (smoothness in %, actually spectral tilt offset) */
	50,				/* AS (assertiveness, degree of final f0 fall in % */
	200,				/* AP (Average pitch in Hz) */
	175,				/* PR (pitch range in percent of Paul's range) */
	55,				/* BR (breathiness in dB) */
	0,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	100,				/* HS (head size, in percent relative to normal for SEX) */
	4500,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	400,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	ZAPF,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	ZAPB,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	70,				/* GF (gain of frication source in dB) */
	68,				/* GH (gain of aspiration source in dB) */
	51,				/* GV (gain of voicing source in dB ) */
	75,				/* GN (gain of input to cascade nasal pole pair in dB) */
	69,				/* G1 (gain of input to cascade 5th formant in dB) */
	62,				/* G2 (gain of input to cascade 4th formant in dB) */
	53,				/* G3 (gain of input to cascade 3rd formant in dB) */
	55,				/* G4 (gain of input to cascade 2nd formant in dB) */
	83,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	0,				/* BF (baseline f0 fall in Hz) */
	80,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	10,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* WENDY */

const short dennis[SPDEF] =
{
	MALE,				/* SEX */
	100,				/* SM (smoothness in %, actually spectral tilt offset) */
	100,				/* AS (assertiveness, degree of final f0 fall in % */
	110,				/* AP (Average pitch in Hz) */
	135,				/* PR (pitch range in percent of Paul's range) */
	38,				/* BR (breathiness in dB) */
	0,				/* RI (Richness in %, actually nopen is 100-RI % of T0) */
	10,				/* NF (additional fixed number of samples in nopen) */
	0,				/* LA (laryngealization, in percent) */
	105,				/* HS (head size, in percent relative to normal for SEX) */
	3200,				/* F4 (frequency in Hz of cascade 4th formant = F4*100/HS) */
	240,				/* B4 (bandwidth in Hz of cascade 4th formant) */
	3600,				/* F5 (frequency in Hz of cascade 5th formant = F5*100/HS) */
	280,				/* B5 (bandwidth in Hz of cascaded 5th formant) */
	4100,				/* F7 (frequency in Hz of parallel 4th formant = F7) */
	ZAPF,				/* F8 (frequency in Hz of parallel 5th formant = F8) */
	68,				/* GF (gain of frication source in dB) */
	68,				/* GH (gain of aspiration source in dB) */
	63,				/* GV (gain of voicing source in dB ) */
	76,				/* GN (gain of input to cascade nasal pole pair in dB) */
	75,				/* G1 (gain of input to cascade 5th formant in dB) */
	60,				/* G2 (gain of input to cascade 4th formant in dB) */
	52,				/* G3 (gain of input to cascade 3rd formant in dB) */
	61,				/* G4 (gain of input to cascade 2nd formant in dB) */
	84,				/* LO (Loudness, gain input to cascade 1st formant in dB) */
	100,				/* FT (f0-dependent spectral tilt in % of max) */
	9,				/* BF (baseline f0 fall in Hz) */
	70,				/* LX (lax folds adjacent to voiceless sound -> breathiness) */
	50,				/* QU (quickness of larynx gestures in % of max quickness) */
	20,				/* HR (hat-pattern fundamental frequency rise in Hz) */
	22,				/* SR (height of max stress-rise impulse of f0 in Hz) */
	0,				/* AGO */
	0,				/* agvo */
	0,				/* aguo */
	0,				/* unvow */
	0,				/* chink area */
	0,				/* open quotient*/
#ifndef FP_VTM
	-1,				/* Output gain multiplier  */
#endif
}; /* DENNIS */


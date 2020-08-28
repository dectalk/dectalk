/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1998 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  hlsyn.h
 *
 *  coded by J. Erik Moore, 12/93
 *
 *  Modification History:
 *
 *  25 Mar 1998  reb:  added MAX, MIN.
 *   6 Oct 1997  reb:  removed REMOVE_NASAL_POLE_ZERO; added definition of 
 *                     the interface to brent.c, moved FNPVars definition to
 *                     nasalf1x.c, added AN_NO_NASAL_BREAKPOINT, parenthesized 
 *                     a few preprocessor variables.
 *  30 Apr 1997  reb:  added dynamic viscosity MU of air; added Lhp (horizontal 
 *                     length of the posterior glottal chink) to HL speaker; 
 *                     added FLOW_SQRT macro; used HLSYNAPI rather than FLAV_STDCALL; 
 *                     added FLOAT_EPS (and so included float.h).
 *  22 Nov 1996  reb:  moved ps from HLSpeaker to HLFrame, changed instances 
 *                     of Ps to ps to reflect this; added dc and ap to HLFrame, 
 *                     KCw, KCg, Kdf0dc, Kpd, Kf1, f1_neutral, KdPTdc, 
 *                     f0_vowelshift_f1_break, Psm, Cwm, Cgm, Lt, At, Lvg, Lv, 
 *                     and Av to HLSpeaker, moved Cw and Cg from HLSpeaker 
 *                     to HLState, and added agf to HLState; removed KB1 and 
 *                     KB2 from HLSpeaker; added length epsilon L_EPS.  
 *  27 Aug 1996  reb:  added agHiKLSourceCutoff, AVPressureThreshold, 
 *                     KdAV0, KdAV1 to HLSpeaker; added 
 *                     REMOVE_NASAL_POLE_ZERO; included flavor.h, 
 *                     checked FLAV_STDCALL in decl's of 
 *                     HLSynthesizeLLFrame, InitializeHLSynthesizer; 
 *                     added AGHIKLSOURCECUTOFF_VAL and ..._STRING.
 *  08 Aug 1996  reb:  archived as version 2.2 (no changes).
 *  17 Oct 1995  changed ALV_F3_MAX from 3500 to 3600 (for female) (epc)
 *   2 Oct 1995  added () around parameters in unit conversion macros (epc)
 *  21 Sep 1995  changed ALV_RESOLUTION back to 50 (epc)
 *  20 Sep 1995  changed ALV_RESOLUTION from 50 to 25 (epc)
 *	11 Jul 2002	 cab   Fixed #ifdef
 */

#ifndef HLSYN_H
#define HLSYN_H

#include <float.h>
#include "flavor.h"
#include "hlsynapi.h"

#define DEBUG
#undef DEBUG

#define WARNINGS
#undef WARNINGS

#define LINE_LEN 100

#define NO 0
#define YES !NO

#define MAX(x,y)  ((x) > (y) ?  (x) : (y))
#define MIN(x,y)  ((x) < (y) ?  (x) : (y))

/*****
	These are used to remove pole zero pairs by setting them equal
	to one another so that they cancel out.
*****/

#define REMOVE_FORMANT 1000		/* Any constant (value not important) */ 
#define REMOVE_BANDWIDTH 200	/* Any constant (value not important) */

/*****
	The units in the code are mostly in CGS.  However, the areas
	are specified in mm^2 and the subglottal pressure (ps) is in
	cmH20.  These are the conversion macros.
*****/

#define CMWATER_TO_CGS(CMWATER) ((CMWATER)*980.0f)
#define	CGS_TO_CMWATER(CGS) ((CGS)/980.0f)
#define	CMSQ_TO_MMSQ(CMSQ) ((CMSQ)*100.0f)
#define	MMSQ_TO_CMSQ(MMSQ) ((MMSQ)*0.01f)

//#define FLOW_SQRT(X) ((X) < 0.0 ?  -sqrt(-(X)) : sqrt((X)))
#define FLOW_SQRT(X) DTsqrt(X)

extern float DT_f_sqrt(float);
extern float DT_f_log10(float);
#define DTsqrt(x) DT_f_sqrt(x)
#define DTlog10(x) DT_f_log10(x)


#define L_EPS (0.001f) /* cm */
#define FLOAT_EPS (10.0f * FLT_MIN)
//eab nasty little thing cuases issues with nasal pole frquencies at 0 it calculates them apart
#define AN_NO_NASAL_BREAKPOINT (-0.0f) /* sq. mm */

#ifdef FLAV_AGHISOURCECUTOFF_ON
#define AGHIKLSOURCECUTOFF_VAL (30.0f) /* sq. mm */
#define AGHIKLSOURCECUTOFF_STRING ("30.0")
#else 
#define AGHIKLSOURCECUTOFF_VAL (999999.0f) /* sq. mm */
#define AGHIKLSOURCECUTOFF_STRING ("999999.0")
#endif
#ifdef OUTFORNOW
typedef struct tagHLFrame {
#ifdef TONGUE_BODY_AREA 
  float	atb; /* mm^2*/
#endif
  int	place; /* mm^2*/
  float ag;	/* mm^2 */
  float al;	/* mm^2 */
  float ab;	/* mm^2 */
  float an;	/* mm^2 */
  float ue;	/* cm^3/s */
  float f0;	/* deciHz */
  float f1;	/* Hz */
  float f2;	/* Hz */
  float f3;	/* Hz */
  float f4;	/* Hz */
  float ps;	/* cm H20 */
  float dc; /* % */
  float ap; /* mm^2 */
} HLFrame;
#endif
/* Interface to the Brent's algorithm routines in brent.c */
#define BRENT_DEFAULT_ITMAX 100	   /* Max allowed iterations */
#define BRENT_DEFAULT_EPS 3.0e-4f	   /* Machine floating point precision */
#define BRENT_BRACKET_DEFAULT_FACTOR 1.6f /* Interval expansion factor */
#define BRENT_BRACKET_DEFAULT_NTRY 50 /* Max allowed interval expansions */
typedef float BrentFunctionType(float x, void* pOtherArgs);
short BrentBracket(BrentFunctionType* pF, void* pOtherArgs,
                   float *x1, float *x2, float factor, int ntry);
float Brent(BrentFunctionType* pF, void* pOtherArgs,
            float x1, float x2, float tol, int itmax, float eps);

/*****
All the areas in the state are in mm^2
*****/
#ifdef outFORnow

struct HLStateTag {
  float acl;  /* area of liquid contraction, mm^2 */
  float acd;  /* area of dorsum contraction, mm^2 */
  short loc;  /* location of smallest contraction   */
  float acx;  /* area of smallest contraction, mm^2 */
  float agx;  /* area of tracheal adjusted glottal contraction, mm^2 */
  float Pm;   /* pressure in the mouth, dynes/cm^2 */
  float Pcw;  /* pressure across the wall capacitance, dynes/cm^2 */
  float Ug;   /* glottal flow, cm^3/s */
  float Uacx; /* flow across constriction (acx), cm^3/s */
  float Un;   /* flow into the nose, cm^3/s */
  float Uw;   /* flow into the parallel Rw, Cw branch (wall), cm^3/s */
  float f1c;  /* f1 adjusted by constrictions, Hz */
  float f1x;  /* f1 adjusted by constrictions and nose, Hz */
  float b1x;  /* b1 adjusted by nose, Hz */
  float Cw;   /* compliance of the pharyngeal walls (Cwm adjusted by dc) */
  float Cg;   /* compliance of the glottis (Cgm adjusted by dc) */
  float agf;  /* area of the glottis for calculating flow */
};

typedef struct HLStateTag HLState;
#endif


#define SPEEDSOUND 35400.f	/* cm/s */
#define PI 3.14159265359f
#define RHO 0.00114f		/* g/cm^3 */
#define MU 0.000194f  /* dyne sec/cm^4 */

#define LIPS	1
#define BLADE	2
#define	DORSUM	3
#define	LIQUID	4

/*****
This is a first pass at a nice way to use tables.  An entry
is typedef'ed and then each of the tables are defined with
lengths and nmonics for the entries.  NOTE: IT IS IMPORTANT
THAT THE KNOWN ELEMENT IS COLUMN 1 AND THE UNKNOWN IS COLUMN 2.
This is necessary when searching the tables.
*****/
#ifdef outFORnow
typedef struct TableRowTag{
  float Column1;
  float Column2;
} TableRow;
#endif
#define MAXANFN 9
#define ANFN_AN Column1
#define ANFN_FN Column2

#define MAXF1LOVERA 11
#define F1LOVERA_F1 Column1
#define F1LOVERA_LOVERA Column2

#define MAXANA 6
#define ANA_AN Column1
#define ANA_A Column2

#define MAXANB 6
#define ANB_AN Column1
#define ANB_B Column2

#define MAXF1C 7
#define F1C_F1 Column1
#define F1C_C Column2

#define MAXANK2 17
#define ANK2_AN Column1
#define ANK2_K2 Column2
#ifdef outFORnow
typedef struct FricativeGainsTag{
  float A2F;
  float A3F;
  float A4F;
  float A5F;
  float AB;
} FricativeGains;
#endif
/*****
In this alveolar precompiler stuff I have set the important
information which is the resolution and the f2,f3 mins and
maxs.  These are sufficient to compute everything else.  I do
however realize that the method used will run slowly
because of the in-line divisions.  I felt that precomputing
the derived quantities would be leaving one open to errors.

The ranges are taken from the HLSYN write up as the ranges on the graphs
*****/
#ifdef INVTMIONT
#define ALV_RESOLUTION 50	/* Hz */

#define ALV_F2_MIN 800		/* Hz */
#define ALV_F2_MAX 2900		/* Hz */
#define ALV_F2_POINTS (ALV_F2_MAX-ALV_F2_MIN)/ALV_RESOLUTION + 1

#define ALV_F3_MIN 1800		/* Hz */
#define ALV_F3_MAX 3600		/* Hz */
#define ALV_F3_POINTS (ALV_F3_MAX-ALV_F3_MIN)/ALV_RESOLUTION + 1

#define ALVEOLAR(F2,F3) \
speaker->alveolar[(short) ( ((F2)-ALV_F2_MIN)/ALV_RESOLUTION )] \
[(short) ( ((F3)-ALV_F3_MIN)/ALV_RESOLUTION )]
#endif
#define NasalBandwidth 200.0f

#ifdef outFORnow
typedef struct HLSpeakerTag {
  float Val;
  float Lc_al;
  float HelmholtzZeroAreaFrequency;

  float Vab;
  float Lc_ab;

  float f1Min;
  float f1Max;
  float f2RetroflexMax;
  float f3RetroflexMax;
  float f2LateralMax;
  float f3LateralMin;
  float Kacl;
  float aclFreq;

  float Vacd;
  float Lc_acd;
  float acdMax;
  float acd_f1Break;
  float KHi;
  float f1HiShift;

  float fno;
 
  float fm_f1BreakPoint;

  float BNZ_f1BreakPoint;
 
//  float NasalBandwidth;
  float BNP_B1_anLow;
  float BNP_B1_anHigh;
  TableRow 	anaTable[MAXANA];
  TableRow	anbTable[MAXANB];
  TableRow	f1cTable[MAXF1C];
  float fp_f2BreakPoint;
  TableRow	anK2Table[MAXANK2];
  float PharangealArea;

  float Cwm;
  float Rw;
  float Psm;
  float Cgm;
  float Lg;
  
  float NewtonInterpTimeStep;
  float UpdateInterval;

  float LabialAB;
  float PalVelarA2F;
  float PalVelarA5F;
  float PalVelarA3F;
  float PalVelar_f2Offset;
  float PalVelar_f2Overf3_Slope;
  float RetroflexA3F;
  float LateralA3F;
#ifdef INVTMIONT
  FricativeGains alveolar[ALV_F2_POINTS][ALV_F3_POINTS];
#endif
  float B2F;
  float B3F;
  float B4F;
  float B5F;

  float agm;
  float agAVModalOffsetMax;
  float agAVModalOffsetOnOff;
  float agMin;
  float agHiKLSourceCutoff;
  float AVPressureThreshold;
  float Kv;
  float KdAV0;
  float KdAV;
  float KdAV1;
  float Ka;

  float Kf;
  float AFInterpTimeStep;
  float AFThreshold;

  float OQm;
  float KOQ;
  float OQMax;
  float OQMin;

  float TLBreakArea;
  float KTL;
  float TLm;
  float SFromf4;
  float SDefault;
  float PctSfordBTL;
  float dBTLforPctS;
  float TLMax;
  float TLMin;

  float agDIMin;
  float KDI;

  float KdF;
  float F1T;
  
  float B1m;
  float B2m;
  float B3m;
  float B4m;
  float B5m;
/*float KB1;
  float KB2;*/
  float KB3;
  float KB4;
  float KB5;

  float F5;

  float A6f;
  float F6;
  float B6F;
  
  float KCw;
  float KCg;
  float Kdf0dc;
  float Kpd;
  float Kf1;
  float f1_neutral;
  float KdPTdc;
  float f0_vowelshift_f1_break;
  float Lt;
  float At;
  float Lvg;
  float Lv;
  float Av;
  float Lhp;
} HLSpeaker;
#endif
#ifdef EPSON_ARM7
extern  const TableRow	f1LOverATable[MAXF1LOVERA];
extern const float anfnTable_fno;
extern  const TableRow	anfnTable[MAXANFN];
#else
extern  TableRow	f1LOverATable[MAXF1LOVERA];
extern float anfnTable_fno;
extern  TableRow	anfnTable[MAXANFN];
#endif
#ifdef __cplusplus
extern "C" {
#endif

extern void HLSYNAPI
HLSynthesizeLLFrame(HLFrame *frame,HLFrame *oldframe, HLSpeaker *speaker,
				    HLState *state,HLState *oldstate, LLFrame *llframe);

extern void HLSYNAPI
InitializeHLSynthesizer(HLFrame *oldframe, HLSpeaker *speaker,
					HLState *oldstate,short IsMale);

#ifdef __cplusplus
}
#endif

#endif

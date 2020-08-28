/*****************************************************************************/
/**  HLsyn - Version 2.2                                                    **/
/**                                                                         **/
/** Copyright (c) 1993-1999 by Sensimetrics Corporation                     **/
/** All rights reserved.                                                    **/
/**                                                                         **/
/*****************************************************************************/

/*
 * HLSynAPI.h  Include file defining the API for HLSyn.
 *
 * 22 July 1999  R.E. Beaudoin  Created.
*/

/*
*  1	13sep01		MFG		Added new TSpeaker Structure for Hlysyn added also  
*							initDefaultSpeakerValues() and changeSpeakerValues()
*  2	31oct01		MFG		Fixed the changespeakerValues so they switch between speakers properl
*  3	11jul02		CAB		Fixed #ifdef
 * 4	19sep02		MFG	 	Added support for new chris voice
*/


#ifndef HLSYNAPI_H
#define HLSYNAPI_H
#include "tts.h"
//extern changeSpeakerValues(LPTTS_HANDLE_T phTTS, TSpeakerDef *speakerDef, currentSpeaker SpeakerName);

/* First come the HLSyn data structures ... */

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
  float	f1;	/* Hz */
  float f2;	/* Hz */
  float f3;	/* Hz */
  float f4;	/* Hz */
  float ps;	/* cm H20 */
  float dc; /* % */
  float ap; /* mm^2 */
} HLFrame;

/*****
All the areas in the state are in mm^2
*****/

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

/*****
This is a first pass at a nice way to use tables.  An entry
is typedef'ed and then each of the tables are defined with
lengths and nmonics for the entries.  NOTE: IT IS IMPORTANT
THAT THE KNOWN ELEMENT IS COLUMN 1 AND THE UNKNOWN IS COLUMN 2.
This is necessary when searching the tables.
*****/

typedef struct TableRowTag{
  float Column1;
  float Column2;
} TableRow;

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

typedef struct FricativeGainsTag{
  float A2f;
  float A3f;
  float A4f;
  float A5f;
  float Ab;
} FricativeGains;

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


#ifdef EPSON_ARM7
extern const TableRow	f1LOverATable[MAXF1LOVERA];
extern const  float anfnTable_fno;
extern const  TableRow	anfnTable[MAXANFN];
#else
 extern TableRow	f1LOverATable[MAXF1LOVERA];
extern  float anfnTable_fno;
extern  TableRow	anfnTable[MAXANFN];
#endif


/* Next come the LLSyn (Klatt-level) data structures.. */

#define NUM_OUTPUTS 21
#define Float float

/* Synthesizer structure */
typedef struct {
  /* static data */
  int parallel_only_flag;
  int num_casc_formants;
  int num_samples;
  int output_select;

  /* dynamic state data */
  int pulse_freq;
  int glottis_open;
  int period_ctr;
  int voicing_state;
  int pulse;
  int random;
  int voicing_time;
  long global_time;
  Float voicing_amp;
  Float glottal_state;
  Float asp_state;
  Float integrator;

  /* voicing state */
  int F_0;
  int FL;
  int OQ;
  int SQ;
  int Di;
  int Av;
  int Tl;
  int close_shortened;
  int close_time;
} Synthesizer;

/* Coefficients structure */
typedef struct {
  Float asp_amp;
  Float fric_amp;
  Float f1p_amp;
  Float f2p_amp;
  Float f3p_amp;
  Float f4p_amp;
  Float f5p_amp;
  Float f6p_amp;
  Float npv_amp;
  Float f1v_amp;
  Float f2v_amp;
  Float f3v_amp;
  Float f4v_amp;
  Float tpv_amp;
  Float bypass_amp;
} Coefficients;

typedef struct tagSpeaker {
  short DU;
  short UI;
  short SR;
  short NF;
  short SS;
  short RS;
  short SB;
  short CP;
  short OS;
  short GV;
  short GH;
  short GF;
} Speaker;

typedef struct {
	struct { Float A, B, C; } Coef;
	struct { Float Z1, Z2; } State;
} Resonator;

typedef struct tagLLSynth {
  Synthesizer state;
  Coefficients coefs;
  Speaker spkr;
  Resonator glottal_pulse, spectral_tilt,
    nasal_pole_cascade, formant_1_cascade, formant_2_cascade,
    formant_3_cascade, formant_4_cascade, formant_5_cascade,
    formant_6_cascade, formant_7_cascade, formant_8_cascade,
    formant_2_parallel, formant_3_parallel, formant_4_parallel,
    formant_5_parallel, formant_6_parallel, trach_pole_cascade,
    formant_1_special, formant_2_special, formant_3_special,
    formant_4_special, nasal_pole_special, trach_pole_special;
  Resonator nasal_zero_cascade, trach_zero_cascade;	/* anti-resonators */
  Float out[NUM_OUTPUTS];
} LLSynth;

typedef struct tagLLFrame {
  short NF0;
  short NAV;
  short NOQ;
  short NSQ;
  short NTL;
  short NFL;
  short NDI;
  short NAH;
  short NAF;

  short NF1;
  short NB1;
  short NDF1;
  short NDB1;
  short NF2;
  short NB2;
  short NF3;
  short NB3;
  short NF4;
  short NB4;
  short NF5;
  short NB5;
  short NF6;
  short NB6;

  short NFNP;
  short NBNP;
  short NFNZ;
  short NBNZ;
  short NFTP;
  short NBTP;
  short NFTZ;
  short NBTZ;

  short NA2F;
  short NA3F;
  short NA4F;
  short NA5F;
  short NA6F;
  short NAB;
  short NB2F;
  short NB3F;
  short NB4F;
  short NB5F;
  short NB6F;

  short NANV;
  short NA1V;
  short NA2V;
  short NA3V;
  short NA4V;
  short NATV;
} LLFrame;


#define NUMSPEAKERS 10

typedef enum Speakers        
{
   Paul,
   Betty,
   Harry,
   Frank,        
   Dennis,
   Kit,
   Ursula,
   Rita,
   Wendy,
   Chris
} currentSpeaker;                


typedef struct tagTSpeakerDef{

	HLSpeaker speaker;
	Speaker llspeaker;
 
}TSpeakerDef;

#if 0 // breaks multi-instance
TSpeakerDef speakerDef;
#endif
 
/* Finally come the prototypes for the entry points. */

#define HLSYNAPI

#ifdef __cplusplus
extern "C" {
#endif

extern int HLSYNAPI
LLSynthesize(LLSynth *synth, LLFrame *frame, short *wave);

extern void HLSYNAPI
LLInit(LLSynth *synth, Speaker *spkr);

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

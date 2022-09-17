// FILE NAME : vtminst.h 
// Author    : Murthy Parakala

/**********************************************************************/
/*                                                                    */
/*  Include File: vtminst.h                                           */
/*                                                                    */
/*  This include declares most of the variables used by the DECtalk   */
/*  vocal tract model vtm.c .										  */
/*  This file is a copy of old vtm.h (DECTALK 4.2a).                  */
/*																	  */
/*  All the variables are grouped in a Thread specific structure to	  */
/*	support multiple instances of speech object.					  */
/*																	  */
/*  edit history:													  */
/*  1.  08-Oct-96 EDB/TEK  Add ldspdef variable in VTM_T              */
/*  2   21-May-1997	EAB Added variable icnt for initalization of vtm  */
/*					after a speaker def load.						  */
/*  3?	23mar98		tek		modified for FP_VTM integration			  */
/*  4   03-Apr-97 JL Added AutoTuner Variable TunerData[7]			  */												  
/**********************************************************************/

#ifndef _VTM_INST_H
#define _VTM_INST_H

#include "dectalkf.h"

#ifdef FP_VTM
#include "vtm_f.h"
#endif FP_VTM

#ifdef ASM_FVTM
#include "..\fvtm\fvtmasm.h"
#endif //_ASM_FVTM
#define  MAXIMUM_FRAME_SIZE  100

#define  SAMPLE_RATE_INCREASE   0
#define  SAMPLE_RATE_DECREASE   1
#define  NO_SAMPLE_RATE_CHANGE  2

/* Actual global constants MVP */
/*MVP added on 10/06/95 */
extern S16 noisec ;    /*  "c" coefficient                                    */
extern S32 ranmul ;    /*  Magic constant to make next random number          */
extern S32 ranadd ;    /*  Magic constant to make next random number          */

  
/**********************************************************************/
/*  Declare and initialize the sample rate scaling parameters.        */
/**********************************************************************/

typedef struct VTM_T {

//All variables in VTM.H 
UINT uiSampleRateChange;
S16 rate_scale ;
S16 inv_rate_scale ;
/*double SamplePeriod ;*/	 /* Move this to Kernel_share_data.This is because
                             The "synchronization thread" use this variable before
							 the VTM thread allocates thread specific structure and
							 assigns in pHTTS pointer.
							 */

/**********************************************************************/
/**********************************************************************/
/*  Define input parameter array and the audio sample output array    */
/*  for the vocal tract model. The input parameter array is used to   */
/*  store "speaker" and "voice" parameters from function "ph".        */
/**********************************************************************/
/**********************************************************************/
#ifdef ASM_FVTM
S16 iwave[128];
S16 parambuff[128];
U32 uiNumberOfSamplesPerFrame;
FVTM_T Fvtm;           /* Instance variable for assembly FVTM.        */
#else
S16 iwave[MAXIMUM_FRAME_SIZE];
DT_PIPE_T parambuff[33];
UINT uiNumberOfSamplesPerFrame ;
#endif

double SampleRate;

/**********************************************************************/
/*  Flag to test for sample rate conversion. (Not currently used)     */
/**********************************************************************/

BOOL bEightKHz; 

#ifdef FP_VTM // things used by the FP vocal tract
FLTPNT_T fSampleRateScale;
FLTPNT_T fFormantScale;
FLTPNT_T fInverseSampleRateScale;
/**********************************************************************/
/*  Speaker defined gain factors.                                     */
/**********************************************************************/
FLTPNT_T SpeakerAsperationGain;
FLTPNT_T SpeakerFricationGain;
FLTPNT_T OutputScaleFactor;
FLTPNT_T SpeakerBreathinessGain;
FLTPNT_T SpeakerVoicingGain;
FLTPNT_T PartialCascadePathGain;
 
  /********************************************************************/
  /*  Counters                                                        */
  /********************************************************************/

  unsigned int uiNs;  /*  Number of samples into current frame */
  unsigned int uiVoicePeriodSampleNumber;

  /********************************************************************/
  /*  Counter limits                                                  */
  /********************************************************************/

  int iNumOpenSamples;  /*  Number of samples in open phase of period   */
  int iPositionToStartNoiseModulation;


  FLTPNT_T fMaximumFrequency;

  /********************************************************************/
  /*  Signals.                                                        */
  /********************************************************************/

  FLTPNT_T DifferentiatedGlottalFlow;
  FLTPNT_T DifferentiatedVoicing;


  FLTPNT_T k1;        /*  Equals nopen1 for glottal period duration.    */
  FLTPNT_T k2;        /*  Equals nopen2 for glottal period duration.    */
  int T0Jitter;  /*  Alternating jitter for voicing period         */
  FLTPNT_T a; /*  Makes glottal pulse when open          */
  FLTPNT_T b; /*  Makes glottal pulse when open          */


/**********************************************************************/
/*  Coefficients for the down-sampling low pass filter.               */
/**********************************************************************/

FLTPNT_T LowPass_b0;
FLTPNT_T LowPass_a1;
FLTPNT_T LowPass_a2;


/**********************************************************************/
/*  The nasal resonator filter coefficients.                          */
/**********************************************************************/

FLTPNT_T NasalResonator_b0;
FLTPNT_T NasalResonator_a1;
FLTPNT_T NasalResonator_a2;



  /********************************************************************/
  /*  Resonator and anti-resonator delays.                            */
  /********************************************************************/

  FLTPNT_T p2_Delay_1;
  FLTPNT_T p2_Delay_2;
  FLTPNT_T p3_Delay_1;
  FLTPNT_T p3_Delay_2;
  FLTPNT_T p4_Delay_1;
  FLTPNT_T p4_Delay_2;
  FLTPNT_T p5_Delay_1;
  FLTPNT_T p5_Delay_2;
  FLTPNT_T p6_Delay_1;
  FLTPNT_T p6_Delay_2;
  FLTPNT_T c1_Delay_1;
  FLTPNT_T c1_Delay_2;
  FLTPNT_T c2_Delay_1;
  FLTPNT_T c2_Delay_2;
  FLTPNT_T c3_Delay_1;
  FLTPNT_T c3_Delay_2;
  FLTPNT_T c4_Delay_1;
  FLTPNT_T c4_Delay_2;
  FLTPNT_T c5_Delay_1;
  FLTPNT_T c5_Delay_2;
  FLTPNT_T NasalDelay_1;
  FLTPNT_T NasalDelay_2;
  FLTPNT_T LowPassDelay_1;
  FLTPNT_T LowPassDelay_2;
  FLTPNT_T NoiseDelay_1;
  FLTPNT_T NoiseDelay_2;
  FLTPNT_T VoiceTiltDelay;
  FLTPNT_T NoiseTiltDelay;

  /********************************************************************/
  /*  Coefficients of parallel resonators for formants 2 through 6.   */
  /********************************************************************/

FLTPNT_T p4_a1;
FLTPNT_T p4_a2;

FLTPNT_T p5_a1;
FLTPNT_T p5_a2;
  /********************************************************************/
  /*  Coefficients of cascade resonators for formants 2 through 6.    */
  /********************************************************************/

  FLTPNT_T CascadePathGain;
  FLTPNT_T c1_b0;
  FLTPNT_T c1_a1;
  FLTPNT_T c1_a2;
  FLTPNT_T c2_b0;
  FLTPNT_T c2_a1;
  FLTPNT_T c2_a2;
  FLTPNT_T c3_b0;
  FLTPNT_T c3_a1;
  FLTPNT_T c3_a2;

FLTPNT_T c4_b0;
FLTPNT_T c4_a1;
FLTPNT_T c4_a2;

FLTPNT_T c5_b0;
FLTPNT_T c5_a1;
FLTPNT_T c5_a2;

  /********************************************************************/
  /*  Coefficients for the noise source filters.                      */
  /********************************************************************/

  FLTPNT_T GlottalSourceTilt_a1;
  FLTPNT_T GlottalSourceTilt_b0;

  /********************************************************************/
  /*  The bandwidths of F2 and F3 for the frication path.             */
  /********************************************************************/

  /********************************************************************/
  /*  The nasal anti-resonator filter coefficients.                   */
  /********************************************************************/

  FLTPNT_T Nasal_b0;
  FLTPNT_T Nasal_b1;
  FLTPNT_T Nasal_b2;

  /********************************************************************/
  /*  Variables used to generate the glottal waveform.                */
  /********************************************************************/

  int T0; /* Fundamental period in output samples times 4 */
  FLTPNT_T b0; /*  Makes glottal pulse when open          */

  /********************************************************************/
  /*  Variable gain factors.                                          */
  /********************************************************************/

  FLTPNT_T LaryngealSourceGain;
  FLTPNT_T SpeakerBreathinessPitchSyncGain;
  FLTPNT_T LaryngealSourcePitchSyncGain;

#else // FP_VTM
/**********************************************************************/
/*  VARIABLES TO HOLD SPEAKER DEFINITION FROM HOST:                   */
/**********************************************************************/
S16 t0jitr;    /*  Alternating jitter for voicing period              */
S16 fnscal;    /*  Q12 scale factor for F1inHZ, F2inHZ, and F3inHZ    */

/**********************************************************************/
/*  CONSTANTS OF SPEAKER DEFINITION                                   */
/*  below are r6pa, r6pb, r6pc, rnpa, rnpb, rnpc, rlpa, rlpb, rlpc    */
/**********************************************************************/

/**********************************************************************/
/*  VARIABLES TO HOLD INPUT PARAMETERS FROM HOST:                     */
/**********************************************************************/

S16 Aturb;   /*  Amplitude of breathiness in dB,   0 to   24          */ 

/**********************************************************************/
/*  INTERNAL MEMORY FOR DIGITAL RESONATORS AND ANTIRESONATOR          */
/**********************************************************************/

/* MURTHY : START FROM HERE .......START....START FROM HERE */

S16 r2pd1;    /*  Last output sample from parallel 2nd formant        */
S16 r2pd2;    /*  Second-previous output sample                       */

S16 r3pd1;    /*  Last output sample from parallel 3rd formant        */
S16 r3pd2;    /*  Second-previous output sample                       */

S16 r4pd1;    /*  Last output sample from parallel 4th formant        */
S16 r4pd2;    /*  Second-previous output sample                       */

S16 r5pd1;    /*  Last output sample from parallel 5th formant        */
S16 r5pd2;    /*  Second-previous output sample                       */

S16 r6pd1;    /*  Last output sample from parallel 6th formant        */
S16 r6pd2;    /*  Second-previous output sample                       */

S16 r1cd1;    /*  Last output sample from cascade 1st formant         */
S16 r1cd2;    /*  Second-previous output sample                       */

S16 r2cd1;    /*  Last output sample from cascade 2nd formant         */
S16 r2cd2;    /*  Second-previous output sample                       */

S16 r3cd1;    /*  Last output sample from cascade 3rd formant         */
S16 r3cd2;    /*  Second-previous output sample                       */

S16 r4cd1;    /*  Last output sample from cascade 4th formant         */
S16 r4cd2;    /*  Second-previous output sample                       */

S16 r5cd1;    /*  Last output sample from cascade 5th formant         */
S16 r5cd2;    /*  Second-previous output sample                       */

S16 rnpd1;    /*  Last output sample from cascade nasal pole          */
S16 rnpd2;    /*  Second-previous output sample                       */

S16 rnzd1;    /*  Last output sample from cascade nasal zero          */
S16 rnzd2;    /*  Second-previous output sample                       */

S16 rlpd1;    /*  Last output sample from low-pass filter             */
S16 rlpd2;    /*  Second-previous output sample                       */

S16 ablas1;   /*  Last output sample from nasal anti-resonator        */
S16 ablas2;   /*  Second-previous output sample                       */

S16 vlast;    /*  Last output sample of the tilt filter.              */ /*29*/

/* Used for testing of VTM overloads */
S16 rnpmax;      /*maximum value within filter of casade rnp*/
S16 rnzmax;      /*maximum value within filter of casade rnz*/
S16 c1max;       /*maximum value within filter of casade 1*/
S16 c2max;       /*maximum value within filter of casade 2*/
S16 c3max;       /*maximum value within filter of casade 3*/
S16 c4max;       /*maximum value within filter of casade 4*/
S16 c5max;       /*maximum value within filter of casade 5*/
S16 purevmax;    /*maximum value of downsampled voice */

/**********************************************************************/
/*  MEMORY VARIABLES FOR ONE-POLE and ONE-ZERO FILTERING              */
/**********************************************************************/

S16 nolast;    /*  Previous value of noisea                           */

/**********************************************************************/
/*  COEFFICIENTS FOR DIGITAL RESONATORS AND ANTIRESONATOR             */
/**********************************************************************/

S16 R4pb;      /*  "b" coefficient                                    */
S16 r4pc;      /*  "c" coefficient                                    */

S16 R5pb;      /*  "b" coefficient                                    */
S16 r5pc;      /*  "c" coefficient                                    */

/*S16 r6pb; *//*MVP : According to me it is a constant BILL /*  "b" coefficient*/
/*S16 r6pc; *//*MVP : According to me it is a constant BILL      /*  "c" coefficient                                    */

S16 R1ca;      /*  "a" coefficient for cascade 1st formant            */
S16 r1cb;      /*  "b" coefficient                                    */
S16 r1cc;      /*  "c" coefficient                                    */

S16 R2ca;      /*  "a" coefficient for cascade 2nd formant            */
S16 r2cb;      /*  "b" coefficient                                    */
S16 r2cc;      /*  "c" coefficient                                    */

S16 R3ca;      /*  "a" coefficient for cascade 3rd formant            */
S16 r3cb;      /*  "b" coefficient                                    */
S16 r3cc;      /*  "c" coefficient                                    */

S16 R4ca;      /*  "a" coefficient for cascade 4th formant            */
S16 R4cb;      /*  "b" coefficient                                    */
S16 R4cc;      /*  "c" coefficient                                    */

S16 R5ca;      /*  "a" coefficient for cascade 5th formant            */
S16 R5cb;      /*  "b" coefficient                                    */
S16 R5cc;      /*  "c" coefficient                                    */

S16 rnpa;      /*  "a" coef for nasal pole                            */
S16 rnpb;      /*  "b" coefficient                                    */
S16 rnpc;      /*  "c" coefficient                                    */

S16 rnza;      /*  "a" coefficient for nasal zero                     */
S16 rnzb;      /*  "b" coefficient                                    */
S16 rnzc;      /*  "c" coefficient                                    */

S16 rlpa;      /*  "a" coefficient for low-pass filter                */
S16 rlpb;      /*  "b" coefficient                                    */
S16 rlpc;      /*  "c" coefficient                                    */

S16 noiseb;    /*  "b" coefficient                                    */
S16 decay;     /*  decay coefficient for tilt low-pass filter         */
S16 one_minus_decay;  /*  tilt filter first order iir filter.         */  

/**********************************************************************/
/*  OUTPUT SIGNAL FROM EACH ANTIRESONATOR                             */
/*  (Output of a resonator is r__d1 variable defined above)           */
/**********************************************************************/

/* MVP : The below variables are DONE DONE DONE   */

/**********************************************************************/
/*  OTHER OUTPUT SIGNALS                                              */
/**********************************************************************/

S16 voice0;    /*  Used for glottal pulse waveform generation         */

/**********************************************************************/
/*  FIXED AND VARIABLE GAIN FACTORS                                   */
/**********************************************************************/

S16 avgain;    /*  Gain factor for voicing source                     */
S16 aturb1;    /*  Gain factor for breathiness of voice               */
S16 APgain;    /*  Gain factor for aspiration source                  */
S16 AFgain;    /*  Gain factor for frication source                   */
S16 r3cg;      /*  Gain factor for 3rd formant                        */
S16 r2cg;      /*  Gain factor for 2nd formant                        */
S16 r1cg;      /*  Gain factor for 1st formant                        */

S16 avlin;     /*  AVinDB converted to linear ampl. control           */
S16 avlind;    /*  AV after convert from dB to linear, delayed        */

S16 a;         /*  Makes waveshape of glottal pulse when open         */
S16 b;         /*  Makes waveshape of glottal pulse when open         */

S16 k1;        /*  Equals nopen1 for glottal period duration.         */
S16 k2;        /*  Equals nopen2 for glottal period duration.         */ 

/**********************************************************************/
/*  COUNTERS                                                          */
/**********************************************************************/

S16 nper;      /*  Current loc in voicing period   40000 samp/s       */

/**********************************************************************/
/*  COUNTER LIMITS                                                    */
/**********************************************************************/

S16 T0;        /*  Fundamental period in output samples times 4       */
S16 nopen;     /*  Number of samples in open phase of period          */
S16 nmod;      /*  Position in period to begin noise amp. modul       */ 

/**********************************************************************/
/*  ALL-PURPOSE TEMPORARY VARIABLES                                   */
/**********************************************************************/

S16 temp;

/**********************************************************************/
/*  OTHER VARIABLES                                                   */
/**********************************************************************/
#endif //FP_VTM
S16 randomx;    /*  Varible used by random unmber generator           */
BOOL ldspdef;	// tek/eab 08oct96
S16 icnt;		/* EAB 05/21/97 Added for initalization of vtm after a speaker def load */

/**********************************************************************/
/*  AUTO TUNER VARIABLES											  */
/**********************************************************************/
S16 TunerData[7];
	
} VTM_T,*PVTM_T, **PPVTM_T;
#endif				  /* End of #ifndef _VTM_INST_H */

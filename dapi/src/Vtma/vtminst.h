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
/*                                                                    */
/**********************************************************************/
/*
/* 001 MGS 09/09/1997	Made change for __osf__ */
#ifndef _VTM_INST_H
#define _VTM_INST_H

#ifdef ASM_FVTM
#ifdef __osf__
#include "fvtmasm.h"
#else
#include "..\fvtm\fvtmasm.h"
#endif
#endif
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

S16 randomx;    /*  Varible used by random unmber generator           */
BOOL ldspdef;	// tek/eab 08oct96
} VTM_T,*PVTM_T, **PPVTM_T;
#endif				  /* End of #ifndef _VTM_INST_H */

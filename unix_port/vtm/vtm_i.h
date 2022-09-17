/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	vtm_i.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  This include declares most of the variables used by the DECtalk
 *  vocal tract model vtm_i.c
 *
 ***********************************************************************
 *    Revision History:
 * 0001 23-Mar-95 CJL Change this file from vtm.h to vtm_i.h, add #define
 *                      to prevent multiple includes. Move UINT, DWORD
 *						MAXIMUM_FRAME_SIZE, SAMPLE_RATE_INCREASE,
 *						SAMPLE_RATE_DECREASE and NO_SAMPLE_RATE_CHANGE
 *						defines to viport.h
 */

#ifndef VTM_I_H
#define VTM_I_H

#include "viport.h"
#include "defs.h"

/**********************************************************************/
/*  Define input parameter array and the audio sample output array    */
/*  for the vocal tract model. The input parameter array is used to   */
/*  store "speaker" and "voice" parameters from function "ph".        */
/**********************************************************************/

DT_PIPE_T parambuff[33];
S16 iwave[MAXIMUM_FRAME_SIZE];

/**********************************************************************/
/*  Temporary variables used by in-line functions and by the vocal    */
/*  tract model.                                                      */
/**********************************************************************/

S32 temp0;
S32 temp1;

/**********************************************************************/
/*  VARIABLES TO HOLD SPEAKER DEFINITION FROM HOST:                   */
/**********************************************************************/

S16 f4c;       /*  Frequency of fixed cascade 4th formant             */
S16 b4c;       /*  Bandwidth of fixed cascade 4th formant             */
S16 f5c;       /*  Frequency of fixed cascade 5th formant             */
S16 b5c;       /*  Bandwidth of fixed cascade 5th formant             */
S16 b2p;       /*  Bandwidth of parallel 2th formant                  */
S16 b3p;       /*  Bandwidth of parallel 3th formant                  */
S16 f4p;       /*  Frequency of fixed parallel 4th formant            */
S16 b4p;       /*  Bandwidth of fixed parallel 4th formant            */
S16 f5p;       /*  Frequency of fixed parallel 5th formant            */
S16 b5p;       /*  Bandwidth of fixed parallel 5th formant            */
S16 f6p;       /*  Frequency of fixed parallel 6th formant            */
S16 b6p;       /*  Bandwidth of fixed parallel 6th formant            */
S16 fnp;       /*  Frequency of fixed nasal formant                   */
S16 bnp;       /*  Bandwidth of fixed nasal formant                   */
S16 flp;       /*  Frequency of fixed glottal decimating filter       */
S16 blp;       /*  Bandwidth of fixed glottal decimating filter       */
S16 rlpg;      /*  Gain of down-sampling low-pass resonator           */
S16 t0jitr;    /*  Alternating jitter for voicing period              */
S16 fnscal;    /*  Q12 scale factor for F1inHZ, F2inHZ, and F3inHZ    */
S16 avg;       /*  Gain factor for voicing                            */
S16 abrg;      /*  Gain factor for breathiness                        */
S16 apg;       /*  Gain factor for aspiration                         */
S16 afg;       /*  Gain factor for frication                          */
S16 rnpg;      /*  Gain factor for nasal pole resonator               */
S16 a5gain;    /*  Gain in dB for the 5th cascade resonator.          */
S16 a4gain;    /*  Gain in dB for the 4th cascade resonator.          */
S16 a3gain;    /*  Gain in dB for the 3rd cascade resonator.          */
S16 a2gain;    /*  Gain in dB for the 2nd cascade resonator.          */
S16 a1gain;    /*  Gain in dB for the 1st cascade resonator.          */

/**********************************************************************/
/*  CONSTANTS OF SPEAKER DEFINITION                                   */
/*  below are r6pa, r6pb, r6pc, rnpa, rnpb, rnpc, rlpa, rlpb, rlpc    */
/**********************************************************************/

/**********************************************************************/
/*  VARIABLES TO HOLD INPUT PARAMETERS FROM HOST:                     */
/**********************************************************************/

S16 T0inS4;  /*  Voicing fund freq in Hz*10,      500 to 1650         */
S16 F1inHZ;  /*  First formant freq in Hz,        200 to 1300         */
S16 F2inHZ;  /*  Second formant freq in Hz,       550 to 3000         */
S16 F3inHZ;  /*  Third formant freq in Hz,       1200 to 4800         */
S16 FZinHZ;  /*  Nasal zero freq in Hz,           248 to  528         */
S16 B1inHZ;  /*  First formant bw in Hz,           40 to 1000         */
S16 B2inHZ;  /*  Second formant bw in Hz,          40 to 1000         */
S16 B3inHZ;  /*  Third formant bw in Hz,           40 to 1000         */
S16 AVinDB;  /*  Amp of voicing in dB,             0 to   70          */
S16 APinDB;  /*  Amp of aspiration in dB,          0 to   70          */
S16 A2inDB;  /*  Amp of F2 frication in dB,        0 to   80          */
S16 A3inDB;  /*  Amp of F3 frication in dB,        0 to   80          */
S16 A4inDB;  /*  Amp of F4 frication in dB,        0 to   80          */
S16 A5inDB;  /*  Amp of F5 frication in dB,        0 to   80          */
S16 A6inDB;  /*  Amp of F6                         0 to   80          */
S16 ABinDB;  /*  Amp of bypass fric. in dB,        0 to   80          */
S16 TILTDB;  /*  Voicing spectral tilt in dB,      0 to   24          */
S16 Aturb;   /*  Amplitude of breathiness in dB,   0 to   24          */

/**********************************************************************/
/*  INTERNAL MEMORY FOR DIGITAL RESONATORS AND ANTIRESONATOR          */
/**********************************************************************/

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

S16 vlast;    /*  Last output sample of the tilt filter.              */

/**********************************************************************/
/*  MEMORY VARIABLES FOR ONE-POLE and ONE-ZERO FILTERING              */
/**********************************************************************/

S16 nolast;    /*  Previous value of noisea                           */

/**********************************************************************/
/*  COEFFICIENTS FOR DIGITAL RESONATORS AND ANTIRESONATOR             */
/**********************************************************************/

S16 r2pa;      /*  "a" coef for parallel 2nd formant                  */
S16 r2pb;      /*  "b" coefficient                                    */
S16 r2pc;      /*  "c" coefficient                                    */

S16 r3pa;      /*  "a" coef for parallel 3rd formant                  */
S16 r3pb;      /*  "b" coefficient                                    */
S16 r3pc;      /*  "c" coefficient                                    */

S16 r4pa;      /*  "a" coef for parallel 4th formant                  */
S16 R4pb;      /*  "b" coefficient                                    */
S16 r4pc;      /*  "c" coefficient                                    */

S16 r5pa;      /*  "a" coef for parallel 5th formant                  */
S16 R5pb;      /*  "b" coefficient                                    */
S16 r5pc;      /*  "c" coefficient                                    */

S16 r6pa;      /*  "a" coef for parallel 6th formant                  */
S16 r6pb;      /*  "b" coefficient                                    */
S16 r6pc;      /*  "c" coefficient                                    */

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
S16 noisec;    /*  "c" coefficient                                    */

S16 decay;     /*  decay coefficient for tilt low-pass filter         */
S16 one_minus_decay;  /*  tilt filter first order iir filter.         */

/**********************************************************************/
/*  OUTPUT SIGNAL FROM EACH ANTIRESONATOR                             */
/*  (Output of a resonator is r__d1 variable defined above)           */
/**********************************************************************/

S16 rnzout;    /*  Output signal from nasal zero                      */
S16 about;     /*  Output signal from bypass path                     */

/**********************************************************************/
/*  OTHER OUTPUT SIGNALS                                              */
/**********************************************************************/

S16 noise;     /*  Output of random number generator                  */
S16 voice0;    /*  Used for glottal pulse waveform generation         */
S16 voice;     /*  Current sample of voicing waveform                 */

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
S16 APlin;     /*  AP linear ampl. control                            */
S16 ABlin;     /*  AB linear ampl. control                            */
S16 r2pg;      /*  amp of parameter F2 for iir filter                 */
S16 r3pg;      /*  amp of parameter F3 for iir filter                 */

S16 a;         /*  Makes waveshape of glottal pulse when open         */
S16 b;         /*  Makes waveshape of glottal pulse when open         */

S16 k1;        /*  Equals nopen1 for glottal period duration.         */
S16 k2;        /*  Equals nopen2 for glottal period duration.         */

/**********************************************************************/
/*  COUNTERS                                                          */
/**********************************************************************/

S16 ns;  /*  Number of samples into current frame            */
/* eab was this U32 ns;*/  /*  Number of samples into current frame   */
S16 nper;      /*  Current loc in voicing period   40000 samp/s       */
S16 nsr4;      /*  Counter of 4 samples in glottal source loop        */

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
S16 f;         /*  Frequency argument to setb()                       */
S16 bw;        /*  Bandwidth argument to setc()                       */
S16 gain;      /*  Gain term used in seta() calculations              */

/**********************************************************************/
/*  OTHER VARIABLES                                                   */
/**********************************************************************/

S16 randomx;    /*  Varible used by random unmber generator           */
/*S32 ranmul;*/    /*  Magic constant to make next random number          */
S16 ranmul;    /*  Magic constant to make next random number          */
/*S32 ranadd;*/    /*  Magic constant to make next random number          */
S16  ranadd;    /*  Magic constant to make next random number          */

S16 out;       /*  Output signal from the vocal tract model           */

/* 23-Mar-95 CJL Add to prevent multiple includes.*/
#endif

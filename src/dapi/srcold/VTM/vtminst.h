/* ********************************************************************************* 
 *                                 Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 * ********************************************************************************** */
// FILE NAME : vtminst.h 
// Author    : Murthy Parakala

/************************************************************************************
 *                                                                                            
 *  Include File: vtminst.h                                                                      
 *                                                                                              
 *  This include declares most of the variables used by the DECtalk                               
 *  vocal tract model vtm.c .					                               
 *  This file is a copy of old vtm.h (DECTALK 4.2a).                                            
 *								                               
 *  All the variables are grouped in a Thread specific structure to                             
 *	support multiple instances of speech object.		                               
 *	********************************************************************							                              
 *  edit history:						                                
 *  001		08-Oct-96 		EDB/TEK  	Add ldspdef variable in VTM_T                                        
 *  002		21-May-1997		EAB 		Added variable icnt for initalization of vtm                         
 *										after a speaker def load.				
 *  003?	23mar98			tek			modified for FP_VTM integration			       
 *  004   	03-Apr-97 		JL 			Added AutoTuner Variable TunerData[7]			                
 *  005		10/9/98			EAB 		added new variables for new ad stuff  
 *  006		28oct98			tek			add var to enable tuning taps 
 *  007   	10nov98 		ETT 		added Tom's compression define
 *  008   	12nov98			ETT 		change vtm_fdef.h to vtm_f.h 
 *  009		12nov98			ETT 		fix include for osf. 
 *  010  	19nov98			GL			BATS#826 define vtdTuneResults in FPVTM section
 *  011		25nov98 		ETT			fixed comments for linux AGAIN
 *  012									Added new variables for upgrade code (UPGRADES1999)-not used yet
 *  013		1/19/99 		EAB 		sgain for compression deinfed twice once within ifdef once outside 
 *										removed
 *  014		26jul00 		NAL			Moved "rampdown" to the bottom of the struct - they HAVE to be in this same order!
 *  015 	9/21/00			EAB			Modified for use in the world. 
 *	016		16oct00			CAB			Added copyright info and formatted comment section.
 *  017		02/12/2001		CAB			Updated copright info
 *  018						EAB			added in pointer for demo_noise requested by marketing
 *	019		05/22/2002		CAB			Updated copyright info
 *
 *****************************************************************************************/

#ifndef _VTM_INST_H
#define _VTM_INST_H
 

#include "dectalkf.h"
#ifdef HLSYN
#include "hlsynapi.h"
#endif

#ifdef FP_VTM
#include "vtm_f.h"
#endif //FP_VTM

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

typedef struct VTD_T {

#ifdef HLSYN_NEWPOLE
	S32 rnpd22;    /*  Second-previous output sample                       */
	S32 rnzd22;    /*  Second-previous output sample                       */
#endif

	S32 rnpmax;			/*maximum value within filter of casade rnp*/
	S32 rnzmax;			/*maximum value within filter of casade rnz*/
	S32 c1max;			/*maximum value within filter of casade 1*/
	S32 c2max;			/*maximum value within filter of casade 2*/
	S32 c3max;			/*maximum value within filter of casade 3*/
	S32 c4max;			/*maximum value within filter of casade 4*/
	S32 c5max;			/*maximum value within filter of casade 5*/
	S32 purevmax;		/*maximum value of downsampled voice */
	S32 r2pd1;    /*  Last output sample from parallel 2nd formant        */
	S32 r3pd1;    /*  Last output sample from parallel 3rd formant        */
	S32 r4pd1;    /*  Last output sample from parallel 4th formant        */
	S32 r5pd1;    /*  Last output sample from parallel 5th formant        */
	
	BOOL bDidOverload;	/* true if we trapped an overload */
	DWORD	dwThisPhoneme;	/* phoneme at overload */
	DWORD	dwLastPhoneme;	/* the phoneme just prior */
	// these are the prior delay signals when we trapped.

	S32 r1cd2;    /*  Second-previous output sample                       */
	S32 r2cd2;    /*  Second-previous output sample                       */
	S32 r3cd2;    /*  Second-previous output sample                       */
	S32 r4cd2;    /*  Second-previous output sample                       */
	S32 r5cd2;    /*  Second-previous output sample                       */
	S32 rnpd2;    /*  Second-previous output sample                       */
	S32 rnzd2;    /*  Second-previous output sample                       */
	S32 rlpd2;    /*  Second-previous output sample                       */

} VTM_TUNER_DATA;

// private definitions of function codes for 
// TextToSpeechTuning()
#define TTSTUNING_ENABLE (1)
#define TTSTUNING_DISABLE (2)
#define TTSTUNING_GET_RESULTS (3)



typedef struct VTM_T {

//All variables in VTM.H 
UINT uiSampleRateChange;
short malfem;
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
  S16 parambuff[128];    /* Note: this is in a struct so is not a source of mult. defines! */
  U32 uiNumberOfSamplesPerFrame;
  FVTM_T Fvtm;           /* Instance variable for assembly FVTM.        */
#else
#ifdef DEMO_NOISE
int makenoise;
int pointer;
#endif
  S16 iwave[MAXIMUM_FRAME_SIZE];
  DT_PIPE_T parambuff[41];

 //S16  clobberd;//This variable is getting clobberd why HELP
 S16  lastf1;
 S16  lastfnp;
 S16  lastbw1;
 S16  lastbwp;
  UINT uiNumberOfSamplesPerFrame ;
#endif

int SampleRate;

/**********************************************************************/
/*  Flag to test for sample rate conversion. (Not currently used)     */
/**********************************************************************/

BOOL bEightKHz; 

#ifdef FP_VTM // things used by the FP vocal tract
double fSampleRateScale;
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
  /*****d***************************************************************/

  int iNumOpenSamples;  /*  Number of samples in open phase of period   */
  unsigned int uiPositionToStartNoiseModulation;


  double fMaximumFrequency;

  /********************************************************************/
  /*  Signals.                                                        */
  /********************************************************************/

  FLTPNT_T DifferentiatedGlottalFlow;
  FLTPNT_T DifferentiatedVoicing;


  FLTPNT_T k1;        /*  Equals nopen1 for glottal period duration.    */
  int k2;        /*  Equals nopen2 for glottal period duration.    */
  int T0Jitter;  /*  Alternating jitter for voicing period         */
 FLTPNT_T a; /*  Makes glottal pulse when open */
 FLTPNT_T b; /*  Makes glottal pulse when open */


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

  unsigned int T0; /* Fundamental period in output samples times 4 */
  FLTPNT_T b0; /*  Makes glottal pulse when open          */

  /********************************************************************/
  /*  Variable gain factors.                                          */
  /********************************************************************/

  FLTPNT_T LaryngealSourceGain;
  FLTPNT_T SpeakerBreathinessPitchSyncGain;
  FLTPNT_T LaryngealSourcePitchSyncGain;

/* GL 11/19/1998, define vtdTuneResults here for Alpha NT build*/
/*                remember Alpha NT use FPVTM!!!*/
/* Used for testing of VTM overloads */
VTM_TUNER_DATA vtdTuneResults;
#ifdef COMPRESSION
S16     sGain;  // tek 12oct98 for compression
#endif //COMPRESSION
#else // FP_VTM
/**********************************************************************/
/*  VARIABLES TO HOLD SPEAKER DEFINITION FROM HOST:                   */
/**********************************************************************/
	S16 supra_glot_press;
  S16 DP;
  S16 dpulse;
  S16 amp_voice;
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
#ifdef COMPRESSION
S16     sGain;  // tek 12oct98 for compression
#endif //COMPRESSION

/**********************************************************************/
/*  INTERNAL MEMORY FOR DIGITAL RESONATORS AND ANTIRESONATOR          */
/**********************************************************************/

/* MURTHY : START FROM HERE .......START....START FROM HERE */

S32 r2pd1;    /*  Last output sample from parallel 2nd formant        */
S32 r2pd2;    /*  Second-previous output sample                       */

S32 r3pd1;    /*  Last output sample from parallel 3rd formant        */
S32 r3pd2;    /*  Second-previous output sample                       */

S32 r4pd1;    /*  Last output sample from parallel 4th formant        */
S32 r4pd2;    /*  Second-previous output sample                       */

S32 r5pd1;    /*  Last output sample from parallel 5th formant        */
S32 r5pd2;    /*  Second-previous output sample                       */

S32 r6pd1;    /*  Last output sample from parallel 6th formant        */
S32 r6pd2;    /*  Second-previous output sample                       */

S32 r1cd1;    /*  Last output sample from cascade 1st formant         */
S32 r1cd2;    /*  Second-previous output sample                       */

S32 r2cd1;    /*  Last output sample from cascade 2nd formant         */
S32 r2cd2;    /*  Second-previous output sample                       */

S32 r3cd1;    /*  Last output sample from cascade 3rd formant         */
S32 r3cd2;    /*  Second-previous output sample                       */

S32 r4cd1;    /*  Last output sample from cascade 4th formant         */
S32 r4cd2;    /*  Second-previous output sample                       */

S32 r5cd1;    /*  Last output sample from cascade 5th formant         */
S32 r5cd2;    /*  Second-previous output sample                       */

S32 rnpd1;    /*  Last output sample from cascade nasal pole          */
S32 rnpd2;    /*  Second-previous output sample                       */
S32 rnppd1;
S32 rnppd2;

S32 rnzd1;    /*  Last output sample from cascade nasal zero          */
S32 rnzd2;    /*  Second-previous output sample                       */

S32 rlpd1;    /*  Last output sample from low-pass filter             */
S32 rlpd2;    /*  Second-previous output sample                       */

S32 ablas1;   /*  Last output sample from nasal anti-resonator        */
S32 ablas2;   /*  Second-previous output sample                       */
S32 voicemark;	//save for tuning maxv
S16 rtcc;	//new tilt filter parameter eab 10/9/98
S16 rtcb;	//new tilt filter parameter eab 10/9/98
S16 rtca;	//new tilt filter parameter eab 10/9/98
S16 rtd2;	//new tilt filter parameter eab 10/9/98
S16 rtd1;	//new tilt filter parameter eab 10/9/98

#ifdef TESTING

S32 rtpd1;    /*  Last output sample from cascade tracheal pole          */
S32 rtpd2;    /*  Second-previous output sample                       */

S32 rtzd1;    /*  Last output sample from cascade tracheal zero          */
S32 rtzd2;    /*  Second-previous output sample                       */


S32 rtza;      /*  "a" coefficient for tracheal zero                     */
S16 rtzb;      /*  "b" coefficient                                    */
S16 rtzc;      /*  "c" coefficient                                    */

S32 rtpa;      /*  "a" coef for nasal pole                            */
S16 rtpb;      /*  "b" coefficient                                    */
S16 rtpc;      /*  "c" coefficient                                    */

#endif
S32 vlast;    /*  Last output sample of the tilt filter.              */ /*29*/

/* Used for testing of VTM overloads */
VTM_TUNER_DATA vtdTuneResults;

/**********************************************************************/
/*  MEMORY VARIABLES FOR ONE-POLE and ONE-ZERO FILTERING              */
/**********************************************************************/
#ifdef UPGRADES1999
S16 f1last;
S16 anorm;
S16 logf1;
S16 logf1l;


#endif
S16 noalast;/*	New noise parameters eventually need to eliminate nolast
	but left in for now so I can compile VTM either way with a define in vtm for 
	faster builds */
S16 noblast;
S16 nolast;    /*  Previous value of noisea                           */

/**********************************************************************/
/*  COEFFICIENTS FOR DIGITAL RESONATORS AND ANTIRESONATOR             */
/**********************************************************************/

S16 R4pb;      /*  "b" coefficient                                    */
S16 r4pc;      /*  "c" coefficient                                    */

S16 R5pb;      /*  "b" coefficient                                    */
S16 r5pc;      /*  "c" coefficient                                    */

/*S16 r6pb; *//*MVP : According to me it is a constant BILL "b" coefficient*/
/*S16 r6pc; *//*MVP : According to me it is a constant BILL "c" coefficient                                    */

S16 R1ca;      /*  "a" coefficient for cascade 1st formant            */
S16 r1cb;      /*  "b" coefficient                                    */
S16 r1cc;      /*  "c" coefficient                                    */

#ifdef UPGRADES1999
S16 delr1b;    /* delta r1b */
S16 Up_Down_Flag;
#endif

S32 R2ca;      /*  "a" coefficient for cascade 2nd formant            */
S16 r2cb;      /*  "b" coefficient                                    */
S16 r2cc;      /*  "c" coefficient                                    */

S32 R3ca;      /*  "a" coefficient for cascade 3rd formant            */
S16 r3cb;      /*  "b" coefficient                                    */
S16 r3cc;      /*  "c" coefficient                                    */

S32 R4ca;      /*  "a" coefficient for cascade 4th formant            */
S16 R4cb;      /*  "b" coefficient                                    */
S16 R4cc;      /*  "c" coefficient                                    */

S32 R5ca;      /*  "a" coefficient for cascade 5th formant            */
S16 R5cb;      /*  "b" coefficient                                    */
S16 R5cc;      /*  "c" coefficient                                    */

S32 Rnpa;
S16 rnpa;      /*  "a" coef for nasal pole                            */
S16 rnpb;      /*  "b" coefficient                                    */
S16 rnpc;      /*  "c" coefficient                                    */
#ifdef HLSYN

S32 rnpd12;    /*  Last output sample from cascade nasal pole          */
S32 rnpd22;    /*  Second-previous output sample                       */
S32 rnp2a;      /*  "a" coef for nasal pole                            */
S16 rnp2b;      /*  "b" coefficient                                    */
S16 rnp2c;      /*  "c" coefficient                                    */
S32 rnz2a;      /*  "a" coefficient for nasal zero                     */
S16 rnz2b;      /*  "b" coefficient                                    */
S16 rnz2c;      /*  "c" coefficient                                    */
S32 rnzd12;    /*  Last output sample from cascade nasal zero          */
S32 rnzd22;    /*  Second-previous output sample                       */


#endif

S32 rnppa;      /*  "a" coef for nasal pole                            */
S16 rnppb;      /*  "b" coefficient                                    */
S16 rnppc;      /*  "c" coefficient                                    */

S32 rnza;      /*  "a" coefficient for nasal zero                     */
S16 rnzb;      /*  "b" coefficient                                    */
S16 rnzc;      /*  "c" coefficient                                    */

S32 rlpa;      /*  "a" coefficient for low-pass filter                */
S16 rlpb;      /*  "b" coefficient                                    */
S16 rlpc;      /*  "c" coefficient                                    */

S16 noiseb;    /*  "b" coefficient                                    */
S32 decay;     /*  decay coefficient for tilt low-pass filter         */
S32 one_minus_decay;  /*  tilt filter first order iir filter.         */  

/**********************************************************************/
/*  OUTPUT SIGNAL FROM EACH ANTIRESONATOR                             */
/*  (Output of a resonator is r__d1 variable defined above)           */
/**********************************************************************/

/* MVP : The below variables are DONE DONE DONE   */

/**********************************************************************/
/*  OTHER OUTPUT SIGNALS                                              */
/**********************************************************************/

S16 voice0;    /*  Used for glottal pulse waveform generation         */
S16 sex;
/**********************************************************************/
/*  FIXED AND VARIABLE GAIN FACTORS                                   */
/**********************************************************************/

S16 avgain;    /*  Gain factor for voicing source                     */
S16 aturb1;    /*  Gain factor for breathiness of voice               */
S16 APgain;    /*  Gain factor for aspiration source                  */
S16 AFgain;    /*  Gain factor for frication source                   */
S16 AFcgain;
S16 r3cg;      /*  Gain factor for 3rd formant                        */
S16 r2cg;      /*  Gain factor for 2nd formant                        */
S16 r1cg;      /*  Gain factor for 1st formant                        */

S16 avlin;     /*  AVinDB converted to linear ampl. control           */
S16 avlind;    /*  AV after convert from dB to linear, delayed        */

S16 a;         /*  Makes waveshape of glottal pulse when open         */
S16 b;         /*  Makes waveshape of glottal pulse when open         */

S16 k1;        /*  Equals nopen1 for glottal period duration.         */
S16 k2;        /*  Equals nopen2 for glottal period duration.         */ 

S16	lastFZinHZ;


/**********************************************************************/
/*  COUNTERS                                                          */
/**********************************************************************/

S16 nper;      /*  Current loc in voicing period   40000 samp/s       */
S32 par_count;
S32 cas_count;

/**********************************************************************/
/*  COUNTER LIMITS                                                    */
/**********************************************************************/

S16 T0;        /*  Fundamental period in output samples times 4       */
S16 nopen;     /*  Number of samples in open phase of period          */
S16 topen; /*point at which vocal tract opens eab 10/9/98 */
S16 nmod;      /*  Position in period to begin noise amp. modul       */ 

/**********************************************************************/
/*  ALL-PURPOSE TEMPORARY VARIABLES                                   */
/**********************************************************************/

S32 temp;

/**********************************************************************/
/*  OTHER VARIABLES                                                   */
/**********************************************************************/
#endif //FP_VTM

//#ifdef SINGLE_THREAD
#ifdef OLEDECTALK	//tek 04aug97
  PMARK_DATA pMarkData;
#endif

#ifdef SAPI5DECTALK
  PMARK_DATA pMarkData;
#endif

#ifdef HLSYN
	HLState state, oldstate;
	HLFrame frame, oldframe;
	LLFrame llframe;
	TSpeakerDef speakerDef;
#endif	
	S16 in_region;
	S16 oldA2;
	S16 oldA3;
	S16 oldA4;
	S16 oldA5;
	S16 oldA6;
	S16 oldAB;
  // tek 18nov97 keep track of whether we are close to running out of input data 
  // from PH..
  BOOL	bRunningOutOfInput;
  S16 control;
  DWORD dwSyncParams[4];
  DWORD dwSampleNumber;
  /*MVP added PKSD_T to get the handle of instance specific kernel_share_data*/
 /* MVP Added on 10/06/95 */
  int jitter;
//#endif // SINGLE_THREAD

S16 randomx;    /*  Varible used by random unmber generator           */
BOOL ldspdef;	// tek/eab 08oct96
S16 icnt;		/* EAB 05/21/97 Added for initalization of vtm after a speaker def load */
				//EAB sgain for compression deinfed twice once within ifdef once outside 
				//removed 1/19/1999

/**********************************************************************/
/*  AUTO TUNER VARIABLES											  */
/**********************************************************************/
BOOL bDoTuning; // tek 28oct98 
S16 TunerData[7];
S16 rampdown;	

	short					NOM_UNSTRESSED_VOWEL;
	short					NOM_VOIC_GLOT_AREA;  
	short					NOM_UNVOICED_SON;	
	short					NOM_VOICED_OBSTRUENT;
	short					STRESS_STEP; 
	short					UNSTRESS_PRESSURE; 
	short					STRESS_PRESSURE; 
	short					NOM_Sub_Pressure; 
	short					NOM_Open_Glottis; 
	short					NOM_Area_Chink;
	short					NOM_Open_Quo;
	short					NOM_Fricative_Opening;
	short					NOM_Glot_Stop_Area;
	short					VOT_speed;
	short					EndOfPhrase_Spread;
	short					Tiltm;


} VTM_T,*PVTM_T, **PPVTM_T;

#endif				  /* End of #ifndef _VTM_INST_H */
/* THIS FILE FOR CALLER ID 8khz ONLY---eab 2/8/02*/
/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright (c)        1984                    by Dennis H. Klatt
 * Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.
 * Copyright (c) 1993 Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:	vtm_i.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 * 0001 23-MAR-95 CJL Add vtm_ip.h and auto-generate proto files
 *                    add vtm_idef.h to contain symbol definitions.
 */

/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/
//#define VARIABLE_OPEN_PERIOD
#include "vtm_ip.h"
//#include "vtm_idef.h"
#include "viport.h"
#include "phdefs.h"
//#include "viphdefs.h"
//#include "vismprat.h"   /*  Constants used by the vocal tract model   */
//#include "vtm_i.h"      /*  Variables used by the vocal tract model   */
//#include "vtmtabli.h"   /*  Tables used by the vocal tract model      */
#include "vtmfunci.h"   /*  Functions used by the vocal tract model   */
#include <stdio.h>
/**********************************************************************/
/*  Temporary variables used by in-line functions and by the vocal    */
/*  tract model.                                                      */
/**********************************************************************/

extern S32 temp0;
extern S32 temp1;

/**********************************************************************/
/*  VARIABLES TO HOLD SPEAKER DEFINITION FROM HOST:                   */
/**********************************************************************/

//extern S16 f4c;       /*  Frequency of fixed cascade 4th formant             */
//extern S16 b4c;       /*  Bandwidth of fixed cascade 4th formant             */
//extern S16 f5c;       /*  Frequency of fixed cascade 5th formant             */
//extern S16 b5c;       /*  Bandwidth of fixed cascade 5th formant             */
extern S16 b2p;       /*  Bandwidth of parallel 2th formant                  */
extern S16 b3p;       /*  Bandwidth of parallel 3th formant                  */
//extern S16 f4p;       /*  Frequency of fixed parallel 4th formant            */
extern S16 b4p;       /*  Bandwidth of fixed parallel 4th formant            */
//extern S16 f5p;       /*  Frequency of fixed parallel 5th formant            */
extern S16 b5p;       /*  Bandwidth of fixed parallel 5th formant            */
extern S16 f6p;       /*  Frequency of fixed parallel 6th formant            */
extern S16 b6p;       /*  Bandwidth of fixed parallel 6th formant            */
//extern S16 fnp;       /*  Frequency of fixed nasal formant                   */
//extern S16 bnp;       /*  Bandwidth of fixed nasal formant                   */
extern S16 flp;       /*  Frequency of fixed glottal decimating filter       */
extern S16 blp;       /*  Bandwidth of fixed glottal decimating filter       */
extern S16 rlpg;      /*  Gain of down-sampling low-pass resonator           */
#ifndef MINIMAL_SYNTH
extern S16 t0jitr;    /*  Alternating jitter for voicing period              */
#endif
extern S16 fnscal;    /*  Q12 scale factor for F1inHZ, F2inHZ, and F3inHZ    */
extern S16 avg;       /*  Gain factor for voicing                            */
extern S16 abrg;      /*  Gain factor for breathiness                        */
extern S16 apg;       /*  Gain factor for aspiration                         */
extern S16 afg;       /*  Gain factor for frication                          */
extern S16 rnpg;      /*  Gain factor for nasal pole resonator               */
extern S16 a5gain;    /*  Gain in dB for the 5th cascade resonator.          */
extern S16 a4gain;    /*  Gain in dB for the 4th cascade resonator.          */
extern S16 a3gain;    /*  Gain in dB for the 3rd cascade resonator.          */
extern S16 a2gain;    /*  Gain in dB for the 2nd cascade resonator.          */
extern S16 a1gain;    /*  Gain in dB for the 1st cascade resonator.          */

/**********************************************************************/
/*  CONSTANTS OF SPEAKER DEFINITION                                   */
/*  below are r6pa, r6pb, r6pc, rnpa, rnpb, rnpc, rlpa, rlpb, rlpc    */
/**********************************************************************/

/**********************************************************************/
/*  VARIABLES TO HOLD INPUT PARAMETERS FROM HOST:                     */
/**********************************************************************/

extern S16 T0inS4;  /*  Voicing fund freq in Hz*10,      500 to 1650         */
extern S16 F1inHZ;  /*  First formant freq in Hz,        200 to 1300         */
extern S16 F2inHZ;  /*  Second formant freq in Hz,       550 to 3000         */
extern S16 F3inHZ;  /*  Third formant freq in Hz,       1200 to 4800         */
extern S16 FZinHZ;  /*  Nasal zero freq in Hz,           248 to  528         */
extern S16 B1inHZ;  /*  First formant bw in Hz,           40 to 1000         */
extern S16 B2inHZ;  /*  Second formant bw in Hz,          40 to 1000         */
extern S16 B3inHZ;  /*  Third formant bw in Hz,           40 to 1000         */
extern S16 AVinDB;  /*  Amp of voicing in dB,             0 to   70          */
extern S16 APinDB;  /*  Amp of aspiration in dB,          0 to   70          */
extern S16 A2inDB;  /*  Amp of F2 frication in dB,        0 to   80          */
extern S16 A3inDB;  /*  Amp of F3 frication in dB,        0 to   80          */
extern S16 A4inDB;  /*  Amp of F4 frication in dB,        0 to   80          */
extern S16 A5inDB;  /*  Amp of F5 frication in dB,        0 to   80          */
extern S16 A6inDB;  /*  Amp of F6                         0 to   80          */
extern S16 ABinDB;  /*  Amp of bypass fric. in dB,        0 to   80          */
extern S16 TILTDB;  /*  Voicing spectral tilt in dB,      0 to   24          */
extern S16 Aturb;   /*  Amplitude of breathiness in dB,   0 to   24          */

/**********************************************************************/
/*  INTERNAL MEMORY FOR DIGITAL RESONATORS AND ANTIRESONATOR          */
/**********************************************************************/

extern S16 r2pd1;    /*  Last output sample from parallel 2nd formant        */
extern S16 r2pd2;    /*  Second-previous output sample                       */

extern S16 r3pd1;    /*  Last output sample from parallel 3rd formant        */
extern S16 r3pd2;    /*  Second-previous output sample                       */

extern S16 r4pd1;    /*  Last output sample from parallel 4th formant        */
extern S16 r4pd2;    /*  Second-previous output sample                       */

extern S16 r5pd1;    /*  Last output sample from parallel 5th formant        */
extern S16 r5pd2;    /*  Second-previous output sample                       */

extern S16 r6pd1;    /*  Last output sample from parallel 6th formant        */
extern S16 r6pd2;    /*  Second-previous output sample                       */

extern S16 r1cd1;    /*  Last output sample from cascade 1st formant         */
extern S16 r1cd2;    /*  Second-previous output sample                       */

extern S16 r2cd1;    /*  Last output sample from cascade 2nd formant         */
extern S16 r2cd2;    /*  Second-previous output sample                       */

extern S16 r3cd1;    /*  Last output sample from cascade 3rd formant         */
extern S16 r3cd2;    /*  Second-previous output sample                       */

extern S16 r4cd1;    /*  Last output sample from cascade 4th formant         */
extern S16 r4cd2;    /*  Second-previous output sample                       */

extern S16 r5cd1;    /*  Last output sample from cascade 5th formant         */
extern S16 r5cd2;    /*  Second-previous output sample                       */

extern S16 rnpd1;    /*  Last output sample from cascade nasal pole          */
extern S16 rnpd2;    /*  Second-previous output sample                       */

extern S16 rnzd1;    /*  Last output sample from cascade nasal zero          */
extern S16 rnzd2;    /*  Second-previous output sample                       */

extern S16 rlpd1;    /*  Last output sample from low-pass filter             */
extern S16 rlpd2;    /*  Second-previous output sample                       */

extern S16 ablas1;   /*  Last output sample from nasal anti-resonator        */
extern S16 ablas2;   /*  Second-previous output sample                       */

extern S16 vlast;    /*  Last output sample of the tilt filter.              */

/**********************************************************************/
/*  MEMORY VARIABLES FOR ONE-POLE and ONE-ZERO FILTERING              */
/**********************************************************************/

extern S16 nolast;    /*  Previous value of noisea                           */

/**********************************************************************/
/*  COEFFICIENTS FOR DIGITAL RESONATORS AND ANTIRESONATOR             */
/**********************************************************************/

extern S16 r2pa;      /*  "a" coef for parallel 2nd formant                  */
extern S16 r2pb;      /*  "b" coefficient                                    */
extern S16 r2pc;      /*  "c" coefficient                                    */

extern S16 r3pa;      /*  "a" coef for parallel 3rd formant                  */
extern S16 r3pb;      /*  "b" coefficient                                    */
extern S16 r3pc;      /*  "c" coefficient                                    */

extern S16 r4pa;      /*  "a" coef for parallel 4th formant                  */
extern S16 R4pb;      /*  "b" coefficient                                    */
extern S16 r4pc;      /*  "c" coefficient                                    */

extern S16 r5pa;      /*  "a" coef for parallel 5th formant                  */
extern S16 R5pb;      /*  "b" coefficient                                    */
extern S16 r5pc;      /*  "c" coefficient                                    */

extern S16 r6pa;      /*  "a" coef for parallel 6th formant                  */
// S16 r6pb;      /*  "b" coefficient                                    */
// S16 r6pc;      /*  "c" coefficient                                    */

extern S16 R1ca;      /*  "a" coefficient for cascade 1st formant            */
extern S16 r1cb;      /*  "b" coefficient                                    */
extern S16 r1cc;      /*  "c" coefficient                                    */

extern S16 R2ca;      /*  "a" coefficient for cascade 2nd formant            */
extern S16 r2cb;      /*  "b" coefficient                                    */
extern S16 r2cc;      /*  "c" coefficient                                    */

extern S16 R3ca;      /*  "a" coefficient for cascade 3rd formant            */
extern S16 r3cb;      /*  "b" coefficient                                    */
extern S16 r3cc;      /*  "c" coefficient                                    */

extern S16 R4ca;      /*  "a" coefficient for cascade 4th formant            */
extern S16 R4cb;      /*  "b" coefficient                                    */
extern S16 R4cc;      /*  "c" coefficient                                    */

// S16 R5ca;      /*  "a" coefficient for cascade 5th formant            */
extern S16 R5cb;      /*  "b" coefficient                                    */
extern S16 R5cc;      /*  "c" coefficient                                    */

extern S16 rnpa;      /*  "a" coef for nasal pole                            */
extern S16 rnpb;      /*  "b" coefficient                                    */
extern S16 rnpc;      /*  "c" coefficient                                    */

extern S16 rnza;      /*  "a" coefficient for nasal zero                     */
extern S16 rnzb;      /*  "b" coefficient                                    */
extern S16 rnzc;      /*  "c" coefficient                                    */

extern S16 rlpa;      /*  "a" coefficient for low-pass filter                */
extern S16 rlpb;      /*  "b" coefficient                                    */
extern S16 rlpc;      /*  "c" coefficient                                    */

// S16 noiseb;    /*  "b" coefficient                                    */
// S16 noisec;    /*  "c" coefficient                                    */

extern S16 decay;     /*  decay coefficient for tilt low-pass filter         */
extern S16 one_minus_decay;  /*  tilt filter first order iir filter.         */

/**********************************************************************/
/*  OUTPUT SIGNAL FROM EACH ANTIRESONATOR                             */
/*  (Output of a resonator is r__d1 variable defined above)           */
/**********************************************************************/

extern S16 rnzout;    /*  Output signal from nasal zero                      */
extern S16 about;     /*  Output signal from bypass path                     */

/**********************************************************************/
/*  OTHER OUTPUT SIGNALS                                              */
/**********************************************************************/

extern S16 noise;     /*  Output of random number generator                  */
extern S16 voice0;    /*  Used for glottal pulse waveform generation         */
extern S16 voice;     /*  Current sample of voicing waveform                 */

/**********************************************************************/
/*  FIXED AND VARIABLE GAIN FACTORS                                   */
/**********************************************************************/

extern S16 avgain;    /*  Gain factor for voicing source                     */
extern S16 aturb1;    /*  Gain factor for breathiness of voice               */
extern S16 APgain;    /*  Gain factor for aspiration source                  */
extern S16 AFgain;    /*  Gain factor for frication source                   */
extern S16 r3cg;      /*  Gain factor for 3rd formant                        */
extern S16 r2cg;      /*  Gain factor for 2nd formant                        */
extern S16 r1cg;      /*  Gain factor for 1st formant                        */

extern S16 avlin;     /*  AVinDB converted to linear ampl. control           */
extern S16 avlind;    /*  AV after convert from dB to linear, delayed        */
extern S16 APlin;     /*  AP linear ampl. control                            */
extern S16 ABlin;     /*  AB linear ampl. control                            */
extern S16 r2pg;      /*  amp of parameter F2 for iir filter                 */
extern S16 r3pg;      /*  amp of parameter F3 for iir filter                 */

extern S16 a;         /*  Makes waveshape of glottal pulse when open         */
extern S16 b;         /*  Makes waveshape of glottal pulse when open         */

extern S16 k1;        /*  Equals nopen1 for glottal period duration.         */
extern S16 k2;        /*  Equals nopen2 for glottal period duration.         */

/**********************************************************************/
/*  COUNTERS                                                          */
/**********************************************************************/

extern S16 ns;  /*  Number of samples into current frame            */
/* eab was this U32 ns;*/  /*  Number of samples into current frame   */
extern S16 nper;      /*  Current loc in voicing period   40000 samp/s       */
extern S16 nsr4;      /*  Counter of 4 samples in glottal source loop        */

/**********************************************************************/
/*  COUNTER LIMITS                                                    */
/**********************************************************************/

extern S16 T0;        /*  Fundamental period in output samples times 4       */
extern S16 nopen;     /*  Number of samples in open phase of period          */
extern S16 nmod;      /*  Position in period to begin noise amp. modul       */

/**********************************************************************/
/*  ALL-PURPOSE TEMPORARY VARIABLES                                   */
/**********************************************************************/

extern S16 temp;
extern S16 f;         /*  Frequency argument to setb()                       */
extern S16 bw;        /*  Bandwidth argument to setc()                       */
extern S16 gain;      /*  Gain term used in seta() calculations              */

/**********************************************************************/
/*  OTHER VARIABLES                                                   */
/**********************************************************************/

extern S16 randomx;    /*  Varible used by random unmber generator           */
/*S32 ranmul;*/    /*  Magic constant to make next random number          */
//extern S16 ranmul;    /*  Magic constant to make next random number          */
/*S32 ranadd;*/    /*  Magic constant to make next random number          */
//extern S16  ranadd;    /*  Magic constant to make next random number          */

extern S16 out;       /*  Output signal from the vocal tract model           */


extern const S16 voices[14];
extern const S16 radius_table[];
extern const S16 amptable[88];
extern const S16 azero_tab[35];
extern const S16 bzero_tab[35];
extern const S16 czero_tab[35];
extern S16 iwave[];

extern short vcount;
extern short cas_count;
extern short par_count;



extern short arg1,arg2; /*eab 3/18/95 for math functions*/	
void VocalTract()
{



	  for ( ns = 0; ns < 51; ns++ )
	  {
		  /******************************************************************/
		  /******************************************************************/
		  /*  NOISE GENERATOR                                               */
		  /******************************************************************/
		  
		  /******************************************************************/
		  /*  NOISE GENERATOR                                               */
		  /******************************************************************/
		  /******************************************************************/
		  
		  randomx = (randomx * 2007) + 12345;
		  noise = randomx >> 2;
		  
		  /******************************************************************/
		  /*  RANDOM NUMBER FOR FRICATION AND ASPIRATION                    */
		  /*  Tilt down aspiration noise spectrum at high freqs by low-pass */
		  /*  filtering. noise = noise + 0.75 * last noise                  */
		  /******************************************************************/
		  
		  arg1=24574;
		  arg2=nolast;
		  noise += frac1mul(  );
		  nolast = noise;
		  
		  /******************************************************************/
		  /*                                                                */
		  /*  Filter with Pi-rotated antiresonator. (This is the same as an */
		  /*  ordinary antiresonator except for the b-coef has it's sign    */
		  /*  flipped). Frequency = 3500, Bandwidth = 1600.                 */
		  /*                                                                */
		  /*  This is a three zero filter, but is implemented as a special  */
		  /*  case because one of the multipliers is 1.0. The input and     */
		  /*  output variable is "noise".                                   */
		  /*                                                                */
		  /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS
		  two_zero_filter_2( noise, ablas1, ablas2, -1873, 1499 );
#else
		  two_zero_filter_2( &noise, &ablas1, &ablas2, -1873, 1499 );
#endif		  
		  /******************************************************************/
		  /*  Amplitude modulate noise. Reduce noise amplitude during the   */
		  /*  second half of the glottal period if "avlin" > 0. "nmod" is   */
		  /*  set to 0 if "avlin" is zero, i.e. the glottal source is off.  */
		  /******************************************************************/
		  
		  if ( nper < nmod )
			  noise >>= 1;
		  
		  
		  /******************************************************************/
		  /*  PERIODIC VOICING WAVEFORM                                     */
		  /*  A period has duration of T0 samples, nper is the counter of   */
		  /*  current time. During the first nper = 0 to ( T0 - nopen )     */
		  /*  samples, the glottis is closed. The glottis opens at time     */
		  /*  ( T0 - nopen ), and closes at time T0.                        */
		  /******************************************************************/
		  
		  /****************************************************************/
		  /*  Compute next value of voicing wave. Calculate glottal pulse */
		  /*  at 4 times normal sample rate to minimize the quantization  */
		  /*  of the glottal period.                                      */
		  /****************************************************************/
		  
		  /****************************************************************/
		  /*  Future upgrade ?                                            */
		  /*  When glottis closes, reduce F1 and B1.                      */
		  /****************************************************************/
		  
		  
		  
		  /****************************************************************/
		  /*  voicing has fixed waveshape, at**2 - bt**3                  */
		  /****************************************************************/
		  

#ifndef VARIABLE_OPEN_PERIOD 
		  if ( nper > ( T0 - 14 ) && (( T0 - 14 ) >0) )
		  {
			   voice0 = voices[vcount++];
#else
		  if ( nper > ( T0 - nopen ))
		   {

			a -= b;             /*  Fixed waveshape at**2 - bt**3         */
			  voice0 += a >> 4;   /*  Differentiated glottal flow.          */
#endif       

			 
			  
			  avlind = avlin;     /*  Delay action of "avlin" change.       */
		  }
		  else
		  {
			  vcount = 0;
			  voice0 = 0;
		  
		  }
		  /****************************************************************/
		  /*  Scale the glottal waveform using the speaker dependant      */
		  /*  parameter "avgain".                                         */
		  /****************************************************************/
		  
		  
		  
		  voice = frac4mul( voice0, avgain );
		  
		  /****************************************************************/
		  /*  SOME PARAMETERS ARE UPDATED PITCH SYNCHRONOUSLY             */
		  /*  (at sample before glottal close time)                       */
		  /****************************************************************/
		  
		  if ( nper == T0 )
		  {
			  /**************************************************************/
			  /*  Reset period when 'nper' reaches T0, glottis about to     */
			  /*  open.                                                     */
			  /**************************************************************/
			  
			  nper = 0;
			  
			  /**************************************************************/
			  /*  'avlin' moved to 'avlind' after half period.              */
			  /**************************************************************/
			  
			  avlin = amptable[AVinDB + 4];  /*  Convert from dB to linear. */
			  
			  T0 = (T0inS4>>2)-10;          /*  T0inS4 remembers period in case     */	
			  
		  }

#ifndef MINIMAL_SYNTH
        temp = frac4mul( t0jitr, T0 ); /*  Add jitter, if any.        */
        T0 +=  temp;
        t0jitr = -t0jitr;     /*  Change sign for alternating jitter. */
#endif
        /**************************************************************/
        /*  aturb1 is the Speaker definition breathiness coeficient   */
        /**************************************************************/

//        aturb1 = Aturb << 2;

//        if ( F1inHZ < 250 )
//          F1inHZ = 250;

        /**************************************************************/
        /*  Use a one pole iir filter to tilt the glottal source.     */
        /**************************************************************/

        if ( decay >= 0 )
         one_minus_decay = 32767 - decay;
      else
        one_minus_decay = 32767;
        /**************************************************************/
        /*  Set to "nmod" during the first half of the period.        */
        /*  Modulate the amplitude of the noise if "avlin" > 0, i.e.  */
        /*  the glottal source is enabled.                            */
        /**************************************************************/

        nmod = 0;

        if ( avlin > 0 )
          nmod = T0 >> 1;
#ifdef VARIABLE_OPEN_PERIOD  
		arg1=k1;
		arg2=T0;
        //nopen = frac1mul( ) + k2;   /*  in open part of period */

        nopen += ( TILTDB << 2 );      /*  Longer if TILTDB increases */

        if ( nopen < 40 )
          nopen = 80;        /*  Min is 40                            */
        else
          if ( nopen > 263 )
            nopen = 263;     /*  Max is 263                           */

        if ( nopen >= (( T0 * 3 ) >> 2 ))
          nopen = (( T0 * 3 ) >> 2 );    /*  or 3/4 T0                */

        /**************************************************************/
        /*  Reset a & b, which determine shape of glottal waveform.   */
        /*  Let a = (b * nopen) / 3 without doing the divide.         */
        /**************************************************************/
      
        b = B0[nopen-40];


     

        if ( nopen > 95 )
        {
		  arg1=10923;
          arg2 = (S32)b * nopen;

          a = frac1mul( );
        }
        else
        {
			arg1=10923;
			arg2=b;
          temp = frac1mul( );
          a = (S32)temp * nopen;
        }
#endif
        /**************************************************************/
        /*  Set coeficients of variable cascade resonators.           */
        /**************************************************************/

        R3ca = d2pole_cf123( &r3cb, &r3cc, F3inHZ, B3inHZ, r3cg );
        R2ca = d2pole_cf123( &r2cb, &r2cc, F2inHZ, B2inHZ, r2cg );
        R1ca = d2pole_cf123( &r1cb, &r1cc, F1inHZ, B1inHZ, r1cg );

        /**************************************************************/
        /*  Scale up R1 gain here.                                    */
        /**************************************************************/

        if ( R1ca > 16383 )
          R1ca = 16383;

        R1ca = R1ca << 1;

        /**************************************************************/
        /*  Future upgrade ?                                          */
        /*  Set pitch-synchronous changes to F1.                      */
        /**************************************************************/


        /**************************************************************/
        /*  Set coeficients of nasal zero antiresonator by table      */
        /*  lookup.                                                   */
        /**************************************************************/

        temp = ( FZinHZ >> 3 ) - 31;

        if ( temp > 34 )
          temp = 34;

        rnza = azero_tab[temp];
        rnzb = bzero_tab[temp];
        rnzc = czero_tab[temp];
      

      /****************************************************************/
      /*  Downsampling low-pass filter.                               */
      /*  Decimate the glottal pulse from a 40 KHz rate to 10 KHz.    */
      /*  The variable 'rlpd1' is the output of downsampling low-pass */
      /*  filter and is copied back to the variable 'voice'. 'nper'   */
      /*  is the 40 KHz sample counter.                               */
      /****************************************************************/

//      two_pole_filter( voice, &rlpd1, &rlpd2, rlpa, rlpb, rlpc );

  //    voice = rlpd1;
      
	  
	  
    




//	 iwave[ns] = voice;
  if ( (avlind + avlin + APlin ))
	  cas_count = 20;
  else
	  if(cas_count)
		  cas_count--;

if(cas_count == 0)
{
	
	//eab 3/7/01 Compute save has a bug if somehitng nees to be initalized probably in the filters
	//as a voiced cons such as [g] comes on wrong probably get "the dog" clean before re-implementaiton
	  
	   out=0;
	 goto skip_cascade;
	  	
}
	


       /******************************************************************/
    /*  Tilt spectrum down by TILTDB dB at 3 kHz,                     */
    /*  use 1-pole iir filter.                                        */
    /******************************************************************/
	decay = 1073 * TILTDB; /* fixed decay ebruckert 9-04-2002*/
	  arg1=one_minus_decay;
	  arg2=voice;
   voice = frac1mul(  );
	arg1=decay;
	arg2=vlast;
	voice += frac1mul(  );
  vlast = voice;

    /******************************************************************/
    /*  Add breathiness to voicing. Increase noise if Aspiration.     */
    /******************************************************************/

	arg1=aturb1;
	arg2=noise;
    voice += frac1mul(  );

    /******************************************************************/
    /*  Set variable gain of voicing.                                 */
    /*  24-Jul-85  "avlin" moved to "avlind" after half a period.     */
    /******************************************************************/

    voice = frac4mul( avlind, voice );

    /******************************************************************/
    /*  Add aspiration to voicing.                                    */
    /******************************************************************/
	arg1=APlin;
	arg2=noise;
    voice += frac1mul(  );

	//iwave[ns]=voice;

//	continue;

    /******************************************************************/
    /******************************************************************/
    /*                                                                */
    /*  CASCADE VOCAL TRACT, EXCITED BY LARYNGEAL SOURCES             */
    /*                                                                */
    /*  Nasal antiresonator, then formants fnp, f5c, f4c, F3inHZ      */
    /*  F2inHZ, and F1inHZ                                            */
    /*                                                                */
    /******************************************************************/
    /******************************************************************/

    /******************************************************************/
    /*  Nasal Antiresonator of Cascade Vocal Tract:                   */
    /*  rnzout = (rnza * voice) + (rnzb * rnzd1) + (rnzc * rnzd2)     */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS
    two_zero_filter( voice, rnzout, rnzd1, rnzd2, rnza, rnzb, rnzc );
#else
    two_zero_filter( voice, &rnzout, &rnzd1, &rnzd2, rnza, rnzb, rnzc );
#endif
    /******************************************************************/
    /*  Nasal Resonator of Cascade Vocal Tract                        */
    /*  output is rnpd1.                                              */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS
    two_pole_filter( rnzout, rnpd1, rnpd2, rnpa, rnpb, rnpc );
#else
    two_pole_filter( rnzout, &rnpd1, &rnpd2, rnpa, rnpb, rnpc );
#endif
	//iwave[ns] = rnpd1;

    /******************************************************************/
    /*  Fifth Formant                                                 */
    /*  output is r5cd1.                                              */
    /******************************************************************/

	

    /******************************************************************/
    /*  Fourth Formant                                                */
    /*  output is r4cd1.                                              */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS
    two_pole_filter( rnpd1, r4cd1, r4cd2, R4ca, R4cb, R4cc );
#else
    two_pole_filter( rnpd1, &r4cd1, &r4cd2, R4ca, R4cb, R4cc );	
#endif
    /******************************************************************/
    /*  Third Formant                                                 */
    /*  output is r3cd1.                                              */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS
    two_pole_filter( r4cd1, r3cd1, r3cd2, R3ca, r3cb, r3cc );
#else
    two_pole_filter( r4cd1, &r3cd1, &r3cd2, R3ca, r3cb, r3cc );	
#endif

    /******************************************************************/
    /*  Second Formant                                                */
    /*  output is r2cd1.                                              */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS
    two_pole_filter( r3cd1, r2cd1, r2cd2, R2ca, r2cb, r2cc );
#else
    two_pole_filter( r3cd1, &r2cd1, &r2cd2, R2ca, r2cb, r2cc );	
#endif

    /******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  output is r1cd1.                                              */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS
    two_pole_filter( r2cd1, r1cd1, r1cd2, R1ca, r1cb, r1cc );
#else
    two_pole_filter( r2cd1, &r1cd1, &r1cd2, R1ca, r1cb, r1cc );	
#endif

    out = r1cd1;

skip_cascade:

    /******************************************************************/
    /******************************************************************/
    /*                                                                */
    /*  PARALLEL VOCAL TRACT                                          */
    /*                                                                */
    /*  Excited by frication noise source. Uses formant frequencies   */
    /*  f6p, f5p, f4p, F3inHz, F2inHz and bypass path, outputs added  */
    /*  with alternating sign to prevent overflow.                    */
    /*                                                                */
    /******************************************************************/
    /******************************************************************/

    /******************************************************************/
    /*  Sixth Formant of Parallel Vocal Tract                         */
    /******************************************************************/

	if(par_count==0)
		goto skip_parallel;

#ifndef USE_FILTER_FUNCTIONS
    two_pole_filter( noise, r6pd1, r6pd2, r6pa, -5702, -1995 );
#else
    two_pole_filter( noise, &r6pd1, &r6pd2, r6pa, -5702, -1995 );
#endif

    out = r6pd1 - out;

	if(par_count==0)
		goto skip_parallel;

#ifndef USE_FILTER_FUNCTIONS    
      two_pole_filter( noise, r5pd1, r5pd2, r5pa, R5pb, r5pc );
#else
      two_pole_filter( noise, &r5pd1, &r5pd2, r5pa, R5pb, r5pc );	  
#endif
    out = r5pd1 - out;

    /******************************************************************/
    /*  Fourth Formant of Parallel Vocal Tract                        */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS 
    two_pole_filter( noise, r4pd1, r4pd2, r4pa, R4pb, r4pc );
#else
    two_pole_filter( noise, &r4pd1, &r4pd2, r4pa, R4pb, r4pc );
#endif
    out = r4pd1 - out;

    /******************************************************************/
    /*  Third Formant of Parallel Vocal Tract                         */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS 
    two_pole_filter( noise, r3pd1, r3pd2, r3pa, r3pb, r3pc );
#else
    two_pole_filter( noise, &r3pd1, &r3pd2, r3pa, r3pb, r3pc );
#endif

    out = r3pd1 - out;

    /******************************************************************/
    /*  Second Formant of Parallel Vocal Tract                        */
    /******************************************************************/
#ifndef USE_FILTER_FUNCTIONS 
    two_pole_filter( noise, r2pd1, r2pd2, r2pa, r2pb, r2pc );
#else
    two_pole_filter( noise, &r2pd1, &r2pd2, r2pa, r2pb, r2pc );
#endif

    out = r2pd1 - out;

	arg1=ABlin;
	arg2=noise;
    about = frac1mul(  );  /*  Output of bypass path      */

    out = about - out;


    /******************************************************************/
    /*  Bring the signal level up near +/-32767.                      */
    /*  If the sample rate is 8000 Hz. then the peak signal level is  */
    /*  approximately 8000. This is because of the parameters in file */
    /*  phvdef.c for a sample rate of 8000 Hz.                        */
    /*                                                                */
    /*  Very occasionaly a large impulse will be generated. Clip it.  */
    /*  This allows running the volume level much higher.             */
    /******************************************************************/

skip_parallel:

    iwave[ns] = out;
	nper++;
		
  }
  return;
}


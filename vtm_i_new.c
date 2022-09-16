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
#include "vtm_idef.h"
#include "viport.h"
#include "phdefs.h"
//#include "viphdefs.h"
#include "vismprat.h"   /*  Constants used by the vocal tract model   */
#include "vtm_i.h"      /*  Variables used by the vocal tract model   */
#include "vtmtabli.h"   /*  Tables used by the vocal tract model      */
#include "vtmfunci.h"   /*  Functions used by the vocal tract model   */
#include <stdio.h>
#include "speak.h"

extern void read_speaker_definition(void);

short inc=0;

//#include "ainput.h"

static short count=0;
static short samples=0;
short ciwave=0;
short par_count=5;
short cas_count=20;
short vcount;

short ampsum;

//#define USEBUF

#define IWSIZE 510
short iwavefull[IWSIZE];
//short iwavefullA[51];
//short iwavefullB[51];
short togglebuff = 0;
//unsigned char *iwavefull = NULL;
extern short arg1,arg2,arg3; /*eab 3/18/95 for math functions*/
/**********************************************************************/
/*  Function prototypes                                               */
/* 23-mar-95 cjl Replaced by vtm_ip.h.                                                            */
/**********************************************************************/
/*void speech_waveform_generator();                                                                       */
/*void read_speaker_definition();                                                                         */
/*void SetSampleRate( unsigned int uiSampRate );                                          */
/*void InitializeVTM();                                                                                           */
/**********************************************************************/
/**********************************************************************/
/*  speech_waveform_generator                                         */
/**********************************************************************/
/**********************************************************************/

extern short	spc_dma_lengths[];

extern short global_spc_buf[25];

void output_data(void);

void vtmmain(void)
{
	switch(global_spc_buf[0])
	{
	case SPC_type_voice :
		speech_waveform_generator();
		output_data();
		break;
	case SPC_type_speaker :
		read_speaker_definition();
		break;
	default:;
	}
}
extern FILE *outfile;




#if EPSONC33 

void output_data(void)
{
	short *samplesEachPlay;
	short i,y;


#ifdef USEBUF
		for (samples=0;samples<51;samples++)
		{
			iwavefull[ciwave] = iwave[samples];
			ciwave++;
			
			if(ciwave == (IWSIZE))
			{
				AudioOutPlay( iwavefull,  IWSIZE); // play the audio data
				ciwave=0;

			}
		}
	
#else
	AudioOutPlay( iwave, 51); // play the audio data
#endif
}


#else

void output_data(void)
{




#ifdef USEBUF

		for (samples=0;samples<51;samples++)
		{
			iwavefull[ciwave] = iwave[samples];
			ciwave++;
			
			if(ciwave == (IWSIZE))
			{
			fwrite(iwavefull,2,IWSIZE,outfile);
			ciwave=0;
			}
		}


#else
	fwrite(iwave,2,51,outfile);
#endif



}
#endif

//mfgdebug #include "decvoc_i.c"

void speech_waveform_generator()
{
  S16 *variabpars;

  /********************************************************************/
  /********************************************************************/
  /*  READ VARIABLE PARAMETERS FOR ONE FRAME (64 SAMPLES) OF SPEECH   */
  /********************************************************************/
  /********************************************************************/

  variabpars = &global_spc_buf[1];

  /********************************************************************/
  /********************************************************************/
  /*                                                                  */
  /*  Scaling for various sample rates is done in the following       */
  /*  fashion.                                                        */
  /*                                                                  */
  /*  If the sample rate is modified then the formant frequencies,    */
  /*  bandwidths, and the pitch period are all scaled. If the sample  */
  /*  rate is decreased the fifth formant is eliminated, and the gain */
  /*  r2pg is lowered to prevent overload.                            */
  /*                                                                  */
  /********************************************************************/
  /********************************************************************/

  /********************************************************************/
  /* T0inS4 is a time, so it should be scaled if fs != 10K.           */
  /********************************************************************/
  
  T0inS4 = variabpars[OUT_T0];
  //arg1=26214;
  //arg2=T0inS4;
  //T0inS4 = frac1mul( );
  
  
  
  F1inHZ = variabpars[OUT_F1];
 // F1inHZ = frac4mul( F1inHZ, fnscal ) +(S16) ((4096 - (S32)fnscal ) >> 4);
  F2inHZ = variabpars[OUT_F2];
 // F2inHZ = frac4mul( F2inHZ, fnscal ) + (S16) ((4096 - (S32)fnscal ) >> 3);
  F3inHZ = variabpars[OUT_F3];
 // F3inHZ = frac4mul( F3inHZ, fnscal );
  
  /********************************************************************/
  /*  Scale the nasal anti-resonator frequency for the sample rate.   */
  /********************************************************************/
  
  FZinHZ = variabpars[OUT_FZ];
  //arg1= 20480;    /*  Equals 1.25 in Q14 format.     */
  //arg2=FZinHZ;
 // FZinHZ = frac1mul( ) << 1;
  
  
  B1inHZ = variabpars[OUT_B1];
  B2inHZ = variabpars[OUT_B2];
  B3inHZ = variabpars[OUT_B3];
  AVinDB = variabpars[OUT_AV];
  APinDB = variabpars[OUT_AP];
  A2inDB = variabpars[OUT_A2];
  A3inDB = variabpars[OUT_A3];
  A4inDB = variabpars[OUT_A4];
  A5inDB = variabpars[OUT_A5];
  A6inDB = variabpars[OUT_A6];
  ABinDB = variabpars[OUT_AB];
  TILTDB = variabpars[OUT_TLT] - 12;  /*  Tilt in dB at 3 kHz         */
  
  APlin = amptable[APinDB + 10];      /*  Convert dB to linear        */
  r2pg = amptable[A2inDB + 13];       /*  Convert dB to linear        */
  r3pg = amptable[A3inDB + 10];       /*  Convert dB to linear        */
  r4pa = amptable[A4inDB + 7];        /*  Convert dB to linear        */
  r5pa = amptable[A5inDB + 6];        /*  Convert dB to linear        */
  r6pa = amptable[A6inDB + 5];        /*  Convert dB to linear        */
  ABlin = amptable[ABinDB + 5];       /*  Convert dB to linear        */
  
  ampsum = A2inDB + A3inDB + A4inDB + A5inDB + A6inDB + ABinDB;
  if(ampsum)
	  par_count=5;
  else
	  if(par_count)
		  par_count--;

	  APlin = frac4mul( APlin, APgain );  /*  Scale asp by spdef GV       */
	  arg1=r2pg;
	  arg2=AFgain;
	  r2pg = frac1mul(  );    /*  Scale A2 by spdef GF        */
	  arg1=r3pg;
	  arg2=AFgain;
	  r3pg = frac1mul( );    /*  Scale A3 by spdef GF        */
	  arg1=r4pa;
	  arg2=AFgain;
	  r4pa = frac1mul(  );    /*  Scale A4 by spdef GF        */
	  arg1=r5pa;
	  arg2=AFgain;
	  r5pa = frac1mul(  );    /*  Scale A5 by spdef GF        */
	  arg1=r6pa;
	  arg2=AFgain;
	  r6pa = frac1mul( );    /*  Scale A6 by spdef GF        */
	  ABlin = frac4mul( ABlin, AFgain );  /*  Scale AB by spdef GF        */
		
	  d2pole_pf( &rnpb, &rnpc, 290, 70, 0 );
	  rlpa = d2pole_pf( &rlpb, &rlpc, 698, 453, 2400 );
	  

	  /********************************************************************/
	  /*  Set coeficients of variable parallel resonator R2.              */
	  /********************************************************************/
	  
	  b2p = 210;
	  r2pa = d2pole_pf( &r2pb, &r2pc, F2inHZ, b2p, r2pg );
	  
	  /********************************************************************/
	  /*  Set coeficients of variable parallel resonator R3.              */
	  /********************************************************************/
	  
	  b3p = 280;
	  r3pa = d2pole_pf( &r3pb, &r3pc, F3inHZ, b3p, r3pg );
	  
	  /********************************************************************/
	  /********************************************************************/
	  /*  MAIN LOOP. Calculate each sample of the current frame.          */
	  /********************************************************************/
	  /********************************************************************/
	  
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
		  
		  two_zero_filter_2( noise, ablas1, ablas2, -1873, 1499 );
		  
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
			  
			  T0 = T0inS4>>2;          /*  T0inS4 remembers period in case     */	
			  //T0 =65;    //mfgdebug                 /*  more than 1 period in cur frame.    */
			  
			  
		  }

#ifndef MINIAL_SYNTH
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

//      two_pole_filter( voice, rlpd1, rlpd2, rlpa, rlpb, rlpc );

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

    two_zero_filter( voice, rnzout, rnzd1, rnzd2, rnza, rnzb, rnzc );

    /******************************************************************/
    /*  Nasal Resonator of Cascade Vocal Tract                        */
    /*  output is rnpd1.                                              */
    /******************************************************************/

    two_pole_filter( rnzout, rnpd1, rnpd2, rnpa, rnpb, rnpc );
	//iwave[ns] = rnpd1;

    /******************************************************************/
    /*  Fifth Formant                                                 */
    /*  output is r5cd1.                                              */
    /******************************************************************/

	

    /******************************************************************/
    /*  Fourth Formant                                                */
    /*  output is r4cd1.                                              */
    /******************************************************************/

    two_pole_filter( rnpd1, r4cd1, r4cd2, R4ca, R4cb, R4cc );
	
    /******************************************************************/
    /*  Third Formant                                                 */
    /*  output is r3cd1.                                              */
    /******************************************************************/
    two_pole_filter( r4cd1, r3cd1, r3cd2, R3ca, r3cb, r3cc );

    /******************************************************************/
    /*  Second Formant                                                */
    /*  output is r2cd1.                                              */
    /******************************************************************/

    two_pole_filter( r3cd1, r2cd1, r2cd2, R2ca, r2cb, r2cc );

    /******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  output is r1cd1.                                              */
    /******************************************************************/

    two_pole_filter( r2cd1, r1cd1, r1cd2, R1ca, r1cb, r1cc );

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

    two_pole_filter( noise, r6pd1, r6pd2, r6pa, -5702, -1995 );

    out = r6pd1 - out;

	if(par_count==0)
		goto skip_parallel;

     
      two_pole_filter( noise, r5pd1, r5pd2, r5pa, R5pb, r5pc );
    
    out = r5pd1 - out;

    /******************************************************************/
    /*  Fourth Formant of Parallel Vocal Tract                        */
    /******************************************************************/

    two_pole_filter( noise, r4pd1, r4pd2, r4pa, R4pb, r4pc );

    out = r4pd1 - out;

    /******************************************************************/
    /*  Third Formant of Parallel Vocal Tract                         */
    /******************************************************************/

    two_pole_filter( noise, r3pd1, r3pd2, r3pa, r3pb, r3pc );

    out = r3pd1 - out;

    /******************************************************************/
    /*  Second Formant of Parallel Vocal Tract                        */
    /******************************************************************/

    two_pole_filter( noise, r2pd1, r2pd2, r2pa, r2pb, r2pc );

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


/**********************************************************************/
/**********************************************************************/
/*  Function: read_speaker_definition                                 */
/*  Read a 22 words speaker definition packet.                        */
/**********************************************************************/
/**********************************************************************/

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitializeVTM                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: September 27, 1993                                          */
/*                                                                    */
/*  Vocal Tract Model Initialization                                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void InitializeVTM()
{
  static S16 *variabpars;

  /********************************************************************/
  /*  Set up parameters for frame of speech. The parameters will      */
  /*  flush the VTM.                                                  */
  /********************************************************************/

  variabpars = &global_spc_buf[1];

  variabpars[OUT_T0] = 100;
  variabpars[OUT_F1] = 2000;
  variabpars[OUT_F2] = 2000;
  variabpars[OUT_F3] = 2000;
  variabpars[OUT_FZ] = 290;
  variabpars[OUT_B1] = 2000;
  variabpars[OUT_B2] = 2000;
  variabpars[OUT_B3] = 2000;
  variabpars[OUT_AV] = 0;
  variabpars[OUT_AP] = 0;
  variabpars[OUT_A2] = 0;
  variabpars[OUT_A3] = 0;
  variabpars[OUT_A4] = 0;
  variabpars[OUT_A5] = 0;
  variabpars[OUT_A6] = 0;
  variabpars[OUT_AB] = 0;
  variabpars[OUT_TLT] = 18;
	nper=0;
	 ns=0;  /*  Number of samples into current frame            */
/* eab was this U32 ns;*/  /*  Number of samples into current frame   */
 nper=0;      /*  Current loc in voicing period   40000 samp/s       */
 nsr4=0;      /*  Counter of 4 samples in glottal source loop        */

/**********************************************************************/
/*  COUNTER LIMITS                                                    */
/**********************************************************************/

 T0=0;        /*  Fundamental period in output samples times 4       */
 nopen=0;  
  /********************************************************************/
  /*  Call multiple times till the filter delays decay enough.        */
  /********************************************************************/

 // speech_waveform_generator();
 // speech_waveform_generator();
 // speech_waveform_generator();
 // speech_waveform_generator();

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: f1_b1_up()                                              */
/*                                                                    */
/*  PROPOSED NEW CODE FOR DECTALK III                                 */
/*  Set pitch-synchronous changes to F1 (5% increase when glottis     */
/*  open), and B1 (add amount = f1/2 when glottis open).              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/*



extern short last_voice;

/**********************************************************************/
/*                                                                    */
/*                DECtalk Vocal Tract Model                           */
/*                                                                    */
/* Copyright (c)        1984                    by Dennis H. Klatt    */
/* Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.   */
/*                                                                    */
/* Edit history:                                                      */
/*                                                                    */
/*   1.  1-Sep-84 DK  Initial creation                                */
/*                                                                    */
/*   2. 17-Jan-85 DK  Add "multi-pulse" excitation                    */
/*                    (currently disabled).                           */
/*                                                                    */
/*   3. 19-Feb-85 DK  New Code: Change meaning of TILT to             */
/*                    "spread glottis".                               */
/*                                                                    */
/*   4. 10-Mar-85 DK  Reorganize to look more like code used on chip. */
/*                                                                    */
/*   5. 16-Apr-85 DK  Set R6PB = -3728, R6PC = -851                   */
/*                    ( F = 4900, BW = 2500 )                         */
/*                                                                    */
/*   6. 30-Apr-85 DK  Boost gain in cascade F1 to better avoid limit  */
/*                    cycles. Try new random number generator.        */
/*                                                                    */
/*   7. 13-Jul-85 DK  Do not modulate breathiness noise, make glottal */
/*                    closure occur at end of a period, --> T0        */
/*                    continuous when NOPEN changes, fix lptilt()     */
/*                    (MAJOR ERROR), also delete spdef par TILToff.   */
/*                                                                    */
/*   8. 15-Jul-85 DK  TEMPORARY CHANGES FOR FIGURE GENERATION.        */
/*                    see SHOW_VOICING.                               */
/*                                                                    */
/*   9. 22-Jul-85 DK  Add print statements for comparison with SPC    */
/*                    code.                                           */
/*                                                                    */
/*  10. 24-Jul-85 DK  Add small constant to output to avoid sign-bit  */
/*                    noise. Use new variable "AVlind" to delay       */
/*                    change in AV.                                   */
/*                                                                    */
/*  11. 29-Jul-85 DK  Make sure R1ca does not overflow alotted bits.  */
/*                                                                    */
/*  12. 10-Oct-92 BH  Clearly separated comments from code and        */
/*                    added a consistent indentation style.           */
/*                    Removed the changes added in 8 (SHOW_VOICING).  */
/*                    Added in-line functions for filtering. The new  */
/*                    functions are:                                  */
/*                    two_zero_filter, two_zero_filter_2 and          */
/*                    two_pole_filter.                                */
/*                    Set f6p and b6p to get the correct values for   */
/*                    r6pb and r6pc.                                  */
/*                                                                    */
/*  13. 14-JUL-92 BH  Made VTM work at sample rates 8K, 10K, and 11K. */
/*                                                                    */
/*    Klatt synthesizer as implimented on the TI SPC                  */
/*    Modified version of synthesizer described in                    */
/*    J. Acoust. Soc. Am., Mar. 1980. -- new voicing source.          */
/*                                                                    */
/**********************************************************************/



/*delete later*/

#ifdef TESTER

	if (togglebuff ==0)
	{
		for (i=0;i<51;i++,samples++)		
			iwavefullA[samples] = iwave[i];

			togglebuff=1;				
	}
	else
	{
		for (i=0;i<51;i++,samples++)		
			iwavefullB[samples] = iwave[i];

			togglebuff=0;
	}



	if (samples>=(51)){

	if (togglebuff==1)
	AudioOutPlay( (short *)iwavefullA, (51) ); // play the audio data
	else
	AudioOutPlay( (short *)iwavefullB, (51) ); // play the audio data

	samples=0;
	}

#endif



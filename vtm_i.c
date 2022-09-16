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

// help #include "AudioMapping.h"

extern void read_speaker_definition(void);

short inc=0;

static short count=0;
static short samples=0;
short ciwave=0;
short par_count=5;
short cas_count=20;
short vcount=0;

short ampsum;

//#define USEBUF

#define IWSIZE 51
short iwavefull[IWSIZE];
short togglebuff = 0;

extern short arg1,arg2,arg3; /*eab 3/18/95 for math functions */
/**********************************************************************/
/*  Function prototypes                                               */
/* 23-mar-95 cjl Replaced by vtm_ip.h.								  */
/**********************************************************************/
/*void speech_waveform_generator();                                   */
/*void read_speaker_definition();									  */
/*void SetSampleRate( unsigned int uiSampRate );                      */
/*void InitializeVTM();                                               */
/**********************************************************************/
/**********************************************************************/
/*  speech_waveform_generator                                         */
/**********************************************************************/
/**********************************************************************/

extern short	spc_dma_lengths[];

extern short *global_spc_buf;
extern short global_spc_v_buf[VOICE_PARS+2];

void VocalTract();

void output_data(void);

void vtmmain(void)
{
	switch(global_spc_buf[0])
	{
		case SPC_type_voice :
			if(!KS.halting)
			{
				speech_waveform_generator();
			}
			if(!KS.halting)
			{
				output_data();
			}
		break;
	case SPC_type_speaker :
		read_speaker_definition();
		break;
	default:;
	}
}
extern FILE *outfile;




#ifndef OUTPUT_FILE

void output_data(void)
{

#ifdef USEBUF
		for (samples=0;samples<51;samples++)
		{
			iwavefull[ciwave] = iwave[samples];
			ciwave++;
			
			if(ciwave == (IWSIZE))
			{
			AUDIO_OUT_PLAY( iwavefull,  IWSIZE); // play the audio data
				ciwave=0;
			}
		}
	
#else
	AUDIO_OUT_PLAY( iwave, 51); // play the audio data
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
  F1inHZ = frac4mul( F1inHZ, fnscal ) +(S16) ((4096 - (S32)fnscal ) >> 4);
  F2inHZ = variabpars[OUT_F2];
  F2inHZ = frac4mul( F2inHZ, fnscal ) + (S16) ((4096 - (S32)fnscal ) >> 3);
  F3inHZ = variabpars[OUT_F3];
  F3inHZ = frac4mul( F3inHZ, fnscal );
  
  /********************************************************************/
  /*  Scale the nasal anti-resonator frequency for the sample rate.   */
  /********************************************************************/
  
  FZinHZ = variabpars[OUT_FZ];
  arg1= 20480;    /*  Equals 1.25 in Q14 format.     */
  arg2=FZinHZ;
  FZinHZ = frac1mul( ) << 1;
  
  
  B1inHZ = variabpars[OUT_B1];
  B2inHZ = variabpars[OUT_B2];
  B3inHZ = 250; // per ED variabpars[OUT_B3];
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

VocalTract();
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

  global_spc_buf=global_spc_v_buf;

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

 /* speech_waveform_generator();
  speech_waveform_generator();
  speech_waveform_generator();
   speech_waveform_generator();
*/
  return;
}






/**********************************************************************/
*                                                                    
*                DECtalk Vocal Tract Model                           
*                                                                    
* 	Copyright (c)        1984                    by Dennis H. Klatt    
* 	Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.   
* 	Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
*
*
*   Restricted Rights: Use, duplication, or disclosure by the U.S.
*   Government is subject to restrictions as set forth in subparagraph
*   (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
*   52.227-14 Alt. III, as applicable.
*
* 	This software is proprietary to and embodies the confidential
* 	technology of Force Computers Incorporated and other parties.
* 	Possession, use, or copying of this software and media is authorized
* 	only pursuant to a valid written license from Force or an
* 	authorized sublicensor.
*
* ************************************************************************ */
/* ****************************************************************/
/* Edit history:                                                  */
* 001 1-Sep-84 	DK  Initial creation                                                                                                 */
* 002 17-Jan-85		DK  Add "multi-pulse" excitation                    
*                    		(currently disabled).                           
* 003 19-Feb-85		DK  New Code: Change meaning of TILT to             
*                    		"spread glottis".                               
* 004 10-Mar-85 	DK  Reorganize to look more like code used on chip.
*                                                                    
* 005 16-Apr-85 	DK  Set R6PB = -3728, R6PC = -851                   
*                    		( F = 4900, BW = 2500 )                         
* 006 30-Apr-85 	DK  Boost gain in cascade F1 to better avoid limit  
*                    		cycles. Try new random number generator.                                                 
* 007 13-Jul-85 	DK  Do not modulate breathiness noise, make glottal 
*                    		closure occur at end of a period, --> T0        
*                    		continuous when NOPEN changes, fix lptilt()     
*                    		(MAJOR ERROR), also delete spdef par TILToff.                                                                       
* 008 15-Jul-85 	DK  	TEMPORARY CHANGES FOR FIGURE GENERATION.        
*                    			see SHOW_VOICING.                                                                                                 
* 009 22-Jul-85 	DK  	Add print statements for comparison with SPC    
*                    			code.                                                                  
* 010 24-Jul-85 	DK  	Add small constant to output to avoid sign-bit  
*                    		noise. Use new variable "AVlind" to delay       
*                    		change in AV.                                                                                                       
* 011 29-Jul-85 	DK  	Make sure R1ca does not overflow alotted bits.                                                                      
* 012 10-Oct-92 	BH  	Clearly separated comments from code and        
*                    		added a consistent indentation style.           
*                    		Removed the changes added in 8 (SHOW_VOICING).  
*                    		Added in-line functions for filtering. The new  
*                    		functions are:                                  
*                    		two_zero_filter, two_zero_filter_2 and          
*                    		two_pole_filter.
*                    		Set f6p and b6p to get the correct values for
*                    		r6pb and r6pc.
* 013 14-JUL-92 	BH  	Made VTM work at sample rates 8K, 10K, and 11K. 
* 014 08-OCT-96 	EAB 	Fixed three problems							  
*							1. initialize lacking the initialization of   
*						   	   filter param one_minus_decay				  
*							2. Intialiaze variables when a spdef is loaded
*						       otherwise filters can overload.			  
*							3. One packet from last frame stuck so set	  
*						       vocal tract gains to zero for the first	  
*						       frame following a speaker def			  
*						       to make this logiclly a silence packet	  
* 015 01-MAY-97 	tek 	Licensing changes								  
* 016 26-MAY-97 	EAB 	Fixed "poping problem see note in code		  
* 017 04-dec-97 	EAB 	ADDED MANUAL TUNE ROUTINE if MANUAL_TUNE is defined
* 018 01-28/98 		EAB 	Added fix for bats 491 and 554
* 019 23mar98  		tek 	modified for FP_VTM integration	
* 020 04/03/98 		EAB 	Added in new functionality with NEW_VTM (sync glotal noise,
							more genrealized fnp freq setttings. fnp as a frame data parameter. glot_speed
							to make more sinusoidal vocal vibrations for german
* 021 4/27/98 		EAB		Cleaned up code improved it's operation and put everything under the label
							of NEW_VTM and removed NEW_NASAL
* 022 05/22/1998 	MGS 	Moved #endif for FP_VTM lower down
* 023 7/31/98 		EAB		BATS 731   Glotnoise needs to be initalized-doesn't self reset properly otherwise suspect it came up
							negative.
* 024 10/12/98 		EAB 	Modified code for Tom to use much less computes 
							The ifds to be adjusted for lowcompute as well,it was breaking voices 
							having nf >0. 
* 026 10/13/98 		EAB  	added new tilt filter and noise source with improved characterisitics
* 027 10/23/98 		EAB 	Move NEW_NOISE TO DECTALKF.H
* 028  						Modified manual tune ala getmax to look at both values off filter also
							Ifdef out getmax call
* 029 28oct98		tek  	change getmax to be switched on the fly; add COMPRESSION
* 030 1/17/99     			BATS852 There was an error in the way nopen was calculated and the
							boiler plate code was holding back the flood.
* 031 1/20/99 				BATS 858 There was an error in the B0 table where certain values 
	     					of nopen resluted in arithmetic overflow.
* 032 2/18/99 		EAB	 	Modifed back found that another mathematical
		 					error had really caused the problem. Also added in new code for female voice
		 					In order to use glot_speed it affects the gains so much we'll have to adjust for it
		 					(UGH!) This change is to let starteam let me check this in because
		 					it crashed during checkin and I'm a coward
* 033 02/22/99 		EAB 	Added code to support Wang's closing time work you get this
							if you dont define new_tilt and define closing_time
* 034 03/26/99 		EAB 	Added code to support Yubing's closing time method
							also I moved the tilt filter to after avlind contorl because it seems
							more logical to have it go through large excursions with av low or off
* 035 6/9/99 				Noticed that when Bill Hallahan changed the vocal tract he forgot to scale the fnp frequency
							that got supplied at speaker def time making fnp not equal to fnz(bug)
* 036 6/10/99 				Modified behavior of purev and location of avlind being applied because
							otherwise the gain inherent in the rom database doesn't get normalized
							and can result in running out of dynamic range at cascade 1.
* 037 6/11/99 				Modified overload calculation to check at the end of 
							the parallel tract as well as the cascade otherwise we don't 
							really know if we've overloaded(bug)
* 038  						When I relocated voice gain I had to if(avlind) the inclusion of 
							noise into the voicing source....
* 039 /30/99 		EAB 	Fixed setabc declaration -ifdef ou until and if we use the function
* 040 4/7/99 		eab		Modified SP_ for universal phonemes
* 041 10/16/00		CAB		Changed copyright info
*/

      Klatt synthesizer as implimented on the TI SPC                  
      Modified version of synthesizer described in                    
      J. Acoust. Soc. Am., Mar. 1980. -- new voicing source.          */
                                                                    
/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

#include "dectalkf.h"

#ifdef FP_VTM
#include "vtm_fa.c"
#else




#include "port.h"
#include "ph_def.h"     /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"   /*  Constants used by the vocal tract model   */
#if 0
#include "vtm.h"        /*  Variables used by the vocal tract model   */
#endif
#include "vtmtable.h"   /*  Tables used by the vocal tract model      */
#include "vtmfunc.h"    /*  Functions used by the vocal tract model   */
#include "tts.h"            /* MVP MI */
#include "vtminst.h"    /* MVP MI */
#include "ttserr.h"


#ifdef COMPRESSION // tek 29oct98
// this table is Q12 (4096 = x1), and is indexed by sample[14:09]; it is
// the maximum scale factor allowed for an input sample of a given
// magnitude. This avoids having to do tedious calculations on the fly to
// figure out the new gain factor when we hit the roof, at the cost of 
// slightly over-compressing. The table is large enough, however, that the
// maximum overcompression is well under 1dB.
#define COMPRESSION_GAIN_TABLE_SIZE (64)
S16 CompGainTable[COMPRESSION_GAIN_TABLE_SIZE] = {
32358,
32358,
28672,
28074,
24444,
21771,
19703,
18047,
16686,
15543,
14568,
13724,
12985,
12333,
11751,
11229,
10758,
10329,
9938,
9579,
9248,
8942,
8658,
8394,
8148,
7917,
7701,
7497,
7306,
7125,
6954,
6792,
6638,
6492,
6352,
6220,
6093,
5972,
5857,
5746,
5640,
5538,
5440,
5346,
5256,
5168,
5085,
5004,
4925,
4850,
4777,
4706,
4638,
4572,
4508,
4446,
4386,
4327,
4271,
4216,
4162,
4110,
4059,
4010
};
S16 CompGainIncrement = 5; // per-sample gain increase
#endif //COMPRESSION





#define MANUAL_TUNE



#define MAX_TRIGGER         16000

/**********************************************************************/
/*  Function prototypes                                               */
/**********************************************************************/

void speech_waveform_generator(LPTTS_HANDLE_T phTTS);
void read_speaker_definition(LPTTS_HANDLE_T phTTS);
void SetSampleRate( LPTTS_HANDLE_T phTTS, unsigned int uiSampRate );
void InitializeVTM(LPTTS_HANDLE_T phTTS);

void getmax(S16 value,S16 *maxval);		// KSB - Added for testing of max value

void setzeroabc(int f, int bw, int rnpg, short *sacoef,short *sbcoef,short *sccoef);//EAB 3/298 new coef for rnz
#ifdef POSS_FUTURE_FUNCTION
void setabc(int f, int bw, short *acoef,short *bcoef,short *ccoef);
#endif //POSS_FUTURE_FUNCTION

/**********************************************************************/
/**********************************************************************/
/*  speech_waveform_generator                                         */
/**********************************************************************/
/**********************************************************************/

void speech_waveform_generator(LPTTS_HANDLE_T phTTS)
{
  S16 varcatch; /* eab 6/95 */
  S16 *variabpars;
  S32 temp0;       
  S32 temp1;      /* MVP MI moved from vtm.h */
  S16 b2p;       /*  Bandwidth of parallel 2th formant *//* MVP MI moved from vtm.h */
  S16 b3p;       /*  Bandwidth of parallel 3th formant *//* MVP MI moved from vtm.h */
  S16 out;       /*  Output signal from the vocal tract model*/ 
  S16 nsr4;      /*  Counter of 4 samples in glottal source loop        */ 
  U32 ns;        /*  Number of samples into current frame            */
  S16 r3pg;      /*  amp of parameter F3 for iir filter                 */
  S16 r2pg;      /*  amp of parameter F2 for iir filter                 */
  S16 ABlin;     /*  AB linear ampl. control                            */
  S16 APlin;     /*  AP linear ampl. control                            */
  S16 voice;     /*  Current sample of voicing waveform                 */ 
  S16 noise;     /*  Output of random number generator                  */
  S16 input;
#ifdef NEW_NOISE
  S16 noiseb;	//eab 10/12/98 New noise variable
  S16 noisef;
#endif
  S16 about;     /*  Output signal from bypass path          */
  S16 rnzout;    /*  Output signal from nasal zero           */
  S16 T0inS4;    /*  Voicing fund freq in Hz*10, 500 to 1650 */

#ifdef NEW_VTM
  S16 FNPinHZ;   /*Frequency of moveable nasal formant*/
  S16 Glot_step;	/*step for voicing source to make almost sinusoidal for nasal variants*/
//23  BATS 731 EAB 7/31/98 Init glotnoise
  S16 noiseac;
#endif

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
  
#ifdef NEW_TILT
  S16 rtltg;    //10/13/98 Parameter for new tilt filter
  S16 Ftilt;
  S16 BWtilt;

#endif

  S16 r2pa;      /*  "a" coef for parallel 2nd formant                  */
  S16 r2pb;      /*  "b" coefficient                                    */
  S16 r2pc;      /*  "c" coefficient                                    */

  S16 r3pa;      /*  "a" coef for parallel 3rd formant                  */
  S16 r3pb;      /*  "b" coefficient                                    */
  S16 r3pc;      /*  "c" coefficient                                    */
  S16 r4pa;      /*  "a" coef for parallel 4th formant                  */
  S16 r5pa;      /*  "a" coef for parallel 5th formant                  */
  S16 r6pa;      /*  "a" coef for parallel 6th formant                  */
  S16 r6pb = -5702; /*MVP :According to me it is a constant BILL       /*  "b" coefficient */
  S16 r6pc = -1995; /*MVP :According to me it is a constant BILL       /*  "c" coefficient */


#ifdef NEW_VTM
  S16 achink;
  //S16 DiP;
  S16 abreth;
  S16 logf1;
#endif
#if defined UPGRADES1999 || defined NEW_VTM
    S16 temp;
	S16 temp3;
	S16 ampsum;
    S16 OPENQ;		/* Open quotient */
	S16 abrethoff;
	//* dynamic breathiness related to open quoient */
 		
#endif
  

  /* MVP MI */
  PVTM_T pVtm_t = phTTS->pVTMThreadData;
  PKSD_T pKsd_t = phTTS->pKernelShareData;

  /********************************************************************/
  /********************************************************************/
  /*  READ VARIABLE PARAMETERS FOR ONE FRAME (64 SAMPLES) OF SPEECH   */
  /*  Read 18 words of speech frame definition into temp store and    */
  /*  move some parameters into active use immediately (voice-excited */
  /*  ones are updated pitch synchronously to avoid waveform          */
  /*  glitches ).                                                     */
  /********************************************************************/
  /********************************************************************/

  variabpars = &(pVtm_t->parambuff[1]);

  /*EAB If we just loaded a speaker def zero all vocal tract gains
		so that this looks like a silence packet (last packet of previous frame
		stuck here*/

/* EAB 26-MAY-1997 This code is for a problem of occasional popping. The problem was traced to two
unrelated problems creating the same effect. First avlind was initalized but avlin was not. Depending
on exactly when in the glotal phase and the present state of voicing the code was stopped it could 
cause a non-zero value to propagate into the vocal tract during what should have been silence.
The second bug is related to the smoothing variables not all be initalized properly so that it's 
possible to smooth in a non-zero value into the silence packets that of necessity always follows a
speaker definiton packet. To avoid this problem the code below forces the first two frames following
a speaker definition back into being real silence frames(which they are suppose to be) with little 
overhead fixing it here is just as functional as in PH but a lot safer and easier */


  if(pVtm_t->ldspdef >= 1 )
  {
   pVtm_t->ldspdef++;
   variabpars[OUT_AV]=0;
   variabpars[OUT_AP]=0;
   variabpars[OUT_A2]=0;
   variabpars[OUT_A3]=0;
   variabpars[OUT_A4]=0;
   variabpars[OUT_A5]=0;
   variabpars[OUT_A6]=0;
   variabpars[OUT_AB]=0;
   pVtm_t->avlin = 0;
  }

   if(pVtm_t->ldspdef >= 3)
	   pVtm_t->ldspdef =-1;
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

  switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    T0inS4 = frac1mul( pVtm_t->rate_scale, T0inS4 ) << 1;
    break;

  case SAMPLE_RATE_DECREASE:

    T0inS4 = frac1mul( pVtm_t->rate_scale, T0inS4 );
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }

  /********************************************************************/
  /*  Scale F1inHZ, F2inHZ, and F3inHZ up or down in frequency        */
  /*  according to spdef fnscal. Use trick to reduce scaling          */
  /*  performed if F1inHZ or F2inHZ is relatively low.                */
  /********************************************************************/

  F1inHZ = variabpars[OUT_F1];
  F1inHZ = frac4mul( F1inHZ, pVtm_t->fnscal ) + ((4096 - (S32)pVtm_t->fnscal ) >> 4);
  F2inHZ = variabpars[OUT_F2];
  F2inHZ = frac4mul( F2inHZ, pVtm_t->fnscal ) + ((4096 - (S32)pVtm_t->fnscal ) >> 3);
  F3inHZ = variabpars[OUT_F3];
  F3inHZ = frac4mul( F3inHZ, pVtm_t->fnscal );

  /********************************************************************/
  /*  Scale the nasal anti-resonator frequency for the sample rate.   */
  /********************************************************************/

  FZinHZ = variabpars[OUT_FZ];
  

  switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    FZinHZ = frac1mul( pVtm_t->inv_rate_scale, FZinHZ );
    break;

  case SAMPLE_RATE_DECREASE:

    FZinHZ = frac1mul( pVtm_t->inv_rate_scale, FZinHZ ) << 1;
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }


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



  TILTDB = variabpars[OUT_TLT] - 12;  /* Tilt in dB at 3 kHz */
  
  APlin= amptable[APinDB + 10]; /*  Convert dB to linear        */
  r2pg = amptable[A2inDB + 13]; /*  Convert dB to linear        */
  r3pg = amptable[A3inDB + 10]; /*  Convert dB to linear        */
  r4pa = amptable[A4inDB + 7];  /*  Convert dB to linear        */
  r5pa = amptable[A5inDB + 6];  /*  Convert dB to linear        */
  r6pa = amptable[A6inDB + 5];  /*  Convert dB to linear        */
  ABlin= amptable[ABinDB + 5];  /*  Convert dB to linear        */


#ifdef NEW_VTM
  OPENQ = variabpars[OUT_OQ];		/* Open quotient */
  FNPinHZ= variabpars[OUT_FNP];


  switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    FNPinHZ = frac1mul( pVtm_t->inv_rate_scale, FNPinHZ );
    break;

  case SAMPLE_RATE_DECREASE:

    FNPinHZ = frac1mul( pVtm_t->inv_rate_scale, FNPinHZ ) << 1;
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }

  Glot_step = 0;//variabpars[OUT_GS];
  abrethoff = (variabpars[OUT_BR]>>2);

#endif
#ifdef NEW_VTM

   //DiP = variabpars[OUT_DP];
	


	/* TEMPORARY */

	if (OPENQ > 95)    
		OPENQ = 95;

/*	  This new control variable modifies nopen, abreth, TILTDB, and B1.
 *
 *		 OPENQ		Perceived voice quality
 *		-------		-----------------------
 *		 0 - 30		creaky, pressed voice
 *		35 - 65		normal voice
 *		70 - 85		Breathy voice
 *		90 - 100	whisper
 *
 *	   Within the range 10 to 75, OPENQ sets nopen =
 *	    (OPENQ*T0)/100.  Actually use frac4mul(3200,(OPENQ*T0))>>7).
 *	    Outside this range, nopen is truncted
 *	    to a min of 0.1 * T0 and a max of 0.75 * T0.
 *	   Within the range 0 to 100, OPENQ resets TILTDB =
 *	    max[TILTDB,OPENQ-KZ].
 *	    e.g. if KZ=60, TILTDB reaches max of 40 at OPENQ=100
 *	   Within the range 0 to 100, OPENQ resets abreth =
 *	    amptable[max{abrg,OPENQ-KX}].  Arg is truncated if above KY dB
 *	    e.g. if KX=15 and KY = 60, abreth becomes 60 when OPENQ=75
 *	   Within the range 70 to 100, OPENQ resets B1inHZ =
 *	    B1inHZ + (OPENQ-70)*10
 */


	temp = OPENQ - 10;	/* 10 determines OPENQ value at */

	if (temp < 0)    
		temp = 0;	/*  which attain max breathiness */

	if (temp > 55)  
		temp = 55;	/* Max breathiness is 55 dB */
	temp=temp-10; // to strong at moment eab 4/26/99
	if (temp < pVtm_t->Aturb)    
		temp = pVtm_t->Aturb; //eab 5/18/98 try to add breathiness control to PH*/
	//EAB Add capability of control breathiness from PH
	// later perhaps eliminate internal vtm alogrithum
	abreth = amptable[temp+abrethoff];
	
	temp = OPENQ - 60;		/* 0 <= OPENQ <= 100 */

	if (temp > TILTDB)   
		TILTDB = temp;	/* Up to 40 dB of tilt */
	
	if (OPENQ >= 70) 
	{
	    B1inHZ += (OPENQ-65) * 5;
	    B2inHZ += (OPENQ-65) * 2;
	}

#endif

  APlin = frac4mul( APlin, pVtm_t->APgain );  /*  Scale asp by spdef GV       */
  r2pg = frac1mul( r2pg, pVtm_t->AFgain );    /*  Scale A2 by spdef GF        */
  r3pg = frac1mul( r3pg, pVtm_t->AFgain );    /*  Scale A3 by spdef GF        */
  r4pa = frac1mul( r4pa, pVtm_t->AFgain );    /*  Scale A4 by spdef GF        */
  r5pa = frac1mul( r5pa, pVtm_t->AFgain );    /*  Scale A5 by spdef GF        */
  r6pa = frac1mul( r6pa, pVtm_t->AFgain );    /*  Scale A6 by spdef GF        */
  ABlin = frac4mul( ABlin, pVtm_t->AFgain );  /*  Scale AB by spdef GF        */


  /********************************************************************/
  /*  Set coeficients of variable parallel resonator R2.              */
  /********************************************************************/

  b2p = 210;
  r2pa = d2pole_pf( pVtm_t,&r2pb, &r2pc, F2inHZ, b2p, r2pg );

  /********************************************************************/
  /*  Set coeficients of variable parallel resonator R3.              */
  /********************************************************************/

  b3p = 280;
  r3pa = d2pole_pf( pVtm_t,&r3pb, &r3pc, F3inHZ, b3p, r3pg );

  /********************************************************************/
  /********************************************************************/
  /*  MAIN LOOP. Calculate each sample of the current frame.          */
  /********************************************************************/
  /********************************************************************/

  for ( ns = 0; ns < pVtm_t->uiNumberOfSamplesPerFrame; ns++ )
  {
    /******************************************************************/
    /******************************************************************/
    /*  NOISE GENERATOR                                               */
    /******************************************************************/
    /******************************************************************/
#ifndef ACI_LICENSE		//tscode 01may97 ...tek
    pVtm_t->randomx = pVtm_t->randomx * ranmul + ranadd;
    noise = pVtm_t->randomx >> 2;

    /******************************************************************/
    /*  RANDOM NUMBER FOR FRICATION AND ASPIRATION                    */
    /*  Tilt down aspiration noise spectrum at high freqs by low-pass */
    /*  filtering. noise = noise + 0.75 * last noise                  */
    /******************************************************************/

    noise += frac1mul( 24574, pVtm_t->nolast );
    pVtm_t->nolast = noise;

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

    two_zero_filter_2( noise, pVtm_t->ablas1, pVtm_t->ablas2, pVtm_t->noiseb, noisec );

    /******************************************************************/
    /*  Amplitude modulate noise. Reduce noise amplitude during the   */
    /*  second half of the glottal period if "avlin" > 0. "nmod" is   */
    /*  set to 0 if "avlin" is zero, i.e. the glottal source is off.  */
    /******************************************************************/

    if ( pVtm_t->nper < pVtm_t->nmod )
	noise >>= 1;


    /******************************************************************/
    /*  PERIODIC VOICING WAVEFORM                                     */
    /*  A period has duration of T0 samples, nper is the counter of   */
    /*  current time. During the first nper = 0 to ( T0 - nopen )     */
    /*  samples, the glottis is closed. The glottis opens at time     */
    /*  ( T0 - nopen ), and closes at time T0.                        */
    /******************************************************************/

#ifndef LOWCOMPUTE
    for ( nsr4 = 0; nsr4 < 4; nsr4++ )
    {
#endif
      /****************************************************************/
      /*  Compute next value of voicing wave. Calculate glottal pulse */
      /*  at 4 times normal sample rate to minimize the quantization  */
      /*  of the glottal period.                                      */
      /****************************************************************/

      /****************************************************************/
      /*  voicing has fixed waveshape, at**2 - bt**3                  */
      /****************************************************************/

      if ( pVtm_t->nper > ( pVtm_t->T0 - pVtm_t->nopen ))
      {
		 
		(pVtm_t->a) -= pVtm_t->b;             /*  Fixed waveshape at**2 - bt**3         */
		(pVtm_t->voice0) += pVtm_t->a>>4;       /*  Differentiated glottal flow.          */

#ifdef LOW_COST_VERSION

		//notes t1 is with +=20 and >>4
		//t2 is with +=10 and >>5
		//t3 is with +=30 and >>3 modified so that it goes from 1600 to -1 and stays there until
		//it's reset to zero elsewhere
		//t4 I eliminated hat rise falls.
		// t5 t3 setting with no rise-fall
		//low2 insert this
		  //low3 had hs 40 and ap 120
#ifdef out
		  if(pVtm_t->voice0 != -1)
		{

		pVtm_t->voice0 +=200;
		pVtm_t->voice0 += pVtm_t->voice0>>5;
		if(pVtm_t->voice0 >= 16000)
			//pVtm_t->voice0 = 16000;
				pVtm_t->voice0=-1;
		}
		
#endif
		//pVtm_t->voice0 = 16000;
#endif
		
		
		pVtm_t->avlind = pVtm_t->avlin;     /*  Delay action of "avlin" change.       */

      }
      else
      {
#ifdef NEW_VTM
		  /* EAB 4/26/98 When glot_step is a big number, much greater then 10 it represents a more sinusoidal type of vocaliztion
		  and when it is 10 or less it represents an exponential decay which is similar to instantaneous closure in males
		  but with less high frequency energy as seen in many female voice and some males*/

		  if(Glot_step)
			{
				if(pVtm_t->voice0 < 0 && pVtm_t->voice0 < Glot_step)
				{
					if (Glot_step <= 4)
					{
					 pVtm_t->voice0 -=(pVtm_t->voice0 >>Glot_step);
					}
					else
					{
					 pVtm_t->voice0 =pVtm_t->voice0 + Glot_step;
					}
				}else 
					 pVtm_t->voice0  = 0;

			/* exponential decay could cause a long dc build up, beside I'm assuming physiologically
				that at some point the cords just collapse trying 2000 for that figure 4/27/98*/

				if(pVtm_t->voice0 > -2000)
				{
					pVtm_t->voice0  = 0;
				}
			}
			else 
				 pVtm_t->voice0  = 0;
#else
				 pVtm_t->voice0  = 0;

#endif /* NEW_VTM */

      }

    


      /****************************************************************/
      /*  Scale the glottal waveform using the speaker dependant      */
      /*  parameter "avgain".                                         */
      /****************************************************************/
	  /* EAB 6/9/99 It was necessary to move things because otherwise the 
	  average level of the phrom base is not properly normalized while tuning
	  and tuning it later causes overload problems. */

	  voice = frac4mul( pVtm_t->avlind, pVtm_t->voice0 );

      voice = frac4mul( voice, pVtm_t->avgain );
	  //voice += (frac4mul( pVtm_t->voice0, pVtm_t->avgain )>>4);
	  
	  
      /****************************************************************/
      /*  SOME PARAMETERS ARE UPDATED PITCH SYNCHRONOUSLY             */
      /*  (at sample before glottal close time)                       */
      /****************************************************************/

      if ( pVtm_t->nper == pVtm_t->T0 )
      {
	/**************************************************************/
	/*  Reset period when 'nper' reaches T0, glottis about to     */
	/*  open.                                                     */
	/**************************************************************/

	pVtm_t->nper = 0;

	/**************************************************************/
	/*  'avlin' moved to 'avlind' after half period.              */
	/**************************************************************/

	pVtm_t->avlin = amptable[AVinDB + 4];  /*  Convert from dB to linear. */
#ifdef LOWCOMPUTE
	pVtm_t->T0 = T0inS4>>2;          /*  T0inS4 remembers period in case     */
	      /*  more than 1 period in cur frame.    */
	pVtm_t->T0 += frac4mul( (pVtm_t->t0jitr>>2), pVtm_t->T0 ); /*  Add jitter, if any.        */
	
#else
	pVtm_t->T0 = T0inS4;
	      /*  more than 1 period in cur frame.    */
	//pVtm_t->T0 += frac4mul( pVtm_t->t0jitr, pVtm_t->T0 ); /*  Add jitter, if any.        */
	
#endif
			
	pVtm_t->t0jitr = -(pVtm_t->t0jitr);     /*  Change sign for alternating jitter. */

	/**************************************************************/
	/*  aturb1 is the Speaker definition breathiness coeficient   */
	/**************************************************************/

	pVtm_t->aturb1 = pVtm_t->Aturb ;

	if ( F1inHZ < 250 )
	  F1inHZ = 250;

	/**************************************************************/
	/*  Use a one pole iir filter to tilt the glottal source.     */
	/**************************************************************/

	switch( pVtm_t->uiSampleRateChange )
	{
	case SAMPLE_RATE_INCREASE:

	  pVtm_t->decay = 1094 * (S32)TILTDB;
	  break;

	case SAMPLE_RATE_DECREASE:

	  pVtm_t->decay = 1073 * (S32)TILTDB;
	  break;

	case NO_SAMPLE_RATE_CHANGE:

	  pVtm_t->decay = 1094 * (S32)TILTDB;
	  break;

	default:

	  break;
	}


	if ( pVtm_t->decay >= 0 )
	  pVtm_t->one_minus_decay = 32767 - pVtm_t->decay;
	else
	  pVtm_t->one_minus_decay = 32767;

	/**************************************************************/
	/*  Set to "nmod" during the first half of the period.        */
	/*  Modulate the amplitude of the noise if "avlin" > 0, i.e.  */
	/*  the glottal source is enabled.                            */
	/**************************************************************/

	pVtm_t->nmod = 0;

	if ( pVtm_t->avlin > 0 )
	  pVtm_t->nmod = pVtm_t->T0 >> 1;
#ifdef LOWCOMPUTE
	pVtm_t->nopen = frac1mul( pVtm_t->k1, pVtm_t->T0 ) + (pVtm_t->k2>>1);   /*  in open part of period */

#else
#ifdef UPGRADES1999
	/*spdef pars k1 & k2 NOT USED ANYMORE 
	   nopen = frac1mul(k1,T0) + k2; */
		temp3 = OPENQ;
		if (temp3 < 10)    temp3 = 10;
		if (temp3 > 75)    temp3 = 75;
		temp = (temp3*pVtm_t->T0)>>6;
		pVtm_t->nopen = frac4mul(2620,temp);

		switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    pVtm_t->nopen = frac1mul( pVtm_t->rate_scale, pVtm_t->nopen ) << 1;
    break;

  case SAMPLE_RATE_DECREASE:

    pVtm_t->nopen = frac1mul( pVtm_t->rate_scale, pVtm_t->nopen );
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }
#endif //UPGRADES1999

	pVtm_t->nopen = frac1mul( pVtm_t->k1, pVtm_t->T0 ) + pVtm_t->k2;   /*  in open part of period */
#endif


	
#ifndef LOWCOMPUTE

	pVtm_t->nopen += ( TILTDB<<2  );      /*  Longer if TILTDB increases */
	if ( pVtm_t->nopen < 40 )
	  pVtm_t->nopen = 40;        /*  Min is 40                            */
	else
	  if ( pVtm_t->nopen > 263 )
	    pVtm_t->nopen = 263;     /*  Max is 263                           */

	if ( pVtm_t->nopen >= (( pVtm_t->T0 * 3 ) >> 2 ))
	  pVtm_t->nopen = (( pVtm_t->T0 * 3 ) >> 2 );    /*  or 3/4 T0                */
#else

	pVtm_t->nopen += ( TILTDB  );      /*  Longer if TILTDB increases */



	if ( pVtm_t->nopen < 10 )
	  pVtm_t->nopen = 10;        /*  Min is 40                            */
	else
	  if ( pVtm_t->nopen > (263>>2) )
	    pVtm_t->nopen = (263>>2);     /*  Max is 263                           */

	if ( pVtm_t->nopen >= (( pVtm_t->T0 * 3 ) >> 2 ))
	  pVtm_t->nopen = (( pVtm_t->T0 * 3 ) >> 2 );    /*  or 3/4 T0                */
#endif
		/*low4 hs 140 ap 120*/
		//low 5 from >>1 to  >>2
	//pVtm_t->nopen = pVtm_t->T0 >> 2;	


	/**************************************************************/
	/*  Reset a & b, which determine shape of glottal waveform.   */
	/*  Let a = (b * nopen) / 3 without doing the divide.         */
	/**************************************************************/
#ifdef LOWCOMPUTE
	//EAB minus 11 is to make sure we round down in lookup otherwise
	//overflows are possible 1/11/99
	// 1/17/99     BATS852 There was an error in the way nopen was calculated and the
	//				boiler plate code was holding back the flood.
	pVtm_t->b = B0[(pVtm_t->nopen-9)];
#else
	pVtm_t->b = B0[pVtm_t->nopen-40];
#endif


	pVtm_t->temp = pVtm_t->b +1;



	if ( pVtm_t->nopen > 95 )
	{
	  pVtm_t->temp = (S32)pVtm_t->temp * pVtm_t->nopen;
	  pVtm_t->a = frac1mul(10923, pVtm_t->temp );
	}
	else
	{
	  pVtm_t->temp = frac1mul(10923, pVtm_t->temp );
	  pVtm_t->a = (S32)pVtm_t->temp * pVtm_t->nopen;
	}
	//  1/17/99 BATS852 There was an error in the way nopen was calculated 
	//	and the	boiler plate code was holding back the flood.



	/**************************************************************/
	/*  Set coeficients of variable cascade resonators.           */
	/**************************************************************/
#ifdef NEW_VTM

	d2pole_pf( pVtm_t,&pVtm_t->rnpb, &pVtm_t->rnpc,FNPinHZ , 120 ,0 );
#endif

	pVtm_t->R3ca = d2pole_cf123( pVtm_t,pKsd_t,&pVtm_t->r3cb, &pVtm_t->r3cc, F3inHZ, B3inHZ, pVtm_t->r3cg );
	pVtm_t->R2ca = d2pole_cf123( pVtm_t,pKsd_t,&pVtm_t->r2cb, &pVtm_t->r2cc, F2inHZ, B2inHZ, pVtm_t->r2cg );
	pVtm_t->R1ca = d2pole_cf123( pVtm_t,pKsd_t,&pVtm_t->r1cb, &pVtm_t->r1cc, F1inHZ, B1inHZ, pVtm_t->r1cg );

	/**************************************************************/
	/*  Scale up R1 gain here.                                    */
	/**************************************************************/

	if ( pVtm_t->R1ca > 16383 )
	  pVtm_t->R1ca = 16383;

	pVtm_t->R1ca = pVtm_t->R1ca << 1;



#ifdef COMPRESSION
	// tek 29oct98 if this is a silence phoneme, cut the gain back 
	// to make sure we really end up with silence. 
	if (variabpars[OUT_PH] == 0)
	{
		pVtm_t->R3ca = pVtm_t->R3ca >> 1;
		pVtm_t->R2ca = pVtm_t->R2ca >> 1;
		pVtm_t->R1ca = pVtm_t->R1ca >> 1;
	}
#endif //COMPRESSION



#ifndef NEW_VTM
	/**************************************************************/
	/*  Set coeficients of nasal zero antiresonator by table      */
	/*  lookup.                                                   */
	/**************************************************************/
	pVtm_t->temp =FZinHZ;

	pVtm_t->temp = ( FZinHZ >> 3 ) - 31;

	if ( pVtm_t->temp > 34 )
	  pVtm_t->temp = 34;

	pVtm_t->rnza = azero_tab[pVtm_t->temp];
	pVtm_t->rnzb = bzero_tab[pVtm_t->temp];
	pVtm_t->rnzc = czero_tab[pVtm_t->temp];
      } 
#else

	setzeroabc( FZinHZ, 120, 100, &pVtm_t->rnza, &pVtm_t->rnzb, &pVtm_t->rnzc);
	  }

			

#endif /*NEW_VTM*/
	//	pVtm_t->iwave[ns] = voice;
		
   
#ifndef LOWCOMPUTE
		
      /****************************************************************/
      /*  Downsampling low-pass filter.                               */
      /*  Decimate the glottal pulse from a 40 KHz rate to 10 KHz.    */
      /*  The variable 'rlpd1' is the output of downsampling low-pass */
      /*  filter and is copied back to the variable 'voice'. 'nper'   */
      /*  is the 40 KHz sample counter.                               */
      /****************************************************************/

      two_pole_filter( voice, pVtm_t->rlpd1, pVtm_t->rlpd2, pVtm_t->rlpa, pVtm_t->rlpb, pVtm_t->rlpc );

      voice = pVtm_t->rlpd1;

      pVtm_t->nper++;
    }
#else
	
    pVtm_t->rlpd1 = voice;	// for getmax
	pVtm_t->nper++;
	
#endif

    /******************************************************************/
    /*  Tilt spectrum down by TILTDB dB at 3 kHz,                     */
    /*  use 1-pole iir filter.                                        */
    /******************************************************************/

 
#else	//ACI_LICENSE

		doit();
#endif

   /******************************************************************/
    /*  Tilt spectrum down by TILTDB dB at 3 kHz,                     */
    /*  use 1-pole iir filter.                                        */
    /******************************************************************/

    

	voice = frac1mul( pVtm_t->one_minus_decay, voice )
		  + frac1mul( pVtm_t->decay, pVtm_t->vlast );
	pVtm_t->vlast = voice;


    /******************************************************************/
    /*  Add breathiness to voicing. Increase noise if Aspiration.     */
    /******************************************************************/
	/* new pitch sync breathiness */
//    pVtm_t->iwave[ns] = voice ;
    
#ifdef NEW_VTM
	if(	 pVtm_t->avlind) //EAB Don't add breathiness unless voicing...
	{
		noiseac = frac1mul(abreth,noise);
		voice += noiseac;
		voice += frac1mul( pVtm_t->aturb1, noise );
	}

#endif	

    /******************************************************************/
    /*  Set variable gain of voicing.                                 */
    /*  24-Jul-85  "avlin" moved to "avlind" after half a period.     */
    /******************************************************************/
	
//    voice = frac4mul( pVtm_t->avlind, voice );
//	pVtm_t->purev = voice; //eab This captures the true voice level 
	  //but may have other problems see edit trail this may reuire further modification
	  //pVtm_t->iwave[ns] = voice;
	

    /******************************************************************/
    /*  Add aspiration to voicing.                                    */
    /******************************************************************/

	voice += frac1mul( APlin, noise );

	
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
	//pVtm_t->iwave[ns] = voice;
	two_zero_filter( voice, rnzout, pVtm_t->rnzd1, pVtm_t->rnzd2, pVtm_t->rnza, pVtm_t->rnzb, pVtm_t->rnzc );
	//pVtm_t->iwave[ns] = rnzout;
    /******************************************************************/
    /*  Nasal Resonator of Cascade Vocal Tract                        */
    /*  output is rnpd1.                                              */
    /******************************************************************/

    two_pole_filter( rnzout, pVtm_t->rnpd1, pVtm_t->rnpd2, pVtm_t->rnpa, pVtm_t->rnpb, pVtm_t->rnpc );


	//pVtm_t->iwave[ns] =  pVtm_t->rnpd1;

#ifdef LOWER_YET
		pVtm_t->r4cd1= pVtm_t->rnpd1>>3;
#else

		
    /******************************************************************/
    /*  Fifth Formant                                                 */
    /*  output is r5cd1.                                              */
    /******************************************************************/

    if ( pKsd_t->uiSampleRate > 9500 )
    {

	  two_pole_filter( pVtm_t->rnpd1, pVtm_t->r5cd1, pVtm_t->r5cd2, pVtm_t->R5ca, pVtm_t->R5cb, pVtm_t->R5cc );

    }
    else
    {
      pVtm_t->r5cd1 = frac4mul( pVtm_t->R5ca, pVtm_t->rnpd1 ) >> 1;
    }

	

    /******************************************************************/
    /*  Fourth Formant                                                */
    /*  output is r4cd1.                                              */
    /******************************************************************/
	
    two_pole_filter( pVtm_t->r5cd1, pVtm_t->r4cd1, pVtm_t->r4cd2, pVtm_t->R4ca, pVtm_t->R4cb, pVtm_t->R4cc );


#endif
    /******************************************************************/
    /*  Third Formant                                                 */
    /*  output is r3cd1.                                              */
    /******************************************************************/
	
    two_pole_filter( pVtm_t->r4cd1, pVtm_t->r3cd1, pVtm_t->r3cd2, pVtm_t->R3ca, pVtm_t->r3cb, pVtm_t->r3cc );

	//pVtm_t->iwave[ns] =  pVtm_t->r4cd1;
    /******************************************************************/
    /*  Second Formant                                                */
    /*  output is r2cd1.                                              */
    /******************************************************************/

#ifdef LOW_COST_VERSION

    two_pole_filter( (pVtm_t->rnpd1>>4), pVtm_t->r2cd1, pVtm_t->r2cd2, pVtm_t->R2ca, pVtm_t->r2cb, pVtm_t->r2cc );
	//pVtm_t->iwave[ns] = pVtm_t->r2cd1; 
#else
	
	two_pole_filter( pVtm_t->r3cd1, pVtm_t->r2cd1, pVtm_t->r2cd2, pVtm_t->R2ca, pVtm_t->r2cb, pVtm_t->r2cc );
#endif
	

	/******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  output is r1cd1.                                              */
    /******************************************************************/
	
    two_pole_filter( pVtm_t->r2cd1, pVtm_t->r1cd1, pVtm_t->r1cd2, pVtm_t->R1ca, pVtm_t->r1cb, pVtm_t->r1cc );
	
	
     out = pVtm_t->r1cd1;
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

    two_pole_filter( noise, pVtm_t->r6pd1, pVtm_t->r6pd2, r6pa,r6pb, r6pc );

    out = pVtm_t->r6pd1 - out;
#ifndef LOWEST

    /******************************************************************/
    /*  Fifth Formant of Parallel Vocal Tract                         */
    /*  Fifth parallel formant effectively out of circuit if the      */
    /*  sample rate is low enough.                                    */
    /******************************************************************/

    if ( pKsd_t->uiSampleRate > 9600 )
    {
      two_pole_filter( noise, pVtm_t->r5pd1, pVtm_t->r5pd2, r5pa, pVtm_t->R5pb, pVtm_t->r5pc );
    }
    else
    {
      pVtm_t->r5pd1 = 0;
    }

    out = pVtm_t->r5pd1 - out;

    /******************************************************************/
    /*  Fourth Formant of Parallel Vocal Tract                        */
    /******************************************************************/

    two_pole_filter( noise, pVtm_t->r4pd1, pVtm_t->r4pd2, r4pa, pVtm_t->R4pb, pVtm_t->r4pc );

    out = pVtm_t->r4pd1 - out;
#endif
    /******************************************************************/
    /*  Third Formant of Parallel Vocal Tract                         */
    /******************************************************************/

    two_pole_filter( noise, pVtm_t->r3pd1, pVtm_t->r3pd2, r3pa, r3pb, r3pc );

    out = pVtm_t->r3pd1 - out;

    /******************************************************************/
    /*  Second Formant of Parallel Vocal Tract                        */
    /******************************************************************/

    two_pole_filter( noise, pVtm_t->r2pd1, pVtm_t->r2pd2, r2pa, r2pb, r2pc );

    out = pVtm_t->r2pd1 - out;

    about = frac1mul( ABlin, noise );  /*  Output of bypass path      */

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


/* EAB BATS #491 && 554 1/28/98 The statement that the 8K was tuned to +-8000 was 
probably correct but it wasn't supose to be tuned to those levels it was also
suppose to be +-32767- when the vdef got retuned to hotter levels then the compressor
was clipping too much which when fed into a mu-law compressor further degraded the signal
causing it to sound bad. The follwoing code is a simple compressor to raise the average signal level
by 3 db by simply limiting peak excursions whwen they occur */
#ifdef COMPRESSION
	// tek 29oct98 do a simple bit of compression. 
	// This algorithm uses a look-up table to quickly 
	// find the maximum gain for a sample (to avoid having to 
	// do a calculation for each).
	{
		S16 sabs = out;
		S16 stGain;

		// get absolute value..
		if (sabs<0)
			sabs = -sabs;

		pVtm_t->sGain += CompGainIncrement;


		// get the gain from the lookup table
		// shift by 9 gives us six bits of index,
		// because the sign bit is always 0.
		stGain = CompGainTable[(sabs)>>9];
		if (stGain<pVtm_t->sGain)
		{
			// reduce gain
			pVtm_t->sGain = stGain;
		}
		// scale the sample
		// this is probably frac4mul.. at any rate, it's 
		// Q0*Q12
		sabs = (S16)(((S32)sabs * (S32)pVtm_t->sGain)>>12);
		// put it back, with the correct sign
		if (out<0)
		{
	    pVtm_t->iwave[ns] = -sabs;
		}
		else
		{
	    pVtm_t->iwave[ns] = sabs;
		}
	}
#else //COMPRESSION
    if ( out > 16383 )
		out = 16383;
     else if ( out < -16384 )
	  out = -16384;
      pVtm_t->iwave[ns] = out << 1;
#endif //COMPRESSION

	// tek 28oct98 move all the tuning pickups here, so that we can turn them on/off
	// with just one if statement
	if (pVtm_t->bDoTuning)
	{
		BOOL bOverloaded = FALSE;
		DWORD dwPhoneme = variabpars[OUT_PH];

		// keep track of the phonemes..
		if (dwPhoneme != pVtm_t->vtdTuneResults.dwThisPhoneme)
		{
			pVtm_t->vtdTuneResults.dwLastPhoneme = pVtm_t->vtdTuneResults.dwThisPhoneme;
			pVtm_t->vtdTuneResults.dwThisPhoneme = dwPhoneme;
		}

		getmax(pVtm_t->rlpd1,&pVtm_t->vtdTuneResults.purevmax);
		getmax(pVtm_t->rnzd1,&pVtm_t->vtdTuneResults.rnzmax);
		getmax(pVtm_t->rnpd1,&pVtm_t->vtdTuneResults.rnpmax);
		getmax(pVtm_t->r5cd1,&pVtm_t->vtdTuneResults.c5max);
		getmax(pVtm_t->r4cd1,&pVtm_t->vtdTuneResults.c4max);
		getmax(pVtm_t->r3cd1,&pVtm_t->vtdTuneResults.c3max);
		getmax(pVtm_t->r2cd1,&pVtm_t->vtdTuneResults.c2max);
		getmax(pVtm_t->r1cd1,&pVtm_t->vtdTuneResults.c1max);
		getmax(pVtm_t->r2pd1,&pVtm_t->vtdTuneResults.r2pd1);
		getmax(pVtm_t->r3pd1,&pVtm_t->vtdTuneResults.r3pd1);
		getmax(pVtm_t->r4pd1,&pVtm_t->vtdTuneResults.r4pd1);
		//getmax(pVtm_t->r5pd1,&pVtm_t->vtdTuneResults.r5pd1);
		getmax( pVtm_t->iwave[ns],&pVtm_t->vtdTuneResults.r5pd1);
		

		if (  (pVtm_t->vtdTuneResults.purevmax > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.rnzmax > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.rnpmax > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c5max > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c4max > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c3max > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c2max > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c1max > MAX_TRIGGER)
			//eab 6/11/99 Also check output at end of parallel tract
			//becuase we really don't want any overloads......
			||(pVtm_t->vtdTuneResults.r5pd1 > 18000)
			)
		{
			bOverloaded=TRUE;
		}

		
		if (bOverloaded)
		{
			// stop tracing
			pVtm_t->bDoTuning = FALSE;
			pVtm_t->vtdTuneResults.bDidOverload = TRUE;
			pVtm_t->vtdTuneResults.r1cd2 = pVtm_t->r1cd2;
			pVtm_t->vtdTuneResults.r2cd2 = pVtm_t->r2cd2;
			pVtm_t->vtdTuneResults.r3cd2 = pVtm_t->r3cd2;
			pVtm_t->vtdTuneResults.r4cd2 = pVtm_t->r4cd2;
			pVtm_t->vtdTuneResults.r5cd2 = pVtm_t->r5cd2;
			pVtm_t->vtdTuneResults.rnpd2 = pVtm_t->rnpd2;
			pVtm_t->vtdTuneResults.rnzd2 = pVtm_t->rnzd2;
			pVtm_t->vtdTuneResults.rlpd2 = pVtm_t->rlpd2;
		}
	}

	

  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function: read_speaker_definition                                 */
/*  Read a 22 words speaker definition packet.                        */
/**********************************************************************/
/**********************************************************************/

void read_speaker_definition(LPTTS_HANDLE_T phTTS) 
{
  S16 *spdeftochip;
  S16 f4c;       /*  Frequency of fixed cascade 4th formant *//* MVP : Moved from vtm.h*/
  S16 b4c;       /*  Bandwidth of fixed cascade 4th formant *//* MVP : Moved from vtm.h*/
  S16 f5c;       /*  Frequency of fixed cascade 5th formant *//* MVP : Moved from vtm.h*/
  S16 b5c;       /*  Bandwidth of fixed cascade 5th formant *//* MVP : Moved from vtm.h*/
  S16 f4p;       /*  Frequency of fixed parallel 4th formant*//* MVP : Moved from vtm.h*/
  S16 b4p;       /*  Bandwidth of fixed parallel 4th formant*/
  S16 f5p;       /*  Frequency of fixed parallel 5th formant            */
  S16 b5p;       /*  Bandwidth of fixed parallel 5th formant            */
  S16 fnp;       /*  Frequency of fixed nasal formant                   */
  S16 bnp;       /*  Bandwidth of fixed nasal formant                   */
  S16 flp;       /*  Frequency of fixed glottal decimating filter       */
  S16 blp;       /*  Bandwidth of fixed glottal decimating filter       */
  S16 rlpg;      /*  Gain of down-sampling low-pass resonator           */
  S16 avg;       /*  Gain factor for voicing                            */
  S16 apg;       /*  Gain factor for aspiration                         */
  S16 afg;       /*  Gain factor for frication                          */
  S16 rnpg;      /*  Gain factor for nasal pole resonator               */
  S16 a5gain;    /*  Gain in dB for the 5th cascade resonator.          */
  S16 a4gain;    /*  Gain in dB for the 4th cascade resonator.          */
  S16 a3gain;    /*  Gain in dB for the 3rd cascade resonator.          */
  S16 a2gain;    /*  Gain in dB for the 2nd cascade resonator.          */
  S16 a1gain;    /*  Gain in dB for the 1st cascade resonator.          */

  PVTM_T pVtm_t = phTTS->pVTMThreadData;

    /********************************************************************/
  /*  Zero Vocal-Tract-Model parameters.                              */
  /********************************************************************/


	pVtm_t->ldspdef=1;	 /* flag that we loaded a speaker def eab 10/96*/
	pVtm_t->r2pd1 = 0;    /*  Last output sample from parallel 2nd formant        */
	pVtm_t->r2pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r3pd1 = 0;    /*  Last output sample from parallel 3rd formant        */
	pVtm_t->r3pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r4pd1 = 0;    /*  Last output sample from parallel 4th formant        */
	pVtm_t->r4pd2 = 0;    /*  Second-previous output sample                       */
	
	pVtm_t->r5pd1 = 0;    /*  Last output sample from parallel 5th formant        */
	pVtm_t->r5pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r6pd1 = 0;    /*  Last output sample from parallel 6th formant        */
	pVtm_t->r6pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r1cd1 = 0;    /*  Last output sample from cascade 1st formant         */
	pVtm_t->r1cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r2cd1 = 0;    /*  Last output sample from cascade 2nd formant         */
	pVtm_t->r2cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r3cd1 = 0;    /*  Last output sample from cascade 3rd formant         */
	pVtm_t->r3cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r4cd1 = 0;    /*  Last output sample from cascade 4th formant         */
	pVtm_t->r4cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r5cd1 = 0;    /*  Last output sample from cascade 5th formant         */
	pVtm_t->r5cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->rnpd1 = 0;    /*  Last output sample from cascade nasal pole          */
	pVtm_t->rnpd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->rnzd1 = 0;    /*  Last output sample from cascade nasal zero          */
	pVtm_t->rnzd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->rlpd1 = 0;    /*  Last output sample from low-pass filter             */
	pVtm_t->rlpd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->ablas1 = 0;   /*  Last output sample from nasal anti-resonator        */
	pVtm_t->ablas2 = 0;   /*  Second-previous output sample                       */

	pVtm_t->vlast = 0;    /*  Last output sample of the tilt filter.              */

	/* Second sample of the tilt filter. 
	   10/96 eab this filter parameter needs to be zeroed also */
	pVtm_t->one_minus_decay = 0;

	pVtm_t->avlind = 0;		// tek 08oct96
	pVtm_t->voice0 = 0;		// tek 08oct96

  pVtm_t->vtdTuneResults.purevmax = 0;    /*maximum value within filter of casade rnz*/
  pVtm_t->vtdTuneResults.rnzmax = 0;       /* maximum value within filter of casade rnz */
  pVtm_t->vtdTuneResults.rnpmax = 0;       /* maximum value within filter of casade rnp */
  pVtm_t->vtdTuneResults.c4max = 0;        /* maximum value within filter of casade 4 */
  pVtm_t->vtdTuneResults.c3max = 0;        /* maximum value within filter of casade 3 */
  pVtm_t->vtdTuneResults.c2max = 0;        /* maximum value within filter of casade 3 */
  pVtm_t->vtdTuneResults.c1max = 0;        /* maximum value within filter of casade 3 */


  spdeftochip = &(pVtm_t->parambuff[1]);

  /********************************************************************/
  /*  Constants used in random number generation.                     */
  /********************************************************************/
  /*
  ranmul = 20077;
  ranadd = 12345;
  */
  /********************************************************************/
  /*  Constants used to filter the noise.                             */
  /********************************************************************/

  switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    pVtm_t->noiseb = -2913;
    /*noisec = 1499; */
    break;

  case SAMPLE_RATE_DECREASE:

    pVtm_t->noiseb = -1873;
    /*noisec = 1499;*/
    break;

  case NO_SAMPLE_RATE_CHANGE:

    pVtm_t->noiseb = -2913;
    /*noisec = 1499;*/
    break;

  default:

    break;
  }

  /********************************************************************/
  /*  Parallel 6th formant                                            */
  /*  Resonator constant "r6pa" is set elsewhere from A6inDB.         */
  /********************************************************************/

  /*pVtm_t->r6pb = -5702;*/     /* MVP : moved as a local constant */
  /*r6pc = -1995;                */     /* MVP : moved as a local constant */

  /********************************************************************/
  /*  Coefficients for fixed nasal formant.                           */
  /*  Gain parameter "rnpa" is set below by speaker definition        */
  /*  parameter "rnpg". Note possible future change, this could vary  */
  /*  from speaker to speaker.                                        */
  /********************************************************************/

  fnp = 290;

  bnp = 70;
  
  

  switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    fnp = frac1mul( pVtm_t->inv_rate_scale, fnp );
    break;

  case SAMPLE_RATE_DECREASE:

    fnp = frac1mul( pVtm_t->inv_rate_scale, fnp ) << 1;
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }
  d2pole_pf( pVtm_t,&pVtm_t->rnpb, &pVtm_t->rnpc, fnp, bnp, 0 );

  /********************************************************************/
  /*  Coefficients for fixed downsampling low-pass filter             */
  /********************************************************************/

  switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    flp = 948;
    blp = 615;
    rlpg = 2400;
    break;

  case SAMPLE_RATE_DECREASE:

    flp = 698;
    blp = 453;
    rlpg = 2400;
    break;

  case NO_SAMPLE_RATE_CHANGE:

    flp = 860;
    blp = 558;
    rlpg = 2400;
    break;

  default:

    break;
  }

  pVtm_t->rlpa = d2pole_pf( pVtm_t,&pVtm_t->rlpb, &pVtm_t->rlpc, flp, blp, rlpg );

  /********************************************************************/
  /*  Begin set coeficients of speaker-def controlled resonators.     */
  /*  Cascade fourth formant                                          */
  /********************************************************************/

  f4c = ((SPD_CHIP *)spdeftochip)->r4cb;   /*  1                       */
  b4c = ((SPD_CHIP *)spdeftochip)->r4cc;   /*  2                       */

  d2pole_cf45( pVtm_t,&pVtm_t->R4cb, &pVtm_t->R4cc, f4c, b4c, 0 );

  /********************************************************************/
  /*  Cascade fifth formant                                           */
  /********************************************************************/

  f5c = ((SPD_CHIP *)spdeftochip)->r5cb;   /*  3                       */
  b5c = ((SPD_CHIP *)spdeftochip)->r5cc;   /*  4                       */

  d2pole_cf45(pVtm_t,&pVtm_t->R5cb, &pVtm_t->R5cc, f5c, b5c, 0 );

  /********************************************************************/
  /*  Parallel fourth formant                                         */
  /********************************************************************/

  f4p = ((SPD_CHIP *)spdeftochip)->r4pb;   /*  5                       */
  b4p = 400;

  d2pole_pf( pVtm_t,&pVtm_t->R4pb, &pVtm_t->r4pc, f4p, b4p, 0 );

  /********************************************************************/
  /*  Parallel fifth formant                                          */
  /********************************************************************/

  f5p = ((SPD_CHIP *)spdeftochip)->r5pb;    /*  6                      */
  b5p = 500;

  d2pole_pf( pVtm_t,&pVtm_t->R5pb, &pVtm_t->r5pc, f5p, b5p, 0 );

  /********************************************************************/
  /*  End of set coeficients of speaker definition controlled         */
  /*  resonators.                                                     */
  /********************************************************************/

  /********************************************************************/
  /*  The following parameter deleted 12-JUL-85                       */
  /*  TLToff = ((SPD_CHIP *)spdeftochip)->tltoff;      7               */
  /********************************************************************/

  /********************************************************************/
  /*  Jitter parameter has it's sign flipped from the current value.  */
  /*  t0jitr is a time, so it should be scaled if fs != 10K.          */
  /********************************************************************/

  if ( pVtm_t->t0jitr < 0 )
    pVtm_t->t0jitr = -((SPD_CHIP *)spdeftochip)->t0jit;    /*  8               */
  else
    pVtm_t->t0jitr = ((SPD_CHIP *)spdeftochip)->t0jit;

  switch( pVtm_t->uiSampleRateChange )
  {
  case SAMPLE_RATE_INCREASE:

    pVtm_t->t0jitr = frac1mul( pVtm_t->rate_scale, pVtm_t->t0jitr ) << 1;
    break;

  case SAMPLE_RATE_DECREASE:

    pVtm_t->t0jitr = frac1mul( pVtm_t->rate_scale, pVtm_t->t0jitr );
    break;

  case NO_SAMPLE_RATE_CHANGE:

    break;

  default:

    break;
  }

  /********************************************************************/
  /*  Gains of cascade resonators (used to keep signal in high order  */
  /*  bits).                                                          */
  /********************************************************************/

  a5gain = ((SPD_CHIP *)spdeftochip)->r5ca;    /*  9                   */
  pVtm_t->R5ca = amptable[a5gain];
  a4gain = ((SPD_CHIP *)spdeftochip)->r4ca;    /*  10                  */
  pVtm_t->R4ca = amptable[a4gain];
  a3gain = ((SPD_CHIP *)spdeftochip)->r3ca;    /*  11                  */
  pVtm_t->r3cg = amptable[a3gain];
  a2gain = ((SPD_CHIP *)spdeftochip)->r2ca;    /*  12                  */
#ifdef LOW_COST_VERSION
  pVtm_t->r2cg = amptable[a2gain-10];
#else
	pVtm_t->r2cg = amptable[a2gain];
#endif
  a1gain = ((SPD_CHIP *)spdeftochip)->r1ca;    /*  13                  */
  pVtm_t->r1cg = amptable[a1gain];

  /********************************************************************/
  /*  Constants that determine the duration of the open phase of the  */
  /*  glottal period.                                                 */
  /********************************************************************/

  pVtm_t->k1 = ((SPD_CHIP *)spdeftochip)->nopen1;      /* 14                   */
  pVtm_t->k2 = ((SPD_CHIP *)spdeftochip)->nopen2;      /* 15                   */

  /********************************************************************/
  /*  Breathiness coefficient.                                        */
  /********************************************************************/

  pVtm_t->Aturb = ((SPD_CHIP *)spdeftochip)->aturb;    /*  16                  */
#ifndef UPGRADES1999
  pVtm_t->Aturb = amptable[pVtm_t->Aturb+12];
#endif

 /********************************************************************/
 /*  T0range = ((SPD_CHIP *)spdeftochip)->f0scale;  17  (Not used)    */
 /********************************************************************/

  /********************************************************************/
  /*  Scale factor for variable formants F1inHZ, F2inHZ, and F3inHZ.  */
  /********************************************************************/

  pVtm_t->fnscal = ((SPD_CHIP *)spdeftochip)->fnscale;     /*  18              */

  /********************************************************************/
  /*  Overall gain of frication source re other sources               */
  /********************************************************************/

  afg = ((SPD_CHIP *)spdeftochip)->afgain;     /*  19                  */

  pVtm_t->AFgain = amptable[afg ];


  /********************************************************************/
  /*  Gain of the nasal pole resonator of cascade filter section.     */
  /********************************************************************/

  rnpg = ((SPD_CHIP *)spdeftochip)->rnpgain;   /*  20                  */
  pVtm_t->rnpa = amptable[rnpg];
  

  /********************************************************************/
  /*  Overall gain of voicing source relative to other sources        */
  /********************************************************************/

  avg = ((SPD_CHIP *)spdeftochip)->azgain;     /*  21                  */
  pVtm_t->avgain = amptable[avg];

  /********************************************************************/
  /*  Overall gain of aspiration source relative to other sources     */
  /********************************************************************/

  apg = ((SPD_CHIP *)spdeftochip)->apgain;     /*  22                  */
  pVtm_t->APgain = amptable[apg];

  phTTS->pKernelShareData->uiCurrentSpeaker = (DWORD)((SPD_CHIP *)spdeftochip)->speaker;
#ifdef COMPRESSION
  // set the initial gain fairly low, it will quickly set itself.
  pVtm_t->sGain = CompGainTable[COMPRESSION_GAIN_TABLE_SIZE/2];
#endif //COMPRESSION

}

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

void InitializeVTM(LPTTS_HANDLE_T phTTS)
{
	PVTM_T pVtm_t =phTTS->pVTMThreadData;

  /********************************************************************/
  /*  Zero Vocal-Tract-Model parameters.                              */
  /********************************************************************/

	pVtm_t->r2pd1 = 0;    /*  Last output sample from parallel 2nd formant        */
	pVtm_t->r2pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r3pd1 = 0;    /*  Last output sample from parallel 3rd formant        */
	pVtm_t->r3pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r4pd1 = 0;    /*  Last output sample from parallel 4th formant        */
	pVtm_t->r4pd2 = 0;    /*  Second-previous output sample                       */
	
	pVtm_t->r5pd1 = 0;    /*  Last output sample from parallel 5th formant        */
	pVtm_t->r5pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r6pd1 = 0;    /*  Last output sample from parallel 6th formant        */
	pVtm_t->r6pd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r1cd1 = 0;    /*  Last output sample from cascade 1st formant         */
	pVtm_t->r1cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r2cd1 = 0;    /*  Last output sample from cascade 2nd formant         */
	pVtm_t->r2cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r3cd1 = 0;    /*  Last output sample from cascade 3rd formant         */
	pVtm_t->r3cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r4cd1 = 0;    /*  Last output sample from cascade 4th formant         */
	pVtm_t->r4cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->r5cd1 = 0;    /*  Last output sample from cascade 5th formant         */
	pVtm_t->r5cd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->rnpd1 = 0;    /*  Last output sample from cascade nasal pole          */
	pVtm_t->rnpd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->rnzd1 = 0;    /*  Last output sample from cascade nasal zero          */
	pVtm_t->rnzd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->rlpd1 = 0;    /*  Last output sample from low-pass filter             */
	pVtm_t->rlpd2 = 0;    /*  Second-previous output sample                       */

	pVtm_t->ablas1 = 0;   /*  Last output sample from nasal anti-resonator        */
	pVtm_t->ablas2 = 0;   /*  Second-previous output sample                       */

	pVtm_t->vlast = 0;    /*  Last output sample of the tilt filter.              */

	pVtm_t->one_minus_decay = 0;    /* Second sample of the tilt filter.          */
}


/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/*  Currently this will only accept sample rates of 8000 Hz and       */
/*  11025 Hz.                                                         */
/**********************************************************************/
/**********************************************************************/

/*extern short last_voice;*/     /*MVP MI */


void SetSampleRate( LPTTS_HANDLE_T phTTS, unsigned int uiSampRate )
{
  /********************************************************************/
  /*  Set the global sample rate dependant parameters.                */
  /*  Some day these should be moved into the TTS handle.             */
  /********************************************************************/
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PVTM_T pVtm_t = phTTS->pVTMThreadData;

  pKsd_t->uiSampleRate = uiSampRate;
  pVtm_t->SampleRate = (double)pKsd_t->uiSampleRate;
   //pVtm_t->SampleRate = 8000; /* for 8khz tune eab 1/15/98 */
  //pKsd_t->uiSampleRate = 8000; 
  pKsd_t->SamplePeriod = 1.0 / pVtm_t->SampleRate;

  /********************************************************************/
  /*  Setup for either 8, 10, or 11.025 kHz.                          */
  /********************************************************************/

  if ( pKsd_t->uiSampleRate == PC_SAMPLE_RATE )
  {
    pVtm_t->bEightKHz = FALSE;

    /******************************************************************/
    /*  Set the vocal tract model to 11 KHz.                          */
    /******************************************************************/

    pVtm_t->uiSampleRateChange = SAMPLE_RATE_INCREASE;
    pVtm_t->rate_scale = 18063;   /*  Equals 1.1 in Q14 format for 11 KHz.    */
    pVtm_t->inv_rate_scale = 29722;    /*  Equals 0.909 in Q15 format.        */
    pVtm_t->uiNumberOfSamplesPerFrame = 71;
  }
  else
  {
    if ( pKsd_t->uiSampleRate == MULAW_SAMPLE_RATE )
   {
      pVtm_t->bEightKHz = TRUE;

      /****************************************************************/
      /*  Set the vocal tract model to 8 KHz.                         */
      /****************************************************************/

      pVtm_t->uiSampleRateChange = SAMPLE_RATE_DECREASE;
      pVtm_t->rate_scale = 26214;    /*  Equals 0.8 in Q15 format for 8 KHz */
      pVtm_t->inv_rate_scale = 20480;    /*  Equals 1.25 in Q14 format.     */
      pVtm_t->uiNumberOfSamplesPerFrame = 51;
    }
    else
    {
      pVtm_t->uiSampleRateChange = NO_SAMPLE_RATE_CHANGE;
    }
  }

  /********************************************************************/
  /*  Update the speaker definition for the new sample rate.          */
  /********************************************************************/

  pKsd_t->async_voice = pKsd_t->last_voice ;
  pKsd_t->async_change |= ASYNC_voice;

  return;
}

void getmax(S16 value,S16 *maxval)	// KSB - Added for testing of max value
	{
	if (value <0)
		value = -value;

	if (value > *maxval)	*maxval=value;
	return;
}


#ifdef ACI_LICENSE
#ifndef DECVOC

doit()
{
/*insert function from decvoc.c */
}

#endif


 
#endif //ACI_LICENSE

void setzeroabc(int f,int bw,int rnzg, short *sacoef,short *sbcoef,short *sccoef)
{
int acoef;
int bcoef;
int ccoef;

int r;


/*    First compute ordinary resonator coefficients */
/*    Let r  =  exp(-pi bw t) */
/*    To get rid of transcendentals for chip implementation, see above: */

		r = radius_table[bw >> 3];
		

    


/*    Let c  =  -r**2 */

	 ccoef = -frac4mul(r,r);
		

/*    Let b = r * 2*cos(2 pi f t) */
/*    To get rid of transcendentals for chip implementation, see above: */

		 bcoef = frac4mul( r, cosine_table[ f >> 3 ] );

/*    Let a = 1.0 - b - c */

	 acoef = 4096 - bcoef - ccoef;

/* Now convert to antiresonator coefficients (a'=1/a, b'=-b/a, c'=-c/a) */
/* It would be desirable to turn these divides into tables for chip impl. */
	  
	*sacoef = ( (4096*rnzg )/acoef);
	*sbcoef = -((bcoef*rnzg)/acoef);
	*sccoef = -((ccoef*rnzg)/acoef);

	
	
	/*    Debugging printout *
      printf("fz=%3d bw=%3d acoef=%8.5f bcoef=%8.5f ccoef=%8.5f\n",
	  f, bw, *acoef, *bcoef, *ccoef);
*/
}
#ifdef POSS_FUTURE_FUNCTION
void setabc(int f,int bw,  short *acoef,short *bcoef,short *ccoef)
{

int r;
double exp(),cos();


/*    First compute ordinary resonator coefficients */
/*    Let r  =  exp(-pi bw t) */
/*    To get rid of transcendentals for chip implementation, see above: */

		r = radius_table[bw >> 3];
		

    


/*    Let c  =  -r**2 */

	 *ccoef = -frac4mul(r,r);
		

/*    Let b = r * 2*cos(2 pi f t) */
/*    To get rid of transcendentals for chip implementation, see above: */

		 *bcoef = frac4mul( r, cosine_table[ f >> 3 ] );

/*    Let a = 1.0 - b - c */

	 *acoef = 4096 - *bcoef -*ccoef;
}
#endif //POSS_FUTURE_FUNCTION
/* moved #endif to here as setzeroabc and setabc are not used by the fvtm */ 
#endif //FP_VTM


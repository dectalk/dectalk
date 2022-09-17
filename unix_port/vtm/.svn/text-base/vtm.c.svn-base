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
/*  14. 08-OCT-96 EAB Fixed three problems							  */ 
/*						1. initialize lacking the initialization of   */
/*						   filter param one_minus_decay				  */
/*						2. Intialiaze variables when a spdef is loaded*/
/*						   otherwise filters can overload.			  */
/*						3. One packet from last frame stuck so set	  */
/*						   vocal tract gains to zero for the first	  */
/*						   frame following a speaker def			  */
/*						   to make this logiclly a silence packet	  */
/*  15. 01-MAY-97 tek Licensing changes								  */
/*  16. 26-MAY-97 EAB Fixed "poping problem see note in code		  
    17  04-dec-97 EAB ADDED MANUAL TUNE ROUTINE if MANUAL_TUNE is defined
	18  01-28/98 EAB Added fix for bats 491 and 554
	19 23mar98  tek modified for FP_VTM integration	
	20  04/03/98 EAB Added in new functionality with NEW_VTM (sync glotal noise,
		more genrealized fnp freq setttings. fnp as a frame data parameter. glot_speed
		to make more sinusoidal vocal vibrations for german
	21  EAB 4/27/98 Cleaned up code improved it's operation and put everything under the label
		of NEW_VTM and removed NEW_NASAL
	22  MGS 05/22/1998 Moved #endif for FP_VTM lower down
                                                                    
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







#define  F1_B1_UPGRADE  0

//#define MANUAL_TUNE

#ifdef MANUAL_TUNE
#define	MAX_TRIGGER			28000
#else
#define MAX_TRIGGER         17000
#endif


#define	MIN_MAX_TRIGGER		11000

/**********************************************************************/
/*  Function prototypes                                               */
/**********************************************************************/

void speech_waveform_generator(LPTTS_HANDLE_T phTTS);
void read_speaker_definition(LPTTS_HANDLE_T phTTS);
void SetSampleRate( LPTTS_HANDLE_T phTTS, unsigned int uiSampRate );
void InitializeVTM(LPTTS_HANDLE_T phTTS);
void getmax(S16 value,S16 *maxval);		// KSB - Added for testing of max value
void setzeroabc(int f, int bw, int rnpg, short *sacoef,short *sbcoef,short *sccoef);//EAB 3/298 new coef for rnz

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
  S32 temp1;                                                     /* MVP MI moved from vtm.h */
  S16 b2p;       /*  Bandwidth of parallel 2th formant *//* MVP MI moved from vtm.h */
  S16 b3p;       /*  Bandwidth of parallel 3th formant *//* MVP MI moved from vtm.h */
  S16 out;       /*  Output signal from the vocal tract model*/ 
  S16 nsr4;      /*  Counter of 4 samples in glottal source loop        */ 
  U32 ns;        /*  Number of samples into current frame            */
  S16 r3pg;      /*  amp of parameter F3 for iir filter                 */
  S16 r2pg;      /*  amp of parameter F2 for iir filter                 */
  S16 ABlin;     /*  AB linear ampl. control                            */
  S16 APlin;     /*  AP linear ampl. control                            */
  S16 voice;     /*  Current sample of voicing waveform                 */ /*BILL*/
  S16 noise;     /*  Output of random number generator                  */
  S16 about;     /*  Output signal from bypass path                     */
  S16 rnzout;    /*  Output signal from nasal zero                      */
  S16 T0inS4;  /*  Voicing fund freq in Hz*10,      500 to 1650         */
#ifdef NEW_VTM
  S16 FNPinHZ;   /*Frequency of moveable nasal formant*/
  S16 Glot_step;	/*step for voicing source to make almost sinusoidal for nasal variants*/
  S16 glotnoise; /* eab new way of injecting noise pitch synchronously*/
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
  S16 r2pa;      /*  "a" coef for parallel 2nd formant                  */
  S16 r2pb;      /*  "b" coefficient                                    */
  S16 r2pc;      /*  "c" coefficient                                    */

  S16 r3pa;      /*  "a" coef for parallel 3rd formant                  */
  S16 r3pb;      /*  "b" coefficient                                    */
  S16 r3pc;      /*  "c" coefficient                                    */
  S16 r4pa;      /*  "a" coef for parallel 4th formant                  */
  S16 r5pa;      /*  "a" coef for parallel 5th formant                  */
  S16 r6pa;      /*  "a" coef for parallel 6th formant                  */
  S16 r6pb = -5702;      /*MVP : According to me it is a constant BILL /*  "b" coefficient*/
  S16 r6pc = -1995;      /*MVP : According to me it is a constant BILL      /*  "c" coefficient */

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

 
	  if(pVtm_t->icnt >= 2)
		  pVtm_t->icnt =0;

   if(pVtm_t->ldspdef == 1  || pVtm_t->icnt == 1 )
  {
   pVtm_t->icnt++;
   pVtm_t->ldspdef=0;
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
  TILTDB = variabpars[8] - 12;  /*  Tilt in dB at 3 kHz         */

  APlin = amptable[APinDB + 10];      /*  Convert dB to linear        */
  r2pg = amptable[A2inDB + 13];       /*  Convert dB to linear        */
  r3pg = amptable[A3inDB + 10];       /*  Convert dB to linear        */
  r4pa = amptable[A4inDB + 7];        /*  Convert dB to linear        */
  r5pa = amptable[A5inDB + 6];        /*  Convert dB to linear        */
  r6pa = amptable[A6inDB + 5];        /*  Convert dB to linear        */
  ABlin = amptable[ABinDB + 5];       /*  Convert dB to linear        */

  APlin = frac4mul( APlin, pVtm_t->APgain );  /*  Scale asp by spdef GV       */
  r2pg = frac1mul( r2pg, pVtm_t->AFgain );    /*  Scale A2 by spdef GF        */
  r3pg = frac1mul( r3pg, pVtm_t->AFgain );    /*  Scale A3 by spdef GF        */
  r4pa = frac1mul( r4pa, pVtm_t->AFgain );    /*  Scale A4 by spdef GF        */
  r5pa = frac1mul( r5pa, pVtm_t->AFgain );    /*  Scale A5 by spdef GF        */
  r6pa = frac1mul( r6pa, pVtm_t->AFgain );    /*  Scale A6 by spdef GF        */
  ABlin = frac4mul( ABlin, pVtm_t->AFgain );  /*  Scale AB by spdef GF        */
#ifdef NEW_VTM
  FNPinHZ= variabpars[OUT_FNP];
  Glot_step = variabpars[OUT_GS];
#endif

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

    for ( nsr4 = 0; nsr4 < 4; nsr4++ )
    {
      /****************************************************************/
      /*  Compute next value of voicing wave. Calculate glottal pulse */
      /*  at 4 times normal sample rate to minimize the quantization  */
      /*  of the glottal period.                                      */
      /****************************************************************/

      /****************************************************************/
      /*  Future upgrade ?                                            */
      /*  When glottis closes, reduce F1 and B1.                      */
      /****************************************************************/

#if   F1_B1_UPGRADE

      f1_b1_down();
#endif

      /****************************************************************/
      /*  voicing has fixed waveshape, at**2 - bt**3                  */
      /****************************************************************/

      if ( pVtm_t->nper > ( pVtm_t->T0 - pVtm_t->nopen ))
      {
		 
		(pVtm_t->a) -= pVtm_t->b;             /*  Fixed waveshape at**2 - bt**3         */
		(pVtm_t->voice0) += pVtm_t->a >> 4;   /*  Differentiated glottal flow.          */
		pVtm_t->avlind = pVtm_t->avlin;     /*  Delay action of "avlin" change.       */
#ifdef NEW_VTM
		if(pVtm_t->avlind > 40 && glotnoise == 0)
		 {
			glotnoise = frac1mul( pVtm_t->aturb1, 32000 );
		 }
#endif
      }
      else
      {
#ifdef NEW_VTM
		  /* EAB 4/26/98 When glot_step is a big number, much greater then 10 it represents a more sinusoidal type of vocaliztion
		  and when it is 10 or less it represents an exponential decay which is similar to instantaneous closure in males
		  but with less high frequency energy as seen in many female voice and some males*/

		  if(Glot_step)
			{
				if(pVtm_t->voice0 <Glot_step)
				{
					if (Glot_step < 4)
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

      voice = frac4mul( pVtm_t->voice0, pVtm_t->avgain );

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

	pVtm_t->T0 = T0inS4;          /*  T0inS4 remembers period in case     */
			      /*  more than 1 period in cur frame.    */
	pVtm_t->temp = frac4mul( pVtm_t->t0jitr, pVtm_t->T0 ); /*  Add jitter, if any.        */
	pVtm_t->T0 +=  pVtm_t->temp;
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

	pVtm_t->nopen = frac1mul( pVtm_t->k1, pVtm_t->T0 ) + pVtm_t->k2;   /*  in open part of period */

	pVtm_t->nopen += ( TILTDB << 2 );      /*  Longer if TILTDB increases */

	if ( pVtm_t->nopen < 40 )
	  pVtm_t->nopen = 40;        /*  Min is 40                            */
	else
	  if ( pVtm_t->nopen > 263 )
	    pVtm_t->nopen = 263;     /*  Max is 263                           */

	if ( pVtm_t->nopen >= (( pVtm_t->T0 * 3 ) >> 2 ))
	  pVtm_t->nopen = (( pVtm_t->T0 * 3 ) >> 2 );    /*  or 3/4 T0                */

	/**************************************************************/
	/*  Reset a & b, which determine shape of glottal waveform.   */
	/*  Let a = (b * nopen) / 3 without doing the divide.         */
	/**************************************************************/

	pVtm_t->b = B0[pVtm_t->nopen-40];
	pVtm_t->temp = pVtm_t->b + 1;

	if ( pVtm_t->nopen > 95 )
	{
	  pVtm_t->temp = (S32)pVtm_t->temp * pVtm_t->nopen;
	  pVtm_t->a = frac1mul( 10923, pVtm_t->temp );
	}
	else
	{
	  pVtm_t->temp = frac1mul( 10923, pVtm_t->temp );
	  pVtm_t->a = (S32)pVtm_t->temp * pVtm_t->nopen;
	}

	/**************************************************************/
	/*  Set coeficients of variable cascade resonators.           */
	/**************************************************************/
#ifdef NEW_VTM
    d2pole_pf( pVtm_t,&pVtm_t->rnpb, &pVtm_t->rnpc, FNPinHZ, 120, 0 );
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

	/**************************************************************/
	/*  Future upgrade ?                                          */
	/*  Set pitch-synchronous changes to F1.                      */
	/**************************************************************/

#if     F1_B1_UPGRADE

	f1_b1_up();
#endif

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
	  //temporary until I implement new nasal control--just for test*/
	  
	  	setzeroabc( FZinHZ, 120, 100, &pVtm_t->rnza, &pVtm_t->rnzb, &pVtm_t->rnzc);
		}
#endif /*NEW_VTM*/


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

	getmax(voice,&pVtm_t->purevmax);

    /******************************************************************/
    /*  Tilt spectrum down by TILTDB dB at 3 kHz,                     */
    /*  use 1-pole iir filter.                                        */
    /******************************************************************/
#else	//ACI_LICENSE

		doit();
#endif

    voice = frac1mul( pVtm_t->one_minus_decay, voice )
	      + frac1mul( pVtm_t->decay, pVtm_t->vlast );
    pVtm_t->vlast = voice;

    /******************************************************************/
    /*  Add breathiness to voicing. Increase noise if Aspiration.     */
    /******************************************************************/
	/* new pitch sync breathiness */

    
#ifdef NEW_VTM
	/* eab 4/14/98 glotnoise nissing clear to zero to reset*/
	 if(glotnoise > 300)
		 glotnoise -= 300;
	else if(glotnoise > 0)/* eab 4/16/98 for debug kater can be just else*/
		glotnoise = 0;
	noiseac = frac1mul( (glotnoise ), noise  );
	voice += noiseac;
#else
	voice += frac1mul( pVtm_t->aturb1, noise );
#endif	

    /******************************************************************/
    /*  Set variable gain of voicing.                                 */
    /*  24-Jul-85  "avlin" moved to "avlind" after half a period.     */
    /******************************************************************/

    voice = frac4mul( pVtm_t->avlind, voice );

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

    two_zero_filter( voice, rnzout, pVtm_t->rnzd1, pVtm_t->rnzd2, pVtm_t->rnza, pVtm_t->rnzb, pVtm_t->rnzc );

	getmax(rnzout,&pVtm_t->rnzmax);

    /******************************************************************/
    /*  Nasal Resonator of Cascade Vocal Tract                        */
    /*  output is rnpd1.                                              */
    /******************************************************************/

    two_pole_filter( rnzout, pVtm_t->rnpd1, pVtm_t->rnpd2, pVtm_t->rnpa, pVtm_t->rnpb, pVtm_t->rnpc );

	getmax(pVtm_t->rnpd1,&pVtm_t->rnpmax);

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

	getmax(pVtm_t->r5cd1,&pVtm_t->c5max);

    /******************************************************************/
    /*  Fourth Formant                                                */
    /*  output is r4cd1.                                              */
    /******************************************************************/

    two_pole_filter( pVtm_t->r5cd1, pVtm_t->r4cd1, pVtm_t->r4cd2, pVtm_t->R4ca, pVtm_t->R4cb, pVtm_t->R4cc );
	getmax(pVtm_t->r4cd1,&pVtm_t->c4max);

    /******************************************************************/
    /*  Third Formant                                                 */
    /*  output is r3cd1.                                              */
    /******************************************************************/

    two_pole_filter( pVtm_t->r4cd1, pVtm_t->r3cd1, pVtm_t->r3cd2, pVtm_t->R3ca, pVtm_t->r3cb, pVtm_t->r3cc );
	getmax(pVtm_t->r3cd1,&pVtm_t->c3max);

    /******************************************************************/
    /*  Second Formant                                                */
    /*  output is r2cd1.                                              */
    /******************************************************************/

    two_pole_filter( pVtm_t->r3cd1, pVtm_t->r2cd1, pVtm_t->r2cd2, pVtm_t->R2ca, pVtm_t->r2cb, pVtm_t->r2cc );
	getmax(pVtm_t->r2cd1,&pVtm_t->c2max);

    /******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  output is r1cd1.                                              */
    /******************************************************************/

    two_pole_filter( pVtm_t->r2cd1, pVtm_t->r1cd1, pVtm_t->r1cd2, pVtm_t->R1ca, pVtm_t->r1cb, pVtm_t->r1cc );
	getmax(pVtm_t->r1cd1,&pVtm_t->c1max);

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

    if ( out > 16383 )
		out = 16383;
     else if ( out < -16384 )
	  out = -16384;
    pVtm_t->iwave[ns] = out << 1;
    
	

  }
#ifdef MANUAL_TUNE
  if (varcatch > MAX_TRIGGER) 
  {
		WINprintf("purevmax (GV) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_GV_OVER;
	}
	varcatch = pVtm_t->rnzmax;       /* maximum value within filter of casade rnz */
	if (varcatch > MAX_TRIGGER) 
	{
		WINprintf("rnzmax (fixed) overloaded at %d\n",varcatch);
	}
	varcatch = pVtm_t->rnpmax;       /* maximum value within filter of casade rnp */
	if (varcatch > MAX_TRIGGER) 
	{
		WINprintf("rnpmax (GN) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_GN_OVER;
	}
		varcatch = pVtm_t->c4max;        /* maximum value within filter of casade 4 */
	if (varcatch > MAX_TRIGGER) {
		WINprintf("c5max (G1) overloaded at %d\n",varcatch);
	}
	varcatch = pVtm_t->c4max;        /* maximum value within filter of casade 4 */
	if (varcatch > MAX_TRIGGER) 
	{
		WINprintf("c4max (G2) overloaded at %d\n",varcatch);
	}

	varcatch = pVtm_t->c3max;        /* maximum value within filter of casade 3 */
	if (varcatch > MAX_TRIGGER) 
	{
		WINprintf("c3max (G3) overloaded at %d\n",varcatch);
	}

	varcatch = pVtm_t->c2max;        /* maximum value within filter of casade 2 */
	if (varcatch > MAX_TRIGGER) 
	{
		WINprintf("c2max (G4) overloaded at %d\n",varcatch);
	}
	
	varcatch = pVtm_t->c1max;        /* maximum value within filter of casade 1 */
	if (varcatch > MAX_TRIGGER) 
	{
		WINprintf("c1max (G5)(LO) overloaded at %d\n",varcatch);
	}
#endif

#ifdef _DEBUG
  if (pKsd_t->debug_switch == 0x1001) {
	pKsd_t->debug_switch = 0;
	WINprintf("Start of VTM dump\n");
	phTTS->LastError &= 0x0000FFFFL;	/* Clear all warning flags */
	varcatch = pVtm_t->purevmax;    /*maximum value within filter of casade rnz*/
	if (varcatch > MAX_TRIGGER) {
		WINprintf("purevmax (GV) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_GV_OVER;
	}
	if (varcatch < MIN_MAX_TRIGGER) {
		WINprintf("purevmax (GV) underloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_GV_UNDER;
	}
	varcatch = pVtm_t->rnzmax;       /* maximum value within filter of casade rnz */
	if (varcatch > MAX_TRIGGER) {
		WINprintf("rnzmax (fixed) overloaded at %d\n",varcatch);
	}
	if (varcatch < MIN_MAX_TRIGGER) {
		WINprintf("rnzmax (fixed) underloaded at %d\n",varcatch);
	}
	varcatch = pVtm_t->rnpmax;       /* maximum value within filter of casade rnp */
	if (varcatch > MAX_TRIGGER) {
		WINprintf("rnpmax (GN) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_GN_OVER;
	}
	if (varcatch < MIN_MAX_TRIGGER) {
		WINprintf("rnpmax (GN) underloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_GN_UNDER;
	}
	varcatch = pVtm_t->c4max;        /* maximum value within filter of casade 4 */
	if (varcatch > MAX_TRIGGER) {
		WINprintf("c4max (G2) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G2_OVER;
	}
	if (varcatch < MIN_MAX_TRIGGER) {
		WINprintf("c4max (G2) underloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G2_UNDER;
	}
	varcatch = pVtm_t->c3max;        /* maximum value within filter of casade 3 */
	if (varcatch > MAX_TRIGGER) {
		WINprintf("c3max (G3) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G3_OVER;
	}
	if (varcatch < MIN_MAX_TRIGGER) {
		WINprintf("c3max (G3) underloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G3_UNDER;
	}
	varcatch = pVtm_t->c2max;        /* maximum value within filter of casade 2 */
	if (varcatch > MAX_TRIGGER) {
		WINprintf("c2max (G4) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G4_OVER;
	}
	if (varcatch < MIN_MAX_TRIGGER) {
		WINprintf("c2max (G4) underloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G4_UNDER;
	}
	varcatch = pVtm_t->c1max;        /* maximum value within filter of casade 1 */
	if (varcatch > MAX_TRIGGER) {
		WINprintf("c1max (G5)(LO) overloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G5_OVER;
	}
	if (varcatch < MIN_MAX_TRIGGER) {
		WINprintf("c1max (G5)(LO) underloaded at %d\n",varcatch);
		phTTS->LastError |= VTM_G5_UNDER;
	}
  }
#endif
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

  pVtm_t->purevmax = 0;    /*maximum value within filter of casade rnz*/
  pVtm_t->rnzmax = 0;       /* maximum value within filter of casade rnz */
  pVtm_t->rnpmax = 0;       /* maximum value within filter of casade rnp */
  pVtm_t->c4max = 0;        /* maximum value within filter of casade 4 */
  pVtm_t->c3max = 0;        /* maximum value within filter of casade 3 */
  pVtm_t->c2max = 0;        /* maximum value within filter of casade 3 */
  pVtm_t->c1max = 0;        /* maximum value within filter of casade 3 */


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

  f4c = ((SP_CHIP *)spdeftochip)->r4cb;   /*  1                       */
  b4c = ((SP_CHIP *)spdeftochip)->r4cc;   /*  2                       */

  d2pole_cf45( pVtm_t,&pVtm_t->R4cb, &pVtm_t->R4cc, f4c, b4c, 0 );

  /********************************************************************/
  /*  Cascade fifth formant                                           */
  /********************************************************************/

  f5c = ((SP_CHIP *)spdeftochip)->r5cb;   /*  3                       */
  b5c = ((SP_CHIP *)spdeftochip)->r5cc;   /*  4                       */

  d2pole_cf45(pVtm_t,&pVtm_t->R5cb, &pVtm_t->R5cc, f5c, b5c, 0 );

  /********************************************************************/
  /*  Parallel fourth formant                                         */
  /********************************************************************/

  f4p = ((SP_CHIP *)spdeftochip)->r4pb;   /*  5                       */
  b4p = 400;

  d2pole_pf( pVtm_t,&pVtm_t->R4pb, &pVtm_t->r4pc, f4p, b4p, 0 );

  /********************************************************************/
  /*  Parallel fifth formant                                          */
  /********************************************************************/

  f5p = ((SP_CHIP *)spdeftochip)->r5pb;    /*  6                      */
  b5p = 500;

  d2pole_pf( pVtm_t,&pVtm_t->R5pb, &pVtm_t->r5pc, f5p, b5p, 0 );

  /********************************************************************/
  /*  End of set coeficients of speaker definition controlled         */
  /*  resonators.                                                     */
  /********************************************************************/

  /********************************************************************/
  /*  The following parameter deleted 12-JUL-85                       */
  /*  TLToff = ((SP_CHIP *)spdeftochip)->tltoff;      7               */
  /********************************************************************/

  /********************************************************************/
  /*  Jitter parameter has it's sign flipped from the current value.  */
  /*  t0jitr is a time, so it should be scaled if fs != 10K.          */
  /********************************************************************/

  if ( pVtm_t->t0jitr < 0 )
    pVtm_t->t0jitr = -((SP_CHIP *)spdeftochip)->t0jit;    /*  8               */
  else
    pVtm_t->t0jitr = ((SP_CHIP *)spdeftochip)->t0jit;

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

  a5gain = ((SP_CHIP *)spdeftochip)->r5ca;    /*  9                   */
  pVtm_t->R5ca = amptable[a5gain];
  a4gain = ((SP_CHIP *)spdeftochip)->r4ca;    /*  10                  */
  pVtm_t->R4ca = amptable[a4gain];
  a3gain = ((SP_CHIP *)spdeftochip)->r3ca;    /*  11                  */
  pVtm_t->r3cg = amptable[a3gain];
  a2gain = ((SP_CHIP *)spdeftochip)->r2ca;    /*  12                  */
  pVtm_t->r2cg = amptable[a2gain];
  a1gain = ((SP_CHIP *)spdeftochip)->r1ca;    /*  13                  */
  pVtm_t->r1cg = amptable[a1gain];

  /********************************************************************/
  /*  Constants that determine the duration of the open phase of the  */
  /*  glottal period.                                                 */
  /********************************************************************/

  pVtm_t->k1 = ((SP_CHIP *)spdeftochip)->nopen1;      /* 14                   */
  pVtm_t->k2 = ((SP_CHIP *)spdeftochip)->nopen2;      /* 15                   */

  /********************************************************************/
  /*  Breathiness coefficient.                                        */
  /********************************************************************/

  pVtm_t->Aturb = ((SP_CHIP *)spdeftochip)->aturb;    /*  16                  */
  pVtm_t->Aturb = amptable[pVtm_t->Aturb];

  /********************************************************************/
  /*  T0range = ((SP_CHIP *)spdeftochip)->f0scale;  17  (Not used)    */
  /********************************************************************/

  /********************************************************************/
  /*  Scale factor for variable formants F1inHZ, F2inHZ, and F3inHZ.  */
  /********************************************************************/

  pVtm_t->fnscal = ((SP_CHIP *)spdeftochip)->fnscale;     /*  18              */

  /********************************************************************/
  /*  Overall gain of frication source re other sources               */
  /********************************************************************/

  afg = ((SP_CHIP *)spdeftochip)->afgain;     /*  19                  */
  pVtm_t->AFgain = amptable[afg];

  /********************************************************************/
  /*  Gain of the nasal pole resonator of cascade filter section.     */
  /********************************************************************/

  rnpg = ((SP_CHIP *)spdeftochip)->rnpgain;   /*  20                  */
  pVtm_t->rnpa = amptable[rnpg];

  /********************************************************************/
  /*  Overall gain of voicing source relative to other sources        */
  /********************************************************************/

  avg = ((SP_CHIP *)spdeftochip)->azgain;     /*  21                  */
  pVtm_t->avgain = amptable[avg];

  /********************************************************************/
  /*  Overall gain of aspiration source relative to other sources     */
  /********************************************************************/

  apg = ((SP_CHIP *)spdeftochip)->apgain;     /*  22                  */
  pVtm_t->APgain = amptable[apg];

  phTTS->pKernelShareData->uiCurrentSpeaker = (DWORD)((SP_CHIP *)spdeftochip)->speaker;

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
f1_b1_up()
{
  delr1b = frac4mul( F1inHZ, F1inHZ ) >> 1;
  r1cc += (F1inHZ);
  r1cb -= (delr1b + (F1inHZ));
}
*/

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: f1_b1_down()                                            */
/*                                                                    */
/*  PROPOSED NEW CODE FOR DECTALK III                                 */
/*  Glottis closes at this sample, reduce F1 and B1.                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/*
f1_b1_down()
{
  if ( nper == nopen )
{
  r1cc -= (F1inHZ);
  r1cb += (delr1b + (F1inHZ));
}
*/

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

/* moved #endif to here as setzeroabc and setabc are not used by the fvtm */ 
#endif //FP_VTM

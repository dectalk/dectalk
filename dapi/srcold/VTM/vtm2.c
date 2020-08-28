/* ********************************************************************************** */
/* **********************************************************************************                                                                    
 *                DECtalk Vocal Tract Model                           
 *    Copyright ©  1984 by Dennis H. Klatt    			     
 *    Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.   
 *    © SMART Modular Technologies 1999, 2000. All rights reserved.      
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 * ************************************************************************************                                                                    
 * Edit history:                                                      
 *                                                                   
 *   1.  1-Sep-84 DK  Initial creation                                
 *                                                                    
 *   2. 17-Jan-85 DK  Add "multi-pulse" excitation                    
 *                    (currently disabled).                           
 *                                                                    
 *   3. 19-Feb-85 DK  New Code: Change meaning of TILT to             
 *                    "spread glottis".                               
 *                                                                    
 *   4. 10-Mar-85 DK  Reorganize to look more like code used on chip. 
 *                                                                    
 *   5. 16-Apr-85 DK  Set R6PB = - 3728, R6PC = -851                   
 *                    ( F = 4900, BW = 2500 )                         
 *                                                                    
 *   6. 30-Apr-85 DK  Boost gain in cascade F1 to better avoid limit  
 *                    cycles. Try new random number generator.        
 *                                                                     
 *   7. 13-Jul-85 DK  Do not modulate breathiness noise, make glottal 
 *                    closure occur at end of a period, --> T0        
 *                    continuous when NOPEN changes, fix lptilt()     
 *                    (MAJOR ERROR), also delete spdef par TILToff.   
 *                                                                    
 *   8. 15-Jul-85 DK  TEMPORARY CHANGES FOR FIGURE GENERATION.        
 *                    see SHOW_VOICING.                               
 *                                                                    
 *   9. 22-Jul-85 DK  Add print statements for comparison with SPC    
 *                    code.                                           
 *                                                                    
 *  10. 24-Jul-85 DK  Add small constant to output to avoid sign-bit  
 *                    noise. Use new variable "AVlind" to delay       
 *                    change in AV.                                   
 *                                                                    
 *  11. 29-Jul-85 DK  Make sure R1ca does not overflow alotted bits.  
 *                                                                    
 *  12. 10-Oct-92 BH  Clearly separated comments from code and        
 *                    added a consistent indentation style.           
 *                    Removed the changes added in 8 (SHOW_VOICING).  
 *                    Added in-line functions for filtering. The new  
 *                    functions are:                                  
 *                    two_zero_filter, two_zero_filter_2 and          
 *                    two_pole_filter.                                
 *                    Set f6p and b6p to get the correct values for   
 *                    r6pb and r6pc.                                  
 *                                                                    
 *  13. 14-JUL-92 BH  Made VTM work at sample rates 8K, 10K, and 11K. 
 *  14. 08-OCT-96 EAB Fixed three problems							  
 *						1. initialize lacking the initialization of   
 *						   filter param one_minus_decay				 
 *						2. Intialiaze variables when a spdef is loaded
 *						   otherwise filters can overload.			 
 *						3. One packet from last frame stuck so set	 
 *						   vocal tract gains to zero for the first	  
 *						   frame following a speaker def			 
 *						   to make this logiclly a silence packet	 
 *  15. 01-MAY-97 	tek 	Licensing changes								 
 *  16. 26-MAY-97 	EAB 	Fixed "poping problem see note in code		  
    17  04-dec-97 	EAB 	ADDED MANUAL TUNE ROUTINE if MANUAL_TUNE is defined
	18  01-28/98 	EAB 	Added fix for bats 491 and 554
	19 	23mar98		tek 	modified for FP_VTM integration	
	20  04/03/98 	EAB 	Added in new functionality with NEW_VTM (sync glotal noise,
							more genrealized fnp freq setttings. fnp as a frame data parameter. glot_speed
							to make more sinusoidal vocal vibrations for german
	21  4/27/98 	EAB		Cleaned up code improved it's operation and put everything under the label
							of NEW_VTM and removed NEW_NASAL
	22  05/22/1998 	MGS		Moved #endif for FP_VTM lower down
	23  7/31/98  	EAB 	BATS 731 Glotnoise needs to be initalized-doesn't self reset properly otherwise suspect it came up
							negative.
	24  			EAB 	Modified code for Tom to use much less computes eab 10/12/98
							The ifds to be adjusted for lowcompute as well,it was breaking voices 
							having nf >0. 
	26	10/13/98 	EAB  	added new tilt filter and noise source with improved characterisitics
	27  10/23/98 	EAB 	Move NEW_NOISE TO DECTALKF.H
	28  					Modified manual tune ala getmax to look at both values off filter also
							Ifdef out getmax call
	29	28oct98 	tek 	change getmax to be switched on the fly; add COMPRESSION
	30  1/17/99     		BATS852 There was an error in the way nopen was calculated and the
							boiler plate code was holding back the flood.
	31  1/20/99				BATS 858 There was an error in the B0 table where certain values 
	     					of nopen resluted in arithmetic overflow.
	32 2/18/99 		EAB	 	Modifed back found that another mathematical
		 					error had really caused the problem. Also added in new code for female voice
		 					In order to use glot_speed it affects the gains so much we'll have to adjust for it
		 					(UGH!) This change is to let starteam let me check this in because
		 					it crashed during checkin and I'm a coward
	33 02/22/99 	EAB 	Added code to support Wang's closing time work you get this
							if you dont define new_tilt and define closing_time
	34 03/26/99 	EAB 	Added code to support Yubing's closing time method
							also I moved the tilt filter to after avlind contorl because it seems
							more logical to have it go through large excursions with av low or off
	35 6/9/99 				Noticed that when Bill Hallahan changed the vocal tract he forgot to scale the fnp frequency
							that got supplied at speaker def time making fnp not equal to fnz(bug)
	36 6/10/99 				Modified behavior of purev and location of avlind being applied because
							otherwise the gain inherent in the rom database doesn't get normalized
							and can result in running out of dynamic range at cascade 1.
	37  6/11/99 			Modified overload calculation to check at the end of 
							the parallel tract as well as the cascade otherwise we don't 
							really know if we've overloaded(bug)

	38 7/7/99		EAB 	Found that Hallahans setzero routine suffers from integer ovwerflow changes variables to S32's
							to solve problem.
	39 						Moved where avlind is used to make auto tuning better this also necesitated gating the introduction of
							breathiness noise on whether voicing was present as the avlind multiply previously performed this function
	40 /30/99 		EAB 	Fixed setabc declaration -ifdef ou until and if we use the function
	41 3/13/2000 			New noise generator and breathiness calculations needed some adjust(ph 888 was 
							always too strong---refine later
	42 4/11/2000   	EAB  	Nasal filter out by error- how could tuner run??
	43 4/172000    	EAB  	Found problems with nasals--fixed for 4.6 check in
	44 4/17/2000 	EAB 	Modified SP_CHIP for new definitions for unicersal set
	45 5/2/2000		EAB 	Decided to use new_tilt and not Closing_time so I removed
							wangs tables
	46 5/25/2000 	EAB 	Nathan and I found that OUT was defined by WINDEF.h breaking ifdef OUT
	47 08/30/2000 	MGS 	Increased the speed of the tuner
	48 09/05/2000  	MGS  	Added define TUNE_8KHZ_VOICE 8k hz for testing
	49 10/05/2000 	MGS 	Redhat 6.2 and linux warning removal
*	50 10/16/2000	CAB		Changed copyright info
	51 12/6/22000 	eab 	added merged rampdown change and compute reduction together for 4.61 ce release
*   52 02/12/2001	CAB		Updated copyright info
	53 02/27/2001	MFG		Fixed windows CE warnings
	54 3/01/01 Eab Weaken German nasal hack so it doesn;t cause problems better too little than 
	too much as this is a hack until we solve them correctly with hlsyn
	55 //eab found skip_cascade had unusual side effect check in until ship_cas fixeds
Eab 3/13/01 Modifcation to fix problem with skip compute save method and lessen hack 
	to try to improve German nasals until we do HLSYN
	56 EAB Modified T0jit so to improve how it operates
	57 EAB 3/21/01 Removed two unused variables Chris found warning from
	58 EAB rmeove foricning value on tuning BATS955
	59 MGS 02/26/2002	Trial SDK Noise
 * 	60 MGS 04/11/2002		ARM7 port
*
*/

/* *******************************************************************
      Klatt synthesizer as implimented on the TI SPC                  
      Modified version of synthesizer described in                    
      J. Acoust. Soc. Am., Mar. 1980. -- new voicing source.          */                                    
/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/


#define LOWCOMPUTE //EAB 10/13/98 This removes the four times sample rate source generation
//and decimation filter. All thing as considered I think this should always be turned on
//#define LOWER_YET  //eab 10.13.98 Lower the computes by removeing cascade f4 and f5
///#define LOWEST // EAB 10/13/98 Removes f4 and f5 of parallel tract

// 4/20/00 EAB Adding defines to move to new model ans simplify things 

#include "dectalkf.h"

#define NEW_NASAL



#ifdef FP_VTM
#include "vtm_fa.c"
#else


#if defined __linux__
#define _inline inline
#endif

#include "port.h"
#include "ph_def.h"     /*  MVP: Now phinst.h includes phdefs.h */
#include "samprate.h"   /*  Constants used by the vocal tract model   */
#if 0
#include "vtm.h"        /*  Variables used by the vocal tract model   */
#endif
#include "vtmtable.h"   /*  Tables used by the vocal tract model      */
#include "vtmfunc.h"    /*  Functions used by the vocal tract model   */
#include "tts.h"        /*  MVP MI */
#include "vtminst.h"    /*  MVP MI */
#include "ttserr.h"


#ifdef COMPRESSION //  tek 29 oct 98
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

#ifdef UPGRADES1999
//#define  F1_B1_UPGRADE  
#endif
const int int_volume_table[141]=
{
0,
1071,
1110,
1149,
1189,
1231,
1274,
1319,
1365,
1413,
1463,
1515,
1568,
1623,
1680,
1739,
1800,
1863,
1929,
1997,
2067,
2140,
2215,
2293,
2373,
2457,
2543,
2632,
2725,
2821,
2920,
3023,
3129,
3239,
3353,
3470,
3592,
3719,
3849,
3985,
4125,
4270,
4420,
4575,
4736,
4902,
5075,
5253,
5438,
5629,
5826,
6031,
6243,
6463,
6690,
6925,
7168,
7420,
7681,
7951,
8230,
8520,
8819,
9129,
9450,
9782,
10126,
10481,
10850,
11231,
11626,
12034,
12457,
12895,
13348,
13817,
14303,
14806,
15326,
15865,
16422,
16999,
17597,
18215,
18855,
19518,
20204,
20914,
21649,
22410,
23197,
24012,
24856,
25730,
26634,
27570,
28539,
29542,
30580,
31655,
32767,
33917,
35107,
36339,
37615,
38935,
40302,
41716,
43181,
44696,
46265,
47889,
49570,
51310,
53111,
54975,
56905,
58902,
60970,
63110,
65535,
67618,
69991,
72448,
74991,
77623,
80348,
83168,
86087,
89109,
92237,
95474,
98825,
102294,
105885,
109601,
113448,
117430,
121552,
125819,
131071
};


#define MANUAL_TUNE

#define MAX_TRIGGER 16000

/**********************************************************************/
/*  Function prototypes                                               */
/**********************************************************************/

void speech_waveform_generator(LPTTS_HANDLE_T phTTS);
void read_speaker_definition(LPTTS_HANDLE_T phTTS);
void SetSampleRate( LPTTS_HANDLE_T phTTS, unsigned int uiSampRate );
void InitializeVTM(LPTTS_HANDLE_T phTTS);

#ifdef ARM7
#define _inline
#endif

_inline void getmax(S16 value,S16 *maxval);		// KSB - Added for testing of max value
_inline int checkmax(S16 value,S16 checkval);

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
  
  S16 *variabpars;

  S32 temp0;
  S32 temp1;
  S16 b2p;       /*  Bandwidth of parallel 2th formant *//* MVP MI moved from vtm.h */
  S16 b3p;       /*  Bandwidth of parallel 3th formant *//* MVP MI moved from vtm.h */
  S16 out;       /*  Output signal from the vocal tract model*/ 
#ifndef LOWCOMPUTE // NAL warning removal
  S16 nsr4;      /*  Counter of 4 samples in glottal source loop        */ 
#endif
  U32 ns;        /*  Number of samples into current frame            */
  S16 r3pg;      /*  amp of parameter F3 for iir filter                 */
  S16 r2pg;      /*  amp of parameter F2 for iir filter                 */
  S16 ABlin;     /*  AB linear ampl. control                            */
  S16 APlin;     /*  AP linear ampl. control                            */
  S16 voice;     /*  Current sample of voicing waveform                 */ 
  S16 noise;     /*  Output of random number generator                  */


#ifdef NEW_NOISE
  S16 noiseb;	//eab 10/12/98 New noise variable
  S16 noisef;
#endif
S16 abreth=0;
  S16 about;     /*  Output signal from bypass path                     */
  S16 rnzout;    /*  Output signal from nasal zero                      */
  S16 T0inS4;  /*  Voicing fund freq in Hz*10,      500 to 1650         */
#ifdef NEW_VTM
  S16 FNPinHZ;   /*Frequency of moveable nasal formant*/

//23  BATS 731 EAB 7/31/98 Init glotnoise
  S16 FpBw=80;
  S16 FzBw=80;
  
  
#endif

  S16 F1inHZ;  /*  First formant freq in Hz,        200 to 1300         */
  S16 F2inHZ;  /*  Second formant freq in Hz,       550 to 3000         */
  S16 F3inHZ;  /*  Third formant freq in Hz,       1200 to 4800         */
  S16 FZinHZ;  /*  Nasal zero freq in Hz,           248 to  528         */
  S16 fzgaina[20] ={
		200,200,200,200,200,200,800,800,800,800,
			1000,1000,1000,1000,1000,1000,1000,1000,1000,1000};
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
  S16 r6pb = -5702; //MVP : According to me it is a constant BILL       /*  "b" coefficient */
  S16 r6pc = -1995; //MVP : According to me it is a constant BILL       /*  "c" coefficient */


#ifndef LOWCOMPUTE
#ifdef UPGRADES1999 // NAL warning removal
  S16 temp3;
  //S16 logf1;
#endif
#endif
#ifdef LOWCOMPUTE
  S16 tmp;
#endif
#if defined UPGRADES1999 || defined NEW_VTM

	
	S16 ampsum=0; 


//    S16 OPENQ;		/* Open quotient */
	
	///* dynamic breathiness related to open quoient */
 		
#endif
		
	int vol_att=32767;
  
#ifdef UPGRADES1999
 
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

	pKsd_t->vol_att = phTTS->pKernelShareData->vol_att;
	if (pKsd_t->vol_att>141)
		pKsd_t->vol_att = 141;
	if (pKsd_t->vol_att <= 0)
		pKsd_t->vol_att=0;
	
	vol_att=int_volume_table[pKsd_t->vol_att];

  if(pVtm_t->ldspdef == 1 )
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
	   pVtm_t->ldspdef --;
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
  //variabpars[OUT_T0] =(short) (400000.0/variabpars[OUT_T0]);
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

#ifndef NEW_TILT

    TILTDB = variabpars[OUT_TLT];  /* Tilt in dB at 3 kHz */
	
#else

  TILTDB = variabpars[OUT_TLT];
  if(TILTDB < 0)
	  TILTDB= 1;	  
  if(TILTDB >= 40)
	  TILTDB = 40;
  
#endif
#ifdef NEW_NOISE
  APlin= amptable[APinDB ]; /*  Convert dB to linear        */
#else
	APlin= amptable[APinDB + 10]; /*  Convert dB to linear        */
#endif

  r2pg = amptable[A2inDB + 13]; /*  Convert dB to linear        */
  r3pg = amptable[A3inDB + 10]; /*  Convert dB to linear        */
  r4pa = amptable[A4inDB + 7];  /*  Convert dB to linear        */
  r5pa = amptable[A5inDB + 6];  /*  Convert dB to linear        */
  r6pa = amptable[A6inDB + 5];  /*  Convert dB to linear        */
  ABlin= amptable[ABinDB + 5];  /*  Convert dB to linear        */

  ampsum = A2inDB + A3inDB + A4inDB + A5inDB + A6inDB + ABinDB;
  if(ampsum)
	  pVtm_t->par_count=5;
  else
	  if(pVtm_t->par_count)
		  pVtm_t->par_count--;
 

#ifdef UPGRADES1999_OUT //EAB Cause's a re-init during breathiness which has ampsum=0
  ampsum = A2inDB + A3inDB + A4inDB + A5inDB + A6inDB + ABinDB + APinDB + pVtm_t->avlind;
 
	if (ampsum == 0) 
	{	

		/* Always start plosive burst with */
		pVtm_t->randomx = 9;  /* same random sequence */
		/* random = 026541;  Set random number to initial seed */
	}
#endif

  /********************************************************************/
  /*  Scale the nasal anti-resonator frequency for the sample rate.   */
  /********************************************************************/

  FZinHZ = variabpars[OUT_FZ];
	FNPinHZ= variabpars[OUT_FNP];
	


#ifdef NEW_VTM_notopenq //DOn't mess with this as we're going to hlsyn

  OPENQ = variabpars[OUT_OQ];		/* Open quotient */
  
  
  //Glot_step = variabpars[OUT_GS];
  


#endif
#ifdef NEW_VTM_notopenq //DOn't mess with this as we're going to hlsyn

	


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
 *	    B1inHZ + (OPENQ-70) * 10
 */


	temp = OPENQ - 15;	/* 10 determines OPENQ value at */

	if (temp < 0)    
		temp = 0;	/*  which attain max breathiness */

	if (temp > 55)  
		temp = 55;	/* Max breathiness is 55 dB */

		//EAB Reduce further for release 3/00
	if (temp < pVtm_t->Aturb)    
		temp = pVtm_t->Aturb;

	abreth = amptable[temp];


	
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
#ifdef HLSYN
   pVtm_t->AFgain =  amptable[variabpars[OUT_GF]];
#endif
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
#ifdef NEW_NOISE
	  	 noisef = pVtm_t->randomx >> 2;
/*      pVtm_t->randomx = (pVtm_t->randomx * ranmul) + ranadd;*/
	pVtm_t->randomx = (pVtm_t->randomx * 20077) + 12345;
	



	/******************************************************************/
	/*  RANDOM NUMBER FOR FRICATION                    */
	/*  Tilt down aspiration noise spectrum at high freqs by low-pass */
	/*  filtering. noise = 4. * (.25 * input) + 0.75 * last noise                  */
	/******************************************************************/


	noise = noisef + frac1mul( 24576, pVtm_t->nolast);
	pVtm_t->nolast = noisef;
	

	


	/******************************************************************/
	/*  Amplitude modulate noise. Reduce noise amplitude during the   */
	/*  second half of the glottal period if "avlin" > 0. "nmod" is   */
	/*  set to 0 if "avlin" is zero, i.e. the glottal source is off.  */
	/******************************************************************/

	if( pVtm_t->nper < pVtm_t->nmod )
		noise >>= 1;

			/*  Random number for breathiness (first diff preemphasis) */
	noiseb = noise - pVtm_t->noblast;    /* BREATHINESS NOISE */
	pVtm_t->noblast = noise; 

#else
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
#endif //new_noise/else

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
      /*  Future upgrade ?                                            */
      /*  When glottis closes, reduce F1 and B1.                      */
      /****************************************************************/

#ifdef   F1_B1_UPGRADE
	if(pVtm_t->Up_Down_Flag == 0)
    { 
		//f1_b1_down(F1inHZ);
	  pVtm_t->r1cc -= (F1inHZ);
	  pVtm_t->r1cb += (pVtm_t->delr1b + (F1inHZ));

	  pVtm_t->Up_Down_Flag=1;
	}
#endif

      /****************************************************************/
      /*  voicing has fixed waveshape, at**2 - bt**3                  */
      /****************************************************************/


      if ( pVtm_t->nper > ( pVtm_t->T0 - pVtm_t->nopen ))
      {
		 
		(pVtm_t->a) -= pVtm_t->b;             /*  Fixed waveshape at**2 - bt**3         */

		(pVtm_t->voice0) += pVtm_t->a>>4;       /*  Differentiated glottal flow.          */
		pVtm_t->avlind = pVtm_t->avlin;     /*  Delay action of "avlin" change.       */
      }
      else
      {

			pVtm_t->voice0  = 0;
#ifdef NEW_TILT

	  /* Reset tilt filter at glottal open time (WHY NOT AT CLOSE TIME?) */
		if (pVtm_t->nper == (pVtm_t->topen)) 
			{
		/* BUG: Some kind of obscure overload if TILTDB == 0,1 */
				
				if (TILTDB < 2)    TILTDB = 1;
				if (TILTDB > 41)  
					TILTDB = 41;
				
				Ftilt = frac1mul(20000,tiltf[TILTDB]);  
				/* 0.6 (fold into table)*/
				BWtilt = tiltbw[TILTDB];
			/* need to add new spdef for rltlg*/
				rtltg=2048;   
			 
/*                Make gain approx. constant at f=300 rather than at f=0 */
/*                This results in boost of as much as 8 dB at f=100 fund comp */
				if (TILTDB > 10)   
					rtltg += ((TILTDB-10) * (TILTDB-10) * 4);
				/* eab had to drop correction at high tilts we were overeloading*/
		    /*    Set one-pole low-pass filter that tilts glottal source */

            //setabc( Ftilt, BWtilt, &pVtm_t->rtca, &pVtm_t->rtcb, &pVtm_t->rtcc);
			pVtm_t->rtca = d2pole_pf( pVtm_t,&pVtm_t->rtcb, &pVtm_t->rtcc, Ftilt, BWtilt, rtltg);
			} 

#endif //NEW_TILT

			



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
	  

      /****************************************************************/
      /*  SOME PARAMETERS ARE UPDATED PITCH SYNCHRONOUSLY             */
      /*  (at sample before glottal close time)                       */
      /****************************************************************/

      if ( pVtm_t->nper >= pVtm_t->T0 )
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
	pVtm_t->T0 = T0inS4;          /*  T0inS4 remembers period in case     */
	      /*  more than 1 period in cur frame.    */
	tmp = frac4mul( pVtm_t->t0jitr, T0inS4 ); /*  Add jitter, if any.        */
	pVtm_t->T0 = (tmp+T0inS4)>>2;
#else

	pVtm_t->T0 = T0inS4;
	      /*  more than 1 period in cur frame.    */
	pVtm_t->T0 += frac4mul( pVtm_t->t0jitr, pVtm_t->T0 ); /*  Add jitter, if any.        */
	
#endif
			
	pVtm_t->t0jitr = -(pVtm_t->t0jitr);     /*  Change sign for alternating jitter. */

	/**************************************************************/
	/*  \1 is the Speaker definition breathiness coeficient   */
	/**************************************************************/

	pVtm_t->aturb1 = pVtm_t->Aturb;

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
	//Eab Improvement 9/12/00
	if ( pVtm_t->avlin > 0 )
	  pVtm_t->nmod = pVtm_t->nopen;
#ifdef LOWCOMPUTE
	pVtm_t->nopen = frac1mul( pVtm_t->k1, pVtm_t->T0 ) + (pVtm_t->k2>>1);   /*  in open part of period */
#else
#ifdef UPGRADES1999
	/*spdef pars k1 & k2 NOT USED ANYMORE 
	   nopen = frac1mul(k1,T0) + k2; */
		temp3 = OPENQ;
		if (temp3 < 10)    temp3 = 10;
		if (temp3 > 75)    temp3 = 75;
		pVtm_t->temp = (temp3*pVtm_t->T0)>>6;
		pVtm_t->nopen = frac4mul(2620,pVtm_t->temp);

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
#ifndef NEW_TILTnotinhlsyn
	pVtm_t->nopen += ( TILTDB<<2  );      /*  Longer if TILTDB increases */
#endif
	if ( pVtm_t->nopen < 40 )
	  pVtm_t->nopen = 40;        /*  Min is 40                            */
	else
	  if ( pVtm_t->nopen > 263 )
	    pVtm_t->nopen = 263;     /*  Max is 263                           */

	if ( pVtm_t->nopen >= (( pVtm_t->T0 * 3 ) >> 2 ))
	  pVtm_t->nopen = (( pVtm_t->T0 * 3 ) >> 2 );    /*  or 3/4 T0                */
#else
#ifndef UPGRADES1999	
	//pVtm_t->nopen += ( TILTDB  );      /*  Longer if TILTDB increases */
#endif


	if ( pVtm_t->nopen < 10 )
	  pVtm_t->nopen = 10;        /*  Min is 40                            */
	else
	  if ( pVtm_t->nopen > (263>>2) )
	    pVtm_t->nopen = (263>>2);     /*  Max is 263                           */

	if ( pVtm_t->nopen >= (( pVtm_t->T0 * 3 ) >> 2 ))
	  pVtm_t->nopen = (( pVtm_t->T0 * 3 ) >> 2 );    /*  or 3/4 T0                */
#ifdef NEW_TILT
	pVtm_t->topen=  pVtm_t->T0-pVtm_t->nopen;
#endif


#endif
	


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

	d2pole_cf123( pVtm_t,pKsd_t, &pVtm_t->rnpb, &pVtm_t->rnpc,FNPinHZ , 200 ,0 );
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

#ifdef UPGRADES1999
/*  Adjust memory variables to have proper levels for a given sudden
              change to F1inHZ.
	      Approximate r1c_n' = r1c_n * sqrt(r1ca/r1calast)
	      by r1c_n' = r1c_n * (F1hz/F1hzlast) */
		pVtm_t->logf1 = logtab[F1inHZ>>3];
	     if ((F1inHZ < 200) && (F1inHZ < pVtm_t->f1last)) 
			{
			 pVtm_t->anorm = loginv[pVtm_t->logf1l-pVtm_t->logf1];  
			 /* anorm = Fx / Fxlast; */
/*	      For reasons that I don't understand, amplitude compensation
              seems to be needed only when a formant goes down in frequency */
		    pVtm_t->r1cd1 = frac1mul(pVtm_t->r1cd1,pVtm_t->anorm);
		    pVtm_t->r1cd2 = frac1mul(pVtm_t->r1cd2,pVtm_t->anorm);
		}
		pVtm_t->f1last = F1inHZ;
		pVtm_t->logf1l = pVtm_t->logf1;	/* Save to use next time */

#endif //upgrades1999


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


	/**************************************************************/
	/*  Future upgrade ?                                          */
	/*  Set pitch-synchronous changes to F1.                      */
	/**************************************************************/

#ifdef F1_B1_UPGRADE

	if(pVtm_t->Up_Down_Flag == 1)
	{
	//f1_b1_up(F1inHZ);
	pVtm_t->delr1b = frac4mul( F1inHZ, F1inHZ ) >>1;
	pVtm_t->r1cc += (F1inHZ);
	pVtm_t->r1cb -= (pVtm_t->delr1b + (F1inHZ));
	pVtm_t->Up_Down_Flag =0;
	}

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

#ifdef NEW_TEST
/*  Adjust memory variables to have proper levels for a given sudden
              change to F1inHZ.
	      Approximate r1c_n' = r1c_n * sqrt(r1ca/r1calast)
	      by r1c_n' = r1c_n * (F1hz/F1hzlast) */
		pVtm_t->logz1 = logtab[FZinHZ>>3];
	     if ( FZinHZ < pVtm_t->fzlast) 
			{
			 pVtm_t->aznorm = loginv[pVtm_t->logz1l-pVtm_t->logz1];  
			 /* anorm = Fx / Fxlast; */
/*	      For reasons that I don't understand, amplitude compensation
              seems to be needed only when a formant goes down in frequency */
		    pVtm_t->rnzd1 = frac1mul(pVtm_t->rnzd1,pVtm_t->aznorm);
		    pVtm_t->rnzd2 = frac1mul(pVtm_t->rnzd2,pVtm_t->aznorm);
		}
		pVtm_t->fzlast = FZinHZ;
		pVtm_t->logz1l = pVtm_t->logz1;	/* Save to use next time */
#endif





	setzeroabc( FZinHZ,200, 93, &pVtm_t->rnza, &pVtm_t->rnzb, &pVtm_t->rnzc);
	  }

#endif
		//pVtm_t->iwave[ns] = voice;

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

  if ( (pVtm_t->avlind + pVtm_t->avlin + APlin ))
	  pVtm_t->cas_count = 20;
  else
	  if(pVtm_t->cas_count)
		  pVtm_t->cas_count--;

if(pVtm_t->cas_count == 0)
{
	
	//eab 3/7/01 Compute save has a bug if somehitng nees to be initalized probably in the filters
	//as a voiced cons such as [g] comes on wrong probably get "the dog" clean before re-implementaiton
	  
	  pVtm_t->rtca =0; 
	  pVtm_t->rtd1 =0;
	  pVtm_t->rtd2 =0;
		out=0;
	  //goto skip_cascade;
	  	
}
	
#ifndef NEW_TILT

	//pVtm_t->iwave[ns] = voice;
	voice = frac1mul( pVtm_t->one_minus_decay, voice )
		  + frac1mul( pVtm_t->decay, pVtm_t->vlast );
	pVtm_t->vlast = voice;
	
	
#else
 	
/*    Tilt spectrum of voicing source down by soft low-pass filtering, amount
      of tilt determined by TL which determines additional dB down at 3 kHz */
  
	two_pole_filter( voice, pVtm_t->rtd1, pVtm_t->rtd2, pVtm_t->rtca, pVtm_t->rtcb, pVtm_t->rtcc );
	voice=pVtm_t->rtd1;
	
#endif 

    /******************************************************************/
    /*  Add breathiness to voicing. Increase noise if Aspiration.     */
    /******************************************************************/
	/*EAB With move of voicing gain noise aspiration to be gated by the fact that 
	we're voicing for now anway */

#ifdef NEW_NOISE


	pVtm_t->temp =  frac1mul((abreth), noiseb  );
	voice += frac4mul( pVtm_t->avlind, pVtm_t->temp );

	//voice += frac1mul((abreth), noiseb  );
#else
	voice += frac1mul( pVtm_t->aturb1, noise );
#endif
	



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

	two_zero_filter( voice, rnzout, pVtm_t->rnzd1, pVtm_t->rnzd2, pVtm_t->rnza, pVtm_t->rnzb, pVtm_t->rnzc );

	//pVtm_t->iwave[ns] = rnzout;
    /******************************************************************/
    /*  Nasal Resonator of Cascade Vocal Tract                        */
    /*  output is rnpd1.                                              */
    /******************************************************************/
//	pVtm_t->rnpa = pVtm_t->rnpa - ((FZinHZ-200)<<1);
    two_pole_filter( rnzout, pVtm_t->rnpd1, pVtm_t->rnpd2, pVtm_t->rnpa, pVtm_t->rnpb, pVtm_t->rnpc );


	//pVtm_t->iwave[ns] = pVtm_t->rnpd1;

#ifndef LOWER_YET
	


		
    /******************************************************************/
    /*  Fifth Formant                                                 */
    /*  output is r5cd1.                                              */
    /******************************************************************/

    if ( pKsd_t->uiSampleRate > 9500 && ((pVtm_t->R5cb|pVtm_t->R5cc)!=0))
    {
	  two_pole_filter(pVtm_t->rnpd1, pVtm_t->r5cd1, pVtm_t->r5cd2, pVtm_t->R5ca, pVtm_t->R5cb, pVtm_t->R5cc );
	}
    else
    {
      pVtm_t->r5cd1 = pVtm_t->rnpd1;
    }
#else
		pVtm_t->r5cd1= pVtm_t->rnpd1;
#endif //lower_yet


	/******************************************************************/
    /*  First Formant of Cascade Vocal Tract                          */
    /*  output is r1cd1.                                              */
    /******************************************************************/

    two_pole_filter( pVtm_t->r5cd1, pVtm_t->r1cd1, pVtm_t->r1cd2, pVtm_t->R1ca, pVtm_t->r1cb, pVtm_t->r1cc );
#ifndef lower_yet

    /******************************************************************/
    /*  Fourth Formant                                                */
    /*  output is r4cd1.                                              */
    /******************************************************************/
	if ((pVtm_t->R4cb|pVtm_t->R4cc)!=0)
	{
		two_pole_filter( pVtm_t->r1cd1, pVtm_t->r4cd1, pVtm_t->r4cd2, pVtm_t->R4ca, pVtm_t->R4cb, pVtm_t->R4cc );
	}
	else
	{
		pVtm_t->r4cd1= pVtm_t->r1cd1;
	}
#else 
	pVtm_t->r4cd1= pVtm_t->r1cd1;

#endif //lower_yet

    /******************************************************************/
    /*  Third Formant                                                 */
    /*  output is r3cd1.                                              */
    /******************************************************************/

    two_pole_filter( pVtm_t->r4cd1, pVtm_t->r3cd1, pVtm_t->r3cd2, pVtm_t->R3ca, pVtm_t->r3cb, pVtm_t->r3cc );

	//pVtm_t->iwave[ns] =  pVtm_t->r3cd1;
    /******************************************************************/
    /*  Second Formant                                                */
    /*  output is r2cd1.                                              */
    /******************************************************************/

    two_pole_filter( pVtm_t->r3cd1, pVtm_t->r2cd1, pVtm_t->r2cd2, pVtm_t->R2ca, pVtm_t->r2cb, pVtm_t->r2cc );
//	pVtm_t->iwave[ns] = pVtm_t->r2cd1; 

	

	 out = pVtm_t->r2cd1;

	//pVtm_t->iwave[ns] =  pVtm_t->r2cd1;
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
#ifdef GERMAN
	
	two_pole_filter( voice, pVtm_t->rnppd1, pVtm_t->rnppd2, pVtm_t->rnppa,pVtm_t->rnppb, pVtm_t->rnppc );
	out = pVtm_t->rnppd1 - out;
#endif
	if(pVtm_t->par_count==0)
		goto skip_parallel;

    two_pole_filter( noise, pVtm_t->r6pd1, pVtm_t->r6pd2, r6pa,r6pb, r6pc );
	
    out = pVtm_t->r6pd1 - out;
#ifndef LOWEST

    /******************************************************************/
    /*  Fifth Formant of Parallel Vocal Tract                         */
    /*  Fifth parallel formant effectively out of circuit if the      */
    /*  sample rate is low enough.                                    */
    /******************************************************************/

    if ( pKsd_t->uiSampleRate > 9600 && ((pVtm_t->R5pb|pVtm_t->r5pc)!=0) )
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

	if ((pVtm_t->R4pb|pVtm_t->r4pc)!=0)
	{
		two_pole_filter( noise, pVtm_t->r4pd1, pVtm_t->r4pd2, r4pa, pVtm_t->R4pb, pVtm_t->r4pc );
	}
	else
	{
		pVtm_t->r4pd1=0;
	}

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



skip_parallel:
	
		 //6/22/99 With the hotter tuning of the vocal tract the limit sycles are becoming very annoying
	 //since we now pass phoneme information we can build a decayer to choke out he limit cycle
	 //when we reach silence with av off we ramp down the gain....This also solves the problem of continues
	 //noise with a breathy voice. 
	 if (pVtm_t->avlind == 0 && (variabpars[OUT_PH] & PVALUE) == 0 )
	 {
		
		 pVtm_t->rampdown += 200;
		  if (pVtm_t->rampdown >= 4096)
			 pVtm_t->rampdown = 4096;
		  out = frac4mul( out,(4096 - pVtm_t->rampdown));
	 }
	 else

		 pVtm_t->rampdown=0;
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
	if(!pVtm_t->bDoTuning)
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
#ifdef DEMO_NOISE
	if (pVtm_t->makenoise)
	{
	out += (pVtm_t->pointer>>2);
	if (pVtm_t->pointer < 3000)
		pVtm_t->pointer += 120;
	else 
		pVtm_t->pointer = 0;
	}
#endif
		if(pVtm_t->bDoTuning)
		{
		if ( out > 16383 )
			out = 16383;
		else if ( out < -16384 )
			out = -16384;
		pVtm_t->iwave[ns] =  out << 1;
		}
		else
		{
			out= frac1mul(out, vol_att );
		if ( out > 16383 )
			out = 16383;
		else if ( out < -16384 )
			out = -16384;
		pVtm_t->iwave[ns] =  out << 1;
		}
#endif //COMPRESSION

	// tek 28oct98 move all the tuning pickups here, so that we can turn them on/off
	// with just one if statement

#ifndef ARM7
	if(pVtm_t->bDoTuning)
	{
		BOOL bOverloaded = FALSE;
		DWORD dwPhoneme = variabpars[OUT_PH];

		// keep track of the phonemes..
		if (dwPhoneme != pVtm_t->vtdTuneResults.dwThisPhoneme)
		{
			pVtm_t->vtdTuneResults.dwLastPhoneme = pVtm_t->vtdTuneResults.dwThisPhoneme;
			pVtm_t->vtdTuneResults.dwThisPhoneme = dwPhoneme;
		}


#if 1
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
		getmax(pVtm_t->iwave[ns],&pVtm_t->vtdTuneResults.r5pd1);
#endif


#if 0

		if ( (pVtm_t->vtdTuneResults.purevmax > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.rnzmax > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.rnpmax > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c5max > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c4max > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c3max > MAX_TRIGGER)
			||(pVtm_t->vtdTuneResults.c2max > 26000 /*MAX_TRIGGER*/)
			||(pVtm_t->vtdTuneResults.c1max > MAX_TRIGGER) 
			//eab 6/11/99 Also check output at end of parallel tract
			//becuase we really don't want any overloads......
			|| (pVtm_t->vtdTuneResults.r5pd1 > 28000)
			)
#endif
		if (checkmax(pVtm_t->rlpd1,MAX_TRIGGER) ||
			checkmax(pVtm_t->rnzd1,MAX_TRIGGER) ||
			checkmax(pVtm_t->rnpd1,MAX_TRIGGER) ||
			checkmax(pVtm_t->r5cd1,MAX_TRIGGER) ||
			checkmax(pVtm_t->r4cd1,MAX_TRIGGER) ||
			checkmax(pVtm_t->r3cd1,MAX_TRIGGER) ||
			checkmax(pVtm_t->r2cd1,26000) ||
			checkmax(pVtm_t->r1cd1,MAX_TRIGGER) ||
			checkmax(pVtm_t->iwave[ns],28000))
		{

			bOverloaded=TRUE;
			// stop tracing
			pVtm_t->bDoTuning = FALSE;
			pVtm_t->vtdTuneResults.purevmax=pVtm_t->rlpd1;
			pVtm_t->vtdTuneResults.rnzmax=pVtm_t->rnzd1;
			pVtm_t->vtdTuneResults.rnpmax=pVtm_t->rnpd1;
			pVtm_t->vtdTuneResults.c5max=pVtm_t->r5cd1;
			pVtm_t->vtdTuneResults.c4max=pVtm_t->r4cd1;
			pVtm_t->vtdTuneResults.c3max=pVtm_t->r3cd1;
			pVtm_t->vtdTuneResults.c2max=pVtm_t->r2cd1;
			pVtm_t->vtdTuneResults.c1max=pVtm_t->r1cd1;
			pVtm_t->vtdTuneResults.r2pd1=pVtm_t->r2pd1;
			pVtm_t->vtdTuneResults.r3pd1=pVtm_t->r3pd1;
			pVtm_t->vtdTuneResults.r4pd1=pVtm_t->r4pd1;
			pVtm_t->vtdTuneResults.r5pd1=pVtm_t->iwave[ns];

			
			pVtm_t->vtdTuneResults.bDidOverload = TRUE;
			pVtm_t->vtdTuneResults.r1cd2 = pVtm_t->r1cd2;
			pVtm_t->vtdTuneResults.r2cd2 = pVtm_t->r2cd2;
			pVtm_t->vtdTuneResults.r3cd2 = pVtm_t->r3cd2;
			pVtm_t->vtdTuneResults.r4cd2 = pVtm_t->r4cd2;
			pVtm_t->vtdTuneResults.r5cd2 = pVtm_t->r5cd2;
			pVtm_t->vtdTuneResults.rnpd2 = pVtm_t->rnpd2;
			pVtm_t->vtdTuneResults.rnzd2 = pVtm_t->rnzd2;
			pVtm_t->vtdTuneResults.rlpd2 = pVtm_t->rlpd2;

			if (phTTS->hTuneStopEvent!=NULL)
			{
				OP_SetEvent(phTTS->hTuneStopEvent);
				OP_Sleep(0);
			}


		}

		
	}

#endif

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

#ifndef LOWCOMPUTE
  S16 flp;       /*  Frequency of fixed glottal decimating filter       */
  S16 blp;       /*  Bandwidth of fixed glottal decimating filter       */
  S16 rlpg;      /*  Gain of down-sampling low-pass resonator           */
#endif
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
#ifdef  F1_B1_UPGRADE  
    pVtm_t->Up_Down_Flag=0;
#endif

	pVtm_t->ldspdef=1;	  /*  flag that we loaded a speaker def eab 10/96*/
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
  pVtm_t->vtdTuneResults.r5pd1 = 0;


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

#ifndef LOWCOMPUTE
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
#endif
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
  pVtm_t->r2cg = amptable[a2gain];
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
#ifdef HLSYN
  pVtm_t->AFgain = amptable[afg]; 
#else
	pVtm_t->AFgain = amptable[afg-5];
#endif


  /********************************************************************/
  /*  Gain of the nasal pole resonator of cascade filter section.     */
  /********************************************************************/

  rnpg = ((SPD_CHIP *)spdeftochip)->rnpgain;   /*  20                  */
  pVtm_t->rnpa = amptable[rnpg];
  

  /********************************************************************/
  /*  Overall gain of voicing source relative to other sources        */
  /********************************************************************/

  avg = ((SPD_CHIP *)spdeftochip)->azgain;     /*  21                  */
#ifdef HLSYN
  pVtm_t->avgain = amptable[avg];
#else
	pVtm_t->avgain = amptable[avg-5];
#endif

  /********************************************************************/
  /*  Overall gain of aspiration source relative to other sources     */
  /********************************************************************/

  apg = ((SPD_CHIP *)spdeftochip)->apgain;     /*  22                  */
#ifdef HLSYN
  pVtm_t->APgain = amptable[apg];
#else
	 pVtm_t->APgain = amptable[apg-5];

#endif

  phTTS->pKernelShareData->uiCurrentSpeaker = (short)((SPD_CHIP *)spdeftochip)->speaker; // NAL warning removal
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
	pVtm_t->cas_count = 0;
	pVtm_t->par_count = 0;
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
	pVtm_t->rampdown =0;

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
#ifdef OLD_F1_B1_UPGRADE

f1_b1_up(short F1inHZ)
{
  pVtm_t->delr1b = frac4mul( F1inHZ, F1inHZ ) >> 1;
  pVtm_t->r1cc += (F1inHZ);
  pVtm_t->r1cb -= (pVtm_t->delr1b + (F1inHZ));
}


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


f1_b1_down(F1inHZ)
{
  if ( nper == nopen )
{
  pVtm_t->r1cc -= (F1inHZ);
  pVtm_t->r1cb += (pVtm_t->delr1b + (F1inHZ));
}

#endif
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

#ifndef TUNE_8KHZ_VOICE
  pKsd_t->uiSampleRate = uiSampRate;
  pVtm_t->SampleRate = pKsd_t->uiSampleRate;
#else
   pVtm_t->SampleRate = 8000; /* for 8khz tune eab 1/15/98 */
   pKsd_t->uiSampleRate = 8000;
#endif	// TUNE_8KHZ_VOICE
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

_inline void getmax(S16 value,S16 *maxval)	// KSB - Added for testing of max value
	{
	if (value <0)
		value = -value;

	if (value > *maxval)	*maxval=value;
	return;
}

_inline int checkmax(S16 value,S16 checkval)	// KSB - Added for testing of max value
{
	if (value>checkval || value<(-checkval))
		return(1);
	else
		return(0);
#if 0	
	if (value <0)
		value = -value;

	if (value > checkval)	return(1);;
	return(0);
#endif
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
	/* EAB 7/7/99 CHnages varibales from ints to S32 to avoid overflow errors*/

S32 acoef;
S32 bcoef;
S32 ccoef;


S32 r;

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
	  
	*sacoef = ( (4096* rnzg )/acoef);
	*sbcoef = -((bcoef*rnzg)/acoef);
	*sccoef = -((ccoef*rnzg)/acoef);

	
	
	/*    Debugging printout *
      printf("fz=%3d bw=%3d acoef=%8.5f bcoef=%8.5f ccoef=%8.5f\n",
	  f, bw, *acoef, *bcoef, *ccoef);  */

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


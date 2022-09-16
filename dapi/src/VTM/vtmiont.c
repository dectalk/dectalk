/**********************************************************************/
/*                                                                    */
/*  DECtalk Vocal Tract Model I/O for Windows/NT                      */
/*                                                                    */
// Copyright (c) 1993-1998 Digital Equipment Corporation
/*      ASYNCHRONOUS ERROR MESSAGES.                                  */
/*                                                                    */
/*         This thread may send error messages to the window          */
/*    procedure specified by the window handle passed in function     */
/*    TextToSpeechStartup(). The application may wish to handle these */
/*    messages. One of the error codes listed below will be contained */
/*    in the wParam field of the message. The lParam field of the     */
/*    message will contain a value of type MMRESULT. An application   */
/*    may use function waveOutGetErrorText() to obtain a text string  */
/*    corresponding to the MMRESULT (lParam) error code.              */
/*                                                                    */
/*        wParam error code                                           */
/*                                                                    */
/*      ERROR_WRITING_FILE                                            */
/*                                                                    */
/* edit history:													  */
/* 01	16Jan97		GL		Merge the change in V4.3 code into V4.4   */
/* 02	09jun97		tek		typing changes
/* 03	18Jul97		MGS		BATS 409, Corrected improper use of
							Critical Sections in vtm_main
/*		24oct97		tek		bats505 force final samples out           */
/*		12nov97		tek		bats508: don't DoSync if halting.
/* 03	01aug97		tek		bats404: new index packet types           */
/*							(also add bats 405/409 "Critical Section")*/
/*                          actually merged 13nov97                   */
/* xx	19nov97		tek		let VTM manage PH and VTMs thread priority*/
/*							and interlock the EmptyVtmPipe activity   */
/*							(bats530)                                 */
/* xx	07jan98		tek		provide visual notification for DAPI too. */
/*							(bats546)                                 */
/* XX	30JAN98		tek		repair merge of bats546                   */
// xx	09mar98		tek		sapi backend timing (group h)
/* 04   16mar98		JAW		Merged CE code.                           */
/* 05   18mar98		cjl		Removed specific path for dectalkf.h. */
/* xx	19mar98		tek		bats 608/609/620: fix maintenance of	  */
/*							dwQueuedSampleCount for 8-bit formats	  */
/* xx	20aug98		tek		support for killing audio for ConvertToPhonemes */
/* xx	16sep98		tek		fall back to the sync path for Visual marks when audio not started. */
/* xx	30sep98		tek		set hSyncEvent earlier under SAPi to avoid */
/*							hangs with leading pauses or syncs		*/
/* xx	28oct98		tek		init the bDoTuning flag	*/
/* 11	10nov98		ETT		added comments and bPipesNotEmpty init.															  */
/* 12	20nov98		GL		BATS#828 use VTM_DEBUG to replace _DEBUG
/* 13	13apr99		mfg		to fixed ACCESS32 studder for ARM211 tek fix
/* 14	27jul99		mfg		included  cemm.h for WinCE builds
/* 15	29oct99		mgs		Fixed bug uncovered by removing the debug window for release builds
/* 16   feb 11,00 	EAB		Integrated hlsyn
/**********************************************************************/
/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/
//define HLSYN
#include "dectalkf.h"
#ifdef HLSYN
#include "hlsynapi.h"
#endif

#ifdef SAPI_GROUP_H_TIMING
#ifdef OLEDECTALK// tek 20feb98 turn on bookmark mode
#define USE_BOOKMARKS_FOR_SYNC
#endif //OLEDECTALK
#endif // SAPI_GROUP_H_TIMING
// Must be defined above....
//#detine HLSYN
#include <windows.h>
#include <malloc.h>
#include "port.h"
#include "defs.h"
#include "kernel.h"
#include "ph_def.h"    /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"
#include "tts.h"

// tek 20sep97 SAPI is never "typing mode"..
#ifdef OLEDECTALK
#ifdef TYPING_MODE
#undef TYPING_MODE
#endif //TYPING_MODE
#ifdef ACCESS32
#undef ACCESS32
#endif //ACCESS32
#endif //OLEDECTALK

#ifdef UNDER_CE
#include "cemm.h"
#endif //UNDER_CE


#define USING_LLSYN

#ifdef TYPING_MODE
// this magic number is different depending on the brain-damaged audio driver
// you're stuck with..
#ifdef UNDER_CE
#define MIN_TYPING_FRAMES (0x1f)// tek frames to queue before starting audio
								// this number seems to be magic for some audio 
								// drivers..  this interacts with the calculation
								// for uiStartupWriteLength as well..
#else //UNDER_CE

#define MIN_TYPING_FRAMES (0xF)	// tek frames to queue before starting audio
#endif //UNDER_CE
//DWORD MIN_TYPING_FRAMES=5;
#define	TYPING_QUEUE_SLEEP_TIME (3)	// this is the time that the VTM thread
									// falls asleep for after queueing the 
									// above frames. Combined with the drop
									// in PH's priority, this allows the user
									// app to make forward process
// tek 18nov97 constants used in managing VTM/PH Priority (in BYTES.. ugh..)
#define BUFFER_LENGTH_RED	(4400)	// when we fall below this much output, go to 
									// max priority (4400 ~= 200msec at 11kHz)
#define BUFFER_LENGTH_YELLOW (22000)// when below this much, go to above_normal
// what we set PH back to when we have plenty to do..
#define BASE_PH_PRIORITY (THREAD_PRIORITY_NORMAL)
#endif //TYPING_MOD
/**********************************************************************/
/*  GLOBAL VARIABLE DECLARATIONS.                                     */
/**********************************************************************/

#ifdef ASM_FVTM

#include "..\fvtm\fvtmasm.h"    /* Declare prototypes required by asm FVTM */
#endif

#include "vtminst.h"    /* MVP MI New : New header file */

#ifdef ASM_FVTM
/*
S16 iwave[128];                   MVP MI moved to vtminst.h 
S16 parambuff[128];
*/
/**********************************************************************/
/*  Current speaker value set by the read_speaker_definition routine. */
/**********************************************************************/

/*U32 uiCurrentSpeaker = 0;     */      /* MVP MI moved to vtminst.h */

/**********************************************************************/
/*  Sample rate scaling parameters for time and frequency.            */
/*                                                                    */
/*  uiSampleRate set by the SetSampleRate routine. It is read later   */
/*  by the phvdef function to determine the speaker definition to use */
/*  for the current sample rate.                                      */
/**********************************************************************/
/*                                                                         MVP MI moved to vtminst.h
U32 uiSampleRate               = 11025;
double SampleRate              = 11025.0;
double SamplePeriod            = 9.07029478458e-5;
U32 uiNumberOfSamplesPerFrame  = 71;
*/
/*FVTM_T Fvtm;*/           /* Instance variable for assembly FVTM.        */

/**********************************************************************/
/*  External function declarations for FVTM in assembly language.     */
/**********************************************************************/

void SetSampleRate( LPTTS_HANDLE_T ,unsigned int );

#else

/**********************************************************************/
/*  External variables declared by FVTM in C.                         */
/**********************************************************************/
/*              defined in vtminst.h ;Later access to these variables is through
					  Instance specific structure.(VTM_T)
extern S16 iwave[];
extern DT_PIPE_T parambuff[];
extern unsigned int uiNumberOfSamplesPerFrame;
extern double SampleRate;
*/
/*extern double SamplePeriod;*/         /* MVP : moved to Kernel_share_data*/
/* MVP Added on 10/06/95 */
S16 noisec ;    /*  "c" coefficient                                    */
S32 ranmul ;    /*  Magic constant to make next random number          */
S32 ranadd ;    /*  Magic constant to make next random number          */
/**********************************************************************/
/*  External function declarations for FVTM in C.                     */
/**********************************************************************/

extern void speech_waveform_generator(LPTTS_HANDLE_T phTTS);
#ifdef HLSYN
typedef void (*LLInitType)(LLSynth *, Speaker *);
typedef void (*InitializeHLSynthesizerType)(HLFrame *, HLSpeaker *, HLState *, short);
typedef void (*HLSynthesizeLLFrameType)(HLFrame *, HLFrame *, HLSpeaker *, 
										HLState *, HLState *, LLFrame *);
void (*LLSynthesizeType)(LLSynth *, LLFrame *, short *);

#define NUM_FRAMES 1
#define FEMALE 0
#define MALE 1


#endif

extern void read_speaker_definition(LPTTS_HANDLE_T phTTS);

void InitializeVTM(LPTTS_HANDLE_T phTTS);

extern void SetSampleRate( LPTTS_HANDLE_T, unsigned int );

#endif


/**********************************************************************/
/*  External function declarations.                                   */
/**********************************************************************/

extern BOOL PlayTones( LPTTS_HANDLE_T,
			   double,
			   double,
			   double,
			   double,
			   double,
			   double
			   );

extern MMRESULT WriteAudioToFile( LPTTS_HANDLE_T,
				  LPSAMPLE_T,
				  UINT );

extern void QueueToMemory( LPTTS_HANDLE_T, LPSAMPLE_T, DWORD );

extern void PutIndexMarkInBuffer( LPTTS_HANDLE_T, DWORD, DWORD );

extern void PutPhonemeInBuffer( LPTTS_HANDLE_T phTTS,
				DWORD,
				DWORD,
				DWORD );

/**********************************************************************/
/*  Function Prototypes.                                              */
/**********************************************************************/

void OutputData( LPTTS_HANDLE_T,
		 short *,
		 unsigned int,
		 DWORD,
		 DWORD );

// tek 07jan98 this now exists for DAPI too. (bats546)
// tek 13nov97 new prototype.. new function..
void SendVisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration);


/**********************************************************************/
/*  External variables.                                               */
/**********************************************************************/

/*extern short last_voice;*/ /* Will be accesed through Kernel_share_data structure */

/**********************************************************************/
/*  Global Variables.                                                 */
/**********************************************************************/

/*DWORD dwLastPhoneme;  */      /* Will be accesed through Kernel_share_data structure */
#ifdef VTM_DEBUG
#include <stdio.h>
char szTemp[256]="";
#endif //VTM_DEBUG
/**********************************************************************/
/*  Start of the VTM thread.                                          */
/**********************************************************************/
#ifdef WIN32
DWORD __stdcall vtm_main( LPTTS_HANDLE_T phTTS )
#else
DWORD vtm_main( LPTTS_HANDLE_T phTTS )
#endif
{
#ifdef OLEDECTALK	//tek 04aug97
  PMARK_DATA pMarkData;
#endif



	


#ifdef HLSYN

	HLSpeaker speaker;
	HLState state, oldstate;
	HLFrame frame, oldframe;
	LLFrame llframe;
	LLSynth llsynth;
	Speaker llspeaker;

  
#endif	

  // tek 18nov97 keep track of whether we are close to running out of input data 
  // from PH..
  BOOL	bRunningOutOfInput=FALSE;
  S16 control;
  DWORD dwSyncParams[4];
  DWORD dwSampleNumber;
  /*MVP added PKSD_T to get the handle of instance specific kernel_share_data*/
  PVTM_T pVtm_t =NULL;
  PKSD_T pKsd_t = phTTS->pKernelShareData;
 /* MVP Added on 10/06/95 */

#ifdef HLSYN
  llspeaker.DU = 500;		/* duration of utterance (ignored) */
  llspeaker.UI = 71;		/* update interval (samples per frame) */
  llspeaker.SR = 11025;		/* sample rate */
  llspeaker.NF = 5;		/* number of formants in cascade */
  llspeaker.SS = 2;		/* source select */
  llspeaker.RS = 8;		/* random seed */
  llspeaker.SB = 1;		/* same burst */
  llspeaker.CP = 0;		/* cascade/parallel */
  llspeaker.OS = 0;		/* output select */
  llspeaker.GV = 60;		/* gain of voicing source */
  llspeaker.GH = 60;		/* gain of aspiration noise source */
  llspeaker.GF = 60;		/* gain of frication noise source */
  llsynth.spkr = llspeaker;
  LLInit(&llsynth, &llspeaker);
  

#endif


#ifdef ASM_FVTM
#else
  noisec = 1499;    /*  "c" coefficient                                    */
  ranmul = 20077;    /*  Magic constant to make next random number          */
  ranadd = 12345;    /*  Magic constant to make next random number          */
#endif
  /********************************************************************/
  /*  Allocate VTM_T thread specific structure and initialize         */
  /********************************************************************/
  // MVP: 03/20/96 All mallocs are replace with callocs to
  // initialize all the elements to Zero.
  if((pVtm_t = (PVTM_T) calloc(1,sizeof(VTM_T))) == NULL)
		return(MMSYSERR_NOMEM);
#ifdef WIN32
  SetEvent(phTTS->hMallocSuccessEvent);
#endif
  /* MVP : Associate VTM Thread specific data handle with current speech object */
  phTTS->pVTMThreadData = pVtm_t;

  /* MVP MI :Although there are same initial values for some of the elements for 
	 both FVTM and VTM,The elements are placed in both #if and #else part to
	 give a provision to set different values later.
  */




#ifdef ASM_FVTM
#else
	pKsd_t->uiCurrentSpeaker          = 0;
	pVtm_t->uiSampleRateChange        = SAMPLE_RATE_INCREASE;
	pVtm_t->rate_scale                = 18063;
	pVtm_t->inv_rate_scale            = 29722;
#endif
	pVtm_t->bEightKHz = FALSE;
	pVtm_t->SampleRate                = 11025.0;
	pVtm_t->uiNumberOfSamplesPerFrame = 71;
	pKsd_t->uiSampleRate              = 11025;
	pKsd_t->SamplePeriod                      = 9.07029478458E-5;
	// tek 28oct98 set the flag that enabled tuner logging off to start
	pVtm_t->bDoTuning = FALSE;

  /********************************************************************/
  /*  Set the initial sample rate of the Vocal Tract Model.           */
  /********************************************************************/

  pKsd_t->last_voice = (short)0;

  /* tek 20nov97*/
  /* init the secondary locks on the pipe..*/
  pKsd_t->bVtmIsReadingPipe = FALSE;
  pKsd_t->bVtmDrainRequested = FALSE;

  SetSampleRate( phTTS, PC_SAMPLE_RATE );
  /********************************************************************/
  /*  Loop and process parameter blocks.                              */
  /********************************************************************/

  for(;;)
  {
	  		/* display debug switch manual once */
	if (pKsd_t->debug_switch == 0x1fff)
	{
		printf("VTM debug switch description:\n");
		printf("1001 -- Overload testing      1002 -- not used\n");
		printf("1004 -- not used              1008 -- not used\n");
		printf("1010 -- not used              1020 -- not used\n");
		printf("1040 -- not used              1080 -- not used\n");
		printf("1100 -- not used              1200 -- not used\n");
		printf("1400 -- not used              1800 -- not used\n");
						
		/* reset to 0 again */
		pKsd_t->debug_switch = 0;
	}

	// tek 18nov97 we may need to adjust PH's priority here; if the
	// input pipe has gone nearly dry, we want to make sure that PH is at least
	// up to our priority
#ifdef TYPING_MODE
	if (pipe_count(pKsd_t->vtm_pipe)<3*VOICE_PARS)
	{
		int iCurrentVTMPriority;
		bRunningOutOfInput = TRUE;
#ifdef VTM_DEBUG // tek find out when the input pipe is going dry..
		{
			char szTemp[256];

			{
				int iPriority = OP_GetThreadPriority(phTTS->hThread_PH);
				sprintf(szTemp,"VTM input pipe is dry at %ld! (PH prio=%d)\n",
					timeGetTime(),iPriority);
				OutputDebugString(szTemp);
			}
		}
#endif //VTM_DEBUG
		// attempt to set PH up to equal our priority; we will have
		// set our (VTM) priority based on how close we are to running
		// out of audio at the bottom of the loop.
		iCurrentVTMPriority = OP_GetThreadPriority(phTTS->hThread_VTM);
		if (iCurrentVTMPriority != THREAD_PRIORITY_ERROR_RETURN)
		{
			OP_SetThreadPriority(phTTS->hThread_PH,iCurrentVTMPriority);
		}
	}
	else // not running out of input
	{
		bRunningOutOfInput = FALSE;
	}
#endif //TYPING_MODE
    // tek 15may97 (moved 20nov97)
	// there is an assumption that the VTM pipe always has a complete
	// packet of some sort in it, and when we come around to this point
	// the control item is at the outlet of the pipe. In order for this to 
	// be true, we have to lock the pipe around any read (because we can't
	// tell how much we need to read until we read the control word). If 
	// EmptyVtmPipe didn't exist, we probably would not have to do this..

	// tek 20nov97 secondary lock on this critical section..
	pKsd_t->bVtmIsReadingPipe = TRUE;
	while (pKsd_t->bVtmDrainRequested)
	{
		// spinlock. This thread defers.
		pKsd_t->bVtmIsReadingPipe = FALSE;
		OP_Sleep(5);	// this need not be really short, because the 
					// pipe willbe empty when we're done anyway/
		pKsd_t->bVtmIsReadingPipe = TRUE;
	}

	EnterCriticalSection(pKsd_t->pcsVtmPipeRead);
	
	read_pipe( pKsd_t->vtm_pipe, &control, 1 );

	/******************************************************************/
	/*  Get the control word. This is the first word of a packet.     */
	/*  There are currently 4 types of packets. Speech packets,       */
	/*  Speaker Definition packets, Sync. packets, and Index Mark     */
	/*  packets.                                                      */
	/******************************************************************/

	switch ( control & SPC_TYPE_MASK) // tek 01aug97 bats 404 subtype support
	{
	/******************************************************************/
	/*  Process a Speech packet.                                      */
	/******************************************************************/

	case SPC_type_voice:
	  
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), VOICE_PARS );
	  /* MGS BATS #409 07/18/97 */
	  LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
	  pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
	  
	  /****************************************************************/
	  /*  If not halting then generate speech samples.                */
	  /****************************************************************/
	  
	  if (( ! pKsd_t->halting ) && ( ! phTTS->bMemoryReset ))
	    {
#ifdef ASM_FVTM
	      /* For FVTM iwave is not necessary to be a thread specific ,can be made local here :MVP */
	      speech_waveform_generator( &(pVtm_t->parambuff[1]), pVtm_t->iwave, &pVtm_t->Fvtm );
#else

#ifdef HLSYN
#ifdef USING_LLSYN
	      speech_waveform_generator(phTTS);
#endif
		  
		  frame.ag = 4.0f;
		   if((float)pVtm_t->parambuff[OUT_AV+1] == 0)
		   {
			   frame.al = 0.0f; 
		   }
		   else
		   {
			   if(frame.al <= 80.0f)
			   frame.al += 20.0f;
		   }
		  //printf("al = %f \n",frame.al);
		  frame.ag = 4.0f;
		  frame.ab = 100.0f;
		  frame.an = 0.0f;
		  frame.ue = 0.0f;
		  frame.f4 = 3500.0f;
		  frame.ps = 8.0f;
		  frame.dc = 10.0f;
		  frame.ap = 0.0f;
		  frame.f0 = pVtm_t->parambuff[OUT_T0+1];
		  frame.f1 = pVtm_t->parambuff[OUT_F1+1];//500.0f;
		  frame.f2 = pVtm_t->parambuff[OUT_F2+1];//1500.0f;
		  frame.f3 = pVtm_t->parambuff[OUT_F3+1];//2500.0f;
		  HLSynthesizeLLFrame(&frame, &oldframe, &speaker,
			&state, &oldstate, &llframe);

/*		  
typedef struct tagLLFrame {
  short NF0;
  short NAV;
  short NOQ;
  short NSQ;
  short NTL;
  short NFL;
  short NDI;
  short NAH;
  short NAF;

  short NF1;
  short NB1;
  short NDF1;
  short NDB1;
  short NF2;
  short NB2;
  short NF3;
  short NB3;
  short NF4;
  short NB4;
  short NF5;
  short NB5;
  short NF6;
  short NB6;

  short NFNP;
  short NBNP;
  short NFNZ;
  short NBNZ;
  short NFTP;
  short NBTP;
  short NFTZ;
  short NBTZ;

  short NA2F;
  short NA3F;
  short NA4F;
  short NA5F;
  short NA6F;
  short NAB;
  short NB2F;
  short NB3F;
  short NB4F;
  short NB5F;
  short NB6F;

  short NANV;
  short NA1V;
  short NA2V;
  short NA3V;
  short NA4V;
  short NATV;
} LLFrame;

#define OUT_AP  0
#define OUT_F1  1
#define OUT_A2  2
#define OUT_A3  3
#define OUT_A4  4
#define OUT_A5  5
#define OUT_A6  6
#define OUT_AB  7
#define OUT_TLT 8
#define OUT_T0  9
#define OUT_AV  10
#define OUT_F2  11
#define OUT_F3  12
#define OUT_FZ  13
#define OUT_B1  14
#define OUT_B2  15
#define OUT_B3  16

*/		  

#ifdef USING_LLSYN

	  llframe.NB1 = pVtm_t->parambuff[OUT_B1+1];
	  llframe.NB2 = pVtm_t->parambuff[OUT_B2+1];
	  llframe.NB3 = pVtm_t->parambuff[OUT_B3+1];
	  //llframe.NOQ = 50;//pVtm_t->parambuff[OUT_OQ+1];
	  llframe.NA2F = pVtm_t->parambuff[OUT_A2+1];
	  llframe.NA3F = pVtm_t->parambuff[OUT_A3+1];
	  llframe.NA4F = pVtm_t->parambuff[OUT_A4+1];
	  llframe.NA5F = pVtm_t->parambuff[OUT_A5+1];
	  llframe.NA6F = pVtm_t->parambuff[OUT_A6+1];
	  if(pVtm_t->parambuff[OUT_AB+1])
		  pVtm_t->parambuff[OUT_AB+1] +=1;

	  llframe.NAB = 0;
	  //pVtm_t->parambuff[OUT_AB+1];
//  	  if(pVtm_t->parambuff[OUT_AV+1])
//		  pVtm_t->parambuff[OUT_AV+1] += 1;
	  
	 // llframe.NAV = pVtm_t->parambuff[OUT_AV+1];
	  if(pVtm_t->parambuff[OUT_AP+1])
		  pVtm_t->parambuff[OUT_AP+1] += 1;
	  llframe.NAH = pVtm_t->parambuff[OUT_AP+1]+10;
	  llframe.NAF = 61;
	  llframe.NTL = pVtm_t->parambuff[OUT_TLT+1];
//	  llframe.NFNZ = pVtm_t->parambuff[OUT_FZ+1];
//	  llframe.NFNP = pVtm_t->parambuff[OUT_FNP+1];
	  llframe.NB2F = pVtm_t->parambuff[OUT_B2+1];
	  llframe.NB3F = pVtm_t->parambuff[OUT_B3+1];
//    llframe.NF0 = pVtm_t->parambuff[OUT_T0+1];
	  printf(" ll %d param %d %d \n",llframe.NF0, pVtm_t->parambuff[OUT_T0+1],llframe.NAV );


  
  
  llframe.NDI=0;

  llframe.NATV=0;
 
	 

		  LLSynthesize(&llsynth, &llframe,pVtm_t->iwave );
		  oldstate = state;
		  oldframe = frame;
#else
//	printf("out_f1,  %d %f %f\n",pVtm_t->parambuff[OUT_F1+1],frame.al,frame.ag); 		  
	//pVtm_t->parambuff[OUT_F1+1] =llframe.NF1;
//	printf(" %d \n",pVtm_t->parambuff[OUT_F1+1]); 

	pVtm_t->parambuff[OUT_F2+1] =llframe.NF2;
	pVtm_t->parambuff[OUT_F3+1] =llframe.NF3;
	if(llframe.NF0 > 0 )
	{
	 printf(" %d \n",llframe.NF0);

	 //pVtm_t->parambuff[OUT_T0+1] =(short) (400000.0/frame.f0);

	//pVtm_t->parambuff[OUT_T0+1] = (short) (400000.0 / pVtm_t->parambuff[OUT_T0+1]);

	}

	//pVtm_t->parambuff[OUT_AV+1] =llframe.NAV;


    speech_waveform_generator(phTTS);

#endif //using_llsyn
#else //hlsyn

		speech_waveform_generator(phTTS);

#endif //hlsyn


#endif //ASM_FVTM
	      
	      OutputData( phTTS,
			  pVtm_t->iwave,
			  pVtm_t->uiNumberOfSamplesPerFrame,
			  (DWORD)pVtm_t->parambuff[OUT_PH+1],
			  (DWORD)pVtm_t->parambuff[OUT_DU+1] );
#ifdef TYPING_MODE
	      phTTS->wTypingFrameCount++;
#ifdef VTM_DEBUG
	      {
		char  szTemp[256]="";
		sprintf(szTemp,"vtmiont: TFC=%d h=%d at %lu\n",
			phTTS->wTypingFrameCount, 
			pKsd_t->halting,
			timeGetTime());
		OutputDebugString(szTemp);
	      }
#endif //VTM_DEBUG
	      // tek drop back PH's priority after we've queued some audio..
	      // note that this always happens, whether or not we are in 
	      // typing mode; having PH runnin at "normal" priority is important
	      // in maintaining highlighting performance when large text buffers
	      // are being synthesized.
	      // tek 18nov97 no longer do this, in general. If we're not
	      // synthesizing to a device, this is safe; if we're synthesizing
	      // to a device, however, we want to manage priority based on 
	      // how much we have in the output buffer.
	      // ** again, note that this is all only for DAPI; SAPI
	      // never sets TYPING_MODE, and if it does then this won't
	      // even compile. Oh, heck. Just to be sure, conditionalize
	      // the really important stuff on OLEDECTALK too..
#ifdef OLEDECTALK
	      if (phTTS->wTypingFrameCount == MIN_TYPING_FRAMES)
		OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_NORMAL);
#else // OLEDECTALK
	      if (phTTS->dwOutputState != STATE_OUTPUT_AUDIO)
		{
		  if (phTTS->wTypingFrameCount == MIN_TYPING_FRAMES)
		    OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_NORMAL);
		}
	      else  // tek 18nov97..
		{
		  // check the status of the output buffer every 16th
		  // packet, whether we are in typing mode at the time or
		  // not. Based on the number of samples outstanding, 
		  // adjust the VTM thread's priority. In fact, we
		  // probably need to check on the PH thread too, just
		  // to make sure we'll have something to do next time..
		  // use the ==1 construct to make sure that we bop up
		  // to high priority on the very first packet.
		  if (   (bRunningOutOfInput)
			 || ((phTTS->wTypingFrameCount&0xF) == 1) 
			 )
		    {
		      
		      int iThreadPriority;
		      int iPHThreadPriority;
		      int	iNewPriority=0;
		      int iSamplesOutstanding = 
			(HPLAY_AUDIO_T)(phTTS->pAudioHandle)->iSamplesWaitingForCompletion;
		      iThreadPriority = OP_GetThreadPriority(phTTS->hThread_VTM);
		      iPHThreadPriority = OP_GetThreadPriority(phTTS->hThread_PH);
#ifdef VTM_DEBUG
		      {
			char szTemp[256];
			sprintf(szTemp,"VTMIO: %d samples waiting, VTM prio now %d, PH prio now %d\n",
				iSamplesOutstanding, iThreadPriority,iPHThreadPriority);
			OutputDebugString(szTemp);
		      }
#endif //VTM_DEBUG
		      
		      if (iSamplesOutstanding < BUFFER_LENGTH_RED)
			{
			  iNewPriority = THREAD_PRIORITY_HIGHEST;
			}
		      else if (iSamplesOutstanding < BUFFER_LENGTH_YELLOW)
			{
			  iNewPriority = THREAD_PRIORITY_ABOVE_NORMAL;
			}
		      else
			{
			  iNewPriority = THREAD_PRIORITY_NORMAL;
			}
		      if (  (iThreadPriority != THREAD_PRIORITY_ERROR_RETURN)
			    &&(iThreadPriority != iNewPriority)
			    )
			{
#ifdef VTM_DEBUG
			  {
			    char szTemp[256];
			    sprintf(szTemp,"VTMIO: setting VTM priority to %d\n",
				    iNewPriority);
			    OutputDebugString(szTemp);
			  }
#endif //VTM_DEBUG
			  OP_SetThreadPriority(phTTS->hThread_VTM,iNewPriority);
			  // also set PH back down as well; if need be, it will be
			  // jacked back up at the top of the loop.
			  OP_SetThreadPriority(phTTS->hThread_PH, BASE_PH_PRIORITY);
			  }
		      
		      
		    }
		  // tek 09may97 if we're in typing mode, start audio.
		  // tek 06nov97 dont DoSync if we're halting.
		  // tek 19nov97 changed to be a power of two so the frame count
		  //             can free-run..
		  if (/*phTTS->bInTypingMode &&*/( ! pKsd_t->halting ) 
		      && ((phTTS->wTypingFrameCount & MIN_TYPING_FRAMES) == MIN_TYPING_FRAMES))
		    {
		      PA_DoSync(phTTS->pAudioHandle);
				// let something else happen?
				// tek 19nov97 don't sleep anymore. We may have left PH at
				// high priority, and it will churn along if it has work to 
				// do.. it will get to catch up later, when we drop priority.
				//OP_Sleep(TYPING_QUEUE_SLEEP_TIME);
				// tek 19nov97 don't reset this.
				//phTTS->wTypingFrameCount = 0;
		    }
		}
#endif //OLEDECTALK tek 18nov97
#endif //TYPING_MODE
	    }
	  else
	    {
	      /**************************************************************/
	      /*  If halting then discard all packet data from the pipes.   */
	      /*  Maximize the queued sample count to release function      */
	      /*  WaitForAudioSampleToPlay() (in file sync.c). This is also */
	      /*  done in function TextToSpeechReset() but should also be   */
	      /*  done here as the halting flag may be set just before the  */
	      /*  queued sample count is incremented (The queued sample     */
	      /*  count is incremented in the OutputData() function).       */
	      /**************************************************************/
	      
	      EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	      phTTS->dwQueuedSampleCount = 4294967295;
	      LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
	    }
	  
	  break;
	  
	  /******************************************************************/
	  /*  Process a Tone packet.                                        */
	  /******************************************************************/
	  
	case SPC_type_tone:
	  
	  /****************************************************************/
	  /*  The packet format here is different than the DTC07. The     */
	  /*  ramp duration has been eliminated. The tone generation      */
	  /*  software automatically provides 3 msec. cosine squared      */
	  /*  tapering for the tone pulse rise and fall time.             */
	  /*                                                              */
	  /*  Packet Index     Packet Data                 Value          */
	  /*                                                              */
	  /*      0            Command Word              SPC_type_tone    */
	  /*      1            Tone Duration (msec.)     0 to ?           */
	  /*      2            Tone 0 Frequency          0 to Fs/2        */
	  /*      3            Tone 0 Amplitude          0 to 32767       */
	  /*      4            Tone 1 Frequency          0 to Fs/2        */
	  /*      5            Tone 1 Amplitude          0 to 32767       */
	  /*                                                              */
	  /****************************************************************/

	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), TONE_PARS );
	  /* MGS BATS #409 07/18/97 */
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock

	  /****************************************************************/
	  /*  If not halting then generate tone samples.                  */
	  /****************************************************************/

	  if ( ! pKsd_t->halting )
	  {                                                         /*The elements of pVtm_t are used ,not been modified in
									  PlayTones() function MVP MI*/                         
	if ( PlayTones( phTTS,
			(double)(pVtm_t->parambuff[1]),
			(double)pVtm_t->parambuff[2],
			(double)pVtm_t->parambuff[3],
			(double)pVtm_t->parambuff[4],
			(double)pVtm_t->parambuff[5],
			pVtm_t->SampleRate))
	{
	  TextToSpeechErrorHandler( phTTS,
					(WPARAM)0,
					(LPARAM)MMSYSERR_NOMEM );
	}
	  }
	  else
	  {
	/**************************************************************/
	/*  If halting then discard all packet data from the pipes.   */
	/*  Maximize the queued sample count to release function      */
	/*  WaitForAudioSampleToPlay() (in file sync.c). This is also */
	/*  done in function TextToSpeechReset() but should also be   */
	/*  done here as the halting flag may be set just before the  */
	/*  queued sample count is incremented (The queued sample     */
	/*  count is incremented in the OutputData() function).       */
	/**************************************************************/

	EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	phTTS->dwQueuedSampleCount = 4294967295;
	LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
	  }

	  break;

	/******************************************************************/
	/*  Process a Speaker Definition packet.                          */
	/******************************************************************/

	case SPC_type_speaker:
	  // tek 14may97
	  // always init the VTM when we see a speakerdef!
	  InitializeVTM(phTTS);
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), SPDEF_PARS );
	  /* MGS BATS #409 07/18/97 */
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock

#ifdef ASM_FVTM
	  pKsd_t->uiCurrentSpeaker = read_speaker_definition( &(pVtm_t->parambuff[1]), &pVtm_t->Fvtm );
#else
	  read_speaker_definition(phTTS);
#endif
#ifdef HLSYN
  LLInit(&llsynth, &llspeaker);

  

  InitializeHLSynthesizer(&oldframe, &speaker, &oldstate, MALE);
#endif
	  break;

	/******************************************************************/
	/*  Process a Sync. packet.                                       */
	/******************************************************************/

	case SPC_type_sync:
	  /* MGS BATS #409 07/18/97 */
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock

	  if ( ! pKsd_t->halting )
	  {
	switch ( phTTS->dwOutputState )
	{
	/**************************************************************/
	/*  Send the SPC_type_Sync command value, and the last queued */
	/*  sample number to the SYNC thread.                         */
	/**************************************************************/

	case STATE_OUTPUT_AUDIO:
#ifdef TYPING_MODE
	  // a sync always resets the typing startup frame count..
	  phTTS->wTypingFrameCount=0;

	  if (phTTS->bInTypingMode)
		{
			// don't send the sync to the sync thread; just
			// set the event from here (at most, a sync in 
			// typing mode is used to make sure things got forced
			// out to this point, not to determine when something
			// gets played.

	    SetEvent( phTTS->hSyncEvent );
		// tek 24oct97 bats 505: send the last of the audio to the driver.
		PA_DoSync(phTTS->pAudioHandle);
		// end of bats 505.
		
		}
	  else
	  {
#endif //TYPING_MODE
#ifdef OLEDECTALK
		  // tek 28sep98 we have to set the sync event here, because
		  // otherwise we'll sit forever. 		  
	    SetEvent( phTTS->hSyncEvent );
#endif //OLEDECTALK

	  dwSyncParams[0] = SPC_type_sync;

	  EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	  dwSyncParams[1] = phTTS->dwQueuedSampleCount;
	  LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
	  write_pipe( pKsd_t->sync_pipe, dwSyncParams, 2 );
#ifdef TYPING_MODE
	  }
#endif //TYPING_MODE

	  break;

	/**************************************************************/
	/*  process the sync immediately.                             */
	/**************************************************************/

	case STATE_OUTPUT_MEMORY:
	case STATE_OUTPUT_WAVE_FILE:
	case STATE_OUTPUT_LOG_FILE:
	case STATE_OUTPUT_NULL:

	  SetEvent( phTTS->hSyncEvent );

	  break;

	default:

	  SetEvent( phTTS->hSyncEvent );

	  break;
	}
	  }
	  break;

	/******************************************************************/
	/*  Process an Index Mark packet.                                 */
	/******************************************************************/

	case SPC_type_index:

	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[0]), INDEX_PARS );
	  /* MGS BATS #409 07/18/97 */
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock

	  if ( ! pKsd_t->halting )
	  {
	dwSyncParams[0] = control; //tek 01aug97 bats 404 keep the original packet type

	dwSyncParams[1] = (DWORD)pVtm_t->parambuff[0];
	dwSyncParams[2] = (DWORD)pVtm_t->parambuff[1];

	EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	dwSampleNumber = phTTS->dwQueuedSampleCount;
	LeaveCriticalSection( phTTS->pcsQueuedSampleCount );

	// tek 04aug97 sapi fixes
	// if this is SAPI, and we're processing a start/stop/bookmark/wordpos,
	// we need to build the MARK_DATA structure here and pass it along;
	// if we wait until the sync thread, the timestamps get out of date.
	// in order to keep ourselves sane, we'll overwrite the
	// sample number with the pointer to the structure rather than not
	// doing the fill-in above; this makes the code much easier to
	// understand in the presence of ifdefs..
#ifdef OLEDECTALK
	switch(control)
	{
	case (SPC_type_index|SPC_subtype_bookmark):
	case (SPC_type_index|SPC_subtype_wordpos):
	case (SPC_type_index|SPC_subtype_start):
	case (SPC_type_index|SPC_subtype_stop):
		pMarkData = NULL;	// just for safety
							// the sync thread will toss
							// these packets with null ptrs
							// which is about the only way 
							// we can handle a malloc fail..
		pMarkData = malloc(sizeof(MARK_DATA));
		if (pMarkData)
		{
		  // fill it in..
		  QWORD qwTemp;
		  PA_GetQWPosition(phTTS->pAudioHandle,&qwTemp);
		  pMarkData->qTimeStamp = qwTemp;
		  // glue together the two halves of the index value..
		  pMarkData->dwMarkValue  =  (LPARAM)( (dwSyncParams[1]<<16) | (dwSyncParams[2]&0xFFFF));
		  pMarkData->dwMarkType = control;
#ifdef VTM_DEBUG  //tek15aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"vtmiont mark adr:%08lx Val:%08lx typ:%08lx samp:%lu at %lu\n",
					pMarkData,
					pMarkData->dwMarkValue,
					pMarkData->dwMarkType,
					(DWORD) qwTemp,
					timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //VTM_DEBUG

		}

 		// finally, send the pointer to this struct off to 
		// be processed..
		dwSampleNumber = (DWORD)(pMarkData);
 		break;

	default:
		// just leave it alone.
		break;
	}

#endif //OLEDECTALK

	switch ( phTTS->dwOutputState )
	{
	/**************************************************************/
	/*  Send the SPC_type_index command value, the index mark     */
	/*  value, and the last queued sample number to the SYNC      */
	/*  thread.                                                   */
	/**************************************************************/

	case STATE_OUTPUT_AUDIO:

	  dwSyncParams[3] = dwSampleNumber;
#ifdef USE_BOOKMARKS_FOR_SYNC // tek we have to rewrite queuing to use this.
#ifdef VTM_DEBUG
	  {
		  char szTemp[256];
		  sprintf(szTemp,"VTM index type %04x for sample %ld at %ld\n",
			  (int)control, dwSampleNumber, timeGetTime());
		  OutputDebugString(szTemp);
	  }
#endif //VTM_DEBUG

	  // if this is a WordPos or a BookMark, try to set a destination
	  if (  (control ==  (SPC_type_index	| SPC_subtype_bookmark))
		  ||(control ==  (SPC_type_index	| SPC_subtype_wordpos))
		  ||(control ==  (SPC_type_index	| SPC_subtype_start))
		  ||(control ==  (SPC_type_index	| SPC_subtype_stop))
		 )
	  {
		  // bookmark.. if that fails, dro pback to the sync_pipe method.
		  if (!PA_SetBookmark(phTTS->pAudioHandle,(DWORD)pMarkData))
		  {
			  // mananged to set a bookmark.
#ifdef VTM_DEBUG  //tek15aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"AudioDest BookMark %08lx set at %lu\n",
					pMarkData,timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //VTM_DEBUG
		  }
		  else 
		  {
#ifdef VTM_DEBUG  //tek15aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"AudioDest BookMark %08lx failed at %lu, using sync_pipe\n",
					pMarkData,timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //VTM_DEBUG
	  write_pipe( pKsd_t->sync_pipe, dwSyncParams, 4 );
		  }
	  }
	  else
	  {
		  // this is one that we don't use bookmarks for.
#ifdef VTM_DEBUG
		  {
			  char szTemp[256];
			  sprintf(szTemp,"Using sync_pipe for notification type %04lx\n",
				  control);
			  OutputDebugString(szTemp);
		  }
#endif //VTM_DEBUG
		 write_pipe( pKsd_t->sync_pipe, dwSyncParams, 4 );
	  }
#else //USE_BOOKMARKS..
	  write_pipe( pKsd_t->sync_pipe, dwSyncParams, 4 );
#endif //USE_BOOKMARKS..
	  break;

	/**************************************************************/
	/*  Return the index mark in the memory buffer.               */
	/**************************************************************/

	case STATE_OUTPUT_MEMORY:

	  PutIndexMarkInBuffer( phTTS,
				dwSyncParams[1],
				dwSampleNumber );
	  break;

	/**************************************************************/
	/*  Return the index mark immediately.                        */
	/**************************************************************/

	case STATE_OUTPUT_WAVE_FILE:
	case STATE_OUTPUT_LOG_FILE:
	case STATE_OUTPUT_NULL:

	  if ( ! pKsd_t->halting )
		/*
		SendMessage( phTTS->hWnd,
			 phTTS->uiID_Index_Message,
			 (WPARAM)dwSyncParams[2],
			 (LPARAM)dwSyncParams[1] );
		*/
		//MVP: Replaced above SendMessage with Report_TTS_status :New Audio code:
		Report_TTS_Status(phTTS,phTTS->uiID_Index_Message,(WPARAM)dwSyncParams[2],(LPARAM)dwSyncParams[1]);

	  break;

	default:
	  break;
	}
	  }
		  break;

	/******************************************************************/
	/*  Process a Force command.                                      */
	/******************************************************************/

	case SPC_type_force:
	  /* MGS BATS #409 07/18/97 */
    LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock

	  if (( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
	&& ( ! pKsd_t->halting ))
	  {
	SendBuffer( phTTS );
	  }
	  break;

	default:
	  /* MGS BATS #409 07/18/97 */
    LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
	break;
	}
	  /* MGS BATS #409 07/18/97 */
//    LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);

	/******************************************************************/
	/*  Fix reset hang problem. WIH 3/28/95.                          */
	/******************************************************************/

	if ( (phTTS->bMemoryReset) && (phTTS->pTTS_Buffer != NULL) )
	{
	  SendBuffer( phTTS );
	}
  }

  /* Free the VTM thread specific data handle */
  if(pVtm_t)
	free(pVtm_t);
  phTTS->pVTMThreadData = pVtm_t = NULL;                

  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OutputData                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: June 25, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function directs the audio output to the source determined */
/*    by the dwOutputState element of the Text-To-Speech handle.      */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS                A handle of type TTS_HANDLE_T.             */
/*                                                                    */
/*    pBuffer              A pointer to a buffer of type short that   */
/*                         contains the audio samples to output.      */
/*                                                                    */
/*    uiSamplesToOutput    The number of 16 bit audio samples that    */
/*                         pointed to by pBuffer.                     */
/*                                                                    */
/*    dwPhoneme            A DWORD that contains the phoneme          */
/*                         identifier.                                */
/*                                                                    */
/*    dwDuration           The duration of the phoneme in frames.     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function does not return a value.                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OutputData( LPTTS_HANDLE_T phTTS,
		 short * pBuffer,
		 unsigned int uiSamplesToOutput,
		 DWORD dwPhoneme,
		 DWORD dwDuration )
{
  DWORD dwSampleNumber;
  MMRESULT mmStatus;
  /* MVP MI Added PKSD_T element */
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PVTM_T pVtm_t = phTTS->pVTMThreadData; // tek 08jan98 we now need this.


  // tek 20aug98
  // if we're doing a TTS_SILENT ConvertToPhonemes, just drop this on the
  // floor
  if (phTTS->dwPhonemeCvtFlags & TTS_SILENT)
	  return;

  /********************************************************************/
  /*  Output the audio samples to the appropriate place.              */
  /********************************************************************/

  switch ( phTTS->dwOutputState )
  {
  /********************************************************************/
  /*  Queue the audio samples to the wave output device.              */
  /********************************************************************/

  case STATE_OUTPUT_AUDIO:
#ifdef VTM_DEBUG
	if ( dwPhoneme != pKsd_t->dwLastPhoneme )
	  {
		  char szTemp[256]="";
		  sprintf(szTemp,"vtm: pho:%08lx dur:%ld.\n",dwPhoneme,dwDuration);
		  OutputDebugString(szTemp);
	  }
#endif //VTM_DEBUG

// tek 07jan98 this now exists for DAPI too (bats 546)
	if ( dwPhoneme != pKsd_t->dwLastPhoneme )
	  {
	    // tek 08jan98 minor nit; this needs to be in milliseconds,
	    // not frames. 
	    dwDuration = 
	      ( 1000* dwDuration * pVtm_t->uiNumberOfSamplesPerFrame) 
	      / pKsd_t->uiSampleRate;
		/* fixed bug uncovered by removing the debug window for release builds MGS */
		if (dwPhoneme==32767) // Should be TONE_SYMBOL
		{
			SendVisualNotification(phTTS, 0, dwDuration);
		}
		else
		{
			SendVisualNotification(phTTS, dwPhoneme, dwDuration);
		}
	  } // if new phoneme
	
	// tek 13oct98 let the audio system know if we're done
	if (pipe_count( pKsd_t->vtm_pipe ) > 0)
	  {
#ifdef VTM_DEBUG
	    OutputDebugString("VTMIONT : setting PipesNotEmpty to: TRUE \n");
#endif
	    phTTS->pAudioHandle->bPipesNotEmpty = TRUE;
	  }
	else
	  {
#ifdef VTM_DEBUG
	    OutputDebugString("VTMIONT : setting PipesNotEmpty to: FALSE \n");
#endif
	    phTTS->pAudioHandle->bPipesNotEmpty = FALSE;
	  }
		
	PA_Queue( phTTS->pAudioHandle,
		  (LPAUDIO_T)pBuffer,
		  uiSamplesToOutput << 1 );
	
	EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	// tek 19mar98 bats 608/608/620
	// once again the schizophrenia about samples vs bytes comes back
	// to haunt us.. for DAPI this can fester a while longer, but for
	// SAPI we need to be careful..
#ifdef OLEDECTALK
	if (phTTS->pAudioHandle->bAudioIsEightBit)
	{
		phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput; 
	}
	else
	{
		phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput << 1; 
	}
#else //OLEDECTALK
	phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput << 1; 
#endif //OLEDECTALK
	LeaveCriticalSection( phTTS->pcsQueuedSampleCount );

	break;

  /********************************************************************/
  /*  Queue the audio samples to shared memory.                       */
  /********************************************************************/

  case STATE_OUTPUT_MEMORY:

	// tek 19aug96 Don't try to queue if we're in the middle
	// of a reset.
	if (!phTTS->bMemoryReset)
	{
		QueueToMemory( phTTS,
		   pBuffer,
		   uiSamplesToOutput );

		EnterCriticalSection( phTTS->pcsQueuedSampleCount );
		dwSampleNumber = phTTS->dwQueuedSampleCount;
		phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput;
		LeaveCriticalSection( phTTS->pcsQueuedSampleCount );

	/****************************************************************/
	/*  If the phoneme is new then put the new phoneme and the new  */
	/*  phonemes duration into the output structure.                */
	/****************************************************************/

		if ( dwPhoneme != pKsd_t->dwLastPhoneme )
		{
			pKsd_t->dwLastPhoneme = dwPhoneme;

			PutPhonemeInBuffer( phTTS,
			  dwPhoneme,
			  dwDuration,
			  dwSampleNumber );
		}
	}
	break;

  /********************************************************************/
  /*  Queue the audio samples to a wave file.                         */
  /********************************************************************/

  case STATE_OUTPUT_WAVE_FILE:

	mmStatus = WriteAudioToFile( phTTS,
				 pBuffer,
				 uiSamplesToOutput );

	if ( mmStatus )
	  TextToSpeechErrorHandler( phTTS,
				(WPARAM)ERROR_WRITING_FILE,
				(LPARAM)mmStatus );

	EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput;
	LeaveCriticalSection( phTTS->pcsQueuedSampleCount );

	break;

  /********************************************************************/
  /*  Discard the audio samples.                                      */
  /********************************************************************/

  case STATE_OUTPUT_LOG_FILE:

	break;

  /********************************************************************/
  /*  Discard the audio samples.                                      */
  /********************************************************************/

  case STATE_OUTPUT_NULL:

	break;

  /********************************************************************/
  /*  Discard the audio samples.                                      */
  /********************************************************************/

  default:

	break;
  }

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: EmptyVtmPipe                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: July 24, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function is called from the vtm thread to empty the VTM    */
/*    pipe.                                                           */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void EmptyVtmPipe(PKSD_T pKsd_t)
{
  unsigned int uiCount;
  S16 wControl;
  S16 parambuff[128];
#ifdef VTM_DEBUG
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"vtmiont: EmptyVtmPipe at %lu\n",
			  timeGetTime());
		  OutputDebugString(szTemp);
  }
#endif //VTM_DEBUG

  // tek 20nov97 take the secondary interlock..
  pKsd_t->bVtmDrainRequested = TRUE;
  // make sure the other guy doesn't have it..
  // the other thread defers.
  while (pKsd_t->bVtmIsReadingPipe)
  {
	  if (pipe_count( pKsd_t->vtm_pipe ) == 0)
		  break;
	  OP_Sleep(1);
  }

  if (  !(pKsd_t->bVtmIsReadingPipe)
	  &&(pipe_count( pKsd_t->vtm_pipe ))
	  )
  {
  
	  // we have to do this under a critical section because we need to read
	  // bits of vtm packets atomically (otherwise the other reader, the VTM
	  // thread, can sneak in and then we're hosed because the control word
	  // gets separated from the packet..)

	  // critical section is probably not the right way to do this..
	  // seems prone to deadlocks. We need primary/secondary locks..
	  // but for now..
	  EnterCriticalSection(pKsd_t->pcsVtmPipeRead);
	  // now we know that we're the only reader, so 
	  // our packets will be intact AND the pipe count will only
	  // be decremented by US.
	  uiCount = pipe_count( pKsd_t->vtm_pipe );

	  while ( uiCount )
	  {
		read_pipe( pKsd_t->vtm_pipe, &wControl, 1 );

		uiCount = uiCount - 1;

		/******************************************************************/
		/*  Get the control word. This is the first word of a packet.     */
		/*  There are currently 4 types of packets. Speech packets,       */
		/*  Speaker Definition packets, Sync. packets, and Index Mark     */
		/*  packets.                                                      */
		/******************************************************************/

		switch ( wControl & SPC_TYPE_MASK) //tek 01aug97 subtype support
		{
		case SPC_type_voice:

		  read_pipe( pKsd_t->vtm_pipe, &parambuff[1], VOICE_PARS );

		  uiCount = uiCount - VOICE_PARS;

		  break;

		case SPC_type_tone:

		  read_pipe( pKsd_t->vtm_pipe, &parambuff[1], TONE_PARS );

		  uiCount = uiCount - TONE_PARS;

		  break;

		case SPC_type_speaker:

		  read_pipe( pKsd_t->vtm_pipe, &parambuff[1], SPDEF_PARS );

		  uiCount = uiCount - SPDEF_PARS;

		  break;

		/******************************************************************/
		/*  Process a Sync. packet.                                       */
		/******************************************************************/

		case SPC_type_sync:

		  break;

		/******************************************************************/
		/*  Process an Index Mark packet.                                 */
		/******************************************************************/

		case SPC_type_index:

		  read_pipe( pKsd_t->vtm_pipe, &parambuff[0], INDEX_PARS );

		  uiCount = uiCount - INDEX_PARS;

		  break;

		case SPC_type_force:

		  break;

		default:
		  break;
		}
	  }
	  // free up the pipe for general use..
	  LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
  }
  // tek 20nov97 free secondary interlock
  pKsd_t->bVtmDrainRequested = FALSE;
  return;
}


/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/**********************************************************************/
/**********************************************************************/
#ifdef ASM_FVTM

void SetSampleRate( LPTTS_HANDLE_T phTTS,unsigned int uiSampRate )
{
  /********************************************************************/
  /*  Calculate the model sample dependant parameters.                */
  /********************************************************************/
  PVTM_T pVtm_t = phTTS->pVTMThreadData;
  PKSD_T pKsd_t = phTTS->pKernelShareData;

  pVtm_t->uiNumberOfSamplesPerFrame = set_fvtm_sample_rate( uiSampRate, &pVtm_t->Fvtm );

  pKsd_t->uiSampleRate = uiSampRate;
  pVtm_t->SampleRate = (double)pKsd_t->uiSampleRate;
  pKsd_t->SamplePeriod = 1.0 / pVtm_t->SampleRate;

  /********************************************************************/
  /*  Update the speaker definition for the new sample rate.          */
  /********************************************************************/
  pKsd_t->async_voice = pKsd_t->last_voice;
  pKsd_t->async_change |= ASYNC_voice;
}

/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/**********************************************************************/
/**********************************************************************/

void InitializeVTM(LPTTS_HANDLE_T phTTS)
{
  PVTM_T pVtm_t = phTTS->pVTMThreadData;        
  initialize_fvtm( &(pVtm_t->Fvtm));

  return;
}

#endif

// tek 07jan97 this now exists for DAPi too (bats 546)
// tek 27aug97 routine to handle sending the visual marks..
// tek 20feb98 two different variants depending on whether we're using bookmark timing.

#ifndef USE_BOOKMARKS_FOR_SYNC

void SendVisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration)
{
	PVISUAL_DATA pvdPacket = NULL;
	QWORD qwTemp=0;  // for DAPI only the low DWORD is used, so init it.
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	// tek 07jan98 bats 546
	// DAPI only needs (or understands) DWORD time; it also needs to know
	// what sample was just queued and NOT what just played. (GetQWPosition
	// does this for the SAPI case) 
#ifdef OLEDECTALK
	PA_GetQWPosition(phTTS->pAudioHandle,&qwTemp);
#else
	EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	qwTemp = phTTS->dwQueuedSampleCount;
	LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
	//PA_GetPosition(phTTS->pAudioHandle,&qwTemp,FALSE);
#endif //OLEDECTLK
	pKsd_t->dwLastPhoneme = dwPhoneme;
	// allocate a packet to hold the visual info..
	pvdPacket = (PVISUAL_DATA)malloc(sizeof(VISUAL_DATA));
	if (pvdPacket) // just punt if the malloc failed
	{
		pvdPacket->dwPhoneme = dwPhoneme;
		pvdPacket->dwDuration = dwDuration;
		pvdPacket->qTimeStamp = qwTemp;
		pvdPacket->dwHints = NULL;
		pvdPacket->cEnginePhoneme = pKsd_t->ascky[dwPhoneme];
		if (pvdPacket->cEnginePhoneme == 0)
		{
			// this should never happen if the ascky table is fully defined..
			
		}
		
#ifdef VTM_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"SendVisualNotification: pho:%02lx (%08lx) [%c], dur:%04ld, samp:%08lxx TFC:%ld. at %lu\n",
				(DWORD)pvdPacket->cEnginePhoneme,
				dwPhoneme, 
				pvdPacket->cEnginePhoneme,
				dwDuration,
				(DWORD)pvdPacket->qTimeStamp,
				timeGetTime());
			ODSFlush();
			OutputDebugString(szTemp);
			ODSFlush();
		}
		
#endif //VTM_DEBUG
	}
#ifdef VTM_DEBUG
	else
	{
		OutputDebugString("SendVisualNotification: pvdPacket allocate failed.\n");
	}
#endif //VTM_DEBUG
	
	
	// now send the packet off to sync..
	if (pvdPacket)
	{
		DWORD dwSyncParams[4];
		dwSyncParams[0]=SPC_type_visual;
		dwSyncParams[1]=0;
		dwSyncParams[2]=0;
		dwSyncParams[3]=(DWORD)pvdPacket;
		write_pipe(pKsd_t->sync_pipe, dwSyncParams,4);
		
	}
	
} // 

#else //USE_BOOKMARKS_FOR_SYNC
// the audio bookmark version
void SendVisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration)
{	PVISUAL_DATA pvdPacket = NULL;
	PMARK_DATA pMarkData = NULL;
	QWORD qwTemp=0;  // for DAPI only the low DWORD is used, so init it.
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	// tek 07jan98 bats 546
	// DAPI only needs (or understands) DWORD time; it also needs to know
	// what sample was just queued and NOT what just played. (GetQWPosition
	// does this for the SAPI case) 
#ifdef OLEDECTALK
	PA_GetQWPosition(phTTS->pAudioHandle,&qwTemp);
#else
	EnterCriticalSection( phTTS->pcsQueuedSampleCount );
	qwTemp = phTTS->dwQueuedSampleCount;
	LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
	//PA_GetPosition(phTTS->pAudioHandle,&qwTemp,FALSE);
#endif //OLEDECTLK
	pKsd_t->dwLastPhoneme = dwPhoneme;
	// allocate a packet to hold the visual info..
	pvdPacket = (PVISUAL_DATA)malloc(sizeof(VISUAL_DATA));
	if (pvdPacket) // just punt if the malloc failed
	{
		pvdPacket->dwPhoneme = dwPhoneme;
		pvdPacket->dwDuration = dwDuration;
		pvdPacket->qTimeStamp = qwTemp;
		pvdPacket->dwHints = NULL;
		pvdPacket->cEnginePhoneme = pKsd_t->ascky[dwPhoneme];
		if (pvdPacket->cEnginePhoneme == 0)
		{
			// this should never happen if the ascky table is fully defined..
			
		}
		
#ifdef VTM_DEBUG
		{
			char szTemp[256]="";
			sprintf(szTemp,"SendVisualNotification (BM): pho:%02lx (%08lx) [%c], dur:%04ld, samp:%08lxx TFC:%ld. at %lu\n",
				(DWORD)pvdPacket->cEnginePhoneme,
				dwPhoneme, 
				pvdPacket->cEnginePhoneme,
				dwDuration,
				(DWORD)pvdPacket->qTimeStamp,
				timeGetTime());
			ODSFlush();
			OutputDebugString(szTemp);
			ODSFlush();
		}
		
#endif //VTM_DEBUG
	}
#ifdef VTM_DEBUG
	else
	{
		OutputDebugString("SendVisualNotification: pvdPacket allocate failed.\n");
	}
#endif //VTM_DEBUG
	
	
	// now send the packet off to sync..
	if (pvdPacket)
	{
		// allocate a MARK_DATA to send this through the bookmark path..
		pMarkData = malloc(sizeof(MARK_DATA));
		if (pMarkData)
		{
		  pMarkData->qTimeStamp = qwTemp;
		  // glue together the two halves of the index value..
		  pMarkData->dwMarkValue  =  (LPARAM)pvdPacket;
		  pMarkData->dwMarkType = SPC_type_visual;
 #ifdef VTM_DEBUG  //tek15aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"visual mark adr:%08lx Val:%08lx typ:%08lx samp:%lu at %lu\n",
					pMarkData,
					pMarkData->dwMarkValue,
					pMarkData->dwMarkType,
					(DWORD) qwTemp,
					timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //VTM_DEBUG
		  if (!PA_SetBookmark(phTTS->pAudioHandle, (DWORD)pMarkData))
		  {

			  // that's what was supposed to happen
		  }
		  else
		  {
			  DWORD dwSyncParams[4];
			  dwSyncParams[0]=SPC_type_visual;
			  dwSyncParams[1]=0;
			  dwSyncParams[2]=0;
			  dwSyncParams[3]=(DWORD)pvdPacket;
			  write_pipe(pKsd_t->sync_pipe, dwSyncParams,4);
			  
			  // free the allocs if the bookmark failed
			  free(pMarkData);
			  //free(pvdPacket);
		  }
		} // if pMarkData
		else
		{
			free (pvdPacket); // just punt if the mark-data alloc failed
		}
	} // if (pvdPacket)
}
#endif //USE_BOOKMARKS_FOR_SYNC


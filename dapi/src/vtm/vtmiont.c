/* ****************************************************************************
 *                                                 
 *  DECtalk Vocal Tract Model I/O for Windows/NT
 *                                              
 * Copyright © 2002 Fonix Corporation. All rights reserved.
 * Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
 * Copyright (c) 1993-1998 Digital Equipment Corporation
 * 
 * This is an unpublished work, and is confidential and proprietary: 
 * technology and information of Fonix corporation.  No part of this
 * code may be reproduced, used or disclosed without written consent of 
 * Fonix corporation in each and every instance.
 *
 * *****************************************************************************
 *      ASYNCHRONOUS ERROR MESSAGES.                                  	
 *                                                                    	
 *         This thread may send error messages to the window         	
 *    procedure specified by the window handle passed in function     	
 *    TextToSpeechStartup(). The application may wish to handle these 	
 *    messages. One of the error codes listed below will be contained 	
 *    in the wParam field of the message. The lParam field of the     	
 *    message will contain a value of type MMRESULT. An application   	
 *    may use function waveOutGetErrorText() to obtain a text string  	
 *    corresponding to the MMRESULT (lParam) error code.              	
 *                                                                    	
 *        wParam error code                                           	
 *                                                                    	
 *      ERROR_WRITING_FILE                                            	
 * ******************************************************************************
 * edit history:
 *
 *  Rev	Date		Who		Description
 *  --- --------	---		----------------- 
 *  01	16Jan97		GL		Merge the change in V4.3 code into V4.4   			
 *  02	09jun97		tek		typing changes
 *  03	18Jul97		MGS		BATS 409, Corrected improper use of
 *							Critical Sections in vtm_main
 *		24oct97		tek		bats505 force final samples out           
 *		12nov97		tek		bats508: don't DoSync if halting.
 *  03	01aug97		tek		bats404: new index packet types           
 *							(also add bats 405/409 "Critical Section")
 *                          actually merged 13nov97                   
 *  04	19nov97		tek		let VTM manage PH and VTMs thread priority
 *							and interlock the EmptyVtmPipe activity   
 *							(bats530)                                 
 *  05	07jan98		tek		provide visual notification for DAPI too. 
 *							(bats546)                                 
 *  06	30JAN98		tek		repair merge of bats546                   
 *  07	09mar98		tek		sapi backend timing (group h)
 *  08  16mar98		JAW		Merged CE code.                           
 *  09  18mar98		cjl		Removed specific path for dectalkf.h. 
 *  10	19mar98		tek		bats 608/609/620: fix maintenance of	  
 *							dwQueuedSampleCount for 8-bit formats	  
 *  11	20aug98		tek		support for killing audio for ConvertToPhonemes 
 *  12	16sep98		tek		fall back to the sync path for Visual marks when audio not started. 
 *  13	30sep98		tek		set hSyncEvent earlier under SAPi to avoid 
 *							hangs with leading pauses or syncs		
 *  14	28oct98		tek		init the bDoTuning flag	
 *  15	10nov98		ETT		added comments and bPipesNotEmpty init.
 *  16	20nov98		GL		BATS#828 use VTM_DEBUG to replace _DEBUG
 *  17	13apr99		mfg		to fixed ACCESS32 studder for ARM211 tek fix
 *  18	27jul99		mfg		included  cemm.h for WinCE builds
 *  19	29oct99		mgs		Fixed bug uncovered by removing the debug window for release builds
 *  20   11feb00 	EAB		Integrated hlsyn
 *  21	12jun00		NAL		Warning removal
 *  22	14jul00		MGS		Sapi 5 additions
 *  23	20jul00		MGS		More Sapi 5 stuff
 *  24	26jul00		MGS		Sapi 5 visuals
 *  25  28jul00		EAB		Added ouput of phone+1 for SAPI
 *  26	22aug00		MGS		BATS #935 Fixed 2 concurreny problems
 *  27	16oct00		CAB		Fixed copyright and formatted comment section.
 *  28	02feb01		MGS		Merged in base changes needed for ACCESS32 merge
 *  29  01mar01		CAB		Updated copyright info
 *  30  27mar01		MGS		Visual marks for Tru64 (not working correctly right now)
 *  31	27mar01		MGS		Remove visual marks for CE	
 *  32	28mar01		MGS		Found that the save of the last phoneme was masked for 
 *							language bits and every frame was sending a visual notification
 *							Put back in for CE and turn on for Tru64
 *  29	09may01		MGS		Some VxWorks porting BATS#972
 *  30	19jun01		MGS		Solaris Port BATS#972
 *  31 	7/10/01 	EAB		intermediate check-in tuning for hlsyn
 *  32	13sep01		MFG		Added new Speaker Structure for Hlysyn added 
 							initDefaultSpeakerValues() and changeSpeakerValues()
 *  33	26feb02		MGS		Trial SDK Noise, Sapi 5 Access32
 *  34	20mar02		MGS		Single threaded vtm
 *  35	21mar02		MGS		Single threaded ph
 *  36	03apr02		MGS		Single threaded lts
 *  37	11apr02		MGS		ARM7 port
 *	38	20may02		CAB		Removed redunant #if
 *	39	22may02		CAB		Moved brace to fix compile
 */

 /**********************************************************************/
 /**********************************************************************/
 /*  Include Files.                                                    */
 /**********************************************************************/
 //#define HLSYN
#include "dectalkf.h"

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include "playaudd.h"
#endif

#ifdef HLSYN
#include "hlsynapi.h"
#endif
#ifdef SAPI_GROUP_H_TIMING
#ifdef OLEDECTALK// tek 20feb98 turn on bookmark mode
#define USE_BOOKMARKS_FOR_SYNC
#endif //OLEDECTALK
#endif // SAPI_GROUP_H_TIMING
// Must be defined above..

#ifdef WIN32
#include <windows.h>
#endif

#ifndef ARM7
#include "opthread.h"
#endif

#if defined VXWORKS || defined ARM7
#include <stdlib.h>
#include <string.h>
#else
#include <malloc.h>
#endif

#include "port.h"
#include "defs.h"


#include "kernel.h"
#include "ph_def.h"    /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"
#include "tts.h"

#ifdef TYPING_MODE
void PA_DoSync(HPLAY_AUDIO_T pPlayAudio);
#endif

// tek 20sep97 SAPI is never "typing mode".
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

#ifdef TYPING_MODE
// this magic number is different depending on the brain-damaged audio driver
// you're stuck with.
#ifdef UNDER_CE
#define MIN_TYPING_FRAMES (0x1f)// tek frames to queue before starting audio
								// this number seems to be magic for some audio 
								// drivers.  this interacts with the calculation
								// for uiStartupWriteLength as well.
#else //UNDER_CE

#define MIN_TYPING_FRAMES (0xF)	// tek frames to queue before starting audio
#endif //UNDER_CE
//DWORD MIN_TYPING_FRAMES=5;
#define	TYPING_QUEUE_SLEEP_TIME (3)	// this is the time that the VTM thread
									// falls asleep for after queueing the 
									// above frames. Combined with the drop
									// in PH's priority, this allows the user
									// app to make forward process
// tek 18nov97 constants used in managing VTM/PH Priority (in BYTES. ugh.)
#define BUFFER_LENGTH_RED	(4400)	// when we fall below this much output, go to 
									// max priority (4400 ~= 200msec at 11kHz)
#define BUFFER_LENGTH_YELLOW (22000)// when below this much, go to above_normal
// what we set PH back to when we have plenty to do.
#define BASE_PH_PRIORITY (OP_PRIORITY_NORMAL)
#endif // TYPING_MODE
/**********************************************************************/
/*  GLOBAL VARIABLE DECLARATIONS.                                     */
/**********************************************************************/

#ifdef ASM_FVTM
#include "fvtmasm.h"    /* Declare prototypes required by asm FVTM */
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

#else //ASM_FVM

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
#ifdef USING_LLSYN
typedef void (*LLInitType)(LLSynth *, Speaker *);
#endif
typedef void (*InitializeHLSynthesizerType)(HLFrame *, HLSpeaker *, HLState *, short);
typedef void (*HLSynthesizeLLFrameType)(HLFrame *, HLFrame *, HLSpeaker *, 
										HLState *, HLState *, LLFrame *);
#ifdef USING_LLSYN
void (*LLSynthesizeType)(LLSynth *, LLFrame *, short *);
#endif

#define NUM_FRAMES 1
#define FEMALE 0
#define MALE 1
#endif

extern void read_speaker_definition(LPTTS_HANDLE_T phTTS);

void InitializeVTM(LPTTS_HANDLE_T phTTS);

extern void SetSampleRate( LPTTS_HANDLE_T, unsigned int );

#endif // ASM_FVM


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

#ifndef ARM7
extern MMRESULT WriteAudioToFile( LPTTS_HANDLE_T, LPSAMPLE_T, UINT );

extern void QueueToMemory( LPTTS_HANDLE_T, LPSAMPLE_T, DWORD );
#endif

extern void PutIndexMarkInBuffer( LPTTS_HANDLE_T, DWORD, DWORD );

extern void PutPhonemeInBuffer( LPTTS_HANDLE_T phTTS,
				DWORD,
				DWORD,
				DWORD );

/**********************************************************************/
/*  Function Prototypes.                                              */
/**********************************************************************/

#ifdef ARM7
int OutputData( LPTTS_HANDLE_T,
		 short *,
		 unsigned int,
		 DWORD,
		 DWORD,
		 DWORD);
#else
void OutputData( LPTTS_HANDLE_T,
		 short *,
		 unsigned int,
		 DWORD,
		 DWORD,
		 DWORD);
#endif

// tek 07jan98 this now exists for DAPI too. (bats546)
// tek 13nov97 new prototype. new function.
void SendVisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration, DWORD dwNextPhoneme);

#ifdef SAPI5DECTALK
extern void SendSapi5VisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration,DWORD NextPhone);
#endif

extern int QueueSapiAudioData(LPTTS_HANDLE_T phTTS,
		  			short * pBuffer,
					unsigned int uiSamplesToOutput);
extern int OutputSapiAudioData(LPTTS_HANDLE_T phTTS,
		  			short * pBuffer,
					unsigned int uiSamplesToOutput);
#ifndef ARM7
extern void SendEventToSapi(LPTTS_HANDLE_T phTTS,int uiMsg, void *in_Mark,LPARAM lParam);
#endif

#ifdef HLSYN
extern void initDefaultSpeakerValues(LPTTS_HANDLE_T phTTS,TSpeakerDef *speakerDef);

extern void changeSpeakerValues(LPTTS_HANDLE_T phTTS,TSpeakerDef *speakerDef, currentSpeaker);
#endif

/**********************************************************************/
/*  External variables.                                               */
/**********************************************************************/

/*extern short last_voice;*/ /* Will be accesed through Kernel_share_data structure */

/**********************************************************************/
/*  Global Variables.                                                 */
/**********************************************************************/
#ifdef ARM7
#pragma arm section rwdata="VTMIORWDATA", zidata="VTMIODATA"
#ifndef EPSON_ARM7
VTM_T Vtm_t;
#endif
#endif

//char * phprint( int a){};


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
#elif defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef SINGLE_THREADED
DWORD vtm_main( LPTTS_HANDLE_T phTTS )
#else
OP_THREAD_ROUTINE(vtm_main, LPTTS_HANDLE_T phTTS)
#endif
#else
DWORD vtm_main( LPTTS_HANDLE_T phTTS )
#endif
{
#ifndef SINGLE_THREAD
/* ********************* NOT USED **********************************/
#if 0
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
	LLSynth llsynth;
#endif	

  // tek 18nov97 keep track of whether we are close to running out of input data 
  // from PH.
  BOOL	bRunningOutOfInput=FALSE;
  S16 control;
  DWORD dwSyncParams[4];
  DWORD dwSampleNumber=0;
  /*MVP added PKSD_T to get the handle of instance specific kernel_share_data*/
 /* MVP Added on 10/06/95 */
  int jitter=7;
#endif // 0
/* *****************************************************************/
#endif  //SINGLE_THREAD

  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PVTM_T pVtm_t =NULL;
  int temp=0;	

#ifndef SINGLE_THREADED
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /* Initialize thread error field to no error */
  phTTS->uiThreadError = MMSYSERR_NOERROR;
#endif
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
#ifdef ARM7
#ifdef EPSON_ARM7
  pVtm_t=phTTS->pVTMThreadData;
  memset(pVtm_t,0,sizeof(VTM_T));
#else
  memset(&Vtm_t,0,sizeof(VTM_T));
  pVtm_t=&Vtm_t;
#endif
#else
  if((pVtm_t = (PVTM_T) calloc(1,sizeof(VTM_T))) == NULL)
#ifdef SINGLE_THREADED
	return(MMSYSERR_NOMEM);
#else
#ifdef WIN32
		return(MMSYSERR_NOMEM);
#else
   phTTS->uiThreadError = MMSYSERR_NOMEM;
#endif

  OP_SetEvent(phTTS->hMallocSuccessEvent);
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  if (phTTS->uiThreadError != MMSYSERR_NOERROR)
  {
      OP_ExitThread(&phTTS->uiThreadError);
      OP_THREAD_RETURN;
  }
#endif
#endif //SINGLE_THREADED
#endif // ARM7
  /* MVP : Associate VTM Thread specific data handle with current speech object */
  phTTS->pVTMThreadData = pVtm_t;

  pVtm_t->bRunningOutOfInput=FALSE;
  pVtm_t->dwSampleNumber=0;
  pVtm_t->jitter=7;
  /* MVP MI :Although there are same initial values for some of the elements for 
	 both FVTM and VTM,The elements are placed in both #if and #else part to
	 give a provision to set different values later.
  */

#ifdef HLSYN
//	initDefaultSpeakerValues( phTTS,&pVtm_t->speakerDef);
	  InitializeHLSynthesizer(&pVtm_t->oldframe, &pVtm_t->speakerDef.speaker, &pVtm_t->oldstate, 
	  pVtm_t->parambuff[OUT_SEX+1] );

#endif
#ifdef ASM_FVTM
#else
	pKsd_t->uiCurrentSpeaker          = 0;
	pVtm_t->uiSampleRateChange        = SAMPLE_RATE_INCREASE;
	pVtm_t->rate_scale                = 18063;
	pVtm_t->inv_rate_scale            = 29722;
#endif
	pVtm_t->bEightKHz = FALSE;
	pVtm_t->SampleRate                = 11025;
	pVtm_t->uiNumberOfSamplesPerFrame = 71;
	pKsd_t->uiSampleRate              = 11025;
	pKsd_t->SamplePeriod                      = 9.07029478458E-5;
	// tek 28oct98 set the flag that enabled tuner logging off to start
	pVtm_t->bDoTuning = FALSE;

  /********************************************************************/
  /*  Set the initial sample rate of the Vocal Tract Model.           */
  /********************************************************************/

  pKsd_t->last_voice = (short)0;

#ifdef DEMO_NOISE
	 pVtm_t->makenoise=1;
#endif
	/* tek 20nov97*/
	/* init the secondary locks on the pipe.*/
#ifndef SINGLE_THREADED
	pKsd_t->bVtmIsReadingPipe = FALSE;
	pKsd_t->bVtmDrainRequested = FALSE;
#endif

	SetSampleRate( phTTS, PC_SAMPLE_RATE );
	/********************************************************************/
	/*  Loop and process parameter blocks.                              */
	/********************************************************************/
#ifdef SINGLE_THREADED
  return 0;
}

int vtm_loop(LPTTS_HANDLE_T phTTS,unsigned short *input)
{
	PVTM_T pVtm_t = phTTS->pVTMThreadData;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	int i,tmp;
	S16 temp2;
	S16 temp3;
	S16 temp4;
	S16 temp5;
	S16 temp6;
	S16 tempAB;

#else
	for(;;)
#endif // SINGLE_THREADED
	{
	  		/* display debug switch manual once */
#ifndef ARM7_NOSWI
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
#endif

	// tek 18nov97 we may need to adjust PH's priority here; if the
	// input pipe has gone nearly dry, we want to make sure that PH is at least
	// up to our priority
#ifndef SINGLE_THREADED
#ifdef TYPING_MODE
	if (pipe_count(pKsd_t->vtm_pipe)<3*VOICE_PARS)
	{
		int iCurrentVTMPriority;
		pVtm_t->bRunningOutOfInput = TRUE;
#ifdef VTM_DEBUG // tek find out when the input pipe is going dry.
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
		if (iCurrentVTMPriority != OP_GET_THREAD_PRIORITY_ERROR)
		{
			OP_SetThreadPriority(phTTS->hThread_PH,iCurrentVTMPriority);
		}
	}
	else // not running out of input
	{
		pVtm_t->bRunningOutOfInput = FALSE;
	}
#endif // TYPING_MODE

    // tek 15may97 (moved 20nov97)
	// there is an assumption that the VTM pipe always has a complete
	// packet of some sort in it, and when we come around to this point
	// the control item is at the outlet of the pipe. In order for this to 
	// be true, we have to lock the pipe around any read (because we can't
	// tell how much we need to read until we read the control word). If 
	// EmptyVtmPipe didn't exist, we probably would not have to do this.

	// tek 20nov97 secondary lock on this critical section.

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

	read_pipe( pKsd_t->vtm_pipe, &pVtm_t->control, 1 );
#endif // #ifndef SINGLE_THREADED
	/******************************************************************/
	/*  Get the control word. This is the first word of a packet.     */
	/*  There are currently 4 types of packets. Speech packets,       */
	/*  Speaker Definition packets, Sync. packets, and Index Mark     */
	/*  packets.                                                      */
	/******************************************************************/
#ifdef SINGLE_THREADED
	pVtm_t->control=input[0];
#endif

	switch ( pVtm_t->control & SPC_TYPE_MASK) // tek 01aug97 bats 404 subtype support
	{
	/******************************************************************/
	/*  Process a Speech packet.                                      */
	/******************************************************************/

	case SPC_type_voice:
	  
#ifndef SINGLE_THREADED
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), VOICE_PARS );
#else
	  for (i=1;i<=(VOICE_PARS);i++)
	  {
		  pVtm_t->parambuff[i]=input[i];
	  }
#endif
	  /* MGS BATS #409 07/18/97 */
#ifndef SINGLE_THREADED
	  LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
	  pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
#endif	  
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
		  


		  pVtm_t->frame.ag = ((float)(pVtm_t->parambuff[OUT_AG + 1])*.01f);
		  //printf(" %d AV \n",pVtm_t->parambuff[OUT_AV+1]);
		  pVtm_t->frame.al = ((float)(pVtm_t->parambuff[OUT_AL + 1])*.1f);
		  pVtm_t->frame.ab = ((float)(pVtm_t->parambuff[OUT_ABLADE + 1])*.1f);
		  pVtm_t->frame.ap = ((float)(pVtm_t->parambuff[OUT_CNK + 1])*.01f);
		  pVtm_t->frame.an = ((float)(pVtm_t->parambuff[OUT_AN + 1])*.1f);
		  pVtm_t->frame.ue = (((float)(short)pVtm_t->parambuff[OUT_UE + 1]));


		  //MUST BE DONE WITH AT LEAST SPEAKER DEF

		
		  pVtm_t->frame.f4 = pVtm_t->parambuff[OUT_F4+1];
		  pVtm_t->frame.ps = ((float)(pVtm_t->parambuff[OUT_PS + 1])*.01f);
		  pVtm_t->frame.dc = ((float)(short)pVtm_t->parambuff[OUT_DC + 1]);
#ifdef TONGUE_BODY_AREA
			pVtm_t->frame.atb = ((float)(short)(pVtm_t->parambuff[OUT_ATB + 1]*.1f));
#endif
			// frame.place is defined as an int, so cast to float is undesirable - RDK
		  // pVtm_t->frame.place = ((float)(short)pVtm_t->parambuff[OUT_PLACE + 1]);
		  pVtm_t->frame.place = ((short)pVtm_t->parambuff[OUT_PLACE + 1]);
		  
		  pVtm_t->frame.f0 = pVtm_t->parambuff[OUT_T0+1];
		  pVtm_t->frame.f1 = pVtm_t->parambuff[OUT_F1+1];//500.0f;
		  pVtm_t->frame.f2 = pVtm_t->parambuff[OUT_F2+1];//1500.0f;
		  pVtm_t->frame.f3 = pVtm_t->parambuff[OUT_F3+1];//2500.0f;

		  

#ifdef PH_DEBUG
	if(DT_DBG(PH_DBG,0x040))
	{
		  printf ("%s \n", phprint(pVtm_t->parambuff[OUT_PH+1]));
		  printf("b1 = %d ",(pVtm_t->parambuff[OUT_B1+1]));
		  printf(" AG %5.2f ", pVtm_t->frame.ag);
		  printf(" A2 %d ", pVtm_t->parambuff[OUT_A2+1]);
		  printf(" F0 %5.1f ", pVtm_t->frame.f0);
		  printf(" F1 %5.1f ", pVtm_t->frame.f1);
		  printf(" F2 %5.1f ", pVtm_t->frame.f2);
		  printf(" F3 %5.1f ", pVtm_t->frame.f3);
		  printf(" F4 %5.1f\n ", pVtm_t->frame.f4);
		  printf(" AL %5.2f ", pVtm_t->frame.al);
#ifdef TONGUE_BODY_AREA
		   printf(" ATB %5.2f ", pVtm_t->frame.atb);
#endif
		  printf(" AB %5.2f ", pVtm_t->frame.ab);
		  printf(" AN %5.2f ", pVtm_t->frame.an);
		  printf(" CHINK %5.2f ", pVtm_t->frame.ap);
		  printf(" PS %5.2f ", pVtm_t->frame.ps);
		  printf(" UE %5.2f ", pVtm_t->frame.ue);
		 printf("DC %5.2f \n ", pVtm_t->frame.dc);
#ifdef FAKE_HLSYN
			printf(" fz  %d ",pVtm_t->parambuff[OUT_FZ+1]);
			printf(" tilt  %d ",pVtm_t->parambuff[OUT_TLT+1]);
			printf(" b1  %d ",pVtm_t->parambuff[OUT_B1+1]);
			printf(" b2  %d \n",pVtm_t->parambuff[OUT_B2+1]);
			printf(" b3  %d \n",pVtm_t->parambuff[OUT_B3+1]);
		
#endif

	  }
#endif
		


		  HLSynthesizeLLFrame(&pVtm_t->frame, &pVtm_t->oldframe, &pVtm_t->speakerDef.speaker,
			&pVtm_t->state, &pVtm_t->oldstate, &pVtm_t->llframe);
		  pVtm_t->oldstate = pVtm_t->state;
		  pVtm_t->oldframe = pVtm_t->frame;

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

#ifdef HLSYN
	if(pVtm_t->parambuff[OUT_A2+1] == 2000 
		&& pVtm_t->llframe.NAF >40)
	 pVtm_t->in_region +=1;	 
	else
		pVtm_t->in_region =0;

	if(pVtm_t->parambuff[OUT_A2+1] == 1000)
	{
		//dental
		
		pVtm_t->llframe.NA2F = 30;
		pVtm_t->llframe.NA3F = 30;
		pVtm_t->llframe.NA4F = 0;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB = 50;
		//warning the a6 is a dennis trick to subtract energy at high freq
		//taking advantage of the fact that they're added with opposite signs
		// to perform a porr mans 1st difference
	

	}
	
	else if(pVtm_t->parambuff[OUT_A2+1] == 1100)
	{
		//dental--voiced
		pVtm_t->llframe.NA2F = 40;
		pVtm_t->llframe.NA3F = 30;
		pVtm_t->llframe.NA4F = 0;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB = 55;
	}
	else if(pVtm_t->parambuff[OUT_A2+1] == 1200)
	{
		//dh th or dz weak burst
		
		pVtm_t->llframe.NA2F = 45;
		pVtm_t->llframe.NA3F = 45;
		pVtm_t->llframe.NA4F = 0;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB =  55;

		
	}
	else if(pVtm_t->parambuff[OUT_A2+1] == 1300)
	{
		// Labial 
		
		pVtm_t->llframe.NA2F = 30;
		pVtm_t->llframe.NA3F = 0;
		pVtm_t->llframe.NA4F = 0;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB = 65;

		
	}
	else if(pVtm_t->parambuff[OUT_A2+1] == 2000)
	{
	if(pKsd_t->lang_curr == LANG_german)
	{
	//PALATEL
		if (pVtm_t->llframe.NF2 > 2050)
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 53;
		pVtm_t->llframe.NA4F = 50;
		pVtm_t->llframe.NA5F = 30;
		pVtm_t->llframe.NA6F = 30;
		pVtm_t->llframe.NAB = 0;
		}
		else if(pVtm_t->llframe.NF2 > 1700)
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 53;
		pVtm_t->llframe.NA4F = 50;
		pVtm_t->llframe.NA5F = 40;
		pVtm_t->llframe.NA6F = 30;
		pVtm_t->llframe.NAB = 0;
		}
		else 
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 53;
		pVtm_t->llframe.NA4F = 50;
		pVtm_t->llframe.NA5F = 40;
		pVtm_t->llframe.NA6F = 30;
		pVtm_t->llframe.NAB = 0;
		}


	}
	else
	{

		//PALATEL
		if (pVtm_t->llframe.NF2 > 2050)
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 42;
		pVtm_t->llframe.NA4F = 50;
		pVtm_t->llframe.NA5F = 40;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB = 0;
		}
		else if(pVtm_t->llframe.NF2 > 1700)
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 45;
		pVtm_t->llframe.NA4F = 48;
		pVtm_t->llframe.NA5F = 40;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB = 0;
		}
		else 
		{
		pVtm_t->llframe.NA2F = 3;
		pVtm_t->llframe.NA3F = 48;
		pVtm_t->llframe.NA4F = 45;
		pVtm_t->llframe.NA5F = 35;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB = 0;
		}
	}
	}

//PALATEL
	if(pVtm_t->parambuff[OUT_A2+1] == 2100)
	{
		//temp hack for tr blend until I have more time
//		pVtm_t->llframe.NA2F = 40;
//		pVtm_t->llframe.NA3F = 40;
//		pVtm_t->llframe.NA4F = 0;
//		pVtm_t->llframe.NA5F = 40;
//		pVtm_t->llframe.NA6F = 0;
		
		pVtm_t->llframe.NAH = 45;
		
	}


	else if(pVtm_t->parambuff[OUT_A2+1] == 3000)
	{
	if(pKsd_t->lang_curr == LANG_german)
	{
		//alvelar
		if (pVtm_t->llframe.NF3 > 2400 )
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 0;
		pVtm_t->llframe.NA4F = 0;
		pVtm_t->llframe.NA5F = 50;
		pVtm_t->llframe.NA6F = 53;
		}


		else if(pVtm_t->llframe.NF3 < 2400)
		{
		pVtm_t->llframe.NA2F = 25;
		pVtm_t->llframe.NA3F = 25;
		pVtm_t->llframe.NA4F = 50;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 50;
		pVtm_t->llframe.NAB = 0;
		}
	}
	else if(pKsd_t->lang_curr == LANG_french)
	{
/*		
 40, 40, 40, 40, 30,  0,  // T front; indice 145  [T] (I)
 40, 40, 40, 30,  0,  0,  // T back    // was 0,  0, 40,  0, 45,  0, for all
 40, 40, 40,  0,  0,  0,  // T round  [T] (Au)
  0,  0, 40,  0, 45,  0,  // T nonsonor
*/
		//alvelar
		if (pVtm_t->llframe.NF3 > 2650 )
		{
		pVtm_t->llframe.NA2F = 40;
		pVtm_t->llframe.NA3F = 40;
		pVtm_t->llframe.NA4F = 40;
		pVtm_t->llframe.NA5F = 30;
		pVtm_t->llframe.NA6F = 0;
		pVtm_t->llframe.NAB = 0;
		}

		else if (pVtm_t->llframe.NF3 > 2400 )
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 0;
		pVtm_t->llframe.NA4F = 0;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 48;
		pVtm_t->llframe.NAB = 0;
		}
		else if(pVtm_t->llframe.NF3 < 2400)
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 0;
		pVtm_t->llframe.NA4F = 0;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 48;
		pVtm_t->llframe.NAB = 0;
		}


	}
	else
	{
		//hlepme what about females voices we need to change. 
		//alvelar
		//ken I lowered this on slp complaints of bad articulation more back and spred tongue
		if (pVtm_t->llframe.NF3 > 2600 )
		{
		pVtm_t->llframe.NA2F = 0;
		pVtm_t->llframe.NA3F = 0;
		pVtm_t->llframe.NA4F = 30;
		pVtm_t->llframe.NA5F = 0;
		pVtm_t->llframe.NA6F = 55;
		pVtm_t->llframe.NAB = 0;
		}
		else if (pVtm_t->llframe.NF3 > 2400 )
		{
		pVtm_t->llframe.NA2F = 10;
		pVtm_t->llframe.NA3F = 10;
		pVtm_t->llframe.NA4F = 45;
		pVtm_t->llframe.NA5F = 30;
		pVtm_t->llframe.NA6F = 55;
		pVtm_t->llframe.NAB = 0;
		}
		else if(pVtm_t->llframe.NF3 < 2400)
		{
		pVtm_t->llframe.NA2F = 10;
		pVtm_t->llframe.NA3F = 10;
		pVtm_t->llframe.NA4F = 35;
		pVtm_t->llframe.NA5F = 30;
		pVtm_t->llframe.NA6F = 55;
		pVtm_t->llframe.NAB = 0;
		}
	}


	}
	else if(pVtm_t->parambuff[OUT_A2+1] == 3300)
	{
		//voied fricative
		pVtm_t->llframe.NA2F = 10;
		pVtm_t->llframe.NA3F = 10;
		pVtm_t->llframe.NA4F = 20;
		pVtm_t->llframe.NA5F = 60;
		pVtm_t->llframe.NA6F = 55;
		pVtm_t->llframe.NAB = 0;
		
		

	}
	else if(pVtm_t->parambuff[OUT_A2+1] == 3100)
	{
		//German alvelar TS
		pVtm_t->llframe.NA2F = 10;
		pVtm_t->llframe.NA3F = 30;
		pVtm_t->llframe.NA4F = 30;
		pVtm_t->llframe.NA5F = 30;
		pVtm_t->llframe.NA6F = 50;
		pVtm_t->llframe.NAB = 0;
		

	}
	//IT"S OUTA HERE
	else if(pVtm_t->parambuff[OUT_A2+1] == 3200)
	{
		//affricate shift start ch and jh with a4 and then go to tables

		pVtm_t->llframe.NA2F = 10;
		pVtm_t->llframe.NA3F = 30;
		pVtm_t->llframe.NA4F = 50;
		pVtm_t->llframe.NA5F = 30;
		pVtm_t->llframe.NA6F = 30;
		
	}

		temp2 = pVtm_t->llframe.NA2F;
		temp3 = pVtm_t->llframe.NA3F;
		temp4 = pVtm_t->llframe.NA4F;
		temp5 = pVtm_t->llframe.NA5F;
		temp6 = pVtm_t->llframe.NA6F;
		tempAB = pVtm_t->llframe.NAB;
#ifdef outfornow
		if(pVtm_t->in_region  && pVtm_t->llframe.NAF >40)
		{
			pVtm_t->llframe.NA2F = (pVtm_t->oldA2 + pVtm_t->llframe.NA2F)>>1;
			pVtm_t->llframe.NA3F = (pVtm_t->oldA3 + pVtm_t->llframe.NA3F)>>1;
					pVtm_t->llframe.NA4F = (pVtm_t->oldA4 + pVtm_t->llframe.NA4F)>>1;
			pVtm_t->llframe.NA5F = (pVtm_t->oldA5 + pVtm_t->llframe.NA5F)>>1;
							pVtm_t->llframe.NA6F = (pVtm_t->oldA6 + pVtm_t->llframe.NA6F)>>1;
			pVtm_t->llframe.NAB = (pVtm_t->oldAB + pVtm_t->llframe.NAB)>>1;
		 }
	
		if(pVtm_t->in_region )
		{
			pVtm_t->oldA2 = temp2;
			pVtm_t->oldA3 = temp3;
			pVtm_t->oldA4 = temp4;
			pVtm_t->oldA5 = temp5;
			pVtm_t->oldA6 = temp6;
			pVtm_t->oldAB = tempAB;
		}
		else
		{
			pVtm_t->oldA2 = 0;
			pVtm_t->oldA3 = 0;
			pVtm_t->oldA4 = 0;
			pVtm_t->oldA5 = 0;
			pVtm_t->oldA6 = 0;
			pVtm_t->oldAB = 0;
		}

#endif

		
		


	if(pVtm_t->parambuff[OUT_PH+1] == USP_CZ
#ifdef TOMBUCHLER
		|| pVtm_t->parambuff[OUT_PH+1] == UKP_K)
#else
		)
#endif
	{
				
				   pVtm_t->llframe.NA5F  = 30;
				   pVtm_t->llframe.NA4F  = 30;
				   pVtm_t->llframe.NA3F  = 30;
				   pVtm_t->llframe.NA2F  = 50;
				  
	}




//For liquids  
	if(pVtm_t->parambuff[OUT_A2+1] == 4000)
		{
		switch (pVtm_t->parambuff[OUT_PH+1])
			{
		case FP_R:
				   pVtm_t->llframe.NA5F  = 30;
				   pVtm_t->llframe.NA4F  = 35;
				   pVtm_t->llframe.NA3F  = 30;
				   pVtm_t->llframe.NA2F  = 50;
				   //arpVtm_t->llframe.NAF += 5;
					break;



		case USP_R:
		case USP_LL:
				   pVtm_t->llframe.NA4F = 15;
				   pVtm_t->llframe.NA3F = 20;
				   pVtm_t->llframe.NA2F  = 45;
					break;
		case USP_W:
				   pVtm_t->llframe.NA3F = 0;
				   pVtm_t->llframe.NA2F = 50;
				   //+= zero means hlsyn is doing it..
					break;
		default:
				   pVtm_t->llframe.NA3F = 0;
				   pVtm_t->llframe.NA2F =0;
					break;

		}
	}


	
	
	
	
		//if(pVtm_t->parambuff[OUT_AV+1])
		//  temp = pVtm_t->parambuff[OUT_AV+1];
		//if (pVtm_t->parambuff[OUT_AV+1] > 30)
		//	llframe.NAV = pVtm_t->parambuff[OUT_AV+1];
		//else
		//	llframe.NAV =0;
		//llframe.NAH = pVtm_t->parambuff[OUT_AP+1];
		//if(llframe.NF3 > 2600)
		//	llframe.NTL +=3;
	
	 
	  
		//pVtm_t->llframe.NB1 = pVtm_t->parambuff[OUT_B1+1];
		//pVtm_t->llframe.NB2 += pVtm_t->parambuff[OUT_B2+1];
		//pVtm_t->llframe.NB3 = pVtm_t->parambuff[OUT_B3+1];
		if(pVtm_t->llframe.NF3 - pVtm_t->llframe.NF2 < 800)
		{
			tmp = 80000/(pVtm_t->llframe.NF3 - pVtm_t->llframe.NF2);
			if (tmp > 150)
				tmp=150;
			//printf(" tmp %d \n",tmp);
			pVtm_t->llframe.NB2 += tmp;
			pVtm_t->llframe.NB3 += tmp;
		}
		 	
		if(pVtm_t->llframe.NF1 > 700 )
		{
			pVtm_t->llframe.NB1 +=(9500/(pVtm_t->llframe.NF2-pVtm_t->llframe.NF1))*(5500/(pVtm_t->llframe.NF2-pVtm_t->llframe.NF1));
			pVtm_t->llframe.NB2 +=(5500/(pVtm_t->llframe.NF2-pVtm_t->llframe.NF1))*(5500/(pVtm_t->llframe.NF2-pVtm_t->llframe.NF1));
		//	pVtm_t->llframe.NB3 += (7500/(pVtm_t->llframe.NF2- pVtm_t->llframe.NF1))*(5500/(pVtm_t->llframe.NF2-pVtm_t->llframe.NF1));
		}
		
#ifdef outdamnspot
	if (pVtm_t->llframe.NF0)
	{
		pVtm_t->llframe.NF0  += pVtm_t->jitter;
		pVtm_t->jitter = -pVtm_t->jitter;
	}

#endif

		//a("  %d  %d %d \n",llframe.NF2,llframe.NF1,llframe.NFNP );
  //llframe.NDI=0;

  //llframe.NATV=0;
	
			if(pVtm_t->llframe.NAF < 0)
			pVtm_t->llframe.NAF =0;

		pVtm_t->supra_glot_press = pVtm_t->llframe.NDB1;
		//printf(" Pm %d \n", pVtm_t->llframe.NDB1);

#ifdef PH_DEBUG
	if(DT_DBG(PH_DBG,0x040))
	{
#ifdef FAKE_HLSYN
		
		printf(" AF %d ", pVtm_t->llframe.NAF);
		printf(" AH %d \n", pVtm_t->llframe.NAH);
		printf(" AV %d \n", pVtm_t->llframe.NAV);
	//if(pVtm_t->llframe.NA2F+pVtm_t->llframe.NA3F+pVtm_t->llframe.NA4F+
	//	pVtm_t->llframe.NA5F+pVtm_t->llframe.NA6F+pVtm_t->llframe.NAB != 0)
	//{
		  printf(" A2 %d ", pVtm_t->llframe.NA2F);
		  printf(" A3 %d ", pVtm_t->llframe.NA3F);
		  printf(" A4 %d ", pVtm_t->llframe.NA4F);
		  printf(" A5 %d ", pVtm_t->llframe.NA5F);
		  printf(" A6 %d ", pVtm_t->llframe.NA6F);
		  printf(" AF %d ", pVtm_t->llframe.NAF);
		  printf(" AB %d \n", pVtm_t->llframe.NAB);

	//	  }
	  
	

			printf(" a2  %d ",pVtm_t->parambuff[OUT_A2+1]);
			printf(" a3  %d ",pVtm_t->parambuff[OUT_A3+1]);
			printf(" a4  %d ",pVtm_t->parambuff[OUT_A4+1]);
			printf(" a5  %d ",pVtm_t->parambuff[OUT_A5+1]);
			printf(" a6  %d ",pVtm_t->parambuff[OUT_A6+1]);
			printf(" ab  %d \n",pVtm_t->parambuff[OUT_AB+1]);

			printf(" GF  %d \n",pVtm_t->parambuff[OUT_GF+1]);
	}
#else

	if(pVtm_t->llframe.NAF > 0 || pVtm_t->llframe.NAH >0
		|| pVtm_t->llframe.NAV >0 )
	{
		printf(" AF %d ", pVtm_t->llframe.NAF);
		printf(" AH %d \n", pVtm_t->llframe.NAH);
		printf(" AV %d \n", pVtm_t->llframe.NAV);
	if(pVtm_t->llframe.NA2F+pVtm_t->llframe.NA3F+pVtm_t->llframe.NA4F+
		pVtm_t->llframe.NA5F+pVtm_t->llframe.NA6F+pVtm_t->llframe.NAB != 0)
	{
		  printf(" A2 %d ", pVtm_t->llframe.NA2F);
		  printf(" A3 %d ", pVtm_t->llframe.NA3F);
		  printf(" A4 %d ", pVtm_t->llframe.NA4F);
		  printf(" A5 %d ", pVtm_t->llframe.NA5F);
		  printf(" A6 %d ", pVtm_t->llframe.NA6F);
		  printf(" AF %d ", pVtm_t->llframe.NAF);
		  printf(" AB %d \n", pVtm_t->llframe.NAB);

		  }
	  }
	}
#endif //fake
		
#endif
	

#endif // HLSYN


	
	pVtm_t->parambuff[OUT_A2+1] = pVtm_t->llframe.NA2F;
	pVtm_t->parambuff[OUT_A3+1] = pVtm_t->llframe.NA3F;
	pVtm_t->parambuff[OUT_A4+1] = pVtm_t->llframe.NA4F;
	pVtm_t->parambuff[OUT_A5+1] = pVtm_t->llframe.NA5F;
	pVtm_t->parambuff[OUT_A6+1] = pVtm_t->llframe.NA6F;
	pVtm_t->parambuff[OUT_AB+1] = pVtm_t->llframe.NAB;
	
#ifndef FAKE_HLSYN

	//	printf("out_f1,  %d %f %f\n",pVtm_t->parambuff[OUT_F1+1],frame.al,frame.ag); 		  
	if(pVtm_t->llframe.NF0 >= 500)
		pVtm_t->parambuff[OUT_T0+1]=  (400000 / (pVtm_t->llframe.NF0));
	else
		pVtm_t->parambuff[OUT_T0+1]= 500;
	pVtm_t->parambuff[OUT_F1+1] =pVtm_t->llframe.NF1;
	pVtm_t->parambuff[OUT_F2+1] =pVtm_t->llframe.NF2;
	pVtm_t->parambuff[OUT_F3+1] =pVtm_t->llframe.NF3;
	pVtm_t->parambuff[OUT_FZ+1] = pVtm_t->llframe.NFNZ;
	pVtm_t->parambuff[OUT_FNP+1] = pVtm_t->llframe.NFNP;
	pVtm_t->parambuff[OUT_AV+1] = pVtm_t->llframe.NAV;
		pVtm_t->parambuff[OUT_B1+1] = pVtm_t->llframe.NB1;
	//printf(" b1 %d \n", pVtm_t->parambuff[OUT_B1+1]);
	pVtm_t->parambuff[OUT_B2+1] = pVtm_t->llframe.NB2;
	pVtm_t->parambuff[OUT_B3+1] = pVtm_t->llframe.NB3;
	pVtm_t->parambuff[OUT_TLT+1] = pVtm_t->llframe.NTL;
	pVtm_t->parambuff[OUT_OQ+1] = pVtm_t->llframe.NOQ;
	pVtm_t->parambuff[OUT_AP+1] = pVtm_t->llframe.NAH;	
	pVtm_t->parambuff[OUT_GF+1] = pVtm_t->llframe.NAF;
		 
#endif
	
	pVtm_t->parambuff[OUT_OQ+1] = pVtm_t->llframe.NOQ;
	pVtm_t->parambuff[OUT_BNP+1] = pVtm_t->llframe.NBNP;
	pVtm_t->parambuff[OUT_DP+1] = pVtm_t->llframe.NDI;


#ifdef PRINTITOUT

		for (ii = 1; ii<=24; ii++)			   /* EAB FOR REGRESSION TESTING */
		{
			WAIT_PRINT;
			WINprintf("%d ", pVtm_t->parambuff[ii]);
			SIGNAL_PRINT;
	}
		WAIT_PRINT;
		WINprintf ("\n");
		SIGNAL_PRINT;
#endif
	//printf(" gf %d \n",llframe.NAF);
	//printf(" fnz %d \n",llframe.NFNZ);

//	if(llframe.NF0 > 0 )
//	{
//
//	pVtm_t->parambuff[OUT_T0 + 1] = (short) (400000.0 / pVtm_t->parambuff[OUT_T0+1]);
// }
//	

#ifdef SAPI5DECTALK
	if (phTTS->OutputIsText==0 && phTTS->SkippingForward==0)
	{
#endif
     speech_waveform_generator(phTTS);
#ifdef SAPI5DECTALK
	}
#endif
#ifdef PH_DEBUG
	if(DT_DBG(PH_DBG,0x100))
	{
		
		printf ("%s \n", phprint(pVtm_t->parambuff[OUT_PH+1]));
		printf(" OQ %d ", pVtm_t->llframe.NOQ);
		printf(" A2 %d ", pVtm_t->llframe.NA2F);
		printf("  %d ", pVtm_t->llframe.NA3F);
		printf("  %d ", pVtm_t->llframe.NA4F);
		printf("  %d ", pVtm_t->llframe.NA5F);
		printf(" %d ", pVtm_t->llframe.NA6F);
		printf(" %d ", pVtm_t->llframe.NAB);
		printf(" AH %d \n", pVtm_t->llframe.NAH);
		printf(" AF %d ", pVtm_t->llframe.NAF);

		printf(" TLT %d ", pVtm_t->llframe.NTL);
		printf(" F0 %d ", pVtm_t->llframe.NF0);
		printf(" AV %d ", pVtm_t->llframe.NAV);
		printf(" F1 %d ", pVtm_t->llframe.NF1);
		printf(" B1 %d ", pVtm_t->llframe.NB1);
		printf(" B2 %d ", pVtm_t->llframe.NB2);
		printf(" B3 %d ", pVtm_t->llframe.NB3);
		printf(" F2 %d ", pVtm_t->llframe.NF2);
		printf(" F3 %d ", pVtm_t->llframe.NF3);
		printf(" F4 %d ", pVtm_t->llframe.NF4);
		//printf(" F5 %d ", pVtm_t->llframe.NF5);
		printf(" nz %d np  %d ", pVtm_t->llframe.NFNZ,pVtm_t->llframe.NFNP);
		printf("\n ");
			
	}

#endif
#else // HLSYN
#ifdef SAPI5DECTALK
	if (phTTS->OutputIsText==0 && phTTS->SkippingForward==0)
	{
#endif
		speech_waveform_generator(phTTS);
#ifdef SAPI5DECTALK
	}
#endif

#endif // HLSYN


#endif //ASM_FVTM
	      
	      OutputData( phTTS,
			  pVtm_t->iwave,
			  pVtm_t->uiNumberOfSamplesPerFrame,
			  (DWORD)pVtm_t->parambuff[OUT_PH+1],
			  (DWORD)pVtm_t->parambuff[OUT_DU+1],
			  (DWORD)pVtm_t->parambuff[OUT_PH2+1]
			  );
#ifndef SAPI5DECTALK
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
	      // tek drop back PH's priority after we've queued some audio.
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
	      // the really important stuff on OLEDECTALK too.
#ifdef OLEDECTALK
	      if (phTTS->wTypingFrameCount == MIN_TYPING_FRAMES)
		OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_NORMAL);
#else // OLEDECTALK
	      if (phTTS->dwOutputState != STATE_OUTPUT_AUDIO)
		  {
#ifndef SINGLE_THREADED
		  if (phTTS->wTypingFrameCount == MIN_TYPING_FRAMES)
		    OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_NORMAL);
#endif
		  }
	      else  // tek 18nov97.
		{
		  // check the status of the output buffer every 16th
		  // packet, whether we are in typing mode at the time or
		  // not. Based on the number of samples outstanding, 
		  // adjust the VTM thread's priority. In fact, we
		  // probably need to check on the PH thread too, just
		  // to make sure we'll have something to do next time.
		  // use the ==1 construct to make sure that we bop up
		  // to high priority on the very first packet.
		  if (   (pVtm_t->bRunningOutOfInput)
			 || ((phTTS->wTypingFrameCount&0xF) == 1) 
			 )
		    {
		      
#ifndef SINGLE_THREADED
			  int iThreadPriority;
		      int iPHThreadPriority;
#endif
		      int	iNewPriority=0;
		      int iSamplesOutstanding = 
			(((HPLAY_AUDIO_T)(phTTS->pAudioHandle))->iSamplesWaitingForCompletion);
#ifndef SINGLE_THREADED
		      iThreadPriority = OP_GetThreadPriority(phTTS->hThread_VTM);
			  iThreadPriority= iPHThreadPriority = OP_GetThreadPriority(phTTS->hThread_PH);
#endif
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
			  iNewPriority = OP_PRIORITY_HIGHEST;
			}
		      else if (iSamplesOutstanding < BUFFER_LENGTH_YELLOW)
			{
			  iNewPriority = OP_PRIORITY_ABOVE_NORMAL;
			}
		      else
			{
			  iNewPriority = OP_PRIORITY_NORMAL;
			}
#ifndef SINGLE_THREADED
			  if (  (iThreadPriority != OP_GET_THREAD_PRIORITY_ERROR)
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
		      
#endif // SINGLE_THREADED
		      
		    }
		  // tek 09may97 if we're in typing mode, start audio.
		  // tek 06nov97 dont DoSync if we're halting.
		  // tek 19nov97 changed to be a power of two so the frame count
		  //             can free-run.
		  if (/*phTTS->bInTypingMode &&*/( ! pKsd_t->halting ) 
		      && ((phTTS->wTypingFrameCount & MIN_TYPING_FRAMES) == MIN_TYPING_FRAMES))
		    {
		      PA_DoSync(phTTS->pAudioHandle);
				// let something else happen?
				// tek 19nov97 don't sleep anymore. We may have left PH at
				// high priority, and it will churn along if it has work to 
				// do. it will get to catch up later, when we drop priority.
				//OP_Sleep(TYPING_QUEUE_SLEEP_TIME);
				// tek 19nov97 don't reset this.
				//phTTS->wTypingFrameCount = 0;
		    }
		}
#endif // OLEDECTALK tek 18nov97
#endif // TYPING_MODE
#endif // SAPI5DECTALK
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
#ifdef ARM7
		  return 1; // reset has been called, fall back to start
#else
			OP_LockMutex( phTTS->pcsQueuedSampleCount );
			phTTS->dwQueuedSampleCount = (unsigned int)4294967295;
			OP_UnlockMutex( phTTS->pcsQueuedSampleCount );
#endif
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

#ifndef SINGLE_THREADED
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), TONE_PARS );
#else
	  for (i=1;i<=(TONE_PARS);i++)
	  {
		  pVtm_t->parambuff[i]=input[i];
	  }
#endif
	  /* MGS BATS #409 07/18/97 */
#ifndef SINGLE_THREADED
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
#endif
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
#ifndef ARM7
	  TextToSpeechErrorHandler( phTTS,
					(WPARAM)0,
					(LPARAM)MMSYSERR_NOMEM );
#endif
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

#ifdef ARM7
		  return 1; // reset has been called, fall back to start
#else
	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	phTTS->dwQueuedSampleCount = 4294967295;
	OP_UnlockMutex( phTTS->pcsQueuedSampleCount );
#endif
	  }

	  break;

	/******************************************************************/
	/*  Process a Speaker Definition packet.                          */
	/******************************************************************/

	case SPC_type_speaker:
	  // tek 14may97
	  // always init the VTM when we see a speakerdef!
	  InitializeVTM(phTTS);
#ifndef SINGLE_THREADED
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), SPDEF_PARS );
#else
	  for (i=1;i<=(SPDEF_PARS);i++)
	  {
		  pVtm_t->parambuff[i]=input[i];
	  }
#endif
	  /* MGS BATS #409 07/18/97 */
#ifndef SINGLE_THREADED
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
#endif
		/* change the speaker values here */	

#ifdef ASM_FVTM
	  pKsd_t->uiCurrentSpeaker = read_speaker_definition( &(pVtm_t->parambuff[1]), &pVtm_t->Fvtm );
#else
	  read_speaker_definition(phTTS);
#endif
#ifdef HLSYN
  initDefaultSpeakerValues(phTTS,&pVtm_t->speakerDef);

  InitializeHLSynthesizer(&pVtm_t->oldframe, &pVtm_t->speakerDef.speaker, &pVtm_t->oldstate, 
	  pVtm_t->parambuff[OUT_SEX+1] );
  changeSpeakerValues(phTTS, &pVtm_t->speakerDef, pKsd_t->last_voice );
#endif
	  break;

	/******************************************************************/
	/*  Process a Sync. packet.                                       */
	/******************************************************************/

	case SPC_type_sync:
#ifdef ARM7
		return 0; // doesn't do anything from here on
#else
#ifndef SINGLE_THREADED
	  /* MGS BATS #409 07/18/97 */
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
#endif
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
	  // a sync always resets the typing startup frame count.
	  phTTS->wTypingFrameCount=0;

	  if (phTTS->bInTypingMode)
		{
			// don't send the sync to the sync thread; just
			// set the event from here (at most, a sync in 
			// typing mode is used to make sure things got forced
			// out to this point, not to determine when something
			// gets played.

	    OP_SetEvent( phTTS->hSyncEvent );
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

	  pVtm_t->dwSyncParams[0] = SPC_type_sync;

		  OP_LockMutex( phTTS->pcsQueuedSampleCount );
	  pVtm_t->dwSyncParams[1] = phTTS->dwQueuedSampleCount;
		  OP_UnlockMutex( phTTS->pcsQueuedSampleCount );

	  write_pipe( pKsd_t->sync_pipe, pVtm_t->dwSyncParams, 2 );
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
		      OP_SetEvent( phTTS->hSyncEvent );

	  break;

	default:

		// moved outside if (halting) so it always happens
		      OP_SetEvent( phTTS->hSyncEvent );

	  break;
	}
	  }
#endif // ARM7
	  break;

	/******************************************************************/
	/*  Process an Index Mark packet.                                 */
	/******************************************************************/

	case SPC_type_index:
#ifndef SINGLE_THREADED
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[0]), INDEX_PARS );
#else
	  for (i=1;i<=(INDEX_PARS);i++)
	  {
		  pVtm_t->parambuff[i-1]=input[i];
	  }
#endif
#ifdef ARM7
#ifndef EPSON_ARM7
	  // return the index mark using the callback now
	  if (phTTS->EmbCallbackRoutine(input[1],3)==NULL) // index returned
	  {
		phTTS->pKernelShareData->halting=1;
	  }
#endif
	  return 0;
#else
	  /* MGS BATS #409 07/18/97 */
#ifndef SINGLE_THREADED
	      LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
#endif
	  if ( ! pKsd_t->halting )
	  {
	pVtm_t->dwSyncParams[0] = pVtm_t->control; //tek 01aug97 bats 404 keep the original packet type

	pVtm_t->dwSyncParams[1] = (DWORD)pVtm_t->parambuff[0];
	pVtm_t->dwSyncParams[2] = (DWORD)pVtm_t->parambuff[1];

	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	pVtm_t->dwSampleNumber = phTTS->dwQueuedSampleCount;
	OP_UnlockMutex( phTTS->pcsQueuedSampleCount );

#ifdef DEMO_NOISE
	if (control==(SPC_type_index|SPC_subtype_noise))
	{
		if (dwSyncParams[1] +dwSyncParams[2])
			pVtm_t->makenoise=1;
		else
			pVtm_t->makenoise=0;
	}
#endif
	// tek 04aug97 sapi fixes
	// if this is SAPI, and we're processing a start/stop/bookmark/wordpos,
	// we need to build the MARK_DATA structure here and pass it along;
	// if we wait until the sync thread, the timestamps get out of date.
	// in order to keep ourselves sane, we'll overwrite the
	// sample number with the pointer to the structure rather than not
	// doing the fill-in above; this makes the code much easier to
	// understand in the presence of ifdefs.
#ifdef OLEDECTALK
	switch(pVtm_t->control)
	{
	case (SPC_type_index|SPC_subtype_bookmark):
	case (SPC_type_index|SPC_subtype_wordpos):
	case (SPC_type_index|SPC_subtype_start):
	case (SPC_type_index|SPC_subtype_stop):
	case (SPC_type_index|SPC_subtype_sentence):
	case (SPC_type_index|SPC_subtype_volume):
		pVtm_t->pMarkData = NULL;	// just for safety
							// the sync thread will toss
							// these packets with null ptrs
							// which is about the only way 
							// we can handle a malloc fail.
		pVtm_t->pMarkData = malloc(sizeof(MARK_DATA));
		if (pVtm_t->pMarkData)
		{
		  // fill it in.
		  QWORD qwTemp;
		  PA_GetQWPosition(phTTS->pAudioHandle,&qwTemp);
		  pVtm_t->pMarkData->qTimeStamp = qwTemp;
		  // glue together the two halves of the index value.
		  pVtm_t->pMarkData->dwMarkValue  =  (LPARAM)( (pVtm_t->dwSyncParams[1]<<16) | (pVtm_t->dwSyncParams[2]&0xFFFF));
		  pVtm_t->pMarkData->dwMarkType = pVtm_t->control;
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
		// be processed.
		pVtm_t->dwSampleNumber = (DWORD)(pVtm_t->pMarkData);
 		break;

	default:
		// just leave it alone.
		break;
	}

#endif //OLEDECTALK
#ifdef SAPI5DECTALK
	switch(pVtm_t->control)
	{
	case (SPC_type_index|SPC_subtype_bookmark):
	case (SPC_type_index|SPC_subtype_wordpos):
	case (SPC_type_index|SPC_subtype_start):
	case (SPC_type_index|SPC_subtype_stop):
	case (SPC_type_index|SPC_subtype_sentence):
	case (SPC_type_index|SPC_subtype_volume):
		pVtm_t->pMarkData = NULL;	// just for safety
							// the sync thread will toss
							// these packets with null ptrs
							// which is about the only way 
							// we can handle a malloc fail.
		pVtm_t->pMarkData = malloc(sizeof(MARK_DATA));
		if (pVtm_t->pMarkData)
		{
		  pVtm_t->pMarkData->qTimeStamp = pVtm_t->dwSampleNumber;
		  // glue together the two halves of the index value.
		  pVtm_t->pMarkData->dwMarkValue  =  (LPARAM)( (pVtm_t->dwSyncParams[1]<<16) | (pVtm_t->dwSyncParams[2]&0xFFFF));
		  pVtm_t->pMarkData->dwMarkType = pVtm_t->control;
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
		// be processed.
		pVtm_t->dwSampleNumber = (DWORD)(pVtm_t->pMarkData);
 		break;
	default:
		// just leave it alone.
		break;
	}

#endif //SAPI5DECTALK

	switch ( phTTS->dwOutputState )
	{
	/**************************************************************/
	/*  Send the SPC_type_index command value, the index mark     */
	/*  value, and the last queued sample number to the SYNC      */
	/*  thread.                                                   */
	/**************************************************************/

	case STATE_OUTPUT_AUDIO:

	  pVtm_t->dwSyncParams[3] = pVtm_t->dwSampleNumber;
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
	  if (  (pVtm_t->control ==  (SPC_type_index	| SPC_subtype_bookmark))
		  ||(pVtm_t->control ==  (SPC_type_index	| SPC_subtype_wordpos))
		  ||(pVtm_t->control ==  (SPC_type_index	| SPC_subtype_start))
		  ||(pVtm_t->control ==  (SPC_type_index	| SPC_subtype_sentence))
		  ||(pVtm_t->control ==  (SPC_type_index	| SPC_subtype_stop))
		  ||(pVtm_t->control ==  (SPC_type_index	| SPC_subtype_volume))
		 )
	  {
		  // bookmark. if that fails, dro pback to the sync_pipe method.
		  if (!PA_SetBookmark(phTTS->pAudioHandle,(DWORD)pVtm_t->pMarkData))
		  {
			  // mananged to set a bookmark.
#ifdef VTM_DEBUG  //tek15aug97
			{
				char szTemp[256]="";
				sprintf(szTemp,"AudioDest BookMark %08lx set at %lu\n",
					pVtm_t->pMarkData,timeGetTime());
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
					pVtm_t->pMarkData,timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //VTM_DEBUG
	  write_pipe( pKsd_t->sync_pipe, pVtm_t->dwSyncParams, 4 );
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
#endif // VTM_DEBUG
		 write_pipe( pKsd_t->sync_pipe, pVtm_t->dwSyncParams, 4 );
	  }
#else // USE_BOOKMARKS_FOR_SYNC
	  write_pipe( pKsd_t->sync_pipe, pVtm_t->dwSyncParams, 4 );
#endif //USE_BOOKMARKS.
	  break;

	/**************************************************************/
	/*  Return the index mark in the memory buffer.               */
	/**************************************************************/

	case STATE_OUTPUT_MEMORY:

	  PutIndexMarkInBuffer( phTTS,
				pVtm_t->dwSyncParams[1],
				pVtm_t->dwSampleNumber );
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
		Report_TTS_Status(phTTS,phTTS->uiID_Index_Message,(WPARAM)pVtm_t->dwSyncParams[2],(LPARAM)pVtm_t->dwSyncParams[1]);

	  break;
	case STATE_OUTPUT_SAPI5:
#ifdef SAPI5DECTALK
		if (!pKsd_t->halting)
		{
			if (pVtm_t->dwSampleNumber!=0 || pVtm_t->control == SPC_type_index)
			{
				if  (pVtm_t->control ==  (SPC_type_index	| SPC_subtype_bookmark))
				{
					Report_TTS_Status(phTTS,phTTS->uiID_Bookmark_Message,pVtm_t->dwSampleNumber,(LPARAM)pVtm_t->dwSyncParams[1]);
					free((void *)(pVtm_t->dwSampleNumber));
				}
				else if  (pVtm_t->control ==  (SPC_type_index	| SPC_subtype_wordpos))
				{
					SendEventToSapi(phTTS,phTTS->uiID_Wordpos_Message,pVtm_t->dwSampleNumber,(LPARAM)pVtm_t->dwSyncParams[1]);
					free((void *)(pVtm_t->dwSampleNumber));
				}
				//	else if  (control ==  (SPC_type_index	| SPC_subtype_start))
				//		Report_TTS_Status(phTTS,phTTS->uiID_Start_Message,dwSampleNumber,(LPARAM)dwSyncParams[1]);
				else if  (pVtm_t->control ==  (SPC_type_index	| SPC_subtype_stop))
				{
					Report_TTS_Status(phTTS,phTTS->uiID_Stop_Message,pVtm_t->dwSampleNumber,(LPARAM)pVtm_t->dwSyncParams[1]);
					free((void *)(pVtm_t->dwSampleNumber));
				}
				else if  (pVtm_t->control ==  (SPC_type_index	| SPC_subtype_start))
				{
					SendEventToSapi(phTTS,phTTS->uiID_Sentence_Message,pVtm_t->dwSampleNumber,(LPARAM)pVtm_t->dwSyncParams[1]);
					free((void *)(pVtm_t->dwSampleNumber));
				}
				else if  (pVtm_t->control ==  (SPC_type_index	| SPC_subtype_volume))
				{
					SendEventToSapi(phTTS,(SPC_type_index | SPC_subtype_volume),pVtm_t->dwSampleNumber,(LPARAM)pVtm_t->dwSyncParams[1]);
					free((void *)(pVtm_t->dwSampleNumber));
				}
				else
					Report_TTS_Status(phTTS,phTTS->uiID_Index_Message,(WPARAM)pVtm_t->dwSyncParams[2],(LPARAM)pVtm_t->dwSyncParams[1]);
			}
		}
#endif
		break;


	default:
	  break;
	}
	  }
#endif // ARM7
		  break;

	/******************************************************************/
	/*  Process a Force command.                                      */
	/******************************************************************/

	case SPC_type_force:
#ifdef ARM7
		return 0;
#else
	  /* MGS BATS #409 07/18/97 */
#ifndef SINGLE_THREADED
    LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
#endif
	  if (( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
	&& ( ! pKsd_t->halting ))
	  {
	SendBuffer( phTTS );
	  }
	  break;

	default:
	  /* MGS BATS #409 07/18/97 */
#ifndef SINGLE_THREADED
    LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);
		pKsd_t->bVtmIsReadingPipe = FALSE;	// tek 20nov97 let go of secondary lock
#endif	
#endif // ARM7
		break;
	}
	  /* MGS BATS #409 07/18/97 */
//    LeaveCriticalSection(pKsd_t->pcsVtmPipeRead);

	/******************************************************************/
	/*  Fix reset hang problem. WIH 3/28/95.                          */
	/******************************************************************/
#ifndef ARM7
	if ( (phTTS->bMemoryReset) && (phTTS->pTTS_Buffer != NULL) )
	{
	  SendBuffer( phTTS );
	}
#endif
  }
#ifndef SINGLE_THREADED
  /* Free the VTM thread specific data handle */
  if(pVtm_t)
	free(pVtm_t);
  phTTS->pVTMThreadData = pVtm_t = NULL;                

#ifdef WIN32
  return( FALSE );
#else
  OP_ExitThread(MMSYSERR_NOERROR);
  OP_THREAD_RETURN;
#endif
#endif // SINGLE_THREADED
  return 0;
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
#ifdef ARM7
int OutputData( LPTTS_HANDLE_T phTTS,
		 short * pBuffer,
		 unsigned int uiSamplesToOutput,
		 DWORD dwPhoneme,
		 DWORD dwDuration,
		 DWORD NextPhone)
{
	short *temp;

	// call the callback now
	memcpy(phTTS->output_buffer,pBuffer,uiSamplesToOutput*2);
#ifndef EPSON_ARM7
	temp=phTTS->EmbCallbackRoutine(phTTS->output_buffer,0);     
	if (temp==NULL)
	{
		phTTS->pKernelShareData->halting=1;
		phTTS->output_buffer=pBuffer;
	}
	else
	{
		phTTS->output_buffer=temp;
	}
#endif
#ifdef EPSON_ARM7
	phTTS->PTS_return_code=4; //PTS_BUFFER_FILLED
#endif
	// set the value of the next buffer
	return 0;
}

#else
void OutputData( LPTTS_HANDLE_T phTTS,
		 short * pBuffer,
		 unsigned int uiSamplesToOutput,
		 DWORD dwPhoneme,
		 DWORD dwDuration,
		 DWORD NextPhone)
{
  DWORD dwSampleNumber;
  MMRESULT mmStatus;
  /* MVP MI Added PKSD_T element */
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PVTM_T pVtm_t = phTTS->pVTMThreadData; // tek 08jan98 we now need this.
#ifdef __ipaq__
  short *newbuffer;
  int i;
#endif

  // tek 20aug98
  // if we're doing a TTS_SILENT ConvertToPhonemes, just drop this on the
  // floor
  if (phTTS->dwPhonemeCvtFlags & TTS_SILENT)
	  return;

  if (phTTS->bInReset==TRUE)
	  return;
 
  if (pKsd_t->halting==TRUE)
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
#ifdef __ipaq__
       /* HACK ALERT */
       /* this code is her to convert from 11025 Hz mono to
          22050 Hz Stereo for the ipaq.  This code will probably
          have to be removed when the ipaq linux kernel is fixed. */
       newbuffer=malloc(sizeof(short)*(uiSamplesToOutput*4+1));
       for (i=0;i<uiSamplesToOutput;i++)
       {
               newbuffer[i<<2]=pBuffer[i];
               newbuffer[(i<<2)+1]=pBuffer[i];
               newbuffer[(i<<2)+2]=pBuffer[i];
               newbuffer[(i<<2)+3]=pBuffer[i];
       }
       uiSamplesToOutput<<=2;
#endif

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
			SendVisualNotification(phTTS, 0, dwDuration, NextPhone);
		}
		else
		{
			SendVisualNotification(phTTS, dwPhoneme, dwDuration, NextPhone);
		}
	  } // if new phoneme
	
	// tek 13oct98 let the audio system know if we're done
// MGS HELP_ME THIS needs to be fixed once the entire single threading is done
#ifndef SINGLE_THREADED
	if (pipe_count( pKsd_t->vtm_pipe ) > 0)
	if (pipe_count( pKsd_t->ph_pipe ) > 0)
	if (pipe_count( pKsd_t->lts_pipe ) > 0)
#else
	if (pipe_count( pKsd_t->cmd_pipe ) > 0)
#endif		
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
#ifdef __ipaq__
      PA_Queue( phTTS->pAudioHandle,
               (LPAUDIO_T)newbuffer,
               uiSamplesToOutput << 1 );
#else
	PA_Queue( phTTS->pAudioHandle,
		  (LPAUDIO_T)pBuffer,
		  uiSamplesToOutput << 1 );
#endif
	
	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	// tek 19mar98 bats 608/608/620
	// once again the schizophrenia about samples vs bytes comes back
	// to haunt us. for DAPI this can fester a while longer, but for
	// SAPI we need to be careful.
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
      OP_UnlockMutex( phTTS->pcsQueuedSampleCount );
#ifdef __ipaq__
     free(newbuffer);
#endif
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

		OP_LockMutex( phTTS->pcsQueuedSampleCount );
		dwSampleNumber = phTTS->dwQueuedSampleCount;
		phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput;
		OP_UnlockMutex( phTTS->pcsQueuedSampleCount );

	/****************************************************************/
	/*  If the phoneme is new then put the new phoneme and the new  */
	/*  phonemes duration into the output structure.                */
	/****************************************************************/

		if ( dwPhoneme != pKsd_t->dwLastPhoneme )
		{
			pKsd_t->dwLastPhoneme = dwPhoneme;

			PutPhonemeInBuffer( phTTS,
			  dwPhoneme & 0x00ff, // mask this for now
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

	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput;
	OP_UnlockMutex( phTTS->pcsQueuedSampleCount );

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

  case STATE_OUTPUT_SAPI5:

#ifdef SAPI5DECTALK
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
			SendSapi5VisualNotification(phTTS, 0, dwDuration,NextPhone);
		}
		else
		{
			SendSapi5VisualNotification(phTTS, dwPhoneme, dwDuration,NextPhone);
		}
	  } // if new phoneme

	if (phTTS->OutputIsText==0)
	{
	  OutputSapiAudioData(phTTS, pBuffer, uiSamplesToOutput);
	}
#endif

	break;


  default:

	break;
  }

  return;
}
#endif // #ifdef ARM7
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
#ifndef SINGLE_THREADED
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

  // tek 20nov97 take the secondary interlock.
  pKsd_t->bVtmDrainRequested = TRUE;
  // make sure the other guy doesn't have it.
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
	  // gets separated from the packet.)

	  // critical section is probably not the right way to do this.
	  // seems prone to deadlocks. We need primary/secondary locks.
	  // but for now.
	  OP_LockMutex(pKsd_t->pcsVtmPipeRead);
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
	  // free up the pipe for general use.
	  OP_UnlockMutex(pKsd_t->pcsVtmPipeRead);
  }
  // tek 20nov97 free secondary interlock
  pKsd_t->bVtmDrainRequested = FALSE;
  return;
}
#endif // ifdef SINGLE_THREADED

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
	/* RDK Needs a look */
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
// tek 27aug97 routine to handle sending the visual marks.
// tek 20feb98 two different variants depending on whether we're using bookmark timing.
#ifndef ARM7
#ifndef USE_BOOKMARKS_FOR_SYNC

void SendVisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration, DWORD dwNextPhoneme)
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
	// allocate a packet to hold the visual info.
	pvdPacket = (PVISUAL_DATA)malloc(sizeof(VISUAL_DATA));
	if (pvdPacket) // just punt if the malloc failed
	{
		if (phTTS->uiFullRangeMarks)
		{
			pvdPacket->dwPhoneme = dwPhoneme; //mask off language flag for now
			pvdPacket->dwNextPhoneme = dwNextPhoneme; //mask off language flag for now
		}
		else
		{
			pvdPacket->dwPhoneme = dwPhoneme & 0x00ff; //mask off language flag for now
			pvdPacket->dwNextPhoneme = dwNextPhoneme & 0x00ff; //mask off language flag for now
		}
		pvdPacket->dwDuration = dwDuration;
		pvdPacket->qTimeStamp = qwTemp;
		pvdPacket->dwHints = 0; // NAL warning removal
		pvdPacket->cEnginePhoneme = pKsd_t->ascky[dwPhoneme & 0x00ff]; //mask off language flag for now
		pvdPacket->cNextEnginePhoneme = pKsd_t->ascky[dwNextPhoneme & 0x00ff]; //mask off language flag for now
		if (pvdPacket->cEnginePhoneme == 0)
		{
			// this should never happen if the ascky table is fully defined.
			
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
	
	
	// now send the packet off to sync.
	if (pvdPacket)
	{
		DWORD dwSyncParams[4];
		dwSyncParams[0]=SPC_type_visual;
		dwSyncParams[1]=0;
#ifdef __osf__
		dwSyncParams[2]=(DWORD)((((long)(pvdPacket)) & 0xFFFFFFFF00000000) >> 32);
		dwSyncParams[3]=(DWORD)(((long)(pvdPacket)) & 0x00000000FFFFFFFF);
#else
		dwSyncParams[2]=0;
		dwSyncParams[3]=(DWORD)pvdPacket;
#endif
		write_pipe(pKsd_t->sync_pipe, dwSyncParams,4);
		
	}
	
} // 

#else //USE_BOOKMARKS_FOR_SYNC
// the audio bookmark version
void SendVisualNotification(LPTTS_HANDLE_T phTTS, DWORD dwPhoneme, DWORD dwDuration, DWORD dwNextPhoneme)
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
	// allocate a packet to hold the visual info.
	pvdPacket = (PVISUAL_DATA)malloc(sizeof(VISUAL_DATA));
	if (pvdPacket) // just punt if the malloc failed
	{
		if (phTTS->uiFullRangeMarks)
		{
			pvdPacket->dwPhoneme = dwPhoneme; //mask off language flag for now
			pvdPacket->dwNextPhoneme = dwNextPhoneme; //mask off language flag for now
		}
		else
		{
			pvdPacket->dwPhoneme = dwPhoneme & 0x00ff; //mask off language flag for now
			pvdPacket->dwNextPhoneme = dwNextPhoneme & 0x00ff; //mask off language flag for now
		}
		pvdPacket->dwDuration = dwDuration;
		pvdPacket->qTimeStamp = qwTemp;
		pvdPacket->dwHints = NULL;
		pvdPacket->cEnginePhoneme = pKsd_t->ascky[dwPhoneme & 0x00ff]; //mask off language flag for now
		pvdPacket->cNextEnginePhoneme = pKsd_t->ascky[dwNextPhoneme & 0x00ff]; //mask off language flag for now
		if (pvdPacket->cEnginePhoneme == 0)
		{
			// this should never happen if the ascky table is fully defined.
			
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
	
	
	// now send the packet off to sync.
	if (pvdPacket)
	{
		// allocate a MARK_DATA to send this through the bookmark path.
		pMarkData = malloc(sizeof(MARK_DATA));
		if (pMarkData)
		{
		  pMarkData->qTimeStamp = qwTemp;
		  // glue together the two halves of the index value.
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
#ifdef __osf__
		dwSyncParams[2]=(DWORD)((((long)(pvdPacket)) & 0xFFFFFFFF00000000) >> 32);
		dwSyncParams[3]=(DWORD)(((long)(pvdPacket)) & 0x00000000FFFFFFFF);
#else
		dwSyncParams[2]=0;
		dwSyncParams[3]=(DWORD)pvdPacket;
#endif
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
#endif // ARM7

#ifdef HLSYN
#ifdef EPSON_ARM7
typedef struct SPEAKER_DEF_T {
	short sex;                /* Sex 1 (male) or 0 (female)                        */
	short smoothness;         /* Smoothness, in %                                  */
	short assertiveness;      /* Assertiveness, in %                               */
	short average_pitch;      /* Average pitch, in Hz                              */
	short pitch_range;        /* Pitch range, in %                                 */
	short breathiness;        /* Breathiness, in decibels (dB)                     */
	short richness;           /* Richness, in %                                    */
	short num_fixed_samp_og;  /* Number of fixed samples of open glottis           */
	short laryngealization;   /* Laryngealization, in %                            */
	short head_size;          /* Head size, in %                                   */
	short formant4_res_freq;  /* Fourth formant resonance frequency, in Hz         */
	short formant4_bandwidth; /* Fourth formant bandwidth, in Hz                   */
	short formant5_res_freq;  /* Fifth formant resonance frequency, in Hz          */
	short formant5_bandwidth; /* Fifth formant bandwidth, in Hz                    */
	short parallel4_freq;     /* Parallel fourth formant frequency, in Hz          */
	short parallel5_freq;     /* Parallel fifth formant frequency, in Hz           */
	short gain_frication;     /* Gain of frication source, in dB                   */
	short gain_aspiration;    /* Gain of aspiration source, in dB                  */
	short gain_voicing;       /* Gain of voicing source, in dB                     */
	short gain_nasalization;  /* Gain of nasalization, in dB                       */
	short gain_cfr1;          /* Gain of cascade formant resonator 1, in dB        */
	short gain_cfr2;          /* Gain of cascade formant resonator 2, in dB        */
	short gain_cfr3;          /* Gain of cascade formant resonator 3, in dB        */
	short gain_cfr4;          /* Gain of cascade formant resonator 4, in dB        */
	short loudness;           /* Loudness, gain input to cascade 1st formant in dB */
	short spectral_tilt;      /* (f0-dependent spectral tilt in % of max)frm 75 to 90 for 10to8 */
	short baseline_fall;      /* Baseline fall, in Hz                              */
	short lax_breathiness;    /* Lax breathiness, in %                             */
	short quickness;          /* Quickness, in %                                   */
	short hat_rise;           /* Hat rise, in Hz                                   */
	short stress_rise;        /* Stress rise, in Hz                                */
	short avg_glot_open;      /* Glottal speed                                     */
	short avg_glot_voicd_open;
	short avg_glot_unv_open;
	short area_chink;
	short open_quo;
	short output_gain_mult;   /* Output gain multiplier for FVTM                   */
	short HL_B1m;
	short HL_B2m;
	short HL_B3m;
	short HL_B4m;
	short HL_B5m;
	short HL_B2F;
	short HL_B3F;
	short HL_B4F;
	short HL_B5F;
	short HL_F6;
	short HL_B6F;
	short stress_step;
	short unstress_pressure;
	short stress_pressure;
	short nom_sub_pressure;
	short nom_fricative_opening;
	short nom_glot_stop_area;
	short vot_speed;
	short endofphrase_spread;
	short HL_num_formants;
	short HL_f1_hi_shift;
	short HL_acd_f1_break;

} SPEAKER_DEF_T;

#endif
/* change speaker values  here */
void changeSpeakerValues(LPTTS_HANDLE_T phTTS, TSpeakerDef *speakerDef, currentSpeaker SpeakerName)
{
	PVTM_T pVtm_t = phTTS->pVTMThreadData;

	
#ifdef EPSON_ARM7
		PDPH_T pDph_t = phTTS->pPHThreadData;
		SPEAKER_DEF_T *speaker_def_ptr=(SPEAKER_DEF_T *)pDph_t->voidef[SpeakerName];
//			speakerDef->speaker.NewtonInterpTimeStep = .01f;
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;

			//speakerDef->speaker.OQm = 50;		

			speakerDef->speaker.B1m = speaker_def_ptr->HL_B1m;
			speakerDef->speaker.B2m=  speaker_def_ptr->HL_B2m;
			speakerDef->speaker.B3m=  speaker_def_ptr->HL_B3m;
			speakerDef->speaker.B4m=  speaker_def_ptr->HL_B4m;
			speakerDef->speaker.B5m=  speaker_def_ptr->HL_B5m;
			speakerDef->speaker.B2F = speaker_def_ptr->HL_B2F;
			speakerDef->speaker.B3F=  speaker_def_ptr->HL_B3F;
			speakerDef->speaker.B4F=  speaker_def_ptr->HL_B4F;
			speakerDef->speaker.B5F=  speaker_def_ptr->HL_B5F;
			speakerDef->speaker.F5 =  speaker_def_ptr->formant5_res_freq;
			speakerDef->speaker.F6  = speaker_def_ptr->HL_F6;
			speakerDef->speaker.B6F = speaker_def_ptr->HL_B6F;		
			pVtm_t->STRESS_STEP = speaker_def_ptr->stress_step; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = speaker_def_ptr->unstress_pressure;
			pVtm_t->STRESS_PRESSURE = speaker_def_ptr->stress_pressure;
			pVtm_t->NOM_Sub_Pressure = speaker_def_ptr->nom_sub_pressure;
	
			pVtm_t->NOM_Fricative_Opening = speaker_def_ptr->nom_fricative_opening;
			pVtm_t->NOM_Glot_Stop_Area = speaker_def_ptr->nom_glot_stop_area;
			pVtm_t->VOT_speed = speaker_def_ptr->vot_speed;
			pVtm_t->EndOfPhrase_Spread =speaker_def_ptr->endofphrase_spread;
			
			speakerDef->speaker.f1HiShift = speaker_def_ptr->HL_f1_hi_shift;
			speakerDef->speaker.acd_f1Break = speaker_def_ptr->HL_acd_f1_break;
#else
	switch(SpeakerName){


	case Paul:	/*paul*/



//#define ken
#ifdef KEN
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			//speakerDef->speaker.OQm = 60;		
			speakerDef->speaker.B1m = 60;
//			speakerDef->speaker.NewtonInterpTimeStep = .01f;
			speakerDef->speaker.B2m=  100;
			speakerDef->speaker.B3m=  130;
			speakerDef->speaker.B4m=  180;
			speakerDef->speaker.B5m=  200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  320;
			speakerDef->speaker.B4F=  260;
			speakerDef->speaker.B5F=  270;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4500;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 600;		
			pVtm_t->STRESS_STEP = 10; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 800;

			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread =10;
			
			speakerDef->speaker.f1HiShift = 1180;
			speakerDef->speaker.acd_f1Break = 600;
#else
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			speakerDef->speaker.B1m = 90;
			speakerDef->speaker.B2m=  90;
			speakerDef->speaker.B3m=  130;
			speakerDef->speaker.B4m=  180;
			speakerDef->speaker.B5m=  200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  320;
			speakerDef->speaker.B4F=  260;
			speakerDef->speaker.B5F=  270;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4500;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 600;		
			pVtm_t->STRESS_STEP = 10; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 800;
	
			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread =1;

			speakerDef->speaker.f1HiShift = 1180;
			speakerDef->speaker.acd_f1Break = 600;
#endif //ken else

#ifdef GERMAN
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
		//	speakerDef->speaker.OQm = 40;		
			speakerDef->speaker.B1m = 100;
			speakerDef->speaker.B2m=  120;
			speakerDef->speaker.B3m=  220;
			speakerDef->speaker.B4m=  180;
			speakerDef->speaker.B5m=  200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  320;
			speakerDef->speaker.B4F=  260;
			speakerDef->speaker.B5F=  270;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4500;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 800;		

			pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 20;
			pVtm_t->STRESS_PRESSURE = 200;
			pVtm_t->NOM_Sub_Pressure = 900;
	
			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread = 10;
		
#endif
			break;
	case Betty:

#ifdef DIANE
			speakerDef->speaker.agm = 5.0;
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			//speakerDef->speaker.OQm = 50;		
			speakerDef->speaker.B1m = 80;
//			speakerDef->speaker.NewtonInterpTimeStep = .01;
			speakerDef->speaker.B2m=  110;
			speakerDef->speaker.B3m=  150;
			speakerDef->speaker.B4m=  1180;
			speakerDef->speaker.B5m=  1200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  320;
			speakerDef->speaker.B4F=  260;
			speakerDef->speaker.B5F=  370;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  5000;
			speakerDef->speaker.F6  = 4940;
			speakerDef->speaker.B6F = 600;		

			pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 30;
			pVtm_t->STRESS_PRESSURE = 160;
			pVtm_t->NOM_Sub_Pressure = 700;

			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 3;
			pVtm_t->EndOfPhrase_Spread=2;
			speakerDef->speaker.f1HiShift = 1250;
			speakerDef->speaker.acd_f1Break = 350;	
			

			break;
#endif //diane
#ifdef SUEB
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			//speakerDef->speaker.OQm = 45;		
			speakerDef->speaker.B1m = 90;
//			speakerDef->speaker.NewtonInterpTimeStep = .01f;
			speakerDef->speaker.B2m=  160;
			speakerDef->speaker.B3m=  170;
			speakerDef->speaker.B4m=  180;
			speakerDef->speaker.B5m=  200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  220;
			speakerDef->speaker.B4F=  360;
			speakerDef->speaker.B5F=  500;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
	//		speakerDef->speaker.F5 =  ZAPF;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 600;		

			pVtm_t->STRESS_STEP = 130; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 30;
			pVtm_t->STRESS_PRESSURE = 1240;
			pVtm_t->NOM_Sub_Pressure = 700;

			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 2;
			pVtm_t->EndOfPhrase_Spread=5;
			speakerDef->speaker.f1HiShift = 1100;
			speakerDef->speaker.acd_f1Break = 1000;

			break;
#endif //sueb
#ifdef OLD_VOICES
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
	//		speakerDef->speaker.OQm = 65;		
			speakerDef->speaker.B1m = 120;
//			speakerDef->speaker.NewtonInterpTimeStep = .01f;
			speakerDef->speaker.B2m=  150;
			speakerDef->speaker.B3m=  200;
			speakerDef->speaker.B4m=  250;
			speakerDef->speaker.B5m=  350;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  220;
			speakerDef->speaker.B4F=  360;
			speakerDef->speaker.B5F=  500;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
	//		speakerDef->speaker.F5 =  ZAPF;
			speakerDef->speaker.F6  = 4900;
			speakerDef->speaker.B6F = 600;		
			pVtm_t->STRESS_STEP = 30; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 30;
			pVtm_t->STRESS_PRESSURE = 240;
			pVtm_t->NOM_Sub_Pressure = 900;
			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread=1;
			speakerDef->speaker.f1HiShift = 1180;
			speakerDef->speaker.acd_f1Break = 650;

			break;

#endif //OLD_VOICES

	case Harry:	/*Harry*/
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
		//	speakerDef->speaker.OQm = 30;			
			speakerDef->speaker.B1m = 100;
			speakerDef->speaker.B2m=  120;
			speakerDef->speaker.B3m=  130;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4400;
			speakerDef->speaker.F6  = 4990;
			speakerDef->speaker.B6F = 1200;
		
			pVtm_t->STRESS_STEP = 50; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 400;
			pVtm_t->NOM_Sub_Pressure = 800;
	
			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 0;
			pVtm_t->EndOfPhrase_Spread = 1;
			
			break;
			
			
	case Kit:	/*Kit*/
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
		//	speakerDef->speaker.OQm = 65;		
			speakerDef->speaker.B1m = 95;
//			speakerDef->speaker.NewtonInterpTimeStep = .01f;
			speakerDef->speaker.B2m=  130;
			speakerDef->speaker.B3m=  160;
			speakerDef->speaker.B4m=  180;
			speakerDef->speaker.B5m=  200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  320;
			speakerDef->speaker.B4F=  260;
			speakerDef->speaker.B5F=  270;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4700;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 1200;		

			pVtm_t->STRESS_STEP = 10; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 800;
	
			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 0;
			pVtm_t->EndOfPhrase_Spread =1;
		
			speakerDef->speaker.acd_f1Break = 950;
			speakerDef->speaker.f1HiShift = 1180;
			


			break;

			
	case Rita:	/*Rita*/
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			//speakerDef->speaker.OQm = 60;			
			speakerDef->speaker.B1m = 100;
			speakerDef->speaker.B2m=  120;
			speakerDef->speaker.B3m=  100;
			speakerDef->speaker.F5 =  4800;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 1200;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;

			pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 800;

			pVtm_t->NOM_Fricative_Opening = 110;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 0;
			pVtm_t->EndOfPhrase_Spread=0;
			speakerDef->speaker.f1HiShift = 1180;
			speakerDef->speaker.acd_f1Break = 650;

			break;
			


		

	case Frank:	/*Frank*/
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
		//	speakerDef->speaker.OQm = 70;			
			speakerDef->speaker.B1m = 120;
			speakerDef->speaker.B2m= 110;
			speakerDef->speaker.B3m= 150;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4400;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 1200;
#ifdef TOMBUCHLER
			pVtm_t->NOM_VOIC_GLOT_AREA =350;


#endif

			pVtm_t->STRESS_STEP = 5; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 40;
			pVtm_t->STRESS_PRESSURE = 0;
			pVtm_t->NOM_Sub_Pressure = 700;
	
			pVtm_t->NOM_Fricative_Opening = 120;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			

			break;


	case Ursula:	/*Ursula*/
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
		//	speakerDef->speaker.OQm = 65;			
			speakerDef->speaker.B1m = 120;
			speakerDef->speaker.B2m= 130;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F= 220;
			speakerDef->speaker.B4F= 250;
			speakerDef->speaker.B5F= 200;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 = 4650;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 1200;

			pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 900;
		
			pVtm_t->NOM_Fricative_Opening = 110;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread=1;
			
			break;


	case Wendy:
#ifdef why
		speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
	//	speakerDef->speaker.OQm = 65;	
			speakerDef->speaker.B1m = 120;
			speakerDef->speaker.B2m= 130;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F= 320;
			speakerDef->speaker.B4F= 350;
			speakerDef->speaker.B5F= 500;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 = ZAPF;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 1200;

			pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 800;

			pVtm_t->NOM_Fricative_Opening = 160;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread= 1;
		
			break;
#endif
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
		//	speakerDef->speaker.OQm = 75;			
			speakerDef->speaker.B1m = 120;
			speakerDef->speaker.B2m= 130;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F= 220;
			speakerDef->speaker.B4F= 250;
			speakerDef->speaker.B5F= 200;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 = 4850;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 1200;
	
			pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 900;
	
			pVtm_t->NOM_Fricative_Opening = 110;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread=2;

			break;

	case Chris:
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			//speakerDef->speaker.OQm = 50;		
			speakerDef->speaker.B1m = 70;
//			speakerDef->speaker.NewtonInterpTimeStep = .01f;
			speakerDef->speaker.B2m=  90;
			speakerDef->speaker.B3m=  130;
			speakerDef->speaker.B4m=  180;
			speakerDef->speaker.B5m=  200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  320;
			speakerDef->speaker.B4F=  260;
			speakerDef->speaker.B5F=  270;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4500;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 600;		

			pVtm_t->STRESS_STEP = 10; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 800;
		
			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread =1;

		break;

	case Dennis:
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			//speakerDef->speaker.OQm = 50;		
			speakerDef->speaker.B1m = 70;
//			speakerDef->speaker.NewtonInterpTimeStep = .01f;
			speakerDef->speaker.B2m=  90;
			speakerDef->speaker.B3m=  130;
			speakerDef->speaker.B4m=  180;
			speakerDef->speaker.B5m=  200;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F=  320;
			speakerDef->speaker.B4F=  260;
			speakerDef->speaker.B5F=  270;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 =  4500;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 600;		

			pVtm_t->STRESS_STEP = 10; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 800;
		
			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread =1;

		break;




	default: /*paul*/
			speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
			//speakerDef->speaker.OQm = 50;			
			speakerDef->speaker.B1m = 80;
			speakerDef->speaker.B2m=  90;
			speakerDef->speaker.B3m=  150;
			speakerDef->speaker.B4m=  230;
			speakerDef->speaker.B5m=  340;
			speakerDef->speaker.B2F = 250;
			speakerDef->speaker.B3F= 320;
			speakerDef->speaker.B4F= 400;
			speakerDef->speaker.B5F= 400;
			speakerDef->speaker.TLm = pVtm_t->Tiltm;
			speakerDef->speaker.F5 = 4500;
			speakerDef->speaker.F6  = 4800;
			speakerDef->speaker.B6F = 1200;		

			pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
			pVtm_t->UNSTRESS_PRESSURE = 80;
			pVtm_t->STRESS_PRESSURE = 100;
			pVtm_t->NOM_Sub_Pressure = 900;

			pVtm_t->NOM_Fricative_Opening = 100;
			pVtm_t->NOM_Glot_Stop_Area = 0;
			pVtm_t->VOT_speed = 1;
			pVtm_t->EndOfPhrase_Spread = 3;
			
			break;

	}
#endif

}


/* default speaker values are placed here */
void initDefaultSpeakerValues(LPTTS_HANDLE_T phTTS, TSpeakerDef *speakerDef){

	PVTM_T pVtm_t = phTTS->pVTMThreadData;


	speakerDef->speaker.OQm = pVtm_t->NOM_Open_Quo;
	//speakerDef->speaker.OQm = 50;	
	speakerDef->speaker.B1m = 110;
//	speakerDef->speaker.NewtonInterpTimeStep = .01f;
	speakerDef->speaker.B2m=  110;
	speakerDef->speaker.B3m=  140;
	speakerDef->speaker.B4m=  230;
	speakerDef->speaker.B5m=  340;
	speakerDef->speaker.B2F = 250;
	speakerDef->speaker.B3F= 320;
	speakerDef->speaker.B4F= 260;
	speakerDef->speaker.B5F= 260;
	speakerDef->speaker.TLm = pVtm_t->Tiltm;
	speakerDef->speaker.F5 = 4500;
	speakerDef->speaker.F6  = 4700;
	speakerDef->speaker.B6F = 500;		

	pVtm_t->STRESS_STEP = 20; // step must add to total in 8 steps or less
	pVtm_t->UNSTRESS_PRESSURE = 80;
	pVtm_t->STRESS_PRESSURE = 100;
	pVtm_t->NOM_Sub_Pressure = 800;

	pVtm_t->NOM_Fricative_Opening = 100;
	pVtm_t->NOM_Glot_Stop_Area = 0;
	pVtm_t->VOT_speed = 1;

}

#endif // HLSYN
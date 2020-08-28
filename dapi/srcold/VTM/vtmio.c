/*
 * 							@DEC_COPYRIGHT@
 *    Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.7  1997/04/28  17:00:00  Ginger Lin
 *      change phinst.h to ph_def.h
 *      change WIN32_OR_OSF to (WIN32) || (__osf__)
 *      [1997/04/28  17:00:00  Ginger Lin]
 *
 * Revision 1.1.2.6  1996/11/19  12:22:30  Cathy_Page
 * 	Removed SetEvent in SPC_type_sync if in halt state
 * 	[1996/11/19  12:21:13  Cathy_Page]
 *
 * Revision 1.1.2.5  1996/10/31  12:53:52  Cathy_Page
 * 	Set the hSyncEvent in vtm_main after a sync packet that needs to be
 * 	  process immediately (when state is not output_audio) OR when
 * 	  in the middle of a TextToSpeechReset request.
 * 	[1996/10/31  12:47:28  Cathy_Page]
 * 
 * Revision 1.1.2.4  1996/10/18  12:14:58  Cathy_Page
 * 	Ported latest NT change - Check for null buffer to fix reset hang
 * 	[1996/10/18  12:13:33  Cathy_Page]
 * 
 * Revision 1.1.2.3  1996/09/30  12:03:21  Cathy_Page
 * 	Removed the 'ifdef 0' code
 * 	[1996/09/30  12:00:22  Cathy_Page]
 * 
 * Revision 1.1.2.2  1996/09/26  11:14:14  Cathy_Page
 * 	Created from V4.3 NT code
 * 	[1996/09/26  11:13:41  Cathy_Page]
 * 
 */
 
/*    Revision History:
 *
 *	Rev  Who     Date           Description
   	---  -----   -----------    --------------------------------------------  
 	001  CAB	03/01/2001		Created new comment section
*/
	
/**********************************************************************/
/*                                                                    */
/*  DECtalk Vocal Tract Model I/O for Windows/NT                      */
/*                                                                    */
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
/**********************************************************************/
/**********************************************************************/
/*  Include Files.                                                    */
/**********************************************************************/

#include "opthread.h"
#include <malloc.h>
#include "port.h"
#include "defs.h"
#include "playaudd.h"
#include "kernel.h"
#include "ph_def.h"    /* MVP : Now phinst.h includes phdefs.h */
#include "samprate.h"
#include "tts.h"


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

extern void read_speaker_definition(LPTTS_HANDLE_T phTTS);

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

/**********************************************************************/
/*  External variables.                                               */
/**********************************************************************/

/*extern short last_voice;*/ /* Will be accesed through Kernel_share_data structure */

/**********************************************************************/
/*  Global Variables.                                                 */
/**********************************************************************/

/*DWORD dwLastPhoneme;  */      /* Will be accesed through Kernel_share_data structure */

/**********************************************************************/
/*  Start of the VTM thread.                                          */
/**********************************************************************/

OP_THREAD_ROUTINE(vtm_main, LPTTS_HANDLE_T phTTS)
{
  S16 control;
  DWORD dwSyncParams[4];
  DWORD dwSampleNumber;
  /*MVP added PKSD_T to get the handle of instance specific kernel_share_data*/
  PVTM_T pVtm_t =NULL;
  PKSD_T pKsd_t = phTTS->pKernelShareData;

  /* Initialize thread error field to no error */
  phTTS->uiThreadError = MMSYSERR_NOERROR;

 /* MVP Added on 10/06/95 */
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
    phTTS->uiThreadError = MMSYSERR_NOMEM;
  
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_
  /* 
   * CP: Set the event, even if malloc eerror occurred. User
   * will look at uiThreadError for actual error code.
   */
  OP_SetEvent(phTTS->hMallocSuccessEvent);
#endif
  
  if (phTTS->uiThreadError != MMSYSERR_NOERROR)
  {
      OP_ExitThread(&phTTS->uiThreadError);
      OP_THREAD_RETURN;
  }

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
  /********************************************************************/
  /*  Set the initial sample rate of the Vocal Tract Model.           */
  /********************************************************************/

  pKsd_t->last_voice = (short)0;

  SetSampleRate( phTTS, PC_SAMPLE_RATE );
  /********************************************************************/
  /*  Loop and process parameter blocks.                              */
  /********************************************************************/

  for(;;)
  {
	read_pipe( pKsd_t->vtm_pipe, &control, 1 );

	/******************************************************************/
	/*  Get the control word. This is the first word of a packet.     */
	/*  There are currently 4 types of packets. Speech packets,       */
	/*  Speaker Definition packets, Sync. packets, and Index Mark     */
	/*  packets.                                                      */
	/******************************************************************/

	switch ( control )
	{
	/******************************************************************/
	/*  Process a Speech packet.                                      */
	/******************************************************************/

	case SPC_type_voice:

	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), VOICE_PARS );

	  /****************************************************************/
	  /*  If not halting then generate speech samples.                */
	  /****************************************************************/

	  if (( ! pKsd_t->halting ) && ( ! phTTS->bMemoryReset ))
	  {
#ifdef ASM_FVTM
	    /* For FVTM iwave is not necessary to be thread specific, 
	       can be made local here :MVP */
	    speech_waveform_generator( &(pVtm_t->parambuff[1]), pVtm_t->iwave, &pVtm_t->Fvtm );
#else
	    speech_waveform_generator(phTTS);
#endif
	    
	    OutputData( phTTS,
			pVtm_t->iwave,
			pVtm_t->uiNumberOfSamplesPerFrame,
			(DWORD)pVtm_t->parambuff[OUT_PH+1],
			(DWORD)pVtm_t->parambuff[OUT_DU+1] );
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

	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	phTTS->dwQueuedSampleCount = (unsigned int)4294967295;
	OP_UnlockMutex( phTTS->pcsQueuedSampleCount );
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

	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	phTTS->dwQueuedSampleCount = 4294967295;
	OP_UnlockMutex( phTTS->pcsQueuedSampleCount );
	  }

	  break;

	/******************************************************************/
	/*  Process a Speaker Definition packet.                          */
	/******************************************************************/

	case SPC_type_speaker:
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[1]), SPDEF_PARS );

#ifdef ASM_FVTM
	  pKsd_t->uiCurrentSpeaker = read_speaker_definition( &(pVtm_t->parambuff[1]), &pVtm_t->Fvtm );
#else
	  read_speaker_definition(phTTS);
#endif

	  break;

	/******************************************************************/
	/*  Process a Sync. packet.                                       */
	/******************************************************************/

	case SPC_type_sync:

	  if ( ! pKsd_t->halting )
	  {
		switch ( phTTS->dwOutputState )
		{
		/**************************************************************/
		/*  Send the SPC_type_Sync command value, and the last queued */
		/*  sample number to the SYNC thread.                         */
		/**************************************************************/

		case STATE_OUTPUT_AUDIO:

		  dwSyncParams[0] = SPC_type_sync;

		  OP_LockMutex( phTTS->pcsQueuedSampleCount );
		  dwSyncParams[1] = phTTS->dwQueuedSampleCount;
		  OP_UnlockMutex( phTTS->pcsQueuedSampleCount );

		  write_pipe( pKsd_t->sync_pipe, dwSyncParams, 2 );

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
	  break;

	/******************************************************************/
	/*  Process an Index Mark packet.                                 */
	/******************************************************************/

	case SPC_type_index:
	  read_pipe( pKsd_t->vtm_pipe, &(pVtm_t->parambuff[0]), INDEX_PARS );

	  if ( ! pKsd_t->halting )
	  {
	dwSyncParams[0] = SPC_type_index;
	dwSyncParams[1] = (DWORD)pVtm_t->parambuff[0];
	dwSyncParams[2] = (DWORD)pVtm_t->parambuff[1];

	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	dwSampleNumber = phTTS->dwQueuedSampleCount;
	OP_UnlockMutex( phTTS->pcsQueuedSampleCount );

	switch ( phTTS->dwOutputState )
	{
	/**************************************************************/
	/*  Send the SPC_type_index command value, the index mark     */
	/*  value, and the last queued sample number to the SYNC      */
	/*  thread.                                                   */
	/**************************************************************/

	case STATE_OUTPUT_AUDIO:

	  dwSyncParams[3] = dwSampleNumber;

	  write_pipe( pKsd_t->sync_pipe, dwSyncParams, 4 );
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

	  if (( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
	&& ( ! pKsd_t->halting ))
	  {
	SendBuffer( phTTS );
	  }
	  break;

	default:
	  break;
	}

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

  OP_ExitThread(MMSYSERR_NOERROR);
  OP_THREAD_RETURN;
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
#ifdef __ipaq__
  short *newbuffer;
  int i;
#endif

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
      
      // tek 13oct98 let the audio system know if we're done
      if (pipe_count( pKsd_t->vtm_pipe ) > 0)
	{
	  phTTS->pAudioHandle->bPipesNotEmpty = TRUE;
	}
      else
	{
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
      phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput << 1;
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

	switch ( wControl )
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

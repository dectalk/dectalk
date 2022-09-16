/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	27	04/28/97	leeber	Build 109 V4.60.04 R003 04/22/99; Freeze Mark; No matching AD Mark. 04/27/99 cjl
	26	04/28/97	leeber	Build 109 V4.60.03 R003 03/31/99 Freeze Mark 04/02/99 cjl
	25	04/28/97	leeber	Build 108 V4.60.02 B002 01/29/99, Freeze Mark, 02/25/99 cjl
	24	04/28/97	leeber	Files verified as different on both WinDif and StarTeam for chnages between AD and RND. 02/01/99 cjl
	23	04/28/97	leeber	AD->RND Pre-V4.60.01 B002 Freeze Transfer, 01/19/99 cjl
	22	04/28/97	leeber	Build 108 V4.51.08 R007 11/03/98, Patch BATS#741 and UNIX build process bugs. 11/06/98 cjl
	21	04/28/97	leeber	AD-> RND File Update; Alpha kitting and DETX build not verified, End Of Beta Test, No showstops/highs; For release mark. Build 108 V4.51.07 R006 08/20/98. 08/31/98 cjl
	20	04/28/97	leeber	BUILD 108 V4.51.06 R005 06/26/98; BATS#249, 290, 313, 428, 492, 532, 546, 550, 566, 590, 599, 602, 603, 607, 608, 610, 613, 616, 623, 626, 631-633, 636-639, 630, 641-643, 645, 648, 651, 656-661, 663, 665, 666, 668, 672, 674-677, 681-683, 685, 688-693, 695
	19	04/28/97	leeber	This has the correct documentation that goes with Build 107 V4.50.04 R004, from AD. 04/15/98 cjl
	18	04/28/97	leeber	Code freeze Build 107 V4.50.04 R004 03/20/98 has been moved from AD->RND for testing. New keys, BATS (459, 590, 606, 607, 609, 610, 617, 619, 620, 622, 626, 627, 628 & 630) fixes, better process, SAPI features added. 03/27/98 cjl
	17	04/28/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	16	04/28/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	15	04/28/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	14	04/28/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	13	04/28/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	12	04/28/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	11	04/28/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	10	04/28/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	9	04/28/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	8	04/28/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	7	04/28/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	6	04/28/97	leeber	Build 104 V4.40.43 R007 08/18/97; Static Builds, Help files, BATS 124, 147, 152, 223, 257, 270, 283, 298, 314, 340, 348, 351, 364, 384, 388, 390, 395, 396, 405, 409-412, 416, 422, 438 & 441. 08/18/97 cjl FREEZE
	5	04/28/97	leeber	Preliminary Code Freeze; Missing docs, hlp and tuning files; otherwisw complete. cjl BUILD 104 V4.40.40 R007 x8/07/97
	4	04/28/97	leeber	Build 104 V4.40.38 B006 _6/25/97 Typning Mode w/assistve32 SDK, Re_Freeze after system crash. 6/25/97 cjl
	3	04/28/97	leeber	Build 104 V4.40.38 B006 06/25/97 Typning Mode w/assistve32 SDK. 6/25/97 cjl
	2	04/28/97	leeber	This is "BUILD 104 V4.40.37 B006H 06/20/97" and contans the special typing_mode build for Henter Joyce. 6/20/97 cjl
	1	04/28/97	simoneau	Initial Version
$
 * Revision 1.1.2.5  1996/01/05  21:57:07  Bill_Hallahan
 * 	{** Merge Information **}
 * 		{** Command used:	bsubmit **}
 * 		{** Ancestor revision:	1.1.2.3 **}
 * 		{** Merge revision:	1.1.2.4 **}
 * 	{** End **}
 * 	Fixed in-memory reset problem
 * 	[1996/01/05  21:56:35  Bill_Hallahan]
 *
 * 	New audio subsystem
 * 	[1996/01/04  03:21:03  Bill_Hallahan]
 *
 * 	New audio subsystem
 * 	[1996/01/03  21:02:25  Bill_Hallahan]
 *
 * Revision 1.1.2.3  1995/10/31  15:49:53  Bill_Hallahan
 * 	Added reset flag
 * 	[1995/10/31  15:49:38  Bill_Hallahan]
 * 
 * Revision 1.1.2.2  1995/07/05  20:04:28  Krishna_Mangipudi
 * 	Moved from ./src/synth/fvtm
 * 	[1995/07/05  20:03:00  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:56:29  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  20:38:59  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 * $EndLog$
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
/**********************************************************************/
/*                                                                    */
/*  DECtalk Vocal Tract Model I/O for OSF/1                           */
/*                                                                    */
/*      ASYNCHRONOUS ERROR MESSAGES.                                  */
/*                                                                    */
/*         This thread may send error messages to the window          */
/*    procedure specified by the window handle passed in function     */
/*    TextToSpeechStartup(). The user may wish to handle these        */
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
#include <stdio.h>
#include <pthread.h>
#include "playaud.h"
#include "port.h"
#include "defs.h"
#include "kernel.h"
#include "phdefs.h"
#include "samprate.h"
#include "tts.h"

/**********************************************************************/
/*  GLOBAL VARIABLE DECLARATIONS.                                     */
/**********************************************************************/

#ifdef ASM_FVTM

#include "fvtmasm.h"    /* Declare prototypes required by asm FVTM */

S16 iwave[128];
S16 parambuff[128];

/**********************************************************************/
/*  Current speaker value set by the read_speaker_definition routine. */
/**********************************************************************/

U32 uiCurrentSpeaker = 0;

/**********************************************************************/
/*  Sample rate scaling parameters for time and frequency.            */
/*                                                                    */
/*  uiSampleRate set by the SetSampleRate routine. It is read later   */
/*  by the phvdef function to determine the speaker definition to use */
/*  for the current sample rate.                                      */
/**********************************************************************/

U32 uiSampleRate               = 11025;
double SampleRate              = 11025.0;
double SamplePeriod            = 9.07029478458e-5;
U32 uiNumberOfSamplesPerFrame  = 71;
FVTM_T Fvtm;           /* Instance variable for assembly FVTM.        */

/**********************************************************************/
/*  External function declarations for FVTM in assembly language.     */
/**********************************************************************/

void SetSampleRate( unsigned int );
                                     
#else

/**********************************************************************/
/*  External variables declared by FVTM in C.                         */
/**********************************************************************/

extern S16 iwave[];
extern DT_PIPE_T parambuff[];
extern unsigned int uiNumberOfSamplesPerFrame;
extern double SampleRate;
extern double SamplePeriod;

/**********************************************************************/
/*  External function declarations for FVTM in C.                     */
/**********************************************************************/

extern void speech_waveform_generator();

extern void read_speaker_definition();

extern void SetSampleRate( unsigned int );

#endif

/**********************************************************************/
/*  External function declarations                                    */
/**********************************************************************/

extern MMRESULT WriteAudioToFile( LPTTS_HANDLE_T, 
				  S16 *, 
				  UINT );


extern void *vtm_pipe;
extern void *sync_pipe;

/**********************************************************************/
/*  Function Prototypes.                                              */
/**********************************************************************/

void OutputData( LPTTS_HANDLE_T,
                 short *,
                 unsigned int,
                 DWORD,
                 DWORD );

/**********************************************************************/
/*  Global Variables.                                                 */
/**********************************************************************/

DWORD dwLastPhoneme;


/**********************************************************************/
/*  Start of the VTM thread.                                          */
/**********************************************************************/

DWORD vtm_main( LPTTS_HANDLE_T ttsHandle )
{
  static S16 control;
  static MMRESULT mmStatus;
  static DWORD dwSyncParams[4];
  static DWORD dwSampleNumber;

  /********************************************************************/
  /*  Loop and process parameter blocks.                              */
  /********************************************************************/

  for(;;)
  {
    OP_WaitForEvent( ttsHandle->hevReadVtmPipe, OP_INFINITE );
    
    read_pipe( vtm_pipe, &control, 1 );

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

      read_pipe( vtm_pipe, &parambuff[1], VOICE_PARS );

      /****************************************************************/
      /*  If not halting then generate speech samples.                */
      /****************************************************************/

      if (( ! KS.halting ) && ( ! ttsHandle->bMemoryReset ))
      {

#ifdef ASM_FVTM
        speech_waveform_generator( &parambuff[1], iwave, &Fvtm );
#else
        speech_waveform_generator();
#endif
        /**************************************************************/
        /*  Output the speech samples to the appropriate place.       */
        /**************************************************************/

	OutputData( ttsHandle,
                    iwave,
                    uiNumberOfSamplesPerFrame,
                    (DWORD)parambuff[OUT_PH+1],
                    (DWORD)parambuff[OUT_DU+1] );
      }
      else
      {
        /**************************************************************/
        /*  If halting then discard all packet data from the pipes.   */
        /*  Maximize the queued sample count to release function      */
        /*  WaitForAudioSampleToPlay() (in file sync.c). This is also */
        /*  done in function TextToSpeechReset() but should also be   */
        /*  done here as the halting flag may be set just before the  */
        /*  sample count is incremented above.                        */
        /**************************************************************/

/* Do we need a mutex around this? */
        pthread_mutex_lock(&ttsHandle->vtmCountMutex);
        ttsHandle->dwQueuedSampleCount = 4294967295;
        pthread_mutex_unlock(&ttsHandle->vtmCountMutex);
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

      read_pipe( vtm_pipe, &parambuff[1], TONE_PARS );

      /****************************************************************/
      /*  If not halting then generate tone samples.                  */
      /****************************************************************/

      if ( ! KS.halting )
      {
        if ( PlayTones( ttsHandle,
                        (double)parambuff[1],
                        (double)parambuff[2],
                        (double)parambuff[3],
                        (double)parambuff[4],
                        (double)parambuff[5],
                        SampleRate,
                        SamplePeriod,
                        &KS.halting ))
        {
          TextToSpeechErrorHandler( ttsHandle,
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

        pthread_mutex_lock(&ttsHandle->vtmCountMutex);
        ttsHandle->dwQueuedSampleCount = 4294967295;
        pthread_mutex_unlock(&ttsHandle->vtmCountMutex);
      }

      break;

    /******************************************************************/
    /*  Process a Speaker Definition packet.                          */
    /******************************************************************/

    case SPC_type_speaker:

      read_pipe( vtm_pipe, &parambuff[1], SPDEF_PARS );

#ifdef ASM_FVTM
      uiCurrentSpeaker = read_speaker_definition( &parambuff[1], &Fvtm );
#else
      read_speaker_definition();
#endif
          
      break;

    /******************************************************************/
    /*  Process a Sync. packet.                                       */
    /******************************************************************/

    case SPC_type_sync:

      if ( ! KS.halting )
      {
        switch ( ttsHandle->dwOutputState )
        {
        /****************************************************************/
        /*  Send the SPC_type_Sync command value, and the last queued   */
        /*  sample number to the SYNC thread.                           */
        /****************************************************************/

        case STATE_OUTPUT_AUDIO:

          dwSyncParams[0] = SPC_type_sync;
	 /* Do we need a mutex around this? */

          pthread_mutex_lock(&ttsHandle->vtmCountMutex);
          dwSyncParams[1] = ttsHandle->dwQueuedSampleCount;
          pthread_mutex_unlock(&ttsHandle->vtmCountMutex);

          write_pipe( sync_pipe, dwSyncParams, 2 );

          break;

        /****************************************************************/
        /*  process the sync immediately.                               */
        /****************************************************************/

        case STATE_OUTPUT_MEMORY:
        case STATE_OUTPUT_WAVE_FILE:
        case STATE_OUTPUT_LOG_FILE:
        case STATE_OUTPUT_NULL:
	  OP_SetEvent( ttsHandle->hevSync );
          break;

        default:
          break;
        }
      }
      break;

    /******************************************************************/
    /*  Process an Index Mark packet.                                 */
    /******************************************************************/

    case SPC_type_index:
      read_pipe( vtm_pipe, &parambuff[0], INDEX_PARS );

      if ( ! KS.halting )
      {
        dwSyncParams[0] = SPC_type_index;
        dwSyncParams[1] = (DWORD)INDEX_MARK;
        dwSyncParams[2] = (DWORD)parambuff[0];

/* Do we need a mutex around this? */
        pthread_mutex_lock(&ttsHandle->vtmCountMutex);
        dwSampleNumber = ttsHandle->dwQueuedSampleCount;
        pthread_mutex_unlock(&ttsHandle->vtmCountMutex);

        switch ( ttsHandle->dwOutputState )
        {
        /****************************************************************/
        /*  Send the SPC_type_index command value, the index mark       */
        /*  value, and the last queued sample number to the SYNC        */
        /*  thread.                                                     */
        /****************************************************************/

        case STATE_OUTPUT_AUDIO:

          dwSyncParams[3] = dwSampleNumber;

          write_pipe( sync_pipe, dwSyncParams, 4 );

          break;

        /****************************************************************/
        /*  Return the index mark in the memory buffer.                 */
        /****************************************************************/

        case STATE_OUTPUT_MEMORY:

          PutIndexMarkInBuffer( ttsHandle,
                              dwSyncParams[2],
                              dwSampleNumber );
          break;

        /**************************************************************/
        /*  Return the index mark immediately.                        */
        /**************************************************************/

        case STATE_OUTPUT_WAVE_FILE:
        case STATE_OUTPUT_LOG_FILE:
        case STATE_OUTPUT_NULL:

	/* Check this out, are the parameters correct? */
          if ( ! KS.halting )
	  {
             Report_TTS_Status( ttsHandle,
			        dwSyncParams[1],
			        dwSyncParams[2] );
	  }
          break;


        default:
          break;
        }
      }
      break;

    /****************************************************************/
    /*  Process a Force command.                                    */
    /****************************************************************/

    case SPC_type_force:
      if (( ttsHandle->dwOutputState == STATE_OUTPUT_MEMORY )
        && ( ! KS.halting ))
      {
        SendBuffer( ttsHandle );
      }

      break;

    default:
      break;
    }

    /****************************************************************/
    /*  Fix reset hang problem. WIH 10/17/95                        */
    /****************************************************************/

    if ( ttsHandle->bMemoryReset )
    {
      SendBuffer( ttsHandle );
    }
  }
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
/*    ttsHandle            A handle of type TTS_HANDLE_T.             */
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
/*    This function does no return a value.                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OutputData( LPTTS_HANDLE_T ttsHandle,
                 short * pBuffer,
                 unsigned int uiSamplesToOutput,
                 DWORD dwPhoneme,
                 DWORD dwDuration )
{
  MMRESULT mmStatus;
  DWORD dwSampleNumber;

        switch ( ttsHandle->dwOutputState )
        {
        /**************************************************************/
        /*  Queue the speech samples to the wave output device.       */
        /**************************************************************/

        case STATE_OUTPUT_AUDIO:

          PA_Queue( ttsHandle->pAudioHandle,
		    pBuffer,
		    uiSamplesToOutput << 1 );
	  
/* Do we need a mutex around this? */

          pthread_mutex_lock(&ttsHandle->vtmCountMutex);
          ttsHandle->dwQueuedSampleCount += (DWORD)uiSamplesToOutput << 1;
          pthread_mutex_unlock(&ttsHandle->vtmCountMutex);

          break;

        /**************************************************************/
        /*  Queue the speech samples to shared memory.                */
        /**************************************************************/

        case STATE_OUTPUT_MEMORY:

          QueueToMemory( ttsHandle, pBuffer, uiSamplesToOutput );
/* Do we need a mutex around this? */
          
          pthread_mutex_lock(&ttsHandle->vtmCountMutex);
	  dwSampleNumber = ttsHandle->dwQueuedSampleCount;
          ttsHandle->dwQueuedSampleCount += (DWORD)uiSamplesToOutput;
          pthread_mutex_unlock(&ttsHandle->vtmCountMutex);

          /************************************************************/
          /*  If the phoneme is new then put the new phoneme and the  */
          /*  new phonemes duration into the output structure.        */
          /************************************************************/
          if ( (DWORD)parambuff[OUT_PH+1] != dwLastPhoneme )
          {
            dwLastPhoneme = (DWORD)parambuff[OUT_PH+1];

            PutPhonemeInBuffer( ttsHandle,
                                (DWORD)parambuff[OUT_PH+1],
                                (DWORD)parambuff[OUT_DU+1],
                                dwSampleNumber );
          }

          break;

        /**************************************************************/
        /*  Queue the speech samples to a wave file.                  */
        /**************************************************************/

        case STATE_OUTPUT_WAVE_FILE:

          mmStatus = 
             WriteAudioToFile( ttsHandle, pBuffer, uiSamplesToOutput );
/* Do we need a mutex around this? */

          pthread_mutex_lock(&ttsHandle->vtmCountMutex);
          ttsHandle->dwQueuedSampleCount += (DWORD)uiSamplesToOutput;
          pthread_mutex_unlock(&ttsHandle->vtmCountMutex);

          break;

        /**************************************************************/
        /*  Discard the speech samples.                               */
        /**************************************************************/

        case STATE_OUTPUT_LOG_FILE:

          break;

        /**************************************************************/
        /*  Discard the speech samples.                               */
        /**************************************************************/

        case STATE_OUTPUT_NULL:

          break;

        /**************************************************************/
        /*  Discard the speech samples.                               */
        /**************************************************************/

        default:

          break;
        }
  return;
}

#ifdef ASM_FVTM

/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/**********************************************************************/
/**********************************************************************/

extern short last_voice;

void SetSampleRate( unsigned int uiSampRate )
{
  /********************************************************************/
  /*  Calculate the model sample dependant parameters.                */
  /********************************************************************/

  uiNumberOfSamplesPerFrame = set_fvtm_sample_rate( uiSampRate, &Fvtm );

  uiSampleRate = uiSampRate;
  SampleRate = (double)uiSampleRate;
  SamplePeriod = 1.0 / SampleRate;

  /********************************************************************/
  /*  Update the speaker definition for the new sample rate.          */
  /********************************************************************/

  KS.async_voice = last_voice;
  KS.async_change |= ASYNC_voice;

  return;
}

/**********************************************************************/
/**********************************************************************/
/*  Function to Set the Sample Rate the vocal tract model outputs.    */
/**********************************************************************/
/**********************************************************************/

void InitializeVTM()
{
  initialize_fvtm( &Fvtm );

  return;
}

#endif

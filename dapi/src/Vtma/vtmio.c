/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	27	10/05/98	leeber	Build 109 V4.60.04 R003 04/22/99; Freeze Mark; No matching AD Mark. 04/27/99 cjl
	26	10/05/98	leeber	Build 109 V4.60.03 R003 03/31/99 Freeze Mark 04/02/99 cjl
	25	10/05/98	leeber	Build 108 V4.60.02 B002 01/29/99, Freeze Mark, 02/25/99 cjl
	24	10/05/98	leeber	Files verified as different on both WinDif and StarTeam for chnages between AD and RND. 02/01/99 cjl
	23	10/05/98	leeber	AD->RND pre-v4.60.01 B002 freeze. This code works for 32 and 16 bits. 01/19/99 cjl
	22	04/30/97	leeber	Build 108 V4.51.08 R007 11/03/98, Patch BATS#741 and UNIX build process bugs. 11/06/98 cjl
	21	04/30/97	leeber	AD-> RND File Update; Alpha kitting and DETX build not verified, End Of Beta Test, No showstops/highs; For release mark. Build 108 V4.51.07 R006 08/20/98. 08/31/98 cjl
	20	04/30/97	leeber	BUILD 108 V4.51.06 R005 06/26/98; BATS#249, 290, 313, 428, 492, 532, 546, 550, 566, 590, 599, 602, 603, 607, 608, 610, 613, 616, 623, 626, 631-633, 636-639, 630, 641-643, 645, 648, 651, 656-661, 663, 665, 666, 668, 672, 674-677, 681-683, 685, 688-693, 695
	19	04/30/97	leeber	This has the correct documentation that goes with Build 107 V4.50.04 R004, from AD. 04/15/98 cjl
	18	04/30/97	leeber	Code freeze Build 107 V4.50.04 R004 03/20/98 has been moved from AD->RND for testing. New keys, BATS (459, 590, 606, 607, 609, 610, 617, 619, 620, 622, 626, 627, 628 & 630) fixes, better process, SAPI features added. 03/27/98 cjl
	17	04/30/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	16	04/30/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	15	04/30/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	14	04/30/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	13	04/30/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	12	04/30/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	11	04/30/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	10	04/30/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	9	04/30/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	8	04/30/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	7	04/30/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	6	04/30/97	leeber	Build 104 V4.40.43 R007 08/18/97; Static Builds, Help files, BATS 124, 147, 152, 223, 257, 270, 283, 298, 314, 340, 348, 351, 364, 384, 388, 390, 395, 396, 405, 409-412, 416, 422, 438 & 441. 08/18/97 cjl FREEZE
	5	04/30/97	leeber	Preliminary Code Freeze; Missing docs, hlp and tuning files; otherwisw complete. cjl BUILD 104 V4.40.40 R007 x8/07/97
	4	04/30/97	leeber	Build 104 V4.40.38 B006 _6/25/97 Typning Mode w/assistve32 SDK, Re_Freeze after system crash. 6/25/97 cjl
	3	04/30/97	leeber	Build 104 V4.40.38 B006 06/25/97 Typning Mode w/assistve32 SDK. 6/25/97 cjl
	2	04/30/97	leeber	This is "BUILD 104 V4.40.37 B006H 06/20/97" and contans the special typing_mode build for Henter Joyce. 6/20/97 cjl
	1	04/30/97	simoneau	Initial Version
$
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
 * $EndLog$
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

#if defined (WIN32) || defined (__osf__) || defined (__linux__)
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
/* For FVTM iwave is not necessary to be a thread specific ,can be made local here :MVP */
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
/*    This function does no return a value.                           */
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

  /********************************************************************/
  /*  Output the audio samples to the appropriate place.              */
  /********************************************************************/

  switch ( phTTS->dwOutputState )
  {
  /********************************************************************/
  /*  Queue the audio samples to the wave output device.              */
  /********************************************************************/

  case STATE_OUTPUT_AUDIO:
	PA_Queue( phTTS->pAudioHandle,
		(LPAUDIO_T)pBuffer,
		uiSamplesToOutput << 1 );

	OP_LockMutex( phTTS->pcsQueuedSampleCount );
	phTTS->dwQueuedSampleCount += (DWORD)uiSamplesToOutput << 1;
	OP_UnlockMutex( phTTS->pcsQueuedSampleCount );

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

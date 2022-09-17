
/**********************************************************************/
/* Audio interface changes to integrate with DECtalk OLE software     */
/* Author : Murthy Parakala                                           */
/* Date   : December 08,1995                                          */
/*                                                                    */
/*      MMRESULT InitializeDECtalkAudio( HWND *, UINT);               */
/*                                                                    */
/*      MMRESULT PA_Queue( HWND, LPAUDIO_T, DWORD ); was QueueAudio   */
/*                                                                    */
/*      MMRESULT PA_DestroyPlayHandle( LPAUDIO_PARAMS_T );            */
/*                                                                    */
/* edit history:                                                      */
/* 1.  05nov96   TEK   change the OP_Sleep() argument                 */
/* 2.	21nov97		tek		Bats423; don't use messages to get        */
/*							get audio position.   (first done 01aug97)                    */
/* 3.	12nov97		tek		support for QW audio positions            */
/*							(+07aug97 stop kicking audio if in reset) */
/*							(+07aug97 pa_getPosition returns 0 if     */
/*                           the audio queue is still in a reset state*/
/*							(first done 04aug97)
//		13mar98		tek		sapi group h
/* 18mar98      cjl             Removed specific path for dectalkf.h. */
//		16mar98		tek		bats 608/609/620: audio format fixes
//		12may98		tek		bats 665: handle audio file destinations
//      20nov98		gl		BATS#828 use AUD_DEBUG to replace _DEBUG
//		13jan99		tek		bats850: use PumpModeMessage to help avoid hangs
/*		11dec01		mfg		added SMARTMEDIA Support
/*		18mar02		mfg		added NOWIN Support
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

//tek 13mar98
#include "dectalkf.h"

#include <windows.h>
#include <process.h>
#include <mmsystem.h>
#include <mmreg.h>
#include <string.h>
#include <malloc.h>
#include "mmalloc.h"
#include "port.h"
#include "audioapi.h"
#ifdef AUD_DEBUG
#include "kernel.h" // for ODS debug
#endif //AUD_DEBUG
/**********************************************************************/
/*  Symbol definitions used for Audio Queueing.                       */
/**********************************************************************/

#define  AUDIO_BUFFER_SIZE                  49608	// 32*1378 + 4*1378(2 Sec of audio + Extra buffer)
#define  MAXIMUM_WRITE_LENGTH               12402   // (1378*8)	(more than 1/2 sec of audio)
#define  STARTUP_WRITE_SIZE                 4134   //  (1378*3)
#define  MAXIMUM_BUFFERS_QUEUED                3
#define  MINIMUM_STARTUP_SAMPLES  1378  //MAXIMUM_BUFFERS_QUEUED * STARTUP_WRITE_SIZE
#define  TIMER_STARTUP_COUNT      MAXIMUM_BUFFERS_QUEUED - 1
#define  MAXIMUM_QUEUED_SIZE      AUDIO_BUFFER_SIZE - MAXIMUM_WRITE_LENGTH
#define  MAXIMUM_RESET_WAIT_IN_MSEC         5000
#define  SHUTDOWN_TIMEOUT_IN_MSEC           5000
#define  STARTUP_LOOP_WAIT_TIME               50
#define  MAX_STARTUP_WAIT_COUNT              200
#define  AUDIO_WAIT_SLEEP_TIME_IN_MSEC        50

#define	MINIMUM_FILE_SEND_SAMPLES	(1100) // tek 23sep98 for SAPI AudioFileDest

/**********************************************************************/
/*  Symbols for pAudioParams->uiAudioPlayState.                       */
/**********************************************************************/

#define  AUDIO_STATE_PLAY        0
#define  AUDIO_STATE_RESET       1

/**********************************************************************/
/*  Function prototypes (Function prototypes for functions used by    */
/*  applications are in file 'audioapi.h'.)                           */
/**********************************************************************/

MMRESULT PA_GetQWPosition(  LPAUDIO_PARAMS_T, QWORD *pwqTimeStamp); //tek 13mar98

static void DestroyAudioObjects( LPAUDIO_PARAMS_T );
static int InitializeAudioParams(LPAUDIO_PARAMS_T);
static void ResetAudioQueue( LPAUDIO_PARAMS_T pAudioParams );
// tek 01aug97 need this def for bats423
void AudActGetAudioPosition(LPAUDIO_PARAMS_T pAudioParams, DWORD *pdwPosition);
// tek 04aug97 need this for SAPI traansport: qw support
void AudActGetQWAudioPosition(LPAUDIO_PARAMS_T pAudioParams, QWORD *pqwPosition);
HRESULT AudActSetBookmark(LPAUDIO_PARAMS_T pAudioParams, DWORD dwMarkId); // tek 22aug97 bookmark timing
//MVP: 06/06/96 Added the Timer thread logic to fix the audio 
// cut off at the end of sentence. 
//For _beginthreadex,The threadmain function shoulbe of __stdcall 
static DWORD __stdcall TimerThreadMain( LPAUDIO_PARAMS_T );

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitializeAudioParams                                   */
/*  Author: Murthy Parakala                                           */
/*  Date: December 8, 1995                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function initializes the audio params structure            */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams       A pointer to AUDIO_PARAMS_T structure        */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if audio initialization was successful.      */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*                      -1   On error                                           */
/**********************************************************************/
/**********************************************************************/

static int InitializeAudioParams(LPAUDIO_PARAMS_T pAudioParams)
{
	LPQUEUE_T pAudioQueue = NULL;

	/********************************************************************/
	/*  Initialize some Audio parameter handles and flags.              */
	/********************************************************************/
	pAudioParams->bPaused = FALSE;
	pAudioParams->bTimerExit = FALSE;

	/********************************************************************/
	/*  Initialize the wave out device state flags.                     */
	/********************************************************************/

	pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
	pAudioParams->dwAudioPlayState = AUDIO_STATE_PLAY;

	/********************************************************************/
	/*  Set both audio position counts to zero.                         */
	/********************************************************************/

	pAudioParams->dwPositionBase = 0;
	pAudioParams->dwSamplesPlayed = 0;

	/********************************************************************/
	/*  Initialize several handle objects to NULL.                      */
	/********************************************************************/

	pAudioParams->pcsAudioDeviceState = NULL;
	pAudioParams->hQueueNotFull = NULL;
	pAudioParams->pcsQueueCount = NULL;
	pAudioParams->pcsQueueAudioBusy = NULL;
	pAudioParams->pAudioQueue = NULL;
	pAudioParams->hAudioDeviceInactive = NULL;
	pAudioParams->hAudioNotPaused = NULL;
	pAudioParams->hTimerThread = NULL;
	pAudioParams->hevTimerThreadActive = NULL;

	/********************************************************************/
	/*  Create the "Audio Device State" critical section object.        */
	/********************************************************************/

	pAudioParams->pcsAudioDeviceState =
		(LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

	if ( pAudioParams->pcsAudioDeviceState == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	InitializeCriticalSection( pAudioParams->pcsAudioDeviceState );

    /********************************************************************/
    /*  Create an "Timer Thread Active" event. The initial state is     */
    /*  signalled.                                                      */
    /********************************************************************/

    pAudioParams->hevTimerThreadActive = OP_CreateEvent( TRUE, TRUE );

    if ( pAudioParams->hevTimerThreadActive == NULL )
    {
      DestroyAudioObjects( pAudioParams );
      return MMSYSERR_ERROR;
    }

	/********************************************************************/
	/*  Create a "Queue Not Full" event. The initial state is signaled. */
	/********************************************************************/

	pAudioParams->hQueueNotFull = CreateEvent( NULL, TRUE, TRUE, NULL );

	if ( pAudioParams->hQueueNotFull == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}


	/********************************************************************/
	/*  Create an "Audio Device Inactive" event. The initial state is   */
	/*  signaled.                                                       */
	/********************************************************************/

	pAudioParams->hAudioDeviceInactive =
		CreateEvent( NULL, TRUE, TRUE, NULL );

	if ( pAudioParams->hAudioDeviceInactive == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	/********************************************************************/
	/*  Create an "Audio Not Paused" event. The initial state is        */
	/*  signaled.                                                       */
	/********************************************************************/

	pAudioParams->hAudioNotPaused =
		CreateEvent( NULL, TRUE, TRUE, NULL );

	if ( pAudioParams->hAudioNotPaused == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}
	
	/********************************************************************/
	/*  Create the "Queue Count" critical section object.               */
	/********************************************************************/

	pAudioParams->pcsQueueCount =
	(LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

	if ( pAudioParams->pcsQueueCount == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	InitializeCriticalSection( pAudioParams->pcsQueueCount );

	/********************************************************************/
	/*  Create the "Queue Audio Busy" critical section object.          */
	/********************************************************************/

	pAudioParams->pcsQueueAudioBusy =
	(LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

	if ( pAudioParams->pcsQueueAudioBusy == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	InitializeCriticalSection( pAudioParams->pcsQueueAudioBusy );


	/********************************************************************/
	/*  Allocate Memory for the Audio Queue Structure.                  */
	/********************************************************************/

	pAudioParams->pAudioQueue = (LPQUEUE_T)malloc(sizeof(QUEUE_T));

	if ( pAudioParams->pAudioQueue == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	pAudioQueue = pAudioParams->pAudioQueue;

	/********************************************************************/
	/*  Initialize all of the audio queue objects to NULL.              */
	/********************************************************************/

	/********************************************************************/
	/*  Allocate Memory for the audio buffer.                           */
	/********************************************************************/

	pAudioQueue->pQueueStart = (LPAUDIO_T)
	malloc(( AUDIO_BUFFER_SIZE) * sizeof(AUDIO_T));

	if ( pAudioQueue->pQueueStart == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return( -1 );
	}

	/********************************************************************/
	/*  Initialize the audio queue buffer start and length.             */
	/********************************************************************/
	pAudioQueue->iQueueLength = AUDIO_BUFFER_SIZE;

	/********************************************************************/
	/*  Initialize the audio queue and the completion count.            */
	/********************************************************************/

	ResetAudioQueue( pAudioParams );

	return MMSYSERR_NOERROR;
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitializeDECtalkAudio                                  */
/*  Author: Murthy Parakala                                           */
/*  Date: December 8, 1995                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function initializes the audio processing done within      */
/*    DECtalk system.(OLE version of DECtalk calls this function)     */
/*    TextToSpeechStartup API calls this routine.                                                                */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*    hWnd                A handle to speech engine mode window       */
/*                                                                    */
/*    ppAudioParams       A pointer to a pointer to AUDIO_PARAMS_T    */
/*                        structure                                   */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if audio initialization was successful.      */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NOMEM         Memory allocation error                  */
/*    MMSYSERR_ERROR         General failure                          */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT InitializeDECtalkAudio( HWND hWndMode,
								 LPAUDIO_PARAMS_T *ppAudioParams)
{
	LPAUDIO_PARAMS_T pAudioParams = NULL;
	DT_HANDLE hTimerThread = NULL;
	DWORD dwTimerThreadID;

	/*MVP : The below typedef is used in _beginthreadex function call */
	typedef unsigned int ( __stdcall * start_address )(void *);

  /*******************************************************/
  /*  Allocate memory for the Audio parameter structure. */
  /*******************************************************/

	*ppAudioParams = (LPAUDIO_PARAMS_T)malloc(sizeof(AUDIO_PARAMS_T));

	if ( *ppAudioParams == NULL )
	{
	  return( MMSYSERR_NOMEM );
	}

	pAudioParams = *ppAudioParams;

	pAudioParams->hModeWnd = hWndMode;
	
	if(InitializeAudioParams(*ppAudioParams) == -1)
		return(MMSYSERR_NOMEM); 
	//MVP:06/06/96 Timer thread is added   
	pAudioParams->hTimerThread = _beginthreadex( NULL,
							   0,
							   (start_address)TimerThreadMain,
							   (LPDWORD)pAudioParams,
							   0,
							   &dwTimerThreadID );

	if ( pAudioParams->hTimerThread == NULL )
	{
		DestroyAudioObjects( pAudioParams );
		return(MMSYSERR_NOMEM);
	}

	return MMSYSERR_NOERROR;
}

// tek 16mar98 bats 608/609/620
// we need this function here to provide support for mulaw dest objects..
// Note that mulaw isn't yet supported because I can't test it.
#define  MULAW_BIAS         0x84
#define  MULAW_CLIP_LEVEL  32635

static unsigned char LinearToMuLaw( short wSample )
{
  static short wExponentLut[256] = { 0,0,1,1,2,2,2,2,3,3,3,3,3,3,3,3,
					 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
					 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
					 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7 };
  short wSign;
  short wExponent;
  short wMantissa;
  unsigned char cMuLawByte;

  /********************************************************************/
  /*  Get the sample into sign-magnitude.                             */
  /*  First save the sign.                                            */
  /********************************************************************/

  wSign = ( wSample >> 8 ) & 0x80;

  /********************************************************************/
  /*  Get magnitude.                                                  */
  /********************************************************************/

  if ( wSign != 0 )
	wSample = - wSample;

  /********************************************************************/
  /*  Clip the magnitude.                                             */
  /********************************************************************/

  if ( wSample > MULAW_CLIP_LEVEL )
	wSample = MULAW_CLIP_LEVEL;

  /********************************************************************/
  /*  Convert from 16 bit linear to mu-law.                           */
  /********************************************************************/

  wSample = wSample + MULAW_BIAS;
  wExponent = wExponentLut[ ( wSample >> 7 ) & 0xFF ];
  wMantissa = ( wSample >> ( wExponent + 3 ) ) & 0x0F;
  cMuLawByte = ~ ( wSign | ( wExponent << 4 ) | wMantissa );

  /********************************************************************/
  /*  Optional CCITT trap                                             */
  /********************************************************************/

#ifdef ZEROTRAP
  if ( cMuLawByte == 0 )
	cMuLawByte = 0x02;
#endif //ZEROTRAP

  return( cMuLawByte );
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: QueueAudio                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function queues a buffer of samples to the wave       */
/*    output device. This function will block until there is enough   */
/*    space in the audio queue. The wave output device will open      */
/*    automatically. This will happen one of two ways. Either enough  */
/*    samples in the queue (MINIMUM_SAMPLES_TO_START) will cause this */
/*    function to send the ID_Open_Wave_Output_Device message, or if  */
/*    the queue sample count remains non-zero while the wave output   */
/*    device is closed, then after a sufficent amount of time, the    */
/*    timer thread will send the ID_Open_Wave_Output_Device message.  */
/*    The wave output device will also be closed automatically.       */
/*                                                                    */
/*         Each queued audio block MUST have a length that is a       */
/*    multiple of the current block alignment. If it does not, then   */
/*    the audio samples will still be added to the audio queue, but   */
/*    the audio driver may hang.                                      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd        The handle to the Audio window.                     */
/*                                                                    */
/*    pBuffer     A pointer (of type unsigned char) to a buffer that  */
/*                contains byte samples.                              */
/*                                                                    */
/*    dwLength    A DWORD which is equal to the number of bytes to be */
/*                queued which are in the buffer pointed to by        */
/*                "pBuffer".                                          */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    The queued audio size was larger then    */
/*                           MAXIMUM_QUEUED_SIZE or the audio window  */
/*                           is invalid.                              */
/*                                                                    */
/*                                                                    */
/*      ASYNCHRONOUS ERROR MESSAGES.                                  */
/*                                                                    */
/*         After QueueAudio() function is called, the audio thread    */
/*    may send error messages to the window procedure specified by    */
/*    the window handle passed in the OpenAudio() function. The user  */
/*    may wish to handle these messages. The message number will be   */
/*    pAudioParams->uiAudioErrorMessage. One of the error codes       */
/*    listed below will be contained in the wParam field of the       */
/*    message. The lParam field of the message will contain a value   */
/*    of type MMRESULT. An application may use the                    */
/*    waveOutGetErrorText() function to obtain a text string          */
/*    corresponding to the MMRESULT (lParam) error code.              */
/*                                                                    */
/*        wParam error code                                           */
/*                                                                    */
/*      ERROR_IN_AUDIO_WRITE                1                         */
/*      ERROR_OPENING_WAVE_OUTPUT_DEVICE    2                         */
/*      ERROR_GETTING_DEVICE_CAPABILITIES   3                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
// tek 16mar98 bats 608/609/620
// this routine performs the conversion to 8-bit as needed; doing this 
// conversion here allows us to keep a consistent view of audio position
// so that all of the indexing/syncing/etc will work correctly without
// having to adjust for somple size everywhere.

MMRESULT PA_Queue( LPAUDIO_PARAMS_T pAudioParams,
					 LPAUDIO_T pBuffer,
					 DWORD dwLength )
{
	DWORD dwWrap;
	DWORD dwRemaining;
	LPQUEUE_T pAudioQueue;
	BOOL	bRequestSend=FALSE;		//tek 16aug96 take SendMessage()
									//            out of critical sect
	BOOL	bTimerRequest=FALSE;	//            get this out of C.S. too.

	/******************************************************************/
	/*  Return an error if NULL handle.                               */
	/******************************************************************/

	if ( !pAudioParams)
		return( MMSYSERR_INVALPARAM );


	// check here for any necessary conversions..
	if (pAudioParams->bAudioIsEightBit)
	{
		int dwI;
		unsigned long ulTemp;
		unsigned char *ucDestBuf = (unsigned char *)pBuffer;
		short *sSrcBuf = (SHORT *)pBuffer;
		// readjust teh length to be "samples"..
		dwLength = dwLength>>1;
		// convert in place.. take the invariant compare out of the loop..
		if (pAudioParams->bAudioIsMulaw)
		{
			for (dwI=0;dwI<dwLength;dwI++)
			{
				ucDestBuf[dwI] = LinearToMuLaw(sSrcBuf[dwI]);
			}
		}
		else
		{
			// linear..
			for (dwI=0;dwI<dwLength;dwI++)
			{
				ulTemp = sSrcBuf[dwI]+32767;
				ucDestBuf[dwI] = ulTemp>>8;
			}
		}
	}


	/********************************************************************/
	/*  If too many samples then exit with error status.                */
	/********************************************************************/

	if ( dwLength > MAXIMUM_QUEUED_SIZE )
		return( MMSYSERR_INVALPARAM );

	pAudioQueue = pAudioParams->pAudioQueue;

	/********************************************************************/
	/*  Block if another thread is queueing audio or performing a       */
	/*  reset.                                                          */
	/********************************************************************/

	EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );


	/********************************************************************/
	/*  Wait for space in the queue before adding the new audio buffer. */
	/*  Block if another thread is manipulating the queue count.        */
	/********************************************************************/


	EnterCriticalSection( pAudioParams->pcsQueueCount );


	while ( pAudioQueue->iQueueCount + (int)dwLength > pAudioQueue->iQueueLength )
	{

		LeaveCriticalSection( pAudioParams->pcsQueueCount );
		LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

		ResetEvent( pAudioParams->hQueueNotFull );


		WaitForSingleObject( pAudioParams->hQueueNotFull, INFINITE );

		EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );
		EnterCriticalSection( pAudioParams->pcsQueueCount );

	}

//	LeaveCriticalSection( pAudioParams->pcsQueueCount );

	/********************************************************************/
	/*  There is enough space in the audio queue. Test to see if the    */
	/*  data will wrap around the circular queue.                       */
	/********************************************************************/

	if ( pAudioQueue->iInputPosition + (int)dwLength > pAudioQueue->iQueueLength )
	{
		/******************************************************************/
		/*  The data will wrap around the circular queue.                 */
		/******************************************************************/

		dwRemaining = pAudioQueue->iQueueLength - pAudioQueue->iInputPosition;

		/******************************************************************/
		/*  for ( i = 0; i < dwRemaining; i++ )                           */
		/*    *pAudioQueue->pQueueInput++ = *pBuffer++;                   */
		/******************************************************************/

		memcpy( pAudioQueue->pQueueInput, pBuffer, dwRemaining );

		pBuffer += dwRemaining;

		/******************************************************************/
		/*  Reset to the start of the audio queue.                        */
		/******************************************************************/

		pAudioQueue->pQueueInput = pAudioQueue->pQueueStart;

		/******************************************************************/
		/*  for ( i = dwRemaining; i < (int)dwLength; i++ )
		/*    *pAudioQueue->pQueueInput++ = *pBuffer++;
		/******************************************************************/

		dwWrap = dwLength - dwRemaining;

		memcpy( pAudioQueue->pQueueInput, pBuffer, dwWrap );

		pAudioQueue->pQueueInput += dwWrap;
		pAudioQueue->iInputPosition = (int)dwWrap;
	}
	else
	{
		/******************************************************************/
		/*  The data will NOT wrap around the circular queue.             */
		/******************************************************************/
		/******************************************************************/
		/*  for ( i = 0; i < (int)dwLength; i++ )                         */
		/*    *pAudioQueue->pQueueInput++ = *pBuffer++;                   */
		/******************************************************************/

		memcpy( pAudioQueue->pQueueInput, pBuffer, dwLength );

		pAudioQueue->pQueueInput += dwLength;
		pAudioQueue->iInputPosition += (int)dwLength;
	}

	/********************************************************************/
	/*  Atomically update the audio queue count.                        */
	/********************************************************************/
//	EnterCriticalSection( pAudioParams->pcsQueueCount );
	pAudioQueue->iQueueCount += (int)dwLength;

   /********************************************************************/
   /*  Atomically update the queued byte count.                        */
   /*  If audio is not playing then activate the timer thread.         */
   /********************************************************************/
    if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
    {
		bTimerRequest=TRUE;
    }

	/********************************************************************/
	/*  If the audio is not playing then start it playing if we         */
	/*  have enough available.                                          */
	/********************************************************************/

	if (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
	&& ( pAudioQueue->iQueueCount >= MINIMUM_STARTUP_SAMPLES )
	&& ( ! pAudioParams->bPaused ))
	{
		bRequestSend = TRUE;		
	}

	// tek 23sep98 this is the same test, but for the case of writing to 
	// a file. If we're writing to a file, we'd like to just start 
	// immediately and write as we generate samples; this helps avoid
	// a barrage of notifications back to the user at infrequent
	// intervals. Also cause a send every N samples, because the
	// buffer-done notifications are wierd for files..
	if ( ( pAudioParams->bAudioIsFile )
	&& ( ! pAudioParams->bPaused )  )
	{
		// if we haven't started..
		if ( pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_ACTIVE )
			bRequestSend = TRUE;
		if (pAudioQueue->iQueueCount >= MINIMUM_FILE_SEND_SAMPLES)
			bRequestSend = TRUE;
	}

	// tek 08aug97 sheck to see if we have to cover for a FreeSpace that
	// found no samples to send.. we can't wait for MINIMUM_STARTUP_SAMPLES
	// because we're in dire straits here..
	if (   ( pAudioParams->bAudioRanDry )
	    && ( pAudioQueue->iQueueCount > (MINIMUM_STARTUP_SAMPLES/2) )
	    && ( ! pAudioParams->bPaused )
	   )
	{
#ifdef AUD_DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"PA_Queue, detected RanDry; qcount=%d at %lu\n",
				pAudioQueue->iQueueCount,
				timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //AUD_DEBUG

		bRequestSend = TRUE;		
	}


	/********************************************************************/
	/*  Release the QueueAudio() function for use in another thread.    */
	/********************************************************************/
	LeaveCriticalSection( pAudioParams->pcsQueueCount );
	LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

	// tek 16aug96 check for timer request.. 
	if (bTimerRequest)
	{
      OP_SetEvent( pAudioParams->hevTimerThreadActive );
	}

	// tek 16aug96 see if we need to kick off..
	// tek 07aug97 this need to NOT happen if we've started reset..
	// tek 08aug97 also shouldn't happen if our last request hasn't been
	// processed yet.
	if (bRequestSend 
		&& !pAudioParams->bSendSamplesRequested
		&& !pAudioParams->bInAudioReset)
	{
#ifdef AUD_DEBUG // tek 08aug97
		{
			char szTemp[256]="";
			sprintf(szTemp,"PA_Queue, kicking audio at %lu\n",
				timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //AUD_DEBUG

		// tek 08aug97 set the flag that tells us we have a send 
		// request pending, so that we don't send a barrage of them
		// while waiting for the first message to be delivered..
		pAudioParams->bSendSamplesRequested = TRUE;
		// tek 16aug96 post message? 
		// tek 08aug97 if we've run dry, we need to send these samples NOW..
		// so use SendMessage in that case.
		if (pAudioParams->bAudioRanDry)
		{
			SendMessage( pAudioParams->hModeWnd,
				 ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
				 0,
				 0L );
		}
		else
		{
			PostMessage( pAudioParams->hModeWnd,
				 ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
				 0,
				 0L );
			Sleep(0);
		}

	}

	return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ResetAudioQueue                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function initializes all of the audio queue           */
/*    parameters to the queue empty state.                            */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams  A pointer to a structure of type AUDIO_PARAMS_T.  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void ResetAudioQueue( LPAUDIO_PARAMS_T pAudioParams )
{
  LPQUEUE_T pAudioQueue;

  // tek 15aug96 should this stuff be in a critical sect?
  EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );

  pAudioQueue = pAudioParams->pAudioQueue;
  pAudioQueue->pQueueInput = pAudioQueue->pQueueStart;
  pAudioQueue->pQueueOutput = pAudioQueue->pQueueStart;
  pAudioQueue->iInputPosition = 0;
  pAudioQueue->iOutputPosition = 0;
  pAudioQueue->iQueueCount = 0;

  SetEvent( pAudioParams->hQueueNotFull );
  LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );


  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ResetAudio                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function stops any audio which is playing and resets  */
/*    the audio queue. A reset may be delayed if another thread       */
/*    has called the QueueAudio() function.                           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the Audio window.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
//MVP: was ResetAudio : After new audio it is 
MMRESULT PA_Reset( LPAUDIO_PARAMS_T pAudioParams)
{
	MMRESULT mmStatus =0;


	if ( pAudioParams == NULL )
		return( MMSYSERR_INVALPARAM );

	/********************************************************************/
	/*  Block if another thread is queueing audio.                      */
	/********************************************************************/
	EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );

	/********************************************************************/
	/*  Reset the audio queue to the empty state.                       */
	/********************************************************************/
				  
	ResetAudioQueue( pAudioParams );
	
	/********************************************************************/
	/*  Set both audio position counts to zero.                         */
	/********************************************************************/

	pAudioParams->dwPositionBase = 0;
	pAudioParams->dwSamplesPlayed = 0;

	/********************************************************************/
	/*  Release the audio queue.                                        */
	/********************************************************************/

	LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

	return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_DestroyPlayHandle                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function destroys the audio thread and frees all audio     */
/*    objects.                                                        */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams    A pointer to AUDIO_PARAMS_T structure.          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
//MVP : was CloseAudio :After new Audio it is 
MMRESULT PA_DestroyPlayHandle( LPAUDIO_PARAMS_T pAudioParams)
{
  /********************************************************************/
  /*  Cancel audio output and close the wave output device. The first */
  /*  reset will stop any audio playing but will not close the wave   */
  /*  output device if the device is owned by the application.        */
  /********************************************************************/

  PA_Reset( pAudioParams );
#ifdef AUD_DEBUG
  {
	  char szTemp[256];
	  sprintf(szTemp,"PA_DestroyPlayHandle requesting hModeWnd shutdown at %llu\n",
		  timeGetTime());
	  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG

  // tek 21sep98 just using DestroyWindow may cause a memoryleak,
  // because some Visual messages may still be in process. So, *send* a 
  // null message, which will make sure any prior messages make it
  // through before things go away.
  SendMessage(pAudioParams->hModeWnd, ID_Null, 0, 0);

  DestroyWindow(pAudioParams->hModeWnd); // MVP: This sends WM_DESTROY
										 // message to ModeWnd
  return( MMSYSERR_NOERROR );
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DestroyAudioObjects                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function de-allocates all audio objects in the audio       */
/*    handle                                                          */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    LPAUDIO_PARAMS_T    A pointer to the Audio params structure.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DestroyAudioObjects(LPAUDIO_PARAMS_T pAudioParams)
{
	LPQUEUE_T pAudioQueue = NULL;
    THREAD_STATUS_T ThreadStatus;

	/********************************************************************/
	/*  Return if NULL handle.                                          */
	/********************************************************************/

	if (!pAudioParams)
		return;

    /******************************************************************/
    /*  Cause the timer thread to exit.                               */
    /******************************************************************/

    if ( pAudioParams->hTimerThread != NULL )
    {
       pAudioParams->bTimerExit = TRUE;

       if ( pAudioParams->hevTimerThreadActive != NULL )
       {
         OP_SetEvent( pAudioParams->hevTimerThreadActive );
       }

       OP_WaitForThreadTermination( pAudioParams->hTimerThread,
                                   &ThreadStatus );
    }

	SetEvent( pAudioParams->hAudioDeviceInactive );
	SetEvent( pAudioParams->hAudioNotPaused );

	/******************************************************************/
	/*  Free the Audio Queue memory.                                  */
	/******************************************************************/

	pAudioQueue = pAudioParams->pAudioQueue;

	if ( pAudioQueue != NULL )
	{
	  /****************************************************************/
	  /*  Free Memory for the Audio Queue sample buffer.              */
	  /****************************************************************/

	  if ( pAudioQueue->pQueueStart != NULL )
		free( pAudioQueue->pQueueStart );

	  /****************************************************************/
	  /*  Free Memory for the Audio Queue Structure.                  */
	  /****************************************************************/

	  free( pAudioQueue );
	}

	/******************************************************************/
	/*  Free the "Queue Audio Busy" critical section object.          */
	/******************************************************************/

	if ( pAudioParams->pcsQueueAudioBusy != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsQueueAudioBusy );
	  free( pAudioParams->pcsQueueAudioBusy );
	}

	/******************************************************************/
	/*  Free the "Queue Count" critical section object.               */
	/******************************************************************/

	if ( pAudioParams->pcsQueueCount != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsQueueCount );
	  free( pAudioParams->pcsQueueCount );
	}

	 /******************************************************************/
	/*  Free the "Audio Device State" critical section object.        */
	/******************************************************************/

	if ( pAudioParams->pcsAudioDeviceState != NULL )
	{
	  DeleteCriticalSection( pAudioParams->pcsAudioDeviceState );
	  free( pAudioParams->pcsAudioDeviceState );
	}

   /******************************************************************/
	/*  Free the handle to the "Queue Not Full" event.                */
	/******************************************************************/

	if ( pAudioParams->hQueueNotFull != NULL )
	  CloseHandle( pAudioParams->hQueueNotFull );

    /******************************************************************/
    /*  Destroy the "Timer Thread Active" event.                      */
    /******************************************************************/

    OP_DestroyEvent( pAudioParams->hevTimerThreadActive );

	/******************************************************************/
	/*  Free the handle to the "Audio Not Paused" event.              */
	/******************************************************************/

	if ( pAudioParams->hAudioNotPaused != NULL )
	  CloseHandle( pAudioParams->hAudioNotPaused );

	/******************************************************************/
	/*  Free the handle to the "Audio Device Inactive" event.         */
	/******************************************************************/

	if ( pAudioParams->hAudioDeviceInactive != NULL )
	  CloseHandle( pAudioParams->hAudioDeviceInactive );

	/******************************************************************/
	/*  Free the audio handle.                                        */
	/******************************************************************/
	free( pAudioParams );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Thread Main: TimerThreadMain                                      */
/*  Author: Bill Hallahan                                             */
/*  Date: May 18, 1993                                                */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This thread task is started in the OpenAudio() function.   */
/*    If audio samples remain in the queue for too long then a        */
/*    message will be sent to flush the audio queue.                  */
/*                                                                    */
/*                                                                    */
/*  Input: (Thread start parameter)                                   */
/*                                                                    */
/*    pAudioParams   A pointer to a structure of type AUDIO_PARAMS_T. */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  TIMER_SLEEP_TIME_IN_MSEC          10
#define  QUEUE_FLOW_CHECK_TIME_IN_MSEC    10
#define	UNCLAIM_CHECK_SLEEP_TIME		(100) // tek 03sep97 

static DWORD __stdcall TimerThreadMain( LPAUDIO_PARAMS_T pAudioParams )
{
  LPQUEUE_T pAudioQueue = pAudioParams->pAudioQueue;
#ifndef SAPI_GROUP_H_TIMING
  unsigned int uiLastQueueCount;
  unsigned int uiCurrentQueueCount;
#else // SAPI_GROUP_H_TIMING
  unsigned int uiLastQueueCount=0;
  unsigned int uiCurrentQueueCount=0;
  DWORD	dwLastTotalGet=0;	// tek 05mar98
  DWORD dwCurrentTotalGet=0;
  QWORD qwTemp;
#endif // SAPI_GROUP_H_TIMING
  unsigned int uiStartupTimeoutTime;

  /******************************************************************/
  /******************************************************************/
  /*  If audio is NOT playing and the system is NOT paused and      */
  /*  there are samples in the queue then test to see if it will    */
  /*  be necessary to start playing audio.                          */
  /******************************************************************/

  /******************************************************************/
  /********************************************************************/
  /*  Initialize the timer count to 0. This is used to count the      */
  /*  number of consecutive times that audio is in the queue and the  */
  /*  audio device is not active.                                     */
  /********************************************************************/

//  unsigned int uiElapsedTime = 0;

  /********************************************************************/
  /*  Loop forever until thread shutdown time.                        */
  /********************************************************************/
  while( ! pAudioParams->bTimerExit )
  {

	/******************************************************************/
	/*  Calculate how long to sleep.                                  */
	/******************************************************************/
	  //(double)pAudioParams->pWaveFormat->nSamplesPerSec 
	uiStartupTimeoutTime = (unsigned int)( 500.0 *
	  (double)(MINIMUM_STARTUP_SAMPLES) / 11025 );

    /******************************************************************/
    /*  Limit the total startup check wait time to 1/2 second.        */
    /******************************************************************/

	if ( uiStartupTimeoutTime > 250)
	{
	  uiStartupTimeoutTime = 250;
	}
    
    //tek 05nov96 shouldn't we sit and wait until we are active?
	// if there are no samples waiting, then we should be able to just sleep.
	// unfortunately, nobody ever wrote down what this was supposed to do..
	if (pAudioQueue->iQueueCount == 0)
		OP_Sleep(2*TIMER_SLEEP_TIME_IN_MSEC);
	 else
		OP_WaitForEvent(pAudioParams->hevTimerThreadActive,
				QUEUE_FLOW_CHECK_TIME_IN_MSEC);
         /*
		OP_Sleep(uiStartupTimeoutTime);
	 else
		OP_WaitForEvent(pAudioParams->hevTimerThreadActive,uiStartupTimeoutTime); 
          */
	// end tek 05nov96
	
	// tek 03sep97
	// in some cases (like short utterances) we can run out of samples
	// to send before we process the message that set m_bTextDataDone;
	// the audio dest seems to get confused and forgets to send us another
	// FreeSpace notification after we find out we have no more to send, 
	// so we have to watch here to make sure that we do the unclaim.
#ifdef SAPI_GROUP_H_TIMING
	 // tek 05mar98 this may also be the unclaim mechanism in some other cases,
	 // as well.. It is getting spuriously tripped (causing stuttering)
	 // when we use audio bookmarking, so I've made it less agressive in shutting
	 // down..
#endif // SAPI_GROUP_H_TIMING
	if (   (pAudioQueue->iQueueCount == 0)
		&& (pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE)
	   )
	{
		// we're done; this will do all the relevant checking and 
		// unclaim.	  Sleep first, though, to make sure things are settled
		// down.
			OP_Sleep(UNCLAIM_CHECK_SLEEP_TIME);
		// and recheck that we should stop..
#ifdef SAPI_GROUP_H_TIMING

		// find our place in the buffer
		dwLastTotalGet = dwCurrentTotalGet;
		PA_GetQWPosition(pAudioParams,&qwTemp);
		dwCurrentTotalGet = (DWORD)qwTemp;			

#endif // SAPI_GROUP_H_TIMING
		if (   (pAudioQueue->iQueueCount == 0)
			&& (pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE)
			)
#ifdef SAPI_GROUP_H_TIMING
		{
			// sleep again, and try again
			OP_Sleep(UNCLAIM_CHECK_SLEEP_TIME);
			PA_GetQWPosition(pAudioParams,&qwTemp);
			dwCurrentTotalGet = (DWORD)qwTemp;
		}

		if (   (pAudioQueue->iQueueCount == 0)
			&& (dwCurrentTotalGet == dwLastTotalGet)
			&& (pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE)
			)
#endif // SAPI_GROUP_H_TIMING

		{
#ifdef AUD_DEBUG
			{
				char szTemp[256]="";
				sprintf(szTemp,"request unclaim check at %lu\n",
					timeGetTime());
				OutputDebugString(szTemp);
			}
#endif //AUD_DEBUG
			PostMessage( pAudioParams->hModeWnd,
				 ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
				 0,
				 0L );
			Sleep(0);

		}
	}



    while (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
      && ( pAudioQueue->iQueueCount > 0 ))
    {
      /****************************************************************/
      /*  Wait for "uiStartupTimeoutTime" milliseconds.               */
      /****************************************************************/

 //     uiElapsedTime = 0;
 //     uiFlowCheckTime = 0;
        uiLastQueueCount = pAudioQueue->iQueueCount;

      //while (( uiElapsedTime < uiStartupTimeoutTime )
      //  && ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE ))

      //if( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
      //{
        //OP_Sleep( TIMER_SLEEP_TIME_IN_MSEC );
        OP_Sleep( uiStartupTimeoutTime );

        //uiElapsedTime += TIMER_SLEEP_TIME_IN_MSEC;
        //uiFlowCheckTime += TIMER_SLEEP_TIME_IN_MSEC;

        /**************************************************************/
        /*  If the queue input flow rate to the PA_Queue() function   */
        /*  has been slower than real-time over the entire            */
        /*  QUEUE_FLOW_CHECK_TIME_IN_MSEC interval then start the     */
        /*  open now.                                                 */
        /**************************************************************/

        //if ( uiFlowCheckTime > QUEUE_FLOW_CHECK_TIME_IN_MSEC )
        //{
        uiCurrentQueueCount = (unsigned int)pAudioQueue->iQueueCount;

        if ( uiCurrentQueueCount == uiLastQueueCount )
        {
             /****************************************************************/
             /*  If audio is still NOT playing and there are samples in the  */
             /*  audio queue then start playing audio. It does not matter    */
             /*  that all of the tests this section of code are not          */
             /*  protected by mutex's. This is because an unnecessary        */
             /*  ID_Open_Wave_Output_Device messages will be discarded in    */
             /*  the "play audio" thread.                                    */
             /****************************************************************/

             if (( pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_ACTIVE )
                && ( pAudioQueue->iQueueCount > 0 ))
             {

		         SendMessage( pAudioParams->hModeWnd,
				      ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE,
				      0,
				      0L );
             }
                break;
        }

          uiLastQueueCount = uiCurrentQueueCount;
        //  uiFlowCheckTime = 0;
        //}
      //}

      /****************************************************************/
      /*  If the audio device starts playing then exit this loop.     */
      /****************************************************************/

      if ( pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE )
      {
        break;
      }


      /****************************************************************/
      /*  Test for thread shutdown. Shutdown is caused by the         */
      /*  PA_DestroyPlayHandle() function.                            */
      /****************************************************************/

      if ( pAudioParams->bTimerExit )
      {
        break;
      }
      
#if 0
	  if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
      {
        OP_ResetEvent( pAudioParams->hevTimerThreadActive );
      }
      else
      {
        if ( pAudioQueue->iQueueCount == 0 )
        {
          OP_ResetEvent( pAudioParams->hevTimerThreadActive );
        }
      }

      /******************************************************************/
      /*  Wait for the thread to unblock.                               */
      /******************************************************************/
#endif

      //OP_WaitForEvent( pAudioParams->hevTimerThreadActive, OP_INFINITE );
      OP_WaitForEvent( pAudioParams->hAudioDeviceInactive, OP_INFINITE );

	  /******************************************************************/
      /*  Test for thread shutdown. Shutdown is caused by the           */
      /*  PA_DestroyPlayHandle() function.                              */
      /******************************************************************/

      if ( pAudioParams->bTimerExit )
      {
        break;
      }

    }

  }
  /********************************************************************/
  /*  Exit the thread.                                                */
  /********************************************************************/
  OP_ExitThread( 0 );

  OP_THREAD_RETURN;
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaitForAudioToComplete                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: June 24, 1994                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function will block until all queued audio samples have    */
/*    been played.                                                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the Audio window.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_WaitForPlayToComplete( LPAUDIO_PARAMS_T pAudioParams)
{
  int iQueueCount;
  BOOL bAudioPlaying;
  LPQUEUE_T pAudioQueue;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Loop and wait for all queued audio samples to complete.         */
  /********************************************************************/

  pAudioQueue = pAudioParams->pAudioQueue;
  bAudioPlaying = TRUE;

  while( bAudioPlaying )
  {
	/******************************************************************/
	/*  Wait on the hAudioDeviceInactive Event.                       */
	/******************************************************************/

	WaitForSingleObject( pAudioParams->hAudioDeviceInactive, INFINITE );

	/******************************************************************/
	/*  Check the Audio Queue Count. If there is any audio to be      */
	/*  played then go to sleep and contine to wait.                  */
	/******************************************************************/

	EnterCriticalSection( pAudioParams->pcsQueueCount );
	iQueueCount = pAudioQueue->iQueueCount;
	LeaveCriticalSection( pAudioParams->pcsQueueCount );

	if ( iQueueCount == 0 )
	{
	  bAudioPlaying = FALSE;
	}
	else
	{
	  Sleep( AUDIO_WAIT_SLEEP_TIME_IN_MSEC );
	}
  }
  return( MMSYSERR_NOERROR );
}




/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetAudioPosition                                        */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns the position of the last byte sample */
/*    played by the wave output device since either the OpenAudio()   */
/*    function or the ResetAudio() function was called. At a sample   */
/*    rate of 11025 Hz. the 32 bit position count will not wrap back  */
/*    to zero in over 100 hours.                                      */
/*                                                                    */
/*         There are two modes of operation which may be specified    */
/*    by the boolean flag bFast. If bFast is FALSE then the function  */
/*    will send a message to the audio thread which will then get     */
/*    a very accurate audio position (accurate at the time the        */
/*    message is processed). If bFast is TRUE then the function will  */
/*    return a coarse audio position. This audio position will be     */
/*    the sum of all sample blocks which have been returned in an     */
/*    MM_WOM_DONE message. Since as many as MAXIMUM_WRITE_LENGTH      */
/*    samples may be written to the wave output device in a call to   */
/*    the waveOutWrite() function, and the previous write may not     */
/*    have completed, the accuracy of this call is limited. In this   */
/*    case the function will return extremely fast.                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd         The handle to the Audio window.                    */
/*                                                                    */
/*    pdwPosition   A pointer to a DWORD which will contain the       */
/*                  device position. The device position is the       */
/*                  sample number of the last audio byte sample that  */
/*                  has played since a call to the OpenAudio()        */
/*                  function or the ResetAudio() function. If the     */
/*                  device is not available or the audio position     */
/*                  query is not supported then 0xFFFFFFFF is         */
/*                  returned.                                         */
/*                                                                    */
/*    bFast         A boolean which determines this functions         */
/*                  accuracy and execution speed. If bFast is TRUE    */
/*                  then this function will return a coarse audio     */
/*                  position. This audio position will be the sum of  */
/*                  all sample blocks which have been returned in an  */
/*                  MM_WOM_DONE message. Since as many as             */
/*                  MAXIMUM_WRITE_LENGTH samples may be written to    */
/*                  the wave output device in a call to the           */
/*                  waveOutWrite() function, and the previous write   */
/*                  may not have completed, the accuracy of this call */
/*                  is limited, however, the function will return     */
/*                  extremely fast. If bFast is FALSE then the        */
/*                  waveOutGetPosition() function will be used to     */
/*                  obtain the audio sample position.                 */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_GetPosition( LPAUDIO_PARAMS_T pAudioParams,
						   LPDWORD pdwPosition,
						   BOOL bFast )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  // tek bats665 12may98 if this is a file destination, get the
  // total time (because PosnGet won't work). Do this with
  // GetQWPosition, because that is consistent with all other
  // position consumers.
  // well, maybe. What we really want is the amount of stuff that
  // has been written; to get this, we have to subtract off what
  // is still in the queue (which gets added in by GetQW)
  if (pAudioParams->bAudioIsFile)
  {
	  QWORD qwPosition=0;
	  DWORD dwQueueCount=0;
	  mmStatus = PA_GetQWPosition(pAudioParams,&qwPosition);
	  // we really don't need to take the critical section 
	  // on the queue count here, because the only contention
	  // that is possible is when a write occurs between the
	  // above get and the below count - but the net result
	  // will be the same. The goal of this code is to return
	  // a position that is no further than what was actually
	  // sent to the file.
	  dwQueueCount = (DWORD)pAudioParams->pAudioQueue->iQueueCount;
	  *pdwPosition = (DWORD)qwPosition - dwQueueCount;
	  return mmStatus;
  }

  /********************************************************************/
  /*  Either get a quick coarse position or a slower but more         */
  /*  accurate position.                                              */
  /********************************************************************/

  if ( bFast )
  {
	/******************************************************************/
	/*  Get the coarse wave output position.(MVP :NEVER USED commented)*/
	/******************************************************************/

	mmStatus = MMSYSERR_NOERROR;
  /*
	EnterCriticalSection( pAudioParams->pcsSamplesPlayed );
	*pdwPosition = pAudioParams->dwSamplesPlayed;
	LeaveCriticalSection( pAudioParams->pcsSamplesPlayed );
  */
  }
  else
  {
	/******************************************************************/
	/*  Get the fine wave output position.                            */
	/******************************************************************/
	// tek 01aug97 bats 423 
	// don't use messages to get this info.
	AudActGetAudioPosition(pAudioParams,pdwPosition);	 // tek 01jul97
	mmStatus = MMSYSERR_NOERROR;

	//mmStatus = (MMRESULT)SendMessage( pAudioParams->hModeWnd,
	//								  ID_Get_Audio_Position,
	//								  0,
	//								  (LPARAM)pdwPosition );
  }
  return( mmStatus );
}

// tek 04aug97 sapi fixes
// this new (sapi-only) function provides support for quadword position
// information.
MMRESULT PA_GetQWPosition( LPAUDIO_PARAMS_T pAudioParams,
						   QWORD *pqwPosition)
{
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  AudActGetQWAudioPosition(pAudioParams,pqwPosition);
#ifdef AUD_DEBUG
  {
	  char szTemp[256]="";
	  sprintf(szTemp,"PA_GetQWPosition pos=%lu at %lu\n",
		  (DWORD)(*pqwPosition), timeGetTime());
	  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG
  return(MMSYSERR_NOERROR);

}
// tek 22aug97 this SAPI=only function sets an audio bookmark for 
// use in timing WordPos/BookMark/Visual
HRESULT PA_SetBookmark(LPAUDIO_PARAMS_T pAudioParams,
					   DWORD dwMarkId)
{
	// tek bats665 12may98 Don't even try to do this if we're
	// talking to a file..
	if (pAudioParams->bAudioIsFile)
	{
		return MMSYSERR_ERROR;
	}
	return AudActSetBookmark(pAudioParams, dwMarkId);
}


MMRESULT PA_GetVolume( LPAUDIO_PARAMS_T pAudioParams, LPDWORD pdwVolume )
{

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Get the wave output device volume.                              */
  /********************************************************************/

  return((MMRESULT)SendMessage( pAudioParams->hModeWnd,
								ID_Get_Audio_Volume,
								0,
								(LPARAM)pdwVolume ));
}



MMRESULT PA_SetVolume( LPAUDIO_PARAMS_T pAudioParams, DWORD dwVolume )
{
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if (pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Set the wave output device volume.                              */
  /********************************************************************/

  return((MMRESULT)SendMessage( pAudioParams->hModeWnd,
								ID_Set_Audio_Volume,
								0,
								(LPARAM)dwVolume ));
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetAudioParams                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: May 31, 1994                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns the sample rate and the number of    */
/*    channels currently set for the audio device.                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd           The handle to the Audio window.                  */
/*                                                                    */
/*    pWaveFormat    A pointer to a structure of type WAVEFORMATEX    */
/*                   that is used to return the current audio device  */
/*                   parameters.                                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_GetFormat( LPAUDIO_PARAMS_T pAudioParams, 
						 LPWAVEFORMATEX pWaveFormat )
{

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Get the audio parameters.                                       */
  /********************************************************************/

  return((MMRESULT)SendMessage( pAudioParams->hModeWnd,
								ID_Get_Audio_Params,
								0,
								(LPARAM)pWaveFormat ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SetAudioParams                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: May 31, 1994                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sets the sample rate and the number of       */
/*    channels for the audio device. The audio device MUST not be     */
/*    playing when this function is called or an error will be        */
/*    returned.                                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd           The handle to the Audio window.                  */
/*                                                                    */
/*    pWaveFormat    A pointer to a structure of type WAVEFORMATEX    */
/*                   that is used to set the current audio device     */
/*                   parameters.                                      */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_SetFormat( LPAUDIO_PARAMS_T pAudioParams, 
						 LPWAVEFORMATEX pWaveFormat )
{
#ifdef OLEDECTALK	// tek 16mar98 this should never, ever be called in SAPI;
					// it doesn't work, and only exists for playing wave
					// files .. which SAPI can't do.
	return MMSYSERR_ERROR;
#else //OLEDECTALK
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Set the audio parameters.                                       */
  /********************************************************************/

  return((MMRESULT)SendMessage( pAudioParams->hModeWnd,
								ID_Set_Audio_Params,
								0,
								(LPARAM)pWaveFormat ));
#endif //OLEDECTALK
}

/****************** The below code is not meant for OLE-DECtalk*************/
#if PLAINDECTALK
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: StatusAudio                                             */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         Function StatusAudio() returns selected status information */
/*    about the audio system.                                         */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd                A handle to the Audio window.               */
/*                                                                    */
/*    dwIdentifierArray   An array of values of type DWORD which      */
/*                        contain identifiers that specify the status */
/*                        values to return in array dwStatusArray[].  */
/*                        These values may be one of the following    */
/*                        constants:                                  */
/*                                                                    */
/*      constant               status return value                    */
/*                                                                    */
/*  AUDIO_DEVICE_PLAYING  Returns a value of TRUE if the audio device */
/*                        is either starting up, playing, or shutting */
/*                        down, and returns a value of FALSE if the   */
/*                        audio device is inactive.                   */
/*                                                                    */
/*  AUDIO_QUEUE_COUNT     The number of samples remaining in the      */
/*                        audio queue is returned. This will go to    */
/*                        zero before all of the audio has completed  */
/*                        playing.                                    */
/*                                                                    */
/*  AUDIO_DEVICE_ID       This is used to return the selected wave    */
/*                        output device ID when WAVE_MAPPER was used  */
/*                        as the device ID. If no wave output device  */
/*                        is open then the last used wave output      */
/*                        device is returned. At startup 0 is         */
/*                        returned.                                   */
/*                                                                    */
/*    dwStatusArray       An array of type DWORD which will contain   */
/*                        the status values corresponding to each of  */
/*                        identifiers in array dwIdentifierArray[].   */
/*                                                                    */
/*                                                                    */
/*    dwNumberOfStatusValues  A DWORD which equals the number of      */
/*                            status values to return.                */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/*    A status value of 0xFFFFFFFF is returned in array               */
/*    dwStatusArray[] if the corresponding passed parameter           */
/*    dwIdentifierArray[] is invalid. The function will then return   */
/*    a non-zero MMRESULT value. Note that 0xFFFFFFFF may be a        */
/*    legitimate status value and will not necessarily indicate an    */
/*    error.                                                          */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  MAXIMUM_STATUS_VALUES  2

MMRESULT StatusAudio( HWND hWnd,
					  DWORD dwIdentifierArray[],
					  DWORD dwStatusArray[],
					  DWORD dwNumberOfStatusValues )
{
  UINT i;
  DWORD dwAudioDeviceState;
  LPQUEUE_T pAudioQueue;
  MMRESULT mmStatus;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( hWnd == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  Range check the number of status values requested.              */
  /********************************************************************/

  if (( dwNumberOfStatusValues == 0 )
	|| ( dwNumberOfStatusValues > MAXIMUM_STATUS_VALUES ))
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Set the default error return value to indicate success.         */
  /********************************************************************/

  mmStatus = MMSYSERR_NOERROR;

  /********************************************************************/
  /*  Loop and fill in array puiStatus[].                             */
  /********************************************************************/

  for ( i = 0; i < dwNumberOfStatusValues; i++ )
  {
	switch( dwIdentifierArray[i] )
	{
	case AUDIO_DEVICE_PLAYING:

	  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
	  dwAudioDeviceState = pAudioParams->dwAudioDeviceState;
	  LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	  if ( dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
		dwStatusArray[i] = FALSE;
	  else
		dwStatusArray[i] = TRUE;

	  if ( pAudioParams->pAudioQueue->iQueueCount != 0 )
		dwStatusArray[i] = TRUE;

	  break;

	case AUDIO_QUEUE_COUNT:

	  pAudioQueue = pAudioParams->pAudioQueue;

	  EnterCriticalSection( pAudioParams->pcsQueueCount );
	  dwStatusArray[i] = (DWORD)pAudioQueue->iQueueCount;
	  EnterCriticalSection( pAudioParams->pcsQueueCount );

	  break;

	case AUDIO_DEVICE_ID:

	  EnterCriticalSection( pAudioParams->pcsSelectedDeviceID );
	  dwStatusArray[i] = (DWORD)pAudioParams->uiSelectedDeviceID;
	  LeaveCriticalSection( pAudioParams->pcsSelectedDeviceID );

	  break;

	default:

	  dwStatusArray[i] = 0xFFFFFFFF;
	  mmStatus = MMSYSERR_INVALPARAM;

	  break;
	}
  }
  return( mmStatus );
}




/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: EnableAudioErrorMessage                                 */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function enables the audio error handler to send a         */
/*    message.                                                        */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the Audio window.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT EnableAudioErrorMessage( HWND hWnd )
{
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( hWnd == NULL )
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Re-enable error messages in the audio thread. The audio thread  */
  /*  disables the audio error handler after sending a message. This  */
  /*  is done to ensure that the application only receives at most    */
  /*  only one error message before calling the                       */
  /*  EnableAudioErrorMessage() function. Otherwise a message would   */
  /*  be sent each time the audio thread was unable to open the audio */
  /*  device.                                                         */
  /********************************************************************/

  SendMessage( hWnd,
			   ID_Enable_Error_Message,
			   0,
			   0 );

  return( MMSYSERR_NOERROR );
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Window Procedure: AudioWndProc                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: March 29, 1993                                              */
/*                                                                    */
/*  Audio Output Window Procedure.                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT CALLBACK AudioWndProc( HWND hWnd,
									  UINT message,
									  WPARAM wParam,
									  LPARAM lParam )
{
  switch( message )
  {

  /********************************************************************/
  /*  The MM_WOM_CLOSE message is received when the waveOutClose()    */
  /*  function completes closing the waveform output device.          */
  /*  pAudioParams->dwAudioDeviceState is set to                      */
  /*  AUDIO_DEVICE_INACTIVE in the                                    */
  /*  Process_Process_MM_WOM_DONE_Message() function after the call   */
  /*  to the waveOutClose() function.                                 */
  /********************************************************************/

  case MM_WOM_CLOSE:

	return( Process_MM_WOM_CLOSE_Message( hWnd ));

  /********************************************************************/
  /*  The ID_Enable_Error_Message enables the AudioSendError()        */
  /*  function.                                                       */
  /********************************************************************/

  case ID_Enable_Error_Message:

	return( ProcessEnableErrorMessage( hWnd ));

  /********************************************************************/
  /*  The WM_DESTROY message is used to destroy a window.             */
  /********************************************************************/
#ifdef NONOLE
  case WM_DESTROY:

	DestroyAudioObjects( hWnd );
#endif
	PostQuitMessage( 0 );

	break;

  default:
	break;
  }

#ifdef NOWIN
  return (0);
#else
  return( DefWindowProc( hWnd, message, wParam, lParam ));
#endif

}






/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: Process_MM_WOM_CLOSE_Message                            */
/*  Author: Bill Hallahan                                             */
/*  Date: March 14, 1994                                              */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function is called when windows receives an           */
/*    MM_WOM_CLOSE message.                                           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      The window handle.                                    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT Process_MM_WOM_CLOSE_Message( HWND hWnd )
{
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  pAudioParams->hWaveOut = NULL;

  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
  pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
  LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

  SetEvent( pAudioParams->hAudioDeviceInactive );

  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: CloseAudioDevice                                        */
/*  Author: Bill Hallahan                                             */
/*  Date: August 19, 1993                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function closes the audio device if the device        */
/*    is not owned by the application. Otherwise the device close     */
/*    is simulated but the audio device is not actually released.     */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams   A pointer to a structure of type AUDIO_PARAMS_T. */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void CloseAudioDevice( LPAUDIO_PARAMS_T pAudioParams )
{
  DWORD dwPosition;

  /********************************************************************/
  /*  If the user owns the audio device then just perform the same    */
  /*  processing that receiving a MM_WOM_CLOSE message would cause.   */
  /*  Otherwise call the waveOutClose() function to release the wave  */
  /*  output device. This will cause the wave device driver to send   */
  /*  an MM_WOM_CLOSE message when the wave output device is          */
  /*  released. At that time the Audio Device State will be set to    */
  /*  AUDIO_DEVICE_INACTIVE.                                          */
  /********************************************************************/

  if ( pAudioParams->dwDeviceOptions & OWN_AUDIO_DEVICE )
  {
	EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
	pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
	LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	SetEvent( pAudioParams->hAudioDeviceInactive );
  }
  else
  {
	AudioPosition( pAudioParams, &dwPosition );

	pAudioParams->dwPositionBase += dwPosition;

	EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
	pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_SHUTTING_DOWN;
	LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	waveOutClose( pAudioParams->hWaveOut );
  }
  return;
}




/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessGetAudioPositionMessage                          */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns the position of the last byte sample */
/*    played by the wave output device since either the OpenAudio()   */
/*    function or the ResetAudio() function was called.               */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd           The handle to the Audio window.                  */
/*                                                                    */
/*    pdwPosition    A pointer to a DWORD that is set to the audio    */
/*                   position.                                        */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT ProcessGetAudioPositionMessage( HWND hWnd,
											   LPDWORD pdwPosition )
{
  MMRESULT mmStatus;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

  if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
	LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	mmStatus = AudioPosition( pAudioParams, pdwPosition );

	*pdwPosition += pAudioParams->dwPositionBase;
  }
  else
  {
	LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	mmStatus = MMSYSERR_NOERROR;

	*pdwPosition = pAudioParams->dwPositionBase;
  }

  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: AudioPosition                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns the position of the last byte sample */
/*    played by the wave output device since it was last opened.      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams  A pointer to a structure of type AUDIO_PARAMS_T.  */
/*                                                                    */
/*    pdwPosition   A pointer to a DWORD which will contain the       */
/*                  device position. The device position is the       */
/*                  sample number of the last audio sample which has  */
/*                  been played since the wave output device has been */
/*                  opened or reset. If the device is not available   */
/*                  or audio position query is not supported then a   */
/*                  position of 0xFFFFFFFF is returned.               */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT AudioPosition( LPAUDIO_PARAMS_T pAudioParams,
							   LPDWORD pdwPosition )
{
  MMRESULT mmStatus;
  LPMMTIME pMmt;

  /********************************************************************/
  /*  Get the wave output device position.                            */
  /*  First allocate memory for the MMTIME structure.                 */
  /********************************************************************/

  pMmt = (LPMMTIME)malloc(sizeof(MMTIME));

  if ( pMmt == NULL )
	return( MMSYSERR_NOMEM );

  /********************************************************************/
  /*  Get the position of the last sample played by the wave output   */
  /*  device.                                                         */
  /********************************************************************/

  pMmt->wType = TIME_BYTES;

  mmStatus = waveOutGetPosition( pAudioParams->hWaveOut,
								 pMmt,
								 sizeof(MMTIME));
  if ( mmStatus )
  {
	*pdwPosition = 0xFFFFFFFF;
  }
  else
  {
	switch ( pMmt->wType )
	{
	case TIME_MS:

	  *pdwPosition =
		( pMmt->u.ms * pAudioParams->pWaveFormat->nSamplesPerSec
			* pAudioParams->pWaveFormat->nBlockAlign ) / 1000;

	  if ( pAudioParams->bConvertToEightBit )
	  {
		*pdwPosition = *pdwPosition << 1;
	  }

	  break;

	case TIME_SAMPLES:

	  *pdwPosition = pMmt->u.sample
		* pAudioParams->pWaveFormat->nBlockAlign;

	  if ( pAudioParams->bConvertToEightBit )
	  {
		*pdwPosition = *pdwPosition << 1;
	  }

	  break;

	case TIME_BYTES:

	  *pdwPosition = pMmt->u.cb;

	  if ( pAudioParams->bConvertToEightBit )
	  {
		*pdwPosition = *pdwPosition << 1;
	  }

	  break;

	default:

	  *pdwPosition = 0xFFFFFFFF;
	  mmStatus = MMSYSERR_ERROR;

	  break;
	}
  }

  /********************************************************************/
  /*  Free memory for the MMTIME structure.                           */
  /********************************************************************/

  free( pMmt );

  return( mmStatus );
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessResetAudioMessage                                */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function stops any audio which is playing and resets  */
/*    audio queue.                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      The handle to the Audio window.                       */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT ProcessResetAudioMessage( HWND hWnd )
{
  MMRESULT mmStatus;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  Reset the audio queue to the empty state.                       */
  /********************************************************************/

  ResetAudioQueue( pAudioParams );

  /********************************************************************/
  /*  Set both audio position counts to zero.                         */
  /********************************************************************/

  pAudioParams->dwPositionBase = 0;
  pAudioParams->dwSamplesPlayed = 0;

  /********************************************************************/
  /*  If the audio device is open then reset it and return all wave   */
  /*  headers. Then the Process_MM_WOM_DONE_Message() function will   */
  /*  clear the "Reset Complete" event when all buffers have          */
  /*  completed. Otherwise clear the "Reset Complete" event here.     */
  /********************************************************************/

  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

  if (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
	&& ( pAudioParams->iSamplesWaitingForCompletion != 0 ))
  {
	LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
	pAudioParams->dwAudioPlayState = AUDIO_STATE_RESET;

	mmStatus = waveOutReset( pAudioParams->hWaveOut );
  }
  else
  {
	LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	SetEvent( pAudioParams->hResetComplete );

	mmStatus = MMSYSERR_NOERROR;
  }
  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessSetAudioParamsMessage                            */
/*  Author: Bill Hallahan                                             */
/*  Date: May 31, 1994                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sets the sample rate and the number of       */
/*    channels for the audio device. The audio device MUST not be     */
/*    playing when this function is called or an error will be        */
/*    returned.                                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd           The handle to the Audio window.                  */
/*                                                                    */
/*    pWaveFormat    A pointer to a structure of type WAVEFORMATEX    */
/*                   that is used to return the current audio device  */
/*                   parameters.                                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT ProcessSetAudioParamsMessage( HWND hWnd,
											  LPWAVEFORMATEX pWaveFormat )
{
  DWORD dwSampleRate;
  DWORD dwNumberOfChannels;
  DWORD dwBytesPerSample;
  DWORD dwWaveFormatSize;
  MMRESULT mmStatus;
  LPWAVEFORMATEX pWaveFormatNew;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  The wBitsPerSample element, the nChannels element, and the      */
  /*  nSamplesPerSec element of the WAVEFORMATEX structure are        */
  /*  used to calculate the values of the other elements of the       */
  /*  WAVEFORMATEX structure.                                         */
  /*                                                                  */
  /*  If the wFormatTag element of the WAVEFORMATEX structure         */
  /*  is NOT equal to WAVE_FORMAT_PCM then all of the fields of       */
  /*  the WAVEFORMATEX structure must be filled in and are used       */
  /*  in the call to the waveOutOpen() function.                      */
  /********************************************************************/

  if ( pWaveFormat->wFormatTag == WAVE_FORMAT_PCM )
  {
	/******************************************************************/
	/*  The wFormatTag element is equal to WAVE_FORMAT_PCM.           */
	/******************************************************************/

	dwSampleRate = pWaveFormat->nSamplesPerSec;
	dwNumberOfChannels = pWaveFormat->nChannels;
	dwBytesPerSample = pWaveFormat->wBitsPerSample >> 3;

	/******************************************************************/
	/*  Initialize other WAVEFORMATEX structure elements.             */
	/******************************************************************/

	pWaveFormat->nAvgBytesPerSec =
	  dwSampleRate * dwNumberOfChannels * dwBytesPerSample;
	pWaveFormat->nBlockAlign =
	  (WORD)( dwNumberOfChannels * dwBytesPerSample );
	pWaveFormat->cbSize = 0;
  }

  /********************************************************************/
  /*  If OWN_AUDIO_DEVICE is specified AND the requested Sample Rate  */
  /*  and the requested Number Of Channels do NOT match the current   */
  /*  settings then an error is returned.                             */
  /********************************************************************/

  if ( pAudioParams->dwDeviceOptions & OWN_AUDIO_DEVICE )
  {
	/******************************************************************/
	/*  The audio device is owned which means that the wave output    */
	/*  device will not be closed unless the CloseAudio() function is */
	/*  called. In this case, the requested format must match the     */
	/*  actual data format currently being used.                      */
	/*  One exception is that if the wFormatTag is equal to           */
	/*  WAVE_FORMAT_PCM then the several other fields will            */
	/*  automatically match (Except the wBitsPerSample field which    */
	/*  does not need to match in this case).                         */
	/******************************************************************/

	if (( pWaveFormat->wFormatTag != pAudioParams->pWaveFormat->wFormatTag )
	  || ( pWaveFormat->nSamplesPerSec
				!= pAudioParams->pWaveFormat->nSamplesPerSec )
	  || ( pWaveFormat->nChannels != pAudioParams->pWaveFormat->nChannels ))
	  return( MMSYSERR_ERROR );

	if ( pWaveFormat->wFormatTag != WAVE_FORMAT_PCM )
	{
	  if (( pWaveFormat->nAvgBytesPerSec
				  != pAudioParams->pWaveFormat->nAvgBytesPerSec )
		|| ( pWaveFormat->nBlockAlign
				  != pAudioParams->pWaveFormat->nBlockAlign )
		|| ( pWaveFormat->wBitsPerSample
				  != pAudioParams->pWaveFormat->wBitsPerSample )
		|| ( pWaveFormat->cbSize != pAudioParams->pWaveFormat->cbSize ))
	  return( MMSYSERR_ERROR );
	}
  }
  else
  {
	/******************************************************************/
	/*  If the audio device is not inactive then return an error.     */
	/******************************************************************/

	EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

	if ( pAudioParams->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE )
	{
	  LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	  return( MMSYSERR_ALLOCATED );
	}
	else
	{
	  LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

	  /****************************************************************/
	  /*  If the WAVEFORMATEX data structure has a wFormatTag         */
	  /*  element equal to WAVE_FORMAT_PCM then the device is tested  */
	  /*  for either 16 or 8 bit output. Whether 8 or 16 bits will    */
	  /*  succeed depends on the audio data size and the audio        */
	  /*  driver. If the audio samples are 16 bits and only 8 bit     */
	  /*  output is supported by the audio driver then the 16 bit     */
	  /*  audio samples are converted to 8 bit audio samples in the   */
	  /*  WriteBufferToWaveDevice() function. This conversion is      */
	  /*  indicated by the bConvertToEightBit flag.                   */
	  /*                                                              */
	  /*  If the wFormatTag element of the WAVEFORMATEX structure     */
	  /*  is NOT equal to WAVE_FORMAT_PCM then all of the fields of   */
	  /*  the WAVEFORMATEX structure must be filled in and are used   */
	  /*  in the call to the waveOutOpen() function.                  */
	  /****************************************************************/
	  /****************************************************************/
	  /*  Query the wave output device.                               */
	  /****************************************************************/

	  mmStatus = waveOutOpen( NULL,
							  pAudioParams->uiWaveOutDeviceID,
							  (LPWAVEFORMAT)pWaveFormat,
							  (DWORD)pAudioParams->hAudioWnd,
							  0,
							  WAVE_FORMAT_QUERY );

	  /****************************************************************/
	  /*  If the requested wave output format is WAVE_FORMAT_PCM and  */
	  /*  the number of bits per sample is 16 and the format is not   */
	  /*  supported then try to query the wave output device for 8    */
	  /*  bit samples.                                                */
	  /****************************************************************/

	  if  (( mmStatus == MMSYSERR_NOTSUPPORTED )
		&& ( pWaveFormat->wFormatTag == WAVE_FORMAT_PCM )
		&& ( pWaveFormat->wBitsPerSample == 16 ))
	  {
		/**************************************************************/
		/*  Initialize other WAVEFORMATEX structure elements for 8    */
		/*  bit data.                                                 */
		/**************************************************************/

		pWaveFormat->nAvgBytesPerSec = dwSampleRate * dwNumberOfChannels;
		pWaveFormat->nBlockAlign = (WORD)dwNumberOfChannels;
		pWaveFormat->wBitsPerSample = 8;

		/**************************************************************/
		/*  Query the wave output device.                             */
		/**************************************************************/

		mmStatus = waveOutOpen( NULL,
								pAudioParams->uiWaveOutDeviceID,
								(LPWAVEFORMAT)pWaveFormat,
								(DWORD)pAudioParams->hAudioWnd,
								0,
								WAVE_FORMAT_QUERY );

		/**************************************************************/
		/*  Reset the WAVEFORMATEX structure elements for 16 bit      */
		/*  data.                                                     */
		/**************************************************************/

		pWaveFormat->nAvgBytesPerSec =
		  dwSampleRate * dwNumberOfChannels << 1;
		pWaveFormat->nBlockAlign = (WORD)( dwNumberOfChannels << 1 );
		pWaveFormat->wBitsPerSample = 16;
	  }

	  /****************************************************************/
	  /*  Test for a "query failure" error.                           */
	  /****************************************************************/

	  if ( mmStatus )
		return( mmStatus );

	  /****************************************************************/
	  /*  Get the size of the WAVEFORMATEX structure including the    */
	  /*  possible data space indicated by the cbSize element.        */
	  /****************************************************************/

	  dwWaveFormatSize = GetWaveFormatSize( pWaveFormat );

	  /****************************************************************/
	  /*  Allocate space for the new WAVEFORMATEX structure size.     */
	  /****************************************************************/

	  pWaveFormatNew =
		(LPWAVEFORMATEX)realloc( pAudioParams->pWaveFormat,
								 (size_t)dwWaveFormatSize );

	  if ( pWaveFormatNew == NULL )
		return( MMSYSERR_NOMEM );

	  pAudioParams->pWaveFormat = pWaveFormatNew;

	  /****************************************************************/
	  /*  Set the new WAVEFORMATEX structure.                         */
	  /****************************************************************/

	  memcpy( pAudioParams->pWaveFormat,
			  pWaveFormat,
			  dwWaveFormatSize );
	}
  }
  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessGetAudioParamsMessage                            */
/*  Author: Bill Hallahan                                             */
/*  Date: June 1, 1994                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function gets the current sample rate and the current */
/*    number of channels for the audio device.                        */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd           The handle to the Audio window.                  */
/*                                                                    */
/*    pWaveFormat    A pointer to a structure of type WAVEFORMATEX    */
/*                   that is used to return the current audio device  */
/*                   parameters.                                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT ProcessGetAudioParamsMessage( HWND hWnd,
											  LPWAVEFORMATEX pWaveFormat )
{
  DWORD dwWaveFormatSize;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  Get the size of the WAVEFORMATEX structure including the        */
  /*  possible data space indicated by the cbSize element.            */
  /********************************************************************/

  dwWaveFormatSize = GetWaveFormatSize( pAudioParams->pWaveFormat );

  /********************************************************************/
  /*  Set the new WAVEFORMATEX structure.                             */
  /********************************************************************/

  memcpy( pWaveFormat,
		  pAudioParams->pWaveFormat,
		  dwWaveFormatSize );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: AudioSendError                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: April 8, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sends a message to the window procedure      */
/*    specified by the handle pAudioParams->hWnd. An error code is in */
/*    the wParam message parameter and an optional mmStatus is in the */
/*    lParam message parameter. mmStatus is of type MMRESULT and is   */
/*    the return value from one of the wave output multimedia calls.  */
/*    If mmStatus is not used, the caller should set it to 0L.  The   */
/*    parent window procedure may call the waveOutGetErrorText()      */
/*    function to obtain a text string which corresponds to the       */
/*    mmStatus value.                                                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams  A pointer to a structure of type AUDIO_PARAMS_T.  */
/*                                                                    */
/*    uiErrorCode   An unsigned integer which contains an error code. */
/*                                                                    */
/*    mmStatus      A return value of a wave output multimedia call   */
/*                  (of type MMRESULT). This parameter may be set to  */
/*                  zero by the calling function.                     */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void AudioSendError( LPAUDIO_PARAMS_T pAudioParams,
							UINT uiErrorCode,
							MMRESULT mmStatus )
{
  /********************************************************************/
  /*  After sending an error message, do not send any more messages   */
  /*  until the EnableAudioErrorMessage() function is called.         */
  /********************************************************************/

  if ( pAudioParams->bEnableErrorMessage )
  {
	pAudioParams->bEnableErrorMessage = FALSE;

	PostMessage( pAudioParams->hWnd,
				 pAudioParams->uiAudioErrorMessage,
				 (WPARAM)uiErrorCode,
				 (LPARAM)mmStatus );
  }
  return;
}

#endif

/*********************end of Huge audio.c ******************************/

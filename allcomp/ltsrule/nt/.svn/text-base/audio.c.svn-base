
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Audio Application Interface for the Windows/NT operating system.  */
/*  Author: Bill Hallahan                                             */
/*  Date: March 29, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This API encapsulates audio output processing. An          */
/*    application calls the OpenAudio() function to create an audio   */
/*    processing thread. The audio thread will create a hidden        */
/*    "audio" window. The audio window procedure processes all        */
/*    messages pertaining to audio output. An application may call    */
/*    any one of the following functions to perform the indicated     */
/*    audio function. Any application using these functions must      */
/*    include file audioapi.h.                                        */
/*                                                                    */
/*         Opening and closing of the waveform output device is       */
/*    handled automatically when audio is queued. 16 bit signed       */
/*    samples are always passed to the QueueAudio() function. If an   */
/*    8 bit audio device is opened (because no 16 bit audio device    */
/*    is available), then the data will be converted to 8 bit offset  */
/*    binary format before being played.                              */
/*                                                                    */
/*                                                                    */
/*      MMRESULT OpenAudio( HWND, HWND *, UINT, UINT, DWORD, DWORD ); */
/*                                                                    */
/*      MMRESULT QueueAudio( HWND, LPAUDIO_T, DWORD );                */
/*                                                                    */
/*      MMRESULT SetAudioVolume( HWND, DWORD );                       */
/*                                                                    */
/*      MMRESULT GetAudioVolume( HWND, LPDWORD );                     */
/*                                                                    */
/*      MMRESULT GetAudioPosition( HWND, LPDWORD, BOOL );             */
/*                                                                    */
/*      MMRESULT PauseAudio( HWND );                                  */
/*                                                                    */
/*      MMRESULT ResumeAudio( HWND );                                 */
/*                                                                    */
/*      MMRESULT StatusAudio( HWND, LPDWORD, LPDWORD, DWORD );        */
/*                                                                    */
/*      MMRESULT ResetAudio( HWND );                                  */
/*                                                                    */
/*      MMRESULT GetAudioParams( HWND, LPWAVEFORMATEX );              */
/*                                                                    */
/*      MMRESULT SetAudioParams( HWND, LPWAVEFORMATEX );              */
/*                                                                    */
/*      MMRESULT EnableAudioErrorMessage( HWND );                     */
/*                                                                    */
/*      MMRESULT WaitForAudioToComplete( HWND );                      */
/*                                                                    */
/*      MMRESULT CloseAudio( HWND );                                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#include <windows.h>
#include <process.h>	 /*MVP : for _beginthreadex and _endthreadex */
#include <mmsystem.h>
#include <mmreg.h>
#include <string.h>
#include <malloc.h>
#include "myalloc.h"
#include "audioapi.h"
#include "samprate.h"	//MVP:03/18/96 Definition of MULAW_SAMPLE_RATE 
#ifdef UNDER_CE
#include "coop.h"
#endif

/**********************************************************************/
/*  Symbol definitions used for Audio Queueing.                       */
/**********************************************************************/

#define  AUDIO_BUFFER_SIZE                131072
#define  MAXIMUM_WRITE_LENGTH               8192
#define  STARTUP_WRITE_SIZE                 2048
#define  MAXIMUM_BUFFERS_QUEUED                3
#define  MINIMUM_STARTUP_SAMPLES  MAXIMUM_BUFFERS_QUEUED * STARTUP_WRITE_SIZE
#define  TIMER_STARTUP_COUNT      MAXIMUM_BUFFERS_QUEUED - 1
#define  MAXIMUM_QUEUED_SIZE      AUDIO_BUFFER_SIZE - MAXIMUM_WRITE_LENGTH
#define  MAXIMUM_RESET_WAIT_IN_MSEC         5000
#define  SHUTDOWN_TIMEOUT_IN_MSEC           5000
#define  STARTUP_LOOP_WAIT_TIME               50
#define  MAX_STARTUP_WAIT_COUNT              200
#define  AUDIO_WAIT_SLEEP_TIME_IN_MSEC        50

/**********************************************************************/
/*  Symbols for pAudioParams->uiAudioPlayState.                       */
/**********************************************************************/

#define  AUDIO_STATE_PLAY        0
#define  AUDIO_STATE_RESET       1

/**********************************************************************/
/*  Symbols for pAudioParams->uiAudioDeviceState.                     */
/**********************************************************************/

#define  AUDIO_DEVICE_INACTIVE       0
#define  AUDIO_DEVICE_STARTING_UP    1
#define  AUDIO_DEVICE_ACTIVE         2
#define  AUDIO_DEVICE_SHUTTING_DOWN  3

/**********************************************************************/
/*  User defined Window Messages.                                     */
/**********************************************************************/

#define  ID_Open_Wave_Output_Device  WM_USER + 0
#define  ID_Set_Audio_Volume         WM_USER + 1
#define  ID_Get_Audio_Volume         WM_USER + 2
#define  ID_Get_Audio_Position       WM_USER + 3
#define  ID_Pause_Audio              WM_USER + 4
#define  ID_Resume_Audio             WM_USER + 5
#define  ID_Reset_Audio              WM_USER + 6
#define  ID_Set_Audio_Params         WM_USER + 7
#define  ID_Get_Audio_Params         WM_USER + 8
#define  ID_Enable_Error_Message     WM_USER + 9

/**********************************************************************/
/*  Local Structures.                                                 */
/**********************************************************************/

typedef struct QUEUE_TAG
{
  LPAUDIO_T pQueueTop;
  LPAUDIO_T pQueueStart;
  LPAUDIO_T pQueueInput;
  LPAUDIO_T pQueueOutput;
  int iInputPosition;
  int iOutputPosition;
  int iQueueCount;
  int iQueueLength;
} QUEUE_T;

typedef QUEUE_T * LPQUEUE_T;

#if defined _UNIX_LIKE_
typedef UINT HWAVEOUT;
#endif

/**********************************************************************/
/*  Structure which contains the audio parameters. An instance of     */
/*  this structure is attached to the audio handle. This is done      */
/*  using the SetWindowLong() function.                               */
/**********************************************************************/

typedef struct AUDIO_PARAMS_TAG
{
  HWND hWnd;
  HWND hAudioWnd;
  DT_HANDLE hAudioDeviceInactive;
  DT_HANDLE hAudioNotPaused;
  DT_HANDLE hQueueNotFull;
  DT_HANDLE hResetComplete;
  HWAVEOUT hWaveOut;
  UINT uiAudioErrorMessage;
  UINT uiWaveOutDeviceID;
  UINT uiSelectedDeviceID;
  int iSamplesWaitingForCompletion;
  DWORD dwAudioDeviceState;
  DWORD dwAudioPlayState;
  DWORD dwDeviceOptions;
  DWORD dwPositionBase;
  DWORD dwSamplesPlayed;
  DWORD dwDeviceSupport;
  BOOL bConvertToEightBit;
  BOOL bTimerExit;
  BOOL bPaused;
  BOOL bEnableErrorMessage;
  LPCRITICAL_SECTION pcsAudioDeviceState;
  LPCRITICAL_SECTION pcsSamplesPlayed;
  LPCRITICAL_SECTION pcsSelectedDeviceID;
  LPCRITICAL_SECTION pcsQueueCount;
  LPCRITICAL_SECTION pcsQueueAudioBusy;
  LPWAVEHDR * ppWaveHdr;
  LPQUEUE_T pAudioQueue;
  LPWAVEFORMATEX pWaveFormat;
} AUDIO_PARAMS_T;

typedef AUDIO_PARAMS_T * LPAUDIO_PARAMS_T;

/**********************************************************************/
/*  This structure is passsed as the LPVOID parameter in when         */
/*  calling the CreateWindow() function to startup the audio thread.  */
/**********************************************************************/

typedef struct AUDIO_OPEN_TAG
{
  HWND hWnd;
  HWND hAudioWnd;
  HINSTANCE hInstance;
  UINT uiErrorCode;
  UINT uiAudioErrorMessage;
  UINT uiWaveOutDeviceID;
  DWORD dwDeviceOptions;
  LPWAVEFORMATEX pWaveFormat;
} AUDIO_OPEN_T;

typedef AUDIO_OPEN_T * LPAUDIO_OPEN_T;

/**********************************************************************/
/*  Function prototypes (Function prototypes for functions used by    */
/*  applications are in file 'audioapi.h'.)                           */
/**********************************************************************/

static void DestroyAudioObjects( HWND );

static DWORD __stdcall AudioThreadMain( LPAUDIO_OPEN_T );  /*For _beginthreadex,The threadmain function shoulbe of __stdcall */

static DWORD __stdcall TimerThreadMain( LPAUDIO_PARAMS_T );/*For _beginthreadex,The threadmain function shoulbe of __stdcall */

static LRESULT CALLBACK AudioWndProc( HWND, UINT, WPARAM, LPARAM );

static LRESULT Process_WM_CREATE_Message( HWND, LPARAM );

static LRESULT Process_MM_WOM_OPEN_Message( HWND, WPARAM, LPARAM );

static MMRESULT GetWaveOutDeviceCaps( LPAUDIO_PARAMS_T );

static void StartAudioPlaying( LPAUDIO_PARAMS_T );

static LRESULT Process_MM_WOM_DONE_Message( HWND, LPARAM );

static LRESULT Process_MM_WOM_CLOSE_Message( HWND );

static void CloseAudioDevice( LPAUDIO_PARAMS_T );

static UINT WriteBufferToWaveDevice( LPAUDIO_PARAMS_T,
                                     LPWAVEHDR,
                                     UINT );

static void ResetAudioQueue( LPAUDIO_PARAMS_T );

static LRESULT ProcessOpenWaveOutputDeviceMessage( HWND );

static DWORD GetWaveFormatSize( LPWAVEFORMATEX );

static MMRESULT OpenWaveOutputDevice( LPAUDIO_PARAMS_T );

static LRESULT ProcessEnableErrorMessage( HWND );

static LRESULT ProcessSetAudioVolumeMessage( HWND, DWORD );

static LRESULT ProcessGetAudioVolumeMessage( HWND, LPDWORD );

static LRESULT ProcessGetAudioPositionMessage( HWND, LPDWORD );

static MMRESULT AudioPosition( LPAUDIO_PARAMS_T, LPDWORD );

static LRESULT ProcessPauseAudioMessage( HWND );

static LRESULT ProcessResumeAudioMessage( HWND );

static LRESULT ProcessResetAudioMessage( HWND );

static MMRESULT ProcessSetAudioParamsMessage( HWND, LPWAVEFORMATEX );

static MMRESULT ProcessGetAudioParamsMessage( HWND, LPWAVEFORMATEX );

static void AudioSendError( LPAUDIO_PARAMS_T, UINT, MMRESULT );

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OpenAudio                                               */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function creates the audio thread.                         */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*    hWnd                A handle to the parent window.              */
/*                                                                    */
/*    phAudioWnd          A pointer to a handle to the audio window.  */
/*                                                                    */
/*    uiAudioErrorMessage An unsigned integer which is the message    */
/*                        ID sent by the SendMessage() function when  */
/*                        an error occurs in the audio thread. The    */
/*                        error message is sent to the window         */
/*                        procedure corresponding to the handle       */
/*                        passed to the OpenAudio() function.         */
/*                                                                    */
/*    uiWaveOutDeviceID   An unsigned integer which is the wave out   */
/*                        device ID number. If constant WAVE_MAPPER   */
/*                        is used as the wave output device ID number */
/*                        then the first available wave output device */
/*                        will be selected.                           */
/*                                                                    */
/*    pWaveFormat         A pointer to a structure of type            */
/*                        WAVEFORMATEX that specifies how the audio   */
/*                        device is to be opened.                     */
/*                                                                    */
/*    dwDeviceOptions     A DWORD which specifies how the wave output */
/*                        device is managed. This parameter can be a  */
/*                        combination of the following values.        */
/*                                                                    */
/*       value                 performance characteristic             */
/*                                                                    */
/*  OWN_AUDIO_DEVICE      The wave output device will be opened upon  */
/*                        return from the OpenAudio() function. No    */
/*                        other process may allocate the wave output  */
/*                        device until the CloseAudio() function is   */
/*                        called.                                     */
/*                                                                    */
/*                        If OWN_AUDIO_DEVICE is NOT used then the    */
/*                        wave output device will be opened sometime  */
/*                        after audio is queued by the QueueAudio()   */
/*                        function. The wave output device will be    */
/*                        held as long as sufficient audio samples    */
/*                        are queued. Otherwise the device will be    */
/*                        released. If an attempt is made to open the */
/*                        wave output device while another process    */
/*                        owns it, then the queued audio will be      */
/*                        played when the device becomes available.   */
/*                                                                    */
/*  REPORT_OPEN_ERROR     If an attempt is made to open the wave      */
/*                        output device while another process owns    */
/*                        the device, then an error message will be   */
/*                        send to the window procedure which          */
/*                        corresponds to the parent window handle     */
/*                        passed to this function. The queued audio   */
/*                        will be played when the device becomes      */
/*                        available.                                  */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if audio initialization was successful.      */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NOTSUPPORTED  No wave out device present               */
/*    MMSYSERR_BADDEVICEID   Device ID out of range                   */
/*    MMSYSERR_NOMEM         Memory allocation error                  */
/*    MMSYSERR_ERROR         Audio Thread start failure               */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT OpenAudio( HWND hWnd,
                    HWND * phAudioWnd,
                    UINT uiAudioErrorMessage,
                    UINT uiWaveOutDeviceID,
                    LPWAVEFORMATEX pWaveFormat,
                    DWORD dwDeviceOptions )
{
  UINT i;
  DT_HANDLE hAudioThread;
  DWORD dwAudioThreadID;
  DWORD dwWaveFormatSize;
  MMRESULT mmStatus;
  LPWAVEFORMATEX pWaveFormatLocal;
  LPAUDIO_OPEN_T pAudioOpen;
  /*MVP : The below typedef is used in _beginthreadex function call */
  typedef unsigned int ( __stdcall * start_address )(void *);

  /********************************************************************/
  /*  Allocate a structure of type AUDIO_OPEN_T to pass the audio     */
  /*  input parameters.                                               */
  /********************************************************************/

  *phAudioWnd = NULL;
  pAudioOpen = (LPAUDIO_OPEN_T)malloc(sizeof(AUDIO_OPEN_T));

  if ( pAudioOpen == NULL )
    return( MMSYSERR_NOMEM );

  /********************************************************************/
  /*  Get the size of the WAVEFORMATEX structure.                     */
  /********************************************************************/

  dwWaveFormatSize = GetWaveFormatSize( pWaveFormat );

  /********************************************************************/
  /*  Allocate memory for the audio open WAVEFORMATEX structure.      */
  /********************************************************************/

  pWaveFormatLocal = (LPWAVEFORMATEX)malloc( dwWaveFormatSize );

  if ( pWaveFormatLocal == NULL )
  {
    free( pAudioOpen );
    return( MMSYSERR_NOMEM );
  }

  pAudioOpen->pWaveFormat = pWaveFormatLocal;

  /********************************************************************/
  /*  Copy the wave format data to the local structure.               */
  /********************************************************************/

  memcpy( pWaveFormatLocal, pWaveFormat, dwWaveFormatSize );

  /********************************************************************/
  /*  Put the rest of the input data into the Audio Open structure.   */
  /********************************************************************/

  pAudioOpen->hAudioWnd = NULL;
  pAudioOpen->hInstance = NULL;
  pAudioOpen->uiAudioErrorMessage = uiAudioErrorMessage;
  pAudioOpen->uiWaveOutDeviceID = uiWaveOutDeviceID;
  pAudioOpen->dwDeviceOptions = dwDeviceOptions;

  /********************************************************************/
  /*  Create the audio thread.                                        */
  /********************************************************************/
/*MVP : Microsoft recommends to use _beginthreadex for the proper recovery of
        resources from the thread 
*/
#ifdef OLD
  hAudioThread = CreateThread( NULL,
                               0,
                               (LPTHREAD_START_ROUTINE)AudioThreadMain,
                               (LPDWORD)pAudioOpen,
                               0,
                               &dwAudioThreadID );
#endif
  hAudioThread = _beginthreadex( NULL,
					 	0,
			 			(start_address)AudioThreadMain,
					 	(LPVOID)pAudioOpen,
					 	0,
					 	&dwAudioThreadID);
  
  if ( hAudioThread == NULL )
  {
    free( pWaveFormatLocal );
    free( pAudioOpen );
    return( MMSYSERR_ERROR );
  }

  CloseHandle( hAudioThread );

  /********************************************************************/
  /*  Wait here until the Audio thread initializes the handle.        */
  /********************************************************************/

  for ( i = 0; pAudioOpen->hAudioWnd == NULL; i++ )
  {
    Sleep( STARTUP_LOOP_WAIT_TIME );

    if ( i > MAX_STARTUP_WAIT_COUNT )
    {
      return( MMSYSERR_ERROR );
    }
  }

  *phAudioWnd = pAudioOpen->hAudioWnd;

  /********************************************************************/
  /*  Free the local WAVEFORMATEX structure and the Audio Open        */
  /*  structure.                                                      */
  /********************************************************************/

  free( pWaveFormatLocal );

  mmStatus = (MMRESULT)pAudioOpen->uiErrorCode;

  free( pAudioOpen );

  return( mmStatus );
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

MMRESULT QueueAudio( HWND hWnd,
                     LPAUDIO_T pBuffer,
                     DWORD dwLength )
{
  DWORD dwWrap;
  DWORD dwRemaining;
  LPQUEUE_T pAudioQueue;
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

  LeaveCriticalSection( pAudioParams->pcsQueueCount );

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

  EnterCriticalSection( pAudioParams->pcsQueueCount );
  pAudioQueue->iQueueCount += (int)dwLength;
  LeaveCriticalSection( pAudioParams->pcsQueueCount );

  /********************************************************************/
  /*  If the audio is not playing then start it playing if we         */
  /*  have enough available.                                          */
  /********************************************************************/

  if (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
   && ( pAudioQueue->iQueueCount >= MINIMUM_STARTUP_SAMPLES )
   && ( ! pAudioParams->bPaused ))
  {
    SendMessage( pAudioParams->hAudioWnd,
                 ID_Open_Wave_Output_Device,
                 0,
                 0L );
  }

  /********************************************************************/
  /*  Release the QueueAudio() function for use in another thread.    */
  /********************************************************************/

  LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SetAudioVolume                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function sets the volume of the wave output device.        */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd        The handle to the Audio window.                     */
/*                                                                    */
/*    dwVolume    A DWORD which contains the device volume.           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT SetAudioVolume( HWND hWnd, DWORD dwVolume )
{
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( hWnd == NULL )
    return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Set the wave output device volume.                              */
  /********************************************************************/

  return((MMRESULT)SendMessage( hWnd,
                                ID_Set_Audio_Volume,
                                0,
                                (LPARAM)dwVolume ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetAudioVolume                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function returns the volume of the wave output device.     */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd         The handle to the Audio window.                    */
/*                                                                    */
/*    pdwVolume    A pointer to a DWORD which will contain the        */
/*                 device volume if the function returns              */
/*                 successfully.                                      */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT GetAudioVolume( HWND hWnd, LPDWORD pdwVolume )
{
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
  /*  Get the wave output device volume.                              */
  /********************************************************************/

  return((MMRESULT)SendMessage( hWnd,
                                ID_Get_Audio_Volume,
                                0,
                                (LPARAM)pdwVolume ));
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

MMRESULT GetAudioPosition( HWND hWnd,
                           LPDWORD pdwPosition,
                           BOOL bFast )
{
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
  /*  Either get a quick coarse position or a slower but more         */
  /*  accurate position.                                              */
  /********************************************************************/

  if ( bFast )
  {
    /******************************************************************/
    /*  Get the coarse wave output position.                          */
    /******************************************************************/

    mmStatus = MMSYSERR_NOERROR;

    EnterCriticalSection( pAudioParams->pcsSamplesPlayed );
    *pdwPosition = pAudioParams->dwSamplesPlayed;
    LeaveCriticalSection( pAudioParams->pcsSamplesPlayed );
  }
  else
  {
    /******************************************************************/
    /*  Get the fine wave output position.                            */
    /******************************************************************/

    mmStatus = (MMRESULT)SendMessage( hWnd,
                                      ID_Get_Audio_Position,
                                      0,
                                      (LPARAM)pdwPosition );
  }
  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PauseAudio                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: April 29, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function pauses audio output.                              */
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

MMRESULT PauseAudio( HWND hWnd )
{
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( hWnd == NULL )
    return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Pause the wave output device.                                   */
  /********************************************************************/

  return((MMRESULT)SendMessage( hWnd,
                                ID_Pause_Audio,
                                0,
                                0L ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ResumeAudio                                             */
/*  Author: Bill Hallahan                                             */
/*  Date: April 29, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function resumes audio output.                             */
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

MMRESULT ResumeAudio( HWND hWnd )
{
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( hWnd == NULL )
    return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Resume paused audio output.                                     */
  /********************************************************************/

  return((MMRESULT)SendMessage( hWnd,
                                ID_Resume_Audio,
                                0,
                                0L ));
}

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

MMRESULT ResetAudio( HWND hWnd )
{
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
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pAudioParams == NULL )
    return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Block if another thread is queueing audio.                      */
  /********************************************************************/

  EnterCriticalSection( pAudioParams->pcsQueueAudioBusy );

  /********************************************************************/
  /*  Reset the "Reset Complete" event.                               */
  /********************************************************************/

  ResetEvent( pAudioParams->hResetComplete );

  /********************************************************************/
  /*  Cancel all audio output and initialize the audio queue.         */
  /********************************************************************/

  mmStatus = (MMRESULT)SendMessage( pAudioParams->hAudioWnd,
                                    ID_Reset_Audio,
                                    0,
                                    0L );

  /********************************************************************/
  /*  If audio is playing then wait for the reset to complete.        */
  /********************************************************************/

  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

  if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

    WaitForSingleObject( pAudioParams->hResetComplete,
                         MAXIMUM_RESET_WAIT_IN_MSEC );
  }
  else
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
  }

  /********************************************************************/
  /*  Release the audio queue.                                        */
  /********************************************************************/

  LeaveCriticalSection( pAudioParams->pcsQueueAudioBusy );

  return( mmStatus );
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

MMRESULT WaitForAudioToComplete( HWND hWnd )
{
  int iQueueCount;
  BOOL bAudioPlaying;
  LPQUEUE_T pAudioQueue;
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
/*  Function: CloseAudio                                              */
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

MMRESULT CloseAudio( HWND hWnd )
{
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
  /*  Cancel audio output and close the wave output device. The first */
  /*  reset will stop any audio playing but will not close the wave   */
  /*  output device if the device is owned by the application.        */
  /********************************************************************/

  ResetAudio( hWnd );

  if ( pAudioParams->dwDeviceOptions & OWN_AUDIO_DEVICE )
  {
    ResetEvent( pAudioParams->hAudioDeviceInactive );

    waveOutClose( pAudioParams->hWaveOut );

    WaitForSingleObject( pAudioParams->hAudioDeviceInactive,
                         SHUTDOWN_TIMEOUT_IN_MSEC );
  }

  /********************************************************************/
  /*  Destroy the Audio window.                                       */
  /********************************************************************/

  DestroyWindow( pAudioParams->hAudioWnd );

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
/*    handle except the hAudioWnd element.                            */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    A handle to the Audio window.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DestroyAudioObjects( HWND hWnd )
{
  int i;
  LPQUEUE_T pAudioQueue;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Return if NULL handle.                                          */
  /********************************************************************/

  if ( hWnd == NULL )
    return;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  Free the Audio Handle objects.                                  */
  /********************************************************************/

  if ( pAudioParams != NULL )
  {
    /******************************************************************/
    /*  Terminate the timer thread.                                   */
    /******************************************************************/

    pAudioParams->bTimerExit = TRUE;

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

      if ( pAudioQueue->pQueueTop != NULL )
        freeLock( pAudioQueue->pQueueTop );

      /****************************************************************/
      /*  Free Memory for the Audio Queue Structure.                  */
      /****************************************************************/

      free( pAudioQueue );
    }

    /******************************************************************/
    /*  Free Memory for Wave Headers.                                 */
    /******************************************************************/

    if ( pAudioParams->ppWaveHdr != NULL )
    {
      for ( i = 0; i < MAXIMUM_BUFFERS_QUEUED; i++ )
      {
        if ( pAudioParams->ppWaveHdr[i] != NULL )
          freeLock( pAudioParams->ppWaveHdr[i] );
      }

      /****************************************************************/
      /*  Free the Wave Header pointer array memory.                  */
      /****************************************************************/

      free( pAudioParams->ppWaveHdr );
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
    /*  Free the "Selected Device ID" critical section object.        */
    /******************************************************************/

    if ( pAudioParams->pcsSelectedDeviceID != NULL )
    {
      DeleteCriticalSection( pAudioParams->pcsSelectedDeviceID );
      free( pAudioParams->pcsSelectedDeviceID );
    }

    /******************************************************************/
    /*  Free the "Samples Played" critical section object.            */
    /******************************************************************/

    if ( pAudioParams->pcsSamplesPlayed != NULL )
    {
      DeleteCriticalSection( pAudioParams->pcsSamplesPlayed );
      free( pAudioParams->pcsSamplesPlayed );
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
    /*  Free the handle to the "Reset Complete" event.                */
    /******************************************************************/

    if ( pAudioParams->hResetComplete != NULL )
      CloseHandle( pAudioParams->hResetComplete );

    /******************************************************************/
    /*  Free the handle to the "Queue Not Full" event.                */
    /******************************************************************/

    if ( pAudioParams->hQueueNotFull != NULL )
      CloseHandle( pAudioParams->hQueueNotFull );

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
    /*  Free the Audio parameter WAVEFORMATEX structure.              */
    /******************************************************************/

    free( pAudioParams->pWaveFormat );

    /******************************************************************/
    /*  Free the audio handle.                                        */
    /******************************************************************/

    free( pAudioParams );
  }
  return;
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

MMRESULT GetAudioParams( HWND hWnd, LPWAVEFORMATEX pWaveFormat )
{
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
  /*  Get the audio parameters.                                       */
  /********************************************************************/

  return((MMRESULT)SendMessage( pAudioParams->hAudioWnd,
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

MMRESULT SetAudioParams( HWND hWnd, LPWAVEFORMATEX pWaveFormat )
{
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
  /*  Set the audio parameters.                                       */
  /********************************************************************/

  return((MMRESULT)SendMessage( pAudioParams->hAudioWnd,
                                ID_Set_Audio_Params,
                                0,
                                (LPARAM)pWaveFormat ));
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
/*  Thread Main: AudioThreadMain                                      */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This is the message processing loop for the Audio window   */
/*    procedure. The Audio window procedure processes all messages    */
/*    which pertain to the wave output device.                        */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static DWORD __stdcall AudioThreadMain( LPAUDIO_OPEN_T pAudioOpen )
{
  MSG msg;
  HWND hWnd;

  /********************************************************************/
  /*  Create the Audio window.                                        */
  /********************************************************************/

  InitAudioInstance( pAudioOpen->hInstance );

  /********************************************************************/
  /*  Create an Invisible Audio Window.                               */
  /********************************************************************/

  hWnd = CreateWindow( "AudioWndClass",
                       "Audio Output, v1.0",
                       WS_CLIPCHILDREN | WS_OVERLAPPEDWINDOW,
                       CW_USEDEFAULT,
                       CW_USEDEFAULT,
                       CW_USEDEFAULT,
                       CW_USEDEFAULT,
                       0,
                       0,
                       pAudioOpen->hInstance,
                       (LPVOID)pAudioOpen );
  if( hWnd == NULL )
    return( TRUE );

  pAudioOpen->hAudioWnd = hWnd;

  /********************************************************************/
  /*  Audio window message loop.                                      */
  /********************************************************************/

  while( GetMessage( &msg,
                     hWnd,
                     0,
                     ID_Enable_Error_Message ))
    DispatchMessage( &msg );
#ifdef OLD
  ExitThread( msg.wParam );
#endif
  _endthreadex(msg.wParam);

  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitAudioInstance                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: March 29, 1993                                              */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function registers the Audio window class.                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hInstance    A handle to the application isntance.              */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    If this function succeeds, then the return value is an atom     */
/*    that uniquely identifies the Audio window class. Otherwise the  */
/*    function will return zero.                                      */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

ATOM InitAudioInstance( HINSTANCE hInstance )
{
  WNDCLASS wc;

  /********************************************************************/
  /*  Register an Audio Window class. This is so we can use a window  */
  /*  procedure for the callback routine which is passed to the       */
  /*  waveOutOpen() function.                                         */
  /********************************************************************/

  wc.lpszClassName = "AudioWndClass";
  wc.lpfnWndProc =   AudioWndProc;
  wc.hInstance =     hInstance;
  wc.hCursor =       LoadCursor( 0, IDC_ARROW );
  wc.hIcon =         LoadIcon( 0, IDI_APPLICATION );
  wc.hbrBackground = (HBRUSH)( COLOR_APPWORKSPACE+1 );
  wc.lpszMenuName =  NULL;
  wc.style =         CS_OWNDC;
  wc.cbClsExtra =    0;
  wc.cbWndExtra =    0;

  return( RegisterClass( &wc ));
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
  /*  Audio intialization occurs here.                                */
  /********************************************************************/

  case WM_CREATE:

    return( Process_WM_CREATE_Message( hWnd, lParam ));

  /********************************************************************/
  /*  The MM_WOM_OPEN message is received after the waveOutOpen()     */
  /*  function opens the waveform output device.                      */
  /********************************************************************/

  case MM_WOM_OPEN:

    return( Process_MM_WOM_OPEN_Message( hWnd, wParam, lParam ));

  /********************************************************************/
  /*  The MM_WOM_DONE message is received when a buffer queued by the */
  /*  waveOutWrite() function has been played.                        */
  /********************************************************************/

  case MM_WOM_DONE:

    return( Process_MM_WOM_DONE_Message( hWnd, lParam ));

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
  /*  An application uses this message to set the wave output device  */
  /*  volume.                                                         */
  /********************************************************************/

  case ID_Set_Audio_Volume:

    return( ProcessSetAudioVolumeMessage( hWnd, (DWORD)lParam ));

  /********************************************************************/
  /*  An application uses this message to get the wave output device  */
  /*  volume.                                                         */
  /********************************************************************/

  case ID_Get_Audio_Volume:

    return( ProcessGetAudioVolumeMessage( hWnd, (LPDWORD)lParam ));

  /********************************************************************/
  /*  An application uses this message to get the position of the     */
  /*  last sample played by the wave output device.                   */
  /********************************************************************/

  case ID_Get_Audio_Position:

    return( ProcessGetAudioPositionMessage( hWnd, (LPDWORD)lParam ));

  /********************************************************************/
  /*  An application uses this message to pause audio output.         */
  /*  A value of FALSE is returned if the Pause was not successful.   */
  /********************************************************************/

  case ID_Pause_Audio:

    return( ProcessPauseAudioMessage( hWnd ));

  /********************************************************************/
  /*  An application uses this message to resume audio output.        */
  /*  A value of FALSE is returned if the Resume was not successful.  */
  /********************************************************************/

  case ID_Resume_Audio:

    return( ProcessResumeAudioMessage( hWnd ));

  /********************************************************************/
  /*  An application uses this message to cancel audio output.        */
  /********************************************************************/

  case ID_Reset_Audio:

    return( ProcessResetAudioMessage( hWnd ));

  /********************************************************************/
  /*  This message is sent by the the QueueAudio() function or by the */
  /*  timer thread 'TimerThreadMain()' to open the wave output device */
  /********************************************************************/

  case ID_Open_Wave_Output_Device:

    return( ProcessOpenWaveOutputDeviceMessage( hWnd ));

  /********************************************************************/
  /*  An application uses this message to set audio parameters.       */
  /********************************************************************/

  case ID_Set_Audio_Params:

    return( ProcessSetAudioParamsMessage( hWnd,
                                          (LPWAVEFORMATEX)lParam ));

  /********************************************************************/
  /*  An application uses this message to get audio parameters.       */
  /********************************************************************/

  case ID_Get_Audio_Params:

    return( ProcessGetAudioParamsMessage( hWnd,
                                          (LPWAVEFORMATEX)lParam ));

  /********************************************************************/
  /*  The ID_Enable_Error_Message enables the AudioSendError()        */
  /*  function.                                                       */
  /********************************************************************/

  case ID_Enable_Error_Message:

    return( ProcessEnableErrorMessage( hWnd ));

  /********************************************************************/
  /*  The WM_DESTROY message is used to destroy a window.             */
  /********************************************************************/

  case WM_DESTROY:

    DestroyAudioObjects( hWnd );

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

static DWORD __stdcall TimerThreadMain( LPAUDIO_PARAMS_T pAudioParams )
{
  LPQUEUE_T pAudioQueue;
  DWORD dwSleepTimeInMsec;
  UINT uiTimerCount;
  CONST DT_HANDLE * phObjects;
  DT_HANDLE hObjects[2];

  /********************************************************************/
  /*  Initialize object array for use in the WaitForMultipleObjects() */
  /*  function. This function will block if eithher the audio device  */
  /*  is active or if the audio system is paused.                     */
  /********************************************************************/

  hObjects[0] = pAudioParams->hAudioDeviceInactive;
  hObjects[1] = pAudioParams->hAudioNotPaused;
  phObjects = hObjects;

  /********************************************************************/
  /*  Initialize the timer count to 0. This is used to count the      */
  /*  number of consecutive times that audio is in the queue and the  */
  /*  audio device is not active.                                     */
  /********************************************************************/

  uiTimerCount = 0;

  pAudioQueue = pAudioParams->pAudioQueue;

  /********************************************************************/
  /*  If audio is NOT playing and the system is NOT paused then wake  */
  /*  up and check the queue. If there are samples in the queue then  */
  /*  increment uiTimerCount. Otherwise set uiTimerCount to zero. If  */
  /*  uiTimerCount reaches TIMER_STARTUP_COUNT then start playing     */
  /*  audio.                                                          */
  /********************************************************************/

  while( TRUE )
  {
    /******************************************************************/
    /*  Calculate how long to sleep.                                  */
    /******************************************************************/

    dwSleepTimeInMsec = (DWORD)( 500.0 *
      (double)(MINIMUM_STARTUP_SAMPLES) /
        (double)pAudioParams->pWaveFormat->nSamplesPerSec );

    if ( dwSleepTimeInMsec > 250 )
    {
      dwSleepTimeInMsec = 250;
    }

    /******************************************************************/
    /*  Sleep for a while before checking the queue.                  */
    /******************************************************************/

    Sleep( dwSleepTimeInMsec );

    /******************************************************************/
    /*  If the system is paused then startup fast when the            */
    /*  ResumeAudio() function is called.                             */
    /******************************************************************/

    if ( pAudioParams->bPaused )
    {
      uiTimerCount = TIMER_STARTUP_COUNT;
    }

    /******************************************************************/
    /*  Block until the audio device is inactive and the system is    */
    /*  not paused.                                                   */
    /******************************************************************/

    WaitForMultipleObjects( 2, phObjects, TRUE, INFINITE );

    /******************************************************************/
    /*  Test for thread shutdown. Shutdown is caused by the           */
    /*  CloseAudio() function ).                                      */
    /******************************************************************/

    if ( pAudioParams->bTimerExit )
#ifdef OLD
      ExitThread( 0 );
#endif
	  _endthreadex(0);

    /******************************************************************/
    /*  If the audio device is closed with audio in the queue for too */
    /*  long a time interval then start audio playing.                */
    /******************************************************************/

    EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
    if (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
      && ( ! pAudioParams->bPaused ))
    {
      LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

      EnterCriticalSection( pAudioParams->pcsQueueCount );

      if ( pAudioQueue->iQueueCount > 0 )
        uiTimerCount++;

      LeaveCriticalSection( pAudioParams->pcsQueueCount );

      if ( uiTimerCount >= TIMER_STARTUP_COUNT )
      {
        SendMessage( pAudioParams->hAudioWnd,
                     ID_Open_Wave_Output_Device,
                     0,
                     0L );

        uiTimerCount = 0;
      }
    }
    else
    {
      LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
      uiTimerCount = 0;
    }
  }
  return( FALSE );    /*  This statement gets rid of compiler warning */
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: Process_WM_CREATE_Message                               */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function is called when windows receives a            */
/*    WM_CREATE message. It will open the wave output device if       */
/*    the device management is set to OWN_AUDIO_DEVICE.               */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      A handle to the audio window.                         */
/*                                                                    */
/*    lParam    A pointer to a structure of type CREATESTRUCT_T.      */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function will return zero if succesful and -1 if an error  */
/*    occurs.                                                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT Process_WM_CREATE_Message( HWND hWnd, LPARAM lParam )
{
  DT_HANDLE hTimerThread;
  HINSTANCE hInstance;
  int i;
  int iNumberOfWaveOutDevices;
  DWORD dwWaveFormatSize;
  DWORD dwTimerThreadID;
  MMRESULT mmStatus;
  LPQUEUE_T pAudioQueue;
  LPCREATESTRUCT pCreateStruct;
  LPWAVEFORMATEX pWaveFormat;
  LPAUDIO_OPEN_T pAudioOpen;
  LPAUDIO_PARAMS_T pAudioParams;
  /*MVP : The below typedef is used in _beginthreadex function call */
  typedef unsigned int ( __stdcall * start_address )(void *);

  /********************************************************************/
  /*  Get pointer to the window creation structure.                   */
  /********************************************************************/

  pCreateStruct = (LPCREATESTRUCT)lParam;

  /********************************************************************/
  /*  Get a pointer to the applications Audio data.                   */
  /********************************************************************/

  pAudioOpen = (LPAUDIO_OPEN_T)pCreateStruct->lpCreateParams;

  /********************************************************************/
  /* Initialize the error return code.                                */
  /********************************************************************/

  pAudioOpen->uiErrorCode = MMSYSERR_NOERROR;

  /********************************************************************/
  /*  Make sure the system has an audio card.                         */
  /********************************************************************/

  iNumberOfWaveOutDevices = (int)waveOutGetNumDevs();

  if ( iNumberOfWaveOutDevices == 0 )
  {
    pAudioOpen->uiErrorCode = MMSYSERR_NODRIVER;
    return( -1 );
  }

  /********************************************************************/
  /*  Make sure the device ID is valid.                               */
  /********************************************************************/

  if ((int)pAudioOpen->uiWaveOutDeviceID >= iNumberOfWaveOutDevices )
  {
    pAudioOpen->uiErrorCode = MMSYSERR_BADDEVICEID;
    return( -1 );
  }

  /********************************************************************/
  /*  Allocate memory for the Audio parameter structure.              */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)malloc(sizeof(AUDIO_PARAMS_T));

  if ( pAudioParams == NULL )
  {
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  /********************************************************************/
  /*  Attach the Audio parameter structure to the window handle.      */
  /********************************************************************/

  SetWindowLong( hWnd,
                 GWL_USERDATA,
                 (LONG)pAudioParams );

  /********************************************************************/
  /*  Get the size of the WAVEFORMATEX structure.                     */
  /********************************************************************/

  dwWaveFormatSize = GetWaveFormatSize( pAudioOpen->pWaveFormat );

  /********************************************************************/
  /*  Allocate memory for the Audio parameter WAVEFORMATEX structure. */
  /********************************************************************/

  pWaveFormat = (LPWAVEFORMATEX)malloc( dwWaveFormatSize );

  if ( pWaveFormat == NULL )
  {
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  pAudioParams->pWaveFormat = pWaveFormat;

  /********************************************************************/
  /*  Copy the WAVEFORMATEX structure pointed to by the pWaveFormat   */
  /*  element of the AUDIO_OPEN_T structure to the audio handles      */
  /*  WAVEFORMATEX structure.                                         */
  /********************************************************************/

  memcpy( pWaveFormat,
          pAudioOpen->pWaveFormat,
          dwWaveFormatSize );

  /********************************************************************/
  /*  Save the input parameters in the audio handle.                  */
  /********************************************************************/

  pAudioParams->hWnd = pAudioOpen->hWnd;
  pAudioParams->uiAudioErrorMessage = pAudioOpen->uiAudioErrorMessage;
  pAudioParams->uiWaveOutDeviceID = pAudioOpen->uiWaveOutDeviceID;
  pAudioParams->dwDeviceOptions = pAudioOpen->dwDeviceOptions;

  /********************************************************************/
  /*  Initialize some Audio parameter handles and flags.              */
  /********************************************************************/

  pAudioParams->bTimerExit = FALSE;
  pAudioParams->bPaused = FALSE;
  pAudioParams->bEnableErrorMessage = TRUE;

  /**********************************************************************/
  /*  Initialize the audio handle here. The CreateWindow() function     */
  /*  which creates the audio window also initializes                   */
  /*  pAudioParams->hAudioWnd but this does not happen until after the  */
  /*  WM_CREATE messsage is processed.                                  */
  /**********************************************************************/

  pAudioParams->hAudioWnd = hWnd;

  /********************************************************************/
  /*  Get the hInstance for the new Window.                           */
  /********************************************************************/

  hInstance = pCreateStruct->hInstance;

  /********************************************************************/
  /*  Initialize the selected device ID. This will be updated every   */
  /*  time the wave output device is opened.                          */
  /********************************************************************/

  if ( pAudioParams->uiWaveOutDeviceID == (UINT)WAVE_MAPPER )
    pAudioParams->uiSelectedDeviceID = 0;
  else
    pAudioParams->uiSelectedDeviceID = pAudioParams->uiWaveOutDeviceID;

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

  pAudioParams->hWaveOut = NULL;
  pAudioParams->hAudioDeviceInactive = NULL;
  pAudioParams->hAudioNotPaused = NULL;
  pAudioParams->hQueueNotFull = NULL;
  pAudioParams->hResetComplete = NULL;
  pAudioParams->pcsAudioDeviceState = NULL;
  pAudioParams->pcsSamplesPlayed = NULL;
  pAudioParams->pcsSelectedDeviceID = NULL;
  pAudioParams->pcsQueueCount = NULL;
  pAudioParams->pcsQueueAudioBusy = NULL;
  pAudioParams->ppWaveHdr = NULL;
  pAudioParams->pAudioQueue = NULL;

  /********************************************************************/
  /*  Set the dwDeviceSupport member of the audio handle pointed to   */
  /*  by "pAudioParams" to the dwSupport field of the WAVEOUTCAPS     */
  /*  structure. The device ID is specified by the uiSelectedDeviceID */
  /*  field of the audio handle.                                      */
  /********************************************************************/

  mmStatus = GetWaveOutDeviceCaps( pAudioParams );

  if ( mmStatus )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = mmStatus;
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
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_ERROR;
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
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_ERROR;
    return( -1 );
  }

  /********************************************************************/
  /*  Create a "Queue Not Full" event. The initial state is signaled. */
  /********************************************************************/

  pAudioParams->hQueueNotFull = CreateEvent( NULL, TRUE, TRUE, NULL );

  if ( pAudioParams->hQueueNotFull == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_ERROR;
    return( -1 );
  }

  /********************************************************************/
  /*  Create a "Reset Complete" event. The initial state is signaled. */
  /********************************************************************/

  pAudioParams->hResetComplete = CreateEvent( NULL, TRUE, TRUE, NULL );

  if ( pAudioParams->hResetComplete == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_ERROR;
    return( -1 );
  }

  /********************************************************************/
  /*  Create the "Audio Device State" critical section object.        */
  /********************************************************************/

  pAudioParams->pcsAudioDeviceState =
    (LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

  if ( pAudioParams->pcsAudioDeviceState == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  InitializeCriticalSection( pAudioParams->pcsAudioDeviceState );

  /********************************************************************/
  /*  Create the "Samples Played" critical section object.            */
  /********************************************************************/

  pAudioParams->pcsSamplesPlayed =
    (LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

  if ( pAudioParams->pcsSamplesPlayed == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  InitializeCriticalSection( pAudioParams->pcsSamplesPlayed );

  /********************************************************************/
  /*  Create the "Selected Device ID" critical section object.        */
  /********************************************************************/

  pAudioParams->pcsSelectedDeviceID =
    (LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

  if ( pAudioParams->pcsSelectedDeviceID == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  InitializeCriticalSection( pAudioParams->pcsSelectedDeviceID );

  /********************************************************************/
  /*  Create the "Queue Count" critical section object.               */
  /********************************************************************/

  pAudioParams->pcsQueueCount =
    (LPCRITICAL_SECTION)malloc( sizeof( CRITICAL_SECTION ));

  if ( pAudioParams->pcsQueueCount == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
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
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  InitializeCriticalSection( pAudioParams->pcsQueueAudioBusy );

  /********************************************************************/
  /*  Allocate Memory for Wave Header pointer array.                  */
  /********************************************************************/

  pAudioParams->ppWaveHdr =
    (LPWAVEHDR *)malloc( MAXIMUM_BUFFERS_QUEUED * sizeof(LPWAVEHDR));

  if ( pAudioParams->ppWaveHdr == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }
  else
  {
    for ( i = 0; i < MAXIMUM_BUFFERS_QUEUED; i++ )
      pAudioParams->ppWaveHdr[i] = NULL;

    /******************************************************************/
    /*  Allocate Memory for the Wave Headers.                         */
    /******************************************************************/

    for ( i = 0; i < MAXIMUM_BUFFERS_QUEUED; i++ )
    {
      pAudioParams->ppWaveHdr[i] = (LPWAVEHDR)mallocLock( sizeof(WAVEHDR));

      if ( pAudioParams->ppWaveHdr[i] == NULL )
      {
        DestroyAudioObjects( hWnd );
        pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
        return( -1 );
      }
    }
  }

  /********************************************************************/
  /*  Allocate Memory for the Audio Queue Structure.                  */
  /********************************************************************/

  pAudioQueue = (LPQUEUE_T)malloc(sizeof(QUEUE_T));

  if ( pAudioQueue == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  pAudioParams->pAudioQueue = pAudioQueue;

  /********************************************************************/
  /*  Initialize all of the audio queue objects to NULL.              */
  /********************************************************************/

  pAudioQueue->pQueueTop = NULL;

  /********************************************************************/
  /*  Allocate Memory for the audio buffer.                           */
  /********************************************************************/

  pAudioQueue->pQueueTop = (LPAUDIO_T)
    mallocLock(( AUDIO_BUFFER_SIZE + MAXIMUM_WRITE_LENGTH ) *
      sizeof(AUDIO_T));

  if ( pAudioQueue->pQueueTop == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_NOMEM;
    return( -1 );
  }

  /********************************************************************/
  /*  Initialize the audio queue buffer start and length.             */
  /********************************************************************/

  pAudioQueue->pQueueStart =
    pAudioQueue->pQueueTop + MAXIMUM_WRITE_LENGTH;
  pAudioQueue->iQueueLength = AUDIO_BUFFER_SIZE;

  /********************************************************************/
  /*  Initialize the audio queue and the completion count.            */
  /********************************************************************/

  ResetAudioQueue( pAudioParams );

  pAudioParams->iSamplesWaitingForCompletion = 0;

  /********************************************************************/
  /*  Create the Timer Thread.                                        */
  /********************************************************************/
/*MVP : Microsoft recommends to use _beginthreadex for the proper recovery of
        resources from the thread 
*/
#ifdef OLD
  hTimerThread = CreateThread( NULL,
                               0,
                               (LPTHREAD_START_ROUTINE)TimerThreadMain,
                               (LPDWORD)pAudioParams,
                               0,
                               &dwTimerThreadID );
#endif
  hTimerThread = _beginthreadex( NULL,
                               0,
                               (start_address)TimerThreadMain,
                               (LPDWORD)pAudioParams,
                               0,
                               &dwTimerThreadID );

  if ( hTimerThread == NULL )
  {
    DestroyAudioObjects( hWnd );
    pAudioOpen->uiErrorCode = MMSYSERR_ERROR;
    return( -1 );
  }

  CloseHandle( hTimerThread );

  /**********************************************************************/
  /*  If the application owns the wave output device then open it now.  */
  /**********************************************************************/

  if ( pAudioParams->dwDeviceOptions & OWN_AUDIO_DEVICE )
    OpenWaveOutputDevice( pAudioParams );

  return( 0 );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: Process_MM_WOM_OPEN_Message                             */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function is called when windows receives an           */
/*    MM_WOM_OPEN message.                                            */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      The window handle.                                    */
/*                                                                    */
/*    wParam    Currently unused.                                     */
/*                                                                    */
/*    lParam    Currently unused.                                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT Process_MM_WOM_OPEN_Message( HWND hWnd,
                                            WPARAM wParam,
                                            LPARAM lParam )
{
  UINT uiSelectedDeviceID;
  MMRESULT mmStatus;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  Get the selected wave output device ID number.                  */
  /********************************************************************/

  if ( pAudioParams->uiWaveOutDeviceID == (UINT)WAVE_MAPPER )
  {
    if ( waveOutGetID( pAudioParams->hWaveOut,
                       &uiSelectedDeviceID ))
    {
      uiSelectedDeviceID = pAudioParams->uiSelectedDeviceID;
    }
  }
  else
  {
    uiSelectedDeviceID = pAudioParams->uiWaveOutDeviceID;
  }

  /********************************************************************/
  /*  Attempt to fix BUG in MARCH 1993 Beta version of Windows/NT.    */
  /*  If WAVE_MAPPER was the device ID when the waveOutOpen()         */
  /*  function was called and a valid hWaveOut is passed to the       */
  /*  waveOutGetID() function then it returns WAVE_MAPPER instead of  */
  /*  the device ID of the wave out device !                          */
  /*  If WAVE_MAPPER is used, then hope that the device ID is zero.   */
  /********************************************************************/

  if ( uiSelectedDeviceID == (UINT)WAVE_MAPPER )
    uiSelectedDeviceID = 0;

  /********************************************************************/
  /*  Save the selected device ID in the handle. All subsequent calls */
  /*  to the waveOutGetVolume() and waveOutSetVolume() functions will */
  /*  use the selected device ID.                                     */
  /********************************************************************/

  EnterCriticalSection( pAudioParams->pcsSelectedDeviceID );
  pAudioParams->uiSelectedDeviceID = uiSelectedDeviceID;
  LeaveCriticalSection( pAudioParams->pcsSelectedDeviceID );

  /********************************************************************/
  /*  Set the dwDeviceSupport member of the audio handle pointed to   */
  /*  by "pAudioParams" to the dwSupport field of the WAVEOUTCAPS     */
  /*  structure. The device ID is specified by the uiSelectedDeviceID */
  /*  field of the audio handle.                                      */
  /********************************************************************/

  mmStatus = GetWaveOutDeviceCaps( pAudioParams );

  if ( mmStatus )
    AudioSendError( pAudioParams,
                    ERROR_GETTING_DEVICE_CAPABILITIES,
                    mmStatus );

  /********************************************************************/
  /*  Start Audio Playing.                                            */
  /********************************************************************/

  StartAudioPlaying( pAudioParams );

  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetWaveOutDeviceCaps                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: July 29, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sets the dwDeviceSupport member of the audio */
/*    handle pointed to by "pAudioParams" to the dwSupport field of   */
/*    the WAVEOUTCAPS structure. The device ID is specified by the    */
/*    uiSelectedDeviceID field of the audio handle.                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams   A pointer to a structure of type AUDIO_PARAMS_T. */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT GetWaveOutDeviceCaps( LPAUDIO_PARAMS_T pAudioParams )
{
  LPWAVEOUTCAPS pWaveOutCaps;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Get the wave output device capabilities.                        */
  /*  First allocate memory for the WAVEOUTCAPS structure.            */
  /********************************************************************/

  pWaveOutCaps = (LPWAVEOUTCAPS)malloc(sizeof(WAVEOUTCAPS));

  if ( pWaveOutCaps == NULL )
    return( MMSYSERR_NOMEM );

  mmStatus = waveOutGetDevCaps( pAudioParams->uiSelectedDeviceID,
                                pWaveOutCaps,
                                sizeof(WAVEOUTCAPS));

  /********************************************************************/
  /*  Store the device capabilities in the handle.                    */
  /********************************************************************/

  pAudioParams->dwDeviceSupport = pWaveOutCaps->dwSupport;

  /********************************************************************/
  /*  Free memory for the WAVEOUTCAPS structure.                      */
  /********************************************************************/

  free( pWaveOutCaps );

  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: StartAudioPlaying                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function is called by the                             */
/*    Process_MM_WOM_OPEN_Message() function and starts writing audio */
/*    to the wave output device.                                      */
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

static void StartAudioPlaying( LPAUDIO_PARAMS_T pAudioParams )
{
  int i;
  int iQueueCount;
  int iBufferWriteCount;
  UINT uiWriteLength;
  LPQUEUE_T pAudioQueue;

  /********************************************************************/
  /*  Get the Queue Count. If it changes between here and the end of  */
  /*  this function, that's OK.                                       */
  /********************************************************************/

  pAudioQueue = pAudioParams->pAudioQueue;

  EnterCriticalSection( pAudioParams->pcsQueueCount );
  iQueueCount = pAudioQueue->iQueueCount;
  LeaveCriticalSection( pAudioParams->pcsQueueCount );

  /********************************************************************/
  /*  If the ResetAudio() function clears the audio queue just after  */
  /*  the waveOutOpen() function completes, then it is possible to    */
  /*  get here with no audio in the queue. In this case, close the    */
  /*  wave output device.                                             */
  /********************************************************************/

  if ( iQueueCount == 0 )
  {
    CloseAudioDevice( pAudioParams );
  }
  else
  {
    /******************************************************************/
    /*  Set the Audio Device State to AUDIO_DEVICE_ACTIVE.            */
    /******************************************************************/

    EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
    pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_ACTIVE;
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

    /******************************************************************/
    /*  If the Audio Device State is NOT OWN_AUDIO_DEVICE and the     */
    /*  pause flag is set then pause the wave output device.          */
    /*  This is needed in case the pause message was received in      */
    /*  between the open wave out device message and the MM_WOM_OPEN  */
    /*  message.                                                      */
    /******************************************************************/

    if ( ! ( pAudioParams->dwDeviceOptions & OWN_AUDIO_DEVICE )
      && ( pAudioParams->bPaused ))
    {
      waveOutPause( pAudioParams->hWaveOut );
    }

    /******************************************************************/
    /*  If the number of samples in the queue is less than the        */
    /*  minimum samples to start playing audio then this is a flush   */
    /*  which was started by the timer thread (TimerThreadMain).      */
    /******************************************************************/

    if ( iQueueCount < MINIMUM_STARTUP_SAMPLES )
    {
      iBufferWriteCount = 1;
      uiWriteLength = iQueueCount;
    }
    else
    {
      iBufferWriteCount = MAXIMUM_BUFFERS_QUEUED;
      uiWriteLength = STARTUP_WRITE_SIZE;
    }

    /******************************************************************/
    /*  Loop and write each buffer to the wave output device.         */
    /******************************************************************/

    for ( i = 0; i < iBufferWriteCount; i++ )
    {
      WriteBufferToWaveDevice( pAudioParams,
                               pAudioParams->ppWaveHdr[i],
                               uiWriteLength );
    }
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: Process_MM_WOM_DONE_Message                             */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function is called when windows receives an           */
/*    MM_WOM_DONE message.                                            */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      The window handle.                                    */
/*                                                                    */
/*    lParam    lParam contains a pointer to the current              */
/*              WAVEHDR structure.                                    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*    If there are multiple buffers written (queued) by the           */
/*    waveOutWrite() function and there is more audio in the queue,   */
/*    then more audio will be written to the wave output device using */
/*    the waveOutWrite() function.                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT Process_MM_WOM_DONE_Message( HWND hWnd,
                                            LPARAM lParam )
{
  int dwRemaining;
  UINT uiOldWriteLength;
  LPWAVEHDR pWaveHdr;
  LPQUEUE_T pAudioQueue;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  Get the pointer to the wave header from the lParam of the       */
  /*  MM_WOM_DONE message and the pointer to the audio queue from the */
  /*  audio handle.                                                   */
  /********************************************************************/

  pWaveHdr = (LPWAVEHDR)lParam;

  /********************************************************************/
  /*  Get the number of samples previously written by the             */
  /*  waveOutWrite() function.                                        */
  /********************************************************************/

  uiOldWriteLength = (UINT)pWaveHdr->dwUser;

  /********************************************************************/
  /*  Unprepare the old header.                                       */
  /********************************************************************/

  waveOutUnprepareHeader( pAudioParams->hWaveOut,
                          pWaveHdr,
                          sizeof(WAVEHDR));

  /********************************************************************/
  /*  Subtract number of samples just output from the samples waiting */
  /*  for completion count.                                           */
  /********************************************************************/

  pAudioParams->iSamplesWaitingForCompletion -= uiOldWriteLength;

  /********************************************************************/
  /*  Do different things depending on the current Audio Play State.  */
  /********************************************************************/

  switch ( pAudioParams->dwAudioPlayState )
  {
  case AUDIO_STATE_PLAY:

    /******************************************************************/
    /*  Subtract the number of samples from the queue count.          */
    /******************************************************************/

    pAudioQueue = pAudioParams->pAudioQueue;

    EnterCriticalSection( pAudioParams->pcsQueueCount );
    pAudioQueue->iQueueCount -= (int)uiOldWriteLength;
    LeaveCriticalSection( pAudioParams->pcsQueueCount );

    /******************************************************************/
    /*  Also update the "samples played" count.                       */
    /******************************************************************/

    EnterCriticalSection( pAudioParams->pcsSamplesPlayed );
    pAudioParams->dwSamplesPlayed += (DWORD)uiOldWriteLength;
    LeaveCriticalSection( pAudioParams->pcsSamplesPlayed );

    /******************************************************************/
    /*  If there are no samples waiting for completion then there     */
    /*  are no more buffers queued by the waveOutWrite() function.    */
    /*  In this case release the wave output device by calling the    */
    /*  waveOutClose() function. If there are more samples in the     */
    /*  audio queue then a restart will eventually occur.             */
    /******************************************************************/

    if ( pAudioParams->iSamplesWaitingForCompletion <= 0 )
    {
      CloseAudioDevice( pAudioParams );
    }
    else
    {
      /****************************************************************/
      /*  Determine the number of unwritten samples remaining in the  */
      /*  audio queue. Protect the Queue Count.                       */
      /****************************************************************/

      EnterCriticalSection( pAudioParams->pcsQueueCount );
      dwRemaining = pAudioQueue->iQueueCount -
                     pAudioParams->iSamplesWaitingForCompletion;
      LeaveCriticalSection( pAudioParams->pcsQueueCount );

      /****************************************************************/
      /*  If there are any samples remaining in the audio queue then  */
      /*  write up to as many samples as MAXIMUM_WRITE_LENGTH.        */
      /****************************************************************/

      if ( dwRemaining > 0 )
      {
        /**************************************************************/
        /*  Write the next buffer to the output device.               */
        /**************************************************************/

        WriteBufferToWaveDevice( pAudioParams,
                                 pWaveHdr,
                                 (UINT)dwRemaining );
      }
    }

    break;

  case AUDIO_STATE_RESET:

    /******************************************************************/
    /*  In reset mode the queue count has already been set to zero.   */
    /*  If there are no samples still playing then signal that the    */
    /*  reset is complete.                                            */
    /******************************************************************/

    if ( pAudioParams->iSamplesWaitingForCompletion <= 0 )
    {
      pAudioParams->dwAudioPlayState = AUDIO_STATE_PLAY;

      CloseAudioDevice( pAudioParams );

      SetEvent( pAudioParams->hResetComplete );
    }

    break;

  default:

    break;
  }

  /********************************************************************/
  /*  Signal that the Queue is not full.                              */
  /********************************************************************/

  SetEvent( pAudioParams->hQueueNotFull );

  return( FALSE );
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
/*  Function: ProcessOpenWaveOutputDeviceMessage                      */
/*  Author: Bill Hallahan                                             */
/*  Date: May 20, 1993                                                */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function conditionally opens the wave output device.       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd      The Audio window handle.                              */
/*                                                                    */
/*                                                                    */
/*   Output:                                                          */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT ProcessOpenWaveOutputDeviceMessage( HWND hWnd )
{
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  If the wave output device is not closed then abort.             */
  /*  This check is necessary because the QueueAudio() function and   */
  /*  the Timer thread may both send the ID_Open_Wave_Output_Device   */
  /*  message before either occurence of the message can be processed */
  /*  Also abort if the pause flag is set.                            */
  /********************************************************************/

  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

  if (( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
    && ( ! pAudioParams->bPaused ))
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

    /******************************************************************/
    /*  IF the wave output device is already owned                    */
    /*    There will be no MM_WOM_OPEN message generated so start     */
    /*    audio playing right now.                                    */
    /*  ELSE                                                          */
    /*    Open the wave audio device.                                 */
    /*    The Process_MM_WOM_OPEN_Message function will start audio   */
    /*    playing.                                                    */
    /******************************************************************/

    if ( pAudioParams->dwDeviceOptions & OWN_AUDIO_DEVICE )
    {
      ResetEvent( pAudioParams->hAudioDeviceInactive );

      EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
      pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_ACTIVE;
      LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );

      StartAudioPlaying( pAudioParams );
    }
    else
    {
      if ( OpenWaveOutputDevice( pAudioParams ) == MMSYSERR_NOERROR )
      {
        ResetEvent( pAudioParams->hAudioDeviceInactive );

        EnterCriticalSection( pAudioParams->pcsAudioDeviceState );
        pAudioParams->dwAudioDeviceState = AUDIO_DEVICE_STARTING_UP;
        LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
      }
    }
  }
  else
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
  }
  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OpenWaveOutputDevice                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: July 23, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function opens the wave output device.                     */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams  A pointer to a structure of type AUDIO_PARAMS_T.  */
/*                                                                    */
/*                                                                    */
/*   Output:                                                          */
/*                                                                    */
/*     This function returns a status code of type MMRESULT.          */
/*     This value is zero if the write was successful.                */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT OpenWaveOutputDevice( LPAUDIO_PARAMS_T pAudioParams )
{
  DWORD dwSampleRate;
  DWORD dwNumberOfChannels;
  DWORD dwBytesPerSample;
  LPWAVEFORMATEX pWaveFormat;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  The default state is no sample conversion.                      */
  /********************************************************************/

  pAudioParams->bConvertToEightBit = FALSE;

  /********************************************************************/
  /*  Initialize the local WAVEFORMATEX structure.                    */
  /********************************************************************/

  pWaveFormat = pAudioParams->pWaveFormat;

  /********************************************************************/
  /*  If the WAVEFORMATEX data structure has a wFormatTag element     */
  /*  equal to WAVE_FORMAT_PCM then the device is opened for either   */
  /*  16 or 8 bit output. Whether 8 or 16 bits will succeed depends   */
  /*  on the audio data size and the audio driver. If the audio       */
  /*  samples are 16 bits and only 8 bit output is supported by the   */
  /*  audio driver then the 16 bit audio samples are converted to 8   */
  /*  bit audio samples in the WriteBufferToWaveDevice() function.    */
  /*  This conversion is indicated by the bConvertToEightBit flag.    */
  /*  The wBitsPerSample element, the nChannels element , and         */
  /*  the nSamplesPerSec element of the WAVEFORMATEX structure are    */
  /*  used to calculate the values of the other elements of the       */
  /*  WAVEFORMATEX structure.                                         */
  /*                                                                  */
  /*  If the wFormatTag element of the WAVEFORMATEX structure         */
  /*  is NOT equal to WAVE_FORMAT_PCM then all of the fields of the   */
  /*  WAVEFORMATEX structure must be filled in and are used in the    */
  /*  call to the waveOutOpen() function.                             */
  /*
  /*  MVP : 03/18/96 :Added logic to check for MU-LAW supported cards */
  /*  (Fo example : dialogic cards)									  */
  /*  																  */
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
  /*  Attempt to open the wave output device.                         */
  /********************************************************************/

  mmStatus = waveOutOpen( &(pAudioParams->hWaveOut),
                          pAudioParams->uiWaveOutDeviceID,
                          (LPWAVEFORMAT)pWaveFormat,
                          (DWORD)pAudioParams->hAudioWnd,
                          0,
                          CALLBACK_WINDOW );

  /********************************************************************/
  /*  If the requested wave output format is WAVE_FORMAT_PCM and the  */
  /*  number of bits per sample is 16 and the format is not supported */
  /*  then try to open the wave output device for 8 bit samples.      */
  /********************************************************************/
  // MVP : 03/18/96 The return values from waveOutOpen doesn't include
  //       MMSYSERR_NOTSUPPORTED in ver 4.00 of mmsystem.h
  // 	   For the unsupported waveform audio format the return value
  //	   is WAVERR_BADFORMAT.

  if  (( mmStatus == WAVERR_BADFORMAT )
    && ( pWaveFormat->wFormatTag == WAVE_FORMAT_PCM )
    && ( pWaveFormat->wBitsPerSample == 16 ))
  {
    /******************************************************************/
    /*  Initialize other WAVEFORMATEX structure elements for 8 bit    */
    /*  data.                                                         */
    /******************************************************************/

    pWaveFormat->nAvgBytesPerSec = dwSampleRate * dwNumberOfChannels;
    pWaveFormat->nBlockAlign = (WORD)dwNumberOfChannels;
    pWaveFormat->wBitsPerSample = 8;

    /******************************************************************/
    /*  Attempt to open the wave output device.                       */
    /******************************************************************/

    mmStatus = waveOutOpen( &(pAudioParams->hWaveOut),
                            pAudioParams->uiWaveOutDeviceID,
                            (LPWAVEFORMAT)pWaveFormat,
                            (DWORD)pAudioParams->hAudioWnd,
                            0,
                            CALLBACK_WINDOW );


	if  (( mmStatus == WAVERR_BADFORMAT )
    && ( pWaveFormat->wFormatTag == WAVE_FORMAT_PCM )
    && ( pWaveFormat->wBitsPerSample == 8 ))
	{

  		/******************************************************************/
		/*  MVP : 03/18/96 : Check for MU-LAW WAVEFORMAT support          */
		/******************************************************************/
  		pWaveFormat->wFormatTag = WAVE_FORMAT_MULAW;
		pWaveFormat->nChannels = 1;
		pWaveFormat->nSamplesPerSec = MULAW_SAMPLE_RATE;
		pWaveFormat->nAvgBytesPerSec = MULAW_SAMPLE_RATE * pWaveFormat->nChannels;
		pWaveFormat->nBlockAlign = pWaveFormat->nChannels;
		pWaveFormat->wBitsPerSample = 8;
		pWaveFormat->cbSize =  0;

		/******************************************************************/
		/*  Attempt to open the wave output device.                       */
		/******************************************************************/

		mmStatus = waveOutOpen( &(pAudioParams->hWaveOut),
                            pAudioParams->uiWaveOutDeviceID,
                            (LPWAVEFORMAT)pWaveFormat,
                            (DWORD)pAudioParams->hAudioWnd,
                            0,
                            CALLBACK_WINDOW );
	}
	
	/******************************************************************/
	/*  Reset the WAVEFORMATEX structure elements for 16 bit data.    */
	/******************************************************************/
    pWaveFormat->nAvgBytesPerSec =
      dwSampleRate * dwNumberOfChannels << 1;
    pWaveFormat->nBlockAlign = (WORD)( dwNumberOfChannels << 1 );
    pWaveFormat->wBitsPerSample = 16;

    pAudioParams->bConvertToEightBit = TRUE;
  }

  /********************************************************************/
  /*  Test for an open error.                                         */
  /********************************************************************/

  if ( mmStatus )
  {
    /******************************************************************/
    /*  If the open fails because the device is busy AND the          */
    /*  pAudioParams->uiWaveOutDeviceID parameter is equal to         */
    /*  WAVE_MAPPER then MMSYSERR_NOTSUPPORTED error may be           */
    /*  returned. (Tested using the March 1992 BETA version of        */
    /*  Windows/NT).                                                  */
    /******************************************************************/

    if   (( mmStatus != MMSYSERR_ALLOCATED )
      && (( mmStatus != WAVERR_BADFORMAT )
      || ( pAudioParams->uiWaveOutDeviceID != (UINT)WAVE_MAPPER )))
    {
      /****************************************************************/
      /*  The error which occured WAS NOT caused by another           */
      /*  application owning the device.                              */
      /****************************************************************/

      AudioSendError( pAudioParams,
                      ERROR_OPENING_WAVE_OUTPUT_DEVICE,
                      mmStatus );
    }
    else
    {
      /****************************************************************/
      /*  The error which occured WAS caused by another               */
      /*  application owning the wave output device.                  */
      /****************************************************************/

      if ( pAudioParams->dwDeviceOptions & REPORT_OPEN_ERROR )
        AudioSendError( pAudioParams,
                        ERROR_OPENING_WAVE_OUTPUT_DEVICE,
                        mmStatus );
    }
  }

  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetWaveFormatSize                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function returns the size of the WAVEFORMATEX structure    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pWaveFormat    A pointer to a WAVEFORMATEX structure.           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns the size of the waveformat structure.     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static DWORD GetWaveFormatSize( LPWAVEFORMATEX pWaveFormat )
{
  DWORD dwSize;

  if ( pWaveFormat->wFormatTag == WAVE_FORMAT_PCM )
  {
    dwSize = sizeof(WAVEFORMATEX);
  }
  else
  {
    dwSize = sizeof(WAVEFORMATEX) + pWaveFormat->cbSize;
  }
  return( dwSize );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessEnableErrorMessage                               */
/*  Author: Bill Hallahan                                             */
/*  Date: March 14, 1994                                              */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function enables sending error messages.                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    The Audio window handle.                                */
/*                                                                    */
/*                                                                    */
/*   Output:                                                          */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT ProcessEnableErrorMessage( HWND hWnd )
{
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  pAudioParams->bEnableErrorMessage = TRUE;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WriteBufferToWaveDevice                                 */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*                                                                    */
/*         This function writes an audio buffer to the wave output    */
/*    device.                                                         */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pAudioParams  A pointer to a structure of type AUDIO_PARAMS_T.  */
/*                                                                    */
/*    pWaveHdr      A pointer to a WAVEHDR structure.                 */
/*                                                                    */
/*    uiLength      The number of samples (which are of type AUDIO_T) */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*     This function returns a the number of samples written to the   */
/*     wave output device.                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static UINT WriteBufferToWaveDevice( LPAUDIO_PARAMS_T pAudioParams,
                                     LPWAVEHDR pWaveHdr,
                                     UINT uiLength )
{
  int i;
  int iNumberToMoveToQueueTop;
  UINT uiWriteLength;
  short * pWordSource;
  LPAUDIO_T pByteDest;
  LPQUEUE_T pAudioQueue;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Limit the length to be written to MAXIMUM_WRITE_LENGTH.         */
  /********************************************************************/

  if ( uiLength > MAXIMUM_WRITE_LENGTH )
    uiLength = MAXIMUM_WRITE_LENGTH;

  /********************************************************************/
  /*  If necessary, wrap the output pointer and move data.            */
  /*  First ensure that the next buffer of data that is written does  */
  /*  not extend beyond the end of the queue. If it does then all     */
  /*  samples starting at the the current output pointer to the last  */
  /*  location at the end of the queue will be moved to the extra     */
  /*  space above the queue start. Set the output pointer to the      */
  /*  start of this data and set the output position relative to      */
  /*  the buffer start (i.e. the output buffer position will end      */
  /*  up either negative or zero).                                    */
  /********************************************************************/

  pAudioQueue = pAudioParams->pAudioQueue;

  if ( pAudioQueue->iOutputPosition + (int)uiLength
                                    > pAudioQueue->iQueueLength )
  {
    /******************************************************************/
    /*  Move samples to the top of the queue.                         */
    /******************************************************************/

    iNumberToMoveToQueueTop =
      pAudioQueue->iQueueLength - pAudioQueue->iOutputPosition;

    /******************************************************************/
    /*  pByteSource = pAudioQueue->pQueueOutput;                      */
    /*  pByteDest =                                                   */
    /*            pAudioQueue->pQueueStart - iNumberToMoveToQueueTop; */
    /*                                                                */
    /*  for ( i = 0; i < iNumberToMoveToQueueTop; i++ )               */
    /*    *pByteDest++ = *pByteSource++;                              */
    /******************************************************************/

    memcpy( pAudioQueue->pQueueStart - iNumberToMoveToQueueTop,
            pAudioQueue->pQueueOutput,
            iNumberToMoveToQueueTop );

    pAudioQueue->pQueueOutput =
      pAudioQueue->pQueueStart - iNumberToMoveToQueueTop;
    pAudioQueue->iOutputPosition = - iNumberToMoveToQueueTop;
  }

  /********************************************************************/
  /*  If the waveOutOpen() function has opened a device which         */
  /*  requires 8 bit samples and 16 bit samples were queued, then     */
  /*  convert the samples to 8 bits here.                             */
  /********************************************************************/

  if ( pAudioParams->bConvertToEightBit )
  {
    pByteDest = pAudioQueue->pQueueOutput;
    pWordSource = (short *)pByteDest;

    for ( i = 0; i < (int)uiLength; i++ )
      *pByteDest++ = (unsigned char)((*pWordSource++) >> 8 ) ^ 0x80;

    uiWriteLength = uiLength >> 1;
  }
  else
  {
    uiWriteLength = uiLength;
  }

  /********************************************************************/
  /*  Set up the WAVEHDR structure.                                   */
  /*  Save the buffer length in the dwUSER portion of the header.     */
  /********************************************************************/

  pWaveHdr->lpData          = pAudioQueue->pQueueOutput;
  pWaveHdr->dwBufferLength  = uiWriteLength;
  pWaveHdr->dwBytesRecorded = 0L;
  pWaveHdr->dwUser          = (DWORD)uiLength;
  pWaveHdr->dwFlags         = 0L;
  pWaveHdr->dwLoops         = 0L;
  pWaveHdr->lpNext          = NULL;
  pWaveHdr->reserved        = 0L;

  /********************************************************************/
  /*  Prepare the header for the waveOutWrite() function.             */
  /********************************************************************/

  mmStatus = waveOutPrepareHeader( pAudioParams->hWaveOut,
                                   pWaveHdr,
                                   sizeof(WAVEHDR));

  if ( mmStatus == MMSYSERR_NOERROR )
  {
    /******************************************************************/
    /*  Write the buffer to the wave output device.                   */
    /******************************************************************/

    mmStatus = waveOutWrite( pAudioParams->hWaveOut,
                             pWaveHdr,
                             sizeof(WAVEHDR));

    /******************************************************************/
    /*  Update the output pointers and the "samples waiting" count.   */
    /******************************************************************/

    pAudioParams->iSamplesWaitingForCompletion += uiLength;
    pAudioQueue->pQueueOutput += uiLength;
    pAudioQueue->iOutputPosition += uiLength;
  }

  /********************************************************************/
  /*  Report any errors which occured.                                */
  /********************************************************************/

  if ( mmStatus )
  {
    AudioSendError( pAudioParams,
                    ERROR_IN_AUDIO_WRITE,
                    mmStatus );
  }

  return( uiLength );
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

  pAudioQueue = pAudioParams->pAudioQueue;
  pAudioQueue->pQueueInput = pAudioQueue->pQueueStart;
  pAudioQueue->pQueueOutput = pAudioQueue->pQueueStart;
  pAudioQueue->iInputPosition = 0;
  pAudioQueue->iOutputPosition = 0;
  pAudioQueue->iQueueCount = 0;

  SetEvent( pAudioParams->hQueueNotFull );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessSetAudioVolumeMessage                            */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function sets the volume of the wave output device.        */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd        The handle to the Audio window.                     */
/*                                                                    */
/*    dwVolume    A DWORD equal to the new volume setting.            */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT ProcessSetAudioVolumeMessage( HWND hWnd, DWORD dwVolume )
{
  MMRESULT mmStatus;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  If stereo volume capability exisits then use the passed volume  */
  /*  "dwVolume". Otherwise use the largest of the upper and lower    */
  /*  16 bit fields of dwVolume as the monaural volume.               */
  /********************************************************************/

  if ( pAudioParams->dwDeviceSupport &
     ( WAVECAPS_LRVOLUME | WAVECAPS_VOLUME ))
  {
    mmStatus = waveOutSetVolume( pAudioParams->uiSelectedDeviceID,
                                 dwVolume );
  }
  else
  {
    mmStatus = MMSYSERR_NOTSUPPORTED;
  }
  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessGetAudioVolumeMessage                            */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function returns the volume of the wave output device.     */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd         The handle to the Audio window.                    */
/*                                                                    */
/*    pdwVolume    A pointer to a DWORD that is set to the volume     */
/*                 level.                                             */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT ProcessGetAudioVolumeMessage( HWND hWnd,
                                             LPDWORD pdwVolume )
{
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  Get the wave output device ID number.                           */
  /********************************************************************/

  return( waveOutGetVolume( pAudioParams->uiSelectedDeviceID,
                            pdwVolume ));
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
/*  Function: ProcessPauseAudioMessage                                */
/*  Author: Bill Hallahan                                             */
/*  Date: April 29, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function pauses audio output.                              */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd    The handle to the Audio window.                         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT ProcessPauseAudioMessage( HWND hWnd )
{
  MMRESULT mmStatus;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  If the wave output device is active then pause it. If it is not */
  /*  active then set the pause flag.                                 */
  /********************************************************************/

  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

  if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
    mmStatus = waveOutPause( pAudioParams->hWaveOut );
  }
  else
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
    mmStatus = MMSYSERR_NOERROR;
  }

  /********************************************************************/
  /*  If the restart was successful then set the pause flag and       */
  /*  reset the hAudioNotPaused event.                                */
  /********************************************************************/

  if ( mmStatus == MMSYSERR_NOERROR )
  {
    ResetEvent( pAudioParams->hAudioNotPaused );
    pAudioParams->bPaused = TRUE;
  }
  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessResumeAudioMessage                               */
/*  Author: Bill Hallahan                                             */
/*  Date: April 29, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function resumes audio output.                             */
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

static LRESULT ProcessResumeAudioMessage( HWND hWnd )
{
  MMRESULT mmStatus;
  LPAUDIO_PARAMS_T pAudioParams;

  /********************************************************************/
  /*  Get the Audio parameters for the window.                        */
  /********************************************************************/

  pAudioParams = (LPAUDIO_PARAMS_T)GetWindowLong( hWnd, GWL_USERDATA );

  /********************************************************************/
  /*  If the wave output device was paused then restart it.           */
  /********************************************************************/

  EnterCriticalSection( pAudioParams->pcsAudioDeviceState );

  if ( pAudioParams->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
    mmStatus = waveOutRestart( pAudioParams->hWaveOut );
  }
  else
  {
    LeaveCriticalSection( pAudioParams->pcsAudioDeviceState );
    mmStatus = MMSYSERR_NOERROR;
  }

  /********************************************************************/
  /*  If the restart was successful then reset the pause flag and     */
  /*  set the hAudioNotPaused event.                                  */
  /********************************************************************/

  if ( mmStatus == MMSYSERR_NOERROR )
  {
    SetEvent( pAudioParams->hAudioNotPaused );
    pAudioParams->bPaused = FALSE;
  }
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

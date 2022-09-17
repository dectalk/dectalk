/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Include File: audioapi.h                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: March 30, 1993                                              */
/*                                                                    */
/**********************************************************************/
/*
 * revisions:
 *		tek	07jan98		bats850: prototype for PumpModeMessage
 */
/**********************************************************************/

#ifndef _AUDIOAPI_H_

#define _AUDIOAPI_H_

#include <windows.h>
#include <mmreg.h>

// MVP :Common definitions goes here....
typedef unsigned char AUDIO_T;

typedef AUDIO_T *LPAUDIO_T;

// MVP: This header file is used for OLE-DECTALK DLL also.
#ifndef OLEDECTALK

/**********************************************************************/
/*                                                                    */
/*      ASYNCHRONOUS ERROR MESSAGES.                                  */
/*                                                                    */
/*         After function QueueAudio() is called, the audio thread    */
/*    may send error messages to the window procedure specified by    */
/*    the window handle passed in function OpenAudio(). The message   */
/*    number is passed in the call to function OpenAudio(). One of    */
/*    the error codes listed below will be contained in the WPARAM    */
/*    message parameter. The LPARAM message parameter will contain    */
/*    a value of type MMRESULT. An application may use function       */
/*    waveOutGetErrorText() to obtain a text string corresponding to  */
/*    the MMRESULT error code.                                        */
/*                                                                    */
/**********************************************************************/

#define  ERROR_IN_AUDIO_WRITE                1
#define  ERROR_OPENING_WAVE_OUTPUT_DEVICE    2
#define  ERROR_GETTING_DEVICE_CAPABILITIES   3

/**********************************************************************/
/*  Waveform output device initialization symbols for function        */
/*  OpenAudio().                                                      */
/**********************************************************************/

#define  OWN_AUDIO_DEVICE       0x00000001
#define  REPORT_OPEN_ERROR      0x00000002

/**********************************************************************/
/*  Identifier Definitions for function StatusAudio().                */
/**********************************************************************/

#define  AUDIO_DEVICE_PLAYING     0
#define  AUDIO_QUEUE_COUNT        1
#define  AUDIO_DEVICE_ID          2


/**********************************************************************/
/*  Function prototypes.                                              */
/*                                                                    */
/*  An application may call the InitAudioInstance() function to       */
/*  register the "AudioWndClass" window class. The the CreateWindow() */
/*  function may be called to create an audio window. If this is done */
/*  then the LPVOID parameter of the CreateWindow() function must be  */
/*  a pointer to a structure of type AUDIO_OPEN_T. The other          */
/*  alternative is for an application to call the OpenAudio()         */
/*  function. This will create an audio window in a separate thread.  */
/*  The OpenAudio() function calls the InitAudioInstance() function   */
/*  thus making it unnecessary for the application to register the    */
/*  window class.                                                     */
/*                                                                    */
/**********************************************************************/

ATOM InitAudioInstance( HINSTANCE );

MMRESULT OpenAudio( HWND, HWND *, UINT, UINT, LPWAVEFORMATEX, DWORD );

MMRESULT QueueAudio( HWND, LPAUDIO_T, DWORD );

MMRESULT SetAudioVolume( HWND, DWORD );

MMRESULT GetAudioVolume( HWND, LPDWORD );

MMRESULT GetAudioPosition( HWND, LPDWORD, BOOL );

MMRESULT PauseAudio( HWND );

MMRESULT ResumeAudio( HWND );

MMRESULT StatusAudio( HWND, LPDWORD, LPDWORD, DWORD );

MMRESULT ResetAudio( HWND );

MMRESULT GetAudioParams( HWND, LPWAVEFORMATEX );

MMRESULT SetAudioParams( HWND, LPWAVEFORMATEX );

MMRESULT EnableAudioErrorMessage( HWND );

MMRESULT WaitForAudioToComplete( HWND );

MMRESULT CloseAudio( HWND );
#else
#include "audiodef.h"
MMRESULT InitializeDECtalkAudio(HWND,LPAUDIO_HANDLE_T* );
// tek 07jan98 bats850: the SAPI version of the function.
#ifdef __cplusplus
extern "C" {
#endif __cplusplus
BOOL PumpModeMessage(LPAUDIO_PARAMS_T);
#ifdef __cplusplus
} // extern "C"
#endif __cplusplus

#if 0   //MVP: New playaud.h defines these
MMRESULT PA_Queue(LPAUDIO_HANDLE_T,LPAUDIO_T,DWORD);
MMRESULT PA_DestroyHandle(LPAUDIO_HANDLE_T);
MMRESULT PA_SetVolume( LPAUDIO_HANDLE_T, DWORD );
MMRESULT PA_GetVolume( LPAUDIO_HANDLE_T, LPDWORD );
MMRESULT PA_GetPosition( LPAUDIO_HANDLE_T, LPDWORD, BOOL );
MMRESULT PA_GetFormat( LPAUDIO_HANDLE_T, LPWAVEFORMATEX );
MMRESULT PA_SetFormat( LPAUDIO_HANDLE_T, LPWAVEFORMATEX );
MMRESULT PA_Reset( LPAUDIO_HANDLE_T );
#endif
#endif

#endif

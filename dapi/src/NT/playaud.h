/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Include File: playaud.h                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This is an audio Application Programming Interface (API)   */
/*    that uses the Microsoft Low level Audio services for playing    */
/*    audio. The Microsoft Low level service for playing audio are    */
/*    provided on Windows 95, Windows NT, Digital UNIX, and OpenVMS.  */
/*    This code supports all of these operating systems.              */
/*                                                                    */
/*         This API encapsulates audio output processing. An          */
/*    application calls the PA_CreatePlayHandle() function to create  */
/*    a "play audio" thread. This thread is automatically opens and   */
/*    closes the wave output device as necessary.                     */
/*                                                                    */
/*         An application can call any one of the functions listed at */
/*    the end of this include file to play audio. File "playaud.txt"  */
/*    lists all the arguments for each of these function.             */
/*                                                                    */
/*         All of the "play audio" API functions are thread-safe      */
/*    except the PA_CreatePlayHandle() function and the               */
/*    PA_DestroyPlayHandle() function. These each contain a handle    */
/*    instance counter that is not thread-safe. If each of these      */
/*    functions are protected by the same mutex then either of them   */
/*    may be called from multiple threads.                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/*
 *	12nov97		tek		add prototypes for QW audio time (SAPI Transport)
 *						(original dates in aug97)
 *	005	ETT	10/05/1998      Added Linux code.
 *		tek	07jan98		bats850: prototype for PumpModeMessage
 */

#ifndef _PLAYAUD_H_

#define _PLAYAUD_H_

#include "opmmsys.h"
#include "opatype.h"
#ifdef __linux__
#include "dtmmedefs.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/**********************************************************************/
/*  The audio handle type.                                            */
/**********************************************************************/

#ifndef _PLAYAUDD_H_
typedef void * HPLAY_AUDIO_T;
#endif

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*    ASYNCHRONOUS MESSAGES.                                          */
/*                                                                    */
/*       After function PA_Queue() is called, the "play audio"        */
/*  thread may send messages by calling a callback function that is   */
/*  supplied for the application. This callback function is passed    */
/*  as an argument to the PA_CreatePlayHandle() function. The         */
/*  callback function argument may be set to NULL if the application  */
/*  does not need to receive any of the "play audio" messages.        */
/*  Applications should not call any of the "play audio" API routines */
/*  from within this callback function. The callback function         */
/*  prototype is;                                                     */
/*                                                                    */
/*  unsigned int PlayAudioCallbackRoutine( HPLAY_AUDIO_T pPlayAudio,  */
/*                                         ATYPE_T aInstance,         */
/*                                         ATYPE_T aMessage,          */
/*                                         ATYPE_T aParam )           */
/*                                                                    */
/*      The callback function returns the "play audio" handle for     */
/*  the "play audio" instance, an instance parameter that was passed  */
/*  to the PA_CreatePlayHandle() function, a message value that is    */
/*  one of the messages below, and an extra message-dependent         */
/*  parameter.                                                        */
/*                                                                    */
/*       The unsigned integer return value of the callback function   */
/*  is only used for the PA_DEVICE_OPEN_FAILURE message. For this     */
/*  message, if the callback function return value is FALSE then      */
/*  then subsequent "device open failures" will not cause a message   */
/*  to be sent (that is, any more callbacks) until either the         */
/*  PA_Reset() function is called or the "play audio" device has been */
/*  opened and closed. If the callback function return value is equal */
/*  to TRUE, then the "device open failure" message will be sent      */
/*  periodically as the audio subsystem attempt to open the device.   */
/*                                                                    */
/*       The following table lists the message-dependent parameter    */
/*  for each of the messages.                                         */
/*                                                                    */
/*      Message ID              Message-dependent parameter (aParam)  */
/*                                                                    */
/*    PA_PLAY_START               0 ( Not used )                      */
/*                                                                    */
/*    PA_PLAY_STOP                0 ( Not used )                      */
/*                                                                    */
/*    PA_DEVICE_OPEN_FAILURE      MMRESULT Error code                 */
/*                                                                    */
/*    PA_SYNC_MARK                aTag parameter passed to the        */
/*                                PA_SynchronizationMark() function.  */
/*                                                                    */
/*    PA_SYNC_ERROR               MMRESULT Error code                 */
/*                                                                    */
/*    PA_GET_CAPS_ERROR           MMRESULT Error code                 */
/*                                                                    */
/*    PA_WRITE_ERROR              MMRESULT Error code                 */
/*                                                                    */
/*                                                                    */
/*       The PA_SYNC_ERROR, PA_GET_CAPS_ERROR, and the PA_WRITE_ERROR */
/*  messages are for debugging and will not generally be sent to      */
/*  applicaations. Application should never need to process these     */
/*  messages.                                                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  PA_PLAY_START           1
#define  PA_PLAY_STOP            2
#define  PA_DEVICE_OPEN_FAILURE  3
#define  PA_SYNC_MARK            4
#define  PA_SYNC_ERROR           5
#define  PA_GET_CAPS_ERROR       6
#define  PA_WRITE_ERROR          7

/**********************************************************************/
/*  Waveform output device initialization symbols for function        */
/*  PA_CreatePlayHandle().                                            */
/**********************************************************************/

#define  PA_OWN_DEVICE      0x00000001

/**********************************************************************/
/*  Identifier Definitions for function PA_Status().                  */
/**********************************************************************/

#define  PA_DEVICE_PLAYING  0
#define  PA_FREE_SPACE      1
#define  PA_QUEUE_COUNT     2
#define  PA_DEVICE_ID       3

/**********************************************************************/
/*  Function prototypes.                                              */
/**********************************************************************/

MMRESULT PA_CreatePlayHandle( HPLAY_AUDIO_T * ppPlayAudio,
                    unsigned int uiWaveOutDeviceID,
                    LPWAVEFORMATEX pWaveFormat,
                    DWORD dwDeviceOptions,
                    unsigned int ( * CallbackRoutine )( HPLAY_AUDIO_T,
                                                        ATYPE_T,
                                                        ATYPE_T,
                                                        ATYPE_T ),
                    ATYPE_T vInstance );

MMRESULT PA_DestroyPlayHandle( HPLAY_AUDIO_T pPlayAudio );

MMRESULT PA_Queue( HPLAY_AUDIO_T pPlayAudio,
                   unsigned char * pBuffer,
                   DWORD dwLength );

MMRESULT PA_SetVolume( HPLAY_AUDIO_T pPlayAudio, DWORD dwVolume );

MMRESULT PA_GetVolume( HPLAY_AUDIO_T pPlayAudio,
                       LPDWORD pdwVolume );

MMRESULT PA_SynchronizationMark( HPLAY_AUDIO_T pPlayAudio, ATYPE_T aTag );

MMRESULT PA_GetPosition( HPLAY_AUDIO_T pPlayAudio,
                         LPDWORD pdwPosition,
                         unsigned int bFast );

#ifdef OLEDECTALK // this is sapi-only
MMRESULT PA_GetQWPosition( HPLAY_AUDIO_T, QWORD *pwqTimeStamp); //tek 04aug97
HRESULT PA_SetBookmark(HPLAY_AUDIO_T, DWORD dwMarkId); // tek 22aug97

#endif //OLEDECTALK

MMRESULT PA_Pause( HPLAY_AUDIO_T pPlayAudio );

MMRESULT PA_Resume( HPLAY_AUDIO_T pPlayAudio );

MMRESULT PA_Reset( HPLAY_AUDIO_T pPlayAudio );

MMRESULT PA_Status( HPLAY_AUDIO_T pPlayAudio,
                    DWORD dwIdentifierArray[],
                    DWORD dwStatusArray[],
                    DWORD dwNumberOfStatusValues );

MMRESULT PA_GetFormat( HPLAY_AUDIO_T pPlayAudio,
                       LPWAVEFORMATEX pWaveFormat );

MMRESULT PA_SetFormat( HPLAY_AUDIO_T pPlayAudio,
                       LPWAVEFORMATEX pWaveFormat );

MMRESULT PA_WaitForPlayToComplete( HPLAY_AUDIO_T pPlayAudio );

// tek 07jan98 bats850: the non-SAPI version of the function.
#ifndef OLEDECTALK
BOOL PumpModeMessage(HPLAY_AUDIO_T);
#endif //OLEDECTALK


#ifdef __cplusplus
}  /* End extern "C" */
#endif

#endif

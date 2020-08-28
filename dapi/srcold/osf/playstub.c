/*                       COPYRIGHT NOTICE 
   Copyright © 2001 Force Computers Inc. A Solectron company. All rights reserved.    
   © SMART Modular Technologies 1999. All rights reserved.    

   All Rights reserved. Unpublished rights reserved under the 
   copyright laws of the United States. Copyright is claimed in 
   the computer program and user interface thereof. 
 
   The software contained on this media is proprietary to and 
   embodies the confidential technology of Force Computers Incorporated.
   Possession, use, duplication or dissemination of 
   the software and media is authorized only pursuant to a valid
   written license from Force Computers Incorporated.
  
   The name of Force Computers Incorporated may not be used to endorse or 
   promote products derived from this software without specific prior 
   written permission. All other rights reserved.
  
   THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED 
   WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF
   NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. 
   Force assumes no responsibility AT ALL for the use or reliability of 
   this software.
*/
/* 
 * HISTORY
 * Revision 1.1.2.3  1996/09/25  13:43:43  Cathy_Page
 * 	Modified PA_GetFormat - changed approved by Bill H
 * 	[1996/09/25  13:41:35  Cathy_Page]
 *
 * Revision 1.1.2.2  1996/01/05  21:54:54  Bill_Hallahan
 * 	Initial creation
 * 	[1996/01/05  21:53:14  Bill_Hallahan]
 * 
 * Rev Name Date		Comment
 * --- ---- ----------  ---------------------------
 * 003 MGS	05/18/2001	Added PA_DoSync for VxWorks
 * 004 CAB	05/25/2001	Added copyright info
 * 005 MGS	06/19/2001	Solaris Port BATS#972
 */
/*******************************************************************
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   playstub.c
** MODULE NAME: 
**
** MODULE DESCRIPTION: This file implements a stub for the portable
**                     audio API.
** 
** DESIGN OVERVIEW:
** 
**--
*/
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  File: playstub.c                                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         Application Programming Interface to play audio.           */
/*                                                                    */
/*         This is an audio Application Programming Interface (API)   */
/*    that uses Microsofts Low level audio services for playing       */
/*    audio. The Microsoft Low level service for playing audio are    */
/*    provided on Windows 95, Windows NT, Digital UNIX, and OpenVMS.  */
/*    This code supports all of these operating systems.              */
/*                                                                    */
/*         This API encapsulates audio output processing. An          */
/*    application calls the PA_CreatePlayHandle() function to create  */
/*    a "play audio" thread. Only this thread calls the low level     */
/*    audio functions. An application can call any one of the         */
/*    following functions to communicate with the "play audio"        */
/*    thread. Any application using these functions must include file */
/*    "playaud.h".                                                    */
/*                                                                    */
/*         Opening and closing of the waveform output device is       */
/*    handled automatically by the "play audio" thread.               */
/*                                                                    */
/*                                                                    */
/*      THE "PLAY AUDIO" API FUNCTIONS                                */
/*                                                                    */
/*                                                                    */
/*    MMRESULT PA_CreatePlayHandle( HPLAY_AUDIO_T * ppPlayAudio,      */
/*                unsigned int uiWaveOutDeviceID,                     */
/*                LPWAVEFORMATEX pWaveFormat,                         */
/*                DWORD dwDeviceOptions,                              */
/*                unsigned int ( * CallbackRoutine )( HPLAY_AUDIO_T,  */
/*                                                    ATYPE_T,        */
/*                                                    ATYPE_T,        */
/*                                                    ATYPE_T );      */
/*                ATYPE_T aInstance );                                */
/*                                                                    */
/*    MMRESULT PA_DestroyPlayHandle( HPLAY_AUDIO_T pPlayAudio );      */
/*                                                                    */
/*    MMRESULT PA_Queue( HPLAY_AUDIO_T pPlayAudio,                    */
/*                       LPAUDIO_T pBuffer,                           */
/*                       DWORD dwLength )                             */
/*                                                                    */
/*    MMRESULT PA_Reset( HPLAY_AUDIO_T pPlayAudio );                  */
/*                                                                    */
/*    MMRESULT PA_Pause( HPLAY_AUDIO_T pPlayAudio );                  */
/*                                                                    */
/*    MMRESULT PA_Resume( HPLAY_AUDIO_T pPlayAudio );                 */
/*                                                                    */
/*    MMRESULT PA_GetFormat( HPLAY_AUDIO_T pPlayAudio,                */
/*                           LPWAVEFORMATEX pWaveFormat );            */
/*                                                                    */
/*    MMRESULT PA_SetFormat( HPLAY_AUDIO_T pPlayAudio,                */
/*                           LPWAVEFORMATEX pWaveFormat );            */
/*                                                                    */
/*    MMRESULT PA_GetVolume( HPLAY_AUDIO_T pPlayAudio,                */
/*                           LPDWORD pdwVolume );                     */
/*                                                                    */
/*    MMRESULT PA_SetVolume( HPLAY_AUDIO_T pPlayAudio,                */
/*                           DWORD dwVolume );                        */
/*                                                                    */
/*    MMRESULT PA_GetPosition( HPLAY_AUDIO_T pPlayAudio,              */
/*                             LPDWORD pdwPosition,                   */
/*                             unsigned int bFast );                  */
/*                                                                    */
/*    MMRESULT PA_Status( HPLAY_AUDIO_T pPlayAudio,                   */
/*                        DWORD dwIdentifierArray[],                  */
/*                        DWORD dwStatusArray[],                      */
/*                        DWORD dwNumberOfStatusValues );             */
/*                                                                    */
/*    MMRESULT PA_WaitForPlayToComplete( HPLAY_AUDIO_T pPlayAudio );  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#include "playaudd.h"
#include "playaud.h"

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_CreatePlayHandle                                     */
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
/*    ppPlayAudio         A pointer to a pointer to a structure of    */
/*                        type PLAY_AUDIO_T. This is initialized      */
/*                        by this function.                           */
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
/*  PA_OWN_DEVICE         The wave output device will be opened upon  */
/*                        return from the PA_CreatePlayHandle()       */
/*                        function. No other process may allocate the */
/*                        wave output device until the                */
/*                        PA_DestroyPlayHandle() function is called.  */
/*                                                                    */
/*                        If PA_OWN_DEVICE is NOT used then the wave  */
/*                        output device will be opened sometime after */
/*                        audio is queued by the PA_Queue() function. */
/*                        The wave output device will be held until   */
/*                        there is no more audio to be played. If an  */
/*                        attempt is made to open the wave output     */
/*                        device while another process owns the       */
/*                        device, then the queued audio will be       */
/*                        played when the device becomes available.   */
/*                                                                    */
/*    CallbackRoutine     The address of a callback routine that is   */
/*                        used to report the audio starting and       */
/*                        stopping and the occurence of errors. If    */
/*                        this paramter is set to NULL then no        */
/*                        reporting will be performed.                */
/*                                                                    */
/*    aInstance           An instance specifier that is of type       */
/*                        ATYPE_T. This will be returned by the       */
/*                        "play audio" callback routine.              */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if audio initialization was successful.      */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NODRIVER      No wave output device present            */
/*    MMSYSERR_BADDEVICEID   Device ID out of range                   */
/*    MMSYSERR_NOMEM         Memory allocation error                  */
/*    MMSYSERR_ERROR         Insufficient system resources            */
/*                                                                    */
/*    The following error message can be returned only if the         */
/*    PA_OWN_DEVICE flag is set in the dwDeviceOptions argument.      */
/*    If this flag is NOT used and the requested audio format is NOT  */
/*    supported, then the waveOutOpen call will fail only after audio */
/*    is queued. Application can call the PA_SetFormat() function to  */
/*    ensure that the requested format is supported before queuing    */
/*    audio.                                                          */
/*                                                                    */
/*    MMSYSERR_NOTSUPPORTED  Unsupported audio format                 */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_CreatePlayHandle( HPLAY_AUDIO_T * ppPlayAudio,
                    unsigned int uiWaveOutDeviceID,
                    LPWAVEFORMATEX pWaveFormat,
                    DWORD dwDeviceOptions,
                    unsigned int ( * CallbackRoutine )( HPLAY_AUDIO_T,
                                                        ATYPE_T,
                                                        ATYPE_T,
                                                        ATYPE_T ),
                    ATYPE_T aInstance )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_DestroyPlayHandle                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function destroys the audio thread, the timer thread, and  */
/*    frees the audio handle.                                         */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_DestroyPlayHandle( HPLAY_AUDIO_T pPlayAudio )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_Queue                                                */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function queues a buffer of samples to the wave       */
/*    output device. This function will block until there is enough   */
/*    space in the audio queue. The wave output device will open      */
/*    automatically. This will happen one of two ways. Either enough  */
/*    audio data in the queue will cause this function to send the    */
/*    ID_Open_Wave_Output_Device message, or if the queue byte count  */
/*    remains non-zero while the wave output device is closed, then   */
/*    after a sufficent amount of time, the timer thread will send    */
/*    the ID_Open_Wave_Output_Device message. The wave output device  */
/*    is closed automatically when all audio samples have been        */
/*    played.                                                         */
/*                                                                    */
/*         Each queued audio block MUST have a length that is a       */
/*    multiple of the current block alignment. If it does not, then   */
/*    the audio samples will still be added to the audio queue, but   */
/*    the audio driver may hang.                                      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    pBuffer       A pointer (of type unsigned char) to a buffer     */
/*                  that contains byte samples.                       */
/*                                                                    */
/*    dwLength      A DWORD which is equal to the number of bytes to  */
/*                  be queued which are in the buffer pointed to by   */
/*                  "pBuffer".                                        */
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
/*         After PA_Queue() function is called, the audio thread      */
/*    may send asynchronous messages by calling the callback function */
/*    that is passed in the PA_CreatePlayHandle() function. One of    */
/*    the message codes listed below will be passed in the second     */
/*    field of the callback routine.                                  */
/*                                                                    */
/*        Error code                                                  */
/*                                                                    */
/*      PA_PLAY_START           1                                     */
/*      PA_PLAY_STOP            2                                     */
/*      PA_DEVICE OPEN_FAILURE  3                                     */
/*      PA_GET_CAPS_ERROR       4                                     */
/*      PA_WRITE_ERROR          5                                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_Queue( HPLAY_AUDIO_T pPlayAudio,
                   LPAUDIO_T pBuffer,
                   DWORD dwLength )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_Reset                                                */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function stops any audio which is playing and resets  */
/*    the audio queue. A reset may be delayed if another thread       */
/*    has called the PA_Queue() function.                             */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_Reset( HPLAY_AUDIO_T pPlayAudio )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_Pause                                                */
/*  Author: Bill Hallahan                                             */
/*  Date: April 29, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function pauses audio output.                              */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_Pause( HPLAY_AUDIO_T pPlayAudio )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_Resume                                               */
/*  Author: Bill Hallahan                                             */
/*  Date: April 29, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function resumes audio output.                             */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_Resume( HPLAY_AUDIO_T pPlayAudio )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_GetFormat                                            */
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
/*    pPlayAudio     A pointer to a structure of type PLAY_AUDIO_T.   */
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

MMRESULT PA_GetFormat( HPLAY_AUDIO_T pPlayAudio,
                       LPWAVEFORMATEX pWaveFormat )
{
#if 0
  pWaveFormat->wFormatTag = WAVE_FORMAT_PCM;
  pWaveFormat->nSamplesPerSec = uiSampleRate;
  pWaveFormat->nChannels = 1;
  pWaveFormat->nAvgBytesPerSec = uiSampleRate << 1;

  if ( uiSampleRate = 8000 )
  {
    pWaveFormat->nBlockAlign = 1;
    pWaveFormat->wBitsPerSample = 8;
  }
  else
  {
    pWaveFormat->nBlockAlign = 2;
    pWaveFormat->wBitsPerSample = 16;
  }

  pWaveFormat->cbSize = 0;
#endif

  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_SetFormat                                            */
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
/*    pPlayAudio     A pointer to a structure of type PLAY_AUDIO_T.   */
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

MMRESULT PA_SetFormat( HPLAY_AUDIO_T pPlayAudio,
                       LPWAVEFORMATEX pWaveFormat )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_GetVolume                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function returns the volume of the wave output device.     */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    pdwVolume     A pointer to a DWORD which will contain the       */
/*                  device volume if the function returns             */
/*                  successfully.                                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_GetVolume( HPLAY_AUDIO_T pPlayAudio, LPDWORD pdwVolume )
{
  *pdwVolume = 0;
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_SetVolume                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function sets the volume of the wave output device.        */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    dwVolume      A DWORD which contains the device volume.         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_SetVolume( HPLAY_AUDIO_T pPlayAudio, DWORD dwVolume )
{
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_GetPosition                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns the position of the last byte        */
/*    sample played by the wave output device since either the        */
/*    PA_CreatePlayHandle() function or the PA_Reset() function       */
/*    was called. At a sample rate of 11025 Hz. the 32 bit position   */
/*    count will not wrap back to zero in over 100 hours.             */
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    pdwPosition   A pointer to a DWORD which will contain the       */
/*                  device position. The device position is the       */
/*                  sample number of the last audio byte sample       */
/*                  that has played since a call to the               */
/*                  PA_CreatePlayHandle() function or the             */
/*                  PA_Reset() function. If the device is not         */
/*                  available or the audio position query is not      */
/*                  supported then 0xFFFFFFFF is returned.            */
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

MMRESULT PA_GetPosition( HPLAY_AUDIO_T pPlayAudio,
                         LPDWORD pdwPosition,
                         unsigned int bFast )
{
  *pdwPosition = 0xFFFFFFFF;
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_Status                                               */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         Function PA_Status() returns selected status information   */
/*    about the audio system.                                         */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio          A pointer to a structure of type            */
/*                        PLAY_AUDIO_T.                               */
/*                                                                    */
/*    dwIdentifierArray   An array of values of type DWORD which      */
/*                        contain identifiers that specify the status */
/*                        values to return in array dwStatusArray[].  */
/*                        These values may be one of the following    */
/*                        constants:                                  */
/*                                                                    */
/*      constant               status return value                    */
/*                                                                    */
/*  PA_DEVICE_PLAYING     Returns a value of TRUE if the audio device */
/*                        is either starting up, playing, or shutting */
/*                        down, and returns a value of FALSE if the   */
/*                        audio device is inactive.                   */
/*                                                                    */
/*  PA_QUEUE_COUNT        The number of samples remaining in the      */
/*                        audio queue is returned. This will go to    */
/*                        zero before all of the audio has completed  */
/*                        playing.                                    */
/*                                                                    */
/*  PA_DEVICE_ID          This is used to return the selected wave    */
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

MMRESULT PA_Status( HPLAY_AUDIO_T pPlayAudio,
                    DWORD dwIdentifierArray[],
                    DWORD dwStatusArray[],
                    DWORD dwNumberOfStatusValues )
{
  unsigned int uiI;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Range check the number of status values requested.              */
  /********************************************************************/

  if (( dwNumberOfStatusValues == 0 )
    || ( dwNumberOfStatusValues > MAXIMUM_STATUS_VALUES ))
    return MMSYSERR_INVALPARAM;

  /********************************************************************/
  /*  Set the default error return value to indicate success.         */
  /********************************************************************/

  mmStatus = MMSYSERR_NOERROR;

  /********************************************************************/
  /*  Loop and fill in array puiStatus[].                             */
  /********************************************************************/

  for ( uiI = 0; uiI < dwNumberOfStatusValues; uiI++ )
  {
    dwStatusArray[uiI] = 0;
  }

  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_WaitForPlayToComplete                                */
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_WaitForPlayToComplete( HPLAY_AUDIO_T pPlayAudio )
{
  return MMSYSERR_NOERROR;
}


void PA_DoSync(HPLAY_AUDIO_T pPlayAudio)
{
}

/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	27	05/21/97	leeber	Build 109 V4.60.04 R003 04/22/99; Freeze Mark; No matching AD Mark. 04/27/99 cjl
	26	05/21/97	leeber	Build 109 V4.60.03 R003 03/31/99 Freeze Mark 04/02/99 cjl
	25	05/21/97	leeber	Build 108 V4.60.02 B002 01/29/99, Freeze Mark, 02/25/99 cjl
	24	05/21/97	leeber	Files verified as different on both WinDif and StarTeam for chnages between AD and RND. 02/01/99 cjl
	23	05/21/97	leeber	AD->RND Pre-V4.60.01 B002 Freeze Transfer, 01/19/99 cjl
	22	05/21/97	leeber	Build 108 V4.51.08 R007 11/03/98, Patch BATS#741 and UNIX build process bugs. 11/06/98 cjl
	21	05/21/97	leeber	AD-> RND File Update; Alpha kitting and DETX build not verified, End Of Beta Test, No showstops/highs; For release mark. Build 108 V4.51.07 R006 08/20/98. 08/31/98 cjl
	20	05/21/97	leeber	BUILD 108 V4.51.06 R005 06/26/98; BATS#249, 290, 313, 428, 492, 532, 546, 550, 566, 590, 599, 602, 603, 607, 608, 610, 613, 616, 623, 626, 631-633, 636-639, 630, 641-643, 645, 648, 651, 656-661, 663, 665, 666, 668, 672, 674-677, 681-683, 685, 688-693, 695
	19	05/21/97	leeber	This has the correct documentation that goes with Build 107 V4.50.04 R004, from AD. 04/15/98 cjl
	18	05/21/97	leeber	Code freeze Build 107 V4.50.04 R004 03/20/98 has been moved from AD->RND for testing. New keys, BATS (459, 590, 606, 607, 609, 610, 617, 619, 620, 622, 626, 627, 628 & 630) fixes, better process, SAPI features added. 03/27/98 cjl
	17	05/21/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	16	05/21/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	15	05/21/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	14	05/21/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	13	05/21/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	12	05/21/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	11	05/21/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	10	05/21/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	9	05/21/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	8	05/21/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	7	05/21/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	6	05/21/97	leeber	Build 104 V4.40.43 R007 08/18/97; Static Builds, Help files, BATS 124, 147, 152, 223, 257, 270, 283, 298, 314, 340, 348, 351, 364, 384, 388, 390, 395, 396, 405, 409-412, 416, 422, 438 & 441. 08/18/97 cjl FREEZE
	5	05/21/97	leeber	Preliminary Code Freeze; Missing docs, hlp and tuning files; otherwisw complete. cjl BUILD 104 V4.40.40 R007 x8/07/97
	4	05/21/97	leeber	Build 104 V4.40.38 B006 _6/25/97 Typning Mode w/assistve32 SDK, Re_Freeze after system crash. 6/25/97 cjl
	3	05/21/97	leeber	Build 104 V4.40.38 B006 06/25/97 Typning Mode w/assistve32 SDK. 6/25/97 cjl
	2	05/21/97	leeber	This is "BUILD 104 V4.40.37 B006H 06/20/97" and contans the special typing_mode build for Henter Joyce. 6/20/97 cjl
	1	05/21/97	simoneau	Initial Version
$
 * Revision 1.1.2.3  1996/09/25  13:43:43  Cathy_Page
 * 	Modified PA_GetFormat - changed approved by Bill H
 * 	[1996/09/25  13:41:35  Cathy_Page]
 *
 * Revision 1.1.2.2  1996/01/05  21:54:54  Bill_Hallahan
 * 	Initial creation
 * 	[1996/01/05  21:53:14  Bill_Hallahan]
 * 
 * $EndLog$
 */
/*
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

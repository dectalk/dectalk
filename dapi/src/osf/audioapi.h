/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.3  1996/01/04  20:03:09  Bill_Hallahan
 * 	New Audio Subsystem
 * 	[1996/01/04  20:02:55  Bill_Hallahan]
 *
 * Revision 1.1.2.2  1995/07/05  19:35:30  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:21  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.4  1995/03/17  15:25:28  Krishna_Mangipudi
 * 	Rearrange include files
 * 	[1995/03/17  15:25:19  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.3  1994/11/09  15:58:34  Krishna_Mangipudi
 * 	V4.2 SSB
 * 	[1994/11/08  22:09:45  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  23:07:14  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:12:36  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
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
/**********************************************************************/
/*                                                                    */
/*  Include File: audioapi.h                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: December 22, 1995                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#ifndef _AUDIOAPI_H_

#define _AUDIOAPI_H_

#include "playaud.h"

/**********************************************************************/
/*  Redefinition of the audio handle.                                 */
/**********************************************************************/

typedef  HPLAY_AUDIO_T  LPAUDIO_HANDLE_T;

/**********************************************************************/
/*                                                                    */
/*      ASYNCHRONOUS ERROR MESSAGES.                                  */
/*                                                                    */
/*         The new audio report messages are different values. These  */
/*    messages are mapped to text-to-speech API error messages in     */
/*    the "Play Audio" callback function.                             */
/*                                                                    */
/*                                                                    */
/*                      Audio API        TTS return                   */
/*                      return value     value                        */
/*                                                                    */
/*  PA_PLAY_START           1                                         */
/*  TTS_AUDIO_START                        4                          */
/*                                                                    */
/*  PA_PLAY_STOP            2                                         */
/*  TTS_AUDIO_START                        5                          */
/*                                                                    */
/*                                                                    */
/*  PA_DEVICE_OPEN_FAILURE  3                                         */
/*  ERROR_OPENING_WAVE_OUTPUT_DEVICE       2                          */
/*                                                                    */
/*                                                                    */
/*  PA_GET_CAPS_ERROR       4                                         */
/*  ERROR_GETTING_DEVICE_CAPABILITIES      3                          */
/*                                                                    */
/*                                                                    */
/*  PA_WRITE_ERROR          5                                         */
/*  ERROR_IN_AUDIO_WRITE                   1                          */
/*                                                                    */
/**********************************************************************/

/**********************************************************************/
/*  Waveform output device initialization symbols for function        */
/*  OpenAudio().                                                      */
/**********************************************************************/

#define  OWN_AUDIO_DEVICE       0x00000001  /* Same as PA_OWN_DEVICE  */

/**********************************************************************/
/*  Identifier Definitions for function StatusAudio().                */
/**********************************************************************/

#define  AUDIO_DEVICE_PLAYING     0  /*  Same as PA_DEVICE_PLAYING    */
#define  AUDIO_QUEUE_COUNT        1  /*  Same as PA_QUEUE_COUNT       */
#define  AUDIO_DEVICE_ID          2  /*  Same as PA_DEVICE_ID         */

/**********************************************************************/
/*  Function name mappings for the former audio API to the new API.   */
/**********************************************************************/

#define  QueueAudio  PA_Queue
#define  ResetAudio  PA_Reset
#define  PauseAudio  PA_Pause
#define  ResumeAudio  PA_Resume
#define  GetAudioParams  PA_GetFormat
#define  SetAudioParams  PA_SetFormat
#define  SetAudioVolume  PA_SetVolume
#define  GetAudioVolume  PA_GetVolume
#define  GetAudioPosition  PA_GetPosition
#define  StatusAudio  PA_Status
#define  WaitForAudioToComplete  PA_WaitForPlayToComplete

#endif

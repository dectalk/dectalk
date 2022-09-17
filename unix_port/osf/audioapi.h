/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
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

/*
 ***********************************************************************
 *
 *                           Copyright ©                        
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    © Force Computers, Inc. 2000. All rights reserved.  
 *
 *    This is an unpublished work, and is confidential and proprietary:
 *    technology and information of Fonix corporation.  No part of this
 *    code may be reproduced, used or disclosed without written consent of
 *    Fonix corporation in each and every instance.
 *
 *********************************************************************** 
 *    File Name:	sapiiont.h
 *    Author:		Matthew Schnee
 *    Creation Date:06/28/2000                                               
 *                                                 
 *    Functionality:
 *    this file is intended to be able to output data to the sapi object.
 *		the source file for this must be a cpp because it need saccess to the
 *		TTSEngObj class and a .c file wont work.
 *  
 ***********************************************************************
 *       
 * Rev	Who		Date			Description
 * ---	-----	-----------		---------------------------------------
 * 001	cab		04/01/2002		Fixed link error for PA_Reset
 */


#ifndef _SAPIIONT_H_

#define _SAPIIONT_H_

#include <windows.h>
#include <mmreg.h>
#include "opthread.h"

#define  AUDIO_BUFFER_SIZE                  49608	// 32*1378 + 4*1378(2 Sec of audio + Extra buffer)
#define  MAXIMUM_WRITE_LENGTH               12402   // (1378*8)	(more than 1/2 sec of audio)
#define  STARTUP_WRITE_SIZE                 4134   //  (1378*3)
#define  MAXIMUM_BUFFERS_QUEUED                3
#define  MINIMUM_STARTUP_SAMPLES  MAXIMUM_BUFFERS_QUEUED * STARTUP_WRITE_SIZE
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



// MVP :Common definitions goes here....
typedef unsigned char AUDIO_T;

typedef AUDIO_T *LPAUDIO_T;

/**********************************************************************/
/*  Symbols for pAudioParams->uiAudioDeviceState.                     */
/**********************************************************************/

#define  AUDIO_DEVICE_INACTIVE       0
#define  AUDIO_DEVICE_STARTING_UP    1
#define  AUDIO_DEVICE_ACTIVE         2
#define  AUDIO_DEVICE_SHUTTING_DOWN  3

/**********************************************************************/
/*  Local Structures.                                                 */
/**********************************************************************/

typedef struct QUEUE_TAG
{
  LPAUDIO_T pQueueStart;
  LPAUDIO_T pQueueInput;
  LPAUDIO_T pQueueOutput;
  int iInputPosition;
  int iOutputPosition;
  int iQueueCount;
  int iQueueLength;
} QUEUE_T;

typedef QUEUE_T * LPQUEUE_T;

/**********************************************************************/
/*  Structure which contains the audio parameters. An instance of     */
/*  this structure is attached to the audio handle. This is done      */
/*  using the SetWindowLong() function.                               */
/**********************************************************************/

//MVP : Make a comparative list of elements from CMode member variables and
//      AUDIO_PARAMS structure ,so that the variables/flags involved in the
//      same kind of behaviour can be maintained at one place and duplicate
//      elements will be removed.

typedef struct AUDIO_PARAMS_TAG
{
  HWND hModeWnd;
  HANDLE hQueueNotFull;
  HANDLE hAudioDeviceInactive;
  HANDLE hAudioNotPaused;
  HTHREAD_T hTimerThread;
  HEVENT_T hevTimerThreadActive;
  DWORD dwAudioDeviceState;            // MVP: CMode::m_fSpeaking 
  DWORD dwAudioPlayState;
  DWORD dwPositionBase;
  DWORD dwSamplesPlayed;
  DWORD dwDeviceSupport;
  // tek 16mar98 bats 608/609/620: bConvertToEightBit superseded.
  BOOL bAudioIsEightBit;
  BOOL bAudioIsMulaw;
  BOOL bPaused;                         // MVP : CMode::m_fPaused
  BOOL bTimerExit;
  LPCRITICAL_SECTION pcsAudioDeviceState;
  LPCRITICAL_SECTION pcsQueueCount;
  LPCRITICAL_SECTION pcsQueueAudioBusy;
  LPQUEUE_T pAudioQueue;
  // tek 12nov97 bats423
  PVOID pcMode;
  double dMsecPerSample;
  // tek 12nov97 fix barrage of start/stop notifications..
  BOOL bInAudioReset;
  // tek 12nov97 fix the barrage of startup requests
  BOOL bSendSamplesRequested;
  // tek 12nov97 deal with FreeSpace notifications when we've run out of samples
  BOOL bAudioRanDry;
  // tek bats 665 12may98 flag that is set when we're using a file destination
  BOOL bAudioIsFile;

  //MGS 12/01/1998 add this from playaudd.h for SAPI build
  BOOL bPipesNotEmpty; //tek 13oct98 to tell the audio device we're done.

} AUDIO_PARAMS_T, *LPAUDIO_PARAMS_T;


typedef LPAUDIO_PARAMS_T LPAUDIO_HANDLE_T;

#ifdef __cplusplus
extern "C" {
#endif //__cplusplus

MMRESULT PA_Reset( LPAUDIO_PARAMS_T pAudioParams);

#ifdef __cplusplus
}
#endif //__cplusplus

#endif // _SAPIIONT_H_
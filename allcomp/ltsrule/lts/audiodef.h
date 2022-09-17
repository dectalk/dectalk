// File name : audiodef.h
// Author    : Murthy Parakala
// Date      : December,18 1995
// Version   : 1.0

/* revision history:
 *
 * 12nov97		tek		bats423: low-level audio fixes
 *						bats404: SAPI transport
// 18mar98	tek		bats 608/609/620: audio format support
// 12may98	tek		bats 665: handle file audio destination
// 10sep98	tek		bats 761: serialize start/stop buffer notifications
// 30sep98	tek		define ID_Null for shutdown fixes
// 01oct98	mgs		add bPipesNotEmpty to AUDIO_PARAMS_TAG for SAPI build
// 25feb02	mgs		Solaris porting issue around HANDLE
 *
 */
// Description: This header file contain data structures and other
// constant declarations,to define an interface between low-level DECtalk 
// audio routines and OLE-DECtalk audio-destination object.
// Used only for OLE-DECTALK DLL.
#ifndef _AUDIODEF_H
#define _AUDIODEF_H

#include "opthread.h"
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

#define  ID_SEND_SPEECH_SAMPLES_FROM_ENGINEQUEUE  WM_USER + 0
#define  ID_Get_Audio_Volume                      WM_USER + 1
#define  ID_Set_Audio_Volume                      WM_USER + 2
#define  ID_Get_Audio_Position                    WM_USER + 3
#define  ID_Get_Audio_Params                      WM_USER + 4
#define  ID_Set_Audio_Params                      WM_USER + 5 
// tek a null message for flushing the message queue during shutdown
#define	ID_Null									(WM_USER + 64)

// tek 12nov97 bats 423 moved these defs here from dtlktts.cpp
#define WM_NSATTRIBCHANGED      (WM_USER + 106)
#define WM_NSAUDIOSTART         (WM_USER + 107)
#define WM_NSAUDIOSTOP              (WM_USER + 108)
#define WM_NSVISUAL                 (WM_USER + 109)
// tek 12nov97 new messages for sapi fixes
#define	WM_NSTEXTDATASTARTED	(WM_USER + 110)
#define	WM_NSTEXTDATADONE		(WM_USER + 111)
#define	WM_NSTEXTDATAABORTED	(WM_USER + 112) // tek 10sep98 bats 761

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
  DT_HANDLE hQueueNotFull;
  DT_HANDLE hAudioDeviceInactive;
  DT_HANDLE hAudioNotPaused;
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

#endif

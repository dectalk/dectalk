/* *********************************************************************
 *                                                                    
 *  Include File: playaudd.h                                          
 *  Author: Bill Hallahan                                             
 *  Date: November 15, 1995                                           
 *                                                                    
 *  Abstract:                                                         
 *                                                                    
 *          Include file for the Application Programming Interface to 
 *    play audio.                                                     
 *                                                                    
 *********************************************************************
 * Revision History:                                                  
 * 001	12nov97		tek	 bats423: add dMsecPerSample    (01aug97)     
 * 002	12oct1998	ETT	changed MAXIMUM_BUFFERS_QUEUED to 3
 *		        		for the itsy to help prevent stuttering	      
 * 003	10nov1998	ETT added includes
 *						put back in bPipesNotEmpty to playaudiotag
 *						added this comment
 * 004	05/09/2001	MGS	Access32 integration and Some VxWorks porting BATS#972
 *						Added delayed close for the audio device to Access32
 * 005	06/19/2001	MGS	Solaris Port BATS#972
 * 006	02/26/2002	MGS	Sapi 5 Access32
 * 007	12/10/2001	MG	Added SMARTMEDIA support; changed MAXIMUM_BUFFERS_QUEUED
 * 008	03/27/2003	MGS	Merged Kevin's changes for audio
 **********************************************************************/

#ifndef _PLAYAUDD_H_
#define _PLAYAUDD_H_

#include "opthread.h"
#include "port.h"
#include "opatype.h"
#include "opmmsys.h"
#if defined _UNIX_LIKE_
#include "port.h"
#include "dtmmedefs.h"
#undef USE_MME_SERVER  //just to make sure.
#endif

/**********************************************************************/
/*  Symbol definitions.                                               */
/**********************************************************************/

#ifndef SAPI5DECTALK
#ifdef __arm__
#define  MAXIMUM_BUFFERS_QUEUED  3
#else
#ifdef SMARTMEDIA
#define  MAXIMUM_BUFFERS_QUEUED  2
#else
#define  MAXIMUM_BUFFERS_QUEUED  8
#endif
#endif // _arm_
#endif // SAPI5DECTALK

/**********************************************************************/
/*  Local Structures.                                                 */
/**********************************************************************/

typedef struct PLAY_RING_TAG
{
  LPAUDIO_T pQueueTop;
  LPAUDIO_T pQueueStart;
  LPAUDIO_T pQueueInput;
  LPAUDIO_T pQueueOutput;
  int iInputPosition;
  int iOutputPosition;
  int iQueueCount;
  int iQueueLength;
} PLAY_RING_T;

typedef PLAY_RING_T * LPPLAY_RING_T;


#if defined _UNIX_LIKE_
typedef UINT HWAVEOUT;

struct wavehdr_tag {
    LPSTR                 lpData;          /* pointer to locked data buffer */
    DWORD                 dwBufferLength;  /* length of data buffer */
    DWORD                 dwBytesRecorded; /* used for input only */
    DWORD                 dwUser;          /* for client's use */
    DWORD                 dwFlags;         /* assorted flags (see defines) */
    DWORD                 dwLoops;         /* loop control counter */
    struct wavehdr_tag  * lpNext;          /* reserved for driver */
    DWORD                 reserved;        /* reserved for driver */
};
typedef struct wavehdr_tag WAVEHDR;
typedef WAVEHDR       *PWAVEHDR;
typedef WAVEHDR      *NPWAVEHDR;
typedef WAVEHDR      *LPWAVEHDR;
#endif //__linux__

/**********************************************************************/
/*  Structure for Synchronization Mark Linked List.                   */
/**********************************************************************/

struct SYNC_MARK_TAG
{
  struct SYNC_MARK_TAG * pLink;
  DWORD dwPosition;
  ATYPE_T aTag;
};

typedef struct SYNC_MARK_TAG SYNC_MARK_T;
typedef SYNC_MARK_T * LPSYNC_MARK_T;

/**********************************************************************/
/*  Structure which contains the audio parameters.                    */
/**********************************************************************/

typedef  unsigned int  PLAYAUD_BOOL_T;

struct PLAY_AUDIO_TAG
{
  unsigned int ( * CallbackRoutine )( struct PLAY_AUDIO_TAG *,
                                      ATYPE_T,
                                      ATYPE_T,
                                      ATYPE_T );
  ATYPE_T aInstance;
  HWAVEOUT hWaveOut;
  HTHREAD_T hTimerThread;
  HEVENT_T hevAudioDeviceInactive;
  HEVENT_T hevTimerThreadActive;
  HEVENT_T hevQueueNotFull;
  HEVENT_T hevResetComplete;

#ifdef USE_MME_SERVER

  unsigned int uiWaveHdrWriteIndex;
  unsigned int uiWaveHdrReadIndex;
  LPWAVEHDR ppWaveHdrInUseList[MAXIMUM_BUFFERS_QUEUED];

#endif

#ifdef OS_SIXTY_FOUR_BIT
  unsigned int uiHandleListIndex;
#endif

  unsigned int uiSelectedDeviceID;
  unsigned int uiMaximumWriteLength;
  unsigned int uiStartupWriteLength;
  unsigned int uiMinimumStartupBytes;
  int iSamplesWaitingForCompletion;
  DWORD dwAudioDeviceState;
  DWORD dwAudioPlayState;
  DWORD dwDeviceOptions;
  DWORD dwPositionBase;
  DWORD dwBytesPlayed;
  DWORD dwDeviceSupport;
  DWORD dwQueuedByteCount;
  PLAYAUD_BOOL_T bConvertToEightBit;
  PLAYAUD_BOOL_T bTimerExit;
  PLAYAUD_BOOL_T bPaused;
  PLAYAUD_BOOL_T bResetPaused;
  PLAYAUD_BOOL_T bEnableOpenErrorMessage;
  PLAYAUD_BOOL_T bReportPlayStop;
  PLAYAUD_BOOL_T bHandleValid;
  PLAYAUD_BOOL_T bTimerThreadReset;
  HMUTEX_T hmxAudioDeviceState;
  HMUTEX_T hmxBytesPlayed;
  HMUTEX_T hmxSelectedDeviceID;
  HMUTEX_T hmxQueueCount;
  HMUTEX_T hmxQueueAudioBusy;
  HMUTEX_T hmxQueuedByteCount;
  HMUTEX_T hmxPauseFlag;
  HMUTEX_T hmxSynchronizationMarkList;
  HMUTEX_T hmxWaveFormat;
  LPWAVEHDR * ppWaveHdr;
  LPPLAY_RING_T pPlayAudioRing;
  LPSYNC_MARK_T pSyncMarkList;
  LPWAVEFORMATEX pWaveFormat;
  HMUTEX_T hmxAudioDeviceCloseRequest; // MGS speed up ACCESS32
  DWORD dwAudioDeviceCloseRequest;  // MGS speed up ACCESS32
  HEVENT_T hevAudioDeviceCloseRequestCancel; // MGS speedy up ACCESS32
  int	iOutstandingBuffers;  //tek
  int iFirstFreeBuffer;	 //tek
  double dMsecPerSample; //tek 01aug97 bats 423
  BOOL bPipesNotEmpty; //tek 13oct98 to tell the audio device we're done.
  int first_buffer;
  int volume;
#ifdef USE_PORTAUDIO
  char *port_audio_output_buffer;
  int port_audio_samples_per_buffer;
  int ClosePortAudioStream;
  int FirstBuffer;
#endif
};

typedef struct PLAY_AUDIO_TAG PLAY_AUDIO_T;

typedef PLAY_AUDIO_T * HPLAY_AUDIO_T;

#endif

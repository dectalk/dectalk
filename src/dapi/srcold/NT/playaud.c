/************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *    Copyright (c)Compaq Computer Corporation 1999. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved. 
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *   
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:		playaud.c
 *    Author:			Bill Hallahan
 *    Creation Date:	11/15/95
 *
 *    Functionality:	
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  TQL 	05/21/1997	BATS#357  Add the code for __osf__ build
 * 002	TEK    	05/22/1997	Correct the condition for closing the output
 *				  			device in Process_MM_WOM_DONE_Message()
 * 003	TEK    	06/09/1997	Typing changes
 * 004	TEK    	07/24/1997	For BATS#408 and 411,
 *                          Allow ProcWOMDoneMsg to queue several buffers.
 *      tek		12nov97		bats 508/514
 * xxx	tek     21nov97		surgically set volume to zero on reset (bats 518),
 *							bats530: make some debug logs less verbose,
 *							avoid sending runt packets to the audio device,
 *							and cleanup the timer shutdown logic
 * xxx	tek		30jan98		bats532: correct the timer blocking logic to 
 *							not suck up all the CPU available.
 * 005  JAW     27feb98     Merged CE code.
 * xxx	tek		16mar98		bats 622: fix sending of start/stop messages
 *      cjl     18mar98     Removed specific path for dectalkf.h.
 * 		tek		27may98	    BATS ???: fix multithread race in CreatePlayHandle
 * 006.5  ett   02sep1998   Merged code from playaud_u.c changed global mem in win32
 *				    		to Shm_t (shared mem struct) see line: 240
 * 008	ETT		10/12/1998	Added linux and itsy code.
 * 009	ETT		11/10/1998	Added arm stutter fix attempt.  
 *							added some includes needed
 *							added this comment.
 * 010  ETT		11/12/1998  fixed includes for osf
 * 011	GL		11/13/1998	add osf and linux switch for including sys/time.h and sys/resource.h
 * 012  ETT		11/19/1998  added include of mmsystem.h for osf.
 * 013	GL		11/20/1998	BATS#828 use AUD_DEBUG to replace _DEBUG
 * 014	ETT		12/07/1998	who spelled mmsystem.h wrong?!  
 * 015	MGS		12/15/1998	Fixed odd byte problem to audio device and BATS #844
 * 016	tek		22jan1999	BATS859: correct timing of ResetAudioQueue during reset
 * 017	mfg		25jan1999	omitted #include crtdbg.h for Windows CE, not supported
 * 018	mfg		23mar1999   for windows CE wirte fewer, but larger buffers tek
 * 019	mfg		21jul1999	changed for WinCE to avoid 1 sec startup delay 
 * 020	MGS		02/09/2000	Made some changes for linux to stop it from stuttering
 *							when WAVE_OPEN_SHAREABLE was specified
 * 021	CAB 	10/16/2000	Fixed copyright info and formatted comment section.
 * 022	MGS		01/17/2001	Hack for Prenke Romich for it not producing the  
 *							last bit of audio
 * 023	CAB		01/19/2001	Fixed copyright info
 * 024	MGS		02/08/2001	Made changes for the new linux audio
 * 025	MGS		02/13/2001	Made changes for ipaq linux
 * 026	MGS		02/28/2001	Merged in base changes needed for ACCESS32 merge
 *							Added Volume attenuator
 * 027	MGS		03/27/2001	Fixed Tru64 issues
 * 028	MGS		05/09/2001	Access32 Integration and Some VxWorks porting BATS#972
 *							Added delayed audio device close for Access32
 * 029	CAB		05/14/2001	Removed nonused variable
 * 030	MGS		06/07/2001	Fixed bug on restarting with a tiny amount of audio
 * 031	MGS		06/19/2001	Solaris Port BATS#972
 * 032	MGS		07/02/2001	Batched audio device bug
 * 033	MGS		02/25/2002	Sapi5 access32 changes
 * 034	mfg		12/11/2001	added SMARTMEDIA sdk support
 * 035	mfg		12/20/2001	added CUP28PROJECT sdk support
 * 036  MFG		07/10/2002	Merged into code changes needed for the Mitsubishi CE/SH4 Project
 * 037	MGS		07/16/2002	Added Fonix increased volume table
 * 038	MGS		03/27/2003	Merged Kevin's changes for audio problems
*/
/**********************************************************************/
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*          Application Programming Interface to play audio.          */
/*                                                                    */
/*         This is an audio Application Programming Interface (API)   */
/*    that uses the Microsoft Low level audio services for playing    */
/*    audio. The Microsoft Low level service for playing audio are    */
/*    provided on Windows 95, Windows NT, Digital UNIX, and OpenVMS.  */
/*    This code supports all of these operating systems.              */
/*                                                                    */
/*         This API encapsulates audio output processing. An          */
/*    application calls the PA_CreatePlayHandle() function to create  */
/*    a "play audio" thread. This thread is automatically opens and   */
/*    closes the wave output device as necessary.                     */
/*                                                                    */
/*         Any application using these functions must include file    */
/*    "playaud.h".                                                    */
/*                                                                    */
/*         All of the "play audio" API functions are thread-safe      */
/*    except the PA_CreatePlayHandle() function and the               */
/*    PA_DestroyPlayHandle() function. These each contain a handle    */
/*    instance counter that is not thread-safe. If each of these      */
/*    functions are protected by the same mutex then either of them   */
/*    may be called from multiple threads.                            */
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
/*    MMRESULT PA_SynchronizationMark( HPLAY_AUDIO_T pPlayAudio,      */
/*                                     ATYPE_T aTag );                */
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
//#define AUD_DEBUG
#include "dectalkf.h"
#include "port.h"

#if (defined(_WIN32) && !defined(UNDER_CE)) // tek 22jan99 use asserte to detect improper audio states
#include <crtdbg.h> // for _ASSERTE017	 /	/mfg 25jan99	omitted #include crtdbg.h for Windows CE, not supported
#else // not _WIN32
#define _ASSERTE(x)
#endif

#ifdef VXWORKS
#include <string.h>
#else
#include <malloc.h>
#endif
#include <stdlib.h>

#if defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_
#include <sys/time.h>
#ifndef _SPARC_SOLARIS_
#include <sys/resource.h>
#endif
#endif
#ifdef VXWORKS
#include <time.h>
#endif
#ifdef __osf__
#include <mmsystem.h>
#endif
#ifdef AUD_DEBUG //tek 22may97
#include <stdio.h>
#include "kernel.h" // has fast logging defs in it
#endif //AUD_DEBUG
#include "opthread.h"
#include "mmalloc.h"
#include "playaudd.h"
#include "playaud.h"
#ifdef TYPING_MODE //tek 22may97
// we need to peek into the phtts
#include "tts.h"
#endif //TYPING_MODE

#ifdef AUD_DEBUG
#if defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS_
static unsigned int timeGetTime()
{
        struct timeval tv;
        gettimeofday(&tv,NULL);
        return((tv.tv_sec%1000)*1000000 + (tv.tv_usec));
}
//#define timeGetTime() (unsigned long)(time(NULL))
#undef OutputDebugString
#define OutputDebugString(x) {\
        if (!(fpODS_File)) \
                fpODS_File = fopen("odslog.log","w"); \
        fprintf(fpODS_File,"%s",x); \
  } 
#endif  /* defined __osf__ || defined __linux__ */
#endif  /* AUD_DEBUG */


#ifdef UNDER_CE
#include "cemm.h"
#endif //UNDER_CE

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
//  linux home brew audio API
#include "linux_audio.h"
LONG OSS_WaveInit(void);
#ifdef AUD_DEBUG
FILE *fpODS_File;
#endif
#endif

#include "tts.h"




/**********************************************************************/
/*  MME server calls must be thread safe because the                  */
/*  mmeCheckForCallbacks() function and the mmeProcessCallbacks()     */
/*  function run in a separate thread.                                */
/**********************************************************************/

#ifdef MME_THREAD_SAFE
#define  LOCK_MME_CALL( statement ) \
         { \
	   OP_LockMutex( pShm_t->hmxGlobalMmeServer ); \
           statement; \
           OP_UnlockMutex( pShm_t->hmxGlobalMmeServer ); \
         }
#else

#define  LOCK_MME_CALL( statement ) \
         { \
           statement; \
         }
#endif

/**********************************************************************/
/*  Local type definitions.                                           */
/**********************************************************************/

typedef  unsigned int  SENDRET_T;

/**********************************************************************/
/*  Symbol definitions used for Audio Queueing.                       */
/*  The symbol MAXIMUM_BUFFERS_QUEUED is defined in include file      */
/*  "playaudd.h".                                                     */
/**********************************************************************/
#ifdef UNDER_CE
#ifdef SMARTMEDIA
#define  STARTUP_BUFFER_SECONDS	        1.5 
#else
#define  STARTUP_BUFFER_SECONDS	        0.5 
#endif
#elif defined __arm__
#ifdef __ipaq__
#define  STARTUP_BUFFER_SECONDS         0.5
#else
#define  STARTUP_BUFFER_SECONDS         1.0
#endif //__ipaq__
#else
#define  STARTUP_BUFFER_SECONDS         0.1
#endif
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef __ipaq__
#define  MAXIMUM_WRITE_LENGTH           8192
#define  AUDIO_BUFFER_SIZE  \
           ( (MAXIMUM_WRITE_LENGTH ) * ( MAXIMUM_BUFFERS_QUEUED + 1 ))
#else
#define  MAXIMUM_WRITE_LENGTH           4096
#define  AUDIO_BUFFER_SIZE  \
           ( (MAXIMUM_WRITE_LENGTH *2) * ( MAXIMUM_BUFFERS_QUEUED + 1 ))
#endif
#else
#ifndef SAPI5DECTALK
#define  MAXIMUM_WRITE_LENGTH           16384
#define  AUDIO_BUFFER_SIZE  \
           ( MAXIMUM_WRITE_LENGTH * ( MAXIMUM_BUFFERS_QUEUED + 1 ))
#endif
#endif
#ifdef __arm__
#ifdef __ipaq__
#define  MINIMUM_STARTUP_WRITE_SIZE     3072
#else //__ipaq__
#define  MINIMUM_STARTUP_WRITE_SIZE     3200
#endif // __ipaq__
#else
#define  MINIMUM_STARTUP_WRITE_SIZE     1600   // tek 24jul97 stutter fix 
#endif
#define  MAXIMUM_RESET_WAIT_IN_MSEC     5000
#define  MAXIMUM_CLOSE_WAIT_IN_MSEC     5000
#define  PLAY_WAIT_SLEEP_TIME_IN_MSEC   50

/**********************************************************************/
/*  Symbols for pPlayAudio->uiAudioPlayState.                         */
/**********************************************************************/

#define  AUDIO_STATE_PLAY        0
#define  AUDIO_STATE_RESET       1

/**********************************************************************/
/*  Symbols for pPlayAudio->uiAudioDeviceState.                       */
/**********************************************************************/

#define  AUDIO_DEVICE_INACTIVE       0
#define  AUDIO_DEVICE_STARTING_UP    1
#define  AUDIO_DEVICE_ACTIVE         2
#define  AUDIO_DEVICE_SHUTTING_DOWN  3
#define  AUDIO_DEVICE_HELD_OPEN      4

/* Symbols for close requests to keep the audio device opened for a little time
 * after the audio has stopped incase there is more audio about to come down 
 * through the queue (mostly for typing mode, but will work for normal also) */
// pPlayAudio->dwAudioDeviceCloseRequest

#define AUDIO_DEVICE_CLOSE_REQUESTED 1
#define AUDIO_DEVICE_CLOSE_REQUEST_CANCELLED 2
#define CLOSE_REQUEST_WAIT_TIME		300

/**********************************************************************/
/*  User defined Messages.                                            */
/*  It is important that none of these message values are the same as */
/*  the MM_WOM_OPEN, MM_WOM_DONE, or the MM_WOM_CLOSE values.         */
/**********************************************************************/

#define  ID_Open_Wave_Output_Device    0
#define  ID_Reset_Audio                1
#define  ID_Pause_Audio                2
#define  ID_Resume_Audio               3
#define  ID_Set_Audio_Format           4
#define  ID_Get_Audio_Format           5
#define  ID_Set_Audio_Volume           6
#define  ID_Get_Audio_Volume           7
#define  ID_Synchronization_Mark       8
#define  ID_Get_Audio_Position         9
#define  ID_Destroy_Message           10

/**********************************************************************/
/*  Message Queue Structure.                                          */
/**********************************************************************/

#define  NUMBER_OF_ITEMS_IN_MESSAGE    3
#define  MESSAGE_QUEUE_LENGTH        256

#include "shmalloc.h"
#ifdef __osf__
extern pshared_mem_t pShm_t;
#else
// 09/02/1998 ETT: changed to shared mem struct to unify Digital Unix
//					and other OSs.  merged code from playaud_u.c
// initialize the shared mem struct members: (from playaud_u.c)
// uiGlobalPlayAudioInstance = 0
// bGlobalPlayAudioThreadExit = TRUE
// hGlobalPlayAudioThread = NULL
// hmxGlobalSendPlayAudio = NULL
// pGlobalReportMessageQueue = NULL
// pGlobalPlayAudioMessageQueue = NULL
//
// ifdef MME_THREAD_SAFE
// hmxGlobalMmeServer = NULL
//
// ifdef USE_MME_SERVER
// bGlobalMmeCallbackExit = FALSE
// hGlobalMmeCallbackThread = NULL
//
// ifdef OS_SIXTY_FOUR_BIT
// uiGlobalHandleListLength = 0
// hmxGlobalHandleList = NULL
// ppGlobalHandleList = NULL
//
shared_mem_t Shm_t={0,1,0,0,0,0
#ifdef MME_THREAD_SAFE
		    ,0
#endif
#ifdef USE_MME_SERVER
		    ,0,0
#endif
#ifdef OS_SIXTY_FOUR_BIT
		    ,0,0,0
#endif
};
shared_mem_t *pShm_t = &Shm_t;
#endif  // !__osf__

#ifdef MOVED_TO_SHARED_MEMORY

typedef struct MESSAGE_QUEUE_TAG
{
  LPATYPE_T pStart;
  LPATYPE_T pInput;
  LPATYPE_T pOutput;
  unsigned int uiInputPosition;
  unsigned int uiOutputPosition;
  unsigned int uiLength;
  unsigned int uiCount;
  HEVENT_T hevNotFull;
  HEVENT_T hevNotEmpty;
  HMUTEX_T hmxMessageQueue;
} MESSAGE_QUEUE_T;

typedef MESSAGE_QUEUE_T * LPMESSAGE_QUEUE_T;

#endif // MOVED_TO_SHARED_MEMORY

/**********************************************************************/
/*  Function prototypes (Function prototypes for functions used by    */
/*  applications are in file 'playaud.h'.)                            */
/**********************************************************************/

OP_THREAD_ROUTINE( PlayAudioThreadMain, HPLAY_AUDIO_T pAudioHandle );

OP_THREAD_ROUTINE( TimerThreadMain, HPLAY_AUDIO_T pAudioHandle );

#ifdef USE_MME_SERVER
OP_THREAD_ROUTINE( MmeCallbackThreadMain, HPLAY_AUDIO_T pAudioHandle );
#endif

static ATYPE_T PlayAudioProcedure( HPLAY_AUDIO_T,
                                   unsigned int,
                                   ATYPE_T );

static MMRESULT DetermineDeviceID( HPLAY_AUDIO_T,
                                   unsigned int,
                                   LPWAVEFORMATEX );

static ATYPE_T Process_MM_WOM_OPEN_Message( HPLAY_AUDIO_T, ATYPE_T );

static MMRESULT GetWaveOutDeviceCaps( HPLAY_AUDIO_T );

static void StartAudioPlaying( HPLAY_AUDIO_T );

static ATYPE_T Process_MM_WOM_DONE_Message( HPLAY_AUDIO_T, ATYPE_T );

static ATYPE_T Process_MM_WOM_CLOSE_Message( HPLAY_AUDIO_T );

static void ClosePlayDevice( HPLAY_AUDIO_T );

static void ClosePlayDeviceRequest( HPLAY_AUDIO_T );

static unsigned int WriteBufferToWaveDevice( HPLAY_AUDIO_T,
                                             LPWAVEHDR,
                                             unsigned int );

static ATYPE_T ProcessOpenWaveOutputDeviceMessage( HPLAY_AUDIO_T );

static DWORD GetWaveFormatSize( LPWAVEFORMATEX );

static MMRESULT OpenWaveOutputDevice( HPLAY_AUDIO_T );

static ATYPE_T ProcessResetMessage( HPLAY_AUDIO_T );

static void ClearSynchronizationMarkList( HPLAY_AUDIO_T );

static void ResetAudioQueue( HPLAY_AUDIO_T );

static ATYPE_T ProcessPauseMessage( HPLAY_AUDIO_T );

static ATYPE_T ProcessResumeMessage( HPLAY_AUDIO_T );

static MMRESULT ProcessSetFormatMessage( HPLAY_AUDIO_T,
                                         LPWAVEFORMATEX );

static MMRESULT SetNewFormat( HPLAY_AUDIO_T, LPWAVEFORMATEX );

static MMRESULT ProcessGetFormatMessage( HPLAY_AUDIO_T,
                                         LPWAVEFORMATEX );

static ATYPE_T ProcessGetVolumeMessage( HPLAY_AUDIO_T, LPDWORD );

static ATYPE_T ProcessSetVolumeMessage( HPLAY_AUDIO_T, DWORD );

static ATYPE_T ProcessSynchronizationMarkMessage( HPLAY_AUDIO_T,
                                                  ATYPE_T );

static ATYPE_T ProcessGetPositionMessage( HPLAY_AUDIO_T,
                                          LPDWORD );

static MMRESULT AudioPosition( HPLAY_AUDIO_T, LPDWORD );

static unsigned int ReportStatusToApplication( HPLAY_AUDIO_T,
                                               ATYPE_T,
                                               ATYPE_T );

static SENDRET_T SendPlayAudioMessage( HPLAY_AUDIO_T,
                                       unsigned int,
                                       ATYPE_T );

void CALLBACK WaveOutCallbackRoutine( HWAVEOUT hWaveOut,
                                      unsigned int uiMessage,
                                      DWORD dwInstance,
                                      LPARAM lParam1,
                                      LPARAM lParam2 );

/**********************************************************************/
/*  Message Queue Function prototypes.                                */
/**********************************************************************/

static LPMESSAGE_QUEUE_T CreateMessageQueue( unsigned int uiQueueLength );

static void WriteMessageQueue( LPMESSAGE_QUEUE_T,
                               ATYPE_T Item_0,
                               ATYPE_T Item_1,
                               ATYPE_T Item_2 );

static void ReadMessageQueue( LPMESSAGE_QUEUE_T,
                              LPATYPE_T pItem_0,
                              LPATYPE_T pItem_1,
                              LPATYPE_T pItem_2 );

static void DestroyMessageQueue( LPMESSAGE_QUEUE_T );

/**********************************************************************/
/*  Global variables that are shared among all "play audio" instances */
/**********************************************************************/

DECLARE_TLOCK(tlPlayAudio); // tek 27may98 the play-audio creation lock

#ifdef MOVED_TO_SHARED_MEMORY
unsigned int uiGlobalPlayAudioInstance = 0;
unsigned int bGlobalPlayAudioThreadExit = TRUE;
HTHREAD_T hGlobalPlayAudioThread = NULL;
HMUTEX_T pShm_t->hmxGlobalSendPlayAudio = NULL;
LPMESSAGE_QUEUE_T pShm_t->pGlobalReportMessageQueue = NULL;
LPMESSAGE_QUEUE_T pShm_t->pGlobalPlayAudioMessageQueue = NULL;
#endif

#ifdef MOVED_TO_SHARED_MEMORY

#ifdef MME_THREAD_SAFE
HMUTEX_T hmxGlobalMmeServer = NULL;
#endif

#ifdef USE_MME_SERVER
unsigned int bGlobalMmeCallbackExit = FALSE;
HTHREAD_T hGlobalMmeCallbackThread = NULL;
#endif

#ifdef OS_SIXTY_FOUR_BIT
unsigned int uiGlobalHandleListLength = 0;
HMUTEX_T hmxGlobalHandleList = NULL;
HPLAY_AUDIO_T * ppGlobalHandleList = NULL;
#endif

#endif // MOVED_TO_SHARED_MEMORY


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_CreatePlayHandle                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns a handle to a "play audio" instance. */
/*    This function may be called multiple times to create multiple   */
/*    play audio instances.                                           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*    ppPlayAudio         A pointer to a pointer to a structure of    */
/*                        type PLAY_AUDIO_T. This is initialized      */
/*                        by this function.                           */
/*                                                                    */
/*    uiWaveOutDeviceID   An unsigned integer that contains the audio */
/*                        device ID number. If constant WAVE_MAPPER   */
/*                        is used as the wave output device ID number */
/*                        then the first available wave output device */
/*                        will be selected.                           */
/*                                                                    */
/*    pWaveFormat         A pointer to a structure of type            */
/*                        WAVEFORMATEX that specifies the audio       */
/*                        device format. If this field is set to NULL */
/*                        then the following default format will be   */
/*                        used.                                       */
/*                                                                    */
/*                          WaveFormat.wFormatTag = WAVE_FORMAT_PCM;  */
/*                          WaveFormat.nSamplesPerSec = 11025;        */
/*                          WaveFormat.nChannels = 1;                 */
/*                          WaveFormat.nAvgBytesPerSec = 22050;       */
/*                          WaveFormat.nBlockAlign = 2;               */
/*                          WaveFormat.wBitsPerSample = 16;           */
/*                          WaveFormat.cbSize = 0;                    */
/*                                                                    */
/*    dwDeviceOptions     A DWORD that specifies how the wave output  */
/*                        device is managed. This parameter can be a  */
/*                        combination of the following values.        */
/*                                                                    */
/*       value                 performance characteristic             */
/*                                                                    */
/*  PA_OWN_DEVICE         The wave output device will be opened upon  */
/*                        return from the PA_CreatePlayHandle()       */
/*                        function. No other process can allocate the */
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
/*                        reporting will be performed. If the         */
/*                        callback function return value is FALSE     */
/*                        and the callback message value is equal to  */
/*                        PA_DEVICE_OPEN_FAILURE, then subsequent     */
/*                        "device open failures" will not cause any   */
/*                        more callbacks until either the PA_Reset()  */
/*                        function is called or the "play audio"      */
/*                        device has been opened and closed. If the   */
/*                        callback function return value is equal to  */
/*                        TRUE, then the "device open failure"        */
/*                        callbacks will continue periodically as     */
/*                        the audio subsystem attempt to access the   */
/*                        device. The callback function return value  */
/*                        has no effect on messages other than the    */
/*                        PA_DEVICE_OPEN_FAILURE message.             */
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
/*    MMSYSERR_NOTSUPPORTED  Unsupported audio format                 */
/*    MMSYSERR_NOMEM         Memory allocation error                  */
/*    MMSYSERR_ERROR         Insufficient system resources            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
// tek 27may98 this is now an interlocking wrapper for the REAL routine
//
// declare the prototype of the wrapped routine
MMRESULT PA_CreatePlayHandleEx( HPLAY_AUDIO_T * ppPlayAudio,
                    unsigned int uiWaveOutDeviceID,
                    LPWAVEFORMATEX pWaveFormat,
                    DWORD dwDeviceOptions,
                    unsigned int ( * CallbackRoutine )( HPLAY_AUDIO_T,
                                                        ATYPE_T,
                                                        ATYPE_T,
                                                        ATYPE_T ),
                    ATYPE_T aInstance );
//
// the wrapper routine
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
  
  MMRESULT mmResult=MMSYSERR_ERROR; // the default error
  BOOL bGotLock=FALSE;	// whether we got the lock
  
  // try to gain control of the resources
  bGotLock = ThreadLock(&tlPlayAudio,5);
  if (bGotLock)
    {	// do the actual call..
      mmResult = PA_CreatePlayHandleEx(ppPlayAudio,
				       uiWaveOutDeviceID,
				       pWaveFormat,
				       dwDeviceOptions,
				       CallbackRoutine,
				       aInstance);
      // unlock the resources
      ThreadUnlock(&tlPlayAudio);
    }
  // return our result
  return (mmResult);
}
//
// the actual work gets done here..
MMRESULT PA_CreatePlayHandleEx( HPLAY_AUDIO_T * ppPlayAudio,
				unsigned int uiWaveOutDeviceID,
				LPWAVEFORMATEX pWaveFormat,
				DWORD dwDeviceOptions,
				unsigned int ( * CallbackRoutine )( HPLAY_AUDIO_T,
								    ATYPE_T,
								    ATYPE_T,
								    ATYPE_T ),
				ATYPE_T aInstance )
{
  unsigned int uiI;
  unsigned int uiNumberOfWaveOutDevices;
  MMRESULT mmStatus;
  WAVEFORMATEX WaveFormat;
  LPPLAY_RING_T pPlayAudioRing;
  HPLAY_AUDIO_T pPlayAudio = NULL;

#ifdef OS_SIXTY_FOUR_BIT
  unsigned int bHandleSaved;
  HPLAY_AUDIO_T * ppGlobalHandleListTemp;
#endif
  
#ifdef AUD_DEBUG
  OutputDebugString("PA_CreatePlayHandle()\n");
#endif
  
  /********************************************************************/
  /*  Set the return handle to NULL in case this function fails.      */
  /********************************************************************/

  *ppPlayAudio = NULL;

  /********************************************************************/
  /*  Increment the play audio instance count.                        */
  /********************************************************************/

  pShm_t->uiGlobalPlayAudioInstance++;

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  OSS_WaveInit();
#endif

#ifdef MME_THREAD_SAFE

  /********************************************************************/
  /*  If this is the first instance then create a global mutex to     */
  /*  protect MME server calls.                                       */
  /********************************************************************/

  if ( pShm_t->uiGlobalPlayAudioInstance == 1 )
  {
    /******************************************************************/
    /*  Create the "Multimedia" mutex.                                */
    /******************************************************************/

    pShm_t->hmxGlobalMmeServer = OP_CreateMutex();

    if ( pShm_t->hmxGlobalMmeServer == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_ERROR;
    }
  }

#endif


#ifdef OS_SIXTY_FOUR_BIT

  /********************************************************************/
  /*  If this is the first instance then create a global mutex to     */
  /*  protect the global Handle List.                                 */
  /********************************************************************/

  if ( pShm_t->uiGlobalPlayAudioInstance == 1 )
  {
    /******************************************************************/
    /*  Create the global handle mutex.                               */
    /******************************************************************/

    pShm_t->hmxGlobalHandleList = OP_CreateMutex();

    if ( pShm_t->hmxGlobalHandleList == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_ERROR;
    }
  }

#endif

  /********************************************************************/
  /*  Make sure the system has an audio card.                         */
  /********************************************************************/

  LOCK_MME_CALL( uiNumberOfWaveOutDevices = waveOutGetNumDevs() )

  if ( uiNumberOfWaveOutDevices == 0 )
  {
#ifdef AUD_DEBUG
	OutputDebugString("PA_: No wave output device found.\n");
#endif
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_NODRIVER;
  }
  else
  {
#ifdef AUD_DEBUG
	  OutputDebugString("PA_: Wave device found.\n");
#endif
  }

  /********************************************************************/
  /*  Make sure the device ID is valid. This is tested as an integer  */
  /*  so that a device ID of WAVE_MAPPER ( which is equal to -1 )     */
  /*  passes as a valid device ID.                                    */
  /********************************************************************/
  if ((int)uiWaveOutDeviceID >= (int)uiNumberOfWaveOutDevices )
  {
#ifdef AUD_DEBUG
	OutputDebugString("PA_: Bad Device ID\n");
#endif
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_BADDEVICEID;
  }
   else
  {
#ifdef AUD_DEBUG
	OutputDebugString("PA_: Device ID OK\n");
#endif
   }
  /********************************************************************/
  /*  Allocate memory for the play audio handle structure.            */
  /********************************************************************/

  pPlayAudio = (HPLAY_AUDIO_T)malloc(sizeof(PLAY_AUDIO_T));

  if ( pPlayAudio == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_NOMEM;
  }

  pPlayAudio->bHandleValid = FALSE;

  /********************************************************************/
  /*  Initialize several handle elements to NULL.                     */
  /********************************************************************/

  pPlayAudio->CallbackRoutine = NULL;
  pPlayAudio->hWaveOut = (int)NULL;
  pPlayAudio->hTimerThread = NULL;
  pPlayAudio->hevAudioDeviceInactive = NULL;
  pPlayAudio->hevTimerThreadActive = NULL;
  pPlayAudio->hevQueueNotFull = NULL;
  pPlayAudio->hevResetComplete = NULL;
  pPlayAudio->hmxAudioDeviceState = NULL;
  pPlayAudio->hmxBytesPlayed = NULL;
  pPlayAudio->hmxSelectedDeviceID = NULL;
  pPlayAudio->hmxQueueCount = NULL;
  pPlayAudio->hmxQueueAudioBusy = NULL;
  pPlayAudio->hmxPauseFlag = NULL;
  pPlayAudio->ppWaveHdr = NULL;
  pPlayAudio->pPlayAudioRing = NULL;
  pPlayAudio->pSyncMarkList = NULL;
  pPlayAudio->pWaveFormat = NULL;
  //tek 09may97
  pPlayAudio->iOutstandingBuffers=0;
  pPlayAudio->iFirstFreeBuffer=0; //tek
  pPlayAudio->hmxAudioDeviceCloseRequest = NULL;

#ifdef OS_SIXTY_FOUR_BIT

  /********************************************************************/
  /*  Store the handle in the first free location in the global       */
  /*  instance array so the wave output callback function can access  */
  /*  the handle. This is necessary because for Digital UNIX,         */
  /*  pointers are 64 bit and the dwInstance parameter (that is       */
  /*  passed to the waveOutOpen() function and later returned in      */
  /*  a callback) cannot hold a pointer to the play audio handle.     */
  /********************************************************************/

  /********************************************************************/
  /*  Set the audio instance to an illegal value. This is tested in   */
  /*  the PA_DestroyPlayHandle() function.                            */
  /********************************************************************/

  pPlayAudio->uiHandleListIndex = (unsigned int)(-1);

  /********************************************************************/
  /*  Protect the Handle List.                                        */
  /********************************************************************/

  OP_LockMutex( pShm_t->hmxGlobalHandleList );

  /********************************************************************/
  /*  If this is the first "play audio" instance, then allocate the   */
  /*  global handle array.                                            */
  /********************************************************************/

  if ( pShm_t->ppGlobalHandleList == NULL )
  {
    pShm_t->ppGlobalHandleList = (HPLAY_AUDIO_T *)malloc( sizeof(HPLAY_AUDIO_T ));

    if ( pShm_t->ppGlobalHandleList == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_NOMEM;
    }

    pShm_t->ppGlobalHandleList[0] = NULL;
    pShm_t->uiGlobalHandleListLength = 1;
  }

  /********************************************************************/
  /*  Attempt to save the handle in the handle list. There might be   */
  /*  space in the handle array because a previous "play audio"       */
  /*  instance was destroyed by the PA_DestroyPlayHandle() function.  */
  /********************************************************************/

  bHandleSaved = FALSE;

  for ( uiI = 0; uiI < pShm_t->uiGlobalHandleListLength; uiI++ )
  {
    if ( pShm_t->ppGlobalHandleList[uiI] == NULL )
    {
      pShm_t->ppGlobalHandleList[uiI] = pPlayAudio;
      pPlayAudio->uiHandleListIndex = uiI;
      bHandleSaved = TRUE;
      break;
    }
  }

  /******************************************************************/
  /*  If there was no space in the handle list to save the handle   */
  /*  then extend the handle list. Then save the handle.            */
  /******************************************************************/

  if ( ! bHandleSaved )
  {
    ppGlobalHandleListTemp = ( HPLAY_AUDIO_T * )
      realloc( pShm_t->ppGlobalHandleList,
               ( pShm_t->uiGlobalHandleListLength + 1 ) * sizeof(HPLAY_AUDIO_T ));

    if ( ppGlobalHandleListTemp == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_NOMEM;
    }

    pShm_t->ppGlobalHandleList = ppGlobalHandleListTemp;
    pShm_t->ppGlobalHandleList[pShm_t->uiGlobalHandleListLength] = pPlayAudio;
    pPlayAudio->uiHandleListIndex = pShm_t->uiGlobalHandleListLength;
    pShm_t->uiGlobalHandleListLength++;
  }

  /********************************************************************/
  /*  Release the Handle List.                                        */
  /********************************************************************/

  OP_UnlockMutex( pShm_t->hmxGlobalHandleList );

#endif

  /********************************************************************/
  /*  Save the input parameters in the play audio handle.             */
  /********************************************************************/

  pPlayAudio->CallbackRoutine = CallbackRoutine;
  pPlayAudio->aInstance = aInstance;
  pPlayAudio->dwDeviceOptions = dwDeviceOptions;

  /********************************************************************/
  /*  Initialize some Audio parameter handles and flags.              */
  /********************************************************************/

  pPlayAudio->bTimerExit = FALSE;
  pPlayAudio->bPaused = FALSE;
  pPlayAudio->bEnableOpenErrorMessage = TRUE;
  pPlayAudio->bReportPlayStop = FALSE;

  /********************************************************************/
  /*  Initialize the wave out device state flags.                     */
  /********************************************************************/

  pPlayAudio->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
  pPlayAudio->dwAudioPlayState = AUDIO_STATE_PLAY;

  /********************************************************************/
  /*  Initialize the wave out device close request state              */
  /********************************************************************/

  pPlayAudio->dwAudioDeviceCloseRequest = AUDIO_DEVICE_CLOSE_REQUEST_CANCELLED;

    /********************************************************************/
  /*  Set both audio position counts to zero.                         */
  /********************************************************************/

  pPlayAudio->dwPositionBase = 0;
  pPlayAudio->dwBytesPlayed = 0;
  pPlayAudio->dwQueuedByteCount = 0;

  /********************************************************************/
  /*  Create an "Audio Device Inactive" event. The initial state is   */
  /*  signalled.                                                      */
  /********************************************************************/

  pPlayAudio->hevAudioDeviceInactive = OP_CreateEvent( TRUE, TRUE );

  if ( pPlayAudio->hevAudioDeviceInactive == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create an "Audio Device Close Request" event. The initial state is   */
  /*  signalled.  Manual Reset                                                    */
  /********************************************************************/

  pPlayAudio->hevAudioDeviceCloseRequestCancel = OP_CreateEvent( TRUE, TRUE );

  if ( pPlayAudio->hevAudioDeviceCloseRequestCancel == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create an "Timer Thread Active" event. The initial state is     */
  /*  signalled.                                                      */
  /********************************************************************/

  pPlayAudio->hevTimerThreadActive = OP_CreateEvent( TRUE, TRUE );

  if ( pPlayAudio->hevTimerThreadActive == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create a "Queue Not Full" event. The initial state is           */
  /*  signalled.                                                      */
  /********************************************************************/

  pPlayAudio->hevQueueNotFull = OP_CreateEvent( TRUE, TRUE );

  if ( pPlayAudio->hevQueueNotFull == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create a "Reset Complete" event. The initial state is not       */
  /*  signalled.                                                      */
  /********************************************************************/

  pPlayAudio->hevResetComplete = OP_CreateEvent( TRUE, TRUE );

  if ( pPlayAudio->hevResetComplete == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Audio Device State" mutex.                          */
  /********************************************************************/

  pPlayAudio->hmxAudioDeviceState = OP_CreateMutex();

  if ( pPlayAudio->hmxAudioDeviceState == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Bytes Played" mutex.                                */
  /********************************************************************/

  pPlayAudio->hmxBytesPlayed = OP_CreateMutex();

  if ( pPlayAudio->hmxBytesPlayed == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Selected Device ID" mutex.                          */
  /********************************************************************/

  pPlayAudio->hmxSelectedDeviceID = OP_CreateMutex();

  if ( pPlayAudio->hmxSelectedDeviceID == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Queue Count" mutex.                                 */
  /********************************************************************/

  pPlayAudio->hmxQueueCount = OP_CreateMutex();

  if ( pPlayAudio->hmxQueueCount == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Queue Audio Busy" mutex.                            */
  /********************************************************************/

  pPlayAudio->hmxQueueAudioBusy = OP_CreateMutex();

  if ( pPlayAudio->hmxQueueAudioBusy == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Queued Byte Count" mutex.                           */
  /********************************************************************/

  pPlayAudio->hmxQueuedByteCount = OP_CreateMutex();

  if ( pPlayAudio->hmxQueuedByteCount == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Pause Flag" mutex.                                  */
  /********************************************************************/

  pPlayAudio->hmxPauseFlag = OP_CreateMutex();

  if ( pPlayAudio->hmxPauseFlag == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Synchronization Mark List" mutex.                   */
  /********************************************************************/

  pPlayAudio->hmxSynchronizationMarkList = OP_CreateMutex();

  if ( pPlayAudio->hmxSynchronizationMarkList == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Wave Format" mutex.                                 */
  /********************************************************************/

  pPlayAudio->hmxWaveFormat = OP_CreateMutex();

  if ( pPlayAudio->hmxWaveFormat == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Create the "Audio Device Close Requst" mutex.                          */
  /********************************************************************/

  pPlayAudio->hmxAudioDeviceCloseRequest = OP_CreateMutex();

  if ( pPlayAudio->hmxAudioDeviceCloseRequest == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Set the wave format data in the "play audio" handle.            */
  /********************************************************************/
#ifdef AUD_DEBUG
  OutputDebugString("PA_: setting format in handle..\n");
#endif
  if ( pWaveFormat != NULL )
  {
#ifdef AUD_DEBUG
	  OutputDebugString("PA_: SetNewFormat {1}\n");
#endif
	  mmStatus = SetNewFormat( pPlayAudio, pWaveFormat );
  }
  else
  {
    /******************************************************************/
    /*  The default format is 11 Khz. 16 bit PCM.                     */
    /******************************************************************/

    WaveFormat.wFormatTag = WAVE_FORMAT_PCM;
    WaveFormat.nSamplesPerSec = 11025;
    WaveFormat.nChannels = 1;
    WaveFormat.nAvgBytesPerSec = 22050;
    WaveFormat.nBlockAlign = 2;
    WaveFormat.wBitsPerSample = 16;
    WaveFormat.cbSize = 0;

#ifdef AUD_DEBUG
	OutputDebugString("PA_: SetNewFormat {2}\n");
#endif
    mmStatus = SetNewFormat( pPlayAudio, &WaveFormat );
  }

  if ( mmStatus )
  {
#ifdef AUD_DEBUG
	OutputDebugString("PA_: SetNewFormat failed\n");
#endif
    PA_DestroyPlayHandle( pPlayAudio );
    return mmStatus;
  }

  /********************************************************************/
  /*  Allocate Memory for Wave Header pointer array.                  */
  /********************************************************************/

  pPlayAudio->ppWaveHdr =
    (LPWAVEHDR *)malloc( MAXIMUM_BUFFERS_QUEUED * sizeof(LPWAVEHDR));

  if ( pPlayAudio->ppWaveHdr == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_NOMEM;
  }
  else
  {
    for ( uiI = 0; uiI < MAXIMUM_BUFFERS_QUEUED; uiI++ )
      pPlayAudio->ppWaveHdr[uiI] = NULL;

    /******************************************************************/
    /*  Allocate Memory for the Wave Headers.                         */
    /******************************************************************/

    for ( uiI = 0; uiI < MAXIMUM_BUFFERS_QUEUED; uiI++ )
    {
      LOCK_MME_CALL(
        pPlayAudio->ppWaveHdr[uiI] =
          (LPWAVEHDR)ALLOCATE_LOCKED_MEMORY( sizeof(WAVEHDR)))

      if ( pPlayAudio->ppWaveHdr[uiI] == NULL )
      {
        PA_DestroyPlayHandle( pPlayAudio );
        return MMSYSERR_NOMEM;
      }
    }
  }

  /********************************************************************/
  /*  Allocate Memory for the Audio Queue Structure.                  */
  /********************************************************************/

  pPlayAudioRing = (LPPLAY_RING_T)malloc(sizeof(PLAY_RING_T));

  if ( pPlayAudioRing == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_NOMEM;
  }

  pPlayAudio->pPlayAudioRing = pPlayAudioRing;

  /********************************************************************/
  /*  Initialize several of the audio queue elements to NULL.         */
  /********************************************************************/

  pPlayAudioRing->pQueueTop = NULL;

  /********************************************************************/
  /*  Allocate Memory for the audio buffer.                           */
  /********************************************************************/

  LOCK_MME_CALL(
    pPlayAudioRing->pQueueTop = (LPAUDIO_T)
      ALLOCATE_SERVER_BUFFER(( AUDIO_BUFFER_SIZE + MAXIMUM_WRITE_LENGTH ) *
        sizeof(AUDIO_T)))

  if ( pPlayAudioRing->pQueueTop == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_NOMEM;
  }

  /********************************************************************/
  /*  Initialize the audio queue buffer start and length.             */
  /********************************************************************/

  pPlayAudioRing->pQueueStart =
    pPlayAudioRing->pQueueTop + MAXIMUM_WRITE_LENGTH;
  pPlayAudioRing->iQueueLength = AUDIO_BUFFER_SIZE;

  /********************************************************************/
  /*  Initialize the audio queue and the completion count.            */
  /********************************************************************/

  ResetAudioQueue( pPlayAudio );

  pPlayAudio->iSamplesWaitingForCompletion = 0;

  /********************************************************************/
  /*  If this is the first instance then create a message queue and   */
  /*  a "play audio" thread.                                          */
  /********************************************************************/

  if ( pShm_t->uiGlobalPlayAudioInstance == 1 )
  {
    /******************************************************************/
    /*  Create the "play audio" message queue.                        */
    /******************************************************************/

    pShm_t->pGlobalPlayAudioMessageQueue = CreateMessageQueue( MESSAGE_QUEUE_LENGTH );

    if ( pShm_t->pGlobalPlayAudioMessageQueue == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_ERROR;
    }

    /******************************************************************/
    /*  Create the "report" message queue.                            */
    /******************************************************************/

    pShm_t->pGlobalReportMessageQueue = CreateMessageQueue( 1 );

    if ( pShm_t->pGlobalReportMessageQueue == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_ERROR;
    }

    /******************************************************************/
    /*  Create the global "Send Play Audio" mutex.                    */
    /******************************************************************/

    pShm_t->hmxGlobalSendPlayAudio = OP_CreateMutex();

    if ( pShm_t->hmxGlobalSendPlayAudio == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_ERROR;
    }

    /******************************************************************/
    /*  Create the play audio thread.                                 */
    /******************************************************************/

    pShm_t->hGlobalPlayAudioThread =
              OP_CreateThread( 0,
                               (THREAD_PROCEDURE_T)PlayAudioThreadMain,
                               pPlayAudio );

    if ( pShm_t->hGlobalPlayAudioThread == NULL )
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_ERROR;
    }

    OP_SetThreadPriority( pShm_t->hGlobalPlayAudioThread, OP_PRIORITY_HIGHEST );

#ifdef USE_MME_SERVER

    /******************************************************************/
    /*  Create the MME callback thread.                               */
    /******************************************************************/

    pShm_t->bGlobalMmeCallbackExit = FALSE;

    pShm_t->hGlobalMmeCallbackThread =
            OP_CreateThread( 0,
                             (THREAD_PROCEDURE_T)MmeCallbackThreadMain,
                             pPlayAudio );

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
    if ( pShm_t->hGlobalPlayAudioThread == NULL )
#endif
#ifdef __osf__
    if ( pShm_t->hGlobalMmeCallbackThread == NULL )
#endif
    {
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_ERROR;
    }

#endif

  }
  // tek 30sep96 move this thread creation up here (BATS 136)
  /********************************************************************/
  /*  Create the Timer Thread.                                        */
  /********************************************************************/

  pPlayAudio->hTimerThread =
                  OP_CreateThread( 0,
                                   (THREAD_PROCEDURE_T)TimerThreadMain,
                                   pPlayAudio );

  if ( pPlayAudio->hTimerThread == NULL )
  {
    PA_DestroyPlayHandle( pPlayAudio );
    return MMSYSERR_ERROR;
  }

  /********************************************************************/
  /*  Selected a device ID into the "play audio" handle.              */
  /********************************************************************/

  if ( uiWaveOutDeviceID == (unsigned int)WAVE_MAPPER )
  {
#ifdef AUD_DEBUG
	OutputDebugString("PA_: device is WAVE_MAPPER\n");
#endif
    mmStatus = DetermineDeviceID( pPlayAudio,
                                  uiNumberOfWaveOutDevices,
                                  pPlayAudio->pWaveFormat );
    if ( mmStatus )
    {
#ifdef AUD_DEBUG
	  OutputDebugString("PA_: DetermineDeviceID failed\n");
#endif
      PA_DestroyPlayHandle( pPlayAudio );
      return mmStatus;
    }
  }
  else
  {
#ifdef AUD_DEBUG
    {
      char  szTemp[256]="";
      sprintf(szTemp,"PA_: device is not WAVE_MAPPER, it is: %i\n"
	      ,uiWaveOutDeviceID);
      OutputDebugString(szTemp);
    }
#endif
    pPlayAudio->uiSelectedDeviceID = uiWaveOutDeviceID;

    mmStatus = PA_SetFormat( pPlayAudio, pPlayAudio->pWaveFormat );

    if (( mmStatus != MMSYSERR_NOERROR )
      && ( mmStatus != MMSYSERR_ALLOCATED ))
    {
#ifdef AUD_DEBUG
	  OutputDebugString("PA_: PA_SetFormat failed\n");
#endif
      PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_NOTSUPPORTED;
    }
  }

  /********************************************************************/
  /*  Set the dwDeviceSupport member of the play audio handle         */
  /*  pointed to by "pPlayAudio" to the dwSupport field of the        */
  /*  WAVEOUTCAPS structure. The device ID is specified by the        */
  /*  uiSelectedDeviceID field of the play audio handle.              */
  /********************************************************************/

  if ( pPlayAudio->uiSelectedDeviceID != (unsigned int)WAVE_MAPPER )
  {
    mmStatus = GetWaveOutDeviceCaps( pPlayAudio );

    if ( mmStatus )
    {
#ifdef AUD_DEBUG
	  OutputDebugString("PA_: GetWaveOutDeviceCaps failed\n");
#endif
      PA_DestroyPlayHandle( pPlayAudio );
      return mmStatus;
    }
  }

  /********************************************************************/
  /*  If the application will own the audio device then try to open   */
  /*  it now.                                                         */
  /********************************************************************/

  if ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
  {
    if ( SendPlayAudioMessage( pPlayAudio,
                               ID_Open_Wave_Output_Device,
                               0L ) == MMSYSERR_NOTSUPPORTED )
    {
#ifdef AUD_DEBUG
	  OutputDebugString("PA_: SendPlayAudioMessage failed\n");
#endif
	  PA_DestroyPlayHandle( pPlayAudio );
      return MMSYSERR_NOTSUPPORTED;
    }
  }

  /********************************************************************/
  /*  Pass the play audio handle back to the application.             */
  /********************************************************************/

  pPlayAudio->bHandleValid = TRUE;

  *ppPlayAudio = pPlayAudio;

#ifdef AUD_DEBUG
  OutputDebugString("PA_: Successful exit.\n");
#endif
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
/*         This function frees all memory and system objects          */
/*    associated with a "play audio" handle. When the last handle     */
/*    is destroyed, the "play audio" thread is destroyed.             */
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
//
// tek 27may98 this is protected against re-entrance by a shell
//
// declare the actual routine
MMRESULT PA_DestroyPlayHandleEx( HPLAY_AUDIO_T pPlayAudio );
//
// the shell routine
MMRESULT PA_DestroyPlayHandle( HPLAY_AUDIO_T pPlayAudio )
{

	MMRESULT mmResult=MMSYSERR_ERROR; // the default error
	BOOL bGotLock=FALSE;	// whether we got the lock

	// try to gain control of the resources
	bGotLock = ThreadLock(&tlPlayAudio,5);
	if (bGotLock)
	{	// do the actual call..
		mmResult = PA_DestroyPlayHandleEx( pPlayAudio );
		// unlock the resources
		ThreadUnlock(&tlPlayAudio);
	}
	// return our result
	return (mmResult);
}
//
// the real routine..
MMRESULT PA_DestroyPlayHandleEx( HPLAY_AUDIO_T pPlayAudio )
{
  unsigned int uiI;
  MMRESULT mmStatus;
  THREAD_STATUS_T ThreadStatus;
  LPPLAY_RING_T pPlayAudioRing;
  
  /********************************************************************/
  /*  Decrement the play audio instance count.                        */
  /********************************************************************/
  
  pShm_t->uiGlobalPlayAudioInstance--;
  
  /********************************************************************/
  /*  Destroy the play audio handle.                                  */
  /********************************************************************/
  
  if ( pPlayAudio != NULL )
    {
      /******************************************************************/
      /*  If the audio system is playing then a reset is necessary      */
      /*  before shutting down.                                         */
      /******************************************************************/
      
      if ( pPlayAudio->bHandleValid )
	{
	  PA_Reset( pPlayAudio );
	  
	  /****************************************************************/
	  /*  The audio system has already been reset so we can close the */
	  /*  wave output device here.                                    */
	  /****************************************************************/
	  
	  pPlayAudio->bReportPlayStop = FALSE;
	  
	  OP_ResetEvent( pPlayAudio->hevAudioDeviceInactive );
	  
	  if ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
	    {
	      LOCK_MME_CALL( waveOutClose( pPlayAudio->hWaveOut ))
		  pPlayAudio->bResetPaused = FALSE;
		OP_WaitForEvent( pPlayAudio->hevAudioDeviceInactive,
				 MAXIMUM_CLOSE_WAIT_IN_MSEC );
	    }
	  else
	  {
		  // Due to the delayed close of the audio device, the device my still be opened
		  // and the timer thread may hold up the shutdown.
		  OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
		  if (pPlayAudio->dwAudioDeviceCloseRequest == AUDIO_DEVICE_CLOSE_REQUESTED)
		  {
			  OP_SetEvent(pPlayAudio->hevAudioDeviceCloseRequestCancel);
		  }
		  OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
	  }

	}
      
      /******************************************************************/
      /*  Cause the timer thread to exit.                               */
      /*  The only place in the code where the hevTimerThreadActive     */
      /*  event is reset is locked by the synchronization mark mutex so */
      /*  we use that also to lock the thread exit flag. Since this is  */
      /*  only used for shutdown, it seemed unnecessary to create       */
      /*  an additional mutex.                                          */
      /******************************************************************/
      
      if ( pPlayAudio->hTimerThread != NULL )
	{
	  OP_LockMutex( pPlayAudio->hmxSynchronizationMarkList );
	  pPlayAudio->bTimerExit = TRUE;
	  OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );
	  
	  if ( pPlayAudio->hevTimerThreadActive != NULL )
	    {
	      OP_SetEvent( pPlayAudio->hevTimerThreadActive );
	    }
	  /* TQL 05/21/1997  change this for OSF build */  
	  OP_WaitForThreadTermination( pPlayAudio->hTimerThread,
#if defined WIN32 && !defined NOWIN  
				       &ThreadStatus
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_  || defined NOWIN
	                               &ThreadStatus, OP_INFINITE
#endif
				       );
        }
      
#ifdef OS_SIXTY_FOUR_BIT
      
      /******************************************************************/
      /*  Set the instance location in the global audio handle array    */
      /*  to NULL.                                                      */
      /******************************************************************/
      
      uiI = pPlayAudio->uiHandleListIndex;
      
      if ( uiI != (unsigned int)(-1))
	{
	  pShm_t->ppGlobalHandleList[uiI] = pPlayAudio;
	}
      
#endif
      
      /******************************************************************/
      /*  If there are no more "play audio" instances then destroy the  */
      /*  "play audio" thread and the message queue.                    */
      /******************************************************************/
      
      if ( pShm_t->uiGlobalPlayAudioInstance == 0 )
	{
	  
#ifdef USE_MME_SERVER
	  
	  /****************************************************************/
	  /*  Destroy the MME callback thread.                            */
	  /****************************************************************/
	  
	  if ( pShm_t->hGlobalMmeCallbackThread != NULL )
	    {
	      pShm_t->bGlobalMmeCallbackExit = TRUE;
	      
	      OP_WaitForThreadTermination( pShm_t->hGlobalMmeCallbackThread,
					   /* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
					   &ThreadStatus
#endif
#ifdef __osf__
					   &ThreadStatus, OP_INFINITE
#endif
					   );
	      pShm_t->hGlobalMmeCallbackThread = NULL;
	    }
	  
#endif
	  
	  /****************************************************************/
	  /*  Destroy the play audio thread.                              */
	  /****************************************************************/
	  
	  if ( pShm_t->hGlobalPlayAudioThread != NULL ) {
	    SendPlayAudioMessage( pPlayAudio, ID_Destroy_Message, 0 );
	    
	    OP_WaitForThreadTermination( pShm_t->hGlobalPlayAudioThread,
#if defined WIN32 && !defined NOWIN 
					 &ThreadStatus
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
					 &ThreadStatus, OP_INFINITE
#endif
					 );
	    pShm_t->hGlobalPlayAudioThread = NULL;
	  }
	  
	  /****************************************************************/
	  /*  Destroy the "Play Audio" message queue.                     */
	  /****************************************************************/
	  
	  if ( pShm_t->pGlobalPlayAudioMessageQueue != NULL )
	    {
	      DestroyMessageQueue( pShm_t->pGlobalPlayAudioMessageQueue );
	      pShm_t->pGlobalPlayAudioMessageQueue = NULL;
	    }
	  
	  /****************************************************************/
	  /*  Destroy the "Send Play Audio" mutex.                        */
	  /****************************************************************/
	  
	  OP_DestroyMutex( pShm_t->hmxGlobalSendPlayAudio );
	  
	  /****************************************************************/
	  /*  Destroy the "Report" message queue.                         */
	  /****************************************************************/
	  
	  if ( pShm_t->pGlobalReportMessageQueue != NULL )
	    {
	      DestroyMessageQueue( pShm_t->pGlobalReportMessageQueue );
	      pShm_t->pGlobalReportMessageQueue = NULL;
	    }
	  
#ifdef OS_SIXTY_FOUR_BIT
	  
	  /****************************************************************/
	  /*  Free the global "play audio" handle list.                   */
	  /****************************************************************/
	  
	  if ( pShm_t->ppGlobalHandleList != NULL )
	    {
	      free( pShm_t->ppGlobalHandleList );
	      pShm_t->ppGlobalHandleList = NULL;
	    }
	  
	  pShm_t->uiGlobalHandleListLength = 0;
	  
	  /****************************************************************/
	  /*  Destroy the "Handle List" mutex.                            */
	  /****************************************************************/
	  
	  OP_DestroyMutex( pShm_t->hmxGlobalHandleList );
	  
#endif
	  
	}
      
      /******************************************************************/
      /*  Free the Audio Queue memory.                                  */
      /******************************************************************/
      
      pPlayAudioRing = pPlayAudio->pPlayAudioRing;
      
      if ( pPlayAudioRing != NULL )
	{
	  /****************************************************************/
	  /*  Free Memory for the Audio Queue sample buffer.              */
	  /****************************************************************/
	  
	  if ( pPlayAudioRing->pQueueTop != NULL )
	    {
	      LOCK_MME_CALL( FREE_SERVER_BUFFER( pPlayAudioRing->pQueueTop ))
		}
	  
	  /****************************************************************/
	  /*  Free Memory for the Audio Queue Structure.                  */
	  /****************************************************************/
	  
	  free( pPlayAudioRing );
	}
      
      /******************************************************************/
      /*  Free Memory for Wave Headers.                                 */
      /******************************************************************/
      
      if ( pPlayAudio->ppWaveHdr != NULL )
	{
	  for ( uiI = 0; uiI < MAXIMUM_BUFFERS_QUEUED; uiI++ )
	    {
	      if ( pPlayAudio->ppWaveHdr[uiI] != NULL )
		{
		  LOCK_MME_CALL( FREE_LOCKED_MEMORY( pPlayAudio->ppWaveHdr[uiI] ))
		    }
	    }
	  
	  /****************************************************************/
	  /*  Free the Wave Header pointer array memory.                  */
	  /****************************************************************/
	  
	  free( pPlayAudio->ppWaveHdr );
	}
      
      /******************************************************************/
      /*  Destroy the "WaveFormat" mutex.                               */
      /******************************************************************/
      
      OP_DestroyMutex( pPlayAudio->hmxWaveFormat );
      
      /******************************************************************/
      /*  Destroy the "Synchronization Mark List" mutex.                */
      /******************************************************************/
      
      OP_DestroyMutex( pPlayAudio->hmxSynchronizationMarkList );
      
      /******************************************************************/
      /*  Destroy the ""Pause Flag" mutex.                              */
      /******************************************************************/
      
      OP_DestroyMutex( pPlayAudio->hmxPauseFlag );
      
      /******************************************************************/
      /*  Destroy the "Queued Byte Count" mutex.                        */
      /******************************************************************/
      
      OP_DestroyMutex( pPlayAudio->hmxQueuedByteCount );
      
      /******************************************************************/
      /*  Destroy the "Queue Audio Busy" mutex.                         */
      /******************************************************************/
      
      OP_DestroyMutex( pPlayAudio->hmxQueueAudioBusy );
      
      /******************************************************************/
      /*  Destroy the "Queue Count" mutex.                              */
      /******************************************************************/

    OP_DestroyMutex( pPlayAudio->hmxQueueCount );

    /******************************************************************/
    /*  Destroy the "Selected Device ID" mutex.                       */
    /******************************************************************/

    OP_DestroyMutex( pPlayAudio->hmxSelectedDeviceID );

    /******************************************************************/
    /*  Destroy the "Bytes Played" mutex.                             */
    /******************************************************************/

    OP_DestroyMutex( pPlayAudio->hmxBytesPlayed );

    /******************************************************************/
    /*  Destroy the "Audio Device State" mutex.                       */
    /******************************************************************/

    OP_DestroyMutex( pPlayAudio->hmxAudioDeviceState );

    /******************************************************************/
    /*  Destroy the "Reset Complete" event.                           */
    /******************************************************************/

    OP_DestroyEvent( pPlayAudio->hevResetComplete );

    /******************************************************************/
    /*  Destroy the "Queue Not Full" event.                           */
    /******************************************************************/

    OP_DestroyEvent( pPlayAudio->hevQueueNotFull );

    /******************************************************************/
    /*  Destroy the "Timer Thread Active" event.                      */
    /******************************************************************/

    OP_DestroyEvent( pPlayAudio->hevTimerThreadActive );

    /******************************************************************/
    /*  Destroy the "Audio Device Inactive" event.                    */
    /******************************************************************/

    OP_DestroyEvent( pPlayAudio->hevAudioDeviceInactive );

    /******************************************************************/
    /*  Destroy the "Audio Device Close Request" event.                    */
    /******************************************************************/

    OP_DestroyEvent( pPlayAudio->hevAudioDeviceCloseRequestCancel );

    /******************************************************************/
    /*  Destroy the "Audio Device Close Request" mutex.                       */
    /******************************************************************/

    OP_DestroyMutex( pPlayAudio->hmxAudioDeviceCloseRequest );

    /******************************************************************/
    /*  Free the play audio handle WAVEFORMATEX structure.            */
    /******************************************************************/

    if ( pPlayAudio->pWaveFormat != NULL )
    {
      LOCK_MME_CALL( FREE_SERVER_MEM( pPlayAudio->pWaveFormat ))
    }

    /******************************************************************/
    /*  Free the play audio handle.                                   */
    /******************************************************************/

    free( pPlayAudio );
    
    mmStatus = MMSYSERR_NOERROR;
    }
  else
    {
      mmStatus = MMSYSERR_INVALHANDLE;
    }

#ifdef MME_THREAD_SAFE
  
  /********************************************************************/
  /*  If this is the last instance then destroy the global mutex that */
  /*  is used to protect MME server calls.                            */
  /********************************************************************/
  
  if ( pShm_t->uiGlobalPlayAudioInstance == 0 )
    {
      OP_DestroyMutex( pShm_t->hmxGlobalMmeServer );
    }
  
#endif

  return mmStatus;
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
/*         This function queues a buffer of audio bytes to the "play  */
/*    audio" thread. This function will block until there is enough   */
/*    space in the audio ring buffer. The wave output device will     */
/*    open automatically to play the audio samples. The wave output   */
/*    device is closed automatically when all audio samples have been */
/*    played.                                                         */
/*                                                                    */
/*         Each queued audio block MUST have a length that is a       */
/*    multiple of the current block alignment. If it does not, then   */
/*    the audio samples will still be added to the audio queue, but   */
/*    the audio driver might hang.                                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    pBuffer       A pointer (of type unsigned char * ) to a buffer  */
/*                  that contains byte samples.                       */
/*                                                                    */
/*    dwLength      A DWORD that equals to the number of bytes to be  */
/*                  be queued. These bytes are in the buffer pointed  */
/*                  to by the argument "pBuffer". This length must be */
/*                  a multiple of the current block alignment or some */
/*                  of the queued audio might not be played. This     */
/*                  length must not exceed the maximum size of the    */
/*                  audio ring buffer or else this function will      */
/*                  block forever. This maximum size is constant and  */
/*                  can be determined before queueing any audio by    */
/*                  calling the PA_Status() function to determine the */
/*                  free space in the audio ring buffer.              */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The audio handle is invalid.             */
/*    MMSYSERR_INVALPARAM    The queued audio size was larger then    */
/*                           AUDIO_BUFFER_SIZE.                       */
/*                                                                    */
/*                                                                    */
/*      ASYNCHRONOUS ERROR MESSAGES.                                  */
/*                                                                    */
/*         After PA_Queue() function is called, the audio thread      */
/*    can send asynchronous messages by calling the callback function */
/*    that is passed in the PA_CreatePlayHandle() function. One of    */
/*    the message codes listed below will be passed in the message    */
/*    argument of the callback routine.                               */
/*                                                                    */
/*        Error code                                                  */
/*                                                                    */
/*      PA_PLAY_START           1                                     */
/*      PA_PLAY_STOP            2                                     */
/*      PA_SYNC_MARK            3                                     */
/*      PA_DEVICE OPEN_FAILURE  4                                     */
/*      PA_GET_CAPS_ERROR       5                                     */
/*      PA_WRITE_ERROR          6                                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_Queue( HPLAY_AUDIO_T pPlayAudio,
                   LPAUDIO_T pBuffer,
                   DWORD dwLength )
{
  DWORD dwWrap;
  DWORD dwRemaining;
  LPPLAY_RING_T pPlayAudioRing;

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  struct timespec tv;
#endif

#ifdef AUD_DEBUG  // 13may97 tek 
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"PA_Queue: size=%lu at %lu\n",
			  dwLength, timeGetTime());
		  //OutputDebugString(szTemp); // tek 21nov97 make less verbose
  }
#endif //AUD_DEBUG

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

  /********************************************************************/
  /*  If too many samples then exit with error status.                */
  /********************************************************************/

  if ( dwLength > AUDIO_BUFFER_SIZE )
    return MMSYSERR_INVALPARAM;

  pPlayAudioRing = pPlayAudio->pPlayAudioRing;

	//  MGS check to see if close is requested, and if it is, cancel that request..
    OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
	if (pPlayAudio->dwAudioDeviceCloseRequest == AUDIO_DEVICE_CLOSE_REQUESTED)
	{
		pPlayAudio->dwAudioDeviceCloseRequest = AUDIO_DEVICE_CLOSE_REQUEST_CANCELLED;
		OP_SetEvent(pPlayAudio->hevAudioDeviceCloseRequestCancel);
	}
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );

  /********************************************************************/
  /*  Block if another thread is queueing audio or performing a       */
  /*  reset.                                                          */
  /********************************************************************/
  OP_LockMutex( pPlayAudio->hmxQueueAudioBusy );


  
  /********************************************************************/
  /*  Wait for space in the queue before adding the new audio buffer. */
  /*  Block if another thread is manipulating the queue count.        */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxQueueCount );

  while ( pPlayAudioRing->iQueueCount + (int)dwLength
            > pPlayAudioRing->iQueueLength )
  {
    OP_UnlockMutex( pPlayAudio->hmxQueueCount );
    OP_UnlockMutex( pPlayAudio->hmxQueueAudioBusy );

    OP_ResetEvent( pPlayAudio->hevQueueNotFull );

    OP_WaitForEvent( pPlayAudio->hevQueueNotFull, OP_INFINITE );
#if defined __linux__ || defined VXWORKS
//necessary for proper multithreading, this may be fixed in newer kernels
    tv.tv_sec=0;
    tv.tv_nsec=1;
    nanosleep(&tv,NULL);
    //usleep(1);
#endif
    OP_LockMutex( pPlayAudio->hmxQueueAudioBusy );
    OP_LockMutex( pPlayAudio->hmxQueueCount );
  }

  OP_UnlockMutex( pPlayAudio->hmxQueueCount );

  /********************************************************************/
  /*  There is enough space in the audio queue. Test to see if the    */
  /*  data will wrap around the circular queue.                       */
  /********************************************************************/

  if ( pPlayAudioRing->iInputPosition + (int)dwLength
         > pPlayAudioRing->iQueueLength )
  {
    /******************************************************************/
    /*  The data will wrap around the circular queue.                 */
    /******************************************************************/

    dwRemaining =
      pPlayAudioRing->iQueueLength - pPlayAudioRing->iInputPosition;

    /******************************************************************/
    /*  for ( uiI = 0; uiI < dwRemaining; uiI++ )                     */
    /*    *pPlayAudioRing->pQueueInput++ = *pBuffer++;                */
    /******************************************************************/

    memcpy( pPlayAudioRing->pQueueInput, pBuffer, dwRemaining );

    pBuffer += dwRemaining;

    /******************************************************************/
    /*  Reset to the start of the audio queue.                        */
    /******************************************************************/

    pPlayAudioRing->pQueueInput = pPlayAudioRing->pQueueStart;

    /******************************************************************/
    /*  for ( uiI = dwRemaining; uiI < dwLength; uiI++ )              */
    /*    *pPlayAudioRing->pQueueInput++ = *pBuffer++;                */
    /******************************************************************/

    dwWrap = dwLength - dwRemaining;

    memcpy( pPlayAudioRing->pQueueInput, pBuffer, dwWrap );

    pPlayAudioRing->pQueueInput += dwWrap;
    pPlayAudioRing->iInputPosition = (int)dwWrap;
  }
  else
  {
    /******************************************************************/
    /*  The data will NOT wrap around the circular queue.             */
    /******************************************************************/
    /******************************************************************/
    /*  for ( uiI = 0; uiI < dwLength; uiI++ )                        */
    /*    *pPlayAudioRing->pQueueInput++ = *pBuffer++;                */
    /******************************************************************/

    memcpy( pPlayAudioRing->pQueueInput, pBuffer, dwLength );

    pPlayAudioRing->pQueueInput += dwLength;
    pPlayAudioRing->iInputPosition += (int)dwLength;
  }

  /********************************************************************/
  /*  Atomically update the audio queue count.                        */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxQueueCount );
  pPlayAudioRing->iQueueCount += (int)dwLength;
  OP_UnlockMutex( pPlayAudio->hmxQueueCount );

  /********************************************************************/
  /*  Atomically update the queued byte count.                        */
  /*  If audio is not playing then activate the timer thread.         */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxQueuedByteCount );

  pPlayAudio->dwQueuedByteCount += dwLength;

  if ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
  {
    OP_SetEvent( pPlayAudio->hevTimerThreadActive );
  }

  OP_UnlockMutex( pPlayAudio->hmxQueuedByteCount );

  /********************************************************************/
  /*  If the audio is not playing and there are enough audio samples  */
  /*  and the system is not paused then start playing audio. Note     */
  /*  that the following tests do NOT have to be performed in a       */
  /*  thread-safe manner.                                             */
  /********************************************************************/

  if (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
    && ( pPlayAudioRing->iQueueCount
	>= (int)pPlayAudio->uiMinimumStartupBytes )
   && ( ! pPlayAudio->bPaused ))
  {
    SendPlayAudioMessage( pPlayAudio,
                          ID_Open_Wave_Output_Device,
                          0L );
  }

  /********************************************************************/
  /*  Release the PA_Queue() function for use in another thread.      */
  /********************************************************************/

  OP_UnlockMutex( pPlayAudio->hmxQueueAudioBusy );

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
/*         This function stops any audio that is playing and resets   */
/*    the audio queue. A reset might be delayed if another thread     */
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
#ifndef SAPI5DECTALK
MMRESULT PA_Reset( HPLAY_AUDIO_T pPlayAudio )
{
  MMRESULT mmStatus;
#ifdef AUD_DEBUG //tek 22may97
  {
    char szTemp[256]="";
    sprintf(szTemp,"PA_Reset: at %ld\n",timeGetTime());
    OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG
  
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/
  
  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALPARAM;

  /********************************************************************/
  /*  Block if another thread is queueing audio.                      */
  /********************************************************************/
  if (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
      && ( pPlayAudio->pPlayAudioRing->iQueueCount!=0 ))
  {
	  StartAudioPlaying(pPlayAudio);
  }

    OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
	if (pPlayAudio->dwAudioDeviceCloseRequest == AUDIO_DEVICE_CLOSE_REQUESTED)
	{
		pPlayAudio->dwAudioDeviceCloseRequest = AUDIO_DEVICE_CLOSE_REQUEST_CANCELLED;
		OP_SetEvent(pPlayAudio->hevAudioDeviceCloseRequestCancel);
	}
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );


  OP_LockMutex( pPlayAudio->hmxQueueAudioBusy );

  /********************************************************************/
  /*  Reset the "Reset Complete" event.                               */
  /********************************************************************/

  OP_ResetEvent( pPlayAudio->hevResetComplete );

  /********************************************************************/
  /*  Cancel all audio output and initialize the audio queue.         */
  /********************************************************************/

  mmStatus = (MMRESULT)SendPlayAudioMessage( pPlayAudio,
	  ID_Reset_Audio,
	  0L );
  // tek 22jan99 if the audio device is still busy (we really don't
  // care if there is another writer of the status word, because we're
  // not gonna write it..) then we need to send the reset again so that 
  // the reset code can do cleanup after the WOM_DONE messages are processed.
  if ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {  
#ifdef AUD_DEBUG
	  {
		  char szTemp[256];
		  sprintf(szTemp,"PA_Reset resending ID_Reset_Audio at %ld\n",
			  timeGetTime());
		  OutputDebugString(szTemp);
	  }
#endif //AUD_DEBUG
	  SendPlayAudioMessage( pPlayAudio,
		  ID_Reset_Audio,
		  0L );
  }

  /********************************************************************/
  /*  If audio is playing then wait for the reset to complete.        */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxAudioDeviceState );

  if ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );

    OP_WaitForEvent( pPlayAudio->hevResetComplete,
                     MAXIMUM_RESET_WAIT_IN_MSEC );
  }
  else
  {
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );
  }

  /********************************************************************/
  /*  Release the audio queue.                                        */
  /********************************************************************/

  OP_UnlockMutex( pPlayAudio->hmxQueueAudioBusy );

  return mmStatus;
}
#endif

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
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

  /********************************************************************/
  /*  Pause the wave output device.                                   */
  /********************************************************************/

  return (MMRESULT)SendPlayAudioMessage( pPlayAudio,
                                         ID_Pause_Audio,
                                         0L );
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
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALPARAM;

  /********************************************************************/
  /*  Resume paused audio output.                                     */
  /********************************************************************/

  mmStatus =  (MMRESULT)SendPlayAudioMessage( pPlayAudio,
                                              ID_Resume_Audio,
                                              0L );

  /********************************************************************/
  /*  If the audio is not playing and there are enough audio samples  */
  /*  then start playing audio. Note that the following test do NOT   */
  /*  have to be performed in a thread safe manner.                   */
  /********************************************************************/

  if (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
   && ( pPlayAudio->pPlayAudioRing->iQueueCount
          >= (int)pPlayAudio->uiMinimumStartupBytes ))
  {
    SendPlayAudioMessage( pPlayAudio,
                          ID_Open_Wave_Output_Device,
                          0L );
  }

  return mmStatus;
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
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

  /********************************************************************/
  /*  Get the audio format.                                           */
  /********************************************************************/

  return (MMRESULT)SendPlayAudioMessage( pPlayAudio,
                                         ID_Get_Audio_Format,
                                         (ATYPE_T)pWaveFormat );
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
  MMRESULT mmStatus;
  DWORD dwWaveFormatSize;
  LPWAVEFORMATEX pWaveFormatTemp;
#ifdef AUD_DEBUG
  OutputDebugString("PA_SetFormat()\n");
#endif
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

  /********************************************************************/
  /*  Allocate shared memory for the MME server.                      */
  /*  First Get the size of the WAVEFORMATEX structure.               */
  /********************************************************************/

  dwWaveFormatSize = GetWaveFormatSize( pWaveFormat );

  /********************************************************************/
  /*  Allocate memory for the play audio handle WAVEFORMATEX          */
  /*  structure.                                                      */
  /********************************************************************/

  LOCK_MME_CALL(
    pWaveFormatTemp =
      (LPWAVEFORMATEX)ALLOCATE_SERVER_MEM( dwWaveFormatSize ))

  if ( pWaveFormatTemp == NULL )
  {
    return MMSYSERR_NOMEM;
  }

  /********************************************************************/
  /*  Copy the WAVEFORMATEX structure passed to this function to      */
  /*  audio handles WAVEFORMATEX structure.                           */
  /********************************************************************/

  memcpy( pWaveFormatTemp,
          pWaveFormat,
          dwWaveFormatSize );

  /********************************************************************/
  /*  Set the audio format.                                           */
  /********************************************************************/
#ifdef AUD_DEBUG
  OutputDebugString("Calling  SendPlayAudioMessage()\n");
#endif
  mmStatus = SendPlayAudioMessage( pPlayAudio,
                                   ID_Set_Audio_Format,
                                   (ATYPE_T)pWaveFormatTemp );

  /******************************************************************/
  /*  Free the temporary WAVEFORMATEX structure.                    */
  /******************************************************************/

  LOCK_MME_CALL( FREE_SERVER_MEM( pWaveFormatTemp ))
#ifdef AUD_DEBUG
  {
#include <stdio.h>
		  char  szTemp[256]="";
		  sprintf(szTemp,"PA_SetFormat: SendPlayAudioMessage status=%lu (%08lx)\n",
			  mmStatus, mmStatus);
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG

  return mmStatus;
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
/*    pdwVolume     A pointer to a DWORD that will contain the wave   */
/*                  output device volume if the function returns      */
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
#if !defined _WIN32 && !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_// NAL warning removal
  LPDWORD pdwVol;
#endif

  MMRESULT mmStatus;

  // tek 12nov97 bats517 change this to just do it, rather than
  // passing messages around..
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

#if defined _WIN32 || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_

  mmStatus = waveOutGetVolume((HWAVEOUT)pPlayAudio->uiSelectedDeviceID,pdwVolume);
#else // not win32 or linux; do it the slow way.
  /********************************************************************/
  /*  Allocate memory to return the volume setting.                   */
  /********************************************************************/

  LOCK_MME_CALL( pdwVol = (LPDWORD)ALLOCATE_SERVER_MEM(sizeof(DWORD)))

  if ( pdwVol == NULL )
  {
    return MMSYSERR_NOMEM;
  }

  /********************************************************************/
  /*  Get the wave output device volume.                              */
  /********************************************************************/

  mmStatus = (MMRESULT)SendPlayAudioMessage( pPlayAudio,
                                             ID_Get_Audio_Volume,
                                             (ATYPE_T)pdwVol );
  *pdwVolume = *pdwVol;

  /********************************************************************/
  /*  Free the memory used to return the volume setting.              */
  /********************************************************************/

  LOCK_MME_CALL( FREE_SERVER_MEM( pdwVol ))
#endif //_WIN32

  return mmStatus;
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
/*    dwVolume      A DWORD that contains the device volume.          */
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

   // tek 12nov97	bats517 change to just do it rather than pass messages

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

  /********************************************************************/
  /*  Set the wave output device volume.                              */
  /********************************************************************/
#ifdef _WIN32
  return waveOutSetVolume((HWAVEOUT)pPlayAudio->uiSelectedDeviceID,dwVolume);
#else // not win32
  return (MMRESULT)SendPlayAudioMessage( pPlayAudio,
                                         ID_Set_Audio_Volume,
                                         (ATYPE_T)dwVolume );
#endif //_WIN32
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PA_SynchronizationMark                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: January 8, 1996                                             */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function places a synchronization mark at the current      */
/*    audio queue position. When all previously queued audio has been */
/*    played then the "play audio" callback function is called with   */
/*    the PA_SYNC_MARK message.                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    aTag          An identifier that is passed to the "play audio"  */
/*                  callback function when all audio up to the mark   */
/*                  has been played.                                  */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT PA_SynchronizationMark( HPLAY_AUDIO_T pPlayAudio,
                                 ATYPE_T aTag )
{
  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

  /********************************************************************/
  /*  Set the wave output Synchronization Mark.                       */
  /********************************************************************/

  return (MMRESULT)SendPlayAudioMessage( pPlayAudio,
                                         ID_Synchronization_Mark,
                                         aTag );
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
/*    count will take over 100 hours to wrap back to zero.            */
/*                                                                    */
/*         There are two modes of operation that are selected by the  */
/*    boolean flag bFast. If bFast is FALSE then this function will   */
/*    send a message to the "play audio" thread that will then        */
/*    provide a very accurate audio position (accurate at the time    */
/*    the message is processed). If bFast is TRUE then the function   */
/*    will return a coarse audio position. The coarse audio position  */
/*    is the sum of all sample bytes that are returned in all of the  */
/*    MM_WOM_DONE messages. This course position is only accurate to  */
/*    within (approximately) 8192 bytes.                              */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    pdwPosition   A pointer to a DWORD that contains the device     */
/*                  position as a byte count. If the device is not    */
/*                  available or the audio position query is not      */
/*                  supported then 0xFFFFFFFF is returned.            */
/*                                                                    */
/*    bFast         A boolean that determines this functions accuracy */
/*                  and execution speed. If bFast is TRUE then this   */
/*                  function will return a coarse audio position. If  */
/*                  bFast is FALSE then a slower, but very accurate   */
/*                  audio position is obtained.                       */
/*                                                                    */
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
  LPDWORD pdwPos;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

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

    OP_LockMutex( pPlayAudio->hmxBytesPlayed );
    *pdwPosition = pPlayAudio->dwBytesPlayed;
    OP_UnlockMutex( pPlayAudio->hmxBytesPlayed );
  }
  else
  {
    /******************************************************************/
    /*  Allocate memory to return the audio position.                 */
    /******************************************************************/

    pdwPos = (LPDWORD)malloc(sizeof(DWORD));

    if ( pdwPos == NULL )
    {
      return MMSYSERR_NOMEM;
    }

    /******************************************************************/
    /*  Get the fine wave output position.                            */
    /******************************************************************/

    mmStatus = (MMRESULT)SendPlayAudioMessage( pPlayAudio,
                                               ID_Get_Audio_Position,
                                               (ATYPE_T)pdwPos );
    *pdwPosition = *pdwPos;

    /******************************************************************/
    /*  Free the memory used to return the audio position.            */
    /******************************************************************/

    free( pdwPos );
  }

  return mmStatus;
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
/*    dwIdentifierArray   An array of values of type DWORD that       */
/*                        contain identifiers that specify the status */
/*                        values to return in array dwStatusArray[].  */
/*                        These values must be one of the following   */
/*                        constants:                                  */
/*                                                                    */
/*      constant               status return value                    */
/*                                                                    */
/*  PA_DEVICE_PLAYING    Returns a value of TRUE if the audio device  */
/*                       is either starting up or playing. A value of */
/*                       FALSE is returned if the audio device is     */
/*                       either shutting down or inactive.            */
/*                                                                    */
/*  PA_FREE_SPACE        Returns the number of bytes of space         */
/*                       remaining in the audio queue. If the         */
/*                       PA_Queue() function is passed a buffer that  */
/*                       contains more bytes than this amount then    */
/*                       the PA_Queue() function will block until     */
/*                       enough byte samples have been played (and    */
/*                       removed from the audio queue.)               */
/*                                                                    */
/*  PA_QUEUE_COUNT       The number of bytes remaining in the audio   */
/*                       queue is returned. This will be equal to     */
/*                       zero when all audio has been played.         */
/*                                                                    */
/*  PA_DEVICE_ID         Returns the selected wave output device ID.  */
/*                       This is useful if WAVE_MAPPER is the device  */
/*                       ID passed to to the PA_CreatePlayHandle()    */
/*                       function.                                    */
/*                                                                    */
/*    dwStatusArray      An array of type DWORD that returns the      */
/*                       status values corresponding to each of       */
/*                       identifiers in array dwIdentifierArray[].    */
/*                                                                    */
/*                                                                    */
/*    dwNumberOfStatusValues  A DWORD that equals the number of       */
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
/*    a non-zero MMRESULT value. Note that 0xFFFFFFFF might be a      */
/*    legitimate status value and will not necessarily indicate an    */
/*    error.                                                          */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  MAXIMUM_STATUS_VALUES  4

MMRESULT PA_Status( HPLAY_AUDIO_T pPlayAudio,
                    DWORD dwIdentifierArray[],
                    DWORD dwStatusArray[],
                    DWORD dwNumberOfStatusValues )
{
  unsigned int uiI;
  unsigned int uiQueueCount=0;
  unsigned int bGotQueueCount;
  DWORD dwAudioDeviceState;
  LPPLAY_RING_T pPlayAudioRing=NULL;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

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

  bGotQueueCount = FALSE;

  for ( uiI = 0; uiI < dwNumberOfStatusValues; uiI++ )
  {
    switch( dwIdentifierArray[uiI] )
    {
    case PA_DEVICE_PLAYING:

      OP_LockMutex( pPlayAudio->hmxAudioDeviceState );
      dwAudioDeviceState = pPlayAudio->dwAudioDeviceState;
      OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );

      if (( dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
        || ( dwAudioDeviceState == AUDIO_DEVICE_SHUTTING_DOWN ))
        dwStatusArray[uiI] = FALSE;
      else
        dwStatusArray[uiI] = TRUE;

      break;

    case PA_FREE_SPACE:

      if ( ! bGotQueueCount )
      {
        bGotQueueCount = TRUE;

        pPlayAudioRing = pPlayAudio->pPlayAudioRing;

        OP_LockMutex( pPlayAudio->hmxQueueCount );
        uiQueueCount = (unsigned int)pPlayAudioRing->iQueueCount;
		// tek 07nov97 BATS 514this was a very bad typo! change to UNlock!
        OP_UnlockMutex( pPlayAudio->hmxQueueCount );
      }

      dwStatusArray[uiI] = (DWORD)
        ((unsigned int )pPlayAudioRing->iQueueLength - uiQueueCount );

      break;

    case PA_QUEUE_COUNT:

      if ( ! bGotQueueCount )
      {
        bGotQueueCount = TRUE;

        pPlayAudioRing = pPlayAudio->pPlayAudioRing;

        OP_LockMutex( pPlayAudio->hmxQueueCount );
        uiQueueCount = (unsigned int)pPlayAudioRing->iQueueCount;
        OP_LockMutex( pPlayAudio->hmxQueueCount );
      }

      dwStatusArray[uiI] = (DWORD)uiQueueCount;

      break;

    case PA_DEVICE_ID:

      OP_LockMutex( pPlayAudio->hmxSelectedDeviceID );
      dwStatusArray[uiI] = (DWORD)pPlayAudio->uiSelectedDeviceID;
      OP_UnlockMutex( pPlayAudio->hmxSelectedDeviceID );

      break;

    default:

      dwStatusArray[uiI] = 0xFFFFFFFF;
      mmStatus = MMSYSERR_INVALPARAM;

      break;
    }
  }

  return mmStatus;
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
  int iQueueCount;
  PLAYAUD_BOOL_T bAudioPlaying;
  LPPLAY_RING_T pPlayAudioRing;

  /********************************************************************/
  /*  Return an error if NULL handle.                                 */
  /********************************************************************/

  if ( pPlayAudio == NULL )
    return MMSYSERR_INVALHANDLE;

  /********************************************************************/
  /*  Loop and wait for all queued audio samples to complete.         */
  /********************************************************************/

  pPlayAudioRing = pPlayAudio->pPlayAudioRing;
  bAudioPlaying = TRUE;

  if (pPlayAudio->dwQueuedByteCount != pPlayAudio->dwBytesPlayed)
  {
	  StartAudioPlaying(pPlayAudio);
  }

  OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
  if (pPlayAudio->dwAudioDeviceCloseRequest == AUDIO_DEVICE_CLOSE_REQUESTED)
  {
	  OP_SetEvent(pPlayAudio->hevAudioDeviceCloseRequestCancel);
  }
  OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
  while( bAudioPlaying )
  {
    /******************************************************************/
    /*  Wait on the Audio Device Inactive Event.                      */
    /******************************************************************/

    OP_WaitForEvent( pPlayAudio->hevAudioDeviceInactive, OP_INFINITE );

    /******************************************************************/
    /*  Check the Audio Queue Count. If there is any audio to be      */
    /*  played then go to sleep and contine to wait.                  */
    /******************************************************************/

    OP_LockMutex( pPlayAudio->hmxQueueCount );
    iQueueCount = pPlayAudioRing->iQueueCount;
    OP_UnlockMutex( pPlayAudio->hmxQueueCount );

    if ( iQueueCount == 0 )
    {
		if (pPlayAudio->dwQueuedByteCount != pPlayAudio->dwBytesPlayed)
		{
			StartAudioPlaying(pPlayAudio);
			OP_Sleep( PLAY_WAIT_SLEEP_TIME_IN_MSEC );
		}
		else
		{
     		bAudioPlaying = FALSE;
    	}
    }
    else
    {
		if (pPlayAudio->dwAudioDeviceState!=AUDIO_DEVICE_ACTIVE)
		{
			StartAudioPlaying(pPlayAudio);
		}
      OP_Sleep( PLAY_WAIT_SLEEP_TIME_IN_MSEC );
    }
  }

  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DetermineDeviceID                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: January 2, 1996                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function tests to see if the requested wave format    */
/*    is supported.                                                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio                  A pointer to a structure of type    */
/*                                PLAY_AUDIO_T.                       */
/*                                                                    */
/*    uiNumberOfWaveOutDevices    An unsigned integer that is equal   */
/*                                to the number of wave output        */
/*                                devices that are supported.         */
/*                                                                    */
/*    pWaveFormat                 A pointer to a structure of type    */
/*                                WAVEFORMATEX that specifies the     */
/*                                audio device format.                */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT DetermineDeviceID( HPLAY_AUDIO_T pPlayAudio,
                                   unsigned int uiNumberOfWaveOutDevices,
                                   LPWAVEFORMATEX pWaveFormat )
{
  unsigned int bGotDeviceID;
  unsigned int bAllocated;
  unsigned int bIsStandardFormat;
  unsigned int uiDeviceID;
  DWORD dwDesiredFormat=0;
  LPWAVEOUTCAPS pWaveOutCaps;
  MMRESULT mmStatus;
#ifdef AUD_DEBUG
  OutputDebugString("DetermineDeviceID()\n");
#endif
  /********************************************************************/
  /*  Query each device until a non-allocated device that supports    */
  /*  the requested format is found.                                  */
  /********************************************************************/

  bGotDeviceID = FALSE;
  bAllocated = FALSE;

  for ( uiDeviceID = 0;
        uiDeviceID < uiNumberOfWaveOutDevices;
        uiDeviceID++ )
  {
    pPlayAudio->uiSelectedDeviceID = uiDeviceID;

    mmStatus = PA_SetFormat( pPlayAudio, pWaveFormat );

    if ( mmStatus == MMSYSERR_NOERROR )
    {
      bGotDeviceID = TRUE;
      break;
    }
    else if ( mmStatus == MMSYSERR_ALLOCATED )
    {
      bAllocated = TRUE;
    }
  }

  /********************************************************************/
  /*  There were no devices available that support the requested      */
  /*  format. Query each device until a device that supports the      */
  /*  requested format is found, even if the device is allocated.     */
  /********************************************************************/

  if ( bAllocated )
  {
    for ( uiDeviceID = 0;
          uiDeviceID < uiNumberOfWaveOutDevices;
          uiDeviceID++ )
    {
      pPlayAudio->uiSelectedDeviceID = uiDeviceID;

      mmStatus = PA_SetFormat( pPlayAudio, pWaveFormat );

      if (( mmStatus == MMSYSERR_NOERROR )
        || ( mmStatus == MMSYSERR_ALLOCATED ))
      {
        bGotDeviceID = TRUE;
        break;
      }
    }
  }

  // tek 24sep96 if we didn't find an unallocated device that 
  // supports this format, and we didn't find an allocated device, 
  // bail out.
  if ((!bGotDeviceID) && (!bAllocated))
  {
#ifdef AUD_DEBUG
	  OutputDebugString("no devices support format.\n");
#endif
	  return WAVERR_BADFORMAT;
  }


  /********************************************************************/
  /*  If a wave output device supporting the request format was not   */
  /*  found, it might be because all devices supporting the requested */
  /*  format are busy and busy devices do not return a bad format     */
  /*  status even if the format is unsupported. This not the case for */
  /*  the MME server, but in any event, this extra check cannot hurt. */
  /*  In this case, device support only for mulaw and certain PCM     */
  /*  formats can be checked.                                         */
  /********************************************************************/

  mmStatus = MMSYSERR_NOERROR;

  if (( ! bGotDeviceID ) && ( bAllocated ))
  {
    /********************************************************************/
    /*  If the wave format tag is equal to either WAVE_FORMAT_PCM or to */
    /*  WAVE_FORMAT_08M08 then test the device capabilities.            */
    /********************************************************************/

    bIsStandardFormat = TRUE;

    switch ( pWaveFormat->wFormatTag )
    {
    /********************************************************************/
    /*  Determine the identifier returned in the dwFormat element       */
    /*  of the WAVEOUTCAPS structure that corresponds to the            */
    /*  requested audio format.                                         */
    /********************************************************************/

    case WAVE_FORMAT_PCM:

      switch ( pWaveFormat->nSamplesPerSec )
      {
      /******************************************************************/
      /*  The sample rate equals 11025 Hz.                              */
      /******************************************************************/

      case 11025:

        switch ( pWaveFormat->nChannels )
        {
        case 1:

          switch ( pWaveFormat->wBitsPerSample )
          {
          case 8:

            dwDesiredFormat = WAVE_FORMAT_1M08;
            break;

          case 16:

            dwDesiredFormat = WAVE_FORMAT_1M16;
            break;

          default:

            bIsStandardFormat = FALSE;;
            break;
          }

        case 2:

          switch ( pWaveFormat->wBitsPerSample )
          {
          case 8:

            dwDesiredFormat = WAVE_FORMAT_1S08;
            break;

          case 16:

            dwDesiredFormat = WAVE_FORMAT_1S16;
            break;

          default:

            bIsStandardFormat = FALSE;;
            break;
          }

        default:

          bIsStandardFormat = FALSE;;
          break;
        }

        break;

      /****************************************************************/
      /*  The sample rate equals 22050 Hz.                            */
      /****************************************************************/

      case 22050:

        switch ( pWaveFormat->nChannels )
        {
        case 1:

          switch ( pWaveFormat->wBitsPerSample )
          {
          case 8:

            dwDesiredFormat = WAVE_FORMAT_2M08;
            break;

          case 16:

            dwDesiredFormat = WAVE_FORMAT_2M16;
            break;

          default:

            bIsStandardFormat = FALSE;;
            break;
          }

        case 2:

          switch ( pWaveFormat->wBitsPerSample )
          {
          case 8:

            dwDesiredFormat = WAVE_FORMAT_2S08;
            break;

          case 16:

            dwDesiredFormat = WAVE_FORMAT_2S16;
            break;

          default:

            bIsStandardFormat = FALSE;;
            break;
          }

        default:

          bIsStandardFormat = FALSE;;
          break;
        }

        break;

      /****************************************************************/
      /*  The sample rate equals 44100 Hz.                            */
      /****************************************************************/

      case 44100:

        switch ( pWaveFormat->nChannels )
        {
        case 1:

          switch ( pWaveFormat->wBitsPerSample )
          {
          case 8:

            dwDesiredFormat = WAVE_FORMAT_4M08;
            break;

          case 16:

            dwDesiredFormat = WAVE_FORMAT_4M16;
            break;

          default:

            bIsStandardFormat = FALSE;;
            break;
          }

        case 2:

          switch ( pWaveFormat->wBitsPerSample )
          {
          case 8:

            dwDesiredFormat = WAVE_FORMAT_4S08;
            break;

          case 16:

            dwDesiredFormat = WAVE_FORMAT_4S16;
            break;

          default:

            bIsStandardFormat = FALSE;;
            break;
          }

        default:

          bIsStandardFormat = FALSE;;
          break;
        }

        break;

      /****************************************************************/
      /*  The sample rate is not a standard value.                    */
      /****************************************************************/

      default:

        bIsStandardFormat = FALSE;;
        break;
      }

      break;

    case WAVE_FORMAT_08M08:

        if (( pWaveFormat->nSamplesPerSec == 8000 )
          && ( pWaveFormat->nChannels == 1 )
          && ( pWaveFormat->wBitsPerSample == 8 ))
        {
          dwDesiredFormat = WAVE_FORMAT_08M08;
        }
        else
        {
          bIsStandardFormat = FALSE;;
        }

        break;

    default:

      bIsStandardFormat = FALSE;;
      break;
    }

    if ( bIsStandardFormat )
    {
      /******************************************************************/
      /*  Get the wave output device capabilities.                      */
      /*  First allocate memory for the WAVEOUTCAPS structure.          */
      /******************************************************************/

      LOCK_MME_CALL(
        pWaveOutCaps = (LPWAVEOUTCAPS)ALLOCATE_SERVER_MEM(sizeof(WAVEOUTCAPS)))

      if ( pWaveOutCaps == NULL )
      {
        return MMSYSERR_NOMEM;
      }

      /******************************************************************/
      /*  Test for the supported format.                                */
      /******************************************************************/

      bGotDeviceID = FALSE;

      for ( uiDeviceID = 0;
            uiDeviceID <= uiNumberOfWaveOutDevices - 1;
            uiDeviceID++ )
      {
        LOCK_MME_CALL(
          mmStatus = waveOutGetDevCaps( uiDeviceID,
                                        pWaveOutCaps,
                                        sizeof(WAVEOUTCAPS)))
	 
        if ( mmStatus )
        {
          break;
        }

        if ( pWaveOutCaps->dwFormats == dwDesiredFormat )
        {
          bGotDeviceID = TRUE;
          pPlayAudio->uiSelectedDeviceID = uiDeviceID;
          break;
        }
      }

      /******************************************************************/
      /*  Free memory for the WAVEOUTCAPS structure.                    */
      /******************************************************************/

      LOCK_MME_CALL( FREE_SERVER_MEM( pWaveOutCaps ))
	  
      /******************************************************************/
      /*  If no device supported the format then return an error.       */
      /******************************************************************/
	  
      if ( ! bGotDeviceID )
      {
        mmStatus = MMSYSERR_NOTSUPPORTED;
      }
    }
    else
    {
      /******************************************************************/
      /*  A non standard format is requested and some devices are busy  */
      /*  so they cannot be queried. Exit with failure and inform the   */
      /*  application that some devices are allocated.                  */
      /******************************************************************/

      pPlayAudio->uiSelectedDeviceID = WAVE_MAPPER;

      mmStatus = MMSYSERR_NOTSUPPORTED;
    }
  }

  return mmStatus;
}

#ifdef USE_MME_SERVER

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Thread Main: MmeCallbackThreadMain                                */
/*  Author: Bill Hallahan                                             */
/*  Date: December 18, 1995                                           */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This thread is started by the PA_CreatePlayHandle()        */
/*    function. This thread processes MME callbacks for all "play     */
/*    audio" instances.                                               */
/*                                                                    */
/*                                                                    */
/*  Input: (Thread start parameter)                                   */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  CALLBACK_POLL_TIME_IN_MSEC  10

OP_THREAD_ROUTINE( MmeCallbackThreadMain, HPLAY_AUDIO_T pPlayAudio )
{
  /********************************************************************/
  /*  Check for MME server callbacks.                                 */
  /********************************************************************/

  while ( ! pShm_t->bGlobalMmeCallbackExit )
  {
    LOCK_MME_CALL( while ( mmeCheckForCallbacks())
                   {
                     mmeProcessCallbacks();
                   }
                 )

    OP_Sleep( CALLBACK_POLL_TIME_IN_MSEC );
  }

  OP_ExitThread( 0 );

  OP_THREAD_RETURN;
}

#endif

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
/*         This thread is started by the PA_CreatePlayHandle()        */
/*    function. If audio samples remain in the queue for too long a   */
/*    time and audio is not playing then this timer thread will send  */
/*    a message to start audio playing.                               */
/*                                                                    */
/*         If audio is playing then this thread will process          */
/*    synchronization marks. When all audio samples up to a           */
/*    synchronization mark have been played, a PA_SYNC_MARK message   */
/*    will be sent to the application.                                */
/*                                                                    */
/*                                                                    */
/*  Input: (Thread start parameter)                                   */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  TIMER_SLEEP_TIME_IN_MSEC          10
#define  QUEUE_FLOW_CHECK_TIME_IN_MSEC    100
#define  MAXIMUM_POSITION_SLEEP_TIME      100
#define  POSITION_COUNT_WRAP_TIME     1000000

OP_THREAD_ROUTINE( TimerThreadMain, HPLAY_AUDIO_T pPlayAudio )
{
  unsigned int uiAvgBytesPerSec;
  unsigned int uiFlowCheckTime;
  unsigned int uiLastQueueCount;
  unsigned int uiCurrentQueueCount;
  unsigned int uiStartupTimeoutTime;
  unsigned int uiElapsedTime;
  unsigned int uiWaitTime;
  BOOL	bDidBlock=FALSE;	//tek 28jan98 BATS 532 reduce CPU consumption
  DWORD dwSyncMarkPosition=0;
  DWORD dwCurrentPosition;
  MMRESULT mmStatus;
  ATYPE_T aSyncMarkTag;
  LPSYNC_MARK_T pSyncMark;
  LPSYNC_MARK_T pNextSyncMark;
  LPPLAY_RING_T pPlayAudioRing;

  /********************************************************************/
  /*  Initialize the timer count to 0. This is used to count the      */
  /*  number of consecutive times that audio is in the queue and the  */
  /*  audio device is not active.                                     */
  /********************************************************************/

  uiElapsedTime = 0;

  pPlayAudioRing = pPlayAudio->pPlayAudioRing;

  /********************************************************************/
  /*  Loop forever until thread shutdown time.                        */
  /********************************************************************/

  while( ! pPlayAudio->bTimerExit )
  {
    pPlayAudio->bTimerThreadReset = FALSE;
	bDidBlock = FALSE; //tek 28jan98 keep track when we block ourselves

    OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
    if (pPlayAudio->dwAudioDeviceCloseRequest == AUDIO_DEVICE_CLOSE_REQUESTED)
	{
	    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
		OP_WaitForEvent(pPlayAudio->hevAudioDeviceCloseRequestCancel,CLOSE_REQUEST_WAIT_TIME);
	    OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
		if (pPlayAudio->dwAudioDeviceCloseRequest == AUDIO_DEVICE_CLOSE_REQUESTED)
		{
			OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
			ClosePlayDevice(pPlayAudio);
			OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
			pPlayAudio->dwAudioDeviceCloseRequest = AUDIO_DEVICE_CLOSE_REQUEST_CANCELLED;
		}
		else
		{
			OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
			if (pPlayAudio->pPlayAudioRing->iQueueCount>0)
				StartAudioPlaying(pPlayAudio);
			OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
		}
	}
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );


    /******************************************************************/
    /******************************************************************/
    /*  If audio is playing then test to see if there are any         */
    /*  synchronization marks that need to be reported.               */
    /*  If there are then get the current "play audio" position.      */
    /******************************************************************/
    /******************************************************************/

    if (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
        && ( pPlayAudio->pSyncMarkList != NULL ))
    {
      /****************************************************************/
      /*  Get the current audio position.                             */
      /****************************************************************/

      mmStatus = PA_GetPosition( pPlayAudio,
                                 &dwCurrentPosition,
                                 FALSE );
      if ( mmStatus )
      {
#ifdef AUD_DEBUG
		OutputDebugString("TimerThreadMain: PA_GetPosition failed {1}\n");
#endif
        ReportStatusToApplication( pPlayAudio,
                                   PA_SYNC_ERROR,
                                   mmStatus );
      }
    }
    else
    {
      /****************************************************************/
      /*  In case the audio device becomes active between this if     */
      /*  statement and the following code (this will only happen     */
      /*  very infrequently) make sure that the current position      */
      /*  variable is less than any non-zero synchronization mark     */
      /*  position.                                                   */
      /****************************************************************/

      OP_LockMutex( pPlayAudio->hmxSynchronizationMarkList );

      if ( pPlayAudio->pSyncMarkList != NULL )
      {
        if ( pPlayAudio->pSyncMarkList->dwPosition == 0 )
        {
          dwCurrentPosition = 0;
        }
        else
        {
          dwCurrentPosition = pPlayAudio->pSyncMarkList->dwPosition - 1;
        }
      }

      OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );
    }

    /******************************************************************/
    /******************************************************************/
    /*  If audio is playing then loop while there are synchronization */
    /*  marks that need to be reported. Don't bother if the audio is  */
    /*  paused.                                                       */
    /******************************************************************/
    /******************************************************************/

    while (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
        && ( pPlayAudio->pSyncMarkList != NULL )
        && ( ! pPlayAudio->bPaused )
        && ( ! pPlayAudio->bTimerThreadReset ))
    {
      /****************************************************************/
      /*  See if the marked position has been encountered yet.        */
      /*  Synchonization mark information is protected by mutex's in  */
      /*  case the synchronization linked list is emptied when the    */
      /*  PA_Reset() function is called.                              */
      /****************************************************************/

      OP_LockMutex( pPlayAudio->hmxSynchronizationMarkList );

      pSyncMark = pPlayAudio->pSyncMarkList;

      if ( pSyncMark != NULL )
      {
        dwSyncMarkPosition = pSyncMark->dwPosition;
      }

      OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );

      /****************************************************************/
      /*  Tsst to see if the position counter has wrapped back to     */
      /*  zero. This will only happen after audio has been playing a  */
      /*  very long time. The marked position count and the current   */
      /*  position count can only differ by the time it takes to play */
      /*  all of the audio in the ring buffer. This is at most a few  */
      /*  seconds, even at the lowest supported sample rate. So if    */
      /*  the wait time is more than a few seconds then the position  */
      /*  count has wrapped and the synchronization mark should be    */
      /*  reported immediately.                                       */
      /****************************************************************/

      uiWaitTime = dwSyncMarkPosition - dwCurrentPosition;

      while (( dwCurrentPosition < dwSyncMarkPosition )
        && ( uiWaitTime < POSITION_COUNT_WRAP_TIME )
        && ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
        && ( pPlayAudio->pSyncMarkList != NULL )
        && ( ! pPlayAudio->bPaused )
        && ( ! pPlayAudio->bTimerThreadReset ))
      {
        if ( uiWaitTime > MAXIMUM_POSITION_SLEEP_TIME )
        {
          uiWaitTime = MAXIMUM_POSITION_SLEEP_TIME;
        }

        OP_Sleep( uiWaitTime );

        /**************************************************************/
        /*  Get the current audio position.                           */
        /**************************************************************/

        mmStatus = PA_GetPosition( pPlayAudio,
                                   &dwCurrentPosition,
                                   FALSE );

        if ( mmStatus )
        {
#ifdef AUD_DEBUG
		  OutputDebugString("TimerThreadMain: PA_GetPosition failed {2}\n");
#endif
          ReportStatusToApplication( pPlayAudio,
                                     PA_SYNC_ERROR,
                                     mmStatus );
        }
      }

      /****************************************************************/
      /*  Report the mark to the application.                         */
      /****************************************************************/

      OP_LockMutex( pPlayAudio->hmxSynchronizationMarkList );

      pSyncMark = pPlayAudio->pSyncMarkList;

      if (( pSyncMark != NULL )
        && (( dwCurrentPosition >= pSyncMark->dwPosition )
        || ( uiWaitTime >= POSITION_COUNT_WRAP_TIME ))
        && ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
        && ( ! pPlayAudio->bTimerThreadReset ))
      {
        /**************************************************************/
        /*  Remove the pointer to the next synchronization mark       */
        /*  structure from the top of the synchronization mark        */
        /*  linked list.                                              */
        /**************************************************************/

        aSyncMarkTag = pSyncMark->aTag;
        pNextSyncMark = pSyncMark->pLink;

        free( pSyncMark );

        pPlayAudio->pSyncMarkList = pNextSyncMark;

        OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );

        /**************************************************************/
        /*  Report the synchronization mark.                          */
        /**************************************************************/

        ReportStatusToApplication( pPlayAudio,
                                   PA_SYNC_MARK,
                                   aSyncMarkTag );
      }
      else
      {
        OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );
      }
    }

    /******************************************************************/
    /******************************************************************/
    /*  If audio is NOT playing and the system is NOT paused and      */
    /*  there are samples in the queue then test to see if it will    */
    /*  be necessary to start playing audio.                          */
    /******************************************************************/
    /******************************************************************/

    /******************************************************************/
    /*  Calculate how long to sleep.                                  */
    /******************************************************************/

		// 22may97 tek remove KSBs NEED_FOR_SPEED.
    OP_LockMutex( pPlayAudio->hmxWaveFormat );
    uiAvgBytesPerSec = pPlayAudio->pWaveFormat->nAvgBytesPerSec;
    OP_UnlockMutex( pPlayAudio->hmxWaveFormat );

    uiStartupTimeoutTime = (unsigned int)( 1000.0 *
      (double)(pPlayAudio->uiMinimumStartupBytes) /
        (double)uiAvgBytesPerSec );

    /******************************************************************/
    /*  Limit the total startup check wait time to 1 second.          */
    /******************************************************************/

    if ( uiStartupTimeoutTime > 1000 )
    {
      uiStartupTimeoutTime = 1000;
    }

    while (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
      && ( ! pPlayAudio->bPaused )
      && ( pPlayAudio->pPlayAudioRing->iQueueCount > 0 ))
    {
		// 22may97 tek remove KSBs NEED_FOR_SPEED.
      /****************************************************************/
      /*  Wait for "uiStartupTimeoutTime" milliseconds.               */
      /****************************************************************/

      uiElapsedTime = 0;
      uiFlowCheckTime = 0;
      uiLastQueueCount = pPlayAudioRing->iQueueCount;

      while (( uiElapsedTime < uiStartupTimeoutTime )
        && ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE ))
      {
        OP_Sleep( TIMER_SLEEP_TIME_IN_MSEC );

        uiElapsedTime += TIMER_SLEEP_TIME_IN_MSEC;
        uiFlowCheckTime += TIMER_SLEEP_TIME_IN_MSEC;

        /**************************************************************/
        /*  If the queue input flow rate to the PA_Queue() function   */
        /*  has been slower than real-time over the entire            */
        /*  QUEUE_FLOW_CHECK_TIME_IN_MSEC interval then start the     */
        /*  open now.                                                 */
        /**************************************************************/

        if ( uiFlowCheckTime > QUEUE_FLOW_CHECK_TIME_IN_MSEC )
        {
          uiCurrentQueueCount = (unsigned int)pPlayAudioRing->iQueueCount;

          if ( uiCurrentQueueCount == uiLastQueueCount )
          {
            break;
          }

          uiLastQueueCount = uiCurrentQueueCount;
          uiFlowCheckTime = 0;
        }
      }

      /****************************************************************/
      /*  If the audio device starts playing then exit this loop.     */
      /****************************************************************/

      if ( pPlayAudio->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE )
      {
        break;
      }

      /****************************************************************/
      /*  If audio is still NOT playing and there are samples in the  */
      /*  audio queue then start playing audio. It does not matter    */
      /*  that all of the tests this section of code are not          */
      /*  protected by mutex's. This is because an unnecessary        */
      /*  ID_Open_Wave_Output_Device messages will be discarded in    */
      /*  the "play audio" thread.                                    */
      /****************************************************************/

      if (( pPlayAudio->dwAudioDeviceState != AUDIO_DEVICE_ACTIVE )
        && ( pPlayAudioRing->iQueueCount > 0 ))
      {
        SendPlayAudioMessage( pPlayAudio,
                              ID_Open_Wave_Output_Device,
                              0L );
      }

      /****************************************************************/
      /*  Test for thread shutdown. Shutdown is caused by the         */
      /*  PA_DestroyPlayHandle() function.                            */
      /****************************************************************/

      if ( pPlayAudio->bTimerExit )
      {
        break;
      }
    }

    /******************************************************************/
    /*  This thread is blocked if there are no synchronization marks  */
    /*  waiting to be processed or the audio is paused and either     */
    /*  the audio device is active or the queue count is zero         */
    /******************************************************************/

	//tek 07nov97 bats508
	// as originally written, this code wants to take all the mutexes
	// involved; it really need not do that, because if we make a
	// mistake here we can always check before exit and fix it.
    OP_LockMutex( pPlayAudio->hmxSynchronizationMarkList );
    OP_LockMutex( pPlayAudio->hmxPauseFlag );

    if ((( pPlayAudio->pSyncMarkList == NULL )
      || ( pPlayAudio->bPaused ))
      && ( ! pPlayAudio->bTimerExit ))
    {
	  // let these go here.
      OP_UnlockMutex( pPlayAudio->hmxPauseFlag );
      OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );
      OP_LockMutex( pPlayAudio->hmxAudioDeviceState );
	  // tek 07nov97 bats508
	  // don't need to hold the queue count mutex this early; move
	  // it into the if branch
      //OP_LockMutex( pPlayAudio->hmxQueueCount );

      if ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
      {
        OP_ResetEvent( pPlayAudio->hevTimerThreadActive );
		bDidBlock = TRUE; // tek 29jan98
      }
      else
      {
      OP_LockMutex( pPlayAudio->hmxQueueCount );
        if ( pPlayAudioRing->iQueueCount == 0 )
        {
          OP_ResetEvent( pPlayAudio->hevTimerThreadActive );
		  bDidBlock = TRUE; // tek 29jan98
        }
	  // tek 07nov97 move this in closer
      OP_UnlockMutex( pPlayAudio->hmxQueueCount );
      }


      OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );
    }
	else
	{
		// tek 07nov97 gotta let these go..
    OP_UnlockMutex( pPlayAudio->hmxPauseFlag );
    OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );
	}

	// tek 07nov97 moved inside the if..
    //OP_UnlockMutex( pPlayAudio->hmxPauseFlag );
    //OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );


	// tek 07nov97 
	// now, after all that, it is (I suppose) possible that 
	// something happened that might cause us to not block;
	// we'll just check those cases here after the fact, and 
	// unblock ourselves.
	// tek 28jan98 be careful here, or we'll suck down all the CPU.
	if (bDidBlock)
	{
		if (   (pPlayAudio->pSyncMarkList != NULL )
				 ||(   (pPlayAudioRing->iQueueCount != 0 )
					&& (pPlayAudio->dwAudioDeviceState != AUDIO_DEVICE_ACTIVE)
				   )
		   )
		{
			OP_SetEvent( pPlayAudio->hevTimerThreadActive );
		}
	}

    /******************************************************************/
    /*  Wait for the thread to unblock.                               */
    /******************************************************************/

    OP_WaitForEvent( pPlayAudio->hevTimerThreadActive, OP_INFINITE );

    /******************************************************************/
    /*  Test for thread shutdown. Shutdown is caused by the           */
    /*  PA_DestroyPlayHandle() function.                              */
    /******************************************************************/

    if ( pPlayAudio->bTimerExit )
    {
      break;
    }
  }

  /********************************************************************/
  /*  Exit the thread.                                                */
  /********************************************************************/

  OP_ExitThread( 0 );

  OP_THREAD_RETURN;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Thread Main: PlayAudioThreadMain                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This is the message processing loop for the Audio window   */
/*    procedure.                                                      */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

OP_THREAD_ROUTINE( PlayAudioThreadMain, HPLAY_AUDIO_T pAudioHandle )
{
  unsigned int uiResult;
  unsigned int uiMessage;
  HPLAY_AUDIO_T pPlayAudio;
  ATYPE_T aParam;

  /********************************************************************/
  /*  Audio message loop.                                             */
  /********************************************************************/

  pShm_t->bGlobalPlayAudioThreadExit = FALSE;

  while( ! pShm_t->bGlobalPlayAudioThreadExit )
  {
    ReadMessageQueue( pShm_t->pGlobalPlayAudioMessageQueue,
                      (LPATYPE_T)&pPlayAudio,
                      (LPATYPE_T)&uiMessage,
                      &aParam );
    uiResult = PlayAudioProcedure( pPlayAudio, uiMessage, aParam );
    /******************************************************************/
    /*  If this is not a driver message then put result into the      */
    /*  report message queue.                                         */
    /******************************************************************/

    if  (( uiMessage != MM_WOM_OPEN )
      && ( uiMessage != MM_WOM_DONE )
      && ( uiMessage != MM_WOM_CLOSE ))
    {
      WriteMessageQueue( pShm_t->pGlobalReportMessageQueue,
                         (ATYPE_T)0,
                         (ATYPE_T)0,
                         (ATYPE_T)uiResult );
    }
  }
  
  /********************************************************************/
  /*  Exit the thread.                                                */
  /********************************************************************/
 
  OP_ExitThread( 0 );
  OP_THREAD_RETURN;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PlayAudioProcedure                                      */
/*  Author: Bill Hallahan                                             */
/*  Date: March 29, 1993                                              */
/*                                                                    */
/*  Audio Output "Play Audio" Procedure.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static ATYPE_T PlayAudioProcedure( HPLAY_AUDIO_T pPlayAudio,
                                   unsigned int uiMessage,
                                   ATYPE_T aParam )
{
  switch( uiMessage )
  {
  
  /********************************************************************/
  /*  The MM_WOM_OPEN message is received after the waveOutOpen()     */
  /*  function opens the waveform output device.                      */
  /********************************************************************/

  case MM_WOM_OPEN:
    return Process_MM_WOM_OPEN_Message( pPlayAudio, aParam );

  /********************************************************************/
  /*  The MM_WOM_DONE message is received when a buffer queued by the */
  /*  waveOutWrite() function has been played.                        */
  /********************************************************************/

  case MM_WOM_DONE:
    return Process_MM_WOM_DONE_Message( pPlayAudio, aParam );

  /********************************************************************/
  /*  The MM_WOM_CLOSE message is received when the waveOutClose()    */
  /*  function completes closing the waveform output device.          */
  /*  pPlayAudio->dwAudioDeviceState is set to                        */
  /*  AUDIO_DEVICE_INACTIVE in the                                    */
  /*  Process_Process_MM_WOM_DONE_Message() function after the call   */
  /*  to the waveOutClose() function.                                 */
  /********************************************************************/

  case MM_WOM_CLOSE:
    return Process_MM_WOM_CLOSE_Message( pPlayAudio );

  /********************************************************************/
  /*  This message is sent by the the PA_Queue() function or by the   */
  /*  timer thread, "TimerThreadMain()", to open the wave output      */
  /*  device.                                                         */
  /********************************************************************/

  case ID_Open_Wave_Output_Device:
    return ProcessOpenWaveOutputDeviceMessage( pPlayAudio );

  /********************************************************************/
  /*  An application uses this message to cancel audio output.        */
  /********************************************************************/

  case ID_Reset_Audio:
    return ProcessResetMessage( pPlayAudio );

  /********************************************************************/
  /*  An application uses this message to pause audio output.         */
  /********************************************************************/

  case ID_Pause_Audio:
    return ProcessPauseMessage( pPlayAudio );

  /********************************************************************/
  /*  An application uses this message to resume audio output.        */
  /********************************************************************/

  case ID_Resume_Audio:
    return ProcessResumeMessage( pPlayAudio );

  /********************************************************************/
  /*  An application uses this message to set audio parameters.       */
  /********************************************************************/

  case ID_Set_Audio_Format:
    return ProcessSetFormatMessage( pPlayAudio,
                                    (LPWAVEFORMATEX)aParam );

  /********************************************************************/
  /*  An application uses this message to get audio parameters.       */
  /********************************************************************/

  case ID_Get_Audio_Format:
    return ProcessGetFormatMessage( pPlayAudio,
                                    (LPWAVEFORMATEX)aParam );

  /********************************************************************/
  /*  An application uses this message to get the wave output device  */
  /*  volume.                                                         */
  /********************************************************************/

  case ID_Get_Audio_Volume:
    return ProcessGetVolumeMessage( pPlayAudio, (LPDWORD)aParam );

  /********************************************************************/
  /*  An application uses this message to set the wave output device  */
  /*  volume.                                                         */
  /********************************************************************/

  case ID_Set_Audio_Volume:
    return ProcessSetVolumeMessage( pPlayAudio, (DWORD)aParam );

  /********************************************************************/
  /*  An application uses this message to mark the current audio      */
  /*  position.                                                       */
  /********************************************************************/

  case ID_Synchronization_Mark:
    return ProcessSynchronizationMarkMessage( pPlayAudio, aParam );

  /********************************************************************/
  /*  An application uses this message to get the position of the     */
  /*  last sample played by the wave output device.                   */
  /********************************************************************/

  case ID_Get_Audio_Position:
    return ProcessGetPositionMessage( pPlayAudio, (LPDWORD)aParam );

  /********************************************************************/
  /*  The ID_Destroy_Message is used to shut down the audio thread.   */
  /********************************************************************/

  case ID_Destroy_Message:
    pShm_t->bGlobalPlayAudioThreadExit = TRUE;

    break;

  /********************************************************************/
  /*  Default message processing. This should never execute.          */
  /********************************************************************/

  default:

    break;
  }

  return 0;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    aParam        Currently unused.                                 */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static ATYPE_T Process_MM_WOM_OPEN_Message( HPLAY_AUDIO_T pPlayAudio,
                                            ATYPE_T aParam )
{
  unsigned int uiSelectedDeviceID;
  MMRESULT mmStatus;
#ifdef AUD_DEBUG //tek 13may97
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"ProcWOMOPEN: outstanding now %d at %08lu\n",
			  pPlayAudio->iOutstandingBuffers,timeGetTime());
		  OutputDebugString(szTemp);
		  if ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
		  {
			  sprintf(szTemp,"ProcWOMOPEN: PA_OWN_DEVICE is SET\n");
		  }
		  else
		  {
			  sprintf(szTemp,"ProcWOMOPEN: PA_OWN_DEVICE is NOT set\n");
		  }
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG

  /********************************************************************/
  /*  It is NOT possible that the selected device ID is equal to      */
  /*  WAVE_MAPPER because the DetermineDeviceID() function will have  */
  /*  already set the selected device ID. This legacy code provides   */
  /*  another check of the device ID in case a strange error occurs.  */
  /********************************************************************/

  if ( pPlayAudio->uiSelectedDeviceID == (unsigned int)WAVE_MAPPER )
  {
    LOCK_MME_CALL( waveOutGetID( pPlayAudio->hWaveOut,
                                 &uiSelectedDeviceID ))

    /******************************************************************/
    /*  Attempt to fix BUG in MARCH 1993 Beta version of Windows/NT.  */
    /*  If WAVE_MAPPER was the device ID when the waveOutOpen()       */
    /*  function was called and a valid hWaveOut is passed to the     */
    /*  waveOutGetID() function then it returns WAVE_MAPPER instead   */
    /*  of the device ID of the wave out device !                     */
    /*  If WAVE_MAPPER is used, then hope that the device ID is zero. */
    /******************************************************************/

    if ( uiSelectedDeviceID == (unsigned int)WAVE_MAPPER )
    {
      uiSelectedDeviceID = 0;
    }

    /******************************************************************/
    /*  Save the selected device ID in the handle.                    */
    /******************************************************************/

    OP_LockMutex( pPlayAudio->hmxSelectedDeviceID );
    pPlayAudio->uiSelectedDeviceID = uiSelectedDeviceID;
    OP_UnlockMutex( pPlayAudio->hmxSelectedDeviceID );

    /******************************************************************/
    /*  Set the dwDeviceSupport member of the play audio handle       */
    /*  pointed to by "pPlayAudio" to the dwSupport field of the      */
    /*  WAVEOUTCAPS structure. The device ID is specified by the      */
    /*  uiSelectedDeviceID field of the play audio handle.            */
    /******************************************************************/

    mmStatus = GetWaveOutDeviceCaps( pPlayAudio );

    if ( mmStatus )
    {
#ifdef AUD_DEBUG
		OutputDebugString("Process_MM_WOM_OPEN_Message: GetWaveOutDeviceCaps failed.\n");
#endif
		ReportStatusToApplication( pPlayAudio,
                                 PA_GET_CAPS_ERROR,
                                 mmStatus );
    }
  }

  /********************************************************************/
  /*  Start Audio Playing.                                            */
  /********************************************************************/

  StartAudioPlaying( pPlayAudio );

  return FALSE;
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
/*    handle pointed to by "pPlayAudio" to the dwSupport field of     */
/*    the WAVEOUTCAPS structure. The device ID is specified by the    */
/*    uiSelectedDeviceID field of The play audio handle.              */
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

static MMRESULT GetWaveOutDeviceCaps( HPLAY_AUDIO_T pPlayAudio )
{
  LPWAVEOUTCAPS pWaveOutCaps;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Get the wave output device capabilities.                        */
  /*  First allocate memory for the WAVEOUTCAPS structure.            */
  /********************************************************************/

  LOCK_MME_CALL(
    pWaveOutCaps = (LPWAVEOUTCAPS)ALLOCATE_SERVER_MEM(sizeof(WAVEOUTCAPS)))

  if ( pWaveOutCaps == NULL )
  {
    return MMSYSERR_NOMEM;
  }

  LOCK_MME_CALL(
    mmStatus = waveOutGetDevCaps( pPlayAudio->uiSelectedDeviceID,
                                  pWaveOutCaps,
                                  sizeof(WAVEOUTCAPS)))

  /********************************************************************/
  /*  Store the device capabilities in the handle.                    */
  /********************************************************************/

  pPlayAudio->dwDeviceSupport = pWaveOutCaps->dwSupport;

  /********************************************************************/
  /*  Free memory for the WAVEOUTCAPS structure.                      */
  /********************************************************************/

  LOCK_MME_CALL( FREE_SERVER_MEM( pWaveOutCaps ))

  return mmStatus;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void StartAudioPlaying( HPLAY_AUDIO_T pPlayAudio )
{
  unsigned int uiI;
  unsigned int uiQueueCount=0;
  unsigned int uiWriteLength=0;
  LPPLAY_RING_T pPlayAudioRing;
#ifdef __linux__
  struct timespec tv;
#endif

  /********************************************************************/
  /*  Get the Queue Count. If it changes between here and the end of  */
  /*  this function, that's OK.                                       */
  /********************************************************************/

  pPlayAudioRing = pPlayAudio->pPlayAudioRing;

  OP_LockMutex( pPlayAudio->hmxQueueCount );

#ifdef AUD_DEBUG //tek 13may97
  {
    char  szTemp[256]="";
    sprintf(szTemp,"SAP: state=%ld QCount=%d new=%d outstanding=%d at %lu\n",
	    pPlayAudio->dwAudioDeviceState,
	    pPlayAudioRing->iQueueCount,
	    uiQueueCount, 
	    pPlayAudio->iOutstandingBuffers,
	    timeGetTime()
	    );
    OutputDebugString(szTemp);
    if (uiQueueCount < (pPlayAudio->uiStartupWriteLength-1))
      {
	OutputDebugString("SAP: runt start packet?\n");
      }
    
  }
#endif //AUD_DEBUG
  
  uiQueueCount = (unsigned int)pPlayAudioRing->iQueueCount;
  // tek 06nov97 hold this mutex for the duration
  //OP_UnlockMutex( pPlayAudio->hmxQueueCount );

  /********************************************************************/
  /*  If the PA_Reset() function clears the audio queue just after    */
  /*  the waveOutOpen() function completes, then it is possible to    */
  /*  get here with no audio in the queue. In this case, close the    */
  /*  wave output device.                                             */
  /********************************************************************/

  if ( uiQueueCount == 0 )
  {
    ClosePlayDevice( pPlayAudio );
  }
  else
  {
	  // tek 13may97
	  // we can now be re-entered after audio is actually playing; 
	  // if we're using hte MME_SERVER we'll just bail out here, but
	  // if not then we need to correctly atempt to send more samples.
	  // we can tell if we're already running by the AudioDeviceState.

    if (pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE)
	{
#ifdef USE_MME_SERVER
	OP_UnlockMutex(pPlayAudio->hmxQueueCount);
		return;
#endif //USE_MME_SERVER
	}
	else // audio device is not active; do all the things we
		 // do on startup..
	{

    /******************************************************************/
    /*  Signal the application that we are starting to play audio.    */
    /*  Set a flag to indicate that a PA_PLAY_STOP message may be     */
    /*  sent. This flag is necessary in case the                      */
    /*  Process_MM_WOM_CLOSE() function is called after the audio     */
    /*  device is opened, but no audio is played (that is, the        */
    /*  ClosePlayDevice() function is called above. This can occur    */
    /*  if the timer thread and the PA_Queue() function both send     */
    /*  ID_Open_Wave_Output_Device messages in rapid succession.)     */
    /******************************************************************/

    ReportStatusToApplication( pPlayAudio,
                               PA_PLAY_START,
                               0 );

    pPlayAudio->bReportPlayStop = TRUE;

    /******************************************************************/
    /*  Set the Audio Device State to AUDIO_DEVICE_ACTIVE.            */
    /******************************************************************/

	// tek 07nov97 unfortunately, with the longer hold of the 
	// QueueCount mutex, this can deadlock with TimerThreadMain.
	// But, the audio device is not active, so we release the
	// mutex while we're doing this, and then take it back.
    OP_UnlockMutex( pPlayAudio->hmxQueueCount );
    OP_LockMutex( pPlayAudio->hmxAudioDeviceState );
    pPlayAudio->dwAudioDeviceState = AUDIO_DEVICE_ACTIVE;
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );
    OP_LockMutex( pPlayAudio->hmxQueueCount );

    /******************************************************************/
    /*  If the Audio Device State is NOT PA_OWN_DEVICE and the pause  */
    /*  flag is set then pause the wave output device. This is        */
    /*  necessary in case the pause message was received in between   */
    /*  the open wave out device message and the MM_WOM_OPEN message. */
    /******************************************************************/

    if ( ! ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
      && ( pPlayAudio->bPaused ))
    {
      LOCK_MME_CALL( waveOutPause( pPlayAudio->hWaveOut ))
    }

#ifdef USE_MME_SERVER

    /******************************************************************/
    /*  MME BUG WORKAROUND. Because the MME server currently does not */
    /*  return wave headers in the correct order, it is necessary to  */
    /*  put wave headers on a list whenever a wave header is written  */
    /*  by the waveOutWrite() function. This list is accessed in the  */
    /*  wave output callback routine to determine the current header. */
    /******************************************************************/

    pPlayAudio->uiWaveHdrWriteIndex = 0;
    pPlayAudio->uiWaveHdrReadIndex = 0;

#endif
	}

	// In case we got a reset without a resume...
	if (pPlayAudio->bResetPaused && !pPlayAudio->bPaused)
	{
		LOCK_MME_CALL( waveOutRestart( pPlayAudio->hWaveOut ))
	}

	// if there are samples outstanding, we have to recalculate the 
	// correct number of samples that are still waiting to go
	// hold this mutex up above.
	//OP_LockMutex( pPlayAudio->hmxQueueCount );
	// tek 06nov97 bats508 it is possible that ResetAudioQueue
	// came along and clobbered the queue. If so, we need to
	// gracefully bow out here..
	  if ( pPlayAudioRing->iQueueCount == 0 )
	  {
//		ClosePlayDeviceRequest( pPlayAudio );
		ClosePlayDevice( pPlayAudio );
		OP_UnlockMutex(pPlayAudio->hmxQueueCount);
#ifdef AUD_DEBUG
		{
		  char  szTemp[256]="";
		  sprintf(szTemp,"SAP: iQueueCount=0 abort at %lu\n",
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
		}
#endif //AUD_DEBUG 
		return;
	  }
	uiQueueCount = pPlayAudioRing->iQueueCount
					- pPlayAudio->iSamplesWaitingForCompletion;
	// hold the mutex so PROCWOMDONE won't collide..

#ifdef AUD_DEBUG
  {
    char  szTemp[256]="";
    sprintf(szTemp,"SAP: %d samples to write at %lu\n",
	    uiQueueCount,
	    timeGetTime()
	    );
    OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG 

    /******************************************************************/
    /*  If the number of samples in the queue is less than the        */
    /*  minimum samples to start playing audio then this is a flush   */
    /*  that was started by the timer thread (TimerThreadMain).       */
    /******************************************************************/
	// tek 13may97
	// this is no longer true. We can start up with less data if we're
	// being forced to speak.

    /******************************************************************/
    /*  Loop and write buffers to the wave output device.             */
    /******************************************************************/

    uiWriteLength = pPlayAudio->uiStartupWriteLength;

	// tek 13may97
	//// if we have less than the normal startup number of bytes, then
	//// try to split the buffer into at least two buffers.
	//
	//if (  (uiQueueCount < uiWriteLength)
	//	&&(uiQueueCount > 100) // but don't break up really tiny packets..
	//   )
	//{
	//	uiWriteLength = (uiQueueCount>>4)<<3; // div by two, 8-byte chunksize
	//}

    for ( uiI = 0;
          ( uiI < MAXIMUM_BUFFERS_QUEUED ) && ( uiQueueCount > 0 );
          uiI++ )
    {
      if ( uiWriteLength > uiQueueCount)
      {
        uiWriteLength = uiQueueCount;
      }
	  // tek 21nov97 make sure we don't leave a tiny buffer laying around to 
	  // be sent..
#if !defined NOWIN && defined UNDER_CE
	if (!pPlayAudio->bConvertToEightBit && (uiQueueCount & 0x01))
	{
		MessageBox(NULL, "Eight-Bit sample in 16-bit mode!", NULL, MB_OK);
	}
#endif
	  if (uiQueueCount < uiWriteLength+1000)
      {
		uiWriteLength = uiQueueCount;
#if !defined NOWIN && defined UNDER_CE
		if (!pPlayAudio->bConvertToEightBit && (uiQueueCount & 0x01))
		{
			MessageBox(NULL, "Eight-Bit sample in 16-bit mode!", NULL, MB_OK);
		}
#endif
        if (!pPlayAudio->bConvertToEightBit)	uiWriteLength = (uiQueueCount & 0xFFFFFFFE);		// Let's not send in a half-block

#ifdef __ipaq__
	uiWriteLength&=~0x03;
#endif
      }
	  // check to make sure that this is a free waveheader, and
	  // write it if it is. (tek 13may97)
	  if (pPlayAudio->ppWaveHdr[uiI]->lpData == NULL)
	  {

      uiQueueCount -= WriteBufferToWaveDevice( pPlayAudio,
                                               pPlayAudio->ppWaveHdr[uiI],
                                               uiWriteLength );
	  }
	  else
	  {
#ifdef AUD_DEBUG
		  {
		    char  szTemp[256]="";
		    sprintf(szTemp,"SAP: header %d (%08lx) is busy at %lu\n",
			    uiI,
			    pPlayAudio->ppWaveHdr[uiI],
			    timeGetTime()
			    );
		    OutputDebugString(szTemp);
		  }
#endif //AUD_DEBUG  
	  }
    }
  }
#ifdef AUD_DEBUG
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"SAP: exit at %lu\n",
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG  
  // finally release the mutex here.
  OP_UnlockMutex(pPlayAudio->hmxQueueCount);
	
#ifdef __linux__ 
//necessary for proper multithreading, this may be fixed in newer kernels
    tv.tv_sec=0;
    tv.tv_nsec=1;
    nanosleep(&tv,NULL);
    //usleep(1);
#endif

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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    aParam        aParam contains a pointer to the current          */
/*                  WAVEHDR structure.                                */
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

static ATYPE_T Process_MM_WOM_DONE_Message( HPLAY_AUDIO_T pPlayAudio,
                                            ATYPE_T aParam )
{
  int dwRemaining;
  unsigned int uiOldWriteLength;
  LPWAVEHDR pWaveHdr;
  LPPLAY_RING_T pPlayAudioRing;

#ifdef __linux__
  struct timespec tv;
#endif

  //tek 24jul97
  UINT	uiI=0;

  /********************************************************************/
  /*  Get the pointer to the wave header from the aParam of the       */
  /*  MM_WOM_DONE message and the pointer to the audio queue from the */
  /*  audio handle.                                                   */
  /********************************************************************/

  pWaveHdr = (LPWAVEHDR)aParam;

  /********************************************************************/
  /*  Get the number of samples previously written by the             */
  /*  waveOutWrite() function.                                        */
  /********************************************************************/

  uiOldWriteLength = (unsigned int)pWaveHdr->dwUser;

#ifdef __arm__
#ifndef __ipaq__
  if( pPlayAudio->bPipesNotEmpty )
    {
      //setpriority(PRIO_PROCESS, 0, 20);
      // OP_SetThreadPriority works better, why? 
      OP_SetThreadPriority( pShm_t->hGlobalPlayAudioThread, OP_PRIORITY_NORMAL );
      if ( (uiOldWriteLength<<5) > 50000 )
      	usleep(50000); // tek 13oct98 defer buffer processing
      else
      	usleep(uiOldWriteLength<<5);
      //ETT 10/13/98 this has to be just right other wise it will stutter worse
      //setpriority(PRIO_PROCESS, 0, -20);
      OP_SetThreadPriority( pShm_t->hGlobalPlayAudioThread, OP_PRIORITY_HIGHEST );
    }
#endif //__ipaq__
#endif //__arm__

  /********************************************************************/
  /*  Unprepare the old header.                                       */
  /********************************************************************/

#ifndef USE_MME_SERVER
  _ASSERTE(pWaveHdr->lpData != NULL); // tek 22jan99 make sure this isn't a bogus
									  // and/or idle header

  waveOutUnprepareHeader( pPlayAudio->hWaveOut,
                          pWaveHdr,
                          sizeof(WAVEHDR));
#endif
  // tek 06nov97 we have to take this mutex earlier to avoid collisions
  OP_LockMutex( pPlayAudio->hmxQueueCount );
  // tek 09may97
  pPlayAudio->iOutstandingBuffers--;  // keep track of these for debugging

  /********************************************************************/
  /*  Subtract number of samples just output from the samples waiting */
  /*  for completion count.                                           */
  /********************************************************************/

  pPlayAudio->iSamplesWaitingForCompletion -= uiOldWriteLength;
#ifdef AUD_DEBUG	//13may97 tek
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"ProcWOMDONE: %08lx; outst buffs now=%d; samp waiting=%dat %08lu\n",
			  pWaveHdr,
			  pPlayAudio->iOutstandingBuffers,
			  pPlayAudio->iSamplesWaitingForCompletion,
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG

  /********************************************************************/
  /*  Do if the audio state isn't equal to AUDIO_STATE_PLAY then it   */
  /*  is equal to AUDIO_STATE_RESET.                                  */
  /********************************************************************/

  if ( pPlayAudio->dwAudioPlayState == AUDIO_STATE_PLAY )
  {
    /******************************************************************/
    /*  Subtract the number of samples from the queue count.          */
    /******************************************************************/

    pPlayAudioRing = pPlayAudio->pPlayAudioRing;

	// tek 06nov97 (during bats508) hold this earlier (above).
    //OP_LockMutex( pPlayAudio->hmxQueueCount );
    pPlayAudioRing->iQueueCount -= (int)uiOldWriteLength;
#ifdef AUD_DEBUG // tek 13may97
  {
    char  szTemp[256]="";
    sprintf(szTemp,"ProcWOMDONE: iQueueCount=%ld\n",
	    pPlayAudioRing->iQueueCount);
    OutputDebugString(szTemp);
    
    if (pPlayAudioRing->iQueueCount < 0)
      {
	sprintf(szTemp,"ProcWOMDONE: iQueueCount is negative? %d at %08lu\n",
		pPlayAudioRing->iQueueCount,
		timeGetTime()
		);
	OutputDebugString(szTemp);
      }
  }
#endif //AUD_DEBUG

    // tek 06nov97 this is now part of the larger mutex range
    //OP_UnlockMutex( pPlayAudio->hmxQueueCount );

    /******************************************************************/
    /*  Also update the "Bytes Played" count.                         */
    /******************************************************************/

    OP_LockMutex( pPlayAudio->hmxBytesPlayed );
    pPlayAudio->dwBytesPlayed += (DWORD)uiOldWriteLength;
    OP_UnlockMutex( pPlayAudio->hmxBytesPlayed );

    /******************************************************************/
    /*  If there are no samples waiting for completion then there     */
    /*  are no more buffers queued by the waveOutWrite() function.    */
    /*  In this case release the wave output device by calling the    */
    /*  waveOutClose() function. If there are more samples in the     */
    /*  audio queue then a restart will eventually occur.             */
    /******************************************************************/

	// tek 13may97
	// this was a check on ( pPlayAudio->iSamplesWaitingForCompletion <= 0 )
	// but I don't think that is quite correct; we could have no 
	// samples waiting for completion (in the queue, but sent to the 
	// device) but still have samples that haven't been sent yet. 
	// if there are any samples left in the queue after the above update,
	// then either we still have buffers at the device OR we have
	// samples that have not yet been sent to the device.

    if ( pPlayAudioRing->iQueueCount <= 0 ) //tek 13may97
    {

#ifdef AUD_DEBUG  //tek 13may97
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"ProcWOMDONE: Closing. iQueueCount=%ld\n",
					pPlayAudioRing->iQueueCount);
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG
		// because we're done with this waveheader, clear the lpData field
		// so that we can reuse it later.. 
		pWaveHdr->lpData = NULL;
//      ClosePlayDeviceRequest( pPlayAudio );
      ClosePlayDevice( pPlayAudio );
    }
    else
    {
      /****************************************************************/
      /*  Determine the number of unwritten samples remaining in the  */
      /*  audio queue. Protect the Queue Count.                       */
      /****************************************************************/
	  // tek 16may97
	  // we need to hold the mutex while we do the buffer write, else 
	  // StartAudioPlaying may collide with this and write the same
	  // thing twice.
	  // tek 06nov97 this is now part of the larger mutex range
      //OP_LockMutex( pPlayAudio->hmxQueueCount );
      dwRemaining = pPlayAudioRing->iQueueCount -
                     pPlayAudio->iSamplesWaitingForCompletion;
#ifdef AUD_DEBUG  //tek 13may97
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"ProcWOMDONE: dwRemaining=%ld\n",
					dwRemaining);
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG

      /****************************************************************/
      /*  If there are any samples remaining in the audio queue then  */
      /*  write up as many samples as the WriteBufferToWaveDevice()   */
      /*  function allows.                                            */
      /****************************************************************/

      if ( dwRemaining > 0 )
      {
        /**************************************************************/
        /*  Write the next buffer to the output device.               */
        /**************************************************************/	
		// tek 24jul97 in the presence of SYNCs, we can end up with 
		// only a single buffer outstanding. To correct this, we'll try 
		// to write several buffers if we don't have all of them outstanding
		UINT uiWriteSize = dwRemaining;

		if (pPlayAudio->iOutstandingBuffers < MAXIMUM_BUFFERS_QUEUED-2)
		{
#ifndef UNDER_CE // tek 23mar99 write fewer, larger buffers for CE
			if (pPlayAudio->iOutstandingBuffers < MAXIMUM_BUFFERS_QUEUED-3)
			{
				uiWriteSize = dwRemaining>>2; // try to write 4
			}
			else
#endif //UNDER_CE
			{
				uiWriteSize = dwRemaining>>1; // try to write 2
			}
			// but don't write too little
			// (make sure that we don't leave a tiny amount behind..)
			if (uiWriteSize < MINIMUM_STARTUP_WRITE_SIZE)
				uiWriteSize = dwRemaining;
			// 015	MGS		12/15/1998	Fixed odd byte problem to audio device and BATS #844
			uiWriteSize &= ~0x01;

		}
#ifdef UNDER_CE
		if (!pPlayAudio->bConvertToEightBit)	uiWriteSize &= 0xFFFFFFFE;		// Let's not send in a half-block
#endif
#ifdef __ipaq__
	uiWriteSize&=~0x03;
#endif

        dwRemaining -= WriteBufferToWaveDevice( pPlayAudio,
                                 pWaveHdr,
                                 (unsigned int)uiWriteSize );

		// now, go find a free header to write what's left. This 
		// loop is copied from StartAudioPlaying.
		for ( uiI = 0;
			  ( uiI < MAXIMUM_BUFFERS_QUEUED ) && ( dwRemaining > 0 ) && (pPlayAudio->iOutstandingBuffers < MAXIMUM_BUFFERS_QUEUED) ;
			  uiI++ )
		{
		  if ( uiWriteSize > (unsigned int) dwRemaining) // NAL warning removal
		  {
			uiWriteSize = dwRemaining;
		  }
		  // check to make sure that this is a free waveheader, and
		  // write it if it is. (tek 13may97)
		  if (pPlayAudio->ppWaveHdr[uiI]->lpData == NULL)
		  {
#ifdef AUD_DEBUG
		    {
		      char  szTemp[256]="";
		      sprintf(szTemp,"ProcWOMDONE: dwRemaining=%ld, uiWriteLength=%d, using header %d (%08lx) at %lu\n",
			      dwRemaining,
			      uiWriteSize,
			      uiI,
			      pPlayAudio->ppWaveHdr[uiI],
			      timeGetTime()
			      );
		      OutputDebugString(szTemp);
		    }
#endif //AUD_DEBUG  
		    
#ifdef UNDER_CE
		    if (!pPlayAudio->bConvertToEightBit)	uiWriteSize &= 0xFFFFFFFE;		// Let's not send in a half-block
#endif
#ifdef __ipaq__
	uiWriteSize&=0x03;
#endif
		    
		    dwRemaining -= WriteBufferToWaveDevice( pPlayAudio,
												   pPlayAudio->ppWaveHdr[uiI],
												   uiWriteSize );
		  // don't leave a runt around..
		  if (dwRemaining - uiWriteSize < MINIMUM_STARTUP_WRITE_SIZE)
				uiWriteSize = dwRemaining;

		  }
		  else
		  {
#ifdef AUD_DEBUG
			  {
					  char  szTemp[256]="";
					  sprintf(szTemp,"ProcWOMDONE: header %d (%08lx) is busy at %lu\n",
						  uiI,
						  pPlayAudio->ppWaveHdr[uiI],
						  timeGetTime()
						  );
					  OutputDebugString(szTemp);
			  }
#endif //AUD_DEBUG  
		  }
		}
		
      }
	  else //tek 13may97 if we're done with the header, null the 
		   // lpData field so we know it is free.
	  {
		  pWaveHdr->lpData = NULL;
	  }
	  // tek 06nov97 move this out of this branch
      //OP_UnlockMutex( pPlayAudio->hmxQueueCount );

    }
  }
  else
  {
	  // tek 13may97 in any event, we're done with this header..
	  pWaveHdr->lpData = NULL;
    /******************************************************************/
    /*  The audio state is equal to AUDIO_STATE_RESET. In reset mode  */
    /*  the queue count has already been set to zero. If there are no */
    /*  samples playing then signal that the reset is complete.       */
    /******************************************************************/

    if ( pPlayAudio->iSamplesWaitingForCompletion <= 0 )
    {
      pPlayAudio->dwAudioPlayState = AUDIO_STATE_PLAY;

//      ClosePlayDeviceRequest( pPlayAudio );
      ClosePlayDevice( pPlayAudio );

      OP_SetEvent( pPlayAudio->hevResetComplete );
    }
  }

  /********************************************************************/
  /*  Signal that the Queue is not full.                              */
  /********************************************************************/

  OP_SetEvent( pPlayAudio->hevQueueNotFull );
  //tek 06nov97 finally release the mutex here.
  OP_UnlockMutex( pPlayAudio->hmxQueueCount );
#ifdef __linux__ 
//necessary for proper multithreading, this may be fixed in newer kernels
  tv.tv_sec=0;
  tv.tv_nsec=1;
  nanosleep(&tv,NULL);
  //usleep(1);
#endif
  return FALSE;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static ATYPE_T Process_MM_WOM_CLOSE_Message( HPLAY_AUDIO_T pPlayAudio )
{
#ifdef AUD_DEBUG	 // tek 13may97
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"ProcWOMCLOSE: outstanding now %d at %08lu\n",
			  pPlayAudio->iOutstandingBuffers,
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG
  /********************************************************************/
  /*  If the audio device is not owned then clear the handle now.     */
  /********************************************************************/

  if (( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE ) == 0 )
  {
    pPlayAudio->hWaveOut = (int)NULL;
  }

  /********************************************************************/
  /*  Set the audio device state and unblock the timer thread.        */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxAudioDeviceState );
  pPlayAudio->dwAudioDeviceState = AUDIO_DEVICE_INACTIVE;
  OP_SetEvent( pPlayAudio->hevTimerThreadActive );
  OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );

  /********************************************************************/
  /*  Unblock the PA_WaitForPlayToComplete() function.                */
  /********************************************************************/

  OP_SetEvent( pPlayAudio->hevAudioDeviceInactive );

  /********************************************************************/
  /*  Signal the application that the audio has stopped.              */
  /********************************************************************/

  if ( pPlayAudio->bReportPlayStop )
  {
    ReportStatusToApplication( pPlayAudio,
                               PA_PLAY_STOP,
                               0 );

    pPlayAudio->bReportPlayStop = FALSE;
  }

  return FALSE;
}
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ClosePlayDeviceRequest                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: August 19, 1993                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sends a message to the timer thread to       */
/*    close the audio device.  The timer thread will hold the audio   */
/*    device opened for about 1 second and then close it, or if more  */
/*    audio is queued before 1 second, it will leave the device       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void ClosePlayDeviceRequest( HPLAY_AUDIO_T pPlayAudio )
{

  /********************************************************************/
  /*  If the user owns the audio device then just perform the same    */
  /*  processing that receiving a MM_WOM_CLOSE message would cause.   */
  /*  Otherwise call the waveOutClose() function to release the wave  */
  /*  output device. This will cause the wave device driver to send   */
  /*  an MM_WOM_CLOSE message when the wave output device is          */
  /*  released. At that time the Audio Device State will be set to    */
  /*  AUDIO_DEVICE_INACTIVE.                                          */
  /********************************************************************/

  if ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
  {
    ClosePlayDevice( pPlayAudio );
  }
  else
  {
    OP_LockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
    pPlayAudio->dwAudioDeviceCloseRequest = AUDIO_DEVICE_CLOSE_REQUESTED;
	OP_ResetEvent(pPlayAudio->hevAudioDeviceCloseRequestCancel);
	// Wake up the timer thread so it can handle the request.
    OP_SetEvent( pPlayAudio->hevTimerThreadActive );
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceCloseRequest );
  }

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ClosePlayDevice                                         */
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void ClosePlayDevice( HPLAY_AUDIO_T pPlayAudio )
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

  if ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
  {
    Process_MM_WOM_CLOSE_Message( pPlayAudio );
  }
  else
  {
    OP_LockMutex( pPlayAudio->hmxAudioDeviceState );
    pPlayAudio->dwAudioDeviceState = AUDIO_DEVICE_SHUTTING_DOWN;
    OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );

#ifdef WIN32
	OP_Sleep(1);
#endif

    AudioPosition( pPlayAudio, &dwPosition );

    pPlayAudio->dwPositionBase += dwPosition;
	// MGS  The audio device seems to be lying when it says that is is done playing.
	// the last bit of audio doesn't seem to be played even when the audio position
	// is at the end of the data sent.  The Sleep(1) seems to fix this problem.

    LOCK_MME_CALL( waveOutClose( pPlayAudio->hWaveOut ))
	pPlayAudio->bResetPaused = FALSE;
	/* wake up the timer thread just in case */
	OP_SetEvent(pPlayAudio->hevTimerThreadActive);

  }

  return;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    pWaveHdr      A pointer to a WAVEHDR structure.                 */
/*                                                                    */
/*    uiLength      The number of byte samples.                       */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*     This function returns a the number of samples written to the   */
/*     wave output device.                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static unsigned int WriteBufferToWaveDevice( HPLAY_AUDIO_T pPlayAudio,
                                             LPWAVEHDR pWaveHdr,
                                             unsigned int uiLength )
{
  extern const int int_volume_table; 
  unsigned int uiI;
  int iNumberToMoveToQueueTop;
  unsigned int uiWriteLength;
  short * pWordSource;
  LPAUDIO_T pByteDest;
  LPPLAY_RING_T pPlayAudioRing;
  MMRESULT mmStatus;
//  int vol_att;

#ifdef AUD_DEBUG  //tek 13may97
  {
		  char  szTemp[256]="";
		  pPlayAudioRing = pPlayAudio->pPlayAudioRing;
		  sprintf(szTemp,"WBTWOD size=%d at %08lx; out=%d; waiting=%d qcount=%d at %08lu\n",
			  uiLength, 
			  pWaveHdr,
			  pPlayAudio->iOutstandingBuffers, 
			  pPlayAudio->iSamplesWaitingForCompletion,
			  pPlayAudioRing->iQueueCount,
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG

  /********************************************************************/
  /*  Limit the length to be written.                                 */
  /********************************************************************/

  if ( uiLength > pPlayAudio->uiMaximumWriteLength )
  {
    uiLength = pPlayAudio->uiMaximumWriteLength;
  }

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

  pPlayAudioRing = pPlayAudio->pPlayAudioRing;

  if ( pPlayAudioRing->iOutputPosition + (int)uiLength
                                    > pPlayAudioRing->iQueueLength )
  {
    /******************************************************************/
    /*  Move samples to the top of the queue.                         */
    /******************************************************************/

    iNumberToMoveToQueueTop =
      pPlayAudioRing->iQueueLength - pPlayAudioRing->iOutputPosition;

    /******************************************************************/
    /*  pByteSource = pPlayAudioRing->pQueueOutput;                   */
    /*  pByteDest =                                                   */
    /*    pPlayAudioRing->pQueueStart - iNumberToMoveToQueueTop;      */
    /*                                                                */
    /*  for ( uiI = 0; uiI < iNumberToMoveToQueueTop; uiI++ )         */
    /*    *pByteDest++ = *pByteSource++;                              */
    /******************************************************************/

    memcpy( pPlayAudioRing->pQueueStart - iNumberToMoveToQueueTop,
            pPlayAudioRing->pQueueOutput,
            iNumberToMoveToQueueTop );

    pPlayAudioRing->pQueueOutput =
      pPlayAudioRing->pQueueStart - iNumberToMoveToQueueTop;
    pPlayAudioRing->iOutputPosition = - iNumberToMoveToQueueTop;
  }

  /********************************************************************/
  /*  If the waveOutOpen() function has opened a device that requires */
  /*  8 bit samples and 16 bit samples were queued, then convert the  */
  /*  samples to 8 bits here.                                         */
  /********************************************************************/

#ifdef VOLUME_MOVED_TO_VTM
  if ((((LPTTS_HANDLE_T)(pPlayAudio->aInstance))->pKernelShareData->vol_att)!=100)
	{
		vol_att=int_volume_table[(((LPTTS_HANDLE_T)(pPlayAudio->aInstance))->pKernelShareData->vol_att)];
		pWordSource=(short *)pPlayAudioRing->pQueueOutput;


		for (uiI=0;uiI<uiLength ;uiI+=2)
		{
			*pWordSource=(short)((vol_att * (int)(*pWordSource)) >> 15);
			pWordSource++;
		}
	}
#endif

  if ( pPlayAudio->bConvertToEightBit )
  {
    pByteDest = pPlayAudioRing->pQueueOutput;
    pWordSource = (short *)pByteDest;

    for ( uiI = 0; uiI < uiLength; uiI+=2 )
      *pByteDest++ = (unsigned char)((*pWordSource++) >> 8 ) ^ 0x80;

    uiWriteLength = uiLength >> 1;
  }
  else
  {
    uiWriteLength = uiLength;
  }

  /********************************************************************/
  /*  Set up the WAVEHDR structure.                                   */
  /*  Save the buffer length in the high 16 bits of the dwUser        */
  /*  element of the wave header.                                     */
  /********************************************************************/

  if (!pPlayAudio->bConvertToEightBit && uiWriteLength & 0x01) {


	  return uiWriteLength;			// Throw away the packet!!!
  }

#ifdef __ipaq__
	uiWriteLength&=~0x03;
#endif
  pWaveHdr->lpData          = (char *)pPlayAudioRing->pQueueOutput;
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

#ifndef USE_MME_SERVER

  mmStatus = waveOutPrepareHeader( pPlayAudio->hWaveOut,
                                   pWaveHdr,
                                   sizeof(WAVEHDR));

  if ( mmStatus != MMSYSERR_NOERROR )
  {
#ifdef AUD_DEBUG
	  OutputDebugString("WriteBufferToWaveDevice: waveOutPrepareHeader failed.\n");
#endif
	  ReportStatusToApplication( pPlayAudio,
                               PA_WRITE_ERROR,
                               mmStatus );
    return 0;
  }

#endif

  /********************************************************************/
  /*  Write the buffer to the wave output device.                     */
  /********************************************************************/

  LOCK_MME_CALL( mmStatus = waveOutWrite( pPlayAudio->hWaveOut,
                                          pWaveHdr,
                                          sizeof(WAVEHDR)))

  if ( mmStatus == MMSYSERR_NOERROR )
  {
	  // tek 09may97
	  pPlayAudio->iOutstandingBuffers++;// keep track..
#ifdef USE_MME_SERVER

    /******************************************************************/
    /*  MME BUG WORKAROUND. Because the MME server currently does not */
    /*  return wave headers in the correct order, it is necessary to  */
    /*  put wave headers on a list whenever a wave header is written  */
    /*  by the waveOutWrite() function. This list is accessed in the  */
    /*  wave output callback routine to determine the current header. */
    /******************************************************************/

    pPlayAudio->ppWaveHdrInUseList[pPlayAudio->uiWaveHdrWriteIndex] = pWaveHdr;

    pPlayAudio->uiWaveHdrWriteIndex++;

    if ( pPlayAudio->uiWaveHdrWriteIndex >= MAXIMUM_BUFFERS_QUEUED )
    {
      pPlayAudio->uiWaveHdrWriteIndex = 0;
    }

#endif

    /******************************************************************/
    /*  Update the output pointers and the "samples waiting" count.   */
    /******************************************************************/

    pPlayAudio->iSamplesWaitingForCompletion += uiLength;
    pPlayAudioRing->pQueueOutput += uiLength;
    pPlayAudioRing->iOutputPosition += uiLength;
  }
  else
  {
    /******************************************************************/
    /*  Report any errors that occured.                               */
    /******************************************************************/
#ifdef AUD_DEBUG
	OutputDebugString("WriteBufferToWaveDevice: waveOutWrite failed.\n");
#endif
    ReportStatusToApplication( pPlayAudio,
                               PA_WRITE_ERROR,
                               mmStatus );
    return 0;
  }

  return uiLength;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*   Output:                                                          */
/*                                                                    */
/*    This function returns a value of FALSE.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static ATYPE_T ProcessOpenWaveOutputDeviceMessage( HPLAY_AUDIO_T pPlayAudio )
{
  /********************************************************************/
  /*  If the wave output device is not closed then abort.             */
  /*  This check is necessary because the PA_Queue() function and     */
  /*  the Timer thread might send both the ID_Open_Wave_Output_Device */
  /*  message before either occurence of the message can be processed */
  /*  Also abort if the pause flag is set.                            */
  /********************************************************************/

  if (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_INACTIVE )
    && ( ! pPlayAudio->bPaused ))
  {
    /******************************************************************/
    /*  IF the wave output device is owned by the application and     */
    /*     the wave output device is already opened,                  */
    /*  THEN                                                          */
    /*    There will be no MM_WOM_OPEN message generated so start     */
    /*    audio playing right now.                                    */
    /*  ELSE                                                          */
    /*    Open the wave audio device.                                 */
    /*    The Process_MM_WOM_OPEN_Message function will start audio   */
    /*    playing later.                                              */
    /******************************************************************/

    if (( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
      && ( pPlayAudio->hWaveOut != (int)NULL ))
    {
      /****************************************************************/
      /*  Block the PA_WaitForPlayToComplete() function.              */
      /****************************************************************/

      OP_ResetEvent( pPlayAudio->hevAudioDeviceInactive );

      /****************************************************************/
      /*  Set the device state.                                       */
      /****************************************************************/

	  // tek 16mar98 we should never set the device state, because 
	  // StartAudioPlaying manages that..! (bats622)
      //OP_LockMutex( pPlayAudio->hmxAudioDeviceState );
      //pPlayAudio->dwAudioDeviceState = AUDIO_DEVICE_ACTIVE;
      //OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );

      StartAudioPlaying( pPlayAudio );
    }
    else
    {
      if ( OpenWaveOutputDevice( pPlayAudio ) == MMSYSERR_NOERROR )
      {
        /**************************************************************/
        /*  Block the PA_WaitForPlayToComplete() function.            */
        /**************************************************************/

        OP_ResetEvent( pPlayAudio->hevAudioDeviceInactive );

        /**************************************************************/
        /*  Set the device state.                                     */
        /**************************************************************/

        OP_LockMutex( pPlayAudio->hmxAudioDeviceState );
        pPlayAudio->dwAudioDeviceState = AUDIO_DEVICE_STARTING_UP;
        OP_UnlockMutex( pPlayAudio->hmxAudioDeviceState );
      }
    }
  }

  return FALSE;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*   Output:                                                          */
/*                                                                    */
/*     This function returns a status code of type MMRESULT.          */
/*     This value is zero if the write was successful.                */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT OpenWaveOutputDevice( HPLAY_AUDIO_T pPlayAudio )
{
  DWORD dwSampleRate=0;
  DWORD dwNumberOfChannels=0;
  DWORD dwBytesPerSample=0;
  DWORD dwOpenFlags=0;
  LPWAVEFORMATEX pWaveFormat;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  The default state is no sample conversion.                      */
  /********************************************************************/

  pPlayAudio->bConvertToEightBit = FALSE;

  /********************************************************************/
  /*  Initialize the local WAVEFORMATEX structure.                    */
  /********************************************************************/

  pWaveFormat = pPlayAudio->pWaveFormat;

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
#ifdef __ipaq__
    pWaveFormat->nBlockAlign =
      (WORD)( dwNumberOfChannels * dwBytesPerSample * 2 );
#else
    pWaveFormat->nBlockAlign =
      (WORD)( dwNumberOfChannels * dwBytesPerSample );
#endif
    pWaveFormat->cbSize = 0;

  }

  /********************************************************************/
  /*  Set the wave out device open flags.                             */
  /********************************************************************/

  dwOpenFlags = CALLBACK_FUNCTION;
  
#ifdef USE_MME_SERVER

  /********************************************************************/
  /*  If the WAVE_OPEN_SHARE bit is set in the device options then    */
  /*  enable device sharing.                                          */
  /********************************************************************/

  if ( pPlayAudio->dwDeviceOptions & WAVE_OPEN_SHAREABLE )
  {
    dwOpenFlags |= WAVE_OPEN_SHAREABLE;
  }

#endif

  /********************************************************************/
  /*  Attempt to open the wave output device.                         */
  /********************************************************************/
#ifdef AUD_DEBUG
  OutputDebugString("OpenWaveOutputDevice: waveOutOpen() {1}\n");
#endif

#ifdef OS_SIXTY_FOUR_BIT
 
  LOCK_MME_CALL(
    mmStatus = waveOutOpen( &(pPlayAudio->hWaveOut),
                            pPlayAudio->uiSelectedDeviceID,
                            (LPWAVEFORMAT)pWaveFormat,
                            WaveOutCallbackRoutine,
                            pPlayAudio->uiHandleListIndex,
                            dwOpenFlags ))
#else
 
  LOCK_MME_CALL(
    mmStatus = waveOutOpen( &(pPlayAudio->hWaveOut),
                            pPlayAudio->uiSelectedDeviceID,
                            (LPWAVEFORMATEX)pWaveFormat,
                            (DWORD)WaveOutCallbackRoutine,
                            (DWORD)pPlayAudio,
                            dwOpenFlags ))
#endif

#ifdef USE_MME_SERVER

  /********************************************************************/
  /*  THIS IS PROBABLY NOT NECESSARY, BUT IT CANNOT HURT.             */
  /*  The MME servers waveOutOpen() function returns a value of       */
  /*  WAVERR_DEVICESHAREABLE if the device is shareable. Change       */
  /*  this to MMSYSERR_NOERROR.                                       */
  /********************************************************************/

  if (( pPlayAudio->dwDeviceOptions & WAVE_OPEN_SHAREABLE )
    && ( mmStatus == WAVERR_DEVICESHAREABLE ))
  {
    mmStatus = MMSYSERR_NOERROR;
  }

#endif

  /********************************************************************/
  /*  If the requested wave output format is WAVE_FORMAT_PCM and the  */
  /*  number of bits per sample is 16 and the format is not supported */
  /*  then try to open the wave output device for 8 bit samples.      */
  /********************************************************************/

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
#ifdef AUD_DEBUG
    OutputDebugString("OpenWaveOutputDevice: waveOutOpen() {2}\n");
#endif

#ifdef OS_SIXTY_FOUR_BIT

    LOCK_MME_CALL(
      mmStatus = waveOutOpen( &(pPlayAudio->hWaveOut),
                              pPlayAudio->uiSelectedDeviceID,
                              (LPWAVEFORMAT)pWaveFormat,
                              WaveOutCallbackRoutine,
                              pPlayAudio->uiHandleListIndex,
                              dwOpenFlags ))
#else

    LOCK_MME_CALL(
      mmStatus = waveOutOpen( &(pPlayAudio->hWaveOut),
                              pPlayAudio->uiSelectedDeviceID,
                              (LPWAVEFORMATEX)pWaveFormat,
                              (DWORD)WaveOutCallbackRoutine,
                              (DWORD)pPlayAudio,
                              dwOpenFlags ))
#endif

#ifdef USE_MME_SERVER

    /******************************************************************/
    /*  THIS IS PROBABLY NOT NECESSARY, BUT IT CANNOT HURT.           */
    /*  The MME servers waveOutOpen() function returns a value of     */
    /*  WAVERR_DEVICESHAREABLE if the device is shareable. Change     */
    /*  this to MMSYSERR_NOERROR.                                     */
    /******************************************************************/

    if (( pPlayAudio->dwDeviceOptions & WAVE_OPEN_SHAREABLE )
      && ( mmStatus == WAVERR_DEVICESHAREABLE ))
    {
      mmStatus = MMSYSERR_NOERROR;
    }

#endif

    /******************************************************************/
    /*  Reset the WAVEFORMATEX structure elements for 16 bit data.    */
    /******************************************************************/

    pWaveFormat->nAvgBytesPerSec =
      dwSampleRate * dwNumberOfChannels << 1;
    pWaveFormat->nBlockAlign = (WORD)( dwNumberOfChannels << 1 );
    pWaveFormat->wBitsPerSample = 16;

    pPlayAudio->bConvertToEightBit = TRUE;
  }

  /********************************************************************/
  /*  Test for an open error.                                         */
  /********************************************************************/

  if ( mmStatus )
  {
    /******************************************************************/
    /*  The error that occured WAS caused by another application      */
    /*  owning the wave output device.                                */
    /******************************************************************/
#ifdef AUD_DEBUG
	  {
#include <stdio.h>
		  char szTemp[256]="";
		  sprintf(szTemp,"OpenWaveOutputDevice: waveOutOpen failed: status=%lu (%08lx)\n",
			  mmStatus, mmStatus);
		  OutputDebugString(szTemp);
	  }
#endif //AUD_DEBUG
    if ( pPlayAudio->bEnableOpenErrorMessage )
    {
      if ( ! ReportStatusToApplication( pPlayAudio,
                                        PA_DEVICE_OPEN_FAILURE,
                                        mmStatus ))
      {
        pPlayAudio->bEnableOpenErrorMessage = FALSE;
      }
    }
  }

  return mmStatus;
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

  return dwSize;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessResetMessage                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function stops any audio that is playing and resets   */
/*    audio queue.                                                    */
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

static ATYPE_T ProcessResetMessage( HPLAY_AUDIO_T pPlayAudio )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  This flag causes the timer thread to abandon sending any        */
  /*  synchronization marks until it reaches the start of the timer   */
  /*  thread main loop.                                               */
  /********************************************************************/

  pPlayAudio->bTimerThreadReset = TRUE;

  // tek 22jan99 ResetAudioQueue now happens further down

  /********************************************************************/
  /*  Set audio position counts to zero.                              */
  /********************************************************************/

  pPlayAudio->dwPositionBase = 0;

  OP_LockMutex( pPlayAudio->hmxBytesPlayed );
  pPlayAudio->dwBytesPlayed = 0;
  OP_UnlockMutex( pPlayAudio->hmxBytesPlayed );

  /********************************************************************/
  /*  Zero the "queued byte" counter.                                 */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxQueuedByteCount );
  pPlayAudio->dwQueuedByteCount = 0;
  OP_UnlockMutex( pPlayAudio->hmxQueuedByteCount );

  /********************************************************************/
  /*  Free all synchronization marks in the synchronization mark      */
  /*  linked list.                                                    */
  /********************************************************************/

  ClearSynchronizationMarkList( pPlayAudio );

  /********************************************************************/
  /*  If the audio device is open then reset it and return all wave   */
  /*  headers. Then the Process_MM_WOM_DONE_Message() function will   */
  /*  clear the "Reset Complete" event when all buffers have          */
  /*  completed. Otherwise clear the "Reset Complete" event here.     */
  /********************************************************************/

  if (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
      && ( pPlayAudio->pPlayAudioRing->iQueueCount!=0 ))
  {
	  StartAudioPlaying(pPlayAudio);
  }

  if (( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
      && ( pPlayAudio->iSamplesWaitingForCompletion != 0 ))
    {
#ifdef TYPING_MODE
      DWORD dwVolume; // tek 19nov97
      MMRESULT mmVolSetStatus; // tek 19nov97
#endif //TYPING_MODE
      
      pPlayAudio->dwAudioPlayState = AUDIO_STATE_RESET;
#ifdef TYPING_MODE
      // tek 19nov97 set the volume to zero before doing the reset, 
      // and put it back later.
      // this is part of bats518, but we need to do it here at a very
      // low level so we don't leave the wave device in a bad state if we
      // get aborted
      mmVolSetStatus = waveOutGetVolume(pPlayAudio->hWaveOut,&dwVolume);
      if (mmVolSetStatus ==  MMSYSERR_NOERROR)
	{
	  mmVolSetStatus = waveOutSetVolume(pPlayAudio->hWaveOut,0);
	}
#endif //TYPING_MODE

//	We're gonna do a PAUSE / RESET / RESET
	  LOCK_MME_CALL( mmStatus = waveOutPause( pPlayAudio->hWaveOut ))
	  pPlayAudio->bResetPaused = TRUE;

	  LOCK_MME_CALL( mmStatus = waveOutReset( pPlayAudio->hWaveOut ))

      LOCK_MME_CALL( mmStatus = waveOutReset( pPlayAudio->hWaveOut ))

#ifdef TYPING_MODE
	if (mmVolSetStatus ==  MMSYSERR_NOERROR)
	  {
	    mmVolSetStatus = waveOutSetVolume(pPlayAudio->hWaveOut,dwVolume);
	  }
#endif //TYPING_MODE
      
    }  // if (( pPlayAudio...
  else
    {
      OP_SetEvent( pPlayAudio->hevResetComplete );
#ifdef AUD_DEBUG //tek 22may97
      {
		  char szTemp[256]="";
		  sprintf(szTemp,"ProcResetMsg: calling waveOutReset at %ld\n",
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
	  }
#endif //AUD_DEBUG
	  
    mmStatus = MMSYSERR_NOERROR;
  }
  // tek 22jan99 if audio is truly dead, we can call ResetAudioQueue now.
  if ( pPlayAudio->iSamplesWaitingForCompletion == 0 )
  {
	  ResetAudioQueue(pPlayAudio);
  }


  /********************************************************************/
  /*  Enable the sending of Device open failure error messages.       */
  /********************************************************************/

  pPlayAudio->bEnableOpenErrorMessage = TRUE;

  return mmStatus;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ClearSynchronizationMarkList                            */
/*  Author: Bill Hallahan                                             */
/*  Date: April 6, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function empties the synchronization mark linked      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void ClearSynchronizationMarkList( HPLAY_AUDIO_T pPlayAudio )
{
  LPSYNC_MARK_T pSyncMark;
  LPSYNC_MARK_T pNextSyncMark;

  /********************************************************************/
  /*  Free all synchronization marks in the synchronization mark      */
  /*  linked list.                                                    */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxSynchronizationMarkList );

  pSyncMark = pPlayAudio->pSyncMarkList;
  pPlayAudio->pSyncMarkList = NULL;

  while ( pSyncMark != NULL )
  {
    pNextSyncMark = pSyncMark->pLink;

    free( pSyncMark );

    pSyncMark = pNextSyncMark;
  }

  OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );

  return;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void ResetAudioQueue( HPLAY_AUDIO_T pPlayAudio )
{
  LPPLAY_RING_T pPlayAudioRing;
  unsigned int uiI; //tek 22may97
  pPlayAudioRing = pPlayAudio->pPlayAudioRing;

//tek 22may97
#ifdef AUD_DEBUG
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"ResetAudioQueue: at %08lu\n",
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG
  // tek 05nov97 bats 508? (HJ Echo problem)
  // this needs to be done under the QueueCount mutex..

  OP_LockMutex( pPlayAudio->hmxQueueCount ); // own the audio queue...
  pPlayAudioRing->pQueueInput = pPlayAudioRing->pQueueStart;
  pPlayAudioRing->pQueueOutput = pPlayAudioRing->pQueueStart;
  pPlayAudioRing->iInputPosition = 0;
  pPlayAudioRing->iOutputPosition = 0;
  pPlayAudioRing->iQueueCount = 0;

  // we use the lpData field of each wave header to signal free/busy
  // for that header; so, zero them out here..
  for ( uiI = 0; uiI < MAXIMUM_BUFFERS_QUEUED; uiI++ )
      pPlayAudio->ppWaveHdr[uiI]->lpData = NULL;

  OP_SetEvent( pPlayAudio->hevQueueNotFull );
  OP_UnlockMutex( pPlayAudio->hmxQueueCount ); // tek 05nov97 unlock..
#ifdef AUD_DEBUG
  {
		  char  szTemp[256]="";
		  sprintf(szTemp,"ResetAudioQueue: exit at %08lu\n",
			  timeGetTime()
			  );
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessPauseMessage                                     */
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

static ATYPE_T ProcessPauseMessage( HPLAY_AUDIO_T pPlayAudio )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  If the wave output device is active then pause it. If it is not */
  /*  active then set the pause flag.                                 */
  /********************************************************************/

  if ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
    LOCK_MME_CALL( mmStatus = waveOutPause( pPlayAudio->hWaveOut ))
  }
  else
  {
    mmStatus = MMSYSERR_NOERROR;
  }

  /********************************************************************/
  /*  If the restart was successful then set the pause flag.          */
  /********************************************************************/

  if ( mmStatus == MMSYSERR_NOERROR )
  {
    OP_LockMutex( pPlayAudio->hmxPauseFlag );
    pPlayAudio->bPaused = TRUE;
	// Clear the reset pause, we're really paused now.
	pPlayAudio->bResetPaused = FALSE;
    OP_UnlockMutex( pPlayAudio->hmxPauseFlag );
  }

  return mmStatus;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessResumeMessage                                    */
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

static ATYPE_T ProcessResumeMessage( HPLAY_AUDIO_T pPlayAudio )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  If the wave output device was paused then restart it.           */
  /********************************************************************/

  if ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
    LOCK_MME_CALL( mmStatus = waveOutRestart( pPlayAudio->hWaveOut ))
  }
  else
  {
    mmStatus = MMSYSERR_NOERROR;
  }

  /********************************************************************/
  /*  If the restart was successful then reset the pause flag.        */
  /********************************************************************/

  if ( mmStatus == MMSYSERR_NOERROR )
  {
    OP_LockMutex( pPlayAudio->hmxPauseFlag );
    pPlayAudio->bPaused = FALSE;
    OP_SetEvent( pPlayAudio->hevTimerThreadActive );
    OP_UnlockMutex( pPlayAudio->hmxPauseFlag );
  }

  return mmStatus;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessSetFormatMessage                                 */
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

static MMRESULT ProcessSetFormatMessage( HPLAY_AUDIO_T pPlayAudio,
                                         LPWAVEFORMATEX pWaveFormat )
{
  DWORD dwSampleRate=0;
  DWORD dwNumberOfChannels=0;
  DWORD dwBytesPerSample=0;
  DWORD dwQueryFlags=0;
  MMRESULT mmStatus;

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
  /*  If PA_OWN_DEVICE is specified AND the requested Sample Rate and */
  /*  the requested Number Of Channels do NOT match the current       */
  /*  settings then an error is returned.                             */
  /********************************************************************/

  if ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
  {
    /******************************************************************/
    /*  The audio device is owned. This means that the wave output    */
    /*  device will not be closed unless the PA_DestroyPlayHandle()   */
    /*  function is called. In this case, the requested format must   */
    /*  match the actual data format currently being used.            */
    /*  One exception is that if the wFormatTag is equal to           */
    /*  WAVE_FORMAT_PCM then the several other fields will            */
    /*  automatically match (Except the wBitsPerSample field that     */
    /*  does not necessarily to match in this case).                  */
    /******************************************************************/

    if (( pWaveFormat->wFormatTag != pPlayAudio->pWaveFormat->wFormatTag )
      || ( pWaveFormat->nSamplesPerSec
                != pPlayAudio->pWaveFormat->nSamplesPerSec )
      || ( pWaveFormat->nChannels != pPlayAudio->pWaveFormat->nChannels ))
      return MMSYSERR_ERROR;

    if ( pWaveFormat->wFormatTag != WAVE_FORMAT_PCM )
    {
      if (( pWaveFormat->nAvgBytesPerSec
                  != pPlayAudio->pWaveFormat->nAvgBytesPerSec )
        || ( pWaveFormat->nBlockAlign
                  != pPlayAudio->pWaveFormat->nBlockAlign )
        || ( pWaveFormat->wBitsPerSample
                  != pPlayAudio->pWaveFormat->wBitsPerSample )
        || ( pWaveFormat->cbSize != pPlayAudio->pWaveFormat->cbSize ))
      return MMSYSERR_ERROR;
    }
  }
  else
  {
    /******************************************************************/
    /*  If the audio device is not inactive then return an error.     */
    /******************************************************************/

    if ( pPlayAudio->dwAudioDeviceState != AUDIO_DEVICE_INACTIVE )
    {
      return MMSYSERR_ALLOCATED;
    }
    else
    {
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
      /*  Set the wave out device query flags.                        */
      /****************************************************************/

      dwQueryFlags = WAVE_FORMAT_QUERY;
  
#ifdef USE_MME_SERVER

      /****************************************************************/
      /*  If the WAVE_OPEN_SHARE bit is set in the device options     */
      /*  then enable device sharing.                                 */
      /****************************************************************/

      if ( pPlayAudio->dwDeviceOptions & WAVE_OPEN_SHAREABLE )
      {
        dwQueryFlags |= WAVE_OPEN_SHAREABLE;
      }

#endif

	
      /****************************************************************/
      /*  Query the wave output device.                               */
      /****************************************************************/

#ifdef USE_MME_SERVER

      LOCK_MME_CALL(
        mmStatus = waveOutOpen( NULL,
                                pPlayAudio->uiSelectedDeviceID,
                                (LPWAVEFORMAT)pWaveFormat,
                                0,
                                0,
                                dwQueryFlags ))
#else
      LOCK_MME_CALL(
        mmStatus = waveOutOpen( NULL,
                                pPlayAudio->uiSelectedDeviceID,
                                (LPWAVEFORMATEX)pWaveFormat,
                                0,
                                0,
                                dwQueryFlags ))
#endif

#ifdef USE_MME_SERVER

      /****************************************************************/
      /*  THIS IS PROBABLY NOT NECESSARY, BUT IT CANNOT HURT.         */
      /*  The MME servers waveOutOpen() function returns a value of   */
      /*  WAVERR_DEVICESHAREABLE if the device is shareable. Change   */
      /*  this to MMSYSERR_NOERROR.                                   */
      /****************************************************************/

      if (( pPlayAudio->dwDeviceOptions & WAVE_OPEN_SHAREABLE )
        && ( mmStatus == WAVERR_DEVICESHAREABLE ))
      {
        mmStatus = MMSYSERR_NOERROR;
      }

#endif

      /****************************************************************/
      /*  If the requested wave output format is WAVE_FORMAT_PCM and  */
      /*  the number of bits per sample is 16 and the format is not   */
      /*  supported then try to query the wave output device for 8    */
      /*  bit samples.                                                */
      /****************************************************************/

/* TQL 05/21/1997  change this for OSF build */
      if(
#if defined WIN32
	 ( mmStatus == WAVERR_BADFORMAT )
#endif
#if defined __osf__ || defined __linux__   || defined VXWORKS || defined _SPARC_SOLARIS_
	 ( mmStatus == MMSYSERR_NOTSUPPORTED )
#endif
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
	  
#ifdef USE_MME_SERVER
	  
	  LOCK_MME_CALL(
			mmStatus = waveOutOpen( NULL,
						pPlayAudio->uiSelectedDeviceID,
						(LPWAVEFORMAT)pWaveFormat,
						0,
						0,
						dwQueryFlags ))
#else
	    LOCK_MME_CALL(
			  mmStatus = waveOutOpen( NULL,
						  pPlayAudio->uiSelectedDeviceID,
						  (LPWAVEFORMATEX)pWaveFormat,
						  0,
						  0,
						  dwQueryFlags ))
#endif
	    
#ifdef USE_MME_SERVER
	    
	    /**************************************************************/
	    /*  THIS IS PROBABLY NOT NECESSARY, BUT IT CANNOT HURT.       */
	    /*  The MME servers waveOutOpen() function returns a value of */
	    /*  WAVERR_DEVICESHAREABLE if the device is shareable. Change */
	    /*  this to MMSYSERR_NOERROR.                                 */
	    /**************************************************************/
	    
	    if (( pPlayAudio->dwDeviceOptions & WAVE_OPEN_SHAREABLE )
		&& ( mmStatus == WAVERR_DEVICESHAREABLE ))
	      {
		mmStatus = MMSYSERR_NOERROR;
	      }
	  
#endif
	  
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
	{
	  return mmStatus;
	}
      
      /****************************************************************/
      /*  Set the new device format.                                  */
      /****************************************************************/
      
      mmStatus = SetNewFormat( pPlayAudio, pWaveFormat );
      
      if ( mmStatus )
	{
	  return mmStatus;
	}
    }
  }
  
  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SetNewFormat                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: January 15, 1996                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function allocates space for the "play audio: handles */
/*    WAVFORMATEX structure and copies the wave format data into this */
/*    structure. Then this function sets the length paramters that    */
/*    are used to ensure that only the number of bytes written by the */
/*    WriteBufferToWaveDevice() function are limited to multiples of  */
/*    the current block alignment. (It is also necessary that the     */
/*    PA_Queue() function only queues buffers that have a length that */
/*    is a multiple of the current block alignment or the             */
/*    WriteBufferToWaveDevice() function might write buffers that are */
/*    not a multiple of the block alignment.                          */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio     A pointer to a structure of type PLAY_AUDIO_T.   */
/*                                                                    */
/*    pWaveFormat    A pointer to a structure of type WAVEFORMATEX    */
/*                   that is new audio format that will be used.      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static MMRESULT SetNewFormat( HPLAY_AUDIO_T pPlayAudio,
                              LPWAVEFORMATEX pWaveFormat )
{
  unsigned int uiBlockAlign;
  unsigned int uiWriteLength;
  DWORD dwWaveFormatSize;
  LPWAVEFORMATEX pWaveFormatNew;
  LPWAVEFORMATEX pWaveFormatOld;

  /******************************************************************/
  /*  Get the size of the WAVEFORMATEX structure including the      */
  /*  possible data space indicated by the cbSize element.          */
  /******************************************************************/

  dwWaveFormatSize = GetWaveFormatSize( pWaveFormat );

  // MGS change this back for osf so that we don't divide by 0 !
/* TQL 05/21/1997  change this for OSF build */
  //#ifdef WIN32
  if (pWaveFormat->wFormatTag == WAVE_FORMAT_PCM)
  {
    /******************************************************************/
    /*  Initialize other WAVEFORMATEX structure elements.             */
    /******************************************************************/

    pWaveFormat->nBlockAlign = pWaveFormat->nChannels * (pWaveFormat->wBitsPerSample >> 3);
    pWaveFormat->nAvgBytesPerSec = pWaveFormat->nSamplesPerSec * pWaveFormat->nBlockAlign;
    pWaveFormat->cbSize = 0;
  }
  ///#endif

  /******************************************************************/
  /*  Allocate space for the new WAVEFORMATEX structure.            */
  /******************************************************************/

  LOCK_MME_CALL(
    pWaveFormatNew = ALLOCATE_SERVER_MEM( dwWaveFormatSize ))

  if ( pWaveFormatNew == NULL )
  {
    return MMSYSERR_NOMEM;
  }

  /******************************************************************/
  /*  copy the WAVEFORMATEX structure.                              */
  /******************************************************************/

  memcpy( pWaveFormatNew,
          pWaveFormat,
          dwWaveFormatSize );

  /******************************************************************/
  /*  Save the old wave format structure so it can be freed.        */
  /******************************************************************/

  pWaveFormatOld = pPlayAudio->pWaveFormat;

  /******************************************************************/
  /*  It is important that the assignment statement on the          */
  /*  following line executes automically so the timer thread does  */
  /*  not create an error.                                          */
  /******************************************************************/

  OP_LockMutex( pPlayAudio->hmxWaveFormat );
  pPlayAudio->pWaveFormat = pWaveFormatNew;
  OP_UnlockMutex( pPlayAudio->hmxWaveFormat );

  if ( pWaveFormatOld != NULL )
  {
    LOCK_MME_CALL( FREE_SERVER_MEM( pWaveFormatOld ))
  }

  /********************************************************************/
  /*  Only write blocks that are a multiple of the block alignment.   */
  /********************************************************************/

  uiBlockAlign = pWaveFormatNew->nBlockAlign;

  if ( uiBlockAlign == 0 )
  {
    uiBlockAlign = 1;
  }
#ifdef __ipaq__
  uiBlockAlign=4;
#endif

  /********************************************************************/
  /*  Calculate the maximum write length written by the               */
  /*  WriteBufferToWaveDevice() function.                             */
  /********************************************************************/

  uiWriteLength = MAXIMUM_WRITE_LENGTH;
  uiWriteLength = uiWriteLength / uiBlockAlign;
  pPlayAudio->uiMaximumWriteLength = uiWriteLength * uiBlockAlign;

  /********************************************************************/
  /*  Calculate the maximum startup length written to the             */
  /*  WriteBufferToWaveDevice() function.                             */
  /********************************************************************/

  uiWriteLength = (unsigned int)
    ( (STARTUP_BUFFER_SECONDS/MAXIMUM_BUFFERS_QUEUED) * (double)pWaveFormat->nAvgBytesPerSec );

  if ( uiWriteLength < MINIMUM_STARTUP_WRITE_SIZE )
  {
    uiWriteLength = MINIMUM_STARTUP_WRITE_SIZE;
  }

#ifdef UNDER_CE
  // tek 23mar99 stretch the startup packet to try to avoid stutter.
#ifdef SMARTMEDIA
  uiWriteLength = uiWriteLength*3;
#else
  uiWriteLength = uiWriteLength*2;
#endif
#endif //UNDER_CE

  uiWriteLength = uiWriteLength / uiBlockAlign;
  uiWriteLength = uiWriteLength * uiBlockAlign;
#ifdef __ipaq__
  uiWriteLength&=0x03;
#endif
  /********************************************************************/
  /*  Limit the maximum startup length written so that if             */
  /*  MAXIMUM_BUFFERS_QUEUED buffers are written, there is still      */
  /*  space for at least MAXIMUM_WRITE_LENGTH bytes left in the       */
  /*  audio queue.                                                    */
  /********************************************************************/

  if ( uiWriteLength > pPlayAudio->uiMaximumWriteLength )
  {
    uiWriteLength = pPlayAudio->uiMaximumWriteLength;
  }

  pPlayAudio->uiStartupWriteLength = uiWriteLength;

#ifdef TYPING_MODE
  // when we're doing fast starts, we have to make sure we write 
  // at least 65msec or so of audio on the first shot to keep 
  // the Win multimedia services from getting confused and stuttering.
  {
	  UINT uiStutterMinWrite = (DWORD)((0.065) * (double)(pWaveFormat->nAvgBytesPerSec));

	  if (pPlayAudio->uiStartupWriteLength < uiStutterMinWrite)
			   pPlayAudio->uiStartupWriteLength = uiStutterMinWrite;
  }
#endif //TYPING_MODE

  /********************************************************************/
  /*  Set the minimum startup bytes value.                            */
  /********************************************************************/
 
#if (defined TYPING_MODE) || (defined UNDER_CE) //mfg 21jul1999 ifdef UNDER_CE to avoid 1 sec startup delay 
  {
	  pPlayAudio->uiMinimumStartupBytes =
		2 * pPlayAudio->uiStartupWriteLength;
  }
#else
  pPlayAudio->uiMinimumStartupBytes =
    MAXIMUM_BUFFERS_QUEUED * pPlayAudio->uiStartupWriteLength;
#endif //TYPING_MODE

  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessGetFormatMessage                                 */
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

static MMRESULT ProcessGetFormatMessage( HPLAY_AUDIO_T pPlayAudio,
                                         LPWAVEFORMATEX pWaveFormat )
{
  DWORD dwWaveFormatSize;

  /********************************************************************/
  /*  Get the size of the WAVEFORMATEX structure including the        */
  /*  possible data space indicated by the cbSize element.            */
  /********************************************************************/

  dwWaveFormatSize = GetWaveFormatSize( pPlayAudio->pWaveFormat );

  /********************************************************************/
  /*  Copy to the new WAVEFORMATEX structure.                         */
  /********************************************************************/

  memcpy( pWaveFormat,
          pPlayAudio->pWaveFormat,
          dwWaveFormatSize );

  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessGetVolumeMessage                                 */
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
/*    pdwVolume     A pointer to a DWORD that is set to the volume    */
/*                  level.                                            */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static ATYPE_T ProcessGetVolumeMessage( HPLAY_AUDIO_T pPlayAudio,
                                        LPDWORD pdwVolume )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Get the wave output device volume.                              */
  /********************************************************************/

  LOCK_MME_CALL(
    mmStatus = waveOutGetVolume((HWAVEOUT)pPlayAudio->uiSelectedDeviceID,
                                pdwVolume ))
  return mmStatus;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessSetVolumeMessage                                 */
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    dwVolume      A DWORD equal to the new volume setting.          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static ATYPE_T ProcessSetVolumeMessage( HPLAY_AUDIO_T pPlayAudio,
                                        DWORD dwVolume )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  If volume control is supported then set the volume.             */
  /********************************************************************/

  if ( pPlayAudio->dwDeviceSupport &
     ( WAVECAPS_LRVOLUME | WAVECAPS_VOLUME ))
  {
    LOCK_MME_CALL(
      mmStatus = waveOutSetVolume((HWAVEOUT)pPlayAudio->uiSelectedDeviceID,
                                  dwVolume ))
  }
  else
  {
    mmStatus = MMSYSERR_NOTSUPPORTED;
  }

  return mmStatus;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessSynchronizationMarkMessage                       */
/*  Author: Bill Hallahan                                             */
/*  Date: January 8, 1996                                             */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function places a synchronization mark at the current      */
/*    audio queue position. When all previously queued audio has been */
/*    played then the "play audio" callback function is called with   */
/*    the PA_SYNC_MARK message.                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    aTag          An identifier that is passed to the "play audio"  */
/*                  callback function when all audio up to the mark   */
/*                  has been played.                                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static ATYPE_T ProcessSynchronizationMarkMessage( HPLAY_AUDIO_T pPlayAudio,
                                                  ATYPE_T aTag )
{
  LPSYNC_MARK_T pSyncMark;
  LPSYNC_MARK_T pNextSyncMark;

  /********************************************************************/
  /*  Allocate memory for the synchronization mark structure.         */
  /********************************************************************/

  pSyncMark = (LPSYNC_MARK_T)malloc( sizeof(SYNC_MARK_T));

  if ( pSyncMark == NULL )
  {
    return MMSYSERR_NOMEM;
  }

  /********************************************************************/
  /*  Fill in the synchonization mark structure.                      */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxQueuedByteCount );
  pSyncMark->dwPosition = pPlayAudio->dwQueuedByteCount;
  OP_UnlockMutex( pPlayAudio->hmxQueuedByteCount );

  pSyncMark->aTag = aTag;
  pSyncMark->pLink = NULL;

  /********************************************************************/
  /*  Lock the synchronization mark linked list.                      */
  /********************************************************************/

  OP_LockMutex( pPlayAudio->hmxSynchronizationMarkList );

  /********************************************************************/
  /*  Put the synchronization mark at the end of the linked list.     */
  /********************************************************************/

  if ( pPlayAudio->pSyncMarkList == NULL )
  {
    pPlayAudio->pSyncMarkList = pSyncMark;
  }
  else
  {
    pNextSyncMark = pPlayAudio->pSyncMarkList;

    while ( pNextSyncMark->pLink != NULL )
    {
      pNextSyncMark = pNextSyncMark->pLink;
    }

    pNextSyncMark->pLink = pSyncMark;
  }

  /********************************************************************/
  /*  Set the timer thread active so it can process synchronization   */
  /*  marks.                                                          */
  /********************************************************************/

  OP_SetEvent( pPlayAudio->hevTimerThreadActive );

  /********************************************************************/
  /*  Unlock the synchronization mark linked list.                    */
  /********************************************************************/

  OP_UnlockMutex( pPlayAudio->hmxSynchronizationMarkList );

  return MMSYSERR_NOERROR;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ProcessGetPositionMessage                               */
/*  Author: Bill Hallahan                                             */
/*  Date: May 21, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns the position of the last byte        */
/*    sample played by the wave output device since either the        */
/*    PA_CreatePlayHandle() function or the PA_Reset() function       */
/*    was called.                                                     */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio     A pointer to a structure of type PLAY_AUDIO_T.   */
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

static ATYPE_T ProcessGetPositionMessage( HPLAY_AUDIO_T pPlayAudio,
                                          LPDWORD pdwPosition )
{
  MMRESULT mmStatus;

  if ( pPlayAudio->dwAudioDeviceState == AUDIO_DEVICE_ACTIVE )
  {
    mmStatus = AudioPosition( pPlayAudio, pdwPosition );

    *pdwPosition += pPlayAudio->dwPositionBase;
  }
  else
  {
    mmStatus = MMSYSERR_NOERROR;

    *pdwPosition = pPlayAudio->dwPositionBase;
  }

  return mmStatus;
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
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    pdwPosition   A pointer to a DWORD that returns the device      */
/*                  position. The device position is the byte sample  */
/*                  number of the last audio byte that has been       */
/*                  played since the wave output device was either    */
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

static MMRESULT AudioPosition( HPLAY_AUDIO_T pPlayAudio,
                               LPDWORD pdwPosition )
{
  MMRESULT mmStatus;
  LPMMTIME pMmt;

  /********************************************************************/
  /*  Get the wave output device position.                            */
  /*  First allocate memory for the MMTIME structure.                 */
  /********************************************************************/

  LOCK_MME_CALL( pMmt = (LPMMTIME)ALLOCATE_SERVER_MEM(sizeof(MMTIME)))

  if ( pMmt == NULL )
  {
    return MMSYSERR_NOMEM;
  }

  /********************************************************************/
  /*  Get the position of the last sample played by the wave output   */
  /*  device.                                                         */
  /********************************************************************/

  pMmt->wType = TIME_BYTES;

  LOCK_MME_CALL( mmStatus = waveOutGetPosition( pPlayAudio->hWaveOut,
                                                pMmt,
                                                sizeof(MMTIME)))
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
        ( pMmt->u.ms * pPlayAudio->pWaveFormat->nSamplesPerSec
            * pPlayAudio->pWaveFormat->nBlockAlign ) / 1000;

      if ( pPlayAudio->bConvertToEightBit )
      {
        *pdwPosition = *pdwPosition << 1;
      }

      break;

    case TIME_SAMPLES:

      *pdwPosition = pMmt->u.sample
        * pPlayAudio->pWaveFormat->nBlockAlign;

      if ( pPlayAudio->bConvertToEightBit )
      {
        *pdwPosition = *pdwPosition << 1;
      }

      break;

    case TIME_BYTES:

      *pdwPosition = pMmt->u.cb;

      if ( pPlayAudio->bConvertToEightBit )
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

  LOCK_MME_CALL( FREE_SERVER_MEM( pMmt ))

  return mmStatus;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ReportStatusToApplication                               */
/*  Author: Bill Hallahan                                             */
/*  Date: April 8, 1993                                               */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sends a message by calling the callback      */
/*    function that was passed to the PA_CreatePlayHandle()           */
/*    function.                                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio   A pointer to a structure of type PLAY_AUDIO_T.     */
/*                                                                    */
/*    aItem_0      An item of type ATYPE_T that is returned to the    */
/*                 application through the "play audio" callback      */
/*                 function.                                          */
/*                                                                    */
/*    aItem_1      An item of type ATYPE_T that is returned to the    */
/*                 application through the "play audio" callback      */
/*                 function.                                          */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type unsigned int. The         */
/*    meaning of this value depends on the message being sent,        */
/*    however, a zero return value generally means that the           */
/*    caller (the current "play audio" instance) will take no         */
/*    special action.                                                 */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static unsigned int ReportStatusToApplication( HPLAY_AUDIO_T pPlayAudio,
                                               ATYPE_T aItem_0,
                                               ATYPE_T aItem_1 )
{
  unsigned int uiRet;

#ifdef AUD_DEBUG
  OutputDebugString("PA: ReportStatusToApplication()\n");
#endif
  /********************************************************************/
  /*  If no callback routine is specified then discard the message.   */
  /********************************************************************/

  if ( 
	  (pPlayAudio->CallbackRoutine != NULL )
#ifdef TYPING_MODE //13may97 tek don't return these in typing mode..!
	  && ( !(((LPTTS_HANDLE_T)(pPlayAudio->aInstance))->bInTypingMode) )
#endif
	 )
  {
    uiRet = ( *pPlayAudio->CallbackRoutine )( pPlayAudio,
                                              pPlayAudio->aInstance,
                                              aItem_0,
                                              aItem_1 );
  }
  else
  {
    uiRet = 0;
  }

  return uiRet;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SendPlayAudioMessage                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: December 6, 1995                                            */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sends a message to the play audio thread.    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pPlayAudio    A pointer to a structure of type PLAY_AUDIO_T.    */
/*                                                                    */
/*    uiMessage     An unsigned int that contains a message code.     */
/*                                                                    */
/*    aParam        A variable of type ATYPE_T that contains a        */
/*                  message dependant parameter.                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type SENDRET_T. The            */
/*    meaning of this value depends on the message being sent,        */
/*    however, a zero return value generally means that no error      */
/*    occured.                                                        */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static SENDRET_T SendPlayAudioMessage( HPLAY_AUDIO_T pPlayAudio,
                                       unsigned int uiMessage,
                                       ATYPE_T aParam )
{
  ATYPE_T mDummy0;
  ATYPE_T mDummy1;
  ATYPE_T mReturn;

  /********************************************************************/
  /*  Put the message into the "play audio" message queue.            */
  /********************************************************************/

  OP_LockMutex( pShm_t->hmxGlobalSendPlayAudio );

  WriteMessageQueue( pShm_t->pGlobalPlayAudioMessageQueue,
                     (ATYPE_T)pPlayAudio,
                     uiMessage,
                     aParam );

  /********************************************************************/
  /*  Get the result from the report message queue.                   */
  /********************************************************************/

  ReadMessageQueue( pShm_t->pGlobalReportMessageQueue,
                    &mDummy0,
                    &mDummy1,
                    &mReturn );
  OP_UnlockMutex( pShm_t->hmxGlobalSendPlayAudio );
  return (SENDRET_T)mReturn;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: CreateMessageQueue                                      */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function allocates memory for a message queue and          */
/*    initializes the message queue data structure.                   */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    uiQueueLength    A unsigned integer that specifies the maximum  */
/*                     number of messages the queue can contain.      */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    A pointer to the message queue is returned. A value of NULL is  */
/*    returned if the message queue memory could not be allocated.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LPMESSAGE_QUEUE_T CreateMessageQueue( unsigned int uiQueueLength )
{
  unsigned int uiBufferLength;
  LPMESSAGE_QUEUE_T pMessageQueue;

  /********************************************************************/
  /*  Allocate the message queue structure.                           */
  /********************************************************************/

  pMessageQueue = (LPMESSAGE_QUEUE_T)malloc( sizeof( MESSAGE_QUEUE_T ));

  if ( pMessageQueue == NULL )
  {
    return NULL;
  }

  /********************************************************************/
  /*  Initialize message queue structure elements.                    */
  /********************************************************************/

  pMessageQueue->pStart = NULL;
  pMessageQueue->hevNotFull = NULL;
  pMessageQueue->hevNotEmpty = NULL;
  pMessageQueue->hmxMessageQueue = NULL;

  /********************************************************************/
  /*  Allocate the message queue buffer in multiples of 3 ATYPE_T     */
  /*  items.                                                          */
  /********************************************************************/

  uiBufferLength = NUMBER_OF_ITEMS_IN_MESSAGE * uiQueueLength;

  pMessageQueue->pStart =
    (LPATYPE_T)malloc( uiBufferLength * sizeof(ATYPE_T));

  if ( pMessageQueue->pStart == NULL )
  {
    DestroyMessageQueue( pMessageQueue );
    return NULL;
  }

  /********************************************************************/
  /*  Allocate the message queue mutex object.                        */
  /********************************************************************/

  pMessageQueue->hmxMessageQueue = OP_CreateMutex();

  if ( pMessageQueue->hmxMessageQueue == NULL )
  {
    DestroyMessageQueue( pMessageQueue );
    return NULL;
  }

  /********************************************************************/
  /*  Initialize the message queue structure.                         */
  /********************************************************************/

  pMessageQueue->pInput = pMessageQueue->pStart;
  pMessageQueue->pOutput = pMessageQueue->pStart;
  pMessageQueue->uiInputPosition = 0;
  pMessageQueue->uiOutputPosition = 0;
  pMessageQueue->uiLength = uiBufferLength;
  pMessageQueue->uiCount = 0;

  /********************************************************************/
  /*  Create the "Not Empty" Event. The initial state is not          */
  /*  signalled.                                                      */
  /********************************************************************/

  pMessageQueue->hevNotEmpty = OP_CreateEvent( TRUE, FALSE );

  if ( pMessageQueue->hevNotEmpty == NULL )
  {
    DestroyMessageQueue( pMessageQueue );
    return NULL;
  }

  /********************************************************************/
  /*  Create the "Not Full" Event. The initial state is signalled.    */
  /********************************************************************/

  pMessageQueue->hevNotFull = OP_CreateEvent( TRUE, TRUE );

  if ( pMessageQueue->hevNotFull == NULL )
  {
    DestroyMessageQueue( pMessageQueue );
    return NULL;
  }

  return pMessageQueue;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DestroyMessageQueue                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: April 5, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function deallocates a message queue.                      */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*                                                                    */
/*    pMessageQueue    A pointer to the message queue.                */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DestroyMessageQueue( LPMESSAGE_QUEUE_T pMessageQueue )
{
  if ( pMessageQueue != NULL )
  {
    /******************************************************************/
    /*  Delete the mutex object.                                      */
    /******************************************************************/

    OP_DestroyMutex( pMessageQueue->hmxMessageQueue );

    /******************************************************************/
    /*  Free the message queue events.                                */
    /******************************************************************/

    OP_DestroyEvent( pMessageQueue->hevNotEmpty );

    OP_DestroyEvent( pMessageQueue->hevNotFull );

    /******************************************************************/
    /*  Deallocate the message queue buffer and the message queue     */
    /*  structure.                                                    */
    /******************************************************************/

    if ( pMessageQueue->pStart != NULL )
    {
      free( pMessageQueue->pStart );
    }

    free( pMessageQueue );
  }

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WriteMessageQueue                                       */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function attempts to write items to a message queue. The   */
/*    function will block if the message queue is too full to hold    */
/*    the message.                                                    */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*                                                                    */
/*    pMessageQueue    A pointer to the message queue.                */
/*                                                                    */
/*    aItem_0          The first item to put in the message queue.    */
/*                                                                    */
/*    aItem_1          The second item to put in the message queue.   */
/*                                                                    */
/*    aItem_2          The third item to put in the message queue.    */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    If the queue is full then this function will block until        */
/*    another thread removes a message from the queue. Then the       */
/*    message is put into the message queue.                          */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void WriteMessageQueue( LPMESSAGE_QUEUE_T pMessageQueue,
                               ATYPE_T aItem_0,
                               ATYPE_T aItem_1,
                               ATYPE_T aItem_2 )
{
  unsigned int uiI;
  unsigned int uiRemaining;
  unsigned int uiNumberToWrite;
  ATYPE_T aArray[NUMBER_OF_ITEMS_IN_MESSAGE];
  LPATYPE_T pItems;

  /********************************************************************/
  /*  Block if the message queue is busy.                             */
  /********************************************************************/

  OP_LockMutex( pMessageQueue->hmxMessageQueue );

  aArray[0] = aItem_0;
  aArray[1] = aItem_1;
  aArray[2] = aItem_2;
  pItems = &aArray[0];

  /********************************************************************/
  /*  If there's not enough room for the items then block.            */
  /*  WriteMessageQueue must own pMessageQueue->uiCount               */
  /*  during the compare in case multiple threads are trying to write */
  /*  the queue at the same time.                                     */
  /********************************************************************/

  uiNumberToWrite = NUMBER_OF_ITEMS_IN_MESSAGE;
  
  while ( pMessageQueue->uiCount + uiNumberToWrite > pMessageQueue->uiLength )
  {
  
    OP_ResetEvent( pMessageQueue->hevNotFull );

    OP_UnlockMutex( pMessageQueue->hmxMessageQueue );
  
    OP_WaitForEvent( pMessageQueue->hevNotFull, OP_INFINITE );
  
    OP_LockMutex( pMessageQueue->hmxMessageQueue );
  }

  /********************************************************************/
  /*  There is enough space in the message queue.                     */
  /*  Test to see if the data will wrap around the circular queue.    */
  /********************************************************************/

  if (( pMessageQueue->uiInputPosition + uiNumberToWrite )
         > pMessageQueue->uiLength )
  {
    /******************************************************************/
    /*  The data will wrap around the circular queue.                 */
    /******************************************************************/

    uiRemaining = pMessageQueue->uiLength - pMessageQueue->uiInputPosition;

    for ( uiI = 0; uiI < uiRemaining; uiI++ )
     *pMessageQueue->pInput++ = *pItems++;

    pMessageQueue->pInput = pMessageQueue->pStart;

    for ( uiI = uiRemaining; uiI < uiNumberToWrite; uiI++ )
     *pMessageQueue->pInput++ = *pItems++;

    /******************************************************************/
    /*  Update the input position in a circular fashion.              */
    /******************************************************************/

    pMessageQueue->uiInputPosition = uiNumberToWrite - uiRemaining;
  }
  else
  {
    /******************************************************************/
    /*  The data will NOT wrap around the circular queue.             */
    /******************************************************************/

    for ( uiI = 0; uiI < uiNumberToWrite; uiI++ )
     *pMessageQueue->pInput++ = *pItems++;

    /******************************************************************/
    /*  Update the input position.                                    */
    /******************************************************************/

    pMessageQueue->uiInputPosition += uiNumberToWrite;
  }

  /********************************************************************/
  /*  Update the count of items in the message queue.                 */
  /********************************************************************/

  pMessageQueue->uiCount += uiNumberToWrite;

  /********************************************************************/
  /*  Set the "Not Empty" condition.                                  */
  /********************************************************************/

  OP_SetEvent( pMessageQueue->hevNotEmpty );

  /********************************************************************/
  /*  Free the message queue.                                         */
  /********************************************************************/

  OP_UnlockMutex( pMessageQueue->hmxMessageQueue );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: ReadMessageQueue                                        */
/*  Author: Bill Hallahan                                             */
/*  Date: March 10, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function attempts to read items from a message queue. The  */
/*    function will block if the message queue is empty.              */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pMessageQueue    A pointer to the message queue.                */
/*                                                                    */
/*    paItem_0         The first item to put in the message queue.    */
/*                                                                    */
/*    paItem_1         The second item to put in the message queue.   */
/*                                                                    */
/*    paItem_2         The third item to put in the message queue.    */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    If the queue is empty then this function will block until       */
/*    another thread puts a message into the queue. Then a message is */
/*    read from the message queue.                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void ReadMessageQueue( LPMESSAGE_QUEUE_T pMessageQueue,
                              LPATYPE_T paItem_0,
                              LPATYPE_T paItem_1,
                              LPATYPE_T paItem_2 )
{
  unsigned int uiI;
  unsigned int uiRemaining;
  unsigned int uiNumberToRead;
  ATYPE_T aArray[NUMBER_OF_ITEMS_IN_MESSAGE];
  LPATYPE_T pItems;

  /********************************************************************/
  /*  Block if the message queue is busy.                             */
  /********************************************************************/

  OP_LockMutex( pMessageQueue->hmxMessageQueue );

  pItems = &aArray[0];

  /********************************************************************/
  /*  If there is no message in the message queue then block.         */
  /*  The ReadMessageQueue() function must own pMessageQueue->uiCount */
  /*  during the compare in case multiple threads are trying to read  */
  /*  the message queue at the same time.                             */
  /********************************************************************/

  uiNumberToRead = NUMBER_OF_ITEMS_IN_MESSAGE;

  while ( pMessageQueue->uiCount < uiNumberToRead )
  {

    OP_ResetEvent( pMessageQueue->hevNotEmpty );

    OP_UnlockMutex( pMessageQueue->hmxMessageQueue );

    OP_WaitForEvent( pMessageQueue->hevNotEmpty, OP_INFINITE );

    OP_LockMutex( pMessageQueue->hmxMessageQueue );
  }

  /********************************************************************/
  /*  There is a message in the queue.                                */
  /*  Test to see if the read of the data wraps around the queue.     */
  /********************************************************************/

  if (( pMessageQueue->uiOutputPosition + uiNumberToRead )
          > pMessageQueue->uiLength )
  {
    /******************************************************************/
    /*  The read of the data will wrap around the circular queue.     */
    /******************************************************************/

    uiRemaining = pMessageQueue->uiLength - pMessageQueue->uiOutputPosition;

    for ( uiI = 0; uiI < uiRemaining; uiI++ )
      *pItems++ = *pMessageQueue->pOutput++;

    pMessageQueue->pOutput = pMessageQueue->pStart;

    for ( uiI = uiRemaining; uiI < uiNumberToRead; uiI++ )
      *pItems++ = *pMessageQueue->pOutput++;

    /******************************************************************/
    /*  Update the output position in a circular fashion.             */
    /******************************************************************/

    pMessageQueue->uiOutputPosition = uiNumberToRead - uiRemaining;
  }
  else
  {
    /******************************************************************/
    /*  The read of the data will NOT wrap around the circular queue. */
    /******************************************************************/

    for ( uiI = 0; uiI < uiNumberToRead; uiI++ )
      *pItems++ = *pMessageQueue->pOutput++;

    /******************************************************************/
    /*  Update the output position.                                   */
    /******************************************************************/

    pMessageQueue->uiOutputPosition += uiNumberToRead;
  }

  /********************************************************************/
  /*  Update the count of items in the message queue.                 */
  /********************************************************************/

  pMessageQueue->uiCount -= uiNumberToRead;

  /********************************************************************/
  /*  Set the "Not Full" condition.                                   */
  /********************************************************************/

  OP_SetEvent( pMessageQueue->hevNotFull );

  /********************************************************************/
  /*  Copy the data to the output arguments.                          */
  /********************************************************************/

  *paItem_0 = aArray[0];
  *paItem_1 = aArray[1];
  *paItem_2 = aArray[2];

  /******************************************************************/
  /*  Free the message queue.                                       */
  /******************************************************************/

  OP_UnlockMutex( pMessageQueue->hmxMessageQueue );
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaveOutCallbackRoutine                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: March 10, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    The address of this function is passed to the waveOutOpen()     */
/*    function. This callback function processes the follwing         */
/*    messages; MM_WOM_OPEN, MM_WOM_DONE, and MM_WOM_CLOSE. These     */
/*    messages are sent to the play audio processing loop.            */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    hWaveOut      A handle to the wave output device.               */
/*                                                                    */
/*    uiMessage     The message value.                                */
/*                                                                    */
/*    dwInstance    Specifies the user instance data passed to the    */
/*                  waveOutOpen() function.                           */
/*                                                                    */
/*    lParam1       Specifies a message-dependent parameter.          */
/*                                                                    */
/*    lParam2       Specifies a message-dependent parameter.          */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void CALLBACK WaveOutCallbackRoutine( HWAVEOUT hWaveOut,
                                      unsigned int uiMessage,
                                      DWORD dwInstance,
                                      LPARAM lParam1,
                                      LPARAM lParam2 )
{
  HPLAY_AUDIO_T pPlayAudio;
  switch ( uiMessage )
  {
  case MM_WOM_OPEN:

    /******************************************************************/
    /*  Get the audio handle.                                         */
    /******************************************************************/

#ifdef OS_SIXTY_FOUR_BIT

    OP_LockMutex( pShm_t->hmxGlobalHandleList );
    pPlayAudio = pShm_t->ppGlobalHandleList[dwInstance];
    OP_UnlockMutex( pShm_t->hmxGlobalHandleList );

#else

    pPlayAudio = (HPLAY_AUDIO_T)dwInstance;

#endif

    /******************************************************************/
    /*  Put the MM_WOM_OPEN message into the "play audio" message     */
    /*  queue.                                                        */
    /******************************************************************/

    WriteMessageQueue( pShm_t->pGlobalPlayAudioMessageQueue,
                       (ATYPE_T)pPlayAudio,
                       (ATYPE_T)uiMessage,
                       (ATYPE_T)0 );
    break;

  case MM_WOM_DONE:

    /******************************************************************/
    /*  Get the audio handle.                                         */
    /******************************************************************/

#ifdef OS_SIXTY_FOUR_BIT

    OP_LockMutex( pShm_t->hmxGlobalHandleList );
    pPlayAudio = pShm_t->ppGlobalHandleList[dwInstance];
    OP_UnlockMutex( pShm_t->hmxGlobalHandleList );

#else

    pPlayAudio = (HPLAY_AUDIO_T)dwInstance;

#endif

  /********************************************************************/
  /*  Determine the address of the WAVEHDR structure. For Windows,    */
  /*  the address is the same as the address written by the           */
  /*  waveOutWrite() function call that caused this MM_WOM_DONE       */
  /*  message. For the MME Server the returned WAVEHDR address is     */
  /*  different.                                                      */
  /********************************************************************/

#ifdef USE_MME_SERVER

    /******************************************************************/
    /*  MME BUG WORKAROUND. Because the MME server currently does not */
    /*  return wave headers in the correct order, it is necessary to  */
    /*  put wave headers on a list whenever a wave header is written  */
    /*  by the waveOutWrite() function. This list is accessed in the  */
    /*  wave output callback routine to determine the current header. */
    /******************************************************************/

    lParam1 =
      (LPARAM)pPlayAudio->ppWaveHdrInUseList[pPlayAudio->uiWaveHdrReadIndex];

    pPlayAudio->uiWaveHdrReadIndex++;

    if ( pPlayAudio->uiWaveHdrReadIndex >= MAXIMUM_BUFFERS_QUEUED )
    {
      pPlayAudio->uiWaveHdrReadIndex = 0;
    }

#endif

    /******************************************************************/
    /*  Put the MM_WOM_DONE message into the "play audio" message     */
    /*  queue. Send the address of the returned wave header.          */
    /******************************************************************/

    WriteMessageQueue( pShm_t->pGlobalPlayAudioMessageQueue,
                       (ATYPE_T)pPlayAudio,
                       (ATYPE_T)uiMessage,
                       (ATYPE_T)lParam1 );

    break;

  case MM_WOM_CLOSE:

    /******************************************************************/
    /*  Get the audio handle.                                         */
    /******************************************************************/

#ifdef OS_SIXTY_FOUR_BIT

    OP_LockMutex( pShm_t->hmxGlobalHandleList );
    pPlayAudio = pShm_t->ppGlobalHandleList[dwInstance];
    OP_UnlockMutex( pShm_t->hmxGlobalHandleList );

#else

    pPlayAudio = (HPLAY_AUDIO_T)dwInstance;

#endif

    /******************************************************************/
    /*  Put the MM_WOM_CLOSE message into the "play audio" message    */
    /*  queue.                                                        */
    /******************************************************************/

    WriteMessageQueue( pShm_t->pGlobalPlayAudioMessageQueue,
                       (ATYPE_T)pPlayAudio,
                       (ATYPE_T)uiMessage,
                       (ATYPE_T)0 );
    break;

  default:

    break;
  }

  return;
}

/*
 * Function: PA_DoSync().
 * calls StartAudioPlaying if there are samples to send and the device is
 * not running. Only if the device is owned..
 */
void PA_DoSync(HPLAY_AUDIO_T pPlayAudio)
{
	// tek 19jun97 we do nothing if we're not working to a device..
	if (pPlayAudio == NULL)
		return;

	  // if there are audio samples to
	  // play, and the audio device isn't playing them, then start
	  // the audio device.
#ifdef AUD_DEBUG
  {
	  // tek 12nov97 corrected as part of the BATS508 edits
		  char  szTemp[256]="";
		  sprintf(szTemp,"DoSync at %08lu\n",
			  timeGetTime()
			  );	  
		  OutputDebugString(szTemp);
  }
#endif //AUD_DEBUG
  {
    // tek 19nov97 restructured this logic..
    // if we have something to do..
    if (pPlayAudio->pPlayAudioRing->iQueueCount)
		  {
			  // if we own the device, just do it.
			  if ( pPlayAudio->dwDeviceOptions & PA_OWN_DEVICE )
			  {
			 StartAudioPlaying(pPlayAudio);
			  }
			  else // we don't own the device..
			  {
				  // if the device is running, do this. if not, it is up to the
				  // timer thread to start things.
				  if (AUDIO_DEVICE_ACTIVE == pPlayAudio->dwAudioDeviceState)
				  {
					StartAudioPlaying(pPlayAudio);
				  }
			  }
		  } // if we have something to do..
	  }

}
/*
 * Function: PA_GetBytesPerSecond()
 * returns the average bytes/sec for the audio output.
 */
DWORD PA_GetBytesPerSecond(HPLAY_AUDIO_T pPlayAudio)
{
	return(pPlayAudio->pWaveFormat->nAvgBytesPerSec);
}

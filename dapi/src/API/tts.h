/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:        tts.h
 *    Author:			Bill Hallahan
 *    Creation Date:	July 22, 1993
 *
 *    Functionality:
 *    This include file is included in DECtalk code which references 
 *    the API calls and the Text-To-Speech handle. Application       
 *    developers will include file ttsapi.h.                         
 *
 ***********************************************************************
 *    Revision History:
 *
 *  Rev Name    Date        Description
 *  --- -----   ----------- --------------------------------------------
 *  001	GL		04/21/1997	BATS#357 Add the code for __osf__ build 
 *	002 TEK		05/01/1997	Licensing changes
 *	003	tek		09jun97		typing changes
 *  004 NCS     29jul97      OCTEL changes
 *  005 tek             13nov97         bats404: members for the new messages in TTS (aug97)
 *  006 TEK             13nov97         sapi fixes: structures for transport (aug97)
 *  007 cjl             19nov97         add ifdefs for sapi only.
 *                                      change speech.h to local
 *  008	tek		27may98		bats689: threadsafe instance counting
 *  009	tek		19aug98		support for TTSConvertToPhonemes
 *  010 ETT     05oct98     added linux code
 *  011 mfg		15oct98		define pWaveFile as a HANDLE for CE
 *  012 jhu		20oct98		define pLogFile as a HANDLE for CE
 *
 **********************************************************************************************/

#ifndef _TTS_H_
#define _TTS_H_

#ifdef WIN32
#include <windows.h>
#include <mmreg.h>
#include <stdio.h>
// cjl 19nov97 add ifdef for sapi only.
#ifdef OLEDECTALK
// cjl 19nov97 change speech.h to local
#include "speech.h"
#endif //OLEDECTALK
#endif

#include "port.h"

#ifdef __linux__
#define HWND unsigned int
#include "dtmmedefs.h"
#endif

#include "opthread.h"   /*Platform-independent Threads implementation header file*/
#include "playaud.h"

/* GL 04/21/1997  add this as the latest OSF code */
#if defined __osf__ || defined __linux__
typedef  HPLAY_AUDIO_T  LPAUDIO_HANDLE_T;
#endif

#ifdef OLEDECTALK       //MVP: For OLE-DECTalk
#include "audioapi.h"
#endif

#include "kernel.h"     /* Added for PKSD_T declaration MI :MVP */

#ifndef ACI_LICENSE		//tek 01may97
#ifdef DTALK50          // Used only in DTalk5.0+  KSB
#include "cpapi.h"      // Control Panel API functions
#endif
#endif	//ACI_LICENSE

/* DECtalk Version Numbers moved to coop.h: 11/22/96 CJL */
#include "coop.h"
#ifndef __linux__
/* externs for global variables :MVP   */
extern volatile int gnInstanceCounter;
extern TLOCK tl_gnInstanceCounter; // tek 27may98
#endif

extern int far *gpufdic;
extern S32 gufdic_entries;

/* GL 04/21/1997  add this as the latest OSF code */
#ifdef __osf__
/**********************************************************************/
/* Sybmol definitiopns for return status from CheckLicenses           */
/**********************************************************************/
#define LIC_NO_PAK          1
#define LIC_NO_MORE_UNITS   2
#define LIC_UNKNOWN_ERR     3
#endif

#ifdef __linux__
/**********************************************************************/
/* Sybmol definitiopns for return status from CheckLicenses           */
/**********************************************************************/
#define LIC_NO_PAK          1
#define LIC_NO_MORE_UNITS   2
#define LIC_UNKNOWN_ERR     3
#endif

/**********************************************************************/
/*  Symbol definitions for the Text-To-Speech output state.           */
/*  The order of these defines affects the efficiency of the vocal    */
/*  tract model IO task.                                              */
/**********************************************************************/

#define  STATE_OUTPUT_AUDIO         0
#define  STATE_OUTPUT_MEMORY        1
#define  STATE_OUTPUT_WAVE_FILE     2
#define  STATE_OUTPUT_LOG_FILE      3
#define  STATE_OUTPUT_NULL          4

/**********************************************************************/
/*  Structure for the Wave audio file header.                         */
/*  The following structure is defined in section 8-40 of the         */
/*  Microsoft Windows Multimedia Programmers Reference. 1991          */
/*  There is an additiona undocumented 32 bit word that had to be     */
/*  added to make the files formats match the examples.               */
/**********************************************************************/

typedef struct WAVE_FILE_HDR_TAG
{
  char psRiff[4];                  /* Wave-form                       */
  DWORD dwRiffChunkSize;           /*     Size of this RIFF chunk     */
  char psWaveFmt[8];               /*   fmt-ck                        */
  DWORD dwWaveChunkSize;           /*     Size of this WAVE chunk     */
  WORD wFormatTag;                 /*     wave-format = 1 for PCM     */
  WORD wNumberOfChannels;          /*     1 channel                   */
  DWORD dwSamplesPerSecond;        /*     11025 = sample rate         */
  DWORD dwAvgBytesPerSecond;       /*     11025 = byte rate           */
  WORD wNumberBlockAlign;          /*     1 block                     */
  WORD wBitsPerSample;             /*     format-specific (8 bits)    */
  char psData[4];                  /*     data-ck                     */
  DWORD dwDataChunkSize;           /*     Size of this data chunk     */
} WAVE_FILE_HDR_T;

typedef WAVE_FILE_HDR_T * LPWAVE_FILE_HDR_T;

#define RIFF_HEADER_OFFSET   36

/* GL 04/21/1997  add this as the latest OSF code */
#if defined (__osf__) || defined (__linux__)
/**********************************************************************/
/*  Text Message Linked List structure for digital unix.              */
/**********************************************************************/
struct TEXT_MSG_TAG
{
  struct TEXT_MSG_TAG * pLink;
  unsigned int uiLength;
  unsigned char *pText;
  unsigned int uiMsgNumber;  // ETT 8/11/1998 added this member
};

typedef  struct TEXT_MSG_TAG  TEXT_MSG_T;
typedef  TEXT_MSG_T * LPTEXT_MSG_T;
#endif /* __osf__ || __linux__ */

/**********************************************************************/
/*  This structure is the text to speech handle.                      */
/**********************************************************************/

struct TTS_HANDLE_TAG
{
  HWND hWnd;
  HWND hTextToSpeechWnd;
  PKSD_T   pKernelShareData;       /* Added for Multiple instance speech objects: MVP*/
  PVOID    pCMDThreadData  ;       /* Instance specific CMD thread data */
  PVOID    pLTSThreadData  ;       /* Instance specific LTS thread data */
  PVOID    pVTMThreadData  ;       /* Instance specific VTM thread data */
  PVOID    pPHThreadData   ;       /* Instance specific PH thread data */
#ifdef WIN32
  HANDLE   hMallocSuccessEvent;    /* Event handle to report successful memory allocations */
  HANDLE   hThread_TXT;
  HANDLE hThread_CMD;
  HANDLE hThread_LTS;
  HANDLE hThread_PH;
  HANDLE hThread_VTM;
  HANDLE hThread_SYNC;
  HANDLE hSyncEvent;
  HANDLE hNotEmptyingVtmPipeEvent;
#endif
/* GL 04/21/1997  add this as the latest OSF code */
#if defined (__osf__) || defined (__linux__)
  HEVENT_T hMallocSuccessEvent;    /* Event handle to report successful memory allocations */
  HTHREAD_T hThread_TXT;
  HTHREAD_T hThread_CMD;
  HTHREAD_T hThread_LTS;
  HTHREAD_T hThread_PH;
  HTHREAD_T hThread_VTM;
  HTHREAD_T hThread_SYNC;
  HEVENT_T hSyncEvent;
  HEVENT_T hNotEmptyingVtmPipeEvent;
  HEVENT_T hTextInQueueEvent;
  UINT uiTextThreadExit;
  UINT uiThreadError;
/* MGS 09/15/1997 removed bInReset from osf/linux only */
#endif

  UINT uiQueuedCharacterCount;
  UINT uiCurrentMsgNumber;
  UINT uiLastTextMsgNumber;
  UINT uiLastQueuedTextMsgNumber;
  UINT uiFlushMsgNumber;
  UINT uiID_Error_Message;
  UINT uiID_Index_Message;
  UINT uiID_Buffer_Message;
  UINT uiID_Bookmark_Message;	//tek 01aug97 bats 404
  UINT uiID_Wordpos_Message;	//tek 01aug97 bats 404
  UINT uiID_Start_Message;	//tek 01aug97 bats 404
  UINT uiID_Stop_Message;	//tek 01aug97 bats 404
  UINT uiID_Visual_Message;	//tek 27aug97 visual support
  DWORD dwDeviceOptions;
  DWORD dwFileSampleCount;
  DWORD dwQueuedSampleCount;
  DWORD dwFormat;
  volatile DWORD dwOutputState;
  BOOL bEnableErrorMessage;
  BOOL bMemoryReset;
  BOOL bSendingBuffer;
#ifdef UNDER_CE	// must be a handle for Windows CE
  HANDLE pWaveFile;
  HANDLE pLogFile;
#else
  FILE * pWaveFile;
  FILE * pLogFile;
#endif

  LPWAVE_FILE_HDR_T pWaveFileHdr;
  void * pTTS_Buffer;
  void (*DtCallbackRoutine)(LONG,LONG,DWORD,UINT);     //New Audio Integration :After testing remove these comments
  DWORD dwTTSInstanceParameter;    //New Audio Integration
#ifdef WIN32
  HMUTEX_T hmxCallback;            //New Audio Integration
  LPCRITICAL_SECTION pcsMemoryBuffer;
  LPCRITICAL_SECTION pcsQueuedSampleCount;
  LPCRITICAL_SECTION pcsLastQueuedTextMsgNumber;
  LPCRITICAL_SECTION pcsFlushMsgNumber;
  LPCRITICAL_SECTION pcsQueuedCharacterCount;
  LPCRITICAL_SECTION pcsLogFile;
  LPCRITICAL_SECTION pcsBufferPipe;
//  LPAUDIO_HANDLE_T pAudioHandle;
  BOOL IsSpeaking;
  ULONG LastError;
#endif
/* GL 04/21/1997  add this as the latest OSF code */
#if defined (__osf__) || defined (__linux__)
  HMUTEX_T pcsCallback;            /*New Audio Integration*/
  HMUTEX_T pcsMemoryBuffer;
  HMUTEX_T pcsQueuedSampleCount;
  HMUTEX_T pcsLastQueuedTextMsgNumber;
  HMUTEX_T pcsFlushMsgNumber;
  HMUTEX_T pcsQueuedCharacterCount;
  HMUTEX_T pcsLogFile;
  HMUTEX_T pcsTextMsgList;
  HMUTEX_T pcsBufferPipe;
  LPTEXT_MSG_T pTextMsgList; /* A linked list of text messages */
  unsigned int LastError;
#endif

  LPAUDIO_HANDLE_T pAudioHandle;
#ifndef ACI_LICENSE
#ifdef DTALK_50
  LPCPTHREAD CPanelThread;
#endif
#ifdef TYPING_MODE
		volatile BOOL					bInTypingMode;
		WORD							wTypingFrameCount;
#endif /* TYPING_MODE */
#endif /* ACI_LICENSE */
  /* bats 385 */
  volatile BOOL	bInReset; /* volatile cuz we use it for interprocess comm */
  volatile char *szPhonemeBuffer;		// where ConvertToPhonemes puts the phonemes
								// uses NULL status to tell not to do it
  volatile DWORD dwPhonemeBufferSize;	// how big it is
  volatile DWORD dwPhonemeBufferPtr;		// where we are
  volatile DWORD dwPhonemeCvtFlags;		// how to do it.

};

/**********************************************************************/
/*  Define the audio sample type                                      */
/**********************************************************************/

typedef short SAMPLE_T;

typedef SAMPLE_T * LPSAMPLE_T;

// tek 04aug97 sapi fixes
// these data structures are used to transport the info we need
// to do notifications
#ifdef WIN32
typedef struct VISUAL_DATA_STRUCT
{
	QWORD	qTimeStamp;
	DWORD	dwPhoneme;
	DWORD	dwDuration;
	DWORD	dwHints;
	char	cEnginePhoneme;

} VISUAL_DATA, *PVISUAL_DATA;
typedef struct MARK_DATA_STRUCT
{	
	QWORD	qTimeStamp;
	DWORD	dwMarkValue;
	DWORD	dwMarkType;		// used in SAPI to pass the type through the
							// audio dest Bookmark path.
} MARK_DATA, *PMARK_DATA;
// tek 15aug97 this is SAPI-specific, and only in the sapi api files, but
// I've put it here to try to keep all the transport-related stuff
// together.
typedef struct SINK_DATA_STRUCT
{
	QWORD	qwTime;
	PVOID	pvNotifySink;	// might be notify or bufnotify
	DWORD	dwData1;
	DWORD	dwData2;
} SINK_DATA, *PSINK_DATA;

// cjl 11nov97 add ifdefs for sapi only.
#ifdef OLEDECTALK
typedef struct BUF_NOTIFY_LIST
{
	struct BUF_NOTIFY_LIST		*Next;
	PITTSBUFNOTIFYSINK			pbnsSink;
	DWORD						dwSequenceNumber;
} BUFNOTIFYLIST, *PBUFNOTIFYLIST;

typedef struct NOTIFY_LIST
{
	struct NOTIFY_LIST			*Next;
	PITTSNOTIFYSINK				pnsSink;
	DWORD						dwKey;
} NOTIFYLIST, *PNOTIFYLIST;
#endif //OLEDECTALK

#endif //WIN32
// end of sapi fixes

/**********************************************************************/
/*  Define the API interface.                                         */
/**********************************************************************/

#include "ttsapi.h"

/**********************************************************************/
/*  Function proto-types for internal DECtalk functions.              */
/*  (Functions WriteAudioToFile() and QueueInMemory() are included    */
/*  directly in the Vocal Tract Model task in file vtmiont.c.         */
/**********************************************************************/

void TextToSpeechErrorHandler( LPTTS_HANDLE_T,
							   UINT,
							   MMRESULT );

/* MVP : This fucntion is become now obsolete 
LPTTS_HANDLE_T TextToSpeechGetHandle(void);
*/
#ifdef WIN32
void Report_TTS_Status( LPTTS_HANDLE_T ttsHandle,
			UINT uiMsg, long lParam1,
			long lParam2);
#endif

/* GL 04/21/1997  add this as the latest OSF code */
#ifdef __osf__
void Report_TTS_Status( LPTTS_HANDLE_T phTTS,
                        UINT uiMsg, long lParam1,
                        long lParam2);
#endif

#ifdef __linux__
void Report_TTS_Status( LPTTS_HANDLE_T phTTS,
			UINT uiMsg, long lParam1,
                        long lParam2);
#endif

void QueueToMemory( LPTTS_HANDLE_T, LPSAMPLE_T, DWORD );

void SendBuffer( LPTTS_HANDLE_T );

MMRESULT WaitForLtsFlush( LPTTS_HANDLE_T, DWORD );

void EmptyVtmPipe(PKSD_T);

#ifdef PRINTFDEBUG
void WINprintf(char *fmt, ...);
#endif

#endif

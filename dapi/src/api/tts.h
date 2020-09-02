/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved. 
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved. 
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
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
 *  004 NCS     29jul97     OCTEL changes
 *  005 tek     13nov97     bats404: members for the new messages in TTS (aug97)
 *  006 TEK     13nov97     sapi fixes: structures for transport (aug97)
 *  007 cjl     19nov97     add ifdefs for sapi only.
 *                          	change speech.h to local
 *  008	tek		27may98		bats689: threadsafe instance counting
 *  009	tek		19aug98		support for TTSConvertToPhonemes
 *  010 ETT     05oct98     added linux code
 *  011 mfg		15oct98		define pWaveFile as a DT_HANDLE for CE
 *  012 jhu		20oct98		define pLogFile as a DT_HANDLE for CE
 *  013	mgs		12jun00		dictionary reduction
 *  019	MGS		07/14/2000	Sapi 5 additions 
 *  020	MGS		07/20/2000	More Sapi 5 stuff 
 *  021	MGS		08/22/2000	BATS #935, fixed 2 concurrency problems
 *  022	MGS		08/30/2000	Increased the speed of the tuner
 *  023 CAB		10/16/2000	Changed copyright info
 *  024	MGS		02/28/2001	Merged in base changes needed for ACCESS32 merge
 *  025	MGS		03/01/2001	Made the foreign language dict work for multiple instances
 *  026	CAB		03/01/2001	Updated copyright info
 *  027	MGS		03/02/2001	Added code for multiple instances work with dictionary mapping
 *  028	MGS		05/09/2001	Access32 Merge and Some VxWorks porting BATS#972
 *  029 CAB		05/16/2001	Removed extra  / in code
 *  030	MGS		06/19/2001	Solaris Port BATS#972
 *  031	MGS		02/26/2002	Trial SDK Noise
 *  032	MGS		03/20/2002	Single threaded vtm
 *  033	MGS		03/21/2002	Single threaded ph
 *  034	MGS		04/03/2002	Single threaded lts
 *  035	MGS		04/11/2002	ARM7 port
 *  036 MFG		07/10/2002	Merged into code changes needed for the Mitsubishi CE/SH4 Project
 *  036	MGS		07/16/2002	Added Fonix dictionary startup
 *	037	CAB		07/30/2002	Condense repeated __osf__ code
 *  038 MGS		02/14/2003	Added EPSON_ARM7 stuff
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

#if defined __linux__  || defined VXWORKS || defined _SPARC_SOLARIS_
#define HWND unsigned int
#include "dtmmedefs.h"
#endif

#ifndef ARM7
#include "opthread.h"   /*Platform-independent Threads implementation header file*/
#include "playaud.h"
#endif

/* GL 04/21/1997  add this as the latest OSF code */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
typedef  HPLAY_AUDIO_T  LPAUDIO_HANDLE_T;
#endif

#ifdef OLEDECTALK       //MVP: For OLE-DECTalk
#include "audioapi.h"
#endif

#ifdef SAPI5DECTALK
#include "sapiiont.h"
#endif

#include "kernel.h"     /* Added for PKSD_T declaration MI :MVP */

#ifndef ACI_LICENSE		//tek 01may97
#ifdef DTALK50          // Used only in DTalk5.0+  KSB
#include "cpapi.h"      // Control Panel API functions
#endif
#endif	//ACI_LICENSE

/* DECtalk Version Numbers moved to coop.h: 11/22/96 CJL */
#include "coop.h"
#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
/* externs for global variables :MVP   */
extern volatile int gnInstanceCounter;
#ifndef ARM7
extern TLOCK tl_gnInstanceCounter; // tek 27may98
#endif
#endif

extern int *gpufdic_index;
extern unsigned char *gpufdic_data;
extern S32 gufdic_entries;
extern S32 gufdic_bytes;
extern DT_HANDLE gufdicMapObject;
extern DT_HANDLE gufdicFileHandle;
extern LPVOID gufdicMapStartAddr;
extern S32 *gufdic_fc_entry;
extern S32 gufdic_fc_entries;

extern int *gpufordic_index;
extern unsigned char *gpufordic_data;
extern S32 gufordic_entries;
extern S32 gufordic_bytes;
extern DT_HANDLE gufordicMapObject;
extern DT_HANDLE gufordicFileHandle;
extern LPVOID gufordicMapStartAddr;

/* GL 04/21/1997  add this as the latest OSF code */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
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
#define  STATE_OUTPUT_SAPI5			5

/**********************************************************************/
/*  Structure for the Wave audio file header.                         */
/*  The following structure is defined in section 8-40 of the         */
/*  Microsoft Windows Multimedia Programmers Reference. 1991          */
/*  There is an additiona undocumented 32 bit word that had to be     */
/*  added to make the files formats match the examples.               */
/**********************************************************************/
#ifndef ARM7

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

typedef struct AU_FILE_HDR_TAG
{
  char magic[4];
  DWORD hdr_size;
  DWORD data_size;
  DWORD encoding;
  DWORD sample_rate;
  DWORD channels;
  char comment[8];
} AU_FILE_HDR_T;

typedef AU_FILE_HDR_T * LPAU_FILE_HDR_T;

#define AU_HEADER_OFFSET  32
#endif
/* GL 04/21/1997  add this as the latest OSF code */
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_  || defined (NOWIN)
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

#ifdef ARM7
typedef unsigned int UINT;
typedef unsigned char BOOL;
typedef unsigned short WORD;
typedef long LONG;
#endif

struct TTS_HANDLE_TAG
{
#ifndef ARM7
  HWND hWnd;
  HWND hTextToSpeechWnd;
#endif
  PKSD_T   pKernelShareData;       /* Added for Multiple instance speech objects: MVP*/
  PVOID    pCMDThreadData  ;       /* Instance specific CMD thread data */
  PVOID    pLTSThreadData  ;       /* Instance specific LTS thread data */
  PVOID    pVTMThreadData  ;       /* Instance specific VTM thread data */
  PVOID    pPHThreadData   ;       /* Instance specific PH thread data */
#ifdef WIN32
  DT_HANDLE   hMallocSuccessEvent;    /* Event handle to report successful memory allocations */
  DT_HANDLE   hThread_TXT;
  DT_HANDLE hThread_CMD;
#ifndef SINGLE_THREADED
  DT_HANDLE hThread_LTS;
  DT_HANDLE hThread_PH;
  DT_HANDLE hThread_VTM;
#endif
  DT_HANDLE hThread_SYNC;
  DT_HANDLE hSyncEvent;
  DT_HANDLE hNotEmptyingVtmPipeEvent;
#endif // WIN32

/* GL 04/21/1997  add this as the latest OSF code */
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
  HEVENT_T hMallocSuccessEvent;    /* Event handle to report successful memory allocations */
  HTHREAD_T hThread_TXT;
  HTHREAD_T hThread_CMD;
#ifndef SINGLE_THREADED
  HTHREAD_T hThread_LTS;
  HTHREAD_T hThread_PH;
  HTHREAD_T hThread_VTM;
#endif
  HTHREAD_T hThread_SYNC;
  HEVENT_T hSyncEvent;
  HEVENT_T hNotEmptyingVtmPipeEvent;
  HEVENT_T hTextInQueueEvent;
  UINT uiTextThreadExit;
  UINT uiThreadError;
/* MGS 09/15/1997 removed bInReset from osf/linux only */
#endif

#ifdef DEMO_NOISE
  int char_count;
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
  UINT uiID_Sentence_Message;
  UINT uiFullRangeMarks;
  DWORD dwDeviceOptions;
  DWORD dwFileSampleCount;
  DWORD dwQueuedSampleCount;
  DWORD dwFormat;
  volatile DWORD dwOutputState;
  BOOL bEnableErrorMessage;
  BOOL bMemoryReset;
  BOOL bSendingBuffer;

#ifndef ARM7
  LPWAVE_FILE_HDR_T pWaveFileHdr;
  LPAU_FILE_HDR_T pAuFileHdr;
#ifdef UNDER_CE	// must be a handle for Windows CE
  DT_HANDLE pWaveFile;
  DT_HANDLE pLogFile;
#else
  FILE * pWaveFile;
  FILE * pLogFile;
#endif
#endif // ARM7

  void * pTTS_Buffer;

#ifdef ARM7
#ifndef EPSON_ARM7
  short *(*EmbCallbackRoutine)(short *,S32);     
#endif
  short *output_buffer;
#ifdef EPSON_ARM7
  int TTP_return_code;
  S16 TTP_phoneme_buf_len;
  S16 *TTP_phoneme_buf;
  S16 PTS_phoneme_buf_len;
  S16 *PTS_phoneme_buf;
  int PTS_return_code;
  int TTP_return;
  int PTS_return;
  int PTS_location;
  int PTS_input_pos;
  int PTS_special_change;
  void (*main_lts_loop)(void *,unsigned short *);     
#endif
#else
  void (*DtCallbackRoutine)(LONG,LONG,DWORD,UINT);     //New Audio Integration :After testing remove these comments
#endif

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
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
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

#ifdef NOWIN
  HEVENT_T hTextInQueueEvent;
  UINT uiTextThreadExit;
  UINT uiThreadError;
  HMUTEX_T pcsTextMsgList;
  LPTEXT_MSG_T pTextMsgList; /* A linked list of text messages */
#endif

#ifndef ARM7
  LPAUDIO_HANDLE_T pAudioHandle;
#endif

#ifndef ACI_LICENSE
#ifdef DTALK_50
  LPCPTHREAD CPanelThread;
#endif
#ifdef TYPING_MODE
		volatile BOOL					bInTypingMode;
		WORD							wTypingFrameCount;
#endif /* TYPING_MODE */
#endif /* ACI_LICENSE */

#ifdef SAPI5DECTALK
		void *CTTSEngObj;
		int OutputIsText;
		volatile int SkippingForward;
#endif
  /* bats 385 */
#ifndef ARM7
  volatile BOOL	bInReset; /* volatile cuz we use it for interprocess comm */
  volatile char *szPhonemeBuffer;		// where ConvertToPhonemes puts the phonemes
								// uses NULL status to tell not to do it
  volatile DWORD dwPhonemeBufferSize;	// how big it is
  volatile DWORD dwPhonemeBufferPtr;		// where we are
  volatile DWORD dwPhonemeCvtFlags;		// how to do it.

  HEVENT_T hTuneStopEvent;
  int a32_lic;
  int bisau;
#endif

#ifdef WIN32
  TCHAR dictionary_file_name[500];
#else
  char dictionary_file_name[500];
#endif
  int last_syl;
};

/**********************************************************************/
/*  Define the audio sample type                                      */
/**********************************************************************/

#ifndef ARM7
typedef short SAMPLE_T;

typedef SAMPLE_T * LPSAMPLE_T;

// tek 04aug97 sapi fixes
// these data structures are used to transport the info we need
// to do notifications
//#ifdef WIN32 for all now
typedef struct VISUAL_DATA_STRUCT
{
	QWORD	qTimeStamp;
	DWORD	dwPhoneme;
	DWORD	dwNextPhoneme;
	DWORD	dwDuration;
	DWORD	dwHints;
	char	cEnginePhoneme;
	char	cNextEnginePhoneme;
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

//#endif //WIN32
// end of sapi fixes
#endif // ARM7
/**********************************************************************/
/*  Define the API interface.                                         */
/**********************************************************************/

#include "ttsapi.h"

/**********************************************************************/
/*  Function proto-types for internal DECtalk functions.              */
/*  (Functions WriteAudioToFile() and QueueInMemory() are included    */
/*  directly in the Vocal Tract Model task in file vtmiont.c.         */
/**********************************************************************/
#ifndef ARM7

void TextToSpeechErrorHandler( LPTTS_HANDLE_T,
							   UINT,
							   MMRESULT );

/* MVP : This fucntion is become now obsolete 
LPTTS_HANDLE_T TextToSpeechGetHandle(void);
*/
#ifdef WIN32
void Report_TTS_Status( LPTTS_HANDLE_T ttsHandle, UINT uiMsg, long lParam1, long lParam2);
#endif

/* GL 04/21/1997  add this as the latest OSF code */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
void Report_TTS_Status( LPTTS_HANDLE_T phTTS, UINT uiMsg, long lParam1, long lParam2);
#endif

void QueueToMemory( LPTTS_HANDLE_T, LPSAMPLE_T, DWORD );

void SendBuffer( LPTTS_HANDLE_T );

MMRESULT WaitForLtsFlush( LPTTS_HANDLE_T, DWORD );

void EmptyVtmPipe(PKSD_T);

#ifdef PRINTFDEBUG
void WINprintf(char *fmt, ...);
#endif

#endif // ARM7

#endif // _TTS_H_

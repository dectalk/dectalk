/************************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1995, 1998. All rights reserved.
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
 *    File Name:        ttsapi.h
 *    Author:           Bill Hallahan
 *    Creation Date:    
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 *  Rev Name    Date			Description
 *  --- -----   -----------		--------------------------------------------
 *  001 CJL		03/11/1996      Made C++ enabled.1111111 
 *  002 GL      04/21/1997      BATS#357  Add the code for __osf__ build
 *  003 CJL     04/16/1997      Define DTALK_HELP_FILE_NAME
 *  004 KSB     09/05/1997      Add ML code into system
 *  005 KSB     09/15/1997  	Add new version info junk
 *  006 KSB     09/16/1997  	Add new lang enumerator info junk
 *  007 GL      09/24/1997      for BATS#470 add LDS_BUILD Add switch
 *  008 MGS     09/30/1997      Made type of VersionEx DWORD
 *  00x tek     11/13/1997      bats404: new index types (was aug97)
 *  010 MFG     01/20/1998      Moved TextToSpeechVersion() to  be included in __osf__ build
 *  011 MFG     01/20/1998      changed TextToSpeechVersion() to DWORD type
 *  012 tek     01/07/1998      bats546: DAPI visual union
 *  013 cjl     02/04/1998      OSF dif for UNIX.
 *  014 MGS     02/02/1998      Fixed bad #pragma pack for UNIX
 *  015 CJL     02/10/1998      Changed to dectalk.hlp files.
 *  016 MGS     02/12/1998      Fixed case of __osf__
 *  017 JAW     04/06/1998      Created SPDEFS data structure.  Defined function
 *                              prototypes for TextToSpeechGetSpeakerParams and
 *                              TextToSpeechSetSpeakerParams.
 *  018	MGS	    04/23/1998		Fixed weird problem with ML and SPDESF with a sledge hammer
 *  019 JAW     04/27/1998      Added glottal speed to SPDEFS structure.
 *  020 JL      05/01/1998		BATS#657 Fix Access32 char to unsigned to handle ASCII code > 128
 *								For TextToSpeechTyping in Access32 	
 *	021 JAW		07/07/1998		Added dic_entry structure.  Added functions prototypes
 *								for TextToSpeechDictionaryHit,
 *								TextToSpeechDumpDictionary,
 *								TextToSpeechUserDictionaryHit,
 *								TextToSpeechDumpUserDictionary,
 *								TextToSpeechAddUserEntry, TextToSpeechDeleteUserEntry,
 *								and TextToSpeechChangeUserPhoneme. 
 *	022	JAW		08/07/1998		Added function prototype for
 *								TextToSpeechSaveUserDictionary.
 *  023	tek		08/19/1998		prototype for TextToSpeechConvertToPhonemes
 *  024 ETT     10/05/1998      added linux code
 *	025	mfg		10/15/1998		added WINDOWS CE support for TextToSpeechSpeak and TextToSpeechOpenWavaFile
 *  026 jhu     10/20/1998      added WINDOWS CE support for TextToSpeechOpenLogFile 
 *  027 ETT		11/12/1998		fixed stuff for osf.
 *	028	mfg		01/10/1999		added WINDOWS CE support for multilanguage
 *	029	mfg		10/29/1999		added WINDOWS CE support for TextToSpeechLoadUserDictionary
 *	030 NAL		01/24/2000		added function prototype TextToSpeechGetPhVdefParams
 *  031 mfg		04/24/2000		add function protoype TextToSpeechReserved3 for ce windic
 *								FOR INTERNAL USE ONLY
 * 032	MGS		07/14/2000		Sapi 5 additions
 * 033	MGS		07/20/2000		More Sapi 5 stuff
 * 034 	CAB		10/16/2000		Changed copyright info
 * 033	MFG		02/20/2001		TextToSpeechConvertToPhonemes prototype changed szText type 
 *								for Windows CE 
 * 034	MGS		02/28/2001		Added Volume attenuator
 * 035	MGS		03/27/2001		Add Visual marks for unix...
 * 036	CAB		03/28/2001		Updated copyright info
 * 037	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 038	MGS		06/19/2001		Solaris Port BATS#972
 * 039	MGS		04/11/2002		ARM7 port
 * 040  MFG		07/10/2002		Merged into code changes needed for the Mitsubishi CE/SH4 Project
 * 041	CAB		04/08/2002		Fixed struct VERSION_INFO for Windows CE 
 * 042	MGS		07/16/2002		Added Fonix dictionary startup
 * 043	CAB		08/29/2002		Added defines COPYRIGHT_COMPANY & COPYRIGHT_DATE
 *								to auto update
 * 044	MFG		09/19/2002	 	Added support for new chris voice
 **********************************************************************/

#ifndef _TTSAPI_H_

#define _TTSAPI_H_

#ifdef ARM7
#define  OWN_AUDIO_DEVICE         0x00000001
#define  REPORT_OPEN_ERROR        0x00000002
#define  USE_SAPI5_AUDIO_DEVICE   0x40000000
#define  DO_NOT_USE_AUDIO_DEVICE  0x80000000

#define MMSYSERR_BASE         0
#define MMSYSERR_NOERROR      0                    /* no error */
#define MMSYSERR_ERROR        (MMSYSERR_BASE + 1)  /* unspecified error */
#define MMSYSERR_BADDEVICEID  (MMSYSERR_BASE + 2)  /* device ID out of range */
#define MMSYSERR_NOTENABLED   (MMSYSERR_BASE + 3)  /* driver failed enable */
#define MMSYSERR_ALLOCATED    (MMSYSERR_BASE + 4)  /* device already allocated */
#define MMSYSERR_INVALHANDLE  (MMSYSERR_BASE + 5)  /* device handle is invalid */
#define MMSYSERR_NODRIVER     (MMSYSERR_BASE + 6)  /* no device driver present */
#define MMSYSERR_NOMEM        (MMSYSERR_BASE + 7)  /* memory allocation error */
#define MMSYSERR_NOTSUPPORTED (MMSYSERR_BASE + 8)  /* function isn't supported */
#define MMSYSERR_BADERRNUM    (MMSYSERR_BASE + 9)  /* error value out of range */
#define MMSYSERR_INVALFLAG    (MMSYSERR_BASE + 10) /* invalid flag passed */
#define MMSYSERR_INVALPARAM   (MMSYSERR_BASE + 11) /* invalid parameter passed */
#define MMSYSERR_HANDLEBUSY   (MMSYSERR_BASE + 12) /* handle being used */
                                                   /* simultaneously on another */
                                                   /* thread (eg callback) */
#define MMSYSERR_INVALIDALIAS (MMSYSERR_BASE + 13) /* "Specified alias not found in WIN.INI */
#define MMSYSERR_LASTERROR    (MMSYSERR_BASE + 13) /* last error in range */


#include "tts.h"

#if defined (BLD_DECTALK_DLL) || defined (LDS_BUILD)
typedef struct TTS_HANDLE_TAG TTS_HANDLE_T;

typedef TTS_HANDLE_T * LPTTS_HANDLE_T;
#else
typedef void * LPTTS_HANDLE_T;
#endif

#else // ARM7

#if defined __sun && defined __sparc
#ifndef _SPARC_SOLARIS_
#define _SPARC_SOLARIS_
#endif
#ifndef _BIGENDIAN_
#define _BIGENDIAN_
#endif
#endif // defined __sun && defined __sparc

#ifdef __cplusplus
extern "C" {
#endif

/**********************************************************************/
/*  Wave File Format Definitions for function                         */
/*  TextToSpeechOpenWaveOutFile(). Other formats are contained in     */
/*  include file mmsystem.h.                                          */
/**********************************************************************/
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include "dtmmedefs.h"
#endif

/* GL 04/21/1997  add this as the latest OSF code */
/* I don't think we use this yet */
#ifndef BLD_DECTALK_DLL

#ifdef _WIN32
#ifndef CUP28PROJECT
#include <mmreg.h>
#endif /* CUP28PROJECT */
#endif /* _WIN32 */

#ifdef __osf__
#ifndef H_MMBASIC
#include <mme/mmbasic.h>
#include <mme/mmsystem.h>
#endif
#endif // _osf_

#ifdef __VMS
#ifndef H_MMBASIC
#include <mmbasic.h>
#include <mmsystem.h>
#endif
#endif // _VMS

#endif /* BLD_DECTALK_DLL */

/**********************************************************************/
/*                                                                    */
/*         ASYNCHRONOUS ERROR MESSAGES.                               */
/*                                                                    */
/*       After function TextToSpeechSpeak() is called, the Text-To-   */
/*  Speech system may send messages to the window procedure specified */
/*  by the window handle passed in function TextToSpeechStartup().    */
/*  Three messages are defined, one for errors, one for index marks,  */
/*  and one to return memory buffered speech samples blocks when      */
/*  using function TextToSpeechOpenInMemory().                        */
/*                                                                    */
/*       The error message number is obtained by the following call   */
/*  to the Window NT[TM] Operating System function                    */
/*  RegisterWindowsMessage().                                         */
/*                                                                    */
/*  uiID_Error_Msg = RegisterWindowMessage("DECtalkErrorMessage").    */
/*                                                                    */
/*       One of the error codes listed below will be contained in     */
/*  the WPARAM message parameter. The LPARAM message parameter will   */
/*  contain a value of type MMRESULT.                                 */
/*                                                                    */
/*                                                                    */
/*       The message value for index marks is obtained as shown:      */
/*                                                                    */
/*  uiID_Index_Msg = RegisterWindowMessage("DECtalkIndexMessage").    */
/*                                                                    */
/*       The LPARAM message parameter contains the index mark value.  */
/*                                                                    */
/*                                                                    */
/*       The message value for buffered speech samples is obtained    */
/*  as shown:                                                         */
/*                                                                    */
/*  uiID_Buffer_Msg = RegisterWindowMessage("DECtalkBufferMessage").  */
/*                                                                    */
/*       The LPARAM message parameter contains the address of a       */
/*  structure which contains the buffered speech parameters. See      */
/*  DECtalk Help for more information.                                */
/*                                                                    */
/*  Windows NT is a registered trademark of the Microsoft Corporation */
/*                                                                    */
/**********************************************************************/

#define  ERROR_IN_AUDIO_WRITE                  1
#define  ERROR_OPENING_WAVE_OUTPUT_DEVICE      2
#define  ERROR_GETTING_DEVICE_CAPABILITIES     3
#define  ERROR_READING_DICTIONARY              4
#define  ERROR_WRITING_FILE                    5
#define  ERROR_ALLOCATING_INDEX_MARK_MEMORY    6
#define  ERROR_OPENING_WAVE_FILE               7
#define  ERROR_BAD_WAVE_FILE_FORMAT            8
#define  ERROR_UNSUPPORTED_WAVE_FILE_FORMAT    9
#define  ERROR_UNSUPPORTED_WAVE_AUDIO_FORMAT  10
#define  ERROR_READING_WAVE_FILE              11
#define  TTS_AUDIO_PLAY_START                 12   //Added for new_Audio Integ
#define  TTS_AUDIO_PLAY_STOP                  13   //Added for new_Audio Integ
#define  TTS_INDEX_MARK                       14   //Added for new index marking
#define  TTS_INDEX_BOOKMARK                                     (15) // tek bats 404 01aug97
#define  TTS_INDEX_WORDPOS                                      (16) // tek bats 404 01aug97
#define  TTS_INDEX_START                                        (17) // tek bats 404 01aug97
#define  TTS_INDEX_STOP                                         (18) // tek bats 404 01aug97


/**********************************************************************/
/*  Waveform output device management symbols for function            */
/*  TextToSpeechStartup().                                            */
/**********************************************************************/

#define  OWN_AUDIO_DEVICE         0x00000001
#define  REPORT_OPEN_ERROR        0x00000002
#define  USE_SAPI5_AUDIO_DEVICE   0x40000000
#define  DO_NOT_USE_AUDIO_DEVICE  0x80000000
// tek 13nov97 a special flag to tell us we're using the default callback
#define TTSSTARTUP_USING_DEFAULT_CALLBACK       0x08000000

#define WAVE_FORMAT_NULL		0xC4000000

/**********************************************************************/
/*  Speaker Definitions for functions TextToSpeechGetSpeaker() and    */
/*  TextToSpeechSetSpeaker.                                           */
/**********************************************************************/

#define  PAUL    0
#define  BETTY   1
#define  HARRY   2
#define  FRANK   3
#define  DENNIS  4
#define  KIT     5
#define  URSULA  6
#define  RITA    7
#define  WENDY   8


/**********************************************************************/
/*  Symbol Definitions for function TextToSpeechSpeak() for parameter */
/*  dwFlags.                                                          */
/**********************************************************************/

#define  TTS_NORMAL  0
#define  TTS_FORCE   1

/* GL 04/21/1997  add this as the latest OSF code */
#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_  || defined (CUP28PROJECT)
/**********************************************************************/
/*  Symbol Definitions for callback message type                      */
/**********************************************************************/
#define  TTS_MSG_BUFFER  9
#define  TTS_MSG_INDEX_MARK  1
#define  TTS_MSG_STATUS  2
#define  TTS_MSG_VISUAL  3

#ifdef UNDER_CE
#define  TTS_MSG_BOOKMARK 4
#define  TTS_MSG_WORDPOS  5
#define  TTS_MSG_START    6
#define  TTS_MSG_STOP     7
#define  TTS_MSG_SENTENCE 8
#endif

#endif

// tek 20aug98 flags for dwCvtFlags arg to ConvertToPhonemes
#define TTS_SILENT			(0x2)

/**********************************************************************/
/*  Identifier Definitions for function TextToSpeechStatus().         */
/**********************************************************************/

#define  INPUT_CHARACTER_COUNT     0
#define  STATUS_SPEAKING           1
#define  WAVE_OUT_DEVICE_ID        2

/**********************************************************************/
/*  Identifier Definitions for function TextToSpeechOpenLogFile().    */
/**********************************************************************/

#define  LOG_TEXT        0x0001
#define  LOG_PHONEMES    0x0002
#define  LOG_SYLLABLES   0x0010

/**********************************************************************/
/*  Language Definitions.  These are passed to function               */
/*  TexttToSpeechSetLanguage() and returned by functions              */
/*  TextToSpeechGetLanguage() and TextToSpeechGetCaps().              */
/**********************************************************************/

#define  TTS_AMERICAN_ENGLISH  1

/**********************************************************************/
/*  Language Attributes.                                              */
/**********************************************************************/

#define  PROPER_NAME_PRONUNCIATION  0x00000001

/**********************************************************************/
/*  Help File Name Definitions.                                       */
/*  Used in: dtmemory.c, dtsample.c, windic.c, speak.c, speakmul.c    */
/**********************************************************************/

#define DTALK_HELP_FILE_NAME    "dectalk.hlp"
#define COPYRIGHT_COMPANY		"Fonix Corporation"
#define COPYRIGHT_DATE			"2001-2002"

/**********************************************************************/
/*  Type Definitions.                                                 */
/**********************************************************************/

typedef DWORD SPEAKER_T;
typedef SPEAKER_T * LPSPEAKER_T;

typedef DWORD LANGUAGE_T;
typedef LANGUAGE_T * LPLANGUAGE_T;

/**********************************************************************/
/*  These structure definitions are used exclusively for function     */
/*  TextToSpeechGetCaps().                                            */
/**********************************************************************/

#define  TTS_ASCII    0
#define  TTS_UNICODE  1

typedef struct LANGUAGE_PARAMS_TAG
{
  LANGUAGE_T dwLanguage;
  DWORD dwLanguageAttributes;
} LANGUAGE_PARAMS_T;

typedef LANGUAGE_PARAMS_T * LPLANGUAGE_PARAMS_T;

typedef struct TTS_CAPS_TAG
{
  DWORD dwNumberOfLanguages;
  LPLANGUAGE_PARAMS_T lpLanguageParamsArray;
  DWORD dwSampleRate;
  DWORD dwMinimumSpeakingRate;
  DWORD dwMaximumSpeakingRate;
  DWORD dwNumberOfPredefinedSpeakers;
  DWORD dwCharacterSet;
  DWORD Version;
} TTS_CAPS_T;

typedef TTS_CAPS_T * LPTTS_CAPS_T;

/**********************************************************************/
/*  Structure used for speech to memory. This is used by functions    */
/*  TextToSpeechAddBuffer() and TextToSpeechReturnBuffer().           */
/**********************************************************************/

typedef struct TTS_PHONEME_TAG
{
  DWORD dwPhoneme;
  DWORD dwPhonemeSampleNumber;
  DWORD dwPhonemeDuration;
  DWORD dwReserved;
} TTS_PHONEME_T;

typedef TTS_PHONEME_T * LPTTS_PHONEME_T;


typedef struct TTS_INDEX_TAG
{
  DWORD dwIndexValue;
  DWORD dwIndexSampleNumber;
  DWORD dwReserved;
} TTS_INDEX_T;

typedef TTS_INDEX_T * LPTTS_INDEX_T;


typedef struct TTS_BUFFER_TAG
{
  LPSTR lpData;
  LPTTS_PHONEME_T lpPhonemeArray;
  LPTTS_INDEX_T lpIndexArray;
  DWORD dwMaximumBufferLength;
  DWORD dwMaximumNumberOfPhonemeChanges;
  DWORD dwMaximumNumberOfIndexMarks;
  DWORD dwBufferLength;
  DWORD dwNumberOfPhonemeChanges;
  DWORD dwNumberOfIndexMarks;
  DWORD dwReserved;
} TTS_BUFFER_T;

typedef TTS_BUFFER_T * LPTTS_BUFFER_T;

// tek 07jan98 bats 546 
/**********************************************************************/
/* structure used to hold the pieces of phoneme marks                 */
/**********************************************************************/
#ifdef WIN32
#pragma pack (push,phoneme_mark)
#endif

#pragma pack (1)
typedef struct {

#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	unsigned char cThisPhoneme;   // the current phoneme
	unsigned char cNextPhoneme;   // the next phoneme, if known
#else
	UCHAR         cThisPhoneme;   // the current phoneme
	UCHAR         cNextPhoneme;   // the next phoneme, if known
#endif

	WORD    wDuration;              // the duration in milliseconds
} PHONEME_MARK;

#define FULL_RANGE_MARKS 0xF011

typedef struct {

#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
	unsigned short cThisPhoneme;   // the current phoneme
	unsigned short cNextPhoneme;   // the next phoneme, if known
#else
	USHORT         cThisPhoneme;   // the current phoneme
	USHORT         cNextPhoneme;   // the next phoneme, if known
#endif

	WORD    wDuration;              // the duration in milliseconds
} PHONEME_MARK2;


typedef union {
	PHONEME_MARK pmData;
	DWORD dwData;
	PHONEME_MARK2 pmData2;
} PHONEME_TAG;
#pragma pack ()

#ifdef WIN32
#pragma pack (pop,phoneme_mark)
#endif

/**********************************************************************/
/*  Opaque structure for the Text-To-Speech handle.                   */
/**********************************************************************/
/* GL 09/24/1997 fro BATS#470 add LDS debug switch */
#if defined (BLD_DECTALK_DLL) || defined (LDS_BUILD)
typedef struct TTS_HANDLE_TAG TTS_HANDLE_T;

typedef TTS_HANDLE_T * LPTTS_HANDLE_T;
#else
typedef void * LPTTS_HANDLE_T;
#endif
/**********************************************************************/
/*  Wave File Format Definitions for function                         */
/*  TextToSpeechOpenWaveOutFile(). Other formats are contained in     */
/*  include file mmsystem.h.                                          */
/**********************************************************************/

#ifdef WIN32
#define WAVE_FORMAT_08M16 0x00002000
#ifndef BLD_DECTALK_DLL
#ifndef CUP28PROJECT
#include <mmreg.h>
#define WAVE_FORMAT_08M08 WAVE_FORMAT_MULAW
/**********************************************************************/
/*   If you are developing with other than MicroSoft's SDK,           */
/*   you may need to comment out the above #include and #define       */
/*   statements and uncomment the #define below for WAVE_FORMAT_08M08.*/
/*   If MicroSoft changes the defined value of WAVE_FORMAT_08M08, then*/
/*   the line below will require the changed value. The value as of   */
/*   26-JUN-1996 is 0x0007.                                           */
/**********************************************************************/
/*
 #define  WAVE_FORMAT_08M08  0x0007
*/
#endif
#endif 
#endif

/* GL 04/21/1997  add this as the latest OSF code */
#if defined (__osf__) /* don't put linux here */
#undef WAVE_FORMAT_08M08
#ifdef WAVE_FORMAT_MULAW
#define WAVE_FORMAT_08M08 WAVE_FORMAT_MULAW
#define WAVE_FORMAT_08M16 0x00002000
/**********************************************************************/
/*   If you are developing with other than MicroSoft's SDK,           */
/*   you may need to comment out the above #include and #define       */
/*   statements and uncomment the #define below for WAVE_FORMAT_08M08.*/
/*   If MicroSoft changes the defined value of WAVE_FORMAT_08M08, then*/
/*   the line below will require the changed value. The value as of   */
/*   26-JUN-1996 is 0x0007.                                           */
/**********************************************************************/
#else
#define  WAVE_FORMAT_08M08  0x0007
#define WAVE_FORMAT_08M16 0x00002000
#endif
#endif // defined (__osf__)

/**********************************************************************/
/*  API function prototypes.                                          */
/**********************************************************************/

MMRESULT TextToSpeechStartupEx( LPTTS_HANDLE_T * pphTTS,
				UINT ,
				DWORD ,
				VOID (*DtCallbackRoutine)(LONG,
							  LONG,
							  DWORD,
							  UINT),
				LONG );

MMRESULT TextToSpeechStartupExFonix( LPTTS_HANDLE_T * pphTTS,
				UINT ,
				DWORD ,
				VOID (*DtCallbackRoutine)(LONG,
							  LONG,
							  DWORD,
							  UINT),
				LONG,
#ifdef WIN32
				TCHAR *
#else
				char * 
#endif
				);
/* GL 04/21/1997  add this as the latest OSF code */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
MMRESULT TextToSpeechStartup( LPTTS_HANDLE_T * pphTTS,
			      UINT ,
			      DWORD ,
			      VOID (*DtCallbackRoutine)(LONG,
							LONG,
							DWORD,
							UINT),
			      LONG );
#endif

#ifdef WIN32
MMRESULT TextToSpeechStartup( HWND, LPTTS_HANDLE_T *, UINT, DWORD );
#endif

MMRESULT TextToSpeechShutdown( LPTTS_HANDLE_T );

#ifdef UNDER_CE
MMRESULT TextToSpeechSpeak( LPTTS_HANDLE_T, LPTSTR, DWORD );
#else
MMRESULT TextToSpeechSpeak( LPTTS_HANDLE_T, LPSTR, DWORD );
#endif

MMRESULT TextToSpeechPause( LPTTS_HANDLE_T );

MMRESULT TextToSpeechResume( LPTTS_HANDLE_T );

#ifdef UNDER_CE
MMRESULT TextToSpeechOpenWaveOutFile( LPTTS_HANDLE_T, wchar_t *, DWORD );
#else
MMRESULT TextToSpeechOpenWaveOutFile( LPTTS_HANDLE_T, char *, DWORD );
#endif

MMRESULT TextToSpeechCloseWaveOutFile( LPTTS_HANDLE_T );

MMRESULT TextToSpeechGetStatus( LPTTS_HANDLE_T, LPDWORD, LPDWORD, DWORD );

MMRESULT TextToSpeechReset( LPTTS_HANDLE_T, BOOL );

MMRESULT TextToSpeechSync( LPTTS_HANDLE_T );

MMRESULT TextToSpeechGetRate( LPTTS_HANDLE_T, LPDWORD );

MMRESULT TextToSpeechSetRate( LPTTS_HANDLE_T, DWORD );

MMRESULT TextToSpeechGetSpeaker( LPTTS_HANDLE_T, LPSPEAKER_T );

MMRESULT TextToSpeechSetSpeaker( LPTTS_HANDLE_T, SPEAKER_T );

MMRESULT TextToSpeechGetLanguage( LPTTS_HANDLE_T, LPLANGUAGE_T );

MMRESULT TextToSpeechSetLanguage( LPTTS_HANDLE_T, LANGUAGE_T );

MMRESULT TextToSpeechGetCaps( LPTTS_CAPS_T );

#ifdef UNDER_CE
MMRESULT TextToSpeechLoadUserDictionary( LPTTS_HANDLE_T, LPTSTR );
#else
MMRESULT TextToSpeechLoadUserDictionary( LPTTS_HANDLE_T, LPSTR );
#endif

MMRESULT TextToSpeechUnloadUserDictionary( LPTTS_HANDLE_T );

MMRESULT TextToSpeechOpenInMemory( LPTTS_HANDLE_T, DWORD );

MMRESULT TextToSpeechCloseInMemory( LPTTS_HANDLE_T );

MMRESULT TextToSpeechAddBuffer( LPTTS_HANDLE_T, LPTTS_BUFFER_T );

MMRESULT TextToSpeechReturnBuffer( LPTTS_HANDLE_T, LPTTS_BUFFER_T * );
#ifdef UNDER_CE
MMRESULT TextToSpeechOpenLogFile( LPTTS_HANDLE_T, LPTSTR, DWORD );
#else
MMRESULT TextToSpeechOpenLogFile( LPTTS_HANDLE_T, LPSTR, DWORD );
#endif
MMRESULT TextToSpeechCloseLogFile( LPTTS_HANDLE_T );

/* GL 04/21/1997  add this as the latest OSF code */
#ifdef WIN32
VOID TextToSpeechControlPanel( LPTTS_HANDLE_T );
#ifdef UNDER_CE
ULONG TextToSpeechVersion(LPTSTR* VersionStr);
void TextToSpeechTyping(LPTTS_HANDLE_T phTTS, wchar_t key);  //BATS#657
#else
ULONG TextToSpeechVersion(LPSTR* VersionStr);
void TextToSpeechTyping(LPTTS_HANDLE_T phTTS, unsigned char key);  //BATS#657
#endif
ULONG TextToSpeechGetLastError(LPTTS_HANDLE_T phTTS);
#endif

MMRESULT TextToSpeechOpenSapi5Output( LPTTS_HANDLE_T phTTS,
									  void *pSapiEngine,
								  	  DWORD dwFormat);

MMRESULT TextToSpeechCloseSapi5Output( LPTTS_HANDLE_T phTTS );

MMRESULT TextToSpeechSetVolume( LPTTS_HANDLE_T phTTS,int type, int volume);
MMRESULT TextToSpeechGetVolume( LPTTS_HANDLE_T phTTS,int type, int *volume);

#define VOLUME_MAIN			1
#define VOLUME_ATTENUATION  2


#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
/* ML add-ons */
#ifdef UNDER_CE
DWORD TextToSpeechVersion(LPTSTR* VersionStr);
#else
DWORD TextToSpeechVersion(LPSTR* VersionStr);
#endif

#ifdef UNDER_CE
unsigned int TextToSpeechStartLang(wchar_t *);
BOOL TextToSpeechCloseLang(wchar_t *);
#else
unsigned int TextToSpeechStartLang(char*);
BOOL TextToSpeechCloseLang(char*);
#endif

BOOL TextToSpeechSelectLang(LPTTS_HANDLE_T, unsigned int);
DWORD TextToSpeechGetFeatures(void);
#define TTS_NOT_SUPPORTED       0x7FFF
#define TTS_NOT_AVAILABLE       0x7FFE
#define TTS_LANG_ERROR          0x4000
#endif // defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

/* New LPVERSION_INFO structure data   KSB 15-SEP-97 */
/* DO NOT CHANGE THE ORDER OF VARIABLES HERE!!! ONLY ADD NEW ONES TO THE END!!! */
#define VERSION_STRUCT_VER              0x0001                                                  // KSB - Microsoft-style Structure Version Info

typedef struct {
	DWORD   StructSize;
	DWORD   StructVersion;
	WORD    DLLVersion;
	WORD    DTalkVersion;
#ifdef UNDER_CE
	LPTSTR	VerString;
	LPTSTR	Language;
#else
	LPSTR   VerString;
	LPSTR   Language;
#endif
	DWORD   Features;
} VERSION_INFO;

typedef VERSION_INFO* LPVERSION_INFO;

DWORD TextToSpeechVersionEx(LPVERSION_INFO *ver);

/* New LPLANG_ENUM structure data   KSB 16-SEP-97 */
#ifdef UNDER_CE
typedef struct {
	wchar_t lang_code[3];
	wchar_t lang_name[40];
} LANG_ENTRY;
#else
typedef struct {
	char lang_code[3];
	char lang_name[40];
} LANG_ENTRY;
#endif
typedef LANG_ENTRY* LPLANG_ENTRY;

typedef struct {
	DWORD           Languages;
	BOOL            MultiLang;
	LPLANG_ENTRY    Entries;
} LANG_ENUM;
typedef LANG_ENUM* LPLANG_ENUM;

DWORD TextToSpeechEnumLangs(LPLANG_ENUM *langs);

typedef struct SPDEFS_TAG {
	short sex;                /* Sex 1 (male) or 0 (female)                        */
	short smoothness;         /* Smoothness, in %                                  */
	short assertiveness;      /* Assertiveness, in %                               */
	short average_pitch;      /* Average pitch, in Hz                              */
	short pitch_range;        /* Pitch range, in %                                 */
	short breathiness;        /* Breathiness, in decibels (dB)                     */
	short richness;           /* Richness, in %                                    */
	short num_fixed_samp_og;  /* Number of fixed samples of open glottis           */
	short laryngealization;   /* Laryngealization, in %                            */
	short head_size;          /* Head size, in %                                   */
	short formant4_res_freq;  /* Fourth formant resonance frequency, in Hz         */
	short formant4_bandwidth; /* Fourth formant bandwidth, in Hz                   */
	short formant5_res_freq;  /* Fifth formant resonance frequency, in Hz          */
	short formant5_bandwidth; /* Fifth formant bandwidth, in Hz                    */
	short parallel4_freq;     /* Parallel fourth formant frequency, in Hz          */
	short parallel5_freq;     /* Parallel fifth formant frequency, in Hz           */
	short gain_frication;     /* Gain of frication source, in dB                   */
	short gain_aspiration;    /* Gain of aspiration source, in dB                  */
	short gain_voicing;       /* Gain of voicing source, in dB                     */
	short gain_nasalization;  /* Gain of nasalization, in dB                       */
	short gain_cfr1;          /* Gain of cascade formant resonator 1, in dB        */
	short gain_cfr2;          /* Gain of cascade formant resonator 2, in dB        */
	short gain_cfr3;          /* Gain of cascade formant resonator 3, in dB        */
	short gain_cfr4;          /* Gain of cascade formant resonator 4, in dB        */
	short loudness;           /* Loudness, gain input to cascade 1st formant in dB */
	short spectral_tilt;      /* (f0-dependent spectral tilt in % of max)frm 75 to 90 for 10to8 */
	short baseline_fall;      /* Baseline fall, in Hz                              */
	short lax_breathiness;    /* Lax breathiness, in %                             */
	short quickness;          /* Quickness, in %                                   */
	short hat_rise;           /* Hat rise, in Hz                                   */
	short stress_rise;        /* Stress rise, in Hz                                */
	short avg_glot_open;      /* Glottal speed                                     */
	short avg_glot_voicd_open;
	short avg_glot_unv_open;
	short area_chink;
	short open_quo;
	short output_gain_mult;   /* Output gain multiplier for FVTM                   */
	short junk;
	short junk1;
} SPDEFS;


short  *TextToSpeechGetPhVdefParams(LPTTS_HANDLE_T phTTS, UINT index);


MMRESULT TextToSpeechGetSpeakerParams(LPTTS_HANDLE_T phTTS, UINT uiIndex, SPDEFS **ppspCur,
									  SPDEFS **ppspLoLimit, SPDEFS **ppspHiLimit,
									  SPDEFS **ppspDefault);

MMRESULT TextToSpeechSetSpeakerParams(LPTTS_HANDLE_T phTTS, SPDEFS *pspSet);

#ifndef DIC_ENTRY
#define DIC_ENTRY
struct dic_entry
{
#ifdef CHEESY_DICT_COMPRESSION
   unsigned  char fc[1];
#else
#ifdef __osf__
   unsigned  int fc[1];
#else
   unsigned long  fc[1];
#endif
#endif
   unsigned char text[128];
};
#endif // DIC_ENTRY

int TextToSpeechDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);

MMRESULT TextToSpeechDumpDictionary(LPTTS_HANDLE_T phTTS, char *filename);

int TextToSpeechUserDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);

MMRESULT TextToSpeechDumpUserDictionary(LPTTS_HANDLE_T phTTS, char *filename);

MMRESULT TextToSpeechAddUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);

MMRESULT TextToSpeechDeleteUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);

MMRESULT TextToSpeechChangeUserPhoneme(LPTTS_HANDLE_T phTTS, struct dic_entry *entry, 
			 						   unsigned char *new_phoneme);

MMRESULT TextToSpeechSaveUserDictionary(LPTTS_HANDLE_T phTTS, char *filename);

MMRESULT TextToSpeechConvertToPhonemes(LPTTS_HANDLE_T phTTS,
									   unsigned char *szPhonemeBuf,
									   DWORD *dwBufSize,
									   DWORD dwOutPhonemeFlags,
#ifdef UNDER_CE
									   wchar_t *szText,	
#else
									   unsigned char *szText,
#endif /* UNDER_CE */
									   DWORD dwInTextFlags,
									   DWORD dwConversionFlags);

#ifdef __cplusplus
}       /* end extern "C" */
#endif

#endif // ARM7

#endif // _TTSAPI_H_
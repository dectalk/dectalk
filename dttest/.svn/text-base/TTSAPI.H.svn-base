/**********************************************************************/
/*                                                                    */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Digital Equipment Corporation. Possession, use,     */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Digital or an authorized          */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  This software is provided "as is" and without any express or      */
/*  implied warranties, including, without limitation, implied        */
/*  warranties of non-infringement, merchantibility or fitness        */
/*  for a particular purpose. Digital assumes no responsibility AT    */
/*  ALL for the use or reliability of this software.                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Include File: ttsapi.h                                            */
/*  Date: March 30, 1993                                              */
/*                                                                    */
/**********************************************************************/
/*                                                                    */
/*  Revision History                                                  */
/*  0001 CJL 11-MAR-96  Made C++ enabled.                             */
/*                                                                    */
/**********************************************************************/

#ifndef _TTSAPI_H_

#define _TTSAPI_H_

#ifdef __cplusplus
extern "C" {
#endif

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

/**********************************************************************/
/*  Waveform output device management symbols for function            */
/*  TextToSpeechStartup().                                            */
/**********************************************************************/

#define  OWN_AUDIO_DEVICE         0x00000001
#define  REPORT_OPEN_ERROR        0x00000002
#define  DO_NOT_USE_AUDIO_DEVICE  0x80000000

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

/**********************************************************************/
/*  Opaque structure for the Text-To-Speech handle.                   */
/**********************************************************************/

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
#ifndef BLD_DECTALK_DLL
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

MMRESULT TextToSpeechStartup( HWND, LPTTS_HANDLE_T *, UINT, DWORD );

MMRESULT TextToSpeechShutdown( LPTTS_HANDLE_T );

MMRESULT TextToSpeechSpeak( LPTTS_HANDLE_T, LPSTR, DWORD );

MMRESULT TextToSpeechPause( LPTTS_HANDLE_T );

MMRESULT TextToSpeechResume( LPTTS_HANDLE_T );

MMRESULT TextToSpeechOpenWaveOutFile( LPTTS_HANDLE_T, char *, DWORD );

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

MMRESULT TextToSpeechLoadUserDictionary( LPTTS_HANDLE_T, LPSTR );

MMRESULT TextToSpeechUnloadUserDictionary( LPTTS_HANDLE_T );

MMRESULT TextToSpeechOpenInMemory( LPTTS_HANDLE_T, DWORD );

MMRESULT TextToSpeechCloseInMemory( LPTTS_HANDLE_T );

MMRESULT TextToSpeechAddBuffer( LPTTS_HANDLE_T, LPTTS_BUFFER_T );

MMRESULT TextToSpeechReturnBuffer( LPTTS_HANDLE_T, LPTTS_BUFFER_T * );

MMRESULT TextToSpeechOpenLogFile( LPTTS_HANDLE_T, LPSTR, DWORD );

MMRESULT TextToSpeechCloseLogFile( LPTTS_HANDLE_T );

VOID TextToSpeechControlPanel( LPTTS_HANDLE_T );

ULONG TextToSpeechVersion(LPSTR* VersionStr);

void TextToSpeechTyping(LPTTS_HANDLE_T phTTS, char key);

ULONG TextToSpeechGetLastError(LPTTS_HANDLE_T phTTS);

#ifdef __cplusplus
}       /* end extern "C" */
#endif

#endif

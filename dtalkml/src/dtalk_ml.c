/*
 ***********************************************************************
 *                                                                      
 *                           Copyright (c)
 *
 *	  Copyright © 2002, 2001 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved.    
 *    © Digital Equipment Corporation 1997, 1998. All rights reserved.
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
 *    File Name:	dtalk_ml.c
 *    Author:		Kevin Bruckert                                         
 *    Creation Date:	9/14/1998                                             
 *                                                                             
 *    Functionality:                                                           
 *    The routines in this module will be used to check the dictionary
 *    search result of input word.
 *                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * MGS ddmmm97 		made change for __osf__ build
 * NCS 23oct97 		Fix ML for proper return value from TTSVersionEx()
 * KSB 09DEC97 		Fix TTSStartup for Artisoft. Multiple bugs found. Version updated accordingly
 * MGS 01jan98 		Added TextToSpeechResserved3 for windic ml support
 * KSB 02feb98 		Fixed thread-safing of DECtalk ML and fixed BATS report #581, #583, and #538
 * MGS 02feb98 		Ported thread-safing code to unix
 * JAW 07apr98 		Added code for TextToSpeechGetSpeakerParams and TextToSpeechSetSpeakerParams.
 * MGS 23apr98 		Fixed weird problem with SPDEFS with a sledge hammer
 * MGS 07may98 		BATS #663 fixed LANG_HANDLE, it was LPLANG_HANDLE 
 * MGS 22may98 		BATS #683 Fixed mutex problem with StartLang
 * MGS 28may98 		fixed problem with pids and mutexing.
 * JAW	07jul98		Added code for functions TextToSpeechDictionaryHit, TextToSpeechDumpDictionary,
 *					TextToSpeechUserDictionaryHit, TextToSpeechDumpUserDictionary,
 *					TextToSpeechAddUserEntry, TextToSpeechDeleteUserEntry, and
 *					TextToSpeechChangeUserPhoneme.
 * tek	26aug98		add TextToSpeechSaveUserDictionary and TestToSpeechConvertToPhonemes.
 * MGS	19nov98 	BATS #746 fixed version number to be the same as the rest of the code
 * ETT	24nov98		fixed includes for osf/linux
 * ETT	24nov98		fixed includes for linux ml
 * MGS	03dec98 	added TextToSpeechTuning
 * mfg  10jan99		added support for Windows CE multilanguage look for UNDER_CE
 * mfg	02apr99		fixed the multilang overloading problem in TextToSpeechEnumLangs
 * mfg	10may98		fixed typo on ine number 1357 
 * mgs	22aug99		changed '0' to  0 in memset
 * mgs	22aug99		Changed DigitalEquipmentCorporation to SMART Modular Technologies
 * mgs  11feb2000 	Added TextToSpeechGetPhVdefParams
 * cab	26oct2000	Added copyright and comments
 * mgs	26oct2000	Added (_cdecl*) as typedef to get x86em to build
 * mfg	07nov2000 	Added define for towupper for Emulator build 200 because of new compiler	
 * mgs	13feb2001	Changes for ipaq linux
 * mgs	26feb2001	ifdef printf for linux and tru64 to fix compile error
 * mgs  28feb2001	Added volume attenuator and base linux work for access32 merge
 * cab  01mar2001	Updated copyright info
 * mgs	27mar2001	Added TextToSpeechVisualMarks (doesn't work properly yet)
 * mgs	19jun2001	Solaris Port BATS#972
 * cab	30may2001	1. Changed TextToSpeechVersion to display version number
 *					2. Removed unused variables, typecast and changed TextToSpeechTyping(.., Unsigned char) 
 *                     to remove warnings
 * MGS	11jun2001	Changed #ifdef from UNDER_CE to WIN32 for warnings
 * cab	19mar2002	Added TextToSpeechReserved4(TextToSpeechReloadMainDictionary)
 * cab	14jun2002	Fixed TextToSpeechGetPhVdefParams() and TextToSpeechReserved()'s fns
 * cab	24jun2002	Added missing #ifdef UNDER_CE for api calls and changed return of TextToSpeechGetPhVdefParams()
 *					Removed warnings
 * cab	26jun2002	Reduced code
 * cab	31jul2002	Added TextToSpeechStartupExFonix
 * MGS	15jul2003	Fixed StartLang(NULL);
 **********************************************************************/

#include "port.h"
#ifdef WIN32
#include <windows.h>
#endif

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#if defined(_WIN32_WCE_EMULATION) && (UNDER_CE == 200)
_CRTIMP wchar_t __cdecl towupper(wchar_t);
#endif

#if defined _UNIX_LIKE_
#include <dlfcn.h>		
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>
#include "dtmmedefs.h"
#if defined __linux__ || defined _SPARC_SOLARIS_ || defined _APPLE_MAC_
#include "tts.h"
#include <ctype.h>
#endif // linux
#endif // defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS_


#include "ttsapi.h"
#include "ttsfeat.h"

#if defined _UNIX_LIKE_
typedef void* HMODULE;
#define ULONG unsigned int
#define UCHAR unsigned char
#define _cdecl
/* Library Controls */
#define LoadLibrary(path)            dlopen(path,RTLD_NOW)
//#define LoadLibrary(path)            dlopen(path,RTLD_LAZY)
#define GetProcAddress(handle,name)  dlsym(handle,name)
#define FreeLibrary(handle)          dlclose(handle)
/* PID Controls */
#define _getpid()	             getpid()
#endif

// MGS 19nov98 BATS #746 fixed version number to be the same as the rest of the code
#if defined _UNIX_LIKE_
#include "coop.h"
#else
#include "..\..\dapi\src\api\coop.h"
#endif

#ifdef WIN32
HANDLE hGreatLoadMutex = NULL;
HANDLE hGreaterPIDMutex = NULL;
HANDLE hGreatestInitMutex = NULL;
#endif

#if defined __osf__
extern pthread_mutex_t *hGreatLoadMutex;
extern pthread_mutex_t *hGreaterPIDMutex;
extern pthread_mutex_t *hGreatestInitMutex;
#define ReleaseMutex(x) pthread_mutex_unlock(x)
#endif

#if defined __linux__ || defined _SPARC_SOLARIS_ || defined _APPLE_MAC_
pthread_mutex_t GreatLoadMutex=PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t GreaterPIDMutex=PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t GreatestInitMutex=PTHREAD_MUTEX_INITIALIZER;

pthread_mutex_t *hGreatLoadMutex=&GreatLoadMutex;
pthread_mutex_t *hGreaterPIDMutex=&GreaterPIDMutex;
pthread_mutex_t *hGreatestInitMutex=&GreatestInitMutex;
#define ReleaseMutex(x) pthread_mutex_unlock(x)
#endif

// Struct to API function pointers
typedef struct lang_func_struct {
#if defined WIN32
	MMRESULT (*TextToSpeechStartup)( HWND, LPTTS_HANDLE_T *, UINT, DWORD );
#elif defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_
	MMRESULT (*TextToSpeechStartup)(LPTTS_HANDLE_T*, UINT, DWORD, VOID (*)(LONG,LONG,DWORD,UINT),LONG);
#else
#error "Supported only for Win32 or OSF"
#endif
	MMRESULT (*TextToSpeechShutdown)( LPTTS_HANDLE_T );

#ifdef UNDER_CE
	MMRESULT (*TextToSpeechLoadUserDictionary)( LPTTS_HANDLE_T, LPTSTR );
	MMRESULT (*TextToSpeechOpenLogFile)( LPTTS_HANDLE_T, LPTSTR, DWORD );
	MMRESULT (*TextToSpeechOpenWaveOutFile)( LPTTS_HANDLE_T, wchar_t *, DWORD );
	MMRESULT (*TextToSpeechSpeak)( LPTTS_HANDLE_T, LPTSTR, DWORD );
	void	 (*TextToSpeechTyping)(LPTTS_HANDLE_T phTTS, wchar_t key);
	ULONG	 (*TextToSpeechVersion)(LPTSTR* VersionStr);
#else
	MMRESULT (*TextToSpeechLoadUserDictionary)( LPTTS_HANDLE_T, LPSTR );
	MMRESULT (*TextToSpeechOpenLogFile)( LPTTS_HANDLE_T, LPSTR, DWORD );
	MMRESULT (*TextToSpeechOpenWaveOutFile)( LPTTS_HANDLE_T, char *, DWORD );
	MMRESULT (*TextToSpeechSpeak)( LPTTS_HANDLE_T, LPSTR, DWORD );
	void	 (*TextToSpeechTyping)(LPTTS_HANDLE_T phTTS, unsigned char key);	// CAB 5/30/01 Warning
	ULONG	 (*TextToSpeechVersion)(LPSTR* VersionStr);
#endif
	MMRESULT (*TextToSpeechPause)( LPTTS_HANDLE_T );
	MMRESULT (*TextToSpeechResume)( LPTTS_HANDLE_T );
	MMRESULT (*TextToSpeechCloseWaveOutFile)( LPTTS_HANDLE_T );
	MMRESULT (*TextToSpeechGetStatus)( LPTTS_HANDLE_T, LPDWORD, LPDWORD, DWORD );
	MMRESULT (*TextToSpeechReset)( LPTTS_HANDLE_T, BOOL );
	MMRESULT (*TextToSpeechSync)( LPTTS_HANDLE_T );
	MMRESULT (*TextToSpeechGetRate)( LPTTS_HANDLE_T, LPDWORD );
	MMRESULT (*TextToSpeechSetRate)( LPTTS_HANDLE_T, DWORD );
	MMRESULT (*TextToSpeechGetSpeaker)( LPTTS_HANDLE_T, LPSPEAKER_T );
	MMRESULT (*TextToSpeechSetSpeaker)( LPTTS_HANDLE_T, SPEAKER_T );
	MMRESULT (*TextToSpeechGetLanguage)( LPTTS_HANDLE_T, LPLANGUAGE_T );
	MMRESULT (*TextToSpeechSetLanguage)( LPTTS_HANDLE_T, LANGUAGE_T );
	MMRESULT (*TextToSpeechGetCaps)( LPTTS_CAPS_T );
	MMRESULT (*TextToSpeechUnloadUserDictionary)( LPTTS_HANDLE_T );
	MMRESULT (*TextToSpeechOpenInMemory)( LPTTS_HANDLE_T, DWORD );
	MMRESULT (*TextToSpeechCloseInMemory)( LPTTS_HANDLE_T );
	MMRESULT (*TextToSpeechAddBuffer)( LPTTS_HANDLE_T, LPTTS_BUFFER_T );
	MMRESULT (*TextToSpeechReturnBuffer)( LPTTS_HANDLE_T, LPTTS_BUFFER_T * );
	MMRESULT (*TextToSpeechCloseLogFile)( LPTTS_HANDLE_T );
	MMRESULT (*TextToSpeechStartupEx)(LPTTS_HANDLE_T*, UINT, DWORD, VOID (*)(LONG, LONG, DWORD, UINT), LONG);
	MMRESULT (*TextToSpeechStartupExFonix)(LPTTS_HANDLE_T*, UINT, DWORD, VOID (*)(LONG, LONG, DWORD, UINT), LONG,
#ifdef WIN32
				TCHAR *);
#else
				char *);
#endif		

	VOID	 (*TextToSpeechControlPanel)( LPTTS_HANDLE_T );
	ULONG	 (*TextToSpeechGetLastError)(LPTTS_HANDLE_T phTTS);
	
	ULONG	(*TextToSpeechReserved1)(UCHAR *voices, U8 voice, BOOL bEightk, BOOL bReadData);
	ULONG	(*TextToSpeechReserved2)(LPTTS_HANDLE_T phTTS, ULONG *gains);
	U32		(*TextToSpeechReserved3)(LPTTS_HANDLE_T phTTS, int type, char *data, int max_size);

	// CAB Added TextToSpeechReserved4 03/19/2002
#ifdef UNDER_CE
	MMRESULT (*TextToSpeechReserved4)( LPTTS_HANDLE_T phTTS, LPTSTR szFileName);
#else
	MMRESULT (*TextToSpeechReserved4)( LPTTS_HANDLE_T phTTS, LPSTR szFileName);
#endif

	ULONG	 (*TextToSpeechVersionEx)(LPVERSION_INFO *ver);
    DWORD    (*TextToSpeechGetFeatures)(void);
	MMRESULT (*TextToSpeechGetSpeakerParams)(LPTTS_HANDLE_T a, UINT b, struct SPDEFS_TAG **c,
									  struct SPDEFS_TAG **d, struct SPDEFS_TAG **e,
									  struct SPDEFS_TAG **f);
	MMRESULT (*TextToSpeechSetSpeakerParams)(LPTTS_HANDLE_T a, struct SPDEFS_TAG *b);
	int		 (*TextToSpeechDictionaryHit)(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
	MMRESULT (*TextToSpeechDumpDictionary)(LPTTS_HANDLE_T phTTS, char *filename);
	int		 (*TextToSpeechUserDictionaryHit)(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
	MMRESULT (*TextToSpeechDumpUserDictionary)(LPTTS_HANDLE_T phTTS, char *filename);
	MMRESULT (*TextToSpeechAddUserEntry)(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
	MMRESULT (*TextToSpeechDeleteUserEntry)(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
	MMRESULT (*TextToSpeechChangeUserPhoneme)(LPTTS_HANDLE_T phTTS, struct dic_entry *entry, 
			 								  unsigned char *new_phoneme);

	MMRESULT (*TextToSpeechSaveUserDictionary)(LPTTS_HANDLE_T phTTS, char *filename);

	MMRESULT (*TextToSpeechConvertToPhonemes)(LPTTS_HANDLE_T phTTS,
									   unsigned char *szPhonemeBuf,
									   DWORD *dwBufSize,
									   DWORD dwOutPhonemeFlags,
#ifdef UNDER_CE
									   wchar_t *szText,
#else
									   unsigned char *szText,
#endif
									   DWORD dwInTextFlags,
									   DWORD dwConversionFlags);
/* MGS added TextToSpeechTuning 12/03/1998 */
	MMRESULT (*TextToSpeechTuning)(LPTTS_HANDLE_T phTTS,
								   int iFunction, 
								   VOID *pvtdArg);
	short	*(*TextToSpeechGetPhVdefParams)(LPTTS_HANDLE_T phTTS, UINT index);
	MMRESULT (*TextToSpeechSetVolume)( LPTTS_HANDLE_T, int, int );
	MMRESULT (*TextToSpeechGetVolume)( LPTTS_HANDLE_T, int ,int * );
	MMRESULT (*TextToSpeechVisualMarks)( LPTTS_HANDLE_T, int );

	MMRESULT (*TextToSpeechReserved5)( LPTTS_HANDLE_T phTTS, LPSTR szFileName);
	HMODULE mod;
	unsigned int inst_count;		// Instance Counter
	struct lang_func_struct *next;
} LANG_FUNCS;

typedef struct loaded_langs_struct {
	char lang[3];
	LANG_FUNCS funcs;
	struct loaded_langs_struct *next;
} LANG_LIST;

typedef LANG_LIST* LPLANG_LIST;

typedef struct {
	LPTTS_HANDLE_T phTTS;
	LANG_LIST *cur_lang;
} LANG_HANDLE;

typedef LANG_HANDLE* LPLANG_HANDLE;

typedef struct PID_LIST_STRUCT {
	int pid;
	LANG_LIST *lang;
	struct PID_LIST_STRUCT *next;
} PID_LIST;

typedef PID_LIST* LPPID_LIST;

static LPLANG_LIST langs, def_lang;
static LPPID_LIST pids;


BOOL TextToSpeechSelectLang(LPTTS_HANDLE_T tts, unsigned int id);
#ifdef UNDER_CE
unsigned int TextToSpeechStartLang(wchar_t *lang);
BOOL TextToSpeechCloseLang(wchar_t *lang);
#else
unsigned int TextToSpeechStartLang(char *lang);
BOOL TextToSpeechCloseLang(char *lang);
#endif

BOOL alloc_pid(int pid, LANG_LIST *lang);
LANG_LIST* find_pid(int pid);
BOOL free_pid(int pid);

unsigned int load_dectalk(char *lang)
{
	LANG_LIST *next = langs;
	LANG_FUNCS *funcs;

#ifdef UNDER_CE
	TCHAR filename[20];
#else
	char filename[20];
#endif
	int id = 0;

	if (next == NULL)
	{	langs = malloc(sizeof(LANG_LIST));
#ifdef UNDER_CE
		/* changed '0' to 0 MGS 08/22/1999 */
		memset(langs,0,(sizeof(LANG_LIST))); //mfgce
#endif
		if (langs == NULL)	return TTS_NOT_SUPPORTED;
		next = langs;
		next->next = NULL;
	}
	else
	{	while (strcmp(next->lang,lang) != 0 && next->next != NULL)
		{	next = next->next;
			id++;
		}
		if (strcmp(next->lang,lang) != 0)	id++;			// We need to slide an extra to a blank space
		if (strcmp(next->lang, lang) != 0)
		{	next->next = malloc(sizeof(LANG_LIST));
			if (next->next == NULL)		return TTS_NOT_SUPPORTED;
			next = next->next;
			next->next = NULL;
		}
		else
		{	if (next->funcs.mod != NULL)	return id;
		}
	}
	strcpy(next->lang, lang);
#if defined UNDER_CE && defined WIN32
	wsprintf(filename,TEXT("dtalk_%c%c.dll"),(lang[0] & 0x00FF),(lang[1] & 0x00FF));
#elif defined WIN32
	sprintf(filename,"dtalk_%s.dll",lang);
#else
	lang[0] = tolower(lang[0]);
	lang[1] = tolower(lang[1]);
#ifdef MME_SERVER
	sprintf(filename,"libttsmme_%s.so",lang);
#else
	if (strlen(lang) > 5)
	{	lang[2] = tolower(lang[2]);
		lang[3] = tolower(lang[3]);
		lang[4] = tolower(lang[4]);
		lang[5] = tolower(lang[5]);
	}
	sprintf(filename,"libtts_%s.so",lang);
#endif // MME_SERVER
#endif // UNDER_CE
	funcs = &next->funcs;
	funcs->mod = (HMODULE) LoadLibrary(filename);

#if defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS
	if (funcs->mod==NULL)
	{	fprintf(stderr,"dlopen error:%s\n",dlerror());
	}
#endif

	if (funcs->mod == NULL)			return TTS_NOT_AVAILABLE;
#ifdef UNDER_CE
	(unsigned int (_cdecl*)())funcs->TextToSpeechStartup = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechStartup"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechShutdown = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechShutdown"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSpeak = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSpeak"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechPause = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechPause"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechResume = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechResume"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechOpenWaveOutFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechOpenWaveOutFile"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechCloseWaveOutFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechCloseWaveOutFile"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetStatus = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetStatus"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechReset = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechReset"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSync = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSync"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetRate = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetRate"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSetRate = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSetRate"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetSpeaker = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetSpeaker"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSetSpeaker = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSetSpeaker"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetLanguage = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetLanguage"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSetLanguage = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSetLanguage"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetCaps = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetCaps"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechLoadUserDictionary = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechLoadUserDictionary"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechUnloadUserDictionary = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechUnloadUserDictionary"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechOpenInMemory = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechOpenInMemory"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechCloseInMemory = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechCloseInMemory"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechAddBuffer = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechAddBuffer"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechReturnBuffer = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechReturnBuffer"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechOpenLogFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechOpenLogFile"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechCloseLogFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechCloseLogFile"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechStartupEx = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechStartupEx"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechStartupExFonix = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechStartupExFonix"));
	(VOID (_cdecl*)())funcs->TextToSpeechControlPanel = (VOID ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechControlPanel"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechVersion = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechVersion"));
	(VOID (_cdecl*)())funcs->TextToSpeechTyping = (VOID ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechTyping"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetLastError = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetLastError"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechReserved1 = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechReserved1"));
	
	// CAB 06/24/02 Removed warning 
	(unsigned int (_cdecl*)())funcs->TextToSpeechReserved2 = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechReserved2"));

	(unsigned int (_cdecl*)())funcs->TextToSpeechReserved3 = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechReserved3"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechReserved4 = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechReserved4"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechVersionEx = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechVersionEx"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetFeatures = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetFeatures"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetSpeakerParams = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetSpeakerParams"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSetSpeakerParams = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSetSpeakerParams"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechDictionaryHit = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechDictionaryHit"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechDumpDictionary = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechDumpDictionary"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechUserDictionaryHit = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechUserDictionaryHit"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechDumpUserDictionary = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechDumpUserDictionary"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechAddUserEntry = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechAddUserEntry"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechDeleteUserEntry = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechDeleteUserEntry"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechChangeUserPhoneme = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechChangeUserPhoneme"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSaveUserDictionary = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSaveUserDictionary"));
/* MGS added TextToSpeechTuning 12/03/1998 */
	(unsigned int (_cdecl*)())funcs->TextToSpeechTuning = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechTuning"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechConvertToPhonemes = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechConvertToPhonemes"));
//	(short (_cdecl*)())funcs->TextToSpeechGetPhVdefParams = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetPhVdefParams"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetPhVdefParams = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetPhVdefParams"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechSetVolume = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechSetVolume"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechGetVolume = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechGetVolume"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechVisualMarks = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechVisualMarks"));
	(unsigned int (_cdecl*)())funcs->TextToSpeechReserved5 = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,TEXT("TextToSpeechReserved5"));
#else
	(unsigned int (*)())funcs->TextToSpeechStartup = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechStartup");
	(unsigned int (*)())funcs->TextToSpeechShutdown = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechShutdown");
	(unsigned int (*)())funcs->TextToSpeechSpeak = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSpeak");
	(unsigned int (*)())funcs->TextToSpeechPause = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechPause");
	(unsigned int (*)())funcs->TextToSpeechResume = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechResume");
	(unsigned int (*)())funcs->TextToSpeechOpenWaveOutFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechOpenWaveOutFile");
	(unsigned int (*)())funcs->TextToSpeechCloseWaveOutFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechCloseWaveOutFile");
	(unsigned int (*)())funcs->TextToSpeechGetStatus = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetStatus");
	(unsigned int (*)())funcs->TextToSpeechReset = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechReset");
	(unsigned int (*)())funcs->TextToSpeechSync = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSync");
	(unsigned int (*)())funcs->TextToSpeechGetRate = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetRate");
	(unsigned int (*)())funcs->TextToSpeechSetRate = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSetRate");
	(unsigned int (*)())funcs->TextToSpeechGetSpeaker = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetSpeaker");
	(unsigned int (*)())funcs->TextToSpeechSetSpeaker = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSetSpeaker");
	(unsigned int (*)())funcs->TextToSpeechGetLanguage = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetLanguage");
	(unsigned int (*)())funcs->TextToSpeechSetLanguage = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSetLanguage");
	(unsigned int (*)())funcs->TextToSpeechGetCaps = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetCaps");
	(unsigned int (*)())funcs->TextToSpeechLoadUserDictionary = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechLoadUserDictionary");
	(unsigned int (*)())funcs->TextToSpeechUnloadUserDictionary = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechUnloadUserDictionary");
	(unsigned int (*)())funcs->TextToSpeechOpenInMemory = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechOpenInMemory");
	(unsigned int (*)())funcs->TextToSpeechCloseInMemory = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechCloseInMemory");
	(unsigned int (*)())funcs->TextToSpeechAddBuffer = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechAddBuffer");
	(unsigned int (*)())funcs->TextToSpeechReturnBuffer = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechReturnBuffer");
	(unsigned int (*)())funcs->TextToSpeechOpenLogFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechOpenLogFile");
	(unsigned int (*)())funcs->TextToSpeechCloseLogFile = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechCloseLogFile");
	(unsigned int (*)())funcs->TextToSpeechStartupEx = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechStartupEx");
	(unsigned int (*)())funcs->TextToSpeechStartupExFonix = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechStartupExFonix");

	// CAB	Removed warnings 6/24/02
	(VOID (*)())funcs->TextToSpeechControlPanel = (VOID ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechControlPanel");

	(unsigned int (*)())funcs->TextToSpeechVersion = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechVersion");
	// CAB	Removed warnings 6/24/02
	(VOID (*)())funcs->TextToSpeechTyping = (VOID ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechTyping");

	(unsigned int (*)())funcs->TextToSpeechGetLastError = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetLastError");
	(unsigned int (*)())funcs->TextToSpeechReserved1 = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechReserved1");
	// CAB	Removed warnings 6/24/02
	(unsigned int (*)())funcs->TextToSpeechReserved2 = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechReserved2");

	(unsigned int (*)())funcs->TextToSpeechReserved3 = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechReserved3");
	(unsigned int (*)())funcs->TextToSpeechReserved4 = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechReserved4");
	(unsigned int (*)())funcs->TextToSpeechVersionEx = (ULONG ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechVersionEx");
	// CAB	Removed warnings 6/24/02
	(unsigned int (*)())funcs->TextToSpeechGetFeatures = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetFeatures");

	(unsigned int (*)())funcs->TextToSpeechGetSpeakerParams = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetSpeakerParams");
	(unsigned int (*)())funcs->TextToSpeechSetSpeakerParams = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSetSpeakerParams");
	
	// CAB	Removed warnings 6/24/02
	(unsigned int (*)())funcs->TextToSpeechDictionaryHit = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechDictionaryHit");
	(unsigned int (*)())funcs->TextToSpeechDumpDictionary = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechDumpDictionary");
	(unsigned int (*)())funcs->TextToSpeechUserDictionaryHit = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechUserDictionaryHit");
	(unsigned int (*)())funcs->TextToSpeechDumpUserDictionary = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechDumpUserDictionary");
	(unsigned int (*)())funcs->TextToSpeechAddUserEntry = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechAddUserEntry");
	(unsigned int (*)())funcs->TextToSpeechDeleteUserEntry = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechDeleteUserEntry");
	(unsigned int (*)())funcs->TextToSpeechChangeUserPhoneme = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechChangeUserPhoneme");
	(unsigned int (*)())funcs->TextToSpeechSaveUserDictionary = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSaveUserDictionary");
	(unsigned int (*)())funcs->TextToSpeechConvertToPhonemes = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechConvertToPhonemes");
	/* MGS added TextToSpeechTuning 12/03/1998 */
	(unsigned int (*)())funcs->TextToSpeechTuning = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechTuning");
	(unsigned int (*)())funcs->TextToSpeechGetPhVdefParams = (DWORD ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetPhVdefParams");

	(unsigned int (*)())funcs->TextToSpeechSetVolume = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechSetVolume");
	(unsigned int (*)())funcs->TextToSpeechGetVolume = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechGetVolume");
	(unsigned int (*)())funcs->TextToSpeechVisualMarks = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechVisualMarks");
	(unsigned int (*)())funcs->TextToSpeechReserved5 = (MMRESULT ((_cdecl*)())) GetProcAddress(funcs->mod,"TextToSpeechReserved5");

	
#endif // UNDER_CE

#ifndef UNDER_CE
	funcs->inst_count = 1;
#endif
	return id;
}

BOOL init(void)
{
#ifdef UNDER_CE
	TCHAR lang[3];
	TCHAR szLicenseKey[] = TEXT("Software\\DECtalk Software\\DECtalk\\LANGS");
#else
	char lang[3];
	char szLicenseKey[] = "Software\\DECtalk Software\\DECtalk\\LANGS";
#endif
	unsigned int id;
	LANG_LIST *next;
	DWORD dwType,cbData;
	FILE *config_file;

#ifdef WIN32
	HKEY hKeyLicense = NULL;

	if (RegOpenKeyEx( HKEY_LOCAL_MACHINE, szLicenseKey, 0, KEY_QUERY_VALUE, &hKeyLicense ) != ERROR_SUCCESS)
	{
#ifdef UNDER_CE
		wsprintf(lang,TEXT("US"));
#else
		sprintf(lang,"US");
#endif // UNDER_CE
	}
	else
	{
#ifdef UNDER_CE
		cbData = (3*2);
		if (RegQueryValueEx( hKeyLicense,TEXT("DefaultLang"), NULL, &dwType, (LPBYTE)lang, &cbData ) != ERROR_SUCCESS) 
		{	wsprintf(lang,TEXT("US"));
#else
		cbData = 3;		
		if (RegQueryValueEx( hKeyLicense, "DefaultLang", NULL, &dwType, (LPBYTE)lang, &cbData ) != ERROR_SUCCESS)
		{	sprintf(lang,"US");
#endif // UNDER_CE
		}
		RegCloseKey( hKeyLicense );
	}
#else // WIN32
#ifdef UNDER_CE
	wsprintf(lang,TEXT("US"));
#elif defined _UNIX_LIKE_
	config_file=fopen("/etc/DECtalk.conf","r");	
	if (config_file==NULL)
	{
		sprintf(lang,"US");
	}
	else
	{
		while (fgets(line,999,config_file)!=NULL)
		{
			if (strncmp("Default_lang:",line,13)==0)
			{
				strncpy(lang,line+13,2);
				lang[2]='\0';
				break;
			}
		}
	}
	fclose(config_file);
#else
	sprintf(lang,"US");
#endif
#endif

	id = TextToSpeechStartLang(lang);
	if (id & TTS_LANG_ERROR) {
		return FALSE;
	}
	if (TextToSpeechSelectLang(NULL, id) == FALSE) {
		return FALSE;
	}

#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else 
	free_pid(_getpid());
#endif

	next = langs;
	while (id && next != NULL) {
		next = next->next;
		id--;
	}
	def_lang = next;
	if (def_lang == NULL)			return FALSE;
	return TRUE;
}

/* Startup and shutdown calls */
MMRESULT TextToSpeechStartupEx(LPTTS_HANDLE_T *a, UINT b, DWORD c, VOID (*d)(LONG, LONG, DWORD, UINT), LONG e) {
	LPLANG_HANDLE handle;
	LANG_LIST *lang;

	handle = malloc(sizeof(LANG_HANDLE));
	if (handle == NULL)	return MMSYSERR_ERROR;
	
	// CAB Removed 6/24/02 Warning
	*a = (LPTTS_HANDLE_T)handle;

#ifdef	WIN32	// UNDER_CE
	lang = find_pid(GetCurrentProcessId());
#else 
	lang = find_pid(_getpid());
#endif

#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else
	free_pid(_getpid());
#endif
	if (lang != NULL) {
		handle->cur_lang = lang;
		if (lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
		return lang->funcs.TextToSpeechStartupEx(&(handle->phTTS),b,c,d,e);
	}

	/* Lock the great loading mutex - Use the load mutex to block init() calls as well */
#ifdef WIN32
	if (hGreatestInitMutex == NULL) {
		hGreatestInitMutex = CreateMutex(NULL, TRUE, NULL);
		if (hGreatestInitMutex == NULL)	return FALSE;
	} else {
		WaitForSingleObject(hGreatestInitMutex, INFINITE);
	}
	if (def_lang == NULL) {
		if (init() == FALSE) {
			ReleaseMutex(hGreatestInitMutex);
			return MMSYSERR_ERROR;
		}
	}
	ReleaseMutex(hGreatestInitMutex);
#endif
#if defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS
	pthread_mutex_lock(hGreatestInitMutex);

        if (def_lang == NULL) {
                if (init() == FALSE) {
                        pthread_mutex_unlock(hGreatestInitMutex);
                        return MMSYSERR_ERROR;
                }
        }
        pthread_mutex_unlock(hGreatestInitMutex);
#endif

	handle->cur_lang = def_lang;
	if (def_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return def_lang->funcs.TextToSpeechStartupEx(&(handle->phTTS),b,c,d,e);
}

#ifdef WIN32
MMRESULT TextToSpeechStartup(HWND a, LPTTS_HANDLE_T *b, UINT c, DWORD d)
#else
MMRESULT TextToSpeechStartup(LPTTS_HANDLE_T *a, UINT b, DWORD c, VOID (*d)(LONG, LONG, DWORD, UINT), LONG e)
#endif
{
	LPLANG_HANDLE handle;
	LANG_LIST *lang;

	/* BATS #663 fixed LANG_HANDLE, it was LPLANG_HANDLE */
	handle = malloc(sizeof(LANG_HANDLE));
	if (handle == NULL)	return MMSYSERR_ERROR;
	
#ifdef WIN32	
	// CAB 6/24/02 Removed warning
	*b = (LPTTS_HANDLE_T)handle;
	lang = find_pid(GetCurrentProcessId());
#else
	*a = handle;
	lang = find_pid(_getpid());
#endif

#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else
	free_pid(_getpid());
#endif
	if (lang != NULL)
	{	
		handle->cur_lang = lang;
		/* MGS 12/23/1997 fixed typo of MMSYSER_ERROR */
		if (lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
#ifdef WIN32
		return lang->funcs.TextToSpeechStartup(a,&(handle->phTTS),c,d);
#else
		return lang->funcs.TextToSpeechStartupEx(&(handle->phTTS),b,c,d,e);
#endif
	}
	if (def_lang == NULL)	init();
	if (def_lang == NULL)	return MMSYSERR_ERROR;
	handle->cur_lang = def_lang;
	if (def_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
#ifdef WIN32
	return def_lang->funcs.TextToSpeechStartup(a,&(handle->phTTS),c,d);
#else
	return def_lang->funcs.TextToSpeechStartupEx(&(handle->phTTS),b,c,d,e);
#endif
}

/* Startup and shutdown calls */
MMRESULT TextToSpeechStartupExFonix(LPTTS_HANDLE_T *a, UINT b, DWORD c, VOID (*d)(LONG, LONG, DWORD, UINT), LONG e,
#ifdef WIN32
	TCHAR *f)
#else
	char *f)
#endif
{	LPLANG_HANDLE handle;
	LANG_LIST *lang;

	handle = malloc(sizeof(LANG_HANDLE));
	if (handle == NULL)	return MMSYSERR_ERROR;
	
	// CAB Removed 6/24/02 Warning
	*a = (LPTTS_HANDLE_T)handle;

#ifdef	WIN32	// UNDER_CE
	lang = find_pid(GetCurrentProcessId());
#else 
	lang = find_pid(_getpid());
#endif

#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else
	free_pid(_getpid());
#endif
	if (lang != NULL)
	{	
		handle->cur_lang = lang;
		if (lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
		return lang->funcs.TextToSpeechStartupExFonix(&(handle->phTTS),b,c,d,e,f);
	}

	/* Lock the great loading mutex - Use the load mutex to block init() calls as well */
#ifdef WIN32
	if (hGreatestInitMutex == NULL) {
		hGreatestInitMutex = CreateMutex(NULL, TRUE, NULL);
		if (hGreatestInitMutex == NULL)	return FALSE;
	} else {
		WaitForSingleObject(hGreatestInitMutex, INFINITE);
	}
	if (def_lang == NULL) {
		if (init() == FALSE) {
			ReleaseMutex(hGreatestInitMutex);
			return MMSYSERR_ERROR;
		}
	}
	ReleaseMutex(hGreatestInitMutex);
#endif
#if defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS
	pthread_mutex_lock(hGreatestInitMutex);

        if (def_lang == NULL) {
                if (init() == FALSE) {
                        pthread_mutex_unlock(hGreatestInitMutex);
                        return MMSYSERR_ERROR;
                }
        }
        pthread_mutex_unlock(hGreatestInitMutex);
#endif

	handle->cur_lang = def_lang;
	if (def_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return def_lang->funcs.TextToSpeechStartupExFonix(&(handle->phTTS),b,c,d,e,f);
}

MMRESULT TextToSpeechShutdown(LPTTS_HANDLE_T a) {
	LPLANG_HANDLE handle;
	MMRESULT stat;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	stat = handle->cur_lang->funcs.TextToSpeechShutdown(handle->phTTS);
	free(handle);
	return stat;
}


/* No phTTS thread passed, use default language */
MMRESULT TextToSpeechGetCaps(LPTTS_CAPS_T a)
{	LANG_LIST *lang;

#ifdef WIN32	// UNDER_CE
	lang = find_pid(GetCurrentProcessId());
#else
	lang = find_pid(_getpid());
#endif

#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else
	free_pid(_getpid());
#endif
	if (lang != NULL)
	{	
		if (lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
		return lang->funcs.TextToSpeechGetCaps(a);
	}

	if (def_lang == NULL)	init();
	if (def_lang == NULL)				return MMSYSERR_ERROR;
	if (def_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return def_lang->funcs.TextToSpeechGetCaps(a);
}

DWORD TextToSpeechGetFeatures(void)
{   DWORD feats;
	LANG_LIST *lang;

#ifdef WIN32	//  UNDER_CE
	lang = find_pid(GetCurrentProcessId());
#else
	lang = find_pid(_getpid());
#endif

#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else
	free_pid(_getpid());
#endif
	if (lang != NULL)
	{	
		if (lang->funcs.mod == NULL)	return 0;
		return (lang->funcs.TextToSpeechGetFeatures() | TTS_FEATS_MULTILANG);
	}
	if (def_lang == NULL)	init();
	if (def_lang == NULL)	return 0;
	if (def_lang->funcs.mod == NULL)	return 0;

	if (def_lang->funcs.TextToSpeechGetFeatures == NULL)
	{	return TTS_FEATS_MULTILANG;	/* Multi-language only */
	}
	feats = def_lang->funcs.TextToSpeechGetFeatures();
	feats |= TTS_FEATS_MULTILANG;
	return feats;
}

#ifdef UNDER_CE
ULONG TextToSpeechVersion(LPTSTR *a)
#else
ULONG TextToSpeechVersion(LPSTR *a)
#endif
{
#ifdef UNDER_CE
	static wchar_t ver[1024];
#else
	static unsigned char ver[1024];
#endif
	LANG_LIST *lang;

#ifdef WIN32	// UNDER_CE
	lang = find_pid(GetCurrentProcessId());
#else
	lang = find_pid(_getpid());
#endif

#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else
	free_pid(_getpid());
#endif
	if (lang != NULL)
	{	
		if (lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
		return lang->funcs.TextToSpeechVersion(a);
	}
#ifdef UNDER_CE
	wsprintf(ver,TEXT("%s Multi-Language Controller"), DTALK_STR_VERSION);
#else
	sprintf(ver,"%s Multi-Language Controller", DTALK_STR_VERSION);
#endif
	if (a != NULL)	*a = ver;
	// MGS 19nov98 BATS #746 fixed version number to be the same as the rest of the code
	return (DTALK_MAJ_VERSION << 24) + (DTALK_MIN_VERSION << 16) + (DLL_MAJ_VERSION << 8) + DLL_MIN_VERSION;
//	return (1 << 24) + (2 << 16) + (1 << 8) + 8;
}


#ifdef UNDER_CE
MMRESULT TextToSpeechSpeak(LPTTS_HANDLE_T a, LPTSTR b, DWORD c)
#else
MMRESULT TextToSpeechSpeak(LPTTS_HANDLE_T a, LPSTR b, DWORD c)
#endif
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSpeak(handle->phTTS,b,c);
}

MMRESULT TextToSpeechPause(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechPause(handle->phTTS);
}

MMRESULT TextToSpeechResume(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechResume(handle->phTTS);
}

#ifdef UNDER_CE
MMRESULT TextToSpeechOpenWaveOutFile(LPTTS_HANDLE_T a, wchar_t *b, DWORD c)
#else
MMRESULT TextToSpeechOpenWaveOutFile(LPTTS_HANDLE_T a, char *b, DWORD c)
#endif	
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechOpenWaveOutFile(handle->phTTS,b,c);
}

MMRESULT TextToSpeechCloseWaveOutFile(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechCloseWaveOutFile(handle->phTTS);
}

MMRESULT TextToSpeechGetStatus(LPTTS_HANDLE_T a, LPDWORD b, LPDWORD c, DWORD d)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechGetStatus(handle->phTTS,b,c,d);
}

MMRESULT TextToSpeechReset(LPTTS_HANDLE_T a, BOOL b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechReset(handle->phTTS,b);
}

MMRESULT TextToSpeechSync(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSync(handle->phTTS);
}

MMRESULT TextToSpeechGetRate(LPTTS_HANDLE_T a, LPDWORD b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechGetRate(handle->phTTS,b);
}

MMRESULT TextToSpeechSetRate(LPTTS_HANDLE_T a, DWORD b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSetRate(handle->phTTS,b);
}

MMRESULT TextToSpeechGetSpeaker(LPTTS_HANDLE_T a, LPSPEAKER_T b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechGetSpeaker(handle->phTTS,b);
}

MMRESULT TextToSpeechSetSpeaker(LPTTS_HANDLE_T a, SPEAKER_T b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSetSpeaker(handle->phTTS,b);
}

MMRESULT TextToSpeechGetLanguage(LPTTS_HANDLE_T a, LPLANGUAGE_T b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechGetLanguage(handle->phTTS,b);
}

MMRESULT TextToSpeechSetLanguage(LPTTS_HANDLE_T a, LANGUAGE_T b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSetLanguage(handle->phTTS,b);
}

#ifdef UNDER_CE
MMRESULT TextToSpeechLoadUserDictionary(LPTTS_HANDLE_T a, LPTSTR b)
#else
MMRESULT TextToSpeechLoadUserDictionary(LPTTS_HANDLE_T a, LPSTR b)
#endif
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechLoadUserDictionary(handle->phTTS,b);
}

MMRESULT TextToSpeechUnloadUserDictionary(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechUnloadUserDictionary(handle->phTTS);
}

MMRESULT TextToSpeechOpenInMemory(LPTTS_HANDLE_T a, DWORD b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechOpenInMemory(handle->phTTS,b);
}

MMRESULT TextToSpeechCloseInMemory(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechCloseInMemory(handle->phTTS);
}

MMRESULT TextToSpeechAddBuffer(LPTTS_HANDLE_T a, LPTTS_BUFFER_T b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechAddBuffer(handle->phTTS,b);
}

MMRESULT TextToSpeechReturnBuffer(LPTTS_HANDLE_T a, LPTTS_BUFFER_T *b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechReturnBuffer(handle->phTTS,b);
}

#ifdef UNDER_CE
MMRESULT TextToSpeechOpenLogFile(LPTTS_HANDLE_T a, LPTSTR b, DWORD c)
#else
MMRESULT TextToSpeechOpenLogFile(LPTTS_HANDLE_T a, LPSTR b, DWORD c)
#endif
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechOpenLogFile(handle->phTTS,b,c);
}

MMRESULT TextToSpeechCloseLogFile(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechCloseLogFile(handle->phTTS);
}

VOID TextToSpeechControlPanel(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return;
	if (handle->cur_lang == NULL)	return;
	if (handle->cur_lang->funcs.mod == NULL)	return;
	handle->cur_lang->funcs.TextToSpeechControlPanel(handle->phTTS);
	return;
}

#ifdef UNDER_CE
void TextToSpeechTyping(LPTTS_HANDLE_T a, wchar_t b)
#else
void TextToSpeechTyping(LPTTS_HANDLE_T a, unsigned char b)	// CAB 5/30/01 Warning
#endif
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return;
	if (handle->cur_lang == NULL)	return;
	if (handle->cur_lang->funcs.mod == NULL)	return;
	handle->cur_lang->funcs.TextToSpeechTyping(handle->phTTS,b);
	return;
}

ULONG TextToSpeechGetLastError(LPTTS_HANDLE_T a)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechGetLastError(handle->phTTS);
}

ULONG TextToSpeechReserved1(UCHAR *voices, U8 voice, BOOL bEightk, BOOL bReadData)
{	if (def_lang == NULL)	init();
	if (def_lang == NULL)	return MMSYSERR_ERROR;
	if (def_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return def_lang->funcs.TextToSpeechReserved1(voices, voice, bEightk, bReadData);
}

ULONG TextToSpeechReserved2(LPTTS_HANDLE_T a, ULONG *gains)
{	LPLANG_HANDLE handle;
	
	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechReserved2(handle->phTTS, gains);
}

U32 TextToSpeechReserved3(LPTTS_HANDLE_T a, int type, char *data, int max_size)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechReserved3(handle->phTTS, type, data, max_size);
}

#ifdef UNDER_CE
	MMRESULT TextToSpeechReserved4( LPTTS_HANDLE_T a, LPTSTR b )
#else
	MMRESULT TextToSpeechReserved4( LPTTS_HANDLE_T a, LPSTR b)
#endif
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechReserved4(handle->phTTS, b);
}

MMRESULT TextToSpeechGetSpeakerParams(LPTTS_HANDLE_T a, UINT b, struct SPDEFS_TAG **c,
									  struct SPDEFS_TAG **d, struct SPDEFS_TAG **e,
									  struct SPDEFS_TAG **f)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechGetSpeakerParams(handle->phTTS, b, c, d, e, f);
}

MMRESULT TextToSpeechSetSpeakerParams(LPTTS_HANDLE_T a, struct SPDEFS_TAG *b)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSetSpeakerParams(handle->phTTS, b);
}

int TextToSpeechDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechDictionaryHit(handle->phTTS, entry);
}

MMRESULT TextToSpeechDumpDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechDumpDictionary(handle->phTTS, filename);
}

int TextToSpeechUserDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechUserDictionaryHit(handle->phTTS, entry);
}

MMRESULT TextToSpeechDumpUserDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechDumpUserDictionary(handle->phTTS, filename);
}

MMRESULT TextToSpeechAddUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechAddUserEntry(handle->phTTS, entry);
}

MMRESULT TextToSpeechDeleteUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechDeleteUserEntry(handle->phTTS, entry);
}

MMRESULT TextToSpeechChangeUserPhoneme(LPTTS_HANDLE_T phTTS, struct dic_entry *entry, 
			 						   unsigned char *new_phoneme)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechChangeUserPhoneme(handle->phTTS, entry, new_phoneme);
}

MMRESULT TextToSpeechSaveUserDictionary(LPTTS_HANDLE_T phTTS, 
										char *filename)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSaveUserDictionary(handle->phTTS, filename);
}

MMRESULT TextToSpeechConvertToPhonemes(LPTTS_HANDLE_T phTTS,
									   unsigned char *szPhonemeBuf,
									   DWORD *dwBufSize,
									   DWORD dwOutPhonemeFlags,
#ifdef UNDER_CE
									   wchar_t *szText,
#else
									   unsigned char *szText,
#endif
									   DWORD dwInTextFlags,
									   DWORD dwConversionFlags)
{
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechConvertToPhonemes(handle->phTTS,
												szPhonemeBuf,
												dwBufSize,
												dwOutPhonemeFlags,
												szText,
												dwInTextFlags,
												dwConversionFlags);

}

/* MGS added TextToSpeechTuning 12/03/1998 */
MMRESULT TextToSpeechTuning(LPTTS_HANDLE_T phTTS,
							int iFunction, 
							VOID *pvtdArg)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) phTTS;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechTuning(handle->phTTS,
									iFunction, 
									pvtdArg);
}

short  *TextToSpeechGetPhVdefParams(LPTTS_HANDLE_T a, UINT index)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return NULL;
	if (handle->cur_lang == NULL)	return NULL;
	if (handle->cur_lang->funcs.mod == NULL)	return NULL;
	return handle->cur_lang->funcs.TextToSpeechGetPhVdefParams(handle->phTTS, index);
}

MMRESULT TextToSpeechSetVolume(LPTTS_HANDLE_T a, int b, int c)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechSetVolume(handle->phTTS,b,c);
}

MMRESULT TextToSpeechGetVolume(LPTTS_HANDLE_T a, int b, int *c)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechGetVolume(handle->phTTS,b,c);
}

MMRESULT TextToSpeechVisualMarks(LPTTS_HANDLE_T a, int b)
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechVisualMarks(handle->phTTS,b);
}

#ifdef UNDER_CE
	MMRESULT TextToSpeechReserved5( LPTTS_HANDLE_T a, LPTSTR b )
#else
	MMRESULT TextToSpeechReserved5( LPTTS_HANDLE_T a, LPSTR b)
#endif
{	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) a;
	if (handle == NULL)				return MMSYSERR_ERROR;
	if (handle->cur_lang == NULL)	return MMSYSERR_ERROR;
	if (handle->cur_lang->funcs.mod == NULL)	return MMSYSERR_ERROR;
	return handle->cur_lang->funcs.TextToSpeechReserved5(handle->phTTS, b);
}


ULONG TextToSpeechVersionEx(LPVERSION_INFO *ver)
{
#ifdef UNDER_CE
	static wchar_t DECtalk_Language_String[50];
	static wchar_t DECtalk_Version_String[50];
#else
	static char DECtalk_Language_String[50];
	static char DECtalk_Version_String[50];
#endif
	LANG_LIST *lang;

#ifdef WIN32	// UNDER_CE
	lang = find_pid(GetCurrentProcessId());
#else
	lang = find_pid(_getpid());
#endif
#ifdef WIN32	// UNDER_CE
	free_pid(GetCurrentProcessId());
#else
	free_pid(_getpid());
#endif
	if (lang != NULL)
	{	
		if (lang->funcs.mod == NULL)	return 0;
		return lang->funcs.TextToSpeechVersionEx(ver);
	}
//	return (1 << 24) + (1 << 16) + (1 << 8) + 6;

#ifdef UNDER_CE
	wsprintf(DECtalk_Version_String,TEXT("Multi-Language Controller"));
	wsprintf(DECtalk_Language_String, TEXT("ML: Multi-Language Base"));
#else
	sprintf(DECtalk_Version_String,"Multi-Language Controller");
	sprintf(DECtalk_Language_String, "ML: Multi-Language Base");
#endif

//      Need to add this version string:
//      PRODUCT_BUILD_TYPE and PRODUCT_BUILD_VERSION

	if ((*ver = malloc(sizeof(VERSION_INFO))) == NULL)	return 0;
	(*ver)->StructSize = sizeof(VERSION_INFO);
	(*ver)->StructVersion = VERSION_STRUCT_VER;
	(*ver)->DLLVersion = (1 << 8) + 6;
	(*ver)->DTalkVersion = (1 << 8) + 1;
	(*ver)->VerString = DECtalk_Version_String;
	(*ver)->Language = DECtalk_Language_String;
	(*ver)->Features = TextToSpeechGetFeatures();
	return (sizeof(VERSION_INFO));
}

#if defined __linux__ || defined _SPARC_SOLARIS
DWORD TextToSpeechEnumLangs(LPLANG_ENUM *langs) 
{
	LPVERSION_INFO verinfo;
	LANG_ENTRY fetch;
	int num_langs=0;
	char default_lang[20];
	char line[1000];
	int cur_entry=0;
	int next_entry=0;

	FILE *config_file;

	config_file=fopen("/etc/DECtalk.conf","r");	
	if (config_file==NULL)
	{
		(*langs)=NULL;
		return(0);
	}
	memset(default_lang,0,20);
	while (fgets(line,999,config_file)!=NULL)
	{
		if (strncmp("Default_lang:",line,13)==0)
		{
			strncpy(default_lang,line+13,2);
			default_lang[2]='\0';
			continue;
		}
		if (strncmp("LANG:",line,5)==0)
		{
			num_langs++;
		}
	}

        if (((*langs) = malloc(sizeof(LANG_ENUM))) == NULL)
	{
		return 0;
	}
        (*langs)->Languages = 0;
        (*langs)->MultiLang = TRUE;
	(*langs)->Entries=(LANG_ENTRY *)malloc(num_langs * sizeof(LANG_ENTRY));
	if ((*langs)->Entries==NULL)
	{
		free(*langs);
		(*langs)=NULL;
		return(0);
	}
	memset((*langs)->Entries,0,num_langs * sizeof(LANG_ENTRY));

	fseek(config_file,0,SEEK_SET);
	cur_entry=1;
	next_entry=1;
	while (fgets(line,999,config_file)!=NULL)
	{
		if (strncmp("LANG:",line,5)!=0)
		{
			continue;
		}	
		if (strncmp(line+5,default_lang,2)==0)
		{
			cur_entry=0;	
		}
		else
		{
			cur_entry=next_entry;
			next_entry++;
		}
		strncpy((*langs)->Entries[cur_entry].lang_code,line+5,2);
		(*langs)->Entries[cur_entry].lang_code[2]='\0';

		line[strlen(line)-1]='\0';

		strcpy((*langs)->Entries[cur_entry].lang_name,line+8);
		(*langs)->Languages++;
	(*langs)->Languages,(*langs)->Entries[cur_entry].lang_code,
	(*langs)->Entries[cur_entry].lang_name;
	}
	fclose(config_file);
	return(sizeof(LANG_ENUM));
}
#endif //__linux__

#ifdef WIN32

#ifdef UNDER_CE
#define LANG_REG_LOC	TEXT("Software\\DECtalk Software\\DECtalk\\Langs")
#else
#define LANG_REG_LOC	"Software\\DECtalk Software\\DECtalk\\Langs"
#endif

DWORD TextToSpeechEnumLangs(LPLANG_ENUM *langs)
{	unsigned long int result, keys, value_type, name_size, value_size, maxkeys, lastkey;
#ifdef UNDER_CE
	LPTSTR name;
	LPTSTR value;
#else
	LPSTR name;
	LPSTR value;
#endif

	HKEY key;
	HKEY hKeyDefault = NULL;
#ifdef UNDER_CE
	TCHAR lang[20];
#else
	char lang[20];
#endif
	int curentry;
	int nextentry;
	DWORD dwType,cbData;
	LANG_ENTRY fetch;

#ifdef UNDER_CE
	if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, LANG_REG_LOC, 0, KEY_QUERY_VALUE, &hKeyDefault) != ERROR_SUCCESS)
	{	wsprintf(lang,TEXT("US"));
	}
	else
	{	cbData = (3*2); // 3 char times 2 bytes = (6) total of bytes   mfg 02-apr-1999	
		if (RegQueryValueEx(hKeyDefault, TEXT("DefaultLang"), 0, &dwType, (LPBYTE)lang, &cbData) != ERROR_SUCCESS)
		{	wsprintf(lang,TEXT("US"));
		}
		RegCloseKey(hKeyDefault);
	}
#else
	if (RegOpenKeyEx(HKEY_LOCAL_MACHINE, LANG_REG_LOC, 0, KEY_QUERY_VALUE, &hKeyDefault) != ERROR_SUCCESS)
	{	sprintf(lang,"US");
	}
	else
	{	cbData = 3;     // 3 char times 1 byte = (3) total of bytes	   mfg 02-apr-1999
		if (RegQueryValueEx(hKeyDefault, "DefaultLang", NULL, &dwType, (LPBYTE)lang, &cbData) != ERROR_SUCCESS)
		{	sprintf(lang,"US");
		}
		RegCloseKey(hKeyDefault);
	}
#endif

	result = RegOpenKeyEx(HKEY_LOCAL_MACHINE, LANG_REG_LOC, 0, KEY_READ, &key);
	if (result != ERROR_SUCCESS)	return 0;
	result = RegQueryInfoKey(key, NULL, NULL, NULL, NULL, NULL, NULL, &keys, NULL, NULL, NULL, NULL);
	if (result != ERROR_SUCCESS)	return 0;

	if (((*langs) = malloc(sizeof(LANG_ENUM))) == NULL)	return 0;
	maxkeys = keys;
	(*langs)->Languages = 0;
	(*langs)->MultiLang = TRUE;
#ifdef UNDER_CE
	if (((*langs)->Entries = malloc(keys*sizeof(LANG_ENTRY))) == NULL) 
	{	free(*langs);
		(*langs) = NULL;
		return 0;
	}
#else
	if (((*langs)->Entries = calloc(keys,sizeof(LANG_ENTRY))) == NULL)
	{	free(*langs);
		(*langs) = NULL;
		return 0;
	}
#endif
	lastkey = maxkeys - 1;
	nextentry = 1;
	for (keys = 0; keys < maxkeys; keys++)
	{	name = fetch.lang_code;
		name_size = 3;
		value = fetch.lang_name;
#ifdef UNDER_CE
		value_size = (40*2);
#else
		value_size = 40;
#endif

		result = RegEnumValue(key, keys, name, &name_size, NULL, &value_type, (unsigned char*) value, &value_size);
#ifdef UNDER_CE
		if ((name[0] == 'D') && (name[1] == 'e'))
#else
		if ((result != ERROR_SUCCESS))
#endif
		{	lastkey--;
			continue;		/* This would be DefaultLang */
		}
#ifdef UNDER_CE
		if (wcsicmp(fetch.lang_code, lang) == 0)
#else
		if (stricmp(fetch.lang_code, lang) == 0)
#endif
		{	curentry = 0;
		}
		else
		{	curentry = nextentry;
			nextentry++;
		}
		if (curentry > (int) lastkey)	curentry = 0;	// CAB 5/30/01 Warning
		memcpy(&(*langs)->Entries[curentry], &fetch, sizeof(LANG_ENTRY));
		(*langs)->Languages++;
	}
	RegCloseKey(key);
	return (sizeof(LANG_ENUM));
}
#endif // WIN32

BOOL TextToSpeechSelectLang(LPTTS_HANDLE_T tts, unsigned int id) {
	LANG_LIST *next = langs;
	LPLANG_HANDLE handle;

	handle = (LPLANG_HANDLE) tts;
	if (next == NULL)	return FALSE;
	while (id && next != NULL) {
		next = next->next;
		id--;
	}
	if (tts == NULL) {
#ifdef WIN32	// UNDER_CE
		alloc_pid(GetCurrentProcessId(),next);
#else
		alloc_pid(_getpid(),next);
#endif
		return TRUE;
	}
	handle->cur_lang = next;
	return TRUE;
}

#ifdef UNDER_CE
unsigned int TextToSpeechStartLang(wchar_t *inlang)
#else
unsigned int TextToSpeechStartLang(char *inlang)
#endif
{	LPLANG_LIST next;
	unsigned int id = 0;
	char lang[5];


	if (inlang==NULL)
	{
		return (TTS_NOT_SUPPORTED);
	}
#ifdef UNDER_CE
	lang[0] =(char)(inlang[0] & 0x00FF);													
	lang[1] =(char)(inlang[1] & 0x00FF);
	lang[2] = '\0';
#else
	lang[0] = toupper(inlang[0]);
	lang[1] = toupper(inlang[1]);
	lang[2] = '\0';
#endif

	/* Lock the great loading mutex */
#ifdef WIN32
	if (hGreatLoadMutex == NULL)
	{	hGreatLoadMutex = CreateMutex(NULL, TRUE, NULL);
		if (hGreatLoadMutex == NULL)	return FALSE;
	}
	else
	{	WaitForSingleObject(hGreatLoadMutex, INFINITE);
	}
#endif

#if defined (__osf__) || defined (__linux__) || defined _SPARC_SOLARIS_
	pthread_mutex_lock(hGreatLoadMutex);
#endif

	next = langs;
	while (next != NULL)
	{	if (strcmp(next->lang, lang) == 0)
		{	if (next->funcs.mod == NULL)
			{	id = load_dectalk(lang);
				ReleaseMutex(hGreatLoadMutex);
				return id;
			}
			next->funcs.inst_count++;
			/* added a missing ReleaseMutex MGS 05/22/1998 BATS #683 */
			ReleaseMutex(hGreatLoadMutex);
			return id;
		}
		next = next->next;
		id++;
	}
	id = load_dectalk(lang);
	ReleaseMutex(hGreatLoadMutex);
	return id;
}

#ifdef UNDER_CE
BOOL TextToSpeechCloseLang(wchar_t *inlang)
#else
BOOL TextToSpeechCloseLang(char *inlang)
#endif
{	LPLANG_LIST next;
	char lang[5];

	if (inlang==NULL)
	{
		return (TTS_NOT_SUPPORTED);
	}

#ifdef UNDER_CE
	lang[0] = (char)(towupper(inlang[0]));
	lang[1] = (char)(towupper(inlang[1]));
	lang[2] = TEXT('\0');
#else
	lang[0] = toupper(inlang[0]);
	lang[1] = toupper(inlang[1]);
	lang[2] = '\0';
#endif

	next = langs;
	while (next != NULL && strcmp(next->lang, lang) != 0)
	{	next = next->next;
	}
	if (next == NULL)	return FALSE;
	if (def_lang == next)
	{	next->funcs.inst_count--;
		def_lang = NULL;
	}
	next->funcs.inst_count--;
	if (next->funcs.inst_count != 0)	return FALSE;
/* MGS made chnge for __osf__ build */
#if !defined __osf__ && !defined __linux__ && !defined _SPARC_SOLARIS_
	FreeLibrary(next->funcs.mod);
#endif
	next->funcs.mod = NULL;
	return TRUE;
}

BOOL alloc_pid(int pid, LANG_LIST *lang)
{	/* MGS fixed error with mutexing of pids */
	LPPID_LIST next = NULL;

	/* Lock the greater PID mutex */
#ifdef WIN32
	if (hGreaterPIDMutex == NULL)
	{	hGreaterPIDMutex = CreateMutex(NULL, TRUE, NULL);
		if (hGreaterPIDMutex == NULL)	return FALSE;
	}
	else
	{	WaitForSingleObject(hGreaterPIDMutex, INFINITE);
	}
#endif

#if defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS_
	pthread_mutex_lock(hGreaterPIDMutex);
#endif

	/* MGS fixed error with mutexing of pids */
	next = pids;
	if (pids == NULL)
	{	pids = malloc(sizeof(PID_LIST));
		if (pids == NULL)
		{	ReleaseMutex(hGreaterPIDMutex);
			return FALSE;
		}
		next = pids;
	}
	else 
	{	while (next->next != NULL)	next = next->next;
		next->next = malloc(sizeof(PID_LIST));
		if (next->next == NULL)
		{	ReleaseMutex(hGreaterPIDMutex);
			return FALSE;
		}
		next = next->next;
	}
	next->pid = pid;
	next->lang = lang;
	next->next = NULL;
	ReleaseMutex(hGreaterPIDMutex);
	return TRUE;
}

LANG_LIST* find_pid(int pid)
{	/* MGS fixed error with mutexing of pids */
	LPPID_LIST next = NULL;

	/* Lock the greater PID mutex */
#ifdef WIN32
	if (hGreaterPIDMutex == NULL)
	{	hGreaterPIDMutex = CreateMutex(NULL, TRUE, NULL);
		if (hGreaterPIDMutex == NULL)	return FALSE;
	}
	else
	{	WaitForSingleObject(hGreaterPIDMutex, INFINITE);
	}
#endif

#if defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS_
	pthread_mutex_lock(hGreaterPIDMutex);
#endif

	/* MGS fixed error with mutexing of pids */
	next = pids;
	while (next != NULL)
	{	if (next->pid == pid)
		{	ReleaseMutex(hGreaterPIDMutex);
			return next->lang;
		}
		next = next->next;
	}
	ReleaseMutex(hGreaterPIDMutex);
	return NULL;
}

BOOL free_pid(int pid)
{	/* MGS fixed error with mutexing of pids */
	LPPID_LIST next = NULL, last = NULL;

	/* Lock the greater PID mutex */
#ifdef WIN32
	if (hGreaterPIDMutex == NULL)
	{	hGreaterPIDMutex = CreateMutex(NULL, TRUE, NULL);
		if (hGreaterPIDMutex == NULL)	return FALSE;
	}
	else
	{	WaitForSingleObject(hGreaterPIDMutex, INFINITE);
	}
#endif

#if defined __osf__ || defined __linux__ || defined _SPARC_SOLARIS_
	pthread_mutex_lock(hGreaterPIDMutex);
#endif

	/* MGS fixed error with mutexing of pids */
	next = pids;
	while (next != NULL)
	{	if (next->pid == pid)
		{
			if (next == pids)
			{	pids = next->next;
				free(next);
				ReleaseMutex(hGreaterPIDMutex);
				return TRUE;
			}
			last->next = next->next;
			free(next);
			ReleaseMutex(hGreaterPIDMutex);
			return TRUE;
		}
		last = next;
		next = next->next;
	}
	ReleaseMutex(hGreaterPIDMutex);
	return FALSE;
}

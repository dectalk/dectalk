/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1993, 1998           */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Digital Equipment         */
/*  Corporation. Possession, use, duplication or dissemination of     */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Digital Equipment Corporation.               */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Digital assumes no responsibility AT ALL for the use or           */
/*  reliability of this software.                                     */
/*                                                                    */
/*                                                                    */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Text-To-Speech API                                                */
/*  Author: Bill Hallahan                                             */
/*  Date: July 6, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This file contains all of the API function for             */
/*    Text-To-Speech using DECtalk under the Windows NT operating     */
/*    system.                                                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/* revision history
 * 29jul96              ...tek          repaired message passing for status.
 * 05aug96              ...tek          repaired memory freeing at shutdown.
 * 15nov96              ...gl           Spanish defaulted set to MODE_LATIN
 * 19nov96				...cjl			include license key once!
 * 06dec96				...cjl			add missing license ifdef.
 * 11Dec96              ...gl           Add language switch to set up
 *                                      lang_curr.  alos set defaluted
 *										modeflag to latin
 * 16Dec96				...gl			merge V4.3 008 code.
 * 08Jan97				...gl			merge Tom's "long reset" fix
 * 08Jan97				...gl			merge Tom's NT license control fix.
 *										fix the license mapping to only
 *										map the section once per instance.
 * 10Jan97              ...ksb          Added Reserved1 function to fetch spdef info
 * 31Jan97              ...ksb          Changed CUSTR_STR_VERSION to blank
 * 02apr97	tek		BATS 278 (initialize pcsSpcPktSave)
 * 01may97	tek		Licensing changes
 * 06may97	tek		BATS 320 (unregister TTSwnd class on shutdown)
 * 09jun97	tek		typing changes
 * 19jun97	tek		more typing changes
 * 01aug97	tek		bats423: initializations for audio fixes
 * 01aug97	tek		bats404: init the new message types
 * [Merged 28jul97
 * [10jan96 gl      fix text queueing sync. problem.
 * [16jun97	tek		bats385 (blocking between reset and speak/sync)
 * 06aug97  ncs     Shut off licenses if a static build.
 * 13aug97	ksb		BATS #??? to fix multi-thread problem
 *        			Promblem caused by UnregisterClass called from thread
 *					taking down the class while other threads were connected
 *					to it
 * 18aug97  ksb		Add new version info junk
 * 12sep97      ksb		Kurtzweil changes for SLOWtalk for 50 WPM in ACCESS32
 * 15sep97      tek             SMIT/Access32 licensing changes
 * 17sep97  ksb         Add new EnumLangs function for ML
 * 24oct97      tek             Bats497 delete and deallocate pcsVtmPipeRead
 * 25sep97  gl      use array structure for dictionary pointer.
 *                  also add UK support
 * 05nov97  gl                  for BATS#510 use array for all the dictionary entry.
 * 12nov97      tek             BATS513 (sneak path in speak/reset processing)
 * 12nov97	tek		BATS517 (popping)
 * 13nov97	tek		merge in sapi transport (bats 404?)(aug97)
 * 19nov97	tek		(typing mode) let VTM regulate both VTM and PH
 *					thread priority. Also, remove the "drop volume on 
 *					reset" code; this actually makes things more
 *					"clicky", and can leave the wave mixer in a bad
 *					state if we get shot while in the middle of the
 *					volume-down period.
 * 01jan98	MGS		Added TextToSpeechReserved3 for windic
 * 08Jan98      gl              BATS#547 send a dummy space after SYNC
 * 30jan98	tek		correct sync pipe length for BATS546
 * 27feb98  JAW     Merged CE code.
 * 18mar98      cjl             Removed specific path for dectalkf.h.
 * 01apr98  tek jl  Fixed TextToSpeechLogFiles for phoneme and text BATS#120 #614
 * 06apr98  JAW     Added TextToSpeechGetSpeakerParams and TextToSpeechSetSpeakerParams
 *                  functions.  Added function prototypes for GetSpeakerParams and
 *                  SetSpeakerParams (which are defined in ph_task.c).
 * 01may98  JL		BATS#657 Fix Access32 char to unsigned to handle ASCII code > 128
 *					For TextToSpeechTyping in Access32 	
 * 04may98  GL		only define licenses in production mode
 * 12may98	tek		bats 668 fix unload of the main dictionary
 * 27may98	tek		bats 689: threadsafe instance counting
 * 04jun98  ET		merged PHEDIT2 code
 */

/* et : merged from PHEDIT2 code  */
#ifdef PHEDIT2
#define WS_OVERLAPPEDWINDOW (WS_OVERLAPPED     | \
                             WS_CAPTION        | \
                             WS_SYSMENU)
#endif

/**********************************************************************/
/*  Include files.                                                    */
/**********************************************************************/

#include "dectalkf.h"

#include <windows.h>
#include <process.h>
#include <stdio.h>
#include <stdlib.h>    //MVP: For the routine atol()
#include <string.h>
#include <malloc.h>
#include <mmsystem.h>
#ifndef OLEDECTALK		//tek 01aug97 bats423
#include "playaudd.h"	// pick up the struct defs so we can load MsecPerSample
#endif //OLEDECTALK
#include "defs.h"
#include "esc.h"
#include "kernel.h"
#include "cmd.h"
#include "samprate.h"
#include "tts.h"
#define UPDATERG_C		//tek 01may97 pull the license key out of coop.h
#include "coop.h"
#include "ttserr.h"
#include "ttsfeat.h"

#ifdef _DEBUG
#include "vtminst.h"
#endif

// tek 05aug96 changes to allow freeing the PH thread data..
#include "ph_def.h"
void FreePHInstanceData(void *); // tek 05aug96 this is a broken prototype
// tek 03sep96 pull buffer flush into a separate routine..
void ReturnRemainingBuffers( LPTTS_HANDLE_T phTTS );
void DrainPipes(LPTTS_HANDLE_T phTTS); //tek 04sep96

/**********************************************************************/
/*  Symbol definitions.                                               */
/**********************************************************************/

#define  CUSTR_STR_VERSION		""   // CJL - Customer String

#ifdef ACCESS32
#define  MIN_SPEAKING_RATE   50			// Slowtalk for Kurtzweil
#else
#define  MIN_SPEAKING_RATE   75
#endif
#define  MAX_SPEAKING_RATE  600

#define  CMD_PIPE_LENGTH          64
#define  LTS_PIPE_LENGTH         128
#define  PH_PIPE_LENGTH          256
#define  VTM_PIPE_LENGTH       16384
#ifdef OLEDECTALK	// tek 29aug97 we use the sync pipe for visual, so it
					// needs to be longer.. much longer..
#define  SYNC_PIPE_LENGTH        2048
#else  //OLEDECTALK
// tek BATS546: used for DAPI now too..
#define  SYNC_PIPE_LENGTH        2048
#endif //OLEDECTALK
#define  BUFFER_PIPE_LENGTH      256
#define  MAX_TEXT_WRITE_LENGTH    16                      

/**********************************************************************/
/*  Window Messages.                                                  */
/**********************************************************************/

#define  ID_TTS_Queue_Text      WM_USER + 0
#define  ID_TTS_Destroy         WM_USER + 1

/**********************************************************************/
/*  Structure definitions.                                            */
/*  This structure is used by the TextToSpeechSpeak() function to     */
/*  send text information to the Text To Speech threads window        */
/*  procedure.                                                        */
/**********************************************************************/

typedef struct TEXT_MSG_TAG
{
  UINT uiMsgNumber;
  UINT uiLength;
  unsigned char * pText;
} TEXT_MSG_T;

/**********************************************************************/
/*  External function declarations.                                   */
/**********************************************************************/
extern int __stdcall cmd_main(LPVOID);

extern int __stdcall lts_main(LPVOID);                                 

extern int __stdcall ph_main(LPVOID);    /*For _beginthreadex the thread function should be a __stdcall */

extern int __stdcall vtm_main(LPVOID);

extern int __stdcall sync_main(LPVOID);

// tek 12nov97 this prototype somehow got out of sync with the
// actual module definition!?!
extern MMRESULT load_dictionary( LPTTS_HANDLE_T,
				 void **,
				 unsigned int *,
				 char *,
				 BOOL,
				 BOOL );

extern void unload_dictionary( void **, unsigned int * );

extern void SetSampleRate( LPTTS_HANDLE_T, unsigned int );

extern void cmd_init( LPTTS_HANDLE_T ,BOOL );

/* MVP : Function to free CMD thread specific memory allocations */
extern void FreeCMDThreadMemory(PVOID);

extern void ls_util_lts_init( PVOID );

extern void phinit( LPTTS_HANDLE_T , BOOL );

extern void InitializeVTM( LPTTS_HANDLE_T );
extern void free_index( PKSD_T);

extern unsigned int kernel_disable( PKSD_T pKsd_t );

extern void kernel_enable( PKSD_T pKsd_t, unsigned int );

/**********************************************************************/
/*  Function prototypes.                                              */
/**********************************************************************/

static LPTTS_BUFFER_T GetBuffer( LPTTS_HANDLE_T );

static void DeleteTextToSpeechObjects( LPTTS_HANDLE_T );
/* Function prototype for SetSpeaker now will have LPTTS_HANDLE_T arg for MI : MVP */
static void SetSpeaker( LPTTS_HANDLE_T,SPEAKER_T );

static DWORD __stdcall TextToSpeechThreadMain( LPTTS_HANDLE_T );

static HWND InitTextToSpeechWindow( LPTTS_HANDLE_T );

static LRESULT CALLBACK TextToSpeechWndProc( HWND,
						 UINT,
						 WPARAM,
						 LPARAM );

static void Process_TTS_Message( LPTTS_HANDLE_T, LPARAM );

static void WaitForTextQueuingToComplete( LPTTS_HANDLE_T, BOOL );

static unsigned char LinearToMuLaw( short );

static void FixMemoryLockup( LPTTS_HANDLE_T phTTS );

static MMRESULT WaitForEmptyPipes( LPTTS_HANDLE_T, DWORD, BOOL );
/*MVP : generic Dectalk system thread create function */

typedef unsigned int ( __stdcall * start_address )(void *);

static int StartDecTalkSystemThread(LPTTS_HANDLE_T phTTS,PHANDLE ppDecTalkThread,
									BOOL bMalloc, start_address ThreadFunction);

unsigned int PlayAudioCallbackRoutine( HPLAY_AUDIO_T pPlayAudio,
					   ATYPE_T aInstance,
									   ATYPE_T aMessage,
									   ATYPE_T aItem_1 );
VOID DefaultTTSCallbackRoutine(LONG lParam1,
							   LONG lParam2,
							   DWORD dwInstanceParam,
							   UINT uiMsg);

// 16JUN97 BATS 385 this is an internal-use-only routine..
// merged 28jul97 tek
MMRESULT TextToSpeechSpeakEx( LPTTS_HANDLE_T, LPSTR, DWORD, BOOL );

/**********************************************************************/
/*  Global variables.                                                 */
/**********************************************************************/

/*extern short uiCurrentSpeaker;*/    /* MVP MI */        

/*extern short last_voice;    */      /* MVP MI */

/*extern short sprate;        */      /* MVP MI */

/*The below line was commented out for MI : MVP
struct share_data kernel_data, *kernel_share = &kernel_data;
*/

/* The below line was commented out for MI :MVP*/
/*LPTTS_HANDLE_T phTTSglobal = NULL;*/

/*********************************************************************/
/* MVP : GLOBALS Added to load main dictionary only ONCE for all     */
/* instances                                                         */
  volatile int		gnInstanceCounter = 0;	//tek 27may98 needs to be volatile
  DECLARE_TLOCK		(tl_gnInstanceCounter); //tek 27may98 bats 689

  int far                   *gpufdic          = NULL;
  S32                       gufdic_entries     = 0;
#ifdef ACCESS32 // tek 15sep97 SMIT licensing
  char  gszA32Id[256]="";       // access32 identifier string
#endif //ACCESS32
/*********************************************************************/
// tek 30apr97 / 09jun97 some debugging stuff..
#ifdef _DEBUG
  FILE *fpODS_File=NULL;
#endif //DEBUG

#ifndef UNDER_CE
#ifndef DEMO
#ifndef STATIC_BUILD

#ifndef _DEBUG
#define LICENSES
#ifndef LICENSES
This line will cause an error to signal the fact that the license symbol,
was not defined.
#endif
#endif



#endif // STATIC_BUILD
#endif // DEMO
#endif  // UNDER_CE

#undef DECTALKBETA430      //MVP:04/09/96 A message will be spoken for Beta releases.

#ifdef LICENSES
#define SHMEMSIZE 10
#define MAX_STR 134

/** *** Global to keep track of whether we've mapped the license shmem *** */
static unsigned int guiLoadedLicenseShare = FALSE;
/** tek 08jan97 **/
  
/*#define LICENSE_KEY 30987*/
/*moved to coop.h as an include 11/19/96 cjl*/
#define LICENSE_KEY_ERROR -1
/* note that the following is global, and thus must be dealt with on 
 * a PER INSTANCE (of the DLL) basis */
static LPVOID lpvMemLicense = NULL; /* address of shared memory */
BOOL AddLicenseRef(void);
void ReleaseLicenseRef(void);
static int GetFromSomeWhere(void);
extern  unsigned int decryptString(const unsigned char *input,unsigned long key,unsigned char *string);
#if 0
static int CreateTheLicenseKey(void);
#endif //0
#endif //LICENSES

// 06apr97 tek BATS320
// we need to use this string in two places, so make it a macro..
#define TEXTTOSPEECHWNDCLASS "TextToSpeechWndClass"	// KSB - Aug13 Fix BATS #??? for
							// WNDCLASS Unregister Bug

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: LibMain                                                 */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         LibMain is called by Windows when the dectalk DLL is       */
/*    initialized, Thread Attached, and other times. Since no DLL     */
/*    initialization is required, LibMain return a value of 1         */
/*    indicating success.                                             */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

int APIENTRY LibMain( HANDLE hInst,
			  DWORD ul_reason_being_called,
			  LPVOID lpReserved )
{

	switch(ul_reason_being_called)
	{
		/*
		 * DLL is attaching to a process.It could be
		 * while process getting loaded (The process 
		 * might have used load-time dynamic linking i.e
		 * built using dectalk.lib import library)
		 * OR   
		 * Process made a call to LoadLibrary(dectalk.dll)
		 */
	case DLL_PROCESS_ATTACH :
//#ifdef LICENSES
//              if (!AddLicenseRef())
//                      return FALSE; // no licenses.
//#endif
	break;
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	case DLL_PROCESS_DETACH :
//#ifdef LICENSES
//              ReleaseLicenseRef();
//#endif
		break;
	}

	return(TRUE);
//  return( 1 );
//  UNREFERENCED_PARAMETER( hInst );
//  UNREFERENCED_PARAMETER( ul_reason_being_called );
//  UNREFERENCED_PARAMETER( lpReserved );
}


/**********************************************************************/
/*  Function: GetFromSomeWhere                                        */
/**********************************************************************/

#ifdef LICENSES
int GetFromSomeWhere()
{
#ifdef ACCESS32 // tek 15sep97 SMIT licensing
#define ACCESS32_LICENSE_COUNT (4)
        return ACCESS32_LICENSE_COUNT;
#else //ACCESS32
        HKEY hKeyLicense = NULL;
	// tek 01may97 key now comes from coop.h
	CHAR szLicensesEncrypted[MAX_STR];
	char szLicenses[64];
	DWORD dwType,cbData;

	if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
			 szLicenseKey,
			 0,
			 KEY_QUERY_VALUE,
			 &hKeyLicense ) != ERROR_SUCCESS )
	{
		return LICENSE_KEY_ERROR;
	}
	else
	{
		cbData = MAX_STR;
		if ( RegQueryValueEx( hKeyLicense,
			  "Licenses",
			  NULL,
			  &dwType,
			  (LPBYTE)szLicensesEncrypted,
			  &cbData ) != ERROR_SUCCESS )
		{
			return LICENSE_KEY_ERROR;
		}       

		RegCloseKey( hKeyLicense );
	}
	
	if (decryptString((const unsigned char *)szLicensesEncrypted,LICENSE_KEY,(unsigned char *)szLicenses))
	{
		return(atol(szLicenses));
	}
	return(LICENSE_KEY_ERROR);
#endif //ACCESS32
}

// tek 22aug96

HANDLE hMapObject = NULL; // to get to the file map..


/**********************************************************************/
/* check and increment the license count. Must be paired              */
/* with a ReleaseLicenseRef call on shutdown.                         */
/**********************************************************************/

BOOL AddLicenseRef(void)
{
	BOOL fInit,fIgnore;
	DWORD dwMAXRunTimeLicenses ;
	DWORD dwLicenseCount;


	dwMAXRunTimeLicenses = GetFromSomeWhere();
		
	if(dwMAXRunTimeLicenses == LICENSE_KEY_ERROR)
	{
#ifndef UNDER_CE
		MessageBox(NULL,"Text-to-speech license information invalid!",
			"LicenseKey",MB_ICONSTOP|MB_OK);
#else
		MessageBox(NULL,_T("Text-to-speech license information invalid!"),
			_T("LicenseKey"),MB_ICONSTOP|MB_OK);
#endif
		return FALSE;  // Don't load DLL
	}
	 /* Create a named file mapping object */ 
	// 0 means Unlimited Licenses :Just return from DllEntry function.
	if(!dwMAXRunTimeLicenses)     
		return TRUE;
 	if (!guiLoadedLicenseShare)			 /* tek 08Jan97 BATS 205*/
	{
 		hMapObject = CreateFileMapping( 
				(HANDLE) 0xFFFFFFFF, /* use paging file    */ 
				NULL,                /* no security attr.  */ 
				PAGE_READWRITE,      /* read/write access  */ 
				0,                   /* size: high 32-bits */ 
				SHMEMSIZE,           /* size: low 32-bits  */
#ifndef ACI_LICENSE	//tek 01may97
#ifdef WILLOWPOND
				"wpDECtalkDllLicensememfilemap");    /* name of map object */
#else // not aci, not willowpond
#ifdef ACCESS32 // tek 15sep97
                                "a32DECtalkDllFileMap");                        /* name of map object */
#else // not aci, not willowpond, not access32
                                "DECtalkDllLicensememfilemap");    /* name of map object */
#endif //ACCESS32
#endif //WILLOWPOND
#else
				"AciSpeechLicenseMemFileMap");	/* name of map object */
#endif

		if (hMapObject == NULL) 
			return FALSE; 
 
		/* The first process to attach initializes memory. */ 
 
		fInit = (GetLastError() != ERROR_ALREADY_EXISTS); 
#ifdef ACCESS32 //tek 15sep97 SMIT licensing
                // ACCESS32 requires the SMITxx code to do the init..
                if (fInit)      // false if the section already exists
                {
                                // get rid of the handle
                                CloseHandle(hMapObject);
                                // return a license failure.
                                return FALSE;
                } // if (fInit)
#endif //ACCESS32
                                                                                                                                                                                /* Get a pointer to the file-mapped shared memory. */
 
		lpvMemLicense = MapViewOfFile( 
				hMapObject,     /* object to map view of    */ 
				FILE_MAP_WRITE, /* read/write access        */ 
				0,              /* high offset:   map from  */ 
				0,              /* low offset:    beginning */ 
				0);             /* default: map entire file */ 
		if (lpvMemLicense == NULL) 
			return FALSE; 
 
		/* Initialize memory if this is the first process. */ 
		if (fInit)
		{
			//memset(lpvMemLicense, '\0', SHMEMSIZE);
			*(PDWORD)lpvMemLicense = (DWORD)0;
			// To set the Number of Licenses

		}
#ifdef ACCESS32 //tek 15sep97 SMIT licensing
        else
        {
             char *szMemLicense=NULL;
             char szEncryptedString[512]="";
             UINT uiResult=0;
             // we have to check that the memory area is valid..
             szMemLicense = (char *)(lpvMemLicense);
             strcpy(szEncryptedString,&szMemLicense[4]);     // this is [4], because the
                                                             // first DWORD is the license
                                                             // count.
             // decrypt it..
             uiResult = decryptString(szEncryptedString,
                 DEFAULT_ACCESS32_KEY,
                 gszA32Id);

             if (!uiResult)
             {
                 // unmap the section
                 UnmapViewOfFile(lpvMemLicense);
                 // get rid of the handle
                 CloseHandle(hMapObject);
                 // return a license failure.
                 return FALSE;
             }
        }

#endif //ACCESS32

	 	guiLoadedLicenseShare = TRUE;
	}
	/* tek 08jan97, BATS 205 */
	/* make sure we have the section.. */
	if (lpvMemLicense == NULL) 
		return FALSE; 

	 // Increment Run-time License Counter.(i.e How many Processes are using DECtalk.dll)
	 (*(PDWORD)lpvMemLicense)++;
	 dwLicenseCount =  (*(PDWORD)lpvMemLicense);

	 if(*(PDWORD)lpvMemLicense > dwMAXRunTimeLicenses)
	 {
		 // Decrement Run-time License Counter.(i.e How many Processes are using DECtalk.dll)
		 (*(PDWORD)lpvMemLicense)--;
		 /* tek 08jan97 BATS 205 */
		 /* only unmap the section if the count is zero - which */
		 /* should never happen, I think.. */
		 if (*(PDWORD)lpvMemLicense == 0)
		 {
			/* Unmap shared memory from the process's address space. */ 
			fIgnore = UnmapViewOfFile(lpvMemLicense); 
			/* Close the process's handle to the file-mapping object. */ 
			fIgnore = CloseHandle(hMapObject); 
			guiLoadedLicenseShare = FALSE;
		 }
		 
#ifndef UNDER_CE
		 MessageBox(NULL,"Insufficient Text-to-Speech Run-time Licenses.","Licenses",MB_ICONSTOP|MB_OK);
#else
		 MessageBox(NULL,_T("Insufficient Text-to-Speech Run-time Licenses."),_T("Licenses"),MB_ICONSTOP|MB_OK);
#endif
		 return FALSE; //Don't load DLL
	 }
	 else
	 {
		 return TRUE;
	 }

}

#endif // LICENSES ( above GetFromSomeWhere() )

/**********************************************************************/
/* release a license use count                                        */
/**********************************************************************/
void ReleaseLicenseRef(void)
{
#ifndef LICENSES
	return;
#else
	BOOL    fIgnore;
	DWORD dwMAXRunTimeLicenses ;
	dwMAXRunTimeLicenses = GetFromSomeWhere();
	if(dwMAXRunTimeLicenses == LICENSE_KEY_ERROR)
		return;
	if(!dwMAXRunTimeLicenses)  //MVP: For '0'licenses return.   
		return;
	// Decrement Run-time license counter.
	(*(PDWORD)lpvMemLicense)--;
	if (*(PDWORD)lpvMemLicense == 0)  /* tek 08jan96 BATS 205 */
	{
		/* Unmap shared memory from the process's address space. */ 
		fIgnore = UnmapViewOfFile(lpvMemLicense); 
		/* Close the process's handle to the file-mapping object. */ 
		fIgnore = CloseHandle(hMapObject); 
		guiLoadedLicenseShare = FALSE;
	}
#endif // LICENSES ( above GetFromSomeWhere() )
}

#ifdef LICENSES

/**********************************************************************/
/* Stub function to Query for License key                             */
/* (If it doesn't exist,create the key and set the value)             */
/* (else Do nothing)  :Later this part moves to Install script.       */
/**********************************************************************/

#endif // LICENSES ( above GetFromSomeWhere() )

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechStartupEx                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: April 13, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    DECtalk initialization function.                                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*    hWnd                A handle to the parent window.              */
/*                                                                    */
/*    pphTTS              A pointer to a pointer to a structure of    */
/*                        type TTS_HANDLE_T. This function allocates  */
/*                        memory for the structure.                   */
/*                                                                    */
/*    uiDeviceNumber      An unsigned integer which is the wave out   */
/*                        device ID number. WAVE_MAPPER may be used   */
/*                        here if the device ID number is unknown.    */
/*                                                                    */
/*    dwDeviceOptions     A DWORD which specifies how the wave output */
/*                        device is managed. It may be a combination  */
/*                        of the following values:                    */
/*                                                                    */
/*       value                 performance characteristic             */
/*                                                                    */
/*  OWN_AUDIO_DEVICE      The wave output device will be opened upon  */
/*                        return from this function. No other process */
/*                        may allocate the wave output device until   */
/*                        the CloseAudio() function is called. If     */
/*                        there are no wave output devices in the     */
/*                        system then MMSYSERR_NOTSUPPORTED will be   */
/*                        returned and the Text-To-Speech system will */
/*                        not be started.                             */
/*                                                                    */
/*                        If OWN_AUDIO_DEVICE is NOT specified then   */
/*                        the wave output device will be opened       */
/*                        sometime after audio is queued by the       */
/*                        TextToSpeechSpeak() function. The wave      */
/*                        output device will be held as long as       */
/*                        sufficient audio samples are queued.        */
/*                        Otherwise the device will be released.      */
/*                                                                    */
/*  REPORT_OPEN_ERROR     If an attempt is made to open the wave      */
/*                        output device while another process owns    */
/*                        it, then an error message will be sent to   */
/*                        the window procedure which corresponds to   */
/*                        the window handle which is passed to this   */
/*                        function.                                   */
/*                                                                    */
/*  DO_NOT_USE_AUDIO_DEVICE  The Text-To-Speech system may only be    */
/*                           used to write wave files, write speech   */
/*                           samples to memory, or log phonemes. No   */
/*                           error will be returned if a wave output  */
/*                           device is not present.                   */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if initialization was successful.            */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NODRIVER      No wave out device driver present        */
/*    MMSYSERR_BADDEVICEID   Device ID out of range                   */
/*    MMSYSERR_NOMEM         Unable to allocate memory                */
/*    MMSYSERR_ERROR         Dictionary not found                     */
/*    MMSYSERR_INVALPARAM    Invalid param for th eload dictionary    */
/*    WAVERR_BADFORMAT       A wave device exists, but does not       */
/*                           the required format.                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  STARTUP_LOOP_WAIT_TIME   50
#define  MAX_STARTUP_WAIT_COUNT  200

MMRESULT TextToSpeechStartupEx( LPTTS_HANDLE_T * pphTTS,
				  UINT uiDeviceNumber,
				  DWORD dwDeviceOptions,
				  VOID (*DtCallbackRoutine)(LONG,LONG,DWORD,UINT),
				  LONG dwTTSInstanceParameter)
{
  MMRESULT mmStatus;
  UINT i;
#ifdef OLEDECTALK
  LPAUDIO_HANDLE_T pPlayAudio;
#else
  HPLAY_AUDIO_T pPlayAudio;         //New audio Integration
#endif //OLEDECTALK

  LPWAVEFORMATEX pWaveFormat;	// 01aug97 bats423: now used for both SAPI and DAPI

  LPTTS_HANDLE_T phTTS;
  int nReturnCode;           /*MVP : a variable to hold the return value of this API*/

  P_PIPE cmd_pipe = NULL_PIPE;
  P_PIPE lts_pipe = NULL_PIPE;
  P_PIPE ph_pipe  = NULL_PIPE;
  P_PIPE vtm_pipe = NULL_PIPE;
  P_PIPE sync_pipe = NULL_PIPE;
  /* Define a variable for kernel_share_data to allocate after dynamically :MVP
  */
  PKSD_T pKsd_t = NULL;

#ifdef LICENSES
#define MAX_INSTANCES_EXCEEDED  (MMSYSERR_ALLOCATED) // tek 29jul96


if (!AddLicenseRef())
	{
	return MAX_INSTANCES_EXCEEDED;
	}

#endif //LICENSES

  /********************************************************************/
  /*  Set default parameters.                                         */
  /********************************************************************/

  /* 
   * Allocate kernel_share_data structure to make unique for each instance MVP
   */
	
  if((pKsd_t = (PKSD_T) calloc(1,sizeof(KSD_T))) == NULL)
  {
#ifdef LICENSES
	  ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	  return( MMSYSERR_NOMEM );
  }

  /* GL 09/25/1997 initialize the dictionary entry */
  for (i=0; i < MAX_languages; ++i)
  {
	pKsd_t->adic[i] = 0;
	pKsd_t->udic[i] = 0;
	pKsd_t->fdic[i] = 0;
	pKsd_t->adic_entries[i] = 0;
	pKsd_t->udic_entries[i] = 0;
	pKsd_t->fdic_entries[i] = 0;
  }

  pKsd_t->cmd_flush = FALSE;
  pKsd_t->spc_flush = FALSE;
  pKsd_t->halting = FALSE;
  pKsd_t->logflag  = 0;
  /* GL 11/15/1996 set defaulted Spanish to Latin */
#ifdef LATIN_AMERICAN
  pKsd_t->modeflag = MODE_CITATION | MODE_LATIN;
#else
  pKsd_t->modeflag = MODE_CITATION;
#endif //LATIN_AMERICAN
  pKsd_t->sayflag = SAY_CLAUSE;
  pKsd_t->pronflag = 0;
  pKsd_t->wbreak = FALSE;
  pKsd_t->text_flush = FALSE;
  pKsd_t->async_change = FALSE;
  pKsd_t->SamplePeriod = 9.07029478458E-5 ;  /* Initialize sample period */
  pKsd_t->spc_pkt_save = NULL_SPC_PACKET;
  pKsd_t->loaded_languages = NULL;           //MVP:05/10/96 Fixed an exception(When DECtalk runs on a machine without audio card)
  /********************************************************************/
  /*  Create the TTS handle.                                          */
  /********************************************************************/

  phTTS = (LPTTS_HANDLE_T )calloc(1,sizeof(TTS_HANDLE_T));

  if ( phTTS == NULL )
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	free(pKsd_t);			// tek 23sep96 plug memory leak
	pKsd_t = NULL;
	return( MMSYSERR_NOMEM );
  }

  phTTS->dwDeviceOptions = dwDeviceOptions;
  // tek 13nov97 bats whatever: fix use of instance parameter as window
  if (dwDeviceOptions&TTSSTARTUP_USING_DEFAULT_CALLBACK)
  {
	phTTS->hWnd = (HWND)dwTTSInstanceParameter;  //Backward compatibilty for TextToSpeechStartupEx
  }
  else
  {
	phTTS->hWnd = NULL; // the instance param is just that!
  }

  phTTS->uiCurrentMsgNumber = 1;
  phTTS->uiLastTextMsgNumber = 0;
  phTTS->uiFlushMsgNumber = 0;
  phTTS->dwQueuedSampleCount = 0;
  phTTS->uiQueuedCharacterCount = 0;
  phTTS->dwOutputState = STATE_OUTPUT_NULL;
  phTTS->bEnableErrorMessage = TRUE;
  phTTS->bMemoryReset = FALSE;
  /* Initialize new element "pKernelShareData" for MI :MVP */
  phTTS->pKernelShareData = pKsd_t;
  /********************************************************************/
  /*  Initialize all of the handle objects to NULL.                   */
  /********************************************************************/

  phTTS->pAudioHandle = NULL;
  phTTS->hSyncEvent = NULL;
  phTTS->hNotEmptyingVtmPipeEvent = NULL;
  phTTS->pcsLogFile = NULL;
  phTTS->pcsQueuedCharacterCount = NULL;
  phTTS->pcsFlushMsgNumber = NULL;
  phTTS->pcsLastQueuedTextMsgNumber = NULL;
  phTTS->pcsQueuedSampleCount = NULL;

  phTTS->hThread_TXT = NULL;
  phTTS->hThread_CMD = NULL;
  phTTS->hThread_LTS = NULL;
  phTTS->hThread_PH = NULL;
  phTTS->hThread_VTM = NULL;
  phTTS->hThread_SYNC = NULL;
  /*************************************************************************/
  /*  Initialize all of the Thread specific data structure pointers to NULL*/
  /*  Murthy Parakala : for multiple instances                             */
  /*************************************************************************/
  phTTS->pCMDThreadData = NULL;            /*CMD Thread */
  phTTS->pLTSThreadData = NULL;            /*LTS Thread */ 
  phTTS->pVTMThreadData = NULL;            /*VTM Thread */
  phTTS->pPHThreadData = NULL;             /*PH  Thread */
  phTTS->hMallocSuccessEvent = NULL;   /* Event handle for successful memory allocations*/
#ifdef TYPING_MODE	//09jun97 tek
  phTTS->wTypingFrameCount=0;
#endif //TYPING_MODE  
  /*****************************************************************/
  /*  Initialize Instance specific CallbackFunction,Instance parameter
  /*  MVP : 05/08/96
  /*****************************************************************/
  phTTS->DtCallbackRoutine = DtCallbackRoutine;
  phTTS->dwTTSInstanceParameter = dwTTSInstanceParameter;
  phTTS->hmxCallback = NULL;
  /********************************************************************/
  /*  Create the queued sample count critical section.                */
  /********************************************************************/

  phTTS->pcsQueuedSampleCount =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( phTTS->pcsQueuedSampleCount == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

#ifdef DTALK50
  phTTS->CPanelThread = CPInitAPI();
#endif //DTALK50

  InitializeCriticalSection( phTTS->pcsQueuedSampleCount );

  /********************************************************************/
  /*  Create the last queued text message number critical section.    */
  /********************************************************************/

  phTTS->pcsLastQueuedTextMsgNumber =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( phTTS->pcsLastQueuedTextMsgNumber == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  InitializeCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );

  /********************************************************************/
  /*  Create the flush message number critical section.               */
  /********************************************************************/

  phTTS->pcsFlushMsgNumber =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( phTTS->pcsFlushMsgNumber == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  InitializeCriticalSection( phTTS->pcsFlushMsgNumber );

  /********************************************************************/
  /*  Create the queued character count critical section.             */
  /********************************************************************/

  phTTS->pcsQueuedCharacterCount =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( phTTS->pcsQueuedCharacterCount == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  InitializeCriticalSection( phTTS->pcsQueuedCharacterCount );

  
  /* tek 6mar97 bats 278 */
  /********************************************************************/
  /*  Create the index list critical section.                         */
  /********************************************************************/

  pKsd_t->pcsSpcPktSave =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( pKsd_t->pcsSpcPktSave == NULL )
  {
	ReleaseLicenseRef(); // tek 23sep96
	DeleteTextToSpeechObjects( phTTS );
	return( MMSYSERR_NOMEM );
  }

  InitializeCriticalSection( pKsd_t->pcsSpcPktSave );
  
  /* end 6mar97 bats 278 */

  /********************************************************************/
  /*  Create the vtm pipe read critical section.                      */
  /********************************************************************/
  // tek 09jun97 needed to allow fast flushing of the  VTM
  pKsd_t->pcsVtmPipeRead =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( pKsd_t->pcsVtmPipeRead == NULL )
  {
	ReleaseLicenseRef(); // tek 23sep96
	DeleteTextToSpeechObjects( phTTS );
	return( MMSYSERR_NOMEM );
  }

  InitializeCriticalSection( pKsd_t->pcsVtmPipeRead );
  
  /********************************************************************/
  /*  Create the log file critical section.                           */
  /********************************************************************/

  phTTS->pcsLogFile =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( phTTS->pcsLogFile == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  InitializeCriticalSection( phTTS->pcsLogFile );

  /********************************************************************/
  /*  Create a "Sync" event. The initial state is not signaled.       */
  /********************************************************************/

  phTTS->hSyncEvent = CreateEvent( NULL, TRUE, FALSE, NULL );

  if ( phTTS->hSyncEvent == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  /********************************************************************/
  /*  Create a "Not Emptying Vtm Pipe" event. The initial state is    */
  /*  signaled.                                                       */
  /********************************************************************/

  phTTS->hNotEmptyingVtmPipeEvent = CreateEvent( NULL, TRUE, TRUE, NULL );

  if ( phTTS->hNotEmptyingVtmPipeEvent == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  /*******************************************************************/
  /*  Create the TTS callback mutex.                                 */
  /*******************************************************************/

   if ( DtCallbackRoutine != NULL )
   {
	  phTTS->hmxCallback = OP_CreateMutex();

	  if ( phTTS->hmxCallback == NULL )
	  {
		 DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
		 ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
		 return MMSYSERR_NOMEM;
	  }
   }


  /********************************************************************************/
  /*  MVP :Create a "Successful Memory Allocation " event.                        */
  /*  The event configuration is non-inheritable,AUTO RESET,not signaled, Unnamed */
  /********************************************************************************/

  phTTS->hMallocSuccessEvent = CreateEvent( NULL, FALSE, FALSE, NULL );

  if ( phTTS->hMallocSuccessEvent == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  /********************************************************************/
  /*  Initialize the inter-thread communication pipes.                */
  /********************************************************************/

  cmd_pipe = create_pipe( BYTE_PIPE, CMD_PIPE_LENGTH );

  if ( cmd_pipe == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  lts_pipe = create_pipe( WORD_PIPE, LTS_PIPE_LENGTH );

  if ( lts_pipe == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  ph_pipe = create_pipe( WORD_PIPE, PH_PIPE_LENGTH );

  if ( ph_pipe == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  vtm_pipe = create_pipe( WORD_PIPE, VTM_PIPE_LENGTH );

  if ( vtm_pipe == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  sync_pipe = create_pipe( DWORD_PIPE, SYNC_PIPE_LENGTH );

  if ( sync_pipe == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  /********************************************************************/
  /*  Set default pipe parameters.                                    */
  /********************************************************************/
  /* Comment out the below line for MI : MVP */
  /*
  kernel_share = &kernel_data;
  */

  for ( i = 0; i < MAX_languages; i++ )
  {
	pKsd_t->lang_lts[i] = NULL_PIPE;
	pKsd_t->lang_ph[i]  = NULL_PIPE;
	pKsd_t->lang_ready[i] = 0;
  }

  pKsd_t->lang_lts[0] = lts_pipe;
  pKsd_t->lang_ph[0] = ph_pipe;

  pKsd_t->lts_pipe = pKsd_t->lang_lts[0];
  pKsd_t->ph_pipe = pKsd_t->lang_ph[0];

  pKsd_t->cmd_pipe = cmd_pipe;
  pKsd_t->vtm_pipe = vtm_pipe;
  pKsd_t->sync_pipe = sync_pipe;

  /*
     GL 12/11/1996, set up the language flag pKsd_t->lang_curr
     this flag will be used in CMD and phlog.c to pick up the language
     depended code
  */
#ifdef ENGLISH_US
  pKsd_t->lang_lts[LANG_english] = lts_pipe;
  pKsd_t->lang_ph[LANG_english] = ph_pipe;
  
  pKsd_t->lts_pipe = pKsd_t->lang_lts[LANG_english];
  pKsd_t->ph_pipe = pKsd_t->lang_ph[LANG_english];
  pKsd_t->lang_curr = LANG_english;
#endif //ENGLISH_US
#ifdef ENGLISH_UK
  pKsd_t->lang_lts[LANG_british] = lts_pipe;
  pKsd_t->lang_ph[LANG_british] = ph_pipe;
  
  pKsd_t->lts_pipe = pKsd_t->lang_lts[LANG_british];
  pKsd_t->ph_pipe = pKsd_t->lang_ph[LANG_british];
  pKsd_t->lang_curr = LANG_british;
#endif //ENGLISH_UK
#ifdef SPANISH
  pKsd_t->lang_lts[LANG_spanish] = lts_pipe;
  pKsd_t->lang_ph[LANG_spanish] = ph_pipe;

  pKsd_t->lts_pipe = pKsd_t->lang_lts[LANG_spanish];
  pKsd_t->ph_pipe = pKsd_t->lang_ph[LANG_spanish];

  pKsd_t->lang_curr = LANG_spanish;
 #endif //SPANISH
 #ifdef GERMAN
  pKsd_t->lang_lts[LANG_german] = lts_pipe;
  pKsd_t->lang_ph[LANG_german] = ph_pipe;

  pKsd_t->lts_pipe = pKsd_t->lang_lts[LANG_german];
  pKsd_t->ph_pipe = pKsd_t->lang_ph[LANG_german];
  pKsd_t->lang_curr = LANG_german;
 #endif //GERMAN
 #ifdef FRENCH
  pKsd_t->lang_lts[LANG_french] = lts_pipe;
  pKsd_t->lang_ph[LANG_french] = ph_pipe;

  pKsd_t->lts_pipe = pKsd_t->lang_lts[LANG_french];
  pKsd_t->ph_pipe = pKsd_t->lang_ph[LANG_french];
  pKsd_t->lang_curr = LANG_french;
 #endif //FRENCH

  /********************************************************************/
  /*  Get the DECtalk error message.                                  */
  /********************************************************************/

  phTTS->uiID_Error_Message =
	RegisterWindowMessage("DECtalkErrorMessage");

  if ( phTTS->uiID_Error_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  /********************************************************************/
  /*  Get the DECtalk index mark message.                             */
  /********************************************************************/

  phTTS->uiID_Index_Message =
	RegisterWindowMessage("DECtalkIndexMessage");

  if ( phTTS->uiID_Index_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }
	
  // tek 01aug97 bats 404 register messages for 
  // bookmark, wordpos, start, stop.

  phTTS->uiID_Bookmark_Message =
	RegisterWindowMessage("DECtalkBookmarkMessage");

  if ( phTTS->uiID_Bookmark_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  phTTS->uiID_Wordpos_Message =
	RegisterWindowMessage("DECtalkWordposMessage");

  if ( phTTS->uiID_Wordpos_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  phTTS->uiID_Start_Message =
	RegisterWindowMessage("DECtalkStartMessage");

  if ( phTTS->uiID_Start_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  phTTS->uiID_Stop_Message =
	RegisterWindowMessage("DECtalkStopMessage");

  if ( phTTS->uiID_Stop_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  // tek 27aug97 
  phTTS->uiID_Visual_Message =
	RegisterWindowMessage("DECtalkVisualMessage");

  if ( phTTS->uiID_Visual_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }


  /********************************************************************/
  /*  Get the DECtalk buffer message.                                 */
  /********************************************************************/

  phTTS->uiID_Buffer_Message =
	RegisterWindowMessage("DECtalkBufferMessage");

  if ( phTTS->uiID_Buffer_Message == 0 )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

  /********************************************************************/
  /*  Initialize the audio driver.                                    */
  /********************************************************************/

  if (( dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
  {
	/********************************************************************/
	/*  Allocate memory for the local WAVEFORMATEX structure.           */
	/********************************************************************/
	// 01aug97 bats423: allocate this for both SAPI and DAPI
	pWaveFormat = (LPWAVEFORMATEX)malloc(sizeof(WAVEFORMATEX));

	if ( pWaveFormat == NULL )
	{
	  DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	  return( MMSYSERR_NOMEM );
	}

#ifndef OLEDECTALK
	/********************************************************************/
	/*  Fill in all the required fields of the WAVEFORMATEX structure.  */
	/********************************************************************/

	pWaveFormat->wFormatTag = WAVE_FORMAT_PCM;
	pWaveFormat->nSamplesPerSec = PC_SAMPLE_RATE;
	pWaveFormat->nChannels = 1;
	pWaveFormat->wBitsPerSample = 16;

	/********************************************************************/
	/*  Open the audio device.                                          */
	/********************************************************************/

	mmStatus = PA_CreatePlayHandle( &pPlayAudio,
									uiDeviceNumber,
									pWaveFormat,
									dwDeviceOptions,
									PlayAudioCallbackRoutine,
									(ATYPE_T)phTTS);
	// bats423: free (pWaveFormat) done later
#else //OLEDECTALK
	/*******************************************************/
	/* Initialize the DECtalk audio system for OLE-DECTALK */
	/*******************************************************/
	mmStatus = InitializeDECtalkAudio((HWND)dwTTSInstanceParameter,&pPlayAudio);
#endif //OLEDECTALK

	if ( mmStatus )
	{
#ifdef LICENSES
		ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
		DeleteTextToSpeechObjects( phTTS );
		free( pWaveFormat ); // bats423
#ifdef _DEBUG
		OutputDebugString("ttsapi: error initializing audio\n");
#endif //_DEBUG
		if ( mmStatus == MMSYSERR_ERROR ) // tek 24sep96
		{
			return( MMSYSERR_NODRIVER );
		}
#ifdef DONT_RETURN_BADFORMAT
		else if (mmStatus == WAVERR_BADFORMAT)
		{	// tek 24sep96 we'd really like to return BADFORMAT here
			// but that will break existing users. Baggage..
			return (MMSYSERR_NODRIVER);
		} 
#endif //DONT_RETURN_BADFORMAT
		else
			return( mmStatus );
		}

	phTTS->pAudioHandle = pPlayAudio;
	phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
	// tek 01aug97 bats423 init some stuff for later use here..
#ifdef OLEDECTALK
	phTTS->pAudioHandle->pcMode = NULL; // this gets filled in later.
#endif //OLEDECTALK
	// get the sample rate and stash it away.. 
    PA_GetFormat(pPlayAudio,pWaveFormat);
	pPlayAudio->dMsecPerSample = 
		(double)(1000)/(double)(pWaveFormat->nAvgBytesPerSec);
	free( pWaveFormat );

  }
  else // tek 01jul97/01aug97 bats 423
	   //have to deal with the DO_NOT_USE_AUDIO_DEVICE
	   // case for DAPI..  (well, not really, but doing this here 
	   // reminds us that there IS another case..
  {
	  phTTS->pAudioHandle = NULL;
  }

  /********************************************************************/
  /*  Start the Synchronization thread.                               */
  /********************************************************************/
  if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_SYNC),
		FALSE,(start_address)sync_main))== MMSYSERR_NOMEM)
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif // LICENSES
	return(MMSYSERR_NOMEM);
  }

  /********************************************************************/
  /*  Start the Vocal Tract Model thread.                             */
  /********************************************************************/
  if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_VTM),
		TRUE,(start_address)vtm_main))== MMSYSERR_NOMEM)
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return(MMSYSERR_NOMEM);
  }

  /********************************************************************/
  /*  Start the Phonetic processing thread.                           */
  /********************************************************************/
  if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_PH),
		TRUE, (start_address)ph_main))== MMSYSERR_NOMEM)
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return(MMSYSERR_NOMEM);
  }

#ifdef TYPING_MODE	 //09jun97 tek
  // elevate the PH and VTM thread priority
  if (phTTS->dwOutputState == STATE_OUTPUT_AUDIO)
  {
	// 19nov97 VTM adjusts the priority of both PH and VTM, so we
	// set it high to start and then let it back down automagically
#ifndef UNDER_CE
	OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_HIGHEST);
   	OP_SetThreadPriority((phTTS->hThread_VTM),OP_PRIORITY_HIGHEST);
#endif
  }
#ifndef UNDER_CE
  OP_SetThreadPriority((phTTS->hThread_SYNC),OP_PRIORITY_ABOVE_NORMAL);
#endif
#endif //TYPING_MODE

  /********************************************************************/
  /*  Start the Letter To Sound thread.                               */
  /********************************************************************/
  nReturnCode = StartDecTalkSystemThread(phTTS, &(phTTS->hThread_LTS),
				TRUE,(start_address)lts_main);
  if(nReturnCode == MMSYSERR_NOMEM ||
	 nReturnCode == MMSYSERR_INVALPARAM ||
	 nReturnCode == MMSYSERR_ERROR )
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return(nReturnCode);
  }
	  
  /********************************************************************/
  /*  Start the Command thread.                                       */
  /********************************************************************/
  if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_CMD),
		TRUE,(start_address)cmd_main))== MMSYSERR_NOMEM)
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return(MMSYSERR_NOMEM);
  }
  
  /********************************************************************/
  /*  Start the Text Queueing thread.                                 */
  /********************************************************************/
  phTTS->hTextToSpeechWnd = NULL;

  nReturnCode = StartDecTalkSystemThread(phTTS, &(phTTS->hThread_TXT),
				TRUE,(start_address)TextToSpeechThreadMain);
  if(nReturnCode == MMSYSERR_NOMEM ||
	 nReturnCode == MMSYSERR_ERROR)
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return(nReturnCode);
  }

#ifdef OLD
  phTTS->hThread_TXT = CreateThread( NULL,
					 0,
			 (LPTHREAD_START_ROUTINE)TextToSpeechThreadMain,
					 (LPVOID)phTTS,
					 0,
					 &ID_Thread_TXT );

  /********************************************************************/
  /*  Wait here until the LTS thread loads the dictionary.            */
  /********************************************************************/
  /* GL 11/05/1997  for BATS#510 */
  for ( i = 0; pKsd_t->fdic_entries[pKsd_t->lang_curr] == 0; i++ )
  {
	Sleep( STARTUP_LOOP_WAIT_TIME );

	if ( i > MAX_STARTUP_WAIT_COUNT )
	{                                                            
	  DeleteTextToSpeechObjects( phTTS );                        
#ifdef LICENSES
	  ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	  return( MMSYSERR_ERROR );
	}
  }

  /********************************************************************/
  /*  If the dictionary length was set to 0xFFFFFFFF then the         */
  /*  dictionary file was not found. Return an error.                 */
  /********************************************************************/

  /* GL 11/05/1997  for BATS#510 */
  if ( pKsd_t->fdic_entries[pKsd_t->lang_curr] == 0xFFFFFFFF )
  {
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Wait here until the Text-To-Speech main thread initializes the  */
  /*  Text-To-Speech window handle.                                   */
  /********************************************************************/

  for ( i = 0; phTTS->hTextToSpeechWnd == NULL; i++ )
  {
	Sleep( STARTUP_LOOP_WAIT_TIME );

	if ( i > MAX_STARTUP_WAIT_COUNT )
	{
	  DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	  ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	  return( MMSYSERR_NOMEM );
	}
  }

  if ( phTTS->hThread_TXT == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
	ReleaseLicenseRef();	// tek 23sep96 give back the license unit
#endif //LICENSES
	return( MMSYSERR_NOMEM );
  }

#endif //OLD


  /********************************************************************/
  /*  MVP:06/19/96 Initialize the TextToSpeech handle the function        */
  /*  returns through pphTTS argument.                                */
  /********************************************************************/

  *pphTTS = phTTS;
  
  /******************************************************************/
  /*  Put the system into a known state.                            */
  /******************************************************************/

  TextToSpeechReset( phTTS, TRUE );

  //MVP: Increment InstanceCounter on successful creation of a speech object.
  //gnInstanceCounter++; // tek bats 668 12may98 this is done by the dic loader.
#ifdef DECTALKBETA430        //MVP:04/09/96 A message will be spoken for Beta releases.
#ifdef ENGLISH
  TextToSpeechSpeak(phTTS, "DECtalk beta S D K version 4.4a is running. For evaluation only. ", TTS_FORCE);
#endif //ENGLISH
#ifdef SPANISH
  TextToSpeechSpeak(phTTS, "DECtalk beta S d k versión 4.4a está corriendo. Para evaluación solamente.", TTS_FORCE);
#endif //SPANISH
#ifdef GERMAN
  TextToSpeechSpeak(phTTS, "Dies ist das DECtalk S D K, beta Version 4.4 A. Unlizensierte Testversion.", TTS_FORCE);
#endif //GERMAN
#endif //DECTALKBETA430

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechStartup                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: April 13, 1993                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    DECtalk initialization function.                                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*                                                                    */
/*    hWnd                A handle to the parent window.              */
/*                                                                    */
/*    pphTTS              A pointer to a pointer to a structure of    */
/*                        type TTS_HANDLE_T. This function allocates  */
/*                        memory for the structure.                   */
/*                                                                    */
/*    uiDeviceNumber      An unsigned integer which is the wave out   */
/*                        device ID number. WAVE_MAPPER may be used   */
/*                        here if the device ID number is unknown.    */
/*                                                                    */
/*    dwDeviceOptions     A DWORD which specifies how the wave output */
/*                        device is managed. It may be a combination  */
/*                        of the following values:                    */
/*                                                                    */
/*       value                 performance characteristic             */
/*                                                                    */
/*  OWN_AUDIO_DEVICE      The wave output device will be opened upon  */
/*                        return from this function. No other process */
/*                        may allocate the wave output device until   */
/*                        the CloseAudio() function is called. If     */
/*                        there are no wave output devices in the     */
/*                        system then MMSYSERR_NOTSUPPORTED will be   */
/*                        returned and the Text-To-Speech system will */
/*                        not be started.                             */
/*                                                                    */
/*                        If OWN_AUDIO_DEVICE is NOT specified then   */
/*                        the wave output device will be opened       */
/*                        sometime after audio is queued by the       */
/*                        TextToSpeechSpeak() function. The wave      */
/*                        output device will be held as long as       */
/*                        sufficient audio samples are queued.        */
/*                        Otherwise the device will be released.      */
/*                                                                    */
/*  REPORT_OPEN_ERROR     If an attempt is made to open the wave      */
/*                        output device while another process owns    */
/*                        it, then an error message will be sent to   */
/*                        the window procedure which corresponds to   */
/*                        the window handle which is passed to this   */
/*                        function.                                   */
/*                                                                    */
/*  DO_NOT_USE_AUDIO_DEVICE  The Text-To-Speech system may only be    */
/*                           used to write wave files, write speech   */
/*                           samples to memory, or log phonemes. No   */
/*                           error will be returned if a wave output  */
/*                           device is not present.                   */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a status code of type MMRESULT.           */
/*    This value is zero if initialization was successful.            */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NODRIVER      No wave out device driver present        */
/*    MMSYSERR_BADDEVICEID   Device ID out of range                   */
/*    MMSYSERR_NOMEM         Unable to allocate memory                */
/*    MMSYSERR_ERROR         Dictionary not found                     */
/*    MMSYSERR_INVALPARAM    Invalid param for th eload dictionary    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechStartup( HWND hWnd,
							  LPTTS_HANDLE_T * pphTTS,
							  UINT uiDeviceNumber,
							  DWORD dwDeviceOptions )
{
// tek 13nov97 flag that we're using the default callback, so that
// we know that the instance param is actually hWnd..
	return(TextToSpeechStartupEx(pphTTS,
								 uiDeviceNumber,
								 dwDeviceOptions|TTSSTARTUP_USING_DEFAULT_CALLBACK,
								 DefaultTTSCallbackRoutine,
								 (LONG)hWnd));
}


VOID DefaultTTSCallbackRoutine(LONG lParam1,
							   LONG lParam2,
							   DWORD dwInstanceParam,
							   UINT uiMsg)
{
#ifdef _DEBUG
  char szTemp[256]="";
  ULONG ulStartTime,ulEndTime;
  ulStartTime=timeGetTime();
  sprintf(szTemp, "DTTSCallback(%ld) at %ld.\n", lParam1,ulStartTime);
  OutputDebugString(szTemp);
#endif //_DEBUG

	switch( lParam1 )
	{
	case TTS_AUDIO_PLAY_START:
	case TTS_AUDIO_PLAY_STOP:
	case ERROR_OPENING_WAVE_OUTPUT_DEVICE:
	case ERROR_IN_AUDIO_WRITE:
	case ERROR_GETTING_DEVICE_CAPABILITIES:
		PostMessage((HWND)dwInstanceParam,uiMsg,lParam1,lParam2);
		break;

	default:
	  // tek 19aug96 must this be a post?
	  PostMessage((HWND)dwInstanceParam,uiMsg,lParam1,lParam2);
	  break;
	}
}

/**********************************************************************/
/*      Function : StartDecTalkSystemThread                           */
/*      Author   : Murthy Parakala                                    */
/*      Date     : October 19, 1995                                   */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Generic startup routine to initiate DecTalk system threads.     */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS               A pointer to a Text-To-Speech handle.       */
/*    ppDecTalkThread     A pointer to DectalkThread handle           */
/*    bMalloc             A flag to indicate whether dynamic memory   */
/*                        allocations are present in thread function  */
/*                        or not. TRUE - present; FALSE -no           */
/*    ThreadFunction      Thread start function                       */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NOMEM         Insufficient memory .                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
 
static int StartDecTalkSystemThread(LPTTS_HANDLE_T phTTS,PHANDLE ppDecTalkThread,
									BOOL bMalloc, start_address ThreadFunction )
{
	UINT IDThread;
	DWORD cNumObjects =2;
	HANDLE WaitObjArray[2];
	ULONG exit_code ;
	/*typedef int ( * _stdcall Stdstart_address ) (void *);*/
	
	*ppDecTalkThread = (HANDLE) _beginthreadex(NULL,
								0,
								ThreadFunction,             
								(void *)phTTS,                                   
								0,
								&IDThread
								);

	if ( *ppDecTalkThread == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );
		return( MMSYSERR_NOMEM );
	}

	if(bMalloc == FALSE)          /* No dynamic memory allocations within thread main function */
		return MMSYSERR_NOERROR;  /*No errors */

	WaitObjArray[0] = *ppDecTalkThread;
	WaitObjArray[1] = phTTS->hMallocSuccessEvent;

	WaitForMultipleObjects(cNumObjects,WaitObjArray,FALSE,INFINITE); 
	
	GetExitCodeThread(*ppDecTalkThread,&exit_code);
	
	if(exit_code == MMSYSERR_NOMEM ||
	   exit_code == MMSYSERR_INVALPARAM ||
	   exit_code == MMSYSERR_ERROR )
	{
		DeleteTextToSpeechObjects( phTTS );
		return(exit_code);
	}
	
	return MMSYSERR_NOERROR;    /*No errors */
}


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechShutdown                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: April 13, 1993                                              */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Text To Speech Shutdown.                                        */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  TIMEOUT_INTERVAL_IN_MSEC  1000

MMRESULT TextToSpeechShutdown( LPTTS_HANDLE_T phTTS )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If the last item in the TextToSpeechStartup() function was      */
  /*  initialized then reset the the Text-To-Speech system.           */
  /********************************************************************/

  /* The if statement is not reqd as phTTSglobal is going to be oboselete for MI :MVP */
  /*if ( phTTSglobal != NULL )*/
	if(phTTS != NULL)
	TextToSpeechReset( phTTS, TRUE );

#ifdef DTALK50
	CPUnitAPI(phTTS->CPanelThread);       // Remove the Control Panel - KSB
#endif //DTALK50

  /********************************************************************/
  /*  Delete any objects created by the TextToSpeechInMemory().       */
  /*  function.                                                       */
  /********************************************************************/

  if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
	TextToSpeechCloseInMemory( phTTS );

  /********************************************************************/
  /*  Delete all objects created in the TextToSpeechStartup()         */
  /*  function.                                                       */
  /********************************************************************/
  // tek bats668 12may98 this must be decremented here to make sure 
  // the dictionary gets unloaded.
  // tek 27may98 bats 689:
  // we need to lock around this to make sure we don't end up with a 
  // startup and a shutdown colliding
  ThreadLock(&tl_gnInstanceCounter,5); // tek 27may98 bats 689
  gnInstanceCounter--;     /* MVP: Decrement the instance counter */

  DeleteTextToSpeechObjects( phTTS );

  ThreadUnlock(&tl_gnInstanceCounter); // tek 27may98 bats 689

 
  // release the license count..
#ifdef LICENSES
  ReleaseLicenseRef();
#endif //LICENSES

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: DeleteTextToSpeechObjects                               */
/*  Author: Bill Hallahan                                             */
/*  Date: April 13, 1993                                              */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Delete all objects created in the TextToSpeechStartup()         */
/*    function.                                                       */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void DeleteTextToSpeechObjects( LPTTS_HANDLE_T phTTS )
{
  /* Added the following 2 varaibles for MI :MVP */
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PVOID pCmd_t = phTTS->pCMDThreadData;
  DWORD dwDump[3] = { 0x0b, 0x0b, 0x0b };  /*MVP not a static variable,is a const*/
  WORD wDump[3] = { 0x0b, 0x0b, 0x0b };    /*MVP not a static variable,is a const*/
  char cDump[3] = { 0x0b, 0x0b, 0x0b };    /*MVP not a static variable,is a const*/
  HINSTANCE hInstance;	// 06may97 BATS320   
  char wndclass[255];	// Window Class (KSB Aug-13-97)
  /********************************************************************/
  /*  Terminate all threads.                                          */
  /********************************************************************/

  if ( pKsd_t->sync_pipe != NULL )
  {
	/******************************************************************/
	/*  Shut down the SYNC thread.                                    */
	/******************************************************************/

	if ( phTTS->hThread_SYNC != NULL )
	{
	  exit_pipe( pKsd_t->sync_pipe );
	  write_pipe( pKsd_t->sync_pipe, dwDump, 3 );

	  WaitForSingleObject( phTTS->hThread_SYNC,
			   TIMEOUT_INTERVAL_IN_MSEC );

	  CloseHandle( phTTS->hThread_SYNC );
	}

	/******************************************************************/
	/*  Shut down the VTM thread.                                     */
	/******************************************************************/

	if ( phTTS->hThread_VTM != NULL )
	{
	  exit_pipe( pKsd_t->vtm_pipe );
	  write_pipe( pKsd_t->vtm_pipe, wDump, 3 );
	  
	  /*MVP Free the allocated memory in LTS thread activity */
	  if(phTTS->pVTMThreadData)
	  {
			free(phTTS->pVTMThreadData);
			phTTS->pVTMThreadData = NULL;
	  }


	  WaitForSingleObject( phTTS->hThread_VTM,
			   TIMEOUT_INTERVAL_IN_MSEC );

	  CloseHandle( phTTS->hThread_VTM );
	}

	/******************************************************************/
	/*  Shut down the PH thread.                                      */
	/******************************************************************/

	if ( phTTS->hThread_PH != NULL )
	{
	  exit_pipe( pKsd_t->ph_pipe );
	  write_pipe( pKsd_t->ph_pipe, wDump, 3 );
	  /*MVP Free the allocated memory in PH thread activity */
	  if(phTTS->pPHThreadData)
			FreePHInstanceData(phTTS->pPHThreadData); //04aug96
	  phTTS->pPHThreadData = NULL;

	  WaitForSingleObject( phTTS->hThread_PH,
			   TIMEOUT_INTERVAL_IN_MSEC );

	  CloseHandle( phTTS->hThread_PH );
	}

	/******************************************************************/
	/*  Shut down the LTS thread.                                     */
	/******************************************************************/

	if ( phTTS->hThread_LTS != NULL )
	{
	  exit_pipe( pKsd_t->lts_pipe );
	  write_pipe( pKsd_t->lts_pipe, wDump, 3 );
	  /*MVP Free the allocated memory in LTS thread activity */
	  if(phTTS->pLTSThreadData)
			free(phTTS->pLTSThreadData);
	  phTTS->pLTSThreadData = NULL;
	  
	  WaitForSingleObject( phTTS->hThread_LTS,
			   TIMEOUT_INTERVAL_IN_MSEC );

	  CloseHandle( phTTS->hThread_LTS );
	}

	/******************************************************************/
	/*  Shut down the CMD thread.                                     */
	/******************************************************************/

	if ( phTTS->hThread_CMD != NULL )
	{
	exit_pipe( pKsd_t->cmd_pipe );
	write_pipe( pKsd_t->cmd_pipe, cDump, 3 );
	/*MVP Free the allocated memory in CMD thread activity */
	if(pCmd_t)
		FreeCMDThreadMemory(pCmd_t);
	phTTS->pCMDThreadData = pCmd_t = NULL;

	SetEvent( phTTS->hSyncEvent );

	WaitForSingleObject( phTTS->hThread_CMD,
			   TIMEOUT_INTERVAL_IN_MSEC );

	CloseHandle( phTTS->hThread_CMD );
	}
  }

  /********************************************************************/
  /*  Shutdown the Audio thread                                       */
  /********************************************************************/

  if ( phTTS->pAudioHandle != NULL )
	PA_DestroyPlayHandle( phTTS->pAudioHandle );

  /********************************************************************/
  /*  Terminate the Text-To-Speech thread.                            */
  /********************************************************************/

  // 06may97 tek BATS320
  // get the instance so that we can unregister the class
  // after the window is destroyed
  // tek 13nov97 we have no idea whether hWnd is valid, so use NULL.
  //hInstance = (HINSTANCE)GetWindowLong( phTTS->hWnd,
  //					GWL_HINSTANCE );
  hInstance = NULL;

  if ( phTTS->hThread_TXT != NULL )
  {
	MMRESULT mmStatus=0;
	SendMessage( phTTS->hTextToSpeechWnd,
		 ID_TTS_Destroy,
		 0L,
		 0L );

	WaitForSingleObject( phTTS->hThread_TXT,
			 TIMEOUT_INTERVAL_IN_MSEC );

	CloseHandle( phTTS->hThread_TXT );
	sprintf(wndclass,"%s_%08X",TEXTTOSPEECHWNDCLASS,(unsigned long int) phTTS);
	mmStatus = UnregisterClass(wndclass,hInstance);
  }

  /********************************************************************/
  /*  Free the handle to the "Not Emptying Vtm Pipe" event.           */
  /********************************************************************/

  if ( phTTS->hNotEmptyingVtmPipeEvent != NULL )
  {
	CloseHandle( phTTS->hNotEmptyingVtmPipeEvent );
  }

  /********************************************************************/
  /*  Free the handle to the "Sync" event.                            */
  /********************************************************************/

  if ( phTTS->hSyncEvent != NULL )
  {
	CloseHandle( phTTS->hSyncEvent );
  }

  /********************************************************************/
  /*  Free the handle to the "Successful Memory alloacation" event.   */
  /********************************************************************/

  if (phTTS->hMallocSuccessEvent != NULL)
  {
	CloseHandle(phTTS->hMallocSuccessEvent);
	phTTS->hMallocSuccessEvent = NULL;
  }

  /********************************************************************/
  /*  Free the handle to the "TTS Callback Mutex .                    */
  /********************************************************************/

  if (phTTS->hmxCallback != NULL)
  {
	OP_DestroyMutex(phTTS->hmxCallback);    // tek 03aug96
	phTTS->hmxCallback = NULL;
  }

  /********************************************************************/
  /*  Delete the log file critical section.                           */
  /********************************************************************/

  if ( phTTS->pcsLogFile != NULL )
  {
	DeleteCriticalSection( phTTS->pcsLogFile );

	free( phTTS->pcsLogFile );
  }

  /********************************************************************/
  /*  Delete the queued character count critical section.             */
  /********************************************************************/

  if ( phTTS->pcsQueuedCharacterCount != NULL )
  {
	DeleteCriticalSection( phTTS->pcsQueuedCharacterCount );

	free( phTTS->pcsQueuedCharacterCount );
  }

  /* tek 6mar97 bats 278 */
  /********************************************************************/
  /*  Delete the index queue critical section.                        */
  /********************************************************************/

  if ( pKsd_t->pcsSpcPktSave != NULL )
  {
	DeleteCriticalSection( pKsd_t->pcsSpcPktSave );

	free( pKsd_t->pcsSpcPktSave );
	pKsd_t->pcsSpcPktSave = NULL;
  }


  /********************************************************************/
  /*  Delete the flush message number critical section.               */
  /********************************************************************/

  if ( phTTS->pcsFlushMsgNumber != NULL )
  {
	DeleteCriticalSection( phTTS->pcsFlushMsgNumber );

	free( phTTS->pcsFlushMsgNumber );
  }

  /********************************************************************/
  /*  Delete the last queued text message number critical section.    */
  /********************************************************************/

  if ( phTTS->pcsLastQueuedTextMsgNumber != NULL )
  {
	DeleteCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );

	free( phTTS->pcsLastQueuedTextMsgNumber );
  }

  /********************************************************************/
  /*  Delete the queued sample count critical section.                */
  /********************************************************************/

  if ( phTTS->pcsQueuedSampleCount != NULL )
  {
	DeleteCriticalSection( phTTS->pcsQueuedSampleCount );

	free( phTTS->pcsQueuedSampleCount );
  }

  // tek 24oct97 bats 497 delete and deallocate this critical section object
  if ( pKsd_t->pcsVtmPipeRead != NULL )
  {
    DeleteCriticalSection( pKsd_t->pcsVtmPipeRead );

    free( pKsd_t->pcsVtmPipeRead );
    pKsd_t->pcsVtmPipeRead = NULL;
  }
  // tek 24oct97 end of bats 497

  /********************************************************************/
  /*  Free the dictionary memory.                                     */
  /********************************************************************/
  /*MVP : Unload dictionary when no other instance of DECtalk speech  */
  /*      object is running                                           */
  
  if(!gnInstanceCounter)        
  {
        /* GL 11/05/1997  for BATS#510 */
        if ( pKsd_t->fdic_entries[pKsd_t->lang_curr] != 0 )
        {
            unload_dictionary((void **)&(pKsd_t->fdic[pKsd_t->lang_curr]),
            (unsigned int *)&(pKsd_t->fdic_entries[pKsd_t->lang_curr]));
            gpufdic = NULL;
            gufdic_entries = 0;
        }
  }

  /********************************************************************/
  /*  Free the user dictionary memory.                                */
  /********************************************************************/

  /* GL 11/05/1997  for BATS#510 */
  if ( pKsd_t->udic_entries[pKsd_t->lang_curr] != 0 )
  {
        unload_dictionary((void **)&pKsd_t->udic[pKsd_t->lang_curr],
                          (unsigned int *)&pKsd_t->udic_entries[pKsd_t->lang_curr] );
  }

  /********************************************************************/
  /*  Destroy all the pipes.                                          */
  /********************************************************************/
  /* tek 30aug96 be kind; NULL the pointers when done.. */
  if ( pKsd_t->sync_pipe != NULL )
  {
	destroy_pipe( pKsd_t->sync_pipe );
	pKsd_t->sync_pipe = NULL;
  }

  if ( pKsd_t->vtm_pipe != NULL )
  {
	destroy_pipe( pKsd_t->vtm_pipe );
	pKsd_t->vtm_pipe = NULL;
  }

  if ( pKsd_t->ph_pipe != NULL )
  {
	destroy_pipe( pKsd_t->ph_pipe );
	pKsd_t->ph_pipe = NULL;
  }

  if ( pKsd_t->lts_pipe != NULL )
  {
	destroy_pipe( pKsd_t->lts_pipe );
	pKsd_t->lts_pipe = NULL;
  }

  if ( pKsd_t->cmd_pipe != NULL )
  {
	destroy_pipe( pKsd_t->cmd_pipe );
	pKsd_t->cmd_pipe = NULL;
  }
  
  /********************************************************************/
  /* Free the "loaded_languages" element of Kernel_share_data structure*/
  /* This element have been allocated in Kernel sub-system in usa_init*/
  /* function. MVP MI                                                 */
  /********************************************************************/
  if(pKsd_t->loaded_languages != NULL)  
  {
	free(pKsd_t->loaded_languages);
	pKsd_t->loaded_languages = NULL;
  }

  /********************************************************************/
  /* Free the kernel_share_data element in TTS structure for MI :MVP  */
  /********************************************************************/
  if(phTTS->pKernelShareData != NULL)
  {
		free(phTTS->pKernelShareData);
		phTTS->pKernelShareData = NULL;
  }
			  
  /********************************************************************/
  /*  Free the TTS handle structure.                                  */
  /********************************************************************/

  free( phTTS );
  phTTS=NULL;

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechSpeak                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function queues a null terminated string to the       */
/*    Text-To-Speech system.                                          */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS         A pointer to a Text-To-Speech handle.             */
/*                                                                    */
/*    szTextString  A pointer to a null terminated string.            */
/*                                                                    */
/*    dwFlags       A DWORD which specifies if the text is to be      */
/*                  pushed through the Text-To-Speech system even if  */
/*                  if it is not on a clause boundary. It may be set  */
/*                  to one of the follwing constants:                 */
/*                                                                    */
/*                                                                    */
/*                  TTS_NORMAL (equals 0L)  Insert characters in the  */
/*                                          text queue.               */
/*                                                                    */
/*                  TTS_FORCE  (equals 1)   Insert characters in the  */
/*                                          text queue and append the */
/*                                          character token to force  */
/*                                          all previously queued     */
/*                                          text to be output.        */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NOMEM         Unable to allocate memory.               */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/* the user entry point is just a shell that calls the REAL routine
 * if we're not in a reset state.. 
 */
 // 16jun97 tek bats385

MMRESULT TextToSpeechSpeak( LPTTS_HANDLE_T phTTS,
				LPSTR pszTextString,
				DWORD dwFlags )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  if (!phTTS->bInReset)
  {
	  return (TextToSpeechSpeakEx( phTTS,
				pszTextString,
				dwFlags,
				TRUE));
  }
  else
  {
	  return (MMSYSERR_NOERROR); // _HANDLEBUSY would be better, but
								 // will break existing apps.. sigh..
  }

}

MMRESULT TextToSpeechSpeakEx( LPTTS_HANDLE_T phTTS,
				LPSTR pszTextString,
				DWORD dwFlags, 
				BOOL bIsUser)
{
  UINT i;
  UINT uiLength;
  unsigned char * pTextBuffer;
  TEXT_MSG_T * pTextMsg;
  const char cForce = (char)((PFASCII<<PSFONT)+0xb);
  const char cForce2 = (char)(SYNC);




  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

#ifdef TYPING_MODE
  // tek 06nov97 (during BATS508)
  // we have to clear out the typing mode flag here, because if
  // we don't we can end up with a message queued but still do
  // a typing-mode fast reset (which will leave this sneak
  // message inside the synthesizer)
  phTTS->bInTypingMode = FALSE;
#endif TYPING_MODE

  /********************************************************************/
  /*  Allocate the Text Message structure.                            */
  /********************************************************************/

  pTextMsg = (TEXT_MSG_T *)malloc(sizeof(TEXT_MSG_T));

  if ( pTextMsg == NULL )
	return( MMSYSERR_NOMEM );

  /********************************************************************/
  /*  Get the character string length.                                */
  /********************************************************************/

  uiLength = strlen( pszTextString );

  /********************************************************************/
  /*  Allocate the pipe text buffer. Allocate 1 extra location in     */
  /*  case the force character is appended to the text string.        */
  /* now allocate 2 extra for the two forcing chars.. tex 16aug96     */
  /********************************************************************/

  pTextBuffer = (unsigned char *)malloc(( uiLength + 2 ) * sizeof(char));

  if ( pTextBuffer == NULL )
  {
	free( pTextMsg );
	return( MMSYSERR_NOMEM );
  }

  /********************************************************************/
  /*  The memory pointed to by pTextMsg and pTextBuffer is            */
  /*  deallocated in the Text To Speech thread window procedure and   */
  /*  should not be used after the call to the SendMessage()          */
  /*  function.                                                       */
  /********************************************************************/

  for ( i = 0; i < uiLength; i++ )
	pTextBuffer[i] = pszTextString[i];

  /********************************************************************/
  /*  Conditionally append the force character to the text.           */
  /********************************************************************/

  if ( dwFlags & TTS_FORCE )
  {
	pTextBuffer[uiLength] = cForce;
	uiLength++;
	pTextBuffer[uiLength] = cForce2;
	uiLength++;
  }
  // tek 05nov97 bats472 we have to do all message numbering and 
  // queueing under a critical section, so that we are absolutely
  // sure that the numbers will be monotonically increasing; if 
  // they aren't. WaitForTextQueueingToComplete will end up 
  // waiting forever.
  EnterCriticalSection( phTTS->pcsQueuedCharacterCount );
  /********************************************************************/
  /*  Set up the Text Message structure.                              */
  /*  The message number is used in the Text-To-Speech thread to      */
  /*  to throw away window messages which are received after          */
  /*  TextToSpeechReset() is called.                                  */
  /********************************************************************/

  pTextMsg->pText = pTextBuffer;
  pTextMsg->uiLength = uiLength;

  EnterCriticalSection( phTTS->pcsFlushMsgNumber );
  pTextMsg->uiMsgNumber = phTTS->uiCurrentMsgNumber;
  phTTS->uiCurrentMsgNumber++;
  LeaveCriticalSection( phTTS->pcsFlushMsgNumber );
  // tek 16jun97 bats 385 moves the store/increment inside the CS

  /********************************************************************/
  /*  Save this message number in the Text-To-Speech handle for       */
  /*  the TextToSpeechSync() function.                                */
  /********************************************************************/

  phTTS->uiLastTextMsgNumber = pTextMsg->uiMsgNumber;

  /********************************************************************/
  /*  Accumulate the queued character count.                          */
  /********************************************************************/

  //tek bats472: move this up to before the point where we 
  // take a number
  //EnterCriticalSection( phTTS->pcsQueuedCharacterCount );
  phTTS->uiQueuedCharacterCount += uiLength;
  // tek bats472: move this to after the PostMessage.
  //LeaveCriticalSection( phTTS->pcsQueuedCharacterCount );
#ifdef _DEBUG
	{
	char szTemp[256]="";
	char szTemp2[128]="";
	int	i=0;
	for (i=0;i<127 && i<pTextMsg->uiLength ;i++)
	{
		if (!isprint(pTextBuffer[i]))
		{
			szTemp2[i]='.';
		}
		else
		{
			szTemp2[i]=pTextBuffer[i];
		}
	}
	szTemp2[i]='\0';
	sprintf(szTemp,"  .. TTSMessage %u posting. [%s]\n",
		pTextMsg->uiMsgNumber,
		szTemp2);
	OutputDebugString(szTemp);
	}
#endif //_DEBUG
  /********************************************************************/
  /*  Send the structure pointed to by pTextMsg to the text thread.   */
  /********************************************************************/

  PostMessage( phTTS->hTextToSpeechWnd,
		   ID_TTS_Queue_Text,
		   0L,
		   (LPARAM)pTextMsg );
  // tek bats472: OK to do this now.
  LeaveCriticalSection( phTTS->pcsQueuedCharacterCount );
  /********************************************************************/
  /*  Re-enable error messages in the audio thread. The audio thread  */
  /*  disables the audio error handler after sending a message. This  */
  /*  is done to ensure that the application only receives at most    */
  /*  only one error message per call to the TextToSpeechSpeak()      */
  /*  function. Otherwise a message would be sent each time the audio */
  /*  thread was unable to open the audio device.                     */
  /********************************************************************/

  if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
  {
#ifndef OLEDECTALK
//  EnableAudioErrorMessage( phTTS->pAudioHandle );
#endif //OLEDECTALK
  }

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechPause                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Pause Text-To-Speech                                            */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The specified device handle is invalid   */
/*                           (The system is NOT speaking), or         */
/*                           the Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechPause( LPTTS_HANDLE_T phTTS )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
  {
	mmStatus = MMSYSERR_INVALHANDLE;
  }
  else
  {
#ifndef OLEDECTALK
	mmStatus = PA_Pause( phTTS->pAudioHandle );
#endif //OLEDECTALK
  }
  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechResume                                      */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Resume Text-To-Speech                                           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The specified device handle is invalid   */
/*                           (The system is NOT speaking), or         */
/*                           the Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechResume( LPTTS_HANDLE_T phTTS )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
  {
	mmStatus = MMSYSERR_INVALHANDLE;
  }
  else
  {
#ifndef OLEDECTALK
	mmStatus = PA_Resume( phTTS->pAudioHandle );
#endif //OLEDECTALK
  }
  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechOpenWaveOutFile                             */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechOpenWaveFile() function creates a wave     */
/*    file. After calling the TextToSpeechOpenWaveOutFile() function, */
/*    all subsequent calls to the TextToSpeechSpeak() function cause  */
/*    the audio to be written to the specified file until the         */
/*    TextToSpeechCloseWaveFile() function is called.                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS          A pointer to a Text-To-Speech handle.            */
/*                                                                    */
/*    pszFileName    A pointer of type char * which points to a null  */
/*                   terminated filename.                             */
/*                                                                    */
/*    dwFormat       An identifier which determines the wave file     */
/*                   audio sample format. It may be one of the        */
/*                   following constants which are defined in include */
/*                   file mmsystem.h and include file ttsapi.h:       */
/*                                                                    */
/*                     WAVE_FORMAT_1M08    11.025 KHz., Mono,  8-Bit  */
/*                     WAVE_FORMAT_1M16    11.025 KHz., Mono, 16-Bit  */
/*                     WAVE_FORMAT_08M08    8 KHz., Mono, 8-Bit u-law */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    An invalid parameter was passed.         */
/*                           (An illegal wave output format value.)   */
/*    MMSYSERR_NOMEM         Unable to allocate memory                */
/*    MMSYSERR_ALLOCATED     A wave output file is already open.      */
/*    MMSYSERR_ERROR         Unable to open the wave output file or   */
/*                           unable to write to the wave output file. */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechOpenWaveOutFile( LPTTS_HANDLE_T phTTS,
					  char pszFileName[],
					  DWORD dwFormat )
{
  MMRESULT mmStatus;
  WAVE_FILE_HDR_T * pWaveFileHdr;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If a file is already open, then don't try to open another one.  */
  /*  If not in NULL output state or AUDIO Output state then return   */
  /*  an error.                                                       */
  /********************************************************************/

  if (( phTTS->dwOutputState != STATE_OUTPUT_AUDIO )
	&& ( phTTS->dwOutputState != STATE_OUTPUT_NULL ))
	return( MMSYSERR_ALLOCATED );

  /********************************************************************/
  /*  Wait until all previous calls to the TextToSpeechSpeak()        */
  /*  function have completed.                                        */
  /********************************************************************/

  mmStatus = TextToSpeechSync( phTTS );

  if ( mmStatus )
	return( mmStatus );

  /********************************************************************/
  /*  Create the header for the output file                           */
  /********************************************************************/

  pWaveFileHdr = (WAVE_FILE_HDR_T *) malloc( sizeof(WAVE_FILE_HDR_T));

  if ( pWaveFileHdr == NULL )
	return( MMSYSERR_NOMEM );
  
  /* MVP: Initialize the Wave_File_header's common elements for all waveformats.*/
  /*{ "RIFF", 0, "WAVEfmt ", 16, 1, 1, 11025, 11025, 1, 8, "data", 0 };*/
  pWaveFileHdr->psRiff[0] = 'R';
  pWaveFileHdr->psRiff[1] = 'I';
  pWaveFileHdr->psRiff[2] = 'F';
  pWaveFileHdr->psRiff[3] = 'F';
  pWaveFileHdr->dwRiffChunkSize = 0;
  pWaveFileHdr->psWaveFmt[0] = 'W';
  pWaveFileHdr->psWaveFmt[1] = 'A';
  pWaveFileHdr->psWaveFmt[2] = 'V';
  pWaveFileHdr->psWaveFmt[3] = 'E';
  pWaveFileHdr->psWaveFmt[4] = 'f';
  pWaveFileHdr->psWaveFmt[5] = 'm';
  pWaveFileHdr->psWaveFmt[6] = 't';
  pWaveFileHdr->psWaveFmt[7] = ' ';
  pWaveFileHdr->dwWaveChunkSize = 16;
  pWaveFileHdr->wNumberOfChannels = 1;
  pWaveFileHdr->psData[0] = 'd';
  pWaveFileHdr->psData[1] = 'a';
  pWaveFileHdr->psData[2] = 't';
  pWaveFileHdr->psData[3] = 'a';
  pWaveFileHdr->dwDataChunkSize = 0;

  /********************************************************************/
  /*  If the dwFormat value is invalid then return an error.          */
  /********************************************************************/

  switch( dwFormat )
  {
  case WAVE_FORMAT_1M16:

	pWaveFileHdr->wFormatTag = WAVE_FORMAT_PCM;
	pWaveFileHdr->dwSamplesPerSecond = PC_SAMPLE_RATE;
	pWaveFileHdr->dwAvgBytesPerSecond = PC_SAMPLE_RATE + PC_SAMPLE_RATE;
	pWaveFileHdr->wNumberBlockAlign = 2;
	pWaveFileHdr->wBitsPerSample = 16;

	SetSampleRate( phTTS, PC_SAMPLE_RATE );

	break;

  case WAVE_FORMAT_1M08:

	pWaveFileHdr->wFormatTag = WAVE_FORMAT_PCM;
	pWaveFileHdr->dwSamplesPerSecond = PC_SAMPLE_RATE;
	pWaveFileHdr->dwAvgBytesPerSecond = PC_SAMPLE_RATE;
	pWaveFileHdr->wNumberBlockAlign = 1;
	pWaveFileHdr->wBitsPerSample = 8;

	SetSampleRate( phTTS, PC_SAMPLE_RATE );

	break;

  case WAVE_FORMAT_08M08:

	pWaveFileHdr->wFormatTag = WAVE_FORMAT_MULAW;
	pWaveFileHdr->dwSamplesPerSecond = MULAW_SAMPLE_RATE;
	pWaveFileHdr->dwAvgBytesPerSecond = MULAW_SAMPLE_RATE;
	pWaveFileHdr->wNumberBlockAlign = 1;
	pWaveFileHdr->wBitsPerSample = 8;

	SetSampleRate( phTTS, MULAW_SAMPLE_RATE );

	break;

  default:

	free( pWaveFileHdr );
	return( MMSYSERR_INVALPARAM );
  }

  phTTS->dwFormat = dwFormat;

  /********************************************************************/
  /*  Open the wave output file.                                      */
  /********************************************************************/

  if (( phTTS->pWaveFile = fopen( pszFileName, "wb" )) == NULL )
  {
	free( pWaveFileHdr );
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Write the header to the output file.                            */
  /********************************************************************/

  if ( 1 != fwrite( pWaveFileHdr,
					  sizeof( WAVE_FILE_HDR_T ),
					  1,
					  phTTS->pWaveFile ))
  {
	free( pWaveFileHdr );
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Initialize the file sample count.                               */
  /********************************************************************/

  phTTS->dwFileSampleCount = 0;
  phTTS->pWaveFileHdr = pWaveFileHdr;
  phTTS->dwOutputState = STATE_OUTPUT_WAVE_FILE;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechCloseWaveOutFile                            */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Close the Text-To-Speech Wave File.                             */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_ERROR         Failure to wait for pending speech.      */
/*                             OR                                     */
/*                           Unable to update the wave output file    */
/*                           header.                                  */
/*                             OR                                     */
/*                           Unable to close the wave output file.    */
/*                             OR                                     */
/*                           No wave output file is open.             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechCloseWaveOutFile( LPTTS_HANDLE_T phTTS )
{
  DWORD dwLengthInBytes;
  FILE * pWaveFile;
  WAVE_FILE_HDR_T * pWaveFileHdr;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If a file is not open, then exit.                               */
  /********************************************************************/

  if ( phTTS->dwOutputState != STATE_OUTPUT_WAVE_FILE )
	return( MMSYSERR_ERROR );

  /********************************************************************/
  /*  Wait until all previous calls to the TextToSpeechSpeak()        */
  /*  function have completed.                                        */
  /********************************************************************/

  mmStatus = TextToSpeechSync( phTTS );
  
  if ( mmStatus )
	mmStatus = MMSYSERR_ERROR;
  else
	mmStatus = MMSYSERR_NOERROR;

  /********************************************************************/
  /*  Set the sample rate to the default value in case the sample     */
  /*  was changed.                                                    */
  /********************************************************************/

  SetSampleRate( phTTS, PC_SAMPLE_RATE );

  /********************************************************************/
  /*  Update the wave header riff chunk and data chunk lengths.       */
  /********************************************************************/

  switch( phTTS->dwFormat )
  {
  case WAVE_FORMAT_1M16:

	dwLengthInBytes = (DWORD)phTTS->dwFileSampleCount << 1;
	break;

  case WAVE_FORMAT_1M08:
  case WAVE_FORMAT_08M08:

	dwLengthInBytes = (DWORD)phTTS->dwFileSampleCount;
	break;

  default:

	/******************************************************************/
	/*  It should be impossible to get here so this error message is  */
	/*  not documented.                                               */
	/******************************************************************/

	return( MMSYSERR_INVALPARAM );
  }

  pWaveFileHdr = (WAVE_FILE_HDR_T *)phTTS->pWaveFileHdr;

  pWaveFileHdr->dwDataChunkSize = dwLengthInBytes;

  pWaveFileHdr->dwRiffChunkSize =
	pWaveFileHdr->dwDataChunkSize + RIFF_HEADER_OFFSET;

  /********************************************************************/
  /*  Seek to the top of the file to write the updated wave header.   */
  /********************************************************************/

  pWaveFile = (FILE *)phTTS->pWaveFile;

  if ( fseek( pWaveFile, 0L, SEEK_SET ))
  {
	free( pWaveFileHdr );
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Write the header to the output file.                            */
  /********************************************************************/

  if ( 1 != fwrite( pWaveFileHdr,
					  sizeof(WAVE_FILE_HDR_T ),
					  1,
					  phTTS->pWaveFile ))
  {
	free( pWaveFileHdr );
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Free the wave file header.                                      */
  /********************************************************************/

  free( pWaveFileHdr );

  /********************************************************************/
  /*  Set the system output state to audio if it is enabled.          */
  /********************************************************************/

  if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
  else
	phTTS->dwOutputState = STATE_OUTPUT_NULL;

  /********************************************************************/
  /*  Close the wave file.                                            */
  /********************************************************************/

  if ( fclose( pWaveFile ))
	return( MMSYSERR_ERROR );
  
  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechGetStatus                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechGetStatus() function returns selected      */
/*    status information about the Text-To-Speech system.             */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS              A pointer to a Text-To-Speech handle.        */
/*                                                                    */
/*    dwIdentifierArray  An array of values of type DWORD which       */
/*                       contain identifiers that specify the status  */
/*                       values to return in array dwStatusArray[].   */
/*                       These values may be one of the following     */
/*                       constants.                                   */
/*                                                                    */
/*                                                                    */
/*      constant               status return value                    */
/*                                                                    */
/*  INPUT_CHARACTER_COUNT     Returns count of characters in the      */
/*                            Text-To-Speech input queue              */
/*                                                                    */
/*  STATUS_SPEAKING       The status value will be TRUE if there are  */
/*                        audio samples playing and FALSE if there is */
/*                        NO audio playing.                           */
/*                                                                    */
/*  WAVE_OUT_DEVICE_ID    The current wave out device ID is returned. */
/*                        This is only required if WAVE_MAPPER is     */
/*                        specified as the device ID in the           */
/*                        TextToSpeechStartup() function.             */
/*                                                                    */
/*                                                                    */
/*    dwStatusArray      An array of type DWORD which will contain    */
/*                       the status values corresponding to each of   */
/*                       the identifiers in array dwIdentifierArray[].*/
/*                                                                    */
/*    dwNumberOfStatusValues  The number of status values being       */
/*                            requested.                              */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    An invalid parameter was passed.         */
/*    MMSYSERR_ERROR         Error obtaining status value.            */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/*    A status value of 0xFFFFFFFF is returned in array pdwStatus[]   */
/*    if the corresponding passed parameter dwIdentifier is invalid.  */
/*    This function will then return a non-zero MMRESULT value. Note  */
/*    that 0xFFFFFFFF may be a legitimate status value and will not   */
/*    necessarily indicate an error in all cases.                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  MAXIMUM_STATUS_VALUES  3

MMRESULT TextToSpeechGetStatus( LPTTS_HANDLE_T phTTS,
				DWORD dwIdentifierArray[],
				DWORD dwStatusArray[],
				DWORD dwNumberOfStatusValues )
{
  UINT i;
#ifndef OLEDECTALK
  DWORD dwIdentifier[1];
#endif //OLEDECTALK
  DWORD dwAudioStatus[1];
  MMRESULT mmStatus =0;
  MMRESULT mmStatusReturn;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  Range test the number of status values requested.               */
  /********************************************************************/

  if (( dwNumberOfStatusValues == 0 )
	|| ( dwNumberOfStatusValues > MAXIMUM_STATUS_VALUES ))
	return( MMSYSERR_INVALPARAM );

  mmStatusReturn = MMSYSERR_NOERROR;

  /********************************************************************/
  /*  Loop and fill in array dwStatusArray[].                             */
  /********************************************************************/

  for ( i = 0; i < dwNumberOfStatusValues; i++ )
  {
	switch( dwIdentifierArray[i] )
	{
	case INPUT_CHARACTER_COUNT:

	  EnterCriticalSection( phTTS->pcsQueuedCharacterCount );
	  dwStatusArray[i] = phTTS->uiQueuedCharacterCount;
	  LeaveCriticalSection( phTTS->pcsQueuedCharacterCount );

	  break;

	case STATUS_SPEAKING:

	  if ( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE )
	  {
	dwStatusArray[i] = 0xFFFFFFFF;
	mmStatusReturn = MMSYSERR_ERROR;
	  }
	  else
	  {
#ifndef OLEDECTALK
	dwIdentifier[0] = PA_DEVICE_PLAYING;

	mmStatus = PA_Status( phTTS->pAudioHandle,
				dwIdentifier,
				dwAudioStatus,
				1 );
#endif //OLEDECTALK
	if ( mmStatus )
	{
	  dwStatusArray[i] = 0xFFFFFFFF;
	  mmStatusReturn = MMSYSERR_ERROR;
	}
	else
	{
	  dwStatusArray[i] = dwAudioStatus[0];
	}
	  }
	  break;

	case WAVE_OUT_DEVICE_ID:

	  if ( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE )
	  {
	dwStatusArray[i] = 0xFFFFFFFF;
	mmStatusReturn = MMSYSERR_ERROR;
	  }
	  else
	  {
#ifndef OLEDECTALK
	dwIdentifier[0] = PA_DEVICE_ID;

	mmStatus = PA_Status( phTTS->pAudioHandle,
				dwIdentifier,
				dwAudioStatus,
				1 );
#endif //OLEDECTALK
	if ( mmStatus )
	{
	  dwStatusArray[i] = 0xFFFFFFFF;
	  mmStatusReturn = MMSYSERR_ERROR;
	}
	else
	{
	  dwStatusArray[i] = dwAudioStatus[0];
	}
	  }
	  break;

	default:

	  dwStatusArray[i] = 0xFFFFFFFF;
	  mmStatusReturn = MMSYSERR_INVALPARAM;
	  break;
	}
  }
  return( mmStatusReturn );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechReset                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechReset() function cancels all audio output  */
/*    and deletes any text from the Text-To-Speech systems text       */
/*    queue. All pending index marks are discarded.                   */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*    bReset   If bReset is FALSE then the Text-To-Speech system      */
/*             will not change mode when the reset occured. If bReset */
/*             is TRUE then the speaking mode will be MODE_CITATION,  */
/*             an open wave file will be closed, and the system will  */
/*             be returned to the startup state.                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_NOMEM         Unable to allocate memory.               */
/*    MMSYSERR_ERROR         Unable to flush the system.              */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/**********************************************************************/
/* tek 19aug96 in the memory case: there appears to be a potential    */
/* deadlock in this; if you process buffer messages in the same thread*/
/* you call this from, we may get stuck waiting for a buffer that we  */
/* can't tell the caller to return to us because we have his thread   */
/* tied up.                                                           */
/* So, on entry, make sure we have a buffer available; empty that     */
/* buffer locally so that subsequent output calls won't block.        */
/**********************************************************************/




#define  MAXIMUM_RESET_WAIT_TIME_IN_MSEC  10000
#define  SEND_BUFFER_WAIT_TIME               20

MMRESULT TextToSpeechReset( LPTTS_HANDLE_T phTTS, BOOL bReset )
{
  MMRESULT mmStatus;
  /* Added a varaible to get handle of instance specific Kernel_share_data for MI:MVP */
  PKSD_T pKsd_t;
  LPTTS_BUFFER_T pTTS_Buffer;
#ifdef _DEBUG
  char szTemp[256]="";
#endif //_DEBUG

#ifdef TYPING_MODE	// 09jun97 tek
  BOOL	bWasTyping=FALSE;

  char szCforce3[] = {  
					(char)((PFASCII<<PSFONT)+0xb),
/*					(char)(SYNC),					
					(char)((PFASCII<<PSFONT)+0xb),
					(char)(SYNC),					
*/					(char)((PFASCII<<PSFONT)+0xb),
					(char)(SYNC),
					'\0'
  };
#endif //TYPING_MODE
  HANDLE hThisThread=NULL;
  THREAD_PRIORITY_T tptPriority=0;
  hThisThread = GetCurrentThread();
  if (hThisThread)
	{
#ifndef UNDER_CE
		tptPriority = OP_GetThreadPriority(hThisThread);
		OP_SetThreadPriority(hThisThread,OP_PRIORITY_HIGHEST);
#endif
	}


#ifdef _DEBUG
  // tek 10aug97 (during bats423)
  // fix this for typing/nontyping
#ifdef TYPING_MODE  // tek 10aug97 (during bats423)
					// fix this for typing/nontyping
  sprintf(szTemp,"TTSreset() at %ld (%d). \n",timeGetTime(),phTTS->bInTypingMode);
#else //TYPING_MODE
  sprintf(szTemp,"TTSreset() at %ld. \n",timeGetTime());
#endif //TYPING_MODE
  OutputDebugString(szTemp);
#endif //_DEBUG

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	{
#ifndef UNDER_CE
	  if (hThisThread)	 // tek 09jun97
			OP_SetThreadPriority(hThisThread,tptPriority);
#endif
	  return( MMSYSERR_INVALHANDLE );
	}

  // 16jun97 tek bats385
  // merged 28jul97 tek
  // lock up the synthesizer against new speech..
  phTTS->bInReset = TRUE;


  /********************************************************************/
  /*  Set the halting flag. This will cause the CMD, LTS, PH, VTM,    */
  /*  and SYNC threads to all discard input data and flush the pipes. */
  /********************************************************************/
  /* Get the current instance kernel_share_data : MVP */
  pKsd_t = phTTS->pKernelShareData;
  
 

  pKsd_t->halting = TRUE;

#ifdef _DEBUG
  OutputDebugString("TTSreset: ->halting is set. \n");
#endif //_DEBUG
  /********************************************************************/
  /*  Stop the Text To Speech thread if it is queueing text.          */
  /*  The Text-To-Speech thread will queue no text if the message     */
  /*  number is less than phTTS->uiFlushMsgNumber.                    */
  /* this needs to happen before we do too much.. tek 17jun97		  */
  /********************************************************************/
  EnterCriticalSection( phTTS->pcsFlushMsgNumber );
  phTTS->uiFlushMsgNumber = phTTS->uiCurrentMsgNumber;
  LeaveCriticalSection( phTTS->pcsFlushMsgNumber );

  phTTS->uiCurrentMsgNumber++;

#ifdef TYPING_MODE
  bWasTyping = phTTS->bInTypingMode;
  // tek 15may97
  // we set the PH thread's prority up here so that the first burst of
  // sound that we need to get out in typing mode is quickly available; 
  // after the VTM has processes two speech frames, vtmiont will drop the 
  // PH thread back to normal priority so that any user processes can 
  // continue running.
  // if you change this, make sure the code in vtmiont still makes sense.
  if (phTTS->dwOutputState == STATE_OUTPUT_AUDIO)
  {
	// tek 19nov97 this needs to be "highest" rather than "above normal";
	// also, we need to do this for both VTM and PH, and VTM will 
	// readjust it later for us. (this is all to deal with responsiveness
	// in the presence of greedy tasks..)
#ifndef UNDER_CE
	OP_SetThreadPriority((phTTS->hThread_VTM),OP_PRIORITY_HIGHEST);
	OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_HIGHEST);
#endif
  }

#endif //TYPING_MODE

  pKsd_t->cmd_flush=CMD_flush_toss;

  // tek 04sep96   drain the lts and ph pipes, just like on the 
  // hardware platforms..

  DrainPipes(phTTS);
  EmptyVtmPipe(pKsd_t); // tek 15may

#ifdef TYPING_MODE //09jun97 tek
  if (bWasTyping)
  {
	  // start the pipes clearing out
	  DT_PIPE_T dtpSync = SYNC;
	  write_pipe(pKsd_t->ph_pipe,&dtpSync,1);
	  // this WFEP is important for the case where the VTM still has
	  // work to do from above; we need to make sure that the VTM
	  // IO routines get to empty before we clear the halting flag.
	  mmStatus = WaitForEmptyPipes( phTTS,
					MAXIMUM_RESET_WAIT_TIME_IN_MSEC,
					TRUE );
  }
#endif //TYPING_MODE

  /********************************************************************/
  /*  Perform an audio reset to immediately stop audio from playing   */
  /*  and to make sure the VTM thread is not blocked.                 */
  /********************************************************************/


  if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
  {
	PA_Reset( phTTS->pAudioHandle );
  }

  // 09jun97tek 
  // at this point, we should be able to drop back to our old priority
#ifndef UNDER_CE
  if (hThisThread)
		OP_SetThreadPriority(hThisThread,tptPriority);
#endif


  // tek 19aug96 the same anti-block issue for the memory case..
if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
  {     
	// tek 29aug96 always send back the user's buffers.Do it
	// now and git them out of the way.
	ReturnRemainingBuffers(phTTS);
	// we could have gotten stuck behind a buffer dump that happened
	// "just after" the message to the calling loop that got us here;
	// so, we have to queue up a dummy buffer to make sure we 
	// survive the get_pipe call..
	if((pKsd_t->buffer_pipe != NULL) && (pipe_count( pKsd_t->buffer_pipe) < 1) )
		TextToSpeechAddBuffer(phTTS, NULL); //GetBuffer knows how to handle nulls
    EnterCriticalSection(phTTS->pcsMemoryBuffer);
	// if we have an active output buffer, clear it.
	if ( (pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer) != NULL)
	  {

		pTTS_Buffer->dwBufferLength = 0;
		pTTS_Buffer->dwNumberOfPhonemeChanges = 0;
		pTTS_Buffer->dwNumberOfIndexMarks = 0;


	  } // was not a null buffer
	LeaveCriticalSection(phTTS->pcsMemoryBuffer);
  }

#ifdef TYPING_MODE // tek 09jun97
  if (bWasTyping)
  {
	 
  }
  else
  {
#endif //TYPING_MODE
  /********************************************************************/
  /*  Stop the Text To Speech thread if it is queueing text.          */
  /*  The Text-To-Speech thread will queue no text if the message     */
  /*  number is less than phTTS->uiFlushMsgNumber.                    */
  /********************************************************************/
  EnterCriticalSection( phTTS->pcsFlushMsgNumber );
  phTTS->uiFlushMsgNumber = phTTS->uiCurrentMsgNumber;
  phTTS->uiCurrentMsgNumber++;
  LeaveCriticalSection( phTTS->pcsFlushMsgNumber );
  // merged 28jul97 tek
  // tek 16jun97 bats 385 moves the increment inside the CS

  // tek 19aug96 we now need to force speech, so that everybody
  // along the way gets cleared out. We do it here, so that the
  // above setting of FlushMsgNumber will allow this force to
  // go through.
  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );

  /********************************************************************/
  /*  Wait for the Text thread to complete all text queueing.         */
  /********************************************************************/
  WaitForTextQueuingToComplete( phTTS, TRUE );


  /********************************************************************/
  /*  Clear the halting flag.                                         */
  /********************************************************************/

  pKsd_t->halting = FALSE;
#ifdef TYPING_MODE
  }
#endif //TYPING_MODE

  /********************************************************************/
  /*  If the output state is memory then return all buffers to the    */
  /*  application.  WIH 3/28/95 Changed order for proper reset.       */
  /********************************************************************/

  if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
  {
	/******************************************************************/
	/*  If there is nothing to reset then return.                     */
	/******************************************************************/

	if (( pipe_count( pKsd_t->cmd_pipe ) == 0 )
	  && ( pipe_count( pKsd_t->lts_pipe ) == 0 )
	  && ( pipe_count( pKsd_t->ph_pipe ) == 0 )
	  && ( pipe_count( pKsd_t->vtm_pipe ) == 0 )
	  && ( pipe_count( pKsd_t->buffer_pipe) == 0))
	{
      // tek 22aug96 by now, the cmd parser should be well oiled. Let it go*/
      pKsd_t->cmd_flush = FALSE;
#ifdef _DEBUG
	OutputDebugString("TTSReset() exiting1.\n");
#endif //_DEBUG

	// 16jun97 tek bats385
	// merged 28jul97 tek
	phTTS->bInReset = FALSE;

	if (pipe_count( phTTS->pKernelShareData->buffer_pipe ))
	{
#ifdef _DEBUG
		OutputDebugString("Reset return: still have buffers.\n");
#endif //_DEBUG
		return(MMSYSERR_NOERROR);
	}
	else
	    return( MMSYSERR_NOERROR );
	}

	/******************************************************************/
	/*  If the previous reset has not completed then just flush the   */
	/*  pipes and exit.                                               */
	/******************************************************************/
	if ( phTTS->bMemoryReset )
	{
	  // reset the sync event so that we can use it to see when 
	  // this stuff gets through
	  ResetEvent(phTTS->hSyncEvent);
#ifdef	TYPING_MODE // tek 17jun97
	  TextToSpeechSpeakEx( phTTS, szCforce3,TTS_FORCE,FALSE);
#else

	  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
	  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
	  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
	  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );

#endif //TYPING_MODE
	  /****************************************************************/
	  /*  Wait until the VTM thread is about to send a buffer.        */
	  /****************************************************************/
	   // tek 19aug96 this is probably a bad way to do it; it's 
	  // better to wait for the sync even that we get from those
	  // forces going through..
#ifdef _DEBUG
	  sprintf(szTemp,"TTSReset wait for sync at %ld\n",timeGetTime);
	  OutputDebugString(szTemp);
#endif //_DEBUG

	  WaitForSingleObject(phTTS->hSyncEvent,INFINITE);
//                while ( ! phTTS->bSendingBuffer )
//        {
//      Sleep( SEND_BUFFER_WAIT_TIME );
//        }
#ifdef _DEBUG
	  sprintf(szTemp,"TTSReset sync'd at %ld\n",timeGetTime);
	  OutputDebugString(szTemp);
#endif //_DEBUG
	  /****************************************************************/
	  /*  Empty all of the Text-To-Speech pipes.                      */
	  /****************************************************************/

	  pKsd_t->halting = TRUE;
	  mmStatus = WaitForEmptyPipes( phTTS,
					MAXIMUM_RESET_WAIT_TIME_IN_MSEC,
					TRUE );
	  pKsd_t->halting = FALSE;
	  // tek 29aug96 I'm not clear about the state of cmd_flush
	  // at this point. I don't know if I can clear it, because
	  // I *think* we're nested. But, I'll do it anyway.
      pKsd_t->cmd_flush = FALSE;
#ifdef _DEBUG
	if (pipe_count( pKsd_t->buffer_pipe ))
	{
		OutputDebugString("Reset return: still have buffers. \n");
	}
	OutputDebugString("TTSReset() exiting 2.\n");
#endif //_DEBUG

	// 16jun97 tek bats385
	// merged 28jul97 tek
	phTTS->bInReset = FALSE;

	  if (mmStatus)
		  return( mmStatus );
	  else
		  return(mmStatus);
	}

	phTTS->bMemoryReset = TRUE;
  }

  /********************************************************************/
  /*  At this point there may still be a clause stuck in ph. Force    */
  /*  the clause out.                                                 */
  /********************************************************************/

  /********************************************************************/
  /*  Set the halting flag. This will cause the CMD, LTS, PH, VTM,    */
  /*  and SYNC threads to all discard input data and flush the pipes. */
  /********************************************************************/
 #ifdef TYPING_MODE
  if (!bWasTyping)
  {
#endif //TYPING_MODE
	  //tek 22aug96
  pKsd_t->halting = TRUE;


#ifdef	TYPING_MODE // tek 17jun97
	  TextToSpeechSpeakEx( phTTS, szCforce3,TTS_FORCE,FALSE); // bats 385
#else
  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
#endif //TYPING_MODE
  /********************************************************************/
  /*  Wait for the Text thread to complete all text queueing.         */
  /********************************************************************/
  // tek 22aug96
  WaitForTextQueuingToComplete( phTTS, TRUE );
#ifdef TYPING_MODE
  }
#endif //TYPING_MODE
  // tek 22aug96 by now, the cmd parser should be well oiled. Let it go*/
  pKsd_t->cmd_flush = FALSE;

  /********************************************************************/
  /*  Perform an second audio reset to immediately stop audio from    */
  /*  playing and to make sure the VTM thread is not blocked.         */
  /********************************************************************/

  if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
  {
	PA_Reset( phTTS->pAudioHandle );
  }

 // tek 19aug96 anti-block for the memory case.. 
if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
  {
	if (pipe_count( phTTS->pKernelShareData->buffer_pipe ) < 1)
		TextToSpeechAddBuffer(phTTS, NULL); //deadlock avoidance
    EnterCriticalSection(phTTS->pcsMemoryBuffer);
	// if we have an active output buffer, clear it.
	if ( (pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer) != NULL)
	  {

		pTTS_Buffer->dwBufferLength = 0;
		pTTS_Buffer->dwNumberOfPhonemeChanges = 0;
		pTTS_Buffer->dwNumberOfIndexMarks = 0;


	  } // was not a null buffer
	LeaveCriticalSection(phTTS->pcsMemoryBuffer);
  }

  /********************************************************************/
  /*  Maximize the queued sample count to release the                 */
  /*  WaitForAudioSampleToPlay() function (in file sync.c).           */
  /********************************************************************/
#ifdef TYPING_MODE
  if (!bWasTyping)
  {
#endif //TYPING_MODE
  EnterCriticalSection( phTTS->pcsQueuedSampleCount );
  phTTS->dwQueuedSampleCount = 4294967295;
  LeaveCriticalSection( phTTS->pcsQueuedSampleCount );
#ifdef TYPING_MODE
  }
#endif //TYPING_MODE
  /********************************************************************/
  /*  Empty all of the Text-To-Speech pipes.                          */
  /********************************************************************/
#ifdef TYPING_MODE
  if (!bWasTyping)
#endif //TYPING_MODE
  mmStatus = WaitForEmptyPipes( phTTS,
				MAXIMUM_RESET_WAIT_TIME_IN_MSEC,
				TRUE );

  /********************************************************************/
  /*  Initialize the VTM, PH, LTS, and CMD threads.                   */
  /********************************************************************/
#ifdef _DEBUG
	  sprintf(szTemp,"TTSReset init threads at %ld\n",timeGetTime());
	  OutputDebugString(szTemp);
#endif //_DEBUG
  if ( phTTS->dwOutputState != STATE_OUTPUT_MEMORY )
  {
	InitializeVTM(phTTS);
  };


  phinit( phTTS, bReset );
#ifdef TYPING_MODE
  if (!bWasTyping)
  {
#endif //TYPING_MODE

  ls_util_lts_init(phTTS->pLTSThreadData);
 

  cmd_init( phTTS,bReset );

#ifdef TYPING_MODE
  }
#endif //TYPING_MODE

  pKsd_t->halting = FALSE;
  // tek 22aug96 we still need to do a LAST_VOICE to make sure the VTM */
  // is in a nice state..
  {
        unsigned short LastVoice[2],phone;
	LastVoice[0]=LAST_VOICE;
	LastVoice[1]=SYNC;
#ifdef TYPING_MODE
//	if (bWasTyping)
//	{
		write_pipe( pKsd_t->ph_pipe, &LastVoice, 2 );
//	}
//	else
#else //TYPING_MODE
	write_pipe( pKsd_t->lts_pipe, &LastVoice, 2 );
        /* GL 01/08/98  BATS#547  force a extra space after SYNC, VT/HT to fix the
           dropping punctuation problem. */
        phone = (PFASCII<<PSFONT) + ' ';
        write_pipe( pKsd_t->lts_pipe, &phone, 1 );
#endif //TYPING_MODE
   }

  /********************************************************************/
  /*  Perform a third audio reset to make sure the audio queue is     */
  /*  empty after the pipes were emptied.                             */
  /********************************************************************/

  if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
  {
	PA_Reset( phTTS->pAudioHandle );
  }
 // tek 19aug96 anti-block for the memory case.. 
 if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
  {     
	if (pipe_count( phTTS->pKernelShareData->buffer_pipe ) < 2)
		TextToSpeechAddBuffer(phTTS, NULL); // deadlock avoidance
    EnterCriticalSection(phTTS->pcsMemoryBuffer);
	// if we have an active output buffer, clear it.
	if ( (pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer) != NULL)
	  {

		pTTS_Buffer->dwBufferLength = 0;
		pTTS_Buffer->dwNumberOfPhonemeChanges = 0;
		pTTS_Buffer->dwNumberOfIndexMarks = 0;


	  } // was not a null buffer
	LeaveCriticalSection(phTTS->pcsMemoryBuffer);
  }
#ifdef TYPING_MODE
 if (bWasTyping)
 {
  mmStatus = WaitForEmptyPipes( phTTS,
				15,
				TRUE );
 }
 else
#endif //TYPING_MODE
  /********************************************************************/
  /*  Empty all of the Text-To-Speech pipes.                          */
  /********************************************************************/
  //tek 22aug96
  mmStatus = WaitForEmptyPipes( phTTS,
				MAXIMUM_RESET_WAIT_TIME_IN_MSEC,
				TRUE );


  /********************************************************************/
  /*  Zero the queued sample count (used for index marks and sync).   */
  /********************************************************************/



  EnterCriticalSection( phTTS->pcsQueuedSampleCount );
  phTTS->dwQueuedSampleCount = 0;
  LeaveCriticalSection( phTTS->pcsQueuedSampleCount );


  /********************************************************************/
  /*  Conditionally reset the state of the Text-To-Speech system.     */
  /********************************************************************/


  if ( bReset )
  {
	switch( phTTS->dwOutputState )
	{
	case STATE_OUTPUT_MEMORY:

	  TextToSpeechCloseInMemory( phTTS );
	  break;

	case STATE_OUTPUT_WAVE_FILE:

	  TextToSpeechCloseWaveOutFile( phTTS );
	  break;

	case STATE_OUTPUT_LOG_FILE:

	  TextToSpeechCloseLogFile( phTTS );
	  break;

	default:
	  break;
	}

	/******************************************************************/
	/*  Initialize the Text-To-Speech system state variables.         */
	/******************************************************************/

	pKsd_t->cmd_flush = FALSE;
	pKsd_t->spc_flush = FALSE;
	pKsd_t->logflag  = 0;
    /* GL 11/15/1996 set defaulted Spanish to Latin */
#ifdef LATIN_AMERICAN
	pKsd_t->modeflag = MODE_CITATION | MODE_LATIN;
#else //LATIN_AMERICAN
	pKsd_t->modeflag = MODE_CITATION;
#endif //LATIN_AMERICAN
	pKsd_t->sayflag = SAY_CLAUSE;
	pKsd_t->pronflag = 0;
	pKsd_t->wbreak = FALSE;
	pKsd_t->text_flush = FALSE;
	pKsd_t->async_change = FALSE;
  }

  /********************************************************************/
  /*  Free all allocated index mark memory.                           */
  /********************************************************************/


  free_index(pKsd_t);

  /********************************************************************/
  /*  Enable error messages.                                          */
  /********************************************************************/

  phTTS->bEnableErrorMessage = TRUE;

  
  if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
  {
	ReturnRemainingBuffers(phTTS);   //tek 03sep96 make sure..
	// tek somehow in here, Q2Mem could have snagged a buffer and
	// if so, we have to get rid of it..
  }

  if ((pKsd_t->buffer_pipe != NULL) && pipe_count(pKsd_t->buffer_pipe ) )
  {
#ifdef _DEBUG
	  OutputDebugString("Reset return: still have buffers. \n");
#endif //_DEBUG
	  ReturnRemainingBuffers(phTTS);
  }

  if (phTTS->pTTS_Buffer != NULL)
	  SendBuffer(phTTS); // tek 04sep96 get rid of current
// tek 29aug96 if we got this far, we know that we
// can clear out MemoryReset.. normally SendBuf() would, 
// but we've moved teh one that actually returns the buffers 
// back in time.. 
// tek 03sep96 now SendBuffer doesn't ever clear MemoryReset..
	phTTS->bMemoryReset = FALSE;
	// 16jun97 tek bats385
	// merged 28jul97 tek
	phTTS->bInReset = FALSE;

#ifdef _DEBUG
	sprintf(szTemp,"TTSReset() exiting 3 at %ld\n",timeGetTime());
	OutputDebugString(szTemp);
#endif //_DEBUG
#ifdef TYPING_MODE
	if (phTTS->dwOutputState == STATE_OUTPUT_AUDIO)
		phTTS->bInTypingMode = TRUE;
#endif //TYPING_MODE
  if  ( mmStatus )
	return( MMSYSERR_ERROR );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaitForTextQueuingToComplete                            */
/*  Author: Bill Hallahan                                             */
/*  Date: November 19, 1993                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function will return when all messages posted by      */
/*    the TextToSpeechSpeak() function have complteted.               */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*    bReset   A boolean which is set to true if the queued text is   */
/*             discarded.                                             */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    none.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#ifdef TYPING_MODE
#define TEXT_QUEUE_WAIT_TIME  5
#else
#define TEXT_QUEUE_WAIT_TIME  30
#endif //TYPING_MODE
#define TEXT_LOCKUP_COUNT      2

static void WaitForTextQueuingToComplete( LPTTS_HANDLE_T phTTS,
										  BOOL bReset )
{
  int iLockupCount;
#ifdef _DEBUG
  char szTemp[256]="";
  ULONG ulStartTime,ulEndTime;
  ulStartTime=timeGetTime();
  sprintf(szTemp, "WFTQTC() at %ld.\n", ulStartTime);
  OutputDebugString(szTemp);
#endif //_DEBUG

  /********************************************************************/
  /*  Wait for the Text-To-Speech thread to complete text queueing.   */
  /*  up to all messages numbered uiLastTextMessageNumber.            */
  /********************************************************************/


  iLockupCount = 0;

  while ( TRUE )
  {
	EnterCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );

	if ( phTTS->uiLastQueuedTextMsgNumber < phTTS->uiLastTextMsgNumber )
	{
	  LeaveCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );

	  /****************************************************************/
	  /*  Set the sync event in case the cmd thread is blocked in the */
	  /*  cmd_sync() function.                                        */
	  /****************************************************************/

	  if ( bReset )
	  {
		SetEvent( phTTS->hSyncEvent );

		/**************************************************************/
		/*  Perform an audio reset to immediately stop audio from     */
		/*  playing and to make sure the VTM thread is not blocked.   */
		/**************************************************************/

		if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
		{
		  PA_Reset( phTTS->pAudioHandle );
		}
	  }

	  /****************************************************************/
	  /*  Go to sleep while the text queue empties.                   */
	  /****************************************************************/

	  Sleep( TEXT_QUEUE_WAIT_TIME );

	  if (( phTTS->dwOutputState == STATE_OUTPUT_MEMORY ) && ( bReset ))
	  {
		iLockupCount++;

		if ( iLockupCount > TEXT_LOCKUP_COUNT )
		{
		  FixMemoryLockup( phTTS );

		  iLockupCount = 0;
		}
	  }

	}
	else
	{
	  LeaveCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );
	  break;
	}
  }
#ifdef _DEBUG
  ulEndTime=timeGetTime();
  sprintf(szTemp, "WFTQTC() exit %ld ms.\n", ulEndTime-ulStartTime);
  OutputDebugString(szTemp);
#endif //_DEBUG

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechSync                                        */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechSync() function will block until all       */
/*    previously queued text has been spoken. This function will      */
/*    automatically resume audio if the Text-To-Speech system has     */
/*    been paused by the TextToSpeechPause() function.                */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion.            */
/*    MMSYSERR_ERROR         Unable to complete queued text.          */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

//#define  MAXIMUM_SYNC_WAIT_TIME_IN_MSEC  0xFFFFFFFF
#define  MAXIMUM_SYNC_WAIT_TIME_IN_MSEC  (1800000) // 30 minutes
// 16jun97 tek bats 385 - modified to bail out on resets
#define	SYNC_RESET_CHECK_INTERVAL	(30)

MMRESULT TextToSpeechSync( LPTTS_HANDLE_T phTTS )
{
  MMRESULT mmStatus = MMSYSERR_NOERROR;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  Resume if the text to speech system has been paused or this     */
  /*  function will block here forever.                               */
  /********************************************************************/
#ifndef OLEDECTALK
  if (
	    ( ( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	  &&(!phTTS->bInReset)
	 )
	PA_Resume( phTTS->pAudioHandle );
#endif //OLEDECTALK
  /********************************************************************/
  /*  Wait for the Text thread to complete all text queueing.         */
  /********************************************************************/
  if (!phTTS->bInReset) // tek bats 385 merged 28jul97
    WaitForTextQueuingToComplete( phTTS, FALSE );

  /********************************************************************/
  /*  Now that all the text is queued, make sure that it is purged.   */
  /*  Four TTS_FORCE characters are used because of the way the       */
  /*  WaitForEmptyPipes() function performs the wait.                 */
  /********************************************************************/

  if (!phTTS->bInReset) // tek bats 385 merged 28jul97
  {
    TextToSpeechSpeak( phTTS, "", TTS_FORCE );
    //TextToSpeechSpeak( phTTS, "", TTS_FORCE ); /* tek 10jan97 don't need */
    //TextToSpeechSpeak( phTTS, "", TTS_FORCE );
    TextToSpeechSpeak( phTTS, "", TTS_FORCE );
  }

   /********************************************************************/
  /*  Now wait for all of the Text-To-Speech pipes to empty.          */
  /********************************************************************/
  /*  first, wait for the Text thread to complete all text queueing.  */
  /*  (tek 10jan97)                                                   */
  /********************************************************************/

  if (!phTTS->bInReset)	// tek bats 385 merged 28jul97
	    WaitForTextQueuingToComplete( phTTS, FALSE );

  // 28jul97 bats 385 merged
  // this is where we think about exiting if we are in a reset;
  // there is no need to do any of the subsequent waits, but we
  // do want to hang here until the reset is done. 
  if (phTTS->bInReset)
  {
	  while (phTTS->bInReset)
	  {
		  OP_Sleep(SYNC_RESET_CHECK_INTERVAL);
	  }
	  return (MMSYSERR_NOERROR);
  }

  mmStatus = WaitForEmptyPipes( phTTS,
				MAXIMUM_SYNC_WAIT_TIME_IN_MSEC,
				FALSE );

  if ( mmStatus )
	return( MMSYSERR_ERROR );

  /********************************************************************/
  /*  Now that the pipes are all empty, wait for the audio to         */
  /*  complete.                                                       */
  /********************************************************************/

  if( ( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
  {
	if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
	{
#ifndef OLEDECTALK
	  mmStatus = PA_WaitForPlayToComplete( phTTS->pAudioHandle );
#endif //OLEDECTALK
	  if ( mmStatus )
	return( MMSYSERR_ERROR );
	}
  }
  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechGetRate                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechGetRate() function gets the Text-To-Speech */
/*    systems current speaking rate setting.                          */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*    pdwRate  A pointer to a DWORD which will return the current     */
/*             Text-To-Speech speaking rate in words per minute.      */
/*             This will be a value from 50 to 600.                   */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechGetRate( LPTTS_HANDLE_T phTTS,
				  LPDWORD pdwRate )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  *pdwRate = (DWORD) phTTS->pKernelShareData->sprate ;

  /********************************************************************/
  /*  The following range test should never fail, so the error return */
  /*  is undocumented.                                                */
  /********************************************************************/

  if (( *pdwRate < MIN_SPEAKING_RATE ) || ( *pdwRate > MAX_SPEAKING_RATE ))
	return( MMSYSERR_ERROR );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechSetRate                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechSetRate() function sets the Text-To-Speech */
/*    speaking rate.                                                  */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*    uiRate   A DWORD which contains the speaking rate in words per  */
/*             minute. This must be a value between 50 and 600.       */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    An invalid parameter was passed.         */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechSetRate( LPTTS_HANDLE_T phTTS,
				  DWORD dwRate )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  Range test the speaking rate.                                   */
  /********************************************************************/

  if (( dwRate < MIN_SPEAKING_RATE ) || ( dwRate > MAX_SPEAKING_RATE ))
	return( MMSYSERR_INVALPARAM );

  phTTS->pKernelShareData->sprate = (short)dwRate;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechGetSpeaker                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechGetSpeaker() function gets the voice of    */
/*    the speaker the Text-To-Speech system is currently using.       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS     A pointer to a Text-To-Speech handle.                 */
/*                                                                    */
/*    pSpeaker  A pointer of type LPSPEAKER_T which will return the   */
/*              value of the current speaker.                         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechGetSpeaker( LPTTS_HANDLE_T phTTS,
				 LPSPEAKER_T pSpeaker )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );
  /* Also initialized new element in KSD for MI : MVP */
  *pSpeaker = (SPEAKER_T)(phTTS->pKernelShareData->uiCurrentSpeaker);

  /********************************************************************/
  /*  The following range test should never fail, so the error return */
  /*  is undocumented.                                                */
  /********************************************************************/

  if ( *pSpeaker > WENDY + 1 )
	return( MMSYSERR_ERROR );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechSetSpeaker                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechSetSpeaker() function sets voice of the    */
/*    speaker the Text-To-Speech system will use.                     */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*    Speaker  A value of type SPEAKER_T which contains the speaking  */
/*             voice to use.                                          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    An invalid parameter was passed.         */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechSetSpeaker( LPTTS_HANDLE_T phTTS,
				 SPEAKER_T Speaker )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  Range test the speaker voice.                                   */
  /********************************************************************/

  if (( Speaker < PAUL ) || ( Speaker > WENDY ))
	return( MMSYSERR_INVALPARAM );

  /********************************************************************/
  /*  Set voice change flag for phmain.c in the PH thread.            */
  /********************************************************************/

  SetSpeaker( phTTS , Speaker );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechGetLanguage                                 */
/*  Author: Bill Hallahan                                             */
/*  Date: July 22, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechGetLanguage() function gets the language   */
/*    that the Text-To-Speech system is currently using.              */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS      A pointer to a Text-To-Speech handle.                */
/*                                                                    */
/*    pLanguage  A pointer of type LPLANGUAGE_T which will return     */
/*               the value of the current language.                   */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechGetLanguage( LPTTS_HANDLE_T phTTS,
				  LPLANGUAGE_T pLanguage )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  *pLanguage = TTS_AMERICAN_ENGLISH;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechSetLanguage                                 */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechSetLanguage() function sets the language   */
/*    that the Text-To-Speech system will use. The text to be spoken  */
/*    should be in the selected language.                             */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS     A pointer to a Text-To-Speech handle.                 */
/*                                                                    */
/*    Language  A value of type LANGUAGE_T which contains the         */
/*              language to use.                                      */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    An invalid parameter was passed.         */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechSetLanguage( LPTTS_HANDLE_T phTTS,
				  LANGUAGE_T Language )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  if ( Language != TTS_AMERICAN_ENGLISH )
	return( MMSYSERR_INVALPARAM );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechGetCaps                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechGetCaps() function fills in a structure of */
/*    type TTS_CAPS_T. On return, this function will contain the      */
/*    capabilities of the Text-To-Speech system.                      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTScaps  A pointer to a structure of type TTS_CAPS_T. The     */
/*               caller must have allocated space for this structure  */
/*               before calling this function.                        */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_ERROR         The pointer to the TTS_CAPS_T structure  */
/*                           was invalid.                             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

LANGUAGE_PARAMS_T LanguageParamsArray[1];

MMRESULT TextToSpeechGetCaps( LPTTS_CAPS_T pTTScaps )
{
  if ( pTTScaps == NULL )
	return( MMSYSERR_ERROR );

  LanguageParamsArray[0].dwLanguage = TTS_AMERICAN_ENGLISH;
  LanguageParamsArray[0].dwLanguageAttributes = PROPER_NAME_PRONUNCIATION;

  pTTScaps->dwNumberOfLanguages = 1;
  pTTScaps->lpLanguageParamsArray = LanguageParamsArray;
  pTTScaps->dwSampleRate = 11025;
  pTTScaps->dwMinimumSpeakingRate = MIN_SPEAKING_RATE;
  pTTScaps->dwMaximumSpeakingRate = MAX_SPEAKING_RATE;
  pTTScaps->dwNumberOfPredefinedSpeakers = WENDY + 1;
  pTTScaps->dwCharacterSet = TTS_ASCII;
  pTTScaps->Version = 421;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechLoadUserDictionary                          */
/*  Author: Bill Hallahan                                             */
/*  Date: September 13, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechLoadUserDictionary() function will load a  */
/*    user dictionary. If a user dictionary is already loaded then it */
/*    must be unloaded by the TextToSpeechUnloadUserDictionary()      */
/*    function before the new dictionary can be loaded.               */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS       A pointer to a Text-To-Speech handle.               */
/*                                                                    */
/*    szFileName  A pointer to a null terminated string which         */
/*                contains the dictionary name.                       */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion.            */
/*    MMSYSERR_NOMEM         Cannot allocate memory for Dictionary.   */
/*    MMSYSERR_INVALPARAM    Dictionary file not found.               */
/*                           (invalid dictionary file name.)          */
/*    MMSYSERR_ERROR         Illegal dictionary format,               */
/*                           or a dictionary is already loaded.       */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechLoadUserDictionary( LPTTS_HANDLE_T phTTS,
					 LPSTR szFileName )
{
  // Added a local varaible to get the handle of current kernel_share_data handle :MVP
  PKSD_T pKsd_t;

  // Initialize with the pointer stored in phTTS :MVP */
  pKsd_t = phTTS->pKernelShareData ;
  

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/
  
  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  Return error if a user dictionary is already loaded.            */
  /********************************************************************/
  /* Changed KS to pKsd_t :MVP */
 /* GL 11/05/1997  for BATS#510 */
     if ( pKsd_t->udic_entries[pKsd_t->lang_curr] != 0 )
	return( MMSYSERR_ERROR );

  /********************************************************************/
  /*  Load the user dictionary.                                       */
  /********************************************************************/

  // this is very broken; should be phTTS not phTTS->hWnd!?!
 /* GL 11/05/1997  for BATS#510 */
    return( load_dictionary( phTTS,
                 (void **)&(pKsd_t->udic[pKsd_t->lang_curr]),
                 (unsigned int *)&(pKsd_t->udic_entries[pKsd_t->lang_curr]),
                 szFileName,
                 TRUE,
                 FALSE ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechUnloadUserDictionary                        */
/*  Author: Bill Hallahan                                             */
/*  Date: July 22, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechUnLoadUserDictionary() function will       */
/*    unload the currently loaded user dictionary.                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS      A pointer to a Text-To-Speech handle.                */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechUnloadUserDictionary( LPTTS_HANDLE_T phTTS )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

 /* GL 11/05/1997  for BATS#510 */
  unload_dictionary((void **)&(phTTS->pKernelShareData->udic[phTTS->pKernelShareData->lang_curr]),
                        (unsigned int *)&(phTTS->pKernelShareData->udic_entries[phTTS->pKernelShareData->lang_curr]));

  return( MMSYSERR_NOERROR );
	UNREFERENCED_PARAMETER( phTTS );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechOpenInMemory                                */
/*  Author: Bill Hallahan                                             */
/*  Date: September 27, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechInMemory() function will cause all speech  */
/*    speech samples created by the Text-To-Speech system to be       */
/*    places in user supplied shared memory buffers. These buffers    */
/*    are supplied to the system by the TextToSpeechAddBuffer()       */
/*    function.                                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS                 A pointer to a Text-To-Speech handle.     */
/*                                                                    */
/*    dwFormat       An identifier which determines the wave file     */
/*                   audio sample format. It may be one of the        */
/*                   following constants which are defined in include */
/*                   file mmsystem.h and include file ttsapi.h:       */
/*                                                                    */
/*                     WAVE_FORMAT_1M08    11.025 KHz., Mono,  8-Bit  */
/*                     WAVE_FORMAT_1M16    11.025 KHz., Mono, 16-Bit  */
/*                     WAVE_FORMAT_08M08    8 KHz., Mono, 8-Bit u-law */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    An invalid parameter was passed.         */
/*                           (An illegal output format value.)        */
/*    MMSYSERR_NOMEM         Unable to allocate memory                */
/*    MMSYSERR_ERROR         Illeagal output state.                   */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechOpenInMemory( LPTTS_HANDLE_T phTTS,
				   DWORD dwFormat )
{
  P_PIPE buffer_pipe = NULL_PIPE;
  // tek bats385
  // we need the "buffer delay pipe" to make sure that we 
  // don't get stuck forever returning buffers if the
  // user buffer callback routine immediately returns buffers
  // during a reset.
  P_PIPE buffer_delay_pipe = NULL_PIPE;
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If not in NULL output state or AUDIO Output state then return   */
  /*  an error.                                                       */
  /********************************************************************/

  if (( phTTS->dwOutputState != STATE_OUTPUT_AUDIO )
	&& ( phTTS->dwOutputState != STATE_OUTPUT_NULL ))
	return( MMSYSERR_ERROR );

  /********************************************************************/
  /*  Wait until all previous calls to the TextToSpeechSpeak()        */
  /*  function have completed.                                        */
  /********************************************************************/

  mmStatus = TextToSpeechSync( phTTS );

  if ( mmStatus )
	return( mmStatus );

  /********************************************************************/
  /*  If the dwFormat value is invalid then return an error.          */
  /********************************************************************/

  switch( dwFormat )
  {
  case WAVE_FORMAT_1M16:

	SetSampleRate( phTTS, PC_SAMPLE_RATE );

	break;

  case WAVE_FORMAT_1M08:

	SetSampleRate( phTTS, PC_SAMPLE_RATE );

	break;

  case WAVE_FORMAT_08M08:

	SetSampleRate( phTTS, MULAW_SAMPLE_RATE );

	break;

  default:

	return( MMSYSERR_INVALPARAM );
  }

  phTTS->dwFormat = dwFormat;

  /********************************************************************/
  /*  Create a pipe to send the buffer addresses to the VTM thread.   */
  /********************************************************************/

  buffer_pipe = create_pipe( VOID_PTR_PIPE, BUFFER_PIPE_LENGTH );

  if ( buffer_pipe == NULL )
  {
	return( MMSYSERR_NOMEM );
  }
  
  phTTS->pKernelShareData->buffer_pipe = buffer_pipe;

  // 16jun97 tek bats 385 (buffer delay)

  /********************************************************************/
  /*  Create a pipe to send the buffer addresses to the VTM thread.   */
  /********************************************************************/

  buffer_delay_pipe = create_pipe( VOID_PTR_PIPE, BUFFER_PIPE_LENGTH );

  if ( buffer_delay_pipe == NULL )
  {
	return( MMSYSERR_NOMEM );
  }
  
  phTTS->pKernelShareData->buffer_delay_pipe = buffer_delay_pipe;

  /********************************************************************/
  /*  Get the DECtalk error message.                                  */
  /********************************************************************/

  phTTS->uiID_Buffer_Message =
	RegisterWindowMessage("DECtalkBufferMessage");

  if ( phTTS->uiID_Buffer_Message == 0 )
	return( MMSYSERR_ERROR );

  /********************************************************************/
  /*  Create the memory buffer critical section.                      */
  /********************************************************************/

  phTTS->pcsMemoryBuffer =
	( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));

  if ( phTTS->pcsMemoryBuffer == NULL )
  {
	DeleteTextToSpeechObjects( phTTS );
	return( MMSYSERR_NOMEM );
  }

  InitializeCriticalSection( phTTS->pcsMemoryBuffer );

  /********************************************************************/
  /*  Initialize the handle objects for memory output.                */
  /********************************************************************/

  phTTS->pTTS_Buffer = NULL;

  phTTS->dwOutputState = STATE_OUTPUT_MEMORY;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechCloseInMemory                               */
/*  Author: Bill Hallahan                                             */
/*  Date: September 28, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechCloseInMemory() function will return the   */
/*    Text-To-Speech system to it's normal state. Speech samples will */
/*    be routed to the audio device (if audio output was enabled at   */
/*    startup).                                                       */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS      A pointer to a Text-To-Speech handle.                */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_ERROR         Output to memory not enabled             */
/*                           or unable to create a system object.     */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechCloseInMemory( LPTTS_HANDLE_T phTTS )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If not in MEMORY output state then return an error.             */
  /********************************************************************/

  if ( phTTS->dwOutputState != STATE_OUTPUT_MEMORY )
	return( MMSYSERR_ERROR );

  // merged 28jul97 tek
  // 16jun97 tek bats 385 sync will hang forever if we don't clear
  // bInReset..
  phTTS->bInReset = FALSE;
  /********************************************************************/
  /*  Halt the system and flush all data.                             */
  /********************************************************************/

  TextToSpeechSync( phTTS );

  /********************************************************************/
  /*  Delete the memory buffer critical section.                      */
  /********************************************************************/

  if ( phTTS->pcsMemoryBuffer != NULL )
  {
	DeleteCriticalSection( phTTS->pcsMemoryBuffer );

	free( phTTS->pcsMemoryBuffer );
  }

  /********************************************************************/
  /*  Delete the memory buffer pipe.                                  */
  /********************************************************************/

  destroy_pipe( phTTS->pKernelShareData->buffer_pipe );
  // tek 30aug96 null the pointer.
  phTTS->pKernelShareData->buffer_pipe = NULL;

  // merged 28jul97 tek
  // 16jun97 tek bats 385 (buffer delay)
  destroy_pipe( phTTS->pKernelShareData->buffer_delay_pipe );
  phTTS->pKernelShareData->buffer_delay_pipe = NULL;

  /********************************************************************/
  /*  Set the system output state to audio if it is enabled.          */
  /********************************************************************/

  phTTS->pTTS_Buffer = NULL;

  if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
  else
	phTTS->dwOutputState = STATE_OUTPUT_NULL;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechAddBuffer                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: September 30, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function will add a buffer to the memory list.        */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS          A pointer to a structure of type TTS_HANDLE_T.   */
/*                                                                    */
/*    pTTS_Buffer    A pointer to a TTS_BUFFER_T structure.           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    Invalid parameter.                       */
/*    MMSYSERR_ERROR         Output to memory not enabled             */
/*                           or unable to create a system object.     */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechAddBuffer( LPTTS_HANDLE_T phTTS,
				LPTTS_BUFFER_T pTTS_Buffer )
{
  LPTTS_BUFFER_T pPipeArray[1];
  unsigned int uiI;
  char szTemp[256]="";

#ifdef _DEBUG
  OutputDebugString("TTSAddBuffer().\n");

  if (pTTS_Buffer == NULL)
  {
	  OutputDebugString("  ..adding null buffer.\n");
  }
  else
  {
	  OutputDebugString("  ..adding user buffer.\n");
  }
#endif //_DEBUG

/********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If not in MEMORY output state then return an error.             */
  /********************************************************************/

  if ( phTTS->dwOutputState != STATE_OUTPUT_MEMORY )
	return( MMSYSERR_ERROR );

  /********************************************************************/
  /*  Send the wave header to the VTM thread.                         */
  /********************************************************************/

  pPipeArray[0] = pTTS_Buffer;
  
  // tek 03sep96 add some debugging info here..
  LockPipe( phTTS->pKernelShareData->buffer_pipe );
  write_pipe( phTTS->pKernelShareData->buffer_pipe, pPipeArray, 1 );
  uiI = pipe_count( phTTS->pKernelShareData->buffer_pipe );
#ifdef _DEBUG
  sprintf(szTemp,"Added buffer %08lx, count now %d\n",
    pPipeArray[0], uiI);
  OutputDebugString(szTemp);
#endif //_DEBUG
  UnlockPipe( phTTS->pKernelShareData->buffer_pipe );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechReturnBuffer                                */
/*  Author: Bill Hallahan                                             */
/*  Date: September 30, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function will cause the current buffer to be returned */
/*    even if it not yet full. The buffer may in fact be empty. The   */
/*    dwLength field of the WAVEHDR structure will contain the number */
/*    of samples in the buffer.                                       */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS           A pointer to a structure of type TTS_HANDLE_T.  */
/*                                                                    */
/*    ppTTS_Buffer    A pointer to a LPTTS_BUFFER_T pointer.          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    Invalid parameter.                       */
/*    MMSYSERR_ERROR         Output to memory not enabled             */
/*                           or unable to create a system object.     */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechReturnBuffer( LPTTS_HANDLE_T phTTS,
				   LPTTS_BUFFER_T * ppTTS_Buffer )
{
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/
#ifdef _DEBUG
	OutputDebugString("TTSReturnBuffer() ?? \n");
#endif //_DEBUG
  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If not in MEMORY output state then return an error.             */
  /********************************************************************/

  if ( phTTS->dwOutputState != STATE_OUTPUT_MEMORY )
	return( MMSYSERR_ERROR );

  /********************************************************************/
  /*  Return the last buffer to the application.                      */
  /*  Block if the buffer is busy.                                    */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsMemoryBuffer );

  *ppTTS_Buffer = (LPTTS_BUFFER_T)phTTS->pTTS_Buffer;
  phTTS->pTTS_Buffer = NULL;

  /********************************************************************/
  /*  Release the buffer.                                             */
  /********************************************************************/

  LeaveCriticalSection( phTTS->pcsMemoryBuffer );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechOpenLogFile                                 */
/*  Author: Bill Hallahan                                             */
/*  Date: October 12, 1993                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The TextToSpeechOpenLogFile() function creates a file      */
/*    which contains either text, phonemes, or syllables. The         */
/*    phonemes and syllables are written using the arpabet alphabet.  */
/*    After calling this function, all subsequent calls to the        */
/*    TextToSpeechSpeak() function cause the log data to be written   */
/*    to specified file until the TextToSpeechCloseLogFile() function */
/*    is called.                                                      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS          A pointer to a Text-To-Speech handle.            */
/*                                                                    */
/*    pszFileName    A pointer of type char * which points to a null  */
/*                   terminated filename.                             */
/*                                                                    */
/*    dwFlags        A DWORD which specified the type of output. It   */
/*                   may contain one or more of the following         */
/*                   constans:                                        */
/*                                                                    */
/*       value                       Operation                        */
/*                                                                    */
/*    LOG_PHONEMES           Log phonemes                             */
/*    LOG_NAME_TYPES         Log name types to console                */
/*    LOG_FORM_TYPES         Log name form classes to console         */
/*    LOG_SYLLABLES          Log name syllable structure              */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_INVALPARAM    An invalid parameter was passed.         */
/*    MMSYSERR_NOMEM         Unable to allocate memory                */
/*    MMSYSERR_ALLOCATED     A log file is already open.              */
/*    MMSYSERR_ERROR         Unable to open the output file           */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechOpenLogFile( LPTTS_HANDLE_T phTTS,
				  char pszFileName[],
				  DWORD dwFlags )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  If a file is already open, then don't try to open another one.  */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsLogFile );

  if ( phTTS->dwOutputState == STATE_OUTPUT_LOG_FILE )
  {
	LeaveCriticalSection( phTTS->pcsLogFile );
	return( MMSYSERR_ALLOCATED );
  }

  /********************************************************************/
  /*  If not in NULL output state or AUDIO Output state then return   */
  /*  an error.                                                       */
  /********************************************************************/

  if (( phTTS->dwOutputState != STATE_OUTPUT_AUDIO )
	&& ( phTTS->dwOutputState != STATE_OUTPUT_NULL ))
  {
	LeaveCriticalSection( phTTS->pcsLogFile );
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Make sure the arguments are valid.                              */
  /********************************************************************/

  if ( dwFlags & ~( LOG_TEXT | LOG_PHONEMES | LOG_SYLLABLES ))
  {
	LeaveCriticalSection( phTTS->pcsLogFile );
	return( MMSYSERR_INVALPARAM );
  }

  /********************************************************************/
  /*  Wait until all previous calls to the TextToSpeechSpeak()        */
  /*  function have completed.                                        */
  /********************************************************************/

  mmStatus = TextToSpeechSync( phTTS );

  if ( mmStatus )
  {
	LeaveCriticalSection( phTTS->pcsLogFile );
	return( mmStatus );
  }

  /********************************************************************/
  /*  Open the log file.                                              */
  /********************************************************************/

  if (( phTTS->pLogFile = fopen( pszFileName, "w" )) == NULL )
  {
	LeaveCriticalSection( phTTS->pcsLogFile );
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Set the log file control variables.                             */
  /********************************************************************/

  phTTS->pKernelShareData->logflag = dwFlags;
  phTTS->dwOutputState = STATE_OUTPUT_LOG_FILE;

  LeaveCriticalSection( phTTS->pcsLogFile );

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechCloseLogFile                                */
/*  Author: Bill Hallahan                                             */
/*  Date: OCtober 12, 1993                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function closes the log file opened by the                 */
/*    TextToSpeechOpenLogFile() function.                             */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    MMSYSERR_NOERROR = 0   Normal successful completion             */
/*    MMSYSERR_ERROR         Failure to wait for pending speech,      */
/*                           or Unable to close the output file,      */
/*                           or No output file is open.               */
/*    MMSYSERR_INVALHANDLE   The Text-To-Speech handle is invalid.    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT TextToSpeechCloseLogFile( LPTTS_HANDLE_T phTTS )
{
  MMRESULT mmStatus;

  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/

  if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
	return( MMSYSERR_INVALHANDLE );

  /********************************************************************/
  /*  Disable writing to the log file.                                */
  /********************************************************************/

  phTTS->pKernelShareData->logflag = 0;       /* BATS#120 FIX TK & JL */

  /********************************************************************/
  /*  If a file is not open, then exit.                               */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsLogFile );

  if ( phTTS->dwOutputState != STATE_OUTPUT_LOG_FILE )
  {
	LeaveCriticalSection( phTTS->pcsLogFile );
	return( MMSYSERR_ERROR );
  }

  /********************************************************************/
  /*  Wait until all previous calls to the TextToSpeechSpeak()        */
  /*  function have completed.                                        */
  /********************************************************************/

  mmStatus = TextToSpeechSync( phTTS );

  if ( mmStatus )
	mmStatus = MMSYSERR_ERROR;
  else
	mmStatus = MMSYSERR_NOERROR;

  /********************************************************************/
  /*  Make sure data has been written to the file.                    */
  /********************************************************************/

  _flushall;

  /********************************************************************/
  /*  Set the system output state to audio if it is enabled.          */
  /********************************************************************/

  if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
  else
	phTTS->dwOutputState = STATE_OUTPUT_NULL;

  /********************************************************************/
  /*  Close the log file.                                             */
  /********************************************************************/

  if ( fclose( phTTS->pLogFile ))
	mmStatus = MMSYSERR_ERROR;

  LeaveCriticalSection( phTTS->pcsLogFile );

  return( mmStatus );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: QueueToMemory                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: September 28, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function queues a buffer of samples to application    */
/*    provided  buffers in shared memory. This function will block    */
/*    until there is enough buffer space avaiable. This function is   */
/*    called by the driver for the vocal tract model in file          */
/*    vtmiont.c.                                                      */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS              A pointer to a structure of type             */
/*                       TTS_HANDLE_T.                                */
/*                                                                    */
/*    pSamples           A pointer (of type LPSAMPLE_T) to a buffer   */
/*                       which contains samples (of type SAMPLE_T).   */
/*                                                                    */
/*                                                                    */
/*    dwNumberOfSamples  A DWORD which is equal to the number of 16   */
/*                       bit samples to be queued which are in the    */
/*                       buffer pointed to by "pSamples".             */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void QueueToMemory( LPTTS_HANDLE_T phTTS,
			LPSAMPLE_T pSamples,
			DWORD dwNumberOfSamples )
{
  unsigned int i;                        /*MVP : Not a static */
  DWORD dwBytesLeft;             /*MVP : Not a static */
  DWORD dwWordsLeft;             /*MVP : Not a static */
  unsigned char * pBuffer;       /*MVP : Not a static */
  short * pShort;                                               /*tek/bh 29jul96 */
  LPTTS_BUFFER_T pTTS_Buffer;/*MVP : Not a static */

  /********************************************************************/
  /*  Loop until all samples have been moved into buffers.            */
  /********************************************************************/

  while( dwNumberOfSamples )
  {
	/******************************************************************/
	/*  Block if the TextToSpeechReturnBuffer() function is returning */
	/*  the current buffer.                                           */
	/******************************************************************/

	EnterCriticalSection( phTTS->pcsMemoryBuffer );

	/******************************************************************/
	/*  If a new Text-To-Speech buffer is needed then get one from    */
	/*  the application. Block if one is not available.               */
	/******************************************************************/

	if ( (phTTS->pTTS_Buffer == NULL )
		&& !(phTTS->bMemoryReset) 
		&& !(phTTS->pKernelShareData->halting) )
	{
#ifdef _DEBUG
		OutputDebugString("Q2M getting buffer.\n");
#endif //_DEBUG
		phTTS->pTTS_Buffer = GetBuffer( phTTS );
	}

	/******************************************************************/
	/*  Move as many samples as possible into the buffer.             */
	/*  Get the current buffer pointer and the number of bytes left   */
	/*  in the buffer.                                                */
	/******************************************************************/

	pTTS_Buffer = (LPTTS_BUFFER_T)phTTS->pTTS_Buffer;

	/******************************************************************/
	/*  NULL buffers sent by reset to fix hang. WIH 3/27/95           */
	/******************************************************************/

	/* tek 19aug96 Also, we should bail out here if we're doing a     */
	/* reset.                                                         */
	if ( (pTTS_Buffer == NULL))
	{ // tek I think we have to do a leaveCS here.. 
	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );
#ifdef _DEBUG
	  OutputDebugString("Q2M null bailout.\n");
#endif //_DEBUG
	  return;
	}
		
	if (phTTS->bMemoryReset)
	{ // tek I think we have to do a leaveCS here.. 
	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );
	  SendBuffer(phTTS); //tek 03sep96
#ifdef _DEBUG
	  OutputDebugString("Q2M reset bailout.\n");
#endif //_DEBUG
	  return;
	}       

	if  (phTTS->pKernelShareData->halting)
	{ // tek I think we have to do a leaveCS here.. 
	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );
	  SendBuffer(phTTS); //tek 03sep96
#ifdef _DEBUG
	  OutputDebugString("Q2M halt bailout.\n");
#endif //_DEBUG
	  return;
	}

	pBuffer = (unsigned char *) pTTS_Buffer->lpData + pTTS_Buffer->dwBufferLength;
  
	dwBytesLeft =
	  pTTS_Buffer->dwMaximumBufferLength - pTTS_Buffer->dwBufferLength;

	/******************************************************************/
	/*  Put the samples into the buffer in the proper format.         */
	/******************************************************************/

	switch( phTTS->dwFormat )
	{
	/******************************************************************/
	/*  Output 16 bit samples.                                        */
	/******************************************************************/

	case WAVE_FORMAT_1M16:

	  dwWordsLeft = dwBytesLeft >> 1;
	  pShort = (short *)pBuffer;      

	  if ( dwNumberOfSamples >= dwWordsLeft )
	  {
	for ( i = 0; i < dwWordsLeft; i++ )
	  *pShort++ = *pSamples++;

	pTTS_Buffer->dwBufferLength += dwWordsLeft << 1;
	dwNumberOfSamples = dwNumberOfSamples - dwWordsLeft;
	  }
	  else
	  {
	for ( i = 0; i < dwNumberOfSamples; i++ )
	  *pShort++ = *pSamples++;

	pTTS_Buffer->dwBufferLength += dwNumberOfSamples << 1;
	dwNumberOfSamples = 0;
	  }

	  break;

	/******************************************************************/
	/*  Output 8 bit samples.                                         */
	/******************************************************************/

	case WAVE_FORMAT_1M08:

	  if ( dwNumberOfSamples >= dwBytesLeft )
	  {
	for ( i = 0; i < dwBytesLeft; i++ )
	  *pBuffer++ = ((unsigned char)((*pSamples++) >> 8)) ^ 0x80;

	pTTS_Buffer->dwBufferLength += dwBytesLeft;
	dwNumberOfSamples = dwNumberOfSamples - dwBytesLeft;
	  }
	  else
	  {
	for ( i = 0; i < dwNumberOfSamples; i++ )
	  *pBuffer++ = ((unsigned char)((*pSamples++) >> 8)) ^ 0x80;

	pTTS_Buffer->dwBufferLength += dwNumberOfSamples;
	dwNumberOfSamples = 0;
	  }

	  break;

	/******************************************************************/
	/*  Output 8 bit mu-law samples.                                  */
	/******************************************************************/

	case WAVE_FORMAT_08M08:

	  if ( dwNumberOfSamples >= dwBytesLeft )
	  {
	for ( i = 0; i < dwBytesLeft; i++ )
	  *pBuffer++ = LinearToMuLaw( *pSamples++ );

	pTTS_Buffer->dwBufferLength += dwBytesLeft;
	dwNumberOfSamples = dwNumberOfSamples - dwBytesLeft;
	  }
	  else
	  {
	for ( i = 0; i < dwNumberOfSamples; i++ )
	  *pBuffer++ = LinearToMuLaw( *pSamples++ );

	pTTS_Buffer->dwBufferLength += dwNumberOfSamples;
	dwNumberOfSamples = 0;
	  }

	  break;

	default:

	  break;
	}

	/******************************************************************/
	/*  The buffer is full. Return it to the application.             */
	/******************************************************************/

	if ( pTTS_Buffer->dwBufferLength >= pTTS_Buffer->dwMaximumBufferLength )
	{
	  /****************************************************************/
	  /*  Release the buffer.                                         */
	  /****************************************************************/

	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );

	  SendBuffer( phTTS );
	}
	else
	{
	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );

	  /****************************************************************/
	  /*  tek 19aug96 if halting, release the buffer.                 */
	  /****************************************************************/
	if (phTTS->pKernelShareData-> halting)
		SendBuffer(phTTS);

	}
  }

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: GetBuffer                                               */
/*  Author: Bill Hallahan                                             */
/*  Date: November 30, 1993                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function will get an application provided buffer.     */
/*    The buffer address will be copied into the pTTS_Buffer element  */
/*    of the Text-To-Speech handle phTTS.                             */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS              A pointer to a structure of type             */
/*                       TTS_HANDLE_T.                                */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    A pointer to a structure of type TTS_HANDLE_T.                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LPTTS_BUFFER_T GetBuffer( LPTTS_HANDLE_T phTTS )
{
  LPTTS_BUFFER_T pTTS_BufferArray[1];  /*MVP : Not a static */
  LPTTS_BUFFER_T pTTS_Buffer;              /*MVP : Not a static */

  read_pipe( phTTS->pKernelShareData->buffer_pipe, &pTTS_BufferArray[0], 1 );

  pTTS_Buffer = pTTS_BufferArray[0];

  if ( pTTS_Buffer != NULL )
  {
	pTTS_Buffer->dwBufferLength = 0;
	pTTS_Buffer->dwNumberOfPhonemeChanges = 0;
	pTTS_Buffer->dwNumberOfIndexMarks = 0;

	if ( phTTS->dwFormat == WAVE_FORMAT_1M16 )
	  pTTS_Buffer->dwMaximumBufferLength &= 0xFFFFFFFE;
  }
  return( pTTS_Buffer );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SendBuffer                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: October 1, 1993                                             */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function returns the current buffer to the            */
/*    application.                                                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS              A pointer to a structure of type             */
/*                       TTS_HANDLE_T.                                */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void SendBuffer( LPTTS_HANDLE_T phTTS )
{
   LPTTS_BUFFER_T pTTS_Buffer;              /*MVP : Not a static */
#ifdef _DEBUG
	OutputDebugString("SendBuffer().\n");
#endif //_DEBUG
  if ( (! phTTS->bMemoryReset)
	  && (! phTTS->pKernelShareData->halting))
  {
#ifdef _DEBUG
	  OutputDebugString(" SB (!reset).\n");
#endif //_DEBUG
	if ( phTTS->pTTS_Buffer != NULL )
	{
	  pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer;

	  /****************************************************************/
	  /*  NULL buffers sent by reset to fix hang. WIH 3/27/95         */
	  /****************************************************************/

	  if ( pTTS_Buffer != NULL )
	  {


	  /****************************************************************/
	  /*  It is possible to get here with nothing in the buffer if    */
	  /*  a force caused the buffer to be returned. Check the buffer  */
	  /*  to see if it has any sections full.                         */
	  /****************************************************************/

	  if (( pTTS_Buffer->dwBufferLength > 0 )
	 || ( pTTS_Buffer->dwNumberOfIndexMarks > 0 )
	 || ( pTTS_Buffer->dwNumberOfPhonemeChanges > 0 ))
	  {
	phTTS->bSendingBuffer = TRUE;
	/*
	SendMessage( phTTS->hWnd,
			 phTTS->uiID_Buffer_Message,
			 0,
			 (LPARAM)phTTS->pTTS_Buffer );
	*/
	//MVP: Replaced above SendMessage with Report_TTS_status :New Audio code
#ifdef _DEBUG
	OutputDebugString("returning partial buffer.\n");
#endif //_DEBUG

	Report_TTS_Status(phTTS,phTTS->uiID_Buffer_Message,0,(LPARAM)phTTS->pTTS_Buffer);
	
	phTTS->bSendingBuffer = FALSE;

	WaitForSingleObject( phTTS->hNotEmptyingVtmPipeEvent, INFINITE );

	phTTS->pTTS_Buffer = NULL;
	  }
	  }
	}
  }
  else
  {
#ifdef _DEBUG
	  OutputDebugString("SB (reset)\n");
	if (phTTS->pKernelShareData->halting)
		OutputDebugString("SB halting.. \n");
	if (phTTS->bMemoryReset)
		OutputDebugString("SB memreset.. \n");
#endif //_DEBUG

	/******************************************************************/
	/*  Send the current buffer back.                                 */
	/******************************************************************/

	if ( phTTS->pTTS_Buffer != NULL )
	{
#ifdef _DEBUG
	  OutputDebugString("SB return current buf. \n");
#endif //_DEBUG
	  pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer;

	  /****************************************************************/
	  /*  NULL buffers sent by reset to fix hang. WIH 3/27/95         */
	  /*  This is needed in spite of previous "if" statement because  */
	  /*  the app is multip-threaded.                                 */
	  /****************************************************************/

	  if ( pTTS_Buffer != NULL )
	  {
	phTTS->bSendingBuffer = TRUE;
	/*
	SendMessage( phTTS->hWnd,
			 phTTS->uiID_Buffer_Message,
			 0,
			 (LPARAM)pTTS_Buffer );
	*/
	//MVP: Replaced above SendMessage with Report_TTS_status :New Audio code
#ifdef _DEBUG
    OutputDebugString(" returning a buffer.. \n");
#endif //_DEBUG

	Report_TTS_Status(phTTS,phTTS->uiID_Buffer_Message,0,(LPARAM)pTTS_Buffer);
	phTTS->pTTS_Buffer = NULL;        //tek 03sep96

	phTTS->bSendingBuffer = FALSE;

	WaitForSingleObject( phTTS->hNotEmptyingVtmPipeEvent, INFINITE );
	  }

	}
	
	// tek 03sep96 moved the return of remaining buffers out to 
	// a separate routine.
	ReturnRemainingBuffers(phTTS);

// tek 29aug96 if we're in a flusg, put in another null buffer.. 
    if (phTTS->pKernelShareData->halting )
		TextToSpeechAddBuffer(phTTS, NULL); // a dummy buffer.
	/******************************************************************/
	/*  Empty the VTM pipe in case there is still any data in it      */
	/******************************************************************/

	InitializeVTM(phTTS);

	//phTTS->pTTS_Buffer = NULL;
	//tek 03sep96 we can't clear this flag here, because  vtm writes
	// that sneak in at the 'right' time could prematurely clear it.
	//phTTS->bMemoryReset = FALSE;

	SetEvent( phTTS->hNotEmptyingVtmPipeEvent );
  }
#ifdef _DEBUG
  OutputDebugString("SB done.\n");
#endif //_DEBUG
  return;
}

//tek 03sep96
// created this routine (once a part of SendBuffer) to correctly
// return the remaining buffers and to allow the buffer pipe
// to be flushed during a reset without problems of collisions
// with the VTM thread. 
// tek 28jul97 bats 385: this now only returns buffers that were
// outstanding before we were called, to avoid an infinite loop 
// if the user's callback returns buffers in reset..
void ReturnRemainingBuffers( LPTTS_HANDLE_T phTTS )

{
  LPTTS_BUFFER_T pPipeArray[1];        /*MVP : Not a static */
  LPTTS_BUFFER_T pTTS_Buffer;              /*MVP : Not a static */
  UINT	uiPipeCount=0;				// 16jun97 tek bats 385 merged 28jul97

#ifdef _DEBUG
  OutputDebugString("ReturnRemainingBuffers()\n");
#endif //_DEBUG

    /******************************************************************/
	/*  Send all the remaining buffers back.                          */
	/******************************************************************/

	// tek 03sep96 we need to lock the pipe to make sure nothing arrives
    // while we're dumping.. 

	// 16jun97 tek bats 385: (merged 28jul97)
    	// the user callback may be coded to just return buffers, and that 
	// would result in an infinite loop if we just tried to drain the pipe.
	// Soooo.. we empty the pipe into an cache, and then return the buffers
	// from the cache; this means the user callback is filling a different
	// pipe and thus we won't loop forever.
    LockPipe(phTTS->pKernelShareData->buffer_pipe);

	while (pipe_count( phTTS->pKernelShareData->buffer_pipe ) )
	{
	  read_pipe( phTTS->pKernelShareData->buffer_pipe, &pPipeArray, 1 );
	  write_pipe(phTTS->pKernelShareData->buffer_delay_pipe, pPipeArray, 1 );
	}
	UnlockPipe(phTTS->pKernelShareData->buffer_pipe);

	while (pipe_count( phTTS->pKernelShareData->buffer_delay_pipe ))
	{
	  read_pipe( phTTS->pKernelShareData->buffer_delay_pipe, &pPipeArray, 1 );

	  pTTS_Buffer = pPipeArray[0];

	  if ( pTTS_Buffer != NULL )
	  {
	pTTS_Buffer->dwBufferLength = 0;
	pTTS_Buffer->dwNumberOfPhonemeChanges = 0;
	pTTS_Buffer->dwNumberOfIndexMarks = 0;

	phTTS->bSendingBuffer = TRUE;
	/*
	SendMessage( phTTS->hWnd,
			 phTTS->uiID_Buffer_Message,
			 0,
			 (LPARAM)pTTS_Buffer );
	*/
	//MVP: Replaced above SendMessage with Report_TTS_status :New Audio code
#ifdef _DEBUG
	OutputDebugString(" returning a remaining buffer.. \n");
#endif //_DEBUG
	Report_TTS_Status(phTTS,phTTS->uiID_Buffer_Message,0,(LPARAM)pTTS_Buffer);

	phTTS->bSendingBuffer = FALSE;

	WaitForSingleObject( phTTS->hNotEmptyingVtmPipeEvent, INFINITE );
	}
	// relock the pipe to atomically get a count and a buffer.
	// LockPipe(phTTS->pKernelShareData->buffer_pipe);
  }
//  UnlockPipe(phTTS->pKernelShareData->buffer_pipe);
} // ReturnRemainingBuffers()

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PutIndexMarkInBuffer                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: October 1, 1993                                             */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function puts an index mark in the buffer structure   */
/*    which is used whenever the Text-To-Speech system is buffering   */
/*    speech samples in memory.                                       */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS              A pointer to a structure of type             */
/*                       TTS_HANDLE_T.                                */
/*                                                                    */
/*    dwIndexValue       A DWORD which equals the index mark value.   */
/*                                                                    */
/*    dwSampleNumber     A DWORD which equals the current sample      */
/*                       number.                                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void PutIndexMarkInBuffer( LPTTS_HANDLE_T phTTS,
			   DWORD dwIndexValue,
			   DWORD dwSampleNumber )
{
  UINT uiIndex;                                                      /*MVP : Not a static */
  /*static LPTTS_BUFFER_T pPipeArray[1];*/               /*MVP : Never Used   */
  LPTTS_BUFFER_T pTTS_Buffer;                                    /*MVP : Not a static */
  static LPTTS_INDEX_T pIndexArray;                              /*MVP : Not a static */

  /********************************************************************/
  /*  Block if the TextToSpeechReturnBuffer() function is returning   */
  /*  the current buffer.                                             */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsMemoryBuffer );

  /********************************************************************/
  /*  If a new Text-To-Speech buffer is needed then get one from      */
  /*  the application. Block if one is not available.                 */
  /********************************************************************/

  if ( phTTS->pTTS_Buffer == NULL )
  {
	phTTS->pTTS_Buffer = GetBuffer( phTTS );
  }

  pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer;

  /********************************************************************/
  /*  NULL buffers sent by reset to fix hang. WIH 3/27/95             */
  /********************************************************************/

  if ( pTTS_Buffer == NULL )
  {
	LeaveCriticalSection( phTTS->pcsMemoryBuffer );
	return;
  }

  /********************************************************************/
  /*  Put the index mark into the current buffer.                     */
  /********************************************************************/

  pIndexArray = pTTS_Buffer->lpIndexArray;

  if ( pIndexArray != NULL )
  {
	uiIndex = pTTS_Buffer->dwNumberOfIndexMarks;

	if ( pTTS_Buffer->dwMaximumNumberOfIndexMarks > 0 )
	{
	  (pIndexArray+uiIndex)->dwIndexValue = dwIndexValue;
	  (pIndexArray+uiIndex)->dwIndexSampleNumber = dwSampleNumber;
	  pTTS_Buffer->dwNumberOfIndexMarks++;
	}

	/******************************************************************/
	/*  If the index mark array is full then return it to the         */
	/*  application.                                                  */
	/******************************************************************/

	if ( pTTS_Buffer->dwNumberOfIndexMarks
	   >= pTTS_Buffer->dwMaximumNumberOfIndexMarks )
	{
	  /****************************************************************/
	  /*  Release the buffer.                                         */
	  /****************************************************************/

	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );

	  SendBuffer( phTTS );
	}
	else
	{
	  /****************************************************************/
	  /*  Release the buffer.                                         */
	  /****************************************************************/

	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );
	}
  }
  else
  {
	/******************************************************************/
	/*  Release the buffer.                                           */
	/******************************************************************/

	LeaveCriticalSection( phTTS->pcsMemoryBuffer );
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: PutPhonemeInBuffer                                      */
/*  Author: Bill Hallahan                                             */
/*  Date: October 1, 1993                                             */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function puts phoneme data in the buffer structure    */
/*    which is used whenever the Text-To-Speech system is buffering   */
/*    speech samples in memory.                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS              A pointer to a structure of type             */
/*                       TTS_HANDLE_T.                                */
/*                                                                    */
/*    dwIndexValue       A DWORD which equals the index mark value.   */
/*                                                                    */
/*    dwSampleNumber     A DWORD which equals the current sample      */
/*                       number.                                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void PutPhonemeInBuffer( LPTTS_HANDLE_T phTTS,
			 DWORD dwPhoneme,
			 DWORD dwPhonemeDuration,
			 DWORD dwSampleNumber )
{
  UINT uiIndex;                                                     /* MVP : Not a static */
  /*static LPTTS_BUFFER_T pPipeArray[1];*/  /* MVP : Never Used   */
  LPTTS_BUFFER_T pTTS_Buffer;                           /* MVP : Not a static */
  LPTTS_PHONEME_T pPhonemeArray;                        /* MVP : Not a static */

  /********************************************************************/
  /*  Block if the TextToSpeechReturnBuffer() function is returning   */
  /*  the current buffer.                                             */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsMemoryBuffer );

  /********************************************************************/
  /*  If a new Text-To-Speech buffer is needed then get one from      */
  /*  the application. Block if one is not available.                 */
  /********************************************************************/

  if ( phTTS->pTTS_Buffer == NULL )
  {
	phTTS->pTTS_Buffer = GetBuffer( phTTS );
  }

  /********************************************************************/
  /*  Put the index mark into the current buffer.                     */
  /********************************************************************/

  pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer;

  /********************************************************************/
  /*  NULL buffers sent by reset to fix hang. WIH 3/27/95             */
  /********************************************************************/

  if ( pTTS_Buffer == NULL )
  {
	LeaveCriticalSection( phTTS->pcsMemoryBuffer );
	return;
  }

  pPhonemeArray = pTTS_Buffer->lpPhonemeArray;

  if ( pPhonemeArray != NULL )
  {
	uiIndex = pTTS_Buffer->dwNumberOfPhonemeChanges;

	if ( pTTS_Buffer->dwMaximumNumberOfPhonemeChanges > 0 )
	{
	  (pPhonemeArray+uiIndex)->dwPhoneme = dwPhoneme;
	  (pPhonemeArray+uiIndex)->dwPhonemeSampleNumber = dwSampleNumber;
	  (pPhonemeArray+uiIndex)->dwPhonemeDuration = dwPhonemeDuration;
	  pTTS_Buffer->dwNumberOfPhonemeChanges++;
	}

	/******************************************************************/
	/*  If the phoneme array is full then return it to the            */
	/*  application.                                                  */
	/******************************************************************/

	if ( pTTS_Buffer->dwNumberOfPhonemeChanges
	   >= pTTS_Buffer->dwMaximumNumberOfPhonemeChanges )
	{
	  /****************************************************************/
	  /*  Release the buffer.                                         */
	  /****************************************************************/

	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );

	  SendBuffer( phTTS );
	}
	else
	{
	  /****************************************************************/
	  /*  Release the buffer.                                         */
	  /****************************************************************/

	  LeaveCriticalSection( phTTS->pcsMemoryBuffer );
	}
  }
  else
  {
	/******************************************************************/
	/*  Release the buffer.                                           */
	/******************************************************************/

	LeaveCriticalSection( phTTS->pcsMemoryBuffer );
  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: SetSpeaker                                              */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         The SetSpeaker() function sets voice of the speaker that   */
/*    the Text-To-Speech system will use.                             */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    Speaker  A value of type SPEAKER_T which contains the speaking  */
/*             voice to use.                                          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    The speaker is set asynchronously.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void SetSpeaker( LPTTS_HANDLE_T phTTS, SPEAKER_T Speaker )
{
  /********************************************************************/
  /*  Set voice change flag for phmain.c in the PH thread.            */
  /********************************************************************/
  PKSD_T pKsd_t = phTTS->pKernelShareData;

  pKsd_t->async_voice = Speaker;
  pKsd_t->last_voice = (short)Speaker;
  pKsd_t->async_change |= ASYNC_voice;

}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Thread Main: TextToSpeechThreadMain                               */
/*  Author: Bill Hallahan                                             */
/*  Date: April 14, 1993                                              */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This is the message processing loop for the Text-To-Speech */
/*    window procedure. The Text To Speech window procedure processes */
/*    all messages which pertain to the wave output device.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static DWORD __stdcall TextToSpeechThreadMain( LPTTS_HANDLE_T phTTS )
{
  MSG msg;

  /********************************************************************/
  /*  Create the TextToSpeech window.                                 */
  /********************************************************************/

  phTTS->hTextToSpeechWnd = InitTextToSpeechWindow( phTTS );

  if(phTTS->hTextToSpeechWnd == NULL)
	return(MMSYSERR_ERROR);
  SetEvent(phTTS->hMallocSuccessEvent);    /*Got a hTextToSpeechWnd now */
  
  while( GetMessage( &msg,
			   phTTS->hTextToSpeechWnd,
			   0L,
			   ID_TTS_Destroy ))
	  DispatchMessage( &msg );

  _endthreadex(msg.wParam);
  return( FALSE );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: InitTextToSpeechWindow                                  */
/*  Author: Bill Hallahan                                             */
/*  Date: March 29, 1993                                              */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function creates an invisible window which provides   */
/*    Text-To-Speech output capability. This window message loop is   */
/*    thread TextToSpeechThreadMain(). An application sends messages  */
/*    to the TextToSpeech window procedure TextToSpeechWndProc() by   */
/*    calling one of the functions listed at the start of this file.  */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS   A pointer to a structure of type TTS_HANDLE_T.          */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a handle to the TextToSpeech window. If   */
/*    the window cannot be created then NULL is returned.             */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static HWND InitTextToSpeechWindow( LPTTS_HANDLE_T phTTS )
{
  WNDCLASS wc;
  HWND hWnd;
  HINSTANCE hInstance;
  char wndclass[255];

  /********************************************************************/
  /*  Register a TextToSpeech Window Class.                           */
  /*  Get the hInstance for the new Window.                           */
  /********************************************************************/

  // tek 13nov97 why do we think the phTTS->hWnd is anything useful??
  hInstance = NULL;
  //hInstance = (HINSTANCE)GetWindowLong( phTTS->hWnd,
  //					GWL_HINSTANCE );

  /********************************************************************/
  /*  Register a TextToSpeech window class.                           */
  /********************************************************************/

  sprintf(wndclass,"%s_%08X",TEXTTOSPEECHWNDCLASS,(unsigned long int) phTTS);
  wc.lpszClassName = wndclass;
  wc.lpfnWndProc =   TextToSpeechWndProc;
  wc.hInstance =     hInstance;
#ifndef UNDER_CE
  wc.hCursor =       LoadCursor( 0, IDC_ARROW );
  wc.hIcon =         LoadIcon( 0, IDI_APPLICATION );
#else
  wc.hCursor =       NULL;
  wc.hIcon =         NULL;
#endif
  wc.hbrBackground = (HBRUSH)( COLOR_APPWORKSPACE+1 );
  wc.lpszMenuName =  NULL;
#ifndef UNDER_CE
  wc.style =         CS_OWNDC;
#else
  wc.style =         NULL;
#endif
  wc.cbClsExtra =    0;
  wc.cbWndExtra =    8;         /* MVP :To store phTTS through SetWindowLong */

  RegisterClass( &wc );

  /********************************************************************/
  /*  Create an Invisible TextToSpeech Window.                        */
  /********************************************************************/

#ifndef UNDER_CE
  hWnd = CreateWindow( wndclass,
			   "TextToSpeech Output, v1.0",
			   WS_CLIPCHILDREN | WS_OVERLAPPEDWINDOW,
			   CW_USEDEFAULT,
			   CW_USEDEFAULT,
			   CW_USEDEFAULT,
			   CW_USEDEFAULT,
			   0,
			   0,
			   hInstance,
			   NULL);      /*MVP : was (LPVOID)phTTS ,This is changed to avoid
						   static declaration of this handle in TextToSpeechWndProc
						   Now this handle will be available through call to
						   GetWindowLong */
#else
  hWnd = CreateWindow( wndclass,
			   "TextToSpeech Output, v1.0",
			   WS_CLIPCHILDREN | WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU,
			   CW_USEDEFAULT,
			   CW_USEDEFAULT,
			   CW_USEDEFAULT,
			   CW_USEDEFAULT,
			   0,
			   0,
			   hInstance,
			   NULL);      /*MVP : was (LPVOID)phTTS ,This is changed to avoid
						   static declaration of this handle in TextToSpeechWndProc
						   Now this handle will be available through call to
						   GetWindowLong */
#endif

  if( ! hWnd )
	return( NULL );
 
  /*MVP : Store phTTS in Window extra memory for later use in Wndproc */
  SetWindowLong(hWnd,GWL_USERDATA,(LONG)phTTS);

  ShowWindow( hWnd, SW_HIDE );

  return( hWnd );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Window Procedure: TextToSpeechWndProc                             */
/*  Author: Bill Hallahan                                             */
/*  Date: July 6, 1993                                                */
/*                                                                    */
/*  TextToSpeech Output Window Procedure.                             */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LRESULT CALLBACK TextToSpeechWndProc( HWND hWnd,
						 UINT message,
						 WPARAM wParam,
						 LPARAM lParam )
{
  
  LPTTS_HANDLE_T phTTS;                    /* MVP : Avoided static behaviour through
									using GetWindowLong to retrieve the handle 
									from window extra memory,which was set
									when window was created */

  phTTS = (LPTTS_HANDLE_T)GetWindowLong(hWnd,GWL_USERDATA);

  switch( message )
  {
  /********************************************************************/
  /*  TextToSpeech intialization occurs here.                         */
  /********************************************************************/

  case WM_CREATE:

	/******************************************************************/
	/*  Initialize pointer to the TextToSpeech parameter structure.   */
	/******************************************************************/
	/*MVP : Commented out, Value is retreived Through GetWindowLong */
	/*phTTS = (LPTTS_HANDLE_T)(((LPCREATESTRUCT)lParam)->lpCreateParams);*/

	return( FALSE );

  /********************************************************************/
  /*  Process the TextToSpeech message.                               */
  /********************************************************************/

  case ID_TTS_Queue_Text:

	Process_TTS_Message( phTTS, lParam );

	return( TRUE );

  case ID_TTS_Destroy:

	DestroyWindow( hWnd );

	break;

  /********************************************************************/
  /*  The WM_DESTROY message is used to destroy a window.             */
  /********************************************************************/

  case WM_DESTROY:

	PostQuitMessage(0);

	break;

  default:
	break;
  }
  return( DefWindowProc( hWnd, message, wParam, lParam ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: Process_TTS_Message                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    Process the TextToSpeech message.                               */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*    lParam   A value of type LPARAM which contains a pointer to a   */
/*             structure of type TEXT_MSG_T. This structure has been  */
/*             allocated by the TextToSpeechSpeak() function.         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void Process_TTS_Message( LPTTS_HANDLE_T phTTS,
				 LPARAM lParam )
{
  UINT uiLength;
  unsigned char * pText;
  TEXT_MSG_T * pTextMsg;

  pTextMsg = (TEXT_MSG_T *)lParam;
  //OutputDebugString("	Process_TTS_Message().\n");
#ifdef _DEBUG //tek 12aug97
  {
	  char szTemp[256]="";
	  sprintf(szTemp,"Process_TTS_Message #%u at %lu\n",
				pTextMsg->uiMsgNumber,
				timeGetTime());
	  OutputDebugString(szTemp);
  }
#endif //_DEBUG

  /********************************************************************/
  /*  If the posted Text-To-Speech message number is less than the    */
  /*  message number of the last flush message, then throw the        */
  /*  Text-To-Speech message away.                                    */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsFlushMsgNumber );

  if ( pTextMsg->uiMsgNumber > phTTS->uiFlushMsgNumber )
  {
	LeaveCriticalSection( phTTS->pcsFlushMsgNumber );
#ifdef _DEBUG
	OutputDebugString("  .. TTSMessage processing.\n");
#endif //_DEBUG
	uiLength = pTextMsg->uiLength;
#ifdef TYPING_MODE // tek 17jun97
	if (uiLength>0)
		phTTS->bInTypingMode = FALSE;
#endif //TYPING_MODE
	pText = pTextMsg->pText;

	/******************************************************************/
	/*  Queue the text unless a TextToSpeechReset() forces an abort   */
	/*  by setting the KS.halting flag.                               */
	/******************************************************************/
	/* we have to check for halting inside the loop, else we will hang */
	/* if we have a lot of text to speak. We should probably also block*/
	/* here, rather than in write_pipe(), on the pipe full condition, */
	/* but that's probably chrome.. it would let us respond to a flush*/
	/* a little faster. (tek 08jan97) */

	while (( uiLength > MAX_TEXT_WRITE_LENGTH ) 
	      && ( ! (phTTS->pKernelShareData->halting))   // tek 08jan97
	//      && ( ! (phTTS->pKernelShareData->halting))
			)
	{
	  //OutputDebugString(" .. text to write_pipe \n");
	  write_pipe( phTTS->pKernelShareData->cmd_pipe, pText, MAX_TEXT_WRITE_LENGTH );
	  uiLength -= MAX_TEXT_WRITE_LENGTH;
	  pText += MAX_TEXT_WRITE_LENGTH;
	}

	if (( uiLength > 0 ) 
		&& (uiLength <= MAX_TEXT_WRITE_LENGTH)	/* tek 08jan97 */
	//      && ( ! phTTS->pKernelShareData->halting )
	    )
	{
	  //OutputDebugString(" .. .. Text to write_pipe \n");
	  write_pipe( phTTS->pKernelShareData->cmd_pipe, pText, uiLength );
	}
  }
  else
  {
#ifdef _DEBUG
	OutputDebugString(" .. tossing textmsg due to flush.\n");
#endif //_DEBUG
	LeaveCriticalSection( phTTS->pcsFlushMsgNumber );
  }

  /********************************************************************/
  /*  Subtract the characters queued from the queued character count. */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsQueuedCharacterCount );
  phTTS->uiQueuedCharacterCount -= pTextMsg->uiLength;
  LeaveCriticalSection( phTTS->pcsQueuedCharacterCount );

  /********************************************************************/
  /*  Update the last queued message parameter for the                */
  /*  TextToSpeechSync() function.                                    */
  /********************************************************************/

  EnterCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );
  phTTS->uiLastQueuedTextMsgNumber = pTextMsg->uiMsgNumber;
  LeaveCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );

  /********************************************************************/
  /*  Free the text buffer and the text message structure.            */
  /*  These were allocated in the TextToSpeechSpeak() function which  */
  /*  runs in the applications thread !                               */
  /********************************************************************/

  free( pTextMsg->pText );
  free( pTextMsg );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechErrorHandler                                */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function sends a message to the window procedure      */
/*    corresponding to the handle passed to the                       */
/*    TextToSpeechStartup() function.                                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    hWnd           A handle to the parent window.                   */
/*                                                                    */
/*    uiErrorCode    An application defined error code.               */
/*                                                                    */
/*    mmStatus       An error code of type MMRESULT.                  */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void TextToSpeechErrorHandler( LPTTS_HANDLE_T phTTS,
				   UINT uiErrorCode,
				   MMRESULT mmStatus )
{
  if ( phTTS->bEnableErrorMessage )
  {
	phTTS->bEnableErrorMessage = FALSE;
	/*
	SendMessage( phTTS->hWnd,
		 phTTS->uiID_Error_Message,
		 (WPARAM)uiErrorCode,
		 (LPARAM)mmStatus );
	*/
	//MVP: Replaced above SendMessage with Report_TTS_status :New Audio code:
#ifdef _DEBUG
	OutputDebugString("returning error message. \n");
#endif //_DEBUG
	Report_TTS_Status(phTTS,phTTS->uiID_Error_Message,(WPARAM)uiErrorCode,(LPARAM)mmStatus);

  }
  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechGetHandle                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: July 8, 1993                                                */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This function gets the handle to the TextToSpeech system   */
/*    which created during the call to the TextToSpeechStarup()       */
/*    function.                                                       */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a a pointer to the Text-To-Speech handle. */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/* This fucntion will become obsolete for MI : MVP  */
#if 0
LPTTS_HANDLE_T TextToSpeechGetHandle()
{
  /*return( phTTSglobal );*/
}
#endif //0
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WriteAudioToFile                                        */
/*  Author: Bill Hallahan                                             */
/*  Date: July 21, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function writes audio samples to the wave output file.     */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS    A pointer to a Text-To-Speech handle.                  */
/*                                                                    */
/*    pBuffer       A pointer (of type LPSAMPLE_T) to a buffer which  */
/*                  contains samples (of type SAMPLE_T).              */
/*                                                                    */
/*                                                                    */
/*    uiLength      The number of audio sample in the buffer.         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

MMRESULT WriteAudioToFile( LPTTS_HANDLE_T phTTS,
			   LPSAMPLE_T pBuffer,
			   UINT uiLength )
{
  UINT i;
  unsigned char * pByteDest;
  LPSAMPLE_T pSource;
  size_t Size;

  /********************************************************************/
  /*  Convert the 16 bit samples to the desired output format.        */
  /********************************************************************/

  switch( phTTS->dwFormat )
  {
  case WAVE_FORMAT_1M16:

	Size = sizeof( short );

	break;

  case WAVE_FORMAT_1M08:

	pSource = pBuffer;
	pByteDest = (unsigned char *)pBuffer;

	for ( i = 0; i < uiLength; i++ )
	  *pByteDest++ = ((unsigned char)((*pSource++) >> 8)) ^ 0x80;

	Size = sizeof( unsigned char );

	break;

  case WAVE_FORMAT_08M08:

	pSource = pBuffer;
	pByteDest = (unsigned char *)pBuffer;

	for ( i = 0; i < uiLength; i++ )
	  *pByteDest++ = LinearToMuLaw( *pSource++ );

	Size = sizeof( unsigned char );

	break;

  default:

	return( MMSYSERR_INVALHANDLE );
  }

  /********************************************************************/
  /*  Write the audio samples to the output file.                     */
  /********************************************************************/

  if ( uiLength != fwrite( pBuffer,
			   Size,
			   (size_t)uiLength,
			   phTTS->pWaveFile ))
	return( MMSYSERR_ERROR );

  phTTS->dwFileSampleCount += uiLength;

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: LinearToMuLaw.c                                         */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This routine converts from linear to ulaw.                      */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    wSample       A signed 16 bit linear sample                     */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type unsigned char which is    */
/*    an 8 bit ulaw sample.                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

/**********************************************************************/
/*  Turn on the trap as per the MIL-STD                               */
/*  Turn off the trap for telephone applications.                     */
/**********************************************************************/

/* #define ZEROTRAP */

/**********************************************************************/
/*  Define the add-in bias for 16 bit samples                         */
/**********************************************************************/

#define  MULAW_BIAS         0x84
#define  MULAW_CLIP_LEVEL  32635

static unsigned char LinearToMuLaw( short wSample )
{
  static short wExponentLut[256] = { 0,0,1,1,2,2,2,2,3,3,3,3,3,3,3,3,
					 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
					 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
					 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
					 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7 };
  short wSign;
  short wExponent;
  short wMantissa;
  unsigned char cMuLawByte;

  /********************************************************************/
  /*  Get the sample into sign-magnitude.                             */
  /*  First save the sign.                                            */
  /********************************************************************/

  wSign = ( wSample >> 8 ) & 0x80;

  /********************************************************************/
  /*  Get magnitude.                                                  */
  /********************************************************************/

  if ( wSign != 0 )
	wSample = - wSample;

  /********************************************************************/
  /*  Clip the magnitude.                                             */
  /********************************************************************/

  if ( wSample > MULAW_CLIP_LEVEL )
	wSample = MULAW_CLIP_LEVEL;

  /********************************************************************/
  /*  Convert from 16 bit linear to mu-law.                           */
  /********************************************************************/

  wSample = wSample + MULAW_BIAS;
  wExponent = wExponentLut[ ( wSample >> 7 ) & 0xFF ];
  wMantissa = ( wSample >> ( wExponent + 3 ) ) & 0x0F;
  cMuLawByte = ~ ( wSign | ( wExponent << 4 ) | wMantissa );

  /********************************************************************/
  /*  Optional CCITT trap                                             */
  /********************************************************************/

#ifdef ZEROTRAP
  if ( cMuLawByte == 0 )
	cMuLawByte = 0x02;
#endif //ZEROTRAP

  return( cMuLawByte );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaitForLtsFlush                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: July 24, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function blocks until the inter-thread pipe queues from    */
/*    the lts pipe to the sync pipe are flushed. The TEXT and CMD     */
/*    pipes are ignored. This is used to flush pipes from the CMD     */
/*    thread. If a timeout value is exceeded then this function will  */
/*    return an error status value.                                   */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS             A pointer to a Text-To-Speech handle.         */
/*                                                                    */
/*    dwWaitTimeInMsec  A DWORD which contains the amount of time to  */
/*                      wait for all pipes to empty before returning  */
/*                      an error.                                     */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
// tek 03sep96 change timeouts to be shorter..

#ifdef TYPING_MODE
#define  WAIT_PIPE_SLEEP_TIME    5
#else
#define  WAIT_PIPE_SLEEP_TIME    50
#endif
#define  WAIT_PIPE_ABORT_COUNT   300

MMRESULT WaitForLtsFlush( LPTTS_HANDLE_T phTTS,
			  DWORD dwWaitTimeInMsec )
{
  BOOL bPipesNotEmpty;
  UINT uiSyncCount;
  UINT uiVtmCount;
  UINT uiPhCount;
  UINT uiLtsCount;
  UINT	uiSleepTime;
  DWORD dwTotalTimeInMsec;
  /* Added a varaible to get current instance Kernel_Share_Data 
   * and initialize from phTTS structure
   */
  PKSD_T pKsd_t = NULL;

  pKsd_t = phTTS->pKernelShareData;
#ifdef TYPING_MODE
	  if (phTTS->bInTypingMode)
			uiSleepTime=1; // just reschedule
	  else
#endif //TYPING_MODE
  uiSleepTime=WAIT_PIPE_SLEEP_TIME;
  /********************************************************************/
  /*  Wait for all the pipes to empty.                                */
  /*  If the pipes are not empty then sleep for 100 msec. and check   */
  /*  them again.                                                     */
  /********************************************************************/

  dwTotalTimeInMsec = 0;
  bPipesNotEmpty = TRUE;

  while ( bPipesNotEmpty )
  {
	bPipesNotEmpty = FALSE;

	uiSyncCount = pipe_count( pKsd_t->sync_pipe );
	uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
	uiPhCount = pipe_count( pKsd_t->ph_pipe );
	uiLtsCount = pipe_count( pKsd_t->lts_pipe );

	if  (( uiSyncCount != 0 )
	 || ( uiVtmCount != 0 )
	 || ( uiPhCount != 0 )
	 || ( uiLtsCount != 0 ))
	  bPipesNotEmpty = TRUE;

	/******************************************************************/
	/*  If bPipesNotEmpty is still FALSE here then the pipes are      */
	/*  probably empty. It is possible that there is still data in    */
	/*  the pipes, but that it moved out of a pipe we are about to    */
	/*  check into a pipe we have we just checked. We now check the   */
	/*  pipes in the reverse order.                                   */
	/******************************************************************/

	if ( ! bPipesNotEmpty )
	{
/*
	  kernel_disable(pKsd_t);
*/
	  uiLtsCount = pipe_count( pKsd_t->lts_pipe );
	  uiPhCount = pipe_count( pKsd_t->ph_pipe );
	  uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
	  uiSyncCount = pipe_count( pKsd_t->sync_pipe );
/*
	  kernel_enable( pKsd_t, uiDummy );
*/
	  if  (( uiSyncCount != 0 )
	|| ( uiVtmCount != 0 )
	|| ( uiPhCount != 0 )
	|| ( uiLtsCount != 0 ))
	bPipesNotEmpty = TRUE;
	  else
	bPipesNotEmpty = FALSE;
	}

	/******************************************************************/
	/*  Go to sleep for WAIT_PIPE_SLEEP_TIME msec.                    */
	/******************************************************************/

	if ( bPipesNotEmpty )
	{
	  Sleep( uiSleepTime );
 	  dwTotalTimeInMsec += uiSleepTime;

	  if ( dwTotalTimeInMsec > dwWaitTimeInMsec )
	  {
	return( MMSYSERR_ERROR );
	  }
	}
  }
  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: FixMemoryLockup                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: April 7, 1995                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function tests to see if the TTS pipes are near full and   */
/*    the VTM thread is trying to report a buffer back to the         */
/*    application using SendMessage(). If this lockup is detected     */
/*    then the VTM pipe is emptied here.                              */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS             A pointer to a Text-To-Speech handle.         */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  MEMORY_LOCKUP_SLEEP_TIME    20
#define  MEMORY_LOCKUP_COUNT          2

static void FixMemoryLockup( LPTTS_HANDLE_T phTTS )
{
  BOOL bPipesNotChanging;
  UINT uiLockedUpCount;
  UINT uiVtmCount;
  UINT uiPhCount;
  UINT uiLtsCount;
  UINT uiCmdCount;
  UINT uiOldVtmCount;
  UINT uiOldPhCount;
  UINT uiOldLtsCount;
  UINT uiOldCmdCount;
#ifdef _DEBUG
  char szTemp[256]="";
  ULONG ulStartTime, ulEndTime;
#endif //_DEBUG

  /* Added a varaible to get current instance Kernel_Share_Data 
   * and initialize from phTTS structure
   */
  PKSD_T pKsd_t = NULL;

#ifdef _DEBUG
  ulStartTime=timeGetTime();
  sprintf(szTemp,"FixMemoryLockup() at %ld",ulStartTime);
  OutputDebugString(szTemp);
#endif //_DEBUG

  pKsd_t = phTTS->pKernelShareData;

  /********************************************************************/
  /*  Wait for all the pipes to change.                               */
  /*  If the pipes are not changing then go to sleep                  */
  /********************************************************************/

  SetEvent( phTTS->hSyncEvent );

  uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
  uiPhCount = pipe_count( pKsd_t->ph_pipe );
  uiLtsCount = pipe_count( pKsd_t->lts_pipe );
  uiCmdCount = pipe_count( pKsd_t->cmd_pipe );

  uiOldVtmCount = uiVtmCount;
  uiOldPhCount = uiPhCount;
  uiOldLtsCount = uiLtsCount;
  uiOldCmdCount = uiCmdCount;

  uiLockedUpCount = 0;
  bPipesNotChanging = TRUE;

  if (
		    (uiVtmCount) || (uiPhCount) 
		 || (uiLtsCount) || (uiCmdCount) 
		)
  { 
	while ( bPipesNotChanging )
    {
	Sleep( MEMORY_LOCKUP_SLEEP_TIME );

	uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
	uiPhCount = pipe_count( pKsd_t->ph_pipe );
	uiLtsCount = pipe_count( pKsd_t->lts_pipe );
	uiCmdCount = pipe_count( pKsd_t->cmd_pipe );

	/******************************************************************/
	/*  Are any of the the pipes changing ?                           */
	/******************************************************************/

	if (
		(
		    (uiVtmCount) || (uiPhCount) 
		 || (uiLtsCount) || (uiCmdCount) 
		)
	  &&
		(   ( uiVtmCount == uiOldVtmCount )
	     && ( uiPhCount == uiOldPhCount )
	     && ( uiLtsCount == uiOldLtsCount )
	     && ( uiCmdCount == uiOldCmdCount )
		 )
	   )
	{
	  bPipesNotChanging = TRUE;
	  // tek 29aug96make sure we didn't somehow end up with no place
	  // to go..
	  if((pKsd_t->buffer_pipe != NULL) && (pipe_count( pKsd_t->buffer_pipe) < 2) )
		  TextToSpeechAddBuffer(phTTS, NULL);
	  uiLockedUpCount++;

	  if ( uiLockedUpCount > MEMORY_LOCKUP_COUNT )
	  {
	/**************************************************************/
	/*  Test to see if the vtm thread is blocked by a call to     */
	/*  SendMessage().                                            */
	/**************************************************************/

	ResetEvent( phTTS->hNotEmptyingVtmPipeEvent );

	if ( phTTS->bSendingBuffer )
	{
	  EmptyVtmPipe(phTTS->pKernelShareData);
	}

	SetEvent( phTTS->hNotEmptyingVtmPipeEvent );
	  }

	  uiOldVtmCount = uiVtmCount;
	  uiOldPhCount = uiPhCount;
	  uiOldLtsCount = uiLtsCount;
	  uiOldCmdCount = uiCmdCount;
	}
	else
	{
	  bPipesNotChanging = FALSE;
	}
  }
 } // if pipes not empty
#ifdef _DEBUG
  ulEndTime=timeGetTime();
  sprintf(szTemp,"FixMemoryLockup() exit %ld ms",ulEndTime-ulStartTime);
  OutputDebugString(szTemp);
#endif //_DEBUG

 return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: WaitForEmptyPipes                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: July 24, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function blocks until the inter-thread pipe queues in the  */
/*    Text-To-Speech system are empty. If a timeout value is exceeded */
/*    then this function will return an error status value.           */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    phTTS             A pointer to a Text-To-Speech handle.         */
/*                                                                    */
/*    dwWaitTimeInMsec  A DWORD which contains the amount of time to  */
/*                      wait for all pipes to empty before returning  */
/*                      an error.                                     */
/*                                                                    */
/*    bReset            A boolean which will set the hSyncEvent if    */
/*                      set to TRUE. This would be done by function   */
/*                      TextToSpeechReset() but not by function       */
/*                      TextToSpeechSync().                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of type MMRESULT.                 */
/*    The value will be zero if the function is successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
 
//tek 03sep96 change timeouts

static MMRESULT WaitForEmptyPipes( LPTTS_HANDLE_T phTTS,
				   DWORD dwWaitTimeInMsec,
				   BOOL bReset )
{
  BOOL bPipesNotEmpty;
  UINT uiLockedUpCount;
  UINT uiSyncCount;
  UINT uiVtmCount;
  UINT uiPhCount;
  UINT uiLtsCount;
  UINT uiCmdCount;
  UINT uiOldSyncCount;
  UINT uiOldVtmCount;
  UINT uiOldPhCount;
  UINT uiOldLtsCount;
  UINT uiOldCmdCount;
  UINT	uiSleepTime;
  DWORD dwTotalTimeInMsec;
#ifdef _DEBUG
	  char szTemp[256]="";
	  ULONG ulStartTime, ulEndTime;
#endif //_DEBUG
  /* Added a varaible to get current instance Kernel_Share_Data 
   * and initialize from phTTS structure
   */
  PKSD_T pKsd_t = NULL;
#ifdef _DEBUG
	  ulStartTime=timeGetTime();
	  sprintf(szTemp,"WaitForEmptyPipes at %ld\n",ulStartTime);
	  OutputDebugString(szTemp);
#endif //_DEBUG

  pKsd_t = phTTS->pKernelShareData;
#ifdef TYPING_MODE
	  if (phTTS->bInTypingMode)
			uiSleepTime=1;	// just reschedule
							// Well, actually, we have to sleep
							// a little.. otherwise PH and VTM won't get
							// to run..
	  else
#endif //TYPING_MODE
  uiSleepTime=WAIT_PIPE_SLEEP_TIME;
  /********************************************************************/
  /*  Wait for all the pipes to empty.                                */
  /*  If the pipes are not empty then sleep for 100 msec. and check   */
  /*  them again.                                                     */
  /********************************************************************/

  dwTotalTimeInMsec = 0;

  uiOldSyncCount = 0xFFFFFFFF;
  uiOldVtmCount = 0xFFFFFFFF;
  uiOldPhCount = 0xFFFFFFFF;
  uiOldLtsCount = 0xFFFFFFFF;
  uiOldCmdCount = 0xFFFFFFFF;
  uiLockedUpCount = 0;
  bPipesNotEmpty = TRUE;

  while ( bPipesNotEmpty )
  {
	bPipesNotEmpty = FALSE;

	if ( bReset )
	  SetEvent( phTTS->hSyncEvent );

	uiSyncCount = pipe_count( pKsd_t->sync_pipe );
	uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
	uiPhCount = pipe_count( pKsd_t->ph_pipe );
	uiLtsCount = pipe_count( pKsd_t->lts_pipe );
	uiCmdCount = pipe_count( pKsd_t->cmd_pipe );

	if  (( uiSyncCount != 0 )
	 || ( uiVtmCount != 0 )
	 || ( uiPhCount != 0 )
	 || ( uiLtsCount != 0 )
	 || ( uiCmdCount != 0 ))
	  bPipesNotEmpty = TRUE;

	/******************************************************************/
	/*  If bPipesNotEmpty is still FALSE here then the pipes are      */
	/*  probably empty. It is possible that there is still data in    */
	/*  the pipes, but that it moved out of a pipe we are about to    */
	/*  check into a pipe we have we just checked. We now check the   */
	/*  pipes in the reverse order.                                   */
	/******************************************************************/

	if ( ! bPipesNotEmpty )
	{
/*
	  kernel_disable(pKsd_t);
*/
	  uiCmdCount = pipe_count( pKsd_t->cmd_pipe );
	  uiLtsCount = pipe_count( pKsd_t->lts_pipe );
	  uiPhCount = pipe_count( pKsd_t->ph_pipe );
	  uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
	  uiSyncCount = pipe_count( pKsd_t->sync_pipe );
/*
	  kernel_enable( pKsd_t, uiDummy );
*/
	  if  (( uiSyncCount != 0 )
	|| ( uiVtmCount != 0 )
	|| ( uiPhCount != 0 )
	|| ( uiLtsCount != 0 )
	|| ( uiCmdCount != 0 ))
	bPipesNotEmpty = TRUE;
	  else
	bPipesNotEmpty = FALSE;
	}

	/******************************************************************/
	/*  Go to sleep for WAIT_PIPE_SLEEP_TIME msec.                    */
	/******************************************************************/

	if ( bPipesNotEmpty )
	{
	  // tek 29aug96make sure we didn't somehow end up with no place
	  // to go.
	  if((pKsd_t->buffer_pipe  != NULL) && (pipe_count( pKsd_t->buffer_pipe) < 1) )
		  TextToSpeechAddBuffer(phTTS, NULL);

#ifdef _DEBUG
	  sprintf(szTemp,"WaitForEmptyPipes: c:%d l:%d p:%d v:%d s:%d at %ld\n",
		  uiCmdCount,
		  uiLtsCount,
		  uiPhCount,
		  uiVtmCount,
		  uiSyncCount,
		  timeGetTime());
	  OutputDebugString(szTemp);
#endif //_DEBUG

	  Sleep( uiSleepTime );

	  dwTotalTimeInMsec += (uiSleepTime);


	  if ( dwTotalTimeInMsec > dwWaitTimeInMsec )
	  {
#ifdef _DEBUG
		  OutputDebugString("  ..WFPE() timed out!\n");
#endif //_DEBUG
		  return( MMSYSERR_ERROR );
	  }
	}

	/******************************************************************/
	/*  If this is a reset then check to see if nothing is happening. */
	/*  If any of the threads block then the pipe state may not       */
	/*  change.                                                       */
	/******************************************************************/

	if  (( bReset )
	  && ( uiSyncCount && (uiSyncCount == uiOldSyncCount) )
	  && ( uiVtmCount && (uiVtmCount == uiOldVtmCount) )
	  && ( uiPhCount && (uiPhCount == uiOldPhCount) )
	  && ( uiLtsCount && (uiLtsCount == uiOldLtsCount) )
	  && ( uiCmdCount && (uiCmdCount == uiOldCmdCount) ))
	{
	  /****************************************************************/
	  /*  Perform an audio reset to immediately stop audio from       */
	  /*  playing and to make sure the VTM thread is not blocked.     */
	  /****************************************************************/

	  if ( phTTS->dwOutputState == STATE_OUTPUT_AUDIO )
	  {
	PA_Reset( phTTS->pAudioHandle );
	  }

	  uiLockedUpCount++;

	  /****************************************************************/
	  /*  Fix hang when using speech-to-memory. WIH 4/6/95            */
	  /****************************************************************/

	  if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
	  {
	FixMemoryLockup( phTTS );
	  }
	}
	else
	{
	  uiLockedUpCount = 0;
	}

	uiOldSyncCount = uiSyncCount;
	uiOldVtmCount = uiVtmCount;
	uiOldPhCount = uiPhCount;
	uiOldLtsCount = uiLtsCount;
	uiOldCmdCount = uiCmdCount;

	if ( uiLockedUpCount >= WAIT_PIPE_ABORT_COUNT )
	{
#ifdef _DEBUG
		OutputDebugString("  ..WFPE() lockup failure?\n");
#endif //_DEBUG
	  return( MMSYSERR_ERROR );
	}
  }
#ifdef _DEBUG
	  ulEndTime=timeGetTime();
	  sprintf(szTemp,"WaitForEmptyPipes exit at %ld (%ld) ms\n",
		  ulEndTime, ulEndTime - ulStartTime);
	  OutputDebugString(szTemp);
#endif //_DEBUG

  return( MMSYSERR_NOERROR );
}

/**********************************************************************/
/**********************************************************************/
/*  "Play Audio" Callback Routine.                                    */
/**********************************************************************/
/**********************************************************************/
/* tek 26jul96 : params to Report_TTS_Status() fixed */
unsigned int PlayAudioCallbackRoutine( HPLAY_AUDIO_T pPlayAudio,
									   ATYPE_T aInstance,
									   ATYPE_T aMessage,
									   ATYPE_T aParam )
{
  // get the dectalk error mesage ID.. 
  UINT uiID_Error_Msg;

#ifdef _DEBUG
  OutputDebugString("PlayAudioCallbackRoutine().\n");
#endif //_DEBUG
  uiID_Error_Msg = RegisterWindowMessage("DECtalkErrorMessage");

    switch ( aMessage )
  {

  case PA_PLAY_START:

	Report_TTS_Status((LPTTS_HANDLE_T)aInstance,
					   uiID_Error_Msg,
					   TTS_AUDIO_PLAY_START,
					   MMSYSERR_NOERROR );
	break;

  case PA_PLAY_STOP:

	Report_TTS_Status((LPTTS_HANDLE_T)aInstance,
					   uiID_Error_Msg,
					   TTS_AUDIO_PLAY_STOP,
					   MMSYSERR_NOERROR );

	break;

  case PA_DEVICE_OPEN_FAILURE:

	if (((LPTTS_HANDLE_T)aInstance)->dwDeviceOptions & REPORT_OPEN_ERROR )
	{
	  Report_TTS_Status((LPTTS_HANDLE_T)aInstance,
						 uiID_Error_Msg,
						 ERROR_OPENING_WAVE_OUTPUT_DEVICE,
						 aParam );
	}
	break;

  case PA_WRITE_ERROR:

	Report_TTS_Status((LPTTS_HANDLE_T)aInstance,
					   uiID_Error_Msg,
					   ERROR_IN_AUDIO_WRITE,
					   aParam );
	break;

  case PA_GET_CAPS_ERROR:

	Report_TTS_Status((LPTTS_HANDLE_T)aInstance,
					   uiID_Error_Msg,
					   ERROR_GETTING_DEVICE_CAPABILITIES,
					   aParam );
	break;

  default:

	break;
  }

  return FALSE;
}


/**********************************************************************/
/**********************************************************************/
/*  Function: Report_TTS_Status                                       */
/*  Author: Bill Hallahan                                             */
/*  Date: December 26, 1995                                           */
/**********************************************************************/
/**********************************************************************/

void Report_TTS_Status( LPTTS_HANDLE_T ttsHandle,
						UINT uiMsg,
						long lParam1,
						long lParam2 )
{
	if (lParam1 == TTS_AUDIO_PLAY_START)	ttsHandle->IsSpeaking = TRUE;	// KSB - Used for start of speech
	if (lParam1 == TTS_AUDIO_PLAY_STOP)	ttsHandle->IsSpeaking = FALSE;	// KSB - Used for end of speech

  if (ttsHandle->DtCallbackRoutine != NULL)
  {
#ifdef _DEBUG
	  char szTemp[256]="";
	  sprintf(szTemp,"RTTSStatus(%08lx %08lx)\n",
		  lParam1, lParam2);
	  OutputDebugString(szTemp);
#endif //DEBUG

	OP_LockMutex( ttsHandle->hmxCallback );
	(*ttsHandle->DtCallbackRoutine)( lParam1,
					 lParam2,
					 ttsHandle->dwTTSInstanceParameter,
					 uiMsg);
	
	OP_UnlockMutex( ttsHandle->hmxCallback );
  }

  return;
}

void DrainPipes(LPTTS_HANDLE_T phTTS)
{
 // empty the CMD, LTS and PH pipes..
	SWFlushPipe(phTTS->pKernelShareData->cmd_pipe);
	SWFlushPipe(phTTS->pKernelShareData->lts_pipe);
	SWFlushPipe(phTTS->pKernelShareData->ph_pipe);

}

ULONG TextToSpeechVersion(LPSTR* VersionStr)
{
	//removed unsigned form next line 11/12/96 cjl
	static char   DECtalk_Version_String[50];

	sprintf(DECtalk_Version_String,"%s %s",DTALK_STR_VERSION, CUSTR_STR_VERSION);
	if (VersionStr != NULL) *VersionStr = DECtalk_Version_String;
        // Add in dbg_version. NCS KSB
	return (DTALK_DBG_VERSION << 31) + (DTALK_MAJ_VERSION << 24) + (DTALK_MIN_VERSION << 16) + (DLL_MAJ_VERSION << 8) + DLL_MIN_VERSION;
}

void TextToSpeechControlPanel(LPTTS_HANDLE_T ttsHandle)
{
#ifdef DTALK50
	if (ttsHandle == NULL)	return;
	CPShow(ttsHandle->CPanelThread);
#else
	/* This function not supported in 4.4 */
#endif
	return;
}

ULONG TextToSpeechGetLastError(LPTTS_HANDLE_T phTTS) {
	return phTTS->LastError;
}

void TextToSpeechTyping(LPTTS_HANDLE_T phTTS, unsigned char key) {  /* BATS#657 JL */
	unsigned short str[20];
#ifdef _DEBUG
  char szTemp[256]="";
  ULONG ulStartTime,ulEndTime;
#endif //_DEBUG


#ifdef TYPING_MODE
#define TYPE_MAXPHONES (256)
    HANDLE hThisThread=NULL;
	THREAD_PRIORITY_T tptPriority=0;
	hThisThread = GetCurrentThread();
	if (hThisThread)
	{
#ifndef UNDER_CE
		tptPriority = OP_GetThreadPriority(hThisThread);
		OP_SetThreadPriority(hThisThread,OP_PRIORITY_HIGHEST);
#endif
	}
#ifdef _DEBUG
  ulStartTime=timeGetTime();
  sprintf(szTemp, "TTSTyping(%c) at %ld.\n", key, ulStartTime);
  OutputDebugString(szTemp);
#endif //_DEBUG
	TextToSpeechReset(phTTS,FALSE);
	/**/
	// this is the type_out code from cm_util_type_out, modified to
	// do what we need here.
	{
		unsigned char _far *tp;
		DT_PIPE_T phone[TYPE_MAXPHONES];
		unsigned int i=0;
		PKSD_T pKsd_t = phTTS->pKernelShareData;

		for(tp = (unsigned char _far *)pKsd_t->typing_table[key];*tp;tp++)
		{
			phone[i++] = pKsd_t->reverse_ascky[(*tp) & 0xff];
		}
		//phone[i++] = (PFUSA<<PSFONT) | COMMA;		
		phone[i++] = SYNC;
		write_pipe(pKsd_t->ph_pipe,phone,i);
	}
// end of type_out code


#ifdef _DEBUG
  ulEndTime=timeGetTime();
  sprintf(szTemp, "TTSTyping() exit %ld (%ld)\n", 
	  ulEndTime, ulEndTime-ulStartTime);
  OutputDebugString(szTemp);
#endif //_DEBUG	
#ifndef UNDER_CE
  if (hThisThread)
		OP_SetThreadPriority(hThisThread,tptPriority);
#endif
#endif TYPING_MODE
	return;
}

ULONG TextToSpeechReserved1(UCHAR *voices, U8 voice, BOOL bEightk, BOOL bReadData) 
{
	short *sdef;

	if (bEightk == FALSE) {	// High-quality

		switch (voice) {
			case 0:	sdef = paul;	break;
			case 1:	sdef = betty;	break;
			case 2:	sdef = harry;	break;
			case 3:	sdef = frank;	break;
			case 4:	sdef = dennis;	break;
			case 5:	sdef = kit;		break;
			case 6:	sdef = ursula;	break;
			case 7:	sdef = rita;	break;
			case 8:	sdef = wendy;	break;
			default:	return 0;
		}
	} else {
		switch (voice) {
			case 0:	sdef = paul_8;		break;
			case 1:	sdef = betty_8;		break;
			case 2:	sdef = harry_8;		break;
			case 3:	sdef = frank_8;		break;
			case 4:	sdef = dennis_8;	break;
			case 5:	sdef = kit_8;		break;
			case 6:	sdef = ursula_8;	break;
			case 7:	sdef = rita_8;		break;
			case 8:	sdef = wendy_8;		break;
			default:	return 0;
		}
	}

	if (bReadData) {
		voices[0] = sdef[SP_GV];
		voices[1] = sdef[SP_GN];
		voices[2] = sdef[SP_G1];
		voices[3] = sdef[SP_G2];
		voices[4] = sdef[SP_G3];
		voices[5] = sdef[SP_G4];
		voices[6] = sdef[SP_LO];
	} else {
		sdef[SP_GV] = voices[0];
		sdef[SP_GN] = voices[1];
		sdef[SP_G1] = voices[2];
		sdef[SP_G2] = voices[3];
		sdef[SP_G3] = voices[4];
		sdef[SP_G4] = voices[5];
		sdef[SP_LO] = voices[6];
	}
	return 7;
}

ULONG TextToSpeechReserved2(LPTTS_HANDLE_T phTTS, ULONG *gains) {
#ifdef _DEBUG
	PVTM_T pVtm_t = phTTS->pVTMThreadData;
	int i;

	for (i = 0; i < 7; i++)	gains[i] = pVtm_t->TunerData[i];
	return 7;
#else
	return 0;
#endif
}

ULONG TextToSpeechVersionEx(LPVERSION_INFO *ver) {
	static char DECtalk_Language_String[50];
	static char DECtalk_Version_String[50];

	sprintf(DECtalk_Version_String,"%s %s",DTALK_STR_VERSION, CUSTR_STR_VERSION);
	sprintf(DECtalk_Language_String, "ER: Error");
#ifdef ENGLISH_US
	sprintf(DECtalk_Language_String, "US: American English");
#endif
#ifdef SPANISH
#ifdef LATIN_AMERICAN
	sprintf(DECtalk_Language_String, "LA: Latin American Spanish");
#else
	sprintf(DECtalk_Language_String, "SP: Castillian Spanish");
#endif
#endif
#ifdef GERMAN
	sprintf(DECtalk_Language_String, "GR: German");
#endif
#ifdef FRENCH
	sprintf(DECtalk_Language_String, "FR: French");
#endif
#ifdef SWAHILI
	sprintf(DECtalk_Language_String, "SW: Swahili");
#endif
#ifdef ENGLISH_UK
	sprintf(DECtalk_Language_String, "UK: British English");
#endif

	if ((*ver = malloc(sizeof(VERSION_INFO))) == NULL)	return 0;
	(*ver)->StructSize = sizeof(VERSION_INFO);
	(*ver)->StructVersion = VERSION_STRUCT_VER;
	(*ver)->DLLVersion = (DLL_MAJ_VERSION << 8) + DLL_MIN_VERSION;
	(*ver)->DTalkVersion = (DTALK_DBG_VERSION << 15) + (DTALK_MAJ_VERSION << 8) + DTALK_MIN_VERSION;
	(*ver)->VerString = DECtalk_Version_String;
	(*ver)->Language = DECtalk_Language_String;
	(*ver)->Features = TextToSpeechGetFeatures();
	return (sizeof(VERSION_INFO));
}

/* ML add-ons (Always returns failures) */
unsigned int TextToSpeechStartLang(char *lang) {
	return TTS_NOT_SUPPORTED;
}

BOOL TextToSpeechSelectLang(LPTTS_HANDLE_T tts, unsigned int id) {
	return FALSE;
}

BOOL TextToSpeechCloseLang(char *lang) {
	return FALSE;
}

DWORD TextToSpeechGetFeatures(void) {
	unsigned long int feats;

#ifdef ACCESS32
	feats = TTS_FEATS_TYPINGMODE;
#else
	feats = 0;
#endif
	return feats;
}

U32 TextToSpeechEnumLangs(LPLANG_ENUM *langs) {
	LPVERSION_INFO verinfo;

	if (((*langs) = malloc(sizeof(LANG_ENUM))) == NULL)	return 0;
	(*langs)->Languages = 1;
	(*langs)->MultiLang = FALSE;
	if (((*langs)->Entries = calloc(1, sizeof(LANG_ENTRY))) == NULL) {
		free(langs);
		(*langs) = NULL;
		return 0;
	}
	if (TextToSpeechVersionEx(&verinfo) == 0) {
		free(langs);
		(*langs) = NULL;
		return 0;
	}
	memcpy((*langs)->Entries[0].lang_code,verinfo->Language,2);
	(*langs)->Entries[0].lang_code[2] = '\0';
	strcpy((*langs)->Entries[0].lang_name,verinfo->Language+4);
	return (sizeof(LANG_ENUM));
}


#include "phonlist.h" /* for windic to get at */

U32 TextToSpeechReserved3(LPTTS_HANDLE_T phTTS, int type,char *data,int max_size)
{
	
	PKSD_T  pKsd_t;
	pKsd_t = phTTS->pKernelShareData;

	switch (type)
	{
	case 1: 
		/* return the size of the arpabet table */
		return(pKsd_t->arpa_size);
	case 2:
		/* return the arpabet table */
		if (max_size<pKsd_t->arpa_size)
		{
			return(-pKsd_t->arpa_size);
		}
		else
		{
			memcpy(data,pKsd_t->arpabet,pKsd_t->arpa_size);
			return(pKsd_t->arpa_size);
		}
	case 3:
		/* return the number of entries the the asky conversion table */
		return(sizeof(ptab));
	case 4:
		/* return the asky conversion table */
		if (max_size<sizeof(ptab))
		{
			return(-(int)sizeof(ptab));
		}
		else
		{
			memcpy(data,(char *)ptab,sizeof(ptab));
			return(sizeof(ptab));
		}
	}
	return(-1);
}

MMRESULT GetSpeakerParams(LPTTS_HANDLE_T phTTS, UINT uiIndex, SPDEFS **ppspCur,
						  SPDEFS **ppspLoLimit, SPDEFS **ppspHiLimit, SPDEFS **ppspDefault);

/*********************************************************************************************/
/*  Function: TextToSpeechGetSpeakerParams                                                   */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : April 6, 1998                                                                  */
/*                                                                                           */
/*  Description: This function calls the function GetSpeakerParams, which is defined in      */
/*               ph_task.c.  GetSpeakerParams, in turn, returns the parameters for the       */
/*               current speaker, the limits for those parameters, and the current           */
/*               speaker's default parameters.                                               */
/*********************************************************************************************/

MMRESULT TextToSpeechGetSpeakerParams(LPTTS_HANDLE_T phTTS, UINT uiIndex, SPDEFS **ppspCur,
						              SPDEFS **ppspLoLimit, SPDEFS **ppspHiLimit,
									  SPDEFS **ppspDefault)
{
	return GetSpeakerParams(phTTS, uiIndex, ppspCur, ppspLoLimit, ppspHiLimit, ppspDefault);
}

MMRESULT SetSpeakerParams(LPTTS_HANDLE_T phTTS, SPDEFS *pspSet);

/*********************************************************************************************/
/*  Function: TextToSpeechSetSpeakerParams                                                   */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : April 6, 1998                                                                  */
/*                                                                                           */
/*  Description: This function calls the function SetSpeakerParams, which is defined in      */
/*               ph_task.c.  It passes a SPDEFS structure to SetSpeakerParams, which, in     */
/*               turn, sets the current speaker's parameters to the values in that SPDEFS    */
/*               structure.                                                                  */
/*********************************************************************************************/
MMRESULT TextToSpeechSetSpeakerParams(LPTTS_HANDLE_T phTTS, SPDEFS *pspSet)
{
	return SetSpeakerParams(phTTS, pspSet);
}

/********************************* end of ttsapi.c *****************************/

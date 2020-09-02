/* ********************************************************************
 *                                                                    
 *  COPYRIGHT NOTICE                                                  
 *                                                                   
 *	Copyright © 2002 Fonix Corporation. All rights reserved.		 
 *	Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved. 
 *  Copyright (c) Digital Equipment Corporation, 1993, 1998       
 *																
 *  All Rights reserved. Unpublished rights reserved under the    
 *  copyright laws of the United States. Copyright is claimed in  
 *  the computer program and user interface thereof.              
 *                                                                
 *  The software contained on this media is proprietary to and    
 *  embodies the confidential technology of Fonix Corporation.	
 *   Possession, use, duplication or dissemination of             
 *  the software and media is authorized only pursuant to a valid 
 *  written license from Fonix Corporation.						
 *                                                                
 *  The name of Fonix Corporation may not be used to			
 *  endorse or promote products derived from this software without
 *  specific prior written permission. All other rights reserved. 
 *                                                                
 *  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR  
 *  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED    
 *  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS    
 *  FOR A PARTICULAR PURPOSE.                                     
 *  Fonix assumes no responsibility AT ALL for the use or         
 *  reliability of this software.                                 
 *                                                                
 *                                                                
 * +----------------------------------------------------------------+
 * | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       |
 * | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       |
 * | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.|
 * |                                                                |
 * +----------------------------------------------------------------+
 *                                                                   
 **********************************************************************

 **********************************************************************
 *                                                                    *
 *  Text-To-Speech API                                                *
 *  Author: Bill Hallahan                                             *
 *  Date: July 6, 1993                                                *
 *                                                                    *
 *  Abstract:                                                         *
 *                                                                    *
 *         This file contains all of the API function for             *
 *    Text-To-Speech using DECtalk under the Windows NT operating     *
 *    system.                                                         *
 *                                                                    *
 **********************************************************************

/*
 * @DEC_COPYRIGHT@
 */

/*
 * HISTORY

 * Revision 1.1.2.30  1997/04/28  17:00:00  Ginger Lin
 *      Changed cmd_def.h to cm_def.h and cminst.h to cm_data.h
 *      lts_init() to ls_util_lts_init()
 *      phinst.h to ph_def.h
 *      [1997/04/28  17:00:00  Ginger Lin]
 *
 * Revision 1.1.2.29  1997/01/29  16:06:33  Darrell_Stam
 * 	Changed the function prototype/definition for StartDecTalkSystemThread
 * 	so it uses the more generic HTHREAD_T instead of DT_HANDLE.
 * 	[1997/01/29  16:06:17  Darrell_Stam]
 *
 * Revision 1.1.2.28  1996/11/19  12:22:36  Cathy_Page
 * 	Added WAVERR_BADFORMAT as return value to TextToSpeechStartupEx().
 * 	Now returns MMSYSERR_NOTENABLED when licens pak does not exist.
 * 	Cleanup pKsd_t in TextToSpeechStartupEx().
 * 	[1996/11/19  12:20:43  Cathy_Page]
 * 
 * Revision 1.1.2.27  1996/10/31  12:53:55  Cathy_Page
 * 	Initialized pcsBufferPipe in TextToSpeechStartupEx
 * 	[1996/10/31  12:47:31  Cathy_Page]
 * 
 * Revision 1.1.2.26  1996/10/18  12:14:55  Cathy_Page
 * 	Added lmf error checking.
 * 	Added ReturnRemainingBuffers and DrainPipes routines.
 * 	Ported over NT's fixes for TextToSpeechReset function.
 * 	Added in bInReset and pcsBufferPipe to fix code changes from NT
 * 	[1996/10/18  12:06:49  Cathy_Page]
 * 
 * Revision 1.1.2.25  1996/10/01  17:14:46  Cathy_Page
 * 	Initialized uiID_*_Message fields with TTS_MSG_* constants
 * 	[1996/10/01  17:13:28  Cathy_Page]
 * 
 * Revision 1.1.2.24  1996/09/30  12:03:23  Cathy_Page
 * 	Removed debug print statements
 * 	Added in the freeing of hTextInQueueEvent event handle
 * 	[1996/09/30  12:02:34  Cathy_Page]
 * 
 * Revision 1.1.2.23  1996/09/25  13:43:48  Cathy_Page
 * 	Created from V4.3 NT code
 * 	[1996/09/25  13:41:44  Cathy_Page]
 * 
 **********************************************************************

 **********************************************************************
 * revision history
 * 001	29jul96		tek		repaired message passing for status.
 * 002	05aug96		tek		repaired memory freeing at shutdown.
 * 003	15nov96		gl		Spanish defaulted set to MODE_LATIN
 * 004	19nov96		cjl		include license key once!
 * 005	06dec96		cjl		add missing license ifdef.
 * 006	11Dec96		gl		Add language switch to set up
 *							lang_curr.  alos set defaluted
 *							modeflag to latin
 * 007	16Dec96		gl		merge V4.3 008 code.
 * 008	08Jan97		gl		merge Tom's "long reset" fix
 * 009	08Jan97		gl		merge Tom's NT license control fix.
 *							fix the license mapping to only
 *							map the section once per instance.
 * 010	10Jan97		ksb		Added Reserved1 function to fetch spdef info
 * 011	31Jan97		ksb		Changed CUSTR_STR_VERSION to blank
 * 012	02apr97		tek		BATS 278 (initialize pcsSpcPktSave)
 * 013	01may97		tek		Licensing changes
 * 014	06may97		tek		BATS 320 (unregister TTSwnd class on shutdown)
 * 015	09jun97		tek		typing changes
 * 016	19jun97		tek		more typing changes
 * 017	01aug97		tek		bats423: initializations for audio fixes
 * 018	01aug97		tek		bats404: init the new message types
 * 019	28jul97
 * 020	10jan96		gl		fix text queueing sync. problem.
 * 021	16jun97		tek		bats385 (blocking between reset and speak/sync)
 * 022	06aug97		ncs		Shut off licenses if a static build.
 * 023	13aug97		ksb		BATS #??? to fix multi-thread problem
 *        					Promblem caused by UnregisterClass called from thread
 *							taking down the class while other threads were connected
 *							to it
 * 024	18aug97		ksb		Add new version info junk
 * 025	12sep97		ksb		Kurtzweil changes for SLOWtalk for 50 WPM in ACCESS32
 * 026	15sep97		tek		SMIT/Access32 licensing changes
 * 027	17sep97		ksb		Add new EnumLangs function for ML
 * 028	24oct97		tek		Bats497 delete and deallocate pcsVtmPipeRead
 * 028	25sep97		gl		use array structure for dictionary pointer.
 *                  		also add UK support
 * 029	05nov97		gl		for BATS#510 use array for all the dictionary entry.
 * 031	12nov97		tek		BATS513 (sneak path in speak/reset processing)
 * 032	12nov97		tek		BATS517 (popping)
 * 033	13nov97		tek		merge in sapi transport (bats 404?)(aug97)
 * 034	19nov97		tek		(typing mode) let VTM regulate both VTM and PH
 *							thread priority. Also, remove the "drop volume on 
 *							reset" code; this actually makes things more
 *							"clicky", and can leave the wave mixer in a bad
 *							state if we get shot while in the middle of the
 *							volume-down period.
 * 035	01jan98		MGS		Added TextToSpeechReserved3 for windic
 * 036	08Jan98		gl		BATS#547 send a dummy space after SYNC
 * 037	30jan98		tek		correct sync pipe length for BATS546
 * 038	27feb98		JAW		Merged CE code.
 * 039	18mar98		cjl		Removed specific path for dectalkf.h.
 * 040	01apr98		tek jl	Fixed TextToSpeechLogFiles for phoneme and text BATS#120 #614
 * 041	06apr98		JAW		Added TextToSpeechGetSpeakerParams and TextToSpeechSetSpeakerParams
 *                  		functions.  Added function prototypes for GetSpeakerParams and
 *                  		SetSpeakerParams (which are defined in ph_task.c).
 * 042	01may98		JL		BATS#657 Fix Access32 char to unsigned to handle ASCII code > 128
 *							For TextToSpeechTyping in Access32 	
 * 043	04may98		GL		only define licenses in production mode
 * 044	12may98		tek		bats 668 fix unload of the main dictionary
 * 045	27may98		tek		bats 689: threadsafe instance counting
 * 046	04jun98		ET		merged PHEDIT2 code
 * 047	06/18/98	garufi	SANISH_SP & SPANISH_LA support added 
 * 048	07jul98		JAW		Added API functions TextToSpeechDictionaryHit, TextToSpeechDumpDictionary,
 *							TextToSpeechUserDictionaryHit, TextToSpeechDumpUserDictionary,
 *							TextToSpeechAddUserEntry, TextToSpeechDeleteUserEntry, and
 *							TextToSpeechChangeUserPhoneme.
 * 049	14jul98		MFG		SPANISH_SP & SPANISH_LA support added 
 * 050	07aug98		JAW		Added API function TextToSpeechSaveUserDictionary.  Added function
 *							prototype for SaveUserDictionary (which is defined in ls_dict.c).  Added
 *							cases 5, 6, and 7 to TextToSpeechReserved3 to support the Lexicon Dialog
 *                  		Box.  Added prototypes for functions in ls_dict.c that are used by these
 *							cases.
 * 051	21aug98		tek		add TextToSpeechConvertToPhonemes, and associated variables
 * 052	05oct98		ETT		added linux code
 * 053	12oct1998	ETT		cleaned up merged code from ttsapi_u.c
 * 054	150ct98		mfg		added Windows CE support to WriteAudioToFile and TextToSpeechSpeak
 * 055	20oct98		jhu		added Windows CE support for TextToSpeechOpenLogFile and TextToSpeechCloseLogFile
 * 056	29oct98		tek		Added TextToSpeechTuning
 * 057	02nov98		mfg		removed message box from release code BATS#741
 * 058	10nov98		ETT		fixed Report_TTS_Status broke during merge...	
 * 059	10nov98		ETT		added above comment which I forgot before                                                                    
 * 060	19nov98		ETT		fixed osf stuff which broke during merge...
 * 061	19nov98		GL		BATS#827  use the correct version number TextToSpeechGetCaps()
 * 062	20nov98		GL		BATS#828 use API_DEBUG to replace _DEBUG
 *							except declaration of fpODS_File
 * 063	20nov98		MGS		BATS #571 Fixed TextToSpeechGetSpeaker 
 * 064	30nov98		GL		BATS#828 use _DEBUG for lincense blocking
 * 065	01dec98		tek		implement data return part of TextToSpeechTuning
 * 065	11jan98		mfg		turned on licensing for Windows CE 
 * 066	11jan98		mfg		modified registry access, licencing and dictionaries to support Windows CE 
 * 067	11jan98		mfg		modified TexttoSpeakSpeech added WideStringtoAsciiString() call, for WinCE
 * 067	07jan99		tek		bats850: PumpModeMessage for SAPI.
 * 068	29jan99		tek		bats849: fix hangs on logfile/wavefile
 * 069	01feb99		MGS		Moved endif so PumpModeMessage doesn't break UNIX
 * 070	03mar99		MGS		Adding NEW_TRANSPORT code to file
 * 071	22mar99		mfg		include cemm.h for beginthread and endthread support for WinCE 211
 * 072	27jul99		mfg		WinCE unicode cleanup
 * 073	30jul99		mfg		undefined process.h for WinCE 
 * 074	29oct99		mfg		added WINDOWS CE support for TextToSpeechLoadUserDictionary
 * 075	18Jan00		NAL		added API function TextToSpeechGetPhVdefParams
 * 076	09feb00		MGS		Made changes for linux licensing and dictionaries
 * 077	04/7/99		eab		Modified SP_ for universal phonemes
 * 078	11May00		CAB		Fix error in wince so that the language menu would be visiable
 *							and checked off
 * 079	06/12/00	NAL		Warning removal
 * 080	06/20/00	MGS		Dictionary reduction
 * 081	06/21/00	CAB		removed () from _flushall because it gives a linker error with in cedll
 * 082	07/14/00	MGS		Sapi 5 additions
 * 083	07/20/00	MGS		More Sapi 5 stuff
 * 084	07/20/00	CHJ		French added
 * 085	07/26/00	MGS		Changed vtm pipe length for Realtime rate
 * 086	07/21/00	MGS		Removed extra text queueing on reset or something
 * 087	07/31/00	MFG		Implemented dictionary memory mapping for Windows CE/NT/95
 * 088	08/22/00	MGS		BATS #935 Fixed 2 concurreny problems
 * 089	08/30/00	MGS		Increased the speed of the tuner
 * 090	08/24/00	MGS		Added define TUNE_8KHZ_VOICE for 8k hz
 * 091	09/21/00	MGS		Made change to Linux licensing code
 * 092	10/10/00	MFG		Added windows CE support for the new complier
 * 093	10/12/00	MFG		Added 2nd argument to ls_util_lts_int() to fix linker error
 * 094	10/16/00	CAB		Changed copyright info
 * 093	10/15/00	MFG		Added 2nd argument to ls_util_lts_int() to fix linker error for wce200
 * 094	01/17/01	MGS		Moved phTTS->bInReset = TRUE
 * 095	01/19/01	CAB		Comments for defines part1
 * 096	01/26/01	MGS		Fixed receiving NULL in TextToSpeechSpeak
 * 097	02/08/01	MGS		Made a change for the new linux audio stuff
 * 098	02/19/01	MFG		Fixed Windows CE warnings
 * 099	02/28/01	MGS		Merged in base changes needed for ACCESS32 merge
 *							Added volume attenuator
 * 100	03/01/01	MGS		Made the foreign language dict work for multiple instances
 * 101	03/02/01	MGS		Added code for multiple instances work with dictionary mapping
 * 102	03/27/01	MGS		Visual marks for Tru64
 * 103	03/29/01	MGS		Fixed return value for TextToSpeechVisualMarks
 * 104	05/01/01	MFG		removed message box refer to BATS#790
 * 105	05/09/01	MGS		Access32 Merge and Some VxWorks porting BATS#972
 * 106	05/21/01	MGS		More VxWorks porting BATS#972
 * 107	05/22/01	MFG		Removed the perror for WinCE it is not supported
 * 108	05/29/01	MFG		Fixed more WinCE unicode warnings
 * 109	06/05/01	CAB		Readded comment _DEBUG to skip license check
 * 110	06/15/01	MGS		Attempted more debug window mess..
 * 111	06/19/01	MGS		Solaris port BATS#972, Taught OpenWaveOutFile how to write .au file
 * 112	07/10/01	MGS		Exclude debug window for Win CE
 * 113	02/26/02	MGS		Access32 chagnes, mitsubishi changes
 * 114	03/05/02	MGS		Added TextToSpeechReserved4 for changing the main dictionary
 * 115	03/20/02	MGS		Single threaded vtm
 * 116	03/21/02	MGS		Single threaded ph
 * 117	04/03/02	MGS		Single threaded lts
 * 118	04/16/02	MGS		Single Threading
 * 119	04/25/02	CAB		Removed warnings by typecast as per ph_data.h
 * 120	05/15/02	CAB		Added missing #endif and condense #if
 * 121  07/16/02	MGS		Added Fonix dictionary startup
 * 122  11/11/01	MFG		fixed the write to wave file procedures for Windows CE
 * 123  12/11/01	MFG		Added SMARTMEDIA Support
 * 124  12/20/01	MFG		Added CUP28PROJECT Support for the SH4 Mitsubishi platform
 * 125  03/25/02	MFG		Made the text buffer variable in TextToSpeechSpeak for WinCE
 * 126  07/10/02	MFG		Merged into code changes needed for the Mitsubishi CE/SH4 Project
 * 127	07/12/02	CAB		Added dtlic.log to Windows CE
 * 128	07/14/02	CAB		Fixed TTSversion() && TTSVersionEx() for Windows CE
 * 128	07/18/02	CAB		Fixed typo and file overwrite
 * 129	07/22/02	CAB		Fixed compile error made to dtdic.log for Windows CE
 * 130	08/07/02	CAB		Changed to TCHAR for WIN_32 for TTSStartupExFonix()
 * 131	08/08/02	CAB		Fixed copy of Language specific string values for Windows CE
 * 132	09/04/02	MGS		Linux changes
 * 133  09/05/02	MGS		Fonix server fix
 * 134	09/06/02	CAB		Fixed return value
 * 135	09/19/02	MFG 		Added support for new chris voice
 * 136	09/19/02	CAB		Changed chris voice to us only
 * 137	10/10/02	MFG		Fixed the user dic loading for windows CE
 * 138	12/09/02	MGS		Fixed TextToSpeechConvertToPhonemes for STATE_OUTPUT_NULL
 * 139	04/02/03	MFG     TextToSpeechSync(NULL) fixed BTS#10146 
 * 140	04/02/03	MFG		TextToSpeechUnloadUserDictionary(NULL) fixed BTS#10147
 * 141	04/02/03	MFG		TextToSpeechSetRate(NULL) fixed BTS#10139
 * 142	06/30/03	MFG		fixed a number of bugs about 30 of them
 * 143	07/01/03	MFG		moved MAX RATE from ttsapi.c to cm_defs.h for bug BTS#10102
 * 144	07/16/03	MFG		fixed numerous BTS bugs
 *
 ***************************************************************************/

/**********************************************************************/
/*  Include files.                                                    */
/**********************************************************************/

#ifdef WIN32
#include <windows.h>
#ifndef UNDER_CE
#include <process.h>
#endif /* UNDER_CE */
#endif /* WIN32 */

#include <stdio.h>
#include <stdlib.h>    //MVP: For the routine atol()
#include <string.h>

#ifndef VXWORKS
#include <malloc.h>
#endif

#if defined(_WIN32_WCE) && (_WIN32_WCE == 200)
#include <time.h> // NAL warning removal
#endif

#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
#include <mmsystem.h>
#endif

#include <ctype.h>

#include "dectalkf.h"
#include "defs.h"
#include "esc.h"

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include "playaudd.h"	// pick up the struct defs so we can load MsecPerSample
#endif	/* defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ */

#include "kernel.h"
#include "cmd.h"
#include "samprate.h"
#include "tts.h"
// tek 05aug96 changes to allow freeing the PH thread data..
#include "ph_def.h"
// tek 29oct98 needed for the tuner data structure
#include "vtminst.h"
#include "ls_dict.h"
#include "cm_defs.h"

// mfg 22mar99 added for beginthread and endthread support
#if UNDER_CE
#include "cemm.h"
#endif

#ifdef WIN32
#if !(defined OLEDECTALK) && !(defined SAPI5DECTALK)		//tek 01aug97 bats423
#include "playaudd.h"	// pick up the struct defs so we can load MsecPerSample
#endif	/*!(defined OLEDECTALK) && !(defined SAPI5DECTALK) */

#define UPDATERG_C		//tek 01may97 pull the license key out of coop.h
#include "coop.h"
#include "ttserr.h"
#endif /* WIN32 */

#include "ttsfeat.h"

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include <sys/types.h>
#ifndef VXWORKS
#include <sys/ipc.h>
#include <sys/shm.h>
#endif
#include <stdarg.h>
#include "opthread.h"
#include "port.h"
#include "dectalkf.h"
#include "cm_def.h"
#include "cm_data.h"
#endif /* defined __osf__ || __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ */

#ifdef WIN32
#ifdef _DEBUG
#ifndef UNDER_CE
extern HWND	DbgWindow;
#endif
#endif
#endif // WIN32

void FreePHInstanceData(void *); // tek 05aug96 this is a broken prototype
/* tek 03sep96 pull buffer flush into a separate routine.. */
void ReturnRemainingBuffers( LPTTS_HANDLE_T phTTS );
void DrainPipes(LPTTS_HANDLE_T phTTS); //tek 04sep96
//#define API_DEBUG
/**********************************************************************/
/*  Symbol definitions.                                               */
/**********************************************************************/
#ifdef API_DEBUG
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
FILE *fpODS_File=NULL;
#undef timeGetTime
#include <sys/time.h>
#include <unistd.h>
//#define timeGetTime() (unsigned long)(time(NULL))
static unsigned int timeGetTime()
{
        struct timeval tv;
        gettimeofday(&tv,NULL);
        return((tv.tv_sec%1000000)*1000 + (tv.tv_usec)/1000);
}
#undef OutputDebugString
#define OutputDebugString(x) {\
        if (!(fpODS_File)) \
                fpODS_File = fopen("/home/dectalk/odslog.log","w"); \
        fprintf(fpODS_File,"%s",x); \
  } 

#endif	/* defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ */
#endif	/* API_DEBUG */

/* ETT : merged from PHEDIT2 code  */
#ifdef PHEDIT2
#define WS_OVERLAPPEDWINDOW (WS_OVERLAPPED     | \
	WS_CAPTION        | \
WS_SYSMENU)
#endif	/* PHEDIT2 */

#ifdef WIN32
#define  CUSTR_STR_VERSION		""   // CJL - Customer String
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
//#define EnterCriticalSection OP_LockMutex
//#define LeaveCriticalSection OP_UnlockMutex
#define CreateEvent(a,b,c,d) OP_CreateEvent(b,c)
// ETT: fixme?  turn these on when ttsapi is merged better?
//#define SetEvent OP_SetEvent
//#define ResetEvent OP_ResetEvent
#define Sleep OP_Sleep
#define ULONG unsigned long int
#endif	/* defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef ENGLISH_US
#define CUSTR_STR_VERSION "US"
#endif	/* ENGLISH_US */

#ifdef ENGLISH_UK
#define CUSTR_STR_VERSION "UK"
#endif	/* ENGLISH_UK */

#ifdef GERMAN
#define CUSTR_STR_VERSION "GR"
#endif	/* GERMAN */

#ifdef SPANISH
#ifdef SPANISH_LA
#define CUSTR_STR_VERSION "LA"
#else
#define CUSTR_STR_VERSION "SP"
#endif	/* SPANISH_LA */
#endif	/* SPANISH */

#ifdef FRENCH
#define CUSTR_STR_VERSION "FR"
#endif	/* FRENCH */
#endif /* defined __osf__ || __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ */


#define  CMD_PIPE_LENGTH          64
#define  LTS_PIPE_LENGTH         128
#define  PH_PIPE_LENGTH          256

#ifdef SAPI5DECTALK
// make the vtm pipe much shorter for sapi5.  
//this is needed for real time rate changes to work
#define  VTM_PIPE_LENGTH        1536
#else
#define  VTM_PIPE_LENGTH       16384
#endif /* SAPI5DECTALK */

#ifdef NEW_TRANSPORT
#define NEW_LTS_PIPE_LENGTH      64
#endif

// MGS mrege redundant code
// tek 29aug97 we use the sync pipe for visual, so it
// needs to be longer.. much longer..
// tek BATS546: used for DAPI now too..
#define  SYNC_PIPE_LENGTH        2048

#define  BUFFER_PIPE_LENGTH      256
#define  MAX_TEXT_WRITE_LENGTH    16                      

/**********************************************************************/
/*  Window Messages.                                                  */
/**********************************************************************/

#define  ID_TTS_Queue_Text      WM_USER + 0
#define  ID_TTS_Destroy         WM_USER + 1

#if defined WIN32 && !defined NOWIN
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

#endif /* Win32 */
/**********************************************************************/
/*  External function declarations.                                   */
/**********************************************************************/
#ifdef WIN32
extern int __stdcall cmd_main(LPVOID);

extern int __stdcall lts_main(LPVOID);                                 

extern int __stdcall ph_main(LPVOID);    /*For _beginthreadex the thread function should be a __stdcall */

extern int __stdcall vtm_main(LPVOID);

extern int __stdcall sync_main(LPVOID);
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
OP_THREAD_ROUTINE(cmd_main, LPTTS_HANDLE_T phTTS);

int lts_main( LPTTS_HANDLE_T phTTS);

int ph_main( LPTTS_HANDLE_T phTTS);    

int vtm_main( LPTTS_HANDLE_T phTTS);

OP_THREAD_ROUTINE(sync_main, LPTTS_HANDLE_T phTTS);
#endif /* defined __osf__ || __linux__ */

// tek 12nov97 this prototype somehow got out of sync with the
// actual module definition!?!
// ETT: fixme? these should all be the same right??!
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
extern int load_dictionary( void**, void **, unsigned int*,unsigned int*, char*, int,DT_HANDLE,
								DT_HANDLE,
								LPVOID*,
								MEMMAP_T );
#endif /* defined __osf__ || defined __linux__ */

#ifdef WIN32
extern MMRESULT load_dictionary( LPTTS_HANDLE_T,
								void **,
								void **,
								unsigned int *,
								unsigned int *,
#ifdef CHEESY_DICT_COMPRESSION
								void **,
								unsigned int *,
#endif
								char *,
								BOOL,
								BOOL,				
								DT_HANDLE,
								DT_HANDLE,
								LPVOID*,
								MEMMAP_T );
								
#endif	/* WIN32 */

extern void unload_dictionary( void ** ,void ** ,unsigned int *,unsigned int *,
				   LPVOID* ,DT_HANDLE* ,DT_HANDLE* ,MEMMAP_T );

extern void SetSampleRate( LPTTS_HANDLE_T, unsigned int );

extern void cmd_init( LPTTS_HANDLE_T ,BOOL );

/* MVP : Function to free CMD thread specific memory allocations */
#ifdef WIN32
extern void FreeCMDThreadMemory(PVOID);
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
extern void FreeCMDThreadMemory(PCMD_T pCmd_t);
void pthread_init (void);
#endif /* defined __osf__ || __linux__ */

#ifdef VXWORKS
extern void ls_util_lts_init( PLTS_T, PKSD_T);
#else
#ifndef UNDER_CE
extern void ls_util_lts_init( PLTS_T, PKSD_T);
#elif !(UNDER_CE == 200)
extern void ls_util_lts_init( PLTS_T, PKSD_T);
#endif	/* UNDER_CE */
#endif

extern void phinit( LPTTS_HANDLE_T , BOOL );

extern void InitializeVTM( LPTTS_HANDLE_T );
extern void free_index( PKSD_T);

extern unsigned int kernel_disable( PKSD_T pKsd_t );

extern void kernel_enable( PKSD_T pKsd_t, unsigned int );

/**********************************************************************/
/*  Function prototypes.                                              */
/**********************************************************************/


#ifdef SAPI5DECTALK
extern MMRESULT InitializeDECtalkAudio( HWND hWndMode,
								 LPAUDIO_PARAMS_T *ppAudioParams);
extern void DestroyAudioObjects(LPAUDIO_PARAMS_T pAudioParams);
#endif /* SAPI5DECTALK */

static LPTTS_BUFFER_T GetBuffer( LPTTS_HANDLE_T );

static void DeleteTextToSpeechObjects( LPTTS_HANDLE_T );
/* Function prototype for SetSpeaker now will have LPTTS_HANDLE_T arg for MI : MVP */
static void SetSpeaker( LPTTS_HANDLE_T,SPEAKER_T );

#if defined WIN32 && !defined NOWIN
static DWORD __stdcall TextToSpeechThreadMain( LPTTS_HANDLE_T );
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
static OP_THREAD_ROUTINE(TextToSpeechThreadMain, LPTTS_HANDLE_T phTTS);
#endif /* defined __osf__ || __linux__*/

#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
static HWND InitTextToSpeechWindow( LPTTS_HANDLE_T );

#ifdef WIN32
static LRESULT CALLBACK TextToSpeechWndProc( HWND,
											UINT,
											WPARAM,
											LPARAM );
#endif /* WIN32 */

static void Process_TTS_Message( LPTTS_HANDLE_T, LPARAM );
#endif /* __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_ */

static void WaitForTextQueuingToComplete( LPTTS_HANDLE_T, BOOL );

unsigned char LinearToMuLaw( short );

static void FixMemoryLockup( LPTTS_HANDLE_T phTTS );

static MMRESULT WaitForEmptyPipes( LPTTS_HANDLE_T, DWORD, BOOL );
/*MVP : generic Dectalk system thread create function */

#if !defined __osf__ && !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
typedef unsigned int ( __stdcall * start_address )(void *);

static int StartDecTalkSystemThread(LPTTS_HANDLE_T phTTS,PHANDLE ppDecTalkThread,
									BOOL bMalloc, start_address ThreadFunction);
#else

static int StartDecTalkSystemThread(LPTTS_HANDLE_T phTTS, HTHREAD_T *ppDecTalkThread,
									BOOL bMalloc, OP_THREAD_ROUTINE(ThreadFunction, LPTTS_HANDLE_T phTTS));
#endif /* !defined __osf__ && !defined __linux__ */


unsigned int PlayAudioCallbackRoutine( HPLAY_AUDIO_T pPlayAudio,
									  ATYPE_T aInstance,
									  ATYPE_T aMessage,
									  ATYPE_T aItem_1 );
VOID DefaultTTSCallbackRoutine(LONG lParam1,
							   LONG lParam2,
							   DWORD dwInstanceParam,
							   UINT uiMsg);

//#ifdef WIN32
// 16JUN97 BATS 385 this is an internal-use-only routine..
// merged 28jul97 tek
MMRESULT TextToSpeechSpeakEx( LPTTS_HANDLE_T, LPSTR, DWORD, BOOL );
//#endif /* WIN32 */

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
#ifdef WIN32
volatile int		gnInstanceCounter = 0;	//tek 27may98 needs to be volatile
DECLARE_TLOCK		(tl_gnInstanceCounter); //tek 27may98 bats 689
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
int                       gnInstanceCounter = 0;
#endif /* defined __osf__ || defined __linux__ */

S32                   *gpufdic_index          = NULL;
unsigned char                    *gpufdic_data          = NULL;
S32                       gufdic_entries     = 0;
S32                       gufdic_bytes     = 0;
DT_HANDLE gufdicMapObject=NULL;
DT_HANDLE gufdicFileHandle=NULL;
LPVOID gufdicMapStartAddr=NULL;
S32 *gufdic_fc_entry=0;
S32 gufdic_fc_entries=0;

S32       *gpufordic_index          = NULL;
unsigned char    *gpufordic_data          = NULL;
S32                       gufordic_entries     = 0;
S32                       gufordic_bytes     = 0;
DT_HANDLE gufordicMapObject=NULL;
DT_HANDLE gufordicFileHandle=NULL;
LPVOID gufordicMapStartAddr=NULL;


#ifdef WIN32
#ifdef ACCESS32 // tek 15sep97 SMIT licensing
char  gszA32Id[256]="";       // access32 identifier string
#endif /* ACCESS32 */
#endif /* WIN32 */

// tek 30apr97 / 09jun97 some debugging stuff..
#ifdef _DEBUG
FILE *fpODS_File=NULL;
#endif /*_DEBUG */

//#ifndef __linux__
#ifndef DEMO
#ifndef STATIC_BUILD
#ifndef _DEBUG
#ifndef CUP28PROJECT
#define LICENSES
#ifndef LICENSES
This line will cause an error to signal the fact that the license symbol,
was not defined.
#endif	/* LICENSES */
#endif  /*CUP28PROJECT*/
#endif	/* _DEBUG */
#endif	/* STATIC_BUILD */
#endif	/* DEMO */
//#endif // __linux__

#ifdef LICENSES
int all_digits(unsigned char *input)
{
	while (*input)
	{
		if (*input<'0' || *input >'9')
			return(0);
		input++;
	}
	return(1);
}
#endif	/* LICENSES */
 

#ifdef WIN32	/* WIN32 (1) */

#undef DECTALKBETA430      //MVP:04/09/96 A message will be spoken for Beta releases.

#ifdef LICENSES
#define SHMEMSIZE 10
#define MAX_STR 134

/** *** Global to keep track of whether we've mapped the license shmem *** */
static unsigned int guiLoadedLicenseShare = FALSE;
static unsigned int guiLoadedA32LicenseShare = FALSE;
/** tek 08jan97 **/

/*#define LICENSE_KEY 30987*/
/*moved to coop.h as an include 11/19/96 cjl*/
#define LICENSE_KEY_ERROR -1
/* note that the following is global, and thus must be dealt with on 
* a PER INSTANCE (of the DLL) basis */
static LPVOID lpvMemLicense = NULL; /* address of shared memory */
static LPVOID lpvA32MemLicense = NULL; /* address of shared memory */
BOOL AddLicenseRef(int *a32_lic);
void ReleaseLicenseRef(int *a32_lic);
static int GetFromSomeWhere(void);
extern  unsigned int decryptString(const unsigned char *input,unsigned long key,unsigned char *string);

/* ************************ NOT USED ***************************** */
#if 0
static int CreateTheLicenseKey(void);
#endif /* 0 */
/* *************************************************************** */

#endif /* LICENSES */

// 06apr97 tek BATS320
// we need to use this string in two places, so make it a macro..
#ifdef UNDER_CE
#define TEXTTOSPEECHWNDCLASS _T("TextToSpeechWndClass")	// KSB - Aug13 Fix BATS #??? for
#else
#define TEXTTOSPEECHWNDCLASS "TextToSpeechWndClass"	// KSB - Aug13 Fix BATS #??? for
#endif
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

int APIENTRY LibMain( DT_HANDLE hInst,
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
// This function will now always check the registry for licensing information.
// if the access32 licensing is active, AddLicenseRef will allocate
// the access32 licenses first, then use these, unless this function returns 0 
#define ACCESS32_LICENSE_COUNT (4)

int GetFromSomeWhere()
{
//#ifdef ACCESS32 // tek 15sep97 SMIT licensing
//	return ACCESS32_LICENSE_COUNT;
//#else //ACCESS32
	HKEY hKeyLicense = NULL;
	// tek 01may97 key now comes from coop.h
	CHAR szLicensesEncrypted[MAX_STR];

#ifdef UNDER_CE //mfg 09jan99 Windows CE support
	TCHAR wszLicensesEncrypted[MAX_STR/2];
#endif	/*UNDER_CE */

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
#ifndef UNDER_CE //mfg 09jan99 Windows CE support
			"Licenses",
#else
			TEXT("Licenses"),
#endif	/* UNDER_CE */

			NULL,
			&dwType,

#ifndef UNDER_CE //mfg 09jan99 Windows CE support
			(LPBYTE)szLicensesEncrypted,
#else
			(LPBYTE)wszLicensesEncrypted,
#endif	/* UNDER_CE */

			&cbData ) != ERROR_SUCCESS )
		{
			return LICENSE_KEY_ERROR;
		}       

#ifdef UNDER_CE	//mfg 09jan99 Windows CE support
WideStringtoAsciiString(szLicensesEncrypted, wszLicensesEncrypted, MAX_STR);
#endif	/* UNDER_CE */

		RegCloseKey( hKeyLicense );
	}
	
	if (decryptString((const unsigned char *)szLicensesEncrypted,LICENSE_KEY,(unsigned char *)szLicenses))
	{
		if (all_digits(szLicenses)==0)
		{	
			return(LICENSE_KEY_ERROR);
		}
		return(atol(szLicenses));
	}
	return(LICENSE_KEY_ERROR);
//#endif /* ACCESS32 */
}

// tek 22aug96

DT_HANDLE hMapObject = NULL; // to get to the file map..
DT_HANDLE hA32MapObject = NULL; // to get to the file map..


/**********************************************************************/
/* check and increment the license count. Must be paired              */
/* with a ReleaseLicenseRef call on shutdown.                         */
/**********************************************************************/

BOOL AddLicenseRef(int *a32_lic)
{
	BOOL fInit=0,fIgnore;
	DWORD dwMAXRunTimeLicenses;
	DWORD dwLicenseCount;
	int must_be_a32=0;
	
#ifdef UNDER_CE
	HANDLE hFile;
	char temp[256];
	DWORD dwRw;
	
	DeleteFile(_T("\\dtlic.log"));	// Delete file if it exist
#else
	FILE *outfile;
#endif

	dwMAXRunTimeLicenses = GetFromSomeWhere();

	/* Create a named file mapping object */ 
	// 0 means Unlimited Licenses :Just return from DllEntry function.
	if (!dwMAXRunTimeLicenses)
		return TRUE;

	/* stuff to add for access32 licensing */
	/*	add guiLoadedA32licenseshare
		CreateFileMapping(A32 license share)
			if it fails, do normal licensing
		add lpvA32MemLicense
		lpvA32MemLicense=MapViewOfFile()
			if it fails do normal licensing
		increment lpvA32MemLicense
			if it is greater than ACCESS32_LICENSE_COUNT
			do normal licensing
	*/
	switch (fInit)
	{
	default:
#ifdef ACCESS32
		if (!guiLoadedA32LicenseShare)			 /* tek 08Jan97 BATS 205*/
		{
			hA32MapObject = CreateFileMapping( 
				(DT_HANDLE) 0xFFFFFFFF, /* use paging file    */ 
				NULL,                /* no security attr.  */ 
				PAGE_READWRITE,      /* read/write access  */ 
				0,                   /* size: high 32-bits */ 
				SHMEMSIZE,           /* size: low 32-bits  */
#ifdef UNDER_CE 
				_T("a32DECtalkDllFileMap"));                        /* name of map object */
#else
				"a32DECtalkDllFileMap");                        /* name of map object */
			
#endif
			if (hA32MapObject == NULL) 
				break;
			
			fInit = (GetLastError() != ERROR_ALREADY_EXISTS); 
			// ACCESS32 requires the SMITxx code to do the init..
			if (fInit)      // false if the section already exists
			{
				// get rid of the handle
				CloseHandle(hA32MapObject);
				// return a license failure.
				break;
			} // if (fInit)
			
			lpvA32MemLicense = MapViewOfFile( 
				hA32MapObject,     /* object to map view of    */ 
				FILE_MAP_WRITE, /* read/write access        */ 
				0,              /* high offset:   map from  */ 
				0,              /* low offset:    beginning */ 
				0);             /* default: map entire file */ 
			if (lpvA32MemLicense == NULL) 
			{
				CloseHandle(hA32MapObject);
				break;
			}
			{
				char *szMemLicense=NULL;
				char szEncryptedString[512]="";
				UINT uiResult=0;
				// we have to check that the memory area is valid..
				szMemLicense = (char *)(lpvA32MemLicense);
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
					UnmapViewOfFile(lpvA32MemLicense);
					// get rid of the handle
					CloseHandle(hA32MapObject);
					// return a license failure.
					break;
				}
			}
			guiLoadedA32LicenseShare = TRUE;
		}

		if (lpvA32MemLicense == NULL) 
		{
			break;
		}

		(*(PDWORD)lpvA32MemLicense)++;
		dwLicenseCount =  (*(PDWORD)lpvA32MemLicense);
		
		if(*(PDWORD)lpvA32MemLicense > ACCESS32_LICENSE_COUNT)
		{
			// Decrement Run-time License Counter.(i.e How many Processes are using DECtalk.dll)
			(*(PDWORD)lpvA32MemLicense)--;
			/* tek 08jan97 BATS 205 */
			/* only unmap the section if the count is zero - which */
			/* should never happen, I think.. */
			if (*(PDWORD)lpvA32MemLicense == 0)
			{
				/* Unmap shared memory from the process's address space. */ 
				fIgnore = UnmapViewOfFile(lpvA32MemLicense); 
				/* Close the process's handle to the file-mapping object. */ 
				fIgnore = CloseHandle(hA32MapObject); 
				guiLoadedA32LicenseShare = FALSE;
			}	
			break; //Don't load DLL
		}
		// We did access32 licensing.  set the flag to 1 to know to check for it in ReleaseLicenseRef
		*a32_lic=1;
		return TRUE;

#else
		break;
#endif

	}

	if(dwMAXRunTimeLicenses == LICENSE_KEY_ERROR)
	{
		must_be_a32=1;
	}

	if(dwMAXRunTimeLicenses == LICENSE_KEY_ERROR)
	{
#ifdef DEBUG // removed message box from release code BATS#741
#ifdef UNDER_CE
		MessageBox(NULL, _T("Text-to-speech license information invalid!"), _T("LicenseKey"),MB_ICONSTOP|MB_OK);
#else
		MessageBox(NULL, "Text-to-speech license information invalid!", "LicenseKey",MB_ICONSTOP|MB_OK);
#endif
#endif	/* DEBUG */
		
#ifdef UNDER_CE
		// open for write, handle EOF
		hFile = CreateFile(_T("\\dtlic.log"), GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS,
				           FILE_ATTRIBUTE_NORMAL,NULL);
		if (hFile)
		{	sprintf(temp, "Text-to-speech license information invalid!\n");
			WriteFile( hFile, temp, sizeof(temp), &dwRw, NULL);
			CloseHandle(hFile);
		}
#else
		outfile = fopen("\\dtlic.log", "a+");
		if (outfile)
		{	char szDateBuf[64];
			char szTimeBuf[64];
			// log the pertinent info
			_strdate(szDateBuf);
			_strtime(szTimeBuf);
			fprintf(outfile,"%s %s : Text-to-speech license information invalid!\n",
				   szDateBuf, szTimeBuf);
			fflush(outfile);
			fclose(outfile);
		}
#endif

		return FALSE;  // Don't load DLL
	}


	if (!guiLoadedLicenseShare)			 /* tek 08Jan97 BATS 205*/
	{
		hMapObject = CreateFileMapping( 
			(DT_HANDLE) 0xFFFFFFFF, /* use paging file    */ 
			NULL,                /* no security attr.  */ 
			PAGE_READWRITE,      /* read/write access  */ 
			0,                   /* size: high 32-bits */ 
			SHMEMSIZE,           /* size: low 32-bits  */
#ifndef ACI_LICENSE	//tek 01may97
#ifdef WILLOWPOND
			"wpDECtalkDllLicensememfilemap");    /* name of map object */
#else // not aci, not willowpond
//#ifdef ACCESS32 // tek 15sep97
//		"a32DECtalkDllFileMap");                        /* name of map object */
//#else // not aci, not willowpond, not access32
#ifdef UNDER_CE
		TEXT("DECtalkDllLicensememfilemap"));    /* name of map object */
#else
		"DECtalkDllLicensememfilemap");    /* name of map object */
#endif	/* UNDER_CE */
//#endif	/* ACCESS32 */
#endif	/* WILLOWPOND */
#else
		"AciSpeechLicenseMemFileMap");	/* name of map object */
#endif	/* ACI_LICENSE */
		
		if (hMapObject == NULL) 
			return FALSE; 
		
		/* The first process to attach initializes memory. */ 
		
		fInit = (GetLastError() != ERROR_ALREADY_EXISTS); 

/* ********************* NOT USED ******************************** */
#if 0
#ifdef ACCESS32 //tek 15sep97 SMIT licensing
		// ACCESS32 requires the SMITxx code to do the init..
		if (fInit)      // false if the section already exists
		{
			// get rid of the handle
			CloseHandle(hMapObject);
			// return a license failure.
			return FALSE;
		} // if (fInit)
#endif /* ACCESS32 */
#endif // 0
/* *************************************************************** */

		/* Get a pointer to the file-mapped shared memory. */
		
		lpvMemLicense = MapViewOfFile( 
			hMapObject,     /* object to map view of    */ 
			FILE_MAP_WRITE, /* read/write access        */ 
			0,              /* high offset:   map from  */ 
			0,              /* low offset:    beginning */ 
			0);             /* default: map entire file */ 
		if (lpvMemLicense == NULL) 
		{
			// MGS bug must close this handle if the licensing fails...
			CloseHandle(hMapObject);
			return FALSE; 
		}
		
		/* Initialize memory if this is the first process. */ 
		if (fInit)
		{
			//memset(lpvMemLicense, '\0', SHMEMSIZE);
			*(PDWORD)lpvMemLicense = (DWORD)0;
			// To set the Number of Licenses
			
		}

/* ****************** NOT USED *********************************** */
#if 0
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
		
#endif	/* ACCESS32 */
#endif // 0
/* *************************************************************** */
		
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
		
#ifdef DEBUG // removed message box from release code BATS#741
#if defined(UNDER_CE) && !defined(CUP28PROJECT)
		MessageBox(NULL, _T("Insufficient Text-to-Speech Run-time Licenses."),_T("Licenses"),MB_ICONSTOP|MB_OK);
#else
		MessageBox(NULL, "Insufficient Text-to-Speech Run-time Licenses.","Licenses",MB_ICONSTOP|MB_OK);
#endif
#endif	/* DEBUG */

#ifdef UNDER_CE
		// open for write, handle EOF
		hFile = CreateFile(_T("\\dtlic.log"), GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS,
				               FILE_ATTRIBUTE_NORMAL,NULL);
		if (hFile)
		{	sprintf(temp, "Insufficient Text-to-Speech Run-time Licenses.\n");
			WriteFile( hFile, temp, sizeof(temp), &dwRw, NULL);
			CloseHandle(hFile);
		}
#else
		outfile = fopen("\\dtlic.log","a+");
		if (outfile)
		{	char szDateBuf[64];
			char szTimeBuf[64];
			// log the pertinent info
			_strdate(szDateBuf);
			_strtime(szTimeBuf);
			fprintf(outfile,"%s %s : Insufficient Text-to-Speech Run-time Licenses.\n",
					szDateBuf, szTimeBuf);
			fflush(outfile);
			fclose(outfile);
		}
#endif
		
		return FALSE; //Don't load DLL
	}
	else
	{	return TRUE;
	}
}

#endif /* LICENSES ( below GetFromSomeWhere() ) */

/**********************************************************************/
/* release a license use count                                        */
/**********************************************************************/
void ReleaseLicenseRef(int *a32_lic)
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
	if (*a32_lic)
	{
		// Decrement Run-time license counter.
		(*(PDWORD)lpvA32MemLicense)--;
		if (*(PDWORD)lpvA32MemLicense == 0)  /* tek 08jan96 BATS 205 */
		{
			/* Unmap shared memory from the process's address space. */ 
			fIgnore = UnmapViewOfFile(lpvA32MemLicense); 
			/* Close the process's handle to the file-mapping object. */ 
			fIgnore = CloseHandle(hA32MapObject); 
			guiLoadedA32LicenseShare = FALSE;
		}
	}
	else
	{
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
	}
#endif /* LICENSES */
}

#ifdef LICENSES

/**********************************************************************/
/* Stub function to Query for License key                             */
/* (If it doesn't exist,create the key and set the value)             */
/* (else Do nothing)  :Later this part moves to Install script.       */
/**********************************************************************/

#endif /* LICENSES */

#endif /* WIN32 (1) */ 



#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_	/* __linux__ (1) */
#ifdef LICENSES		/* LICENSES (1) */ 

#define SHMEMSIZE 1024
#define MAX_STR 134

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <errno.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <pthread.h>


typedef struct process_id_count
{
	int pid;
	int count;
} process_id_count_t;

typedef struct license_struct 
{
	int size;
	int count;
	pthread_mutex_t pid_mutex;
	process_id_count_t processes[1000];
} license_struct_t;

/** *** Global to keep track of whether we've mapped the license shmem *** */
#ifdef __linux__
pthread_mutex_t loaded_license_mutex_l=PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t *loaded_license_mutex=&loaded_license_mutex_l;
#endif
#if defined VXWORKS || defined _SPARC_SOLARIS_
pthread_mutex_t extern *loaded_license_mutex;
#endif
static unsigned int guiLoadedLicenseShare = FALSE;
/** tek 08jan97 **/

/*#define LICENSE_KEY 30987*/
/*moved to coop.h as an include 11/19/96 cjl*/
#define LICENSE_KEY_ERROR -1
/* note that the following is global, and thus must be dealt with on 
* a PER INSTANCE (of the DLL) basis */
static license_struct_t *MemLicense = NULL; /* address of shared memory */
static int licensefd=0;
static int file_exists=0;
int shared_mem_id;
int allocated;


int AddLicenseRef(int *a32_lic);
void ReleaseLicenseRef(int *a32_lic);
static int GetFromSomeWhere(void);
extern  unsigned int decryptString(const unsigned char *input,unsigned long key,unsigned char *string);

static int GetFromSomeWhere(void)
{
	FILE *def_file;

	int i=-1;
	int j;
	char line[500];
	unsigned char decrypted[500];

	def_file=fopen("/etc/DECtalk.conf","r");
#ifdef TESTING
	if (def_file==NULL)
	{
		def_file=fopen("DECtalk.conf","r");
		if (def_file==NULL)
			return(LICENSE_KEY_ERROR);
	}	
#endif
	while (fgets(line,499,def_file)!=NULL)
	{
		if (strncmp("licenses:",line,9)==0)
		{
			line[strlen(line)-1]='\0';

			if ((j=decryptString((unsigned char *)line+9,LICENSE_KEY,decrypted)))
			{
				if (all_digits(decrypted)==0)
				{	
					break;
				}
				i=(atol((char *)decrypted));
			}
			break;
		}
	}
	fclose(def_file);
	if (i==-1)
	{
		return(LICENSE_KEY_ERROR);
	}
	/* returns the max licenses */

	// open file /etc/DECtalk.conf
	// searches for the licenses string.
	//reads the license string from the file
	//decrypts the string
	//returns the number or LICENSE_KEY_ERROR on failure

	return (i);
}


int AddLicenseRef(int *a32_lic)
{
#ifndef VXWORKS
	int max_licenses;
	int allocated_licenses=0;
	int i,index,cur_pid,j;
	char filename[100];
	struct stat stat_buf;
	int old_count;
	int old_loaded;
	char empty_block[SHMEMSIZE];
	
	
	max_licenses=GetFromSomeWhere();
	
	if (max_licenses== LICENSE_KEY_ERROR)
	{
		fprintf(stderr,"Text-to-speech license information invalid\n");
		return(FALSE);
	}
	
	if (max_licenses==0) // unlimited licenses
	{
		return(TRUE);
	}
	pthread_mutex_lock(loaded_license_mutex);
	old_loaded=guiLoadedLicenseShare;
	if (!guiLoadedLicenseShare)
	{
		file_exists=0;
		allocated=0;
		shared_mem_id=shmget(57204642,sizeof(license_struct_t),IPC_CREAT | IPC_EXCL | 0666);
		if (shared_mem_id==-1)
		{
			if (errno!=EEXIST)
			{
				perror("open error is not eexist");
				pthread_mutex_unlock(loaded_license_mutex);
				return(FALSE);
			}
			shared_mem_id=shmget(57204642,sizeof(license_struct_t),0666);
			if (shared_mem_id==-1)
			{
				perror("open error, file cannot be opened");
				pthread_mutex_unlock(loaded_license_mutex);
				return(FALSE);
			}
			file_exists=1;
		}
		allocated=1;
		MemLicense=(license_struct_t *)shmat(shared_mem_id,0,0);
		if ((int)MemLicense==-1)
		{
			perror("cannot map shared memory");
			if (file_exists==0)
			{
				shmctl(shared_mem_id,IPC_RMID,0);
			}
			pthread_mutex_unlock(loaded_license_mutex);
			return(FALSE);
		}
		if (file_exists==0)
		{
			if (pthread_mutex_init(&(MemLicense->pid_mutex),NULL)!=0)
			{
				shmdt(MemLicense);
				shmctl(shared_mem_id,IPC_RMID,0);
				pthread_mutex_unlock(loaded_license_mutex);
				return(FALSE);
			}
			MemLicense->size=1000;
			MemLicense->count=0;
			memset(MemLicense->processes,0,MemLicense->size*sizeof(process_id_count_t));
			// mark it for destruction right after it is atteched to
			//	shmctl(shared_mem_id,IPC_RMID,0);
		}

/* ********************* NOT USED ******************************** */
#if 0	
		// open file /var/tmp/DECtalk.pids world read/write only if it not there
		licensefd=open("/var/tmp/DECtalk.pids",O_RDWR | O_CREAT | O_EXCL,
			0666);
		if (licensefd!=-1)
		{
			memset(empty_block,0,SHMEMSIZE);
			write(licensefd,empty_block,SHMEMSIZE);
			lseek(licensefd,0,SEEK_SET);
		}
		if (licensefd==-1)
		{
			if (errno!=EEXIST)
			{
				perror("open error is not eexist");
				pthread_mutex_unlock(loaded_license_mutex);
				return(FALSE);
			}
			// open file /var/tmp/DECtalk.pids world read/write if it is there
			licensefd=open("/var/tmp/DECtalk.pids",O_RDWR | O_CREAT ,
				0666);
			if (licensefd==-1)
			{
				perror("open error, file cannot be opened");
				pthread_mutex_unlock(loaded_license_mutex);
				return(FALSE);
			}
			file_exists=1;
			
		}
		//map the memory to the pointer
		MemLicense=(license_struct_t *)mmap(0,SHMEMSIZE,PROT_WRITE,MAP_SHARED,licensefd,0);
		if (MemLicense==NULL)
		{
			perror("cannot map shared memory");
			close(licensefd);
			pthread_mutex_unlock(loaded_license_mutex);
			return(FALSE);
		}
		if (file_exists==0)
		{
			if (pthread_mutex_init(&(MemLicense->pid_mutex),NULL)!=0)
			{
				munmap((void *)MemLicense,SHMEMSIZE);
				close(licensefd);
				pthread_mutex_unlock(loaded_license_mutex);
				return(FALSE);
			}
			MemLicense->size=(SHMEMSIZE-sizeof(int)*2-sizeof(pthread_mutex_t))/(sizeof(process_id_count_t)-1);
			MemLicense->count=0;
			memset(MemLicense->processes,0,MemLicense->size*sizeof(process_id_count_t));
		}
#endif	/* 0 */
/* *************************************************************** */

		guiLoadedLicenseShare=1;
	}
	pthread_mutex_unlock(loaded_license_mutex);
	//Lock the memory with pthread_lock on the mutex
	if (pthread_mutex_lock(&(MemLicense->pid_mutex))!=0)
	{
		perror("cannot lock memlicense->pidmutex");
		shmdt(MemLicense);
		if (file_exists==0)
		{
			shmctl(shared_mem_id,IPC_RMID,0);
		}
		return(FALSE);
	}
	//add pid and encrypted number of licenses to the file
	index=-1;
	cur_pid=getpid();
	for (i=0;i<MemLicense->count;i++)
	{
		allocated_licenses+=MemLicense->processes[i].count;
		if (cur_pid==MemLicense->processes[i].pid)
		{
			index=i;
		}
	}
	if (allocated_licenses<max_licenses)
	{
		if (index==-1)
		{
			if (MemLicense->count==MemLicense->size)
			{
				pthread_mutex_unlock(&(MemLicense->pid_mutex));
				shmdt(MemLicense);
				if (file_exists==0)
				{
					shmctl(shared_mem_id,IPC_RMID,0);
				}
				pthread_mutex_lock(loaded_license_mutex);
				MemLicense=NULL;
				guiLoadedLicenseShare=0;
				pthread_mutex_unlock(loaded_license_mutex);
				return(FALSE);
			}
			index=MemLicense->count;
			MemLicense->processes[index].pid=getpid();
			MemLicense->processes[index].count=0;
			MemLicense->count++;
		}
		MemLicense->processes[index].count++;
	}
	else
	{
		//look for a process that has died to find out if there are
		// any available licenses
		old_count=MemLicense->count;
		for (i=0;i<MemLicense->count;i++)
		{
			sprintf(filename,"/proc/%d",MemLicense->processes[i].pid);
			
			if (stat(filename,&stat_buf)<0)
			{
				for (j=i;j<MemLicense->count-1;j++)
				{
					MemLicense->processes[j].pid=MemLicense->processes[j+1].pid;
					MemLicense->processes[j].count=MemLicense->processes[j+1].count;
				}
				i--;
				MemLicense->count--;
			}
		}
		if (old_count==MemLicense->count)
		{
			// no processes have died so there are no more licenses
			pthread_mutex_unlock(&(MemLicense->pid_mutex));
			if (index==-1)
			{
				pthread_mutex_lock(loaded_license_mutex);
				shmdt(MemLicense);
				if (file_exists==0)
				{
					shmctl(shared_mem_id,IPC_RMID,0);
				}
				guiLoadedLicenseShare=0;
				MemLicense=NULL;
				pthread_mutex_unlock(loaded_license_mutex);
			}
			return(FALSE);
		}
		//recount the licenses because there was a process that died
		allocated_licenses=0;
		index=-1;
		for (i=0;i<MemLicense->count;i++)
		{
			allocated_licenses+=MemLicense->processes[i].count;
			if (cur_pid==MemLicense->processes[i].pid)
			{
				index=i;
			}
		}
		if (allocated_licenses<max_licenses)
		{
			if (index==-1)
			{
				index=MemLicense->count;
				if (MemLicense->count==MemLicense->size)
				{
					pthread_mutex_unlock(&(MemLicense->pid_mutex));
					pthread_mutex_lock(loaded_license_mutex);
					shmdt(MemLicense);
					if (file_exists==0)
					{
						shmctl(shared_mem_id,IPC_RMID,0);
					}
					guiLoadedLicenseShare=0;
					MemLicense=NULL;
					pthread_mutex_unlock(loaded_license_mutex);
					return(FALSE);
				}
				MemLicense->processes[index].pid=getpid();
				MemLicense->processes[index].count=0;
				MemLicense->count++;
			}
			MemLicense->processes[index].count++;
		}
		else
		{
			pthread_mutex_unlock(&(MemLicense->pid_mutex));
			if (index==-1)
			{
				pthread_mutex_lock(loaded_license_mutex);
				shmdt(MemLicense);
				if (file_exists==0)
				{
					shmctl(shared_mem_id,IPC_RMID,0);
				}
				guiLoadedLicenseShare=0;
				MemLicense=NULL;
				pthread_mutex_unlock(loaded_license_mutex);
			}
			return(FALSE);
		}
	}
	pthread_mutex_unlock(&(MemLicense->pid_mutex));
#endif // #ifndef VXWORKS
	return(TRUE);
}


			
			//check to see if the process exists
			//if it doesn't exist, remove the entry from the list
		
	

	
	// if there are not more licenses available, check each pid to see if the 
	// processes still exist, if not, remove the entry from by overwriting it 
	//



void ReleaseLicenseRef(int *a32_lic)
{
#ifndef VXWORKS
	int i,j,k;
	int cur_pid;
	int index;
	//check to make sure the the license share is loaded
	if (!guiLoadedLicenseShare)
	{
		return;
	}

	//lock the MemLicense mutex
	if (pthread_mutex_lock(&(MemLicense->pid_mutex))!=0)
	{
		return;
	}
	// find the current process in the list
	cur_pid=getpid();
	index=-1;
	for (i=0;i<MemLicense->count;i++)
	{
		if (MemLicense->processes[i].pid==cur_pid)
		{
			index=i;
		}
	}
	if (index==-1)
	{
		//the current process is not in the list
		// print an error (maybe blow up!!!)
		pthread_mutex_unlock(&(MemLicense->pid_mutex));
		return;
	}
	// actually release the license
	MemLicense->processes[index].count--;
	if (MemLicense->processes[index].count==0)
	{
		// this process has no more licenses in the list, remove the entry
		for (i=index;i<MemLicense->count-1;i++)
		{
			MemLicense->processes[i].pid=MemLicense->processes[i+1].pid;
			MemLicense->processes[i].count=MemLicense->processes[i+1].count;
		}
		MemLicense->processes[i].pid=0;
		MemLicense->processes[i].count=0;
		MemLicense->count--;
		// the entire locense share is empty, unmap the file and remove it from disk
		if (MemLicense->count==0)
		{
			if (pthread_mutex_lock(loaded_license_mutex)!=0)
			{
				pthread_mutex_unlock(&(MemLicense->pid_mutex));
				return;
			}
			pthread_mutex_unlock(&(MemLicense->pid_mutex));
			shmdt(MemLicense);
			shmctl(shared_mem_id,IPC_RMID,0);
			// set the loaded license share to 0
			guiLoadedLicenseShare=0;
			MemLicense=NULL;
			pthread_mutex_unlock(loaded_license_mutex);
			return;
		}			
	}
	//unlock the license mutex
	pthread_mutex_unlock(&(MemLicense->pid_mutex));
#endif
}



#endif /* LICENSES (1) */
#endif /* __linux__ (1) */

MMRESULT TextToSpeechStartupEx( LPTTS_HANDLE_T * pphTTS,
							   UINT uiDeviceNumber,
							   DWORD dwDeviceOptions,
							   VOID (*DtCallbackRoutine)(LONG,LONG,DWORD,UINT),
							   LONG dwTTSInstanceParameter)
{


return TextToSpeechStartupExFonix( pphTTS,
							   uiDeviceNumber,
							   dwDeviceOptions,
							   DtCallbackRoutine,
							   dwTTSInstanceParameter,
							   NULL);
}

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
/*    WAVERR_BADFORMAT       A wave device exists, but does not support*/
/*                           the required format.                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#define  STARTUP_LOOP_WAIT_TIME   50
#define  MAX_STARTUP_WAIT_COUNT  200

MMRESULT TextToSpeechStartupExFonix( LPTTS_HANDLE_T * pphTTS,
							   UINT uiDeviceNumber,
							   DWORD dwDeviceOptions,
							   VOID (*DtCallbackRoutine)(LONG,LONG,DWORD,UINT),
							   LONG dwTTSInstanceParameter,
#ifdef WIN32
							   TCHAR *dictionary_file_name)
#else
							   char *dictionary_file_name)
#endif
{
	MMRESULT mmStatus;
	UINT i;
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	int  productIndex; /* Index into product license list */
#endif	/* defined __osf__ || defined __linux__ */
	
#if defined OLEDECTALK || defined SAPI5DECTALK
	LPAUDIO_HANDLE_T pPlayAudio;
#else
	HPLAY_AUDIO_T pPlayAudio;         //New audio Integration
#endif	/* defined OLEDECTALK || defined SAPI5DECTALK */
	
#ifndef SAPI5DECTALK
	LPWAVEFORMATEX pWaveFormat;	// 01aug97 bats423: now used for both SAPI and DAPI
#endif	/* SAPI5DECTALK */

	LPTTS_HANDLE_T phTTS;
	int a32_lic=0;
	int nReturnCode;           /*MVP : a variable to hold the return value of this API*/
	
	P_PIPE cmd_pipe = NULL_PIPE;
	P_PIPE lts_pipe = NULL_PIPE;
	P_PIPE ph_pipe  = NULL_PIPE;
	P_PIPE vtm_pipe = NULL_PIPE;
	P_PIPE sync_pipe = NULL_PIPE;

#ifdef NEW_TRANSPORT
	P_PIPE new_lts_pipe = NULL_PIPE;
#endif	/* NEW_TRANSPORT */

	/* Define a variable for kernel_share_data to allocate after dynamically :MVP
	*/
	PKSD_T pKsd_t = NULL;

	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( pphTTS, sizeof(pphTTS)) || (pphTTS==NULL))
		return( MMSYSERR_INVALHANDLE );

	if ( uiDeviceNumber == NULL )
		return( MMSYSERR_INVALPARAM );	

#ifdef LICENSES
#if defined WIN32 || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#define MAX_INSTANCES_EXCEEDED  (MMSYSERR_ALLOCATED) // tek 29jul96
	if (!AddLicenseRef(&a32_lic))
	{
		return MAX_INSTANCES_EXCEEDED;
	}
#else
	/* Check for a valid license */
	mmStatus = CheckLicenses();
	if (mmStatus)
	{
		if (mmStatus == LIC_NO_MORE_UNITS)
			return (MMSYSERR_ALLOCATED);
		else
			if (mmStatus == LIC_NO_PAK)
				return (MMSYSERR_NOTENABLED);
			else
				return (MMSYSERR_ERROR);
	}
#endif /* defined WIN32 || defined __linux__ */
#endif /* LICENSES */


	/********************************************************************/
	/*  Set default parameters.                                         */
	/********************************************************************/
	
	/* 
	* Allocate kernel_share_data structure to make unique for each instance MVP
	*/
	if((pKsd_t = (PKSD_T) calloc(1,sizeof(KSD_T))) == NULL)
	{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif /* LICENSES */
		return( MMSYSERR_NOMEM );
#endif /* defined WIN32 || defined __linux__ */
	}
	
	/* GL 09/25/1997 initialize the dictionary entry */
	for (i=0; i < MAX_languages; ++i)
	{
		pKsd_t->adic_index[i] = 0;
		pKsd_t->udic_index[i] = 0;
		pKsd_t->fdic_index[i] = 0;
		pKsd_t->adic_data[i] = 0;
		pKsd_t->udic_data[i] = 0;
		pKsd_t->fdic_data[i] = 0;
		pKsd_t->adic_bytes[i] = 0;
		pKsd_t->udic_bytes[i] = 0;
		pKsd_t->fdic_bytes[i] = 0;
		pKsd_t->adic_entries[i] = 0;
		pKsd_t->udic_entries[i] = 0;
		pKsd_t->fdic_entries[i] = 0;
	}
	
	pKsd_t->cmd_flush = FALSE;
	pKsd_t->spc_flush = FALSE;
	pKsd_t->halting = FALSE;
	pKsd_t->logflag  = 0;
	/* GL 11/15/1996 set defaulted Spanish to Latin */
#ifdef SPANISH_LA
	pKsd_t->modeflag = MODE_CITATION | MODE_LATIN;
#else
	pKsd_t->modeflag = MODE_CITATION;
#endif /* SPANISH_LA */
	pKsd_t->sayflag = SAY_CLAUSE;
	pKsd_t->pronflag = 0;
	pKsd_t->wbreak = FALSE;
	pKsd_t->text_flush = FALSE;
	pKsd_t->async_change = FALSE;
	pKsd_t->SamplePeriod = 9.07029478458E-5 ;  /* Initialize sample period */
	pKsd_t->spc_pkt_save = NULL_SPC_PACKET;
	pKsd_t->loaded_languages = NULL;           //MVP:05/10/96 Fixed an exception(When DECtalk runs on a machine without audio card)
	pKsd_t->volume=100; //set volume to 100;
	pKsd_t->vol_att=100; //set volume to 100;
	/********************************************************************/
	/*  Create the TTS handle.                                          */
	/********************************************************************/

	phTTS = (LPTTS_HANDLE_T )calloc(1,sizeof(TTS_HANDLE_T));

	if ( phTTS == NULL )
	{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif /* LICENSES */
#endif /* defined WIN32 || defined __linux__ */
		free(pKsd_t);			// tek 23sep96 plug memory leak
		pKsd_t = NULL;
		return( MMSYSERR_NOMEM );
	}
	// tek 20aug98 fill in the back pointer in kernel_share
	pKsd_t->phTTS = phTTS;
	
	phTTS->dwDeviceOptions = dwDeviceOptions;

	if (dictionary_file_name==NULL)
	{
		phTTS->dictionary_file_name[0]='\0';
	}
	else
	{
#ifdef UNDER_CE
		wcscpy(phTTS->dictionary_file_name, dictionary_file_name);
#else
		strcpy(phTTS->dictionary_file_name,dictionary_file_name);
#endif
	}
// MGS may not need this, but it could be used to identify which threads
// are using access32 licensing and release those licenses from only those threads.
	phTTS->a32_lic=a32_lic;
#ifdef WIN32
	// tek 13nov97 bats whatever: fix use of instance parameter as window
	if (dwDeviceOptions&TTSSTARTUP_USING_DEFAULT_CALLBACK)
	{
#endif	/* WIN32 */ 
		phTTS->hWnd = (HWND)dwTTSInstanceParameter;  //Backward compatibilty for TextToSpeechStartupEx

#ifdef WIN32
	}
	else
	{
		phTTS->hWnd = NULL; // the instance param is just that!
	}
#endif	/* WIN32 */
	
	phTTS->uiCurrentMsgNumber = 1;
	phTTS->uiLastTextMsgNumber = 0;
	phTTS->uiFlushMsgNumber = 0;

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->uiLastQueuedTextMsgNumber = 0; // tek 01sep98
	phTTS->uiTextThreadExit = FALSE;
	phTTS->bInReset = FALSE;
	phTTS->uiID_Error_Message = TTS_MSG_STATUS;
	phTTS->uiID_Index_Message = TTS_MSG_INDEX_MARK;
	phTTS->uiID_Buffer_Message = TTS_MSG_BUFFER;
	phTTS->uiID_Visual_Message = 0xDEADC0DE;
	//phTTS->uiID_Bookmark_Message = TTS_MSG_BOOKMARK;
	//phTTS->uiID_Wordpos_Message = TTS_MSG_WORDPOS;
	//phTTS->uiID_Start_Message = TTS_MSG_START;
	//phTTS->uiID_Stop_Message = TTS_MSG_STOP;
	//phTTS->uiID_Sentence_Message = TTS_MSG_SENTENCE;

	phTTS->bInReset = FALSE;
#endif	/* defined __osf__ || defined __linux__  */

	phTTS->dwQueuedSampleCount = 0;
	phTTS->uiQueuedCharacterCount = 0;
	phTTS->dwOutputState = STATE_OUTPUT_NULL;
	phTTS->bEnableErrorMessage = TRUE;
	phTTS->bMemoryReset = FALSE;
	phTTS->szPhonemeBuffer = NULL; // tek 19aug98 ConvertToPhonemes
	phTTS->dwPhonemeCvtFlags = 0;	// 20aug98 ConvertToPhonemes
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
	phTTS->pcsMemoryBuffer = NULL;
	phTTS->hTuneStopEvent=NULL;

	phTTS->pcsBufferPipe = NULL;

	phTTS->hThread_TXT = NULL;
	phTTS->hThread_CMD = NULL;
#ifndef SINGLE_THREADED
	phTTS->hThread_LTS = NULL;
	phTTS->hThread_PH = NULL;
	phTTS->hThread_VTM = NULL;
#endif
	phTTS->hThread_SYNC = NULL;	

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->hTextInQueueEvent = NULL;
	phTTS->pcsTextMsgList = NULL;
#endif	/* defined __osf__ || defined __linux__ */

#ifdef NOWIN
	phTTS->hTextInQueueEvent = NULL;
	phTTS->pcsTextMsgList = NULL;
	phTTS->uiLastQueuedTextMsgNumber = 0; // tek 01sep98
	phTTS->uiTextThreadExit = FALSE;
#endif
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
#endif /* TYPING_MODE */

	/*********************************************************************/
	/*  Initialize Instance specific CallbackFunction,Instance parameter */
	/*  MVP : 05/08/96                                                   */
	/*********************************************************************/
	phTTS->DtCallbackRoutine = DtCallbackRoutine;
	phTTS->dwTTSInstanceParameter = dwTTSInstanceParameter;

#ifdef WIN32
	phTTS->hmxCallback = NULL;
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsCallback = NULL;
#endif	/* defined __osf__ || defined __linux__ */

	/********************************************************************/
	/*  Create the queued sample count critical section.                */
	/********************************************************************/
#ifdef WIN32
	phTTS->pcsQueuedSampleCount =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsQueuedSampleCount = OP_CreateMutex();
#endif	/* defined __osf__ || defined __linux__ */

	if ( phTTS->pcsQueuedSampleCount == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */
		return( MMSYSERR_NOMEM );
	}
	
#ifdef WIN32
#ifdef DTALK50
	phTTS->CPanelThread = CPInitAPI();
#endif	/* DTALK50 */
	
	InitializeCriticalSection( phTTS->pcsQueuedSampleCount );
#endif /* WIN32 */

	/********************************************************************/
	/*  Create the 'Buffer Pipe' mutex.                                 */
	/********************************************************************/
	
#ifdef WIN32
	phTTS->pcsBufferPipe =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif	/* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsBufferPipe = OP_CreateMutex();
#endif	/* defined __osf__ || defined __linux__ */

	if ( phTTS->pcsBufferPipe == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}

#ifdef WIN32
	InitializeCriticalSection( phTTS->pcsBufferPipe );
#endif /* WIN32 */
	
	/********************************************************************/
	/*  Create the 'Text List' mutex.                                   */
	/********************************************************************/
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
	
	phTTS->pcsTextMsgList = OP_CreateMutex();
	
	if ( phTTS->pcsTextMsgList == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);
#endif	/* LICENSES */
#endif	/*	__linux__ */

		return( MMSYSERR_NOMEM );
	}
#endif /* defined __osf__ || defined __linux__ */
	
	/********************************************************************/
	/*  Create the last queued text message number critical section.    */
	/********************************************************************/
#ifdef WIN32
	phTTS->pcsLastQueuedTextMsgNumber =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif	/* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsLastQueuedTextMsgNumber = OP_CreateMutex();
#endif /* defined __osf__ || defined __linux__ */
	
	if ( phTTS->pcsLastQueuedTextMsgNumber == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif /* defined WIN32 || defined __linux__ */
		return( MMSYSERR_NOMEM );
	}
	
#ifdef WIN32
	InitializeCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );
#endif /* WIN32 */
	
	/********************************************************************/
	/*  Create the flush message number critical section.               */
	/********************************************************************/
	
#ifdef WIN32
	phTTS->pcsFlushMsgNumber =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsFlushMsgNumber = OP_CreateMutex();
#endif	/* defined __osf__ || defined __linux__ */
	
	
	if ( phTTS->pcsFlushMsgNumber == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif /* LICENSES */
#endif /* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
	
#ifdef WIN32
	InitializeCriticalSection( phTTS->pcsFlushMsgNumber );
#endif /* WIN32 */

	/********************************************************************/
	/*  Create the queued character count critical section.             */
	/********************************************************************/
	
#ifdef WIN32
	phTTS->pcsQueuedCharacterCount =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsQueuedCharacterCount = OP_CreateMutex();
#endif	/* defined __osf__ || defined __linux__ */

	
	if ( phTTS->pcsQueuedCharacterCount == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif /* LICENSES */
#endif /* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
	
#ifdef WIN32
	InitializeCriticalSection( phTTS->pcsQueuedCharacterCount );
#endif /* WIN32 */
	
//#ifdef WIN32 /* WIN32 (2) */
	/* tek 6mar97 bats 278 */
	/********************************************************************/
	/*  Create the index list critical section.                         */
	/********************************************************************/
	
#ifdef WIN32 
	pKsd_t->pcsSpcPktSave =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	pKsd_t->pcsSpcPktSave=OP_CreateMutex();
#endif
	
	if ( pKsd_t->pcsSpcPktSave == NULL )
	{
#if defined WIN32 || defined __linux__
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic); // tek 23sep96
#endif	/* LICENSES */
#endif

		DeleteTextToSpeechObjects( phTTS );
		return( MMSYSERR_NOMEM );
	}
#ifdef WIN32
	InitializeCriticalSection( pKsd_t->pcsSpcPktSave );
#endif
	
	/* end 6mar97 bats 278 */
	
	/********************************************************************/
	/*  Create the vtm pipe read critical section.                      */
	/********************************************************************/
	// tek 09jun97 needed to allow fast flushing of the  VTM
#ifndef SINGLE_THREADED
#ifdef WIN32
	pKsd_t->pcsVtmPipeRead =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	pKsd_t->pcsVtmPipeRead=OP_CreateMutex();
#endif
	
	if ( pKsd_t->pcsVtmPipeRead == NULL )
	{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic); // tek 23sep96
#endif	/* LICENSES */
#endif

		DeleteTextToSpeechObjects( phTTS );
		return( MMSYSERR_NOMEM );
	}
#ifdef WIN32
	InitializeCriticalSection( pKsd_t->pcsVtmPipeRead );
#endif
#endif // #ifndef SINGLE_THREADED
//#endif /* WIN32 (2) */
	/********************************************************************/
	/*  Create the log file critical section.                           */
	/********************************************************************/
#ifdef WIN32
	phTTS->pcsLogFile =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif /* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsLogFile = OP_CreateMutex();
#endif /* defined __osf__ || defined __linux__ */
	
	if ( phTTS->pcsLogFile == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
	
#ifdef WIN32
	InitializeCriticalSection( phTTS->pcsLogFile );
#endif	/* WIN32 */

	/********************************************************************/
	/*  Create a "Sync" event. The initial state is not signaled.       */
	/********************************************************************/

	phTTS->hSyncEvent = CreateEvent( NULL, TRUE, FALSE, NULL );
	
	if ( phTTS->hSyncEvent == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
	
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
	
	/********************************************************************/
	/*  Create a "Text in Queue" event. The initial state is not signaled.*/
	/********************************************************************/
	
	phTTS->hTextInQueueEvent = OP_CreateEvent( TRUE, FALSE );
	
	if ( phTTS->hTextInQueueEvent == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );
		return( MMSYSERR_NOMEM );
	}
#endif /* defined __osf__ || defined __linux__ */
	
	/********************************************************************/
	/*  Create a "Not Emptying Vtm Pipe" event. The initial state is    */
	/*  signaled.                                                       */
	/********************************************************************/
	
	phTTS->hNotEmptyingVtmPipeEvent = CreateEvent( NULL, TRUE, TRUE, NULL );

	if ( phTTS->hNotEmptyingVtmPipeEvent == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
	
	/*******************************************************************/
	/*  Create the TTS callback mutex.                                 */
	/*******************************************************************/
	
	if ( DtCallbackRoutine != NULL )
	{
#ifdef WIN32
		phTTS->hmxCallback = OP_CreateMutex();
		if ( phTTS->hmxCallback == NULL )
#endif	/* WIN32 */

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			phTTS->pcsCallback = OP_CreateMutex();
		if ( phTTS->pcsCallback == NULL )
#endif	/* defined __osf__ || defined __linux__ */

		{
			DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

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

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
	
	/********************************************************************/
	/*  Initialize the inter-thread communication pipes.                */
	/********************************************************************/
	
	cmd_pipe = create_pipe( BYTE_PIPE, CMD_PIPE_LENGTH );
	
	if ( cmd_pipe == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
#ifndef SINGLE_THREADED
	lts_pipe = create_pipe( WORD_PIPE, LTS_PIPE_LENGTH );
	
	if ( lts_pipe == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
	
#ifdef NEW_TRANSPORT
	new_lts_pipe = create_pipe( DWORD_PIPE, LTS_PIPE_LENGTH );
	
	if ( new_lts_pipe == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
#endif	/* NEW_TRANSPORT */


	ph_pipe = create_pipe( WORD_PIPE, PH_PIPE_LENGTH );
	
	if ( ph_pipe == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}

	vtm_pipe = create_pipe( WORD_PIPE, VTM_PIPE_LENGTH );
	
	if ( vtm_pipe == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

		return( MMSYSERR_NOMEM );
	}
#endif // #ifndef SINGLE_THREADED

	sync_pipe = create_pipe( DWORD_PIPE, SYNC_PIPE_LENGTH );
	
	if ( sync_pipe == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

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
#ifndef SINGLE_THREADED
		pKsd_t->lang_lts[i] = NULL_PIPE;
		pKsd_t->lang_ph[i]  = NULL_PIPE;
#endif
		pKsd_t->lang_ready[i] = 0;
	}
	
	/* GL 04/21/1997 add code to support the local language pipe */
#ifndef SINGLE_THREADED
	pKsd_t->lang_lts[0] = lts_pipe;
	pKsd_t->lang_ph[0] = ph_pipe;
#endif
	
#ifndef SINGLE_THREADED
	pKsd_t->lts_pipe = pKsd_t->lang_lts[0];
	pKsd_t->ph_pipe = pKsd_t->lang_ph[0];
#endif
	
	pKsd_t->cmd_pipe = cmd_pipe;
#ifndef SINGLE_THREADED
	pKsd_t->vtm_pipe = vtm_pipe;
#endif
	pKsd_t->sync_pipe = sync_pipe;
	
	/*
	GL 12/11/1996, set up the language flag pKsd_t->lang_curr
	this flag will be used in CMD and phlog.c to pick up the language
	depended code
	*/
#ifdef ENGLISH_US
	pKsd_t->lang_curr = LANG_english;
#endif	/* ENGLISH_US */
#ifdef ENGLISH_UK
	pKsd_t->lang_curr = LANG_british;
#endif	/* ENGLISH_UK */
#ifdef SPANISH_SP
  pKsd_t->lang_curr = LANG_spanish;
#endif	/* SPANISH_SP */
#ifdef SPANISH_LA
  pKsd_t->lang_curr = LANG_latin_american;
#endif	/* SPANISH_LA */
#ifdef GERMAN
	pKsd_t->lang_curr = LANG_german;
#endif	/* GERMAN */
#ifdef FRENCH
	pKsd_t->lang_curr = LANG_french;
#endif	/* FRENCH */

#ifndef SINGLE_THREADED
	pKsd_t->lang_lts[pKsd_t->lang_curr] = lts_pipe;
	pKsd_t->lang_ph[pKsd_t->lang_curr] = ph_pipe;
	
	pKsd_t->lts_pipe = pKsd_t->lang_lts[pKsd_t->lang_curr];
	pKsd_t->ph_pipe = pKsd_t->lang_ph[pKsd_t->lang_curr];
#endif

#ifdef NEW_TRANSPORT
	pKsd_t->new_lts_pipe=new_lts_pipe;
#endif	/* NEW_TRANSPORT */

#ifdef CUP28PROJECT
	phTTS->uiID_Error_Message = TTS_MSG_STATUS;
	phTTS->uiID_Index_Message = TTS_MSG_INDEX_MARK;
	phTTS->uiID_Buffer_Message = TTS_MSG_BUFFER;
	phTTS->uiID_Visual_Message = TTS_MSG_VISUAL;
	phTTS->uiID_Bookmark_Message = TTS_MSG_BOOKMARK;
	phTTS->uiID_Wordpos_Message = TTS_MSG_WORDPOS;
	phTTS->uiID_Start_Message = TTS_MSG_START;
	phTTS->uiID_Stop_Message = TTS_MSG_STOP;
	phTTS->uiID_Sentence_Message = TTS_MSG_SENTENCE;
#elif defined WIN32	/* WIN32 (3) */
	/********************************************************************/
	/*  Get the DECtalk error message.                                  */
	/********************************************************************/
	
  phTTS->uiID_Error_Message =

#if UNDER_CE //mfgce
	  RegisterWindowMessage(TEXT("DECtalkErrorMessage"));
#else
	  RegisterWindowMessage("DECtalkErrorMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Error_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );

#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */

		return( MMSYSERR_NOMEM );
	}
	
	/********************************************************************/
	/*  Get the DECtalk index mark message.                             */
	/********************************************************************/
	
  phTTS->uiID_Index_Message =

#ifdef UNDER_CE
	RegisterWindowMessage(TEXT("DECtalkIndexMessage"));
#else
    RegisterWindowMessage("DECtalkIndexMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Index_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );

#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */

		return( MMSYSERR_NOMEM );
	}
	
	// tek 01aug97 bats 404 register messages for 
	// bookmark, wordpos, start, stop.
	
phTTS->uiID_Bookmark_Message =

#if UNDER_CE //mfgce
	RegisterWindowMessage(TEXT("DECtalkBookmarkMessage"));
#else
    RegisterWindowMessage("DECtalkBookmarkMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Bookmark_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );

#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif /* LICENSES */

		return( MMSYSERR_NOMEM );
	}
	
phTTS->uiID_Wordpos_Message =
#if UNDER_CE //mfgce
	RegisterWindowMessage(TEXT("DECtalkWordposMessage"));
#else
	RegisterWindowMessage("DECtalkWordposMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Wordpos_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );

#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */

		return( MMSYSERR_NOMEM );
	}
	
phTTS->uiID_Start_Message =
#if UNDER_CE //mfgce
	RegisterWindowMessage(TEXT("DECtalkStartMessage"));
#else
    RegisterWindowMessage("DECtalkStartMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Start_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );

#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */

		return( MMSYSERR_NOMEM );
	}
	
	phTTS->uiID_Stop_Message =
#if UNDER_CE //mfgce
	RegisterWindowMessage(TEXT("DECtalkStopMessage"));
#else
	RegisterWindowMessage("DECtalkStopMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Stop_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );

#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */

		return( MMSYSERR_NOMEM );
	}
	
	// tek 27aug97 
  phTTS->uiID_Visual_Message =
#if UNDER_CE //mfgce
	RegisterWindowMessage(TEXT("DECtalkVisualMessage"));
#else
	RegisterWindowMessage("DECtalkVisualMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Visual_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
		return( MMSYSERR_NOMEM );
	}
	
#ifdef SAPI5DECTALK
	phTTS->uiID_Sentence_Message =
#if UNDER_CE //mfgce
	RegisterWindowMessage(TEXT("DECtalkSentenceMessage"));
#else
    RegisterWindowMessage("DECtalkSentenceMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Sentence_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
		return( MMSYSERR_NOMEM );
	}
#endif	/* SAPI5DECTALK */
	
	
	/********************************************************************/
	/*  Get the DECtalk buffer message.                                 */
	/********************************************************************/
	
  phTTS->uiID_Buffer_Message =
#if UNDER_CE //mfgce
	RegisterWindowMessage(TEXT("DECtalkBufferMessage"));
#else
    RegisterWindowMessage("DECtalkBufferMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Buffer_Message == 0 )
	{
		DeleteTextToSpeechObjects( phTTS );

#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */

		return( MMSYSERR_NOMEM );
	}
	
#endif /* WIN32 (3) */
	
	/********************************************************************/
	/*  Initialize the audio driver.                                    */
	/********************************************************************/
	
#ifndef SAPI5DECTALK	/* SAPI5DECTALK (1) */
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

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

			return( MMSYSERR_NOMEM );
		}
		
#ifndef OLEDECTALK
		/********************************************************************/
		/*  Fill in all the required fields of the WAVEFORMATEX structure.  */
		/********************************************************************/
		
		pWaveFormat->wFormatTag = WAVE_FORMAT_PCM;
//#define TUNE_8KHZ_VOICE
#ifdef TUNE_8KHZ_VOICE
		pWaveFormat->nSamplesPerSec = MULAW_SAMPLE_RATE;
#else
		pWaveFormat->nSamplesPerSec = PC_SAMPLE_RATE;
#endif	/* TUNE_8KHZ_VOICE */

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
#else	/* OLEDECTALK */
		/*******************************************************/
		/* Initialize the DECtalk audio system for OLE-DECTALK */
		/*******************************************************/
			      mmStatus = InitializeDECtalkAudio((HWND)dwTTSInstanceParameter,&pPlayAudio);
#endif /* OLEDECTALK */
		
		if ( mmStatus )
		{

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

			free( pWaveFormat ); // bats423
			DeleteTextToSpeechObjects( phTTS );
#ifdef API_DEBUG
			OutputDebugString("ttsapi: error initializing audio\n");
#endif /* API_DEBUG */

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
#endif	/* DONT_RETURN_BADFORMAT */
			else
				return( mmStatus );
		}
		
		phTTS->pAudioHandle = pPlayAudio;
		phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
		// tek 01aug97 bats423 init some stuff for later use here..

#ifdef OLEDECTALK
		phTTS->pAudioHandle->pcMode = NULL; // this gets filled in later.
#endif	/* OLEDECTALK */

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

#else /* SAPI5DECTALK (1) */

	if (( dwDeviceOptions & USE_SAPI5_AUDIO_DEVICE ) != 0 )
	{
		mmStatus = InitializeDECtalkAudio((HWND)dwTTSInstanceParameter,&pPlayAudio);
		if ( mmStatus )
		{

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif	/* LICENSES */
#endif	/* defined WIN32 || defined __linux__ */

			DeleteTextToSpeechObjects( phTTS );

			if ( mmStatus == MMSYSERR_ERROR ) // tek 24sep96
			{
				return( MMSYSERR_NODRIVER );
			}
			else
			{
				return( mmStatus );
			}
		}
		phTTS->pAudioHandle = pPlayAudio;
		phTTS->dwOutputState = STATE_OUTPUT_NULL;
		// tek 01aug97 bats423 init some stuff for later use here..
		pPlayAudio->dMsecPerSample = 
			(double)(1000)/(double)(22050);  // 11025 *2
	}


#endif /* SAPI5DECTALK (1) */
	
	/********************************************************************/
	/*  Start the Synchronization thread.                               */
	/********************************************************************/

	if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_SYNC),

#ifdef WIN32
		FALSE,(start_address)sync_main))== MMSYSERR_NOMEM)
#endif	/* WIN32 */

#if defined __osf__ || defined __linux__  || defined VXWORKS || defined _SPARC_SOLARIS_
		FALSE, sync_main))== MMSYSERR_NOMEM)
#endif
	{
#if defined WIN32 || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif // LICENSES
#endif
		return(MMSYSERR_NOMEM);
	}
#ifdef SINGLE_THREADED
	if (vtm_main(phTTS)==MMSYSERR_NOMEM)
	{
		DeleteTextToSpeechObjects( phTTS );

#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
	}
#else
	/********************************************************************/
	/*  Start the Vocal Tract Model thread.                             */
	/********************************************************************/
	if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_VTM),
#ifdef WIN32
		TRUE,(start_address)vtm_main))== MMSYSERR_NOMEM)
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		TRUE, vtm_main))== MMSYSERR_NOMEM)
#endif
	{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
		return(MMSYSERR_NOMEM);
	}
#endif // #ifdef SINGLE_THREADED
	/********************************************************************/
	/*  Start the Phonetic processing thread. */
#ifdef SINGLE_THREADED
	if (ph_main(phTTS)==MMSYSERR_NOMEM)
	{
		DeleteTextToSpeechObjects( phTTS );
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
	}
#else
	/********************************************************************/
	if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_PH),
#ifdef WIN32
		TRUE, (start_address)ph_main))== MMSYSERR_NOMEM)
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		TRUE, ph_main))== MMSYSERR_NOMEM)
#endif
	{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
		ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif 
		return(MMSYSERR_NOMEM);
	}
	
#endif // #ifdef SINGLE_THREADED

#ifdef TYPING_MODE	 //09jun97 tek
	// elevate the PH and VTM thread priority
	if (phTTS->dwOutputState == STATE_OUTPUT_AUDIO)
	{
		// 19nov97 VTM adjusts the priority of both PH and VTM, so we
		// set it high to start and then let it back down automagically
#if !defined UNDER_CE && !defined VXWORKS
#ifndef SINGLE_THREADED
		OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_HIGHEST);
		OP_SetThreadPriority((phTTS->hThread_VTM),OP_PRIORITY_HIGHEST);
#endif
#endif
	}
#if !defined UNDER_CE && !defined VXWORKS
	OP_SetThreadPriority((phTTS->hThread_SYNC),OP_PRIORITY_ABOVE_NORMAL);
#endif
#endif //TYPING_MODE
	
	/********************************************************************/
	/*  Start the Letter To Sound thread.                               */
	/********************************************************************/
#ifdef SINGLE_THREADED
	if ((nReturnCode=lts_main(phTTS)))
	{
		DeleteTextToSpeechObjects( phTTS );
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
			return(nReturnCode);
	}
#else
	nReturnCode = StartDecTalkSystemThread(phTTS, &(phTTS->hThread_LTS),
#ifdef WIN32
		TRUE,(start_address)lts_main);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		TRUE, lts_main);			
#endif
		if(nReturnCode == MMSYSERR_NOMEM ||
			nReturnCode == MMSYSERR_INVALPARAM ||
			nReturnCode == MMSYSERR_ERROR )
		{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
			return(nReturnCode);
		}
#endif // SINGLE_THREADED	
		/********************************************************************/
		/*  Start the Command thread.                                       */
		/********************************************************************/
		if((StartDecTalkSystemThread(phTTS, &(phTTS->hThread_CMD),
#ifdef WIN32
			TRUE,(start_address)cmd_main))== MMSYSERR_NOMEM)
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			TRUE, cmd_main))== MMSYSERR_NOMEM)
#endif
		{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
			return(MMSYSERR_NOMEM);
		}
		
		/********************************************************************/
		/*  Start the Text Queueing thread.                                 */
		/********************************************************************/
		phTTS->hTextToSpeechWnd = (int)NULL;
		
		nReturnCode = StartDecTalkSystemThread(phTTS, &(phTTS->hThread_TXT),
#ifdef WIN32
			TRUE,(start_address)TextToSpeechThreadMain);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		TRUE, TextToSpeechThreadMain);
#endif
		if(nReturnCode == MMSYSERR_NOMEM ||
			nReturnCode == MMSYSERR_ERROR)
		{
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
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
#if defined WIN32 || defined __linux__ || defined _SPARC_SOLARIS_
#ifdef LICENSES
				ReleaseLicenseRef(&a32_lic);	
/* tek 23sep96 give back the license unit */
#endif //LICENSES
#endif
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
#if defined WIN32 || defined __linux__   || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
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
#if defined WIN32 || defined __linux__  || defined _SPARC_SOLARIS_
#ifdef LICENSES
				ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
				return( MMSYSERR_NOMEM );
			}
		}
		
		if ( phTTS->hThread_TXT == NULL )
		{
			DeleteTextToSpeechObjects( phTTS );
#if defined WIN32 || defined __linux__  || defined _SPARC_SOLARIS_
#ifdef LICENSES
			ReleaseLicenseRef(&a32_lic);	// tek 23sep96 give back the license unit
#endif //LICENSES
#endif
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
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		gnInstanceCounter++;
#endif
		
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
#ifdef FRENCH
		TextToSpeechSpeak(phTTS, "DECtalk bêta S D K version 4.4a fonctionne. Pour l'évaluation seulement.", TTS_FORCE);
#endif //ENGLISH
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

#ifndef WIN32

MMRESULT TextToSpeechStartup( LPTTS_HANDLE_T * pphTTS,
							 UINT uiDeviceNumber,
							 DWORD dwDeviceOptions,
							 VOID (*DtCallbackRoutine)(LONG,LONG,DWORD,UINT),
							 LONG dwTTSInstanceParameter)
{
	
	
	return(TextToSpeechStartupEx(pphTTS,
		uiDeviceNumber,
		dwDeviceOptions,
		DtCallbackRoutine,	
		dwTTSInstanceParameter));
}
#else

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

/* GL 11/19/1998, the following codes never get used */

/* ******************** NOT USED ********************************* */
#if 0

	/********************************************************************/
	/*  Get the DECtalk error message.                                  */
	/********************************************************************/
	
	phTTS->uiID_Error_Message =
	  RegisterWindowMessage("DECtalkErrorMessage");
	
	if ( phTTS->uiID_Error_Message == 0 )
	{
	    DeleteTextToSpeechObjects( phTTS );
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
	    return( MMSYSERR_NOMEM );
	}
#endif // 0
/* *************************************************************** */

}


VOID DefaultTTSCallbackRoutine(LONG lParam1,
							   LONG lParam2,
							   DWORD dwInstanceParam,
							   UINT uiMsg)
{
#ifdef API_DEBUG
	char szTemp[256]="";
	ULONG ulStartTime,ulEndTime;
	ulStartTime=timeGetTime();
	sprintf(szTemp, "DTTSCallback(%ld) at %ld.\n", lParam1,ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	
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

#endif /* ifndef WIN32 */
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

#ifdef WIN32
static int StartDecTalkSystemThread(LPTTS_HANDLE_T phTTS,PHANDLE ppDecTalkThread,
BOOL bMalloc, start_address ThreadFunction )
#endif
#if defined __osf__ || defined __linux__  || defined VXWORKS || defined _SPARC_SOLARIS_
static int StartDecTalkSystemThread(LPTTS_HANDLE_T phTTS, HTHREAD_T *ppDecTalkThread,
BOOL bMalloc, OP_THREAD_ROUTINE(ThreadFunction, LPTTS_HANDLE_T phTTS))
#endif
{
	UINT IDThread;
	DWORD cNumObjects =2;
#if !defined __osf__ && !defined __linux__   && !defined VXWORKS && !defined _SPARC_SOLARIS_
	DT_HANDLE WaitObjArray[2];
	ULONG exit_code ;
#endif
	/*typedef int ( * _stdcall Stdstart_address ) (void *);*/
	
#ifdef WIN32
	*ppDecTalkThread = (DT_HANDLE) _beginthreadex(NULL,
								0,
								ThreadFunction,             
								(void *)phTTS,                                   
								0,
								&IDThread
								);
#endif
#if defined __osf__ || defined __linux__  || defined _SPARC_SOLARIS_
	*ppDecTalkThread = OP_CreateThread(0,
					   ThreadFunction,             
					   (void *)phTTS);
#endif
#if defined VXWORKS
	*ppDecTalkThread = OP_CreateThread(0,
					   (void (*)(void *))ThreadFunction,             
					   (void *)phTTS);
#endif
	
	if ( *ppDecTalkThread == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );
		return( MMSYSERR_NOMEM );
	}
	
	if(bMalloc == FALSE)          /* No dynamic memory allocations within thread main function */
		return MMSYSERR_NOERROR;  /*No errors */
#if !defined __osf__ && !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
	WaitObjArray[0] = *ppDecTalkThread;
	WaitObjArray[1] = phTTS->hMallocSuccessEvent;
	
	WaitForMultipleObjects(cNumObjects,WaitObjArray,FALSE,INFINITE); 
	
	GetExitCodeThread(*ppDecTalkThread,&exit_code);
#endif /* __osf__ && __linux__ */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	OP_WaitForEvent( phTTS->hMallocSuccessEvent, OP_INFINITE );
#endif
	
#if !defined __osf__ && !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
	if(exit_code == MMSYSERR_NOMEM ||
		exit_code == MMSYSERR_INVALPARAM ||
		exit_code == MMSYSERR_ERROR )
	{
		DeleteTextToSpeechObjects( phTTS );
		return(exit_code);
	}
	
	return MMSYSERR_NOERROR;    /*No errors */
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	if (phTTS->uiThreadError != MMSYSERR_NOERROR)
		DeleteTextToSpeechObjects( phTTS );
	
	return (phTTS->uiThreadError);
#endif
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
	int a32_lic;
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );
	
	/********************************************************************/
	/*  If the last item in the TextToSpeechStartup() function was      */
	/*  initialized then reset the the Text-To-Speech system.           */
	/********************************************************************/
	
	/* The if statement is not reqd as phTTSglobal is going to be oboselete for MI :MVP */
	/*if ( phTTSglobal != NULL )*/
	phTTS->pKernelShareData->debug_switch = 0;
#ifdef WIN32
#ifdef _DEBUG
#ifndef UNDER_CE
	// close the debug window...
	if (DbgWindow)
		SendMessage(DbgWindow,WM_DESTROY,0,0);
#endif
#endif
#endif // WIN32
	TextToSpeechReset( phTTS, TRUE );
	
	a32_lic=phTTS->a32_lic;

#ifdef DTALK50
	CPUnitAPI(phTTS->CPanelThread);       // Remove the Control Panel - KSB
#endif //DTALK50
	
	/********************************************************************/
	/*  Delete any objects created by the TextToSpeechInMemory().       */
	/*  function.                                                       */
	/********************************************************************/


	if ( phTTS->dwOutputState == STATE_OUTPUT_MEMORY )
		TextToSpeechCloseInMemory( phTTS );
	
#ifdef SAPI5DECTALK
	if (phTTS->dwOutputState == STATE_OUTPUT_SAPI5)
		TextToSpeechCloseSapi5Output(phTTS);
#endif
	
	/********************************************************************/
	/*  Delete all objects created in the TextToSpeechStartup()         */
	/*  function.                                                       */
	/********************************************************************/
	// tek bats668 12may98 this must be decremented here to make sure 
	// the dictionary gets unloaded.
	// tek 27may98 bats 689:
	// we need to lock around this to make sure we don't end up with a 
	// startup and a shutdown colliding
#if 0 // MGS Fonix server fix
#ifdef WIN32
	ThreadLock(&tl_gnInstanceCounter,5); // tek 27may98 bats 689
#endif
	gnInstanceCounter--;     /* MVP: Decrement the instance counter */
	
#endif // 0
	DeleteTextToSpeechObjects( phTTS );
	
#if 0 // MGS Fonix server fix
#ifdef WIN32
	ThreadUnlock(&tl_gnInstanceCounter); // tek 27may98 bats 689
#endif
#endif // 0
	
	// release the license count..
#if defined WIN32 || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef LICENSES
	ReleaseLicenseRef(&a32_lic);
#endif //LICENSES
#endif
	
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
#ifdef WIN32
	HINSTANCE hInstance;	// 06may97 BATS320   
#ifndef	UNDER_CE 
	char wndclass[255];	// Window Class (KSB Aug-13-97)
#else
	static TCHAR wndclass[255];
#endif
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
	THREAD_STATUS_T ThreadStatus;
#endif
	
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
#ifdef WIN32
			WaitForSingleObject( phTTS->hThread_SYNC,
				TIMEOUT_INTERVAL_IN_MSEC );
			
			CloseHandle( phTTS->hThread_SYNC );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_WaitForThreadTermination( phTTS->hThread_SYNC,
				&ThreadStatus,
				TIMEOUT_INTERVAL_IN_MSEC );
#endif
		}
		
		/******************************************************************/
		/*  Shut down the VTM thread.                                     */
		/******************************************************************/
		
#ifndef SINGLE_THREADED
		if ( phTTS->hThread_VTM != NULL )
		{
			exit_pipe( pKsd_t->vtm_pipe );
			write_pipe( pKsd_t->vtm_pipe, wDump, 3 );
			

#ifdef WIN32
			WaitForSingleObject( phTTS->hThread_VTM,
				TIMEOUT_INTERVAL_IN_MSEC );

			CloseHandle( phTTS->hThread_VTM );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_WaitForThreadTermination( phTTS->hThread_VTM,
				&ThreadStatus,
				TIMEOUT_INTERVAL_IN_MSEC );
#endif
			/*MVP Free the allocated memory in LTS thread activity */
			if(phTTS->pVTMThreadData)
			{
				free(phTTS->pVTMThreadData);
				phTTS->pVTMThreadData = NULL;
			}
		}

		/******************************************************************/
		/*  Shut down the PH thread.                                      */
		/******************************************************************/
		
		if ( phTTS->hThread_PH != NULL )
		{
			exit_pipe( pKsd_t->ph_pipe );
			write_pipe( pKsd_t->ph_pipe, wDump, 3 );
			/*MVP Free the allocated memory in PH thread activity */
#ifdef WIN32
			WaitForSingleObject( phTTS->hThread_PH,
				TIMEOUT_INTERVAL_IN_MSEC );

			CloseHandle( phTTS->hThread_PH );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_WaitForThreadTermination( phTTS->hThread_PH,
				&ThreadStatus,
				TIMEOUT_INTERVAL_IN_MSEC );
#endif
			if(phTTS->pPHThreadData)
					FreePHInstanceData(phTTS->pPHThreadData); /* 04aug96 */
			phTTS->pPHThreadData = NULL;
		}

		/******************************************************************/
		/*  Shut down the LTS thread.                                     */
		/******************************************************************/

		if ( phTTS->hThread_LTS != NULL )
		{
			exit_pipe( pKsd_t->lts_pipe );
			write_pipe( pKsd_t->lts_pipe, wDump, 3 );
			/*MVP Free the allocated memory in LTS thread activity */
#ifdef WIN32
			WaitForSingleObject( phTTS->hThread_LTS,
				TIMEOUT_INTERVAL_IN_MSEC );
												
			CloseHandle( phTTS->hThread_LTS );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_WaitForThreadTermination( phTTS->hThread_LTS,
				&ThreadStatus,
				TIMEOUT_INTERVAL_IN_MSEC );
#endif
			if(phTTS->pLTSThreadData)
				free(phTTS->pLTSThreadData);
			phTTS->pLTSThreadData = NULL;
		}
#endif // #ifndef SINGLE_THREADED
		
		/******************************************************************/
		/*  Shut down the CMD thread.                                     */
		/******************************************************************/
		
		if ( phTTS->hThread_CMD != NULL )
		{
			exit_pipe( pKsd_t->cmd_pipe );
			write_pipe( pKsd_t->cmd_pipe, cDump, 3 );
			/*MVP Free the allocated memory in CMD thread activity */

#ifdef WIN32
			SetEvent( phTTS->hSyncEvent );
			WaitForSingleObject( phTTS->hThread_CMD,
				TIMEOUT_INTERVAL_IN_MSEC );

			CloseHandle( phTTS->hThread_CMD );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_SetEvent( phTTS->hSyncEvent );
	
			OP_WaitForThreadTermination( phTTS->hThread_CMD,
				&ThreadStatus,
				TIMEOUT_INTERVAL_IN_MSEC );
#endif
			if(pCmd_t)
#ifdef VXWORKS
				FreeCMDThreadMemory((PCMD_T)pCmd_t);
#else
				FreeCMDThreadMemory(pCmd_t);
#endif

			phTTS->pCMDThreadData = pCmd_t = NULL;
#ifdef SINGLE_THREADED
			if(phTTS->pVTMThreadData)
			{
				free(phTTS->pVTMThreadData);
				phTTS->pVTMThreadData = NULL;
			}
			if(phTTS->pPHThreadData)
					FreePHInstanceData(phTTS->pPHThreadData); /* 04aug96 */
			phTTS->pPHThreadData = NULL;
			if(phTTS->pLTSThreadData)
				free(phTTS->pLTSThreadData);
			phTTS->pLTSThreadData = NULL;
#endif
		}
  }
  
  /********************************************************************/
  /*  Shutdown the Audio thread                                       */
  /********************************************************************/
#ifdef SAPI5DECTALK
  if ( phTTS->pAudioHandle != NULL )
	  DestroyAudioObjects( phTTS->pAudioHandle );
	phTTS->pAudioHandle = NULL ;
#endif
  
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
#ifdef WIN32
  hInstance = NULL;
#endif
  
  if ( phTTS->hThread_TXT != NULL )
  {
#if !defined __osf__ && !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_ && !defined NOWIN
	  MMRESULT mmStatus=0;
	  SendMessage( phTTS->hTextToSpeechWnd,
		  ID_TTS_Destroy,
		  0L,
		  0L );
	  
	  WaitForSingleObject( phTTS->hThread_TXT,
		  TIMEOUT_INTERVAL_IN_MSEC );
	  
	  CloseHandle( phTTS->hThread_TXT );
#ifndef UNDER_CE
	  sprintf(wndclass,"%s_%08X",TEXTTOSPEECHWNDCLASS,(unsigned long int) phTTS);
#endif
	  mmStatus = UnregisterClass(wndclass,hInstance);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
	  phTTS->uiTextThreadExit = TRUE;
	  OP_SetEvent(phTTS->hTextInQueueEvent);
	  OP_WaitForThreadTermination(phTTS->hThread_TXT, 
		  &ThreadStatus, 
		  OP_INFINITE);
	  phTTS->hThread_TXT = NULL;
#endif	
  }
  
  /********************************************************************/
  /*  Free the handle to the "Not Emptying Vtm Pipe" event.           */
  /********************************************************************/
  
  if ( phTTS->hNotEmptyingVtmPipeEvent != NULL )
  {
#ifdef WIN32
	  CloseHandle( phTTS->hNotEmptyingVtmPipeEvent );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyEvent( phTTS->hNotEmptyingVtmPipeEvent );
#endif
  }
  
  /********************************************************************/
  /*  Free the handle to the "Sync" event.                            */
  /********************************************************************/
  
  if ( phTTS->hSyncEvent != NULL )
  {
#ifdef WIN32
	  CloseHandle( phTTS->hSyncEvent );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyEvent( phTTS->hSyncEvent );
#endif
  }
  
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
  
  /********************************************************************/
  /*  Free the handle to the "TextInQueue" event.                     */
  /********************************************************************/
  
  if ( phTTS->hTextInQueueEvent != NULL )
  {
	  OP_DestroyEvent( phTTS->hTextInQueueEvent );
	  phTTS->hTextInQueueEvent = NULL;
  }
#endif
  
  /********************************************************************/
  /*  Free the handle to the "Successful Memory alloacation" event.   */
  /********************************************************************/
  
  if (phTTS->hMallocSuccessEvent != NULL)
  {
#ifdef WIN32
	  CloseHandle(phTTS->hMallocSuccessEvent);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyEvent(phTTS->hMallocSuccessEvent);
#endif
	  phTTS->hMallocSuccessEvent = NULL;
	  
  }
  
  /********************************************************************/
  /*  Free the handle to the "TTS Callback Mutex .                    */
  /********************************************************************/
  
#ifdef WIN32
  if (phTTS->hmxCallback != NULL)
  {
	  OP_DestroyMutex(phTTS->hmxCallback);    // tek 03aug96
	  phTTS->hmxCallback = NULL;
  }
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  if (phTTS->pcsCallback != NULL)
  {
	  OP_DestroyMutex(phTTS->pcsCallback);
	  phTTS->pcsCallback = NULL;
  }
#endif
  
  /********************************************************************/
  /*  Delete the log file critical section.                           */
  /********************************************************************/
  
  if ( phTTS->pcsLogFile != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( phTTS->pcsLogFile );
	  
	  free( phTTS->pcsLogFile );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex( phTTS->pcsLogFile );
#endif 
	  
  }
  
  /********************************************************************/
  /*  Delete the queued character count critical section.             */
  /********************************************************************/
  
  if ( phTTS->pcsQueuedCharacterCount != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( phTTS->pcsQueuedCharacterCount );
	  
	  free( phTTS->pcsQueuedCharacterCount );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex( phTTS->pcsQueuedCharacterCount );
#endif
  }
  
//#ifdef WIN32
  /* tek 6mar97 bats 278 */
  /********************************************************************/
  /*  Delete the index queue critical section.                        */
  /********************************************************************/
  
  if ( pKsd_t->pcsSpcPktSave != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( pKsd_t->pcsSpcPktSave );
	  
	  free( pKsd_t->pcsSpcPktSave );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex(pKsd_t->pcsSpcPktSave);
#endif
	  pKsd_t->pcsSpcPktSave = NULL;
  }
//#endif
  
  
  /********************************************************************/
  /*  Delete the flush message number critical section.               */
  /********************************************************************/
  
  if ( phTTS->pcsFlushMsgNumber != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( phTTS->pcsFlushMsgNumber );
	  
	  free( phTTS->pcsFlushMsgNumber );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex( phTTS->pcsFlushMsgNumber );
#endif
  }
  
  
  /********************************************************************/
  /*  Delete the Buffer Pipe mutex.                                   */
  /********************************************************************/
  
  if ( phTTS->pcsBufferPipe != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( phTTS->pcsBufferPipe );
	  
	  free( phTTS->pcsBufferPipe );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex( phTTS->pcsBufferPipe );
#endif
  }
  
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
  /********************************************************************/
  /*  Delete the Text Msg mutex.                                      */
  /********************************************************************/
  
  if ( phTTS->pcsTextMsgList != NULL )
  {
	  OP_DestroyMutex( phTTS->pcsTextMsgList );
  }
#endif
  
  /********************************************************************/
  /*  Delete the last queued text message number critical section.    */
  /********************************************************************/
  
  if ( phTTS->pcsLastQueuedTextMsgNumber != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( phTTS->pcsLastQueuedTextMsgNumber );
	  
	  free( phTTS->pcsLastQueuedTextMsgNumber );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex( phTTS->pcsLastQueuedTextMsgNumber );
#endif
  }
  
  /********************************************************************/
  /*  Delete the queued sample count critical section.                */
  /********************************************************************/
  
  if ( phTTS->pcsQueuedSampleCount != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( phTTS->pcsQueuedSampleCount );
	  
	  free( phTTS->pcsQueuedSampleCount );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex( phTTS->pcsQueuedSampleCount );
#endif
  }
  
#ifndef SINGLE_THREADED
  // tek 24oct97 bats 497 delete and deallocate this critical section object
  if ( pKsd_t->pcsVtmPipeRead != NULL )
  {
#ifdef WIN32
	  DeleteCriticalSection( pKsd_t->pcsVtmPipeRead );
	  
	  free( pKsd_t->pcsVtmPipeRead );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	  OP_DestroyMutex( pKsd_t->pcsVtmPipeRead );
#endif
	  pKsd_t->pcsVtmPipeRead = NULL;
  }
#endif // #ifndef SINGLE_THREADED
  // tek 24oct97 end of bats 497
  
  /********************************************************************/
  /*  Free the dictionary memory.                                     */
  /********************************************************************/
  /*MVP : Unload dictionary when no other instance of DECtalk speech  */
  /*      object is running                                           */
  
  if(!gnInstanceCounter || phTTS->dictionary_file_name[0])        
  {
	  /* GL 11/05/1997  for BATS#510 */
	  if ( pKsd_t->fdic_entries[pKsd_t->lang_curr] != 0 )
	  {
		  unload_dictionary((void **)&(pKsd_t->fdic_index[pKsd_t->lang_curr]),
			  (void **)&pKsd_t->fdic_data[pKsd_t->lang_curr],
			  (unsigned int *)&(pKsd_t->fdic_entries[pKsd_t->lang_curr]),
			  (unsigned int *)&(pKsd_t->fdic_bytes[pKsd_t->lang_curr])
			  ,(LPVOID*)&(pKsd_t->fdicMapStartAddr[pKsd_t->lang_curr]),
			  (DT_HANDLE*)&(pKsd_t->fdicMapObject[pKsd_t->lang_curr]),
			  (DT_HANDLE*)&(pKsd_t->fdicFileHandle[pKsd_t->lang_curr]),		  
		      MEMMAP_ON 
			  );


		if(!gnInstanceCounter)
		{
		  gpufdic_index = NULL;
		  gpufdic_data = NULL;
		  gufdic_entries = 0;
		  gufdic_bytes = 0;
		  gufdicMapObject=NULL;
		  gufdicFileHandle=NULL;
		  gufdicMapStartAddr=NULL;

	  }
	  }
	  if(!gnInstanceCounter)
	  {
	  if ( pKsd_t->foreigndic_entries[pKsd_t->lang_curr] != 0 )
	  {
		  unload_dictionary((void **)&(pKsd_t->foreigndic_index[pKsd_t->lang_curr]),
			  (void **)&pKsd_t->foreigndic_data[pKsd_t->lang_curr],
			  (unsigned int *)&(pKsd_t->foreigndic_entries[pKsd_t->lang_curr]),
			  (unsigned int *)&(pKsd_t->foreigndic_bytes[pKsd_t->lang_curr])
			  ,(LPVOID*)&(pKsd_t->foreigndicMapStartAddr[pKsd_t->lang_curr]),
			  (DT_HANDLE*)&(pKsd_t->foreigndicMapObject[pKsd_t->lang_curr]),
			  (DT_HANDLE*)&(pKsd_t->foreigndicFileHandle[pKsd_t->lang_curr]),		  
		      MEMMAP_ON 
			  );



		  gpufordic_index = NULL;
		  gpufordic_data = NULL;
		  gufordic_entries = 0;
		  gufordic_bytes = 0;
		  gufordicMapObject=NULL;
		  gufordicFileHandle=NULL;
		  gufordicMapStartAddr=NULL;

	  }
  }
  }
  
  /********************************************************************/
  /*  Free the user dictionary memory.                                */
  /********************************************************************/
  
  /* GL 11/05/1997  for BATS#510 */
  if ( pKsd_t->udic_entries[pKsd_t->lang_curr] != 0 )
  {
	  unload_dictionary((void **)&pKsd_t->udic_index[pKsd_t->lang_curr],
		  (void **)&pKsd_t->udic_data[pKsd_t->lang_curr],
		  (unsigned int *)&pKsd_t->udic_entries[pKsd_t->lang_curr],
		  (unsigned int *)&pKsd_t->udic_bytes[pKsd_t->lang_curr]
		  ,(LPVOID*)&(pKsd_t->fdicMapStartAddr[pKsd_t->lang_curr]),		  
			(DT_HANDLE*)&(pKsd_t->fdicMapObject[pKsd_t->lang_curr]),
		    (DT_HANDLE*)&(pKsd_t->fdicFileHandle[pKsd_t->lang_curr]),		  
		  MEMMAP_OFF 
		  );

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
  
#ifndef SINGLE_THREADED
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
  
#endif // SINGLE_THREADED
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

 // added windows CE support 15oct98 mfg 

MMRESULT TextToSpeechSpeak( LPTTS_HANDLE_T phTTS,
#ifdef UNDER_CE
				LPTSTR pszTextString,
#else
				LPSTR pszTextString,
#endif
				DWORD dwFlags )
{

#ifdef UNDER_CE	//01jan99 mfg convert unicode string to char string for Windows CE
char *string;
string=malloc ((wcslen(pszTextString)+4) * sizeof(char));

WideStringtoAsciiString(string, pszTextString, (wcslen(pszTextString)+4));
#endif

	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
#ifdef WIN32
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );
	
	if (!phTTS->bInReset)
	{
		return (TextToSpeechSpeakEx( phTTS,
#ifdef UNDER_CE
				string,
#else
				pszTextString,
#endif
				dwFlags,
				TRUE));
	}
	else
	{
		return (MMSYSERR_NOERROR); // _HANDLEBUSY would be better, but
		// will break existing apps.. sigh..
	}
#endif // WIN32

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	if ( phTTS==NULL)
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
#endif

/* ******************** NOT USED ********************************* */
#if 0 // not used anymore
	char proc_name[]="TextToSpeechSpeak";
	int uiTextLength = 0;
	unsigned char * pText;
	LPTEXT_MSG_T pTextMsg;
	LPTEXT_MSG_T pNextTextMsg;
	static char cForce = (char)((PFASCII<<PSFONT)+0xb);
//	const char cForce2 = (char)(SYNC);
	
#ifdef TTSDBG
	printf("%s\n",proc_name);
#endif
	
	/********************************************************************/
	/*  Return error if NULL handle.                                    */
	/********************************************************************/
	if (phTTS == NULL)
		return( MMSYSERR_INVALHANDLE );
	
	/********************************************************************/
	/*  Allocate the memory locked Text Message structure.              */
	/********************************************************************/
	
	pTextMsg = (TEXT_MSG_T *)malloc(sizeof(TEXT_MSG_T));
	
	if ( pTextMsg == NULL )
		return( MMSYSERR_NOMEM );
	
	pTextMsg->pLink = NULL;
	
	/********************************************************************/
	/*  Adjust string length for force character.                       */
	/********************************************************************/

	// MGS fixed getting NULL strings as input
	if (pszTextString==NULL)
	{
		uiTextLength=0;
	}
	else
	{
		uiTextLength = strlen(pszTextString);
	}

	if( dwFlags & TTS_FORCE )
	{
		uiTextLength++;
	}
	
	/********************************************************************/
	/*  If the text length is zero then exit with success.              */
	/********************************************************************/
	
	if ( uiTextLength == 0 )
	{
		free( pTextMsg );
		return MMSYSERR_NOERROR;
	}
	
	/********************************************************************/
	/*  Allocate the memory locked pipe text buffer. Allocate 1 extra   */
	/*  location in case the force character is appended to the text    */
	/*  string.                                                         */
	/********************************************************************/
	
#ifdef UNDER_CE
	pText=string;
	free(string);
#else
	pText = malloc(( uiTextLength + 1 ) * sizeof( char ) );
	
	if ( pText == NULL )
	{ 
		free( pTextMsg );
		return( MMSYSERR_NOMEM );
	} 
#endif

	/********************************************************************/
	/*  The memory pointed to by pTextMsg and text is                   */
	/*  deallocated in the Text-To-Speech text thread and it            */
	/*  should not be used after the call to the function.              */
	/********************************************************************/
	
	strcpy( pText, pszTextString );

	/********************************************************************/
	/*  Conditionally append the force character to the text.           */
	/********************************************************************/
	
	if( dwFlags & TTS_FORCE )
	{
		pText[uiTextLength-1] = cForce;
	}
	
	pTextMsg->pText = pText;
	pTextMsg->uiLength = uiTextLength;
	
    // tek 01sep98
	OP_LockMutex( phTTS->pcsFlushMsgNumber );
	pTextMsg->uiMsgNumber = phTTS->uiCurrentMsgNumber;
	phTTS->uiCurrentMsgNumber++;
	OP_UnlockMutex( phTTS->pcsFlushMsgNumber );
	
	/********************************************************************/
	/*  Increment the queued character count.                           */
	/********************************************************************/
	
	OP_LockMutex( phTTS->pcsQueuedCharacterCount );
	phTTS->uiQueuedCharacterCount += uiTextLength;
	OP_UnlockMutex( phTTS->pcsQueuedCharacterCount );
	
	/*
	* keep track of what we've queued so that we can 
	* sync correctly
	* (tek 11aug98)
	*/
	OP_LockMutex( phTTS->pcsLastQueuedTextMsgNumber );
	phTTS->uiLastTextMsgNumber = pTextMsg->uiMsgNumber;
	OP_UnlockMutex( phTTS->pcsLastQueuedTextMsgNumber );

	/********************************************************************/
	/*  Add the text message to the text-message linked list.           */
	/********************************************************************/
	
	OP_LockMutex( phTTS->pcsTextMsgList );
	
	/********************************************************************/
	/*  Put the Text Message at the end of the linked list.             */
	/********************************************************************/
	
	if ( phTTS->pTextMsgList == NULL )
	{
		phTTS->pTextMsgList = pTextMsg;
	}
	else
	{
		pNextTextMsg = phTTS->pTextMsgList;
		
		while ( pNextTextMsg->pLink != NULL )
		{
			pNextTextMsg = pNextTextMsg->pLink;
		}
		
		pNextTextMsg->pLink = pTextMsg;
	}
	
	/********************************************************************/
	/*  Set the Text In Queue event.                                    */
	/********************************************************************/
	
	OP_SetEvent( phTTS->hTextInQueueEvent );
	
	/********************************************************************/
	/*  Unlock the text-message linked list.                            */
	/********************************************************************/
	
	OP_UnlockMutex( phTTS->pcsTextMsgList );
	
	return( MMSYSERR_NOERROR );
#endif // 0
/* *************************************************************** */
}

//#ifdef WIN32
MMRESULT TextToSpeechSpeakEx( LPTTS_HANDLE_T phTTS,
							 LPSTR pszTextString,
							 DWORD dwFlags, 
							 BOOL bIsUser)
{
	UINT i;
	UINT uiLength;
	unsigned char * pTextBuffer;
	TEXT_MSG_T * pTextMsg;
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
	LPTEXT_MSG_T pNextTextMsg;
#endif
	const char cForce = (char)((PFASCII<<PSFONT)+0xb);
//	const char cForce2 = (char)(SYNC);
	
	
	
	
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
#ifdef WIN32
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)||(phTTS == NULL)))
		return( MMSYSERR_INVALHANDLE );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	if (phTTS == NULL)
		return( MMSYSERR_INVALHANDLE );
#endif
	// if this is the null state, and it is a user call, don't accept the text (for now)...
	if (phTTS->dwOutputState == STATE_OUTPUT_NULL && bIsUser)
		return(MMSYSERR_ERROR);

	
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

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
	pTextMsg->pLink = NULL;
#endif
	
	/********************************************************************/
	/*  Get the character string length.                                */
	/********************************************************************/
	// MGS fixed getting NULL strings as input
	if (pszTextString==NULL)
	{
		uiLength=0;
	}
	else
	{
		uiLength = strlen(pszTextString);
	}

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
//		pTextBuffer[uiLength] = cForce2;
//		uiLength++;
	}


	// tek 05nov97 bats472 we have to do all message numbering and 
	// queueing under a critical section, so that we are absolutely
	// sure that the numbers will be monotonically increasing; if 
	// they aren't. WaitForTextQueueingToComplete will end up 
	// waiting forever.

	OP_LockMutex( phTTS->pcsQueuedCharacterCount );

	/********************************************************************/
	/*  Set up the Text Message structure.                              */
	/*  The message number is used in the Text-To-Speech thread to      */
	/*  to throw away window messages which are received after          */
	/*  TextToSpeechReset() is called.                                  */
	/********************************************************************/
	
	pTextMsg->pText = pTextBuffer;
	pTextMsg->uiLength = uiLength;
	
	OP_LockMutex( phTTS->pcsFlushMsgNumber );
	pTextMsg->uiMsgNumber = phTTS->uiCurrentMsgNumber;
	phTTS->uiCurrentMsgNumber++;
	OP_UnlockMutex( phTTS->pcsFlushMsgNumber );


	// tek 16jun97 bats 385 moves the store/increment inside the CS
	
	/********************************************************************/
	/*  Save this message number in the Text-To-Speech handle for       */
	/*  the TextToSpeechSync() function.                                */
	/********************************************************************/

	OP_LockMutex( phTTS->pcsLastQueuedTextMsgNumber );
	phTTS->uiLastTextMsgNumber = pTextMsg->uiMsgNumber;
	OP_UnlockMutex( phTTS->pcsLastQueuedTextMsgNumber );


	/********************************************************************/
	/*  Accumulate the queued character count.                          */
	/********************************************************************/
#if defined WIN32 && !defined NOWIN
	//tek bats472: move this up to before the point where we 
	// take a number
	//EnterCriticalSection( phTTS->pcsQueuedCharacterCount );
	phTTS->uiQueuedCharacterCount += uiLength;
	// tek bats472: move this to after the PostMessage.
	//LeaveCriticalSection( phTTS->pcsQueuedCharacterCount );
#ifdef API_DEBUG
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
#endif //API_DEBUG
	/********************************************************************/
	/*  Send the structure pointed to by pTextMsg to the text thread.   */
	/********************************************************************/
	
	PostMessage( phTTS->hTextToSpeechWnd,
		ID_TTS_Queue_Text,
		0L,
		(LPARAM)pTextMsg );
	// tek bats472: OK to do this now.
	OP_UnlockMutex( phTTS->pcsQueuedCharacterCount );
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
#endif // WIN32
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN
	/********************************************************************/
	/*  Add the text message to the text-message linked list.           */
	/********************************************************************/

	OP_LockMutex( phTTS->pcsTextMsgList );
	
	/********************************************************************/
	/*  Put the Text Message at the end of the linked list.             */
	/********************************************************************/
	
	if ( phTTS->pTextMsgList == NULL )
	{
		phTTS->pTextMsgList = pTextMsg;
	}
	else
	{
		pNextTextMsg = phTTS->pTextMsgList;
		while ( pNextTextMsg->pLink != NULL )
		{
			pNextTextMsg = pNextTextMsg->pLink;
		}
		pNextTextMsg->pLink = pTextMsg;
	}
	phTTS->uiQueuedCharacterCount += uiLength;

	/********************************************************************/
	/*  Set the Text In Queue event.                                    */
	/********************************************************************/
	
	OP_SetEvent( phTTS->hTextInQueueEvent );
	
	/********************************************************************/
	/*  Unlock the text-message linked list.                            */
	/********************************************************************/
	
	OP_UnlockMutex( phTTS->pcsTextMsgList );

	OP_UnlockMutex( phTTS->pcsQueuedCharacterCount );

#endif

	return( MMSYSERR_NOERROR );
}
//#endif /* WIN32 */

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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
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

//added Windows CE support 15oct98 mfg
MMRESULT TextToSpeechOpenWaveOutFile( LPTTS_HANDLE_T phTTS,
#ifdef UNDER_CE
					  wchar_t pszFileName[],
#else
					  char pszFileName[],
#endif
					  DWORD dwFormat )
{
  MMRESULT mmStatus;
  WAVE_FILE_HDR_T * pWaveFileHdr;
  AU_FILE_HDR_T * pAuFileHdr;
#ifdef UNDER_CE
  DWORD dwRW;
#endif

	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
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
	
	if (strcmp((pszFileName+(strlen(pszFileName)-3)),".au")==0)
		phTTS->bisau=1;
	else
		phTTS->bisau=0;

	
	/********************************************************************/
	/*  Create the header for the output file                           */
	/********************************************************************/
	if (phTTS->bisau==0)
	{
	
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
	pWaveFileHdr->dwWaveChunkSize = SWAP_32_LITTLE(16);
	pWaveFileHdr->wNumberOfChannels = SWAP_16_LITTLE(1);
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
		pWaveFileHdr->wFormatTag = SWAP_16_LITTLE(WAVE_FORMAT_PCM);
		pWaveFileHdr->dwSamplesPerSecond = SWAP_32_LITTLE(PC_SAMPLE_RATE);
		pWaveFileHdr->dwAvgBytesPerSecond = SWAP_32_LITTLE(PC_SAMPLE_RATE*2);
		pWaveFileHdr->wNumberBlockAlign = SWAP_16_LITTLE(2);
		pWaveFileHdr->wBitsPerSample = SWAP_16_LITTLE(16);
		
		SetSampleRate( phTTS, PC_SAMPLE_RATE );
		
		break;
		
	case WAVE_FORMAT_1M08:
		
		pWaveFileHdr->wFormatTag = SWAP_16_LITTLE(WAVE_FORMAT_PCM);
		pWaveFileHdr->dwSamplesPerSecond = SWAP_32_LITTLE(PC_SAMPLE_RATE);
		pWaveFileHdr->dwAvgBytesPerSecond = SWAP_32_LITTLE(PC_SAMPLE_RATE);
		pWaveFileHdr->wNumberBlockAlign = SWAP_16_LITTLE(1);
		pWaveFileHdr->wBitsPerSample = SWAP_16_LITTLE(8);
		
		SetSampleRate( phTTS, PC_SAMPLE_RATE );
		
		break;
		
	case WAVE_FORMAT_08M08:
		
		pWaveFileHdr->wFormatTag = SWAP_16_LITTLE(WAVE_FORMAT_MULAW);
		pWaveFileHdr->dwSamplesPerSecond = SWAP_32_LITTLE(MULAW_SAMPLE_RATE);
		pWaveFileHdr->dwAvgBytesPerSecond = SWAP_32_LITTLE(MULAW_SAMPLE_RATE);
		pWaveFileHdr->wNumberBlockAlign = SWAP_16_LITTLE(1);
		pWaveFileHdr->wBitsPerSample = SWAP_16_LITTLE(8);
		
		SetSampleRate( phTTS, MULAW_SAMPLE_RATE );
		
		break;

	case WAVE_FORMAT_08M16:
		pWaveFileHdr->wFormatTag = SWAP_16_LITTLE(WAVE_FORMAT_PCM);
		pWaveFileHdr->dwSamplesPerSecond = SWAP_32_LITTLE(MULAW_SAMPLE_RATE);
		pWaveFileHdr->dwAvgBytesPerSecond = SWAP_32_LITTLE(MULAW_SAMPLE_RATE*2);
		pWaveFileHdr->wNumberBlockAlign = SWAP_16_LITTLE(2);
		pWaveFileHdr->wBitsPerSample = SWAP_16_LITTLE(16);
		
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
	
#ifdef UNDER_CE //mfgce
  if((phTTS->pWaveFile = CreateFile(pszFileName, GENERIC_WRITE, FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL))==NULL)
#else
  if (( phTTS->pWaveFile = fopen(pszFileName, "wb" )) == NULL )
#endif
	{
#ifndef UNDER_CE
#ifdef API_DEBUG
	    perror("file open error:");
#endif
#endif
		free( pWaveFileHdr );
		return( MMSYSERR_ERROR );
	}
	
	/********************************************************************/
	/*  Write the header to the output file.                            */
	/********************************************************************/
	
#ifdef UNDER_CE
  if(WriteFile( phTTS->pWaveFile,pWaveFileHdr,sizeof( WAVE_FILE_HDR_T ), &dwRW, NULL)==0)
#else
  if( 1 != fwrite( (char *)pWaveFileHdr,sizeof( WAVE_FILE_HDR_T ),1,phTTS->pWaveFile ))
#endif
	{
		free( pWaveFileHdr );
#ifdef UNDER_CE
		CloseHandle( phTTS->pWaveFile );
#else
		fclose(phTTS->pWaveFile);
#endif
		phTTS->pWaveFile=NULL;
		return( MMSYSERR_ERROR );
	}
	phTTS->pWaveFileHdr = pWaveFileHdr;
	}
	else
	{
	/* for au files */
	pAuFileHdr = (AU_FILE_HDR_T *) malloc( sizeof(AU_FILE_HDR_T));
	
	if ( pAuFileHdr == NULL )
		return( MMSYSERR_NOMEM );

	pAuFileHdr->magic[0]='.';
	pAuFileHdr->magic[1]='s';
	pAuFileHdr->magic[2]='n';
	pAuFileHdr->magic[3]='d';
	pAuFileHdr->hdr_size=SWAP_32_BIG(AU_HEADER_OFFSET);
	pAuFileHdr->data_size=0;
	pAuFileHdr->channels=SWAP_32_BIG(1);
	pAuFileHdr->comment[0]='D';
	pAuFileHdr->comment[1]='E';
	pAuFileHdr->comment[2]='C';
	pAuFileHdr->comment[3]='t';
	pAuFileHdr->comment[4]='a';
	pAuFileHdr->comment[5]='l';
	pAuFileHdr->comment[6]='k';
	pAuFileHdr->comment[7]='\0';

	/********************************************************************/
	/*  If the dwFormat value is invalid then return an error.          */
	/********************************************************************/
	
	switch( dwFormat )
	{
	case WAVE_FORMAT_1M16:
		pAuFileHdr->encoding=SWAP_32_BIG(SUN_LIN_16); 
		pAuFileHdr->sample_rate = SWAP_32_BIG(PC_SAMPLE_RATE);
		
		SetSampleRate( phTTS, PC_SAMPLE_RATE );
		
		break;
		
	case WAVE_FORMAT_1M08:
		
		pAuFileHdr->encoding=SWAP_32_BIG(SUN_LIN_8); 
		pAuFileHdr->sample_rate = SWAP_32_BIG(PC_SAMPLE_RATE);
		
		SetSampleRate( phTTS, PC_SAMPLE_RATE );
		
		break;
		
	case WAVE_FORMAT_08M08:
		
		pAuFileHdr->encoding=SWAP_32_BIG(SUN_ULAW); 
		pAuFileHdr->sample_rate = SWAP_32_BIG(MULAW_SAMPLE_RATE);
		
		SetSampleRate( phTTS, MULAW_SAMPLE_RATE );
		
		break;

	case WAVE_FORMAT_08M16:
		pAuFileHdr->encoding=SWAP_32_BIG(SUN_LIN_16); 
		pAuFileHdr->sample_rate = SWAP_32_BIG(MULAW_SAMPLE_RATE);
		
		SetSampleRate( phTTS, MULAW_SAMPLE_RATE );
		
	default:
		
		free( pAuFileHdr );
		return( MMSYSERR_INVALPARAM );
	}
	
	phTTS->dwFormat = dwFormat;
	
	
	/********************************************************************/
	/*  Open the wave output file.                                      */
	/********************************************************************/
	
#ifdef UNDER_CE //mfgce
  if((phTTS->pWaveFile = CreateFile(pszFileName, GENERIC_WRITE, FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL))==NULL)
#else
  if (( phTTS->pWaveFile = fopen(pszFileName, "wb" )) == NULL )
#endif
	{
		free( pAuFileHdr );
		return( MMSYSERR_ERROR );
	}
	
	/********************************************************************/
	/*  Write the header to the output file.                            */
	/********************************************************************/
	
#ifdef UNDER_CE
  if(WriteFile( phTTS->pWaveFile,pAuFileHdr,sizeof( AU_FILE_HDR_T ), &dwRW, NULL)==0)
#else
  if( 1 != fwrite( (char *)pAuFileHdr,sizeof( AU_FILE_HDR_T ),1,phTTS->pWaveFile ))
#endif
	{
		free( pAuFileHdr );
#ifdef UNDER_CE
		CloseHandle( phTTS->pWaveFile );
#else
		fclose(phTTS->pWaveFile);
#endif
		phTTS->pWaveFile=NULL;
		return( MMSYSERR_ERROR );
	}
	phTTS->pAuFileHdr = pAuFileHdr;
	

	}

	/********************************************************************/
	/*  Initialize the file sample count.                               */
	/********************************************************************/
	
	phTTS->dwFileSampleCount = 0;
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
#ifdef UNDER_CE
	DT_HANDLE * pWaveFile;
	DWORD dwRW;
#else
	FILE * pWaveFile;
#endif
	WAVE_FILE_HDR_T * pWaveFileHdr;
	AU_FILE_HDR_T * pAuFileHdr;
	MMRESULT mmStatus;
	
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS) || (phTTS == NULL)))
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
	case WAVE_FORMAT_08M16:
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
	if (phTTS->bisau==0)
	{
	
	pWaveFileHdr = (WAVE_FILE_HDR_T *)phTTS->pWaveFileHdr;
	
	pWaveFileHdr->dwDataChunkSize = SWAP_32_LITTLE(dwLengthInBytes);
	
	pWaveFileHdr->dwRiffChunkSize =
		SWAP_32_LITTLE(dwLengthInBytes + RIFF_HEADER_OFFSET);
	}
	else
	{
	pAuFileHdr = (AU_FILE_HDR_T *)phTTS->pAuFileHdr;
	pAuFileHdr->data_size=SWAP_32_BIG(dwLengthInBytes);
	}
	
	/********************************************************************/
	/*  Seek to the top of the file to write the updated wave header.   */
	/********************************************************************/
	
#ifdef UNDER_CE
   pWaveFile = (DT_HANDLE *)phTTS->pWaveFile;
#else
   pWaveFile = (FILE *)phTTS->pWaveFile;
#endif

#ifdef UNDER_CE //mfgce fix return value
  if( SetFilePointer(pWaveFile, 0L, NULL, FILE_BEGIN) == -1 )
#else
  if ( fseek( pWaveFile, 0L, SEEK_SET ) )
#endif // UNDER_CE
  {
	if (phTTS->bisau)
		free(pAuFileHdr);
	else
		free( pWaveFileHdr );

#if UNDER_CE
	if ( CloseHandle( pWaveFile ) == 0)
#else
	if ( fclose( pWaveFile ))
#endif
	return( MMSYSERR_ERROR );
  }
	
	/********************************************************************/
	/*  Write the header to the output file.                            */
	/********************************************************************/
	if (phTTS->bisau)	
	{
#ifdef UNDER_CE
  if(WriteFile( phTTS->pWaveFile,pAuFileHdr,sizeof( AU_FILE_HDR_T ), &dwRW, NULL)==0)
#else
  if ( 1 != fwrite( (char *)pAuFileHdr,sizeof(AU_FILE_HDR_T ),1,phTTS->pWaveFile ))
#endif
	{
		free(pAuFileHdr);
#if UNDER_CE
	if ( CloseHandle( pWaveFile ) == 0)
#else
	if ( fclose( pWaveFile ))
#endif
		return( MMSYSERR_ERROR );
	}
	}
	else
	{
	
#ifdef UNDER_CE
  if(WriteFile( phTTS->pWaveFile,pWaveFileHdr,sizeof( WAVE_FILE_HDR_T ), &dwRW, NULL)==0)
#else
  if ( 1 != fwrite( (char *)pWaveFileHdr,sizeof(WAVE_FILE_HDR_T ),1,phTTS->pWaveFile ))
#endif
	{
		free( pWaveFileHdr );
#if UNDER_CE
	if ( CloseHandle( pWaveFile ) == 0)
#else
	if ( fclose( pWaveFile ))
#endif
		return( MMSYSERR_ERROR );
	}
	}
	
	/********************************************************************/
	/*  Free the wave file header.                                      */
	/********************************************************************/
	
	if (phTTS->bisau)
		free(pAuFileHdr);
	else
	free( pWaveFileHdr );
	
	/********************************************************************/
	/*  Set the system output state to audio if it is enabled.          */
	/********************************************************************/
	
	if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	{
		phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
		TextToSpeechReset(phTTS,FALSE); // tek 29jan99 bats 849: this resets the counters..
	}
	else
		phTTS->dwOutputState = STATE_OUTPUT_NULL;
	
	phTTS->bisau=0;
	
	/********************************************************************/
	/*  Close the wave file.                                            */
	/********************************************************************/
	
#ifdef UNDER_CE
	if ( CloseHandle( pWaveFile ) == 0)
#else
	if ( fclose( pWaveFile ))
#endif
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS) || (phTTS == NULL)))
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
  
#ifdef API_DEBUG
  char szTemp[256]="";
#endif //API_DEBUG
  
#ifdef WIN32	
#ifdef TYPING_MODE	// 09jun97 tek
  BOOL	bWasTyping=FALSE;
  
  char szCforce3[] = {  
    (char)((PFASCII<<PSFONT)+0xb),
    /*	(char)(SYNC),					
	(char)((PFASCII<<PSFONT)+0xb),
	(char)(SYNC),					
    */
//    (char)((PFASCII<<PSFONT)+0xb),
//    (char)(SYNC),
    '\0'
  };
  DT_HANDLE hThisThread=NULL;
  THREAD_PRIORITY_T tptPriority=0;
  hThisThread = GetCurrentThread();
  if (hThisThread)
    {
#ifndef UNDER_CE
      tptPriority = OP_GetThreadPriority(hThisThread);
      OP_SetThreadPriority(hThisThread,OP_PRIORITY_HIGHEST);
#endif
    }
#endif //TYPING_MODE
  
  
#ifdef API_DEBUG
  // tek 10aug97 (during bats423)
       // fix this for typing/nontyping
#ifdef TYPING_MODE  // tek 10aug97 (during bats423)
			       // fix this for typing/nontyping
#ifndef UNDER_CE
	sprintf(szTemp,"TTSreset() at %ld (%d). \n",timeGetTime(),phTTS->bInTypingMode);
#endif


#else //TYPING_MODE
  sprintf(szTemp,"TTSreset() at %ld. \n",timeGetTime());
#endif //TYPING_MODE
  OutputDebugString(szTemp);
#endif //API_DEBUG
  
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/
  
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
    {
#ifndef UNDER_CE
#ifdef TYPING_MODE
      if ( hThisThread)	 // tek 09jun97
	  {
	OP_SetThreadPriority(hThisThread,tptPriority);
      }
#endif
#endif
      return( MMSYSERR_INVALHANDLE );
    }

  /* 16jun97 tek bats385
     merged 28jul97 tek
     lock up the synthesizer against new speech.. 
  */
#endif /* WIN32 */
  
  /********************************************************************/
  /*   Set the InReset flag                                           */
  /********************************************************************/
  
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef TYPING_MODE	// 09jun97 tek
  BOOL	bWasTyping=FALSE;
  
  char szCforce3[] = {  
   (char)((PFASCII<<PSFONT)+0xb),
    /*	(char)(SYNC),					
	(char)((PFASCII<<PSFONT)+0xb),
	(char)(SYNC),					
    */
//    (char)((PFASCII<<PSFONT)+0xb),
    //(char)(SYNC),
    '\0'
  };
#endif //TYPING_MODE
  THREAD_T ThisThread=0;
  HTHREAD_T hThisThread=&ThisThread;
  THREAD_PRIORITY_T tptPriority=0;
  ThisThread = pthread_self();
  if (hThisThread)
    {
#ifndef VXWORKS
      tptPriority = OP_GetThreadPriority(hThisThread);
      OP_SetThreadPriority(hThisThread,OP_PRIORITY_HIGHEST);
#endif
    }
  
  
#ifdef API_DEBUG
  // tek 10aug97 (during bats423)
       // fix this for typing/nontyping
#ifdef TYPING_MODE  // tek 10aug97 (during bats423)
			       // fix this for typing/nontyping
#ifndef UNDER_CE
	sprintf(szTemp,"TTSreset() at %ld (%d). \n",timeGetTime(),phTTS->bInTypingMode);
#endif

#else //TYPING_MODE
  sprintf(szTemp,"TTSreset() at %ld. \n",timeGetTime());
#endif //TYPING_MODE
  OutputDebugString(szTemp);
#endif //API_DEBUG
  
  /********************************************************************/
  /*  Return error if invalid handle.                                 */
  /********************************************************************/
  
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
  	{ 
#ifndef VXWORKS
      if ( hThisThread)	 // tek 09jun97
	  {
	OP_SetThreadPriority(hThisThread,tptPriority);
      }
#endif
    		return( MMSYSERR_INVALHANDLE );
  	}
#endif /* osf */
  
	phTTS->bInReset = TRUE;
  	/********************************************************************/
  	/*  Set the halting flag. This will cause the CMD, LTS, PH, VTM,    */
  	/*  and SYNC threads to all discard input data and flush the pipes. */
  	/********************************************************************/
  	/* Get the current instance kernel_share_data : MVP */
  pKsd_t = phTTS->pKernelShareData;
  
  pKsd_t->halting = TRUE;
  
  /* ETT fixme?: why is this only win32? */
//#ifdef WIN32 // now it is for all MGS 02/15/2001
#ifdef API_DEBUG
  OutputDebugString("TTSreset: ->halting is set. \n");
#endif //API_DEBUG
  /********************************************************************/
  /*  Stop the Text To Speech thread if it is queueing text.          */
  /*  The Text-To-Speech thread will queue no text if the message     */
  /*  number is less than phTTS->uiFlushMsgNumber.                    */
  /* this needs to happen before we do too much.. tek 17jun97		  */
  /********************************************************************/
  EnterCriticalSection( phTTS->pcsFlushMsgNumber );
  phTTS->uiFlushMsgNumber = phTTS->uiCurrentMsgNumber;
  phTTS->uiCurrentMsgNumber++;
  LeaveCriticalSection( phTTS->pcsFlushMsgNumber );
  
  
#ifdef TYPING_MODE
  bWasTyping = phTTS->bInTypingMode;
  /* tek 15may97
     we set the PH thread's prority up here so that the first burst of
     sound that we need to get out in typing mode is quickly available; 
     after the VTM has processes two speech frames, vtmiont will drop the 
     PH thread back to normal priority so that any user processes can 
     continue running.
     if you change this, make sure the code in vtmiont still makes sense.
     */	
  if (phTTS->dwOutputState == STATE_OUTPUT_AUDIO)
    {
      /* tek 19nov97 this needs to be "highest" rather than "above normal";
	 also, we need to do this for both VTM and PH, and VTM will 
	 readjust it later for us. (this is all to deal with responsiveness
	 in the presence of greedy tasks..)
	 */
#if !defined UNDER_CE && !defined VXWORKS
#ifndef SINGLE_THREADED
      OP_SetThreadPriority((phTTS->hThread_VTM),OP_PRIORITY_HIGHEST);
      OP_SetThreadPriority((phTTS->hThread_PH),OP_PRIORITY_HIGHEST);
#endif
#endif // !defined UNDER_CE && !defined VXWORKS
    }
  
#endif //TYPING_MODE
//#endif /* WIN32 */ // MGS not it is for all 02/15/2001
  
  pKsd_t->cmd_flush=CMD_flush_toss;
  
  /* tek 04sep96   drain the lts and ph pipes, just like on the 
     hardware platforms..
     */  
  DrainPipes(phTTS);
  
//#ifdef WIN32
/* MGS This should be for all platforms, but vtmio.c and vtmiont.c have
   to be merged first */
#ifndef SINGLE_THREADED
  EmptyVtmPipe(pKsd_t); /* tek 15may  */
#endif 
#ifdef TYPING_MODE /*09jun97 tek */
  if (bWasTyping)
    {
      /* start the pipes clearing out */
      DT_PIPE_T dtpSync = SYNC;
#ifndef SINGLE_THREADED
      write_pipe(pKsd_t->ph_pipe,&dtpSync,1);
#else
	  ph_loop(phTTS,&dtpSync);
#endif
      /* this WFEP is important for the case where the VTM still has
	 work to do from above; we need to make sure that the VTM
	 IO routines get to empty before we clear the halting flag.
	 */	 
      mmStatus = WaitForEmptyPipes( phTTS,
				    MAXIMUM_RESET_WAIT_TIME_IN_MSEC,
				    TRUE );
    }
#endif /* TYPING_MODE */
//#endif /* WIN32 */
  
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
       
//#ifdef WIN32
#ifndef UNDER_CE
#ifdef TYPING_MODE
  if (hThisThread)
		OP_SetThreadPriority(hThisThread,tptPriority);
#endif
#endif
//#endif
	
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
#ifndef SINGLE_THREADED
			&& ( pipe_count( pKsd_t->lts_pipe ) == 0 )
			&& ( pipe_count( pKsd_t->ph_pipe ) == 0 )
			&& ( pipe_count( pKsd_t->vtm_pipe ) == 0 )
#endif
			&& ( pipe_count( pKsd_t->buffer_pipe) == 0))
		{
			// tek 22aug96 by now, the cmd parser should be well oiled. Let it go*/
			pKsd_t->cmd_flush = FALSE;
#ifdef API_DEBUG
			OutputDebugString("TTSReset() exiting1.\n");
#endif //API_DEBUG
			
			// 16jun97 tek bats385
			// merged 28jul97 tek
			phTTS->bInReset = FALSE;
			
			if (pipe_count( phTTS->pKernelShareData->buffer_pipe ))
			{
#ifdef API_DEBUG
				OutputDebugString("Reset return: still have buffers.\n");
#endif //API_DEBUG
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
			// MGS merge WIN32 and UNIX routines
			OP_ResetEvent(phTTS->hSyncEvent);
#ifdef	TYPING_MODE // tek 17jun97
			TextToSpeechSpeakEx( phTTS, szCforce3,TTS_FORCE,FALSE);
#else
			
//			TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
//			TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
//			TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
			TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
			
#endif //TYPING_MODE
/****************************************************************/
/*  Wait until the VTM thread is about to send a buffer.        */
/****************************************************************/
/* tek 19aug96 this is probably a bad way to do it; it is 
better to wait for the sync even that we get from those
forces going through..
*/
#ifdef API_DEBUG
sprintf(szTemp,"TTSReset wait for sync at %ld \n",timeGetTime());
OutputDebugString(szTemp);
#endif //API_DEBUG
#ifdef WIN32
			WaitForSingleObject(phTTS->hSyncEvent,INFINITE);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_WaitForEvent(phTTS->hSyncEvent, OP_INFINITE);
#endif
			//                while ( ! phTTS->bSendingBuffer )
			//        {
			//      Sleep( SEND_BUFFER_WAIT_TIME );
			//        }
#ifdef API_DEBUG
			sprintf(szTemp,"TTSReset sync'd at %ld\n",timeGetTime());
			OutputDebugString(szTemp);
#endif //API_DEBUG
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
#ifdef API_DEBUG
			if (pipe_count( pKsd_t->buffer_pipe ))
			{
				OutputDebugString("Reset return: still have buffers. \n");
			}
			OutputDebugString("TTSReset() exiting 2.\n");
#endif //API_DEBUG
			
			// 16jun97 tek bats385
			// merged 28jul97 tek
			phTTS->bInReset = FALSE;
			
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
	  /* MGS made change for SAPI so it wouldn't crash when exiting */
#if ! defined  OLEDECTALK && !defined SAPI5DECTALK
//	  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
//	  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
//	  TextToSpeechSpeakEx( phTTS, "", TTS_FORCE, FALSE );
#endif
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
  if (!bWasTyping)
#endif //TYPING_MODE
	  /********************************************************************/
	  /*  Empty all of the Text-To-Speech pipes.                          */
	  /********************************************************************/
	  mmStatus = WaitForEmptyPipes( phTTS,
	  MAXIMUM_RESET_WAIT_TIME_IN_MSEC,
	  TRUE );
  
  /********************************************************************/
  /*  Initialize the VTM, PH, LTS, and CMD threads.                   */
  /********************************************************************/
#ifdef API_DEBUG
sprintf(szTemp,"TTSReset init threads at %ld\n",timeGetTime());
  OutputDebugString(szTemp);  
#endif //API_DEBUG
  if ( phTTS->dwOutputState != STATE_OUTPUT_MEMORY )
  {
	  InitializeVTM(phTTS);
  };
  
  
  phinit( phTTS, bReset );
#ifdef TYPING_MODE
  if (!bWasTyping)
  {
#endif //TYPING_MODE
	  
	  ls_util_lts_init(phTTS->pLTSThreadData,phTTS->pKernelShareData);
	  
	  cmd_init( phTTS,bReset );
	  
#ifdef TYPING_MODE
  }
#endif //TYPING_MODE
  
  pKsd_t->halting = FALSE;
  // tek 22aug96 we still need to do a LAST_VOICE to make sure the VTM */
  // is in a nice state..
  {
    //#if defined __osf__ || defined __linux__
    //	  unsigned short LastVoice=LAST_VOICE;
    //	  write_pipe( pKsd_t->lts_pipe, &LastVoice, 1 );
    //#endif

    //#ifdef WIN32
	  unsigned short LastVoice[2];
#ifndef TYPING_MODE
		unsigned short phone;
#endif
	  LastVoice[0]=LAST_VOICE;
	  LastVoice[1]=SYNC;
#ifdef TYPING_MODE
	  //	if (bWasTyping)
	  //	{
#ifndef SINGLE_THREADED
	  write_pipe( pKsd_t->ph_pipe, &LastVoice, 2 );
#else
	  ph_loop(phTTS,LastVoice);
#endif
	  //	}
	  //	else
#else //TYPING_MODE
#ifndef SINGLE_THREADED
	  write_pipe( pKsd_t->lts_pipe, &LastVoice, 2 );
#else
	  lts_loop(phTTS,LastVoice);
#endif
	  /* GL 01/08/98  BATS#547  force a extra space after SYNC, VT/HT to fix the
	  dropping punctuation problem. */
	  phone = (PFASCII<<PSFONT) + ' ';
#ifndef SINGLE_THREADED
	  write_pipe( pKsd_t->lts_pipe, &phone, 1 );
#else
	  lts_loop(phTTS,&phone);
#endif
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
			phTTS->bInReset=FALSE; 
		  TextToSpeechCloseLogFile( phTTS );
			phTTS->bInReset=TRUE; 
		  break;
		  
	  case STATE_OUTPUT_SAPI5:
		  TextToSpeechCloseSapi5Output(phTTS);
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
#ifdef SPANISH_LA
	  pKsd_t->modeflag = MODE_CITATION | MODE_LATIN;
#else
	  pKsd_t->modeflag = MODE_CITATION;
#endif //SPANISH_LA
	  pKsd_t->sayflag = SAY_CLAUSE;
	  pKsd_t->pronflag = 0;
	  pKsd_t->wbreak = FALSE;
	  pKsd_t->text_flush = FALSE;
	  pKsd_t->async_change = FALSE;
	  phTTS->pKernelShareData->vol_att=100;	
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
#ifdef API_DEBUG
	  OutputDebugString("Reset return: still have buffers. \n");
#endif //API_DEBUG
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
  
#ifdef API_DEBUG
  sprintf(szTemp,"TTSReset() exiting 3 at %ld\n",timeGetTime());
  OutputDebugString(szTemp);
#endif //API_DEBUG
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

static void WaitForTextQueuingToComplete( LPTTS_HANDLE_T phTTS,	BOOL bReset )
{
	int iLockupCount=0;
#ifdef API_DEBUG
	char szTemp[256]="";
	ULONG ulStartTime, ulEndTime;
	ulStartTime=timeGetTime();
	sprintf(szTemp, "WFTQTC() at %ld.\n", ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	
	/********************************************************************/
	/*  Wait for the Text-To-Speech thread to complete text queueing.   */
	/*  up to all messages numbered uiLastTextMessageNumber.            */
	/********************************************************************/
	
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
				// MGS merge WIN32 and UNIX routines
				OP_SetEvent( phTTS->hSyncEvent );
				
				
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
			PumpModeMessage(phTTS->pAudioHandle);
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
#ifdef API_DEBUG
	ulEndTime=timeGetTime();
	sprintf(szTemp, "WFTQTC() exit %ld ms.\n", ulEndTime-ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	
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

#define  MAXIMUM_SYNC_WAIT_TIME_IN_MSEC  (1800000) // 30 minutes

// 16jun97 tek bats 385 - modified to bail out on resets
#define	SYNC_RESET_CHECK_INTERVAL	(30)

MMRESULT TextToSpeechSync( LPTTS_HANDLE_T phTTS )
{
	MMRESULT mmStatus = MMSYSERR_NOERROR;
	
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
 	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );
	
	/********************************************************************/
	/*  Resume if the text to speech system has been paused or this     */
	/*  function will block here forever.                               */
	/********************************************************************/
#ifndef OLEDECTALK
// MGS 02/15/2001 use the win32 code
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
		{
			WaitForTextQueuingToComplete( phTTS, FALSE );
		}
		
		/********************************************************************/
		/*  Now that all the text is queued, make sure that it is purged.   */
		/*  Four TTS_FORCE characters are used because of the way the       */
		/*  WaitForEmptyPipes() function performs the wait.                 */
		/********************************************************************/
		
		if (!phTTS->bInReset) // tek bats 385 merged 28jul97
		{
#ifdef UNDER_CE
			TextToSpeechSpeak( phTTS, _T(""), TTS_FORCE );
			TextToSpeechSpeak( phTTS, _T(""), TTS_FORCE );
#else
			TextToSpeechSpeak( phTTS, "", TTS_FORCE );
			//TextToSpeechSpeak( phTTS, "", TTS_FORCE ); /* tek 10jan97 don't need */
			//TextToSpeechSpeak( phTTS, "", TTS_FORCE );
			TextToSpeechSpeak( phTTS, "", TTS_FORCE );
#endif //UNDER_CE
		}
		
		/********************************************************************/
		/*  Now wait for all of the Text-To-Speech pipes to empty.          */
		/********************************************************************/
		/*  first, wait for the Text thread to complete all text queueing.  */
		/*  (tek 10jan97)                                                   */
		/********************************************************************/
//#ifdef WIN32
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
//#endif
		
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );

	if ( pdwRate == NULL )
		return( MMSYSERR_INVALPARAM );

	
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );

	if ( pSpeaker == NULL )
		return( MMSYSERR_INVALPARAM );


	/* Also initialized new element in KSD for MI : MVP */
	/* MGS 11/20/1998 BATS #571 Fixed TextToSpeechGetSpeaker */
	//*pSpeaker = (SPEAKER_T)(phTTS->pKernelShareData->uiCurrentSpeaker);
	*pSpeaker = (SPEAKER_T)(phTTS->pKernelShareData->last_voice);
	
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
		
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
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
	/* GL 11/19/1998  BATS#827 use correct version number set in coop.h */
	pTTScaps->Version = DTALK_MAJ_VERSION*100 + DTALK_MIN_VERSION;
	
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

#ifdef UNDER_CE
										LPTSTR szFileName 
#else
										LPSTR szFileName 										
#endif
										)
{
	// Added a local varaible to get the handle of current kernel_share_data handle :MVP
	PKSD_T pKsd_t;


#ifdef UNDER_CE	//29oct99 mfg convert unicode string to char string for Windows CE
char chFileName[128];
WideStringtoAsciiString(chFileName, szFileName, 128);
#endif
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );

	
	// Initialize with the pointer stored in phTTS :MVP */
	pKsd_t = phTTS->pKernelShareData ;
	
	
	
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
	// ETT: fixme? why is the linux one different?????!

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
return( load_dictionary((void **)&(pKsd_t->udic_index[pKsd_t->lang_curr]),
(void **)&(pKsd_t->udic_data[pKsd_t->lang_curr]),
(unsigned int *)&(pKsd_t->udic_entries[pKsd_t->lang_curr]),
(unsigned int *)&(pKsd_t->udic_bytes[pKsd_t->lang_curr]),
#ifdef CHEESY_DICT_COMPRESSION
				  NULL,
				  NULL,
#endif
szFileName,
1,
NULL,
NULL,
NULL,
MEMMAP_OFF));
#endif

#ifdef WIN32
	return( load_dictionary( phTTS,
		(void **)&(pKsd_t->udic_index[pKsd_t->lang_curr]),
		(void **)&(pKsd_t->udic_data[pKsd_t->lang_curr]),
		(unsigned int *)&(pKsd_t->udic_entries[pKsd_t->lang_curr]),
		(unsigned int *)&(pKsd_t->udic_bytes[pKsd_t->lang_curr]),
#ifdef CHEESY_DICT_COMPRESSION
				  NULL,
				  NULL,
#endif
#ifdef	UNDER_CE
		chFileName,
#else
		szFileName,
#endif
		TRUE,
		FALSE,
		NULL,
		NULL,
		NULL,
		MEMMAP_OFF));
#endif
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );	

	
	/* GL 11/05/1997  for BATS#510 */
	unload_dictionary((void **)&(phTTS->pKernelShareData->udic_index[phTTS->pKernelShareData->lang_curr]),
		(void **)&(phTTS->pKernelShareData->udic_data[phTTS->pKernelShareData->lang_curr]),
		(unsigned int *)&(phTTS->pKernelShareData->udic_entries[phTTS->pKernelShareData->lang_curr]),
		(unsigned int *)&(phTTS->pKernelShareData->udic_bytes[phTTS->pKernelShareData->lang_curr]),
		NULL,
		NULL,
		NULL,
		MEMMAP_OFF 
		);
	
	return( MMSYSERR_NOERROR );
#ifdef WIN32
	UNREFERENCED_PARAMETER( phTTS );
#endif
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
//#ifdef WIN32
	// tek bats385
	// we need the "buffer delay pipe" to make sure that we 
	// don't get stuck forever returning buffers if the
	// user buffer callback routine immediately returns buffers
	// during a reset.
	P_PIPE buffer_delay_pipe = NULL_PIPE;
//#endif
	MMRESULT mmStatus;
	
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS) || (phTTS == NULL)))
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

	case WAVE_FORMAT_08M16:
		
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
	
//#ifdef WIN32
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

#ifdef CUP28PROJECT
	phTTS->uiID_Buffer_Message = TTS_MSG_BUFFER;
#else

#ifdef WIN32
	phTTS->uiID_Buffer_Message =
#ifdef UNDER_CE
		RegisterWindowMessage(TEXT("DECtalkBufferMessage"));
#else
		RegisterWindowMessage("DECtalkBufferMessage");
#endif	/* UNDER_CE */
	
	if ( phTTS->uiID_Buffer_Message == 0 )
		return( MMSYSERR_ERROR );
	
#endif // WIN32
#endif // CUP28PROJECT

	/********************************************************************/
	/*  Create the memory buffer critical section.                      */
	/********************************************************************/
	
#ifdef WIN32
	phTTS->pcsMemoryBuffer =
		( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	phTTS->pcsMemoryBuffer = OP_CreateMutex();
#endif
	
	if ( phTTS->pcsMemoryBuffer == NULL )
	{
		DeleteTextToSpeechObjects( phTTS );
		return( MMSYSERR_NOMEM );
	}
	
#ifdef WIN32
	InitializeCriticalSection( phTTS->pcsMemoryBuffer );
#endif
	
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS==NULL))
		return( MMSYSERR_INVALHANDLE );
	
	/********************************************************************/
	/*  If not in MEMORY output state then return an error.             */
	/********************************************************************/
	
	if ( phTTS->dwOutputState != STATE_OUTPUT_MEMORY )
		return( MMSYSERR_ERROR );
	
//#ifdef WIN32 Fonix server fix
	// merged 28jul97 tek
	// 16jun97 tek bats 385 sync will hang forever if we don't clear
	// bInReset..

	// MGS change this code.  if we are in reset, don't call Sync
//	phTTS->bInReset = FALSE;
	if (!phTTS->bInReset)
//#endif
	
	/********************************************************************/
	/*  Halt the system and flush all data.                             */
	/********************************************************************/
	
	TextToSpeechSync( phTTS );
	
	// MGS moved this code up so that the rescources would not be in use
	// when freed below
	if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
		phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
	else
		phTTS->dwOutputState = STATE_OUTPUT_NULL;

	EnterCriticalSection(phTTS->pcsBufferPipe);	
	
	/********************************************************************/
	/*  Delete the memory buffer critical section.                      */
	/********************************************************************/
	
	if ( phTTS->pcsMemoryBuffer != NULL )
	{

#ifdef WIN32
		DeleteCriticalSection( phTTS->pcsMemoryBuffer );
		
		free( phTTS->pcsMemoryBuffer );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		OP_DestroyMutex( phTTS->pcsMemoryBuffer );
#endif
	}
	
	/********************************************************************/
	/*  Delete the memory buffer pipe.                                  */
	/********************************************************************/
	
	destroy_pipe( phTTS->pKernelShareData->buffer_pipe );
	// tek 30aug96 null the pointer.
	phTTS->pKernelShareData->buffer_pipe = NULL;
	
//#ifdef WIN32 // Fonix server 
	// merged 28jul97 tek
	// 16jun97 tek bats 385 (buffer delay)
	destroy_pipe( phTTS->pKernelShareData->buffer_delay_pipe );
	phTTS->pKernelShareData->buffer_delay_pipe = NULL;
//#endif
	
	/********************************************************************/
	/*  Set the system output state to audio if it is enabled.          */
	/********************************************************************/
	
	LeaveCriticalSection(phTTS->pcsBufferPipe);

	phTTS->pTTS_Buffer = NULL;
	
#ifdef MOVED_CODE_UP
	if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
		phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
	else
		phTTS->dwOutputState = STATE_OUTPUT_NULL;
#endif

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
	
#ifdef API_DEBUG
	OutputDebugString("TTSAddBuffer().\n");
	
	if (pTTS_Buffer == NULL)
	{
		OutputDebugString("  ..adding null buffer.\n");
	}
	else
	{
		OutputDebugString("  ..adding user buffer.\n");
	}
#endif //API_DEBUG
	
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
		
	if (pTTS_Buffer == NULL)
		return(MMSYSERR_INVALPARAM);

 
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS == NULL) )
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
#ifdef WIN32
	//LockPipe( phTTS->pKernelShareData->buffer_pipe );
	OP_LockMutex( phTTS->pcsBufferPipe);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	OP_LockMutex( phTTS->pcsBufferPipe);
#endif
	// check the state again as this could have been waiting on the mutex
	// and it was locked by TextToSpeechCloseInMemory
	if ( phTTS->dwOutputState != STATE_OUTPUT_MEMORY )
	{
		OP_UnlockMutex( phTTS->pcsBufferPipe );
		return( MMSYSERR_ERROR );
	}

	write_pipe( phTTS->pKernelShareData->buffer_pipe, pPipeArray, 1 );
	uiI = pipe_count( phTTS->pKernelShareData->buffer_pipe );
#ifdef WIN32
#ifdef API_DEBUG
	sprintf(szTemp,"Added buffer %08lx, count now %d\n",
		pPipeArray[0], uiI);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	OP_UnlockMutex( phTTS->pcsBufferPipe );
//	UnlockPipe( phTTS->pKernelShareData->buffer_pipe );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	OP_UnlockMutex( phTTS->pcsBufferPipe );
#endif
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
#ifdef API_DEBUG
	OutputDebugString("TTSReturnBuffer() ?? \n");
#endif //API_DEBUG
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)) || (phTTS == NULL))
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
#ifdef UNDER_CE
								wchar_t pszFileName[],
#else
								char pszFileName[],
#endif
								 DWORD dwFlags )
{
	MMRESULT mmStatus;
	
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS) || (phTTS == NULL)))
		return( MMSYSERR_INVALHANDLE );
	

	if (dwFlags == NULL)
		return( MMSYSERR_INVALPARAM );

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
	
#ifdef UNDER_CE
	if (( phTTS->pLogFile = CreateFile(pszFileName, GENERIC_WRITE, FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL)) == NULL )
#else
	if (( phTTS->pLogFile = fopen( pszFileName, "w" )) == NULL )
#endif
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
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS) || (phTTS == NULL)))
		return( MMSYSERR_INVALHANDLE );

	/********************************************************************/
	/*  Wait until all previous calls to the TextToSpeechSpeak()        */
	/*  function have completed.                                        */
	/********************************************************************/
	// tek 29jan99 bats 849: this must be done before the logflag is cleared.
	mmStatus = TextToSpeechSync( phTTS );
	
	if ( mmStatus )
		mmStatus = MMSYSERR_ERROR;
	else
		mmStatus = MMSYSERR_NOERROR;
		
#ifdef WIN32
	/********************************************************************/
	/*  Disable writing to the log file.                                */
	/********************************************************************/
	
	phTTS->pKernelShareData->logflag = 0;       /* BATS#120 FIX TK & JL */
#endif
	
	/********************************************************************/
	/*  If a file is not open, then exit.                               */
	/********************************************************************/
	

	EnterCriticalSection( phTTS->pcsLogFile );

	if ( phTTS->dwOutputState != STATE_OUTPUT_LOG_FILE )
	{

		LeaveCriticalSection( phTTS->pcsLogFile );

		return( MMSYSERR_ERROR );
	}
	

#ifdef WIN32
	/********************************************************************/
	/*  Make sure data has been written to the file.                    */
	/********************************************************************/

#if (UNDER_CE == 211) || (UNDER_CE == 200)
	_flushall; 
#else
	_flushall();
#endif // (UNDER_CE == 211) || (UNDER_CE == 200)


#endif // WIN32
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	/********************************************************************/
	/*  Disable writing to the log file.                                */
	/********************************************************************/
	
	phTTS->pKernelShareData->logflag = 0;
#endif
	
	/********************************************************************/
	/*  Set the system output state to audio if it is enabled.          */
	/********************************************************************/
	
	if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
	{
		phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
		TextToSpeechReset(phTTS,FALSE); // tek 28jan99 bats 849: this resets the counters..
	}
	else
		phTTS->dwOutputState = STATE_OUTPUT_NULL;
	
	/********************************************************************/
	/*  Close the log file.                                             */
	/********************************************************************/
	
#ifdef UNDER_CE
	if ( CloseHandle( phTTS->pLogFile)==0)
#else
	if ( fclose( phTTS->pLogFile ))
#endif
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
	short * pShort;                /*tek/bh 29jul96 */
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
#ifdef API_DEBUG
			OutputDebugString("Q2M getting buffer.\n");
#endif //API_DEBUG
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
	
#ifdef API_DEBUG
			OutputDebugString("Q2M null bailout.\n");
#endif //API_DEBUG
			return;
		}
		
		if (phTTS->bMemoryReset)
		{ // tek I think we have to do a leaveCS here.. 

			LeaveCriticalSection( phTTS->pcsMemoryBuffer );

			SendBuffer(phTTS); //tek 03sep96
#ifdef API_DEBUG
			OutputDebugString("Q2M reset bailout.\n");
#endif //API_DEBUG
			return;
		}       
		
		if  (phTTS->pKernelShareData->halting)
		{ // tek I think we have to do a leaveCS here.. 

			LeaveCriticalSection( phTTS->pcsMemoryBuffer );

			SendBuffer(phTTS); //tek 03sep96
#ifdef API_DEBUG
			OutputDebugString("Q2M halt bailout.\n");
#endif //API_DEBUG
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
		case WAVE_FORMAT_08M16:
			
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
	
	read_pipeEx( &(phTTS->pKernelShareData->buffer_pipe), &pTTS_BufferArray[0], 1 );
	
	pTTS_Buffer = pTTS_BufferArray[0];
	
	if ( pTTS_Buffer != NULL )
	{
		pTTS_Buffer->dwBufferLength = 0;
		pTTS_Buffer->dwNumberOfPhonemeChanges = 0;
		pTTS_Buffer->dwNumberOfIndexMarks = 0;
		
		if ( phTTS->dwFormat == WAVE_FORMAT_1M16 || phTTS->dwFormat == WAVE_FORMAT_08M16)
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
#ifdef API_DEBUG
	OutputDebugString("SendBuffer().\n");
#endif //API_DEBUG
	if ( (! phTTS->bMemoryReset)
		&& (! phTTS->pKernelShareData->halting))
	{
#ifdef API_DEBUG
		OutputDebugString(" SB (!reset).\n");
#endif //API_DEBUG

		if ( phTTS->pTTS_Buffer != NULL )
		{
			EnterCriticalSection( phTTS->pcsMemoryBuffer );
			
			pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer;
			phTTS->pTTS_Buffer=NULL;
			
			LeaveCriticalSection( phTTS->pcsMemoryBuffer );
			
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
#ifdef API_DEBUG
					OutputDebugString("returning partial buffer.\n");
#endif //API_DEBUG
					
					Report_TTS_Status(phTTS,phTTS->uiID_Buffer_Message,0,(LPARAM)pTTS_Buffer);
					//phTTS->pTTS_Buffer = NULL;
					
					phTTS->bSendingBuffer = FALSE;
					
#ifdef WIN32
					WaitForSingleObject( phTTS->hNotEmptyingVtmPipeEvent, INFINITE );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
					OP_WaitForEvent( phTTS->hNotEmptyingVtmPipeEvent, OP_INFINITE );
#endif

				}
			}
		}
	}
	else
	{
#ifdef API_DEBUG
		OutputDebugString("SB (reset)\n");
		if (phTTS->pKernelShareData->halting)
			OutputDebugString("SB halting.. \n");
		if (phTTS->bMemoryReset)
			OutputDebugString("SB memreset.. \n");
#endif //API_DEBUG
		
		/******************************************************************/
		/*  Send the current buffer back.                                 */
		/******************************************************************/
		EnterCriticalSection( phTTS->pcsMemoryBuffer );

		pTTS_Buffer = (LPTTS_BUFFER_T) phTTS->pTTS_Buffer;
		phTTS->pTTS_Buffer=NULL;
		
		LeaveCriticalSection( phTTS->pcsMemoryBuffer );
		
		if ( pTTS_Buffer != NULL )
		{
#ifdef API_DEBUG
			OutputDebugString("SB return current buf. \n");
#endif //API_DEBUG
			
			/****************************************************************/
			/*  NULL buffers sent by reset to fix hang. WIH 3/27/95         */
			/*  This is needed in spite of previous "if" statement because  */
			/*  the app is multip-threaded.                                 */
			/****************************************************************/
			
				phTTS->bSendingBuffer = TRUE;
				/*
				SendMessage( phTTS->hWnd,
				phTTS->uiID_Buffer_Message,
				0,
				(LPARAM)pTTS_Buffer );
				*/
				//MVP: Replaced above SendMessage with Report_TTS_status :New Audio code
#ifdef API_DEBUG
				OutputDebugString(" returning a buffer.. \n");
#endif //API_DEBUG
				
				Report_TTS_Status(phTTS,phTTS->uiID_Buffer_Message,0,(LPARAM)pTTS_Buffer);
				
				phTTS->bSendingBuffer = FALSE;
			

#ifdef WIN32
				WaitForSingleObject( phTTS->hNotEmptyingVtmPipeEvent, INFINITE );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
				OP_WaitForEvent( phTTS->hNotEmptyingVtmPipeEvent, OP_INFINITE );
#endif

			
		}

		
		// tek 03sep96 moved the return of remaining buffers out to 
		// a separate routine.
		ReturnRemainingBuffers(phTTS);
		
		// tek 29aug96 if we're in a flusg, put in another null buffer.. 
		if (phTTS->pKernelShareData->halting  && phTTS->dwOutputState == STATE_OUTPUT_MEMORY)
			TextToSpeechAddBuffer(phTTS, NULL); // a dummy buffer.
		/******************************************************************/
		/*  Empty the VTM pipe in case there is still any data in it      */
		/******************************************************************/
		
		InitializeVTM(phTTS);
		
		//phTTS->pTTS_Buffer = NULL;
		//tek 03sep96 we can't clear this flag here, because  vtm writes
		// that sneak in at the 'right' time could prematurely clear it.
		//phTTS->bMemoryReset = FALSE;
		
#ifdef WIN32
		SetEvent( phTTS->hNotEmptyingVtmPipeEvent );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		OP_SetEvent( phTTS->hNotEmptyingVtmPipeEvent );
#endif
	}
#ifdef API_DEBUG
	OutputDebugString("SB done.\n");
#endif //API_DEBUG
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
#ifdef WIN32
	UINT	uiPipeCount=0;				// 16jun97 tek bats 385 merged 28jul97
	
#ifdef API_DEBUG
	OutputDebugString("ReturnRemainingBuffers()\n");
#endif //API_DEBUG
#endif
	
    /******************************************************************/
	/*  Send all the remaining buffers back.                          */
	/******************************************************************/
	
	// tek 03sep96 we need to lock the pipe to make sure nothing arrives
    // while we're dumping.. 
#ifdef WIN32
	// 16jun97 tek bats 385: (merged 28jul97)
	// the user callback may be coded to just return buffers, and that 
	// would result in an infinite loop if we just tried to drain the pipe.
	// Soooo.. we empty the pipe into an cache, and then return the buffers
	// from the cache; this means the user callback is filling a different
	// pipe and thus we won't loop forever.
    //LockPipe(phTTS->pKernelShareData->buffer_pipe);
    OP_LockMutex(phTTS->pcsBufferPipe);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
    OP_LockMutex(phTTS->pcsBufferPipe);
#endif
	
	while (pipe_count( phTTS->pKernelShareData->buffer_pipe )  && phTTS->dwOutputState == STATE_OUTPUT_MEMORY)
	{
		read_pipeEx( &(phTTS->pKernelShareData->buffer_pipe), &pPipeArray, 1 );
//#ifdef WIN32
		write_pipe(phTTS->pKernelShareData->buffer_delay_pipe, pPipeArray, 1 );
	}
//	OP_UnlockMutex(phTTS->pcsBufferPipe);
	//UnlockPipe(phTTS->pKernelShareData->buffer_pipe);
	
	while (pipe_count( phTTS->pKernelShareData->buffer_delay_pipe ) && phTTS->dwOutputState == STATE_OUTPUT_MEMORY)
	{
		read_pipeEx( &(phTTS->pKernelShareData->buffer_delay_pipe), &pPipeArray, 1 );
		
//#endif
//#if defined __osf__ || defined __linux__ || defined VXWORKS
		OP_UnlockMutex(phTTS->pcsBufferPipe);
//#endif
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
#ifdef API_DEBUG
			OutputDebugString(" returning a remaining buffer.. \n");
#endif //API_DEBUG
			Report_TTS_Status(phTTS,phTTS->uiID_Buffer_Message,0,(LPARAM)pTTS_Buffer);
			
			phTTS->bSendingBuffer = FALSE;
#ifdef WIN32
			WaitForSingleObject( phTTS->hNotEmptyingVtmPipeEvent, INFINITE );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_WaitForEvent( phTTS->hNotEmptyingVtmPipeEvent, OP_INFINITE );
#endif
		}
		// relock the pipe to atomically get a count and a buffer.
		// LockPipe(phTTS->pKernelShareData->buffer_pipe);
//#if defined __osf__ || defined __linux__
		OP_LockMutex(phTTS->pcsBufferPipe);
//#endif
	}
	//  UnlockPipe(phTTS->pKernelShareData->buffer_pipe);
//#if defined __osf__ || defined __linux__
	OP_UnlockMutex(phTTS->pcsBufferPipe);
//#endif
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
	
//#if defined __osf__ || defined __linux__ // remove this ifdef as all code should be checking this
	/********************************************************************/
	/*   If current in the Reset code, no need to continue              */
	/********************************************************************/
	if ( phTTS->bInReset )
		return;
//#endif
	
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
	
//#ifdef WIN32 // remove this ifdef as all code should be checking this
	/********************************************************************/
	/*   If current in the Reset code, no need to continue              */
	/********************************************************************/
	if ( phTTS->bInReset )
		return;
//#endif
	
	
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

#if defined WIN32 && !defined NOWIN
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
#endif // WIN32 && !defined NOWIN
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined NOWIN

static OP_THREAD_ROUTINE(TextToSpeechThreadMain, LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PVOID pCmd_t = phTTS->pCMDThreadData;
	unsigned int uiCurrentTextLength;
	unsigned int uiLength;
	unsigned char *pText;
	char FlushString[1];
	TEXT_MSG_T * pTextMsg;
	TEXT_MSG_T * pNextTextMsg;
	int nbw = 0;
	int nbytes = 0;
	int i = 0;
	
	/* Initialize thread error field to no error */
	phTTS->uiThreadError = MMSYSERR_NOERROR;
	
	/* 
	* CP: Set the event, even if malloc eerror occurred. User
	* will look at uiThreadError for actual error code.
	*/
	OP_SetEvent(phTTS->hMallocSuccessEvent);
	
	while( ! phTTS->uiTextThreadExit )
	{
		/******************************************************************/
		/*  Wait until the TextToSpeechSpeak() function queues some text. */
		/******************************************************************/
		
		OP_WaitForEvent( phTTS->hTextInQueueEvent, OP_INFINITE );
		
		/********************************************************************/
		/*  Get the next text message from the top of the linked list.      */
		/********************************************************************/
		
		OP_LockMutex( phTTS->pcsTextMsgList );
		
		pTextMsg = phTTS->pTextMsgList;
		
		/********************************************************************/
		/*  It should not be possible to get here with the text list empty  */
		/*  but this check can't hurt.                                      */
		/********************************************************************/
		
		if ( pTextMsg != NULL )
		{	
			pNextTextMsg = pTextMsg->pLink;
			pText = pTextMsg->pText;
			uiCurrentTextLength = pTextMsg->uiLength;
			phTTS->pTextMsgList = pNextTextMsg;
		}
		else
		{
			pText = NULL;
			uiCurrentTextLength = 0;
		}
		
		if ( phTTS->pTextMsgList == NULL )
		{
			OP_ResetEvent( phTTS->hTextInQueueEvent );
		}
		
		OP_UnlockMutex( phTTS->pcsTextMsgList );
		
		/********************************************************************/
		/*  Increment the queued character count.                           */
		/********************************************************************/
		

		if ( uiCurrentTextLength != 0 )
		{
			
			OP_LockMutex(phTTS->pcsFlushMsgNumber);
	
			if (pTextMsg->uiMsgNumber > phTTS->uiFlushMsgNumber)
			{
				OP_UnlockMutex(phTTS->pcsFlushMsgNumber);
				/******************************************************************/
				/*  Queue the text unless a TextToSpeechReset() forces an abort   */
				/*  by setting the ppTTS->pKernelShareData->halting flag.         */
				/*  Write the text in 4096 byte chunks                            */
				/******************************************************************/
				
				uiLength = uiCurrentTextLength;
				
				while (( uiLength > MAX_TEXT_WRITE_LENGTH ) && ( ! (pKsd_t->halting )))
				{
/* ******************* NOT USED ********************************** */
#if 0
					nbytes =
						uiLength > MAX_TEXT_WRITE_LENGTH ? MAX_TEXT_WRITE_LENGTH : uiLength;
#endif // 0
/* *************************************************************** */

					write_pipe( pKsd_t->cmd_pipe, pText, MAX_TEXT_WRITE_LENGTH );
					uiLength -= MAX_TEXT_WRITE_LENGTH;
					pText += MAX_TEXT_WRITE_LENGTH;

/* ******************* NOT USED ********************************** */
#if 0
					if ( nbw != nbytes )
						break;
#endif // 0
/* *************************************************************** */
				}
				
				/********************************************************************/
				/*  Save this message number in the Text-To-Speech handle for       */
				/*  the TextToSpeechSync() function.                                */
				/********************************************************************/

				OP_LockMutex( phTTS->pcsLastQueuedTextMsgNumber );
				phTTS->uiLastTextMsgNumber = pTextMsg->uiMsgNumber;
				OP_UnlockMutex( phTTS->pcsLastQueuedTextMsgNumber );

				
				if (( uiLength > 0 ) && ( ! (pKsd_t->halting )))
				{
					write_pipe( pKsd_t->cmd_pipe, pText, uiLength );
				}

				
				if ( pTextMsg->pText != NULL )
					free( pTextMsg->pText );
				
				if ( pTextMsg != NULL )
					free( pTextMsg );
			}
			else
			{
				OP_UnlockMutex(phTTS->pcsFlushMsgNumber);
			}
	
			OP_LockMutex( phTTS->pcsLastQueuedTextMsgNumber );
			phTTS->uiLastQueuedTextMsgNumber = pTextMsg->uiMsgNumber;
			OP_UnlockMutex( phTTS->pcsLastQueuedTextMsgNumber );
		}

		/********************************************************************/
		/*  Decrement the queued character count.                           */
		/********************************************************************/
		
		OP_LockMutex( phTTS->pcsQueuedCharacterCount );
		phTTS->uiQueuedCharacterCount -= uiCurrentTextLength;
		OP_UnlockMutex( phTTS->pcsQueuedCharacterCount );
	}
	
	/********************************************************************/
	/*  Exit the thread.                                                */
	/********************************************************************/
	
	OP_ExitThread( 0 );
	
	OP_THREAD_RETURN;
}
#endif // defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_

#if defined WIN32 && !defined NOWIN
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
#ifndef	UNDER_CE 
	char wndclass[255];	// Window Class (KSB Aug-13-97)
#else
	static TCHAR wndclass[255];
#endif
	
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
#ifdef UNDER_CE	
	wsprintf(wndclass,TEXT("%s_%08X"),TEXTTOSPEECHWNDCLASS,(unsigned long int) phTTS);
#else
	sprintf(wndclass,"%s_%08X",TEXTTOSPEECHWNDCLASS,(unsigned long int) phTTS);
#endif
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
	wc.style =         0;
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
		TEXT("TextToSpeech Output, v1.0"),
		WS_CLIPCHILDREN | WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		NULL,
		NULL,
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
#ifdef API_DEBUG //tek 12aug97
	{
		char szTemp[256]="";
		sprintf(szTemp,"Process_TTS_Message #%u at %lu\n",
			pTextMsg->uiMsgNumber,
			timeGetTime());
		OutputDebugString(szTemp);
	}
#endif //API_DEBUG
	
	/********************************************************************/
	/*  If the posted Text-To-Speech message number is less than the    */
	/*  message number of the last flush message, then throw the        */
	/*  Text-To-Speech message away.                                    */
	/********************************************************************/
	
	EnterCriticalSection( phTTS->pcsFlushMsgNumber );
	
	if ( pTextMsg->uiMsgNumber > phTTS->uiFlushMsgNumber )
	{
		LeaveCriticalSection( phTTS->pcsFlushMsgNumber );
#ifdef API_DEBUG
		OutputDebugString("  .. TTSMessage processing.\n");
#endif //API_DEBUG
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
#ifdef API_DEBUG
		OutputDebugString(" .. tossing textmsg due to flush.\n");
#endif //API_DEBUG
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
#endif	/*#if defined WIN32 && !defined NOWIN*/

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
/*    LPTTS_HANDLE_T phTTS	text-to-speech handle                     */
/*                                                                    */
/*    UINT uiErrorCode		An application defined error code.        */
/*                                                                    */
/*    MMRESULT mmStatus     An error code of type MMRESULT.           */
/*                                                                    */
/*  Output:	void                                                      */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void TextToSpeechErrorHandler( LPTTS_HANDLE_T phTTS, UINT uiErrorCode, 
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
#ifdef API_DEBUG
		OutputDebugString("returning error message. \n");
#endif //API_DEBUG
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
/*  Input:                                                            */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a a pointer to the Text-To-Speech handle. */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/* This function will become obsolete for MI : MVP  */

/* **************** NOT USED ************************************* */
#if 0
LPTTS_HANDLE_T TextToSpeechGetHandle()
{
	/*return( phTTSglobal );*/
}
#endif // 0
/* *************************************************************** */

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
#ifdef UNDER_CE
  	DWORD dwRW;
#endif	
	/********************************************************************/
	/*  Convert the 16 bit samples to the desired output format.        */
	/********************************************************************/
	
	switch( phTTS->dwFormat )
	{
	case WAVE_FORMAT_1M16:
		
		Size = sizeof( short );
#ifdef _BIGENDIAN_
		if (phTTS->bisau==0)
		{
			for (i=0;i<uiLength;i++)
				pBuffer[i]=SWAP_16_LITTLE(pBuffer[i]);
		}
#else
		if (phTTS->bisau==1)
		{
			printf("pBuffer=0x%0x",pBuffer[0]);
			for (i=0;i<uiLength;i++)
				pBuffer[i]=SWAP_16_BIG(pBuffer[i]);
			printf("pBuffer=0x%0x\n",pBuffer[0]);
		}
#endif
		
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
		
	case WAVE_FORMAT_08M16:

		Size = sizeof( short );
#ifdef _BIGENDIAN_
		if (phTTS->bisau==0)
		{
			for (i=0;i<uiLength;i++)
				pBuffer[i]=SWAP_16_LITTLE(pBuffer[i]);
		}
#else
		if (phTTS->bisau==1)
		{
			printf("pBuffer=0x%0x",pBuffer[0]);
			for (i=0;i<uiLength;i++)
				pBuffer[i]=SWAP_16_BIG(pBuffer[i]);
			printf("pBuffer=0x%0x\n",pBuffer[0]);
		}
#endif
	default:
		
		return( MMSYSERR_INVALHANDLE );
	}
	
	/********************************************************************/
	/*  Write the audio samples to the output file.                     */
	/********************************************************************/
#ifdef UNDER_CE	
	if( WriteFile(phTTS->pWaveFile,(char *)pBuffer,Size*uiLength,&dwRW,NULL) == 0 )
#else
	if ( uiLength != fwrite( (char *)pBuffer, Size, (size_t)uiLength, phTTS->pWaveFile ) )
#endif
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

unsigned char LinearToMuLaw( short wSample )
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

MMRESULT WaitForLtsFlush( LPTTS_HANDLE_T phTTS,	DWORD dwWaitTimeInMsec)
{
	BOOL bPipesNotEmpty;
	UINT uiSyncCount;
#ifndef SINGLE_THREADED
	UINT uiVtmCount;
	UINT uiPhCount;
	UINT uiLtsCount;
#endif
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
#ifndef SINGLE_THREADED
		uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
		uiPhCount = pipe_count( pKsd_t->ph_pipe );
		uiLtsCount = pipe_count( pKsd_t->lts_pipe );
#endif
		
		if  (( uiSyncCount != 0 )
#ifndef SINGLE_THREADED
			|| ( uiVtmCount != 0 )
			|| ( uiPhCount != 0 )
			|| ( uiLtsCount != 0 )
#endif
			)
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
#ifndef SINGLE_THREADED
			uiLtsCount = pipe_count( pKsd_t->lts_pipe );
			uiPhCount = pipe_count( pKsd_t->ph_pipe );
			uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
#endif
			uiSyncCount = pipe_count( pKsd_t->sync_pipe );
			/*
			kernel_enable( pKsd_t, uiDummy );
			*/
			if  (( uiSyncCount != 0 )
#ifndef SINGLE_THREADED
				|| ( uiVtmCount != 0 )
				|| ( uiPhCount != 0 )
				|| ( uiLtsCount != 0 )
#endif
				)
				bPipesNotEmpty = TRUE;
			else
				bPipesNotEmpty = FALSE;
		}
		
		/******************************************************************/
		/*  Go to sleep for WAIT_PIPE_SLEEP_TIME msec.                    */
		/******************************************************************/
		
		if ( bPipesNotEmpty )
		{
#ifdef WIN32
			PumpModeMessage(phTTS->pAudioHandle);
			Sleep( uiSleepTime );
			dwTotalTimeInMsec += uiSleepTime;
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			if (uiSleepTime==1)
			{
				sched_yield();
			}
			else
				OP_Sleep( uiSleepTime );
			dwTotalTimeInMsec += uiSleepTime;
#endif
			
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
	UINT uiCmdCount;
#ifndef SINGLE_THREADED
	UINT uiVtmCount=0;
	UINT uiPhCount;
	UINT uiLtsCount;
	UINT uiOldVtmCount=0;
	UINT uiOldPhCount;
	UINT uiOldLtsCount;
#endif

	UINT uiOldCmdCount;
#ifdef API_DEBUG
	char szTemp[256]="";
	ULONG ulStartTime, ulEndTime;
#endif //API_DEBUG
	
	/* Added a varaible to get current instance Kernel_Share_Data 
	* and initialize from phTTS structure
	*/
	PKSD_T pKsd_t = NULL;
	
#ifdef API_DEBUG
	ulStartTime=timeGetTime();
	sprintf(szTemp,"FixMemoryLockup() at %ld",ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	
	pKsd_t = phTTS->pKernelShareData;
	
	/********************************************************************/
	/*  Wait for all the pipes to change.                               */
	/*  If the pipes are not changing then go to sleep                  */
	/********************************************************************/
	// MGS mrege WIN32 and UNIX code with opthread routines...
	OP_SetEvent( phTTS->hSyncEvent );
	
#ifndef SINGLE_THREADED
	uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
	uiPhCount = pipe_count( pKsd_t->ph_pipe );
	uiLtsCount = pipe_count( pKsd_t->lts_pipe );
#endif
	uiCmdCount = pipe_count( pKsd_t->cmd_pipe );
	
#ifndef SINGLE_THREADED
	uiOldVtmCount = uiVtmCount;
	uiOldPhCount = uiPhCount;
	uiOldLtsCount = uiLtsCount;
#endif
	uiOldCmdCount = uiCmdCount;
	
	uiLockedUpCount = 0;
	bPipesNotChanging = TRUE;
	
	if (
#ifndef SINGLE_THREADED
		(uiVtmCount) || (uiPhCount) || 
		(uiLtsCount) ||
#endif
		 (uiCmdCount) 
		)
	{ 
		while ( bPipesNotChanging )
		{

			PumpModeMessage(phTTS->pAudioHandle);
			Sleep( MEMORY_LOCKUP_SLEEP_TIME );
			
#ifndef SINGLE_THREADED
			uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
			uiPhCount = pipe_count( pKsd_t->ph_pipe );
			uiLtsCount = pipe_count( pKsd_t->lts_pipe );
#endif
			uiCmdCount = pipe_count( pKsd_t->cmd_pipe );
			
			/******************************************************************/
			/*  Are any of the the pipes changing ?                           */
			/******************************************************************/
			
			if (
				(
#ifndef SINGLE_THREADED
				(uiVtmCount) || (uiPhCount) || 
				(uiLtsCount) || 
#endif
				(uiCmdCount) 
				)
				&&
				(  
#ifndef SINGLE_THREADED
				( uiVtmCount == uiOldVtmCount ) &&
				( uiPhCount == uiOldPhCount ) &&
				( uiLtsCount == uiOldLtsCount ) &&
#endif
				( uiCmdCount == uiOldCmdCount )
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
					
#ifdef WIN32
					ResetEvent( phTTS->hNotEmptyingVtmPipeEvent );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
					OP_ResetEvent( phTTS->hNotEmptyingVtmPipeEvent );
#endif
					
					if ( phTTS->bSendingBuffer )
					{
#ifndef SINGLE_THREADED
						EmptyVtmPipe(phTTS->pKernelShareData);
#endif
					}
#ifdef WIN32
					SetEvent( phTTS->hNotEmptyingVtmPipeEvent );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
					OP_SetEvent( phTTS->hNotEmptyingVtmPipeEvent );
#endif
					if (phTTS->bInReset)
						DrainPipes(phTTS);
				}
				
#ifndef SINGLE_THREADED
				uiOldVtmCount = uiVtmCount;
				uiOldPhCount = uiPhCount;
				uiOldLtsCount = uiLtsCount;
#endif
				uiOldCmdCount = uiCmdCount;
			}
			else
			{
				bPipesNotChanging = FALSE;
			}
		}
	} // if pipes not empty
#ifdef API_DEBUG
	ulEndTime=timeGetTime();
	sprintf(szTemp,"FixMemoryLockup() exit %ld ms",ulEndTime-ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	
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
	UINT uiCmdCount;
	UINT uiOldSyncCount;
#ifndef SINGLE_THREADED
	UINT uiVtmCount=0;
	UINT uiPhCount;
	UINT uiLtsCount;

	UINT uiOldVtmCount;
	UINT uiOldPhCount;
	UINT uiOldLtsCount;
#endif

	UINT  uiOldCmdCount;
	UINT  uiSleepTime;
	DWORD dwTotalTimeInMsec;
#ifdef API_DEBUG
	char szTemp[256]="";
	ULONG ulStartTime, ulEndTime;
#endif //API_DEBUG
	/* Added a varaible to get current instance Kernel_Share_Data 
	* and initialize from phTTS structure
	*/
	PKSD_T pKsd_t = NULL;
#ifdef API_DEBUG
	ulStartTime=timeGetTime();
	sprintf(szTemp,"WaitForEmptyPipes reset(%d) at %ld\n",bReset,ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	
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
#ifndef SINGLE_THREADED
	uiOldVtmCount = 0xFFFFFFFF;
	uiOldPhCount = 0xFFFFFFFF;
	uiOldLtsCount = 0xFFFFFFFF;
#endif
	uiOldCmdCount = 0xFFFFFFFF;
	uiLockedUpCount = 0;
	bPipesNotEmpty = TRUE;
	
	while ( bPipesNotEmpty )
	{
		bPipesNotEmpty = FALSE;
		
		if ( bReset )
#ifdef WIN32
			SetEvent( phTTS->hSyncEvent );
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
		OP_SetEvent( phTTS->hSyncEvent );
#endif
		
		uiSyncCount = pipe_count( pKsd_t->sync_pipe );
#ifndef SINGLE_THREADED
		uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
		uiPhCount = pipe_count( pKsd_t->ph_pipe );
		uiLtsCount = pipe_count( pKsd_t->lts_pipe );
#endif
		uiCmdCount = pipe_count( pKsd_t->cmd_pipe );
		
		if  (( uiSyncCount != 0 )
#ifndef SINGLE_THREADED
			|| ( uiVtmCount != 0 )
			|| ( uiPhCount != 0 )
			|| ( uiLtsCount != 0 )
#endif
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
#ifndef SINGLE_THREADED
			uiLtsCount = pipe_count( pKsd_t->lts_pipe );
			uiPhCount = pipe_count( pKsd_t->ph_pipe );
			uiVtmCount = pipe_count( pKsd_t->vtm_pipe );
#endif
			uiSyncCount = pipe_count( pKsd_t->sync_pipe );
			/*
			kernel_enable( pKsd_t, uiDummy );
			*/
			if  (( uiSyncCount != 0 )
#ifndef SINGLE_THREADED
				|| ( uiVtmCount != 0 )
				|| ( uiPhCount != 0 )
				|| ( uiLtsCount != 0 )
#endif
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
			
#ifdef API_DEBUG
			sprintf(szTemp,"WaitForEmptyPipes: c:%d l:%d p:%d v:%d s:%d at %ld\n",
				uiCmdCount,
				uiLtsCount,
				uiPhCount,
				uiVtmCount,
				uiSyncCount,
				timeGetTime());
			OutputDebugString(szTemp);
#endif //API_DEBUG
			
#ifdef WIN32
			
			PumpModeMessage(phTTS->pAudioHandle);
			Sleep( uiSleepTime );
			
			dwTotalTimeInMsec += (uiSleepTime);
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
			OP_Sleep( WAIT_PIPE_SLEEP_TIME );
			
			dwTotalTimeInMsec += WAIT_PIPE_SLEEP_TIME;
#endif
			
			if ( dwTotalTimeInMsec > dwWaitTimeInMsec )
			{
#ifdef API_DEBUG
				OutputDebugString("  ..WFPE() timed out!\n");
#endif //API_DEBUG
				return( MMSYSERR_ERROR );
			}
		}
		
		/******************************************************************/
		/*  If this is a reset then check to see if nothing is happening. */
		/*  If any of the threads block then the pipe state may not       */
		/*  change.                                                       */
		/******************************************************************/
		
		if  (( bReset )  && (uiSyncCount || 
#ifndef SINGLE_THREADED
			uiVtmCount || 
			uiPhCount ||
			uiLtsCount || 
#endif
			uiCmdCount ) 
			&& ( (uiSyncCount == uiOldSyncCount) )
#ifndef SINGLE_THREADED
			&& ( (uiVtmCount == uiOldVtmCount) )
			&& ( (uiPhCount == uiOldPhCount) )
			&& ( (uiLtsCount == uiOldLtsCount) )
#endif
			&& ( (uiCmdCount == uiOldCmdCount) ))
		{
			/****************************************************************/
			/*  Perform an audio reset to immediately stop audio from       */
			/*  playing and to make sure the VTM thread is not blocked.     */
			/****************************************************************/
#ifdef API_DEBUG
		OutputDebugString("WFEP resetting audio\n");	
#endif
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
#ifdef API_DEBUG
			OutputDebugString("Lockup set to 0\n");
#endif
			uiLockedUpCount = 0;
		}
		
		uiOldSyncCount = uiSyncCount;
#ifndef SINGLE_THREADED
		uiOldVtmCount = uiVtmCount;
		uiOldPhCount = uiPhCount;
		uiOldLtsCount = uiLtsCount;
#endif
		uiOldCmdCount = uiCmdCount;
		
		if (uiLockedUpCount>=2)	
		{
#ifdef API_DEBUG
			OutputDebugString("  ..wfep() Forcing pipes\n");
#endif
			DrainPipes(phTTS);
		}
		if ( uiLockedUpCount >= WAIT_PIPE_ABORT_COUNT )
		{
#ifdef API_DEBUG
			OutputDebugString("  ..WFPE() lockup failure?\n");
#endif //API_DEBUG
			return( MMSYSERR_ERROR );
		}
  }
#ifdef API_DEBUG
  ulEndTime=timeGetTime();
  sprintf(szTemp,"WaitForEmptyPipes exit at %ld (%ld) ms\n",
	  ulEndTime, ulEndTime - ulStartTime);
  OutputDebugString(szTemp);
#endif //API_DEBUG
  
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
	
#ifdef API_DEBUG
	OutputDebugString("PlayAudioCallbackRoutine().\n");
#endif //API_DEBUG
	/********************************************************************/
	/*  Get the DECtalk error message.                                  */
	/********************************************************************/
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	uiID_Error_Msg = ((LPTTS_HANDLE_T)aInstance)->uiID_Error_Message;
#endif
	
#if defined WIN32 && !defined NOWIN
#ifdef UNDER_CE
   uiID_Error_Msg = RegisterWindowMessage(_T("DECtalkErrorMessage"));
#else
    uiID_Error_Msg = RegisterWindowMessage("DECtalkErrorMessage");
#endif
#endif
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
#ifdef WIN32
void Report_TTS_Status( LPTTS_HANDLE_T ttsHandle,
					   UINT uiMsg,
					   long lParam1,
					   long lParam2 )
{
	if (lParam1 == TTS_AUDIO_PLAY_START)	ttsHandle->IsSpeaking = TRUE;	// KSB - Used for start of speech
	if (lParam1 == TTS_AUDIO_PLAY_STOP)	ttsHandle->IsSpeaking = FALSE;	// KSB - Used for end of speech
	
	if (ttsHandle->DtCallbackRoutine != NULL)
	{
#ifdef API_DEBUG
		char szTemp[256]="";
		sprintf(szTemp,"RTTSStatus(%08lx %08lx)\n",
			lParam1, lParam2);
		OutputDebugString(szTemp);
#endif //API_DEBUG
		
		OP_LockMutex( ttsHandle->hmxCallback );
		(*ttsHandle->DtCallbackRoutine)( lParam1,
			lParam2,
			ttsHandle->dwTTSInstanceParameter,
			uiMsg);
		
		OP_UnlockMutex( ttsHandle->hmxCallback );
	}
	return;
}
#endif //WIN32

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
void Report_TTS_Status( LPTTS_HANDLE_T phTTS,
					   UINT uiMsg,
					   long lParam1,
					   long lParam2 )
{
	if (phTTS->DtCallbackRoutine != NULL && uiMsg != 0xDEADC0DE)
	{
		OP_LockMutex( phTTS->pcsCallback );
		(*phTTS->DtCallbackRoutine)( lParam1,
			lParam2,
			phTTS->dwTTSInstanceParameter,
			uiMsg);
		
		OP_UnlockMutex( phTTS->pcsCallback );
	}
	return;
}
#endif // __osf__ || __linux__

void DrainPipes(LPTTS_HANDLE_T phTTS)
{
	// empty the CMD, LTS and PH pipes..
	SWFlushPipe(phTTS->pKernelShareData->cmd_pipe);
#ifndef SINGLE_THREADED
	SWFlushPipe(phTTS->pKernelShareData->lts_pipe);
	SWFlushPipe(phTTS->pKernelShareData->ph_pipe);
#endif	
}

#ifdef WIN32
#ifdef UNDER_CE
ULONG TextToSpeechVersion(LPTSTR* VersionStr)
#else
ULONG TextToSpeechVersion(LPSTR* VersionStr)
#endif
#endif

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
unsigned int TextToSpeechVersion(LPSTR* VersionStr)
#endif
{
#ifdef UNDER_CE
	static wchar_t DECtalk_Version_String[50];
	// CAB 8/07/2002 Big S since type char
	wsprintf(DECtalk_Version_String, TEXT("%S %S"), DTALK_STR_VERSION, CUSTR_STR_VERSION);
	if (VersionStr != NULL) *VersionStr = DECtalk_Version_String;
#else
	//removed unsigned form next line 11/12/96 cjl
	static char   DECtalk_Version_String[50];
	
	sprintf(DECtalk_Version_String, "%s %s",DTALK_STR_VERSION, CUSTR_STR_VERSION);
	if (VersionStr != NULL) *VersionStr = DECtalk_Version_String;
	// Add in dbg_version. NCS KSB
#endif //UNDER_CE

#ifdef WIN32
	return (DTALK_DBG_VERSION << 31) + (DTALK_MAJ_VERSION << 24) + (DTALK_MIN_VERSION << 16) + (DLL_MAJ_VERSION << 8) + DLL_MIN_VERSION;
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	return (DTALK_MAJ_VERSION << 24) + (DTALK_MIN_VERSION << 16) + (DLL_MAJ_VERSION << 8) + DLL_MIN_VERSION;
#endif
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

#ifdef WIN32
ULONG TextToSpeechGetLastError(LPTTS_HANDLE_T phTTS)
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
unsigned int TextToSpeechGetLastError(LPTTS_HANDLE_T phTTS)
#endif
{
	return phTTS->LastError;
}

#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_

//void TextToSpeechTyping(LPTTS_HANDLE_T phTTS, char key) {
	//return;
//}

//}
#endif

#ifndef UNDER_CE
void TextToSpeechTyping(LPTTS_HANDLE_T phTTS, unsigned char key) {  /* BATS#657 JL */
#else
void TextToSpeechTyping(LPTTS_HANDLE_T phTTS, wchar_t key) {  /* BATS#657 JL */
#endif
#ifdef API_DEBUG
	char szTemp[256]="";
	ULONG ulStartTime,ulEndTime;
#endif //API_DEBUG
	
	
#ifdef TYPING_MODE
//#define TYPE_MAXPHONES (256)
#ifdef WIN32
	DT_HANDLE hThisThread=NULL;
	THREAD_PRIORITY_T tptPriority=0;
	hThisThread = GetCurrentThread();
#else
  	THREAD_T ThisThread=0;
  	HTHREAD_T hThisThread=&ThisThread;
  	THREAD_PRIORITY_T tptPriority=0;
  	//ThisThread = pthread_self();
#endif
	if (hThisThread)
	{
#if !defined UNDER_CE && !defined VXWORKS
		tptPriority = OP_GetThreadPriority(hThisThread);
		OP_SetThreadPriority(hThisThread,OP_PRIORITY_HIGHEST);
#endif
	}
#ifdef API_DEBUG
	ulStartTime=timeGetTime();
	sprintf(szTemp, "TTSTyping(%c) at %ld.\n", key, ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG
	TextToSpeechReset(phTTS,FALSE);
	/**/
	// this is the type_out code from cm_util_type_out, modified to
	// do what we need here.
	{
		unsigned char _far *tp;
		DT_PIPE_T phone; //[TYPE_MAXPHONES];
		unsigned int i=0;
		PKSD_T pKsd_t = phTTS->pKernelShareData;
		
		for(tp = (unsigned char _far *)pKsd_t->typing_table[key];*tp;tp++)
		{
			phone = pKsd_t->reverse_ascky[(*tp) & 0xff];
			ph_loop(phTTS,&phone);
		}
		//phone[i++] = (PFUSA<<PSFONT) | COMMA;		
		phone = SYNC;
#ifndef SINGLE_THREADED
		write_pipe(pKsd_t->ph_pipe,phone,i);
#else
		ph_loop(phTTS,&phone);
#endif
	}
	// end of type_out code
	
	
#ifdef API_DEBUG
	ulEndTime=timeGetTime();
	sprintf(szTemp, "TTSTyping() exit %ld (%ld)\n", 
		ulEndTime, ulEndTime-ulStartTime);
	OutputDebugString(szTemp);
#endif //API_DEBUG

#if !defined UNDER_CE && !defined VXWORKS
	if (hThisThread)
		OP_SetThreadPriority(hThisThread,tptPriority);
#endif
#endif // TYPING_MODE
	return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechReserved1()								  */
/*			  Should be called TextToSpeech                           */
/*  Author:															  */
/*  Date:															  */
/*                                                                    */
/*  Abstract:	This function written to get and modify values for    */
/*				autotuner.											  */
/*                                                                    */
/*  Input:                                                            */
/*    unsigned char *voices		holds design voice parameters		  */
/*    U8 voice          		The speak voice value                 */
/*	  BOOL bEightk				8 bit (TRUE or FALSE)				  */
/*    BOOL bReadData			Read access(TRUE) or write            */
/*								acces(FALSE)						  */
/*						GV											  */
/*						GN											  */				
/*						G1											  */
/*						G2											  */
/*						G3											  */
/*						G4											  */
/*						G5											  */
/*                                                                    */
/*  Output:                                                           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    0 - Not a valid speaker value                                   */
/*	  7 - NoError													  */
/**********************************************************************/
/**********************************************************************/

unsigned long TextToSpeechReserved1(unsigned char *voices, U8 voice, BOOL bEightk, BOOL bReadData)
{
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	return FALSE;
#else

	short *sdef;
#ifdef BROKEN
	if (bEightk == FALSE) 
	{	// High-quality	
		switch (voice) 
		{	// CAB Removed warnings by typecast
			case 0:	sdef = (short *)paul;	break;
			case 1:	sdef = (short *)betty;	break;
			case 2:	sdef = (short *)harry;	break;
			case 3:	sdef = (short *)frank;	break;
			case 4:	sdef = (short *)dennis;	break;
			case 5:	sdef = (short *)kit;	break;
			case 6:	sdef = (short *)ursula;	break;
			case 7:	sdef = (short *)rita;	break;
			case 8:	sdef = (short *)wendy;	break;
			default:	return 0;
		}
	}
	else
	{
		switch (voice)
		{	// CAB Removed warnings by typecast
			case 0:	sdef = (short *)paul_8;		break;
			case 1:	sdef = (short *)betty_8;	break;
			case 2:	sdef = (short *)harry_8;	break;
			case 3:	sdef = (short *)frank_8;	break;
			case 4:	sdef = (short *)dennis_8;	break;
			case 5:	sdef = (short *)kit_8;		break;
			case 6:	sdef = (short *)ursula_8;	break;
			case 7:	sdef = (short *)rita_8;		break;
			case 8:	sdef = (short *)wendy_8;	break;
#ifdef ENGLISH_US
			case 9:	sdef = (short *)chris_8;	break;
#endif
			default:	return 0;
		}
	}
#endif
	if (bReadData) {
		voices[0] = (unsigned char)sdef[SPD_GV]; // NAL warning removal
		voices[1] = (unsigned char)sdef[SPD_GN];
		voices[2] = (unsigned char)sdef[SPD_G1];
		voices[3] = (unsigned char)sdef[SPD_G2];
		voices[4] = (unsigned char)sdef[SPD_G3];
		voices[5] = (unsigned char)sdef[SPD_G4];
		voices[6] = (unsigned char)sdef[SPD_LO];
	} else {
		sdef[SPD_GV] = voices[0];
		sdef[SPD_GN] = voices[1];
		sdef[SPD_G1] = voices[2];
		sdef[SPD_G2] = voices[3];
		sdef[SPD_G3] = voices[4];
		sdef[SPD_G4] = voices[5];
		sdef[SPD_LO] = voices[6];
	}

	return 7;
#endif
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSPeechReserved2()								  */
/*			  Should be called TextToSpeech                           */
/*  Author:															  */
/*  Date:															  */
/*                                                                    */
/*  Abstract:														  */
/*																	  */
/*                                                                    */
/*  Input:                                                            */
/*    LPTTS_HANDLE_T	TextToSpeech handle							  */
/*    ULONG *gains													  */
/*                                                                    */
/*  Output:                                                           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    0 - Not available												  */
/*	  7 - NoError													  */
/**********************************************************************/
/**********************************************************************/
ULONG TextToSpeechReserved2(LPTTS_HANDLE_T phTTS, ULONG *gains)
{
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	return FALSE;
#else

#ifdef API_DEBUG
	int i;
	
	PVTM_T pVtm_t = phTTS->pVTMThreadData;
	for (i = 0; i < 7; i++)	gains[i] = pVtm_t->TunerData[i];
	return 7;
#else
	return 0;
#endif
#endif
}

#include "phonlist.h" /* for windic to get at */
/* Function prototypes for functions defined in ls_dict.c */
long GetNumUserEntries(LPTTS_HANDLE_T phTTS);
int GetUserEntry(LPTTS_HANDLE_T phTTS, char *gr_ph, int index);
long UserDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSPeechReserved3()								  */
/*			  Should be called TextToSpeech                           */
/*  Author:															  */
/*  Date:															  */
/*                                                                    */
/*  Abstract:														  */
/*																	  */
/*                                                                    */
/*  Input:                                                            */
/*    LPTTS_HANDLE_T	TextToSpeech handle							  */
/*    int type			Data values to return						  */
/*	  char *data 		Variable to store data						  */
/*	  int max_size		Size of data 								  */
/*                                                                    */
/*  Output:                                                           */
/*    The return value will be one of the following constants.        */
/*                                                                    */
/*    0 - Not available												  */
/*	  -1 - Not valid argument										  */
/*																	  */
/**********************************************************************/
/**********************************************************************/
U32 TextToSpeechReserved3(LPTTS_HANDLE_T phTTS, int type, char *data, int max_size)
{
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	return FALSE;
#else

	struct dic_entry entry; /* used to find a user dictionary entry's index, JAW 8/7/98 */
	
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
	case 5:
		/* return number of user dictionary entries */
		return GetNumUserEntries(phTTS); /* GetNumUserEntries is defined in ls_dict.c */
	case 6:
		/* return the grapheme/phoneme string for the user dictionary entry at max_size in data 
		   (don't let the variable name confuse you; max_size is simply being used as an index)
		   */
		return GetUserEntry(phTTS, data, max_size); /* GetUserEntry is defined in ls_dict.c,
													   and it returns the starting index of the
												   phoneme. */
	case 7:
		strcpy(entry.text, data);
		return UserDictionaryHit(phTTS, &entry); /* returns the index of the entry */
	}
	return(-1);
#endif
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: TextToSpeechReserved4()								  */
/*			  Should be called TextToSpeechReloadMainDictionary       */
/*  Author:															  */
/*  Date:															  */
/*                                                                    */
/*  Abstract:                                                         */
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
#ifdef WIN32
MMRESULT TextToSpeechReserved4( LPTTS_HANDLE_T phTTS,

#ifdef UNDER_CE
								LPTSTR szFileName)
#else
								LPSTR szFileName)										
#endif
{
	// Added a local varaible to get the handle of current kernel_share_data handle :MVP
	PKSD_T pKsd_t;
	int nDicLoad=0;


#ifdef UNDER_CE	//29oct99 mfg convert unicode string to char string for Windows CE
char chFileName[128];
WideStringtoAsciiString(chFileName, szFileName, 128);
#endif
	
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
		return( MMSYSERR_INVALHANDLE );
	
	/********************************************************************/
	/*  Return error if a user dictionary is already loaded.            */
	/********************************************************************/
	// Initialize with the pointer stored in phTTS :MVP */
	pKsd_t = phTTS->pKernelShareData ;
	
	/* Unload the main dictionary */
		 unload_dictionary((void **)&(pKsd_t->fdic_index[pKsd_t->lang_curr]),
			  (void **)&pKsd_t->fdic_data[pKsd_t->lang_curr],
			  (unsigned int *)&(pKsd_t->fdic_entries[pKsd_t->lang_curr]),
			  (unsigned int *)&(pKsd_t->fdic_bytes[pKsd_t->lang_curr])
			  ,(LPVOID*)&(pKsd_t->fdicMapStartAddr[pKsd_t->lang_curr]),
			  (DT_HANDLE*)&(pKsd_t->fdicMapObject[pKsd_t->lang_curr]),
			  (DT_HANDLE*)&(pKsd_t->fdicFileHandle[pKsd_t->lang_curr]),		  
		      MEMMAP_ON 
			  );

		pKsd_t->fdic_index[DICT_LANG]=NULL;
		pKsd_t->fdic_data[DICT_LANG]=NULL;
		pKsd_t->fdic_entries[DICT_LANG]=0;
		pKsd_t->fdic_bytes[DICT_LANG]=0;
		pKsd_t->fdicMapObject[DICT_LANG]=NULL;
		pKsd_t->fdicFileHandle[DICT_LANG]=NULL;
		pKsd_t->fdicMapStartAddr[DICT_LANG]=NULL;

		  gpufdic_index = NULL;
		  gpufdic_data = NULL;
		  gufdic_entries = 0;
		  gufdic_bytes = 0;
		  gufdicMapObject=NULL;
		  gufdicFileHandle=NULL;
		  gufdicMapStartAddr=NULL;

	/* Load the new Main dictionary */
		nDicLoad = load_dictionary( phTTS,
						&(pKsd_t->fdic_index[DICT_LANG]),
						&(pKsd_t->fdic_data[DICT_LANG]),
						&(pKsd_t->fdic_entries[DICT_LANG]),
						&(pKsd_t->fdic_bytes[DICT_LANG]),
#ifdef CHEESY_DICT_COMPRESSION
						&(pKsd_t->fdic_fc_entry[DICT_LANG]),
						&(pKsd_t->fdic_fc_entries[DICT_LANG]),
#endif
#ifdef	UNDER_CE
						chFileName,
#else
						szFileName,
#endif
						TRUE,
						TRUE,
						(DT_HANDLE*)&(pKsd_t->fdicMapObject[DICT_LANG]),
						(DT_HANDLE*)&(pKsd_t->fdicFileHandle[DICT_LANG]),
						(LPVOID*)&(pKsd_t->fdicMapStartAddr[DICT_LANG]),
						MEMMAP_ON);

		if(nDicLoad == MMSYSERR_INVALPARAM || nDicLoad == MMSYSERR_NOMEM ||
 			nDicLoad == MMSYSERR_ERROR)
		{
			return (nDicLoad);
		}

		gpufdic_index = pKsd_t->fdic_index[DICT_LANG];
		gpufdic_data = pKsd_t->fdic_data[DICT_LANG];
		gufdic_entries = pKsd_t->fdic_entries[DICT_LANG];
		gufdic_bytes = pKsd_t->fdic_bytes[DICT_LANG];
		gufdicMapObject=pKsd_t->fdicMapObject[DICT_LANG];
		gufdicFileHandle=pKsd_t->fdicFileHandle[DICT_LANG];
		gufdicMapStartAddr=pKsd_t->fdicMapStartAddr[DICT_LANG];

	return(MMSYSERR_NOERROR);

}
#endif

#ifdef WIN32
ULONG TextToSpeechVersionEx(LPVERSION_INFO *ver)
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
DWORD TextToSpeechVersionEx(LPVERSION_INFO *ver)
#endif
{
#ifdef UNDER_CE
	static wchar_t DECtalk_Language_String[50];
	static wchar_t DECtalk_Version_String[50];
	// CAB 8/07/200 Big %S since value are type char not Unicode
	wsprintf(DECtalk_Version_String, TEXT("%S %S"), DTALK_STR_VERSION, CUSTR_STR_VERSION);
	wsprintf(DECtalk_Language_String, TEXT("ER: Error"));
#else
	static char DECtalk_Language_String[50];
	static char DECtalk_Version_String[50];
				
	sprintf(DECtalk_Version_String,"%s %s",DTALK_STR_VERSION, CUSTR_STR_VERSION);
	sprintf(DECtalk_Language_String, "ER: Error");
#endif // UNDER_CE

//check for NULL return 0 value for version BTS10065
if (ver == NULL) return 0;

#ifdef ENGLISH_US
#ifdef UNDER_CE
	wsprintf(DECtalk_Language_String, TEXT("US: American English"));
#else
	sprintf(DECtalk_Language_String, "US: American English");
#endif
#endif // ENGLISH_US

#ifdef SPANISH_LA
#ifdef UNDER_CE
	wsprintf(DECtalk_Language_String, TEXT("LA: Latin American Spanish"));
#else
	sprintf(DECtalk_Language_String, "LA: Latin American Spanish");
#endif
#endif // SPANISH_LA

#ifdef SPANISH_SP
#ifdef UNDER_CE
	wsprintf(DECtalk_Language_String, TEXT("SP: Castillian Spanish"));
#else
	sprintf(DECtalk_Language_String, "SP: Castillian Spanish");
#endif
#endif // SPANISH_SP

#ifdef GERMAN
#ifdef UNDER_CE
	wsprintf(DECtalk_Language_String, TEXT("GR: German"));
#else
	sprintf(DECtalk_Language_String, "GR: German");
#endif
#endif // GERMAN

#ifdef FRENCH
#ifdef UNDER_CE
	wsprintf(DECtalk_Language_String, TEXT("FR: French"));
#else
	sprintf(DECtalk_Language_String, "FR: French");
#endif
#endif // FRENCH

#ifdef SWAHILI
#ifdef UNDER_CE
	wsprintf(DECtalk_Language_String, TEXT("SW: Swahili"));
#else
	sprintf(DECtalk_Language_String, "SW: Swahili");
#endif
#endif // SWAHILI

#ifdef ENGLISH_UK
#ifdef UNDER_CE
	wsprintf(DECtalk_Language_String, TEXT("UK: British English"));
#else
	sprintf(DECtalk_Language_String, "UK: British English");
#endif
#endif // ENGLISH_UK

	if ((*ver = (LPVERSION_INFO)malloc(sizeof(VERSION_INFO))) == NULL)	return 0;
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
#ifndef UNDER_CE
unsigned int TextToSpeechStartLang(char *lang) {
				return TTS_NOT_SUPPORTED;
}
BOOL TextToSpeechCloseLang(char *lang) {
				return FALSE;
}

#else

unsigned int TextToSpeechStartLang(TCHAR *lang) {
				return TTS_NOT_SUPPORTED;
}
BOOL TextToSpeechCloseLang(TCHAR *lang) {
				return FALSE;
}

#endif //UNDER_CE

BOOL TextToSpeechSelectLang(LPTTS_HANDLE_T tts, unsigned int id) {
				return FALSE;
}


//ETT: fixme? a MMRESULT should be the same as a DWORD!?
#ifdef WIN32
DWORD TextToSpeechGetFeatures(void)
#endif
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
MMRESULT TextToSpeechGetFeatures(void)
#endif  
{
	unsigned long int feats;
	
#ifdef ACCESS32
	feats = TTS_FEATS_TYPINGMODE;
#else
	feats = 0;
#endif
	return feats;
}
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
DWORD TextToSpeechEnumLangs(LPLANG_ENUM *langs) 
{	LPVERSION_INFO verinfo;

	if (((*langs) = (LPLANG_ENUM)malloc(sizeof(LANG_ENUM))) == NULL)	return 0;
	(*langs)->Languages = 1;
	(*langs)->MultiLang = FALSE;
	if (((*langs)->Entries = (LPLANG_ENTRY)calloc(1, sizeof(LANG_ENTRY))) == NULL) {
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
	(*langs)->Entries[0].lang_code[0]=tolower((*langs)->Entries[0].lang_code[0]);
	(*langs)->Entries[0].lang_code[1]=tolower((*langs)->Entries[0].lang_code[1]);
	(*langs)->Entries[0].lang_code[2] = '\0';
	strcpy((*langs)->Entries[0].lang_name,verinfo->Language+4);
	return (sizeof(LANG_ENUM));
}
#endif

#ifdef WIN32
DWORD TextToSpeechEnumLangs(LPLANG_ENUM *langs)
{	LPVERSION_INFO verinfo;
	
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

	// CAB 08/08/2002	Fixed for Windows CE
	memcpy((*langs)->Entries[0].lang_code,verinfo->Language,2*sizeof(TCHAR));
	(*langs)->Entries[0].lang_code[2] = '\0';
#ifdef UNDER_CE
	wcscpy((*langs)->Entries[0].lang_name, verinfo->Language+4);
#else
	strcpy((*langs)->Entries[0].lang_name,verinfo->Language+4);
#endif
	return (sizeof(LANG_ENUM));
}

short  *GetPhVdefParams(LPTTS_HANDLE_T phTTS, UINT index);


/*********************************************************************************************/
/*  Function: TextToSpeechGetPhVdefParams                                                    */
/*  By      : Nathan LeStage                                                                 */
/*  Date    : January 18, 2000                                                               */
/*                                                                                           */
/*  Description: This function calls the function GetPhVdefParams, which is defined in       */
/*               ph_task.c. GetPhVdefParams, in turn, returns a copy of the default          */
/*               parameters for the specified voice.                                         */
/*********************************************************************************************/

short  *TextToSpeechGetPhVdefParams(LPTTS_HANDLE_T phTTS, UINT index)
{
	return GetPhVdefParams(phTTS, index);
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


/* Function prototypes for lexical functions defined within ls_dict.c, JAW 7/7/98 */
long DictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
MMRESULT DumpDictionary(LPTTS_HANDLE_T phTTS, char *filename);
long UserDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
MMRESULT DumpUserDictionary(LPTTS_HANDLE_T phTTS, char *filename);
MMRESULT AddUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
MMRESULT DeleteUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry);
MMRESULT ChangeUserPhoneme(LPTTS_HANDLE_T phTTS, struct dic_entry *entry,
						   unsigned char *new_phoneme);


int TextToSpeechDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	long i;
	
	
	if (phTTS == NULL)
		return -1;
	
	i = DictionaryHit(phTTS, entry);
	if (i == -1)
		return 0;
	return 1;
}


MMRESULT TextToSpeechDumpDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	if (phTTS == NULL)
		return MMSYSERR_INVALHANDLE;
	
	return DumpDictionary(phTTS, filename);
}


int TextToSpeechUserDictionaryHit(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	long i;
	
	
	if (phTTS == NULL)
		return -1;
	
	i = UserDictionaryHit(phTTS, entry);
	if (i == -1)
		return 0;
	return 1;
}


MMRESULT TextToSpeechDumpUserDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	if (phTTS == NULL)
		return MMSYSERR_INVALHANDLE;
	
	return DumpUserDictionary(phTTS, filename);
}


MMRESULT TextToSpeechAddUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	if (phTTS == NULL)
		return MMSYSERR_INVALHANDLE;
	
	return AddUserEntry(phTTS, entry);
}


MMRESULT TextToSpeechDeleteUserEntry(LPTTS_HANDLE_T phTTS, struct dic_entry *entry)
{
	if (phTTS == NULL)
		return MMSYSERR_INVALHANDLE;																
	
	return DeleteUserEntry(phTTS, entry);
}


MMRESULT TextToSpeechChangeUserPhoneme(LPTTS_HANDLE_T phTTS, struct dic_entry *entry, 
									   unsigned char *new_phoneme)
{
	if (phTTS == NULL)
		return MMSYSERR_INVALHANDLE;
	
	return ChangeUserPhoneme(phTTS, entry, new_phoneme);
}

MMRESULT SaveUserDictionary(LPTTS_HANDLE_T phTTS, char *filename);

/*********************************************************************************************/
/*  Function: TextToSpeechSaveUserDictionary                                                 */
/*  By      : Jason Warlikowski                                                              */
/*  Date    : August 7, 1998                                                                 */
/*                                                                                           */
/*  Description: After making sure a valid TTS_HANDLE has been passed to it, this function   */
/*               calls the function SaveUserDictionary, which is defined in ls_dict.c.  It   */
/*               passes a file name to SaveUserDictionary, which, in turn, outputs the user  */
/*               dictionary to that file.                                                    */
/*********************************************************************************************/
MMRESULT TextToSpeechSaveUserDictionary(LPTTS_HANDLE_T phTTS, char *filename)
{
	if (phTTS == NULL)
		return MMSYSERR_INVALHANDLE;

	return SaveUserDictionary(phTTS, filename);
}

//tek 19aug98 implement the convert-to-phonemes fct
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
									   DWORD dwCvtFlags)
{
	if (phTTS == NULL)
		return MMSYSERR_INVALHANDLE;
	if (   IsBadReadPtr(szText,1)
		|| IsBadReadPtr(dwBufSize,1)
		|| IsBadWritePtr(szPhonemeBuf,*dwBufSize) )
	{
		return MMSYSERR_INVALPARAM;
	}

	// come to a complete stop;
	TextToSpeechSync(phTTS);
	// Set up to log phonemes
	phTTS->dwPhonemeBufferPtr = 0;
	phTTS->dwPhonemeBufferSize = *dwBufSize;
	phTTS->dwPhonemeCvtFlags = dwCvtFlags;
	phTTS->szPhonemeBuffer = szPhonemeBuf;

	// send along the text
	TextToSpeechSpeakEx( phTTS, szText, TTS_FORCE,FALSE);
	// wait for completion
	TextToSpeechSync(phTTS);
	// clear the flags to the VTM
	phTTS->dwPhonemeCvtFlags = 0;
	// vtmiont leaves enough space for a terminating null..
	phTTS->szPhonemeBuffer[phTTS->dwPhonemeBufferPtr++]='\0';
	// return the count in the BufSize arg
	*dwBufSize = phTTS->dwPhonemeBufferPtr;
	// stop logging
	phTTS->szPhonemeBuffer = NULL;
	phTTS->dwPhonemeBufferSize = 0;

	return MMSYSERR_NOERROR;
}

// tek 28oct98
// this function is used to enable/disable tuning data trapping, and to retrieve
// the data from a tuning pass.
// pvtdArg is ignored, except for TTSTUNING_GET_RESULTS, where it points to an array
// which gets the results of a run. The sturcture of the array (VTM_TUNER_DATA) is 
// in vtminst.h
// valid iFunction values:
//	TTSTUNING_ENABLE			(re)start logging of data
//	TTSTUNING_DISABLE			stop logging of data
//	TTSTUNING_GET_RESULTS		retrieve the tuning data
MMRESULT TextToSpeechTuning(LPTTS_HANDLE_T phTTS,
							int iFunction, 
							VTM_TUNER_DATA *pvtdArg)
{
	PVTM_T pVtm_t = phTTS->pVTMThreadData;

	// make sure we haven't been handed junk..
	if (IsBadWritePtr(phTTS, sizeof(LPTTS_HANDLE_T)))
	{
		// bad handle
		return MMSYSERR_INVALHANDLE;
	}

	// decide what to do..
	switch (iFunction)
	{
	case TTSTUNING_ENABLE:
		// clear all the old data
		pVtm_t->vtdTuneResults.rnpmax=0;      /*maximum value within filter of casade rnp*/
		pVtm_t->vtdTuneResults.rnzmax=0;      /*maximum value within filter of casade rnz*/
		pVtm_t->vtdTuneResults.c1max=0;       /*maximum value within filter of casade 1*/
		pVtm_t->vtdTuneResults.c2max=0;       /*maximum value within filter of casade 2*/
		pVtm_t->vtdTuneResults.c3max=0;       /*maximum value within filter of casade 3*/
		pVtm_t->vtdTuneResults.c4max=0;       /*maximum value within filter of casade 4*/
		pVtm_t->vtdTuneResults.c5max=0;       /*maximum value within filter of casade 5*/
		pVtm_t->vtdTuneResults.purevmax=0;    /*maximum value of downsampled voice */
		pVtm_t->vtdTuneResults.r2pd1=0;    /*  Last output sample from parallel 2nd formant        */
		pVtm_t->vtdTuneResults.r3pd1=0;    /*  Last output sample from parallel 3rd formant        */
		pVtm_t->vtdTuneResults.r4pd1=0;    /*  Last output sample from parallel 4th formant        */
		pVtm_t->vtdTuneResults.r5pd1=0;    /*  Last output sample from parallel 5th formant        */
	
		pVtm_t->vtdTuneResults.bDidOverload=0;	/* true if we trapped an overload */
		pVtm_t->vtdTuneResults.dwThisPhoneme=0;	/* the phoneme we overloaded on */
		pVtm_t->vtdTuneResults.dwLastPhoneme=0;	/* the phoneme we overloaded on */

		pVtm_t->vtdTuneResults.r1cd2=0;
		pVtm_t->vtdTuneResults.r2cd2=0;
		pVtm_t->vtdTuneResults.r3cd2=0;
		pVtm_t->vtdTuneResults.r4cd2=0;
		pVtm_t->vtdTuneResults.r5cd2=0;
		pVtm_t->vtdTuneResults.rnpd2=0;
		pVtm_t->vtdTuneResults.rnzd2=0;
		pVtm_t->vtdTuneResults.rlpd2=0;
		// set the enable bit 
		pVtm_t->bDoTuning = TRUE;
		break;

	case TTSTUNING_DISABLE:
		// clear the switch
		pVtm_t->bDoTuning = FALSE;
		break;

	case TTSTUNING_GET_RESULTS:
		// tek 01dec98
		if (IsBadWritePtr(pvtdArg, sizeof(VTM_TUNER_DATA)))
		{
			// bad handle
			return MMSYSERR_INVALPARAM;
		}
		// do the copy
		memcpy(pvtdArg, &pVtm_t->vtdTuneResults, sizeof(VTM_TUNER_DATA));
		break;

	default:
		return MMSYSERR_INVALPARAM; // bad function request.

	} // switch (iFunction)
	return MMSYSERR_NOERROR; 

} // TextToSpeechTuning


// MGS Moved endif so PumpModeMessage doesn't break UNIX
#endif /* WIN32 */

// tek 07jan99 BATS850: implement the message-pump function.
// Function: PumpModeMessage
// This function is to be used wherever a thread has to fall asleep in a 
// situation where the audio "Mode window" might need to process messages.
// it returns TRUE, unless the message is WM_QUIT. A FALSE return means the
// caller should bail out.
#ifdef OLEDECTALK
// the SAPI version of the function is implemented in dtlkttse.cpp; that
// keeps it consistent with the window definintions and window proc.

#else //OLEDECTALK
// the non-SAPI version of the function. Does nothing.
BOOL PumpModeMessage(HPLAY_AUDIO_T dummy)
{
	return(TRUE);
}
#endif //OLEDECTALK


MMRESULT TextToSpeechOpenSapi5Output( LPTTS_HANDLE_T phTTS,
									void *pSapiEngine,
								  DWORD dwFormat)
{
#ifndef SAPI5DECTALK
	return( MMSYSERR_NOERROR );
#else
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
		// 11.025 KHz 16 bit
		SetSampleRate( phTTS, PC_SAMPLE_RATE );
		phTTS->OutputIsText=0;
		phTTS->pAudioHandle->dMsecPerSample = (double)(1000)/(double)(22050);  // 11025 *2
		phTTS->pAudioHandle->bAudioIsEightBit=FALSE;
		phTTS->pAudioHandle->bAudioIsMulaw=FALSE;
		
		break;
		
	case WAVE_FORMAT_1M08:
		// 11.025 KHz 8 bit
		SetSampleRate( phTTS, PC_SAMPLE_RATE );
		phTTS->OutputIsText=0;
		phTTS->pAudioHandle->dMsecPerSample = (double)(1000)/(double)(11025); 
		phTTS->pAudioHandle->bAudioIsEightBit=TRUE;
		phTTS->pAudioHandle->bAudioIsMulaw=FALSE;
		
		break;
		
	case WAVE_FORMAT_08M08:
		// 8.000 KHz 8 bit mulaw
		SetSampleRate( phTTS, MULAW_SAMPLE_RATE );
		phTTS->OutputIsText=0;
		phTTS->pAudioHandle->dMsecPerSample = (double)(1000)/(double)(8000);  
		phTTS->pAudioHandle->bAudioIsEightBit=TRUE;
		phTTS->pAudioHandle->bAudioIsMulaw=TRUE;
		break;

	case WAVE_FORMAT_08M16:
		// 8.000 KHz 16 bit
		SetSampleRate( phTTS, MULAW_SAMPLE_RATE );
		phTTS->OutputIsText=0;
		phTTS->pAudioHandle->dMsecPerSample = (double)(1000)/(double)(16000);  // 11025 *2
		phTTS->pAudioHandle->bAudioIsEightBit=FALSE;
		phTTS->pAudioHandle->bAudioIsMulaw=FALSE;
		
		break;
	case WAVE_FORMAT_NULL:
		phTTS->OutputIsText=1;
		SetSampleRate( phTTS, PC_SAMPLE_RATE );
		phTTS->pAudioHandle->dMsecPerSample = (double)(1000)/(double)(22050);  // 11025 *2
		phTTS->pAudioHandle->bAudioIsEightBit=FALSE;
		phTTS->pAudioHandle->bAudioIsMulaw=FALSE;
		break;
		
	default:
		
		return( MMSYSERR_INVALPARAM );
	}
	phTTS->SkippingForward=0;
	phTTS->pAudioHandle->bInAudioReset=0;
	phTTS->pAudioHandle->bSendSamplesRequested=0;
	phTTS->pAudioHandle->bAudioRanDry=0;
	phTTS->pAudioHandle->bAudioIsFile=0;
	phTTS->pAudioHandle->bPipesNotEmpty=0;

	phTTS->pKernelShareData->volume=100;
	phTTS->dwFormat = dwFormat;

	phTTS->CTTSEngObj=pSapiEngine;
	phTTS->dwQueuedSampleCount=0;

	phTTS->dwOutputState = STATE_OUTPUT_SAPI5;

	
	return( MMSYSERR_NOERROR );
#endif
}

MMRESULT TextToSpeechCloseSapi5Output( LPTTS_HANDLE_T phTTS )
{
#ifndef SAPI5DECTALK
	return( MMSYSERR_NOERROR );
#else
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
		return( MMSYSERR_INVALHANDLE );
	
	/********************************************************************/
	/*  If not in MEMORY output state then return an error.             */
	/********************************************************************/
	
	if ( phTTS->dwOutputState != STATE_OUTPUT_SAPI5 )
		return( MMSYSERR_ERROR );
	
#ifdef WIN32
	// merged 28jul97 tek
	// 16jun97 tek bats 385 sync will hang forever if we don't clear
	// bInReset..
	phTTS->bInReset = FALSE;
#endif
	
	/********************************************************************/
	/*  Halt the system and flush all data.                             */
	/********************************************************************/
	
	TextToSpeechSync( phTTS );
	
	/********************************************************************/
	/*  Delete the memory buffer critical section.                      */
	/********************************************************************/

	phTTS->CTTSEngObj=NULL;

	phTTS->OutputIsText=0;

	if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
		phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
	else
		phTTS->dwOutputState = STATE_OUTPUT_NULL;
	
	return( MMSYSERR_NOERROR );
#endif // #ifndef SAPI5DECTALK
}

MMRESULT TextToSpeechSetVolume( LPTTS_HANDLE_T phTTS,int type, int volume)
{
#ifndef SAPI5DECTALK
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
		return( MMSYSERR_INVALHANDLE );

	if (volume>100 || volume <0)
	{
		return MMSYSERR_INVALPARAM;
	}
	switch (type)
	{
	case VOLUME_MAIN:
		phTTS->pKernelShareData->volume=volume;
		break;
	case VOLUME_ATTENUATION:
		phTTS->pKernelShareData->vol_att=volume;
		break;
	default:
		return MMSYSERR_INVALPARAM;
	}
	return( MMSYSERR_NOERROR );
#else
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
		return( MMSYSERR_INVALHANDLE );

	if (volume>100)
	{
		volume=100;
	}
	else if (volume<0)
	{
		volume=0;
	}
	phTTS->pKernelShareData->volume=volume;

	return( MMSYSERR_NOERROR );
#endif // #ifndef SAPI5DECTALK
}

MMRESULT TextToSpeechGetVolume( LPTTS_HANDLE_T phTTS,int type, int *volume)
{
#ifndef SAPI5DECTALK
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
		return( MMSYSERR_INVALHANDLE );

	switch (type)
	{
	case VOLUME_MAIN:
		*volume=phTTS->pKernelShareData->volume;
		break;
	case VOLUME_ATTENUATION:
		*volume=phTTS->pKernelShareData->vol_att;
		break;
	default:
		return MMSYSERR_INVALPARAM;
	}
	return( MMSYSERR_NOERROR );
#else
	/********************************************************************/
	/*  Return error if invalid handle.                                 */
	/********************************************************************/
	
	if ( IsBadWritePtr( phTTS, sizeof(phTTS)))
		return( MMSYSERR_INVALHANDLE );

	*volume=phTTS->pKernelShareData->volume;

	return( MMSYSERR_NOERROR );
#endif // #ifndef SAPI5DECTALK
}

MMRESULT TextToSpeechVisualMarks( LPTTS_HANDLE_T phTTS,int value)
{
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	if (value)
	{
		phTTS->uiID_Visual_Message=TTS_MSG_VISUAL ;
	}
	else
	{
		phTTS->uiID_Visual_Message=0xDEADC0DE;
	}
#endif
	if (value==FULL_RANGE_MARKS)
	{
		phTTS->uiFullRangeMarks=1;
	}
	return(0);
}

int TextToSpeechReserved5(LPTTS_HANDLE_T phTTS,char *string)
{
}



/********************************* end of ttsapi.c *****************************/

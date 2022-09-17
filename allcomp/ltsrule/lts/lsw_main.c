/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers, a Solectron Company. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved.     
 *    © Digital Equipment Corporation 1996-1998. All rights reserved.
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
 *    File Name:    lsw_main.c
 *    Author:       Matthew Schnee
 *    Creation Date:02/29/1996
 *
 *    Functionality:
 *    lts entry point stub, for window only
 *
 ***********************************************************************
 *    Revision History:                    
 *
 *  Rev Who     Date        	Description
 *  --- -----   ----------- 	---------------------------------------
 *  001 KM   	09/23/1984   	Modified to look for default user.dic
 *                              in the HOME directory for OSF/1.
 *  002 MGS     03/10/1996      Renamed file from lsm_acna.c
 *  003 JDB     05/30/1996      Add language dependent conditionals
 *  004 GL      11/26/1996      remove dummy msdos and dtex switch
 *  005 GL		12/11/1996		remove the WIN32 language pipe hack
 *  006 KSB     02/10/1997		Fixed bugs for DTDemo fetch, and added debug code
 *  007 NCS     02/21/1997      Merged Tom's multilanguage code in.
 *  008 NCS     02/26/1997      Changed LibMain to LTSLibMain.
 *	009	NCS		04/17/1997		Moved Dictionary Reg entry path to coop.h
 *  010	GL		04/21/1997	    BATS#357  Add the code for __osf__ build
 *  011 NCS     08/06/1997      Moved Demo dict name entries to coop.h
 *  012 GL		09/25/1997      use the array for dictionary entry structure
 *                              add abbreviation dictionary support
 *                              also add UK_english support
 *  013 GL		10/23/1997      use dtalk_<language>.dic to replace dectalk.dic
 *  xxx	tek		25feb98			repair DEMO build to allow spaces in dictionary
 *								path (bats 607) and to look in additional places.
 *  014 JAW     03/04/1998      ifdef'd out code from 02/25/1998 so it won't be
 *                              compiled UNDER_CE.  When UNDER_CE is defined,
 *                              code from previous version of this file will be
 *                              used.
 *  015 CJL     03/18/1998      Removed specific path for dectalkf.h.
 *	016	tek		14may98			bats672 log failures on main dict registry keys
 *  017	tek		27may98			bats689: threadsafe instance counting
 *  018	mfg		22jun98			Added support for LANG_latin_american
 *	xxx	tek		21aug98			un-static GetDictionaryNames so it can be
 *								used by other modules.
 *  019.5 ETT	10/05/1998      Added Linux code.
 *  020	GL		11/12/1998		BATS#800  need to initialize some Spanish variables 
 *  021	GL		11/20/1998		BATS#828 use LTS_DEBUG to replace _DEBUG
 *  022	MFG		01/06/1999		Added MainDIc and UserDic support for Windows CE
 *  023	MGS		08/22/1999		Change #ifdef LTS_DEBUG to #if LTS_DEBUG because of VMS debugging code
 *								that was turned on by accident
 *  024	MGS		02/09/2000		Made the dictionary information come from a config
 *								file for __linux__ (and __osf__ in the future)
 *  025 NAL		06/12/2000		Added prototype (warning removal)
 *  026 MFG		07/31/2000		Implemented dictionary memory mapping for Windows CE/NT/95
 *  027 MFG		07/30/2000		fixed multi language dictionary memory mapping error
 *  028	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 *  029	MFG		10/10/2000		Shut off dictionary mapping for WCE_EMULATION it is not Supported
 *  030 CAB		10/18/2000		Added copyright info
 *  032	MGS		01/11/2001		Added Foreigh langauge dictioanry
 *  033	MGS		02/08/2001		Fixed Linux foreign language dictionary issues
 *  034	MGS		02/19/2001		Added code to fix the foreign language dict for WIN32
 *  035 CAB		02/23/2001		Updated copyright info
 *  036	MGS		03/02/2001		Added code for multiple instances work with dictionary mapping
 *  037	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  038	MGS		05/18/2001		More VxWorks porting, fixed linux demo dictionaries
 *  039	MGS		06/19/2001		Solaris Port BATS#972
 *  040	MGS		02/26/2002		ACNA updates
 *  041	MGS		04/03/2002		Single threaded lts
 *  042	MGS		04/11/2002		ARM7 port\
 *	043	cab		04/17/2001		Fixed BATS#987
 *	044	CAB		07/08/2002		Added dtdic.log to Windows CE
 *  045	MGS		07/16/2002		Added Fonix dictionary startup
 *  046 MFG		07/17/2002		Merged in CUP28PROJECT changes
 *  047 MFG		07/19/2002		Added \windows\user.dic default for CUP28PROJECT
 *	048	CAB		08/12/2002		Fixed TTSStartupExFonix() for Windows CE
 *								Changed GetDictionaryNames() and load_dictionary() to TCHAR
 *	049	MFG		10/10/2002		Fixed the User dictionary stuff for WinCE
 *	050	RDK		01/22/2003		Change to use FORCE_WINDICTDIRS for forced windows dictionaries
 *  051	MFG		02/30/2003		Fixed the wide- string convertion for the WinCe dictionary 
 ***************************************************************************/

#include "dectalkf.h"
#include "ls_def.h"

#ifdef ARM7
#include "tts.h"
#include "stdlib.h"
#if !defined EPSON_ARM7 && !defined ALLOC_MEMORY && !defined MULTIPLE_LANGUAGES_LOADED
LTS_T   Lts_t;
#else
// declared in lsw_main2.c which is included in the language independent library
extern LTS_T   Lts_t;
#endif
#else
#define LSWMAIN_DIC
#include "coop.h"
#undef LSWMAIN_DIC
#endif // ARM7

#ifdef OS_SYMBIAN
#include "port.h"
#include "GlobalDT.h"
#endif  // OS_SYMBIAN

#if defined _UNIX_LIKE_
#include <stdlib.h>
#endif //_UNIX_LIKE_

#ifdef WIN32
#ifndef UNDER_CE
#include <io.h>		// File access
#include <direct.h> // Directory fn's
#include <time.h> // tek 14may98 needed for key logging
#else
#include <cemm.h> //needed for Window CE registry calls mfg 01/06/1999
#endif //UNDER_CE
#endif //WIN32

#if defined(__cplusplus)
extern "C" {
#endif

#ifdef SEPARATE_PROCESSES
struct share_data       *kernel_share;
#endif //SEPARATE_PROCESSES

#ifndef ARM7
int linux_get_dict_names(char *main_dict_name,char *user_dict_name, char *foreign_dict_name);
#endif
void default_lang(PKSD_T, unsigned int, unsigned int); // NAL warning removal


/*
 * extern int namef;
 */
#ifdef WIN32

/* tek 23jan97 need the dictionary globals if we're doing the code_DLL thing */
#ifdef BLD_CORE_DLL
int gnInstanceCounter=0;
// tek 27may98 do we ever do this? I don't think so; this may be left from
// the original multilanguage implementation. 
// Anyway, there will be missing globals (cf bats 689) if we ever DO try this
  S32                    *gpufdic_index          = NULL;
//  unsigned char                    *gpufdic_data          = NULL;
  S32                       gufdic_entries     = 0;
  S32                       gufdic_bytes     = 0;

#endif /*BLD_CORE_DLL*/

#define  MAX_STRING_LENGTH  512

//tek 18aug98 make this non-static so that we can use it to find the udic directory
// RDK This routine produces (as it should) char variables, NOT TCHAR
// void GetDictionaryNames( TCHAR *, TCHAR *, TCHAR *, TCHAR * );
void GetDictionaryNames( char *, char *, char *, char * );

extern MMRESULT load_dictionary( LPTTS_HANDLE_T, void **, void **, unsigned int *,
//								 unsigned int *, TCHAR *, BOOL, BOOL,
								 unsigned int *, 
#ifdef CHEESY_DICT_COMPRESSION
								 void **, unsigned int *, 
#endif
								 char *, BOOL, BOOL,
								 DT_HANDLE *, DT_HANDLE *, LPVOID *, MEMMAP_T);
										
int __stdcall lts_main( LPTTS_HANDLE_T phTTS )
/* Line below is commented out due to the line above */
// DllExport int __stdcall lts_main( LPTTS_HANDLE_T phTTS )

#endif // WIN32

#if defined _UNIX_LIKE_

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ 
#include "mmsystem.h"
#endif

extern MMRESULT load_dictionary( void **, void **, unsigned int *, unsigned int *,
				 				 char *, int, DT_HANDLE *, DT_HANDLE *,
								 LPVOID *, MEMMAP_T);
										
/* PROTOTYPES */
/* MGS 11/19/1997 commented out duplicate prototype */
//extern lsa_util_init_lang();
//extern void default_lang ();
#if defined _UNIX_LIKE_
extern void default_lang( PKSD_T pKsd_t,unsigned int lang_code, unsigned int ready_code );
#endif
//extern ls_task_main ();


/* GL 04/21/1997  change this for OSF build */
/*int lts_main(LPTTS_HANDLE_T phTTS )*/
#ifdef SINGLE_THREADED
int lts_main(LPTTS_HANDLE_T phTTS)
#else
OP_THREAD_ROUTINE(lts_main, LPTTS_HANDLE_T phTTS)
#endif
#endif /* __osf__ || __linux__ */

#ifdef ARM7
int lts_main(LPTTS_HANDLE_T phTTS)
#endif
{
#ifdef UNDER_CE	//29oct99 mfg convert unicode string to char string for Windows CE
char ch_dictionary_file_name[500];
#endif
  /* 
   * Added a variable to get current instance kernel share data and
   * initialize from phTTS structure  :MI : MVP
   */
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PLTS_T pLts_t = NULL;
  int nDicLoad;

#ifdef ARM7
#if defined(EPSON_ARM7) || defined (OS_SYMBIAN)
	pLts_t=phTTS->pLTSThreadData;
	if(pLts_t)
		memset(pLts_t,0,sizeof(LTS_T));
#else
	memset(&Lts_t,0,sizeof(LTS_T));
	pLts_t=&Lts_t;
	phTTS->pLTSThreadData=&Lts_t;
#endif	
#endif

#ifdef SEPARATE_PROCESSES
	kernel_share = (struct share_data *)malloc(sizeof(struct share_data));
#endif

#ifdef WIN32
// RDK These should not be TCHAR
  // CAB 8/12/2002
//  TCHAR szMainDict[MAX_STRING_LENGTH];
//  TCHAR szUserDict[MAX_STRING_LENGTH];
  char szMainDict[MAX_STRING_LENGTH];
  char szUserDict[MAX_STRING_LENGTH];
// RDK These should not be TCHAR
  /* GL 09/25/1997 add szAbbrDict,nAdicload  to support abbr dictionary */
//  TCHAR szAbbrDict[MAX_STRING_LENGTH];
//  TCHAR szForeignDict[MAX_STRING_LENGTH];
  char szAbbrDict[MAX_STRING_LENGTH];
  char szForeignDict[MAX_STRING_LENGTH];
  int fDicLoad;

  if((pLts_t = (PLTS_T)malloc(sizeof(LTS_T)))== NULL)
	return(MMSYSERR_NOMEM);
  
  /* MVP :Associate LTS thread specific data handle to the current speech object*/
  phTTS->pLTSThreadData = pLts_t ;
  

   /* GL 09/25/1997 add szAbbrDict to support abbr dictionary */
  GetDictionaryNames( szMainDict, szUserDict, szAbbrDict, szForeignDict );

  if (phTTS->dictionary_file_name[0])
  {
// RDK Dictionary Names need to be char not wchar
#ifdef UNDER_CE	//29oct99 mfg convert unicode string to char string for Windows CE
	  WideStringtoAsciiString(ch_dictionary_file_name, phTTS->dictionary_file_name, 500);
// #ifdef UNDER_CE
//	  wcscpy(szMainDict, phTTS->dictionary_file_name);
	  strcpy(szMainDict,ch_dictionary_file_name);
#else
	  strcpy(szMainDict,phTTS->dictionary_file_name);
#endif
  }
  /*
   * MVP : Load the main dictionary only once for all instances of DECtalk
   *		  Speech engine.
   */
  /* GL 09/25/1997 use the array for dictionary entry structure */
  /*               also add UK_english support */
  /*               comment out the abbr dictionary section for now */
  // tek 27may98 bats 689: lock this to avoid a collosion

  if (!ThreadLock(&tl_gnInstanceCounter,5))
	  return (MMSYSERR_ERROR);

  if(!gnInstanceCounter || phTTS->dictionary_file_name[0])
  {	nDicLoad = load_dictionary( phTTS,
						&(pKsd_t->fdic_index[DICT_LANG]),
						&(pKsd_t->fdic_data[DICT_LANG]),
						&(pKsd_t->fdic_entries[DICT_LANG]),
						&(pKsd_t->fdic_bytes[DICT_LANG]),
#ifdef CHEESY_DICT_COMPRESSION
						&(pKsd_t->fdic_fc_entry[DICT_LANG]),
						&(pKsd_t->fdic_fc_entries[DICT_LANG]),
#endif
						szMainDict,
						TRUE,
						TRUE,
						(DT_HANDLE*)&(pKsd_t->fdicMapObject[DICT_LANG]),
						(DT_HANDLE*)&(pKsd_t->fdicFileHandle[DICT_LANG]),
						(LPVOID*)&(pKsd_t->fdicMapStartAddr[DICT_LANG]),
						MEMMAP_ON);

		if(!gnInstanceCounter)
		{	fDicLoad = load_dictionary( phTTS,
						&(pKsd_t->foreigndic_index[DICT_LANG]),
						&(pKsd_t->foreigndic_data[DICT_LANG]),
						&(pKsd_t->foreigndic_entries[DICT_LANG]),
						&(pKsd_t->foreigndic_bytes[DICT_LANG]),
#ifdef CHEESY_DICT_COMPRESSION
						NULL,
						NULL,
#endif
						szForeignDict,
						FALSE,
						FALSE,
						(DT_HANDLE*)&(pKsd_t->foreigndicMapObject[DICT_LANG]),
						(DT_HANDLE*)&(pKsd_t->foreigndicFileHandle[DICT_LANG]),
						(LPVOID*)&(pKsd_t->foreigndicMapStartAddr[DICT_LANG]),
						MEMMAP_ON);
		}

//		nAdicLoad = load_dictionary( phTTS,
//						&(pKsd_t->adic[LANG_english]),
//						&(pKsd_t->adic_entries[LANG_english]),
//						szAbbrDict,
//						TRUE,
//						TRUE );


		/*MVP : On the following errors notify TextToSpeechStartup by 
			returning the error.
		*/

		if(nDicLoad == MMSYSERR_INVALPARAM || nDicLoad == MMSYSERR_NOMEM ||
 			nDicLoad == MMSYSERR_ERROR)
		{
#ifdef DEBUG
			MessageBox(NULL,szMainDict,_T("Error loading dictionary"), MB_ICONSTOP | MB_OK);
#endif
			return (nDicLoad);
		}

		/* GL 09/25/1997 support Abbr dictionary load error checking */
		/*               comment out for now */
//		if(nAdicLoad == MMSYSERR_INVALPARAM || nAdicLoad == MMSYSERR_NOMEM ||
// 			nAdicLoad == MMSYSERR_ERROR)
//		{
//#ifdef DEBUG
//			MessageBox(NULL,szAbbrDict,"Error loading Abbr. dictionary", MB_ICONSTOP | MB_OK);
//#endif
//			return (nAdicLoad);
//		}

		//gnInstanceCounter++; // tek 27may98 bats 689. Don't do this here.

/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
		if(!gnInstanceCounter)
		{
			gpufdic_index = pKsd_t->fdic_index[DICT_LANG];
			gpufdic_data = pKsd_t->fdic_data[DICT_LANG];
			gufdic_entries = pKsd_t->fdic_entries[DICT_LANG];
			gufdic_bytes = pKsd_t->fdic_bytes[DICT_LANG];
			gufdicMapObject=pKsd_t->fdicMapObject[DICT_LANG];
			gufdicFileHandle=pKsd_t->fdicFileHandle[DICT_LANG];
			gufdicMapStartAddr=pKsd_t->fdicMapStartAddr[DICT_LANG];
#ifdef CHEESY_DICT_COMPRESSION
			gufdic_fc_entry=pKsd_t->fdic_fc_entry[DICT_LANG];         /*   total entries in dictionarys */
			gufdic_fc_entries=pKsd_t->fdic_fc_entries[DICT_LANG];         /*   total entries in dictionarys */
#endif
			
			gpufordic_index = pKsd_t->foreigndic_index[DICT_LANG];
			gpufordic_data = pKsd_t->foreigndic_data[DICT_LANG];
			gufordic_entries = pKsd_t->foreigndic_entries[DICT_LANG];
			gufordic_bytes = pKsd_t->foreigndic_bytes[DICT_LANG];
			gufordicMapObject=pKsd_t->foreigndicMapObject[DICT_LANG];
			gufordicFileHandle=pKsd_t->foreigndicFileHandle[DICT_LANG];
			gufordicMapStartAddr=pKsd_t->foreigndicMapStartAddr[DICT_LANG];
		}
  }
  else
  {
/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
		pKsd_t->fdic_index[DICT_LANG] = gpufdic_index;
		pKsd_t->fdic_data[DICT_LANG] = gpufdic_data;
		pKsd_t->fdic_entries[DICT_LANG] = gufdic_entries;
		pKsd_t->fdic_bytes[DICT_LANG] = gufdic_bytes;
		pKsd_t->fdicMapObject[DICT_LANG]=gufdicMapObject;
		pKsd_t->fdicFileHandle[DICT_LANG]=gufdicFileHandle;
		pKsd_t->fdicMapStartAddr[DICT_LANG]=gufdicFileHandle;
#ifdef CHEESY_DICT_COMPRESSION
		pKsd_t->fdic_fc_entry[DICT_LANG]=gufdic_fc_entry;         /*   total entries in dictionarys */
		pKsd_t->fdic_fc_entries[DICT_LANG]=gufdic_fc_entries;         /*   total entries in dictionarys */
#endif

		pKsd_t->foreigndic_index[DICT_LANG] = gpufordic_index;
		pKsd_t->foreigndic_data[DICT_LANG] = gpufordic_data;
		pKsd_t->foreigndic_entries[DICT_LANG] = gufordic_entries;
		pKsd_t->foreigndic_bytes[DICT_LANG] = gufordic_bytes;
		pKsd_t->foreigndicMapObject[DICT_LANG]=gufordicMapObject;
		pKsd_t->foreigndicFileHandle[DICT_LANG]=gufordicFileHandle;
		pKsd_t->foreigndicMapStartAddr[DICT_LANG]=gufordicMapStartAddr;

  }

/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
  nDicLoad = load_dictionary( phTTS,
				  &(pKsd_t->udic_index[DICT_LANG]),
				  &(pKsd_t->udic_data[DICT_LANG]),
				  &(pKsd_t->udic_entries[DICT_LANG]),
				  &(pKsd_t->udic_bytes[DICT_LANG]),
#ifdef CHEESY_DICT_COMPRESSION
				  NULL,
				  NULL,
#endif
				  szUserDict,
				  FALSE,
				  TRUE,
				  NULL,
				  NULL,
				  NULL,
				  MEMMAP_OFF );


 /*MVP : On the following errors notify TextToSpeechStartup 
		  by returning the error.
  */

  // tek 27may98 bats 689:
  // do the right thing based on whether we managed to load or not..
  if(nDicLoad == MMSYSERR_INVALPARAM || nDicLoad == MMSYSERR_NOMEM ||
		nDicLoad == MMSYSERR_ERROR)
  {
	  // just unlock; no instance increment
	  ThreadUnlock(&tl_gnInstanceCounter);
	  return(nDicLoad);
  }
  else
  {
	  // bump the count, then unlock.
	  gnInstanceCounter++;
	  ThreadUnlock(&tl_gnInstanceCounter);
  }

#ifndef SINGLE_THREADED
  SetEvent(phTTS->hMallocSuccessEvent);  /*MVP :Set the malloc success,load dictionary success event */
#endif
  
#endif /* #ifdef WIN32 */

#if defined _UNIX_LIKE_
  int fDicLoad;

  char main_dict_name[1000];
  char foreign_dict_name[1000];
  char user_dict_name[1000];

  linux_get_dict_names(main_dict_name,user_dict_name,foreign_dict_name);
  if (phTTS->dictionary_file_name[0])
  {
	  strcpy(main_dict_name,phTTS->dictionary_file_name);
  }
  /* Initialize thread error field to no error */
  phTTS->uiThreadError = MMSYSERR_NOERROR;

  if((pLts_t = (PLTS_T)calloc(1,sizeof(LTS_T)))== NULL)
  {
#ifdef SINGLE_THREADED
  return(MMSYSERR_NOMEM);
#else
	phTTS->uiThreadError = MMSYSERR_NOMEM;
#endif
  }
  else 
  {
    /* MVP :Associate LTS thread specific data handle to the 
          current speech object */
    phTTS->pLTSThreadData = pLts_t ;

/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
/*               comment out the abbr dictionary section for now */

    nDicLoad = load_dictionary( (void **)&(pKsd_t->fdic_index[DICT_LANG]),
			(void **)&(pKsd_t->fdic_data[DICT_LANG]),
		   (unsigned int *)&(pKsd_t->fdic_entries[DICT_LANG]),
		   (unsigned int *)&(pKsd_t->fdic_bytes[DICT_LANG]),
		   main_dict_name,
      		   TRUE,
				(DT_HANDLE*)&(pKsd_t->fdicMapObject[DICT_LANG]),
				(DT_HANDLE*)&(pKsd_t->fdicFileHandle[DICT_LANG]),
				(LPVOID*)&(pKsd_t->fdicMapStartAddr[DICT_LANG]),
						MEMMAP_ON);

    fDicLoad = load_dictionary( (void **)&(pKsd_t->foreigndic_index[DICT_LANG]),
			(void **)&(pKsd_t->foreigndic_data[DICT_LANG]),
		   (unsigned int *)&(pKsd_t->foreigndic_entries[DICT_LANG]),
		   (unsigned int *)&(pKsd_t->foreigndic_bytes[DICT_LANG]),
		   foreign_dict_name,
      		   FALSE,
				(DT_HANDLE*)&(pKsd_t->foreigndicMapObject[DICT_LANG]),
				(DT_HANDLE*)&(pKsd_t->foreigndicFileHandle[DICT_LANG]),
				(LPVOID*)&(pKsd_t->foreigndicMapStartAddr[DICT_LANG]),
						MEMMAP_ON);

//nAdicLoad = load_dictionary( &(pKsd_t->adic[LANG_english]),
      //		   &(pKsd_t->adic_entries[LANG_english]),
      //		   "/usr/lib/dtk/abbr_us.dic",
      //		   TRUE );

    if( nDicLoad == MMSYSERR_INVALPARAM || nDicLoad == MMSYSERR_NOMEM ||
	nDicLoad == MMSYSERR_ERROR)
    {
      fprintf(stderr,"DECtalk cannot run without the dictionary file %s\n",
				  main_dict_name);
#ifdef SINGLE_THREADED
	  return (nDicLoad);
#else
      phTTS->uiThreadError = nDicLoad;
#endif
    }

	/* GL 09/25/1997 support Abbr dictionary load error checking */
	/*               comment out for now */
//    if( nAdicLoad == MMSYSERR_INVALPARAM || nAdicLoad == MMSYSERR_NOMEM ||
//	nAdicLoad == MMSYSERR_ERROR)
//    {
//      fprintf(stderr,"DECtalk cannot run without the abbr. dictionary file %s\n",
//				  "/usr/lib/dtk/abbr.dic");
//      phTTS->uiThreadError = nAdicLoad;
//    }

    /*
     * Look for an ini file in the users login directory
     */
#ifndef SINGLE_THREADED
    if (phTTS->uiThreadError == MMSYSERR_NOERROR)
#endif
    {

      /*
       * Make sure we have a valid HOME environment set.
       */
      if( user_dict_name[0] )
      {
/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
        load_dictionary( (void **)&(pKsd_t->udic_index[DICT_LANG]),
        				 (void **)&(pKsd_t->udic_data[DICT_LANG]),
        				 (unsigned int *)&(pKsd_t->udic_entries[DICT_LANG]),
						 (unsigned int *)&(pKsd_t->udic_bytes[DICT_LANG]),
        				 user_dict_name,
        				 FALSE,
						 NULL,
						 NULL,
						 NULL,
						 MEMMAP_OFF );
      }
    }
  }

  /* 
   * CP: Set the event, even if malloc eerror occurred. User
   * will look at uiThreadError for actual error code.
   */
#ifndef SINGLE_THREADED
  OP_SetEvent(phTTS->hMallocSuccessEvent);
  if (phTTS->uiThreadError != MMSYSERR_NOERROR)
  {
    OP_ExitThread((void *)phTTS->uiThreadError);
    OP_THREAD_RETURN;
  }
#endif
#endif /* #ifdef __osf__ */

#if defined(OS_SYMBIAN) || defined(OS_PALM)

  if(!pLts_t)
  {
	  if((pLts_t = (PLTS_T)calloc(1,sizeof(LTS_T)))== NULL)
	  {
	  return(MMSYSERR_NOMEM);
	  }
	  else 
	  {

	     phTTS->pLTSThreadData = pLts_t ;

		 nDicLoad = load_dictionary( (void **)&(pKsd_t->fdic_index[DICT_LANG]),
			   (void **)&(pKsd_t->fdic_data[DICT_LANG]),
			   (unsigned int *)&(pKsd_t->fdic_entries[DICT_LANG]),
			   (unsigned int *)&(pKsd_t->fdic_bytes[DICT_LANG]),
#ifdef OS_SYMBIAN
				GetGlobalDTPtr()->pDictPath,
#else
				MAIN_DICT_NAME,
#endif
      			TRUE,
				(DT_HANDLE*)&(pKsd_t->fdicMapObject[DICT_LANG]),
				(DT_HANDLE*)&(pKsd_t->fdicFileHandle[DICT_LANG]),
				(LPVOID*)&(pKsd_t->fdicMapStartAddr[DICT_LANG]),
				MEMMAP_OFF); 

		  if( nDicLoad == MMSYSERR_INVALPARAM || nDicLoad == MMSYSERR_NOMEM ||
		  nDicLoad == MMSYSERR_ERROR)
		  {
		    return (nDicLoad);
		  }

#if 0
		  if( user_dict_name[0] )
		  {
			load_dictionary( (void **)&(pKsd_t->udic_index[DICT_LANG]),
        					 (void **)&(pKsd_t->udic_data[DICT_LANG]),
        					 (unsigned int *)&(pKsd_t->udic_entries[DICT_LANG]),
							 (unsigned int *)&(pKsd_t->udic_bytes[DICT_LANG]),
        					 USER_DICT_NAME,
        					 FALSE,
							 NULL,
							 NULL,
							 NULL,
							 MEMMAP_OFF );
		  }
#endif
	  }
  }
#endif //OS_SYMBIAN or OS_PALM

ls_util_lts_init (pLts_t, pKsd_t); 

/* JDB: language dependent... */
#ifdef ENGLISH_US
#ifdef ACNA
  	lsa_util_init_lang(pLts_t);
#endif
	default_lang(pKsd_t,LANG_english,LANG_lts_ready);  
#endif

/* GL 09/25/1997 add UK_english support */
#ifdef ENGLISH_UK
#ifdef ACNA
  	lsa_util_init_lang(pLts_t);
#endif
	default_lang(pKsd_t,LANG_british,LANG_lts_ready);  
#endif

#ifdef SPANISH_SP
    default_lang(pKsd_t,LANG_spanish,LANG_lts_ready);
#endif

#ifdef SPANISH_LA
    default_lang(pKsd_t,LANG_latin_american,LANG_lts_ready);
#endif
#ifdef ITALIAN
    default_lang(pKsd_t,LANG_italian,LANG_lts_ready);
#endif
#ifdef SPANISH
/* GL 11/12/1998, BATS#800 need to initialize these variables for Spanish */
	pLts_t->ord = 0;
   	pLts_t->dic_offset = 0;
   	pLts_t->flag =0;
#endif
#ifdef ITALIAN
	pLts_t->ord = 0;
#endif



#ifdef GERMAN
   default_lang(pKsd_t,LANG_german,LANG_lts_ready);
#endif

#ifdef FRENCH
   default_lang(pKsd_t,LANG_french,LANG_lts_ready);
#endif

	ls_task_main(phTTS);
	/* Free here thread specific data structure MVP */
#ifndef SINGLE_THREADED
	if(pLts_t)
		free(pLts_t);
	phTTS->pLTSThreadData = pLts_t = NULL;
#endif

	return MMSYSERR_NOERROR; // NAL warning removal
}       

/*extern int fc_index; */    /*MVP MI */

#ifdef WIN32
#ifndef UNDER_CE

/**********************************************************************/
/*                                                                    */
/*  Function: IsFileAccessible										  */
/*  Author:	  tek		                                              */
/*  Date:	  25feb98						                          */
/*                                                                    */
/*  Abstract:                                                         */
/*			Handy routine to see if a file is accessible              */
/*                                                                    */
/*  Input:                                                            */
/*      Arguments:													  */
/*					char * szFileName		Entrie pathname with      */
/*											filename                  */
/*                                                                    */
/*  Return Value:	BOOL											  */
/*					FALSE	Error									  */
/*					TRUE	File was found							  */
/*                                                                    */
/*      Comments:                                                     */
/*                                                                    */
/**********************************************************************/
BOOL IsFileAccessible(char *szFileName)
{
	if (!_access(szFileName,0)) // check for existence only
	{
		return (TRUE);
	}
	else
	{
		return (FALSE);
	}
}

/**********************************************************************/
/*                                                                    */
/*  Function: FindFileOnPath			                              */
/*  Author:				                                              */
/*  Date:				                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*				 Handy routine to look on the path					  */
/*                                                                    */
/*  Input:                                                            */
/*      Arguments: 	char * szResultstring   The entire path name with */
/*											filename				  */
/*					char * szFileName		File name                 */
/*                                                                    */
/*  Return Value:	BOOL											  */
/*					FALSE	Error									  */
/*					TRUE	File was found							  */
/*                                                                    */
/*      Comments:                                                     */
/*                                                                    */
/**********************************************************************/
BOOL FindFileOnPath(char *szResultString, char *szFileName)
{
	// find szFileName on PATH; return TRUE if successful.
	// WARNING: make sure the destination string is big enough!!
	_searchenv(szFileName, "PATH", szResultString);
	if ( (strlen(szResultString) != 0) && (IsFileAccessible(szResultString)) )
	{
		return (TRUE);
	}
	else
	{
		return (FALSE);
	}
}

/**********************************************************************/
/*                                                                    */
/*  Function: FindFileInCurrentDirectory                              */
/*  Author:				                                              */
/*  Date:				                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*				Handy routine to look in the "current directory"	  */
/*                                                                    */
/*  Input:                                                            */
/*      Arguments: 	char * szResultstring   The entire path name with */
/*											filename				  */
/*					char * szFileName		File name                 */
/*                                                                    */
/*  Return Value:	BOOL											  */
/*					FALSE	Error									  */
/*					TRUE	File was found							  */
/*                                                                    */
/*      Comments:                                                     */
/*                                                                    */
/**********************************************************************/
BOOL FindFileInCurrentDirectory(char *szResultString, char *szFileName)
{
	// look in the current directory for a file, return TRUE is successful
	// WARNING: make sure the destination string is big enough!

	char szTempBuf[_MAX_PATH*2]="";
	int	iStringLength=0;

	if (!_getcwd(szTempBuf, _MAX_PATH))
	{
		//oops, error?
		return (FALSE);
	}

	iStringLength = strlen(szTempBuf);
	if (iStringLength == 0)
	{
		// oops, error?
		return (FALSE);
	}
	// correct for the possible missing '\' at the end of the path
	if (szTempBuf[iStringLength] != '\\')
	{
		szTempBuf[iStringLength] = '\\';
		szTempBuf[iStringLength+1] = '\0';
	}

	// glue it together
	strcat(szTempBuf,szFileName);
	strcpy(szResultString, szTempBuf);
	if (IsFileAccessible(szTempBuf))
	{
		return (TRUE);
	}
	else
	{
		return (FALSE);
	}
}
#endif // UNDER_CE

/**********************************************************************/
/*                                                                    */
/*  Function: GetDictionaryNames                                      */
/*  Author: Bill Hallahan                                             */
/*  Date: October 5, 1994                                             */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*			This function gets the main, user, abbreviation and       */
/*			foreign language dictionary names from the registry.      */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    szMainDict     A pointer to a string that will contain the      */
/*                   name of the main dictionary.                     */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*    szUserDict     A pointer to a string that will contain the      */
/*                   name of the user dictionary.       			  */
/*                   The returned value will be NULL terminated.      */
/*																	  */
/*	  szAbbrDict     A pointer to a string that will contain the      */
/*                   name of the abbreviations dictionary.            */
/*                   The returned value will be NULL terminated.      */
/*																	  */
/*	  szForeignDict  A pointer to a string that will contain the      */
/*                   name of the foreign language dictionary.         */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*      Arguments: 	char * szMainDict                                 */
/*					char * szUserDict                                 */
/*					char * szAbbrDict								  */
/*					char * szForeignDict							  */
/*                                                                    */
/*      Return Value: void                                            */
/*                                                                    */
/*      Comments:                                                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

// tek 18aug98 no longer static, so that we can see it from other files
// and use it to find the udic directory
/*
 *      Function Name: GetDictionaryNames()      
 */
// RDK This routine produces (as it should) char variables, NOT TCHAR
// void GetDictionaryNames( TCHAR * szMainDict, TCHAR * szUserDict, TCHAR * szAbbrDict, TCHAR *szForeignDict )
void GetDictionaryNames( char * szMainDict, char * szUserDict, char * szAbbrDict, char *szForeignDict )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;

#ifdef UNDER_CE
  // CAB 8/12/2002
  TCHAR wszMainDict[MAX_STRING_LENGTH]; // wide char type needed for windows CE mfg 01/06/1999
  TCHAR wszUserDict[MAX_STRING_LENGTH]; // wide char type needed for windows CE mfg 01/01/1999
  TCHAR wszForeignDict[MAX_STRING_LENGTH]; // wide char type needed for windows CE mfg 01/01/1999
#endif

#ifdef FORCE_WINDICTDIRS
  char stemp[MAX_STRING_LENGTH+9];
#endif

#ifdef DEMO
#ifndef UNDER_CE
  // tek 25feb98 lots of changes here to be more rational about looking for the dictionaries.
  // the first place we look is the old parse-the-command-line place, and if
  // that fails we then look in the "current directory", and then finally on the
  // PATH. Note that the user dictionary and the main dictionary go through this 
  // process separately, so they may not end up coming from the same place; this
  // is probably good, because this would allow a common main dictionary (placed
  // on the path), and separate user dictionaries (in the "current", or "working",
  // directory).

  // this is undoubtedly not unicode compatible

  char szResultPath[_MAX_PATH*2]="";
  char temp[20], szDefUserDic[256]="user.dic";// tek 25feb98 we'll need this default later..
#else
  char temp[20];
#endif // UNDER_CE
  LPTSTR cmd_line = GetCommandLine();
  char new_cmd_line[512];
  int cmd_ptr = 0;

  while (cmd_line[cmd_ptr] != '\0' && cmd_line[cmd_ptr] != ' ')	cmd_ptr++;
  while (cmd_line[cmd_ptr] != '\\' && cmd_ptr != 0)				cmd_ptr--;
  if (cmd_ptr != 0)	cmd_ptr++;
  cmd_line[cmd_ptr] = '\0';

#ifndef UNDER_CE
  // tek 25feb98 we have to do this step before we ever use the cmdline-based
  // string.. 
	if (cmd_line[0] == '"')	strcpy(new_cmd_line,cmd_line+1);	// Win95 addes a " to the beginning
	else					strcpy(new_cmd_line,cmd_line);  
#endif // UNDER_CE


#ifndef UNDER_CE
  sprintf(szUserDict,"%s%s",cmd_line,szDefUserDic);  // tek 25feb98 be consistent
#else
  sprintf(szUserDict,"%s%s",cmd_line,"user.dic");
#endif // UNDER_CE

  /* DEMO_DICT_DEF is defined in coop.h -- ncs 06aug97 */
	strcpy(temp,szMainDictDef);

#ifdef UNDER_CE
	if (cmd_line[0] == '"')	strcpy(new_cmd_line,cmd_line+1);	// Win95 addes a " to the beginning
	else					strcpy(new_cmd_line,cmd_line);  
#endif // UNDER_CE
	sprintf(szMainDict, "%s%s", new_cmd_line, temp);
	sprintf(szForeignDict, "%s%s", new_cmd_line, szForeignDictDef);

#ifndef UNDER_CE
	// tek 25feb98 OK, we have the defaults. Now go try to find the existing files.
	// main dictionary..
	// first, the "old way".. 
	if (IsFileAccessible(szMainDict))
	{
		// do nothing, it's OK
	}
	else if (FindFileInCurrentDirectory(szResultPath, szMainDictDef))
	{
		strcpy(szMainDict, szResultPath); //use this one
	}
	else if (FindFileOnPath(szResultPath, szMainDictDef))
	{
		strcpy(szMainDict, szResultPath); // use this one
	}
	else
	{
		//the file is invalid, and we're in trouble.
		// not much we can do here.
#if LTS_DEBUG
		OutputDebugString("Failed to find MAIN dictionary\n");
#endif //LTS_DEBUG
	}

	// same thing for the user dictionary..
	// first, the "old way".. 
	if (IsFileAccessible(szUserDict))
	{
		// do nothing, it's OK
	}
	else if (FindFileInCurrentDirectory(szResultPath, szDefUserDic))
	{
		strcpy(szUserDict, szResultPath); //use this one
	}
	else if (FindFileOnPath(szResultPath, szDefUserDic))
	{
		strcpy(szUserDict, szResultPath); // use this one
	}
	else
	{
		//the file is invalid, and we're in trouble.
		// not much we can do here.
#if LTS_DEBUG
		OutputDebugString("Failed to find USER dictionary\n");
#endif //LTS_DEBUG
	}

	if (IsFileAccessible(szForeignDict))
	{
		// do nothing, it's OK
	}
	else if (FindFileInCurrentDirectory(szResultPath, szForeignDictDef))
	{
		strcpy(szForeignDict, szResultPath); //use this one
	}
	else if (FindFileOnPath(szResultPath, szForeignDictDef))
	{
		strcpy(szForeignDict, szResultPath); // use this one
	}
	else
	{
		//the file is invalid, and we're in trouble.
		// not much we can do here.
#if LTS_DEBUG
		OutputDebugString("Failed to find foreign dictionary\n");
#endif //LTS_DEBUG
	}

	
	// if we're in debug, print the results..
#if LTS_DEBUG
	{
		char szTemp[_MAX_PATH*3]="";
		sprintf(szTemp, "Main dictionary at %s\n",szMainDict);
		OutputDebugString(szTemp);
		sprintf(szTemp, "User dictionary at %s\n",szUserDict);
		OutputDebugString(szTemp);
	}
#endif //LTS_DEBUG
#endif // #ifndef UNDER_CE

	return;
#endif // DEMO

#ifndef CUP28PROJECT
#ifdef UNDER_CE
	DeleteFile(_T("\\dtdic.log"));	// Delete file if it exist
#endif
#endif
  /********************************************************************/
  /*  Get the user dictionary.                                        */
  /********************************************************************/
  // RDK Changed to use FORCE_WINDICTDIRS to force for Windows Directory for User Dictionary
#ifdef FORCE_WINDICTDIRS
	sprintf(szUserDict,"%s","\\windows\\user.dic");
#else
  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
			 szCurrentUsersDECtalk,
			 0,
			 KEY_QUERY_VALUE,
			 &hKey ) != ERROR_SUCCESS )
  {
// RDK This should not be a wchar
// #ifdef UNDER_CE //mfg
//	wcscpy( szUserDict, szUserDictDef );
// #else
	strcpy( szUserDict, szUserDictDef );
// #endif
  }
  else
  {
	cbData = MAX_STRING_LENGTH;
	if ( RegQueryValueEx( hKey,
#ifndef UNDER_CE
			  "UserDict",
#else
			  TEXT("UserDict"),
#endif
			  NULL,
			  &dwType,
#ifndef UNDER_CE
			  (LPBYTE)szUserDict,
#else
			  (LPBYTE)wszUserDict,
#endif
			  &cbData ) != ERROR_SUCCESS )
	{
// RDK This should not be a wchar
// #ifdef UNDER_CE
//	  wcscpy( szUserDict, szUserDictDef );
// #else
	  strcpy( szUserDict, szUserDictDef );
// #endif
	}
	else
	{
#ifdef UNDER_CE //convert wide string to char string for windows CE
WideStringtoAsciiString(szUserDict, wszUserDict, MAX_STRING_LENGTH);
#endif

	RegCloseKey( hKey );
  }
  }

#endif // FORCE_WINDICTDIRS

  /********************************************************************/
  /*  Get the main and abbreviation dictionary.                       */
  /********************************************************************/
  if(!gnInstanceCounter)
  {
        /* GL 09/25/1997 add abbreviation dictionary support */
		/*               will need modify the installation to create the*/
	    /*               registry entry, comment out for now */

/* ************************ NOT USED ***************************** */
#if 0
	    if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
				 szLocalMachineAbbrDECtalk,
				 0,
				KEY_QUERY_VALUE,
				&hKey ) != ERROR_SUCCESS )
		{
			strcpy( szAbbrDict, szAbbrDictDef );
		}
		else
		{
			cbData = MAX_STRING_LENGTH;

			if ( RegQueryValueEx( hKey,
					"AbbrDict",
					NULL,
					&dwType,
					(LPBYTE)szAbbrDict,
					&cbData ) != ERROR_SUCCESS )
			{
				strcpy( szAbbrDict, szAbbrDictDef );
			}

			RegCloseKey( hKey );
		}
#endif // 0
/* *************************************************************** */

  // RDK Changed to use FORCE_WINDICTDIRS to force for Windows Directory for User Dictionary
#ifdef FORCE_WINDICTDIRS
		sprintf(stemp, "%s",("\\windows\\"));
		strcpy(szMainDict,  stemp);			// do the Main Dictionary
		strcat(szMainDict, szMainDictDef);
		strcpy( szForeignDict, stemp );		// do the Foreign Dictionary
		strcat(szForeignDict, szForeignDictDef);
#else
		if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
			szLocalMachineDECtalk,
			0,
			KEY_QUERY_VALUE,
			&hKey ) != ERROR_SUCCESS )
		{
#ifdef WIN32
			// tek 14may98 log the fact that we are using the default dictionary name
#ifdef UNDER_CE
#ifndef CUP28PROJECT
			HANDLE hFile;
			char temp[MAX_STRING_LENGTH];
			DWORD dwRw;

			// open for write, handle EOF
			hFile = CreateFile(_T("\\dtdic.log"), GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS,
				               FILE_ATTRIBUTE_NORMAL,NULL);
			if (hFile)
			{	// Big S because it's unicode
				sprintf(temp, "Dictionary key %S not found; using default name\n", szLocalMachineDECtalk);
				WriteFile( hFile, temp, sizeof(temp), &dwRw, NULL);
				CloseHandle(hFile);
			}
#endif // CUP28PROJECT

// RDK This should not be a wchar
//			wcscpy( szMainDict, szMainDictDef );
//			wcscpy( szForeignDict, szForeignDictDef );
			strcpy( szMainDict, szMainDictDef );
			strcpy( szForeignDict, szForeignDictDef );
#else
			FILE *fpDicLogFile = NULL;
			
			fpDicLogFile = fopen("\\dtdic.log","a+"); // open for append, handle EOF
			if (fpDicLogFile)
			{	char szDateBuf[64];
				char szTimeBuf[64];
				// log the pertinent info
				_strdate(szDateBuf);
				_strtime(szTimeBuf);
				fprintf(fpDicLogFile,"%s %s : Dictionary key %s not found; using default name\n",
					szDateBuf, szTimeBuf, szLocalMachineDECtalk);
				fflush(fpDicLogFile);
				fclose(fpDicLogFile);
			}

			strcpy( szMainDict, szMainDictDef );
			strcpy( szForeignDict, szForeignDictDef );
#endif //UNDER_CE
#endif //  

		}
		else
		{	cbData = MAX_STRING_LENGTH;
			
			if ( RegQueryValueEx( hKey,
#ifndef UNDER_CE
				"MainDict",
#else			
				TEXT("MainDict"),
#endif
				NULL,
				&dwType,
// CAB 8/12/2002
#ifndef UNDER_CE
				(LPBYTE)szMainDict,
#else
				(LPBYTE)wszMainDict,
#endif
				&cbData ) != ERROR_SUCCESS )
			{
#ifdef WIN32
				// tek 14may98 log the fact that we are using the default dictionary name
#ifdef UNDER_CE
#ifndef CUP28PROJECT
				HANDLE hFile;
				char temp[MAX_STRING_LENGTH];
				DWORD dwRw;

				// open for write, handle EOF
				hFile = CreateFile(_T("\\dtdic.log"), GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS,
					               FILE_ATTRIBUTE_NORMAL,NULL);
				if (hFile)
				{	sprintf(temp, "Dictionary key MainDict not found; using default name\n");
					WriteFile( hFile, temp, sizeof(temp), &dwRw, NULL);
					CloseHandle(hFile);
				}
#endif // CUP28PROJECT

//mfg				wcscpy( szMainDict, szMainDictDef );
// RDK This should not be a wchar
					strcpy( szMainDict, szMainDictDef );
#else
				FILE *fpDicLogFile = NULL;
	
				fpDicLogFile = fopen("\\dtdic.log","a+"); // open for append, handle EOF
				if (fpDicLogFile)
				{	char szDateBuf[64];
					char szTimeBuf[64];
					// log the pertinent info
					_strdate(szDateBuf);
					_strtime(szTimeBuf);
					fprintf(fpDicLogFile,"%s %s : Dictionary key MainDict not found; using default name\n",
							szDateBuf, szTimeBuf);
					fflush(fpDicLogFile);
					fclose(fpDicLogFile);
				}
#endif
				
#endif //WIN32
				strcpy( szMainDict, szMainDictDef );
			}

#ifdef UNDER_CE //convert wide string to char string for windows CE
			else
			{	// CAB 6/08/02	Fixed to copy valid value from registry
				WideStringtoAsciiString(szMainDict, wszMainDict, MAX_STRING_LENGTH);
			}
#endif	

			cbData = MAX_STRING_LENGTH;
			if ( RegQueryValueEx( hKey,
#ifndef UNDER_CE
				"ForeignDict",
#else			
				TEXT("ForeignDict"),
#endif
				NULL,
				&dwType,
// RDK Undid CAB's Change which broke CE
// CAB 8/12/2002
//#ifndef UNDER_CE
#ifndef UNDER_CE
				(LPBYTE)szForeignDict,
//#else
#else
//				(LPBYTE)wszForeignDict,
				(LPBYTE)wszForeignDict,
//#endif
#endif
				&cbData ) != ERROR_SUCCESS )
			{
#ifdef WIN32
#ifdef FOREIGNDICT_DTDIC_LOG // Bats 987 12/03/01
				// Log the fact that we are using the default foreign dictionary name
#ifdef UNDER_CE
#ifndef CUP28PROJECT
				HANDLE hFile;
				char temp[MAX_STRING_LENGTH];
				DWORD dwRw;

				// open for write, handle EOF
				hFile = CreateFile(_T("\\dtdic.log"), GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS,
					               FILE_ATTRIBUTE_NORMAL,NULL);
				if (hFile)
				{	sprintf(temp, "Foreign Dictionary key ForeignDict not found; using default name\n");
					WriteFile( hFile, temp, sizeof(temp), &dwRw, NULL);
					CloseHandle(hFile);
				}
#endif // CUP28PROJECT
// RDK This should not be a wchar
//				wcscpy( szForeignDict, szForeignDictDef );
				strcpy( szForeignDict, szForeignDictDef );
#else
				FILE *fpDicLogFile = NULL;

				fpDicLogFile = fopen("\\dtdic.log","a+"); // open for append, handle EOF
				if (fpDicLogFile)
				{	char szDateBuf[64];
					char szTimeBuf[64];
					// log the pertinent info
					_strdate(szDateBuf);
					_strtime(szTimeBuf);
					fprintf(fpDicLogFile,"%s %s : Foreign Dictionary key ForeignDict not found; using default name\n",
							szDateBuf, szTimeBuf);
					fflush(fpDicLogFile);
					fclose(fpDicLogFile);
				}
#endif
#endif //FOREIGNDICT_DTDIC_LOG
#endif //WIN32
				strcpy( szForeignDict, szForeignDictDef );
		}

// RDK Undid CAB's Change which broke CE
// CAB 8/12/2002
//#ifdef UNDER_CE //convert wide string to char string for windows CE
		//WideStringtoAsciiString(szForeignDict, wszForeignDict, MAX_STRING_LENGTH);
//#endif	
#ifdef UNDER_CE //convert wide string to char string for windows CE
		WideStringtoAsciiString(szForeignDict, wszForeignDict, MAX_STRING_LENGTH);
#endif	
			RegCloseKey( hKey );
		}
#endif  //FORCE_WINDICTDIRS
  	}
}

BOOL WINAPI _CRT_INIT( HINSTANCE hinstDLL, DWORD fdwReason, 
	LPVOID lpReserved );

/* tek 23jan97 add the entrypoint function and use it to load/unload dictionaries. */
/* changed name from the request of Kevinb. ncs 26feb97 */
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: LTSLibMain                                              */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         LTSLibMain is called by Windows when the dectalk DLL is    */
/*    initialized, Thread Attached, and other times. Since no DLL     */
/*    initialization is required, LTSLibMain return a value of 1      */
/*    indicating success.                                             */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

int LTSLibMain( DT_HANDLE hInst,
			  DWORD ul_reason_being_called,
			  LPVOID lpReserved )
{


	// Initialize the C run-time before calling any of your code.
	if( ul_reason_being_called == DLL_PROCESS_ATTACH ||
		ul_reason_being_called == DLL_THREAD_ATTACH )
	{
/* ********************** NOT USED ******************************* */
#if 0 // This section of code breaks durning build. ie. This won't compile.
      // Could the BOOL line above the LibMain function also be a problem?
		if( !_CRT_INIT( hInst, ul_reason_being_called, lpReserved ) )
			return( FALSE );
#endif // Broken code.
/* *************************************************************** */
	}


// CAB	08/12/2002	Removed
/* **************** NOT USED ************************************* */
#if 0
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
		case DLL_PROCESS_ATTACH:
			/* does licensing happen here? tek 23jan97 */
			break;
		case DLL_THREAD_ATTACH:
			break;
		case DLL_THREAD_DETACH:
			break;
		case DLL_PROCESS_DETACH:
			break;
	}
#endif // 0
/* *************************************************************** */

	return(TRUE);
//  return( 1 );
//  UNREFERENCED_PARAMETER( hInst );
//  UNREFERENCED_PARAMETER( ul_reason_being_called );
//  UNREFERENCED_PARAMETER( lpReserved );
}
#endif


#if defined _UNIX_LIKE_
#ifdef ENGLISH_US
#define LINUX_DICT_TAG "US_dict:"
#define LINUX_FDICT_TAG "US_fdict:"
#define LINUX_UDICT_TAG "US_udict:"
#if defined VXWORKS || defined _SPARC_SOLARIS_
#define DEF_LINUX_MAIN_DICT "dtalk_us.dic"
#define DEF_LINUX_FOREIGN_DICT "dtalk_fl_us.dic"
#else
#define DEF_LINUX_MAIN_DICT "/usr/lib/dtk/dtalk_us.dic"
#define DEF_LINUX_FOREIGN_DICT "/usr/lib/dtk/dtalk_fl_us.dic"
#endif
#define DEMO_DICT_NAME "dtalk_us.dic"
#define DEMO_FDICT_NAME "dtalk_fl_us.dic"
#endif
#ifdef ENGLISH_UK
#define LINUX_DICT_TAG "UK_dict:"
#define LINUX_FDICT_TAG "UK_fdict:"
#define LINUX_UDICT_TAG "UK_udict:"
#define DEF_LINUX_MAIN_DICT "/usr/lib/dtk/dtalk_uk.dic"
#define DEF_LINUX_FOREIGN_DICT "/usr/lib/dtk/dtalk_fl_uk.dic"
#define DEMO_DICT_NAME "dtalk_uk.dic"
#define DEMO_FDICT_NAME "dtalk_fl_uk.dic"
#endif
#ifdef GERMAN
#define LINUX_DICT_TAG "GR_dict:"
#define LINUX_FDICT_TAG "GR_fdict:"
#define LINUX_UDICT_TAG "GR_udict:"
#define DEF_LINUX_MAIN_DICT "/usr/lib/dtk/dtalk_gr.dic"
#define DEF_LINUX_FOREIGN_DICT "/usr/lib/dtk/dtalk_fl_gr.dic"
#define DEMO_DICT_NAME "dtalk_gr.dic"
#define DEMO_FDICT_NAME "dtalk_fl_gr.dic"
#endif
#ifdef SPANISH_SP
#define LINUX_DICT_TAG "SP_dict:"
#define LINUX_FDICT_TAG "SP_fdict:"
#define LINUX_UDICT_TAG "SP_udict:"
#define DEF_LINUX_MAIN_DICT "/usr/lib/dtk/dtalk_sp.dic"
#define DEF_LINUX_FOREIGN_DICT "/usr/lib/dtk/dtalk_fl_sp.dic"
#define DEMO_DICT_NAME "dtalk_sp.dic"
#define DEMO_FDICT_NAME "dtalk_fl_sp.dic"
#endif
#ifdef SPANISH_LA
#define LINUX_DICT_TAG "LA_dict:"
#define LINUX_FDICT_TAG "LA_fdict:"
#define LINUX_UDICT_TAG "LA_udict:"
#define DEF_LINUX_MAIN_DICT "/usr/lib/dtk/dtalk_la.dic"
#define DEF_LINUX_FOREIGN_DICT "/usr/lib/dtk/dtalk_fl_la.dic"
#define DEMO_DICT_NAME "dtalk_la.dic"
#define DEMO_FDICT_NAME "dtalk_fl_la.dic"
#endif
#ifdef ITALIAN
#define LINUX_DICT_TAG "IT_dict:"
#define LINUX_FDICT_TAG "IT_fdict:"
#define LINUX_UDICT_TAG "IT_udict:"
#define DEF_LINUX_MAIN_DICT "/usr/lib/dtk/dtalk_it.dic"
#define DEF_LINUX_FOREIGN_DICT "/usr/lib/dtk/dtalk_fl_it.dic"
#define DEMO_DICT_NAME "dtalk_it.dic"
#define DEMO_FDICT_NAME "dtalk_fl_it.dic"
#endif

#ifdef FRENCH
#define LINUX_DICT_TAG "FR_dict:"
#define LINUX_FDICT_TAG "FR_fdict:"
#define LINUX_UDICT_TAG "FR_udict:"
#define DEF_LINUX_MAIN_DICT "/usr/lib/dtk/dtalk_fr.dic"
#define DEF_LINUX_FOREIGN_DICT "/usr/lib/dtk/dtalk_fl_fr.dic"
#define DEMO_DICT_NAME "dtalk_fr.dic"
#define DEMO_FDICT_NAME "dtalk_fl_fr.dic"
#endif

	
int linux_get_dict_names(char *main_dict_name,char *user_dict_name, char *foreign_dict_name)
{
	FILE *config_file;
	char line[1000];
	char *home_dir;
	char temp_dict_name[1000];
	int ret_value=0;
	
	main_dict_name[0]='\0';
	foreign_dict_name[0]='\0';
	user_dict_name[0]='\0';
	config_file=fopen("/etc/DECtalk.conf","r");
#ifdef TESTING
	if (config_file==NULL)
	{
		config_file=fopen("DECtalk.conf","r");
	}
#endif
	
#ifdef DEMO
        strcpy(main_dict_name,DEMO_DICT_NAME);
        strcpy(foreign_dict_name,DEMO_FDICT_NAME);
        ret_value++;
#else
	if (config_file!=NULL)
	{
		while(fgets(line,999,config_file)!=NULL)
		{
			if (strncmp(line,LINUX_DICT_TAG,8)==0)
			{
				line[strlen(line)-1]='\0';
				strcpy(main_dict_name,line+8);
				break;
			}
		}
	}
	if (main_dict_name[0]=='\0')
	{
#ifndef __osf__
		fprintf(stderr,"libtts.so: Using default dictionary name\n");
#endif
		strcpy(main_dict_name,DEF_LINUX_MAIN_DICT);
	}
	else
	{
		ret_value++;
	}
	if (config_file!=NULL)
	{
		fseek(config_file,0,SEEK_SET);
		while(fgets(line,999,config_file)!=NULL)
		{
			if (strncmp(line,LINUX_FDICT_TAG,9)==0)
			{
				line[strlen(line)-1]='\0';
				strcpy(foreign_dict_name,line+8);
				break;
			}
		}
	}
	if (foreign_dict_name[0]=='\0')
	{
#ifndef __osf__
		//fprintf(stderr,"libtts.so: Using default foreign dictionary name\n");
#endif
		strcpy(foreign_dict_name,DEF_LINUX_FOREIGN_DICT);
	}
	else
	{
		ret_value++;
	}
#endif
	home_dir=getenv("HOME");
	if (home_dir!=NULL)
	{
		temp_dict_name[0]='\0';
		if (config_file!=NULL)
		{
			fseek(config_file,0,SEEK_SET);
			while(fgets(line,999,config_file)!=NULL)
			{
				if (strncmp(line,LINUX_UDICT_TAG,9)==0)
				{
					line[strlen(line)-1]='\0';
					strcpy(temp_dict_name,line+9);
					break;
				}
			}
		}
		if (temp_dict_name[0])
		{
        		sprintf(user_dict_name, "%s/%s", home_dir,temp_dict_name);
			ret_value++;
		}	
		else
		{
        		sprintf(user_dict_name, "%s/udic.dic", home_dir);
		}
			
	}
	if (config_file!=NULL)
	{
		fclose(config_file);
	}
	return(ret_value);
}
#endif
#ifdef MULTIPLE_LANGUAGES_LOADED
int lts_language_loaded( void )
{
	return 0;
}
#endif
#if defined(__cplusplus)
}
#endif

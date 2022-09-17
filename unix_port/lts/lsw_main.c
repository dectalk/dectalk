/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996-1998. All rights reserved.
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
 *  005 GL	12/11/1996	remove the WIN32 language pipe hack
 *  006 KSB     02/10/1997	Fixed bugs for DTDemo fetch, and added debug code
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
 */

#include "dectalkf.h"
				 
#include "ls_def.h"

#ifdef WIN32
#ifndef UNDER_CE
#include <time.h> // tek 14may98 needed for key logging
#endif //UNDER_CE
#endif //WIN32

#define LSWMAIN_DIC
#include "coop.h"
#undef LSWMAIN_DIC

#ifdef SEPARATE_PROCESSES
struct share_data       *kernel_share;
#endif

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
  int far                   *gpufdic          = NULL;
  S32                       gufdic_entries     = 0;

#endif /*BLD_CORE_DLL*/

#define  MAX_STRING_LENGTH  512

static void GetDictionaryNames( char *, char *, char * );

extern MMRESULT load_dictionary( LPTTS_HANDLE_T,
				 void **,
				 unsigned int *,
				 char *,
				 BOOL,
				 BOOL );
										
int __stdcall lts_main( LPTTS_HANDLE_T phTTS )
/* Line below is commented out due to the line above */
// DllExport int __stdcall lts_main( LPTTS_HANDLE_T phTTS )

#endif

#ifdef __osf__

/* GL 04/21/1997  change this for OSF build */
/*#include "dtmmedefs.h"*/
#ifndef __linux__
#include "mmsystem.h"
#endif


extern MMRESULT load_dictionary( void **,
				 				unsigned int *,
				 				char *,
				 				int );
										
/* PROTOTYPES */
/* MGS 11/19/1997 commented out duplicate prototype */
//extern lsa_util_init_lang();
//extern void default_lang ();

//extern ls_task_main ();


/* GL 04/21/1997  change this for OSF build */
/*int lts_main(LPTTS_HANDLE_T phTTS )*/
OP_THREAD_ROUTINE(lts_main, LPTTS_HANDLE_T phTTS)
#endif
{
  
  /* 
   * Added a variable to get current instance kernel share data and
   * initialize from phTTS structure  :MI : MVP
   */
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  PLTS_T pLts_t = NULL;

#ifdef SEPARATE_PROCESSES
	kernel_share = (struct share_data *)malloc(sizeof(struct share_data));
#endif
  
#ifdef WIN32

  char szMainDict[MAX_STRING_LENGTH];
  char szUserDict[MAX_STRING_LENGTH];
  /* GL 09/25/1997 add szAbbrDict,nAdicload  to support abbr dictionary */
  char szAbbrDict[MAX_STRING_LENGTH];
  int nAdicLoad ;
  int nDicLoad ;


  if((pLts_t = (PLTS_T)malloc(sizeof(LTS_T)))== NULL)
	return(MMSYSERR_NOMEM);
  
  /* MVP :Associate LTS thread specific data handle to the current speech object*/
  phTTS->pLTSThreadData = pLts_t ;
  

   /* GL 09/25/1997 add szAbbrDict to support abbr dictionary */
  GetDictionaryNames( szMainDict, szUserDict, szAbbrDict );

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

  if(!gnInstanceCounter)
  {
#ifdef ENGLISH_US
		nDicLoad = load_dictionary( phTTS,
						&(pKsd_t->fdic[LANG_english]),
						&(pKsd_t->fdic_entries[LANG_english]),
						szMainDict,
						TRUE,
						TRUE );
//		nAdicLoad = load_dictionary( phTTS,
//						&(pKsd_t->adic[LANG_english]),
//						&(pKsd_t->adic_entries[LANG_english]),
//						szAbbrDict,
//						TRUE,
//						TRUE );
#endif
#ifdef ENGLISH_UK
		nDicLoad = load_dictionary( phTTS,
						&(pKsd_t->fdic[LANG_british]),
						&(pKsd_t->fdic_entries[LANG_british]),
						szMainDict,
						TRUE,
						TRUE );
//		nAdicLoad = load_dictionary( phTTS,
//						&(pKsd_t->adic[LANG_british]),
//						&(pKsd_t->adic_entries[LANG_british]),
//						szAbbrDict,
//						TRUE,
//						TRUE );
#endif
#ifdef SPANISH
		nDicLoad = load_dictionary( phTTS,
						&(pKsd_t->fdic[LANG_spanish]),
						&(pKsd_t->fdic_entries[LANG_spanish]),
						szMainDict,
						TRUE,
						TRUE );
//		nAdicLoad = load_dictionary( phTTS,
//						&(pKsd_t->adic[LANG_spanish]),
//						&(pKsd_t->adic_entries[LANG_spanish]),
//						szAbbrDict,
//						TRUE,
//						TRUE );
#endif
#ifdef GERMAN
		nDicLoad = load_dictionary( phTTS,
						&(pKsd_t->fdic[LANG_german]),
						&(pKsd_t->fdic_entries[LANG_german]),
						szMainDict,
						TRUE,
						TRUE );
//		nAdicLoad = load_dictionary( phTTS,
//						&(pKsd_t->adic[LANG_german]),
//						&(pKsd_t->adic_entries[LANG_german]),
//						szAbbrDict,
//						TRUE,
//						TRUE );
#endif
#ifdef FRENCH
		nDicLoad = load_dictionary( phTTS,
						&(pKsd_t->fdic[LANG_french]),
						&(pKsd_t->fdic_entries[LANG_french]),
						szMainDict,
						TRUE,
						TRUE );
//		nAdicLoad = load_dictionary( phTTS,
//						&(pKsd_t->adic[LANG_french]),
//						&(pKsd_t->adic_entries[LANG_french]),
//						szAbbrDict,
//						TRUE,
//						TRUE );
#endif

		/*MVP : On the following errors notify TextToSpeechStartup by 
			returning the error.
		*/
		if(nDicLoad == MMSYSERR_INVALPARAM || nDicLoad == MMSYSERR_NOMEM ||
 			nDicLoad == MMSYSERR_ERROR)
		{
#ifdef DEBUG
			MessageBox(NULL,szMainDict,"Error loading dictionary", MB_ICONSTOP | MB_OK);
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
#ifdef ENGLISH_US		
		gpufdic = pKsd_t->fdic[LANG_english];
		gufdic_entries = pKsd_t->fdic_entries[LANG_english];
#endif
#ifdef ENGLISH_UK		
		gpufdic = pKsd_t->fdic[LANG_british];
		gufdic_entries = pKsd_t->fdic_entries[LANG_british];
#endif
#ifdef SPANISH
		gpufdic = pKsd_t->fdic[LANG_spanish];
		gufdic_entries = pKsd_t->fdic_entries[LANG_spanish];
#endif
#ifdef GERMAN
		gpufdic = pKsd_t->fdic[LANG_german];
		gufdic_entries = pKsd_t->fdic_entries[LANG_german];
#endif
#ifdef FRENCH
		gpufdic = pKsd_t->fdic[LANG_french];
		gufdic_entries = pKsd_t->fdic_entries[LANG_french];
#endif

  }
  else
  {
/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
#ifdef ENGLISH_US
		pKsd_t->fdic[LANG_english] = gpufdic;
		pKsd_t->fdic_entries[LANG_english] = gufdic_entries;
#endif
#ifdef ENGLISH_UK
		pKsd_t->fdic[LANG_british] = gpufdic;
		pKsd_t->fdic_entries[LANG_british] = gufdic_entries;
#endif
#ifdef SPANISH
		pKsd_t->fdic[LANG_spanish] = gpufdic;
		pKsd_t->fdic_entries[LANG_spanish] = gufdic_entries;
#endif
#ifdef GERMAN
		pKsd_t->fdic[LANG_german] = gpufdic;
		pKsd_t->fdic_entries[LANG_german] = gufdic_entries;
#endif
#ifdef FRENCH
		pKsd_t->fdic[LANG_french] = gpufdic;
		pKsd_t->fdic_entries[LANG_french] = gufdic_entries;
#endif

  }

/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
#ifdef ENGLISH_US  
  nDicLoad = load_dictionary( phTTS,
				  &(pKsd_t->udic[LANG_english]),
				  &(pKsd_t->udic_entries[LANG_english]),
				  szUserDict,
				  FALSE,
				  TRUE );
#endif
#ifdef ENGLISH_UK  
  nDicLoad = load_dictionary( phTTS,
				  &(pKsd_t->udic[LANG_british]),
				  &(pKsd_t->udic_entries[LANG_british]),
				  szUserDict,
				  FALSE,
				  TRUE );
#endif
#ifdef SPANISH
nDicLoad = load_dictionary( phTTS,
				  &(pKsd_t->udic[LANG_spanish]),
				  &(pKsd_t->udic_entries[LANG_spanish]),
				  szUserDict,
				  FALSE,
				  TRUE );
#endif
#ifdef GERMAN
nDicLoad = load_dictionary( phTTS,
				  &(pKsd_t->udic[LANG_german]),
				  &(pKsd_t->udic_entries[LANG_german]),
				  szUserDict,
				  FALSE,
				  TRUE );
#endif
#ifdef FRENCH
nDicLoad = load_dictionary( phTTS,
				  &(pKsd_t->udic[LANG_french]),
				  &(pKsd_t->udic_entries[LANG_french]),
				  szUserDict,
				  FALSE,
				  TRUE );
#endif


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

  SetEvent(phTTS->hMallocSuccessEvent);  /*MVP :Set the malloc success,load dictionary success event */
  
#endif /* #ifdef WIN32 */

#ifdef __osf__
  char    homedir[258];
  char    filename[275];
  int nDicLoad ;

  /* Initialize thread error field to no error */
  phTTS->uiThreadError = MMSYSERR_NOERROR;

  if((pLts_t = (PLTS_T)calloc(1,sizeof(LTS_T)))== NULL)
	phTTS->uiThreadError = MMSYSERR_NOMEM;
  else 
  {
    /* MVP :Associate LTS thread specific data handle to the 
          current speech object */
    phTTS->pLTSThreadData = pLts_t ;

/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
/*               comment out the abbr dictionary section for now */
#ifdef ENGLISH_US
#ifdef __linux__
    nDicLoad = load_dictionary( (void **)&(pKsd_t->fdic[LANG_english]),
#else
    nDicLoad = load_dictionary( &(pKsd_t->fdic[LANG_english]),
#endif
		   &(pKsd_t->fdic_entries[LANG_english]),
		   "/usr/lib/dtk/dtalk_us.dic",
		   TRUE );
//    nAdicLoad = load_dictionary( &(pKsd_t->adic[LANG_english]),
//		   &(pKsd_t->adic_entries[LANG_english]),
//		   "/usr/lib/dtk/abbr_us.dic",
//		   TRUE );
#endif
#ifdef ENGLISH_UK
    nDicLoad = load_dictionary( &(pKsd_t->fdic[LANG_british]),
		   &(pKsd_t->fdic_entries[LANG_british]),
		   "/usr/lib/dtk/dtalk_uk.dic",
		   TRUE );
//    nAdicLoad = load_dictionary( &(pKsd_t->adic[LANG_british]),
//		   &(pKsd_t->adic_entries[LANG_british]),
//		   "/usr/lib/dtk/abbr_uk.dic",
//		   TRUE );
#endif
#ifdef SPANISH
    nDicLoad = load_dictionary( &(pKsd_t->fdic[LANG_spanish]),
		   &(pKsd_t->fdic_entries[LANG_spanish]),
		   "/usr/lib/dtk/dtalk_sp.dic",
		   TRUE );
//    nAdicLoad = load_dictionary( &(pKsd_t->adic[LANG_spanish]),
//		   &(pKsd_t->adic_entries[LANG_spanish]),
//		   "/usr/lib/dtk/abbr_sp.dic",
//		   TRUE );
#endif
#ifdef GERMAN
    nDicLoad = load_dictionary( &(pKsd_t->fdic[LANG_german]),
		   &(pKsd_t->fdic_entries[LANG_german]),
		   "/usr/lib/dtk/dtalk_gr.dic",
		   TRUE );
//    nAdicLoad = load_dictionary( &(pKsd_t->adic[LANG_german]),
//		   &(pKsd_t->adic_entries[LANG_german]),
//		   "/usr/lib/dtk/abbr_gr.dic",
//		   TRUE );
#endif
#ifdef FRENCH
    nDicLoad = load_dictionary( &(pKsd_t->fdic[LANG_french]),
		   &(pKsd_t->fdic_entries[LANG_french]),
		   "/usr/lib/dtk/dtalk_fr.dic",
		   TRUE );
//    nAdicLoad = load_dictionary( &(pKsd_t->adic[LANG_french]),
//		   &(pKsd_t->adic_entries[LANG_french]),
//		   "/usr/lib/dtk/abbr_fr.dic",
//		   TRUE );
#endif

    if( nDicLoad == MMSYSERR_INVALPARAM || nDicLoad == MMSYSERR_NOMEM ||
	nDicLoad == MMSYSERR_ERROR)
    {
      fprintf(stderr,"DECtalk cannot run without the dictionary file %s\n",
				  "/usr/lib/dtk/dtalk_<lag>.dic");
      phTTS->uiThreadError = nDicLoad;
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
    if (phTTS->uiThreadError == MMSYSERR_NOERROR)
    {
      char *szHome = getenv("HOME");

      /*
       * Make sure we have a valid HOME environment set.
       */
      if( szHome != NULL )
      {
        sprintf(filename, "%s/user.dic", szHome);
/* GL 09/25/1997 use the array for dictionary entry structure */
/*               also add UK_english support */
#ifdef ENGLISH_US
#ifdef __linux__
        load_dictionary( (void **) &(pKsd_t->udic[LANG_english]),
#else
        load_dictionary( &(pKsd_t->udic[LANG_english]),
#endif
        		   &(pKsd_t->udic_entries[LANG_english]),
        		   filename,
        		   FALSE );
#endif
#ifdef ENGLISH_UK
        load_dictionary( &(pKsd_t->udic[LANG_british]),
        		   &(pKsd_t->udic_entries[LANG_british]),
        		   filename,
        		   FALSE );
#endif
#ifdef SPANISH
        load_dictionary( &(pKsd_t->udic[LANG_spanish]),
        		   &(pKsd_t->udic_entries[LANG_spanish]),
        		   filename,
        		   FALSE );
#endif
#ifdef GERMAN
        load_dictionary( &(pKsd_t->udic[LANG_german]),
        		   &(pKsd_t->udic_entries[LANG_german]),
        		   filename,
        		   FALSE );
#endif
#ifdef FRENCH
        load_dictionary( &(pKsd_t->udic[LANG_french]),
        		   &(pKsd_t->udic_entries[LANG_french]),
        		   filename,
        		   FALSE );
#endif
      }
    }
  }

  /* 
   * CP: Set the event, even if malloc eerror occurred. User
   * will look at uiThreadError for actual error code.
   */
  OP_SetEvent(phTTS->hMallocSuccessEvent);
  if (phTTS->uiThreadError != MMSYSERR_NOERROR)
  {
    OP_ExitThread(phTTS->uiThreadError);
    OP_THREAD_RETURN;
  }

#endif /* #ifdef __osf__ */


ls_util_lts_init (pLts_t, pKsd_t); 


/* JDB: language dependent... */
#ifdef ENGLISH_US
#ifdef ACNA
  	lsa_util_init_lang();
#endif
	default_lang(pKsd_t,LANG_english,LANG_lts_ready);  
#endif
/* GL 09/25/1997 add UK_english support */
#ifdef ENGLISH_UK
#ifdef ACNA
  	lsa_util_init_lang();
#endif
	default_lang(pKsd_t,LANG_british,LANG_lts_ready);  
#endif

#ifdef SPANISH
    default_lang(pKsd_t,LANG_spanish,LANG_lts_ready);
#endif

#ifdef GERMAN
   default_lang(pKsd_t,LANG_german,LANG_lts_ready);
#endif

#ifdef FRENCH
   default_lang(pKsd_t,LANG_french,LANG_lts_ready);
#endif
	
	ls_task_main(phTTS);
	/* Free here thread specific data structure MVP */
	if(pLts_t)
		free(pLts_t);
	phTTS->pLTSThreadData = pLts_t = NULL;
}       

/*extern int fc_index; */    /*MVP MI */

#ifdef WIN32


#ifndef UNDER_CE
// tek 25feb98 handy routine to see if a file is accessible..
#include <io.h>
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
// handy routine to look on the path
BOOL FindFileOnPath(char *szResultString, char *szFileName)
{
	// find szFileName on PATH; return TRUE if successful.
	// WARNING: make sure the destination string is big enough!!
	_searchenv(szFileName, "PATH", szResultString);
	if (  (strlen(szResultString) != 0)
		&&(IsFileAccessible(szResultString)) )
	{
		return (TRUE);
	}
	else
	{
		return (FALSE);
	}
}
// handy routine to look in the "current directory"
#include <direct.h>
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

	// correct for the possible missing '\' at the end of the path
	iStringLength = strlen(szTempBuf);
	if (iStringLength == 0)
	{
		// oops, error?
		return (FALSE);
	}
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
/*         This function gets the main dictionary name and user       */
/*    dictionary name from the registry.                              */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    szMainDict     A pointer to a string that will contain the      */
/*                   name provided during installation.               */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*    szUserDict     A pointer to a string that will contain the      */
/*                   company name provided during installation.       */
/*                   The returned value will be NULL terminated.      */
/*                                                                    */
/*                                                                    */
/*      Arguments: 	char * szMainDict                                 */
/*					char * szUserDict                                 */
/*                                                                    */
/*      Return Value: void                                            */
/*                                                                    */
/*      Comments:                                                     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

#if 0
Moved definition to coop.h -- ncs 04/17/1997

LPSTR szLocalMachineDECtalk (dectalk.dic)
LPSTR szCurrentUsersDECtalk (user.dic)

  "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\x.x0";

/* dictionary name area.  GL 12/12/1996 */
/* use the next block of code for final installation code */
LPSTR szMainDictDef = "DECTALK.DIC";
LPSTR szUserDictDef = "USER.DIC"; 

#endif // 0


/*
 *      Function Name: GetDictionaryNames()      
 */
static void GetDictionaryNames( char * szMainDict,
				char * szUserDict, char * szAbbrDict )
{
  HKEY hKey;
  DWORD dwType;
  DWORD cbData;

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
#endif // UNDER_CE
  LPTSTR cmd_line = GetCommandLine();
  char new_cmd_line[512];
#ifndef UNDER_CE
  char temp[20], szDefUserDic[256]="user.dic";// tek 25feb98 we'll need this default later..
#else
  char temp[20];
#endif // UNDER_CE
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
#ifdef _DEBUG
		OutputDebugString("Failed to find MAIN dictionary\n");
#endif //_DEBUG
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
#ifdef _DEBUG
		OutputDebugString("Failed to find USER dictionary\n");
#endif //_DEBUG
	}

	// if we're in debug, print the results..
#ifdef _DEBUG
	{
		char szTemp[_MAX_PATH*3]="";
		sprintf(szTemp, "Main dictionary at %s\n",szMainDict);
		OutputDebugString(szTemp);
		sprintf(szTemp, "User dictionary at %s\n",szUserDict);
		OutputDebugString(szTemp);
	}
#endif //_DEBUG
#endif // UNDER_CE

	return;
#endif


  /********************************************************************/
  /*  Get the user dictionary.                                        */
  /********************************************************************/

  if ( RegOpenKeyEx( HKEY_CURRENT_USER,
			 szCurrentUsersDECtalk,
			 0,
			 KEY_QUERY_VALUE,
			 &hKey ) != ERROR_SUCCESS )
  {
	strcpy( szUserDict, szUserDictDef );
  }
  else
  {
	cbData = MAX_STRING_LENGTH;

	if ( RegQueryValueEx( hKey,
			  "UserDict",
			  NULL,
			  &dwType,
			  (LPBYTE)szUserDict,
			  &cbData ) != ERROR_SUCCESS )
	{
	  strcpy( szUserDict, szUserDictDef );
	}

	RegCloseKey( hKey );
  }

  /********************************************************************/
  /*  Get the main and abbreviation dictionary.                                        */
  /********************************************************************/
  if(!gnInstanceCounter)
  {
                /* GL 09/25/1997 add abbreviation dictionary support */
		/*               will need modify the installation to create the*/
	    /*               registry entry, comment out for now */
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
#endif
		if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
			szLocalMachineDECtalk,
			0,
			KEY_QUERY_VALUE,
			&hKey ) != ERROR_SUCCESS )
		{
#ifdef WIN32
#ifndef UNDER_CE
			// tek 14may98 log the fact that we are using the default dictionary name
			FILE *fpDicLogFile = NULL;
			fpDicLogFile = fopen("\\dtdic.log","a+"); // open for append, handle EOF
			if (fpDicLogFile)
			{
				char szDateBuf[64];
				char szTimeBuf[64];
				// log the pertinent info
				_strdate(szDateBuf);
				_strtime(szTimeBuf);
				fprintf(fpDicLogFile,"%s %s : Dictionary key %s not found; using default name\n",
					szDateBuf, szTimeBuf, szLocalMachineDECtalk);
				fflush(fpDicLogFile);
				fclose(fpDicLogFile);
			}
#endif //UNDER_CE
#endif //WIN32
			strcpy( szMainDict, szMainDictDef );
		}
		else
		{
			cbData = MAX_STRING_LENGTH;
			
			if ( RegQueryValueEx( hKey,
				"MainDict",
				NULL,
				&dwType,
				(LPBYTE)szMainDict,
				&cbData ) != ERROR_SUCCESS )
			{
#ifdef WIN32
#ifndef UNDER_CE
				// tek 14may98 log the fact that we are using the default dictionary name
				FILE *fpDicLogFile = NULL;
				fpDicLogFile = fopen("\\dtdic.log","a+"); // open for append, handle EOF
				if (fpDicLogFile)
				{
					char szDateBuf[64];
					char szTimeBuf[64];
					// log the pertinent info
					_strdate(szDateBuf);
					_strtime(szTimeBuf);
					fprintf(fpDicLogFile,"%s %s : Dictionary key %s not found; using default name\n",
						szDateBuf, szTimeBuf, "MainDict");
					fflush(fpDicLogFile);
					fclose(fpDicLogFile);
				}
#endif //UNDER_CE
#endif //WIN32
				strcpy( szMainDict, szMainDictDef );
			}
			
			RegCloseKey( hKey );
		}
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

int LTSLibMain( HANDLE hInst,
			  DWORD ul_reason_being_called,
			  LPVOID lpReserved )
{


	// Initialize the C run-time before calling any of your code.
	if( ul_reason_being_called == DLL_PROCESS_ATTACH ||
		ul_reason_being_called == DLL_THREAD_ATTACH )
	{
#if 0 // This section of code breaks durning build. ie. This won't compile.
      // Could the BOOL line above the LibMain function also be a problem?
		if( !_CRT_INIT( hInst, ul_reason_being_called, lpReserved ) )
			return( FALSE );
#endif // Broken code.
	}

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
	  /*
	  /* does licensing happen here? tek 23jan97 */

	break;

	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	case DLL_PROCESS_DETACH :
#if 0 // tek 27may98 this should never happen.
		/* drop the reference count.. */
		gnInstanceCounter--;
		if (gnInstanceCounter == 0)
		{
			/* unload dictionaries.. */
			if ( gufdic_entries != 0 )
			{
				unload_dictionary((void **)&(gpufdic),
				(unsigned int *)&(gufdic_entries));
				gpufdic = NULL;
				gufdic_entries = 0;
			}
		   /* WARNING WARNING we can't unload user dics here, because we */
		   /* can't see the pksd_t.. so the caller nees to deal with that! */
		   /*if ( pKsd_t->udic_entries != 0 )
			  {
				unload_dictionary((void **)&pKsd_t->udic,
						  (unsigned int *)&pKsd_t->udic_entries );
			  }
		   */
		}

//#ifdef LICENSES
//              ReleaseLicenseRef();
//#endif
#endif //0
		break;
	}

	return(TRUE);
//  return( 1 );
//  UNREFERENCED_PARAMETER( hInst );
//  UNREFERENCED_PARAMETER( ul_reason_being_called );
//  UNREFERENCED_PARAMETER( lpReserved );
}
#endif

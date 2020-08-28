 /*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved. 
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:        cm_copt.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------  
 * 0001 sik		03/21/1996		Merged from old source files:
 *								cmd_cmd.c
 *								cmd_err.c 
 *								cmd_lts.c
 *								cmd_ph.c
 * 0002 sik     03/22/1996      RE-structured to new code format and merged with the win95 code.
 * 0003 gl      04/03/1996      handle cmd_number same as cmd_count to fix setv command problem.
 * 0004 gl      04/04/1996      add cm_cmd_debug() for new debug command
 * 0005 MGS     04/24/1996      changed cmd_sync to cm_cmd_sync
 *   	                        added ifdef's for MSDOS stuff left in error
 * 0006	MGS		06/13/1996		Put back the old phomeme mode and made timeout an instance variable.
 * 0007 SIK		07/08/1996		Cleaning up and maintenance
 * 0008 GL      07/31/1996      Add code to handle getc() for WIN95 in loadv() function.
 * 0009 GL      08/05/1996      Add pKsd_t for WIN95 in loadv() function.
 * 0010 GL		08/06/1996		use Sleep(100) for WIN95 
 * 0011	MGS		08/07/1996		Added new_indexing stuff
 * 0012 GL		09/04/1996		Add SKIP_all flag.  And also insert one space before
 *								index mark for parser.
 *								change send_index handling.
 * 0013 SIK		09/09/1996		Added return statement in cm_cmd_define().
 * 0014 GL		12/25/1996		increment index_counter for index command
 * 0015 GL		12/29/1996		Add [:mode table on/off] option
 * 0016 GL		10/30/1996		merge the change from V43 code base.
 * 0017	GL		11/25/1996		add language switch to support dual language DTEX
 * 0018 GL		11/27/1996	    pass mode argument while calling say_string() function
 * 0019 GL		12/04/1996		implement [:skip cpg] to skip code page translation.
 * 0020	GL		12/05/1996		remove the language pipe hack for DTEX
 * 0021 GL		12/11/1996		change the way WIN32 handle cmd_remove()
 * 0022 GL		01/28/1997		force SYNC for mode command
 * 0023 GL		02/04/1997		add MODE_EMAIL mode switch
 * 0024 GL		02/06/1997		add SKIP_email mode switch
 * 0025 GL      03/27/1997		for BATS#317
 *                              add "us" option for [:lang] command
 * 0026	GL		04/21/1997	    BATS#357  Add the code for __osf__ build 
 *                              also clean out the wrong switch setting
 * 0027	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 0028 NS		05/02/1997		Removed form-feed characters.  Needed for stripper
 *								to work properly.
 * 0029 GL		10/22/1997      remove some code for NWS build to cut down the image size
 *                              code removed from cm_cmd_language()
 *                                                cm_cmd_remove()
 *                                                cm_cmd_plang()
 *                                                cm_cmd_latin()
 *                                                cm_cmd_gender()
 *                              need to restore these code if NWS need other language.
 * 0030 tek     13nov97         BATS404: new index types (was 01aug97)
 * 0031 cjl     18nov97         Add ifdef for 32bit only index types.
 * 0032	gl		03/25/1998		Added DBGV command for debug variable passing
 * 0033	mfg		3/30/98			BATS#638 set insertflag equalto 2 on VOCAL build
 * 0034	mfg		04/28/98		added [:log dbglog (on/off)] command for logging into dbglog.txt 
 * 0035	mfg		06/29/98		added LANG_latin_american and LANG_british conditional feedback
 * 0036	gl		07/29/98		BATS#728 remove NWSNOAA conditional switch
 * 0037 ETT     05oct98         added linux code
 * 0038 mfg		10/15/98		modified cm_cmd_dial() to work for Windows CE
 * 0039 ETT		11/04/98		for BATS#345 change OpenLogFile and CloseLogFile from static 
 *								so we can use them in cm_cmd.c for [:error text] command.
 * 0040	gl		12/02/1998		BATS#751 add more language support for [:lang] command 
 * 0041	GL		12/17/1998		BATS#846 add say_fletter mode to skip control character 
 * 0042	MGS		10/14/1999		BATS#876 fix for UK phone numbers (part of it) 
 * 0043	EAB		10/28/99		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 * 0044	MGS		04/13/2000		Changes for integrated phoneme set 
 * 0045	MGS		07/14/2000		Sapi 5 additions
 * 0046 NAL		07/14/2000		Added additional :pron flags for homographs
 * 0047	MGS		07/26/2000		Realtime rate
 * 0048 CHJ     07/20/2000      French Added
 * 0049 CAB		08/04/2000		Removed () from _flushall() for CEdll. 
 * 0050	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 * 0051	MFG		10/10/2000		include cemm.h for windows CE build		
 * 0052 CAB		10/16/2000		Changed copyright info
 * 0053	MFG		02/27/2001		Fixed flushalll to build under all Win CE enviorments
 * 0054	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 0055 CAB		05/14/2001		Updated copyright info
 * 0056	MFG		05/29/2001		Included dectalkf.h
 * 0057	MGS		06/19/2001		Solaris Port BATS#972
 * 0059	MGS		03/20/2002		Single threaded vtm
 * 0060	MGS		03/21/2002		Single threaded ph
 * 0061	MGS		04/03/2002		Single threaded lts
 * 0062	MGS		04/11/2002		ARM7 port
 * 0063	CAB		05/01/2002		Updated copyright info
 * 0064	CAB		05/01/2002		Removed warnings by typecast
 * 0065	CAB		07/30/2002		Condense repeated code for __osf__
 * 0016	MFG		07/16/2003		added Period Pause limits for bug BTS#10100
 ************************************************************************************************/
  
#include "dectalkf.h"
#include "cm_def.h"
#include "cm_cdef.h"
#include "cm_copt.h"

#ifdef UNDER_CE
#include "cemm.h"
#endif

/* GL 04/21/1997  change this for OSF build */
#ifdef DTEX
#include "version.h"
#endif

/* pick up the definition of MAXI_PHONES and COMMA */
#include "l_com_ph.h"

#ifdef MSDOS
#include "hardw.h"
#ifdef SW_VOLUME
void vol_tone(int volume);
#endif
#endif // MSDOS

extern short tlitone0[];    /* added 4/22/96 MGS */
extern short tlitone1[];

#ifdef WIN32
#include <windows.h>
#include "tts.h"
#endif

/* GL 04/21/1997  change this for OSF build */
#ifdef __osf__
#include <opthread.h>
#include  "tts.h"
#endif //__osf__

#ifdef ARM7
#include "stdlib.h"
#include "string.h"
void default_lang(PKSD_T pKsd_t, unsigned int lang_code, unsigned int ready_code );
void send_index( int how, int value );
#endif

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#ifdef __cplusplus
extern "C" { 
#endif //__cplusplus
#include <ctype.h>
#include <opthread.h>
#include <stdlib.h>
#include "tts.h"
void wait_semaphore( P_SEMAPHORE ); 
#ifdef __cplusplus
}
#endif //__cplusplus
#else
extern void wait_semaphore( P_SEMAPHORE ); 
#endif //__linux__ || defined VXWORKS || defined _SPARC_SOLARIS_


#ifndef MSDOS

#ifndef ARM7
void TextToSpeechErrorHandler( LPTTS_HANDLE_T, UINT, MMRESULT );
#endif

/* ETT 11/04/98 for BATS#345 
	change open and close from static  */
int OpenLogFile(LPTTS_HANDLE_T phTTS);

void CloseLogFile(LPTTS_HANDLE_T phTTS);

static int OpenDbgLogFile(LPTTS_HANDLE_T phTTS);

static void CloseDbgLogFile(LPTTS_HANDLE_T phTTS);

#endif // MSDOS

#ifdef SAPI5DECTALK
extern int GetSapiRealtimeRate(LPTTS_HANDLE_T phTTS);
#endif

/* ******************************************************************
 *      Function Name: cm_cmd_phoneme()
 *
 *      Description: Searches through parameters given to the phoneme
 *      command stored in pCmd_t->pString[]
 *      and looks for ASKY, ARPABET, ON, OFF, SPEAK
 *      or SILENT. Uses constants PHONEME_ASCKY,
 *      PHONEME_SPEAK and PHONEME_OFF to modify the bits in
 *      flag pKsd_t->phoneme_mode.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech Handle
 *
 *      Return Value: int:
 *					  CMD_bad_string
 *					  CMD_bad_param
 *					  CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_phoneme(LPTTS_HANDLE_T phTTS)
{
	int value, i;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	PKSD_T pKsd_t = phTTS->pKernelShareData;	
	for(i=0; i < (int)(pCmd_t->param_index); i++)
	{
		value = cm_util_string_match(phoneme_modes,pCmd_t->pString[i]);
		if(value == NO_STRING_MATCH)
		{
			return(CMD_bad_string);
		}
		switch(value)
		{         
			case 0:
				pKsd_t->phoneme_mode |= PHONEME_ASCKY; break;   /* ascky */
				break;
			case 1: 
				pKsd_t->phoneme_mode &= (~PHONEME_ASCKY); break;/* arpa */
				break;
			case 2:       
				pKsd_t->phoneme_mode |= PHONEME_SPEAK; break;   /* speak */ 
				break;
			case 3:       
				pKsd_t->phoneme_mode &= (~PHONEME_SPEAK); break;/* silent */
				break;
			case 4:       
				pKsd_t->phoneme_mode |= PHONEME_OFF; break;     /* off */
				break;
			case 5:       
				pKsd_t->phoneme_mode &= (~PHONEME_OFF); break;  /* on */
				break;
			default:
				return(CMD_bad_param);    
		}  /* Matches switch(value) */
	} /* Matches for(i=0; i < (int)param_index; i++) */
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_log()     
 *
 *      Description: Searches through parameters given to the
 *      log command stored in pCmd_t->pString[]
 *      and looks for TEXT, FORMS, PHONEME, TYPES, SYLLABLES, OUTPHON followed by ON, OFF or SET. 
 *      Uses constants LOG_TEXT, LOG_PHONEMES, LOG_NAME_TYPES,
 *      LOG_FORM_TYPES, LOG_SYLLABLES, LOG_OUTPHON
 *      to set bits in flag_mask which is used to modify
 *      the bits in flag pKsd_t->logflag.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *      Return Value: int:
 *						CMD_bad_string
 *						CMD_bad_param
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_log(LPTTS_HANDLE_T phTTS)
{
	int i, value;

#ifdef DEBUGPARS
	int	p, q;
#endif
	unsigned int flag_mask;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
#ifndef MSDOS
	if(cm_cmd_sync(phTTS) == CMD_flushing)
	  return(CMD_flushing);
#endif
	
	flag_mask = 0;
	for(i=0; i < (int)pCmd_t->param_index; i++)
	{
		/*
		 * 3/6/96 SIK This command only takes 2 parameters:  TEXT, FORMS, PHONEME, TYPES, SYLLABLES, 
		 * OUTPHON followed by ON
		 * OFF or SET
		 */
#ifdef DEBUGPARS
		for (p=0;log_options[p];p++)
		{
			putc('l');
			putc('o');
			putc('g');
			putc('=');
			for (q=0;log_options[p][q];q++)
			{
				putc(log_options[p][q]);
			}
			putc('\n');
			putc('\r');
		}
#endif
			     
		value = cm_util_string_match(log_options,pCmd_t->pString[i]);
		if(value == NO_STRING_MATCH)
		{
			return(CMD_bad_string);
		}
		switch(i)
		{
			case 0: /* First parameter */
				switch(value)
				{
					case 0:                               /* text */
						flag_mask |= LOG_TEXT;
						break;
					case 1:                               /* phoneme */
						flag_mask |= LOG_PHONEMES;
						break;
					case 2:                               /* name types */
						flag_mask |= LOG_NAME_TYPES;
						break;
					case 3:                               /* word form classes */
						flag_mask |= LOG_FORM_TYPES;
						break;
					case 4:                               /* word syllable structure */
						flag_mask |= LOG_SYLLABLES;
						break;
					case 5:                               /* word outphon structure */
						flag_mask |= LOG_OUTPHON;
				   		break;
					case 6:                               /* word dbglog structure */
						flag_mask |= LOG_DBGLOG;		  /*mfg*/
						break;
					default:
						return(CMD_bad_param);
				}
				break;
			case 1: /* Second parameter */
				switch(value)
				{ 
					case 7: /* on */

#ifndef MSDOS			
						if ((flag_mask | LOG_DBGLOG) == LOG_DBGLOG)
						{  						
							OpenDbgLogFile(phTTS);
							flag_mask = 0;
						}
						else
						{		
							if ( OpenLogFile(phTTS))
#endif
								pKsd_t->logflag |= flag_mask;
							flag_mask = 0;
#ifndef MSDOS
						}
#endif

						break;
					case 8:	/* off */

#ifdef MSDOS	
						pKsd_t->logflag &= (~flag_mask);
						flag_mask = 0;
#else

						if ((flag_mask | LOG_DBGLOG) == LOG_DBGLOG)
						{  						
							CloseDbgLogFile(phTTS);
							flag_mask = 0;
						}
						else
						{
							if ( pKsd_t->logflag & (~flag_mask))
							{
								pKsd_t->logflag &= (~flag_mask);
							}
							else
							{
								CloseLogFile(phTTS);
							}
							flag_mask = 0;
						}
#endif
						break;
					case 9:	/* set */
#ifndef MSDOS
						if ( OpenLogFile(phTTS))
#endif
								pKsd_t->logflag = flag_mask;
						flag_mask = 0;
						break;
					default:
						return(CMD_bad_param);
				}
				break;
			default:
				return(CMD_bad_param);
		}       /* switch(i) */
	} /* for(i=0; i < param_index; i++) */
	return(CMD_success);
}

#ifndef MSDOS
/* ******************************************************************
 *      Function Name: #ifndef MSDOS OpenDbgLogFile()
 *
 *      Description: Opens the dbglog.txt log file
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *      Return Value: int:
 *						TRUE
 *						FALSE
 *
 *      Comments:
 *
 * *****************************************************************/
static int OpenDbgLogFile(LPTTS_HANDLE_T phTTS)
{
#ifndef ARM7_NOSWI
	PKSD_T pKsd_t = phTTS->pKernelShareData;

	if ((pKsd_t->dbglog = fopen("dbglog.txt","w"))==NULL)
		return(FALSE);
#endif
	return( TRUE );

}

/* ******************************************************************
 *      Function Name: #ifndef MSDOS CloseDbgLogFile()
 *
 *      Description: Closes the dbglog.txt log file
 *
 *      Arguments: LPTTS_HANDLE_T phTTS
 *
 *      Return Value: void:
 *
 *      Comments:
 *
 * *****************************************************************/

static void CloseDbgLogFile(LPTTS_HANDLE_T phTTS)
{

#ifndef ARM7_NOSWI
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	
	if(pKsd_t->dbglog)
	{
	fclose((FILE *)pKsd_t->dbglog);
	}
#endif
}


/* ******************************************************************
 *      Function Name: #ifndef MSDOS OpenLogFile()
 *
 *      Description: Opens a log file
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *
 *      Return Value: int:
 *						TRUE
 *						FALSE
 *
 *      Comments:
 *			ETT: 11/04/98 for BATS#345
 *				change this from static so we can use it and close
 *				in cm_cmd.c to open and close log.txt for 
 *				[:error text] command.
 * *****************************************************************/

int OpenLogFile(LPTTS_HANDLE_T phTTS)
{
  /*
  LPTTS_HANDLE_T phTTS;                                 MVP MI 

  phTTS = TextToSpeechGetHandle();
  */
#ifndef ARM7
#ifdef WIN32
  EnterCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RESERVE );*/
  OP_LockMutex( phTTS->pcsLogFile );
#endif

  /********************************************************************/
  /*  If a file is already open, then don't try to open another one.  */
  /********************************************************************/

  if ( phTTS->dwOutputState == STATE_OUTPUT_LOG_FILE )
  {
#ifdef WIN32
	LeaveCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
    OP_UnlockMutex( phTTS->pcsLogFile );
#endif

	return( TRUE );
  }

  /********************************************************************/
  /*  If not in NULL output state or AUDIO Output state then return   */
  /*  an error.                                                       */
  /********************************************************************/

  if (( phTTS->dwOutputState != STATE_OUTPUT_AUDIO )
   && ( phTTS->dwOutputState != STATE_OUTPUT_NULL ))
  {
#ifdef WIN32
	LeaveCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
    OP_UnlockMutex( phTTS->pcsLogFile );
#endif

	return( FALSE );
  }

  /********************************************************************/
  /*  Open the log file.                                              */
  /********************************************************************/

  if (( phTTS->pLogFile = fopen( "log.txt", "w" )) == NULL )
  {
#ifdef WIN32
	LeaveCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
    OP_UnlockMutex( phTTS->pcsLogFile );
#endif

	TextToSpeechErrorHandler( phTTS,
				  ERROR_WRITING_FILE,
				  0L );
	return( FALSE );
  }
  else
  {
	cm_cmd_sync(phTTS);

	phTTS->dwOutputState = STATE_OUTPUT_LOG_FILE;
#ifdef WIN32
	LeaveCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
    OP_UnlockMutex( phTTS->pcsLogFile );
#endif

  }
#endif // ARM7
  return( TRUE );
}

/* ******************************************************************
 *      Function Name: #ifndef MSDOS CloseLogFile()   
 *
 *      Description: Closes a log file
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: void
 *
 *      Comments: 
 *			ETT: 11/04/98 for BATS#345
 *				change this from static so we can use it and open
 *				in cm_cmd.c to open and close log.txt for 
 *				[:error text] command.
 * *****************************************************************/
void CloseLogFile(LPTTS_HANDLE_T phTTS)
{
#ifndef ARM7
  PKSD_T pKsd_t = phTTS->pKernelShareData;
  /*
  LPTTS_HANDLE_T phTTS;                 MVP MI

  phTTS = TextToSpeechGetHandle();
  */

  /********************************************************************/
  /*  Wait for all data to complete before closing the log file.      */
  /********************************************************************/

  cm_cmd_sync(phTTS);

#ifdef WIN32
  EnterCriticalSection( phTTS->pcsLogFile );

#if (UNDER_CE == 211) || (UNDER_CE == 200)
	_flushall; 
#else
	_flushall();
#endif // (UNDER_CE == 211) || (UNDER_CE == 200)
#endif // WIN32

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RESERVE );*/
  OP_LockMutex( phTTS->pcsLogFile );
#endif

  /********************************************************************/
  /*  Exit if the log file is not open.                               */
  /********************************************************************/

  if ( phTTS->dwOutputState != STATE_OUTPUT_LOG_FILE )
  {
#ifdef WIN32
	LeaveCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
    OP_UnlockMutex( phTTS->pcsLogFile );
#endif

	return;
  }

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
  {
#ifdef WIN32
	LeaveCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
    OP_UnlockMutex( phTTS->pcsLogFile );
#endif

	TextToSpeechErrorHandler( phTTS,
				  ERROR_WRITING_FILE,
				  0L );
  }
  else
  {
	pKsd_t->logflag = 0;
#ifdef WIN32
	LeaveCriticalSection( phTTS->pcsLogFile );
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined __osf__ || defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*ToggleLogfileMutex( MUTEX_RELEASE );*/
    OP_UnlockMutex( phTTS->pcsLogFile );
#endif

  }
#endif // ARM7
  return;
}

#endif /* #ifndef MSDOS */

/* ******************************************************************
 *      Function Name: cm_cmd_break() 
 *
 *      Description: Function break() is used to instruct the ph code to generate a autopause at
 *      every wbound.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Pointer to structure containing PKSD_T
 *										and PCMD_T data structures.
 *				   						 
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * ******************************************************************/
int cm_cmd_break(LPTTS_HANDLE_T phTTS)
{
	int     i,value;
	unsigned int flag_mask;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	flag_mask = 0;
	for(i = 0; i < (int)pCmd_t->param_index; i++)
	{
		value = cm_util_string_match(log_options,pCmd_t->pString[i]);
		if(value == NO_STRING_MATCH)
			return(CMD_bad_string);
		switch(value)
		{
			case 0:/* on */
				pKsd_t->wbreak = TRUE;
				break;
			case 1:/* off */
				pKsd_t->wbreak = FALSE;
				break;
		}
	}
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_say()     
 *
 *      Description: Searches through parameters given to the
 *      say command stored in pCmd_t->pString[]
 *      and looks for CLAUSE, WORD, LETTER, LINE or SYLLABLE.
 *      Uses constants SAY_CLAUSE, SAY_WORD, SAY_LETTER,
 *      SAY_LINE and SAY_SYLLABLE to modify the bits in flag pKsd_t->sayflag.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Pointer to structure containing PKSD_T
 *										and PCMD_T data structures.
 *
 *      Return Value: int. Either CMD_bad_string, CMD_bad_param or CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_say(LPTTS_HANDLE_T phTTS)
{
	int     value; 
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	value = cm_util_string_match(say_options,pCmd_t->pString[0]);
	if(value == NO_STRING_MATCH)
		return(CMD_bad_string);
	switch(value)
	{
		case 0:	/* clause */
			pKsd_t->sayflag = SAY_CLAUSE;
			break;
		case 1:	/* word */
			pKsd_t->sayflag = SAY_WORD;
			break;
		case 2:	/* letter */
			if(cm_cmd_sync(phTTS) == CMD_flushing)
				return(CMD_flushing);
			pKsd_t->sayflag = SAY_LETTER;
			break;
		case 3:	/* fletter */
			if(cm_cmd_sync(phTTS) == CMD_flushing)
				return(CMD_flushing);
			pKsd_t->sayflag = SAY_FLETTER;
			break;
		case 4:	/* line */
			pKsd_t->sayflag = SAY_LINE;
			break;
		case 5:	/* syllables */
			pKsd_t->sayflag = SAY_SYLLABLE;
			break;
	}
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_error()
 *
 *      Description: Searches through parameters given to the error command stored in pCmd_t->pString[]
 *      and looks for IGNORE, TEXT, ESCAPE, SPEAK or TONE. Uses constants ERROR_ignore, ERROR_text, ERROR_escape, 
 *      ERROR_speak and ERROR_tone used to modify the bits in flag pKsd_t->error_mode.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Pointer to structure containing PKSD_T
 *										and PCMD_T data structures.
 *
 *      Return Value: int:
 *						CMD_bad_string
 *						CMD_bad_param
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_error(LPTTS_HANDLE_T phTTS)
{
	int     value;
	//PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	value = cm_util_string_match(error_options,pCmd_t->pString[0]);
	if(value == NO_STRING_MATCH)
		return(CMD_bad_string);
	switch(value)
	{
		case 0: /* ignore */
			pCmd_t->error_mode = ERROR_ignore;
			break;
		case 1: /* text */
			pCmd_t->error_mode = ERROR_text;
			break;
		case 2: /* escape */
			pCmd_t->error_mode = ERROR_escape;
			break;
		case 3: /* speak */
			pCmd_t->error_mode = ERROR_speak;
			break;
		case 4:	/* tone */
			pCmd_t->error_mode = ERROR_tone;
			break;
	}
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_pause()   
 *
 *      Description: Pauses for a time interval specified by pCmd_t->params[0]
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Pointer to structure containing PKSD_T
 *										and PCMD_T data structures.
 *
 *      Return Value: int. Either CMD_success or CMD_flushing
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_pause(LPTTS_HANDLE_T phTTS)
{
#ifndef ARM7
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
#ifdef MSDOS
	pKsd_t->pause = TRUE;
	STOP_SAMPCLK;
	if(pCmd_t->defaults[0] == FALSE)
	{
		sleep(pCmd_t->params[0]);
		pKsd_t->pause = FALSE;
		START_SAMPCLK;
	}
	return(CMD_success);
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
  /*LPTTS_HANDLE_T phTTS; */
  DWORD dwDelay;
#ifdef WIN32
  DWORD dwStartTime;
  DWORD dwElapsedTime;
  DWORD dwRemainingTime;
#endif // WIN32

/* GL 10/30/1996, comment out this as V43 code
  if( cm_cmd_sync(phTTS) == CMD_flushing )
	return(CMD_flushing);
*/
  dwDelay = (DWORD)(pCmd_t->params[0]);

  if ( dwDelay != 0 )
  {
	TextToSpeechPause( phTTS );

#ifdef WIN32
	dwStartTime = GetTickCount();

	while ((( dwElapsedTime = GetTickCount() - dwStartTime ) < dwDelay )
		&& ( ! pKsd_t->halting ))
	{
	  dwRemainingTime = dwDelay - dwElapsedTime;

	  if ( dwRemainingTime > 10 )
	  {
			Sleep( 10 );
	  }
	  else
	  {
			Sleep( dwRemainingTime );
	  }
	}
	TextToSpeechResume( phTTS );
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
    while ((dwDelay > 0) && ( ! pKsd_t->halting))
    {	if ( dwDelay > 10)
        {	OP_Sleep(10);
            dwDelay -= 10;
        }
        else
        {	OP_Sleep(dwDelay);
            dwDelay = 0;
        }
    }
    TextToSpeechResume( phTTS );
#endif
  }
  return(CMD_success);
#endif // defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#else // ARM7
  return(CMD_success);
#endif // ARM7
}

/* ******************************************************************
 *      Function Name: cm_cmd_resume()  
 *
 *      Description: Interrupts the pause command.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int:
 *						CMD_success
 *						CMD_flushing
 *
 *      Comments:          
 *
 * *****************************************************************/
int cm_cmd_resume(LPTTS_HANDLE_T phTTS)
{
#ifdef MSDOS
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	pKsd_t->pause = FALSE;
	START_SAMPCLK;
#endif

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
  if( cm_cmd_sync(phTTS) == CMD_flushing )
	return(CMD_flushing);

  TextToSpeechResume( phTTS );
#endif

  return(CMD_success);          
}

/* ******************************************************************
 *      Function Name: cm_cmd_flush()   
 *
 *      Description:
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int: 
 *						CMD_success
 *						CMD_bad_value
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_flush(LPTTS_HANDLE_T phTTS)
{   
#ifndef ARM7
#ifdef MSDOS
	unsigned short int old_flags;
#endif
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	if(pCmd_t->defaults[0] == TRUE || pCmd_t->defaults[1] == TRUE)
	{
#ifdef DTEX
		p_putc(XON);
#endif /* DTEX */
		return(CMD_success);
	}
	pCmd_t->params[0] = cm_util_string_match(flush_options, pCmd_t->pString[0]);
	if(pCmd_t->params[0] == NO_STRING_MATCH)
		return(CMD_bad_string);
	if(pCmd_t->params[0] >= (sizeof(flush_options)/2))
		return(CMD_bad_value);
	switch(pCmd_t->params[0])
	{
		case 0:	/* all */
			return(CMD_success);
			break;
		case 1:	/* until */
			pKsd_t->spc_flush_type = SPC_flush_until;
			pKsd_t->spc_flush_value = pCmd_t->params[1];
			pKsd_t->spc_flush = TRUE;
			break;
		case 2:/* mask */
			pKsd_t->spc_flush_type = SPC_flush_mask;
			pKsd_t->spc_flush_value = pCmd_t->params[1];
			pKsd_t->spc_flush = TRUE;
			break;
		case 3:	/* after */

#ifdef MSDOS                    
			old_flags = kernel_disable();
#endif
			if(pKsd_t->halting == FALSE)
			{
				pKsd_t->spc_flush_type = SPC_flush_after;
				pKsd_t->spc_flush_value = pCmd_t->params[1];
				pKsd_t->spc_flush = TRUE;
				pKsd_t->spc_sync.value = 0;
#ifdef MSDOS
				wait_semaphore(&pKsd_t->spc_sync);
#endif
			}
#ifdef MSDOS
			else
			{                    
				kernel_enable(old_flags);
			}
#endif
			start_flush(TRUE);
			break;
		case 4:	/* text */
			pKsd_t->spc_flush_type = SPC_flush_all;
			pKsd_t->spc_flush = TRUE;
			pKsd_t->text_flush = TRUE;
			break;
	}
#endif // ARM7
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_sync()    
 *
 *      Description: Sends a SYNCH down the pipe.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int:
 *						CMD_flushing
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_sync(LPTTS_HANDLE_T phTTS)
{   
	PKSD_T pKsd_t = phTTS->pKernelShareData;

#ifdef MSDOS
	DT_PIPE_T pipe_value;
	unsigned int old_flags;
	
#ifdef DTEX
	/* 
	 * pKsd_t->idleflag is used to tell when we've been quiescent long
	 * enough to fall asleep.. 
	 */
	pKsd_t->idleflag = 0;
#endif /* DTEX */ 

	old_flags = kernel_disable();
	if(pKsd_t->halting == FALSE)
	{
		pKsd_t->spc_sync.value = 0;
		pipe_value = (PFASCII<<PSFONT)+0xb;
                cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		pipe_value = SYNC;
                cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
		kernel_enable(old_flags);
		wait_semaphore(&(pKsd_t->spc_sync));
	}
	else
	{
		kernel_enable(old_flags);
	}                 

	
	if(pKsd_t->cmd_flush)
		return(CMD_flushing);
	return(CMD_success);
#endif /* #ifdef MSDOS */       

/* GL 04/21/1997  add this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
  DT_PIPE_T pipe_value;

/*  LPTTS_HANDLE_T phTTS; */    /* MVP MI earlier the value of phTTS used to get by
									TextToSpeechGetHandle()
								*/

  if(pKsd_t->halting == FALSE)
  {
	/*phTTS = TextToSpeechGetHandle();*/   /*MVP MI */

#ifdef WIN32
	  ResetEvent( phTTS->hSyncEvent );
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
    OP_ResetEvent( phTTS->hSyncEvent );
#endif

	pKsd_t->spc_sync.value = 0;
	pipe_value = (PFASCII<<PSFONT)+0xb;
#ifdef SINGLE_THREADED
	lts_loop(phTTS,&pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif

	pipe_value = SYNC;
#ifdef SINGLE_THREADED
	lts_loop(phTTS,&pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif

#ifdef WIN32
	WaitForSingleObject( phTTS->hSyncEvent, INFINITE );
#endif

/* GL 04/21/1997  add this for OSF build */
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
    OP_WaitForEvent( phTTS->hSyncEvent, OP_INFINITE );
#endif

  }

  if(pKsd_t->cmd_flush)
	return(CMD_flushing);

  return(CMD_success);

#endif // defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_ || defined ARM7
}

/* ******************************************************************
 *      Function Name: cm_cmd_enable()
 * 
 *      Description: Selective enable of the flush
 *
 *      Arguments: PKSD_T pKsd_t
 *
 *      Return Value: int 
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/

int cm_cmd_enable(PKSD_T pKsd_t)
{
#ifndef ARM7
	DT_PIPE_T pipe_value;
#ifdef MSDOS
	unsigned int old_flags; 
	old_flags = kernel_disable();
#endif
	if(pKsd_t->halting == FALSE)
	{
		pKsd_t->spc_sync.value = 0;
		pipe_value = (PFASCII<<PSFONT)+0xb;
#ifdef SINGLE_THREADED
		lts_loop(pKsd_t->phTTS,&pipe_value);
#else
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
		pipe_value = SYNC;
#ifdef SINGLE_THREADED
		lts_loop(pKsd_t->phTTS,&pipe_value);
#else
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif

#ifdef MSDOS
		kernel_enable(old_flags);
#endif

#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
		wait_semaphore(&pKsd_t->spc_sync);
#endif
	}
#ifdef MSDOS
	else
	{
		kernel_enable(old_flags);
	}
#endif
	pKsd_t->spc_flush = FALSE;
	pKsd_t->text_flush = FALSE;
	reset_spc();
#endif // ARM7
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_punct()   
 *
 *      Description: Sets punctuation pronunciation mode. Takes a single parameter stored in 
 *					 pCmd_t->pString[0] whici is either NONE, SOME, ALL or PASS. Sets 
 *					 pCmd_t->punct_mode to appropriate value.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int. Either CMD_bad_value or CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/

int cm_cmd_punct(LPTTS_HANDLE_T phTTS)
{
	int     value;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	value = cm_util_string_match(punct_options,pCmd_t->pString[0]);
	if(value == NO_STRING_MATCH)
		return(CMD_bad_string);
	switch(value)
    {
		case PUNCT_none:
			pCmd_t->punct_mode = PUNCT_none;
			break;
		case PUNCT_some:
			pCmd_t->punct_mode = PUNCT_some;
			break;
		case PUNCT_all:
			pCmd_t->punct_mode = PUNCT_all;
			break;
		case PUNCT_pass:
			pCmd_t->punct_mode = PUNCT_pass;
			break;
		default:
			return(CMD_bad_value);
			break;
	}         
		/* pCmd_t->punct_mode=value; duplicate code? cjl 26-sep-95 */
		return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_punct()   
 *
 *      Description: Sets punctuation pronunciation mode. Takes a single parameter stored in 
 *					 pCmd_t->pString[0] whici is either NONE, SOME, ALL or PASS. Sets 
 *					 pCmd_t->punct_mode to appropriate value.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int. Either CMD_bad_value or CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_skip(LPTTS_HANDLE_T phTTS)
{
	int     value;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	value = cm_util_string_match(skip_options,pCmd_t->pString[0]);
	if(value == NO_STRING_MATCH)
		return(CMD_bad_string);
	switch(value)
    {
		case SKIP_none:
			pCmd_t->skip_mode = SKIP_none;
			break;
		case SKIP_email:
			pCmd_t->skip_mode = SKIP_email;
			break;
		case SKIP_punct:
			pCmd_t->skip_mode = SKIP_punct;
			break;
		case SKIP_rule:
			pCmd_t->skip_mode = SKIP_rule;
			break;
		case SKIP_all:
			pCmd_t->skip_mode = SKIP_all;
			break;
		case SKIP_cpg:
			pCmd_t->skip_mode = SKIP_cpg;
			break;
		default:
			return(CMD_bad_value);
			break;
	}         

		return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_timeout() 
 *
 *      Description: Sets pCmd_t->timeout equal to the parameter stored in 
 *					 pCmd_t->params[0]. 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_timeout(LPTTS_HANDLE_T phTTS)
{   
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	if(pCmd_t->defaults[0] == TRUE)
		pCmd_t->params[0] = 0;

	pCmd_t->timeout = pCmd_t->params[0];
	pKsd_t->input_timeout = pCmd_t->timeout;
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_cpu_rate()        
 *
 *      Description: Calls module_clocks() passing the parameter, or 10 as the 
 *					 default value.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int. Either CMD_success or CMD_bad_value
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_cpu_rate(LPTTS_HANDLE_T phTTS)
{   
#ifdef MSDOS    
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	if(pCmd_t->defaults[0] == TRUE)
		pCmd_t->params[0] = 10;
	if(pCmd_t->params[0] <= 0 || pCmd_t->params[0] > 25)
		return(CMD_bad_value);
	module_clocks(pCmd_t->params[0]);
#endif
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_setv()    
 *
 *      Description: Executes command stored in the pCmd_t->setv[] array indexed
 *                   by pCmd_t->params[0].
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int. Either CMD_success or CMD_bad_value
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_setv(LPTTS_HANDLE_T phTTS)
{   
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
    //short cmd_number = pCmd_t->params[0]; /*MVP MI New*/
	
	if((pCmd_t->params[0]) < 0 || pCmd_t->params[0] > 9)
		return(CMD_bad_value);
	pCmd_t->cmd_count=0;
	pCmd_t->cmd_number = pCmd_t->params[0];
	/* 
     * Tells command parser that its time to process                   
	 * internally stored command string 
	 */
	// BATS#638 mfg 3/30/98 set insertflag equalto 2 on VOCAL build
#ifdef VOCAL
	pCmd_t->insertflag=2;
#else
	pCmd_t->insertflag=1;
#endif	

	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_loadv()   
 *
 *      Description: Stores a command in the pCmd_t->setv[] array.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int. Either CMD_bad_value or CMD_success.
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_loadv(LPTTS_HANDLE_T phTTS)
{   
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
#ifndef ARM7
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
   /* 
    *this will probably crash and burn if a flush happens 
	* in the middle.. (tek 1/3/96)
	*/
   unsigned char temp[60];
   int j=0;
   int flag=1;
   //short cmd_number = pCmd_t->params[0];  /* MVP MI new */
   
   if((pCmd_t->params[0]) < 0 || pCmd_t->params[0] > 9)
		return(CMD_bad_value);
   pCmd_t->cmd_count=0;
   pCmd_t->cmd_number = pCmd_t->params[0];
   while (flag) 
   {
/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS
          read_pipe(pKsd_t->cmd_pipe, &temp[j], 1);
#endif

#ifdef MSDOS
	  temp[j] = getc();
#endif
	  if (temp[j] == ']')
		flag = 0;
	  j++;
   }
   temp[j] = '\0';
   strcpy(pCmd_t->setv[pCmd_t->cmd_number].cmd,temp); 
   return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_code_page()
 *
 *      Description: Loads new code page
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int:
 *						CMD_bad_value
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_code_page(LPTTS_HANDLE_T phTTS)
{   
#ifdef MSDOS    
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	volatile struct dtpc_code_pages _far *cp;
	int i;

	if(pCmd_t->defaults[0] == TRUE || pCmd_t->params[0] == 0)
	{
		for(i=0;i<256;i++)
			pKsd_t->code_page[i] = i;
		return(CMD_success);
	}

	cp = pKsd_t->loaded_code_pages;
	while(cp != NULL_CP)
	{
		if((*cp).dos_id == (int)pCmd_t->params[0])
		{
			for(i=0;i<256;i++)
				pKsd_t->code_page[i] = (*cp).translation_page[i];
			return(CMD_success);
		}
		cp = (*cp).link;
	}
#endif /* MSDOS */              
	return(CMD_bad_value);
}

/* ******************************************************************
 *      Function Name: cm_cmd_vs() 
 *
 *      Description: cmd_vs implements the short form of the volume command that is no longer
 *  				 always unique but happened to work before.
 *
 *      Arguments:  LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_vs(LPTTS_HANDLE_T phTTS)
{
	PCMD_T pCmd_t=phTTS->pCMDThreadData;
#ifdef MSDOS
	vol_set(pCmd_t->params[0]);
#else                      
	StereoVolumeControl( phTTS,
						 pCmd_t->params[0],
						 VOLUME_SET,
						 TRUE,
						 TRUE );
#endif
	return(CMD_success);
}                              

#ifndef MSDOS
/* ******************************************************************
 *      Function Name: #ifndef MSDOS cm_cmd_volume()  
 *
 *      Description: Calls StereoVolumeControl() passing different parameters 
 *					 depending on whether the command is DCS_VOLUME_SET, 
 *					 DCS_VOLUME_UP, DCS_VOLUME_DOWN, DCS_VOLUME_LSET, 
 *					 DCS_VOLUME_LUP, DCS_VOLUME_LDOWN, DCS_VOLUME_RSET, 
 *					 DCS_VOLUME_RUP, DCS_VOLUME_RDOWN, or DCS_VOLUME_SSET. 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_bad_string, CMD_bad_value or CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_volume(LPTTS_HANDLE_T phTTS)
{
	int     cmd_type, cmd_value;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	cmd_type = cm_util_string_match(volume_options, pCmd_t->pString[0]);
	if(cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);
	cmd_type += DCS_VOLUME_SET;
	cmd_value = pCmd_t->params[1];

	if( cm_cmd_sync(phTTS) == CMD_flushing )
		return(CMD_flushing);

	switch(cmd_type)
	{
		case DCS_VOLUME_SET:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_SET,
								 TRUE,
								 TRUE );
			break;
		case DCS_VOLUME_UP:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_UP,
								 TRUE,
								 TRUE );
			break;
		case DCS_VOLUME_DOWN:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_DOWN,
								 TRUE,
								 TRUE );
			break;
		case DCS_VOLUME_LSET:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_SET,
								 TRUE,
								 FALSE );
			break;
		case DCS_VOLUME_LUP:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_UP,
								 TRUE,
								 FALSE );
			break;
		case DCS_VOLUME_LDOWN:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_DOWN,
								 TRUE,
								 FALSE );
			break;
		case DCS_VOLUME_RSET:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_SET,
								 FALSE,
								 TRUE );
			break;
		case DCS_VOLUME_RUP:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_UP,
								 FALSE,
								 TRUE );
			break;
		case DCS_VOLUME_RDOWN:
			StereoVolumeControl( phTTS,
								 cmd_value,
								 VOLUME_DOWN,
								 FALSE,
								 TRUE );
			break;
		case DCS_VOLUME_SSET:
			SetStereoVolume( phTTS, cmd_value, pCmd_t->params[2] );
			break;
		case DCS_VOLUME_ATT:
			phTTS->pKernelShareData->vol_att=cmd_value;
			break;
		default:
			return(CMD_bad_value);
	};
	return(CMD_success);
}

#else  /* The cmd_volume() function for MSDOS */
/* ********************************************************
 *      Function Name: #ifdef MSDOS cmd_volume()     
 *
 *      Description: Resets volume. Calls vol_set(), vol_up() or vol_down() 
 *					 depending on the command.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_bad_value or CMD_success
 *
 *      Comments:
 *
 * *******************************************************/
int cm_cmd_volume(LPTTS_HANDLE_T phTTS)
{
	int     cmd_type, cmd_value;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	cmd_type = cm_util_string_match(volume_options,pCmd_t->pString[0]);
	if(cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);
	cmd_type += DCS_VOLUME_SET;
	cmd_value = pCmd_t->params[1];
	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);
	switch(cmd_type)
	{
		case DCS_VOLUME_SET:
			vol_set(cmd_value);
			break;
		case DCS_VOLUME_UP:
			vol_up(cmd_value);
			break;
		case DCS_VOLUME_DOWN:
			vol_down(cmd_value);
			break;
#ifdef SW_VOLUME
		/* 10/6/99 eab the tone volume offset is added as part of this.. */
			//already in and ifdef MSODS environment
		case DCS_VOLUME_TONE:
			vol_tone(cmd_value);
			break;
#endif /* SW_VOLUME */
		default:
			return(CMD_bad_value);
	};
	return(CMD_success);  
}
#endif // MSDOS

/* ********************************************************
 *      Function Name: cm_cmd_language()        
 *
 *      Description: Switches language between English, French and Spanish.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int: 
 *						CMD_bad_string
 *						CMD_bad_value
 *						CMD_flushing
 *						CMD_success
 *
 *      Comments:
 *
 * *******************************************************/
int cm_cmd_language(LPTTS_HANDLE_T phTTS)
{   
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	int     cmd_type;
	DT_PIPE_T pipe_value;

	if(pCmd_t->esc_command == FALSE)
	{
		cmd_type = cm_util_string_match(lang_options,pCmd_t->pString[0]);
		if(cmd_type == NO_STRING_MATCH)
			return(CMD_bad_string);
	}
	else
		cmd_type = pCmd_t->params[0];
				  
	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);
	switch(cmd_type)
	{
		/* GL 03/27/1997 for BATS#317 add "us" option */
		/* GL 012/02/1998 for BATS#751 add more language option */
		case 0:/* english */
		case 6:/* us */
			if(pKsd_t->lang_ready[LANG_english] == LANG_both_ready)
				cmd_type = LANG_english;
			else
				return(CMD_bad_value);
			break;

#ifndef ARM7
		case 1:	/* british */
		case 7:	/* uk */
			if(pKsd_t->lang_ready[LANG_british] == LANG_both_ready)
				cmd_type = LANG_british;
			else
				return(CMD_bad_value);
			break;
		case 2:	/* french */
		case 8: /* fr */
			if(pKsd_t->lang_ready[LANG_french] == LANG_both_ready)
				cmd_type = LANG_french;
			else
				return(CMD_bad_value);
			break;
		case 3:	/* german */
		case 9: /* gr */
			if(pKsd_t->lang_ready[LANG_german] == LANG_both_ready)
				cmd_type = LANG_german;
			else
				return(CMD_bad_value);
			break;
		case 4:		/* spanish */
		case 10:    /* sp */
			if(pKsd_t->lang_ready[LANG_spanish] == LANG_both_ready)
				cmd_type = LANG_spanish;
			else
				return(CMD_bad_value);
			break;
		case 5:		/* latin american */
		case 11:    /* la */
			if(pKsd_t->lang_ready[LANG_latin_american] == LANG_both_ready)
				cmd_type = LANG_latin_american;
			else
				return(CMD_bad_value);
			break;
#endif

		default:
			return(CMD_bad_value);
	};

	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);
#ifdef MSDOS    
	default_lang(cmd_type,0);
#else
	default_lang(pKsd_t,cmd_type,0);
#endif

	pipe_value = LAST_VOICE;
#ifdef SINGLE_THREADED
	lts_loop(phTTS,&pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_remove()  
 *
 *      Description:  Removes current language.
 *
 *      Arguments: PKSD_T pKsd_t
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_remove(PKSD_T pKsd_t)
{
	DT_PIPE_T pipe_value;

#ifdef MSDOS
	pKsd_t->lang_ready[pKsd_t->lang_curr] = 0;
#else
	pKsd_t->lang_ready[LANG_english] = 0;
#endif

	pipe_value = KILL_TASK;
#ifdef SINGLE_THREADED
	lts_loop(pKsd_t->phTTS,&pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif

#ifndef SINGLE_THREADED
	pKsd_t->lts_pipe = NULL_PIPE;
	pKsd_t->ph_pipe = NULL_PIPE;
#endif
	return(CMD_success);
}

#ifdef DTEX 
/* *****************************************************************
 *      Function Name: #ifdef DTEX cm_cmd_power()   
 *
 *      Description: Says battery state
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value:
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_power(LPTTS_HANDLE_T phTTS)
{
	int cmd_type,cmd_value;
	volatile unsigned short int statusreg, i;
	volatile unsigned long j;
	unsigned short int flags;
	int status;    
    PCMD_T pCmd_t = phTTS->pCMDThreadData;
    PKSD_T pKsd_t = phTTS->pKernelShareData;

	cmd_type =  cm_util_string_match(power_options,pCmd_t->pString[0]);
	if (cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);

	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);
	/* we need to load down the power supply a bit to make sure
	 * we get a reliable indication of battery state. Run in a 
	 * loop for about a millisecond doing things..
	 */
	flags = kernel_disable();

	j = 0;
	for (i=0;i<1000;i++)
	{
		j = i;
		statusreg = _inp(GPIO);
	}
	kernel_enable(flags);

	switch (cmd_type)
	{
		case 0: /*speak*/
			/* cm_util_say_string(pKsd_t, "[:sync]", 1); */
			if (statusreg&EXTPWR)
			{   
				if (pKsd_t->lang_curr == LANG_british)
					cm_util_say_string(pKsd_t, "External power on. ", 1);
				if (pKsd_t->lang_curr == LANG_english)
					cm_util_say_string(pKsd_t, "External power on. ", 1);
				if (pKsd_t->lang_curr == LANG_spanish)
					cm_util_say_string(pKsd_t, "Corriente externa prendida. ", 1);
				if (pKsd_t->lang_curr == LANG_latin_american)
					cm_util_say_string(pKsd_t, "Corriente externa prendida. ", 1);
				if (pKsd_t->lang_curr == LANG_german)
                        cm_util_say_string(pKsd_t, "Externer Netzbetrieb an. ", 1);
				return(CMD_success);
			}
			if (statusreg&BATTOK)
			{
				if (pKsd_t->lang_curr == LANG_english)
				   cm_util_say_string(pKsd_t, "Battery okay. ", 1);
				if (pKsd_t->lang_curr == LANG_british)
				   cm_util_say_string(pKsd_t, "Battery okay. ", 1);
				if (pKsd_t->lang_curr == LANG_spanish)
					cm_util_say_string(pKsd_t, "Batería corriendo bien. ", 1);
				if (pKsd_t->lang_curr == LANG_latin_american)
					cm_util_say_string(pKsd_t, "Batería corriendo bien. ", 1);
				if (pKsd_t->lang_curr == LANG_german)
                                        cm_util_say_string(pKsd_t, "Battieren sind voll. ", 1);
				return(CMD_success);
			}

			if (pKsd_t->lang_curr == LANG_english)
				cm_util_say_string(pKsd_t, "Battery is low. ", 1);
			if (pKsd_t->lang_curr == LANG_spanish)
				cm_util_say_string(pKsd_t, "Bajo en batería. ", 1);
			if (pKsd_t->lang_curr == LANG_british)
				cm_util_say_string(pKsd_t, "Battery is low. ", 1);
			if (pKsd_t->lang_curr == LANG_latin_american)
				cm_util_say_string(pKsd_t, "Bajo en batería. ", 1);
			if (pKsd_t->lang_curr == LANG_german)
                                cm_util_say_string(pKsd_t, "Batterien sind schwach. ", 1);
			return(CMD_success);
			break;
		case 1: /* interval */
			pKsd_t->power_interval=pCmd_t->params[1];
#ifdef DEBUG
			printf("[:rem interval %d]",pKsd_t->power_interval);
#endif /*debug*/
			return(CMD_success);
			break;
		case 2: /* status */
			if (statusreg&EXTPWR)
			{
				printf("[:power external]");
				return(CMD_success);
			}

			if (statusreg&BATTOK)
			{
				printf("[:power batt_OK]");
				return(CMD_success);
			}
			printf("[:power batt_low]");
			return(CMD_success);
			break;
		case 3: /* sleep */
			pKsd_t->sleep_interval = pCmd_t->params[1];
			return(CMD_success);
			break;
		case 4: /* check */
			if (!(statusreg&BATTOK))
			{
				if(cm_cmd_sync(phTTS) == CMD_flushing)
					return(CMD_flushing);
				status = cm_util_dtpc_tones(phTTS, 0,750,250);
				if (status != CMD_success)
					return(status);
				return(cm_util_dtpc_tones_reset(phTTS));
			}
			return(CMD_success);
			break;
		case 5: /*lspeak*/
			cm_util_say_string(pKsd_t, "[:sync]", 0);
			if (statusreg&EXTPWR)
			{   
				if (pKsd_t->lang_curr == LANG_english)
					cm_util_say_string(pKsd_t, "External power on.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_spanish)
					cm_util_say_string(pKsd_t, "Corriente externa prendida.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_british)
					cm_util_say_string(pKsd_t, "External power on.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_latin_american)
					cm_util_say_string(pKsd_t, "Corriente externa prendida.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_german)
                        cm_util_say_string(pKsd_t, "Externer Netzbetrieb an.[:sync]", 0);
				return(CMD_success);
			}
			if (statusreg&BATTOK)
			{
				if (pKsd_t->lang_curr == LANG_english)
				   cm_util_say_string(pKsd_t, "Battery okay.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_spanish)
					cm_util_say_string(pKsd_t, "Batería corriendo bien.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_british)
				   cm_util_say_string(pKsd_t, "Battery okay.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_latin_american)
					cm_util_say_string(pKsd_t, "Batería corriendo bien.[:sync]", 0);
				if (pKsd_t->lang_curr == LANG_german)
                                   cm_util_say_string(pKsd_t, "Battieren sind voll.[:sync]", 0);
				return(CMD_success);
			}

			if (pKsd_t->lang_curr == LANG_english)
				cm_util_say_string(pKsd_t, "Battery is low.[:sync]", 0);
			if (pKsd_t->lang_curr == LANG_spanish)
				cm_util_say_string(pKsd_t, "Bajo en batería.[:sync]", 0);
			if (pKsd_t->lang_curr == LANG_british)
				cm_util_say_string(pKsd_t, "Battery is low.[:sync]", 0);
			if (pKsd_t->lang_curr == LANG_latin_american)
				cm_util_say_string(pKsd_t, "Bajo en batería.[:sync]", 0);
			if (pKsd_t->lang_curr == LANG_german)
                                cm_util_say_string(pKsd_t, "Batterien sind schwach.[:sync]", 0);

			return(CMD_success);
			break;
		default:
			return(CMD_bad_string);
	}
}

/* *****************************************************************
 *      Function Name: #ifdef DTEX cm_cmd_version() 
 *
 *      Description: Speaks the DecTalk version
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int:
 *						CMD_bad_string
 *						CMD_flushing 
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_version(LPTTS_HANDLE_T phTTS)
{
	int cmd_type,cmd_value;
	unsigned int old_sayflag;
    PCMD_T pCmd_t = phTTS->pCMDThreadData;           
    PKSD_T pKsd_t = phTTS->pKernelShareData;
    
	cmd_type =  cm_util_string_match(version_options,pCmd_t->pString[0]);
	if (cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);

	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);

	switch (cmd_type)
	{
		case 0: /*speak*/
			if(cm_cmd_sync(phTTS) == CMD_flushing)
				return(CMD_flushing);

                        cm_util_say_string(pKsd_t, (unsigned char *)versionspeak, 1);
			if(cm_cmd_sync(phTTS) == CMD_flushing)
				return(CMD_flushing);
			return(CMD_success);
			break;
		case 1: /* status */
			printf("[:version %f]\n",&pKsd_t->version[0]);
			return(CMD_success);
			break;
		default:
			return(CMD_bad_string);
	}
}

/* ******************************************************************
 *      Function Name: #ifdef DTEX cm_cmd_tsr()        
 *
 *      Description:
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_tsr(LPTTS_HANDLE_T phTTS)
{
	int cmd_type, cmd_value;
    PCMD_T pCmd_t = phTTS->pCMDThreadData;  
    PKSD_T pKsd_t = phTTS->pKernelShareData;

	cmd_type =  cm_util_string_match(tsr_options,pCmd_t->pString[0]);
	if (cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);

	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);

	switch (cmd_type)
	{
		case 0: /* on */
			pKsd_t->dleseq_OK = TRUE;
			return(CMD_success);
			break;
		case 1: /* off */
			pKsd_t->dleseq_OK = FALSE;
			return(CMD_success);
			break;
		default:
			return(CMD_bad_string);
	}
}
#endif /*DTEX*/

/* ******************************************************************
 *      Function Name: cm_cmd_mode()    
 *
 *      Description: Searches through parameters given to the
 *      mode command stored in pCmd_t->pString[]
 *      and looks for MATH, EUROPE, SPELL, NAME, HOMOGRAPH,
 *      CITATION or LATIN followed by ON, OFF or SET. 
 *      Uses constants MODE_MATH, MODE_EUROPE, MODE_SPELL,
 *      MODE_NAME, MODE_HOMOGRAPH, MODE_CITATION,
 *      MODE_LATIN, LTS_MODE_SET (to turn on), 
 *      LTS_MODE_CLEAR (to turn off) and LTS_MODE_ABS (to set bits)
 *      to modify the bits in pipe_value.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_bad_param, CMD_bad_string or CMD_success.
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_mode(LPTTS_HANDLE_T phTTS)
{
	unsigned int    i, value;
	DT_PIPE_T pipe_value[3];
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	pipe_value[0] = (2<<PSNEXTRA)+LTS_SYNC;
	pipe_value[1] = 0;
	pipe_value[2] = 0;
	for(i=0; i < pCmd_t->param_index; i++)
	{
		value = cm_util_string_match(mode_options,(unsigned char *)pCmd_t->pString[i]);
		if(value == NO_STRING_MATCH)
		{
			return(CMD_bad_string);
		}       
		/*
		 * 3/6/96 SIK This command only takes 2 parameters:  MATH, EUROPE, SPELL, NAME, 
		 * HOMOGRAPH, CITATION or LATIN followed by ON, OFF or SET 
		 */
		switch(i)
		{         
			case 0:    /* First param */
				switch(value)
				{                               
					case 0: /* minus */
						pipe_value[2] |= MODE_MATH;  
						break;
					case 1: /* europe */
						pipe_value[2] |= MODE_EUROPE; 
						break;
					case 2: /* spell */
						pipe_value[2] |= MODE_SPELL;       
						break;
					case 3: /* name determination */
						pipe_value[2] |= MODE_NAME;       
						break;
					case 4: /* homograph determination */
						pipe_value[2] |= MODE_HOMOGRAPH;
						break;
					case 5: /* citation mode */
						pipe_value[2] |= MODE_CITATION;
						break;
					case 6: /* latin mode */
						pipe_value[2] |= MODE_LATIN;
                        break;
					case 7: /* table reading mode */
						pipe_value[2] |= MODE_TABLE;
						break;
					case 8: /* email reading mode */
						pipe_value[2] |= MODE_EMAIL;
						break;
					default:
						return(CMD_bad_param);
				}
				break;
			case 1:    /* Second param */
				switch(value)
				{               
					case 9:                         /* on */
						pipe_value[1] = LTS_MODE_SET;
#ifdef SINGLE_THREADED
						lts_loop(phTTS,pipe_value);
#else
                        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,3);
#endif
						break;
					case 10:                         /* off */
						pipe_value[1] = LTS_MODE_CLEAR;
#ifdef SINGLE_THREADED
						lts_loop(phTTS,pipe_value);
#else
                        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,3);
#endif
						break;
					case 11:                         /* set */
						pipe_value[1] = LTS_MODE_ABS;
#ifdef SINGLE_THREADED
						lts_loop(phTTS,pipe_value);
#else
                        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,3);
#endif
						break;
					default:
						return(CMD_bad_param);    
				}
				/* 
				   GL 01/28/1997, force SYNC here to fix the race condition in
				   DECtalk software
				*/
				cm_cmd_sync(phTTS);
				break;
			default:
				return(CMD_bad_param);
		}  /* Matches switch(i) */
	}       /* Matches for(i=0; i < pCmd_t->param_index; i++) */
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_pronounce()       
 *
 *      Description: Sets the pronunciation mode; either LTS_DIC_ALTERNATE, 
 *					 LTS_ACNA_NAME, or LTS_DIC_PRIMARY.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_bad_string, CMD_bad_value or CMD_success  
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_pronounce(LPTTS_HANDLE_T phTTS)
{
	unsigned int i, value;
	DT_PIPE_T pipe_value[2];
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	pipe_value[0] = (1<<PSNEXTRA)+LTS_SYNC;
	for(i=0;i<pCmd_t->param_index;i++)
	{
		value = cm_util_string_match(pronounce_options, (unsigned char *)pCmd_t->pString[i]);
		if(value == NO_STRING_MATCH)
			return(CMD_bad_string);
		switch(value)
		{
			case 0:	/* alternate */
				pipe_value[1] = LTS_DIC_ALTERNATE;
				break;
			case 1:	/* acna name */
				pipe_value[1] = LTS_ACNA_NAME;
				break;
			case 2:	/* primary */
				pipe_value[1] = LTS_DIC_PRIMARY;
				break;
			case 3:	/* noun */
				pipe_value[1] = LTS_DIC_NOUN;
				break;
			case 4:	/* verb */
				pipe_value[1] = LTS_DIC_VERB;
				break;
			case 5:	/* adjective */
				pipe_value[1] = LTS_DIC_ADJECTIVE;
				break;
			case 6:	/* function */
				pipe_value[1] = LTS_DIC_FUNCTION;
				break;
			case 7:	/* interjection */
				pipe_value[1] = LTS_DIC_INTERJECTION;
				break;
		}
#ifdef SINGLE_THREADED
				lts_loop(phTTS,pipe_value);
#else
                cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,2);
#endif
	}
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_rate()    
 *
 *      Description: set the speaking rate ...
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/

int cm_cmd_rate(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[2];
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
#ifdef SAPI5DECTALK
	int sapi_realtime_rate;
	
	sapi_realtime_rate=GetSapiRealtimeRate(phTTS);
	pCmd_t->params[0]+=sapi_realtime_rate;
#endif

	//BTS10102 clamp high and low rate values

	if ( pCmd_t->params[0] < MIN_SPEAKING_RATE )
			pCmd_t->params[0] = MIN_SPEAKING_RATE;
		
	else if( pCmd_t->params[0] > MAX_SPEAKING_RATE )
			pCmd_t->params[0] = MAX_SPEAKING_RATE;

		pipe_value[0] = (1<<PSNEXTRA) + RATE;
	pipe_value[1] = pCmd_t->params[0];
#ifdef SINGLE_THREADED
	lts_loop(phTTS,pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,2);
#endif
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_name()    
 *
 *      Description: Switches between the different voices.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either  CMD_bad_string, CMD_bad_value or CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_name(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[2];
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	if(CT[pCmd_t->cmd_index].esc_value == DCS_NAME)
	{
#ifdef EPSON_ARM7
		pipe_value[1] = pCmd_t->params[0];
#else
		pipe_value[1] = cm_util_string_match(voice_names,pCmd_t->pString[0]);
#endif
	}
	else
	{
		pipe_value[1] = CT[pCmd_t->cmd_index].esc_value & ESCAPE_CODE;
	}	
	if(((pipe_value[1]) >= 0) && (pipe_value[1] < MAX_VOICES))
	{
		pipe_value[0] = (1<<PSNEXTRA) + NEW_SPEAKER;
#ifdef SINGLE_THREADED
		lts_loop(phTTS,pipe_value);
#else
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,2);
#endif
		return(CMD_success);
	}
	return(CMD_bad_string);
}

/* ******************************************************************
 *      Function Name: cm_cmd_latin()   
 *
 *      Description: Sets speaking rate to pCmd_t->params[0]
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_latin(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[2]; 
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	pipe_value[0] = (1<<PSNEXTRA) + LATIN;
	pipe_value[1] = pCmd_t->params[0];
#ifdef SINGLE_THREADED
		lts_loop(phTTS,pipe_value);
#else
        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,2);
#endif
		return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_comma()   
 *
 *      Description: set the comma pause 
 *
 *      Arguments:
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_comma(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[2];
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	pipe_value[0] = (1<<PSNEXTRA) + CPAUSE;
	pipe_value[1] = pCmd_t->params[0];
#ifdef SINGLE_THREADED
	lts_loop(phTTS,pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,2);
#endif	
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_period()  
 *
 *      Description: set the period pause ...
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_period(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[2];
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
//fix for BTS#10100

	if((int)pCmd_t->params[0] < MIN_PERIOD_PAUSE )
			pCmd_t->params[0] = MIN_PERIOD_PAUSE;
		
	else if((int)pCmd_t->params[0] > MAX_PERIOD_PAUSE)
			pCmd_t->params[0] = MAX_PERIOD_PAUSE;


	pipe_value[0] = (1<<PSNEXTRA) + PPAUSE;
	pipe_value[1] = pCmd_t->params[0];
#ifdef SINGLE_THREADED
	lts_loop(phTTS,pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,2);
#endif
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_mark()    
 *
 *      Description: Handles mark index, mark repy and mark query commands.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_bad_string, CMD_bad_value or CMD_success. 
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_mark(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[3];
	short cmd_type, cmd_value;
	short temp;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	cmd_type = cm_util_string_match(index_options,pCmd_t->pString[0]);
	if(cmd_type == NO_STRING_MATCH)
	{
	    /* change for the parser index buffer */
    	/* force the parser buffer to be sent */
#ifdef NEW_INDEXING
	 	temp=pCmd_t->ParseChar; 
	 	pCmd_t->ParseChar=0x0fff;
 		cm_pars_proc_char(phTTS,' ');
	 	pCmd_t->ParseChar=temp;
#endif
		return(CMD_bad_string);
	}

	if(cmd_type == 3)
	{
		cmd_type = DCS_INDEX;
		pipe_value[2] = SPC_INDEX_PAUSE;
	}
	else
	{
		cmd_type += DCS_INDEX;
		pipe_value[2] = TEXT_OUTPUT;
	}
	cmd_value = pCmd_t->params[1];

	switch(cmd_type)
	{
		case DCS_INDEX:
			pipe_value[0] = (2<<PSNEXTRA) + INDEX;
			break;
		case DCS_INDEX_REPLY:
			pipe_value[0] = (2<<PSNEXTRA) + INDEX_REPLY;
			break;
		case DCS_INDEX_QUERY:
	    /* change for the parser index buffer */
    	/* force the parser buffer to be sent */
#ifdef NEW_INDEXING
		 	temp=pCmd_t->ParseChar; 
		 	pCmd_t->ParseChar=0x0fff;
			cm_pars_proc_char(phTTS,' ');
		 	pCmd_t->ParseChar=temp;
#endif

#ifdef MSDOS
        	WAIT_PRINT;
			printf("\n[:index %d]",pKsd_t->lastindex);
        	SIGNAL_PRINT;
#else
			send_index(pipe_value[2],pKsd_t->lastindex);
#endif
			return(CMD_success);
		//tek 01aug97 bats 404
		// handle these new index types.
                //cjl 18nov97 Add ifdef for 32bit only.
#ifdef _WIN32
		case DCS_INDEX_BOOKMARK:
			pipe_value[0] = (2<<PSNEXTRA) | INDEX_BOOKMARK;
			pipe_value[2] = pCmd_t->params[2];//NH
			break;
		case DCS_INDEX_WORDPOS:
			pipe_value[0] = (2<<PSNEXTRA) | INDEX_WORDPOS;
			pipe_value[2] = pCmd_t->params[2];//Nl
			break;
		case DCS_INDEX_START:
			pipe_value[0] = (2<<PSNEXTRA) | INDEX_START;
			pipe_value[2] = pCmd_t->params[2];//N?
			break;
		case DCS_INDEX_STOP:
			pipe_value[0] = (2<<PSNEXTRA) | INDEX_STOP;
			pipe_value[2] = pCmd_t->params[2];//N?
			break;
		case DCS_INDEX_SENTENCE:
			pipe_value[0] = (2<<PSNEXTRA) | INDEX_SENTENCE;
			pipe_value[2] = pCmd_t->params[2];//N?
			break;
		case DCS_INDEX_VOLUME:
			pipe_value[0] = (2<<PSNEXTRA) | INDEX_VOLUME;
			pipe_value[2] = pCmd_t->params[2];//N?
			break;
#endif // _WIN32

		default:
	    /* change for the parser index buffer */
    	/* force the parser buffer to be sent */
#ifdef NEW_INDEXING
		 	temp=pCmd_t->ParseChar; 
		 	pCmd_t->ParseChar=0x0fff;
	 		cm_pars_proc_char(phTTS,' ');
		 	pCmd_t->ParseChar=temp;
#endif

			return(CMD_bad_string);
	}
    /* change for the parser index buffer */
    /* make it place the index command into the buffer and not write it to the output */
	pipe_value[1] = cmd_value;
#ifdef NEW_INDEXING
	/* add the space to the clause buffer */
    if (pCmd_t->input_counter>=PAR_ROLLING_STOP_VALUE)
    {
	 	temp=pCmd_t->ParseChar; 
	 	pCmd_t->ParseChar=' ';
		cm_pars_proc_char(phTTS,' ');
	 	pCmd_t->ParseChar=' ';
		cm_pars_proc_char(phTTS,' ');
	 	pCmd_t->ParseChar=temp;                     
	}
	if (pCmd_t->punct_mode==PUNCT_pass || pCmd_t->skip_mode==SKIP_all)
	{
#ifdef SINGLE_THREADED
		lts_loop(phTTS,pipe_value);
#else
		cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,3);
#endif
		return(CMD_success);
	}
	/* GL 09/04/1996 insert a dummy space before the index marker */
	/* MGS 10/14/1999 BATS #876 fix for UK phone numbers (part of it) */
	/* comment out next line, it adds a second dummy space and breaks things */
	//	pCmd_t->clausebuf[pCmd_t->input_counter++]=' ';
	/* insert a dummy character for the index */
	pCmd_t->clausebuf[pCmd_t->input_counter]=PAR_INDEX_DUMMY_CHAR;
	/* put the index into the index buffer */
#ifndef ARM7
	memcpy(pCmd_t->input_indexes[pCmd_t->input_counter].index,pipe_value,sizeof(index_data_t));
#endif
#if defined ARM7 && defined ACCESS_SOLUTIONS
	memcpy(pCmd_t->input_indexes[pCmd_t->input_counter].index,pipe_value,sizeof(index_data_t));
#endif
	/* add 1 for the counter updating */
	pCmd_t->input_counter++;
	pCmd_t->index_counter++;
#endif // NEW_INDEXING

#ifndef NEW_INDEXING
        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,3);
#endif
	return(CMD_success);
}

typedef struct phoneme_s
{
	unsigned short phone;
	unsigned short dur;
	unsigned short pitch;
	unsigned short nextra;
} phoneme_t;


const phoneme_t preamble_1[] = {
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_M,	0,	0,	2},
	{                (PFUSA<<PSFONT) | S2,		0,	0,	0},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_EH,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_S,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_IX,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_JH,	0,	0,	2},
	{                (PFUSA<<PSFONT) | WBOUND,	0,	0,	0},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_IH,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_Z,	0, 0,	2},
	{                (PFUSA<<PSFONT) | COMMA,	0,	0,	0},
	{                (PFUSA<<PSFONT) | WBOUND,	0,	0,	0}
};
const phoneme_t preamble_2a[] = {
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_M,	0,	0,	2},
	{                (PFUSA<<PSFONT) | S2,		0,	0,	0},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_EH,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_S,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_IX,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_JH,	0,	0,	2},
	{                (PFUSA<<PSFONT) | WBOUND,	0,	0,	0}
};
const phoneme_t preamble_2b[] = {
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_IH,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_Z,	0,	0,	2},
	{                (PFUSA<<PSFONT) | COMMA,	0,	0,	0},
	{                (PFUSA<<PSFONT) | WBOUND,	0,	0,	0}
};
const phoneme_t preamble_3a[] = {
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_M,	0,	0,	2},
	{                (PFUSA<<PSFONT) | S2,		0,	0,	0},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_EH,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_S,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_IX,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_JH,	0,	0,	2},
	{                (PFUSA<<PSFONT) | WBOUND,	0,	0,	0},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_F,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_R,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_AH,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_M,	0,	0,	2},
	{                (PFUSA<<PSFONT) | WBOUND,	0,	0,	0}
};
const phoneme_t preamble_3b[] = {
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_IH,	0,	0,	2},
	{(2<<PSNEXTRA) | (PFUSA<<PSFONT) | US_Z,	0,	0,	2},
	{                (PFUSA<<PSFONT) | COMMA,	0,	0,	0},
	{                (PFUSA<<PSFONT) | WBOUND,	0,	0,	0}
};


int cm_cmd_preamble(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[2];
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	int i;
	phoneme_t *list;
	int length;
	
	pipe_value[0] = (1<<PSNEXTRA) + PREAMBLE;
	pipe_value[1] = pCmd_t->params[0];

	// flush the parser
	pCmd_t->ParseChar=0x0fff;
	cm_pars_proc_char(phTTS,' ');

#ifdef SINGLE_THREADED
	lts_loop(phTTS,pipe_value);
#else
	cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,2);
#endif
	list=NULL;
	switch (pCmd_t->params[0])
	{
		case 0:
			switch (pKsd_t->last_preamble_command)
			{
				case 0:
					break;
				case 1:
					// nothing more
					break;
				case 2:
					// "is"
					// CAB Removed warnings by typecast
					list = (phoneme_t *)preamble_2b;
					length=sizeof(preamble_2b)/sizeof(phoneme_t);
					break;
				case 3:
					// "is"
					// CAB Removed warnings by typecast
					list = (phoneme_t *)preamble_3b;
					length=sizeof(preamble_3b)/sizeof(phoneme_t);
					break;
			}
			// shut off preamble
			break;
		case 1:
			// "Message is [text]"
			// CAB Removed warnings by typecast
			list = (phoneme_t *)preamble_1;
			length=sizeof(preamble_1)/sizeof(phoneme_t);
			break;
		case 2:
			// "Message [number] is [text]"
			// CAB Removed warnings by typecast
			list = (phoneme_t *)preamble_2a;
			length=sizeof(preamble_2a)/sizeof(phoneme_t);
			break;
		case 3:
			// "Message from [name] is [text]"
			// CAB Removed warnings by typecast
			list = (phoneme_t *)preamble_3a;
			length=sizeof(preamble_3a)/sizeof(phoneme_t);
			break;
	}

	pKsd_t->last_preamble_command=pCmd_t->params[0];	

	if (list!=NULL)
	{
		for (i=0;i<length;i++)
		{
#ifdef SINGLE_THREADED
			lts_loop(phTTS,(unsigned short *)&(list[i]));
#else
			// CAB Removed warnings by typecast
			cm_util_write_pipe(pKsd_t, pKsd_t->lts_pipe, (short *)&list[i], (short)(list[i].nextra+1));
#endif
		}
	}

	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_define()
 *
 *      Description: Sets the voice parameters specified by the define voice command.
 *					 pipe_value[1] stores the first parameter, pipe_value[2] stores the
 *					 second parameter.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_bad_value, CMD_bad_string, or CMD_success 
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_define(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value[3];
#ifndef SINGLE_THREADED
	PKSD_T pKsd_t = phTTS->pKernelShareData;
#endif
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	if(pCmd_t->param_index == 0)
		return(CMD_success);
	pipe_value[1] = cm_util_string_match(define_options,pCmd_t->pString[0]);
	
	/* 09/09/1996 SIK Fix for this command */
	if(pipe_value[1] == NO_STRING_MATCH)
		return(CMD_bad_string);
	/*
 	 *  do the save first ...
 	 */

	if(pipe_value[1] == 0)
	{
		if(pCmd_t->defaults[1] == FALSE)
			return(CMD_bad_value);
		else
		{
			pipe_value[0] = SAVE;
#ifdef SINGLE_THREADED
			lts_loop(phTTS,pipe_value);
#else
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,1);
#endif
		}
	}
	else
	{
		if(pCmd_t->defaults[1] == TRUE)
			return(CMD_bad_value);
		else
		{
			pipe_value[0] = (2<<PSNEXTRA)+NEW_PARAM;
			pipe_value[1] -= 1;
			pipe_value[2] = pCmd_t->params[1];
#ifdef SINGLE_THREADED
			lts_loop(phTTS,pipe_value);
#else
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,3);
#endif
		}
	}
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_plang()   
 *
 *      Description: Corresponds to [:plang] Speak and print the phonemic table ...
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_flushing or CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_plang(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe_value;
	int     i;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	int phoneme_code_add=0;

	switch (pKsd_t->lang_curr)
	{
		case LANG_english:
			phoneme_code_add=(PFUSA<<PSFONT);
			break;
		case LANG_british:
			phoneme_code_add=(PFUK<<PSFONT);
			break;
		case LANG_german:
			phoneme_code_add=(PFGR<<PSFONT);
			break;
		case LANG_spanish:
			phoneme_code_add=(PFSP<<PSFONT);
			break;
		case LANG_latin_american:
			phoneme_code_add=(PFLA<<PSFONT);
			break;
		case LANG_french:					//chj 7/20/00
			phoneme_code_add=(PFFR<<PSFONT);
			break;
	}

	
	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);
	if(pCmd_t->params[0] == 0 || pCmd_t->defaults[0] == TRUE)
	{
		for(i=1; i < MAXI_PHONES; i++)
		{
			if(pKsd_t->arpabet[i*2])
			{
#ifndef ARM7_NOSWI
				WAIT_PRINT;
				printf("\n  %d arpabet (%c%c)  asky (%c)",
					i,pKsd_t->arpabet[i*2],pKsd_t->arpabet[i*2+1],pKsd_t->ascky[i]);
				SIGNAL_PRINT;
#endif
				pipe_value = phoneme_code_add | i;
#ifndef SINGLE_THREADED
				cm_util_write_pipe(pKsd_t,pKsd_t->ph_pipe,&pipe_value,1);
#else
#ifdef EPSON_ARM7
				fill_TTP_buffer(phTTS,&pipe_value,1);
#else
				ph_loop(phTTS,&pipe_value);
#endif
#endif
				pipe_value = phoneme_code_add | COMMA;
#ifndef SINGLE_THREADED
				cm_util_write_pipe(pKsd_t,pKsd_t->ph_pipe,&pipe_value,1);
#else
#ifdef EPSON_ARM7
				fill_TTP_buffer(phTTS,&pipe_value,1);
#else
				ph_loop(phTTS,&pipe_value);
#endif
#endif
				
				/* GL 04/21/1997  change this for OSF build */
#ifdef MSDOS
				sleep(100);
#endif
				
#ifdef WIN32
				Sleep(100);
#endif
				
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined __osf__
				OP_Sleep(100);
#endif
				
			}
		}
	}
	else 
	{
		if(pCmd_t->params[0] < MAXI_PHONES)
		{
			i = pCmd_t->params[0];
#ifndef ARM7_NOSWI
			WAIT_PRINT;
			printf("\n  %d arpabet (%c%c)  asky (%c)",
				i,pKsd_t->arpabet[i*2],pKsd_t->arpabet[i*2+1],pKsd_t->ascky[i]);
			SIGNAL_PRINT;
#endif
			pipe_value = phoneme_code_add | i;
#ifndef SINGLE_THREADED
			cm_util_write_pipe(pKsd_t,pKsd_t->ph_pipe,&pipe_value,1);
#else
#ifdef EPSON_ARM7
			fill_TTP_buffer(phTTS,&pipe_value,1);
#else
			ph_loop(phTTS,&pipe_value);
#endif
#endif
			pipe_value = phoneme_code_add | COMMA;
#ifndef SINGLE_THREADED
			cm_util_write_pipe(pKsd_t,pKsd_t->ph_pipe,&pipe_value,1);
#else
#ifdef EPSON_ARM7
			fill_TTP_buffer(phTTS,&pipe_value,1);
#else
			ph_loop(phTTS,&pipe_value);
#endif
#endif
		}
	}
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_stress()
 *
 *      Description: Corresponds to [:pitch command. Parameter for command is read 
 *      			 from pCmd_t->params[0].
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *				   and PCMD_T data structures.
 *
 *      Return Value: int  CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_stress(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData; 
	
	if(pCmd_t->defaults[0] == TRUE)
		pKsd_t->pitch_delta = 0;
	else
		pKsd_t->pitch_delta = (int)pCmd_t->params[0];
	return(CMD_success);
}

#ifndef MSDOS
#define  TONE_AMPLITUDE  32767
/* ******************************************************************
 *      Function Name: #ifndef MSDOS cm_cmd_tone()
 *
 *      Description: Calls cm_util_dtpc_tones() to play a certain
 *      frequency for a certain duration.
 *      The frequency (hz) is given by pCmd_t->params[0]
 *      and duration (ms) by pCmd_t->params[1]. 
 *      Returns either CMD_success or status returned by cm_util_dtpc_tones().
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_tone(LPTTS_HANDLE_T phTTS)
{
	DT_PIPE_T pipe[6];
	/*LPTTS_HANDLE_T phTTS;*/             /*MVP MI */
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	
	/********************************************************************/
	/*  Get the text to speech handle.                                  */
	/********************************************************************/
	
	/*phTTS = TextToSpeechGetHandle();*/
	
	/********************************************************************/
	/*  Wait for all characters previously queued to LTS to be          */
	/*  processed.                                                      */
	/********************************************************************/
	
	if ( cm_cmd_sync(phTTS) == CMD_flushing )
		return( CMD_flushing );
	
#ifndef ARM7
	WaitForLtsFlush( phTTS, 0xFFFFFFFF );
#endif
	/********************************************************************/
	/*  The packet format here is different than the DTC07. The ramp    */
	/*  duration has been eliminated. The tone generation software      */
	/*  automatically provides 3 msec. cosine squared tapering for      */
	/*  the tone pulse rise and fall time.                              */
	/*                                                                  */
	/*  Packet Index     Packet Data                 Value              */
	/*                                                                  */
	/*      0            Command Word              SPC_type_tone        */
	/*      1            Tone Duration (msec.)     0 to ?               */
	/*      2            Tone 0 Frequency          0 to Fs/2            */
	/*      3            Tone 0 Amplitude          0 to 32767           */
	/*      4            Tone 1 Frequency          0 to Fs/2            */
	/*      5            Tone 1 Amplitude          0 to 32767           */
	/*                                                                  */
	/********************************************************************/
	
	/********************************************************************/
	/*  params[1] is a character pointer to the duration in msec.       */
	/*  params[0] is a character pointer to the frequency in Hertz.     */
	/********************************************************************/
	
	if ( pCmd_t->params[0] > ( pKsd_t->uiSampleRate >> 1 ))
		return( CMD_bad_value );
	
	pipe[0] = SPC_type_tone;
	pipe[1] = pCmd_t->params[1];
	pipe[2] = pCmd_t->params[0];

	/********************************************************************/
	/*  Disable the second tone.                                        */
	/********************************************************************/
	
	pipe[3] = TONE_AMPLITUDE;
	pipe[4] = 1000;
	pipe[5] = 0;
	
	/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#ifndef SINGLE_THREADED
	cm_util_write_pipe(pKsd_t,pKsd_t->vtm_pipe, pipe, 6 );
#else
	vtm_loop(phTTS,pipe);
#endif
#endif

	return( CMD_success );
}

#else /* ifndef MSDOS */ 
/* ******************************************************************
 *      Function Name: #ifdef MSDOS cm_cmd_tone()
 *
 *      Description: Calls cm_util_dtpc_tones() to play a certain
 *      frequency for a certain duration.
 *      The frequency (hz) is given by pCmd_t->params[0]
 *      and duration (ms) by pCmd_t->params[1]. 
 *      Returns either CMD_success or status returned
 *      by cm_util_dtpc_tones(). MS-DOS version.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int 
 *						CMD_bad_value 
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_tone(LPTTS_HANDLE_T phTTS)
{
	int status;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
  
	if(pCmd_t->defaults[0] == TRUE || pCmd_t->defaults[1] == TRUE)
		return(CMD_bad_value);
	/*
 	 *  wait for spc, then send the tone off ...
 	 */

	status = cm_util_dtpc_tones(phTTS, 0, pCmd_t->params[0], pCmd_t->params[1]);
	if(status != CMD_success)
		return(status);

	/*
 	 *  wait for tone to complete, then reset the spc and ph ...
 	 */

	return(cm_util_dtpc_tones_reset(phTTS));
}
#endif /* ifndef MSDOS */

#ifndef MSDOS
#define  DTMF_PAUSE_TIME_IN_MSEC            100
#define  DTMF_DIGIT_TIME_IN_MSEC            100
#define  DTMF_INTER_DIGITAL_TIME_IN_MSEC    100
#define  DTMF_HIGH_TONE_AMPLITUDE         20090
#define  DTMF_LOW_TONE_AMPLITUDE          12676
/* ******************************************************************
 *      Function Name: #ifndef MSDOS cm_cmd_dial()
 *
 *      Description: Creates DTMF tones. Uses pCmd_t->params array for input arguments.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int 
 *						CMD_flushing  
 *						CMD_bad_string  
 *						CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_dial(LPTTS_HANDLE_T phTTS)
{
  int iIndex;
  unsigned char *pChar;
  unsigned char szSingleDigit[2];
  DT_PIPE_T pipe[6];
#ifndef SINGLE_THREADED
  PKSD_T pKsd_t = phTTS->pKernelShareData;      
#endif
  PCMD_T pCmd_t = phTTS->pCMDThreadData;
  /*
  LPTTS_HANDLE_T phTTS;
  */
  /********************************************************************/
  /*  Get the text to speech handle.                                  */
  /********************************************************************/
  /*
  phTTS = TextToSpeechGetHandle();
  */
  /********************************************************************/
  /*  Wait for all characters previously queued to LTS to be          */
  /*  processed.                                                      */
  /********************************************************************/

  if ( cm_cmd_sync(phTTS) == CMD_flushing )
	return( CMD_flushing );

#ifndef ARM7
  WaitForLtsFlush( phTTS, 0xFFFFFFFF );
#endif

  /********************************************************************/
  /*  Write a tone packet to the VTM thread for each character in the */
  /*  dial string.                                                    */
  /********************************************************************/

  pChar = pCmd_t->pString[0];

  while ( *pChar != '\0' )
  {
	/******************************************************************/
	/*  Convert the character to an index.                            */
	/******************************************************************/

	szSingleDigit[0] = *pChar;
	szSingleDigit[1] = '\0';

	switch ( szSingleDigit[0] )
	{
		case '0':
			iIndex = 0;
			break;
		case '1':
			iIndex = 1;
			break;
		case '2':
			iIndex = 2;
			break;
		case '3':
			iIndex = 3;
			break;
		case '4':
			iIndex = 4;
			break;
		case '5':
			iIndex = 5;
			break;
		case '6':
			iIndex = 6;
			break;
		case '7':
			iIndex = 7;
			break;
		case '8':
			iIndex = 8;
			break;
		case '9':
			iIndex = 9;
			break;
		case '*':
			iIndex = 10;
			break;
		case '#':
			iIndex = 11;
			break;
		case 'a':
		case 'A':
			iIndex = 12;
			break;
		case 'b':
		case 'B':
			iIndex = 13;
			break;
		case 'c':
		case 'C':
			iIndex = 14;
			break;
		case 'd':
		case 'D':
			iIndex = 15;
			break;
		default:
			if  (( szSingleDigit[0] == '-' )
				|| ( szSingleDigit[0] == ',' )
				|| ( szSingleDigit[0] == ' ' ))
			{
				iIndex = 16;
			}
			else
			{
				return( CMD_bad_string );
			}
			
			break;
	} /* switch ( szSingleDigit[0] ) */

	/******************************************************************/
	/*  If the index == 16 then send a tone packet with a duration of */
	/*  DTMF_PAUSE_TIME_IN_MSEC and both tone amplitudes set to zero. */
	/*  Otherwise send DTMF Tones with the default high tone and low  */
	/*  tone amplitudes.                                              */
	/*                                                                */
	/*  The packet format here is different than the DTC07. The ramp  */
	/*  duration has been eliminated. The tone generation software    */
	/*  automatically provides 3 msec. cosine squared tapering for    */
	/*  the tone pulse rise and fall time.                            */
	/*                                                                */
	/*  Packet Index     Packet Data                 Value            */
	/*                                                                */
	/*      0            Command Word              SPC_type_tone      */
	/*      1            Tone Duration (msec.)     0 to ?             */
	/*      2            Tone 0 Frequency          0 to Fs/2          */
	/*      3            Tone 0 Amplitude          0 to 32767         */
	/*      4            Tone 1 Frequency          0 to Fs/2          */
	/*      5            Tone 1 Amplitude          0 to 32767         */
	/*                                                                */
	/******************************************************************/

	if ( iIndex == 16 )
	{
	  /****************************************************************/
	  /*  Silent interval.                                            */
	  /****************************************************************/

	  pipe[0] = SPC_type_tone;
	  pipe[1] = DTMF_PAUSE_TIME_IN_MSEC;
	  pipe[2] = 1000;
	  pipe[3] = 0;
	  pipe[4] = 1000;
	  pipe[5] = 0;

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#ifndef SINGLE_THREADED
      cm_util_write_pipe(pKsd_t, pKsd_t->vtm_pipe, pipe, 6 );
#else
	  vtm_loop(phTTS,pipe);
#endif

#endif // defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

	}
	else
	{
	  /****************************************************************/
	  /*  DTMF digit.                                                 */
	  /****************************************************************/

	  pipe[0] = SPC_type_tone;
	  pipe[1] = DTMF_DIGIT_TIME_IN_MSEC;
	  pipe[2] = tlitone0[iIndex];
	  pipe[3] = DTMF_HIGH_TONE_AMPLITUDE;
	  pipe[4] = tlitone1[iIndex];
	  pipe[5] = DTMF_LOW_TONE_AMPLITUDE;

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#ifndef SINGLE_THREADED
	  cm_util_write_pipe(pKsd_t, pKsd_t->vtm_pipe, pipe, 6 );
#else
	  vtm_loop(phTTS,pipe);
#endif
#endif // defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

	  /****************************************************************/
	  /*  Interdigital space.                                         */
	  /****************************************************************/

	  pipe[0] = SPC_type_tone;
	  pipe[1] = DTMF_INTER_DIGITAL_TIME_IN_MSEC;
	  pipe[2] = 1000;
	  pipe[3] = 0;
	  pipe[4] = 1000;
	  pipe[5] = 0;

/* GL 04/21/1997  change this for OSF build */
#if defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
#ifndef SINGLE_THREADED
	  cm_util_write_pipe(pKsd_t, pKsd_t->vtm_pipe, pipe, 6 );
#else
	  vtm_loop(phTTS,pipe);
#endif

#endif // defined (WIN32) || defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

	}

	/******************************************************************/
	/*  Increment to the next character.                              */
	/******************************************************************/

	pChar++;
  }

  return( CMD_success );
}

#else  /*  ifndef MSDOS */
/* ******************************************************************
 *      Function Name: #ifdef MSDOS cm_cmd_dial() 
 *
 *      Description: Creates DTMF tones. Uses pCmd_t->params array for input arguments.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int
 *						status
 *						CMD_bad_string
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_dial(LPTTS_HANDLE_T phTTS)
{
	unsigned char *s;
	int status;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	pCmd_t->dtmf_start_clock=0;
	
	if(pCmd_t->defaults[0] == TRUE)
		return(CMD_bad_string);
	s = (unsigned char *)pCmd_t->pString[0];
	pCmd_t->tone_wait = 0;
	while(*s)
	{
		status = cm_util_dtpc_tones(phTTS, *s++, 0,0);
		if(status != CMD_success)
		{
			break;                                                 
		}
		/* mark the starting time.. */
		if (pCmd_t->dtmf_start_clock == 0)
		{
			pCmd_t->dtmf_start_clock = get_clock();
		}
	}                             
	pCmd_t->dtmf_stop_clock = get_clock();     
	/* check for roll.. */
	if (pCmd_t->dtmf_stop_clock < pCmd_t->dtmf_start_clock)
		/* punt; set the start to 0. (that's close enough.) */
		pCmd_t->dtmf_start_clock = 0;
	pCmd_t->dtmf_stop_clock = pCmd_t->dtmf_stop_clock - pCmd_t->dtmf_start_clock; /* how long? */
	/* knock off the time we sat waiting.. */
	if (pCmd_t->dtmf_stop_clock < (unsigned long)pCmd_t->tone_wait)
		pCmd_t->tone_wait -= (unsigned short)pCmd_t->dtmf_stop_clock;
	else
		pCmd_t->tone_wait=0;
	return(cm_util_dtpc_tones_reset(phTTS));
}
#endif /* MSDOS */

/* ******************************************************************
 *      Function Name: cm_cmd_digitized()       
 *
 *      Description:
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either CMD_flushing or CMD_success
 *
 *      Comments: int
 *
 * ******************************************************************/
int cm_cmd_digitized(LPTTS_HANDLE_T phTTS)
{   
	
#ifdef MSDOS
	PKSD_T pKsd_t = phTTS->pKernelShareData; 
	DT_PIPE_T pipe_value;

#ifndef DTEX
	if(cm_cmd_sync(phTTS) == CMD_flushing)
		return(CMD_flushing);
	pKsd_t->spc_mode = SPC_mode_digital;
	signal_semaphore(&pKsd_t->isa_sem);
	wait_semaphore(&pKsd_t->text_sync);

	pipe_value = LAST_VOICE;
        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,&pipe_value,1);
#endif /*DTEX*/

#endif /* MSDOS */
	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_debug()       
 *
 *      Description: Debug command; described in dectalk.h 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_debug(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	cm_cmd_sync(phTTS);				/* mfg 04/27/1998 added 2 cm_cmd_sync*/
	pKsd_t->debug_switch = pCmd_t->params[0];
	//cm_cmd_sync(phTTS);

	return(CMD_success);
}

/* ******************************************************************
 *      Function Name: cm_cmd_gender()    
 *
 *      Description: Swt up.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int; Either  CMD_bad_string, CMD_bad_value or CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_gender(LPTTS_HANDLE_T phTTS)
{
	int cmd_type;
	
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	cmd_type =  cm_util_string_match(gender_options,pCmd_t->pString[0]);
	if (cmd_type == NO_STRING_MATCH)
		return(CMD_bad_string);

	switch (cmd_type)
	{
		case 0: /* masculine */
			pKsd_t->gender_switch = 1;
			return(CMD_success);
			break;
		case 1: /* neuter */
			pKsd_t->gender_switch = 2;
			return(CMD_success);
			break;
		case 2: /* feminine */
			pKsd_t->gender_switch = 3;
			return(CMD_success);
			break;
		default:
			return(CMD_bad_string);
	}
	return(CMD_success);
}

#ifdef DBGV_ON
/* ******************************************************************
 *      Function Name: #ifdef DBGV_ON cm_cmd_dbgv()       
 *
 *      Description: Debug command; set up 10 kernel variable for debug purpose 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS; Pointer to structure containing PKSD_T
 *										 and PCMD_T data structures.
 *
 *      Return Value: int CMD_success
 *
 *      Comments:
 *
 * *****************************************************************/
int cm_cmd_dbgv(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	short i;

	for (i=0;i<10;++i)
	pKsd_t->dbgv[i] = pCmd_t->params[i];

	return(CMD_success);
}
#endif // DBGV_ON

#ifdef SW_VOLUME
/* tek 08aug99
 * deal with "tone volume" commands
 */
/* ******************************************************************
 *      Function Name: #ifdef SW_VOLUME vol_tone()
 *
 *      Description:
 *
 *      Arguments: int volume
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/

void vol_tone(int volume)
{
	if (volume>100)
		volume=100;
	if (volume<0)
		volume=0;
	KS.ToneVolume = volume;
}
#endif /*SW_VOLUME*/
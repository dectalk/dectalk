/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
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
 *    File Name:        APItest.H
 *    Author:           Jie Lee
 *    Creation Date:    03/02/98
 *
 *    Functionality:	API Function Test for DTtester
 *
 ***********************************************************************
 *    Revision History:
 *	Rev.	Who		Date		Description
 *	----	---		----------	----------------------------------------
 *	001		cab		04/05/2002	Added error check to api fn
 *								Rename TestDictionary to TestUserDictionary
 *	002		cab		04/07/2002	Added ApiStatus
 *	003		cab		04/10/2002	Added TestResume, TestGetStatusHelp
 *	004		cab		04/22/2002	Added TestTyping()
 *	005		cab		04/23/2002	Added TCHAR
 *	006		cab		07/17/2002	Fixed typo
 ***********************************************************************/

#include <stdio.h>
#ifdef APITEST
#define APITEST_CPP
#endif

/* Function Prototypes */

int			CheckApiCall(TCHAR []);
void        ErrorOut( TCHAR * );
void        PutStdOut( TCHAR * );
void        OutputHelp( void );
int         ParseArgs( int, TCHAR ** );
//MMRESULT    SpeakCmdLine( int ac, char **av, int firstIndex );
//MMRESULT    SpeakStdin( void );
//BOOL        CtrlHandler( DWORD dwCtrlType );

/* API test Functions */
//void		TestOneLang(LPTTS_HANDLE_T phTTS, char * lang);
MMRESULT		ApiStatus(MMRESULT);
void			DtCallBackRoutine( LONG, LONG, DWORD, UINT );	// CallBack func. for StartupEx
void			TestApiFn(TCHAR []);
int				TestTTSCloseLang( TCHAR * );
int				TestTTSEnumLangs();
void			TestTTSGetCaps( void );
void			TestTTSGetFeatures( void );
void			TestTTSGetStatus( LPTTS_HANDLE_T, DWORD );
void			TestTTSGetStatusHelp( LPDWORD, LPDWORD, DWORD, DWORD, DWORD ); 
void			TestLang(TCHAR *, int, int, LPTTS_HANDLE_T);
void			TestTTSLogHelp( LPTTS_HANDLE_T, TCHAR * );
void			TestTTSLog( LPTTS_HANDLE_T, TCHAR *, DWORD );
void			TestTTSMemory( LPTTS_HANDLE_T, int );
int				TestML();
void			TestTTSPause( LPTTS_HANDLE_T );
ULONG			TestTTSReserved1(int, int);
void			TestTTSReset( LPTTS_HANDLE_T, int, int );
void			TestTTSResume( LPTTS_HANDLE_T );
void			TestTTSRate( LPTTS_HANDLE_T );
void			TestTTSSetLanguage( LPTTS_HANDLE_T, LANGUAGE_T );
void			TestTTSSetSpeaker( LPTTS_HANDLE_T, int );
void			TestTTSSelectLang( LPTTS_HANDLE_T, unsigned int );
void			TestTTSSpeak( LPTTS_HANDLE_T, TCHAR [], int, int, int);
void			TestTTSGetPhVdefParams(LPTTS_HANDLE_T);
MMRESULT		TestTTSShutdown( LPTTS_HANDLE_T );
unsigned int	TestTTSStartLang( TCHAR *, int );
MMRESULT		TestTTSStartup( LPTTS_HANDLE_T, DWORD);
MMRESULT		TestTTSStartupEx( LPTTS_HANDLE_T, DWORD);
void			TestTTSSync( LPTTS_HANDLE_T, int );
void			TestTTSTyping( LPTTS_HANDLE_T );
void			TestTTSUserDictionary( LPTTS_HANDLE_T, TCHAR * );
void			TestTTSVersion();
void			TestTTSVersionEx( void );
void			TestTTSWavHelp( LPTTS_HANDLE_T, TCHAR * );
void			TestTTSWav( LPTTS_HANDLE_T, TCHAR *, DWORD );
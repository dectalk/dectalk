/************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
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
 *    File Name:    opthread.h
 *    Author:       Bill Hallahan
 *    Creation Date:15-NOV-1995
 *
 *    Functionality:
 *    This file contains type definitions and function prototypes for 
 *    thread functions that can be used achieve operating system and  
 *    platform independence for a code base. The implementation of    
 *    these function is in file "opthread.c".Currently, the following 
 *    operating systems and platforms are supported;                  
 *                                                                    
 *                                                                    
 *      Digital UNIX on Alpha                                         
 *      OpenVMS on Alpha                                              
 *      Windows NT on Alpha                                           
 *      Windows NT on Intel                                           
 *      Windows 95 on Intel                                           
 *                                                                    
 *                                                                    
 *  The following functions are supported.                            
 *                                                                    
 *                                                                    
 *      HTHREAD_T OP_CreateThread( THREAD_STACK_SIZE_T StackSize,     
 *                                 THREAD_PROCEDURE_T ThreadRoutine,  
 *                                 void * pThreadData );              
 *                                                                    
 *      THREAD_PRIORITY_T OP_GetThreadPriority( HTHREAD_T pThread );  
 *                                                                    
 *      unsigned int OP_SetThreadPriority( HTHREAD_T pThread,         
 *                               THREAD_PRIORITY_T ThreadPriority );  
 *                                                                    
 *      void OP_ExitThread( THREAD_STATUS_T ThreadStatus );           
 *                                                                    
 *      unsigned int OP_WaitForThreadTermination( HTHREAD_T pThread,  
 *                                 PTHREAD_STATUS_T pThreadStatus );  
 *                                                                    
 *      HMUTEX_T OP_CreateMutex();                                    
 *                                                                    
 *      void OP_DestroyMutex( HMUTEX_T pMutex );                      
 *                                                                    
 *      void OP_LockMutex( HMUTEX_T pMutex );                         
 *                                                                    
 *      void OP_UnlockMutex( HMUTEX_T pMutex )                        
 *                                                                    
 *      HEVENT_T OP_CreateEvent( unsigned int bManualReset,           
 *                               unsigned int bInitialState );        
 *                                                                    
 *      void OP_DestroyEvent( HEVENT_T pEvent );                      
 *                                                                    
 *      void OP_SetEvent( HEVENT_T pEvent );                          
 *                                                                    
 *      void OP_ResetEvent( HEVENT_T pEvent );                        
 *                                                                    
 *      unsigned int OP_WaitForEvent( HEVENT_T pEvent,                
 *                                    unsigned int uiMilliSeconds );  
 *                                                                    
 *      void OP_Sleep( unsigned int uiMilliSeconds );                 
 *
 ***********************************************************************
 * turn on CSECT_DEBUG to log critical section activity, and 
 * _LOG_CRITICAL_SECTIONS to get verbose (every lock/unlock) 
 * logging.
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  BH 		11/15/195	Initial release
 * 002	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 * 003	MGS		09/08/1997	Made change for osf build 
 * 004	tek		27may98		BATS ??? thread-lock routines
 * 005	MGS		11/03/1998	BATS #764
 * 006  ETT		11/10/1998	fixed pthread include for osf and added	
 *							this comment.
 * 007	ETT		11/19/1998	fixed stuff for osf...
 * 008	tek		04dec1998	bats 531: critical section logging
 * 009	mfg		07/29/1999	undefined process.h for WinCE
 * 010	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 011 	CAB		10/16/2000	Changed copyright info
 * 012	MGS		02/28/2001	Merged in base changes needed for ACCESS32 merge
 * 013 	CAB		03/01/2001 	updated copyright info
 * 014	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 015	MGS		06/19/2001	Solaris Port BATS#972
 * 016	MGS		04/11/2002	ARM7 port
 * 017	MFG		03/18/2002	added NOWIN support
 * 018  MFG		07/10/2002	Merged into code changes needed for the Mitsubishi CE/SH4 Project
 * 019	CAB		07/30/2002	Condensed repeated __osf__ code
 */


#ifndef  _OPTHREAD_H_
#define _OPTHREAD_H_

#include "port.h"
#if !defined (ARM7) && !defined(OS_SYMBIAN)

#ifdef __cplusplus
extern "C" {
#endif

#ifndef FALSE
#define  FALSE  0
#endif

#ifndef TRUE
#define  TRUE  1
#endif

/**********************************************************************/
/*  Defines for multiple operating systems.                           */
/**********************************************************************/

#if defined __unix__ || defined _UNIX_LIKE_
#define OP_POSIX
#endif

#ifdef __VMS
#define OP_POSIX

#ifndef VXWORKS
#ifndef NULL
#define NULL ((void *)0)
#endif
#endif
#endif

#ifdef OP_POSIX

/**********************************************************************/
/*  UNIX and VMS (posix) include files.                               */
/**********************************************************************/
#if defined _UNIX_LIKE_
#ifdef __linux__
#define DCE_COMPAT
#endif
#include <pthread.h>
#endif
/**********************************************************************/
/*  UNIX and VMS macro to define the thread entry points.             */
/**********************************************************************/

#define  OP_THREAD_ROUTINE( Routine, Arg )  void Routine( Arg )

/**********************************************************************/
/*  Posix threads return type void.                                   */
/**********************************************************************/

#define  OP_THREAD_RETURN  return

/**********************************************************************/
/*  UNIX and VMS (posix) thread definitions.                          */
/**********************************************************************/

typedef  pthread_t *  HTHREAD_T;
typedef  pthread_t   THREAD_T;

/**********************************************************************/
/*  The _PRE_PLATINUM_POSIX_ defines are for posix implementations    */
/*  that preceded the Platinum version of Digital UNIX. The post-     */
/*  Platinum posix definitions match the actual posix standard.       */
/**********************************************************************/

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
#if defined(pthread_start_routine)
#define  _PRE_PLATINUM_POSIX_
#endif
#endif

#ifdef __osf__
#ifndef BLD_ML_DLL
#define  _PRE_PLATINUM_POSIX_
#endif
#endif

/* #ifdef __linux__
#define  _PRE_PLATINUM_POSIX_
#endif
*/

#ifdef _PRE_PLATINUM_POSIX_

typedef  pthread_startroutine_t  THREAD_PROCEDURE_T;
typedef  pthread_attr_t  THREAD_ATTR_T;
typedef  long  THREAD_STACK_SIZE_T;
typedef  pthread_addr_t  THREAD_STATUS_T;
#define  OP_CONDITIONAL_CONST
#else

/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
typedef  (void *(*start_routine)(void *))  THREAD_PROCEDURE_T;
#endif

#if defined _UNIX_LIKE_
typedef  void *(*THREAD_PROCEDURE_T)(void *);
#endif

#if defined _UNIX_LIKE_
#ifdef OP_POSIX 
typedef pthread_attr_t THREAD_ATTR_T;
#else
typedef const pthread_attr_t THREAD_ATTR_T;
#endif
#endif

typedef  size_t  THREAD_STACK_SIZE_T;
typedef  void *  THREAD_STATUS_T;


#define  pthread_condattr_default  NULL
#define  pthread_mutexattr_default  NULL
#define  OP_CONDITIONAL_CONST const

#endif  /* #ifdef _PRE_PLATINUM_POSIX_ */


typedef  THREAD_STATUS_T *  PTHREAD_STATUS_T;

typedef  int  THREAD_PRIORITY_T;

#ifndef PRI_OTHER_MIN
#define PRI_OTHER_MAX -20
#define PRI_OTHER_MIN  20
#endif


#define  OP_PRIORITY_LOWEST        PRI_OTHER_MIN
#define  OP_PRIORITY_HIGHEST       PRI_OTHER_MAX
#define  OP_PRIORITY_NORMAL        (( PRI_OTHER_MIN + PRI_OTHER_MAX ) / 2 )
#define  OP_PRIORITY_BELOW_NORMAL  (( OP_PRIORITY_NORMAL + PRI_OTHER_MIN ) / 2 )
#define  OP_PRIORITY_ABOVE_NORMAL  (( OP_PRIORITY_NORMAL + PRI_OTHER_MAX ) / 2 )

#define  OP_GET_THREAD_PRIORITY_ERROR  (-1)

/**********************************************************************/
/*  UNIX and VMS (posix) Mutex definitions.                           */
/**********************************************************************/

typedef  pthread_mutex_t  MUTEX_T;
typedef  MUTEX_T *  HMUTEX_T;
typedef HMUTEX_T LPCRITICAL_SECTION;
typedef MUTEX_T CRITICAL_SECTION;

#define EnterCriticalSection(x) OP_LockMutex(x)
#define LeaveCriticalSection(x) OP_UnlockMutex(x)

/**********************************************************************/
/*  UNIX and VMS (posix) Event definition.                            */
/**********************************************************************/

#define  OP_INFINITE        ((unsigned int)(-1))
#define  OP_WAIT_NORMAL     0
#define  OP_WAIT_TIMEOUT    1
#define  OP_WAIT_ABANDONED  2

typedef struct EVENT_TAG
{
  unsigned int bSignal;
  unsigned int bManualReset;
  pthread_mutex_t * pSignalMutex;
  pthread_cond_t * pSignalCondition;
} EVENT_T;

typedef EVENT_T * HEVENT_T;

#endif

/**********************************************************************/
/*  Windows 95 and Windows NT Include files and defines.              */
/**********************************************************************/

/**********************************************************************/
/*  Allow WIN32 (the old way) in addition to _WIN32.                  */
/**********************************************************************/

#ifdef WIN32
#ifndef _WIN32
#define _WIN32
#endif
#endif

#ifdef _WIN32

/**********************************************************************/
/*  Windows include file.                                             */
/**********************************************************************/
#ifndef UNDER_CE
#include <process.h>
#endif
#include <windows.h>

#include "coop.h"


/**********************************************************************/
/*  Windows macro to define the thread entry points.                  */
/**********************************************************************/

#define  OP_THREAD_ROUTINE( Routine, Arg )  DWORD Routine( Arg )

/**********************************************************************/
/*  Windows threads return type DWORD.                                */
/**********************************************************************/

#define  OP_THREAD_RETURN  return 0

/**********************************************************************/
/*  Windows thread definitions.                                       */
/**********************************************************************/

typedef  DT_HANDLE  HTHREAD_T;

typedef  unsigned int ( __stdcall * THREAD_PROCEDURE_T )( void * );
typedef  unsigned int  THREAD_STATUS_T;
typedef  THREAD_STATUS_T *  PTHREAD_STATUS_T;

typedef  long  THREAD_STACK_SIZE_T;
typedef  int  THREAD_PRIORITY_T;

// tek 27may98
typedef struct tlocktag 
{
	volatile DWORD dwLock;
	volatile DWORD dwCount;
	volatile DWORD dwThread;
} TLOCK, *PTLOCK;

#define DECLARE_TLOCK(x) TLOCK x={0,0,0}



#define  OP_PRIORITY_LOWEST         THREAD_PRIORITY_LOWEST
#define  OP_PRIORITY_BELOW_NORMAL   THREAD_PRIORITY_BELOW_NORMAL
#define  OP_PRIORITY_NORMAL         THREAD_PRIORITY_NORMAL
#define  OP_PRIORITY_ABOVE_NORMAL   THREAD_PRIORITY_ABOVE_NORMAL
#define  OP_PRIORITY_HIGHEST        THREAD_PRIORITY_HIGHEST

#define  OP_GET_THREAD_PRIORITY_ERROR  THREAD_PRIORITY_ERROR_RETURN

/**********************************************************************/
/*  Windows Mutex definitions.                                        */
/**********************************************************************/
// tek 04dec98 bats 531 shims for debugging critical sections
#ifdef CSECT_DEBUG
#ifdef _WIN32
typedef struct TCS {
	DWORD dwThreadid;
	DWORD dwLockCount;
	char szIdent[128];
	CRITICAL_SECTION csRealCriticalSection;
} TEKCRITICAL_SECTION, *LPTEKCRITICAL_SECTION;

#define CRITICAL_SECTION TEKCRITICAL_SECTION
#define LPCRITICAL_SECTION LPTEKCRITICAL_SECTION

VOID tekInitializeCriticalSection(LPTEKCRITICAL_SECTION lpCriticalSection, char *szIdent);
VOID tekDeleteCriticalSection( LPTEKCRITICAL_SECTION lpCriticalSection );
VOID tekEnterCriticalSection( LPTEKCRITICAL_SECTION lpCriticalSection);
VOID tekLeaveCriticalSection( LPTEKCRITICAL_SECTION lpCriticalSection );
#define EnterCriticalSection(x) tekEnterCriticalSection(x)
#define LeaveCriticalSection(x) tekLeaveCriticalSection(x)
#define InitializeCriticalSection(x) tekInitializeCriticalSection(x,#x)
#define DeleteCriticalSection(x) tekDeleteCriticalSection(x)
#endif //_WIN32
#endif //CSECT_DEBUG
// end debugging shims
typedef  CRITICAL_SECTION  MUTEX_T;
typedef  MUTEX_T *  HMUTEX_T;

/**********************************************************************/
/*  Windows Event definitions.                                        */
/**********************************************************************/

#define  OP_INFINITE        INFINITE
#define  OP_WAIT_NORMAL     WAIT_OBJECT_0
#define  OP_WAIT_TIMEOUT    WAIT_TIMEOUT
#define  OP_WAIT_ABANDONED  WAIT_ABANDONED

typedef  DT_HANDLE  HEVENT_T;

#endif

/**********************************************************************/
/*  Function Prototypes.                                              */
/**********************************************************************/

HTHREAD_T OP_CreateThread( THREAD_STACK_SIZE_T StackSize,
                           THREAD_PROCEDURE_T ThreadRoutine,
                           void * pThreadData );

THREAD_PRIORITY_T OP_GetThreadPriority( HTHREAD_T pThread );

unsigned int OP_SetThreadPriority( HTHREAD_T pThread,
                                   THREAD_PRIORITY_T ThreadPriority );

void OP_ExitThread( THREAD_STATUS_T ThreadStatus );

/* GL 04/21/1997  change this for OSF build */
#if defined WIN32 && !defined NOWIN
unsigned int OP_WaitForThreadTermination( HTHREAD_T pThread,
                                          PTHREAD_STATUS_T pThreadStatus );
#endif
#if defined _UNIX_LIKE_ || defined NOWIN
unsigned int OP_WaitForThreadTermination( HTHREAD_T pThread,
                                          PTHREAD_STATUS_T pThreadStatus,
					  unsigned int uiMilliSeconds );
#endif

HMUTEX_T OP_CreateMutex();

void OP_DestroyMutex( HMUTEX_T pMutex );

void OP_LockMutex( HMUTEX_T pMutex );

void OP_UnlockMutex( HMUTEX_T pMutex );

HEVENT_T OP_CreateEvent( unsigned int bManualReset,
                         unsigned int bInitialState );

void OP_DestroyEvent( HEVENT_T pEvent );

void OP_SetEvent( HEVENT_T pEvent );

void OP_ResetEvent( HEVENT_T pEvent );

unsigned int OP_WaitForEvent( HEVENT_T pEvent,
                              unsigned int uiMilliSeconds );

void OP_Sleep( unsigned int uiMilliSeconds );

#ifdef WIN32
BOOL ThreadLock(TLOCK *tlLock, DWORD dwTimeout);
void ThreadUnlock(TLOCK *);	
#endif

#if defined __linux__ || defined _APPLE_MAC_ || defined __QNX__
typedef pthread_mutex_t TLOCK;
#define DECLARE_TLOCK(x) pthread_mutex_t x=PTHREAD_MUTEX_INITIALIZER;

int ThreadLock(TLOCK *tlLock, unsigned int dwTimeout);
void ThreadUnlock(TLOCK *);	
#endif

#if defined __osf__ || defined VXWORKS || defined _SPARC_SOLARIS_
typedef pthread_mutex_t *TLOCK;
#define DECLARE_TLOCK(x) extern pthread_mutex_t *x
int ThreadLock(TLOCK *tlLock, unsigned int dwTimeout);
void ThreadUnlock(TLOCK *);
#endif

#ifdef __cplusplus
}  /* End extern "C" */
#endif

#endif // ARM7

#endif

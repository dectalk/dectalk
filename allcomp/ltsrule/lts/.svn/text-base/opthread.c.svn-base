/************************************************************
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
 *    File Name:		opthread.c
 *    Author:			Bill Hallahan
 *    Creation Date:	11/15/95
 *
 *    Functionality:	
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  TQL 	05/21/1997	BATS#357  Add the code for __osf__ build
 * 002  GL 		06/04/1997	BATS#381  Fix the thread starting problem
 * 003	tek		27may98		BATS ???  add ThreadLocks for NT/95
 * 004  ETT		10/05/1998  Added Linux code.
 * 005  ETT		11/12/1998	fixed stuff for osf.
 * 006	ETT		11/19/1998	fixed stuff for osf...
 * 007	tek		04dec1998	Added critical section logging WIN32 ONLY
 * 008	mfg		22mar1999	include cemm.h for beginthread and endthread support for WinCE 211
 * 009	mfg		10oct2000	include cemm.h for all CE builds
 * 010 	CAB		10/16/2000	Changed copyright info
 * 011	MGS		02/08/2001	Fixed OP_WaitForEvent when it isn't supposed to wait forever
 * 012	MGS		05/09/2001	Access32 Integration and Some VxWorks porting BATS#972
 * 013  CAB		05/14/2001	Updated copyright
 * 014	MGS		05/21/2001	More VxWorks porting
 * 015	MFG		05/29/2001	Included dectalkf.h
 * 016  CAB		06/01/2001	Commenteed #if
 * 017	MGS		06/19/2001	Solaris Port BATS#972
 * 018	MFG		03/18/2002	added NOWIN support
 * 019  MFG		07/10/2002	Merged into code changes needed for the Mitsubishi CE/SH4 Project
 * 020	CAB		09/12/2002	Updated copyright info
 */
/**********************************************************************/
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This file contains thread functions that can be used to         */
/*    achieve operating system and platform independence for thread   */
/*    functions. Applications using these functions must include file */
/*    "opthread.h". Currently, the following operating systems and    */
/*    platforms are supported;                                        */
/*                                                                    */
/*                                                                    */
/*      Digital UNIX on Alpha                                         */
/*      OpenVMS on Alpha                                              */
/*      Windows NT on Alpha                                           */
/*      Windows NT on Intel                                           */
/*      Windows 95 on Intel                                           */
/*                                                                    */
/*                                                                    */
/*  The following functions are supported.                            */
/*                                                                    */
/*                                                                    */
/*      HTHREAD_T OP_CreateThread( THREAD_STACK_SIZE_T StackSize,     */
/*                                 THREAD_PROCEDURE_T ThreadRoutine,  */
/*                                 void * pThreadData );              */
/*                                                                    */
/*      THREAD_PRIORITY_T OP_GetThreadPriority( HTHREAD_T pThread );  */
/*                                                                    */
/*      unsigned int OP_SetThreadPriority( HTHREAD_T pThread,         */
/*                               THREAD_PRIORITY_T ThreadPriority );  */
/*                                                                    */
/*      void OP_ExitThread( THREAD_STATUS_T ThreadStatus );           */
/*                                                                    */
/*      unsigned int OP_WaitForThreadTermination( HTHREAD_T pThread,  */
/*                                 PTHREAD_STATUS_T pThreadStatus );  */
/*                                                                    */
/*      HMUTEX_T OP_CreateMutex();                                    */
/*                                                                    */
/*      void OP_DestroyMutex( HMUTEX_T pMutex );                      */
/*                                                                    */
/*      void OP_LockMutex( HMUTEX_T pMutex );                         */
/*                                                                    */
/*      void OP_UnlockMutex( HMUTEX_T pMutex )                        */
/*                                                                    */
/*      HEVENT_T OP_CreateEvent( unsigned int bManualReset,           */
/*                               unsigned int bInitialState );        */
/*                                                                    */
/*      void OP_DestroyEvent( HEVENT_T pEvent );                      */
/*                                                                    */
/*      void OP_SetEvent( HEVENT_T pEvent );                          */
/*                                                                    */
/*      void OP_ResetEvent( HEVENT_T pEvent );                        */
/*                                                                    */
/*      unsigned int OP_WaitForEvent( HEVENT_T pEvent,                */
/*                                    unsigned int uiMilliSeconds );  */
/*                                                                    */
/*      void OP_Sleep( unsigned int uiMilliSeconds );                 */
/*		BOOL ThreadLock(TLOCK *, dwTimeoutSeconds);	      */
/*		void ThreadUnlock(TLOCK *);			      */
/*                                                                    */
/* see opthread.c for the use of the CSECT_DEBUG macro for logging.   */
/**********************************************************************/
/**********************************************************************/

/**********************************************************************/
/*  Include files                                                     */
/**********************************************************************/
#ifndef OS_PALM
#include <stdio.h>
#endif
#ifdef VXWORKS
#include <errno.h>
#include <sched.h>
#endif
#include "dectalkf.h"
#include "opthread.h"


// mfg 22mar99 added for beginthread and endthread support
#if UNDER_CE
#include "cemm.h"
#endif


#if defined _UNIX_LIKE_

#include <stdlib.h>
#ifdef VXWORKS
#include <time.h> //for gettimeofday()
#else
#include <sys/types.h>
#include <sys/time.h> //for gettimeofday()
#endif
#include <unistd.h>
#endif
#if defined _UNIX_LIKE_
#include <errno.h>
#endif
/**********************************************************************/
/*  Symbol definitions.                                               */
/**********************************************************************/

#define  SECONDS_PER_MILLISECOND      0.001
#define  MILLISECONDS_PER_SECOND      1000
#define  NANOSECONDS_PER_MICROSECOND  1000
#define  NANOSECONDS_PER_MILLISECOND  1000000

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_CreateThread                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function creates a thread.                                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    StackSize        The threads stack size in bytes. If this       */
/*                     is set to zero, then the stack size is set     */
/*                     to a default value.                            */
/*                                                                    */
/*    ThreadRoutine    The start address of the thread routine.       */
/*                                                                    */
/*    pThreadData      A pointer to be passed to the new thread.      */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a pointer to thread data of type THREAD_T */
/*    that is used to reference to the newly created thread. A value  */
/*    of NULL is returned if the function fails.                      */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

HTHREAD_T OP_CreateThread( THREAD_STACK_SIZE_T StackSize,
                           THREAD_PROCEDURE_T ThreadRoutine,
                           void * pThreadData )
{
	HTHREAD_T pThread;
#ifdef VXWORKS
	int policy;
#endif
	
#ifdef OP_POSIX
	THREAD_ATTR_T ThreadAttr;
	
	/********************************************************************/
	/*  Allocate the thread handle.                                     */
	/********************************************************************/
	
	pThread = (HTHREAD_T)malloc( sizeof(pthread_t));
	
	if ( pThread == NULL )
	{
		return NULL;
	}
	
	/********************************************************************/
	/*  Create the thread using posix routines.                         */
	/********************************************************************/
	
#ifdef _PRE_PLATINUM_POSIX_
	if ( pthread_attr_create( &ThreadAttr ))
    {
		return NULL;
    }
	
#else
	/* linux uses non pre-platinum posix routines */
	if ( pthread_attr_init( &ThreadAttr ))
    {
		return NULL;
    }
#endif
#if !defined _UNIX_LIKE_
	if ( StackSize != 0 )
    {
		if ( pthread_attr_setstacksize( &ThreadAttr, StackSize ))
		{
			return NULL;
		}
    }
#endif
	
#ifdef __QNX__
	if (pthread_attr_setdetachstate(&ThreadAttr,PTHREAD_CREATE_DETACHED))
	{
		printf("invalid detach state\n");
		return(NULL);
	}
#endif
	
#ifdef VXWORKS
	policy=sched_getscheduler(0);
	printf("getscheduler returned%d sched_fifo=%d sched_rr=%d\n",policy,SCHED_FIFO,SCHED_RR);
	pthread_attr_setschedpolicy(&ThreadAttr,policy);
#endif
	
	if ( pthread_create( pThread,
#if defined __osf__
		ThreadAttr,
#elif defined VXWORKS
		&ThreadAttr,
#else
		&ThreadAttr,
#endif
		(THREAD_PROCEDURE_T)ThreadRoutine,
		pThreadData ) != 0 )
    {
		pThread = NULL;
    }
	
#ifdef _PRE_PLATINUM_POSIX_
	
	pthread_attr_delete( &ThreadAttr );
	
#else
	
	pthread_attr_destroy( &ThreadAttr );
	
#endif
	
#endif  /* OP_POSIX */
	
	
#ifdef _WIN32
	
	DWORD dwThreadAddr;
	
	pThread = (DT_HANDLE)_beginthreadex( NULL,
		StackSize,
		ThreadRoutine,
		pThreadData,
		0,
		&dwThreadAddr );
	
	if ((int)pThread == -1 )
	{
		pThread = NULL;
	}
	
#endif
	
	return pThread;
						   }

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_GetThreadPriority                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: December 11, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function gets the priority of a thread.                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pThread    A pointer of type THREAD_T that specifies a          */
/*               particular thread.                                   */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns the priority of the thread. The value of  */
/*    OP_GET_THREAD_PRIORITY_ERROR is returned if the function fails. */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

THREAD_PRIORITY_T OP_GetThreadPriority( HTHREAD_T pThread )
{

/* TQL 05/21/1997  change this for OSF build */
#if defined (OP_POSIX) && defined (WIN32)

  return pthread_getprio( *pThread );

#endif

#ifdef OP_POSIX 
#if defined _UNIX_LIKE_

#ifdef _PRE_PLATINUM_POSIX_

  return pthread_getprio( *pThread );

#else
  int iPriority;
  int iPolicy;
  struct sched_param SchedParam;

  if( pThread==0 || pthread_getschedparam( *pThread, &iPolicy, &SchedParam ) != 0 )
  {
    iPriority = OP_GET_THREAD_PRIORITY_ERROR;
  }
  else
  {
#ifdef POSIX_4D10
    iPriority = SchedParam.priority;
#else
    iPriority = SchedParam.sched_priority;
#endif
  }
  return iPriority;

#endif /* #ifdef _PRE_PLATINUM_POSIX_ */
#endif /* defined (__osf__) || defined (__linux__) */
#endif /* #ifdef OP_POSIX */

#ifdef _WIN32

  return GetThreadPriority( pThread );

#endif

}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_SetThreadPriority                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: December 11, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function sets the priority of a thread.                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pThread           A pointer of type THREAD_T that specifies a   */
/*                      particular thread.                            */
/*                                                                    */
/*                                                                    */
/*    ThreadPriority    The thread priority. It can be one of the     */
/*                      following constants or a value returned from  */
/*                      the OP_GetThreadPriority() function.          */
/*                                                                    */
/*                        OP_PRIORITY_LOWEST                          */
/*                        OP_PRIORITY_BELOW_NORMAL                    */
/*                        OP_PRIORITY_NORMAL                          */
/*                        OP_PRIORITY_ABOVE_NORMAL                    */
/*                        OP_PRIORITY_HIGHEST                         */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a value of FALSE if successful.           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

unsigned int OP_SetThreadPriority( HTHREAD_T pThread,
                                   THREAD_PRIORITY_T ThreadPriority )
{

/* TQL 05/21/1997  change this for OSF build */
#if defined (OP_POSIX) && defined (WIN32)

  if ( pthread_setprio( *pThread, ThreadPriority == -1 ))
  {
    return TRUE;
  }

#endif

#ifdef OP_POSIX 
#if defined _UNIX_LIKE_

#ifdef _PRE_PLATINUM_POSIX_

  if ( pthread_setprio( *pThread, ThreadPriority ) == -1 )
  {
    return TRUE;
  }

#else

  int iPolicy;
  struct sched_param SchedParam;

  if( pThread==0 || 0 != pthread_getschedparam( *pThread, &iPolicy, &SchedParam ))
  {
    return TRUE;
  }
  else
  {
#ifdef POSIX_4D10
    SchedParam.priority = ThreadPriority;
#else
    SchedParam.sched_priority = ThreadPriority;
#endif
    if( pthread_setschedparam( *pThread, iPolicy, &SchedParam ) != 0)
    {
      return TRUE;
    }
  }

#endif /* ifdef _PRE_PLATINUM_POSIX_ */
#endif /* defined (__osf__) || defined (__linux__) */
#endif /* ifdef OP_POSIX */

#ifdef _WIN32

  if ( ! SetThreadPriority( pThread, ThreadPriority ))
  {
    return TRUE;
  }

#endif

  return FALSE;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_ExitThread                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: December 5, 1995                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function is called from within a thread to terminate the   */
/*    thread.                                                         */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    ThreadStatus    A value of type THREAD_STATUS_T.                */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_ExitThread( THREAD_STATUS_T ThreadStatus )
{

#ifdef OP_POSIX

  pthread_exit( ThreadStatus );

#endif


#ifdef _WIN32

  _endthreadex( ThreadStatus );

#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_WaitForThreadTermination                             */
/*  Author: Bill Hallahan                                             */
/*  Date: December 5, 1995                                            */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function waits for a thread to terminate. The threads      */
/*    exit status is returned.                                        */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pThread          A pointer of type THREAD_T that specifies      */
/*                     a particular thread.                           */
/*                                                                    */
/*    pThreadStatus    A pointer of type THREAD_STATUS_T that points  */
/*                     to a location used to return the thread exit   */
/*                     value.                                         */
/*                                                                    */
/*    uiMilliSeconds   The time-out interval in milliseconds.         */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function will return a value of TRUE is an error occurs.   */
/*    Otherwise a value of FALSE is returned.                         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

unsigned int OP_WaitForThreadTermination( HTHREAD_T pThread,
					  /* TQL 05/21/1997  change this for OSF build */
#if defined WIN32 && !defined NOWIN
                                          PTHREAD_STATUS_T pThreadStatus )
#endif
#if defined _UNIX_LIKE_ || defined NOWIN
     PTHREAD_STATUS_T pThreadStatus,
  unsigned int uiMilliSeconds )
#endif
{
unsigned int uiStatus=0;

if ( pThread != 0 )
{
  
#ifdef OP_POSIX
  
  /******************************************************************/
  /*  Wait for the thread to exit.                                  */
  /******************************************************************/
#if defined _UNIX_LIKE_
  if ( pthread_join((*pThread), pThreadStatus ) == 0 )   
#else
    if ( pthread_join((*pThread), pThreadStatus ) != 0 )
#endif    
      {
	uiStatus = TRUE;
      }
    else
      {
#ifdef __osf__
	if( pthread_detach( pThread ) != 0 )
#else	
	if( pthread_detach( *pThread ) != 0 )
#endif
	  {
	    uiStatus = TRUE;
	  }
      }
  
  /******************************************************************/
  /*  Free the thread handle.                                       */
  /******************************************************************/

  free( pThread );

#endif	/* OP_POSIX */
  
#ifdef _WIN32

    /******************************************************************/
    /*  Wait for the thread to exit.                                  */
    /******************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
    WaitForSingleObject( pThread, INFINITE );
#endif
#if defined _UNIX_LIKE_
	WaitForSingleObject( pThread, uiMilliSeconds );
#endif

    uiStatus = ! GetExitCodeThread( pThread, pThreadStatus );

    /******************************************************************/
    /*  Free the thread handle.                                       */
    /******************************************************************/

    CloseHandle( pThread );

#endif	//_WIN32
  }

  return uiStatus;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_CreateMutex                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function allocates and initializes a mutex.                */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns a pointer of type LMUTEX_T. The returned  */
/*    pointer points to a system mutex. A value of NULL is            */
/*    returned if the function fails.                                 */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

HMUTEX_T OP_CreateMutex()
{
  HMUTEX_T pMutex;

  /********************************************************************/
  /*  Allocate memory for the mutex.                                  */
  /********************************************************************/

  pMutex = (HMUTEX_T)malloc( sizeof(MUTEX_T));

  if ( pMutex != NULL )
  {

/* TQL 05/21/1997  change this for OSF build */
#ifdef OP_POSIX
#ifdef WIN32
    if ( pthread_mutex_init( pMutex,
                             pthread_mutexattr_default ) != 0 )
    {
      free( pMutex );
      pMutex = NULL;
    }
#endif	/* ifdef WIN32 */
#endif	/* ifdef OP_POSIX */

#if defined _UNIX_LIKE_
#ifdef OP_POSIX
#ifdef _PRE_PLATINUM_POSIX_
    if ( pthread_mutex_init( pMutex, 
                             pthread_mutexattr_default ) != 0 )
    {
      free( pMutex );
      pMutex = NULL;
    }
#else
    pthread_mutexattr_t ThreadAttr;
    pthread_mutexattr_init( &ThreadAttr );

    if ( pthread_mutex_init( pMutex, &ThreadAttr ) != 0 )
    {
      free( pMutex );
      pMutex = NULL;
    }

#if defined _UNIX_LIKE_
    pthread_mutexattr_destroy( &ThreadAttr );
#else
    pthread_attr_destroy( &ThreadAttr );
#endif
#endif	/* ifdef _PRE_PLATINUM_POSIX_ */
#endif	/* ifdef OP_POSIX */
#endif	/* if defined (__osf__) || defined (__linux__) */

#ifdef _WIN32

    InitializeCriticalSection( pMutex );

#endif
      
  }

  return pMutex;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_DestroyMutex                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function deletes an unowned mutex.                         */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pMutex    A pointer of type HMUTEX_T.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_DestroyMutex( HMUTEX_T pMutex )
{
  /********************************************************************/
  /*  Free memory for the mutex.                                      */
  /********************************************************************/

  if ( pMutex != NULL )
  {
#ifdef OP_POSIX

    pthread_mutex_destroy( pMutex );

#endif

#ifdef _WIN32

    DeleteCriticalSection( pMutex );
    free( pMutex );

#endif
  }

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_LockMutex                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function locks a mutex.                                    */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pMutex    A pointer of type HMUTEX_T.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_LockMutex( HMUTEX_T pMutex )
{
  /********************************************************************/
  /*  Lock the mutex.                                                 */
  /********************************************************************/

#ifdef OP_POSIX

  pthread_mutex_lock( pMutex );

#endif

#ifdef _WIN32

  EnterCriticalSection( pMutex );

#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_UnlockMutex                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function unlocks a mutex.                                  */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pMutex    A pointer of type HMUTEX_T.                           */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_UnlockMutex( HMUTEX_T pMutex )
{
  /********************************************************************/
  /*  Unlock the mutex.                                               */
  /********************************************************************/

#ifdef OP_POSIX

  pthread_mutex_unlock( pMutex );

#endif

#ifdef _WIN32

  LeaveCriticalSection( pMutex );

#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_CreateEvent                                          */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function creates an event.                                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    bManualReset         Flag for manual-reset event.               */
/*                                                                    */
/*    bInitialState        Flag for initial state. If TRUE then the   */
/*                         event is signalled.                        */
/*                                                                    */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

HEVENT_T OP_CreateEvent( unsigned int bManualReset,
                         unsigned int bInitialState )
{
  HEVENT_T pEvent;

#ifdef OP_POSIX

  /********************************************************************/
  /*  Allocate memory for the event.                                  */
  /********************************************************************/

  pEvent = (HEVENT_T)malloc( sizeof(EVENT_T));

  if ( pEvent != NULL )
  {
    pEvent->bManualReset = bManualReset;
    pEvent->pSignalMutex = NULL;
    pEvent->pSignalCondition = NULL;

    /******************************************************************/
    /*  Allocate memory for the signal mutex.                         */
    /******************************************************************/

    pEvent->pSignalMutex =
      (pthread_mutex_t *)malloc( sizeof(pthread_mutex_t));

    if ( pEvent->pSignalMutex == NULL )
    {
      OP_DestroyEvent( pEvent );
      return NULL;
    }

    /******************************************************************/
    /*  Initialize the signal mutex.                                  */
    /******************************************************************/

    if ( pthread_mutex_init( pEvent->pSignalMutex,
                             pthread_mutexattr_default ) != 0 )
    {
      OP_DestroyEvent( pEvent );
      return NULL;
    }

    /******************************************************************/
    /*  Allocate memory for the events condition.                     */
    /******************************************************************/

    pEvent->pSignalCondition =
      (pthread_cond_t *)malloc( sizeof(pthread_cond_t));

    if ( pEvent->pSignalCondition == NULL )
    {
      OP_DestroyEvent( pEvent );
      return NULL;
    }

    /******************************************************************/
    /*  Initialize the events condition.                              */
    /******************************************************************/

    if ( pthread_cond_init( pEvent->pSignalCondition,
                            pthread_condattr_default ))
    {
      OP_DestroyEvent( pEvent );
      return NULL;
    }

    /******************************************************************/
    /*  Set the initial state of the event.                           */
    /******************************************************************/

    if ( bInitialState )
    {
      pEvent->bSignal = TRUE;
    }
    else
    {
      pEvent->bSignal = FALSE;
    }
  }

#endif	/* OP_POSIX */

#ifdef _WIN32

  pEvent = CreateEvent( NULL, bManualReset, bInitialState, NULL );

#endif

  return pEvent;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_DestroyEvent                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: November 29, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function deletes an event.                                 */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pEvent    A pointer to the event to be destroyed.               */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_DestroyEvent( HEVENT_T pEvent )
{

  if ( pEvent != NULL )
  {
#ifdef OP_POSIX

    /******************************************************************/
    /*  Free the event's condition.                                   */
    /******************************************************************/

    if ( pEvent->pSignalCondition != NULL )
    {
      pthread_cond_destroy( pEvent->pSignalCondition );
      free( pEvent->pSignalCondition );
    }

    /******************************************************************/
    /*  Free the event's condition mutex.                             */
    /******************************************************************/

    if ( pEvent->pSignalMutex != NULL )
    {
      pthread_mutex_destroy( pEvent->pSignalMutex );
    }

    /******************************************************************/
    /*  Free the event's signal mutex.                                */
    /******************************************************************/

    if ( pEvent->pSignalMutex != NULL )
    {
      pthread_mutex_destroy( pEvent->pSignalMutex );
    }

    /******************************************************************/
    /*  Free memory for the event.                                    */
    /******************************************************************/

    free( pEvent );
#endif	/* OP_POSIX */

#ifdef _WIN32

    CloseHandle( pEvent );

#endif
  }

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_SetEvent                                             */
/*  Author: Bill Hallahan                                             */
/*  Date: November 29, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function sets an event to the signalled state.             */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pEvent    A pointer to the event to be set to the               */
/*              signalled state.                                      */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_SetEvent( HEVENT_T pEvent )
{

#ifdef OP_POSIX

  /********************************************************************/
  /*  Set the event to the signalled state.                           */
  /********************************************************************/

  pthread_mutex_lock( pEvent->pSignalMutex );

  pEvent->bSignal = TRUE;

  /********************************************************************/
  /*  Broadcast to unblock all threads that are waiting on this       */
  /*  event.                                                          */
  /********************************************************************/

  pthread_cond_broadcast( pEvent->pSignalCondition );

  pthread_mutex_unlock( pEvent->pSignalMutex );

  return;

#endif

#ifdef _WIN32

  SetEvent( pEvent );

#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_ResetEvent                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: November 29, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function sets and event to the non-signalled state.        */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pEvent    A pointer to the event to be set to the               */
/*              non-signalled state.                                  */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_ResetEvent( HEVENT_T pEvent )
{

#ifdef OP_POSIX

  /********************************************************************/
  /*  Set the event to the non-signalled state.                       */
  /********************************************************************/

  pthread_mutex_lock( pEvent->pSignalMutex );
  pEvent->bSignal = FALSE;
  pthread_mutex_unlock( pEvent->pSignalMutex );

#endif

#ifdef _WIN32

  ResetEvent( pEvent );

#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_WaitForEvent                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: November 29, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function waits on an event.                                */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    pEvent            A pointer to the event.                       */
/*                                                                    */
/*    uiMilliSeconds    The time-out interval in milliseconds.        */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function returns an unsigned integer that is one of        */
/*    the following value.                                            */
/*                                                                    */
/*      OP_WAIT_NORMAL                                                */
/*      OP_WAIT_TIMEOUT                                               */
/*      OP_WAIT_ABANDONED                                             */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

unsigned int OP_WaitForEvent( HEVENT_T pEvent,
                              unsigned int uiMilliSeconds )
{
  unsigned int uiRet;
  int retcode=0;

#ifdef OP_POSIX
#if defined _UNIX_LIKE_
  struct timespec WaitTime;
  struct timespec AbsoluteTime;
  struct timeval AbsoluteTime_v;
#elif defined VXWORKS
  struct timespec WaitTime;
  struct timespec AbsoluteTime;
#else
  OP_CONDITIONAL_CONST struct timespec WaitTime;
  OP_CONDITIONAL_CONST struct timespec AbsoluteTime;
#endif	/* _linux_ */
  /********************************************************************/
  /*  Lock the event signal.                                          */
  /********************************************************************/
  
  pthread_mutex_lock( pEvent->pSignalMutex );
  
  /********************************************************************/
  /*  Wait for the event to become signalled. Use differnt waits      */
  /*  depending upon whether the wait is finite or infinite.          */
  /********************************************************************/
  
  if ( uiMilliSeconds == OP_INFINITE )
    {
      /******************************************************************/
      /*  Wait for the event FOREVER.                                   */
      /******************************************************************/
      
      while ( ! pEvent->bSignal )
	{
	  pthread_cond_wait( pEvent->pSignalCondition,
			     pEvent->pSignalMutex );
	}
      
      uiRet = OP_WAIT_NORMAL;
    }
  else
    {
      /******************************************************************/
      /*  Wait for the event or until a TIMEOUT occurs.                 */
      /******************************************************************/
      
      WaitTime.tv_sec =
	( uiMilliSeconds / 1000 );
      
      WaitTime.tv_nsec =
	NANOSECONDS_PER_MILLISECOND
        * ( uiMilliSeconds - ( MILLISECONDS_PER_SECOND * WaitTime.tv_sec ));
      
      // ETT 07/21/1998 pthread_get_expiration_np not defined in linux
      // use workaround
#if defined _UNIX_LIKE_ && !defined __osf__
      //returns usecs!
      gettimeofday(&AbsoluteTime_v, NULL);
      //TIMEVAL_TO_TIMESPEC(&AbsoluteTime_v,&AbsoluteTime);
      AbsoluteTime.tv_nsec = AbsoluteTime_v.tv_usec * 1000;
      AbsoluteTime.tv_sec = AbsoluteTime_v.tv_sec;
      AbsoluteTime.tv_nsec += WaitTime.tv_nsec;
      if (AbsoluteTime.tv_nsec>999999999)
	{
	  AbsoluteTime.tv_nsec-=1000000000;
	  AbsoluteTime.tv_sec+=1;
	}
      AbsoluteTime.tv_sec += WaitTime.tv_sec;
#elif defined VXWORKS
	clock_gettime(CLOCK_REALTIME,&AbsoluteTime);
      AbsoluteTime.tv_nsec += WaitTime.tv_nsec;
      if (AbsoluteTime.tv_nsec>999999999)
	{
	  AbsoluteTime.tv_nsec-=1000000000;
	  AbsoluteTime.tv_sec+=1;
	}
      AbsoluteTime.tv_sec += WaitTime.tv_sec;
#else
      pthread_get_expiration_np( &WaitTime, &AbsoluteTime );
#endif	/* _linux_ */ 
      uiRet = 0;
      
      while (( ! pEvent->bSignal ) && ( uiRet != OP_WAIT_TIMEOUT ))
	{
	  if ( (retcode=pthread_cond_timedwait( pEvent->pSignalCondition,
				       pEvent->pSignalMutex,
				       &AbsoluteTime )) != 0 )
	    {
	      if (retcode==ETIMEDOUT)
	    {
	      uiRet = OP_WAIT_TIMEOUT;
	    }
	    }
	  else
	    {
	      uiRet = OP_WAIT_NORMAL;
	    }
	}
    }
  
  /********************************************************************/
  /*  If this is a manual reset event then reset the event.           */
  /********************************************************************/

  if ( (! (pEvent->bManualReset))  &&  (uiRet == OP_WAIT_NORMAL))
    {
      pEvent->bSignal = FALSE;
    }
  
  /********************************************************************/
  /*  Unlock the event signal.                                        */
  /********************************************************************/
  
  pthread_mutex_unlock( pEvent->pSignalMutex );
  
#endif	/* OP_POSIX */
  
  
#ifdef _WIN32
  
  uiRet = WaitForSingleObject( pEvent, uiMilliSeconds );
  
#endif
  
  return uiRet;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: OP_Sleep                                                */
/*  Author: Bill Hallahan                                             */
/*  Date: November 30, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function put the thread to sleep for a specified number    */
/*    of milliseconds. A sleep time of zero will cause the thread to  */
/*    give up the remainder of it's timeslice.                        */
/*                                                                    */
/*                                                                    */
/*  Input:                                                            */
/*                                                                    */
/*    uiMilliSeconds    The sleep time in milliseconds.               */
/*                                                                    */
/*  Output:                                                           */
/*                                                                    */
/*    This function has no return value.                              */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void OP_Sleep( unsigned int uiMilliSeconds )
{

#if defined _UNIX_LIKE_

#if defined _UNIX_LIKE_ && !defined __osf__
  struct timespec SleepTime;
  struct timespec Time;
#else
  OP_CONDITIONAL_CONST struct timespec SleepTime;
  OP_CONDITIONAL_CONST struct timespec Time;
#endif
  Time.tv_sec=0;
  Time.tv_nsec=0;

  if ( uiMilliSeconds == 0 )
  {

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
    pthread_yield();
#endif

#if defined _UNIX_LIKE_
#ifdef _PRE_PLATINUM_POSIX_
    pthread_yield();
#else
    sched_yield();
#endif /* _PRE_PLATINUM_POSIX_ */
#endif /* if defined (__osf__) || defined (__linux__) */
  }
  else
    {
      SleepTime.tv_sec =
	(unsigned int)( (double)uiMilliSeconds/1000 );
      
      // why do we have to make this so complicated???
      //      SleepTime.tv_nsec =
      //	NANOSECONDS_PER_MILLISECOND
      //	* ( uiMilliSeconds - ( MILLISECONDS_PER_SECOND * SleepTime.tv_sec ));
      // we know there are 10^6 nsecs in a millisec right?
      SleepTime.tv_nsec = 1000000*(double)uiMilliSeconds;
      
      nanosleep( &SleepTime, &Time);
    }
  
#endif /* __unix__ */
  
  
#ifdef __VMS

  /********************************************************************/
  /*  VMS will not have kernel threads until version 7.0, so for now  */
  /*  a sleep will just cause the thread to give up the remainder of  */
  /*  it's timeslice.                                                 */
  /********************************************************************/

  pthread_yield();

#endif


#ifdef _WIN32

  Sleep( uiMilliSeconds );

#endif

  return;
}

//////////////////////////////////////////////////////////////////////
// tek 27may98: new routines for lightweight, initializable locks.
// Implementation of code that runs once per instance may require the
// ability to use a lock without a safe place to programmatically
// initialize the lock. This set of routines implements a lock/unlock
// pair using a lock variable that can be initialized by the compiler
// or loader and thus can be used to arbitrate thread-startup activities.
// 
// the lock variable is declared and initialized with the DECLARE_TLOCK
// macro.
//
// These locks use the "thread ID" to allow nested locks within the same
// thread. 
///////////////////////////////////////////////////////////////////////
#define TL_ATTEMPTSPERSECOND (50)
#define TL_MSPERATTEMPT (1000/TL_ATTEMPTSPERSECOND)

#if defined _UNIX_LIKE_

// tek 27may98 these are not implemented for u*ix yet.
int ThreadLock(TLOCK *tlLock, unsigned int dwTimeout)
{
  int gotit=0;
  int total_wait_usec;
  int wait_time=0;
  
  total_wait_usec=dwTimeout * 1000;
  
  while (( wait_time < total_wait_usec) )
    {
#ifdef  __osf__
      /* ETT 11/19/1998 trylock just does not work! 
	 no idea why.  */
      gotit=pthread_mutex_lock(*tlLock);
#else
      gotit=pthread_mutex_trylock(tlLock);
#endif
      if (gotit!=0)
	{
	  if (gotit==EBUSY)
	    {
	      OP_Sleep(TL_MSPERATTEMPT);
	      wait_time+=TL_MSPERATTEMPT;
	    }
	  else
	    {
	      return(0);
	    }
	}
      else
	{
	  return(1);
	}
    }
  return(0);
}

void ThreadUnlock(TLOCK *tlLock)	
{
#ifdef __osf__
  pthread_mutex_unlock(*tlLock);
#else
  pthread_mutex_unlock(tlLock);
#endif
}

#endif // __osf__ || __linux__ || VXWORKS

#ifdef _WIN32
#define VERIFY_TLOCKS	// define this to check locks for consistency,
						// or don't define it for speed.
#ifdef _DEBUG
#include <mmsystem.h> // for timeGetTime()
#include <stdio.h> // for sprintf()
//#define DEBUG_TLOCK	// turn this on to see lock traffic
#endif //_DEBUG

#ifndef UNDER_CE
#include <assert.h>
#endif
BOOL ThreadLock(TLOCK *ptlLock,DWORD dwTimeout)
{
	// take the lock. Timeout is in seconds, but internally
	// we wait far shorter times. Return is TRUE if we get the
	// lock, FALSE if we timeout.
	DWORD dwLoopLimit;
	DWORD dwLoopCount=0;
	DWORD dwThreadId=0;
	BOOL bGotLock=TRUE;

	dwThreadId = GetCurrentThreadId();
	dwLoopLimit = dwTimeout*TL_ATTEMPTSPERSECOND;

	// spin to get the lock. (1 means locked)
	while (0 != InterlockedExchange((long *)(&ptlLock->dwLock),1))
	{
		// did not get it, or we already have it.
		// check the owning thread to see if we're the owner.
		if (ptlLock->dwThread == dwThreadId)
		{
			// we own it. bGotLock is already TRUE.
			break;
		}
		dwLoopCount++;
		if (dwLoopCount > dwLoopLimit)
		{
			bGotLock=FALSE;

#ifdef _DEBUG_TLOCK
		{
			char szTemp[256];
			sprintf(szTemp,"TLock: thread %08lx FAILED to lock %08lx, owned by %08lx at %lu\n",
				dwThreadId, (DWORD)ptlLock, ptlLock->dwThread, timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG_TLOCK
			break;
		}
		OP_Sleep(TL_MSPERATTEMPT);
	}
	if (bGotLock) // if we own it, by hook or by crook..
	{
		ptlLock->dwCount++;

#ifdef _DEBUG_TLOCK
		{
			char szTemp[256];
			sprintf(szTemp,"TLock: thread %08lx locked %08lx, count %08lx at %lu\n",
				dwThreadId, (DWORD)ptlLock, ptlLock->dwCount, timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG_TLOCK

		if (ptlLock->dwCount == 1)
		{
			// first time in. Verify that the lock is sane by
			// checking the ThreadId
#ifdef VERIFY_TLOCKS
#ifndef UNDER_CE
			assert(ptlLock->dwThread == 0);
#endif
#endif //VERIFY_TLOCKS
			// set the thread ID
			ptlLock->dwThread = dwThreadId;
		}
	}
	// all done..
	return (bGotLock);
}

void ThreadUnlock(TLOCK *ptlLock)	
{
	// unlock the lock..
	DWORD dwThreadId = GetCurrentThreadId();
	// verify that the lock is locked.
#ifndef UNDER_CE
#ifdef VERIFY_TLOCKS
	// verify that the lock is locked.
	assert(ptlLock->dwLock == 1);
#endif //VERIFY_TLOCKS
	// ALWAYS verify that we're the owner..
	assert(ptlLock->dwThread == dwThreadId);
#endif
	// decrement the lock count.
	ptlLock->dwCount--;

#ifdef _DEBUG_TLOCK
		{
			char szTemp[256];
			sprintf(szTemp,"TLock: thread %08lx unlocking %08lx, count %08lx at %lu\n",
				dwThreadId, (DWORD)ptlLock, ptlLock->dwCount, timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG_TLOCK
	// if we hit zero, free the lock.
	if (ptlLock->dwCount == 0)
	{
		// clear the thread ID
		ptlLock->dwThread = 0;
		InterlockedExchange((long *)(&ptlLock->dwLock),0);

#ifdef _DEBUG_TLOCK
		{
			char szTemp[256];
			sprintf(szTemp,"TLock: thread %08lx unlocked %08lx at %lu\n",
				dwThreadId, (DWORD)ptlLock, timeGetTime());
			OutputDebugString(szTemp);
		}
#endif //_DEBUG_TLOCK
	}

}
#endif //WIN32


// tek 04dec98 bats 531
// handle critical section debug shims..
#ifdef CSECT_DEBUG
#ifdef _WIN32
#include <stdio.h>
#include "kernel.h" // for debugging log stuff
// un-override the system calls
#undef EnterCriticalSection
#undef LeaveCriticalSection
#undef InitializeCriticalSection
#undef DeleteCriticalSection
#undef CRITICAL_SECTION
#undef LPCRITICAL_SECTION


VOID tekInitializeCriticalSection(LPTEKCRITICAL_SECTION lpCriticalSection, char *szIdent)
{
	char szTemp[256];
	DWORD dwThread = GetCurrentThreadId();
	sprintf(szTemp, "CS 0x%08x (%s) initialized by thread %08lx at %ld\n",
		lpCriticalSection, szIdent,dwThread ,timeGetTime());
	OutputDebugString(szTemp);
	InitializeCriticalSection( &lpCriticalSection->csRealCriticalSection);
	lpCriticalSection->dwThreadid = 0;
	strncpy(lpCriticalSection->szIdent,szIdent,64);
	lpCriticalSection->szIdent[63] = '\0';
	lpCriticalSection->dwLockCount=0;
	return;
}

VOID tekDeleteCriticalSection( LPTEKCRITICAL_SECTION lpCriticalSection )
{
	char szTemp[256];
	sprintf(szTemp, "CS 0x%08x deleted by thread %08lx at %ld\n",
		lpCriticalSection, GetCurrentThread(),timeGetTime());
	OutputDebugString(szTemp);
	DeleteCriticalSection( &lpCriticalSection->csRealCriticalSection);
	return;
}

VOID tekEnterCriticalSection( LPTEKCRITICAL_SECTION lpCriticalSection)
{
	char szTemp[256];
	DWORD dwThreadId;
	BOOL bWillBlock=FALSE;

	dwThreadId = GetCurrentThreadId();

#ifdef _LOG_CRITICAL_SECTIONS
	sprintf(szTemp, "-->CS 0x%08x entering by thread %08lx at %ld\n",
		lpCriticalSection, GetCurrentThread(),timeGetTime());
	OutputDebugString(szTemp);
#endif //LOG_CRITICAL_SECTIONS

	// see if we'll block..
	if (  (lpCriticalSection->dwThreadid != 0)
		&&(lpCriticalSection->dwThreadid != dwThreadId)
		)
	{
		// we'll block.
		sprintf(szTemp,"CS 0x%08lx (%s) will block thread %08lx; owned by %08lx at %ld\n",
			lpCriticalSection,lpCriticalSection->szIdent,
			dwThreadId, lpCriticalSection->dwThreadid, timeGetTime());
		OutputDebugString(szTemp);
		bWillBlock = TRUE;
	}

	EnterCriticalSection( &lpCriticalSection->csRealCriticalSection);
	if (bWillBlock)
	{
		// made it in..
		sprintf(szTemp,"Blocked CS 0x%08lx entered by %08lx at %ld\n",
			lpCriticalSection,dwThreadId,timeGetTime());
		OutputDebugString(szTemp);
	}

	// see if this is a new entry
	if (lpCriticalSection->dwThreadid == 0)
	{
		lpCriticalSection->dwThreadid = dwThreadId;
		if (lpCriticalSection->dwLockCount)
		{
			sprintf(szTemp,"***??? CS %08lx (%s) lock count not zero?\n",
				lpCriticalSection, lpCriticalSection->szIdent);
			OutputDebugString(szTemp);
		}
		lpCriticalSection->dwLockCount = 1;
	}
	else
	{
		lpCriticalSection->dwLockCount++;
	}


#ifdef _LOG_CRITICAL_SECTIONS
	sprintf(szTemp, "---->CS 0x%08x entered by thread %08lx at %ld\n",
		lpCriticalSection, dwThreadId,timeGetTime());
	OutputDebugString(szTemp);
#endif //LOG_CRITICAL_SECTIONS

	return;
}


VOID tekLeaveCriticalSection( LPTEKCRITICAL_SECTION lpCriticalSection )
{
	char szTemp[256];
#ifdef _LOG_CRITICAL_SECTIONS
	sprintf(szTemp, "<--CS 0x%08x leaving by thread %08lx at %ld\n",
		lpCriticalSection, GetCurrentThread(),timeGetTime());
	OutputDebugString(szTemp);
#endif //LOG_CRITICAL_SECTIONS
	LeaveCriticalSection( &lpCriticalSection->csRealCriticalSection);	
	lpCriticalSection->dwLockCount--;
	if (lpCriticalSection->dwLockCount == 0)
	{
		// freed..
		lpCriticalSection->dwThreadid = 0;
	}

	return;
}

#endif //_WIN32
#endif //CSECT_DEBUG

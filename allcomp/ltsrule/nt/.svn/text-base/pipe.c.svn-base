/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    Copyright © 2000, 2001 Force Computers Inc. A Solectron company. All rights reserved.
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
 *    File Name:        pipe.c
 *    Author:			Bill Hallahan
 *    Creation Date:	12/26/95
 *
 *    Functionality:
 *			Pipe functions for use with threads.
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date		Description
 * ---  ------	-----------	--------------------------------------------
 *	
 * 001	TEK		09/03/1997	Add LockPipe, UnlockPipe
 * 002	TQL		05/21/1997	BATS#357  Add the code for __osf__ build
 * 003	GL		06/04/1997	BATS#381  fix the thread starting problem
 * 004	MGS		09/08/1997	Made change for osf build 
 * 005  ETT		10/05/1998  Added Linux code.
 * 006	MFG		07/24/1999	cemm.h defined for beginthread and endthread support
 * 007	mfg		07/29/1999	undefined process.h for WinCE
 * 008	MGS		08/22/2000	BATS #935, fixed 2 concurrency problems
 * 009 	CAB		10/16/2000	Changed copyright info
 * 010	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 011 	CAB		05/11/2001	Updated copyright
 * 012	MGS		05/18/2001	More VxWorks porting
 * 013	MFG		05/29/2001	Included dectalkf.h
 * 014	MGS		06/19/2001	Solaris Port BATS#972
 * 015	MGS		02/26/2002	Mitsubishi fixes
 * 016	CAB		06/17/2002	Removed assert for UNDER_CE
 * 017	CAB		07/30/2002	Condensed repeated __osf__ code
 * 018	CAB 	09/12/2002	Removed extra #if
 * 019	CAB		09/13/2002	Fixed #if for windows ce for assert.h
 */

/**********************************************************************/
/*  Include files.                                                    */
/**********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
/* JL 06/08/1998 change this for Linux build */

#include "dectalkf.h"
#include "port.h"
#ifdef WIN32
#include <windows.h>
#ifndef UNDER_CE
#include <process.h>    /*MVP : for _endthreadex*/
#endif
#endif

#include "opthread.h"

// mfg 07/24/1999 added for beginthread and endthread support
#if UNDER_CE
#include "cemm.h"
#endif

#if defined _UNIX_LIKE_
#include "opthread.h"
#endif

#if defined VXWORKS || defined _APPLE_MAC_
#include <stdlib.h>
#else
#include <malloc.h>
#endif

#ifndef UNDER_CE
#include <assert.h>		/* tek 30aug96 guard the pipes against corruption */
#endif

/**********************************************************************/
/*  Symbol Definitions.                                               */
/**********************************************************************/

#define  PIPE_NORMAL  0
#define  PIPE_PAUSE   1
#define  PIPE_EXIT    2

#define	GUARD1	(0x8bad)
#define GUARD2	(0xf00d)

/**********************************************************************/
/*  Pipe Structure.                                                   */
/**********************************************************************/

struct PIPE_TAG
{
  USHORT usGuard1;
  void * pStart;
  void * pInput;
  void * pOutput;
  UINT uiInputPosition;
  UINT uiOutputPosition;
  UINT uiLength;
  UINT uiCount;
  UINT uiType;
  UINT uiState;
/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
  DT_HANDLE hNotEmptyEvent;
  DT_HANDLE hNotFullEvent;
  DT_HANDLE hNotPausedEvent;
  LPCRITICAL_SECTION pcsPipe;
#endif
#if defined _UNIX_LIKE_
  HEVENT_T hNotEmptyEvent;
  HEVENT_T hNotFullEvent;
  HEVENT_T hNotPausedEvent;
  HMUTEX_T pcsPipe;
#endif
  USHORT usGuard2;
};

/**********************************************************************/
/*  Include files for pipe definitions.                               */
/**********************************************************************/

#include "pipe.h"

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: create_pipe                                             */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function allocates global locked memory for a pipe and     */
/*    initializes the pipe data structure.                            */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    uiType   An unsigned integer which specifies the type of data   */
/*             the pipe will contain. It must be one of the following */
/*             constants;                                             */
/*                                                                    */
/*                     BYTE_PIPE                                      */
/*                     WORD_PIPE                                      */
/*                     DWORD_PIPE                                     */
/*                     QWORD_PIPE                                     */
/*                     FLOAT_PIPE                                     */
/*                     DOUBLE_PIPE                                    */
/*                     VOID_PTR_PIPE                                  */
/*                                                                    */
/*                                                                    */
/*    uiPipeSize   A UINT which specifies the pipe buffer size.       */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    A pointer to the pipe is returned. NULL is returned if the pipe */
/*    memory could not be allocated.                                  */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

LPPIPE_T create_pipe( UINT uiType, UINT uiPipeLength )
{
  LPPIPE_T pPipe;
  void * pBuffer;

  /********************************************************************/
  /*  Allocate the pipe structure and the pipe memory.                */
  /********************************************************************/

  pPipe = (LPPIPE_T) malloc( sizeof( PIPE_T ));

  if ( pPipe == NULL )
    return( NULL );

  /********************************************************************/
  /*  Allocate the pipe queue.                                        */
  /********************************************************************/

  switch ( uiType )
  {
  case BYTE_PIPE:

    pBuffer =
      ( BYTE_T * )malloc( uiPipeLength * sizeof(BYTE_T));

    break;

  case WORD_PIPE:

    pBuffer =
      ( WORD_T * )malloc( uiPipeLength * sizeof(WORD_T));

    break;

  case DWORD_PIPE:

    pBuffer =
      ( DWORD_T * )malloc( uiPipeLength * sizeof(DWORD_T));

    break;

  case QWORD_PIPE:

    pBuffer =
      ( QWORD_T * )malloc( uiPipeLength * sizeof(QWORD_T));

    break;
#ifdef NEVER
  case FLOAT_PIPE:

    pBuffer = ( float * )malloc( uiPipeLength * sizeof(float));

    break;
  case DOUBLE_PIPE:

    pBuffer = ( double * )malloc( uiPipeLength * sizeof(double));

    break;
#endif

  case VOID_PTR_PIPE:

    pBuffer = ( void * )malloc( uiPipeLength * sizeof(void *));

    break;

  default:

    return( NULL );

    break;
  }

  if ( pBuffer == NULL )
  {
    free( pPipe );
    return( NULL );
  }

  /********************************************************************/
  /*  Allocate the pipe critical section object.                      */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
/* GL 06/04/1997  for BATS#381 should use WIN32 instead of MSDEV */
#ifdef WIN32
  pPipe->pcsPipe =
    ( LPCRITICAL_SECTION )malloc( sizeof( CRITICAL_SECTION ));
#endif
#if defined _UNIX_LIKE_
  pPipe->pcsPipe = OP_CreateMutex();
#endif

  if ( pPipe->pcsPipe == NULL )
  {
    free( pBuffer );
    free( pPipe );
    return( NULL );
  }

  /********************************************************************/
  /*  Initialize the pipe critical section object.                    */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
/* GL 06/04/1997  for BATS#381 should be used in WIN32 instead of osf */
#ifdef WIN32
  InitializeCriticalSection( pPipe->pcsPipe );
#endif

  /********************************************************************/
  /*  Initialize the pipe structure.                                  */
  /********************************************************************/

  pPipe->usGuard1 = GUARD1;
  pPipe->usGuard2 = GUARD2;
  pPipe->pStart = pBuffer;
  pPipe->pInput = pBuffer;
  pPipe->pOutput = pBuffer;
  pPipe->uiInputPosition = 0;
  pPipe->uiOutputPosition = 0;
  pPipe->uiLength = uiPipeLength;
  pPipe->uiCount = 0;
  pPipe->uiType = uiType;
  pPipe->uiState = PIPE_NORMAL;

  /********************************************************************/
  /*  Initialize the pipe Not Empty Event.                            */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  pPipe->hNotEmptyEvent = CreateEvent( NULL, TRUE, FALSE, NULL );
#endif
#if defined _UNIX_LIKE_
  pPipe->hNotEmptyEvent = OP_CreateEvent( TRUE, FALSE );
#endif

  if ( pPipe->hNotEmptyEvent == NULL )
  {
    free( pBuffer );
/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
    DeleteCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
	OP_DestroyMutex( pPipe->pcsPipe );
#endif
    free( pPipe );
    return( NULL );
  }

  /********************************************************************/
  /*  Initialize the pipe Not Full Event.                             */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  pPipe->hNotFullEvent = CreateEvent( NULL, TRUE, TRUE, NULL );
#endif
#if defined _UNIX_LIKE_
  pPipe->hNotFullEvent = OP_CreateEvent( TRUE, TRUE );
#endif

  if ( pPipe->hNotFullEvent == NULL )
  {
    free( pBuffer );
/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
    DeleteCriticalSection( pPipe->pcsPipe );
    CloseHandle( pPipe->hNotEmptyEvent );
#endif
#if defined _UNIX_LIKE_
    OP_DestroyMutex( pPipe->pcsPipe );
    OP_DestroyEvent( pPipe->hNotEmptyEvent );
#endif
    free( pPipe );
    return( NULL );
  }

  return( pPipe );
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: write_pipe                                              */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function attempts to write items to a pipe. The function   */
/*    will blocks if the pipe is too full to hold the new data.       */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*                                                                    */
/*    pPipe              A pointer to the pipe.                       */
/*                                                                    */
/*    pItems             A pointer to the items to put in the pipe.   */
/*                                                                    */
/*    uiNumberToWrite    The number of items to put in the pipe.      */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The items are put into the pipe. If the pipe becomes full the   */
/*    task will wait until data is removed from the pipe.             */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void write_pipe( LPPIPE_T pPipe, void * pItems, UINT uiNumberToWrite )
{
  UINT i;
  UINT uiRemaining;
  /* check the pipe guards.. */
#if !defined _UNIX_LIKE_ && !defined UNDER_CE
  assert ( ( pPipe->usGuard1 == GUARD1) 
	  &&( pPipe->usGuard2 == GUARD2) );
#endif


  /********************************************************************/
  /*  Block if the pipe resource is busy.                             */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  EnterCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_LockMutex( pPipe->pcsPipe );
#endif


  /********************************************************************/
  /*  If there's not enough room for the items then block.            */
  /*  write_pipe must own pPipe->uiCount during the compare in case   */
  /*  multiple threads are trying to write the pipe at the same time. */
  /********************************************************************/

  while ( pPipe->uiCount + uiNumberToWrite >= pPipe->uiLength )
  {
/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
    ResetEvent( pPipe->hNotFullEvent );

    LeaveCriticalSection( pPipe->pcsPipe );

    WaitForSingleObject( pPipe->hNotFullEvent, INFINITE );

    EnterCriticalSection( pPipe->pcsPipe );
#endif

#if defined _UNIX_LIKE_
	OP_ResetEvent( pPipe->hNotFullEvent );

    OP_UnlockMutex( pPipe->pcsPipe );

    OP_WaitForEvent( pPipe->hNotFullEvent, OP_INFINITE );

    OP_LockMutex( pPipe->pcsPipe );
#endif

  }

  /********************************************************************/
  /*  There is enough space in the pipe.                              */
  /*  Test to see if the data will wrap around the circular queue.    */
  /********************************************************************/

  if ( pPipe->uiInputPosition + uiNumberToWrite > pPipe->uiLength )
  {
    /******************************************************************/
    /*  The data will wrap around the circular queue.                 */
    /******************************************************************/

    uiRemaining = pPipe->uiLength - pPipe->uiInputPosition;

    switch ( pPipe->uiType )
    {
    case BYTE_PIPE:

      for ( i = 0; i < uiRemaining; i++ )
       *((BYTE_T *)pPipe->pInput)++ = *((BYTE_T *)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((BYTE_T *)pPipe->pInput)++ = *((BYTE_T *)pItems)++;

      break;

    case WORD_PIPE:

      for ( i = 0; i < uiRemaining; i++ )
       *((WORD_T *)pPipe->pInput)++ = *((WORD_T *)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((WORD_T *)pPipe->pInput)++ = *((WORD_T *)pItems)++;

      break;

    case DWORD_PIPE:

      for ( i = 0; i < uiRemaining; i++ )
       *((DWORD_T *)pPipe->pInput)++ = *((DWORD_T *)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((DWORD_T *)pPipe->pInput)++ = *((DWORD_T *)pItems)++;

      break;

    case QWORD_PIPE:

      for ( i = 0; i < uiRemaining; i++ )
       *((QWORD_T *)pPipe->pInput)++ = *((QWORD_T *)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((QWORD_T *)pPipe->pInput)++ = *((QWORD_T *)pItems)++;

      break;
#ifdef NEVER
    case FLOAT_PIPE:

      for ( i = 0; i < uiRemaining; i++ )
       *((float *)pPipe->pInput)++ = *((float *)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((float *)pPipe->pInput)++ = *((float *)pItems)++;

      break;
    case DOUBLE_PIPE:

      for ( i = 0; i < uiRemaining; i++ )
       *((double *)pPipe->pInput)++ = *((double *)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((double *)pPipe->pInput)++ = *((double *)pItems)++;

      break;

#endif
    case VOID_PTR_PIPE:

      for ( i = 0; i < uiRemaining; i++ )
       *((void **)pPipe->pInput)++ = *((void **)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((void **)pPipe->pInput)++ = *((void **)pItems)++;

      break;

    default:

      for ( i = 0; i < uiRemaining; i++ )
       *((BYTE_T *)pPipe->pInput)++ = *((BYTE_T *)pItems)++;

      pPipe->pInput = pPipe->pStart;

      for ( i = uiRemaining; i < uiNumberToWrite; i++ )
       *((BYTE_T *)pPipe->pInput)++ = *((BYTE_T *)pItems)++;

      break;
    }

    /******************************************************************/
    /*  Update the input position in a circular fashion.              */
    /******************************************************************/

    pPipe->uiInputPosition = uiNumberToWrite - uiRemaining;
  }
  else
  {
    /******************************************************************/
    /*  The data will NOT wrap around the circular queue.             */
    /******************************************************************/

    switch ( pPipe->uiType )
    {
    case BYTE_PIPE:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((BYTE_T *)pPipe->pInput)++ = *((BYTE_T *)pItems)++;

      break;

    case WORD_PIPE:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((WORD_T *)pPipe->pInput)++ = *((WORD_T *)pItems)++;

      break;

    case DWORD_PIPE:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((DWORD_T *)pPipe->pInput)++ = *((DWORD_T *)pItems)++;

      break;

    case QWORD_PIPE:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((QWORD_T *)pPipe->pInput)++ = *((QWORD_T *)pItems)++;

      break;
#ifdef NEVER
    case FLOAT_PIPE:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((float *)pPipe->pInput)++ = *((float *)pItems)++;

      break;
    case DOUBLE_PIPE:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((double *)pPipe->pInput)++ = *((double *)pItems)++;

      break;
#endif

    case VOID_PTR_PIPE:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((void **)pPipe->pInput)++ = *((void **)pItems)++;

      break;

    default:

      for ( i = 0; i < uiNumberToWrite; i++ )
       *((BYTE_T *)pPipe->pInput)++ = *((BYTE_T *)pItems)++;

      break;
    }

    /******************************************************************/
    /*  Update the input position.                                    */
    /******************************************************************/

    pPipe->uiInputPosition += uiNumberToWrite;
  }

  /********************************************************************/
  /*  Update the count of items in the pipe.                          */
  /********************************************************************/

  pPipe->uiCount += uiNumberToWrite;

  /********************************************************************/
  /*  Set the pipe not empty condition.                               */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  SetEvent( pPipe->hNotEmptyEvent );
#endif
#if defined _UNIX_LIKE_
  OP_SetEvent( pPipe->hNotEmptyEvent );
#endif

  /******************************************************************/
  /*  Free the pipe resource.                                       */
  /******************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  LeaveCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_UnlockMutex( pPipe->pcsPipe );
#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: read_pipe                                               */
/*  Author: Bill Hallahan                                             */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function writes items to a pipe and blocks if the pipe is  */
/*    to full for the items.                                          */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pPipe             A pointer to the pipe.                        */
/*                                                                    */
/*    pItems            A pointer to the array of items to get from   */
/*                      the pipe.                                     */
/*                                                                    */
/*    uiNumberToRead    The number of items to get from the pipe.     */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The items are put into the pipe. If the pipe becomes full the   */
/*    task will wait until the pipe has data removed.                 */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void read_pipe( LPPIPE_T pPipe, void * pItems, UINT uiNumberToRead )
{
	read_pipeEx(&pPipe,pItems,uiNumberToRead);
}

void read_pipeEx( LPPIPE_T *pPipe, void * pItems, UINT uiNumberToRead )
{
	UINT i;
	UINT uiRemaining;
	UINT temp;
	UINT uiType;
	int ret;
	/* check the pipe guards.. */
	
#if !defined _UNIX_LIKE_ && !defined UNDER_CE
	assert ( ( (*pPipe)->usGuard1 == GUARD1) 
		&&( (*pPipe)->usGuard2 == GUARD2) );
#endif
	
	/********************************************************************/
	/*  Block if the pipe resource is busy.                             */
	/********************************************************************/
	
	/* TQL 05/21/1997  change this for OSF build */
	OP_LockMutex( (*pPipe)->pcsPipe );
	
	uiType=(*pPipe)->uiType;
	
	/********************************************************************/
	/*  If there are not enough items in the pipe then block.           */
	/*  read_pipe must own pPipe->uiCount during the compare in case    */
	/*  multiple threads are trying to read the pipe at the same time.  */
	/********************************************************************/
	
	if (uiNumberToRead == READ_WORD_PIPE_PACKET)
	{
		// peek at the data in the pipe to see how many items to read
		if (((*pPipe)->uiLength - (*pPipe)->uiOutputPosition)==0)
		{
			temp=(((((short *)(*pPipe)->pStart)[0]&0x6000) >> 13) +1);
		}
		else
		{
			temp=(((((short *)(*pPipe)->pOutput)[0]&0x6000) >> 13) +1);
		}

		while ( (*pPipe)->uiCount < temp)
		{
			/* TQL 05/21/1997  change this for OSF build */
			
			OP_ResetEvent( (*pPipe)->hNotEmptyEvent );
			
			OP_UnlockMutex( (*pPipe)->pcsPipe );
			
			ret=OP_WaitForEvent( (*pPipe)->hNotEmptyEvent, OP_INFINITE );

			if (*pPipe==NULL || ret!=OP_WAIT_NORMAL)
			{
				switch ( uiType )
				{
				case BYTE_PIPE:
					*((BYTE_T *)pItems) = 0;
					break;
				case WORD_PIPE:
					*((WORD_T *)pItems) = 0;
					break;
				case DWORD_PIPE:
					*((DWORD_T *)pItems) = 0;
					break;
				case QWORD_PIPE:
					*((QWORD_T *)pItems) = 0;
					break;
#ifdef NEVER
				case FLOAT_PIPE:
					*((float *)pItems) = 0.0;
					break;
				case DOUBLE_PIPE:
					*((double *)pItems) = 0.0;
					break;
#endif
				case VOID_PTR_PIPE:
					*((void **)pItems) = 0;
					break;
				default:
					*((BYTE_T *)pItems) = 0;
					break;
				}
				return;
			}
			
			OP_LockMutex( (*pPipe)->pcsPipe );

			if (((*pPipe)->uiLength - (*pPipe)->uiOutputPosition)==0)
			{
				temp=(((((short *)(*pPipe)->pStart)[0]&0x6000) >> 13) +1);
			}
			else
			{
				temp=(((((short *)(*pPipe)->pOutput)[0]&0x6000) >> 13) +1);
			}
		}
	}
	else
	{
		
		while ( (*pPipe)->uiCount < uiNumberToRead )
		{
			/* TQL 05/21/1997  change this for OSF build */
	
			OP_ResetEvent( (*pPipe)->hNotEmptyEvent );
			
			OP_UnlockMutex( (*pPipe)->pcsPipe );
			
			ret=OP_WaitForEvent( (*pPipe)->hNotEmptyEvent, OP_INFINITE );

			// MGS add this for protection from the pipe structure being free while in the wait
			if (*pPipe==NULL || ret!=OP_WAIT_NORMAL)
			{
				switch ( uiType )
				{
				case BYTE_PIPE:
					*((BYTE_T *)pItems) = 0;
					break;
				case WORD_PIPE:
					*((WORD_T *)pItems) = 0;
					break;
				case DWORD_PIPE:
					*((DWORD_T *)pItems) = 0;
					break;
				case QWORD_PIPE:
					*((QWORD_T *)pItems) = 0;
					break;
#ifdef NEVER
				case FLOAT_PIPE:
					*((float *)pItems) = 0.0;
					break;
				case DOUBLE_PIPE:
					*((double *)pItems) = 0.0;
					break;
#endif
				case VOID_PTR_PIPE:
					*((void **)pItems) = 0;
					break;
				default:
					*((BYTE_T *)pItems) = 0;
					break;
				}
				return;
			}
			
			OP_LockMutex( (*pPipe)->pcsPipe );
		}
	}
	/********************************************************************/
	/*  If the exit flag is set then terminate the thread.              */
	/********************************************************************/
	
	switch ( (*pPipe)->uiState )
	{
	case PIPE_NORMAL:
		
		break;
		
	case PIPE_PAUSE:
		
		/* TQL 05/21/1997  change this for OSF build */
		
		OP_ResetEvent( (*pPipe)->hNotPausedEvent );
		
		OP_UnlockMutex( (*pPipe)->pcsPipe );
		
		OP_WaitForEvent( (*pPipe)->hNotPausedEvent, OP_INFINITE );
		
		OP_LockMutex( (*pPipe)->pcsPipe );
		
		(*pPipe)->uiState = PIPE_NORMAL;
		
		break;
		
	case PIPE_EXIT:
		
		/* TQL 05/21/1997  change this for OSF build */
		OP_UnlockMutex( (*pPipe)->pcsPipe );
		
		/*MVP : Microsoft reocmmends to use _endthreadex for the proper recovery
		of resources from the thread
		*/
#ifdef OLD
		ExitThread( 0 );
#endif

		SWFlushPipe((*pPipe));

		/* GL 04/21/1997  change this for OSF build */
#ifdef WIN32
#ifndef LDS_BUILD
		_endthreadex(0);
#endif
#endif
		
#if defined _UNIX_LIKE_
		OP_ExitThread(0);
		OP_THREAD_RETURN;
#endif
		
		break;
		
	default:
		
		break;
	}

  /********************************************************************/
  /*  There are enough items in the pipe.                             */
  /*  Test to see if the read of the data wraps around the queue.     */
  /********************************************************************/


	if (uiNumberToRead == READ_WORD_PIPE_PACKET)
	{
		// peek at the pipe to figure out how many items to read
		if (((*pPipe)->uiLength - (*pPipe)->uiOutputPosition)==0)
		{
			uiNumberToRead=(((((short *)(*pPipe)->pStart)[0]&0x6000) >> 13) +1);
		}
		else
		{
			uiNumberToRead=(((((short *)(*pPipe)->pOutput)[0]&0x6000) >> 13) +1);
		}
	}
	
	if ( (*pPipe)->uiOutputPosition + uiNumberToRead > (*pPipe)->uiLength )
	{
		/******************************************************************/
		/*  The read of the data will wrap around the circular queue.     */
		/******************************************************************/
		
		uiRemaining = (*pPipe)->uiLength - (*pPipe)->uiOutputPosition;
		
		switch ( (*pPipe)->uiType )
		{
		case BYTE_PIPE:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((BYTE_T *)pItems)++ = *((BYTE_T *)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((BYTE_T *)pItems)++ = *((BYTE_T *)(*pPipe)->pOutput)++;
			
			break;
			
		case WORD_PIPE:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((WORD_T *)pItems)++ = *((WORD_T *)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((WORD_T *)pItems)++ = *((WORD_T *)(*pPipe)->pOutput)++;
			
			break;
			
		case DWORD_PIPE:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((DWORD_T *)pItems)++ = *((DWORD_T *)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((DWORD_T *)pItems)++ = *((DWORD_T *)(*pPipe)->pOutput)++;
			
			break;
			
		case QWORD_PIPE:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((QWORD_T *)pItems)++ = *((QWORD_T *)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((QWORD_T *)pItems)++ = *((QWORD_T *)(*pPipe)->pOutput)++;
			
			break;
#ifdef NEVER			
		case FLOAT_PIPE:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((float *)pItems)++ = *((float *)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((float *)pItems)++ = *((float *)(*pPipe)->pOutput)++;
			
			break;
		case DOUBLE_PIPE:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((double *)pItems)++ = *((double *)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((double *)pItems)++ = *((double *)(*pPipe)->pOutput)++;
			
			break;
#endif
			
		case VOID_PTR_PIPE:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((void **)pItems)++ = *((void **)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((void **)pItems)++ = *((void **)(*pPipe)->pOutput)++;
			
			break;
			
		default:
			
			for ( i = 0; i < uiRemaining; i++ )
				*((BYTE_T *)pItems)++ = *((BYTE_T *)(*pPipe)->pOutput)++;
			
			(*pPipe)->pOutput = (*pPipe)->pStart;
			
			for ( i = uiRemaining; i < uiNumberToRead; i++ )
				*((BYTE_T *)pItems)++ = *((BYTE_T *)(*pPipe)->pOutput)++;
			
			break;
		}
		
		/******************************************************************/
		/*  Update the output position in a circular fashion.             */
		/******************************************************************/
		
		(*pPipe)->uiOutputPosition = uiNumberToRead - uiRemaining;
    }
	else
	{
		/******************************************************************/
		/*  The read of the data will NOT wrap around the circular queue. */
		/******************************************************************/
		
		switch ( (*pPipe)->uiType )
		{
		case BYTE_PIPE:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((BYTE_T *)pItems)++ = *((BYTE_T *)(*pPipe)->pOutput)++;
			
			break;
			
		case WORD_PIPE:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((WORD_T *)pItems)++ = *((WORD_T *)(*pPipe)->pOutput)++;
			
			break;
			
		case DWORD_PIPE:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((DWORD_T *)pItems)++ = *((DWORD_T *)(*pPipe)->pOutput)++;
			
			break;
			
		case QWORD_PIPE:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((QWORD_T *)pItems)++ = *((QWORD_T *)(*pPipe)->pOutput)++;
			
			break;

#ifdef NEVER			
		case FLOAT_PIPE:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((float *)pItems)++ = *((float *)(*pPipe)->pOutput)++;
			
			break;
		case DOUBLE_PIPE:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((double *)pItems)++ = *((double *)(*pPipe)->pOutput)++;
			
			break;
#endif			
			
		case VOID_PTR_PIPE:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((void **)pItems)++ = *((void **)(*pPipe)->pOutput)++;
			
			break;
			
		default:
			
			for ( i = 0; i < uiNumberToRead; i++ )
				*((BYTE_T *)pItems)++ = *((BYTE_T *)(*pPipe)->pOutput)++;
			
			break;
		}
		
		/******************************************************************/
		/*  Update the output position.                                   */
		/******************************************************************/
		
		(*pPipe)->uiOutputPosition += uiNumberToRead;
	}
  
	/********************************************************************/
	/*  Update the count of items in the pipe.                          */
	/********************************************************************/
	
	(*pPipe)->uiCount -= uiNumberToRead;
	
	/********************************************************************/
	/*  Set the pipe not full condition.                                */
	/********************************************************************/
	
	/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
	SetEvent( (*pPipe)->hNotFullEvent );
#endif
#if defined _UNIX_LIKE_
	OP_SetEvent( (*pPipe)->hNotFullEvent );
#endif
	
	/******************************************************************/
	/*  Free the pipe resource.                                       */
	/******************************************************************/
	
	/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
	LeaveCriticalSection( (*pPipe)->pcsPipe );
#endif
#if defined _UNIX_LIKE_
	OP_UnlockMutex( (*pPipe)->pcsPipe );
#endif
	
	return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: pause_pipe                                              */
/*  Author: Bill Hallahan                                             */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function pauses a pipe.                                    */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pPipe      A pointer to the pipe.                               */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The pipe is cleared.                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void pause_pipe( LPPIPE_T pPipe )
{
  /********************************************************************/
  /*  Block if the pipe resource is busy.                             */
  /********************************************************************/
 /* check the pipe guards.. */

#if !defined _UNIX_LIKE_ && !defined UNDER_CE
  assert ( ( pPipe->usGuard1 == GUARD1) 
	  &&( pPipe->usGuard2 == GUARD2) );
#endif

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  EnterCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_LockMutex( pPipe->pcsPipe );
#endif

  /********************************************************************/
  /*  Go into the paused state.                                       */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  ResetEvent( pPipe->hNotPausedEvent );
#endif
#if defined _UNIX_LIKE_
  OP_ResetEvent( pPipe->hNotPausedEvent );
#endif

  pPipe->uiState = PIPE_PAUSE;

  /********************************************************************/
  /*  Free the pipe resource.                                         */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  LeaveCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_UnlockMutex( pPipe->pcsPipe );
#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: resume_pipe                                             */
/*  Author: Bill Hallahan                                             */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function resumes a paused pipe.                            */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pPipe      A pointer to the pipe.                               */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The pipe is cleared.                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void resume_pipe( LPPIPE_T pPipe )
{

 /* check the pipe guards.. */
#if !defined _UNIX_LIKE_ && !defined UNDER_CE
	assert ( ( pPipe->usGuard1 == GUARD1) 
	  &&( pPipe->usGuard2 == GUARD2) );
#endif


  /********************************************************************/
  /*  Block if the pipe resource is busy.                             */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  EnterCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_LockMutex( pPipe->pcsPipe );
#endif

  /********************************************************************/
  /*  Get out of the paused state.                                    */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  SetEvent( pPipe->hNotPausedEvent );
#endif
#if defined _UNIX_LIKE_
  OP_SetEvent( pPipe->hNotPausedEvent );
#endif

  /********************************************************************/
  /*  Free the pipe resource.                                         */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  LeaveCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_UnlockMutex( pPipe->pcsPipe );
#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: exit_pipe                                               */
/*  Author: Bill Hallahan                                             */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function terminates any thread which is doing a read of    */
/*    specified pipe.                                                 */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pPipe      A pointer to the pipe.                               */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    None                                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void exit_pipe( LPPIPE_T pPipe )
{

 /* check the pipe guards.. */
#if !defined _UNIX_LIKE_ && !defined UNDER_CE
  assert ( ( pPipe->usGuard1 == GUARD1) 
	  &&( pPipe->usGuard2 == GUARD2) );
#endif


  /********************************************************************/
  /*  Block if the pipe resource is busy.                             */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  EnterCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_LockMutex( pPipe->pcsPipe );
#endif

  /********************************************************************/
  /*  Setup for thread exit on the next call to function read_pipe(). */
  /********************************************************************/

  pPipe->uiState = PIPE_EXIT;

  /********************************************************************/
  /*  Free the pipe resource.                                         */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  LeaveCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_UnlockMutex( pPipe->pcsPipe );
#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: reset_pipe                                              */
/*  Author: Bill Hallahan                                             */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function clears all items from a pipe and re-initializes   */
/*    the pipe.                                                       */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pPipe      A pointer to the pipe.                               */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The pipe is cleared.                                            */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void reset_pipe( LPPIPE_T pPipe )
{


  /********************************************************************/
  /*  Block if the pipe resource is busy.                             */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  EnterCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_LockMutex( pPipe->pcsPipe );
#endif

  /********************************************************************/
  /*  Initialize the pipe queue parameters.                           */
  /********************************************************************/

  pPipe->pInput = pPipe->pStart;
  pPipe->pOutput = pPipe->pStart;
  pPipe->uiInputPosition = 0;
  pPipe->uiOutputPosition = 0;

  /********************************************************************/
  /*  Initialize the pipe state semaphores.                           */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  ResetEvent( pPipe->hNotEmptyEvent );

  SetEvent( pPipe->hNotFullEvent );
#endif

#if defined _UNIX_LIKE_
  OP_ResetEvent( pPipe->hNotEmptyEvent );

  OP_SetEvent( pPipe->hNotFullEvent );
#endif

  /********************************************************************/
  /*  Free the pipe resource.                                         */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  LeaveCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_UnlockMutex( pPipe->pcsPipe );
#endif

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: destroy_pipe                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: April 5, 1993                                               */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function deallocates global locked memory for a pipe.      */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*                                                                    */
/*    pPipe      A pointer to the pipe.                               */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    None.                                                           */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void destroy_pipe( LPPIPE_T pPipe )
{
 /* check the pipe guards.. */

#if !defined _UNIX_LIKE_ && !defined UNDER_CE
	assert ( ( pPipe->usGuard1 == GUARD1) 
	  &&( pPipe->usGuard2 == GUARD2) );
#endif

  /********************************************************************/
  /*  Delete the critical section object.                             */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  DeleteCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_DestroyMutex( pPipe->pcsPipe );
#endif

  /********************************************************************/
  /*  Free the pipe state semaphores.                                 */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  CloseHandle( pPipe->hNotEmptyEvent );

  CloseHandle( pPipe->hNotFullEvent );
#endif
#if defined _UNIX_LIKE_
  OP_DestroyEvent( pPipe->hNotEmptyEvent );

  OP_DestroyEvent( pPipe->hNotFullEvent );
#endif

  /********************************************************************/
  /*  Deallocate the pipe memory and the pipe structure.              */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  free( pPipe->pcsPipe );
#endif

  free( pPipe->pStart );

  free( pPipe );

  return;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: pipe_count                                              */
/*  Author:   Bill Hallahan                                           */
/*  Date:     August 24, 1993                                         */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function returns the number of items in a pipe.            */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pPipe      A pointer to the pipe.                               */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    An unsigned integer equal to the number of items in a pipe.     */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

UINT pipe_count( LPPIPE_T pPipe )
{
  UINT uiCount;

  /********************************************************************/
  /*  Block if the pipe resource is busy.                             */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  EnterCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_LockMutex( pPipe->pcsPipe );
#endif

  /********************************************************************/
  /*  Get the number of items in the pipe.                            */
  /********************************************************************/

  uiCount = pPipe->uiCount;

  /********************************************************************/
  /*  Free the pipe resource.                                         */
  /********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  LeaveCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_UnlockMutex( pPipe->pcsPipe );
#endif

  return( uiCount );
}

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
void LockPipe( LPPIPE_T pPipe )
{


  /********************************************************************/
  /*  Block if the pipe resource is busy.                             */
  /********************************************************************/

  EnterCriticalSection( pPipe->pcsPipe );

}
void UnlockPipe( LPPIPE_T pPipe )
{


  /********************************************************************/
  /*  Free the pipe resource.                             */
  /********************************************************************/

  LeaveCriticalSection( pPipe->pcsPipe );

}
#endif

void SWFlushPipe( LPPIPE_T pPipe )
{


  /********************************************************************/
  /*  Flush out the pipe                                              */
  /********************************************************************/
/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  EnterCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_LockMutex( pPipe->pcsPipe );
#endif

  // reinitialize..

  pPipe->pInput = pPipe->pStart;
  pPipe->pOutput = pPipe->pStart;
  pPipe->uiInputPosition = 0;
  pPipe->uiOutputPosition = 0;
  pPipe->uiCount = 0;

/* TQL 05/21/1997  change this for OSF build */
#ifdef WIN32
  ResetEvent( pPipe->hNotEmptyEvent );
  SetEvent( pPipe->hNotFullEvent );
  LeaveCriticalSection( pPipe->pcsPipe );
#endif
#if defined _UNIX_LIKE_
  OP_ResetEvent( pPipe->hNotEmptyEvent );
  OP_SetEvent( pPipe->hNotFullEvent );
  OP_UnlockMutex( pPipe->pcsPipe );
#endif

}

/********************************************************************************* 		*/
/********************************************************************************* 		*/
/*                                                                    					*/
/*  COPYRIGHT NOTICE                                                  					*/
/*                                                                    					*/
/*  Copyright (c) Digital Equipment Corporation, 1998                 					*/
/*  Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.	*/
/*																	  					*/
/*  All Rights reserved. Unpublished rights reserved under the        					*/
/*  copyright laws of the United States. Copyright is claimed in      					*/
/*  the computer program and user interface thereof.                  					*/
/*                                                                    					*/
/*  The software contained on this media is proprietary to and        					*/
/*  embodies the confidential technology of Force Computers Inc.         				*/
/*  Possession, use, duplication or dissemination of     								*/
/*  the software and media is authorized only pursuant to a valid     					*/
/*  written license from Force Computers Incorporated.               					*/
/*                                                                    					*/
/*  The name of Force Computers Incorporated may not be used to      					*/
/*  endorse or promote products derived from this software without    					*/
/*  specific prior written permission. All other rights reserved.     					*/
/*                                                                    					*/
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      					*/
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        					*/
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        					*/
/*  FOR A PARTICULAR PURPOSE.                                         					*/
/*  Force assumes no responsibility AT ALL for the use or           					*/
/*  reliability of this software.                                     					*/
/*                                                                    					*/
/*                                                                    					*/
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
/**********************************************************************/
/*                                                                    */
/*  File: mmalloc.c                                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: February 29, 1996                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function provides memory allocation functions that can be  */
/*    used in multimedia applications. It is strongly recommended     */
/*    that the macros defined in file mmalloc.h are used to call      */
/*    these functions.                                                */
/*                                                                    */
/*    The constant SHARED_MEMORY_ALLOCATION_SIZE can be increased to  */
/*    reduce the total number of shared memory segments used by the   */
/*    multimedia server. Ideally, this constant should be set to the  */
/*    maximum memory allocated by the mmeAllocMem() function.         */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/* 001	MGS 	09/08/1997 	Made changes for osf build *
 * 002 	JAW 	02/27/1998 	Merged CE code.            *
 * 003 	CJL 	03/18/1998 	Removed specific path for dectalkf.h. *
 * 004 	JAW 	07/07/1998 	Added function reallocLock.           *
 * 005 	ETT		10/05/1998  Added Linux code.
 * 006 	NAL 	06/13/2000 	Warning removal
 * 007 	CAB		10/16/2000	Changed copyright info
 * 008	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 009  CAB		05/14/2001	Edited and updated copyright
 * 010	MGS		06/19/2001	Solaris Port BATS#972
 **********************************************************************/
#include "dectalkf.h"
#include "port.h"

#if !defined VXWORKS && !defined _APPLE_MAC_
#include <malloc.h>
#endif
#include "mmalloc.h"
#include <stdio.h> // NAL warning removal

#ifdef USE_MME_SERVER

#define  SHARED_MEMORY_ALLOCATION_SIZE  8192

#ifdef MOVED_TO_SHARED_MEMORY

/**********************************************************************/
/*  Shared memory allocation structures for Digital UNIX and OpenVMS. */
/**********************************************************************/

typedef long qAlign;

union MEM_HEADER_T
{
  struct
  {
    union MEM_HEADER_T * pLink;
    unsigned int uiSize;
  } Block;

  qAlign qForceAlignment;  /* This forces proper memory alignment */
};

typedef union MEM_HEADER_T MEMORY_HEADER_T;
typedef MEMORY_HEADER_T * LPMEMORY_HEADER_T;

/**********************************************************************/
/*  Structure for Shared Memory Linked List.                          */
/**********************************************************************/

struct SHARED_MEMORY_LIST_TAG
{
  struct SHARED_MEMORY_LIST_TAG * pLink;
  void * pSharedMemory;
};

typedef struct SHARED_MEMORY_LIST_TAG SHARED_MEMORY_LIST_T;
typedef SHARED_MEMORY_LIST_T * LPSHARED_MEMORY_LIST_T;

/**********************************************************************/
/*  Structure for Allocated Memory Linked List.                       */
/**********************************************************************/

struct ALLOCATED_MEMORY_LIST_TAG
{
  struct ALLOCATED_MEMORY_LIST_TAG * pLink;
  void * pAllocatedMemory;
};

typedef struct ALLOCATED_MEMORY_LIST_TAG ALLOCATED_MEMORY_LIST_T;
typedef ALLOCATED_MEMORY_LIST_T * LPALLOCATED_MEMORY_LIST_T;
#endif // MOVED_TO_SHARED_MEMORY

#include "shmalloc.h"
extern pshared_mem_t pShm_t;

/**********************************************************************/
/*  Function prototypes.                                              */
/**********************************************************************/

static LPMEMORY_HEADER_T GetSharedMemory( unsigned int uiSize );
static void PlaceMemoryOnFreeList( void * pMemory );

/**********************************************************************/
/*  Memory allocation globals.                                        */
/**********************************************************************/


#ifdef MOVED_TO_SHARED_MMEORY
MEMORY_HEADER_T MemoryBase;
LPMEMORY_HEADER_T pFreePool = NULL;
LPSHARED_MEMORY_LIST_T pSharedMemoryList = NULL;
LPALLOCATED_MEMORY_LIST_T pAllocatedMemoryList = NULL;
#endif


/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: mallocLock                                              */
/*  Author:   Bill Hallahan                                           */
/*  Date:     February 29, 1996                                       */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function allocates shared memory.                          */
/*    The memory is uninitialized.                                    */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    uiSize    A value of type unsigned int that equals the number   */
/*              of bytes to allocate.                                 */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a pointer to memory if the allocation  */
/*    succeeds. If the allocation fails then NULL will be returned.   */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void * mallocLock( unsigned int uiSize )
{
  unsigned int uiUnits;
  void * pAllocatedMem;
  LPMEMORY_HEADER_T pMem;
  LPMEMORY_HEADER_T pPrevious;
  LPALLOCATED_MEMORY_LIST_T pAllocatedMemoryListItem;

  /********************************************************************/
  /*  Allocate memory for the allocated memory list structure.        */
  /********************************************************************/
  pAllocatedMemoryListItem =
    (LPALLOCATED_MEMORY_LIST_T)malloc( sizeof(ALLOCATED_MEMORY_LIST_T));

  if ( pAllocatedMemoryListItem == NULL )
  {
    return NULL;
  }

  /********************************************************************/
  /*  Calculate the number of units.                                  */
  /********************************************************************/

  uiUnits = ( uiSize + sizeof(MEMORY_HEADER_T) - 1 )
              / sizeof(MEMORY_HEADER_T) + 1;

  /********************************************************************/
  /*  Is there a free list yet ?                                      */
  /********************************************************************/

  if (( pPrevious = pShm_t->pFreePool ) == NULL )
  {
    pShm_t->MemoryBase.Block.pLink = pShm_t->pFreePool = pPrevious = &pShm_t->MemoryBase;
    pShm_t->MemoryBase.Block.uiSize = 0;
  }

  /********************************************************************/
  /*  Go around the free list and get a memory block. Start           */
  /*  at the block immediately following the previous block.          */
  /********************************************************************/

  for ( pMem = pPrevious->Block.pLink;
        TRUE;
        pPrevious = pMem, pMem = pMem->Block.pLink )
  {
    /******************************************************************/
    /*  Is this block big enough ?                                    */
    /******************************************************************/

    if ( pMem->Block.uiSize >= uiUnits )
    {
      if ( pMem->Block.uiSize == uiUnits )
      {
        /**************************************************************/
        /*  Size matches exactly.                                     */
        /**************************************************************/

        pPrevious->Block.pLink = pMem->Block.pLink;
      }
      else
      {
        /**************************************************************/
        /*  Allocate the tail end.                                    */
        /**************************************************************/

        pMem->Block.uiSize -= uiUnits;
        pMem += pMem->Block.uiSize;
        pMem->Block.uiSize = uiUnits;
      }

      pShm_t->pFreePool = pPrevious;

      pAllocatedMem = (void *)( pMem + 1 );

      /****************************************************************/
      /*  Put the address of the allocated memory buffer at the       */
      /*  beginning of the allocated memory linked list.              */
      /****************************************************************/

      pAllocatedMemoryListItem->pAllocatedMemory = pAllocatedMem;
      pAllocatedMemoryListItem->pLink = pShm_t->pAllocatedMemoryList;
      pShm_t->pAllocatedMemoryList = pAllocatedMemoryListItem;

      return pAllocatedMem;
    }

    /******************************************************************/
    /*  Test for wrap around the free list.                           */
    /******************************************************************/

    if ( pMem == pShm_t->pFreePool )
    {
      if (( pMem = GetSharedMemory( uiUnits )) == NULL )
      {
        free( pAllocatedMemoryListItem );
        return NULL;
      }
    }
  }
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  function: GetSharedMemory                                         */
/*  Author:   Bill Hallahan                                           */
/*  Date:     February 29, 1996                                       */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function allocated shared memory for the mallocLock()      */
/*    function.                                                       */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    uiSize    A value of type unsigned int that equals the number   */
/*              of bytes to allocate.                                 */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a pointer to a structure of type       */
/*    MEMORY_HEADER_T. A value of NULL is returned if the function    */
/*    fails.                                                          */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static LPMEMORY_HEADER_T GetSharedMemory( unsigned int uiSize )
{
  LPMEMORY_HEADER_T pSharedMem;
  LPSHARED_MEMORY_LIST_T pSharedMemoryListItem;
  LPSHARED_MEMORY_LIST_T pNextSharedMemoryListItem;
  /********************************************************************/
  /*  Only allocate big buffers.                                      */
  /********************************************************************/

  if ( uiSize < SHARED_MEMORY_ALLOCATION_SIZE )
  {
    uiSize = SHARED_MEMORY_ALLOCATION_SIZE;
  }

  /********************************************************************/
  /*  Allocate memory for the shared memory list structure.           */
  /********************************************************************/

  pSharedMemoryListItem =
    (LPSHARED_MEMORY_LIST_T)malloc( sizeof(SHARED_MEMORY_LIST_T));

  if ( pSharedMemoryListItem == NULL )
  {
    return NULL;
  }

  /********************************************************************/
  /*  Allocate shared memory.                                         */
  /********************************************************************/

  pSharedMem =
    (LPMEMORY_HEADER_T)mmeAllocMem( uiSize * sizeof(MEMORY_HEADER_T));

  if ( pSharedMem == NULL )
  {
    free( pSharedMemoryListItem );
    return NULL;
  }

  /********************************************************************/
  /*  Put the address of the shared memory buffer at the              */
  /*  beginning of the shared memory linked list.                     */
  /********************************************************************/

  pSharedMemoryListItem->pSharedMemory = pSharedMem;
  pSharedMemoryListItem->pLink = pShm_t->pSharedMemoryList;
  pShm_t->pSharedMemoryList = pSharedMemoryListItem;

  /********************************************************************/
  /*  Clean up and return shared memory to function mallocLock.       */
  /********************************************************************/

  pSharedMem->Block.uiSize = uiSize;
  PlaceMemoryOnFreeList((void *)( pSharedMem + 1 ));

  return pShm_t->pFreePool;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  function: freeLock                                                */
/*  Author:   Bill Hallahan                                           */
/*  Date:     February 29, 1996                                       */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function frees memory allocated by the mallocLock()        */
/*    function. The block of memory designated by pMemory is placed   */
/*    in the free list.                                               */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pMemory    A pointer to the memory to be freed.                 */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a value of FALSE if the memory was     */
/*    succesfully freed. Otherwise the value TRUE will be returned.   */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

unsigned int freeLock( void * pMemory )
{
  LPALLOCATED_MEMORY_LIST_T pAllocatedMemoryListItem;
  LPALLOCATED_MEMORY_LIST_T pNextAllocatedMemoryListItem;
  LPSHARED_MEMORY_LIST_T pSharedMemoryListItem;
  LPSHARED_MEMORY_LIST_T pNextSharedMemoryListItem;

  /********************************************************************/
  /*  Test to see if the passed pointer is on the allocated memory    */
  /*  list. If it is not on the list then return an error.            */
  /********************************************************************/

  pAllocatedMemoryListItem = pShm_t->pAllocatedMemoryList;

  if ( pAllocatedMemoryListItem )
  {
    /******************************************************************/
    /*  Is the first element on the list a match ?                    */
    /******************************************************************/

    if ( pMemory == pAllocatedMemoryListItem->pAllocatedMemory )
    {
      /****************************************************************/
      /*  The first element on the list matches.                      */
      /****************************************************************/

      pShm_t->pAllocatedMemoryList = pAllocatedMemoryListItem->pLink;
      free( pAllocatedMemoryListItem );
    }
    else
    {
      /****************************************************************/
      /*  Scan the rest of the list looking for a match.              */
      /****************************************************************/

      while ( pAllocatedMemoryListItem != NULL )
      {
        pNextAllocatedMemoryListItem = pAllocatedMemoryListItem->pLink;

        /**************************************************************/
        /*  Is the next element on the list a match ?                 */
        /**************************************************************/

        if ( pMemory == pNextAllocatedMemoryListItem->pAllocatedMemory )
        {
          /************************************************************/
          /*  The next element on the list is a match.                */
          /*  Remove the element from the list.                       */
          /************************************************************/

          pAllocatedMemoryListItem->pLink
            = pNextAllocatedMemoryListItem->pLink;

          free( pNextAllocatedMemoryListItem );

          break;
        }
        else
        {
          pAllocatedMemoryListItem = pNextAllocatedMemoryListItem;
        }
      }

      /****************************************************************/
      /*  The entire list was searched and the memory item was not    */
      /*  found. Return an error.                                     */
      /****************************************************************/

      return TRUE;
    }
  }
  else
  {
    /******************************************************************/
    /*  There are no allocated memory items. Return an error.         */
    /******************************************************************/

    return TRUE;
  }

  /********************************************************************/
  /*  The input pointer "pMemory" is valid. Prepare to free the       */
  /*  memory.                                                         */
  /********************************************************************/

  PlaceMemoryOnFreeList( pMemory );

  /********************************************************************/
  /*  If the shared memory allocation count goes to zero then free    */
  /*  all shared memory on the shared memory linked list.             */
  /********************************************************************/

  if ( pShm_t->pAllocatedMemoryList == NULL )
  {
    pSharedMemoryListItem = pShm_t->pSharedMemoryList;
    pShm_t->pSharedMemoryList = NULL;

    while ( pSharedMemoryListItem != NULL )
    {
      pNextSharedMemoryListItem = pSharedMemoryListItem->pLink;

      mmeFreeMem( pSharedMemoryListItem );

      pSharedMemoryListItem = pNextSharedMemoryListItem;
    }

    /******************************************************************/
    /*  Set the free pool to the empty state.                         */
    /******************************************************************/

    pShm_t->pFreePool = NULL;
  }

  return FALSE;
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  function: PlaceMemoryOnFreeList                                   */
/*  Author:   Bill Hallahan                                           */
/*  Date:     February 29, 1996                                       */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function places the block of memory designated by pMemory  */
/*    on the free list.                                               */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pMemory    A pointer to the memory to be freed.                 */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function has no return value.                               */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

static void PlaceMemoryOnFreeList( void * pMemory )
{
  LPMEMORY_HEADER_T pMem;
  LPMEMORY_HEADER_T pMemBlock;

  /********************************************************************/
  /*  First point to the block header.                                */
  /********************************************************************/

  pMemBlock = (LPMEMORY_HEADER_T)pMemory - 1;

  for ( pMem = pShm_t->pFreePool;
        ! (( pMemBlock > pMem ) && ( pMemBlock < pMem->Block.pLink ));
        pMem = pMem->Block.pLink )
  {
    /******************************************************************/
    /*  If the block at the start or the end is freed then break.     */
    /******************************************************************/

    if (( pMem >= pMem->Block.pLink )
      && (( pMemBlock > pMem ) || ( pMemBlock < pMem->Block.pLink )))
    {
      break;
    }
  }

  /********************************************************************/
  /*  Test for an upper join.                                         */
  /********************************************************************/

  if ( pMemBlock + pMemBlock->Block.uiSize == pMem->Block.pLink )
  {
    pMemBlock->Block.uiSize += pMem->Block.pLink->Block.uiSize;
    pMemBlock->Block.pLink = pMem->Block.pLink->Block.pLink;
  }
  else
  {
    pMemBlock->Block.pLink = pMem->Block.pLink;
  }

  /********************************************************************/
  /*  Test for an lower join.                                         */
  /********************************************************************/

  if ( pMem + pMem->Block.uiSize == pMemBlock )
  {
    pMem->Block.uiSize += pMemBlock->Block.uiSize;
    pMem->Block.pLink = pMemBlock->Block.pLink;
  }
  else
  {
    pMem->Block.pLink = pMemBlock;
  }

  pShm_t->pFreePool = pMem;

  return;
}

#else

#if !defined UNDER_CE && !defined _UNIX_LIKE_
/**********************************************************************/
/*  Locked memory allocation functions for Windows NT and Windows 95. */
/**********************************************************************/

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: mallocLock                                              */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function allocates global locked memory.                   */
/*    The memory is uninitialized.                                    */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    uiSize    A value of type unsigned int that equals the number   */
/*              of bytes to allocate.                                 */
/*                                                                    */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a pointer to memory if the allocation  */
/*    succeeds. If the allocation fails then NULL will be returned.   */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void * mallocLock( unsigned int uiSize )
{
  HGLOBAL hMem;

  /********************************************************************/
  /*  Allocate and Lock Global Memory.                                */
  /********************************************************************/

  hMem = GlobalAlloc( GMEM_MOVEABLE, (size_t)uiSize );

  return GlobalLock( hMem );
}

#ifndef MSDOS
/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  function: reallocLock                                             */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    reallocLock changes the size of the object pointed to by        */
/*    pMem to "size". If the new size is larger the space is          */
/*    uninitialized.                                                  */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pMem       A pointer to the memory to be reallocated            */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a pointer to new memory if the         */
/*    allocation succeeds. If the allocation fails then NULL will     */
/*    be returned.                                                    */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void * reallocLock( void * pMem, size_t size )
{
  HGLOBAL hMem;
  void *pvReturn; // tek 18jun98 debugging

  hMem = GlobalHandle( pMem );

#ifdef _DEBUG
  {
	  char szTemp[256];
	  sprintf(szTemp,"reallocLock: was ptr:%08lx  hMem:%08lx\n",
	  pMem, hMem);
	  OutputDebugString(szTemp);
  }
#endif //_DEBUG

  hMem = GlobalReAlloc( hMem, size, GMEM_MOVEABLE );

  pvReturn = GlobalLock( hMem );
#ifdef _DEBUG
  {
	  char szTemp[256];
	  sprintf(szTemp,"reallocLock: (ptr was %08lx) is ptr:%08lx  hMem:%08lx\n",
	  pMem, pvReturn, hMem);
	  OutputDebugString(szTemp);
  }
#endif //_DEBUG

  return(pvReturn);
}
#endif /* #ifndef MSDOS */

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  function: freeLock                                                */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function frees memory allocated by the mallocLock()        */
/*    function.                                                       */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    pMem       A pointer to the memory to be freed.                 */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a value of FALSE if the memory was     */
/*    succesfully freed. Otherwise the value TRUE will be returned.   */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

unsigned int freeLock( void * pMem )
{
  HGLOBAL hMem;

  hMem = GlobalHandle( pMem );

  if ( GlobalUnlock( hMem ))
    return TRUE;

  if( GlobalFree( hMem ) != NULL )
    return TRUE;

  return FALSE;
}

#endif //UNDER_CE

#endif

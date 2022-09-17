/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) 2001 Force Computers Inc. A Solectron company. All rights reserved. */
/*  Copyright (c) Digital Equipment Corporation, 1998                 */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Force Computers Incorporated */
/*  Possession, use, duplication or dissemination of                  */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Force Computers Incorporated.               */
/*                                                                    */
/*  The name of Force Computers Incorporated may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Force assumes no responsibility AT ALL for the use or           */
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
/*    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  JAW     02/27/1998  Merged CE code.
 * 002  CJL     03/18/1998  Removed specific path for dectalkf.h.
 * 003  JAW     07/07/1998  Added function prototype for reallocLock.
 * 004  ETT     10/05/1998  Added Linux code.
 * 005	MGS     05/09/2001  Some VxWorks porting BATS#972 
 * 006	CAB		05/14/2001	Updated copyright
 * 007	MGS		06/19/2001	Solaris Port BATS#972
*/


/**********************************************************************/
/**********************************************************************/
/*  Include file: mmalloc.h                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: February 29, 1996                                           */
/**********************************************************************/
/**********************************************************************/

#include "dectalkf.h"

#ifndef MMALLOC_H
#define MMALLOC_H

#include "opmmsys.h"

#ifdef __cplusplus
extern "C" {
#endif

#if defined _UNIX_LIKE_
  //#define HANDLE int
#define HGLOBAL DT_HANDLE
#define GMEM_MOVEABLE 0x0002
#endif

/**********************************************************************/
/*  The follwing macro definitions can be used to make code portable  */
/*  for Windows NT, Windows 95, Digital UNIX, and OpenVMS.            */
/*                                                                    */
/*  The SERVER_MEM macros provide special allocator for structures    */
/*  such as WAVEFORMATEX, WAVEOUTCAPS, and MMTIME that are allocated  */
/*  using malloc() for Windows NT and Windows 95. These structures    */
/*  require shared memory allocation for the multimedia server on     */
/*  either Digital UNIX or OpenVMS.                                   */
/*                                                                    */
/*  The SERVER_BUFFER macros are for allocating buffers.              */
/**********************************************************************/

#ifdef  USE_MME_SERVER  /* Digital UNIX or OpenVMS */
#define  ALLOCATE_SERVER_MEM( SizeInBytes )     mallocLock( SizeInBytes )
#define  FREE_SERVER_MEM( SizeInBytes )         freeLock( SizeInBytes )

#define  ALLOCATE_SERVER_BUFFER( SizeInBytes )  mmeAllocBuffer( SizeInBytes )
#define  FREE_SERVER_BUFFER( SizeInBytes )      mmeFreeBuffer( SizeInBytes )

#else  /* Windows NT or Windows 95 */

#define  ALLOCATE_SERVER_MEM( SizeInBytes )     malloc( SizeInBytes )
#define  FREE_SERVER_MEM( SizeInBytes )         free( SizeInBytes )

#if defined UNDER_CE || defined _UNIX_LIKE_
 
#define  ALLOCATE_SERVER_BUFFER( SizeInBytes )  malloc( SizeInBytes )
#define  FREE_SERVER_BUFFER( SizeInBytes )      free( SizeInBytes )

#else

#define  ALLOCATE_SERVER_BUFFER( SizeInBytes )  mallocLock( SizeInBytes )
#define  FREE_SERVER_BUFFER( SizeInBytes )      freeLock( SizeInBytes )

#endif  // UNDER_CE

#endif

#if defined UNDER_CE || defined _UNIX_LIKE_

#define  ALLOCATE_LOCKED_MEMORY( SizeInBytes )  malloc( SizeInBytes )
#define  FREE_LOCKED_MEMORY( SizeInBytes )      free( SizeInBytes )

#else

/**********************************************************************/
/*  General multimedia memory allocation. mallocLock() and FreeLock() */
/*  are defined differently for Windows NT and UNIX (or VMS).         */
/**********************************************************************/

#define  ALLOCATE_LOCKED_MEMORY( SizeInBytes )  mallocLock( SizeInBytes )
#define  FREE_LOCKED_MEMORY( SizeInBytes )      freeLock( SizeInBytes )

/**********************************************************************/
/*  Function prototypes.                                              */
/**********************************************************************/

#if !defined _UNIX_LIKE_
void * mallocLock( unsigned int uiSize );
#ifndef MSDOS
void * reallocLock( void * pMem, size_t size );
#endif
unsigned int freeLock( void * pMemory );
#endif

#endif

#ifdef __cplusplus
}  /* End extern "C" */
#endif

#endif

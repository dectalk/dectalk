/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Locked Memory Allocation Functions.                               */
/*  (Smart Alloc functions)                                           */
/*                                                                    */
/*  The following functions implement locked memory versions of the   */
/*  ansi functions malloc, calloc, realloc and free. The functions    */
/*  are named mallocLock, callocLock, reallocLock, and freeLock.      */
/*  The calling arguments are identical to their ansi counterparts    */
/*  with the exception that freeLock returns a boolean. An additional */
/*  function, realloczLock is supplied which is a version of realloc  */
/*  which initializes memory.                                         */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

/**********************************************************************/
/*  Include files.                                                    */
/**********************************************************************/

#include <windows.h>
#include <malloc.h>    /* This is needed to declare type 'size_t'     */

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
/*    size       A value of type size_t which equals the number of    */
/*               bytes to allocate.                                   */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a pointer to memory if the allocation  */
/*    succeeds. If the allocation fails then NULL will be returned.   */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void * mallocLock( size_t size )
{
  HGLOBAL hMem;

  /********************************************************************/
  /*  Allocate and Lock Global Memory.                                */
  /********************************************************************/

  hMem = GlobalAlloc( GMEM_MOVEABLE, size );

  return( GlobalLock( hMem ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Function: callocLock                                              */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function allocates global locked memory.                   */
/*    The memory byte values are initialized to 0.                    */
/*                                                                    */
/*                                                                    */
/*  Inputs:                                                           */
/*                                                                    */
/*    nobj       A value of type size_t which equals the number of    */
/*               objects to allocate.                                 */
/*                                                                    */
/*    size       A value of type size_t which equals the size of      */
/*               each object in bytes.                                */
/*                                                                    */
/*  Outputs:                                                          */
/*                                                                    */
/*    The function will return a pointer to memory if the allocation  */
/*    succeeds. If the allocation fails then NULL will be returned.   */
/*                                                                    */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/

void * callocLock( size_t nobj, size_t size )
{
  HGLOBAL hMem;

  /********************************************************************/
  /*  Allocate and Lock Global Memory.                                */
  /********************************************************************/

  hMem = GlobalAlloc( GMEM_MOVEABLE | GMEM_ZEROINIT,
                      nobj * size );

  return( GlobalLock( hMem ));
}

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

  hMem = GlobalHandle( pMem );

  hMem = GlobalReAlloc( hMem, size, GMEM_MOVEABLE );

  return( GlobalLock( hMem ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  function: realloczLock                                            */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    reallocLock changes the size of the object pointed to by        */
/*    pMem to "size". If the new size is larger the space is          */
/*    initialized to zero byte values.                                */
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

void * realloczLock( void * pMem, size_t size )
{
  HGLOBAL hMem;

  hMem = GlobalHandle( pMem );

  hMem = GlobalReAlloc( hMem, size, GMEM_MOVEABLE | GMEM_ZEROINIT );

  return( GlobalLock( hMem ));
}

/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  function: freeLock                                                */
/*  Author:   Bill Hallahan                                           */
/*  Date:     March 10, 1993                                          */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This function frees memory allocated by functions mallocLock,   */
/*    callocLock reallocLock, or realloczLock.                        */
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

BOOL freeLock( void * pMem )
{
  HGLOBAL hMem;

  hMem = GlobalHandle( pMem );

  if ( GlobalUnlock( hMem ))
    return( TRUE );

  if( GlobalFree( hMem ) != NULL )
    return( TRUE );

  return ( FALSE );
}

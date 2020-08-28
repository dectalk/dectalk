/*
** COPYRIGHT NOTICE 
** Copyright © 2000, 2001 Force Computers Inc. A Solectron company. All rights reserved.    
** Copyright © SMART Modular Technologies 1999. All rights reserved.    
** Copyright (c) Digital Equipment Corporation, 1993
** All Rights reserved. Unpublished rights reserved under the 
** copyright laws of the United States. Copyright is claimed in 
** the computer program and user interface thereof. 
** 
** The software contained on this media is proprietary to and 
** embodies the confidential technology of Force Computers Incorporated.
** Possession, use, duplication or dissemination of 
** the software and media is authorized only pursuant to a valid
** written license from Force Computers Incorporated.
** 
** The name of Force Copmuters Incorporated may not be used to endorse or 
** promote products derived from this software without specific prior 
** written permission. All other rights reserved.
** 
** THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED 
** WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF
** NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE. 
** Force assumes no responsibility AT ALL for the use or reliability of 
** this software.
**  
** +---------------------------------------------------------------------+
** | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS SUBJECT TO | 
** | RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)                       |
** | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.     |
** |                                                                     |
** +---------------------------------------------------------------------+
**
*/

/*
 * HISTORY
  * Revision 1.2.2.4  1996/01/03  21:11:36  Bill_Hallahan
 * 	New audio subsystem
 * 	[1996/01/03  21:03:02  Bill_Hallahan]
 *
 * Revision 1.2.2.3  1994/11/09  15:52:09  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/08  21:49:43  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:49:31  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  20:28:43  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/

/*
 * HISTORY
 * Revision 1.2.2.4  1996/01/03  21:11:36  Bill_Hallahan
 * 	New audio subsystem
 * 	[1996/01/03  21:03:02  Bill_Hallahan]
 *
 * Revision 1.2.3.2  1996/01/03  21:03:02  Bill_Hallahan
 * 	New audio subsystem
 *
 * Revision 1.2.2.3  1994/11/09  15:52:09  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/08  21:49:43  Krishna_Mangipudi]
 *
 * Revision 1.2.3.2  1994/11/08  21:49:43  Krishna_Mangipudi
 * 	Initial Check-in
 *
 * Revision 1.2.2.2  1994/11/07  22:49:31  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  20:28:43  Krishna_Mangipudi]
 *
 * Revision 1.2.1.2  1994/11/07  20:28:43  Krishna_Mangipudi
 * 	Initial Check-in
 *
 * Revision 1.2  1994/11/04  18:33:29  root
 * Initial load of project
 *
 * Revision 1.2.2.5  1993/07/19  16:05:48  Jim_Ludwig
 * 	change DTKmmioDescend:
 * 	file pointer is left unchanged on failure
 * 	lpck is returned as passed on failure
 * 	[1993/07/19  15:46:21  Jim_Ludwig]
 *
 * Revision 1.2.2.4  1993/06/21  20:53:48  Jim_Ludwig
 * 	Damn HMMIO is unsigned so it doesn't compare well with signed
 * 	ints. Cast it to signed when comparing against MaxOpenNum
 * 	[1993/06/21  20:53:29  Jim_Ludwig]
 * 
 * Revision 1.2.2.3  1993/06/17  15:46:06  Jim_Ludwig
 * 	Fixed the handle stuff, finally
 * 	[1993/06/17  15:45:48  Jim_Ludwig]
 * 
 * Revision 1.2.2.2  1993/05/19  21:01:34  Jim_Ludwig
 * 	fixup -- still not fully tested, though
 * 	[1993/05/19  20:59:43  Jim_Ludwig]
 * 
 * Revision 1.2  1993/03/29  17:16:31  root
 * 	Initial load of project

 * 001	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 002	CAB		05/14/2001	Consolidated copyirght info
 * 003	MGS		06/19/2001	Solaris Port BATS#972
 * 
 */

/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   DTKmmio.c
** MODULE NAME: DTKmmio.c
**
** MODULE DESCRIPTION: 
**	DTKmmio file functions
** 
** DESIGN OVERVIEW: 
** 
**--
*/

/*
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   DTKmmio.c
** MODULE NAME: DTKmmio.c
**
** MODULE DESCRIPTION: 
** 	Microsoft file I/O functions
**	DTKmmioAdvance		advance I/O buffer	not supported
**	DTKmmioAscend		ascend out of chunk
**	DTKmmioClose		close file
**	DTKmmioCreateChunk		create chunk
**	DTKmmioDescend		descend into a chunk
**	DTKmmioFlush		flush file I/O		not supported
**	DTKmmioGetInfo		get file info
**	DTKmmioInstallIOProc	install I/O proc	not supported
**	DTKmmioOpen		open file		deviations from spec
**	DTKmmioRead		read from file
**	DTKmmioRename		rename file
**	DTKmmioSeek		seek in file
**	DTKmmioSendMessage		send msg to I/O proc 	not supported
**	DTKmmioSetBuffer		set I/O buffer		not supported
**	DTKmmioSetInfo		set file info		not supported
**	DTKmmioStringToFOURCC	convert string to FOURCC
**	DTKmmioWrite		write to file
**
**	Private functions:
**	mmeWarning		print warning message (should be replaced)
**	mmeError		print warning message (should be replaced)
**	DTKmmiopAddHandle		allocate internal file handle
**	DTKmmiopCopyIOInfo		copy MMIOINFO structure (for portability)
**	DTKmmiopDeleteHandle	delete internal file handle
** 
** AUTHORS: 
** 	Microsoft
**	Jim Ludwig
** 
** CREATION DATE: 17 March 1993
** 
** DESIGN OVERVIEW: 
** 	Follows microsoft specs for the most part.
** 
*/
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
#include <stdlib.h>
#include <string.h>
#endif
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <ctype.h>
#include "dtmmiodefs.h"

#define LOWORD(word)	(word & 0xff)

#ifndef min
#define min(a,b)	(a <= b ? a : b )
#define max(a,b)	(a >= b ? a : b )
#endif

/******************************************************************************
*******************************************************************************
** CODE
**
*******************************************************************************
******************************************************************************/

#include <stdarg.h>

	/* open files */
typedef struct {
    int 	fd;		/* file descriptor */
    HMMIO 	hmmio;		/* HMMIO handle */
    MMIOINFO	mmioInfo;	/* current info structure */
    BOOL	isNotOurs;	/* file was not opened by us */
} _MMIOOpenHandleStruct, * _mmiopHandle;

static _MMIOOpenHandleStruct * _MMIOOpenHandles = (_MMIOOpenHandleStruct *)NULL;

static int _MMIOMaxOpenNum = -1;	/* highest number currently open */
static int _MMIOAllocedHandles = 0;	/* number in alloced list */
static int _MMIOAvailHandle = -1;	/* next available to use */

#define _MMIOCheckHandle(hmmio) \
!((int)hmmio >= 1 && (int)hmmio <= _MMIOMaxOpenNum \
  && _MMIOOpenHandles[hmmio].fd != -1)
     
#define _MMIOFd(hmmio) 	_MMIOOpenHandles[hmmio].fd
#define _MMIOHandle(hmmio) _MMIOOpenHandles[hmmio].hmmio
#define _MMIOGetHandle(hmmio) &_MMIOOpenHandles[hmmio]

/*
**++
**  FUNCTIONAL_NAME: mmiopAddHandle
**
**  FUNCTIONAL_DESCRIPTION: 
**	add a private handle
**
**  FORMAL PARAMETERS:
**
**  RETURN VALUE:
**
**  COMMENTS:
**
**  DESIGN:
**
**/

#define CHUNK_SIZE 100

static
_mmiopHandle DTKmmiopAddHandle(
	int fd
)
{
    HMMIO handle;
    register int i;

    if ( _MMIOAvailHandle >= 0 ) {

	handle = _MMIOAvailHandle;

	if ( _MMIOMaxOpenNum < _MMIOAvailHandle )
	    _MMIOMaxOpenNum = _MMIOAvailHandle;

	while ( (++_MMIOAvailHandle) < _MMIOAllocedHandles &&
	    _MMIOOpenHandles[_MMIOAvailHandle].fd != -1 );

	if ( _MMIOAvailHandle == _MMIOAllocedHandles )
	    _MMIOAvailHandle = -1;
	
    }
    else { 
        if ( _MMIOAllocedHandles == 0 ) {
	    _MMIOOpenHandles = (_MMIOOpenHandleStruct *)
	        malloc(sizeof(_MMIOOpenHandleStruct) * CHUNK_SIZE);
	    if ( _MMIOOpenHandles == (_MMIOOpenHandleStruct *)NULL )
		return 0;
            handle = _MMIOAvailHandle = 1;
	}
        else {
	    _MMIOOpenHandles = (_MMIOOpenHandleStruct *)
	        realloc(_MMIOOpenHandles, sizeof(_MMIOOpenHandleStruct) * 
	        (_MMIOAllocedHandles + CHUNK_SIZE));
	    if ( _MMIOOpenHandles == (_MMIOOpenHandleStruct *)NULL )
		return 0;
            handle = _MMIOAvailHandle = _MMIOAllocedHandles;
	}
	for ( i = _MMIOAllocedHandles; i < _MMIOAllocedHandles + CHUNK_SIZE; 
		i++ )
	    _MMIOOpenHandles[i].fd = -1;

	_MMIOAvailHandle++;

        _MMIOAllocedHandles += CHUNK_SIZE;
    }

    bzero(&_MMIOOpenHandles[handle], sizeof(_MMIOOpenHandleStruct));
    _MMIOOpenHandles[handle].fd = fd;
    _MMIOOpenHandles[handle].hmmio = handle;

    if ( _MMIOMaxOpenNum < (int)handle ) _MMIOMaxOpenNum = handle;

    return ( &_MMIOOpenHandles[handle] );
}

/*
**++
**  FUNCTIONAL_NAME: DTKmmiopDeleteHandle
**
**  FUNCTIONAL_DESCRIPTION: 
**	delete a private handle
**
**  FORMAL PARAMETERS:
**
**  RETURN VALUE:
**
**  COMMENTS:
**
**  DESIGN:
**
**/
static
void DTKmmiopDeleteHandle(HMMIO handle)
{
    _MMIOOpenHandles[handle].fd = -1;
    _MMIOOpenHandles[handle].hmmio = -1;
    if ( (int)handle < _MMIOAvailHandle ) _MMIOAvailHandle = handle;
    return;
}
    

/*
**++
**  FUNCTIONAL_DESCRIPTION: mmeWarning
**	print out an internal warning message
**
**	mmeError
**	prints out the message and aborts
**
**  FORMAL PARAMETERS:
**	format and variable argument list
**
**  RETURN VALUE:
**	none
**
**  DESIGN:
**	eventually we need to provide a better error mechanism here
**
**/
/* VARARGS */
void
mmeWarning(char * format, ... )
{
    va_list ap;
    va_start(ap, format);
    format = va_arg(ap, char *);
    fprintf(stderr,"MME Warning: ");
    vfprintf(stderr,format,ap);
    fflush(stderr);
    va_end(ap);
}
void
mmeError(char * format, ... )
{
    va_list ap;
    va_start(ap, format);
    fprintf(stderr,"MME fatal error: ");
    vfprintf(stderr,format,ap);
    fflush(stderr);
    va_end(ap);
    exit(1);
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmiopCopyIOInfo
**	copy the fields in the IO info structure
**
**  FORMAL PARAMETERS:
**	lpmmioinfo_src	source structure
**	lpmmioinfo_dest	destination structure
**
**  RETURN VALUE:
**	none
**
**  DESIGN:
**
**/

void
DTKmmiopCopyIOInfo(
	LPMMIOINFO src, 
	LPMMIOINFO dest
)
{
    
    dest->dwFlags 	= src->dwFlags;
    dest->fccIOProc 	= src->fccIOProc;
    dest->pIOProc 	= src->pIOProc;
    dest->wErrorRet 	= src->wErrorRet;
    dest->cchBuffer 	= src->cchBuffer;
    dest->pchBuffer 	= src->pchBuffer;
    dest->pchNext 	= src->pchNext;
    dest->pchEndRead 	= src->pchEndRead;
    dest->pchEndWrite 	= src->pchEndWrite;
    dest->lBufOffset 	= src->lBufOffset;
    dest->lDiskOffset 	= src->lDiskOffset;
    dest->adwInfo[0] 	= src->adwInfo[0];
    dest->adwInfo[1] 	= src->adwInfo[1];
    dest->adwInfo[2] 	= src->adwInfo[2];
    dest->adwInfo[3] 	= src->adwInfo[3];
    dest->dwReserved1 	= src->dwReserved1;
    dest->dwReserved2 	= src->dwReserved2;
    dest->hmmio 	= src->hmmio;
}
	
/******************************************************************************
*******************************************************************************
** PUBLIC CODE
**
*******************************************************************************
******************************************************************************/

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioAdvance
**	This function advances the I/O buffer of a file set up for
**	direct I/O buffer access with mmioGetInfo. If the file is opened for
**	reading, the I/O buffer is filled from the disk. If the file
**	is opened for writing and the MMIO_DIRTY flag is set in the dwFlags
**	field of the MMIOINFO structure, the buffer is written to disk. The
**	pchNext, pchEndRead, and pchEndWrite fields of the MMIOINFO structure
**	are updated to reflect the new state of the I/O buffer.
**
**  DEVIATIONS FROM SPEC
**	Not supported
**
**  FORMAL PARAMETERS:
**	hmmio	   Specifies the file handle for a file opened with mmioOpen
**	lpmmioinfo Specifies a far pointer to the MMIOINFo structure
**		   obtained with mmioGetInfo.
**	wFlags	   Specifies options for the operation. Contains exaactly
**		   one of the following two flags:
**		MMIO_READ 	The buffer is filled from the file
**		MMIO_WRITE	The buffer is written to the file
**
**  RETURN VALUE:
**	For now, onlyMMIOERR_UNBUFFERED
**
**	The return value is zero if the operation is successful.
**	Otherwise, the return value specifies an error code. The error code
**	can be one of the following codes:
**		MMIOERR_CANNOTWRITE 
**		    The contents of the buffer could not be written to the disk
**		MMIOERR_CANNOTREAD 
**		    An error occurred while re-filling the buffer
**		MMIOERR_UNBUFFERED
**		    The specified file is not opened for buffered I/O
**		MMIOERR_CANNOTEXPAND 
**		    The specified memory file cannot be expanded, probably 
**		    because the adwInfo[0] field was set to zero in the initial
**		    call to mmioOpen
**		MMIOERR_OUTOFMEMORY 
**		    There was not enough memory to expand a memory
**		    file for further writing
**
**  DESIGN:
**	If the specified file is opened for writing or for both
**	reading and writing, the I/O buffer will be flushed to disk before the
**	next buffer is read. If the I/O buffer cannot be written to disk
**	because the disk is full, then mmioAdvance will return
**	MMIOERR_CANNOTWRITE.
**	
**	If the specified file is only open for writing, the MMIO_WRITE flag
**	must be specified.
**	
**	If you have written to the I/O buffer, you must set the MMIO_DIRTY
**	flag in the dwFlags field of the MMIOINFO structure before calling
**	mmioAdvance. Otherwise, the buffer will not be written to disk.
**	
**	If the end of file is reached, mmioAdvance will still return success,
**	even though no more data can be read. Thus, to check for the end of
**	the file, it is necessary to see if the pchNext and pchEndRead fields
**	of the MMIOINFO structure are equal after calling mmioAdvance.
**
**/
MMRESULT APIENTRY 
DTKmmioAdvance(
    HMMIO hmmio, 
    MMIOINFO * lpmmioinfo, 
    UINT uFlags
)
{
    return(MMIOERR_UNBUFFERED);
}
    
/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioOpen
**	This function opens a file for unbuffered or buffered I/O. The
**	file can be a DOS file, a memory file, or an element of a custom
**	storage system.
**	
**  DEVIATIONS FROM SPEC
**	buffered I/O is not supported
**	installable I/O procs are not handled
**	dos file naming conventions are not supported
**	file access flags are not supported
**	memory files are not supported
**	adwInfo[0] can contain a file handle with
**		restrictions that the file be seekable with lseek
**	path name length restrictions differ from DOS (see below)
**	the use of the following flags will generate an error:
**	    MMIO_ALLOCBUF
**	    MMIO_COMPAT
**	    MMIO_EXCLUSIVE
**	    MMIO_DENYWRITE
**	    MMIO_DENYREAD
**	    MMIO_DENYNONE
**	Warning: for UNIX hacks, these parameters have different
**	    semantics than UNIX's open or fopen
**	The mmioOpen spec has a comment that open files are
**	not automagically closed when the application exists.
**	That is not true here for this release.
**
**  FORMAL PARAMETERS:
**	szFileName  Specifies a far pointer to a string containing
**		    the filename of the file to open. If no I/O procedure is
**		    specified to open the file, then the filename determines how
**		    the file is opened, as follows:
**
**		    + If the filename does no contain "+", then it is assumed to
**		      be the name of a DOS file (not supported)
**
**		    + If the filename is of the form "foo.ext+bar", then the
**		      extension "EXT" is assumed to identify an instaed I/O
**		      procedure which is called to perform I/O on the file (see
**		      mmioInstallIOProc) (not supported)
**
**		    + If the filename is NULL and no I/O procedure is given,
**		      then adwInfo[0] is assumed to be the DOS file handle of a
**		      currently open file. (adwInfo[0] represents the handle of 
**		      a UNIX file descriptor of the type returned by open(2) 
**		      or an equivalent function. The file must be seek'able 
**		      with lseek (e.g., not a pipe). In addition, file 
**		      descriptor 0 is not a valid descriptor to place here, 
**		      otherwise we can't tell if someone screwed up or are 
**		      initializing lpmmioinfo with all zeros.)
**
**		    The filename should not be longer than 128 bytes, including
**		    the terminating NULL. (This should read, the length of the
**		    path string cannot exceed PATH_MAX nor can a component
**		    exceed NAME_MAX).
**
**		    When opening a memory file, set
**		    szFilename to NULL (not supported)
**	lpmmioinfo  Specifies a far pointer to an MMIOINFO
**		    structure containing extra parameters used by mmioOpen.
**		    Unless you are opening a memory file, specifying the
**		    size of a buffer for buffered I/O, or specifying an
**		    uninstalled I/O procedure to open a file, this paramter
**		    should be NULL.
**
**		    If lpmmioinfo is not NULL, all
**		    unused fields of the MMIOINFO structure it references
**		    must be set to zero, including the reserved fields.
**
**		    (The spec is inconsitent. adwInfo[0] can be set to an
**		    already open file handle without any of the above being
**		    true.
**		    All but the adwInfo field is supported. If anything is
**		    not null, a MMIOERR_CANNOTOPEN error will be returned)
**	dwOpenFlags Specifies option flags for the open
**		    operation. The MMIO_READ, MMIO_WRITE, and
**		    MMIO_READWRITE flags are mutually exclusive -- only one
**		    should be specified. The MMIO_COMPAT, MMIO_EXLUSIVE,
**		    MMIO_DENTWRITE, MMIO_DENYREAD, and MMIO_DENYNONE flags
**		    are DOS file-sharing flags, and can only be used after
**		    the DOS command SHARE has been executed (not
**		    supported).
**		    
**		    MMIO_READ 	Opens the file for reading only. This
**			is the default, if MMIO_WRITE and MMIO_READWRITE are
**			not specified.
**		    
**		    MMIO_WRITE	Opens the file for writing. You should
**			not read from a file opened in this mode.
**
**		    MMIO_READWRITE	Opens the file for both reading and
**			writing.
**
**		    MMIO_CREATE	Creates a new file. If the file already
**			exists, it is truncated to zero length. For memory
**			files, MMIO_CREATE indicates the end of the file is
**			initially at the start of the buffer.
**
**		    MMIO_DELETE	Deletes a file. If this flag is
**			specified, szFilename shoudl not be NULL. The return
**			value will be TRUE (cast to HMMIO) if the file was
**			deleted successfully, FALSE otherwise. Do not call
**			mmioClose for a file that has been deleted. If this
**			flag is specified, all other flags are ignored.
**
**		    MMIO_ALLOCBUF	Opens a file for buffered I/O. To
**			allocate a buffer larger or smaller than the default
**			buffer size (8K), set the cchBuffer field of the
**			MMIOINFO structure to the desired buffer size. If
**			cchBuffer is zero, then the default buffer size is
**			used. If you are providing your own I/O buffer, then
**			the MMIO_ALLOCBUF flag should not be used. (not
**			supported).
**
**		    MMIO_COMPAT	Opens the file with compatibility mode,
**			allowing any process on a given machine to open the
**			file any number of times. mmioOpen fails if the file
**			has been opened with any of the other sharing modes.
**			(not supoprted).
**
**		    MMIO_EXCLUSIVE	Opens the file with exclusive mode,
**			denying other processes both read and write access to
**			the file. mmioOpen fails if the file has been opened in
**			any other mode for read or write access, even by the
**			current process.  (not supoprted).
**
**		    MMIO_DENYWRITE	Opens the file and denies other
**			processes write access to the file. mmioOpen fails if
**			the file has been opened in compatibility or for write
**			access by any other process. (not supported)
**
**		    MMIO_DENYREAD	Opens the file and denies other
**			processes read access to the file. mmopOpen fails if
**			the file has been opened in compatibility mode or for
**			read access by any other process. (not supported)
**
**		    MMIO_DENYNONE	Opens the file without denying other
**			processes read or write access to the file. mmioOpen
**			fails if the file has been opened in compatibility mode
**			by any other process. (not supported)
**
**  RETURN VALUE:
**	The return value is a handle to the opend file.
**	This handle is not a DOS file handle (nor is it a UNIX
**	file handle) -- do not use if with any file I/O
**	functions other than MMIO functions.
**
**	If the file cannot be opened, the return value is NULL.
**	If lpmmioinfo is not NULL, then its wError field will
**	contain extended error information returned by the I/O
**	procedure.
**
**  SIDE EFFECTS:
**	when lpmmioinfo is used, wError field will be set with
**		any error conditions
**
**  DESIGN:
**	none needed at this point
**	eventually, all file based I/O should come through this
** 	interface or a more generic interface to handle files
**	on remote systems, pipes, etc.
**	eventually, we will also want to check the current list
** 	of open files to reuse information if possible
**
**/
#define DTKmmioOpenSetError(error) 			\
    {							\
    if ( lpmmioinfo != (MMIOINFO FAR *)NULL ) 		\
	lpmmioinfo->wErrorRet = error; 			\
    return ((HMMIO)NULL);				\
    }							

HMMIO APIENTRY 
DTKmmioOpen(
	LPSTR szFileName, 
	MMIOINFO * lpmmioinfo,
    	DWORD dwOpenFlags
)
{
    int 		openFlags;
    int 		fd;
    _mmiopHandle 	handle;
    BOOL		fileAlreadyOpen = FALSE;
    char *		fileName = (char *)szFileName;
    	
    /* Delete says we ignore everything else, so try this first */
    if ( dwOpenFlags & MMIO_DELETE && szFileName != (LPSTR)NULL) {
	if ( unlink(szFileName) != 0 ) 
	    DTKmmioOpenSetError(MMIOERR_CANNOTWRITE);
	return((HMMIO)TRUE);
    }

    /* Do not support some flags */
    if ( dwOpenFlags & 
	 (MMIO_ALLOCBUF 	| 
	  MMIO_COMPAT 		| 
	  MMIO_EXCLUSIVE	|
	  MMIO_DENYWRITE	|
	  MMIO_DENYREAD		|
	  MMIO_DENYNONE		) )
	  DTKmmioOpenSetError(MMIOERR_CANNOTOPEN);

    if ( lpmmioinfo != (MMIOINFO FAR *)NULL && (
        lpmmioinfo->dwFlags     != (int) NULL           ||
    	lpmmioinfo->fccIOProc 	!= (FOURCC)NULL		||
    	lpmmioinfo->pIOProc	!= (LPMMIOPROC)NULL	||
    	lpmmioinfo->wErrorRet	!= (WORD)0		||
    	lpmmioinfo->cchBuffer	!= (LONG)0		||
    	lpmmioinfo->pchBuffer	!= (HPSTR)NULL		||
    	lpmmioinfo->pchNext	!= (HPSTR)NULL		||
    	lpmmioinfo->pchEndRead	!= (HPSTR)NULL		||
    	lpmmioinfo->pchEndWrite	!= (HPSTR)NULL		||
    	lpmmioinfo->lBufOffset 	!= 0			||
    	lpmmioinfo->lDiskOffset	!= 0			||
    	lpmmioinfo->adwInfo[1] 	!= 0			||
    	lpmmioinfo->adwInfo[2] 	!= 0			||
    	lpmmioinfo->adwInfo[3] 	!= 0			||
    	lpmmioinfo->dwReserved1	!= 0			||
    	lpmmioinfo->dwReserved2	!= 0			||
    	lpmmioinfo->hmmio	!= (HMMIO)NULL) )
	DTKmmioOpenSetError(MMIOERR_CANNOTOPEN);

    if ( fileName == (LPSTR)NULL ) {
        if ( lpmmioinfo != (MMIOINFO FAR *)NULL && lpmmioinfo->adwInfo[0] > 0 )
	    fileAlreadyOpen = TRUE;
	else if ( dwOpenFlags & MMIO_GETTEMP ) {
	     /* create a name */
		 char template[] = "mmioXXXXXX";
	     fileName = (char *)
		 malloc(sizeof(char) * (strlen(template)+1) );
	     strcpy(fileName, template);
#ifdef VXWORKS
#else
		 (void)mktemp(fileName);
#endif
	     if ( fileName[0] == '\0' ) {
		 free(fileName);
		 DTKmmioOpenSetError(MMIOERR_CANNOTOPEN);
	    }
	}
	else
	    DTKmmioOpenSetError(MMIOERR_CANNOTOPEN);
    }

    if ( fileAlreadyOpen == FALSE ) {
        openFlags = 0;
        if ( dwOpenFlags & MMIO_READ ) 
	    openFlags = O_RDONLY;
        if ( dwOpenFlags & MMIO_WRITE )
	    openFlags = O_WRONLY;
        if ( dwOpenFlags & MMIO_READWRITE) 
	    openFlags = O_RDWR;
        if ( dwOpenFlags & MMIO_CREATE )
	    openFlags |= O_CREAT | O_TRUNC;
        
        fd = open(fileName, openFlags, 0600);
    
        if ( fd < 0 ) {
	    switch(errno) {
	        case ENOMEM:
	        case ENOSR:
	    	    DTKmmioOpenSetError(MMIOERR_OUTOFMEMORY);
	        default:
		    DTKmmioOpenSetError(MMIOERR_CANNOTOPEN);
	    }
        }
    }
    else
	fd = (int)lpmmioinfo->adwInfo[0];

    handle = DTKmmiopAddHandle(fd);
    if ( handle == (_mmiopHandle)NULL ) {
	  if ( fileAlreadyOpen == FALSE )
	      close(fd);
	  DTKmmioOpenSetError(MMIOERR_OUTOFMEMORY);
    }
    handle->mmioInfo.dwFlags 	= dwOpenFlags;
    handle->mmioInfo.fccIOProc 	= (FOURCC)NULL;
    handle->mmioInfo.pIOProc	= (LPMMIOPROC)NULL;
    handle->mmioInfo.wErrorRet	= (WORD)0;
    handle->mmioInfo.cchBuffer	= (LONG)0;
    handle->mmioInfo.pchBuffer	= (HPSTR)NULL;
    handle->mmioInfo.pchNext	= (HPSTR)NULL;
    handle->mmioInfo.pchEndRead	= (HPSTR)NULL;
    handle->mmioInfo.pchEndWrite= (HPSTR)NULL;
    handle->mmioInfo.lBufOffset = 0;
    handle->mmioInfo.lDiskOffset= 0;
    if ( lpmmioinfo != (MMIOINFO FAR *)NULL )
        handle->mmioInfo.adwInfo[0] = lpmmioinfo->adwInfo[0];
    handle->mmioInfo.adwInfo[1] = 0;
    handle->mmioInfo.adwInfo[2] = 0;
    handle->mmioInfo.adwInfo[3] = 0;
    handle->mmioInfo.dwReserved1= 0;
    handle->mmioInfo.dwReserved2= 0;
    handle->mmioInfo.hmmio	= handle->hmmio;

    handle->isNotOurs		= fileAlreadyOpen;

    return(handle->hmmio);
}
		

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioClose
**	This fnction closes a file opened with dTKmmioOpen
**
**  DEVIATIONS FROM SPEC
** 	If the file isn't one of ours, we don't close it.
**	The DTKmmioOpen has a comment that open files are
**	not automagically closed when the application exists.
**	That is not true here for this release.
**
**  FORMAL PARAMETERS:
**	hmmio 	specifies the file handle of the file to close
**	uFlags	specifies options for the close operation
**		MMIO_FHOPEN If the file was opened by passing a DOS
**		(UNIX in our case) file handle of an already-opened file 
**		to DTKmmioOpen, then using this flag tells DTKmmioClose to close 
**		the MMIO file handle, but not the DOS (UNIX) file handle.
**
**  RETURN VALUE:
**	The return value is zero if the function is
**	successful. Othewise, the return value is an error
**	code, either from DTKmmioFlush or from the I/O procedure.
**	The error code can be one of the following codes:
**
**	MMIOERR_CANNOTWRITE	the contents of the buffer
**	    could not be written to disk.
**	error otherwise
**
**  DESIGN:
**	none
**
**/
MMRESULT APIENTRY
DTKmmioClose(
    HMMIO hmmio, 
    UINT uFlags
)
{
    _mmiopHandle handle;
    int 	fd;
    BOOL	fileIsNotOurs;
    
    if ( _MMIOCheckHandle(hmmio) )
	return(MMIOERR_CANNOTWRITE);
    handle = _MMIOGetHandle(hmmio);

    fd = handle->fd;
    fileIsNotOurs = handle->isNotOurs;

    DTKmmiopDeleteHandle(hmmio);
    
    /* Close unless the file isn't ours AND MMIO_FHOPEN was specified */
    if ( !(fileIsNotOurs == TRUE && uFlags & MMIO_FHOPEN) )
        if ( close(fd) != 0 )
	    return(MMIOERR_CANNOTWRITE);

    return(0);
}
	

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioStringToFOURCC
**	This function converts a null-terminated string
**	to a four-character code.
**
**  DEVIATIONS FROM SPEC
**	none
**
**  FORMAL PARAMETERS:
**	sz	specifies a far pointer to a
**		null-terminated string to a four-character code
**	uFlags	specifies options for the conversion
**	  	MMIO_TOUPPER converts all characters to uppercase
**
**  RETURN VALUE:
**	The return value is the four character code
**	created from the given string.
**
**  COMMENTS:
**	This function does not check to see if the
**	string sz follows conventsions regarding legal
**	characters to use in a four-character code. The string
**	is simply copied to a four-character code and padded to
**	the right with blansk or truncated to four characters
**	are required.
**
**  DESIGN:
**	none
**
**/
FOURCC APIENTRY 
DTKmmioStringToFOURCC(
	LPCSTR sz, 
	UINT uFlags
)
{
    int size, i;
    char tmp[4];

    if ( sz == (LPCSTR)NULL )
	return (FOURCC)0;

    /* to pad the right with blanks... */
    strcpy(tmp, "    ");

    /* copy in the string, up to 4 characters */
    size = min(4,strlen(sz));
    strncpy(tmp, sz, size);

    /* convert to upper case if appropriate */
    if ( uFlags & MMIO_TOUPPER ) 
	for ( i = 0; i < size; i++ )
	    if ( islower(tmp[i]) ) tmp[i] = toupper(tmp[i]);

    /* return the FOURCC */
    return(DTKmmioFOURCC(tmp[0],tmp[1],tmp[2],tmp[3]));
}
    
/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioInstallIOProc
**	This function installs or removes a custom I/O procedure. It
** 	will also locate an installed I/O procedure, given its corresponding
** 	four-character code.
**
**  DEVIATIONS FROM SPEC
**	Not implemented
**
**  FORMAL PARAMETERS:
**	fccIOProc	specifies a four-character code identifying
**			the I/O procedure to install, remove, or locate. 
**			All characters in this four-character code should 
**			be uppercase characters.
**	pIOProc		specifies the address of the I/O procedure to
**			install. To remove or locate an I/O procedure,
**			set this parameter to NULL.
**	dwFlags		specifies one of the following flags indicating
**			whether the I/O procedure is being installed,
**			removed, or located:
**		MMIO_INSTALLPROC installs the specified I/O procedure
**		MMIO_REMOVEPROC  removes the specified I/O procedure
**		MMIO_FINDPROC	 searches for the specified I/O procedure
**
**  RETURN VALUE:
**	only return NULL since this is not implemented
**	The return value is the address of the I/O procedure
**	installed, removed, or located. If there is an error, the return value
**	is NULL.
**
**  DESIGN:
**
**/
LPMMIOPROC APIENTRY 
DTKmmioInstallIOProc(
	FOURCC fccIOProc, 
	LPMMIOPROC pIOProc,
    	DWORD dwFlags
)
{
    return((LPMMIOPROC WINAPI)NULL);
}


/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioRename
**	rename a file
**
**  DEVIATIONS FROM SPEC
**	none, except I can't find a spec about the return values
**
**  FORMAL PARAMETERS:
**	szFileName	old file name
**	szNewFileName	new file name
**	lpmmioinfo	contains something, but I don't have a spec
**	dwRenameFlags	must be 0
**
**  RETURN VALUE:
**	0 on success
**	error otherwise
**
**  DESIGN:
**	none
**
**/
MMRESULT APIENTRY 
DTKmmioRename( 
	LPCSTR szFileName, 
	LPCSTR szNewFileName,
     	MMIOINFO * lpmmioinfo, 
	DWORD dwRenameFlags
)
{
    if ( szFileName == (LPCSTR)NULL || szFileName[0] == '\0' )
	return MMIOERR_FILENOTFOUND;
    if ( szNewFileName == (LPCSTR)NULL || szNewFileName[0] == '\0' )
	return MMIOERR_FILENOTFOUND;
    if ( rename(szFileName, szNewFileName) == 0 )
	return 0;
    switch(errno) {
	case EACCES:
	case EROFS:
	case ENOSPC:
#ifndef VXWORKS
	case EDQUOT:
#endif
	case EPERM:
	    return MMIOERR_CANNOTWRITE;
	default:
	    return MMIOERR_FILENOTFOUND;
    }
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioRead
**	This function reads a specified number of bytes
**	from a file opened with DTKmmioOpen
**
**  DEVIATIONS FROM SPEC
**	none, except:
**  	DTKmmioRead says that if it encounters an end of file, it will return 0
**  	bytes read. It doesn't say if
**  	1) it filled what it could in the buffer
**  	2) it didn't fill the buffer and if  not
**  	2a) it left the file pointer at the end of the file
**  	2b) it left the file pointer at the location where it all started
**  
**  	Anyone have a feel for how this might be handled? Can we get a
**  	clarification from microsoft?
**  
**  	For now, I'm going to 
**  	fill the buffer with what I can
**  	return 0 to indicate end of file was reached
**
**  FORMAL PARAMETERS:
**	hmmio	specifies the file handle of the file to be read
**	pch	specifies a huge pointer to a buffer to
**		contain the data read from the file.
**	cch 	specifies the number of bytes to read
**		from the file.
**
**  RETURN VALUE:
**	The return value is the number of bytes
**	actually read. If the end of the file has been reached
**	and no more bytes can be read, the return value is
**	zero. If there is an error reading from the file, the
**	return value is -1.
**
**  DESIGN:
**	none
**
**/
MMRESULT APIENTRY 
DTKmmioRead(
	HMMIO hmmio, 
	HPSTR pch, 
	LONG cch
)
{
    size_t n;
    _mmiopHandle handle;

    if ( _MMIOCheckHandle(hmmio) )
	return -1;
    handle = _MMIOGetHandle(hmmio);

    if ( pch == (HPSTR)NULL )
	return -1;
    if ( cch == 0 )
	return 0; /* serves them right...this says end of file has been
		   * reached or you got the 0 bytes you wanted...
		   */
    n = read(handle->fd, pch, (size_t)cch);

    return((MMRESULT APIENTRY)n);
}
    
    
/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioWrite
**	This function writes a specified number of
**	bytes to a file opened with DTKmmioOpen
**
**  DEVIATIONS FROM SPEC
**	none
**
**  FORMAL PARAMETERS:
**	hmmio	specifies the file handle of the file
**	pch	specifies a huge pointer to the buffer
**		to be written to the file.
**	cch 	specifies the number of bytes to write to the file
**
**  RETURN VALUE:
**	The return value is the number of bytes
**	actually written. If there is an error writing to the
**	file, the return value is -1.
**
**  COMMENTS:
**	the current file position is incremented by the
**	number of bytes written.
**
**  DESIGN:
**	none
**
**/
MMRESULT APIENTRY
DTKmmioWrite(
	HMMIO hmmio, 
	LPSTR pch, 
	LONG cch
)
{
    size_t n;
    _mmiopHandle handle;

    if ( _MMIOCheckHandle(hmmio) )
	return -1;
    handle = _MMIOGetHandle(hmmio);

    if ( pch == (HPSTR)NULL )
	return -1;
    if ( cch == 0 )
	return 0; 
    n = write(handle->fd, pch, (size_t)cch);

    return((MMRESULT APIENTRY)n);
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioSeek
**	This function changes the current file position
**	in a file opened with DTKmmioOpen. The current file
**	position is the location in the file where data is read
**	or written.
**
**  DEVIATIONS FROM SPEC
**	none
**
**  FORMAL PARAMETERS:
**	hmmio	specifies the file handle of the file to seek in
**	lOffset	specifies the offset to change the file position
**	iOrigin	specifies how the offet specified by
**		lOffset is interpreted. Contains one of the following
**		flags:
**
**		SEEK_SET	Seeks to lOffset bytes from the
**				beginning of the file.
**
**		SEEK_CUR	Seeks to lOffset bytes from the current
**				file position.
**
**		SEEK_END	Seeks to lOffset bytes from the end of
**				the file.
**  RETURN VALUE:
**	The return value is the new file position in
**	bytes, relative to the beginning of the file. If there
**	is an error, the return value is -1.
**
**  DESIGN:
**	Seeking to an invalid location in the file,
**	such as past the end of the file, may not cause
**	DTKmmioSeek to return an error, but may cause sebsequent
**	I/O operations on the file to fail.
**
**	To locate the end of a file, call DTKmmioSeek with lOffset
**	set to zero and iOrigin set to SEEK_END
**
**/
MMRESULT APIENTRY
DTKmmioSeek(
	HMMIO hmmio, 
	LONG lOffset, 
	int iOrigin
)
{
    off_t n;
    _mmiopHandle handle;

    if ( _MMIOCheckHandle(hmmio) )
	return -1;
    handle = _MMIOGetHandle(hmmio);

    n = lseek(handle->fd, (off_t)lOffset, iOrigin);

    return((MMRESULT APIENTRY)n);
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioGetInfo
**	The function retrieves information about a file opened with
**	DTKmmioOpen. This information allows the caller to directly access the I/O
**	buffer, if the file is opened for buffered I/O.
**  DEVIATIONS FROM SPEC
**	Supported in that info is returned, but remember that no
** 	buffered I/O is supported.
**
**  FORMAL PARAMETERS:
**	hmmio	Specifies the file handle of the file
**	lpmmioinfo Specifies a far pointer to a caller-allocated
**		MMIOINFO structure that DTKmmioGetInfo fills with information 
**		about the file. See the MMIOINFO structure and the 
**		DTKmmioOpen function for information about the fields in 
**		this structure.
**	wFlags  Is not used and should be set to zero
**
**  RETURN VALUE:
**	The return value is zero if the function is successful.
**
**  DESIGN:
**	none
**
**/
MMRESULT APIENTRY
DTKmmioGetInfo(
	HMMIO hmmio, 
	MMIOINFO FAR* lpmmioinfo, 
	UINT uFlags
)
{
    _mmiopHandle handle;

    if ( _MMIOCheckHandle(hmmio) )
	return (MMRESULT APIENTRY)0;
    handle = _MMIOGetHandle(hmmio);

    if ( lpmmioinfo == (MMIOINFO FAR*)NULL )
	return (MMRESULT APIENTRY)0;

    DTKmmiopCopyIOInfo(&(handle->mmioInfo),lpmmioinfo);
    lpmmioinfo->wErrorRet = MMIOERR_UNBUFFERED;
    
    return (MMRESULT APIENTRY)0;
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioSetInfo
**	This function updates the information retrieved
**	by DTKmmioGetInfo about a file opened with DTKmmioOpen. Use
**	this function to terminate direct buffer access of a
**	file opened for buffer I/O.
**
**  DEVIATIONS FROM SPEC
**	Not implemented
**	So we return MMIOERR_UNBUFFERED
**
**  FORMAL PARAMETERS:
**	hmmio	    specifies the file handle of the file
**	lpmmioinfo  specifies a far pointer to an
**		    MMIOINFO structure filled with information with
**		    DTKmmioGetInfo.
**	wFlags	    is not used and should be set to zero
**
**  RETURN VALUE:
**	The return value is zero if the function is successful.
**	(Since the spec doesn't say what happens if the
**	function is not successful, we are returning
**	MMIOERR_UNBUFFERED to indicate that buffered I/O is not
**	supported.)
**
**  DESIGN:
**
**/
MMRESULT APIENTRY
DTKmmioSetInfo(
	HMMIO hmmio, 
	LPMMIOINFO lpmmioinfo, 
	UINT uFlags
)
{
	return (MMRESULT APIENTRY)MMIOERR_UNBUFFERED;
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioSetBuffer
**	This function enables or disables buffered I/O,
**	or chagnes the buffer or buffer size for a file opened
**	with DTKmmioOpen.
**
**  DEVIATIONS FROM SPEC
**	There is no buffered I/O implemented so we just
**	return MMIOERR_UNBUFFERED.
**
**  FORMAL PARAMETERS:
**	hmmio	specifies the file handle of the file.
**
**	pchBuffer	
**		specifies a far pointer to a
**		caller-supplied buffer to use for buffered I/O. If
**		NULL, DTKmmioSetBuffer allocates an internal buffer for
**		buffered I/O.
**
**	cchBuffer	
**		specifies the size of the
**		caller-supplied buffer, or the size of the buffer for
**		DTKmmioSetBuffer to allocate.
**
**	wFlags	is not used and should be set to zero.
**
**  RETURN VALUE:
**	The return value is zero if the function is
**	successful. Otherwise, the return value specifies an
**	error code. If an error occurs, the file handle
**	remoains valid. the error code can be one of the
**	following codes:
**
**	MMOIERR_CANNOTWRITE	The contents of the old buffer
**			could not be written to disk, so the operation was
**			aborted.
**
**	MMIOERR_OUTOFMEMORY	The new buffer could not be
**			allocated, probably due to a lack of available memory.
**
**	spec doesn't allow us to return "not implemented"
**	So we are adding another error code, 
**	MMIOERR_UNBUFFERED	to be returned right now
**
**  DESIGN:
**	none
**
**/
MMRESULT APIENTRY
DTKmmioSetBuffer(
	HMMIO hmmio, 
	LPSTR pchBuffer, 
	LONG cchBuffer,
    	UINT uFlags
)
{
	return (MMRESULT APIENTRY)MMIOERR_UNBUFFERED;
}
/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioFlush
**	This function writes the I/O buffer of a file to disk, if the
**	I/O buffer has been written to.
**
**  DEVIATIONS FROM SPEC
**	Not supported.
**	We just return 0
**
**  FORMAL PARAMETERS:
**	hmmio	Specifies the file handle of a file opened with DTKmmioOpen
**	wflags	Is not used and should be set to zero
**
**  RETURN VALUE:
**	The return value is zero if the function is successful.
** 	Otherwise, the return value specifies an error code. The error code can
** 	be one of the following codes:
**	    MMIOERR_CANNOTWRITE 
**		The contents of the buffer could no be written to disk
**  DESIGN:
**	Closing a file with DTKmmioClose will automatically flush its
**	buffer.
**	
**	If there is insufficient disk space to write the buffer, DTKmmioFlush will
**	fail, even if the preceding DTKmmioWrite calls were successful.
**
**/
MMRESULT APIENTRY
DTKmmioFlush(
	HMMIO hmmio, 
	UINT uFlags
)
{
	return (MMRESULT APIENTRY)0;
}
/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioSendMessage
**	This function sends a message to the I/O
**	procedure associated with teh specified file.
**
**  DEVIATIONS FROM SPEC
**	I/O Procs are not implemented, so this always returns 0
**	meaning the (non-existant) I/O proc doesn't recognize the message
**
**  FORMAL PARAMETERS:
**	hmmio	specifies the file handle for a file
**		opened with DTKmmioOpen
**
**	wMsg	specifies the message to send to the I/O
**		procedure
**
**	lParam1	specifies a parameter for the message
**
**	lParam2	specifies a parameter for the message
**
**  RETURN VALUE:
**	The return value depends on the message. If the
**	I/O procedure does not recognize the message, the
**	return value is zero.
**
**  DESIGN:
**	none
**
**/
MMRESULT APIENTRY
DTKmmioSendMessage(
	HMMIO hmmio, 
	UINT uMessage,
    	LPARAM lParam1, 
	LPARAM lParam2
)
{
	return (MMRESULT APIENTRY) 0;
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioAscend
**	This function ascends out of a chunk in a
**	RIFF file descended into with DTKmmioDescend or created with 
**	DTKmmioCreateChunk. 
**
**  DEVIATIONS FROM SPEC
**	none
**
**  FORMAL PARAMETERS:
**	hmmio 	Specifies the file handle of an open RIFF file.
**	lpck 	Specifies a far pointer to a
**		caller-supplied MMCKINFO structure previously filled by 
**		DTKmmioDescend or DTKmmioCreateChunk.
**	wFlags 	Is not used and should be set to zero.
**
**  RETURN VALUE:
**	The return value is zero if the function is successful.
**	Otherwise, the return value specifies an error code. The error
**	code can be one of the following codes:
**	    MMIOERR_CANNOTWRITE  The contents of the buffer could
**		not be written to disk.
**	    
**	    MMIOERR_CANNOTSEEK   There was an error while seeking to
**		the end of the chunk.
**
**  DESIGN:
**
**	If the chunk was descended into using DTKmmioDescend, then
**	DTKmmioAscend seeks to the location following the end of the
**	chunk (past the extra pad byte, if any).
**	
**	If the chunk was created and descended into using
**	DTKmmioCreateChunk, or if the MMIO_DIRTY flag is set in the 
**	MMCKINFO.dwFlags field of the MMCKINFO structure
**	referenced by lpck, then the current file position
**	is assumed to be the end of the data portion of the chunk.
**	If the chunk size is not the same as the value stored
**	in the MMCKINFO.cksize field when DTKmmioCreateChunk
**	was called, then DTKmmioAscend corrects the chunk
**	size in the file before ascending from the chunk. If the chunk
**	size is odd, DTKmmioAscend writes a null pad byte at the end of the
**	chunk. After ascending from the chunk, the current file position is
**	the location following the end of the chunk (past the extra pad byte,
**	if any).
**
*/
MMRESULT APIENTRY
DTKmmioAscend(
    HMMIO hmmio, 
    MMCKINFO FAR* lpck, 
    UINT uFlags
)
{
    static BYTE	bPad = 0;		/* pad null */
	DWORD temp[10];

    if (lpck->dwFlags & MMIO_DIRTY) {
	/* <lpck> refers to a chunk created by DTKmmioCreateChunk();
	 * check that the chunk size that was written when
	 * DTKmmioCreateChunk() was called is the real chunk size;
	 * if not, fix it
	 */
	long		lOffset;	/* current offset in file */
	long		lActualSize;	/* actual size of chunk data */

	if ((lOffset = DTKmmioSeek(hmmio, 0L, SEEK_CUR)) == -1)
	    return MMIOERR_CANNOTSEEK;
	if ((lActualSize = lOffset - lpck->dwDataOffset) < 0)
	    return MMIOERR_CANNOTWRITE;

	if (LOWORD(lActualSize) & 1) {
	    /* chunk size is odd -- write a null pad byte */
	    if (DTKmmioWrite(hmmio, (LPSTR) &bPad, sizeof(bPad)) != sizeof(bPad))
		return MMIOERR_CANNOTWRITE;
			
	}

	if (lpck->cksize != lActualSize) {
	    /* fix the chunk header */
	    lpck->cksize = lActualSize;
	    if (DTKmmioSeek(hmmio, lpck->dwDataOffset
			- sizeof(DWORD), SEEK_SET) == -1)
		return MMIOERR_CANNOTSEEK;
	    temp[0]=SWAP_32_LITTLE(lpck->cksize);
	    if (DTKmmioWrite(hmmio, (LPSTR) &temp,
			sizeof(DWORD)) != sizeof(DWORD))
		return MMIOERR_CANNOTWRITE;
	}
    }

    /* seek to the end of the chunk, past the null pad byte
     * (which is only there if chunk size is odd)
     */
    if (DTKmmioSeek(hmmio, lpck->dwDataOffset + lpck->cksize
	+ (lpck->cksize & 1L), SEEK_SET) == -1)
	return MMIOERR_CANNOTSEEK;

    return 0;
}

/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioDescend
**	This function descends into a chunk of a
**	RIFF file opened with DTKmmioOpen. It can also search for a given
**	chunk.
**
**  DEVIATIONS FROM SPEC
**	If this fails, the file position is supposed to be undefined.
**	That sucks.
**	File position will be where the caller left it.
**	Also, the caller supplied lpck will not be modified if
**	there is a failure
**
**  FORMAL PARAMETERS:
**	hmmio 	Specifies the file handle of an open RIFF file.
**
**	lpck 	Specifies a far pointer to a
**	caller-supplied  MMCKINFO structure that DTKmmioDescend fills
**	with the following information:
**
**	-- The MMCKINFO.ckid field is the chunk ID of the chunk.
**
**	-- The MMCKINFO.cksize field is the size of the data portion
**	of the chunk. The data size includes the form type or list type (if
**	any), but does not include the 8-byte chunk header or the pad byte at
**	the end of the data (if any).
**
**	-- The MMCKINFO.fccType field is the form type if 
**	MMCKINFO.ckid is "RIFF", or the list type if 
**	MMCKINFO.ckid is "LIST". Otherwise, it is NULL.
**
**	-- The MMCKINFO.dwDataOffset field is the file offset of the
**	beginning of the data portion of the chunk.	If the chunk is a
**	"RIFF" chunk or a "LIST" chunk, then MMCKINFO.dwDataOffset
**	is the offset of the form type or list type.
**
**	-- The MMCKINFO.dwFlags contains other information about the chunk.
**	Currently, this information is not used and is set to zero.
**
**	If the MMIO_FINDCHUNK, MMIO_FINDRIFF, or MMIO_FINDLIST flag is
**	specified for wFlags, then the MMCKINFO structure is also
**	used to pass parameters to DTKmmioDescend:
**
**	-- The MMCKINFO.ckid field specifies the four-character code
**	of the chunk ID, form type, or list type to search for.
**
**	lpckParent 	Specifies a far pointer to an
**	optional caller-supplied MMCKINFO structure identifying
**	the parent of the chunk being searched for.
**	A parent of a chunk is the enclosing chunk--only "RIFF" and "LIST"
**	chunks can be parents.  If lpckParent is not NULL, then 
**	DTKmmioDescend assumes the MMCKINFO structure it refers to
**	was filled when DTKmmioDescend was called to descend into the parent
**	chunk, and DTKmmioDescend will only search for a chunk within the
**	parent chunk. Set lpckParent to NULL if no parent chunk is
**	being specified.
**
**	wFlags 	Specifies search options. Contains up to one
**	of the following flags. If no flags are specified, 
**	DTKmmioDescend descends into the chunk beginning at the current file
**	position. 
**
**		MMIO_FINDCHUNK | Searches for a chunk with the specified chunk ID.
**
**		MMIO_FINDRIFF | Searches for a chunk with chunk ID "RIFF"
**		and with the specified form type.
**
**		MMIO_FINDLIST | Searches for a chunk with chunk ID "LIST"
**		and with the specified form type.
**
**  RETURN VALUE:
**	The return value is zero if the function is successful.
**	Otherwise, the return value specifies an error code. If the end of
**	the file (or the end of the parent chunk, if given) is reached before
**	the desired chunk is found, the return value is
**	MMIOERR_CHUNKNOTFOUND. 
**
**  DESIGN:
**	A RIFF chunk consists of a four-byte chunk ID (type FOURCC),
**	followed by a four-byte chunk size (type DWORD), followed
**	by the data portion of the chunk, followed by a null pad byte if
**	the size of the data portion is odd. If the chunk ID is "RIFF" or
**	"LIST", the first four bytes of the data portion of the chunk are
**	a form type or list type (type FOURCC).
**
**	If DTKmmioDescend is used to search for a chunk, the file 
**	position should be at the beginning of a
**	chunk before calling DTKmmioDescend. The search begins at the
**	current file position and continues to the end of the file. If a
**	parent chunk is specified, the file position should be somewhere
**	within the parent chunk before calling DTKmmioDescend. In this case,
**	the search begins at the current file position and continues to the
**	end of the parent chunk.
**
**	If DTKmmioDescend is unsuccessful in searching for a chunk, the
**	current file position is undefined. If DTKmmioDescend is
**	successful, the current file position is changed. If the chunk 
**	is a "RIFF" or "LIST" chunk, the new file position
**	will be just after the form type or list type (12 bytes from the
**	beginning of the chunk). For other chunks, the new file position will be
**	the start of the data portion of the chunk (8 bytes from the
**	beginning of the chunk).
**		
**	For efficient RIFF file I/O, use buffered I/O.
**
**/

MMRESULT APIENTRY 
DTKmmioDescend(
	HMMIO hmmio, 
	LPMMCKINFO lpck,
    	LPMMCKINFO lpckParent, 
	UINT uFlags
)
{
    FOURCC	ckidFind;	/* chunk ID to find (or NULL) */
    FOURCC	fccTypeFind;	/* form/list type to find (or NULL) */
    WORD	w;
    MMCKINFO	lpckRet;
    size_t	savepos;

    if ( lpck == (LPMMCKINFO)NULL ) return MMIOERR_CHUNKNOTFOUND;

    if ((savepos = DTKmmioSeek(hmmio, 0L, SEEK_CUR)) == -1)
	return MMIOERR_CANNOTSEEK;

    /* figure out what chunk id and form/list type to search for */
    if (uFlags & MMIO_FINDCHUNK)
	ckidFind = (FOURCC)lpck->ckid, (FOURCC)fccTypeFind = NULL;
    else if (uFlags & MMIO_FINDRIFF)
	ckidFind = (FOURCC)FOURCC_RIFF, fccTypeFind = lpck->fccType;
    else if (uFlags & MMIO_FINDLIST)
	ckidFind = (FOURCC)FOURCC_LIST, fccTypeFind = lpck->fccType;
    else
	ckidFind = (FOURCC)fccTypeFind = NULL;
	
    lpckRet.dwFlags = 0L;

    while (TRUE) {
	/* read the chunk header */
	if (DTKmmioRead(hmmio, (LPSTR) &lpckRet, 2 * sizeof(DWORD)) !=
	    2 * sizeof(DWORD)) {
	    (void)DTKmmioSeek(hmmio, savepos, SEEK_SET);
	    return MMIOERR_CHUNKNOTFOUND;
	}
	lpckRet.ckid=SWAP_32_LITTLE(lpckRet.ckid);
	lpckRet.cksize=SWAP_32_LITTLE(lpckRet.cksize);

	/* store the offset of the data part of the chunk */
	if ((lpckRet.dwDataOffset = DTKmmioSeek(hmmio, 0L, SEEK_CUR)) == -1) {
	    (void)DTKmmioSeek(hmmio, savepos, SEEK_SET);
	    return MMIOERR_CANNOTSEEK;
	}
	
	/* see if the chunk is within the parent chunk (if given) */
	if ((lpckParent != NULL) &&
	    (lpckRet.dwDataOffset - 8L >=
	     lpckParent->dwDataOffset + lpckParent->cksize)) {
	    (void)DTKmmioSeek(hmmio, savepos, SEEK_SET);
	    return MMIOERR_CHUNKNOTFOUND;
	}

	/* if the chunk if a 'RIFF' or 'LIST' chunk, read the
	 * form type or list type
	 */
	if ((lpckRet.ckid == FOURCC_RIFF) || (lpckRet.ckid == FOURCC_LIST))
	{
	    if (DTKmmioRead(hmmio, (LPSTR) &(lpckRet.fccType),
	    	     sizeof(DWORD)) != sizeof(DWORD)) {
	     	(void)DTKmmioSeek(hmmio, savepos, SEEK_SET);
	    	return MMIOERR_CHUNKNOTFOUND;
	    }
	    lpckRet.fccType=SWAP_32_LITTLE(lpckRet.fccType);
	}
	else
	    lpckRet.fccType = (int) NULL;

	/* if this is the chunk we're looking for, stop looking */
	if ( ((ckidFind == (int) NULL) || (ckidFind == lpckRet.ckid)) &&
	     ((fccTypeFind == (int) NULL) || (fccTypeFind == lpckRet.fccType)) )
	    break;
	
	/* ascend out of the chunk and try again */
	if ((w = DTKmmioAscend(hmmio, &lpckRet, 0)) != 0) {
	    (void)DTKmmioSeek(hmmio, savepos, SEEK_SET);
	    return w;
	}
    }

    bcopy(&lpckRet, lpck, sizeof(MMCKINFO));
    return 0;
}
/*
**++
**  FUNCTIONAL_DESCRIPTION: DTKmmioCreateChunk
**	This function creates a chunk in a
**	RIFF file opened with DTKmmioOpen. The new chunk is created at the
**	current file position. After the new chunk is created, the current
**	file position is the beginning of the data portion of the new chunk.
**
**  DEVIATIONS FROM SPEC
**	none
**
**  FORMAL PARAMETERS:
**	hmmio 	Specifies the file handle of an open RIFF
**	file.
**
**	lpck 	Specifies a pointer to a caller-supplied
**	MMCKINFO structure containing information about the chunk to be
**	created. The MMCKINFO structure should be set up as follows:
**
**	-- The MMCKINFO.ckid field specifies the chunk ID of the
**	chunk. If wFlags includes MMIO_CREATERIFF or MMIO_CREATELIST,
**	this field will be filled by DTKmmioCreateChunk.
**
**	-- The MMCKINFO.cksize> field specifies the size of the data
**	portion of the chunk, including the form type or list type (if any).
**	If this value is not correct when DTKmmioAscend is called to mark
**	the end of the chunk, them DTKmmioAscend will correct the chunk
**	size.
**
**	-- The MMCKINFO.fccType field specifies the form type or list
**	type if the chunk is a "RIFF" or "LIST" chunk. If the chunk is not a
**	"RIFF" or "LIST" chunk, this field need not be filled in.
**
**	-- The MMCKINFO.dwDataOffset field need not be filled in. The
**	DTKmmioCreateChunk function will fill this field with the file
**	offset of the data portion of the chunk.
**
**	-- The MMCKINFO.dwFlags field need not be filled in. The 
**	DTKmmioCreateChunk function will set the MMIO_DIRTY flag in 
**	MMCKINFO.dwFlags.
**
**	wFlags 	Specifies flags to optionally create either a
**	"RIFF" chunk or a "LIST" chunk. Can contain one of the following
**	flags: 
**
**		MMIO_CREATERIFF Creates a "RIFF" chunk.
**
**		MMIO_CREATELIST Creates a "LIST" chunk.
**
**
**  RETURN VALUE:
**	The return value is zero if the function is successful.
**	Otherwise, the return value specifies an error code. The error
**	code can be one of the following codes:
**
**	 MMIOERR_CANNOTWRITE Unable to write the chunk header.
**
**	 MMIOERR_CANNOTSEEK Uanble to determine offset of data
**    		portion of the chunk.
**
**
**  DESIGN:
**	This function cannot insert a chunk into the middle of a
**	file. If a chunk is created anywhere but the end of a file, 
**	DTKmmioCreateChunk will overwrite existing information in the file.
**
**/
MMRESULT APIENTRY
DTKmmioCreateChunk(
	HMMIO hmmio, 
	MMCKINFO * lpck, 
	UINT uFlags
)
{
    int	iBytes;			/* bytes to write */
    long	lOffset;	/* current offset in file */
    DWORD	temp[10];

    /* store the offset of the data part of the chunk */
    if ((lOffset = DTKmmioSeek(hmmio, 0L, SEEK_CUR)) == -1)
	return MMIOERR_CANNOTSEEK;
    lpck->dwDataOffset = lOffset + 2 * sizeof(DWORD);

    /* figure out if a form/list type needs to be written */
    if (uFlags & MMIO_CREATERIFF)
	lpck->ckid = FOURCC_RIFF, iBytes = 3 * sizeof(DWORD);
    else
    if (uFlags & MMIO_CREATELIST)
	lpck->ckid = FOURCC_LIST, iBytes = 3 * sizeof(DWORD);
    else
	iBytes = 2 * sizeof(DWORD);

    /* write the chunk header */
    temp[0]=SWAP_32_LITTLE(lpck->ckid);
    temp[1]=SWAP_32_LITTLE(lpck->cksize);
    if (iBytes==3)
    	temp[2]=SWAP_32_LITTLE(lpck->fccType);
    if (DTKmmioWrite(hmmio, (LPSTR) temp, (long) iBytes) != (long) iBytes)
	return MMIOERR_CANNOTWRITE;

    lpck->dwFlags = MMIO_DIRTY;

    return 0;
}

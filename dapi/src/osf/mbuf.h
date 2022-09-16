/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.2  1995/07/05  19:35:44  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:34  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  23:07:56  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:13:52  Krishna_Mangipudi]
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
/***************************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1994 All Rights Reserved.
**  Unpublished rights reserved under the copyright laws of the United States.
**  The software contained on this media is proprietary to and embodies the
**  confidential technology of Digital Equipment Corporation.  Possession, use,
**  duplication or dissemination of the software and media is authorized only
**  pursuant to a valid written license from Digital Equipment Corporation.
**
**  RESTRICTED RIGHTS LEGEND   Use, duplication, or disclosure by the U.S.
**  Government is subject to restrictions as set forth in Subparagraph
**  (c)(1)(ii) of DFARS 252.227-7013, or in FAR 52.227-19, as applicable.
**
****************************************************************************/

/*****************************************************************************
**  PROGRAM:
**     mbuf.h
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
** 'mbuf' is like a pipe, except
**
**     a) 'mbuf' buffer is a variable number of blocks, one of which
**        can be locked for reading (and against writing)
**     b) input is a stream of 'unsigned char', not 'WORD'
**     c) receiving end gets pointers into 'mbuf' blocks directly
**        thus avoiding another data copy
**     e) each read from the receiving end unlocks the current block
**        and locks another block for reading, returning it's pointer
**
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
**     Aug 10, 94   KM   Moved time interval structure into this; reduced
**                       time out interval by 1/2 so to fix audio break-up
**                       problem when saying short strings such as "paul"
*****************************************************************************/


#ifndef _MBUF_H
#define _MBUF_H 1

#include <pthread.h>

/*
 * in the closed state, read_mbuf will terminate the thread when out of data
 */
#define MSTAT_OPENED      1
#define MSTAT_CLOSED      2
#define MSTAT_PAUSED      3

/*
 * status return values from read_mbuf() and read_mbuf_nonblock()
 */
#define RSTAT_ERROR      -1
#define RSTAT_PAUSED      0    /* for read_mbuf() only */
#define RSTAT_ENDOFFRAME  1
#define RSTAT_FULLBLOCK   2
#define RSTAT_CLOSED      3
#define RSTAT_EWOULDBLOCK 4    /* for read_mbuf_nonblock() only */

/*
 * before a pointer to a block is returned in read_mbuf,
 * it must be locked first
 */
#define BLK_UNLOCKED      1
#define BLK_LOCKED        2

typedef struct _blkbuf {
    unsigned short  *blk_ptr;          /* pointer to block data             */
    int              blk_bytes;        /* number of bytes in block          */
    int              blk_status;       /* locked/unlocked status            */
    struct _blkbuf  *blk_next;         /* next in circular queue            */
} BLKBUF;

typedef struct _mbuf {
    int              id;               /* a unique identifier               */
    int              blksiz, nblocks;  /* 'mbuf' characteristics            */
    struct timespec  time_stamp;       /* time of last write_mbuf call      */
                                       /* value obtained by getclock(3)     */
    BLKBUF          *block_list,       /* circular list of blocks           */
                    *block_write,      /* current block being written       */
                    *block_read;       /* current block being read (locked) */
    int              mbuf_status;      /* status: open, closed, ...         */
    pthread_mutex_t  queue_lock;       /* mutual exclusion lock             */
    pthread_cond_t   free_cond,        /* block free'd condition            */
                     full_cond;        /* block filled condition            */
} MBUF;

typedef MBUF *P_MBUF;
#define NULL_MBUF (MBUF *)NULL

/* function prototypes */

P_MBUF create_mbuf  ( int id, int blksiz, int nblocks );
int    open_mbuf    ( P_MBUF handle );
int    close_mbuf   ( P_MBUF handle );
int    flush_mbuf   ( P_MBUF handle );
int    pause_mbuf   ( P_MBUF handle );
int    read_mbuf    ( P_MBUF handle, unsigned short **recv, int *nbytes );
int    write_mbuf   ( P_MBUF handle, unsigned short *send, int  nbytes );
int    destroy_mbuf ( P_MBUF handle );

#endif /* _MBUF_H */

static struct timespec timeout_interval =
{
        0L,               /* seconds */
        25000000L         /* nanoseconds ( 1/40 second ) */
};

static struct timespec abort_interval =
{
        0L,               /* seconds */
        10000000L         /* nanoseconds ( 1/100 second ) */
};

static struct timespec null_interval =
{
        0L,               /* seconds */
        0L                /* nanoseconds */
};

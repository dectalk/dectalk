/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	27	05/21/97	leeber	Build 109 V4.60.04 R003 04/22/99; Freeze Mark; No matching AD Mark. 04/27/99 cjl
	26	05/21/97	leeber	Build 109 V4.60.03 R003 03/31/99 Freeze Mark 04/02/99 cjl
	25	05/21/97	leeber	Build 108 V4.60.02 B002 01/29/99, Freeze Mark, 02/25/99 cjl
	24	05/21/97	leeber	Files verified as different on both WinDif and StarTeam for chnages between AD and RND. 02/01/99 cjl
	23	05/21/97	leeber	AD->RND Pre-V4.60.01 B002 Freeze Transfer, 01/19/99 cjl
	22	05/21/97	leeber	Build 108 V4.51.08 R007 11/03/98, Patch BATS#741 and UNIX build process bugs. 11/06/98 cjl
	21	05/21/97	leeber	AD-> RND File Update; Alpha kitting and DETX build not verified, End Of Beta Test, No showstops/highs; For release mark. Build 108 V4.51.07 R006 08/20/98. 08/31/98 cjl
	20	05/21/97	leeber	BUILD 108 V4.51.06 R005 06/26/98; BATS#249, 290, 313, 428, 492, 532, 546, 550, 566, 590, 599, 602, 603, 607, 608, 610, 613, 616, 623, 626, 631-633, 636-639, 630, 641-643, 645, 648, 651, 656-661, 663, 665, 666, 668, 672, 674-677, 681-683, 685, 688-693, 695
	19	05/21/97	leeber	This has the correct documentation that goes with Build 107 V4.50.04 R004, from AD. 04/15/98 cjl
	18	05/21/97	leeber	Code freeze Build 107 V4.50.04 R004 03/20/98 has been moved from AD->RND for testing. New keys, BATS (459, 590, 606, 607, 609, 610, 617, 619, 620, 622, 626, 627, 628 & 630) fixes, better process, SAPI features added. 03/27/98 cjl
	17	05/21/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	16	05/21/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	15	05/21/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	14	05/21/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	13	05/21/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	12	05/21/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	11	05/21/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	10	05/21/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	9	05/21/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	8	05/21/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	7	05/21/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	6	05/21/97	leeber	Build 104 V4.40.43 R007 08/18/97; Static Builds, Help files, BATS 124, 147, 152, 223, 257, 270, 283, 298, 314, 340, 348, 351, 364, 384, 388, 390, 395, 396, 405, 409-412, 416, 422, 438 & 441. 08/18/97 cjl FREEZE
	5	05/21/97	leeber	Preliminary Code Freeze; Missing docs, hlp and tuning files; otherwisw complete. cjl BUILD 104 V4.40.40 R007 x8/07/97
	4	05/21/97	leeber	Build 104 V4.40.38 B006 _6/25/97 Typning Mode w/assistve32 SDK, Re_Freeze after system crash. 6/25/97 cjl
	3	05/21/97	leeber	Build 104 V4.40.38 B006 06/25/97 Typning Mode w/assistve32 SDK. 6/25/97 cjl
	2	05/21/97	leeber	This is "BUILD 104 V4.40.37 B006H 06/20/97" and contans the special typing_mode build for Henter Joyce. 6/20/97 cjl
	1	05/21/97	simoneau	Initial Version
$
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
 * $EndLog$
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

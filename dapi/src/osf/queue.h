/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.2  1995/07/05  19:36:01  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:53  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  23:09:01  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:15:40  Krishna_Mangipudi]
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
**     queue.h
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**     Definitions used to create/read/write/destroy circular queues
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Hugn Enxing
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
*****************************************************************************/

#ifndef _QUEUE_H
#define _QUEUE_H

typedef struct _queue {
    unsigned char *qbuf;             /* allocated buffer location     */
    int            qalc,             /* number of bytes allocated     */
                   qsiz,             /* number of bytes in queue      */
                   qstr,             /* offset of first byte          */
                   qend;             /* offset of last  byte          */
} QUEUE;

typedef QUEUE *P_QUEUE;   /* a queue handle */
#define NULL_QUEUE (QUEUE *)NULL

/* function prototypes */

P_QUEUE  create_queue  ( int nbytes );
int      read_queue    ( P_QUEUE handle, unsigned char *recv_array, int nbytes );
int      write_queue   ( P_QUEUE handle, unsigned char *send_array, int nbytes );
int      queue_used    ( P_QUEUE handle );
int      empty_queue   ( P_QUEUE handle );
int      queue_free    ( P_QUEUE handle );
int      destroy_queue ( P_QUEUE handle );

#endif /* _QUEUE_H */

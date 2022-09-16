/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.2  1995/07/05  19:35:47  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:36  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  23:08:05  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:14:05  Krishna_Mangipudi]
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
**	pcr.h
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
** player control: pause/continue and abort
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
*****************************************************************************/

#ifndef _PCR_H
#define _PCR_H

#include <pthread.h>

/*
 * values for pcr_status
 */
#define PCR_RUN             1
#define PCR_PAUSE           2
#define PCR_ABORT           3

/*
 * values for pcr_state
 */
#define PLAYER_RUNNING      1
#define PLAYER_PAUSED       2
#define PLAYER_ABORTING     3

typedef struct _pcr {
    pthread_mutex_t pcr_lock;              /* exclusive access mutex                      */
    int pcr_status;                        /* player control status register              */
    pthread_cond_t pcr_broadcast_status;   /* condition variable for pcr_status change    */
    int pcr_state;                         /* player control state  register              */
    pthread_cond_t pcr_broadcast_state;    /* condition variable for pcr_state  change    */
} PCR;

#endif /* _PCR_H */


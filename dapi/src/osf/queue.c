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
 * Revision 1.1.2.2  1995/07/05  19:35:59  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:51  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  23:08:54  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:15:26  Krishna_Mangipudi]
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

/**********************************************************************/
/*                                                                    */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Digital Equipment Corporation. Possession, use,     */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Digital or an authorized          */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  This software is provided "as is" and without any express or      */
/*  implied warranties, including, without limitation, implied        */
/*  warranties of non-infringement, merchantibility or fitness        */
/*  for a particular purpose. Digital assumes no responsibility AT    */
/*  ALL for the use or reliability of this software.                  */
/*                                                                    */
/**********************************************************************/

/*****************************************************************************
**  PROGRAM:
**     queue.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**	Output queueing routines.
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Hugh Enxing
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
*****************************************************************************/

/*
 *	Procedure calls
 *
 * create_queue
 * queue_read
 * queue_write
 * queue_used
 * queue_free
 * destroy_queue
 */

#include <stdio.h>
#include "queue.h"
/*
 * fprintf(stderr,"Bad queue handle in %d:%s\n",__LINE__,__FILE__);
 */
#define RETURN_BAD_QUEUE_STATUS \
    { \
        return( 0 ); \
    }

/*
 * create a queue of requested number of items
 * and return an opaque handle
 */
P_QUEUE create_queue( int nbytes )
{
    unsigned char *qbuf;
    QUEUE *queue;

    /* try to allocate the queue ring buffer */
    if ( ( qbuf = (unsigned char *)malloc( nbytes ) ) == NULL )
	return( NULL_QUEUE );

    /* try to allocate the queue structure */
    if ( ( queue = (QUEUE *)malloc( sizeof(QUEUE) ) ) == NULL )
    {
	free( qbuf );
	return( NULL_QUEUE );
    }

    /* initialize the queue structure */
    queue->qbuf = qbuf;
    queue->qalc = nbytes;
    queue->qsiz = 0;
    queue->qstr = 0;
    queue->qend = 0;

    /* return queue handle */
    return( (P_QUEUE)queue );
}

/*
 * read bytes from queue
 * this will not block
 * up to nwords or as many as are in queue will be read
 */
int queue_read( QUEUE *queue, unsigned char *recv_array, int nbytes )
{
    int i;

    /* verify queue handle */
    if ( queue == NULL_QUEUE )
	RETURN_BAD_QUEUE_STATUS;

    /* set return parameter */
    if ( nbytes > queue->qsiz )
	nbytes = queue->qsiz;

    /* copy out */
    /* (this could be made faster if necessary) */
    for( i=0; i<nbytes; i++)
    {
	recv_array[i] = queue->qbuf[queue->qstr++];
	if (queue->qstr >= queue->qalc) queue->qstr = 0;
    }

    /* re-set queue size */
    queue->qsiz -= nbytes;

    /* return number of bytes read */
    return( nbytes );
}

/*
 * write data to queue
 * this will not block
 * up to nwords will be written or until queue is full
 */
int queue_write( QUEUE *queue, unsigned char *send_array, int nbytes )
{
    int i;

    /* verify queue handle */
    if ( queue == NULL_QUEUE )
	RETURN_BAD_QUEUE_STATUS;

    /* set return parameter */
    if ( nbytes > ( queue->qalc - queue->qsiz ) )
	nbytes = ( queue->qalc - queue->qsiz );

    /* copy in */
    /* (this could be made faster if necessary) */
    for( i=0; i<nbytes; i++)
    {
	queue->qbuf[queue->qend++] = send_array[i];
	if (queue->qend >= queue->qalc) queue->qend = 0;
    }

    /* re-set queue size */
    queue->qsiz += nbytes;

    /* return number of bytes written */
    return( nbytes );
}

/*
 * empty the queue contents
 */
int empty_queue( QUEUE *queue )
{
    /* verify queue handle */
    if ( queue == NULL_QUEUE )
	RETURN_BAD_QUEUE_STATUS;

    queue->qsiz = 0;
    queue->qstr = 0;
    queue->qend = 0;

    return( 1 );
}

/*
 * return number of bytes available to be read (used space) from queue
 */
int queue_used( QUEUE *queue )
{
    /* verify queue handle */
    if ( queue == NULL_QUEUE )
	RETURN_BAD_QUEUE_STATUS;

    return( queue->qsiz );
}

/*
 * return number of bytes available to be written (free space) in queue
 */
int queue_free( QUEUE *queue )
{
    /* verify queue handle */
    if ( queue == NULL_QUEUE )
	RETURN_BAD_QUEUE_STATUS;

    return( queue->qalc - queue->qsiz );
}

/*
 * destroy a queue
 */
int destroy_queue( QUEUE *queue )
{
    /* verify queue handle */
    if ( queue == NULL_QUEUE )
	RETURN_BAD_QUEUE_STATUS;

    /* free queue ring buffer */
    free( queue->qbuf );

    /* free queue structure */
    free( queue );

    /* return OK status */
    return( 1 );
}


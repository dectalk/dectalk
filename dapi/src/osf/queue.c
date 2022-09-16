/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
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


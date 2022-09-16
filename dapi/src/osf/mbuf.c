/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY

 * Revision 1.1.2.2  1995/07/05  19:35:42  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:31  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  23:07:49  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:13:39  Krishna_Mangipudi]
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
**     mbuf.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**	Device driver buffer management routines.
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi
**
**  CREATION DATE:
**	July 1993
**
**  MODIFICATION HISTORY:
**
**     Aug 10, 94   KM   Moved time interval structure into mbuf.h
**
*****************************************************************************/

/*
 *****************************************************************************
 *
 *	Procedure calls
 *
 * create_mbuf
 * open_mbuf
 * close_mbuf
 * read_mbuf
 * write_mbuf
 * destroy_mbuf
 *
 *****************************************************************************
 */

#define POSIX_4D9 /* required to use getclock(3) */
#include <sys/times.h>

#include <stdio.h>
#include <pthread.h>
#include <sys/errno.h>
#include "mbuf.h"

/*
 * fprintf(stderr,"Bad mbuf handle in %d:%s\n",__LINE__,__FILE__);
 */
#define RETURN_BAD_MBUF_STATUS(_ret) \
    { \
	return( (_ret) ); \
    }

#define MBUF_IS_OPEN(_mbuf)     ( (_mbuf)->mbuf_status   == MSTAT_OPENED   )
#define MBUF_IS_CLOSED(_mbuf)   ( (_mbuf)->mbuf_status  == MSTAT_CLOSED    )
#define MBUF_IS_PAUSED(_mbuf)   ( (_mbuf)->mbuf_status  == MSTAT_PAUSED    )
#define NEXT_BLOCK_FULL(_mbuf)  ( (_mbuf)->block_read->blk_next->blk_bytes == (_mbuf)->blksiz )
#define NEXT_BLOCK_EMPTY(_mbuf) ( (_mbuf)->block_read->blk_next->blk_bytes == 0)

#ifdef MBUFDBG
static FILE * fileptr1;
static FILE * fileptr2;
#endif

/*
 *****************************************************************************
 *
 * called when receiving an error from one of the thread routines
 *
 *****************************************************************************
 */
static void mbuf_error( char *msg )
{
    perror(msg);
}


/*
 *****************************************************************************
 *
 * create a mbuf
 *
 * make sure the 'blksiz' is at least 8-byte aligned (3 LSBs zero)
 * and 'nblocks' is at least three
 *
 *****************************************************************************
 */
P_MBUF create_mbuf( int id, int blksiz, int nblocks )
{
    pthread_mutex_t queue_lock;
    pthread_cond_t  free_cond, full_cond;
    MBUF           *mbuf;
    BLKBUF         *blk;
    unsigned short *buf;
    int             i;

#ifdef MBUFDBG
fileptr1 = fopen( "mbuf.wav", "wb" );
fileptr2  = fopen( "mbuf1.wav", "wb" );
#endif
    /* create the queue mutex */
    if ( pthread_mutex_init( &queue_lock, pthread_mutexattr_default ) != 0 )
	return( NULL_MBUF );

    /* create free condition variable */
    if ( pthread_cond_init( &free_cond, pthread_condattr_default ) != 0 )
	return( NULL_MBUF );

    /* create full condition variable */
    if ( pthread_cond_init( &full_cond, pthread_condattr_default ) != 0 )
        return( NULL_MBUF );

    /*
     * assure at least three blocks
     */
    if ( nblocks < 3 ) nblocks = 3;

    /*
     * create block queue
     */
    if ( ( blk = (BLKBUF *)malloc( sizeof( BLKBUF ) * nblocks ) ) == NULL )
	return( NULL_MBUF );

    /*
     * create block buffer
     */
    if ( ( buf = (unsigned short *)malloc( blksiz * sizeof(unsigned short) 
						  * nblocks ) ) == NULL )
    {
	free(blk);
	return( NULL_MBUF );
    }

    /* OK, now allocate the mbuf structure */
    if ( ( mbuf = (MBUF *)malloc( sizeof(MBUF) ) ) == NULL )
    {
	free(blk);
	free(buf);
	return( NULL_MBUF );
    }

    /*
     * divy up 'buf' into blocks
     */
    for (i=0; i<nblocks; i++)
    {
	blk[i].blk_ptr     = &buf[ i * blksiz ];
	blk[i].blk_bytes   = 0;
	blk[i].blk_status  = BLK_UNLOCKED;
        blk[i].blk_next    = &blk[i+1];
    }

    /*
     * special treatment for last buffer (prime the pump, as it were)
     * -- pretend it's locked (for read)
     * -- make 'blk_next' point back to start (circular)
     */
    blk[ nblocks - 1 ].blk_status  = BLK_LOCKED;
    blk[ nblocks - 1 ].blk_next    = &blk[0];

    /* initialize the mbuf structure */
    mbuf->id                 = id;
    mbuf->blksiz             = blksiz;
    mbuf->nblocks            = nblocks;
    mbuf->time_stamp.tv_sec  = 0L;
    mbuf->time_stamp.tv_nsec = 0L;
    mbuf->block_list         = blk;
    mbuf->block_write        = &blk[0];
    mbuf->block_read         = &blk[ nblocks - 1 ];
    mbuf->mbuf_status        = MSTAT_OPENED;
    mbuf->queue_lock         = queue_lock;
    mbuf->free_cond          = free_cond;
    mbuf->full_cond          = full_cond;

    return( (P_MBUF)mbuf );
}


/*
 *****************************************************************************
 *
 * open mbuf
 *
 *****************************************************************************
 */
int open_mbuf( MBUF *mbuf )
{
    int changed_state = 0;

    /* verify mbuf handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS(0);

    /* grab mutex */
    if ( pthread_mutex_lock( &mbuf->queue_lock ) != 0 )
    {
	mbuf_error( "open_mbuf: attempting to lock mutex:" );
	return( 0 );
    }

    /* we've got exclusive access to this queue */

    /* set open status */
    if ( mbuf->mbuf_status != MSTAT_OPENED )
    {
	mbuf->mbuf_status = MSTAT_OPENED;
	changed_state = 1;
	/* broadcast free condition to those threads which may be waiting
	   to write into this mbuf */
	if ( pthread_cond_broadcast( &mbuf->free_cond ) != 0 )
	    mbuf_error( "open_mbuf: broadcast free condition" );
    }

    /* release the mutex */
    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	mbuf_error( "open_mbuf: attempting to unlock mutex:" );

    /* return status */
    return( changed_state );
}


/*
 *****************************************************************************
 *
 * close mbuf
 *
 *****************************************************************************
 */
int close_mbuf( MBUF *mbuf )
{
    int changed_state = 0;

#ifdef MBUFDBG
fclose( fileptr1 );
fclose( fileptr2 );
#endif

    /* verify pipe handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS(0);

    /* grab mutex */
    if ( pthread_mutex_lock( &mbuf->queue_lock ) != 0 )
    {
	mbuf_error( "close_mbuf: attempting to lock mutex:" );
	return( 0 );
    }

    /* we've got exclusive access to this queue */

    /* set closed status */
    if ( mbuf->mbuf_status != MSTAT_CLOSED )
    {
	mbuf->mbuf_status = MSTAT_CLOSED;
	changed_state = 1;
	/* broadcast full condition to that thread which may be waiting
	   to read from this mbuf */
	if ( pthread_cond_broadcast( &mbuf->full_cond ) != 0 )
	    mbuf_error( "close_mbuf: broadcast full condition" );
    }

    /* release the mutex */
    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	mbuf_error( "close_mbuf: attempting to unlock mutex:" );
    /* return status */
    return( changed_state );
}


/*
 *****************************************************************************
 *
 * pause_mbuf
 *
 *****************************************************************************
 */
int pause_mbuf( MBUF *mbuf )
{
    int changed_state = 0;

    /* verify pipe handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS(0);

    /* grab mutex */
    if ( pthread_mutex_lock( &mbuf->queue_lock ) != 0 )
    {
	mbuf_error( "close_mbuf: attempting to lock mutex:" );
	return( 0 );
    }

    /* we've got exclusive access to this queue */

    /* set paused status */
    if ( mbuf->mbuf_status != MSTAT_PAUSED )
    {
	mbuf->mbuf_status = MSTAT_PAUSED;
	changed_state = 1;
	/* broadcast full condition to that thread which may be waiting
	   to read from this mbuf */
	if ( pthread_cond_broadcast( &mbuf->full_cond ) != 0 )
	    mbuf_error( "close_mbuf: broadcast full condition" );
    }

    /* release the mutex */
    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	mbuf_error( "close_mbuf: attempting to unlock mutex:" );

    /* return status */
    return( changed_state );
}


/*
 *****************************************************************************
 *
 * empty_mbuf
 *
 * completely empty all contents of the MBUF
 *
 *****************************************************************************
 */
empty_mbuf( MBUF *mbuf )
{
    BLKBUF *blk;
    int i;

    /* verify pipe handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS(0);

    /* grab mutex */
    if ( pthread_mutex_lock( &mbuf->queue_lock ) != 0 )
    {
	mbuf_error( "empty_mbuf: attempting to lock mutex:" );
	return( 0 );
    }

    /* we've got exclusive access to this queue */

    /*
     * empty each block
     */
    blk = mbuf->block_list;
    for (i=0; i<mbuf->nblocks; i++)
    {
	blk[i].blk_bytes   = 0;
	blk[i].blk_status  = BLK_UNLOCKED;
    }

    /*
     * special treatment for last buffer (prime the pump, as it were)
     * -- pretend it's locked (for read)
     */
    blk[ mbuf->nblocks - 1 ].blk_status  = BLK_LOCKED;

    /* reset portions of the mbuf structure */
    mbuf->time_stamp.tv_sec  = 0L;
    mbuf->time_stamp.tv_nsec = 0L;
    mbuf->block_write        = &blk[0];
    mbuf->block_read         = &blk[ mbuf->nblocks - 1 ];

    /* broadcast free condition to those threads which may be waiting
       to write into this mbuf */
    if ( pthread_cond_broadcast( &mbuf->free_cond ) != 0 )
	    mbuf_error( "empty_mbuf: broadcast free condition" );

    /* release the mutex */
    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	mbuf_error( "empty_mbuf: attempting to unlock mutex:" );

    return( 1 );
}


/*
 *****************************************************************************
 *
 * read data from mbuf
 *
 * THIS WILL BLOCK UNTIL ALL REQUESTED DATA IS READ OR A TIME-OUT
 * CONDITION IS REALIZED OR MBUF IS CLOSED WITH NO MORE DATA
 *
 * IF MBUF BECOMES CLOSED, PARTIAL DATA MAY BE RETURNED (A FLUSH)
 *
 * Return values:
 *   (see mbuf.h for RSTAT_* return values)
 *
 *****************************************************************************
 */
int read_mbuf( MBUF *mbuf, unsigned short **recv, int *nbytes )
{
    int return_status, end_of_frame = 0, timed_out = 0;

    /*
     * set error return parameters (assume the worst)
     */
    *recv = NULL;
    *nbytes = 0;

    /* verify mbuf handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS( RSTAT_ERROR );

    /* grab mutex */
    if ( pthread_mutex_lock( &mbuf->queue_lock ) != 0 )
    {
	mbuf_error( "read_mbuf: attempting to lock mutex:" );
	return( RSTAT_ERROR );
    }

    /* we've got exclusive access to this queue */

    /*
     * block on read until
     *     a) next block is full or
     *     b) wait timed out
     *     c) mbuf becomes closed
     */
    while( MBUF_IS_OPEN(mbuf) && ! NEXT_BLOCK_FULL(mbuf) )
    {
	/*
	 * has data been written to mbuf?
	 */
	if ( mbuf->time_stamp.tv_sec > 0L )
	{
	    /*
	     * now set up a timed wait
	     */
	    /* fprintf(stderr,"read_mbuf: about to do a timed wait.\n");  */
	    if ( pthread_cond_timedwait( &mbuf->full_cond, 
                 &mbuf->queue_lock, &mbuf->time_stamp ) != 0 )
	    {
		/*
		 * check for a time-out condition
		 */
		if ( errno == EAGAIN )
		{
		    /* fprintf(stderr,"MBUF: timed out.\n");  */
		    timed_out = 1;
		    mbuf->time_stamp.tv_sec = 0L;
		    mbuf->time_stamp.tv_nsec = 0L;
		    break;
		}
		mbuf_error( "read_mbuf: waiting on full condition" );
		return( RSTAT_ERROR );
	    }
	}
	else
	{
	    /*
	     * wait for (see above)
	     */
	    if ( pthread_cond_wait( &mbuf->full_cond, &mbuf->queue_lock ) != 0 )
	    {
		mbuf_error( "read_mbuf: waiting on full condition:" );
		return( 0 );
	    }
	}
    }

    /*
     * in PAUSED state, return immediately
     */
    if ( MBUF_IS_PAUSED(mbuf) )
    {
	/* release the mutex */
	if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	{
	    mbuf_error( "read_mbuf: attempting to unlock mutex:" );
	    return( RSTAT_ERROR );
	}
	return( RSTAT_PAUSED );
    }
    /*
     * in CLOSED state, return immediately if no more data
     */
    else if ( MBUF_IS_CLOSED(mbuf) )
    {
	/*
	 * is there any more data?
	 */
	if ( NEXT_BLOCK_EMPTY(mbuf) )
	{
	    /* release the mutex */
	    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
		mbuf_error( "read_mbuf: attempting to unlock mutex:" );
	    return( RSTAT_CLOSED );
	}

	/*
	 * is this the last block? (WARNING, THIS ASSUMES A 3 BLOCK MINIMUM)
	 */
	if ( mbuf->block_read->blk_next->blk_next->blk_bytes == 0 )
	    end_of_frame = 1;
    }
    /*
     * OK, mbuf_state must be MSTAT_OPENED
     */
    else if ( timed_out )
    {
	/*
	 * this is the end of the frame
	 */
	end_of_frame = 1;
    }
    else if ( ! NEXT_BLOCK_FULL(mbuf) )
    {
  /*
	fprintf(stderr,"Assertion botched at %s:%d\n",__FILE__,__LINE__);
  */
  }

    /*
     * release (unlock) current read block
     */
    mbuf->block_read->blk_bytes = 0;
    mbuf->block_read->blk_status = BLK_UNLOCKED;

    /*
     * point to next block in chain and lock it
     */
    mbuf->block_read = mbuf->block_read->blk_next;
    mbuf->block_read->blk_status = BLK_LOCKED;

    /*
     * if this is the current write block, move the write block
     * to next block
     */
    if ( mbuf->block_write == mbuf->block_read )
    {
	mbuf->block_write = mbuf->block_write->blk_next;
    }

    /*
     * set return parameters
     */
    *recv = mbuf->block_read->blk_ptr;
    *nbytes = mbuf->block_read->blk_bytes;
    /* broadcast free condition to those threads which may be waiting
       to write into this mbuf */
    if ( pthread_cond_broadcast( &mbuf->free_cond ) != 0 )
	    mbuf_error( "read_mbuf: broadcast free condition" );

    /* release the mutex */
    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	mbuf_error( "read_mbuf: attempting to unlock mutex:" );

    /* return number of bytes in block */
/*    fprintf(stderr,"read_mbuf: returning status=%d, nbytes=%d\n",
           (end_of_frame ? 0 : *nbytes),*nbytes); 
*/
    return( end_of_frame ? RSTAT_ENDOFFRAME : RSTAT_FULLBLOCK );
}


/*
 *****************************************************************************
 *
 * read data from mbuf
 *
 * THIS WILL NOT BLOCK.
 *
 * Return values:
 *   -1      fatal error
 *    0      no data available
 *   +n      number of bytes returned
 *
 *****************************************************************************
 */
int read_mbuf_nonblock( MBUF *mbuf, unsigned short **recv, int *nbytes )
{
    int time_out_condition = 0;
    char proc_name[] = "read_mbuf_nonblock";
/*
printf("%s\n", proc_name);
*/
  
    /*
     * set error return parameters (assume the worst)
     */
    *recv = NULL;
    *nbytes = 0;

    /* verify mbuf handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS( RSTAT_ERROR );

    /* grab mutex */
    if ( pthread_mutex_lock( &mbuf->queue_lock ) != 0 )
    {
	mbuf_error( "read_mbuf: attempting to lock mutex:" );
	return( RSTAT_ERROR );
    }

    /* we've got exclusive access to this queue */

    /*
     * in PAUSED state, return immediately
     */
    if ( MBUF_IS_PAUSED(mbuf) )
    {
	/* release the mutex */
	if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	{
	    mbuf_error( "read_mbuf: attempting to unlock mutex:" );
	    return( RSTAT_ERROR );
	}
	return( RSTAT_PAUSED );
    }

    /*
     * no more data, return immediately
     */
    if ( NEXT_BLOCK_EMPTY(mbuf) )
    {
	/* release the mutex */
	if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	{
	    mbuf_error( "read_mbuf: attempting to unlock mutex:" );
	    return( RSTAT_ERROR );
	}
	return( MBUF_IS_CLOSED(mbuf) ? RSTAT_CLOSED : RSTAT_EWOULDBLOCK );
    }

    /*
     * if mbuf is opened, next block not yet full, no time-out occured,
     * return with no data
     */
    if ( MBUF_IS_OPEN(mbuf) && ! NEXT_BLOCK_FULL(mbuf) )
    {
	struct timespec now;

	/*
	 * get current time
	 */
	pthread_get_expiration_np( &null_interval, &now );

	/*
	 * check for expiration
	 */
	if ( now.tv_sec < mbuf->time_stamp.tv_sec ||
	    ( now.tv_sec == mbuf->time_stamp.tv_sec &&
	      now.tv_nsec < mbuf->time_stamp.tv_nsec )
	   )
	{
	    /* has not yet expired */
	    /* release the mutex */
	    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	    {
		mbuf_error( "read_mbuf: attempting to unlock mutex:" );
		return( RSTAT_ERROR );
	    }
	    return( RSTAT_EWOULDBLOCK );
	}
	time_out_condition = 1;
    }

    /*
     * release (unlock) current read block
     */
    mbuf->block_read->blk_bytes = 0;
    mbuf->block_read->blk_status = BLK_UNLOCKED;

    /*
     * point to next block in chain and lock it
     */
    mbuf->block_read = mbuf->block_read->blk_next;
    mbuf->block_read->blk_status = BLK_LOCKED;

    /*
     * if this is the current write block, move the write block
     * to next block
     */
    if ( mbuf->block_write == mbuf->block_read )
    {
	mbuf->block_write = mbuf->block_write->blk_next;
    }

    /*
     * set return parameters
     */
    *recv = mbuf->block_read->blk_ptr;
    *nbytes = mbuf->block_read->blk_bytes;

#ifdef MBUFDBG
fwrite( *recv,
          sizeof( short ),
           (size_t)*nbytes, fileptr2 );
#endif


    /* broadcast free condition to those threads which may be waiting
       to write into this mbuf */
    if ( pthread_cond_broadcast( &mbuf->free_cond ) != 0 )
	    mbuf_error( "read_mbuf: broadcast free condition" );

    /* release the mutex */
    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	mbuf_error( "read_mbuf: attempting to unlock mutex:" );

    /* return number of bytes in block */
    return( time_out_condition ? RSTAT_ENDOFFRAME : RSTAT_FULLBLOCK );
}


/*
 *****************************************************************************
 *
 * write data to mbuf
 * THIS WILL BLOCK UNTIL ALL REQUESTED DATA IS WRITTEN
 *
 *****************************************************************************
 */
int write_mbuf( MBUF *mbuf, unsigned short *send, int nbytes )
{
    int bytes_written = 0, blocks_filled = 0, free_bytes;
    BLKBUF *blk;
    unsigned short i;

    /* verify mbuf handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS(0);

    /* grab mutex */
    if ( pthread_mutex_lock( &mbuf->queue_lock ) != 0 )
    {
	mbuf_error( "write_mbuf: attempting to lock mutex:" );
	return( 0 );
    }

    /* we've got exclusive access to this queue */

    /*
     * block on "free" condition until all bytes are written
     */
/*
    nbytes = nbytes * 2;
*/
    while( bytes_written < nbytes )
    {
	/*
	 * is this block locked
	 */
	while ( mbuf->block_write->blk_status == BLK_LOCKED )
	{
	    /*
	     * wait on "free" condition
	     */
	    if ( pthread_cond_wait( &mbuf->free_cond, &mbuf->queue_lock ) != 0 )
	    {
		mbuf_error( "write_mbuf: waiting on free condition:" );
		return( 0 );
	    }
	}

	blk = mbuf->block_write;
	/*
	 * is there any free space in current block
	 */
	if ( ( free_bytes = mbuf->blksiz - blk->blk_bytes ) > 0 )
	{
	    int bytes_to_write = ( nbytes - bytes_written );
	    int wrbytes = ( bytes_to_write > free_bytes ) ? 
                                  free_bytes : bytes_to_write ;

	    /*
	     * write data now
	     */
/*
	    memcpy( &blk->blk_ptr[ blk->blk_bytes ], &send[bytes_written], 
                                             wrbytes );
*/
            for ( i = 0; i < wrbytes; i++)
               blk->blk_ptr[blk->blk_bytes+i] = send[bytes_written+i];
	    bytes_written += wrbytes;

	    /*
	     * have we filled up the current block?
	     */
	    blk->blk_bytes += wrbytes;
	
            if ( blk->blk_bytes == mbuf->blksiz )
	    {
		/*
		 * this one's full
		 */

#ifdef MBUFDBG
fwrite( blk->blk_ptr,
          sizeof( short ),
           (size_t)blk->blk_bytes, fileptr1 );
#endif

		blk = blk->blk_next;
		mbuf->block_write = blk;
		/*
		 * notify the thread waiting on this data
		 */
/*		fprintf(stderr,"write_mbuf: signal on full block.\n"); */
		if ( pthread_cond_signal( &mbuf->full_cond ) != 0 )
		    mbuf_error( "write_mbuf: signal full condition" );
	    }
	    else
	    {
		/*
		 * if time_stamp is currently unset, notify the reading
		 * thread to start a timeout interval
		 * (this is for the blocking 'read_mbuf' function)
		 */
		if ( mbuf->time_stamp.tv_sec == 0L )
		{
/*		    fprintf(stderr,"write_mbuf: signal on first write.\n"); */
		    if ( pthread_cond_signal( &mbuf->full_cond ) != 0 )
			mbuf_error( "write_mbuf: signal full condition" );
		}
	    }

	    /*
	     * set time stamp for time-out condition
	     */
	    pthread_get_expiration_np( &timeout_interval, &mbuf->time_stamp );
	}
	/*
	 * no free space, move to next block
	 * (this shouldn't happen, but this shouldn't be a problem)
	 */
	else
	{
	    blk = blk->blk_next;
	    mbuf->block_write = blk;
	}
    }

    /* release the mutex */
    if ( pthread_mutex_unlock( &mbuf->queue_lock ) != 0 )
	mbuf_error( "write_mbuf: attempting to unlock mutex:" );

    /* return number of words written */
    return( bytes_written );
}


/*
 *****************************************************************************
 *
 * destroy a mbuf
 * this should be done ONLY after all threads have stopped running
 *
 *****************************************************************************
 */
int destroy_mbuf( MBUF *mbuf )
{
    /* verify mbuf handle */
    if ( mbuf == NULL_MBUF )
	RETURN_BAD_MBUF_STATUS(0);

    /* destory mutexes and condition variables */
    pthread_cond_destroy( &mbuf->full_cond );
    pthread_cond_destroy( &mbuf->free_cond );
    pthread_mutex_destroy( &mbuf->queue_lock );

    /* set id to bad value */
    mbuf->id = 0;

    /* free block buffer */
    free( mbuf->block_list->blk_ptr );

    /* free block list */
    free( mbuf->block_list );

    /* free mbuf structure */
    free( mbuf );

    /* return OK status */
    return( 1 );
}

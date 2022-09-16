 /*
 ***********************************************************************
 *
 *                           Copyright (c)
 *    Copyright © 2000-2001 Force computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:        spc.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    spcget() and spcwrite()
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------  
 * 001	GL		04/21/1997	    BATS#357  Add the code for __osf__ build 
 * 002	tek		12nov97			bats404: support for packet subtypes (01aug97)
 * 003  ETT		10/05/1998      Added Linux code.
 * 004	MGS		02/28/2001		Merged in base changes needed for ACCESS32 merge
 * 005	CAB		03/01/2001		Updated copyright info
 *                              
 */

#ifdef WIN32
#include <windows.h>
#include <malloc.h>
#include <stdio.h>
#include "port.h"
#include "kernel.h"
#include "ph_def.h"         /* MVP : Now phinst.h includes phdefs.h, php.h */
#endif

#if defined (__osf__) || defined (__linux__)
#include <stdlib.h>
#include "opthread.h"
#include "port.h"
#include "kernel.h"
#include "ph_def.h"         /* MVP : Now phinst.h includes phdefs.h, php.h */
#endif

static int spc_size( unsigned short spc_type )
{
	//tek 01aug97 bats 404 support for packet subtypes
//#ifdef _WIN32
	spc_type &= SPC_TYPE_MASK;
//#endif //_WIN32
    switch( spc_type )
    {
	case SPC_type_voice:
	    return( VOICE_PARS + 1 );
	case SPC_type_speaker:
	    return( SPDEF_PARS + 1 );
	case SPC_type_sync:
	    return( SYNC_PARS + 1 );
	case SPC_type_index:
	    return( INDEX_PARS + 1 );
	default:
	    return( 0 );
    }
}

/*
 * spcget
 *
 * allocate a SPC buffer of a given type
 * return generic data handle which must be cast
 */


void * spcget( unsigned short spc_type )
{
    unsigned short * spc_buffer = (unsigned short *)NULL;
    int nwords = spc_size( spc_type );

    if ( nwords > 0 )
    {
	spc_buffer = (unsigned short *)malloc( nwords * sizeof( unsigned short ) );
	if ( spc_buffer != (unsigned short *)NULL )
	    spc_buffer[0] = spc_type;
    }

    return( (void *)(spc_buffer+1) );
}

/*
 * spcwrite
 *
 * write a SPC buffer to the SPC pipe
 * free up the buffer
 */
int spcwrite( PKSD_T pKsd_t, unsigned short * spc_buffer )
{
    int nwords;

  /* index back to spc_type word */
    spc_buffer--;

    /* check for valid pointer */
    if ( spc_buffer == (unsigned short *)NULL ) return( 0 );

    /* find size of SPC packet */
    nwords = spc_size( spc_buffer[0] );

    if ( nwords > 0 )
	write_pipe( pKsd_t->vtm_pipe, spc_buffer, (UINT)nwords );

    /* free buffer */
    free( spc_buffer );

    return(nwords);
}

/* free a packet without sending it. */
void spcfree(unsigned short * spc_buffer)
{
	free(--spc_buffer);
}

 /*
 ***********************************************************************
 *
 *                           Copyright (c)
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000-2001 Force computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
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
 * 006	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 007	MFG		05/29/2001		Included dectalkf.h
 * 008	MGS		06/19/2001		Solaris Port BATS#972
 * 009	MGS		03/20/2002		Single threaded vtm
 * 010	MGS		04/11/2002		ARM7 port
 * 011	CAB		05/21/2002		Updated copyright info
 */

#include "dectalkf.h"
#include "port.h"
#ifdef WIN32
#include <windows.h>
#include <malloc.h>
#include <stdio.h>
#include "kernel.h"
#include "ph_def.h"         /* MVP : Now phinst.h includes phdefs.h, php.h */
#endif

#if defined _UNIX_LIKE_ || defined ARM7
#ifndef OS_PALM
#include <stdlib.h>
#endif //OS_PALM
#include "opthread.h"
#include "kernel.h"
#include "ph_def.h"         /* MVP : Now phinst.h includes phdefs.h, php.h */
#endif

#ifdef ARM7
#ifndef OS_PALM
#include <stdlib.h>
#include <string.h>
#endif //OS_PALM
#include "kernel.h"
#include "ph_def.h"         /* MVP : Now phinst.h includes phdefs.h, php.h */
#endif

#ifndef ALLOC_MEMORY
short global_spc_v_buf[VOICE_PARS+2];
short global_spc_s_buf[SPDEF_PARS+2];
#endif

/* ******************************************************************
 *      Function Name: spc_size()
 *
 *      Description:
 *
 *      Arguments: unsigned short spc_type
 *
 *      Return Value: static int
 *
 *      Comments:
 *
 * *****************************************************************/
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

/* ******************************************************************
 *      Function Name: spcget()
 *
 *      Description: allocate a SPC buffer of a given type
 *					 return generic data handle which must be cast
 *
 *      Arguments: unsigned short spc_type
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void * spcget( unsigned short spc_type )
{
    unsigned short * spc_buffer = (unsigned short *)NULL;
    int nwords = spc_size( spc_type );

    if ( nwords > 0 )
    {
#ifndef ALLOC_MEMORY
		if (spc_type==1)
		{
			spc_buffer = global_spc_s_buf;
		}
		else
		{
			spc_buffer = global_spc_v_buf;
		}
#else
	spc_buffer = (unsigned short *)malloc( nwords * sizeof( unsigned short ) );
#endif
	if ( spc_buffer != (unsigned short *)NULL )
	    spc_buffer[0] = spc_type;
    }
#ifndef ALLOC_MEMORY
	else
	{
	    return( (void *)(spc_buffer+1) );
	}
#endif

#ifndef ALLOC_MEMORY
    return( (void *)&(spc_buffer[1]) );
#else
    return( (void *)(spc_buffer+1) );
#endif
}

/* ******************************************************************
 *      Function Name: spcwrite()
 *
 *      Description: write a SPC buffer to the SPC pipe
 *					 free up the buffer
 *
 *      Arguments:	PKSD_T pKsd_t
 *					unsigned short *spc_buffer
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int spcwrite( PKSD_T pKsd_t, unsigned short *spc_buffer )
{
    int nwords;

  /* index back to spc_type word */
    spc_buffer--;

    /* check for valid pointer */
    if ( spc_buffer == (unsigned short *)NULL ) return( 0 );
    
    /* find size of SPC packet */
#ifdef ARM7
    nwords = spc_size( spc_buffer[0] );
#else
    nwords = spc_size( spc_buffer[0] );
#endif


    if ( nwords > 0 )
#ifndef SINGLE_THREADED
		write_pipe( pKsd_t->vtm_pipe, spc_buffer, (UINT)nwords );
#else
#ifdef ARM7
		vtm_loop(pKsd_t->phTTS,spc_buffer);
#else
		vtm_loop(pKsd_t->phTTS,spc_buffer);
#endif
#endif // SINGLE_THREADED

#if defined ALLOC_MEMORY
    /* free buffer */
    free( spc_buffer );
#endif

    return(nwords);
}

/* ******************************************************************
 *      Function Name: spcwrite()
 *
 *      Description: free a packet without sending it.
 *
 *      Arguments: unsigned short spc_buffer
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void spcfree(unsigned short *spc_buffer)
{
#ifndef ARM7
	free(--spc_buffer);
#endif
}
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
 * 006	MGS		05/09/2001		Some VxWorks porting BATS#972
 * 007	MFG		05/29/2001		Included dectalkf.h
 * 008	MGS		06/19/2001		Solaris Port BATS#972
 *                              
 */

//#include "dectalkf.h"
#ifdef WIN32
#include <windows.h>
#include <malloc.h>
#include <stdio.h>
//#include "port.h"
//#include "kernel.h"
#endif
#include <stdio.h>
#include "phdefs.h"         /* MVP : Now phinst.h includes phdefs.h, php.h */

#define SPC_TYPE_MASK			(0x00ff) 


//#if defined (__osf__) || defined (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_
//#include <stdlib.h>
//#include "opthread.h"
//#include "port.h"
//#include "kernel.h"
//#include "ph_def.h"         /* MVP : Now phinst.h includes phdefs.h, php.h */
//#endif
extern void vtmmain(void);

/*
 * spcget
 *
 * allocate a SPC buffer of a given type
 * return generic data handle which must be cast
 */
int	spc_dma_lengths[] = { 18, 22, 11, 0, 1, 0, 0, 0, 0 };

extern short *global_spc_buf;

extern short global_spc_v_buf[VOICE_PARS+2];
extern short global_spc_s_buf[SPDEF_PARS+2];

void * spcget( unsigned short spc_type )
{
    unsigned short * spc_buffer = (unsigned short *)NULL;
    int nwords = spc_dma_lengths[spc_type];

    if ( nwords > 0 )
    {
		if (spc_type==1)
		{
			spc_buffer = global_spc_s_buf;
		}
		else
		{
			spc_buffer = global_spc_v_buf;
		}

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
int spcwrite( unsigned short * spc_buffer )
{
    int nwords;
	int i;

  /* index back to spc_type word */
    spc_buffer-=1;

	global_spc_buf=spc_buffer;

    /* check for valid pointer */
    if ( spc_buffer == (unsigned short *)NULL ) return( 0 );

    /* find size of SPC packet */
    nwords = spc_dma_lengths[ spc_buffer[0] ];

#ifndef SIMULATOR
    if ( nwords > 0 )
	write_pipe( pKsd_t->vtm_pipe, spc_buffer, (UINT)nwords );
#endif
	vtmmain();


    /* free buffer */
    //free( spc_buffer );

    return(nwords);
}

/* free a packet without sending it. */
void spcfree(unsigned short * spc_buffer)
{
	//free(--spc_buffer);
}

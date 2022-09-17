/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *   Copyright (c) 2001 Force Computers Inc. A Solectron company. All rights reserved.
 *    Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:        opmmsys.h
 *    Author:			Bill Hallahan
 *    Creation Date:	12/26/95
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date		Description
 * ---  ------	-----------	--------------------------------------------
 *	
 * 001	?		04/22/1996	?
 * 002	TQL		05/21/1997	BATS#357  Add the code for __osf__ build
 * 003  ETT		10/05/1998  Added Linux code.
 * 004	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 005	CAB		05/14/2001	Added force copyright
 * 006	MGS		06/19/2001		Solaris Port BATS#972
 *
 */

#ifndef _OPMMSYS_H_
#define _OPMMSYS_H_

#ifdef __cplusplus
extern "C" {
#endif

/**********************************************************************/
/*  Multimedia include files and type definitions for Digital UNIX.   */
/**********************************************************************/

/* TQL 05/21/1997  change this for OSF build */
#if defined _UNIX_LIKE_
#include "opthread.h"
#endif

#ifdef __osf__

#include <mme/mmsystem.h>
#include <mme/mme_api.h>

#define  MME_THREAD_SAFE
#define  USE_MME_SERVER
#define  OS_SIXTY_FOUR_BIT

#endif

/**********************************************************************/
/*  Multimedia include files and type definitions for OpenVMS.        */
/**********************************************************************/

#ifdef __VMS

#include <mmsystem.h>
#include <mme_api.h>

#define  MME_THREAD_SAFE
#define  USE_MME_SERVER

#endif

/**********************************************************************/
/*  Allow WIN32 (the old way) in addition to _WIN32.                  */
/**********************************************************************/

#ifdef WIN32
#ifndef _WIN32
#define _WIN32
#endif
#endif

/**********************************************************************/
/*  Multimedia include files and type definitions for Windows 95 and  */
/*  Windows NT.                                                       */
/**********************************************************************/

#ifdef _WIN32

#include <windows.h>
#include <mmreg.h>

#define  WAVE_FORMAT_08M08  WAVE_FORMAT_MULAW

#endif

/**********************************************************************/
/*  Define the audio buffer type. This is currently the same for all  */
/*  Operating Systems and Platforms we support.                       */
/**********************************************************************/
#ifndef OS_SYMBIAN

typedef unsigned char AUDIO_T;
typedef AUDIO_T * LPAUDIO_T;

#ifdef __cplusplus
}  /* End extern "C" */
#endif

#endif
#endif

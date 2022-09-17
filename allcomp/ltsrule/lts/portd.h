/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	port.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *	  DECtalk porting specific header file
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001  GL      08/01/96        fake out "huge" for non-msdos environment
 * 002  ETT		10/05/1998      Added Linux code.
 */

#ifndef _PORT_H
#define _PORT_H

/*
 * MSDOS has the effect of including code that is designed to
 * operate on DSP versus code that will run on a general
 * purpose cpu for the VTM.
 */

#define MSDOS 1

/*
 ************************************************************************
 * defines for MSDOS
 */
#ifdef MSDOS

#ifdef SEPARATE_PROCESSES
#undef SEPARATE_PROCESSES
#endif

typedef unsigned short DT_PIPE_T;
typedef long S32;
typedef unsigned long U32;
typedef int S16;
typedef unsigned int U16;

#endif

/*
 ************************************************************************
 * defines for DEC OSF/1 AXP
 */
#ifdef __osf__

#include <unistd.h>
#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */
#define __far
#define _far
#define far
#define huge
#define volatile

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;

#endif

/*
 ************************************************************************
 * defines for Linux
 */
#ifdef __linux__

#include <unistd.h>
#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */
#define __far
#define _far
#define far
#define huge
#define volatile

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;

#endif /* linux */

/*
 ************************************************************************
 * defines for DEC MIPS
 */
#ifdef UNIX_AND_MIPS

#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */
#define __far
#define _far
#define far
#define huge
#define volatile

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;

#endif

/*
 ************************************************************************
 *  WINDOWS/NT
 */

#ifdef WIN32

#include <windows.h>
#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */

#define __far
#define _far
#define far
#define huge
#define volatile

#ifdef SEPARATE_PROCESSES
#undef SEPARATE_PROCESSES
#endif

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;

typedef HWND LPAUDIO_HANDLE_T;

#endif
#endif /* _PORT_H */

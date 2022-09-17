/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:        portw.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DECtalk porting specific header file - FOR WINDOWS 95 Code
 *
 ***********************************************************************
 *    Revision History:
 * 001  ETT		10/05/1998      Added Linux code.
 */

#ifndef _PORT_H
#define _PORT_H

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

#ifndef OLEDECTALK
typedef HWND LPAUDIO_HANDLE_T;
#endif

#endif

#endif /* _PORT_H */

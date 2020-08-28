/************************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:        port.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DECtalk porting specific header file - FOR WINDOWS 95 Code
 *
 ***********************************************************************
 *    Revision History:
 *
 *  Rev Name    Date        Description
 *  --- -----   ----------- --------------------------------------------
 *  001	GL		04/21/1997	BATS#357  Add the code for __osf__ build 
 *  002 MGS		09/08/1997	Made change for osf build
 *				11/13/1997	bats423: correct LP_AUDIO_HANDLE_T (aug97)
 *  003 GL 		05/04/1998	Add dectalkf.h here to make sure every file catch
 *                          the setup.
 *  004 ETT		10/05/1998  Added Linux code.
 *  005	MGS		07/14/2000	Sapi 5 additions
 *  006	CAB		01/19/2001	Fixed copyright
 *  007	MGS		02/28/2001	Merged in base changes needed for ACCESS32 merge
 *  008	MGS		05/09/2001	Some VxWorks porting BATS#972
 *  009	MGS		05/18/2001	More VxWorks porting
 *  010	MGS		06/19/2001	Solaris Port BATS#972
 *  011	MGS		04/11/2002	ARM7 port
 *************************************************************************/

#ifndef _PORT_H
#define _PORT_H

#include "dectalkf.h"

/*************************************************************************
 *  WINDIC
 *              Hack Job?
 *************************************************************************/

#ifdef WINDIC
#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */
#define __far
#define _far
#define far
#define huge
#define _huge
#define volatile

#ifdef SEPARATE_PROCESSES
#undef SEPARATE_PROCESSES
#endif

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;

#endif  //WINDIC


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
typedef signed char S8;
typedef unsigned char U8;

#endif

/*
 ************************************************************************
 * defines for DEC OSF/1 AXP & UNIXs
 */
#if defined (__osf__) || defined (__linux__)

/*#define ENGLISH_US 1*/

/* GL 04/21/1997  add this for OSF build */
#include "opthread.h"

#include <unistd.h>
#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */
#define __far
#define _far
#define far
#define huge
#define _huge
#ifndef __linux__
#define volatile
#endif

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;
typedef signed char S8;
typedef unsigned char U8;

#ifdef __osf__
typedef unsigned long QWORD;
#endif
#ifdef __linux__
typedef unsigned long long QWORD;
#endif

/* GL 04/21/1997  add this for OSF build */
#ifndef _DWORD
#define _DWORD
typedef U32 DWORD;
#endif
typedef U16 USHORT;
typedef void * PVOID;
#ifndef _UINT
#define _UINT
typedef U32 UINT;
#endif
#define IsBadWritePtr(ptr, size) ((ptr == NULL) ? 1 : 0)
#define _stricmp strcasecmp
#define PRINTFDEBUG
#endif

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
typedef signed char S8;
typedef unsigned char U8;

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
typedef signed char S8;
typedef unsigned char U8;
typedef unsigned _int64 QWORD, * PQWORD; //tek 04aug97 sapi fixes

typedef HANDLE DT_HANDLE;
typedef  DT_HANDLE  HTHREAD_T;
typedef  DT_HANDLE  HEVENT_T;
typedef  CRITICAL_SECTION  MUTEX_T;
typedef  MUTEX_T *  HMUTEX_T;

#if !(defined OLEDECTALK) && !(defined SAPI5DECTALK)
#include "playaudd.h"
typedef PLAY_AUDIO_T * 	LPAUDIO_HANDLE_T;
#endif //OLEDECTALK

#endif //WIN32

// #define __osf__


/* vxworks stuff */
#if defined VXWORKS

/*#define ENGLISH_US 1*/

/* GL 04/21/1997  add this for OSF build */
#include "opthread.h"

#include <unistd.h>
#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */
#define __far
#define _far
#define far
#define huge
#define _huge

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;
typedef signed char S8;
typedef unsigned char U8;

typedef unsigned long long QWORD;

/* GL 04/21/1997  add this for OSF build */
#ifndef _DWORD
#define _DWORD
typedef U32 DWORD;
#endif
typedef void * PVOID;

#define _inline inline

#define IsBadWritePtr(ptr, size) ((ptr == NULL) ? 1 : 0)
//#define _stricmp strcasecmp
#define PRINTFDEBUG
#endif


/* stuff for sparc/Solaris */
#if defined __sun && defined __sparc
#ifndef _SPARC_SOLARIS_
#define _SPARC_SOLARIS_
#endif
#ifndef _BIGENDIAN_
#define _BIGENDIAN_
#endif
#endif

#ifdef _SPARC_SOLARIS_
#include "opthread.h"

#include <unistd.h>
#include <stdio.h>

/*
 * fake out some MSDOS stuff
 */
#define __far
#define _far
#define far
#define huge
#define _huge
//#ifndef __linux__
//#define volatile
//#endif

typedef unsigned short DT_PIPE_T;
typedef int S32;
typedef unsigned int U32;
typedef short S16;
typedef unsigned short U16;
typedef signed char S8;
typedef unsigned char U8;

typedef unsigned long long QWORD;

#define _inline 
#define __inline 

/* GL 04/21/1997  add this for OSF build */
#ifndef _DWORD
#define _DWORD
typedef U32 DWORD;
#endif
typedef U16 USHORT;
typedef void * PVOID;
#ifndef _UINT
#define _UINT
typedef U32 UINT;
#endif
#define IsBadWritePtr(ptr, size) ((ptr == NULL) ? 1 : 0)
#define _stricmp strcasecmp
#define PRINTFDEBUG
#endif


/* SWAP_dd_eeeeeee */ 
/* dd is 16 or 32 bits */
/* eeeeee is 
   BIG for big-endian numbers 
   LITTLE for little-endian numbers */
/* ex on intel SWAP_32_LITTLE(x) does nothing
   but on sparc SWAP_32_LITTLE(x) swaps the bytes */

#ifndef _BIGENDIAN_
#define SWAP_16_BIG(x) (((((U16)(x))&0xff00)>>8) | \
                        ((((U16)(x))&0x00ff)<<8))
#define SWAP_16_LITTLE(x) (x)
#define SWAP_32_BIG(x) (((((U32)(x))&0xff000000)>>24) | \
                        ((((U32)(x))&0x00ff0000)>>8) | \
                        ((((U32)(x))&0x0000ff00)<<8) | \
                        ((((U32)(x))&0x000000ff)<<24))
#define SWAP_32_LITTLE(x) (x)
#else
#define SWAP_16_LITTLE(x) (((((U16)(x))&0xff00)>>8) | \
                           ((((U16)(x))&0x00ff)<<8))
#define SWAP_16_BIG(x) (x)
#define SWAP_32_LITTLE(x) (((((U32)(x))&0xff000000)>>24) | \
                           ((((U32)(x))&0x00ff0000)>>8) | \
                           ((((U32)(x))&0x0000ff00)<<8) | \
                           ((((U32)(x))&0x000000ff)<<24))
#define SWAP_32_BIG(x) (x)
#endif

#ifndef SUN_ULAW
#define SUN_ULAW        1
#define SUN_LIN_8       2
#define SUN_LIN_16      3
#endif

/*
 ************************************************************************
 *  ARM7TDMI
 */
#ifdef ARM7

#ifndef ARM7_NOSWI
#include <stdio.h>
#endif
#include <stdlib.h>
#include <string.h>

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
typedef long S32;
typedef unsigned long U32;
typedef short S16;
typedef unsigned short U16;
typedef signed char S8;
typedef unsigned char U8;
typedef unsigned long DWORD;
//typedef unsigned _int64 QWORD, * PQWORD; //tek 04aug97 sapi fixes

typedef void * DT_HANDLE;
typedef void * LPVOID;
typedef void * PVOID;
typedef long MMRESULT;

//typedef  DT_HANDLE  HTHREAD_T;
//typedef  DT_HANDLE  HEVENT_T;
//typedef  CRITICAL_SECTION  MUTEX_T;
//typedef  MUTEX_T *  HMUTEX_T;

#ifdef EPSON_ARM7
#include "ltsnames.h"
#endif


#endif //ARM7

#endif /* _PORT_H */

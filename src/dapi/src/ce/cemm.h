/*
 ***********************************************************************
 *
 *                           Copyright (c)
 * 	  Copyright © 2000 Force Computers, Inc., a Solectron company. All rights reserved.
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
 *    File Name:        cemm.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *		Windows CE header file catchall
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date		Description
 * ---  ------	-----------	--------------------------------------------
 *	
 * 001	MFG		10/21/1998	Initial Revision
 * 002	MFG		01/06/1999	Added WideStringtoAsci() conversion declaratrion 
 * 003  MFG		03/23/1999	Added _beginthreadex and _endthreadex declaration for WinCE 211
 * 004	MFG		03/22/1999	added the timeGetTime declaration
 * 005  MFG		07/27/1999  added calloc() declaration for WinCE 
 * 006  MFG		07/30/1999	Added for all version of WINCE _beginthreadex and _endthreadex
 * 007	MFG		10/10/2000	Added support for Palm and Pocket PC
 * 008	CAB		11/06/2000	change to #if defined(WIN32_PLATFORM_PSPC) && (UNDER_CE != 300)
 *							inorder not to get error in POCKET PC
 *
 ************************************************************************
 */


#ifdef UNDER_CE

#ifndef CEMM_HEADER
#define CEMM_HEADER

#define MMIO_READ       0x00000000      /* open file for reading only */
#define MMIO_WRITE      0x00000001      /* open file for writing only */
#define MMIO_READWRITE  0x00000002      /* open file for reading and writing */
#define MMIO_FINDCHUNK          0x0010  /* mmioDescend: find a chunk by ID */
#define FOURCC_RIFF     mmioFOURCC('R', 'I', 'F', 'F')

typedef DWORD           FOURCC;         /* a four character code */
typedef char *    HPSTR;          /* a huge version of LPSTR */

#if (UNDER_CE == 200)
int sprintf(char *, const char *, ...);
#endif

unsigned long __cdecl _beginthreadex(void *, unsigned,
	unsigned (__stdcall *) (void *), void *, unsigned, unsigned *);
void __cdecl _endthreadex(unsigned);

//#if !(defined(WIN32_PLATFORM_PSPC) && (_WIN32_WCE >= 300))
#if defined(WIN32_PLATFORM_PSPC) && (UNDER_CE != 300)
void* calloc(size_t, size_t); // 07/27/1999  added calloc() declaration for WinCE
#endif
	/* unicode char to 8-char conversion function mfg 01/06/1999 */
void WideStringtoAsciiString(char *, wchar_t *,unsigned int); 

DWORD timeGetTime(void); 

#endif	// CEMM_HEADER
#endif	// UNDER_CE
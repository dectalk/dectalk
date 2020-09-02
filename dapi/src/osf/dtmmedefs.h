/**********************************************************************/
/*   					Copyright ©                                   */
/*  Copyright © 2001 Force Computers Inc. A Solectron Company. All rights reserved. */
/*  Copyright © SMART Modular Technologies 1999. All rights reserved. */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Force Computers Incorporated. Possession, use,     */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Force or an authorized          */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Force Computers Incorporated may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  This software is provided "as is" and without any express or      */
/*  implied warranties, including, without limitation, implied        */
/*  warranties of non-infringement, merchantibility or fitness        */
/*  for a particular purpose. Force assumes no responsibility AT    */
/*  ALL for the use or reliability of this software.                  */
/*                                                                    */
/**********************************************************************/

/*
 * HISTORY
 * Revision 1.1.2.5  1998/11/16  time		Eric Thompson
 *		added define for osf. actually Matt did.
 * Revision 1.1.2.4  1998/11/12  time		Eric Thompson
 *     fixed stuff for osf
 * Revision 1.1.2.3  1996/01/03  21:08:07  Bill_Hallahan
 * 	New audio subsystem
 * 	[1996/01/03  21:02:31  Bill_Hallahan]
 *
 * Revision 1.1.2.2  1995/07/05  19:35:32  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:23  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  23:07:20  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:12:51  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 */
/*
 * 001	MGS	09/09/1997	Changed code for osf
 * 002	MGS	05/09/2001	Some VxWorks porting BATS#972
 * 003	CAB	05/14/2001	Updated copyright info.
 * 004	CAB	05/14/2001	Consolidated multiple copyrights fields
 * 005	MGS	06/19/2001	Solaris Port BATS#972
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

/*
**++
**
** FACILITY: DECtalk
**
** FILE NAME: dtmmedefs.h
**
** MODULE DESCRIPTION:
**       Basic definitions used by the DECtalk.
**	 Compatibility definitions for Multimedia Services for OSF/1.
**
** AUTHORS:
**
** CREATION DATE: 3/15/1993
**
** DESIGN OVERVIEW:
**         
**
**--
*/

#ifndef H_MMBASIC
#define H_MMBASIC 1

#if defined __sun && defined __sparc
#ifndef _SPARC_SOLARIS_
#define _SPARC_SOLARIS_
#endif
#ifndef _BIGENDIAN_
#define _BIGENDIAN_
#endif
#endif


/*
** [Include Files]
*/
/* None */
/*
** Constant Definitions
*/
#define CONST               const
#define CALLBACK
#define APIENTRY
#define WINAPI   	APIENTRY
#define FAR
#define NEAR
#define PASCAL

/*
** Data Structure Definitions
*/
/* basic data type for ALPHA MM system */
typedef char                Int8;
typedef short               Int16;
typedef int                 Int32;
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
typedef long long                Int64;
#else
typedef long                Int64;
#endif
typedef unsigned char       Uint8;
typedef unsigned short      Uint16;
typedef unsigned int        Uint32;
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
typedef unsigned long long  Uint64; 
#else     
typedef unsigned long       Uint64; 
#endif

typedef char                Char8;
typedef short               Char16;
#ifdef  __osf__
typedef Uint32      	    DWORD;
#endif
#if defined __linux__ || defined _SPARC_SOLARIS_
#ifndef _DWORD
#define _DWORD
typedef Uint32      	    DWORD;
#endif
#endif
#ifdef VXWORKS
#ifndef _DWORD
#define _DWORD
typedef Uint32      	    DWORD;
#endif
#endif
/* Windows specific data types */
#ifdef WIN32
typedef Uint32      	    DWORD;
#endif
#ifdef VXWORKS
//typedef int BOOL;
#else
typedef unsigned char 		    BOOL;
#endif

#ifndef TRUE
#define TRUE	1
#endif

#ifndef FALSE
#define FALSE	0
#endif

#if !defined VXWORKS && !defined _SPARC_SOLARIS_
#ifndef NULL
#define NULL  ((void *)0)
#endif
#endif

typedef Uint8       	    BYTE;

#ifndef _WORD
#define _WORD
typedef Uint16      	    WORD;
#endif

typedef Int32               INT;
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
typedef Int32               LONG;
#else
typedef Int64               LONG;
#endif

typedef float               FLOAT;

#ifndef VXWORKS
#ifndef _UINT
#define _UINT

typedef Uint32        	    UINT;
#endif
#endif

typedef Char8 		    CHAR;
typedef Int16 		    SHORT;

typedef Uint32        	    *PUINT;
typedef FLOAT               *PFLOAT;
typedef BOOL 	            *PBOOL;
typedef BOOL                *LPBOOL;
typedef BYTE                *PBYTE;
typedef BYTE                *LPBYTE;
typedef INT                 *PINT;
typedef INT                 *LPINT;
typedef WORD                *PWORD;
typedef WORD                *LPWORD;
typedef LONG                *LPLONG;
typedef DWORD               *PDWORD;
typedef DWORD               *LPDWORD;
#ifndef VXWORKS
typedef void		    VOID;
#endif
typedef void                *LPVOID;

typedef LONG                SIZE;

/* Types use for passing & returning polymorphic values */
typedef UINT                WPARAM;
typedef LONG                LPARAM;
typedef UINT                MMRESULT;

/* Handle is 32 bit UINT */
#ifdef VXWORKS
typedef LONG *DT_HANDLE;                
#else
typedef LONG *DT_HANDLE;
typedef DT_HANDLE HANDLE;                
#endif

typedef Char16 WCHAR;    /* wc,   16-bit UNICODE character */

typedef WCHAR *PWCHAR;
typedef WCHAR *LPWCH, *PWCH;
typedef CONST WCHAR *LPCWCH, *PCWCH;
typedef WCHAR *NWPSTR;
typedef WCHAR *LPWSTR, *PWSTR;

typedef CONST WCHAR *LPCWSTR, *PCWSTR;
typedef CHAR *LPSTR, *PSTR;
typedef CHAR *LPCSTR;

#define DECLARE_HANDLE(handle) typedef DT_HANDLE handle
/*
** Exported Global Variables
*/
/* None */

/*
** Pseudo Functions (#defined macros)
*/
/* None */

/*
** Exported Function Proto-types
*/
/* None */

/****************************************************************************

                        General error return values

****************************************************************************/
#define MMSYSERR_BASE         0
#define MMSYSERR_NOERROR      0                    /* no error */
#define MMSYSERR_ERROR        (MMSYSERR_BASE + 1)  /* unspecified error */
#define MMSYSERR_BADDEVICEID  (MMSYSERR_BASE + 2)  /* device ID out of range */
#define MMSYSERR_NOTENABLED   (MMSYSERR_BASE + 3)  /* driver failed enable */
#define MMSYSERR_ALLOCATED    (MMSYSERR_BASE + 4)  /* device already allocated */
#define MMSYSERR_INVALHANDLE  (MMSYSERR_BASE + 5)  /* device handle is invalid */
#define MMSYSERR_NODRIVER     (MMSYSERR_BASE + 6)  /* no device driver present */
#define MMSYSERR_NOMEM        (MMSYSERR_BASE + 7)  /* memory allocation error */
#define MMSYSERR_NOTSUPPORTED (MMSYSERR_BASE + 8)  /* function isn't supported */
#define MMSYSERR_BADERRNUM    (MMSYSERR_BASE + 9)  /* error value out of range */
#define MMSYSERR_INVALFLAG    (MMSYSERR_BASE + 10) /* invalid flag passed */
#define MMSYSERR_INVALPARAM   (MMSYSERR_BASE + 11) /* invalid parameter passed */
#define MMSYSERR_HANDLEBUSY   (MMSYSERR_BASE + 12) /* handle being used */
                                                   /* simultaneously on another */
                                                   /* thread (eg callback) */
#define MMSYSERR_INVALIDALIAS (MMSYSERR_BASE + 13) /* "Specified alias not found in WIN.INI */
#define MMSYSERR_LASTERROR    (MMSYSERR_BASE + 13) /* last error in range */

/* defines for dwFormat field of WAVEINCAPS and WAVEOUTCAPS */
#define WAVE_INVALIDFORMAT     0x00000000       /* invalid format */
#define WAVE_FORMAT_1M08       0x00000001       /* 11.025 kHz, Mono,   8-bit */
#define WAVE_FORMAT_1S08       0x00000002       /* 11.025 kHz, Stereo, 8-bit */
#define WAVE_FORMAT_1M16       0x00000004       /* 11.025 kHz, Mono,   16-bit */
#define WAVE_FORMAT_1S16       0x00000008       /* 11.025 kHz, Stereo, 16-bit */
#define WAVE_FORMAT_2M08       0x00000010       /* 22.05  kHz, Mono,   8-bit */
#define WAVE_FORMAT_2S08       0x00000020       /* 22.05  kHz, Stereo, 8-bit */
#define WAVE_FORMAT_2M16       0x00000040       /* 22.05  kHz, Mono,   16-bit */
#define WAVE_FORMAT_2S16       0x00000080       /* 22.05  kHz, Stereo, 16-bit */
#define WAVE_FORMAT_4M08       0x00000100       /* 44.1   kHz, Mono,   8-bit */
#define WAVE_FORMAT_4S08       0x00000200       /* 44.1   kHz, Stereo, 8-bit */
#define WAVE_FORMAT_4M16       0x00000400       /* 44.1   kHz, Mono,   16-bit */
#define WAVE_FORMAT_4S16       0x00000800       /* 44.1   kHz, Stereo, 16-bit */
#define WAVE_FORMAT_08M08      0x00001000       /* 8      kHz, Mono,   8-bit */
#define WAVE_FORMAT_08M16      0x00002000       /* 8      kHz, Mono,   16-bit */
#define WAVE_FORMAT_MULAW      0x00000007	/* 8      kHz, Mono,   Mu-law */

#define WAVE_MAPPER     ((DWORD)(-1))   /* device ID for wave device mapper */
#define WAVE_OPEN_SHAREABLE   0x00000004       /* Open device as shareable */
#define CALLBACK_FUNCTION   0x00030000l    /* dwCallback is a FARPROC */
#define WAVE_FORMAT_PCM     1 

#ifndef SUN_ULAW
#define SUN_ULAW        1
#define SUN_LIN_8       2
#define SUN_LIN_16      3
#endif


/* general extended waveform format structure
   Use this for all NON PCM formats
   (information common to all formats)
*/
#ifndef tWAVEFORMATEX
#define _WAVEFORMATEX_
typedef struct tWAVEFORMATEX
{
    WORD    wFormatTag;        /* format type */
    WORD    nChannels;         /* number of channels (i.e. mono, stereo...) */
    DWORD   nSamplesPerSec;    /* sample rate */
    DWORD   nAvgBytesPerSec;   /* for buffer estimation */
    WORD    nBlockAlign;       /* block size of data */
    WORD    wBitsPerSample;    /* Number of bits per sample of mono data */
    WORD    cbSize;            /* The count in bytes of the size of
                                    extra information (after cbSize) */

} WAVEFORMATEX;
typedef WAVEFORMATEX       *PWAVEFORMATEX;
typedef WAVEFORMATEX NEAR *NPWAVEFORMATEX;
typedef WAVEFORMATEX FAR  *LPWAVEFORMATEX;
#endif /* _WAVEFORMATEX_ */

#endif  /* H_MMBASIC */

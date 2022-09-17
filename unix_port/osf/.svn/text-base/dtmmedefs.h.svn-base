/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	18	09/29/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	17	09/29/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	16	09/29/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	15	09/29/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	14	09/29/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	13	09/29/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	12	09/29/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	11	09/29/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	10	09/29/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	9	09/29/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	8	09/29/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	7	09/29/97	leeber	Working UNIX code check-in. 09/29/97 cjl
	6	05/21/97	leeber	Build 104 V4.40.43 R007 08/18/97; Static Builds, Help files, BATS 124, 147, 152, 223, 257, 270, 283, 298, 314, 340, 348, 351, 364, 384, 388, 390, 395, 396, 405, 409-412, 416, 422, 438 & 441. 08/18/97 cjl FREEZE
	5	05/21/97	leeber	Preliminary Code Freeze; Missing docs, hlp and tuning files; otherwisw complete. cjl BUILD 104 V4.40.40 R007 x8/07/97
	4	05/21/97	leeber	Build 104 V4.40.38 B006 _6/25/97 Typning Mode w/assistve32 SDK, Re_Freeze after system crash. 6/25/97 cjl
	3	05/21/97	leeber	Build 104 V4.40.38 B006 06/25/97 Typning Mode w/assistve32 SDK. 6/25/97 cjl
	2	05/21/97	leeber	This is "BUILD 104 V4.40.37 B006H 06/20/97" and contans the special typing_mode build for Henter Joyce. 6/20/97 cjl
	1	05/21/97	simoneau	Initial Version
$
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
 * $EndLog$
 */
/*
 * 001	MGS	09/09/1997	Changed code for osf
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
typedef long                Int64;

typedef unsigned char       Uint8;
typedef unsigned short      Uint16;
typedef unsigned int        Uint32;     
typedef unsigned long       Uint64; 


typedef char                Char8;
typedef short               Char16;

/* Windows specific data types */
#ifdef WIN32
typedef Uint32      	    DWORD;
#endif
typedef unsigned char 		    BOOL;

#ifndef TRUE
#define TRUE	1
#endif

#ifndef FALSE
#define FALSE	0
#endif

#ifndef NULL
#define NULL  ((void *)0)
#endif

typedef Uint8       	    BYTE;

#ifndef _WORD
#define _WORD
typedef Uint16      	    WORD;
#endif

typedef Int32               INT;
typedef Int64               LONG;
typedef float               FLOAT;

#ifndef _UINT
#define _UINT
typedef Uint32        	    UINT;
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
typedef void		    VOID;
typedef void                *LPVOID;

typedef LONG                SIZE;

/* Types use for passing & returning polymorphic values */
typedef UINT                WPARAM;
typedef LONG                LPARAM;
typedef UINT                MMRESULT;

/* Handle is 32 bit UINT */
typedef UINT HANDLE;                

typedef Char16 WCHAR;    /* wc,   16-bit UNICODE character */

typedef WCHAR *PWCHAR;
typedef WCHAR *LPWCH, *PWCH;
typedef CONST WCHAR *LPCWCH, *PCWCH;
typedef WCHAR *NWPSTR;
typedef WCHAR *LPWSTR, *PWSTR;

typedef CONST WCHAR *LPCWSTR, *PCWSTR;
typedef CHAR *LPSTR, *PSTR;
typedef CHAR *LPCSTR;

#define DECLARE_HANDLE(handle) typedef HANDLE handle
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
#define WAVE_FORMAT_MULAW      0x00000007	/* 8      kHz, Mono,   Mu-law */

#define WAVE_MAPPER     ((DWORD)(-1))   /* device ID for wave device mapper */
#define WAVE_OPEN_SHAREABLE   0x00000004       /* Open device as shareable */
#define CALLBACK_FUNCTION   0x00030000l    /* dwCallback is a FARPROC */
#define WAVE_FORMAT_PCM     1 

/* general extended waveform format structure
   Use this for all NON PCM formats
   (information common to all formats)
*/
#ifndef _WAVEFORMATEX_
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

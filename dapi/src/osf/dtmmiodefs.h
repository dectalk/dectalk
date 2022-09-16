/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	27	11/25/98	leeber	Build 109 V4.60.04 R003 04/22/99; Freeze Mark; No matching AD Mark. 04/27/99 cjl
	26	11/25/98	leeber	Build 109 V4.60.03 R003 03/31/99 Freeze Mark 04/02/99 cjl
	25	11/25/98	leeber	Build 108 V4.60.02 B002 01/29/99, Freeze Mark, 02/25/99 cjl
	24	11/25/98	leeber	Files verified as different on both WinDif and StarTeam for chnages between AD and RND. 02/01/99 cjl
	23	11/25/98	leeber	AD->RND pre-v4.60.01 B002 freeze. This code works for 32 and 16 bits. 01/19/99 cjl
	22	05/21/97	leeber	Build 108 V4.51.08 R007 11/03/98, Patch BATS#741 and UNIX build process bugs. 11/06/98 cjl
	21	05/21/97	leeber	AD-> RND File Update; Alpha kitting and DETX build not verified, End Of Beta Test, No showstops/highs; For release mark. Build 108 V4.51.07 R006 08/20/98. 08/31/98 cjl
	20	05/21/97	leeber	BUILD 108 V4.51.06 R005 06/26/98; BATS#249, 290, 313, 428, 492, 532, 546, 550, 566, 590, 599, 602, 603, 607, 608, 610, 613, 616, 623, 626, 631-633, 636-639, 630, 641-643, 645, 648, 651, 656-661, 663, 665, 666, 668, 672, 674-677, 681-683, 685, 688-693, 695
	19	05/21/97	leeber	This has the correct documentation that goes with Build 107 V4.50.04 R004, from AD. 04/15/98 cjl
	18	05/21/97	leeber	Code freeze Build 107 V4.50.04 R004 03/20/98 has been moved from AD->RND for testing. New keys, BATS (459, 590, 606, 607, 609, 610, 617, 619, 620, 622, 626, 627, 628 & 630) fixes, better process, SAPI features added. 03/27/98 cjl
	17	05/21/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	16	05/21/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	15	05/21/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	14	05/21/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	13	05/21/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	12	05/21/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	11	05/21/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	10	05/21/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	9	05/21/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	8	05/21/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	7	05/21/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	6	05/21/97	leeber	Build 104 V4.40.43 R007 08/18/97; Static Builds, Help files, BATS 124, 147, 152, 223, 257, 270, 283, 298, 314, 340, 348, 351, 364, 384, 388, 390, 395, 396, 405, 409-412, 416, 422, 438 & 441. 08/18/97 cjl FREEZE
	5	05/21/97	leeber	Preliminary Code Freeze; Missing docs, hlp and tuning files; otherwisw complete. cjl BUILD 104 V4.40.40 R007 x8/07/97
	4	05/21/97	leeber	Build 104 V4.40.38 B006 _6/25/97 Typning Mode w/assistve32 SDK, Re_Freeze after system crash. 6/25/97 cjl
	3	05/21/97	leeber	Build 104 V4.40.38 B006 06/25/97 Typning Mode w/assistve32 SDK. 6/25/97 cjl
	2	05/21/97	leeber	This is "BUILD 104 V4.40.37 B006H 06/20/97" and contans the special typing_mode build for Henter Joyce. 6/20/97 cjl
	1	05/21/97	simoneau	Initial Version
$
 * Rev  1.3 or something  ETT fixed stuff for linux, duh
 * Rev  1.2 or something  ETT fixed stuff for osf.
 * Rev  1.1.42?  10/05/1998  ETT     Added Linux code.
 * Revision 1.1.2.3  1996/01/03  21:08:19  Bill_Hallahan
 * 	New audio subsystem
 * 	[1996/01/03  21:02:34  Bill_Hallahan]
 *
 * Revision 1.1.2.2  1995/07/05  19:35:34  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:25  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  23:07:28  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:13:06  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 * $EndLog$
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
** FILE NAME: dtmmiodefs.h
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

#ifndef DTMMIODEF_H
#define DTMMIODEF_H

#ifdef __linux__
//#ifndef H_MMBASIC <-- this is the exclusion for dtmmedefs.h?!
//#define H_MMBASIC
//#endif
#include "port.h"
#endif

//#ifndef  H_MMBASIC
#ifndef __linux__
#include <mme/mmsystem.h>
#include <mme/mme_api.h>
#endif

#include "dtmmedefs.h"

/****************************************************************************

                        Multimedia File I/O support

****************************************************************************/
#define DTKmmioFOURCC( ch0, ch1, ch2, ch3 ) \
( (DWORD)(BYTE)(ch0) | ( (DWORD)(BYTE)(ch1) << 8 ) |    \
  ( (DWORD)(BYTE)(ch2) << 16 ) | ( (DWORD)(BYTE)(ch3) << 24 ) )
     
#ifdef __linux__    /*  All this commented out    */
/* MMIO error return values */
#define MMIOERR_BASE            256
#define MMIOERR_FILENOTFOUND    (MMIOERR_BASE + 1)  /* file not found */
#define MMIOERR_OUTOFMEMORY     (MMIOERR_BASE + 2)  /* out of memory */
#define MMIOERR_CANNOTOPEN      (MMIOERR_BASE + 3)  /* cannot open */
#define MMIOERR_CANNOTCLOSE     (MMIOERR_BASE + 4)  /* cannot close */
#define MMIOERR_CANNOTREAD      (MMIOERR_BASE + 5)  /* cannot read */
#define MMIOERR_CANNOTWRITE     (MMIOERR_BASE + 6)  /* cannot write */
#define MMIOERR_CANNOTSEEK      (MMIOERR_BASE + 7)  /* cannot seek */
#define MMIOERR_CANNOTEXPAND    (MMIOERR_BASE + 8)  /* cannot expand file */
#define MMIOERR_CHUNKNOTFOUND   (MMIOERR_BASE + 9)  /* chunk not found */
#define MMIOERR_UNBUFFERED      (MMIOERR_BASE + 10) /* file is unbuffered */

/* MMIO constants */
#define CFSEPCHAR       '+'             /* compound file name separator char. */

/* MMIO data types */
typedef DWORD FOURCC;         /* a four character code */
typedef HANDLE HMMIO;          /* a handle to an open file */
typedef LPSTR HPSTR;          /* a huge version of LPSTR */

typedef MMRESULT MMIOPROC
                    (LPSTR lpmmioinfo, UINT uMsg, LONG lParam1, LONG lParam2);
typedef MMIOPROC *LPMMIOPROC;

/* general MMIO information data structure */
typedef struct                  /* The MMIO state */
{
        /* general fields */
        DWORD           dwFlags;        /* general status flags */
        FOURCC          fccIOProc;      /* 4 char id for the I/O procedure */
        LPMMIOPROC      pIOProc;        /* pointer to I/O procedure */
        UINT            wErrorRet;      /* place for error to be returned */
        HANDLE          htask;          /* */

        /* fields maintained by MMIO functions during buffered I/O */
        LONG            cchBuffer;      /* size of I/O buffer (or 0L) */
        LPSTR           pchBuffer;      /* start of I/O buffer (or NULL) */
        LPSTR           pchNext;        /* pointer to next byte to read/write */
        LPSTR           pchEndRead;     /* pointer to last valid byte to read */
        LPSTR           pchEndWrite;    /* pointer to last byte to write */
        LONG            lBufOffset;     /* disk offset of start of buffer */

        /* fields maintained by I/O procedure */
        LONG            lDiskOffset;    /* disk offset of next read or write */
        DWORD           adwInfo[3];     /* data specific to type of MMIOPROC */

        /* other fields maintained by MMIO */
        DWORD           dwReserved1;    /* reserved for MMIO use */
        DWORD           dwReserved2;    /* reserved for MMIO use */
        HMMIO           hmmio;          /* handle to open file */

} MMIOINFO;
typedef MMIOINFO       *PMMIOINFO;
typedef MMIOINFO      *NPMMIOINFO;
typedef MMIOINFO      *LPMMIOINFO;

/* RIFF chunk information data structure */
typedef struct MMCKINFO_tag      /* structure for representing RIFF chunk info.
*/
{
        FOURCC          ckid;           /* chunk ID */
        DWORD           cksize;         /* chunk size */
        FOURCC          fccType;        /* form type or list type */
        DWORD           dwDataOffset;   /* offset of data portion of chunk */
        DWORD           dwFlags;        /* flags used by MMIO functions */
} MMCKINFO;
typedef MMCKINFO       *PMMCKINFO;
typedef MMCKINFO      *NPMMCKINFO;
typedef MMCKINFO      *LPMMCKINFO;

/* <dwFlags> field of MMIOINFO structure -- many same as OpenFile() flags */
/* Low word of flags will be passed to OpenFile() -- therefore, any MMIO-
    specific flags should be in the high word.  */
#define MMIO_RWMODE     0x00000003      /* mask to get bits used for opening */
                                        /* file for reading/writing/both */
#define MMIO_SHAREMODE  0x00000070      /* file sharing mode number */

/* constants for dwFlags field of MMIOINFO */
#define MMIO_CREATE     0x00001000      /* create new file (or truncate file) */
#define MMIO_PARSE      0x00000100      /* parse new file returning path */
#define MMIO_DELETE     0x00000200      /* create new file (or truncate file) */
#define MMIO_EXIST      0x00004000      /* checks for existence of file */
#define MMIO_ALLOCBUF   0x00010000     /* mmioOpen() should allocate a buffer */
#define MMIO_GETTEMP    0x00020000      /* mmioOpen() should retrieve temp name */

#define MMIO_DIRTY      0x10000000      /* I/O buffer is dirty */
/* MMIO_DIRTY is also used in the <dwFlags> field of MMCKINFO structure */

#define MMIO_OPEN_VALID 0x0003FFFF      /* valid flags for mmioOpen  ;Internal*/

/* read/write mode numbers (bit field MMIO_RWMODE) */
#define MMIO_READ       0x00000000      /* open file for reading only */
#define MMIO_WRITE      0x00000001      /* open file for writing only */
#define MMIO_READWRITE  0x00000002      /* open file for reading and writing */

/* share mode numbers (bit field MMIO_SHAREMODE) */
#define MMIO_COMPAT     0x00000000      /* compatibility mode */
#define MMIO_EXCLUSIVE  0x00000010      /* exclusive-access mode */
#define MMIO_DENYWRITE  0x00000020      /* deny writing to other processes */
#define MMIO_DENYREAD   0x00000030      /* deny reading to other processes */
#define MMIO_DENYNONE   0x00000040      /* deny nothing to other processes */

/* flags for other functions */
#define MMIO_FHOPEN             0x0010  /* mmioClose(): keep file handle open */
#define MMIO_EMPTYBUF           0x0010  /* mmioFlush(): empty the I/O buffer */
#define MMIO_TOUPPER            0x0010  /* mmioStringToFOURCC(): cvt. to u-case */
#define MMIO_INSTALLPROC    0x00010000  /* mmioInstallIOProc(): install MMIOProc */
#define MMIO_GLOBALPROC     0x10000000 /* mmioInstallIOProc: install globally */
#define MMIO_UNICODEPROC    0x01000000  /* mmioInstallIOProc(): Unicode MMIOProc*/
#define MMIO_REMOVEPROC     0x00020000 /* mmioInstallIOProc(): remove MMIOProc*/
#define MMIO_FINDPROC       0x00040000  /* mmioInstallIOProc(): find an MMIOProc */
#define MMIO_FINDCHUNK          0x0010  /* mmioDescend(): find a chunk by ID */
#define MMIO_FINDRIFF           0x0020  /* mmioDescend(): find a LIST chunk */
                                        /* ??? */
#define MMIO_FINDLIST           0x0040  /* mmioDescend(): find a RIFF chunk */
                                        /* ??? */
#define MMIO_CREATERIFF         0x0020  /* mmioCreateChunk(): make a LIST chunk
*/
                                        /* ??? */
#define MMIO_CREATELIST         0x0040  /* mmioCreateChunk(): make a RIFF chunk */
                                        /* ??? */

#define MMIO_VALIDPROC      0x11070000  /* valid for mmioInstallIOProc  ;Internal  */

/* message numbers for MMIOPROC I/O procedure functions */
#define MMIOM_READ      MMIO_READ       /* read (must equal MMIO_READ!) */
#define MMIOM_WRITE    MMIO_WRITE       /* write (must equal MMIO_WRITE!) */
#define MMIOM_SEEK              2       /* seek to a new position in file */
#define MMIOM_OPEN              3       /* open file */
#define MMIOM_CLOSE             4       /* close file */
#define MMIOM_WRITEFLUSH        5       /* write and flush */
#define MMIOM_RENAME            6       /* rename specified file */
#define MMIOM_USER         0x8000       /* beginning of user-defined messages */

/* standard four character codes */
#define FOURCC_RIFF     mmioFOURCC('R', 'I', 'F', 'F')
#define FOURCC_LIST     mmioFOURCC('L', 'I', 'S', 'T')

/* four character codes used to identify standard built-in I/O procedures */
#define FOURCC_DOS      mmioFOURCC('D', 'O', 'S', ' ')
#define FOURCC_MEM      mmioFOURCC('M', 'E', 'M', ' ')

/* flags for mmioSeek() */
#ifndef SEEK_SET
#define SEEK_SET        0               /* seek to an absolute position */
#define SEEK_CUR        1               /* seek relative to current position */
#define SEEK_END        2               /* seek relative to end of file */
#endif  /*ifndef SEEK_SET */


/* other constants */
#define MMIO_DEFAULTBUFFER      8192    /* default buffer size */

/* MMIO macros */
#define mmioFOURCC( ch0, ch1, ch2, ch3 )                                \
                ( (DWORD)(BYTE)(ch0) | ( (DWORD)(BYTE)(ch1) << 8 ) |    \
                ( (DWORD)(BYTE)(ch2) << 16 ) | ( (DWORD)(BYTE)(ch3) << 24 ) )
/* This macro is machine byte-sex and word-sex dependent!! */
/* The characters are BYTES, so compatible with ANSI, not at all with UNICODE */

/* MMIO prototypes */

FOURCC APIENTRY mmioStringToFOURCCA(LPCSTR sz, UINT uFlags);
FOURCC APIENTRY mmioStringToFOURCCW(LPCWSTR sz, UINT uFlags);
#ifdef UNICODE
#define mmioStringToFOURCC mmioStringToFOURCCW
#else
#define mmioStringToFOURCC mmioStringToFOURCCA
#endif /* !UNICODE */

LPMMIOPROC APIENTRY mmioInstallIOProcA( FOURCC fccIOProc, LPMMIOPROC pIOProc,
                                        DWORD dwFlags);
LPMMIOPROC APIENTRY mmioInstallIOProcW( FOURCC fccIOProc, LPMMIOPROC pIOProc,
                                        DWORD dwFlags);
#ifdef UNICODE
#define mmioInstallIOProc mmioInstallIOProcW
#else
#define mmioInstallIOProc mmioInstallIOProcA
#endif /* !UNICODE */
HMMIO APIENTRY mmioOpenA( LPSTR szFileName, LPMMIOINFO lpmmioinfo,
                          DWORD dwOpenFlags);
HMMIO APIENTRY mmioOpenW( LPWSTR szFileName, LPMMIOINFO lpmmioinfo,
                          DWORD dwOpenFlags);
#ifdef UNICODE
#define mmioOpen mmioOpenW
#else
#define mmioOpen mmioOpenA
#endif /* !UNICODE */

MMRESULT APIENTRY mmioRenameA( LPCSTR szFileName, LPCSTR szNewFileName,
                               LPMMIOINFO lpmmioinfo, DWORD dwRenameFlags);
MMRESULT APIENTRY mmioRenameW( LPCWSTR szFileName, LPCWSTR szNewFileName,
                               LPMMIOINFO lpmmioinfo, DWORD dwRenameFlags);
#ifdef UNICODE
#define mmioRename mmioRenameW
#else
#define mmioRename mmioRenameA
#endif /* !UNICODE */

typedef struct {
    WORD    wFormatTag;        /* format type */
    WORD    nChannels;        /* number of channels (i.e. mono, stereo, etc.) */
    DWORD   nSamplesPerSec;    /* sample rate */
    DWORD   nAvgBytesPerSec;   /* for buffer estimation */
    WORD    nBlockAlign;       /* block size of data */
} WAVEFORMAT;

typedef WAVEFORMAT       *PWAVEFORMAT;
typedef WAVEFORMAT      *NPWAVEFORMAT;
typedef WAVEFORMAT      *LPWAVEFORMAT;
/* NOTE:  The fields in the structure above are copied into */
/* the MCI_WAVE_SET_PARMS structure during execution */

/* specific waveform format for PCM data */
typedef struct tagPCMWAVEFORMAT {
    WAVEFORMAT  wf;
    WORD        wBitsPerSample;        /* corresponds to MCI_WAVE_SET_.... structure */
} PCMWAVEFORMAT;
typedef PCMWAVEFORMAT       *PPCMWAVEFORMAT;
typedef PCMWAVEFORMAT      *NPPCMWAVEFORMAT;
typedef PCMWAVEFORMAT      *LPPCMWAVEFORMAT;

#endif  /*  All this commented out    */

#ifdef __linux__

/* Jie Lee for linux build */
HMMIO APIENTRY DTKmmioOpen( LPSTR, MMIOINFO *, DWORD);

MMRESULT APIENTRY DTKmmioClose( HMMIO hmmio, UINT uFlags);
MMRESULT APIENTRY DTKmmioRead( HMMIO hmmio, LPSTR pch, LONG cch);
MMRESULT APIENTRY DTKmmioWrite( HMMIO hmmio, LPSTR pch, LONG cch);
MMRESULT APIENTRY DTKmmioSeek( HMMIO hmmio, LONG lOffset, int iOrigin);
MMRESULT APIENTRY DTKmmioGetInfo( HMMIO hmmio,
				  LPMMIOINFO lpmmioinfo,
		                  UINT uFlags);

MMRESULT APIENTRY DTKmmioSetInfo( HMMIO hmmio,
				  LPMMIOINFO lpmmioinfo,
				  UINT uFlags);

MMRESULT APIENTRY DTKmmioSetBuffer( HMMIO hmmio, LPSTR pchBuffer,
				    LONG cchBuffer,
                                    UINT uFlags);

MMRESULT APIENTRY DTKmmioFlush( HMMIO hmmio, UINT uFlags);

MMRESULT APIENTRY DTKmmioAdvance( HMMIO hmmio,
				  LPMMIOINFO lpmmioinfo,
				  UINT uFlags);

MMRESULT APIENTRY DTKmmioSendMessage( HMMIO hmmio, UINT uMsg,
                                      LONG lParam1, LONG lParam2);

/* RIFF I/O prototypes */
MMRESULT APIENTRY DTKmmioDescend( HMMIO hmmio,
			          LPMMCKINFO lpck,
                                  LPMMCKINFO lpckParent,
			          UINT uFlags);

MMRESULT APIENTRY DTKmmioAscend(HMMIO hmmio, LPMMCKINFO lpck, UINT uFlags);
MMRESULT APIENTRY DTKmmioCreateChunk(HMMIO hmmio, LPMMCKINFO lpck, UINT uFlags);
#endif /* __linux__ */
#endif  /*  #ifndef DTMMIODEF_H */


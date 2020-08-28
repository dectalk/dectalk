/**********************************************************************/
/*                            Copyright ©                             */
/*  Copyright © 2000, 2001 Force Computers Inc. A Solectron company. All rights Reserved. */
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
 * 011	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 012	CAB		05/14/2001	Consolidated copyright info
 * 013	MGS		06/19/2001	Solaris Port BATS#972
 * 
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

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
//#ifndef H_MMBASIC <-- this is the exclusion for dtmmedefs.h?!
//#define H_MMBASIC
//#endif
#include "port.h"
#endif

//#ifndef  H_MMBASIC
#if !defined __linux__ && !defined VXWORKS && !defined _SPARC_SOLARIS_
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
     
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
  /*  All this commented out    */
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
typedef long HMMIO;          /* a handle to an open file */
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
        DT_HANDLE          htask;          /* */

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

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_

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


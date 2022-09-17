/************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:		linux_audio.h
 *    Author:			Eric Thompson
 *    Creation Date:	09/03/1998
 *
 *    Functionality:	header file for linux_audio.c
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 000  ETT     	09/03/1998	spawned forth via the merky depths of....
 * 001  ETT		11/12/1998	fixed the itsy/intel min/max thread priority
 * 002	MGS		02/13/2001	Changes for ipaq linux
 * 003	MGS		02/28/2001	Merged in base changes needed for ACCESS32 merge
 * 004	CAB		03/01/2001	Updated copyright info
 * 005	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 006	MGS		06/19/2001	Solaris Port BATS#972
 ***********************************************************************/

#if defined _UNIX_LIKE_
#ifndef LINUX_AUDIO_H
#define LINUX_AUDIO_H

#include "dectalkf.h"
#if !defined VXWORKS && !defined _APPLE_MAC_
#include <malloc.h>
#endif
#include <stdlib.h>
#include <stdio.h>
#include "opthread.h"
#include "mmalloc.h"
#include "playaudd.h"
#include "playaud.h"

#ifndef VXWORKS
typedef unsigned short  UINT16;
typedef unsigned int    UINT32;
#endif
typedef UINT32          MMVERSION;
typedef int             HWAVE16;
typedef int             HWAVE;
typedef unsigned short  BOOL16;
typedef int             BOOL32;
typedef UINT16          HANDLE16;
typedef UINT32          HANDLE32;
typedef UINT16          HLOCAL16;
typedef UINT16          HWND16;
typedef const VOID     *LPCVOID;
typedef DWORD           SEGPTR;

#define  WAVE_DIRECTSOUND               0x0080
#define NEAR_MATCH(rate1,rate2) (((100*((int)(rate1)-(int)(rate2)))/(rate1))==0)
#define min(a,b)   (((a) < (b)) ? (a) : (b))

#define TRACE_ON(ch) 0
#ifdef _SPARC_SOLARIS_
#define DPRINTF(format, args...)
#define TRACE(fmt, args...)
#define WARN(fmt, args...)
#define ERR(fmt, args...)
#define ERR2(fmt, args...)  DPRINTF(fmt, ## args)
#define FIXME(fmt, args...)
#define DUMP(format, args...)
#else
#ifdef _DEBUG
#define stddeb  stderr
#define DPRINTF(format, args...) fprintf(stddeb, format, ## args)
#define TRACE(fmt, args...) DPRINTF(fmt, ## args)
#define WARN(fmt, args...)  DPRINTF(fmt, ## args)
#define ERR(fmt, args...)  DPRINTF(fmt, ## args)
#define FIXME(fmt, args...) DPRINTF(fmt, ## args)
#define DUMP(format, args...)   DPRINTF(format, ## args)
#else
#define DPRINTF(format, args...)
#define TRACE(fmt, args...)
#define WARN(fmt, args...)
#define ERR(fmt, args...)
#define ERR2(fmt, args...)  DPRINTF(fmt, ## args)
#define FIXME(fmt, args...)
#define DUMP(format, args...)
#endif
#endif /* NO_DEBUG_MSGS */

#define LOBYTE(w)              ((BYTE)(WORD)(w&0x00ff))
#define HIBYTE(w)              ((BYTE)((WORD)(w&0xff00) >> 8))

#define LOWORD(l)              ((WORD)(DWORD)(l&0x0000ffff))
#define HIWORD(l)              ((WORD)((DWORD)(l) >> 16))

#define SLOWORD(l)             ((INT16)(LONG)(l))
#define SHIWORD(l)             ((INT16)((LONG)(l) >> 16))

#define MAKELONG(low,high)     ((LONG)(((WORD)(low)) | \
				       (((DWORD)((WORD)(high))) << 16)))

#define mallocLock( a ) malloc( a )
#define freeLock( b ) free( b )

//#define EnterCriticalSection OP_LockMutex
//#define LeaveCriticalSection OP_UnlockMutex
#define InitializeCriticalSection OP_CreateMutex
#define DeleteCriticalSection OP_DestroyMutex
#define CreateEvent(a,b,c,d) OP_CreateEvent(b,c)
#define SetEvent OP_SetEvent
#define ResetEvent OP_ResetEvent
#define Sleep OP_Sleep
#define CreateThread(a,b,c,d,e,f) OP_CreateThread(b,c,d)
#define ExitThread OP_ExitThread
#define WaitForSingleObject OP_WaitForEvent
#define INFINITE OP_INFINITE
#define INVALID_HANDLE_VALUE ((DT_HANDLE) -1)

typedef HWAVEOUT FAR *LPHWAVEOUT;

#define MAXWAVEDRIVERS	10
#define MAXMIDIDRIVERS	10
#define MAXAUXDRIVERS	10
#define MAXMCIDRIVERS	32
#define MAXMIXERDRIVERS	10

#define MAXERRORLENGTH   128    /* max error text length (including NULL) */
#define MAXPNAMELEN 32   /* max product name length including NULL */
#define WAVECAPS_LRVOLUME 0x0008
#define WAVECAPS_VOLUME 0x0004
#define TIME_MS         0x0001
#define TIME_SAMPLES    0x0002
#define TIME_BYTES      0x0004
#define TIME_SMPTE      0x0008  /* SMPTE time */
#define MM_WOM_OPEN     0x3BB
#define MM_WOM_DONE     0x3BC
#define MM_WOM_CLOSE    0x3BD
#define MM_WIM_OPEN         0x3BE           /* waveform input */
#define MM_WIM_CLOSE        0x3BF
#define MM_WIM_DATA         0x3C0

#define WHDR_DONE       0x00000001  /* done bit */
#define WHDR_PREPARED   0x00000002  /* set if this header has been prepared */
#define WHDR_BEGINLOOP  0x00000004  /* loop start block */
#define WHDR_ENDLOOP    0x00000008  /* loop end block */
#define WHDR_INQUEUE    0x00000010  /* reserved for driver */

#define WOM_OPEN        MM_WOM_OPEN
#define WOM_CLOSE       MM_WOM_CLOSE
#define WOM_DONE        MM_WOM_DONE
#define WIM_OPEN        MM_WIM_OPEN
#define WIM_CLOSE       MM_WIM_CLOSE
#define WIM_DATA        MM_WIM_DATA

#define WAVE_FORMAT_QUERY 0x0001

#define LMEM_FIXED          0   
#define LMEM_MOVEABLE       0x0002
#define LMEM_NOCOMPACT      0x0010
#define LMEM_NODISCARD      0x0020
#define LMEM_ZEROINIT       0x0040
#define LMEM_MODIFY         0x0080
#define LMEM_DISCARDABLE    0x0F00
#define LMEM_DISCARDED	    0x4000
#define LMEM_LOCKCOUNT	    0x00FF

#define ERROR_COMMITMENT_LIMIT      1455

typedef struct {
    WORD        wMid;			/* manufacturer ID */
    WORD       	wPid;			/* product ID */
    MMVERSION   vDriverVersion;		/* version of the driver */
    CHAR        szPname[MAXPNAMELEN];	/* product name (0 terminated string) */
    DWORD       dwFormats;		/* formats supported */
    WORD        wChannels;		/* number of sources supported */
    WORD        wReserved1;		/* padding */
    DWORD       dwSupport;		/* functionality supported by driver */
} WAVEOUTCAPS, *LPWAVEOUTCAPS;



#define WAVECAPS_PITCH          0x0001   /* supports pitch control */
#define WAVECAPS_PLAYBACKRATE   0x0002   /* supports playback rate control */
#define WAVECAPS_VOLUME         0x0004   /* supports volume control */
#define WAVECAPS_LRVOLUME       0x0008   /* separate left-right volume control */
#define WAVECAPS_SYNC           0x0010	 /* driver is synchrounous and playing is blocking */
#define WAVECAPS_SAMPLEACCURATE 0x0020	 /* position is sample accurate */
#define WAVECAPS_DIRECTSOUND	0x0040   /* ? */

typedef struct mmtime_tag { 
  UINT wType; 
  union { 
    DWORD ms; 
    DWORD sample; 
    DWORD cb; 
    DWORD ticks; 
    struct { 
      BYTE hour; 
      BYTE min; 
      BYTE sec; 
      BYTE frame; 
      BYTE fps; 
      BYTE dummy; 
      BYTE pad[2]; 
    } smpte; 
    struct { 
      DWORD songptrpos; 
    } midi; 
  } u; 
} MMTIME;
typedef MMTIME FAR *LPMMTIME;

/* General format structure common to all formats, same for Win16 and Win32 */
#ifdef OLD_STRUCT
typedef struct {
    WORD	wFormatTag;	/* format type */
    WORD	nChannels;	/* number of channels */
    DWORD	nSamplesPerSec;	/* sample rate */
    DWORD	nAvgBytesPerSec;/* for buffer estimation */
    WORD	nBlockAlign; 	/* block size of data */
} WAVEFORMAT, *LPWAVEFORMAT;
#endif

#define WAVE_FORMAT_PCM     1

typedef struct {
    WAVEFORMATEX wf;
    WORD	 wBitsPerSample;
} PCMWAVEFORMAT, *LPPCMWAVEFORMAT;

typedef struct {
	HWAVE			hWave;
	LPWAVEFORMATEX		lpFormat;
	DWORD			dwCallback;
	DWORD			dwInstance;
	UINT			uMappedDeviceID;
        DWORD			dnDevNode;
} WAVEOPENDESC, *LPWAVEOPENDESC;

#ifndef PRI_OTHER_MIN
#define PRI_OTHER_MAX -20
#define PRI_OTHER_MIN  20
#endif

#define ERROR_INVALID_HANDLE        6
#define ERROR_INVALID_PARAMETER     87

#define WAVERR_BASE  32
#define WAVERR_BADFORMAT (WAVERR_BASE + 0)
#define WAVERR_STILLPLAYING   (WAVERR_BASE + 1)    /* still something playing */
#define WAVERR_UNPREPARED     (WAVERR_BASE + 2)    /* header not prepared */
#define WAVERR_SYNC           (WAVERR_BASE + 3)    /* device is synchronous */

#define WAVE_FORMAT_UNKNOWN    0x00000000       /*  Microsoft Corporation  */
#define WAVE_FORMAT_1M08       0x00000001       /* 11.025 kHz, Mono,   8-bit  */
#define WAVE_FORMAT_1S08       0x00000002       /* 11.025 kHz, Stereo, 8-bit  */
#define WAVE_FORMAT_1M16       0x00000004       /* 11.025 kHz, Mono,   16-bit */
#define WAVE_FORMAT_1S16       0x00000008       /* 11.025 kHz, Stereo, 16-bit */
#define WAVE_FORMAT_2M08       0x00000010       /* 22.05  kHz, Mono,   8-bit  */
#define WAVE_FORMAT_2S08       0x00000020       /* 22.05  kHz, Stereo, 8-bit  */
#define WAVE_FORMAT_2M16       0x00000040       /* 22.05  kHz, Mono,   16-bit */
#define WAVE_FORMAT_2S16       0x00000080       /* 22.05  kHz, Stereo, 16-bit */
#define WAVE_FORMAT_4M08       0x00000100       /* 44.1   kHz, Mono,   8-bit  */
#define WAVE_FORMAT_4S08       0x00000200       /* 44.1   kHz, Stereo, 8-bit  */
#define WAVE_FORMAT_4M16       0x00000400       /* 44.1   kHz, Mono,   16-bit */
#define WAVE_FORMAT_4S16       0x00000800       /* 44.1   kHz, Stereo, 16-bit */

#define  WAVE_FORMAT_ADPCM      0x0002  /*  Microsoft Corporation  */
#define  WAVE_FORMAT_IBM_CVSD   0x0005  /*  IBM Corporation  */
#define  WAVE_FORMAT_ALAW       0x0006  /*  Microsoft Corporation  */
//#define  WAVE_FORMAT_MULAW      0x0007  /*  Microsoft Corporation  */
#define  WAVE_FORMAT_OKI_ADPCM  0x0010  /*  OKI  */
#define  WAVE_FORMAT_DVI_ADPCM  0x0011  /*  Intel Corporation  */
#define  WAVE_FORMAT_IMA_ADPCM  (WAVE_FORMAT_DVI_ADPCM) /*  Intel Corporation  */
#define  WAVE_FORMAT_MEDIASPACE_ADPCM   0x0012  /*  Videologic  */
#define  WAVE_FORMAT_SIERRA_ADPCM       0x0013  /*  Sierra Semiconductor Corp  */
#define  WAVE_FORMAT_G723_ADPCM 0x0014  /*  Antex Electronics Corporation  */
#define  WAVE_FORMAT_DIGISTD    0x0015  /*  DSP Solutions, Inc.  */
#define  WAVE_FORMAT_DIGIFIX    0x0016  /*  DSP Solutions, Inc.  */
#define  WAVE_FORMAT_DIALOGIC_OKI_ADPCM 0x0017  /*  Dialogic Corporation  */
#define  WAVE_FORMAT_YAMAHA_ADPCM       0x0020  /*  Yamaha Corporation of America  */
#define  WAVE_FORMAT_SONARC     0x0021  /*  Speech Compression  */
#define  WAVE_FORMAT_DSPGROUP_TRUESPEECH        0x0022  /*  DSP Group, Inc  */
#define  WAVE_FORMAT_ECHOSC1    0x0023  /*  Echo Speech Corporation  */
#define  WAVE_FORMAT_AUDIOFILE_AF36     0x0024  /*    */
#define  WAVE_FORMAT_APTX       0x0025  /*  Audio Processing Technology  */
#define  WAVE_FORMAT_AUDIOFILE_AF10     0x0026  /*    */
#define  WAVE_FORMAT_DOLBY_AC2  0x0030  /*  Dolby Laboratories  */
#define  WAVE_FORMAT_GSM610     0x0031  /*  Microsoft Corporation  */
#define  WAVE_FORMAT_ANTEX_ADPCME       0x0033  /*  Antex Electronics Corporation  */
#define  WAVE_FORMAT_CONTROL_RES_VQLPC  0x0034  /*  Control Resources Limited  */
#define  WAVE_FORMAT_DIGIREAL   0x0035  /*  DSP Solutions, Inc.  */
#define  WAVE_FORMAT_DIGIADPCM  0x0036  /*  DSP Solutions, Inc.  */
#define  WAVE_FORMAT_CONTROL_RES_CR10   0x0037  /*  Control Resources Limited  */
#define  WAVE_FORMAT_NMS_VBXADPCM       0x0038  /*  Natural MicroSystems  */
#define  WAVE_FORMAT_CS_IMAADPCM 0x0039 /* Crystal Semiconductor IMA ADPCM */
#define  WAVE_FORMAT_G721_ADPCM 0x0040  /*  Antex Electronics Corporation  */
#define  WAVE_FORMAT_MPEG       0x0050  /*  Microsoft Corporation  */
#define  WAVE_FORMAT_CREATIVE_ADPCM     0x0200  /*  Creative Labs, Inc  */
#define  WAVE_FORMAT_CREATIVE_FASTSPEECH8       0x0202  /*  Creative Labs, Inc  */
#define  WAVE_FORMAT_CREATIVE_FASTSPEECH10      0x0203  /*  Creative Labs, Inc  */
#define  WAVE_FORMAT_FM_TOWNS_SND       0x0300  /*  Fujitsu Corp.  */
#define  WAVE_FORMAT_OLIGSM     0x1000  /*  Ing C. Olivetti & C., S.p.A.  */
#define  WAVE_FORMAT_OLIADPCM   0x1001  /*  Ing C. Olivetti & C., S.p.A.  */
#define  WAVE_FORMAT_OLICELP    0x1002  /*  Ing C. Olivetti & C., S.p.A.  */
#define  WAVE_FORMAT_OLISBC     0x1003  /*  Ing C. Olivetti & C., S.p.A.  */
#define  WAVE_FORMAT_OLIOPR     0x1004  /*  Ing C. Olivetti & C., S.p.A.  */


#define MCIERR_BASE            256
#define MCIERR_INTERNAL        (MCIERR_BASE + 21)

#define DCB_NULL		0x0000

#define WM_USER             0x0400


/**************************************************************
 * 		Linux MMSYSTEM Internals & Sample Audio Drivers
 */

#define DRVM_INIT             100
#define WODM_INIT             DRVM_INIT
#define WIDM_INIT             DRVM_INIT
#define MODM_INIT             DRVM_INIT
#define MIDM_INIT             DRVM_INIT
#define AUXM_INIT             DRVM_INIT

#define WODM_GETNUMDEVS       3
#define WODM_GETDEVCAPS       4
#define WODM_OPEN             5
#define WODM_CLOSE            6
#define WODM_PREPARE          7
#define WODM_UNPREPARE        8
#define WODM_WRITE            9
#define WODM_PAUSE            10
#define WODM_RESTART          11
#define WODM_RESET            12 
#define WODM_GETPOS           13
#define WODM_GETPITCH         14
#define WODM_SETPITCH         15
#define WODM_GETVOLUME        16
#define WODM_SETVOLUME        17
#define WODM_GETPLAYBACKRATE  18
#define WODM_SETPLAYBACKRATE  19
#define WODM_BREAKLOOP        20
#define WODM_STOP             21

#define WIDM_GETNUMDEVS  50
#define WIDM_GETDEVCAPS  51
#define WIDM_OPEN        52
#define WIDM_CLOSE       53
#define WIDM_PREPARE     54
#define WIDM_UNPREPARE   55
#define WIDM_ADDBUFFER   56
#define WIDM_START       57
#define WIDM_STOP        58
#define WIDM_RESET       59
#define WIDM_GETPOS      60
#define WIDM_PAUSE       61

#define MODM_GETNUMDEVS		1
#define MODM_GETDEVCAPS		2
#define MODM_OPEN			3
#define MODM_CLOSE			4
#define MODM_PREPARE		5
#define MODM_UNPREPARE		6
#define MODM_DATA			7
#define MODM_LONGDATA		8
#define MODM_RESET          9
#define MODM_GETVOLUME		10
#define MODM_SETVOLUME		11
#define MODM_CACHEPATCHES		12      
#define MODM_CACHEDRUMPATCHES	13     

#define MIDM_GETNUMDEVS  53
#define MIDM_GETDEVCAPS  54
#define MIDM_OPEN        55
#define MIDM_CLOSE       56
#define MIDM_PREPARE     57
#define MIDM_UNPREPARE   58
#define MIDM_ADDBUFFER   59
#define MIDM_START       60
#define MIDM_STOP        61
#define MIDM_RESET       62

#define AUXDM_GETNUMDEVS    3
#define AUXDM_GETDEVCAPS    4
#define AUXDM_GETVOLUME     5
#define AUXDM_SETVOLUME     6

#define	MXDM_GETNUMDEVS		1
#define	MXDM_GETDEVCAPS		2
#define	MXDM_OPEN		3
#define	MXDM_CLOSE		4
#define	MXDM_GETLINEINFO	5
#define	MXDM_GETLINECONTROLS	6
#define	MXDM_GETCONTROLDETAILS	7
#define	MXDM_SETCONTROLDETAILS	8

#define CALLBACK_TYPEMASK   0x00070000l    /* callback type mask */


#define DCB_NULL		0x0000
#define DCB_WINDOW		0x0001			/* dwCallback is a HWND */
#define DCB_TASK		0x0002			/* dwCallback is a HTASK */
#define DCB_FUNCTION	0x0003			/* dwCallback is a FARPROC */


#define USER_HEAP_LIN_ADDR(handle) (handle)
#define SEGPTR_NEW(type) malloc(sizeof(type))
#define SEGPTR_FREE(ptr) free(ptr)
#define SEGPTR_GET(ptr) (ptr)

/**************************************************
 * api function prototypes:
 */

UINT16 waveOutGetNumDevs();

UINT32 waveOutGetDevCaps(UINT32 uDeviceID, LPWAVEOUTCAPS lpCaps,
                                UINT32 uSize);

UINT16 waveOutGetErrorText(UINT16 uError, LPSTR lpText, UINT16 uSize);

UINT16 waveOutOpen(LPHWAVEOUT lphWaveOut, UINT16 uDeviceID,
                            const LPWAVEFORMATEX lpFormat, DWORD dwCallback,
                            DWORD dwInstance, DWORD dwFlags);

UINT16 waveOutClose(HWAVEOUT hWaveOut);

UINT32 waveOutPrepareHeader(HWAVEOUT hWaveOut,
			    WAVEHDR * lpWaveOutHdr, UINT32 uSize);

UINT32 waveOutUnprepareHeader(HWAVEOUT hWaveOut,
			      WAVEHDR * lpWaveOutHdr, UINT32 uSize);

UINT32 waveOutWrite(HWAVEOUT hWaveOut, WAVEHDR * lpWaveOutHdr,
		    UINT32 uSize);

UINT16 waveOutPause(HWAVEOUT hWaveOut);

UINT16 waveOutRestart(HWAVEOUT hWaveOut);

UINT16 waveOutReset(HWAVEOUT hWaveOut);

UINT16 waveOutGetVolume(HWAVEOUT hWaveOut, LPDWORD pdwVolume );

UINT16 waveOutSetVolume(HWAVEOUT hWaveOut, DWORD dwVolume );

UINT16 waveOutGetPosition(HWAVEOUT hWaveOut,LPMMTIME lpTime,
			  UINT16 uSize);

UINT16 waveOutBreakLoop(HWAVEOUT hWaveOut);

UINT32 waveOutGetID(HWAVEOUT hWaveOut, UINT32 * lpuDeviceID);

DWORD OSS_wodMessage(UINT16 wDevID, UINT wMsg, DWORD dwUser,
                 DWORD dwParam1, DWORD dwParam2);


typedef LONG LRESULT;

typedef LRESULT (CALLBACK *FARPROC16)();

typedef struct
{
  LRESULT (CALLBACK *CallDriverCallback)( FARPROC16, HANDLE16, UINT16,
					  DWORD, LPARAM, LPARAM );
} CALLBACKS_TABLE;

extern const CALLBACKS_TABLE *Callbacks;

#define DCB_NULL        0x0000
#define DCB_WINDOW      0x0001                  /* dwCallback is a HWND */
#define DCB_TASK        0x0002                  /* dwCallback is a HTASK */
#define DCB_FUNCTION    0x0003           /* dwCallback is a FARPROC */
#define DCB_FUNC32      0x0007             /* (ugly hack) 32-bit FARPROC */
#define DCB_TYPEMASK    0x0007

BOOL16 DriverCallback(DWORD dwCallBack, UINT16 uFlags, HANDLE16 hDev, 
                             WORD wMsg, DWORD dwUser, DWORD dwParam1, 
			     DWORD dwParam2);
     

#undef _DEBUG

#endif
#endif

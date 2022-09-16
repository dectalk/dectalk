/*
 * Portions:
 * Copyright 1993 Martin Ayotte
 */        
/************************************************************
 *
 *                           Copyright (c)
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved.    
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
 *    File Name:		linux_audio.c
 *    Author:			Eric Thompson
 *    Creation Date:	09/03/1998
 *
 *    Functionality:	fake the WIN32/OSF audio API stuff that is needed
 *                      for playaud.c
 *
 ***********************************************************************
 *    Revision History:                                        
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * -01  ETT     09/03/1998  spawned forth via the merky depths of....
 * 000  ETT     09/10/1998  crunch crunch crunch... get it to work
 * 001  ETT     10/06/1998  added the different ioctls for itsy (__arm__)
 * 002	MGS		08/22/1999	Removed 44100 kHz for __arm__ (doesn't work)
 *							removed different ioctls for itsy
 **********************************************************************/

/* FIXME: GetNumDevs, GetVolume, etc. 
 */

#ifdef __linux__
#ifndef LINUX_AUDIO_C
#define LINUX_AUDIO_C

//#define _DEBUG

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <sys/soundcard.h>
#include <sys/types.h>
#include <sys/stat.h> 
#ifdef __arm__
#include <linux/audio-sa1100.h>
#endif
#include "linux_audio.h"

#define EMULATE_SB16

#ifdef __arm__OLD
#define SOUND_DEV "/dev/audio"
#else
#define SOUND_DEV "/dev/dsp"
#endif

#define MIXER_DEV "/dev/mixer"

#define IOCTL(a,b,c)		((-1==ioctl(a,b,&c))&&(perror("ioctl:"#b":"#c),0))
#define MAX_WAVOUTDRV 	(1)
#define MAX_WAVINDRV    (1)
#define MAX_MCIWAVDRV   (1)

typedef struct {
	int		unixdev;
	int		state;
	DWORD		bufsize;	/* OpenSound '/dev/dsp' give us that size */
	WAVEOPENDESC	waveDesc;
	WORD		wFlags;
	PCMWAVEFORMAT	Format;
	LPWAVEHDR	lpQueueHdr;
	DWORD		dwTotalRecorded;
} LINUX_WAVEIN;

typedef struct {
	int		unixdev;
	int		state;
	DWORD		bufsize;
	WAVEOPENDESC	waveDesc;
	WORD		wFlags;
	PCMWAVEFORMAT	Format;
	LPWAVEHDR	lpQueueHdr;
	DWORD		dwTotalPlayed;
} LINUX_WAVEOUT;

static LINUX_WAVEOUT    WOutDev[MAX_WAVOUTDRV];
static LINUX_WAVEIN     WInDev[MAX_WAVOUTDRV];


 /* Unfortunately, ms-windoze uses wDevID of zero to indicate
 * errors.  Now, multimedia drivers must pass the wDevID through
 * MMSYSTEM_DevIDToIndex to get an index in that range.  An
 * aribtrary value, MMSYSTEM_MAGIC is added to the wDevID seen
 * by the windows programs.
 */

#define MMSYSTEM_MAGIC 0x0F00

/**************************************************************************
 * 				MMSYSTEM_DevIDToIndex	[internal]
 */
int MMSYSTEM_DevIDToIndex(UINT16 wDevID) {
	return wDevID - MMSYSTEM_MAGIC;
}

/**************************************************************************
 * 				MMSYSTEM_FirstDevId	[internal]
 */
UINT16 MMSYSTEM_FirstDevID(void)
{
	return MMSYSTEM_MAGIC;
}

/**************************************************************************
 * 				MMSYSTEM_NextDevId	[internal]
 */
UINT16 MMSYSTEM_NextDevID(UINT16 wDevID) {
	return wDevID + 1;
}

/**************************************************************************
 * 			WAVE_NotifyClient			[internal]
 */
static DWORD WAVE_NotifyClient(UINT16 wDevID, WORD wMsg, 
			       DWORD dwParam1, DWORD dwParam2)
{
  TRACE("WAVE_NotifyClient: wDevID = %04X wMsg = %d dwParm1 = %04lX dwParam2 = %04lX\n",wDevID, wMsg, dwParam1, dwParam2);

	switch (wMsg) {
	case WOM_OPEN:
	case WOM_CLOSE:
	case WOM_DONE:
	  if (wDevID > MAX_WAVOUTDRV) return MCIERR_INTERNAL;
	  
	  //	  fprintf(stderr,"WOutDev[wDevID].wFlags = ");
	  switch(WOutDev[wDevID].wFlags & DCB_TYPEMASK) {
	  case DCB_NULL:
	    //  fprintf(stderr,"DCB_NULL\n");
	    break;
	  case  DCB_WINDOW:
	    //  fprintf(stderr," DCB_WINDOW\n");
	    break;
	  case DCB_TASK:
	    // fprintf(stderr,"DCB_TASK\n");
	    break;
	  case DCB_FUNCTION:
	    // fprintf(stderr,"DCB_FUNCTION\n");
	    break;
	  case DCB_FUNC32:
	    // fprintf(stderr,"DCB_FUNC32\n");
	    break;
	  }
	  
	  if (WOutDev[wDevID].wFlags != DCB_NULL 
	      && !DriverCallback(WOutDev[wDevID].waveDesc.dwCallBack, 
				 WOutDev[wDevID].wFlags, 
				 WOutDev[wDevID].waveDesc.hWave, 
				 wMsg, 
				 WOutDev[wDevID].waveDesc.dwInstance, 
				 dwParam1, 
				 dwParam2)) {
	    WARN("WAVE_NotifyClient can't notify client !\n");
	    return MMSYSERR_NOERROR;
	  }
	  break;
	  
	case WIM_OPEN:
	case WIM_CLOSE:
	case WIM_DATA:
	  if (wDevID > MAX_WAVINDRV) return MCIERR_INTERNAL;
	  
	  //	  if (WInDev[wDevID].wFlags != DCB_NULL && !DriverCallback(
	  //	WInDev[wDevID].waveDesc.dwCallBack, WInDev[wDevID].wFlags, 
	  //	WInDev[wDevID].waveDesc.hWave, wMsg, 
	  //	WInDev[wDevID].waveDesc.dwInstance, dwParam1, dwParam2)) {
	  WARN("can't notify client !\n");
	  return MMSYSERR_NOERROR;
	  // }
	  break;
	}
        return 0;  //MMSYSERR_NOERROR
}


/**************************************************************************
 * 				waveOutGetNumDevs
 */
UINT16 waveOutGetNumDevs()
{
  UINT16	count = 0;
#ifdef _DEBUG
  fprintf(stderr,"Linux ONLY: waveOutGetNumDevs(VOID)\n");
#endif
  count += wodMessage( MMSYSTEM_FirstDevID(), WODM_GETNUMDEVS, 0L, 0L, 0L);
#ifdef _DEBUG
  fprintf(stderr, "waveOutGetNumDevs return %u \n", count);
#endif
  return count;
}

/**************************************************************************
 * 				waveOutGetDevCaps
 */
UINT32 waveOutGetDevCaps(UINT32 uDeviceID, LPWAVEOUTCAPS lpCaps,
                                UINT32 uSize)
{
#ifdef _DEBUG
  fprintf(stderr,"Linux ONLY: waveOutGetDevCaps\n");
  //fprintf(stderr,"uDeviceID = %i\n",uDeviceID);
#endif  

	if (uDeviceID > waveOutGetNumDevs() - 1) return MMSYSERR_BADDEVICEID;
	/* FIXME: do we have a wave mapper ? */
	if (uDeviceID == (UINT16)WAVE_MAPPER) return MMSYSERR_BADDEVICEID; 
	return wodMessage(uDeviceID, WODM_GETDEVCAPS, 0L, (DWORD)lpCaps, uSize);
	
}

/**************************************************************************
 * 				waveGetErrorText 
 */
static UINT16 waveGetErrorText(UINT16 uError, LPSTR lpText, UINT16 uSize)
{
	LPSTR	msgptr;
	if ((lpText == NULL) || (uSize < 1)) return(FALSE);
	lpText[0] = '\0';
	switch(uError) {
		case MMSYSERR_NOERROR:
			msgptr = "The specified command was carried out.";
			break;
		case MMSYSERR_ERROR:
			msgptr = "Undefined external error.";
			break;
		case MMSYSERR_BADDEVICEID:
			msgptr = "A device ID has been used that is out of range for your system.";
			break;
		case MMSYSERR_NOTENABLED:
			msgptr = "The driver was not enabled.";
			break;
		case MMSYSERR_ALLOCATED:
			msgptr = "The specified device is already in use. Wait until it is free, and then try again.";
			break;
		case MMSYSERR_INVALHANDLE:
			msgptr = "The specified device handle is invalid.";
			break;
		case MMSYSERR_NODRIVER:
			msgptr = "There is no driver installed on your system !\n";
			break;
		case MMSYSERR_NOMEM:
			msgptr = "Not enough memory available for this task. Quit one or more applications to increase available memory, and then try again.";
			break;
		case MMSYSERR_NOTSUPPORTED:
			msgptr = "This function is not supported. Use the Capabilities function to determine which functions and messages the driver supports.";
			break;
		case MMSYSERR_BADERRNUM:
			msgptr = "An error number was specified that is not defined in the system.";
			break;
		case MMSYSERR_INVALFLAG:
			msgptr = "An invalid flag was passed to a system function.";
			break;
		case MMSYSERR_INVALPARAM:
			msgptr = "An invalid parameter was passed to a system function.";
			break;
		case WAVERR_BADFORMAT:
			msgptr = "The specified format is not supported or cannot be translated. Use the Capabilities function to determine the supported formats";
			break;
		case WAVERR_STILLPLAYING:
			msgptr = "Cannot perform this operation while media data is still playing. Reset the device, or wait until the data is finished playing.";
			break;
		case WAVERR_UNPREPARED:
			msgptr = "The wave header was not prepared. Use the Prepare function to prepare the header, and then try again.";
			break;
		case WAVERR_SYNC:
			msgptr = "Cannot open the device without using the WAVE_ALLOWSYNC flag. Use the flag, and then try again.";
			break;
		default:
			msgptr = "Unknown MMSYSTEM Error !\n";
			break;
		}
	strncpy(lpText, msgptr, uSize);
	return TRUE;
}

/**************************************************************************
 * 				waveOutGetErrorText
 */
UINT16 waveOutGetErrorText(UINT16 uError, LPSTR lpText, UINT16 uSize)
{
	return(waveGetErrorText(uError, lpText, uSize));
}


/**************************************************************************
 *			waveOutOpen			[MMSYSTEM.404]
 */
UINT16 waveOutOpen(LPHWAVEOUT lphWaveOut, UINT16 uDeviceID,
                            const LPWAVEFORMATEX lpFormat, DWORD dwCallback,
                            DWORD dwInstance, DWORD dwFlags)
{
	HWAVEOUT	hWaveOut;
	LPWAVEOPENDESC	lpDesc;
	DWORD		dwRet = 0;
	BOOL32		bMapperFlg = FALSE;

#ifdef _DEBUG
	fprintf(stderr,"Linux ONLY: waveOutOpen\n");
	if (dwFlags & WAVE_FORMAT_QUERY)
	  fprintf(stderr, "WAVE_FORMAT_QUERY requested !\n");
#endif
	if (uDeviceID == (UINT16)WAVE_MAPPER) {
#ifdef _DEBUG		
	  fprintf(stderr, "WAVE_MAPPER mode requested !\n");
#endif		
	  bMapperFlg = TRUE;
	  uDeviceID = 0;
	}
	if (lpFormat == NULL) return WAVERR_BADFORMAT;

	hWaveOut = (int) malloc(sizeof(WAVEOPENDESC));
	if (lphWaveOut != NULL) *lphWaveOut = hWaveOut;
	lpDesc = (LPWAVEOPENDESC) hWaveOut;
	if (lpDesc == NULL) return MMSYSERR_NOMEM;
	lpDesc->hWave = hWaveOut;
	lpDesc->lpFormat = (LPWAVEFORMAT)lpFormat;  /* should the struct be copied iso pointer? */
	lpDesc->dwCallBack = dwCallback;
	lpDesc->dwInstance = dwInstance;
	
	if (uDeviceID >= MAXWAVEDRIVERS)
		uDeviceID = 0;
	while(uDeviceID < MAXWAVEDRIVERS) {
	  dwRet = wodMessage(uDeviceID, WODM_OPEN, 
			     lpDesc->dwInstance, (DWORD)lpDesc, dwFlags);
	  if (dwRet == MMSYSERR_NOERROR) break;
	  if (!bMapperFlg) break;
	  uDeviceID++;
#ifdef _DEBUG
	  fprintf(stderr, "WAVE_MAPPER mode ! try next driver...\n");
#endif		
	}
	lpDesc->uDeviceID = uDeviceID;  /* save physical Device ID */
	if (dwFlags & WAVE_FORMAT_QUERY) {
#ifdef _DEBUG
	  fprintf(stderr, "End of WAVE_FORMAT_QUERY !\n");
#endif	
	  dwRet = waveOutClose(hWaveOut);
	}
	return dwRet;
}


/**************************************************************************
 * 				waveOutClose	 
 */
UINT16 waveOutClose(HWAVEOUT hWaveOut)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr,"Linux ONLY: waveOutClose");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif
	lpDesc = (LPWAVEOPENDESC) hWaveOut;
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_CLOSE, lpDesc->dwInstance, 0L, 0L);
}

/**************************************************************************
 * 				waveOutPrepareHeader
 */
UINT32 waveOutPrepareHeader(HWAVEOUT hWaveOut,
			    WAVEHDR * lpWaveOutHdr, UINT32 uSize)
{
	LPWAVEOPENDESC	lpDesc;
	
#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutPrepareHeader");
	fprintf(stderr, "(%04X, %p, %u);\n",
		hWaveOut, lpWaveOutHdr, uSize);
#endif
	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_PREPARE, lpDesc->dwInstance, 
			   (DWORD)lpWaveOutHdr,uSize);
}


/**************************************************************************
 * 				waveOutUnprepareHeader
 */
UINT32 waveOutUnprepareHeader(HWAVEOUT hWaveOut,
			      WAVEHDR * lpWaveOutHdr, UINT32 uSize)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutUnprepareHeader");
	fprintf(stderr, "(%04X, %p, %u);\n", 
		hWaveOut, lpWaveOutHdr, uSize);
#endif
	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage(lpDesc->uDeviceID,WODM_UNPREPARE,lpDesc->dwInstance, 
					(DWORD)lpWaveOutHdr, uSize);
}


/**************************************************************************
 * 				waveOutWrite
 */
UINT32 waveOutWrite(HWAVEOUT hWaveOut, WAVEHDR * lpWaveOutHdr,
		    UINT32 uSize)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutWrite");
	fprintf(stderr, "(%04X, %p, %u);\n", hWaveOut, lpWaveOutHdr, uSize);
#endif	

	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	lpWaveOutHdr->reserved = (DWORD)lpWaveOutHdr->lpData;
	return wodMessage( lpDesc->uDeviceID, WODM_WRITE, lpDesc->dwInstance, (DWORD)lpWaveOutHdr, uSize);
}

/**************************************************************************
 * 				waveOutPause
 */
UINT16 waveOutPause(HWAVEOUT hWaveOut)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutPause");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif	

	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_PAUSE, lpDesc->dwInstance, 0L, 0L);
}


/**************************************************************************
 * 				waveOutRestart
 */
UINT16 waveOutRestart(HWAVEOUT hWaveOut)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutRestart");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif	
	
	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_RESTART, lpDesc->dwInstance, 0L, 0L);
}


/**************************************************************************
 * 				waveOutReset
 */
UINT16 waveOutReset(HWAVEOUT hWaveOut)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutReset");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif

	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_RESET, lpDesc->dwInstance, 0L, 0L);
}

/**************************************************************************
 * 				waveOutGetVolume
 */
UINT16 waveOutGetVolume(HWAVEOUT hWaveOut, LPDWORD pdwVolume )
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutGetVolume");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif

	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_GETVOLUME, lpDesc->dwInstance, 
			   (int)pdwVolume, 0L);
}

/**************************************************************************
 * 				waveOutSetVolume
 */
UINT16 waveOutSetVolume(HWAVEOUT hWaveOut, DWORD dwVolume )
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutSetVolume");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif

	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_SETVOLUME, lpDesc->dwInstance, 
			   dwVolume, 0L);
}

/**************************************************************************
 * 				waveOutGetPosition
 */
UINT16 waveOutGetPosition(HWAVEOUT hWaveOut,LPMMTIME lpTime,
			  UINT16 uSize)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutGetPosition");
	fprintf(stderr, "(%04X, %p, %u);\n", hWaveOut, lpTime, uSize);	
#endif
	
	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return wodMessage( lpDesc->uDeviceID, WODM_GETPOS, lpDesc->dwInstance, 
							(DWORD)lpTime, (DWORD)uSize);
}

#define WAVEOUT_SHORTCUT_1(xx,XX,atype) \
        UINT16 waveOut##xx##(HWAVEOUT hWaveOut, atype x)       \
{									\
	LPWAVEOPENDESC	lpDesc;                                         \
	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);		\
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;		\
	return wodMessage(lpDesc->uDeviceID, WODM_##XX, lpDesc->dwInstance,\
			  (DWORD)x, 0L);				\
}

WAVEOUT_SHORTCUT_1(GetPitch,GETPITCH,DWORD*)
WAVEOUT_SHORTCUT_1(SetPitch,SETPITCH,DWORD)
WAVEOUT_SHORTCUT_1(GetPlaybackRate,GETPLAYBACKRATE,DWORD*)
WAVEOUT_SHORTCUT_1(SetPlaybackRate,SETPLAYBACKRATE,DWORD)

#define WAVEOUT_SHORTCUT_2(xx,XX,atype) \
        UINT16 waveOut##xx##16(UINT16 devid, atype x)		\
{									\
	return wodMessage(devid, WODM_##XX, 0L,	(DWORD)x, 0L);		\
}
	

WAVEOUT_SHORTCUT_2(GetVolume,GETVOLUME,DWORD*)
WAVEOUT_SHORTCUT_2(SetVolume,SETVOLUME,DWORD)


/**************************************************************************
 * 				waveOutBreakLoop 
 */
UINT16 waveOutBreakLoop(HWAVEOUT hWaveOut)
{
	return MMSYSERR_INVALHANDLE;
}

/**************************************************************************
 * 				waveOutGetID  
 */
UINT32 waveOutGetID(HWAVEOUT hWaveOut, UINT32 * lpuDeviceID)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutGetID");
	fprintf(stderr, "(%04X, %p);\n", hWaveOut, lpuDeviceID);
#endif
	
	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	if (lpuDeviceID == NULL) return MMSYSERR_INVALHANDLE;
	*lpuDeviceID = lpDesc->uDeviceID;
        return 0;
}


/********************************************************
 *   wodMessage functions:
 */

/**************************************************************************
 * 			wodGetDevCaps				[internal]
 */
static DWORD wodGetDevCaps(WORD wDevID, LPWAVEOUTCAPS lpCaps, DWORD dwSize)
{
	int 	audio;
	int	smplrate;
	int	samplesize = 16;
	int	dsp_stereo = 1;
	int	bytespersmpl;

	TRACE("wodGetDevCaps(%u, %p, %lu);\n", wDevID, lpCaps, dwSize);
	if (lpCaps == NULL) 
	  {
	    WARN(stderr,"lpCaps == NULL!\n");
	    return MMSYSERR_NOTENABLED;
	  }
	if (access(SOUND_DEV,F_OK) != 0)
	  {
#ifdef _DEBUG
	    perror("wodGetDevCaps");
#endif
	    return MMSYSERR_NOTENABLED;
	  }

	audio = open (SOUND_DEV, O_WRONLY, 0);
	if (audio == -1) 
	  {
	    WARN(stderr,"already open\n");
	    return MMSYSERR_ALLOCATED ;
	  }
#ifdef EMULATE_SB16
	lpCaps->wMid = 0x0002;
	lpCaps->wPid = 0x0104;
	strcpy(lpCaps->szPname, "SB16 Wave Out");
#else
	lpCaps->wMid = 0x00FF; 	/* Manufac ID */
	lpCaps->wPid = 0x0001; 	/* Product ID */
	strcpy(lpCaps->szPname, "OpenSoundSystem WAVOUT Driver");
#endif
	lpCaps->vDriverVersion = 0x0100;
	lpCaps->dwFormats = 0x00000000;
	lpCaps->dwSupport = WAVECAPS_VOLUME;

	/**************************************
	 * First bytespersampl, then stereo
	 * same as SNDCTL_DSP_SETFMT */
#ifdef __arm__OLD
	samplesize = AUDIO_16BIT;
	bytespersmpl = (ioctl(audio, AUDIO_SET_FORMAT, samplesize) != 0) ? 1 : 2;
#else
	bytespersmpl = (IOCTL(audio, SNDCTL_DSP_SAMPLESIZE, samplesize) != 0) ? 1 : 2;
#endif
#ifdef __arm__OLD
	dsp_stereo = AUDIO_STEREO;
	lpCaps->wChannels = (ioctl(audio, AUDIO_SET_FORMAT, dsp_stereo) != 0)
	  ? 1 : 2;
#else
	lpCaps->wChannels = (IOCTL(audio, SNDCTL_DSP_STEREO, dsp_stereo) != 0)
	  ? 1 : 2;
#endif 

	if (lpCaps->wChannels > 1) lpCaps->dwSupport |= WAVECAPS_LRVOLUME;

#ifndef __arm__ //currently not supported
	smplrate = 44100;
#ifdef __arm__OLD
	if (ioctl(audio, AUDIO_SET_RATE, smplrate) == 0) {
#else
	if (IOCTL(audio, SNDCTL_DSP_SPEED, smplrate) == 0) {
#endif
		lpCaps->dwFormats |= WAVE_FORMAT_4M08;
		if (lpCaps->wChannels > 1)
			lpCaps->dwFormats |= WAVE_FORMAT_4S08;
		if (bytespersmpl > 1) {
			lpCaps->dwFormats |= WAVE_FORMAT_4M16;
			if (lpCaps->wChannels > 1)
				lpCaps->dwFormats |= WAVE_FORMAT_4S16;
		}
	}
#endif //#ifndef __arm__ // currently not supported

	smplrate = 22050;
#ifdef __arm__OLD
	if (ioctl(audio, AUDIO_SET_RATE, smplrate) == 0) {
#else
	if (IOCTL(audio, SNDCTL_DSP_SPEED, smplrate) == 0) {
#endif	
	  lpCaps->dwFormats |= WAVE_FORMAT_2M08;
		if (lpCaps->wChannels > 1)
			lpCaps->dwFormats |= WAVE_FORMAT_2S08;
		if (bytespersmpl > 1) {
			lpCaps->dwFormats |= WAVE_FORMAT_2M16;
			if (lpCaps->wChannels > 1)
				lpCaps->dwFormats |= WAVE_FORMAT_2S16;
		}
	}
	smplrate = 11025;
#ifdef __arm__OLD
	if (ioctl(audio, AUDIO_SET_RATE, smplrate) == 0) {
#else	
	if (IOCTL(audio, SNDCTL_DSP_SPEED, smplrate) == 0) {
#endif		
	    lpCaps->dwFormats |= WAVE_FORMAT_1M08;
		if (lpCaps->wChannels > 1)
			lpCaps->dwFormats |= WAVE_FORMAT_1S08;
		if (bytespersmpl > 1) {
			lpCaps->dwFormats |= WAVE_FORMAT_1M16;
			if (lpCaps->wChannels > 1)
				lpCaps->dwFormats |= WAVE_FORMAT_1S16;
		}
	}
	close(audio);
	TRACE("dwFormats = %08lX\n", lpCaps->dwFormats);
	return MMSYSERR_NOERROR;
}


/**************************************************************************
 * 				wodOpen				[internal]
 */
static DWORD wodOpen(WORD wDevID, LPWAVEOPENDESC lpDesc, DWORD dwFlags)
{
	int 	 audio,abuf_size,smplrate,samplesize,dsp_stereo;
	LPWAVEFORMAT	lpFormat;

	TRACE("(%u, %p, %08lX);\n", wDevID, lpDesc, dwFlags);
	if (lpDesc == NULL) {
	  WARN("Invalid Parameter !\n");
		return MMSYSERR_INVALPARAM;
	}

	if (wDevID >= MAX_WAVOUTDRV) {
	  TRACE("MAX_WAVOUTDRV reached !\n");
		return MMSYSERR_ALLOCATED;
	}
	WOutDev[wDevID].unixdev = 0;
	if (access(SOUND_DEV,0) != 0) return MMSYSERR_NOTENABLED;
	audio = open (SOUND_DEV, O_WRONLY, 0);
	if (audio == -1) {
		WARN("can't open !\n");
		return MMSYSERR_ALLOCATED ;
	}
#ifdef __arm__OLD
	abuf_size = 1024;  /* should be between 1024 and 65536 */
#else
	IOCTL(audio, SNDCTL_DSP_GETBLKSIZE, abuf_size);
	if (abuf_size < 1024 || abuf_size > 65536) {
		if (abuf_size == -1)
			WARN("IOCTL can't 'SNDCTL_DSP_GETBLKSIZE' !\n");
		else
			WARN("SNDCTL_DSP_GETBLKSIZE Invalid bufsize !\n");
		return MMSYSERR_NOTENABLED;
	}
#endif
	WOutDev[wDevID].wFlags = HIWORD(dwFlags & CALLBACK_TYPEMASK);
	switch(WOutDev[wDevID].wFlags) {
	case DCB_NULL:
		TRACE("CALLBACK_NULL !\n");
		break;
	case DCB_WINDOW:
		TRACE("CALLBACK_WINDOW !\n");
		break;
	case DCB_TASK:
		TRACE("CALLBACK_TASK !\n");
		break;
	case DCB_FUNCTION:
		TRACE("CALLBACK_FUNCTION requested !\n");
		break;
	}
	WOutDev[wDevID].lpQueueHdr = NULL;
	WOutDev[wDevID].unixdev = audio;
	WOutDev[wDevID].dwTotalPlayed = 0;
	WOutDev[wDevID].bufsize = abuf_size;
	/* FIXME: copy lpFormat too? */
	memcpy(&WOutDev[wDevID].waveDesc, lpDesc, sizeof(WAVEOPENDESC));
	TRACE("lpDesc->lpFormat = %p\n",lpDesc->lpFormat);
        lpFormat = lpDesc->lpFormat; 
	TRACE("lpFormat = %p\n",lpFormat);
	if (lpFormat->wFormatTag != WAVE_FORMAT_PCM) {
		WARN("Bad format %04X !\n",
			     lpFormat->wFormatTag);
		WARN("Bad nChannels %d !\n",
			     lpFormat->nChannels);
		WARN("Bad nSamplesPerSec %ld !\n",
			     lpFormat->nSamplesPerSec);
		return WAVERR_BADFORMAT;
	}
	memcpy(&WOutDev[wDevID].Format, lpFormat, sizeof(PCMWAVEFORMAT));
	if (WOutDev[wDevID].Format.wf.nChannels == 0) return WAVERR_BADFORMAT;
	if (WOutDev[wDevID].Format.wf.nSamplesPerSec == 0) return WAVERR_BADFORMAT;
	TRACE("wBitsPerSample=%u !\n",
		     WOutDev[wDevID].Format.wBitsPerSample);
	if (WOutDev[wDevID].Format.wBitsPerSample == 0) {
		WOutDev[wDevID].Format.wBitsPerSample = 8 *
		(WOutDev[wDevID].Format.wf.nAvgBytesPerSec /
		WOutDev[wDevID].Format.wf.nSamplesPerSec) /
		WOutDev[wDevID].Format.wf.nChannels;
	}
	samplesize = WOutDev[wDevID].Format.wBitsPerSample;
	smplrate = WOutDev[wDevID].Format.wf.nSamplesPerSec;
	dsp_stereo = (WOutDev[wDevID].Format.wf.nChannels > 1) ? TRUE : FALSE;

#ifdef __arm__OLD
	if (samplesize == 16)
	  {
	    if (dsp_stereo)
	      {
		samplesize = AUDIO_16BIT_STEREO;
	      }
	    else
	      {
		samplesize = AUDIO_16BIT_MONO;
	      }
	  }
	else
	  {
	    if (dsp_stereo)
	      {
		samplesize = AUDIO_8BIT_STEREO;
	      }
	    else
	      {
		samplesize = AUDIO_8BIT_MONO;
	      }	  
	  }
	ioctl(audio, AUDIO_SET_FORMAT, samplesize);
	
	ioctl(audio, AUDIO_SET_RATE, smplrate);
#else
/* First size and stereo then samplerate */
	IOCTL(audio, SNDCTL_DSP_SAMPLESIZE, samplesize);
	IOCTL(audio, SNDCTL_DSP_STEREO, dsp_stereo);
#ifdef __arm__OLD
	IOCTL(audio, AUDIO_SET_RATE, smplrate);
#else
	IOCTL(audio, SNDCTL_DSP_SPEED, smplrate);
#endif
#endif
	TRACE("wBitsPerSample=%u !\n",
		     WOutDev[wDevID].Format.wBitsPerSample);
	TRACE("nAvgBytesPerSec=%lu !\n",
		     WOutDev[wDevID].Format.wf.nAvgBytesPerSec);
	TRACE("nSamplesPerSec=%lu !\n",
		     WOutDev[wDevID].Format.wf.nSamplesPerSec);
	TRACE("nChannels=%u !\n",
		     WOutDev[wDevID].Format.wf.nChannels);
	if (WAVE_NotifyClient(wDevID, WOM_OPEN, 0L, 0L) != MMSYSERR_NOERROR) {
		WARN("can't notify client !\n");
		return MMSYSERR_INVALPARAM;
	}
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodClose			[internal]
 */
static DWORD wodClose(WORD wDevID)
{
	TRACE("(%u);\n", wDevID);
	if (wDevID > MAX_WAVOUTDRV) return MMSYSERR_INVALPARAM;
	if (WOutDev[wDevID].unixdev == 0) {
		WARN("can't close !\n");
		return MMSYSERR_NOTENABLED;
	}
	if (WOutDev[wDevID].lpQueueHdr != NULL) {
	        WARN("still buffers open !\n");
		/* Don't care. Who needs those buffers anyway */
		/*return WAVERR_STILLPLAYING; */
	}
	close(WOutDev[wDevID].unixdev);
	WOutDev[wDevID].unixdev = 0;
	WOutDev[wDevID].bufsize = 0;
	WOutDev[wDevID].lpQueueHdr = NULL;
	if (WAVE_NotifyClient(wDevID, WOM_CLOSE, 0L, 0L) != MMSYSERR_NOERROR) {
		WARN("can't notify client !\n");
		return MMSYSERR_INVALPARAM;
	}
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodWrite			[internal]
 * FIXME: this should _APPEND_ the lpWaveHdr to the output queue of the
 * device, and initiate async playing.
 */
static DWORD wodWrite(WORD wDevID, LPWAVEHDR lpWaveHdr, DWORD dwSize)
{
	int		count;
	LPSTR	        lpData;
	LPWAVEHDR	xwavehdr=NULL;

	TRACE("(%u, %p, %08lX);\n", wDevID, lpWaveHdr, dwSize);
	if (WOutDev[wDevID].unixdev == 0) {
        WARN("can't play !\n");
		return MMSYSERR_NOTENABLED;
	}
	if (lpWaveHdr->lpData == NULL) return WAVERR_UNPREPARED;
	if (!(lpWaveHdr->dwFlags & WHDR_PREPARED)) return WAVERR_UNPREPARED;
	if (lpWaveHdr->dwFlags & WHDR_INQUEUE) return WAVERR_STILLPLAYING;
	lpWaveHdr->dwFlags &= ~WHDR_DONE;
	lpWaveHdr->dwFlags |= WHDR_INQUEUE;
	TRACE("dwBufferLength %lu !\n", 
		     lpWaveHdr->dwBufferLength);
	TRACE("WOutDev[%u].unixdev %u !\n", 
		     wDevID, WOutDev[wDevID].unixdev);
	lpData = lpWaveHdr->lpData;
	count = write (WOutDev[wDevID].unixdev, lpData, lpWaveHdr->dwBufferLength);
	TRACE("write returned count %u !\n",count);
	if (count != lpWaveHdr->dwBufferLength) {
		WARN(" error writing !\n");
		return MMSYSERR_NOTENABLED;
	}
	WOutDev[wDevID].dwTotalPlayed += count;
	lpWaveHdr->dwFlags &= ~WHDR_INQUEUE;
	lpWaveHdr->dwFlags |= WHDR_DONE;
	if ((DWORD)lpWaveHdr->lpData!=lpWaveHdr->reserved) {
		/* FIXME: what if it expects it's OWN lpwavehdr back? */
		xwavehdr = SEGPTR_NEW(WAVEHDR);
		memcpy(xwavehdr,lpWaveHdr,sizeof(WAVEHDR));
		xwavehdr->lpData = (LPBYTE)xwavehdr->reserved;
		if (WAVE_NotifyClient(wDevID, WOM_DONE, (DWORD)SEGPTR_GET(xwavehdr), count) != MMSYSERR_NOERROR) {
			WARN("can't notify client !\n");
			SEGPTR_FREE(xwavehdr);
			return MMSYSERR_INVALPARAM;
		}
		SEGPTR_FREE(xwavehdr);
	} else {
		if (WAVE_NotifyClient(wDevID, WOM_DONE, (DWORD)lpWaveHdr, count) != MMSYSERR_NOERROR) {
			WARN("can't notify client !\n");
			return MMSYSERR_INVALPARAM;
		}
	}
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodPrepare			[internal]
 */
static DWORD wodPrepare(WORD wDevID, LPWAVEHDR lpWaveHdr, DWORD dwSize)
{
	TRACE("(%u, %p, %08lX);\n", wDevID, lpWaveHdr, dwSize);
	if (WOutDev[wDevID].unixdev == 0) {
		WARN("can't prepare !\n");
		return MMSYSERR_NOTENABLED;
	}
	/* don't append to queue, wodWrite does that */
	// fixed the position information
	//WOutDev[wDevID].dwTotalPlayed = 0;
	if (lpWaveHdr->dwFlags & WHDR_INQUEUE)
		return WAVERR_STILLPLAYING;
	lpWaveHdr->dwFlags |= WHDR_PREPARED;
	lpWaveHdr->dwFlags &= ~WHDR_DONE;
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodUnprepare			[internal]
 */
static DWORD wodUnprepare(WORD wDevID, LPWAVEHDR lpWaveHdr, DWORD dwSize)
{
	TRACE("(%u, %p, %08lX);\n", wDevID, lpWaveHdr, dwSize);
	if (WOutDev[wDevID].unixdev == 0) {
		WARN("can't unprepare !\n");
		return MMSYSERR_NOTENABLED;
	}
	if (lpWaveHdr->dwFlags & WHDR_INQUEUE)
		return WAVERR_STILLPLAYING;
	
	lpWaveHdr->dwFlags &= ~WHDR_PREPARED;
	lpWaveHdr->dwFlags |= WHDR_DONE;
	TRACE("all headers unprepared !\n");
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 			wodRestart				[internal]
 */
static DWORD wodRestart(WORD wDevID)
{
	TRACE("(%u);\n", wDevID);
	if (WOutDev[wDevID].unixdev == 0) {
		WARN("can't restart !\n");
		return MMSYSERR_NOTENABLED;
	}
	/* FIXME: is NotifyClient with WOM_DONE right ? */
	/* FIXME: Myst crashes with this ... hmm -MM */
       	if (WAVE_NotifyClient(wDevID, WOM_DONE, 0L, 0L) != MMSYSERR_NOERROR) {
               	WARN("can't notify client !\n");
               	return MMSYSERR_INVALPARAM;
        }

	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 			wodReset				[internal]
 */
static DWORD wodReset(WORD wDevID)
{
	TRACE("(%u);\n", wDevID);
	if (WOutDev[wDevID].unixdev == 0) {
		WARN("can't reset !\n");
		return MMSYSERR_NOTENABLED;
		}
	return MMSYSERR_NOERROR;
}


/**************************************************************************
 * 				wodGetPosition			[internal]
 */
static DWORD wodGetPosition(WORD wDevID, LPMMTIME lpTime, DWORD uSize)
{
	int		time;
	TRACE("(%u, %p, %lu);\n", wDevID, lpTime, uSize);
	if (WOutDev[wDevID].unixdev == 0) {
		WARN("can't get position !\n");
		return MMSYSERR_NOTENABLED;
	}
	if (lpTime == NULL)	return MMSYSERR_INVALPARAM;
	TRACE("wType=%04X !\n", 
			lpTime->wType);
	TRACE("wBitsPerSample=%u\n",
			WOutDev[wDevID].Format.wBitsPerSample); 
	TRACE("nSamplesPerSec=%lu\n",
			WOutDev[wDevID].Format.wf.nSamplesPerSec); 
	TRACE("nChannels=%u\n",
			WOutDev[wDevID].Format.wf.nChannels); 
	TRACE("nAvgBytesPerSec=%lu\n",
			WOutDev[wDevID].Format.wf.nAvgBytesPerSec); 
	switch(lpTime->wType) {
	case TIME_BYTES:
		lpTime->u.cb = WOutDev[wDevID].dwTotalPlayed;
		TRACE("TIME_BYTES=%lu\n", lpTime->u.cb);
		break;
	case TIME_SAMPLES:
		TRACE("dwTotalPlayed=%lu\n", 
				WOutDev[wDevID].dwTotalPlayed);
		TRACE("wBitsPerSample=%u\n", 
				WOutDev[wDevID].Format.wBitsPerSample);
		lpTime->u.sample = WOutDev[wDevID].dwTotalPlayed * 8 /
					WOutDev[wDevID].Format.wBitsPerSample;
		TRACE("TIME_SAMPLES=%lu\n", lpTime->u.sample);
		break;
	case TIME_SMPTE:
		time = WOutDev[wDevID].dwTotalPlayed /
			(WOutDev[wDevID].Format.wf.nAvgBytesPerSec / 1000);
		lpTime->u.smpte.hour = time / 108000;
		time -= lpTime->u.smpte.hour * 108000;
		lpTime->u.smpte.min = time / 1800;
		time -= lpTime->u.smpte.min * 1800;
		lpTime->u.smpte.sec = time / 30;
		time -= lpTime->u.smpte.sec * 30;
		lpTime->u.smpte.frame = time;
		lpTime->u.smpte.fps = 30;
		TRACE("wodGetPosition // TIME_SMPTE=%02u:%02u:%02u:%02u\n",
		  lpTime->u.smpte.hour, lpTime->u.smpte.min,
		  lpTime->u.smpte.sec, lpTime->u.smpte.frame);
		break;
	default:
		FIXME("wodGetPosition() format %d not supported ! use TIME_MS !\n",lpTime->wType);
		lpTime->wType = TIME_MS;
	case TIME_MS:
		lpTime->u.ms = WOutDev[wDevID].dwTotalPlayed /
				(WOutDev[wDevID].Format.wf.nAvgBytesPerSec / 1000);
		TRACE("wodGetPosition // TIME_MS=%lu\n", lpTime->u.ms);
		break;
	}
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodGetVolume			[internal]
 */
static DWORD wodGetVolume(WORD wDevID, LPDWORD lpdwVol)
{
	int 	mixer;
	int	volume, left, right;
	TRACE("(%u, %p);\n", wDevID, lpdwVol);
	if (lpdwVol == NULL) return MMSYSERR_NOTENABLED;
#ifdef __arm__OLD
	/* hack this for now */
	*lpdwVol = 0xFFFF;
	return MMSYSERR_NOERROR;
#else
	if ((mixer = open(MIXER_DEV, O_RDONLY)) < 0) {
		WARN("mixer device not available !\n");
		return MMSYSERR_NOTENABLED;
	}
	if (ioctl(mixer, SOUND_MIXER_READ_PCM, &volume) == -1) {
		WARN("unable read mixer !\n");
		return MMSYSERR_NOTENABLED;
	}
	close(mixer);
	left = volume & 0x7F;
	right = (volume >> 8) & 0x7F;
	TRACE("left=%d right=%d !\n", left, right);
	*lpdwVol = MAKELONG(left << 9, right << 9);
	return MMSYSERR_NOERROR;
#endif
}


/**************************************************************************
 * 				wodSetVolume			[internal]
 */
static DWORD wodSetVolume(WORD wDevID, DWORD dwParam)
{
	int 	mixer;
	int		volume;
	TRACE("(%u, %08lX);\n", wDevID, dwParam);
	volume = (LOWORD(dwParam) >> 9 & 0x7F) + 
		((HIWORD(dwParam) >> 9  & 0x7F) << 8);
#ifdef __arm__OLD
	/* no mixer on the itsy */
	volume = AUDIO_ATT_MIN;
	if ((mixer = open(SOUND_DEV, O_WRONLY)) < 0) {
	  if ( !WOutDev[wDevID].unixdev ) {
	    WARN("mixer device not available !\n");
	    return MMSYSERR_NOTENABLED;
	  }
	  mixer = WOutDev[wDevID].unixdev;
	}
	ioctl(mixer,AUDIO_SET_ATT, volume);
#else	
	if ((mixer = open(MIXER_DEV, O_WRONLY)) < 0) {
		WARN("mixer device not available !\n");
		return MMSYSERR_NOTENABLED;
		}
	if (ioctl(mixer, SOUND_MIXER_WRITE_PCM, &volume) == -1) {
	        WARN("unable set mixer !\n");
		return MMSYSERR_NOTENABLED;
		}
	close(mixer);
#endif	
	return MMSYSERR_NOERROR;
}


/**************************************************************************
 * 				wodMessage     
 */
DWORD wodMessage(WORD wDevID, WORD wMsg, DWORD dwUser, 
		 DWORD dwParam1, DWORD dwParam2)
{
        int audio;
#ifdef _DEBUG        
	fprintf(stderr, "wodMessage(deviceID:%u, Msg:%04X, dwUser:%08lX,\n Param1:%08lX, Param2:%08lX);\n",
		wDevID, wMsg, dwUser, dwParam1, dwParam2);
        
#endif
	switch(wMsg) {
	case WODM_OPEN:
		return wodOpen(wDevID, (LPWAVEOPENDESC)dwParam1, dwParam2);
	case WODM_CLOSE:
		return wodClose(wDevID);
	case WODM_WRITE:
		return wodWrite(wDevID, (LPWAVEHDR)dwParam1, dwParam2);
	case WODM_PAUSE:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_STOP:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_GETPOS:
		return wodGetPosition(wDevID, (LPMMTIME)dwParam1, dwParam2);
	case WODM_BREAKLOOP:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_PREPARE:
		return wodPrepare(wDevID, (LPWAVEHDR)dwParam1, dwParam2);
	case WODM_UNPREPARE:
		return wodUnprepare(wDevID, (LPWAVEHDR)dwParam1, dwParam2);
	case WODM_GETDEVCAPS:
		return wodGetDevCaps(wDevID,(LPWAVEOUTCAPS)dwParam1,dwParam2);
	case WODM_GETNUMDEVS:
	  /* FIXME: For now, only one sound device (SOUND_DEV) is allowed */
	  // audio = open (SOUND_DEV, O_WRONLY, 0);
	  // if (audio == -1)
	  //  if (errno == EBUSY)
	  //    return 1;
	  //  else
	  //  return 0;
	  // close (audio);
	  return 1;
	case WODM_GETPITCH:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_SETPITCH:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_GETPLAYBACKRATE:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_SETPLAYBACKRATE:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_GETVOLUME:
		return wodGetVolume(wDevID, (LPDWORD)dwParam1);
	case WODM_SETVOLUME:
		return wodSetVolume(wDevID, dwParam1);
	case WODM_RESTART:
		return wodRestart(wDevID);
	case WODM_RESET:
		return wodReset(wDevID);
	default:
#ifdef _DEBUG
	        fprintf(stderr,"unknown message !\n");
#endif	
	}
	return MMSYSERR_NOTSUPPORTED;
}





/**********************************************************************
 *           CALLBACK_CallDriverCallback
 */
static LRESULT CallDriverCallback( FARPROC16 proc,
				   HANDLE16 hDev, UINT16 msg,
				   DWORD dwUser, LPARAM lp1,
				   LPARAM lp2 )
{
#ifdef __arm__OLD
  return WaveOutCallbackRoutine( hDev, msg, dwUser, lp1, lp2 );
#else
  return proc( hDev, msg, dwUser, lp1, lp2 );
#endif
}

const CALLBACKS_TABLE *Callbacks;

/**************************************************************************
 * 				DriverCallback	[MMSYSTEM.31]
*/
BOOL16 DriverCallback(DWORD dwCallBack, UINT16 uFlags, HANDLE16 hDev, 
                             WORD wMsg, DWORD dwUser, DWORD dwParam1, DWORD dwParam2)
{
  LPWAVEOPENDESC	lpDesc;
  
  TRACE("DriverCallback:(dwCallback:%08lX, %04X, %04X, %04X, %08lX, %08lX, %08lX); !\n",
	dwCallBack, uFlags, hDev, wMsg, dwUser, dwParam1, dwParam2);
  switch(uFlags & DCB_TYPEMASK) {
  case DCB_NULL:
    TRACE("CALLBACK_NULL !\n");
    break;
  case DCB_WINDOW:
    TRACE("CALLBACK_WINDOW = %04lX handle = %04X!\n",dwCallBack,hDev);
    //	if (!IsWindow32(dwCallBack)) return FALSE;
    //	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hDev);
    //	if (lpDesc == NULL) return FALSE;
    
    //			PostMessage16((HWND16)dwCallBack, wMsg, hDev, dwParam1);
    break;
  case DCB_TASK:
    TRACE("CALLBACK_TASK !\n");
    return FALSE;
  case DCB_FUNCTION:
    TRACE("Calling CallDriverCallback!\n");
    CallDriverCallback( (FARPROC16)dwCallBack,
				   hDev, wMsg, dwUser,
				   dwParam1, dwParam2 );
    break;
  case DCB_FUNC32:
    TRACE("CALLBACK_FUNc32 !\n");
    //	((LPDRVCALLBACK32)dwCallBack)( hDev, wMsg, dwUser,
    //                               dwParam1, dwParam2 );
    break;
  }
  return TRUE;
}

//#undef _DEBUG
#endif
#endif


/*
 * Portions:
 * Copyright 1993 Martin Ayotte
 */        
/************************************************************
 *
 *                           Copyright (c)
 *    © Digital Equipment Corporation 1996, 1997, 1998. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved. 
 *	  Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.   
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
 * 003	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 004 	CAB		10/16/2000	Changed copyright info
 * 005	MGS		10/18/2000	Fixed Reset for Redhat 6.2, does not work well for redhat 5.0
 * 006	MGS		02/08/2001	Rewrote the low level code
 * 007	MGS		02/13/2001	Changes for ipaq linux
 * 008	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 009	MGS		06/19/2001	Solaris Port BATS#972
 **********************************************************************/

/* FIXME: GetNumDevs, GetVolume, etc. 
 */

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_ || defined (__APPLE__)
#ifndef LINUX_AUDIO_C
#define LINUX_AUDIO_C

#if defined __linux__ || defined _SPARC_SOLARIS_
#define USE_OSS 1
#endif

#ifdef __APPLE__
#define USE_AUDIOQUEUE 1
#endif

//#define _DEBUG

#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#ifdef _SPARC_SOLARIS_
#include <sys/audio.h>
#include <sys/mixer.h>
#include <sys/types.h>
#include <stropts.h>
#include <sys/conf.h>
#include <sys/stat.h> 
#include <poll.h>
#else
#ifdef USE_OSS
#include <sys/soundcard.h>
#endif
#include <sys/types.h>
#include <sys/stat.h> 
#endif
#ifdef VXWORKS
#include <time.h>
#else
#include <sys/time.h>
#endif
#include <sys/mman.h>
#ifdef USE_PULSEAUDIO
#include <pulse/simple.h>
#endif
#ifdef USE_AUDIOQUEUE
#include "AudioToolbox/AudioToolbox.h"
#endif
#ifdef USE_ALSA
#include <alsa/asoundlib.h>
#endif
#include "linux_audio.h"

#define EMULATE_SB16

#ifdef USE_OSS
#ifdef _SPARC_SOLARIS_
#define SOUND_DEV "/dev/audio"
#else
#define SOUND_DEV "/dev/dsp"
#endif
#define MIXER_DEV "/dev/mixer"
#endif

#ifdef USE_ALSA
#define ALSA_DEVICE "default"
#define LATENCYMS       200
#endif

#define AUDIO_DEV_TAG "AUDIODEV:"

#ifdef USE_AUDIOQUEUE
#define AQBUFFERS       4
#define AQBUFFERMS      40
#endif

#define IOCTL(a,b,c)		((-1==ioctl(a,b,&c))&&(perror("ioctl:"#b":"#c),0))
#define MAX_WAVEOUTDRV 	(1)	/* FIXME: multiple driver types are supported! */
#define MAX_WAVEINDRV 	(1)

/* state diagram for waveOut writing:
 *
 * +---------+-------------+---------------+---------------------------------+
 * |  state  |  function   |     event     |            new state	     |
 * +---------+-------------+---------------+---------------------------------+
 * |	     | open()	   |		   | STOPPED		       	     |
 * | PAUSED  | write()	   | 		   | PAUSED		       	     |
 * | STOPPED | write()	   | <thrd create> | PLAYING		  	     |
 * | PLAYING | write()	   | HEADER        | PLAYING		  	     |
 * | (other) | write()	   | <error>       |		       		     |
 * | (any)   | pause()	   | PAUSING	   | PAUSED		       	     |
 * | PAUSED  | restart()   | RESTARTING    | PLAYING (if no thrd => STOPPED) |
 * | (any)   | reset()	   | RESETTING     | STOPPED		      	     |
 * | (any)   | close()	   | CLOSING	   | CLOSED		      	     |
 * +---------+-------------+---------------+---------------------------------+
 */

/* states of the playing device */
#define	WINE_WS_PLAYING		0
#define	WINE_WS_PAUSED		1
#define	WINE_WS_STOPPED		2
#define WINE_WS_CLOSED		3

/* events to be send to device */
#define WINE_WM_PAUSING		(WM_USER + 1)
#define WINE_WM_RESTARTING	(WM_USER + 2)
#define WINE_WM_RESETTING	(WM_USER + 3)
#define WINE_WM_CLOSING		(WM_USER + 4)
#define WINE_WM_HEADER		(WM_USER + 5)

#define WINE_WM_FIRST WINE_WM_PAUSING
#define WINE_WM_LAST WINE_WM_HEADER

#define AUDIO_OUTPUT_NONE       0
#define AUDIO_OUTPUT_OSS	1
#define AUDIO_OUTPUT_ALSA	2
#define AUDIO_OUTPUT_PULSEAUDIO	3
#define AUDIO_OUTPUT_AUDIOQUEUE	4

typedef struct {
    int msg;
    unsigned long param;
} WWO_MSG;

#define WWO_RING_BUFFER_SIZE	30
typedef struct {
    int            currentOutputType;
#ifdef USE_PULSEAUDIO
    pa_simple      *pa_conn;
#endif
#ifdef USE_AUDIOQUEUE
    AudioQueueRef  aqueueref;
    AudioQueueBufferRef aqueue_bufref[AQBUFFERS];
    AudioQueueBufferRef aqueue_currbuf;
    int            aqueue_buffree;
    HMUTEX_T       aqueue_crst;
#endif
#ifdef USE_OSS
    int            unixdev;
#endif
#ifdef USE_ALSA
    snd_pcm_t      *alsa_handle;
    int            alsa_framesize;
#endif
    volatile int   state;			/* one of the WINE_WS_ manifest constants */
    DWORD          dwFragmentSize;		/* size of OSS buffer fragment */
    WAVEOPENDESC   waveDesc;
    WORD           wFlags;
    PCMWAVEFORMAT  format;
    LPWAVEHDR      lpQueuePtr;	/* start of queued WAVEHDRs (waiting to be notified) */
    LPWAVEHDR      lpPlayPtr;	/* start of not yet fully played buffers */
    LPWAVEHDR      lpLoopPtr;   /* pointer of first buffer in loop, if any */
    
    DWORD          dwLastFragDone; /* time in ms, when last played fragment will be actually played */
    DWORD          dwPlayedTotal;  /* number of bytes played since opening */
    unsigned long long qwFragBytes;

    /* info on current lpQueueHdr->lpWaveHdr */
    DWORD          dwOffCurrHdr; /* offset in lpPlayPtr->lpData for fragments */
    DWORD          dwRemain;	/* number of bytes to write to end the current fragment  */

    /* synchronization stuff */
    HTHREAD_T         hThread;
    DWORD          dwThreadID;
    HEVENT_T         hEvent;
    WWO_MSG        messages[WWO_RING_BUFFER_SIZE];
    int            msg_tosave;
    int            msg_toget;
    HEVENT_T         msg_event;
    HMUTEX_T        msg_crst;
    WAVEOUTCAPS    caps;

    /* DirectSound stuff */
    LPBYTE         mapping;
    DWORD          maplen;
    int            server_startticks;
} WINE_WAVEOUT;

#ifdef WAVEIN_NEEDED
typedef struct {
  int		unixdev;
  volatile int		state;
  DWORD			dwFragmentSize;		/* OpenSound '/dev/dsp' give us that size */
  WAVEOPENDESC	waveDesc;
  WORD		wFlags;
  PCMWAVEFORMAT		format;
  LPWAVEHDR			lpQueuePtr;
  DWORD			dwTotalRecorded;
  WAVEINCAPS			caps;
  BOOL                        bTriggerSupport;
  
  /* synchronization stuff */
  DT_HANDLE			hThread;
  DWORD			dwThreadID;
  DT_HANDLE			hEvent;
} WINE_WAVEIN;
#endif


static WAVEOUTCAPS      WOutDevCaps[MAX_WAVEOUTDRV];
// MGS the next variable is not used in dectalks audio output
// if this code is ever used for audio input, this will have to be
// put back in
#ifdef WAVEIN_NEEDED
static WINE_WAVEIN	WInDev    [MAX_WAVEINDRV ];
#endif


 /* Unfortunately, ms-windoze uses wDevID of zero to indicate
 * errors.  Now, multimedia drivers must pass the wDevID through
 * MMSYSTEM_DevIDToIndex to get an index in that range.  An
 * aribtrary value, MMSYSTEM_MAGIC is added to the wDevID seen
 * by the windows programs. 
 */

#define MMSYSTEM_MAGIC 0x0F00

/***********************************************************************
 *           GetTickCount   (USER.13) (KERNEL32.299) from main.c
 *
 * Returns the number of milliseconds, modulo 2^32, since the start
 * of the wineserver.
 */
DWORD WINAPI GetTickCount(WINE_WAVEOUT* wwo)
{
    struct timeval t;
    gettimeofday( &t, NULL );
    return ((t.tv_sec * 1000) + (t.tv_usec / 1000)) - wwo->server_startticks;
}

#ifdef USE_OSS
char *GetAudioDev(char *name)
{
	FILE *infile;
	int i;
	char line[500];
	char *env_dev;

	infile=fopen("DECtalk.conf","r");
	if (infile==NULL)
	{
#ifdef TESTING
		infile=fopen("DECtalk.conf","r");
		if (infile==NULL)
#endif
		{
			strcpy(name,SOUND_DEV);
			return(name);
		}
	}
	name[0]='\0';
	while (fgets(line,499,infile)!=NULL)
	{
		if (strncmp(line,AUDIO_DEV_TAG,9)==0)
		{
			line[strlen(line)-1]='\0';
			if (line[9]=='$')
			{
				/* get envrionment */
				env_dev=getenv(line+9);	
				strcpy(name,env_dev);
				break;
			}
			else
			{
				strcpy(name,line+9);
				break;
			}
		}
	}
	if (name[0]=='\0')
	{
		strcpy(name,SOUND_DEV);
	}
	return(name);
}
#endif





/*======================================================================*
 *                  Low level WAVE implementation			*
 *======================================================================*/

LONG OSS_WaveInit(void)
{
  int 	audio;
  int		smplrate;
  int		samplesize = 16;
  int		dsp_stereo = 1;
  int		bytespersmpl;
  int 	caps;
  int		mask;
  int 	i;
  char audio_dev[500];
#ifdef _SPARC_SOLARIS_
  audio_info_t audio_info;
#endif

    
  /* FIXME: only one device is supported */
  memset(&WOutDevCaps[0], 0, sizeof(WOutDevCaps[0]));

/*
 * Use the same capabilities for ALSA. Pulseaudio and native MacOS AudioToolbox
 * as all do resampling.
 * If one of these outputs is compiled in, the OSS wave format detection will not
 * run, even when only the OSS output is working on the system
 */

#if defined(USE_PULSEAUDIO) || defined(USE_AUDIOQUEUE) || defined(USE_ALSA)
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4M08;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4S08;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4M16;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4S16;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2M08;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2S08;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2M16;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2S16;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1M08;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1S08;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1M16;
  WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1S16;
  return 0;
#else

  GetAudioDev(audio_dev);
#ifdef _SPARC_SOLARIS_
  strcat(audio_dev,"ctl");
#else
  if (access(audio_dev,0) != 0 ||
      (audio = open(audio_dev, O_WRONLY|O_NDELAY, 0)) == -1) {
    WARN("Couldn't open out %s (%s)\n", audio_dev, strerror(errno));
    return -1;
  }
#endif
#ifdef _SPARC_SOLARIS_
  ioctl(audio, I_FLUSH,FLUSHW);
#else
  ioctl(audio, SNDCTL_DSP_RESET, 0);
#endif

  /* FIXME: some programs compare this string against the content of the registry
   * for MM drivers. The names have to match in order for the program to work 
   * (e.g. MS win9x mplayer.exe)
   */
#ifdef EMULATE_SB16
  WOutDevCaps[0].wMid = 0x0002;
  WOutDevCaps[0].wPid = 0x0104;
  strcpy(WOutDevCaps[0].szPname, "SB16 Wave Out");
#else
  WOutDevCaps[0].wMid = 0x00FF; 	/* Manufac ID */
  WOutDevCaps[0].wPid = 0x0001; 	/* Product ID */
  /*    strcpy(WOutDevCaps[0].szPname, "OpenSoundSystem WAVOUT Driver");*/
  strcpy(WOutDevCaps[0].szPname, "CS4236/37/38");
#endif
  WOutDevCaps[0].vDriverVersion = 0x0100;
  WOutDevCaps[0].dwFormats = 0x00000000;
  WOutDevCaps[0].dwSupport = WAVECAPS_VOLUME;
    
#ifdef _SPARC_SOLARIS_
  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=11025;
  audio_info.play.precision=16;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=1;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_1M16;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=11025;
  audio_info.play.precision=16;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=2;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_1S16;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=11025;
  audio_info.play.precision=8;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=1;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_1M08;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=11025;
  audio_info.play.precision=8;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=2;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_1S08;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=8000;
  audio_info.play.precision=8;
  audio_info.play.encoding=AUDIO_ENCODING_ULAW;
  audio_info.play.channels=1;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_08M08;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=22050;
  audio_info.play.precision=16;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=1;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_2M16;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=22050;
  audio_info.play.precision=16;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=2;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_2S16;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=22050;
  audio_info.play.precision=8;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=1;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_2M08;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=22050;
  audio_info.play.precision=8;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=2;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_2S08;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=44100;
  audio_info.play.precision=16;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=1;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_4M16;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=44100;
  audio_info.play.precision=16;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=2;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_4S16;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=44100;
  audio_info.play.precision=8;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=1;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_4M08;
  }

  AUDIO_INIT(&audio_info,sizeof(audio_info));
  audio_info.play.sample_rate=44100;
  audio_info.play.precision=8;
  audio_info.play.encoding=AUDIO_ENCODING_LINEAR;
  audio_info.play.channels=2;

  if (ioctl(audio,AUDIO_SETINFO,&audio_info)==0)
  {
    WOutDevCaps[0].dwFormats|=WAVE_FORMAT_4S08;
  }

  WOutDevCaps[0].dwSupport |= WAVECAPS_SAMPLEACCURATE;
#else 
  IOCTL(audio, SNDCTL_DSP_GETFMTS, mask);
  TRACE("OSS dsp out mask=%08x\n", mask);

  /* First bytespersampl, then stereo */
  bytespersmpl = (IOCTL(audio, SNDCTL_DSP_SAMPLESIZE, samplesize) != 0) ? 1 : 2;
    
  WOutDevCaps[0].wChannels = (IOCTL(audio, SNDCTL_DSP_STEREO, dsp_stereo) != 0) ? 1 : 2;
  if (WOutDevCaps[0].wChannels > 1) WOutDevCaps[0].dwSupport |= WAVECAPS_LRVOLUME;
    
  smplrate = 44100;
  if (IOCTL(audio, SNDCTL_DSP_SPEED, smplrate) == 0) {
    if (mask & AFMT_U8) {
      WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4M08;
      if (WOutDevCaps[0].wChannels > 1)
	WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4S08;
    }
    if ((mask & AFMT_S16_LE) && bytespersmpl > 1) {
      WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4M16;
      if (WOutDevCaps[0].wChannels > 1)
	WOutDevCaps[0].dwFormats |= WAVE_FORMAT_4S16;
    }
  }
  smplrate = 22050;
  if (IOCTL(audio, SNDCTL_DSP_SPEED, smplrate) == 0) {
    if (mask & AFMT_U8) {
      WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2M08;
      if (WOutDevCaps[0].wChannels > 1)
	WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2S08;
    }
    if ((mask & AFMT_S16_LE) && bytespersmpl > 1) {
      WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2M16;
      if (WOutDevCaps[0].wChannels > 1)
	WOutDevCaps[0].dwFormats |= WAVE_FORMAT_2S16;
    }
  }
  smplrate = 11025;
  if (IOCTL(audio, SNDCTL_DSP_SPEED, smplrate) == 0) {
    if (mask & AFMT_U8) {
      WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1M08;
      if (WOutDevCaps[0].wChannels > 1)
	WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1S08;
    }
    if ((mask & AFMT_S16_LE) && bytespersmpl > 1) {
      WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1M16;
      if (WOutDevCaps[0].wChannels > 1)
	WOutDevCaps[0].dwFormats |= WAVE_FORMAT_1S16;
    }
  }
  if (IOCTL(audio, SNDCTL_DSP_GETCAPS, caps) == 0) {
    TRACE("OSS dsp out caps=%08X\n", caps);
    if ((caps & DSP_CAP_REALTIME) && !(caps & DSP_CAP_BATCH)) {
      WOutDevCaps[0].dwSupport |= WAVECAPS_SAMPLEACCURATE;
    }
    /* well, might as well use the DirectSound cap flag for something */
    if ((caps & DSP_CAP_TRIGGER) && (caps & DSP_CAP_MMAP) &&
	!(caps & DSP_CAP_BATCH))
      WOutDevCaps[0].dwSupport |= WAVECAPS_DIRECTSOUND;
  }
#endif // _SPARC_SOLARIS_
  close(audio);
  TRACE("out dwFormats = %08lX, dwSupport = %08lX\n",
	WOutDevCaps[0].dwFormats, WOutDevCaps[0].dwSupport);

  return 0;
#endif // USE_PULSEAUDIO
}

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
 * 			OSS_NotifyClient			[internal]
 */
static DWORD OSS_NotifyClient(WINE_WAVEOUT *wwo, WORD wMsg, unsigned long dwParam1, 
			      unsigned long dwParam2)
{
  TRACE("OSS_NotifyClient: wwo = %p wMsg = %d dwParm1 = %04lX dwParam2 = %04lX\n",wwo, wMsg, dwParam1, dwParam2);

  switch (wMsg) {
  case WOM_OPEN:
  case WOM_CLOSE:
  case WOM_DONE:
    if (wwo == NULL) return MCIERR_INTERNAL;

    if (wwo->wFlags != DCB_NULL && 
	!DriverCallback(wwo->waveDesc.dwCallback, 
			wwo->wFlags, 
			wwo->waveDesc.hWave, 
			wMsg, 
			wwo->waveDesc.dwInstance, 
			dwParam1, 
			dwParam2)) {
      WARN("OSS_NotifyClient can't notify client !\n");
      return MMSYSERR_NOERROR;
    }
    break;
	  
  default:
    FIXME("Unknown CB message %u\n", wMsg);
    break;
  }
  return 0;
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
  /* FIXME: Get number of available device types (alsa/PA/aqueue/OSS) */
  count += OSS_wodMessage(NULL , WODM_GETNUMDEVS, 0L, 0L, 0L);
#ifdef _DEBUG
  fprintf(stderr, "waveOutGetNumDevs return %u \n", count);
#endif
  return count;
}

/**************************************************************************
 * 				waveOutGetDevCaps
 */
UINT32 waveOutGetDevCaps(UINT16 uDeviceID, LPWAVEOUTCAPS lpCaps,
			 UINT32 uSize)
{
#ifdef _DEBUG
  fprintf(stderr,"Linux ONLY: waveOutGetDevCaps\n");
  //fprintf(stderr,"uDeviceID = %i\n",uDeviceID);
#endif  

  if (uDeviceID > waveOutGetNumDevs() - 1) return MMSYSERR_BADDEVICEID;
  /* FIXME: do we have a wave mapper ? */
  if (uDeviceID == (UINT16)WAVE_MAPPER) return MMSYSERR_BADDEVICEID; 
  return OSS_wodMessage(&uDeviceID, WODM_GETDEVCAPS, 0L, (unsigned long)lpCaps, uSize);
	
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
		   const LPWAVEFORMATEX lpFormat, void (*dwCallback)(void *, unsigned int,  unsigned int,  long int,  long int),
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

  hWaveOut = malloc(sizeof(WAVEOPENDESC));
  if (lphWaveOut != NULL) *lphWaveOut = hWaveOut;
  lpDesc = (LPWAVEOPENDESC) hWaveOut;
  if (lpDesc == NULL) return MMSYSERR_NOMEM;
  lpDesc->hWave = (unsigned long)hWaveOut;
  lpDesc->lpFormat = (LPWAVEFORMATEX)lpFormat;  /* should the struct be copied iso pointer? */
  lpDesc->dwCallback = dwCallback;
  lpDesc->dwInstance = dwInstance;
	
  if (uDeviceID >= MAXWAVEDRIVERS)
    uDeviceID = 0;
  while(uDeviceID < MAXWAVEDRIVERS) {
    dwRet = OSS_wodMessage(&uDeviceID, WODM_OPEN, 
			   lpDesc->dwInstance, (unsigned long)lpDesc, dwFlags);
    if (dwRet == MMSYSERR_NOERROR) break;
    if (!bMapperFlg) break;
    uDeviceID++;
#ifdef _DEBUG
    fprintf(stderr, "WAVE_MAPPER mode ! try next driver...\n");
#endif		
  }
  lpDesc->uMappedDeviceID = uDeviceID;  /* save physical Device ID */
  if (dwFlags & WAVE_FORMAT_QUERY) {
#ifdef _DEBUG
    fprintf(stderr, "End of WAVE_FORMAT_QUERY !\n");
#endif	
    free((void *)hWaveOut);
  }
  return dwRet;
}


/**************************************************************************
 * 				waveOutClose	 
 */
UINT16 waveOutClose(HWAVEOUT hWaveOut)
{
	UINT16 ret;
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr,"Linux ONLY: waveOutClose");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif
	lpDesc = (LPWAVEOPENDESC) hWaveOut;
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	ret = OSS_wodMessage( lpDesc->WOutDev, WODM_CLOSE, lpDesc->dwInstance, 0L, 0L);
	if (ret == MMSYSERR_NOERROR) {
		free(hWaveOut);
	}
	return ret;
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
	return OSS_wodMessage( lpDesc->WOutDev, WODM_PREPARE, lpDesc->dwInstance, 
			   (unsigned long)lpWaveOutHdr,uSize);
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
	return OSS_wodMessage( lpDesc->WOutDev,WODM_UNPREPARE,lpDesc->dwInstance, 
					(unsigned long)lpWaveOutHdr, uSize);
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
	lpWaveOutHdr->reserved = (unsigned long)lpWaveOutHdr->lpData;
	return OSS_wodMessage( lpDesc->WOutDev, WODM_WRITE, lpDesc->dwInstance, (unsigned long)lpWaveOutHdr, uSize);
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
	return OSS_wodMessage( lpDesc->WOutDev, WODM_PAUSE, lpDesc->dwInstance, 0L, 0L);
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
	return OSS_wodMessage( lpDesc->WOutDev, WODM_RESTART, lpDesc->dwInstance, 0L, 0L);
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
	return OSS_wodMessage( lpDesc->WOutDev, WODM_RESET, lpDesc->dwInstance, 0L, 0L);
}

/**************************************************************************
 * 				waveOutRestart
 */
UINT16 waveOutResstart(HWAVEOUT hWaveOut)
{
	LPWAVEOPENDESC	lpDesc;

#ifdef _DEBUG
	fprintf(stderr, "Linux ONLY: waveOutReset");
	fprintf(stderr, "(%04X)\n", hWaveOut);
#endif

	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	return OSS_wodMessage( lpDesc->WOutDev, WODM_RESTART, lpDesc->dwInstance, 0L, 0L);
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
	//if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	if (lpDesc == NULL) 
		return OSS_wodMessage( NULL, WODM_GETVOLUME, 0, (unsigned long)pdwVolume, 0L);
	return OSS_wodMessage( lpDesc->WOutDev, WODM_GETVOLUME, lpDesc->dwInstance, 
			   (unsigned long)pdwVolume, 0L);
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
	//if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;
	if (lpDesc == NULL) 
		return OSS_wodMessage( NULL, WODM_SETVOLUME, 0, dwVolume, 0L);
	return OSS_wodMessage( lpDesc->WOutDev, WODM_SETVOLUME, lpDesc->dwInstance, 
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
	return OSS_wodMessage( lpDesc->WOutDev, WODM_GETPOS, lpDesc->dwInstance, 
							(unsigned long)lpTime, uSize);
}

#define WAVEOUT_SHORTCUT_1(xx,XX,atype) \
        UINT16 waveOut##xx(HWAVEOUT hWaveOut, atype x)       \
{									\
	LPWAVEOPENDESC	lpDesc;                                         \
	lpDesc = (LPWAVEOPENDESC) USER_HEAP_LIN_ADDR(hWaveOut);		\
	if (lpDesc == NULL) return MMSYSERR_INVALHANDLE;		\
	return OSS_wodMessage(lpDesc->WOutDev, WODM_##XX, lpDesc->dwInstance,\
			  (unsigned long)x, 0L);				\
}

WAVEOUT_SHORTCUT_1(GetPitch,GETPITCH,DWORD*)
WAVEOUT_SHORTCUT_1(SetPitch,SETPITCH,DWORD)
WAVEOUT_SHORTCUT_1(GetPlaybackRate,GETPLAYBACKRATE,DWORD*)
WAVEOUT_SHORTCUT_1(SetPlaybackRate,SETPLAYBACKRATE,DWORD)

#if 0
#define WAVEOUT_SHORTCUT_2(xx,XX,atype) \
        UINT16 waveOut##xx##16(UINT16 devid, atype x)		\
{									\
	return OSS_wodMessage(devid, WODM_##XX, 0L,	(unsigned long)x, 0L);		\
}
	

WAVEOUT_SHORTCUT_2(GetVolume,GETVOLUME,DWORD*)
WAVEOUT_SHORTCUT_2(SetVolume,SETVOLUME,DWORD)
#endif


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
	*lpuDeviceID = lpDesc->uMappedDeviceID;
        return 0;
}

/*======================================================================*
 *                  Low level WAVE OUT implementation			*
 *======================================================================*/

#if defined(USE_AUDIOQUEUE)
void wodPlayer_enqueueCurrentBuffer(WINE_WAVEOUT* wwo)
{
  OSStatus os_status;
  if (wwo->aqueue_currbuf != NULL) {
    os_status = AudioQueueEnqueueBuffer(wwo->aqueueref, wwo->aqueue_currbuf, 0, NULL);
    if (os_status != 0) {
        OP_LockMutex(wwo->aqueue_crst);
        wwo->aqueue_currbuf->mAudioDataByteSize = 0;
        wwo->aqueue_buffree++;
        OP_UnlockMutex(wwo->aqueue_crst);
    }
    wwo->aqueue_currbuf = NULL;
  }
}
#endif

/**************************************************************************
 * 				wodPlayer_WriteFragments	[internal]
 *
 * wodPlayer helper. Writes as many fragments as it can to unixdev.
 * Returns TRUE in case of buffer underrun.
 */

#if defined _SPARC_SOLARIS_ || defined (USE_AUDIOQUEUE)
typedef struct audio_buf_info_t 
{
int fragments;
int fragsize;
int fragstotal;
int bytes;
} audio_buf_info;
#endif
static	BOOL	wodPlayer_WriteFragments(WINE_WAVEOUT* wwo)
{
  LPWAVEHDR		lpWaveHdr;
  LPBYTE		lpData;
  int			count = 0;
  audio_buf_info 	info;
#ifdef _SPARC_SOLARIS_
  struct pollfd		fds[1];
  int return_val;
#endif
#if defined(USE_AUDIOQUEUE)
  OSStatus            os_status;
  int                 i;
#endif

/* Use fake fragments for Pulseaudio */
#ifdef USE_PULSEAUDIO
  if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
    info.fragments=4;
  }
#endif
  for (;;) {
#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
      info.fragments--;
      info.fragsize=1024;
      info.fragstotal=16;
      info.bytes=12406;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
      OP_LockMutex(wwo->aqueue_crst);
      info.fragments = wwo->aqueue_buffree;
      OP_UnlockMutex(wwo->aqueue_crst);
      info.fragsize=wwo->dwFragmentSize;
      info.fragstotal=AQBUFFERS;
      info.bytes=info.fragments*info.fragsize;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
      snd_pcm_uframes_t buffer_size;
      snd_pcm_uframes_t period_size;
      snd_pcm_sframes_t available;
      int err;

      available = snd_pcm_avail(wwo->alsa_handle);
      if (available < 0) {
        snd_pcm_recover(wwo->alsa_handle, available, 1);
        available = snd_pcm_avail(wwo->alsa_handle);
        if (available < 0) {
          snd_pcm_recover(wwo->alsa_handle, available, 1);
          return FALSE;
        }
      }

      if((err = snd_pcm_get_params(wwo->alsa_handle, &buffer_size, &period_size)) >= 0) {
        buffer_size *= wwo->alsa_framesize;
        period_size *= wwo->alsa_framesize;
        available *= wwo->alsa_framesize;
        info.fragments = available / period_size;
        info.fragsize = period_size;
        info.fragstotal = buffer_size / period_size;
        info.bytes = available;
      } else {
        snd_pcm_recover(wwo->alsa_handle, err, 1);
        return FALSE;
      }
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
#ifdef _SPARC_SOLARIS_
      fds[0].fd=wwo->unixdev;
      fds[0].events=POLLOUT;
      fds[0].revents=0;

      return_val=poll(fds,1,0);
      if (return_val<0)
      {
         ERR("poll failed (%s)\n", strerror(errno));
         return FALSE;
      } 
      if (!(fds[0].revents&&POLLOUT))
      {
           return FALSE;
      }
           
      info.fragments=3;
      info.fragsize=1024;
      info.fragstotal=16;
      info.bytes=12406;
#else
      if (ioctl(wwo->unixdev, SNDCTL_DSP_GETOSPACE, &info) < 0) {
        ERR("ioctl failed (%s)\n", strerror(errno));
        return FALSE;
      }
#endif
    }
#endif
	
    TRACE("info={frag=%d fsize=%d ftotal=%d bytes=%d}\n", info.fragments, info.fragsize, info.fragstotal, info.bytes);

    if (!info.fragments)	/* output queue is full, wait a bit */
      return FALSE;

    lpWaveHdr = wwo->lpPlayPtr;
    if (!lpWaveHdr) {
#if defined(USE_AUDIOQUEUE)
      if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
        wodPlayer_enqueueCurrentBuffer(wwo);
      }
#endif
      if (wwo->dwRemain > 0 &&		/* still data to send to complete current fragment */
	  wwo->dwLastFragDone &&  	/* first fragment has been played */
	  info.fragments + 2 > info.fragstotal) {   /* done with all waveOutWrite()' fragments */
	/* FIXME: should do better handling here */
	WARN("Oooch, buffer underrun !\n");
	return TRUE; /* force resetting of waveOut device */
      }
      return FALSE;	/* wait a bit */
    }
	
    if (wwo->dwOffCurrHdr == 0) {
      TRACE("Starting a new wavehdr %p of %ld bytes\n", lpWaveHdr, lpWaveHdr->dwBufferLength);
      if (lpWaveHdr->dwFlags & WHDR_BEGINLOOP) {
	if (wwo->lpLoopPtr) {
	  WARN("Already in a loop. Discarding loop on this header (%p)\n", lpWaveHdr);
	} else {
	  wwo->lpLoopPtr = lpWaveHdr;
	}
      }
    }
	
    lpData = lpWaveHdr->lpData;

    /* finish current wave hdr ? */
    if (wwo->dwOffCurrHdr + wwo->dwRemain >= lpWaveHdr->dwBufferLength) { 
      DWORD	toWrite = lpWaveHdr->dwBufferLength - wwo->dwOffCurrHdr;
	    
      /* write end of current wave hdr */
#ifdef USE_OSS
      if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
        count = write(wwo->unixdev, lpData + wwo->dwOffCurrHdr, toWrite);
      }
#endif
#ifdef USE_ALSA
      if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
        count = snd_pcm_writei(wwo->alsa_handle, lpData + wwo->dwOffCurrHdr, toWrite / wwo->alsa_framesize);
        if (count < 0) {
                count = snd_pcm_recover(wwo->alsa_handle, count, 0);
        } else if (count >= 0) {
                count *= wwo->alsa_framesize;
        }
      }
#endif
#ifdef USE_AUDIOQUEUE
      if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
        count = toWrite;
        OP_LockMutex(wwo->aqueue_crst);
        if (wwo->aqueue_currbuf == NULL) {
          for (i = 0; i < AQBUFFERS; i++) {
            if (wwo->aqueue_bufref[i]->mAudioDataByteSize == 0) {
              wwo->aqueue_currbuf = wwo->aqueue_bufref[i];
              wwo->aqueue_buffree--;
              break;
            }
          }
        }
        wwo->aqueue_currbuf->mAudioDataByteSize += count;
        OP_UnlockMutex(wwo->aqueue_crst);
        if (wwo->aqueue_currbuf != NULL) {
          memcpy(wwo->aqueue_currbuf->mAudioData + wwo->aqueue_currbuf->mAudioDataByteSize - count, lpData + wwo->dwOffCurrHdr, count);
        } else {
          count = 0;
        }
      }
#endif
#ifdef USE_PULSEAUDIO
      if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
        count = pa_simple_write(wwo->pa_conn, lpData + wwo->dwOffCurrHdr, toWrite, NULL);
        if (count == 0)
  	  count = toWrite;
        }
#endif
      TRACE("write(%p[%5lu], %5lu) => %d\n", lpData, wwo->dwOffCurrHdr, toWrite, count);
      //OP_Sleep(1);
	    
      if (count > 0 || toWrite == 0) {
	DWORD	tc = GetTickCount(wwo);

	if (wwo->dwLastFragDone /* + guard time ?? */ < tc) {
          wwo->server_startticks = 0;
          wwo->server_startticks = GetTickCount(wwo);
	}
	wwo->qwFragBytes += toWrite;
	wwo->dwLastFragDone = (wwo->qwFragBytes * 1000) / wwo->format.wf.nAvgBytesPerSec;

	lpWaveHdr->reserved = wwo->dwLastFragDone;
	TRACE("Tagging hdr %p with %08lx\n", lpWaveHdr, wwo->dwLastFragDone);

	/* WAVEHDR written, go to next one */
	if ((lpWaveHdr->dwFlags & WHDR_ENDLOOP) && wwo->lpLoopPtr) {
	  if (--wwo->lpLoopPtr->dwLoops > 0) {
	    wwo->lpPlayPtr = wwo->lpLoopPtr;
	  } else {
	    /* last one played */
	    if (wwo->lpLoopPtr != lpWaveHdr && (lpWaveHdr->dwFlags & WHDR_BEGINLOOP)) {
	      FIXME("Correctly handled case ? (ending loop buffer also starts a new loop)\n");
	      /* shall we consider the END flag for the closing loop or for
	       * the opening one or for both ???
	       * code assumes for closing loop only
	       */
	      wwo->lpLoopPtr = lpWaveHdr;
	    } else {
	      wwo->lpLoopPtr = NULL;
	    }
	    wwo->lpPlayPtr = lpWaveHdr->lpNext;
	  }
	} else {
	  wwo->lpPlayPtr = lpWaveHdr->lpNext;
	}
	wwo->dwOffCurrHdr = 0;
	if ((wwo->dwRemain -= count) == 0) {
	  wwo->dwRemain = wwo->dwFragmentSize;
#ifdef USE_AUDIOQUEUE
          if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
            wodPlayer_enqueueCurrentBuffer(wwo);
          }
#endif
	}
      }
      continue; /* try to go to use next wavehdr */
    }  else	{
#ifdef USE_OSS
      if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
        count = write(wwo->unixdev, lpData + wwo->dwOffCurrHdr, wwo->dwRemain);
      }
#endif
#ifdef USE_ALSA
      if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
        count = snd_pcm_writei(wwo->alsa_handle, lpData + wwo->dwOffCurrHdr, wwo->dwRemain / wwo->alsa_framesize);
        if (count < 0) {
                count = snd_pcm_recover(wwo->alsa_handle, count, 0);
        } else if (count >= 0) {
                count *= wwo->alsa_framesize;
        }
      }
#endif
#ifdef USE_AUDIOQUEUE
      if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
        count = wwo->dwRemain;
        OP_LockMutex(wwo->aqueue_crst);
        if (wwo->aqueue_currbuf == NULL) {
          for (i = 0; i < AQBUFFERS; i++) {
            if (wwo->aqueue_bufref[i]->mAudioDataByteSize == 0) {
              wwo->aqueue_currbuf = wwo->aqueue_bufref[i];
              wwo->aqueue_buffree--;
              break;
            }
          }
        }
        wwo->aqueue_currbuf->mAudioDataByteSize += count;
        OP_UnlockMutex(wwo->aqueue_crst);
        if (wwo->aqueue_currbuf != NULL) {
          memcpy(wwo->aqueue_currbuf->mAudioData + wwo->aqueue_currbuf->mAudioDataByteSize - count, lpData + wwo->dwOffCurrHdr, count);
        } else {
          count = 0;
        }
      }
#endif
#ifdef USE_PULSEAUDIO
      if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
        count = pa_simple_write(wwo->pa_conn, lpData + wwo->dwOffCurrHdr, wwo->dwRemain, NULL);
        if (count == 0)
          count = wwo->dwRemain;
      }
#endif
      //OP_Sleep(1);
      TRACE("write(%p[%5lu], %5lu) => %d\n", lpData, wwo->dwOffCurrHdr, wwo->dwRemain, count);
      if (count > 0) {
	DWORD	tc = GetTickCount(wwo);

	if (wwo->dwLastFragDone /* + guard time ?? */ < tc) {
          wwo->server_startticks = 0;
          wwo->server_startticks = GetTickCount(wwo);
	}
	wwo->qwFragBytes += wwo->dwRemain;
	wwo->dwLastFragDone = (wwo->qwFragBytes * 1000) / wwo->format.wf.nAvgBytesPerSec;
	TRACE("Tagging frag with %08lx\n", wwo->dwLastFragDone);

	wwo->dwOffCurrHdr += count;
	wwo->dwRemain = wwo->dwFragmentSize;
#ifdef USE_AUDIOQUEUE
        if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
          wodPlayer_enqueueCurrentBuffer(wwo);
        }
#endif
      }
    }
  }
}

#ifdef USE_AUDIOQUEUE
void audioCallback(void *wwoptr, AudioQueueRef aqueueref, AudioQueueBufferRef bref)
{
  WINE_WAVEOUT  *wwo = wwoptr;
  OSStatus      os_status;

  OP_LockMutex(wwo->aqueue_crst);
  wwo->aqueue_buffree++;
  bref->mAudioDataByteSize = 0;
  OP_UnlockMutex(wwo->aqueue_crst);
  /* Signal a free buffer */
  SetEvent(wwo->msg_event);
}
#endif


int wodPlayer_Message(WINE_WAVEOUT *wwo, int msg, unsigned long param)
{
  EnterCriticalSection(wwo->msg_crst);
  if ((wwo->msg_tosave == wwo->msg_toget) /* buffer overflow ? */
      &&  (wwo->messages[wwo->msg_toget].msg))
    {
      ERR("buffer overflow !?\n");
      LeaveCriticalSection(wwo->msg_crst);
      return 0;
    }

  wwo->messages[wwo->msg_tosave].msg = msg;
  wwo->messages[wwo->msg_tosave].param = param;
  wwo->msg_tosave++;
  if (wwo->msg_tosave > WWO_RING_BUFFER_SIZE-1)
    wwo->msg_tosave = 0;
  LeaveCriticalSection(wwo->msg_crst);
  /* signal a new message */
  SetEvent(wwo->msg_event);
  return 1;
}

int wodPlayer_RetrieveMessage(WINE_WAVEOUT *wwo, int *msg, unsigned long *param)
{
  EnterCriticalSection(wwo->msg_crst);

  if (wwo->msg_toget == wwo->msg_tosave) /* buffer empty ? */
    {
      LeaveCriticalSection(wwo->msg_crst);
      return 0;
    }
	
  *msg = wwo->messages[wwo->msg_toget].msg;
  wwo->messages[wwo->msg_toget].msg = 0;
  *param = wwo->messages[wwo->msg_toget].param;
  wwo->msg_toget++;
  if (wwo->msg_toget > WWO_RING_BUFFER_SIZE-1)
    wwo->msg_toget = 0;
  LeaveCriticalSection(wwo->msg_crst);
  return 1;
}

/**************************************************************************
 * 				wodPlayer_Notify		[internal]
 *
 * wodPlayer helper. Notifies (and remove from queue) all the wavehdr which content
 * have been played (actually to speaker, not to unixdev fd).
 */
static	void	wodPlayer_Notify(WINE_WAVEOUT* wwo, WORD uDevID, BOOL force)
{
  LPWAVEHDR		lpWaveHdr;
  DWORD		tc = GetTickCount(wwo);

  while (wwo->lpQueuePtr && 
	 (force || 
	  (wwo->lpQueuePtr != wwo->lpPlayPtr && wwo->lpQueuePtr != wwo->lpLoopPtr))) {
    lpWaveHdr = wwo->lpQueuePtr;
	    
    if (lpWaveHdr->reserved > tc && !force) break;

    wwo->dwPlayedTotal += lpWaveHdr->dwBufferLength;
    TRACE("wodPlayer_Notify total played=%d\n",wwo->dwPlayedTotal);
    wwo->lpQueuePtr = lpWaveHdr->lpNext;

    lpWaveHdr->dwFlags &= ~WHDR_INQUEUE;
    lpWaveHdr->dwFlags |= WHDR_DONE;

    TRACE("Notifying client with %p\n", lpWaveHdr);
    if (OSS_NotifyClient(wwo, WOM_DONE, (unsigned long)lpWaveHdr, 0) != MMSYSERR_NOERROR) {
      WARN("can't notify client !\n");
    }
  }
}

/**************************************************************************
 * 				wodPlayer_Reset			[internal]
 *
 * wodPlayer helper. Resets current output stream.
 */
static	void	wodPlayer_Reset(WINE_WAVEOUT* wwo, WORD uDevID, BOOL reset)
{
  /* updates current notify list */
  wodPlayer_Notify(wwo, uDevID, FALSE);

    /* flush all possible output */
#ifdef USE_OSS
  if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
#ifdef _SPARC_SOLARIS_
    if (ioctl(wwo->unixdev, I_FLUSH, FLUSHW) == -1) 
#else
    if (ioctl(wwo->unixdev, SNDCTL_DSP_RESET, 0) == -1) 
#endif
    {
      perror("ioctl SNDCTL_DSP_RESET");
      wwo->state = WINE_WS_STOPPED;
      DeleteCriticalSection(wwo->msg_crst);
      ExitThread((void *)-1);
    }
  }
#endif

#ifdef USE_ALSA
  if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
    if (snd_pcm_drop(wwo->alsa_handle) != 0)
    {
      perror("snd_pcm_drop");
      wwo->state = WINE_WS_STOPPED;
      DeleteCriticalSection(wwo->msg_crst);
      ExitThread((void *)-1);
    }
  }
#endif

#ifdef USE_PULSEAUDIO
  if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
    if (pa_simple_flush(wwo->pa_conn, NULL) != 0)
    {
      perror("pa_simple_flush");
      wwo->state = WINE_WS_STOPPED;
      DeleteCriticalSection(wwo->msg_crst);
      ExitThread((void *)-1);
    }
  }
#endif

#ifdef USE_AUDIOQUEUE
  if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
    wodPlayer_enqueueCurrentBuffer(wwo);
    if (AudioQueueFlush(wwo->aqueueref) != 0)
    {
      perror("AudioQueueFlush");
      wwo->state = WINE_WS_STOPPED;
      DeleteCriticalSection(wwo->msg_crst);
      ExitThread((void *)-1);
    }
  }
#endif

  wwo->dwOffCurrHdr = 0;
  wwo->dwRemain = wwo->dwFragmentSize;
  if (reset) {
    /* empty notify list */
    wodPlayer_Notify(wwo, uDevID, TRUE);

    wwo->lpPlayPtr = wwo->lpQueuePtr = wwo->lpLoopPtr = NULL;
    wwo->state = WINE_WS_STOPPED;
    wwo->dwPlayedTotal = 0;
  } else {
    /* FIXME: this is not accurate when looping, but can be do better ? */
    wwo->lpPlayPtr = (wwo->lpLoopPtr) ? wwo->lpLoopPtr : wwo->lpQueuePtr;
    wwo->state = WINE_WS_PAUSED;
  }
}

/**************************************************************************
 * 				wodPlayer			[internal]
 */
void wodPlayer(LPVOID wwolp)
{
  unsigned long		uDevID = 0;
  WINE_WAVEOUT*	wwo = (WINE_WAVEOUT*)wwolp;
  WAVEHDR*		lpWaveHdr;
  DWORD		dwSleepTime;
  int			msg;
  unsigned long	param;
  DWORD		tc;

  wwo->state = WINE_WS_STOPPED;

  wwo->dwLastFragDone = 0;
  wwo->dwOffCurrHdr = 0;
  wwo->dwRemain = wwo->dwFragmentSize;
  wwo->lpQueuePtr = wwo->lpPlayPtr = wwo->lpLoopPtr = NULL;
  wwo->dwPlayedTotal = 0;

  TRACE("imhere[0]\n");
  SetEvent(wwo->hEvent);

  for (;;) {
    /* wait for dwSleepTime or an event in thread's queue
     * FIXME:
     * - is wait time calculation optimal ?
     * - these 100 ms parts should be changed, but Eric reports
     *   that the wodPlayer thread might lock up if we use INFINITE
     *   (strange !), so I better don't change that now... */
    if (wwo->state != WINE_WS_PLAYING)
      dwSleepTime = 100;
    else
      {
	tc = GetTickCount(wwo);
	if (tc < wwo->dwLastFragDone)
	  {
	    /* calculate sleep time depending on when the last fragment
	       will be played */
	    dwSleepTime = (wwo->dwLastFragDone - tc)*7/10;
	    if (dwSleepTime > 50)
	      dwSleepTime = 50;
	  }
	else
	  dwSleepTime = 1;
      }

    if (dwSleepTime == 0) {
      dwSleepTime = 1;
    }
    TRACE("imhere[1]\n");
    if (dwSleepTime) {
      TRACE("wodPlayer sleep time = %d\n",dwSleepTime);
      WaitForSingleObject(wwo->msg_event, dwSleepTime);
      TRACE("wodPlayer Done Sleeping\n");
    }
    TRACE("imhere[2] (q=%p p=%p)\n", wwo->lpQueuePtr, wwo->lpPlayPtr);
    while (wodPlayer_RetrieveMessage(wwo, &msg, &param)) {
      switch (msg) {
      case WINE_WM_PAUSING:
	wodPlayer_Reset(wwo, uDevID, FALSE);
	wwo->state = WINE_WS_PAUSED;
	SetEvent(wwo->hEvent);
	break;
      case WINE_WM_RESTARTING:
	wwo->state = WINE_WS_PLAYING;
	SetEvent(wwo->hEvent);
	break;
      case WINE_WM_HEADER:
	lpWaveHdr = (LPWAVEHDR)param;
		
	/* insert buffer at the end of queue */
	{
	  LPWAVEHDR*	wh;
	  for (wh = &(wwo->lpQueuePtr); *wh; wh = &((*wh)->lpNext));
	  *wh = lpWaveHdr;
	}
	if (!wwo->lpPlayPtr) wwo->lpPlayPtr = lpWaveHdr;
	if (wwo->state == WINE_WS_STOPPED)
	  wwo->state = WINE_WS_PLAYING;
	break;
      case WINE_WM_RESETTING:
	wodPlayer_Reset(wwo, uDevID, TRUE);
	SetEvent(wwo->hEvent);
	break;
      case WINE_WM_CLOSING:
	/* sanity check: this should not happen since the device must have been reset before */
	if (wwo->lpQueuePtr || wwo->lpPlayPtr) ERR("out of sync\n");
	wwo->state = WINE_WS_CLOSED;
	SetEvent(wwo->hEvent);
        DeleteCriticalSection(wwo->msg_crst);
	ExitThread(0);
	/* shouldn't go here */
      default:
	FIXME("unknown message %d\n", msg);
	break;
      }
    }
    if (wwo->state == WINE_WS_PLAYING) {
      TRACE("before wodPlayer_WritFragments\n");
      if (wwo->server_startticks == 0) {
        wwo->server_startticks=GetTickCount(wwo);
      }
      wodPlayer_WriteFragments(wwo);
      TRACE("after wodPlayer_WriteFragments\n");
    }
    TRACE("before wodPlayer_Notify\n");
    wodPlayer_Notify(wwo, uDevID, FALSE);
    TRACE("after wodPlayer_Notify\n");
    
  }
  DeleteCriticalSection(wwo->msg_crst);
  ExitThread(0);
  /* just for not generating compilation warnings... should never be executed */
  return ; 
}



/********************************************************
 *   wodMessage functions:
 */

/**************************************************************************
 * 			wodGetDevCaps				[internal]
 */
static DWORD wodGetDevCaps(UINT16 wDevID, LPWAVEOUTCAPS lpCaps, DWORD dwSize)
{
	TRACE("wodGetDevCaps(%u, %p, %lu);\n", wDevID, lpCaps, dwSize);

    if (lpCaps == NULL) return MMSYSERR_NOTENABLED;

    if (wDevID >= MAX_WAVEOUTDRV) {
	TRACE("MAX_WAVOUTDRV reached !\n");
	return MMSYSERR_BADDEVICEID;
    }

    memcpy(lpCaps, &WOutDevCaps[wDevID], min(dwSize, sizeof(*lpCaps)));
	return MMSYSERR_NOERROR;
}


/**************************************************************************
 * 				wodOpen				[internal]
 */
static DWORD wodOpen(UINT16 wDevID, LPWAVEOPENDESC lpDesc, DWORD dwFlags)
{
    int 	 	audio = -1;
    int			format;
    int			sample_rate;
    int			dsp_stereo;
    int			fragment_size;
    int			audio_fragment;
    char 		audio_dev[500];
#ifdef _SPARC_SOLARIS_
    audio_info_t	audio_info;
#endif
#ifdef USE_PULSEAUDIO
    pa_sample_spec	pa_ss;
#endif
#ifdef USE_AUDIOQUEUE
    AudioStreamBasicDescription	streamdesc = { 0 };
    OSStatus            os_status;
    AudioQueueBufferRef aqueue_bufref;
    int                 i;
#endif
    WINE_WAVEOUT*	wwo;

	TRACE("(%u, %p, %08lX);\n", wDevID, lpDesc, dwFlags);
	if (lpDesc == NULL) {
	  WARN("Invalid Parameter !\n");
		return MMSYSERR_INVALPARAM;
	}
    if (wDevID >= MAX_WAVEOUTDRV) {
	  TRACE("MAX_WAVOUTDRV reached !\n");
		return MMSYSERR_ALLOCATED; // is BADDEVICEID IN NEW CODE
	}

    /* only PCM format is supported so far... */
    if (lpDesc->lpFormat->wFormatTag != WAVE_FORMAT_PCM ||
	lpDesc->lpFormat->nChannels == 0 ||
	lpDesc->lpFormat->nSamplesPerSec == 0) {
	WARN("Bad format: tag=%04X nChannels=%d nSamplesPerSec=%ld !\n", 
	     lpDesc->lpFormat->wFormatTag, lpDesc->lpFormat->nChannels,
	     lpDesc->lpFormat->nSamplesPerSec);
	return WAVERR_BADFORMAT;
	}

    if (dwFlags & WAVE_FORMAT_QUERY) {
	TRACE("Query format: tag=%04X nChannels=%d nSamplesPerSec=%ld !\n", 
	     lpDesc->lpFormat->wFormatTag, lpDesc->lpFormat->nChannels,
	     lpDesc->lpFormat->nSamplesPerSec);
	return MMSYSERR_NOERROR;
	}

    wwo = malloc(sizeof(WINE_WAVEOUT));
    if (wwo == NULL) {
        return MMSYSERR_NOMEM;
    }
    memset(wwo, 0, sizeof(WINE_WAVEOUT));
    memcpy(&(wwo->caps), &WOutDevCaps[0], sizeof(wwo->caps));
#ifdef USE_PULSEAUDIO
    wwo->pa_conn = NULL;
#endif
#ifdef USE_AUDIOQUEUE
    wwo->aqueueref = NULL;
#endif
#ifdef USE_ALSA
    wwo->alsa_handle = NULL;
#endif
#ifdef USE_OSS
    wwo->unixdev = -1;
#endif
    wwo->currentOutputType = AUDIO_OUTPUT_NONE;

    if ((dwFlags & WAVE_DIRECTSOUND) && !(wwo->caps.dwSupport & WAVECAPS_DIRECTSOUND))
	/* not supported, ignore it */
	dwFlags &= ~WAVE_DIRECTSOUND;

    wwo->currentOutputType = AUDIO_OUTPUT_NONE;

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_NONE) {
      if (lpDesc->lpFormat->wBitsPerSample == 8) {
              pa_ss.format = PA_SAMPLE_U8;
      } else {
              pa_ss.format = PA_SAMPLE_S16NE;
      }
      pa_ss.channels = lpDesc->lpFormat->nChannels;
      pa_ss.rate = lpDesc->lpFormat->nSamplesPerSec;
      wwo->pa_conn = pa_simple_new(NULL,
                    "DECtalk",
                    PA_STREAM_PLAYBACK,
                    NULL,
                    "Speech",
                    &pa_ss,
                    NULL,
                    NULL,
                    NULL
                    );
      if (wwo->pa_conn) {
        wwo->currentOutputType = AUDIO_OUTPUT_PULSEAUDIO;
      }
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_NONE) {
      int err;
  const char *a_device = getenv("ALSA_DEFAULT");
  if (a_device == NULL) {
    a_device = "default";
  }
  fprintf(stderr, "Device:%s\n", a_device);
      if ((err = snd_pcm_open(&wwo->alsa_handle, a_device, SND_PCM_STREAM_PLAYBACK, 0)) == 0) {
        snd_pcm_format_t alsa_format;
        if (lpDesc->lpFormat->wBitsPerSample == 8) {
          alsa_format = SND_PCM_FORMAT_U8;
          wwo->alsa_framesize = 1;
        } else {
          alsa_format = SND_PCM_FORMAT_S16_LE;
          wwo->alsa_framesize = 2;
        }
        wwo->alsa_framesize *= lpDesc->lpFormat->nChannels;

        if ((err = snd_pcm_set_params(wwo->alsa_handle,
                                      alsa_format,
                                      SND_PCM_ACCESS_RW_INTERLEAVED,
                                      lpDesc->lpFormat->nChannels,
                                      lpDesc->lpFormat->nSamplesPerSec,
                                      1,
                                      LATENCYMS * 1000)) == 0) {
          snd_pcm_uframes_t buffer_size;
          snd_pcm_uframes_t period_size;

          if(snd_pcm_get_params(wwo->alsa_handle, &buffer_size, &period_size) == 0) {
            wwo->currentOutputType = AUDIO_OUTPUT_ALSA;
            fragment_size = period_size * wwo->alsa_framesize;
          }
        }
      }
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_NONE) {
      GetAudioDev(audio_dev);

      if (access(audio_dev, 0) != 0) {
          free(wwo);
          return MMSYSERR_NOTENABLED;
      }
      if (dwFlags & WAVE_DIRECTSOUND)
          /* we want to be able to mmap() the device, which means it must be opened readable,
           * otherwise mmap() will fail (at least under Linux) */
          audio = open(audio_dev, O_RDWR|O_NDELAY, 0);
      else
          audio = open(audio_dev, O_WRONLY|O_NDELAY, 0);
      if (audio != -1) {
        fcntl(audio, F_SETFD, 1); /* set close on exec flag */
        wwo->unixdev = audio;
        wwo->currentOutputType = AUDIO_OUTPUT_OSS;
      }
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_NONE) {
      streamdesc.mFormatID = kAudioFormatLinearPCM;
      if (lpDesc->lpFormat->wBitsPerSample == 8) {
          streamdesc.mFormatFlags = kAudioFormatFlagIsPacked;
          streamdesc.mBitsPerChannel = 8;
      } else {
          streamdesc.mFormatFlags = kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked;
          streamdesc.mBitsPerChannel = 16;
      }
      streamdesc.mChannelsPerFrame = lpDesc->lpFormat->nChannels;
      streamdesc.mSampleRate = lpDesc->lpFormat->nSamplesPerSec;
      streamdesc.mBytesPerFrame = (streamdesc.mBitsPerChannel * streamdesc.mChannelsPerFrame) / 8;
      streamdesc.mFramesPerPacket = 1;
      streamdesc.mBytesPerPacket = streamdesc.mBytesPerFrame * streamdesc.mFramesPerPacket;
      fragment_size = ((int)(streamdesc.mSampleRate / (1000 / AQBUFFERMS))) * streamdesc.mBytesPerFrame;

      os_status = AudioQueueNewOutput(&streamdesc, audioCallback, wwo, NULL,
                          kCFRunLoopCommonModes, 0, &wwo->aqueueref);
      if (os_status == 0) {
        wwo->aqueue_crst = OP_CreateMutex();
        OP_LockMutex(wwo->aqueue_crst);
        for (i = 0; i < AQBUFFERS; i++) {
          os_status = AudioQueueAllocateBuffer(wwo->aqueueref, fragment_size, &wwo->aqueue_bufref[i]);
          if (os_status != 0) {
              fprintf(stderr, "AudioQueueAllocateBuffer: %d\n", os_status);
              AudioQueueDispose(wwo->aqueueref, 0);
              wwo->aqueueref = NULL;
              OP_UnlockMutex(wwo->aqueue_crst);
              free(wwo);
              return MMSYSERR_NOTENABLED;
          }
          wwo->aqueue_bufref[i]->mAudioDataByteSize = 0;
        }
        wwo->aqueue_buffree = AQBUFFERS;
        wwo->aqueue_currbuf = NULL;
        OP_UnlockMutex(wwo->aqueue_crst);

        os_status = AudioQueueStart(wwo->aqueueref, NULL);
        if (os_status != 0) {
            fprintf(stderr, "AudioQueueStart: %d\n", os_status);
            AudioQueueDispose(wwo->aqueueref, 0);
            wwo->aqueueref = NULL;
            free(wwo);
            return MMSYSERR_NOTENABLED;
        }
        wwo->currentOutputType = AUDIO_OUTPUT_AUDIOQUEUE;
      }
    }
#endif
    if (wwo->currentOutputType == AUDIO_OUTPUT_NONE) {
      WARN("can't open sound device!\n");
      free(wwo);
      return MMSYSERR_ALLOCATED;
    }
    wwo->wFlags = HIWORD(dwFlags & CALLBACK_TYPEMASK);
    
    memcpy(&wwo->waveDesc, lpDesc, 	     sizeof(WAVEOPENDESC));
    memcpy(&wwo->format,   lpDesc->lpFormat, sizeof(WAVEFORMATEX));
    
    if (wwo->format.wBitsPerSample == 0 || (wwo->format.wBitsPerSample >16 )) {
	WARN("Resetting zeroed wBitsPerSample\n");
	wwo->format.wBitsPerSample = 8 *
	    (wwo->format.wf.nAvgBytesPerSec /
	     wwo->format.wf.nSamplesPerSec) /
	    wwo->format.wf.nChannels;
	}
    
    //if (dwFlags & WAVE_DIRECTSOUND) 
    if (0) 
    {
        if (wwo->caps.dwSupport & WAVECAPS_SAMPLEACCURATE)
	    /* we have realtime DirectSound, fragments just waste our time,
	     * but a large buffer is good, so choose 64KB (32 * 2^11) */
	    audio_fragment = 0x0020000B;
	else
	    /* to approximate realtime, we must use small fragments,
	     * let's try to fragment the above 64KB (256 * 2^8) */
	    audio_fragment = 0x01000008;
    } else {
	/* shockwave player uses only 4 1k-fragments at a rate of 22050 bytes/sec
	 * thus leading to 46ms per fragment, and a turnaround time of 185ms
	 */
	/* 16 fragments max, 2^10=1024 bytes per fragment */
	audio_fragment = 0x000F000A;
	}

    sample_rate = wwo->format.wf.nSamplesPerSec;
    dsp_stereo = (wwo->format.wf.nChannels > 1) ? 2 : 1;
    format = (wwo->format.wBitsPerSample == 16) ? 16 : 8;

#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
#ifdef _SPARC_SOLARIS_
      AUDIO_INIT(&audio_info,sizeof(audio_info));
      audio_info.play.precision=format;
      audio_info.play.sample_rate=sample_rate;
      audio_info.play.channels=dsp_stereo;
      if (format==8 && sample_rate==8000)
        audio_info.play.encoding=AUDIO_ENCODING_ULAW;
      else
        audio_info.play.encoding=AUDIO_ENCODING_LINEAR;

      ioctl(audio,AUDIO_SETINFO,&audio_info);
#else
      IOCTL(audio, SNDCTL_DSP_SETFRAGMENT, audio_fragment);
      /* First size and stereo then samplerate */
      IOCTL(audio, SNDCTL_DSP_SAMPLESIZE, format);
      IOCTL(audio, SNDCTL_DSP_CHANNELS, dsp_stereo);
      IOCTL(audio, SNDCTL_DSP_SPEED, sample_rate);
#endif
    }
#endif

    /* paranoid checks */
    if (format != ((wwo->format.wBitsPerSample == 16) ? 16 : 8))
	ERR2("Can't set format to %d (%d)\n", 
	    (wwo->format.wBitsPerSample == 16) ? 16 : 8, format);
    if (dsp_stereo != ((wwo->format.wf.nChannels > 1) ? 2 : 1))
	ERR2("Can't set stereo to %u (%d)\n", 
	    (wwo->format.wf.nChannels > 1) ? 2 : 1, dsp_stereo);
    if (!NEAR_MATCH(sample_rate,wwo->format.wf.nSamplesPerSec))
	ERR2("Can't set sample_rate to %lu (%d)\n", 
	    wwo->format.wf.nSamplesPerSec, sample_rate);

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
      wwo->dwFragmentSize = 1024; /* set this to a useful value */
    }
#endif

#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
      wwo->dwFragmentSize = fragment_size;
    }
#endif

#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
#if defined(_SPARC_SOLARIS_)
      wwo->dwFragmentSize = 1024; /* set this to a useful value */
#else
      /* even if we set fragment size above, read it again, just in case */
      IOCTL(audio, SNDCTL_DSP_GETBLKSIZE, fragment_size);
      if (fragment_size == -1) {
          WARN("IOCTL can't 'SNDCTL_DSP_GETBLKSIZE' !\n");
          close(audio);
          wwo->unixdev = -1;
          free(wwo);
          return MMSYSERR_NOTENABLED;
      }
      wwo->dwFragmentSize = fragment_size;
#endif
    }
#endif

#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
      wwo->dwFragmentSize = fragment_size;
    }
#endif

    wwo->msg_toget = 0;
    wwo->msg_tosave = 0;
    wwo->msg_event = CreateEvent(NULL, FALSE, FALSE, NULL);
    memset(wwo->messages, 0, sizeof(WWO_MSG)*WWO_RING_BUFFER_SIZE);
    wwo->msg_crst = InitializeCriticalSection();

    if (!(dwFlags & WAVE_DIRECTSOUND)) {
	wwo->hEvent = CreateEvent(NULL, FALSE, FALSE, NULL);
	//wwo->hThread = CreateThread(NULL, 0, wodPlayer, (LPVOID)(DWORD)wDevID, 0, &(wwo->dwThreadID));
	wwo->hThread = OP_CreateThread(0, (THREAD_PROCEDURE_T)wodPlayer, (LPVOID)wwo);
	WaitForSingleObject(wwo->hEvent, INFINITE);
    } else {
	wwo->hEvent = (HEVENT_T) INVALID_HANDLE_VALUE;
	wwo->hThread = (HTHREAD_T)INVALID_HANDLE_VALUE;
	wwo->dwThreadID = 0;
    }

    TRACE("fd=%d fragmentSize=%ld\n", 
	  wwo->unixdev, wwo->dwFragmentSize);
    if (wwo->dwFragmentSize % wwo->format.wf.nBlockAlign)
	ERR("Fragment doesn't contain an integral number of data blocks\n");

    TRACE("wBitsPerSample=%u, nAvgBytesPerSec=%lu, nSamplesPerSec=%lu, nChannels=%u nBlockAlign=%u!\n", 
	  wwo->format.wBitsPerSample, wwo->format.wf.nAvgBytesPerSec, 
	  wwo->format.wf.nSamplesPerSec, wwo->format.wf.nChannels,
	  wwo->format.wf.nBlockAlign);
    
    if (OSS_NotifyClient(wwo, WOM_OPEN, 0L, 0L) != MMSYSERR_NOERROR) {
		WARN("can't notify client !\n");
                free(wwo);
		return MMSYSERR_INVALPARAM;
	}
    wwo->server_startticks = 0;
    wwo->qwFragBytes = 0;
    lpDesc->WOutDev = wwo;
    return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodClose			[internal]
 */
static DWORD wodClose(WINE_WAVEOUT *wwo)
{
    DWORD		ret = MMSYSERR_NOERROR;
    THREAD_STATUS_T	ThreadStatus;
#ifdef USE_PULSEAUDIO
    int err;
#endif

    TRACE("(%p);\n", wwo);

    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
    
    if (wwo->lpQueuePtr) {
	WARN("buffers still playing !\n");
	ret = WAVERR_STILLPLAYING;
    } else {
	TRACE("imhere[3-close]\n");
	if (wwo->hEvent != (HEVENT_T)INVALID_HANDLE_VALUE) {
	    wodPlayer_Message(wwo, WINE_WM_CLOSING, 0);
	    WaitForSingleObject(wwo->hEvent, INFINITE);
	    OP_DestroyEvent(wwo->hEvent);
	}
	if (wwo->mapping) {
	    munmap(wwo->mapping, wwo->maplen);
	    wwo->mapping = NULL;
	}

#ifdef USE_AUDIOQUEUE
        if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
          wodPlayer_enqueueCurrentBuffer(wwo);
          OP_LockMutex(wwo->aqueue_crst);
          while(wwo->aqueue_buffree != AQBUFFERS) {
            OP_UnlockMutex(wwo->aqueue_crst);
            WaitForSingleObject(wwo->msg_event, 1);
            OP_LockMutex(wwo->aqueue_crst);
          }
          OP_UnlockMutex(wwo->aqueue_crst);
          AudioQueueDispose(wwo->aqueueref, TRUE);
          wwo->aqueueref = NULL;
          OP_DestroyMutex(wwo->aqueue_crst);
        }
#endif
#ifdef USE_OSS
        if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
	  close(wwo->unixdev);
	  wwo->unixdev = -1;
        }
#endif
#ifdef USE_ALSA
        if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
	  snd_pcm_drain(wwo->alsa_handle);
	  snd_pcm_close(wwo->alsa_handle);
	  wwo->alsa_handle = NULL;
        }
#endif
#ifdef USE_PULSEAUDIO
        if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
	  pa_simple_drain(wwo->pa_conn, &err);
	  pa_simple_free(wwo->pa_conn);
	  wwo->pa_conn = NULL;
        }
#endif
	OP_DestroyEvent(wwo->msg_event);
	wwo->dwFragmentSize = 0;
        wwo->currentOutputType = AUDIO_OUTPUT_NONE;
	if (OSS_NotifyClient(wwo, WOM_CLOSE, 0L, 0L) != MMSYSERR_NOERROR) {
		WARN("can't notify client !\n");
	    ret = MMSYSERR_INVALPARAM;
	}
	OP_WaitForThreadTermination(wwo->hThread, &ThreadStatus, 10000);
        free(wwo);
    }
    return ret;
}

/**************************************************************************
 * 				wodWrite			[internal]
 * 
 */
static DWORD wodWrite(WINE_WAVEOUT *wwo, LPWAVEHDR lpWaveHdr, DWORD dwSize)
{
	TRACE("(%p, %p, %08lX);\n", wwo, lpWaveHdr, dwSize);
    
    /* first, do the sanity checks... */
    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
    
    if (lpWaveHdr->lpData == NULL || !(lpWaveHdr->dwFlags & WHDR_PREPARED)) 
	return WAVERR_UNPREPARED;
    
    if (lpWaveHdr->dwFlags & WHDR_INQUEUE) 
	return WAVERR_STILLPLAYING;

    lpWaveHdr->dwFlags &= ~WHDR_DONE;
    lpWaveHdr->dwFlags |= WHDR_INQUEUE;
    lpWaveHdr->lpNext = 0;

    TRACE("imhere[3-HEADER]\n");
    wodPlayer_Message(wwo, WINE_WM_HEADER, (unsigned long)lpWaveHdr);

	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodPrepare			[internal]
 */
static DWORD wodPrepare(WINE_WAVEOUT *wwo, LPWAVEHDR lpWaveHdr, DWORD dwSize)
{
	TRACE("(%p, %p, %08lX);\n", wwo, lpWaveHdr, dwSize);
    
    if (wwo == NULL) {
	WARN("bad device ID !\n");
	return MMSYSERR_BADDEVICEID;
	}
    
	if (lpWaveHdr->dwFlags & WHDR_INQUEUE)
		return WAVERR_STILLPLAYING;
    
	lpWaveHdr->dwFlags |= WHDR_PREPARED;
	lpWaveHdr->dwFlags &= ~WHDR_DONE;
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodUnprepare			[internal]
 */
static DWORD wodUnprepare(WINE_WAVEOUT *wwo, LPWAVEHDR lpWaveHdr, DWORD dwSize)
{
	TRACE("(%p, %p, %08lX);\n", wwo, lpWaveHdr, dwSize);
    
    if (wwo == NULL) {
	WARN("bad device ID !\n");
	return MMSYSERR_BADDEVICEID;
	}
    
	if (lpWaveHdr->dwFlags & WHDR_INQUEUE)
		return WAVERR_STILLPLAYING;
	
	lpWaveHdr->dwFlags &= ~WHDR_PREPARED;
	lpWaveHdr->dwFlags |= WHDR_DONE;

	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 			wodPause				[internal]
 */
static DWORD wodPause(WINE_WAVEOUT *wwo)
{
    TRACE("(%p);!\n", wwo);
    
    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
    
    TRACE("imhere[3-PAUSING]\n");
    wodPlayer_Message(wwo, WINE_WM_PAUSING, 0);
    WaitForSingleObject(wwo->hEvent, INFINITE);
    
    return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 			wodRestart				[internal]
 */
static DWORD wodRestart(WINE_WAVEOUT *wwo)
{
	TRACE("(%p);\n", wwo);
    
    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
    
    if (wwo->state == WINE_WS_PAUSED) {
	TRACE("imhere[3-RESTARTING]\n");
	wodPlayer_Message(wwo, WINE_WM_RESTARTING, 0);
	WaitForSingleObject(wwo->hEvent, INFINITE);
	}
    
    /* FIXME: is NotifyClient with WOM_DONE right ? (Comet Busters 1.3.3 needs this notification) */
    /* FIXME: Myst crashes with this ... hmm -MM
       if (OSS_NotifyClient(wDevID, WOM_DONE, 0L, 0L) != MMSYSERR_NOERROR) {
               	WARN("can't notify client !\n");
               	return MMSYSERR_INVALPARAM;
        }
    */

	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 			wodReset				[internal]
 */
static DWORD wodReset(WINE_WAVEOUT *wwo)
{
	TRACE("(%p);\n", wwo);
    
    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
    
    TRACE("imhere[3-RESET]\n");
    wodPlayer_Message(wwo, WINE_WM_RESETTING, 0);
    WaitForSingleObject(wwo->hEvent, INFINITE);
    
	return MMSYSERR_NOERROR;
}


/**************************************************************************
 * 				wodGetPosition			[internal]
 */
static DWORD wodGetPosition(WINE_WAVEOUT *wwo, LPMMTIME lpTime, DWORD uSize)
{
	int		time;
    DWORD		val;

	TRACE("(%p, %p, %lu);\n", wwo, lpTime, uSize);
    
    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
    
	if (lpTime == NULL)	return MMSYSERR_INVALPARAM;

    val = wwo->dwPlayedTotal;

    TRACE("wType=%04X wBitsPerSample=%u nSamplesPerSec=%lu nChannels=%u nAvgBytesPerSec=%lu\n", 
	  lpTime->wType, wwo->format.wBitsPerSample, 
	  wwo->format.wf.nSamplesPerSec, wwo->format.wf.nChannels, 
	  wwo->format.wf.nAvgBytesPerSec); 
    TRACE("dwTotalPlayed=%lu\n", val);
    
	switch(lpTime->wType) {
	case TIME_BYTES:
	lpTime->u.cb = val;
		TRACE("TIME_BYTES=%lu\n", lpTime->u.cb);
		break;
	case TIME_SAMPLES:
	lpTime->u.sample = val * 8 / wwo->format.wBitsPerSample;
		TRACE("TIME_SAMPLES=%lu\n", lpTime->u.sample);
		break;
	case TIME_SMPTE:
	time = val / (wwo->format.wf.nAvgBytesPerSec / 1000);
		lpTime->u.smpte.hour = time / 108000;
		time -= lpTime->u.smpte.hour * 108000;
		lpTime->u.smpte.min = time / 1800;
		time -= lpTime->u.smpte.min * 1800;
		lpTime->u.smpte.sec = time / 30;
		time -= lpTime->u.smpte.sec * 30;
		lpTime->u.smpte.frame = time;
		lpTime->u.smpte.fps = 30;
	TRACE("TIME_SMPTE=%02u:%02u:%02u:%02u\n",
		  lpTime->u.smpte.hour, lpTime->u.smpte.min,
		  lpTime->u.smpte.sec, lpTime->u.smpte.frame);
		break;
	default:
	FIXME("Format %d not supported ! use TIME_MS !\n", lpTime->wType);
		lpTime->wType = TIME_MS;
	case TIME_MS:
	lpTime->u.ms = val / (wwo->format.wf.nAvgBytesPerSec / 1000);
	TRACE("TIME_MS=%lu\n", lpTime->u.ms);
		break;
	}
	return MMSYSERR_NOERROR;
}

/**************************************************************************
 * 				wodGetVolume			[internal]
 */
static DWORD wodGetVolume(WINE_WAVEOUT *wwo, LPDWORD lpdwVol)
{
#ifdef USE_OSS
    int 	mixer;
    int		volume;
    DWORD	left, right;
#ifdef _SPARC_SOLARIS_
    audio_info_t	audio_info;
    char	audio_dev[500];
#endif
#endif
    
	TRACE("(%p, %p);\n", wwo, lpdwVol);

    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
    
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {
      if (lpdwVol == NULL) 
        return MMSYSERR_NOTENABLED;
#ifdef _SPARC_SOLARIS_
      AUDIO_INIT(&audio_info,sizeof(audio_info));
      GetAudioDev(audio_dev);
      strcat(audio_dev,"ctl");
      if ((mixer = open(audio_dev, O_RDONLY|O_NDELAY)) < 0) {
          	WARN("mixer device not available !\n");
          	return MMSYSERR_NOTENABLED;
          }
          if (ioctl(mixer, AUDIO_GETINFO, &audio_info) == -1) {
          	WARN("unable read mixer !\n");
          	return MMSYSERR_NOTENABLED;
          }
          close(mixer);
      volume=audio_info.play.gain;
      left=volume;
      right=volume;
      TRACE("left=%ld right=%ld !\n", left, right);
      *lpdwVol = ((left * 0xFFFFl) / AUDIO_MAX_GAIN) + (((right * 0xFFFFl) / AUDIO_MAX_GAIN) << 16);
#else
      if ((mixer = open(MIXER_DEV, O_RDONLY|O_NDELAY)) < 0) {
          	WARN("mixer device not available !\n");
          	return MMSYSERR_NOTENABLED;
          }
          if (ioctl(mixer, SOUND_MIXER_READ_PCM, &volume) == -1) {
          	WARN("unable read mixer !\n");
          	return MMSYSERR_NOTENABLED;
          }
          close(mixer);
      left = LOBYTE(volume);
      right = HIBYTE(volume);
      TRACE("left=%ld right=%ld !\n", left, right);
      *lpdwVol = ((left * 0xFFFFl) / 100) + (((right * 0xFFFFl) / 100) << 16);
#endif
      return MMSYSERR_NOERROR;
    }
#endif
#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
      return MMSYSERR_NOTENABLED;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
      return MMSYSERR_NOTENABLED;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
      return MMSYSERR_NOTENABLED;
    }
#endif
    return MMSYSERR_NOTENABLED;
}


/**************************************************************************
 * 				wodSetVolume			[internal]
 */
static DWORD wodSetVolume(WINE_WAVEOUT *wwo, DWORD dwParam)
{
#ifdef USE_OSS
	int 	mixer;
	int		volume;
    DWORD	left, right;
#ifdef _SPARC_SOLARIS_
	audio_info_t	audio_info;
        char 	audio_dev[500];
#endif
#endif

    TRACE("(%p, %08lX);\n", wwo, dwParam);

    if (wwo == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }

#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO && wwo->pa_conn == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA && wwo->alsa_handle == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE && wwo->aqueueref == NULL) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS && wwo->unixdev == -1) {
      WARN("bad device ID !\n");
      return MMSYSERR_BADDEVICEID;
    }
#endif
 
#ifdef USE_OSS
    if (wwo->currentOutputType == AUDIO_OUTPUT_OSS) {

#ifdef _SPARC_SOLARIS_
      AUDIO_INIT(&audio_info,sizeof(audio_info));
      left  = (LOWORD(dwParam) * AUDIO_MAX_GAIN) / 0xFFFFl;
      right = (HIWORD(dwParam) * AUDIO_MAX_GAIN) / 0xFFFFl;
  
      if (left>right)
  	volume=left;
      else
  	volume=right;
  
      audio_info.play.gain=volume;
  	GetAudioDev(audio_dev);
  	strcat(audio_dev,"ctl");
      	if ((mixer = open(audio_dev, O_WRONLY|O_NDELAY)) < 0) {
  		WARN("mixer device not available !\n");
  		return MMSYSERR_NOTENABLED;
  		}
      	if (ioctl(mixer,AUDIO_SETINFO,&audio_info)<0) {
  	        WARN("unable set mixer !\n");
  		close(mixer);
  		return MMSYSERR_NOTENABLED;
  	}
  	close(mixer);
  	if (wDevID != 65535 )
  	{
      		if (ioctl((&WOutDev[wDevID])->unixdev,AUDIO_SETINFO,&audio_info)<0) {
  	       	 	WARN("unable set mixer !\n");
  			return MMSYSERR_NOTENABLED;
  		}
  	}
	
#else
      left  = (LOWORD(dwParam) * 100) / 0xFFFFl;
      right = (HIWORD(dwParam) * 100) / 0xFFFFl;
      volume = left + (right << 8);
      
      if ((mixer = open(MIXER_DEV, O_WRONLY|O_NDELAY)) < 0) {
  		WARN("mixer device not available !\n");
  		return MMSYSERR_NOTENABLED;
  		}
  	if (ioctl(mixer, SOUND_MIXER_WRITE_PCM, &volume) == -1) {
  	        WARN("unable set mixer !\n");
  		close(mixer);
  		return MMSYSERR_NOTENABLED;
      } else {
  	TRACE("volume=%04x\n", (unsigned)volume);
  		}
  	close(mixer);
#endif
    }
    return MMSYSERR_NOERROR;
#endif
#ifdef USE_PULSEAUDIO
    if (wwo->currentOutputType == AUDIO_OUTPUT_PULSEAUDIO) {
      return MMSYSERR_NOTENABLED;
    }
#endif
#ifdef USE_ALSA
    if (wwo->currentOutputType == AUDIO_OUTPUT_ALSA) {
      return MMSYSERR_NOTENABLED;
    }
#endif
#ifdef USE_AUDIOQUEUE
    if (wwo->currentOutputType == AUDIO_OUTPUT_AUDIOQUEUE) {
      return MMSYSERR_NOTENABLED;
    }
#endif
    return MMSYSERR_NOTENABLED;
}

/**************************************************************************
 * 				wodGetNumDevs			[internal]
 */
static	DWORD	wodGetNumDevs(void)
{
    DWORD	ret = 0;

#ifdef USE_PULSEAUDIO
    ret++;
#endif
#ifdef USE_ALSA
    ret++;
#endif
#ifdef USE_AUDIOQUEUE
    ret++;
#endif
#ifdef USE_OSS
    ret++;
#endif
    /* FIXME */
    if (ret > 1)
        ret = 1;
#if 0
    char audio_dev[500];
    int audio;
    
    GetAudioDev(audio_dev);
    /* FIXME: For now, only one sound device (SOUND_DEV) is allowed */
    audio = open(audio_dev, O_WRONLY|O_NDELAY, 0);
    
    if (audio == -1) {
	if (errno != EBUSY)
	    ret = 0;
    } else {
	close(audio);
    }
#endif
    return ret;
}

/**************************************************************************
 * 				wodMessage     
 */
DWORD OSS_wodMessage(void *WOutDev, UINT wMsg, unsigned long dwUser, 
		 unsigned long dwParam1, unsigned long dwParam2)
{
    WINE_WAVEOUT *wwo = WOutDev;
    UINT16 *uDeviceID = WOutDev;
    TRACE("(%p, %04X, %08lX, %08lX, %08lX);\n",
		wwo, wMsg, dwUser, dwParam1, dwParam2);
        
	switch(wMsg) {
		/* FIXME: Pass device type to wodOpen! */
	case WODM_OPEN:
		return wodOpen(*uDeviceID, (LPWAVEOPENDESC)dwParam1, dwParam2);
	case WODM_CLOSE:
		return wodClose(wwo);
	case WODM_WRITE:
		return wodWrite(wwo, (LPWAVEHDR)dwParam1, dwParam2);
	case WODM_PAUSE:
	 	return wodPause		(wwo);
	case WODM_GETPOS:
		return wodGetPosition(wwo, (LPMMTIME)dwParam1, dwParam2);
	case WODM_BREAKLOOP:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_PREPARE:
		return wodPrepare(wwo, (LPWAVEHDR)dwParam1, dwParam2);
	case WODM_UNPREPARE:
		return wodUnprepare(wwo, (LPWAVEHDR)dwParam1, dwParam2);
	case WODM_GETDEVCAPS:
		return wodGetDevCaps	(*uDeviceID, (LPWAVEOUTCAPS)dwParam1,	dwParam2);
	case WODM_GETNUMDEVS:
		return wodGetNumDevs	();
	case WODM_GETPITCH:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_SETPITCH:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_GETPLAYBACKRATE:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_SETPLAYBACKRATE:
		return MMSYSERR_NOTSUPPORTED;
	case WODM_GETVOLUME:
		return wodGetVolume(wwo, (LPDWORD)dwParam1);
	case WODM_SETVOLUME:
		return wodSetVolume(wwo, dwParam1);
	case WODM_RESTART:
		return wodRestart(wwo);
	case WODM_RESET:
		return wodReset(wwo);

	default:
	FIXME("unknown message %d!\n", wMsg);
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
BOOL16 DriverCallback(void (*dwCallBack)(void *, unsigned int,  unsigned int,  long int,  long int), UINT16 uFlags, HANDLE16 hDev, 
                             WORD wMsg, DWORD dwUser, long dwParam1, long dwParam2)
{
  //LPWAVEOPENDESC	lpDesc; // MGS warning removal
  
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


/*
 * @DEC_COPYRIGHT@
 *    © SMART Modular Technologies 1999. All rights reserved.    
 */
/*
 * HISTORY
 * Revision 1.1.2.2  1995/07/05  19:35:54  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:46  Krishna_Mangipudi]
 *
 * Revision 1.2.2.4  1995/03/17  15:23:28  Krishna_Mangipudi
 * 	Rearrange Include files
 * 	[1995/03/17  15:22:58  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.3  1994/11/09  15:59:02  Krishna_Mangipudi
 * 	V4.2 SSB
 * 	[1994/11/08  22:12:11  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  23:08:39  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:14:57  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
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

/*****************************************************************************
**  PROGRAM:
**     playaf.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
** 	Player for handling VTM output to the Audio File device driver.
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
**     10 Aug 94   KM   Move time interval structure into mbuf.h so it
**                       is accessable to mbuf.c
**     14 Sep 94   KM   Added code in AF_sync_audio to wait for all the
**                      text to complete playback.
**                         - made t_next global static.
**                         - Added while loop in AF_sync_audio to sync up
**
*****************************************************************************/

/*
 *************************************************************************
 *
 * The following require AF_SERVER to be defined at compile time:
 * AF_play_init        - establish an AudioFile server connection
 * AF_play_main        - AudioFile server thread pump
 *
 *************************************************************************
 */

#ifdef AF_SERVER

#include "dtmmedefs.h"
#include "audioapi.h"
#include <stdio.h>
#include <time.h>
#include "mbuf.h"
#include "pcr.h"
#include <AF/AFlib.h>
#include "tts.h"
#include "ttsapi.h"

/*
 * extern function declartions
 */
extern MMRESULT parseWaveFormatOptions( LPTTS_HANDLE_T );
extern unsigned char LinearToMuLaw( short );
extern PCR player_control; /* player control register */
extern P_MBUF play_mbuf; /*  mbuf handle for reading and thread termination */

/*
 * AudioFile connection data
 */
static AFAudioConn *aud = NULL;
static AC ac;
static AFSetACAttributes attributes;
static struct timeval StartTime;
static ATime t_next;
int globalSampleRate;


/* 
 * Convert data type to sample size.  Should this be in the AF include
 * file somewhere for everyone to use?  See the type encodings in 'audio.h'
 */
static int sample_sizes[] = 
{
	1,		/* MU255 */
	1,		/* ALAW */
	2,		/* Linear PCM, 16 bits, -1.0 <= x < 1.0 */
	2,		/* Linear PCM, 32 bits, -1.0 <= x < 1.0 */
	1,		/* G.721, 64Kbps to/from 32Kbps. */
	1,		/* G.723, 64Kbps to/from 32Kbps. */
	0
};

#define SS_PLAYING     1     /* audio_server_state playing */
#define SS_SILENT      2     /* audio_server_state silent  */
#define SECONDS_MAXB   1.5   /* maximum buffered playing time */
#define SECONDS_DELAY  0.7   /*  delay offset */
#define BUFSIZE        4096  /* 2048 */  /* buffer size, in samples */

/*
 *************************************************************************
 *
 * FindDefaultDevice 
 *
 *    Finds a good device if the device specified by user is bad.
 *
 *************************************************************************
 */
int FindDefaultDevice(AFAudioConn *aud)
{
        AFDeviceDescriptor *aDev;
        int     i;

        for(i=0; i<ANumberOfAudioDevices(aud); i++) {
                aDev = AAudioDeviceDescriptor(aud, i);
                if(aDev->inputsFromPhone == 0 && aDev->outputsToPhone == 0)
                        return i;
        }
        return -1;
}

/*
 *************************************************************************
 *
 * AF_play_init
 *
 * establish AudioFile server connection
 * returns zero on error, non-zero otherwise
 *
 *************************************************************************
 */
AF_play_init( LPTTS_HANDLE_T ttsHandle, int *blksiz )
{
   MMRESULT err_num;
   int device;
   char *audname = "";

   device = ttsHandle->uiDeviceId;

   /*
    * set error return value (assume the worst)
    */
   *blksiz = 0;

#ifdef TTSDBG
printf("AF_play_init\n");
#endif 
   /*
    * attempt server connection
    */
   if ( ( aud = AFOpenAudioConn(audname) ) == NULL )
	return( 0 );
   gettimeofday( &StartTime, (struct timezone *) NULL);

   /* set up audio context, find sample size and sample rate */
    if((device < 0) || (device >= aud->ndevices))
    {
        device = FindDefaultDevice(aud);
        if ( device < 0 )     /* No audio device */
            return( 0 );
    }
   err_num = parseWaveFormatOptions( ttsHandle );
   if ( err_num != MMSYSERR_NOERROR )
      return ( err_num );

   attributes.preempt = Mix;
   attributes.start_timeout = 0;
   attributes.end_silence = 0;
   attributes.play_gain = 0;
   attributes.rec_gain =  0;

   /*
    * setup audio context
    */
   if ( ( ac = AFCreateAC(aud, device, ACPlayGain, &attributes) ) == NULL )
   {
      AFCloseAudioConn( aud );
      return( 0 );
   }
   AFSync(aud, 0);
#ifdef TTSDEB
printf("setup audio context done...\n");
   /*
    * if sample size is not 1, issue a message
    */
   if ( sample_sizes[ ac->device->playBufType ] != 1 )
      fprintf(stderr,"aplay: unsupported sample size: %d.\n",
         sample_sizes[ ac->device->playBufType ]);
   /*
    * if Nchannels is not 1, issue a message
    */
   if ( ac->device->playNchannels != 1 )
      fprintf(stderr,"aplay: unsupported Nchannels: %d.\n",
         ac->device->playNchannels);
#endif

   /*
    * find mbuf block size
    */
   *blksiz = BUFSIZE * sample_sizes[ ac->device->playBufType ] * 
                             ac->device->playNchannels ;

#ifdef TTSDEB
printf("init done\n");
#endif

   return( 1 );
}
/*
 * Convert data to appropriate format.
 */
ConvertData ( unsigned short *data, int length )
{
  int bufno, segno;
  UINT i;
  unsigned char * pTemp;
  unsigned short *pSource;
  LPTTS_HANDLE_T ttsHandle;
                                      
  ttsHandle = TextToSpeechGetHandle();
  switch( ttsHandle->dwFormat )
  {
  case WAVE_FORMAT_1M16:
  case WAVE_FORMAT_08M16:

    length = length * 2;
    break;

  case WAVE_FORMAT_1M08:

    pSource = data;
    pTemp = (unsigned char *)data;

    for ( i = 0; i < length; i++ )
      *pTemp++ = ((unsigned char)((*pSource++) >> 8)) ^ 0x80;
    break;

  case WAVE_FORMAT_08M08:

    pSource = data;
    pTemp = (unsigned char *)data;

    for ( i = 0; i < length; i++ )
      *pTemp++ = LinearToMuLaw( *pSource++ );

    break;
  }
}
/*
******************************************************************************
**
**  af_get_audio_position
**
**  FUNCTIONAL DESCRIPTION:
**
**  This function returns the position of the last sample
**    played by the wave output device since it was last opened.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
MMRESULT af_get_audio_position( DWORD *pdwPosition )
{
  struct timeval timenow;
  int ms;

  gettimeofday( &timenow, (struct timezone *) NULL );
  ms = DiffTime( &timenow, &StartTime );
  *pdwPosition = ms * globalSampleRate;

}

/*
 *************************************************************************
 *
 * aplay thread entry point
 *
 *************************************************************************
 */
AF_play_main( pthread_addr_t arg )
{
    ATime t_now, t_recv; /* t_next is now a global statatic */
    int nsamp_delay, nsamp_maxb;
    int nbytes, nsamples;
    unsigned short *buf;
    int ssize;				/* sample size, in bytes */
    int srate;				/* sample rate, per second */
    AEncodeType	type;
    unsigned int channels;
    int audio_server_state = SS_SILENT;
    int terminate = 0;

#ifdef TTSDBG 
printf("AF_play_main\n");
#endif
    /*
     * find sample size and sample rate
     */
    srate    = ac->device->playSampleFreq;
    type     = ac->device->playBufType;
    channels = ac->device->playNchannels;
    ssize    = sample_sizes[type] * channels;

    globalSampleRate = srate;
    /*
     * set 'nsamp_delay' and 'nsamp_maxb'
     */
    nsamp_delay = SECONDS_DELAY * srate;
    nsamp_maxb  = SECONDS_MAXB  * srate;

    /*
     * lock PCR mutex
     */
    if ( pthread_mutex_lock( &player_control.pcr_lock ) != 0 )
    {
	perror("play");
	pthread_exit( (int)arg );
    }

    /*
     * do this forever until pcr_status requests a termination
     */
    while( ! terminate )
    {
	struct timespec pst; /* player sample time-out interval */

	if ( player_control.pcr_state == PLAYER_PAUSED )
	{
	    /*
	     * wait for PCR status to change
	     */
	    while( player_control.pcr_status == PCR_PAUSE )
	    {
		if ( pthread_cond_wait(
			&player_control.pcr_broadcast_status,
			&player_control.pcr_lock ) != 0 )
		{
		    perror("play");
		    break;
		}
	    }
	}
	else
	{
	    struct timespec *interval;

	    /*
	     * do a timed wait on PCR status change
	     */
	    if ( player_control.pcr_state == PLAYER_ABORTING )
		interval = &abort_interval;
	    else
		interval = &timeout_interval;

	    pthread_get_expiration_np( interval, &pst );
	    pthread_cond_timedwait(
		&player_control.pcr_broadcast_status,
		&player_control.pcr_lock,
		&pst );
	}

	switch( player_control.pcr_status )
	{
	    case PCR_PAUSE:

		if ( player_control.pcr_state != PLAYER_PAUSED )
		{
		    /*
		     * comply
		     */
		    player_control.pcr_state = PLAYER_PAUSED;
		    if ( pthread_cond_broadcast
                          ( &player_control.pcr_broadcast_state ) != 0 )
		    {
			perror("play");
			break;
		    }
		}

		break;

	    case PCR_RUN:

		if ( player_control.pcr_state != PLAYER_RUNNING )
		{
		    /*
		     * comply
		     */
		    player_control.pcr_state = PLAYER_RUNNING;
		    if ( pthread_cond_broadcast
                         ( &player_control.pcr_broadcast_state ) != 0 )
			perror("play");

		    break;
		}

		/*
		 * check AF server time, let's not get too far ahead
		 */
		t_now = AFGetTime( ac );

		/*
		 * if the AF server is currently playing audio, stop here
		 * when meeting a given threshold (nsamp_max)
		 */
		if ( audio_server_state == SS_PLAYING )
		{
		    if ( t_next < ( t_now + nsamp_delay ) )
		    {
			audio_server_state = SS_SILENT;
		    }
		    else if ( t_next > ( t_now + nsamp_maxb ) )
		    {
			break; /* wait a while */
		    }
		}

		/*
		 * play some data, if available
		 */
		switch ( read_mbuf_nonblock( play_mbuf, &buf, &nbytes ) )
		{
		    case RSTAT_ENDOFFRAME:
		    case RSTAT_FULLBLOCK:
			/*
			 * set start time
			 */
			if ( audio_server_state == SS_SILENT )
			    t_next = t_now + nsamp_delay;

			/*
			 * play it and increment t_next
			 */
			nsamples = (nbytes/ssize);
                        ConvertData( buf, nsamples );
			t_recv = AFPlaySamples(ac, t_next, nsamples, buf);
			if ( t_recv > t_next )
			{
#ifdef TTSDBG
		           fprintf(stderr, "AF_play_main: out of sync with AudioFile server: recovering.\n");
#endif
			    t_next = t_recv + nsamples + nsamp_delay;
			}
			else
			    t_next += nsamples;

			/*
			 * set audio server state
			 */
			audio_server_state = SS_PLAYING;

			break;

		    case RSTAT_ERROR:
		    case RSTAT_CLOSED:
			terminate = 1;
			break;

		    case RSTAT_PAUSED:
		    case RSTAT_EWOULDBLOCK:
			break;

		}

		break;

	    case PCR_ABORT:

		if ( player_control.pcr_state != PLAYER_ABORTING )
		{
		    /*
		     * comply
		     */
/*		    fprintf(stderr,"player thread aborting ... \n"); */
		    player_control.pcr_state = PLAYER_ABORTING;
		    if ( pthread_cond_broadcast
                          ( &player_control.pcr_broadcast_state ) != 0 )
			perror("play");

		    break;
		}

		/*
		 * toss some data, if available
		 */
		switch ( read_mbuf_nonblock( play_mbuf, &buf, &nbytes ) )
		{
		    case RSTAT_ENDOFFRAME:
		    case RSTAT_FULLBLOCK:
		    case RSTAT_PAUSED:
		    case RSTAT_EWOULDBLOCK:
			break;

		    case RSTAT_ERROR:
		    case RSTAT_CLOSED:
			terminate = 1;
			break;
		}
		break;

	}

    } /* while ( ! terminate ) */

    /*
     * release player control register
     */
    if ( pthread_mutex_unlock( &player_control.pcr_lock ) != 0 )
	perror("play");

    pthread_exit( (int)arg );
}

int DiffTime(struct timeval * t1,
             struct timeval * t2)
{
        int ms;
        struct timeval t;
        /* Create a time offset. */

        t.tv_sec = t1->tv_sec - t2->tv_sec;
        t.tv_usec = t1->tv_usec - t2->tv_usec;

        /* Check microseconds. */

        if (t.tv_usec < 0) {
                t.tv_sec--;
                t.tv_usec += 1000000;
        }

        ms = (t.tv_sec * 1000 + t.tv_usec/1000);

        return(ms);
}

AF_sync_audio()
{
   ATime now = 0;

   /* 
    * AFSync for some reason does not block
    * so had to put this while loop in to
    * sync up with the server.
    */
   while ( now < t_next )
   {
      now = AFGetTime( ac );
      sleep (1);
   }

   AFSync( ac, FALSE );
}
 
#endif /* AF_SERVER */

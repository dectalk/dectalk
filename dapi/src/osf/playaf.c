/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	27	05/21/97	leeber	Build 109 V4.60.04 R003 04/22/99; Freeze Mark; No matching AD Mark. 04/27/99 cjl
	26	05/21/97	leeber	Build 109 V4.60.03 R003 03/31/99 Freeze Mark 04/02/99 cjl
	25	05/21/97	leeber	Build 108 V4.60.02 B002 01/29/99, Freeze Mark, 02/25/99 cjl
	24	05/21/97	leeber	Files verified as different on both WinDif and StarTeam for chnages between AD and RND. 02/01/99 cjl
	23	05/21/97	leeber	AD->RND Pre-V4.60.01 B002 Freeze Transfer, 01/19/99 cjl
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

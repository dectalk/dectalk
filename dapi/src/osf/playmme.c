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
 * Revision 1.1.2.3  1996/01/03  21:08:32  Bill_Hallahan
 * 	Obsolete
 * 	[1996/01/03  21:02:36  Bill_Hallahan]
 *
 * Revision 1.1.2.2  1995/07/05  19:35:56  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:49  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.4  1995/03/17  15:23:32  Krishna_Mangipudi
 * 	Rearrange Include files
 * 	[1995/03/17  15:23:00  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.3  1994/11/09  15:59:04  Krishna_Mangipudi
 * 	V4.2 SSB
 * 	[1994/11/08  22:12:26  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  23:08:47  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:15:12  Krishna_Mangipudi]
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
**     playmme.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**      This file contains the device driver interface modules that are
**      responsible for talking to the MME server.
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
******************************************************************************/

#ifdef MME_SERVER
/*
 * Include files
 */
#include <stdio.h>
#include <signal.h>
#include <timers.h>
#include <time.h>
#include <mme/mmsystem.h>
#include <mme/mme_api.h>
#include "audioapi.h"
#include "mbuf.h"
#include "pcr.h"
#include "tts.h"
#include "play.h"
#include "samprate.h"

/*
 * extern function declarations
 */
extern unsigned char LinearToMuLaw( short );
extern MMRESULT parseWaveFormatOptions( LPTTS_HANDLE_T );
/*
 * player control register
 */
extern PCR player_control;
/*
 * mbuf handle for reading and thread termination
 */
extern P_MBUF play_mbuf;
/*
** Local functions
*/
void playCallback(HANDLE hWaveOut, UINT   wMsg, DWORD  dwInstance,
		LPARAM lParam1,	LPARAM lParam2);
void playData(	HANDLE hWaveOut, unsigned short *data, int length);
int  initializeBuffers();
void freeBuffers();
void markBufferNotInUse(char *lpData);
void waitForAllBuffers();
/*
** Globals
*/
  buffer_t buffers[MAX_BUFFERS];
  char     buffer[sizeof(PCMWAVEFORMAT)];
  UINT     uDeviceId = WAVE_MAPPER;
  static   HWAVEOUT hWaveOut = NULL;
  static   LPWAVEHDR WaveHdr_p = NULL;

  /* This is for the MME V1.0 workaround */
  static   struct timeval StartTime;
  UINT	   globalSampleRate;

#ifdef DEBUG
  static   FILE * fileptr3;
#endif
/*****************************************************************************
**
**  toggle_mutex 
**
**  FUNCTIONAL DESCRIPTION:
**
**     This routine either reserves or releases a semaphore.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
****************************************************************************
*/
toggle_mutex(int flag)
{
   switch(flag)
   {
      case MUTEX_RESERVE :
         pthread_mutex_lock( &mmeAccess_mutex);
         break;
      case MUTEX_RELEASE :
         pthread_mutex_unlock( &mmeAccess_mutex);
         break;
   }
}
/*******************************************************************************
**
**   setDevFormat
**
**  FUNCTIONAL DESCRIPTION:
**
**   If the device format is not specified by the user then setDevFormat 
**   picks the best available for our purposes.
**    
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
MMRESULT setDevFormat( LPTTS_HANDLE_T ttsHandle )
{
  MMRESULT mmStatus = MMSYSERR_NOERROR; 
  LPWAVEOUTCAPS WaveOutCaps_p = NULL;
  int i, max_wave_in_devices;
  DWORD dwFormatMask;
  int priority = 3;

  /*
   * Check to see the output device format is indeed not specified.
   */
  if ( (ttsHandle->dwDeviceOptions & 0xffff) == 0)
  {
    toggle_mutex(MUTEX_RESERVE);
    max_wave_in_devices = waveOutGetNumDevs ();
    WaveOutCaps_p = (WAVEOUTCAPS*) mmeAllocMem (sizeof (WAVEOUTCAPS));
    toggle_mutex(MUTEX_RELEASE);

    if ( WaveOutCaps_p == NULL)
       return MMSYSERR_NOMEM;

    priority = 3;
    dwFormatMask  =  WAVE_FORMAT_08M08;

    for (i = 0; i < max_wave_in_devices; i++)
    {
       toggle_mutex(MUTEX_RESERVE);
       mmStatus = waveOutGetDevCaps(i, WaveOutCaps_p, sizeof (WAVEOUTCAPS));
       toggle_mutex(MUTEX_RELEASE);

       if( mmStatus != MMSYSERR_NOERROR )
          return( mmStatus );

       if ( (WaveOutCaps_p->dwFormats & WAVE_FORMAT_1M16) && 
                                (priority > 1) )
       {
          dwFormatMask  =  WAVE_FORMAT_1M16;
          priority = 1;
       }
       else if ( (WaveOutCaps_p->dwFormats & WAVE_FORMAT_1M08) &&
                               (priority > 2) )
       {
          dwFormatMask  =  WAVE_FORMAT_1M08;
          priority = 2;
       }
       if ( priority == 1)
          break;
    }
    
    ttsHandle->dwDeviceOptions |= dwFormatMask;

    toggle_mutex(MUTEX_RESERVE);
    mmeFreeMem(WaveOutCaps_p);
    toggle_mutex(MUTEX_RELEASE);
  }

  return ( mmStatus );
}

/*******************************************************************************
**
**  MME_play_init
**
**  FUNCTIONAL DESCRIPTION:
**    
**     This routine initializes the data structures used to talk to 
**     a MME driver. 
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
MMRESULT MME_play_init( LPTTS_HANDLE_T ttsHandle )
{
   char proc_name[]="MME_play_init";
   pthread_mutex_t Local_mmeAccess_mutex;
   LPPCMWAVEFORMAT pcmOut_p;
   DWORD    dwFlags;
   MMRESULT err_num = MMSYSERR_NOERROR;
   char     specific_err[MAX_ERR_STRING+1];

#ifdef TTSDBG 
  fprintf(stderr,"%s:Driver Opened the device\n", proc_name);
#endif

  /*
   * Initialize the global mutex variable, mmeAccess_mutex
   */
  if (pthread_mutex_init (&Local_mmeAccess_mutex,
                                   pthread_mutexattr_default) != 0)
  {
#ifdef TTSDBG
          fprintf(stderr,"TextToSpeechStartup Error creating mme mutex!\n");
#endif
             return ( MMSYSERR_NOTENABLED );
  }
  mmeAccess_mutex = Local_mmeAccess_mutex;
  toggle_mutex(MUTEX_RESERVE);
  ttsHandle->uiNumberOfDevices = waveOutGetNumDevs();
  toggle_mutex(MUTEX_RELEASE);
  if (ttsHandle->uiNumberOfDevices <= 0) 
  {
#ifdef TTSDBG
    fprintf(stderr, "Could not find any wave devices\n");
    fprintf(stderr ,"Is the MM server ready? \n");
    fprintf(stderr, "Exiting\n");
#endif
    return( MMSYSERR_BADDEVICEID );
  }

  /*
   * Check and setup the device
   */
   uDeviceId = ttsHandle->uiDeviceId;
   dwFlags = ttsHandle->dwFlags;
  /*  
   * Pick the best format that the
   * device can support if uiDeviceId == WAVE_MAPPER
   * and if the format is not specified.
   */
   if ( (ttsHandle->dwDeviceOptions & 0xffff) == 0 )
   {
      err_num = setDevFormat( ttsHandle );
      if ( err_num != MMSYSERR_NOERROR )
         return ( err_num );
   }

   err_num = parseWaveFormatOptions( ttsHandle );
   if ( err_num != MMSYSERR_NOERROR )
      return ( err_num );

   /*
    * Setup the pcm format structure.
    */
   toggle_mutex(MUTEX_RESERVE);
   pcmOut_p = (LPPCMWAVEFORMAT)mmeAllocMem(sizeof(PCMWAVEFORMAT));
   toggle_mutex(MUTEX_RELEASE);

   if (pcmOut_p == NULL) 
   {
#ifdef TTSDBG 
     fprintf(stderr, "Can't allocate shared memory\n");
     fprintf(stderr, "Server might be down?\n");
     fprintf(stderr, "Exiting\n");
#endif
     return( MMSYSERR_NOMEM );
   }
   pcmOut_p->wf.wFormatTag  = ttsHandle->uiFormatTag;
   pcmOut_p->wf.nChannels   = ttsHandle->uiChannel;
   pcmOut_p->wf.nBlockAlign = ttsHandle->uiBlockAlign;
   pcmOut_p->wf.nSamplesPerSec = (UINT) ttsHandle->uiSampleRate;
   pcmOut_p->wf.nAvgBytesPerSec = (UINT) ttsHandle->uiSampleRate
                * ttsHandle->uiChannel * (ttsHandle->uiBitRate/8); 
   pcmOut_p->wBitsPerSample = ttsHandle->uiBitRate;

   /*
    * If the output device is WAVE_MAPPER, dwFlags is set to
    * WAVE_FORMAT_QUERY.  This means that the waveOutOpen
    * call only checks to see if there is a wave out device
    * that supports all the specifications in pcmOut; the
    * device is not actually opened.
    */
   toggle_mutex(MUTEX_RESERVE);
   err_num = waveOutOpen(&hWaveOut, uDeviceId, &(pcmOut_p->wf), 
		playCallback, 0L, dwFlags);
   toggle_mutex(MUTEX_RELEASE);

   /* this is for the workaround until MME V1.1 is released */
   gettimeofday( &StartTime, (struct timezone *) NULL );
   globalSampleRate = (UINT) ttsHandle->uiSampleRate;

   /*
    * Free the pcm format structure.
    */
   toggle_mutex(MUTEX_RESERVE);
   mmeFreeMem(pcmOut_p);
   toggle_mutex(MUTEX_RELEASE);

   if (err_num != MMSYSERR_NOERROR)
   {
#ifdef TTSDBG  
     toggle_mutex(MUTEX_RESERVE);
     waveOutGetErrorText(err_num, specific_err, MAX_ERR_STRING);
     toggle_mutex(MUTEX_RELEASE);
     fprintf(stderr, "1. Error: %s\n", specific_err);
#endif  
     return( err_num );
   }

  /*
   * If the output device is WAVE_MAPPER, then get the
   * device id and call waveOutOpen to open the output
   * device.
   */
  if ((int)uDeviceId == WAVE_MAPPER) 
  {
     toggle_mutex(MUTEX_RESERVE);
     waveOutGetID(hWaveOut, &uDeviceId);
     toggle_mutex(MUTEX_RELEASE);
     ttsHandle->uiDeviceId = uDeviceId;
  }
  return( MMSYSERR_NOERROR );
} /* end MME_play_init */

/*
******************************************************************************
**
** findNextSegment
**
**  FUNCTIONAL DESCRIPTION:
**
**    Checks the buffers' segment until it hits a segment that is
**    not in use.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**    int - The index, in an array, of a buffer segment
**          that is not in use.
**
*****************************************************************************
*/
char findNextSegment(int *bufno, int *segno)
{
   int i,j;
   static next = 0;

   for (i=0; i < MAX_BUFFERS; i++)
   {
      for (j=0; j < MAX_SEGMENTS; j++)
      {
	 /* This forces a circular queue to be truely circular */
	 next = ( next + j ) & MOD_SEGMENT_MASK;
         if (buffers[i].not_in_use[next] == TRUE)
         {
            *bufno = i;  *segno = next;
            return( TRUE );
         }
      }
   }
   return(FALSE);
}

/*
*****************************************************************************
**
**  MME_play_main
**
**  FUNCTIONAL DESCRIPTION:
**   
**    This routine forms the entry point of the play thread.  It
**    is called by the API's startup routine.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/

int MME_play_main( pthread_addr_t arg )
{
    int nbytes;
    unsigned short *buf;
    int terminate = 0;
    char proc_name[]="MME_play_main";
    int status;
    int bufno, segno;

    /*
     * Initialize buffers
     */
    if (initializeBuffers() == 0)
    {
       return(0);
    }

    /*
     * lock PCR mutex
     */
    if ( pthread_mutex_lock( &player_control.pcr_lock ) != 0 )
    {
        perror("play");
        pthread_exit( (pthread_addr_t)arg );
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
#ifdef DEB_MME
		 printf("status: PCR_PAUSE\n");
#endif

                if ( player_control.pcr_state != PLAYER_PAUSED )
                {
                    /*
                     * comply
                     */
#ifdef DEB_MME
                    fprintf(stderr,"player thread pausing ... \n"); 
#endif
                    player_control.pcr_state = PLAYER_PAUSED;
                    if ( pthread_cond_broadcast( 
			&player_control.pcr_broadcast_state ) != 0 )
                    {
                        perror("play");
                        break;
                    }
                }

                break;

            case PCR_RUN:
#ifdef DEB_MME
 		 fprintf(stderr,"status: PCR_RUN");
#endif

                if ( player_control.pcr_state != PLAYER_RUNNING )
                {
                    /*
                     * comply
                     */
#ifdef DEB_MME
                    fprintf(stderr,"player thread running ... \n"); 
#endif
                    player_control.pcr_state = PLAYER_RUNNING;
                    if ( pthread_cond_broadcast( 
			&player_control.pcr_broadcast_state ) != 0 )
                        perror("play");

                    break;
                }
#ifdef DEB_MME
		switch( player_control.pcr_state)
		{
		    case PLAYER_RUNNING:
			fprintf(stderr," state: PLAYER_RUNNING\n");
			break;
		    case PLAYER_PAUSED:
			fprintf(stderr," state: PLAYER_PAUSED\n");
			break;
		    case PLAYER_ABORTING:
			fprintf(stderr," state: PLAYER_ABORTING\n");
			break;
		}
#endif
                /*
                 * play some data, if available
                 */
                if (findNextSegment(&bufno,&segno))
                {
		   status = read_mbuf_nonblock( play_mbuf, &buf, &nbytes );
                   switch ( status )
                   {
		      int remaining;
                      unsigned short *buf_ptr;
 		      int length;

                      case RSTAT_ENDOFFRAME:
                      case RSTAT_FULLBLOCK:
			  buf_ptr = buf;
			  remaining = nbytes;
			  length = ( remaining > BUFFER_SIZE ) ?
				    BUFFER_SIZE : remaining;

			  playData(hWaveOut, buf_ptr, length);

                          toggle_mutex(MUTEX_RESERVE);
			  if ( mmeCheckForCallbacks() )
			     mmeProcessCallbacks();
                          toggle_mutex(MUTEX_RELEASE);

			  remaining -= length;
			  if ( remaining > 0 )
			  {
			     buf_ptr += length;
			     length = ( remaining > BUFFER_SIZE ) ?
                                    BUFFER_SIZE : remaining;
			     playData(hWaveOut, buf_ptr, length);
                             toggle_mutex(MUTEX_RESERVE);
			     mmeProcessCallbacks();
                             toggle_mutex(MUTEX_RELEASE);
			  }
                          break;

                      case RSTAT_ERROR:
                      case RSTAT_CLOSED:
                          terminate = 1;
                          break;

                      case RSTAT_PAUSED:
                      case RSTAT_EWOULDBLOCK:
                          break;

                   }
                }
                /*
                 * Poll to see if there are
                 * any pending mme callbacks.
                 */
                toggle_mutex(MUTEX_RESERVE);
                if ( mmeCheckForCallbacks() )
                   mmeProcessCallbacks();
                toggle_mutex(MUTEX_RELEASE);
                break;
                    
            case PCR_ABORT:
#ifdef DEB_MME
		printf("status: PCR_ABORT\n");
#endif
                if ( player_control.pcr_state != PLAYER_ABORTING )
                {
                    /*
                     * comply
                     */
                    player_control.pcr_state = PLAYER_ABORTING;
                    if ( pthread_cond_broadcast( 
				&player_control.pcr_broadcast_state ) != 0 )
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
       } /* switch */

    } /* while ( ! terminate ) */  
    waitForAllBuffers();
    freeBuffers();
 
    /*
     * release player control register
     */
    if ( pthread_mutex_unlock( &player_control.pcr_lock ) != 0 )
        perror("play");
#ifdef DEB_MME
  printf("play thread shutting down\n");
#endif
    pthread_exit( (pthread_addr_t)arg );
}/* End-play_main */

/*
****************************************************************************
**
** initializeBuffers 
**
**  FUNCTIONAL DESCRIPTION:
**
**  Initialize the data buffers passed to the MME driver.
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
int initializeBuffers()
{
   int i,j;

#ifdef DEBUG
     fileptr3 = fopen( "dt.wav", "wb" );
#endif

   /*
    * Setup memory for the wavehdr struct
    */
    toggle_mutex(MUTEX_RESERVE);
    WaveHdr_p = (LPWAVEHDR)mmeAllocMem(sizeof(WAVEHDR));
    toggle_mutex(MUTEX_RELEASE);

    if(WaveHdr_p == NULL)
    {
      return(0);
    }
    /* Setup Header */
    WaveHdr_p->lpData          = 0;
    WaveHdr_p->dwBufferLength  = 0;
    WaveHdr_p->dwBytesRecorded = 0;
    WaveHdr_p->dwUser          = 0;
    WaveHdr_p->dwFlags         = 0;
    WaveHdr_p->dwLoops         = 0;
    WaveHdr_p->lpNext          = NULL;
    WaveHdr_p->reserved        = 0;

   /*
    * Setup the playback buffer
    */
   for (i=0; i < MAX_BUFFERS; i++) 
   {
      toggle_mutex(MUTEX_RESERVE);
      buffers[i].lpData = (char *)mmeAllocBuffer(BUFFER_SIZE+1);
      toggle_mutex(MUTEX_RELEASE);

      if (buffers[i].lpData == NULL) 
      {
#ifdef DEB_MME
	  fprintf(stderr, "initializeBuffers::System out of memory\n");
#endif
	 freeBuffers();
         return( 0 );
      }
      for (j=0; j < MAX_SEGMENTS; j++) 
      {
         buffers[i].not_in_use[j] = TRUE;
         buffers[i].segment_address[j] = 
                           &buffers[i].lpData[SEGMENT_SIZE*j];
#ifdef DEBUG
 printf("addr:%d\n",buffers[i].segment_address[j]);
#endif
      }
   }
   return( 1 );
}

/*
******************************************************************************
**
** freeBuffers 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Frees the data buffers used in talking to a  MME server.
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
void freeBuffers()
{
   int i;
#ifdef DEBUG
    fclose( fileptr3 );
    printf("free buffers \n");
#endif
   for (i=0; i < MAX_BUFFERS; i++) 
   {
      toggle_mutex(MUTEX_RESERVE);
      mmeFreeBuffer(buffers[i].lpData);
      toggle_mutex(MUTEX_RELEASE);
   }
   /*
    * Remove memory allocated for the header struct.  
    */
    toggle_mutex(MUTEX_RESERVE);
    mmeFreeMem(WaveHdr_p);
    toggle_mutex(MUTEX_RELEASE);
}


/*
******************************************************************************
**
** waitForAllBuffers 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Waits for all the buffers that have been sent to the driver
**   to finish.
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
void waitForAllBuffers()
{
      static int i,j;
      int num_buffers_back;
      int num_segments_back;

#ifdef DEBUG
printf("waitForAllBuffers\n");
#endif
 
   num_buffers_back = 0;
   while (num_buffers_back < MAX_BUFFERS) 
   {
      num_segments_back = 0;
      while (num_segments_back< MAX_SEGMENTS) 
      {
         toggle_mutex(MUTEX_RESERVE);
         mmeProcessCallbacks();
         toggle_mutex(MUTEX_RELEASE);
#ifdef DEBUG
printf("wait:back from cb i:%d j:%d\n",i,j);
#endif
	 for (j=0; j < MAX_SEGMENTS; j++) 
         {
	    if (buffers[i].not_in_use[j] == TRUE) 
            {
	       num_segments_back++;
	    }
	 } 
         if (num_segments_back < MAX_SEGMENTS)
         {
            toggle_mutex(MUTEX_RESERVE);
            mmeWaitForCallbacks();
            toggle_mutex(MUTEX_RELEASE);
         }
#ifdef DEBUG
else printf("buf:%d seg:%d\n",num_buffers_back,num_segments_back);
#endif
      }
      num_buffers_back++;
#ifdef DEBUG
	printf("waitForAllBuffers: %d out of %d buffers came back\n",
                num_buffers_back, MAX_BUFFERS);
#endif
   }
#ifdef DEBUG
printf("Done: waitForAllBuffers\n");
#endif
} /* waitForAllBuffers */

/*
******************************************************************************
**
**  markBufferNotInUse 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Marks the buffers that are not in use by changing the 
**   boolean flag in the data structure.
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
*****************************************************************************
*/
void markBufferNotInUse(char *lpData)
{
      int i,j;
      char proc_name[]="markBufferNotInUse";

#ifdef DEBUG
printf("markBufferNotInUse\n");
printf("seg:%d\n",lpData);
#endif

   for (i=0; i < MAX_BUFFERS; i++) 
   {
     for (j=0; j< MAX_SEGMENTS; j++)
     {
        if (buffers[i].segment_address[j] == lpData) 
        {
#ifdef DEBUG
printf("Freed buf:%d seg:%d\n",i,j);
#endif
	   buffers[i].not_in_use[j] = TRUE;
	   return;
	}
     }
   }
}

/*
******************************************************************************
**
**  playData 
**
**  FUNCTIONAL DESCRIPTION:
**
**  Function that fills the buffer and sends it to the driver to
**  be played.
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
*****************************************************************************
*/
void playData(HANDLE hWaveOut, unsigned short *data, int length)
{
  char proc_name[]="playData";
  int bufno, segno;
  UINT i;
  unsigned char * pTemp;
  unsigned short *pSource;
  LPTTS_HANDLE_T ttsHandle;
  MMRESULT err_num = MMSYSERR_NOERROR;
  char     specific_err[MAX_ERR_STRING+1];

#ifdef DEBUG
      fwrite( data, sizeof( short ), (size_t)length, fileptr3 );
      printf("play data with %d data \n",length);
#endif
    if( length <= 0 ) 
    {
	waitForAllBuffers();
        return;
    }
    if (!findNextSegment(&bufno,&segno))
    {
       toggle_mutex(MUTEX_RESERVE);
       mmeWaitForCallbacks();
       mmeProcessCallbacks();
       toggle_mutex(MUTEX_RELEASE);

#ifdef DEBUG
      printf("No more segment, wait...\n");
#endif
       return;
    }
#ifdef DEBUG
    printf("using buffer: %d seg:%d\n",bufno,segno);
#endif
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

   memcpy(&buffers[bufno].lpData[SEGMENT_SIZE*segno],data,length);
   buffers[bufno].not_in_use[segno] = FALSE; 

#ifdef DEBUG
    printf("using buffer: %d seg:%d\n",bufno,segno);
#endif
    /* Setup Header */
    toggle_mutex(MUTEX_RESERVE);
    WaveHdr_p->lpData          = &buffers[bufno].lpData[SEGMENT_SIZE*segno];
    WaveHdr_p->dwBufferLength  = length;
    err_num = waveOutWrite(hWaveOut, WaveHdr_p, sizeof(WAVEHDR));
    toggle_mutex(MUTEX_RELEASE);

    if (err_num)
    {
      toggle_mutex(MUTEX_RESERVE);
      waveOutGetErrorText(err_num, specific_err, MAX_ERR_STRING);
      toggle_mutex(MUTEX_RELEASE);
      return;
    }
    pthread_mutex_lock(&ttsHandle->CountMutex);
    ttsHandle->dwAudioQueuedCount += length; 
    pthread_mutex_unlock( &ttsHandle->CountMutex);
#ifdef DEBUG
printf("play:len:%d\n",length);
printf("return from playdata\n");
#endif

    return;
} /* playData() */


/*
******************************************************************************
**
**  playCallback
**
**  FUNCTIONAL DESCRIPTION:
**
** Callback function that receives the driver messages intended for
** this application.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
*****************************************************************************
*/
void playCallback(
		HANDLE hWaveOut,
		UINT   wMsg,
		DWORD  dwInstance,
		LPARAM lParam1,
		LPARAM lParam2)
{
   char proc_name[]="playCallback";
   LPWAVEHDR WaveHdr_p = (WAVEHDR *) lParam1;
   LPTTS_HANDLE_T ttsHandle;

   ttsHandle = TextToSpeechGetHandle();
   switch(wMsg) 
   {
         default:
                fprintf(stderr, "Unknown callback message %d\n", wMsg);
		break;

	 case WOM_OPEN:
#ifdef DEBUG 
		printf("%s:WOM_OPEN\n", proc_name);
#endif
		return;
		break;
	 case WOM_DONE:
#ifdef DEBUG
		printf("%s:WOM_DONE\n", proc_name);
#endif
		if (WaveHdr_p->dwFlags & WHDR_DONE) 
                {
                   pthread_mutex_lock(&ttsHandle->CountMutex);
                   ttsHandle->dwAudioQueuedCount -= WaveHdr_p->dwBufferLength; 
                   
                   if ( ttsHandle->dwAudioQueuedCount == 0 )
                      pthread_cond_signal(&ttsHandle->CountCondition);
                   
                   pthread_mutex_unlock( &ttsHandle->CountMutex);

		   /* Got buffer done command. */
		   markBufferNotInUse(WaveHdr_p->lpData); 
                }
		return;
		break;

	 case WOM_CLOSE:
#ifdef DEBUG
		printf("%s:WOM_CLOSE\n", proc_name);
#endif
		break;

   }/* switch */
   return;
}/* playCallback() */

/*
******************************************************************************
**
**  MME_set_volume 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Set the volume control level using waveout calls.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
MMRESULT MME_set_volume(UINT dwVolume)
{

  MMRESULT err_num = MMSYSERR_NOERROR;

  toggle_mutex(MUTEX_RESERVE);
  err_num = waveOutSetVolume(uDeviceId,dwVolume);
  toggle_mutex(MUTEX_RELEASE);

  return( err_num );
}

/*
******************************************************************************
**
**  mme_get_volume 
**
**  FUNCTIONAL DESCRIPTION:
**
**  Gets the volume level from the server using wave out calls.
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
*****************************************************************************
*/
MMRESULT MME_get_volume(DWORD *dwVolume)
{
  DWORD *volume;
  MMRESULT err_num = MMSYSERR_NOERROR;

  toggle_mutex(MUTEX_RESERVE); 
  volume = (LPDWORD) mmeAllocMem(sizeof (DWORD)); 
  toggle_mutex(MUTEX_RELEASE);

  toggle_mutex(MUTEX_RESERVE); 
  err_num = waveOutGetVolume(uDeviceId,volume);
  toggle_mutex(MUTEX_RELEASE);

  *dwVolume = *volume;

  toggle_mutex(MUTEX_RESERVE);
  mmeFreeMem( volume ); 
  toggle_mutex(MUTEX_RELEASE);

  return ( err_num );
}
/*
******************************************************************************
**
**  MME_get_audio_position
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

MMRESULT MME_get_audio_position( DWORD *pdwPosition)
{
   MMRESULT mmStatus;
   LPMMTIME pMmt;

   /********************************************************************/
   /*  Get the wave output device position.                            */
   /*  First allocate memory for the MMTIME structure.                 */
   /********************************************************************/
   toggle_mutex(MUTEX_RESERVE);
   pMmt = (LPMMTIME)mmeAllocMem(sizeof(MMTIME));
   toggle_mutex(MUTEX_RELEASE);

   if ( pMmt == NULL )
     return( MMSYSERR_NOMEM );

   /********************************************************************/
   /*  Get the position of the last sample played by the wave output   */
   /*  device.                                                         */
   /********************************************************************/

   pMmt->wType = TIME_SAMPLES;

   toggle_mutex(MUTEX_RESERVE);
   mmStatus = waveOutGetPosition( hWaveOut,
                                 pMmt,
                                 sizeof(MMTIME));

   toggle_mutex(MUTEX_RELEASE);

   if ( mmStatus != MMSYSERR_NOERROR )
   {
      *pdwPosition = 0xFFFFFFFF;
   }
   else
   {
     *pdwPosition = pMmt->u.sample;
   }

   /********************************************************************/
   /*  Free memory for the MMTIME structure.                           */
   /********************************************************************/
   toggle_mutex(MUTEX_RESERVE);
   mmeFreeMem(pMmt);
   toggle_mutex(MUTEX_RELEASE);

   return( mmStatus );
}


/*
******************************************************************************
**
**  MME_reset_audio 
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
*/
MMRESULT MME_reset_audio( void )
{
  
   MMRESULT err_num = MMSYSERR_NOERROR;
   LPTTS_HANDLE_T ttsHandle;
   int tempCount=0;

   ttsHandle = TextToSpeechGetHandle();

   toggle_mutex(MUTEX_RESERVE);

   pthread_mutex_lock(&ttsHandle->CountMutex);
   tempCount =  ttsHandle->dwAudioQueuedCount;
   pthread_mutex_unlock( &ttsHandle->CountMutex);

   if ( tempCount > 0 )
      err_num = waveOutReset( hWaveOut );

   toggle_mutex(MUTEX_RELEASE);

   /*
    * Reset the dwAudioQueuedCount, which is a count of
    * the audio samples queued to the output device.
    */
   pthread_mutex_lock(&ttsHandle->CountMutex);
   ttsHandle->dwAudioQueuedCount = 0;
   pthread_cond_signal(&ttsHandle->CountCondition);
   pthread_mutex_unlock( &ttsHandle->CountMutex);

   if ( err_num != MMSYSERR_NOERROR )
      return ( err_num );
}

#endif /* ifdef MME_SERVER */

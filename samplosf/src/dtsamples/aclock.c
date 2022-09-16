/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	05/14/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	05/14/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	05/14/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	05/14/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	05/14/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	05/14/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	05/14/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	05/14/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	05/14/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	05/14/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	05/14/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	05/14/97	leeber	Initial Version
$
 * Revision 1.1.2.4  1998/11/04  Eric Thompson
 * 	made changes for linux
 *
 * Revision 1.1.2.3  1996/10/01  17:14:22  Cathy_Page
 * 	Removed OUTPUT_TO_MME_DEVICE from device options
 * 	[1996/10/01  17:12:58  Cathy_Page]
 *
 * Revision 1.1.2.2  1995/07/05  18:04:28  Krishna_Mangipudi
 * 	Moved from ./dtk/src/cleints/dtsamples
 * 	[1995/07/05  17:59:41  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:37:36  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:14:37  Krishna_Mangipudi]
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
**     aclock.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**	A speaking clock that will tell you the time.
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**
**  CREATION DATE:
**
**  MODIFICATION HISTORY:
**
*****************************************************************************/


#include <stdio.h>
#include <time.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h> /* for sleep() */
#ifndef __linux__
#include <mme/mmsystem.h>
#endif
#include <dtk/ttsapi.h>

static char *program_name = "unknown";
static LPTTS_HANDLE_T ttsHandle;

static char *months[12] = {
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
};

static char *days[19] = {
    "first", "second", "third", "fourth", "fifth",
    "sixth", "seventh", "eighth", "ninth", "tenth",
    "eleventh", "twelfth", "thirteenth", "fourteenth", "fifteenth",
    "sixteenth", "seventeenth", "eighteenth", "nineteenth"
};

static char *weekdays[7] = {
    "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
};

error_exit( char *msg )
{
    fprintf(stderr,"%s: %s\n",program_name,msg);
    exit(-1);
}

speak_date( struct tm *t )
{
    char day[32], buf[256];

    if ( t->tm_mday < 20 ) strcpy(day,days[ t->tm_mday - 1]);
    else if ( t->tm_mday < 30 )
    {
	if ( t->tm_mday == 20 ) strcpy(day,"twentieth");
	else
	{
	    strcpy(day,"twenty ");
	    strcat(day,days[ t->tm_mday - 21 ]);
	}
    }
    else if ( t->tm_mday < 32 )
    {
	if ( t->tm_mday == 30 ) strcpy(day,"thirtieth");
	else
	{
	    strcpy(day,"thirty ");
	    strcat(day,days[ t->tm_mday - 31 ]);
	}
    }

    sprintf(buf,"[:nr] Today is %s, %s %s, 19 %d.\n",
	weekdays[ t->tm_wday ],months[ t->tm_mon ],day,t->tm_year);
     TextToSpeechSpeak( ttsHandle, buf, TTS_FORCE );
}

speak_time( struct tm *t )
{
    char *am_pm = "\"A\" \"M\"";
    char mtext[32], buf[256];
    int hour    = t->tm_hour;
    int minutes = t->tm_min;

    if ( hour >= 12 )
    {
	am_pm = "\"P\" \"M\"";
	if ( hour > 12 ) hour -= 12;
    }

    if ( minutes == 0 )
	mtext[0] = '\0';
    else if ( minutes < 10 )
	sprintf(mtext,"o %d",minutes);
    else
	sprintf(mtext,"%d",minutes);

    sprintf(buf,"[:nb] The time is %d %s %s.\n",hour,mtext,am_pm);
    TextToSpeechSpeak( ttsHandle, buf, TTS_FORCE );
}

#define DEFAULT_INTERVAL 15

Usage( )
{
    fprintf(stderr,"Usage: %s [-h] [ # ]\n",program_name);
    fprintf(stderr,"       where # is the interval in minutes\n");
    fprintf(stderr,"       5  - every five minutes\n");
    fprintf(stderr,"       15 - every fifteen minutes\n");
    fprintf(stderr,"       30 - on the hour and half hour\n");
    fprintf(stderr,"       60 - on the hour\n");
    fprintf(stderr,"       -h - this help message\n");
    exit( -1 );
}

main( int argc, char *argv[] )
{
    time_t tv;
    struct tm *t;
    int interval = DEFAULT_INTERVAL;
    UINT devOptions = 0;
    int devNo = WAVE_MAPPER;

    program_name = argv[0];

    if ( argc > 2 )
	Usage();
    if ( argc > 1 ) {
	if ( !strcmp( "-h", argv[1] ))
	    Usage();
	interval = atoi( argv[1] );
	if ( interval < 1 || interval > 60 )
	    Usage();
    }
#ifdef __linux__
    devOptions |= OWN_AUDIO_DEVICE;
#endif
    ttsHandle = NULL;
    if ( TextToSpeechStartup(&ttsHandle, devNo, devOptions, NULL, NULL ) !=
            MMSYSERR_NOERROR  ) 
        error_exit("Error starting up DECtalk");

    time( &tv );
    t = localtime( &tv );
    if ( t == NULL ) error_exit("NULL return from localtime()");
    speak_date(t);
    speak_time(t);
    
    while( 1 )
      {
	time( &tv );
	t = localtime( &tv );
	if ( t == NULL ) error_exit("NULL return from localtime()");
	if ( ( t->tm_min % interval ) == 0 )
	  {
	    if ( t->tm_min == 0 ) speak_date(t);
	    speak_time(t);
	    sleep(60);
	  }
	sleep(30);
      }
    
    TextToSpeechShutdown( ttsHandle );
    
    exit( 0 );
}




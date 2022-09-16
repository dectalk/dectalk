/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	06/24/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	06/24/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	06/24/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	06/24/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	06/24/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	06/24/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	06/24/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	06/24/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	06/24/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	06/24/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	06/24/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	06/24/97	leeber	Initial Version
$
 * Revision 1.1.2.4  1996/10/01  17:14:31  Cathy_Page
 * 	Removed OUTPUT_TO_MME_DEVICE from device options
 * 	[1996/10/01  17:13:03  Cathy_Page]
 *
 * Revision 1.1.2.3  1996/02/27  01:35:25  Krishna_Mangipudi
 * 	removed local def of DTK_DEFAULT_MODE, & changed TTS_NORMAL to TTS_FORCE
 * 	[1996/02/27  01:35:13  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.2  1995/11/14  21:34:57  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:39  Krishna_Mangipudi]
 * 
 * $EndLog$
 */

/* Header stuff*/

/*$Id: mme.c,v 1.1.2.4 1996/10/01 17:14:31 Cathy_Page Exp $
/* Copyright (c) 1995 by Digital Equipment Corporation.  All Rights Reserved */

/***
   NAME
     mme
   PURPOSE Synthesize Speech via MME
     
   NOTES Will be linked with dtk.o to produce a dectalk shell that
   synthesizes speech via MME 
     
   HISTORY
     raman - Jun 15, 1995: Created.
***/

/* Include files */

#include <stdlib.h>

#ifndef _TTSAPI_H_
#include <mme/mmsystem.h>
#include <ttsapi.h>
#endif

/* #include <dtk/dtmmedefs.h> */
/* fix a bizarre problem: */
#ifndef WAVE_FORMAT_08M08
#define WAVE_FORMAT_08M08      0x00001000
#endif

#include "phoneme.h"
#include "queue.h"
#include "speaker.h"

#ifndef _DTK_
#include "dtk.h"
#endif

/* helper function: */

static long get_devEncoding()
{
    static const long devEncoding[3] = {
	WAVE_FORMAT_1M16,
	WAVE_FORMAT_1M08,
	WAVE_FORMAT_08M08
    };

    int i;
    MMRESULT status;
    long devOptions = 0;
    int encoding = WAVE_MAPPER;
    MMRESULT nDevs = waveOutGetNumDevs();
    LPWAVEOUTCAPS pWaveOutCaps =
	(WAVEOUTCAPS *) mmeAllocMem( sizeof( WAVEOUTCAPS ));

    /* Select a suitable format */

    for( i = 0; i < nDevs; i++ )
    {
        status = waveOutGetDevCaps( i, pWaveOutCaps, sizeof(WAVEOUTCAPS));
        if( status != MMSYSERR_NOERROR )
	{
            fprintf(stderr,"MME: Could not find appropriate wave device.\n");
	    return( FALSE );
	       
        }
        devOptions |= pWaveOutCaps->dwFormats;
    }

    encoding = ( devOptions & WAVE_FORMAT_1M16 )  ? 0 : 
               ( devOptions & WAVE_FORMAT_1M08 )  ? 1 : 
               ( devOptions & WAVE_FORMAT_08M08 ) ? 2 : 0;

    return( devEncoding[ encoding ] );
}

#if 0
/* mme_output_speech -- helper for dtk_callback */
static void mme_output_speech(LPTTS_BUFFER_T speech_buffer_ptr, dtk_speaker *p)
{
  QITEM *qi;
  DWORD size;

  size = speech_buffer_ptr->dwBufferLength;
  qi = (QITEM *) malloc(sizeof(QITEM));
  qi->u.dtp = malloc(sizeof(TTS_BUFFER_T));
  qi->u.dtp->lpData = malloc(size);
  qi->u.dtp->dwBufferLength = size;
  qi->u.dtp->dwNumberOfIndexMarks = speech_buffer_ptr->dwNumberOfIndexMarks;
  bcopy (speech_buffer_ptr->lpData, qi->u.dtp->lpData, size);
  insertQueueTail(&p->queue, qi);
} 


/* log phonemes. For the present send it to stderr */
static void output_phonemes(LPTTS_BUFFER_T speech_buffer_ptr, dtk_speaker *p)
{
    int i;
    double bdur;
    int ticks_per_second = samples_per_second(p->output_format);

    bdur = 1000.0 * ((double)speech_buffer_ptr->dwBufferLength) /
        ((float) ticks_per_second);

    if ( speech_buffer_ptr->dwNumberOfPhonemeChanges > 0 )
    {
        fprintf(p->phoneme_log_ptr, " %10s  %4s %10s %10s\n",
                "Phone","Id","Dur (ms)","Offset (ms)");

        for ( i = 0; i < speech_buffer_ptr->dwNumberOfPhonemeChanges; i++)
	{
            double msoff,msdur;
            DWORD cur_sn;
            static DWORD old_sn=0;
            static DWORD ph;

            cur_sn = speech_buffer_ptr->lpPhonemeArray[i].dwPhonemeSampleNumber;
            msoff = 1000.0 * old_sn / ((float) ticks_per_second) ;
            msdur = 1000.0 * (cur_sn-old_sn) / ((float) ticks_per_second);

            if(cur_sn > 0)
                fprintf(p->phoneme_log_ptr, "[%10s] %4d %10.3f %10.3f\n",
                        eng_ph_table[ ph ].ph_p2,
                        ph,
                        msdur,
                        msoff
                        );
            old_sn = cur_sn;
            ph = speech_buffer_ptr->lpPhonemeArray[i].dwPhoneme;
        }
    }
}


/*-- Call back routine to process buffers from the text to speech system.*
 *The final argument contains a pointer to the associated speaker object *
 *This function will write the buffers out to the output file. *
 * In addition, index marks will be processed here: */

static void mme_dtk_callback(long  param1, long  param2, long  user_defined)
{
    LPTTS_BUFFER_T speech_buffer_ptr;
    int i;
    dtk_speaker *p = (dtk_speaker *) user_defined;
    dtk_buffer * buffers = p->buffers;

    switch( param1 )
    {
      case INDEX_MARK:
        p->last_index_mark = (int) param2;
        break;
      case MEMORY_BUFFER:
        speech_buffer_ptr  = (TTS_BUFFER_T *) param2;
        if (p->log_phonemes) 
            output_phonemes(speech_buffer_ptr, p);

        /* handle index marks  */

        if ( speech_buffer_ptr->dwNumberOfIndexMarks >= 1)
            for ( i = 0; i < speech_buffer_ptr->dwNumberOfIndexMarks; i++)
	    {
                p->last_index_mark =
                    speech_buffer_ptr->lpIndexArray[i].dwIndexValue;
            }

        /* Got a buffer, write it out */
        if (speech_buffer_ptr->dwBufferLength > 0 ) {
            mme_output_speech(speech_buffer_ptr, p);
        } /*  buffer length > 0 */

        /* Requeue the buffer     */
        for ( i = 0; i < NUM_BUFFERS; i++ )
            if ( speech_buffer_ptr == buffers[i].speech_buffer_ptr )
	    {
                TextToSpeechAddBuffer( p->tts_handle, 
					buffers[i].speech_buffer_ptr );
                time( &buffers[i].timer1 );
            }
    } /* end switch */
} /* end callback */
#endif

/* dtkInitSpeaker -- MME version              */
/* Initialize things for using MME with Dectalk */ 

extern int dtkInitSpeaker(dtk_speaker *p, DWORD output_format)
{
    static int id=1;    
    int i;
    MMRESULT status;

    /* defaults */ 
    int devNo = 0;
    long devOptions = 0;
    long userparams = (long) p;
    const long devEncoding = get_devEncoding();

    devOptions |= devEncoding;

    /* initialize speaker structure */
    p->tts_handle = NULL;
    p->id = id++;
    p->left_volume = p->right_volume = 1.0; 
    p->scratch = (char *) malloc((size_t)2*BUFFER_SIZE);
    p->log_phonemes = FALSE;
    p->output_file_ptr = (FILE *) NULL;
    p->last_index_mark = -1;
    p->dtk_callback_routine = NULL;
    // p->dtk_callback_routine = mme_dtk_callback;
    p->phoneme_log_ptr = stderr;
    p->output_format = (DWORD)devEncoding;
    for( i = 0; i < NUM_BUFFERS; i++ )
    	p->buffers[i].speech_buffer_ptr = NULL;

    /* initialize speech system */ 
    status = TextToSpeechStartup(&(p->tts_handle), devNo, devOptions, 
				NULL, NULL );
				// (p->dtk_callback_routine), userparams );
    if ( status == MMSYSERR_NODRIVER )
    {
        fprintf(stderr, "Could not find any wave devices.\n" );
	return( FALSE );
    }
    else if ( status != MMSYSERR_NOERROR )
    {
        fprintf(stderr, "TextToSpeechStartup failed status is %d\n", status);
	return( FALSE );
    }

    /* set tts mode */
    status = TextToSpeechSpeak( p->tts_handle, DTK_DEFAULT_MODE, TTS_FORCE);

    if (status != MMSYSERR_NOERROR)
    {
        fprintf(stderr, "Failed to set tts mode: \n" );
	return( FALSE );
    }
    
    return( TRUE );
}

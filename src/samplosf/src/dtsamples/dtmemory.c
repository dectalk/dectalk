/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * Revision 1.1.2.7 2001/06/19	Matthew Schnee
 *	Solaris port BATS#972
 *
 * Revision 1.1.2.6 1998/11/04  Eric Thompson
 * 	made changes for linux
 *
 * Revision 1.1.2.5  1996/10/01  17:14:23  Cathy_Page
 * 	Changed callback routine: Added new param (uiMsg); Use uiMsg to determine msg type
 * 	[1996/10/01  17:12:46  Cathy_Page]
 *
 * Revision 1.1.2.4  1996/03/19  16:05:38  Krishna_Mangipudi
 * 	Use proper declarations for DtCallbackRoutine
 * 	[1996/03/19  16:05:28  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.3  1995/11/09  21:32:09  Krishna_Mangipudi
 * 	 - Changed params1 & params2 in DtCallback to LONG - 64 bit pointers!!
 * 	 - Changed TimeOut check to TimeOut >= NUM_BUFFERS.
 * 	[1995/11/09  21:31:52  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.2  1995/07/05  18:04:31  Krishna_Mangipudi
 * 	Moved from ./dtk/src/cleints/dtsamples
 * 	[1995/07/05  17:59:44  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:37:42  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:14:50  Krishna_Mangipudi]
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

/**********************************************************************/
/*                                                                    */
/*  Include File: dtmemory.c                                          */
/*  Date: October 27, 1993                                            */
/*                                                                    */
/**********************************************************************/

/**************************************************/
/* Standard header files			  */
/**************************************************/
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <dtk/dtmmedefs.h>
#include <dtk/ttsapi.h>
#include <time.h>
#if defined __linux__ || defined _SPARC_SOLARIS_ || defined (__APPLE__)
#include <stdlib.h> /* for atoi(), malloc() */
#include <unistd.h> /* for sleep() */
#endif

#if defined (__APPLE__)
#include <string.h> 
#endif

/**************************************************/
/* Macro define's				  */
/**************************************************/
#define MAX_ERR_STRING          128
#define DEFAULT_BITRATE         8
#define DEFAULT_SAMPLERATE      8000
#define DEFAULT_NCHANNELS       1
#define BUFFER_SIZE             4096 
#define MAX_PHONEMES		128	
#define MAX_INDEX_MARKS		128	
#define NUM_BUFFERS             3
#define TIME_OUT                3

#define mymalloc(x,y)		malloc((x) * (y))

/**************************************************/
/* Global variables				  */
/**************************************************/
static LPTTS_HANDLE_T ttsHandle;

/**************************************************/
/* Callback routine declaration callbacks to trap */
/* in-line index marks and/or memory buffers.     */
/**************************************************/
void DtCallback();
void (*DtCallbackRoutine)();

/**************************************************/
/* Speech buffers passed between DECtalk	  */
/* and this application.	  		  */
/**************************************************/
struct buffer_t {
   LPTTS_BUFFER_T pSpeechBuffer;
   double   elapsedTime;
   time_t timer1;
   time_t timer2;
   };

struct   buffer_t buffers[NUM_BUFFERS];
static   FILE * fileptr;  
char     OutputFileName[100] = "dtmemory.wav";
BOOL     Done = FALSE;
int      TimeOut;

/****************************************************************************
**
**  usage
**
**  FUNCTIONAL DESCRIPTION:
**
**   Prints out the valid parameter list in case the user typed them
**   wrong in the command line.
**
**  FORMAL PARAMETERS:
**
**   None
**
**  RETURN VALUE
**
**   None
**
**************************************************************************/

static void usage()
{
    fprintf(stderr, "\tdtmemory will read text from a file and create\n"); 
    fprintf(stderr, "\tan audio wave file in .wav format.\n\n");
    fprintf(stderr, "\tUsage: dtmemory [-h] [-s #] [-r #] [-o file] [file] \n\n");
    fprintf(stderr,"\t-h 	  This help message\n");
    fprintf(stderr,"\t-s #      Speaker number (1-9)\n");
    fprintf(stderr,"\t-r #      Speaking rate ( 50 - 600 )\n");
    fprintf(stderr,"\t-o file   Output filename, default: dtmemory.wav\n");
    fprintf(stderr,"\tfile      Speak from a given file\n");
    exit(-1);
}

/****************************************************************************
**
**  main 
**
**  FUNCTIONAL DESCRIPTION:
**
**     The main functions performed in the main module are:
**          o Process the command line arguments
**          o Allocate MME memory buffers (was mmeAllocMem now is mymalloc)
**          o Queue the buffers (TextToSpeechAddBuffer)
**          o Initialize the Text To Speech functions (TextToSpeechStartup)
**          o Change Speech Rate (TextToSpeechSetRate)
**          o Change Speaker (TextToSpeechSetSpeaker)
**          o Read input from from a file
**          o Convert input text to speech (TextToSpeechSpeak)
**          o Dequeue the last buffer (TextToSpeechReturnBuffer) 
**          o Shutdown the program (TextToSpeechShutdown)
**          o Deallocate MME memory buffers (was mmeFreeMem now is free)
**
**  FORMAL PARAMETERS:
**
**     argc - Count of arguments passed on the command line.
**
**     argv -  Array of pointers to command line arguments.  
**             This program accepts command line arguments to change
**             Speaker, Speaking Rate, a text string to speak
**             or a file name of a file to playback.
**
**  RETURN VALUE
**
**     None
**
**************************************************************************/
main( int argc, char *argv[] )
{
    int devNo		= (int)WAVE_MAPPER;
    int speaker_id 	= -1;
    int rate       	= -1;
    int i; 
    int file_arg_index 	= -1; 
    int status;
    unsigned int devOptions = 0;
    long UserParams	= 0;
    LPTTS_BUFFER_T pLastSpeechBuffer[1];
#if defined __linux__ || defined _SPARC_SOLARIS_ || defined (__APPLE__)
int playFile( char *file_name );
#endif
    /************************************************************/
    /* Set default						*/
    /************************************************************/

    ttsHandle = NULL;
    Done = FALSE;
    TimeOut = 0;
    
    /************************************************************/
    /* Callback routine to call with memory buffers             */
    /************************************************************/
                               
    DtCallbackRoutine = DtCallback;

    /************************************************************/
    /* Process arguments					*/
    /************************************************************/

    for ( i=1; i<argc; i++ )
    {
        /********************************************************/
        /* Switches that do not begin with a - are a file name  */
        /********************************************************/

	if ( argv[i][0] != '-' )
	{
	    if ( file_arg_index != (-1) )
	    {
		fprintf(stderr,"Sorry, only one file can be processed.\n");
                usage( argv[0] );
	    }
	    file_arg_index = i;
	}

        /********************************************************/
        /* Speaker id 						*/
        /********************************************************/

	else if ( strcmp("-s",argv[i]) == 0 )
	    speaker_id = atoi( argv[++i] );

        /********************************************************/
        /* Speaking rate					*/
        /********************************************************/

	else if ( strcmp("-r",argv[i]) == 0 )
	    rate = atoi( argv[++i] );

        /********************************************************/
        /* Set the output filename				*/
        /********************************************************/

	else if ( strcmp("-o",argv[i]) == 0 )
	    strcpy( OutputFileName, argv[++i] );

        /********************************************************/
        /* Usage error						*/
        /********************************************************/

	else if ( strcmp("-h",argv[i]) == 0 )
	    usage( argv[0] );

	else usage( argv[0] );
    }

    if ( file_arg_index == -1 )
    {
       fprintf(stderr,"     Enter a file name on command line.\n");
       usage( argv[0] );
    }

    /************************************************************/
    /* Initialize the buffers before we put them into memory.   */
    /************************************************************/

    for ( i = 0; i < NUM_BUFFERS; i++)
    { 
       buffers[i].pSpeechBuffer = 
                  (LPTTS_BUFFER_T) mymalloc (1,sizeof(TTS_BUFFER_T));
       buffers[i].pSpeechBuffer->lpData = (LPSTR) mymalloc (1, BUFFER_SIZE);
       buffers[i].pSpeechBuffer->dwMaximumBufferLength = BUFFER_SIZE;

       /* now we can do phoneme logging */
       buffers[i].pSpeechBuffer->lpPhonemeArray =
                   (LPTTS_PHONEME_T) mymalloc (MAX_PHONEMES,sizeof(LPTTS_PHONEME_T));
       buffers[i].pSpeechBuffer->dwMaximumNumberOfPhonemeChanges = MAX_PHONEMES;

       /* now we can process index marks */
       buffers[i].pSpeechBuffer->lpIndexArray =
                    (LPTTS_INDEX_T) mymalloc (MAX_INDEX_MARKS, sizeof(LPTTS_INDEX_T));
       buffers[i].pSpeechBuffer->dwMaximumNumberOfIndexMarks = MAX_INDEX_MARKS;
    }

    /************************************************************/
    /* Setup devOptions to not use audio device			*/
    /* since we are only writing out to a file.			*/
    /* NOTE:							*/
    /*   you could set devOptions to use WAVE_FORMAT_1M16 - but */
    /*   checking for the device capabilities would not make    */
    /*   this sample applet usable for those who use the audio  */
    /*   file audio driver.					*/
    /************************************************************/

    devOptions |= DO_NOT_USE_AUDIO_DEVICE;

    status = TextToSpeechStartup( &ttsHandle, devNo, devOptions, 
                            DtCallbackRoutine, UserParams );
    if ( status != MMSYSERR_NOERROR )
    {
	fprintf(stderr,"\n%s: TextToSpeechStartup failed, exiting.\n",argv[0]);
	exit(1);
    }

    /************************************************************/
    /* Set selected speaker					*/
    /************************************************************/

    if ( speaker_id != (-1) )
       TextToSpeechSetSpeaker(  ttsHandle, speaker_id );

    /************************************************************/
    /* Set selected speaking rate				*/
    /************************************************************/

    if ( rate != (-1) )
       TextToSpeechSetRate (  ttsHandle, rate );

    /************************************************************/
    /* Start memory buffering and return Mu-law encoded 	*/
    /* synthesized speech buffers.				*/
    /************************************************************/

    TextToSpeechOpenInMemory(ttsHandle, WAVE_FORMAT_08M08);

    /************************************************************/
    /* Queue the buffers 					*/
    /************************************************************/

    for ( i = 0; i < NUM_BUFFERS; i++)
       TextToSpeechAddBuffer( ttsHandle, buffers[i].pSpeechBuffer );

    /************************************************************/
    /* Open the output file.					*/
    /************************************************************/

    if ( (fileptr = fopen( OutputFileName, "wb" )) == NULL )
    {
       fprintf(stderr, "Could not open output file: %s\n", OutputFileName);
       exit ( 0 );
    }

    /************************************************************/
    /* Play the specified input text file 			*/
    /************************************************************/

    if ( file_arg_index != (-1) )
       playFile( argv[file_arg_index] );
    else
    {
      fprintf(stderr, "Please specify a text file name on the command line.\n");
      exit (0);
    }

    /*******************************************************************/
    /* Wait around till all the buffers arrive.  Time out if 	       */
    /* there is nothing in each buffer for more than TIME_OUT seconds. */
    /*******************************************************************/

    while ( !Done )
    {
       sleep ( 1 ); 
       for ( i = 0; i < NUM_BUFFERS; i++ )
       {
          if ( (int) buffers[i].timer1 > 0)
          {
             time( &buffers[i].timer2 );
             buffers[i].elapsedTime = buffers[i].timer2 - 
                                            buffers[i].timer1;
             if (  buffers[i].elapsedTime > TIME_OUT )
                TimeOut++;
          }
       }
       if ( TimeOut >= NUM_BUFFERS)
          Done = TRUE;
    }

    /************************************************************/
    /* Get the last buffer and see if there is any more data.	*/
    /************************************************************/

    if ( TextToSpeechReturnBuffer( ttsHandle, &pLastSpeechBuffer[0] ) == 
					MMSYSERR_NOERROR)

        if (( pLastSpeechBuffer[0] != NULL ) && 
	    ( pLastSpeechBuffer[0]->dwBufferLength > 0 ))
           fwrite( pLastSpeechBuffer[0]->lpData, sizeof(char), 
                (size_t)pLastSpeechBuffer[0]->dwBufferLength, fileptr );

    /************************************************************/
    /* Close memory buffering.					*/
    /************************************************************/

    TextToSpeechCloseInMemory(ttsHandle);

    /************************************************************/
    /* Done, shutdown and exit.					*/
    /************************************************************/

    if ( TextToSpeechShutdown( ttsHandle ) != MMSYSERR_NOERROR )
       fprintf(stderr,"TextToSpeechShutdown failed.\n");
 
    fclose( fileptr );

    /************************************************************/
    /* Free buffers						*/
    /************************************************************/

    for ( i = 0; i < NUM_BUFFERS; i++)
    {
      free(buffers[i].pSpeechBuffer->lpData);
      free(buffers[i].pSpeechBuffer);
    }
}

/***************************************************************************
**
**  playFile 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Opens the specified text file and plays back the 
**   contents.
**
**  FORMAL PARAMETERS:
**
**   file_name - Input text file name to playback.
**
**  RETURN VALUE
**
**   int - Total number of bytes of text played back.
**
****************************************************************************/
int playFile( char *file_name )
{
    FILE *fileHandle;
    int  nbytes;
    int  total_bytes = 0;
    char buf[BUFFER_SIZE];
    int  text_len;
    long dwFlags;

    /************************************************************/
    /* Open the file						*/
    /************************************************************/

    fileHandle = fopen( file_name, "r" );
    if ( fileHandle == (FILE *)NULL )
    {
        fprintf(stderr,"dtmemory: Cannot open %s for reading.\n",file_name);
        exit( 0 );
    }

    /************************************************************/
    /* Read BUFFER_SIZE bytes and playback until EOF		*/
    /************************************************************/
    while( ( nbytes = fread( buf, 1, BUFFER_SIZE-1, fileHandle ) ) > 0 )
    {
	buf[nbytes]='\0';
        text_len = strlen( buf );
        dwFlags = TTS_FORCE;
        if (TextToSpeechSpeak( ttsHandle, buf, dwFlags) != MMSYSERR_NOERROR  )
        {
          fprintf(stderr,"Error writing %d bytes to TextToSpeech.\n",text_len);
          break;
        }
        total_bytes += nbytes;
    }

    /************************************************************/
    /* Done, close the file and return the byte count.		*/
    /************************************************************/

    fclose( fileHandle );
    return( total_bytes );
}

/*****************************************************************************
**
**  DtCallback 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Callback routine that DECtalk APIs use to return
**   memory buffers and in-line index marks.
**
**   The main functions performed in the main module are:
**          o Process index mark callback (INDEX_MARK)
**          o Process memory buffer callback (MEMORY_BUFFER)
**          o Write memory buffer to a file
**          o Requeue the buffer (TextToSpeechAddBuffer) 
**
**  FORMAL PARAMETERS:
**
**   None
**
**  RETURN VALUE
**
**   None
**
***************************************************************************/
void DtCallback(LONG param1, LONG param2, LONG user_defined, UINT uiMsg)
{
   LPTTS_BUFFER_T pCbSpeechBuffer;
   int i;

   switch( uiMsg )
   {
   case TTS_MSG_INDEX_MARK:
        printf(" Main: Encountered index Number : %d", param2);
        break;

   case TTS_MSG_BUFFER:
        pCbSpeechBuffer = (TTS_BUFFER_T *) param2;
        
        /********************************************************/
        /* Report index mark in text 				*/
        /********************************************************/
        if ( pCbSpeechBuffer->dwNumberOfIndexMarks > 0 )
           for ( i = 0; i < pCbSpeechBuffer->dwNumberOfIndexMarks; i++)
           {
              printf("index val:%d\n", 
			pCbSpeechBuffer->lpIndexArray[i].dwIndexValue);
              printf("index Sample:%d\n", 
                        pCbSpeechBuffer->lpIndexArray[i].dwIndexSampleNumber);
           }
 
        /********************************************************/
        /* Got a buffer, write to a file			*/
        /********************************************************/
        if ( pCbSpeechBuffer->dwBufferLength > 0 )
           fwrite( pCbSpeechBuffer->lpData, 
                   sizeof(char), 
                   (size_t)pCbSpeechBuffer->dwBufferLength, 
                   fileptr );

        /********************************************************/
        /* Requeue the buffer					*/
        /********************************************************/
        for ( i = 0; i < NUM_BUFFERS; i++ )
           if ( pCbSpeechBuffer == buffers[i].pSpeechBuffer )
           {
              TextToSpeechAddBuffer( ttsHandle, buffers[i].pSpeechBuffer );
              time( &buffers[i].timer1 );
           }
   }
}

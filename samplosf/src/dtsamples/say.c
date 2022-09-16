/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 13      10/05/98 ETT  added linux code  
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
 * 02/09/2000 MGS changed __linux__ to use the shared audio device since it works now
 *
 * Revision 1.1.2.8  1998/11/04  Eric Thompson
 * 	made changes for linux
 *
 * Revision 1.1.2.7  1996/11/19  12:22:24  Cathy_Page
 * 	Remove reference to bba and j300
 * 	Check for error code of MMSYSERR_NOTENABLED from TextToSpeechStartup
 * 	  to determine if no license pak was found.
 * 	Fixed problem with -fo defaulting to dtmemory.wav
 * 	[1996/11/19  12:20:32  Cathy_Page]
 *
 * Revision 1.1.2.6  1996/10/01  17:14:26  Cathy_Page
 * 	Added more error messages for license error in TextToSpeechStartup
 * 	[1996/10/01  17:13:21  Cathy_Page]
 * 
 * Revision 1.1.2.5  1996/05/30  19:55:44  Krishna_Mangipudi
 * 	Added capability to play from redirected pipes (stdin)
 * 	[1996/05/30  19:55:34  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.4  1996/03/04  18:21:08  Krishna_Mangipudi
 * 	Removed calls to figure out best device, tts engine does this now
 * 	[1996/03/04  18:20:55  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.3  1996/02/23  17:28:30  Bill_Hallahan
 * 	Added WAVE_OUT_SHAREABLE flag
 * 	[1996/02/23  17:27:46  Bill_Hallahan]
 * 
 * Revision 1.1.2.2  1995/07/05  18:04:38  Krishna_Mangipudi
 * 	Moved from ./dtk/src/cleints/dtsamples
 * 	[1995/07/05  17:59:50  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:38:06  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:15:33  Krishna_Mangipudi]
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
**      say.c
**
**  ABSTRACT:
**
**      This is a test program to demonstrate the use of DECtalk APIs.
**      The major functions demonstrated in this program are:
**              o Read an input file 
**              o Initialize and call TextToSpeech APIs to convert
**                the text into computer synthesized speech.
**              o Change the speaker.
**              o Change the speech rate.
**
**  USE:
**
**     From command line type:
**
**     Usage: say [-h] [-s #] [-r #] [-d #] [-fi file] [-a "<text>"] [-fo file]
**          -a  "text" speak text (quoted, multiple instances supported)
**          -d  #      Select the audio device ( 0 or 1 )
**          -e  #      Output wave file encoding; specify:
**                       1   for PCM, 16 bit Mono 11KHz format
**                       2   for PCM,  8 bit Mono 11KHz format
**                       3   for MULAW 8 bit Mono  8KHz format
**          -fo file   Output wave file name, default: dtmemory.wav
**          -h        This help message
**          -r  #      Speaking rate ( 75 - 600 )
**          -s  #      Speaker number (1-9)
**          -fi file   Speak from a specified text file
**
**     - OR -
**
**	The the command 'say' and then enter multiple text strings
**	as if you were typing a letter.  Press control-C to exit.
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     DAVE
**       (DECtalk Audio Visual Engineer)
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**     Dec 09, 93   Fix the calls to the Startup API, and documented
**	            the code a bit better.
**     Sep 21, 94   Added capablity to save synthesized wave files.
**
*******************************************************************************/

 /*
  * Standard header files
  */
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#ifdef __linux__
#include <string.h>
#include <stdlib.h>
#endif
#ifndef __linux__
#include <mme/mmsystem.h>
#endif
#include <dtk/ttsapi.h>

 /*
  * Global variables
  */
static LPTTS_HANDLE_T ttsHandle;
DWORD devEncoding[3] = {
                          WAVE_FORMAT_1M16,
                          WAVE_FORMAT_1M08,
                          WAVE_FORMAT_08M08
                       };
 /*
  * Forward references 
  */
MMRESULT OpenOutputWaveFile( char * fname, int encoding );
MMRESULT CloseOutputWaveFile( );
#ifdef __linux__
int play_file( char *file_name, int isAPipe );
#endif

/*******************************************************************************
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
******************************************************************************/

static void usage(char *progname)
{
    fprintf(stderr, "\t%s will read text from stdin (default) or\n",progname);
    fprintf(stderr, "\tcommand line or file and speak that text through the\n");
    fprintf(stderr, "\tMME server using the highest quality audio device it\n");
    fprintf(stderr, "\tfinds. You can override this option by using the -d \n");
    fprintf(stderr, "\tcommand line option to select a particular audio device.\n\n");
    fprintf(stderr,"Usage: %s [-h] [-s #] [-r #] [-d #] [-fo file] [-a \"<text>\"] [-fi file]\n",progname);
    fprintf(stderr,"          -a \"text\" speak text (quoted, multiple instances supported)\n");
    fprintf(stderr,"          -d  #      Select the audio device ( 0 or 1 )\n");
    fprintf(stderr,"          -e  #      Output wave file encoding; specify:\n");
    fprintf(stderr,"                       1   for PCM, 16 bit Mono 11KHz format\n");
    fprintf(stderr,"                       2   for PCM,  8 bit Mono 11KHz format\n");
    fprintf(stderr,"                       3   for MULAW 8 bit Mono  8KHz format\n");
    fprintf(stderr,"          -fo file  Output wave file name, default: dtmemory.wav\n");
    fprintf(stderr,"          -h        This help message\n");
    fprintf(stderr,"          -r  #      Speaking rate ( 75 - 600 )\n");
    fprintf(stderr,"          -s  #      Speaker number (1-9)\n");
    fprintf(stderr,"          -fi file   Speak from a specified text file\n");
    exit(-1);
}

/*******************************************************************************
**
**  main 
**
**  FUNCTIONAL DESCRIPTION:
**
**     The main functions performed in the main module are:
**          o Process the command line arguments
**          o Initialize the Text To Speech functions (TextToSpeechStartup)
**          o Change Speech Rate (TextToSpeechSetRate)
**          o Change Speaker (TextToSpeechSetSpeaker)
**          o Read input either from stdin or from file
**          o Convert input text to speech (TextToSpeech)
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
******************************************************************************/

main( int argc, char *argv[] )
{
    char buf[256];
    char cli_text[4096];
    unsigned int  devNo = 0;
    int  userSelectedDevice = 0;
    int speaker_id = -1;
    int rate       = -1;
    int i; 
    unsigned int file_arg_index; 
    int isAPipe = FALSE;
    int cli_len;
    int text_len;
    int status;
    DWORD devOptions = 0;
    DWORD TempDevOptions = 0;
    DWORD dwFlags;
    DWORD TempEncoding = 0;
    DWORD encoding = 0;
    FILE * OutputFilePtr;
    char   OutputFileName[100] = "dtmemory.wav";
    int  specifiedOutputFile = -1;


    /***********************************************/
    /* Set defaults				   */
    /***********************************************/
    cli_text[0] = '\0';
    cli_len = 0;
    file_arg_index = (-1);

    /***********************************************/
    /* Process arguments			   */
    /***********************************************/
    for ( i=1; i<argc; i++ )
    {
        /********************************************************/
        /* Switch   '-fi' specifies an input file name          */
        /********************************************************/
	if (  strcmp("-fi", argv[i]) == 0 )
	{
	    if ( file_arg_index != (-1) )
	    {
		fprintf(stderr,"Sorry, only one file can be processed.\n");
                usage( argv[0] );
	    }
	    file_arg_index = ++i;
	}

        /************************************************/
        /* Speaker id 					*/
        /************************************************/
	else if ( strcmp("-s",argv[i]) == 0 )
	{
	    i++;
	    speaker_id = atoi( argv[i] );
	}

        /************************************************/
        /* Speaking rate 				*/
        /************************************************/
	else if ( strcmp("-r",argv[i]) == 0 )
	{
	    i++;
	    rate = atoi( argv[i] );
	}

        /************************************************/
        /* Selected device                              */
        /************************************************/
	else if ( strcmp("-d",argv[i]) == 0 )
	{
	    i++;
	    userSelectedDevice = atoi( argv[i] );
	}

        /************************************************/
        /* Selected device                              */
        /************************************************/
        else if ( strcmp("-fo",argv[i]) == 0 )
        {
	    /* 
	     * If the string following -fo does not exist OR begins
	     * with a '-', the use the default output file name.
	     */
	    if ((++i < argc) && (strncmp(argv[i], "-", 1) != 0))
	      strcpy( OutputFileName, argv[i] );
            specifiedOutputFile = 1;
        }

        /************************************************/
        /* Selected device                              */
        /************************************************/
	else if ( strcmp("-e",argv[i]) == 0 )
	{
	    i++;
	    TempEncoding = atoi( argv[i] );
	}

        /************************************************/
        /* Maybe a pipe                                 */
        /************************************************/
	else if ( strcmp("-",argv[i]) == 0 )
	{
            isAPipe = TRUE;
	    i++;
	}        

        /************************************************/
        /* Command line text to playback		*/
        /************************************************/
	else if ( strcmp("-a",argv[i]) == 0 )
	{
            /*
             * check if there is an argument after -a
             */
            if ( argc <= i+1)
               usage( argv[0] );
            if ( strlen (argv[i+1]) <= 0 )
               usage( argv[0] );
            /*
             * Check to see if user forgot to enter
             * a text string on the command line
             */
            if ( strcmp("-h",argv[i+1]) == 0 )
               usage( argv[0] );
            if ( strcmp("-s",argv[i+1]) == 0 )
               usage( argv[0] );
            if ( strcmp("-r",argv[i+1]) == 0 )
               usage( argv[0] );
            if ( strcmp("-d",argv[i+1]) == 0 )
               usage( argv[0] );
            if ( strcmp("-a",argv[i+1]) == 0 )
               usage( argv[0] );
            if ( strcmp("-fi",argv[i+1]) == 0 )
               usage( argv[0] );
            if ( strcmp("-fo",argv[i+1]) == 0 )
               usage( argv[0] );

	    i++;
	    if ( cli_len > 0 && cli_text[ cli_len - 1 ] != ' ' )
		strcat(cli_text," ");
	    strcat(cli_text,argv[i]);
	    cli_len = strlen(cli_text);
	}

        /************************************************/
        /* Usage error - check for -h                   */
        /************************************************/
	else if ( strcmp("-h",argv[i]) == 0 )
	   usage( argv[0] );
        else
            usage( argv[0] );
    }

    /***********************************************/
    /* Capture the argv & argc information.        */
    /***********************************************/
    if ( userSelectedDevice )
       devNo = userSelectedDevice;   
    ttsHandle = NULL;

    /***********************************************/
    /* Set output wave file encoding               */
    /***********************************************/
    if ((TempEncoding >= 1) &&  (TempEncoding <= 3))
    {
      encoding = TempEncoding - 1;
    }

#ifdef __linux__NOT_
    devOptions |= OWN_AUDIO_DEVICE;
#else
    devOptions |= WAVE_OPEN_SHAREABLE;
#endif

    status = TextToSpeechStartup( &ttsHandle, devNo, devOptions, NULL, NULL );

    switch (status)
    {
      case MMSYSERR_NODRIVER:
	fprintf(stderr, "say: Could not find any wave devices\n");
	fprintf(stderr, "say: Is the MM server ready? \n");
	fprintf(stderr, "say: Exiting\n");
	exit(1);

      case MMSYSERR_NOTENABLED:
	fprintf(stderr,"say: DECtalk license not found.\n");
	fprintf(stderr, "say: Exiting\n");
	exit(1);

      case MMSYSERR_ALLOCATED:
	fprintf(stderr,"say: DECtalk has exceeded license quota.\n");
	fprintf(stderr, "say: Exiting\n");
	exit(1);

      case MMSYSERR_NOERROR:
	break;

      default:
	fprintf(stderr,"\n%s: TextToSpeechStartup failed, exiting.\n",argv[0]);
	exit(-1);
    }

    /***********************************************/
    /* Set selected speaker			   */
    /***********************************************/
    if ( speaker_id != (-1) )
       TextToSpeechSetSpeaker(  ttsHandle, speaker_id );

    /***********************************************/
    /* Set selected speaking rate		   */
    /***********************************************/
    if ( rate != (-1) )
       TextToSpeechSetRate (  ttsHandle, rate );

    if ( specifiedOutputFile != -1 )
    {
       OpenOutputWaveFile( OutputFileName, encoding );
    }

    /***********************************************/
    /* Now start processing input		   */
    /*						   */
    /* If there is no input on the command line,   */
    /* wait for user to type text followed by a CR.*/
    /***********************************************/

    /**********************************************/
    /* Get text from stdin                        */
    /**********************************************/
    if ( isAPipe == TRUE )
    {
       /**********************************************/
       /* Play from stdin         		     */
       /**********************************************/
       play_file( "", isAPipe );
    }

    else if ( file_arg_index == (-1) && cli_len == 0 )
    {
        /*******************************************************/
        /* Read and play 256 bytes at a time until out of data */
        /*******************************************************/
        dwFlags = TTS_FORCE;
	while( fgets( buf, 256, stdin ) )
	{
	    text_len = strlen( buf );
	    if (TextToSpeechSpeak(ttsHandle, buf, dwFlags) != MMSYSERR_NOERROR )
	    {
		fprintf(stderr,"Error writing %d bytes to TextToSpeech.\n",
                                     text_len);
		break;
	    }
	}
    }

    /***********************************************/
    /* If there is text on the command line, or if */
    /* a file name is specified, process it...     */
    /***********************************************/
    else
    {
        /*********************************************************/
        /* Test to see if text was specified on the command line */
        /*********************************************************/
	if ( cli_len != 0 ) 
        {
          dwFlags = TTS_FORCE;
          TextToSpeechSpeak( ttsHandle, cli_text, dwFlags );

          /******************************************************/
          /* Let's make sure that all the text has been spoken. */
          /******************************************************/
          TextToSpeechSync( ttsHandle );
        }

        /**********************************************/
        /* Specified a file name of an input file...  */
        /**********************************************/
        if ( file_arg_index != (-1) )
        {
          /**********************************************/
          /* Play the specified file 			*/
          /**********************************************/
#ifdef __linux__          
	  play_file( argv[file_arg_index], 0 );
#else
	  play_file( argv[file_arg_index] );
#endif
        }
    }

    if ( specifiedOutputFile != -1 )
    {
       CloseOutputWaveFile();
    }

    /***********************************************/
    /* Done, shutdown and exit.			   */
    /***********************************************/
    if ( TextToSpeechShutdown( ttsHandle ) != MMSYSERR_NOERROR )
	fprintf(stderr,"TextToSpeechShutdown failed.\n");

    exit(0);
}
/******************************************************************************
**
**  play_file 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Opens the specified text file and plays back the contents.
**
**  FORMAL PARAMETERS:
**
**   file_name - Input text file name to playback.
**
**  RETURN VALUE
**
**   int - Total number of bytes of text played back.
**
*****************************************************************************/
int play_file( char *file_name, int isAPipe )
{
    FILE *fileHandle;
    int  nbytes;
    int  total_bytes = 0;
    char buf[4096];
    int  text_len;
    DWORD dwFlags = TTS_FORCE;

    /******************************************************/
    /* See if text is in redirected UNIX pipes            */
    /******************************************************/
    if ( isAPipe == TRUE )
    {
       while( fgets( buf, 4096, stdin )  )
       {
          text_len = strlen( buf );

          if (TextToSpeechSpeak( ttsHandle, buf, dwFlags) != MMSYSERR_NOERROR  )
          {
             fprintf(stderr,"Error writing %d bytes to TextToSpeech.\n",text_len);
             break;
          }
          total_bytes += nbytes;
       }
       /******************************************************/
       /* Let's make sure that all the text has been spoken. */
       /******************************************************/
       TextToSpeechSync( ttsHandle );

       return( total_bytes );
    }

    /***********************************************/
    /* Open the file				   */
    /***********************************************/
    fileHandle = fopen( file_name, "r" );
    if ( fileHandle == (FILE *)NULL )
    {
        fprintf(stderr,"play_file: Cannot open %s for reading.\n",file_name);
        return( 0 );
    }

    /***********************************************/
    /* Read 4096 bytes and playback until EOF	   */
    /***********************************************/
    bzero( buf, 4096 );
    while( ( nbytes = fread( buf, 1, 4096, fileHandle ) ) > 0 )
    {
        text_len = strlen( buf );
        if (TextToSpeechSpeak( ttsHandle, buf, dwFlags) != MMSYSERR_NOERROR  )
        {
          fprintf(stderr,"Error writing %d bytes to TextToSpeech.\n",text_len);
          break;
        }
        total_bytes += nbytes;
    }

    /******************************************************/
    /* Let's make sure that all the text has been spoken. */
    /******************************************************/
    TextToSpeechSync( ttsHandle );

    /******************************************************/
    /* Done, close the file and return the byte count.    */
    /******************************************************/
    fclose( fileHandle );
    return( total_bytes );
}


/*******************************************************************************
**
**  SaveWaveFile
**
**  FUNCTIONAL DESCRIPTION:
**
**    Opens a waveout file (TextToSpeechOpenWaveOutFile), gets the text
**    from the text window, converts it into the waveout format and write
**    it out to the opened file (TextToSpeechSpeak).  It then closes the
**    waveout file (TextToSpeechCloseWaveOutFile).
**
**
**  FORMAL PARAMETERS:
**
**    fname - Path and file name of the file to be created.
**
**  RETURN VALUE
**
**   1 - If successful
**   0 - If failed
**
******************************************************************************/
MMRESULT OpenOutputWaveFile( char * fname, int encoding )
{
   DWORD dwDevOptions;
   MMRESULT mmStatus;

   dwDevOptions = devEncoding[encoding];
   mmStatus = TextToSpeechOpenWaveOutFile( ttsHandle, fname, dwDevOptions);

   return( mmStatus );
}
/*******************************************************************************
**
**  SaveWaveFile
**
**  FUNCTIONAL DESCRIPTION:
**
**    Opens a waveout file (TextToSpeechOpenWaveOutFile), gets the text
**    from the text window, converts it into the waveout format and write
**    it out to the opened file (TextToSpeechSpeak).  It then closes the
**    waveout file (TextToSpeechCloseWaveOutFile).
**
**
**  FORMAL PARAMETERS:
**
**    fname - Path and file name of the file to be created.
**
**  RETURN VALUE
**
**   1 - If successful
**   0 - If failed
**
******************************************************************************/
MMRESULT CloseOutputWaveFile( )
{
   MMRESULT mmStatus;
                                                            
   mmStatus = TextToSpeechCloseWaveOutFile( ttsHandle );
   return ( mmStatus );
}



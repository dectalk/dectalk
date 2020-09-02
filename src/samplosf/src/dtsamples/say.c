/**********************************************************************/
/*                         Copyright �                                */
/*																	  */
/*  Copyright (c) 2000, 2001 Force Computers Inc. a Solectron comapny. All rights reserved */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Force Computers Incorporated. Possession, use,      */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Force or an authorized            */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Force Computers Incorporated may not be used to       */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  This software is provided "as is" and without any express or      */
/*  implied warranties, including, without limitation, implied        */
/*  warranties of non-infringement, merchantibility or fitness        */
/*  for a particular purpose. Force assumes no responsibility AT      */
/*  ALL for the use or reliability of this software.                  */
/*                                                                    */
/**********************************************************************/

/* COMMENTS	
	001		11/04/94  	Revision 1.2 root
						Initial load of project
	002		11/07/94  	Revision 1.2.2.2 Krishna_Mangipudi
						Initial Check-in 
	003		07/05/95	Revision 1.1.2.2 Krishna_Mangipudi
						Moved from ./dtk/src/cleints/dtsamples
	004		02/23/96 	Revision 1.1.2.3 17:28:30  Bill_Hallahan
						Added WAVE_OUT_SHAREABLE flag
	005		03/04/96	Revision 1.1.2.4 Krishna_Mangipudi
						Removed calls to figure out best device, tts engine does this now
	006		05/30/96	Revision 1.1.2.5 Krishna_Mangipudi
						Added capability to play from redirected pipes (stdin)
	007		10/01/96	Revision 1.1.2.6  17:14:26  Cathy_Page
						Added more error messages for license error in TextToSpeechStartup
	008		11/19/96	Revision 1.1.2.7 Cathy_Page 
						Remove reference to bba and j300
						Check for error code of MMSYSERR_NOTENABLED from TextToSpeechStartup
						to determine if no license pak was found.
						Fixed problem with -fo defaulting to dtmemory.wav
	009	cjl	05/14/97	Initial Version
	010	cjl	10/01/97	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX.
	011	cjl	10/27/97	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK).
						Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. 
						Alpha NT has a build bug. 
	012	cjl	10/27/97 	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). 
						Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. 
						Alpha NT has a build bug.
	013	cjl	10/31/97 	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 
	014	cjl	11/17/97	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 
	015	cjl	11/21/97	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 
	016	cjl	12/05/97	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX, 
						and SAPI speed improvements. 
	017	cjl 12/09/97	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 
	018	cjl 01/22/98	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 
	019	cjl 01/30/98	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and 
						NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 
						and 16 bit. 
	020	cjl 02/19/98	Build 107 V4.50.03 B003 Freeze of code for beta release.
	021 ETT 10/05/98	added linux code  
	022		11/04/98  	Revision 1.1.2.8  Eric Thompson made changes for linux
	023 MGS	02/09/00	changed __linux__ to use the shared audio device since it works now
	024	MGS	06/19/01	Solaris port BATS#972	
	025 cab	06/25/01	Added Force copyright info.
	
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
#if defined __sparc
#include <pthread.h>
#endif
#include <stdio.h>
//#include <fcntl.h>
#include <errno.h>
#if defined __linux__ || defined VXWORKS || defined __sparc
#include <string.h>
#include <stdlib.h>
#endif
#ifdef __osf__
#include <mme/mmsystem.h>
#endif
#include <dtk/ttsapi.h>

 /*
  * Global variables
  */
LPTTS_HANDLE_T ttsHandle;
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
#if defined __linux__ || defined _SPARC_SOLARIS_
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
    unsigned int  devNo = WAVE_MAPPER;
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


// #if defined VXWORKS 
    devOptions |= DO_NOT_USE_AUDIO_DEVICE;
// #else
//     devOptions |= WAVE_OPEN_SHAREABLE;
// #endif

    status = TextToSpeechStartup( &ttsHandle,devNo, devOptions, NULL, NULL );

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
		fprintf(stderr,"\n%s: TextToSpeechStartup failed with code %d, exiting.\n","main",status);
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
	while ( fgets(buf,255,stdin))
	{
	    text_len = strlen( buf );
	    if (text_len==2)
		{
			TextToSpeechTyping(ttsHandle,buf[0]);
		}
		else
		{
	    		TextToSpeechReset(ttsHandle,FALSE);
	    if (TextToSpeechSpeak(ttsHandle, buf, dwFlags) != MMSYSERR_NOERROR )
	    {
		fprintf(stderr,"Error writing %d bytes to TextToSpeech.\n",
                                     text_len);
		break;
	    }
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
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
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
	int value;
    DWORD dwFlags = TTS_FORCE;

    /******************************************************/
    /* See if text is in redirected UNIX pipes            */
    /******************************************************/
    if ( isAPipe == TRUE )
    {
       while( fgets( buf, 4096, stdin )  )
       {
          text_len = strlen( buf );

          if (value=TextToSpeechSpeak( ttsHandle, buf, dwFlags) != MMSYSERR_NOERROR  )
          {
             fprintf(stderr,"Error writing %d bytes to TextToSpeech 1 with code %d.\n",text_len,value);
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
        if (value=TextToSpeechSpeak( ttsHandle, buf, dwFlags) != MMSYSERR_NOERROR  )
        {
          fprintf(stderr,"Error writing %d bytes to TextToSpeech 2 with code %d.\n",text_len,value);
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



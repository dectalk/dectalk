#define STRICT
#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

#include "ttsapi.h"

/****************************************************************************/

#define INPUT_CMDLINE       0
#define INPUT_STDIN         1

#define OUTPUT_SOUND        0
#define OUTPUT_WAVE         1
#define OUTPUT_LOGTEXT      2
#define OUTPUT_LOGPHONEME   3
#define OUTPUT_LOGSYLLABLE  4

/****************************************************************************/

void        OutputHelp( void );
void        ErrorOut( char *message );
void        PutStdOut( char *message );
int         ParseArgs( int ac, char **av );
MMRESULT    SpeakCmdLine( int ac, char **av, int firstIndex );
MMRESULT    SpeakStdin( void );
BOOL        CtrlHandler( DWORD dwCtrlType );

/****************************************************************************/

HANDLE      hStdin;                       /* File handle for std. input  */
HANDLE      hStdout;                      /* File handle for std. output */
HANDLE      hStderr;                      /* File handle for std. error  */
int         inputMode = INPUT_STDIN;      /* Where does input come from  */
int         outputMode = OUTPUT_SOUND;    /* Where does output go to     */
char        *prefixText = NULL;           /* Text to speak before input  */
char        *postfixText = NULL;          /* Text to speak after input   */
char        *outFile = NULL;              /* Name of output file         */
char        *dictFile = NULL;             /* User dictionary to load     */
LPTTS_HANDLE_T ttsHandlePtr = NULL;       /* DECtalk TTS handle          */
BOOL        signalReceived = FALSE;       /* Set TRUE on CTRL/C or Break */

/****************************************************************************/
#ifdef BORLAND_C
#pragma argsused
#endif

int main( int argc, char **argv )
{
    MMRESULT status;

    int firstWordIndex;

    /* Set control handler and get stdio info */

    SetConsoleCtrlHandler( (PHANDLER_ROUTINE) CtrlHandler, TRUE );
    hStderr = GetStdHandle( STD_ERROR_HANDLE );
    hStdin = GetStdHandle( STD_INPUT_HANDLE );
    hStdout = GetStdHandle( STD_OUTPUT_HANDLE );
    
    /* Parse the command line for options. */
        
    firstWordIndex = ParseArgs( argc, argv );
    if ( firstWordIndex < 0 )
        return 0;

    /* Initialize DECtalk and check the status */

	/* ETT 11/04/98 BATS #233:
		check if user wants wavefile out even if audio device 
		may be present.
	*/
	if ( outputMode == OUTPUT_WAVE ) 
	{
		status = TextToSpeechStartup( NULL, &ttsHandlePtr, WAVE_MAPPER, DO_NOT_USE_AUDIO_DEVICE );
	}
	else
	{
		status = TextToSpeechStartup( NULL, &ttsHandlePtr, WAVE_MAPPER, 0 );
		if ( status != MMSYSERR_NOERROR ) {
		/* ETT 11/04/98: BATS #233:
		if nodriver is returned this means that there is no audio device.
			try starting TTS again with DO_NOT_USE_AUDIO_DEVICE. */
			if ( status == MMSYSERR_NODRIVER ) 
			{
				status = TextToSpeechStartup( NULL, &ttsHandlePtr, WAVE_MAPPER, DO_NOT_USE_AUDIO_DEVICE );
				if ( status != MMSYSERR_NOERROR ) {
					if ( status == MMSYSERR_ERROR ) {
						ErrorOut( "DECtalk dictionary not found.\n" );
						return 1;
					}
					if ( status == MMSYSERR_ALLOCATED ) {
						ErrorOut( "No more DECtalk License units available.\n" );
						return 1;
					}
					if ( status == MMSYSERR_NOMEM ) {
						ErrorOut( "Memory allocation error.\n" );
						return 1;
					}
				}
			}
			/* ETT 11/04/98: add meaningful exit error output. */
			if ( status == MMSYSERR_ERROR ) {
				ErrorOut( "DECtalk dictionary not found.\n" );
				return 1;
			}
			if ( status == MMSYSERR_ALLOCATED ) {
				ErrorOut( "No more DECtalk License units available.\n" );
				return 1;
			}
			if ( status == MMSYSERR_NOMEM ) {
				ErrorOut( "Memory allocation error.\n" );
				return 1;
			}
		}
	}	

    /* Do we have to load a user dictionary? */
    if ( dictFile != NULL ) {

        /* First unload any previously loaded user dictionary */

        status = TextToSpeechUnloadUserDictionary( ttsHandlePtr );

        /* Now load the new one */

        status = TextToSpeechLoadUserDictionary( ttsHandlePtr, dictFile );
    }
    
    /* Do we have to open an output file? */

    switch ( outputMode ) {
        case OUTPUT_WAVE :
            if ( outFile != NULL )
                status = TextToSpeechOpenWaveOutFile( ttsHandlePtr,
                                                      outFile,
                                                      WAVE_FORMAT_1M16 );
            break;

        case OUTPUT_LOGTEXT :
            if ( outFile != NULL )
                status = TextToSpeechOpenLogFile( ttsHandlePtr, outFile,
                                                  LOG_TEXT );
            break;

        case OUTPUT_LOGPHONEME :
            if ( outFile != NULL )
                status = TextToSpeechOpenLogFile( ttsHandlePtr, outFile,
                                                  LOG_PHONEMES );
            break;

        case OUTPUT_LOGSYLLABLE :
            if ( outFile != NULL )
                status = TextToSpeechOpenLogFile( ttsHandlePtr, outFile,
                                                  LOG_SYLLABLES );
            break;

    }

    /* Do we have prefix text to speak? */

    if ( prefixText != NULL )
        status = TextToSpeechSpeak( ttsHandlePtr, prefixText, TTS_FORCE );
            
    /* Branch depending on what kind of input we have */

    switch ( inputMode ) {
        case INPUT_CMDLINE :
            status = SpeakCmdLine( argc, argv, firstWordIndex );
            break;

        case INPUT_STDIN :
            status = SpeakStdin();
            break;

        default:
            ErrorOut( "Invalid input mode\n" );
            break;
    }

    /* Do we have postfix text to speak? */

    if ( postfixText != NULL )
        status = TextToSpeechSpeak( ttsHandlePtr, postfixText, TTS_FORCE );

    /* Sync to make sure everything has come out */

    TextToSpeechSpeak( ttsHandlePtr, "        ", TTS_FORCE );
    TextToSpeechSync( ttsHandlePtr );

    /* If we opened an output file, close it. */

    switch ( outputMode ) {
        case OUTPUT_WAVE :
            if ( outFile != NULL )
                status = TextToSpeechCloseWaveOutFile( ttsHandlePtr );
            break;

        case OUTPUT_LOGTEXT :
        case OUTPUT_LOGPHONEME :
        case OUTPUT_LOGSYLLABLE :
            if ( outFile != NULL )
                status = TextToSpeechCloseLogFile( ttsHandlePtr );
            break;
    }

    /* Shut down DECtalk. */

    TextToSpeechShutdown( ttsHandlePtr );

    return 0;
}


/*
 * ParseArgs
 *
 * Parses the arguments in argv and sets global variables representing
 * program options.
 *
 * Returns firstWordIndex, the array index (to argv) of the first argument
 * which is text to be spoken.  If the return value is zero, no arguments
 * are to be spoken directly.  If the return value is negative, no further
 * processing occurs.
 */

int ParseArgs( int ac, char **av )
{    
    int i;

    /* Loop over arguments, looking for command line options */
    
    for ( i = 1; i < ac; i++ ) {

        /* If not a command line option, it's text to speak.  */
        
        if ( (av[i][0] != '-') && (av[i][0] != '/') ) {
            inputMode = INPUT_CMDLINE;
            return i;
        }

        /*
         * If the second character is a dash or slash, it's also
         * text to speak.
         */
         
        else if ( (av[i][1] == '-') || (av[i][1] == '/') ) {
            inputMode = INPUT_CMDLINE;
            av[i]++;                    /* Go past first / or - */
            return i;
        }

        /* Process log file spec */

        else if ( av[i][1] == 'l' ) {
            if ( i < (ac - 1) ) {

                /* Get log mode */

                if ( av[i][2] == 'p' )
                    outputMode = OUTPUT_LOGPHONEME;
                else if ( av[i][2] == 's' )
                    outputMode = OUTPUT_LOGSYLLABLE;
                else
                    outputMode = OUTPUT_LOGTEXT;   /* Default is 't' text log */

                /* Get log file name */
                
                i++;
                outFile = av[i];                
            }
        }

        /* Process wave file spec */

        else if ( av[i][1] == 'w' ) {
            if ( i < (ac - 1) ) {
                i++;
                outFile = av[i];
                outputMode = OUTPUT_WAVE;
            }
        }

        /* Process dictionary file spec */

        else if ( av[i][1] == 'd' ) {
            if ( i < (ac - 1) ) {
                i++;
                dictFile = av[i];
            }
        }

        /* Process prefix */

        else if ( strcmp( &av[i][1], "pre" ) == 0 ) {
            if ( i < (ac - 1) ) {
                i++;
                prefixText = av[i];
            }
        }

        /* Process postfix */

        else if ( strcmp( &av[i][1], "post" ) == 0 ) {
            if ( i < (ac - 1) ) {
                i++;
                postfixText = av[i];
            }
        }

        /* Process request for help */

        else if ( (av[i][1] == 'h') || (av[i][1] == '?') ) {
            OutputHelp();
            return -1;
        }
        
        /* Process invalid argument */

        else {
            ErrorOut( "Invalid Argument\n" );
        }
        
    }    /* End of loop over arguments */

    /*
     * If we got here, we did not find any non-option arguments to speak.
     * So return 0 which means not to speak any args on the command line.
     */

    return 0;    
}


MMRESULT SpeakStdin( void )
{
    DWORD numRead;
    BOOL readStatus;
    MMRESULT status;
    char buf[2049];

    do {
        memset( buf, 0, sizeof(buf) );
        readStatus = ReadFile( hStdin, buf, 2048, &numRead, NULL );
        if ( (!readStatus) || (numRead == 0) )
            break;

        status = TextToSpeechSpeak( ttsHandlePtr, buf, TTS_FORCE );         
    } while ( readStatus );

    return status;
}


MMRESULT SpeakCmdLine( int ac, char **av, int firstIndex )
{
    int i;
    MMRESULT status;
    
    /* Loop over arguments, sending each one to DECtalk */
    
    for ( i = firstIndex; i < ac; i++ ) {

        if ( signalReceived )
            break;
    
        /* 
         * Put a space between arguments, otherwise DECtalk will run
         * them all together.
         */
    
        if ( i > firstIndex )
            status = TextToSpeechSpeak( ttsHandlePtr, " ", TTS_NORMAL );
    
        /*
         * Send the argument to DECtalk.
         */

        status = TextToSpeechSpeak( ttsHandlePtr, av[i], TTS_NORMAL );

    } /* End loop over args */

    return status;
}


void ErrorOut( char *message )
{
    DWORD numWritten;

    WriteFile( hStderr, message, strlen( message ), &numWritten, NULL );
}

void PutStdOut( char *message )
{
    DWORD numWritten;

    WriteFile( hStdout, message, strlen( message ), &numWritten, NULL );
}


#ifdef BORLAND_C
#pragma argsused
#endif

BOOL CtrlHandler( DWORD dwCtrlType )
{
    signalReceived = TRUE;
    TextToSpeechReset( ttsHandlePtr, TRUE );

    return TRUE;
}


void OutputHelp( void )
{
    PutStdOut( "SAY  [options] [text]\n" );
    PutStdOut( "\n" );
    PutStdOut( "Help Options:\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -h or -?          = Help.  Outputs this file to the console.  This\n" );
    PutStdOut( "                        option cancels any others on the command line.\n" );
    PutStdOut( "\n" );
    PutStdOut( "\n" );
    PutStdOut( "Output Options:\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -w outFile        = Convert text into specified wave file instead of\n" );
    PutStdOut( "                        speaking to the sound device.\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -l[t] outFile     = Turn on text logging, which logs all input text\n" );
    PutStdOut( "                        to a file.  This text includes any pre and post\n" );
    PutStdOut( "                        commands as well as commands sent to DECtalk by\n" );
    PutStdOut( "                        the SAY program itself.\n" );
    PutStdOut( "\n" );
    PutStdOut( "                        Since this is the default logging mode, the 't'\n" );
    PutStdOut( "                        immediately following the '-l' is optional.\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -ls outFile       = Turn on syllable logging, which logs each\n" );
    PutStdOut( "                        syllable to a  file.\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -lp outFile       = Turn on phoneme logging, which converts the\n" );
    PutStdOut( "                        input text to phonemes.  This is useful if you\n" );
    PutStdOut( "                        want to get DECtalk to sing.  You convert the\n" );
    PutStdOut( "                        text to phonemes and then insert the tone\n" );
    PutStdOut( "                        commands into the phoneme file.\n" );
    PutStdOut( "\n" );
    PutStdOut( "    If no output options are specified, SAY sends its output to the\n" );
    PutStdOut( "    installed sound device, ususally a sound card.  Only one output\n" );
    PutStdOut( "    option can be specified; if you specify more than one, the last one\n" );
    PutStdOut( "    on the command line is used.\n" );
    PutStdOut( "\n" );
    PutStdOut( "\n" );
    PutStdOut( "Input Options:\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -pre preText      = Text to be passed to DECtalk before the normal input.\n" );
    PutStdOut( "                        This is useful for passing initializing commands to\n" );
    PutStdOut( "                        DECtalk that would normally not be part of the input.\n" );
    PutStdOut( "                        If the prefix text has spaces, it must be enclosed in\n" );
    PutStdOut( "                        quotes.  An example would be \"[:phoneme on]\" or\n" );
    PutStdOut( "                        \"[:nb :ra200]\".\n" );
    PutStdOut( "\n" );
    PutStdOut( "                        The prefix text is \"forced\" out before the input text\n" );
    PutStdOut( "                        is read.\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -post postText    = Text to be passed to DECtalk after the normal input.\n" );
    PutStdOut( "                        This is useful for passing terminating commands to\n" );
    PutStdOut( "                        DECtalk that would normally not be part of the input.\n" );
    PutStdOut( "                        If the postfix text has spaces, it must be enclosed\n" );
    PutStdOut( "                        in quotes.  An example would be \"[:phoneme off]\" or\n" );
    PutStdOut( "                        \"The End\".\n" );
    PutStdOut( "\n" );
    PutStdOut( "                        The \"normal\" input is \"forced\" out before the postfix\n" );
    PutStdOut( "                        text is read.\n" );
    PutStdOut( "\n" );
    PutStdOut( "    text              = Text appearing on command line is spoken.  The text\n" );
    PutStdOut( "                        to be spoken can either come from the standard\n" );
    PutStdOut( "                        input or from the command line.\n" );
    PutStdOut( "\n" );
    PutStdOut( "                        Anything on the command line that is not an option\n" );
    PutStdOut( "                        will be interpreted as text, as will anything following\n" );
    PutStdOut( "                        it on the command line.  In other words, text to\n" );
    PutStdOut( "                        be spoken must appear on the command line after\n" );
    PutStdOut( "                        all options.\n" );
    PutStdOut( "\n" );
    PutStdOut( "                        If the *first* word in the text has a dash (-) or\n" );
    PutStdOut( "                        slash (/) as its first character, you must precede\n" );
    PutStdOut( "                        it with another dash or slash.  For example, to tell\n" );
    PutStdOut( "                        DECtalk to say the number -123, you would type the\n" );
    PutStdOut( "                        command\n" );
    PutStdOut( " \n" );
    PutStdOut( "                          SAY --123\n" );
    PutStdOut( "\n" );
    PutStdOut( "                        This is necessary to avoid having SAY interpret the\n" );
    PutStdOut( "                        number as a command line option.\n" );
    PutStdOut( "\n" );
    PutStdOut( "                        If you embed DECtalk commands into your text, you must\n" );
    PutStdOut( "                        enclose them in quotes if they contain spaces.\n" );
    PutStdOut( "                        This is because SAY treats each space-delimited\n" );
    PutStdOut( "                        command-line argument as a separate \"word\",\n" );
    PutStdOut( "                        while DECtalk commands must be processed as\n" );
    PutStdOut( "                        single \"words\" by the SAY program.\n" );
    PutStdOut( "\n" );
    PutStdOut( "    If no text is specified, SAY will take its input from the standard input.\n" );
    PutStdOut( "    For example, you could have SAY speak a directory listing in Betty's\n" );
    PutStdOut( "    voice by typing\n" );
    PutStdOut( "\n" );
    PutStdOut( "        DIR | SAY -pre \"[:nb]\"\n" );
    PutStdOut( "\n" );
    PutStdOut( "    or you could just type the command\n" );
    PutStdOut( "\n" );
    PutStdOut( "        SAY\n" );
    PutStdOut( "\n" );
    PutStdOut( "    and then enter text at the console.  In this case, SAY speaks each\n" );
    PutStdOut( "    line after you press RETURN, and exits after you press CTRL-Z.  If\n" );
    PutStdOut( "    you want SAY to take its input from a file, use file redirection as\n" );
    PutStdOut( "    in the following example, which reads the file FOO.TXT in Harry's\n" );
    PutStdOut( "    voice.\n" );
    PutStdOut( "\n" );
    PutStdOut( "        SAY -pre \"[:nh]\" < FOO.TXT\n" );
    PutStdOut( "\n" );
    PutStdOut( "\n" );
    PutStdOut( "Dictionary Options:\n" );
    PutStdOut( "\n" );
    PutStdOut( "    -d userDict       = Loads the specified user dictionary before\n" );
    PutStdOut( "                        speaking.  This dictionary is loaded in place of\n" );
    PutStdOut( "                        any default user dictionary determined by DECtalk.\n" );
    PutStdOut( "\n" );
}

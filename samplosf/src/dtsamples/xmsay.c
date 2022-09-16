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
 * Revision 1.1.2.9  1996/11/19  12:22:27  Cathy_Page
 * 	Remove reference to bba and j300
 * 	[1996/11/19  12:20:52  Cathy_Page]
 *
 * Revision 1.1.2.8  1996/10/01  18:00:19  Cathy_Page
 * 	Typo - Changed UNIT to UINT
 * 	[1996/10/01  18:00:02  Cathy_Page]
 * 
 * Revision 1.1.2.7  1996/10/01  17:14:40  Cathy_Page
 * 	Changed callback routine - Added new param (uiMsg); Removed OUTPUT_TO_*_DEVICE from device options
 * 	[1996/10/01  17:12:52  Cathy_Page]
 * 
 * Revision 1.1.2.6  1996/03/19  18:57:08  Krishna_Mangipudi
 * 	Moved MME and DECtalk files to be after X11 files
 * 	[1996/03/19  18:56:58  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.5  1996/03/19  16:14:19  Krishna_Mangipudi
 * 	Initialize the indexCallbackRoutine in main
 * 	[1996/03/19  16:13:58  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.4  1996/02/15  05:35:25  Bill_Hallahan
 * 	Removed 1 second sleep
 * 	[1996/02/15  05:35:06  Bill_Hallahan]
 * 
 * Revision 1.1.2.3  1996/02/14  01:03:28  Krishna_Mangipudi
 * 	check for playBuffer == NULL and sfile == NULL
 * 	[1996/02/14  01:03:19  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.2  1995/07/05  18:22:21  Krishna_Mangipudi
 * 	Moved from ./src/clients
 * 	[1995/07/05  18:21:54  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:42:39  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:49:03  Krishna_Mangipudi]
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

/****************************************************************************
**  PROGRAM:
**      xmsay.c 
**
**  ABSTRACT:
**
**      This is a test program to demonstrate the use of DECtalk APIs.  
**	The major functions demonstrated in this program are:
**		o Read an input file or read text typed into the widget
**		o Initialize and call TextToSpeech APIs to convert
**		  the text into computer synthesized speech.
**		o Save a text file as a wave file.
**              o Change the speech rate.
**              o Select one of 9 different voices.
**              o Other capabilities such as Pause, Resume and Stop 
**                speech.
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     DAVE 
**       (Dectalk Audio Visual Engineer)
**
**  CREATION DATE:
**     July 8, 1993
**
**  MODIFICATION HISTORY:
**
**     Mar 18, 1994    KM  Now handles -d command line option.
**     Aug 11, 1994    KM  Added setSleep flag.
**     Sep 09, 1994    KM  Reworked how text is queued.
**     Feb 15, 1996    WH  Removed sleep flag, no longer necessary.
**
******************************************************************************/

/*
 **************************************************************************
 * Define DEC to enable us to use DEC
 * specific MME structures.
 **************************************************************************
 */
#define DEC 1

/*
 ************************************************************************** 
 * Standard header files 
 **************************************************************************
 */
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <sys/limits.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/stat.h>
/*
 ************************************************************************** 
 * Header files used by all apps using widgets 
 **************************************************************************
 */
#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <Xm/Xm.h>
#include <Mrm/MrmAppl.h>	

#include <Xm/PanedW.h>		/* for Paned Window */
#include <Xm/Text.h>		/* for Text */
#include <Xm/Label.h>		/* for Label */
#include <Xm/FileSB.h>		/* for File Selection Box */
#include <Xm/RowColumn.h>	/* for RowColumn */
#include <Xm/PushBG.h>		/* for Push Button Gadget */
#include <Xm/CascadeB.h>	/* for Cascade button */
#include <Xm/ToggleBG.h>	/* for Toggle Button Gadget */
#include <Xm/Form.h>		/* for Form */
/*
 **************************************************************************
 * Header files for MME and DECtalk.
 **************************************************************************
 */
#include <mme/mmsystem.h>
#include <dtk/ttsapi.h>             /* DECtalk Text to Speech header file */

/* 
 **************************************************************************
 * Constants & macros 
 **************************************************************************
 */
#define ZERO    0
#define SPEAKER 1
#define UIDFILE "xmsay.uid"
            /*
             * UIL widget constants
             */
#define STOP  0
#define PLAY  1
#define PAUSE 2
#define SRATE 3
#define TEXT  4
#define SLABL 5
#define NUM_TOGGLES 3
#define menu_open 1
#define menu_save 2
#define menu_quit 3 

/*
 **************************************************************************
 * Function forward declarations
 **************************************************************************
 */
void FileMenuSelect();
void PauseButtonSelect();
void SpeakerMenuSelect();
void ProcessName();
void CancelPrompt();
void ContinuePrompt();
void CenterWidgetOverCursor();
void SetupForm();
void ChangeState();
void SetCurrentToggle();
void WidgetCreate();
void UpdateSpeakingRate();
int  InputFile();
int PlaySome();
void index_callback();
MMRESULT SaveFile();

/* 
 **************************************************************************
 * Globals 
 **************************************************************************
 */

static char uid_file[] = UIDFILE;
String fallback_resources[] = {
    "xmsay*foreground:		SteelBlue",
    "xmsay*background:		Wheat",
    "*menuButton.label:			File",
    "*SimpleMenu.open.label:		Open",
    "*SimpleMenu.open.label:            Save",
    "*SimpleMenu.quit.label:		Quit",
    "*Dialog.label:			Enter the Filename",
    "*Dialog*value.translations: #override \\n <Key>Return: Ok()",
    NULL,
};

static LPTTS_HANDLE_T ttsHandle; /* DECtalk handle */

static char *title = "xmsay for OSF/1 Sample Program";
                 /*
                  * DECtalk speaker names
                  */
static char *speaker_names[10] = 
{
	"Paul",
	"Betty",
	"Harry",
	"Frank",
	"Dennis",
	"Kit",
	"Ursula",
	"Rita",
	"Wendy",
	"Val"
};
/*
 * Miscellaneous Globals
 */
int lastStatus = STOP;
int playStatus = STOP;
int SpeakingRate = 180;
int CurrentSpeaker = 0;
float def_offset = 0.175;
void (*indexCallbackRoutine)();
char *playBuffer = NULL;

/*
 **************************************************************************
 * X widget declarations
 **************************************************************************
 */
Widget speakerLabel;
Widget srateScale;
Widget textWindow;
Widget toggleButton[NUM_TOGGLES];
Widget topshell;
Widget open_fsb, save_fsb, pauseDialog;
Widget index_CB;
Widget open_err, save_err;
Widget playmain;
char InputFileName[PATH_MAX];
char OutputFileName[PATH_MAX];
int  OutputFormat;
char *sfile = NULL;
XtAppContext app_con;
XmStringCharSet charset = (XmStringCharSet) XmSTRING_DEFAULT_CHARSET;
off_t FileLen = 0;
off_t FilePos = 0;

typedef struct _AppResources
{
    String geometry;
    int device;
    float offset;
    int gain;
    String file;
} AppResources;

AppResources app_resources;

/*
 **************************************************************************
 * X widget resource declarations
 **************************************************************************
 */
static XtResource resources[] = 
{
   {"geometry", "Geometry", XtRString, sizeof(char *),
       XtOffset(AppResources *,geometry), XtRString, NULL},
   {"device", "Device", XtRInt, sizeof(int),
       XtOffset(AppResources *,device), XtRImmediate, (XtPointer)SPEAKER},
   {"offset", "Offset", XtRFloat, sizeof(float),
       XtOffset(AppResources *,offset), XtRFloat, (XtPointer)&def_offset},
   {"gain", "Gain", XtRInt, sizeof(int),
       XtOffset(AppResources *,gain), XtRImmediate, (XtPointer)0},
   {"file", "File", XtRString, sizeof(char *),
       XtOffset(AppResources *,file), XtRString, NULL},
};

static XrmOptionDescRec options[] = 
{
   {"-geometry", "geometry", XrmoptionSepArg, NULL},
   {"-device", "device", XrmoptionSepArg, NULL},
   {"-offset", "offset", XrmoptionSepArg, NULL},
   {"-gain", "gain", XrmoptionSepArg, NULL},
   {"-file", "file", XrmoptionSepArg, NULL},
};

static MrmHierarchy s_MrmHierarchy;     /* MRM database hierarchy ID */
static char *db_filename_vec[] = 
{
    "xmsay.uid"        	        /* UID file for xmsay */
};
static int db_filename_num = 
    (sizeof db_filename_vec / sizeof db_filename_vec[0]);
static char *db_backup_vec[] = 
{
    uid_file
};
static int db_backup_num = 
    (sizeof db_backup_vec / sizeof db_backup_vec[0]);
/*
 **************************************************************************
 * Motif widget callback registeration
 **************************************************************************
 */
static MrmRegisterArg reglist[] = 
{
   {"ChangeState", (caddr_t) ChangeState},
   {"ProcessName", (caddr_t) ProcessName},
   {"FileMenuSelect", (caddr_t) FileMenuSelect},
   {"PauseButtonSelect", (caddr_t) PauseButtonSelect},
   {"SpeakerMenuSelect", (caddr_t) SpeakerMenuSelect},
   {"CancelPrompt", (caddr_t) CancelPrompt},
   {"ContinuePrompt", (caddr_t) ContinuePrompt},
   {"WidgetCreate", (caddr_t) WidgetCreate},
   {"UpdateSpeakingRate", (caddr_t) UpdateSpeakingRate},
};
static int reglist_num = (sizeof reglist / sizeof reglist[0]);

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

static void usage( char * progname )
{
    fprintf(stderr,"\t%s will read text from a file or from within the\n",
		progname);
    fprintf(stderr,"\twindow environment and will speak that text through\n");
    fprintf(stderr,"\tthe MME server using the highest quality audio device\n");
    fprintf(stderr,"\tit finds. You can override this option by using the \n");
    fprintf(stderr,"\t-d command line option to specify a particular audio \n");
    fprintf(stderr,"\tdevice.\n\n");
    fprintf(stderr,"Usage: %s [-h] [-d #] \n", progname);
    fprintf(stderr,"          -h        This help message\n");
    fprintf(stderr,"          -d #      Select the audio device ( 0 or 1 )\n");
    exit(-1);
}


/*
*****************************************************************************
**
**  main 
**
**  FUNCTIONAL DESCRIPTION:
**  
**     This is the main routine for this example. The major activities within
**     this routine are:
**
**		o Initialize the DECwindows motif toolkit interface 
**                create a top level window widget
**              o Open a DECtalk connection.
**              o Fetch the widgets used by the rest of this application.
**		o Start the X main loop.
**
**
**  FORMAL PARAMETERS:
**     argc - Count of arguments passed on the command line.
**            If greater than 1, then an error is assumed and an
**            error message is printed.
**
**     argv -  Array of pointers to command line arguments.  This
**             sample program does not expect any command line input
**             parameters.
**
**  RETURN VALUE
**     None
**
*****************************************************************************
*/
main (argc,argv)
int argc;
char *argv[];
{
    MrmType class;
    int i;
    Arg arg[1];
    int sel = 0;
    long devOptions = 0;
    long userSelectedDevice = WAVE_MAPPER;
    long bestDevOption = 0;
    int devNo = 0;
    long indexParams;
    MMRESULT status;
    MMRESULT num_wave_out_devices = waveOutGetNumDevs();
    LPWAVEOUTCAPS pWaveOutCaps = NULL;

    /*
     * Initialize the routine to callback with index marks...
     */
    indexCallbackRoutine = index_callback;

    /*
     * Check if the MME server is running...
     */

    if (num_wave_out_devices <= 0) 
    {
        fprintf(stderr, "xmsay exiting: Could not find any wave devices\n");
        fprintf(stderr, "Check to see if mmeserver is running. \n");
        exit(1);
    }

    pWaveOutCaps = (WAVEOUTCAPS *) mmeAllocMem( sizeof( WAVEOUTCAPS ));
  
    i = 1;
    if( argc > 1 )
    {
        /************************************************/
        /* Speaker id                                   */
        /************************************************/
        if( strcmp("-d",argv[i]) == 0 )
        {
            i++;
            userSelectedDevice = atoi( argv[i] );
        }
        if( strcmp("-h",argv[i]) == 0 )
        {
            usage( argv[0] );
        }
    }


    /*
     *  Motif initialize routine 
     */
    MrmInitialize();
    /*
     * Initialize the top level widget
     */
    topshell = XtAppInitialize(&app_con,"xmsay",options,XtNumber(options),
			       &argc,argv,fallback_resources,NULL,ZERO);
    i=0;
    XtSetArg(arg[i],XtNtitle,title); i++;
    XtSetValues(topshell,arg,i);

    /* 
     * Open the UID files (the output of the UIL compiler) 
     * in the hierarchy
     */
    if ( MrmOpenHierarchy(db_filename_num,db_filename_vec,NULL,
			  &s_MrmHierarchy) != MrmSUCCESS) {
	if ( MrmOpenHierarchy(db_backup_num,db_backup_vec,NULL,
			      &s_MrmHierarchy) != MrmSUCCESS) {
	    fprintf(stderr,"Can't open UID hierarchy.\n");
	    exit(1);
	}
    }

    if (MrmRegisterNames (reglist, reglist_num) != MrmSUCCESS) {
	fprintf(stderr, "Can't register names\n");
	exit(1);
    }

    /***********************************************/
    /* Start up the TextToSpeech System and find   */
    /* the best audio quality possible             */
    /***********************************************/
    devNo  = userSelectedDevice; 
    indexParams = 0;
    ttsHandle = NULL;

    if( userSelectedDevice == WAVE_MAPPER )
    {
        for( i = 0; i < num_wave_out_devices ; i++ )
        {
            status = waveOutGetDevCaps( i, pWaveOutCaps, sizeof( WAVEOUTCAPS ));
            if( status != MMSYSERR_NOERROR )
            {
              fprintf(stderr,"Error with MME could not get the wave device.\n");
              fprintf(stderr,"Is the MM server ready?\n");
              exit( 1 );
            }
            devOptions |= pWaveOutCaps->dwFormats;
        }

        bestDevOption = ( devOptions & WAVE_FORMAT_1M16 ) ? WAVE_FORMAT_1M16 :
                        ( devOptions & WAVE_FORMAT_1M08 ) ? WAVE_FORMAT_1M08 :
                     ( devOptions & WAVE_FORMAT_08M08 ) ? WAVE_FORMAT_08M08 : 0;

    	devOptions =  bestDevOption;
    }

    /* user specified a device on command line */
    else 
    {
       status = waveOutGetDevCaps( devNo, pWaveOutCaps, sizeof( WAVEOUTCAPS ));
       if( status != MMSYSERR_NOERROR )
       {
          fprintf(stderr,"Error with MME could not get the wave device.\n");
          fprintf(stderr,"Is the MM server ready?\n");
          exit( 1 );
       }
            devOptions |= pWaveOutCaps->dwFormats;

       bestDevOption = ( devOptions & WAVE_FORMAT_1M16 ) ? WAVE_FORMAT_1M16 :
                       ( devOptions & WAVE_FORMAT_1M08 ) ? WAVE_FORMAT_1M08 :
                     ( devOptions & WAVE_FORMAT_08M08 ) ? WAVE_FORMAT_08M08 : 0;

       devOptions =  bestDevOption;
    }

    if ( TextToSpeechStartup( &ttsHandle, devNo, devOptions,
                 indexCallbackRoutine, indexParams )  
                              != MMSYSERR_NOERROR) {
	fprintf(stderr, "%s: can't open DECtalk connection.\n", argv[0]);
	exit(1);
    }
    /*
     * Get the widgets used in this application
     */
    XtGetApplicationResources( topshell, (XtPointer) &app_resources,
                               resources, XtNumber(resources), NULL, ZERO );
    if ( MrmFetchWidget(s_MrmHierarchy, "play_main", topshell,
			&playmain,&class) != MrmSUCCESS) {
	fprintf(stderr, "Can't fetch widget play main\n");
	exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "open_fs_box", topshell,
			&open_fsb,&class) != MrmSUCCESS) {
	fprintf(stderr, "Can't fetch widget open fs box\n");
	exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "save_fs_box", topshell,
                        &save_fsb,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save fs box\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "pause_dialog", topshell,
			&pauseDialog,&class) != MrmSUCCESS) {
	fprintf(stderr, "Can't fetch widget pause dialog\n");
	exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "index_CB_dialog", topshell,
                        &index_CB,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget index CB dialog \n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "open_error", topshell,
			&open_err,&class) != MrmSUCCESS) {
	fprintf(stderr, "Can't fetch widget open error\n");
	exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "save_error", topshell,
                        &save_err,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save error\n");
        exit(1);
    }

    XtManageChild(playmain);
    XtRealizeWidget(topshell);
    XtAppMainLoop(app_con);
}
/***************************************************************************
**
**  PlaySome 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**************************************************************************/
int PlaySome()
{
    unsigned int identifier; 
    unsigned int items_in_pipe;
    long dwFlags;

    identifier = INPUT_CHARACTER_COUNT;
    /*
     * wait until input buffer is empty before sending the next line
     */
    TextToSpeechGetStatus( ttsHandle, &identifier, &items_in_pipe, 1 );
    if ( (items_in_pipe == 0) && (playStatus == PLAY) )
    {
       /********************************************************/
       /* find number of bytes to next new-line or end of file */
       /********************************************************/
       playBuffer = (char *) malloc ( (sizeof(char) * FileLen) + 1 );
       if ( (playBuffer == NULL) || (sfile == NULL) )
       {
          return(FALSE);
       }

       strncpy( playBuffer, &sfile[FilePos], FileLen);
       playBuffer[FileLen] = '\0';

       /********************************/
       /* play the text                */
       /********************************/
       dwFlags = TTS_FORCE;
       TextToSpeechSpeak( ttsHandle, playBuffer, dwFlags );
       playStatus = STOP;

       EnableUI();
    }
    else
    {
       /*
        * free buffer contents
        */
       if ( sfile != NULL )
       {
          XtFree( sfile );
          sfile = NULL;
       }
       if ( playBuffer != NULL )
          free( playBuffer );
       EnableUI();
    }
      
    return(FALSE); 
}
/****************************************************************************
**
**  DisableUI 
**
**  FUNCTIONAL DESCRIPTION:
**
**     Locks the text window so that new text may not be
**     entered during playback.
**
**  FORMAL PARAMETERS:
**
**     None
**
**  RETURN VALUE
**
**     None
**
***************************************************************************/
DisableUI()
{
    int i;
    Arg args[1];

    /*
     * make the text window non-editable
     */
    i=0;
    XtSetArg(args[i],XmNeditable,FALSE); i++;
    XtSetValues(textWindow,args,i);
}
/****************************************************************************
**
**  EnableUI 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Allows text to be typed into the text window.
**    Also enables the Play Speech Rate
**    widgets. 
**
**  FORMAL PARAMETERS:
**
**    None
**
**  RETURN VALUE
**
**    None
**
***************************************************************************/
EnableUI()
{
    int i;
    Arg args[1];

    /*
     * make the text window editable
     */
    i=0;
    XtSetArg(args[i],XmNeditable,TRUE); i++;
    XtSetValues(textWindow,args,i);

    /*
     * enable widgets
     */
    i=0;
    XtSetArg(args[i],XmNsensitive,TRUE); i++;
    XtSetValues(toggleButton[PLAY],args,i);
    XtSetValues(srateScale,args,i);
}
/****************************************************************************
**
**  StartPlay 
**
**  FUNCTIONAL DESCRIPTION:
**
**   This procedure handles the state transition between
**   the Play, Pause and Stop states.  The current state is
**   stored in a global called playStatus.  If the application
**   is already in the Play state or if the application is in 
**   Pause state then this routine does nothing.  If the application
**   is in the Stop state then this routine reads the text from the
**   text window, initializes the Speaker and Speaker Rate. 
**   Disables the text window and invokes PlaySome. 
**
**   StartPlay is invoked by the ChangeState callback routine.
**
**
**  FORMAL PARAMETERS:
**
**   None
**
**  RETURN VALUE
**
**     Changes the global playStatus.
**   
***************************************************************************/
void StartPlay()
{
    switch( playStatus )
    {
    case PLAY:
    case PAUSE:
	break;

    case STOP:
	/*
	 * get buffer contents
	 */
	sfile = XmTextGetString( textWindow );

	/*
	 * get size of buffer
	 */
	FileLen = strlen( sfile );

	/*
	 * set starting and ending positions
	 */
	FilePos = 0;

	/*
	 * update speaker label
	 */
	UpdateSpeakerLabel();

	/*
	 * set current speaker/rate
	 */
	TextToSpeechSetSpeaker( ttsHandle, CurrentSpeaker );
	TextToSpeechSetRate ( ttsHandle, SpeakingRate );

	/*
	 * disable the user interface
	 */
	DisableUI();

	/*
	 * set status
	 */
	playStatus = PLAY;

        /*
         * Play the text 
         */
        PlaySome();

	break;
    }
}
/****************************************************************************
**
**  StopPlay 
**
**  FUNCTIONAL DESCRIPTION:
**
**    StopPlay is called by the ChangeState callback routine.  If the
**    application is in the Play state then this routine changes the
**    status to Stop and does some clean up and returns.
**
**    If the application is in either the Pause or Stop state then this
**    routine does nothing.
**
**  FORMAL PARAMETERS:
**
**     None
**
**  RETURN VALUE
**
**     Changes the global playStatus.
**
***************************************************************************/
void StopPlay()
{
    switch( playStatus )
    {
    case PLAY:
	/*
	 * free buffer contents
	 */
	if ( sfile != NULL )
	{
	    XtFree( sfile );
	    sfile = NULL;
	}
        if ( playBuffer != NULL )
           free( playBuffer );

	/*
	 * enable the user interface
	 */
	EnableUI();

	/*
	 * stop DECtalk
	 */
	TextToSpeechReset( ttsHandle, FALSE );
	/*
	 * set status
	 */
	playStatus = STOP;
	break;

    case PAUSE:
	break;

    case STOP:
	/*
	 * stop DECtalk
	 */
	TextToSpeechReset ( ttsHandle, FALSE );

        /*
         * Make text widget editable 
         */
        EnableUI();
	break;
    }
}
/****************************************************************************
**
**  PausePlay 
**
**  FUNCTIONAL DESCRIPTION:
**
**    This routine is called by PauseButtonSelect callback routine;
**    it calls the TextToSpeechPause API to pause the playback.
**
**
**  FORMAL PARAMETERS:
**
**    None
**
**
**  RETURN VALUE
**
**     Changes the global playStatus.
**
***************************************************************************/
void PausePlay()
{
    /*
     * pause DECtalk
     */
    TextToSpeechPause( ttsHandle );

    /*
     * set status
     */
    lastStatus = playStatus;
    playStatus = PAUSE;
}
/****************************************************************************
**
**  ResumePlay 
**
**  FUNCTIONAL DESCRIPTION:
**
**   This routine is called from the ContinuePrompt callback routine.
**   It calls the TextToSpeechResume API call to continue playback.
**
**  FORMAL PARAMETERS:
**
**   None
**
**  RETURN VALUE
**
**   Changes the global playStatus.
**
***************************************************************************/
void ResumePlay()
{
    /*
     * resume DECtalk
     */
    TextToSpeechResume( ttsHandle );

    /*
     * set status
     */
    playStatus = lastStatus;

    if ( playStatus == PLAY )
    {
	/*
	 * Resume DECtalk 
	 */
         PlaySome();
    }
}
/****************************************************************************
**
**  ChangeState 
**
**  FUNCTIONAL DESCRIPTION:
**
**    ChangeState callback routine is called when either the
**    Stop pushbutton or the Play pushbutton is activated in the
**    UI.
**
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**
**  RETURN VALUE
**
**     None
**
***************************************************************************/
void ChangeState(w, tag, call_data)
Widget w;
int  *tag;
XtPointer call_data;
{
    Arg qarg[1];
    Boolean togState;
    /* 
     * Check which button was pushed and call appropriate
     * routine.
     */
    if (w == toggleButton[PLAY]) StartPlay();
    else if (w == toggleButton[STOP])
    {
      StopPlay();
    }
}
/****************************************************************************
**
**  WidgetCreate 
**
**  FUNCTIONAL DESCRIPTION:
**
**   This callback routine is called when the widget is created; it stores
**    the widget id
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**  RETURN VALUE
**
**    None
**
***************************************************************************/
void WidgetCreate(w,tag,call_data)
Widget w;
int *tag;
XtPointer call_data;
{
    Arg args[3];
    int i;

    switch (*tag) {
    case STOP:
	toggleButton[STOP] = w;
	break;
    case PLAY:
	toggleButton[PLAY] = w;
	break;
    case PAUSE:
	toggleButton[PAUSE] = w;
	break;
    case SRATE:
	srateScale = w;
	break;
    case TEXT:
	textWindow = w;
	XmTextSetAddMode( w, FALSE );
	InputFile( app_resources.file );
	break;
    case SLABL:
	speakerLabel = w;
	break;
    }
}

/****************************************************************************
**
**  PauseButtonSelect 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback routine activated by the user pushing down on the Pause button
**    in the UI.
**
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**
**  RETURN VALUE
**
**    None
**
***************************************************************************/
void PauseButtonSelect(w,tag,call_data)
Widget w;
int *tag;
XtPointer call_data;
{
    Arg qarg[1];
    Boolean togState;
    Widget button;

    /* 
     * Get state of button, if unset, just return 
     */
    if ( *tag == PAUSE ) {
	XtRealizeWidget(pauseDialog);
        button = (Widget) XmMessageBoxGetChild( pauseDialog, 
                                            XmDIALOG_CANCEL_BUTTON);
        XtUnmanageChild ( button );
        button = (Widget) XmMessageBoxGetChild( pauseDialog, 
                                           XmDIALOG_HELP_BUTTON);
        XtUnmanageChild ( button );
	if ( playStatus != PAUSE )
	{
	    CenterWidgetOverCursor(pauseDialog);
	    XtManageChild(pauseDialog);
	    PausePlay();
	}
    }
}

/****************************************************************************
**
**  FileMenuSelect 
**
**  FUNCTIONAL DESCRIPTION:
**
**   Callback routine called when one of the three file menu items:
**   Open, Save or Quit is selected.
**   Quit calls the TextToSpeechShutdown API and closes down the
**   application.
**   Open invokes a file selection menu to select a text file to be 
**   read in for playback. 
**   Save invokes a file selection menu to select a wave out file name
**   to save the current text as a wave out file.
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**  RETURN VALUE
**
**   None
**
***************************************************************************/
void FileMenuSelect(w,tag,call_data)
Widget w;
int *tag;
XtPointer call_data;
{
    static int open_fsbexists = FALSE;
    static int save_fsbexists = FALSE;

    switch (*tag)
    {
       case menu_quit : 
	   XtDestroyApplicationContext(XtWidgetToApplicationContext(w));
           TextToSpeechShutdown( ttsHandle ); 	/*  call cleanup routine */
	   exit(0);
           break;
       case menu_open :
	   if (open_fsbexists == FALSE) {
	       open_fsbexists = TRUE;
	       XtRealizeWidget(open_fsb);
	   }
	   CenterWidgetOverCursor(open_fsb);
	   XtManageChild(open_fsb);
           break;
       case menu_save :
           if (save_fsbexists == FALSE) {
               save_fsbexists = TRUE;
               XtRealizeWidget(save_fsb);
           }
           CenterWidgetOverCursor(save_fsb);
           XtManageChild(save_fsb);
           break;
       default :
           break;
    }
}
/****************************************************************************
**
**  UpdateSpeakerLabel 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Routine called to update the speaker label.
**
**
**  FORMAL PARAMETERS:
**
**    None
**
**  RETURN VALUE
**
**    Updates the string variable holding the label.
**
***************************************************************************/
UpdateSpeakerLabel()
{
    char buf[256];
    int i;
    Arg args[1];
    XmString str;

    sprintf(buf,"Current Settings: %s speaking at %d words per minute",
	speaker_names[CurrentSpeaker],SpeakingRate);

    str = XmStringCreateSimple( buf );
    i = 0;
    XtSetArg(args[i],XmNlabelString,str); i++;
    XtSetValues(speakerLabel,args,i);
    XmStringFree( str );
}
/****************************************************************************
**
**  SpeakerMenuSelect 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback routine called when speaker is changed.  It calls the
**    TextToSpeechSetSpeaker API call to change the speaker.
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**  RETURN VALUE
**
**    None
**
****************************************************************************/
void SpeakerMenuSelect(w,tag,call_data)
Widget w;
int *tag;
XtPointer call_data;
{
    CurrentSpeaker = *tag;
    UpdateSpeakerLabel();
    TextToSpeechSetSpeaker( ttsHandle, CurrentSpeaker );
}
/****************************************************************************
**
**  UpdateSpeakingRate 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback called when the speaking rate slide bar 
**    is changed in the UI.
**
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**  RETURN VALUE
**
**   None
**
***************************************************************************/
void UpdateSpeakingRate(w,tag,call_data)
Widget w;
int *tag;
XtPointer call_data;
{
    XmScaleGetValue(srateScale,&SpeakingRate);
    UpdateSpeakerLabel();
    TextToSpeechSetRate( ttsHandle, SpeakingRate);
}

/****************************************************************************
**
**  CenterWidgetOverCursor 
**
**  FUNCTIONAL DESCRIPTION:
**
**   A general utility routine called to center a popup widget over the
**   application's main widget.
**
**
**  FORMAL PARAMETERS:
**
**   widget  - Calling widget id.
**
**  RETURN VALUE
**
**   None
**
****************************************************************************/
void CenterWidgetOverCursor(widget)
Widget widget;
{
    Window root, child;
    int x, y, dummy;
    unsigned int mask;
    Arg cargs[2];

    /* 
     * Get cursor position 
     */
    (void) XQueryPointer(XtDisplay(widget), XtWindow(widget),
                         &root, &child,
                         &x, &y, &dummy, &dummy,
                         &mask);
    XtSetArg(cargs[0], XtNwidth, 0);
    XtSetArg(cargs[1], XtNheight, 0);
    XtGetValues(widget, cargs, XtNumber(cargs));

    /* 
     * Calculate new x and y 
     */
    x -= ((int) cargs[0].value) / 2;
    y -= ((int) cargs[1].value) / 2;
    if (x + (int) cargs[0].value > WidthOfScreen(XtScreen(widget))) {
        x = WidthOfScreen(XtScreen(widget)) - (int) cargs[0].value;
    }
    if (y + (int) cargs[1].value > HeightOfScreen(XtScreen(widget))) {
        y = HeightOfScreen(XtScreen(widget)) - (int) cargs[1].value;
    }
    if (x < 0) {
        x = 0;
    }
    if (y < 0) {
        y = 0;
    }

    /* 
     * Set it for the widget 
     */
    XtSetArg(cargs[0], XtNx, x);
    XtSetArg(cargs[1], XtNy, y);
    XtSetValues(widget, cargs, XtNumber(cargs));
    return;
}
/****************************************************************************
**
**  CancelPrompt 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback called when the cancel option on the file selection
**    widget is selected.  
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**  RETURN VALUE
**
**    None
**
***************************************************************************/
void CancelPrompt(w, tag, call_data)
Widget  w;
int *tag;
XtPointer call_data;
{
    XtUnmanageChild(w);
}
/****************************************************************************
**
**  ContinuePrompt 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback routine called when the Continue button on the Pause
**    popup box is pushed.
**
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**
**  RETURN VALUE
**
**    None
**
****************************************************************************/
void ContinuePrompt(w, tag, call_data)
Widget  w;
int *tag;
XtPointer call_data;
{
    if ( w == pauseDialog )
	ResumePlay();
    XtUnmanageChild(w);
}
/****************************************************************************
**
**  ProcessName 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Called by the file selection popup menu.  This callback reads the file
**    name from the file selection menu.
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    tag - Callback parameter
**    call_data -  Address of Callback structure
**
**
**  RETURN VALUE
**
**    None
**
****************************************************************************/
void ProcessName( w,tag,call_data)
Widget  w;
int     *tag;
XtPointer call_data;
{
    XmFileSelectionBoxCallbackStruct *cdat;
    char *fname;

    cdat = (XmFileSelectionBoxCallbackStruct *)call_data;
    XmStringGetLtoR(cdat->value, charset, &fname);
    switch (*tag)
    {
       case menu_open :
          if ( ! InputFile( fname ) ) {
   	      /* create popup */
	      XtRealizeWidget(open_err);
	      XtManageChild(open_err);
          }
          XtUnmanageChild(open_fsb);
          break;
       case menu_save :
          if ( SaveFile(fname) != MMSYSERR_NOERROR ) {
              /* 
               * create popup error box
               */
              XtRealizeWidget(save_err);
              XtManageChild(save_err);
          }
          XtUnmanageChild(save_fsb);
          break;
       default :
          break;
       
    }
}
/*******************************************************************************
**
**  InputFile 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Reads in a specified file name into the text window.
**
**  FORMAL PARAMETERS:
**
**    name -  A string value with the path and file name
**            of the input file.
**
**
**  RETURN VALUE
**
**    1 - If successful
**    0 - If failed 
**
******************************************************************************/
int InputFile(name)
String name;
{
    FILE *f;
    struct stat buf;
    char *text;
    int i;
    Arg args[1];

    if (name != NULL && (strlen(name) != 0) ) {
	strcpy(InputFileName,name);
    } else {
	return ( 0 );
    }

    if ( (f = fopen(InputFileName, "r")) == NULL )
    {
	fprintf(stderr,"Could not open file.\n");
	return( 0 );
    }

    (void)stat(InputFileName,&buf);
    FileLen = buf.st_size;
    FilePos = 0;

    text = XtMalloc( FileLen + 1 );
    if ( fread( text, 1, FileLen, f ) != FileLen )
    {
	fprintf(stderr,"Could not read file.\n");
	XtFree( text );
	fclose( f );
	return( 0 );
    }
    text[FileLen] = '\0';

    /*
     * place in text widget
     */
    if ( textWindow != NULL )
	XmTextSetString( textWindow, text );


    /*
     * clean up
     */
    fclose( f );
    XtFree( text );

    return( 1 );
}
/*******************************************************************************
**
**  SaveFile 
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
**    MMSYSERR_NOERROR - If successful
**
******************************************************************************/
MMRESULT SaveFile( fname )
String fname;
{
   char *sText = NULL;
   int   sLength = 0;
   long  dwFlags = TTS_FORCE;
   MMRESULT mmStatus;
   char buf[4096];
   int FilePos = 0;
   int nbytes;

   mmStatus = TextToSpeechOpenWaveOutFile( ttsHandle, fname, WAVE_FORMAT_08M08);

   if ( mmStatus != MMSYSERR_NOERROR )
      return( mmStatus );

   sText = XmTextGetString( textWindow );
   sLength = strlen( sText );

   while ( FilePos < sLength )
   {
      strncpy( buf, &sText[FilePos], 4000);
      nbytes = strlen( buf );
      mmStatus = TextToSpeechSpeak( ttsHandle, buf, dwFlags );
      FilePos += nbytes;

      if ( mmStatus != MMSYSERR_NOERROR )
         return( mmStatus );
   }
   mmStatus = TextToSpeechCloseWaveOutFile( ttsHandle );
   XtFree( sText );

   return ( mmStatus );
}
/***************************************************************************
**
**
**  index_callback 
**
**  FUNCTIONAL DESCRIPTION:
**
**   This is the callback routine for in line index marks.
**   The format of the in-line index mark is [:index mark #]
**   where # is a number denoting the index mark number.
**
**  FORMAL PARAMETERS:
**
**    param1: switch which indicates if the callback is due
**            to an index mark or if it is returning a memory
**            buffer. 
**    param2: is the digit that follows the in line index
**            mark command. 
**    user_defined: is a pointer to a user defined structure.
**                  This is used a mechanism to pass user
**                  defined parameters in and out of this 
**                  callback routine. 
**    uiMsg: defines the message type
**              TTS_MSG_BUFFER
**              TTS_MSG_INDEX_MARK
**              TTS_MSG_STATUS
**
**  RETURN VALUE
**
**     None.
**
****************************************************************************/
void index_callback(long param1, long param2, long user_defined, UINT uiMsg)
{
   int ac;
   Arg al[2];
   char text[50];
   MrmType class;
   int *tag;
   XtPointer callback;
   Widget button;
   Window root, child;
   int root_x, root_y;
   int new_x, new_y;
   int win_x, win_y;
   unsigned int key_buttons;

   switch( uiMsg )
   {
   case TTS_MSG_INDEX_MARK:
        sprintf(text,"Encountered index Number : %d", param2);
        XtSetArg(al[0], XmNmessageString, XmStringLtoRCreate(text, ""));
        XtSetValues(index_CB, al, 1);
        XtManageChild(index_CB);
        button = (Widget) XmMessageBoxGetChild( index_CB, 
                 XmDIALOG_CANCEL_BUTTON);
        XtUnmanageChild ( button );
        button = (Widget) XmMessageBoxGetChild( index_CB, XmDIALOG_HELP_BUTTON);
        XtUnmanageChild ( button );
        XQueryPointer( XtDisplay(index_CB),  
                 DefaultRootWindow( XtDisplay(index_CB)),
                 &root, &child, &root_x, &root_y, &win_x, &win_y,
                 &key_buttons );  
        new_x = root_x;  new_y = root_y - 1;
        XWarpPointer( XtDisplay(index_CB), root, root, root_x, root_y, 8, 8, 
                 new_x, new_y );
        break;

   case TTS_MSG_BUFFER:
        printf( "Memory buffer\n");
        break;
   }

}

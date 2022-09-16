/*
 * @DEC_COPYRIGHT@
 */
/*
 * MGS 11/20/1997	Added UK to compiler
 * HISTORY
	6	08/08/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	08/08/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	08/08/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	08/08/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	08/08/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	08/08/97	leeber	Initial Version
 * Revision 1.1.2.8  1997/05/05  17:00:00  Ginger Lin
 *      Remove the extra space after translation
 *      and fix the pronunce word problem
 *      [1997/05/05  17:00:00  Ginger LIn]
 *
 * Revision 1.1.2.7  1996/10/01  17:14:38  Cathy_Page
 * 	Removed OUTPUT_TO_MME_DEVICE from device options
 * 	[1996/10/01  17:13:09  Cathy_Page]
 *
 * Revision 1.1.2.6  1996/01/31  16:19:05  Krishna_Mangipudi
 * 	Put the sync back in
 * 	[1996/01/31  16:18:51  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.5  1996/01/29  19:50:15  Krishna_Mangipudi
 * 	Added sleep to sync up with synthesizer
 * 	[1996/01/29  19:50:01  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.4  1996/01/29  19:27:04  Krishna_Mangipudi
 * 	Removed TextToSpeechSync not applicable for in-memory path
 * 	[1996/01/29  19:26:54  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.3  1995/12/15  16:36:30  Krishna_Mangipudi
 * 	Added more info to -h Usage message
 * 	[1995/12/15  16:36:17  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.2  1995/07/05  18:09:52  Krishna_Mangipudi
 * 	Moved from ./src/clients
 * 	[1995/07/05  18:09:06  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:42:05  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:45:55  Krishna_Mangipudi]
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
**      windict.c 
**
**  ABSTRACT:
**
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**     Krishna Mangipudi
**
**  CREATION DATE:
**     May 18, 1994
**
**  MODIFICATION HISTORY:
**
**     06 Oct 94   KM   added TextWidgetModified and associated code.
**     17 Oct 94   KM   added icon GIF file.
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
#include <mme/mmsystem.h>
/*
 **************************************************************************
 * Header files for DECtalk.
 **************************************************************************
 */
#include <ttsapi.h>             /* DECtalk Text to Speech header file */

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

/***************************************************************************
** DECtalk Text To Speech header file.
***************************************************************************/
#include "windict_version.h"

/* 
 **************************************************************************
 * Constants & macros 
 **************************************************************************
 */
#define UIDFILE "windict.uid"
/*
 * UIL widget constants
 */
#define PRONOUNCE       0
#define PREVIOUS        1
#define NEXT            2
#define TEXT            3 
#define TRANSLATE       4
#define UNDO            5
#define CUT             6
#define COPY            7
#define PASTE           8
#define DELETE          9
#define SELECTALL       10 

#define NUM_TOGGLES     15 

#define menu_open       1
#define menu_compile    2
#define menu_dict       3
#define menu_save       4
#define menu_saveas     5
#define menu_exit       6
#define menu_undo       7
#define menu_cut        8
#define menu_copy       9
#define menu_paste      10
#define menu_delete     11
#define menu_selectall  12

#define pron_this       0
#define pron_next       1
#define pron_prev       2

#define ZERO      0

/*
 **************************************************************************
 * Function forward declarations
 **************************************************************************
 */
void WidgetCreate();
void FileMenuSelect();
void EditMenuSelect();
void CenterWidgetOverCursor();
int  SaveTextFile( String );
static void TrackMouse();
void ProcessName();
void CancelPrompt();
void ProcessSave();
void QuitProc();
void PronounceWord();
void TranslatePhoneme();
void TextWidgetModified();
static int postMessage();

/* 
 **************************************************************************
 * Globals 
 **************************************************************************
 */
typedef struct LastCommand_t {
    XmTextPosition tpLeft, tpRight;
    int menu_id;
    char * selected_string;
} LastCommand;
               
static LastCommand lc;

float def_offset = 0.175;
static char uid_file[] = UIDFILE;
String fallback_resources[] = {
    "windict*foreground:		SteelBlue",
    "windict*background:		Wheat",
    "*menuButton.label:			File",
    "*SimpleMenu.open.label:		Open",
    "*SimpleMenu.open.label:            Save",
    "*SimpleMenu.quit.label:		Quit",
    "*Dialog.label:			Enter the Filename",
    "*Dialog*value.translations: #override \\n <Key>Return: Ok()",
    NULL,
};

static LPTTS_HANDLE_T ttsHandle; /* DECtalk handle */
static int langid=0;

static char *title = "Windict";
char outputTextFile[128];
char DictonaryFile[128];
static int DictonaryNameSet = FALSE;
static int textModified = FALSE;
static int processExitFlag = FALSE;
static int newFile      = FALSE;
static int dict_fsbexists = FALSE;
static int saveas_fsbexists = FALSE;
static int promptForDict = FALSE;

/*
 **************************************************************************
 * X widget declarations
 **************************************************************************
 */
Widget textWindow;
Widget toggleButton[NUM_TOGGLES];
Widget topshell;
Widget windictmain;
Widget open_fsb, saveas_fsb, dict_fsb;
Widget messageWidget;
Widget compile_done, compile_inprog;
Widget save_onexit, save_oncompile;
XtAppContext app_con;
XtWorkProcId curId = 0;
char InputFileName[PATH_MAX];
char OutputFileName[PATH_MAX];
XmStringCharSet charset = (XmStringCharSet) XmSTRING_DEFAULT_CHARSET;
off_t FileLen = 0;
off_t FilePos = 0;

typedef struct _AppResources
{
    String geometry;
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
   {"file", "File", XtRString, sizeof(char *),
       XtOffset(AppResources *,file), XtRString, NULL},
};

static XrmOptionDescRec options[] = 
{
   {"-geometry", "geometry", XrmoptionSepArg, NULL},
   {"-file", "file", XrmoptionSepArg, NULL},
};

static MrmHierarchy s_MrmHierarchy;     /* MRM database hierarchy ID */
static char *db_filename_vec[] = 
{
    "windict.uid"        	        /* UID file for windict*/
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
   {"WidgetCreate",      (caddr_t) WidgetCreate},
   {"FileMenuSelect",    (caddr_t) FileMenuSelect},
   {"EditMenuSelect",    (caddr_t) EditMenuSelect},
   {"ProcessName",       (caddr_t) ProcessName},
   {"CancelPrompt",      (caddr_t) CancelPrompt},
   {"ProcessSave",       (caddr_t) ProcessSave},
   {"QuitProc",          (caddr_t) QuitProc},
   {"PronounceWord",     (caddr_t) PronounceWord},
   {"TranslatePhoneme",  (caddr_t) TranslatePhoneme},
   {"TextWidgetModified",(caddr_t) TextWidgetModified},
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
    fprintf(stderr,"\t%s will creates user dictionary files.  %s will read text\n", progname, progname);
    fprintf(stderr,"\tfrom a file within the window environement and will translate \n");
    fprintf(stderr,"\tthe text into phoneme strings.  Text may be entered interactively\n");
    fprintf(stderr,"\tand phoneme strings may also be created interactively.  \n\n");
    fprintf(stderr,"Usage: %s [-h] \n", progname);
    fprintf(stderr,"     -file <filename>   File to be edited\n");
    fprintf(stderr,"     -geometry <geom>   Geometry for the user interface\n");
    fprintf(stderr,"     -h                 This help message\n");
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
    Arg arg[3];
    int sel = 0;
    long devOptions = 0;
    long userSelectedDevice = WAVE_MAPPER;
    long bestDevOption = 0;
    int devNo = 0;
    long indexParams;
    MMRESULT status;
    MMRESULT num_wave_out_devices = waveOutGetNumDevs();
    LPWAVEOUTCAPS pWaveOutCaps = NULL;
    char   gifFilePath[50];
    char   partialPath[50];
    Pixmap gifIcon = (Pixmap) 0;

    /*
     * Check if the MME server is running...
     */

    if (num_wave_out_devices <= 0) 
    {
        fprintf(stderr, "windict exiting: Could not find any wave devices\n");
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
    topshell = XtAppInitialize(&app_con,"windict",options,XtNumber(options),
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


#ifdef ENGLISH_US
    if ( (langid=TextToSpeechStartLang("US")) == TTS_LANG_ERROR)
    {
        fprintf(stderr,"Cannot start English DECtalk\n");
	exit(1);
    }
#endif
#ifdef ENGLISH_UK
    if ( (langid=TextToSpeechStartLang("UK")) == TTS_LANG_ERROR)
    {
        fprintf(stderr,"Cannot start British DECtalk\n");
	exit(1);
    }
#endif
#ifdef SPANISH
#ifdef LATIN_AMERICAN
    if ( (langid=TextToSpeechStartLang("LA")) == TTS_LANG_ERROR)
    {
        fprintf(stderr,"Cannot start Latin American DECtalk\n");
	exit(1);
    }
#else
    if ( (langid=TextToSpeechStartLang("SP")) == TTS_LANG_ERROR)
    {
        fprintf(stderr,"Cannot start Spanish DECtalk\n");
	exit(1);
    }
#endif
#endif
#ifdef GERMAN
    if ( (langid=TextToSpeechStartLang("GR")) == TTS_LANG_ERROR)
    {
        fprintf(stderr,"Cannot start German DECtalk\n");
	exit(1);
    }
#endif
    TextToSpeechSelectLang(NULL,langid); 
    if ( TextToSpeechStartup( &ttsHandle, devNo, devOptions, 
        NULL, indexParams )  != MMSYSERR_NOERROR) {
	fprintf(stderr, "%s: can't open DECtalk connection.\n", argv[0]);
	exit(1);
    }
    /****************************************************/
    /* Remove any user dictionaries                     */
    /****************************************************/

    if (TextToSpeechUnloadUserDictionary( ttsHandle ) != MMSYSERR_NOERROR) 
    {
       fprintf(stderr, "%s: can't unload user dictionary. \n", argv[0]);
       exit(1);
    }

    /****************************************************/
    /* Get the widgets used in this application         */
    /****************************************************/

    XtGetApplicationResources( topshell, (XtPointer) &app_resources,
                               resources, XtNumber(resources), NULL, ZERO );
    if ( MrmFetchWidget(s_MrmHierarchy, "windict_main", topshell,
			&windictmain,&class) != MrmSUCCESS) {
	fprintf(stderr, "Can't fetch widget windict main\n");
	exit(1);
    }

    if ( MrmFetchWidget(s_MrmHierarchy, "open_fs_box", topshell,
                        &open_fsb,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget open fs box\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "saveas_fs_box", topshell,
                        &saveas_fsb,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save as fs box\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "dict_fs_box", topshell,
                        &dict_fsb,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget dict fs box\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "messageWidget", topshell,
                        &messageWidget,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch error widget \n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "compile_inprogress", topshell,
                        &compile_inprog,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget compile in progress\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "compile_done", topshell,
                        &compile_done,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget compile done\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "save_onexit", topshell,
                        &save_onexit,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save on exit\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "save_oncompile", topshell,
                        &save_oncompile,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save on compile\n");
        exit(1);
    }
    /*****************************************************/
    /* Specify GIF image for DECtalk to be used when     */
    /* iconified.                                        */
    /*****************************************************/

    if (getenv("LOCAL_BITMAP"))
       sprintf(partialPath, "./");
    else
       sprintf(partialPath, "/usr/include/X11/bitmaps/dtk/");

    sprintf(gifFilePath, "%s%s", partialPath, "windict.gif" );
    gifIcon =  InternalGifGet(XtDisplay(topshell), gifFilePath);

    XtSetArg (  arg[0], XmNiconPixmap, gifIcon );
    XtSetValues ( topshell, arg, 1 );

    /*****************************************************/
    /* Add an event handler for the textWindow.  We want */
    /* to be able to watch for ButtonRelease Events.     */
    /*****************************************************/

    XtAddEventHandler( textWindow, ButtonReleaseMask, False, TrackMouse, NULL );

    XtManageChild(windictmain);
    XtRealizeWidget(topshell);
    XtAppMainLoop(app_con);
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
    case PRONOUNCE:
        toggleButton[PRONOUNCE] = w;
        break;
    case PREVIOUS:
        toggleButton[PREVIOUS] = w;
        break;
    case NEXT:
        toggleButton[NEXT] = w;
        break;
    case TEXT:
        textWindow = w;
        XmTextSetAddMode( w, FALSE );
        InputFile( app_resources.file );
        break;
    case menu_undo:
        toggleButton[UNDO] = w;
        break;
    case menu_cut:
        toggleButton[CUT] = w;
        break;
    case menu_copy:
        toggleButton[COPY] = w;
        break;
    case menu_paste:
        toggleButton[PASTE] = w;
        break;
    case menu_delete:
        toggleButton[DELETE] = w;
        break;
    case menu_selectall:
        toggleButton[SELECTALL] = w;
        break;
    }
}
/****************************************************************************
**
**  TextWidgetModified 
**
**  FUNCTIONAL DESCRIPTION:
**
**   This callback routine is called when the text widget is modified with
**   new text entry.
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
void TextWidgetModified(w,tag,call_data)
Widget w;
int *tag;
XtPointer call_data;
{
   if ( ! newFile )
       textModified = TRUE;
   newFile = FALSE;
}
/****************************************************************************
**
**  ProcessSave 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback routine called when the Yes button on the exit message 
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
void ProcessSave( Widget w, int *tag, XtPointer call_data)
{
   XtUnmanageChild(w);
   if (saveas_fsbexists == FALSE) {
      saveas_fsbexists = TRUE;
      XtRealizeWidget(saveas_fsb);
   }
   CenterWidgetOverCursor(saveas_fsb);
   XtManageChild(saveas_fsb);

   switch (*tag)
   {
      case menu_exit :
                processExitFlag = TRUE;
                break;
      case menu_compile :
                promptForDict = TRUE;
                break;
   }
}

/****************************************************************************
**
**  QuitProc 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback routine called when the No button on the exit message
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
void QuitProc( Widget w, int *tag, XtPointer call_data)
{
   switch (*tag)
   {
      case menu_exit :
              XtDestroyApplicationContext(XtWidgetToApplicationContext(w));
#ifdef ENGLISH_US
	      TextToSpeechCloseLang("US");
#endif
#ifdef ENGLISH_UK
	      TextToSpeechCloseLang("UK");
#endif
#ifdef SPANISH
#ifdef LATIN_AMERICAN
	      TextToSpeechCloseLang("LA");
#else
	      TextToSpeechCloseLang("SP");
#endif
#endif
#ifdef GERMAN
	      TextToSpeechCloseLang("GR");
#endif


              TextToSpeechShutdown( ttsHandle );   /*  call cleanup routine */
              /* Free up memory on the cut/paste/undo option */
              if( lc.selected_string != NULL )
                 XtFree( lc.selected_string );
              exit(0);
              break;
      case menu_compile :
              promptForDict = FALSE;
              XtUnmanageChild(w);
              if (dict_fsbexists == FALSE) {
                 dict_fsbexists = TRUE;
                 XtRealizeWidget(dict_fsb);
              }
              CenterWidgetOverCursor(dict_fsb);
              XtManageChild(dict_fsb);
              break;
   }
}

/****************************************************************************
**
**  FileMenuSelect
**
**  FUNCTIONAL DESCRIPTION:
**
**   Callback routine called when a file menu items is selected
**
**   Quit calls the TextToSpeechShutdown API and closes down the application.
**
**   Open invokes a file selection menu to select a text file to be
**   read in for playback.
**
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
void FileMenuSelect( Widget w, int *tag, XtPointer call_data )
{
    static int open_fsbexists = FALSE;
    static int save_onexit_fsbexists = FALSE;
    static int save_oncompile_fsbexists = FALSE;
    static int savewave_fsbexists = FALSE;
    static int dict_fsbexists = FALSE;
    Widget button;

    switch (*tag)
    {
       case menu_exit :
           if ( textModified )
           {
              if (save_onexit_fsbexists == FALSE) {
                 save_onexit_fsbexists = TRUE;
                 XtRealizeWidget(save_onexit);
              }
              CenterWidgetOverCursor(save_onexit);
              XtManageChild(save_onexit);
           }
           else {
              XtDestroyApplicationContext(XtWidgetToApplicationContext(w));
              TextToSpeechShutdown( ttsHandle );   /*  call cleanup routine */
              /* Free up memory on the cut/paste/undo option */
              if( lc.selected_string != NULL )
                 XtFree( lc.selected_string );
              exit(0);
           }
           break;
       case menu_open :
           if (open_fsbexists == FALSE) {
               open_fsbexists = TRUE;
               XtRealizeWidget(open_fsb);
           }
           CenterWidgetOverCursor(open_fsb);
           XtManageChild(open_fsb);
           break;
       case menu_compile :

          /*
           * If the tab file has not been saved
           * before compiling then prompt for saving it.
           */
           if ( textModified )
           {
              if (save_oncompile_fsbexists == FALSE) {
                 save_oncompile_fsbexists = TRUE;
                 XtRealizeWidget(save_oncompile);
              }
              CenterWidgetOverCursor(save_oncompile);
              XtManageChild(save_oncompile);
           }

          /*
           * Else only prompt for *.dic file 
           */
           else {
              if (dict_fsbexists == FALSE) {
                 dict_fsbexists = TRUE;
                 XtRealizeWidget(dict_fsb);
              }
              CenterWidgetOverCursor(dict_fsb);
              XtManageChild(dict_fsb);
           }
          
           break;
       case menu_save :
           if( outputTextFile[0] != (char)NULL )
           {
              if ( ! SaveTextFile( outputTextFile ) ) {
                  postMessage("Can't Open Specified File.");
              }
              break;
           }
           /* else perform a menu_saveas */
       case menu_saveas :
           if (saveas_fsbexists == FALSE) {
               saveas_fsbexists = TRUE;
               XtRealizeWidget(saveas_fsb);
           }
           CenterWidgetOverCursor(saveas_fsb);
           XtManageChild(saveas_fsb);
           break;
       default :
           break;
    }
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
void CenterWidgetOverCursor( Widget widget )
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

/*******************************************************************************
**
**  SaveTextFile
**
**  FUNCTIONAL DESCRIPTION:
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
int SaveTextFile( fname )
String fname;
{
   FILE *fp;
   char *sText = NULL;
   int   sLength = 0;
   long  dwFlags = 0;
   Arg   args[1];
   int   i;

   sText = XmTextGetString( textWindow );
   sLength = strlen( sText );
   if(( fp = fopen(fname, "w")) == NULL )
   {
      fprintf(stderr, "Error writing to file %s\n", fname );
   }
   if ( sLength > 0 )
   {
      fwrite( sText, sizeof( char ), sLength, fp );
   }

   i=0;
   XtSetArg(args[i],XtNtitle, fname); i++;
   XtSetValues(topshell,args,i);

   /*
    * Reset textModified flag
    */
   textModified = FALSE;

   fclose( fp );
   XtFree( sText );
   return ( 1 );
}

/****************************************************************************
**
**  EditMenuSelect
**
**  FUNCTIONAL DESCRIPTION:
**
**   Callback routine called when one of the three file menu items:
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
void EditMenuSelect( Widget w, int *tag, XtPointer call_data )
{
   XmAnyCallbackStruct *cb = (XmAnyCallbackStruct *) call_data;
   Boolean result = True;
   DWORD dwLength;


    switch (*tag) {
       case menu_undo :
           XtSetSensitive(toggleButton[UNDO],False);
           XtSetSensitive(toggleButton[CUT],False);
           XtSetSensitive(toggleButton[PASTE],False);
           XtSetSensitive(toggleButton[COPY],False);
           XtSetSensitive(toggleButton[DELETE],False);
           switch( lc.menu_id ) {
               case menu_cut:
                    XmTextInsert( textWindow, lc.tpLeft, lc.selected_string );
                    break;
                case menu_copy:
                    break;
                case menu_delete:
                    XmTextInsert( textWindow, lc.tpLeft, lc.selected_string );
                    break;
                case menu_paste:
                    XmClipboardInquireLength( XtDisplay( textWindow ),
                                              XtWindow( textWindow ),
                                              "STRING", &dwLength );
                    /* Remove what we just pasted */
                    XmTextReplace( textWindow, lc.tpLeft,
                                   lc.tpLeft + dwLength, NULL );
                    /* Insert what we pasted over. */
                    XmTextInsert( textWindow, lc.tpLeft, lc.selected_string);
                    break;
                case menu_selectall:
                    XmTextClearSelection( textWindow, cb->event->xbutton.time );
                    break;
                default:
                    break;
           }
           XtFree( lc.selected_string );
           break;
       case menu_cut :
           /* 
            * Remeber what we are about to do so we can 'undo' later
            */
           XmTextGetSelectionPosition( textWindow, &lc.tpLeft, &lc.tpRight );
           lc.selected_string = XmTextGetSelection( textWindow );
           lc.menu_id = *tag;

           result = XmTextCut( textWindow, cb->event->xbutton.time );
           XtSetSensitive(toggleButton[CUT],False);
           XtSetSensitive(toggleButton[PASTE],True);
           XtSetSensitive(toggleButton[COPY],False);
           XtSetSensitive(toggleButton[DELETE],False);
           XtSetSensitive(toggleButton[UNDO],True);
           break;
       case menu_paste :
           /* Remeber what we are about to do so we can 'undo' later */
           /* 
            * XmTextGetSelectionPosition(textWindow,&lc.tpLeft,&lc.tpRight);
            */
           lc.tpLeft = XmTextGetCursorPosition( textWindow );
           lc.selected_string = XmTextGetSelection( textWindow );
           lc.menu_id = *tag;

           result = XmTextPaste( textWindow );
           XtSetSensitive(toggleButton[PASTE],False);
           XtSetSensitive(toggleButton[UNDO],True);
           break;
       case menu_copy :
           /* 
            * Remeber what we are about to do so we can 'undo' later
            */
           XmTextGetSelectionPosition( textWindow, &lc.tpLeft, &lc.tpRight );
           lc.selected_string = XmTextGetSelection( textWindow );
           lc.menu_id = *tag;
           result = XmTextCopy( textWindow, cb->event->xbutton.time );

           XtSetSensitive(toggleButton[COPY],False);
           XtSetSensitive(toggleButton[CUT],True);
           XtSetSensitive(toggleButton[PASTE],True);
           XtSetSensitive(toggleButton[UNDO],False);
           break;
       case menu_delete :
           /* 
            * Remeber what we are about to do so we can 'undo' later
            */
           XmTextGetSelectionPosition( textWindow, &lc.tpLeft, &lc.tpRight );
           lc.selected_string = XmTextGetSelection( textWindow );
           lc.menu_id = *tag;

           XmTextReplace( textWindow, lc.tpLeft, lc.tpRight, NULL );
           XtSetSensitive(toggleButton[DELETE],False);
           XtSetSensitive(toggleButton[COPY],False);
           XtSetSensitive(toggleButton[CUT],False);
           XtSetSensitive(toggleButton[UNDO],True);
           break;
       case menu_selectall :
           {
               XmTextPosition first, last;

               first = XmTextGetTopCharacter( textWindow );
               last = XmTextGetLastPosition( textWindow );
               XmTextSetSelection( textWindow, first, last,
                                cb->event->xbutton.time );
               XtSetSensitive(toggleButton[SELECTALL],True);
               XtSetSensitive(toggleButton[COPY],True);
               XtSetSensitive(toggleButton[CUT],True);
               XtSetSensitive(toggleButton[PASTE],False);
               XtSetSensitive(toggleButton[DELETE],True);
               XtSetSensitive(toggleButton[UNDO],True);

               /* 
                * Remeber what we are about to do so we can 'undo' later
                */
               lc.tpLeft  = first;
               lc.tpRight = last;
               lc.selected_string = XmTextGetSelection( textWindow );
               lc.menu_id = *tag;
           }
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
    /*
     * Set the global variable newFile so that
     * the valuechanged callback, TextWidgetModified(),
     * does not set the textModified flag.
     */ 
    newFile = TRUE;

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

    /*********************************/
    /* place in text widget          */
    /*********************************/
    if ( textWindow != NULL )
        XmTextSetString( textWindow, text );

    i=0;
    XtSetArg(args[i],XtNtitle, name); i++;
    XtSetValues(topshell,args,i);

    /*********************************/
    /* clean up                      */
    /*********************************/
    fclose( f );
    XtFree( text );

    return( 1 );
}

/****************************************************************************
**
**  TrackMouse
**
**  FUNCTIONAL DESCRIPTION:
**
**      This function will track all the mouse movements and button clicks.
**  The idea is that the user can select a portion of text with the
**  mouse and all the cut/paste/copy/delete menu items should become active.
**
**      If the user presses Mouse Button 3, then the selected text will be
**  spoken.
**
**
**  FORMAL PARAMETERS:
**
**      Widget w                - text window
**      XtPointer client_data   - not used
**      XEvent *event           - a pointer to the mouse events.
**
**  RETURN VALUE
**
**      nothing.
**
***************************************************************************/
static void TrackMouse( Widget w, XtPointer client_data, XEvent *event )
{
    char *selected_string;

    /****************************************************/
    /* If button #3 is pressed, speak the selected text */
    /****************************************************/

    if( event->xbutton.button == Button3 ) 
    {
        selected_string = XmTextGetSelection( textWindow );

        if(( selected_string == NULL ) || ( !strlen( selected_string )))
            TextToSpeechSpeak( ttsHandle, "Nothing was selected. ", TTS_FORCE );
        else
            TextToSpeechSpeak( ttsHandle, selected_string, TTS_FORCE );

        if( selected_string != NULL ) 
        {
            XtFree( selected_string );
            selected_string = NULL;
        }
    }

    /*************************************************/
    /* If button #1 is pressed, turn on the edit menu*/
    /*************************************************/

    if( event->xbutton.button == Button1 ) 
    {
        selected_string = XmTextGetSelection( textWindow );
        if(( selected_string != NULL ) && ( strlen( selected_string ))) 
        {
            XtSetSensitive(toggleButton[SELECTALL],True);
            XtSetSensitive(toggleButton[COPY],True);
            XtSetSensitive(toggleButton[PASTE],False);
            XtSetSensitive(toggleButton[CUT],True);
            XtSetSensitive(toggleButton[DELETE],True);
            /* 
             * XtSetSensitive(toggleButton[UNDO],False); 
             */

            XtFree( selected_string );

        }
    }
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
    char  *sText = NULL;
    int   sLength = 0;
    static int compile_inprogexists = FALSE;
    static int compile_doneexists = FALSE;
    char errorString[512];
    Widget button;

    cdat = (XmFileSelectionBoxCallbackStruct *)call_data;
    XmStringGetLtoR(cdat->value, charset, &fname);
    switch (*tag)
    {
       case menu_open :
          strcpy( outputTextFile, fname );
          if ( ! InputFile( outputTextFile ) ) {
              /* create popup */
             postMessage("Can't Open Specified Text File.");
          }
          XtUnmanageChild(open_fsb);
          break;
       case menu_save :
       case menu_saveas :
          strcpy( outputTextFile, fname );
          if ( ! SaveTextFile( outputTextFile ) ) {
              postMessage("Can't Open Specified File.");
          }
          XtUnmanageChild(saveas_fsb);
          /*
           * Prompt for dictionary name
           */
          if (promptForDict)
          {
             promptForDict = FALSE;
             if (dict_fsbexists == FALSE) {
                dict_fsbexists = TRUE;
                XtRealizeWidget(dict_fsb);
             }
             CenterWidgetOverCursor(dict_fsb);
             XtManageChild(dict_fsb);
          }
          /*
           * Done after saving the file, exit
           */
          if (processExitFlag)
          {
              XtDestroyApplicationContext(XtWidgetToApplicationContext(w));
              TextToSpeechShutdown( ttsHandle );   /*  call cleanup routine */
              /* Free up memory on the cut/paste/undo option */
              if( lc.selected_string != NULL )
                 XtFree( lc.selected_string );
              exit(0);
          }
          break;
       case menu_dict :
          strcpy( DictonaryFile, fname );
          XtUnmanageChild(dict_fsb);

          sText = XmTextGetString( textWindow );
          sLength = strlen( sText );

          if (compile_inprogexists == FALSE) {
             compile_inprogexists = TRUE;
             XtRealizeWidget(compile_inprog);
          }
          CenterWidgetOverCursor(compile_inprog);
          button = (Widget)XmMessageBoxGetChild
                    ((Widget)compile_inprog, XmDIALOG_HELP_BUTTON);
          XtUnmanageChild (button);
          button = (Widget)XmMessageBoxGetChild
                            ((Widget)compile_inprog, XmDIALOG_CANCEL_BUTTON);
          XtUnmanageChild (button);
          XtManageChild(compile_inprog);
         
          errorString[0] = '\0'; 
          compile_dictonary( DictonaryFile, sText, errorString);

          XtUnmanageChild(compile_inprog);
          XtFree( sText );

          if ( strlen( errorString ) )   
          {
             postMessage(errorString);
          }

          else
          {
             if (compile_doneexists == FALSE) {
                compile_doneexists = TRUE;
                XtRealizeWidget(compile_done);
             }
             CenterWidgetOverCursor(compile_done);
             button = (Widget)XmMessageBoxGetChild
                      ((Widget)compile_done, XmDIALOG_HELP_BUTTON);
             XtUnmanageChild (button);
             button = (Widget)XmMessageBoxGetChild
                            ((Widget)compile_done, XmDIALOG_CANCEL_BUTTON);
             XtUnmanageChild (button);
             XtManageChild(compile_done);
          }
          break;
       default :
          break;

    }
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
void CancelPrompt( Widget w, int *tag, XtPointer call_data)
{
    XtUnmanageChild(w);
}

/****************************************************************************
**
**  PronounceWord 
**
**  FUNCTIONAL DESCRIPTION:
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
**    None
**
***************************************************************************/
void PronounceWord( Widget w, int *tag, XtPointer call_data)
{
   char *text = NULL;
   char textbuf[256];
   static int  currentLine = -1;
   char line[256];
   char linebuf[256];
   char phon[256];
   XmTextPosition cursorPosition;


   text = XmTextGetSelection( textWindow );

   if (text != NULL)
   {
      /* GL 05/05/1997 fix pronunce word problem */
      sprintf(textbuf, "[:phon arpa on]%s[:phon arpa off]", text);
      TextToSpeechSpeak( ttsHandle, textbuf, TTS_FORCE );
   }

   else if (text == NULL)
   {
      text = XmTextGetString( textWindow );

      cursorPosition = XmTextGetInsertionPosition( textWindow );

      /*
       * Call GetLine to initialize curretnLine
       */
      if ( ((*tag == pron_prev) || (*tag == pron_next)) && 
            (currentLine < 0) )
         GetLine(text, cursorPosition, line, &currentLine,pron_this);

      if (GetLine(text, cursorPosition, line, &currentLine, *tag))
      {
         /* ParseLine ( line, phon );*/
         /* TextToSpeechSpeak( ttsHandle, phon, TTS_FORCE ); */
         /* GL 05/05/1997 fix the line pronunce problem */
         sprintf(linebuf, "[:phon arpa on]%s[:phon arpa off]", line);
         TextToSpeechSpeak( ttsHandle, linebuf, TTS_FORCE );
      }
      else
      {
         TextToSpeechSpeak( ttsHandle, "No more words to speak. ", TTS_FORCE );
      }
   }
   XtFree( text );
}

/****************************************************************************
**
**  GetLine 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**  FORMAL PARAMETERS:
**
**    text 
**    cursorPosition
**    line
**    currentLine
**    tag
**
**  RETURN VALUE
**
**    None
**
***************************************************************************/

int GetLine(char *text, 
            int  cursorPosition, 
            char *line, 
            int  *currentLine,
            int  tag)
{
   int j = 0;
   int i = 0;
   int lineNumber = 0;
   int slen;
   int foundLine = FALSE;
   int searchLine = 0;

   if ( tag == pron_prev )
      searchLine = *currentLine-1;
   else if (tag == pron_next)
      searchLine = *currentLine+1;

   slen = strlen (text);
   while ((text[i] != '\0') && (i <= slen))
   {

      j = 0;
      while( (text[i] != 0x0a) && (text[i] != '\0') )
      {
         line[j++] = text[i];
         if ( (i++ == cursorPosition) && (tag == pron_this) )
            foundLine = TRUE;
      }
      line[j] = '\0';
      if ( (i++ == cursorPosition) && (tag == pron_this) )
         foundLine = TRUE;

      lineNumber++;

      if ( (searchLine==lineNumber) && 
           ((tag == pron_prev) || (tag == pron_next)) )
         foundLine = TRUE;

      if ( foundLine )
      {
         *currentLine = lineNumber;
         return( TRUE );
      }
   }
   return(FALSE);
}
/****************************************************************************
**
**  ParseLine 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**  FORMAL PARAMETERS:
**
**    text 
**
**  RETURN VALUE
**
**    text 
**
***************************************************************************/

int ParseLine(char *text, char *phonStr )
{
   char *tempText;
   char *newText;

   tempText = text;

   newText = strtok( tempText, "[");
   while (newText != NULL)
   {
      newText = strtok ( NULL, "]");
      if ( newText != NULL)
      {
         strcpy( phonStr, "[:phone on] [");
         strcat( phonStr, newText );
         strcat( phonStr, "] [:phone off]");
      }
   }
    
}

/****************************************************************************
**
**    TranslatePhoneme 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**
***************************************************************************/

void TranslatePhoneme( Widget w, int *tag, XtPointer call_data)
{
   char *selText;
   char xlateBuf[256];
   char phString[256];
   char newText[256];
   FILE *fp;
   XmTextPosition cursorPosition;
   Boolean result = True;
   XmAnyCallbackStruct *cb = (XmAnyCallbackStruct *) call_data;

   selText = XmTextGetSelection( textWindow );

   if (selText == NULL)
   {
      TextToSpeechSpeak( ttsHandle, "Nothing to translate.", TTS_FORCE );
      return;
   }
   else
   {
      int i;

      /* GL 05/05/1997 fix pronunce word problem */
      sprintf(xlateBuf, "[:log phon on]%s[:log phon off]", selText);
      TextToSpeechSpeak( ttsHandle, xlateBuf, TTS_FORCE );
      TextToSpeechSync( ttsHandle);

      if ( (fp = fopen("log.txt", "r")) == NULL )
      {
         fprintf(stderr,"Could not open file.\n");
         return;
      }

      fgets( phString, 256, fp );
      /*
       * Strip the COMMA at the end of each translated
       * string.
       */
      /*phString[strlen(phString)-1] = '\0';*/
      /* GL 05/05/1997  remove the ending dummy character */
      for (i = strlen(phString)-4; i>0; --i)
      {   if (phString[i] != ' ')
          {
             phString[i+1] = '\0';
             break;
          }
      }
      fclose( fp );
      unlink( "log.txt"); 
      sprintf( newText, "[%s]", phString );

      result = XmTextCut( textWindow, cb->event->xbutton.time );
      cursorPosition = XmTextGetInsertionPosition( textWindow );
      XmTextInsert( textWindow, cursorPosition, newText );
   }

   XtFree( selText );
}

static int postMessage( char *errorString )
{
   Arg         arglist [1];
   Widget      button;

   button = (Widget)XmMessageBoxGetChild
                            ((Widget)messageWidget, XmDIALOG_HELP_BUTTON);
   XtUnmanageChild (button);
   button = (Widget)XmMessageBoxGetChild
                            ((Widget)messageWidget, XmDIALOG_CANCEL_BUTTON);
   XtUnmanageChild (button);

   XtSetArg ( arglist [0], XmNmessageString, 
               XmStringCreate((char *)errorString, 
                      XmSTRING_DEFAULT_CHARSET) );

   XtSetValues ( messageWidget, arglist, 1 );
   XtManageChild( messageWidget );

}

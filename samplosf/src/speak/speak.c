/*
 * @DEC_COPYRIGHT@
 */
/*
 * MGS 11/20/1997	Added UK to the menu and to code for ML
 * MGS 03/29/2001	Added French the the menu

 * HISTORY
	6	09/22/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	09/22/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	09/22/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	09/22/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	09/22/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	09/22/97	leeber	Initial Version
 * Revision 1.1.2.9  1997/02/17  20:50:44  Darrell_Stam
 *      Fix call to XtGetValues since UNIX V4.0 is more strict in it's
 *      type checking.
 *      [1997/02/17  20:50:03  Darrell_Stam]
 *
 * Revision 1.1.2.8  1997/01/29  18:34:08  Darrell_Stam
 *      Removed global index callback routine that was passed into TTSStartup.
 *      [1997/01/29  18:33:50  Darrell_Stam]
 * 
 * Revision 1.1.2.7  1996/11/19  12:22:26  Cathy_Page
 *      Remove reference to bba and j300
 *      [1996/11/19  12:20:48  Cathy_Page]
 * 
 * Revision 1.1.2.6  1996/10/01  17:14:36  Cathy_Page
 *      Changed callback routine - Added new param (uiMsg); Removed OUTPUT_TO_*_DEVICE from device options
 *      [1996/10/01  17:12:49  Cathy_Page]
 * 
 * Revision 1.1.2.5  1996/02/15  05:37:18  Bill_Hallahan
 *      Correctly Removed 1 second sleep
 *      [1996/02/15  05:37:06  Bill_Hallahan]
 * 
 * Revision 1.1.2.4  1996/02/15  05:27:59  Bill_Hallahan
 *      Removed 1 second sleep
 *      [1996/02/15  05:27:07  Bill_Hallahan]
 * 
 * Revision 1.1.2.3  1996/02/14  01:05:48  Krishna_Mangipudi
 *      check for playBuffer == NULL and sfile == NULL
 *      [1996/02/14  01:05:38  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.2  1995/07/05  18:16:13  Krishna_Mangipudi
 *      Moved from ./src/cleints
 *      [1995/07/05  18:15:53  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  22:41:30  Krishna_Mangipudi
 *      Initial Check-in
 *      [1994/11/07  22:11:53  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 *      Initial load of project
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
/****************************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1994 All Rights Reserved.
**  Unpublished rights reserved under the copyright laws of the United States.
**  The software contained on this media is proprietary to and embodies the
**  confidential technology of Digital Equipment Corporation.  Possession, use,
**  duplication or dissemination of the software and media is authorized only
**  pursuant to a valid written license from Digital Equipment Corporation.
**
**  RESTRICTED RIGHTS LEGEND   Use, duplication, or disclosure by the U.S.
**  Government is subject to restrictions as set forth in Subparagraph
**  (c)(1)(ii) of DFARS 252.227-7013, or in FAR 52.227-19, as applicable.
**
****************************************************************************/


/*****************************************************************************
**  PROGRAM:
**      speak.c 
**
**  ABSTRACT:
**
**      This is a test program to demonstrate the use of DECtalk APIs.  
**      The major functions demonstrated in this program are:
**              o Read an input file or read text typed into the widget
**              o Initialize and call TextToSpeech APIs to convert
**                the text into computer synthesized speech.
**              o Save a text file as a wave file.
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
**  DS               Added GIF images 
**  KM               Highlight current voice selection.
**  DS    7/15/94    Sperated GIF file code into loadgif.c
**  KM    7/15/94    Command line args and usage message.
**  ETT	12/04/1998	Added ifdefs for linux.
**					won't work well with lesstif 0.87 
**					uil not done yet.
**
*******************************************************************************/

/***************************************************************************
** Define DEC to enable us to use DEC specific MME structures.
***************************************************************************/
#define DEC 1

/*************************************************************************** 
** Standard header files 
***************************************************************************/
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#ifdef __linux__
#include <limits.h>
#else
#include <sys/limits.h>
#endif
#include <sys/types.h>
#include <unistd.h>
#include <sys/stat.h>
#ifndef __linux__
#include <mme/mmsystem.h>
#endif
/***************************************************************************
** DECtalk Text To Speech header file.
***************************************************************************/
#include <ttsapi.h>             

/*************************************************************************** 
** Header files used by all apps using widgets 
***************************************************************************/
#include <X11/Intrinsic.h>
#include <X11/StringDefs.h>
#include <Xm/Xm.h>
#include <Mrm/MrmAppl.h>        

#include <Xm/PanedW.h>          /* for Paned Window */
#include <Xm/Text.h>            /* for Text */
#include <Xm/Label.h>           /* for Label */
#include <Xm/FileSB.h>          /* for File Selection Box */
#include <Xm/RowColumn.h>       /* for RowColumn */
#include <Xm/PushBG.h>          /* for Push Button Gadget */
#include <Xm/CascadeB.h>        /* for Cascade button */
#include <Xm/ToggleBG.h>        /* for Toggle Button Gadget */
#include <Xm/Form.h>            /* for Form */
#include <Xm/CutPaste.h>        /* for Cutting and Pasting */
/***************************************************************************
** DECtalk Text To Speech header file.
***************************************************************************/
#include "speak_version.h"             

/***************************************************************************
** Constants & macros 
***************************************************************************/
#define ZERO    0
#define SPEAKING_VOICES 9
#define NUM_LANGS 6

#ifdef AFDRIVER
#define UIDFILE "speakaf.uid"
#else
#define UIDFILE "speak.uid"
#endif

/***************************************************************************
** UIL widget constants                                         
***************************************************************************/
#define STOP            0
#define PLAY            1
#define PAUSE           2
#define SRATE           3
#define TEXT            4
#define SLABL           5
#define SRATEVALUE      6
#define UNDO            3
#define CUT             4
#define COPY            5
#define PASTE           6
#define DELETE          7
#define SELECTALL       8
#define NUM_TOGGLES     9
#define menu_open       1
#define menu_loaddic    2
#define menu_unloaddic  3
#define menu_savewave   4
#define menu_save       5
#define menu_saveas     6
#define menu_exit       7 
#define menu_undo       8 
#define menu_cut        9 
#define menu_copy       10 
#define menu_paste      11 
#define menu_delete     12 
#define menu_selectall  13 
#define menu_save1M16   14 
#define menu_save1M08   15 
#define menu_save08M08  16 
#define menu_english    17
#define menu_spanish    18
#define menu_german     19
#define menu_latin_american 20
#define menu_british    21
#define menu_french     22

/***************************************************************************
** Function forward declarations
***************************************************************************/
void FileMenuSelect();
void LangMenuSelect();
void EditMenuSelect();
void PauseButtonSelect();
void SpeakerMenuSelect();
void ProcessName();
void CancelPrompt();
void ProcessSave();
void QuitProc();
void TextWidgetModified();
void ContinuePrompt();
void CenterWidgetOverCursor();
void SetupForm();
void ChangeState();
void SetCurrentToggle();
void WidgetCreate();
void WidgetCreateBitmap();
void UpdateSpeakingRate();
int  InputFile();
int  PlaySome();
void index_callback();
Widget CreatePixmapPushButton();
static void TrackMouse();
MMRESULT SaveWaveFile();

typedef struct LastCommand_t {
    XmTextPosition tpLeft, tpRight;
    int menu_id;
    char * selected_string;
} LastCommand;

typedef struct SpeakerName_t {
    char   name[20];
} SpeakerName;

    
/***************************************************************************
** Globals 
***************************************************************************/

static LastCommand lc;

static char uid_file[] = UIDFILE;
String fallback_resources[] = {
#ifdef AFDRIVER
    "speakaf*foreground:                SteelBlue",
    "speakaf*background:                Wheat",
#else
    "speak*foreground:                  Black",
    "speak*background:                  White",
#endif
    "*menuButton.label:                 File",
    "*SimpleMenu.open.label:            Open",
    "*SimpleMenu.load.label:            Load",
    "*SimpleMenu.unload.label:          Unload",
    "*SimpleMenu.savewave.label:        Convert to Wave",
    "*SimpleMenu.save.label:            Save",
    "*SimpleMenu.saveas.label:          Save as",
    "*SimpleMenu.exit.label:            Exit",
    "*Dialog.label:                     Enter the Filename",
    "*Dialog*value.translations: #override \\n <Key>Return: Ok()",
    NULL,
};

static LPTTS_HANDLE_T ttsHandle[6]; /* DECtalk handle */

#ifdef AFDRIVER
static char *title = "speakaf";
#else
static char *title = "speak";
#endif 

/***************************************************************************
* DECtalk speaker names 
***************************************************************************/
static SpeakerName speaker_names[NUM_LANGS][SPEAKING_VOICES] = 
{
       {{ "Paul." },
        { "Betty." },
        { "Harry." },
        { "Frank." },
        { "Dennis." },
        { "Kit." },
        { "Ursula." },
        { "Rita." },
        { "Wendy." }},
       {{ "Paul." },
        { "Betty." },
        { "Harry." },
        { "Frank." },
        { "Dennis." },
        { "Kit." },
        { "Ursula." },
        { "Rita." },
        { "Wendy." }},
// spanish
       {{ "Pablo." },
        { "Berta." },
        { "Humberto." },
        { "Francisco" },
        { "Domingo." },
        { "Juanito." },
        { "Ursula." },
	{ "Rita." },
	{ "Wendy." }},
// german
       {{ "Paul." },
        { "Beate." },
        { "Hans." },
        { "Frank." },
        { "Dieter." },
        { "Karl." },
        { "Ursula." },
        { "Rita." },
        { "Wendy." }},
// latin_american
       {{ "Pablo." },
        { "Berta." },
        { "Humberto." },
        { "Francisco" },
        { "Domingo." },
        { "Juanito." },
        { "Ursula." },
	{ "Rita." },
	{ "Wendy." }},
// french these need the accensts corrected...
       {{ "Oliver." },
        { "Marjolaine." },
        { "Michel." },
        { "Francois" },
        { "Joel." },
        { "Sebastien." },
        { "Angele." },
	{ "Jacqueline." },
	{ "Nadia." }}
};

Widget speaker_widgets[SPEAKING_VOICES];


/***************************************************************************
** Miscellaneous Globals 
***************************************************************************/
int lastStatus		= STOP;
int playStatus		= STOP;
int SpeakingRate	= 200;
int CurrentSpeaker	= 0;
int current_language     = 0;
BOOL bDictionaryLoaded = FALSE;
int outputWaveFormat = 0;
char outputTextFile[128];
char *playBuffer = NULL;
static int textModified = FALSE;
static int newFile      = FALSE;
static int saveas_fsbexists = FALSE;
static int processExitFlag = FALSE;

unsigned int TTS_us, TTS_sp, TTS_gr, TTS_la, TTS_uk, TTS_fr;
int us_on=0, sp_on=0, gr_on=0, la_on=0, uk_on=0, fr_on=0;


/***************************************************************************
** X widget declarations
***************************************************************************/
Widget speakerLabel;
Widget srateScale;
Widget srateValue;
Widget textWindow;
Widget toggleButton[NUM_TOGGLES];
Widget topshell;
Widget open_fsb, saveas_fsb, savewave_fsb, loaddic_fsb, pauseDialog;
Widget open_err, saveas_err, savewave_err, loaddic_err;
Widget save_onexit;
Widget index_CB;
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
    Boolean help;
    String geometry;
    int device;
    int encoding;
    String file;
} AppResources;

AppResources app_resources;

/***************************************************************************
** X widget resource declarations
***************************************************************************/
static XtResource resources[] = 
{
   {"help", "Help", XtRBoolean, sizeof(Boolean),
       XtOffset(AppResources *,help), XtRImmediate, (XtPointer)FALSE}, 
   {"geometry", "Geometry", XtRString, sizeof(char *),
       XtOffset(AppResources *,geometry), XtRString, NULL},
   {"device", "Device", XtRInt, sizeof(int),
       XtOffset(AppResources *,device), XtRImmediate, (XtPointer)WAVE_MAPPER},
   {"encoding", "Encoding", XtRInt, sizeof(int),
       XtOffset(AppResources *,encoding), XtRImmediate, (XtPointer)1},
   {"file", "File", XtRString, sizeof(char *),
       XtOffset(AppResources *,file), XtRString, NULL},
};

static XrmOptionDescRec options[] = 
{
   {"-help",     "help",     XrmoptionNoArg,  "on"},
   {"-geometry", "geometry", XrmoptionSepArg, NULL},
   {"-device",   "device",   XrmoptionSepArg, NULL},
   {"-encoding", "encoding", XrmoptionSepArg, NULL},
   {"-file",     "file",     XrmoptionSepArg, NULL},
};

static MrmHierarchy s_MrmHierarchy;     /* MRM database hierarchy ID */
static char *db_filename_vec[] = 
{
	uid_file			/* UID file for speak */
};
static int db_filename_num = 
    (sizeof db_filename_vec / sizeof db_filename_vec[0]);

/***************************************************************************
** Motif widget callback registeration
****************************************************************************/
static MrmRegisterArg reglist[] = 
{
   {"ChangeState", 	 (caddr_t) ChangeState},
   {"ProcessName", 	 (caddr_t) ProcessName},
   {"FileMenuSelect",    (caddr_t) FileMenuSelect},
   {"EditMenuSelect",    (caddr_t) EditMenuSelect},
   {"LangMenuSelect",    (caddr_t) LangMenuSelect},
   {"ProcessSave",       (caddr_t) ProcessSave},
   {"QuitProc",          (caddr_t) QuitProc},
   {"TextWidgetModified",(caddr_t) TextWidgetModified},
   {"PauseButtonSelect", (caddr_t) PauseButtonSelect},
   {"SpeakerMenuSelect", (caddr_t) SpeakerMenuSelect},
   {"CancelPrompt", 	 (caddr_t) CancelPrompt},
   {"ContinuePrompt", 	 (caddr_t) ContinuePrompt},
   {"WidgetCreate", 	 (caddr_t) WidgetCreate},
   {"WidgetCreateBitmap",(caddr_t) WidgetCreateBitmap},
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
    fprintf(stderr,"\n\t%s will read text from a file or from within the\n",
                progname);
    fprintf(stderr,"\twindow environment.  It will speak the text through\n");
    fprintf(stderr,"\tthe MME server using the highest quality audio device\n");
    fprintf(stderr,"\tit can find.\n"); 
    fprintf(stderr,"\tYou may override the default options by specifyig the \n");
    fprintf(stderr,"\t-device command line option to select a particular audio \n");
    fprintf(stderr,"\tdevice and by specifying the encoding with the -encoding\n");
    fprintf(stderr,"\toption.\n\n");
    fprintf(stderr,"Usage: %s [-device #] [-encoding #] [-file <filename>] [-help]\n", progname);
    fprintf(stderr,"   -device   #      Select the audio device ( 0 or 1 )\n");
    fprintf(stderr,"   -encoding #      To select the encoding; specify:\n");
    fprintf(stderr,"                       1   for PCM, 16 bit Mono 11KHz format\n");   
    fprintf(stderr,"                       2   for PCM,  8 bit Mono 11KHz format\n");
    fprintf(stderr,"                       3   for MULAW 8 bit Mono  8KHz format\n"); 
    fprintf(stderr,"   -file <filename> To specify a file to use\n");
    fprintf(stderr,"   -help            This help message\n");
    exit(-1);
}

/*******************************************************************************
**
**  verifyOptions 
**
**  FUNCTIONAL DESCRIPTION:
**
**     Checks the command line args.
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

int verifyOptions( char * progname )
{
   int i;
   FILE *f;

   if (isdigit(app_resources.encoding))
      return(FALSE);
   
   if ((app_resources.encoding < 1) | (app_resources.encoding > 3) )
      return(FALSE);

   if ( app_resources.file != NULL )
   {
      for (i =0; i < strlen(app_resources.file); i++)
      {
         if( isprint(app_resources.file[i]) == FALSE )
         {
            return(FALSE);
         }
      }

      if ( (f = fopen(app_resources.file, "r")) == NULL )
      {
         fprintf(stderr,"Could not open file: %s\n", app_resources.file);
         return(FALSE);
      }
      fclose( f );
   }

   if (isdigit(app_resources.device))
      return(FALSE);

   return(TRUE);
}

void ShutdownDectalk(void)
{
  if (us_on)
    {
      TextToSpeechReset(ttsHandle[TTS_us],TRUE);
      TextToSpeechSync(ttsHandle[TTS_us]);
      TextToSpeechShutdown(ttsHandle[TTS_us]);
      TextToSpeechCloseLang("US");
    }
  
  if (uk_on)
    {
      TextToSpeechReset(ttsHandle[TTS_uk],TRUE);
      TextToSpeechSync(ttsHandle[TTS_uk]);
      TextToSpeechShutdown(ttsHandle[TTS_uk]);
      TextToSpeechCloseLang("UK");
    }
  
  if (sp_on)
    {	       
      TextToSpeechReset(ttsHandle[TTS_sp],TRUE);
      TextToSpeechSync(ttsHandle[TTS_sp]);
      TextToSpeechShutdown(ttsHandle[TTS_sp]);
      TextToSpeechCloseLang("SP");
    }
  
  if (gr_on)
    {	       
      TextToSpeechReset(ttsHandle[TTS_gr],TRUE);
      TextToSpeechSync(ttsHandle[TTS_gr]);
      TextToSpeechShutdown(ttsHandle[TTS_gr]);
      TextToSpeechCloseLang("GR");
    }
  
  if (la_on)
    {
      TextToSpeechReset(ttsHandle[TTS_la],TRUE);
      TextToSpeechSync(ttsHandle[TTS_la]);
      TextToSpeechShutdown(ttsHandle[TTS_la]);
      TextToSpeechCloseLang("LA");
    }
  
  if (fr_on)
    {	       
      TextToSpeechReset(ttsHandle[TTS_fr],TRUE);
      TextToSpeechSync(ttsHandle[TTS_fr]);
      TextToSpeechShutdown(ttsHandle[TTS_fr]);
      TextToSpeechCloseLang("FR");
    }

}


/******************************************************************************
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
******************************************************************************/
main (argc,argv)
int argc;
char *argv[];
{
    MrmType class;
    MMRESULT mmstatus;
    int i;
    Arg arg[1];
    int sel = 0;
    char numstr[20];
    long devOptions = REPORT_OPEN_ERROR ;
    long devEncoding[3] = {
                          WAVE_FORMAT_1M16, 
                          WAVE_FORMAT_1M08, 
                          WAVE_FORMAT_08M08
                          };
    int devNo = WAVE_MAPPER;
    long indexParams;
    int num_wave_out_devices=0;
    Arg    arglist [3];
    char   gifFilePath[50];
    char   partialPath[50];
    Pixmap gifIcon = (Pixmap) 0;

#ifndef AFDRIVER 
    bzero( outputTextFile, 128 );
    /****************************************************/
    /* Check if the MME server is running...		*/
    /****************************************************/
#ifndef __linux__    
    num_wave_out_devices = waveOutGetNumDevs();

    if (num_wave_out_devices <= 0) 
    {
        fprintf(stderr, "speak exiting: Could not find any wave devices\n");
        fprintf(stderr, "Check to see if mmeserver is running. \n");
        exit(1);
    }
#endif
#endif
    /****************************************************/
    /*  Motif initialize routine 			*/
    /****************************************************/
    MrmInitialize();

    /****************************************************/
    /* Initialize the top level widget			*/
    /****************************************************/

#ifdef AFDRIVER
    topshell = XtAppInitialize(&app_con,"speakaf",options,XtNumber(options),
			       &argc,argv,fallback_resources,NULL,ZERO);
#else
    topshell = XtAppInitialize(&app_con,"speak",options,XtNumber(options),
			       &argc,argv,fallback_resources,NULL,ZERO);
#endif

   if ( argc > 1 )
      usage( title );

    i=0;
    XtSetArg(arg[i],XtNtitle,title); i++;
    XtSetValues(topshell,arg,i);

    /****************************************************/
    /* Open the UID files (the output of the UIL 	*/
    /* compiler) in the hierarchy.			*/
    /****************************************************/
#ifdef __linux__
    if ( MrmOpenHierarchyPerDisplay(XtDisplay(topshell),db_filename_num,
				    db_filename_vec,NULL,&s_MrmHierarchy) 
	 != MrmSUCCESS) {
#else
    if ( MrmOpenHierarchy(db_filename_num,db_filename_vec,NULL,
			  &s_MrmHierarchy) != MrmSUCCESS) {
#endif     
      fprintf(stderr,"Can't open UID hierarchy.\n");
      exit(1);
    }
    
    if (MrmRegisterNames (reglist, reglist_num) != MrmSUCCESS) {
	fprintf(stderr, "Can't register names\n");
	exit(1);
    }

    XtGetApplicationResources( topshell, (XtPointer) &app_resources,
                               resources, XtNumber(resources), NULL, ZERO );

    if ( app_resources.help )
       usage( title );

    if (! verifyOptions(title) )
       usage( title );

    /****************************************************/
    /* Setting devNo = -1 will result in		*/
    /* the MME driver selecting the appropriate device  */
    /****************************************************/

#ifdef AFDRIVER
    devOptions |= WAVE_FORMAT_08M08;
#else
    devOptions |= devEncoding[app_resources.encoding-1];
#endif
    devNo  = app_resources.device; 
    indexParams = 0;
    ttsHandle[0] = NULL;
    ttsHandle[1] = NULL;
    ttsHandle[2] = NULL;
    ttsHandle[3] = NULL;
    ttsHandle[4] = NULL;

    atexit(ShutdownDectalk);

    TTS_us=TextToSpeechStartLang("US");
    if (TTS_us == TTS_NOT_SUPPORTED)
      {
	printf("The libttsmme.so is not multi-language-supportive\n");
	exit(-1);
      }
    if ((TTS_us & TTS_LANG_ERROR) == 0)
      {
	TextToSpeechSelectLang(NULL,TTS_us);
	mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_us]), devNo,devOptions,
				       index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    us_on=1;
	    /* enable menu */
	  }
	else
	  {
	    fprintf(stderr, "%s: can't open DECtalk English connection.\n", argv[0]);
	  }
	current_language=TTS_us;
      }
    TTS_uk=TextToSpeechStartLang("UK");
    if ((TTS_uk & TTS_LANG_ERROR) == 0)
      {
	TextToSpeechSelectLang(NULL,TTS_uk);
	mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_uk]), devNo,devOptions,
				       index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    uk_on=1;
	    /* enable menu */
	  }
	else
	  {
	    fprintf(stderr, "%s: can't open DECtalk British connection.\n", argv[0]);
	  }
      }
    TTS_sp=TextToSpeechStartLang("SP");
    if ((TTS_sp & TTS_LANG_ERROR) == 0)
      {
	TextToSpeechSelectLang(NULL,TTS_sp);
	mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_sp]), devNo,devOptions,
				       index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    sp_on=1;
	    /* enable menu */
	  }
	else
	  {
	    fprintf(stderr, "%s: can't open DECtalk Spanish connection.\n", argv[0]);
	  }
      }
    TTS_gr=TextToSpeechStartLang("GR");
    if ((TTS_gr & TTS_LANG_ERROR) == 0)
      {
	TextToSpeechSelectLang(NULL,TTS_gr);
	mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_gr]), devNo,devOptions,
				       index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    gr_on=1;
	    /* enable menu */
	  }
	else
	  {
	    fprintf(stderr, "%s: can't open DECtalk German connection.\n", argv[0]);
	  }
      }
    TTS_la=TextToSpeechStartLang("LA");
    if ((TTS_la & TTS_LANG_ERROR) == 0)
      {
	TextToSpeechSelectLang(NULL,TTS_la);
	mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_la]), devNo,devOptions,
				       index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    la_on=1;
	    /* enable menu */
	  }
	else
	  {
	    fprintf(stderr, "%s: can't open DECtalk Latin American connection.\n", argv[0]);
	  }
      }
    TTS_fr=TextToSpeechStartLang("FR");
    if ((TTS_fr & TTS_LANG_ERROR) == 0)
      {
	TextToSpeechSelectLang(NULL,TTS_fr);
	mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_fr]), devNo,devOptions,
				       index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    fr_on=1;
	    /* enable menu */
	  }
	else
	  {
	    fprintf(stderr, "%s: can't open DECtalk French connection.\n", argv[0]);
	  }
      }
    
 

    /****************************************************/
    /* Get the widgets used in this application		*/
    /****************************************************/


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
    if ( MrmFetchWidget(s_MrmHierarchy, "loaddic_fs_box", topshell,
			&loaddic_fsb,&class) != MrmSUCCESS) {
	fprintf(stderr, "Can't fetch widget load dictionary fs box\n");
	exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "savewave_fs_box", topshell,
                        &savewave_fsb,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save wave fs box\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "saveas_fs_box", topshell,
                        &saveas_fsb,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save as fs box\n");
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
    if ( MrmFetchWidget(s_MrmHierarchy, "loaddic_error", topshell,
                        &loaddic_err,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget load dictionary error\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "saveas_error", topshell,
                        &saveas_err,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save as error\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "savewave_error", topshell,
                        &savewave_err,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save wave error\n");
        exit(1);
    }
    if ( MrmFetchWidget(s_MrmHierarchy, "save_onexit", topshell,
                        &save_onexit,&class) != MrmSUCCESS) {
        fprintf(stderr, "Can't fetch widget save on exit\n");
        exit(1);
    }

    /*****************************************************/
    /* Specify GIF image for DECtalk to be used when     */
    /* iconified.                                        */
    /*****************************************************/

    if (getenv("LOCAL_BITMAP"))
       sprintf(partialPath, "bitmaps/");
    else
       sprintf(partialPath, "/usr/include/X11/bitmaps/dtk/"); 
   
    sprintf(gifFilePath, "%s%s", partialPath, "dtk.gif" );
    gifIcon =  InternalGifGet(XtDisplay(topshell), gifFilePath);

    XtSetArg (  arglist [0], XmNiconPixmap, gifIcon );
    XtSetValues ( topshell, arglist, 1 );

    /*****************************************************/
    /* Add an event handler for the textWindow.  We want */
    /* to be able to watch for ButtonRelease Events.     */
    /*****************************************************/

    XtAddEventHandler( textWindow, ButtonReleaseMask, False, TrackMouse, NULL );

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

    /*
     * wait until input buffer is empty before sending the next line
     */
    identifier = INPUT_CHARACTER_COUNT;
    TextToSpeechGetStatus( ttsHandle[current_language], &identifier, &items_in_pipe, 1 );
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
       TextToSpeechSpeak( ttsHandle[current_language], playBuffer, dwFlags );
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
    XtSetValues(srateValue,args,i);
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
**   Disables the text window and sets up an XtAppAddWorkProc
**   with the procedure PlaySome as a callback routine.
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
	/*****************************/
	/* get buffer contents       */
	/*****************************/
	sfile = XmTextGetString( textWindow );

	/*****************************/
	/* get size of buffer        */
	/*****************************/
	FileLen = strlen( sfile );

	/*************************************/
	/* set starting and ending positions */
	/*************************************/
	FilePos = 0;

	/*****************************/
	/* update speaker label      */
	/*****************************/
	UpdateSpeakerLabel();

	/*****************************/
	/* set current speaker/rate  */
	/*****************************/
	TextToSpeechSetSpeaker( ttsHandle[current_language], CurrentSpeaker );
	TextToSpeechSetRate ( ttsHandle[current_language], SpeakingRate );

	/******************************/
	/* disable the user interface */
	/******************************/
	DisableUI();

	/******************************/
	/* set status                 */
	/******************************/
	playStatus = PLAY;
 
        /******************************/
        /* Play the file              */
        /******************************/
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
	/******************************/
	/*  free buffer contents      */
	/******************************/
	if ( sfile != NULL ) {
	    XtFree( sfile );
	    sfile = NULL;
	}
        if ( playBuffer != NULL )
           free( playBuffer );

	/******************************/
	/* enable the user interface  */
	/******************************/
	EnableUI();

	/******************************/
	/* stop DECtalk               */
	/******************************/
	TextToSpeechReset( ttsHandle[current_language], FALSE );

	/******************************/
	/* set status                 */
	/******************************/
	playStatus = STOP;
	break;

    case PAUSE:
	break;

    case STOP:
	/******************************/
	/* stop DECtalk               */
	/******************************/
	TextToSpeechReset ( ttsHandle[current_language], FALSE );
        
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
    /******************************/
    /*  pause DECtalk             */
    /******************************/
    TextToSpeechPause( ttsHandle[current_language] );

    /******************************/
    /* set status                 */
    /******************************/
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
    /******************************/
    /* resume DECtalk             */
    /******************************/
    TextToSpeechResume( ttsHandle[current_language] );

    /******************************/
    /* set status                 */
    /******************************/
    playStatus = lastStatus;

    /******************************/
    /* add work procedure         */
    /******************************/
    if ( playStatus == PLAY ) {
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

    /*************************************/
    /* Check which button was pushed and */
    /* call the appropriate routine.     */
    /*************************************/
    if (w == toggleButton[PLAY]) 
	StartPlay();
    else if (w == toggleButton[STOP])
        StopPlay();
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
    case SRATEVALUE:
	srateValue = w;
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
   processExitFlag = TRUE;
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
   XtDestroyApplicationContext(XtWidgetToApplicationContext(w));
//   TextToSpeechShutdown( ttsHandle[current_language] );   /*  call cleanup routine */
   /* Free up memory on the cut/paste/undo option */
   if( lc.selected_string != NULL )
      XtFree( lc.selected_string );
   exit(0);
}
                   
/****************************************************************************
**
**  WidgetCreateBitmap 
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
void WidgetCreateBitmap(w,tag,call_data)
Widget w;
int *tag;
XtPointer call_data;
{
    Pixmap pmSpeaker;
    Pixmap pmArmSpeaker;
    char   path[50];
    char   bmpfile[50];
 
    if (getenv("LOCAL_BITMAP"))
       sprintf(path, "bitmaps/");
    else
       sprintf(path, "/usr/include/X11/bitmaps/dtk/"); 

    switch (*tag) {
        case PAUL:
            sprintf(bmpfile, "%s%s", path,"pau16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"pau16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w, "paul", pmSpeaker, pmArmSpeaker, PAUL);
	    break;

        case BETTY:
            sprintf(bmpfile, "%s%s", path,"bet16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"bet16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w, "betty", pmSpeaker, pmArmSpeaker, BETTY);
	    break;

        case HARRY:
            sprintf(bmpfile, "%s%s", path,"har16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"har16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w, "harry", pmSpeaker, pmArmSpeaker, HARRY);
	    break;

        case FRANK:
            sprintf(bmpfile, "%s%s", path,"fra16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"fra16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w, "frank", pmSpeaker, pmArmSpeaker, FRANK);
	    break;

        case DENNIS:
            sprintf(bmpfile, "%s%s", path,"den16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"den16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w,"dennis",pmSpeaker,pmArmSpeaker, DENNIS);
	    break;

        case KIT:
            sprintf(bmpfile, "%s%s", path,"kid16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"kid16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w, "kit", pmSpeaker, pmArmSpeaker, KIT);
	    break;

        case URSULA:
            sprintf(bmpfile, "%s%s", path,"urs16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"urs16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w,"ursula",pmSpeaker,pmArmSpeaker, URSULA);
	    break;

        case RITA:
            sprintf(bmpfile, "%s%s", path,"rit16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"rit16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w, "rita", pmSpeaker, pmArmSpeaker, RITA);
	    break;

        case WENDY:
            sprintf(bmpfile, "%s%s", path,"wen16a.gif" );
	    pmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            sprintf(bmpfile, "%s%s", path,"wen16b.gif" );
	    pmArmSpeaker = InternalGifGet(XtDisplay(w), bmpfile);
            CreatePixmapPushButton( w, "wendy", pmSpeaker, pmArmSpeaker, WENDY);
	    break;
    }
}


/****************************************************************************
**
**  CreatePixmapPushButton 
**
**  FUNCTIONAL DESCRIPTION:
**
**
**  FORMAL PARAMETERS:
**
**
**  RETURN VALUE
**
**    None
**
***************************************************************************/
Widget CreatePixmapPushButton( Widget parent, char *name, Pixmap pixmap, 					Pixmap armPixmap, DWORD speakerId )
{
    Arg    args[20];
    int    n = 0;

    XtSetArg(args[n], XmNlabelType, XmPIXMAP); n++;
    XtSetArg(args[n], XmNlabelPixmap, pixmap); n++;
    XtSetArg(args[n], XmNarmPixmap, armPixmap); n++;
    XtSetArg(args[n], XmNdefaultButtonShadowThickness, 1); n++;
    if ( speakerId == PAUL )
    {
       XtSetArg(args[n], XmNshowAsDefault, TRUE); n++;
    }

    speaker_widgets[speakerId] = 
              (Widget) XmCreatePushButton( parent, name, args, n );

    XtManageChild( speaker_widgets[speakerId] );

    XtAddCallback( speaker_widgets[speakerId], XmNactivateCallback, 
                            SpeakerMenuSelect, speakerId); 
    return( speaker_widgets[speakerId] );
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
	if ( playStatus != PAUSE ) {
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
    static int savewave_fsbexists = FALSE;
    static int loaddic_fsbexists = FALSE;
    static int save_onexit_fsbexists = FALSE;

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
              //TextToSpeechShutdown( ttsHandle[current_language] );  /*  call cleanup routine */
	      /* 
               * Free up memory on the cut/paste/undo option 
               */
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
       case menu_loaddic :
           if (loaddic_fsbexists == FALSE) {
               loaddic_fsbexists = TRUE;
               XtRealizeWidget(loaddic_fsb);
           }
           CenterWidgetOverCursor(loaddic_fsb);
           XtManageChild(loaddic_fsb);
           break;
       case menu_unloaddic :
	   TextToSpeechUnloadUserDictionary( ttsHandle[current_language] );
	   bDictionaryLoaded = FALSE;
           break;
       case menu_save1M16 :
       case menu_save1M08 :
       case menu_save08M08 :
       case menu_savewave :
	   outputWaveFormat = *tag;
           if (savewave_fsbexists == FALSE) {
               savewave_fsbexists = TRUE;
               XtRealizeWidget(savewave_fsb);
           }
           CenterWidgetOverCursor(savewave_fsb);
           XtManageChild(savewave_fsb);
           break;
       case menu_save :
	   if( outputTextFile[0] != (char)NULL ) 
	   {
              if ( ! SaveTextFile( outputTextFile ) ) {
                  /*  create popup */
                  XtRealizeWidget(saveas_err);
                  XtManageChild(saveas_err);
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
		    /*
                     *  Remove what we just pasted 
                     */
		    XmTextReplace( textWindow, lc.tpLeft, 
				   lc.tpLeft + dwLength, NULL );
		    /* 
                     * Insert what we pasted over.
                     */
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
	   /* 
            * Remeber what we are about to do so we can 'undo' later 
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



void LangMenuSelect( Widget w, int *tag, XtPointer call_data )
{
  switch(*tag)
    {
    case menu_english:
      current_language=TTS_us;
      break;
    case menu_british:
      current_language=TTS_uk;
      break;
    case menu_spanish:
      current_language=TTS_sp;
      break;
    case menu_german:
      current_language=TTS_gr;
      break;
    case menu_latin_american:
      current_language=TTS_la;
      break;
    case menu_french:
      current_language=TTS_fr;
      break;
    }
}

/****************************************************************************
**
**  TrackMouse 
**
**  FUNCTIONAL DESCRIPTION:
**
**	This function will track all the mouse movements and button clicks.
**  The idea is that the user can select a portion of text with the
**  mouse and all the cut/paste/copy/delete menu items should become active.
**
**      If the user presses Mouse Button 3, then the selected text will be
**  spoken.
**
**
**  FORMAL PARAMETERS:
**
**	Widget w		- text window
**	XtPointer client_data	- not used
**	XEvent *event		- a pointer to the mouse events.
**
**  RETURN VALUE
**
**	nothing.
**
***************************************************************************/
static void TrackMouse( Widget w, XtPointer client_data, XEvent *event )
{
    char *selected_string;

    /****************************************************/
    /* If button #3 is pressed, speak the selected text */
    /****************************************************/
    if( event->xbutton.button == Button3 ) {
        selected_string = XmTextGetSelection( textWindow );

	if(( selected_string == NULL ) || ( !strlen( selected_string )))
	    TextToSpeechSpeak( ttsHandle[current_language], "Nothing was selected.", TTS_FORCE );
	else 
	    TextToSpeechSpeak( ttsHandle[current_language], selected_string, TTS_FORCE );

	if( selected_string != NULL ) {
	    XtFree( selected_string );
	    selected_string = NULL;
	}
    }

    /*************************************************/
    /* If button #1 is pressed, turn on the edit menu*/
    /*************************************************/

    if( event->xbutton.button == Button1 ) {
        selected_string = XmTextGetSelection( textWindow );
	if(( selected_string != NULL ) && ( strlen( selected_string ))) {
    	    XtSetSensitive(toggleButton[SELECTALL],True); 
    	    XtSetSensitive(toggleButton[COPY],True); 
    	    XtSetSensitive(toggleButton[PASTE],False); 
    	    XtSetSensitive(toggleButton[CUT],True); 
    	    XtSetSensitive(toggleButton[DELETE],True); 
	    XtFree( selected_string );
	}
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
    int i = 0;
    Arg args[1];
    XmString str;

    sprintf(buf,"%d WPM", SpeakingRate);

    str = XmStringCreateSimple( buf );
    i = 0;
    XtSetArg(args[i],XmNlabelString,str); i++;
    XtSetValues(srateValue,args,i);
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
void SpeakerMenuSelect( Widget w, XtPointer tag, XtPointer call_data)
{
    Arg    args[5];
    int    n = 0;
    Widget currentWidget;
    int oldSpeaker;

    oldSpeaker = CurrentSpeaker;
    XtSetArg(args[n], XmNshowAsDefault, FALSE); n++;
    XtSetValues(speaker_widgets[oldSpeaker],args,n); n = 0;

    CurrentSpeaker = (DWORD)tag;
    currentWidget = speaker_widgets[CurrentSpeaker];

    XtSetArg(args[n], XmNshowAsDefault, TRUE); n++;
    XtSetValues(currentWidget,args,n);

    TextToSpeechSetSpeaker( ttsHandle[current_language], CurrentSpeaker );
    TextToSpeechSpeak( ttsHandle[current_language], speaker_names[current_language][CurrentSpeaker].name, TTS_FORCE );
			   
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
void UpdateSpeakingRate( Widget w, int *tag, XtPointer call_data )
{
    XmScaleGetValue(srateScale,&SpeakingRate);
    UpdateSpeakerLabel();
    TextToSpeechSetRate( ttsHandle[current_language], SpeakingRate);
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
    int x, y, dummyX,dummyY;
    unsigned int mask;
    Dimension dimW,dimH;
    Arg cargs[2];

    /* 
     * Get cursor position 
     */
    (void) XQueryPointer(XtDisplay(widget), XtWindow(widget),
                         &root, &child,
                         &x, &y, &dummyX, &dummyY,
                         &mask);
    XtVaGetValues( widget, XtNwidth, &dimW, XtNheight, &dimH, NULL );

    /* 
     * Calculate new x and y 
     */
    x -= ((int) dimW) / 2;
    y -= ((int) dimH) / 2;
    if (x + (int) dimW > WidthOfScreen(XtScreen(widget))) {
        x = WidthOfScreen(XtScreen(widget)) - (int) dimW;
    }
    if (y + (int) dimH > HeightOfScreen(XtScreen(widget))) {
        y = HeightOfScreen(XtScreen(widget)) - (int) dimH;
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
void CancelPrompt( Widget w, int *tag, XtPointer call_data)
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
void ContinuePrompt( Widget w, int *tag, XtPointer call_data)
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
	  strcpy( outputTextFile, fname );
          if ( ! InputFile( outputTextFile ) ) {
   	      /* create popup */
	      XtRealizeWidget(open_err);
	      XtManageChild(open_err);
          }
          XtUnmanageChild(open_fsb);
          break;
       case menu_save :
       case menu_saveas :
	  strcpy( outputTextFile, fname );
          if ( ! SaveTextFile( outputTextFile ) ) {
              /*  create popup */
              XtRealizeWidget(saveas_err);
              XtManageChild(saveas_err);
          }
          XtUnmanageChild(saveas_fsb);
          /*
           * Done after saving the file, exit
           */
          if (processExitFlag)
          {
              XtDestroyApplicationContext(XtWidgetToApplicationContext(w));
              TextToSpeechShutdown( ttsHandle[current_language] );   /*  call cleanup routine */
              /* Free up memory on the cut/paste/undo option */
              if( lc.selected_string != NULL )
                 XtFree( lc.selected_string );
              exit(0);
          }
          break;
       case menu_loaddic :
          if ( ! LoadDicFile( fname ) ) {
              /*  create popup */
              XtRealizeWidget(loaddic_err);
              XtManageChild(loaddic_err);
          }
          XtUnmanageChild(loaddic_fsb);
          break;
       case menu_savewave :
          if ( SaveWaveFile( fname ) != MMSYSERR_NOERROR ) {
              XtRealizeWidget(savewave_err);
              XtManageChild(savewave_err);
          }
          XtUnmanageChild(savewave_fsb);
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
MMRESULT SaveWaveFile( fname )
String fname;
{
   char *sText = NULL;
   int   sLength = 0;
   long  dwFlags = TTS_FORCE;
   DWORD dwDevOptions;
   MMRESULT mmStatus;
   char buf[4096];
   int FilePos = 0;
   int nbytes;

   switch( outputWaveFormat ) {
       case menu_save1M16 :
	    dwDevOptions = WAVE_FORMAT_1M16;
	    break;
       case menu_save1M08 :
	    dwDevOptions = WAVE_FORMAT_1M08;
	    break;
       case menu_save08M08 :
	    dwDevOptions = WAVE_FORMAT_08M08;
	    break;
       default :
	    dwDevOptions = WAVE_FORMAT_08M08;
	    break;
   }

   mmStatus = TextToSpeechOpenWaveOutFile( ttsHandle[current_language], fname, dwDevOptions);

   if ( mmStatus != MMSYSERR_NOERROR )
      return( mmStatus );

   sText = XmTextGetString( textWindow );
   sLength = strlen( sText );

   while ( FilePos < sLength )
   {
      strncpy( buf, &sText[FilePos], 4000);
      nbytes = strlen( buf );
      mmStatus = TextToSpeechSpeak( ttsHandle[current_language], buf, dwFlags );
      FilePos += nbytes;

      if ( mmStatus != MMSYSERR_NOERROR )
         return( mmStatus );
   }
   mmStatus = TextToSpeechCloseWaveOutFile( ttsHandle[current_language] );
   XtFree( sText );
   return ( mmStatus );
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
       return ( FALSE );
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

/*******************************************************************************
**
**  LoadDicFile 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Loads in a specified dictionary into DECtalk.
**
**  FORMAL PARAMETERS:
**
**    name -  A string value with the path and file name
**            of the dictionary file.
**
**
**  RETURN VALUE
**
**
******************************************************************************/
int LoadDicFile(name)
String name;
{
    /*********************************************/
    /* Unload a dictionary if one already exists */
    /*********************************************/
    if( bDictionaryLoaded )
        TextToSpeechUnloadUserDictionary( ttsHandle[current_language] );


    /*********************************************/
    /* Now load the new dictionary file          */
    /*********************************************/
    TextToSpeechLoadUserDictionary( ttsHandle[current_language], name );
    bDictionaryLoaded = TRUE;

    return( 1 );

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
        //printf( "Memory buffer\n");
        break;
   }

}









//#define S_DEBUG
/*
 *									Copyright ©
 *    @DEC_COPYRIGHT@
 *    Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 */
/*  MODIFICATION HISTORY:
 *  
 * 001	ETT  12/07/1998 Inception... 
 * 002	NAL  04/08/2000 Added demo support
 * 003	MGS  10/05/2000	Redhat 6.2 and linux warning removal


TODO:
* make "are you sure you want to quit" dialogs.
* fix some of the text modified checking.
* put in callback code for save to wave files.
* tooltips if we want them.  (bubbles to explain what each widget does)
* miscellany
* very important: fortune cookie.
 */
/* 
   get help here: www.gtk.org
   build this with: 
   gcc -Wall -g gspeak.c -o gspeak `gtk-config --cflags` `gtk-config --libs` -L/lib -ltts 
*/

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>   
#include <strings.h>
#include <gtk/gtk.h>
//#include <gtk/gtkenums.h>
/***************************************************************************
** DECtalk Text To Speech header file.
***************************************************************************/
#include <dtk/dtmmedefs.h>
#include <dtk/ttsapi.h>     

#define ZERO            0
#define SPEAKING_VOICES 9
#define NUM_LANGS       6
#define STOP            0
#define PLAY            1
#define PAUSE           2
#define PAUL            0
#define BETTY           1
#define HARRY           2
#define FRANK           3
#define DENNIS          4
#define KIT             5
#define URSULA          6
#define RITA            7
#define WENDY           8
#define menu_save1M16   14 
#define menu_save1M08   15 
#define menu_save08M08  16 
#define menu_english    17
#define menu_spanish    18
#define menu_german     19
#define menu_latin_american 20
#define menu_british    21
#define menu_french	22

static LPTTS_HANDLE_T ttsHandle[NUM_LANGS]; /* DECtalk handle */

/* prototypes */
#ifdef DEMO
void DemoFileOpen();
#endif
int PlaySome();
static int StartPlay(GtkWidget *, gpointer);
static int PausePlay(GtkWidget *, gpointer);
void StopPlay(GtkWidget *, gpointer);
void LangMenuSelect(GtkWidget *, gpointer);
void SelectSpeaker(GtkWidget *, gpointer);
void FileNewCallback(GtkWidget *, gpointer);
void FileOpenCallback(GtkWidget *, gpointer);
void FileOpenOkCallback(GtkWidget *, gpointer);
void FileSaveCallback(GtkWidget *, gpointer);
void FileSaveAsCallback(GtkWidget *, gpointer);
void FileSaveAsOkCallback(GtkWidget *, gpointer);
void FileSaveWaveCallback(GtkWidget *, gpointer);
void FileSaveWaveOkCallback(GtkWidget *, gpointer);
static void FileQuitCallback(GtkWidget *, gpointer);
void EditUndoCallback(GtkWidget *, gpointer);
void EditCutCallback(GtkWidget *, gpointer);
void EditCopyCallback(GtkWidget *, gpointer);
void EditPasteCallback(GtkWidget *, gpointer);
void HelpHelpCallback(GtkWidget *, gpointer);
void HelpOpenNetscape();
void HelpAboutCallback(GtkWidget *, gpointer);
void LoadUserDictCallback(GtkWidget *, gpointer);
void LoadUserDictOkCallback(GtkWidget *, gpointer);
void UnloadUserDictCallback(GtkWidget *, gpointer);
void NotAvailableCallback(GtkWidget *, gpointer);
void TextWidgetModified(GtkWidget *, GdkEvent *, gpointer);
void RateScaleModified(GtkAdjustment *);
char *strip_filename (gchar *);
void ERROR(char *);

/***************************************************************************
** Miscellaneous Globals 
***************************************************************************/
int lastStatus		= 0;
int playStatus		= 0;
int SpeakingRate	= 200;
int CurrentSpeaker	= 0;
int current_language     = 0;
BOOL bDictionaryLoaded = FALSE;
char OpenFileName[PATH_MAX];
char SaveFileName[PATH_MAX];
int  OutputFormat;
//char *sfile = NULL;
int outputWaveFormat = 0;
char *playBuffer = NULL;
static int textModified = FALSE;
static int newFile      = FALSE;

GtkWidget *window = NULL;

/* text from window */
gchar *sfile = NULL;
int FileLen = 0;
int FilePos = 0;
/* text window */
GtkWidget *text_entry;
gint modified_id;

unsigned int TTS_us=NUM_LANGS+1, TTS_sp=NUM_LANGS+1, TTS_gr=NUM_LANGS+1;
unsigned int  TTS_la=NUM_LANGS+1, TTS_uk=NUM_LANGS+1, TTS_fr=NUM_LANGS+1;
int us_on=0, sp_on=0, gr_on=0, la_on=0, uk_on=0, fr_on=0;

/***************************************************************************
* DECtalk speaker names 
***************************************************************************/
typedef struct SpeakerName_t {
    char   name[20];
} SpeakerName;

static SpeakerName speaker_names[NUM_LANGS][SPEAKING_VOICES] = 
{
  //US
  {{ "Paul." },
   { "Betty." },
   { "Harry." },
   { "Frank." },
   { "Dennis." },
   { "Kit." },
   { "Ursula." },
   { "Rita." },
   { "Wendy." }},
  //UK
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
  //French
  {{ "Paul." },
   { "Betty." },
   { "Harry." },
   { "Frank." },
   { "Dennis." },
   { "Kit." },
   { "Ursula." },
   { "Rita." },
   { "Wendy." }}
};

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

/* this is the GtkMenuEntry structure used to create new menus.  The
 * first member is the menu definition string.  The second, the
 * default accelerator key used to access this menu function with
 * the keyboard.  The third is the callback function to call when
 * this menu item is selected (by the accelerator key, or with the
 * mouse.) The last member is the data to pass to your callback function.
 */
#ifndef DEMO
static GtkItemFactoryEntry menu_items[] =
{
  {"/_File/", NULL, NULL, 0, "<Branch>"},
  {"/File/_New", "<control>N", FileNewCallback, 0, NULL},
  {"/File/_Open...", "<control>O", FileOpenCallback, 0, NULL},
  {"/File/S_ave", "<control>A", FileSaveCallback, 0, NULL},
  {"/File/Save as", NULL, FileSaveAsCallback, 0, NULL},
  {"/File/_Close", "<control>C", FileNewCallback, 0, NULL},
  {"/File/sep", NULL, NULL, 0, "<Separator>"},
  {"/File/_Load User Dictionary...","<control>L", LoadUserDictCallback, 0, NULL},
  {"/File/_Unload User Dictionary","<control>U", UnloadUserDictCallback, 0, NULL},
  {"/File/Convert to Wave File", NULL, NULL, 0, "<Branch>"},
  {"/File/sep", NULL, NULL, 0, "<Separator>"},
  {"/File/_Quit", "<control>Q", FileQuitCallback, 0, NULL},
  {"/File/Convert to Wave File/MONO 11.025kHz, 16-Bit", NULL, FileSaveWaveCallback, menu_save1M16 , NULL},
  {"/File/Convert to Wave File/MONO 11.025kHz, 8-Bit", NULL, FileSaveWaveCallback, menu_save1M08, NULL},
  {"/File/Convert to Wave File/MONO 8kHz, uLaw", NULL, FileSaveWaveCallback, menu_save08M08, NULL},
  {"/_Edit/", NULL, NULL, 0, "<Branch>"},
  {"/Edit/Cut", "<control>X", EditCutCallback, 0, NULL},
  {"/Edit/Copy", "<control>C", EditCopyCallback, 0, NULL},
  {"/Edit/Paste", "<control>V", EditPasteCallback, 0, NULL},
  {"/Edit/sep", NULL, NULL, 0, "<Separator>"},
  {"/Edit/_English", NULL, LangMenuSelect, menu_english, NULL},
  {"/Edit/S_panish", NULL, LangMenuSelect, menu_spanish, NULL},
  {"/Edit/_German", NULL, LangMenuSelect, menu_german, NULL},
  {"/Edit/_Latin American", NULL, LangMenuSelect, menu_latin_american, NULL},
  {"/Edit/English U_K", NULL, LangMenuSelect, menu_british, NULL},
  {"/Edit/_French", NULL, LangMenuSelect, menu_french, NULL},
  {"/_Help/", NULL, NULL, 0, "<LastBranch>"},
  {"/Help/_Help on DECtalk", "F1", HelpHelpCallback, 0, NULL},
  {"/Help/About _GSpeak", "F2", HelpAboutCallback, 0, NULL},
};

#else

static GtkItemFactoryEntry menu_items[] =
{
  {"/_File/", NULL, NULL, 0, "<Branch>"},
  {"/File/_New", "<control>N", FileNewCallback, 0, NULL},
  {"/File/_Open...", "<control>O", FileOpenCallback, 0, NULL},
  {"/File/S_ave", "<control>A", FileSaveCallback, 0, NULL},
  {"/File/Save as", NULL, FileSaveAsCallback, 0, NULL},
  {"/File/_Close", "<control>C", FileNewCallback, 0, NULL},
  {"/File/sep", NULL, NULL, 0, "<Separator>"},
  {"/File/_Load User Dictionary...","<control>L", NotAvailableCallback, 0, NULL},
  {"/File/_Unload User Dictionary","<control>U", NotAvailableCallback, 0, NULL},
  {"/File/Convert to Wave File", NULL, NULL, 0, "<Branch>"},
  {"/File/sep", NULL, NULL, 0, "<Separator>"},
  {"/File/_Quit", "<control>Q", FileQuitCallback, 0, NULL},
  {"/File/Convert to Wave File/MONO 11.025kHz, 16-Bit", NULL, NotAvailableCallback, 0, NULL},
  {"/File/Convert to Wave File/MONO 11.025kHz, 8-Bit", NULL, NotAvailableCallback, 0, NULL},
  {"/File/Convert to Wave File/MONO 8kHz, uLaw", NULL, NotAvailableCallback, 0, NULL},
  {"/_Edit/", NULL, NULL, 0, "<Branch>"},
  {"/Edit/Cut", "<control>X", EditCutCallback, 0, NULL},
  {"/Edit/Copy", "<control>C", EditCopyCallback, 0, NULL},
  {"/Edit/Paste", "<control>V", EditPasteCallback, 0, NULL},
  {"/Edit/sep", NULL, NULL, 0, "<Separator>"},
#ifdef ENGLISH
  {"/Edit/_English", NULL, LangMenuSelect, menu_english, NULL},
#endif
#ifdef SPANISH
  {"/Edit/S_panish", NULL, LangMenuSelect, menu_spanish, NULL},
#endif
#ifdef GERMAN
  {"/Edit/_German", NULL, LangMenuSelect, menu_german, NULL},
#endif
#ifdef SPANISH_LA
  {"/Edit/_Latin American", NULL, LangMenuSelect, menu_latin_american, NULL},
#endif
#ifdef ENGLISH_UK
  {"/Edit/English U_K", NULL, LangMenuSelect, menu_british, NULL},
#endif
#ifdef FRENCH
  {"/Edit/_French", NULL, LangMenuSelect, menu_french, NULL},
#endif
  {"/_Help/", NULL, NULL, 0, "<LastBranch>"},
  {"/Help/_Help on DECtalk", "F1", HelpHelpCallback, 0, NULL},
  {"/Help/About _GSpeak", "F2", HelpAboutCallback, 0, NULL},
};
#endif //DEMO


void get_main_menu(GtkWidget *win, GtkWidget ** menubar)
{
  GtkItemFactory *factory;
  GtkAccelGroup *accel_group;
  int nmenu_items = sizeof(menu_items) / sizeof(menu_items[0]);
  
  accel_group = gtk_accel_group_new();
  
  factory = gtk_item_factory_new(GTK_TYPE_MENU_BAR, "<main>", accel_group);
  gtk_item_factory_create_items(factory, nmenu_items, menu_items, NULL);
  gtk_window_add_accel_group(GTK_WINDOW(win), accel_group);

  if (menubar)
    *menubar = gtk_item_factory_get_widget(factory, "<main>");
}

int main (int argc, char *argv[])
{
  MMRESULT mmstatus;
  //long devOptions = OWN_AUDIO_DEVICE | REPORT_OPEN_ERROR ;
  long devOptions = REPORT_OPEN_ERROR ;
  //  long devEncoding[3] = {
  //  WAVE_FORMAT_1M16, 
  //  WAVE_FORMAT_1M08, 
  //  WAVE_FORMAT_08M08
  //};
  int devNo = WAVE_MAPPER;
  GtkWidget *main_vbox; //holds all widgets
  GtkWidget *menubar = NULL; 
  GtkWidget *text_box; //holds text_entry and vscrollbar
  GtkWidget *vscrollbar;
  GtkWidget *button_box; //holds the play, pause, stop buttons
  GtkWidget *button;
  GtkWidget *pixmapwid; //widget for the pixmap
  //  GtkWidget *splash;  //yeah yeah splash screens suck but DECtalk is too damn slow!
  GdkPixmap *pixmap; //for the character faces
  GdkBitmap *mask;
  GtkStyle *style;
  GtkObject *rate_adjustment;
  GtkWidget *rate_scale;
  GtkWidget *wpm_label;
  char bitmap_path[500];
  char bitmap_name[500];
  FILE *config_file;
  LANG_ENUM *dt_langs;
  
  /* initialize GTK catching any GTK arguments. */
  gtk_init (&argc, &argv);
  
  /* create a new window */
  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW (window), "GSpeak");
  //button = gtk_label_new("Hold your horses!");
  //gtk_container_border_width (GTK_CONTAINER (window), 10);
  //gtk_container_add (GTK_CONTAINER (window), button);
  //gtk_widget_show(button);
    gtk_widget_show(window);
  style = gtk_widget_get_style(window);
  
#define index_callback NULL
#define indexParams 0

  TextToSpeechEnumLangs(&dt_langs);

  if (dt_langs==NULL || dt_langs->MultiLang==FALSE)
    {
      
      if (strcmp("us",dt_langs->Entries[0].lang_code)==0)
	{
	  current_language=0;
	  mmstatus = TextToSpeechStartup( &(ttsHandle[current_language]), devNo,
					  devOptions, index_callback, indexParams );
	  if (mmstatus==MMSYSERR_NOERROR)
	    {
	      us_on=1;
	      TTS_us=0;
	      
	      /* enable menu */
	    }
	}
      if (strcmp("uk",dt_langs->Entries[0].lang_code)==0)
	{
	  current_language=1;
	  mmstatus = TextToSpeechStartup( &(ttsHandle[current_language]), devNo,
					  devOptions, index_callback, indexParams );
	  if (mmstatus==MMSYSERR_NOERROR)
	    {
	      uk_on=1;
	      TTS_uk=1;
	      /* enable menu */
	  }
      }
    if (strcmp("sp",dt_langs->Entries[0].lang_code)==0)
      {
	current_language=2;
	mmstatus = TextToSpeechStartup( &(ttsHandle[current_language]), devNo,
					devOptions, index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    sp_on=1;
	    TTS_sp=2;
	    /* enable menu */
	  }
      }
    if (strcmp("gr",dt_langs->Entries[0].lang_code)==0)
      {
	current_language=3;
	mmstatus = TextToSpeechStartup( &(ttsHandle[current_language]), devNo,
					devOptions, index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    gr_on=1;
	    TTS_gr=3;
	    /* enable menu */
	  }
      }
    if (strcmp("la",dt_langs->Entries[0].lang_code)==0)
      {
	current_language=4;
	mmstatus = TextToSpeechStartup( &(ttsHandle[current_language]), devNo,
					devOptions, index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    la_on=1;
	    TTS_la=4;
	    /* enable menu */
	  }
      }
    if (strcmp("fr",dt_langs->Entries[0].lang_code)==0)
      {
	current_language=5;
	mmstatus = TextToSpeechStartup( &(ttsHandle[current_language]), devNo,
					devOptions, index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    fr_on=1;
	    TTS_fr=5;
	    /* enable menu */
	  }
      }
    
  }
  else
    {
      
      TTS_us = TextToSpeechStartLang("us");
      if ( TTS_us & TTS_LANG_ERROR ) {
	if (TTS_us == TTS_NOT_SUPPORTED)
	  {	
	    fprintf(stderr,"DECtalk ML not found.\n");
	  }
	else if (TTS_us == TTS_NOT_AVAILABLE){
	  TTS_us=0;
	  fprintf(stderr,"US English is not currently installed.\n");
	}
	else
	  fprintf(stderr,"Unknown error whilst attempting to start english.\n");
      }
      else // success
	{
	  TextToSpeechSelectLang(NULL,TTS_us);
	  mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_us]), devNo,devOptions,
					  index_callback, indexParams );
	  if (mmstatus==MMSYSERR_NOERROR)
	    {
	      us_on=1;
	      current_language=TTS_us;
	      /* enable menu */
	    }
    }

  TTS_uk = TextToSpeechStartLang("uk");
  if ( TTS_uk & TTS_LANG_ERROR ) {
    if (TTS_uk == TTS_NOT_SUPPORTED)
      fprintf(stderr,"DECtalk ML not found.\n");
    else if (TTS_uk == TTS_NOT_AVAILABLE){
      TTS_uk=0;
      fprintf(stderr,"UK English is not currently installed.\n");
    }
    else
      fprintf(stderr,"Unknown error whilst attempting to start UK english.\n");
  }
  else // success
    {
      TextToSpeechSelectLang(NULL,TTS_uk);
      mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_uk]), devNo,devOptions,
				      index_callback, indexParams );
      if (mmstatus==MMSYSERR_NOERROR)
	{
	  uk_on=1;
	  /* enable menu */
	}
    }
  
  TTS_sp = TextToSpeechStartLang("sp");
  if ( TTS_sp & TTS_LANG_ERROR ) {
    if (TTS_sp == TTS_NOT_SUPPORTED)
      fprintf(stderr,"DECtalk ML not found.\n");
    else if (TTS_sp == TTS_NOT_AVAILABLE){
      TTS_sp=0;
      fprintf(stderr,"Castillian Spanish is not currently installed.\n");
    }
    else
      fprintf(stderr,"Unknown error whilst attempting to start Spanish.\n");
  }
  else // success
    {
      TextToSpeechSelectLang(NULL,TTS_sp);
      mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_sp]), devNo,devOptions,
				      index_callback, indexParams );
      if (mmstatus==MMSYSERR_NOERROR)
	{
	  /* enable menu */
	  sp_on=1;
	}
    }
  
  TTS_gr = TextToSpeechStartLang("gr");
  if ( TTS_gr & TTS_LANG_ERROR ) {
    if (TTS_gr == TTS_NOT_SUPPORTED)
      fprintf(stderr,"DECtalk ML not found.\n");
    else if (TTS_gr == TTS_NOT_AVAILABLE){
      TTS_gr=0;
      fprintf(stderr,"German is not currently installed.\n");
    }
    else
      fprintf(stderr,"Unknown error whilst attempting to start German.\n");
  }
  else // success
    {
      TextToSpeechSelectLang(NULL,TTS_gr);
      mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_gr]), devNo,devOptions,
				      index_callback, indexParams );
      if (mmstatus==MMSYSERR_NOERROR)
	{
	  gr_on=1;
	  /* enable menu */
	}
    }

  TTS_la = TextToSpeechStartLang("la");
  if ( TTS_la & TTS_LANG_ERROR ) {
    if (TTS_la == TTS_NOT_SUPPORTED)
      fprintf(stderr,"DECtalk ML not found.\n");
    else if (TTS_la == TTS_NOT_AVAILABLE){
      TTS_la=0;
      fprintf(stderr,"Latin American Spanish is not currently installed.\n");
    }
    else
      fprintf(stderr,"Unknown error whilst attempting to start Latin American Spanish.\n");
  }
  else // success
    {
      TextToSpeechSelectLang(NULL,TTS_la);
      mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_la]), devNo,devOptions,
				      index_callback, indexParams );
      if (mmstatus==MMSYSERR_NOERROR)
	{
	  la_on=1;
	  /* enable menu */
	}
    }
  TTS_fr = TextToSpeechStartLang("fr");
  if ( TTS_fr & TTS_LANG_ERROR ) {
    if (TTS_fr == TTS_NOT_SUPPORTED)
      fprintf(stderr,"DECtalk ML not found.\n");
    else if (TTS_fr == TTS_NOT_AVAILABLE){
      TTS_fr=0;
      fprintf(stderr,"German is not currently installed.\n");
    }
    else
      fprintf(stderr,"Unknown error whilst attempting to start French.\n");
  }
  else // success
    {
      TextToSpeechSelectLang(NULL,TTS_fr);
      mmstatus = TextToSpeechStartup( &(ttsHandle[TTS_fr]), devNo,devOptions,
				      index_callback, indexParams );
      if (mmstatus==MMSYSERR_NOERROR)
	{
	  fr_on=1;
	  /* enable menu */
	}
    }

  }

  if(!us_on && !sp_on && !gr_on && !la_on && !uk_on && !fr_on)
    {
      fprintf(stderr,"Something made a booboo!\nSnootchie Bootchies.\n");    
      exit(-1);
    }
  
#ifdef S_DEBUG
  printf("US: langnum=%u handle=0x%d\n",TTS_us,(int)ttsHandle[(int)TTS_us]);
  printf("UK: langnum=%u handle=0x%d\n",TTS_uk,(int)ttsHandle[(int)TTS_uk]);
  printf("SP: langnum=%u handle=0x%d\n",TTS_sp,(int)ttsHandle[(int)TTS_sp]);
  printf("GR: langnum=%u handle=0x%d\n",TTS_gr,(int)ttsHandle[(int)TTS_gr]);
  printf("LA: langnum=%u handle=0x%d\n",TTS_la,(int)ttsHandle[(int)TTS_la]);
  printf("FR: langnum=%u handle=0x%d\n",TTS_fr,(int)ttsHandle[(int)TTS_fr]);
  printf("current_language = %d\n",current_language);
#endif

  /*****************************************************/
  /* Specify GIF image for DECtalk to be used when     */
  /* iconified.                                        */
  /*****************************************************/
  
  //  if (getenv("LOCAL_BITMAP"))
  // sprintf(partialPath, "bitmaps/");
  //else
  //  sprintf(partialPath, "/usr/include/X11/bitmaps/dtk/"); 
  
  // sprintf(gifFilePath, "%s%s", partialPath, "dtk.gif" );
  //gifIcon =  InternalGifGet(XtDisplay(topshell), gifFilePath);
  
  //XtSetArg (  arglist [0], XmNiconPixmap, gifIcon );
  //XtSetValues ( topshell, arglist, 1 );

  //  gtk_widget_hide(window);
  //gtk_widget_destroy(button);
  gtk_container_border_width (GTK_CONTAINER (window), 0);
  gtk_signal_connect(GTK_OBJECT (window), "delete_event",
		     (GtkSignalFunc)FileQuitCallback, NULL);
#ifdef S_DEBUG
  fprintf(stderr,"window is: %s\n",(char *)window);
  fprintf(stderr,"address of window is: 0x%d\n",(int)&window);
#endif

  /* A vbox to put everything in: */
  main_vbox = gtk_vbox_new(FALSE, 0);
  gtk_container_border_width(GTK_CONTAINER(main_vbox), 1);
  gtk_container_add(GTK_CONTAINER(window), main_vbox);
    gtk_widget_show(main_vbox); 

  get_main_menu(window, &menubar);
  gtk_box_pack_start(GTK_BOX(main_vbox), menubar, FALSE, FALSE, 0);
   gtk_widget_show(menubar);
   
  button_box = gtk_hbox_new(FALSE,0);
  gtk_box_pack_start(GTK_BOX(main_vbox), button_box, FALSE, FALSE, 0);
    gtk_widget_show(button_box); 
  
  /* now for the pixmap face buttons */
  //the window has to be drawn first
  // perhaps so GTK knows where the colormap and display is?
  // however this makes an intermittant small window :-(
  // if we put the show(window) at the end we get a slew of 
  // run time warnings :-(
  // deal with the warnings for now... putting at the end of main.
  // check into creating a `fake window` then freeing it just for this?
  // we should also have a flash screen since it takes so damn long
  // to start all the langs...
  //gtk_widget_show(window);

#ifndef DEMO
  config_file=fopen("/etc/DECtalk.conf","r");
  if (config_file==NULL)
  {
    fprintf(stderr,"cannot open config file /etc/DECtlk.conf\n");
    memset(bitmap_path,0,500);
  }
  else
  {
    while (fgets(bitmap_name,499,config_file)!=NULL)
    {
      if (strncmp(bitmap_name,"Speak_xpm_dir:",14)==0)
      {
        bitmap_name[strlen(bitmap_name)-1]='\0';
        strcpy(bitmap_path,bitmap_name+14);
        break;
      }
    }
    fclose(config_file);
  }
#else 
  strcpy(bitmap_path, "./");
#endif
  

  sprintf(bitmap_name,"%s%s",bitmap_path,"pau16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
			      GTK_SIGNAL_FUNC (SelectSpeaker), 
			     (gpointer)PAUL);
  
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  gtk_widget_show(button);
  
  sprintf(bitmap_name,"%s%s",bitmap_path,"bet16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
    gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)BETTY);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
   gtk_widget_show(button);

  sprintf(bitmap_name,"%s%s",bitmap_path,"har16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)HARRY);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  gtk_widget_show(button);

  sprintf(bitmap_name,"%s%s",bitmap_path,"fra16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)FRANK);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  gtk_widget_show(button);
  
  sprintf(bitmap_name,"%s%s",bitmap_path,"den16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)DENNIS);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
   gtk_widget_show(button);

  sprintf(bitmap_name,"%s%s",bitmap_path,"kid16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)KIT);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
   gtk_widget_show(button);

  sprintf(bitmap_name,"%s%s",bitmap_path,"urs16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)URSULA);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  gtk_widget_show(button);

  sprintf(bitmap_name,"%s%s",bitmap_path,"rit16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)RITA);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
    gtk_widget_show(button);

  sprintf(bitmap_name,"%s%s",bitmap_path,"wen16a.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );
  gtk_widget_show( (GtkWidget *)pixmapwid );
  button = gtk_button_new();
  gtk_container_add( GTK_CONTAINER(button), pixmapwid );
  gtk_signal_connect(GTK_OBJECT(button), "clicked",
  			    GTK_SIGNAL_FUNC (SelectSpeaker), 
  			    (gpointer)WENDY);
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
    gtk_widget_show(button);

  /* hbox to put the text_entry and vscrollbar in */
  text_box = gtk_hbox_new(FALSE,0);
  gtk_box_pack_start(GTK_BOX(main_vbox), text_box, TRUE, TRUE, 0);
   gtk_widget_show(text_box); 
  
  text_entry = gtk_text_new(NULL,NULL);
  gtk_text_set_editable (GTK_TEXT(text_entry), TRUE);
  gtk_text_set_word_wrap(GTK_TEXT(text_entry), TRUE);
  gtk_box_pack_start(GTK_BOX(text_box), text_entry, TRUE, TRUE, 0);
  gtk_widget_show(text_entry);
  modified_id = gtk_signal_connect(GTK_OBJECT(text_entry),"changed", 
				   GTK_SIGNAL_FUNC(TextWidgetModified),text_entry);
  
  vscrollbar = gtk_vscrollbar_new(GTK_TEXT(text_entry)->vadj);
  gtk_box_pack_end(GTK_BOX(text_box), vscrollbar, FALSE, FALSE, 0);
    gtk_widget_show (vscrollbar);
  
  button_box = gtk_hbox_new(FALSE,0);
  gtk_container_border_width(GTK_CONTAINER(button_box), 5);
  gtk_box_pack_start(GTK_BOX(main_vbox), button_box, FALSE, FALSE, 3);
   gtk_widget_show(button_box); 

  button = gtk_label_new ("Speaking Rate ");
  gtk_box_pack_start(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  // gtk_widget_show(button);
  
  rate_adjustment = gtk_adjustment_new( 200,75,600,1,5,0);
  rate_scale = gtk_hscale_new( GTK_ADJUSTMENT(rate_adjustment) );
  gtk_scale_set_digits(GTK_SCALE(rate_scale),0);
  gtk_scale_set_value_pos(GTK_SCALE(rate_scale),GTK_POS_RIGHT);
  //gtk_scale_set_draw_value(
  gtk_box_pack_start(GTK_BOX(button_box), rate_scale, FALSE, FALSE, 0);
   gtk_widget_show(rate_scale);

  wpm_label = gtk_label_new (" WPM");
  gtk_box_pack_start(GTK_BOX(button_box), wpm_label, FALSE, FALSE, 0);
   gtk_widget_show(wpm_label);
  gtk_signal_connect(GTK_OBJECT(rate_adjustment),"value_changed",
		     GTK_SIGNAL_FUNC(RateScaleModified),NULL);
  
  /* Create a button to which to attach menu as a popup */
  button = gtk_button_new_with_label("Play");
  //  gtk_misc_set_alignment (GTK_MISC(button), 0, 0);
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC (StartPlay), 
			    NULL);
  gtk_box_pack_end(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  gtk_widget_show(button);

#if 0
#ifndef DEMO
  button = gtk_toggle_button_new_with_label("Pause");
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC (PausePlay), 
			    GTK_OBJECT(button));
  gtk_box_pack_end(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  gtk_widget_show(button);
#endif
#endif

  button = gtk_button_new_with_label("Stop");
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC (StopPlay), 
			    GTK_OBJECT(button));
  gtk_box_pack_end(GTK_BOX(button_box), button, FALSE, FALSE, 0);
  gtk_widget_show(button);
  
  /* always display the window as the last step so it all splashes on
   * the screen at once. */

  //gtk_widget_destroy(splash);
  //gtk_widget_hide(splash);
  //  gtk_widget_show_all(window);
  //  g_free(splash);
#ifdef DEMO
  DemoFileOpen();
  StartPlay(NULL, NULL);
  
  // FileOpenCallback();
#endif
  gtk_main ();
  
  return 0;
}

/***************************************************************************
 **
 **  PlaySome 
 ************************************************************************* **/
int PlaySome()
{
  unsigned int identifier; 
  unsigned int items_in_pipe;
  long dwFlags;
 
  /* wait until input buffer is empty before sending the next line */
  identifier = INPUT_CHARACTER_COUNT;
  TextToSpeechGetStatus( ttsHandle[current_language], &identifier,
			 &items_in_pipe, 1 );
  
  if ( (items_in_pipe == 0) && (playStatus == PLAY) )      
    {     /* find number of bytes to next new-line or end of file */
      playBuffer = (char *) malloc ( (sizeof(char) * FileLen) + 1 );
      if ( (playBuffer == NULL) || (sfile == NULL) )
	{
	  return(FALSE);
	}
      
      strncpy( playBuffer, &sfile[FilePos], FileLen);
      playBuffer[FileLen] = '\0';
      
#ifdef S_DEBUG
      fprintf(stderr,"speaking in: Lang=%d\n handle=0x%d\n",
	      (int)current_language,(int)ttsHandle[current_language]);
#endif
      /* play the text                */
      dwFlags = TTS_FORCE;
      TextToSpeechSpeak( ttsHandle[current_language], playBuffer, dwFlags );
      playStatus = STOP;
      
      gtk_text_set_editable (GTK_TEXT(text_entry), TRUE);
    }
  else /* if items_in_pipe != 0 */
    {
      /*
       * free buffer contents
       */
      if ( sfile != NULL )
	{
	  g_free(sfile);
	  sfile = NULL;
	}
      if ( playBuffer != NULL )
	free( playBuffer );
      gtk_text_set_editable (GTK_TEXT(text_entry), TRUE);
    }      
  return(FALSE);
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
static int StartPlay(GtkWidget *widget, gpointer data)
{
  switch( playStatus )
    {
    case PLAY:
    case PAUSE:
      break;
      
    case STOP:
      /* get buffer contents       */
      sfile = gtk_editable_get_chars((GtkEditable *)text_entry,0,-1);
      /* get size of buffer        */
      FileLen = strlen( sfile );
      /* set starting and ending positions */
      FilePos = 0;
      /* set current speaker/rate  */
      TextToSpeechSetSpeaker( ttsHandle[current_language], CurrentSpeaker );
      TextToSpeechSetRate ( ttsHandle[current_language], SpeakingRate );
      /* disable the user interface */
      gtk_text_set_editable (GTK_TEXT(text_entry), FALSE);
      /* set status                 */
      playStatus = PLAY;
      /* Play the file              */
      PlaySome();
      break;
    }
  return 0;
}

/* This is just to demonstrate how callbacks work when using the
 * menufactory.  Often, people put all the callbacks from the menus
 * in a separate file, and then have them call the appropriate functions
 * from there.  Keeps it more organized. */
static void FileQuitCallback (GtkWidget *widget, gpointer data)
{     
  gtk_exit(0);
  ShutdownDectalk();
}

/****************************************************************************
**
**  PausePlay 
**
**  FUNCTIONAL DESCRIPTION:
**
**    This routine is a callback for the pause button among others;
**    it calls the TextToSpeechPause API to pause the playback.
**
**  FORMAL PARAMETERS:
**
**    None
**
**  RETURN VALUE
**
**     Changes the global playStatus.
**
***************************************************************************/
static int PausePlay(GtkWidget *w, gpointer data)
{
  MMRESULT mmstatus;
  /* 
   * Get state of button
   */
  if (GTK_TOGGLE_BUTTON (w)->active){ /* button is down */
    if ( playStatus != PAUSE )
      {
	/*  pause DECtalk             */
	mmstatus = TextToSpeechPause( ttsHandle[current_language] );
	
	fprintf(stderr, "Paused!!\n");
	fprintf(stderr, "mmstatus:[%d], NOERROR:[%d]\n", mmstatus, MMSYSERR_NOERROR);
	
	if(mmstatus != MMSYSERR_NOERROR)
	  fprintf(stderr, "Error on pausing!\n");
	if(mmstatus == MMSYSERR_INVALHANDLE)
	  fprintf(stderr, "Invalid handle when pausing!\n");
	else fprintf(stderr, "mmstatus: %d\n", mmstatus);

	fprintf(stderr, "NOERROR: %d\n", MMSYSERR_NOERROR);
	fprintf(stderr, "INVALHAND: %d\n", MMSYSERR_INVALHANDLE);
	
	
	/* set status                 */
	lastStatus = playStatus;
	playStatus = PAUSE;
      }
  }
  else { /* button comes up */
    /* resume DECtalk             */
    mmstatus = TextToSpeechResume( ttsHandle[current_language] );
    fprintf(stderr, "Unpaused!\n");
    fprintf(stderr, "mmstatus:[%d], NOERROR:[%d]\n", mmstatus, MMSYSERR_NOERROR);
	
    if(mmstatus != MMSYSERR_NOERROR)
      fprintf(stderr, "Error on pausing!\n");
    if(mmstatus == MMSYSERR_INVALHANDLE)
      fprintf(stderr, "Invalid handle when pausing!\n");
    else fprintf(stderr, "mmstatus: %d\n", mmstatus);
    
    fprintf(stderr, "NOERROR: %d\n", MMSYSERR_NOERROR);
    fprintf(stderr, "INVALHAND: %d\n", MMSYSERR_INVALHANDLE);
    
    /* set status                 */
    playStatus = lastStatus;
    /* add work procedure         */
    if ( playStatus == PLAY ) {
      PlaySome();
    }
  }
  return 0;
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
void StopPlay(GtkWidget *widget, gpointer data)
{
    switch( playStatus )
    {
    case PLAY:
      /* stop DECtalk               */
      TextToSpeechReset( ttsHandle[current_language], TRUE );
      //      TextToSpeechSetSpeaker();
      // TextToSpeechSetRate();
      
      /*  free buffer contents      */
      if ( sfile != NULL ) {
	g_free( sfile );
	sfile = NULL;
      }
      if ( playBuffer != NULL )
	free( playBuffer );
      
      /* enable the user interface  */
      gtk_text_set_editable (GTK_TEXT(text_entry), TRUE);
      
      /* set status                 */
      playStatus = STOP;
      break;
      
    case PAUSE:
      break;
      
    case STOP:
      /* stop DECtalk               */
      TextToSpeechReset ( ttsHandle[current_language], TRUE );
      //      TextToSpeechSetSpeaker();
      // TextToSpeechSetRate();
      gtk_text_set_editable (GTK_TEXT(text_entry), TRUE);
      break;
    }
}

void LangMenuSelect(GtkWidget *widget, gpointer data)
{
  switch((int)data)
    {
    case menu_english:
#ifdef S_DEBUG
      fprintf(stderr,"switching to lang: %i\n",(int)TTS_us);
#endif    
      if(us_on)
	current_language=TTS_us;
      break;
    case menu_british:
#ifdef S_DEBUG
      fprintf(stderr,"switching to lang: %i\n",(int)TTS_uk);
#endif 
      if(uk_on)
      current_language=TTS_uk;
      break;
    case menu_spanish:
#ifdef S_DEBUG
      fprintf(stderr,"switching to lang: %i\n",(int)TTS_sp);
#endif 
      if(sp_on)
      current_language=TTS_sp;
      break;
    case menu_german:
#ifdef S_DEBUG
      fprintf(stderr,"switching to lang: %i\n",(int)TTS_gr);
#endif 
      if(gr_on)
      current_language=TTS_gr;
      break;
    case menu_latin_american:
#ifdef S_DEBUG
      fprintf(stderr,"switching to lang: %i\n",(int)TTS_la);
#endif 
      if(la_on)
      current_language=TTS_la;
      break;
    case menu_french:
#ifdef S_DEBUG
      fprintf(stderr,"switching to lang: %i\n",(int)TTS_fr);
#endif 
      if(fr_on)
      current_language=TTS_fr;
      break;
    }
}

/****************************************************************************
**
**  SelectSpeaker 
**
**  FUNCTIONAL DESCRIPTION:
**
**    Callback routine called when speaker is changed.  It calls the
**    TextToSpeechSetSpeaker API call to change the speaker.
**
**  FORMAL PARAMETERS:
**
**    w - Calling widget id.
**    data - Callback parameter
**    
**
**  RETURN VALUE
**
**    None
**
****************************************************************************/
void SelectSpeaker(GtkWidget *w, gpointer data)
{
    CurrentSpeaker = (int)data;
    TextToSpeechSetSpeaker( ttsHandle[current_language], CurrentSpeaker );
#ifdef S_DEBUG
    fprintf(stderr,"Switching to speaker: %d\nName: %s\n",(int)data,
	    speaker_names[current_language][CurrentSpeaker].name);
    fprintf(stderr,"Lang=%d\n handle=0x%d\n",
	    (int)current_language,(int)ttsHandle[current_language]);
#endif
    TextToSpeechSpeak( ttsHandle[current_language], speaker_names[current_language][CurrentSpeaker].name, TTS_FORCE );
			   
}

/*******************************************************************************
**
**  FileSaveWaveCallback
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

void FileSaveWaveCallback(GtkWidget *w, gpointer data)
{   
  GtkWidget *filew;
  
  /* Create a new file selection widget */
  filew = gtk_file_selection_new ("Convert to Wave File");
  gtk_signal_connect_object (GTK_OBJECT (filew), "destroy",
		      (GtkSignalFunc) gtk_widget_destroy, GTK_OBJECT (filew));           
  /* Connect the ok_button to file_ok_sel function */
  gtk_signal_connect(GTK_OBJECT (GTK_FILE_SELECTION (filew)->ok_button),
		     "clicked", (GtkSignalFunc) FileSaveWaveOkCallback, filew );
  /* Connect the cancel_button to destroy the widget */
  gtk_signal_connect_object(GTK_OBJECT(GTK_FILE_SELECTION(filew)->cancel_button),
			    "clicked", (GtkSignalFunc) gtk_widget_destroy,
			    GTK_OBJECT (filew));
  gtk_widget_show(filew);

  outputWaveFormat = (int)data;
}

void FileSaveWaveOkCallback(GtkWidget *w, gpointer fs)
{
  char *sText = NULL;
  int   sLength = 0;
  long  dwFlags = TTS_FORCE;
  DWORD dwDevOptions;
  MMRESULT mmStatus;
  char buf[4096];
  int FilePos = 0;
  int nbytes = 0;
  
  char WaveFileName[PATH_MAX];
  gchar *temp;
  
  temp = gtk_file_selection_get_filename(GTK_FILE_SELECTION (fs));
  strncpy(WaveFileName,temp,PATH_MAX);
  gtk_widget_destroy((GtkWidget *)fs);

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

   mmStatus = TextToSpeechOpenWaveOutFile( ttsHandle[current_language],
					   WaveFileName, dwDevOptions);

   if ( mmStatus != MMSYSERR_NOERROR )
     {
       ERROR("Warning: Could not open Waveout File!");
       if(mmStatus == MMSYSERR_INVALHANDLE)
	 fprintf(stderr, "invalhandle\n");
       if(mmStatus == MMSYSERR_NOMEM)
	 fprintf(stderr, "nomem\n");
       if(mmStatus == MMSYSERR_INVALPARAM)
	 fprintf(stderr, "invalparam\n");
       if(mmStatus == MMSYSERR_ERROR)
	 fprintf(stderr, "error\n");
       if(mmStatus == MMSYSERR_ALLOCATED)
	 fprintf(stderr, "allocated\n");
       return;    
     }
   
   // get the text in the window...
   sText = gtk_editable_get_chars((GtkEditable *)text_entry,0,-1);
   sLength = strlen( sText );
   
   while ( FilePos < sLength )
   {
      strncpy( buf, &sText[FilePos], 4000);
      nbytes = strlen( buf );
      mmStatus = TextToSpeechSpeak( ttsHandle[current_language], buf,
				    dwFlags );
      FilePos += nbytes;

      if ( mmStatus != MMSYSERR_NOERROR )
	{
	  ERROR("Warning: Problem converting text to wave file!");
	  return;
	} 
   }
   mmStatus = TextToSpeechCloseWaveOutFile( ttsHandle[current_language] );
   free( sText );

  if(mmStatus != MMSYSERR_NOERROR)
    ERROR("Warning: Wave File was not created properly.");
  return;
}

/*******************************************************************************
**
**  FileOpenCallback
**
**  FUNCTIONAL DESCRIPTION:
**    Callback from File/Open menu selection
**    Reads in a specified file name into the text window.
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void FileOpenCallback(GtkWidget *w, gpointer data)
{   
  GtkWidget *filew;
  
  /* Create a new file selection widget */
  filew = gtk_file_selection_new ("Open File...");
  gtk_signal_connect_object (GTK_OBJECT (filew), "destroy",
		      (GtkSignalFunc) gtk_widget_destroy, GTK_OBJECT (filew));           
  /* Connect the ok_button to file_ok_sel function */
  gtk_signal_connect(GTK_OBJECT (GTK_FILE_SELECTION (filew)->ok_button),
		     "clicked", (GtkSignalFunc) FileOpenOkCallback, filew );
  /* Connect the cancel_button to destroy the widget */
  gtk_signal_connect_object(GTK_OBJECT(GTK_FILE_SELECTION(filew)->cancel_button),
			    "clicked", (GtkSignalFunc) gtk_widget_destroy,
			    GTK_OBJECT (filew));
  gtk_widget_show(filew);
}

#ifdef DEMO
void DemoFileOpen()
{
  FILE *fp;
  struct stat buf;
  char *text;

#ifdef ENGLISH_US
  strcpy(OpenFileName, "demo.en");
#endif
#ifdef ENGLISH_UK
  strcpy(OpenFileName, "demo.uk");
#endif
#ifdef SPANISH
  strcpy(OpenFileName, "demo.sp");
#endif
#ifdef SPANISH_LA
  strcpy(OpenFileName, "demo.la");
#endif
#ifdef GERMAN
  strcpy(OpenFileName, "demo.gr");
#endif

#ifdef S_DEBUG
  fprintf(stderr,"OpenFileName = %s\n",OpenFileName);
#endif
  
  if ( (fp = fopen(OpenFileName, "r")) == NULL )
    {
      fprintf(stderr,"Could not open file: %s\n",OpenFileName);
      return;
    }
  
  (void)stat(OpenFileName,&buf);
  FileLen = buf.st_size;
  FilePos = 0;
  
  text = malloc( FileLen + 1 );
  if ( fread( text, 1, FileLen, fp ) != FileLen )
    {
      fprintf(stderr,"Could not read file.\n");
      free( text );
      fclose( fp );
      return;
    }
  text[FileLen] = '\0';
  
  /*********************************/
  /* place in text widget          */
  /*********************************/
  if ( text_entry != NULL ) 
    {
      gtk_text_freeze (GTK_TEXT (text_entry));
      gtk_text_set_point(GTK_TEXT (text_entry), 0);
      gtk_text_insert(GTK_TEXT(text_entry), NULL, NULL, NULL, text, -1);
      gtk_text_thaw (GTK_TEXT (text_entry));
    }
  
  gtk_window_set_title(GTK_WINDOW (window), "GSpeak Demonstration");
  
  /*********************************/
  /* clean up                      */
  /*********************************/
  fclose( fp );
  free( text );  
}
#endif //DEMO

void FileNewCallback(GtkWidget *w, gpointer data)
{
  guint length = 0;
  
  if(textModified)
      FileSaveAsCallback(w,NULL);
  
  /*
   * Set the global variable newFile so that
   * the valuechanged callback, TextWidgetModified(),
   * does not set the textModified flag.
   */
  textModified = FALSE;
  newFile = TRUE;
  gtk_signal_disconnect_by_func (GTK_OBJECT(text_entry),
				 GTK_SIGNAL_FUNC(TextWidgetModified),
				 text_entry);
  //gtk_signal_disconnect( GTK_OBJECT(text_entry),modified_id);
  modified_id = gtk_signal_connect(GTK_OBJECT(text_entry),"changed", 
				   GTK_SIGNAL_FUNC(TextWidgetModified),text_entry);
  
  /* delete what's in the text_entry */
  if ( text_entry != NULL ) 
    {
      gtk_text_freeze (GTK_TEXT (text_entry));
      gtk_text_set_point(GTK_TEXT (text_entry), 0);
      length = gtk_text_get_length(GTK_TEXT(text_entry));
      gtk_text_forward_delete(GTK_TEXT(text_entry), length);
      gtk_text_thaw (GTK_TEXT (text_entry));
    }
  
  /* change name of window here... */
  gtk_window_set_title(GTK_WINDOW (window), "GSpeak");
  
}

void FileOpenOkCallback(GtkWidget *w, gpointer fs)
{
  FILE *fp;
  struct stat buf;
  char *text;
  gchar *temp;

  FileNewCallback(w,NULL);
  
  temp = gtk_file_selection_get_filename(GTK_FILE_SELECTION (fs));
  strncpy(OpenFileName,temp,PATH_MAX);
#ifdef S_DEBUG
  fprintf(stderr,"OpenFileName = %s\n",OpenFileName);
#endif
  gtk_widget_destroy((GtkWidget *)fs);
  
  if ( (fp = fopen(OpenFileName, "r")) == NULL )
    {
      fprintf(stderr,"Could not open file: %s\n",OpenFileName);
      return;
    }
  
  (void)stat(OpenFileName,&buf);
  FileLen = buf.st_size;
  FilePos = 0;
  
  text = malloc( FileLen + 1 );
  if ( fread( text, 1, FileLen, fp ) != FileLen )
    {
      fprintf(stderr,"Could not read file.\n");
      free( text );
      fclose( fp );
      return;
    }
  text[FileLen] = '\0';
  
  /*********************************/
  /* place in text widget          */
  /*********************************/
  if ( text_entry != NULL ) 
    {
      gtk_text_freeze (GTK_TEXT (text_entry));
      gtk_text_set_point(GTK_TEXT (text_entry), 0);
      gtk_text_insert(GTK_TEXT(text_entry), NULL, NULL, NULL, text, -1);
      gtk_text_thaw (GTK_TEXT (text_entry));
    }
  
  /* change name of window here... */
  sprintf(text,"GSpeak %s", strip_filename((char *)OpenFileName));
  gtk_window_set_title(GTK_WINDOW (window), text);
  
  /*********************************/
  /* clean up                      */
  /*********************************/
  fclose( fp );
  free( text );    
}

void FileSaveAsCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *filew;
  
  /* Create a new file selection widget */
  filew = gtk_file_selection_new ("Save File As...");
  gtk_signal_connect_object (GTK_OBJECT (filew), "destroy",
		      (GtkSignalFunc) gtk_widget_destroy, GTK_OBJECT (filew));           
  /* Connect the ok_button to file_ok_sel function */
  gtk_signal_connect(GTK_OBJECT (GTK_FILE_SELECTION (filew)->ok_button),
		     "clicked", (GtkSignalFunc) FileSaveAsOkCallback, filew );
  /* Connect the cancel_button to destroy the widget */
  gtk_signal_connect_object(GTK_OBJECT(GTK_FILE_SELECTION(filew)->cancel_button),
			    "clicked", (GtkSignalFunc) gtk_widget_destroy,
			    GTK_OBJECT (filew));
  gtk_widget_show(filew);
}

void FileSaveAsOkCallback(GtkWidget *w, gpointer fs)
{
  gchar *temp;

  temp = gtk_file_selection_get_filename(GTK_FILE_SELECTION (fs));
  strncpy(SaveFileName,temp,PATH_MAX);
#ifdef S_DEBUG
  fprintf(stderr,"SaveFileName = %s\n",SaveFileName);
#endif
  gtk_widget_destroy((GtkWidget *)fs);
  
  /* change name of window here... */
  sprintf(temp,"GSpeak %s", strip_filename((char *)SaveFileName));
  gtk_window_set_title(GTK_WINDOW (window), temp);
  
  FileSaveCallback(NULL,NULL);
}

void FileSaveCallback(GtkWidget *w, gpointer data)
{
  FILE *fp;
  char *text = NULL;
  guint length = 0;
  
  // get the text in the window...
  text = gtk_editable_get_chars((GtkEditable *)text_entry,0,-1);
  length = (guint)strlen( text );
  
  if(( fp = fopen(SaveFileName, "w")) == NULL )
    {
      return;
    }
  if ( length > 0 )
    {
      fwrite( text, sizeof( char ), length, fp );
    }
  
  /* Reset textModified flag */
  textModified = FALSE;
  //modified_id = gtk_signal_connect(GTK_OBJECT(text_entry),"key_press_event",
  //				   GTK_SIGNAL_FUNC (TextWidgetModified),NULL);
  
  fclose( fp ); 
  free( text );
  return;
}

void TextWidgetModified(GtkWidget *widget, GdkEvent *event, gpointer callback_data)
{
  gtk_signal_disconnect_by_func (GTK_OBJECT(text_entry),
				 GTK_SIGNAL_FUNC(TextWidgetModified),
				 text_entry);
  //  gtk_signal_disconnect( GTK_OBJECT(text_entry),modified_id);
  if ( ! newFile )
    {
      textModified = TRUE;
      newFile = FALSE;
    }
}
void RateScaleModified(GtkAdjustment *adj)
{
  SpeakingRate = (int)adj->value;
}

/* Strips away the leading path... Should maybe be optional? */
char *strip_filename(gchar *string)
{
  int i, j;
  char *new_string;
  
  if (string[0] != '/')
    {
#ifdef S_DEBUG
      g_print("%s\n", string);       
#endif
      return string;
    }
  
  for (i=strlen(string)-1; i>=0; i--)
    {
      
      if (string[i] == '/')
	break;
    }
  if (i > 0)
    i++;
  new_string = g_malloc0((strlen(string)-i)+1);
  for (j=0; j<=(strlen(string)-i)-1; j++)
    new_string[j] = string[i+j];
  
  return new_string;
}





void HelpAboutCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *about_window = NULL;
  GtkWidget *about_label = NULL;
  GtkWidget *about_vbox = NULL;
  GtkWidget *about_vbox_spacer = NULL;
  GtkWidget *spacerwid = NULL;
  GtkWidget *about_hbox = NULL;
  GtkWidget *about_button = NULL;
  GtkWidget *pixmapwid = NULL;
  GdkPixmap *pixmap = NULL;
  GdkBitmap *mask = NULL;
  GtkWidget *about_button_box = NULL;
  GtkStyle *style;
  char bitmap_name[500];
  char bitmap_path[500];
  FILE *config_file;
  
  long version;
  char *DECtalk_version;
  char *about_string = malloc(256);
  int dt_maj;
  int dt_min;
  int dll_maj;
  int dll_min;
  
  version = TextToSpeechVersion(&DECtalk_version);
  dt_maj = (version & 0x7F000000) >> 24;
  dt_min = (version & 0x00FF0000) >> 16;
  dll_maj = (version & 0x0000FF00) >> 8;
  dll_min = (version & 0x000000FF);
  
#ifndef DEMO
  sprintf(about_string, "GSpeak\nVersion 1.0\nSpeaking Text Editor\nCopyright(c) Force Computing Inc.\nAll Rights Reserved\nDECtalk version %d.%02d (build %d%02d)\nDECtalk %s\n", dt_maj, dt_min, dll_maj, dll_min, DECtalk_version);
#else
  sprintf(about_string, "GSpeak Demo\nVersion 1.0\nSpeaking Text Editor\nCopyright(c) Force Computing Inc.\nAll Rights Reserved\nDECtalk version %d.%02d (build %d%02d)\nDECtalk %s\n", dt_maj, dt_min, dll_maj, dll_min, DECtalk_version);
#endif
  
  style = gtk_widget_get_style(window);

  config_file=fopen("/etc/DECtalk.conf","r");
  if (config_file==NULL)
  {
    fprintf(stderr,"cannot open config file /etc/DECtlk.conf\n");
    memset(bitmap_path,0,500);
  }
  else
  {
    while (fgets(bitmap_name,499,config_file)!=NULL)
    {
      if (strncmp(bitmap_name,"Speak_xpm_dir:",14)==0)
      {
        bitmap_name[strlen(bitmap_name)-1]='\0';
        strcpy(bitmap_path,bitmap_name+14);
        break;
      }
    }
    fclose(config_file);
  }
  sprintf(bitmap_name,"%s%s",bitmap_path,"dtk.xpm");
  pixmap = gdk_pixmap_create_from_xpm( window->window, &mask,
				       &style->bg[GTK_STATE_NORMAL],
				       bitmap_name );
  /* a pixmap widget to contain the pixmap */
  pixmapwid = (GtkWidget *)gtk_pixmap_new( pixmap, mask );

  about_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_widget_set_usize(about_window, 285, 255);
#ifndef DEMO
  gtk_window_set_title(GTK_WINDOW (about_window), "About GSpeak");
#else
  gtk_window_set_title(GTK_WINDOW (about_window), "About GSpeak Demo");
#endif
  gtk_window_set_policy(GTK_WINDOW(about_window), 0, 0, 0);
  gtk_window_set_modal(GTK_WINDOW(about_window), TRUE);
  
  about_vbox = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(about_window), about_vbox);

  about_hbox = gtk_hbox_new(FALSE, 0);
  gtk_box_pack_start(GTK_BOX(about_vbox), about_hbox, TRUE, TRUE, 0);

  about_vbox_spacer = gtk_vbox_new(TRUE, 5);
  gtk_box_pack_start(GTK_BOX(about_hbox), about_vbox_spacer, FALSE, FALSE, 5);
  
  gtk_box_pack_start(GTK_BOX(about_vbox_spacer), pixmapwid, FALSE, FALSE, 10);
  
  spacerwid = gtk_hbox_new(TRUE, 0);
  gtk_box_pack_end(GTK_BOX(about_vbox_spacer), spacerwid, FALSE, FALSE, 0);
  
  about_label = gtk_label_new(about_string);
  gtk_label_set_justify(GTK_LABEL(about_label), GTK_JUSTIFY_LEFT);
  gtk_box_pack_start(GTK_BOX(about_hbox), about_label, TRUE,TRUE, 0);

  about_button_box = gtk_hbutton_box_new();
  gtk_box_pack_end(GTK_BOX(about_vbox), about_button_box, FALSE, FALSE, 20);
 
  about_button = gtk_button_new_with_label("Ok");  
  gtk_signal_connect_object(GTK_OBJECT(about_button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(about_window));
  gtk_box_pack_end(GTK_BOX(about_button_box), about_button, FALSE, FALSE, 0);
  gtk_widget_show_all(about_window);
}

void HelpHelpCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *help_window = NULL;
  GtkWidget *help_vbox = NULL;
  GtkWidget *help_button_box = NULL;
  GtkWidget *help_button = NULL;
  GtkWidget *help_label = NULL;
  
  help_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_widget_set_usize(help_window, 300, 250);
#ifndef DEMO
  gtk_window_set_title(GTK_WINDOW(help_window), "DECtalk Software Help");
#else
  gtk_window_set_title(GTK_WINDOW(help_window), "DECtalk Demo Software Help");
#endif
  gtk_window_set_policy(GTK_WINDOW(help_window), 0, 0, 0);

  help_vbox = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(help_window), help_vbox);

  help_label = gtk_label_new("\nGSpeak help\n\n  Point your web browser to:\n\n   file:///usr/local/doc/DECtalk/html/DECtalk.html\n\n  Or if you use Netscape, click below.\n");
  gtk_box_pack_start(GTK_BOX(help_vbox), help_label, FALSE, FALSE, 0);
  gtk_label_set_justify(GTK_LABEL(help_label), GTK_JUSTIFY_LEFT);

  help_button_box = gtk_vbutton_box_new();
  gtk_box_pack_end(GTK_BOX(help_vbox), help_button_box, FALSE, FALSE, 20);
 
  help_button = gtk_button_new_with_label("Netscape users click here.");
  gtk_signal_connect_object(GTK_OBJECT(help_button), "clicked",
			    GTK_SIGNAL_FUNC(HelpOpenNetscape), 
			    GTK_OBJECT(help_window) );
  gtk_box_pack_start(GTK_BOX(help_button_box), help_button, FALSE, FALSE, 0);
 
  help_button = gtk_button_new_with_label("Cancel");  
  gtk_signal_connect_object(GTK_OBJECT(help_button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(help_window));
  gtk_box_pack_end(GTK_BOX(help_button_box), help_button, FALSE, FALSE, 0);
  gtk_widget_show_all(help_window);
}


void HelpOpenNetscape()
{
  system("netscape file:///usr/local/doc/DECtalk/html/DECtalk.html &");
}

void NotAvailableCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *na_window = NULL;
  GtkWidget *na_hbutton_box = NULL;
  GtkWidget *na_button_ok = NULL;

  na_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_widget_set_usize(na_window, 185, 80);
  gtk_window_set_policy(GTK_WINDOW(na_window), 0, 0, 0);
  gtk_window_set_title(GTK_WINDOW(na_window), "Feature Not Available");
  gtk_window_set_modal(GTK_WINDOW(na_window), TRUE);
  gtk_widget_show(na_window);

  na_hbutton_box = gtk_hbutton_box_new();
  gtk_container_add(GTK_CONTAINER(na_window), na_hbutton_box);
  gtk_widget_show(na_hbutton_box);

#ifdef DEMO

#if (defined ENGLISH) || (defined ENGLISH_UK)
  na_button_ok = gtk_button_new_with_label("This feature is not available\nin the demo version\nof GSpeak.\n\nClick here to continue.");
#endif
#if (defined SPANISH) || (defined SPANISH_LA)
  na_button_ok = gtk_button_new_with_label("Este Menu no se puede\nusar en demo.");
#endif
#ifdef GERMAN // Don't know the german!
  na_button_ok = gtk_button_new_with_label("This feature is not available\nin this version of GSpeak.\n\nClick here to continue.");
#endif
#else // DEMO
  na_button_ok = gtk_button_new_with_label("This feature is not available\nin this version of GSpeak.\n\nClick here to continue.");
#endif // DEMO
  
#ifdef DEMO

#ifdef ENGLISH
  TextToSpeechSpeak(ttsHandle[current_language], "This feature is not available!", TTS_FORCE);
#endif
#if (defined SPANISH) || (defined SPANISH_LA)
  TextToSpeechSpeak(ttsHandle[current_language], "Este Menu no se puede usar en demo.", TTS_FORCE);
#endif

#else // DEMO
  TextToSpeechSpeak(ttsHandle[current_language], "This feature is not available!", TTS_FORCE);
#endif // DEMO
  gtk_box_pack_start(GTK_BOX(na_hbutton_box), na_button_ok, FALSE, FALSE, 0);
  gtk_signal_connect_object(GTK_OBJECT(na_button_ok), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(na_window));
  gtk_widget_show(na_button_ok);
  
}

void EditCopyCallback(GtkWidget *w, gpointer data)
{
  gtk_editable_copy_clipboard(GTK_EDITABLE(text_entry));
}

void EditPasteCallback(GtkWidget *w, gpointer data)
{
  gtk_editable_paste_clipboard(GTK_EDITABLE(text_entry));
}

void EditCutCallback(GtkWidget *w, gpointer data)
{
  gtk_editable_cut_clipboard(GTK_EDITABLE(text_entry));
}

void UnloadUserDictCallback(GtkWidget *w, gpointer data)
{
  if(bDictionaryLoaded)
    {
      TextToSpeechUnloadUserDictionary(ttsHandle[current_language]);
      bDictionaryLoaded = FALSE;
    }
}


void LoadUserDictCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *filew;
  
  /* Create a new file selection widget */
  filew = gtk_file_selection_new ("Load User Dictionary");
  gtk_signal_connect_object (GTK_OBJECT (filew), "destroy",
			     (GtkSignalFunc) gtk_widget_destroy, GTK_OBJECT (filew));           
  /* Connect the ok_button to file_ok_sel function */
  gtk_signal_connect(GTK_OBJECT (GTK_FILE_SELECTION (filew)->ok_button),
		     "clicked", (GtkSignalFunc) LoadUserDictOkCallback, filew );
  /* Connect the cancel_button to destroy the widget */
  gtk_signal_connect_object(GTK_OBJECT(GTK_FILE_SELECTION(filew)->cancel_button),
			    "clicked", (GtkSignalFunc) gtk_widget_destroy,
			    GTK_OBJECT (filew));
  gtk_widget_show(filew);
}

void LoadUserDictOkCallback(GtkWidget *w, gpointer fs)
{
  FILE *fp;
  char UserDicName[PATH_MAX];
  char *extension = NULL;
  MMRESULT  mmstatus;
  gchar *temp;
  
  temp = gtk_file_selection_get_filename(GTK_FILE_SELECTION (fs));
  strncpy(UserDicName,temp,PATH_MAX);
  gtk_widget_destroy((GtkWidget *)fs);
  
  extension = strrchr(UserDicName, '.');
  fprintf(stderr, "UserDicName: %s\n", UserDicName);
  
  if(extension == NULL || strcmp(extension, ".dic"))
    {
      ERROR("Not a dictionary file. Must have .dic extension.");
      return;    
    }

  if ( (fp = fopen(UserDicName, "r")) == NULL )
    {
      fprintf(stderr,"Could not open file: %s\n",UserDicName);
      return;
    }

  /*********************************************/
  /* Unload a dictionary if one already exists */
  /*********************************************/
  if( bDictionaryLoaded )

    TextToSpeechUnloadUserDictionary( ttsHandle[current_language] );  
  
  /*********************************************/
  /* Now load the new dictionary file          */
  /*********************************************/
  mmstatus = TextToSpeechLoadUserDictionary( ttsHandle[current_language], UserDicName);
  if(mmstatus == MMSYSERR_NOERROR)
    {
      bDictionaryLoaded = TRUE;
      return;
    }
  else
    ERROR("Warning: User Dictionary did not load properly.");
  
  if(mmstatus == MMSYSERR_INVALHANDLE)
    fprintf(stderr, "invalhandle\n");
  if(mmstatus == MMSYSERR_NOMEM)
    fprintf(stderr, "nomem\n");
  if(mmstatus == MMSYSERR_INVALPARAM)
    fprintf(stderr, "invalparam\n");
  if(mmstatus == MMSYSERR_ERROR)
    fprintf(stderr, "error\n");
}

void ERROR(char *error_message)
{
  GtkWidget *err_dialog;
  GtkWidget *err_button;
  GtkWidget *err_hbutton_box;
  GtkWidget *err_label;
 
  err_dialog = gtk_dialog_new();
  err_label = gtk_label_new(error_message);
  
  gtk_widget_set_usize(GTK_WIDGET(err_dialog), 500, 120);
  gtk_window_set_policy(GTK_WINDOW(err_dialog), 0, 0, 0);
  gtk_window_set_modal(GTK_WINDOW(err_dialog), TRUE);
  gtk_window_set_title(GTK_WINDOW(err_dialog), "Error!");
  

  err_button = gtk_button_new_with_label("Ok");
  err_hbutton_box = gtk_hbutton_box_new();
  gtk_box_pack_start(GTK_BOX(err_hbutton_box), err_button, FALSE, FALSE, 0);

  gtk_signal_connect_object(GTK_OBJECT(err_button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(err_dialog));
  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(err_dialog)->action_area), err_hbutton_box);
  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(err_dialog)->vbox), err_label);
  
  gtk_widget_show_all(err_dialog);
}

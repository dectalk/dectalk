//#define DEBUG_ME
/**********************************************************************/
/*                                                                    */
/*	Copyright © 2000 Force Computers, Inc., a Solectron Company. All rights reserved. */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Force Computers Incorporated. Possession, use,     */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Force or an authorized          */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Force Computers Incorporated may not be used to      */
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
/*  PROGRAM:
*      windic.c 
*
*  ABSTRACT:
*     
*
*  ENVIRONMENT:
*
*     OSF/1 AXP
*
*  AUTHOR:
*     Nathan LeStage
*
*  CREATION DATE:
*     February 17, 2000
*
*************************************************************************
*  MODIFICATION HISTORY:
* 001  NAL  05/26/00	Changed message "Nothing to translate" to "Nothing is highlighted"
* 002  MGS  10/05/2000 	Redhat 6.2 and linux warning removal
* 003  CAB	10/16/00	Changed copyright info
*
*
*
*************************************************************************/
//#include <sys/limits.h>
//#include <mme/mmsystem.h>
#include <fcntl.h>

#include <stdio.h>
#include <stdlib.h>

#include <dtk/ttsapi.h>
#include <gtk/gtk.h>
#include <strings.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>   


#define NUM_LANGS           6

#define menu_english        0
#define menu_british        1
#define menu_spanish        2
#define menu_german         3
#define menu_latin_american 4
#define menu_french         5

#define compile_dic         0
#define save_tab            1

static LPTTS_HANDLE_T ttsHandle[NUM_LANGS]; /* DECtalk handle */

/* Function Prototypes */
void ShutdownDectalk(void);
void MakeGUI(void);
void TextWidgetModified(GtkWidget *, GdkEvent *, gpointer);
void Error(char*, int);
void CheckFileExtension(int, char *);
void SaveMsg(void);
char *strip_filename(gchar *);



/*Callback Prototypes*/
void FileNewCallback(GtkWidget *, gpointer);
void FileOpenCallback(GtkWidget *, gpointer);
void FileOpenOkCallback(GtkWidget *, gpointer);
void FileCloseCallback(GtkWidget *, gpointer);
void FileCompileDictionaryCallback(GtkWidget *, gpointer);
void DontSaveCallback(GtkWidget *, gpointer);
void FileSaveCallback(GtkWidget *, gpointer);
void FileSaveAsCallback(GtkWidget *, gpointer);
void FileSaveAsOkCallback(GtkWidget *, gpointer);
static void FileQuitCallback(GtkWidget *, gpointer);
void EditCopyCallback(GtkWidget *, gpointer);
void EditPasteCallback(GtkWidget *, gpointer);
void EditCutCallback(GtkWidget *, gpointer);
void TranslateCallback(GtkWidget *, gpointer);
void LangMenuSelect(GtkWidget *, gpointer);
void HelpHelpCallback(GtkWidget *, gpointer);
void HelpAboutCallback(GtkWidget *, gpointer);
void NotAvailableCallback(GtkWidget *, gpointer);
void HelpOpenNetscape();


void PronounceCallback();
void SpeakCurrentLine();
int ParseLine(char*);
void PreviousCallback();
void NextCallback();

static GtkItemFactoryEntry menu_items[] =
{
  {"/_File", NULL, NULL, 0, "<Branch>"},
  {"/File/_New", NULL, FileNewCallback, 0, NULL},
  {"/File/_Open...", NULL, FileOpenCallback, 0, NULL},
  {"/File/Close", NULL, FileNewCallback, 0, NULL},
  {"/File/sep", NULL, NULL, 0, "<Separator>"},
  {"/File/Compile _Dictionary", "<control>D", FileCompileDictionaryCallback, 0, NULL},
  {"/File/sep", NULL, NULL, 0, "<Separator>"},
  {"/File/_Save", "<control>S", FileSaveCallback, 0, NULL},
  {"/File/Save as...", NULL, FileSaveAsCallback, 0, NULL},
  {"/File/_Quit", "<control>Q", FileQuitCallback, 0, NULL},
  {"/Edit/", NULL, NULL, 0, "<Branch>"},
  //  {"/Edit/Undo", "<control>Z", NotAvailableCallback, 0, NULL},
  {"/Edit/Cu_t", "<control>X", EditCutCallback, 0, NULL},
  {"/Edit/_Copy", "<control>C", EditCopyCallback, 0, NULL},
  {"/Edit/_Paste", "<control>V", EditPasteCallback, 0, NULL},
  {"/Edit/<separator>", NULL, NULL, 0, "<Separator>"},
  {"/Edit/_English", "<control>E", LangMenuSelect, menu_english, "<RadioItem>"},
  {"/Edit/S_panish", "<control>P", LangMenuSelect, menu_spanish, "<RadioItem>"},
  {"/Edit/_German", "<control>G", LangMenuSelect, menu_german, "<RadioItem>" },
  {"/Edit/_Latin American","<control>L", LangMenuSelect, menu_latin_american, "<CheckItem>"},
  {"/Edit/English _UK", "<control>U", LangMenuSelect, menu_british,  "<CheckItem>"},
  {"/Edit/_French", "<control>F", LangMenuSelect, menu_french, "<RadioItem>" },
  {"/_Translate", "<control>T", TranslateCallback, 0, NULL},
  {"/_Help/", NULL, NULL, 0, "<LastBranch>"},
  {"/Help/Help on DECtalk Windic", "F1", HelpHelpCallback, 0, NULL},
  {"/Help/_About Windic", "F2", HelpAboutCallback, 0, NULL},
};

/*******************************************************************************
**
**  get_main_menu
**
**  FUNCTIONAL DESCRIPTION:
**     Set up the main menu bar using the data from menu_items[] above.
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
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


GtkWidget *window =           NULL;
GtkWidget *main_vbox =        NULL;
GtkWidget *vscrollbar =       NULL;
GtkWidget *text_entry =       NULL;
GtkWidget *scrolled_win =     NULL;
GtkWidget *text_box =         NULL;
GtkWidget *menubar =          NULL;
GtkWidget *main_hbuttonbox =  NULL;
GtkWidget *button =           NULL;
GtkObject *adj =              NULL;


char CurrFileName[PATH_MAX] = "\0";
char DicFileName[PATH_MAX] =  "\0";

int current_language =        0;
int FileLen =                 0;

static int textModified =     FALSE;
static int newFile      =     FALSE;
static int quitting     =     FALSE;
gint modified_id;

//int us_on=0, sp_on=0, gr_on=0, la_on=0, uk_on=0;
unsigned int TTS_us = NUM_LANGS+1, us_on = 0;
unsigned int TTS_uk = NUM_LANGS+1, uk_on = 0;
unsigned int TTS_sp = NUM_LANGS+1, sp_on = 0;
unsigned int TTS_la = NUM_LANGS+1, la_on = 0;
unsigned int TTS_gr = NUM_LANGS+1, gr_on = 0;
unsigned int TTS_fr = NUM_LANGS+1, fr_on = 0;

int main(int argc, char *argv[])
{
  
  MMRESULT mmstatus;
  long devOptions = REPORT_OPEN_ERROR ;
  int devNo = WAVE_MAPPER;
  FILE *config_file;
  LANG_ENUM *dt_langs;
  
#define index_callback NULL
#define indexParams 0

  gtk_init(&argc, &argv); 

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
	current_language=3;
	mmstatus = TextToSpeechStartup( &(ttsHandle[current_language]), devNo,
					devOptions, index_callback, indexParams );
	if (mmstatus==MMSYSERR_NOERROR)
	  {
	    fr_on=1;
	    TTS_fr=3;
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
      fprintf(stderr,"French is not currently installed.\n");
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

#ifdef DEBUG_ME
  printf("US: langnum=%u handle=0x%d\n",TTS_us,(int)ttsHandle[(int)TTS_us]);
  printf("UK: langnum=%u handle=0x%d\n",TTS_uk,(int)ttsHandle[(int)TTS_uk]);
  printf("SP: langnum=%u handle=0x%d\n",TTS_sp,(int)ttsHandle[(int)TTS_sp]);
  printf("GR: langnum=%u handle=0x%d\n",TTS_gr,(int)ttsHandle[(int)TTS_gr]);
  printf("LA: langnum=%u handle=0x%d\n",TTS_la,(int)ttsHandle[(int)TTS_la]);
  printf("FR: langnum=%u handle=0x%d\n",TTS_fr,(int)ttsHandle[(int)TTS_fr]);
  printf("current_language = %d\n",current_language);
#endif
  
  MakeGUI();
  return(0);
}

/*******************************************************************************
**
**  MakeGUI
**
**  FUNCTIONAL DESCRIPTION:
**     Make the main GUI
**     After window is created, calls FileNewCallback to initialize textModified flag
**
**  FORMAL PARAMETERS:
**
********************************************************************************/ 
void MakeGUI(void)
{ 
  adj = gtk_adjustment_new(0.0, 0.0, 100.0, 0.1, 1.0, 1.0);

  window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title(GTK_WINDOW(window),"WINDIC");
  gtk_widget_set_usize(GTK_WIDGET(window), 370, 475);
  gtk_window_set_policy(GTK_WINDOW(window), 0, 0, 0);

  main_vbox = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(window), main_vbox);
  gtk_container_border_width(GTK_CONTAINER(main_vbox), 1);

  get_main_menu(window, &menubar);
  gtk_box_pack_start(GTK_BOX(main_vbox), menubar, FALSE, FALSE, 0);

  main_hbuttonbox = gtk_hbutton_box_new();
  gtk_container_border_width(GTK_CONTAINER(main_hbuttonbox), 2);
  gtk_box_pack_start(GTK_BOX(main_vbox), main_hbuttonbox, FALSE, FALSE, 0);
  gtk_button_box_set_child_size_default(120, 16);
 
  button = gtk_button_new_with_label("Pronounce");
  gtk_box_pack_start(GTK_BOX(main_hbuttonbox), button, FALSE, FALSE, 0);
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked", 
			    GTK_SIGNAL_FUNC(PronounceCallback),
			    GTK_OBJECT(window) );

  button = gtk_button_new_with_label("Previous Word");
  gtk_box_pack_start(GTK_BOX(main_hbuttonbox), button, FALSE, FALSE, 0);
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC(PreviousCallback),
			    GTK_OBJECT(window) );

  button = gtk_button_new_with_label("Next Word");
  gtk_box_pack_start(GTK_BOX(main_hbuttonbox), button, FALSE, FALSE, 0);
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC(NextCallback),
			    GTK_OBJECT(window) );

  text_box = gtk_hbox_new(FALSE, 0);
  gtk_box_pack_start(GTK_BOX(main_vbox), text_box, TRUE, TRUE, 0);

  text_entry = gtk_text_new(NULL, NULL);
  gtk_text_set_editable(GTK_TEXT(text_entry), TRUE);
  gtk_text_set_word_wrap(GTK_TEXT(text_entry), TRUE);
 
  gtk_box_pack_start(GTK_BOX(text_box), text_entry, TRUE, TRUE, 0);

  vscrollbar = gtk_vscrollbar_new(GTK_TEXT(text_entry)->vadj);
  gtk_box_pack_start(GTK_BOX(text_box), vscrollbar, FALSE, FALSE, 0);

#ifdef DEBUG_ME
  button = gtk_button_new_with_label("KILL IT");
  gtk_box_pack_end(GTK_BOX(main_vbox), button, FALSE, FALSE, 0);
  gtk_signal_connect_object(GTK_OBJECT(button), "clicked",
			    GTK_SIGNAL_FUNC(FileQuitCallback),
			    GTK_OBJECT(window));
#endif //DEBUG_ME
  gtk_widget_show_all(window);

  FileNewCallback(NULL, NULL);
  gtk_main();
  return;
}


/*******************************************************************************
**
**  LangMenuSelect
**
**  FUNCTIONAL DESCRIPTION:
**     Sets which language to speak in. 
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
void LangMenuSelect(GtkWidget *widget, gpointer data)
{
  switch((int)data)
    {
    case menu_english:
#ifdef DEBUG_ME
      fprintf(stderr,"switching to lang: %i, ENGLISH\n",(int)TTS_us);
#endif    
      if(us_on)
	current_language=TTS_us;
      break;
    case menu_british:
#ifdef DEBUG_ME
      fprintf(stderr,"switching to lang: %i, ENGLISH_UK\n",(int)TTS_uk);
#endif 
      if(uk_on)
      current_language=TTS_uk;
      break;
    case menu_spanish:
#ifdef DEBUG_ME
      fprintf(stderr,"switching to lang: %i, SPANISH\n",(int)TTS_sp);
#endif 
      if(sp_on)
      current_language=TTS_sp;
      break;
    case menu_german:
#ifdef DEBUG_ME
      fprintf(stderr,"switching to lang: %i, GERMAN\n",(int)TTS_gr);
#endif 
      if(gr_on)
      current_language=TTS_gr;
      //gtk_check_menu_item_set_active(menu_items[17], TRUE);
      break;
    case menu_latin_american:
#ifdef DEBUG_ME
      fprintf(stderr,"switching to lang: %i, SPANISH_LA\n",(int)TTS_la);
#endif 
      if(la_on)
      current_language=TTS_la;
      break;
    case menu_french:
#ifdef DEBUG_ME
      fprintf(stderr,"switching to lang: %i, FRENCH\n",(int)TTS_fr);
#endif 
      if(fr_on)
      current_language=TTS_fr;
      //gtk_check_menu_item_set_active(menu_items[21], TRUE);
    }
}

/*******************************************************************************
**
**  TranslateCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Translates selected text and replaces it with the phonemic translation. 
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
void TranslateCallback(GtkWidget *w, gpointer data)
{
  int start = 0;
  int end = 0;
  int temp = 0;
  char *sel_text;
  char newText[256];
  char phString[256];
  char text_buf[256];  
  int i;
  
  MMRESULT mmstatus;
  
  FILE *fp;
  char *logfile = "log.txt";  /* Default DECtalk logfile */
  
  /* Get the selected text */
  start = GTK_EDITABLE(text_entry)->selection_start_pos;
  end = GTK_EDITABLE(text_entry)->selection_end_pos;

  if(start == end)
    {
      TextToSpeechSpeak(ttsHandle[current_language], "Nothing is highlighted!", TTS_FORCE);
      return;
    }
  if(start > end)
    {
      temp = start;
      start = end;
      end = temp;
    }

  /* Reads the selected text in phonemic form to the dectalk log file.
     File contents are read and placed back into widget. */
  sel_text = gtk_editable_get_chars(GTK_EDITABLE(text_entry), start, end);
  sprintf(text_buf, "[:log phon on]%s[:log phon off]", sel_text);
  
  TextToSpeechSpeak(ttsHandle[current_language], text_buf, TTS_FORCE);
  TextToSpeechSync(ttsHandle[current_language]); 

  if ( (fp = fopen(logfile, "r")) == NULL )
    {
      fprintf(stderr,"Could not open file %s\n", logfile);
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
  unlink(logfile); /* Remove the log file */
  sprintf( newText, "[%s]", phString );

  gtk_text_freeze(GTK_TEXT(text_entry));
  gtk_text_set_point(GTK_TEXT(text_entry), start);
  gtk_text_forward_delete(GTK_TEXT(text_entry), end-start);
  gtk_text_insert(GTK_TEXT(text_entry), NULL, NULL, NULL, newText, -1);
  gtk_text_thaw(GTK_TEXT(text_entry));
  return;
}

/*******************************************************************************
**
**  PreviousCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Moves the cursor position to the prvious line of the text widget, then calls
**     SpeakCurrent Line to speak it.
**     Alerts the user if there are no more lines.
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
void PreviousCallback()
{
  int cur_pos;
  int back_pos;
  char *wordToPronounce;

  cur_pos = gtk_editable_get_position(GTK_EDITABLE(text_entry));
  while(1)
    {
      if(cur_pos > 0)
	{
	  back_pos = cur_pos - 1;
	  if(!strcmp("\n", gtk_editable_get_chars(GTK_EDITABLE(text_entry), back_pos, cur_pos)) )
	    {
	      gtk_editable_set_position(GTK_EDITABLE(text_entry), back_pos);
	      break;
	    }    
	  cur_pos--;
	}
      else
	{
	  TextToSpeechSpeak(ttsHandle[current_language], "No more words to speak", TTS_FORCE);
	  return;
	}
    }
  SpeakCurrentLine();
  return;  
}

/*******************************************************************************
**
**  NextCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Moves the cursor position to the next line of the text widget, then calls
**     SpeakCurrent Line to speak it.
**     Alerts the user if there are no more lines.
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
void NextCallback()
{
  int cur_pos;
  int next_pos;
  int length;
  char *wordToPronounce;
    
  cur_pos = gtk_editable_get_position(GTK_EDITABLE(text_entry));
  length = gtk_text_get_length(GTK_TEXT(text_entry));

  while(1)
    {
      if(cur_pos < length)
	{
	  next_pos = cur_pos + 1;
	  if(!strcmp("\n", gtk_editable_get_chars(GTK_EDITABLE(text_entry), cur_pos, next_pos)) )
	    {
	      gtk_editable_set_position(GTK_EDITABLE(text_entry), next_pos);
	      break;
	    }
	  cur_pos++;
	}  

     else
	{
	  TextToSpeechSpeak(ttsHandle[current_language], "No more words to speak", TTS_FORCE);
	  return;
	}
    }
  
  SpeakCurrentLine();
  return;  
}

/*******************************************************************************
**
**  PronounceCallback
**
**  FUNCTIONAL DESCRIPTION:
**     If text is selected, it speaks it all. If no selection is made, then the
**     line is spoken according to SpeakCurrentLine
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
void PronounceCallback()
{
  char *wordToPronounce;
  int start, end, temp;
  char text_buf[256];
  
  start = GTK_EDITABLE(text_entry)->selection_start_pos;
  end = GTK_EDITABLE(text_entry)->selection_end_pos; 

  if(start==end)
    SpeakCurrentLine();
  else
    {
      
      if(start > end)
	{
	  temp = start;
	  start = end;
	  end = temp;
	}

      sprintf(text_buf, "[:phon arpa on]%s[:phone arpa off]", 
	      gtk_editable_get_chars(GTK_EDITABLE(text_entry), start, end) );
      
      TextToSpeechSpeak(ttsHandle[current_language], text_buf, TTS_FORCE);
    }
}

/*******************************************************************************
**
**  SpeakCurrentLine
**
**  FUNCTIONAL DESCRIPTION:
**     Speaks text on same line as the cursor position. If there are phenomic strings
**     on the line, all that is spoken is the first phenomic string. (Uses ParseLine)
**     [:phon arpa on] proceeds all strings sent to DECtalk
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
void SpeakCurrentLine(void)
{
  int cur_pos;
  int back_pos;
  int next_pos;
  int length;
  int start = -1;
  int end = -1;  

  char *line_text;
  char text_buf[256];
  char *phonStr;
  
  
  
  cur_pos = gtk_editable_get_position(GTK_EDITABLE(text_entry));
  length = gtk_text_get_length(GTK_TEXT(text_entry));
  
  while(start == -1)
    { 
      if(cur_pos > 0)
	{
	  back_pos = cur_pos - 1;	  
	  if(!strcmp("\n", gtk_editable_get_chars(GTK_EDITABLE(text_entry), back_pos, cur_pos)))
	    {
	      start = cur_pos;
	    }
	  else
	    {
	      cur_pos--;
	    }
	}
      else
	start = cur_pos = 0;
    } 
  while(end==-1)
    {     
      if(cur_pos < length)
	{
	  next_pos = cur_pos + 1;
	  if(!strcmp("\n", gtk_editable_get_chars(GTK_EDITABLE(text_entry), cur_pos, next_pos)))
	    {
	      end = next_pos;
	    }
	  else
	    {
	      cur_pos++;
	    }
	}
      else
	end = length;
    }
  line_text =  gtk_editable_get_chars(GTK_EDITABLE(text_entry), start, end);
  ParseLine(line_text);
  sprintf(text_buf, "[:phon arpa on]%s[:phone arpa off]", line_text);
  
  TextToSpeechSpeak(ttsHandle[current_language],  text_buf, TTS_FORCE);
  
  return;
}

/****************************************************************************
**
**  ParseLine 
**
**  FUNCTIONAL DESCRIPTION:
**    Strips anything around the phoneme string if there is one present on the 
**    line.
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
int ParseLine(char *text)
{
  char *tmpText;
  char *end;
  
  tmpText = index(text, '[');
  
  if(tmpText != NULL)
    {
      end = index(text, ']');
      strcpy(end, "]");        // Replace this spot with a ] and a null terminator
      strcpy(text, tmpText);
    } 
}


/*******************************************************************************
**
**  SaveMsg
**
**  FUNCTIONAL DESCRIPTION:
**     Called if textModified flag is set and current text buffer is about to be reset
**     with NewFile or OpenFile or Quit.
**     Creates a small widget to ask for conformation to save, don't save, or cancel
**     request to leave the buffer.
**
**  FORMAL PARAMETERS:
**
********************************************************************************/ 
void SaveMsg()
{
  GtkWidget *sv_dialog = NULL;
  GtkWidget *sv_button = NULL;
  GtkWidget *sv_label = NULL;
  
  newFile = TRUE;
  
  sv_dialog = gtk_dialog_new();
  sv_label = gtk_label_new("File has changed. Save changes?");
  
  gtk_widget_set_usize(GTK_WIDGET(sv_dialog), 350, 100);
  gtk_window_set_policy(GTK_WINDOW(sv_dialog), 0, 0, 0);
  gtk_window_set_modal(GTK_WINDOW(sv_dialog), TRUE);
  gtk_window_set_position(GTK_WINDOW(sv_dialog), GTK_WIN_POS_MOUSE);
  
  sv_button = gtk_button_new_with_label("Save");
  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(sv_dialog)->action_area), sv_button);  
  gtk_signal_connect_object(GTK_OBJECT(sv_button), "clicked",
			    GTK_SIGNAL_FUNC(FileSaveCallback),
			    GTK_OBJECT(sv_dialog));
 gtk_signal_connect_object(GTK_OBJECT(sv_button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(sv_dialog));

  sv_button = gtk_button_new_with_label("Don't Save");
  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(sv_dialog)->action_area), sv_button);  
  gtk_signal_connect_object(GTK_OBJECT(sv_button), "clicked",
			    GTK_SIGNAL_FUNC(DontSaveCallback),
			    GTK_OBJECT(sv_dialog));
  gtk_signal_connect_object(GTK_OBJECT(sv_button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(sv_dialog));

  sv_button = gtk_button_new_with_label("Cancel");
  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(sv_dialog)->action_area), sv_button);  
  gtk_signal_connect_object(GTK_OBJECT(sv_button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(sv_dialog));

  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(sv_dialog)->vbox), sv_label);
  
  gtk_widget_show_all(sv_dialog);  
}

/*******************************************************************************
**
**  NotAvailableCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Creates small info box stating that chosen feature isn't available. 
**     Also speaks same message.
**
**  FORMAL PARAMETERS:
**
********************************************************************************/ 
void NotAvailableCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *na_dialog = NULL;
  GtkWidget *na_button = NULL;
  GtkWidget *na_label = NULL;

  na_dialog = gtk_dialog_new();
  na_label = gtk_label_new("This feature is not available\nin this version of Windic.");

  gtk_widget_set_usize(GTK_WIDGET(na_dialog), 200, 160);
  gtk_window_set_policy(GTK_WINDOW(na_dialog), 0, 0, 0);
  gtk_window_set_modal(GTK_WINDOW(na_dialog), TRUE);
  gtk_window_set_position(GTK_WINDOW(na_dialog), GTK_WIN_POS_MOUSE);
  

  TextToSpeechSpeak(ttsHandle[current_language], "This feature is not available!", TTS_FORCE);
  na_button = gtk_button_new_with_label("Ok");

  gtk_signal_connect_object(GTK_OBJECT(na_button), "clicked",
			    GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT(na_dialog));
  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(na_dialog)->action_area), na_button);
  gtk_container_add(GTK_CONTAINER(GTK_DIALOG(na_dialog)->vbox), na_label);
  
  gtk_widget_show_all(na_dialog);
  
}

/*******************************************************************************
**
**  Error
**
**  FUNCTIONAL DESCRIPTION:
**     Creates an error box with error_msg as the box text.
**     err can be used to change error box title to match specific error message
**
**  FORMAL PARAMETERS:
**     error_msg
**     err
**
********************************************************************************/ 
void Error(char *error_msg, int err)
{
  GtkWidget *err_dialog;
  GtkWidget *err_button;
  GtkWidget *err_hbutton_box;
  GtkWidget *err_label;

  char title_text[64];

  switch(err)
    {
    case 1:
      strcpy(title_text, "Syntax error!");
      break;

    case 2:
      strcpy(title_text, "Dictionary Compiled!");
      break;

    default:
      strcpy(title_text, "Error!");
    }
  
  err_dialog = gtk_dialog_new();
  err_label = gtk_label_new(error_msg);
  
  gtk_widget_set_usize(GTK_WIDGET(err_dialog), 500, 120);
  gtk_window_set_policy(GTK_WINDOW(err_dialog), 0, 0, 0);
  gtk_window_set_modal(GTK_WINDOW(err_dialog), TRUE);
  gtk_window_set_title(GTK_WINDOW(err_dialog), title_text);
  

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


/*******************************************************************************
**
**  HelpHelpCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Generates info to direct user to the location of the help files. Also provides
**     direct access to users running Netscape
**
**  FORMAL PARAMETERS:
**
********************************************************************************/ 
void HelpHelpCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *help_window = NULL;
  GtkWidget *help_vbox = NULL;
  GtkWidget *help_button_box = NULL;
  GtkWidget *help_button = NULL;
  GtkWidget *help_label = NULL;
  
  help_window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_widget_set_usize(help_window, 300, 250);
  gtk_window_set_title(GTK_WINDOW(help_window), "DECtalk Software Help");
  gtk_window_set_policy(GTK_WINDOW(help_window), 0, 0, 0);

  help_vbox = gtk_vbox_new(FALSE, 0);
  gtk_container_add(GTK_CONTAINER(help_window), help_vbox);

  help_label = gtk_label_new("\nWindic help\n\n  Point your web browser to:\n\n   file:///usr/local/doc/DECtalk/html/DECtalk.html\n\n  Or if you use Netscape, click below.\n");
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


/*******************************************************************************
**
**  HelpOpenNetscape
**
**  FUNCTIONAL DESCRIPTION:
**     Starts Netscape
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
void HelpOpenNetscape()
{
  system("netscape file:///usr/local/doc/DECtalk/html/DECtalk.html &");
}

/*******************************************************************************
**
**  HelpAboutNetscape
**
**  FUNCTIONAL DESCRIPTION:
**     Generates version info.
**
**  FORMAL PARAMETERS:
**
********************************************************************************/
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
  
  sprintf(about_string, "Windic\nVersion 1.0\nWindowed Dictionary Compiler\nCopyright(c) Force Computing Inc.\nAll Rights Reserved\nDECtalk version %d.%02d (build %d%02d)\nDECtalk %s\n", dt_maj, dt_min, dll_maj, dll_min, DECtalk_version);
  
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
  gtk_window_set_title(GTK_WINDOW (about_window), "About Windic");
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


/*******************************************************************************
**
**  FileQuitCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Shutsdown GTK processes and calls ShutdownDectalk  to properly shutdown Dectalk
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
static void FileQuitCallback (GtkWidget *widget, gpointer data)
{  
  if(textModified)
    {
      quitting = TRUE;
      SaveMsg();
      return;
    }
  else
    {
      gtk_exit(0);
      ShutdownDectalk();
    }
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
			     (GtkSignalFunc) gtk_widget_destroy, 
			     GTK_OBJECT (filew));
  /* Connect the ok_button to file_ok_sel function */
  gtk_signal_connect(GTK_OBJECT (GTK_FILE_SELECTION (filew)->ok_button),
		     "clicked", (GtkSignalFunc) FileOpenOkCallback, filew );
  /* Connect the cancel_button to destroy the widget */
  gtk_signal_connect_object(GTK_OBJECT(GTK_FILE_SELECTION(filew)->cancel_button),
			    "clicked", (GtkSignalFunc) gtk_widget_destroy,
			    GTK_OBJECT (filew));
  gtk_widget_show(filew);
}


/*******************************************************************************
**
**  FileOpenOkCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Calls NewFileCallback to clear widget and reset textModified flag
**     Opens file into text widget. 
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void FileOpenOkCallback(GtkWidget *w, gpointer fs)
{
  FILE *fp;
  struct stat buf;
  char text[256];
  gchar *temp;

  FileNewCallback(w,NULL);

  temp = gtk_file_selection_get_filename(GTK_FILE_SELECTION (fs));
  strncpy(CurrFileName,temp,PATH_MAX);
#ifdef DEBUG_ME
  fprintf(stderr,"CurrFileName = %s\n",CurrFileName);
#endif
  gtk_widget_destroy((GtkWidget *)fs);
  
  if ( (fp = fopen(CurrFileName, "r")) == NULL )
    {
      fprintf(stderr,"Could not open file: %s\n",CurrFileName);
      return;
    }
  
  (void)stat(CurrFileName,&buf);
  FileLen = buf.st_size;
 
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
  sprintf(text,"Windic %s", strip_filename((char *)CurrFileName));
  gtk_window_set_title(GTK_WINDOW (window), text);

  modified_id = gtk_signal_connect(GTK_OBJECT(text_entry),"changed", 
				   GTK_SIGNAL_FUNC(TextWidgetModified),text_entry);
  
  /*********************************/
  /* clean up                      */
  /*********************************/
  fclose( fp );
  text[0] = '\0';
}

/*******************************************************************************
**
**  FileNewCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Clears the text window of all text. 
**     If textModified flag is set, calls SaveMsg and then returns out of function
**     since SaveMsg only connects creates the window, but doesn't wait for a response.
**     Otherwise, if the user wants to cancel the buffer is already erased.
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void FileNewCallback(GtkWidget *w, gpointer data)
{
  guint length = 0;
  
  if(textModified)
    {
      SaveMsg();
      return;
    }

  textModified = FALSE;
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
  gtk_window_set_title(GTK_WINDOW (window), "Windic");
  strcpy(CurrFileName, "\0");
}

/*******************************************************************************
**
**  DontSaveCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Callback from SaveMsg. Simply resets textModified flag and continues back to 
**     FileNew or FileQuit
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void DontSaveCallback(GtkWidget *w, gpointer data)
{
  textModified = FALSE;
  if(quitting)
    {
      FileQuitCallback(NULL,NULL);
    }
  else
    {
      FileNewCallback(NULL, NULL);
    }
}


/*******************************************************************************
**
**  FileSaveCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Writes the text in the buffer into the file CurrFileName. If this hasn't
**     been set yet, hops to FileSaveAsCallback to get it.
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void FileSaveCallback(GtkWidget *w, gpointer data)
{

  FILE *fp = NULL;
  char *text = NULL;
  guint length;

  if(!strcmp(CurrFileName, "\0"))
    {
      FileSaveAsCallback(NULL, NULL);
      return;
    }
  
  text = gtk_editable_get_chars(GTK_EDITABLE(text_entry),0,-1);
  length = (guint)strlen( text );
  
  if(( fp = fopen(CurrFileName, "w")) == NULL )
    {
      return;
    }
  if ( length > 0 )
    {
      fwrite( text, sizeof( char ), length, fp );
    }

  modified_id = gtk_signal_connect(GTK_OBJECT(text_entry),"changed", 
				   GTK_SIGNAL_FUNC(TextWidgetModified),text_entry);


  textModified = FALSE;
  fclose( fp ); 
  free( text );
  
  /* If here because of a call to FileNewCallback, reset this flag and 
     continue on */
  if(newFile)
    {
      newFile = FALSE;
      FileNewCallback(NULL, NULL);
    }
  return;
}

/*******************************************************************************
**
**  FileSaveAsCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Creates a file selection widget and sets up signal connections to 
**     FileSaveAsOkCallback
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void FileSaveAsCallback(GtkWidget *w, gpointer data)
{
  GtkWidget *filew;

  /* Create a new file selection widget */
  filew = gtk_file_selection_new ("Save File As...");
  gtk_signal_connect_object (GTK_OBJECT (filew), "destroy",
			     GTK_SIGNAL_FUNC(gtk_widget_destroy), GTK_OBJECT (filew));           
    /* Connect the ok_button to file_ok_sel function */
  gtk_signal_connect(GTK_OBJECT (GTK_FILE_SELECTION (filew)->ok_button),
		     "clicked", GTK_SIGNAL_FUNC(FileSaveAsOkCallback), filew );
  /* Connect the cancel_button to destroy the widget */
  gtk_signal_connect_object(GTK_OBJECT(GTK_FILE_SELECTION(filew)->cancel_button),
			    "clicked", GTK_SIGNAL_FUNC(gtk_widget_destroy),
			    GTK_OBJECT (filew));
  gtk_widget_show(filew);
}
	
/*******************************************************************************
**
**  FileSaveAsOkCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Gets file name to write text to and sets it as CurrFileName
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void FileSaveAsOkCallback(GtkWidget *w, gpointer fs)
{ 
  gchar *temp;
  temp = gtk_file_selection_get_filename(GTK_FILE_SELECTION (fs));
  CheckFileExtension(save_tab, temp);
  strncpy(CurrFileName,temp,PATH_MAX);
#ifdef DEBUG_ME
  fprintf(stderr,"CurrFileName = %s\n",CurrFileName);
#endif
  gtk_widget_destroy((GtkWidget *)fs);
  
  /* change name of window here... */
  sprintf(temp,"Windic %s", strip_filename((char *)CurrFileName));
  gtk_window_set_title(GTK_WINDOW (window), temp);

  FileSaveCallback(NULL,NULL); 
  return;
}

/*******************************************************************************
**
**  TextWidgetModified
**
**  FUNCTIONAL DESCRIPTION:
**     Called when any change is made to the text widget. Sets textModified flag. 
**     Disconnects the signal catching after first time so function isn't needlessly
**     called repeatedly.
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void TextWidgetModified(GtkWidget *widget, GdkEvent *event, gpointer callback_data)
{
  gtk_signal_disconnect_by_func (GTK_OBJECT(text_entry),
				 GTK_SIGNAL_FUNC(TextWidgetModified),
				 text_entry);
  textModified = TRUE;
}


/*******************************************************************************
**
**  strip_filename
**
**  FUNCTIONAL DESCRIPTION:
**     Strips away the leading path... Should maybe be optional?
**
**  FORMAL PARAMETERS:
**     string
**
**  RETURN:
**     string
******************************************************************************/
char *strip_filename(gchar *string)
{
  int i, j;
  char *new_string;
  
  if (string[0] != '/')
    {
#ifdef DEBUG_ME
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

/*******************************************************************************
**
**  FileCompileDictionaryCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Sends text from text widget to compile_dictonary in compile_dict.c     
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
void FileCompileDictionaryCallback(GtkWidget *w, gpointer data)
{
  char errorString[512];
  char *text;
 
  if(!strcmp(CurrFileName, "\0"))
    {
      FileSaveCallback(NULL, NULL);
      Error("Error. File must be saved. Save file then recompile dictionary.", 1);
      return;      
    }
  
  strcpy(DicFileName, CurrFileName);
  CheckFileExtension(compile_dic, DicFileName);
  
  text = gtk_editable_get_chars(GTK_EDITABLE(text_entry), 0, -1);
  errorString[0] = '\0';
  compile_dictonary(DicFileName, text, errorString);
  if(strlen(errorString) )
     {
       Error(errorString, 1);
       fprintf(stderr, "%s\n", errorString); 
     }
  else
     {
       Error("Dictionary compiled", 2);
     }
}

/*******************************************************************************
**
**  CheckFileExtension
**
**  FUNCTIONAL DESCRIPTION:
**     Makes sure that filenames for the user word tables have .tab at end for
**     ease of recognition. Before sending text to compile_dictonary, replaces 
**     .tab with .dic for the user dictionary filename.
**        option specifies if saving a table or compiling dictionary
**
**  FORMAL PARAMETERS:
**     option
**     filename
**
******************************************************************************/
void CheckFileExtension(int option, char *filename)
{
  char *ext;
  
  ext = strrchr(filename, '.');
  switch(option)
    {
    case save_tab:
      {
	if(ext == NULL || strcmp(ext, ".tab"))
	  {	
	    strcat(filename, ".tab");
	  }
	break;
      }

    case compile_dic:
      {
	if(ext == NULL)
	  {
	    strcat(filename, ".dic");
	  }
	else
	  {
	    strcpy(ext, ".dic");
	  }
	break;
      }
    default:
      fprintf(stderr, "You shouldn't EVER be here!\n");
    }
}

/*******************************************************************************
**
**  EditCopyCallback
**  EditPasteCallback
**  EditCutCallback
**
**  FUNCTIONAL DESCRIPTION:
**     Copies, cuts, pastes  selection to or from common clipboard through gtk api    
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
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


/*******************************************************************************
**
**  ShutdownDectalk
**
**  FUNCTIONAL DESCRIPTION:
**     Properly closes down dectalk.   
**
**  FORMAL PARAMETERS:
**
******************************************************************************/
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



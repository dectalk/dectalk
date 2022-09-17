/* ***********************************************************************
 *
 *                           Copyright (c)
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    © Digital Equipment Corporation 1995, 1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *
 * **********************************************************************
 *    File Name:        APItest.c
 *    Author:           Jie Lee
 *						Christian Berrios
 *    Creation Date:    03/02/98
 *
 *    Functionality:	API Function Test
 *
 * **********************************************************************
 *    Revision History:
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *	001		CAB		02/22/2002	Changed to directory within ad\rnd\product
 *  002		CAB		04/08/2002	Added missing api calls
 * **********************************************************************
*/

#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <malloc.h>

#ifndef UNDER_CE
#include <io.h>
#include <fcntl.h>
#include <direct.h>		// Access to directory fn
#endif

//#include <mmsystem.h>	// Wav stuff

#ifdef UNDER_CE
#include "port.h"
//U32 TextToSpeechReserved3(LPTTS_HANDLE_T phTTS, int type, char *data, int max_size);
#endif

#include "ttsapi.h"
#include "ttsfeat.h"
#include "APItest.h"
#include "coop.h"
#include "dectalkf.h"

//typedef BOOL enum {FALSE TRUE}

// Prototypes
// Functions reserved for internal use
ULONG TextToSpeechReserved1(UCHAR *, unsigned _int8, int, int);
short  *TextToSpeechGetPhVdefParams(LPTTS_HANDLE_T, UINT);

//#define STRICT
#define NSAMPLES		 32767	// 2000
#define MAX_PHONEMES      128
#define MAX_INDEX_MARKS   128
#define MAX_STRING_LEN  32768
#define NAUDIO_BUFFERS      5
#define	MAX_STR_LEN		   256

/* CAB
#ifdef SILENT							  // Defined for a faster, quieter run
#define dwDeviceOptions	 DO_NOT_USE_AUDIO_DEVICE
#else
#define dwDeviceOptions  OWN_AUDIO_DEVICE
#define _OWN_AUDIO						  // TextToSpeechPause is only effective
#endif									  // when Audio is on
*/
#define _OWN_AUDIO						  // TextToSpeechPause is only effective
//#define  FASTRUN

/* ************** DtCallBackRoutine **************************************** */
unsigned int ErrorMsgId = 0, BufferMsgId = 0, BookmarkMsgId = 0, WordposMsgId = 0,
			 IndexMsgId = 0, StartMsgId = 0, StopMsgId = 0, VisualMsgId = 0, SentenceMsgId = 0;
int CallBackState = 0;		/* Prevents unnecessary Messages from the callback
							   from printing to the outfile */
/****************************************************************************/
#define INPUT_CMDLINE       0
#define INPUT_STDIN         1

#define OUTPUT_SOUND        0
#define OUTPUT_WAVE         1
#define OUTPUT_LOGTEXT      2
#define OUTPUT_LOGPHONEME   3
#define OUTPUT_LOGSYLLABLE  4

/****************************************************************************/
HANDLE	    hStdin;                       /* File handle for std. input  */
HANDLE      hStdout;                      /* File us_handle for std. output */
HANDLE      hStderr;                      /* File handle for std. error  */
int         inputMode = INPUT_STDIN;      /* Where does input come from  */
int         outputMode = OUTPUT_SOUND;    /* Where does output go to     */
char        *prefixText = NULL;           /* Text to speak before input  */
char        *postfixText = NULL;          /* Text to speak after input   */
char        *outFile = NULL;              /* Name of output file         */
char        *dictFile = NULL;             /* User dictionary to load     */
MMRESULT	mmStatus;					  /* Return code of Api Fn's	 */

LPTTS_HANDLE_T fakeHandlePtr = NULL;      /* Used for the error routine  */
LPTTS_HANDLE_T phTTS_mem = NULL;		  /* Standard Handle for Memory routine */

LPTTS_BUFFER_T pTTSbuffer[NAUDIO_BUFFERS];
int 		addit[NAUDIO_BUFFERS]={0,0,0,0,0};

/* *********** Language variables ******************************************* */
BOOL DoLang[DECTALK_LANG_COUNT+1] = {FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE};	/* Order US, UK, LA, SP, GR, FR, ML */
int LangIndex;

#define DECTALK_VOICE_COUNT (WENDY+1)
DWORD SpeakerVoices[DECTALK_VOICE_COUNT] = { PAUL, BETTY, HARRY, FRANK, DENNIS, KIT, URSULA, RITA, WENDY };

#ifdef UNDER_CE
wchar_t LangString[DECTALK_LANG_COUNT+1][MAX_STR_LEN] = { TEXT("us"), TEXT("uk"), TEXT("la"), TEXT("sp"), TEXT("gr"), TEXT("fr"), TEXT("ml") };
wchar_t LangTestString[DECTALK_LANG_COUNT][MAX_STR_LEN] = { TEXT("This is a demonstration of DECtalk Software text-to-speech technology."),
									  					 TEXT("This is a demonstration of DECtalk Software text-to-speech technology."),
														 TEXT("Esta es una demostración del software DECtalk de la tecnología de texto a conversación."),
														 TEXT("Esta es una demostración del software DECtalk de la tecnología de texto a conversación."),
									  					 TEXT("Dies ist eine Demonstration von Force Computers Sprachsynthese DECtalk.")
														 TEXT("Ceci est une démonstration du logiciel DECtalk de synthèse de parole à partir de texte.")
                                    				   };

wchar_t LangTestUserDictString[DECTALK_LANG_COUNT][MAX_STR_LEN] = { TEXT("dog"), TEXT("dog"), TEXT("perro"), TEXT("perro"), TEXT(""), TEXT("") };

wchar_t LangTestSpeaker[DECTALK_VOICE_COUNT*DECTALK_LANG_COUNT][MAX_STR_LEN] = { TEXT("Hello my name is Paul."), TEXT("Hello my name is Betty."), TEXT("Hello my name is Harry."),
																TEXT("Hello my name is Dennis."), TEXT("Hello my name is Frank"), TEXT("Hello my name is Kit."),
																TEXT("Hello my name is Ursula"), TEXT("Hello my name is Rita"), TEXT("Hello my name is Wendy"),

																TEXT("Hello my name is Paul."), TEXT("Hello my name is Betty."), TEXT("Hello my name is Harry."),
																TEXT("Hello my name is Dennis."), TEXT("Hello my name is Frank."), TEXT("Hello my name is Kit."),
																TEXT("Hello my name is Ursula."), TEXT("Hello my name is Rita."), TEXT("Hello my name is Wendy."),

																TEXT("Hola mi nombre es Pablo."), TEXT("Hola mi nombre es Berta."), TEXT("Hola mi nombre es Humberto."),
																TEXT("Hola mi nombre es Domingo."), TEXT("Hola mi nombre es Francisco."), TEXT("Hola mi nombre es Juanito."),
																TEXT("Hola mi nombre es Ursula."), TEXT("Hola mi nombre es Rita."), TEXT("Hola mi nombre es Wendy."),

																TEXT("Hola mi nombre es Pablo."), TEXT("Hola mi nombre es Berta."), TEXT("Hola mi nombre es Humberto."),
																TEXT("Hola mi nombre es Domingo."), TEXT("Hola mi nombre es Francisco."), TEXT("Hola mi nombre es Juanito."),
																TEXT("Hola mi nombre es Ursula."), TEXT("Hola mi nombre es Rita."), TEXT("Hola mi nombre es Wendy."),

																TEXT("Hallo, ich heisse Paul."), TEXT("Hallo, ich heisse Beate."), TEXT("Hallo, ich heisse Hans."),
																TEXT("Hallo, ich heisse Dieter"), TEXT("Hallo, ich heisse Karsten."), TEXT("Hallo, ich heisse Frank."),
																TEXT("Hallo, ich heisse Ursula."), TEXT("Hallo, ich heisse Rita."), TEXT("Hallo ich heisse Wendy."),
																
																TEXT("Bonjour, mon nom est Olivier."), TEXT("Bonjour, mon nom est Marjolaine."), TEXT("Bonjour, mon nom est Michel."),
																TEXT("Bonjour, mon nom est François."), TEXT("Bonjour, mon nom est Joël."), TEXT("Bonjour, mon nom est Sébastien."),
																TEXT("Bonjour, mon nom est Angèle."), TEXT("Bonjour, mon nom est Jacqueline."), TEXT("Bonjour, mon nom est Nadia.")
 															   };

#else
char LangString[DECTALK_LANG_COUNT+1][MAX_STR_LEN] = { "us", "uk", "la", "sp", "gr", "fr", "ml"};
char LangTestString[DECTALK_LANG_COUNT][MAX_STR_LEN] = { "This is a demonstration of DECtalk Software text-to-speech technology.",
									  					 "This is a demonstration of DECtalk Software text-to-speech technology.",
														 "Esta es una demostración del software DECtalk de la tecnología de texto a conversación.",
														 "Esta es una demostración del software DECtalk de la tecnología de texto a conversación.",
									  					 "Dies ist eine Demonstration von Force Computers Sprachsynthese DECtalk."
														 "Ceci est une démonstration du logiciel DECtalk de synthèse de parole à partir de texte."
                                    				   };

char LangTestUserDictString[DECTALK_LANG_COUNT][MAX_STR_LEN] = { "dog", "dog", "perro", "perro", "", "" };

char LangTestSpeaker[DECTALK_VOICE_COUNT*DECTALK_LANG_COUNT][MAX_STR_LEN] = { "Hello my name is Paul.", "Hello my name is Betty.", "Hello my name is Harry.",
																"Hello my name is Dennis.", "Hello my name is Frank", "Hello my name is Kit.",
																"Hello my name is Ursula", "Hello my name is Rita", "Hello my name is Wendy",

																"Hello my name is Paul.", "Hello my name is Betty.", "Hello my name is Harry.",
																"Hello my name is Dennis.", "Hello my name is Frank", "Hello my name is Kit.",
																"Hello my name is Ursula", "Hello my name is Rita", "Hello my name is Wendy",

																"Hola mi nombre es Pablo", "Hola mi nombre es Berta", "Hola mi nombre es Humberto",
																"Hola mi nombre es Domingo", "Hola mi nombre es Francisco", "Hola mi nombre es Juanito",
																"Hola mi nombre es Ursula", "Hola mi nombre es Rita", "Hola mi nombre es Wendy",

																"Hola mi nombre es Pablo", "Hola mi nombre es Berta", "Hola mi nombre es Humberto",
																"Hola mi nombre es Domingo", "Hola mi nombre es Francisco", "Hola mi nombre es Juanito",
																"Hola mi nombre es Ursula", "Hola mi nombre es Rita", "Hola mi nombre es Wendy",

																"Hallo, ich heisse Paul.", "Hallo, ich heisse Beate.", "Hallo, ich heisse Hans.",
																"Hallo, ich heisse Dieter", "Hallo, ich heisse Karsten.", "Hallo, ich heisse Frank."
																"Hallo, ich heisse Ursula.", "Hallo, ich heisse Rita.", "Hallo ich heisse Wendy.",
																
																"Bonjour, mon nom est Olivier", "Bonjour, mon nom est Marjolaine", "Bonjour, mon nom est Michel",
																"Bonjour, mon nom est François", "Bonjour, mon nom est Joël", "Bonjour, mon nom est Sébastien",
																"Bonjour, mon nom est Angèle", "Bonjour, mon nom est Jacqueline", "Bonjour, mon nom est Nadia"
 															   };
#endif
/****************************************************************************/
FILE * outfile_fp = NULL;

/* ******************* Audio variables ************************************ */
#define WAVFORMATCOUNT 3		// Number of different wave formats
DWORD dwFormat[WAVFORMATCOUNT]= {WAVE_FORMAT_1M08, WAVE_FORMAT_1M16, WAVE_FORMAT_08M08};
DWORD dwDeviceOptions[3] = {OWN_AUDIO_DEVICE, REPORT_OPEN_ERROR, DO_NOT_USE_AUDIO_DEVICE };
DWORD minRate, maxRate;	// Limits of speaking rate

//LANGUAGE_T pLanguage;
//char * language;
//SPEAKER_T Speaker = PAUL;

/********************** Directory info **************************************************/
TCHAR path[MAX_STR_LEN];	// Apitest directory path

int ErrorCount = 0;	// Error count

#ifdef BORLAND_C
#pragma argsused
#endif

#ifdef UNDER_CE
int wmain( int argc, wchar_t **argv )
#else
int main( int argc, char **argv )
#endif
{	int firstWordIndex;
	int MLState = FALSE;
	//BOOL CloseLangStatus;
	unsigned int i = 0;
	LPTTS_HANDLE_T phTTSTemp = NULL;
	TCHAR outputfile[MAX_STR_LEN];

    /* Set control handler and get stdio info */
	//    SetConsoleCtrlHandler( (PHANDLER_ROUTINE) CtrlHandler, TRUE );

#ifndef UNDER_CE
	hStderr = GetStdHandle( STD_ERROR_HANDLE );
    hStdin = GetStdHandle( STD_INPUT_HANDLE );
    hStdout = GetStdHandle( STD_OUTPUT_HANDLE );
#endif

	/* ***********************************************************************************
	     Register a callback message for DECtalk buffers
	   ***********************************************************************************
	*/
#ifdef UNDER_CE
	ErrorMsgId		= RegisterWindowMessage(TEXT("DECtalkErrorMessage"));
	IndexMsgId		= RegisterWindowMessage(TEXT("DECtalkIndexMessage"));
    BufferMsgId		= RegisterWindowMessage(TEXT("DECtalkBufferMessage"));
	BookmarkMsgId	= RegisterWindowMessage(TEXT("DECtalkBookmarkMessage"));
	WordposMsgId	= RegisterWindowMessage(TEXT("DECtalkWordposMessage"));
	StartMsgId		= RegisterWindowMessage(TEXT("DECtalkStartMessage"));
	StopMsgId		= RegisterWindowMessage(TEXT("DECtalkStopMessage"));
	VisualMsgId		= RegisterWindowMessage(TEXT("DECtalkVisualMessage"));
	SentenceMsgId	= RegisterWindowMessage(TEXT("DECtalkSentenceMessage"));
#else
	ErrorMsgId		= RegisterWindowMessage("DECtalkErrorMessage");
	IndexMsgId		= RegisterWindowMessage("DECtalkIndexMessage");
    BufferMsgId		= RegisterWindowMessage("DECtalkBufferMessage");
	BookmarkMsgId	= RegisterWindowMessage("DECtalkBookmarkMessage");
	WordposMsgId	= RegisterWindowMessage("DECtalkWordposMessage");
	StartMsgId		= RegisterWindowMessage("DECtalkStartMessage");
	StopMsgId		= RegisterWindowMessage("DECtalkStopMessage");
	VisualMsgId		= RegisterWindowMessage("DECtalkVisualMessage");
	SentenceMsgId	= RegisterWindowMessage("DECtalkSentenceMessage");
#endif

	/* Parse the command line for options. */
    firstWordIndex = ParseArgs( argc, argv );
    if ( firstWordIndex < 0 )
        return 1;

	/* Where the output file is located */ 
#ifdef UNDER_CE
	wsprintf(outputfile, TEXT("output.txt"),  path);
	outfile_fp = _wfopen(outputfile, TEXT("w"));
#else
	sprintf(outputfile, "%s\\output.txt", path);
	outfile_fp = fopen(outputfile, "w");
#endif
	if ( outfile_fp == NULL )
	{	
#ifndef UNDER_CE
		printf("File could not be open %s\n", outputfile);
#endif
		return 1;
	}
#ifndef UNDER_CE
	printf("APITester - Component of DTtester\n");
	printf("DECtalk Software API Tester v.1.0\n");
    printf("Copyright (c) Fonix Corporation 2002. All rights reserved.\n\n\n");
#endif

	// Test for MultiLang
	MLState = TestML();
	if ( (MLState != 1) && (MLState != -1))
	{	/* Test language but ML */
		for ( i = 0; (DoLang[i] == TRUE) && (i < DECTALK_LANG_COUNT); i++)
		{	LangIndex = i;
			TestLang(LangString[i], i, MLState, phTTSTemp);
		}
	}

#ifdef UNDER_CE
	printf("Test completed with %d errors.\n", ErrorCount);
#endif
	fprintf(outfile_fp, "Test completed with %d errors.\n", ErrorCount);
	fclose(outfile_fp);

#ifdef UNDER_CE	
	MessageBox(NULL, L"Test Complete", L"ApiTest", MB_OK );
#endif
    return 0;
}
//	if (!(DoLang[0] || DoLang[1] || DoLang[2] || DoLang[3] || DoLang[4]))
//		for (i = 0; i < 5; i++) DoLang[i] = TRUE;

/* ******************************************************************
 *      Function Name: ApiStatus()
 *
 *      Description: Returns the error code for the api call
 *
 *      Arguments:	MMRESULT	Error code
 *
 *      Return Value: MMRESULT	Error code
 *
 *      Comments:	This function is use to display the name of the error
 *					return by the TextToSpeech Api's functions
 *
 * *****************************************************************/
MMRESULT ApiStatus(MMRESULT mmStatus) 
{	switch (mmStatus)
	{	// Defined by windows in .\vc98\include\mmsystem.h
		case MMSYSERR_NOERROR:
			fprintf(outfile_fp, "Passed\n");
			return mmStatus;
		case MMSYSERR_ERROR:
			fprintf(outfile_fp, "MMSYSERR_ERROR\n");
			break;
		case MMSYSERR_BADDEVICEID:
			fprintf(outfile_fp, "MMSYSERR_BADDEVICEID\n");
			break;
		case MMSYSERR_NOTENABLED:
			fprintf(outfile_fp, "MMSYSERR_NOTENABLED\n");
			break;
		case MMSYSERR_ALLOCATED:
			fprintf(outfile_fp, "MMSYSERR_ALLOCATED\n");
			break;
		case MMSYSERR_INVALHANDLE:
			fprintf(outfile_fp, "MMSYSERR_INVALHANDLE\n");
			break;
		case MMSYSERR_NODRIVER:
			fprintf(outfile_fp, "MMSYSERR_NODRIVER\n");
			break;
		case MMSYSERR_NOMEM:
			fprintf(outfile_fp, "MMSYSERR_NOMEM\n");
			break;
		case MMSYSERR_NOTSUPPORTED:
			fprintf(outfile_fp, "MMSYSERR_NOTSUPPORTED\n");
			break;
		case MMSYSERR_BADERRNUM:
			fprintf(outfile_fp, "MMSYSERR_BADERRNUM\n");
			break;
		case MMSYSERR_INVALFLAG:
			fprintf(outfile_fp, "MMSYSERR_INVALFLAG\n");
			break;
		case MMSYSERR_INVALPARAM:
			fprintf(outfile_fp, "MMSYSERR_INVALPARAM\n");
			break;
		case MMSYSERR_HANDLEBUSY:
			fprintf(outfile_fp, "MMSYSERR_HANDLEBUSY\n");
			break;
		case MMSYSERR_INVALIDALIAS:
			fprintf(outfile_fp, "MMSYSERR_INVALIDALIAS\n");
			break;
		case MMSYSERR_LASTERROR:
			fprintf(outfile_fp, "MMSYSERR_LASTERROR\n");
			break;
		case WAVERR_BADFORMAT:
			fprintf(outfile_fp, "WAVERR_BADFORMAT\n");
			break;
		default :
			fprintf(outfile_fp, "Unspecified error\n");
	}
	++ErrorCount;
	return (mmStatus);
}

/* ******************************************************************
 *      Function Name: CheckApiCall()
 *
 *      Description: Checks for a valid Api fn call
 *
 *      Arguments:	TCHAR argv	Name of API
 *
 *      Return Value: int
 *
 *      Comments:
 *
 * *****************************************************************/
int CheckApiCall(TCHAR argv[])
{	int i;
#ifdef UNDER_CE
	TCHAR ApiFn[15][MAX_STR_LEN] = { TEXT("TestGetcaps"), TEXT("TestGetStatus"), TEXT("TestLang"), TEXT("TestLog"),
								     TEXT("TestMemory"), TEXT("TestML"), TEXT("TestPause"), TEXT("TestRate"),
								     TEXT("TestResume"), TEXT("TestSetSpeaker"), TEXT("TestTyping"),
								     TEXT("TestUserDictionary"), TEXT("TestVersion"), TEXT("TestVersionEx"),
								     TEXT("TestWav")
	                               };
#else
	TCHAR ApiFn[15][MAX_STR_LEN] = { "TestGetcaps", "TestGetStatus", "TestLang", "TestLog",
								     "TestMemory", "TestML", "TestPause", "TestRate",
								     "TestResume", "TestSetSpeaker", "TestTyping",
								     "TestUserDictionary", "TestVersion", "TestVersionEx",
								     "TestWav"
								   };
#endif

	for ( i = 0; i < 15; i++)
	{	
#ifdef UNDER_CE
		if ( wcscmp(argv, ApiFn[i]) == 0)
#else
		if ( strcmp(argv, ApiFn[i]) == 0)
#endif
			return 1;
	}

#ifndef UNDER_CE
	ErrorOut( "Invalid Api Test\n" );
	ErrorOut( "Example: TestGetcaps, TestGetStatus, TestLang, TestLog\n");
	ErrorOut( "         TestMemory, TestML, TestPause, TestResume\n");
	ErrorOut( "         TestRate, TestSetSpeaker, TestTyping\n");
	ErrorOut( "         TestUserDictionary, TestVersion, TestVersionEx\n");
	ErrorOut( "         TestWavHelp, TestWav\n");
#endif
	return 0;

}

/* ******************************************************************
 *      Function Name: DtCallBackRoutine()
 *
 *      Description: The CallBack routine
 *
 *      Arguments:	LONG lparam
 *					LONG Buffer
 *					DWORD userData
 *					UINT uiMsg
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
VOID DtCallBackRoutine(LONG lParam, LONG Buffer, DWORD userData, UINT uiMsg)
{	LPTTS_BUFFER_T OneLpSpeechBuffer = NULL;

	if (CallBackState == 1)
	{	// printf("%ld %ld %ld %li",lParam,Buffer,userData,uiMsg);
		/*
		if ((LPTTS_BUFFER_T)Buffer == pTTSbuffer[])
			printf("Callback Good");
		else
			printf("Callback Bad");
		*/

		fprintf(outfile_fp, "DtCallBackRoutine() \t\t\t\t...");
		if ( uiMsg == ErrorMsgId )
		{	fprintf(outfile_fp, "Error: p1=%d, p2=%d, p3=%d\n", lParam, Buffer, userData);
		}
		else if ( uiMsg == BufferMsgId )
		{	//fprintf(outfile_fp,"Passed.\n");
			// Requeue the buffer
			/// CAB Removed 
			OneLpSpeechBuffer = (LPTTS_BUFFER_T) Buffer;
			//mmStatus = ApiStatus(TextToSpeechAddBuffer(phTTS_mem, OneLpSpeechBuffer ));
			fprintf(outfile_fp, "(%ld samples) ", OneLpSpeechBuffer->dwBufferLength);
			fprintf(outfile_fp, "requeued. \n");

			if (Buffer == pTTSbuffer[0]) addit[0]=1;
			if (Buffer == pTTSbuffer[1]) addit[1]=1;
			if (Buffer == pTTSbuffer[2]) addit[2]=1;
			if (Buffer == pTTSbuffer[3]) addit[3]=1;
			if (Buffer == pTTSbuffer[4]) addit[4]=1;
		}
		else if ( (uiMsg == BookmarkMsgId) || (lParam == TTS_INDEX_BOOKMARK) )
		{
			fprintf(outfile_fp, "Bookmark Message received.\n");
		}
		else if ( (uiMsg == WordposMsgId) || (lParam == TTS_INDEX_WORDPOS) )
		{
			fprintf(outfile_fp, "Bookmark Message received.\n");
		}
		else if ( uiMsg == IndexMsgId || (lParam == TTS_INDEX_MARK) )
		{
			fprintf(outfile_fp, "Index.\n");
		}
		else if ( (uiMsg == StartMsgId) || (lParam == TTS_AUDIO_PLAY_START) )
		{
			fprintf(outfile_fp, "Start Message received\n");
		}
		else if ( (uiMsg == StopMsgId) || (lParam == TTS_AUDIO_PLAY_STOP) )
		{
			fprintf(outfile_fp, "Stop Message recieved\n");
		}
		else if ( (uiMsg == VisualMsgId) || (lParam == TTS_AUDIO_PLAY_START) )
		{
			fprintf(outfile_fp, "Visual Message recieved\n");
		}
		else if ( (uiMsg == SentenceMsgId) || (lParam == TTS_AUDIO_PLAY_START) )
		{	
			fprintf(outfile_fp, "Sentence Message recieved\n");
		}
		// fprintf(outfile_fp, "\n"); CAB
	}
}

/* ******************************************************************
 *      Function Name: TestApiFn()
 *
 *      Description: Tests a specific API function
 *
 *      Arguments:	TCHAR *lang		2 letter language abbreviation
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestApiFn(TCHAR argv[])
{

}

/* ******************************************************************
 *      Function Name: TestLang()
 *
 *      Description: Test Api functions for each language
 *
 *      Arguments:	TCHAR *lang				2 letter abrreviation for language
 *					int index				Language index code
 *					int MLState				State of ML
 *					LPTTS_HANDLE_T phTTSML	
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestLang(TCHAR *lang, int index, int MLState, LPTTS_HANDLE_T phTTSML)
{	LPTTS_HANDLE_T phTTS;	// struct TTS_HANDLE_TAG *
	CallBackState = 0;

#ifdef UNDER_CE
	fprintf(outfile_fp, "\n\n--- %S ---\n", lang);
#else
	fprintf(outfile_fp, "\n\n--- %s ---\n", lang);
#endif

	if ( MLState == 1 )
		phTTS = phTTSML;

	// Calls that do not require TTSStartupEx()
	if ( MLState != 1 )
	{	TestTTSStartLang(lang, TRUE);

		TestTTSSelectLang(NULL, index);
	}

	// For Api's that don't use the LPTTS_HANDLE_T
	// You must call TTSSelectLang() before each call to it
	TestTTSSelectLang(NULL, index);
	TestTTSGetCaps();

	// For Api's that don't use the LPTTS_HANDLE_T
	// You must call TTSSelectLang() before each call to it
	TestTTSSelectLang(NULL, index);
	TestTTSGetFeatures();

	TestTTSReserved1(FALSE, TRUE); // 16-BIT get values

	// For Api's that don't use the LPTTS_HANDLE_T
	// You must call TTSSelectLang() before each call to it
	TestTTSSelectLang(NULL, index);
	TestTTSVersion();

	// For Api's that don't use the LPTTS_HANDLE_T
	// You must call TTSSelectLang() before each call to it
	TestTTSSelectLang(NULL, index);
	TestTTSVersionEx();

	if ( MLState != 1 )
	{	TestTTSEnumLangs();

		//	TestTTSStartup(NULL, &phTTS, dwDeviceOptions[0]);
		if ( TestTTSStartup(&phTTS, dwDeviceOptions[0]) != MMSYSERR_NOERROR )
			return;

		if ( TestTTSShutdown(phTTS) != MMSYSERR_NOERROR )
			return;
		phTTS = NULL;	// No longer valid to prevent use

		if ( TestTTSStartupEx(&phTTS, dwDeviceOptions[0]) != MMSYSERR_NOERROR )
			return;
	}

	if ( MLState != 1 )
	{	// Shutdown before calling TestWavHelp()
		if ( TestTTSShutdown(phTTS) != MMSYSERR_NOERROR )
			return;
		phTTS = NULL;	// No longer valid to prevent use

		// Call using REPORT_OPEN_ERROR to allow
		if ( TestTTSStartupEx(&phTTS, dwDeviceOptions[1]) != MMSYSERR_NOERROR )
			return;
	}

	TestTTSGetPhVdefParams(phTTS);

	TestTTSGetStatus(phTTS, TTS_NORMAL);	// Different arguments for TTSSpeak()		
	TestTTSGetStatus(phTTS, TTS_FORCE);

	TestTTSLogHelp(phTTS, lang);

	/* ************* TextToSpeechMemory ************/
	TestTTSMemory(phTTS, index);
	TestTTSReset( phTTS, TRUE, index);	// Release something ???

	TestTTSPause(phTTS);

	TestTTSResume(phTTS);

	TestTTSRate(phTTS);

	// Testing TTSReset
	TestTTSReset( phTTS, FALSE, index);
	TestTTSReset( phTTS, TRUE, index );

	if ( MLState != 1)
	{	TestTTSSetLanguage( phTTS, TTS_AMERICAN_ENGLISH);
		TestTTSSetLanguage( phTTS, 2);
	}

	TestTTSSetSpeaker(phTTS, index);

	/* ************* Test TTSSpeak() ******************************** */
	TestTTSSpeak(phTTS, LangTestString[index], TTS_FORCE, TRUE, TRUE);
	
	TestTTSSpeak(phTTS, LangTestString[index], TTS_NORMAL, TRUE, TRUE);
	/* ************************************************************* */
	
	TestTTSTyping(phTTS);

	TestTTSUserDictionary(phTTS, lang);

	TestTTSWavHelp(phTTS, lang);

	if ( MLState != 1 )
	{	TestTTSShutdown(phTTS);
		phTTS = NULL;	// No longer valid to prevent use

		TestTTSCloseLang(lang);	// Should call after TTSShutdown()
	}

#ifdef UNDER_CE
	fprintf(outfile_fp, "--- %S ---\n\n", lang);
#else
	fprintf(outfile_fp, "--- %s ---\n\n", lang);
#endif
	return;
}

/* ******************************************************************
 *      Function Name: TestML()
 *
 *      Description: Test all languages in Multi Lang mode
 *
 *      Arguments:	void
 *
 *      Return Value:	int
 *						-1	Error
 *						0	Not ML
 *						1	ML
 *      Comments:
 *
 * *****************************************************************/
int TestML()
{	int i = 0;
	int MLState, NonApiTest = TRUE;
	unsigned int startLangStatus;
	LPTTS_HANDLE_T phTTSML;

	fprintf(outfile_fp, "-- MultiLang --\n");
	MLState = TestTTSEnumLangs();
	if ( MLState == 1 )
	{	// These Api's don't need TTSstartupEx()
		TestTTSGetCaps();
		TestTTSGetFeatures();
		TestTTSVersion();
		TestTTSVersionEx();
		
		// Load all the languages but ML
		for ( i = 0; i < DECTALK_LANG_COUNT; i++ )
		{	if ( i == DECTALK_LANG_COUNT-1 )
				NonApiTest = 1;
			startLangStatus = TestTTSStartLang(LangString[i], NonApiTest);
			if ( startLangStatus == TTS_NOT_SUPPORTED )
			{	
#ifndef UNDER_CE
				printf("\tTextToSpeechStartLang(%s) failed", LangString[i]);
#endif
				DoLang[i] = FALSE;
			}
			if ( i == 0)
				NonApiTest = FALSE;
		}

		// Test each language but ML
		for ( i = 0; i < DECTALK_LANG_COUNT; i++ )
		{	TestTTSSelectLang(NULL, i);

			// Call using REPORT_OPEN_ERROR to allow
			if ( TestTTSStartupEx(&phTTSML, dwDeviceOptions[1]) != MMSYSERR_NOERROR )
				return MLState;
			TestLang(LangString[i], i, MLState, phTTSML);
			break;
		}
		
		TestTTSShutdown(phTTSML);
		phTTSML = NULL;
		for ( i = 0; i < DECTALK_LANG_COUNT; i++)
		{	
#ifndef UNDER_CE			
			if ( TestTTSCloseLang(LangString[i]) == FALSE )
			{	printf("\tTextToSpeechCloseLang(%s) failed\n\n", LangString[i]);
				ErrorCount++;
			}
#endif
		}
	}
	
	return MLState;
}

/* ******************************************************************
 *      Function Name: TestTTSCloseLang()
 *
 *      Description: Tests the Function TextToSpeechCloseLang()
 *
 *      Arguments:	TCHAR *lang		2 letter language abbreviation
 *
 *      Return Value: int	Error code of API call
 *
 *      Comments:
 *
 * *****************************************************************/
int TestTTSCloseLang(TCHAR *lang)
{	int closeStatus;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechCloseLang(%s)\n\n", lang);
#ifdef UNDER_CE
	printf("Testing call:\tTextToSpeechCloseLang(%s)\n\n", lang);
#endif

	fprintf(outfile_fp, "TTSCloseLang(%s) - ", lang);	
	closeStatus = TextToSpeechCloseLang(lang);
	if (  closeStatus == FALSE )
		fprintf(outfile_fp, "Failed");
	else
		fprintf(outfile_fp, "Passed");

	fprintf(outfile_fp, "\n***************\n");
	return closeStatus;
}

/* ******************************************************************
 *      Function Name: TestTTSEnumLangs()
 *
 *      Description: Test the function TextToSpeechEnumLangs()
 *
 *      Arguments:	void
 *
 *      Return Value:	int
 *						-1	Error
 *						0	Not ML
 *						1	ML
 *
 *      Comments:
 *
 * *****************************************************************/
int TestTTSEnumLangs()
{	LPLANG_ENUM langs;
	DWORD dwStatus;
	int i, MLState;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechEnumLangs()\n\n");
#ifdef UNDER_CE
	printf("Testing call:\tTextToSpeechEnumLangs()\n\n");
#endif

	fprintf(outfile_fp, "TTSEnumLangs() - ");
	dwStatus = TextToSpeechEnumLangs(&langs);
	//						 0000000001111111111
	//		                 1234567890123456789 This is the max length string
	if ( dwStatus == 0 )
	{	fprintf(outfile_fp, "Failed: Unable to\n                  allocate memory\n");
		MLState = -1;
	}
	else if ( (langs)->MultiLang == FALSE )
	{	fprintf(outfile_fp, "Passed: Not ML\n");
		MLState = 0;
	}
	else
	{	fprintf(outfile_fp, "Passed: ML\n");
		for (i = 0; i < (int)( langs)->Languages; i++)
		{	DoLang[i] = TRUE;	// order not important testing all
#ifdef UNDER_CE
			fprintf(outfile_fp, "  The lang[%d] abbrv:%S\n", i, langs->Entries[i].lang_code);
			fprintf(outfile_fp, "  The lang[%d] is:%S\n", i, langs->Entries[i].lang_name);
#else
			fprintf(outfile_fp, "  The lang[%d] abbrv:%s\n", i, langs->Entries[i].lang_code);
			fprintf(outfile_fp, "  The lang[%d] is:%s\n", i, langs->Entries[i].lang_name);
#endif
		}
		MLState = 1;
	}

	fprintf(outfile_fp, "\n***************\n");
	return MLState;
}

/* ******************************************************************
 *      Function Name: TestTTSGetCaps()
 *
 *      Description: Tests the Function TextToSpeechGetCaps()
 *
 *      Arguments:	void
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSGetCaps()
{	LPTTS_CAPS_T lpTTScaps;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechGetCaps()\n\n");
#ifndef UNDER_CE
	printf("\nTesting calls:\tTextToSpeechGetCaps()\n\n");
#endif

	lpTTScaps = (LPTTS_CAPS_T) malloc(sizeof(TTS_CAPS_T));
	fprintf(outfile_fp, "TTSGetCaps() - ");
	ApiStatus(TextToSpeechGetCaps(lpTTScaps));
	if (!DoLang[DECTALK_LANG_COUNT+1])
	{	if (lpTTScaps->dwNumberOfLanguages != 1)
			fprintf(outfile_fp,"  More Languages present\n");
	}
	else
	{	if (lpTTScaps->dwNumberOfLanguages != DECTALK_LANG_COUNT)
			fprintf(outfile_fp,"  Not all languages loaded\n");
	}
	fprintf(outfile_fp, "  Number of Languages: %d\n", lpTTScaps->dwNumberOfLanguages);

	fprintf(outfile_fp, "  Sample Rate: %d\n", lpTTScaps->dwSampleRate);

#ifndef ACCESS32
	if ( lpTTScaps->dwMinimumSpeakingRate != 75 )
		fprintf(outfile_fp, "  Min speaking rate of %d is not = 75\n", lpTTScaps->dwMinimumSpeakingRate);
#else
	if ( lpTTScaps->dwMinimumSpeakingRate != 50 )
		fprintf(outfile_fp,"  Min Speaking rate is of %d is not = 50\n", lpTTScaps->dwMinimumSpeakingRate);
#endif
	fprintf(outfile_fp, "  Min Speaking Rate is: %d\n", lpTTScaps->dwMinimumSpeakingRate);
	minRate = lpTTScaps->dwMinimumSpeakingRate;

	if ( lpTTScaps->dwMaximumSpeakingRate != 600 )
		fprintf(outfile_fp,"  Max Speaking rate is not correct: %d\n", lpTTScaps->dwMaximumSpeakingRate);
	fprintf(outfile_fp, "  Max Speaking Rate is: %d\n", lpTTScaps->dwMaximumSpeakingRate);
	maxRate = lpTTScaps->dwMaximumSpeakingRate;

	if ( lpTTScaps->dwNumberOfPredefinedSpeakers != (WENDY+1) )
	{	fprintf(outfile_fp, "  Number of Speakers is not correct: %d\n",
			lpTTScaps->dwNumberOfPredefinedSpeakers);
	}

	fprintf(outfile_fp, "  Number of Predefined Speakers: %d\n", lpTTScaps->dwNumberOfPredefinedSpeakers);
	switch ( lpTTScaps->dwCharacterSet )
	{	case TTS_ASCII:
			fprintf(outfile_fp, "  Character set is ASCII: %d\n", lpTTScaps->dwCharacterSet);
			break;
		case TTS_UNICODE:
			fprintf(outfile_fp, "  Character set is Unicode: %d\n", lpTTScaps->dwCharacterSet);
			break;
		default:
			fprintf(outfile_fp, "  Unknown character set: %d\n", lpTTScaps->dwCharacterSet);
			break;
	}

	fprintf(outfile_fp, "  Version: %d\n", lpTTScaps->Version);
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSGetFeatures()
 *
 *      Description: Tests the Function TextToSpeechGetFeature()
 *
 *      Arguments:	void
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSGetFeatures()
{	DWORD feats;
	
	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechGetFeatures()\n\n");
#ifndef UNDER_CE
	printf("Testing call:\tTextToSpeechGetFeatures()\n\n");
#endif
	
	fprintf(outfile_fp, "TTSGetFeatures() - ");
	//						 00000000011111111
	//						 12345678901234567
	feats = TextToSpeechGetFeatures();
	if (feats & TTS_FEATS_MULTILANG)
	{	fprintf(outfile_fp, "Passed: ML\n");
		return;
	}
	else if (feats & TTS_FEATS_TYPINGMODE)
		fprintf(outfile_fp, "Passed: Not ML\nand Access32 is on.\n");
	else
		fprintf(outfile_fp, "Passed: Not ML\n");


	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSGetPhVdefParams()
 *
 *      Description: Test function TextToSpeechGetPhVdefParams()
 *
 *      Arguments:	LPTTS_HANDLE_T	Text-to-speech handle
 *					
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSGetPhVdefParams(LPTTS_HANDLE_T phTTS)
{	short *temp11;
	int index = 0, index2 = 0;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechGetPhVdefParams()\n\n");
#ifndef UNDER_CE
	printf("Testing call:\tTextToSpeechGetPhVdefParams()\n\n");
#endif

	for (index = 0; index < 18; index++)
	{	
		temp11 = TextToSpeechGetPhVdefParams(phTTS, index);
		for (index2 = 0; index2 < 34;/*spdef*/ index2++)
		{
			fprintf(outfile_fp, "  Values[%d:%d]: %d\n", index, index2, temp11[index2]);
		}
	}
	
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSGetStatus()
 *
 *      Description: Tests the Function TextToSpeechGetStatus()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					DWORD dwFlags			Method to insert characters into TTS queue
 *      Return Value: void
 *
 *      Comments:
 *					Currently this is not working the way its suppose to.
 *					Could be the engine or test need to confirm
 *
 * *****************************************************************/
void TestTTSGetStatus(LPTTS_HANDLE_T phTTS, DWORD dwFlags)
{	DWORD dwTextLen = 0;
	DWORD dwIdentifier[3], dwStatus[3], dwNumberOfStatusValues = 3;	// TTSGetStatus()
#ifdef UNDER_CE
	TCHAR temp[MAX_STR_LEN] = { TEXT("1 2 3 4 5 6 7 8 9 10 a b c d e f g h i j k l m n o p q r s t u v w x y z")
								TEXT("1 2 3 4 5 6 7 8 9 10 a b c d e f g h i j k l m n o p q r s t u v w x y z")};
#else
	TCHAR temp[MAX_STR_LEN] = { "1 2 3 4 5 6 7 8 9 10 a b c d e f g h i j k l m n o p q r s t u v w x y z"
								"1 2 3 4 5 6 7 8 9 10 a b c d e f g h i j k l m n o p q r s t u v w x y z"};
#endif
	fprintf(outfile_fp, "\n***************\n");
	if ( dwFlags == TTS_NORMAL )
	{	fprintf(outfile_fp, "\nTTSGetStatus(TTS_NORMAL)\n\n");
#ifndef UNDER_CE
		printf("Testing calls:\tTextToSpeechGetStatus(TTS_NORMAL)\n\n");
#endif
	}
	else
	{	fprintf(outfile_fp, "\nTTSGetStatus(TTS_FORCE)\n\n");
#ifndef UNDER_CE
		printf("Testing calls:\tTextToSpeechGetStatus(TTS_FORCE)\n\n");
#endif
	}

	dwIdentifier[0] = INPUT_CHARACTER_COUNT;
	dwIdentifier[1] = STATUS_SPEAKING;
	dwIdentifier[2] = WAVE_OUT_DEVICE_ID;
	
#ifdef UNDER_CE
	dwTextLen = wcslen(temp);
#else
	dwTextLen = strlen(temp);
#endif
	TestTTSSpeak(phTTS, temp, dwFlags, FALSE, FALSE);
	Sleep(1000);	// Required to get STATUS_SPEAKING
	fprintf(outfile_fp, "TTSGetStatus() - ");
	ApiStatus(TextToSpeechGetStatus(phTTS, dwIdentifier, dwStatus, dwNumberOfStatusValues));
	TestTTSSync(phTTS, FALSE);

	//fprintf(outfile_fp, "TextToSpeechSync() \t\t\t\t\t...");
	//ApiStatus(TextToSpeechSync(phTTS));
	TestTTSGetStatusHelp( dwIdentifier, dwStatus, dwNumberOfStatusValues, dwTextLen, dwFlags);
	
	/*
	dwTextLen = strlen(temp);
	TestTTSSpeak(phTTS, temp, dwFlags, FALSE, FALSE);
	fprintf(outfile_fp, "TextToSpeechGetStatus \t\t\t\t...");
	ApiStatus(TextToSpeechGetStatus(phTTS, dwIdentifier, dwStatus, dwNumberOfStatusValues));
	TestTTSGetStatusHelp( dwIdentifier, dwStatus, dwNumberOfStatusValues, dwTextLen, dwFlags);
	TestTTSSync(phTTS, FALSE);
	*/
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSGetStatusHelp()
 *
 *      Description: Used to test values returned by function TextToSpeechGetStatus()
 *
 *      Arguments:	DWORD dwIdentifier				Identifiers specifying status to return
 *					DWORD dwStatus					The values of the Identifiers
 *					DWORD dwNumberofStatusValues	Number of Identifiers
 *					DWORD dwTextLen					Length of string input
 *					DWORD dwFlags					Method characters were inserted into TTS queue
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSGetStatusHelp( DWORD dwIdentifier[], DWORD dwStatus[], DWORD dwNumberOfStatusValues,
					    DWORD dwTextLen, DWORD dwFlags )
{	DWORD i;

	for (i = 0; i < dwNumberOfStatusValues; i++)
	{	switch( dwIdentifier[i] )
		{	case INPUT_CHARACTER_COUNT:
				if ( dwFlags == TTS_FORCE)	
				{	if ( (dwTextLen + 2) != dwStatus[i] )	// Two extra characters added to end
						fprintf(outfile_fp, "  DwStatus[%d] = %d != %d\n", i, dwStatus[i], dwTextLen);
				}
				else
				{	if ( (dwTextLen) != dwStatus[i] )
						fprintf(outfile_fp, "  DwStatus[%d] = %d != %d\n", i, dwStatus[i], dwTextLen);
				}
				break;
			case STATUS_SPEAKING:
				if ( dwStatus[i] != TRUE )
					fprintf(outfile_fp, "  NOT SETUP YET:Audio sample should not be playing\n");
					break;
			case WAVE_OUT_DEVICE_ID:	// = availableDevices - 1
					fprintf(outfile_fp, "  Current output audio device is: %d\n", dwStatus[i]);
					break;
			default:
				fprintf(outfile_fp, "  Data in TestGetStatus() is corputted\n",dwStatus[i]);
				break;
		}
		fprintf(outfile_fp,"  dwIdentifier[%d] = %d, dwStatus[%d] = %d\n", i, dwIdentifier[i], i, dwStatus[i]);
	}
}

/* ******************************************************************
 *      Function Name: TestTTSLogHelp()
 *
 *      Description: Calls the function TestTTSLog() to test TTSLog functions
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					TCHAR *lang				2 Letter language id
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSLogHelp(LPTTS_HANDLE_T phTTS, TCHAR * lang)
{	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechOpenLogFile(%s)\nTextToSpeechCloseLogFile(%s)\n\n", lang, lang);
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechOpenLogFile(%s)\n\t\tTextToSpeechCloseLogFile(%s)\n\n", lang, lang);
#endif
	
	TestTTSLog(phTTS, lang, LOG_TEXT);
	TestTTSLog(phTTS, lang, LOG_SYLLABLES);
	TestTTSLog(phTTS, lang, LOG_PHONEMES);
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSLog()
 *
 *      Description:	Tests the Functions
 *						1.TextToSpeechOpenLogFile()
 *						2.TextToSpeechCloseLogFile()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					TCHAR *lang				2 Letter language id
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSLog(LPTTS_HANDLE_T phTTS, TCHAR * lang, DWORD dwFlags)
{	FILE *file_fp;
	int i;
	TCHAR logoutfile[MAX_STR_LEN];

#ifdef	UNDER_CE
	wchar_t *SpeechSample = TEXT("Hello");
	wchar_t temp[MAX_STR_LEN] = TEXT("**_****.log");
	
	wsprintf(temp, TEXT("%s_"), lang);
#else
	char *SpeechSample = "Hello";
	char temp[MAX_STR_LEN] = "**_****.log";
	
	sprintf(temp, "%s_", lang);
#endif

	switch ( dwFlags )
	{	case LOG_TEXT:
			temp[3] = 't';
			temp[4] = 'e';
			temp[5] = 'x';
			temp[6] = 't';
#ifdef UNDER_CE
			SpeechSample = TEXT("This is a Log File in Text Mode.");
#else
			SpeechSample = "This is a Log File in Text Mode.";
#endif
			break;
		case LOG_PHONEMES:
			temp[3] = 'p';
			temp[4] = 'h';
			temp[5] = 'o';
			temp[6] = 'n';
#ifdef UNDER_CE
			SpeechSample = TEXT("This is a Log File in Phoneme Mode.");
#else
			SpeechSample = "This is a Log File in Phoneme Mode.";
#endif
			break;
		case LOG_SYLLABLES:	
			temp[3] = 's';
			temp[4] = 'y';
			temp[5] = 'l';
			temp[6] = 'l';
#ifdef UNDER_CE
			SpeechSample = TEXT("This is a Log File in Syllable Mode.");
#else
			SpeechSample = "This is a Log File in Syllable Mode.";
#endif
			break;
	}

	// Copy path and filename
#ifdef UNDER_CE
	wsprintf(logoutfile, TEXT("%s\\%s"), path, temp);
#else
	sprintf(logoutfile, "%s\\%s", path, temp);
#endif

	fprintf(outfile_fp, "TTSOpenLogFile() - ");
	ApiStatus(TextToSpeechOpenLogFile( phTTS, logoutfile, dwFlags));

	TestTTSSpeak(phTTS, SpeechSample, TTS_FORCE, FALSE, TRUE);

	fprintf(outfile_fp, "TTSCloseLogFile() - ");
	ApiStatus(TextToSpeechCloseLogFile(phTTS));
	
	// Check log file
	fprintf(outfile_fp, "TTSOpenLogFile( ");
#ifdef UNDER_CE
	for (i = ((int)(wcslen(path))+1); i < ((int)(wcslen(path))+8); i++)
#else
	for (i = ((int)(strlen(path))+1); i < ((int)(strlen(path))+8); i++)
#endif
		fprintf(outfile_fp, "%c", logoutfile[i]);
	fprintf(outfile_fp," ) - ");

#ifdef UNDER_CE
	if ( (file_fp = _wfopen(logoutfile, TEXT("r"))) == NULL)
#else
	if ( (file_fp = fopen(logoutfile, "r")) == NULL)
#endif
		fprintf(outfile_fp, "Failed: file %s could not be open.\n");
	else
		fprintf(outfile_fp, "Passed.\n");

	if ( fclose(file_fp) )
		fprintf(outfile_fp, "  The file %s could not be close.\n");

	/*
	// To Check If File is Created BUT Empty
	i = _open(logoutfile, _O_RDONLY);
	if ( _filelength(i) != 0)
		fprintf(outfile_fp, "Passed.\n");
	else
		fprintf(outfile_fp, "Failed.\n");
	_close(file_fp);
	*/
}

/* ******************************************************************
 *      Function Name: TestTTSMemory()
 *
 *      Description:	Tests the Functions
 *						1.TextToSpeechOpenInMemory()
 *						2.TextToSpeechCloseInMemory()
 *						3.TextToSpeechAddBuffer()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					int index				2 Letter language id
 *
 *      Return Value: void
 *
 *      Comments:	There seems to be a problem with test
 *					Reset engine to eliminate problem.
 *
 * *****************************************************************/
void TestTTSMemory(LPTTS_HANDLE_T phTTS, int index)
{	int i = 0;
	int count = 0;
	LPTTS_BUFFER_T ppTTSbuffer = NULL;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechOpenInMemory()\nTextToSpeechCloseInMemory()\n\n");
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechOpenInMemory()\n\t\tTextToSpeechCloseInMemory()\n\n");
#endif

	CallBackState = 1;
	phTTS_mem = phTTS;

	for (i = 0; i < NAUDIO_BUFFERS; i++)
	{	pTTSbuffer[i] = (LPTTS_BUFFER_T) malloc(sizeof(TTS_BUFFER_T));
		if ( pTTSbuffer[i] == NULL )
		{
#ifndef UNDER_CE
			printf("  Memory allocation failed!\n");
#endif
			fprintf(outfile_fp, "  Memory allocation failed!\n");
			return;
		}

		pTTSbuffer[i]->lpData = (LPSTR)malloc(NSAMPLES * sizeof(short));
		pTTSbuffer[i]->lpPhonemeArray = (LPTTS_PHONEME_T)malloc( MAX_PHONEMES * sizeof(TTS_PHONEME_T));
		pTTSbuffer[i]->lpIndexArray = (LPTTS_INDEX_T) malloc( MAX_INDEX_MARKS * sizeof(TTS_INDEX_T));
		pTTSbuffer[i]->dwMaximumBufferLength = NSAMPLES;
		pTTSbuffer[i]->dwMaximumNumberOfPhonemeChanges = MAX_PHONEMES;
		pTTSbuffer[i]->dwMaximumNumberOfIndexMarks = MAX_INDEX_MARKS;
		//pTTSbuffer[i]->dwNumberOfPhonemeChanges;
		//pTTSbuffer[i]->dwNumberOfIdexMarks;
	}

	//	fprintf(outfile_fp,"TextToSpeechStartupEx \t\t\t...");
	//	MMStatusBank(TextToSpeechStartupEx(&phTTS_mem,WAVE_MAPPER,dwDeviceOptions,CallBack,(LONG)(12345)));
	
	// Add also do not use audio device
	mmStatus = TextToSpeechOpenInMemory(phTTS, dwFormat[1]);
	// This way since callback message is displayed 1st
	fprintf(outfile_fp, "TTSOpenInMemory() - ");
	ApiStatus(mmStatus);

	for (i = 0; i < NAUDIO_BUFFERS; i++)
	{	fprintf(outfile_fp,"TTSAddBuffer(%d) - ", i);
		ApiStatus(TextToSpeechAddBuffer(phTTS, pTTSbuffer[i]));
	}

	// 1st to add to buffer
	TestTTSSpeak(phTTS, LangTestString[index], TTS_NORMAL, FALSE, TRUE);

	//fprintf(outfile_fp,"TextToSpeechSync() \t\t\t...");
	//ApiStatus(TextToSpeechSync(phTTS));
	//ApiStatus(TextToSpeechSync(phTTS));
	
	count=0;
	while (count<100)
	{	Sleep(10);
		for ( i = 0; i < NAUDIO_BUFFERS; i++)
		{	if (addit[i])
			{	addit[i]=0;
				TextToSpeechAddBuffer(phTTS, pTTSbuffer[i]);
			}
		}
		count++;
	}

	//ppTTSbuffer = NULL;
	/* CAB Currently not working */
 	for (i = 0; i < (NAUDIO_BUFFERS); i++ )
	{	fprintf(outfile_fp,"TTSReturnBuffer(%d) - ", i);
		ApiStatus(TextToSpeechReturnBuffer(phTTS, &ppTTSbuffer));
		if( ppTTSbuffer != NULL )
		{	// Audio data
			//fprintf(outfile_fp,"\t\t: lpData[%d]: %s", i, (*ppTTSbuffer)->lpData);
			fprintf(outfile_fp, "  lpPhonemeArray[%d]: %s", i, pTTSbuffer[i]->lpPhonemeArray);
			fprintf(outfile_fp, "  lpIndexArray[%d]: %s", i, pTTSbuffer[i]->lpIndexArray);
			
			fprintf(outfile_fp, "  dwBufferLength: %d", (ppTTSbuffer)->dwBufferLength);
			fprintf(outfile_fp, "  dwNumberOfPhonemeChanges: %u", (ppTTSbuffer)->dwNumberOfPhonemeChanges);
			fprintf(outfile_fp, "  dwNumberOfIndexMarks: %u", (ppTTSbuffer)->dwNumberOfIndexMarks);
		}
	}

	mmStatus = TextToSpeechCloseInMemory(phTTS);
	fprintf(outfile_fp,"TTSCloseInMemory() - ");
	ApiStatus(mmStatus);

	CallBackState = 0;
#ifdef UNDER_CE
	TestTTSSpeak(phTTS, TEXT("  Memory ok."), TTS_FORCE, FALSE, FALSE);
#else
	TestTTSSpeak(phTTS, "  Memory ok.", TTS_FORCE, FALSE, FALSE);
#endif
	
	// CAB Removed TTSSync() causes hang
	//TestTTSSync(phTTS, FALSE);
	//Sleep(2000);
	for (i = 0; i < NAUDIO_BUFFERS; i++ )
	{	if ( pTTSbuffer[i] != NULL )
		{	free(pTTSbuffer[i]->lpData);
			free(pTTSbuffer[i]->lpPhonemeArray);
			free(pTTSbuffer[i]->lpIndexArray);
			free(pTTSbuffer[i]);
			pTTSbuffer[i]=NULL;	// CAB Is this necessary
		}
	}
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSPause()
 *
 *      Description: Tests the Function TextToSpeechPause()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSPause(LPTTS_HANDLE_T phTTS)
{	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechPause()\n\n");
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechPause()\n\n");
#endif

#ifdef _OWN_AUDIO
	TestTTSSpeak(phTTS, "You should hear this message after testing TextToSpeechResume command",
				 TTS_NORMAL, FALSE, FALSE);

	fprintf(outfile_fp, "TTSPause() - ");
	ApiStatus(TextToSpeechPause(phTTS));
#else
	fprintf(outfile_fp, "TTSPause() - Unchecked\n");
#endif
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSRate()
 *
 *      Description: 	Tests the Functions
*						1. TextToSpeechGetRate()
*					 	2. TextToSpeechSetRate()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *
 *      Return Value: void
 *
 *      Comments:
 * *****************************************************************/
void TestTTSRate(LPTTS_HANDLE_T phTTS)
{	LPDWORD pdwRate;
	// Use TTSGetCaps for rate
	DWORD dwRate = minRate - 1;
	TCHAR temp[MAX_STR_LEN];

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechSetRate()\n\t\t\t\tTextToSpeechGetRate()\n\n");
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechSetRate()\n\t\tTextToSpeechGetRate()\n\n");
#endif

	pdwRate = (LPDWORD) malloc(sizeof(DWORD));
	for ( ; dwRate <= (maxRate + 1); dwRate++)
	{	fprintf(outfile_fp, "TTSSetRate(%d) - ", dwRate);
		ApiStatus(TextToSpeechSetRate(phTTS, dwRate));
		
		mmStatus = TextToSpeechGetRate(phTTS, pdwRate);
		fprintf(outfile_fp, "TTSGetRate(%d) - ", *pdwRate);
		if ( mmStatus != MMSYSERR_NOERROR )
			fprintf(outfile_fp, "Failed\n");
		else
			fprintf(outfile_fp, "Passed\n");
	
		if ( dwRate != *pdwRate)
			fprintf(outfile_fp, "TTSGetRate(%d) - Failed\n", *pdwRate);
		
		// Speak at 25 rate increase interval
		if ( (dwRate % 25) == 0)
		{
#ifdef UNDER_CE			
			wsprintf(temp, TEXT("  Current rate is set to %d"), *pdwRate);
#else
			sprintf(temp, "  Current rate is set to %d", *pdwRate);
#endif
			TestTTSSpeak(phTTS, temp, TTS_FORCE, FALSE, TRUE);	// TTSSync() to process rate changed
		}
		fprintf(outfile_fp, "\n");
	}

	// Default value
	dwRate = 200;
	fprintf(outfile_fp, "TTSSetRate(%d) - ", dwRate);
	ApiStatus(TextToSpeechSetRate(phTTS, dwRate));
	fprintf(outfile_fp, "TTSGetRate(%d) - ", *pdwRate);
	ApiStatus(TextToSpeechGetRate(phTTS, pdwRate));
	if ( dwRate != *pdwRate)
		fprintf(outfile_fp, "TTSGetRate(%d) - Failed\n", *pdwRate);
	
#ifdef UNDER_CE
	TestTTSSpeak(phTTS, TEXT("The rate is now back to 200."), TTS_NORMAL, FALSE, TRUE);	// TTSSync() to process rate changed
#else
	TestTTSSpeak(phTTS, "The rate is now back to 200.", TTS_FORCE, FALSE, TRUE);
#endif
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSResume()
 *
 *      Description: Tests the Function TextToSpeechResume()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSResume(LPTTS_HANDLE_T phTTS)
{	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechResume()\n\n");
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechResume()\n\n");
#endif

#ifdef _OWN_AUDIO
	fprintf(outfile_fp, "TTSResume() - ");
	ApiStatus(TextToSpeechResume(phTTS));
	TestTTSSync(phTTS, FALSE);
#else
	fprintf(outfile_fp, "TTSResume() - Unchecked\n");
#endif
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSReserved1()
 *
 *      Description: Tests the Function TextToSpeechReserved1()
 *
 *      Arguments:	int	bEightk		8kHz sample rate switch
 *					int readData	To get or set value of GV's
 *
 *      Return Value: ULONG
 *
 *      Comments:	This function should be called after TextToSpeechStartLang() but before
 *					TextToSpeechStartup()
 *
 * *****************************************************************/
ULONG TestTTSReserved1(int bEightk, int readData)
{	unsigned char voices[7] = {0, 0, 0, 0, 0, 0};	// Values of GV GN G1 G2 G3 G3 G4 G5
	int i;
	ULONG nReturn;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechReserved1()\n\n");
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechSetReserved1()\n\n");
#endif

	for (i = 0; i < DECTALK_VOICE_COUNT; i++)
	{	fprintf(outfile_fp, "TTSReserved1() - ");
		nReturn = TextToSpeechReserved1(voices, (unsigned char)SpeakerVoices[i], bEightk, readData); // 16-BIT
		if ( nReturn  == 0)
			fprintf(outfile_fp, "Failed");
		else
			fprintf(outfile_fp, "Passed");
		fprintf(outfile_fp, "  SpeakerVoice[%d]: GV %d GN %d G1 %d G2 %d G3 %d G4 %d G5 %d\n", i,
		    voices[0], voices[1], voices[2], voices[3], voices[4], voices[5], voices[6]);
	}
	
	fprintf(outfile_fp, "\n***************\n");
	return nReturn;
}

/* ******************************************************************
 *      Function Name: TestTTSReset()
 *
 *      Description: Tests the Function TextToSpeechReset()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSReset( LPTTS_HANDLE_T phTTS, int bReset, int index)
{	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechReset()\n\n");
#ifndef UNDER_CE
	printf("Testing call:\tTextToSpeechReset()\n\n");
#endif

	TestTTSSpeak(phTTS, LangTestString[index], TTS_NORMAL, FALSE, FALSE);
	fprintf(outfile_fp, "TTSReset() - ");
	ApiStatus(TextToSpeechReset( phTTS, bReset));
	// Make sure queue was flushed
	TestTTSSync(phTTS, FALSE);
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSSelectLang()
 *
 *      Description: Tests the Function TextToSpeechSelectLang()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *					unsigned int handle		Language handle
 *
 *      Return Value: void
 *
 *      Comments:	This function should be called after TextToSpeechStartLang() but before
 *					TextToSpeechStartup()
 *
 * *****************************************************************/
void TestTTSSelectLang( LPTTS_HANDLE_T phTTS, unsigned int lang)
{
	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechSelectLang(%d)\n\n", lang);
	fprintf(outfile_fp, "TTSSelectLang(%d) - ", lang);
#ifndef UNDER_CE	
	printf("Testing call:\tTextToSpeechSelectLang(%d)\n\n", lang);
#endif

	if ( TextToSpeechSelectLang(NULL, lang) != FALSE )
	{	fprintf(outfile_fp, "Passed: ML\n");
	}
	else
		fprintf(outfile_fp, "Passed: Not ML.\n");
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSSetLanguage()
 *
 *      Description:	Tests the Function TextToSpeechSetLanguage()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *					LANGUAGE_T Language		Specifies language
 *
 *      Return Value: void
 *
 *      Comments:	NOT SUPPORTED
 *
 * *****************************************************************/
void TestTTSSetLanguage( LPTTS_HANDLE_T phTTS, LANGUAGE_T Language )
{	fprintf(outfile_fp, "\n****************************************************\n");
	fprintf(outfile_fp, "\nTextToSpeechSetLanguage()\n\n");
#ifndef UNDER_CE
	printf("\nTesting calls:\tTextToSpeechSetLanguage()\n\n");
#endif
	
	fprintf(outfile_fp, "TTSSetLanguage() - ");
	ApiStatus(TextToSpeechSetLanguage(phTTS, Language));
}

/* ******************************************************************
 *      Function Name: TestTTSSetSpeaker()
 *
 *      Description:	Tests the Functions
 *						1.TextToSpeechGetSpeaker()
 *						2.TextToSpeechSetSpeaker()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *					int index				Language code index
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSSetSpeaker(LPTTS_HANDLE_T phTTS, int index)
{	MMRESULT mmStatus;
	LPSPEAKER_T lpSpeaker;
	SPEAKER_T Speaker = PAUL;
	int i, SpeakerIndex = (index * DECTALK_VOICE_COUNT);
	
	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "\nTextToSpeechSetSpeaker()\nTextToSpeechGetSpeaker()\n\n");
#ifndef UNDER_CE
	printf("\nTesting calls:\tTextToSpeechSetSpeaker()\n\t\tTextToSpeechGetSpeaker()\n\n");
#endif

#ifdef FASTRUN
#else
	lpSpeaker = (LPSPEAKER_T) malloc(sizeof(SPEAKER_T));

	for ( i = 0; (LangTestSpeaker[SpeakerIndex] != NULL) && (i < DECTALK_VOICE_COUNT); SpeakerIndex++, i++)
	{	Speaker = SpeakerVoices[SpeakerIndex];
		fprintf(outfile_fp, "TTSSetSpeaker() - ");
		ApiStatus(TextToSpeechSetSpeaker( phTTS, Speaker));
		TestTTSSpeak(phTTS, LangTestSpeaker[SpeakerIndex], TTS_NORMAL, FALSE, TRUE);
		fprintf(outfile_fp, "TTSGetSpeaker() - ");
		mmStatus = TextToSpeechGetSpeaker(phTTS, lpSpeaker);
		if ( (*lpSpeaker == SpeakerVoices[SpeakerIndex]) && (mmStatus == MMSYSERR_NOERROR) )
			fprintf(outfile_fp, "Passed.\n");
		else 
			ApiStatus(mmStatus);
		// Display name printf("\t%s\n", 
	}
	
	// Restore to default
	Speaker = PAUL;
	fprintf(outfile_fp, "TTSSetSpeaker() - ");
	ApiStatus(TextToSpeechSetSpeaker( phTTS, Speaker));
	fprintf(outfile_fp,"TTSGetSpeaker() - ");
	mmStatus = TextToSpeechGetSpeaker( phTTS, lpSpeaker);
	if ( (*lpSpeaker == PAUL) && (mmStatus == MMSYSERR_NOERROR) )
		fprintf(outfile_fp, "Passed.\n");
	else
		ApiStatus(mmStatus);
	
	fprintf(outfile_fp, "\n***************\n");
#endif
}

/* ******************************************************************
 *      Function Name: TestTTSShutdown()
 *
 *      Description: Tests the Function TextToSpeechShutdown()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *
 *      Return Value:	MMRESULT
 *
 *      Comments:	This function should be called last
 *
 * *****************************************************************/
MMRESULT TestTTSShutdown(LPTTS_HANDLE_T phTTS)
{	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechShutdown()\n\n");
#ifndef UNDER_CE
	printf("Testing call:\tTextToSpeechShutdown()\n\n");
#endif
	
	fprintf(outfile_fp, "TTSShutdown() - ");
	mmStatus = ApiStatus(TextToSpeechShutdown(phTTS));
	fprintf(outfile_fp, "\n***************\n");
	return mmStatus;
}

/* ******************************************************************
 *      Function Name: TestTTSSpeak()
 *
 *      Description: Tests the Function TextToSpeechSpeak()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-To-Speech handle
 *					TCHAR TestString[]		Text message
 *					int dwFlags				Method to insert characters into TTS queue
 *					int nonApiTest			Whether it's a test to API call or being call by another API call
*					int syncOn				Whether to call TTSSync()
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSSpeak(LPTTS_HANDLE_T phTTS, TCHAR TestString[], int dwFlags, int nonApiTest, int syncOn)
{
	if( nonApiTest )
	{	fprintf(outfile_fp, "\n***************\n");
		fprintf(outfile_fp, "TextToSpeechSpeak()\n\n");
#ifndef UNDER_CE
		printf("Testing call:\tTextToSpeechSpeak()\n\n");
#endif
	}

	fprintf(outfile_fp, "TTSSpeak() - ");
	ApiStatus(TextToSpeechSpeak(phTTS, TestString, dwFlags));

	if (syncOn)
		TestTTSSync(phTTS, FALSE);

	if ( nonApiTest )
		fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSStartLang()
 *
 *      Description: Tests the Function TextToSpeechStartLang()
 *
 *      Arguments:	TCHAR *lang		2 letter abbreviation for the current Language
*					int NonApiTest	Whether it's testing this API call being used by another API call
 *
 *      Return Value: void
 *
 *      Comments:	This function should be called before TextToSpeechStartup() and
 *					TextToSpeechSelectLang()
 *
 * *****************************************************************/
unsigned int TestTTSStartLang( TCHAR *lang, int NonApiTest )
{	unsigned int handle;

	if ( NonApiTest )
	{	fprintf(outfile_fp, "\n***************\n");
		fprintf(outfile_fp, "TextToSpeechStartLang()\n\n");
#ifndef UNDER_CE
		printf("Testing call:\tTextToSpeechStartLang(%s)\n\n", lang);
#endif
	}

#ifdef UNDER_CE
	fprintf(outfile_fp, "TTSStartLang(%S) - ", lang);
#else
	fprintf(outfile_fp, "TTSStartLang(%s) - ", lang);
#endif
	
	//						         000000000111111111111
	//		                         123456789012345678901	This is the max length string
	// Call before TTSStartup()
	handle = TextToSpeechStartLang(lang);
	if ( handle & TTS_LANG_ERROR )
	{	switch (handle)
		{	case TTS_NOT_SUPPORTED:
				fprintf(outfile_fp, "Passed: ML is not\n                      setup\n");
				break;
			case TTS_NOT_AVAILABLE:
#ifdef UNDER_CE
				fprintf(outfile_fp, "Failed: %S NOT\n                            AVAILABLE\n", lang);
#else
				fprintf(outfile_fp, "Failed: %s NOT\n                            AVAILABLE\n", lang);
#endif
				break;
			case FALSE:
#ifdef UNDER_CE
				fprintf(outfile_fp, "Failed: %S\n", lang);
#else
				fprintf(outfile_fp, "Failed: %s\n", lang);
#endif
				break;
			default:
				fprintf(outfile_fp, "Failed: \n");
				break;
		}
	}
	else
		fprintf(outfile_fp, "Passed: ML\n");

	if ( NonApiTest )
		fprintf(outfile_fp, "\n***************\n");

	return handle;
}

/* ******************************************************************
 *      Function Name: TestTTSStartup()
 *
 *      Description: Tests the Function TextToSpeechStartup()
 *
 *      Arguments:	LPTTS_HANDLE_T	phTTS	Text-to-speech handle
 *					DWORD deviceOptions		how wave output device is managed
 *
 *      Return Value: MMRESULT
 *
 *      Comments:
 *
 * *****************************************************************/
MMRESULT TestTTSStartup(LPTTS_HANDLE_T phTTS, DWORD deviceOptions)
{
	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechStartUp()\n\n");
#ifndef UNDER_CE
	printf("Testing call:\tTextToSpeechStartUp()\n\n");
#endif
	fprintf(outfile_fp,"TTSStartUp() - ");
	mmStatus = ApiStatus(TextToSpeechStartup(NULL, phTTS, WAVE_MAPPER, deviceOptions));
	fprintf(outfile_fp, "\n***************\n");
	return mmStatus;
}

/* ******************************************************************
 *      Function Name: TestTTSStartupEx()
 *
 *      Description: Tests the Function TextToSpeechStartupEx()
 *
 *      Arguments:	LPTTS_HANDLE_T	phTTS	Text-to-speech handle
 *					DWORD deviceOptions		how wave output device is managed
 *
 *      Return Value: MMRESULT
 *
 *      Comments:
 *
 * *****************************************************************/
MMRESULT TestTTSStartupEx( LPTTS_HANDLE_T phTTS, DWORD dwDeviceOptions )
{
	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechStartUpEx()\n\n");
#ifndef UNDER_CE
	printf("Testing call:\tTextToSpeechStartUpEx()\n\n");
#endif
	
	fprintf(outfile_fp, "TTSStartUpEx() - "); 
	mmStatus = ApiStatus(TextToSpeechStartupEx(phTTS, WAVE_MAPPER, dwDeviceOptions, 
		                 DtCallBackRoutine, 1));
	fprintf(outfile_fp, "\n***************\n");
	return mmStatus;
}

/* ******************************************************************
 *      Function Name: TestTTSSync()
 *
 *      Description: Tests the Function TextToSpeechSync()
 *
 *      Arguments:	LPTTS_HANDLE_T	phTTS	Text-to-speech handle
 *					int NonApiTest			Whether testing API or being called by another API
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSSync( LPTTS_HANDLE_T phTTS, int NonApiTest )
{
	if ( NonApiTest )
	{	fprintf(outfile_fp, "\n***************\n");
		fprintf(outfile_fp, "TextToSpeechSync()\n\n");
#ifndef UNDER_CE
		printf("Testing call:\tTextToSpeechSync()\n\n");
#endif
	}
	
	fprintf(outfile_fp, "TTSSync() - "); 
	ApiStatus(TextToSpeechSync(phTTS));
	
	if ( NonApiTest )
		fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSTyping()
 *
 *      Description: Tests the Function TextToSpeechTyping()
 *
 *      Arguments:	LPTTS_HANDLE_T	phTTS	Text-to-speech handle
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSTyping(LPTTS_HANDLE_T phTTS) 
{	int i;
	TCHAR string[] = { 'a', 'b', 'c', 'd','e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 
					   'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	                 };

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "\nTextToSpeechTyping()\n\n");
#ifndef UNDER_CE
	printf("\nTesting calls:\tTextToSpeechTyping()\n\n");
#endif
	for (i = 0; i < 26; i++)
	{	TextToSpeechTyping( phTTS, string[i]);
		TestTTSSync(phTTS, FALSE);
	}
	
	fprintf(outfile_fp, "\n***************\n");
	return;
}

/* ******************************************************************
 *      Function Name: TestTTSUserDictionary()
 *
 *      Description:	Tests the functions
 *						1.TextToSpeechLoadUserDictionary()
 *						2.TextToSpeechUnloadUserDictionary()
 *
 *      Arguments:	LPTTS_HANDLE_T	phTTS	Text-to-speech handle
 *					TCHAR *lang				2 letter abbreviation for current language
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSUserDictionary(LPTTS_HANDLE_T phTTS, TCHAR *lang)
{
#ifndef UNDER_CE
	TCHAR temp[MAX_STR_LEN];
#endif

#ifdef UNDER_CE
	wchar_t dictfile[MAX_STR_LEN] = TEXT("**.dic");
#else
	char dictfile[MAX_STR_LEN] = "**.dic";
#endif

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechUnloadUserDictionary(%s)\nTextToSpeechUnloadUserDictionary(%s)\n\n", lang, lang);
#ifndef UNDER_CE
	printf("\nTesting calls:\tTextToSpeechUnloadUserDictionary(%s)\n\t\tTextToSpeechloadUserDictionary(%s)\n\n",
		   lang, lang);
#endif

	// Copy path and filename
#ifdef UNDER_CE
	wsprintf(dictfile, TEXT("%s\\%s.dic"), path, lang);
#else
	sprintf(dictfile, "%s\\%s.dic", path, lang);
#endif

#ifdef UNDER_CE

#else
	// Check if file exist
	_searchenv( dictfile, NULL, temp);
	if ( *temp == '\0' )
	{	sprintf( temp, "Dictionary %s can not be found\n", dictfile );
		ErrorOut(temp);
		return;
	}
#endif

	// Unload the user dictionary
	fprintf(outfile_fp, "TTSUnloadUserDictionary() - ");
#ifndef UNDER_CE
	printf("\tTextToSpeechUnLoadUserDictionary()");
#endif
    ApiStatus(TextToSpeechUnloadUserDictionary( phTTS ));

#ifndef UNDER_CE
	printf("\t%s\n", LangTestUserDictString[LangIndex]);
#endif
	TestTTSSpeak(phTTS, LangTestUserDictString[LangIndex], TTS_FORCE, FALSE, TRUE);

	/* Now load the new one */
	fprintf(outfile_fp, "TTSLoadUserDictionary() - ");
#ifndef UNDER_CE
	printf("\tTextToSpeechLoadUserDictionary()");
#endif
    ApiStatus(TextToSpeechLoadUserDictionary( phTTS, dictfile));

#ifndef UNDER_CE
	printf("\t%s\n\n", LangTestUserDictString[LangIndex]);
#endif
	TestTTSSpeak(phTTS, LangTestUserDictString[LangIndex], TTS_FORCE, FALSE, TRUE);
	
	// Unload the user dictionary
	fprintf(outfile_fp, "TTSUnloadUserDictionary() - ");
    ApiStatus(TextToSpeechUnloadUserDictionary( phTTS ));
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSVersion()
 *
 *      Description: Tests the Function TextToSpeechVersion()
 *
 *      Arguments: void
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSVersion()
{	TCHAR *VerString;
	ULONG result;
	ULONG DECtalk_maj_ver, DECtalk_min_ver;
	ULONG DAPI_maj_ver, DAPI_min_ver;
	ULONG Build;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechVersion()\n\n");
#ifndef	UNDER_CE
	printf("Testing calls:\tTextToSpeechVersion\n\n");
#endif

	result = TextToSpeechVersion(&VerString);
	/*	
		DECtalk_maj_ver = 1;
		DECtalk_min_ver = 0;
	*/
	DECtalk_maj_ver = ((result & 0xFF000000) >> 24);
	DECtalk_min_ver = ((result & 0x00FF0000) >> 16);

	DAPI_maj_ver = ((result & 0x0000FF00) >> 8);
	DAPI_min_ver = (result & 0x000000FF);

	Build = (result & 0x0000FFFF);
	/*	if (DAPI_maj_ver != DECtalk_maj_ver)
			fprintf(outfile_fp,"Error on Major.\n");
		else if (DAPI_min_ver < DECtalk_min_ver)
			fprintf(outfile_fp,"Error on Minor.\n");
		else
			fprintf(outfile_fp,"Passed.\n");
	*/
#ifdef UNDER_CE
	fprintf(outfile_fp,"  %S\n", VerString);
#else
	fprintf(outfile_fp,"  %s\n", VerString);
#endif
	fprintf(outfile_fp,"  DECtalk Version - %d.%02d Build - %X\n", DECtalk_maj_ver, DECtalk_min_ver, Build);
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSVersionEx()
 *
 *      Description: Tests the Function TextToSpeechVersionEx()
 *
 *      Arguments:	void
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSVersionEx()
{	DWORD result;
	LPVERSION_INFO ver;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechVersionEx()\n\n");
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechVersionEx()\n\n");
#endif

	fprintf(outfile_fp,"TTSVersionEx() - ");
	result = TextToSpeechVersionEx(&ver);
	if (result == ver->StructSize)
	{	fprintf(outfile_fp, "Passed\n");
		fprintf(outfile_fp, "  StructSize: %ul\n", ver->StructSize);
		fprintf(outfile_fp, "  StructVersion: %ul\n", ver->StructVersion);
		fprintf(outfile_fp, "  DLL Version: %u\n", ver->DLLVersion);
		fprintf(outfile_fp, "  DTalkVersion: %u\n", ver->DTalkVersion);
#ifdef UNDER_CE		
		fprintf(outfile_fp, "  VerString: %S\n", ver->VerString);
		fprintf(outfile_fp, "  Language: %S\n", ver->Language);
#else
		fprintf(outfile_fp, "  VerString: %s\n", ver->VerString);
		fprintf(outfile_fp, "  Language: %s\n", ver->Language);
#endif
		fprintf(outfile_fp, "  Features: %u\n", ver->Features);
	}
	else
		fprintf(outfile_fp,"Failed\n");
}

/* ******************************************************************
 *      Function Name: TestTTSWavHelp()
 *
 *      Description: Calls TestTTSWav() to test TTSWavs Functions
 *
 *      Arguments:	LPTTS_HANDLE_T	Text-to-speech handle
 *					TCHAR *lang		2 letter abrreviations for language
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSWavHelp(LPTTS_HANDLE_T phTTS, TCHAR *lang)
{	int i;

	fprintf(outfile_fp, "\n***************\n");
	fprintf(outfile_fp, "TextToSpeechOpenwaveOutFile()\nTextToSpeechCloseWaveOutFile()\n\n");
#ifndef UNDER_CE
	printf("Testing calls:\tTextToSpeechOpenwaveOutFile()\n\t\tTextToSpeechCloseWaveOutFile\n\n");
#endif
	for( i = 0; i < WAVFORMATCOUNT; i++)
		TestTTSWav(phTTS, lang, dwFormat[i]);
	fprintf(outfile_fp, "\n***************\n");
}

/* ******************************************************************
 *      Function Name: TestTTSWav()
 *
 *      Description:	Tests the functions
 *						1.TextToSpeechOpenWaveOutFile()
 *						2.TextToSpeechCloseWaveoutFile()
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					TCHAR *lang				2 letter abrreviations for language
 *					DWORD dwFormat			Audio sample format
 *
 *      Return Value: MMRESULT	Error code
 *
 *      Comments:
 *
 * *****************************************************************/
void TestTTSWav(LPTTS_HANDLE_T phTTS, TCHAR *lang, DWORD dwFormat)
{	int i;
	TCHAR waveoutfile[MAX_STR_LEN];
	TCHAR waveFormat[MAX_STR_LEN];
#ifdef UNDER_CE
	wchar_t temp[MAX_STR_LEN] = TEXT("**_****.wav");

	wsprintf(temp, TEXT("%s_"), lang);
#else
	char temp[MAX_STR_LEN] = "**_****.wav";

	sprintf(temp, "%s_", lang);
#endif

	switch ( dwFormat )
	{	case WAVE_FORMAT_1M08:
			temp[3] = '1';
			temp[4] = 'M';
			temp[5] = '0';
			temp[6] = '8';
#ifdef UNDER_CE
			wcscpy(waveFormat, TEXT("11kHz Mono 8 bit"));
#else
			strcpy(waveFormat, "11kHz Mono 8 bit");
#endif
			break;
		case WAVE_FORMAT_1M16:
			temp[3] = '1';
			temp[4] = 'M';
			temp[5] = '1';
			temp[6] = '6';
#ifdef UNDER_CE
			wcscpy(waveFormat, TEXT("11kHz Mono 16 bit"));
#else
			strcpy(waveFormat, "11kHz Mono 16 bit");
#endif
			break;
		case WAVE_FORMAT_08M08 :
			temp[3] = '8';
			temp[4] = 'M';
			temp[5] = '0';
			temp[6] = '8';
#ifdef UNDER_CE
			wcscpy(waveFormat, TEXT("8kHz Mono 8 bit Mu Law"));
#else
			strcpy(waveFormat, "8kHz Mono 8 bit Mu Law");
#endif
			break;
	}

	// Copy path and filename
#ifdef UNDER_CE
	wsprintf(waveoutfile, TEXT("%s"), temp);
#else
	sprintf(waveoutfile, "%s\\%s", path, temp);
#endif

	fprintf(outfile_fp, "TTSOpenWaveOutFile(");
#ifdef UNDER_CE
	//for (i = (int)(wcslen(path))+1; i < ((int)(wcslen(path))+8); i++)
#else
	for (i = (int)(strlen(path))+1; i < ((int)(strlen(path))+8); i++)
#endif
	//fprintf(outfile_fp, "%c", waveoutfile[i]);
	fprintf(outfile_fp, ") - ");
	mmStatus = ApiStatus(TextToSpeechOpenWaveOutFile( phTTS, waveoutfile, dwFormat));
	if ( mmStatus != MMSYSERR_NOERROR )
		return;

#ifdef UNDER_CE
	//wsprintf(temp, TEXT("Playing %s wave file."), waveFormat);
	wsprintf(temp, TEXT("Playing wave file."));
#else
	sprintf(temp, "Playing %s wave file.", waveFormat);
#endif
	TestTTSSpeak(phTTS, temp, TTS_FORCE, FALSE, TRUE);

	fprintf(outfile_fp, "TTSCloseWaveOutFile() - ");
	ApiStatus(TextToSpeechCloseWaveOutFile( phTTS ));
	TestTTSSync(phTTS, FALSE);

#ifdef UNDER_CE
	wsprintf(temp, TEXT("[:play %s]"), waveoutfile);
#else
	sprintf(temp, "[:play %s]", waveoutfile);
#endif
	TestTTSSpeak(phTTS, temp, TTS_FORCE, FALSE, TRUE);
}

/* ******************************************************************
 *		Function Name:	ParseArgs
 *
 *		Description:	Parses the arguments in argv and sets global 
 *						variables representing program options.
 *		Arugments:	int argc		Number of arguments
 *					TCHAR **argv	Value of arguments
 *
 *		Return value: int
 *			Returns firstWordIndex, the array index (to argv) of the first argument
 *			which is text to be spoken.  If the return value is zero, no arguments
 *			are to be spoken directly.  If the return value is negative, no further
 *			processing occurs.
 *
 *      Comments:
 *
 * *****************************************************************/
int ParseArgs( int argc, TCHAR **argv )
{
#ifndef UNDER_CE
	TCHAR temp[MAX_STR_LEN];

	strcpy(path, "\\tools\\apitest");
	/* Loop over arguments, looking for command line options */
	switch (argc)
	{	case 1:
		case 2:
		case 3:
			// If its a command line option
			if ( argv[1][0] == '-' )
			{	// Order US, UK, LA, SP, GR, FR
				if ( _strnicmp(argv[1], "-US", 3) == 0 )	// Process which languages
					DoLang[0] = TRUE;
				else if ( _strnicmp(argv[1], "-UK", 3) == 0 )
					DoLang[1] = TRUE;
				else if ( _strnicmp(argv[1], "-LA", 3) == 0 )
					DoLang[2] = TRUE;
				else if ( _strnicmp(argv[1], "-SP", 3) == 0 )
					DoLang[3] = TRUE;
				else if ( _strnicmp(argv[1], "-GR", 3) == 0 )
					DoLang[4] = TRUE;
				else if ( _strnicmp(argv[1], "-FR", 3) == 0 )
					DoLang[5] = TRUE;
				else if ( _strnicmp(argv[1], "-ML", 3) == 0 )
					DoLang[6] = TRUE;
				else if ( (_strnicmp(argv[1], "-H", 2) == 0) || (argv[1][1] == '?') )	// Process request for help
				{	OutputHelp();
					return -1;
				}
				else	// Process invalid argument
				{	ErrorOut( "Invalid Argument\n" );
					return -1;
				}
			}
			
			// Check if path is valid
			sprintf(temp, "%s%s", argv[2], path);
			strcpy(path, temp);
			if ( _chdir(temp) != 0 )
			{	sprintf(temp, "Invalid path: %s\n", path);
				ErrorOut( temp );
			}

			if (argc == 2)
				break;

			// Check if just running a single Api Test
			//if ( !CheckApiCall(argv[2]) )
			//	return -1;
			
			//TestApiFn(argv[2]);
			break;
		default:
			ErrorOut( "Invalid number of arguments\n" );
			ErrorOut( "Example: apitest -us d:\\work\\product\n" );
			return -1;
	}
#else
	wcscpy(path, TEXT("\\"));
#endif
    return 0;    
}

/*
MMRESULT SpeakStdin( void )
{	DWORD numRead;
    BOOL readStatus;
    MMRESULT status;
    char buf[2049];

    do {
        memset( buf, 0, sizeof(buf) );
        readStatus = ReadFile( hStdin, buf, 2048, &numRead, NULL );
        if ( (!readStatus) || (numRead == 0) )
            break;
		
		fprintf(outfile_fp,"TextToSpeechSpeak \t\t\t...");
        MMStatusBank(TextToSpeechSpeak( us_phTTS, buf, TTS_FORCE ));

    } while ( readStatus );

    return status;
}*/

/*
MMRESULT SpeakCmdLine( int ac, char **av, int firstIndex )
{	int i;
    MMRESULT status;
    
    // Loop over arguments, sending each one to DECtalk
	for ( i = firstIndex; i < ac; i++ )
	{	if ( signalReceived )
			break;
    
        // Put a space between arguments, otherwise DECtalk will run
        // them all together.
    
		if ( i > firstIndex )
		{	fprintf(outfile_fp,"TextToSpeechSpeak \t\t\t...");
			MMStatusBank(TextToSpeechSpeak( us_phTTS, " ", TTS_NORMAL ));
		}
    
        // Send the argument to DECtalk.
		fprintf(outfile_fp,"TextToSpeechSpeak \t\t\t...");
        MMStatusBank(TextToSpeechSpeak( us_phTTS, av[i], TTS_NORMAL ));
    } // End loop over args

	return status;
}
*/

/* ******************************************************************
 *		Function Name:	ErrorOut()
 *
 *		Description:	Writes error messages to log file
 *
 *		Arugments:	TCHAR *message		Text data
 *
 *		Return value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void ErrorOut( TCHAR *message )
{	DWORD numWritten;

#ifdef UNDER_CE
    WriteFile( hStderr, message, wcslen( message ), &numWritten, NULL );
#else
	WriteFile( hStderr, message, strlen( message ), &numWritten, NULL );
#endif
}

/* ******************************************************************
 *		Function Name:	PutStdOut()
 *
 *		Description:	Writes error messages to log file
 *
 *		Arugments:	TCHAR *message	Text data
 *
 *		Return value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void PutStdOut( TCHAR *message )
{	DWORD numWritten;

#ifdef UNDER_CE
    WriteFile( hStdout, message, wcslen( message ), &numWritten, NULL );
#else
	WriteFile( hStdout, message, strlen( message ), &numWritten, NULL );
#endif
}

#ifdef BORLAND_C
#pragma argsused
#endif

/*
BOOL CtrlHandler( DWORD dwCtrlType )
{	signalReceived = TRUE;
    TextToSpeechReset( us_phTTS, TRUE );

    return TRUE;
}
*/

/* ******************************************************************
 *		Function Name:	OutputHelp()
 *
 *		Description:	Display options
 *
 *		Arugments:	void
 *
 *		Return value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void OutputHelp( void )
{
#ifndef UNDER_CE
	PutStdOut( "APITEST [options] [path]\n" );
    PutStdOut( "\n" );
    PutStdOut( "Help Options:\n" );
    PutStdOut( "\n" );
    PutStdOut( "  -h or -? = Help. Outputs this file to the console.  This\n" );
    PutStdOut( "             option cancels any others on the command line.\n" );
    PutStdOut( "\n" );
	PutStdOut( "Language Select Options:\n" );
	PutStdOut( "\n" );
	PutStdOut( "  -US      = Select United States English.\n");
	PutStdOut( "  -UK      = Select United Kingdom English.\n");
	PutStdOut( "  -SP      = Select Castillian Spanish.\n");
	PutStdOut( "  -LA      = Select Latin American Spanish.\n");
	PutStdOut( "  -GR      = Select German.\n");
	PutStdOut( "  -FR      = Select French.\n");
	PutStdOut( "  -ML      = Select All Languages.\n");
	PutStdOut( "\n" );
	PutStdOut( "	Default : all languages are set on.\n");
	PutStdOut( "Example: apitest -us d:\\work\\product\\tools\\apitest\n");
    PutStdOut( "\n" );
#endif
}
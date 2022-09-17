// CEapiDlg.cpp : implementation file
#include <windef.h>
#include <winbase.h>
#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <malloc.h>
#include <io.h>
#include <fcntl.h>
#include <commdlg.h>
#include <winnt.h>
#include <winuser.h>

#include "ttsapi.h"
#include "ttsfeat.h"
#include "wceres.rc"
#include "stdafx.h"
#include "CEapi.h"
#include "CEapiDlg.h"

VOID CallBack (LONG lParam, LONG Buffer, DWORD userData, UINT uiMsg);
void WriteLine(TCHAR *Line);
BOOL OpenFileToRead( HWND hWnd);
BOOL RdFileToBuf( LPTSTR lpszFile, HWND hWnd );

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define	 STRICT
#define  NSAMPLES		 32767
#define  MAX_PHONEMES      128
#define  MAX_INDEX_MARKS   128
#define  MAX_STRING_LEN  32768
#define  NAUDIO_BUFFERS      5


#ifdef SILENT							  /* Defined for a faster, quieter run */
#define dwDeviceOptions	 DO_NOT_USE_AUDIO_DEVICE
#else
#define dwDeviceOptions  OWN_AUDIO_DEVICE
#define _OWN_AUDIO						  /* TextToSpeechPause is only effective */
#endif									  /* when Audio is on */


unsigned int uiID_Error_Msg=0;
unsigned int uiID_Buffer_Msg=0;
unsigned int uiID_Index_Msg=0;
int ShutdownBuffer = 1;					  /* Prevents unnecessary Messages   */
										  /* from the callback from printing */
BOOL CloseLangStatus;

/****************************************************************************/

#define INPUT_CMDLINE       0
#define INPUT_STDIN         1

#define OUTPUT_SOUND        0
#define OUTPUT_WAVE         1
#define OUTPUT_LOGTEXT      2
#define OUTPUT_LOGPHONEME   3
#define OUTPUT_LOGSYLLABLE  4

#define MMSYSERR_BADDEVICE_ID 10		  /* Unrecognized Error ID from  */
										  /* documentation				 */

/****************************************************************************/

LPTTS_HANDLE_T phTTS_mem = NULL;		  /* Standard Handle for Memory routine */

LPTTS_BUFFER_T pTTSbuffer[5];
BOOL        signalReceived = FALSE;       /* Set TRUE on CTRL/C or Break */


/****************************************************************************/

DWORD dwFormat = WAVE_FORMAT_1M08;
SPEAKER_T Speaker = PAUL;

/****************************************************************************/

#ifdef BORLAND_C
#pragma argsused
#endif
 
/***************************************************************************/
#define FILE_LEN 4000
TCHAR Line[256];
HANDLE hFile, hhFile;
DWORD dwRW;
HWND hWnd;
TCHAR        FileBuf[FILE_LEN+1];   


/**************************************************************************/

// CCEapiDlg dialog

CCEapiDlg::CCEapiDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CCEapiDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CCEapiDlg)
	m_text = _T("");
	m_clear = FALSE;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CCEapiDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCEapiDlg)
	DDX_Control(pDX, IDC_TEXT, m_textBox);
	DDX_Text(pDX, IDC_TEXT, m_text);
	DDX_Check(pDX, IDC_CLEAR, m_clear);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CCEapiDlg, CDialog)
	//{{AFX_MSG_MAP(CCEapiDlg)
	ON_BN_CLICKED(IDC_PLAY, OnPlay)
    ON_BN_CLICKED(IDC_US_BUTTON, US)
	ON_BN_CLICKED(IDC_UK_BUTTON, UK)
	ON_BN_CLICKED(IDC_SP_BUTTON, SP)
	ON_BN_CLICKED(IDC_LA_BUTTON, LA)
	ON_BN_CLICKED(IDC_GR_BUTTON, GR)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCEapiDlg message handlers

LPTTS_HANDLE_T phTTS;

BOOL CCEapiDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	MMRESULT result;

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	CenterWindow(GetDesktopWindow());	// center to the hpc screen

	// TODO: Add extra initialization here
	phTTS = NULL;
	result = TextToSpeechStartup(NULL, &phTTS, WAVE_MAPPER, REPORT_OPEN_ERROR);
	if (result != MMSYSERR_NOERROR) {
		MessageBox(_TEXT("Failed to start DECtalk"), _TEXT("CeApi test "), MB_OK);
	}
	return TRUE;  // return TRUE  unless you set the focus to a control
}


void CCEapiDlg::OnPlay() 
{
	wchar_t str[1024];
	unsigned int loc = 0;

	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	wcscpy(str,LPCTSTR(m_text));

	if (phTTS != NULL){
		TextToSpeechSpeak(phTTS, str, TTS_FORCE);
	TextToSpeechSync(phTTS);
	}
	if (m_clear) {
		m_text = _T("");
		UpdateData(FALSE);
	}
	m_textBox.SetFocus();
	return;
}


void CCEapiDlg::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	if (phTTS != NULL)	TextToSpeechShutdown(phTTS);	
	CDialog::PostNcDestroy();
}


void CCEapiDlg::Start()
{
	
 	
/*******************************************************************************************
	     Register a private message to report DECtalk asychronous events.
***************************************************************************************8****/
    uiID_Error_Msg =RegisterWindowMessage((_T("DECtalkErrorMessage")));

/****************************************************************** 
	     Register a callback message for DECtalk buffers                
******************************************************************/

    uiID_Buffer_Msg = RegisterWindowMessage((_T("DECtalkBufferMessage")));

// oh, what the heck.. do index messages too..
    uiID_Index_Msg = RegisterWindowMessage((_T("DECtalkIndexMessage")));

// creates and opens output.txt file

	TextToSpeechSpeak(phTTS, _T("[:np]"), TTS_FORCE);
	m_textBox.SetWindowText(_T("CE API Test. \t\t\t\t\t\t\t\
	Compaq Corporation 1998. All rights reserved."));
	OnPlay();
}

void WriteLine(TCHAR *Line)
{		
// convert 8-bit string to 16-bit string.
	
	DWORD length = lstrlen(Line);

	DWORD charlength = length * sizeof(char);

	char * pMBString = (char *)LocalAlloc(LPTR,(charlength + sizeof(char)));

	wcstombs(pMBString,Line,charlength);

	WriteFile( hFile,pMBString,charlength, &dwRW, NULL);
	
}

void CCEapiDlg::US()
{		
// when US button is pressed, US vision of API test starts to run.
	m_textBox.SetWindowText(_T("U.S. English Testing.")); 
	OnPlay();
	TestOneLang("US");	
}

void CCEapiDlg::UK()
{
// when UK button is pressed, UK vision of API test starts to run.
	m_textBox.SetWindowText(_T("U.K. English Testing.")); 
	OnPlay();
	TestOneLang("UK");	
}

void CCEapiDlg::SP()
{
// when SP button is pressed, SP vision of API test starts to run.
	m_textBox.SetWindowText(_T("Spanish Language Testing.")); 
	OnPlay();	
	TestOneLang("SP");
} 

void CCEapiDlg::LA()
{
// when LA button is pressed, LA vision of API test starts to run.
	m_textBox.SetWindowText(_T("Latin American Language Testing.")); 
	OnPlay();
	TestOneLang("LA");
}

void CCEapiDlg::GR()
{
// when GR button is pressed, GR vision of API test starts to run.	
	m_textBox.SetWindowText(_T("German Language Testing.")); 
	OnPlay();
	TestOneLang("GR"); 	
} 



void CCEapiDlg::TestOneLang(char * lang) {

	BOOL SLstatus;
	unsigned long int feats;
	unsigned int handle;

	HANDLE hhFile;

	TCHAR * dictfile = _T("dtalk_**.dic");
	dictfile[6] = lang[0];
	dictfile[7] = lang[1];

	hFile = CreateFile(_T("APItest.txt"), GENERIC_WRITE, FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
	hhFile = CreateFile(dictfile, GENERIC_READ, FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);

	if (hhFile == INVALID_HANDLE_VALUE)
    {
		wsprintf(Line, _T("dectalk %c%c.dic file doesn't exist, testing stopped.\r\n"), lang[0], lang[1]);
		WriteLine(Line);
	    m_textBox.SetWindowText(Line);
		OnPlay();
		CloseHandle( hFile );
		return;
    }
    else
	{
		m_textBox.SetWindowText( _T("Start CE api test.\r\n"));
    }
       
	CloseHandle( hhFile );

	Start();
	wsprintf(Line, _T("-------------------- "));
	WriteLine(Line);
	wsprintf(Line, _T("%s"),lang);
	WriteFile( hFile,Line,sizeof(TCHAR)*lstrlen(Line), &dwRW, NULL);
	wsprintf(Line, _T(" --------------------\r\n"));
	WriteLine(Line);

	ShutdownBuffer = 1;
	handle = UINTStatus(TextToSpeechStartLang(lang));
	
	wcscpy(Line, _T("TextToSpeechSelectLang \t\t\t..."));
	WriteLine(Line);
	// 
	SLstatus = TextToSpeechSelectLang(NULL, handle);
	if (SLstatus)
	{
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
	}
	else
	{
		wsprintf(Line, _T("Failed.\r\n"));
		WriteLine(Line);
	}
	

	TestVersion();
	feats = TextToSpeechGetFeatures();
	wsprintf(Line, _T("TextToSpeechGetFeatures \t\t..."));
	WriteLine(Line);

	if (feats & TTS_FEATS_MULTILANG)
	{
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
	}
	else
	{
	wsprintf(Line, _T("Failed.\r\n"));
	WriteLine(Line);
	}
	
	TextToSpeechSelectLang(NULL,handle);
	TestVersionEx();

	TextToSpeechSelectLang(NULL,handle);

	wsprintf(Line, _T("TextToSpeechStartUpEx \t\t\t..."));
	WriteLine(Line);


	MMStatusBank(TextToSpeechStartupEx(&phTTS, WAVE_MAPPER,
		dwDeviceOptions,CallBack,(LONG)this));


    m_textBox.SetWindowText(_T("Dictionary Testing")); 
	OnPlay();
	TestDictionary(phTTS,lang); 
    TextToSpeechSpeak(phTTS, _T("Hello."),TTS_FORCE);
	TextToSpeechSync(phTTS);
	
	m_textBox.SetWindowText(_T("SetSpeaker Testing")); 
	OnPlay();
	TestSetSpeaker(phTTS);

	m_textBox.SetWindowText(_T("WaveHelp Testing")); 
	OnPlay();
	TestWavHelp(phTTS,lang);


 	m_textBox.SetWindowText(_T("LongHelp Testing")); 
	OnPlay();
	TestLogHelp(phTTS,lang);

	m_textBox.SetWindowText(_T("Pause Testing")); 
	OnPlay();
	TestPause(phTTS);

	m_textBox.SetWindowText(_T("Rate Testing")); 
	OnPlay();
	TestRate(phTTS);

	m_textBox.SetWindowText(_T("Status Testing")); 
	OnPlay();
	TestGetStatus(phTTS);

	m_textBox.SetWindowText(_T("Caps Testing")); 
	OnPlay();
	TestGetCaps();

	m_textBox.SetWindowText(_T("Memory Testing"));
	OnPlay();
//	TestMemory(phTTS);
	
	m_textBox.SetWindowText(_T("Testing complete.\r\n\r\n\
Open APItest.txt file to check the API test result.")); 
	OnPlay();
	Sleep(2000);


	TextToSpeechShutdown(phTTS);
	phTTS = NULL;

	CloseHandle( hFile );
	
	m_textBox.SetWindowText(_T("Done.")); 
}


/*  Test:  unsigned int TextToSpeechStartLang(char*);
 */
unsigned int CCEapiDlg::UINTStatus(unsigned int handle) {
	wsprintf(Line, _T("TextToSpeechStartLang \t\t\t..."));
	WriteLine(Line);

	switch (handle) {
		case TTS_NOT_SUPPORTED :
		wsprintf(Line, _T("NOT SUPPORTED\r\n"));
		WriteLine(Line);
		break;
		case TTS_NOT_AVAILABLE :
		wsprintf(Line, _T("NOT AVAILABLE\r\n"));
		WriteLine(Line);
		break;
		default :
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
		break;
		}

	return handle;
}

/*  Test:  DWORD TextToSpeechVersion(LPSTR* VersionStr);
 */
void CCEapiDlg::TestVersion() {
	DWORD result;
	USHORT DECtalk_maj_ver, DECtalk_min_ver;
	USHORT DAPI_maj_ver, DAPI_min_ver;
	USHORT Build;

	result = TextToSpeechVersion(NULL);
	wsprintf(Line, _T("TextToSpeechVersion \t\t\t...Passed.\r\n"));
	WriteLine(Line);
	DECtalk_maj_ver = (unsigned short) ((result & 0xFF000000) >> 24);
	DECtalk_min_ver = (unsigned short) ((result & 0x00FF0000) >> 16);
	DAPI_maj_ver = (unsigned short) ((result & 0x0000FF00) >> 8);
	DAPI_min_ver = (unsigned short) (result & 0x000000FF);
	Build = (unsigned short) (result & 0x0000FFFF);
	wsprintf(Line, _T("DECtalk Version - %d.%02d Build - %X\r\n"), DECtalk_maj_ver, DECtalk_min_ver, Build);
	WriteLine(Line);	
}

/*  Test:  DWORD TextToSpeechVersionEx(LPVERSION_INFO *ver);
 */
void CCEapiDlg::TestVersionEx() {
	DWORD result;
	LPVERSION_INFO ver;

	result = TextToSpeechVersionEx(&ver);
	wsprintf(Line, _T("TextToSpeechVersionEx \t\t\t..."));
	WriteLine(Line);

	if (result == ver->StructSize)
	{
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
	}
	else
	{
		wsprintf(Line, _T("Failed.\r\n"));
		WriteLine(Line);
	}
	
	// write the data to output.txt file.
	wsprintf(Line, _T("\tDLL Version - %ld\r\n"),ver->DLLVersion);
	WriteLine(Line);

	wsprintf(Line, _T("\tDTalkVersion - %X\r\n"),ver->DTalkVersion);
	WriteLine(Line);

	wsprintf(Line, _T("\tVerString - "));
	WriteLine(Line);
	wsprintf(Line, _T("%s"),ver->VerString);
	WriteLine(Line);
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);

	wsprintf(Line,_T("\tLanguage - "));
	WriteLine(Line);
	wsprintf(Line,_T("%s"),ver->Language);
	WriteFile( hFile,Line,sizeof(TCHAR)*lstrlen(Line), &dwRW, NULL);
	wsprintf(Line,_T("\r\n"));
	WriteLine(Line);

	wsprintf(Line,_T("\tStructVersion - %ld\r\n"),ver->StructVersion);
	WriteLine(Line);
}

/*  A list of status.
 */
MMRESULT CCEapiDlg::MMStatusBank(MMRESULT status) {

	switch (status) {
		case MMSYSERR_NOERROR :
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_NODRIVER :
		wsprintf(Line, _T("NODRIVER\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_NOMEM :
		wsprintf(Line, _T("NOMEM\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_ERROR :
		wsprintf(Line, _T("ERROR\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_BADDEVICE_ID :
		wsprintf(Line, _T("BADDEVICE_ID\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_ALLOCATED :
		wsprintf(Line, _T("ALLOCATED\r\n"));
		WriteLine(Line);
		break;
		case WAVERR_BADFORMAT :
		wsprintf(Line, _T("WAVERR_BADFORMAT\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_INVALHANDLE :
		wsprintf(Line, _T("INVALHANDLE\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_NOTENABLED:
		wsprintf(Line, _T("NOTENABLED.\r\n"));
		WriteLine(Line);
		break;
		case MMSYSERR_INVALPARAM :
		wsprintf(Line, _T("INVALPARAM\r\n"));
		WriteLine(Line);
		break;
		default :
		wsprintf(Line, _T("Failed.\r\n"));
		WriteLine(Line);
	}
	return (status);
}

VOID CallBack (LONG lParam, LONG Buffer, DWORD userData, UINT uiMsg)
{
	MMRESULT status;
	LPTTS_BUFFER_T OneLpSpeechBuffer=NULL;

	if (ShutdownBuffer == 0) {
		wsprintf(Line, _T("TextToSpeechMemory \t\t\t..."));
		WriteLine(Line);
		if (uiMsg == uiID_Index_Msg)
		{
			wsprintf(Line, _T("Index.\r\n"));
			WriteLine(Line);
		}
		else if (uiMsg == uiID_Error_Msg)
		{
			wsprintf(Line, _T("Error.\r\n"));
			WriteLine(Line);
		}
		else if (uiMsg == uiID_Buffer_Msg)
		{
			wsprintf(Line, _T("Passed.\r\n"));
			WriteLine(Line);
			// Requeue the buffer
			OneLpSpeechBuffer = (LPTTS_BUFFER_T) Buffer;
			status = ((CCEapiDlg *)userData)->MMStatusBank(TextToSpeechAddBuffer(phTTS_mem, OneLpSpeechBuffer ));
			wsprintf(Line, _T("%ld samples"),OneLpSpeechBuffer->dwBufferLength);
			WriteLine(Line);
			wsprintf(Line, _T("requeued. \r\n"));
			WriteLine(Line);
		}
		wsprintf(Line, _T("\r\n"));
		WriteLine(Line);
	}
}



/* Test:  MMRESULT TextToSpeechUnloadUserDictionary( LPTTS_HANDLE_T );
 *		  MMRESULT TextToSpeechLoadUserDictionary( LPTTS_HANDLE_T, LPSTR );
 *
 */
void CCEapiDlg::TestDictionary(LPTTS_HANDLE_T phTTS, char * lang) {
	/* First unload any previously loaded user dictionary */
	char * dictfile = "dtalk_**.dic";
	dictfile[6] = lang[0];
	dictfile[7] = lang[1];
	wsprintf(Line, _T("TextToSpeechUnloadUserDictionary \t..."));
	WriteLine(Line);
    MMStatusBank(TextToSpeechUnloadUserDictionary( phTTS ));
    
	/* Now load the new one */
	wsprintf(Line, _T("TextToSpeechLoadUserDictionary \t\t..."));
	WriteLine(Line);
    MMStatusBank(TextToSpeechLoadUserDictionary( phTTS,
												 dictfile));
}

/* Test: MMRESULT TextToSpeechSetSpeaker( LPTTS_HANDLE_T, SPEAKER_T );
 *		 MMRESULT TextToSpeechSpeak( LPTTS_HANDLE_T, LPSTR, DWORD );
 *		 MMRESULT TextToSpeechSync( LPTTS_HANDLE_T );
 */
void CCEapiDlg::TestSetSpeaker(LPTTS_HANDLE_T phTTS) {
#ifdef FASTRUN
#else
	MMRESULT status;
	LPSPEAKER_T lpSpeaker;
	lpSpeaker = (LPSPEAKER_T) malloc(sizeof(SPEAKER_T));
	TextToSpeechSpeak(phTTS, _T("Hi, I'm Paul. Let me introduce you to my friends."),TTS_NORMAL);
	m_textBox.SetWindowText(_T("Hi, I am Paul. Let me introduce you to my friends."));
	TextToSpeechSync(phTTS);
	Speaker = HARRY;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("Harry's the name, how are you doing?"), TTS_FORCE);
	m_textBox.SetWindowText(_T("Harry's the name, how are you doing?"));
	TextToSpeechSync(phTTS);
	Speaker = FRANK;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("My name is Frank, what's happening."), TTS_FORCE);
	m_textBox.SetWindowText(_T("My name is Frank, what's happening."));
	TextToSpeechSync(phTTS);
	Speaker = DENNIS;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("Dennis, with two N's."), TTS_FORCE);
	m_textBox.SetWindowText(_T("Dennis, with two N's."));
	TextToSpeechSync(phTTS);
	Speaker = BETTY;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("Hello, my name is Betty."), TTS_FORCE);
	m_textBox.SetWindowText(_T("Hello, my name is Betty."));
	TextToSpeechSync(phTTS);
	Speaker = URSULA;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("Hello sonny, you can call me Ursula."), TTS_FORCE);
	m_textBox.SetWindowText(_T("Hello sonny, you can call me Ursula."));
	TextToSpeechSync(phTTS);
	Speaker = WENDY;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("Wendy. I'm glad to meet you."), TTS_FORCE);
	m_textBox.SetWindowText(_T("Wendy. I'm glad to meet you."));
	TextToSpeechSync(phTTS);
	Speaker = RITA;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("My real name is Rita, but my friends call me Ritz."), TTS_FORCE);
	m_textBox.SetWindowText(_T("My real name is Rita, but my friends call me Ritz."));
	TextToSpeechSync(phTTS);
	Speaker = KIT;
	TextToSpeechSetSpeaker( phTTS, Speaker);
	TextToSpeechSpeak(phTTS, _T("Name is Kit, don't wear it out."), TTS_FORCE);
	m_textBox.SetWindowText(_T("Name is Kit, don't wear it out."));
	TextToSpeechSync(phTTS);

	Speaker = PAUL;
	TextToSpeechSetSpeaker( phTTS, Speaker);

	status = TextToSpeechGetSpeaker( phTTS, lpSpeaker);
	
	wsprintf(Line, _T("TextToSpeechGetSpeaker \t\t\t..."));
	WriteLine(Line);
	if ((*lpSpeaker == PAUL) && (status == MMSYSERR_NOERROR))
	{
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
	}
	else if ((*lpSpeaker == PAUL) && (status == MMSYSERR_INVALHANDLE))
	{
		wsprintf(Line, _T("INVALHANDLE\r\n"));
		WriteLine(Line);
	}
	else 
	{
		wsprintf(Line, _T("Failed.\r\n"));
		WriteLine(Line);
	}
#endif
}

/*  Test:  MMRESULT TextToSpeechPause( LPTTS_HANDLE_T );
 *		   MMRESULT TextToSpeechResume( LPTTS_HANDLE_T );
 */
void CCEapiDlg::TestPause(LPTTS_HANDLE_T phTTS) {
#ifdef _OWN_AUDIO
	MMRESULT status;
	wsprintf(Line, _T("TextToSpeechPause \t\t\t..."));
	WriteLine(Line);
	MMStatusBank(TextToSpeechPause (phTTS));
	m_textBox.SetWindowText(_T("I am now testing for the pause in Dectalk\
 that would have printed out a smiley\
 face before I said this phrase."));
	status = TextToSpeechSpeak (phTTS, _T("I am now testing for the pause in Dectalk")
		,TTS_NORMAL);
	status = TextToSpeechSpeak (phTTS, _T("that would have printed out a smiley")
		,TTS_NORMAL);
	status = TextToSpeechSpeak (phTTS, _T("face before I said this phrase."),TTS_NORMAL);
	wsprintf(Line, _T("This should print out before DECtalk says I am now testing...\r\n"));
	WriteLine(Line);
	Sleep(2000);

	wsprintf(Line, _T("TextToSpeechResume \t\t\t..."));
	WriteLine(Line);
	MMStatusBank(TextToSpeechResume (phTTS));
	TextToSpeechSync(phTTS);
#else
	wsprintf(Line, _T("TextToSpeechPause \t\t\t...Unchecked\r\n"));
	WriteLine(Line);
	wsprintf(Line, _T("TextToSpeechResume \t\t\t...Unchecked\r\n"));
	WriteLine(Line);
#endif	
}

/*  Test:  MMRESULT TextToSpeechSetRate( LPTTS_HANDLE_T, DWORD );
 */
void CCEapiDlg::TestRate (LPTTS_HANDLE_T phTTS) {
	MMRESULT status;
	LPDWORD pdwRate;
	DWORD dwRate = 200;
	pdwRate = (LPDWORD) malloc(sizeof(DWORD));
	TextToSpeechSetRate(phTTS, 350);
	m_textBox.SetWindowText(_T("Setting the rate to 350, I speak faster now."));
	TextToSpeechSpeak (phTTS, _T("Setting the rate to 350, I speak faster now.")
				,TTS_NORMAL);
	TextToSpeechSpeak (phTTS, _T("        "),TTS_NORMAL);
	TextToSpeechSync(phTTS);
	TextToSpeechSetRate (phTTS, dwRate);
	m_textBox.SetWindowText(_T("The rate is now back to 200."));
	TextToSpeechSpeak (phTTS, _T("The rate is now back to 200.\n")
				,TTS_NORMAL);
	TextToSpeechSync(phTTS);

	wsprintf(Line, _T("TextToSpeechGetRate \t\t\t..."));
	WriteLine(Line);
	status = TextToSpeechGetRate(phTTS, pdwRate);
	if ((status == NOERROR) && (*pdwRate == 200))

	{
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
	}
	else if (status == MMSYSERR_INVALHANDLE)
	{
		wsprintf(Line, _T("INVALHANDLE.\r\n"));
		WriteLine(Line);	
	}
	else if (*pdwRate != 200)
	{
		wsprintf(Line, _T("Failed.\r\n"));
		WriteLine(Line);
	}
}


/* Test: MMRESULT TextToSpeechGetStatus( LPTTS_HANDLE_T, LPDWORD, LPDWORD, DWORD );
 */
void CCEapiDlg::TestGetStatus (LPTTS_HANDLE_T phTTS){
	unsigned long dwStatus[3];
	unsigned long dwIdentifier[3];
	int dwNumberOfStatusValues = 3;
	int i = 0;

	dwIdentifier[0] = INPUT_CHARACTER_COUNT;
	dwIdentifier[1] = STATUS_SPEAKING;
	dwIdentifier[2] = WAVE_OUT_DEVICE_ID;

	wsprintf(Line, _T("TextToSpeechGetStatus \t\t\t..."));
	WriteLine(Line);
	MMStatusBank(TextToSpeechGetStatus(phTTS, dwIdentifier, dwStatus
								   ,dwNumberOfStatusValues));
	for (i = 0; i < dwNumberOfStatusValues; i++)
	{
		wsprintf(Line, _T("\t%d"),dwStatus[i]);
	    WriteLine(Line);
	}
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);
}

/* Test:  MMRESULT TextToSpeechGetCaps( LPTTS_CAPS_T );
 */
void CCEapiDlg::TestGetCaps() {
	MMRESULT status;
	LPTTS_CAPS_T lpTTScaps;

	lpTTScaps = (LPTTS_CAPS_T) malloc(sizeof(TTS_CAPS_T));
	status = TextToSpeechGetCaps(lpTTScaps);

	wsprintf(Line, _T("TextToSpeechGetCaps \t\t\t..."));
	WriteLine(Line);
	if ((status == NOERROR) && (lpTTScaps->dwMinimumSpeakingRate == 75)
		&& (lpTTScaps->dwMaximumSpeakingRate == 600))
	{
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
	}
	else
	{
		wsprintf(Line, _T("Failed.\r\n"));
		WriteLine(Line);
	}
	//write data to output.txt file.
	wsprintf(Line, _T("\tNumber of Languages :"));
	WriteLine(Line);
	wsprintf(Line,_T("%d"),lpTTScaps->dwNumberOfLanguages);
	WriteLine(Line);
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);

	wsprintf(Line, _T("\tSample Rate :"));
	WriteLine(Line);
	wsprintf(Line,_T("%d"),lpTTScaps->dwSampleRate);
	WriteLine(Line);
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);

	wsprintf(Line, _T("\tMin Speaking Rate :"));
	WriteLine(Line);
	wsprintf(Line,_T("%d"),lpTTScaps->dwMinimumSpeakingRate);
	WriteLine(Line);
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);

	wsprintf(Line, _T("\tMax Speaking Rate :"));
	WriteLine(Line);
	wsprintf(Line,_T("%d"),lpTTScaps->dwMaximumSpeakingRate);
	WriteLine(Line);
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);

	wsprintf(Line, _T("\tNum of Predefined Speakers :"));
	WriteLine(Line);
	wsprintf(Line,_T("%d"),lpTTScaps->dwNumberOfPredefinedSpeakers);
	WriteLine(Line);
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);

	wsprintf(Line, _T("\tVersion :"));
	WriteLine(Line);
	wsprintf(Line,_T("%d"),lpTTScaps->Version);
	WriteLine(Line);
	wsprintf(Line, _T("\r\n"));
	WriteLine(Line);

}

void CCEapiDlg::TestMemory(LPTTS_HANDLE_T curr_phTTS_mem) {
	MMRESULT status;
	int i = 0;
	ShutdownBuffer = 0;
	phTTS_mem = curr_phTTS_mem;
	for (i = 0; i < NAUDIO_BUFFERS; i++) {
		pTTSbuffer[i] = (LPTTS_BUFFER_T) malloc(sizeof(TTS_BUFFER_T));
		pTTSbuffer[i]->lpData = (LPSTR)malloc(NSAMPLES * sizeof(char));
		pTTSbuffer[i]->dwMaximumBufferLength = NSAMPLES;
		pTTSbuffer[i]->lpPhonemeArray =
			(LPTTS_PHONEME_T)malloc( MAX_PHONEMES * sizeof(TTS_PHONEME_T));
		pTTSbuffer[i]->dwMaximumNumberOfPhonemeChanges = MAX_PHONEMES;
		pTTSbuffer[i]->lpIndexArray =
			(LPTTS_INDEX_T) malloc( MAX_INDEX_MARKS * sizeof(TTS_INDEX_T));
		pTTSbuffer[i]->dwMaximumNumberOfIndexMarks = MAX_INDEX_MARKS;
	}

	status = TextToSpeechOpenInMemory(curr_phTTS_mem, dwFormat);
	wsprintf(Line,_T("TextToSpeechOpenInMemory \t\t...\r\n"));
	WriteLine(Line);

	for (i = 0; i < NAUDIO_BUFFERS; i++)
		status = TextToSpeechAddBuffer(curr_phTTS_mem, pTTSbuffer[i]);
	status = TextToSpeechSpeak(phTTS_mem,_T("Filled Up Yes."),TTS_FORCE);
	Sleep(2000);
	wsprintf(Line,_T("TextToSpeechCloseInMemory \t\t..."));
	WriteLine(Line);
	MMStatusBank(TextToSpeechCloseInMemory(curr_phTTS_mem));
	ShutdownBuffer = 1;
	TextToSpeechSpeak(curr_phTTS_mem,_T("memory OK. "),TTS_FORCE);
	TextToSpeechSync(curr_phTTS_mem);
	for (i = 0; i < NAUDIO_BUFFERS; i++ ) {
		free(pTTSbuffer[i]->lpData);
		free(pTTSbuffer[i]->lpPhonemeArray);
		free(pTTSbuffer[i]->lpIndexArray);
		free(pTTSbuffer[i]);
	}
	ShutdownBuffer = 0;
}

/* Call Testwav(...) function three times with different wave format.
 */
void CCEapiDlg::TestWavHelp(LPTTS_HANDLE_T phTTS, char * lang) {
	TestWav(phTTS, lang, WAVE_FORMAT_1M08);
	TestWav(phTTS, lang, WAVE_FORMAT_1M16);
	TestWav(phTTS, lang, WAVE_FORMAT_08M08);
}

/* Test:  MMRESULT TextToSpeechOpenWaveOutFile( LPTTS_HANDLE_T, wchar_t *, DWORD );
 *		  MMRESULT TextToSpeechCloseWaveOutFile( LPTTS_HANDLE_T );
 */
void CCEapiDlg::TestWav(LPTTS_HANDLE_T phTTS, char * lang, DWORD dwFormat) {
	int i;
	TCHAR waveoutfile[] = TEXT("**_****.wav");

	waveoutfile[0] = lang[0];
	waveoutfile[1] = lang[1];
	switch (dwFormat) {
	case WAVE_FORMAT_1M08 :
		waveoutfile[3] = '1';
		waveoutfile[4] = 'M';
		waveoutfile[5] = '0';
		waveoutfile[6] = '8';
		break;
	case WAVE_FORMAT_1M16 :
		waveoutfile[3] = '1';
		waveoutfile[4] = 'M';
		waveoutfile[5] = '1';
		waveoutfile[6] = '6';
		break;
	case WAVE_FORMAT_08M08 :
		waveoutfile[3] = '8';
		waveoutfile[4] = 'M';
		waveoutfile[5] = '0';
		waveoutfile[6] = '8';
		break;

	}
	wsprintf(Line, _T("TextToSpeechOpenWaveOutFile - "));
	WriteLine(Line);
	for (i = 3; i < 7; i++)
	{
		wsprintf(Line, _T("%c"),waveoutfile[i]);
		WriteLine(Line);
	}
	wsprintf(Line, _T("\t..."));
	WriteLine(Line);
	MMStatusBank(TextToSpeechOpenWaveOutFile( phTTS,waveoutfile,dwFormat));

	m_textBox.SetWindowText(_T("Hi, I am a Wave file."));
	TextToSpeechSpeak(phTTS, TEXT("Hi, I am a Wave file."),TTS_FORCE);
	TextToSpeechSync(phTTS);
	wsprintf(Line, _T("TextToSpeechCloseWaveOutFile \t\t..."));
	WriteLine(Line);
	MMStatusBank(TextToSpeechCloseWaveOutFile( phTTS ));
}

/* Call TestLog(...) function three times with different log format.
 */
void CCEapiDlg::TestLogHelp(LPTTS_HANDLE_T phTTS, char * lang) {
	TestLog(phTTS,lang,LOG_TEXT);
	TestLog(phTTS,lang,LOG_SYLLABLES);
	TestLog(phTTS,lang,LOG_PHONEMES);
}

/* Test:  MMRESULT TextToSpeechOpenLogFile( LPTTS_HANDLE_T, PTCHAR, DWORD );
 *		  MMRESULT TextToSpeechCloseLogFile( LPTTS_HANDLE_T );
 */
void CCEapiDlg::TestLog(LPTTS_HANDLE_T phTTS, char * lang, DWORD dwFlags) {
	int i;
	TCHAR * SpeechSample = _T("Hello");
	MMRESULT status, status2;
	TCHAR * logoutfile = _T("**_****.log");
	HANDLE hFile;
	int cBufLen;
	DWORD length;
	char *pMBString;

	logoutfile[0] = lang[0];
	logoutfile[1] = lang[1];
	switch (dwFlags) {
	case LOG_TEXT :
		logoutfile[3] = 't';
		logoutfile[4] = 'e';
		logoutfile[5] = 'x';
		logoutfile[6] = 't';
		m_textBox.SetWindowText(_T("This is a Log File in Text Mode."));
		SpeechSample = _T("This is a Log File in Text Mode.");
		break;
	case LOG_PHONEMES :
		logoutfile[3] = 'p';
		logoutfile[4] = 'h';
		logoutfile[5] = 'o';
		logoutfile[6] = 'n';
		m_textBox.SetWindowText(_T("This is a Log File in Phoneme Mode."));
		SpeechSample = _T("This is a Log File in Phoneme Mode.");
		break;
	case LOG_SYLLABLES :	
		logoutfile[3] = 's';
		logoutfile[4] = 'y';
		logoutfile[5] = 'l';
		logoutfile[6] = 'l';
		m_textBox.SetWindowText(_T("This is a Log File in Syllable Mode."));
		SpeechSample = _T("This is a Log File in Syllable Mode.");
		break;
	}
	status = TextToSpeechOpenLogFile( phTTS,
									  logoutfile,
                                      dwFlags);

	TextToSpeechSpeak(phTTS,SpeechSample,TTS_FORCE);
	TextToSpeechSync(phTTS);
	status2 = TextToSpeechCloseLogFile(phTTS);
	

	wsprintf(Line, _T("TextToSpeechOpenLogFile - "));
	WriteLine(Line);
	for (i = 3; i < 7; i++)
	{
	wsprintf(Line, _T("%c"),logoutfile[i]);
	WriteLine(Line);
	}
	wsprintf(Line, _T("\t\t..."));
	WriteLine(Line);
	switch (status) {
	case MMSYSERR_NOERROR :

		/* To Check If File is Created BUT Empty */

		hFile = CreateFile(logoutfile, GENERIC_READ, FILE_SHARE_READ,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL);
		length = GetFileSize(hFile,NULL);
		pMBString = (char *)LocalAlloc(LPTR,(length * (sizeof(char) + sizeof(char))));
		cBufLen = ReadFile( hFile,pMBString,(length*(sizeof(char) + sizeof(char)) ), &dwRW, NULL);
		if ( cBufLen != -1)
		{
			wsprintf(Line, _T("Passed.\r\n"));
			WriteLine(Line);
		}
		else
		{
			wsprintf(Line, _T("Failed.\r\n"));
			WriteLine(Line);
		}
		CloseHandle( hFile );
		break;

	case MMSYSERR_INVALPARAM :
		wsprintf(Line, _T("INVALPARAM\r\n"));
		WriteLine(Line);
		break;
	case MMSYSERR_NOMEM :
		wsprintf(Line, _T("NOMEM\r\n"));
		WriteLine(Line);
		break;
	case MMSYSERR_ALLOCATED :
		wsprintf(Line, _T("ALLOCATED\r\n"));
		WriteLine(Line);
		break;
	case MMSYSERR_ERROR:
		wsprintf(Line, _T("ERROR\r\n"));
		WriteLine(Line);
		break;
	case MMSYSERR_INVALHANDLE :
		wsprintf(Line, _T("INVALHANDLE\r\n"));
		WriteLine(Line);
		break;
	}

	wsprintf(Line, _T("TextToSpeechCloseLogFile \t\t..."));
	WriteLine(Line);
	switch (status2) {
	case MMSYSERR_NOERROR :
		wsprintf(Line, _T("Passed.\r\n"));
		WriteLine(Line);
		break;
	case MMSYSERR_ERROR :
		wsprintf(Line, _T("ERROR\r\n"));
		WriteLine(Line);
		break;
	case MMSYSERR_INVALHANDLE :
		wsprintf(Line, _T("INVALHANDLE\r\n"));
		WriteLine(Line);
		break;
	}

}



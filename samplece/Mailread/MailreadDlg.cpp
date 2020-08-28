// MailreadDlg.cpp : implementation file
// COMMENTS
/* ************************************************************
 001	07/10/2000	CAB		Fixed programs inability to close after it crashes
							and added error message display to user.
 002	07/10/2000	CAB		Fixed typo to Mailread

 003	05/21/2001	MFG		Added an exit button to the appliction 
 ************************************************************
*/

#include "stdafx.h"
#include "Mailread.h"
#include "MailreadDlg.h"

#include <windows.h>
#include <msgstor2.h>
#include <msgstore.h>

#include "ttsapi.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

  static MailMsg mm;                           // MailMsg structure
  WORD wVersion;                        // Message store version number
  int count=0;							// mail message counter index
  int mailflag=0;
  MMRESULT mmStatus;
  BOOL iMarkFlag = FALSE;
  
  FID fidSaved = 0,                     // Saved directory identifier
      fidInbox = 0,                     // Inbox directory identifier
      fidOutbox = 0,                    // Outbox directory identifier
      fidActiveSync = 0,                // ActiveSync directory identifier
	  fidPop3Mail = 0;					// POP3 Mail directory identifier

/////////////////////////////////////////////////////////////////////////////
// CMailreadDlg dialog

CMailreadDlg::CMailreadDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMailreadDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMailreadDlg)
	m_mail_value = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CMailreadDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMailreadDlg)
	DDX_Control(pDX, IDC_MAIL_NUMBER, m_mail_number_box);
	DDX_Text(pDX, IDC_MAIL_NUMBER, m_mail_value);
	DDV_MaxChars(pDX, m_mail_value, 2);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CMailreadDlg, CDialog)
	//{{AFX_MSG_MAP(CMailreadDlg)
	ON_WM_HELPINFO()
	ON_BN_CLICKED(IDC_PLAY_UNREAD, OnPlayUnread)
	ON_BN_CLICKED(IDC_PLAY_MAIL, OnPlayMail)
	ON_BN_CLICKED(IDC_REPEAT_MAIL, OnRepeatMail)
	ON_BN_CLICKED(IDC_ASYNC, OnAsync)
	ON_BN_CLICKED(IDC_POP3, OnPop3)
	ON_BN_CLICKED(IDC_EXIT, OnExit)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMailreadDlg message handlers
HANDLE hMail = INVALID_HANDLE_VALUE;  // Handle to the mail con_T
LPTTS_HANDLE_T phTTS;
void TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);

BOOL CMailreadDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	MMRESULT result;
    WORD wVersion;                        // Message store version number
	TCHAR szMsg[200];                     // String for storing the debug message
    TCHAR szError[200];					  // Error string for display to user

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	CenterWindow(GetDesktopWindow());	// center to the hpc screen

	// TODO: Add extra initialization here
	phTTS = NULL;
	result = TextToSpeechStartupEx(&phTTS, WAVE_MAPPER, REPORT_OPEN_ERROR | OWN_AUDIO_DEVICE,NULL,0);
	if (result != MMSYSERR_NOERROR) 
	{
		// CAB 07/10/2000
		if ( result == MMSYSERR_INVALPARAM )
		{
				MessageBox(TEXT("Dictionary not found!"), TEXT("TTS startup failed"), MB_OK | MB_ICONSTOP);
		}
		else
		{
			swprintf( szError, TEXT("TTS startup failed\n\nError = %d\n\nExiting out of application"),
                      result );
			MessageBox(szError, TEXT("Mailread"), MB_OK | MB_ICONSTOP );
		}
		
		if (phTTS != NULL)
		{
			TextToSpeechShutdown(phTTS);
		}

		// Close dialog window
		CDialog::DestroyWindow();
		return FALSE;
	}
		TextToSpeechSpeak(phTTS,TEXT("[:mode email on]"),TTS_FORCE);
  

	if (MailOpenNotifyEx (&hMail, &wVersion, FALSE, NULL)) 
	{
		if (wVersion == 0x0300)
			wcscpy (szMsg, _T("H/PC Pro device!"));

		else if (wVersion == 0x0200)
			wcscpy (szMsg, _T("H/PC device!"));
    
		else
		{

		MailClose (hMail);
	    MessageBox(TEXT("Failed to get version"), TEXT("DECtalk E-Mail Reader"), MB_OK);
		return FALSE;
		}
	}
	else
	{
	  MailClose (hMail);
	  MessageBox(TEXT("Failed to Open MailBox"), TEXT("DECtalk E-Mail Reader"), MB_OK);
      return FALSE;
	}


	//by default open Active Sync Mail Box
	//Check Async radio button by default
	CheckRadioButton(IDC_ASYNC,IDC_POP3,IDC_ASYNC);
	OnAsync(); 


	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CMailreadDlg::OnHelpInfo()
{
	// TODO: implement help here
	MessageBox(_T("Help"));
}



void CMailreadDlg::OnPlayUnread() 
{
wchar_t wcount[1];
wchar_t textstr[16];

count=0;

		//if text is playing flush out
		mmStatus = TextToSpeechReset(phTTS, FALSE);                
                if ( mmStatus )
                    MessageBox(NULL,TEXT("TextToSpeechReset"),MB_OK | MB_ICONSTOP );


				// TODO: Add your control notification handler code here
	 mm.dwFlags = MAIL_GET_BODY | MAIL_STATUS_UNREAD;
	 if (MailFirstEx (hMail, &mm, &fidInbox, NULL))
	 {	
		 TextToSpeechSpeak(phTTS,TEXT("Reading unread mail messages.[:sync]"),TTS_FORCE);
		do
		{
		count++;		
		_itow(count,wcount,10);	//convert the integer to unicode ascii
		
		TextToSpeechSpeak(phTTS,TEXT("Mail Message number [:sync]"),TTS_FORCE);
		TextToSpeechSpeak(phTTS,wcount,TTS_FORCE);
		

			wcscpy(textstr,wcount);
			if (count==1)
			wcscat(textstr,_T(" message"));
			else
			wcscat(textstr,_T(" messages"));

			m_mail_number_box.SetWindowText(textstr);
			

		//get who the message is from	 
		TextToSpeechSpeak(phTTS,TEXT("From, "),TTS_FORCE); 
		TextToSpeechSpeak(phTTS,MailGetField(&mm,TEXT("From"),FALSE),TTS_FORCE);

		//get subject
		if (*MailGetField(&mm,TEXT("Subject"),FALSE)!=NULL)
		{
		TextToSpeechSpeak(phTTS,MailGetField(&mm,TEXT("Subject"),TRUE),TTS_FORCE);
		TextToSpeechSpeak(phTTS,MailGetField(&mm,TEXT("Subject"),FALSE),TTS_FORCE);
		}
		else
		TextToSpeechSpeak(phTTS,TEXT("No Subject, "),TTS_FORCE); 
		
		//get body
		TextToSpeechSpeak(phTTS,TEXT("Message received, "),TTS_FORCE); 
		TextToSpeechSpeak(phTTS,mm.szBody, TTS_NORMAL);
		TextToSpeechSpeak(phTTS,TEXT("[:i m 1][:sync]"),TTS_FORCE); 

		MailFree (&mm);
		mm.dwFlags = MAIL_GET_BODY | MAIL_STATUS_UNREAD;


		}while (MailNextEx (hMail, &mm, &fidInbox, NULL));


	 TextToSpeechSpeak(phTTS,TEXT("All unread mail messages have been read"),TTS_FORCE);
	 }
	 else
	 {
	 TextToSpeechSpeak(phTTS,TEXT("There are no unread mail messages"),TTS_FORCE);
	 }

	 
}


void CMailreadDlg::PostNcDestroy() 
{
	// TODO: Add your specialized code here and/or call the base class
	OnExit();
//	if (phTTS != NULL)	TextToSpeechShutdown(phTTS);
//    MailClose (hMail); //close mail handle

	CDialog::PostNcDestroy();
}


// play unread mail one at a time
void CMailreadDlg::OnPlayMail(BOOL get_message) 
{
BOOL status=FALSE;
	// TODO: Add your control notification handler code here

wchar_t wcount[1];
wchar_t textstr[16];

	//if text is playing flush out
	 mmStatus = TextToSpeechReset(phTTS, FALSE);                
                if ( mmStatus )
                    MessageBox(NULL,TEXT("TextToSpeechReset"),MB_OK | MB_ICONSTOP );

	 mm.dwFlags = MAIL_GET_BODY | MAIL_STATUS_UNREAD;

	if(get_message)
	{
		if(mailflag==0)
		{
		status=MailFirstEx (hMail, &mm, &fidInbox, NULL);
		count=0;
		}
		else
			status=MailNextEx (hMail, &mm, &fidInbox, NULL);

		count++; //increment mail counter
	}
	else
	{
		status = MailGet(hMail, &mm);	
	}

	 if(status)
	 {		
		mailflag=1;

		_itow(count,wcount,10);	//convert the integer to unicode ascii
	

		TextToSpeechSpeak(phTTS,TEXT("Mail Message number, "),TTS_FORCE);
		TextToSpeechSpeak(phTTS,wcount,TTS_FORCE);

			wcscpy(textstr,_T("message "));
			wcscat(textstr,wcount);
			m_mail_number_box.SetWindowText(textstr);


		//get who the message is from	 
		TextToSpeechSpeak(phTTS,MailGetField(&mm,TEXT("From"),TRUE),TTS_FORCE);
		TextToSpeechSpeak(phTTS,MailGetField(&mm,TEXT("From"),FALSE),TTS_FORCE);

		//get subject
		if (*MailGetField(&mm,TEXT("Subject"),FALSE)!=NULL)
		{
		TextToSpeechSpeak(phTTS,MailGetField(&mm,TEXT("Subject"),TRUE),TTS_FORCE);
		TextToSpeechSpeak(phTTS,MailGetField(&mm,TEXT("Subject"),FALSE),TTS_FORCE);
		}
		else
		TextToSpeechSpeak(phTTS,TEXT("No Subject, "),TTS_FORCE); 
		
		//get body
		TextToSpeechSpeak(phTTS,TEXT("Message received, "),TTS_FORCE); 

		TextToSpeechSpeak(phTTS,mm.szBody, TTS_NORMAL);

		MailFree (&mm);
		
	 }
	 else
	 {
	 TextToSpeechSpeak(phTTS,TEXT("There are no more unread mail messages"),TTS_FORCE);
	 mailflag=0;
	 count=0;
	 }


}

void CMailreadDlg::OnRepeatMail() 
{
	// TODO: Add your control notification handler code here

	// call play mail but don't access a new message
	if(mailflag!=0)
		OnPlayMail(FALSE);
	
}

void CMailreadDlg::OnAsync() 
{

	mailflag=0;
	count=0;
		
	// TODO: Add your control notification handler code here
  // Retrieve the identification number of the mail directory ActiveSync
  // from the message store
  if (!MailGetFolderIdEx (hMail, MAIL_FOLDER_NONE, &fidActiveSync, 
                          _T("ActiveSync")))
	{
	  MailClose (hMail);
	  MessageBox(TEXT("Failed to Get folder ID"), TEXT("DECtalk E-Mail Reader"), MB_OK);
      return;
	}
  // Retrieve the identification number of the mail directory Outbox
  // under "ActiveSync" from the message store
  if (!MailGetFolderIdEx (hMail, fidActiveSync, &fidInbox, 
                          _T("Inbox")))
	{
	  MailClose (hMail);
	  MessageBox(TEXT("Failed to Get Inbox folder ID"), TEXT("DECtalk E-Mail Reader"), MB_OK);
      return;
	}
	



}

void CMailreadDlg::OnPop3() 
{
	// TODO: Add your control notification handler code here

	mailflag=0;
	count=0;

  // Retrieve the identification number of the mail directory POP3 Mail
  // from the message store
  if (!MailGetFolderIdEx (hMail, MAIL_FOLDER_NONE, &fidPop3Mail, 
                          _T("POP3 Mail")))
	{
	  MailClose (hMail);
	  MessageBox(TEXT("Failed to Get POP3 folder ID"), TEXT("DECtalk E-Mail Reader"), MB_OK);
	  return;
	}
  // Retrieve the identification number of the mail directory Outbox
  // under "ActiveSync" from the message store
  if (!MailGetFolderIdEx (hMail, fidPop3Mail, &fidInbox, 
                          _T("Inbox")))
	{
	  MailClose (hMail);
	  MessageBox(TEXT("Failed to Get POP3 Inbox folder ID"), TEXT("DECtalk E-Mail Reader"), MB_OK);
      return;
	}


	
}


void CMailreadDlg::OnExit() 
{
	// TODO: Add your control notification handler code here
    MailClose (hMail); //close mail handle
	if (phTTS != NULL)	TextToSpeechShutdown(phTTS);

	CDialog::DestroyWindow();
}


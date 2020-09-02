// ceAgentDlg.cpp : implementation file
// *************************************************************************************
/* COMMENTS
/*
	6/15/00		CAB		Need to close every open key if that same key might be later deleted.
						If so, you can't delete the key if the key was lefted opened earlier
						in the program.
	6/22/00		CAB		Changed  DTALK_"lang".Dic to lower letters except cor the "lang" part because
						it fails to load in mips device otherwise
	08/02/00	CAB		Created delete for HKEYCURRENTUSER root key.
	11/21/00    CAB		Fixed count, put breaks in switch statements and removed m_ml_lang_button.
	11/28/00	CAB		Removed ml code and extra count if statments
	03/03/01	MFG		Added french support
	03/04/01	MFG		Fixed the ML
*/

#include "stdafx.h"
#include "ceAgent.h"
#include "ceAgentDlg.h"
#include <tchar.h>
#include <winuser.h>		// For MessageBoxEx call
#include <winreg.h>			// Registry functions calls
#include <rapi.h>
#include <string.h>			// String functions

#define COOP_H
#include "coop.h"			// For license and registry info
#undef COOP_H

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define MAXPATH 260			// Max path length for registry
#define ARRAYSIZE(hArray) sizeof(hArray) / sizeof(HANDLE);		// Use for initailizing ce connection

enum						// For CeRegInitEx()
{
	WAD_ALLINPUT = 0x0000,
	WAD_SENDMESSAGE = 0x0001
};


// use to determine if it has language or not
#define OFF		0
#define ON		1

#define PATH	"SOFTWARE\\" COMPANY "\\" PRODUCT 		// Path for registry
#define PATH_ML	"Software\\" COMPANY "\\" PRODUCT "\\" "Langs"		// for multi language 


#define NUMBER_OF_LANGUAGES		5	// Languages available

#define US			L"US"			// Languages prefix
#define UK			L"UK"
#define	GR			L"GR"
#define SP			L"SP"
#define LA			L"LA"
#define FR			L"FR"
#define ML			L"ML"

// Names of strings in registry of ce
#define LANGUAGES		L"Language"
#define MAIN_DICT		L"MainDict"
#define MULTI_LANG		L"MultiLang"
#define DEFAULT_LANG	L"DefaultLang"

#define LANG_US		L"ENGLISH, US"	// value of Languages string in registry	
#define LANG_UK		L"ENGLISH, UK"
#define LANG_GR		L"GERMAN"
#define LANG_SP		L"SPANISH"
#define LANG_LA		L"LATIN AMERICAN"
#define LANG_FR		L"FRENCH"
#define LANG_ML     L"1"

// Changed to lower letters because it fails to load in mips device
#define DICT_US		L"DTALK_US.DIC"		// value of MainDict string in registry
#define DICT_UK		L"DTALK_UK.DIC"
#define DICT_GR		L"DTALK_GR.DIC"
#define DICT_SP		L"DTALK_SP.DIC"
#define DICT_LA		L"DTALK_LA.DIC"
#define DICT_FR		L"DTALK_FR.DIC"

// User dictionaries
#define USER_US		L"USER_US.DIC"
#define USER_UK		L"USER_UK.DIC"
#define USER_GR		L"USER_GR.DIC"
#define USER_SP		L"USER_SP.DIC"
#define USER_LA		L"USER_LA.DIC"
#define USER_FR		L"USER_FR.DIC"

#define US_LANG		"ENGLISH"		// For MessageBoxEx() display
#define UK_LANG		"ENGLISH UK"
#define GR_LANG		"GERMAN"
#define SP_LANG		"SPANISH"
#define LA_LANG		"LATIN AMERICAN"
#define FR_LANG		"FRENCH"
// Functions

 
enum Languages			// Ce registry
{
	english = OFF,
	english_uk = OFF,
	german = OFF,
	spanish = OFF,
	spanish_la = OFF,
	french = OFF,
	multi_lang = OFF
};


/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCeAgentDlg dialog

CCeAgentDlg::CCeAgentDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CCeAgentDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CCeAgentDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CCeAgentDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CCeAgentDlg)
	DDX_Control(pDX, IDC_PROGRESS, m_progress_bar);
	DDX_Control(pDX, IDC_EDIT_REGISTRY, m_edit_registry_button);
	DDX_Control(pDX, IDC_DELETE_LANG, m_delete_lang_button);
	DDX_Control(pDX, IDC_SP_LANG, m_sp_lang_button);
	//DDX_Control(pDX, IDC_ML_LANG, m_ml_lang_button);
	DDX_Control(pDX, IDC_LA_LANG, m_la_lang_button);
	DDX_Control(pDX, IDC_GR_LANG, m_gr_lang_button);
	DDX_Control(pDX, IDC_UK_LANG, m_uk_lang_button);
	DDX_Control(pDX, IDC_US_LANG, m_us_lang_button);
	DDX_Control(pDX, IDC_FR_LANG, m_fr_lang_button);
 	//DDX_Control(pDX, IDC_DEFAULT_US, m_us_default_button);
	//DDX_Control(pDX, IDC_DEFAULT_UK, m_uk_default_button);
	//DDX_Control(pDX, IDC_DEFAULT_GR, m_gr_default_button);
	//DDX_Control(pDX, IDC_DEFAULT_SP, m_sp_default_button);
	//DDX_Control(pDX, IDC_DEFAULT_LA, m_la_default_button);

	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CCeAgentDlg, CDialog)
	//{{AFX_MSG_MAP(CCeAgentDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_DESTROY()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//ON_BN_CLICKED(IDC_English_Dll, OnEnglishDll_BN_Clicked)
	ON_BN_CLICKED(IDC_EDIT_REGISTRY, OnEditRegistry_BN_CLICKED)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CCeAgentDlg message handlers

BOOL CCeAgentDlg::OnInitDialog()
{
	CDialog::OnInitDialog();
	
	/*******************/
	// CB REMOVE
	//CCeAgentDlg m_dlg;
	//m_dlg.Create(IDD_PROGRESS_DIALOG, this);
	/*******************/

	// Add "About..." menu item to system menu
	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CCeAgentDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

void CCeAgentDlg::OnDestroy()
{
	WinHelp(0L, HELP_QUIT);
	CDialog::OnDestroy();
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CCeAgentDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CCeAgentDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CCeAgentDlg::OnEnglishDll_BN_Clicked() 
{
	// TODO: Add your control notification handler code here
	
	/*TCHAR pFile[MAXPATH] = TEXT("\\English.txt");
	TCHAR ceFileName[MAXPATH] = TEXT("\\Ennglish.txt");
	BOOL fileTransfer;
	DWORD error;

	fileTransfer = CeMoveFile((const unsigned short *)pFile, (const unsigned short *)ceFileName);
	error = GetLastError();
	
		if (fileTransfer)
		MessageBox(NULL, TEXT("OK"), MB_OK | MB_APPLMODAL);
	else
		MessageBox(NULL, TEXT("No"), MB_OK | MB_APPLMODAL);
	*/
}

void CCeAgentDlg::OnEditRegistry_BN_CLICKED() 
{
	
	// add checks for string size for overflow
	
	
	// TODO: Add your control notification handler code here
	HKEY hkeyLocalMachine = HKEY_LOCAL_MACHINE;		// key of default registry
	HKEY hkeyCurrentUser = HKEY_CURRENT_USER;		// key of default registry
	char regPath[MAXPATH] = PATH "\\" VERSION;		// subkey  of software info in desktop
	wchar_t CeRegPath[MAXPATH];						// subkey  of software info in ce
	DWORD dwType = REG_SZ;				// Type of data in string value to display as characters not numbers
	//wchar_t hkeyClass[MAXPATH];		// Type of class of subkey
	//DWORD hkeyStatus = 0;			    // Status of subkey: created or opened
	//char data[MAXPATH];
	DWORD size = 200;				    // Size of string value
	DWORD retValue = 0;			        // Return value of function
	DWORD multiLang = 0;		//	
	//	wchar_t Buf[MAXPATH];
	wchar_t	language[20] = LANG_US;		// Language string
	wchar_t mainDict[20] = DICT_US;		// Dictionary string
	//wchar_t license[20] = L"";
	wchar_t lang[3] = US;				// Language
	int len = 0;				        // Length of string
	int response = 0;			        // Reply for mesagebox
	bool ifDone = FALSE;		        // If done
	RAPIINIT rapiinit = { sizeof(RAPIINIT) };		// setup for  CeRapiInitEx
	HRESULT hresult;	
	HANDLE hExit = NULL;
	HANDLE hWait[] = {hExit, rapiinit.heRapiInit};
	enum {WAIT_EXIT = WAIT_OBJECT_0, WAIT_INIT};
	DWORD handleCount = 0;
	DWORD dwObj;
	DWORD dwStart = GetTickCount();
	DWORD dwTimeout = 1000;
	DWORD dwTimeLeft = dwTimeout;
	UINT UFlags = 1;
	MSG msg;
	bool us = FALSE, uk = FALSE, gr = FALSE, sp = FALSE, la = FALSE, ml = FALSE, fr = FALSE; //determine if registry has language or not
	wchar_t defaultLang[3] = L"0";	// If multilang or not
	int count = 0;					// Counts the languages selected
	int counter = 0;				// Counts number of langauges installed already
	//m_us_lang_button.EnableWindow(TRUE);
	//m_us_lang_button.SetState(1);
	//m_uk_lang_button.SetCheck(TRUE);
	//m_us_lang_button.UpdateData(TRUE);
	//m_uk_lang_button.UpdateData(TRUE);
	

	// Checks if a language was selected 
	if ( (m_us_lang_button.GetCheck() == 0) && (m_uk_lang_button.GetCheck() == 0) && (m_gr_lang_button.GetCheck() == 0) &&
		 (m_sp_lang_button.GetCheck() == 0) && (m_la_lang_button.GetCheck() == 0) && (m_fr_lang_button.GetCheck() == 0) )
	{
		MessageBoxEx(m_hWnd, "No language was selected", "Error",  MB_OK | MB_APPLMODAL, LANG_ENGLISH );
		return;
	}



	if ( ( GetCheckedRadioButton(IDC_DEFAULT_US, IDC_DEFAULT_LA) != 0 )  && ( m_us_lang_button.GetCheck() ||
         m_uk_lang_button.GetCheck() || m_gr_lang_button.GetCheck() || m_sp_lang_button.GetCheck() ||
		 m_la_lang_button.GetCheck() )
		 && ( m_us_lang_button.GetCheck() || m_uk_lang_button.GetCheck() || m_gr_lang_button.GetCheck() || m_sp_lang_button.GetCheck() ) )
	{
		MessageBoxEx(m_hWnd, "You can only pick one language if you want to set up a default language", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
		return ;
	}

  // Allow user to cancel or continue
	if (!m_delete_lang_button.GetCheck() )
	{
		response = MessageBoxEx(m_hWnd, "Do you want to update registry?", "Ce Agent",  MB_YESNOCANCEL | MB_APPLMODAL, LANG_ENGLISH );
		// User doesn't want to update
		if ( response == IDNO || response == IDCANCEL )
		{
			return ;
		}
	}

	
	// Copy subkey for ce device
	len = strlen(regPath);
	// Convert char to unicode
	mbstowcs(CeRegPath, regPath, len);
	// Needs to put NULL terminator to string otherwise error will occur
	CeRegPath[len] = '\0';

	// Status of work beign done
	//DoModal(
	m_progress_bar.SetPos(10);

	// Initialize remote RAPI on Ce device
	hresult = CeRapiInitEx( &rapiinit );
	
	// If initialially fail to connect
	if ( FAILED(hresult) )
	{
			MessageBoxEx(m_hWnd, "Could not connect to device. Make sure that the ce device is connected.",
			         "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
			m_progress_bar.SetPos(0);
			return ;
	}
	

	handleCount = sizeof(hWait) / sizeof(HANDLE);
	for (;;)
	{
		dwObj = MsgWaitForMultipleObjects( handleCount,						//Number of handles
			                               hWait,							// pointer to the object-handle array 
										   FALSE,							// Specify how to wait
										   dwTimeout,						// time-out interval in milliseconds
										   UFlags & WAD_SENDMESSAGE ? QS_SENDMESSAGE : QS_ALLINPUT);
																			// type of input events to wait for );     
		
		if ( dwObj == (DWORD) - 1 )
		{
			dwObj = WaitForMultipleObjects( handleCount,
				                            hWait,
											FALSE,
											100);
			if ( dwObj == (DWORD) - 1 )
			{
				break;
			}
		}
		else
		{
			if ( dwObj == WAIT_OBJECT_0) 
			{
				break;
			}
		}

		if ( (UINT) (dwObj - WAIT_OBJECT_0) < handleCount)
		{
			break;
		}
		
		if (UFlags & WAD_SENDMESSAGE)
		{
			PeekMessage(&msg, NULL, 0, 0, PM_NOREMOVE);
		}
		else
		{
			while ( PeekMessage(&msg, NULL, 0, 0, PM_REMOVE) )
			{
				DispatchMessage(&msg);
			}
		}
		
		if (INFINITE != dwTimeout)
		{
			dwTimeLeft = dwTimeout - (GetTickCount() - dwStart);
			if ( (int)dwTimeout < 0 )
			{	
				break;
			}
		}
	
		// Event signaled by RAPI
		if (dwObj == WAIT_INIT)
		{
			// If the connection failed, unitialize the windows CE RAPI
			if ( FAILED(rapiinit.hrRapiInit) )
			{
				CeRapiUninit();
				MessageBoxEx(m_hWnd, "Could not connect to device. Make sure that the ce device is connected.",
			                 "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );	
				// Resets status bar
				m_progress_bar.SetPos(0);
				return ;
			}
		}
		else
		{
			// Either event signaled by user or a time-out occured.
			MessageBoxEx(m_hWnd, "Could not connect to device. Make sure that the ce device is connected.",
			             "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );		
			CeRapiUninit();
			// Resets status bar
			m_progress_bar.SetPos(0);
			return ;
		}
	}
	
	if ( !m_delete_lang_button.GetCheck() )
	{
		ifDone = Copy_License(hkeyLocalMachine, dwType, count);
		// Checks if error occurred
		if ( ifDone == FALSE )
		{
			return ;
		}
	}
	
	// Check registry if deleting
	ifDone = Check_Registry(hkeyLocalMachine, us, uk, gr, sp, la, fr, ml, defaultLang);
	if ( ifDone == FALSE )
	{
		// Registry is corrupted
		return ;
	}
	else if ( ( ifDone = TRUE )  && ( !m_delete_lang_button.GetCheck() ) ) 
	{
		if ( us == TRUE )
		{
			count++;
			if ( (m_us_lang_button.GetCheck() == 1) )
			{
				MessageBoxEx(m_hWnd, "The ENGLISH language already installed!", "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );		
				counter++;
			}

			if ( (m_uk_lang_button.GetCheck() == 0 ) && ( m_gr_lang_button.GetCheck() == 0 ) && ( m_sp_lang_button.GetCheck() == 0 )
				 && ( m_la_lang_button.GetCheck() == 0 ) && ( m_fr_lang_button.GetCheck() == 0 ))
			{
				return ;
			}
			
		}
		
		if ( (uk == TRUE) )
		{
			count++;
			if ( (m_uk_lang_button.GetCheck() == 1) )
			{
				MessageBoxEx(m_hWnd, "The ENGLISH UK language already installed!", "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );		
				counter++;
			}

			if ( (m_us_lang_button.GetCheck() == 0 ) && ( m_gr_lang_button.GetCheck() == 0 ) && ( m_sp_lang_button.GetCheck() == 0 )
				 && ( m_la_lang_button.GetCheck() == 0 ) && ( m_fr_lang_button.GetCheck() == 0 ))
			{
				return ;
			}
		}
		
		if ( (gr == TRUE) )
		{
			count++;
			if ( (m_gr_lang_button.GetCheck() == 1) )
			{
				MessageBoxEx(m_hWnd, "The GERMAN language already installed!", "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );		
				counter++;
			}
			
			if ( (m_us_lang_button.GetCheck() == 0 ) && (m_uk_lang_button.GetCheck() == 0 ) && ( m_sp_lang_button.GetCheck() == 0 )
				 && ( m_la_lang_button.GetCheck() == 0 ) && ( m_fr_lang_button.GetCheck() == 0 ))
			{
				return ;
			}
		}

		if ( (sp == TRUE) )
		{
			count++;
			if ( (m_sp_lang_button.GetCheck() == 1) )
			{
				MessageBoxEx(m_hWnd, "The SPANISH language already installed!", "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );		
				counter++;
			}

			if ( (m_us_lang_button.GetCheck() == 0 ) && (m_uk_lang_button.GetCheck() == 0 ) && ( m_gr_lang_button.GetCheck() == 0 ) 
				 && ( m_la_lang_button.GetCheck() == 0 ) && ( m_fr_lang_button.GetCheck() == 0 ) )
			{
				return ;
			}
			
		}

		if ( (fr == TRUE) )
		{
			count++;
			if ( (m_fr_lang_button.GetCheck() == 1) )
			{
				MessageBoxEx(m_hWnd, "The FRENCH language already installed!", "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );		
				counter++;
			}

			if ( (m_us_lang_button.GetCheck() == 0 ) && (m_uk_lang_button.GetCheck() == 0 ) && ( m_gr_lang_button.GetCheck() == 0 ) 
				 && ( m_la_lang_button.GetCheck() == 0 ) && ( m_sp_lang_button.GetCheck() == 0 ) )
			{
				return ;
			}
			
		}

		if ( (la == TRUE)  )
		{
			count++;
			if ( (m_la_lang_button.GetCheck() == 1) )
			{
				MessageBoxEx(m_hWnd, "The LATIN AMERICAN language already installed!", "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );		
				counter++;
			}

			if ( (m_fr_lang_button.GetCheck() == 0 ) && (m_us_lang_button.GetCheck() == 0 ) 
				&& (m_uk_lang_button.GetCheck() == 0 ) && ( m_gr_lang_button.GetCheck() == 0 ) && ( m_sp_lang_button.GetCheck() == 0 ) )
			{
				return ;
			}
		}
        
           
		if ( (m_us_lang_button.GetCheck() == 1) && (us != 1) )
		{
			count++;
		}
		if ( (m_uk_lang_button.GetCheck() == 1 )&& ( uk != 1) )
		{
			count++;
		}
		if ( (m_gr_lang_button.GetCheck() == 1) && (gr != 1) )
		{
			count++;
		}
		if ( (m_sp_lang_button.GetCheck() == 1 ) && (sp != 1) )
		{
			count ++;
		}
		if ( (m_la_lang_button.GetCheck() == 1 )&& (la != 1) )
		{
			count++;
		}
		if ( (m_fr_lang_button.GetCheck() == 1 )&& (fr != 1) )
		{
			count++;
		}
		
		if ( (counter - count) == 0 )
		{
			m_progress_bar.SetPos(0);
			return ;	// language(s) already installed
		}

		if (count >= 2 )
		{
			ml = TRUE;
		}
	}
	
	// Checks if the check box for a specfic lang is checked off
	/*if ( m_ml_lang_button.GetCheck() )
	{
		//if ( count == 1)
		//	m_progress_bar.SetPos(90);
		//else
			m_progress_bar.SetPos(50);

		wcscpy(lang, ML);
		len = wcslen(lang);
		lang[len] = '\0';
		
		// Checked if user wants to delete registry for a specfic language
		if( m_delete_lang_button.GetCheck() )
		{
			if (ml == FALSE)
			{
				MessageBoxEx(m_hWnd, "Multi Language support has already been deleted", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				if ( count == 1 )
				{
					m_progress_bar.SetPos(0);
					return ;
				}
				count--;
			}
			else
			{
				ifDone = Delete_Key(hkeyLocalMachine, hkeyCurrentUser, lang, dwType, count, us, uk, gr, sp, la, ml, defaultLang );
				if ( ifDone == TRUE )
				{
					return ;
				}

				count--;
			}	
		}	
		else	
		{
			
			ifDone = Create_Lang_Key(hkeyLocalMachine, hkeyCurrentUser, dwType, language, mainDict, lang, count, us, uk, gr,
				                     sp, la, ml);
			// Checks if error occur, user cancelled operation or finished shkeyCurrentUseruccessfully
			if ( ifDone == TRUE )
			{
				return ;
			}
			count--;
		}
	}
	*/

	if ( m_fr_lang_button.GetCheck() )
	{	
		if ( count == 1)
			m_progress_bar.SetPos(90);
		else
			GetStatus(count);

		wcscpy(lang, FR);
		len = wcslen(lang);
		lang[len] = '\0';
		wcscpy(language, LANG_FR);
		wcscpy(mainDict, DICT_FR);		
		
		// Checked if user wants to delete registry for a specfic language
		if( m_delete_lang_button.GetCheck() )
		{
			if (fr == FALSE)
			{
				MessageBoxEx(m_hWnd, "The FRENCH Language has already been deleted", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_FRENCH );
				
				if ( count == 1 )
				{
					m_progress_bar.SetPos(0);
					return ;
				}
				count--;
			}
			else
			{
				ifDone = Delete_Key(hkeyLocalMachine, hkeyCurrentUser, lang,  dwType, count, us, uk, gr, sp, la, fr, ml, defaultLang );
				if ( ifDone == TRUE)
				{
					return ;
				}
				count--;
			}
		}
		else
		{
			ifDone = Create_Lang_Key(hkeyLocalMachine, hkeyCurrentUser, dwType, language, mainDict, lang, count, us, uk, gr,
				                     sp, la, fr, ml);
		
			// Checks if error occur, user cancelled operation or finished successfully
			if ( ifDone == TRUE )
			{
				return ;
			}
			count--;	
		}
	}
	



	if ( m_us_lang_button.GetCheck() )
	{	
		if ( count == 1)
			m_progress_bar.SetPos(90);
		else
			GetStatus(count);

		wcscpy(lang, US);
		len = wcslen(lang);
		lang[len] = '\0';
		wcscpy(language, LANG_US);
		wcscpy(mainDict, DICT_US);		
		
		// Checked if user wants to delete registry for a specfic language
		if( m_delete_lang_button.GetCheck() )
		{
			if (us == FALSE)
			{
				MessageBoxEx(m_hWnd, "The ENGLISH Language has already been deleted", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				
				if ( count == 1 )
				{
					m_progress_bar.SetPos(0);
					return ;
				}
				count--;
			}
			else
			{
				ifDone = Delete_Key(hkeyLocalMachine, hkeyCurrentUser, lang,  dwType, count, us, uk, gr, sp, la, fr, ml, defaultLang );
				if ( ifDone == TRUE)
				{
					return ;
				}
				count--;
			}
		}
		else
		{
			ifDone = Create_Lang_Key(hkeyLocalMachine, hkeyCurrentUser, dwType, language, mainDict, lang, count, us, uk, gr,
				                     sp, la, fr, ml);
		
			// Checks if error occur, user cancelled operation or finished successfully
			if ( ifDone == TRUE )
			{
				return ;
			}
			count--;	
		}
	}
	
	
	if ( m_uk_lang_button.GetCheck() )
	{
		
		if ( count == 1)
			m_progress_bar.SetPos(90);
		else
			GetStatus(count);

		wcscpy(lang, UK);
		wcscpy(language, LANG_UK);
		wcscpy(mainDict, DICT_UK);
		
		// Checked if user wants to delete registry for a specfic language
		if( m_delete_lang_button.GetCheck() )
		{
			if (uk == FALSE)
			{
				MessageBoxEx(m_hWnd, "The ENGLISH UK Language has already been deleted", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				
				if ( count == 1 )
				{
					m_progress_bar.SetPos(0);
					return ;
				}
				count--;
			}
			else
			{
				ifDone = Delete_Key(hkeyLocalMachine, hkeyCurrentUser, lang, dwType, count, us, uk, gr, sp, la, fr, ml, defaultLang );
				if ( ifDone == TRUE)
				{
					return ;
				}
				count--;
			}
		}
		else
		{
			ifDone = Create_Lang_Key(hkeyLocalMachine, hkeyCurrentUser, dwType, language, mainDict, lang, count, us, uk, gr,
				                     sp, la, fr, ml);
			
			// Checks if error occur, user cancelled operation or finished successfully
			if ( ifDone == TRUE )
			{
				return ;
			}
			count--;
		}
	}
	
	
	if ( m_gr_lang_button.GetCheck() )
	{
		if ( count == 1)
			m_progress_bar.SetPos(90);
		else
			GetStatus(count);

		wcscpy(lang, GR);
		wcscpy(language, LANG_GR);
		wcscpy(mainDict, DICT_GR);
		
		// Checked if user wants to delete registry for a specfic language
		if( m_delete_lang_button.GetCheck() )
		{
			if (gr == FALSE)
			{
				MessageBoxEx(m_hWnd, "The GERMAN Language has already been deleted", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				
				if ( count == 1 )
				{
					m_progress_bar.SetPos(0);
					return ;
				}
				count--;
			}
			else
			{
				ifDone = Delete_Key(hkeyLocalMachine, hkeyCurrentUser, lang, dwType, count, us, uk, gr, sp, la, fr, ml, defaultLang );
				if ( ifDone == TRUE)
				{
					return ;
				}
				count--;
			}
		}
		else
		{
			ifDone = Create_Lang_Key(hkeyLocalMachine, hkeyCurrentUser, dwType, language, mainDict, lang, count, us, uk, gr,
				                     sp, la, fr, ml);
			// Checks if error occur, user cancelled operation or finished successfully
			if ( ifDone == TRUE )
			{
				return ;
			}
			count--;
		}
	}
	
	
	if ( m_sp_lang_button.GetCheck() )
	{
		if ( count == 1)
			m_progress_bar.SetPos(90);
		else
			GetStatus(count);

		wcscpy(lang, SP);
		wcscpy(language, LANG_SP);
		wcscpy(mainDict, DICT_SP);
		
		// Checked if user wants to delete registry for a specfic language
		if( m_delete_lang_button.GetCheck() )
		{
			if (sp == FALSE)
			{
				MessageBoxEx(m_hWnd, "The SPANISH Language has already been deleted", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				
				if ( count == 1 )
				{
					m_progress_bar.SetPos(0);
					return ;
				}
				count--;
			}
			else
			{
				ifDone = Delete_Key(hkeyLocalMachine, hkeyCurrentUser, lang, dwType, count, us, uk, gr, sp, la, fr, ml, defaultLang );
				if ( ifDone == TRUE)
				{
					return ;
				}
				count--;
			}
		}
		else
		{
			ifDone = Create_Lang_Key(hkeyLocalMachine, hkeyCurrentUser, dwType, language, mainDict, lang, count, us, uk, gr,
				                     sp, la, fr, ml);
			// Checks if error occur, user cancelled operation or finished successfully
			if ( ifDone == TRUE )
			{
				return ;
			}
			count--;
		}
	}
	
	
	if ( m_la_lang_button.GetCheck() )
	{
		if ( count == 1)
			m_progress_bar.SetPos(90);
		else
			GetStatus(count);

		wcscpy(lang, LA);
		wcscpy(language, LANG_LA);
		wcscpy(mainDict, DICT_LA);
		
		// Checked if user wants to delete registry for a specfic language
		if( m_delete_lang_button.GetCheck() )
		{
			if (la == FALSE)
			{
				MessageBoxEx(m_hWnd, "The LATIN AMERICAN Language has already been deleted", "Error!",
					         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				
				if ( count == 1 )
				{
					m_progress_bar.SetPos(0);
					return ;
				}
				count--;
			}
			else
			{
				ifDone = Delete_Key(hkeyLocalMachine, hkeyCurrentUser, lang, dwType, count, us, uk, gr, sp, la, fr, ml, defaultLang );
				if ( ifDone == TRUE)
				{
					return ;
				}
				count--;
			}
		}
		else
		{
			ifDone = Create_Lang_Key(hkeyLocalMachine, hkeyCurrentUser, dwType, language, mainDict, lang, count, us, uk, gr,
				                     sp, la, fr, ml);
			// Checks if error occur, user cancelled operation or finished successfully
			if ( ifDone == TRUE )
			{
				return ;
			}
			count--;
		}
	}
}

/* ********************************************************************************************************************************* */
/* CopyLicense(HKEY hkeyLocalMachine, DWORD dwType, int count)
		hkey:	holds the regsitry name of HKEY_LOCAL_MACHINE
		dwType:	Type of data associated with the registry value
		count:	number of languages
		return: bool 
				FALSE  -	Error ocurred
				TRUE   -    No error
*/
/* ********************************************************************************************************************************** */

bool CCeAgentDlg::Copy_License(HKEY hkeyLocalMachine, DWORD dwType, int count)
{
	char data1[MAXPATH], data2[MAXPATH];			// Holds the license and licensepwdfor the desktop
	wchar_t license[20] = L"";		// Holds the license number for ce	
	wchar_t licensePwd[40] = L"";		// Holds the license password for ce	
	wchar_t lockMgr[10] = L"";		// Holds the lock_mgr for ce	
	char regPath[MAXPATH] = PATH "\\" VERSION;	// Path for registry
	wchar_t CeRegPath[MAXPATH];					// Path foe ce registry
	HKEY hkeyOpen;					// Open key
	DWORD hkeyStatus = 0;			// Status of subkey: created or opened
	DWORD size = MAXPATH;			// size of license number
	DWORD response = 0;				// reply from messagebox
	int len = 0;					// string length

	len =  strlen(regPath);
	memset(CeRegPath, 0 , MAXPATH);
	// Convert char to unicode
	mbstowcs(CeRegPath, regPath, len);
	CeRegPath[len] = '\0';	
	
	
	//  Checks if Ce Registry has license already 
	if ( CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpen) == ERROR_SUCCESS )
	{
		// Size of license number
		if ( CeRegQueryValueEx(hkeyOpen,	// Handle to open key
			                   L"Licenses",	// Name of key to query
							   NULL,
							   &dwType,		// Type of data
							   (LPBYTE)license,		
							   &size) == ERROR_SUCCESS) 
		{	
			// Ce device has license already
			char temp[200] = "License is already in ce device.\n Do you want to replace \n License: ";
			
			// Len of strings
			size = wcslen(license);
			len = strlen(temp);
			// Converts unicode to multibyte
			wcstombs(&temp[len], license, size); 
			strcat(temp, " ?");
			response = MessageBoxEx(m_hWnd, temp, "Ce Agent", MB_YESNO, LANG_ENGLISH );
		}
	}

	// If ce device has no license or if license will be replaced
	if ( (response == IDYES) || (response == 0) )
	{	
		HKEY hkeyDesktopLicense;	   // Open with new key
		HKEY hkeyCeLicense;			   // Open with new key
		
		// resets 
		size = MAXPATH;

		// Close key
		CeRegCloseKey(hkeyOpen);

		//  Open the registry for the destop to copy License info to ce device                               
		if ( RegOpenKeyEx(hkeyLocalMachine,				        // Root hkey
			              regPath,			        // Subkey of hkey
						  0,		
						  KEY_QUERY_VALUE,	        // access type to key
						  &hkeyDesktopLicense)		// Handle to open key
						  == ERROR_SUCCESS)
		{
			
		
			char License[MAXPATH] =  "Licenses";
			// Query the registry of destop
			if ( RegQueryValueEx(hkeyDesktopLicense,	// Handle to open key
				                 "Licenses",			// Name of key to query
								 NULL,
								 &dwType,				// Type of data
								 (LPBYTE)data1,			// Data's value
								 &size)
								 != ERROR_SUCCESS )
			{
				MessageBoxEx(m_hWnd, "Unable to open registry in desktop." , 
					         "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				// Resets status bar
				m_progress_bar.SetPos(0);
				return FALSE;
			}

			size = MAXPATH;
			if ( RegQueryValueEx(hkeyDesktopLicense,	// Handle to open key
								 "LicUpdPwd",			// Name of key to query
								 NULL,
								 &dwType,				// Type of data
								 (LPBYTE)data2,			// Data's value
								 &size)
								 != ERROR_SUCCESS )
			{
				MessageBoxEx(m_hWnd, "Unable to open registry in desktop." , 
					         "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				// Resets status bar
				m_progress_bar.SetPos(0);
				return FALSE;
			}
			
			// Close key
			RegCloseKey(hkeyDesktopLicense);

			// Create new subkeys in ce device 
			if ( CeRegCreateKeyEx(hkeyLocalMachine, CeRegPath, 0, NULL, 0, 0, NULL, &hkeyCeLicense, &hkeyStatus) == ERROR_SUCCESS )
			{
				// License
				size = strlen(data1);
				// Convert char to unicode
				mbstowcs(license, data1, size);
				license[size] = '\0';
				// Add the Null to the length
				size = size + 1;
				// Convert size to unicoded equivalent
				size *= 2;
				
				// Set the license number in ce device
				CeRegSetValueEx(hkeyCeLicense, L"Licenses", NULL, dwType, (LPBYTE)license, size);
				
				// License password
				size = strlen(data2);
				// Convert char to unicode
				mbstowcs(licensePwd, data2, size);
				licensePwd[size] = '\0';
				// Add the Null to the length
				size = size + 1;
				// Convert size to unicoded equivalent
				size *= 2;
				// Close key
				
				// Set the license number in ce device
				CeRegSetValueEx(hkeyCeLicense, L"LicUpdPwd", NULL, dwType, (LPBYTE)licensePwd, size);
				
				// Lock_MGR
				if ( count >= 2 )
				{
					wcscpy(lockMgr, L"2");
					// Add the Null to the length
					size = size + 1;
					// Convert size to unicoded equivalent
					size *= 2;
					// Set the license number in ce device
					CeRegSetValueEx(hkeyCeLicense, L"LockMgr", NULL, dwType, (LPBYTE)lockMgr, size);
				}
				else
				{
					wcscpy(lockMgr, L"1");
					// Add the Null to the length
					size = size + 1;
					// Convert size to unicoded equivalent
					size *= 2;
					// Set the license number in ce device
					CeRegSetValueEx(hkeyCeLicense, L"LockMgr", NULL, dwType, (LPBYTE)lockMgr, size);
				}
				CeRegCloseKey(hkeyCeLicense);
			}
			else
			{
				MessageBoxEx(m_hWnd, "Unable to open registry. Make sure that the ce device is connected.", "Error!",
					MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				// Resets status bar
				m_progress_bar.SetPos(0);
				return FALSE;
			}
		}
		else
		{	
			MessageBoxEx(m_hWnd, "Unable to open registry in desktop.", "Error!",
				         MB_OK | MB_APPLMODAL, LANG_ENGLISH );
			// Resets status bar
			m_progress_bar.SetPos(0);
			return FALSE;
		}
	}
	// Either copy new license or keeping old one
	return TRUE;
}

/* ********************************************************************************************************************* */
/* Create_Lang_Key(HKEY hkeyLocalMachine, HKEY hkeyCurrentUser, DWORD dwType, wchar_t *language, wchar_t *mainDict, wchar_t *lang,
                   int count, bool &us, bool &uk, bool &gr, bool &sp, bool &la, bool &ml)
		hkeyLocalMachine:	holds the regsitry name of HKEY_LOCAL_MACHINE
		dwType:	Type of data associated with the registry value
		language: String value for the given language
		mainDict: Name of the dictionary
		lang:   Name of the language  
		count:	keeps track of how many languages being added and used to display message of completed
		us:		if registry for ce has the English language
		uk:		if registry for ce has the English UK language
		gr:		if registry for ce has the German language
		sp:		if registry for ce has the Spanish language
		ml:		if registry for ce has multi language
		return:
  
*/
/* ********************************************************************************************************************** */


bool CCeAgentDlg::Create_Lang_Key(HKEY hkeyLocalMachine, HKEY hkeyCurrentUser, DWORD dwType, wchar_t *language, wchar_t *mainDict,
								  wchar_t *lang, int count, bool &us, bool &uk, bool &gr, bool &sp, bool &la, bool &fr, bool &ml)
{
	HKEY hkeyOpen;		// Open key in ce registry
	HKEY hkeyMulti;	    // Open new key
	char regPath[MAXPATH] = PATH "\\" VERSION;		// path
	wchar_t CeRegPath[MAXPATH];						// path in ce registry
	DWORD hkeyStatus;	// Status of subkey: created or opened
	DWORD size;			// size of string
	int len;			// Length of string
	
	
	len = strlen(regPath);
	memset(CeRegPath, 0, MAXPATH);
	// Convert char to unicode
	mbstowcs(CeRegPath, regPath, len);
	CeRegPath[len] = '\0';
	// Open key
	if ( CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyMulti) == ERROR_SUCCESS )
	{
		// Lock_MGR
		wchar_t multiLang[2] = L"0";
		
		if (ml == TRUE)
			wcscpy(multiLang, L"2");
		else
			wcscpy(multiLang, L"1");
		
		// must include terminatin NULL
		size = sizeof(multiLang) + 1;
		// Create multi language string
		CeRegSetValueEx(hkeyMulti, L"LockMGR", NULL, dwType, (LPBYTE)multiLang, size);
		// Close the key
		CeRegCloseKey(hkeyMulti);
	}
	
	len = strlen(regPath);
	// Convert char to unicode
	mbstowcs(CeRegPath, regPath, len);
	CeRegPath[len] = '\0';
	wcscat(CeRegPath, L"\\");
	wcscat(CeRegPath, lang);
	len = wcslen(CeRegPath);
	// Need to NULL terminate string or error will occcur
	CeRegPath[len] = '\0';
	// Create lang subkeys in ce device 
	if ( CeRegCreateKeyEx(hkeyLocalMachine, CeRegPath, 0, NULL, 0, 0, NULL, &hkeyOpen, &hkeyStatus) == ERROR_SUCCESS )
	{
		size = wcslen(language) * 2;
		// Set the language and maindict string in ce device
		CeRegSetValueEx(hkeyOpen, LANGUAGES, NULL, dwType, (LPBYTE)language, size);
		
		size = wcslen(mainDict) * 2;
		// Set the language and maindict string in ce device
		CeRegSetValueEx(hkeyOpen, MAIN_DICT, NULL, dwType, (LPBYTE)mainDict, size);	
		
		// Close the open key
		CeRegCloseKey( hkeyOpen ); 
		
		HKEY hkeyUserDic;	// New open registry
		// Create registry for user dictionary
		if ( CeRegCreateKeyEx(hkeyCurrentUser, CeRegPath, 0, NULL, 0, 0, NULL, &hkeyUserDic, &hkeyStatus) == ERROR_SUCCESS )
		{	
			wchar_t userDic[20];
			if ( ( wcscmp(lang, US) == 0 ) )
			{
				wcscpy(userDic, USER_US);
			}
			else if ( ( wcscmp(lang, UK) == 0 ) )
			{
				wcscpy(userDic, USER_UK);
			}
			else if ( ( wcscmp(lang, GR) == 0 ) )
			{
				wcscpy(userDic, USER_GR);
			}
			else if ( ( wcscmp(lang, SP) == 0 ))
			{
				wcscpy(userDic, USER_SP);
			}
			else if ( ( wcscmp(lang, FR) == 0 ))
			{
				wcscpy(userDic, USER_FR);
			}
			else // la == TRUE || m_la_lang_button.GetCheck())
			{
				wcscpy(userDic, USER_LA);
			}
			
			size =  wcslen(userDic)* 2;
			// Set the language specfic user dictionary in ce device
			CeRegSetValueEx(hkeyUserDic, lang, NULL, dwType, (LPBYTE)userDic, size);
		}
		
		// Close the open key
		CeRegCloseKey( hkeyUserDic ); 
		
		// Prompt user that ce registry has been changed
		//if ( count == 1 )
		//{
		//	MessageBoxEx(m_hWnd, "Ce registry has been changed.", "CE Registry completed", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
		//	m_progress_bar.SetPos(0);
		//	return TRUE;
		//}
		// continue with the rest
		// return FALSE;
	}
	else
	{
		MessageBoxEx(m_hWnd, "Unable to open registry. Make sure that the ce device is connected.", "Error!",
			MB_OK | MB_APPLMODAL, LANG_ENGLISH );
		// Resets status bar
		m_progress_bar.SetPos(0);
		return TRUE;
	}
	//}
	
	// Setup multi language if checked off
//	if(  ml == TRUE  )
	if (TRUE)
	{
		HKEY hkeyMultiLang;	    // Open new key
		
		// reset multi Language
		//ml = TRUE;
		len = strlen(regPath);
		memset(CeRegPath, 0, MAXPATH);
		// Convert char to unicode
		mbstowcs(CeRegPath, regPath, len);
		CeRegPath[len] = '\0';
		// Open key
		if ( CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyMultiLang) == ERROR_SUCCESS )
		{
			HKEY hkeyOpenLangs;		// Open new key

			wchar_t multiLang[MAXPATH] = MULTI_LANG;
			size = sizeof(wchar_t) * wcslen(MULTI_LANG + 1);
			// Create multi language string
			
			if(  ml == TRUE  ){
			CeRegSetValueEx(hkeyMultiLang, multiLang, NULL, dwType, (LPBYTE)LANG_ML, size);
			}
			// Lock_MGR
			wcscpy(multiLang, L"2");
			size = sizeof(wchar_t) * wcslen(MULTI_LANG + 1);
			// Create multi language string
			CeRegSetValueEx(hkeyMultiLang, L"LockMGR", NULL, dwType, (LPBYTE)multiLang, size);

			memset(regPath, 0, MAXPATH);
			memset(CeRegPath, 0, MAXPATH);
			// Copy subkey for ce device
			strcpy(regPath, PATH_ML);
			len = strlen(regPath);
			// Convert char to unicode
			mbstowcs(CeRegPath, regPath, len);
			CeRegPath[len] = '\0';
			
			// Create Langs subkey in CE device
			CeRegCreateKeyEx(hkeyLocalMachine, CeRegPath, 0, NULL, 0, 0, NULL, &hkeyOpenLangs, &hkeyStatus);
			
			size = wcslen(language) * sizeof(wchar_t);
			// Set the language string in ce device
			if ( CeRegSetValueEx(hkeyOpenLangs, lang, NULL, dwType, (LPBYTE)language, size) != ERROR_SUCCESS )
			{
				MessageBoxEx(m_hWnd, "Unable to open registry. Make sure that the ce device is connected.", "Error!",
					MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				// Resets status bar
				m_progress_bar.SetPos(0);
				return TRUE;
			}
				
			wcscpy(language, lang);
			size = wcslen(language) * sizeof(wchar_t);
			// Set the default language string in ce device
			if ( CeRegSetValueEx(hkeyOpenLangs, L"DefaultLang", NULL, dwType, (LPBYTE)language, size) != ERROR_SUCCESS )
			{
				MessageBoxEx(m_hWnd, "Unable to open registry. Make sure that the ce device is connected.", "Error!",
					MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				// Resets status bar
				m_progress_bar.SetPos(0);
				return TRUE;
			}
			
			// Prompt user that ce registry has been changed
			if ( count > 1 )
			{
				MessageBoxEx(m_hWnd, "Ce registry has been changed.", "CE Registry completed", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
				m_progress_bar.SetPos(0);
				
				// Close the open key
				CeRegCloseKey(hkeyMultiLang);
				CeRegCloseKey( hkeyOpenLangs ); 
				return TRUE;
			}
			// Create keys for more than one language
			// Close the open key
			CeRegCloseKey(hkeyMultiLang);
			CeRegCloseKey( hkeyOpenLangs ); 
			return FALSE;
		}
		else
		{
			MessageBoxEx(m_hWnd, "Unable to open registry. Make sure that the ce device is connected.", "Error!",
				MB_OK | MB_APPLMODAL, LANG_ENGLISH );
			// Resets status bar
			m_progress_bar.SetPos(0);
			// Close the open key
			CeRegCloseKey(hkeyMultiLang); 
			return TRUE;
		}
	}
	else
	{
		MessageBoxEx(m_hWnd, "Ce registry has been changed.", "CE Registry completed", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
		m_progress_bar.SetPos(0);
		return TRUE;
	}
}	

/***************************************************************************************************************************** */
/*
	Delete_key(HKEY hkeyLocalMachine, wchar_t *lang, wchar_t *Buf,
			   DWORD size, DWORD dwType, int len, int count, bool us, bool uk,
			   bool gr, bool sp, bool la, bool &ml, wchar_t *defaultLang ))
	hkey:	holds the regsitry name of HKEY_LOCAL_MACHINE
	lang:   Name of the language  
	dwType:	Type of data associated with the registry value
	count:	keeps track of how many languages being added and used to display message of completed
	us:		if registry for ce has the English language
	uk:		if registry for ce has the English UK language
	gr:		if registry for ce has the German language
	sp:		if registry for ce has the Spanish language
	ml:		if registry for ce has multi language
	defaultLang: holds the default language from the registry
	return:		
*/
/* *************************************************************************************************************************** */



bool CCeAgentDlg::Delete_Key(HKEY hkeyLocalMachine, HKEY hkeyCurrentUser, wchar_t *lang, DWORD dwType, int count, bool &us, bool &uk,
							 bool &gr, bool &sp, bool &la, bool &fr, bool &ml, wchar_t *defaultLang )
{	// Include test if subkey dosn't exit
	//Buf not neede
	
	HKEY hkeyOpen;				    // Open key
	char regPath[MAXPATH] = PATH "\\" VERSION;	// Path
	wchar_t CeRegPath[MAXPATH];					// Path in ce registry 
	DWORD size = 0;					// size in bytes or characters for string
	DWORD sizeSubkey = 0;		// Length of largest subkey
	DWORD numSubkey = 0;		// Number of subkeys
	DWORD numValues = 0;		// Number of variables in open key
	DWORD sizeValueName = 0;	// Length of largest variable in subkey
	DWORD index = 0;			// Index for subkeys
	DWORD get = 0;				// Return value of CeRegEnumKeyEx
	DWORD response = 0;			// reply for messagbox
	int len = 0;				// size of string
	wchar_t temp[3] = L"";;		// Temporary Lang
	wchar_t subKey[260] = L"";	// subkey
	//int tempCount = 0;		// tempoary Count
	char display[1000] = "";			
	int langName = 0;
	
	/* *********************************************************** */
	// Put message for all languages
	if ( wcscmp(lang, L"US") == 0 )
	{
		strcpy(display, "Do you want to delete the registry for ");
		strcat(display, "English US?");
		langName = 1;
	}
	
	if (wcscmp(lang, L"UK") == 0 )
	{
		strcpy(display, "Do you want to delete the registry for ");
		strcat(display, "English UK?");
		langName = 2;
	}

	if (wcscmp(lang, L"GR") == 0 )
	{
		strcpy(display, "Do you want to delete the registry for ");
		strcat(display, "German?");
		langName = 3;
	}

	if (wcscmp(lang, L"SP") == 0 )
	{
		strcpy(display, "Do you want to delete the registry for ");
		strcat(display, "Spanish?");
		langName = 4;
	}

	if (wcscmp(lang, L"LA") == 0 )
	{
		strcpy(display, "Do you want to delete the registry for ");
		strcat(display, "Latin American Spanish?");
		langName = 5;
	}

	if (wcscmp(lang, L"FR") == 0 )
	{
		strcpy(display, "Do you want to delete the registry for ");
		strcat(display, "French?");
		langName = 6;
	}
	
	response = MessageBoxEx(m_hWnd, display, "CE Agent", MB_YESNOCANCEL| MB_APPLMODAL, LANG_ENGLISH );

	if ( response == IDYES )
	{			
		len = strlen(regPath);
		// Convert char to unicode
		CeRegPath[len] = '\0';
		mbstowcs(CeRegPath, regPath, len);
		CeRegPath[len] = '\0';
		// Open registry
		if ( CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpen) == ERROR_SUCCESS )
		{	
			// Get info about open key and subkeys
			CeRegQueryInfoKey(hkeyOpen,			        // Open key
				              NULL, NULL, NULL,
							  &numSubkey,				// Number of subkeys
							  &sizeSubkey,				// Length of the largest subkey in characters doesn't include terminating null
							  NULL,
							  &numValues,				// Number of values in key open 
							  &sizeValueName,			// Length of the largest value name in subkey in characters doesn't include terminating null
							  NULL, NULL, NULL);
			/* *********************************************************************************************** */
			// Check if multiLang
			if ( ( ml == TRUE ) )	// Deleting part of multi language tree or all dectalk
			{	
				// Close Key
				CeRegCloseKey(hkeyOpen); 

				if ( numSubkey == 1)
				{
					switch (langName)
					{
						case 1: strcpy(display, "English US is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 2: strcpy(display, "English UK is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 3: strcpy(display, "German is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 4: strcpy(display, "Spanish is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 5: strcpy(display, "Latin American Spanish is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 6: strcpy(display, "French is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
					}
					response = MessageBoxEx(m_hWnd, display, "CE Agent", MB_YESNOCANCEL| MB_APPLMODAL, LANG_ENGLISH );
					// User cancel delete
					if ( response == IDNO || response == IDCANCEL)
					{
						m_progress_bar.SetPos(0);
						return TRUE;
					}
					else	// Delete entire registry tree
					{
						HKEY hkeyDeleteAll;		// Open new key
						wcscpy(CeRegPath, L"Software");
						len = wcslen(CeRegPath);
						CeRegPath[len] = '\0';
						// Open key
						CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyDeleteAll);
						memset(CeRegPath, 0, MAXPATH);
						len = strlen(COMPANY);
						mbstowcs(CeRegPath, COMPANY, len);
						CeRegPath[len] = '\0';
						// Delete key
						CeRegDeleteKey(hkeyDeleteAll, CeRegPath);
						// Close key
						CeRegCloseKey(hkeyDeleteAll);
						
						// Delete user dictionary entry
						HKEY hkeyDeleteDic;		// New open key
						// reset string
						memset(CeRegPath, 0, MAXPATH);
						wcscpy(CeRegPath, L"Software");
						len = wcslen(CeRegPath);
						CeRegPath[len] = '\0';
						// Open Current user key
						CeRegOpenKeyEx(hkeyCurrentUser, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyDeleteDic);
						memset(CeRegPath, 0, MAXPATH);
						len = strlen(COMPANY);
						mbstowcs(CeRegPath, COMPANY, len);
						CeRegPath[len] = '\0';
						// Delete key
						CeRegDeleteKey(hkeyDeleteDic, CeRegPath);
						// Close key
						CeRegCloseKey(hkeyDeleteDic);
						
						switch (langName)
						{
							case 1: MessageBoxEx(m_hWnd, "Ce registry for English US was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 2: MessageBoxEx(m_hWnd, "Ce registry for English UK was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 3: MessageBoxEx(m_hWnd, "Ce registry for German was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 4: MessageBoxEx(m_hWnd, "Ce registry for Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 5: MessageBoxEx(m_hWnd, "Ce registry for Latin American Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 6: MessageBoxEx(m_hWnd, "Ce registry for French was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
						}
						m_progress_bar.SetPos(0);
						return TRUE;
					}
				}
				else
				{
					// Delete part of multi language support
					HKEY hkeyDeleteLang;	// Open new key

					// reset strings
					memset(regPath, 0, MAXPATH);
					memset(CeRegPath, 0, MAXPATH);
					strcpy(regPath, PATH "\\" VERSION);
					len = strlen(regPath);
					// Convert char to unicode
					mbstowcs(CeRegPath, regPath, len);
					CeRegPath[len] = '\0';
					// Open key
					DWORD vit;
					vit = CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyDeleteLang);
					wchar_t language[MAXPATH];
					wcscpy(language, lang);
					len = wcslen(language);
					language[len] = '\0';
					// Delete language key
					if ( CeRegDeleteKey(hkeyDeleteLang, language) != ERROR_SUCCESS )
					{
						MessageBoxEx(m_hWnd, "Unable to delete registry. Make sure that the ce device is connected.", "Error!",
						             MB_OK | MB_APPLMODAL, LANG_ENGLISH );
						m_progress_bar.SetPos(0);
						return TRUE;
					}
					
					// Close key
					CeRegCloseKey(hkeyDeleteLang);
                    
					// delete HKEYCURRENTUSER user dictionary value
					HKEY hkeyDeleteLangDic;		// New open key
					// reset string
					memset(CeRegPath, 0, MAXPATH);
					strcpy(regPath, PATH "\\" VERSION);
					len = strlen(regPath);
					// Convert char to unicode
					mbstowcs(CeRegPath, regPath, len);
					CeRegPath[len] = '\0';
					// Open Current user key
					CeRegOpenKeyEx(hkeyCurrentUser, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyDeleteLangDic);
					// Reste string
					memset(CeRegPath, 0, MAXPATH);
					len = wcslen(lang);
					wcscpy(CeRegPath, lang);
					CeRegPath[len] = '\0';
					// Delete key
					CeRegDeleteKey(hkeyDeleteLangDic, CeRegPath);
					// Close key
					CeRegCloseKey(hkeyDeleteLangDic);
					
					HKEY hkeyDeleteMultiLangString;	// Open new key

					// reset strings
					memset(regPath, 0, MAXPATH);
					memset(CeRegPath, 0, MAXPATH);
					strcpy(regPath, PATH_ML);
					len = strlen(regPath);
					// Convert char to unicode
					mbstowcs(CeRegPath, regPath, len);
					CeRegPath[len] = '\0';
					// Open key
					CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyDeleteMultiLangString);
					// delete string in key
					CeRegDeleteValue(hkeyDeleteMultiLangString, lang );
					if ( wcscmp(lang, US ) == 0 )
						us = FALSE;
					else if( wcscmp(lang, UK) == 0 ) 
						uk = FALSE;
					else if( wcscmp(lang, GR) == 0 ) 
						gr = FALSE;
					else if( wcscmp(lang, SP) == 0 ) 
						sp = FALSE;
					else if( wcscmp(lang, LA) == 0 ) 
						la = FALSE;
					else if( wcscmp(lang, FR) == 0 ) 
						fr = FALSE;
	
					
					if ( count == 0 ) 
					{
						// Set default language
						//response = MessageBoxEx(m_hWnd, "Which language do you want to be the default language?", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
						if ( us == TRUE)
						{
							// Convert count of string to bytes
							len = wcslen(US) * sizeof(wchar_t);
							CeRegSetValueEx(hkeyDeleteMultiLangString, DEFAULT_LANG, 0, dwType, (LPBYTE)US, len);
						}
						else if ( uk == TRUE)
						{
							len = wcslen(UK) * sizeof(wchar_t);
							CeRegSetValueEx(hkeyDeleteMultiLangString, DEFAULT_LANG, 0, dwType, (LPBYTE)UK, len);
						}
						else if ( gr == TRUE)
						{
							len = wcslen(GR) * sizeof(wchar_t);
							CeRegSetValueEx(hkeyDeleteMultiLangString, DEFAULT_LANG, 0, dwType, (LPBYTE)GR, len);
						}
						else if ( sp == TRUE)
						{
							len = wcslen(SP) * sizeof(wchar_t);
							CeRegSetValueEx(hkeyDeleteMultiLangString, DEFAULT_LANG, 0, dwType, (LPBYTE)SP, len);
						}
						else if ( la == TRUE)
						{
							len = wcslen(LA) * sizeof(wchar_t);
							CeRegSetValueEx(hkeyDeleteMultiLangString, DEFAULT_LANG, 0, dwType, (LPBYTE)LA, len);
						}
						else if ( fr == TRUE)
						{
							len = wcslen(FR) * sizeof(wchar_t);
							CeRegSetValueEx(hkeyDeleteMultiLangString, DEFAULT_LANG, 0, dwType, (LPBYTE)FR, len);
						}
					}
					if ( count == 1 )
					{	// Close key
						CeRegCloseKey(hkeyDeleteMultiLangString);
						switch (langName)
						{
							case 1: MessageBoxEx(m_hWnd, "Ce registry for English US was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
									break;
							case 2: MessageBoxEx(m_hWnd, "Ce registry for English UK was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
									break;
							case 3: MessageBoxEx(m_hWnd, "Ce registry for German was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
									break;
							case 4: MessageBoxEx(m_hWnd, "Ce registry for Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
									break;
							case 5: MessageBoxEx(m_hWnd, "Ce registry for Latin American Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
									break;
							case 6: MessageBoxEx(m_hWnd, "Ce registry for French was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
									break;
						}
						m_progress_bar.SetPos(0);
						return TRUE;
					}
					return FALSE;
				}
			}
			/* ****************************************************************************************** */
			else	// Not multiLang
			{
				HKEY hkeyOpenLanguages;		// Open new key

				// reset string
				memset(regPath, 0 , MAXPATH);
				strcpy(regPath, PATH "\\" VERSION);
				len = strlen(regPath);
				// reset string
				memset(CeRegPath, 0, MAXPATH);
				// Convert char to unicode
				mbstowcs(CeRegPath, regPath, len);
				CeRegPath[len] = '\0';
				CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenLanguages);
				
				if ( numSubkey == 1 )
				{
					// Close key
					CeRegCloseKey(hkeyOpenLanguages);	

					switch (langName)
					{
						case 1: strcpy(display, "English US is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 2: strcpy(display, "English UK is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 3: strcpy(display, "German is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 4: strcpy(display, "Spanish is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 5: strcpy(display, "Latin American Spanish is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
						case 6: strcpy(display, "French is the only language in the registry.\nDo you want to completely delete DECtalk?");
							    break;
					}
					response = MessageBoxEx(m_hWnd, display, "CE Agent", MB_YESNOCANCEL| MB_APPLMODAL, LANG_ENGLISH );
					// User cancel delete
					if ( response == IDNO || response == IDCANCEL)
					{
						m_progress_bar.SetPos(0);
						return TRUE;
					}
					else	// Delete entire registry tree
					{		
						// Delete HKEYLOCALMACHINE
						HKEY hkeyTempOpen2;		// For open key
						wcscpy(CeRegPath, L"Software");
						len = wcslen(CeRegPath);
						CeRegPath[len] = '\0';
						// Open key
						CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyTempOpen2);
						memset(CeRegPath, 0, MAXPATH);
						len = strlen(COMPANY);
						mbstowcs(CeRegPath, COMPANY, len);
						CeRegPath[len] = '\0';
						// Delete key
						CeRegDeleteKey(hkeyTempOpen2, CeRegPath);
						// Close key
						CeRegCloseKey(hkeyTempOpen2);
						
						// key HKEYCURRENTUSER 
						HKEY hkeyDeleteAllDic;		// New open key
						// reset string
						memset(CeRegPath, 0, MAXPATH);
						wcscpy(CeRegPath, L"Software");
						len = strlen(regPath);
						CeRegPath[len] = '\0';
						// Open Current user key
						CeRegOpenKeyEx(hkeyCurrentUser, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyDeleteAllDic);
						// Reset string
						memset(CeRegPath, 0, MAXPATH);
						len = strlen(COMPANY);
						mbstowcs(CeRegPath, COMPANY, len);
						CeRegPath[len] = '\0';
						// Delete key
						CeRegDeleteKey(hkeyDeleteAllDic, CeRegPath);
						// Close key
						CeRegCloseKey(hkeyDeleteAllDic);
						//{
						//	MessageBoxEx(m_hWnd, "Unable to delete registry. Make sure that the ce device is connected.", "Error!",
					    //			MB_OK | MB_APPLMODAL, LANG_ENGLISH );
					    //		m_progress_bar.SetPos(0);
						//	return TRUE;
						//}
						switch (langName)
						{
							case 1: MessageBoxEx(m_hWnd, "Ce registry for English US was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 2: MessageBoxEx(m_hWnd, "Ce registry for English UK was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 3: MessageBoxEx(m_hWnd, "Ce registry for German was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 4: MessageBoxEx(m_hWnd, "Ce registry for Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 5: MessageBoxEx(m_hWnd, "Ce registry for Latin American Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 6: MessageBoxEx(m_hWnd, "Ce registry for French was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
						}
						m_progress_bar.SetPos(0);
						return TRUE;
					}
				}
				else
				{
					// delete key in HKEYLOCALMACHINE
					// delete key
					CeRegDeleteKey(hkeyOpenLanguages, lang);
					// Close key
					CeRegCloseKey(hkeyOpenLanguages);
					
					// delete key in HKEYLOCALMACHINE
					HKEY hkeyDeletePartDic;	// Open new key
					// reset string
					memset(regPath, 0 , MAXPATH);
					strcpy(regPath, PATH "\\" VERSION);
					len = strlen(regPath);
					// reset string
					memset(CeRegPath, 0, MAXPATH);
					// Convert char to unicode
					mbstowcs(CeRegPath, regPath, len);
					CeRegPath[len] = '\0';
					// Open Current user key
					CeRegOpenKeyEx(hkeyCurrentUser, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyDeletePartDic);
					// Reste string
					memset(CeRegPath, 0, MAXPATH);
					len = wcslen(lang);
					wcscpy(CeRegPath, lang);
					CeRegPath[len] = '\0';
					// Delete key
					CeRegDeleteKey(hkeyDeletePartDic, CeRegPath);
					// Close key
					CeRegCloseKey(hkeyDeletePartDic);
					//{
					//	MessageBoxEx(m_hWnd, "Unable to delete registry. Make sure that the ce device is connected.", "Error!",
					//	             MB_OK | MB_APPLMODAL, LANG_ENGLISH );
					//	m_progress_bar.SetPos(0);
					//	return TRUE;
					//}

					// Display message only after last delete
					if ( count == 1 )
					{
						switch (langName)
						{
							case 1: MessageBoxEx(m_hWnd, "Ce registry for English US was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 2: MessageBoxEx(m_hWnd, "Ce registry for English UK was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 3: MessageBoxEx(m_hWnd, "Ce registry for German was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 4: MessageBoxEx(m_hWnd, "Ce registry for Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 5: MessageBoxEx(m_hWnd, "Ce registry for Latin American Spanish was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
							case 6: MessageBoxEx(m_hWnd, "Ce registry for French was deleted", "Ce Agent", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
						}
						m_progress_bar.SetPos(0);
						return TRUE;
					}
					// continue deleting the rest
					return FALSE;
				}
			}	// not multiLang
		}	// CeRegOpenKeyEx()
		else    
		{
			MessageBoxEx(m_hWnd, "Could not connect to device. Make sure that the ce device is connected.",
				"Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
			// Close key
			CeRegCloseKey(hkeyOpen);
			m_progress_bar.SetPos(0);
			return TRUE;
		}
	}	// for if: response == IDYES
	else // response is IDNO or IDCANCEL
	{
		// User does not want to delete registry
		m_progress_bar.SetPos(0);
		return TRUE;
	}	
}

/* ********************************************************************************************************************************************** */
/*
	Check_registry(HKEY hkeyLocalMachine, bool &us, bool &uk, bool &gr, bool &sp, bool &la, bool &ml, wchar_t *defaultLang))
	hkey:	holds the regsitry name of HKEY_LOCAL_MACHINE
	us:		if registry for ce has the English language
	uk:		if registry for ce has the English UK language
	gr:		if registry for ce has the German language
	sp:		if registry for ce has the Spanish language
	ml:		if registry for ce has multi language
	defaultLang: holds the default language from the registry
	return:		
*/


bool CCeAgentDlg::Check_Registry(HKEY hkeyLocalMachine, bool &us, bool &uk, bool &gr, bool &sp, bool &la, bool &fr, bool &ml, wchar_t *defaultLang)
{
	HKEY hkeyOpen;									// Open key for subkey
	char regPath[MAXPATH] = PATH "\\" VERSION;		// subkey  of software info in desktop
	char message[100];								// message of error for user
	wchar_t langs[] = US;
	wchar_t CeRegPath[MAXPATH];						// subkey  of software info in ce
	wchar_t subKeyName[MAXPATH];					// Name of string in registry
	wchar_t subStringValue[MAXPATH];				// value of string in registry
	DWORD numSubKeys = 0;							// Number of subkeys
	DWORD sizeSubKey;								// Size of largest subkey
	DWORD numValues = 0;							// Number of values in open key, not subkeys
	DWORD sizeValueName = 0;						// Size of the largest value in subkey
	DWORD sizeValueData = 0;						// Size of the largest data value in subkey	
	DWORD index = 0;								// Counter
	DWORD dwType = REG_SZ;
	DWORD len = 0;									// Length of string
	DWORD size;										// Size of string

	len = strlen(regPath);
	memset(CeRegPath, 0, MAXPATH);
	// Convert char to unicode
	mbstowcs(CeRegPath, regPath, len);
	CeRegPath[len] = '\0';
	// Open registry
	if ( CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpen) == ERROR_SUCCESS )
	{
		// Get info on registry						
		CeRegQueryInfoKey(hkeyOpen,					// Open key
						  NULL, NULL, NULL,			
						  &numSubKeys,				// Number of subkeys
						  &sizeSubKey,				// Length of the largest subkey in characters doesn't include terminating null
						  NULL,
						  &numValues,				// Number of values in key open 
						  &sizeValueName,			// Length of the largest value name in openkey in characters doesn't include terminating null
						  &sizeValueData,			// Length of the longest data value in openkey of a string
						  NULL, NULL);

		// Convert size for unicode
		size = sizeof(wchar_t) * (wcslen(LANG_ML) + 1); //sizeValueName;
		// Check if multilang
		/* *************************************************** */
		CeRegQueryValueEx(hkeyOpen, 				    // Open key
					      MULTI_LANG,			    // Name of variable in key
						  NULL, 
						  &dwType,
						  (LPBYTE)subStringValue,	// Value of variable in key
						  &size);					// Length of variable in bytes
		/* ************************************************* */
		// Null Terminate string in unicode
		subStringValue[size/sizeof(wchar_t)] = '\0';
		
		
		m_progress_bar.SetPos(20);

		// checks if multilang is correct
		if ( wcscmp(subStringValue, LANG_ML) == 0 )
		{
			HKEY hkeyOpenLangs;		// Open new key 
			
			// Close Key
			CeRegCloseKey(hkeyOpen);
			
			memset(regPath, 0, MAXPATH);
			strcpy(regPath, PATH_ML);
			len = strlen(regPath);
			// Convert char to unicodec
			mbstowcs(CeRegPath, regPath, len);
			CeRegPath[len] = '\0';

			// Open registry for MULTI LANG
			if ( CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenLangs) == ERROR_SUCCESS )
			{
				// Get info on registry						
				CeRegQueryInfoKey(hkeyOpenLangs,			// Open key
								  NULL, NULL, NULL,			
								  &numSubKeys,				// Number of subkeys
								  &sizeSubKey,				// Length of the largest subkey in characters doesn't include terminating null
								  NULL,
								  &numValues,				// Number of values in key open 
								  &sizeValueName,			// Length of the largest value name in openkey in characters doesn't include terminating null
								  &sizeValueData,			// Length of the longest data value in openkey of a string
								  NULL, NULL);
				
				
				for ( index = 0; index < numValues; index++ )
				{
					size = sizeof(wchar_t) * sizeValueName;
					len = sizeof(wchar_t) * sizeValueData;
					CeRegEnumValue(hkeyOpenLangs,		    // Open key
						           index,			        // Index of value retrieved
								   subKeyName,		        // Name of the string Null terminated
								   &size,			        // size in characters of string
								   NULL, NULL,
								   (LPBYTE)subStringValue,	// Value of string
								   &len);					// size in bytes of value
					// Add terminating null
					subStringValue[len/sizeof(wchar_t)] = '\0';
					
					
					if ( wcscmp(subKeyName, US) == 0 )
					{
						wcscpy(langs, US);
						if ( wcscmp(subStringValue, LANG_US) == 0 )
						{
							// registry ok
							continue;
						}
						break;
					}
					else if ( wcscmp(subKeyName, UK) == 0 )
					{
						wcscpy(langs, UK);
						if ( wcscmp(subStringValue, LANG_UK) == 0 )
						{
							// registry ok
							continue;
						}
						break;
					}
					else if ( wcscmp(subKeyName, GR) == 0 )
					{
						wcscpy(langs, GR);
						if ( wcscmp(subStringValue, LANG_GR) == 0 )
						{
							// registry ok
							continue;
						}
						break;
					}
					else if ( wcscmp(subKeyName, SP) == 0 )
					{
						wcscpy(langs, SP);
						if ( wcscmp(subStringValue, LANG_SP) == 0 )
						{
							// registry ok
							continue;
						}
						break;
					}
					else if ( wcscmp(subKeyName, LA) == 0 )
					{

						wcscpy(langs, LA);
						if ( wcscmp(subStringValue, LANG_LA) == 0 )
						{
							// registry ok
							continue;
						}
						break;
					}
					else if ( wcscmp(subKeyName, FR) == 0 )
					{

						wcscpy(langs, FR);
						if ( wcscmp(subStringValue, LANG_FR) == 0 )
						{
							// registry ok
							continue;
						}
						break;
					}
					else if ( wcscmp(subKeyName, DEFAULT_LANG) == 0 )
					{
						//wcscpy(langs, ML);
						if ( wcscmp(subStringValue, US) == 0 )
						{
							// registry ok
							wcscpy(defaultLang, US);
							continue;
						}
						else if ( wcscmp(subStringValue, UK) == 0 )
						{
							// registry ok
							wcscpy(defaultLang, UK);
							continue;
						}
						else if ( wcscmp(subStringValue, GR) == 0 )
						{
							// registry ok
							wcscpy(defaultLang, GR);
							continue;
						}
						else if ( wcscmp(subStringValue, SP) == 0 )
						{
							// registry ok
							wcscpy(defaultLang, SP);
							continue;
						}
						else if ( wcscmp(subStringValue, LA) == 0 )
						{
							// registry ok
							wcscpy(defaultLang, LA);
							continue;
						}
						else if ( wcscmp(subStringValue, FR) == 0 )
						{
							// registry ok
							wcscpy(defaultLang, FR);
							continue;
						}
					}
					break;
					
				}//for
				
				m_progress_bar.SetPos(30);
				// Registry ok
				if ( index == numValues)
				{
					ml = TRUE;
					
					// Close Key
					CeRegCloseKey(hkeyOpenLangs);
				}
				else
				{
					// registry corrupted
					strcpy(message, "Registry in multi language for ");
					strcat(message, (char *)langs);
					strcat(message, " has been corrupted!\n Check data in regsitry for ");
					strcat(message, (char *)langs);
					MessageBoxEx(m_hWnd, message, "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
					// Close key
					CeRegCloseKey(hkeyOpenLangs);
					
					// reset progress bar
					m_progress_bar.SetPos(0);
					return FALSE;
				}	
			}//if Open registry for MULTI LANG
			
			// Close Key
			CeRegCloseKey(hkeyOpenLangs);

		}//if multilang is correct
		
		// not mulit Lang
		HKEY hkeyOpenDectalk;
		
		// Close Key
		CeRegCloseKey(hkeyOpen);

		// reset string
		memset(regPath, 0, MAXPATH);
		memset(CeRegPath, 0, MAXPATH);
		memset(subStringValue, 0, MAXPATH);
		strcpy(regPath, PATH "\\" VERSION);
		len = strlen(regPath);
		memset(CeRegPath, 0, MAXPATH);
		// Convert char to unicode
		mbstowcs(CeRegPath, regPath, len);
		CeRegPath[len] = '\0';
		// Open key
		CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenDectalk);
		// Get info on registry						
		CeRegQueryInfoKey(hkeyOpenDectalk,			// Open key
						  NULL, NULL, NULL,			
						  &numSubKeys,				// Number of subkeys
						  &sizeSubKey,				// Length of the largest subkey in characters doesn't include terminating null
						  NULL,
						  &numValues,				// Number of values in key open 
						  &sizeValueName,			// Length of the largest value name in openkey in characters doesn't include terminating null
						  &sizeValueData,			// Length of the longest data value in openkey of a string
						  NULL, NULL);
		

		// Add for terminating Null 
		//sizeValuename++;
		
		for ( index = 0; index < numSubKeys; index++ )
		{
			size = sizeof(wchar_t) * sizeSubKey;
			CeRegEnumKeyEx(hkeyOpenDectalk,	// Open key
				           index,			// Index of subkey retrieve
				           subKeyName,		// Name of the subkey
				           &size,			// size in characters of subkey 
				           NULL, NULL, NULL, NULL);	

			if ( wcscmp(subKeyName, US) == 0 )
			{
				HKEY hkeyOpenUS;	// Open new key
				
				// Reset string
				memset(CeRegPath, 0, MAXPATH);
				len = strlen(regPath);
				mbstowcs(CeRegPath, regPath, len);
				wcscat(CeRegPath, L"\\");
				wcscat(CeRegPath, US);
				len = wcslen(CeRegPath);
				CeRegPath[len] = '\0';
				CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenUS);
				
				size = (sizeof(wchar_t) * sizeValueData);
				memset(subStringValue, 0, MAXPATH);
				CeRegQueryValueEx(hkeyOpenUS,			// Open key
					              LANGUAGES,			// Name of variable in key
					              NULL, NULL,
					              (LPBYTE)subStringValue,	// Value of variable in key
					              &size);	// Length of variable in bytes

				subStringValue[size] = '\0';
				if ( wcscmp(subStringValue, LANG_US) == 0 )
				{
					size = sizeof(wchar_t) * sizeValueData;
					memset(subStringValue, 0, MAXPATH);
					CeRegQueryValueEx(hkeyOpenUS,		 		// Open key
						              MAIN_DICT,			    // Name of variable in key
									  NULL, NULL,
									  (LPBYTE)subStringValue,	// Value of variable in key
									  &size);	                // Length of variable in bytes
					subStringValue[size] = '\0';
					if ( wcscmp(subStringValue, DICT_US) == 0 )
					{
						// Registry ok
						us = TRUE;
						// Close key
						CeRegCloseKey(hkeyOpenUS);
						continue;
					}
				}
				
				break;
			}
			else if ( wcscmp(subKeyName, UK) == 0 )
			{
				HKEY hkeyOpenUK;	// Open new key
				
				// reset string
				memset(CeRegPath, 0, MAXPATH);
				len = strlen(regPath);
				mbstowcs(CeRegPath, regPath, len);
				wcscat(CeRegPath, L"\\");
				wcscat(CeRegPath, UK);
				len = wcslen(CeRegPath);
				CeRegPath[len] = '\0';
				CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenUK);
				
				size = (sizeof(wchar_t) * sizeValueData);
				memset(subStringValue, 0, MAXPATH);
				CeRegQueryValueEx(hkeyOpenUK, 				// Open key
					              LANGUAGES,				// Name of variable in key
								  NULL, NULL,
								  (LPBYTE)subStringValue,	// Value of variable in key
								  &size);					// Length of variable in bytes
				subStringValue[size] = '\0';
				if ( wcscmp(subStringValue, LANG_UK) == 0 )
				{
					size = sizeof(wchar_t) * sizeValueData;
					memset(subStringValue, 0, MAXPATH);
					CeRegQueryValueEx(hkeyOpenUK, 		        // Open key
									  MAIN_DICT,			    // Name of variable in key
									  NULL, NULL,
									  (LPBYTE)subStringValue,	// Value of variable in key
									  &size);	                // Length of variable in bytes
					subStringValue[size] = '\0';
					if ( wcscmp(subStringValue, DICT_UK) == 0 )
					{
						// Registry ok
						uk = TRUE;
						// Close key
						CeRegCloseKey(hkeyOpenUK);
						continue;
					}
				}
				
				break;
			}
			else if ( wcscmp(subKeyName, GR) == 0 )
			{
				HKEY hkeyOpenGR;	// Open new key
				
				// reset string
				memset(CeRegPath, 0, MAXPATH);
				len = strlen(regPath);
				mbstowcs(CeRegPath, regPath, len);
				wcscat(CeRegPath, L"\\");
				wcscat(CeRegPath, GR);
				len = wcslen(CeRegPath);
				CeRegPath[len] = '\0';
				CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenGR);
				
				size = (sizeof(wchar_t) * sizeValueData);
				memset(subStringValue, 0, MAXPATH);
				CeRegQueryValueEx(hkeyOpenGR, 				// Open key
					              LANGUAGES,				// Name of variable in key
								  NULL, NULL,
								  (LPBYTE)subStringValue,	// Value of variable in key
								  &size);					// Length of variable in bytes
				subStringValue[size] = '\0';
				if ( wcscmp(subStringValue, LANG_GR) == 0 )
				{
					size = sizeof(wchar_t) * sizeValueData;
					memset(subStringValue, 0, MAXPATH);
					CeRegQueryValueEx(hkeyOpenGR, 		        // Open key
									  MAIN_DICT,			    // Name of variable in key
									  NULL, NULL,
									  (LPBYTE)subStringValue,	// Value of variable in key
									  &size);	                // Length of variable in bytes
					subStringValue[size] = '\0';
					if ( wcscmp(subStringValue, DICT_GR) == 0 )
					{
						// Registry ok
						gr = TRUE;
						// Close key
						CeRegCloseKey(hkeyOpenGR);
						continue;
					}
				}
				
				break;
			}
			else if ( wcscmp(subKeyName, SP) == 0 )
			{
				HKEY hkeyOpenSP;	//open new key
				
				// reset string
				memset(CeRegPath, 0, MAXPATH);
				len = strlen(regPath);
				mbstowcs(CeRegPath, regPath, len);
				wcscat(CeRegPath, L"\\");
				wcscat(CeRegPath, SP);
				len = wcslen(CeRegPath);
				CeRegPath[len] = '\0';
				CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenSP);
				
				size = (sizeof(wchar_t) * sizeValueData);
				memset(subStringValue, 0, MAXPATH);
				CeRegQueryValueEx(hkeyOpenSP, 				// Open key
					              LANGUAGES,				// Name of variable in key
					              NULL, NULL,
								  (LPBYTE)subStringValue,	// Value of variable in key
								  &size);	                // Length of variable in bytes
				subStringValue[size] = '\0';
				if ( wcscmp(subStringValue, LANG_SP) == 0 )
				{
					size = sizeof(wchar_t) * sizeValueData;
					memset(subStringValue, 0, MAXPATH);
					CeRegQueryValueEx(hkeyOpenSP, 		        // Open key
						              MAIN_DICT,			    // Name of variable in key
									  NULL, NULL,
									  (LPBYTE)subStringValue,	// Value of variable in key
									  &size);	                // Length of variable in bytes
					subStringValue[size] = '\0';
					if ( wcscmp(subStringValue, DICT_SP) == 0 )
					{
						// Registry ok
						sp = TRUE;
						// Close key
						CeRegCloseKey(hkeyOpenSP);
						continue;
					}
				}
				
				break;
			}
			else if ( wcscmp(subKeyName, FR) == 0 )
			{
				HKEY hkeyOpenFR;	//open new key
				
				// reset string
				memset(CeRegPath, 0, MAXPATH);
				len = strlen(regPath);
				mbstowcs(CeRegPath, regPath, len);
				wcscat(CeRegPath, L"\\");
				wcscat(CeRegPath, FR);
				len = wcslen(CeRegPath);
				CeRegPath[len] = '\0';
				CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenFR);
				
				size = (sizeof(wchar_t) * sizeValueData);
				memset(subStringValue, 0, MAXPATH);
				CeRegQueryValueEx(hkeyOpenFR, 				// Open key
					              LANGUAGES,				// Name of variable in key
					              NULL, NULL,
								  (LPBYTE)subStringValue,	// Value of variable in key
								  &size);	                // Length of variable in bytes
				subStringValue[size] = '\0';
				if ( wcscmp(subStringValue, LANG_FR) == 0 )
				{
					size = sizeof(wchar_t) * sizeValueData;
					memset(subStringValue, 0, MAXPATH);
					CeRegQueryValueEx(hkeyOpenFR, 		        // Open key
						              MAIN_DICT,			    // Name of variable in key
									  NULL, NULL,
									  (LPBYTE)subStringValue,	// Value of variable in key
									  &size);	                // Length of variable in bytes
					subStringValue[size] = '\0';
					if ( wcscmp(subStringValue, DICT_FR) == 0 )
					{
						// Registry ok
						fr = TRUE;
						// Close key
						CeRegCloseKey(hkeyOpenFR);
						continue;
					}
				}
				
				break;
			}
			else if ( wcscmp(subKeyName, LA) == 0 )
			{
				HKEY hkeyOpenLA;	// Open new key
				
				// reset string
				memset(CeRegPath, 0, MAXPATH);
				len = strlen(regPath);
				mbstowcs(CeRegPath, regPath, len);
				wcscat(CeRegPath, L"\\");
				wcscat(CeRegPath, LA);
				len = wcslen(CeRegPath);
				CeRegPath[len] = '\0';
				CeRegOpenKeyEx(hkeyLocalMachine, CeRegPath, 0, KEY_ALL_ACCESS, &hkeyOpenLA);
				
				size = sizeof(wchar_t) * sizeValueData;
				memset(subStringValue, 0, MAXPATH);
				CeRegQueryValueEx(hkeyOpenLA, 		        // Open key
					              LANGUAGES,			    // Name of variable in key
								  NULL, NULL,
								  (LPBYTE)subStringValue,	// Value of variable in key
								  &size);	                // Length of variable in bytes
				subStringValue[size] = '\0';
				if ( wcscmp(subStringValue, LANG_LA) == 0 )
				{
					size = sizeof(wchar_t) * sizeValueData;
					memset(subStringValue, 0, MAXPATH);
					CeRegQueryValueEx(hkeyOpenLA, 		        // Open key
									  MAIN_DICT,			    // Name of variable in key
									  NULL, NULL,
									  (LPBYTE)subStringValue,	// Value of variable in key
									  &size);	                // Length of variable in bytes
					subStringValue[size] = '\0';
					if ( wcscmp(subStringValue, DICT_LA) == 0 )
					{
						// Registry ok
						la = TRUE;
						// Close key
						CeRegCloseKey(hkeyOpenLA);
						continue;
					}
				}
			
				break;
			}				
		}	//for loop
		
		if ( index == numSubKeys)
		{
			// Registry for al languages found is ok
			CeRegCloseKey(hkeyOpenDectalk);
			m_progress_bar.SetPos(40);
			return TRUE;
		}
		
		// Registry corrupted
		MessageBoxEx(m_hWnd, "Registry has been corrupted! Check data in regsitry.",
					         "Error!", MB_OK | MB_APPLMODAL, LANG_ENGLISH );
		// Close key
		CeRegCloseKey(hkeyOpenDectalk);
		m_progress_bar.SetPos(0);
		return  FALSE;
	}   // 1st if open registry 
		// Close key
		CeRegCloseKey(hkeyOpen);
		// No dectalk in registry
		m_progress_bar.SetPos(0);
		return TRUE;
}

/* *************************************************************************************** */
/*
	GetStatus()
*/
void CCeAgentDlg::GetStatus(int count)
{

	if ( count == 5 )
		m_progress_bar.SetPos(65);
	else if ( count == 4)
		m_progress_bar.SetPos(70);
	else if ( count == 3)
		m_progress_bar.SetPos(75);
	else	//  count == 2
		m_progress_bar.SetPos(80);
}

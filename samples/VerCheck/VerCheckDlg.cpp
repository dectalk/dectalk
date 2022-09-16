 /*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1998. All rights reserved.
 *    © SMART Modular Technologies 1999. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	VerCheckDlg.cpp
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date		Description:
 * ---- ----    ------		----------------------------------------
 * 001	MGS		08/18/1998	BATS #694 Added code for default language
 * 002	MGS		08/23/1999	Changed to SMART
 */
// VerCheckDlg.cpp : implementation file
//

#include "stdafx.h"
#include "VerCheck.h"
#include "VerCheckDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CVerCheckDlg dialog

CVerCheckDlg::CVerCheckDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CVerCheckDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CVerCheckDlg)
	m_DECtalkLine = _T("");
	m_DECtalkVersion = _T("");
	m_dtalklang = _T("None");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CVerCheckDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CVerCheckDlg)
	DDX_Control(pDX, IDC_PREV, m_prevbutton);
	DDX_Control(pDX, IDC_NEXT, m_nextbutton);
	DDX_Text(pDX, IDC_DECtalkLine, m_DECtalkLine);
	DDX_Text(pDX, IDC_DECtalkVersion, m_DECtalkVersion);
	DDX_Text(pDX, IDC_DECtalkLang, m_dtalklang);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CVerCheckDlg, CDialog)
	//{{AFX_MSG_MAP(CVerCheckDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_NEXT, OnNext)
	ON_BN_CLICKED(IDC_PREV, OnPrev)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CVerCheckDlg message handlers

BOOL CVerCheckDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here

	key_index = 0;
	max_key = 0;
	if (LoadVersion(NULL) == FALSE) {
		m_nextbutton.EnableWindow(FALSE);
		m_prevbutton.EnableWindow(FALSE);
		max_key = 0;
	} else {
		max_key = GetMaxKeys();
	}
	UpdateData(FALSE);
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CVerCheckDlg::OnPaint() 
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
HCURSOR CVerCheckDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

BOOL CVerCheckDlg::LoadVersion(LPSTR filename) {
	HMODULE mod;
	ULONG (*proc)(LPSTR*);
	ULONG (*proc2)(void);
	ULONG version;
	USHORT DECtalk_maj_ver, DECtalk_min_ver;
	USHORT DECtalk_build;
	LPSTR DECtalk_version;
	DWORD err;
	char str[200];
	char pString[200];

	if (filename == NULL) {
		sprintf(pString,"dectalk.dll");
	} else {
		sprintf(pString,"dtalk_%s.DLL",filename);
	}
	mod = (HINSTANCE) LoadLibrary(pString);
	if (mod == NULL) {
		err = GetLastError();
		if (err == 193L || err == 0x1FL) {		/* Not a valid 32-bit DLL or DEV failure */
			DECtalk_maj_ver = 1;
			DECtalk_min_ver = 0;
			DECtalk_build = 0x0010;
			strcpy(str,"PC 16-bit DLL v1.0");
			sprintf(pString, "%d.%02d (build %X)",DECtalk_maj_ver,DECtalk_min_ver,DECtalk_build);
			m_DECtalkVersion = pString;
			m_DECtalkLine = str;
			return FALSE;
		} else {
			DECtalk_maj_ver = 0;
			DECtalk_min_ver = 0;
			DECtalk_build = (unsigned short) err;
			strcpy(str,"DLL not found");
			sprintf(pString, "%d.%02d (build %X)",DECtalk_maj_ver,DECtalk_min_ver,DECtalk_build);
			m_DECtalkVersion = pString;
			m_DECtalkLine = str;
			return FALSE;
		}
	}
	proc = (ULONG ((_cdecl*)(char**))) GetProcAddress(mod,"TextToSpeechVersion");
	if (proc != NULL) {
		version = proc(&DECtalk_version);
		strcpy(str, DECtalk_version);
		DECtalk_maj_ver = (unsigned short) ((version & 0xFF000000) >> 24);
		DECtalk_min_ver = (unsigned short) ((version & 0x00FF0000) >> 16);
		DECtalk_build = (unsigned short) (version & 0x0000FFFF);
		proc2 = (ULONG ((_cdecl*)(void))) GetProcAddress(mod,"TextToSpeechGetFeatures");
		if (proc2 == NULL) {
			sprintf(pString, "%d.%02d (build %X)",DECtalk_maj_ver,DECtalk_min_ver,DECtalk_build);
			m_DECtalkVersion = pString;
			m_DECtalkLine = str;
			return FALSE;
		}
		version = proc2();
		if (version & 0x00000001) {
			sprintf(pString, "%d.%02d (build %X)",DECtalk_maj_ver,DECtalk_min_ver,DECtalk_build);
			m_DECtalkVersion = pString;
			m_DECtalkLine = str;
			return TRUE;
		}
		sprintf(pString, "%d.%02d (build %X)",DECtalk_maj_ver,DECtalk_min_ver,DECtalk_build);
		m_DECtalkVersion = pString;
		m_DECtalkLine = str;
		return FALSE;
	}
	proc = (ULONG ((_cdecl*)(char**))) GetProcAddress(mod, "TextToSpeechStartup");
	if (proc != NULL) {
		DECtalk_maj_ver = 4;
		DECtalk_min_ver = 30;
		DECtalk_build = 0x0100;
		strcpy(str,"4.3 or earlier");
		sprintf(pString, "%d.%02d (build %X)",DECtalk_maj_ver,DECtalk_min_ver,DECtalk_build);
		m_DECtalkVersion = pString;
		m_DECtalkLine = str;
		return FALSE;
	}
	DECtalk_maj_ver = 1;
	DECtalk_min_ver = 0;
	DECtalk_build = 0x0010;
	strcpy(str,"PC 32-bit DLL v1.0");

	FreeLibrary(mod);

	sprintf(pString, "%d.%02d (build %X)",DECtalk_maj_ver,DECtalk_min_ver,DECtalk_build);
	m_DECtalkVersion = pString;
	m_DECtalkLine = str;
	m_dtalklang;
	return FALSE;
}

void CVerCheckDlg::OnNext() 
{
	char name[20], value[200];

	key_index++;
	if (key_index > max_key)	key_index = 0;
	if (key_index == 0) {
		LoadVersion(NULL);
		m_dtalklang = "None";
	} else {
		if (GetLangEntry(key_index-1,name,20,value,200) == FALSE)	return;
		/* BATS #694 MGS added code for default language */
		if (strcmp(name,"DefaultLang")==0)
		{
			m_DECtalkVersion = "Not Applicable";
			m_DECtalkLine = " Default Language";
			UpdateData(FALSE);
			return;
		}
		LoadVersion(name);
	}
	UpdateData(FALSE);
	return;
}

void CVerCheckDlg::OnPrev() 
{
	char name[20], value[200];
	
	if (key_index == 0)	key_index = max_key+1;
	key_index--;

	if (key_index == 0) {
		LoadVersion(NULL);
		m_dtalklang = "None";
	} else {
		if (GetLangEntry(key_index-1,name,20,value,200) == FALSE)	return;
		/* BATS #694 MGS added code for default language */
		if (strcmp(name,"DefaultLang")==0)
		{
			m_DECtalkVersion = "Not Applicable";
			m_DECtalkLine = " Default Language";
			UpdateData(FALSE);
			return;
		}
		LoadVersion(name);
	}
	UpdateData(FALSE);
	return;
}

#define LANG_REG_LOC	"Software\\DECtalk Software\\DECtalk\\Langs"

BOOL CVerCheckDlg::GetLangEntry(unsigned long int offset, LPSTR name, unsigned long int name_size, LPSTR value, unsigned long int value_size) {
	unsigned long int result, value_type;
	HKEY key;

	result = RegOpenKeyEx(HKEY_LOCAL_MACHINE, LANG_REG_LOC, 0, KEY_READ, &key);
	if (result != ERROR_SUCCESS)	return FALSE;

	result = RegEnumValue(key, offset, name, &name_size, NULL, &value_type, (unsigned char*) value, &value_size);
	if (result != ERROR_SUCCESS)	return FALSE;

	RegCloseKey(key);

	m_dtalklang = CString(value);
	return TRUE;
}

unsigned int CVerCheckDlg::GetMaxKeys(void) {
	unsigned long int result, keys;
	HKEY key;
	
	result = RegOpenKeyEx(HKEY_LOCAL_MACHINE, LANG_REG_LOC, 0, KEY_READ, &key);
	if (result != ERROR_SUCCESS)	return 0;

	result = RegQueryInfoKey(key, NULL, NULL, NULL, NULL, NULL, NULL, &keys, NULL, NULL, NULL, NULL);
	if (result != ERROR_SUCCESS)	return 0;

	RegCloseKey(key);
	return keys;
}

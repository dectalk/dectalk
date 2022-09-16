// envpatchDlg.cpp : implementation file
// COMMENTS
// 001 CAB  Fixed registry entries to change default language

#include "stdafx.h"
#include "envpatch.h"
#include "envpatchDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define NAME_SIZE			20
#define VALUE_SIZE			2000

// The following needs to be recieved from coop.h in the future.
// This will help out in revision and licensee changes easy to code.
#define LANG_REG_LOC		"Software\\DECtalk Software\\DECtalk\\Langs"
#define DEFLANG_REG_LOC		"Software\\DECtalk Software\\DECtalk\\4.60"

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
// CEnvpatchDlg dialog

CEnvpatchDlg::CEnvpatchDlg(CWnd* pParent /*=NULL*/)
    : CDialog(CEnvpatchDlg::IDD, pParent)
{
    //{{AFX_DATA_INIT(CEnvpatchDlg)
	//}}AFX_DATA_INIT
    // Note that LoadIcon does not require a subsequent DestroyIcon in Win32
    m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CEnvpatchDlg::DoDataExchange(CDataExchange* pDX)
{
    CDialog::DoDataExchange(pDX);
    //{{AFX_DATA_MAP(CEnvpatchDlg)
	DDX_Control(pDX, IDC_LANG_INITALS, m_langchoice_initals);
    DDX_Control(pDX, IDC_LANGLIST, m_langchoice);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CEnvpatchDlg, CDialog)
    //{{AFX_MSG_MAP(CEnvpatchDlg)
    ON_WM_SYSCOMMAND()
    ON_WM_PAINT()
    ON_WM_QUERYDRAGICON()
    ON_LBN_DBLCLK(IDC_LANGLIST, OnDblclkLanglist)
	ON_BN_CLICKED(IDC_UPDATE, OnUpdate)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CEnvpatchDlg message handlers

BOOL CEnvpatchDlg::OnInitDialog()
{
    CDialog::OnInitDialog();

    // Add "About..." menu item to system menu.

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
    SetIcon(m_hIcon, TRUE);         // Set big icon
    SetIcon(m_hIcon, FALSE);        // Set small icon
    
    // TODO: Add extra initialization here
    key_index = 0;
    max_key = GetMaxKeys();

	GetDefaultLang();
	UpdateLangBox();

    GetLangs();

    UpdateData(FALSE);

    return TRUE;  // return TRUE  unless you set the focus to a control
}

void CEnvpatchDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CEnvpatchDlg::OnPaint() 
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
HCURSOR CEnvpatchDlg::OnQueryDragIcon()
{
    return (HCURSOR) m_hIcon;
}


/////////////////////////////////////////////////////////////////////////////
// Registry Stuff

BOOL CEnvpatchDlg::GetLangEntry(unsigned long int offset, LPSTR name, unsigned long int name_size, LPSTR value, unsigned long int value_size) {
    unsigned long int result, value_type;
    HKEY key;

    result = RegOpenKeyEx(HKEY_LOCAL_MACHINE, LANG_REG_LOC, 0, KEY_READ, &key);
    if (result != ERROR_SUCCESS)    return FALSE;

    result = RegEnumValue(key, offset, name, &name_size, NULL, &value_type, (unsigned char*) value, &value_size);
    if (result != ERROR_SUCCESS)    return FALSE;

    RegCloseKey(key);
    return TRUE;
}

// More Registry Stuff

unsigned int CEnvpatchDlg::GetMaxKeys(void) {
    unsigned long int result, keys;
    HKEY key;
    
    result = RegOpenKeyEx(HKEY_LOCAL_MACHINE, LANG_REG_LOC, 0, KEY_READ, &key);
    if (result != ERROR_SUCCESS)    return 0;

    result = RegQueryInfoKey(key, NULL, NULL, NULL, NULL, NULL, NULL, &keys, NULL, NULL, NULL, NULL);
    if (result != ERROR_SUCCESS)    return 0;

    RegCloseKey(key);
    return keys;
}

BOOL CEnvpatchDlg::GetDefaultLang() {
	HKEY hKey = NULL;
	DWORD dwDataType = REG_SZ;
	DWORD cbData = 30;

	if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,DEFLANG_REG_LOC,0,KEY_QUERY_VALUE,&hKey)!= ERROR_SUCCESS)
		return FALSE;

	if(RegQueryValueEx(hKey,"DefaultLang",0,&dwDataType,(LPBYTE)default_lang,&cbData)!= ERROR_SUCCESS)
			return FALSE;

	// Reset for size
	cbData = 30;
	if(RegQueryValueEx(hKey,default_lang,0,&dwDataType,(LPBYTE)lang_choice,&cbData)!= ERROR_SUCCESS)
			return FALSE;
	//strcpy(lang_choice,default_lang);

	return TRUE;
}

BOOL CEnvpatchDlg::SetDefaultLang() {
	HKEY hKey = NULL;
	DWORD dwDataType = REG_SZ;
	DWORD cbData = 30;

	if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,LANG_REG_LOC,0,KEY_SET_VALUE,&hKey)!= ERROR_SUCCESS)
		return FALSE;

	cbData = strlen(default_lang) + 1;	
	if(RegSetValueEx(hKey,"DefaultLang", 0, REG_SZ,(LPBYTE)default_lang,cbData)!= ERROR_SUCCESS)
		return FALSE;

	return TRUE;
}

BOOL CEnvpatchDlg::GetLangs(void) {
    unsigned long int name_len = NAME_SIZE;
    unsigned long int value_len = VALUE_SIZE;
    unsigned int key_index = 0;
    char name[NAME_SIZE], value[VALUE_SIZE];

	// CLEAR OUT EVERYTHING
    m_langchoice.ResetContent();
    m_langchoice_initals.ResetContent();

    while (key_index < max_key)    {
		if (GetLangEntry(key_index,name,NAME_SIZE,value,VALUE_SIZE) == FALSE)	return FALSE;
		m_langchoice.AddString((const char*) value);
		m_langchoice_initals.AddString((const char*) name);

		key_index++;
    }

    UpdateData(FALSE);
    return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// Other Functions

void CEnvpatchDlg::OnDblclkLanglist() 
{
    // TODO: Add your control notification handler code here
	int nIndex;
	nIndex = m_langchoice.GetCurSel();
	m_langchoice.GetText( nIndex, lang_choice);
	m_langchoice_initals.GetText(nIndex, default_lang);
    SetDefaultLang();
	UpdateLangBox();
    UpdateData(FALSE);

	// Copy files here

	// -- Wait until SAPI stuff is done --
	// DECtalk.dll DTLKttse.dll and DECtalk.dic

	// Don't copy dectalk.dll to the system directory if multi-lang is set in the registry.
	// Just set the DefaultLang entry in the registry.

	// COPY DTLKttse.dll everytime.

	// NO NEED TO MESS with DECtalk.dic.  Once the DefaultLang entry is set then the programs
	// should know where to look for the dictionary files.

	// Therefore: all that needs to be done is:
	// copy dtlkttse.dll to windows\system\speech
	// if (multilang == 1) /*from the registry*/ you are done
	// else copy dectalk.dll to windows\system
	// And that's it.

	// Also use #if sections for WillowPond stuff

	char message[1024];
	sprintf(message,"The Current Default Language has been set to\n\n%s",lang_choice);
	MessageBox(message,"NOTE:",MB_ICONINFORMATION);
}

void CEnvpatchDlg::OnUpdate() 
{
	// TODO: Add your control notification handler code here
    OnDblclkLanglist();
}

void CEnvpatchDlg::UpdateLangBox(void) {
	SetDlgItemText(IDC_DEFAULT_LANG_INITALS, (LPCTSTR) default_lang);
	SetDlgItemText(IDC_DEFAULT_LANG,  (LPCTSTR) lang_choice);
	return;
}


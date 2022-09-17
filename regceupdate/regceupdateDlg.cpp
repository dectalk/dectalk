// regceupdateDlg.cpp : implementation file
//

#include "stdafx.h"
#include "regceupdate.h"
#include "regceupdateDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRegceupdateDlg dialog

CRegceupdateDlg::CRegceupdateDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRegceupdateDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRegceupdateDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CRegceupdateDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRegceupdateDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CRegceupdateDlg, CDialog)
	//{{AFX_MSG_MAP(CRegceupdateDlg)
	ON_BN_CLICKED(IDC_UPDATE, OnUpdate)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRegceupdateDlg message handlers

BOOL CRegceupdateDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	CenterWindow(GetDesktopWindow());	// center to the hpc screen

	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}


//Update DECTALK registry
void CRegceupdateDlg::OnUpdate() 
{


	HKEY hKey;
	HKEY hKeyLang;
	HKEY hKeyLangUS;
	HKEY hKeyLangUK;
	HKEY hKeyLangSP;
	HKEY hKeyLangLA;
	HKEY hKeyLangFR;
	HKEY hKeyLangGR;
	HKEY hKeyUserDict;

	DWORD dwDisp;
	TCHAR szStr[200];

/*SET the HKEY_CURRENT_USER\SOFTWARE\DECtalk Software\DECtalk\4.61*********/

	if(RegCreateKeyEx(HKEY_CURRENT_USER, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61\\US"),
					0, NULL, 0, 0, NULL,
					&hKeyUserDict, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.
				
		MessageBox(TEXT("Could not open/create key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

		return;
	}

	//set UserDict
	wcscpy(szStr, _T("\\DECTALK\\USER.DIC"));
	if(RegSetValueEx(hKeyUserDict, _T("UserDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save US USER DICT key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61*********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61"),
					0, NULL, 0, 0, NULL,
					&hKey, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.
				
		MessageBox(TEXT("Could not open/create key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

		return;
	}

	//set multilang key
	wcscpy(szStr, _T("1"));
	if(RegSetValueEx(hKey, _T("MultiLang"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set licenses
	wcscpy(szStr, _T("Do30Qb20Dt41"));
	if(RegSetValueEx(hKey, _T("Licenses"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);



/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\Langs *********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\Langs"),
					0, NULL, 0, 0, NULL,
					&hKeyLang, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.
				
		MessageBox(TEXT("Could not open/create key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

		return;
	}


	//set languages
	wcscpy(szStr, _T("ENGLISH,US"));
	if(RegSetValueEx(hKeyLang, _T("US"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save US key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	wcscpy(szStr, _T("ENGLISH,UK"));
	if(RegSetValueEx(hKeyLang, _T("UK"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save UK key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	wcscpy(szStr, _T("GERMAN"));
	if(RegSetValueEx(hKeyLang, _T("GR"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save GR key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	wcscpy(szStr, _T("LATIN AMERICAN"));
	if(RegSetValueEx(hKeyLang, _T("LA"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save LA key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	wcscpy(szStr, _T("SPANISH"));
	if(RegSetValueEx(hKeyLang, _T("SP"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save SP key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	wcscpy(szStr, _T("FRENCH"));
	if(RegSetValueEx(hKeyLang, _T("FR"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save FR key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set default language
	wcscpy(szStr, _T("US"));
	if(RegSetValueEx(hKeyLang, _T("DefaultLang"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);


/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61\US *********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61\\US"),
					0, NULL, 0, 0, NULL,
					&hKeyLangUS, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.				
		MessageBox(TEXT("Could not open/create US key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return;
	}

	//set MainDict
	wcscpy(szStr, _T("\\DECTALK\\DTALK_US.DIC"));
	if(RegSetValueEx(hKeyLangUS, _T("MainDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save US key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set Language Key
	wcscpy(szStr, _T("ENGLISH,US"));
	if(RegSetValueEx(hKeyLangUS, _T("Language"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save US key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61\UK *********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61\\UK"),
					0, NULL, 0, 0, NULL,
					&hKeyLangUK, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.				
		MessageBox(TEXT("Could not open/create UK key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return;
	}

	//set MainDict
	wcscpy(szStr, _T("\\DECTALK\\DTALK_UK.DIC"));
	if(RegSetValueEx(hKeyLangUK, _T("MainDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save US key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set Language Key
	wcscpy(szStr, _T("ENGLISH,UK"));
	if(RegSetValueEx(hKeyLangUK, _T("Language"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save US key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);


/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61\SP *********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61\\SP"),
					0, NULL, 0, 0, NULL,
					&hKeyLangSP, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.				
		MessageBox(TEXT("Could not open/create SP key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return;
	}

	//set MainDict
	wcscpy(szStr, _T("\\DECTALK\\DTALK_SP.DIC"));
	if(RegSetValueEx(hKeyLangSP, _T("MainDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save SP key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set Language Key
	wcscpy(szStr, _T("SPANISH"));
	if(RegSetValueEx(hKeyLangSP, _T("Language"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save SP key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);


/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61\LA *********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61\\LA"),
					0, NULL, 0, 0, NULL,
					&hKeyLangLA, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.				
		MessageBox(TEXT("Could not open/create LA key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return;
	}

	//set MainDict
	wcscpy(szStr, _T("\\DECTALK\\DTALK_LA.DIC"));
	if(RegSetValueEx(hKeyLangLA, _T("MainDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save LA key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set Language Key
	wcscpy(szStr, _T("LATIN AMERICAN"));
	if(RegSetValueEx(hKeyLangLA, _T("Language"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save LA key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);


/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61\GR *********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61\\GR"),
					0, NULL, 0, 0, NULL,
					&hKeyLangGR, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.				
		MessageBox(TEXT("Could not open/create GR key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return;
	}

	//set MainDict
	wcscpy(szStr, _T("\\DECTALK\\DTALK_GR.DIC"));
	if(RegSetValueEx(hKeyLangGR, _T("MainDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save GR key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
	
	//set ForiegnDict
	wcscpy(szStr, _T("\\DECTALK\\DTALK_FL_GR.DIC"));
	if(RegSetValueEx(hKeyLangGR, _T("ForeignDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save GR FOREIGN key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set Language Key
	wcscpy(szStr, _T("GERMAN"));
	if(RegSetValueEx(hKeyLangGR, _T("Language"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save GR key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);


/*SET the HKEY_LOCAL_MACHINE\SOFTWARE\DECtalk Software\DECtalk\4.61\FR *********/

	if(RegCreateKeyEx(HKEY_LOCAL_MACHINE, 
					_T("Software\\DECtalk Software\\DECtalk\\4.61\\FR"),
					0, NULL, 0, 0, NULL,
					&hKeyLangFR, &dwDisp) != ERROR_SUCCESS)
	{
		// Warning! Key could have been created, but not opened.				
		MessageBox(TEXT("Could not open/create FR key:"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);
		return;
	}

	//set MainDict
	wcscpy(szStr, _T("\\DECTALK\\DTALK_FR.DIC"));
	if(RegSetValueEx(hKeyLangFR, _T("MainDict"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save FR key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);

	//set Language Key
	wcscpy(szStr, _T("FRENCH"));
	if(RegSetValueEx(hKeyLangFR, _T("Language"), NULL, 
			REG_SZ, (LPBYTE)szStr, 
			(wcslen(szStr) + 1) * sizeof(TCHAR)) != ERROR_SUCCESS)
		MessageBox(TEXT("could not save FR key"), TEXT("ERROR"), MB_OK | MB_ICONSTOP);



	//close all keys
	RegCloseKey(hKey);
	RegCloseKey(hKeyLang); 
	RegCloseKey(hKeyLangUS); 
	RegCloseKey(hKeyLangUK); 
	RegCloseKey(hKeyLangSP); 
	RegCloseKey(hKeyLangFR); 
	RegCloseKey(hKeyLangGR); 
	RegCloseKey(hKeyLangLA);

	MessageBox(TEXT("Registry Updated Sucessfully"), TEXT("Registry Upadate"), MB_OK | MB_ICONSTOP);

	CDialog::DestroyWindow();
	
	return;

}





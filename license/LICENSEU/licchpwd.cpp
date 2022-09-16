/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995-98. All rights reserved.
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
 */
// LicChPwd.cpp : implementation file
// tek 21oct96 fixed encryption error checking
// cjl 11mar98 Add VALIDATION_BYPASS for new release value generation
//

#include "stdafx.h"
#include "LicenseU.h"
#include "LicChPwd.h"
#include "license.h"
#include "dectalkf.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLicChPwd dialog


CLicChPwd::CLicChPwd(CWnd* pParent /*=NULL*/)
	: CDialog(CLicChPwd::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLicChPwd)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CLicChPwd::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLicChPwd)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLicChPwd, CDialog)
	//{{AFX_MSG_MAP(CLicChPwd)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLicChPwd message handlers

void CLicChPwd::OnOK() 
{
	// TODO: Add extra validation here
    CHAR szOldPassword[64],
         szNewPassword[64],
         szVerifyPassword[64],
         szEncryptedOldPwd[134];
    int nPwdLen,nResult;

    nResult = GetLicensePassword((unsigned char *)szEncryptedOldPwd);
    if(nResult == LICENSE_KEY_REG_OPEN_ERROR)
	{
        AfxMessageBox("Unable to access Registry entry for License Password",MB_OK);
	return;
	}
	else if(nResult == LICENSE_KEY_REG_QUERY_ERROR)
	{
        AfxMessageBox("Unable to retrieve the License Password from Registry",MB_OK);
	return;
	}

    nResult = decryptString((const unsigned char *)szEncryptedOldPwd,LICENSE_KEY,(unsigned char *)szOutString);
    if (nResult)
	{
#ifndef VALIDATION_BYPASS
        AfxMessageBox("Invalid Registry entry for License Password",MB_OK);
#endif  //VALIDATION_BYPASS
		return;
	}

	
    nPwdLen = GetDlgItemText(IDC_OLDPASSWORD,szOldPassword,MAX_DLG_STR);
    szOldPassword[nPwdLen] = '\0';
    
#ifndef VALIDATION_BYPASS
    if(strcmp(szOutString,szOldPassword)==0)
#endif //VALIDATION_BYPASS
    {
        nPwdLen = GetDlgItemText(IDC_NEWPASSWORD,szNewPassword,MAX_DLG_STR);
        szNewPassword[nPwdLen] = '\0';

        nPwdLen = GetDlgItemText(IDC_CONFIRMPASSWORD,szVerifyPassword,MAX_DLG_STR);
        szVerifyPassword[nPwdLen] = '\0';

        if(strcmp(szNewPassword,szVerifyPassword)==0)
        {
            encryptString((const unsigned char *)szNewPassword,LICENSE_KEY,(unsigned char *)szOutString);
			nResult = UpdateLicensePassword((const unsigned char *)szOutString);
			if(nResult == LICENSE_KEY_REG_OPEN_ERROR)
				AfxMessageBox("Unable to access Registry entry for License Password",MB_OK);
			else if(nResult == LICENSE_KEY_REG_UPDATE_ERROR)
				AfxMessageBox("Unable to Update the License Password from Registry",MB_OK);

            CDialog::OnOK();
        }
        else 
        {
            AfxMessageBox("Invalid New password..Verify correctly",MB_OK);
            GotoDlgCtrl(GetDlgItem(IDC_NEWPASSWORD));
        }
    }   
#ifndef VALIDATION_BYPASS
    else
    {
        AfxMessageBox("Old Password is incorrect",MB_OK);
        GotoDlgCtrl(GetDlgItem(IDC_OLDPASSWORD));
    }
#endif //VALIDATION_BYPASS
	
}

void CLicChPwd::OnCancel() 
{
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}

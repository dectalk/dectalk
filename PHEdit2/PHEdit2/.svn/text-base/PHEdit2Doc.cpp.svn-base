// PHEdit2Doc.cpp : implementation of the CPHEdit2Doc class
//
// 001 MGS	03/02/2001	Fixed the export funciton, sort of.
//				it wont really work though

#include "stdafx.h"
#include "PHEdit2.h"

#include "PHEdit2Doc.h"
#include "PHfileio.h"
#include "RevControl.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#ifdef DEBUG
#define DELETE_EXCEPTION(e) do { e->Delete(); } while (0)
#else
#define DELETE_EXCEPTION(e)
#endif

#ifndef _DEBUG
#ifndef NON_DEMO
#define DEMO
#endif
#endif

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2Doc

IMPLEMENT_DYNCREATE(CPHEdit2Doc, CDocument)

BEGIN_MESSAGE_MAP(CPHEdit2Doc, CDocument)
	//{{AFX_MSG_MAP(CPHEdit2Doc)
	ON_COMMAND(IDM_EXPORT, OnExport)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2Doc construction/destruction

CPHEdit2Doc::CPHEdit2Doc()
{
}

CPHEdit2Doc::~CPHEdit2Doc()
{
}

BOOL CPHEdit2Doc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	base.type_id = -1;
	base.phoneme_count = 0;
	base.phonemes = NULL;
	filechanged=0;
	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CPHEdit2Doc serialization

void CPHEdit2Doc::Serialize(CArchive& ar)
{
	PHFileIO fileio;
	RevControl rev;
#ifndef DEMO
	char temp[512];
#endif

	if (ar.IsStoring())
	{
		SerializeViews(ar);
#ifdef DEMO
		MessageBox(NULL, "Unable to save files in DEMO mode.", "PH Edit² Error", MB_OK | MB_ICONSTOP);
#else
		if (rev.DoModal() == IDCANCEL) {
			AfxThrowFileException(101);
		}
		sprintf((char*) temp,"[%d] %s",rev.m_bats,rev.m_reason);

		if (fileio.SavePHD(ar, &base, (U8*) temp) == FALSE) {
			AfxThrowFileException(101);
		}
#endif
	}
	else
	{
		if (fileio.LoadPHD(ar, &base) == FALSE) {
			base.phoneme_count = 0;
			AfxThrowFileException(100);
		}
	}
}

void CDocument::ReportSaveLoadException(LPCTSTR lpszPathName,
	CException* e, BOOL bSaving, UINT nIDPDefault)
{
	UINT nIDP = nIDPDefault;
	UINT nHelpContext = nIDPDefault;
	CString prompt;

	if (e != NULL)
	{
		ASSERT_VALID(e);
		if (e->IsKindOf(RUNTIME_CLASS(CFileException))) {
			TRACE1("Reporting file I/O exception on Save/Load with lOsError = $%lX.\n",
				((CFileException*)e)->m_lOsError);

			CFileException* pFileException = (CFileException*)e;
			if (pFileException->m_strFileName.IsEmpty())
				pFileException->m_strFileName = lpszPathName;

			LPTSTR lpszMessage = prompt.GetBuffer(255);
			ASSERT(lpszMessage != NULL);
			switch (((CFileException*)e)->m_cause)
			{
				case CFileException::fileNotFound:
				case CFileException::badPath:
					nIDP = AFX_IDP_FAILED_INVALID_PATH;
					break;
				case CFileException::diskFull:
					nIDP = AFX_IDP_FAILED_DISK_FULL;
					break;
				case CFileException::accessDenied:
					nIDP = bSaving ? AFX_IDP_FAILED_ACCESS_WRITE :
							AFX_IDP_FAILED_ACCESS_READ;
					break;
					case CFileException::badSeek:
				case CFileException::generic:
				case CFileException::tooManyOpenFiles:
				case CFileException::invalidFile:
				case CFileException::hardIO:
				case CFileException::directoryFull:
					break;

				case 100:
					prompt = "File not a valid PHD file format";
					break;
				case 101:
					prompt = "No valid data, or error writing file";
					break;

				default:
					break;
			}
			prompt.ReleaseBuffer();
		}
	}

	AfxMessageBox(prompt, MB_ICONEXCLAMATION, nHelpContext);
}

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2Doc diagnostics

#ifdef _DEBUG
void CPHEdit2Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CPHEdit2Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CPHEdit2Doc commands

/////////////////////////////////////////////////////////////////////////////
// CPhedit2Doc commands

void CPHEdit2Doc::OnFileExportPhrom(void)
{
	CString newName;
	CDocTemplate* pTemplate = GetDocTemplate();
	int iBad;
	CString strExt;

	ASSERT(pTemplate != NULL);

	newName = m_strPathName;
	if (newName.IsEmpty()) {
		newName = m_strTitle;
		iBad = newName.FindOneOf(_T(" #%;/\\"));	// check for dubious filename
		if (iBad != -1)		newName.ReleaseBuffer(iBad);

		// append the default suffix if there is one
		if (pTemplate->GetDocString(strExt, CDocTemplate::filterExt) && !strExt.IsEmpty()) {
			ASSERT(strExt[0] == '.');
			newName += strExt;
		}
	}

	if (!AfxGetApp()->DoPromptFileName(newName, AFX_IDS_SAVEFILE,
			OFN_HIDEREADONLY | OFN_PATHMUSTEXIST, FALSE, pTemplate))
		return;       // don't even attempt to save

	CWaitCursor wait;

	if (!ExportDocument(newName))
	{
		TRY
		{
			CFile::Remove(newName);
		}
		CATCH_ALL(e)
		{
			TRACE0("Warning: failed to delete file after failed SaveAs.\n");
			DELETE_EXCEPTION(e);
		}
		END_CATCH_ALL
		return;
	}
	return;        // success
}

BOOL CPHEdit2Doc::ExportDocument(LPCTSTR lpszPathName)
{
	CFileException fe;
	CFile* pFile = NULL;
	pFile = GetFile(lpszPathName, CFile::modeCreate |
		CFile::modeReadWrite | CFile::shareExclusive, &fe);

	if (pFile == NULL)
	{
		ReportSaveLoadException(lpszPathName, &fe,
			TRUE, AFX_IDP_INVALID_FILENAME);
		return FALSE;
	}

	CArchive saveArchive(pFile, CArchive::store | CArchive::bNoFlushOnDelete);
	saveArchive.m_pDocument = this;
	saveArchive.m_bForceFlat = FALSE;
	TRY
	{
		CWaitCursor wait;
		PHFileIO fileio;
		SerializeViews(saveArchive);
		if (fileio.SaveROM(saveArchive, base, "us", "") == 0)		AfxThrowFileException(101);
		saveArchive.Close();
		ReleaseFile(pFile, FALSE);
	}
	CATCH_ALL(e)
	{
		ReleaseFile(pFile, TRUE);

		TRY
		{
			ReportSaveLoadException(lpszPathName, e,
				TRUE, AFX_IDP_FAILED_TO_SAVE_DOC);
		}
		END_TRY
		DELETE_EXCEPTION(e);
		return FALSE;
	}
	END_CATCH_ALL

	SetModifiedFlag(FALSE);     // back to unmodified
	return TRUE;        // success
}

void CPHEdit2Doc::OnFileImportPhrom(void)
{
	CString newName;
	CDocTemplate* pTemplate = GetDocTemplate();
	int iBad;
	CString strExt;

	ASSERT(pTemplate != NULL);

	newName = m_strPathName;
	if (newName.IsEmpty()) {
		newName = m_strTitle;
		iBad = newName.FindOneOf(_T(" #%;/\\"));	// check for dubious filename
		if (iBad != -1)		newName.ReleaseBuffer(iBad);

		// append the default suffix if there is one
		if (pTemplate->GetDocString(strExt, CDocTemplate::filterExt) && !strExt.IsEmpty()) {
			ASSERT(strExt[0] == '.');
			newName += strExt;
		}
	}

	if (!AfxGetApp()->DoPromptFileName(newName, AFX_IDS_OPENFILE,
			OFN_HIDEREADONLY | OFN_PATHMUSTEXIST, FALSE, pTemplate))
		return;       // don't even attempt to save

	CWaitCursor wait;

	if (!ImportDocument(newName))
	{
		TRY
		{
			CFile::Remove(newName);
		}
		CATCH_ALL(e)
		{
			TRACE0("Warning: failed to delete file after failed SaveAs.\n");
			DELETE_EXCEPTION(e);
		}
		END_CATCH_ALL
		return;
	}
	return;        // success
}

BOOL CPHEdit2Doc::ImportDocument(LPCTSTR lpszPathName)
{
	if (IsModified())
		TRACE0("Warning: OnOpenDocument replaces an unsaved document.\n");

	CFileException fe;
	CFile* pFile = GetFile(lpszPathName,
		CFile::modeRead|CFile::shareDenyWrite, &fe);
	if (pFile == NULL)
	{
		ReportSaveLoadException(lpszPathName, &fe,
			FALSE, AFX_IDP_FAILED_TO_OPEN_DOC);
		return FALSE;
	}

	DeleteContents();
	SetModifiedFlag();  // dirty during de-serialize

	CArchive loadArchive(pFile, CArchive::load | CArchive::bNoFlushOnDelete);
	loadArchive.m_pDocument = this;
	loadArchive.m_bForceFlat = FALSE;
	TRY
	{
		CWaitCursor wait;
		PHFileIO fileio;
		if (fileio.LoadROM(loadArchive, &base) == 0)		AfxThrowFileException(100);
		loadArchive.Close();
		ReleaseFile(pFile, FALSE);
	}
	CATCH_ALL(e)
	{
		ReleaseFile(pFile, TRUE);
		DeleteContents();   // remove failed contents

		TRY
		{
			ReportSaveLoadException(lpszPathName, e,
				FALSE, AFX_IDP_FAILED_TO_OPEN_DOC);
		}
		END_TRY
		DELETE_EXCEPTION(e);
		return FALSE;
	}
	END_CATCH_ALL

	SetModifiedFlag(FALSE);     // start off with unmodified
	return TRUE;
}

void CPHEdit2Doc::OnExport() 
{
	// TODO: Add your command handler code here
	OnFileExportPhrom();
}

void CPHEdit2Doc::OnCloseDocument() 
{
	// TODO: Add your specialized code here and/or call the base class
	int ret;
	if (filechanged)
	{
			SetModifiedFlag(TRUE);     // start off with unmodified
	}
	else
	{
		SetModifiedFlag(FALSE);
	}
		ret=SaveModified();		
		if (ret==0)
		{
			return;
		}
		

	if (base.phoneme_count > 0)		free(base.phonemes);
	CDocument::OnCloseDocument();
}

void CPHEdit2Doc::SerializeViews(CArchive& ar) {
	POSITION pos = GetFirstViewPosition();
	
	while (pos != NULL) {
		CView* pView = GetNextView(pos);
		pView->Serialize(ar);
	}
	return;
}

BOOL CPHEdit2Doc::OnSaveDocument(LPCTSTR lpszPathName) 
{
	// TODO: Add your specialized code here and/or call the base class
	filechanged=0;	
	SetModifiedFlag(FALSE);
	return CDocument::OnSaveDocument(lpszPathName);
}

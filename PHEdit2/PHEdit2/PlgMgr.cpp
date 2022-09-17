// PlgMgr.cpp : implementation file
//

#include "stdafx.h"
#include "PHEdit2.h"
#include "PlgMgr.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// PlgMgr dialog


PlgMgr::PlgMgr(CWnd* pParent /*=NULL*/)
	: CDialog(PlgMgr::IDD, pParent)
{
	//{{AFX_DATA_INIT(PlgMgr)
	//}}AFX_DATA_INIT
	plugins = NULL;
	DataPlugins = NULL;
}


void PlgMgr::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(PlgMgr)
	DDX_Control(pDX, IDC_CLOSEALL, m_closeallCtl);
	DDX_Control(pDX, IDC_RESCAN, m_rescanCtl);
	DDX_Control(pDX, IDC_PLUGINS, m_pluginsCtl);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(PlgMgr, CDialog)
	//{{AFX_MSG_MAP(PlgMgr)
	ON_BN_CLICKED(IDC_CLOSEALL, OnCloseall)
	ON_BN_CLICKED(IDC_RESCAN, OnRescan)
	ON_LBN_DBLCLK(IDC_PLUGINS, OnDblclkPlugins)
	ON_BN_CLICKED(IDC_CONFIG, OnConfig)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// PlgMgr message handlers

void PlgMgr::OnCloseall() 
{
	if (plugins != NULL)		plugins->ClosePlugins();
	if (DataPlugins != NULL)	DataPlugins->ClosePlugins();
	DisplayList();
	return;	
}

void PlgMgr::OnRescan() 
{
	OnCloseall();
	if (plugins != NULL) {
		plugins->LoadPlugins();
		plugins->Init(cWnd);
	}
	if (DataPlugins != NULL)	DataPlugins->LoadPlugins();
	DisplayList();
	return;
}

BOOL PlgMgr::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	DisplayList();	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void PlgMgr::DisplayList(void) {
	PHEdit2PlugIn *plug;
	PHEdit2DataPlugIn *data;
	char temp[512];
	int id;

	TestPlugins();
	m_pluginsCtl.ResetContent();
	id = 0;
	do {
		plug = plugins->GetPlugIn(id);
		if (plug != NULL) {
			if (plug->bEnabled)		sprintf(temp,"* %s - %s",plug->Name, plug->Manufacturer);
			else					sprintf(temp,"  %s - %s",plug->Name, plug->Manufacturer);
			m_pluginsCtl.AddString(temp);
			id++;
		}
	} while (plug != NULL);
	AudioPlugs = id;
	id = 0;
	do {
		data = DataPlugins->GetPlugIn(id);
		if (data != NULL) {
			if (data->bEnabled)		sprintf(temp,"* %s - %s",data->Name, data->Manufacturer);
			else					sprintf(temp,"  %s - %s",data->Name, data->Manufacturer);
			m_pluginsCtl.AddString(temp);
		}
		id++;
	} while (data != NULL);

	return;
}

void PlgMgr::OnDblclkPlugins() 
{
	PHEdit2PlugIn *plug, *list;
	PHEdit2DataPlugIn *data;
	int id;

	id = m_pluginsCtl.GetCurSel();
	if (id >= AudioPlugs) {
		id -= AudioPlugs;
		if (id < 0 || DataPlugins == NULL || DataPlugins->GetPlugIn(id) == NULL)	return;
		data = DataPlugins->GetPlugIn(id);
		if (data->bEnabled)		data->bEnabled = FALSE;
		else					data->bEnabled = TRUE;
	} else {
		if (plugins == NULL || plugins->GetPlugIn(id) == NULL)						return;
		plug = plugins->GetPlugIn(id);
		if (plug->bEnabled)		plug->bEnabled = FALSE;
		else					plug->bEnabled = TRUE;
		if (plug->PlugInPosition == PLUGIN_KLSYN || plug->PlugInPosition == PLUGIN_PLAYER) {
			id = 0;
			do {
				list = plugins->GetPlugIn(id);
				if (list != NULL && list != plug && list->PlugInPosition == plug->PlugInPosition) {
					list->bEnabled = FALSE;
				}
				id++;
			} while (list != NULL);
		}
	}
	DisplayList();
	return;
}

void PlgMgr::OnConfig() 
{
	PHEdit2PlugIn *plug;
	PHEdit2DataPlugIn *data;
	int id;

	id = m_pluginsCtl.GetCurSel();
	if (id >= AudioPlugs) {
		id -= AudioPlugs;
		if (id < 0 || DataPlugins == NULL || DataPlugins->GetPlugIn(id) == NULL)	return;
		data = DataPlugins->GetPlugIn(id);
		data->Config(data);
	} else {
		if (plugins == NULL || plugins->GetPlugIn(id) == NULL)						return;
		plug = plugins->GetPlugIn(id);
		plug->Config(plug);
	}
	DisplayList();
	return;
}

void PlgMgr::TestPlugins(void) {		// Test for duplicate level 1 or level 5
	PHEdit2PlugIn *list;
	BOOL bIsSynth = FALSE;
	BOOL bIsPlayer = FALSE;
	int id;

	id = 0;
	do {
		list = plugins->GetPlugIn(id);
		if (list != NULL && list->bEnabled == TRUE) {
			if (list->PlugInPosition == PLUGIN_KLSYN) {
				if (bIsSynth == TRUE)	list->bEnabled = FALSE;
				else					bIsSynth = TRUE;
			}
			if (list->PlugInPosition == PLUGIN_PLAYER) {
				if (bIsPlayer == TRUE)	list->bEnabled = FALSE;
				else					bIsPlayer = TRUE;
			}
		}
		id++;
	} while (list != NULL);
	return;
}

/*
 * Plug-ins System
 *  Designed by: Kevin Bruckert
 */

#include "stdafx.h"
#include "PHEdit2.h"
#include "MainForm.h"
#include "dataplug.h"

DataPlugIn::DataPlugIn(void) {
	plugins = NULL;
}

BOOL DataPlugIn::LoadPlugins(void) {
    CFileFind finder;
    BOOL bWorking = finder.FindFile("*.PDI");
	PHEdit2LoadedDataPlugIn *list = plugins;
	HINSTANCE tempLib;

    while (bWorking) {
        bWorking = finder.FindNextFile();
		tempLib = LoadLibrary((LPCTSTR)finder.GetFileName());
		if (tempLib != NULL) {
			if (list == NULL) {
				list = (PHEdit2LoadedDataPlugIn*) malloc(sizeof(PHEdit2LoadedDataPlugIn));
				if (list == NULL)	return FALSE;
				plugins = list;
			} else {
				list->next = (PHEdit2LoadedDataPlugIn*) malloc(sizeof(PHEdit2LoadedDataPlugIn));
				if (list->next == NULL)	return FALSE;
				list = list->next;
			}
			list->next = NULL;
			list->dll = tempLib;
			list->plugin = (PHEdit2DataPlugIn*) malloc(sizeof(PHEdit2DataPlugIn));
			if (list->plugin == NULL) {
				return FALSE;
			}
			list->plugin->bEnabled = TRUE;
			list->plugin->hwndParent = NULL;
			list->plugin->hDllInstance = tempLib;
			list->plugin->base = NULL;
			list->plugin->Config = (BOOL (*)(struct PHEdit2DataPlugInStruct*)) GetProcAddress(tempLib, "Config");
			list->plugin->Init = (BOOL (*)(struct PHEdit2DataPlugInStruct*)) GetProcAddress(tempLib, "Init");
			list->plugin->Report = (BOOL (*)(struct PHEdit2DataPlugInStruct*)) GetProcAddress(tempLib, "Report");
			list->plugin->Quit = (BOOL (*)(struct PHEdit2DataPlugInStruct*)) GetProcAddress(tempLib, "Quit");
			list->plugin->Init(list->plugin);
		}
	}
	return TRUE;
}

BOOL DataPlugIn::ClosePlugins(void) {
	PHEdit2LoadedDataPlugIn *list = plugins;

	while (list != NULL) {
		if (list->plugin != NULL && list->plugin->bEnabled == TRUE)		list->plugin->Quit(list->plugin);
		list->plugin->bEnabled = FALSE;
		FreeLibrary(list->dll);
		free(list->plugin);
		list = list->next;
		free(plugins);
		plugins = list;
	}
	return TRUE;
}

/* Plug-in hooks */
BOOL DataPlugIn::Config(phone_type_struct *base, phonemic_struct *CurrentPhone, phonemic_struct *OriginalPhone, int phone) {
	PHEdit2LoadedDataPlugIn *list = plugins;

	while (list != NULL) {
		if (list->plugin != NULL && list->plugin->bEnabled == TRUE) {
			list->plugin->OriginalPhone = OriginalPhone;
			list->plugin->CurrentPhone = CurrentPhone;
			list->plugin->base = base;
			list->plugin->phone = phone;
			list->plugin->Config(list->plugin);
		}
		list = list->next;
	}
	return TRUE;
}

BOOL DataPlugIn::Report(phone_type_struct *base, phonemic_struct *CurrentPhone, phonemic_struct *OriginalPhone, int phone) {
	PHEdit2LoadedDataPlugIn *list = plugins;

	list = plugins;
	while (list != NULL) {
		if (list->plugin != NULL && list->plugin->bEnabled == TRUE) {
			list->plugin->OriginalPhone = OriginalPhone;
			list->plugin->CurrentPhone = CurrentPhone;
			list->plugin->base = base;
			list->plugin->phone = phone;
			list->plugin->Report(list->plugin);
		}
		list = list->next;
	}
	return TRUE;
}

PHEdit2DataPlugIn* DataPlugIn::GetPlugIn(U32 id) {
	PHEdit2LoadedDataPlugIn *list = plugins;
	U32 cnt;
	
	for (cnt = 0; cnt < id; cnt++) {
		list = list->next;
		if (list == NULL)	return NULL;
	}
	if (list == NULL)	return NULL;
	return list->plugin;
}

/*
 * Plug-ins System
 *  Designed by: Kevin Bruckert
 */

#include "stdafx.h"
#include "PHEdit2.h"
#include "MainForm.h"
#include "plugins.h"

PlugIn::PlugIn(void) {
	plugins = NULL;
}

PlugIn::~PlugIn(void) {
	ClosePlugins();
	plugins = NULL;
}

BOOL PlugIn::IsAvailable(U8 PlugInPosition) {
	PHEdit2LoadedPlugIn *list;

	list = plugins;
	while (list != NULL && (list->plugin->PlugInPosition != PlugInPosition || list->plugin->bEnabled == FALSE))	list = list->next;
	if (list == NULL)	return FALSE;
	return TRUE;
}

BOOL PlugIn::LoadPlugins(void) {
	CFileFind finder;
	HINSTANCE tempLib;
	PHEdit2LoadedPlugIn *list = plugins;
	PHEdit2LoadedPlugIn *last = NULL;
	BOOL bWorking = finder.FindFile("*.PGI");

	while (bWorking) {
		bWorking = finder.FindNextFile();
		tempLib = LoadLibrary((LPCTSTR)finder.GetFileName());
		if (tempLib != NULL) {
			if (list == NULL) {
				list = (PHEdit2LoadedPlugIn*) malloc(sizeof(PHEdit2LoadedPlugIn));
				if (list == NULL)	return FALSE;
				plugins = list;
			} else {
				list->next = (PHEdit2LoadedPlugIn*) malloc(sizeof(PHEdit2LoadedPlugIn));
				if (list->next == NULL)	return FALSE;
				last = list;
				list = list->next;
			}
			list->next = NULL;
			list->dll = tempLib;
			list->plugin = (PHEdit2PlugIn*) malloc(sizeof(PHEdit2PlugIn));
			if (list->plugin == NULL) {
				return FALSE;
			}
			list->plugin->bEnabled = TRUE;
			list->plugin->CWndParent = NULL;
			list->plugin->hwndParent = NULL;
			list->plugin->hDllInstance = tempLib;
			list->plugin->base = NULL;
			list->plugin->waveformData = NULL;
			list->plugin->Config = (BOOL (*)(struct PHEdit2PlugInStruct*)) GetProcAddress(tempLib, "Config");
			list->plugin->Init = (BOOL (*)(struct PHEdit2PlugInStruct*)) GetProcAddress(tempLib, "Init");
			list->plugin->Render = (BOOL (*)(struct PHEdit2PlugInStruct*)) GetProcAddress(tempLib, "Render");
			list->plugin->Quit = (BOOL (*)(struct PHEdit2PlugInStruct*)) GetProcAddress(tempLib, "Quit");
			if (list->plugin->Init == NULL || list->plugin->Render == NULL || list->plugin->Config == NULL || list->plugin->Quit == NULL) {
				if (last == NULL)	plugins = NULL;
				else				last->next = NULL;
				FreeLibrary(list->dll);
				free(list);
			}
		}
	}
	return TRUE;
}

BOOL PlugIn::ClosePlugins(void) {
	PHEdit2LoadedPlugIn *list = plugins;

	while (list != NULL) {
		if (list->plugin != NULL && list->plugin->bEnabled == TRUE)		list->plugin->Quit(list->plugin);
		list->plugin->bEnabled = FALSE;
		FreeLibrary(list->dll);
		free(list->plugin);
		list = list->next;
		free(plugins);
		plugins = list;
	}
	plugins = NULL;
	return TRUE;
}

/* Plug-in hooks */
BOOL PlugIn::Config(phone_type_struct *base, phonemic_struct *CurrentPhone, int phone, int prephone, int postphone, BOOL stress, BOOL prestress, BOOL poststress) {
	PHEdit2LoadedPlugIn *list = plugins;

	while (list != NULL) {
		if (list->plugin != NULL && list->plugin->bEnabled == TRUE) {
			list->plugin->CurrentPhone = CurrentPhone;
			list->plugin->base = base;
			list->plugin->phone = phone;
			list->plugin->pre_phone = prephone;
			list->plugin->post_phone = postphone;
			list->plugin->Config(list->plugin);
		}
		list = list->next;
	}
	return TRUE;
}

BOOL PlugIn::Render(phone_type_struct *base, phonemic_struct *CurrentPhone, int phone, int prephone, int postphone, BOOL stress, BOOL prestress, BOOL poststress, int voice) {
	PHEdit2LoadedPlugIn *list = plugins;
	S16 *waveformData = NULL;
	U32 waveformSize;
	int zone;

	for (zone = 0; zone <= PLUGIN_PLAYER; zone++) {
		list = plugins;
		while (list != NULL) {
			if (list->plugin != NULL && list->plugin->bEnabled == TRUE && list->plugin->PlugInPosition == zone) {
				list->plugin->CurrentPhone = CurrentPhone;
				list->plugin->base = base;
				list->plugin->phone = phone;
				list->plugin->stress = stress;
				list->plugin->pre_phone = prephone;
				list->plugin->prestress = prestress;
				list->plugin->post_phone = postphone;
				list->plugin->poststress = poststress;
				list->plugin->voice = voice;
				if (waveformData != NULL) {
					list->plugin->waveformData = waveformData;
					list->plugin->waveformSize = waveformSize;
				} else {
					list->plugin->waveformData = NULL;
					list->plugin->waveformSize = 0;
				}
				list->plugin->Render(list->plugin);
				if (list->plugin->waveformData != NULL) {
					waveformData = list->plugin->waveformData;
					waveformSize = list->plugin->waveformSize;
				}
			}
			list = list->next;
		}
	}
//	if (waveformData != NULL)		free(waveformData);
	return TRUE;
}

PHEdit2PlugIn* PlugIn::GetPlugIn(U32 id) {
	PHEdit2LoadedPlugIn *list = plugins;
	U32 cnt;
	
	for (cnt = 0; cnt < id; cnt++) {
		list = list->next;
		if (list == NULL)	return NULL;
	}
	if (list == NULL)		return NULL;
	return list->plugin;
}

BOOL PlugIn::Init(CWnd *cwnd) {
	PHEdit2LoadedPlugIn *list = plugins;
	PHEdit2LoadedPlugIn *last;
	BOOL bIsSynth = FALSE;
	BOOL bIsPlayer = FALSE;

	while (list != NULL) {
		if (list->plugin != NULL && list->plugin->bEnabled == TRUE) {
			list->plugin->CWndParent = (LPVOID) cwnd;
			list->plugin->hwndParent = cwnd->m_hWnd;
			list->plugin->bEnabled = list->plugin->Init(list->plugin);
			if (list->plugin->bEnabled == FALSE) {
				MessageBox(cwnd->m_hWnd, "At least one plug-in failed to load successfully...", "Plugins", MB_OK);
				if (plugins == list) {
					plugins = list->next;
					free(list);
					list = plugins;
				} else {
					last = plugins;
					while (last->next != list)	last = last->next;
					last->next = list->next;
					free(list);
					list = last->next;
				}
			} else {
				list = list->next;
			}
		} else {
			list = list->next;
		}
	}

	list = plugins;
	while (list != NULL) {
		if (list->plugin != NULL && list->plugin->bEnabled == TRUE) {
			if (list->plugin->PlugInPosition == PLUGIN_KLSYN) {
				if (bIsSynth == TRUE)	list->plugin->bEnabled = FALSE;
				else					bIsSynth = TRUE;
			}
			if (list->plugin->PlugInPosition == PLUGIN_PLAYER) {
				if (bIsPlayer == TRUE)	list->plugin->bEnabled = FALSE;
				else					bIsPlayer = TRUE;
			}
		}
		list = list->next;
	}
	return TRUE;
}
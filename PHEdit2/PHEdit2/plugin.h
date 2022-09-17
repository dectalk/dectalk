/*
 * Plug-ins System
 *  Designed by: Kevin Bruckert
 */

#ifndef _PLUGIN_HEADER
#define _PLUGIN_HEADER

#include "ph_struc.h"

#define PLUGIN_KLSYN		0		// KLSYN plug-in  Only one synthesizer may be chained at any given time
#define PLUGIN_PREPROCESS	1
#define PLUGIN_PROCESSOR	2
#define PLUGIN_POSTPROCESS	3
#define PLUGIN_PLAYER		4		// Only one player may be chained at any given time

#define PLUGINVERSION	0x0101

typedef struct PHEdit2PlugInStruct {
	U32 version;
	U8 Name[64];
	U8 Manufacturer[128];
	U8 Language[128];
	U8 PlugInPosition;				// Pre-processing, processing, post-processing, or player
	BOOL bEnabled;
	HWND hwndParent;
	LPVOID CWndParent;
	HINSTANCE hDllInstance;
	BOOL (*Config)(struct PHEdit2PlugInStruct *plugin);
	BOOL (*Init)(struct PHEdit2PlugInStruct *plugin);
	BOOL (*Render)(struct PHEdit2PlugInStruct *plugin);
	BOOL (*Quit)(struct PHEdit2PlugInStruct *plugin);
	phonemic_struct *CurrentPhone;
	phone_type_struct *base;
	BOOL stress;
	BOOL prestress;
	BOOL poststress;
	int voice;
	int phone;
	int pre_phone;
	int post_phone;
	S16 *waveformData;
	U32 waveformSize;
	LPVOID userData;
} PHEdit2PlugIn;

#ifdef __cplusplus
extern "C" {
#endif
	BOOL Config(PHEdit2PlugIn *plugin);
	BOOL Render(PHEdit2PlugIn *plugin);
	BOOL Init(PHEdit2PlugIn *plugin);
	BOOL Quit(PHEdit2PlugIn *plugin);
#ifdef __cplusplus
}
#endif

#endif
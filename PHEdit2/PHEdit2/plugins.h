/*
 * Plug-ins System
 *  Designed by: Kevin Bruckert
 */

#ifndef _PLUGINS_HEADER
#define _PLUGINS_HEADER

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

class PlugIn {
public:
	PlugIn(void);		// Constructor
	~PlugIn(void);		// Constructor

	BOOL IsAvailable(U8 PlugInPosition);
	BOOL LoadPlugins(void);
	BOOL ClosePlugins(void);
	PHEdit2PlugIn* PlugIn::GetPlugIn(U32 id);

	BOOL Init(CWnd *cwnd);

	/* Plug-in hooks */
	BOOL Config(phone_type_struct *base, phonemic_struct *CurrentPhone, int phone, int prephone, int postphone, BOOL stress, BOOL prestress, BOOL poststress);
	BOOL Render(phone_type_struct *base, phonemic_struct *CurrentPhone, int phone, int prephone, int postphone, BOOL stress, BOOL prestress, BOOL poststress, int voice);

private:
	typedef struct PHEdit2LoadedPlugInStruct {
		PHEdit2PlugIn *plugin;
		HINSTANCE dll;
		struct PHEdit2LoadedPlugInStruct *next;
	} PHEdit2LoadedPlugIn;

	PHEdit2LoadedPlugIn *plugins;

};

#endif
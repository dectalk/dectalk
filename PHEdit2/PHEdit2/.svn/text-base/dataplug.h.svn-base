/*
 * Plug-ins System
 *  Designed by: Kevin Bruckert
 */

#ifndef _DATAPLUGINS_HEADER
#define _DATAPLUGINS_HEADER

#include "ph_struc.h"

#define DATAPLUGVERSION		0x0101

typedef struct PHEdit2DataPlugInStruct {
	U32 version;
	U8 Name[64];
	U8 Manufacturer[128];
	U8 Language[128];
	BOOL bEnabled;
	HWND hwndParent;
	LPVOID CWndParent;
	HINSTANCE hDllInstance;
	BOOL (*Config)(struct PHEdit2DataPlugInStruct *plugin);
	BOOL (*Init)(struct PHEdit2DataPlugInStruct *plugin);
	BOOL (*Report)(struct PHEdit2DataPlugInStruct *plugin);
	BOOL (*Quit)(struct PHEdit2DataPlugInStruct *plugin);
	phonemic_struct *CurrentPhone;
	phonemic_struct *OriginalPhone;
	phone_type_struct *base;
	int phone;
	LPVOID userData;
} PHEdit2DataPlugIn;

class DataPlugIn {
public:
	DataPlugIn(void);		// Constructor

	BOOL LoadPlugins(void);
	BOOL ClosePlugins(void);
	PHEdit2DataPlugIn* GetPlugIn(U32 id);

	/* Plug-in hooks */
	BOOL Config(phone_type_struct *base, phonemic_struct *CurrentPhone, phonemic_struct *OriginalPhone, int phone);
	BOOL Report(phone_type_struct *base, phonemic_struct *CurrentPhone, phonemic_struct *OriginalPhone, int phone);

private:
	typedef struct PHEdit2LoadedDataPlugInStruct {
		PHEdit2DataPlugIn *plugin;
		HINSTANCE dll;
		struct PHEdit2LoadedDataPlugInStruct *next;
	} PHEdit2LoadedDataPlugIn;

	PHEdit2LoadedDataPlugIn *plugins;
};

#endif
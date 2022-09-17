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

#ifdef __cplusplus
extern "C" {
#endif
	BOOL Config(PHEdit2DataPlugIn *plugin);
	BOOL Init(PHEdit2DataPlugIn *plugin);
	BOOL Report(PHEdit2DataPlugIn *plugin);
	BOOL Quit(PHEdit2DataPlugIn *plugin);
#ifdef __cplusplus
}
#endif

#endif
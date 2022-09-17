/* GAI.h - Graphical Acquisition Interface   Header File
 *
 * Specification 1.0
 *
 *  Copyright (c) 1997 by Digital Equipment Corporation
 *
 *  GAI Specification 1.0 is released as public knowledge for programming into the PHEdit(2) GAI interface
 *  The source files which make up the PHEdit(2) GAI Controller Interface are NOT public domain
 *
 */

#ifndef _GAI_HEADER
#define _GAI_HEADER

#include "ph_types.h"
#include "ph_struc.h"

#define GAISTRUCTVER	0x0100

/* Primary Passing Structure */
typedef struct GAIstruct {
	U32 GAIversion;
	U8 Language[128];
	HWND hwndParent;
	LPVOID CWndParent;
	HINSTANCE hDllInstance;
	phonemic_struct *CurrentPhone;
	phone_type_struct *base;
	int phone;
	LPVOID userData;
} GAIdata, *LPGAIdata;

#ifndef _GAI_CONTROLLER_HEADER		// Do not include this part if this is the interface level

#ifdef __cplusplus
extern "C" {
#endif	// __cplusplus
	BOOL Create(LPGAIdata gai);
	BOOL Acquire(LPGAIdata gai);
	BOOL Destroy(LPGAIdata gai);
#ifdef __cplusplus
}
#endif	// __cplusplus

#endif	// _GAI_CONTROLLER_HEADER

#endif	// _GAI_HEADER

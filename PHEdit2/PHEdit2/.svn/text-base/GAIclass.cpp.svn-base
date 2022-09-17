/* GAIclass.h - Graphical Acquisition Interface Controller  Source File
 *
 * Specification 1.0
 *
 *  Copyright (c) 1997 by Digital Equipment Corporation
 *
 *  GAI Specification 1.0 is released as public knowledge for programming into the PHEdit(2) GAI interface
 *  The source files which make up the PHEdit(2) GAI Controller Interface are NOT public domain
 *
 *  This file is NOT public domain
 *
 */

#include "stdafx.h"
#include "PHEdit2.h"
#include "MainForm.h"

#include "GAIclass.h"

GAI::GAI() {
	GAIdll = NULL;
	LoadGAI();
	return;
}

GAI::~GAI() {
	CloseGAI();
	return;
}

BOOL GAI::IsAvailable(void) {
	if (GAIdll == NULL)	return FALSE;
	return TRUE;
}

// Returns number of phones acquired (Always 0 or 1)
U32 GAI::Acquire(CWnd *cwnd, phone_type_struct *base, phonemic_struct *phone, U16 cur_phone) {
	int success = 1;
	GAIdata data;

	strcpy((char*) data.Language,"?? UNKNOWN");
	data.hwndParent = cwnd->m_hWnd;
	data.CWndParent = (LPVOID) cwnd;
	data.hDllInstance = GAIdll;
	data.CurrentPhone = phone;
	data.base = base;
	data.phone = cur_phone;
	data.userData = NULL;

	if (GAIdll == NULL)				return 0;
	if (Create(&data) == FALSE)		return 0;
	if (DoAcquire(&data) == FALSE)	success = 0;
	if (Destroy(&data) == 0)		return 0;
	return success;
}

// Returns number of phones acquired
U32 GAI::AcquireAll(CWnd *cwnd, phone_type_struct *base, phonemic_struct *phone, U16 cur_phone) {
	GAIdata data;
	int cnt = 0;

	strcpy((char*) data.Language,"?? UNKNOWN");
	data.hwndParent = cwnd->m_hWnd;
	data.CWndParent = (LPVOID) cwnd;
	data.hDllInstance = GAIdll;
	data.CurrentPhone = phone;
	data.base = base;
	data.phone = cur_phone;
	data.userData = NULL;

	if (GAIdll == NULL)				return 0;
	if (Create(&data) == FALSE)		return 0;
	while (DoAcquire(&data) != FALSE) {
		cnt++;
	}
	if (Destroy(&data) == 0)		return 0;
	return cnt;
}

BOOL GAI::LoadGAI(void) {
	GAIdll = LoadLibrary("PHEdit2.GAI");
	if (GAIdll == NULL)		return FALSE;

	Create = (BOOL (*)(LPGAIdata)) GetProcAddress(GAIdll, "Create");
	DoAcquire =  (BOOL (*)(LPGAIdata)) GetProcAddress(GAIdll, "Acquire");
	Destroy =  (BOOL (*)(LPGAIdata)) GetProcAddress(GAIdll, "Destroy");

	if (Create == NULL || DoAcquire == NULL || Destroy == NULL) {
		FreeLibrary(GAIdll);
		GAIdll = NULL;
		return FALSE;
	}
	return TRUE;
}

BOOL GAI::CloseGAI(void) {
	if (GAIdll == NULL)	return FALSE;
	FreeLibrary(GAIdll);
	GAIdll = NULL;
	return TRUE;
}

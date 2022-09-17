/* GAIclass.h - Graphical Acquisition Interface Controller  Header File
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

#ifndef _GAI_CONTROLLER_HEADER
#define _GAI_CONTROLLER_HEADER

#include "gai.h"	// Include the typedefs

class GAI {
	public:
		GAI();
		~GAI();

		BOOL IsAvailable(void);
		U32 Acquire(CWnd *cwnd, phone_type_struct *base, phonemic_struct *phone, U16 cur_phone);		// Returns number of phones acquired (Always 0 or 1)
		U32 AcquireAll(CWnd *cwnd, phone_type_struct *base, phonemic_struct *phone, U16 cur_phone);	// Returns number of phones acquired

	private:
		BOOL LoadGAI(void);
		BOOL CloseGAI(void);

		/* Variables */
		BOOL (*Create)(LPGAIdata gai);
		BOOL (*DoAcquire)(LPGAIdata gai);
		BOOL (*Destroy)(LPGAIdata gai);

		HINSTANCE GAIdll;
};

#endif	// _GAI_CONTROLLER_HEADER

/* GAI test */

#include <windows.h>

#include "..\phedit2\gai.h"

BOOL Create(LPGAIdata data) {
	return TRUE;
}

BOOL Acquire(LPGAIdata data) {
	if (MessageBox(data->hwndParent, "Acquire Data?", "GAItest", MB_OKCANCEL) == IDOK)	return TRUE;
	return FALSE;
}

BOOL Destroy(LPGAIdata data) {
	return TRUE;
}

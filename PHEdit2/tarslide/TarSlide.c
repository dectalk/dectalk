/* TarSlide PDI - Plugin Data Interface  v1.0
 *
 *  Slide targets via percentile when INHDR changes
 *
 */

#include <windows.h>

/* Include the primary Data Plugin Interface */
#include "..\phedit2\dataplg.h"

BOOL Config(PHEdit2DataPlugIn *plugin) {
	return TRUE;
}

BOOL Init(PHEdit2DataPlugIn *plugin) {
	strcpy(plugin->Name, "TarSlide v1.0");
	strcpy(plugin->Manufacturer, "Digital Equipment Corporation");
	plugin->userData = NULL;
	return TRUE;
}

BOOL Report(PHEdit2DataPlugIn *plugin) {
	phonemic_struct *old, *current;
	int old_tar_time;
	int percent;
	int tar, tm;

	old = plugin->OriginalPhone;
	current = plugin->CurrentPhone;

	if (old->inhdr != current->inhdr) {		/* The Inherent Duration changed */
		percent = (current->inhdr * 100) / old->inhdr;
		if (percent == 100)	return TRUE;
		for (tar = 0; tar < MAX_FORMANT_PARAMS; tar++) {
			for (tm = 0; tm < 10; tm++) {
				old_tar_time = current->diphthongs[tar].diph_tm[tm];
				if (old_tar_time > 0) {
					current->diphthongs[tar].diph_tm[tm] = (old_tar_time * percent) / 100;
				}
			}
		}
	}
	return TRUE;
}

BOOL Quit(PHEdit2DataPlugIn *plugin) {
	return TRUE;
}

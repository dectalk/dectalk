#ifdef vms
#include "vox$msg.h"
#endif

/*
 * Settable option item codes.
 */

#define VOX$K_DEFAULT_LANGUAGE		1
#define VOX$K_THRESHOLDING_TYPE		2
#define VOX$K_ABSOLUTE_THRESHOLD	3
#define VOX$K_RELATIVE_THRESHOLD	4
#define VOX$K_FORCE_LANGUAGE		5
#define VOX$K_POSSIBILITY_VECTOR	256
#define VOX$K_PROBABILITY_VECTOR	257
#define VOX$K_THRESHOLDING		258
#define VOX$K_SELECTED_LANGUAGE		259
#define VOX$K_RULE_HITS			260

/*
 * Language group identifiers.
 */

#define VOX$K_ENGLISH			0
#define VOX$K_FRENCH			1
#define VOX$K_GERMANIC			2
#define VOX$K_IRISH			3
#define VOX$K_ITALIAN			4
#define VOX$K_JAPANESE			5
#define VOX$K_SLAVIC			6
#define VOX$K_SPANISH			7

/*
 * Thresholding type identifiers.
 */

#define VOX$K_THRESHOLDING_OFF		1
#define VOX$K_THRESHOLDING_ABSOLUTE	2
#define VOX$K_THRESHOLDING_RELATIVE	3

/*
 * The following definitions are used to define the kind of trace to be
 * done by ACNA as it operates on a name.
 */

#define VOX$M_VERBOSE		0x80000000
#define VOX$M_LTS		0x00000008
#define VOX$M_TRIGRAPH		0x00000004
#define VOX$M_ELIMINATION	0x00000002
#define VOX$M_GENERAL		0x00000001

#define VOX$V_VERBOSE		31
#define VOX$V_LTS		3
#define VOX$V_TRIGRAPH		2
#define VOX$V_ELIMINATION	1
#define VOX$V_GENERAL		0

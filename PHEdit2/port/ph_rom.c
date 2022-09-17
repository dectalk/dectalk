#ifdef SPANISH
#include "\work\ad\dapi\src\include\l_sp_ph.h"
#endif
#include "ph_defs.h"

#ifdef ENGLISH_US
#define PHO_SYM_TOT		200
#include "\work\ad\dapi\src\ph\p_us_rom.c"
#endif
#ifdef ENGLISH_UK
#define PHO_SYM_TOT		200
#include "\work\ad\dapi\src\ph\p_uk_rom.c"
#endif
#ifdef GERMAN
#define PHO_SYM_TOT		200
#include "\work\ad\dapi\src\ph\p_gr_rom.c"
#endif
#ifdef SPANISH
#ifdef LATIN_ANERICAN
#define PHO_SYM_TOT		200
#include "\work\ad\dapi\src\ph\p_sp_rom.c"
#else
#define PHO_SYM_TOT		200
#include "\work\ad\dapi\src\ph\p_sp_rom.c"
#endif
#endif

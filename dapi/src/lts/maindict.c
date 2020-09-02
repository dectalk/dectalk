#ifdef EPSON_ARM7
#include "ltsnames.h"
#endif

#ifdef FRENCH
#include "maindict_fr.c"
#endif

#ifdef GERMAN
#if defined ARM7 && !defined WIN32_TEST
__align(8)
#endif
const unsigned char main_dict[]={
0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
0x00, 0x00, 0x00, 0x00
};
#endif

#ifdef SPANISH_SP
#include "maindict_sp.c"
#endif

#ifdef SPANISH_LA
#include "maindict_la.c"
#endif

#ifdef ENGLISH_UK
#include "maindict_uk.c"
#endif


#ifdef ENGLISH_US
#include "maindict_us.c"
#endif

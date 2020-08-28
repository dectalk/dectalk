/* 
 *  HL syn Version 2.2
 *
 * Copyright (c) 1996 - 1997 by Sensimetrics Corporation.  
 * All rights reserved.  
 *
 */

/*
 * flavor.h - control conditional compilation of LLsyn, HLsyn32
 * 
 * Modification history:  
 * 
 *  27 Aug 1996  reb:  Created.
 *  30 Apr 1997  reb:  Removed subflavor no acxf1c from flavor VHLsyn; 
 *               added HLSYNAPI.
 */

#ifndef FLAVOR_H
#define FLAVOR_H

//#include "dectalkf.h"
/* Master "flavors" - select at most one (by leaving the corresponding 
 * preprocessor variable defined).  
 */



#define FLAVOR_VHLSYN  /* For use under VHL Syn (hence Visual Basic). */
#undef  FLAVOR_VHLSYN

#define FLAVOR_VB  /* For use under Visual Basic. */
#undef  FLAVOR_VB

#define FLAVOR_1STBYTE  /* Compile this flavor for First Byte. */
#undef  FLAVOR_1STBYTE


/* Subflavors:  individual behaviors controlled by master flavors.  
 */

#ifdef FLAVOR_VHLSYN
/* #define FLAV_NO_ACXF1C  *//* Do not use function Tongue_acx_f1c. */
#define FLAV_STDCALL /* Use stdcall calling convention. */
#define FLAV_FLOATTYPE_DOUBLE /* typedef Float to double, not float */
#pragma pack(4)  /* Pack structures with 4 byte alignment. */
#endif /* end of FLAVOR_VHLSYN */

#ifdef FLAVOR_VB
#define FLAV_STDCALL /* Use stdcall calling convention. */
#define FLAV_FLOATTYPE_DOUBLE /* typedef Float to double, not float */
#pragma pack(4) /* Pack structures with 4 byte alignment. */
#endif /* end of FLAVOR_VB */

#ifdef FLAVOR_1STBYTE
#define FLAV_FLOATTYPE_DOUBLE /* typedef Float to double, not float */
#define FLAV_AGHIKLSOURCECUTTOFF_ON  /* Set (finite) value for 
                                        speaker->agHiKLSourceCutoff. */
#endif /* end of FLAVOR_1STBYTE */

#ifdef FLAV_STDCALL
#define HLSYNAPI __stdcall
#else
#define HLSYNAPI 
#endif


#endif /* end ifndef FLAVOR_H */

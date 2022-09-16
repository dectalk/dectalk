/**********************************************************************/
/*                                                                    */
/*                DECtalk Vocal Tract Model                           */
/*                                                                    */
/* Copyright (c)        1984                    by Dennis H. Klatt    */
/* Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.   */
/*  
	 Crated 4/02/1999 by Ed bruckert
	 This files now inlcudes wither the historic vtm as VTM1.c or the new model as vtm2.c

	 Edit history:                                                     */
#include "dectalkf.h"


#ifdef NEW_VOCAL_TRACT
#include "vtm2.c"
#else
#include "vtm1.c"
#endif


/* ******************************************************************** 
*                                                                   
*	                DECtalk Vocal Tract Model                           
*   Copyright (c) 2002 Fonix Corporation. All rights reserved.
*	Copyright (c) 2001 Force Computers Inc. A Solectron company. All rights reserved.
*	Copyright (c) 1984 Digital Equipment Corporation, Maynard, Mass.
*	Copyright (c)        1984                    by Dennis H. Klatt
*
*   This is an unpublished work, and is confidential and proprietary: 
*   technology and information of Fonix corporation.  No part of this
*   code may be reproduced, used or disclosed without written consent of 
*   Fonix corporation in each and every instance.
*  
*	Crated 4/02/1999 by Ed bruckert
*	This files now inlcudes wither the historic vtm as VTM1.c or the new model as vtm2.c
*
*	Edit history:
*	Rev	Who	Date		Description
*	001	cab	08/30/01	Added copyright info
*	002	CAB	08/08/02	Updated copyright info
*/

#include "dectalkf.h"
#ifdef ARM7
#pragma arm section code="VTM3CODE", rwdata="VTM3RWDATA", rodata="VTM3RODATA", zidata="VTM3DATA"
#endif

/* removed leading spaces */


#include "vtm3.c"



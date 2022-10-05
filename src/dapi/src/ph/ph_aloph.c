/* 
 ***********************************************************************
 *    File Name:    ph_aloph.c
 *    Creation Date:05-oct-2022
 *
 *    Functionality:
 *  	Controls which files get included for re-write of new aloph files
 *
 ***********************************************************************
 */

#include "dectalkf.h"

#if (defined(ENGLISH_US)) && defined(OLD_INTONATION_AND_TIMING)
#include "ph_aloph1.c"
#else
#include "ph_aloph2.c"
#endif





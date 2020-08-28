/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/**  Copyright (c) 1991-1996 by Sensimetrics Corporation                    **/
/**  All rights reserved.                                                   **/
/**                                                                         **/
/*****************************************************************************/

/*  reson.h - resonator declarations
 *
 *  coded by Eric P. Carlson, based upon reson.c by A.W. Howitt
 *
 *  Modification History:
 *
 *    10 Sep 1996  reb:  include flavor.h
 *    03 Sep 1996  reb:  placed Float under control of 
 *                       FLAV_FLOATTYPE_DOUBLE.
 *    08 Aug 1996  reb:  changed type Float back to float (for Lisp 
 *                       compatibility); archived as version 2.2.
 *    20 Feb 1996  changed type Float back to double
 *    22 Jul 1992  changed type Float back to float
 *    26 Sep 1991  added AdvanceAntiResonator and InterPolePair
 *    14 Nov 1991  changed type Float double
 */

#ifndef RESON_H
#define RESON_H

#include "flavor.h"

#ifdef FLAV_FLOATTYPE_DOUBLE
  typedef double Float;
#else
  typedef float Float;
#endif

typedef struct {
	struct { Float A, B, C; } Coef;
	struct { Float Z1, Z2; } State;
} Resonator;

extern void ClearResonator(Resonator *theResonator);
extern Float AdvanceResonator(Resonator *theResonator, Float input);
extern Float AdvanceAntiResonator(Resonator *theResonator, Float input);
extern void SetPolePair(Resonator *theResonator, int CF, int BW, int SF);
extern void InterPolePair(Resonator *theResonator, int CF, int BW, int SF);
extern void SetZeroPair(Resonator *theResonator, int CF, int BW, int SF);

#endif

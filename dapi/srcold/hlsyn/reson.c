/*****************************************************************************/
/**  SenSyn - Version 2.2                                                   **/
/**                                                                         **/
/**  Copyright (c) 1991-1997 by Sensimetrics Corporation                    **/
/**  All rights reserved.                                                   **/
/**                                                                         **/
/*****************************************************************************/

/*
 *  reson.c -
 *    This code implements a second order resonator, which can be used
 *    to realize a pole pair or zero pair.
 *
 *  coded by Andrew Wilson Howitt
 *
 *  Modification History:
 *
 *    30 Apr 1997  reb:  rewrote Advance Resonator/AntiResonator to avoid 
 *                       incorrect optimization by MSVC5.0 compiler (!).
 *    27 Aug 1996  reb:  include flavor.h
 *    08 Aug 1996  reb:  make floating-point constants single precision; 
 *                       cast function results of type double to type
 *                       Float; cast int arguments of SetPolePair to 
 *                       Float rather than double; 
 *                       archived as version 2.2.
 *    26 Sep 1991  E.P.Carlson, added AdvanceAntiResonator and InterPolePair
 */

#include "flavor.h"

#include <math.h>
#include "reson.h"

#define PI 3.1415926f
#define MIN_RESON 0.0001f

void ClearResonator(Resonator *theResonator)
{
  theResonator->State.Z1 = 0.f;
  theResonator->State.Z2 = 0.f;
}

Float AdvanceResonator(Resonator* theResonator, Float input)
  {
  register Float StateZ1 = theResonator->State.Z1;
  register Float output = 
    theResonator->Coef.A * input
    + theResonator->Coef.B * StateZ1
    + theResonator->Coef.C * theResonator->State.Z2;

  if( fabs(output) < MIN_RESON )
    output = 0.0f;
  theResonator->State.Z2 = StateZ1;
  theResonator->State.Z1 = output;
  return output;
  }

Float AdvanceAntiResonator(Resonator* theResonator, Float input)
  {
  register Float StateZ1 = theResonator->State.Z1;
  register Float output = 
    theResonator->Coef.A * input
    + theResonator->Coef.B * StateZ1
    + theResonator->Coef.C * theResonator->State.Z2;

  theResonator->State.Z2 = StateZ1;
  theResonator->State.Z1 = input;
  return output;
  }

void SetPolePair(Resonator *theResonator, int CF, int BW, int SF)
{
  register Float magnitude,angle,PiT;

  PiT = PI / (Float)SF;
  magnitude = (Float) exp(-PiT * (Float)BW);
  angle = 2.f * PiT * (Float)CF;

  theResonator->Coef.C = (Float)(-magnitude * magnitude);
  theResonator->Coef.B = (Float)(magnitude * cos(angle) * 2.f);
  theResonator->Coef.A = 1.f - theResonator->Coef.B - theResonator->Coef.C;
}

void InterPolePair(Resonator *theResonator, int CF, int BW, int SF)
{
  register Float coefA, temp;

  coefA = theResonator->Coef.A;
  SetPolePair(theResonator, CF, BW, SF);
  if ((coefA != theResonator->Coef.A) && coefA) {
    temp = (Float) sqrt(theResonator->Coef.A / coefA);
    theResonator->State.Z1 *= temp;
    theResonator->State.Z2 *= temp;
  }
}

void SetZeroPair(Resonator *theResonator, int CF, int BW, int SF)
{
  SetPolePair(theResonator,CF,BW,SF);
  theResonator->Coef.A = 1.f / theResonator->Coef.A;
  theResonator->Coef.B *= -theResonator->Coef.A;
  theResonator->Coef.C *= -theResonator->Coef.A;
}

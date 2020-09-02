/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	vfmd2pol.h
 *    Author:		Bill Hallahan
 *    Creation Date:05-SEP-93
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 * 0001 04-APR-95 CJL Added symbols from vtm_f.h here to prevent
 *						duplicate entries fromthe divided code.
 * 002  ETT		10/05/1998      Added Linux code.
 */

#ifndef VFMD2POL_H
#define VFMD2POL_H

/**********************************************************************/
/*                                                                    */
/*  Macro: DESIGN_TWO_POLE_FILTER                                     */
/*  Author: Bill Hallahan                                             */
/*  Date: September 5, 1993                                           */
/*                                                                    */
/**********************************************************************/

#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
extern FLTPNT_T InverseSampleRateScale;
#endif

#define DESIGN_TWO_POLE_FILTER( A1, A2, UnityGainAtDC, Frequency, Bandwidth ) \
  BW = InverseSampleRateScale * Bandwidth; \
  Freq = InverseSampleRateScale * Frequency; \
  if ( Freq + 0.5 * BW >= MaximumFrequency ) \
  { \
    A1 = (FLTPNT_T)0.0; \
    A2 = (FLTPNT_T)0.0; \
  } \
  else \
  { \
    Radius = radius_table[( (S32)BW>>3 )]; \
    A1 = Radius * CosineTable[( (S32)Freq>>3 )]; \
    A2 = - Radius * Radius; \
  } \
  UnityGainAtDC = (FLTPNT_T)1.0 - A1 - A2;

#endif

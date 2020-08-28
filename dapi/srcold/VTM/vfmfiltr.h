/*
 ***********************************************************************
 *
 *                           Coyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000 Force Computers Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	vfmfiltr.h
 *    Author:		Bill Hallahan
 *    Creation Date:17-FEB-92
 *
 *    Functionality:
 *    This macro defines a second order canonic section which is
 *    in Direct Form II.
 *
 ***********************************************************************
 *   Revision History:
 * 	 Rev	Date		Who		Description
 *   ---   	----------	---		-------------
 *	 001	09/21/2000	CAB		Fixed copyright info
 *	 002	08/08/2002	CAB		Updated copyright info
 */

#ifndef VFMFILTR_H
#define VFMFILTR_H

/**********************************************************************/
/*                                                                    */
/*  Macro: BIQUADRATIC_FILTER                                         */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a second order canonic section which is      */
/*    in Direct Form II. The transfer function of the filter is:      */
/*                                                                    */
/*                              -1      -2                            */
/*            Y(Z)     b0 + b1 Z  + b2 Z                              */
/*    H(Z) = ------ = ---------------------                           */
/*            X(Z)              -1      -2                            */
/*                      1 - a1 Z  - a2 Z                              */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a2 y(n-2) + a1 y(n-1) + b2 x(n-2) + b1 x(n-1) + b0 x(n)  */
/*                                                                    */
/*    Instead the filter is implemented as a second order canonic     */
/*    filter section in Direct Form II.                               */
/*                                                                    */
/*                                                                    */
/*                                 b0                                 */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |          ^                             */
/*                |          V          |                             */
/*                |       -------       |                             */
/*                |       |  -1 |       |                             */
/*                |       | Z   |       |                             */
/*                |       |     |       |                             */
/*                |       -------       |                             */
/*                |          |          |                             */
/*                |   a1     V     b1   |                             */
/*                |<------------------->|                             */
/*                |          |          |                             */
/*                |          V          |                             */
/*                |       -------       |                             */
/*                |       |  -1 |       |                             */
/*                |       | Z   |       |                             */
/*                |       |     |       |                             */
/*                |       -------       |                             */
/*                |          |          |                             */
/*                |   a2     V     b2   |                             */
/*                |<------------------->|                             */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define BIQUADRATIC_FILTER( Yout, \
                            Xin, \
                            Delay_1, \
                            Delay_2, \
                            a1, \
                            a2, \
                            b0, \
                            b1, \
                            b2 ) \
  Temp = a2 * Delay_2 + a1 * Delay_1 + Xin; \
  Yout = b2 * Delay_2 + b1 * Delay_1 + b0 * Temp; \
  Delay_2 = Delay_1; \
  Delay_1 = Temp;

/**********************************************************************/
/*                                                                    */
/*  Macro: MINIMUM_BIQUADRATIC_FILTER                                 */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a second order canonic section which is      */
/*    in Direct Form II. The gain of this filter is 1 - a1 - a2 at    */
/*    DC. The transfer function of the filter is:                     */
/*                                                                    */
/*                             -1      -2                             */
/*            Y(Z)     1 + b1 Z  + b2 Z                               */
/*    H(Z) = ------ = --------------------                            */
/*            X(Z)             -1      -2                             */
/*                     1 - a1 Z  - a2 Z                               */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a2 y(n-2) + a1 y(n-1) + b2 x(n-2) + b1 x(n-1) + x(n)     */
/*                                                                    */
/*    Instead the filter is implemented as a second order canonic     */
/*    filter section in Direct Form II.                               */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |          ^                             */
/*                |          V          |                             */
/*                |       -------       |                             */
/*                |       |  -1 |       |                             */
/*                |       | Z   |       |                             */
/*                |       |     |       |                             */
/*                |       -------       |                             */
/*                |          |          |                             */
/*                |   a1     V     b1   |                             */
/*                |<------------------->|                             */
/*                |          |          |                             */
/*                |          V          |                             */
/*                |       -------       |                             */
/*                |       |  -1 |       |                             */
/*                |       | Z   |       |                             */
/*                |       |     |       |                             */
/*                |       -------       |                             */
/*                |          |          |                             */
/*                |   a2     V     b2   |                             */
/*                |<------------------->|                             */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define MINIMUM_BIQUADRATIC_FILTER( Yout, \
                                    Xin, \
                                    Delay_1, \
                                    Delay_2, \
                                    a1, \
                                    a2, \
                                    b1, \
                                    b2 ) \
  Temp = a2 * Delay_2 + a1 * Delay_1 + Xin; \
  Yout = b2 * Delay_2 + b1 * Delay_1 + Temp; \
  Delay_2 = Delay_1; \
  Delay_1 = Temp;

/**********************************************************************/
/*                                                                    */
/*  Macro: ONE_POLE_ONE_ZERO_FILTER                                   */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a first order canonic section which has      */
/*    one real pole and one real zero. The transfer function of the   */
/*    filter is:                                                      */
/*                                                                    */
/*                              -1                                    */
/*            Y(Z)     b0 + b1 Z                                      */
/*    H(Z) = ------ = -------------                                   */
/*            X(Z)              -1                                    */
/*                      1 - a1 Z                                      */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a1 y(n-1) + b1 x(n-1) + b0 x(n)                          */
/*                                                                    */
/*    Instead the filter is implemented as shown below.               */
/*                                                                    */
/*                                                                    */
/*                                 b0                                 */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |          ^                             */
/*                |          V          |                             */
/*                |       -------       |                             */
/*                |       |  -1 |       |                             */
/*                |       | Z   |       |                             */
/*                |       |     |       |                             */
/*                |       -------       |                             */
/*                |          |          |                             */
/*                |   a1     V     b1   |                             */
/*                |<------------------->|                             */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define ONE_POLE_ONE_ZERO_FILTER( Yout, \
                                  Xin, \
                                  Delay_1, \
                                  a1, \
                                  b0, \
                                  b1 ) \
  Temp = a1 * Delay_1 + Xin; \
  Yout = b1 * Delay_1 + b0 * Temp; \
  Delay_1 = Temp;

/**********************************************************************/
/*                                                                    */
/*  Macro: MINIMUM_ONE_POLE_ONE_ZERO_FILTER                           */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a first order canonic section which has      */
/*    one real pole and one real zero. The gain of this filter is     */
/*    1 - a1 at DC. The transfer function of the filter is:           */
/*                                                                    */
/*                             -1                                     */
/*            Y(Z)     1 + b1 Z                                       */
/*    H(Z) = ------ = -------------                                   */
/*            X(Z)             -1                                     */
/*                     1 - a1 Z                                       */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a1 y(n-1) + b1 x(n-1) + x(n)                             */
/*                                                                    */
/*    Instead the filter is implemented as shown below.               */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |          ^                             */
/*                |          V          |                             */
/*                |       -------       |                             */
/*                |       |  -1 |       |                             */
/*                |       | Z   |       |                             */
/*                |       |     |       |                             */
/*                |       -------       |                             */
/*                |          |          |                             */
/*                |   a1     V     b1   |                             */
/*                |<------------------->|                             */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define MINIMUM_ONE_POLE_ONE_ZERO_FILTER( Yout, \
                                          Xin, \
                                          Delay_1, \
                                          a1, \
                                          b1 ) \
  Temp = a1 * Delay_1 + Xin; \
  Yout = b1 * Delay_1 + Temp; \
  Delay_1 = Temp;

/**********************************************************************/
/*                                                                    */
/*  Macro: TWO_POLE_FILTER                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a second order canonic section which         */
/*    implements a two pole filter. The transfer function of the      */
/*    filter is:                                                      */
/*                                                                    */
/*                                                                    */
/*            Y(Z)            b0                                      */
/*    H(Z) = ------ = --------------------                            */
/*            X(Z)             -1      -2                             */
/*                     1 - a1 Z  - a2 Z                               */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a2 y(n-2) + a1 y(n-1) + b0 x(n)                          */
/*                                                                    */
/*                                                                    */
/*             b0                                                     */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |                                        */
/*                |          V                                        */
/*                |       -------                                     */
/*                |       |  -1 |                                     */
/*                |       | Z   |                                     */
/*                |       |     |                                     */
/*                |       -------                                     */
/*                |          |                                        */
/*                |   a1     |                                        */
/*                |<---------|                                        */
/*                |          |                                        */
/*                |          V                                        */
/*                |       -------                                     */
/*                |       |  -1 |                                     */
/*                |       | Z   |                                     */
/*                |       |     |                                     */
/*                |       -------                                     */
/*                |          |                                        */
/*                |   a2     |                                        */
/*                |<----------                                        */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define TWO_POLE_FILTER( Yout, \
                         Xin, \
                         Delay_1, \
                         Delay_2, \
                         a1, \
                         a2, \
                         b0 ) \
/*  Temp1 = a2 * Delay_2; \
  Delay_2=Delay_1; \
  Temp0=a1 * Delay_1; \
  Temp1+=Temp0; \
  Temp0=b0*Xin; \
  Temp1+=Temp0; \
  Delay_1=Temp1; \
  Yout=Temp1; */ \
  Yout = a2 * Delay_2 + a1 * Delay_1 + b0 * Xin; \
  Delay_2 = Delay_1; \
  Delay_1 = Yout;
#define TWO_POLE_FILTER_MATT( Xin, \
                         Delay_1, \
                         Delay_2, \
                         a1, \
                         a2, \
                         b0 ) \
  Temp1 = a2 * Delay_2; \
  Delay_2=Delay_1; \
  Temp0=a1 * Delay_1; \
  Temp1+=Temp0; \
  Temp0=b0*Xin; \
  Temp1+=Temp0; \
  Delay_1=Temp1;

/**********************************************************************/
/*                                                                    */
/*  Macro: MINIMUM_TWO_POLE_FILTER                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a second order canonic section which         */
/*    implements a two pole filter. The gain of this filter is        */
/*    1 - a1 - a2 at DC. The transfer function of the filter is:      */
/*                                                                    */
/*                                                                    */
/*            Y(Z)             1                                      */
/*    H(Z) = ------ = --------------------                            */
/*            X(Z)             -1      -2                             */
/*                     1 - a1 Z  - a2 Z                               */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a2 y(n-2) + a1 y(n-1) + x(n)                             */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |                                        */
/*                |          V                                        */
/*                |       -------                                     */
/*                |       |  -1 |                                     */
/*                |       | Z   |                                     */
/*                |       |     |                                     */
/*                |       -------                                     */
/*                |          |                                        */
/*                |   a1     |                                        */
/*                |<---------|                                        */
/*                |          |                                        */
/*                |          V                                        */
/*                |       -------                                     */
/*                |       |  -1 |                                     */
/*                |       | Z   |                                     */
/*                |       |     |                                     */
/*                |       -------                                     */
/*                |          |                                        */
/*                |   a2     |                                        */
/*                |<----------                                        */
/*                                                                    */
/*    The output of this macro is Delay_1.                            */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define MINIMUM_TWO_POLE_FILTER( Yout, \
                                 Xin, \
                                 Delay_1, \
                                 Delay_2, \
                                 a1, \
                                 a2 ) \
/*  Temp1 = a2 * Delay_2; \
  Delay_2=Delay_1; \
  Temp0=a1 * Delay_1; \
  Temp1+=Temp0; \
  Temp1+=Xin; \
  Delay_1=Temp1; \
  Yout=Temp1;  */ \
  Yout = a2 * Delay_2 + a1 * Delay_1 + Xin; \
  Delay_2 = Delay_1; \
  Delay_1 = Yout; 

#define MINIMUM_TWO_POLE_FILTER_MATT( Xin, \
                                 Delay_1, \
                                 Delay_2, \
                                 a1, \
                                 a2 ) \
  Temp1 = a2 * Delay_2; \
  Delay_2=Delay_1; \
  Temp0=a1 * Delay_1; \
  Temp1+=Temp0; \
  Temp1+=Xin; \
  Delay_1=Temp1; \
/*  Yout = a2 * Delay_2 + a1 * Delay_1 + Xin; \
  Delay_2 = Delay_1; \
  Delay_1 = Yout; */


/**********************************************************************/
/*                                                                    */
/*  Macro: ONE_POLE_FILTER                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a first order canonic section which          */
/*    implements a one pole filter. This filter structure is also     */
/*    known as a decay averager. The transfer function of the filter  */
/*    is:                                                             */
/*                                                                    */
/*                                                                    */
/*            Y(Z)        b0                                          */
/*    H(Z) = ------ = ------------                                    */
/*            X(Z)             -1                                     */
/*                     1 - a1 Z                                       */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a1 y(n-1) + b0 x(n)                                      */
/*                                                                    */
/*                                                                    */
/*             b0                                                     */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |                                        */
/*                |          V                                        */
/*                |       -------                                     */
/*                |       |  -1 |                                     */
/*                |       | Z   |                                     */
/*                |       |     |                                     */
/*                |       -------                                     */
/*                |          |                                        */
/*                |   a1     |                                        */
/*                |<---------|                                        */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define ONE_POLE_FILTER( Yout, \
                         Xin, \
                         Delay_1, \
                         a1, \
                         b0 ) \
  Yout = a1 * Delay_1 + b0 * Xin; \
  Delay_1 = Yout;

/**********************************************************************/
/*                                                                    */
/*  Macro: MINIMUM_ONE_ZERO_FILTER                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*	Eab changed to one zero filter 9/00								  */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a first order canonic section which          */
/*    implements a one pole filter. The gain of the filter is 1 - a1  */
/*    at DC. The transfer function of the filter is:                  */
/*                                                                    */
/*                                                                    */
/*            Y(Z)         1                                          */
/*    H(Z) = ------ = ------------                                    */
/*            X(Z)             -1                                     */
/*                     1 - a1 Z                                       */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = a1 y(n-1) + x(n)                                         */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                ^          |                                        */
/*                |          V                                        */
/*                |       -------                                     */
/*                |       |  -1 |                                     */
/*                |       | Z   |                                     */
/*                |       |     |                                     */
/*                |       -------                                     */
/*                |          |                                        */
/*                |   a1     |                                        */
/*                |<---------|                                        */
/*                                                                    */
/*                                                                    */
/**********************************************************************/

#define MINIMUM_ONE_ZERO_FILTER( Yout, \
                                 Xin, \
                                 Delay_1, \
                                 a1 ) \
  Yout = a1 * Delay_1 + Xin; \
  Delay_1 = Xin;

/**********************************************************************/
/*                                                                    */
/*  Macro: TWO_ZERO_FILTER                                            */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a second order two zero filter.              */
/*                                                                    */
/*                                                                    */
/*            Y(Z)              -1      -2                            */
/*    H(Z) = ------ =  b0 + b1 Z  + b2 Z                              */
/*            X(Z)                                                    */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = b2 x(n-2) + b1 x(n-1) + b0 x(n)                          */
/*                                                                    */
/*    Instead the filter is implemented as a second order canonic     */
/*    filter section in Direct Form II.                               */
/*                                                                    */
/*                                                                    */
/*                          b0                                        */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                   |          ^                                     */
/*                   V          |                                     */
/*                -------       |                                     */
/*                |  -1 |       |                                     */
/*                | Z   |       |                                     */
/*                |     |       |                                     */
/*                -------       |                                     */
/*                   |          |                                     */
/*                   |     b1   |                                     */
/*                   |--------->|                                     */
/*                   |          |                                     */
/*                   V          |                                     */
/*                -------       |                                     */
/*                |  -1 |       |                                     */
/*                | Z   |       |                                     */
/*                |     |       |                                     */
/*                -------       |                                     */
/*                   |          |                                     */
/*                   |     b2   |                                     */
/*                   |--------->|                                     */
/*                                                                    */
/*                                                                    */
/*    This filter must have a different variable for the input        */
/*    and output parameters if it is to function properly.            */
/*                                                                    */
/**********************************************************************/

#define TWO_ZERO_FILTER( Yout, \
                         Xin, \
                         Delay_1, \
                         Delay_2, \
                         b0, \
                         b1, \
                         b2 ) \
  Yout = b2 * Delay_2 + b1 * Delay_1 + b0 * Xin; \
  Delay_2 = Delay_1; \
  Delay_1 = Xin;

/**********************************************************************/
/*                                                                    */
/*  Macro: MINIMUM_TWO_ZERO_FILTER                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*    This macro defines a second order two zero filter.              */
/*                                                                    */
/*                                                                    */
/*            Y(Z)              -1      -2                            */
/*    H(Z) = ------ =  1 + b1 Z  + b2 Z                               */
/*            X(Z)                                                    */
/*                                                                    */
/*                                                                    */
/*    The filter may be implemented as a difference equation of the   */
/*    following form.                                                 */
/*                                                                    */
/*    y(n) = b2 x(n-2) + b1 x(n-1) + x(n)                             */
/*                                                                    */
/*    Instead the filter is implemented as a second order canonic     */
/*    filter section in Direct Form II.                               */
/*                                                                    */
/*                                                                    */
/*                                                                    */
/*      X(Z) ---------------------------------> Y(Z)                  */
/*                   |          ^                                     */
/*                   V          |                                     */
/*                -------       |                                     */
/*                |  -1 |       |                                     */
/*                | Z   |       |                                     */
/*                |     |       |                                     */
/*                -------       |                                     */
/*                   |          |                                     */
/*                   |     b1   |                                     */
/*                   |--------->|                                     */
/*                   |          |                                     */
/*                   V          |                                     */
/*                -------       |                                     */
/*                |  -1 |       |                                     */
/*                | Z   |       |                                     */
/*                |     |       |                                     */
/*                -------       |                                     */
/*                   |          |                                     */
/*                   |     b2   |                                     */
/*                   |--------->|                                     */
/*                                                                    */
/*                                                                    */
/*    This filter must have a different variable for the input        */
/*    and output parameters if it is to function properly.            */
/*                                                                    */
/**********************************************************************/

#define MINIMUM_TWO_ZERO_FILTER( Yout, \
                                 Xin, \
                                 Delay_1, \
                                 Delay_2, \
                                 b1, \
                                 b2 ) \
  Yout = b2 * Delay_2 + b1 * Delay_1 + Xin; \
  Delay_2 = Delay_1; \
  Delay_1 = Xin;
                  
#endif

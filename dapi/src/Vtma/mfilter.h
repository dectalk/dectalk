/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	27	04/28/97	leeber	Build 109 V4.60.04 R003 04/22/99; Freeze Mark; No matching AD Mark. 04/27/99 cjl
	26	04/28/97	leeber	Build 109 V4.60.03 R003 03/31/99 Freeze Mark 04/02/99 cjl
	25	04/28/97	leeber	Build 108 V4.60.02 B002 01/29/99, Freeze Mark, 02/25/99 cjl
	24	04/28/97	leeber	Files verified as different on both WinDif and StarTeam for chnages between AD and RND. 02/01/99 cjl
	23	04/28/97	leeber	AD->RND Pre-V4.60.01 B002 Freeze Transfer, 01/19/99 cjl
	22	04/28/97	leeber	Build 108 V4.51.08 R007 11/03/98, Patch BATS#741 and UNIX build process bugs. 11/06/98 cjl
	21	04/28/97	leeber	AD-> RND File Update; Alpha kitting and DETX build not verified, End Of Beta Test, No showstops/highs; For release mark. Build 108 V4.51.07 R006 08/20/98. 08/31/98 cjl
	20	04/28/97	leeber	BUILD 108 V4.51.06 R005 06/26/98; BATS#249, 290, 313, 428, 492, 532, 546, 550, 566, 590, 599, 602, 603, 607, 608, 610, 613, 616, 623, 626, 631-633, 636-639, 630, 641-643, 645, 648, 651, 656-661, 663, 665, 666, 668, 672, 674-677, 681-683, 685, 688-693, 695
	19	04/28/97	leeber	This has the correct documentation that goes with Build 107 V4.50.04 R004, from AD. 04/15/98 cjl
	18	04/28/97	leeber	Code freeze Build 107 V4.50.04 R004 03/20/98 has been moved from AD->RND for testing. New keys, BATS (459, 590, 606, 607, 609, 610, 617, 619, 620, 622, 626, 627, 628 & 630) fixes, better process, SAPI features added. 03/27/98 cjl
	17	04/28/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	16	04/28/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	15	04/28/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	14	04/28/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	13	04/28/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	12	04/28/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	11	04/28/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	10	04/28/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	9	04/28/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	8	04/28/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	7	04/28/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	6	04/28/97	leeber	Build 104 V4.40.43 R007 08/18/97; Static Builds, Help files, BATS 124, 147, 152, 223, 257, 270, 283, 298, 314, 340, 348, 351, 364, 384, 388, 390, 395, 396, 405, 409-412, 416, 422, 438 & 441. 08/18/97 cjl FREEZE
	5	04/28/97	leeber	Preliminary Code Freeze; Missing docs, hlp and tuning files; otherwisw complete. cjl BUILD 104 V4.40.40 R007 x8/07/97
	4	04/28/97	leeber	Build 104 V4.40.38 B006 _6/25/97 Typning Mode w/assistve32 SDK, Re_Freeze after system crash. 6/25/97 cjl
	3	04/28/97	leeber	Build 104 V4.40.38 B006 06/25/97 Typning Mode w/assistve32 SDK. 6/25/97 cjl
	2	04/28/97	leeber	This is "BUILD 104 V4.40.37 B006H 06/20/97" and contans the special typing_mode build for Henter Joyce. 6/20/97 cjl
	1	04/28/97	simoneau	Initial Version
$
 * Revision 1.1.2.2  1995/07/05  20:04:11  Krishna_Mangipudi
 * 	Moved from ./src/synth/fvtm
 * 	[1995/07/05  20:02:48  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  22:55:44  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  20:37:28  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 * 
 * $EndLog$
 */
/*
**++
** FACILITY:  Workstation Multimedia  (WMM)  v1.0 
** 
** FILE NAME:   
** MODULE NAME: 
**
** MODULE DESCRIPTION: 
** 
** DESIGN OVERVIEW: 
** 
**--
*/
/**********************************************************************/
/*                                                                    */
/*  Include File: mfilter.h                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
/**********************************************************************/
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
/*    The following equations that require less storage are used.     */
/*                                                                    */
/*    d(n) = a2 d(n-2) + a1 d(n-1) + x(n)                             */
/*    y(n) = b2 d(n-2) + b1 d(n-1) + b0 d(n)                          */
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
/*    d(n) = a2 d(n-2) + a1 d(n-1) + x(n)                             */
/*    y(n) = b2 d(n-2) + b1 d(n-1) + d(n)                             */
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
  Yout = a2 * Delay_2 + a1 * Delay_1 + b0 * Xin; \
  Delay_2 = Delay_1; \
  Delay_1 = Yout;

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
/*                                                                    */
/**********************************************************************/

#define MINIMUM_TWO_POLE_FILTER( Yout, \
                                 Xin, \
                                 Delay_1, \
                                 Delay_2, \
                                 a1, \
                                 a2 ) \
  Yout = a2 * Delay_2 + a1 * Delay_1 + Xin; \
  Delay_2 = Delay_1; \
  Delay_1 = Yout;

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
/*  Macro: MINIMUM_ONE_POLE_FILTER                                    */
/*  Author: Bill Hallahan                                             */
/*  Date: February 17, 1992                                           */
/*                                                                    */
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

#define MINIMUM_ONE_POLE_FILTER( Yout, \
                                 Xin, \
                                 Delay_1, \
                                 a1 ) \
  Yout = a1 * Delay_1 + Xin; \
  Delay_1 = Yout;

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

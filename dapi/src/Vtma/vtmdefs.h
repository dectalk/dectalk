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
 * Revision 1.1.2.2  1995/07/05  20:04:26  Krishna_Mangipudi
 * 	Moved from ./src/synth/fvtm
 * 	[1995/07/05  20:02:58  Krishna_Mangipudi]
 *
 * Revision 1.2.2.2  1994/11/07  22:56:21  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  20:38:44  Krishna_Mangipudi]
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
/*  Include File: vtmdefs.h                                           */
/*                                                                    */
/*  This include file declares most of the constants used by the      */
/*  DECtalk vocal tract model vtm.c                                   */
/*                                                                    */
/**********************************************************************/

#define  SAMPLE_RATE 8000 

#define  MAX_FREQ_AT_8000   3600
#define  MAX_FREQ_AT_10000  4500
#define  MAX_FREQ_AT_11025  4961

/**********************************************************************/
/*  Set sample rate dependant variables.                              */
/**********************************************************************/

/**********************************************************************/
/*  Sample rate = 8000 Hz.                                            */
/**********************************************************************/

#if ( SAMPLE_RATE == 8000 )

#define  MAXFRE  MAX_FREQ_AT_8000
#define  NSFRAM  51

#endif

/**********************************************************************/
/*  Sample rate = 10000 Hz.                                           */
/**********************************************************************/

#if ( SAMPLE_RATE == 10000 )

#define  MAXFRE  MAX_FREQ_AT_10000
#define  NSFRAM  64

#endif

/**********************************************************************/
/*  Sample rate = 11025 Hz.                                           */
/**********************************************************************/

#if ( SAMPLE_RATE == 11025 )

#define  MAXFRE  MAX_FREQ_AT_11025
#define  NSFRAM  71

#endif

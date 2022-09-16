/*
 * @DEC_COPYRIGHT@
 */
/*
 * HISTORY
 * $Log: 
	12	05/14/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	05/14/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	05/14/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	05/14/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	05/14/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	05/14/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	05/14/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	05/14/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	05/14/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	05/14/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	05/14/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	05/14/97	leeber	Initial Version
$
 * Revision 1.1.2.2  1995/11/14  21:35:05  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:37  Krishna_Mangipudi]
 *
 * $EndLog$
 */

/* {{{ Header Stuff  */
/*$Id: dtk.h,v 1.1.2.2 1995/11/14 21:35:05 Krishna_Mangipudi Exp $ */
/*$Author: leeber$ */
/*$Log: 
	12	05/14/97	leeber	Build 107 V4.50.03 B003 02/19/98 cjl Freeze of code for beta release.
	11	05/14/97	leeber	Build 107 V4.50.02 B002 01/30/98 BATS 546, 549, 558, 561, 557, 553 & 566 fixed and NUMEROUS build/kitting/archiving process files have been updated, UK and ML adds were done for 32 and 16 bit. 01/30/98 cjl
	10	05/14/97	leeber	Build 107 V4.50.01 B001 01/22/98 First try at V4.5 release (A32 V2.10.01). Several bugs found. 01/22/98 cjl
	9	05/14/97	leeber	Build 106 V4.41.13 R012 12/05/97 NWSNOAA freeze R012 Final Delivery. 12/09/97 cjl
	8	05/14/97	leeber	Build 106 V4.41.12 R011 12/05/97 SMIT/ACCESS32, mak/dsp 4 Alpha, NWS beta2+, UNIX,  and SAPI speed improvements. 12/05/97 cjl
	7	05/14/97	leeber	Build 106 V4.41.11 R010 11/21/97 Beta2 NWSNOAA and SAPI Updates. 11/21/97 cjl
	6	05/14/97	leeber	SNAPSHOT106  V4.41 R010 11/17/97 NWSNOAA Beta2 Trail Code, tested (16 & 32 bit) 11/17/97 cjl
	5	05/14/97	leeber	Build 106 V4.41.08 R009 10/31/97 NWSNOAA Beta1 Code Release, tested (16 & 32 bit) 10/31/97 cjl
	4	05/14/97	leeber	SNAPSHOT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	3	05/14/97	leeber	CODE MARK POINT (Pre-R009 that will include buildable NWS/NOAA and code ONLY English UK). Also represents latest working (verified) ML for Intel/Windows and Alpha UNIX ONLY. Alpha NT has a build bug. 10/27/97 cjl
	2	05/14/97	leeber	Build 106 V4.41.00 R008 10/01/97 Update for V4.41 with UNIX. 10/01/97 cjl
	1	05/14/97	leeber	Initial Version
$
 * Revision 1.1.2.2  1995/11/14  21:35:05  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 * 	[1995/11/14  21:33:37  Krishna_Mangipudi]
 *
 * Revision 1.1.1.2  1995/11/14  21:33:37  Krishna_Mangipudi
 * 	Initial checkin into DECtalk Software source pool
 *
 * Revision 1.5  1995/06/15  22:28:24  raman
 * Can be included by external modules. cleaned up code.
 *
 * Revision 1.4  1995/06/15  22:12:10  raman
 * af.c compiles successfully and cleanly. But dtk.h now exposes too much.
 * Clean up code. Remove repeated code from dtk.c eventually.
 *
 * Revision 1.3  1994/08/31  15:34:55  raman
 * Checking in before switching to tclx
 *
 * Revision 1.2  1994/07/06  13:13:24  raman
 * Protected from being included multiple times.
 *
 * Revision 1.1  1994/07/06  13:07:03  raman
 * Initial revision
 * */
/*Description: Header file included by programs using module dtk */

#ifndef _DTK_
#define _DTK_
int Dtk_Init(); 

#ifndef _CLIENTDATA
#   if defined(__STDC__) || defined(__cplusplus)
    typedef void *ClientData;
#   else
    typedef int *ClientData;
#   endif /* __STDC__ */
#define _CLIENTDATA
#endif

typedef enum {SAY_RATE, CHAR_FACTOR, SPEECH_RATE, TALKING, 
		CAPITALIZE, SPLIT_CAPS, SPACE_SPECIAL_CHAR } DECTALK_GLOBALS;

#endif

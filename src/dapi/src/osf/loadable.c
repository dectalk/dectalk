/**********************************************************************/
/*                                                                    */
/*  Copyright © 2000-2001 Force Computers Inc. A Solectron company. All rights reserved. */
/*  © SMART Modular Technologies 1999. All rights reserved.    	      */
/*  Copyright Digital Equipment Corporation, 1994,                    */
/*  All rights reserved.                                              */
/*                                                                    */
/*  This software is proprietary to and embodies the confidential     */
/*  technology of Force Computers Incorporated. Possession, use,      */
/*  or copying of this software and media is authorized only pursuant */
/*  to a valid written license from Force or an authorized            */
/*  sublicensor.                                                      */
/*                                                                    */
/*  Restricted Rights: Use, duplication, or disclosure by the         */
/*  U.S. Government is subject to restrictions as set forth in        */
/*  subparagraph (c) (1) (ii) of DFARS 252.227-7013, or in            */
/*  FAR 52.227-19, or in FAR 52.227-14 Alt. III as applicable.        */
/*                                                                    */
/*  The name of Force Computers Incorporated may not be used to       */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  This software is provided "as is" and without any express or      */
/*  implied warranties, including, without limitation, implied        */
/*  warranties of non-infringement, merchantibility or fitness        */
/*  for a particular purpose. Force assumes no responsibility AT      */
/*  ALL for the use or reliability of this software.                  */
/*                                                                    */
/**********************************************************************/

/*
 * HISTORY
 * Revision 1.1.2.8  1996/11/19  12:22:31  Cathy_Page
 * 	Changed version back to minor = 1
 * 	Fixed check for determining if we should let the user run 1 copy
 * 	  without a valid license pak.
 * 	[1996/11/19  12:20:34  Cathy_Page]
 *
 * Revision 1.1.2.7  1996/10/18  12:14:51  Cathy_Page
 * 	Added new error codes for lmf - no longer use lmf_test_license
 * 	[1996/10/18  12:13:28  Cathy_Page]
 * 
 * Revision 1.1.2.6  1996/09/25  13:43:24  Cathy_Page
 * 	Changed lmf logic
 * 	[1996/09/25  13:41:06  Cathy_Page]
 * 
 * Revision 1.1.2.5  1995/09/25  19:59:10  Krishna_Mangipudi
 * 	Added check for license quota exceeded
 * 	[1995/09/25  19:59:01  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.4  1995/09/25  15:19:39  Krishna_Mangipudi
 * 	Set the right product name
 * 	[1995/09/25  15:19:32  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.3  1995/09/22  16:14:09  Krishna_Mangipudi
 * 	Added code to look at dtklock to package a version for Platinum that has
 * 	to work without LMF.
 * 	[1995/09/22  16:13:57  Krishna_Mangipudi]
 * 
 * Revision 1.1.2.2  1995/07/05  19:35:39  Krishna_Mangipudi
 * 	Copied from ./src/tts
 * 	[1995/07/05  19:32:29  Krishna_Mangipudi]
 * 
 * Revision 1.2.2.2  1994/11/07  23:07:42  Krishna_Mangipudi
 * 	Initial Check-in
 * 	[1994/11/07  21:13:28  Krishna_Mangipudi]
 * 
 * Revision 1.2  1994/11/04  18:33:29  root
 * 	Initial load of project
 *
 * 001	MGS		05/09/2001	Some VxWorks porting BATS#972
 * 002  CAB		05/14/2001	Consolidated copyright info
 * 003	MGS		06/19/2001		Solaris Port BATS#972
 * 
 */

/* BATS #496 Changed license keys MGS 10/14/1997 */

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


/*****************************************************************************
**  PROGRAM:
**     loadable.c
**
**  FACILITY:
**
**      DECtalk
**
**  ABSTRACT:
**
**      This file contains the LMF checks.
**
**  ENVIRONMENT:
**
**     OSF/1 AXP
**
**  AUTHOR(S):
**	Raghavan Srinivasan
**
**  CREATION DATE:
**
**  MODIFICATION HISTORY:
**
*****************************************************************************/
#if defined __osf__
#include "lmf.h"
#include <stdio.h>
#include <sys/file.h>
#include <sys/errno.h>
#include "tts.h"

/*
*  LMF Particulars - I need to do something about RELEASE_DATE_LONG
*/

/* BATS #496 Changed license keys MGS 10/14/1997 */

#define SW_PRODUCT_INT "DECTALK-SW97-INT"
#define SW_PRODUCT_USER "DECTALK-SW97-USER"
#define SW_PRODUCER "DEC"
#define MAJOR 4
#define MINOR 4
static ver_t	ver = {MAJOR, MINOR};

/*
*  The long value is based on a day ahead of the release date so that it
*  can compensate for time differences
*/

#define RELEASE_DATE_LONG 876974399 /* from usr/sbin/lmfck -d 15-OCT-1997 */

/****************************************************************************
**
**  CheckLicenses
**
**  FUNCTIONAL DESCRIPTION:
**
**      This will check to see if a license exits.
**
**  FORMAL PARAMETERS:
**
**     Output:
**         productIndex = index into the product license table if the
**                        return status is successful
**
**  RETURN VALUE
**
**     0 if successful
**     LIC_NO_MORE_UNITS if user exceeded amount of license units
**     LIC_NO_PAK        if pak cannot be found
**     LIC_UNKNOWN_ERR   if failed for any other reason
**
***************************************************************************/
int CheckLicenses()
{

    int    status=0;
    int i;
    /*
     *  Check for the sw license and abort if 
     *  the license is not installed.
     *  lmf_probe_license returns 0 on success, -1 on failure.
     */
	if (lmf_probe_license(SW_PRODUCT_INT, SW_PRODUCER,  
			      &ver, RELEASE_DATE_LONG, 0))
	{
	    /* 
	     * Keep track of the type of error message returned from the 
	     * lmf_probe_license call. If we're checking for 2 licenses
	     * and one of them is not found and the other one is out of units,
	     * then return a LIC_NO_MORE_UNITS error.
	     */
		status=errno;
		if (lmf_probe_license(SW_PRODUCT_USER, SW_PRODUCER,
					&ver, RELEASE_DATE_LONG,0))
		{
			status=errno;
		}
		else
		{
			status=0;
		}
	}
	else
	{
	    status = 0;
	}
    /* If there are no valid licenses, allow the user to run 1 copy */
    if (status)
    {
        /*
         * No license installed, may have only free RT license
         * so allow user to run only one copy of DECtalk Software
         */
	  fprintf(stdout, "\n");
	  fprintf(stdout, "    This machine does not have a license for DECtalk Software.\n");
	  fprintf(stdout, "    You will need to purchase a DECtalk Software license from \n");
	  fprintf(stdout, "    Digital Equipment Corporation in order to run DECtalk Software.\n");
	  fprintf(stdout, "\n");
	  fprintf(stdout, "    For more information please contact your sales representative.\n");

	  if (status == EDQUOT)
	    return (LIC_NO_MORE_UNITS);
	  else 
	    if (status == ENOENT)
	      return (LIC_NO_PAK);
	    else
	      return (LIC_UNKNOWN_ERR);
    }
    return (0);
}

/****************************************************************************
**
**  TestLicense
**
**  FUNCTIONAL DESCRIPTION:
**
**      This will test for a valid license with sufficient units and print
**      out an appropriate error message if there's a failure.
**
**  FORMAL PARAMETERS:
**
**    Input:   productIndex = Index into the product license list
**
**  RETURN VALUE
**
**     none
**
***************************************************************************/
void TestLicense(unsigned int productIndex)
{
    int    status=0;

    /*
     * Exceeded license quota: Tried to run more copies than the license 
     * class will allow.
     */
    status = lmf_test_license(SW_PRODUCT_INT, SW_PRODUCER,  
			      &ver, RELEASE_DATE_LONG, 0);

    if (status)    
    {
	fprintf(stdout, "\n");
	fprintf(stdout, "    License Quota Exceeded:\n");
	fprintf(stdout, "\n");
	fprintf(stdout, "    You have exceeded the license quota with this invocation of\n");
	fprintf(stdout, "    DECtalk Software.  In order to run this DECtalk Software application\n");
	fprintf(stdout, "    at this time you will need to stop at least one other DECtalk Software\n");
	fprintf(stdout, "    application currently running on your system.  Alternatively, you may\n");
	fprintf(stdout, "    contact your sales representative at Digital Equipment Corporation to\n"); 
	fprintf(stdout, "    obtain a license that will allow you to run more copies of the\n");
	fprintf(stdout, "    DECtalk Software applications simultaneously.\n");
    } 
    return;
}
#endif // __osf__


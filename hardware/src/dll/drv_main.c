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
 *    File Name:	drv_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC window Driver process ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "drv.h"

LRESULT FAR PASCAL _loadds DriverProc(DWORD dwDriverID, HDRVR hDriver, UINT uiMessage, LPARAM lParam1, LPARAM lParam2)
{

	switch (uiMessage) {

        case DRV_LOAD:

				if(dtpcInitDll() == DLL_SUCCESS)
					return (LRESULT)1L;
				else
					{
					MessageBox(0,"Module not Found","DECtalk PC",(MB_OK|MB_ICONASTERISK|MB_SYSTEMMODAL));
					return (LRESULT)0L;
					}

        case DRV_FREE:
            return (LRESULT)1L;

        case DRV_OPEN:
	        return (LRESULT)1L;

        case DRV_CLOSE:
           return (LRESULT)1L;

        case DRV_ENABLE:
           return (LRESULT)1L;

        case DRV_DISABLE:
            return (LRESULT)1L;

        case DRV_QUERYCONFIGURE:
           return (LRESULT)1L;        /* we do configuration */

        case DRV_CONFIGURE:
           return (LRESULT)1L;

        case DRV_INSTALL:
            return (LRESULT)1L;

        case DRV_REMOVE:
            return (LRESULT)1L;

        default:
            return DefDriverProc(dwDriverID, hDriver,uiMessage,lParam1,lParam2);
    }                  
}

int FAR PASCAL WEP (int bSystemExit)
{
	return(1);
}
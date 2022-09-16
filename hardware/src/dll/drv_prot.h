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
 *    File Name:	drv_prot.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  File \dtpc\dll\src\protos.h
 *  Created on : 07/23/92 at 14:35:19
 *
 ***********************************************************************
 *    Revision History:
 */ 

extern  long __pascal __far __loadds DriverProc(unsigned long dwDriverID,unsigned int hDriver,unsigned int uiMessage,long lParam1,long lParam2);
/*extern        int __pascal __far WEP(int bSystemExit); */

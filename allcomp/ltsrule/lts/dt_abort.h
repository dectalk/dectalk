/* **********************************************************************************
 *                			Copyright
 *    Copyright © 2002 Fonix Coporation. All rights reserved.
 *    Copyright (c) 2001 Force Computers Inc., A Solectron company. All rights reserved.
 *    Copyright (c)1998 Digital Equipment Corporation. all rights reserved.
 *
 *    This is an unpublished work, and is confidential and proprietary: 
 *    technology and information of Fonix corporation.  No part of this
 *    code may be reproduced, used or disclosed without written consent of 
 *    Fonix corporation in each and every instance.
 * ***********************************************************************************
 *    File Name:        dt_abort.h.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *					macros to cause a serious error abort
 *					this is done as a macro so that, at least on win32/u*ix we can get 
 *					some info as to where we died..
 *					these are platform specific, with the following behaviors:
 *					Win32:       cause an assertion failure.
 *					U*ix:        cause an assertion failure
 *					DTPC1/2:     set an error code (MODE_error) in the status register, and stop.
 *					DTEX:        set an error code (MODE_error) in the status register, print a message, and stop.
 *************************************************************************************
 *    Revision History:
 *
 *	Rev Who     Date            Description
 *	---	-----   -----------     --------------------------------------------
 *	001	MGS		05/07/1998		removed _ from assert for __osf__
 *	002 ETT		10/05/1998		Added Linux code.
 *	003	MGS		05/09/2001		Some VxWorks porting BATS#972
 *	004	CAB		05/14/2001		Updated copyright info.
 *	005	MGS		06/19/2001		Solaris Port BATS#972
 *	006	CAB		06/17/2002		Removed assert.h for UNDER_CE
*/

#ifdef _WIN32
#ifndef UNDER_CE
#include <assert.h>
#define dt_abort \
	{ \
	assert(1); \
	}\

#endif
#endif //WIN32

#if defined _UNIX_LIKE_
#include <assert.h>
#define dt_abort \
{ \
    assert(0); \
}

#endif  //__osf__ || (__linux__) || defined VXWORKS || defined _SPARC_SOLARIS_

#ifdef DTPC1
#include "pcport.h"
#include "libp.h"
#define dt_abort \
	{ \
	status_clear(0xFFFF); \
	status_set_update(MODE_error); \
	error_hang(); \
	}\

#endif //DTPC1

#ifdef DTPC2
#include "pcport.h"
#include "libp.h"
#define dt_abort \
	{ \
	status_clear(0xFFFF); \
	status_set_update(MODE_error); \
	error_hang(); \
	}\

#endif //DTPC2

#ifdef DTEX
#include "pcport.h"
#include "libp.h"
#define dt_abort \
	{ \
	status_clear(0xFFFF); \
	status_set_update(MODE_error); \
	printf(__FILE__); \
	printf("dt_abort!\n"); \
	error_hang(); \
	}\

#endif //DTEX

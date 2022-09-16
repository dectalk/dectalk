// dt_abort.h
// copyright (c)1998 Digital Equipment Corporation
// all rights reserved.
//
// macros to cause a serious error abort
// this is done as a macro so that, at least on win32/u*ix we can get 
// some info as to where we died..
// these are platform specific, with the following behaviors:
// Win32:       cause an assertion failure.
// U*ix:        cause an assertion failure
// DTPC1/2:     set an error code (MODE_error) in the status register, and stop.
// DTEX:        set an error code (MODE_error) in the status register, print a message, and stop.
//
// 001 MGS 05/07/1998 removed _ from assert for __osf__
// 002  ETT		10/05/1998      Added Linux code.
// 003  MFG    2/28/2003 Merged in DECtalk version 5.00 changes

#ifdef _WIN32
#ifndef UNDER_CE
#include <assert.h>
#define dt_abort \
	{ \
	assert(1); \
	}\

#endif
#endif //WIN32

#if defined (__osf__) || defined (__linux__)
#include <assert.h>
#define dt_abort \
{ \
    assert(0); \
}

#endif  //__osf__ || (__linux__)

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


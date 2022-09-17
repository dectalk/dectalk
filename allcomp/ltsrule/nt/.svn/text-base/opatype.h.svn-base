/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  Include File: opatype.h                                           */
/*  Author: Bill Hallahan                                             */
/*  Date: November 15, 1995                                           */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*          This file includes the type definition for a type that    */
/*    is large enough to contain an address (pointer).                */
/*                                                                    */
/**********************************************************************/
/*
 *  001	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  002	MGS		06/19/2001		Solaris Port BATS#972
 *
 ********************************************************************/

#ifndef _OPATYPE_H_
#define _OPATYPE_H_

/**********************************************************************/
/*  Digital UNIX. and Linux                                           */
/**********************************************************************/

#if defined __unix__ || defined _UNIX_LIKE_

typedef  long  ATYPE_T;
typedef  ATYPE_T *  LPATYPE_T;

#endif

/**********************************************************************/
/*  OpenVMS                                                           */
/**********************************************************************/

#ifdef __VMS

typedef  long  ATYPE_T;
typedef  ATYPE_T *  LPATYPE_T;

#endif

/**********************************************************************/
/*  Windows 95 and Windows NT. Allow the symbol WIN32 (the old way)   */
/*  in addition to _WIN32.                                            */
/**********************************************************************/

#ifdef WIN32
#ifndef _WIN32
#define _WIN32
#endif
#endif

#ifdef _WIN32

typedef  unsigned int  ATYPE_T;
typedef  ATYPE_T *  LPATYPE_T;

#endif

#ifdef OS_SYMBIAN




typedef  unsigned int  ATYPE_T;
typedef  ATYPE_T *  LPATYPE_T;

#endif

/**********************************************************************/
/*  PALM                                                           */
/**********************************************************************/
#ifdef OS_PALM

typedef  long  ATYPE_T;
typedef  ATYPE_T *  LPATYPE_T;

#endif

#endif

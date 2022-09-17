/*
 * *****************************************************************
 * *                                                               *
 * *    Copyright (c) Digital Equipment Corporation, 1991, 1996    *
 * *                                                               *
 * *   All Rights Reserved.  Unpublished rights  reserved  under   *
 * *   the copyright laws of the United States.                    *
 * *                                                               *
 * *   The software contained on this media  is  proprietary  to   *
 * *   and  embodies  the  confidential  technology  of  Digital   *
 * *   Equipment Corporation.  Possession, use,  duplication  or   *
 * *   dissemination of the software and media is authorized only  *
 * *   pursuant to a valid written license from Digital Equipment  *
 * *   Corporation.                                                *
 * *                                                               *
 * *   RESTRICTED RIGHTS LEGEND   Use, duplication, or disclosure  *
 * *   by the U.S. Government is subject to restrictions  as  set  *
 * *   forth in Subparagraph (c)(1)(ii)  of  DFARS  252.227-7013,  *
 * *   or  in  FAR 52.227-19, as applicable.                       *
 * *                                                               *
 * *****************************************************************
 */
/*
 * HISTORY
 */
/*
 * @(#)$RCSfile: lmf.h,v $ $Revision: 1.1.7.2 $ (DEC) $Date: 1994/05/12 18:01:40 $
 */
/*
 *            @(#)lmf.h	4.1     (ULTRIX)        7/2/90
 */

/* Definitions necessary to use lmf library. */

/************************************************************************
 *									*
 *			Modification history				*
 *									*
 *  19-Sep-89	Lisa Allgood
 *	Moved LMF_TOKEN and LMF_HARDWARE from lmfklic.h to here
 *  4-Jul-89	Giles Atkinson						*
 *	Add definition of allocation codes				*
 *  1-Jun-89	Giles Atkinson						*
 *	Add definition of flag argument to probe/test license		*
 *									*
 * Lisa Allgood - 4th May 1989						*
 *	Original version						*
 *									*
 ************************************************************************/

#ifndef _SYS_LMF_H_
#define _SYS_LMF_H_

#include <standards.h>
#include <sys/types.h>

/*
 *	Structure to hold version number
 */

typedef struct version {
	short v_major;
	short v_minor;
} ver_t;

/* Flag values for probe/test license */

#define LMFF_MORE   (1<<16)		/* Always allocate another unit */

/* Values returned by lmf_license_info to indicate authorisation
 * without allocation of units.
 */

#define LMF_ACTIVITY -1			/* Product is activity licensed */
#define LMF_FAMILY   -2			/* Process is member of family */

/* Length of product token and hardware id fields for use with
 * the lmf_license_info() function.
 */

#define LMF_TOKEN	32
#define LMF_HARDWARE	32

_BEGIN_CPLUSPLUS
int lmf_license_info __((char *, char *, char *, char *, int *));
int lmf_probe_license __((char *, char *, ver_t *, time_t, unsigned int));
int lmf_release_license __((char *, char *, int));
int lmf_test_license __((char *, char *, ver_t *, time_t, unsigned int));
_END_CPLUSPLUS

#endif

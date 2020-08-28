/* 
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incoporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    p_gr_sr1.c
 *    Author:       Matthew Schnee
 *    Creation Date:18-Jun-1995
 *
 *    Functionality:
 *		German code from phsort.c
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     -------------------------------------------- 
 * 001	GL		04/21/1997		BATS#357 Add/remove code for __osf__ build 
 * 002  EAB		04/29/1998 		Remove old non-functioning German code I'll
 *								also add a Bat report to really remove this
 *								and the non-function phsyl.c code.
 * 003	MGS		04/13/2000		Changes for integrated phoneme set 
 * 004  EAB     06/28/2000     	Unified Phoneme Set Changes 
 * 005 	CAB		10/18/2000		Changed copyright info
 */

#define NOCLUSTER   	0
#define CLUSTER      	1
#define CLUSTER_TRYS   	2 


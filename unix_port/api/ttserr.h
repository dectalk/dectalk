/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1993                 */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Digital Equipment         */
/*  Corporation. Possession, use, duplication or dissemination of     */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Digital Equipment Corporation.               */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Digital assumes no responsibility AT ALL for the use or           */
/*  reliability of this software.                                     */
/*                                                                    */
/*                                                                    */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */
/**********************************************************************/

/* Text To Speech API Error Messages */

#define TTSERR_NOERROR		0	// No Error
#define TTSERR_NOMEM		1	// Out Of Memory
#define TTSERR_NOMAINDIC	2	// Main Dictionary Not Found
#define TTSERR_NOUSERDIC	3	// User Dictionary Not Found
#define TTSERR_BADMAINDIC	4	// Bad Main Dictionary
#define TTSERR_BADUSERDIC	5	// Bad User Dictionary


/* VTM Overload/Underload Warning Flags
 * Note: These values only get used when VTM overload/underload
 * testing is enabled */

#define	VTM_GV_OVER			0x00080000L
#define	VTM_GV_UNDER		0x00040000L
#define	VTM_GN_OVER			0x00020000L
#define	VTM_GN_UNDER		0x00010000L
#define	VTM_G2_OVER			0x08000000L
#define	VTM_G2_UNDER		0x04000000L
#define	VTM_G3_OVER			0x02000000L
#define	VTM_G3_UNDER		0x01000000L
#define	VTM_G4_OVER			0x00800000L
#define	VTM_G4_UNDER		0x00400000L
#define	VTM_G5_OVER			0x00200000L
#define	VTM_G5_UNDER		0x00100000L

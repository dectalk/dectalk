/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1993                 */
/*  Copyright (c) SMART Modular Technologies, Inc., 1999              */
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
/**********************************************************************/
/*                                                                    */
/*  DEC STD 97 Section 4.1 requires this file.                        */
/*  Author: Bill Hallahan                                             */
/*  Date: Dec. 22, 1993                                               */
/*                                                                    */
/**********************************************************************/

  volatile char standard_notices[2048] = 
#ifdef THIRD_PARTY
"\n" \
"COPYRIGHT NOTICE                                                   \n" \
"\n" \
"@ Copyright SMART Modular Technologies, Inc., 1999. All Righhts Reserved.\n" \
"\n" \
"Unpublished rights reserved under the copyright laws of the United    \n" \
"States. Copyright is claimed in the computer program and user         \n" \
"interface thereof.                                                   \n" \
"\n" \
"Restricted Rights: Use, duplication, or disclosure by the U.S.        \n" \
"is subject to restrictions as set forth in subparagraph (c) (1) (ii)  \n" \
"of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR 52.227-14 Alt.  \n" \
"III, as applicable.                                                  \n" \
"\n" \
"This software is proprietary to and embodies the confidential         \n" \
"technology of SMART Modular Technoogies, Inc. Possession, use, or      \n" \
"copying of this software and media is authorized only pursuant to a   \n" \
"valid written license from SMART Modular Technologies, Inc. or an        \n" \
"authorized sublicensor.                                               \n" \
"The name of SMART Modular Technologies, Inc. may not be used to endorse  \n" \
"or promote products derived from this software without specific prior \n" \
"written permission. All other rights reserved.                       \n" \
"\n" \
"THIS SOFTWARE IS PROVIDED 'AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED  \n" \
"WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF      \n" \
"NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.\n" \
"Digital assumes no responsibility AT ALL for the use or reliability of\n" \
"this software.                                                       \n" \
"\n";

#else

"\n" \
"COPYRIGHT NOTICE                                                   \n" \
"\n" \
"@ Copyright SMART Modular Technologies, Inc., 1999. All Righhts Reserved.\n" \
"\n" \
"Unpublished rights reserved under the copyright laws of the United    \n" \
"States. Copyright is claimed in the computer program and user         \n" \
"interface thereof.                                                   \n" \
"\n" \
"This software is proprietary to and embodies the confidential         \n" \
"technology of SMART Modular Technoogies, Inc. Possession, use, or      \n" \
"copying of this software and media is authorized only pursuant to a   \n" \
"valid written license from SMART Modular Technologies, Inc. or an        \n" \
"authorized sublicensor.                                               \n" \
"The name of SMART Modular Technologies, Inc. may not be used to endorse  \n" \
"or promote products derived from this software without specific prior \n" \
"written permission. All other rights reserved.                       \n" \
"\n" \
"THIS SOFTWARE IS PROVIDED 'AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED  \n" \
"WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED WARRANTIES OF      \n" \
"NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.\n" \
"Digital assumes no responsibility AT ALL for the use or reliability of\n" \
"this software.                                                       \n" \
"\n";


#endif
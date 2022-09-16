#define DT_VENDOR_ID \
("Om906jj3olamTNH5p02shYZYYnaHLc>3>f>k0qXXiTyFIM4er2XrK5F@qr0Vr?xtq6L@3JX104KS")
#define SHMEMSIZE (512)
 /**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1997                 */
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


#include <windows.h>
HANDLE	ghMapObject = NULL;
LPVOID	glpvMemLicense = NULL;

// enable synthesis
void DT$OpenMem(void)
{

		char	*szMemLicense = NULL;

 		ghMapObject = CreateFileMapping( 
				(HANDLE) 0xFFFFFFFF, /* use paging file    */ 
				NULL,                /* no security attr.  */ 
				PAGE_READWRITE,      /* read/write access  */ 
				0,                   /* size: high 32-bits */ 
				SHMEMSIZE,           /* size: low 32-bits  */
				"a32DECtalkDllFileMap");


		if (ghMapObject == NULL) 
			return;  // bad error. 
		if (GetLastError() == ERROR_ALREADY_EXISTS)
			return;  // already open.

		glpvMemLicense = MapViewOfFile( 
				ghMapObject,     /* object to map view of    */ 
				FILE_MAP_WRITE, /* read/write access        */ 
				0,              /* high offset:   map from  */ 
				0,              /* low offset:    beginning */ 
				0);             /* default: map entire file */ 
		if (glpvMemLicense == NULL) 
			return; 
 
		*(PDWORD)glpvMemLicense = (DWORD)0;
		szMemLicense = (char *)(glpvMemLicense);
		strcpy(&szMemLicense[4],DT_VENDOR_ID);

}
		
// disable synthesis
void DT$CloseMem(void)
{
	if (glpvMemLicense)
		UnmapViewOfFile(glpvMemLicense);
	if (ghMapObject)
		CloseHandle(ghMapObject);
}
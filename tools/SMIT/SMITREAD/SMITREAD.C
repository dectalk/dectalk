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

// read the shared memory section..
 
#include <conio.h> // vor kbhit, getch
#include <stdio.h>
#include <windows.h>
#include "coop.h"


extern  unsigned int decryptString(const unsigned char *input,unsigned long key,unsigned char *string);
int TryToReadMemory(void);

int main()
{
	while (1)
	{
		if (!kbhit())
			Sleep(1000);
		if (kbhit())
		  if (getch() == 'x')
			break;
		// check for memory..
		TryToReadMemory();
	}
return(0);

}




int TryToReadMemory(void)
{
		char szEncryptedString[1024]="";
		char szVendorString[1024]="";
		char	*szMemLicense = NULL;
		HANDLE	hMapObject=NULL;
		BOOL	bIsUp = FALSE;
		LPVOID	lpvMemLicense=NULL;
		unsigned int		uiResult = 0;

 		hMapObject = CreateFileMapping( 
				(HANDLE) 0xFFFFFFFF, /* use paging file    */ 
				NULL,                /* no security attr.  */ 
				PAGE_READWRITE,      /* read/write access  */ 
				0,                   /* size: high 32-bits */ 
				512,           /* size: low 32-bits  */
				"a32DECtalkDllFileMap");


		if (hMapObject == NULL) 
		{
			printf(" ? CreateFileMapping failed?\n");
			return 1;  // bad error. 
		}
		if (GetLastError() == ERROR_ALREADY_EXISTS)
			bIsUp = TRUE;
			
		if ((bIsUp) && (hMapObject != NULL)) 
		{
			lpvMemLicense = MapViewOfFile( 
				hMapObject,     /* object to map view of    */ 
				FILE_MAP_WRITE, /* read/write access        */ 
				0,              /* high offset:   map from  */ 
				0,              /* low offset:    beginning */ 
				0);             /* default: map entire file */ 
			if (lpvMemLicense == NULL) 
			{
				printf("failed to map.\n");
			}
			else
			{
				printf("License Count is %lu\n",*(PDWORD)lpvMemLicense);
				szMemLicense = (char *)(lpvMemLicense);
				strcpy(szEncryptedString,&szMemLicense[4]);
				uiResult = decryptString(szEncryptedString,
					DEFAULT_ACCESS32_KEY,
					szVendorString);
				if (uiResult)
				{
					// successful..
					printf("vendor string:\n%s\n",szVendorString);
				}
				else
				{
					printf("decrypt failed.\n");
				}
				 
			}
			// release everything
			if (lpvMemLicense)
				UnmapViewOfFile(lpvMemLicense);
			if (hMapObject)
				CloseHandle(hMapObject);
			

		}
		else
		{
			printf(" section not up yet.\n");
		}
 		// release everything
		if (lpvMemLicense)
			UnmapViewOfFile(lpvMemLicense);
		if (hMapObject)
			CloseHandle(hMapObject);


}
/**********************************************************************/
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
/**********************************************************************/
/* this is the generator for the SMIT initialization file that each   */
/* Access32 licensee uses to unlock the engine.                       */
/*                                                                    */
/**********************************************************************/
//
// usage:
// SMITGEN -v xx -s "string" -k deckey
//
// where:
// xx			is the two-letter identifier of the licensee, and
//				is used to generate the filename and part of the string.
// string		is the unique text used to identify the engine
// deckey		is the key used to encrypt the string.
//				WARNING: normally, this would not be specified and the 
//				hard-coded key would be used instead.
//
// this file needs to be linked with the encryption generator as well.
//
// the file SMIT.C contains the invariant parts of the unlocking code, and
// is copied to the output as part of this adventure.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <windows.h>
#include	"coop.h"


void encryptString(
	const unsigned char *string, unsigned long key, unsigned char *output);

#define MAXBASEVENDORSTRING	(64)
#define MAXVENDORSTRING	((MAXBASEVENDORSTRING*3)+64)
#define FILEMAPSIZE		(512)
#if	(MAXVENDORSTRING>(FILEMAPSIZE/2))
#error Shared memory section size error!
#endif //

#define VENDORIDSIZE	(3)




// global info..
char szVendorId[VENDORIDSIZE]="";
char szBaseString[MAXBASEVENDORSTRING+1] = "";
char szVendorString[MAXVENDORSTRING+1] = "";
char szEncryptedString[MAXVENDORSTRING+1] = "";

char szFileName[VENDORIDSIZE+10]="SMIT";
ULONG ulKey=0;										 

FILE *fpInFile=NULL;
FILE *fpOutFile=NULL;

int	main(int argc, char *argv[])
{
	int argp = 0;
	char szInLine[512]="";  // for copying the prototype file

	// parse the args and fill in the blanks..
	for (argp=1; argp<argc; argp++)
	{
		if (argv[argp][0] != '-')
		{
			printf("can't parse switch %s\n",argv[argp]);
			exit(-1);
		}
		switch (argv[argp][1])
		{
		case 'V':
		case 'v':
			// the two-letter vendor identifier
			argp++;
			if (argp>=argc)
			{
				printf("switch missing argument: %s\n",argv[--argp]);
				exit(-3);
			}
			if (strlen(argv[argp]) != VENDORIDSIZE-1)
			{
				printf("arg to -v must be 2 characters!\n");
				exit(-4);
			}

			strcpy(szVendorId,argv[argp]);
			// upper-case that..
			_strupr(szVendorId);

			break;
		case 'S':
		case 's':
			// the long vendor-specific ident text
			argp++;
			if (argp>=argc)
			{
				printf("switch missing argument: %s\n",argv[--argp]);
				exit(-3);
			}

			// put it in the global, length-limited..
			strncpy(szBaseString,argv[argp],MAXBASEVENDORSTRING);
			szBaseString[MAXVENDORSTRING] = '\0'; // for safety
			// see if we had to truncate it.. 
			if (strlen(argv[argp]) != strlen(szBaseString))
			{
				printf("!*** WARNING ***!\n !*** Vendor ID string was truncated!\n");
			}
			
			break;
		case 'K':
		case 'k':
			// the decimal key..
			argp++;
			if (argp>=argc)
			{
				printf("switch missing argument: %s\n",argv[--argp]);
				exit(-3);
			}
			// pull it in..
			ulKey = atol(argp[argv]);
			if (ulKey==0)
			{
				printf("Invalid key: %s\n",argp[argv]);
				exit(-5);
			}

			break;
		default:
			printf("unknown switch %s\n",argv[argp]);
			exit (-2);

		}// switch arg
	} // for args

	// pick up the default key, if not specified
	if (ulKey==0)
		ulKey = DEFAULT_ACCESS32_KEY;

	// piece together the output file name..
	strcat(szFileName,szVendorId);
	strcat(szFileName,".C");
	printf("-i- output  file name is %s\n", szFileName);
	// open the output file..
	fpOutFile = fopen(szFileName,"w");
	if (fpOutFile == NULL)
	{
		printf("failed to open output file %s\n",szFileName);
		exit(-6);
	}
	// open the input prototype file..
	fpInFile = fopen("SMIT.C","r");
	if (fpInFile == NULL)
	{
		printf("failed to open input (proto) file\n");
		fclose(fpOutFile);
		exit(-7);
	}
	

	// construct the identifier string..
	strcpy(szVendorString,szVendorId);
	strcat(szVendorString,"|!|");
	strcat(szVendorString,szBaseString);
	strcat(szVendorString,"|!|");
	strcat(szVendorString,__DATE__);
	strcat(szVendorString,"|");
	strcat(szVendorString,__TIME__);
	strcat(szVendorString,"|");

	// put the end flag on
	strcat(szVendorString,"|");

	//show us what the string looks like..
	printf("[%s]\n",szVendorString);

	// encrypt the string..
	encryptString(szVendorString, ulKey, szEncryptedString);
	printf("[%s]",szEncryptedString);
	printf("length of VendorString=%d, length of EncryptedString=%d\n",
		strlen(szVendorString), strlen(szEncryptedString));

	// create the file that the vendor gets..
	fprintf(fpOutFile,"#define DT_VENDOR_ID \\\n(\"%s\")\n",szEncryptedString);
	fprintf(fpOutFile,"#define SHMEMSIZE (%d)\n",FILEMAPSIZE);
	// we copy this from the prototype file SMIT.C
	while (fgets(szInLine,511,fpInFile))
		fprintf(fpOutFile,"%s",szInLine);





	fclose(fpOutFile);
	return (0);
}// main()


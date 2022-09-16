#include <stdio.h>
#include <windows.h>

#define LICENINC_C
#include "coop.h"
#undef  LICENINC_C

//Command line is CL /DLICENSE_INCREMENT=<number> filename.c

extern  void encryptString(const unsigned char *string,unsigned long key,unsigned char *output);
extern  unsigned int decryptString(const unsigned char *input,unsigned long key,unsigned char *string);

/*
MOVED TO COOP.H
--

//MVP: If one wants to change the License key location to another ,change
// the string "gszLicenseKey" and to change value name to another, change
// "gszLicenseKeyValueName".

#ifdef WILLOWPOND
CHAR gszLicenseKey[] = 
		   "Software\\DigitalEquipmentCorporation\\wpDECtalk\\4.40";
#else
CHAR gszLicenseKey[] = 
		   "Software\\DigitalEquipmentCorporation\\DECtalk\\4.40";
#endif // Willowpond

CHAR gszLicenseKeyValueName[] = "Licenses";

--
MOVED TO COOP.H
ncs 07jul97
*/

#define ENCODED_STR_LENGTH     134    //2times Input_Str_Len +6 Chars
									  // MAX Input String is 64 Chars. 

int main()
{

	int nLicenseIncrement = LICENSE_INCREMENT;
	int nCurLicenses,nUpdatedLicenseCount;
	HKEY hKeyLicense = NULL;
	CHAR szCurLicenses[ENCODED_STR_LENGTH];
	CHAR szOutString[ENCODED_STR_LENGTH];
	CHAR szUpdatedLicenseCount[35];   // _ltoa stores result up to 33 bytes.
	DWORD dwType,cbData;
	// The encrypt key is in coop.h -- ncs 10jul97
	ULONG ulEncryptKey = LICENSE_KEY;  // Some number
#ifdef LDEBUG
	printf("The value of License Increment is %d\n",nLicenseIncrement);
#endif
	if ( RegOpenKeyEx( HKEY_LOCAL_MACHINE,
			 gszLicenseKey,
			 0,
			 KEY_QUERY_VALUE | KEY_SET_VALUE,
			 &hKeyLicense ) != ERROR_SUCCESS )
	{
#ifdef LDEBUG
		printf("The DECtalk License Key is not found\n");
#endif
		exit(1);
	}
	else
	{
		cbData = ENCODED_STR_LENGTH;
		if ( RegQueryValueEx( hKeyLicense,
			  gszLicenseKeyValueName,
			  NULL,
			  &dwType,
			  (LPBYTE)szCurLicenses,
			  &cbData ) != ERROR_SUCCESS )
		{
#ifdef LDEBUG

			printf("Error retrieving the License Info\n");
#endif
			RegCloseKey(hKeyLicense);
			exit(1);
		}       
	}

	if(!decryptString(szCurLicenses,ulEncryptKey,szOutString))
	{
#ifdef LDEBUG

		printf("Couldn't decrypt the License information\n");
#endif        
		RegCloseKey(hKeyLicense);
		exit(1);
	}
	
	nCurLicenses = atol(szOutString);
#ifdef LDEBUG

	printf("The Current number of DECtalk licenses is %d\n",nCurLicenses);
#endif
	nUpdatedLicenseCount = nCurLicenses + LICENSE_INCREMENT;
#ifdef LDEBUG

	printf("The Updated number of DECtalk licenses is %d\n",nUpdatedLicenseCount);
#endif    
	_ltoa(nUpdatedLicenseCount,szUpdatedLicenseCount,10);
	
	encryptString(szUpdatedLicenseCount,ulEncryptKey,szOutString);
#ifdef LDEBUG

	printf("The Encrypted Updated number of DECtalk licenses is %s\n",szOutString);
#endif    

	/****************************************************************/
	/*  Write the "License" value in the registry.                 */
	/****************************************************************/

	if ( RegSetValueEx( hKeyLicense,
					  gszLicenseKeyValueName,
					  0,
					  REG_SZ,
					  (CONST BYTE *)szOutString,
					  strlen(szOutString)+1) != ERROR_SUCCESS )
	{
#ifdef LDEBUG

		printf( "Error in writing No Of Licenses value in to registry\n");
#endif        
		RegCloseKey( hKeyLicense );
		exit(1);
	}

	RegCloseKey( hKeyLicense );

	// Delete the executable.It should be used only once by the customer.
	// It works only on Windows'95.
	// On Windows'NT send a Batch file to delete this file,after
	// executing it.
//  DeleteFile("liceninc.exe");

	return 0;
}
/*******************************end of liceninc.c******************************/

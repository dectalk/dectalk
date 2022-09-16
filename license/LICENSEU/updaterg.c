//File name: UpdateRg.c
//

#include <windows.h>
#include "license.h"

// tek 08nov96 WP keys are now in a different place.
// szLicenseKey[] moved to coop.h -- 28apr97 ncs
#define UPDATERG_C
#include "coop.h"
#undef UPDATERG_C

int UpdateLicenseInfo(const unsigned char *szLicenses)
{
   HKEY hKeyLicense = NULL;
   CHAR szValueName[] = "Licenses";

   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
                szLicenseKey,
                0,
                KEY_SET_VALUE,
                &hKeyLicense)!= ERROR_SUCCESS)
      
       return LICENSE_KEY_REG_OPEN_ERROR;

   if(RegSetValueEx(hKeyLicense,
                 szValueName,
                 0,
                 REG_SZ,
                 szLicenses,
                 strlen(szLicenses)+1
                 )!= ERROR_SUCCESS)
      return LICENSE_KEY_REG_UPDATE_ERROR;

   return TRUE;
}

int UpdateLicensePassword(const unsigned char *szLicenses)
{
   HKEY hKeyLicense = NULL;
   CHAR szValueName[] = "LicUpdPwd";
   DWORD cbData = strlen(szLicenses) +1;

   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
                szLicenseKey,
                0,
                KEY_SET_VALUE,
                &hKeyLicense)!= ERROR_SUCCESS)
      
       return LICENSE_KEY_REG_OPEN_ERROR;

   if(RegSetValueEx(hKeyLicense,
                 szValueName,
                 0,
                 REG_SZ,
                 szLicenses,
                 cbData
                 )!= ERROR_SUCCESS)
      return LICENSE_KEY_REG_UPDATE_ERROR;

   return TRUE;
}

int GetLicensePassword(unsigned char *szLicenses)
{
   HKEY hKeyLicense = NULL;
   CHAR szValueName[] = "LicUpdPwd";
   DWORD dwDataType,cbData = MAX_STR;

   if(RegOpenKeyEx(HKEY_LOCAL_MACHINE,
                szLicenseKey,
                0,
                KEY_QUERY_VALUE,
                &hKeyLicense)!= ERROR_SUCCESS)
      
       return LICENSE_KEY_REG_OPEN_ERROR;

   if(RegQueryValueEx(hKeyLicense,
                 szValueName,
                 0,
                 &dwDataType,
                 szLicenses,
                 &cbData
                 )!= ERROR_SUCCESS)
      return LICENSE_KEY_REG_QUERY_ERROR;

   return TRUE;
}

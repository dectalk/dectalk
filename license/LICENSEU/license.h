// Include file :License.h
#include "coop.h"
#define MAX_DLG_STR 64
#define MAX_STR 134
// Move to coop.h 11/21/96 cjl
//#define LICENSE_KEY 31125

#define LICENSE_KEY_REG_OPEN_ERROR    101
#define LICENSE_KEY_REG_UPDATE_ERROR  102
#define LICENSE_KEY_REG_QUERY_ERROR   103

extern CHAR szOutString[134];
#ifdef __cplusplus
extern "C"
{

extern  void encryptString(const unsigned char *,unsigned long ,unsigned char* );
extern  unsigned int decryptString(const unsigned char *,unsigned long ,unsigned char *);
extern UpdateLicenseInfo(const unsigned char *);
extern UpdateLicensePassword(const unsigned char *);
extern GetLicensePassword(unsigned char *);

}
#endif
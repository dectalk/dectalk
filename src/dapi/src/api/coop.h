/*********************************************************************   	*/
/*********************************************************************   	*/
/*                                                                       	*/
/*						COPYRIGHT NOTICE                                    */
/*                                                                       	*/
/*  Copyright © 2002 Fonix Corporation. All rights reserved.				*/
/*  Copyright © 2000, 2001 Force Computers, Inc., a Solectron Company. All rights reserved.	*/
/*  © SMART Modular Technologies 1999. All rights reserved.              	*/
/*  Copyright (c) Digital Equipment Corporation, 1996, 1998, 1999        	*/
/*																			*/
/*  All Rights reserved. Unpublished rights reserved under the           	*/
/*  copyright laws of the United States. Copyright is claimed in      		*/
/*  the computer program and user interface thereof.                  		*/
/*                                                                    		*/
/*  The software contained on this media is proprietary to and        		*/
/*  embodies the confidential technology of Fonix Coporation				*/
/*  Possession, use, duplication or dissemination of                  		*/
/*  the software and media is authorized only pursuant to a valid     		*/
/*  written license from FONIX computers Inc.                         		*/
/*                                                                    		*/
/*  The name of Fonix Coporation may not be used to               			*/
/*  endorse or promote products derived from this software without    		*/
/*  specific prior written permission. All other rights reserved.     		*/
/*                                                                    		*/
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      		*/
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED       		*/
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        		*/
/*  FOR A PARTICULAR PURPOSE.                                         		*/
/*  Fonix assumes no responsibility AT ALL for the use or           		*/
/*  reliability of this software.                                     		*/
/*                                                                    		*/
/*                                                                    		*/
/* +----------------------------------------------------------------+ 		*/
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | 		*/
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | 		*/
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| 		*/
/* |                                                                | 		*/
/* +----------------------------------------------------------------+ 		*/
/*                                                                    		*/
/*********************************************************************		*/
/*********************************************************************		*/
/*********************************************************************		*/
/*                                                                    		*/
/*  Text-To-Speech Co Operative Key File                              		*/
/*  Author: Carl Leeber                                               		*/
/*  Date:   November 19, 1996                                         		*/
/*  Name:   COOP.H                                                    		*/
/*                                                                    		*/
/*  Abstract:                                                         		*/
/*                                                                    		*/
/*         This file contains a co operative license key.             		*/
/*                                                                    		*/
/*********************************************************************		*/
/*********************************************************************		*/
/* revision history
 * 001	19nov96	cjl		include license key once!
 * 002	21nov96 cjl     inlcude version once!
 * 003	22nov96 cjl     move versions defines here from tts.h
 * 004	03dec96 cjl     Change version to decimal.
 * 005	18dec96 ksb     Change from build 102 to 103.. (T001 was 102)
 *						103 supports highlighting in speak
 * 006	13jan97 ksb     Change from build 103 to 104..
 *						104 now has reserved function and
 *						_debug feedback for autotuning
 * 007	20jan97 cjl     Change PROD_BUILD_TYPE to B,
 *						PROD_BUILD_VERSION to 002 and
 *						DTALK_STR_VERSION for freeze.
 * 008	17feb97 cjl     Change PROD_BUILD_TYPE to B,
 *						PROD_BUILD_VERSION to 003 and
 *                      DTALK_STR_VERSION for freeze.
 * 009	10mar97 cjl     Change PROD_BUILD_TYPE to B,
 *                      PROD_BUILD_VERSION to 004 and
 *                      DTALK_STR_VERSION for freeze.
 * 010	19mar97 ncs     Added in WillowPond License Key here.
 * 011	28apr97 ncs     Moved szLicenseKey here from
 *						\licenseu\updaterg.c
 * 012	01may97 tek     Licensing changes.
 * 013	06may97 cjl     Change PROD_BUILD_TYPE to B,
 *						PROD_BUILD_VERSION to 005 and
 *                      DTALK_STR_VERSION for freeze.
 * 014	23jun97 cjl     Change PROD_BUILD_VERSION to 006 and
 *						DTALK_STR_VERSION for freeze.
 * 015	21jul97	cjl		ifdef version info based on ACCESS32.
 * 016	03jul97 ncs     Changed REG for MULTI-LANG project
 *						Also reordered the #ifs and etc
 *						to be more neat and readable
 * 017	25jul97 cjl     Change PROD_BUILD_VERSION to 007 and
 *						DTALK_STR_VERSION for freeze and
 *						PROD_BUILD_TYPE to R for release.
 * 018	28jul97	cjl		Change Build keys for all products.
 * 019	01aug97 ncs     Syncing in with the new install shield scrips
 * 020	18aug97 cjl     Changed 4.4a to just 4.4 for 1st SSB release.
 * 021	20aug97 ncs     Added in TTSSRV_C to enable TTSSRV.EXE to build.
 * 022	28aug97 ksb     Merged with ML code
 * 023	17sep97 ksb+ncs Added DTALK_DBG_VERSION Debug Tester for Version.
 * 024	19sep97 tek     SMIT, t007a defs for access32
 * 025	25sep97 cjl     Change revision to R008, UNIX/SMIT release.
 * 026	25sep97 dr/gl   add abbreviation reference and UK_english support
 * 027	29sep97 cjl     Change revision to R009, UK/NWSNOAA release.
 * 028	03oct97 gl      Add NWSNOAA dictionary entry name.
 * 029	10nov97 cjl     Change revision to R010, NWSNOAA female voice release.
 * 030	26nov97 cjl     Change revision to R011, NWSNOAA male voices & SAPI (HJ).
 * 031	05dec97 cjl     Change revision to R012, NWSNOAA Final.
 * 032	23dec97 cjl     Change revision to B001, SAPI\UK\V4.50.
 * 033	13jan98 cjl     Change build to 107 per ksb.
 * 034	26jan98 cjl     Change to B002.
 * 035	02feb98 cjl     Change to B003.
 * 036	10mar98 cjl     Change to R004 and new registry/keys
 * 037	22may98 cjl     Change to 4.51 and R005.
 * 038	20aug98 cjl     Change to R006.
 * 039	30sep98	mfg		Changed LATIN_AMERICAN to SPANISH_LA to pick up correct dictionary
 * 040	28oct98	cjl		Change to 4.60 and B001.
 * 041	06jan99	mfg		Added Windows CE registry support
 * 042	27jan99	cjl     Change R006 to B002
 * 043	08feb99	gl		Separate NWSNOAA to NWS_US and NWS_LA 
 * 044	31mar99 cjl     Change B002 to R003
 * 045	10jun99 cjl     Change R003 to R004
 * 046	02jul99 cjl     Change R004 to R005
 * 047	22aug99 MGS     Changed to SMART and simplified
 * 048	22oct99 mgs     Change R005 to R006
 * 049	31oct99 mfg		Fixed the user dictionary registry entry for Windows CE
 * 050 04nov99	mgs		Fix for UNIX
 * 051 17feb00	mfg		defined CURRENT_USER_PRODUCT from v4.60 to 4.60 to find the user dictionary
 * 052 13mar00  mfg     Change to B009
 * 053 05jun00	mfg		Changed to P010
 * 054 20jul00	chj		French added
 * 055 08aug00	cab		Changed DTALK_STR_VERSION to RO11 for help to display right version number.
 * 056 15aug00	cab		Changed to R011
 * 057 15sep00	cab		1. Changed to B002
 *						2. Fix error in French registry entry by adding a Quote
 * 058 13oct00	cab		Changed to version 4.61 and to B002
 * 059 13dec00	cab		Added new registry entries for sapi5 to fix bug.
 * 060 14dec00	cab		Changed to R002
 * 061 03jan01	cab		Added extra letter to value DTALK_STR_VERSION for either release(r) or beta(b)
 * 062 26mar01	cab		Updated copyright info
 * 063 27mar01	cab		Fixed SAPI string error
 * 064 09may01	mgs		Access32 Merge BATS#972
 * 065 29may01	cab		Changed to version 5.00 B001 and Copyright info
 * 066 07may01	cab		Changed CURRENT_USER_PRODUCT to NOT WINCE
 * 067 02aug01  cab		Added coment to last section
 * 068 19sep01	cab		Updated  define section of ISHIELD_DEF
 * 069 04apr02	cab		Fixed Bats 987
 * 070 10jul02	mfg		Merged into code changes needed for the Mitsubishi CE/SH4 Project
 * 071 05aug02	cab		Changed version
 *						Changed caused by texttospeechstartupexfonix()
 * 072 15aug02	cab		Updated info
 * 073 19sep02	mfg		Changed back to the old dictionary defines szDict etc for WinCE
 * 074 13feb02  mfg		Updated release Revision to B002
 * 075 11jun03	mfg		made the version number switch between HLYSN or not
 */

/***********************************************************************************/
/* HERE IS COOP_H ******************************************************************/
/***********************************************************************************/

#ifndef COOP_H
#define COOP_H

#ifdef TYPING_MODE
#ifndef ACCESS32
#define ACCESS32
#endif	// ACCESS32
#endif	// TYPING_MODE

#if (defined CUP28PROJECT) || (defined SMARTMEDIA)
#define NOWIN
#endif

/***********************************************************************************/
/* License Keys ********************************************************************/
/* Needs to be a prime number */
/***********************************************************************************/

#ifdef ACI_LICENSE
// ACI License Key
//#define LICENSE_KEY 20023
// 28jul97              cjl          Change Build keys for all products.
//#define LICENSE_KEY 31951
//10mar98 
//#define LICENSE_KEY 29247
//26jan99 Active  ***************************
#define LICENSE_KEY 24547
#else // ACI_LICENSE

#ifdef ACCESS32 //tek 15sep97 SMIT licensing
#define DEFAULT_ACCESS32_KEY (11119)
#endif //ACCESS32


#ifdef WILLOWPOND
// Willowpond License Key
//#define LICENSE_KEY 31129
// 28jul97              cjl          Change Build keys for all products.
//#define LICENSE_KEY 31453
//10mar98 
//#define LICENSE_KEY 29289
//26jan99 Active  ***************************
#define LICENSE_KEY 24103
#else // WILLOWPOND

// DECtalk License Key
//#define LICENSE_KEY 31125
// 28jul97              cjl          Change Build keys for all products.
//#define LICENSE_KEY 31237
//10mar98 
//#define LICENSE_KEY 29323
//26jan99 Active  ***************************
#define LICENSE_KEY 24851

#endif // WILLOWPOND
#endif // ACI_LICENSE

#ifdef _DEBUG
#define DTALK_DBG_VERSION               1                       // NCS - DBG Version
#else
#define DTALK_DBG_VERSION               0                       // NCS - DBG Version
#endif	// _DEBUG

/***********************************************************************************/
/* DECtalk TTSVersion Data Information: 03/10/1998
 *
 *                                                      Bit Map
 *                                         33222222222211111111110000000000
 *                                         10987654321098765432109876543210
 * DTALK_DBG_VERSION                       x
 * DTALK_MAJ_VERSION                        xxxxxxx
 * DTALK_MIN_VERSION                               xxxxxxxx
 * DLL_MAJ_VERSION                                         xxxxxxxx
 * DLL_MIN_VERSION                                                 xxxxxxxx
 */

/***********************************************************************************/
/* DECtalk Version Numbers *********************************************************/
/***********************************************************************************/
#ifdef HLSYN
#define VERSION					"5.00"							// CAB - Moved here
#else
#define VERSION					"4.62"
#endif

#ifdef HLSYN
#define DTALK_MAJ_VERSION       5                               // KSB - DTALK Version Check-dec
#define DTALK_MIN_VERSION       0                               // KSB - DTALK Version Check-dec
//#define DTALK_MAJ_VERSION_CHAR  DTALK_MAJ_VERSION               // CJL - DTALK Version Check-char
//#define DTALK_MIN_VERSION_CHAR  0                               // CJL - DTALK Version Check-char
#else
#define DTALK_MAJ_VERSION       4                               // KSB - DTALK Version Check-dec
#define DTALK_MIN_VERSION       62                               // KSB - DTALK Version Check-dec
#endif

#define DLL_MAJ_VERSION         3                               // KSB - DLL Version Check
#define DLL_MIN_VERSION         0                               // KSB - DLL Version Check


/* ******************* NOT USED ******************************************** */
#if 0
#ifdef	ACCESS32
#define DLL_MAJ_VERSION         2                               // KSB - DLL Version Check
#define DLL_MIN_VERSION         3                               // KSB - DLL Version Check
#else
#define DLL_MAJ_VERSION         1                               // KSB - DLL Version Check
#define DLL_MIN_VERSION         9                               // KSB - DLL Version Check
#endif //Access32
#endif
/* ************************************************************************* */

#define RELEASE					"B004"
//#define PRODUCT_BUILD_TYPE      "R"                               // CJL - Production Build Type B or R
//#define PRODUCT_BUILD_VERSION   002                               // CJL - Production Build Version xxx

#ifdef	ACCESS32 //Identify as ACCESS32
#ifndef DEMO    // DTDemo uses similar, but D006
#define DTALK_STR_VERSION "v" VERSION " " RELEASE " NORMAL ACCESS32"            // KSB - Version String
#else
#define DTALK_STR_VERSION "v" VERSION " D" RELEASE " NORMAL ACCESS32"		   // KSB - Version String (Req by Anne)
#endif	// DEMO 

#else	//Otherwise it is NORMAL
#ifndef DEMO    // DTDemo uses similar, but D006
#define DTALK_STR_VERSION       "v" VERSION " " RELEASE " NORMAL"              // KSB - Version String
#else
#define DTALK_STR_VERSION       "v" VERSION " D" RELEASE " NORMAL"              // KSB - Version String (Req by Anne)
#endif	//DEMO
#endif //of ACCESS32

#endif /* COOP_H */

/***********************************************************************************/
/* End of COOP_H *******************************************************************/
/***********************************************************************************/


/***********************************************************************************/
/* Registry Entries ****************************************************************/
/***********************************************************************************/

/***********************************************************************************/
/* HERE IS LICENINC_C **************************************************************/
/* Information about the location of the license key to be incremented *************/
/***********************************************************************************/


#ifdef ACI_LICENCE

#define COMPANY "ManufacturersName"
#define PRODUCT "DECtalk"
#define CURRENT_USER_PRODUCT "DECtalkv" VERSION

#elif defined WILLOWPOND

#define COMPANY "DECtalk Software"
#define PRODUCT "wpDECtalk"
#define CURRENT_USER_PRODUCT "wpDECtalkv" VERSION
#elif defined GWMICRO

#define COMPANY "GW Micro, Inc."
#define PRODUCT "DECtalk-OEM"
#define CURRENT_USER_PRODUCT "DECtalk\\" VERSION


#else

#define COMPANY "DECtalk Software"
#define PRODUCT "DECtalk"

#ifndef UNDER_CE
#define CURRENT_USER_PRODUCT "DECtalk\\" VERSION
#endif

#endif	// ACI_LICENCE


#ifdef ENGLISH_US

#define DECTALK_LANGUAGE "US"

#elif defined (ENGLISH_UK)
#define DECTALK_LANGUAGE  "UK"
#elif defined SPANISH
#ifdef SPANISH_LA
#define DECTALK_LANGUAGE "LA"
#else
#define DECTALK_LANGUAGE "SP"
#endif
#elif defined GERMAN
#define DECTALK_LANGUAGE "GR"
#elif FRENCH
#define DECTALK_LANGUAGE "FR"
#endif // LANGUAGES 

#ifdef LICENINC_C

CHAR gszLicenseKeyValueName[] = "Licenses";

#ifdef SAPI5DECTALK
CHAR gszLicenseKey[] = 
      "Software\\" COMPANY "\\" PRODUCT  "\\sapi5";
#else
CHAR gszLicenseKey[] = 
      "Software\\" COMPANY "\\" PRODUCT  "\\" VERSION;
#endif // SAPI5DECTALK
#endif // LICENINC_C

/***********************************************************************************/
/* HERE IS LSWMAIN_DIC *************************************************************/
/* Information about the location of the dictionary files **************************/
/***********************************************************************************/

#if defined (LSWMAIN_DIC) || defined (SPEAK_C) || defined (WINDIC_C) || defined (TTSSRV_C)
#ifndef DTDEMO

#ifdef WINDIC_C_STATIC
#ifdef UNDER_CE
LPTSTR szLocalMachineDECtalk;
#else
LPSTR szLocalMachineDECtalk;
#endif

#else

#ifdef UNDER_CE

LPTSTR szLocalMachineDECtalk =
	TEXT("SOFTWARE\\") TEXT(COMPANY) TEXT("\\") TEXT(PRODUCT) TEXT("\\") TEXT(VERSION) TEXT("\\") TEXT(DECTALK_LANGUAGE);

LPTSTR szCurrentUsersDECtalk =
    TEXT("Software\\") TEXT(COMPANY) TEXT("\\") TEXT(PRODUCT) TEXT("\\") TEXT(VERSION) TEXT("\\") TEXT(DECTALK_LANGUAGE);


#else //UNDER_CE 
#ifdef SAPI5DECTALK
LPSTR szLocalMachineDECtalk =
	"SOFTWARE\\" COMPANY "\\" PRODUCT "\\sapi5\\" DECTALK_LANGUAGE;
LPSTR szCurrentUsersDECtalk =
    "Software\\" COMPANY "\\" CURRENT_USER_PRODUCT "\\sapi5\\" DECTALK_LANGUAGE;
#else

LPSTR szLocalMachineDECtalk =
	"SOFTWARE\\" COMPANY "\\" PRODUCT "\\" VERSION "\\" DECTALK_LANGUAGE;

LPSTR szCurrentUsersDECtalk =
    "Software\\" COMPANY "\\" CURRENT_USER_PRODUCT "\\" DECTALK_LANGUAGE;
#endif // SAPI5DECTALK
#endif //UNDER_CE


/* GL 09/25/1997 add abbreviation dict entry and UK_english support */
/* GL 11/03/1997 add NWSNOAA dictionary entry */
/* CAB 08/07/2002 Added for TTSStarupEXFonix() */
LPSTR szMainDictDef = "DTALK_" DECTALK_LANGUAGE ".DIC";
LPSTR szUserDictDef = "USER_" DECTALK_LANGUAGE ".DIC";
LPSTR szAbbrDictDef = "ABBR_" DECTALK_LANGUAGE ".DIC";
LPSTR szForeignDictDef = "DTALK_FL_" DECTALK_LANGUAGE ".DIC";

#ifdef GERMAN	// Bats 987 12/03/01
#define FOREIGNDICT_DTDIC_LOG
#endif /* GERMAN */

#endif /* WINDIC_C_STATIC */
#endif /* !DTDEMO */
#endif /* LSWMAIN_DIC or SPEAK_C or WINDIC_C */


/***********************************************************************************/
/* HERE IS SPEAK_C *****************************************************************/
/* Location of the SPEAK application ***********************************************/
/***********************************************************************************/

#ifdef SPEAK_C
#ifndef DEMO

LPSTR szCurrentUsersSpeak =
    "Software\\" COMPANY "\\" PRODUCT "\\" VERSION "\\Applications\\Speak\\" DECTALK_LANGUAGE;


#endif /* DEMO    */
#endif /* SPEAK_C */


/***********************************************************************************/
/* HERE IS TTSSRV_C ****************************************************************/
/* Location of the TTSSRV_C application ********************************************/
/***********************************************************************************/

#ifdef TTSSRV_C
	

LPSTR szCurrentUsersTTSsrv =
  "Software\\" COMPANY "\\" PRODUCT "\\Applications\\TTSsrv";

#endif

/***********************************************************************************/
/* HERE IS UPDATERG_C **************************************************************/
/* Information about the location of the encrypted license key *********************/
/***********************************************************************************/

#ifdef UPDATERG_C

#ifdef UNDER_CE
TCHAR szLicenseKey[] = 
      TEXT("Software\\") TEXT(COMPANY) TEXT("\\") TEXT(PRODUCT) TEXT("\\") TEXT(VERSION);

#else	// UNDER_CE
#ifdef SAPI5DECTALK
CHAR szLicenseKey[] = 
      "Software\\" COMPANY "\\" PRODUCT "\\sapi5";
#else
CHAR szLicenseKey[] = 
      "Software\\" COMPANY "\\" PRODUCT "\\" VERSION;
#endif //SAPI5DECTALK
#endif // UNDER_CE
#endif /* UPDATERG_C  */


/***********************************************************************************/
/* HERE IS WINDIC_C ****************************************************************/
/* Location of the WINDIC registry keys ********************************************/
/***********************************************************************************/

#ifdef WINDIC_C


LPSTR szCurrentUsersWindic =
  "Software\\" COMPANY "\\" PRODUCT "\\Applications\\Windic";

#endif /* WINDIC_C */


/***********************************************************************************/
/* End of Registry Entries *********************************************************/
/***********************************************************************************/

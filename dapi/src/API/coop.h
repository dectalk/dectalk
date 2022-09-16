/*********************************************************************   	*/
/*********************************************************************   	*/
/*                                                                       	*/
/*  COPYRIGHT NOTICE                                                     	*/
/*                                                                       	*/
/*  Copyright (c) Digital Equipment Corporation, 1996, 1998, 1999        	*/
/*  © SMART Modular Technologies 1999. All rights reserved.              	*/
/*  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.	*/
/*																			*/
/*  All Rights reserved. Unpublished rights reserved under the           	*/
/*  copyright laws of the United States. Copyright is claimed in      		*/
/*  the computer program and user interface thereof.                  		*/
/*                                                                    		*/
/*  The software contained on this media is proprietary to and        		*/
/*  embodies the confidential technology of FORCE Computers Inc.      		*/
/*  Possession, use, duplication or dissemination of                  		*/
/*  the software and media is authorized only pursuant to a valid     		*/
/*  written license from FORCE computers Inc.                         		*/
/*                                                                    		*/
/*  The name of FORCE Computers Inc. may not be used to               		*/
/*  endorse or promote products derived from this software without    		*/
/*  specific prior written permission. All other rights reserved.     		*/
/*                                                                    		*/
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      		*/
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED       		*/
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        		*/
/*  FOR A PARTICULAR PURPOSE.                                         		*/
/*  Digital assumes no responsibility AT ALL for the use or           		*/
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
 * 19nov96      cjl		include license key once!
 * 21nov96      cjl     inlcude version once!
 * 22nov96      cjl     move versions defines here from tts.h
 * 03dec96      cjl     Change version to decimal.
 * 18dec96      ksb     Change from build 102 to 103.. (T001 was 102)
 *							103 supports highlighting in speak
 * 13jan97      ksb     Change from build 103 to 104..
 *							104 now has reserved function and
 *							_debug feedback for autotuning
 * 20jan97      cjl     Change PROD_BUILD_TYPE to B,
 *							PROD_BUILD_VERSION to 002 and
 *							DTALK_STR_VERSION for freeze.
 * 17feb97      cjl     Change PROD_BUILD_TYPE to B,
 *							PROD_BUILD_VERSION to 003 and
 *                          DTALK_STR_VERSION for freeze.
 * 10mar97      cjl     Change PROD_BUILD_TYPE to B,
 *                          PROD_BUILD_VERSION to 004 and
 *                          DTALK_STR_VERSION for freeze.
 * 19mar97      ncs     Added in WillowPond License Key here.
 * 28apr97      ncs     Moved szLicenseKey here from
 *							\licenseu\updaterg.c
 * 01may97      tek     Licensing changes.
 * 06may97      cjl     Change PROD_BUILD_TYPE to B,
 *							PROD_BUILD_VERSION to 005 and
 *                          DTALK_STR_VERSION for freeze.
 * 23jun97      cjl     Change PROD_BUILD_VERSION to 006 and
 *							DTALK_STR_VERSION for freeze.
 * 21jul97		cjl		ifdef version info based on ACCESS32.
 * 03jul97      ncs     Changed REG for MULTI-LANG project
 *							Also reordered the #ifs and etc
 *							to be more neat and readable
 * 25jul97      cjl     Change PROD_BUILD_VERSION to 007 and
 *							DTALK_STR_VERSION for freeze and
 *							PROD_BUILD_TYPE to R for release.
 * 28jul97		cjl		Change Build keys for all products.
 * 01aug97      ncs     Syncing in with the new install shield scrips
 * 18aug97      cjl     Changed 4.4a to just 4.4 for 1st SSB release.
 * 20aug97      ncs     Added in TTSSRV_C to enable TTSSRV.EXE to build.
 * 28aug97      ksb     Merged with ML code
 * 17sep97      ksb+ncs Added DTALK_DBG_VERSION Debug Tester for Version.
 * 19sep97      tek     SMIT, t007a defs for access32
 * 25sep97      cjl     Change revision to R008, UNIX/SMIT release.
 * 25sep97      dr/gl   add abbreviation reference and UK_english support
 * 29sep97      cjl     Change revision to R009, UK/NWSNOAA release.
 * 03oct97      gl      Add NWSNOAA dictionary entry name.
 * 10nov97      cjl     Change revision to R010, NWSNOAA female voice release.
 * 26nov97      cjl     Change revision to R011, NWSNOAA male voices & SAPI (HJ).
 * 05dec97      cjl     Change revision to R012, NWSNOAA Final.
 * 23dec97      cjl     Change revision to B001, SAPI\UK\V4.50.
 * 13jan98      cjl     Change build to 107 per ksb.
 * 26jan98      cjl     Change to B002.
 * 02feb98      cjl     Change to B003.
 * 10mar98      cjl     Change to R004 and new registry/keys
 * 22may98		cjl     Change to 4.51 and R005.
 * 20aug98      cjl     Change to R006.
 * 30sep98		mfg		Changed LATIN_AMERICAN to SPANISH_LA to pick up correct dictionary
 * 28oct98		cjl		Change to 4.60 and B001.
 * 06jan99		mfg		Added Windows CE registry support
 * 27jan99		cjl     Change R006 to B002
 * 08feb99		gl		Separate NWSNOAA to NWS_US and NWS_LA 
 * 31mar99      cjl     Change B002 to R003
 * 10jun99      cjl     Change R003 to R004
 * 02jul99      cjl     Change R004 to R005
 * 22aug99      MGS     Changed to SMART and simplified
 * 22oct99      mgs     Change R005 to R006
 * 31oct99		mfg		Fixed the user dictionary registry entry for Windows CE
 * 04nov99		mgs		Fix for UNIX
 * 17feb00		mfg		defined CURRENT_USER_PRODUCT from v4.60 to 4.60 to find the user dictionary
 * 13mar00      mfg     Change to B009
 * 05jun00		mfg		Changed to P010
 * 20jul00		chj		French added
 * 08aug00		cab		Changed DTALK_STR_VERSION to RO11 for help to display right version number.
 * 15aug00		cab		Changed to R011
 * 15sep00		cab		1. Changed to B002
 *						2. Fix error in French registry entry by adding a Quote
 * 13oct00		cab		Changed to version 4.61 and to B002
 * 13dec00		cab		Added new registry entries for sapi5 to fix bug.
 * 14dec00		cab		Changed to R002
 * 03jan01		cab		Added extra letter to value DTALK_STR_VERSION for either release(r) or beta(b)
 * 26mar01		cab		Updated copyright info
 * 27mar01		cab		Fixed SAPI string error
 * 27feb03		mfg		Merged in DECtalk version 5.00 changes
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

#define DTALK_MAJ_VERSION       4                               // KSB - DTALK Version Check-dec
#define DTALK_MIN_VERSION       62                              // KSB - DTALK Version Check-dec
#define DTALK_MAJ_VERSION_CHAR  DTALK_MAJ_VERSION               // CJL - DTALK Version Check-char
#define DTALK_MIN_VERSION_CHAR  6                               // CJL - DTALK Version Check-char
#ifdef	ACCESS32
#define DLL_MAJ_VERSION         2                               // KSB - DLL Version Check
#define DLL_MIN_VERSION         3                               // KSB - DLL Version Check
#else
#define DLL_MAJ_VERSION         1                               // KSB - DLL Version Check
#define DLL_MIN_VERSION         9                               // KSB - DLL Version Check
#endif //Access32
#define PRODUCT_BUILD_TYPE      R                               // CJL - Production Build Type B or R
#define PRODUCT_BUILD_VERSION   002                             // CJL - Production Build Version xxx

#ifdef	ACCESS32 //Identify as ACCESS32
#ifndef DEMO    // DTDemo uses similar, but D006
#define DTALK_STR_VERSION       "v4.62 R002 ACCESS32"            // KSB - Version String
#else
#define DTALK_STR_VERSION       "v4.62 DR002 ACCESS32"            // KSB - Version String (Req by Anne)
#endif	// DEMO 

#else	//Otherwise it is NORMAL
#ifndef DEMO    // DTDemo uses similar, but D006
#define DTALK_STR_VERSION       "v4.62 R002 NORMAL"              // KSB - Version String
#else
#define DTALK_STR_VERSION       "v4.62 DR002 NORMAL"              // KSB - Version String (Req by Anne)
#endif	DEMO
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
#define CURRENT_USER_PRODUCT "DECtalkv4.62"

#elif defined WILLOWPOND

#define COMPANY "DECtalk Software"
#define PRODUCT "wpDECtalk"
#define CURRENT_USER_PRODUCT "wpDECtalkv4.62"

#elif defined GWMICRO

#define COMPANY "GW Micro, Inc."
#define PRODUCT "DECtalk-OEM"
#define CURRENT_USER_PRODUCT "DECtalk\\4.62"

#else

#define COMPANY "DECtalk Software"
#define PRODUCT "DECtalk"
#define CURRENT_USER_PRODUCT "DECtalk\\4.62"

#endif	// ACI_LICENCE

#define VERSION "4.62"


#ifdef ENGLISH_US
#ifdef NWS_US
#define DECTALK_LANGUAGE "NWS_US"
#else
#define DECTALK_LANGUAGE "US"
#endif
#elif defined (ENGLISH_UK)
#define DECTALK_LANGUAGE  "UK"
#elif  SPANISH
#ifdef SPANISH_LA
#ifdef NWS_LA
#define DECTALK_LANGUAGE "NWS_LA"
#else
#define DECTALK_LANGUAGE "LA"
#endif
#else
#define DECTALK_LANGUAGE "SP"
#endif
#elif  GERMAN
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
    TEXT("Software\\") TEXT(COMPANY) TEXT("\\") TEXT(CURRENT_USER_PRODUCT) TEXT("\\") TEXT(DECTALK_LANGUAGE);


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
LPSTR szMainDictDef = "DTALK_" DECTALK_LANGUAGE ".DIC";
LPSTR szUserDictDef = "USER_" DECTALK_LANGUAGE ".DIC"; 
LPSTR szAbbrDictDef = "ABBR_" DECTALK_LANGUAGE ".DIC"; 
LPSTR szForeignDictDef = "DTALK_FL_" DECTALK_LANGUAGE ".DIC";

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
/* HERE IS ISHIELD_DEF *************************************************************/
/* Information for the install shield script.rul file. *****************************/
/***********************************************************************************/

#ifdef ISHIELD_DEF

//--------------------------------------------------------------
#ifdef    _WILLOWPOND

#define APP_NAME                "wpDECtalk"
#define APPBASE_PATH            "Program Files\\wpDECtalk\\"
#define PRODUCT_NAME            "wpDECtalk"
#define DEINSTALL_KEY           "wpDECtalkDeinstKey"
#define PRODUCT_KEY             "wttstest.exe"
#define PROGRAM_FOLDER_NAME     "wpDECtalk t4.62"
#define UNINSTALL_NAME          "wpDECtalk v4.62"

//--------------------------------------------------------------
#else  // _WILLOWPOND

#define APP_NAME                "DECtalk"
#define APPBASE_PATH            "Program Files\\DECtalk\\"
#define PRODUCT_NAME            "DECtalk"
#define DEINSTALL_KEY           "DECtalkDeinstKey"
#define PRODUCT_KEY             "speak.exe;dtsample.exe;windic.exe;vercheck.exe;ttssrv.exe;ttstest.exe"
#define PROGRAM_FOLDER_NAME     "DECtalk V4.62"
#define UNINSTALL_NAME          "DECtalk V4.62"

#endif // _WILLOWPOND

//--------------------------------------------------------------
#define COMPANY_NAME            "Fonix Corporation"
#define DEC_LOGO_BMP            100
#define COPYRIGHT_BMP           200

//--------------------------------------------------------------
#define PRODUCT_VERSION         "4.61"

#ifdef _WILLOW_POND
#ifdef _MULTI_LANG
// Set the count to 4 using the keys noted on the top of this file:
#define LIC_COUNT				"H350Md50bCq0"
#else
// Set the count to 1 using the keys noted on the top of this file:
#define LIC_COUNT				"vx@00lB0bhh1"
#endif

#define INSTALL_PASSWORD			"Ym10EvX0OIU>Ojk?6TT2"
#else // _WILLOWPOND

#ifdef _MULTI_LANG
// Set the count to 4 using the keys noted on the top of this file:
#define LIC_COUNT				"J0B0RMA0HG60"
#else
// Set the count to 1 using the keys noted on the top of this file:
#define LIC_COUNT				"JQ00hO30xRL0"
#endif

#define INSTALL_PASSWORD			"JAC0Yyd0jor>AtJLid60"
#endif // _WILLOWPOND

//--------------------------------------------------------------
#ifdef ENGLISH_US
#define LANGUAGE_INITIALS       "US"
#define LANGUAGE_NAME           "US ENGLISH"
#elif defined (ENGLISH_UK)
#define LANGUAGE_INITIALS       "UK"
#define LANGUAGE_NAME           "UK ENGLISH"
#elif FRENCH
#define LANGUAGE_INITIALS       "FR"
#define LANGUAGE_NAME           "FRENCH"
#elif  GERMAN
#define LANGUAGE_INITIALS       "GR"
#define LANGUAGE_NAME           "GERMAN"
#elif  SPANISH
#define LANGUAGE_INITIALS       "SP"
#define LANGUAGE_NAME           "SPANISH"
#elif  SPANISH_LA
#define LANGUAGE_INITIALS       "LA"
#define LANGUAGE_NAME           "LATIN AMERICAN"
// Put more languages here in alphabetical order
#elif  _MULTI_LANG
#define LANGUAGE_INITIALS	"MultLang"
#define LANGUAGE_NAME		"MULTI LANGUAGE"
#endif

//--------------------------------------------------------------
// Standard DECtalk REG entries
#ifdef UNDER_CE
#ifdef ENGLISH_US
#define szLocalMachineDECtalk TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\US")
#elif defined (ENGLISH_UK)
#define szLocalMachineDECtalk TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\UK")
#elif  SPANISH
#define szLocalMachineDECtalk TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\SP")
#elif  SPANISH_LA
#define szLocalMachineDECtalk TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\LA")
#elif  GERMAN
#define szLocalMachineDECtalk TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\GR")
#elif FRENCH
#define szLocalMachineDECtalk TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\FR")	
#else // _MULTI_LANG
#define szLocalMachineDECtalk TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\ML")
#endif // LANGUAGES 

#define szLocalMachineDTlangs TEXT("\\SOFTWARE\\DECtalk Software\\DECtalk\\Langs")
#define szLicenseKey TEXT("SOFTWARE\\DECtalk Software\\DECtalk\\4.61")

#else //UNDER_CE

#ifdef ENGLISH_US
#ifdef NWS_US
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\NWS_US"
#else
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\US"
#endif
#elif defined (ENGLISH_UK)
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\UK"
#elif  SPANISH
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\SP"
#elif  SPANISH_LA
#ifdef NWS_LA
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\NWS_LA"
#else
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\LA"
#endif
#elif  GERMAN
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\GR"
#elif FRENCH
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\FR"		
#else // _MULTI_LANG
#define szLocalMachineDECtalk "\\SOFTWARE\\DECtalk Software\\DECtalk\\4.61\\ML"
#endif // LANGUAGES 

#define szLocalMachineDTlangs "\\SOFTWARE\\DECtalk Software\\DECtalk\\Langs"
#define szLicenseKey "SOFTWARE\\DECtalk Software\\DECtalk\\4.61"

#endif //UNDER_CE


#ifdef ENGLISH_US
#ifdef NWS_US
#define szMainDictDef "DTALK_NWS_US.DIC"
#define szUserDictDef "USER_NWS_US.DIC"
#define szAbbrDictDef "ABBR_NWS_US.DIC"
#else
#define szMainDictDef "DTALK_US.DIC"
#define szUserDictDef "USER_US.DIC"
#define szAbbrDictDef "ABBR_US.DIC"
#endif
#elif defined (ENGLISH_UK)
#define szMainDictDef "DTALK_UK.DIC"
#define szUserDictDef "USER_UK.DIC"
#define szAbbrDictDef "ABBR_UK.DIC"
#elif SPANISH
#define szMainDictDef "DTALK_SP.DIC"
#define szUserDictDef "USER_SP.DIC"
#define szAbbrDictDef "ABBR_SP.DIC"
#elif SPANISH_LA
#ifdef NWS_LA
#define szMainDictDef "DTALK_NWS_LA.DIC"
#define szUserDictDef "USER_NWS_LA.DIC"
#define szAbbrDictDef "ABBR_NWS_LA.DIC"
#else
#define szMainDictDef "DTALK_LA.DIC"
#define szUserDictDef "USER_LA.DIC"
#define szAbbrDictDef "ABBR_LA.DIC"
#endif
#elif GERMAN
#define szMainDictDef "DTALK_GR.DIC"
#define szUserDictDef "USER_GR.DIC"
#define szAbbrDictDef "ABBR_GR.DIC"
#elif FRENCH
#define szMainDictDef "DTALK_FR.DIC"
#define szUserDictDef "USER_FR.DIC"
#define szAbbrDictDef "ABBR_FR.DIC"
#endif // LANGUAGES

//--------------------------------------------------------------
// Microsoft Speech SDK specific GUIDs and DECtalk speech engine GUID
#define MS_TTS_ENUM_GUID        "{D67C0280-C743-11cd-80E5-00AA003E4B50}"
#define MS_AUDIO_DEST_GUID      "{CB96B400-C743-11cd-80E5-00AA003E4B50}"

#ifdef    _WILLOWPOND
#define DECTALK_TTS_ENGINE_GUID "{655789E1-0FD9-11d0-B026-0020AF26D014}"
#else  // _WILLOWPOND
#define DECTALK_TTS_ENGINE_GUID "{ED737300-8FCB-11ce-AB5D-00AA00590F2B}"
#endif // _WILLOWPOND

#endif /* ISHIELD_DEF */


/***********************************************************************************/
/* End of Registry Entries *********************************************************/
/***********************************************************************************/

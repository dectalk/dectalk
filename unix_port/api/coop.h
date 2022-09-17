/**********************************************************************/
/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1996, 1998           */
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
/**********************************************************************/
/*                                                                    */
/*  Text-To-Speech Co Operative Key File                              */
/*  Author: Carl Leeber                                               */
/*  Date:   November 19, 1996                                         */
/*  Name:   COOP.H                                                    */
/*                                                                    */
/*  Abstract:                                                         */
/*                                                                    */
/*         This file contains a co operative license key.             */
/*                                                                    */
/**********************************************************************/
/**********************************************************************/
/* revision history
 * 19nov96              cjl          include license key once!
 * 21nov96              cjl          inlcude version once!
 * 22nov96              cjl          move versions defines here from tts.h
 * 03dec96              cjl          Change version to decimal.
 * 18dec96              ksb          Change from build 102 to 103.. (T001 was 102)
 *                                      103 supports highlighting in speak
 * 13jan97              ksb          Change from build 103 to 104..
 *                                      104 now has reserved function and
 *                                      _debug feedback for autotuning
 * 20jan97              cjl          Change PROD_BUILD_TYPE to B,
 *                                      PROD_BUILD_VERSION to 002 and
 *                                      DTALK_STR_VERSION for freeze.
 * 17feb97              cjl          Change PROD_BUILD_TYPE to B,
 *                                      PROD_BUILD_VERSION to 003 and
 *                                      DTALK_STR_VERSION for freeze.
 * 10mar97              cjl          Change PROD_BUILD_TYPE to B,
 *                                      PROD_BUILD_VERSION to 004 and
 *                                      DTALK_STR_VERSION for freeze.
 * 19mar97              ncs          Added in WillowPond License Key here.
 * 28apr97              ncs          Moved szLicenseKey here from
 *                                      \licenseu\updaterg.c
 * 01may97              tek          Licensing changes.
 * 06may97              cjl          Change PROD_BUILD_TYPE to B,
 *                                      PROD_BUILD_VERSION to 005 and
 *                                      DTALK_STR_VERSION for freeze.
 * 23jun97              cjl          Change PROD_BUILD_VERSION to 006 and
 *                                      DTALK_STR_VERSION for freeze.
 * 21jul97		cjl		ifdef version info based on ACCESS32.
 * 03jul97              ncs          Changed REG for MULTI-LANG project
 *                                      Also reordered the #ifs and etc
 *                                      to be more neat and readable
 * 25jul97              cjl          Change PROD_BUILD_VERSION to 007 and
 *                                      DTALK_STR_VERSION for freeze and
 *					PROD_BUILD_TYPE to R for release.
 * 28jul97              cjl          Change Build keys for all products.
 * 01aug97              ncs          Syncing in with the new install shield scrips
 * 18aug97              cjl          Changed 4.4a to just 4.4 for 1st SSB release.
 * 20aug97              ncs          Added in TTSSRV_C to enable TTSSRV.EXE to build.
 * 28aug97              ksb          Merged with ML code
 * 17sep97              ksb+ncs      Added DTALK_DBG_VERSION Debug Tester for Version.
 * 19sep97                              tek                      SMIT, t007a defs for access32
 * 25sep97              cjl          Chnage revision to R008, UNIX/SMIT release.
 * 25sep97              dr/gl        add abbreviation reference and UK_english support
 * 29sep97              cjl          Change revision to R009, UK/NWSNOAA release.
 * 03oct97              gl           add NWSNOAA dictionary entry name.
 * 10nov97              cjl          Chnage revision to R010, NWSNOAA female voice release.
 * 26nov97              cjl          Change revision to R011, NWSNOAA male voices & SAPI (HJ).
 * 05dec97              cjl          Change revision to R012, NWSNOAA Final.
 * 23dec97              cjl          Change revision to B001, SAPI\UK\V4.50.
 * 13jan98              cjl          Change build to 107 per ksb.
 * 26jan98              cjl          Change to B002.
 * 02feb98              cjl          Change to B003.
 * 10mar98              cjl          Change to R004 and new registry/keys
 * 22may98		cjl          Change to 4.51 and R005.
 *
 */


/***********************************************************************************/
/* HERE IS COOP_H ******************************************************************/
/***********************************************************************************/

#ifndef COOP_H
#define COOP_H

#ifdef TYPING_MODE
#ifndef ACCESS32
#define ACCESS32
#endif
#endif

/***********************************************************************************/
/* License Keys ********************************************************************/
/***********************************************************************************/

#ifdef ACI_LICENSE
// ACI License Key
//#define LICENSE_KEY 20023
// 28jul97              cjl          Change Build keys for all products.
//#define LICENSE_KEY 31951
//10mar98 Active  ***************************
#define LICENSE_KEY 29247
#else // ACI_LICENSE

#ifdef ACCESS32 //tek 15sep97 SMIT licensing
#define DEFAULT_ACCESS32_KEY (11119)
#endif //ACCESS32


#ifdef WILLOWPOND
// Willowpond License Key
//#define LICENSE_KEY 31129
// 28jul97              cjl          Change Build keys for all products.
//#define LICENSE_KEY 31453
//10mar98 Active  ***************************
#define LICENSE_KEY 29289
#else // WILLOWPOND

// DECtalk License Key
//#define LICENSE_KEY 31125
// 28jul97              cjl          Change Build keys for all products.
//#define LICENSE_KEY 31237
//10mar98 Active  ***************************
#define LICENSE_KEY 29323

#endif // WILLOWPOND
#endif // ACI_LICENSE

#ifdef _DEBUG
#define DTALK_DBG_VERSION               1                       // NCS - DBG Version
#else
#define DTALK_DBG_VERSION               0                       // NCS - DBG Version
#endif

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
#define DTALK_MIN_VERSION       51                              // KSB - DTALK Version Check-dec
#define DTALK_MAJ_VERSION_CHAR  DTALK_MAJ_VERSION               // CJL - DTALK Version Check-char
#define DTALK_MIN_VERSION_CHAR  5                               // CJL - DTALK Version Check-char
#ifdef	ACCESS32
#define DLL_MAJ_VERSION         2                               // KSB - DLL Version Check
#define DLL_MIN_VERSION         1                               // KSB - DLL Version Check
#else
#define DLL_MAJ_VERSION         1                               // KSB - DLL Version Check
#define DLL_MIN_VERSION         8                               // KSB - DLL Version Check
#endif //Access32
#define PRODUCT_BUILD_TYPE      R                               // CJL - Production Build Type T or R
#define PRODUCT_BUILD_VERSION   005                             // CJL - Production Build Version xxx

#ifdef	ACCESS32 //Identify as ACCESS32
#ifndef DEMO    // DTDemo uses similar, but D005
#define DTALK_STR_VERSION       "v2.11 R005 ACCESS32"            // KSB - Version String
#else
#define DTALK_STR_VERSION       "v2.11 D005 ACCESS32"            // KSB - Version String (Req by Anne)
#endif
#else	//Otherwise it is NORMAL
#ifndef DEMO    // DTDemo uses similar, but D005
#define DTALK_STR_VERSION       "v4.51 R005 NORMAL"              // KSB - Version String
#else
#define DTALK_STR_VERSION       "v4.51 D005 NORMAL"              // KSB - Version String (Req by Anne)
#endif
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

#ifdef LICENINC_C


CHAR gszLicenseKeyValueName[] = "Licenses";

#ifdef ACI_LICENSE
CHAR gszLicenseKey[] = 
      "Software\\ManufacturersName\\DECtalk\\4.51";
#else /* ACI_LICENSE */

#ifdef WILLOWPOND
CHAR gszLicenseKey[] = 
      "Software\\DigitalEquipmentCorporation\\wpDECtalk\\4.51";
#else /* WILLOWPOND */

// Standard DECtalk REG entries
CHAR gszLicenseKey[] = 
      "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51";

#endif /* WILLOWPOND  */
#endif /* ACI_LICENSE */
#endif /* LICENINC_C  */


/***********************************************************************************/
/* HERE IS LSWMAIN_DIC *************************************************************/
/* Information about the location of the dictionary files **************************/
/***********************************************************************************/

#if defined (LSWMAIN_DIC) || defined (SPEAK_C) || defined (WINDIC_C) || defined (TTSSRV_C)
#ifndef DTDEMO

#ifdef WINDIC_C_STATIC
LPSTR szLocalMachineDECtalk;

#else
#ifdef ACI_LICENSE
LPSTR szLocalMachineDECtalk =
#ifdef ENGLISH_US
    "SOFTWARE\\ManufacturersName\\DECtalk\\4.51\\US";
#elif defined (ENGLISH_UK)
    "SOFTWARE\\ManufacturersName\\DECtalk\\4.51\\UK";
#elif  SPANISH
#ifdef  LATIN_AMERICAN
    "SOFTWARE\\ManufacturersName\\DECtalk\\4.51\\LA";
#else
    "SOFTWARE\\ManufacturersName\\DECtalk\\4.51\\SP";
#endif
#elif  GERMAN
    "SOFTWARE\\ManufacturersName\\DECtalk\\4.51\\GR";
#endif // LANGUAGES 

LPSTR szCurrentUsersDECtalk =
#ifdef ENGLISH_US
    "Software\\ManufacturersName\\DECtalkv4.51\\US";
#elif defined (ENGLISH_UK)
    "Software\\ManufacturersName\\DECtalkv4.51\\UK";
#elif  SPANISH
#ifdef LATIN_AMERICAN
    "Software\\ManufacturersName\\DECtalkv4.51\\LA";
#else
    "Software\\ManufacturersName\\DECtalkv4.51\\SP";
#endif
#elif  GERMAN
    "Software\\ManufacturersName\\DECtalkv4.51\\GR";
#endif // LANGUAGES 

#else // ACI_LICENSE


#ifdef WILLOWPOND
LPSTR szLocalMachineDECtalk =
#ifdef ENGLISH_US
    "SOFTWARE\\DigitalEquipmentCorporation\\wpDECtalk\\4.51\\US";
#elif defined (ENGLISH_UK)
    "SOFTWARE\\DigitalEquipmentCorporation\\wpDECtalk\\4.51\\UK";
#elif  SPANISH
#ifdef LATIN_AMERICAN
    "SOFTWARE\\DigitalEquipmentCorporation\\wpDECtalk\\4.51\\LA";
#else
    "SOFTWARE\\DigitalEquipmentCorporation\\wpDECtalk\\4.51\\SP";
#endif
#elif  GERMAN
    "SOFTWARE\\DigitalEquipmentCorporation\\wpDECtalk\\4.51\\GR";
#endif // LANGUAGES 

LPSTR szCurrentUsersDECtalk =
#ifdef ENGLISH_US
    "Software\\DigitalEquipmentCorporation\\wpDECtalkv4.51\\US";
#elif defined  (ENGLISH_UK)
    "Software\\DigitalEquipmentCorporation\\wpDECtalkv4.51\\UK";
#elif  SPANISH
#ifdef LATIN_AMERICAN
    "Software\\DigitalEquipmentCorporation\\wpDECtalkv4.51\\LA";
#else
    "Software\\DigitalEquipmentCorporation\\wpDECtalkv4.51\\SP";
#endif
#elif  GERMAN
    "Software\\DigitalEquipmentCorporation\\wpDECtalkv4.51\\GR";
#endif // LANGUAGES 

#else // WILLOWPOND


// Standard DECtalk REG entries
LPSTR szLocalMachineDECtalk =
#ifdef ENGLISH_US
#ifdef NWSNOAA
    "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\NWS";
#else
    "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\US";
#endif
#elif defined (ENGLISH_UK)
    "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\UK";
#elif  SPANISH
#ifdef LATIN_AMERICAN
    "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\LA";
#else
    "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\SP";
#endif
#elif  GERMAN
    "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\GR";
#endif // LANGUAGES 


LPSTR szCurrentUsersDECtalk =
#ifdef ENGLISH_US
#ifdef NWSNOAA
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\NWS";
#else
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\US";
#endif
#elif defined (ENGLISH_UK)
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\UK";
#elif  SPANISH
#ifdef LATIN_AMERICAN
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\LA";
#else
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\SP";
#endif
#elif  GERMAN
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\GR";
#endif // LANGUAGES

#endif /* WILLOWPOND  */
#endif /* ACI_LICENSE */

/* GL 09/25/1997 add abbreviation dict entry and UK_english support */
/* GL 11/03/1997 add NWSNOAA dictionary entry */
#ifdef ENGLISH_US
#ifdef NWSNOAA
LPSTR szMainDictDef = "DTALK_NWS.DIC";
LPSTR szUserDictDef = "USER_NWS.DIC"; 
LPSTR szAbbrDictDef = "ABBR_NWS.DIC"; 
#else
LPSTR szMainDictDef = "DTALK_US.DIC";
LPSTR szUserDictDef = "USER_US.DIC"; 
LPSTR szAbbrDictDef = "ABBR_US.DIC"; 
#endif
#elif defined (ENGLISH_UK)
LPSTR szMainDictDef = "DTALK_UK.DIC";
LPSTR szUserDictDef = "USER_UK.DIC"; 
LPSTR szAbbrDictDef = "ABBR_UK.DIC"; 
#elif SPANISH
#ifdef LATIN_AMERICAN
LPSTR szMainDictDef = "DTALK_LA.DIC";
LPSTR szUserDictDef = "USER_LA.DIC"; 
LPSTR szAbbrDictDef = "ABBR_LA.DIC"; 
#else
LPSTR szMainDictDef = "DTALK_SP.DIC";
LPSTR szUserDictDef = "USER_SP.DIC"; 
LPSTR szAbbrDictDef = "ABBR_SP.DIC"; 
#endif
#elif GERMAN
LPSTR szMainDictDef = "DTALK_GR.DIC";
LPSTR szUserDictDef = "USER_GR.DIC"; 
LPSTR szAbbrDictDef = "ABBR_GR.DIC"; 
#elif FRENCH
LPSTR szMainDictDef = "DTALK_FR.DIC";
LPSTR szUserDictDef = "USER_FR.DIC"; 
LPSTR szAbbrDictDef = "ABBR_FR.DIC"; 
#endif // LANGUAGES

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
#ifdef ENGLISH_US
#ifdef NWSNOAA
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\Applications\\Speak\\NWS";
#else
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\Applications\\Speak\\US";
#endif
#elif defined (ENGLISH_UK)
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\Applications\\Speak\\UK";
#elif  SPANISH
#ifdef  LATIN_AMERICAN
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\Applications\\Speak\\LA";
#else
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\Applications\\Speak\\SP";
#endif
#elif  GERMAN
    "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51\\Applications\\Speak\\GR";
#endif // LANGUAGES 

#endif /* DEMO    */
#endif /* SPEAK_C */


/***********************************************************************************/
/* HERE IS TTSSRV_C ****************************************************************/
/* Location of the TTSSRV_C application ********************************************/
/***********************************************************************************/

#ifdef TTSSRV_C
	

LPSTR szCurrentUsersTTSsrv =
  "Software\\DigitalEquipmentCorporation\\DECtalk\\Applications\\TTSsrv";

#endif

/***********************************************************************************/
/* HERE IS UPDATERG_C **************************************************************/
/* Information about the location of the encrypted license key *********************/
/***********************************************************************************/

#ifdef UPDATERG_C


#ifdef ACI_LICENSE
CHAR szLicenseKey[] = 
      "Software\\ManufacturersName\\DECtalk\\4.51";
#else /* ACI_LICENSE */

#ifdef WILLOWPOND
CHAR szLicenseKey[] = 
      "Software\\DigitalEquipmentCorporation\\wpDECtalk\\4.51";
#else /* WILLOWPOND */

// Standard DECtalk REG entries
CHAR szLicenseKey[] = 
      "Software\\DigitalEquipmentCorporation\\DECtalk\\4.51";

#endif /* WILLOWPOND  */
#endif /* ACI_LICENSE */
#endif /* UPDATERG_C  */


/***********************************************************************************/
/* HERE IS WINDIC_C ****************************************************************/
/* Location of the WINDIC registry keys ********************************************/
/***********************************************************************************/

#ifdef WINDIC_C


LPSTR szCurrentUsersWindic =
  "Software\\DigitalEquipmentCorporation\\DECtalk\\Applications\\Windic";

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
#define PROGRAM_FOLDER_NAME     "wpDECtalk t4.51"
#define UNINSTALL_NAME          "wpDECtalk v4.51"

//--------------------------------------------------------------
#else  // _WILLOWPOND

#define APP_NAME                "DECtalk"
#define APPBASE_PATH            "Program Files\\DECtalk\\"
#define PRODUCT_NAME            "DECtalk"
#define DEINSTALL_KEY           "DECtalkDeinstKey"
#define PRODUCT_KEY             "speak.exe;dtsample.exe;windic.exe;vercheck.exe;ttssrv.exe;ttstest.exe"
#define PROGRAM_FOLDER_NAME     "DECtalk V4.51"
#define UNINSTALL_NAME          "DECtalk V4.51"

#endif // _WILLOWPOND

//--------------------------------------------------------------
#define COMPANY_NAME            "DigitalEquipmentCorporation"
#define DEC_LOGO_BMP            100
#define COPYRIGHT_BMP           200

//--------------------------------------------------------------
#define PRODUCT_VERSION         "4.51"

#ifdef _WILLOW_POND
#ifdef _MULTI_LANG
// Set the count to 4 using the keys noted on the top of this file:
#define LIC_COUNT				"vBB0yf20?k10"
#else
// Set the count to 1 using the keys noted on the top of this file:
#define LIC_COUNT				"BX20Dl?0kt80"
#endif

#define INSTALL_PASSWORD			"pg40TLg0nbCAE8@Q0eZe"
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
#ifdef ENGLISH_US
#ifdef NWSNOAA
#define szLocalMachineDECtalk "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\NWS"
#else
#define szLocalMachineDECtalk "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\US"
#endif
#elif defined (ENGLISH_UK)
#define szLocalMachineDECtalk "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\UK"
#elif  SPANISH
#define szLocalMachineDECtalk "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\SP"
#elif  SPANISH_LA
#define szLocalMachineDECtalk "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\LA"
#elif  GERMAN
#define szLocalMachineDECtalk "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\GR"
#else // _MULTI_LANG
#define szLocalMachineDECtalk "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51\\ML"
#endif // LANGUAGES 

#define szLocalMachineDTlangs "\\SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\Langs"
#define szLicenseKey "SOFTWARE\\DigitalEquipmentCorporation\\DECtalk\\4.51"

#ifdef ENGLISH_US
#ifdef NWSNOAA
#define szMainDictDef "DTALK_NWS.DIC"
#define szUserDictDef "USER_NWS.DIC"
#define szAbbrDictDef "ABBR_NWS.DIC"
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
#define szMainDictDef "DTALK_LA.DIC"
#define szUserDictDef "USER_LA.DIC"
#define szAbbrDictDef "ABBR_LA.DIC"
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

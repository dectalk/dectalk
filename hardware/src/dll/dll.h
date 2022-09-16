/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	dll.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk-PC DLL structures and defines ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who 	Date        Description
 * ---  -----   ----------- --------------------------------------------
 * 001  GL      09/25/1997  change language dictionary symbol
 */

#define _WINDLL         1
#include <memory.h>
#include <string.h>
#include <windows.h>
#include <stdlib.h>
#include        <ctype.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#include        <stdio.h>
#include <conio.h>
#include        <time.h>
#include        <malloc.h>
#include        "defs.h"
#include        "pcport.h" 
#include        "dll_prot.h"
#include        "dll_usym.h"
#include        "dll_dlg.h"

/*
 *  pragmas for all the dll ...
 */


/* #pragma alloc_text(FIXEDSEG, WEP) */

/*
 *  special codes ...
 */

#define SPC_DIGITIZED_DATA      5
#define SPC_DIGITIZED_MAX               8

#ifndef NWSNOAA
#define PRIMARY_DIC                 0
#define USER_DIC                    1
#define ABBREV_DIC                  2
#else
#define EPRIMARY_DIC                    0
#define USER_DIC                                1
#define COMMAND_DIC                     2
#define ABBREV_DIC                      3
#define SPRIMARY_DIC                    4
#define SUSER_DIC                               5
#define FPRIMARY_DIC                    6
#define FUSER_DIC                               7
#define GPRIMARY_DIC                    8
#define GUSER_DIC                               9
#define BPRIMARY_DIC                    10
#define BUSER_DIC                               11
#endif


extern char     _far *ErrorStrings[30];                         /* Text for above codes */
			
/*
 *  DECtalk-PC module hardware defs ...
 */



#define DT_STAT_LOW                     (DTC.base+0)
#define DT_STAT_HIGH            (DTC.base+1)
#define DT_CMD_LOW                      (DTC.base+0)
#define DT_CMD_HIGH                     (DTC.base+1)

#define DT_DO_LOW                       (DTC.base+2)
#define DT_DO_HIGH                      (DTC.base+3)
#define DT_DI_LOW                       (DTC.base+2)
#define DT_DI_HIGH                      (DTC.base+3)

#define DT_DMA                          (DTC.base+4)
#define DT_INT                          (DTC.base+6)

/*
 *  control structures
 */

#define PATH_SIZE                       128
#define FNAME_SIZE                      14
#define INI_STRING_SIZE 128

#define LOG_TEXT                                0
#define LOG_PHONEMES            1
#define LOG_FORMS                       2
#define LOG_TYPE                                3

#define IF_BIT(v,b)                             (v & (1<<b))

#define SECTION_MOD_OFFSET      7
extern char     dtpcIniFile[14];
extern char     dtpcSectionName[14];



struct dectalk_settings {

	 int            settings_loaded;
	 char           path_name[PATH_SIZE];
	 char           kernel_name[FNAME_SIZE];
	 char           dic_name[FNAME_SIZE];
	 char           lts_name[FNAME_SIZE];
	 char           ph_name[FNAME_SIZE];
	 char           cmd_name[FNAME_SIZE];
	 char           lang_name[FNAME_SIZE];
	 char           code_name[FNAME_SIZE];
	 char           test_string[INI_STRING_SIZE];
	 char           welcome_string[INI_STRING_SIZE];
	 int            volume;
	 int            voice;
	 int            rate;
	 int            comma;
	 int            period;
	 int            say;
	 int            punct;
	 int            log;
	 int            mode;
	 int            error;
	 int            timeout;
	 int            val[31];
};

#define DEF_VOICE                       0
#define DEF_VOLUME                      3
#define DEF_RATE                                180
#define DEF_COMMA                       0
#define DEF_PERIOD                      0
#define DEF_SAY                         2
#define DEF_PUNCT                       1
#define DEF_LOG                         0
#define DEF_MODE                                0
#define DEF_TIMEOUT                     0
#define DEF_ERROR                       3


struct  dectalk_control {

	volatile unsigned int                           base;                                   /* module base i/o address */
	volatile unsigned int                           status;                         /* last status read from module */
	volatile unsigned int                           module_status;          /* last status, status */
	volatile unsigned int                           command;                                /* last command sent to the module */
	volatile unsigned int                           error_status;           /* module error status */
	volatile unsigned int                           id;                                     /* id of port control software */
	volatile unsigned int                           dma_flop;                       /* module dma's available */
	volatile unsigned int                           lastindex;                      /* last received index */
	volatile unsigned int                           loaded;                         /* module loaded flag */
	volatile struct dectalk_settings        ds;                                     /* software settable parameters */
};


extern struct dectalk_control dtc[4];
extern int                      module_index;

#define DTC             (dtc[module_index])
#define DTS             (dtc[module_index].ds)

#define WINDOWS_TPS             1000                            /* ticks per second */

/*
 *  command static strings ...
 */

extern char *voice_cmd[12];
extern char *punct_cmd[5];
extern char *say_cmd[6];
extern char *log_cmd[12];
extern char *mode_cmd[14];
extern char *volume_cmd[16];
extern char *rate_cmd[3];
extern char *period_cmd[3];
extern char *comma_cmd[3];
extern char *error_cmd[7];
extern char *timeout_cmd[3];


/*
 *  dll control variables ...
 */
 
/* commented out as unused var - 8/9/95  JDB 
extern int                                                              in_dll;
*/

extern unsigned int                                     dtpcErrorStatus;
extern int                                                              dtpcTotalErrors;


/*
 *  kernel and executable file load stuff ...
 */

#define READ_BUFF_SIZE          (0x8000)                                                                /* chars in read buffer */
#define MAX_FIXUPS                      ((unsigned int)1024)                            /* maximum fixups per exe */

extern  HWND            dtpcMessWnd;
extern  HANDLE  dtpcInst;

#define FTEMP_BUFF      ((char _far *)&temp_buff[0])
extern char     __far temp_buff[];

/*
 *  msdos .exe files will look like ...
 */

struct dos_exe_header {
	unsigned int    id;                     /* Linker's signature, must be 0x5a4d   */
	unsigned int    rem;                    /* length of image mod 512              */
	unsigned int    pages;          /* length of image in pages of 512 bytes*/
	unsigned int    relen;          /* number of relocation items           */
	unsigned int    hsize;          /* header size in paragraphs of 16 bytes*/
	unsigned int    hmin;                   /* min # of paragraphs above prog end   */
	unsigned int    hmax;
	unsigned int    ssval;
	unsigned int    spval;          /* to be loaded in sp                   */
	unsigned int    checksum;
	unsigned int    ipval;          /* to be loaded in ip                   */
	unsigned int    csval;                  /* segment offset to code               */
	unsigned int    reloc;          /* location of relocation items         */
	unsigned int    ovrlay;         /* overlay number                       */
};

/*  a dos relocation element looks like */

struct dos_reloc {
	short int       offset;
	short int       segment;
};


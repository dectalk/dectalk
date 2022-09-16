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
 *    File Name:	user_dll.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk DLL include file.
 *  Created on : 08/17/92 at 09:43:30
 *
 ***********************************************************************
 *    Revision History:
 */

/*
 *  Return codes ...
 */

#define	DLL_FAILURE		0x00			/* Fails to do function */
#define	DLL_SUCCESS		0x01			/* Succeeds */
#define	DLL_BUSY			0x02			/* Tsr is busy, try again */
#define	DLL_RETRY		0x03			/* Module busy, try again */

/*
 * DECtalk error status codes ...
 */

#define	ERROR_status_null				0
#define	ERROR_status_timeout			1
#define	ERROR_dma_timeout				2
#define	ERROR_cmd_timeout				3
#define	ERROR_bad_command				4
#define	ERROR_no_module				5
#define	ERROR_bad_mode					6
#define	ERROR_flush_timeout			7
#define	ERROR_no_modules				8
#define	ERROR_file_format				9
#define	ERROR_too_many_fixups		10
#define	ERROR_kernel_too_big			11
#define	ERROR_no_init					12
#define	ERROR_send_load				13
#define	ERROR_dma_address				14
#define	ERROR_load_image				15
#define	ERROR_no_status				16
#define	ERROR_no_start					17
#define	ERROR_no_start_address		18
#define	ERROR_kernel_start			19
#define	ERROR_no_cmd_sync				20
#define	ERROR_no_dma_sync				21
#define	ERROR_bad_alloc				22
#define	ERROR_bad_file_read			23
#define	ERROR_boot_mode				24
#define	ERROR_no_memory				25
#define	ERROR_bad_file					26
#define	ERROR_no_file					27
#define	ERROR_no_mem_lock				28


/*
 *  Min/Max values for the current synth ...
 */


#define	MIN_VOLUME				0
#define	MAX_VOLUME				100
#define	MIN_TIMEOUT				0
#define	MAX_TIMEOUT				1800
#define	MIN_RATE					75
#define	MAX_RATE					600
#define	MIN_COMMA				(-20000)
#define	MAX_COMMA				(20000)
#define	MIN_PERIOD				(-20000)
#define	MAX_PERIOD				(20000)


/*
 *  Get codes for stored/current values ...
 */

#define	DTPC_get_volume			1
#define	DTPC_get_rate				2
#define	DTPC_get_voice				3
#define	DTPC_get_period			4
#define	DTPC_get_comma				5

/*
 *  DECtalk PC DLL export function prototypes.
 */

extern	int  __far dtpcInitDll(void);
extern	void  __far dtpcCloseDll(void);
extern	int  __far dtpcVolumeUp(int mod,int vol);
extern	int  __far dtpcVolumeDown(int mod,int vol);
extern	int  __far dtpcVolumeSet(int mod,int vol);
extern	int  __far dtpcPause(int mod);
extern	int  __far dtpcResume(int mod);
extern	int  __far dtpcResumeSpc(int mod);
extern	int  __far dtpcFlushText(int mod);
extern	int  __far dtpcFlushChar(int mod,unsigned char c);
extern	int  __far dtpcFlushSpeech(int mod);
extern	int  __far dtpcImmdVoice(int mod,int voice);
extern	int  __far dtpcImmdRate(int mod,int rate);
extern	int  __far dtpcImmdRateDelta(int mod,int rate);
extern	int  __far dtpcImmdPeriod(int mod,int pause);
extern	int  __far dtpcImmdComma(int mod,int pause);
extern	int  __far dtpcBuffFree(int mod,int __far *bytes);
extern	int  __far dtpcLastIndex(int mod,int __far *index);
extern	int  __far dtpcBuffUsed(int mod,int __far *bytes);
extern	int  __far dtpcFreeMem(int mod,int __far *paras);
extern	int  __far dtpcIoPriority(int mod,int priority);
extern	int  __far dtpcDigitizedMode(int mod);
extern	int  __far dtpcTextMode(int mod);
extern	int  __far dtpcReset(int mod);
extern	int  __far dtpcGetStatus(int mod,unsigned int *mod_status,int *number,int *mode);
extern	int  __far dtpcSendChar(int mod,unsigned char c);
extern	int  __far dtpcGetChar(int mod,unsigned char __far *c);
extern	int  __far dtpcSendBuff(int mod,unsigned char __far *buff,int __far *count);
extern	int  __far dtpcGetBuff(int mod,unsigned char __far *buff,unsigned int __far *count);
extern	int  __far dtpcSendDigitized(int mod,unsigned char __far *buff,unsigned int frames);
extern	unsigned int  __far dtpcLoadModule(int mod);
extern	unsigned int  __far dtpcSetup(int mod,unsigned int wnd);
extern	unsigned int  __far dtpcGetSetting(int mod,int setting,unsigned int __far *rvalue);

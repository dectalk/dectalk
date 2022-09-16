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
 *    File Name:	dll_prot.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  File \dtpc\dll\src\protos.h
 *  Created on : 08/17/92 at 09:43:01
 *
 ***********************************************************************
 *    Revision History:
 */ 

extern	int __pascal __far LibMain(HANDLE hModule,WORD wDataSeg,WORD cbHeapSize,LPSTR lpszCmdLine);
extern	int __pascal __far WEP(int bSystemExit);
extern	int __pascal __far dtpcInitDll(void);
extern	__export __pascal  dtpcCloseDll(void);
extern	void _dtpcSetTimeoutTicks(int ticks);
extern	void _dtpcSetTimeout(int secs);
extern	int _dtpcCheckTimeout(void);
extern	void _dtpcWaitTicks(int ticks);
extern	int _dtpcDllEntry(int mod,int boot_check);
extern	int _dtpcDllExit(int status);
extern	void __pascal __far _dtpcCenter(unsigned int hWnd);
extern	int _dtpcAllocMem(int paras,unsigned long __far *addr);
extern	int _dtpcLoadMem(unsigned long addr,char __far *buff,int count);
extern	int _dtpcReadMem(unsigned long addr,char __far *buff,int count);
extern	int _dtpcSetDic(unsigned long addr,unsigned long entries,int type);
extern	int _dtpcStartTask(unsigned int cs,unsigned int ip);
extern	int _dtpcDoImmd(unsigned int cmd,unsigned int data);
extern	int _dtpcDoImmdGet(unsigned int cmd,unsigned int __far *data);
extern	void _dtpcSetStatus(void);
extern	int _dtpcDoCommand(unsigned int cmd);
extern	int _dtpcWaitDstat(unsigned int ticks);
extern	int _dtpcCheckDstat(void);
extern	int _dtpcWaitCstat(int ticks);
extern	int _dtpcWaitFlush(void);
extern	int _dtpcWaitBit(int secs,unsigned int bit);
extern	int _dtpcWaitPattern(int secs,unsigned int pattern);
extern	unsigned int _dtpcGetStatus(void);
extern	void _dtpcPutCommand(unsigned int cmd);
extern	unsigned int _dtpcGetData(void);
extern	void _dtpcPutData(int data);
extern	int _dtpcLoadFile( char *fname, char *path);
extern	int _dtpcLoadExe(void);
extern	int _dtpcLoadDic(int kind);
extern	int _dtpcKernelLoad(void);
extern	int _dtpcWaitInit(int retry,int reset);
extern	int _dtpcFileResources(void);
extern	void _dtpcFreeResources(void);
extern	int __pascal __far _dtpcErrorLoad(int status);
extern	int __pascal __far dtpcVolumeUp(int mod,int vol);
extern	int __pascal __far dtpcVolumeDown(int mod,int vol);
extern	int __pascal __far dtpcVolumeSet(int mod,int vol);
extern	int __pascal __far dtpcPause(int mod);
extern	int __pascal __far dtpcResume(int mod);
extern	int __pascal __far dtpcResumeSpc(int mod);
extern	int __pascal __far dtpcFlushText(int mod);
extern	int __pascal __far dtpcFlushChar(int mod, char c);
extern	int __pascal __far dtpcFlushSpeech(int mod);
extern	int __pascal __far DTPCIMMDVOICE(int mod,int voice);
extern	int __pascal __far dtpcImmdRate(int mod,int rate);
extern	int __pascal __far dtpcImmdRateDelta(int mod,int rate);
extern	int __pascal __far dtpcImmdPeriod(int mod,int pause);
extern	int __pascal __far dtpcImmdComma(int mod,int pause);
extern	int __pascal __far dtpcBuffFree(int mod,int __far *bytes);
extern	int __pascal __far dtpcLastIndex(int mod,int __far *index);
extern	int __pascal __far dtpcBuffUsed(int mod,int __far *bytes);
extern	int __pascal __far dtpcFreeMem(int mod,int __far *paras);
extern	int __pascal __far dtpcIoPriority(int mod,int priority);
extern	int __pascal __far dtpcDigitizedMode(int mod);
extern	int __pascal __far dtpcTextMode(int mod);
extern	int __pascal __far dtpcReset(int mod);
extern	int __pascal __far dtpcGetStatus(int mod,unsigned int *mod_status,int *number,int *mode);
extern	int __pascal __far dtpcSendChar(int mod, char c);
extern	int __pascal __far dtpcGetChar(int mod, char __far *c);
extern	int __pascal __far dtpcSendBuff(int mod, char __far *buff,int __far *count);
extern	int __pascal __far dtpcGetBuff(int mod, char __far *buff,unsigned int __far *count);
extern	int __pascal __far dtpcSendDigitized(int mod, char __far *buff, int frames);
extern	_export __pascal __far dtpcLoadModule(int mod);
extern	__export __pascal __far dtpcSetup(HWND mod, int wnd);
extern	__export __pascal __far dtpcGetSetting(int mod,int setting,unsigned int __far *rvalue);
extern	void _dtpcMessageWindow(unsigned int hinst);
extern	void _dtpcKillMessageWindow(void);
extern	void _dtpcOutMessWindow(int x,int y, char *text);
extern	void _dtpcClearMessWindow(void);
extern	unsigned int __pascal __far _dtpcLoadSettings(void);
extern	unsigned int __pascal __far _dtpcSaveSettings(void);
extern	__export __pascal _dtpcSendSetString(int value, char *str[] );
extern	__export _dtpcSendInitBuff( char __far *buff);
extern	__export _dtpcSayWelcome(void);
extern	__export _dtpcSayTest(void);
extern	__export _dtpcSendInitChar( char c);
extern	BOOL FAR PASCAL __loadds _dtpcConfigDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	int __pascal __far __loadds _dtpcSpeechDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	int __pascal __far __loadds _dtpcSettingsDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	int __pascal __far __loadds _dtpcOutputDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	int __pascal __far __loadds _dtpcStringsDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	int __pascal __far __loadds _dtpcFilesDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	void _dtpcReadOkValue(unsigned int dlg,int ctrlv,int ctrls,int __far *param,int min,int max,int def,int invert);
extern	void _dtpcSetScroll(unsigned int dlg,int ctrlv,int ctrls,unsigned int action,int value,int __far *param,int min,int max,int invert);
extern	int _dtpcGetStringDlg(unsigned int dlg,int ctrl, char __far *ns, char __far *ds,int size);
extern	int __pascal __far __loadds _dtpcCustomDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	void _dtpcLoadVal(void);
extern	void _dtpcSaveVal(void);
extern	void _dtpcSetVal(void);
extern	int _dtpcSetValDlg(unsigned int hWndDlg,int param);
extern	int _dtpcFindModules(void);

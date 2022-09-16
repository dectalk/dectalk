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
 *    File Name:	wsr_prot.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  File \dtpc\wsr\src\protos.h
 *  Created on : 08/18/92 at 07:48:59
 *
 ***********************************************************************
 *    Revision History:
 */ 

extern	int __pascal WinMain(HANDLE hInstance,HANDLE hPrevInstance,LPSTR lpszCmdLine,int nCmdShow);
extern	long __pascal __far WndProc(unsigned int hWnd,unsigned short Message,unsigned short wParam,long lParam);
extern	int nCwRegisterClasses(void );
extern	void CwUnRegisterClasses(void );
extern	int wsrErrorMessage(char __far *str);
extern	void __pascal __far wsrCenter(unsigned int hWnd);
extern	int wsrOpenFile(void);
extern	int wsrReadFile(int mod);
extern	void wsrDoRead(void);
extern	void wsrSimpleRead(void);
extern	int wsrFileError(char __far *str);
extern	int __pascal __far wsrReadControl(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	int __pascal __far wsrTextDlg(unsigned int hWndDlg,unsigned short Message,unsigned short wParam,long lParam);
extern	void wsrFileInit(void);
extern	void wsrSetupTTY(unsigned int hDC);
extern	LPSTR wsrGetTTYLine(short which);
extern	void wsrPutTTY(unsigned int hDC, char __far *psOutput);
extern	void wsrPaintTTY(void);
extern	void wsrInitTTY(void);
extern	void wsrClearTTY(void);
extern	void wsrTextOut(char __far *str);
extern	void wsrHighLightText(int hx,int hy,int len,int color);
extern	void wsrStartIndex(void);
extern	void wsrResetIndex(void);
extern	void wsrStopIndex(void);
extern	void wsrSetIndex(void);
extern	void wsrRemoveIndex(int value);
extern	void wsrScrollIndex(void);
extern	void wsrSetHighLight(int value,int highlight);
extern	void wsrIndexRead(void);
extern	void wsrWatchIndex(void);
extern	void wsrSendBuff(char __far *buff);

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
 *    File Name:	dll_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk PC Windows dll ... main support code ...
 *
 ***********************************************************************
 *    Revision History:
 */

#include        "dll.h"

/*
 *  globals ...
 */

HANDLE                                                  dtpcInst;                                               /* Global default handle */
BOOL                                                            dtpcDllReady;                                   /* dll inited and ready */
struct  dectalk_control dtc[4];                                                 /* control area for modules */
int                                                             module_index;                                   /* currently specified module */
extern volatile int num_mod;                                    /* number of installed modules */
unsigned long                                   dtpcTicks;                                              /* global timer */
BOOL                                                            dtpcDllBusy;                                    /* Dll is in use */
unsigned int                                    dtpcErrorStatus;                                /* Global last error status */
int                                                             dtpcTotalErrors;                                /*      Total error encountered */
char            __far                           temp_buff[512]; /* temp ds based string buffer */

int FAR PASCAL LibMain(HANDLE hModule, WORD wDataSeg, WORD cbHeapSize, LPSTR lpszCmdLine)
{
   dtpcInst = hModule;
	dtpcDllReady = FALSE;
	return(1);
}

/*int FAR PASCAL WEP (int bSystemExit) */
/*{ */
/*      dtpcCloseDll(); */
/*      return(1); */
/*}  */

__export PASCAL dtpcInitDll()
{            
    
	unsigned int status;

	dtpcMessWnd = (HWND)NULL;
	_dtpcMessageWindow(dtpcInst);
	_dtpcOutMessWindow(10,1,"Looking for modules.  Please wait.");


	if(_dtpcFindModules())
		{
		LockData(0);
	   dtpcDllReady = TRUE;
		status = DLL_SUCCESS;
		}
	else
		status = DLL_FAILURE;

	_dtpcKillMessageWindow();
	return(status);

}

__export PASCAL dtpcCloseDll()
{
	

	if(dtpcDllReady)
		{
		for(module_index=0;module_index<4;module_index++)
			if(DTC.base)
				_dtpcPutCommand(MODULE_reset);
		UnlockData(0);
		dtpcDllReady = FALSE;
		}
		return(1);
}

void _dtpcSetTimeoutTicks(int ticks)
{
	dtpcTicks = GetTickCount()+ticks;
}

void _dtpcSetTimeout(int secs)
{
	dtpcTicks = GetTickCount()+(secs*WINDOWS_TPS);
}

int _dtpcCheckTimeout()
{
	unsigned long curr_ticks;
	
	curr_ticks = GetTickCount();
	if((curr_ticks & 0x80000000) && ((dtpcTicks & 0x80000000) == 0))
		return(false);
	if(dtpcTicks > curr_ticks)
		return(false);
	return(true);
}

void    _dtpcWaitTicks(int ticks)
/*int   ticks; */
{
	_dtpcSetTimeoutTicks(ticks);
	while(_dtpcCheckTimeout() == false);
}

/*
 *  common entry code for all functions ...
 */

int _dtpcDllEntry(int mod,int boot_check)
/*int mod; */
/*int boot_check;  */
{
	if(dtpcDllBusy)
		return(DLL_BUSY);
	dtpcDllBusy = true;
	if(num_mod == 0)
		{
		dtpcErrorStatus = ERROR_no_modules;
		return(DLL_FAILURE);
		}
	if(mod >= num_mod)
		{
		dtpcErrorStatus = ERROR_no_module;
		return(DLL_FAILURE);
		}
	module_index = mod;
	if(boot_check)
		{
		if(DTC.id != ID_kernel)
			{
			DTC.error_status = ERROR_bad_mode;
			return(DLL_FAILURE);
			}
		}
	_dtpcSetStatus();
	return(DLL_SUCCESS);
}

int _dtpcDllExit(int status)
/*int status; */
{
	dtpcDllBusy = false;
	if(status == DLL_FAILURE)
		dtpcTotalErrors += 1;
	return(status);
}

/*
 *  Convert the latest error status to a string ...
 */

char    _far *ErrorStrings[] =   {

	"No current error",
	"Status timeout",
	"Dma timeout",                  
	"Cmd timeout",                  
	"Bad command",                  
	"No module",                    
	"Bad mode",                             
	"Flush timeout",                
	"No modules",                   
	"File format",                  
	"Too many fixups",              
	"Kernel too big",                       
	"No init",                                      
	"Send load",                            
	"Dma address",                          
	"Load image",                           
	"No status",                            
	"No start",                                     
	"No start address",     
	"Kernel start",                 
	"No Cmd sync",                          
	"No Dma sync",                          
	"Bad alloc",                            
	"Bad file read",                        
	"Boot mode",                            
	"No memory",                            
	"Bad file",                                     
	"No file",
	"Failure to lock memory"
};

void FAR PASCAL _dtpcCenter(HWND hWnd)
/*HWND hWnd; */
{
	POINT pt;
	RECT swp;
	RECT rParent;
	int iwidth;
	int iheight;
	HWND    hWndc;

	hWndc = GetDesktopWindow();
	GetWindowRect(hWnd, &swp);
	GetClientRect(hWndc, &rParent);

	iwidth = swp.right - swp.left;
	iheight = swp.bottom - swp.top;

	pt.x = (rParent.right - rParent.left) / 2;
	pt.y = (rParent.bottom - rParent.top) / 2;
	ClientToScreen(hWndc, &pt);

	pt.x = pt.x - (iwidth / 2);
	pt.y = pt.y - (iheight / 2);
	MoveWindow(hWnd, pt.x, pt.y, iwidth, iheight, FALSE);
}

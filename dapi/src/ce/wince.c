/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
 *    © Digital Equipment Corporation 1996-1998. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:    wince.c
 *    Author:       Michael Garufi
 *    Creation Date:01/01/98
 *
 *    
 *    Functionality:
 *    Windows CE only support
 *
 ***********************************************************************
 *    Revision History:                    
 *
 *  Rev Who     Date        	Description
 *  --- -----   ----------- 	---------------------------------------
 *  001	MFG		01/08/1999		Added WideStringtoAsciiString() function
 *	002 MFG		03/23/1999		Added _beginthreadex and _endthreadex for WinCE 211
 *	003	MFG		03/22/1999		Modified the timeGetTime function
 *	004 MFG		03/15/1999		Omitted verous WinCE 211 calls that are now 
 *								included in the microsoft SDK for 211
 *	005 MFG		07/27/1999		added a version of calloc because it's not supported unde WinCE 
 *	006 MFG		07/30/1999		defined _beginthreadex and _endthreadex for all of WinCE
 *	007 MFG		06/30/2000		added new defined(_WIN32_WCE_PSPC) for palm 211 support
 *	008 MFG		09/07/2000		added palm 211 support
 *	009 MFG		10/10/2000		added Pocket PC support
 *	010 CAB		10/16/2000		Changed copyright info
 *	011 MFG		12/21/2000		fixed warnings
 *	012 CAB		02/23/2001		Updated copyright info
 *	013 MGS		05/09/2001		Some VxWorks porting BATS#972
 *	014	MFG		05/29/2001		Included dectalkf.h
 *  015 CAB		06/07/2001		Add port.h
 *	016	MFG		12/10/2001		Added SMARTMEDIA SUPPORT
 *	017	MFG		03/08/2002		Added CUP28PROJECT Support
 *  018 MFG		07/10/2002		Merged into code changes needed for the Mitsubishi CE/SH4 Project
 *	019	CAB		08/07/2002		Updated copyright info
 *	020	MFG		10/08/2002		Modified to make it esy to read
 *****************************************************************************/

#ifdef UNDER_CE
#include "dectalkf.h"
#include "port.h"

#include <stdio.h>
#include <windows.h>
#include <mmsystem.h>
#include "cemm.h"


#ifdef CUP28PROJECT
#define _WIN32_WCE_PSPC
#endif


#ifndef SMARTMEDIA
#ifndef CUP28PROJECT
#if	(UNDER_CE != 200)
#include <wce.h>
#endif
#endif
#endif

#if defined(_WIN32_WCE) && (_WIN32_WCE == 200)
#define WINCE200
#endif

#if defined(_WIN32_WCE) && (_WIN32_WCE == 211) && !defined(_WIN32_WCE_PSPC)
#define WINCE211PRO
#endif

#if defined(_WIN32_WCE) && (_WIN32_WCE == 300)
#define WINCE300
#endif
 
#if defined(_WIN32_WCE) && (_WIN32_WCE == 211) && defined(_WIN32_WCE_PSPC)
#define WINCE211PALM
#endif





extern unsigned long __cdecl  _beginthreadex(void *security, unsigned stack_size, 
                                  unsigned (__stdcall *start_address)(void *),
                                  void *arglist, unsigned initflag, 
                                  unsigned *thrdaddr)
{
	return (unsigned long)CreateThread((LPSECURITY_ATTRIBUTES)security, 
		                                (DWORD)stack_size,
		                                (LPTHREAD_START_ROUTINE)start_address, 
									    (LPVOID)arglist, 
									    (DWORD)initflag, 
									   (LPDWORD)thrdaddr);
}

extern void __cdecl  _endthreadex(unsigned nExitCode)
{
	ExitThread((DWORD)nExitCode);
}



void WideStringtoAsciiString(char *cString, wchar_t *wString,unsigned int dest_size) 
{

unsigned int cnt, loc = 0;


	if ( lstrlen(wString) >  (dest_size *2))	
	{
#ifdef DEBUG
#ifdef UNDER_CE
	MessageBox(NULL,TEXT("Wide to Ascii string conversion failed!"), TEXT("DECtalk Error"), MB_OK);
#else
	MessageBox(NULL,"Wide to Ascii string conversion failed!", "DECtalk Error", MB_OK);
#endif
#endif
	return;
	}


 for (cnt = 0; (wString[cnt] & 0x00FF); cnt += 1) {
 cString[loc] = (char) (wString[cnt] & 0x00FF);
 loc++;
 }
 cString[loc] = '\0';

}



long time(long *timer) {
	SYSTEMTIME time;
	DWORD rettime;

	GetLocalTime(&time);
	rettime = time.wSecond + (time.wMinute * 60);		// Seconds and minutes
	rettime += (time.wHour * 60 * 60);					// Hours
	rettime += (time.wDay * 24 * 60 * 60);				// Day of month
	rettime += (time.wMonth * 31 * 24 * 60 * 60);		// Month
	rettime += (time.wYear * 52 * 31 * 24 * 60 * 60);	// Year
	if (timer != NULL)	*timer = rettime;
	return rettime;
}



#if defined(WINCE200) || defined(WINCE211PALM)

int printf(const char *fmt, ...) {
	return 0;
}

int __cdecl  fcloseall(void) {
	return 0;
}


int fprintf(FILE *file, const char *format, ...) {
	return 0;
}

int __cdecl fputc(int chr, FILE *file) {
	return chr;
}

int __cdecl fputs(const char *str, FILE *file) {
	return 0;
}

size_t __cdecl fwrite(const void *buff, size_t chunk, size_t count, FILE *file) {
	return 0;
}

#endif 



#if defined(WINCE211PALM) || defined(WINCE200)


#define _FILE_DEFINED	// KSB - My own FILE routines





#if defined(WINCE200) || defined(WINCE300)
int __cdecl fclose(FILE *file) {
#else
extern int fclose(FILE *file) {
#endif

	CloseHandle((DT_HANDLE) file->handle);
	free(file);
	return 0;
}





#if defined(WINCE200)
int toupper(int c) {
	if (c >= 'a' && c <= 'z') {
		return ((c - 'a') + 'A');
	}
	return c;
}
#endif


//#ifndef WINCE211PRO

FILE* __cdecl fopen(const char *filename, const char *mode) {
	FILE *temp;
	unsigned short fname[255];
	int cnt;

	for (cnt = 0; cnt < (int)strlen(filename); cnt++) {
		fname[cnt] = (short) filename[cnt];
	}
	fname[cnt] = 0;

	if (mode[0] != 'r')	return NULL;
	temp = malloc(sizeof(FILE));
	if (temp == NULL)	return NULL;

	strcpy(temp->filename,filename);
	temp->filemap = NULL;
	temp->mappedarea = NULL;
	temp->_flag = 0;
	temp->handle = (DT_HANDLE) CreateFile(fname, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
	if ((DT_HANDLE) temp->handle == INVALID_HANDLE_VALUE) {
		free(temp);
		return NULL;
	}
	return temp;
}



size_t __cdecl fread(void *buff, size_t chunk, size_t count, FILE *file) {
	DWORD read;

	ReadFile((DT_HANDLE) file->handle, buff, count * chunk, &read, NULL);
	if (read == 0) {
		file->_flag = _IOEOF;
		return 0;
	}
	return count;
}



int __cdecl  fseek(FILE *stream, long offset, int origin) {
	return 0;
}


void* MapFile(FILE *stream) {
	DT_HANDLE FileMap;
	LPVOID ret;

	if (stream == NULL || stream->handle == NULL) {
#ifdef DEBUG
		MessageBox(NULL,TEXT("Invalid File Handle"),TEXT("WinCE"),MB_OK);
#endif
		return NULL;
	}
	if (stream->filemap != NULL) {
#ifdef DEBUG
		MessageBox(NULL,TEXT("File Map Already Open"),TEXT("WinCE"),MB_OK);
#endif
		return NULL;
	}
	FileMap = CreateFileMapping((DT_HANDLE) stream->handle, NULL, PAGE_READONLY, 0, 0, NULL);
	if (FileMap == NULL) {
		DWORD err = GetLastError();
		unsigned short data[512];
#ifdef DEBUG
		swprintf(data, TEXT("CreateFileMapping Failed Err: %d"), err);
		MessageBox(NULL,data,TEXT("WinCE"),MB_OK);
#endif
		return NULL;
	}
	stream->filemap = (void*) FileMap;
	ret = MapViewOfFile(FileMap, FILE_MAP_READ, 0, 0, 0);
	if (ret == NULL) {
#ifdef DEBUG
		MessageBox(NULL,TEXT("Failed MapViewOfFile"),TEXT("WinCE"),MB_OK);
#endif
		CloseHandle(FileMap);
		stream->filemap = NULL;
	}
	stream->mappedarea = ret;
	return ret;
}

void UnmapFile(FILE *stream) {
	if (stream->filemap == NULL)	return;
	UnmapViewOfFile(stream->mappedarea);
	CloseHandle(stream->filemap);
	stream->filemap = NULL;
	stream->mappedarea = NULL;
	return;
}

//#endif //wince211
#endif //defined(WINCE211PALM) || defined(WINCE200)



#ifdef WINCE200

int sprintf(char *dest, const char *fmt, ...) {
	strcpy(dest, fmt);	
	return strlen(dest);
}

#endif //UNDER_CE==200




#if defined(WINCE211PALM) || defined(WINCE200) || defined(WINCE211PRO)

void* calloc(size_t chunk, size_t count) {

void *p;

	p = malloc(chunk * count);
	
	if(p == NULL)
		return 0;

	memset(p,0,(chunk * count));

	return p;
}


int isprint(int c) {
	if (c > 32 && c < 128)	return 1;
	return 0;
}



int _stricmp(const char *string1, const char *string2) {
	int cnt;

	for (cnt = 0; cnt < ((int)strlen(string1)); cnt++) 
	{


		if (toupper(string1[cnt]) != toupper(string2[cnt]))	return 1;


	}
	if (cnt != ((int)strlen(string2)))		return 1;
	return 0;
}



int isdigit(int c) {
	if (c >= '1' && c <= '0')	return 1;
	return 0;
}
#endif // defined(WINCE211PALM) || defined(WINCE200) || defined(WINCE200PRO)


void _assert(int expression) {
	return;
}



DWORD timeGetTime(void) {
	return (GetTickCount());
}


/*	This funtion should work but milliseconds is not supported yet mfg 26-jul-1999
DWORD timeGetTime(void) {

	SYSTEMTIME time;
	DWORD rettime;

	GetSystemTime(&time);

	rettime = (time.wMilliseconds);	// get milliseconds

	return rettime;
}
*/


MMRESULT mmioDescend(HMMIO hmmio, LPMMCKINFO lpck, LPMMCKINFO lpckParent, UINT wFlags) {
	return 0;
}

MMRESULT mmioAscend(HMMIO hmmio, LPMMCKINFO lpck, LPMMCKINFO lpckParent, UINT wFlags) {
	return 0;
}

LONG mmioRead(HMMIO hmmio, HPSTR pch, LONG cch) {
	return 0;
}

HMMIO mmioOpen(char* szFilename, LPMMIOINFO lpmmioinfo, long dwOpenFlags) {
	return NULL;
}

MMRESULT mmioClose(HMMIO hmmio, UINT wFlags) {
	return 0;
}

#endif	// UNDER_CE


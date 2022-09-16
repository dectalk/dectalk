/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996-1998. All rights reserved.
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
 *
 *****************************************************************************/


#ifdef UNDER_CE

#include <stdio.h>
#include <windows.h>
#include <mmsystem.h>
#include "cemm.h"




extern unsigned long _beginthreadex(void *security, unsigned stack_size, 
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

extern void _endthreadex(unsigned nExitCode)
{
	ExitThread((DWORD)nExitCode);
}


void WideStringtoAsciiString(char *cString, wchar_t *wString,unsigned int dest_size) 
{

unsigned int cnt, loc = 0;


	if ( lstrlen(wString) >  (dest_size *2))	
	{
#ifdef UNDER_CE
	MessageBox(NULL,TEXT("Wide to Ascii string conversion failed!"), TEXT("DECtalk Error"), MB_OK);
#else
	MessageBox(NULL,"Wide to Ascii string conversion failed!", "DECtalk Error", MB_OK);
#endif
	return;
	}


 for (cnt = 0; (wString[cnt] & 0x00FF); cnt += 1) {
 cString[loc] = (char) (wString[cnt] & 0x00FF);
 loc++;
 }
 cString[loc] = '\0';

}



time_t time(time_t *timer) {
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


#if (UNDER_CE == 200)

int printf(const char *fmt, ...) {
	return 0;
}

int sprintf(char *dest, const char *fmt, ...) {
	strcpy(dest, fmt);	
	return strlen(dest);
}

int toupper(int c) {
	if (c >= 'a' && c <= 'z') {
		return ((c - 'a') + 'A');
	}
	return c;
}

#endif //UNDER_CE==200



void* calloc(size_t chunk, size_t count) {

void *p;

	p = malloc(chunk * count);
	
	if(p == NULL)
		return 0;

	memset(p,0,(chunk * count));

	return p;
}



void _assert(int expression) {
	return;
}

int isprint(int c) {
	if (c > 32 && c < 128)	return 1;
	return 0;
}



int _stricmp(const char *string1, const char *string2) {
	int cnt;

	for (cnt = 0; cnt < strlen(string1); cnt++) {
		if (toupper(string1[cnt]) != toupper(string2[cnt]))	return 1;
	}
	if (cnt != strlen(string2))		return 1;
	return 0;
}


/* FILE* structure 
 *	char filename[16];
 *	void* handle;
 */

#if (UNDER_CE == 200)

FILE* fopen(const char *filename, const char *mode) {
	FILE *temp;
	unsigned short fname[255];
	int cnt;

	for (cnt = 0; cnt < strlen(filename); cnt++) {
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
	temp->handle = (HANDLE) CreateFile(fname, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
	if ((HANDLE) temp->handle == INVALID_HANDLE_VALUE) {
		free(temp);
		return NULL;
	}
	return temp;
}

int fclose(FILE *file) {
	CloseHandle((HANDLE) file->handle);
	free(file);
	return 0;
}



int fcloseall(void) {
	return 0;
}

int fprintf(FILE *file, const char *format, ...) {
	return 0;
}

int fputc(int chr, FILE *file) {
	return chr;
}

int fputs(const char *str, FILE *file) {
	return 0;
}
#endif //UNDER_CE==200


#if UNDER_CE == 200

size_t fread(void *buff, size_t chunk, size_t count, FILE *file) {
	DWORD read;

	ReadFile((HANDLE) file->handle, buff, count * chunk, &read, NULL);
	if (read == 0) {
		file->_flag = _IOEOF;
		return 0;
	}
	return count;
}


size_t fwrite(const void *buff, size_t chunk, size_t count, FILE *file) {
	return 0;
}

int fseek(FILE *stream, long offset, int origin) {
	return 0;
}


void* MapFile(FILE *stream) {
	HANDLE FileMap;
	LPVOID ret;

	if (stream == NULL || stream->handle == NULL) {
		MessageBox(NULL,_TEXT("Invalid File Handle"),_TEXT("WinCE"),MB_OK);
		return NULL;
	}
	if (stream->filemap != NULL) {
		MessageBox(NULL,_TEXT("File Map Already Open"),_TEXT("WinCE"),MB_OK);
		return NULL;
	}
	FileMap = CreateFileMapping((HANDLE) stream->handle, NULL, PAGE_READONLY, 0, 0, NULL);
	if (FileMap == NULL) {
		DWORD err = GetLastError();
		unsigned short data[512];
		swprintf(data, _TEXT("CreateFileMapping Failed Err: %d"), err);
		MessageBox(NULL,data,_TEXT("WinCE"),MB_OK);
		return NULL;
	}
	stream->filemap = (void*) FileMap;
	ret = MapViewOfFile(FileMap, FILE_MAP_READ, 0, 0, 0);
	if (ret == NULL) {
		MessageBox(NULL,_TEXT("Failed MapViewOfFile"),_TEXT("WinCE"),MB_OK);
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
#endif //UNDER_CE==200

int isdigit(int c) {
	if (c >= '1' && c <= '0')	return 1;
	return 0;
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


// waveplay.cpp : implementation file
//

#include "stdafx.h"
#include "ctitest.h"
#include "waveplay.h"

#include <mmsystem.h>
#include <mmreg.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/* WAVEPLAY class */

WavePlay::WavePlay() {
	online = FALSE;

	waveHeader[0].dwFlags = WHDR_DONE;
	waveHeader[1].dwFlags = WHDR_DONE;
	waveHeader[0].lpData = NULL;
	waveHeader[1].lpData = NULL;

	format.wFormatTag = WAVE_FORMAT_PCM;
	format.cbSize = 0;
	format.nSamplesPerSec = 11025;
	format.nChannels = 1;
	format.wBitsPerSample = 16;
	format.nBlockAlign = (format.nChannels * format.wBitsPerSample) / 8;
	format.nAvgBytesPerSec = format.nBlockAlign * format.nSamplesPerSec;

	result = waveOutOpen(&waveout, WAVE_MAPPER, &format, NULL, 0, CALLBACK_NULL);
	if (result == MMSYSERR_NOERROR)		online = TRUE;
	HeaderSelect = 0;
	return;
}

WavePlay::~WavePlay() {
	if (online == FALSE)	return;
	if (waveHeader[0].lpData != NULL)	free(waveHeader[0].lpData);
	if (waveHeader[1].lpData != NULL)	free(waveHeader[1].lpData);
	waveOutClose(waveout);
	return;
}

int WavePlay::Play(LPSTR data, unsigned long int size) {
	if (online == FALSE)	return 0xFF;

	if ((waveHeader[HeaderSelect].dwFlags & WHDR_DONE) == 0) {
		HeaderSelect = (HeaderSelect+1) & 0x01;
	}
	if ((waveHeader[HeaderSelect].dwFlags & WHDR_DONE) == 0) {
		while (((waveHeader[0].dwFlags & WHDR_DONE) == 0) && ((waveHeader[1].dwFlags & WHDR_DONE) == 0))	Sleep(100);
		if (waveHeader[0].dwFlags & WHDR_DONE == 0)		HeaderSelect = 1;
		else											HeaderSelect = 0;
	}
	if (waveHeader[HeaderSelect].lpData != NULL)	free(waveHeader[HeaderSelect].lpData);
	waveHeader[HeaderSelect].lpData = (char*) malloc(size);
	if (waveHeader[HeaderSelect].lpData == NULL)	return 0xFF;
	memcpy(waveHeader[HeaderSelect].lpData, data, size);
	waveHeader[HeaderSelect].dwBufferLength = size;
	waveHeader[HeaderSelect].dwFlags = 0;

	result = waveOutPrepareHeader(waveout, &waveHeader[HeaderSelect], sizeof(waveHeader[HeaderSelect]));
	if (result != MMSYSERR_NOERROR)		return 0xFF;
	result = waveOutWrite(waveout, &waveHeader[HeaderSelect], sizeof(waveHeader[HeaderSelect]));
	if (result != MMSYSERR_NOERROR)		return 0xFF;
	return HeaderSelect;
}

BOOL WavePlay::Pause(void) {
	if (online == FALSE)	return FALSE;
	return FALSE;
}

BOOL WavePlay::Unpause(void) {
	if (online == FALSE)	return FALSE;
	return FALSE;
}

BOOL WavePlay::Stop(void) {
	if (online == FALSE)	return FALSE;
	waveOutReset(waveout);
	waveHeader[0].dwFlags = WHDR_DONE;
	waveHeader[1].dwFlags = WHDR_DONE;
	return TRUE;
}

BOOL WavePlay::Sync(int select) {
	if (online == FALSE)	return FALSE;

	if (select == 2) {
		while (((waveHeader[0].dwFlags & WHDR_DONE) == 0) && ((waveHeader[1].dwFlags & WHDR_DONE) == 0))	Sleep(100);
		return TRUE;
	}
	while ((waveHeader[select].dwFlags & WHDR_DONE) == 0)		Sleep(100);
	return TRUE;
}

BOOL WavePlay::Done(int select) {
	if (online == FALSE)	return FALSE;

	if (select == 2) {
		if (((waveHeader[0].dwFlags & WHDR_DONE) == 0) && ((waveHeader[1].dwFlags & WHDR_DONE) == 0)) {
			return FALSE;
		}
		return TRUE;
	}
	if ((waveHeader[select].dwFlags & WHDR_DONE) != 0)		return TRUE;
	return FALSE;
}

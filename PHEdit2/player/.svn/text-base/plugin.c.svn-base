/* Plugin sample source file */

#include <stdio.h>
#include <string.h>
#include <windows.h>

#include "..\phedit2\plugin.h"
#include "mmsystem.h"

BOOL Init(PHEdit2PlugIn *plugin) {
	strcpy(plugin->Name, "Sound Player Plug-in Module");
	strcpy(plugin->Manufacturer, "Digital Equipment Corp");
	plugin->PlugInPosition = PLUGIN_PLAYER;
	plugin->userData = NULL;
	return TRUE;
}

BOOL Config(PHEdit2PlugIn *plugin) {
	return TRUE;
}

BOOL Render(PHEdit2PlugIn *plugin) {
	/* Open a wave output device */
	HWAVEOUT waveout;
	WAVEFORMATEX format;
	WAVEHDR waveHeader;
	MMRESULT result;

	waveHeader.dwFlags = WHDR_DONE;
	format.wFormatTag = WAVE_FORMAT_PCM;
	format.cbSize = 0;
	format.nSamplesPerSec = 11050;
	format.nChannels = 1;
	format.wBitsPerSample = 16;
	format.nBlockAlign = (format.nChannels * format.wBitsPerSample) / 8;
	format.nAvgBytesPerSec = format.nBlockAlign * format.nSamplesPerSec;

	result = waveOutOpen(&waveout, WAVE_MAPPER, &format, (long) NULL, 0, CALLBACK_NULL);
	if (result != MMSYSERR_NOERROR)		return FALSE;

	/* Play audio */

	waveHeader.lpData = (LPSTR) plugin->waveformData;
	waveHeader.dwBufferLength = plugin->waveformSize;
	waveHeader.dwFlags = 0;
	
	result = waveOutPrepareHeader(waveout, &waveHeader, sizeof(waveHeader));
	if (result != MMSYSERR_NOERROR)		return FALSE;
	result = waveOutWrite(waveout, &waveHeader, sizeof(waveHeader));
	if (result != MMSYSERR_NOERROR)		return FALSE;
	while ((waveHeader.dwFlags & WHDR_DONE) == 0)	Sleep(500);

	/* Close audio */
	waveOutReset(waveout);
	waveOutClose(waveout);

	return TRUE;
}

BOOL Quit(PHEdit2PlugIn *plugin) {
	return TRUE;
}

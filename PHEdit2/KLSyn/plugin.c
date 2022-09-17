/* Plugin sample source file */

#include <stdio.h>
#include <string.h>
#include <windows.h>

#include "..\phedit2\plugin.h"
#include "mmsystem.h"
#include "ttsapi.h"

/* From PHROM.C: */
extern short            featb[], place[];
extern short            begtyp[];
extern short            endtyp[];
extern short            inhdr[];	   /* Used with durfon to shrink tran durs */
extern short			mindur[];
extern short            burdr[];	   /* List of burst durs in msec for plosives */
extern short            ptram[];	   /* Pointer into array parallel amps for frics */
extern short            plocu[];	   /* Pointer into above table */
extern short			f0segtars[];
extern short			maltar[];
extern short			maldip[];
extern short			femtar[];
extern short			femdip[];
extern short			maleloc[];
extern short			femloc[];
extern short			malamp[];
extern short			femamp[];
/* Base Phoneme Information */
extern short			f0glstp[];
extern short			f0_phrase_position[];
extern short			f0_stress_level[];

extern short TOT_ALLOPHONES;

void BuildROMData(phone_type_struct *base, phonemic_struct *newphone, U16 newphoneId);


LPTTS_HANDLE_T phTTS;
void TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg);

typedef struct {
	LPTTS_HANDLE_T phTTS;
	PHEdit2PlugIn *plugin;
	LPSTR data;
	U32 dataSize;
} PlugInData;

PlugInData pluginData;

BOOL Init(PHEdit2PlugIn *plugin) {
	char temp[512];
	MMRESULT result;

#ifdef ENGLISH_US
	strcpy(plugin->Name, "DECtalk US Plug-in Module");
#endif
#ifdef ENGLISH_UK
	strcpy(plugin->Name, "DECtalk UK Plug-in Module");
#endif
#ifdef GERMAN
	strcpy(plugin->Name, "DECtalk GR Plug-in Module");
#endif
#ifdef SPANISH_LA
	strcpy(plugin->Name, "DECtalk LA Plug-in Module");
#endif
#ifdef SPANISH_SP
	strcpy(plugin->Name, "DECtalk SP Plug-in Module");
#endif
	strcpy(plugin->Manufacturer, "Digital Equipment Corp");
	plugin->PlugInPosition = PLUGIN_KLSYN;
	plugin->userData = NULL;
	if ((result = TextToSpeechStartupEx(&phTTS, WAVE_MAPPER, DO_NOT_USE_AUDIO_DEVICE, TTSCallbackRoutine, (LONG) &pluginData)) != MMSYSERR_NOERROR) {
		sprintf(temp, "%08X: %d",phTTS, result);
		phTTS = NULL;
		MessageBox(NULL, temp, "KLSYN", MB_OK);
		return FALSE;
	}
	if (TextToSpeechOpenInMemory(phTTS, WAVE_FORMAT_1M16) != MMSYSERR_NOERROR) {
		TextToSpeechShutdown(phTTS);
		phTTS = NULL;
		return FALSE;
	}
	pluginData.phTTS = phTTS;
	return TRUE;
}

BOOL Config(PHEdit2PlugIn *plugin) {
	pluginData.plugin = plugin;
	MessageBox(NULL, "No configuration available", "KLSYN Plug-In", MB_OK);
	return TRUE;
}

BOOL Render(PHEdit2PlugIn *plugin) {
	char str[500];
	char phones[3][50];
	TTS_BUFFER_T buffer;
	TTS_INDEX_T indexes;
	int voice = plugin->voice;
	char voices[9][3] = {"p", "b", "h", "d", "f", "k", "u", "r", "w"};
	
	if (phTTS == NULL)					return FALSE;
	if (plugin->waveformData != NULL)	free(plugin->waveformData);
	plugin->waveformData = NULL;
	pluginData.plugin = plugin;
	TextToSpeechReset(phTTS, FALSE);
	buffer.lpData = malloc(4096);
	buffer.lpPhonemeArray = 0;
	buffer.lpIndexArray = &indexes;
	buffer.dwMaximumBufferLength = 4096;
	buffer.dwMaximumNumberOfPhonemeChanges = 0;
	buffer.dwMaximumNumberOfIndexMarks = 1;
	buffer.dwBufferLength = 0;
	buffer.dwNumberOfPhonemeChanges = 0;
	buffer.dwNumberOfIndexMarks = 0;
	TextToSpeechAddBuffer(phTTS, &buffer);
	pluginData.dataSize = 0;
	pluginData.data = NULL;
	if (plugin->prestress)	sprintf(phones[0],"'%02d", plugin->pre_phone);
	else					sprintf(phones[0],"%02d", plugin->pre_phone);
	if (plugin->stress)		sprintf(phones[1],"'%02d", plugin->phone);
	else					sprintf(phones[1],"%02d", plugin->phone);
	if (plugin->poststress)	sprintf(phones[2],"'%02d", plugin->post_phone);
	else					sprintf(phones[2],"%02d", plugin->post_phone);

	BuildROMData(plugin->base, plugin->CurrentPhone, (U16) plugin->phone);

	sprintf(str, "[:phon arpa on][:n%s][:dv gv 60][00][%s][%s][%s][:i m 1][:sync]", voices[voice], phones[0], phones[1], phones[2]);
	TextToSpeechSpeak(phTTS, str, TTS_FORCE);
	TextToSpeechSync(phTTS);
	TextToSpeechReset(phTTS, FALSE);
	plugin->waveformData = (S16*) pluginData.data;
	plugin->waveformSize = (U32) pluginData.dataSize;
	return TRUE;
}

BOOL Quit(PHEdit2PlugIn *plugin) {
	TextToSpeechCloseInMemory(phTTS);
	TextToSpeechShutdown(phTTS);
	phTTS = NULL;
	pluginData.plugin = NULL;
	pluginData.phTTS = NULL;
	return TRUE;
}

void TTSCallbackRoutine(LONG lParam1, LONG lParam2, DWORD dwInstanceParam, UINT uiMsg) {
	U16 BufferMessage = RegisterWindowMessage("DECtalkBufferMessage");
	PlugInData *plug = (PlugInData*) dwInstanceParam;
	LPTTS_BUFFER_T buffer = (LPTTS_BUFFER_T) lParam2;
	
	if (uiMsg == BufferMessage) {
		plug->dataSize += buffer->dwBufferLength;
		plug->data = realloc(plug->data, plug->dataSize);
		memcpy(plug->data + (plug->dataSize - buffer->dwBufferLength), buffer->lpData, buffer->dwBufferLength);
		if (buffer->dwNumberOfIndexMarks != 1) {
			TextToSpeechAddBuffer(phTTS, buffer);
		}
	}		
	return;
}

U16 NumberOfDips(diphthong_struct *dip) {
	U16 cnt = 0;

	while (dip->diph_tm[cnt] >= 0 && cnt < MAX_DIPHTHONGS)	cnt++;
	return cnt + 1;
}

void BuildROMData(phone_type_struct *base, phonemic_struct *newphone, U16 newphoneId) {
	int pho;
	int cur_dipptr;
	int formant;
	int tar, amp, hasamp;
	phonemic_struct *phstruc;

	/* inhdr, mindur, burdr, f0segtars, begtyp, endtyp, place, featb */
	for (pho = 0; pho < base->phoneme_count; pho++) {
		if (pho == newphoneId) {
			inhdr[pho] = newphone->inhdr;
			mindur[pho] = newphone->inhdr;
			burdr[pho] = newphone->burdur;
			f0segtars[pho] = newphone->f0segtars;
			begtyp[pho] = newphone->begtype + 1;
			endtyp[pho] = newphone->endtype + 1;
			place[pho] = (S16) newphone->place;
			featb[pho] = (S16) newphone->featb;
		} else {
			inhdr[pho] = base->phonemes[pho].inhdr;
			mindur[pho] = base->phonemes[pho].mindur;
			burdr[pho] = base->phonemes[pho].burdur;
			f0segtars[pho] = base->phonemes[pho].f0segtars;
			begtyp[pho] = base->phonemes[pho].begtype + 1;
			endtyp[pho] = base->phonemes[pho].endtype + 1;
			place[pho] = (S16) base->phonemes[pho].place;
			featb[pho] = (S16) base->phonemes[pho].featb;
		}
	}

	/* maltar, femtar */
	cur_dipptr = 2;
	tar = 0;
	for (formant = 0; formant < 3; formant++) {				// F1 - F3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			if (pho == newphoneId)		phstruc = newphone;
			else						phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				maltar[tar] = -(cur_dipptr);
				femtar[tar] = -(cur_dipptr);
				cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
			} else {
				maltar[tar] = phstruc->diphthongs[formant].diph[0];
				femtar[tar] = phstruc->diphthongs[formant].diph[0];
			}
			tar++;
		}
	}
	for (formant = 4; formant < 7; formant++) {				// B1 - B3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			if (pho == newphoneId)		phstruc = newphone;
			else						phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				maltar[tar] = -(cur_dipptr);
				femtar[tar] = -(cur_dipptr);
				cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
			} else {
				maltar[tar] = phstruc->diphthongs[formant].diph[0];
				femtar[tar] = phstruc->diphthongs[formant].diph[0];
			}
			tar++;
		}
	}

	formant = 8;	// AV
	for (pho = 0; pho < base->phoneme_count; pho++) {		// AV
		if (pho == newphoneId)		phstruc = newphone;
		else						phstruc = &base->phonemes[pho];
		if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
			maltar[tar] = -(cur_dipptr);
			femtar[tar] = -(cur_dipptr);
			cur_dipptr += (NumberOfDips(&phstruc->diphthongs[formant]) * 2);
		} else {
			maltar[tar] = phstruc->diphthongs[formant].diph[0];
			femtar[tar] = phstruc->diphthongs[formant].diph[0];
		}
		tar++;
	}

	/* maldip, femdip */
	cur_dipptr = 2;
	for (formant = 0; formant < 3; formant++) {				// F1 - F3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			if (pho == newphoneId)		phstruc = newphone;
			else						phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				tar = 0;
				do {
					maldip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					maldip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					femdip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					femdip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					cur_dipptr += 2;
					tar++;
				} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
			}
		}
	}
	for (formant = 4; formant < 7; formant++) {				// B1 - B3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			if (pho == newphoneId)		phstruc = newphone;
			else						phstruc = &base->phonemes[pho];
			if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
				tar = 0;
				do {
					maldip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					maldip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					femdip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
					femdip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
					cur_dipptr += 2;
					tar++;
				} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
			}
		}
	}
	formant = 8;		// AV
	for (pho = 0; pho < base->phoneme_count; pho++) {		// AV
		if (pho == newphoneId)		phstruc = newphone;
		else						phstruc = &base->phonemes[pho];
		if (phstruc->diphthongs[formant].diph_tm[0] >= 0) {
			tar = 0;
			do {
				maldip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
				maldip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
				femdip[cur_dipptr] = phstruc->diphthongs[formant].diph[tar];
				femdip[cur_dipptr+1] = phstruc->diphthongs[formant].diph_tm[tar];
				cur_dipptr += 2;
				tar++;
			} while (phstruc->diphthongs[formant].diph_tm[tar-1] >= 0 && tar < 10);
		}
	}

	/* ptram */
	cur_dipptr = 1;
	tar = 0;
	for (pho = 0; pho < base->phoneme_count; pho++) {
		if (pho == newphoneId)		phstruc = newphone;
		else						phstruc = &base->phonemes[pho];
		hasamp = 0;
		for (amp = 0; amp < 5; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		if (hasamp) {
			ptram[tar] = cur_dipptr;
			cur_dipptr += (6 * 5);
		} else {
			ptram[tar] = 0;
		}
		tar++;
	}

	/* malamp, femamp */
	tar = 1;
	for (pho = 0; pho < base->phoneme_count; pho++) {
		if (pho == newphoneId)		phstruc = newphone;
		else						phstruc = &base->phonemes[pho];
		hasamp = 0;
		for (amp = 0; amp < 5; amp++) {
			if (phstruc->amp[amp].a_A2 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A3 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A4 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A5 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_A6 > 0)		hasamp = 1;
			if (phstruc->amp[amp].a_AB > 0)		hasamp = 1;
		}
		if (hasamp) {
			for (amp = 0; amp < 5; amp++) {
				malamp[tar  ] = phstruc->amp[amp].a_A2;
				malamp[tar+1] = phstruc->amp[amp].a_A3;
				malamp[tar+2] = phstruc->amp[amp].a_A4;
				malamp[tar+3] = phstruc->amp[amp].a_A5;
				malamp[tar+4] = phstruc->amp[amp].a_A6;
				malamp[tar+5] = phstruc->amp[amp].a_AB;
				femamp[tar  ] = phstruc->amp[amp].a_A2;
				femamp[tar+1] = phstruc->amp[amp].a_A3;
				femamp[tar+2] = phstruc->amp[amp].a_A4;
				femamp[tar+3] = phstruc->amp[amp].a_A5;
				femamp[tar+4] = phstruc->amp[amp].a_A6;
				femamp[tar+5] = phstruc->amp[amp].a_AB;
				tar += 6;
			}
		}
	}

	/* plocu */
	cur_dipptr = 1;
	tar = 0;
	for (amp = 0; amp < 4; amp++) {		// Front, Back, Round
		for (pho = 0; pho < base->phoneme_count; pho++) {
			if (pho == newphoneId)		phstruc = newphone;
			else						phstruc = &base->phonemes[pho];
			hasamp = 0;
			for (formant = 0; formant < 3; formant++) {			// F1 - F3
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			if (hasamp) {
				plocu[tar] = cur_dipptr;
				cur_dipptr += 3 * 3;		// F1-F3 * (Locus,Percent,Transdur)
			} else {
				plocu[tar] = 0;
			}
			tar++;
		}
	}

	/* maleloc, femloc */
	cur_dipptr = 1;
	tar = 0;
	for (amp = 0; amp < 4; amp++) {			// F1 - F3
		for (pho = 0; pho < base->phoneme_count; pho++) {
			if (pho == newphoneId)		phstruc = newphone;
			else						phstruc = &base->phonemes[pho];
			hasamp = 0;
			for (formant = 0; formant < 3; formant++) {			// Front, Back, Round
				if (phstruc->loc[formant].locus[amp] != -1)	hasamp  = 1;
			}
			if (hasamp) {
				for (formant = 0; formant < 3; formant++) {
					maleloc[cur_dipptr  ] = phstruc->loc[formant].locus[amp];
					maleloc[cur_dipptr+1] = phstruc->loc[formant].percent[amp];
					maleloc[cur_dipptr+2] = phstruc->loc[formant].transdur[amp];
					femloc[cur_dipptr  ] = phstruc->loc[formant].locus[amp];
					femloc[cur_dipptr+1] = phstruc->loc[formant].percent[amp];
					femloc[cur_dipptr+2] = phstruc->loc[formant].transdur[amp];
					cur_dipptr += 3;
				}
			}
		}
	}

	/* f0glstp */
	for (pho = 0; pho < 6; pho++) {
		f0glstp[pho] = base->f0glstp[pho];
	}

	/* f0_stress_level, f0_phrase_position */
	for (pho = 0; pho < 8; pho++) {
		f0_stress_level[pho] = base->f0_stress_level[pho];
		f0_phrase_position[pho] = base->f0_phrase_position[pho];
	}

	TOT_ALLOPHONES = base->phoneme_count;
	return;
}

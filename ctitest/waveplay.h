#if !defined(AFX_WAVEPLAY_H__D88AD7EF_3FE3_11D1_97AB_0000F820934A__INCLUDED_)
#define AFX_WAVEPLAY_H__D88AD7EF_3FE3_11D1_97AB_0000F820934A__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// waveplay.h : header file
//
/* Wave.H - Multimedia Wave Player */
#include <mmsystem.h>
#include <mmreg.h>

class WavePlay {
	public:
		WavePlay();
		~WavePlay();

		int Play(LPSTR data, unsigned long int size);
		BOOL Pause(void);
		BOOL Unpause(void);
		BOOL Stop(void);
		BOOL Sync(int queue);
		BOOL Done(int queue);

	private:
		BOOL online;
		HWAVEOUT waveout;
		WAVEFORMATEX format;
		WAVEHDR waveHeader[2];
		int HeaderSelect;
		MMRESULT result;
};

#endif
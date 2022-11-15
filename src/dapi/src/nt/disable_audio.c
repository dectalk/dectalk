#include "disable_audio.h"

UINT16 waveOutGetNumDevs()
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT32 waveOutGetDevCaps(UINT32 uDeviceID, LPWAVEOUTCAPS lpCaps,
                         UINT32 uSize)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutGetErrorText(UINT16 uError, LPSTR lpText, UINT16 uSize)
{
  LPSTR msgptr;
  if ((lpText == NULL) || (uSize < 1))
    return (FALSE);
  lpText[0] = '\0';

  msgptr = "Audio output has been disabled in this build of DECtalk.\n";

  strncpy(lpText, msgptr, uSize);
  return TRUE;
}

UINT16 waveOutOpen(LPHWAVEOUT lphWaveOut, UINT16 uDeviceID,
                   const LPWAVEFORMATEX lpFormat, void (*dwCallback)(void *, unsigned int, unsigned int, long, long),
                   DWORD dwInstance, DWORD dwFlags)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutClose(HWAVEOUT hWaveOut)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT32 waveOutPrepareHeader(HWAVEOUT hWaveOut,
                            WAVEHDR *lpWaveOutHdr, UINT32 uSize)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT32 waveOutUnprepareHeader(HWAVEOUT hWaveOut,
                              WAVEHDR *lpWaveOutHdr, UINT32 uSize)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT32 waveOutWrite(HWAVEOUT hWaveOut, WAVEHDR *lpWaveOutHdr,
                    UINT32 uSize)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutPause(HWAVEOUT hWaveOut)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutRestart(HWAVEOUT hWaveOut)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutReset(HWAVEOUT hWaveOut)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutGetVolume(HWAVEOUT hWaveOut, LPDWORD pdwVolume)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutSetVolume(HWAVEOUT hWaveOut, DWORD dwVolume)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutGetPosition(HWAVEOUT hWaveOut, LPMMTIME lpTime,
                          UINT16 uSize)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT16 waveOutBreakLoop(HWAVEOUT hWaveOut)
{
  return MMSYSERR_NOTSUPPORTED;
}

UINT32 waveOutGetID(HWAVEOUT hWaveOut, UINT32 *lpuDeviceID)
{
  return MMSYSERR_NOTSUPPORTED;
}

DWORD OSS_wodMessage(UINT16 wDevID, UINT wMsg, unsigned long dwUser,
                     unsigned long dwParam1, unsigned long dwParam2)
{
  return MMSYSERR_NOTSUPPORTED;
}

BOOL16 DriverCallback(void (*dwCallBack)(void *, unsigned int, unsigned int, long int, long int), UINT16 uFlags, HANDLE16 hDev,
                      WORD wMsg, DWORD dwUser, long dwParam1,
                      long dwParam2)
{
  return TRUE;
}

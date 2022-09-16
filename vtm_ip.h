#include "port.h"
extern	S16 d2pole_cf45(S16 *bcoef,S16 *ccoef,S16 frequency,S16 bandwidth,S16 gain);
extern	S16 d2pole_cf123(S16 *bcoef,S16 *ccoef,S16 frequency,S16 bandwidth,S16 gain);
extern	S16 d2pole_pf(S16 *bcoef,S16 *ccoef,S16 frequency,S16 bandwidth,S16 gain);
extern	void speech_waveform_generator(void);
extern	void read_speaker_definition(void);
extern	void InitializeVTM(void);
extern	void SetSampleRate(U16 uiSampRate);
extern	void doit(void);
//extern	S16 main(int argc,char **argv );
//extern	S16 doit(void);

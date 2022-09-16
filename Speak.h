////////////////////////////////////////////////////////////
////
//// speak.h
////
////  1998 Oct. 16  inazumi
////  1998 Nov.  6  H.Matsuoka   change SpkAppend Buffer type to void*
////  1998 Dec. 17  H.Matsuoka   delete BOOL and BYTE
////  1999 Feb. 18  H.Matsuoka   add SpkSoftening()
////  1999 Mar. 10  H.Matsuoka   add SpkSampleRate()
////

#ifndef SPEAK_H
#define SPEAK_H

#define SPK_SAMPLING(CPU_CLOCK,SAMPLING)  (((CPU_CLOCK/SAMPLING)/2)-1)

extern void SpkInit(void);
extern unsigned char *SpkOpen(int Channel, int ReloadValue);
extern int SpkClose(unsigned char *SpkParams);
extern int SpkStart(unsigned char *SpkParams);
extern int SpkHalt(unsigned char *SpkParams);
extern int SpkIsRunning(unsigned char *SpkParams);
extern int SpkRoom(unsigned char *SpkParams);
extern int SpkQueue(unsigned char *SpkParams);
extern int SpkAppend(unsigned char *SpkParams, void *Buffer, int Length);
extern void *SpkOnDone(unsigned char *SpkParams, void *Callback);
extern void *SpkOnEmpty(unsigned char *SpkParams, void *Callback);
extern void *SpkOnNotInTime(unsigned char *SpkParams, void *Callback);
extern void SpkSoftening(short);            
extern void SpkSampleRate(unsigned char *, void *, int);

#endif


#include <stdio.h>
#include <stdlib.h>
#include <string.h>


extern char cinput_array[];


extern int TextToSpeechStart(char *input);

extern int TextToSpeechInit();

extern int TextToSpeechQuit();

extern int TextToSpeechReset();

#ifndef CALLER_ID
extern int TextToSpeechChangeVoice(char *cvoice);
#endif

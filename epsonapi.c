#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kernel.h"
#include "epsonapi.h"

extern void lsmain(void);
extern void usa_main(void);
extern void kltask_init(void);
extern void InitializeVTM(void);
extern struct share_data *kernel_share;

//help #include "AudioMapping.h"

extern int TextToSpeechStart(char *input);
extern int TextToSpeechInit();
extern int TextToSpeechQuit();

extern int TextToSpeechChangeVoice(char *cvoice);

extern char cinput_array[];	//limited TTS length
int *samplesEachPlay;

typedef unsigned char U8;
typedef unsigned int U32;
#define get_long_int(ptr) ((U32)\
                       ((((U8 *)(ptr))[3] << 24)  | \
                        (((U8 *)(ptr))[2] << 16)  | \
                        (((U8 *)(ptr))[1] << 8)  | \
                        (((U8 *)(ptr))[0])))

extern const unsigned char main_dict[];


int TextToSpeechStart(char *input)
{

#ifndef NO_CMD
	int i=0;
#endif

#ifdef NO_CMD
	if (strlen(input)> 126) return 1; /*string length too big*/ //limited TTS length

strcpy (cinput_array,input);
strncat (cinput_array,"#0",2);

#endif

#ifndef OUTPUT_FILE
	AUDIO_OUT_INIT(samplesEachPlay, 8000,2);	//move the init to here so it happens every time you speak - since you may close the audio
//	AUDIO_OUT_INIT(samplesEachPlay,10000,2);	//move the init to here so it happens every time you speak - since you may close the audio
//	AUDIO_OUT_INIT(samplesEachPlay,11025,2);	//move the init to here so it happens every time you speak - since you may close the audio
#endif

	KS.halting=0;	//had to reset the halting flag - since if you halt you want to halt only the one TTS you are on
#ifdef NO_CMD
lsmain(); //sythesis speech
#endif

#ifndef NO_CMD
	while (input[i])
	{
		dtpc_cmd(input[i]);
		i++;
	}
	dtpc_cmd(0x0b);  // force it out.
#endif


#ifndef OUTPUT_FILE
	AUDIO_OUT_QUIT(); // will wait for the audio to finish then close
#endif

return 0;
}


int TextToSpeechInit()
{

	memset(kernel_share,0,sizeof(struct share_data));

	//load main dictionary
	if (main_dict)
	{
	(int)KS.fdic = ((int)(main_dict))+8;
	KS.fdic_entries= get_long_int(main_dict);
	}


	usa_main();
	InitializeVTM();
	kltask_init();
#ifndef NO_CMD
	lsmain();
	cmdmain();
#endif

	KS.halting=0;

return 0;
}


int TextToSpeechQuit()
{

#ifndef OUTPUT_FILE
	AUDIO_OUT_QUIT(); // will wait for the audio to finish then close
#endif

return 0;
}


#ifndef CALLER_ID
int TextToSpeechChangeVoice(char *cvoice)
{
	extern short last_voice;
	short new_voice;

#ifndef OUTPUT_FILE
	AUDIO_OUT_QUIT(); // will wait for the audio to finish then close
#endif

	if (*cvoice != 0)
	{
		  if (strcmp(cvoice,"np")==0) new_voice= 0; /*paul*/
	
	 else if (strcmp(cvoice,"nb")==0) new_voice= 1; /*betty*/
	
	 else if (strcmp(cvoice,"nh")==0) new_voice= 2; /*harry*/

	 else if (strcmp(cvoice,"nf")==0) new_voice= 3; /*frank*/
	
	 else if (strcmp(cvoice,"nd")==0) new_voice= 4; /*dennis*/

	 else if (strcmp(cvoice,"nk")==0) new_voice= 5; /*kit*/

	 else if (strcmp(cvoice,"nu")==0) new_voice= 6; /*ursula*/

	 else if (strcmp(cvoice,"nr")==0) new_voice= 7; /*rita*/
	
	 else if (strcmp(cvoice,"nw")==0) new_voice= 8; /*wendy*/

	 else new_voice=99; /*no match*/
	}	
	else return 0;
	
	if (new_voice != 99 )
	last_voice = new_voice;
	
    kltask_init();
	KS.halting=0;
//	KS.async_change=1;

return 0;
}
#endif

int TextToSpeechReset()
{
#ifndef OUTPUT_FILE
	AUDIO_OUT_QUIT();
#endif
	KS.halting=1;

return 0;
}




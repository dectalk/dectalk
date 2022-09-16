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

#ifdef EPSONC33
extern unsigned char name[];
#endif

extern int TextToSpeechStart(char *input);
extern int TextToSpeechInit(char *voice);
extern int TextToSpeechQuit();

short ChangeVoice(char *cvoice);

extern char cinput_array[];


typedef unsigned char U8;
typedef unsigned int U32;
#define get_long_int(ptr) ((U32)\
                       ((((U8 *)(ptr))[3] << 24)  | \
                        (((U8 *)(ptr))[2] << 16)  | \
                        (((U8 *)(ptr))[1] << 8)  | \
                        (((U8 *)(ptr))[0])))

extern unsigned char main_dict[];


int TextToSpeechStart(char *input)
{

strcpy (cinput_array,input);
strncat (cinput_array,"#0",2);

lsmain(); //sythesis speech


return 0;
}


int TextToSpeechInit(char *voice)
{
	extern short last_voice;
	short new_voice;
	memset(kernel_share,0,sizeof(struct share_data));

	if (*voice != 0)
	new_voice = ChangeVoice(voice);
	
	if (new_voice != 99 )
	last_voice = new_voice;


	//load main dictionary
	if (main_dict)
	{
	KS.fdic = ((int)(main_dict))+8;
	KS.fdic_entries= get_long_int(main_dict);
	}


	usa_main();
	InitializeVTM();
	kltask_init();

return 0;
}


int TextToSpeechQuit()
{
#ifdef EPSONC33
AudioOutQuit(); // will wait for the audio to finish then clos
#endif

return 0;
}


#if 0
short ChangeVoice(char *cvoice)
{

		  if (strcmp(cvoice,"np")==0) return 0; /*paul*/
	
	 else if (strcmp(cvoice,"nb")==0) return 1; /*betty*/
	
	 else if (strcmp(cvoice,"nh")==0) return 2; /*harry*/

	 else if (strcmp(cvoice,"nf")==0) return 3; /*frank*/
	
	 else if (strcmp(cvoice,"nd")==0) return 4; /*dennis*/

	 else if (strcmp(cvoice,"nk")==0) return 5; /*kit*/

	 else if (strcmp(cvoice,"nu")==0) return 6; /*ursula*/

	 else if (strcmp(cvoice,"nr")==0) return 7; /*rita*/
	
	 else if (strcmp(cvoice,"nw")==0) return 8; /*wendy*/

	 else return (99); /*no match*/

}
#endif
///EOF///
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////












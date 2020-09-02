#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
#include "epsonapi.h"
//#pragma import(__use_no_semihosting_swi)

short buffer[71];

#if defined WIN32 || defined WIN32_TEST
FILE *outfile;
#endif

int count;

short *callback(short *output_buf,long error)
{
count++;
if (error==3)
{
	return(3);
}
//if (count==100)
//return(NULL);
#if defined WIN32 || defined WIN32_TEST
fwrite(output_buf,2,71,outfile);
#endif
#if 0
	int i;
	unsigned long j;
	for (i=0;i<71;i++)
	{
		j=output_buf[i];
		if (i && i%8==0)
		{
			printf("\n");
		}
		printf("0x%04X ",j&0xFFFF);
	}
	printf("\n");
#endif
	return(output_buf);
}
extern const unsigned char user_dict[];

short ursula_spdefs[59] = {
0,
60,
100,
240,
100,
0,
100,
10,
0,
100,
4150,
260,
4850,
1200,
4300,
4900,
65,
60,
70,
87,
72,
65,
66,
60,
71,
60,
18,
50,
30,
1,
32,
300,
600,
1500,
0,
55,
0,
120,
130,
140,
230,
340,
250,
220,
250,
200,
4800,
1200,
20,
80,
100,
900,
110,
0,
1,
8,
5,
1180,
650
};

short rita_spdefs[59] = {
0,
44,
65,
106,
80,
36,
20,
0,
1,
110,
4000,
250,
4800,
700,
4100,
4700,
65,
60,
69,
87,
75,
63,
65,
59,
72,
0,
0,
0,
30,
20,
32,
500,
600,
1900,
0,
60,
0,
100,
120,
100,
230,
340,
250,
320,
260,
260,
4800,
1200,
20,
80,
100,
800,
110,
0,
0,
0,
5,
1180,
650};

short wendy_spdefs[59] = {
0,
80,
50,
200,
80,
5,
0,
10,
0,
105,
4200,
400,
4800,
600,
4200,
4800,
65,
60,
70,
87,
78,
69,
65,
61,
64,
100,
0,
80,
20,
18,
22,
850,
1100,
2500,
30,
75,
0,
120,
130,
140,
230,
340,
250,
220,
250,
200,
4800,
1200,
20,
80,
100,
900,
110,
0,
1,
2,
4,
1180,
650 };

int main()
{
#ifdef EPSON_ARM7
	LPTTS_HANDLE_T phTTS;
	PKSD_T pKsd_t;
	PCMD_T pCmd_t;
	PLTS_T pLts_t;
	PDPH_T pDph_t;
	PDPHSETTAR_ST pDphsettar;
	PVTM_T pVtm_t;
	int i;

	short phoneme_ptr[1000];
	char *input_pos;

	SPEAKER_DEF_T *spdefs[10];

	int num_phones;

	short output[100];
	int return_code=1;

#if defined WIN32 || defined WIN32_TEST
	FILE *outfile;
#endif
	char input[]="[:mode math on] [:punct some] [:phoneme arpabet speak on] [:name 3] a toy a test a car a rake a mouse a elephant. ";//This is not [:phon arpa on] a test. [:rate 350] My name is [f r ' ehd] jacobs.";
	char gr_input[]="kilometer ";//ich sie nach hause einladen?";
	char fr_input[]="Vous les ";//vous coucher avec moi ce soir.";// una inmejorable relacion [:name 3]entre la inteligebilidad en el habla sintetizada por su sistema y la cantidad de memoria requerida para su implementacion";
	char la_input[]="una ";//inmejorable relacion entre la inteligebilidad";

	count=0;



	phTTS=calloc(sizeof(TTS_HANDLE_T),1);
	pKsd_t=calloc(sizeof(KSD_T),1);
	pCmd_t=calloc(sizeof(CMD_T),1);
	pLts_t=calloc(sizeof(LTS_T),1);
	pDph_t=calloc(sizeof(DPH_T),1);
	pDphsettar=calloc(sizeof(DPHSETTAR_ST),1);
	pVtm_t=calloc(sizeof(VTM_T),1);


	for (i=0;i<10;i++)
	{
		spdefs[i]=calloc(sizeof(SPEAKER_DEF_T),1);
	}

#endif

count=0;
#if defined WIN32 || defined WIN32_TEST
	outfile=fopen("output.pcm","wb");
	if (outfile==NULL)
	{
		exit(0);
	}
#endif
#ifndef EPSON_ARM7
	TextToSpeechInit(callback,user_dict);
//	TextToSpeechStart("Parlez vous français. ",buffer,WAVE_FORMAT_1M16);
	TextToSpeechStart("EPSON ofrece una inmejorable relacion entre la inteligebilidad en el habla sintetizada por su sistema y la cantidad de memoria requerida para su implementacion",buffer,WAVE_FORMAT_1M16);
//	printf("returned from start\n");
	count++;
//	TextToSpeechReset();
	count++;
//	TextToSpeechStart("test of fred. ",buffer,WAVE_FORMAT_1M16);
	count++;
#else

//	printf("calling init\n");
	for (i=0;i<10;i++)
	{
		TextToSpeechGetSpeakerDef(spdefs[i]);
		spdefs[i]->average_pitch+=i*10;
		spdefs[i]->sex=(i+1)%2;
	}

	memcpy(spdefs[3],&ursula_spdefs,sizeof(wendy_spdefs));
	//spdefs[3]->loudness+=3;

	TextToSpeechInitTTP(phTTS,pKsd_t,pCmd_t,pLts_t,NULL,LANG_ENGLISH_US,1);
//	TextToSpeechInit(callback,user_dict);
//	printf("calling start\n");
	memset(phoneme_ptr,0,1000);

	num_phones=TextToSpeechStartTTP(phTTS,input,phoneme_ptr,500,&input_pos);
	memset(pCmd_t,0,sizeof(CMD_T));
	//memset(pLts_t,0,sizeof(LTS_T));


	TextToSpeechInitPTS(phTTS,pKsd_t,pDph_t,pDphsettar,pVtm_t,spdefs,WAVE_FORMAT_1M16,1);

	return_code=PTS_OUTPUT;

	while (return_code==PTS_OUTPUT)
	{
		count++;
		return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
		if (return_code==PTS_OUTPUT)
		{
#if defined WIN32 || defined WIN32_TEST
		fwrite(output,71,2,outfile);
#endif
		}
	}

	while (*input_pos)
	{
		memset(phoneme_ptr,0,1000);
		
		num_phones=TextToSpeechStartTTP(phTTS,input_pos,phoneme_ptr,500,&input_pos);
		memset(pCmd_t,0,sizeof(CMD_T));
		//memset(pLts_t,0,sizeof(LTS_T));
		
		return_code=PTS_OUTPUT;
		while (return_code==PTS_OUTPUT)
		{
			count++;
			return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
			if (return_code==PTS_OUTPUT)
			{
#if defined WIN32 || defined WIN32_TEST
			fwrite(output,71,2,outfile);
#endif
			}
		}
	}

	
	TextToSpeechInitTTP(phTTS,pKsd_t,pCmd_t,pLts_t,NULL,LANG_GERMAN,0);
//	TextToSpeechInit(callback,user_dict);
//	printf("calling start\n");
	memset(phoneme_ptr,0,1000);

	num_phones=TextToSpeechStartTTP(phTTS,gr_input,phoneme_ptr,500,&input_pos);

	TextToSpeechInitPTS(phTTS,pKsd_t,pDph_t,pDphsettar,pVtm_t,spdefs,WAVE_FORMAT_1M16,1);

	return_code=PTS_OUTPUT;

	while (return_code==PTS_OUTPUT)
	{
		count++;
		return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
		if (return_code==PTS_OUTPUT)
		{
#if defined WIN32 || defined WIN32_TEST
		fwrite(output,71,2,outfile);
#endif
		}
	}

	while (*input_pos)
	{
		memset(phoneme_ptr,0,1000);
		
		num_phones=TextToSpeechStartTTP(phTTS,input_pos,phoneme_ptr,500,&input_pos);
		
		return_code=PTS_OUTPUT;
		while (return_code==PTS_OUTPUT)
		{
			count++;
			return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
			if (return_code==PTS_OUTPUT)
			{
#if defined WIN32 || defined WIN32_TEST
			fwrite(output,71,2,outfile);
#endif
			}
		}
	}


	TextToSpeechInitTTP(phTTS,pKsd_t,pCmd_t,pLts_t,NULL,LANG_LATIN_AMERICAN,0);
//	TextToSpeechInit(callback,user_dict);
//	printf("calling start\n");
	memset(phoneme_ptr,0,1000);

	num_phones=TextToSpeechStartTTP(phTTS,la_input,phoneme_ptr,500,&input_pos);

	TextToSpeechInitPTS(phTTS,pKsd_t,pDph_t,pDphsettar,pVtm_t,spdefs,WAVE_FORMAT_1M16,1);

	return_code=PTS_OUTPUT;

	while (return_code==PTS_OUTPUT)
	{
		count++;
		return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
		if (return_code==PTS_OUTPUT)
		{
#if defined WIN32 || defined WIN32_TEST
		fwrite(output,71,2,outfile);
#endif
		}
	}

	while (*input_pos)
	{
		memset(phoneme_ptr,0,1000);
		
		num_phones=TextToSpeechStartTTP(phTTS,input_pos,phoneme_ptr,500,&input_pos);
		
		return_code=PTS_OUTPUT;
		while (return_code==PTS_OUTPUT)
		{
			count++;
			return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
			if (return_code==PTS_OUTPUT)
			{
#if defined WIN32 || defined WIN32_TEST
			fwrite(output,71,2,outfile);
#endif
			}
		}
	}

	TextToSpeechInitTTP(phTTS,pKsd_t,pCmd_t,pLts_t,NULL,LANG_FRENCH,0);
//	TextToSpeechInit(callback,user_dict);
//	printf("calling start\n");
	memset(phoneme_ptr,0,1000);

	num_phones=TextToSpeechStartTTP(phTTS,fr_input,phoneme_ptr,500,&input_pos);

	TextToSpeechInitPTS(phTTS,pKsd_t,pDph_t,pDphsettar,pVtm_t,spdefs,WAVE_FORMAT_1M16,1);

	return_code=PTS_OUTPUT;

	while (return_code==PTS_OUTPUT)
	{
		count++;
		return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
		if (return_code==PTS_OUTPUT)
		{
#if defined WIN32 || defined WIN32_TEST
		fwrite(output,71,2,outfile);
#endif
		}
	}

	while (*input_pos)
	{
		memset(phoneme_ptr,0,1000);
		
		num_phones=TextToSpeechStartTTP(phTTS,input_pos,phoneme_ptr,500,&input_pos);
		
		return_code=PTS_OUTPUT;
		while (return_code==PTS_OUTPUT)
		{
			count++;
			return_code=TextToSpeechStartPTS(phTTS,phoneme_ptr,num_phones,output);
			if (return_code==PTS_OUTPUT)
			{
#if defined WIN32 || defined WIN32_TEST
			fwrite(output,71,2,outfile);
#endif
			}
		}
	}
	
	//	TextToSpeechStart("Parlez vous français. ",buffer,WAVE_FORMAT_1M16);
//	printf("returned from start\n");
	count++;
//	TextToSpeechReset();
//	TextToSpeechStart("test of fred. ",buffer,WAVE_FORMAT_1M16);
#endif
	count++;
#if defined WIN32 || defined WIN32_TEST
	fclose(outfile);
#endif
	return 0;
}


void __raise()
{
while (1);
}

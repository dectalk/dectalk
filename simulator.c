

#include <stdio.h>
#include "epsonapi.h"


#ifdef OUTPUT_FILE
FILE *outfile;
#endif

main ()
{
#ifdef OUTPUT_FILE
outfile=fopen("output.pcm","wb");
#endif

 TextToSpeechInit();

//TextToSpeechStart("message 1 was sent at 12:08 am");
//TextToSpeechStart("message 1 was sent at 12:08 pm");


//TextToSpeechStart("MI");
//TextToSpeechStart("MA");
//TextToSpeechStart("UT");
//TextToSpeechStart("LA");


//TextToSpeechStart("Anonymous");
//TextToSpeechStart("Call from");
//TextToSpeechStart("Long distance");
//TextToSpeechStart("Name unavailable");
//TextToSpeechStart("Number available");
//TextToSpeechStart("Out of area");
//TextToSpeechStart("Pay phone");
//TextToSpeechStart("Private caller");
#ifdef NO_CMD
 TextToSpeechStart("Message 1 was sent tuesday");
#else
// TextToSpeechStart("[:say letter]hi there[:say clause]");
// TextToSpeechStart("[:phon arpa on] [  dh' ihs   ' ihs   ^ ax  t ' ehs t ][:phon asky on][D'Is 'Is ^x t'Est]");
// TextToSpeechStart("[:dv ap 160]Message 2 was [:dv ap 100]sent at 12:34 am friday");
// TextToSpeechStart("[:rate 350]Message 2 was sent at 12:34 am friday. "
//                   "[:rate 150]Message 2 was sent at 12:34 am friday. ");
// TextToSpeechStart("foo,he ");
// TextToSpeechStart("books for. ");
// TextToSpeechStart("This is a test. [:sync][:pitch 50] This is a test. [:sync][:pitch -20] This is a test. ");
//TextToSpeechStart("[:say letter][:pitch 60]bBcCdD [:pitch 35] eEfFgGhH[:say clause]");
TextToSpeechStart("234 7890");

TextToSpeechStart("234 7890");

TextToSpeechStart("234 7890");

TextToSpeechStart("234 7890");

TextToSpeechStart("234 7890");

//TextToSpeechStart("[:pitch 60]bBcCdD [:pitch 35] eEfFgGhH");
// TextToSpeechStart("Message 2 was sent at 12:34 am friday");
#endif

//TextToSpeechStart("M T");

// TextToSpeechChangeVoice("nh");  

//TextToSpeechStart("Hi I am the voice of HARRY");

//TextToSpeechStart("you have 6 messages.");
//TextToSpeechStart("message 1 was sent at 12:08 am");
//TextToSpeechStart("message 2 was sent at 4:24 pm");
////TextToSpeechReset();
//TextToSpeechStart("message 3 was sent at 12:36 am Tuesday.");
//TextToSpeechInit();
//TextToSpeechStart("answering machine.");

TextToSpeechQuit();

#ifdef OUTPUT_FILE
fclose(outfile);
#endif
}





//////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
#if 0
TextToSpeechStart("Paul, is the default voice");

TextToSpeechChangeVoice("nh");  

TextToSpeechStart("Hi I am the voice of Harry");

TextToSpeechChangeVoice("nd");  

TextToSpeechStart("Hi I am the voice of Dennis");

TextToSpeechChangeVoice("nk"); 

TextToSpeechStart("Hi I am the voice of Kit");

TextToSpeechChangeVoice("nb"); 

TextToSpeechStart("Hi I am the voice of Betty");

TextToSpeechChangeVoice("nf");  

TextToSpeechStart("Hi I am the voice of Frank");

TextToSpeechChangeVoice("nu");  

TextToSpeechStart("Hi I am the voice of Ursula");

TextToSpeechChangeVoice("nr");  

TextToSpeechStart("Hi I am the voice of Rita");

TextToSpeechChangeVoice("nw");  

TextToSpeechStart("Hi I am the voice of Wendy");

TextToSpeechChangeVoice("np");

TextToSpeechStart("Hi it's me Paul again ");
#endif
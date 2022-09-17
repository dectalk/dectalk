/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *                                                      
 ***********************************************************************
 *    File Name:        dtt_int.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DTtest DECtalk interface module
 *
 ***********************************************************************
 *    Revision History:
 *
 *	Rev.	Who		Date		Description
 *	--------------------------------------------------------------------
 *  001		Y.L		08/01/1996	Initial release.
 *  002     G.L		09/16/1996  Code cleanup.
 *	003		TQL		03/17/1997	Changed the way dtt_int does handshaking.
 *	004		MFG		05/06/1998	changed logging to use dbglog.txt file
 *
 */

#include <time.h>
#include <stdlib.h>
#include "dtt_data.h"       /* all data structure declear here       */
#include "dtt_defs.h"       /* all date value define here            */
#include "dtt_prot.h"       /* all date value define here            */

#ifndef MSVC4
#include "dttsr.h"          /* all date value define here            */
#include "dtstart.h"        /* all date value define here            */
#include "dtstarp.h"        /* all date value define here            */

#else
#include <windows.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include "ttsapi.h"

LPTTS_HANDLE_T ttsHandlePtr = NULL;	/* global DECtalk TTS handle */

#endif

extern int TEST_MODE;

void dtt_int_cleanup(short mode)
{
     unsigned long i=0;

#ifndef MSVC4

	 /* check for DECtalk installation */
     install(0);
	 /* clear all logging flag */

     while ((sendb("[:mode math off]",strlen("[:mode math off]"),0) != TSR_SUCCESS));
     while ((sendb("[:mode eur off]",strlen("[:mode eur off]"),0) != TSR_SUCCESS));
     while ((sendb("[:punct some]",strlen("[:punct some]"),0) != TSR_SUCCESS));
     while ((sendb("[:skip none]",strlen("[:skip none]"),0) != TSR_SUCCESS));
     while ((sendb("[:debug 0]",strlen("[:debug 0]"),0) != TSR_SUCCESS));
     while ((sendb("[:log text off]",strlen("[:log text off]"),0) != TSR_SUCCESS));
     while ((sendb("[:log phone off]",strlen("[:log phone off]"),0) != TSR_SUCCESS));
     while ((sendb("[:log syllables off]",strlen("[:log syllables off]"),0) != TSR_SUCCESS));
     while ((sendb("[:log types off]",strlen("[:log types off]"),0) != TSR_SUCCESS));
     while ((sendb("[:log forms off]",strlen("[:log forms off]"),0) != TSR_SUCCESS));
     while ((sendb("[:log outphon off]",strlen("[:log outphon off]"),0) != TSR_SUCCESS));
     /* clean all data buffer */

	 while (i++ < TSR_CLEAN_CYCLE)
	 {
	     gtdch(0);
     }

#endif

     if (mode == 1) printf ("\n\n DTtest clean up finished !\n");

     return;
}

#ifndef MSVC4

int dtt_int_dectalk (char *send_ptr,
					 char *receive_ptr,
					 FILE *flogptr,
					 char speak_enable[FILENAMESIZE])
{

unsigned long i, k;
short c_state=0;
short c_only=0;
short loop_count=0;
short index_flag=0;
char index_check[256] = {""};
char tmp_ptr[256] = {""};
char first_word[50]={""};
unsigned char getbuf[5012]={""},temp=0;

	i=0;

  	if (FLOW==1) printf("\n enter dtt_int_dectalk");
  
  	/* don't process any line longer than 256 characters */
  	if (strlen(send_ptr) > MAXLENGTH)
  	{
   		printf("**can not process string more than 256 characters!!\n");
   		printf("--> %s\n",send_ptr);
   		exit(1);
  	}
  
  	/* catch the the first word */
  	sscanf(send_ptr," %s",first_word);
 
  	/* don't process the empty string */
  	if (strlen(first_word) == 0 || first_word[0] == '\n' || first_word[0] == '\r' || first_word[0] == 0xa) return(1);
  
  	/* skip commented lines */
  	if (first_word[0] == ';') return(1);
 
    /* strip the \n at the end of string */
    if (send_ptr[strlen(send_ptr)-1] == '\n' || send_ptr[strlen(send_ptr)-1] == '\n')
       send_ptr[strlen(send_ptr)-1] = '\0';  
    
    c_state = 0; c_only = 1;
    /* examine this string to see whether is a command only string */
    for (i=0;i<strlen(send_ptr);++i)
    {
        if (send_ptr[i] == '[' && send_ptr[i+1] == ':') { c_state = 1; continue; }	/* enter command state */
        if (send_ptr[i] == ']') { c_state = 0; continue; }	/* leave command state */
        if (c_state == 0 && send_ptr[i] != ' ' && send_ptr[i] != '\t' && send_ptr[i] != '[') 
        {
		   //printf("send_ptr %d (%c)(%x)\n",i,send_ptr[i],send_ptr[i]);
           c_only = 0;   /* finding text, it is NOT a command only string */
           break;
        }    
    }
 
    /* allow the [:debug xfff] command go through */
    if (c_only == 1 && strstr(send_ptr,"debug") && (strstr(send_ptr,"fff") || strstr(send_ptr,"FFF")))
       c_only = 0;

	printf  ("\nsend : \n%s\n",send_ptr);
    fprintf (flogptr,"\nsend :\n%s\n", send_ptr);

	/* append [:i r 9999][:sync] to each string */
	strcat (send_ptr, "[:i r 9999][:sync]");

	/* tell dectalk not to speak if speak_enable is 0 */
	if (!_strnicmp(speak_enable, "0", 1))
	{
		system ("dttest \"[:debug 2800]\"");
//		strcpy (tmp_ptr, "[:debug 2800]");
//		strcat (tmp_ptr, send_ptr);
//		strcpy (send_ptr, tmp_ptr);
	}

   if (TEST_MODE == 0)
   {
  		/* send valid data to TSR */
		while ((sendb(send_ptr,strlen(send_ptr),0) != TSR_SUCCESS));

  		/* receiving data from pc card through TSR */
	    i=0; k=0;
	    getbuf[0] = '\0';

	    while (!strstr(index_check, "[:index 9999]"))
	    {
	    	temp = gtdch(0);
	    	if (temp == 0);
	    	else
	    	{
	    		getbuf[i++] = temp;
			    if( temp == '[' )
					index_flag = 1;
				if( index_flag == 1 )
				{
					index_check[k++] = temp;
				}
				if( temp == ']' )
				{
					index_flag = 0;
					index_check[k] = '\0';
				}			
			}
	    } /* end of while loop */
		
		/* don't print the data if it is a command string */
		if (c_only == 1) return(0);

		/* cut off anything after '[' */
	    strchr(getbuf, '[')[-3] = '\0';
		printf  ("\nreceive :\n%s", getbuf);
		fprintf (flogptr,"\nreceive :\n%s", getbuf);
        
	}
	else
		printf  ("\nreceive :\n%s", send_ptr);
   
  return(0);
}

#else

int dtt_int_dectalk (char *send_ptr,
					 char *receive_ptr,
					 FILE *flogptr,
					 char speak_enable[FILENAMESIZE])
{

unsigned long i,j=0;
unsigned long k=0;
short c_state=0;
short c_only=0;
char first_word[50]={""};
char send_ptr_parsed[512];
FILE *log_txt_ptr;

MMRESULT status;

    /* Start the DECtalk Engine if flag is set */
    if (TTS_flag == 1)
	{
		TTS_flag = 2;	/* set flag to anything except 0 or 1 */
		status = TextToSpeechStartup( NULL, &ttsHandlePtr, WAVE_MAPPER, 0 );
		if ( status != MMSYSERR_NOERROR )
		{
			printf( "Error initializing DECtalk\n" );
			return 1;
	    }
	}

	/* Shutdown the DECtalk Engine if flag is zero */
	else if (TTS_flag == 0)
	{
		TextToSpeechShutdown( ttsHandlePtr );
		return 1;
	}
	
  	if (FLOW==1) printf("\n enter dtt_int_dectalk");
  
  	/* don't process any line longer than 256 characters */
  	if (strlen(send_ptr) > MAXLENGTH)
  	{
   		printf("**can not process string more than 256 characters!!\n");
   		printf("--> %s\n",send_ptr);
   		exit(1);
  	}
     
  	/* skip commented lines */
  	if (send_ptr[0] == ';' || send_ptr[0] == 0) return(1);

  	/* catch the the first word */
  	sscanf(send_ptr," %s",first_word);
 
  	/* don't process the empty string */
  	if (strlen(first_word) == 0 || first_word[0] == '\n' || first_word[0] == '\r' || first_word[0] == 0xa) return(1);
  
//  	/* don't process the empty string */
//  	if (strlen(send_ptr) == 0 || send_ptr[0] == '\n' || send_ptr[0] == '\r' || send_ptr[0] == 0xa) return(1);

    /* strip the \n at the end of string */
    if (send_ptr[strlen(send_ptr)-1] == '\n')
       send_ptr[strlen(send_ptr)-1] = '\0';   

    c_state = 0; c_only = 1;
    /* examine this string to see whether is a command only string */
    for (i=0;i<strlen(send_ptr);++i)
    {
        if (send_ptr[i] == '[' && send_ptr[i+1] == ':') { c_state = 1; continue; }	/* enter command state */
        if (send_ptr[i] == ']') { c_state = 0; continue; }	/* leave command state */
        if (c_state == 0 && send_ptr[i] != ' ' && send_ptr[i] != '\t' && send_ptr[i] != '[') 
        {
		   //printf("send_ptr %d (%c)(%x)\n",i,send_ptr[i],send_ptr[i]);
           c_only = 0;   /* finding text, it is NOT a command only string */
           break;
        }    
    }

//    c_state = 0; c_only = 0;
//    /* examine this string to see whether is a command only string */
//    for (i=0;i<strlen(send_ptr);++i)
//    {
//        if (send_ptr[i] == '[' && send_ptr[i+1] == ':') { c_state = 1; continue; }	/* enter command state */
//        if (send_ptr[i] == ']' && c_state == 1) { c_state = 0; }	/* leave command state */
//        if (c_state == 0 && send_ptr[i] == ']' && send_ptr[i+1] == '\0')
//           c_only = 1;   /* not finding text, it is a command only string */ 
//    }
 
    /* allow the [:debug xfff] command go through */
    if (c_only == 1 && strstr(send_ptr,"debug") && (strstr(send_ptr,"fff") || strstr(send_ptr,"FFF")))
       c_only = 0;
 
	/* Some preprocessing */
	strcpy (send_ptr_parsed, "[:log dbglog on]");
	strcat (send_ptr_parsed, send_ptr);
	strcat (send_ptr_parsed, "[:log dbglog off]\0");

    printf ("\n\nsend : \n%s\n",send_ptr);
    fprintf (flogptr,"\n\nsend :\n%s\n", send_ptr);

	/* Have DECtalk speak it if speak_enable is 1 */
//	if (!_strnicmp(speak_enable, "1", 1))
//		TextToSpeechSpeak( ttsHandlePtr, send_ptr, TTS_NORMAL );

   /* Sync to make sure everything has come out */
//    TextToSpeechSync( ttsHandlePtr );


	/* Then have DECtalk write it to log.txt */
	TextToSpeechSpeak( ttsHandlePtr, send_ptr_parsed, TTS_NORMAL );

    /* Sync to make sure everything has come out */
    TextToSpeechSync( ttsHandlePtr );


	log_txt_ptr = fopen( "dbglog.txt", "r" ); //mfg

	if (c_only == 1)
	{
		fclose( log_txt_ptr );
		return(1);
	}

	printf  ("\nreceive :\n");
	fprintf (flogptr,"\nreceive :\n");

	while( fgets( receive_ptr, 512, log_txt_ptr ) != NULL )
	{
		printf  ("%s", receive_ptr);
	    fprintf (flogptr,"%s", receive_ptr);
	}

	fclose( log_txt_ptr );

  return(1);
}

#endif	/* #ifndef MSVC4 */

#ifndef MSVC4

int dtt_int_send_data(char *s_ptr)
{
    return(0);
}

int dtt_int_receive_data(char *s_ptr)
{
    return(0);
}
                                                  
void install(int modnum)
{
	RB.ah = DECTALK_ID;             /*defined in TSR.H*/
	RB.al = INSTALL_CHECK;          /*defined in TSR.H*/
	RW.si = modnum;                 /*which module 0-3*/
	_int86(0x2f,&regs,&regs);
	if (RB.al != INSTALLED)
		{
		printf("DECtalk tsr not installed, install and try again.\n");
	    printf("Press any key to continue.\n");
		while (_getch() == (int)NULL);
		exit(1);
	   }
}

int sendb(unsigned char *thebuf,int count, int modnum)
{
	struct  dectalk_char_buff   cb;
	struct  dectalk_char_buff   __far *cbp;
	
	cb.buff=thebuf;
	cb.count=count;
	cbp = &cb;

	RW.bx = FP_OFF(cbp);  /* put offset to char buff struct in bx */
	RW.dx = FP_SEG(cbp);  /*put segment in dx */
	RB.ah = DECTALK_ID;   /*defined in TSR.H*/
	RB.al = SEND_BUFF;    /*defined in TSR.H*/
    RW.si = modnum;               /*which module 0-3*/
	_int86(0x2f, &regs, &regs);
    
    return(RW.ax);
}

int send_char(unsigned char schar, int modnum)                                                         
{       
   do{    /*With out this do/while loop, the DECtalk would not speak*/
	RB.ah = DECTALK_ID;   /*defined in TSR.H*/
	RB.al = SEND_CHAR;    /*defined in TSR.H*/
	RB.bl = schar;
	RW.si = modnum;       /*which module 0-3*/
	 _int86(0x2f, &regs, &regs);
	}while( regs.x.ax == TSR_BUSY || regs.x.ax == TSR_RETRY);
	return(RW.ax);
}

int declisten()
{
  int i=0;

  /* clean();  */                      /* asynchronously flushes buffer */

  do
  {
    i=0;
	getbuf[0] = '\0';

	while ((getbuf[i] =  gtdch(0)) != '\0' && i < 499)
	{   
	  if (getbuf[i] == '\033')
	  {
	    getbuf[i++] = 'E';
	    getbuf[i++] = 'S';
	    getbuf[i] = 'C';
	  }
	  i++;
	} 

	getbuf[i+1] = '\0';
	printf ("RECIEVED FROM DT -%d-%c-:\n",i,getbuf[0]);
	printf ("%s\n",getbuf);
  } while (i>498);
  return(0);

}
                  
unsigned char gtdch(int dt)
{       
  do
  {

    RB.ah = DECTALK_ID;
    RB.al = GET_CHAR;
//    RB.bl = ' ';
    RW.si = dt;
    _int86(0x2f, &regs, &regs);
    
    /* printf ("character catched -%d-%c-%c-%d-\n",dt,(char)RW.bx,RB.bl,(int)regs.x.ax);
    */

  }while(regs.x.ax != TSR_SUCCESS && (regs.x.dx & 0x2));  
    
  if (regs.x.ax == TSR_RETRY) RW.bx = 0;

  /* printf ("\n catch -%d- ",RB.bl); */

  return((unsigned char)RW.bx);

}

int clean()
{
	RB.ah = DECTALK_ID;
	RB.al = FLUSH_TEXT;
	RW.si = 0;
	 _int86(0x2f, &regs, &regs);

	return(RW.ax);
}

#endif /* #ifndef MSVC4 */
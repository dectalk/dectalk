/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996. All rights reserved.
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
 *    File Name: 	priodic.c
 *    Author:       Matthew Schnee
 *    Creation Date:1/24/96
 *
 *    Functionality:Changes priority field in dictionaries that have name 
 *					and priority fields.
 *
 ***********************************************************************
 *    Revision History:                 
 *	001 01/24/96 MGS Changed the print out message for different values
 *					 Made enter skip the current entry
 *					 P or p prompts for the priority
 *					 Hotkeys 9 6 1 correspond to High Medium Low respectively
 *					 Z or z have been added to denote never occurrences
 *					 Enter skips the entry
 *	002	01/25/96 MGS Removed the outpur file parameter 
 *					 Added .bak file handling
 *					 added commands (E)xit and (G)oto 
 *	003	03/01/96 MGS now skips homographs and sets the priority to high
 *					 and added /h option to allow priority of homographs to be set
 *					
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include <conio.h>
#include <process.h> 
#include <graph.h>
#include <ctype.h>
#include <limits.h>

/* #define DEBUG  */

#define CLEAR_STRING "cls"
                                
#define HIGH_PRI	100
#define MEDIUM_PRI	300
#define LOW_PRI		600
#define NEVER_PRI	1500

#define SKIP_CHAR_U	13  /* enter */
#define SKIP_CHAR_L	10  /* line feed */
            
#define HOMOGRAPH_TOKEN_NUMBER	2	/* token number for the homograph field */            
#define PRIORITY_TOKEN_NUMBER 	64 /* token number of the priority field */
#define NAME_TOKEN_NUMBER		62 /* token number of the name field */

#define NON_HOMOGRAPH	'N'



/* the characters that are legal input values for the different typesof input */

#define NEVER_KEY_U		'Z'
#define NEVER_KEY_L		'z'
#define LOW_KEY_U		'L'
#define LOW_KEY_L		'l'
#define LOW_KEY_E		'1'
#define MEDIUM_KEY_U	'M'
#define MEDIUM_KEY_L	'm'
#define MEDIUM_KEY_E	'6'
#define HIGH_KEY_U		'H'
#define HIGH_KEY_L		'h'
#define HIGH_KEY_E		'9'
#define PROMPT_KEY_U	'P'
#define PROMPT_KEY_L	'p'
#define GOTO_KEY_U		'G'
#define GOTO_KEY_L		'g'
#define EXIT_KEY_U		'E'
#define EXIT_KEY_L		'e'

          
void process_keys(char *outputline,char *pri);
int get_keystroke();
void display_data(char *word,char *priority,char *name,long int linenum,char *homo);
void display_word(char *word,char *name,char *priority,long int linenum,char *homo);
void process_input(FILE *infile,char *filename);
void clear_screen(void);
int all_digits(char *str);

long int linenum=0,nextline=0;
int doclear=1;            

char spin_symbols[5]={'|','/','-','\\'};
int spin_index=0;
int dohomographs=0;
          
void main(int argc, char *argv[])
{
  int priority=0;
  char output_filename[100],temps[100];
  int count=0,linenum=0; 
  char input_filename[100],bak_filename[100];
  
  
  FILE *infile;
  
  if (argc<2)   /* check the arguments */
  {
   	printf("Usage: priodic <input_filename> [options]\n");
   	printf("       /H	show homographs\n");
   	exit(0);
  }         
  strcpy(input_filename,argv[1]);
  if ((infile=fopen(argv[1],"r"))==NULL) /* open the input file */
  {
  	printf("input file not opened\n");
  	exit(0);
  }                 
  	strcpy(output_filename,strtok(argv[1],"."));
  	strcpy(bak_filename,output_filename);
  	strcpy(output_filename,strcat(output_filename,".new"));
  	strcpy(bak_filename,strcat(bak_filename,".bak"));
  if (argc>2)
  {
  	if (stricmp(argv[2],"/h")==0)
  	{
  		dohomographs=1;
  	}
  }
  if (strcmp(input_filename,bak_filename)==0)
  {
  	printf("can't create backup file\n");
  	exit(0);
  }
  if (strcmp(output_filename,input_filename)==0)
  {
  	printf("can't create temporary file for output\n");
  	exit(0);
  } 
  process_input(infile,output_filename); /* do the processing */
  fclose(infile);
  sprintf(temps,"move %s %s >nul",input_filename,bak_filename);
  system(temps);
  sprintf(temps,"move %s %s >nul",output_filename,input_filename); 
  system(temps);
}
   	

void process_input(FILE *infile,char *filename)
{
  char readline[610],outputline[620];
  int count;
  char *pri,*tempp,*name,*homo;
  char word[50];
  FILE *outfile;
  
  linenum=0;
  if ((outfile=fopen(filename,"w"))==NULL)	/* open the output file */
  {
  	printf("output file not opened\n"); 
  	fclose(infile);
  	exit(0);
  }      
  system(CLEAR_STRING); /* clear the screen */
  display_data(NULL,NULL,NULL,0,NULL);/* display the header */
  while (fgets(readline,598,infile)!=NULL) /* read in every line in the file */
  { 
   	count=0;			/* the count of the tokens */
   	linenum++;			/* the line number */
   	if (nextline>linenum)  /* skip the lines */
   	{
   		fprintf(outfile,"%s",readline);
   		if ((linenum%100)==0)
   		{
   			printf("\r%c",spin_symbols[(++spin_index%4)]);
   		}
   		continue;
   	}
   	if (readline[0]==';')/* comments are copied directly to the output file */
   	{
   		fprintf(outfile,"%s",readline); /* if it is a comment, just write it to the output file */
   		continue;                                
   	}            
    strcpy(outputline,readline); /* copy the line into the output buffer */
    							 /* because strtok is destructive */
   	if (strncmp(readline,"\"\"\"\"",4)==0) /* find the quoted quote */
   	{                                
   		count++;
   		word[0]='\"';
   		word[1]='\0';
   		tempp=strtok(readline,"\"");
   	}
   	else
   	{	
   		tempp=strtok(readline,"\"");  /* find the word */
   	  	strcpy(word,tempp);
   	} 
   	#ifdef DEBUG
   		printf("the word is %s\n",word);
   	#endif
   	if (tempp!=NULL)
   	{
   		count ++;
   		while ((tempp=strtok(NULL,"\""))!=NULL)
   		{                                                
   			if (count==HOMOGRAPH_TOKEN_NUMBER)
   				homo=tempp;
   			if (count==PRIORITY_TOKEN_NUMBER)	/* get the piority value */
   				pri=tempp;
   			if (count==NAME_TOKEN_NUMBER)		/* get the name field */
   				name=tempp;
   			count++;  
   		}
   		#ifdef DEBUG
   			printf("the priority is %s\n",pri);
   		#endif 
        #ifdef DEBUG
 			printf("line %d tokens = %d\n",linenum,count);
 		#endif                      
 		if (count!=66)
 		{
 			printf("ERROR:the file does not have priorities or name fields\n");
 			exit(0);
 		}               
		#ifdef DEBUG
			printf("the word2 is %s\n",word);
			printf("homograph field %s\n",homo);
		#endif
		if ((homo[0]!=NON_HOMOGRAPH) && (dohomographs==0)) /* if the word is a homograph */
		{                                                             
   			tempp=outputline;
   			while ((tempp=strstr(tempp+2,pri))!=NULL)
   				pri=tempp;  	/* get a pointer to the priority field in the output line */
   									/* the last number on the line */                       
   			
	   		sprintf(pri,"%d\"",HIGH_PRI);
	 		fprintf(outfile,"%s\n",outputline);	/* write the output line to the output file */
 			fflush(outfile);/* flush the output buffer */
 			continue;
 		}	   		
		if (doclear)
		{
			display_data(word,pri,name,linenum,homo);
			doclear=0;
		}
		else
		{
 			display_word(word,name,pri,linenum,homo); /* display the word on the line */
 		}
 		process_keys(outputline,pri);		/* get input fro the user */
 											/* and change the outputline */
	   	#ifdef DEBUG
   			printf("the line written %s",outputline);
   			getch();
   		#endif
 		fprintf(outfile,"%s\n",outputline);	/* write the output line to the output file */
 		fflush(outfile);/* flush the output buffer */
 	}                                         
  }
  fclose(outfile);
}	  
    
void display_data (char *word,char *priority,char *name,long int linenum,char *homo)
{                                                 
	/* displays the data and header information on the screen */
	clear_screen();
	printf("\n\n\n\n\n"); /* move down some */
	printf("\t\t\tPress one of the keys\n");
	printf("\n\t%c=HIGH(%d)",HIGH_KEY_U,HIGH_PRI);
	printf("\t%c=MEDIUM(%d)",MEDIUM_KEY_U,MEDIUM_PRI);
	printf("\t%c=LOW(%d)",LOW_KEY_U,LOW_PRI);
	printf("\t%c=NEVER(%d)\n",NEVER_KEY_U,NEVER_PRI);

	printf("Hotkeys\t     %c(%d)",HIGH_KEY_E,HIGH_PRI);
	printf("\t       %c(%d)",MEDIUM_KEY_E,MEDIUM_PRI);
	printf("\t    %c(%d)\n",LOW_KEY_E,LOW_PRI);

	printf("\tENTER=SKIP");
	printf("\t%c=GOTO",GOTO_KEY_U);
	printf("\t%c=EXIT",EXIT_KEY_U);
	printf("\t%c=PROMPT for priority\n",PROMPT_KEY_U);
	printf("\n\n\n");                          
	printf("\t\t\t\t     Current\n");
	printf("Line #\tWord\t\t   Homo Name Priority\n\n");
	#ifdef DEBUG
		printf("display_data: word is %s\n",word);
	#endif
	printf("                                                                           \n");
	printf("                                                                           \n");
	printf("                                                                           \n");
	printf("                                                                           \n");
	printf("                                                                           \n");
	printf("                                                                           \n");
	printf("                                                                           \n");
	if (word!=NULL)
		display_word(word,name,priority,linenum,homo);
}                                

void display_word(char *word,char *name,char *pri,long int linenum,char *homo)
{                                                               
	/* displays the word and priority and ... on the screen */
	int i; 
	_settextposition(17,1);
//	printf("\r                                                                               ");                   
	printf("\r  %ld\t%s",linenum,word);
	for (i=strlen(word);i<19;i++)  /* make sure the next field lines up correcly */
		printf(" ");
	printf("%s\t%s    %s",homo,name,pri);
	printf("\tpress %c, %c, %c, %c or ENTER",HIGH_KEY_U,MEDIUM_KEY_U,LOW_KEY_U,PROMPT_KEY_U);
}

int get_keystroke()
{                                                             
	/* read the ketstrokes in from the keyboard, and only returns */
	/* non escaped characters */
	char key;
	int ok=0;
	
	while (!ok)
	{
		while (!_kbhit());   /* wait for a key to be hit */
		key=_getch(); /* get the key */
		if (key==0)   /* is it an escaped character */
		{
			key=_getch(); /* remove the next character */
			ok=0;
		}
		else
		{
			ok=1;
		}
	}
	
	#ifdef DEBUG
		printf("get key %d %c\n",key,key);
	#endif
	return(key);
}
	

void process_keys(char *outputline,char *pri)
{                             
	/* do the processing on the input keys */
	/* make  sure the key is valid */
	char *tempp,*priority_p,pri_char[100],ans;	
	int ok=0,key;        
	long int pri_value,pri_verify;
   	
   	tempp=outputline;
   	#ifdef DEBUG
   		printf("the priority string %s\n");
   	#endif
   	while ((tempp=strstr(tempp+2,pri))!=NULL)
   		priority_p=tempp;  	/* get a pointer to the priority field in the output line */
   							/* the last number on the line */
	#ifdef DEBUG
		printf("%s",outputline);
		printf("%s",priority_p);
	#endif
	while (!ok)
	{
		key=get_keystroke(); /* read a key */
   		switch (key)
   		{
   		case SKIP_CHAR_U:  
   		case SKIP_CHAR_L:
	   		sprintf(priority_p,"%d\"",atoi(pri));  /* leave the priority alone */
	   		ok=1;                       
   			break;
   		case HIGH_KEY_U:	/* se to high priority */
   		case HIGH_KEY_L:
	   	case HIGH_KEY_E:
	   		sprintf(priority_p,"%d\"",HIGH_PRI);  
	   		#ifdef DEBUG
	   			printf("the new line is %s",outputline);
	   		#endif
   			ok=1;
   			break;
   		case MEDIUM_KEY_U:	/* set to medium priorioty */
   		case MEDIUM_KEY_L:
   		case MEDIUM_KEY_E:
	   		sprintf(priority_p,"%d\"",MEDIUM_PRI);
	   		#ifdef DEBUG
	   			printf("the new line is %s",outputline);
	   		#endif
   			ok=1;
   			break;
   		case LOW_KEY_U:		/* set to low priority */
   		case LOW_KEY_L:
	   	case LOW_KEY_E:
	   		sprintf(priority_p,"%d\"",LOW_PRI);
	   		#ifdef DEBUG
	   			printf("the new line is %s",outputline);
	   		#endif
   			ok=1;
   			break;
   		case NEVER_KEY_U:		/* set to never priority */
   		case NEVER_KEY_L:
	   		sprintf(priority_p,"%d\"",NEVER_PRI);
	   		#ifdef DEBUG
	   			printf("the new line is %s",outputline);
	   		#endif
   			ok=1;
   			break;
   		case PROMPT_KEY_U:  	/* prompt the user for a priority value */
   		case PROMPT_KEY_L:                               
   			pri_verify=0; 
   			printf("\n");
   			while (!pri_verify)
   			{
	   			printf("Enter the desired priority value:");
   				scanf("%s",pri_char);
   				#ifdef DEBUG
   					printf("pri_char %s\n",pri_char);
   				#endif
   				if (((pri_value=atol(pri_char))<=0)||!all_digits(pri_char))
   				{
   					printf("Please enter a number between 1 and 32767\n");
   					pri_value=0;
   					continue;
   				}
   				printf("Verify priority as %d (y/n)",pri_value);
   				ans='\0';
   				while (ans!='y'&&ans!='Y'&&ans!='N'&&ans!='n')
   				{
   					ans=get_keystroke(); /* get the verify response */
   				} 
   				printf("\n");
   				if (ans=='N'||ans=='n')
   				{
	   				pri_verify=0;
   				}                
   				else
   					pri_verify=1;
   			}
	   		sprintf(priority_p,"%d\"",pri_value);
	   		#ifdef DEBUG
	   			printf("the new line is %s",outputline);
	   		#endif
   			ok=1;
   			doclear=1;
   			break;         
   		case GOTO_KEY_U:
   		case GOTO_KEY_L:
   			printf("\n");
   			pri_verify=0;
   			while (!pri_verify)
   			{
	   			printf("Enter the desired line number:");
   				scanf("%s",pri_char);
   				#ifdef DEBUG
   					printf("pri_char %s\n",pri_char);
   				#endif
   				if (( (pri_value=atol(pri_char))<=linenum)  ||!all_digits(pri_char))
   				{
   					printf("Please enter a number above %d \n",linenum);
   					pri_value=0;
   					continue;
   				}
   				pri_verify=1;
   				nextline=pri_value;
   				printf("skipping to line %d\n",nextline);
   				doclear=1;
   			}   
	   		sprintf(priority_p,"%d\"",atoi(pri));  /* leave the priority alone */
   			ok=1;
   			break;
   		case EXIT_KEY_U:
   		case EXIT_KEY_L:
   			pri_verify=0; 
   			printf("\n");
   			while (!pri_verify)
   			{
	   			printf("Are you sure you want to exit (y/n)");
   				ans='\0';
   				while (ans!='y'&&ans!='Y'&&ans!='N'&&ans!='n')
   				{
   					ans=get_keystroke(); /* get the verify response */
   				} 
   				if (ans=='N'||ans=='n')
   				{
	   				pri_verify=1;
	   				ok=0;
	   				printf("\r                                                                            \r");
   				}                
   				else
   				{
	   				printf("\n");
   					pri_verify=1;     
   					nextline=LONG_MAX-1;
			   		sprintf(priority_p,"%d\"",atoi(pri));  /* leave the priority alone */
   					printf("You may wish to record that you are exiting from line number %d.\n",linenum);
		   			ok=1;
   				}
   			}     
   			break;
   		default:
	   		ok=0;	/* loop until a valid respoonse is given */
	   	}
   	}
   	#ifdef DEBUG
   		printf("the final line %s",outputline);
   		getch();
   	#endif
}

void clear_screen(void)   	
{
	//int i; 
 	_settextposition(1,1); /* move to the top of the screen */
	/* for (i=0;i<25;i++)
		printf("\n"); */
}                                         

int all_digits(char *str)
{
	/* make sure all the characters in the string are digits */
	int i;
	int length;
	
	length=strlen(str);
	for (i=0;i<length&&isdigit(str[i]);i++);
	if (i==length&&isdigit(str[i-1]))
		return(1);
	return(0);
}
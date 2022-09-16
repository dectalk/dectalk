/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995,1999. All rights reserved.
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
 *    File Name:	alphabet.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  User dictionary alphabetizer ...
 *
 ***********************************************************************
 *    Revision History:
 *
 *  5/13/94 adn. 
 *	1/11/95 cjl&an, Added check for blank line in input file.
 *  1/11/96 sik, Added capability to handle comments in the input file.
 *  	    Comments begin with a ';' - everything on the line after the ;
 *          will be ignored.
 *	02/02/96	Added support for dos and windows envrionment tags in the dictionaries
 *				added code page 850 for translation of characters from DOS to iso
 *				changed error messages 
 *				[DOS] is for a dos envrionment
 *				[WIN] is for a windows envrionment
 *				removed lowercase binary sort tree. all words sorted in 1 tree
 *				changed #include iso_char.h to cpg_850.c
 * 31mar99	tek		restructured to be called directly rather than by 
 *					writing files.
 * 26apr00      nal     Added linux/unix 
 */

#include <assert.h> /* for assert() */
#include <stdlib.h>
#include <sys/types.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdio.h>
#include <malloc.h>
#include <string.h>

#include "udic_com.h" /* common defines*/
 
#ifndef NO_CODEPAGE                   
#include	"cpg_850.c"
#endif /*NO_CODEPAGE*/
                    



FILE	*fpFtab;   
int col_number=0;  /* count the columns that are not comments */
int line_number=0;	/* the line number in the inout file */
int is_dos=DOS_TYPE; /* set the default type of file to dos */

void ReadAndAlphabetize(char *szFilename)

{

#if defined __osf__ || defined __linux__
	char fnam_t[255]="";	
#else
	char fnam_t[_MAX_FNAME]="";	
#endif
	unsigned long Guard1=0xdeadbeef;
	unsigned long Guard2=0xfeedface;
	unsigned char word[256];
	struct listup *headup;
/* 	struct listlo *headlo; */
	unsigned int i=0;

	fpFtab=NULL;
/*
 *  open the source file ...
 */

	strcpy(fnam_t,szFilename);
	if ((fpFtab=fopen(fnam_t,"r")) == NULL)
		{
		printf("\n Can't open input text file : %s.\n",fnam_t);
		exit(1);
		}

	headup = (struct listup *)NULL;
	while(get_Aentry(word))
		{
			headup = save_up(headup,word);
		}
	write_up(headup);  /* fixed sort order of the entries MGS  uppercase first */

	fclose(fpFtab);
}

/*
 *  get_Aentry() reads in a line from the file and returns it to
 *  the caller if it is a dictionary entry.
 */

int get_Aentry(unsigned char word[256])
/*unsigned char word[256];*/
{
	int j = 0;           
	int k=0; 
	int i=0;
	int done=0;
	unsigned char n = '\0';
	char w1[100],w2[100];
	int got_to_phon=0;

	while (!done)
	{
		assert(fpFtab != NULL);
		if (fgets(word,250,fpFtab)==NULL)
			return(0);
		line_number++; /* the line number in the file */

		memset(w1,'\0',99);
		memset(w2,'\0',99);
		
		sscanf(word," %s %s",w1,w2);
#ifdef DEBUG
			printf("%s %d %s %d\n",w1,w1[0],w2,w2[0]);
#endif
		if (w1[0]==';') /* we found a comment */
		{
       		done=0;
       		continue;
       	} 
       	if (w1[0]=='\n' || w1[0]=='\r')
       	{
       		done=0;
       		continue;
       	}   
       	if (w1[0]==0&&w2[0]==0)
       	{
       		done=0;
       		continue;
       	}   
		word[strlen(word)-1]='\0'; 	/* strip the \n or \r */
		col_number++; /* the line number without blank lines and comments */
		if ((w1[0] == '[' ) && (w2[0] == '\0') && (col_number==1))  /* are we on the first non blank line and */
												/* is the first non white character  */
		{
   			switch (toupper(w1[1])) /* look at the second chracter in the string */
   			{
         	case DOS_TAG_CHAR:
         		if (STRNICMP(w1+1,DOS_TAG,strlen(DOS_TAG))==0)
         		{
         			is_dos=DOS_TYPE; 
#ifdef DEBUG
        				printf("dos tag set\n");
#endif
         		}
         		else
         		{
         			printf("\nalphabet: Unknown envrionmant tag %s found\n",word);
         			exit(-1);
         		}
         		break;
         	case WIN_TAG_CHAR:
         		if (STRNICMP(w1+1,WIN_TAG,strlen(WIN_TAG))==0)
         		{ 
         			is_dos=WIN_TYPE;
#ifdef DEBUG
         				printf("win tag set\n");
#endif
       			}
       			else
      			{           
       				printf("\nalphabet: Unknown envrionmant tag %s found\n",word);
       				exit(-1);                                            
       			}
       			break;
       		default:
       			printf("\nalphabet; Invalid envrionment tag %s found\n",word);
       			exit(-1);
       		}
       		done=0;
       		continue;
       	}
       	if (w2[0]=='\0')
       	{
       		printf("\nalphabet: No phonemes found on line %d\n",line_number);
       		exit(-1);
       	}               
       	if ((w2[0]!='[') && (w2[0]!='{'))
       	{
       		printf("\nalphabet: No phonemes found on line %d\n",line_number);
       		exit(-1);
       	}               

		for(j=0;j<UDICT_MAX_TEXT && (size_t)j<strlen(word) ;j++)
		{
			n=word[j];
         	if (n=='[')       
       			got_to_phon=1;   /* we found a [ that was not on the first line so we must have gotten to the arpabet phoneme field */   
         	if (n=='{')
         		got_to_phon=1;  /* we got to the ascky field */
         	/* previous added for iso and ascky translation */
         		
#ifdef DEBUG
		printf("n = %c\n",n);
#endif
/* put one char at a time in word */
			done=1;
#ifndef NO_CODEPAGE
			if ((!got_to_phon)&&(is_dos==DOS_TYPE))
			{
				if (code_page_table[n]==0)
				{
					printf("\nalphabet: Illegal character in line %d\n",line_number);
					printf("--> %s\n",word);
					printf("    ");
					for (k=0;k<j;k++)
						printf(" ");
					printf("^\n");		
					exit(-1);
				} 
				word[j]=code_page_table[n];
			}
			else
#endif /*NO_CODEPAGE*/
			{          
				word[j]=n;
			}
		}
	}
	word[j]='\0';
	return(1);		
}


struct listup *save_up(struct listup *head,unsigned char *word)
/*struct listup *head;*/
/*unsigned char *word;*/
{
	int j = 0;

	if (head==NULL)
		{
		head= (struct listup *)malloc(sizeof(struct listup));
		head->word = strsave(word);
		head->left = head->right = NULL;
		}
	else if((j =(int)sort_up(word,head)) < 0)
		head->left = save_up(head->left,word);
	else if (j > 0)
		head->right = save_up(head->right,word);
	return(head);
}

unsigned char *sort_up(unsigned char *word,struct listup *head)
/*unsigned char *word;*/
/*struct listup *head;*/
{
	unsigned char *tmp = head->word;

	while(*word==*tmp)
		{
		word++;
		tmp++;
		if(*word == '\0')
			{
			printf("WARNING, duplicate entries of the word %s.\n",head->word);
			return(0);
			}
		}
   return (unsigned char *)(*word - *tmp);
}

void write_up(struct listup *head)
/*struct listup *head;*/
{
   unsigned char termstrg[]="\0\r\n";
	int i=0;
	if (head != NULL)
		{
		write_up(head->left);
		for(i=0;((head->word[i] != ']')&&(head->word[i] != '}'));i++)
			;
		{
			char szLine[256];
			/* note that everybody we pass this off to expects less than
			 * 256 chars.. so we truncate and warn..
			 */
			if (i>=254)
			{
				head->word[i-1]='\0';
				fprintf(stderr,"Error: line too long! contents:\n%s\n",head->word);
			}
			else
			{
			/* use the udic_com routines to stuff it into the dictionary.. */
			memcpy(szLine,head->word,i+1);
			/* terminate it */
			szLine[i+1]='\0';
			/* put it into the line variable back on udic_com*/
			scan_entry(szLine);
			/* place it in the list (this all uses globals, unfortunately..) */
			sort_entry();
			}
		}
		/* and we'redone with this one.. */
		free(head->word);
		write_up(head->right);
		}
}

unsigned char *strsave(unsigned char *word)
/*unsigned char *word;*/
{
	unsigned char *tmp = (unsigned char *)NULL;
	
	if ((tmp = malloc(strlen(word)+1)) != NULL)
			strcpy(tmp,word);
		return(tmp);
}

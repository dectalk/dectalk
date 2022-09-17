/* 
***********************************************************************
*			  
*							 Copyright (c)
*	  © Digital Equipment Corporation 1996, 1998. All rights reserved.
*
*	  Restricted Rights: Use, duplication, or disclosure by the U.S.
*	  Government is subject to restrictions as set forth in subparagraph
*	  (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
*	  52.227-14 Alt. III, as applicable.
*
*	  This software is proprietary to and embodies the confidential
*	  technology of Digital Equipment Corporation and other parties.
*	  Possession, use, or copying of this software and media is authorized
*	  only pursuant to a valid written license from Digital or an
*	  authorized sublicensor.
*
***********************************************************************
*	  File Name:	 dic_comm.c
*	  Author:		 JDB 
*	  Creation Date: 5/23/96
*
*	  Functionality:
*	   This code modified from v4.3 PARDIC
*	   Common code for compiling dictionaries for all languages
*
***********************************************************************
*	  Revision History: 	   
* 001 MGS	13-Jun-1996  Modified so that it could build for MSDOS and WIN32 with a switch
*						 Added the command line switch /t:msdos and /t:win32
*						 the default is MSDOS
* 002 JAW   03-Feb-1998  Improved performance by doing loading/sorting of dictionary entries in
*                        memory instead of on hard drive.  ifdef'd out old/unused code, cleaned up
*                        screen output, and added comments.  Added quiet mode (only displays
*                        status when an action has completed), controllable by the /q switch.
*/
#include <stdlib.h>
#include "port.h"
#include <stdio.h>
#ifndef VMS
#include <malloc.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#else
#include <types.h>
#include <stat.h>
#endif
#include <ctype.h>		
#include <string.h>
#include <time.h>
#include "dic.h"

/*
* general defines ...
*/
/*#define DEBUG 		1 */
#define true	1
#define false	0
#define failure 1
#define success 0


/* dictionary entry */
#pragma pack (1)
struct d_ent {
	U16 size;
#ifdef VMS
	U16 fc;
	U16 fc1; /* to make fc a 32 bits word need to hack with
	*  this for alpha */  /* -Dr 9/9/97 Hmm... we don't use this???*/
#else
	U32 fc;
#endif
	unsigned char gr_ph[256]; /* grapheme and phoneme separated by a null character */
};
#pragma pack()



struct pc_dictionary {
	long entries;   /* number of entries */
	long total;	   /* bytes excluding table */
};

#define NPTAB (sizeof(ptab)/sizeof(ptab[0]))

/* dictionary targets */
#define MSDOS_FORMAT  1
#define WIN32_FORMAT  2


/* function prototypes */
unsigned char toph(unsigned char c);
unsigned char from_ph(unsigned char c);
void sort_ents (void);
void read_ent (struct d_ent *ent, unsigned int index);
int bitorFC(char*, U32*);			
/* end prototypes */

/*
*	Upper case folding table ...
*/
unsigned char case_upper[] = {
#include "ls_upper.tab"
};

/*Global variables*/
struct d_ent input_entry;
struct d_ent comp_entry;

struct d_ent entry_array[50000];
U32 entry_cnt;

#ifdef OLD_CODE
U32 _huge *disk_entries;
#endif
U32 _huge  *links;
U32 free_entry;
long linenumber=0;	/* the linenumber for output purposes */
#ifdef OLD_CODE
FILE *tfp;
#endif

int quietmode;


int main(int argc, char ** argv)
{
	int err = 0, backslash_flag = 0;
	unsigned char grapheme [50] = {'\0'}, * grapheme_index; 
#ifdef OLD_CODE
	char blanks[10];
#endif

	
	DIC_OBJ_HEADER header; /* file header */
	FILE *infp;			  /* input file pointer */
	FILE *outfp;
	
	unsigned char *s,*os;
	
	/* the name and priority read fron the dicionary file
	*/ 							   
	unsigned long inname,inpriority; 			   
	
	/* variables for the command line options
	*/    
#ifdef DEBUG 
	int j;
	unsigned char* byte_p;
#endif
	unsigned long priority,excludenames,oldformat; 
	unsigned char* temps = NULL;
	unsigned char* tempp = NULL;
	unsigned char* tempp2 = NULL;
	unsigned char buff[1024];
#ifdef OLD_CODE
	unsigned long free_offset;
#endif
	long i,total_bytes;
	unsigned int k;
	U32 index,count;
	struct pc_dictionary pcd;
	unsigned long addr,addr_186;
	unsigned long max_entries_in_memory; /* Max entries allowed */
	short target=MSDOS_FORMAT;

	int ch_index; /* character index */
	unsigned int lcv; /* loop-control variable */

	/*
	*	check args and open input file ...
	*/
	
	if(argc < 2 || argc > 6)
	{
		printf("DIC_COMM.C; main; Usage: dic infile outfile [options]\n");
		printf("options: /p:###     use entries with a priority <= ###\n");
		printf("         /n         exclude names from the dictionary\n");
		printf("         /o         use the old format (/p and /n are ignored)\n");
		printf("         /t:msdos   build the dictionary for msdos\n");
		printf("         /t:win32   build the dictionary for win32\n");
		printf("         /q         quiet mode\n");		
		exit(0);
	}

#ifdef OLD_CODE
	/* moved halloc to beginning because opening large files first can leave 
	* nothing left for this
	*/
#endif
	header.no_of_entries=50000; /*eab just tell it for now*/
	max_entries_in_memory = header.no_of_entries;
#ifdef OLD_CODE
/* DISK_ENTRIES are all the offsets of each input_entry that are in the TMPFILE*/
#ifdef MSDOS
 	if((disk_entries = _halloc(((U32)header.no_of_entries * sizeof(U32)), 1))==NULL)
#else
		if((disk_entries = (U32 *)malloc(header.no_of_entries * sizeof(U32)))==NULL)
#endif
		{
			printf("DIC_COMM; main; halloc failure on disk_entries");
			exit(1);
		}
#endif
		
#ifdef MSDOS
		if((links = _halloc(((U32)(header.no_of_entries+(28*28)) * sizeof(U32)),1))==NULL)
#else
			if((links = (U32 *)malloc(((U32)(header.no_of_entries+(28*28)) * sizeof(U32))))==NULL)
#endif
			{
				printf("DIC_COMM; main; halloc failure on links");
				exit(1);
			}
			
			if ((infp = fopen(argv[1], "r+b")) == NULL)
			{
				printf("DIC_COMM; main; Failure on input file open of %s\n",argv[1]);
				exit(1);
			} 

#ifdef OLD_CODE
/*memset blanks is used to add memory to the input_entry stuct for when we write to BYTE alined system only. */			
			memset (blanks, 0, 10);
#endif
			/* section added to support priorities and name exclusion 
			* command line options mgs 
			*/
			priority=32760;
			oldformat=0;
			excludenames=0;
			quietmode=0;
			os=NULL;
			for (i=2;i<argc;i++)
			{				   
				if (argv[i][0]=='/')
				{
					switch (argv[i][1])
					{
					case 'p':
					case 'P':
						priority=atoi(argv[i]+3);
#ifdef DEBUG 
						printf("priority read in = %s  converted = %d\n",argv[i],priority);
#endif
						break;
					case 'O':
					case 'o':
						oldformat=1;
						break;
					case 'n':
					case 'N':
						excludenames=1;
						break;
					case 't':
					case 'T':
						if ((argv[i][2]==':' &&	case_upper[argv[i][3]]=='M') || case_upper[argv[i][2]]=='M')
							target=MSDOS_FORMAT;
						if ((argv[i][2]==':' &&	case_upper[argv[i][3]]=='W') || case_upper[argv[i][2]]=='W')
							target=WIN32_FORMAT;
						break;
					case 'Q':
					case 'q':
						quietmode=1;
						break;
					default:
						printf("DIC_COMM; main; Unrecognized command line option %s\n",argv[i]);
						exit(0);
					}
				}
				else
				{
					os = argv[i];
				}
			}
			
			if (os == NULL)
			{ 
				
#ifdef DIC_GR
			/* Use German default file name
				*/
				os = "dic_gr.dic";
#elif defined DIC_SP
				/* Use Spanish default file name
				*/
				os = "dic_sp.dic";
#elif defined DIC_UK
			/*Use ENGLISH_UK default file name
			*/
				os = "dic_uk.dic";

#else			
				/* If not German nor Spanish; English default file name
				*/
				os = "dic_us.dic";
#endif
				
			}	
			
			/* previous is to support the new format
			*/
			
			if ((outfp = fopen(os, "w+b")) == NULL)
			{
				printf("DIC_COMM; main; Failure on output file open of %s\n",os);
				exit(0);
			}

#ifdef OLD_CODE
	/*tmpfile is where we put the entries to sort them them we write them to dic_<lang><lang>.dic */
			if ((tfp = tmpfile()) == NULL)
			{
				printf("DIC_COMM; main; Failure on temp file open\n");
				exit(0);
			}
#endif


			/*
			*	Read in and alphabetize the dictionary ...
			*	build the index table in ram to quick cache everything ...
			*/
			free_entry = 0L;
#ifdef OLD_CODE
			free_offset = 0L;
#endif
			total_bytes = 0L;
			header.no_of_entries=0;
			printf("DIC_COMM; main; Building dictionary %s with %ld entries\n\n",os,header.no_of_entries);
			
			count = 1;
			while(fgets(buff, sizeof(buff), infp) != NULL)
			{
				if((count++ & 0xff) == 0 && !quietmode)
				{
					printf("\r DIC_COMM; main;");
					printf(" Reading entry %d",count-1);
				}

				++linenumber;
				inpriority=0; /* reset value */
				inname=0; 	/* reset value */
				index = 0; /*Start at the beginning of the buffer*/
				input_entry.fc = 0;
				
															 
				/* otherwise, see if it is a semi-colon. 
				That means that its a comment and throw the line out*/
				if (buff[0] == ';')
				{
					count--;
					continue;
				}

				header.no_of_entries++;
				
				/* Safety net to keep big dictionaries from running of in memory. cjl
				* starts at 0
				*/
				if (header.no_of_entries == max_entries_in_memory) 
				{
					printf("DIC_COMM; main; Dictionary exceeded max memory ");
					printf("created for %ld entries\n",max_entries_in_memory);
					exit(0);
				}

/*This is to account for a word and a D-word the first two data fields of 
struct d_ent.  It also reinitialize input_entry for each go through of the loop.  */
				input_entry.size = 6;

#ifdef DEBUG
				printf("DIC_COMM;main;debug; This is the line were parsing: %s", buff);
#endif

	/******************			THE GRAPHEME SECTION				**********/
				memset(input_entry.gr_ph,0,sizeof(input_entry.gr_ph));  /* initialize the array */
				s = input_entry.gr_ph;
				grapheme_index = grapheme;	

				while(buff[index] != ',' && buff[index] != '\0')
				{
					if(buff[index] == '\\')
						index++;  /* we skip the backslash.  Allows us to get the real ','*/

					/*I guess this is done to insure that buff[index] is a character.
					For one thing we are taking characters from the file.  And another 
					we want to make sure that the pointers are getting only 8 bit variables.  
					Why don't we cast the variable to char*/	
					*grapheme_index = buff[index] & 0xff;  
					*grapheme_index++;
					(*s++) = buff[index] & 0xff;
					input_entry.size++;  
					index++;
				}

				index++;
				*grapheme_index = '\0';
				(*s++)='\0'; /* add in needed null*/
				input_entry.size++;
			
#ifdef DEBUG
				printf("DIC_COMM; main; debug; the grapheme going on for line %d is %s.", \
					linenumber, input_entry.gr_ph);
#endif
/********************  END  OF GRAPHEME SECTION  *****************************/
								
				switch(buff[index])
				{ 							   
				case 'P':
					input_entry.fc = (input_entry.fc  | FC$M_CHARACTER | FC$M_HOMOGRAPH);
					break;
				case 'S':
					input_entry.fc = (input_entry.fc  | FC$M_HOMOGRAPH);
					break;
				case 'N' :
					break;
				default :
					printf("DIC_COMM; main; ");    
					printf ("In grapheme:%s\n", grapheme); 
					printf("line %d; Received bad homograph field received %c %d\n",\
						linenumber,buff[index],buff[index]);
					exit (1);
				}
				while(buff[index] != ',' && buff[index] != '\0')
					index++; /* get to phoneme field*/
				index++;
/***************************END of the Homograph field   *********************/
/**************************BEGIN of phoneme field      ***********************/
				while( buff[index] != ',' && buff[index] != '\0')
				{
					if (buff[index] == '\\')
						index++;
/*toph means to phoneme.  It changes the char to correct phoneme format[the phoneme numebrs] of dectalk.*/   
					if ((*s++ = toph((unsigned char)buff[index])) == 0xff)
					{
						printf("DIC_COMM; main; ");
						printf ("In grapheme:%s\n", grapheme);
						printf("line %d; entry number %d \n",linenumber,header.no_of_entries);
						exit(1);
					}
#ifdef DEBUG
					printf("DIC_COMM; main; line %d; phopheme  %c \n ",linenumber,tmp);
#endif
					input_entry.size++;
					index++;
				}
				
				index++;
				(*s++)='\0'; /* add in needed null*/
				input_entry.size++; 
/***************************END of the phoneme field ************************/
/***************************BEGIN of the form class field ******************/
				/* we copy the rest of the line so not to modify the line*/
				tempp = buff + index;
				temps = malloc(sizeof(buff) - index);
				strcpy(temps, tempp);	
				if(tempp == NULL)
				printf("DIC_COMM; main; error; Either no heap left or \
error in the line syntax.  This happens at line %d->%s.\n", linenumber, buff);
				else {
					tempp = strtok(temps, ",");
/*tempp2 is done because bitorFC call strtok again and it would wreck the next field*/
					tempp2 = strtok(NULL, ",");  
					
					err = bitorFC(tempp, &input_entry.fc);
					
					if(err == 1)
                                                printf("DIC_COMM; main; warning; no form classes at line %d->%s.\n", \
						linenumber, buff);
					else if(err == 2)
                                                printf("DIC_COMM; main; warning; wrong form class at line %d->%s.\n", \
						linenumber, buff);
				}
/***************************BEGIN of the priority fielf**********************/				
			/*This code was added to support additional fields*/
				if(tempp2 != NULL)
				{
/*					if (tempp2[0] == '1')
						inname=1;    It supposed to be on the thirtieth bit whereever that is.  */
					inpriority=atoi(tempp2);	 

#ifdef DEBUG
					printf("name field = %d\n",inname);
					printf("the priority string %s\n",tempp2); 
					printf("inpriority = %d\n",inpriority);
#endif
				}

				/* are you using the old format for the dictionary? */					   
				if (!oldformat)
				{
					if (((inname==1) && (excludenames==1)) || (inpriority>priority))
					{
#ifdef DEBUG
						printf("inname = %d,  excludenames = %d dropping entry\n",inname,excludenames);
						printf("inpriority = %d,  priority = %d dropping entry\n",inpriority,priority);
#endif									 
						/* subtract one for the skipped entry */
						header.no_of_entries--;  
						count--;
						continue;			/* stop processing this element */
						/* return to the top of the loop */ 							
					}
				}
				
				
/**************	add the entry into the array ..*****/
#ifdef OLD_CODE
/**************	write the entry into the temp file and add the index in ..*****/
#endif
				if (target==MSDOS_FORMAT)
					entry_array[entry_cnt++] = input_entry;
#ifdef OLD_CODE
					fwrite(&input_entry,input_entry.size,1,tfp);
#endif
				else
				{
					/* for non msdos envrionments, 4 byte align the data */
					input_entry.size-=2;
					if (input_entry.size<=4) /* be sure there is some data there */
					{
						input_entry.size=8;
						input_entry.gr_ph[0]='\0';
						input_entry.gr_ph[1]='\0';
						input_entry.gr_ph[2]='\0';
						input_entry.gr_ph[3]='\0';
					}
					ch_index = input_entry.size - 4;
					k=input_entry.size;
				/*adds 3 divides by 4.  Multiplies by 4*/
					k=((k+3) >> 2) << 2;
					k=k-input_entry.size;
					input_entry.size+=(k+2);
					entry_array[entry_cnt++] = input_entry;
					for (lcv = 0; lcv < k; lcv++)
						entry_array[entry_cnt].gr_ph[ch_index++] = ' ';
#ifdef OLD_CODE
					fwrite(&input_entry,input_entry.size-k,1,tfp);
					fwrite(blanks,k,1,tfp);
#endif
				}
#ifdef DEBUG2
				byte_p = (unsigned char *)(&input_entry.size);
				for (i=0;i<input_entry.size;++i)
				{
					printf("(%2x)",*byte_p++);
				}
				printf("\n");
#endif
#ifdef OLD_CODE
/*remeber the offset if the file by saving it in disk_entires*/
				disk_entries[free_entry] = free_offset;
#endif
				free_entry += 1;
#ifdef OLD_CODE
				free_offset += input_entry.size;
#endif
				total_bytes += input_entry.size;		
   }
   printf("\r DIC_COMM; main;");
   printf(" Reading entry %d\n",count-1);
   fclose(infp);
#ifdef OLD_CODE
   printf("\n                                              ");
#endif

   /*
   *	sort the entries onto 28 lists ...
   */
   sort_ents();
   printf("\r                                              ");
   
   /*
   * now, write out dictionary binary file ...  this is all index based, 
   * there are three tables written ...  the spelling/phonetic table, the
   * form class table, and the freqeuncy table ...
   */
   pcd.entries = header.no_of_entries;
   
   pcd.total = total_bytes - (pcd.entries*2); 
   /*	 pcd.total = total_bytes; */
   
   fwrite(&pcd,sizeof(struct pc_dictionary),1,outfp);
#ifdef DEBUG1
   byte_p = (unsigned char *)(&pcd);
   for (i=0;i<sizeof(struct pc_dictionary);++i)
   {
	   printf("[%2x]",*byte_p++);
   }
   printf("\n");
#endif
   
   /*
   *	write out the index table ...
   */
   if (target==MSDOS_FORMAT)
   {
	   addr = (long)pcd.entries*4;
   }
   else
   {
	   addr = 0;
   }
   count = 1;
   for(i=0;i<(28*28);i++)
   {
	   index = *(links+free_entry+i);
	   while(index != 0xffffffff)
	   {
		   if((count++ & 0xff) == 0 && !quietmode)
		   {
			   printf("\r DIC_COMM; main;");
			   printf(" Writing index for entry %d",count-1);
		   }
		   if (target==MSDOS_FORMAT)
		   {
			   addr_186 = ((addr&0xffff0)<<12)+(addr&0xf);
		   }
		   else
		   {
			   addr_186=addr;
		   }
		   fwrite(&addr_186,4,1,outfp);
		   
#ifdef DEBUG5
		   byte_p = (unsigned char *)(&addr_186);
		   for (j=0;j<4;++j)
		   { 
			   printf("[%2x]",*byte_p++);
		   }
		   printf("(%x)\n",index);
#endif
		   read_ent((struct d_ent *)&input_entry,(unsigned int)index);
		   /*		   addr += ((long)(input_entry.size-2)); */
		   addr += ((long)(input_entry.size-2)); 
		   index = *(links+index);
	   }
   }
   printf("\r DIC_COMM; main;");
   printf(" Writing index for entry %d\n",count-1);
#ifdef OLD_CODE
   printf("\r                                              ");
#endif

   /*
   *	write out the spell/pron table ..
   */
   count = 1;
   for(i=0;i<(28*28);i++)
   {
	   index = *(links+free_entry+i);
	   while(index != 0xffffffff)
	   {
		   if((count++ & 0xff) == 0 && !quietmode)
		   {
			   printf("\r DIC_COMM; main;");
			   printf(" Writing text for entry %d",count-1);
		   }
		   read_ent((struct d_ent *)&input_entry.size,(unsigned int)index);
		   fwrite(&input_entry.fc,input_entry.size-2,1,outfp);
		   
#ifdef DEBUG5
		   byte_p = (unsigned char *)(&input_entry.fc);
		   for (j=0;j<input_entry.size-2;++j)
		   {
			   printf("[%2x]",*byte_p++);
		   }
		   printf("(%x)\n",index);
#endif
		   index = *(links+index);
	   }
   }
   printf("\r DIC_COMM; main;");
   printf(" Writing text for entry %d\n",count-1);
#ifdef OLD_CODE
   printf("\r                                              ");
#endif
   return(0);
}



/*
*	alphabetically sort the entries ingnoring case ...
*/
void sort_ents(void)
{
	unsigned char upper_char;
	volatile unsigned char	*is;
	volatile unsigned char	*cs;
	S32 i,j, count,curr;
	
	for(i=0;i<(28*28);i++)
		*(links+free_entry+i) = 0xffffffff;
	is = &input_entry.gr_ph[0];
	cs = &comp_entry.gr_ph[0];
	count = 1;
	
	for(i=free_entry-1;i>=0;i--)
	{
		if(((count++) % 100) == 0 && !quietmode)
		{
			printf("\r DIC_COMM; sort_ents;");
			printf(" Sorting %d complete",count-1);
		}
		read_ent((struct d_ent *)&input_entry,(unsigned int)i);
		upper_char = case_upper[(*is)];
		if(upper_char < 'A')
			curr = 0;
		else
			if(upper_char > 'Z')
				curr = 27;
			else
				curr = upper_char-'A'+1;
#ifdef DEBUG1
			printf("upper_char (%c)(%d)\n",upper_char,curr);
#endif
			if(curr != 0 && curr != 27)
			{
				upper_char = case_upper[*(is+1)];
				curr = curr*28;
				if(upper_char < 'A')
					curr += free_entry;
				else if(upper_char > 'Z')
					curr += (free_entry+27);
				else
					curr += (free_entry+upper_char-'A'+1);
			}
			else
				curr = (curr*28)+free_entry;
			
			while(*(links+curr) != 0xffffffff)
			{
				read_ent((struct d_ent *)&comp_entry.size,(unsigned int)*(links+curr));
				
				for(j=0;
				(case_upper[*(is+j)] == case_upper[*(cs+j)] && *(is+j));j++)
				{
#ifdef DEBUG6			
					printf("input [%c], comp [%c], j [%d], *(is+j) [%d]\n",
						case_upper[*(is+j)],case_upper[*(cs+j)],j,*(is+j));
#endif
				};
				
#ifdef DEBUG6
				printf("\ninput (%c), comp (%c), j (%d)\n",case_upper[*(is+j)],case_upper[*(cs+j)],j);
#endif
				if(case_upper[*(cs+j)] >= case_upper[*(is+j)])
					break;
				curr = *(links+curr);
			}
			*(links+i) = *(links+curr);
			*(links+curr) = i;
	}
	
	/* display the last message for a total count */
	printf("\r DIC_COMM; sort_ents;");
	printf(" Sorting %d complete\n",count-1);
}




void read_ent(struct d_ent * ent, unsigned int index)
{
	*ent = entry_array[index];
#ifdef OLD_CODE
#ifdef DEBUG3
	printf("index (%d)(%d)(%d)\n",*(disk_entries+index),disk_entries,index);
#endif
	
	fseek(tfp,*(disk_entries+index),SEEK_SET); 
	fread(&(*ent).size,sizeof(ent->size),1,tfp);
	fread(&(*ent).fc,(*ent).size,1,tfp);
	
#ifdef DEBUG3
	printf("entry (%d)(%d)\n",(*ent).fc,(*ent).size);
#endif
#endif
}												



unsigned char toph(unsigned char c)
{
	PTAB *ptp;
	
	if(c == 0)
		return(c);
	
	ptp = &ptab[0];
	while (ptp<&ptab[NPTAB] && ptp->p_graph!=c)
		++ptp;
	if (ptp == &ptab[NPTAB])
	{									  
		printf("\n DIC_COMM; toph; line %ld; Bad phone == %02X\n",linenumber, c);
		ptp--;
		printf("\n DIC_COMM; toph; line %ld; Bad phone == %c\n",linenumber, ptp->p_graph);
		exit (1);
		return(0xff);
	}
	return(ptp->p_phone);
}




unsigned char from_ph(unsigned char c)
{
	PTAB *ptp;
	
	ptp = &ptab[0];
	while (ptp<&ptab[NPTAB] && ptp->p_phone!=c)
		++ptp;
	return(ptp->p_graph);
}	   




unsigned char *form_class_strings[] = {
		"adj",
		"adv",
		"art",
		"aux",
		"be" ,
		"bev",
		"conj",
		"ed" ,
		"have",
		"ing",
		"noun",
		"poss",
		"prep",
		"pron",
		"subc",
		"that",
		"to" ,
		"verb",
		"who",
		"neg",
		"intr",
		"refl",
		"part",
		"func",
		"cont",
		"char",
		"refr",
		"det",
		"unused",
		"mark",
		"cont",
		"homo",
};


void print_fc(long fc_val, FILE *fp)
{
	int i;
	long fc_mask;
	
	if(fc_val)
	{
		fc_mask = 1;
		for(i=0;i<32;i++)
		{
			if(fc_val & fc_mask)
				fprintf(fp," %s",form_class_strings[i]);
			fc_mask = fc_mask*2;
		}
	}
	else
		fprintf(fp," none");
}




void print_tf(long val, FILE *fp)
{
	if(val)
		fprintf(fp,",T");
	else
		fprintf(fp,",F");
}



void quote_string(unsigned char * str)
{
	int i;
	unsigned char q;
	
	q = (str[0] == '"') ? '\'' : '"';
	for(i=0;str[i];i++);
	str[i+1] = q;
	str[i+2] = 0;
	while(i)
	{
		str[i] = str[i-1];
		i--;
	}
	str[0] = q;
}



/*bitorFC  This function does blah blah blah*/
int bitorFC(char* szLine, U32* output)
{
	
	U32 nForm_class[] =
	{
		0x00000001,
			0x00000002,
			0x00000004,
			0x00000008,
			0x00000010,
			0x00000020,
			0x00000040,
			0x00000080,
			0x00000100,
			0x00000200,
			0x00000400,
			0x00000800,
			0x00001000,
			0x00002000,
			0x00004000,
			0x00008000,
			0x00010000,
			0x00020000,
			0x00040000,
			0x00080000,
			0x00100000,
			0x00200000,
			0x00400000,
			0x00800000,
			0x01000000,
			0x02000000,
			0x04000000,
			0x20000000,
			0x40000000,
			0x80000000
	};
	
	
	
	struct listNode
	{
		char* pszFC;
		struct listNode* left;
		struct listNode* right;
	};
	
	typedef struct listNode LISTNODE;
	typedef LISTNODE* LISTNODEPTR;
	
	int i, j;
	int err_flag = 1;
	char *pszTemp = NULL;
	int size = 1;
	LISTNODEPTR pliTemp;
	LISTNODEPTR pliCurrent;
	LISTNODEPTR pliStart;
	
	pszTemp = strtok(szLine, "-");
	pliStart = malloc(sizeof(LISTNODE));
	if(pliStart == NULL)
	{
		fputs("DIC_COMM:Error:Out of HEAP", stderr);
		exit(1);
	}
	pliStart->pszFC = pszTemp;
	pliStart->left = pliStart;
	pliStart->right = pliStart;
	pliCurrent = pliStart;
	if(pszTemp == NULL)
		size = 0;
	
	while((pszTemp = strtok(NULL, "-")) != NULL)
	{
		pliTemp = malloc(sizeof(LISTNODE));
		
		if(pliTemp != NULL)
		{
			pliTemp->pszFC = pszTemp;
			pliTemp->left = pliCurrent;
			pliTemp->right = pliStart;
			pliCurrent->right = pliTemp;
			pliStart->left = pliTemp;
			pliCurrent = pliTemp;
			size++;
		}
		else
			fputs("DIC_COMM:Error: Out of HEAP", stderr);
	}

	pliCurrent = pliStart;
	for(i = 0; i < 29; i++)
	{
		for(j = 0; j < size; j++)
		{
			if( strcmp(pliCurrent->pszFC, form_class_strings[i]) == 0)
			{
				*output = (*output | nForm_class[i]);
				pliTemp = pliCurrent;
				pliTemp->left->right = pliTemp->right;
				pliTemp->right->left = pliTemp->left;
				pliCurrent = pliTemp->right;
				free(pliTemp);
				size--;
				err_flag = 0;
				break;
			}	
			else
				pliCurrent = pliCurrent->right;
		}
		if(size == 0)
			break;
	}
	if(size != 0)
		err_flag = 2;
	
	return err_flag;
}

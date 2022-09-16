 /***********************************************************************
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
 *    File Name:	ldr_file.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC load support routines ... this module contains all the
 *  code to load the dictionarys and executable images into the module.
 *
 ***********************************************************************
 *    Revision History:
 * 001 01-mar-95 CJL	Change means of identifying language specific .dics.
 *			Prevent loading multiple same language .dics.
 * 002 17-May-95 GL	Add the code for Spanish, German and French .dic file loading
 *                      all codes are modified from Spanish section.
 * 003 31-Aug-95 GL	Fix the bug of using "SPRIMARY_DIC" instead of "GPRIMARY_DIC"
 *                      for German.
 * 004 02-Feb-96 GL	Add the code for Spanish, German and French user dictionary file loading
 * 005 26-Aug-96 GL	change dictionary language tag from /e to /us, /s to /sp, /g to /gr
 * 006 25-Sep-97 GL     redesign the language dictionary symbol and loading structure
 *                      also add UK_british loading block
 * 007 25-Jul-98 MFG Addded Latin American support
 *
 * 008 12-mar-97/
 *     02-sep-98 TK     to report free memory in verbose mode
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
/*#define DEBUG */
#include	"ldr.h"
#include	"ldrp.h"

/* TK 9/2/98 to support reporting free memory in verbose mode */
unsigned long get_free_mem(void);
/* Pauses for a specified number of milliseconds. */
void sleep( clock_t wait )
{
	long factor = 1000/CLOCKS_PER_SEC;
	   clock_t goal;
	   goal = (wait*factor) + clock();
	   while( goal > clock() )
		      ;
}

/*
 *  load_scan is used to scan the command line to determine which modules
 *  to load into the DECtalk-PC board.  Files on the command line are
 *  order dependent within the class of file that is being loaded.  The
 *  line is scanned for .sys files first to load the kernel, .dic files
 *  next to load dictionarys and finally .exe files to load tasks.
 *	(001 01-mar-95 cjl) .dic file language identification has been
 *	accomplished with the use of checking the final letter of the
 *	filename. A 'c' would indicate the English dictionary, an 's'
 *	would indicated Spanish, etc. This approach fails if a ditionary
 *	is call freds.dic, but is English. The new approach will take
 *	use command line options on each .dic file. A freds.dic file
 *	will be loaded as the English dictionary. A freds.dic-e file
 *	will also be loaded as the English dictionary. A freds.dic-s
 *	file will be loaded as the Spanish dictionary. The option is
 *	case insensitive, must have no separator from the dictionary
 *	file name and may be indicated by either '-' or '/'. Other
 *	options for other languages will be added. User
 *	dictionaries (.dtu or .dta) will not use this option.
 *
 *      (002 17-May-95 GL)
 *      use .dic-g .dic-G or /G, /g for germainc dictionary files
 *      use .dic-f .dic-F or /F, /f for french dictionary files
 *
 */

/*
 *  multi-language support ...
 */
#define LANG_english            0x0000
#define LANG_french             0x0001
#define LANG_german             0x0002
#define LANG_spanish            0x0003
#define LANG_japanese           0x0004
#define LANG_british            0x0005
#define LANG_latin_american		0x0006
#define LANG_none               0xffff
#define MAX_languages           7

int kernel_found = FALSE;     	/* mark kernel.sys not found */
int p_dic_found[MAX_languages];	/* flag for .dic not found */
int u_dic_found[MAX_languages];	/* flag for .dtu not found */
int a_dic_found[MAX_languages];	/* flag for .dta not found */

int load_scan(int argc,char *argv[])
/*int argc;*/
/*char *argv[];*/
{
	FILE	*fp;
	int	i,ext;
	char *read_buff;
	struct dos_reloc *fixups;
	char clean_argv[40];/* size=8,name; 1'.';3,ext;1'-'or'/';1,'e'or's';2,spare*/

	if((read_buff = malloc(READ_BUFF_SIZE)) == NULL)
		{
		printf("\nNo memory for DMA read buffer.");
		exit(1);
		}
	if((fixups = (struct dos_reloc *)malloc(MAX_FIXUPS*4)) == NULL)
		{
		printf("\nNo memory for relocation fix up buffer.");
		exit(1);
		}

/*
 *  find the kernel file ...
 */

	if(get_mod_id() != ID_kernel)
	{
		for(i=1;i<argc;i++)
			{
			ext = strcspn(argv[i],".");
			if(_stricmp(&argv[i][ext+1],"sys") != 0)
				continue;
			if(kernel_found == TRUE)
				tsr_error("Multiple kernel files found.");
			if ((fp=fopen(argv[i],"r+b")) != NULL)
				{
				if(verbose)
					printf("\nLoading kernel file %s.",argv[i]);
				kernel_load(fp,read_buff,fixups);
				fclose(fp);
				kernel_found = TRUE;     /* mark a kernel.sys found */
				break;
				}
			else
				tsr_error("Error opening kernel file.");
			}
		if(i == argc)
			{
			printf("\nDECtalk kernel must be loaded on module.");
			printf("\nSpecify a kernel file to load.");
			exit(1);
			}

		/* TK 9/2/98 to support reporting free memory in verbose mode */
		if (verbose)
		{
			// sleep for a short bit to make sure that all the on-board
			// allocations have time to happen..
			sleep(50);
			printf("\n %ld bytes free after exe load,",get_free_mem());
		}
	}

/*
 *  GL 09/25/1997, rewrite the dictionary loading routine.
 */

    /* initialize the flag array */
	for(i=0;i<MAX_languages;i++)
	{
		p_dic_found[i] = FALSE;
		u_dic_found[i] = FALSE;
		a_dic_found[i] = FALSE;
	}
	for(i=1;i<argc;i++)
	{
		ext = strcspn(argv[i],".");
		/* find the English dictionary */
		if((_stricmp(&argv[i][ext],".dic") == 0) ||    /* assumed English */
			(_stricmp(&argv[i][ext],".dic-us") == 0) || /* or -us option */
			(_stricmp(&argv[i][ext],".dic/us") == 0))   /* or /us option */
	    {
                        if(p_dic_found[LANG_english] == TRUE)
				tsr_error("Multiple English dictionary files found");
			strcpy(clean_argv,argv[i]);
			if(strtok(clean_argv,".") != 0)
				if(strtok(0,"-/") != 0)
					strncpy(clean_argv,argv[i],strlen(argv[i])-3);
				else
					strncpy(clean_argv,argv[i],strlen(argv[i]));
			if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading primary English dictionary file %s.",argv[i]);
#ifndef NWSNOAA
                if(load_dic(fp,read_buff,"primary",PRIMARY_DIC,LANG_english) == TSR_FAILURE)
#else
                if(load_dic(fp,read_buff,"primary",EPRIMARY_DIC) == TSR_FAILURE)
#endif
					tsr_error("English dictionary load failure.");
				fclose(fp);
                                p_dic_found[LANG_english] = TRUE;            /* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening dictionary file");
		}
		/* find the British dictionary */
		if((_stricmp(&argv[i][ext],".dic-uk") == 0) ||  /* or -uk option */
			(_stricmp(&argv[i][ext],".dic/uk") == 0))   /* or /uk option */
	    {
			if(p_dic_found[LANG_british] == TRUE)
				tsr_error("Multiple UK_english dictionary files found");
			strcpy(clean_argv,argv[i]);
			if(strtok(clean_argv,".") != 0)
				if(strtok(0,"-/") != 0)
					strncpy(clean_argv,argv[i],strlen(argv[i])-3);
				else
					strncpy(clean_argv,argv[i],strlen(argv[i]));
			if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading primary UK_english dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"primary",PRIMARY_DIC,LANG_british) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"primary",BPRIMARY_DIC) == TSR_FAILURE)
#endif
					tsr_error("UK_english dictionary load failure.");
				fclose(fp);
				p_dic_found[LANG_british] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening dictionary file");
		}
		/* find the Spanish dictionary */
		if((_stricmp(&argv[i][ext],".dic-sp") == 0) ||  /* or -sp option */
			(_stricmp(&argv[i][ext],".dic/sp") == 0))   /* or /sp option */
	    {
			if(p_dic_found[LANG_spanish] == TRUE)
				tsr_error("Multiple Spanish dictionary files found");
			strcpy(clean_argv,argv[i]);
			if(strtok(clean_argv,".") != 0)
				if(strtok(0,"-/") != 0)
					strncpy(clean_argv,argv[i],strlen(argv[i])-3);
				else
					strncpy(clean_argv,argv[i],strlen(argv[i]));
			if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading primary Spanish dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"primary",PRIMARY_DIC,LANG_spanish) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"primary",SPRIMARY_DIC) == TSR_FAILURE)
#endif
					tsr_error("Spanish dictionary load failure.");
				fclose(fp);
				p_dic_found[LANG_spanish] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening dictionary file");
		}
		/* find the Latin American dictionary */
		if((_stricmp(&argv[i][ext],".dic-la") == 0) ||  /* or -la option */
			(_stricmp(&argv[i][ext],".dic/la") == 0))   /* or /la option */
	    {
			if(p_dic_found[LANG_latin_american] == TRUE)
				tsr_error("Multiple Latin American dictionary files found");
			strcpy(clean_argv,argv[i]);
			if(strtok(clean_argv,".") != 0)
				if(strtok(0,"-/") != 0)
					strncpy(clean_argv,argv[i],strlen(argv[i])-3);
				else
					strncpy(clean_argv,argv[i],strlen(argv[i]));
			if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading primary Latin American dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"primary",PRIMARY_DIC,LANG_latin_american) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"primary",LPRIMARY_DIC) == TSR_FAILURE)
#endif
					tsr_error("Latin American dictionary load failure.");
				fclose(fp);
				p_dic_found[LANG_latin_american] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening dictionary file");
		}
		/* find the German dictionary */
		if((_stricmp(&argv[i][ext],".dic-gr") == 0) ||  /* or -gr option */
			(_stricmp(&argv[i][ext],".dic/gr") == 0))   /* or /gr option */
	    {
			if(p_dic_found[LANG_german] == TRUE)
				tsr_error("Multiple German dictionary files found");
			strcpy(clean_argv,argv[i]);
			if(strtok(clean_argv,".") != 0)
				if(strtok(0,"-/") != 0)
					strncpy(clean_argv,argv[i],strlen(argv[i])-3);
				else
					strncpy(clean_argv,argv[i],strlen(argv[i]));
			if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading primary German dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"primary",PRIMARY_DIC,LANG_german) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"primary",GPRIMARY_DIC) == TSR_FAILURE)
#endif
					tsr_error("German dictionary load failure.");
				fclose(fp);
				p_dic_found[LANG_german] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening dictionary file");
		}
		/* find the French dictionary */
		if((_stricmp(&argv[i][ext],".dic-fr") == 0) ||  /* or -fr option */
			(_stricmp(&argv[i][ext],".dic/fr") == 0))   /* or /fr option */
	    {
			if(p_dic_found[LANG_french] == TRUE)
				tsr_error("Multiple French dictionary files found");
			strcpy(clean_argv,argv[i]);
			if(strtok(clean_argv,".") != 0)
				if(strtok(0,"-/") != 0)
					strncpy(clean_argv,argv[i],strlen(argv[i])-3);
				else
					strncpy(clean_argv,argv[i],strlen(argv[i]));
			if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading primary French dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"primary",PRIMARY_DIC,LANG_french) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"primary",FPRIMARY_DIC) == TSR_FAILURE)
#endif
					tsr_error("French dictionary load failure.");
				fclose(fp);
				p_dic_found[LANG_french] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening dictionary file");
		}
	}


/*
 *  English user dic files ...
 */

	for(i=1;i<argc;i++)
	{
		ext = strcspn(argv[i],".");
		/* find the English user dictionary */
        if((_stricmp(&argv[i][ext],".dtu") == 0) ||   /* assumed English */
          (_stricmp(&argv[i][ext],".dtu-us") == 0) || /* or -us option */
          (_stricmp(&argv[i][ext],".dtu/us") == 0))   /* or /us option */
		{
                        if(u_dic_found[LANG_english] == TRUE)
			tsr_error("Multiple English user dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading English user dictionary file %s.",argv[i]);
#ifndef NWSNOAA
                if(load_dic(fp,read_buff,"user",USER_DIC,LANG_english) == TSR_FAILURE)
#else
                if(load_dic(fp,read_buff,"user",USER_DIC) == TSR_FAILURE)
#endif
					tsr_error("English user dictionary load failure.");
				fclose(fp);
                                u_dic_found[LANG_english] = TRUE;            /* mark a kernel.sys found */
			}
			else
			tsr_error("Error opening English user dictionary file");
		}
		/* find the UK_english user dictionary */
        if((_stricmp(&argv[i][ext],".dtu-uk") == 0) || /* or -uk option */
          (_stricmp(&argv[i][ext],".dtu/uk") == 0))    /* or /uk option */
		{
			if(u_dic_found[LANG_british] == TRUE)
			tsr_error("Multiple UK_english user dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading UK_english user dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"user",USER_DIC,LANG_british) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"user",BUSER_DIC) == TSR_FAILURE)
#endif
					tsr_error("UK_english user dictionary load failure.");
				fclose(fp);
				u_dic_found[LANG_british] = TRUE;		/* mark a kernel.sys found */
			}
			else
			tsr_error("Error opening UK_english user dictionary file");
		}
		/* find the Spanish user dictionary */
        if((_stricmp(&argv[i][ext],".dtu-sp") == 0) || /* or -sp option */
          (_stricmp(&argv[i][ext],".dtu/sp") == 0))    /* or /sp option */
		{
			if(u_dic_found[LANG_spanish] == TRUE)
			tsr_error("Multiple Spanish user dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading Spanish user dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"user",USER_DIC,LANG_spanish) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"user",SUSER_DIC) == TSR_FAILURE)
#endif
					tsr_error("Spanish user dictionary load failure.");
				fclose(fp);
				u_dic_found[LANG_spanish] = TRUE;		/* mark a kernel.sys found */
			}
			else
			tsr_error("Error opening Spanish user dictionary file");
		}
		/* find the Latin American user dictionary */
        if((_stricmp(&argv[i][ext],".dtu-la") == 0) || /* or -la option */
          (_stricmp(&argv[i][ext],".dtu/la") == 0))    /* or /la option */
		{
			if(u_dic_found[LANG_latin_american] == TRUE)
			tsr_error("Multiple Latin American user dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading Latin American user dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"user",USER_DIC,LANG_latin_american) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"user",LUSER_DIC) == TSR_FAILURE)
#endif
					tsr_error("Latin American user dictionary load failure.");
				fclose(fp);
				u_dic_found[LANG_latin_american] = TRUE;		/* mark a kernel.sys found */
			}
			else
			tsr_error("Error opening Latin American user dictionary file");
		}
		/* find the German user dictionary */
        if((_stricmp(&argv[i][ext],".dtu-gr") == 0) || /* or -gr option */
          (_stricmp(&argv[i][ext],".dtu/gr") == 0))    /* or /gr option */
		{
			if(u_dic_found[LANG_german] == TRUE)
			tsr_error("Multiple German user dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading German user dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"user",USER_DIC,LANG_german) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"user",GUSER_DIC) == TSR_FAILURE)
#endif
					tsr_error("German user dictionary load failure.");
				fclose(fp);
				u_dic_found[LANG_german] = TRUE;		/* mark a kernel.sys found */
			}
			else
			tsr_error("Error opening German user dictionary file");
		}
		/* find the French user dictionary */
        if((_stricmp(&argv[i][ext],".dtu-fr") == 0) || /* or -fr option */
          (_stricmp(&argv[i][ext],".dtu/fr") == 0))    /* or /fr option */
		{
			if(u_dic_found[LANG_french] == TRUE)
			tsr_error("Multiple French user dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading French user dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"user",USER_DIC,LANG_french) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"user",FUSER_DIC) == TSR_FAILURE)
#endif
					tsr_error("French user dictionary load failure.");
				fclose(fp);
				u_dic_found[LANG_french] = TRUE;		/* mark a kernel.sys found */
			}
			else
			tsr_error("Error opening French user dictionary file");
		}
	}


/*
 *  now user abbreviation dic files ...
 */

	for(i=1;i<argc;i++)
	{
		ext = strcspn(argv[i],".");
		/* find the English abbreviation dictionary */
        if((_stricmp(&argv[i][ext],".dta") == 0) ||   /* assumed English */
          (_stricmp(&argv[i][ext],".dta-us") == 0) || /* or -us option */
          (_stricmp(&argv[i][ext],".dta/us") == 0))   /* or /us option */
		{
                        if(a_dic_found[LANG_english] == TRUE)
			tsr_error("Multiple English abbreviation dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading English abbreviation dictionary file %s.",argv[i]);
#ifndef NWSNOAA
                if(load_dic(fp,read_buff,"user",ABBREV_DIC,LANG_english) == TSR_FAILURE)
#else
                if(load_dic(fp,read_buff,"user",ABBREV_DIC) == TSR_FAILURE)
#endif
					tsr_error("English abbreviation dictionary load failure.");
				fclose(fp);
                                a_dic_found[LANG_english] = TRUE;            /* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening English abbreviation dictionary file");
		}
		/* find the British abbreviation dictionary */
        if((_stricmp(&argv[i][ext],".dta-uk") == 0) || /* or -uk option */
          (_stricmp(&argv[i][ext],".dta/uk") == 0))   /* or /uk option */
		{
			if(a_dic_found[LANG_british] == TRUE)
			tsr_error("Multiple UK_english abbreviation dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading UK_english abbreviation dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC,LANG_british) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC) == TSR_FAILURE)
#endif
					tsr_error("UK_english abbreviation dictionary load failure.");
				fclose(fp);
				a_dic_found[LANG_british] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening UK_english abbreviation dictionary file");
		}
		/* find the Spanish abbreviation dictionary */
        if((_stricmp(&argv[i][ext],".dta-sp") == 0) || /* or -sp option */
          (_stricmp(&argv[i][ext],".dta/sp") == 0))   /* or /sp option */
		{
			if(a_dic_found[LANG_spanish] == TRUE)
			tsr_error("Multiple Spanish abbreviation dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading Spanish abbreviation dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC,LANG_spanish) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC) == TSR_FAILURE)
#endif
					tsr_error("Spanish abbreviation dictionary load failure.");
				fclose(fp);
				a_dic_found[LANG_spanish] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening Spanish abbreviation dictionary file");
		}
		/* find the German abbreviation dictionary */
        if((_stricmp(&argv[i][ext],".dta-gr") == 0) || /* or -gr option */
          (_stricmp(&argv[i][ext],".dta/gr") == 0))    /* or /gr option */
		{
			if(a_dic_found[LANG_german] == TRUE)
			tsr_error("Multiple German abbreviation dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading German abbreviation dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC,LANG_german) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC) == TSR_FAILURE)
#endif
					tsr_error("German abbreviation dictionary load failure.");
				fclose(fp);
				a_dic_found[LANG_german] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening German abbreviation dictionary file");
		}
		/* find the French abbreviation dictionary */
        if((_stricmp(&argv[i][ext],".dta-fr") == 0) || /* or -fr option */
          (_stricmp(&argv[i][ext],".dta/fr") == 0))    /* or /fr option */
		{
			if(a_dic_found[LANG_german] == TRUE)
			tsr_error("Multiple French abbreviation dictionary files found");

            strcpy(clean_argv,argv[i]);
            if(strtok(clean_argv,".") != 0)
               if(strtok(0,"-/") != 0)
                  strncpy(clean_argv,argv[i],strlen(argv[i])-3);
               else
                  strncpy(clean_argv,argv[i],strlen(argv[i]));
            if ((fp=fopen(clean_argv,"r+b")) != NULL)
			{
				if(verbose)
					printf("\nLoading French abbreviation dictionary file %s.",argv[i]);
#ifndef NWSNOAA
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC,LANG_french) == TSR_FAILURE)
#else
				if(load_dic(fp,read_buff,"abbreviation",ABBREV_DIC) == TSR_FAILURE)
#endif
					tsr_error("French abbreviation dictionary load failure.");
				fclose(fp);
				a_dic_found[LANG_french] = TRUE;		/* mark a kernel.sys found */
			}
			else
				tsr_error("Error opening French abbreviation dictionary file");
		}
	}



/*
 *  finally, load and start the executable images ...
 */

	for(i=1;i<argc;i++)
		{
		ext = strcspn(argv[i],".");
		if(_stricmp(&argv[i][ext+1],"exe") != 0)
			continue;
#ifdef DEBUG
		printf("DEBUG17- Opening argv[%d] as: %s\n",i,argv[i]);
#endif
		if ((fp=fopen(argv[i],"r+b")) != NULL)
			{
			if(verbose)
				printf("\nLoading executable file %s.",argv[i]);
			if(load_exe(fp,0x0,read_buff,fixups) == TSR_FAILURE)
				tsr_error("Executable load failure");
			fclose(fp);
			}
		else
			tsr_error("Error opening executable file");
		}
	free(read_buff);
	free(fixups);
}


/*
 *  MS-dos .exe file loader
 */

load_exe(fexe,load_addr,read_buff,fixups)
FILE *fexe;
unsigned long load_addr;
char *read_buff;
struct dos_reloc *fixups;
{

	int	i,read_size;
	unsigned int total_paras,seg_fix;
	long	image_left,image_done,fix;
	struct dos_exe_header header;

/*
 *  Now, open up the .exe file and extract all the cgroup data and
 *  write that out to the .abs file ...
 */

	fread(&header,sizeof(struct dos_exe_header),1,fexe);
	if (header.id != 0x5a4d)
		{
		if(verbose)
			printf("\nInvalid .EXE file format, no signature in file.");
		return(TSR_FAILURE);
		}

	if(header.relen <= MAX_FIXUPS)
		{
		fseek(fexe,(long)header.reloc,SEEK_SET);
		fread(fixups,sizeof(struct dos_reloc)*header.relen,1,fexe);
		}
	else
		{
		printf("\nCan't load image, too many fixups.");
		return(TSR_FAILURE);
		}

/*
 * load in and fix up the image ...
 */

	fseek(fexe,(long)(header.hsize*16),SEEK_SET);
	image_left = ((long)(header.pages-1)*512)+(long)header.rem-((long)header.hsize*16);
	total_paras = (unsigned int)(image_left>>4)+header.hmin+16; 
	image_done = 0;

	if(load_addr == 0)
		{
		if((load_addr=get_mem(total_paras)) == 0)
			{
			printf("\nError allocating memory on module.");
			return(TSR_FAILURE);
			}
		}
	seg_fix = (load_addr >> 4) & 0xffff;

	if(verbose)
		{
		printf("\nLoading image of %ld bytes (%d relocs).",
			image_left,header.relen);
		printf("\nAllocating %ld bytes of free ram at %05lx.",
			(long)header.hmin*16,load_addr);
		printf("\nTotal memory taken is %ld bytes.",(long)total_paras*16);
		printf("\n      cs:ip == %04x:%04x   ss:sp == %04x:%04x",
			header.csval+seg_fix,header.ipval,header.ssval+seg_fix,header.spval);
		}

   while(image_left>0)
     {
		read_size = (image_left > (long)READ_BUFF_SIZE) ? READ_BUFF_SIZE : (int)image_left;
		fread(read_buff,read_size,1,fexe);
		for(i=0;i<header.relen;i++)
			{
	      fix = ((long)fixups[i].segment<<4)+(long)fixups[i].offset;
			if(fix >= image_done && fix < image_done+read_size)
				(*(unsigned int *)&read_buff[fix-image_done]) += seg_fix;
			}
		load_mem(image_done+load_addr,read_buff,read_size);
		image_left -= read_size;
		image_done += read_size;
		}

		if (verbose)
		{
			/* TK 9/2/98 to support reporting free memory in verbose mode */
			// sleep for a short bit to make sure that all the on-board
			// allocations have time to happen..
			sleep(50);
			printf("\n %ld bytes free after exe load,",get_free_mem());
		}
		return(start_exe(header.csval+seg_fix,header.ipval));
}


/*
 * dtpc dictionary loader ...
 */
#ifndef NWSNOAA
load_dic(FILE *fdic,char *read_buff,char *name,int kind,int lang)
#else
load_dic(FILE *fdic,char *read_buff,char *name,int kind)
#endif

{

	int	i,read_index,read_size,act_size;
	char fnam[80];
	unsigned int *index_fix;

	long	entries,index,dic_bytes,load_addr,dic_addr,total_done;
	unsigned int total_paras,seg_fix;

/*
 * read in the entry count and the actual entry size excluding the
 * index table (which is entries * 4) ...
 */

	fread(&entries,4,1,fdic);
	fread(&dic_bytes,4,1,fdic);
	if(verbose)
		printf("\nLoading %s dictionary of %ld entries, %ld bytes.",
				name,entries,dic_bytes);

	total_paras = ((((long)entries*4)+dic_bytes)>>4)+2;
	if(verbose)
		printf("\nAllocating %u paragraphs of free RAM.",total_paras);

	if((load_addr=get_mem(total_paras)) == 0)
		{
		printf("\nError allocating memory on module.");
		return(TSR_FAILURE);
		}
	seg_fix = (load_addr >> 4) & 0xffff;
	dic_addr = load_addr;

/*
 *  read, reloc and load a bunch of indexes ...
 */

	index = entries;
	total_done = 0;
	index_fix = (unsigned int *)&read_buff[0];
	if(verbose)
		printf("\nIndex table starts at %lx.\n",load_addr);
	while(index>0)
		{
		read_index = (index > (READ_BUFF_SIZE/4)) ? (READ_BUFF_SIZE/4) : index;
		if((act_size = fread(read_buff,1,read_index*4,fdic)) != read_index*4)
			{
	   	printf("\nError reading indexes.");
	   	printf("\n      exp : %d  act : %d",read_index*4,act_size);
			exit(1);
			};
		for(i=1;i<read_index*2;i+=2)
			index_fix[i] += seg_fix;
		load_mem(load_addr,read_buff,read_index*4);
		load_addr += read_index*4;
		index = index - (long)read_index;
		total_done += read_index;
		if(verbose)
	   	printf("\rLoading indexes. %ld",total_done);
		}
/*
 *  now, load up the dictionary bytes ...
 */
	if(verbose)
		printf("\nDictionary text starts at %lx.\n",load_addr);
	total_done = 0;
   while(dic_bytes>0)
     {
		read_size = (dic_bytes > (long)READ_BUFF_SIZE) ? READ_BUFF_SIZE : (int)dic_bytes;
		if((act_size = fread(read_buff,1,read_size,fdic)) != read_size)
			{
			printf("\nError reading dictionary text!");
			printf("\n      asked : %d  actual : %d\n",act_size,read_size);
			exit(1);
			}
		load_mem(load_addr,read_buff,read_size);
		dic_bytes -= read_size;
		load_addr += read_size;
		total_done += read_size;
		if(verbose)
	   	printf("\rLoading text %ld.",total_done);
		}
#ifndef NWSNOAA
	set_dic(dic_addr,entries,kind,lang);
#else
	set_dic(dic_addr,entries,kind);
#endif
	return(TSR_SUCCESS);
}

/*
 *  load_mem() is used to send a memory load packet to the DECtalk
 *  module ...
 */

load_mem(addr,buff,size)
long	addr;
char	_far *buff;
int	size;
{
	union _REGS  tsr_regs;
	struct	dectalk_load_pb pb;
	struct 	dectalk_load_pb _far *ppb;

	ppb = &pb;

	(*ppb).addr = addr;
	(*ppb).count = size;
	(*ppb).buff = buff;

	RB.ah = DECTALK_ID;
	RB.al = LOAD_MEM;
	RW.dx = FP_SEG(ppb);
	RW.bx = FP_OFF(ppb);
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);
	if(RW.ax != TSR_SUCCESS)
		tsr_error("Memory load failure");
	return(TSR_SUCCESS);
}

start_exe(cs,ip)
unsigned int cs,ip;
{
	union _REGS  tsr_regs;

	RB.ah = DECTALK_ID;
	RB.al = START_TASK;
	RW.dx = cs;
	RW.bx = ip;
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);
	return(RW.ax);
}

unsigned long get_mem(size)
unsigned int	size;
{
	union _REGS  tsr_regs;

	RB.ah = DECTALK_ID;
	RB.al = ALLOC_MEM;
	RW.cx = size;
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);
	if(RW.ax == TSR_SUCCESS)
		return((((unsigned long)RW.dx) << 4)+RW.bx);
	return(0);
}

#ifndef NWSNOAA
set_dic(long addr,long ents,int kind,int lang)
#else
set_dic(long addr,long ents,int kind)
#endif

{

	union _REGS  tsr_regs;
	struct	dectalk_load_dic	dlb;
	struct	dectalk_load_dic	_far *dp;

	dp = &dlb;
	(*dp).dic = LONG_TO_FP(addr);
	(*dp).entries = ents;
	(*dp).type = kind;
#ifndef NWSNOAA
	(*dp).lang = lang;
#endif

	RB.ah = DECTALK_ID;
	RB.al = SET_DIC;
	RW.dx = FP_SEG(dp);
	RW.bx = FP_OFF(dp);
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);

}


unsigned int get_mod_id()
{
	union _REGS  tsr_regs;

	RB.ah = DECTALK_ID;
	RB.al = GET_ID;
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);
	return(RW.bx);
}



unsigned int get_ss()
{
	unsigned int temp;
	_asm	mov	ax,ss
	_asm	mov	temp,ax
	return(temp);
}


/* TK 9/2/98 to support reporting free memory in verbose mode */
unsigned long get_free_mem(void)
{
	union _REGS  tsr_regs;

	RB.ah = DECTALK_ID;
	RB.al = FREE_MEM;
	RW.dx = 0;
	RW.bx = 0;
	RW.cx = 0x1;
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);
	if(RW.ax != TSR_SUCCESS)
		tsr_error("free_mem failure");
	return((long)(RW.cx)*16);
}

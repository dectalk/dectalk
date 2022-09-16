/**********************************************************************/
/*                                                                    */
/*  COPYRIGHT NOTICE                                                  */
/*                                                                    */
/*  Copyright (c) Digital Equipment Corporation, 1993                 */
/*  All Rights reserved. Unpublished rights reserved under the        */
/*  copyright laws of the United States. Copyright is claimed in      */
/*  the computer program and user interface thereof.                  */
/*                                                                    */
/*  The software contained on this media is proprietary to and        */
/*  embodies the confidential technology of Digital Equipment         */
/*  Corporation. Possession, use, duplication or dissemination of     */
/*  the software and media is authorized only pursuant to a valid     */
/*  written license from Digital Equipment Corporation.               */
/*                                                                    */
/*  The name of Digital Equipment Corporation may not be used to      */
/*  endorse or promote products derived from this software without    */
/*  specific prior written permission. All other rights reserved.     */
/*                                                                    */
/*  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR      */
/*  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED        */
/*  WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS        */
/*  FOR A PARTICULAR PURPOSE.                                         */
/*  Digital assumes no responsibility AT ALL for the use or           */
/*  reliability of this software.                                     */
/*                                                                    */
/*                                                                    */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS       | */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)       | */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |                                                                | */
/* +----------------------------------------------------------------+ */
/*                                                                    */
/**********************************************************************/
/*
/* This program acts somewhat like a C preprocessor; it looks at #ifdef*/
/* types of conditionals an conditionally removes the enclosed block   */
/* from the output file. The difference is that it ONLY processes      */
/* those conditionals that are on the include/exclude list, and ignores*/
/* all others. It also does no macro processing, and doesn't touch     */
/* embedded newlines or comments.                                      */
/*                                                                     */
/* #elif statements that are on the active lists are not allowed and   */
/* will result in an informational message, and the resulting file     */
/* will have an #error directive at this line which will cause a       */
/* subsequent compile of the file to abort.                            */
/*                                                                     */
/* the output file is given the same timestamp as the last-write of    */
/* the input file.                                                     */
/*                                                                     */
/* the program will return non-zero status if there was an error. or   */
/* zero if there were no errors.                                       */
/***********************************************************************/
/* Revision History:                                                   */
/* 27mar97      tek             Initial                                */
/* 11apr97      ncs             Fixed nested #ifdef statements         */
/* 23apr97      ncs             Put in #if xxx support                 */
/***********************************************************************/


#include	<sys\types.h>
#include	<stdlib.h>
#include	<stdio.h>
#include	<string.h>
#include	<ctype.h>
#include	<sys\stat.h>
#include	<windows.h>			// needed for the filetime stuff.. ugh..

#include "lists.h"

#define LINELEN (1024)

char infile[_MAX_PATH]="", outfile[_MAX_PATH]="";
char *fullinpath=NULL, *fulloutpath=NULL;
FILE *infile_fp=NULL, *outfile_fp=NULL;

struct list *includes=NULL;
struct list *excludes=NULL;

FILETIME ftLastWrite, ftCreated;
HANDLE hInfile=NULL, hOutfile=NULL;

void get_if(char *token,char *line);
void do_if(int instance, int emitting, int active_if);

void cleanup(void);		// the exit cleanup function

unsigned long lines=0;	// keep track of where we are in the input

int exitstatus=0;		// assume no errors to start.
int temp_name=0;		// needed for no output filename support

char current_line[LINELEN+1]="";
char progname[]="preproc";
char helpstring[]="preproc -i infile -o outfile [[-y includes]..] [[-x excludes]..] [-d[ebug]]";
int main(argc, argv)
int argc;
char *argv[];
{

int argp=0, i=0;


unsigned int emitting=1;	// we're currently putting out text
int current_level=0;		// the current if level
int excludelevel=0;			// the level of the current exclude
int debug=0;				// when set to one, extra info is sent to
							// the output file as a comment


char token[256]="";			// the arg of an if
/* init exit handler.. */
atexit(cleanup);
/* init lists..        */
init_list(&includes);
init_list(&excludes);

/* parse the arguments.... */
infile[0] = '\0';			/* initilaize the filename strings... */
outfile[0] = '\0';			/* yeah, this is redundant..          */
/* loop thru all of the arguments.. */
if (argc < 2)
{
	printf("%s\n",helpstring);
	exit(9);
}
for (argp=1;argp<argc;argp++)
    {
    if (   (argv[argp][0] != '-') 
		&& (argv[argp][0] != '/') )
		{
		printf("%s: can't parse argument %d: %s\n",progname,argv[argp]);
		exit(2);
		}
    switch (argv[argp][1])
		{
		case 'i':	/* input file name     */
		case 'I':
			argp++;	/* get to the filename */
			if (argp>=argc)
			{
				printf(" missing filename! \n");
				exit(10);
			}
			strcpy(infile,argv[argp]);
			 break;

		case 'o':	/* output file name    */
		case 'O':
			argp++;	/* get to the filename */
			if (argp>=argc)
			{
				printf(" missing filename! \n");
				exit(10);
			}
			strcpy(outfile,argv[argp]);
			break;
		case '?':
		case 'H':
		case 'h':
			printf("%s\n",helpstring);
			exit(9);
		case 'y':
		case 'Y':	// include list.. 
			argp++;	/* get to the filename */
			if (argp>=argc)
			{
				printf(" missing include! \n");
				exit(10);
			}
			add_to_list(includes,argv[argp]);
			break;
		/**/
		case 'x':
		case 'X':	// include list.. 
			argp++;	/* get to the filename */
			if (argp>=argc)
			{
				printf(" missing exclude! \n");
				exit(10);
			}
			add_to_list(excludes,argv[argp]);
			break;
		case 'd':	// emit debug info
		case 'D':
			debug = 1;
			break;


		/**/
		default:
			printf("%s: unknown switch: %s\n",progname,argv[argp]);
			exit(3);
		/**/
		} /* end switch */
    } /* end for */


	/* supporting the conversion of one file
	   without the use of output file name.
	   -- ncs 17/jun/97			*/
	if (outfile[0] == '\0')
	{
		temp_name = 1;
		strcpy(outfile, "temp.nik");
	}

	if ( (infile[0] == '\0') || (outfile[0] == '\0'))
	{
		printf(" missing input or output file!\n");
		exit(6);
	}
    /* open 'em up...                   */
	/* _fullpath does a malloc for us.. */
	fullinpath = _fullpath(NULL, infile,0);
	if (fullinpath == NULL)
	{
		printf(" could not create path for file %s\n",infile);
		exit(11);
	}
    infile_fp = fopen(fullinpath,"r");
    if (infile_fp == NULL) 
		{
		printf(" open of file %s (%s): ",infile,fullinpath);
		perror(" - couldn't open input file");
		exit(4);
		}

	fulloutpath = _fullpath(NULL, outfile,0);
	if (fulloutpath == NULL)
	{
		printf(" could not create path for file %s\n",outfile);
		exit(11);
	}
    outfile_fp = fopen(fulloutpath,"w");
    if (outfile_fp == NULL)
		{
		printf(" open of file %s(%s): ",outfile,fulloutpath);
		perror(" - couldn't open output file");
		exit(5);
		}

	// if the debug flag is set, put the list of excludes and 
	// includes into the output file as a comment.
	if (debug)
	{
		fprintf(outfile_fp,"/* file processed by preproc.c\n");
		fprintf(outfile_fp," * input: %s\n",fullinpath);
		fprintf(outfile_fp," * output: %s\n",fulloutpath);
		fprintf(outfile_fp," *\n");
		fprintf(outfile_fp," * Include list:\n");
		fdump_list(outfile_fp,includes," *   ");
		fprintf(outfile_fp," * Exclude list:\n");
		fdump_list(outfile_fp,excludes," *   ");
		fprintf(outfile_fp," */\n");
	}

	// call the guts of the program.. 

	printf("Stripping sensitive code from: \t%s\n", infile);
	do_if(0,1,0);

	fclose(infile_fp);
	fclose(outfile_fp);

	/* Finishing up the no output file name support -- ncs 17/mar/97 */
	if (temp_name)
	{
		remove(infile);
		rename(outfile, infile);
	}

	destroy_list(&includes);
	destroy_list(&excludes);

	/* tweak the output file times.. */

	hInfile = CreateFile(
				fullinpath,
				GENERIC_READ,
				0,
				NULL,
				OPEN_EXISTING,
				0,
				NULL);
	if (hInfile == INVALID_HANDLE_VALUE)
	{
		printf(" ? could not get file handle for %s\n",infile);
		return(32);
	}
	if (!GetFileTime(
				hInfile,
				&ftCreated,
				NULL,
				&ftLastWrite)
				)
	{
		printf(" ? could not get LastWrite time for %s\n",infile);
		CloseHandle(hInfile);
		exit(33);
	}
	CloseHandle(hInfile);


	if (!temp_name)
	{
		hOutfile = CreateFile(
					fulloutpath,
					GENERIC_WRITE,
					0,
					NULL,
					OPEN_EXISTING,
					0,
					NULL);
		if (hOutfile == INVALID_HANDLE_VALUE)
		{
			printf(" ? could not get file handle for %s\n",outfile);
			return(34);
		}
		// we set both the creation and modification times to the 
		// values of the source file.
		if (!SetFileTime(
					hOutfile,
					&ftCreated, 
					NULL,
					&ftLastWrite)
					)
		{
			printf(" ? could not set LastWrite time for %s\n",outfile);
			CloseHandle(hOutfile);
			exit(33);
		}
		CloseHandle(hOutfile);
	}

	return(exitstatus);  // this is the normal exit path
}


void get_if(char *token,char *line)
{
	unsigned int i=0;
	for (i=0;line[i]!='\0';i++)
		if (isspace(line[i]))
			break;
	if (line[i]=='\0')
	{
		token[0]='\0';
		return;
	}
	/* advance through any spaces.. */
	while (line[i]!='\0')
	{
		if (!isspace(line[i]))
			break;
		else i++;
	}
	// and finally copy to the next space.. 
	while ((line[i]!='\0') && !isspace(line[i]))
		*token++ = line[i++];

	//and terminate it.
	*token++ = '\0';

}


void do_if(int instance, int emitting, int active_if)
{
	// enter here with the #ifnnn line in current_line; don't exit until
	// we've hit the end of that if block.

	int hit=0;			// we're the active if statement..
						// += yes, active,  -= yes, inactive
	int ifsense=0;		// 1=ifdef, 0=ifndef
	int on_exclude=0;	// this token is on the exclude list
	int on_include=0;	// this token is on the include list

	char filter='0x0C';
	char token[256]="";
	if (current_line[0] == '\0')
	{
		/* special case; first (re)cursion */
		emitting=1;
		hit=0;
	}

	/* not ignoring #if xxx -- 23apr97 ncs */
//	else if (!isgraph(current_line[3]))
//	{
//		/* #if xxx; we ignore these. */
//		hit=0;
//	}

	else
	{		
		// figure out what kind of #if this is, and whether
		// we need to do anything about it.
		get_if(token,current_line);

		if (current_line[3] == 'n')
			ifsense=0; //#ifndef
		else
			ifsense=1; //#ifdef

		on_include = find_in_list(includes,token);
		on_exclude = find_in_list(excludes,token);
		
		if (on_include && on_exclude)
		{
			printf("Token %s is on both the include and exclude list!\n",
				token);
			printf("Fatal error!\n");
			exit(128);
		}
		// if the sense of the if matches the list, hit is +1;
		// if the sense of the if doesn't match the list, hit is -1
		// if we don't case about this token, hit is 0.

		if (on_include && ifsense)
			hit = +1;
		else if (on_exclude && !ifsense)
			hit = +1;
		else if (on_include && 	!ifsense)
			hit = -1;
		else if (on_exclude && ifsense)
			hit = -1;
		else hit=0;
	}
	
	// if this is a hit of the opposite sense, turn off output 
	if (hit == -1)
		emitting=0;

	if (hit==0 && emitting) // do nothing, and we're live..
		fprintf(outfile_fp,"%s",current_line);
	
	// now, we sit in a loop, possibly emitting text, until 
	// we come to an #if*, and #else, an #endif, or an #elif.
	while (fgets(current_line, LINELEN, infile_fp) != NULL)
		{
		lines++;
		/* see if we have to do anything interesting */
		if (current_line[0] =='#')
		{
		/* if the line begins with #if, bump the level up; */
		/* if it begins with #endif, bump it down. */
			if (!strncmp("#if",current_line,3))
			{
				/* this is an if block. */
				/* we just recurse. */
				// putting in nested #if statement support -- 11apr97 ncs
				if (emitting==0)
					active_if=1;
				do_if(instance+1,emitting,active_if);
				if (emitting==0)
					active_if=0;
				continue; // done with this line..
			}
			// won't get here if it was an #if because of the continue..
			if (!strncmp("#endif",current_line,6))
			{
				/* this is the end of a block */
				if (hit==0)
				{
					// if this wasn't a hit, we have to spit out the
					// close of the if..
					active_if=0;			// putting in nested #if statement support -- 11apr97 ncs
					if (emitting)
						fprintf(outfile_fp,"%s",current_line);
					// and return..
					return;
				}
				else
				{
					// just return.
					return;
				}
			} // else if endif
			// all the above clauses exit..
			if (hit==0)
			{
				// we're not active, so just conditionally spit out the line
				if (emitting)
				{
 					fprintf(outfile_fp,"%s",current_line);
					continue;
				}
			}
			// if we get here, we are in an active if clause
			if (!strncmp("#elif",current_line,4))
			{
				// this is an error condition; ignore it.
				printf("? #elif in active clause at line %d; ignored.\n",
					lines);
				exitstatus = 1; // return an error when we're done.
				fprintf(outfile_fp,"#error preproc.c found #elif in active clause; generated file is incorrect.\n");
				continue;
			}
			if (!strncmp("#else",current_line,4))
			{
				// the other half of of an active if.
				// putting in nested #if statement support -- 11apr97 ncs
				if (!active_if)
				{
					hit = -hit; // flip the sense of what we're doing
					emitting = !emitting;
				}
				continue;
			}
			// finally, this must be a directive we don't care about.
			if (emitting)
				fprintf(outfile_fp,"%s",current_line);
			continue;
		}
		else // not a # at beginning of line..
		{
			if (emitting)
 				fprintf(outfile_fp,"%s",current_line);
		}
	} // while
	// got a null on the get; this is OK at the zero instance level;
	if (instance==0)
		return;
	else 
	{
		printf("? unexpected end-of-file at line %s\n",lines);
		return;
	}
	

} // end do_if()


void cleanup()
{
	// things we do on exit.. 
	if (includes != NULL)
	{
		destroy_list(&includes);
		includes = NULL;
	}

	if (excludes != NULL)
	{
		destroy_list(&excludes);
		excludes = NULL;
	}

	if (infile_fp != NULL)
	{
		fclose(infile_fp);
		infile_fp = NULL;
	}
	if (outfile_fp != NULL)
	{
		fclose(outfile_fp);
		outfile_fp = NULL;
	}

	if (fullinpath != NULL)
	{
		free(fullinpath);
		fullinpath = NULL;
	}
	if (fulloutpath != NULL)
	{
		free(fulloutpath);
		fulloutpath=NULL;
	}
}
/**********************************************************************/
/*																	  */
/*	COPYRIGHT NOTICE												  */
/*																	  */
/*	Copyright (c) Digital Equipment Corporation, 1993				  */
/*	All Rights reserved. Unpublished rights reserved under the		  */
/*	copyright laws of the United States. Copyright is claimed in	  */
/*	the computer program and user interface thereof.				  */
/*																	  */
/*	The software contained on this media is proprietary to and		  */
/*	embodies the confidential technology of Digital Equipment		  */
/*	Corporation. Possession, use, duplication or dissemination of	  */
/*	the software and media is authorized only pursuant to a valid	  */
/*	written license from Digital Equipment Corporation. 			  */
/*																	  */
/*	The name of Digital Equipment Corporation may not be used to	  */
/*	endorse or promote products derived from this software without	  */
/*	specific prior written permission. All other rights reserved.	  */
/*																	  */
/*	THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR	  */
/*	IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, IMPLIED		  */
/*	WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY OR FITNESS		  */
/*	FOR A PARTICULAR PURPOSE.										  */
/*	Digital assumes no responsibility AT ALL for the use or 		  */
/*	reliability of this software.									  */
/*																	  */
/*																	  */
/* +----------------------------------------------------------------+ */
/* | USE, DUPLICATION OR DISCLOSURE BY THE U.S. GOVERNMENT IS		| */
/* | SUBJECT TO RESTRICTIONS AS SET FORTH IN SUBPARAGRAPH (c)		| */
/* | DFARS 252.227-7013, OR IN FAR 52.227-14 ALT. II, AS APPLICABLE.| */
/* |																| */
/* +----------------------------------------------------------------+ */
/*																	  */
/**********************************************************************/
/*																	  */
/* This program parses through a text file and adds a "$(" to the	  */
/* beginning of a word/filename, and a ")" to the end of a file 	  */
/* For use in/as a make file										  */
/*  it also strips out '^'s											  */
/* this program is quite specific in that it looks for key items that */
/* will only appear in certain areas of make files.  it is my         */
/* workaround for a limitation in 1.52 nmake for use in 16 code stripping.						  */
/* therefore: DON"T USE FOR ANYTHING ELSE!  unless modified.          */
/* have a nice day.													  */	
/**********************************************************************/
/* Revision History:												  */
/* 30jun1998	  ett				Initial/final					  */
/* 01jul1998      ett				added '^' stripping				  */
/**********************************************************************/

#include	<stdlib.h>
#include	<stdio.h>

// ***************************************
// Here we go...
// ***************************************
int main(int argc, char *argv[])
{
int argp=0, i=0;

char progname[]="dollpars";
char helpstring[]="dollpars -i infile -o outfile";

char infile[_MAX_PATH]="";
char outfile[_MAX_PATH]="";
FILE *infile_fp=NULL, *outfile_fp=NULL;

unsigned char inchar;

/* parse the arguments.... */
infile[0] = '\0';			/* initilaize the filename strings... */
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
		case 'i':	/* input file name	   */
		case 'I':
			argp++; /* get to the filename */
			if (argp>=argc)
			{
				printf(" missing filename! \n");
				exit(10);
			}
			strcpy(infile,argv[argp]);
			 break;

		case 'o':	/* input file name	   */
		case 'O':
			argp++; /* get to the filename */
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
		
		/**/
		default:
			printf("%s: unknown switch: %s\n",progname,argv[argp]);
			exit(3);
		/**/
		} /* end switch */
	} /* end for */

	if ( infile[0] == '\0' )
	{
		printf(" missing input or filename!\n");
		exit(6);
	}
	
	/* open 'em up...					*/
	infile_fp = fopen(infile,"r");
	outfile_fp = fopen(outfile,"w");
	if (infile_fp == NULL || outfile_fp == NULL) 
		{
		printf(" open of file %s: ",infile);
		perror(" - couldn't open input or output file");
		exit(4);
		}

	// call the guts of the program.. 
	
	while ( (inchar = fgetc(infile_fp)) != ':' )
	{	
		fputc(inchar,outfile_fp);
	}		
	fputc(':',outfile_fp);
	inchar = fgetc(infile_fp);
	fputc(' ',outfile_fp);
	fputc('$',outfile_fp);
	fputc('(',outfile_fp);
	
	// the '~' is my EOF since it just can't find the real one.
	while ((inchar = fgetc(infile_fp)) != EOF && inchar != '~')
	{
		if (inchar == ' ') {
			fputc(')',outfile_fp);
			fputc(inchar,outfile_fp);
			fputc('$',outfile_fp);
			fputc('(',outfile_fp);
		}
		else
			fputc(inchar,outfile_fp);
	}
	fputc(')',outfile_fp);

	while ((inchar = fgetc(infile_fp)) != EOF && inchar != '~')
		if (inchar != '^')  //strip out the ^ so we can have litterals
			fputc(inchar,outfile_fp);
	
	fclose(infile_fp);
	fclose(outfile_fp);
	return(0);	//return 0 otherwise the makefile will crash.
}	


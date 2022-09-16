/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:        par_tabc.c
 *    Author:           Matthew Schnee
 *    Creation Date:7/26/96
 *
 *        Functionality:       
 *              this program generates the ambiguous_char table that is in 
 *              par_char.c  The table that is generated is written to stdout.
 *
 ***********************************************************************
 *    Revision History:
 *
 *      Rev     Who             Date            Description
 *      ---     -----   -----------     -----------------------------------------------
 *      001     MGS             07/26/1996      This file was named maketab.c before 
 *      002     MGS             08/07/1996      Changed value to constants
 *                                                      and made it write ti the file name specified
 *      003     MGS             08/09/1996      Renamed file to par_tabc.c
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h> 
#include <limits.h>


#define TOTAL_TYPES                     20
#define AMBIGUOUS_TYPES         15
#define UNKNOWN_TYPE            999

#include "port.h"

#include "par_char.c"

       
/*
 *      Function Name:
 *              par_convert_to_new
 *
 *      Description:
 *              this function converts the bit masks of the chracter types to consecutive integers
 *
 *      Arguments:
 *              INPUT   unsigned short  i               The value to convert
 *
 *      Return Value:
 *              short           The converted value
 *                                      UNKNOWN_TYPE if there is no conversion
 *
 *      Comments:
 *
 */
int convert_to_new(int i)
{
	switch(i)
	{
		case DIGIT_CHAR_TYPE:
			return(DIGIT_CHAR_TYPE2);
		case UPPER_CHAR_TYPE:
			return(UPPER_CHAR_TYPE2);
		case LOWER_CHAR_TYPE:
			return(LOWER_CHAR_TYPE2);
		case ANY_ALPHA_CHAR_TYPE:
			return(ANY_ALPHA_CHAR_TYPE2);
		case ANY_CHAR_CHAR_TYPE:
			return(ANY_CHAR_CHAR_TYPE2);
		case WHITE_CHAR_TYPE:
			return(WHITE_CHAR_TYPE2);
		case PUNCT_CHAR_TYPE:
			return(PUNCT_CHAR_TYPE2);
		case NON_ALPHA_CHAR_TYPE:
			return(NON_ALPHA_CHAR_TYPE2);
		case VOWEL_CHAR_TYPE:
			return(VOWEL_CHAR_TYPE2);
		case CONSONANT_CHAR_TYPE:
			return(CONSONANT_CHAR_TYPE2);
		case NUMBER_CHAR_TYPE:
			return(NUMBER_CHAR_TYPE2);
		case CLAUSE_CHAR_TYPE:
			return(CLAUSE_CHAR_TYPE2);
		case ALPHA_NUM_CHAR_TYPE:
			return(ALPHA_NUM_CHAR_TYPE2);
		case VOWEL_NON_Y_TYPE:
			return(VOWEL_NON_Y_TYPE2);
		case SOME_PUNCT_TYPE:
			return(SOME_PUNCT_TYPE2);
		case SET_CHAR_TYPE:
			return(SET_CHAR_TYPE2);
		case EXACT_CHAR_TYPE:
			return(EXACT_CHAR_TYPE2);
		case EXACT_CASE_TYPE:
			return(EXACT_CASE_TYPE2);
		case HEXADECIMAL_TYPE:
			return(HEXADECIMAL_TYPE2);
		case SAVE_CHAR_TYPE:
			return(SAVE_CHAR_TYPE2);
		default:
			return(UNKNOWN_TYPE);
	}
}

/* this array holds the labels that are used in the output */
char convert_to_news[TOTAL_TYPES+1][50] = {
	"NULL_TYPE          ",
	"DIGIT_CHAR_TYPE",
	"UPPER_CHAR_TYPE",
	"LOWER_CHAR_TYPE",
	"ANY_ALPHA_CHAR_TYPE",
	"ANY_CHAR_CHAR_TYPE",
	"WHITE_CHAR_TYPE",
	"PUNCT_CHAR_TYPE",
	"NON_ALPHA_CHAR_TYPE",
	"VOWEL_CHAR_TYPE",
	"CONSONANT_CHAR_TYPE",
	"NUMBER_CHAR_TYPE",
	"CLAUSE_CHAR_TYPE",
	"ALPHA_NUM_CHAR_TYPE",
	"VOWEL_NON_Y_TYPE",
	"SOME_PUNCT_TYPE",
	"SET_CHAR_TYPE",
	"EXACT_CHAR_TYPE",
	"EXACT_CASE_TYPE",
	"HEXADECIMAL_TYPE",
	"SAVE_CHAR_TYPE"
};

       
/*
 *      Function Name:
 *              main
 *
 *      Description:
 *              the function that creates the table and does everyting...
 *
 *      Arguments:
 *              None
 *
 *      Return Value:
 *              None
 *
 *      Comments:
 *
 */
void main(int argc,char *argv[])
{
	unsigned short  i,j,k,l,m;
	unsigned short elem,first,total=0;
	char char_time[30];
	time_t ltime; 
	FILE *outfile;
	int types[AMBIGUOUS_TYPES][TOTAL_TYPES];
	
				 
	time(&ltime);                                 
	

	if (argv<=1)
	{
		fprintf(stderr,"usage par_tab <output_file_name>");
		exit(-1);
	}
	if ((outfile=fopen(argv[1],"w"))==NULL)
	{
		fprintf(stderr,"couldn't open %s for output\n",argv[1]);
		exit(-1);
	}
	
	/* initialize the array */      
	for (i=0;i<AMBIGUOUS_TYPES;i++)
		for (j=0;j<TOTAL_TYPES;j++)
			types[i][j]=0;    
	/* set exact hexadecimal and save char types to always ambiguous */
	for (i=0;i<AMBIGUOUS_TYPES;i++)
	{
		if (i==convert_to_new(ANY_CHAR_CHAR_TYPE))
		{
		  types[i][EXACT_CHAR_TYPE2]=NORMAL_TO_NORMAL;
		  types[i][EXACT_CASE_TYPE2]=NORMAL_TO_NORMAL;
		  types[i][HEXADECIMAL_TYPE2]=NORMAL_TO_NORMAL;
		  types[i][SAVE_CHAR_TYPE2]=NORMAL_TO_NORMAL;
		}
		else
		{
		  types[i][EXACT_CHAR_TYPE2]=ALL_TO_NORMAL;
		  types[i][EXACT_CASE_TYPE2]=ALL_TO_NORMAL;
		  types[i][HEXADECIMAL_TYPE2]=ALL_TO_NORMAL;
		  types[i][SAVE_CHAR_TYPE2]=ALL_TO_NORMAL;
		}
	}
	
	for (i=1;i<256;i++)
	{
		elem=parser_char_types[i];
		// printf("this element is %d 0x%04x\n",i,parser_char_types[i]);
		/* add the normal to normal bits to the table */
		for (j=1;j!=0;j<<=1)
		{
			//printf("\\");
			if ((j&elem)!=0)/* normal to normal */
			  {
				l=convert_to_new(j);
				if (l!=UNKNOWN_TYPE)
				  {
					for (k=1;k!=0;k<<=1)
					  {
						//printf("/");
						if ((k&elem)!=0)
						  {
							m=convert_to_new(k);
							if (m!=UNKNOWN_TYPE)
							  {
								types[l][m]|=NORMAL_TO_NORMAL;
							  }
						  }
					  }
				  }
			  }              
			/* add the normal to reverse bits to the table */  
			if ((j&elem)!=0) 
			  {
				l=convert_to_new(j);
				if (l!=UNKNOWN_TYPE)
				  {
					for (k=1;k!=0;k<<=1)
					  {
						//printf("/");
						if ((k&(~elem))!=0)
						  {
							m=convert_to_new(k);
							if (m!=UNKNOWN_TYPE)
							  {
								types[l][m]|=NORMAL_TO_REVERSE;
							  }
						  }
					  }
				  }
			  }
			/* add the reverse to normal bits to the table */  
			if ((j& (~elem))!=0)
			  {
				l=convert_to_new(j);
				if (l!=UNKNOWN_TYPE)
				  {
					for (k=1;k!=0;k<<=1)
					  {
						//printf("/");
						if ((k&elem)!=0)
						  {
							m=convert_to_new(k);
							if (m!=UNKNOWN_TYPE)
							  {
								types[l][m]|=REVERSE_TO_NORMAL;
							  }
						  }
					  }
				  }
			  }
			/* add the reverse to reverse bits to the table */  
			if ((j&(~elem))!=0) /* reverse to reverse */
			  {
				l=convert_to_new(j);
				if (l!=UNKNOWN_TYPE)
				  {                                     
					for (k=1;k!=0;k<<=1)
					  {
						//printf("/");
						if ((k&(~elem))!=0)
						  {
							m=convert_to_new(k);
							if (m!=UNKNOWN_TYPE)
							  {
								types[l][m]|=REVERSE_TO_REVERSE;
							  }
						  }
					  }
				  }
			  }
		  }                                      
	}
	/* print the top headers of the table */          
	fprintf(outfile,"/* output file %s */\n",argv[1]);
	strcpy(char_time,ctime(&ltime));
	char_time[strlen(char_time)-1]='\0';
	fprintf(outfile,"/* file created on %s */\n",char_time);
	fprintf(outfile,"/*"); // this is so the stupid editor won't be too confused */
    for (k=0;k<strlen(convert_to_news[0]);k++)
    {
		if (k==0)
			fprintf(outfile,"\t                  \t  \t \t");
		else
			fprintf(outfile,"  \t                  \t  \t \t");
	for (j=1;j<TOTAL_TYPES+1;j++)
	{
		if (strlen(convert_to_news[j])+k<strlen(convert_to_news[0]))
			fprintf(outfile," \t");
		else
			fprintf(outfile,"%c\t",convert_to_news[j][k-(strlen(convert_to_news[0])-strlen(convert_to_news[j]))]=='_'?' ':convert_to_news[j][k-(strlen(convert_to_news[0])-strlen(convert_to_news[j]))]);
	}
	if ((k+1)!=strlen(convert_to_news[0]))
		fprintf(outfile,"\n");
    } 
    fprintf(outfile,"*/\n");
	fprintf(outfile,"char ambiguous_char[%d][%d]={\n",AMBIGUOUS_TYPES,TOTAL_TYPES);
	/* print the data for the table with the character type at the beginning of the line */
	for (i=0;i<AMBIGUOUS_TYPES;i++)
	{                
		fprintf(outfile,"/*\t%19s\t*/\t{\t",convert_to_news[i+1]);
		for (j=0;j<TOTAL_TYPES;j++)
		{
			if(j==TOTAL_TYPES-1)
				fprintf(outfile,"%d\t",types[i][j]);
			else
				fprintf(outfile,"%d,\t",types[i][j]);
		}
		if (i==AMBIGUOUS_TYPES-1)
			fprintf(outfile,"}};\n");
		else
			fprintf(outfile,"},\n");
	} 
	fprintf(outfile,"\n");
	fclose(outfile);
}               

		

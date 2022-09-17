// Dictionary Converter
// Filename dicc_main.cpp
// This program converts the binary form class data from a dictionary rule text
// to words that can be read.  And it converts it back to the binary.

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "dicc_err.h"

#define LINESIZE 1024 //It is assumed that the file will not have a string of 
						//	characters more than 1024 with out a newline

void dicConv(FILE *, FILE *, int);


void main(int argc, char *argv[])
{
    int nFormFlag = 1;
    int i;
    
    if(argc >= 5 || argc == 1) //wrong arguments
    {
		for(i = 0; i < 3; i++)
		puts(szError[i]);
        exit(1);
    }
    
    if( (strcmp(argv[1], "/f")) == 0)
        nFormFlag = 1;
    else if((strcmp(argv[1], "/t")) == 0)
        nFormFlag = 0;
    else
    {
		for(i = 0; i < 2; i++)
		puts(szError[i]);
        exit(1);
    }
	
    
    FILE  *pfiIn; // pointer file In
    FILE  *pfiOut; // pointer file Out
    char szOutFName[LINESIZE];
    char *pszTemp = NULL;
    
    if(argc <= 2 || (pfiIn = fopen(argv[2], "r")) == NULL  )
    {
        puts(szError[3]);
        exit(1);
    }


	if(argc == 4)
	{
		strcpy(szOutFName, argv[3]);

		if( (pfiOut = fopen(szOutFName, "w")) == NULL)
		{
			puts(szError[3]);
			exit(1);
		}
	}
	else 
	{
		strcpy(szOutFName, argv[2]);
		pszTemp = strrchr(szOutFName, '.');
		
		if( pszTemp !=NULL)
			*pszTemp  = '\0';
		
		if(nFormFlag)
			strcat(szOutFName, ".frm");
		else 
			strcat(szOutFName, ".txt");
		
		if((pfiOut = fopen(szOutFName, "w")) == NULL)
		{
			puts(szError[3]);
			exit(1);
		}
		
	}
	
	dicConv(pfiIn, pfiOut, nFormFlag);
	
	fclose(pfiIn);
	fclose(pfiOut);
	
	printf("The new converted file is: %s\n", szOutFName);
}

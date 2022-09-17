// Dictionary Converter
// Filename dicc_util.cpp
// This  is the main function of this program.	 It is the one that does all \
// the work.  It takes to file pointers and the flag.
#include <string.h>
#include <stdio.h>

#define LINESIZE 1024 //It is assumed that the file will not have a string of 
//characters more than 1024 with out a newline


//This is the form class abbreviation list. It is a array of 29 Form class abbreviations
char szAbbList[29][5] = {
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
		"????",
};



//nFormFlag is the flag that is set when the exe is called.  It is set by '/t' 
//or '/f' dicConv takes in a line.	It takes in a line of size 1024.  I assume
// that this is big enough.  If using a line that is bigger change linesize.
//Dicconv basically ignores comments and then for each ',' it str tokens it. 
//So, all those commas are removed and are broken up in to manageable strings.
//To deal with extra commas (i.e. the '\,' is a valid information) I change the
// those "valid" commas to the beep char (that is equal to 7).
void dicConv(FILE *in, FILE *out, int nFormFlag)
{
	char szBuff[LINESIZE] = {'\0'};
	int i= 0;
	char szAbbPrint[120];
	char* pszTemp = NULL;
	char* sz1stArg = NULL;
	char* sz2ndArg= NULL;
	char* sz3rdArg= NULL;
	char* szFormClass= NULL;
	char* szLastArg= NULL;
	
	while( fgets(szBuff, sizeof(szBuff), in) != NULL)
	{
		
		if(szBuff[0] == ';')
			fputs(szBuff, out);
		else
		{
			
			for(i = 0; szBuff[i] != '\0'; i++)
			{
				if(szBuff[i] == '\\')  //If find a '\\' if the next char is ',' change
				{						// that to '\a' or 7
					i++;
					if(szBuff[i] == ',')
						szBuff[i] = 7;
					i++;
				}
			}
			
			sz1stArg = strtok(szBuff, ",");
			sz2ndArg = strtok(NULL, ",");
			sz3rdArg = strtok(NULL, ",");
			szFormClass = strtok(NULL, ",");
			szLastArg = strtok(NULL, ",");
			
			//Check each string to see if it has a the beep char in it.
			//I don't check LastArg or FormCLass because currently they don't have commas in them
			for(i = 0; sz1stArg[i] != '\0'; i++)
			{
				if(sz1stArg[i] == 7)
					sz1stArg[i] = ',';
			}
			for(i = 0; sz2ndArg[i] != '\0'; i++)
			{
				if(sz2ndArg[i] == 7)
					sz2ndArg[i] = ',';
			}
			for(i = 0; sz3rdArg[i] != '\0'; i++)
			{
				if(sz3rdArg[i] == 7)
					sz3rdArg[i] = ',';
			}
			fputs(sz1stArg, out);
			fputs(",", out);
			fputs(sz2ndArg, out);
			fputs(",",out);
			fputs(sz3rdArg, out);
			fputs(",", out);
			szAbbPrint[0] = '\0';
			
			if(nFormFlag == 1) // '/f'
			{
				for(i = 0; i < 29; i++)
				{	 
					if(szFormClass[i] == '1')
					{
						strcat(szAbbPrint, szAbbList[i]);
						strcat(szAbbPrint, "-");
					}
				}
				
				pszTemp = strrchr(szAbbPrint, '-');
				
				if(pszTemp != NULL)
					*pszTemp = '\0';
				
				if(szAbbPrint[0] != '\0')
					fputs(szAbbPrint, out);
				else
				{
					fputs("?", out);
					fputs("Error-no form classes->", stdout);
					fputs(sz1stArg, stdout);
					fputs(",",		stdout);
					fputs(sz2ndArg, stdout);
					fputs(",",		stdout);
					fputs(sz3rdArg, stdout);
					fputs(",",		stdout);
					fputs(szFormClass,stdout);
					fputs(",",		stdout);
					puts(szLastArg);
				}
			}
			else // '/t'
			{
				int err_flag = 1;
				pszTemp = strtok(szFormClass, "-");
				
				
				for(i = 0; i < 29; i++)
				{
					if(pszTemp != NULL &&  (strcmp(pszTemp, szAbbList[i]) == 0) )
					{
						fputs("1", out);
						pszTemp = strtok(NULL, "-");
						err_flag = 0;  //No errors
					}
					else 
						fputs("0", out);
					
				}
				
				if(err_flag == 1)
				{
					fputs("Error-no form class data->", stdout);
					fputs(sz1stArg, stdout);
					fputs(",",		stdout);
					fputs(sz2ndArg, stdout);
					fputs(",",		stdout);
					fputs(sz3rdArg, stdout);
					fputs(",",		stdout);
					fputs(szFormClass,stdout);
					fputs(",",		stdout);
					puts(szLastArg);
				}
			}				
			
			fputs("," , out);
			fputs(szLastArg, out);
		}	
	}
}

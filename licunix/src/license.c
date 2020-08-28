#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "csn.h"

extern unsigned int encryptString(
	const unsigned char *input, unsigned long key, unsigned char *string);

#define LIC_KEY 24851

int main(int argc, char *argv[])
{
	char line[1000];
	char license[1000];
	char number[1000];
	char serial[1000];
	SNFields snData;

	
	int count=0;
	int success=1;
	FILE *conffile;
	FILE *ldconf;
	int has_local_lib=0;

	while(success)
	{
		printf("Please enter your serial number\n");
		fgets(line,999,stdin);
		conffile=fopen("/etc/DECtalk.conf","w");
		line[strlen(line)-1]='\0';
		/* check serial number now */
		success=snDecode ( line, &snData );
		count++;
		if (count==3)		
		{
			printf("Error in serial number, Please contact your supplier\n");
			printf("install aborted\n");
			exit(1);
		}


	}

	if (conffile==NULL)
	{
		printf("You must be logged in as root to install DECtalk.\n");
		exit(1);
	}

	encryptString(line,LIC_KEY,serial);
	fprintf(conffile,"lickey:%s\n",serial);

	number[0]='4';
	number[1]='\0';
	encryptString(number,LIC_KEY,license);

	fprintf(conffile,"licenses:%s\n",license);

	fclose(conffile);

	ldconf=fopen("/etc/ld.so.conf","r");
	if (ldconf!=NULL)
	{
		while (fgets(line,999,ldconf)!=NULL)
		{
			if (strcmp(line,"/usr/local/lib")==0)
			{
				has_local_lib=1;
				break;
			}
		}
		fclose(ldconf);
	}
	if (has_local_lib==0)
	{
		ldconf=fopen("/etc/ld.so.conf","a+");
		if (ldconf!=NULL)
		{
			fprintf(ldconf,"/usr/local/lib\n");
			system("/sbin/ldconfig");
			fclose(ldconf);
		}
	}
	system("./files.sh");

}
			
		


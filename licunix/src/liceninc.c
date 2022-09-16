#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dtmmedefs.h"
#include "port.h"
#include "coop.h"

extern  void encryptString(const unsigned char *string,unsigned long key,unsigned char *output);
extern  unsigned int decryptString(const unsigned char *input,unsigned long key,unsigned char *string);

int all_digits(char *input)
{
	while (*input)
	{
		if (*input<'0' || *input >'9')
			return(0);
		input++;
	}
	return(1);
}

int main(void)
{
	FILE *config_file;
	FILE *temp_file;

	char line[1000];
	char decrypt[1000];
	char encrypt[1000];
	int gotit=0;
	int ret_value;
	int licenses=0;
	char temp_name[100];

	config_file=fopen("/etc/DECtalk.conf","r+");

	if (config_file==NULL)
	{
		fprintf(stderr,"Cannot open the config file /etc/DECtalk.conf\n");
		exit(-1);
	}
	strcpy(temp_name,"/tmp/DT");
	tmpnam(temp_name);
	temp_file=fopen(temp_name,"w+");
	while (fgets(line,999,config_file)!=NULL)
	{
		fputs(line,temp_file);
	}
	fseek(config_file,0,SEEK_SET);
	fseek(temp_file,0,SEEK_SET);
	while (fgets(line,999,temp_file)!=NULL)
	{
		if (strncmp("licenses:",line,9)==0)
		{
			line[strlen(line)-1]='\0';
			gotit=1;
			ret_value=decryptString(line+9,LICENSE_KEY,decrypt);
			if (!ret_value || !all_digits(decrypt))
			{
				fprintf(stderr,"cannot decrypt the license key\n");
				fprintf(config_file,"%s\n",line);
				continue;
			}
			licenses=atol(decrypt);
			printf("old=%d new=%d\n",licenses,licenses+LICENSE_INCREMENT);
			licenses+=LICENSE_INCREMENT;
			memset(line,0,999);
			sprintf(decrypt,"%d",licenses);
			encryptString(decrypt,LICENSE_KEY,encrypt);
			sprintf(line,"licenses:%s\n",encrypt);
		
		}
		fputs(line,config_file);
	}
	if (gotit==0)
	{
		fprintf(stderr,"Cannot find the license value in the file\n");
	}
	fclose(config_file);
	fclose(temp_file);
	unlink(temp_name);
	return(0);
}

	
	
			

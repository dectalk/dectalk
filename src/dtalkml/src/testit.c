#include <string.h>

int main(int argc,char *argv[])
{
	if (argc<3)
		return(1);
	if (strcmp(argv[1],argv[2])==0)
	{
		printf("yes\n");
		return(0);
	}
	return(1);
}


#include <time.h>
#include <stdio.h>
#include <stdlib.h>



void main(int argc, char *argv[])
{
	int i;
	register int j;
	int k,l,m;
	int count;
	int start,end;
	char testing[1000];
	
	count=atoi(argv[1]);	

	start=clock();
	fprintf(stderr,"start clock=%d\n",start);
	
	j=100;
	
	for (i=0;i<count;i++)
	{
//		j=0;
		j^=j;
		j=1023;
	}

	end=clock();
	fprintf(stderr,"start clock=%d\n",start);
	fprintf(stderr,"end   clock=%d\n",end);
	fprintf(stderr,"difference =%d\n",end-start);
	fprintf(stderr,"seconds =%6.3f\n",(double)(end-start) / CLOCKS_PER_SEC);
}
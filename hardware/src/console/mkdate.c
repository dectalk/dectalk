#include <stdlib.h>
#include <stdio.h>
#include <time.h>

main()
{
    char date[256], time[256];

   _strdate(date);
   _strtime(time);

    fprintf(stdout,"mkdatetime  MACRO\n");

    fprintf(stdout,"datetime    DB  \"(%s %s)\",0ah,0dh,00h\n",
		    date, time);
    fprintf(stdout,"ENDM\n");
    exit(0);
}

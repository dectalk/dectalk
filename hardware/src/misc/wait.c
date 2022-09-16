#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/* Pauses for a specified number of microseconds. */
void sleep( clock_t wait )
{
    clock_t goal;

    goal = wait + clock();
    while( goal > clock() );
}

int main(int argc,char *argv[]) {
	int temp = 0;
	if (argc == 1) temp = 1;
	else temp = atoi(argv[1]);
	sleep(temp * 1000);
	return 0;
}
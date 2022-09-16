#include <stdio.h>

#include "smittk.c"

main()
{
	printf("Opening Memory..\n");
	DT$OpenMem();
	printf("memory open..\n");
	while (!kbhit())
		Sleep(100);
	printf("closing memory..\n");
	DT$CloseMem();
	printf("memory closed.\n");


}
/*
 * This program finds COM Port to which the DECtalk Express
 *	is connected.
 * 6/13/96 Matthew Schnee
 *
*/

#include <stdio.h>        /* standard string library */
#include <stdlib.h>
#include <string.h>        /*standard string library */
#include <process.h>            
#include <conio.h>
#define INC_PROBE
#include "probe.c"





void main(void)
{
	int i;  /*counter*/
	int found=0; /*found express?*/ 
	int ret_value=0;  

	
	system("dt_driv -r");
	printf("\n");                                           
    for (i=1;i<=4;i++)
    {
		ret_value=probe(i);
		if (ret_value==2)
			printf("Interrupt on or comm port %d does not exist.\n",i);
		if (ret_value == 4)
     		printf("DECtalk Express NOT found on comm port %d.\n",i);
		if (ret_value == 0)
		{
    	 	printf("DECtalk Express FOUND on comm port %d.\n",i);
		 	found=1;
		} 
    }

	if (found == 1)
		exit(0);
	else   
	{
		printf("No DECtalk Express units found on any comm port.\n\a"); /* signal w/ bell too. */
		exit(1);
	}	

} /*end main*/		    







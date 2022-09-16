/*


  7/24/97   DR   	Added the printf of ENGLISH UK version info
  6/25/98   DR   	Added the printf of SPANISH_LA version info
 
    */


#include "version.h"
#include <stdlib.h>
#include <stdio.h>
#include <time.h>



main()
	{
	char date[256], time[256];

   	_strdate(date);
   	_strtime(time);


#ifdef ENGLISH_US
	printf("; Version %s  %s %s\n",versionstring, date, time);
#endif

#ifdef ENGLISH_UK
	printf("; Version %s  %s %s\n",versionstring, date, time);
#endif

#ifdef SPANISH_SP
	printf("; Versión %s  %s %s\n",versionstring, date, time);
#endif

#ifdef SPANISH_LA
	printf("; Versión %s  %s %s\n",versionstring, date, time);
#endif

#ifdef GERMAN
	printf("; Version %s  %s %s\n",versionstring, date, time);
#endif
	
	}

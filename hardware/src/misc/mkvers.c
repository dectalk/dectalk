#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <sys\types.h>
#include "versdef.h"


/* 18sep95	...tek		fix off-by-one in the month lookup */
/* 07/22/1997   ...dr 		UK BUILD: Changed ENGLISH_US to ENGLISH this is the same for british or american
                               anded UK version thing*/
/*
 * 06/25/1998	mfg Added SPANISH_LA Support
 */

unsigned char revmajor[]=REVMAJOR;
unsigned char revminor[]=REVMINOR;
unsigned char revtype[]=REVTYPE;
unsigned char revno[]=REVNO;

#ifdef ENGLISH
unsigned char month[12][10] = {
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
        };       
#endif
#ifdef SPANISH
unsigned char month[12][11] = {
        "enero",
        "febrero",
        "marzo",
        "abril",
        "mayo",
        "junio",
        "julio",
        "agosto",
        "septiembre",
        "octubre",
        "noviembre",
        "diciembre"
        };       
#endif            
#ifdef GERMAN
unsigned char month[12][10] = {
        "Januar",
        "Februar",
        "März",
        "April",
        "Mai",
        "Juni",
        "Juli",
        "August",
        "September",
        "Oktober",
        "November",
        "Dezember"
        };       

#endif



unsigned char ctrlk = '\013';
main()
{


   struct tm *timeinfo;
   time_t timer;

   time(&timer);

   timeinfo = localtime(&timer);

   // build the strings...
   fprintf(stdout,
    "unsigned char versionstring[]=\"V%s %s - %s%s %s %d 19%d\";\n",
    revmajor,revminor,revtype,revno,month[timeinfo->tm_mon],
	 timeinfo->tm_mday, timeinfo->tm_year);

#ifdef ENGLISH_US
   fprintf(stdout,
    "unsigned char versionspeak[]=\"\\013Version \\013 %s \\013 %s \\013",
    revmajor, revminor);
   fprintf(stdout,
    " Release \\013 %s \\013 %s \\013 %s %d, \\013 19%d \\013\";\n",
    revtype,revno,month[timeinfo->tm_mon], timeinfo->tm_mday,
    timeinfo->tm_year);
#endif

#ifdef ENGLISH_UK
   fprintf(stdout,
    "unsigned char versionspeak[]=\"\\013Version \\013 %s \\013 %s \\013",
    revmajor, revminor);
   fprintf(stdout,
    " Release \\013 %s \\013 %s \\013 %s %d, \\013 19%d \\013\";\n",
    revtype,revno,month[timeinfo->tm_mon], timeinfo->tm_mday,
    timeinfo->tm_year);
#endif

#ifdef SPANISH_SP
   fprintf(stdout,
    "unsigned char versionspeak[]=\"\\013Versión \\013 %s \\013 %s \\013",
    revmajor, revminor);
   fprintf(stdout,
    " \\013 %s \\013 %s \\013 %s %d, \\013 19%d \\013\";\n",
    revtype,revno,month[timeinfo->tm_mon], timeinfo->tm_mday,
    timeinfo->tm_year);
#endif

#ifdef SPANISH_LA
   fprintf(stdout,
    "unsigned char versionspeak[]=\"\\013Versión \\013 %s \\013 %s \\013",
    revmajor, revminor);
   fprintf(stdout,
    " \\013 %s \\013 %s \\013 %s %d, \\013 19%d \\013\";\n",
    revtype,revno,month[timeinfo->tm_mon], timeinfo->tm_mday,
    timeinfo->tm_year);
#endif

#ifdef GERMAN
   fprintf(stdout,
    "unsigned char versionspeak[]=\"\\013Version \\013 %s \\013 %s \\013",
    revmajor, revminor);
   fprintf(stdout,
    " \\013 %s \\013 %s \\013 %s %d, \\013 19%d \\013\";\n",
    revtype,revno,month[timeinfo->tm_mon], timeinfo->tm_mday,
    timeinfo->tm_year);
#endif
    
    exit(0);
}

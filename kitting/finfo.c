/* 
 * get various sorts of file info and spit it out in single-line
 * format to keep a record of what we've shipped
 * the file in question is the first arg, and the output is
 * to stdout.
 */
         
/* no attempt has been made to make this portable yet */
             
#include <stdio.h>
#include <stdlib.h>
#include <sys\types.h>
#include <sys\stat.h>
#include <time.h>        
#include <string.h>


unsigned char filename[_MAX_PATH];
unsigned char fullfilename[_MAX_PATH];
unsigned char fname[_MAX_PATH], ext[_MAX_PATH];
unsigned char tmpstr[_MAX_PATH+100];  
unsigned char *rtnptr; 
int rtnval;

struct _stat statbuf;


main(int argc, char *argv[])
{       
	/* make sure we've been given an argument */
	if ( (argc != 2) || (argv[1][0] == '-') ||  (argv[1][0] == '/') ) 
		{
		printf("\n Usage: finfo filename\n");
		exit(1);
		}
	/* get the filename to process. */
	strncpy(filename, argv[1], _MAX_PATH-1);
	/* terminate to be safe */
	filename[_MAX_PATH]='\0';                    
	/* get the root for later use.. */   
	rtnptr = _fullpath(fullfilename,filename,_MAX_PATH);
	if (rtnptr == NULL)
		{                 
		printf("%s: info not found!\n");
		fprintf(stderr,"\ncouldn't parse path for %s\n",filename);
		exit(3);
		}

	/* get the info.. */
	_splitpath(fullfilename,NULL,NULL,fname,ext);
	/* first, put out the name.. */
	sprintf(tmpstr,"%s%s",fname,ext);
	printf(" %15s: ",tmpstr);
	/* fill in the stat buffer.. */
	rtnval = _stat(fullfilename, &statbuf);
	if (rtnval < 0)
		{      
		sprintf(tmpstr,"?could not get info for %s",filename);
		perror(tmpstr);
		exit(4);
		}
	printf(" %10ld bytes, %s",statbuf.st_size,ctime(&statbuf.st_mtime));
	
	return(0);

} /*main */             

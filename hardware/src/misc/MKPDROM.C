/*
 *  build up the intel-hex file that will be used to blast the PD rom.
 *  doesn't yet include the base boot rom image; that has to be loaded
 *  into the blaster separately.
 * actually, this creates a raw-binary file. 
 * 
 *  If the filename is ".DIC", this code will compress it using
 *  the PKWARE IMPLODE, and set the compressed bit in the directory
 *  entry for this file.
 *  .DIC is also used to set the dictionary flag bit..
 *
 *  5/5/94 		tek		now compresses any file larger than 64k.
 *						Images don't get their header compressed.
 *  11/11/96	GL		add language dictionary support
 *						use -d<two character language tag><dictionary file name>
 *						as the format of dictionary input file name
 *  4/29/99     GL              BATS#886 make sure compress the larger file
 */
#define DEBUG

#include "pdrom.h"
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <sys\types.h>
#include <sys\stat.h>
#include <malloc.h>
#include "implode.h"
#include "loader.h"

#define BUFFSIZE (1024*8)

#define MAXLOADFILES		32

FILE *infile[MAXLOADFILES], *outfile;
char infilename[MAXLOADFILES][_MAX_PATH];
unsigned short dic_flag[MAXLOADFILES]; 		/* dictionary to indicate input file is a dictionary
												file, also tell which language dictionary */								

char outfilename[_MAX_PATH]="",drive[_MAX_PATH],fdir[_MAX_PATH],
	fname[_MAX_PATH],ext[_MAX_PATH];

char prog_name[] = "mkpdrom";
char help_string[] = 
	"Usage: mkpdrom outfile kernelfile [exefile ...]";


struct dos_exe_header header;                                    

struct _stat statbuff;

/* these variables are used to keep track of how much of the
 * input file has been read, and how much has been written, for
 * the case of compressed files. The PKWare utilities don't 
 * have a way (as far as I can tell) to return this info, so we
 * use globals accessed by the ReadFile and WriteFile routines
 * to save this info.
 */
unsigned long int AmountRead;
unsigned long int AmountWritten;
char far *work;	// where the compression tool works..
unsigned dsize=4096; // the 'dictionary size' for compressions??
unsigned type=CMP_BINARY; // compression mode..



FILE *cInfile, *cOutfile; // implicit files used by ReadBuf,WriteBuf

unsigned far pascal ReadBuf(char far *buff, unsigned short int far *size);
void far pascal WriteBuf(char far *buff, unsigned short int far *size);
char *string_substitute(char *main_string,
                        char *string_find,
                        char *string_sub);

int main(argc,argv)
int	argc;
char	*argv[];
{
	int		argp;
	int 		index,i,j;
    	unsigned int 	loadfiles, dir_size;
        unsigned long   filesize, fileremaining;
        volatile unsigned long currloc;
        unsigned char   *rdbuff;
        unsigned char	isdir;
        struct pdrom_directory  *dir;
        struct _stat    statbuff;

	if (argc < 3)
    {    
    	printf("%s\n",help_string);
    	exit(-1);
    }

	if (argc>MAXLOADFILES+1)
	{
		printf("Can only load a maximum of %d files. \n",MAXLOADFILES);
		printf(" .. rebuild mkpdrom.c to load more files.\n");
		exit(-1);
	}

	// init all the load file name strings..
	for (i=0;i<MAXLOADFILES;i++)
	{   
		dic_flag[i] = 0;
		infilename[i][0] = '\0';
    }
    
	/* loop thru all of the arguments.. */
	for (argp=1;argp<argc;argp++)
    {
		if (argp == 1)
			_fullpath(outfilename,argv[argp],_MAX_PATH-1);
	  	else
			_fullpath(infilename[argp-2],argv[argp],_MAX_PATH-1);
    } /* end for */

    loadfiles=argp-2;
	/* the number of files defines the size of the directory. */
	/* we'll allocate that off and start filling it, but we'll*/
	/* wait until later to write it. Hopefully we can seek around */
	/* to do that.. */

	outfile = fopen(outfilename, "w+b");
	if (outfile==NULL)
	{
		printf("Unable to open %s\n",outfilename);
        perror("");
		exit (-1);
	}

	// open up all the input files.. 
	for (i=0;i<loadfiles;i++)
	{
#ifdef DEBUG
    	printf("Opening file #%d=%s\n",i,infilename[i]);
    	fflush(stdout);
#endif //debug
		/* GL 11/11/1996, process the language tage */
                /* GL 09/25/1997, add UK_english support */
		if (strstr(infilename[i],"\\-d"))
		{
		   	/* store the language flag to dic_flag[] */
		   	if (strstr(infilename[i],"\\-dus"))
		   	{
		   		strcpy(infilename[i],string_substitute(infilename[i],"-dus",""));
				dic_flag[i] = 0;
			}
		   	if (strstr(infilename[i],"\\-dfr"))
		   	{
		   		strcpy(infilename[i],string_substitute(infilename[i],"-dfr",""));
				dic_flag[i] = 1;
			}
		   	if (strstr(infilename[i],"\\-dgr"))
		   	{
		   		strcpy(infilename[i],string_substitute(infilename[i],"-dgr",""));
				dic_flag[i] = 2;
			}
		   	if (strstr(infilename[i],"\\-dsp"))
		   	{
		   		strcpy(infilename[i],string_substitute(infilename[i],"-dsp",""));
				dic_flag[i] = 3;
			}
            if (strstr(infilename[i],"\\-duk"))
		   	{
				strcpy(infilename[i],string_substitute(infilename[i],"-duk",""));
                dic_flag[i] = 5;
			}
            if (strstr(infilename[i],"\\-dla"))
		   	{
				strcpy(infilename[i],string_substitute(infilename[i],"-dla",""));
                dic_flag[i] = 6;
			}
		}
		
		
       	infile[i] = fopen(infilename[i],"rb");
		if (infile[i] == NULL)
		{
			printf("Unable to open infile[%d]=%s\n",
					i, infilename[i]);
            perror("");
			exit(-2);
		}
	}
	// calculate the directory size..
	// this is really too large, but not by much
	dir_size = sizeof (struct pd_entry)*loadfiles +
				sizeof (struct pdrom_directory);


	// allocate memory for the directory, so we can fill it as we go
	dir = malloc(dir_size);
    if (dir == NULL)
    {
    	printf("?Couldn't allocate directory area? \n");
        perror("");
        exit(-6);
    }
    /* just for yucks, clear out the directory buffer. */
    /* temporarily use rdbuff, because it's defined correctly */
    rdbuff = (unsigned char *)(dir);
    for (i=0;i<dir_size;i++)
        rdbuff[i]=0;

	// fill in the directory header info.. 
	dir->num_entries = loadfiles;
	dir->entry_size = sizeof(struct pd_entry);

	// allocate a read buffer and a write buffer.. 
	rdbuff = malloc((size_t)BUFFSIZE);
    if (rdbuff == NULL)
    {
    	printf("?Couldn't allocate read buffer? \n");
    	perror("");
    	exit(-7);
	}

	// allocate for the compression tool, in case we need it..
	work = (char far *)(_fmalloc(35256U));
	if (work == NULL)
	{
		printf("? couldn't allocate compression buffer?\n");
		exit(-10);
	}
    currloc = dir_size; //where we start writing..
	// load 'em up.. 
	for (i=0;i<loadfiles;i++)
	{
		// get the file size..
		if (_fstat(_fileno(infile[i]),&statbuff))
		{
			printf("Unable to find size of %s\n",infilename[i]);
                        perror("");
			exit(-4);
		}

		filesize = statbuff.st_size;
		fileremaining = filesize;
		// note the relevant info in the directory.. 
		dir->entry[i].file_start = currloc;
		// assume it's not compressed, update this later if it is.
		dir->entry[i].file_size = filesize;
		dir->entry[i].load_size = filesize;
		_splitpath(infilename[i],
                	drive,
                	fdir,
                	fname,
                	ext);

		strcat(fname,ext);
		strcpy(dir->entry[i].filename,fname);
		// safety.. 
		dir->entry[i].filename[0xf]='\0';
		// this is as good a place as any to check that the 
		// first file is kernel.sys.. 
		if (i==0)
		{
			strupr(fname);
			if (strcmp("KERNEL.BIN",fname) != 0)
			{
				printf("First file is not KERNEL.BIN!\n");
				exit(-3);
			}
		}
#ifdef DEBUG
		printf("entry %d:\n",i);
		printf("file: %s\n",infilename[i]);
		printf("start: 0x%08lx,  size: 0x%08lx (%ld.)\n",
			currloc, filesize, filesize);
#endif //debug
		// read/write..
        if (fseek(infile[i],0,SEEK_SET))
        {
           perror("read seek failure");
           printf("file=%s\n",infilename[i]);
           exit(-8);
        }
		// OK, two different things could happen here.
		// if this isn't a dictionary file, then we just
		// copy it to the output. If it IS a dictionary,
		// then we have to compress it.
        strupr(ext);
                if (!strcmp(".DIC",ext) || !strcmp(".dic",ext))
			isdir = 1;
		else
			isdir=0;

		if (isdir)
		{
			unsigned error,aRead, aWrite;
#ifdef DEBUG
			printf("File being compressed.\n");
#endif //debug
			AmountRead=0;
			AmountWritten=0;

			/* GL 11/11/1996 */			
			/* set the dic language flag */
			dir->entry[i].dic_lang = dic_flag[i];
			
			// don't touch the first 8 bytes, because we need
			// those to allocate memory correctly on the target.

			if (fseek(outfile,currloc,SEEK_SET))
			{
				printf("? seek failure? \n");
                perror("");
				exit(-5);
			}
			aRead = fread(rdbuff,8,1,infile[i]);
			if (aRead != 1)
			{
                perror("");
				printf("? read error, file=%s\n",
						infilename[i]);
                printf("errno=0x%x, _doserrno=0x%x\n",
                        errno, _doserrno);
				exit(-6);
			}
			// spit it out..
			if (fseek(outfile,currloc,SEEK_SET))
			{
				printf("? seek failure? \n");
                perror("");
				exit(-5);
			}
			AmountRead += 8;
			aWrite = fwrite(rdbuff,8,1,outfile);
			if (aWrite != 1)
			{
				printf("? write error\n");
                perror("");
				exit(-6);
			}
			currloc += 8;
			AmountWritten += 8;

			cInfile = infile[i];
			cOutfile = outfile;
			error = implode(ReadBuf, 
					WriteBuf,
					work,
					&type,
					&dsize);
#ifdef DEBUG
			printf("%ld. read, %ld. written\n",
					AmountRead, AmountWritten);
#endif //debug
			if (error)
			{
				printf("?compression error %d\n",error);
				exit(-11);
			}
			// update the directory info..
			dir->entry[i].load_size = AmountRead;
			dir->entry[i].file_size = AmountWritten;
            dir->entry[i].flags =
				ROM_VALID|ROM_DICT|ROM_COMP; // dict, valid, compressed
			// update the current location pointer..
			currloc += AmountWritten;
		} // isdir
		else
		{ // is not a dictionary..

			// HACK HACK HACK
            // always compress the second file.
            //        if (i==2)
            /* GL 4/27/1999, compress every files(>16k) but exclude kernel.sys */
            if (i >= 2 && filesize > 16000)
            { 	// compress it.
				// *******************************
				unsigned error,aRead, aWrite, headersize;
#ifdef DEBUG
				printf("File being compressed.\n");
#endif //debug
				AmountRead=0;
				AmountWritten=0;
				// don't touch the header bytes, because we need
				// those to allocate memory correctly on the target.

				if (fseek(outfile,currloc,SEEK_SET))
				{
					printf("? seek failure? \n");
                	perror("");
					exit(-5);
				}
				aRead = fread(&header,sizeof(struct dos_exe_header),1,infile[i]);
				if (aRead != 1)
				{
            		perror("");
					printf("? read error, file=%s\n",
							infilename[i]);
                	printf("errno=0x%x, _doserrno=0x%x\n",
                			errno, _doserrno);
					exit(-6);
				}
				// ok, now we peek at the header to figure out 
				// how big the whole header (including relocs) is
				headersize = header.hsize*16;

            	if (headersize > BUFFSIZE)
           		{
            		printf(" ?? header too large in %s\n",
                			infilename[i]);
            		exit(-10);
				}
				// spit it out..
            	// back to the beginning of the input file..
				if (fseek(infile[i],0,SEEK_SET))
				{
					printf("? seek failure? \n");
            		perror("");
					exit(-5);
				}
				aRead = fread(rdbuff,headersize,1,infile[i]);
				if (aRead != 1)
				{
            		perror("");
					printf("? read error, file=%s\n",
							infilename[i]);
					printf("errno=0x%x, _doserrno=0x%x\n",
                     		errno, _doserrno);
					exit(-6);
				}

				if (fseek(outfile,currloc,SEEK_SET))
				{
					printf("? seek failure? \n");
                	perror("");
					exit(-5);
				}
				AmountRead += headersize;
				aWrite = fwrite(rdbuff,headersize,1,outfile);
				if (aWrite != 1)
				{
					printf("? write error\n");
                	perror("");
					exit(-6);
				}
				currloc += headersize;
				AmountWritten += headersize;

				cInfile = infile[i];
				cOutfile = outfile;
				error = implode(ReadBuf, 
						WriteBuf,
						work,
						&type,
						&dsize);
#ifdef DEBUG
				printf("%ld. read, %ld. written\n",
						AmountRead, AmountWritten);
#endif //debug
				if (error)
				{
					printf("?compression error %d\n",error);
					exit(-11);
				}
				// update the directory info..
            	dir->entry[i].flags =
					ROM_VALID|ROM_COMP; // valid, compressed
				// update the current location pointer..
				currloc += AmountWritten;
				dir->entry[i].file_size = AmountWritten;
				dir->entry[i].load_size = 0; // header val is used.

			} // we compressed an image..
			else
			{
				// image smaller than 64k..

		    	while (fileremaining>0)
				{
					size_t readsize, didread,didwrite;
					readsize = 
			    		(fileremaining > BUFFSIZE) ?
						BUFFSIZE : fileremaining;
                	if (feof(infile[i]))
                	{
                		printf("Unexpected end-of-file, file %s\n",
                    			infilename[i]);
                    	exit(-9);
                	}
					didread = fread(rdbuff,readsize,1,infile[i]);
					if (didread != 1)
					{
                    	perror("");
						printf("? read error, file=%s\n",
								infilename[i]);
                    	printf("errno=0x%x, _doserrno=0x%x\n",
                    			errno, _doserrno);
						exit(-6);
					}
					// spit it out..
					if (fseek(outfile,currloc,SEEK_SET))
					{
						printf("? seek failure? \n");
                    	perror("");
						exit(-5);
					}

					didwrite = fwrite(rdbuff,(size_t)readsize,1,outfile);
					if (didwrite != 1)
					{
						printf("? write error\n");
                    	perror("");
						exit(-6);
					}
					fileremaining -= readsize;
					currloc += readsize;
				} // until we're done..
            	// update the flags in the directory..
            	dir->entry[i].flags=ROM_VALID; //valid, not compressed.
		    	dir->entry[i].file_size = filesize;
		    	dir->entry[i].load_size = 0; // the exe header value is correct.

			} // image, not compressed      
		} // !isdir
		// add a buffer zone, and truncate to a paragraph..
		currloc += 32;
		currloc &= ~16;
	} // for every file..
	printf("Total size 0x%08lx (%ld.)\n",currloc, currloc);
	// now, write out the directory.
	if (fseek(outfile,0,SEEK_SET)) // the beginning
	{
		printf("? directory write seek failure? \n");
        perror("");
		exit(-5);
	}
	fwrite(dir,dir_size,1,outfile);

	// clean up things.. 
	free(rdbuff);
	free(dir);
	fclose(outfile);
	for (i=0;i<loadfiles;i++)
		fclose(infile[i]);
	exit(0);


}

unsigned far pascal ReadBuf(char far *buff, unsigned short int far *size)
{
   /* read from the input file cInfile and stash the characters in buff.
    * return the actual number of characters read. Update AmountRead.
    */ 
	unsigned int didread;
	unsigned int isize;
	isize = *size;
	didread = fread(buff,
		  			1,
		  			isize,
		  			cInfile);
    if (ferror(cInfile))
    	perror("read error -  ");
	AmountRead += didread;
	return(didread);
}

void far pascal WriteBuf(char far *buff, unsigned short int far *size)
{
   /* write to the output file from buff, update AmountWritten.
    */
	unsigned int didwrite;
	unsigned int isize;

	isize = *size;

	didwrite = fwrite(buff,1,isize,cOutfile);
	AmountWritten += didwrite;

}

char *string_substitute(char *main_string,
                        char *string_find,
                        char *string_sub)
{
    char temp_string_r[256]={""};
    static char temp_string[256]={""};
    static char *temp_string_p = temp_string;
    unsigned int size,size_find,size_sub;
    unsigned int hit = 0;
    unsigned int i = 0;
    unsigned int j = 0;
    unsigned int k = 0;
    unsigned int ii = 0;
    unsigned int iii = 0;
    unsigned int i_s = 0;
    unsigned int delta = 0;

    strcpy(temp_string,main_string);
    strcpy(temp_string_r,main_string);
    size = strlen(main_string);
    size_find = strlen(string_find);
    size_sub = strlen(string_sub);

    if (!strstr(main_string,string_find)) return(temp_string_p);
    if (size_find > size) return(temp_string_p);

    while (strstr(temp_string_r,string_find))
    {
      /* find the target string */
      for (i=i_s,j=0;i<strlen(temp_string);++i)
      {
        hit = 1;
        for (ii=i,j=0;j<size_find;++j,++ii)
            if (temp_string[ii] != string_find[j]) { hit = 0; break; }
        if (hit == 1) { k = i + size_find - delta; break; }
      }

      /* replace with string_sub */
      for (ii=i,j=0;j<size_sub;++ii,++j)
          temp_string[ii] = string_sub[j];

      i_s = ii;
      /* update the delta between main_string and temp_string */
      delta = delta + (size_sub - size_find);

      /* copy over the rest of string */
      for (j=k,iii=0;j<size;++iii,++ii,++j)
      {
        temp_string[ii] = main_string[j];
        temp_string_r[iii] = main_string[j]; /* save the rest of string */
      }
      temp_string_r[iii] = '\0';
      temp_string[ii] = '\0';
    } /* end of while */

    return(temp_string_p);
}

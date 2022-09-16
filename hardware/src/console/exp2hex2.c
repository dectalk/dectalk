/* read a Phar-lap .EXP file and spit out an MCS-86 .HEX file. */



#include "exes.h"

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <io.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>


#define IH_DATA		00	/* length data bytes */
#define IH_END		01	/* no data bytes */
#define IH_EXT		02	/* 2 data bytes */
#define IH_START	03	/* 4 data bytes cs:ip for start */


struct intel_hex
	{
	unsigned char length;
	unsigned int addr;
	unsigned char type;
	unsigned char data[256];
	unsigned char sum;
	};

struct intel_hex ih;

#define DUMP_EXTENT (16)


struct EXP imageinfo;

#define TEMP_LEN    (256)
char	buff[TEMP_LEN];


char help_string[] =
  "exp2hex -i infile -o outfile -b base";

char prog_name[] = "exp2hex";

FILE	*outfile;
int	infile_s;
off_t	EXEsize;
struct stat inf;

long lmin(unsigned long a, unsigned long b);
void write_ih(struct intel_hex *record, FILE *fout);


unsigned long int     zbase;


main(int argc,char *argv[])
{
	int	argp;
	int 	index,i,j;
	char	infilename[80]="",
		outfilename[80]="";

	unsigned long	base, off, hiaddr, out_addr, start_addr;
	int	extent;

	char	*cp, *cp2;
	unsigned char	check_sum;

    /* random initialization.. */
    check_sum=0;
    zbase=0;

if (argc == 1)
    {
    printf("%s\n",help_string);
    exit(-1);
    }

/* loop thru all of the arguments.. */
for (argp=1;argp<argc;argp++)
    {
    if (argv[argp][0] != '-')
	{
	printf(" %s: can't parse argument %d: %s\n",
		prog_name,argp, argv[argp]);
	printf("%s\n",help_string);

	exit(-1);
	}
    switch (argv[argp][1])
	{
	int	tmp;
	case 'i':	/* in file name */
		argp++;	/* get to the filename */
		strcpy(infilename,argv[argp]);
	    break;
	/**/
	case 'o':	/* output file name */
		argp++;	/* get to the filename */
		strcpy(outfilename,argv[argp]);
	    break;
	/**/
        case 'b':
                argp++;
		sscanf(argv[argp], "%lx", &zbase);
            break;
	/**/
	default:
		printf(" %s: unknown switch: %s\n",prog_name,argv[argp]);
		printf("%s\n",help_string);
		exit(-3);
	/**/
	} /* end switch */
    } /* end for */

	if (infilename[0] == '\0')
		{
		printf (" %s: no input file.\n",prog_name);
		exit(-2);
		}

	/****************************************************************/
	/* open the files.. 						*/
	infile_s = open(infilename,O_RDONLY+O_BINARY);

	if (infile_s == -1)
	    {
	    printf(" %s: couldn't open file %s\n",prog_name,infilename);
	    exit(1);
	    }

	
	if (outfilename[0] == '\0')
		{
		printf (" %s: no output file.\n",prog_name);
		exit(-2);
		}


	outfile = fopen(outfilename,"w");

	if (outfile == NULL)
	    {
	    printf(" %s: couldn't open file %s\n",prog_name,outfilename);
	    exit(1);
	    }

    /* get the header info from the file.. */
    if (fstat(infile_s,&inf) == -1)
	{
	    printf("fseek() failed on input file.\n");
	    exit(-8);
	}
    EXEsize = inf.st_size;

    {
	int n;
	n = read(infile_s, &imageinfo, sizeof(imageinfo));
	if (n != sizeof(imageinfo))
	    {
		printf(" EXP header read failed. \n");
		exit(-4);
	    }
    }
    base = imageinfo.base_offset;
    off = imageinfo.image_off;
        {
        printf(" .. load file based at %08lx; load at offset 0x%08lx\n",
                zbase, base);
        }
    
	out_addr = 0;

	start_addr = zbase;
/*
 * write the intel hex ext record
 */

   ih.type = IH_EXT;
   ih.length = 2;
   ih.addr = 0;
   ih.data[0] = (start_addr>>12) & 0xFF;
   ih.data[1] = (start_addr>>4) &0xff;
   write_ih(&ih,outfile);

   while((off < (long)EXEsize))
	{
	extent = (int)lmin((long)DUMP_EXTENT,(long)EXEsize - off);
	ih.type = IH_DATA;
	ih.addr = (unsigned int)(out_addr);

	hiaddr = ih.addr + extent;

	ih.length = extent;
	if(lseek(infile_s,off,SEEK_SET) == -1)
		{
		perror("Bad seek in dump_exe()");
		exit(1);
		}
	if(extent != read(infile_s,&buff,extent))
		{
		perror("Bad read in dump_exe()");
		exit(1);
		}
	off += extent;
	out_addr += extent;

	cp = &ih.data[0];
	cp2 = buff;
	for(i = 0; i < extent; i++)
		{
		check_sum += *cp2;	/* maintain running check sum */
		*cp++ = *cp2++;
		}
	write_ih(&ih,outfile);

	}	/* the EXE file has now been processed */
/*
 * Zero fill up to the final byte (reserved for the checksum)
 */
   off -= base;			/* ROM relative address of next free loc */

	printf("ok]\n");
	printf("Wrote EXE data to ROM addresses 0x%04lx to 0x%04lx\n",
		start_addr,
		out_addr - 1);


/*
 * zero-fill the hex record data bytes
 */

   cp = &ih.data[0];
   for(i = 0; i < 256; i++)
	*cp++ = 0;


	ih.type = IH_DATA;
	ih.addr = (unsigned int)out_addr;
	ih.length = 1;		/* just the checksum byte */
	ih.data[0] = 0 - (0xff & check_sum);
	write_ih(&ih,outfile);
	printf("Checksum 0x%02x written at ROM location 0x%04lx\n",
		0xff & (0-check_sum),
		out_addr);

/*
 * Write the end record
 */

   ih.type = IH_END;
   ih.length = 0;
   ih.addr = 0;
   write_ih(&ih,outfile);


   fclose(outfile);
   close(infile_s);

   return(0);
}  /*main*/



long lmin(a,b)
unsigned
   long
	a,b;
{
   if(a < b)
	return(a);
   return(b);
}
/*
 * Writes one intel hex record to specified output file
 *
 * Thanks to Ken Kuenzel for this routine (lifted from mkbios.c)
 */

void write_ih(record,fout)
struct intel_hex *record;
FILE *fout;
{
   unsigned int
	check_sum;
   int
	i;

   check_sum = record->length + record->type;
   check_sum += (unsigned char)((record->addr>>8)&0xff);
   check_sum += (unsigned char)(record->addr&0xff);
   for(i=0; i < record->length; i++)
	check_sum += record->data[i];
   fprintf(fout,":%02X%04X%02X",record->length,record->addr,record->type);
   for(i=0; i<record->length; i++)
	fprintf(fout,"%02X",record->data[i]);
   fprintf(fout,"%02X\n",(-(long int)check_sum)&0xff);
}

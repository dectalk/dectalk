/*
 *  Fixup an MSDOS .EXE file for load at an absolute address.
 * writes the 0x12-byte header that the PD ROM expects, thus:
 * 	0..3: size of load image in words
 *	4..7: size of memory image in words
 *	8..9: load address in bytes
 *	a..b: starting ss
 *	c..d: starting sp
 *	e..f: starting cs
 *	10..11: starting ip
 *	12..: image bytes.
 *
 */
#define DEBUG

#include <stdlib.h>
#include <stdio.h>

#define	READ_BUFF_SIZE		(16*1024)
#define	MAX_FIXUPS			512			/* maximum fixups per exe */

unsigned char readbuff[READ_BUFF_SIZE];

/*
 *  msdos .exe files will look like ...
 */

struct dos_exe_header {
	unsigned int	id;			/* Linker's signature, must be 0x5a4d	*/
	unsigned int	rem;			/* length of image mod 512		*/
	unsigned int	pages;		/* length of image in pages of 512 bytes*/
	unsigned int	relen;		/* number of relocation items		*/
	unsigned int	hsize;		/* header size in paragraphs of 16 bytes*/
	unsigned int	hmin;			/* min # of paragraphs above prog end	*/
	unsigned int	hmax;
	unsigned int	ssval;
	unsigned int	spval;		/* to be loaded in sp			*/
	unsigned int	checksum;
	unsigned int	ipval;		/* to be loaded in ip			*/
	unsigned int	csval;  		/* segment offset to code		*/
	unsigned int	reloc;		/* location of relocation items		*/
	unsigned int	ovrlay;		/* overlay number			*/
};

/*  a dos relocation element looks like */

struct dos_reloc {
	short int	offset;
	short int	segment;
};

void clean_up();

FILE	*infile, *outfile, *infofile;

char prog_name[] = "fixup";
char help_string[] = 
	"Usage: fixup -i infile -o outfile -f infofile -l loadhexoffset";

char	infilename[_MAX_PATH]="",
	outfilename[_MAX_PATH]="",
	infofilename[_MAX_PATH]="";

unsigned long int loadhexoffset=0;
char tempstr[1024]="";

struct dos_reloc *fixups;

main(argc,argv)
int	argc;
char	*argv[];
{
	int	argp;
	int 	index,i,j;

if (argc == 1)
    {    
    printf("%s\n",help_string);
    exit(-1);
    }

/* get some load memory.. */
if ((fixups = (struct dos_reloc *)malloc(MAX_FIXUPS*4)) == NULL)
        {
        printf ("Could not allocate fixup buffer!\n");
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
	case 'i':	/* input file name */
		argp++;	/* get to the filename */
		strcpy(infilename,argv[argp]);
	    break;
	/**/
	case 'o':	/* output file name */
		argp++;	/* get to the filename */
		strcpy(outfilename,argv[argp]);
	    break;
	/**/
	/**/
	case 'f':	/* info file name */
		argp++;	/* get to the filename */
		strcpy(infofilename,argv[argp]);
	    break;
	/**/
	case 'l':	/* load offset */
		argp++;
                strcpy(tempstr,argv[argp]);
		sscanf(tempstr,"%x",&loadhexoffset);
	    break;
	/**/
	/**/
	default:
		printf(" %s: unknown switch: %s\n",prog_name,argv[argp]);
		printf("%s\n",help_string);
		exit(-3);
	/**/
	} /* end switch */
    } /* end for */

#ifdef DEBUG
    printf("Loadhexoffset = %08lx\n", loadhexoffset);
#endif //DEBUG

    // open up the input file..
    infile = fopen(infilename,"r+b");
    if (infile == NULL)
        {
        printf("Could not open file %s\n",infilename);
        exit(-1);
        }

    outfile = fopen(outfilename,"w+b");
    if (outfile == NULL)
        {
        printf("Could not open file %s\n",outfilename);
        exit(-1);
        }

    infofile = fopen(infofilename,"w+b");
    if (infofile == NULL)
        {
        printf("Could not open file %s\n",infofilename);
        exit(-1);
        }


    load_exe(infile,loadhexoffset,readbuff,fixups);
    clean_up();
    printf("\nDone.\n");



} //main

void clean_up()
{
        fclose(infile);
        fclose(outfile);
        fclose(infofile);
}


/*
 *  MS-dos .exe file loader
 */

load_exe(fexe,load_addr,read_buff,fixups)
FILE *fexe;
unsigned long load_addr;
char *read_buff;
struct dos_reloc *fixups;
{

	int	i,read_size;
	unsigned int total_paras,seg_fix;
	long	image_left,image_done,fix;
	struct dos_exe_header header;
	unsigned long ulbuff;
	unsigned short usbuff;
/*	
 *  Now, open up the .exe file and extract all the cgroup data and
 *  write that out to the .abs file ...
 */

	fread(&header,sizeof(struct dos_exe_header),1,fexe);
	if (header.id != 0x5a4d)
		{
		printf("Invalid header 0x%04x in %s\n",header.id, infilename);
                return (-1);
		}

	if(header.relen <= MAX_FIXUPS)
		{
		fseek(fexe,(long)header.reloc,SEEK_SET);
		fread(fixups,sizeof(struct dos_reloc)*header.relen,1,fexe);
		}
	else
		{
		printf("\nCan't load image ... too many fixups");
		return(-1);
		}
#ifdef DEBUG
        // dump the header info.
        printf("id: 			0x%04x\n",header.id);
        printf("length (rem): 		%d.\n",header.rem);
        printf("length (pages): 	%d.\n",header.pages);
        printf("# of relocs: 		%d.\n",header.relen);
        printf("header size: 		%d.\n",header.hsize);
        printf("min memory alloc:       0x%04x (%d.)\n",
        				header.hmin, header.hmin);
        printf("max memory alloc:       %d\n",header.hmax);
        printf("ssval:                  0x%04x\n",header.ssval);
        printf("spval:                  0x%04x\n",header.spval);
        printf("checksum:               0x%04x\n",header.checksum);
        printf("ipval:                  0x%04x\n",header.ipval);
        printf("csval:                  0x%04x\n",header.csval);
        printf("offset to 1st reloc:    0x%04x\n",header.reloc);
        printf("overlay #:              %d\n",header.ovrlay);
#endif //DEBUG

/*
 * load in and fix up the image ...
 */

	fseek(fexe,(long)(header.hsize*16),SEEK_SET);
	image_left = ((long)(header.pages-1)*512)+(long)header.rem-((long)header.hsize*16);
	total_paras = (unsigned int)(image_left>>4)+header.hmin+16; 
	image_done = 0;

	seg_fix = (load_addr >> 4) & 0xffff;

#ifdef DEBUG
        printf("Image load size:        0x%04lx (%ld.)\n",
        					image_left,image_left);
        printf("Total mem size:         0x%04x (%d.) paras, ",
        					total_paras,total_paras);
        printf(" 0x%04x (%d.) bytes\n",
                                                total_paras*16,total_paras*16);
        printf("seg fixup:              0x%04x\n",seg_fix);
#endif //DEBUG

   // here we can write the header that the PD ROM expects.
   ulbuff = image_left;
   fwrite(&ulbuff,4,1,outfile);		// load size

   ulbuff = total_paras<<4;
   fwrite(&ulbuff,4,1,outfile);		// total memory size

   usbuff = load_addr;
   fwrite(&usbuff,2,1,outfile);		// absolute load address

   usbuff = header.ssval + seg_fix;
   fwrite(&usbuff,2,1,outfile);		// starting SS

   usbuff = header.spval;
   fwrite(&usbuff,2,1,outfile);		// starting SP

   usbuff = header.csval + seg_fix;
   fwrite(&usbuff,2,1,outfile);		// starting CS

   usbuff = header.ipval;
   fwrite(&usbuff,2,1,outfile);		// starting IP





   while(image_left>0)
     {
		read_size = (image_left > (long)READ_BUFF_SIZE) ? READ_BUFF_SIZE : (int)image_left;
		fread(read_buff,read_size,1,fexe);
		for(i=0;i<header.relen;i++)
			{
	      fix = ((long)fixups[i].segment<<4)+(long)fixups[i].offset;
			if(fix >= image_done && fix < image_done+read_size)
				(*(unsigned int *)&read_buff[fix-image_done]) += seg_fix;
			}
		fwrite(read_buff,read_size,1,outfile);
		image_left -= read_size;
		image_done += read_size;
#ifdef DEBUG
                printf("%d done, %d left\r",image_done,image_left);
#endif //DEBUG
		}

#ifdef DEBUG
        printf("\n => image start at %04x:%04x\n",
			header.csval+seg_fix, header.ipval);
#endif //DEBUG
//	return(start_exe(header.csval+seg_fix,header.ipval));
        exit(0);
}


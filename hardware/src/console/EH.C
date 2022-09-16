/*
File: eh.c

Purpose:
	DOS exe file to HEX utility. Special purpose for X2 ROMs.

Edits:

001 28-Aug-1991 RAO Creation
002 04-Sep-1991 RAO Add fflush prior to close to avert C bugs
003 09-Sep-1991 RAO Added switches, added forced JMP xxxx options,
			added options for various debug stuff (not
			really needed now, it all works, but you never
			know when you need to confirm the contents...)

004 11-Sep-1991 RAO Added checksums for user code
005 13-Sep-1991 RAO Changed default offset for jump target to 3000
006 03-Nov-1991 RAO Changed default offset for jump target to 4000, made
		zero fill for unused locations an option [default == nofill]
007 22-Jan-1992 RAO Added Limit switch, add map file reads for that case

*/

#include <stdio.h>
#include <io.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>

#include "eh.h"

#define TRUE		(1 == 1)
#define FALSE		(! TRUE)

#define FILE_NAME_LEN	(256)
#define TEMP_LEN	(256)
#define DUMP_EXTENT	(16)

#define DEFAULT_DUMP_EXE	(FALSE)
#define DEFAULT_DUMP_HDR	(FALSE)
#define HEXBUF_LEN		(16384)

#define MAX_ADDRESS		(0x0ffff)

#define JMP_LEN			(3)


char
	buff[TEMP_LEN],
	temp[TEMP_LEN],
	HEXname[FILE_NAME_LEN],
	EXEname[FILE_NAME_LEN],
	MAPname[FILE_NAME_LEN],
	HEXbuff[HEXBUF_LEN],
	f1[TEMP_LEN],
	f2[TEMP_LEN],
	f3[TEMP_LEN],
	f4[TEMP_LEN],
	f5[TEMP_LEN];

int
	EXEfp;

off_t
	EXEsize;

FILE
	*MAPfp,
	*HEXfp;

struct CodeStr
	TempCode;


char
	*HelpText[] =
	{
	"use:\n",
	"eh -switches test.exe test.hex [test.map]\n",
	"\n",
	"test.exe is the input file (from LINK)\n",
	"test.hex will be written (as absolute PROM image)\n",
	"test.map will be read for seg names (if Limit switch is used)\n",
	"\n",
	"-help\t\tUsed to see this message\n",
	"-fill\t\tZero fill unused ROM locations (default no fill)\n",
	"-silent\t\tRun quietly except for errors\n",
	"-quiet\t\tSame as -silent\n",
	"-verbose\tLots of debugging output\n",
	"-debug\tThe most debugging output\n",
	"-dexe\t\tDump exe file data contents (debug)\n",
	"-dhdr\t\tDump exe file header contents (debug)\n",
	"-org fff0\tUse address fff0 to insert jmp code\n",
	"-jmp 4000\tInsert near jump to 4000 at org (default fff0) address\n",
	"-ljmp f000:4000\tInsert intersegment jmp to f000:4000\n",
	"-Limit SegName\tUse exe bytes up to 'Stop' value in SegName\n",
	"-kb 4000\tdon't write anything below 0x4000\n",
	"-xadr 70000\twrite an extd addr record to start at 0x7000\n",
	"Note: verbose and silent or quiet are mutually exclusive\n",
	"Example:\n",
	"eh -jmp 4f00 -limit ROM_CODEP test.exe test.hex test.map\n",

	NULL,		/* Must be last */
	};

char
	*JmpOpCode = { "\xe9" };

char
	LastSegment[TEMP_LEN];

int
	HaveInFile  = { FALSE },
	HaveOutFile = { FALSE },
	HaveMapFile = { FALSE };

/*
 * switches
 */
int
	LoadRequest = { FALSE },
	JmpRequest  = { FALSE },
	LJmpRequest = { FALSE },
	DumpExe = { DEFAULT_DUMP_EXE },
	DumpHdr = { DEFAULT_DUMP_HDR };
	Debug   = { FALSE },
	Verbose = { TRUE },
	Silent =  { FALSE },
	Fill =	  { FALSE },
	Quiet =   { FALSE };

unsigned
   int
	killbelow     = { 0 },
	Org           = { 0xfff0 },
	JmpTarget     = { 0x4000 },
	LJmpTargetSeg = { 0xf000 },
	LJmpTargetOff = { 0x4000 };

unsigned
   long
	loadbase = {0},			/* start at 0 */
	LoadLimit = { 0x10000 };	/* default is everything */

/*
 * function protos
 */
long lmin(unsigned long, unsigned long);
void write_ih(struct intel_hex *,FILE *);
void ShowHelp(void);
void inits(int,char **, char **);
int abbrev(char *, char *,int);
void view_hdr(void);
void dump_exe(void);
void CodeGen(struct CodeStr *);
int OverLap(struct CodeStr *,unsigned long,int);
int InsertCode(struct CodeStr *,unsigned long,int,struct intel_hex *);
void ZeroData(struct intel_hex *,int);
void getstop(void);
int read_record(char *, FILE *);

main(argc,argv,envp)
int
	argc;
char
	*argv[],
	*envp[];
{
   inits(argc,argv,envp);
   view_hdr();
   dump_exe();
   close(EXEfp);
   fflush(HEXfp);
   fclose(HEXfp);
}
void inits(argc,argv,envp)
int
	argc;
char
	*argv[],
	*envp[];
{
   int
	i;

   struct
    stat
	inf;

   char
	*p;

   i = 1;
   while(i < argc)
	{
	p = argv[i];
	if(Debug)
		printf("argv[%d] = %s\n",i,p);
	if(*p != '-')		/* switch character? */
		{		/* no, assume filename */
/*
 * File names are assumed to appear in this order:
 *	EXE file	(input file)
 *	HEX file	(output file)
 *	MAP file	(input file when Limit switch is used)
 */
		if(! HaveInFile)
			{
			strcpy(EXEname,p);
			HaveInFile = TRUE;
			i++;
			continue;
			}
		if(! HaveOutFile)
			{
			strcpy(HEXname,p);
			HaveOutFile = TRUE;
			i++;
			continue;
			}
		if(! HaveMapFile)
			{
			strcpy(MAPname,p);
			HaveMapFile = TRUE;
			i++;
			continue;
			}
		fprintf(stderr,"Bad arg: '%s'\n",p);
		ShowHelp();
		exit(1);
		}	/* end if switch char */
/*
 * Must be a switch, which one is it?
 */
	if(abbrev("Dexe",p+1,4))	/* test string, abbrev not ok */
		{
		DumpExe = TRUE;
		i++;
		continue;
		}

	if(abbrev("Dhdr",p+1,4))	/* test string, abbrev not ok */
		{
		DumpHdr = TRUE;
		i++;
		continue;
		}

	if(abbrev("Debug",p+1,5))	/* test string, abbrev not ok */
		{
		Debug = TRUE;
		i++;
		continue;
		}

	if(abbrev("Quiet",p+1,1))	/* test string, abbrev ok */
		{
		Quiet = TRUE;
		Silent = TRUE;		/* these track */
		Verbose = FALSE;
		i++;
		continue;
		}

	if(abbrev("Silent",p+1,1))
		{
		Quiet = TRUE;
		Silent = TRUE;		/* these track */
		Verbose = FALSE;
		i++;
		continue;
		}

	if(abbrev("Fill",p+1,1))
		{
		Fill = TRUE;
		i++;
		continue;
		}

	if(abbrev("Verbose",p+1,1))	/* test string, abbrev ok */
		{
		Quiet = FALSE;
		Silent = FALSE;		/* these track */
		Verbose = TRUE;
		i++;
		continue;
		}

	if(abbrev("Help",p+1,1))
		{
		ShowHelp();
		exit(0);
		}

	if(abbrev("Limit",p+1,3))
		{
		i++;
		if(i >= argc)		/* ran out of args */
			{
			fprintf(stderr,"Missing arg to -Limit\n");
			ShowHelp();
			exit(1);
			}
		LoadRequest = TRUE;
		p = argv[i];
		strcpy(LastSegment,p);
		i++;
		if(Verbose)
			printf("Using Limit segment: '%s'\n",p);

		continue;
		}

	if(abbrev("Org",p+1,3))		/* no abbrev */
		{
		i++;			/* get next arg */
		if(i >= argc)		/* ran out of args */
			{
			fprintf(stderr,"Missing arg to -org\n");
			ShowHelp();
			exit(1);
			}
		p = argv[i];
		if(1 != sscanf(p,"%x",&Org))
			{
			fprintf(stderr,"Can't read -org hex value: %s\n",p);
			ShowHelp();
			exit(1);
			}
		i++;
		if(Verbose)
			printf("Using org 0x%x\n",Org);

		continue;
		}

	if(abbrev("Jmp",p+1,3))		/* no abbrev */
		{
		i++;			/* get next arg */
		if(LJmpRequest)		/* long jump already active? */
			{
			fprintf(stderr,"eh.exe: LJmp already active\n");
			exit(1);
			}
		JmpRequest = TRUE;
		if(i >= argc)		/* ran out of args */
			{
			fprintf(stderr,"Missing arg to -Jmp\n");
			ShowHelp();
			exit(1);
			}
		p = argv[i];
		if(1 != sscanf(p,"%x",&JmpTarget))
			{
			fprintf(stderr,"Can't read -Jmp hex value: %s\n",p);
			ShowHelp();
			exit(1);
			}
		i++;
		if(Verbose)
			printf("Writing JMP 0x%x at org 0x%x\n",
				JmpTarget,Org);

		continue;
		}

	if(abbrev("xadr",p+1,4))		/* no abbrev */
		{
		i++;			/* get next arg */
		if(i >= argc)		/* ran out of args */
			{
			fprintf(stderr,"Missing arg to -xadr\n");
			ShowHelp();
			exit(1);
			}
		p = argv[i];
		if(1 != sscanf(p,"%lx",&loadbase))
			{
			fprintf(stderr,"Can't read -xadr hex value: %s\n",p);
			ShowHelp();
			exit(1);
			}
		i++;
		if(Verbose)
			printf("load base 0x%lx\n",loadbase);

		continue;
		}

	if(abbrev("kb",p+1,2))		/* no abbrev */
		{
		i++;			/* get next arg */
		if(i >= argc)		/* ran out of args */
			{
			fprintf(stderr,"Missing arg to -kb\n");
			ShowHelp();
			exit(1);
			}
		p = argv[i];
		if(1 != sscanf(p,"%x",&killbelow))
			{
			fprintf(stderr,"Can't read -org hex value: %s\n",p);
			ShowHelp();
			exit(1);
			}
		i++;
		if(Verbose)
			printf("Output inhibited below 0x%x\n",killbelow);

		continue;
		}



/*
 * hey, none of the above switch match tests passed, give up
 */
	fprintf(stderr,"Bad switch: '%s'\n",p);
	ShowHelp();
	exit(1);
	}

/*
 * did we get the files we needed?
 */

   if(! HaveInFile)
	fprintf(stderr,"eh.exe: Missing input file name arg\n");
   if(! HaveOutFile)
	fprintf(stderr,"eh.exe: Missing output file name arg\n");
   if(LoadRequest && (! HaveMapFile))
	fprintf(stderr,"eh.exe: Missing map file name arg\n");

   if(! (HaveInFile && HaveOutFile))
	{
	ShowHelp();
	exit(-1);
	}
   if(LoadRequest && (! HaveMapFile))
	{
	ShowHelp();
	exit(-1);
	}

/*
 * if a Limit switch was specified, get the "STOP" address of the specified
 * segment name from the MAP file...
 */
   if(LoadRequest)
	{
	if((MAPfp = fopen(MAPname,"r")) == NULL)
		{
		sprintf(temp,"eh.exe: Can't open mape file : %s",MAPname);
		perror(temp);
		}
	getstop();		/* get the address */
	fclose(MAPfp);
	}

/*
 * Open the EXE file
 */

   EXEfp = open(EXEname,O_RDONLY+O_BINARY);
   if(EXEfp == -1)
	{
	sprintf(temp,"eh.exe: Can't open EXE file: '%s'",EXEname);
	perror(temp);
	exit(-1);
	}

   HEXfp = fopen(HEXname,"w+t");
   if(HEXfp == NULL)
	{
	sprintf(temp,"eh.exe: Can't open HEX output file: '%s'",HEXname);
	perror(temp);
	exit(-1);
	}
/*
 * Make the hex file buffer larger
 */

   if(setvbuf(HEXfp,HEXbuff,_IOFBF,HEXBUF_LEN) != 0)
	{
	perror("Can't setvbuf for HEX output file");
	}

/*
 * get some info about the file
 */

   if(fstat(EXEfp,&inf) == -1)
	{
	perror("Can't fstat EXE file");
	exit(1);
	}
   EXEsize = inf.st_size;	/* keep file size in bytes */
}

/*
 * Show the EXE file header
 */
void view_hdr()
{
   int
	n;

   struct exehdr
	hdr;

   if(lseek(EXEfp,0L,SEEK_SET) == -1)
	{
	perror("Can't seek to start of EXE file in view_hdr()");
	exit(1);
	}

/*
 * get the EXE file header and show its contents
 */

   n = read(EXEfp,&hdr,sizeof(hdr));
   if(n != sizeof(hdr))
	{
	fprintf(stderr,"Failed to read EXE header in view_hdr()\n");
	exit(1);
	}

/*
 * Show the contents (for debugging)
 */

   if(DumpHdr)
	{
	printf("EXE file size: %ld\n",(long)EXEsize);
	printf("Signature: 0x%04x\n",hdr.exSig);
	printf("Bytes in last page: %u\n",hdr.exExtra);
	printf("Pages in file: %u\n",hdr.exPages);
	printf("Ptrs in reloc tbl: %u\n",hdr.exRelocs);
	printf("Header size (paras): %u\n",hdr.exHdrSize);
	printf("Min Alloc: %u\n",hdr.exMinAlloc);
	printf("Max Alloc: %u\n",hdr.exMaxAlloc);
	printf("ss,sp: 0x%04x:0x%04x\n",hdr.exInitSS,hdr.exInitSP);
	printf("Checksum: 0x%04x\n",hdr.exCheck);
	printf("cs,ip: 0x%04x:0x%04x\n",hdr.exInitCS,hdr.exInitIP);
	printf("Offset to reloc tbl: 0x%04x\n",hdr.exRelocTbl);
	printf("Overlay number: %u\n",hdr.exOverlay);
	}
}

/*
 * Dump the exe file
 */
void dump_exe()
{
   int
	i,
	diff,
	extent,
	once,
	n;

   unsigned long
	hiaddr,
	base,
	off;

   struct exehdr
	hdr;

   struct intel_hex
	ih;

   char
	*cp,
	*cp2;

   char
	buff[TEMP_LEN];

   unsigned char
	check_sum;

   check_sum = 0;		/* for the rom data bytes */

   if(lseek(EXEfp,0L,SEEK_SET) == -1)
	{
	perror("Can't seek to start of EXE file in dump_exe()");
	exit(1);
	}

/*
 * get the EXE file header
 */

   n = read(EXEfp,&hdr,sizeof(hdr));
   if(n != sizeof(hdr))
	{
	fprintf(stderr,"Failed to read EXE header in dump_exe()\n");
	exit(1);
	}
/*
 * We are assuming no fix ups needed, check this
 */

   if(hdr.exRelocs > 0)
	{
	fprintf(stderr,"Relocatables exist; need to fixup\n");
	exit(1);
	}
/*
 * Get the starting offset of the code/data
 */

   base = off = hdr.exHdrSize * 16L;
   if(! Silent)
	{
	printf("[working.");
	fflush(stdout);
	}
/*
 * write the intel hex ext record
 */

   ih.type = IH_EXT;
   ih.length = 2;
   ih.addr = 0;
   ih.data[0] = (loadbase>>12)&0xff;
   ih.data[1] = (loadbase>>4)&0xff;
   write_ih(&ih,HEXfp);

   while((off < (long)EXEsize) && ((off - base) < LoadLimit))
	{
	if(DumpExe)
		printf("%04lx\t",off - base);	/* show base offset */
	extent = (int)lmin((long)DUMP_EXTENT,(long)EXEsize - off);
	ih.type = IH_DATA;
	ih.addr = (unsigned int)(off - base);

	hiaddr = ih.addr + extent;
	if(hiaddr > (LoadLimit + 1L))	/* watch out for limit request! */
		{
		diff = hiaddr - LoadLimit - 1L;
		extent -= diff;
		}

	ih.length = extent;
	if(lseek(EXEfp,off,SEEK_SET) == -1)
		{
		perror("Bad seek in dump_exe()");
		exit(1);
		}
	if(extent != read(EXEfp,&buff,extent))
		{
		perror("Bad read in dump_exe()");
		exit(1);
		}
	off += extent;
	if(DumpExe)
	   {
	   cp2 = buff;
	   for(i = 0; i < extent; i++)
		printf(" %02x",0xff & *cp2++);		
	   printf("\n");
	   }
	cp = &ih.data[0];
	cp2 = buff;
	for(i = 0; i < extent; i++)
		{
		check_sum += *cp2;	/* maintain running check sum */
		*cp++ = *cp2++;
		}
	if (ih.addr > killbelow)
		write_ih(&ih,HEXfp);

	if((off % 1024) == 0L)
		{
		if(! Silent)
			{
			printf(".");		/* keep alive signal */
			fflush(stdout);
			}
		}
	}	/* the EXE file has now been processed */
/*
 * Zero fill up to the final byte (reserved for the checksum)
 * and include any required JMP code
 */
   off -= base;			/* ROM relative address of next free loc */

   if(! Silent)
	{
	printf("ok]\n");
	printf("Wrote EXE data to ROM addresses 0x%04lx to 0x%04lx\n",
		0L,
		off - 1);
	}
   if(Debug)
	{
	printf("checksum so far: %x\n",0xff & check_sum);
	}

/*
 * zero-fill the hex record data bytes
 */

   cp = &ih.data[0];
   for(i = 0; i < 256; i++)
	*cp++ = 0;

/*
 * check to see if the user has requested a jmp sequence to be forced
 * into the data stream...
 */
   if(JmpRequest || LJmpRequest)
	{
	CodeGen(&TempCode);	/* assemble the bytes */
	}
   if(! Fill)
	if(JmpRequest || LJmpRequest)
		off = Org;	/* forget fill, go right to inserted JMP */
	else
		off = MAX_ADDRESS - 1L;	/* just forget fill */

   if(off >= (unsigned long)MAX_ADDRESS)
	{
	fprintf(stderr,"No room for checksum byte in ROM image\n");
	}
   else
	{
	once = FALSE;
	while(off < MAX_ADDRESS - 1L)
		{
		if(! once)
		   {
		   once = TRUE;
		   if(! Silent && Fill)
		     printf("Zero filling ROM from 0x%04lx to 0x%04lx\n",
			off,
			(long)(MAX_ADDRESS - 1L));
		   }
		extent = (int)lmin((long)DUMP_EXTENT,(long)(MAX_ADDRESS - off));
		if(extent == 0)
			break;
		ih.type = IH_DATA;
		ih.addr = (unsigned int)off;
		ih.length = extent;	/* the filled zero bytes will be used */
/*
 * before we write this out, does the user-specified code sequence lie in this
 * zero filled block? If it does, write all of part of the code bytes into
 * the block, update the check sum, zero the bytes, keep going */
		if(JmpRequest || LJmpRequest)	/* user code? */
		   {		/* lowest byte fits into extent */
		   if(OverLap(&TempCode,off,extent))
			{	/* go ahead and insert user code */
			check_sum += (unsigned char)InsertCode(&TempCode,off,extent,&ih);
			if(Debug)
				{
				printf("Overlap at 0x%lx, called InsertCode\n",off);
				printf("Checksum now: %x\n",check_sum & 0xff);
				}
			}
		   }
		write_ih(&ih,HEXfp);
		if(JmpRequest || LJmpRequest)
			ZeroData(&ih,extent);
		off += extent;		/* bump address */
		}
	ih.type = IH_DATA;
	ih.addr = (unsigned int)off;
	ih.length = 1;		/* just the checksum byte */
	ih.data[0] = 0 - (0xff & check_sum);
	write_ih(&ih,HEXfp);
	if(! Silent)
	   printf("Checksum 0x%02x written at ROM location 0x%04lx\n",
		0xff & (0-check_sum),
		off);
	}
/*
 * Write the end record
 */

   ih.type = IH_END;
   ih.length = 0;
   ih.addr = 0;
   write_ih(&ih,HEXfp);
}

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
   fprintf(fout,"%02X\n",(-check_sum)&0xff);
}

void ShowHelp()
{
   char
	**p,
	*cp;

   p = HelpText;
   while((cp = *p++) != NULL)
	fprintf(stderr,"%s",cp);
}
int abbrev(full,partial,minlength)
char
	*full,
	*partial;
int
	minlength;
{
/*
 * Purpose:
 *
 *	Attempt a match of a 'partial' (abbreviated) string to the 'full'
 *	string. Require that the partial string be at least 'minlength'
 *	characters. This routine is useful for matching abbreviated
 *	keywords.
 *
 * Return:
 *	TRUE if match, else false
 */

   register
    int
	c1,
	c2;

   register
    char
	*p1,
	*p2;

   int
	l1,
	l2,
	l,
	i;

   l1 = strlen(partial);

   if(l1 < minlength)
	return(FALSE);			/* too short, reject */

   l2 = strlen(full);

   if(l2 < minlength)
	return(FALSE);			/* defensive */

   p1 = full;
   p2 = partial;

   l = (l1 < l2) ? l1 : l2;		/* pick smaller of two */

   for(i = 0; i < l; i++)
	{
	c1 = *p1++;
	c2 = *p2++;
	if(toupper(c1) != toupper(c2))
		return(FALSE);		/* no match */
	}
/*
 * compare succeeded, return TRUE
 */
   return(TRUE);
}

/*
 * Generate code bytes as specified by:
 *	Org
 *	JmpTarget
 *	LJmpTargetSeg
 *	LJmpTargetOff
 *
 */
void CodeGen(p)
struct CodeStr
	*p;
{
   unsigned int
	*ip;

   int
	i;

   p->Loc = Org;		/* starting address of instruction seq */
   if(JmpRequest)
	{
	p->Len = JMP_LEN;	/* Number of bytes in code sequence */
	strcpy(p->Code,JmpOpCode);	/* careful, writes a trailing null */
	ip = (unsigned *)(p->Code + strlen(p->Code));
/*
 * A short jmp is encoded as follows:
 *
 *	JMP	Rel.16
 *
 *	E9	XXXX
 */
	*ip = (unsigned)(0 - (Org + JMP_LEN - JmpTarget));
	if(Verbose)	/* show user */
		{
		printf("User code bytes at 0x%04x: ",Org);
		for(i = 0; i < JMP_LEN; i++)
			printf("0x%02x ",(p->Code[i] & 0xff));
		printf("\n");
		}
	return;
	}
}

/*
 * Given a pointer to a code structure, determine whether or not the
 * code contained within that structure partially or fully overlaps
 * a region starting at
 *
 *	'offset'
 *
 * and running for a length of
 *
 *	'extent'
 *
 * bytes. Return TRUE is there is *any* over lap, else return FALSE.
 */
int OverLap(p,off,extent)
struct CodeStr
	*p;
unsigned long
	off;
int
	extent;
{

/*
 * test right edge of code for being less than offset
 */

   if((unsigned long)(p->Loc  + p->Len - 1) < off)
	return(FALSE);

/*
 * test left edge of code for being greater than offset + extent - 1
 */
   if((unsigned long)(p->Loc) >
		(unsigned long)(off + (unsigned long)extent - 1L))
	return(FALSE);

   return(TRUE);		/* there is some overlap */
}

/*
 * Place the code CodeStr fragment as pointed to by p into an intel
 * hex structure pointed to by ip; return checksum of bytes
 *
 * Note some calculations required for partial overlap of code onto
 * the offset and its extent...
 */
int InsertCode(p,off,extent,ip)
struct CodeStr
	*p;
unsigned long
	off;
int
	extent;
struct intel_hex
	*ip;
{
   int
	i,
	adjust1,
	adjust2,
	len;

   unsigned
    int
	x;

   unsigned char
	sum;

   char
	*cp1,
	*cp2;
/*
 * Note:
 *
 *	ip->data[0] corresponds to off
 */

/*
 * Where do we start grabbing bytes from the data in the CodeStr ptr?
 */

   adjust1 = 0;
   if((unsigned long)p->Loc < off)
	adjust1 = (int)(off - (unsigned long)p->Loc);

/*
 * Where do we start writing into the ih structure?
 */

   adjust2 = 0;
   if((unsigned long)p->Loc > off)
	adjust2 = (int)((unsigned long)p->Loc - off);

/*
 * How many bytes will we transfer to the ih structure?
 */
   len = p->Len;	/* assume all of the code bytes to start with */
   if((unsigned long)p->Loc < off)
	len -= adjust1;	/* then start reducing */

   if((unsigned long)(p->Loc + p->Len) > (off + (unsigned long)extent))
	len -= (int)((unsigned long)(p->Loc + p->Len) -
		(off + (unsigned long)extent));

   cp2 = &ip->data[adjust2];
   cp1 = &p->Code[adjust1];

   if(Debug)
	{
	printf("InsertCode: adjust1: %d, adjust2: %d, len: %d\n",
		adjust1, adjust2, len);
	}

   sum = 0;
   for(i = 0; i < len; i++)
	{
	x = *cp1++;
	*cp2++ = x;
	sum += x;
	}
   return(sum & 0xff);
}

/*
 * Zero some number of data bytes in the data portion of an intel hex
 * record pointed to by ip
 */
void ZeroData(ip,len)
struct intel_hex *ip;
int len;
{
   int
	i;
   char
	*cp;

   cp = &ip->data[0];
   for(i = 0; i < len; i++)
	*cp++ = 0;
}
void getstop(void)
{
   int
	foundHeaders,
	foundSeg,
	l;

   char
	*lp;

   unsigned
    long
	SegBase;

   lp = buff;

/*
 * Make sure this is a map file, look for "Start" as the 1st token in the
 * line
 */

   foundSeg = FALSE;
   foundHeaders = FALSE;

   while(TRUE)
	{
	if((l = read_record(lp,MAPfp)) == -1)
		break;
	if(Debug)
		printf("[l=%d] %s\n",l,lp);
	if(sscanf(lp," %s %s %s %s %s",f1,f2,f3,f4,f5) != 5)
		continue;
	if(stricmp(f1,"Start") == 0)
		{
		foundHeaders = TRUE;
		if(Debug)
			printf("Found headers\n");
		break;		/* next loop */
		}
	}
/*
 * get picky...did we find it?
 */

   if(! foundHeaders)
	{
	fprintf(stderr,"** eh.exe: bad map file format\n");
	exit(-1);
	}

/*
 * Now look for the LastSegment string
 */

   while(TRUE)
	{
	if((l = read_record(lp,MAPfp)) == -1)
		break;
	if(Debug)
		printf("[l=%d] %s\n",l,lp);
	l = sscanf(lp," %s %s %s %s %s",f1,f2,f3,f4,f5);

	if(Debug)
		printf("[%d flds, f4 = '%s', len = %d]\n",l,f4,strlen(f4));
	if(l != 5)
		continue;
	if(stricmp(f4,LastSegment) != 0)
		continue;

	l = strlen(f1);		/* the start address field */
	if(l == 0)
		{
		fprintf(stderr,"** eh.exe: Bad format for start address in map file\n");
		exit(-1);
		}
	if(f1[l-1] != 'H')	/* format of address '01234H' */
		{
		fprintf(stderr,"** eh.exe: Bad format for start address in map file\n");
		exit(-1);
		}
	f1[l-1] = '\0';		/* drop trailing 'H' */
	l--;
	if(sscanf(f1,"%lx",&SegBase) != 1)
		{
		fprintf(stderr,"** eh.exe: Bad format for start address in map file\n");
		exit(-1);
		}

	l = strlen(f2);		/* the stop address field */
	if(l == 0)
		{
		fprintf(stderr,"** eh.exe: Bad format for stop address in map file\n");
		exit(-1);
		}
	if(f2[l-1] != 'H')	/* format of address '01234H' */
		{
		fprintf(stderr,"** eh.exe: Bad format for stop address in map file\n");
		exit(-1);
		}
	f2[l-1] = '\0';		/* drop trailing 'H' */
	l--;
	if(sscanf(f2,"%lx",&LoadLimit) != 1)
		{
		fprintf(stderr,"** eh.exe: Bad format for stop address in map file\n");
		exit(-1);
		}

	foundSeg = TRUE;
	if(Debug)
		printf("Found '%s', start: 0x%lX stop: 0x%lX\n",
			LastSegment,SegBase,LoadLimit);
	break;
	}
/*
 * did we find it?
 */

   if(! foundSeg)
	{
	fprintf(stderr,"** eh.exe: bad map file format: can't find '%s' seg\n",LastSegment);
	exit(-1);
	}
}

int read_record(lptr,fin)
char
	*lptr;
FILE
	*fin;
{
   int
	l;

   if(fgets(lptr,FILE_NAME_LEN-1,fin) == NULL)
	if(feof(fin))
		return(-1);	/* true eof*/
	else
		{
		fprintf(stderr,"Error reading input file\n");
		exit(-1);
		}
/*
 * now, get rid of the trailing NL and return the length of the line
 */
   l = strlen(lptr);		/* how long is this line? */
   if(l == 0)
	return(l);		/* if 0, don't bother removing trailing nl */
   if(*(lptr + l - 1) == '\n')
	{
	l--;
	*(lptr+l) = '\0';	/* erase nl */
	}
   return(l);
}

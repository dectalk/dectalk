/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Digital Equipment Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Digital or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	mkboot.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  mkboot.c take a small mode msdos .exe file and produces an intel
 *  hex module.  Usage :
 *
 *    mkboot <filename> code_segment  data_segment
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include	<stdio.h>
#include	<ctype.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>

/*
 * general defines ...
 */

#define	true	1
#define	false 0
#define	failure 1
#define	success 0

#define REC (*record)

/*
 *  Intel record definitions ...
 */

/*  The general structure of an intel record is ... */

struct	intel_record {
	unsigned char	type;
	unsigned int size;
	unsigned char data[10240];
};

/*  Intel symbol type definitions (not record types) are ... */

#define typdef_procedure	116
#define typdef_pointer		123
#define typdef_null			128

/*
 * msdos map file definitions ...
 */

/*  a segment record will look like ...  */

enum seg_type {UNKNOWN,CODE,TABLE,DICT,DATA};

struct	segment_def {
	unsigned long int    start;
	unsigned long int    stop;
	unsigned long int    length;
   enum seg_type        type;
   unsigned long int    new_start;
   unsigned int         old_seg;
   unsigned int         new_seg;
   int                  syms;
	char                 segment_name[16];
	char                 class_name[16];
};

struct fix_seg {

	unsigned long	int	length;
	unsigned int			seg;
};

/*  a public symbol record will look like ...  */

struct	public_symbol {
	unsigned int segment;
	unsigned int offset;
	char name[32];
};

/*
 *  msdos .exe files will look like ...
 */

/*   Headers for dos .exe files look like ... */

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

#define FIX_SEG (*(unsigned int *)&fixme[6])
#define FIX_CO1 (*(unsigned int *)&fixme[1])
#define FIX_CO2 (*(unsigned int *)&fixme[3])
#define FIX_DO  (*(unsigned int *)&fixme[4])

	struct intel_record irec;
	struct segment_def segs[50],*fs;
	struct public_symbol pub;
	struct dos_exe_header header;
	struct dos_reloc fixup;
	struct fix_seg rsegs[100];
	unsigned char input_string[2048];


main(argc,argv)
int argc;
char *argv[];
{
	int	pos,i,j,k,read_size,fixup_left,fix,tsyms,rs;
   int   ram_segs,rom_segs,unk_segs,found_fix,ram_data;
   int   data_fix,bad_fix,fsize,rec_type;

	unsigned long cgroup,csize,dgroup,dsize,cfix,dfix,link_fix,dstart;
	long int image_left,image_byte,next_fixup,bytes_out;
	long int link_exe;
	unsigned int cseg,il,ib,start_cs,start_ip;
   unsigned char fixme[8],*fwhere;
   char *rsymb;

	FILE *fexe,*fmap,*fabs,*fstb,*ftmp,*fhl,*fhh;
   fpos_t   fpos;
	char fnam[80];
	char filenam[80];
	char segname[80];


/*
 *  check out the input line parameters ...
 */

	if (argc < 2)
		{
		printf("  Usage : mkboot <filename> [code_offset] [data_offset] [umcs value]");
		exit(1);
		}

/*
 *  open the build file ...
 */

	strcpy(fnam,argv[1]);
	pos = strcspn(fnam,".");

	strcpy(&fnam[pos],".exe");
	if ((fexe=fopen(fnam,"r+b")) == NULL)
		{
		printf("  Can't open executable file : %s",fnam);
		exit(1);
		}
	strcpy(&fnam[pos],".map");
	if ((fmap=fopen(fnam,"r")) == NULL)
	   {
	   printf("  Can't open map file : %s",fnam);
	   exit(1);
	  }
	strcpy(&fnam[pos],".abs");
	if ((fabs=fopen(fnam,"w+b")) == NULL)
		{
		printf("  Can't open absolute file name : %s",fnam);
		exit(1);
		}
	strcpy(&fnam[pos],".stb");
	if ((fstb=fopen(fnam,"w")) == NULL)
		{
		printf("  Can't open symbol table file name : %s",fnam);
		exit(1);
		}
	strcpy(&fnam[pos],".hxh");
	if ((fhh=fopen(fnam,"w")) == NULL)
		{
		printf("  Can't open hex high byte file name : %s",fnam);
		exit(1);
		}
	strcpy(&fnam[pos],".hxl");
	if ((fhl=fopen(fnam,"w")) == NULL)
		{
		printf("  Can't open hex low byte file name : %s",fnam);
		exit(1);
		}
	if ((ftmp=tmpfile()) == NULL)
		{
		printf("  Can't open temp file");
		exit(1);
		}
/*
 *  Assume fixups to be 8000 for cseg and 0000 for dseg ...
 */

	cfix=0x80000L;
	dfix = 0x00000L;

	if (argc > 2)
		if(sscanf(argv[2],"%lx",&cfix) != 1)
			{
			printf("  Bad code segment fixup specified!");
			exit(1);
			}
	if (argc > 3)
	if(sscanf(argv[3],"%lx",&dfix) != 1)
			{
			printf("  Bad data segment fixup specified!");
			exit(1);
			}
   cseg = (unsigned int)(cfix>>4);

/*
 *  Write out the header to the .abs file
 */

	write_header(&irec.type,fabs);
	rs = 0;

/*
 *  Read in the map file and compute the segments values that will
 *  have to be fixed up ..
 */

	for(i=0;i<2;i++) 
		fgets(input_string,sizeof(input_string),fmap);

/*
 *  Now, get the segment names ...
 */

	tsyms=fix=j=0;
   ram_segs = rom_segs = unk_segs = 0;
   csize = dsize = 0L;
   ram_data = false;
	while(fgets(input_string,sizeof(input_string),fmap) != NULL)
		{
		if(strlen(input_string) <= 1)
			break;
      segs[fix].type = UNKNOWN;
      segs[fix].new_start = 0;
      segs[fix].old_seg = segs[fix].new_seg = 0;
      segs[fix].syms = 0;
		sscanf(input_string," %lxH %lxH  %lxH  %s %s",
                &segs[fix].start,
                &segs[fix].stop,
			       &segs[fix].length,
                &segs[fix].segment_name[0],
                &segs[fix].class_name[0]);
/*
 *  allow multiple ram data segment names ...
 */

      if(strncmp(&segs[fix].class_name[0],"DATA",4) == 0)
        ram_data = true;
      if(segs[fix].length == 0)
        continue;
      else if(segs[fix].length & 0xf)
        segs[fix].length = (segs[fix].length & 0xffff0) + 0x10;
      if(ram_data)
        {
        segs[fix].type = DATA;
        dsize += segs[fix].length;
        segs[fix].new_start = dfix;
        dfix += segs[fix].length;
        segs[fix].old_seg = segs[fix].start >> 4;
        segs[fix].new_seg = segs[fix].new_start >> 4;
        ram_segs += 1;
        }
      else if(strncmp(&segs[fix].class_name[0],"CODE",4) == 0 ||
              strncmp(&segs[fix].class_name[0],"TABLES",6) == 0 ||
               strncmp(&segs[fix].class_name[0],"FAR_DATA",8) == 0 ||
                strncmp(&segs[fix].class_name[0],"ENDCODE",7) == 0)
          {
          if(strncmp(&segs[fix].class_name[0],"CODE",4) == 0)
            segs[fix].type = CODE;
          else
            segs[fix].type = TABLE;
          csize += segs[fix].length;
          segs[fix].new_start = cfix;
          cfix += segs[fix].length;
          segs[fix].old_seg = segs[fix].start >> 4;
          segs[fix].new_seg = segs[fix].new_start >> 4;
          rom_segs += 1;
          }
      else
        {
        printf("    Unknown segment type %s\n",segs[fix].class_name);
        unk_segs += 1;
        }
      fix += 1;
		}
/*
 *  if I can't do a reloc on a type, then quit ...
 */
     if(unk_segs)
      {
      printf("  Unknown segment type(s) found!  Can't reloc.");
      exit(1);
      }
/*
 *  print out some status ...
 */
     printf("\n    Found %d segments ... code size %ld ... ",fix,csize);

/*
 *  Now, skip down to the ordered symbols and write out the symbols ...
 */

 	 for(i=0;i<5;i++)
		 fgets(input_string,sizeof(input_string),fmap);
	 while(fgets(input_string,sizeof(input_string),fmap) != NULL)
		 if(strlen(input_string) <= 1)
			 break;
	 for(i=0;i<2;i++)
		 fgets(input_string,sizeof(input_string),fmap);

/*
 *  first, write the cgroup header then add the symbols ... everything
 *  in the cgroup will be defined as a procedure ...
 */


    fgetpos(fmap,&fpos);
    for(i=0;i<fix;i++)
      {
      if(segs[i].length == 0)
        continue;
      fsetpos(fmap,&fpos);
      if(segs[i].type == CODE)
        {
        rec_type = 1;   
        write_typdef(&irec.type,typdef_procedure,fabs);
        }
      else
        {
        rec_type = 2; 
	     write_typdef(&irec.type,typdef_pointer,fabs);
	     }
	   init_debug(&irec.type,0,0,0,segs[i].new_seg);
      fprintf(fstb,"\nSegment %s moved from %lx to %lx",
        segs[i].segment_name,segs[i].start,segs[i].new_start);
      fprintf(fstb,"\nSymbols ...");
	   sprintf(segname,"%s",segs[i].segment_name);
   	add_debug(&irec.type,segname,0,rec_type,fabs);
      fprintf(fstb,"\n  %04x:%04x  %s",segs[i].new_seg,0,segname);
	   while (fgets(input_string,sizeof(input_string),fmap) != NULL)
		  {
		  if(strlen(input_string) <= 1)
		    break;
		  sscanf(input_string," %04x:%04x%*5c %s",&pub.segment,&pub.offset,
		    pub.name);
		  if(segs[i].old_seg == pub.segment)
         {
   	   add_debug(&irec.type,pub.name,pub.offset,rec_type,fabs);
         fprintf(fstb,"\n  %04x:%04x  %s",segs[i].new_seg,pub.offset,
                 pub.name);
         segs[i].syms += 1;
         tsyms += 1;
         }
		  }
	   write_record(&irec.type,fabs);
      fprintf(fstb,"\nTotal symbols %d\n",segs[i].syms);
      }

/*
 *  more status ...
 */
     printf("\n    Relocated %d symbols ... ",tsyms);

/*
 *  Now, open up the .exe file and extract all the cgroup data and
 *  write that out to the .abs file ...
 */

	 fread(&header,sizeof(struct dos_exe_header),1,fexe);

	if (header.id != 0x5a4d)
		{
		printf("  Invalid .exe file format -- no signature in file");
		exit(1);
		}
	start_cs = header.csval+cseg;
	start_ip = header.ipval;

/*
 *  Create a temporary file to fixup the image  ... copy the image ...
 */

	 fseek(fexe,(long)(header.hsize*16),SEEK_SET);

	 image_left = csize+dsize;
    while(image_left>0)
     {
	  read_size = (image_left > (long)sizeof(input_string)) ? sizeof(input_string) : (int)image_left;
	  fread(input_string,read_size,1,fexe);
     fwrite(input_string,read_size,1,ftmp);
     image_left -= (long)read_size;
     }
/*
 *  now run through the tmp file fixing up the image ...
 */

    data_fix = bad_fix = 0;
	 fseek(fexe,(long)header.reloc,SEEK_SET);
    fprintf(fstb,"\nFixups (%d) ...\n ",header.relen);
    printf("\n");
    for(j=0;j<header.relen;j++)
		{
      printf("\r    Starting fixups (total:%d done:%d) ...",header.relen,j);

/*
 *  read in a fixup record, see where it lives, etc ...
 */

	   fread(&fixup,sizeof(struct dos_reloc),1,fexe);
	   next_fixup = ((long)fixup.segment<<4)+(long)fixup.offset;
      if(next_fixup > csize)
        data_fix += 1;
      if(next_fixup >= sizeof(fixme))
        {
        next_fixup -= (long)(sizeof(fixme)-2);
        fwhere = &fixme[0];
        fsize = sizeof(fixme);
        }
      else
        {
        fwhere = &fixme[6];
        fsize = 2;
        }
      if(fseek(ftmp,next_fixup,SEEK_SET))
        {
        printf("\n  Temp file seek to byte %lx error!",next_fixup);
        exit(1);
        }
      if(fread(fwhere,fsize,1,ftmp) != 1)
        {
        printf("\n  Temp file read of byte %lx error!",next_fixup);
        exit(1);
        }

/*
 *  search the symbol table to see if we can tag a public record to
 *  this relocation ...
 */

      rsymb = "**";
      fsetpos(fmap,&fpos);
	   while (fgets(input_string,sizeof(input_string),fmap) != NULL)
		  {
		  if(strlen(input_string) <= 1)
		    break;
		  sscanf(input_string," %04x:%04x%*5c %s",&pub.segment,&pub.offset,
		    pub.name);
	     if(pub.segment == FIX_SEG)
          {
          if((next_fixup <= csize) && 
             ((pub.offset == FIX_CO1) || (pub.offset == FIX_CO2)))
             {
             rsymb = pub.name;
             break;
             }
          if(pub.offset == FIX_DO)
             {
             rsymb = pub.name;
             break;
             }
          }
        }

/*
 *  seach through the segment map and see if we can find the matching
 *  segment for fix and to be fixed ...
 */
       for(k=0;k<fix;k++)
         if((next_fixup >= segs[k].start) && (next_fixup < segs[k].stop))
           {
           fs = (struct segment_def *)&segs[k].start;
           break;
           }

       for(k=0;k<fix;k++)
		  if(FIX_SEG == segs[k].old_seg)
          {
          fprintf(fstb,"\n  fixup at : %05lx  (segment:%s offset:%05lx) ..",
            next_fixup,(*fs).segment_name,(next_fixup-(*fs).start));
          fprintf(fstb,"\n    moved %04x to %04x (seg: %s  sym: %s)",
            FIX_SEG,segs[k].new_seg,segs[k].segment_name,rsymb);
			 FIX_SEG = segs[k].new_seg;
          if(next_fixup > csize)
            fprintf(fstb,"  ** ds fix **");
          break;
          }
       if(k == fix && fix != 0)
         {
		   fprintf(fstb,"\n  Can't fix item %d at : %05lx (%04x)!",
                j,next_fixup,FIX_SEG);
         bad_fix +=1;
		   }
      fseek(ftmp,next_fixup,SEEK_SET);
      fwrite(fwhere,fsize,1,ftmp);
		}
	  for(i=0;((segs[i].type != DATA) && (i < fix));i++)
	    {
	    rsegs[rs].length = segs[i].length;
	    rsegs[rs].seg = segs[i].new_seg; 
	    rs += 1;
	    rsegs[rs].length = 0;
	    }
	 fclose(fexe);
	 fclose(fmap);
    if(data_fix)
      printf("\n  Fixups (%d) found in data segment!",data_fix);
    if(bad_fix)
      printf("\n  Could not fixup %d locations!",bad_fix);

/*
 *  now, write out the .abs file ...
 */

    printf("\n  Writing relocated image to .abs file ...");
    if(fseek(ftmp,(unsigned long)0,SEEK_SET))
      {
      printf("\n  Seek failure during .abs file write!");
      exit(1);
      }
    bytes_out = 0;
    for(i=0;rsegs[i].length;i++)
     {
	   init_pedata(&irec.type,rsegs[i].seg,0);
      ib = 0;
	   for (il=rsegs[i].length ; il!=0 ; il -= read_size)
		  {
	     read_size = (il> sizeof(input_string)) ? sizeof(input_string) : il;
	     if(fread(input_string,read_size,1,ftmp) != 1)
          {
          printf("\n  Failure reading temp file during .abs write!");
          exit(1);
          }
 	 	  add_pedata(&irec.type,(rsegs[i].seg+((ib>>4)&0xfff)),
				         			  ((ib%16)&0xf),input_string,read_size,fabs);
	     ib += read_size;
        bytes_out += read_size;
		  }
	  write_record(&irec.type,fabs);
     }

/*
 * flush the rest of the pe data if any and add the end record to the
 * file ...
 */


	write_modend(&irec.type,start_cs,start_ip,fabs);

/*
 * close the files and print out the run time stats ...
 */

	fclose(fabs);
   fclose(fstb);
	fclose(fexe);
	fclose(fmap);

/*
 *  write out the two intel hex files ...
 */

   printf("\n  Writing hex high and low byte files...");
	write_hex(ftmp,bytes_out,&input_string[0],fhl,fhh,start_cs,start_ip);
	fclose(fhl);
	fclose(fhh);

/*
 *  write out the emulator load file ...
 */


/*
 *  final status ....
 */

   rmtmp();
   printf("\n  %ld rom bytes written to file.",bytes_out);
	exit(0);
}


/*
 *  Write out the header for the .abs file ...
 */

unsigned char lhead[] = {2,'D','T'};
unsigned char thead[] = {2,'D','T'};

write_header(record,fout)
struct intel_record *record;
FILE *fout;
{
	REC.type = 0x82;
	REC.size = 0;
	into_record(record,&lhead[0],sizeof(lhead));
	write_record(record,fout);
	REC.type = 0x80;
	REC.size = 0;
	into_record(record,&thead[0],sizeof(thead));
	write_record(record,fout);

}

/*
 *  Write out the end record for the .abs file ...
 */

write_modend(record,frame,offset,fout)
struct intel_record *record;
unsigned int frame,offset;
FILE *fout;
{
	unsigned char mod_spec;

	mod_spec = 0xc0;
	REC.type = 0x8a;
	into_record(record,&mod_spec,1,fout);
	into_record(record,&frame,2,fout);
	into_record(record,&offset,2,fout);
	write_record(record,fout);
}

unsigned char tdef[]={0,0,0};

write_typdef(record,intel_type,fout)
struct intel_record *record;
unsigned char intel_type;
FILE *fout;
{
	REC.type = 0x8e;
	REC.size = 0;
	tdef[2]=intel_type;
	into_record(record,tdef,sizeof(tdef));
	write_record(record,fout);

}

/*
 *  Special record insert routines ...
 */

init_debug(record,fm,gi,si,fn)
struct intel_record *record;
unsigned char gi,si;
unsigned int fn;
{
	REC.type = 0x7e;
	REC.size = 0;
	into_record(record,&fm,1);
	into_record(record,&gi,1);
	into_record(record,&si,1);
	into_record(record,&fn,2);
}

add_debug(record,name,offset,type,fout)
struct intel_record *record;
unsigned char *name,type;
unsigned int offset;
FILE *fout;
{
	unsigned char csize;

	csize=strlen(name);
	if(csize+REC.size+4 > sizeof(struct intel_record)-4)
      {
		write_record(record,fout);
      REC.size = 5;
      }
	into_record(record,&csize,1,fout);
	into_record(record,strupr(name),csize,fout);
	into_record(record,&offset,2,fout);
	into_record(record,&type,1,fout);

}

init_pedata(record,frame,offset)
struct intel_record *record;
unsigned int frame,offset;
{
	REC.type = 0x84;
	REC.size = 0;
	into_record(record,&frame,2);
	into_record(record,&offset,1);
}

add_pedata(record,frame,offset,buff,count,fout)
struct intel_record *record;
unsigned int frame,offset;
unsigned char *buff;
int count;
FILE *fout;
{
   int k;
	unsigned int *pf;
	unsigned char *po;

	if(count+REC.size > sizeof(struct intel_record)-4)
		{
		write_record(record,fout);
		into_record(record,&frame,2);
		into_record(record,&offset,1);
		}
	pf= (unsigned int *) &REC.data[0];
	po= &REC.data[2];
	if(*pf != frame && *po != (unsigned char)offset)
		{
		write_record(record,fout);
		into_record(record,&frame,2);
		into_record(record,&offset,1);
		}
	into_record(record,buff,count);
 }

/*
 *  into_record() adds a character string to the data portion of an
 *  record.  If the count would force the data string beyond the
 *  end of the record, then the record is written to the specifed
 *  file and a new record of the same type is started.
 */

into_record(record,string,count)
struct intel_record *record;
unsigned char *string;
int count;
{
	unsigned char *p;
	int i;

	p=&REC.data[REC.size];
	for(i=0;i<count;i++)
		*(p++) = *(string++);
	REC.size += count;
}

write_record(record,fout)
struct intel_record *record;
FILE *fout;
{
	unsigned char *p;

	if(REC.size)
		{
	   REC.size += 1;
	   REC.data[REC.size-1] = check_sum(record,REC.size+2);
	   fwrite(record,1,REC.size+3,fout);
	   REC.size = 0;
		}
}

check_sum(str,count)
char *str;
int count;
{
	unsigned char sum;

	sum=0;
	for(;count>0;count--)
		sum += *str++;
	return(256-sum);
}

/*
 * utility print routines ...
 */

print_header(hd)
struct dos_exe_header *hd;
{
   long int im;

   im = ((long int)(*hd).pages*512)-((long int)(*hd).hsize*16)-(long int)(*hd).rem;
   
   printf("\nFile exe header ...");
   printf("\n  Linker signature ... %04x",(*hd).id);
   printf("\n  FIle remainder ..... %d",(*hd).rem);
   printf("\n  Images pages ....... %d",(*hd).pages);
   printf("\n  Relocation items ... %d",(*hd).relen);
   printf("\n  Header size ........ %d (%d bytes)",(*hd).hsize,((*hd).hsize*16));
   printf("\n  Min paragraphs ..... %d",(*hd).hmin);
   printf("\n  Max paragraphs ..... %d",(*hd).hmax);
   printf("\n  Init stack segment . %04x",(*hd).ssval);
   printf("\n  Init stack pointer.. %04x",(*hd).spval);
   printf("\n  Checksum ........... %04x",(*hd).checksum);
   printf("\n  Init ip............. %04x",(*hd).ipval);
   printf("\n  Init cs............. %04x",(*hd).csval);
   printf("\n  Offset to reloc .... %04x",(*hd).reloc);
   printf("\n  Overlay number ..... %04x",(*hd).ovrlay);
   printf("\n    Image size ....... %ld",im);
}

/******************************************************************
 *  INTEL Hex file support routines ...
 */

/*
 *  intel hex file record format ...
 */

struct intel_hex {
	unsigned char length;
	unsigned int addr;
	unsigned char type;
	unsigned char data[256];
	unsigned char sum;
};

#define	REC	(*record)

#define	IH_DATA		00		/* length data bytes */
#define	IH_END		01		/* no data bytes */
#define	IH_EXT		02		/* two data bytes, <bits 12-19><bits 4-11>  */
#define	IH_START		03 	/* four data bytes, start cs:ip */

/*
 *  write_hex() splits the files into a even/odd roms and write them out.
 */ 

write_hex(fabs,size,buff,fhl,fhh,cseg,cip)
FILE *fabs,*fhl,*fhh;
long	size;
unsigned char buff[];
unsigned int cseg,cip;
{
	long	abs_addr,rom_addr;
	struct intel_hex ih;
	int	i,j,len,k;

/*
 *  write out the files
 */
	for(k=0;k<4;k++)
	  {
	  fseek(fabs,0L,SEEK_SET);
	  rom_addr = k*0x2000;
     abs_addr = 0L;
	  while(abs_addr<size)
	    {
	    ih.length=2;
	    ih.addr = 0;
	    ih.type = IH_EXT;
	    ih.data[0] = (rom_addr>>12) & 0xff;
	    ih.data[1] = (rom_addr>>4) & 0xff;
	    write_ih(&ih,fhl);
	    write_ih(&ih,fhh);
	    len = (abs_addr+2048 <= size) ?  2048 : (int)(size-abs_addr);
	    fread(buff,len,1,fabs);
	    ih.type = IH_DATA;
	    ih.addr = rom_addr&0xf;

/*
 *  first write out the low bytes from this chunk ...
 */

	    for(i=0;i<len;)
	      {
		   ih.length = 0;
	      for(j=0;j<16 && i<len;i+=2)
	        {
	        ih.data[j++] = buff[i];
	        ih.length++;
	        }
	      write_ih(&ih,fhl);
	      ih.addr += j;
	      }

/*
 *  now the high ...
 */

	    ih.addr = rom_addr&0xf;
	    for(i=1;i<len;)
	      {
	      ih.length = 0;
	      for(j=0;j<16 && i<len;i+=2)
	        {
	        ih.data[j++] = buff[i];
	        ih.length++;
	        }
	      write_ih(&ih,fhh);
	      ih.addr += j;
	      }

	    abs_addr += len;
	    rom_addr += len/2;
	    }

/*
 *  write out the far jump code ...
 */

	  ih.length=2;
	  ih.addr = 0;
	  ih.type = IH_EXT;
	  ih.data[0] = (k*2)+0x01;
	  ih.data[1] = 0xff;
	  write_ih(&ih,fhl);
	  write_ih(&ih,fhh);
	  ih.length = 6;
	  ih.type = IH_DATA;
	  ih.addr = 8;
	  ih.data[0] = 0xba;
	  ih.data[1] = 0xff;
	  ih.data[2] = 0x3a;
	  ih.data[3] = 0xef;
	  ih.data[4] = cip&0xff;
	  ih.data[5] = cseg&0xff;
	  write_ih(&ih,fhl);
	  ih.length = 6;
	  ih.data[0] = 0xa0;
	  ih.data[1] = 0xb8;
	  ih.data[2] = 0xfc;
	  ih.data[3] = 0xea;
	  ih.data[4] = (cip>>8)&0xff;
	  ih.data[5] = (cseg>>8)&0xff;
	  write_ih(&ih,fhh);		
	}

	ih.type = IH_END;
	ih.length  = 0;
	ih.addr = 0;
	write_ih(&ih,fhl);
	write_ih(&ih,fhh);
	fclose(fhl);
	fclose(fhh);

}		

write_ih(record,fout)
struct intel_hex *record;
FILE *fout;
{
	unsigned int check_sum;
	int i;

	check_sum=REC.length+REC.type;
	check_sum+=(unsigned char)((REC.addr>>8)&0xff);
	check_sum+=(unsigned char)(REC.addr&0xff);
	for(i=0;i<REC.length;i++)
	  check_sum += REC.data[i];
	fprintf(fout,":%02X%04X%02X",REC.length,REC.addr,REC.type);
	for(i=0;i<REC.length;i++)
	  fprintf(fout,"%02X",REC.data[i]);
	fprintf(fout,"%02X\n",(-check_sum)&0xff);
	
}

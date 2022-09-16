/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    © Digital Equipment Corporation 1995. All rights reserved.
 *    Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:	loader.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * 		This mimics the host-based loader used for DECtalk-PC. It reads the 
 * 		directory at the front of the ROM and loads things up as appropriate.
 * 		(mkpdrom is the tool that builds the ROM out of the separate images)
 *
 ***********************************************************************
 *    Revision History:
 *
 * 001	12 Jul 94	tek		changed the initial flush to start_flush()
 * 002	13 dec 95	tek		edits to merge with common code pool 
 * 003	26 apr 96	tek		fix EBD's inability to produce a tone before
 *								speaking..
 * 004	11 nov 96   gl      add language support by using the dic_lang flag.
 * 005	27 nov 96   gl      use [:power lspeak] to send power status to in_ring
 * 006	25 sep 97   gl      use array for all dictionary entry
 *                          	also add UK_english support
 * 007	06/22/1998	mfg		Added LANG_latin_american support
 * 008	06/10/1999  cjl     Revised welcome messages.
 * 009	10/28/99	eab		Modified to support Lookheed-Martin chnages with ifdef SW_VOLUME
 * 010	07/20/2000	chj		added FRENCH support
 * 011 	09/20/2000	cab		Fixed copyright info and formatted comment section
 * 012	09/21/2000	MGS		Fixed Whitespace before #ifdefs and friends
 */
#include "kernp.h"
#include "kernel.h"
#include "defs.h"
#include "pdrom.h"
#include "loader.h"
#include "implode.h"

#include "version.h" /* for the version number */

/* for _fmemcpy */
#include <string.h>
#include <memory.h>


/* this would normally be allocated out of dead RAM above 960K */
/* where does this lie now? */
#define WORKBUFFSIZE	(35256U)
#define	WORKBUFFFLAT	(0xF0000L)
#define DIRBUFFSIZE     (1024*2)
#define ROMBASE	(0xc00000)


unsigned char flushstr[] = "[:flush all]";

#ifdef ENGLISH_US
#ifdef US_AND_SP
unsigned char welcome[]="DECtalk Express is running for American English and Castillian Spanish.[:sync][:power lspeak]\n";
#else
unsigned char welcome[]="DECtalk Express is running for American English.[:sync][:power lspeak]\n";
#endif
#endif

/* GL 09/25/1997 add UK_english support */
#ifdef ENGLISH_UK
unsigned char welcome[]="DECtalk Express is running for British English.[:sync][:power lspeak]\n";
#endif

#ifdef SPANISH
#ifdef US_AND_SP
unsigned char welcome[]="DECtalk Expreso est  corriendo en espa¤ol y ingles.[:sync][:power lspeak]\n";
#else
unsigned char welcome[]="DECtalk Expreso est  corriendo.[:sync][:power lspeak]\n";
#endif
#endif

#ifdef GERMAN
unsigned char welcome[]="DECtalk Express leuft.[:sync][:power lspeak]\n";
#endif

#ifdef FRENCH
unsigned char welcome[]="DECtalk Express fonctionne pour les français[:sync][:power lspeak]\n";
#endif

/* the ROM is byte packed, so we need to make sure we are too. */
/* the build default seems to be word packing, so it's pragma time.. */
#pragma pack(1)
#pragma optimize("gcelt",on)


/* globals that we need to make the decompression work.. */
unsigned long int ROMReadLen, ROMStartLoc, RAMStartLoc;

void far read_rom(unsigned long, unsigned short, unsigned long);

unsigned long int ReadRom(unsigned long start, unsigned long count, unsigned char far *buff)
{
  	/* this ints into the special vector that is used to get to the */
	/* addresses above 1 meg.. */ 
	/* This does a whole block, which is faster than doing it byte or
	 * words at a time.. This will correctly break a >30K transfer into
	 * smaller chunks.
	 * the start address passed in is relative to the start of the ROM.
	 */

	unsigned long int	remaining;
	unsigned short 		this;
	unsigned long int 	destflat, srcflat;

#ifdef DEBUG
	printf("ReadRom: start = %08x, count = %08x, buff = %04x:%04x\n",
			start, count,
			FP_SEG(buff), FP_OFF(buff));
#endif
	remaining = count;
	srcflat = start + ROMBASE;

	destflat = FP_SEG(buff);
	destflat = destflat<<4;
	destflat += FP_OFF(buff);


	while (remaining)
	{
		this =(unsigned short)(remaining>(1024*30) ? (1024*30) : remaining);
/*		printf("read_rom src=%08x count=%04x dst=%08x..", */
/*			srcflat, */
/*			this, */
/*			destflat); */
		read_rom(srcflat,this,destflat);
		destflat += this;
		srcflat += this;
		remaining -= this;
/*		printf("done. %08x remaining\n",remaining); */
	}
	return (0); /* always works.. */
}


unsigned far pascal DReadBuff(char far *buff, unsigned short int far *size)
{
 	/* this routine is what feeds data to the explode routine. It needs to  */
	/* understand when to stop reading (and, for that matter, *what* to read) */
	/* so it uses the global variables ROMReadLen and ROMStartLoc. */
	unsigned long int readsize;
#ifdef DEBUG
	printf("DReadBuff: buff=%04x:%04x, size(%04x:%04x)=%04x\n",
			FP_SEG(buff), FP_OFF(buff),
			FP_SEG(size), FP_OFF(size), *size);
#endif

	if (ROMReadLen > 0)
	{
		readsize = (*size > ROMReadLen ? ROMReadLen : *size);
		ReadRom(ROMStartLoc, 
			readsize,
			buff);
		ROMReadLen -= readsize;
		ROMStartLoc += readsize;
		return((unsigned short)readsize);

	} /* still something to read.. */
	else 
		return(0);
}


void far pascal DWriteBuff(char far *buff, unsigned short int far *size)
{
	/* this is, again, for the explode routine. */
	/* pretty straightforward; it just writes to memory starting */
	/* at RAMStartLoc.. */
    unsigned char far *dstptr;
	unsigned short far *dwptr;
	unsigned short far *swptr;
    unsigned short i, mysize;
	 

    FP_SEG(dstptr) = (unsigned short)((RAMStartLoc>>4)&0xffff);
    FP_OFF(dstptr) = (unsigned short)(RAMStartLoc&0xf);
#ifdef DEBUG
	printf("DWriteBuff: copying from %04x:%04x to %04x:%04x\n",
			FP_SEG(buff), FP_OFF(buff),
			FP_SEG(dstptr), FP_OFF(dstptr));
	slflush();
#endif
	mysize = *size;
        _fmemcpy(dstptr,buff,mysize);
#ifdef MANMOVE
	i=0;
	mysize = *size;

	/* align the first byte.. */
	if ((int)dstptr & 1)
	{
		dstptr[i] = buff[i++];
		mysize--;	/*did one. */
	}

	/* do it by words. */
	dwptr = &dstptr[i];
	swptr = &buff[i];
	{
	    unsigned short wdcnt;
	    wdcnt = mysize/2;

        for (i=0;i<wdcnt;i++)
                dwptr[i] = swptr[i];
	    /* make sure the last byte was done.. */
	    if (mysize != wdcnt*2)
		{
			dstptr[*size-1] = buff[*size-1];
		}
	}
#endif /*MANMOVE */

    RAMStartLoc += *size;

}

/* a useful routine..  */
void mystrcat(unsigned char _far *dest,unsigned char _far *src, unsigned int count)
{
	unsigned int sofar,inptr;
	for (sofar=0;dest[sofar]!='\0';sofar++)
	;
	inptr = 0;
	if (sofar>=count-1)
		return;
	while ((sofar<count-2) && (src[inptr]!='\0'))
	{
		dest[sofar++] = src[inptr++];
	}
	dest[sofar] = '\0';
	return;
}




/* */
/* the actual loader begins here.. */
/* */

unsigned char far *work_buff;


loader_task()
{
	/* load the files that are needed to run the unit.. */



    struct pd_entry far *direntry;
    struct pdrom_directory far *dirheader;
    unsigned long int loadfiles;
    unsigned int i;
    unsigned long loadptr;
	unsigned long int WorkBuffSize;
	unsigned char far *dirbuff;
	unsigned char far *cploadptr;

	unsigned short int (far *task)();

	/* set the version string info.. */
	KS.version[0]='\0';
	mystrcat((unsigned char *)(KS.version),versionstring,VERSIONLEN-1);
	KS.versionspeak[0]='\0';
	mystrcat((unsigned char *)(KS.versionspeak),versionspeak,SPEAKLEN-1);
#ifdef SW_VOLUME
	mystrcat((unsigned char *)(KS.version)," [LM]",VERSIONLEN-1);
	mystrcat((unsigned char *)(KS.versionspeak)," L M ",SPEAKLEN-1);
#endif /*SW_VOLUME*/


	WorkBuffSize = WORKBUFFSIZE + DIRBUFFSIZE + 32;
	/* find the hidden RAM buffer area.. */
	FP_SEG(work_buff) = WORKBUFFFLAT>>4;
	FP_OFF(work_buff) = WORKBUFFFLAT&0xF;

	/* put the directory buffer up above the work buffer.. */
	dirbuff = &work_buff[WORKBUFFSIZE+16];

/*	printf("work_buff at %04x:%04x\n", */
/*	FP_SEG(work_buff), FP_OFF(work_buff)); */

/* 	read in the directory part of the rom.. */
/*	printf("calling ReadRom(0,%04x,%04x:%04x)\n", */
/*	DIRBUFFSIZE, FP_SEG(dirbuff), FP_OFF(dirbuff)); */
    ReadRom(0,DIRBUFFSIZE,dirbuff);
/*	printf("directory read."); */

    dirheader = (struct pdrom_directory far *)dirbuff;
    direntry = &(dirheader->entry[0]);
    loadfiles = dirheader->num_entries;
	if (KS.l_verbose)
		printf(" 0x%08x files.\n",loadfiles);

	/* before we go off to load the files, block to allow spc_task */
	/* to run and put out the power-on beep. */
	block(NULL_FP);
    /* read the entries.. */
    for (i=1;i<loadfiles;i++)
    {
        unsigned int j;
        unsigned char far *cptr;
        unsigned short seg_fix;
        unsigned short huge *index_fix;
		if (KS.l_verbose)
		{
        	printf("Entry %d.:  ",i);
            printf(" filename: %f\n",direntry[i].filename);
            printf(" flags: 0x%04x  ",direntry[i].flags);
            printf(" starting offset: 0x%08x\n",direntry[i].file_start);
            printf(" file size: 0x%08x   ",
                     direntry[i].file_size);
            printf(" load size: 0x%08x\n",
                     direntry[i].load_size);
            printf(" checksum: 0x%04x\n",direntry[i].checksum);
            printf(" first few bytes of file (0x): \n    ");
            ReadRom(direntry[i].file_start,16,work_buff);
            for (j=0;j<16;j++)
                 printf(" %02x",work_buff[j]);
		 	printf("\n");
		}
        /* the first file is always kernel.sys, which always */
        /* gets loaded by protected mode code.  */
        /**/

        /* the other special case is dictionary files. */
        if (direntry[i].flags & 0x8)
        {
            unsigned long int entries, dic_bytes, total_paras;
            /* Dictionary files just land in memory, but may need */
            /* to be uncompressed.  Even in the compressed case, */
            /* the first eight bytes (which contain the entry count */
            /* and the byte count) are *NOT* compressed. So, we peel */
            /* them off now and save 'em for later. */
			/*printf("This is a dictionary file.\n"); */
            ReadRom(direntry[i].file_start,
                    4,
                    (unsigned char *)&entries);
                    ReadRom(direntry[i].file_start+4,
                    4,
                    (unsigned char *)&dic_bytes);
            /* go get memory.. */
            /* this is done a strangely to avoid massive casting.. */
			/*printf("  entries=%08x, dic_bytes=%08x\n", */
			/*entries, dic_bytes); */
            total_paras = entries;
            total_paras = (total_paras*4) + dic_bytes;
            total_paras = (total_paras>>4) +2;
			/*printf(" malloc(%08x) ",total_paras); */
            cploadptr = malloc(total_paras);
			/*printf("returned %04x:%04x\n", */
			/*FP_SEG(cploadptr),FP_OFF(cploadptr)); */
		    loadptr =
					(unsigned long)(FP_SEG(cploadptr))<<4 +
					FP_OFF(cploadptr);

		    /* but keep cploadptr around for the uncompressed case. */
		    if (KS.l_verbose)
                printf("  loading at 0x%08x\n",loadptr);
            if (direntry[i].flags & 0x4)
            {
                unsigned int error;
				if (KS.l_verbose)
			 		printf("  dictionary is compressed; unpacking..\n");
                /* have to set up some globals for the decompression */
                ROMStartLoc = direntry[i].file_start+8;
                ROMReadLen = direntry[i].file_size-8;
                RAMStartLoc = loadptr;
                /* off to decompress.. */
                error = explode(DReadBuff, DWriteBuff, work_buff);
                if (error)
                {
                   printf("??error 0x%x unpacking %s\n",
                   			error, direntry[i].filename);
                   continue;
                }

          	} /* compressed dictionary */
            else
            {
            	/* just copy it to memory.. */
				if (KS.l_verbose)
					printf("  dictionary is not compressed; copying..\n");

                ReadRom(direntry[i].file_start+8,
                		direntry[i].file_size-8,
                		cploadptr);

			} /* uncompressed dictionary */
            /* now we have to do all the fixups.. */
			/*printf("  starting fixups.. %08x to do\n",entries); */
            seg_fix = (unsigned short)((loadptr >> 4)&0xffff);
            /* loadptr is a 32-bit linear address; stuff it into a */
            /* huge pointer.. */
            FP_SEG(index_fix) = (unsigned short)(loadptr>>4);
            FP_OFF(index_fix) = (unsigned short)(loadptr&0xf);
		    {
		    	unsigned long int k;
                for (k=1; k<(entries*2); k += 2)
				{
		 			unsigned short huge *hptr;
					hptr = &index_fix[k];

/*				{ */
/*				printf("  Fixup %8x: %04x:%04x was %04x\n", */
/*					k, */
/*					FP_SEG(hptr),FP_OFF(hptr), */
/*					index_fix[k]); */
/*				} */
                    index_fix[k] += seg_fix;
				}
			}     

            /* hook in the dictionary */
            if (KS.l_verbose)
				printf(
                      	"dictionary at 0x%04x:%04x; 0x%08x entries, 0x%08x bytes",
                       	FP_SEG(cploadptr),FP_OFF(cploadptr),
						entries,dic_bytes);
						
			/* GL 11/11/1996, add dictionary language support */
                        /* GL 09/25/1997  use array structure for all dictionary entry data */
                        /*                also add UK_english support */
                        switch (direntry[i].dic_lang)
			{
			 	case 0 : /* ENGLISH_US dictionary */
                                        KS.fdic[LANG_english] = (volatile unsigned int far *)cploadptr;
                                        KS.fdic_entries[LANG_english] = entries;
		    			break;
			 	case 1 : /* FRENCH dictionary */
		    			KS.fdic[LANG_french] = (volatile unsigned int far *)cploadptr;
		    			KS.fdic_entries[LANG_french] = entries;
		    			break;
			 	case 2 : /* GERMAN dictionary */
		    			KS.fdic[LANG_german] = (volatile unsigned int far *)cploadptr;
		    			KS.fdic_entries[LANG_german] = entries;
		    			break;
			 	case 3 : /* SPANISH dictionary */
		    			KS.fdic[LANG_spanish] = (volatile unsigned int far *)cploadptr;
		    			KS.fdic_entries[LANG_spanish] = entries;
		    			break;
                                case 5 : /* British dictionary */
                                        KS.fdic[LANG_british] = (volatile unsigned int far *)cploadptr;
                                        KS.fdic_entries[LANG_british] = entries;
		    			break;
			 	case 6 : /* LATIN AMERICAN dictionary */
		    			KS.fdic[LANG_latin_american] = (volatile unsigned int far *)cploadptr;
		    			KS.fdic_entries[LANG_latin_american] = entries;
		    			break;
 			 	default : /* ENGLISH_US dictionary as defaulted dictionary */
                                        KS.fdic[LANG_english] = (volatile unsigned int far *)cploadptr;
                                        KS.fdic_entries[LANG_english] = entries;
		    			break;

		    }	
		    if (KS.l_verbose)
				printf(" loaded.\n");

		} /* if it's a dictionary. */
        else
        {
        	/* just like in the dictionary case, we'll load the */
            /* file and then worry about the fixups. */

            /* first, figure out how much memory we *really* need.. */

            /* the image itself is after the header and the relocs */
            /* the compression routine doesn't touch the header or */
            /* the relocs; it just compresses the text. While we */
            /* could compress the whole darn thing, doing it this */
            /* way allows us to easily allocate the right amount */
            /* of memory and then decompress right into the final */
            /* RAM locations, rather than having to decompress */
            /* chunks into a buffer and then figure out the header. */

			unsigned long int FirstImageByte, total_paras;
            unsigned long int total_image, FirstFixup;
            struct dos_exe_header hdrbuff;
            struct dos_reloc _far *fixbuff;

			/* printf("This is an image.\n"); */
            /* read the header.. */
            ReadRom(direntry[i].file_start,
                   	sizeof(struct dos_exe_header),
                    (unsigned char far *)&hdrbuff);
            total_image =
            		((long)(hdrbuff.pages-1)*512) +
                    (long)hdrbuff.rem -((long)hdrbuff.hsize*16);
            /* total memory allocation is the size of the image plus */
            /* the amount of memory allocation required by the */
            /* hmin value in the header.. */
            total_paras = (total_image>>4) +hdrbuff.hmin +16;


            cploadptr = malloc(total_paras);
		    loadptr =
				(unsigned long)(FP_SEG(cploadptr))<<4 +
				FP_OFF(cploadptr);
            if (KS.l_verbose)
				printf("  load at 0x%08x \n",loadptr);

            FirstImageByte = direntry[i].file_start +
            				hdrbuff.hsize*16;
            FirstFixup = direntry[i].file_start +
            				hdrbuff.reloc;

            /* compressed? */
            if (direntry[i].flags & 0x4)
            { 	/* is compressed. */
			   	unsigned error;
			   	if (KS.l_verbose)
					printf(" Decompressing image..");
			   	/* set up the globals for the decompression */
			   	/* read routine.. */
			
			   	ROMStartLoc = FirstImageByte;
			   	ROMReadLen = direntry[i].file_size - hdrbuff.hsize*16;
			   	RAMStartLoc = loadptr;

			   	if (KS.l_verbose)
					printf("\n  reading 0x%x bytes from 0x%08x ..",
					ROMReadLen, ROMStartLoc);

			   	error = explode(DReadBuff,DWriteBuff,work_buff);
			   	if (error)
			   	{
					printf("??error 0x%x unpacking %s\n",
							error, direntry[i].filename);
					continue;
				}
			   	if (KS.l_verbose)
					printf(" done.\n");

			} /* is compressed image */
            else
            {
            	/* if its not compressed, just go jam it into memory. */

                FP_SEG(cploadptr) = (unsigned short)((loadptr>>4)&0xffff);
                FP_OFF(cploadptr) = (unsigned short)(loadptr&0xf);
			   	if (KS.l_verbose)
					printf("Image load starting.\n");

                ReadRom(FirstImageByte, total_image, cploadptr);

			} /* is uncompressed image */
            /* now, paint in the fixups. We'll use work_buff, to */
            /* hold the fixups, because that's a handy spot. */
		    if (KS.l_verbose)
		        printf("Reading fixup buffer, 0x%04x fixups..\n",
			  	hdrbuff.relen);
            ReadRom(FirstFixup,
            		hdrbuff.relen*(sizeof(struct dos_reloc)+1),
                    work_buff);

            fixbuff = (struct dos_reloc _far *)(work_buff);
			/* printf("fixbuff = %40x:%04x\n", */
			/* FP_SEG(fixbuff),FP_OFF(fixbuff)); */
			/* printf("loadptr = %08x\n",loadptr); */

            seg_fix = (unsigned short)((loadptr >> 4)&0xffff);
		    {
		       	unsigned int k;
                for (k=0; k<hdrbuff.relen; k++)
                {
                 	FP_SEG(index_fix) =
						fixbuff[k].segment
						+ FP_SEG(cploadptr);
			 		/* the following is safe, because the offset of */
			 		/* malloc'd space is always 0. (=NOP) */
                    FP_OFF(index_fix) =
						fixbuff[k].offset
						+ FP_OFF(cploadptr);
/*			if (k<3) */
/*				{ */
/*				printf("Fixup at %04x:%04x was %04x\n", */
/*				FP_SEG(index_fix), FP_OFF(index_fix), */
/*				(short)*index_fix); */
/*			 	slflush(); */
/*				} */
                	*index_fix += seg_fix;
            	}
		    }
			
		    /* ok, start the file. */
			FP_SEG(task) = hdrbuff.csval+seg_fix;
			FP_OFF(task) = hdrbuff.ipval;
		    
		    if (KS.l_verbose)
				printf("Starting image at %04x:%04x ..",
			FP_SEG(task), FP_OFF(task));
			slflush();
		    (*task)(0,cploadptr);
		    if (KS.l_verbose)
				printf("running.\n");
			slflush();
		} /* it's not a dictionary */
	} /* for loadfiles */

	/* say something..  */
	start_flush(false);
	/* the embedded units don't speak on powerup.. */
#ifndef EBD08
	for (i=0;welcome[i] != '\0'; i++)
			put_ring(KS.in_ring,&welcome[i]);
#else /*EBD08*/
	{
		/* need to run something through to cover the case */
		/* where the first thing that gets said is actually*/
		/* a tone (this is a hack. */
		unsigned char temp;
		temp = '.';
		put_ring(KS.in_ring,&temp);
	}
#endif
	printf("[DECtalk Express is running.]\n");

}

/* verbose mode needs this (this is on the host on DTPC.. */
unsigned short far get__ss()
{
	unsigned short tmp;
	__asm
	{
		mov	ax, ss;
		mov	tmp, ax;
	}
	return(tmp);	// we could just let AX return, but the
			// compiler grumps..
}

unsigned short far get__ds()
{
	unsigned short tmp;
	__asm
	{
		mov	ax, ds;
		mov	tmp, ax;
	}
	return(tmp);
}

unsigned short far get__es()
{
	unsigned short tmp;
	__asm
	{
		mov	ax, es;
		mov	tmp, ax;
	}
	return(tmp);
}


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
 *    File Name:	hexobj.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  hexasm takes an intel hex file and produces an msdos .asm file
 *  that can be assembled ...  Usage:
 *
 *    hexasm <filename> label_name
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
#include <time.h>
#include <sys\types.h>
#include <sys\timeb.h>
#include	<malloc.h>

/*
 * general defines ...
 */

#define	true	1
#define	false 0
#define	failure 1
#define	success 0


struct intel_hex {
	unsigned char length;
	unsigned int addr;
	unsigned char type;
	unsigned char data[256];
	unsigned char sum;
};

main(argc,argv)
int argc;
char *argv[];
{
	int pos,recs,bytes,i;
	FILE *fhex,*fobj;
	unsigned char sum;

	char	*buff;
	int	offset;

	struct timeb	dt;
	struct intel_hex irec;


/*
 *  check out the input line parameters ...
 */


	if (argc < 3)
		{
		printf("  Usage : hexobj <in file> <out file>");
		exit(0);
		}
/*
 *  open all the needed files ...
 */


	if ((fhex=fopen(argv[1],"r")) == NULL)
		{
		printf("  Can't open hex file : %s",argv[1]);
		exit(1);
		}
	if ((fobj=fopen(argv[2],"w+b")) == NULL)
		{
		printf("  Can't open .obj file : %s",argv[2]);
		exit(1);
		}


	if((buff = calloc(0x8000,1)) == NULL)
		{
		printf("\nNo memory for buffer build");
		exit(1);
		}
	recs=bytes=0;
	offset=0;
	while ((read_record(&irec.length,fhex) != EOF) && (irec.type != 0x01))
		{
	   recs++;
		if(irec.type == (char) 0x0)
			{
			bytes += irec.length;
			for(i=0;i<irec.length;i++)
				*(buff+offset+i+irec.addr)=irec.data[i];
			}
		if(irec.type == (char) 0x2)
			{
			offset = (*(int *)&irec.data[0])<<4;
			}
		}

/*
 *  finish the file .asm file and close both ...
 */
	fclose(fhex);
	if(fwrite(buff,0x8000,1,fobj) != 1)
		printf("\nError writing file!");
	fclose(fobj);

/*
 *  print some fare well stats and exit ...
 */

	printf("\nTotal %d records read with %u data bytes found.",recs,bytes);
	exit(0);
}

#define REC (*record)

read_record(record,fin)
struct intel_hex *record;
FILE *fin;
{
	unsigned char check_sum;
	int i;

	if(fscanf(fin," :%02x%04x%02x",&REC.length,&REC.addr,&REC.type) == EOF)
		return(EOF);
	switch (REC.type)
		{
		case 0x00 : for(i=0;i<REC.length;i++)
							fscanf(fin,"%02x",&REC.data[i]);
						break;
		case 0x01 :	break;
		case 0x02 : fscanf(fin,"%04x",&REC.data[0]);
						break;
		case 0x03 :	fscanf(fin,"%04x%04x",&REC.data[0],&REC.data[2]);
						break;
		};
	fscanf(fin,"%02x",&REC.sum);

	check_sum=REC.length+REC.type;
	check_sum+=(unsigned char)(REC.addr/256);
	check_sum+=(unsigned char)(REC.addr&0xff);
	for(i=0;i<REC.length;i++)
	  check_sum += REC.data[i];
	check_sum += REC.sum;

	if(check_sum != 0)
		{
		printf("  Check sum error (%02x) found!",check_sum);
		exit(1);
		}
	return(0);
}


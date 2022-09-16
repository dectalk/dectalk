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
 *    File Name:	wav_voc.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  convert a .wav file to a .dat file for playing on DECtalk-pc.
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include <stddef.h>
#include <stdlib.h>
#include <dos.h>
#include <bios.h>
#include	<ctype.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#include	<stdio.h>
#include <conio.h>
#include	<time.h>
#include	<malloc.h>


/*
 * general defines ...
 */

#define	true	1
#define	false 0
#define	failure 1
#define	success 0

unsigned int frame_data[256];

main(argc, argv)
int	argc;
char	*argv[];
{

	FILE		*wav;
	FILE		*voc;

	int	i,j,pos;
	long	samp_time;
	long	samp_frames;
	int	read_size;
	int	curr_size;
	unsigned int *fp;
	char fnam[128];

/*
 *  check args and open input file and output files ...
 */

	if(argc < 2 || argc > 3)
		{
		printf("\nUsage : wav_voc <input file> <output file>");
		exit(0);
		}

	strcpy(fnam,argv[1]);
	pos = strcspn(fnam,".");
	strcpy(&fnam[pos],".wav");
	if ((wav=fopen(fnam,"r+b")) == NULL)
		{
		printf("  Can't open vaxwave file : %s",fnam);
		exit(1);
		}
	if(argc < 3)
		strcpy(&fnam[pos],".voc");
	else
		strcpy(fnam,argv[2]);
	if ((voc=fopen(fnam,"w")) == NULL)
		{
		printf("  Can't open digitized output file : %s",fnam);
		exit(1);
		}
	
/*
 *  Read in the sample times, data frames, then toss the rest of the
 *  header ...
 */
	
	fread(frame_data,sizeof(frame_data),1,wav);
	samp_time = *(long *)&frame_data[0];
	samp_frames = *(long *)&frame_data[2];
	fread(frame_data,sizeof(frame_data),1,wav);
	fread(frame_data,sizeof(frame_data),1,wav);
	fread(frame_data,sizeof(frame_data),1,wav);

/*
 *  now say what we found, write out the fixed headers then the records ...
 */
	printf("\nWriting file for %ld samples at %ld samples per second ...\n",
		samp_frames,samp_time);
	curr_size = 0;
	fprintf(voc,"\n[:digitized]");
	while(samp_frames)
		{
		read_size = (samp_frames > sizeof(frame_data)/2) ? sizeof(frame_data)/2 : samp_frames;
		read_size  = fread(frame_data,2,read_size,wav);
		curr_size += read_size;
		printf("\r  Working on %d ...",curr_size);
		if(read_size == 0)
			break;
		samp_frames -= read_size;
		fp = &frame_data[0];
		while(true)
			{
			fprintf(voc,"\n[:data");
			for(j=0;j<8;j++)
				{
				fprintf(voc," %04X",*fp++);
				read_size -= 1;
				if(read_size == 0)
					break;
				}
			fprintf(voc,"]");
			if(read_size == 0)
				break;
			}
		}
	fprintf(voc,"\n[:text]");
	fclose(voc);
	fclose(wav);
}

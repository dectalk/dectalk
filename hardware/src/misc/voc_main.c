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
 *    File Name:	voc_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-pc digitized file transfer utility.
 *
 *  This file takes either 16bit digitized data files or SoundBlaster
 *  8-bit data files and sends them do the DECtalk module to be played.
 *
 ***********************************************************************
 *    Revision History:
 *      GL      2/15/96         fix problem of playing .voc file.
 *		CL 		2/20/96			fixed ratee type to unsigned char.
 */

#include "tsr.h"
#include "voc_prot.h"
#include	<string.h>

unsigned int frame_data[SPC_DIGITIZED_MAX];
unsigned char sb_data[SPC_DIGITIZED_MAX*2];
int read_size,next_byte,next_sample;
FILE		*voc;
int voc_module;

int main(int argc,unsigned char **argv )
/*int main(int argc,char *argv[])*/
/*int argc;*/
/*char *argv[];*/
{
	union _REGS  tsr_regs;
	int	i,pos;
	int	force_digitized,force_text,sb_file;
	char fnam[128];

/*
 *  make sure that the tsr is installed before we attemp to load ...
 */
	if(argc < 2)
		usage();

	RB.ah = DECTALK_ID;
	RB.al = INSTALL_CHECK;
	_int86(0x2f, &tsr_regs, &tsr_regs);
	if (RB.al != INSTALLED)
		{
		printf("DECtalk tsr not installed ... install and try again");
     	usage();
   	}

/*
 *  check args and open input file and output files ...
 */

	force_digitized = force_text = true;
	sb_file = false;
	voc_module = 0;

	for (i = 2; i < argc; i++)
		{
   	if ((argv[i][0] == '-') || (argv[i][0] == '/'))
			{
			switch(toupper(argv[i][1]))
         	{
				case	'D'	:

					force_digitized = true;
					break;

				case	'T'	:

					force_text = true;
					break;

				case	'S'	:

					sb_file = true;
					break;

				case	'M'	:

					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
						voc_module = atoi(argv[i]);
						if(voc_module < 0 ||  voc_module > 3)
							{
							printf("\n?? Module range is 0 to 3");
							usage();
							}
						}
					break;


				default:
					usage();
				}
			}
		}
	strcpy(fnam,argv[1]);
	pos = strcspn(fnam,".");
	if(*(argv[1]+pos) == '\0')
		strcpy(&fnam[pos],".voc");
	if ((voc=fopen(fnam,"r+b")) == NULL)
		{
		printf("  Can't open digitized data file : %s",fnam);
		exit(1);
		}

	if(force_digitized)
		dtpc_cmd(DIGITIZED_MODE,0);

	if(sb_file)
		play_sb();
	else
		play_wave();

	fclose(voc);
	if(force_text)
		dtpc_cmd(TEXT_MODE,0);
}

unsigned int dtpc_cmd(cmd,value)
unsigned char cmd,value;
{
	union	_REGS	tsr_regs;

	do {
		tsr_regs.h.ah = DECTALK_ID;
		tsr_regs.h.al = cmd;
                tsr_regs.x.bx = value;
		tsr_regs.x.si = voc_module;
		_int86(0x2f, &tsr_regs, &tsr_regs);
		} while (tsr_regs.x.ax == TSR_BUSY);
	return(tsr_regs.x.ax);

}

usage()
{
	printf("\nDECtalk PC digitized data transfer utility ...");
	printf("\n  dt_voc <file_name> <switches>");
	printf("\n    valid switches ...");
	printf("\n      -D ... force unit to digitized mode at start");
	printf("\n      -T ... reset unit to text mode at end");
	printf("\n      -S ... play sound blaster voice file.");
	exit(1);
}

play_wave()
{
	int	i,read_size;

	union _REGS  tsr_regs;
	struct		dectalk_char_buff cb;
	struct		dectalk_char_buff _far *cbp;

	cbp = &cb;
	while(true)
		{
		read_size = fread(frame_data,2,sizeof(frame_data)/2,voc);
		if(read_size == 0)
			break;
		if(read_size != sizeof(frame_data)/2)
			for(i=read_size;i<sizeof(frame_data)/2;i++)
				frame_data[i] = 0;

		(*cbp).count = 8;
		(*cbp).buff = (unsigned char _far *)frame_data;

		do {
			tsr_regs.h.ah = DECTALK_ID;
			tsr_regs.h.al = DIGITIZED_DATA;
			tsr_regs.x.dx = FP_SEG(cbp);
			tsr_regs.x.bx = FP_OFF(cbp);
			tsr_regs.x.si = voc_module;
			_int86(0x2f, &tsr_regs, &tsr_regs);
			} while (tsr_regs.x.ax != TSR_SUCCESS);
		}
}

#pragma pack(1)

struct	sb_header {

	char	sb_id[20];
	int	data_start;
	int	format;
	int	id;
};

#define	SB_voc_terminator		0
#define	SB_voc_data				1
#define	SB_voc_continue		2
#define	SB_voc_silence			3
#define	SB_voc_marker			4
#define	SB_voc_ascii			5
#define	SB_voc_repeat			6
#define	SB_voc_end				7


void play_sb()
{
	int	temp;
	long	count;
	struct sb_header *sbh;
/*        int ratee;*/
        unsigned char ratee;

	read_size = fread(sb_data,1,sizeof(sb_data)/1,voc);
	sbh = (struct sb_header *)sb_data;
	if(_strnicmp((*sbh).sb_id,"Creative Voice File",19) != 0)
		{
		printf("\n  Bad voice file id field!");
		exit(1);	
		}
	next_byte = (*sbh).data_start;
	next_sample = 0;

	while(true)
		{
		switch(get_byte())	{

			case	SB_voc_terminator		:
				return;

			case	SB_voc_data				:

				count = (long)get_byte();
				count += (long)get_byte()<<8;
				count += (long)get_byte()<<16;

                                if((ratee=get_byte()) != 156)
					{
                                        ratee = 1000/(256-ratee);
                                        dtpc_cmd(SPC_RATE,ratee);
					}
				if(get_byte() != 0)
					{
					printf("\n  Data must not be compressed!");
					exit(1);
					}
				count -= 2;
				pack_buff(count);
				break;

			case	SB_voc_continue		:

				count = (long)get_byte();
				count += (long)get_byte()<<8;
				count += (long)get_byte()<<16;
				pack_buff(count);
				break;

			case	SB_voc_silence			:

				count = (long)get_byte();
				count += (long)get_byte()<<8;
				count += (long)get_byte()<<16;
				temp  = (unsigned int)get_byte();
				temp += (unsigned int)get_byte()<<8;
				zero_buff(temp);
				break;

			case	SB_voc_marker			:

				count = (long)get_byte();
				count += (long)get_byte()<<8;
				count += (long)get_byte()<<16;
				temp  = (unsigned int)get_byte();
				temp += (unsigned int)get_byte()<<8;
				printf("\nMarker : %u",temp);
				break;

			case	SB_voc_ascii			:

				count = (long)get_byte();
				count += (long)get_byte()<<8;
				count += (long)get_byte()<<16;
				printf("\nString : ");
				while(count)
					{
					printf("%c",get_byte());
					count -= 1;
					}
				break;

			case	SB_voc_repeat			:
				break;
			case	SB_voc_end				:
				break;
			}

		
	}
}

/*
 *  get a byte from a sb file ... reloads the buffer if needed ...
 */

unsigned char get_byte()
{
	if(next_byte != read_size)
		return(sb_data[next_byte++]);
	read_size = fread(sb_data,1,sizeof(sb_data)/1,voc);
	next_byte = 0;
	if(read_size)
		return(sb_data[next_byte++]);
	printf("\n  Error ... end of file with no end record!");
	exit(1);
}

/*
 *  read sb data bytes and send them to the DECtalk-pc when needed ...
 */

void pack_buff(count)
long	count;
{
	while(true)
		{
		while(next_sample<SPC_DIGITIZED_MAX)
			{
                        frame_data[next_sample++] = (unsigned int)((get_byte()<<7)-16000);
			count -= 1;
			if(count == 0)
				return;
			}
		send_frame();
		}
}

void zero_buff(count)
unsigned int count;
{
	while(true)
		{
		while(next_sample<SPC_DIGITIZED_MAX)
			{
			frame_data[next_sample++] = 0;
			count -= 1;
			if(count == 0)
				return;
			}
		send_frame();
		}
}


/*
 *  send a built frame buffer over to the DECtalk ...
 */

send_frame()
{
	union _REGS  tsr_regs;
	struct dectalk_char_buff cb;
	struct dectalk_char_buff _far *cbp;

	if(next_sample)
		{
		cbp = &cb;
		while(next_sample<SPC_DIGITIZED_MAX)
			frame_data[next_sample++] = 0;
		(*cbp).count = 8;
		(*cbp).buff = (unsigned char _far *)frame_data;
		do {
			tsr_regs.h.ah = DECTALK_ID;
			tsr_regs.h.al = DIGITIZED_DATA;
			tsr_regs.x.dx = FP_SEG(cbp);
			tsr_regs.x.bx = FP_OFF(cbp);
			tsr_regs.x.si = voc_module;
			_int86(0x2f, &tsr_regs, &tsr_regs);
			} while (tsr_regs.x.ax != TSR_SUCCESS);
		next_sample = 0;
		}
}
	

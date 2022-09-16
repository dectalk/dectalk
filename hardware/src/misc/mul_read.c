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
 *    File Name:	mdemo_read.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-pc multi-board file reader ...
 *
 ***********************************************************************
 *    Revision History:
 * 001: 30-APR-96  KSB  Added include for tsr.h for MAX_PC_BOARDS
 *                      and added code to support MAX instead of 4
 * 002: 07may96  ...cjl	Touched with latest 4-8 board fix.
 *
 */

#include	<stdio.h>
#include <conio.h>
#include <dos.h>

#include "tsr.h"			// Get the MAX_PC_BOARDS variable

#define		DECTALK_ID    		0xD0
#define		INSTALL_CHECK		0x00				/* Check if module installed */
#define		INSTALLED			0xFF				/* return in al */
#define		GET_STATUS			0x03				/* get current status */
#define		STAT_rr_char		0x0004				/* ready to receive char data */
#define		SEND_BUFF			0x0a				/* send a character buffer */
#define		SEND_CHAR			0x08				/* send a character */

/*  Removed due to TSR.H redefinition  - KSB
struct		dectalk_char_buff	{
	unsigned int			count;
	unsigned char __far		*buff;
	
};
*/

#define	TSR_FAILURE		0x00			/* Fails to do function */
#define	TSR_SUCCESS		0x01			/* Succeeds */
#define	TSR_BUSY		0x02			/* Tsr is busy, try again */
#define	TSR_RETRY		0x03			/* Module busy, try again */

#define	RB			tsr_regs.h
#define	RW			tsr_regs.x

#define	true		1
#define	false		0

char	read_buff[8][512];
int	act_count[MAX_PC_BOARDS];
int	next_char[MAX_PC_BOARDS];
FILE	*fp[MAX_PC_BOARDS];

main(argc,argv)
int argc;
char *argv[];
{
	union _REGS  tsr_regs;
	unsigned int mod, num_mods, same_file, act_mods;
	struct		dectalk_char_buff			db;
	struct		dectalk_char_buff	_far 	*dp;
	long	int	total_bytes;
	int	i;

	if(argc < 2)
		{
		printf("Usage: mul_read -m <module number> <file_name>");
		exit(1);
		}

/*
 *  make sure that the tsr is installed
 */

	RB.ah = DECTALK_ID;
	RB.al = INSTALL_CHECK;
	RW.si = 0;
	_int86(0x2f, &tsr_regs, &tsr_regs);
	if (RB.al != INSTALLED)
		{
		printf("DECtalk tsr not installed ... install and try again");
     	exit(1);
   	}
/*
 *  init things ...
 */

	for(i=0; i<MAX_PC_BOARDS; i++)
		{
		act_count[i] = 0;
		fp[i] = 0;
		}
	num_mods = RW.si;
	act_mods = 0;

/*
 *  select the module and files ...
 */

   for (i = 1; i < argc; i++)
		{
   		if ((argv[i][0] == '-') || (argv[i][0] == '/'))
			{
			switch(toupper(argv[i][1]))
         	{

				case	'M'	:

					if((argv[i+1][0] != '-') && (argv[i+1][0] != '/') && (i+1 != argc))
						{
						i+= 1;
						if(argv[i][0] != '*')
							{
							same_file = false;
							mod = atoi(argv[i]);
							act_mods += 1;
							if(mod < 0 || mod >= RW.si)
								{
								if(RW.si = 1)
									printf("\n?? Only one module installed");
								else
									printf("\n?? Module range is 0 to %d",RW.si);
								exit(1);
								}
							}
						else
							{
							same_file = true;
							act_mods = num_mods;
							mod = 0;
							}
						i+= 1;
						if((fp[mod]=fopen(argv[i],"r+b")) != NULL)
							break;
						printf("\n??Failure to open file %s for module %d",argv[i],mod);
						exit(1);
						}
					break;

             default:
					printf("\n?? Invalid switch.");
					exit(1);
				}
			}
		}

	dp = &db;
	total_bytes = 0;

/*
 *  for a single file, just read in the buffer and send it to all
 *  in order ...
 */

	if(same_file)
		{
		printf("Sending file ...\n");
		while(act_count[0]=fread(&read_buff[0][0],1,256,fp[0]))
			{
			for(i=0;i<num_mods;i++)
				{
				(*dp).count = act_count[0];
				(*dp).buff = &read_buff[0][0];
				do {
					RB.ah = DECTALK_ID;
					RB.al = SEND_BUFF;
					RW.dx = FP_SEG(dp);
					RW.bx = FP_OFF(dp);
					RW.si = i;
					_int86(0x2f, &tsr_regs, &tsr_regs);
					} while (RW.ax == TSR_BUSY || RW.ax == TSR_RETRY);
				if(RW.ax == TSR_FAILURE)
					{
					printf("\nFailure in sending buff to module %d",i);
					fclose(fp[0]);
					exit(1);
					}
				}
			total_bytes += act_count[0];
			printf("\r %ld bytes sent to each module.",total_bytes);
			}
		fclose(fp[0]);
		printf("\nComplete!");
		exit(1);
		}
/*
 *  for multiple files, read in the buffer and send over characters when
 *  there is room in the buffer for the send.
 */
	else
		{
		printf("\nSending files to %d modules.\n",num_mods);
		while(num_mods)
			{
			for(i=0;i<MAX_PC_BOARDS;i++)
				{
				if((total_bytes & 0xff) == 0)
					printf("\r%ld bytes sent.  %d active modules",total_bytes,num_mods);
				if(fp[i] == 0)
					continue;
				RB.ah = DECTALK_ID;
				RB.al = GET_STATUS;
				RW.si = i;
				_int86(0x2f, &tsr_regs, &tsr_regs);
				if(RW.ax == TSR_FAILURE)
					{
					printf("\nFailure in getting status from module %d",i);
					exit(1);
					}
				else if((RW.ax == TSR_SUCCESS) && (RW.dx & STAT_rr_char))
					{
					if(act_count[i] == 0)
						{
						next_char[i] = 0;
						act_count[i]=fread(&read_buff[i][0],1,256,fp[i]);
						if(act_count[i] == 0)
							{
							fclose(fp[i]);
							fp[i] = 0;
							act_mods -= 1;
							if(act_mods == 0)
								{
								printf("\nComplete");
								exit(0);
								}
							continue;
							}
						}
					RB.ah = DECTALK_ID;
					RB.al = SEND_CHAR;
					RB.bl = read_buff[i][next_char[i]];
					RW.si = i;
					_int86(0x2f, &tsr_regs, &tsr_regs);
					if(RW.ax == TSR_FAILURE)
						{
						printf("\nFailure in send char to module %d",i);
						exit(1);
						}
					else if(RW.ax == TSR_SUCCESS)
						{
						act_count[i] -= 1;
						next_char[i] += 1;
						total_bytes += 1;
						}
					}
				}
			}
		}
}


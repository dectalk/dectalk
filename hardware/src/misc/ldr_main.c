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
 *    File Name:         ldr_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-pc file load utility ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "ldr.h"
#include "ldrp.h"

unsigned int verbose;			/* print loads of info */
int wants_reset;					/* ask for module reset */
int load_module;					/* selects module to load */

unsigned int message_language = US_MESSAGE_LANGUAGE;	/* init message language to US */

int main(int argc,char *argv[])
/*int argc;*/
/*char *argv[];*/
{
	union _REGS  tsr_regs;
	struct dectalk_control _far *dts;
	unsigned int tsrsize;
	unsigned int _far *fp;

/*
 *  make sure that the tsr is installed before we attemp to load ...
 */
	RB.ah = DECTALK_ID;
	RB.al = INSTALL_CHECK;
	RW.si = 0;
	_int86(0x2f, &tsr_regs, &tsr_regs);
	if (RB.al != INSTALLED)
		{
		printf("DECtalk TSR not installed.  Install and try again.\n");
     /*	usage();*/
		exit(1);
   	}
	
	printf("\nDECtalk PC file loader.  Please wait.");
	parse_switch(argc,argv);

	
/*
 *  if a module reset is asked for ...
 */
	if(wants_reset)
		{
		printf("\nResetting module.  Please wait.");
		RB.ah = DECTALK_ID;
		RB.al = DECTALK_RESET;
		RW.si = load_module;
		_int86(0x2f, &tsr_regs, &tsr_regs);
		if (RW.ax == TSR_FAILURE)
			{
			printf("DECtalk module fails to reset.  No load possible.");
	     	exit(1);
	   	}
		}
	load_scan(argc,argv);
	printf("\n");
   exit(0);
}

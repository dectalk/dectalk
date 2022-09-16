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
 *    File Name:	tsr_main.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-pc communication tsr ... This routine installs a simple tsr
 *  to send/receive data via the specified com port.
 *
 ***********************************************************************
 *    Revision History:
 * 02oct95	...tek		changed around the addressing to
 *				support dtpc-2; rooted out the
 *				eoi and vector stuff in DTC
 * 16feb96	...tek		merge dtex
 * 19feb96  ...cjl (tek) add DTC.message_language = US_MESSAGE_LANGUAGE
 * 30apr96  ...ksb      Added code to support MAX_PC_BOARDS
 * 07may96	...tek		fix initialization of dectalk_control to use 
 *								MAX_PC_BOARDS instead of MAX_MODULES.
 * 07may96  ...cjl		touched with latest 4-8 board fix.
 */


#include "tsr.h"
#include "tsrp.h"

/*#define DEBUG*/

struct dectalk_control	control_block[MAX_PC_BOARDS];
struct dectalk_control	*dtc[MAX_PC_BOARDS];
int			module_index;
int			num_modules;
int	i; /*eab global argv count*/
unsigned int verbose;			/* print loads of info */

#ifndef DTPC2
unsigned int bases[] = { 0x240, 0x250, 0x340, 0x350 };
#endif /*DTPC2*/

extern int base_found;
extern int dtbase[];

char __huge *tsrstack;
char __huge *dosstack;
char __huge *tsrbottom;
char __huge *win_buff;

int	win_buff_size;
unsigned int foreground_psp;
unsigned int foreground_dta_off;
unsigned int foreground_dta_seg;
unsigned short int tsrsize;
int	in_windows;
union _REGS  tsr_regs;

unsigned int message_language;		/* init message language to US */
									/* (tek) doesn't look very initialized */
									/* to me... (happens later on..) */
#define	PHYS_ADDR(x)	(unsigned long)(((unsigned long)FP_SEG(x) <<4)+FP_OFF(x))

main(argc,argv)
int argc;
char *argv[];
{
	struct dectalk_control __far *dts;
	unsigned int __far *fp;
	int ptrap_flag;
	int ctrap_flag;
	int num_mod;
	
	
	
/*
 *  use in line assembler to get end of my runtime stack ...
 */
	
	_asm	mov word ptr tsrstack[0],sp
	_asm	mov word ptr tsrstack[2],ss

	FP_SEG(tsrbottom) = _psp;
	FP_OFF(tsrbottom) = 0;

/*
 * flags init ...
 */

	in_windows = false;
	win_buff_size = 0;
	verbose = false;
	num_modules = 0;
 	base_found = 0;
	ctrap_flag=0;
	ptrap_flag=0; 
	message_language = US_MESSAGE_LANGUAGE;	/* init message language to US */
/*
 *  init the global control and switch area ...
 */

#ifdef DEBUG
	printf("\nTSR_MAIN-DEBUG-Entering: Init global control and switch area.");
#endif
	
	for(module_index=0;module_index < MAX_PC_BOARDS; module_index++)
		{

#ifdef DEBUG
	printf("\nTSR_MAIN-DEBUG-Top: Init global control and switch area.");
	printf("\nTSR_MAIN-DEBUG-Before module_index=%d\n",module_index);
#endif
	
		dtbase[module_index]=0;/*eab added for mult explicit load*/
		dtc[module_index] = &control_block[module_index];

		DTC.base = 0;
		DTC.status = 0;
		DTC.config = 0;
		DTC.error_status = 0;
		DTC.port = 3+module_index;
		DTC.lpt = 2+module_index;
		DTC.in_dos = true;
		DTC.tsr_busy = false;
		DTC.trap = TRAP_NONE;
		DTC.dma_count = DTC.cmd_count = 0;
		DTC.chars_out = DTC.chars_in = 0;
		DTC.ints_out = DTC.ints_in = 0;
		DTC.id = ID_boot;

#ifdef DEBUG
	printf("\nTSR_MAIN-DEBUG-Bottom: Init global control and switch area.");
	printf("\nTSR_MAIN-DEBUG-After module_index=%d\n",module_index);
#endif
	
		}
/*	printf("DECtalk PC, please wait");*/
	module_index = 0;
 /*
 *  check to see if the tsr is already installed, if so then just print
 *  the switches and exit ...
 */
	parse_switch(argc,argv);
#ifdef DEBUG
	printf("\nTSR_MAIN-DEBUG switches parsed.. ");
#endif /*debug*/

		RB.ah = DECTALK_ID;
		RB.al = INSTALL_CHECK;
		RW.si = INSTALL_CHECK;
		_int86(0x2f, &tsr_regs, &tsr_regs);
		if (RB.al == INSTALLED)
			{
			printf("\nDECtalk tsr already installed. ");
     		usage();
  			}



/*
 *  as soon as we find a base, install the trap catchers ...
 */
	num_mod=find_base();
#ifdef DEBUG
	printf("\nTSR_MAIN-DEBUG %d modules found by find_base() ",num_mod);
#endif /*debug*/
	if(num_mod == 0)
		{
		exit(1);
		}

	old_int2f = _dos_getvect((unsigned)0x2f );
	_dos_setvect((unsigned)0x2f, multi_plex_int);
	old_int1c = _dos_getvect((unsigned)0x1c);
	_dos_setvect((unsigned)0x1c, dectalk_timer); 
#ifdef DEBUG
	printf("\nTSR_MAIN-DEBUG vectors set. ");
#endif /*debug*/

	do 
		{
		if(DTC.trap & TRAP_SERIAL)
			{
			old_int14 = _dos_getvect((unsigned)0x14);
			_dos_setvect((unsigned)0x14, dectalk_com);
			ctrap_flag=DTC.port;
			break;
			}
		module_index++;
		}while(module_index <=num_mod);
	
	module_index = 0;
	do
		{
		if(DTC.trap & TRAP_PARALLEL)
			{
			old_int17 = _dos_getvect((unsigned)0x17);
			_dos_setvect((unsigned)0x17, dectalk_lpt);
			ptrap_flag=DTC.lpt;
			break;
			}
		module_index++;
		}while(module_index <=num_mod);
	module_index=0;
	if(ctrap_flag || (DTC.trap & TRAP_SERIAL)) 
		printf("\nSerial port trapping enabled on COM%d.",ctrap_flag+1);
	if(ctrap_flag || (DTC.trap & TRAP_PARALLEL)) 
		printf("\nParallel port trapping enabled on LPT%d.",ptrap_flag+1);


	
/*
 *  go tsr ...
 */

	if(win_buff)
		tsrsize = PHYS_ADDR(win_buff)-PHYS_ADDR(tsrbottom)+win_buff_size+16;
	else
		tsrsize = PHYS_ADDR(tsrstack)-PHYS_ADDR(tsrbottom)+16;
	tsrsize = (tsrsize>>4)+1;
	if(verbose)
		printf("\nDECtalk PC keeping %d bytes.\n",tsrsize*16);

	verbose = false;
	FP_SEG(fp) = _psp;
	FP_OFF(fp) = PSP_ENV_ADDR;

	_dos_freemem(*fp);
	_dos_keep(0, tsrsize);
}

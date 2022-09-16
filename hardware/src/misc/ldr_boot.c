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
 *    File Name:	ldr_boot.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC I/O support ... this module contains all the interface
 *  code that knows how to talk to a DECtalk module in boot mode before
 *  the kernel is loaded ...
 *
 ***********************************************************************
 *    Revision History:
 * 20-JAN-1995 Carl Leeber, Removed READY_kernel test as irrelevent.
 * 28-JUL-1995 Carl Leeber, Change descrete time out value to TIMEOUT.
 * 01mar96	...tek		added support for checking dtpc1/dtpc2 
 *				correct software..
 * 30-JUly-96  GL           add change to fix kernel.sys loading problem.
 */

#include	"ldr.h"			/* all other includes are chained out of here */
#include	"ldrp.h"

#define TIMEOUT	10

void (__interrupt __far *old_int1c)();		/* timer thread */
volatile unsigned int ticks;
unsigned int dt_base;


void kernel_load(FILE *fexe,char *read_buff,struct dos_reloc *fixups)
/*FILE *fexe;*/
/*char *read_buff;*/
/*struct dos_reloc *fixups;*/
{

	union _REGS  tsr_regs;
	int	i,read_size;
	unsigned int total_paras,seg_fix;
	long	image_left,image_done,fix;
	struct dos_exe_header header;
	struct dectalk_control _far *dtp;

	RB.ah = DECTALK_ID;
	RB.al = GET_DTC;
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);
	FP_OFF(dtp) = RW.bx;
	FP_SEG(dtp) = RW.dx;
	dt_base = (*dtp).base;

	old_int1c = _dos_getvect((unsigned)0x1c);
	_dos_setvect(0x1c, ldr_timer);

/*
 *  Now, open up the .exe file and extract all the cgroup data and
 *  write that out to the .abs file ...
 */

	fread(&header,sizeof(struct dos_exe_header),1,fexe);
	if (header.id != 0x5a4d)
		error_load("Invalid kernel file format");
	if(header.relen > MAX_FIXUPS)
		error_load("too many fixups");

	fseek(fexe,(long)header.reloc,SEEK_SET);
	fread(fixups,sizeof(struct dos_reloc)*header.relen,1,fexe);

/*
 * load in and fix up the image ...
 */

	fseek(fexe,(long)(header.hsize*16),SEEK_SET);
	image_left = ((long)(header.pages-1)*512)+(long)header.rem-((long)header.hsize*16);
	total_paras = (unsigned int)(image_left>>4)+header.hmin+16; 
	image_done = 0;

	header.csval += 0x40;
	header.ssval += 0x40;

	if(verbose)
		{
		printf("\nLoading kernel of %ld bytes (%d relocs).",
			image_left,header.relen);
		printf("\n      cs:ip == %04x:%04x   ss:sp == %04x:%04x",
			header.csval,header.ipval,header.ssval,header.spval);
		}

   if(image_left>READ_BUFF_SIZE)
		error_load("Image too large for buffer");
	read_size = (int)image_left;
	fread(read_buff,read_size,1,fexe);
	for(i=0;i<header.relen;i++)
		{
	   fix = ((long)fixups[i].segment<<4)+(long)fixups[i].offset;
		(*(unsigned int *)&read_buff[fix]) += 0x40;
		}

/*
 *  load up the image ...
 */

	if(verbose)
		printf("\nStarting load of module at base: %x.",dt_base);
	if(wait_init(TIMEOUT,false) == FAILURE)
		error_load("module does not return status");

	put_command(CMD_dma);
	if(wait_bit(TIMEOUT,STAT_dma_ready) == FAILURE)
		error_load("can not send load command.");
	outp((dt_base+4),DMA_control);
	outp((dt_base+4),DT_LOAD_MEM);
	wait_ticks(TIMEOUT);
	if(wait_bit(TIMEOUT,STAT_dma_ready) == FAILURE)
		error_load("can not send address/count.");
	outp((dt_base+4),0x00);
	outp((dt_base+4),0x04);
	outp((dt_base+4),0x00);
	outp((dt_base+4),0x00);
	outp((dt_base+4),read_size&0xff);
	outp((dt_base+4),(read_size>>8)&0xff);
	wait_ticks(TIMEOUT);
	if(wait_bit(TIMEOUT,STAT_dma_ready) == FAILURE)
		error_load("can not load image.");
	while(read_size--)
        {
            outp((dt_base+4),*read_buff++);
            /* add this line, suggested by TEK, GL 7/30/96 */
            inp(dt_base);
        }
        if(verbose)
		printf("\nKernel loaded.");
	put_command(CMD_reset);
	if(wait_pattern(TIMEOUT,MODE_status) == FAILURE)
		error_load("waiting for status");

/*
 *  start the kernel ...
 */

	put_command(CMD_dma+1);
	if(wait_bit(TIMEOUT,STAT_dma_ready) == FAILURE)
		error_load("can not send start command.");
	outp((dt_base+4),DMA_control);
	outp((dt_base+4),DT_START_TASK);
	wait_ticks(TIMEOUT);
	if(wait_bit(TIMEOUT,STAT_dma_ready) == FAILURE)
		error_load("can not send start address.");
	outp((dt_base+4),header.ipval&0xff);
	outp((dt_base+4),(header.ipval>>8)&0xff);
	outp((dt_base+4),header.csval&0xff);
	outp((dt_base+4),(header.csval>>8)&0xff);
	if(verbose)
		printf("Started.");

/*
 *  Wait for the kernel to start ...
 */
	/* quick check for wrong software.. */
	if(wait_pattern(2,(MODE_ready)) == FAILURE)
		{
		if ((get_status()& 0xf000) == CMD_error)
			{
			/* severe error. */
			if ((get_status()&0xff) == ERROR_dtpc2_expected)
				{
				printf("\nSoftware expects DTC07-b, module is DTC07-a!\n");
				error_load("Loaded software is incompatible with the target module.");
				}
			if ((get_status()&0xff) == ERROR_dtpc1_expected)
				{
				printf("\nSoftware expects DTC07-a, module is DTC07-b!\n");
				error_load("Loaded software is incompatible with the target module.");
				}
			/* fall through */			
			}
		error_load("kernel fails to start.");
		}                                     
		
	if(wait_pattern((TIMEOUT-2),(MODE_ready)) == FAILURE)
		error_load("kernel fails to start.");			
	if(verbose)
		printf("Running.");

/*
 *  Send over the sync command ...
 */

	put_command(CMD_sync);
	if(wait_bit(TIMEOUT,STAT_cmd_ready) == FAILURE)
		error_load("No command ready on sync.");
	if(verbose)
		printf("Synchronized.");

/*
 *  Now tell the driver the kernel is ready ... note that the driver
 *  will reissue the sync command and get valid module status ...
 */

	RB.ah = DECTALK_ID;
	RB.al = KERNEL_SYNC;
	RW.si = load_module;

	_int86(0x2f, &tsr_regs, &tsr_regs);
	if(RW.ax == TSR_FAILURE)
		error_load("Driver will not sync");
	_dos_setvect(0x1c, old_int1c);

}

/*****************************************************
 *  non-interrupt driven I/O routines ...
 *****************************************************/

unsigned int get_status()
{
	return((inp(dt_base+1)<<8) + inp(dt_base+0));
} 

/*
 *  write a command word to the module ... clear the flag bits in the
 *  status word to allow them to be updated by the isr ...
 */

void put_command(cmd)
unsigned int cmd;
{
	outp((dt_base+0),cmd&0xff);
	outp((dt_base+1),((cmd&0xff00)>>8));
}

int wait_bit(secs,bit)
int	secs;
unsigned int bit;
{
	ticks = secs*DOS_TPS;
	while(ticks)
		if(get_status() & bit)
			return(SUCCESS);
	return(FAILURE);
}

int wait_pattern(secs,pattern)
int	secs;
unsigned int pattern;
{
	ticks = secs*DOS_TPS;
	while(ticks)
		if(get_status() == pattern)
			return(SUCCESS);
	return(FAILURE);
}		

/***********************************************
 * watch dog for commands and status ...
 ***********************************************/

void interrupt _far ldr_timer(int_frame)
union	INT_REGS	int_frame;
{

	if(ticks)
		ticks -= 1;
	_chain_intr(old_int1c);
}

/*
 *  say there was a load error and quit ...
 */

error_load(s)
char *s;
{
	printf("\nError loading kernel: %s.",s);
	_dos_setvect(0x1c, old_int1c);
	exit(1);
}

/*
 *  wait for module it enter init mode from boot sequence ...  retry is
 *  the number of times to try to init the module, and reset specifys
 *  whether or not to attempt a reset on entry ...
 */

wait_init(retry,reset)
int	retry;
int	reset;
{
	if(retry == 0)
		return(FAILURE);
	if(reset)
		{
		if(verbose)
			printf("\nModule requires reset.  Please wait.");
		put_command(MODULE_reset);
		wait_pattern(TIMEOUT,MODULE_init);
		}

	put_command(CMD_null);
	if(get_status() == MODULE_self_test)
		if(wait_pattern(TIMEOUT,MODULE_init) == FAILURE)
			return(wait_init(retry-1,true));

	if(get_status() == MODULE_init)
		{
		put_command(CMD_reset);
		if(wait_pattern(2,MODE_status) == FAILURE)
			return(wait_init(retry-1,true));
		}
	put_command(CMD_sync);
	if(wait_pattern(2,MODE_error) == FAILURE)
		return(wait_init(retry-1,true));
	put_command(CMD_reset);
	if(wait_pattern(2,MODE_status) == FAILURE)
		return(wait_init(retry-1,true));
	if(verbose)
		printf("\nModule at %x (%x) ready to be loaded.",dt_base,get_status());
	return(SUCCESS);
}

wait_ticks(tocks)
int	tocks;
{
	ticks = tocks;
	while(ticks);
}

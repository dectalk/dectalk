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
 *    File Name:	pcboot.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  pc DECtalk boot and control code ...  once we get to 'c' just
 *  post successfull status in the port control register and wait
 *
 ***********************************************************************
 *    Revision History:
 * 06 jul 95	...tek		initial for dtpc-II
 * 13 jul 95	...tek		added more tests.
 * 17 jul 95	...tek		added load of default DSP code.. 
 */

#include	"defs.h"
#include	"pcdt.h"
#include	"pcport.h"
#include	"186.h"
#include "hardw.h"

/* we need these for memory test etc.. */
#define FP_SEG(fp) (*((unsigned _far *)&(fp)+1))
#define FP_OFF(fp) (*((unsigned _far *)&(fp)))



#define MEM_HI_LIMIT_SEG	(0xf000) /* don't overwrite the stack.. */
#define MEM_TEST_CHUNK	(0x2000)
#define DSP_RAM_SIZE	(8*1024)

ROM_STRING id_string[] = "Copyright 1991-1995, Digital Equipment Corporation";

unsigned char dma_buff[128];
unsigned int dma_low;
unsigned int dma_high;

/*
 *  global data storage for isa com task ...
 */

unsigned int isa_status;			/* com status */
unsigned int isa_cmd;				/* last read command word */
#ifdef LOAD_DEFAULT_DSP
extern ROM_STRING spc_code[];
#define SPC_CODE_LEN (4*1024) /* but this is words, not bytes.. */
#endif

#ifdef DTPC2
void write_dsp_ram(short,short);
short read_dsp_ram(short);
#endif /* DTPC2 */

pcdt_boot()
{

	int	i,j;		/* memory test requires these to be signed.. */
	union	dma_control	dcp;
	unsigned int _far *p;

	/* say we're here.. */
	isa_status = MODE_status|STAT_self_test|POST_in_c;
	put_status();

/*
 * this is some extended test code that is new for DTPC-II; most of this
 * works fine on DTPC-I too.
 */

/*
 * memory addressing test..
 */
	isa_status = MODE_status|STAT_self_test|POST_address_test1;
	put_status();

	/* write each word with (seg+off).. */
	for (i = 0; i < MEM_HI_LIMIT_SEG; i += (MEM_TEST_CHUNK>>4))
		{
		FP_SEG(p) = ((unsigned int)i);
		for (j = 0; j < MEM_TEST_CHUNK; j += 2)
			{
			/* set up the address... */
			FP_OFF(p) = (unsigned int)j;
			/* write the pattern.. */
			*p = (((unsigned int)i)>>2)*3 + (unsigned int)j;

			}

		}

	/* read it backward.. */
	/* put the segment back.. */
	for (i -= (MEM_TEST_CHUNK>>4); i >= 0; i -= (MEM_TEST_CHUNK>>4))
		{
		FP_SEG(p) = (unsigned int)i;
		for (j = MEM_TEST_CHUNK-2; j >= 0; j -= 2)
			{
			FP_OFF(p) = (unsigned int)j;
			if (*p != (((unsigned int)i)>>2)*3 + (unsigned int)j)
				while(1)
					{            
					port_out(ISA_DO,j); /* seg value.. */
					port_out(ISA_STATUS, MODE_error|POST_address_test1);
					}
			}
	    	}
#ifdef DTPC2 /* only for loadable dsp ram.. */
	/* test the dsp ram.. */
	/* first, addr->data.. */
	isa_status = MODE_status|STAT_self_test|POST_dsp_ram_addr;
	put_status();                          
	/* remember; A13 must always be 1... */
	for (i=0;i<DSP_RAM_SIZE;i++)
		write_dsp_ram(i|BIT13,i);
	for (i=0;i<DSP_RAM_SIZE;i++)
		{
		if (read_dsp_ram(i|BIT13) != i)
			{
			while(1)
				{                                                   
				port_out(ISA_DO,i);
				port_out(ISA_STATUS, MODE_error|POST_dsp_ram_addr);
				}
		        }
		}
	
	/* now do a quick 1/0 test..  */
	isa_status = MODE_status|STAT_self_test|POST_dsp_ram_data1;
	put_status();                          
	for (i=0;i<DSP_RAM_SIZE;i++)
		{
		write_dsp_ram(i|BIT13,0xa5a5);
		}
	for (i=0;i<DSP_RAM_SIZE;i++)
		{
		if ((j=read_dsp_ram(i|BIT13)) != 0xa5a5)
			{
			while(1)
				{                                                   
				port_out(ISA_DO,j);
				port_out(ISA_STATUS, MODE_error|POST_dsp_ram_data1);
				}
		        }                                         
		/* write the new pattern.. */
		write_dsp_ram(i|BIT13,0x5a5a);
		}                             
	/* now go through backward, leaving the ram zeroed.. */
	isa_status = MODE_status|STAT_self_test|POST_dsp_ram_data2;
	put_status();                          
	for (i=DSP_RAM_SIZE-1;i>=0;i--)
		{
		if ((j=read_dsp_ram(i|BIT13)) != 0x5a5a)
			{
			while(1)
				{                                                   
				port_out(ISA_DO,j);
				port_out(ISA_STATUS, MODE_error|POST_dsp_ram_data2);
				}
		        }                                         
		/* write the new pattern.. */
		write_dsp_ram(i|BIT13,0);
		}

	
#ifdef LOAD_DEFAULT_DSP
/*
 * at this point, load the default DSP code into bank 0 and leave the
 * SRAM Adress register pointing to bank 0.
 */
	isa_status = MODE_status|STAT_self_test|POST_load_dsp;
	put_status();
	for (i=0;i<SPC_CODE_LEN;i++)
		{
		unsigned short int k;
		k = spc_code[2*i] | (spc_code[(2*i)+1]<<8);
		write_dsp_ram(i|BIT13,k);
		}
	/* dummy read to zero the pointer.. */
	read_dsp_ram(0|BIT13);
#endif /* LOAD_DEFAULT_DSP*/
#endif /* DTPC2 */


/*
 *  setup the buffer address for dma load commands ...
 */

	_asm	mov	ax,ds
	_asm	mov	i,ax
	
	dma_low = (i << 4) + (unsigned int)&dma_buff;
	dma_high = ((i >> 12) & 0xf);

	isa_cmd = port_in(ISA_COMMAND);
	isa_status = MODULE_init;

	dcp.null = &dma_buff[0];

/*
 *  get the new command and do it ...
 */

	while(true)
		{
		put_status();
		get_cmd(ANY_CHANGE);
		switch (isa_cmd & CMD_mask)	{

				case	CMD_null		:
					break;

				case 	CMD_test		:

					switch	(isa_cmd & TEST_mask)
						{
						case	TEST_null		:
							break;

						case	TEST_isa_int	:
							port_in(ISA_INT);
							break;

						case	TEST_echo		:
							put_data(get_data());
							break;

						case	TEST_seg		:

							*(((unsigned int *)&p)+1) = get_data();
							break;

						case	TEST_off		:

							*(unsigned int *)&p = get_data();
							break;

						case	TEST_peek	:
							put_data(*p);
							break;

						case	TEST_poke	:
							*p = get_data();
							break;

						};
					isa_status = MODE_test+(isa_cmd & TEST_sub_code);
					break;

				case	CMD_dma		:
					
					dma_get(DMA_COMMAND_SIZE);
					switch(DDC.command)	{

						case	DMA_control	:

							switch(DDC.data)
								{

								case	DT_START_TASK	:

									dma_get(DMA_START_TASK_SIZE);
									(*DST.task)(1);
									break;

								case	DT_LOAD_MEM		:
						
									dma_get(DMA_MEM_TRANSFER_SIZE);
									port_out(R186_DMA1_DPL,DMT.low_addr);
									port_out(R186_DMA1_DPH,DMT.high_addr);
									port_out(R186_DMA1_SPL,DMA_BUFF);
									port_out(R186_DMA1_SPH,0);
									port_out(R186_DMA1_TC,DMT.count);
									port_out(R186_DMA1_CW, DMEM|SIO|SSYN|TC|DINC|CHG|START);
									dma_wait();
									break;

								case	DT_READ_MEM		:
						
									dma_get(DMA_MEM_TRANSFER_SIZE);
									port_out(R186_DMA1_DPL,DMA_BUFF);
									port_out(R186_DMA1_DPH,0);
									port_out(R186_DMA1_SPL,DMT.low_addr);
									port_out(R186_DMA1_SPH,DMT.high_addr);
									port_out(R186_DMA1_TC,DMT.count);
									port_out(R186_DMA1_CW, SMEM|DIO|DSYN|TC|SINC|CHG|START);
									dma_wait();
									break;
								};
							break;
						};
					break;
	
				case	CMD_control		:

					switch(isa_cmd & CTRL_mask)
						{
						case	CTRL_int_enable	:

							isa_status = (isa_status | STAT_int);
							break;
						};
					break;

				case	CMD_id			:

					put_data(ID_boot);
					break;

				case	CMD_reset		:

					isa_status = MODE_status;
					put_data(0);
					break;

				default	:

					isa_status = MODE_error;
					break;						
				};
		}
}	  

/****************************************
 * dectalk-pc register level i/o routines 
 ****************************************/ 

get_data()
{
	return(port_in(ISA_DI));
}

get_cmd(mode)
int	mode;
{
	unsigned int cmd;

	while(true)
		{
		cmd = port_in(ISA_COMMAND);
		if((mode == ANY_CHANGE) && (cmd != isa_cmd) ||
			  (mode == LOW_CHANGE) && ((cmd & 0xff) != (isa_cmd & 0xff)) ||
			    (mode == HIGH_CHANGE) && ((cmd & 0xff00) != (isa_cmd & 0xff00)))
			{	
			isa_cmd = port_in(ISA_COMMAND);
			if(isa_cmd == MODULE_reset)
				pcdt_init();
			break;
			}
		}
}

put_status()
{
	port_out(ISA_STATUS,isa_status);
	if(isa_status & STAT_int)
		port_in(ISA_INT);
}

put_data(data)
{
	port_out(ISA_DO,data);
}

dma_get(count)
int	count;
{
	port_out(R186_DMA1_DPL,dma_low);
	port_out(R186_DMA1_DPH,dma_high);
	port_out(R186_DMA1_SPL,DMA_BUFF);
	port_out(R186_DMA1_SPH,0);
	port_out(R186_DMA1_TC,count);
	port_out(R186_DMA1_CW, DMEM|SIO|SSYN|TC|DINC|CHG|START);
	dma_wait();
}

dma_wait()
{
	isa_status |= STAT_dma_ready;
	put_status();
	while(port_in(R186_DMA1_TC) != 0)
		{
		isa_cmd = port_in(ISA_COMMAND);
		if(isa_cmd == MODULE_reset)
			pcdt_init();
		}
	port_out(R186_DMA1_CW,CHG);
	isa_status = isa_status & (~STAT_dma_ready);
}

#ifdef DTPC2
void write_dsp_ram(short addr, short data)
{
	port_out(SPCIO,data);
	port_out(SRAM_ADDR,addr);
	port_out(GPIO2,WRITE_SRAM);
	port_out(GPIO2,0);

}
short read_dsp_ram(short addr)
{
	short i;
	port_out(SRAM_ADDR,addr);
	port_out(GPIO2,READ_SRAM);
	port_out(GPIO2,0);
	i=port_in(SPCIO);
	return(i);

}

#ifdef LOAD_DEFAULT_DSP
ROM_STRING spc_code[] =
#include "spc.h"	/* this defines the unsigned char array spc_code[]*/
#endif


#endif /* DTPC2 */


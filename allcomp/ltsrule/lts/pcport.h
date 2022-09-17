/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	pcport.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  port inerface defs ... used by boot, pcdt com, and loader ...
 *
 ***********************************************************************
 *    Revision History:
 * 001	11/06/1995	tek		add FLUSH_type_char subcode.
 * 002	12/13/1995	tek		merge dtex 
 * 003	03/01/1996	tek		added error codes for wrong-software-for-module
 * 004	04/21/1997	GL      BATS#360  remove spaces before "#define" or "#if" 
 * 005	09/25/1997	GL      change the dictionary pointer structure to support
 *							UK_english and language expansion and add "lang" item for
 *							PKT_set_dic and dma_set_dic data structure.
 * 006	06/22/1998	mfg     Added LANG_latin_american support
 * 007	10/05/1998  ETT     Added Linux code.
 * 008	06/12/2000	nal		warning removal (fuzzy #ifdefs)
 * 009	01/19/2001	cab		Fixed copyright info
 */

#ifndef PCPORTH
#define PCPORTH 1

#define MODULE_init                             0x0dec                  /* module in boot code */                                       
#define MODULE_self_test                0x8800                  /* module in self-test */
#define MODULE_reset                    0xffff                  /* reinit the whole module */

#define MODE_mask                       0xf000                          /* mode bits in high nibble */
#define MODE_null                       0x0000
#define MODE_test                       0x2000                          /* in testing mode */
#define MODE_status                     0x8000
#define         STAT_int                                0x0001                  /* running in interrupt mode */
#define         STAT_tr_char            0x0002                  /* character data to transmit */
#define         STAT_rr_char            0x0004                  /* ready to receive char data */
#define         STAT_cmd_ready          0x0008                  /* ready to accept commands */
#define         STAT_dma_ready          0x0010                  /* dma command ready */
#define         STAT_digitized          0x0020                  /* spc in digitized mode */
#define         STAT_new_index          0x0040                  /* new last index ready */
#define         STAT_new_status 0x0080                  /* new status posted */
#define         STAT_dma_state          0x0100                  /* dma state toggle */
#define         STAT_index_valid        0x0200                  /* indexs are valid */
#define         STAT_flushing           0x0400                  /* flush in progress */
#define         STAT_self_test          0x0800                  /* module in self test */

/* ...tek 7/13 these are new defs for DTPC-II self tests.. */
#define			POST_mask		0x00ff 
#define			POST_init		0x0000 /* just starting.. */
#define			POST_timer_init	0x0001 /* refresh timer started */
#define			POST_clrmem		0x0002	/* clearing memory */
#define			POST_ram_patt		0x0003	/* RAM pattern testing; pattern in data reg */
#define			POST_call_c		0x0004	/* go to high-level code */
#define			POST_in_c		0x0005	/* arrived in high-level code */
#define			POST_address_test1	0x0006	/* simple address test */
#define			POST_byte		0x0007	/* simple byte addressing test */
#define			POST_random		0x0008	/* random data test */
#define			POST_dsp_ram_addr	0x0009	/* DSP RAM addressing */
#define			POST_dsp_ram_data1	0x000A	/* DSP RAM data test */
#define			POST_dsp_ram_data2	0x000B	/* DSP RAM data/address test */
#define			POST_dsp_dma		0x000C	/* DSP DMA channel test */
#define    	    POST_load_dsp		0x000D /* loading the default DSP code.. */

	/*xxxx eab changed to free up bit for flush done*/

#ifdef MSDOS			// NAL warning removal
#define MODE_ready          0x1000                          /* module ready for next phase */
#else
#define MODE_ready          0xc000                    /*       module ready for next phase */
#define READY_boot          0x0000                                                  
#endif
#define READY_kernel        0x0001                          
#define FLUSH_DONE          0x2000                  /*xxx needed to interlock module*/
#define MODE_error          0xf000

#define CMD_mask                                        0xf000                  /* mask for command nibble */
#define CMD_null                                        0x0000                  /* post status */
#define CMD_control                             0x1000                  /* hard control command */
#define         CTRL_mask                               0x0F00          /*   mask off control nibble */
#define         CTRL_data                               0x00FF          /*   madk to get data byte */
#define         CTRL_null                               0x0000          /*   null control */
#define         CTRL_vol_up                             0x0100          /*   increase volume */
#define         CTRL_vol_down                   0x0200          /*   decrease volume */
#define         CTRL_vol_set                    0x0300          /*   set volume */
#define         CTRL_pause                              0x0400          /*   pause spc */
#define         CTRL_resume                             0x0500          /*   resume spc clock */
#define         CTRL_resume_spc         0x0001  /*   resume spc soft pause */
#define         CLR_DONE                                        0x0002                  /* clear flush done bit */
#define         CTRL_flush                              0x0600          /*   flush all buffers */
#define		FLUSH_type_char			0x0001	/* like DMA_sync_char, but better. */
#define         CTRL_int_enable         0x0700          /*   enable status change ints */
#define         CTRL_buff_free                  0x0800          /*   buffer remain count */
#define         CTRL_buff_used                  0x0900          /*   buffer in use */
#define         CTRL_speech                             0x0a00          /*   immediate speech change */
#define                 CTRL_SP_voice                   0x0001  /*      voice change */
#define                 CTRL_SP_rate                    0x0002  /*      rate change */
#define                 CTRL_SP_comma                   0x0003  /*      comma pause change */
#define                 CTRL_SP_period                  0x0004  /*      period pause change */
#define                 CTRL_SP_rate_delta      0x0005  /*                delta rate change */
#define                 CTRL_SP_get_param               0x0006  /*      return the desired parameter */
#define         CTRL_last_index         0x0b00          /*   get last index spoken */
#define         CTRL_io_priority                0x0c00          /*   change i/o priority */
#define         CTRL_free_mem                   0x0d00          /*   get free paragraphs on module */
#define         CTRL_get_lang                   0x0e00          /*   return bit mask of loaded languages */

#define CMD_test                                        0x2000                  /* self-test request */
#define         TEST_mask                               0x0F00          /* isolate test field */
#define         TEST_null                               0x0000          /* no test requested */
#define         TEST_isa_int                    0x0100          /* assert isa irq */
#define         TEST_echo                               0x0200          /* make data in == data out */
#define         TEST_seg                                        0x0300          /* set peek/poke segment */
#define         TEST_off                                        0x0400          /* set peek/poke offset */
#define         TEST_peek                               0x0500          /* data out == *peek */
#define         TEST_poke                               0x0600          /* *peek == data in */
#define         TEST_sub_code                   0x00FF          /* user defined test sub codes */
#define CMD_id                                  0x3000                  /* return software id */
#define         ID_null                                 0x0000          /* null id */
#define         ID_kernel                               0x0100          /* kernel code executing */
#define         ID_boot                                 0x0200          /* boot code executing */
#define CMD_dma                                 0x4000                  /* force a dma start */
#define CMD_reset                               0x5000                  /* reset module status */
#define CMD_sync                                        0x6000                  /* kernel sync command */
#define CMD_char_in                             0x7000                  /* single character send */
#define CMD_char_out                    0x8000                  /* single character get */
#define         CHAR_count_1                    0x0100          /*    one char in cmd_low */
#define         CHAR_count_2                    0x0200          /*              the second in data_low */
#define         CHAR_count_3                    0x0300          /*              the third in data_high */
#define CMD_spc_mode                    0x9000                  /* change spc mode */
#define         CMD_spc_to_text         0x0100          /*   set to text mode */
#define         CMD_spc_to_digit                0x0200          /*   set to digital mode */
#define         CMD_spc_rate                    0x0400          /*   change spc data rate */
#ifdef DTEX
#define	CMD_console				0xA000	/* drop into console mode. */
#endif /*DTEX*/
#define CMD_error                               0xf000                  /* severe error */    
#define		ERROR_dtpc2_expected		0x0010			/* expected a DTPC2!*/
#define 	ERROR_dtpc1_expected		0x0011			/*    "     " dtpc1 */

/*
 *  command and response packet defs ...
 */

#define PKT_mem_load                    0x0001                  /* load memory packet */
struct  mem_load_packet {

		unsigned char far               *addr;
		int                                             size;
		unsigned char                   data[128];
};


#define PKT_start_task                  0x0002                  /* start program execution */
struct  start_task_packet               {

			int                                     (far *task)();
};

#define PKT_mem_alloc                   0x0003                  /* allocate memory */
#define PKT_mem_reserved                0x0003
struct  mem_alloc_packet                {
			unsigned int                    paras;
};
struct  mem_reserved_packet     {
			unsigned char far       *addr;
};


#define PKT_set_dic                             0x0004
struct  set_dic_packet                  {
			unsigned int far                *dic_start;
			long                                            dic_entries;
			int                                             type;

            unsigned int                                    lang;

};

/* GL 09/25/1997 use new symbol for dictionary loading */
#define PRIMARY_DIC                 0
#define USER_DIC                    1
#define ABBREV_DIC                  2


struct  load_mem_packet         {			unsigned int                    low_addr;
			unsigned int                    high_addr;
			unsigned int                    count;
};

union   CMD_PKT {

	unsigned char                                                   *null;
	struct  mem_load_packet                 *ml;
	struct  mem_alloc_packet                        *ma;
	struct  start_task_packet               *st;
	struct  set_dic_packet                          *sd;
};

union   RSP_PKT {
	unsigned char                                                   *null;
	struct  mem_reserved_packet             *mr;
};

#define PML                     (*cpkt.ml)
#define PML_size        ((sizeof(struct mem_load_packet)+5)/2)
#define PMA                     (*cpkt.ma)
#define PMA_size        ((sizeof(struct mem_alloc_packet)+5)/2)
#define PST                     (*cpkt.st)
#define PST_size        ((sizeof(struct start_task_packet)+5)/2)
#define PSD                     (*cpkt.sd)
#define PSD_size        ((sizeof(struct set_dic_packet)+5)/2)
#define PMR                     (*rpkt.mr)
#define PMR_size        ((sizeof(struct mem_reserved_packet)+5)/2)

#define MAX_BUFF                        256

/*
 *  dma equivalent of some of the above ... if extra parameters are
 *  needed beyond two bytes ...
 */

#define DMA_single_in                   0x01
#define DMA_single_out                  0x02
#define DMA_buff_in                             0x03
#define DMA_buff_out                    0x04
#define DMA_control                             0x05
#define         DT_MEM_ALLOC                    0x03
#define         DT_SET_DIC                              0x04
#define         DT_START_TASK                   0x05
#define         DT_LOAD_MEM                             0x06
#define         DT_READ_MEM                             0x07
#define         DT_DIGITAL_IN                   0x08
#define DMA_sync                                        0x06
#define DMA_sync_char                   0x07

struct  dma_command     {

	unsigned char           command;
	unsigned        char            data;
};
#define DMA_COMMAND_SIZE                        (sizeof(struct dma_command))    

struct  dma_mem_transfer                {
			unsigned int                    low_addr;
			unsigned int                    high_addr;
			unsigned int                    count;
};
#define DMA_MEM_TRANSFER_SIZE   (sizeof(struct dma_mem_transfer))       

struct  dma_start_task          {
			int                                     (far *task)();
};
#define DMA_START_TASK_SIZE             (sizeof(struct dma_start_task)) 

struct  dma_set_dic                     {
			unsigned int far                *dic_start;
#ifdef MSDOS
			long                                            dic_entries;
#else
			S32												dic_entries;
#endif			
			int                                             type;

            unsigned int                                    lang;
};                                      
#define DMA_SET_DIC_SIZE                        (sizeof(struct dma_set_dic))    

struct  dma_alloc_mem           {
			unsigned int                    paras;
};
#define DMA_ALLOC_MEM_SIZE              (sizeof(struct dma_alloc_mem))  

struct  dma_mem_reserved        {
			unsigned char far       *addr;
};
#define DMA_MEM_RESERVED_SIZE   (sizeof(struct dma_mem_reserved))       

struct  dma_digital_data        {
			unsigned int                    count;
};
#define DMA_DIGITAL_IN_SIZE             (sizeof(struct dma_digital_data))       


union   dma_control     {

	unsigned char   _far                                    *null;
	struct  dma_command     _far                    *dc;
	struct  dma_mem_transfer _far   *mt;
	struct  dma_start_task _far             *st;
	struct  dma_set_dic _far                        *sd;
	struct  dma_alloc_mem   _far            *am;
	struct  dma_mem_reserved _far   *mr;
	struct  dma_digital_data _far   *dd;
};

#define         DBUFF                   (dcp.null)
#define         DNL                     (*dcp.null)
#define         DDC                     (*dcp.dc)
#define         DMT                     (*dcp.mt)
#define         DST                     (*dcp.st)
#define         DSD                     (*dcp.sd)
#define         DAM                     (*dcp.am)
#define         DMR                     (*dcp.mr)
#define         DDI                     (*dcp.dd)

#endif

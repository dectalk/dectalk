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
 *    File Name:	tsr.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * DECtalk-PC TSR structures and defines ...
 *
 ***********************************************************************
 *    Revision History:
 * 30 oct 95 ... tek		busied flush support.  
 * 14 feb96	 ... tek		merge dtex  
 * 19 feb 96 ... cjl (tek) 	add DTC.message_language.  
 * 30 APR 96 ... KSB    	Added #define MAX_PC_BOARDS
 * 07 may 96 ... cjl		Touched with latest 4-8 board fix.
 * 25 Sep 97 ... gl         use new language symbol and add "lang" for dectalk_load_dic
 * 22 jun 98		mfg     Added LANG_latin_american support
 */

#ifndef TSRH
#define TSRH 1

#include <stddef.h>
#include <stdlib.h>
#include <dos.h>
/*include <bios.h> 20-jan-1995, not needed in this environment. cjl*/ 
#include	<ctype.h>
#include <fcntl.h>
#include <sys\types.h>
#include <sys\stat.h>
#include	<stdio.h>
#include <conio.h>
#include	<time.h>
#include	<malloc.h>
#include	"defs.h"
#include	"pcport.h"                
#ifdef DTEX
#include	"ser_tsr.h"
#include 	"esc.h"
#endif /*dtex*/

/* #define FOR_RAW define for raw spc packet mode*/
#define INTERRUPT void __interrupt __far

#define TSR_MAX_SEND_BUFF (96)
#define TSR_MAX_BUFF_SIZE (256)

#ifdef DTPC2
#define MAX_PC_BOARDS	8			// Number of DTPC2 boards installable
#else
#define MAX_PC_BOARDS	4			// Number of DTPC1 boards installable
#endif /* DTPC2 */

#ifdef DTEX
#define MAX_MODULES (1)
#else
#define MAX_MODULES (MAX_PC_BOARDS + 1)			// MAX_BOARDS + 1
#endif /*dtex*/

#pragma check_stack(off)
#pragma check_pointer(off)
#pragma intrinsic(_enable,_disable)
 
struct INT_WORD_REGS	{
    unsigned int	es;
	 unsigned int	ds; 
	 unsigned int	di;
	 unsigned int	si;
	 unsigned int	bp;
	 unsigned int	sp;
    unsigned int	bx;
	 unsigned int	dx;
	 unsigned int	cx;
	 unsigned int	ax;
	 unsigned int	ip;
	 unsigned int	cs;
	 unsigned int	flags;
};

struct INT_BYTE_REGS	{
    unsigned int	es;
	 unsigned int	ds; 
	 unsigned int	di;
	 unsigned int	si;
	 unsigned int	bp;
	 unsigned int	sp;
    unsigned char	bl;
    unsigned char	bh;
	 unsigned char	dl;
	 unsigned char	dh;
	 unsigned char	cl;
	 unsigned char	ch;
	 unsigned char	al;
	 unsigned char	ah;
	 unsigned int	ip;
	 unsigned int	cs;
	 unsigned int	flags;
};

union INT_REGS {	

		struct INT_BYTE_REGS		byte_regs;
		struct INT_WORD_REGS		word_regs;

};

/*
 *  short hand for interrupt frame regs and ms reg defs ...
 */

#define	IFB		int_frame.byte_regs
#define	IFW		int_frame.word_regs

extern union _REGS  tsr_regs;

#define	RB			tsr_regs.h
#define	RW			tsr_regs.x
     
typedef void (__interrupt far *INTVECT)();

#define DOS_EXIT        0x4C  /* DOS terminate (exit) */
#define KEYBOARD_PORT   0x60  /* KEYBOARD Data Port */

#define PSP_TERMINATE   0x0A  /* Termination addr. in our PSP */
#define PSP_PARENT_PSP  0x16  /* Parent's PSP from our PSP */
#define PSP_ENV_ADDR    0x2c  /* environment address from PSP */

/*
 *  multiplex id thread ...
 */

#define DECTALK_ID    0xD0
#define 		INSTALL_CHECK		0x00
#define 			INSTALLED			0xFF			/* return in al */
#define 		DECTALK_EXIT		0x01				/* remove the tsr */
#define		DECTALK_TEST		0x02
#define		GET_STATUS			0x03				/* get current status */
#define		VOLUME_UP			0x04				/* increase volume */
#define		VOLUME_DOWN			0x05				/* decrease volume */
#define		VOLUME_SET			0x06				/* set volume */
#define		ALLOC_MEM			0x07				/* allocate memory */
#define		SEND_CHAR			0x08				/* send a character */
#define		GET_CHAR				0x09				/* get a character */
#define		SEND_BUFF			0x0a				/* send a character buffer */
#define		GET_BUFF				0x0b				/* get a character buffer */
#define		LOAD_MEM				0x0c				/* send a memory buffer */
#define		READ_MEM				0x0d				/* get a memory buffer */
#define		PUT_KERNEL			0x0e				/* kernel memory load */
#define		START_KERNEL		0x0f				/* kernel task start */
#define		SET_DIC				0x10				/* add dictionary pointer */
#define		START_TASK			0x11				/* start a non-kernel task */
#define		GET_ID				0x12				/* get the module control id */
#define		GET_DTC				0x13				/* return dx:ax pointer */
#define		KERNEL_SYNC			0x14				/* wait for kernel start */
#define		PAUSE_OUTPUT		0x15				/* Pause output */
#define		RESUME_OUTPUT		0x16				/* Resume output */
#define		FLUSH_TEXT			0x17				/* Flush pending text */
#define		DIGITIZED_MODE		0x18				/* switch spc to digitized data */
#define		TEXT_MODE			0x19				/* switch spc to text to speech */
#define		DIGITIZED_DATA		0x1a				/* send digitized data */
#define		FLUSH_SPEECH		0x1b				/* flush speech but not control */
#define		GET_WIN_BUFF		0x1c				/* windows buffer area */
#define		BUFF_FREE			0x1d				/* input ring buffer free count */
#define		SEND_WSTRING		0x1e				/* send the windows buffer */
#define		BUFF_USED			0x1f				/* input ring buffer in use count */
#define		IMMD_VOICE			0x20				/* change voice async */
#define		IMMD_RATE			0x21				/* change rate async */
#define		IMMD_PERIOD			0x22				/* change period async */
#define		IMMD_COMMA			0x23				/* change comma async */
#define		GET_WSTRING			0x24				/* get characters in the buffer */
#define		LAST_INDEX			0x25				/* get last index spoken */
#define		IO_PRIORITY			0x26				/* change character stream i/o priority */
#define 		DECTALK_RESET		0x27				/* reset the module but keep tsr */
#define		FREE_MEM				0x28				/* get paragraphs left on module */
#define		IMMD_RATE_DELTA	0x29				/* delta change rate async */
#define		FLUSH_CHAR			0x2a				/* Flush current and speak char */
#define		SPC_RATE				0x2b				/* Change spc clocking rate */

/*
 *  load parameter block passed to the driver to do a memory load ..
 */

struct		dectalk_load_pb	{

		unsigned long			addr;				/* address on module to load */
		unsigned int			count;			/* number of bytes to send */
		unsigned char __far	*buff;			/* buffer to load from */
};

/*
 *  load parameter block for dictionary thread ...
 */

struct		dectalk_load_dic	{

		unsigned long __far		*dic;				/* address of dic on module */
		unsigned long			entries;			/* number of dictionary entries */
		unsigned int 			type;				/* user, primary, command, etc. */
/* GL 09/25/1997 add for language dictionary loading */
		unsigned int 			lang;				/* english spanish, etc. */

};

/* GL 09/25/1997 use new symbol for dictionary loading */
#define PRIMARY_DIC                 0
#define USER_DIC                    1
#define ABBREV_DIC                  2

/*
 *  character send/receive structure ...
 */

struct		dectalk_char_buff	{

	unsigned int				count;			/* byte to send or max receive */
	unsigned char __far		*buff;			/* buffer copy to/from */
	
};

/*
 *  special codes ...
 */
#define	SPC_DIGITIZED_DATA	5
#define	SPC_DIGITIZED_MAX		(64*8)
/*
 *  pointer conversions ...
 */

#define	FP_TO_LONG(q)	(((unsigned long)(*(unsigned int *)&q+1)<<4) + (*(unsigned int *)&q))
#define	LONG_TO_FP(q)	((void __far *)(((q&0xffff0)<<12)+(q&0xf)))

/*
 * DECtalk error status codes ...
 */

#define	ERROR_status_null				0
#define	ERROR_status_timeout			1
#define	ERROR_dma_timeout				2
#define	ERROR_cmd_timeout				3
#define	ERROR_bad_command				4
#define	ERROR_no_module				5
#define	ERROR_bad_mode					6
#define	ERROR_flush_timeout			7
			

#define PARAGRAPHS(x)   ((FP_OFF(x) + 15) >> 4)

/*
 *  parallel port function codes that are emulated and supported ...
 *  call with ...
 *    ah == function code.
 *    al == send byte.
 *    dx == port to send to. 

 *  return ...
 *    ah == standard status
 */

#define	_LPT_send			0x00		/* ah on function call */
#define	_LPT_init			0x01			
#define	_LPT_status			0x02

/*
 *  return status bits for init and status calls.
 */

#define	_LS_time_out			0x01
#define	_LS_io_error			0x08
#define	_LS_selected			0x10
#define	_LS_out_of_paper		0x20
#define	_LS_acknowledge		0x40
#define	_LS_not_busy			0x80

/*
 *  serial port function codes that are emulated and supported ...
 *  call with ...
 *    ah == function code.
 *    al == init or send byte.
 *    dl == port to send to. 
 *    dh == module to send to.
 *  return ...
 *    ah == standard status
 *    al == extended status (init or status) or return char (receive)
 */

#define	_COM_init			0x00		/* ah on function call */
#define	_COM_send			0x01			
#define	_COM_receive		0x02
#define	_COM_status			0x03

/*
 *  all com setup parameters for the line are saved so that they can
 *  be returned for status ...
 */

#define		_CI_baud_110		0x00
#define		_CI_baud_150		0x20 
#define		_CI_baud_300		0x40 
#define		_CI_baud_600		0x60 
#define		_CI_baud_1200		0x80 
#define		_CI_baud_2400		0xA0 
#define		_CI_baud_4800		0xC0 
#define		_CI_baud_9600		0xE0

#define		_CI_parity_none	0x00
#define		_CI_parity_odd		0x80
#define		_CI_parity_even	0x10

#define		_CI_stop_one		0x00
#define		_CI_stop_two		0x04

#define		_CI_word_5			0x00
#define		_CI_word_6			0x01
#define		_CI_word_7			0x02
#define		_CI_word_8			0x03

/*
 *  return status bits for init and status calls.
 */

#define	_CS_data_ready					0x0100
#define	_CS_overrun_error				0x0200
#define	_CS_parity_error				0x0400
#define	_CS_framing_error				0x0800
#define	_CS_break						0x1000
#define	_CS_trans_buffer_empty		0x2000
#define	_CS_trans_shift_empty		0x4000
#define	_CS_time_out					0x8000
#define	_CS_delta_CTS					0x0001
#define	_CS_delta_DSR					0x0002
#define	_CS_end_of_ring				0x0004
#define	_CS_rec_change					0x0008
#define	_CS_CTS							0x0010
#define	_CS_DSR							0x0020
#define	_CS_ring							0x0040
#define	_CS_rec							0x0080

#define	_CS_def_status					0x6010



/*
 *  DECtalk-PC module hardware defs ...
 */

#define	DT_STAT_LOW			(DTC.base+0)
#define	DT_STAT_HIGH		(DTC.base+1)
#define	DT_CMD_LOW			(DTC.base+0)
#define	DT_CMD_HIGH			(DTC.base+1)

#define	DT_DO_LOW			(DTC.base+2)
#define	DT_DO_HIGH			(DTC.base+3)
#define	DT_DI_LOW			(DTC.base+2)
#define	DT_DI_HIGH			(DTC.base+3)

#define	DT_DMA				(DTC.base+4)
#define	DT_INT				(DTC.base+6)

/*
 *  bios places the configuration information at a ram block pointed
 *  to by vector 0x65 ...
 */

#define	DTPC_VECT			0x65
#define	DTPC_TABLE			(DTPC_VECT*4)

/*
 *  the actual table is a 0x4f:0 for now, so use that to get around the
 *  adaptec controller problem ...
 */

#define	DTPC_TABLE_SEG		(0x4f)
#define	DTPC_TABLE_OFF		(0x0)

#define	DT_INST(x) 	(((x) & 0x80) >> 7)		/* extract install state */
#define	DT_TEST(x) 	(((x) & 0x60) >> 5)		/* extract test state */
#define	DT_IRQ(x) 	(((x) & 0x1c) >> 2)		/* extract irq */
#define	DT_BASE(x) 	((x) & 0x03)				/* extract base */

#define	IRQ_SET(x,y) 	((x & 0xe3) | ((y<<2) & 0x1c))	/* insert irq */
#define	IO_SET(x,y) 	((x & 0xfc) | ((y<<2) & 0x3))		/* insert io */


/*
 *  extern global variables ... declared in tsr_main.c ...
 */

struct	dectalk_control	{

	volatile unsigned char __far *config;	/* configuration byte */
	volatile unsigned int base;				/* module base i/o address */
	volatile unsigned int status;				/* last status read from module */
	volatile unsigned int module_status;	/* last status, status */
	volatile unsigned int command;			/* last command sent to the module */
	volatile unsigned int vector;				/* vector the module will interrupt at */
	volatile unsigned int in_dos;				/* dos or tsr mode flag */
	volatile	unsigned int max_ticks;			/* timer ticks to wait */
	volatile unsigned int error_status;		/* module error status */
	volatile unsigned int trap;				/* Com/lpt call trap installation */
	volatile unsigned int id;					/* id of port control software */
	volatile unsigned int tsr_busy;			/* tsr active flag */
	volatile unsigned int dma_count;			/* module dma's available */
	volatile unsigned int cmd_count;			/* module command's available */
	volatile unsigned int flushing;			/* module is busy flushing speech */
	volatile unsigned int lastindex;			/* last valid index returned */
	volatile unsigned long chars_out;		/* total characters sent */
	volatile unsigned long chars_in;			/* total characters received */
	volatile unsigned long ints_out;			/* total interrupts sent */
	volatile unsigned long ints_in;			/* total interrupts received */
	volatile unsigned int lpt;					/* lpt port to use */
	volatile unsigned char port;				/* com port to use */
	volatile unsigned char mode;				/* mode the com port is in */
	volatile unsigned char eoi;				/* 8259 eoi value*/
	volatile unsigned char flush_requested[MAX_MODULES]; /* reissue busied flushes */
#ifdef DTEX
	volatile unsigned int data;				/* last data returned */
	volatile unsigned int version_status;			/* do we return this? */
#endif /*DTEX*/
	
};
  
extern unsigned int message_language;
/*
 *	Languages defined for message_language command line option /S
 */
#define US_MESSAGE_LANGUAGE		00
#define SP_MESSAGE_LANGUAGE		01
#define GR_MESSAGE_LANGUAGE		02
#define FR_MESSAGE_LANGUAGE		03
#define JA_MESSAGE_LANGUAGE             04
#define UK_MESSAGE_LANGUAGE             05
#define LA_MESSAGE_LANGUAGE             06

/*
 *  control that is only around during load/init time ...
 */

extern unsigned int verbose;				/* print loads of info */		

extern struct dectalk_control *dtc[];
extern int			module_index;
extern int			num_modules;

#define	DTC		(*dtc[module_index])
#define	DTI		(*dtc[i])
#define	DTP		(*dtp)

extern unsigned int bases[];								/* possible module base values */
extern void (__interrupt __far *old_int2f)();		/* multiplex thread */
extern void (__interrupt __far *old_int14)();		/* serial com thread */
extern void (__interrupt __far *old_int17)();		/* parallel printer thread */
extern void (__interrupt __far *old_int1c)();		/* timer thread */

#define	TRAP_NONE			0x0
#define	TRAP_SERIAL			0x1
#define	TRAP_PARALLEL		0x2

#define	DOS_TPS		18				/* ticks per second */

extern unsigned int foreground_psp;
extern unsigned int foreground_dta_off;
extern unsigned int foreground_dta_seg;
extern char __huge *tsrstack;
extern char __huge *dosstack;
extern unsigned short int tsrsize;
extern int num_modules;

#define SET_DTA			0x1a  /* SET Disk Transfer Address */
#define GET_DTA			0x2f  /* GET Disk Transfer Address */   
#define GET_PSP_DOS3		0x62
#define SET_PSP			0x50

/*
 *  tsr control variables ...
 */

extern int	in_tsr,start_tsr;

#define	TSR_FAILURE		0x00			/* Fails to do function */
#define	TSR_SUCCESS		0x01			/* Succeeds */
#define	TSR_BUSY			0x02			/* Tsr is busy, try again */
#define	TSR_RETRY		0x03			/* Module busy, try again */

/*
 *  pop defs ...
 */

#define DECTALK_HOT_KEY         0x20    /* ALT (D)*/
#define DECTALK_SHIFT_KEY		  0x08

#ifdef DTEX
/*serial crap.. */
extern unsigned char dleoutbuf[];
extern unsigned long last_int_tick, dt_ticks;
#endif /*dtex*/
/*
 *  windows support ...
 */

#define	WIN_BUFF_SIZE		1024

extern int	win_buff_size;
extern char __huge *win_buff;
extern int	in_windows;

/* address info for dtpc2 */
#ifdef DTPC2
#define DT_ADDR_HILIMIT (0x3f8)
#define DT_ADDR_LOLIMIT (0x200)
#endif /*DTPC2*/

/*
 *  include the prototypes at the end so that we get the rest of the 
 *  defs first ...
 */

#endif

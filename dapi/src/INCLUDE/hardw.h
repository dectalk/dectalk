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
 *    File Name:	hardw.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Hardware-specific defines. 
 * where possible, things like hardware bit definitions and addresses are
 * in here.                            
 *
 * Be warned:   some of these get replicated "somewhere else" for assembler; 
 *              also, not *everything* machine-dependent lives here - lots of 
 *              code may have to chage as well!
 *
 ***********************************************************************
 *    Revision History:
 * 14jul95      ...tek          Initial
 * 13sep95  ...tek      Correct START/STOP_SAMPCLK macros for DTPC1.
 * 14sep95  ...cjl      Regressed to START/STOP_SAMPCLK macros of 12sep95.
 * 15sep95  ...jdb      added S_GPIO, C_GPIO macros for "compound" *_gpio calls
 * 15sep95  ...jdb      made GPIO_* #defines also accessible to DTPC2 
 * 25oct95  ...tek	fix this GPIO stuff once and for all.
 * 11dec95  ...tek	merge dtex
 */

#ifndef HARDWH
#define HARDWH 1

#define IO_BASE         0x400

/* where the various registers live.. */

#ifdef DTPC2
/* this is for the DTPC-II */
#define ISA_STATUS              (IO_BASE+0x00)                  /* posted isa status */

#define ISA_COMMAND             (IO_BASE+0x00)                  /* command data from isa */

#define ISA_DO                  (IO_BASE+0x02)                  /* data out to isa */

#define ISA_DI                  (IO_BASE+0x02)                  /* data in from isa */

#define GPIO0                   (IO_BASE+0x04)                  /* module register (byte) */
/* all these bits in GPIO0 get cleared on reset; they are write-only. */
#define         NOT_LEFT_INC    (0x01)                  /* 0=incremt vol */
#define         LEFT_UP         (0x02)                  /* 1=up, 0=down */
#define         NOT_RIGHT_INC   (0x04)                  /* 0=increment vol */
#define         RIGHT_UP        (0x08)                  /* 1=up, 0=down */
#define         SAMPCLK_OFF     (0x10)                  /* 0=dsp sample clock on */
#define         REFRESH_ON      (0x80)                  /* enable dram refresh */
/* the GPIO0 register also contains read-only status bit(s) */
#define         DSP_FAULTED     (0x01)                  /* DSP signalled a fault.*/

#define GPIO2                   (IO_BASE+0x06)          /* module register (byte) */
/* GPIO2 is write-only, cleared on reset. */
#define         NOT_DSPRESET    (0x01)                  /* 0 = dsp reset. */
#define         DMA_TO_CPU      (0x02)                  /* controls the direction of DSP DMA */
#define         WRITE_SRAM      (0x04)                  /* generates DSP SRAM WE for loading DSP memory*/
#define         READ_SRAM       (0x08)                  /* latch SRAM data into dma window */
#define         IRQ_SHARED      (0x10)                  /* enable IRQ driver only when asserted */
/* these select the module IRQ.. */
#define         ISA_NO_IRQ      (0x00)
#define         ISA_IRQ2        (0x40)
#define         ISA_IRQ3        (0x60)
#define         ISA_IRQ4        (0x80)
#define         ISA_IRQ5        (0xa0)
#define         ISA_IRQ6        (0xc0)
#define         ISA_IRQ7        (0xe0)


#define SRAM_ADDR               (IO_BASE+0x80)                  /* dsp sram address latch */

#define SPCIO                   (IO_BASE+0x100)                 /* DMA data port to/from DSP */

#define ISA_INT                 (IO_BASE+0x180)                 /* set ISA IRQ f-f */

#define DMA_BUFF                (IO_BASE+0x280)                 /* ISA dma window */

#define CLR_ISA_INT             (IO_BASE+0x300)                 /* clear isa doorbell */

#define RAM_ENABLE              (CLR_ISA_INT)                   /* for compatibility */


#else /* DTPC2 */
/* this is for the DTPC-I */
#define ISA_STATUS              (IO_BASE+0x00)                  /* posted isa status */
#define ISA_COMMAND             (IO_BASE+0x00)                  /* command data from isa */
#define ISA_DO                  (IO_BASE+0x80)                  /* data out to isa */
#define ISA_DI                  (IO_BASE+0x80)                  /* data in from isa */

#define SPCIO                   (IO_BASE+0x100)
#define ISA_INT         (IO_BASE+0x180)
#define IN_VOL          (IO_BASE+0x200)
#define DMA_BUFF                (IO_BASE+0x280)
#define RAM_ENABLE      (IO_BASE+0x300)

/* JDB 9/15/95: moved this endif up, it used to be below the GPIO defs...
   this now makes these usable for BOTH DTPC1 and DTPC2
   TEK 10/25/95 put it back; these don't make any sense on DTPC2.
*/

/* added these definitions 9/5/95  JDB */
#ifndef DTEX
#define GPIO_VDIR       0x04
#define GPIO_VINC       0x02
#define GPIO_VCS        0x08
#define GPIO_STOP       0x20
#define GPIO_RESET      0x10
#endif /*DTEX*/                      

/* added these macros for multiple bit switches, 9/15/95 JDB */
#define S_GPIO set_gpio (GPIO_RESET+GPIO_STOP);
#define C_GPIO clr_gpio (GPIO_RESET+GPIO_STOP);
#endif /* DTPC2 */ /* where it belongs. */

/* macros to do things.. */

#ifdef DTPC2
#define STOP_SAMPCLK    set_gpio0(SAMPCLK_OFF) 
#define START_SAMPCLK   clr_gpio0(SAMPCLK_OFF)
#define RESET_DSP       clr_gpio2(NOT_DSPRESET)
#define RUN_DSP         set_gpio2(NOT_DSPRESET)
                
#else
#ifdef DTEX
#define STOP_SAMPCLK    spc_clock(0) 
#define START_SAMPCLK   spc_clock(1)
#define RESET_DSP       set_gpio(DSP_RESET)
#define RUN_DSP         clear_gpio(DSP_RESET)

#else /* DTEX & DTPC2 */
#define STOP_SAMPCLK    clr_gpio(GPIO_STOP) 
#define START_SAMPCLK   set_gpio(GPIO_STOP)
#define RESET_DSP       clr_gpio(GPIO_RESET)
#define RUN_DSP         set_gpio(GPIO_RESET)

#endif /*DTEX*/

#endif /* DTPC2 */    

#ifdef DTEX

#define	DSP_RESET		(BIT0)
#define	V5BOFF			(BIT1)
#define	VPPON				(BIT2)
#define	DSPDMADONE		(BIT3)
#define	EXTPWR			(BIT4)
#define	BATTOK			(BIT5)
#define	V5BOK				(BIT6)
#define	DSPFAULT			(BIT7)

/*
 *  physical i/o stuff ...
 */

/*********/

#define 	GPIO         0x2e0

#define 	UART         0x2f8
/* uart registers*/
#define	UART_RBR		(UART)	

#define	UART_THR		(UART)

#define 	UART_IER		(UART+1)
#define	IER_ERBI	(BIT0)
#define	IER_ETBEI	(BIT1)
#define	IER_ELSI	(BIT2)
#define	IER_EDSSI	(BIT3)

#define	UART_IIR		(UART+2)

#define	UART_FCR		(UART+2)
#define	FCR_ENABLE	(BIT0)
#define	FCR_CLR_RCV	(BIT1)
#define	FCR_CLR_XMT	(BIT2)
#define	FCR_DMAMODE	(BIT3)
#define	RCV_HIWATER_ENC	(BIT6)	/* 4 characters before interrupt. */

#define	UART_LCR		(UART+3)
#define	LCR_WORDLEN	(BIT0|BIT1)
#define	LCR_STOPS	(BIT2)
#define	LCR_PARITY	(BIT3)
#define	LCR_EPS		(BIT4)
#define	LCR_STICK	(BIT5)
#define	LCR_BREAK	(BIT6)
#define	LCR_DLAB		(BIT7)

#define	BPC_5			(0)
#define	BPC_6			(1)
#define	BPC_7			(2)
#define	BPC_8			(3)

#define	STOP_1		(0)
#define	STOP_2		(1)

#define	PARITY_EVEN	(0)
#define	PARITY_ODD	(1)
#define	PARITY_1		(2)
#define	PARITY_0		(3)
#define	PARITY_NONE	(4)

#define DEFAULT_BAUDRATE	(9600)
#define	DEFAULT_BITSPERCHAR	(BPC_8)
#define	DEFAULT_PARITY		(PARITY_NONE)
#define	DEFAULT_STOP		(STOP_1)

#define	UART_MCR		(UART+4)
#define	MCR_DTR		(BIT0)
#define	MCR_RTS		(BIT1)
#define	MCR_OUT1		(BIT2)
#define	MCR_OUT2		(BIT3)
#define	MCR_LOOP		(BIT4)

#define	UART_LSR		(UART+5)
#define	LSR_DR		(BIT0)
#define	LSR_OE		(BIT1)
#define	LSR_PE		(BIT2)
#define	LSR_FE		(BIT3)
#define	LSR_BREAK	(BIT4)
#define	LSR_THRE		(BIT5)
#define	LSR_TEMT		(BIT6)
#define	LSR_FIFOERR	(BIT7)

#define	UART_MSR		(UART+6)
#define	MSR_DCTS		(BIT0)
#define	MSR_DDSR		(BIT1)
#define	MSR_TERI		(BIT2)
#define	MSR_DDCD		(BIT3)
#define	MSR_CTS		(BIT4)
#define	MSR_DSR		(BIT5)
#define	MSR_RI		(BIT6)
#define	MSR_DCD		(BIT7)


#define	SERIAL_ERROR_MAX		(20)	/* 20 errors per watch interval.. */

#define DMA_CHANNEL  7

/* dma controller.. */
#define DMA0_MODE				(0x0b)
#define	DMA0_SINGLE_MASK			(0X0A)
#define	DMA0_ADDR				(0x00)
#define	DMA_ADDR				(0xc0)
#define	DMA0_STAT_CMD				(0x08)

#define DMA7_ADDR				(0xcc)
#define DMA7_COUNT			(0xce)
#define DMA_STAT_CMD 		(0xD0)
#define DMA_REQUEST	 		(0XD2)
#define DMA_SINGLE_MASK		(0XD4)
#define DMA_MODE				(0XD6)
#define DMA_CLRPTR			(0XD8)
#define DMA_MASTERCLEAR		(0XDA)
#define DMA_CLRMASK			(0XDC)
#define DMA_ALLMASK			(0XDE)

#define DMA5_PAGE				(0X8B)
#define DMA6_PAGE				(0X89)
#define DMA7_PAGE				(0X8A)

#define DMA_BLOCK    (0x80)
#define DMA_READ     (0x08)
#define DMA_DEMAND   (0x00)


#define	PORTA		(0x92)
#define	PORTB		(0x61)


/* interrupt controller */
#define PIC0	(0x20)
#define PIC1	(0xa0)

#define	INT0_EOI		(PIC0)


#define INT_OFF	asm("cli");
#define INT_ON		asm("sti");


#define NONSPECIFIC_EOI	(0x20)
#define SERIAL_SPECIFIC_EOI	(0x60|0x3)

#define	IRQ0_VEC		(0X20)
#define	IRQ1_VEC		(0X21)
#define	IRQ2_VEC		(0X22)
#define	IRQ3_VEC		(0X23)
#define	IRQ4_VEC		(0X24)
#define	IRQ5_VEC		(0X25)
#define	IRQ6_VEC		(0X26)
#define	IRQ7_VEC		(0X27)

#define IMR0			(PIC0+1)
/* Masks for the interrupts in the PIC.. */
#define	IRQ0_MASK		(BIT0)
#define	IRQ1_MASK		(BIT1)
#define	IRQ2_MASK		(BIT2)
#define	IRQ3_MASK		(BIT3)
#define	IRQ4_MASK		(BIT4)
#define	IRQ5_MASK		(BIT5)
#define	IRQ6_MASK		(BIT6)
#define	IRQ7_MASK		(BIT7)


// inside the 82C315A..
#define	PORTB		(0x61)


#endif /*DTEX*/

#endif /* HARDWH */


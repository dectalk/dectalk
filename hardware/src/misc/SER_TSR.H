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
 *    File Name:	ser_tsr.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * defines for the dectalk express DOS serial driver
 *
 ***********************************************************************
 *    Revision History:
 */

#ifndef SER_TSR_H
#define SER_TSR_H
#define RINGSIZE (1024)

struct serialring {
	volatile unsigned short int head;
	volatile unsigned short int tail;
	volatile unsigned short int count;
	unsigned short size;
	unsigned char buff[RINGSIZE];
	};

extern struct serialring _far inbuf; 	/* where are these declared?*/
extern struct serialring _far outbuf;	/* tsr_main.c*/
extern struct serialring _far p_outbuf;
 
extern unsigned char global_busy;
extern unsigned short int uart_ioport,uart_intvec;

extern unsigned char _far specific_EOI_cmd;


/* serial port definitions*/
#define UART (uart_ioport)	/* filled in at install time..*/

/* these are 16550 defines, but we may not actually HAVE a '550..*/ 
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
#define	RCV_HIWATER_ENC	(BIT7)	/* 8 characters before interrupt. */

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
#endif /*SER_TSR_H*/



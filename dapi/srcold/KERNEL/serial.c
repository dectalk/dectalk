/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000, 2001 Force Computers Inc. A Solectron company. All rights reserved.
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
 *    File Name:	serial.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality: DECtalk Express serial port handler.
 *
 ***********************************************************************
 *    Revision History:
 *
 * 001	tek	27feb95			clear KS.idleflag when we get a char..
 * 002 	tek	13dec95			merge into main code pool
 * 003	MGS	05/09/2001		Some VxWorks porting BATS#972
 * 004  CAB	05/14/2001		Updated copyright
 */

/* WARNING  WARNING  WARNING  WARNING
 * This code assumes that interrupts don't nest; thus it can EOI
 * itself. It does a specific EOI, but nonetheless the PIC may
 * get confused if we got here from within another hardware ISR.
 * Caveat Emptor.
 */

#include	"defs.h"
#include	"dectalk.h"
#include	"kernel.h"
#include "cmd.h"
#include	"esc.h"
#include "pcport.h"
#include "kernp.h"
#include "hardw.h"

#include <conio.h>	/* for inp, outp */
#pragma intrinsic(_inp, _inpw, _outp, _outpw)

#define MAX_XMIT_FIFO	4		/* 1-16; number of tx chars per int. */


/*
 *  global data storage task ...
 */



DT_SEMAPHORE					serial_sem;		/* serial int semaphore */
extern	volatile unsigned int	dma_new_priority;
void far SerialHandler(void);

volatile unsigned char 	RcvdXoff; /* Yuck.  */
volatile unsigned short	error_count, break_count,overflows;
volatile unsigned char		need_xoff_sent,serial_update_request;
unsigned short int hiwater;	/* inbound xoff point..*/

volatile unsigned char can_EOI; /* can this ISR do an EOI??*/

unsigned short int dleseqptr;	/* for DLE sequence parsing..*/
#define DLESEQLEN (4)
unsigned char dleinbuf[DLESEQLEN];

/*
 * serial_init is used to set up the serial port before the kernel
 *  fires up, so that we can at least que characters to the line..
 */

void _far serial_init()
{
/*
 *  init the serial port.
 */

/* we do the EOI ourselves.*/
	can_EOI = 1;
/* connect the interrupt */
	connect_int(IRQ3_VEC, SerialHandler);

/* set up the default format */
	set_baud(DEFAULT_BAUDRATE);
	set_format(DEFAULT_BITSPERCHAR,DEFAULT_PARITY,DEFAULT_STOP);

/* flush and enable the FIFOs, rcv trigger at RCV_HIWATER chars. */
	_outp(UART_FCR, 
		FCR_ENABLE | FCR_CLR_RCV | FCR_CLR_XMT | RCV_HIWATER_ENC);

/* turn on DTR.. */
	_outp(UART_MCR, 1);

/* flush the rings.. */
	flush_ring(KS.in_ring);
	flush_ring(KS.out_ring);
	flush_ring(KS.p_out_ring);
	dleseqptr = 0;


} /* serial_init()*/


/*
 *  serial_task is the serial character transport for the module.
 */

void _far serial_task()
{

	int			count,i;
	unsigned int 		pipe_word;
	struct dgt_packet _far 	*dgt_pkt;
	char			out_char;


	RcvdXoff=0;
	need_xoff_sent=0;
	serial_update_request=0;


    hiwater = ((KS.in_ring->size-16)*2)/3; /* stop when 2/3 full.*/
					  /* getc restarts when 1/2 full.*/


/* clear the error count */
	error_count=0;
	break_count=0;

	overflows=0;

/* send an xon..*/
	_outp(UART_THR, XON);


/* enable the interrupts */
	_outp(UART_IER, IER_ERBI | IER_ETBEI);

/* and finally unmask the interrupt controller.. */
	enable_int(IRQ3_MASK);

	if (KS.l_verbose)
		{
		printf("\n\n DECtalk Express kernel running..\n");
		printf("IN_RING at off:%04x seg:%04x, OUT_RING at off:%04x seg:%04x\n",
		 IN_RING.buff, OUT_RING.buff);
		}

/* sit here forever, occasionally looking at the error count and deciding what */
/* to do about errors.. */
	while (true)
		{
		sleep(100);
		if ((error_count + overflows) > SERIAL_ERROR_MAX)
			{
			/* do something, I guess.. */
			printf("\nserial errors=%04x overflows=%04x\n",
				error_count, overflows);
			/* and reset the count.. */
			error_count=0;
			overflows=0;

			}
		/* maybe this should look for a port stuck in XOFF for a long */
		/* time and try to unjam it.. */
		} /* while true*/

}


void far slflush()
{
	/* sleep until the output buffer empties.*/
	/* the uart may have characters in the fifo, so always*/
	/* sleep before testing.*/
	sleep(2);
	while(OUT_RING.count > 0)
		{
		sleep(2); /* plenty of time to flush the uart fifo... */
		}

}

/* globals used from here on down..*/
P_RING inringptr;
P_RING outringptr;

unsigned char saw_xon;
unsigned char need_rx_unblock=0;


void far SerialHandler()
{
	/* get here on a serial line interrupt. */
	/* hopefully, ints are off at this point, and won't be back on */
	/* until we've passed back out through the interrupt reflector in */
	/* protected mode.. */

	/* right now, this is purely XonXoff, but the DTR line is asserted */
	/* in case the host need it asserted to do anything. Eventually, the */
	/* DSR/DTR lines should be handled for hardware flow control.. */
unsigned char UartLineStatus, UartIntIdent;
unsigned char k, in_char;



    need_xoff_sent=0;



	/* we know ints are disabled, so grab the in ring pointer to
	   allow some optimization.. */
    inringptr = KS.in_ring;


    while( ((UartIntIdent=_inp(UART_IIR)) & 0x1) == 0) /*0=int pending*/
       {

 	/* spin and yank all the characters that are in the */
 	/* fifo.. */
 	while ( (UartLineStatus=_inp(UART_LSR)) & LSR_DR)
 	    {
 	    unsigned char in_char;
 	    	if (UartLineStatus
		 & (LSR_BREAK|LSR_OE|LSR_PE|LSR_FE))
		 	{
		         /* if this is a break, pass that fact up.. */
		         if (UartLineStatus&LSR_BREAK)
		 	  {
		 	  break_count++;
		 	  /* the character is junk.. */
		 	  _inp(UART_RBR);
		 	  continue;
		 	  }
		         /* if any of the error bits are set, bump the error*/
		         /* count and toss the character */
		         if (UartLineStatus & (LSR_OE|LSR_PE|LSR_FE))
		 	    {
		 	    error_count++;
		 	    /* toss the character */
		 	    _inp(UART_RBR);
		 	    continue;
		 	    }
		 	} /* It was an error.*/
	        /* pull the character.. */
	        in_char = _inp(UART_RBR);
	        /* deal with controls separately*/
	      	    if (in_char < ' ' || dleseqptr != 0)
	       		{
			/* this probably wants to be a case statement,*/
			/* but it grew from humble beginnings. I don't*/
			/* think it's any harder to understand, though.*/
	       	        if (in_char == XOFF)
	       		  {
	       		  RcvdXoff++;
			  saw_xon=0;
	       		  continue; /* toss the character. */
	       		  }
	       	        if (in_char == XON)
	       		  {
	       		  RcvdXoff=0;
	       		  saw_xon++;
	       		  continue; /* toss the character */
	       		  }
			if (in_char == VT)
			  {
			  /* sync, just pass it on. */
			  SHPutRing(in_char);
			  continue;
			  }
			if (in_char == ETX)	/* ^C: Flush. */
			  { /* single-char flush. */
			  KS.sc_flush = true;
		    	  signal_semaphore(&isa_port_sem);
			  continue;
			  }
			if (in_char == SO)	/* ^N: Pause. */
			  {
			  KS.pause = true;
        		  _outp(PORTB,_inp(PORTB)&~BIT0);
			  continue; /* toss the character. */
			  }
			if (in_char == SI)	/* ^O: Resume. */
			  {
			  KS.pause = false;
        		  _outp(PORTB,_inp(PORTB)|BIT0);
			  continue; /* toss the character. */
			  }
			if (in_char == ENQ)
			  { /* status request. */
			  serial_update_request++;
			  continue;
			  }
			if (in_char == DLE || dleseqptr != 0)
			  {
			  /* starting or continuing a 4-char DLE seq. */
			  /* they don't nest, so if this char is a DLE */
			  /* then blast the pointer back. */
			  if (in_char == DLE)
				{
				dleseqptr=1;
				dleinbuf[0]=in_char;
				continue; /*don't process further. */
				}
			  /* must be in the middle of a DLE sequence.. */
			  /* just stash the character.. */
			  dleinbuf[dleseqptr++] = in_char;
			  /* see if that was the end.. */
			  if (dleseqptr == DLESEQLEN)
				{
				unsigned short int tmp1,tmp2;
				/* first get ready for the next one.. */
				dleseqptr = 0;
				if ((tmp1=dleinbuf[1])<' '
				    || tmp1>'q')
				    {
				    /* bad DLE sequence; flush it. */
				    continue;
				    }
				/* there are two cases; the */
				/* status-update sequences, and the  */
				/* sync-character sequences. Decide here. */
				if (tmp1 < 'p')
				    {
				    /* status-update. Build the word. */
				    if (tmp1 > 0x3f)
					{
					/* wrong direction. Punt. */
					continue;
					}
				    tmp2 = (tmp1&0xF)<<12;
				    tmp1 = dleinbuf[2];
				    tmp2 |= (tmp1&0x3F)<<6;
				    tmp1 = dleinbuf[3];
				    tmp2 |= tmp1 & 0x3f;
				    /* put the data in its place.. */
				    if (dleinbuf[1] > 0x2f)
					{
					KS.in_data = tmp2;
					}
				      else
					{
					KS.command = tmp2;
				    	signal_semaphore(&isa_port_sem);
					/* this might cause data to flow, */
					/* so let the sleep manager know */
					KS.idleflag = 0;
					}

				    /* and we're done. */

				    continue;
				    } /* if status update sequence */
				  else
				    {
				    unsigned char tmp1,tmp2;
				    /* this is a sync-with-char sequence. */
				    /* The TSR always does the flush and */
				    /* waits for completion, so we don't */
				    /* have to do that here. */
				    /* here we choose between a flush and */
				    /* a flush_speak.. */
				    if (dleinbuf[1] == 'p')
					{
					/* just a flush. ("DMA_sync") */
					SHPutRing(CMD_sync_char);
					} /* just flush */
				      else
					{
					/* flush_char.. */
					/* build the character to speak. */
					tmp1 = 
					    (dleinbuf[2]&0xF)<<4
					    | (dleinbuf[3]&0xF);
					/* stuff the ring.. */
					SHPutRing(CMD_sync_out);
					SHPutRing(tmp1);
					} /*flush_char */
				    
				    } /* it was a sync */
				} /* It was the end of a DLE.. */
			    continue; /* don't do any more with this char. */
			    } /* it was a DLE..     */
	            } /* it was a control. */

	        /* if we got this far, it's just a character.. */
		SHPutRing(in_char);
		/* see if we're full up.. */
		if (inringptr->count>hiwater)
			need_xoff_sent++; /* ask for stop. */
		} /* while rcv chars exist */


		if (need_rx_unblock)
			{
			unblock_ring(KS.in_ring);
			need_rx_unblock=0;
			}
		/* if we saw an XON, make sure the TX interrupt is on. */
		if (saw_xon)
		    {
		    _outp(UART_IER, _inp(UART_IER)|IER_ETBEI);
		    saw_xon=0;
		    }
		if (need_xoff_sent)
			{
			_outp(UART_THR, XOFF);
			/* note that, as a side effect of that XOFF, */
			/* we won't send any characters (because THRE */
			/* won't have set again by the time we look). */
			need_xoff_sent=0;
			}

		if (serial_update_request)
			{
			/* send a serial update, if we can.. */
			if (SHSerialUpdate())
				serial_update_request=0;
			}
	    /* if we're xoff'd, we just clear the tx interrupt  enable. */
	    /* but we want to send things on the priority ring without */
	    /* regard to XOFF, so we check that here too. */
	    if (RcvdXoff 
		&& KS.p_out_ring->count == 0) 
		{
		unsigned char tmp2;
		if ((tmp2=_inp(UART_IER))&IER_ETBEI)
	    	    _outp(UART_IER, tmp2 & ~IER_ETBEI);
		/* and we can't do anything else. */
		continue;
		}
	    /* as a safety, make sure that the tx int is on if there are  */
	    /* chars in the p_outbuf.. */
	    if (KS.p_out_ring->count)
		outp(UART_IER,_inp(UART_IER)|IER_ETBEI);

	    /* Holding register empty */
	    /* tells us whether there is room. */
	    while ((_inp(UART_IER)&IER_ETBEI) &&
			(_inp(UART_LSR)&LSR_THRE))
		{
		unsigned short int k;
		/* grab the correct output ring pointer based on  */
		/* priority.. */
		if (KS.p_out_ring->count)
			{
			outringptr = KS.p_out_ring;
			}
		    else
			{
			outringptr = KS.out_ring;
			}
	        /* now, if we're not XOFF'd and didn't need to deal */
		/* w/sending an xoff, we can start pumping characters. */
		/* we load in up to MAX_XMIT_FIFO chars before we */
		/* quit; this can be as large as 16 (well, 14 to  */
		/* allow room for an xoff or two), but probably */
		/* wants to be more like 6 to make sure the we don't */
		/* choke the host if we're just at its receive */
		/* buffer limit */ 
		for (k=MAX_XMIT_FIFO;
		    ((outringptr->count>0) && (k>0));
		    k--)
		    	{
		    	/* pull a char out of the ring.. */
		    	in_char = outringptr->buff[outringptr->tail++];
		    	outringptr->count--;
		    	if (outringptr->tail == outringptr->size)
		    	    outringptr->tail=0;	/* wrap */
		    	/* spit out the character */
		    	_outp(UART_THR, in_char);
		    	/* we don't do anything special if the */
		    	/* character was an XON/XOFF; this may be wrong.*/
		    	} /* for we have chars to send.. */
		/* OK, finally, if there are no more chars to send */
		/* we kill the interrupt. */
		if (KS.p_out_ring->count == 0
			&& ((KS.out_ring->count == 0) | RcvdXoff))
		    	_outp(UART_IER, 
				_inp(UART_IER)&~IER_ETBEI);

		} /* while we can send a character.. */



	    /* deal with the other possibilities.. */
	    switch(UartIntIdent&0xE)	/* the ID bits.. */
		{
		case 0:		/* modem status */
			/* eventually we need to handle this int, but for now */
			/* it should never happen because it isn't enabled. */
			_inp(UART_MSR);	/* ignored */
			break;

		} /* end switch UartIntIdent */
		/* I'd love to EOI here, but the kernel does */
		/* a nonspecific EOI for me...*/
		/* we'll EOI anyway.  */
		_outp(0x20,SERIAL_SPECIFIC_EOI);
	} /* while interrupt pending.. */

} /* SerialHandler() */

void SHPutRing(unsigned char inchar)
{
	        /* we can't call put_ring, because that may call */
	        /* context switch and send us into the weeds. */
	        /* Although the lock_ring and unlock_ring routines */
		/* exist, they don't ever seem to be called. So, */
		/* blindly assume the ring isn't locked. */
		/* remember, interrupts are disabled here.. */
		/* room? */
		unsigned short int k;
		P_RING  rptr;
		/* we clear the KS.idleflag flag, so that the upper levels
		 * can tell when things are quieted enough to send a beep.. */
		KS.idleflag=0;
		rptr = KS.in_ring;
		if ((k=rptr->count) >= rptr->size)
			{
			overflows++;
			return; /* char falls on the floor; no room. */
			}
		rptr->buff[rptr->head++] = inchar;
		rptr->count++;
		if (rptr->head == rptr->size)
			rptr->head=0;	/* wrap*/
		if (k==0)
			{
			/* have to unblock */
			need_rx_unblock++;
			}
}

void SHPutPRing(unsigned char outchar)
{
	/* Always check for room before calling this! */
	/* if there isn't room, the characters end up in the */
	/* bitbucket. */
		P_RING  ringptr;
		unsigned short int temp,k;

		ringptr = KS.p_out_ring;
		if ((k=ringptr->count) >= ringptr->size)
			{
			return; /* char falls on the floor; no room. */
			}
		ringptr->buff[ringptr->head++] = outchar;
		ringptr->count++;
		if (ringptr->head == ringptr->size)
			ringptr->head=0;	/* wrap*/
		if (k==0)
			{
			/* have to unblock */
		    	_outp(UART_IER, _inp(UART_IER)|IER_ETBEI);
			}
}


static unsigned char SHstatbuf[] = {DLE,0x50,0,0,0};
unsigned short int SHSerialUpdate()
{
	unsigned short int temp;
	P_RING pringptr;

	/* queues a status-update sequence, or returns false if not  */
	/* enough room. */
	pringptr = KS.p_out_ring;
	if ((pringptr->size - pringptr->count) < 5)
		return(0);

	/* build a status string. */
	temp=KS.isa_status;
	SHstatbuf[1] = 0x40 | ((temp>>12)&0xf);
	SHstatbuf[2] = (temp>>6)&0x3f;
	if (SHstatbuf[2] < 0x20 )
		SHstatbuf[2] += 0x40;
	SHstatbuf[3] = temp&0x3f;
	if (SHstatbuf[3] < 0x20) 
		SHstatbuf[3] += 0x40;
	for (temp=0;temp<4;temp++)
		SHPutPRing(SHstatbuf[temp]);
	return(1);
}



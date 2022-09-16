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
 *    File Name:	tsr_io.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC I/O support ... this module contains all the interface
 *  code that knows how to talk to a DECtalk module ...
 *
 ***********************************************************************
 *    Revision History:
 * 02oct95	...tek		tidied up the self_test status stuff,
 *				removed the vector field from DTC
 * 16feb96	...tek		merge dtex
 * 07may96  ...cjl		touched with latest 4-8 board fix.
 * 21may96	...tek		fixed dtex "no status" exit code	
 */
/*#define DEBUG*/
                                
#include        "tsr.h"                 /* all other includes are chained out of here */
#include        "tsrp.h"

#ifdef DTEX
#define uartbase (DTC.base)
#define uartvec (DTC.vector)
#endif

/*
 *  find_base() goes and gets the rom vector to determine the module
 *  base address, vector, etc ..
 */
extern int base_found;

extern unsigned int dtbase[], dtvec[];   

void (__interrupt __far *old_int1c)();          /* timer thread */

int dt_status;

#ifndef DTEX /* non-express code */
int find_base()
{
	int     i;
	unsigned char mask;
	unsigned char far *dt_mods;
	
	FP_SEG(dt_mods) = DTPC_TABLE_SEG;
	FP_OFF(dt_mods) = DTPC_TABLE_OFF;

#ifdef DEBUG
	printf("\nTSR_IO-DEBUG find_base: base_found=%d ",base_found);
#endif /*debug*/


	num_modules = 0;
	module_index = 0;
	if (base_found)
		{
		for(i = 0; dtbase[i]; i++)
			{

#ifdef DEBUG
	printf("\nTSR_IO-DEBUG module %d ",i);
#endif /*debug*/

			DTC.base=dtbase[i];
			DTC.config = 0;
			get_status(); /* check to see if anything is really there */
				
			if(verbose && ( (dt_status == MODULE_init)
			               || ((dt_status&0xFF00) == MODULE_self_test)))

				printf("\nFound DECtalk PC module at I/O base address %x.",DTC.base);
	
			if((dt_status != MODULE_init) &&
					((dt_status&0xff00) != MODULE_self_test))
				{
				old_int1c = _dos_getvect((unsigned)0x1c);
				_dos_setvect((unsigned)0x1c, dectalk_timer);
				put_command(MODULE_reset);
				wait_reset();
#ifdef DTPC2
				wait_reset(); /*DTPC2 takes longer.. */
#endif
			   	get_status(); /* check to see if anything is really there */
				_dos_setvect(0x1c, old_int1c);
				}
				
			/* if we're in self-test, might have to wait a little */
			get_status();
			if ((dt_status&0xFF00) == MODULE_self_test)
				{
				printf("\n module in self-test, please wait.");
				old_int1c = _dos_getvect((unsigned)0x1c);
				_dos_setvect((unsigned)0x1c, dectalk_timer);
				wait_reset();
			   	get_status(); /* check to see if anything is really there */
				/* perhaps wait just one more time.. */
				if (((dt_status&0xFF00) == MODULE_self_test))
					wait_reset();
				get_status();
				_dos_setvect(0x1c, old_int1c);
				}
			if(dt_status == MODULE_init)
				{
				num_modules++;
				module_index++;
				}
			else if ((dt_status&0xff00)==MODULE_self_test)
				{
				/* stuck at a self-test .. */
				printf("\nModule at 0x%03x failed self-test; error=0x%04x.",
					DTC.base,dt_status);
				exit(1);
				}
			else
				{
				printf("\nNo module found at explicit I/O base address %x, exiting load.\n", DTC.base );
				exit(1);
				}
			}
			
		module_index=0;
		return(1);
		}
				
	for( i = 0 ;i<4;i++)
		{
		if(
#ifndef DTPC2   /* dtpc2 never uses the config data area. */
		DT_INST(*(dt_mods+i)) || 
#endif /*DTPC2*/
		base_found)
			{
#ifndef DTPC2			  
			DTC.config = dt_mods+i;
			DTC.base = bases[DT_BASE(*DTC.config)];
#endif /*DTPC2*/
			DTC.port = (*dtc[0]).port+module_index;
			DTC.lpt = (*dtc[0]).lpt+module_index;
			if(verbose)
				 printf("\nFound DECtalk PC module at I/O base address %x.",
					DTC.base);
			num_modules += 1;
			module_index += 1;
			}
		}
	module_index = 0;
	if(num_modules == 0)
		{
/*              printf("\nNo modules installed, tsr will not be installed!");*/
		exit(1);
		}
	else if(verbose)
		printf("\nTotal of %d modules installed.",num_modules);
	return(num_modules);
}

/***************************************************************
 *  module i/o routines ... these routines are called under dos and
 *  under tsr control ...
 *******************************************************************/

/*
 *  status from the module is read this way ...
 */

void get_status()
{
	dt_status = (inp(DTC.base+1)<<8) + inp(DTC.base+0);
#ifdef DEBUG
	printf("TSR-IO_get_status: DT_STATUS = 0x%04X\n",dt_status);
	printf(" Port tested: %04x\n",DTC.base);
#endif
}



/*
 *  set_status is used to read the current status register and set
 *  the module status ...
 */

set_status(dtp)
struct dectalk_control *dtp;
{
    /* ...tek 19 may 95 */
    /* changed to allow status to be set even if the "MODE_test" */
    /* bit is set (the flush hack) */
	DTP.status = (inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW);
	if((DTP.status & (MODE_mask& ~MODE_test)) == MODE_status)
		{
		DTP.module_status = DTP.status;
		return(true);
		}
	return(false);
}
	

/*
 *  return 16 bit word of data ...
 */

get_data()
{
	return((inp(DT_DI_HIGH)<<8) + inp(DT_DI_LOW));
}

/*
 *  write a command word to the module ... clear the flag bits in the
 *  status word to allow them to be updated by the isr ...
 */

put_command(cmd)
unsigned int cmd;
{
	DTC.command = cmd;

	set_status(dtc[module_index]);

	outp(DT_CMD_LOW,cmd&0xff);
	outp(DT_CMD_HIGH,((cmd&0xff00)>>8));
	outp(DT_INT,0);

	DTC.max_ticks = (10*DOS_TPS);
	while(((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) & STAT_cmd_ready)
		{
		if(DTC.max_ticks == 0)
			return(TSR_FAILURE);
		}
	outp(DT_CMD_LOW,0);
	outp(DT_CMD_HIGH,0);
	return(TSR_SUCCESS);
}

/*
 *  write 16 bits of data via the two bytes ...
 */

void put_data(data)
unsigned int data;
{
	outp(DT_DO_LOW,data&0xff);
	outp(DT_DO_HIGH,((data&0xff00)>>8));
}

/*
 *  set/reset the psps ...
 */


#else /*DTEX*/ /* express-specific routines.. */

#include        <conio.h>       /* for inp, outp */
#pragma intrinsic(_inp, _inpw, _outp, _outpw)


unsigned char global_busy;	// in-tsr flag..

volatile unsigned char  RcvdXoff; /* Yuck.  */
volatile unsigned short FE_count,PE_count,OE_count,break_count,overflows;
volatile unsigned char          need_xoff_sent;
struct serialring _far inbuf;
struct serialring _far outbuf;
struct serialring _far p_outbuf; // the priority output buffer..
unsigned short int uart_ioport, uart_intvec;
unsigned char handystr[10];

unsigned short dles;
unsigned char localchar;

unsigned char saw_xon, SawAck;
unsigned short int hiwater,lowater;

// status sequence processor stuff..
#define DLE_LEN 4               // how long a DLE seq is, including the DLE.
unsigned short int rcv_in_dle;  // state for the incoming status parser.
unsigned char dle_buff[DLE_LEN]; // space to stash the DLE sequence..

unsigned short max_xmit_fifo=1; /* 1-16; number of tx chars per int. */
					/* must be 1 if no 16550! */




// remember the old serial vector
void (__interrupt __far *oldserialvec)();

int find_base()
{
	int	i;
	unsigned char mask;
	unsigned char far *dt_mods;
	
	FP_SEG(dt_mods) = DTPC_TABLE_SEG;
	FP_OFF(dt_mods) = DTPC_TABLE_OFF;
	
			
/* WARNING: only one module!! */

	num_modules = 0;
	module_index = 0;
	if (verbose)
		{
		printf("\n..trying port 0x%x, vector 0x%x",
			(unsigned short int)dtbase[0],
			(unsigned short int)dtvec[0]);
		printf("\n DTC.status=0x%04x  DTC.module_status=0x%04x ",
			DTC.status, DTC.module_status);
		}
	if (dtbase[0] && dtvec[0])	// non-zero if a base was chosen..
		{

		DTC.base = dtbase[0];
		DTC.vector = dtvec[0];
		DTC.module_status = 0xFFFF; //(to be filled in later..)
#ifdef DEBUG
		if (verbose)
			{
			printf("\n      IRR=0x");
			_outp(0x20,0x3|0x8);
			printf("%02x   ISR=0x",_inp(0x20));
			_outp(0x20,0x2|0x8);
			printf("%02x",_inp(0x20));
			printf("\n      IMR=0x%02x   UART_IER=0x%02x",
				_inp(0x21),    _inp(UART_IER));
			printf("\n UART_IIR=0x%02x   UART_FCR=0x%02x",
				_inp(UART_IIR),_inp(UART_FCR));
			printf("\n UART_LCR=0x%02x   UART_MCR=0x%02x",
				_inp(UART_LCR),_inp(UART_MCR));
			printf("\n UART_LSR=0x%02x   UART_MSR=0x%02x",
				_inp(UART_LSR),_inp(UART_MSR));
			printf("\n CPUflags=0x%04x ",dt_getflags());
			}
#endif //DEBUG
		// fire up the serial port
		if (verbose)
			printf("\n..serial port driver startup..");

		serial_init();
#ifdef DEBUG
		if (verbose)
			{
			printf(" done ");
			printf("\n      IRR=0x");
			_outp(0x20,0x3|0x8);
			printf("%02x   ISR=0x",_inp(0x20));
			_outp(0x20,0x2|0x8);
			printf("%02x",_inp(0x20));
			printf("\n      IMR=0x%02x   UART_IER=0x%02x",
				_inp(0x21),    _inp(UART_IER));
			printf("\n UART_IIR=0x%02x   UART_FCR=0x%02x",
				_inp(UART_IIR),_inp(UART_FCR));
			printf("\n UART_LCR=0x%02x   UART_MCR=0x%02x",
				_inp(UART_LCR),_inp(UART_MCR));
			printf("\n UART_LSR=0x%02x   UART_MSR=0x%02x",
				_inp(UART_LSR),_inp(UART_MSR));
			printf("\n CPUflags=0x%04x ",dt_getflags());

			hitakey();
			}
#endif //DEBUG
		if (verbose)
			printf("\n..sending XON ");

		// send an XON, just to sync up..
		handystr[0]=XON;
		sleep(1);
		p_sendbuf(handystr,1);
		sleep(1);
		if (verbose)
			printf("\n..flushing receiver ");

		// empty out the receive buffer..
		while (peek_inbuf())
			{
			sleep(1);
			while (s_getbuf(handystr,9))
				;
			sleep(1);
			}
		if (verbose)
			printf(" done. ");
		if (peek_outbuf())
			{
			printf("\n?transmit buffer not empty?" );
			hitakey();
			}

		if (verbose)
			{
			printf("\n DLEs:%d status=0x%04x module_status=0x%04x",
			dles, DTC.status, DTC.module_status);
			}

		handystr[0]=0x03;
		p_sendbuf(handystr,1);
		handystr[0]=0x05;
		p_sendbuf(handystr,1);
		sleep(2);

		if (verbose)
			{
			printf("\n DLEs:%d status=0x%04x module_status=0x%04x",
			dles, DTC.status, DTC.module_status);
			}


		if (DTC.status == 0)
			{
			// nobody home. 
			serial_close();
			num_modules=0;
			printf("\n No status response from DECtalk Express. Exiting.");
		     //	_dos_setvect(0x1c,old_int1c);
			exit(1);
			}
		num_modules = 1;
		flush_ring(&inbuf);	// clear out any junk..
		strcpy(handystr,"[:tsr on]");
		p_sendbuf(handystr, strlen(handystr)); /* into tsr mode.. */
		while (peek_outbuf())
			;	/* wait for it to go.. */
		}
				
	// no module specified.
	module_index = 0;
  	if(num_modules == 0)
		{
		printf("\nNo modules installed.\n");
		serial_close();
		exit(1);
		}
          else if(verbose)
		printf("\nTotal of %d modules installed.",num_modules);

	{
	 unsigned short int oldstatus;
	 oldstatus = DTC.status;

	 // send a kernel sync..
	 handystr[0]=DLE;
	 handystr[1]='&';
	 handystr[2]='@';
	 handystr[3]='@';
	 p_sendbuf(handystr,4);


	 // sit and wait for the status to change..
	 for (i=0;i<10000;i++)
		{
		if (DTC.status != oldstatus)
			{
			if (verbose)
				{
				printf("\n DLEs:%d status=0x%04x module_status=0x%04x",
				dles, DTC.status, DTC.module_status);
				}
			break;			
			}
		}
	}
	// DECtalk Express always comes up in the kernel (no ID_boot)
	DTC.id = ID_kernel;

	return(num_modules);
}

/***************************************************************
 *  module i/o routines ... these routines are called under dos and
 *  under tsr control ...
 *******************************************************************/

/*
 *  status from the module is read this way ...
 */

void get_status()
{
	dt_status = DTC.module_status;
}



/*
 *  set_status is used to read the current status register and set
 *  the module status ...
 */

set_status(dtp)
struct dectalk_control *dtp;
{
	unsigned char iflag;	// ...tek 9/16/94 make interrupt-safe
	//	iflag = dt_disable();

	if((DTC.status & MODE_mask) == MODE_status)
		{
		DTC.module_status = DTC.status; // the ISR already did this.
		if (iflag)
	//		_enable();
		return(true);
		}
	//_enable();
	return(false);
}
	

/*
 *  return 16 bit word of data ...
 */

get_data()
{
	return(DTC.data);	//ISR sets this..
}

/*
 *  write a command word to the module ... clear the flag bits in the
 *  status word to allow them to be updated by the isr ...
 */

put_command(cmd)
unsigned int cmd;
{
	// there's a little hackery here for DECtalk express. 
	// The receiver FIFO on DECtak Express is set to trigger
	// at 4 characters; if the fifo isn't up to that level (even
	// if it has 3 chars in it) it will sit four character times
	// waiting for a character before interrupting the CPU. The
	// net effect of this is that it almost always takes an extra 
	// 4ms (at 9600 baud) to process a character. To get around this,
	// we send 3 XONs after the command string. This makes sure that 
	// the last character of the 4-character DLE sequence gets taken
	// 'as quickly as possible' (if you aren't lucky, it will take
	// 3ms; but in the case where the DLE sequence is the only
	// thing you've sent for a while it'll be much faster). 
	// Note that the extra characters don't cost anything other
	// than interrupt overhead on the host, because their sending
	// is overlapped with the receipt of the status update that
	// we always have to wait for anyway..
	unsigned int old_status;

	DTC.command = cmd;

	set_status(dtc[module_index]);
	old_status = DTC.module_status;

	dleoutbuf[0]= DLE;
	dleoutbuf[1]= 0x20 + ((cmd>>12)&0xF);
	dleoutbuf[2]= (cmd>>6)&0x3F;
	if (dleoutbuf[2]<0x20) 
		dleoutbuf[2] += 0x40;
	dleoutbuf[3]= (cmd&0x3F);
	if (dleoutbuf[3]<0x20) 
		dleoutbuf[3] += 0x40;

	// these are here for make sure the DTExpress (which has a FIFO
	// hiwater at 4 characters) gets the whole command immediately.
	dleoutbuf[4]=XON;
	dleoutbuf[5]=XON;
	dleoutbuf[6]=XON;

	// make sure the previous command has completed
	if (wait_cstat(2) == TSR_FAILURE)
		return(TSR_FAILURE);
	//
	// whomp on the status bits to make sure we don't see cmd_ready
	// too early (the target will have to set it..)
	DTC.module_status &= ~STAT_cmd_ready;
	DTC.status = DTC.module_status;

	while(!p_sendbuf(dleoutbuf,7))
		check_is_bit();

	// we'd really like to sit here and watch for CMD_RDY to drop, but
	// if we do that and somebody interrupts us, CMD_RDY could set again
	// before we ever see it drop! So, instead, we'll just sit here until
	// the output buffer is empty.	THis is why we had to whomp the
	// status bits above..

	DTC.max_ticks = (10*DOS_TPS);

	// wait for buffer empty so we know it's been taken.
	while(peek_p_outbuf())
		{
		/* make sure we know we're not ready.. */
		DTC.module_status &= ~STAT_cmd_ready;
		DTC.status = DTC.module_status;
		check_is_bit();
		if(DTC.max_ticks == 0)
			{
			return(TSR_FAILURE);
			}
		}
	set_status(dtc[module_index]);

	return(TSR_SUCCESS);
}

/*
 *  write 16 bits of data..
 */

void put_data(data)
unsigned int data;
{
	dleoutbuf[0]= DLE;
	dleoutbuf[1]= 0x30 + ((data>>12)&0xF);
	dleoutbuf[2]= (data>>6)&0x3F;
	if (dleoutbuf[2]<0x20) 
		dleoutbuf[2] += 0x40;
	dleoutbuf[3]= (data&0x3F);
	if (dleoutbuf[3]<0x20) 
		dleoutbuf[3] += 0x40;
       do
		{
		check_is_bit();
		}
	while (!p_sendbuf(dleoutbuf,4));

	return;

}



// handy utility routines..
unsigned short int set_baud(baudrate)
unsigned short int baudrate;
{
	/* set the baudrate to one of the standard values. */
	/* in theory, we could set it to anything we wished, */
	/* but a bogus baudrate is likely due to an error and */
	/* that would leave us in the weeds.. */
	/* this is going to happen immediately; if there are */
	/* characters coming or going, expect errors. */
	unsigned char oldLCR;
	unsigned short int brd=0,flags;
	switch (baudrate)
	    {
	    case 110:
		brd=1047;
		break;
	    case 300:
		brd=384;
		break;
	    case 600:
		brd=192;
		break;
	    case 1200:
		brd=96;
		break;
	    case 2400:
		brd=48;
		break;
	    case 4800:
		brd=24;
		break;
	    case 9600:
		brd=12;
		break;
	    case 19200:
		brd=6;
		break;
	    default:
		return (-1);
	    }
	_disable();     // don't bug me, man.. 
	oldLCR = _inp(UART_LCR);
	_outp(UART_LCR, oldLCR|LCR_DLAB);
	_outp(UART_THR, (unsigned char)(brd&0xff));
	_outp(UART_IER, (unsigned char)((brd>>8)&0xff));
	/* put everything else back.. */
	_outp(UART_LCR, oldLCR);
	_enable();

	return(0);
}

short int set_format(bitsper,parity,stop)
unsigned char bitsper,parity,stop;
{
	/* build the config word here.. */
	unsigned char config = 0;
	switch(bitsper)
	    {
	    case BPC_5:
		break;
	    case BPC_6:
		config |= BIT0;
		break;
	    case BPC_7:
		config |= BIT1;
		break;
	    case BPC_8:
		config |= BIT0|BIT1;
		break;
	    default:
		return(-1);
	    }
	switch(parity)
	    {
	    case PARITY_EVEN:
		config |= BIT3|BIT4;
		break;
	    case PARITY_ODD:
		config |= BIT3;
		break;
	    case PARITY_NONE:
		/* Nothing gets set.. */
		break;
	    case PARITY_0:
		config |= BIT3|BIT4|BIT5;
		break;
	    case PARITY_1:
		config |= BIT3|BIT5;
		break;
	    default:
		return(-2);
	    }
	// write it to the uart..
	_outp(UART_LCR,config);

}

void flush_ring(struct serialring _far *ring)
{
	ring->head = 0;
	ring->tail = 0;
	ring->count = 0;
}

void un_xoff(void)
{
	// clear the serial port xoff state.
	RcvdXoff = 0;
	// turn on the tx interrupt and let the ISR turn it off
	//if there are no characters.
	_outp(UART_IER,_inp(UART_IER)|IER_ETBEI);

}
unsigned short sense_xoff(void)
{
	return(RcvdXoff);
}

// clear_ack and get_ack are routines used to sense the return of an 
// acknowledge (SOH, ^a in our case) from a ^c flush. The ISR swallows
// ^a's normally to keep them from getting to the application, so we
// need to detect them in the ISR and use a flag  
// accessed through these routines to work with it.
unsigned char clear_ack(void)
{
	unsigned char temp;
	temp = SawAck;
	SawAck = 0;
	return(temp);
}
unsigned char get_ack(void)
{
	unsigned char temp;
	temp = SawAck;
	return(temp);
}
unsigned char delayed_global_busy=0; 	// sticky bit, to make sure we
					// always run *after* the TSR
					// is done with its work..
void check_is_bit(void)
{
	// check to see that we haven't been left with a pending interrupt,
	// and deal appropriately
	unsigned char temp, iflag;

	// we only do things if the TSR is active..
	if (global_busy || delayed_global_busy)
		{
		iflag = dt_disable();
		// if the IR bit is set in the uart, service it..
		temp = _inp(UART_LSR);
		if ( ((_inp(UART_IIR) & 0x1) == 0) 	// int ID
		    || (temp & LSR_DR)			// or data ready
		    || (temp & LSR_TEMT) )		// or Tx empty
			{
			// make sure the IIR is valid (I don't understand
			// why I have to do this..)
			temp = _inp(UART_IER);
			_outp(UART_IER,0);
			_outp(UART_IER,temp);
			do_serial_int();
			}

		if (iflag != 0)
			_enable();
		}
	if (!global_busy)
		delayed_global_busy=0;
	    else
		delayed_global_busy=1;

}


// unmask an interrupt controller channel
void enable_int(unsigned short int vec)
// vec is the vector, e.g. IRQ3 would pass in 0xB.
{
	unsigned short int temp, temp2;
	temp = vec-0x8;
	if (temp>8)
		return; //bad vector; 
	temp = ~(1 << temp); // make it a bit
	temp2 = _inp(0x21);
	temp2 = temp2 & temp; // clearing a bit unmasks.
	_outp(0x21, temp2);
	return;
}
void disable_int(unsigned short int vec)
// vec is the vector, e.g. IRQ3 would pass in 0xB.
{
	unsigned short int temp, temp2;
	temp = vec-0x8;
	if (temp>8)
		return; //bad vector; 
	temp = 1 << temp; // make it a bit
	temp2 = _inp(0x21);
	temp2 = temp2 | temp; // setting a bit masks.
	_outp(0x21, temp2);
	return;
}


unsigned short int dt_disable(void)
{
	// disable interrupts, return true (nonzero) if the 
	// int flag was set.
	unsigned short int temp;
	temp = dt_getflags();
	temp &= BIT9;
	_disable();
	return((temp != 0) ? 1 : 0);
}

	
unsigned short int dt_getflags(void)
{
	// return the flags..
	unsigned short int temp;
	__asm
		{
		pushf
		pop     ax
		mov     temp,ax
		}
	return(temp);
}

		

/*
 * serial_init is used to set up the serial port before things
 *  fires up, so that we can at least que characters to the line..
 */

void _far serial_init()
{
/*
 *  init the serial port.
 */

	unsigned short int temp;
// this is debug junk.
	struct serialring _far *pibuf;
	struct serialring _far *pobuf;
	struct serialring _far *ppbuf;
	pibuf = &inbuf.head;
	pobuf = &outbuf.head;
	ppbuf = &p_outbuf.head;



// set up some globals..
uart_ioport = uartbase;
uart_intvec = uartvec;


inbuf.size=RINGSIZE;
outbuf.size=RINGSIZE;
p_outbuf.size=RINGSIZE;

dles=0;

flush_ring(&inbuf);
flush_ring(&outbuf);
flush_ring(&p_outbuf);

/**/
#ifdef DEBUG
printf("\n in=%04x:%04x  out=%04x:%04x  p=%04x:%04x ",
FP_SEG(pibuf),FP_OFF(pibuf),FP_SEG(pobuf),FP_OFF(pobuf),
FP_SEG(ppbuf),FP_OFF(ppbuf));
#endif //DEBUG

rcv_in_dle=0;   // init the isr-level parser..

// precalculate the xon/xoff points..

hiwater = (((inbuf.size-16)*2)/3); // xoff at 2/3 full.
lowater = ((inbuf.size-16)/3);  // xon at 1/3 full.



/* connect the interrupt */
	oldserialvec = _dos_getvect(uartvec);
	_dos_setvect(uartvec, SerialHandler);


/* set up the default format */
	set_baud(DEFAULT_BAUDRATE);
	set_format(DEFAULT_BITSPERCHAR,DEFAULT_PARITY,DEFAULT_STOP);

/* flush and enable the FIFOs, rcv trigger at RCV_HIWATER chars. */
	_outp(UART_FCR, 
		FCR_ENABLE | FCR_CLR_RCV | FCR_CLR_XMT | RCV_HIWATER_ENC);
	


/* at this point, we can detect whether we have a 16550.. */
	temp = _inp(UART_IIR);
	if ((temp&0xC0) == 0xC0)
		{
		max_xmit_fifo=4;
		printf("\n 16550 com port detected. ");
		}                               

	RcvdXoff=0;
	need_xoff_sent=0;
	saw_xon=0;

/* clear the error counts */
	break_count=0;
	OE_count=PE_count=FE_count=0;
	overflows=0;

// send an xon..
	_outp(UART_THR, XON);


/* enable the interrupts */
	_outp(UART_IER, IER_ERBI | IER_ETBEI);
	_outp(UART_MCR, _inp(UART_MCR) | MCR_OUT2);


/* and finally unmask the interrupt controller.. */
	enable_int(uart_intvec);


} // serial_init()


void serial_close(void)
// shuts down the interrupt handler and removes the vectors.
{
	disable_int(uart_intvec); // kill the interrupt..
	_dos_setvect(uart_intvec,oldserialvec); // the old handler.

	_outp(UART_IER, 0);
	_outp(UART_MCR, _inp(UART_MCR)&(~MCR_OUT2));


	// that's all, folks!
} // serial_close();


unsigned short int s_sendbuf(unsigned char far *bufptr,unsigned short int count)
{
	// send the characters pointed to by bufptr. Return the actual
	// count of characters sent.
	unsigned short int actual, iflag, i, space, gone;
	int remaining;


	// have to kill ints here.
	iflag = dt_disable();
	// get the amount of space remaining..
	remaining = outbuf.size - outbuf.count; 
	if (remaining <= 5)
		{
		if (iflag)
			_enable();
		return(0); // no room left. For anything.
		}
	   else
		space = remaining - 5;

	// pick the smaller of count and space..
	if (space<count)
		actual=space;
	  else
		actual=count;
	for (i=outbuf.head,gone=0;(gone)<actual;gone++)
		{
		if (i>=outbuf.size)
			i=0;    // wrap pointer
		outbuf.buff[i++] = bufptr[gone];
		} // for i
	// update the count..
	outbuf.count += (gone);
	// and the pointer..
	outbuf.head = i;
	// perhaps turn on the interrupt..
	if ((actual!=0))
		{
		
		_outp(UART_IER,_inp(UART_IER)|IER_ETBEI);
		}

	// turn on ints, if they were on at entry..
	if (iflag)
		_enable();


	return(gone);

}       //s_sendbuf

unsigned short int p_sendbuf(unsigned char far *bufptr,unsigned short int count)
{
	// send the characters pointed to by bufptr. Return the actual
	// count of characters sent. Note that we either transfer the
	// whole buffer, or nothing. This allows us to keep control
	// sequences atomic.

	unsigned short int actual, iflag, i, space, gone;



	// have to kill ints here.
	iflag = dt_disable();
	// get the amount of space remaining..
	space = (p_outbuf.size - p_outbuf.count) - 1;
	// pick the smaller of count and space..
	if (space<count)
		{
		if (iflag)
			_enable();
		return(0);
		}

	actual=count;
	
	for (i=p_outbuf.head,gone=0;gone<actual;gone++)
		{
		if (i>=p_outbuf.size)
			i=0;    // wrap pointer
		p_outbuf.buff[i++] = bufptr[gone];
		} // for i
	// update the count..
	p_outbuf.count += actual;
	// & pointer..
	p_outbuf.head = i;

	// perhaps turn on the interrupt..
	if (actual!=0)
		{
		_outp(UART_IER,_inp(UART_IER)|IER_ETBEI);
		}

	// turn on ints, if they were on at entry..
	if (iflag)
		_enable();

	return(actual);

}       //p_sendbuf

unsigned char c_xon = XON;

unsigned short int s_getbuf(unsigned char far *bufptr, unsigned short int count)
{
	// returns up to count characters from the serial in_buffer in the 
	// buffer pointed to by bufptr.

	// because this gets called a lot, it really should be careful about
	// how long it keeps ints off; worry about that for the shipping version,
	// I guess..

	unsigned short int iflag, actual, gone, i, countwas;
	 
	iflag = dt_disable();   // ints off.
	// remember this, to make sure we get the xon out..
	countwas = inbuf.count;

	// calculate how many will be fetched.
	if (inbuf.count > count)
		actual=count;
	  else
		actual=inbuf.count;
	//ok, this is getting dicey..
	// If this is going to need an XON sent (because we've dropped below
	// the low-water point) AND there is enough room in the priority
	// output que to fit it, we'll take the characters. IF we need to send
	// an XON but there isn't any room, then we won't take *any* characters!
	// this implies that you could do a peek_inbuf and see a lot of stuff,
	// but get a 0 count back from this anyway. 
	// I might not have to do this, but I need to make sure that the XON
	// gets out eventually. This seems the most bullet-proof way (I may be
	// wrong here..)
	if ((count>=lowater) && ((count-actual)<lowater))
		{
		// need an XON..
		// see if there's room..
		if (p_outbuf.count < (p_outbuf.size-5))
			{
			p_sendbuf(&c_xon,1); // send the XON..
			}
		  else
			{
			if (iflag)
				_enable();
			return(0);      // try again later.
			}
		}

	// move 'em along..
	for (i=inbuf.tail,gone=0;gone<actual;gone++)
		{
		if (i>=inbuf.size)
			i=0;    // wrap pointer
		bufptr[gone] = inbuf.buff[i++];
		} // for i      
	// count update..
	inbuf.count -= actual;
	inbuf.tail = i;

	// maybe turn ints on..
	if (iflag)
		_enable();
	return(actual);
} //s_getbuf

unsigned short int peek_outbuf()
{
	// just returns the used space in the output buffer

	unsigned short int iflag, temp;

	// this *shouldn't* word-tear, but just to be safe we'll
	// read the count with ints off.
	iflag = dt_disable();
	temp = outbuf.count;
	if (iflag)
		_enable();

	return(temp);
} // peek_outbuf

unsigned short int peek_p_outbuf()
{
	// just returns the used space in the output buffer

	unsigned short int iflag, temp;

	// this *shouldn't* word-tear, but just to be safe we'll
	// read the count with ints off.
	iflag = dt_disable();
	temp = p_outbuf.count;
	if (iflag)
		_enable();

	return(temp);
} // peek_outbuf

unsigned short int peek_inbuf()
{
	// see what's in the input buffer. Might be more by the 
	// time you get around to pulling them, but this is a quick
	// way to poll for data if it's not likely there will be any..
	// in the event that there's a need to send an XON, you might 
	// get back >0 from this but still get a 0 back from s_sendbuf;
	// so *ALWAYS* check the return status from s_sendbuf!!

	unsigned short int iflag, temp;

	// again, overprotecting against word-tearing..
	iflag = dt_disable();
	temp = inbuf.count;
	if (iflag)
		_enable();

	return(temp);
} // peek_inbuf


void __interrupt __far  SerialHandler()
{
	/* get here on a serial line interrupt. */
	/* hopefully, ints are off at this point, */

	do_serial_int();

// the EOI..
_outp(0x20,0x20);


} /* SerialHandler() */



void do_serial_int(void)
{

	// First, looks for receive characters and stashes them away.
	// then, selects the output stream based on whether there are any
	// characters in the priority outbuf and, if possible, sends one
	// on it's way.

	/* right now, this is purely XonXoff, but the DTR line is asserted */
	/* in case the host need it asserted to do anything. Eventually, the */
	/* DSR/DTR lines should be handled for hardware flow control.. */



unsigned char UartLineStatus, UartIntIdent;


unsigned char k, in_char, need_rx_unblock=0;

struct serialring _far *outptr;

    need_xoff_sent=0;


    while( ( ((_inp(UART_IIR)) & 0x1) == 0) // while an int
	   || ((k=_inp(UART_LSR)) & LSR_DR) )
       {
       last_int_tick = dt_ticks;

	/* spin and yank all the characters that are in the */
	/* fifo.. */
	while ( (UartLineStatus=_inp(UART_LSR)) & LSR_DR)
	    {
	    unsigned char in_char;
		if (UartLineStatus
		 & (LSR_BREAK|LSR_OE|LSR_PE|LSR_FE))
			{
			// if we get any error while we're parsing a DLE
			// sequence, we have to (a) stop processing it, and
			// (b) request another status update.
			if (rcv_in_dle)
				{
				rcv_in_dle=0;   // reset the parser.
				localchar=0x05; // ENQ
				p_sendbuf(&localchar,1);
				}
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
			    if (UartLineStatus &LSR_OE)
				OE_count++;
			    if (UartLineStatus &LSR_PE)
				PE_count++;
			    if (UartLineStatus &LSR_FE)
				FE_count++;
			    /* toss the character */
			    _inp(UART_RBR);
			    continue;
			    }
			} // It was an error.
		/* pull the character.. */
		in_char = _inp(UART_RBR);
		// deal with controls separately
		    if (in_char < ' ')
			{
			if (in_char == SOH)
				{
				SawAck |= 1;	// set the ack flag
				continue;  	// toss the character
				}
			// careful; any chars below ^e have to go above
			// this clause..
			if (in_char <= ENQ)
			  {
			  // just toss the character.
			  continue;
			  }


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
			if (in_char == DLE)
			  {
			  // start of a DLE sequence. They don't nest, so 
			  // bash the pointer back.
			  rcv_in_dle = 0;
			  dles++;
			  dle_buff[rcv_in_dle++] = in_char;
			  continue; // that's it for this char..
			  }
			} // it was a control.
		// see if we're in a DLE sequence or not..
		if (rcv_in_dle)
			{
			// put the character into the buffer.
			dle_buff[rcv_in_dle++] = in_char;
			// see if it's complete and we need to do
			// a status update
			if (rcv_in_dle == DLE_LEN)
				{
				// the only thing that ever happens is a status
				// update or a buffer update. Do the right thing.
				// we only handle inbound status messages..
				if ((dle_buff[1] & BIT5) == 0)
					{
					// assemble the data word.
					unsigned short int temp;
					temp=0;
					temp |= (dle_buff[1]&0xF)<<12;
					temp |= (dle_buff[2]&0x3f)<<6;
					temp |= (dle_buff[3]&0x3f);
					if (dle_buff[1] & BIT4)
						{
						DTC.data=temp;
						}
					  else
						{
						DTC.status=temp;
						if ((temp & MODE_mask)
						    == MODE_status)
						   DTC.module_status=temp;
						}
					}
				rcv_in_dle = 0; // all done with the dle
				}
			continue;
			} // we were in a DLE sequence.

		/* if we got this far, it's just a character.. */

		/* remember, interrupts are disabled here.. */
		/* room? */
		if (inbuf.count >= inbuf.size)
			{
			overflows++;
			continue; /* char falls on the floor; no room. */
			}
		inbuf.buff[inbuf.head++] = in_char;
		inbuf.count++;
		if (inbuf.head == inbuf.size)
			inbuf.head=0;   /* wrap*/
		if (inbuf.count>hiwater)
			need_xoff_sent++; /* ask for stop. */


	    } /* while rcv chars exist */


		/* if we saw an XON, make sure the TX interrupt is on. */
		if (saw_xon)
		    {
		    _outp(UART_IER, _inp(UART_IER)|IER_ETBEI);
		    saw_xon=0;
		    }
		if (need_xoff_sent)
			{
			localchar=XOFF;
			p_sendbuf(&localchar,1);
			need_xoff_sent=0;
			}

	    /* if we're xoff'd, we just clear the tx interrupt  enable. */
	    if (RcvdXoff
		&& (p_outbuf.count == 0))
		{
		_outp(UART_IER, 
			_inp(UART_IER)&~IER_ETBEI);
		/* and we can't do anything else. */
		continue;
		}
	    // RcvdXoff sez we can send; holding register empty
	    // tells us whether there is room.
	    if (
		((RcvdXoff == 0) || (p_outbuf.count != 0))
		&& (_inp(UART_LSR)&LSR_THRE))
		{
		/* now, if we're not XOFF'd and didn't need to deal */
		/* sending an xoff, we can start pumping characters. */
		/* we load in up to MAX_XMIT_FIFO chars before we */
		/* quit; this can be as large as 16 (well, 14 to  */
		/* allow room for an xoff or two), but probably */
		/* wants to be more like 6 to make sure the we don't */
		/* choke the host if we're just at its receive */
		/* buffer limit */ 
		// decide which ring we want to pull characters from.. 
		if (p_outbuf.count > 0)
			outptr = &p_outbuf;
		   else
			outptr = &outbuf;

		for (k=max_xmit_fifo;
		    ((outptr->count>0) && (k>0));
		    k--)
			{
			/* pull a char out of the ring.. */
			in_char = outptr->buff[outptr->tail++];
			outptr->count--;
			if (outptr->tail == outptr->size)
			    outptr->tail=0;     /* wrap */
			/* spit out the character */
			_outp(UART_THR, in_char);
			/* we don't do anything special if the */
			/* character was an XON/XOFF; this may be wrong.*/
			} /* for we have chars to send.. */
		    /* if there are no more chars to send */
		    /* we kill the interrupt.. */
		    if ((p_outbuf.count == 0)
			&&(outbuf.count == 0 || RcvdXoff))
			_outp(UART_IER, 
			    _inp(UART_IER)&~IER_ETBEI);

		} // if we can send a character..

     	/* if there are no more chars to send */
    	/* we kill the interrupt. Do this here, because there are a couple places
    	/* where we could have run out of characters.. */
	/* I think. .. ? */
    	if (
		((k=_inp(UART_IER))&IER_ETBEI)
		&& ((outbuf.count == 0) && (p_outbuf.count == 0))
       	)
		_outp(UART_IER, 
			k&~IER_ETBEI);
	// dummy read to clear modem status ints..
	_inp(UART_MSR); /* ignored */


	} /* while interrupt pending.. */


}

void hitakey()
{
	printf("\n hit a key to continue..");
	fflush(stdout);
	while (!(_kbhit()))
		;
	// pull the character.. 
	_getch();
}



#endif/*dtex*/

unsigned int getpsp(void)
{
	tsr_regs.h.ah = GET_PSP_DOS3;
	_intdos(&tsr_regs,&tsr_regs);
	return(tsr_regs.x.bx);
}

void setpsp(unsigned int new_psp)
{

	tsr_regs.h.ah = SET_PSP;      
	tsr_regs.x.bx = new_psp;          /* pass segment value to set     */
	_intdos(&tsr_regs,&tsr_regs);
}



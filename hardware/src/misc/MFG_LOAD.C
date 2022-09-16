/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995, 1996, 1999. All rights reserved.
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
 *    File Name:	mfg_load.c
 *    Author:		Tom E. Kopec
 *    Creation Date:24-MAY-1994
 *
 *    Functionality:
 *		DECtalk Express ROM code loader/blaster. 
 *
 ***********************************************************************
 *    Revision History:
 *
 *
 * 24 May 94	...tek		initial
 * 24 jun 94	...tek		modified for the 3-step fastload blast.
 * 03 nov 94	...tek		added -s[low] to force 9600 baud, 
 *				added pauses in the log dumping.
 * 04 nov 94    ...tek          added -f[ast], default to 9600 if
 *                              no 16550.
 * 18 may 96	...tek		added update of load rate
 * 25 jun 96	...cjl		added DEFINEs for all exit codes & main exit.
 * 26 jan 99    ...tek/cjl      added fix for zero load time math error crash.
 *
 * 
 * 1.) set up the serial port for 9600 8n1
 * 2.) check to see if there is a DECtalk Express attached to it.
 * 3.) force the DE into it's console.
 * 4.) send the command to set the DE console to 56Kbaud
 * 5.) set the serial port to 56Kbaud
 * 6.) see if the console responds (if not, go back to 9600)
 * 7.) fill memory with 0 (FD 0 E8000 \n 0\n)
 * 8.) wait for Cmd>
 * 9.) set up load base (load 0\n)
 * 10.) wait for Cmd>
 * 11.) while still chars in the load file
 *      a) if needed, load another 32K of the file & update
 *         %done display
 *      b) send a line, emptying the rx buffer as needed and
 *         looking for ?
 *      c) continue emptying rx buffer until i) timeout
 *                                           ii) >
 *         watching for ? all along.
 * 12.) start the rom reblast (RB\n)
 * 13.) wait for :
 * 14.) say yes (Y)
 * 15.) slurp in (& log) rx characters and update status (with timeout)
 *      until (some character defining end of load) seen
 * 16.) wait for (& log) "running." with timeout
 * 17.) send ^E
 * 18.) wait for ^P
 *      
 */ 

unsigned char copyright[]="Copyright (c)1994 Digital Equipment Corporation";

#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <io.h>
#include "bits.h"
#include "ser_tsr.h"



#define DLE     (16)
#define ENQ     (5)

/* 25 jun 96	...cjl
 *		added DEFINEs for all exit codes.
 *		SymbolName	ExitValue OldValue
 */
#define EXPRSOK		0	/*		   x */
#define	BADARGS		1   /*		  64 */ 
#define PORTUSED	2	/*		 128 */ 
#define BADPORT		3	/*		 256 */ 
#define BADCONSL	4	/*		1024 */ 
#define BADPGM		5	/*		2050 */ 
#define LOSTCONCT	6	/*		2048 */ 
#define BADLOAD		7	/*		2049 */ 

#pragma intrinsic(_inp, _outp)


clock_t start;
time_t began_load, done_load;

unsigned short flag16550 = 0;	// do we have a fast uart?

unsigned short int uart_ioport;
FILE *infile;
unsigned char infilename[3][_MAX_PATH+1], fullfilename[_MAX_PATH+1];

long filesize;

#define HANDYLEN 1024
unsigned char handystr[HANDYLEN] = "";
#define RINGLEN 1024
unsigned char ringbuff[RINGLEN];
unsigned int head=0, tail=0, count=0;

#define USERBUFFSIZE	(32*1024L)
unsigned char userbuff[USERBUFFSIZE];

unsigned long int cur_baud;
float	time_factor;


// handy utility routines..

void load_file(unsigned char *infilename, unsigned short fatal);


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
	    case 38400:
		brd=3;
		break;
	    case 57600:
		brd=2;
		break;
	    default:
		return (-1);
	    }
	_disable();	// don't bug me, man.. 
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

unsigned char send_deport(unsigned char *string, unsigned short int wait)
{
        // send a string out the port. Suck in and log the chars received
        // in ringbuff. If we ever see a ?, return ?; else if we see > after
        // sending the string, bail out and return >; else return the last
        // char we saw after (wait/4) seconds.
        unsigned int i, j, gotsome;
        unsigned char inchar;
        clock_t start, end;

        unsigned int saw_quest=0, done=0;

	gotsome = 0; // flag to make sure we actually get a new character..

        end = wait*(CLOCKS_PER_SEC/4);

        start = clock();
        i = 0;
        while (string[i] != '\0' && clock()-start < end && !done)
                {
                while(_inp(UART_LSR)&LSR_DR)    // suck in characters..
                        {
			unsigned char linchar;
                        linchar=_inp(UART_RBR);
                        if (linchar == '?')
                                saw_quest++;
			ringbuff[head] = linchar;
                        if (++head >= RINGLEN)
                                head=0;
                        if (count<RINGLEN)
                                count++;
			
                        }
                if (_inp(UART_LSR)&LSR_THRE)
                        {
	                _outp(UART_THR,string[i++]);
                        if (flag16550)
                                {
                                j=0;
                                while ( (string[i] != '\0') &&
                                        (j++ < 6) )
                                        {
                                        _outp(UART_THR,string[i++]);
                                        }
                                }
                        }
                }
        // now wait around for the '>' ...
        while ((!done) && (clock()-start < end))
                {
                while(!done && _inp(UART_LSR)&LSR_DR)    // suck in characters..
                        {
			unsigned char linchar;
			gotsome++;
                        linchar=_inp(UART_RBR);
                        if (linchar == '?')
                                saw_quest++;
                        if (linchar == '>')
                                done++;
                        ringbuff[head] = linchar;
                        inchar = linchar;
                        if (++head >= RINGLEN)
                                head=0;
                        if (count<RINGLEN)
                                count++;
                        }
                }
        if (saw_quest)
                return('?');
        if (gotsome)
		return(inchar);
	   else
		return(0);

}// send_deport

#define SCREENLINES	(20)	// lines between pauses..

void de_printlast(unsigned int howmany)
{
        // print up to the last <howmany> characters received.

	unsigned int actual,lfs;
	unsigned char thechar;

	lfs = 10; // count the newlines, so that we can pause printing.
		 // start the count >0, so that the message prior to
		 // this call doesn't scroll off the screen..
        if (howmany>count)
                actual=count;
            else
                actual=howmany;

        if (head>actual)
                tail = head-actual;
            else
                tail=RINGLEN-(actual-head);
        // spit 'em out..
        while(actual)
                {
		thechar = ringbuff[tail++];
		if ((thechar == '\r') || (thechar == '\n'))
			{
			lfs++;
			if (lfs > SCREENLINES)
				{
				printf("\n  Hit any key to continue.. ");
				while (!kbhit())
					;
				getch(); // toss the character..
				lfs=0;
				}
			}
		putchar(thechar);
                if (tail>=RINGLEN)
                        tail=0;
                actual--;
                }


}// de_printlast

void clean_up(void)
{   // what we do when we're done..
    fclose(infile);
}

unsigned char busysig[] = {"|/-\\"};

// the real code..

unsigned char help_string[]="de_load comport file1name file2name file3name [-sf]";
unsigned int portaddr[4] = { 0x3f8, 0x2f8, 0x3e8, 0x2e8 };
unsigned char portname[4][5] = { "COM1", "COM2", "COM3", "COM4" };
unsigned char consolestring[3][5] = { {DLE,'&','@','@','\0'},
				     {DLE,'*','@','@','\0'} };
unsigned char crstring[]="\r";

	unsigned int port;
	unsigned char j, k;
	unsigned long int	outptr, inptr;
	unsigned long bytes_read, total_bytes, bytes_left, lines;
	float f_fsize,f_baud,f_bytes;
	clock_t tstart,tend;

int main(int argc,char *argv[])
{
	int	argp;
	unsigned short i;
	unsigned short fast, fastflag=0, slowflag=0;

	printf("%s\n",copyright);

	if ( (argc != 5) && (argc != 6) )
	    {
	    printf("%s\n",help_string);
	    exit(BADARGS);    /* was 64 */
	    }

	port = atoi(argv[1])-1;
        if (port<0 || port>3)
                {
                printf("Bad argument %s\n",argv[1]);
                printf("%s\n",help_string);
                exit(BADARGS);       // 64 = caller error.
                }
	uart_ioport = portaddr[port];
	for (i=0;i<3;i++)
	   strncpy(infilename[i],argv[2+i],_MAX_PATH);

        printf("Using port %s at 0x%03x\n",
        portname[port], uart_ioport);

	if (argc == 6)		// if there is a trailing arg..
		{
		if (argv[5][0] != '-')
			{
			// command line junk.
	                printf("Bad switch %s\n",argv[5]);
        	        printf("%s\n",help_string);
                	exit(BADARGS);       // 64 = caller error.
			}
		switch (argv[5][1])
			{
			case 's':	// force slow mode..
			case 'S':
				slowflag = 1;
				break;
			/**/
                        case 'f':
                        case 'F':
                                fastflag = 1;
                                break;
                        /**/
			default:
	                	printf("Bad switch %s\n",argv[5]);
        	        	printf("%s\n",help_string);
                		exit(BADARGS);       // 64 = caller error.
			/**/
			} // end switch
		}

        // make sure the port isn't in use..
        if (_inp(UART_IER)&IER_ERBI)
                {
                printf(" ?? port in use? make sure DT_DRIV is un-installed.\n");
                exit(PORTUSED); /* was 128*/
                }

        // see if there is a DECtalk Express out there..
        set_baud(9600);
        set_format(BPC_8,PARITY_NONE,0);
        cur_baud = 9600;

	 // try looking for a '>', on the off chance that this is a 
	 // wicked old board or this is a second try..
	 k = send_deport("\r",1);
	 k = send_deport("\r",1);

	 if (k != '>')
	   {
          start = clock();
          while (clock()-start <  2*CLOCKS_PER_SEC)
                {
                if (_inp(UART_LSR)&LSR_THRE)
                        {
                        _outp(UART_THR,ENQ);
                        break;
                        }
                }
          if (clock()-start > 2*CLOCKS_PER_SEC)
                {
                printf(" ?? Could not send a character via port %s\n",
        	        portname[port]);
                exit(BADPORT);  /* was 256 */
                }

          // look for a DLE in return..
          start = clock();
          while (clock()-start <  2*CLOCKS_PER_SEC)
                {
                if (_inp(UART_LSR)&LSR_DR)
                        {
                        j = _inp(UART_RBR);
                        if (j == DLE)
                            break;
                        }
                }
          if (clock()-start > 2*CLOCKS_PER_SEC)
                {
                printf(" ?? No DECtalk Express found on port %s\n",
        	        portname[port]);
                exit(BADPORT); /* was 256 */
                }

          printf("DECtalk Express connected.\n");

          // .. flush any remaining characters..
          start=clock();
          while(clock()-start < 2*CLOCKS_PER_SEC)
                {
                if (_inp(UART_LSR)&LSR_DR)
                        _inp(UART_RBR);
                }

          // fly back to the console..
	   k = send_deport(consolestring[0],1); // this shouldn't give a '>'
	   k = send_deport(consolestring[1],2); // this will.

          // .. flush any remaining characters while giving the console
          // time to come up.
          start=clock();
          while(clock()-start < 2*CLOCKS_PER_SEC)
                {
                if (_inp(UART_LSR)&LSR_DR)
                        _inp(UART_RBR);
                }

          k = send_deport(crstring,1);
          if (k != '>')
                {
                printf(" ?? couldn't activate DECtalk Express console \n");
                exit(BADCONSL); /* was 1024 */
                }
	   }
	// see if we have a 16550 out there..
	flag16550 = 0;
	/* flush and enable the FIFOs */
	_outp(UART_FCR, 
		FCR_ENABLE | FCR_CLR_RCV | FCR_CLR_XMT);

	if ((_inp(UART_IIR)&0xC0) == 0xC0)
		{
		flag16550=1;
		printf("\n 16550 com port detected. ");
		}                               

	// now, decide what speed to use..
	if (fastflag)
		{
		printf("\n forcing 57600 baud ");
		fast = 1;
		}
	if (slowflag)
		{
		printf("\n forcing 9600 baud ");
		fast = 0;
		}
	if ( (fastflag|slowflag) == 0)
		{
		if (flag16550)
			fast = 1;
		    else
			fast = 0;
		}



	if (fast)
	    {
	    // try to set the console to 56Kbps and see what happens..

	    k = send_deport("c b57600\r",1);
	    // now change the host (our) baud rate and see if it worked.
	    set_baud(57600);
	    cur_baud=57600;
            // .. flush any remaining characters..
            start=clock();
            while(clock()-start < 2*CLOCKS_PER_SEC)
                {
                if (_inp(UART_LSR)&LSR_DR)
                        _inp(UART_RBR);
                }
	    // see if it's there.. 
	    k = send_deport("\r",1);
	    if (k != '>')
		{
		cur_baud=9600;
		set_baud(9600);
		send_deport("\r",1);
		}
	    } // if (fast)


	printf(" using %ld baud\n",cur_baud);

	// figure out the load time constant..
	if (cur_baud==9600)
		time_factor=(1.5e-3)/60;
	if (cur_baud==57600)
		time_factor=(4.8e-4)/60;

        // fill memory
        k = send_deport("FD 0 E8000\r0\r",4);
        if (k != '>')
                {
                printf(" ?? target memory fill failed. Log:\n");
                de_printlast(30);
                exit(BADCONSL); /* was 1024 */
                }
        printf("Memory scrubbed\n");

        k = send_deport("LOAD 0\r",1);
        if (k != '>')
                {
                printf(" ?? target load offset failed. Log:\n");
                de_printlast(30);
                exit(BADCONSL); /* was 1024 */
                }

	// here's where we actually load the files. The sequence is:
	// load the first file (mon.hex).
	// load the second file (fastload.hex).
	// do a G 90000 to start the fast loader.
	// load the third file. 
	// X out of the fast loader.
	// the two hex files can recover from data errors; the FLR can't.
	load_file(infilename[0],FALSE);
	load_file(infilename[1],FALSE);
	send_deport("g 90000\r",1);
	load_file(infilename[2],TRUE);
	send_deport("X",1);



	    // go bac to 9600 baud, if we're running fast..
	   if (cur_baud>9600)
		{
		send_deport("c b9600\r",1);
		set_baud(9600);
		send_deport("\r",1);
		}

	    // tell the unit to blast away..
	    k = send_deport("RB\r",4);
	    // might have caught the '>' in the text message, so do it again.
	    if (k != ':')
		k = send_deport("",4);
	    if (k != ':')
		{
		printf(" Programming failure. Text was:\n");
		de_printlast(150);
		exit(BADPGM); /* was 2050 */
		}
	    printf("\n Please wait. Do not interrupt power to the device\n");
	    printf(" or it will be rendered inoperable!\n");
	    k = send_deport("Y",1);
	    total_bytes = 0;
         
	 tend = 5*CLOCKS_PER_SEC;
        tstart = clock();
        while (clock()-tstart < tend)
	    	{
                if(_inp(UART_LSR)&LSR_DR)    // suck in characters..
                       {
		       k=_inp(UART_RBR);
		       total_bytes++;
			if ((total_bytes&0xF) == 0)
				putchar(busysig[(total_bytes>>4)&0x3]);
 			if ((total_bytes&0xF) == 0x8)
				putchar('\r');
			tstart = clock();
			}
		}
 	// now, we still have the possibility that the blast failed.
	// If it did, we'd be in console mode. So. look for a ">"..
	k = send_deport("\r",1);

	printf("\n Update complete. Cycle power to restart. ");
	exit(EXPRSOK);

} //main  

void load_file(unsigned char *infilename, unsigned short fatal)
{
        // ready to load..
	float	actual_time;
	// open the input file.
	if (_fullpath(fullfilename,infilename,_MAX_PATH) == NULL)
	    {
	    printf(" bad path %s\n", infilename);
	    exit(BADARGS); /* was 64 */
	    }

	printf("Load file: %s\n",fullfilename);
        infile = fopen(fullfilename,"r");
        if (infile == NULL)
                {
                printf(" ?? %s: %s",fullfilename,_strerror(NULL));
                exit(BADARGS); /* was 64 */
                }

        // get some file stats..
	filesize = _filelength(_fileno(infile));
	f_fsize = (float)filesize;
	f_baud = (float)cur_baud;
	printf("%ld bytes, estimated load time %6.1f minutes\n",
	filesize, (f_fsize*time_factor));


	time(&began_load);
	// we do the load by reading large clumps from the disk and
	// pushing them out a line at a time. If we didn't do this,
	// we'd waste a lot of time waiting for the OS to get us
	// read data..
	lines=0;
        total_bytes = 0;
	bytes_left = 0;
	f_bytes=0;
	outptr = 0;	// for building the string
	while((bytes_read=fread(userbuff,
		(size_t)1,
		(size_t)USERBUFFSIZE,
		infile)) != 0)
                {
		bytes_left += bytes_read;
		inptr = 0; // where we read from the buffer..
		while (bytes_left)
		    {
		    // take one line..
		    while(bytes_left &&
			  (j=userbuff[inptr++]) != '\n')
			{
			handystr[outptr++]=j;
			bytes_left--;
			}
		    if (j == '\n')
			{
			// have to pull that one out too..
			bytes_left--;
			// we're at an EOL..
			if (handystr[outptr-1] == 0x0A) //LF
			    outptr--;
			handystr[outptr++] = '\r';
			handystr[outptr]='\0';
			lines++;
			k = send_deport(handystr,1);
			if (k != '>')
			    {
			    if (!fatal)
			      {
			      // error loading. Try it again (just once)
			      printf("\rretry");
			      k = send_deport("\r",1);
			      if (k != '>')
				{
				printf(" ?? lost connection to target.");
				printf(" log:\n");
				de_printlast(150);
				clean_up();
				exit(LOSTCONCT);	/* was 2048 */
				}
			      k = send_deport(handystr,1);
			      }    
			    if (k != '>')
				{
				printf(" ?? loader failure. k=%c (%02x); Log:\n",
                                	k, k);
				de_printlast(150);
				clean_up();
				exit(BADLOAD); /* was 2049 */
				}

			    }
			outptr=0; // build a new string.
			if ((lines&0xff) == 0)
				{
				f_bytes = (float)(total_bytes+inptr);
				printf("\r%7.1f%% ",(f_bytes*100)/f_fsize);
				}
			}// if bytes_left
		    // go back for more..
		    }// while bytes_left
		total_bytes += bytes_read;

		} // while bytes to read


	    time(&done_load);
	    actual_time = difftime(done_load,began_load)/60;
		// tek 19jan99 if it took no ticks to load,
		// pretend it took a very little time.. like one tick.
		if (actual_time == 0.0)
		{
			actual_time = 1.0/CLOCKS_PER_SEC;
		}
	    printf("\nActual load time: %8.2f minutes; ",
		    actual_time);    
	    printf(" %8.0f bytes/sec\n",(double)total_bytes/((double)actual_time*60) );
	    // update the constant we use to predict load time..
	    time_factor = actual_time/(double)total_bytes;    

	    clean_up();

}

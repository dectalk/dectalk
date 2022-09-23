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

#include <errno.h>
#include <poll.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>
#include <time.h>
#include <linux/limits.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <fcntl.h>
#include "bits.h"
#define _far
#include "SER_TSR.H"

#define POLL_TIME 10


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



unsigned long start;
time_t began_load, done_load;

unsigned short flag16550 = 0;	// do we have a fast uart?

int uart_fd = -1;
int show = 1;
FILE *infile;
unsigned char infilename[3][PATH_MAX+1], fullfilename[PATH_MAX+1];

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

struct termios oldtio;


// handy utility routines..

void load_file(unsigned char *infilename, unsigned short fatal);

#define MY_CLOCKS_PER_SEC 1000

unsigned long myclock(void)
{
	struct timespec ts;
	unsigned long c;

	clock_gettime(CLOCK_MONOTONIC, &ts);

	c = ts.tv_nsec / 1000000;
	c += ts.tv_sec * 1000;

	return c;
}


unsigned short int set_baud(baudrate)
unsigned short int baudrate;
{
	struct termios tio;

	if (tcgetattr(uart_fd, &tio) == -1) {
		perror("tcgetattr");
		exit(EXIT_FAILURE);
	}

	/* set the baudrate to one of the standard values. */
	/* in theory, we could set it to anything we wished, */
	/* but a bogus baudrate is likely due to an error and */
	/* that would leave us in the weeds.. */
	/* this is going to happen immediately; if there are */
	/* characters coming or going, expect errors. */
	switch (baudrate)
	    {
	    case 110:
		cfsetspeed(&tio, B110);
		break;
	    case 300:
		cfsetspeed(&tio, B300);
		break;
	    case 600:
		cfsetspeed(&tio, B600);
		break;
	    case 1200:
		cfsetspeed(&tio, B1200);
		break;
	    case 2400:
		cfsetspeed(&tio, B2400);
		break;
	    case 4800:
		cfsetspeed(&tio, B4800);
		break;
	    case 9600:
		cfsetspeed(&tio, B9600);
		break;
	    case 19200:
		cfsetspeed(&tio, B19200);
		break;
	    case 38400:
		cfsetspeed(&tio, B38400);
		break;
	    case 57600:
		cfsetspeed(&tio, B57600);
		break;
	    default:
		return (-1);
	    }
	tcflush(uart_fd, TCIFLUSH);
	if (tcsetattr(uart_fd, TCSANOW, &tio) == -1) {
                perror("tcsetattr");
		exit(EXIT_FAILURE);
        }

	return(0);
}

short int set_format(bitsper,parity,stop)
unsigned char bitsper,parity,stop;
{
	struct termios tio;

	if (tcgetattr(uart_fd, &tio) == -1) {
		perror("tcgetattr");
		exit(EXIT_FAILURE);
	}

	tio.c_cflag &= ~(CSIZE | PARENB);

	/* build the config word here.. */
	unsigned char config = 0;
	switch(bitsper)
	    {
	    case BPC_5:
		tio.c_cflag |= CS5;
		break;
	    case BPC_6:
		tio.c_cflag |= CS6;
		break;
	    case BPC_7:
		tio.c_cflag |= CS7;
		break;
	    case BPC_8:
		tio.c_cflag |= CS8;
		break;
	    default:
		return(-1);
	    }
	switch(parity)
	    {
	    case PARITY_EVEN:
		tio.c_cflag |= PARENB;
		break;
	    case PARITY_ODD:
		tio.c_cflag |= PARENB|PARODD;
		break;
	    case PARITY_NONE:
		/* Nothing gets set.. */
		break;
	    case PARITY_0:
		//config |= BIT3|BIT4|BIT5;
		break;
	    case PARITY_1:
		//config |= BIT3|BIT5;
		break;
	    default:
		return(-2);
	    }

	// write it to the uart..
	tcflush(uart_fd, TCIFLUSH);
	if (tcsetattr(uart_fd, TCSANOW, &tio) == -1) {
                perror("tcsetattr");
		exit(EXIT_FAILURE);
        }
	return(0);
}

unsigned char send_deport(unsigned char *string, unsigned short int wait)
{
        // send a string out the port. Suck in and log the chars received
        // in ringbuff. If we ever see a ?, return ?; else if we see > after
        // sending the string, bail out and return >; else return the last
        // char we saw after (wait/4) seconds.
        unsigned int i, j, gotsome;
        unsigned char inchar = 0x00;
        unsigned long start, end;
	struct pollfd pfd[1];
	int r;

        unsigned int saw_quest=0, done=0;

	gotsome = 0; // flag to make sure we actually get a new character..

        end = wait*(MY_CLOCKS_PER_SEC/2);

        start = myclock();
        i = 0;

        while (string[i] != '\0' && myclock()-start < end && !done)
                {
                while(1)    // suck in characters..
                        {
			unsigned char linchar;

			memset(pfd, 0, sizeof(pfd));
			pfd[0].fd = uart_fd;
			pfd[0].events = POLLIN;

			r = poll(pfd, 1, 0);
			if (r == -1) {
				perror("poll");
				exit(EXIT_FAILURE);
			}

			if (!(pfd[0].revents & POLLIN)) {
				break;
			}

			if (read(uart_fd, &linchar, 1) != 1) {
				break;
			}
			if (show) printf("%c", linchar);
                        if (linchar == '?')
                                saw_quest++;
			ringbuff[head] = linchar;
                        if (++head >= RINGLEN)
                                head=0;
                        if (count<RINGLEN)
                                count++;
			
                        }

		memset(pfd, 0, sizeof(pfd));
		pfd[0].fd = uart_fd;
		pfd[0].events = POLLOUT;

		r = poll(pfd, 1, POLL_TIME);
		if (r == -1) {
			perror("poll");
			exit(EXIT_FAILURE);
		}

                if (pfd[0].revents & POLLOUT)
                        {
				if (write(uart_fd, &(string[i++]), 1) != 1) {
					perror("write");
					exit(EXIT_FAILURE);
				}
                        }
                }
        // now wait around for the '>' ...
        while ((!done) && (myclock()-start < end))
                {
		//printf("%u %u - %u < %u\n", myclock(), start, myclock()-start, end);
                while(!done)    // suck in characters..
                        {
			unsigned char linchar;

			memset(pfd, 0, sizeof(pfd));
			pfd[0].fd = uart_fd;
			pfd[0].events = POLLIN;

			r = poll(pfd, 1, POLL_TIME);
			if (r == -1) {
				perror("poll");
				exit(EXIT_FAILURE);
			}

			if (!(pfd[0].revents & POLLIN)) {
				break;
			}

			if (read(uart_fd, &linchar, 1) != 1) {
				break;
			}

			gotsome++;
			if (show) printf("%c", linchar);
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
				//while (!kbhit())
				//	;
				//getch(); // toss the character..
				getchar();
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

unsigned char help_string[]="/dev/comport file1name file2name file3name [-sf]";
unsigned int portaddr[4] = { 0x3f8, 0x2f8, 0x3e8, 0x2e8 };
unsigned char portname[4][5] = { "COM1", "COM2", "COM3", "COM4" };
unsigned char consolestring[3][5] = { {DLE,'&','@','@','\0'},
				     {DLE,'*','@','@','\0'} };
unsigned char crstring[]="\r";

	char *port;
	unsigned char j, k;
	unsigned long int	outptr, inptr;
	unsigned long bytes_read, total_bytes, bytes_left, lines;
	float f_fsize,f_baud,f_bytes;
	unsigned long tstart,tend;

int main(int argc,char *argv[])
{
	int	argp;
	unsigned short i;
	unsigned short fast, fastflag=0, slowflag=0;
	struct pollfd pfd[1];
	struct termios tio;
	int r;

	printf("%s\n",copyright);

	if ( (argc != 5) && (argc != 6) )
	    {
	    printf("%s %s\n", argv[0], help_string);
	    printf("\t-s slow mode, force 9600bps\n");
	    printf("\t-f fast mode, force 57600bps (default)\n\n");
	    printf("Updates the firmware of a DECtalk Express connected to /dev/comport\n");
	    printf("Consult DOS firmware update for firmware files (MON.HEX FASTLOAD.HXO OUT.FLR)\n");
	    printf("and usage instructions (LOAD.BAT).\n");
	    exit(BADARGS);    /* was 64 */
	    }

	port = argv[1];

	for (i=0;i<3;i++)
	   strncpy(infilename[i],argv[2+i],PATH_MAX);

        printf("Using port %s\n", port);

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

	uart_fd = open(port, O_RDWR | O_NOCTTY);
	if (uart_fd < 0) {
		perror("Can't open port");
		exit(EXIT_FAILURE);
	}

	if (tcgetattr(uart_fd, &oldtio) == -1) {
		perror("tcgetattr");
		exit(EXIT_FAILURE);
	}

	memset(&tio, 0, sizeof(tio));
	tio.c_cflag = B9600 | CS8 | CLOCAL | CREAD;
	tio.c_iflag = IGNPAR;
	tio.c_oflag = 0;
	tio.c_lflag = 0;
	tio.c_cc[VTIME] = 0;
	tio.c_cc[VMIN] = 1;

	tcflush(uart_fd, TCIFLUSH);
	if (tcsetattr(uart_fd, TCSANOW, &tio) == -1) {
                perror("tcsetattr");
		exit(EXIT_FAILURE);
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
          start = myclock();
          while (myclock()-start <  2*MY_CLOCKS_PER_SEC)
                {
		unsigned char c = ENQ;

		memset(pfd, 0, sizeof(pfd));
		pfd[0].fd = uart_fd;
		pfd[0].events = POLLOUT;

		r = poll(pfd, 1, POLL_TIME);
		if (r == -1) {
			perror("poll");
			exit(EXIT_FAILURE);
		}

                if (pfd[0].revents & POLLOUT) {
			if (write(uart_fd, &c, 1) != 1) {
				perror("write");
				exit(EXIT_FAILURE);
			}
			break;
		}
                }
          if (myclock()-start > 2*MY_CLOCKS_PER_SEC)
                {
                printf(" ?? Could not send a character via port %s\n",
        	        port);
                exit(BADPORT);  /* was 256 */
                }

          // look for a DLE in return..
          start = myclock();
          while (myclock()-start <  2*MY_CLOCKS_PER_SEC)
                {
		memset(pfd, 0, sizeof(pfd));
		pfd[0].fd = uart_fd;
		pfd[0].events = POLLIN;

		r = poll(pfd, 1, POLL_TIME);
		if (r == -1) {
			perror("poll");
			exit(EXIT_FAILURE);
		}

		if (pfd[0].revents & POLLIN) {
			if (read(uart_fd, &j, 1) != 1) {
				continue;
			}
			printf("0x%x\n", j);

                        if (j == DLE)
                            break;
                        }
                }
          if (myclock()-start > 2*MY_CLOCKS_PER_SEC)
                {
                printf(" ?? No DECtalk Express found on port %s\n",
        	        port);
                exit(BADPORT); /* was 256 */
                }

          printf("DECtalk Express connected.\n");

          // .. flush any remaining characters..
          start=myclock();
          while(myclock()-start < 2*MY_CLOCKS_PER_SEC)
                {
		memset(pfd, 0, sizeof(pfd));
		pfd[0].fd = uart_fd;
		pfd[0].events = POLLIN;

		r = poll(pfd, 1, POLL_TIME);
		if (r == -1) {
			perror("poll");
			exit(EXIT_FAILURE);
		}

		if (pfd[0].revents & POLLIN) {
			if (read(uart_fd, &j, 1) != 1) {
				continue;
			}
			printf("%c", j);
                }
                }

          // fly back to the console..
	   k = send_deport(consolestring[0],1); // this shouldn't give a '>'
	   k = send_deport(consolestring[1],2); // this will.

          // .. flush any remaining characters while giving the console
          // time to come up.
          start=myclock();
          while(myclock()-start < 2*MY_CLOCKS_PER_SEC)
                {
		memset(pfd, 0, sizeof(pfd));
		pfd[0].fd = uart_fd;
		pfd[0].events = POLLIN;

		r = poll(pfd, 1, POLL_TIME);
		if (r == -1) {
			perror("poll");
			exit(EXIT_FAILURE);
		}

		if (pfd[0].revents & POLLIN) {
			if (read(uart_fd, &j, 1) != 1) {
				continue;
			}
			printf("%c", j);
                }
		}

          k = send_deport(crstring,1);
          if (k != '>')
                {
                printf(" ?? couldn't activate DECtalk Express console \n");
                exit(BADCONSL); /* was 1024 */
                }
	   }
	// see if we have a 16550 out there..
	flag16550 = 1;

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
            start=myclock();
            while(myclock()-start < 2*MY_CLOCKS_PER_SEC)
                {
		memset(pfd, 0, sizeof(pfd));
		pfd[0].fd = uart_fd;
		pfd[0].events = POLLIN;

		r = poll(pfd, 1, POLL_TIME);
		if (r == -1) {
			perror("poll");
			exit(EXIT_FAILURE);
		}

		if (pfd[0].revents & POLLIN) {
			if (read(uart_fd, &j, 1) != 1) {
				continue;
			}
			printf("%c", j);
                }
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
         
	 tend = 5*MY_CLOCKS_PER_SEC;
        tstart = myclock();
        while (myclock()-tstart < tend)
	    	{
		memset(pfd, 0, sizeof(pfd));
		pfd[0].fd = uart_fd;
		pfd[0].events = POLLIN;

		r = poll(pfd, 1, POLL_TIME);
		if (r == -1) {
			perror("poll");
			exit(EXIT_FAILURE);
		}

		if (pfd[0].revents & POLLIN) {
			if (read(uart_fd, &k, 1) != 1) {
				perror("read");
				exit(EXIT_FAILURE);
			}
			printf("%c", k);

		       total_bytes++;
#if 0
			if ((total_bytes&0xF) == 0)
				putchar(busysig[(total_bytes>>4)&0x3]);
 			if ((total_bytes&0xF) == 0x8)
				putchar('\r');
#endif
			tstart = myclock();
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
	struct stat stat_buf;

	// open the input file.
	strncpy(fullfilename, infilename, PATH_MAX);

	printf("Load file: %s\n",fullfilename);
        infile = fopen(fullfilename,"r");
        if (infile == NULL)
                {
                printf(" ?? %s: %s",fullfilename,strerror(errno));
                exit(BADARGS); /* was 64 */
                }

        // get some file stats..
	if (fstat(fileno(infile), &stat_buf) == -1) {
		perror("stat");
		exit(EXIT_FAILURE);
	}

	filesize = stat_buf.st_size;
	f_fsize = (float)filesize;
	f_baud = (float)cur_baud;
	printf("%ld bytes, estimated load time %6.1f minutes\n",
	filesize, (f_fsize*time_factor));


	show = 0;
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
				printf("%7.1f%%\n",(f_bytes*100)/f_fsize);
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
			actual_time = 1.0/MY_CLOCKS_PER_SEC;
		}
	    printf("\nActual load time: %8.2f minutes; ",
		    actual_time);    
	    printf(" %8.0f bytes/sec\n",(double)total_bytes/((double)actual_time*60) );
	    // update the constant we use to predict load time..
	    time_factor = actual_time/(double)total_bytes;    
	    show = 1;

	    clean_up();

}

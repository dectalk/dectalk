/*
 * blast the image starting at 0 into the flash roms.
 * Very dangerous.
 */

#include "pd.h"
#include <conio.h>
#include <stdarg.h>

#define LERASE (0x20)
#define LERASEV (0xa0)
#define LPROG (0x40)
#define LPROGV (0xc0)


#define HERASE (LERASE<<8)
#define HERASEV (LERASEV<<8)
#define HPROG (LPROG<<8)
#define HPROGV (LPROGV<<8)


#define READID	(0x9090)


void putstr(char *);
void timedwait(unsigned long int);
unsigned short int writeloc(volatile unsigned short int *addr, unsigned short int data);
unsigned short erase(void);
unsigned char kgetc();
void kflush();

void printf(char *format, ...);



void far mymain()
{
	unsigned volatile short int *inptr;
	unsigned volatile short int *outptr;
	unsigned volatile short int sitmp, sitmp2;

	unsigned volatile short int *lolimit;
	unsigned volatile short int *hilimit;

	unsigned volatile char ctemp;

	unsigned long int errors;

	lolimit = (unsigned volatile short int *)(ROMBASE);
	hilimit = &lolimit[ROMSIZE/2];


	putstr("\n");
	kflush();
	sitmp = inp(GPIO);
	if ((sitmp&BATTOK) == 0)
		{
		printf("Cannot program ROM because battery is low. Connect external power.\n");
		kflush();
		return;
		}
	printf("\n***WARNING***\n");
	printf("  This can easily render the unit useless if improperly\n");
	printf("  used. Turning the unit off, or otherwise interrupting\n");
	printf("  power, will likely leave the firmware in a corrupted \n");
	printf("  state. \n\n");

	timedwait(50000);

	printf("\n\n Type Y to continue, any other character to abort:");
	kflush();
	if (kgetc() != 'Y')
		{
		printf("\n Aborted.\n");
		return;
		}
	printf("\n");

	// bring up Vpp..
	outp(GPIO,VPPON|DSP_RESET|V5BOFF);	/* vpp up, dsp off.. */
	// wait a bit for it to come up..
	timedwait(10000);
	// do an ID read to make sure things are OK..
	
	outptr = (unsigned volatile short int *)(ROMBASE);
	*outptr = READID;
	timedwait(6);

	sitmp = outptr[0];
	sitmp2 = outptr[1];

	// check the id
	if (sitmp != 0x8989
	    || sitmp2 != 0xbdbd)
		{
		putstr("Bad ID read. Can't blast. \n");
		return;
		}
	   else putstr("ID read OK.\n");

 
	// back to read mode
	outptr = 0;
	timedwait(6);

	// do the erase..
	printf
	("Erase starting; loss of power will render the system unusable!\n");

	if (erase())
		{
		printf("!!! program failure! device may be unusable!\n");
		return;
		}

	// start writing the bytes..
	errors = 0;
	for (outptr=lolimit, inptr=0; outptr<hilimit; outptr++, inptr++)
		{
		if (((int)(outptr)&0xFFF) == 0)
			printf("\r[%08x] ",outptr);
		errors += writeloc(outptr, *inptr);
		}

	if (errors)
		{
		printf("!!! program failure! device may be unusable!\n");
		return;
		}


	// finally, make sure we're in read mode..
	outptr = (unsigned volatile short int *)(ROMBASE);
	*outptr = 0;
	timedwait(6);
	printf("\n\n  Device programming complete.\n");
	timedwait(10000);
	printf("\n Turn the DECtalk Express off and then on to reset. \n");

	while(1)
		timedwait(10); // wait forever.

}

unsigned short int writeloc(volatile unsigned short int *addr, unsigned short int data)
{
	register unsigned short int tempdata;
	register unsigned short int writecmd, count;

	// write a aligned pair of bytes. Assumes Vpp is up, and the part is 
	// erased (or, if we're writing a 0, assumes we're in erase mode)
	// also assumes we enter the routine in read mode. 
	if ((int)addr&1)
		{
		printf("?unaligned address?\n");
		return(1);
		}

	// if we're not writing to zero, verify that the location is 
	// blank.
	if (data != 0)
		{
		tempdata = *addr;
		if (tempdata != 0xFFFF)
			{
			printf("?cell not erased? \n");
			return(2);
			}
		}

	// OK, do the write. 
	writecmd = HPROG|LPROG;
	for (count=0;count<25;count++)
		{
		*addr = writecmd;	// set up write.
		*addr = data;		// do the write.
		timedwait(10);		// let it write.
		writecmd = HPROGV|LPROGV;
		*addr = writecmd;	// read-verify.
		timedwait(6);

		tempdata = *addr;	// read it back.
		tempdata ^= data;	// check for same.
		// figure out which byte(s) need to try again.
		writecmd = 0;
		if (tempdata&0xFF)
			writecmd |= LPROG;
		if (tempdata&0xFF00)
			writecmd |= HPROG;
		if (writecmd==0)
			// we're done!
			break;
		} // for count still OK.
	if (writecmd != 0)
		{
		// write failure. 
		printf("? write failure? \n");
		*addr = 0;	// read mode.
		return(3);
		}
	// back into read mode. 
	*addr = 0;
	return(0);	// normal exit.
}


unsigned short erase()
{
	//erase the whole part. 
	// for now, just blows away the first couple words.
	volatile unsigned short int *lolimit;
	volatile unsigned short int *hilimit;
	volatile unsigned short int *here;
	unsigned short int count;
	volatile unsigned short int tempdata;


	lolimit = (unsigned volatile short int *)(ROMBASE);
	hilimit = &lolimit[ROMSIZE/2];

	// first, we have to write everything to zero.
	for (here=lolimit; here<hilimit; here++)
		{
		if (((int)(here)&0xFFF) == 0)
			printf("\r[%08x] ",here);

		if (writeloc(here,0))
			{
			printf("   .. addr=%08x.\n");
			return(1);
			}
		}
	count=0;	// number of erase attempts..
	

	// do the first erase.
	here = lolimit;
	*here = HERASE|LERASE;  //setup
	*here = HERASE|LERASE;  //do it
	timedwait(10000);  // let the smoke clear.

	printf("\n");

	// now walk through memory until it's all erased.
	for (here=lolimit; 
		(here<hilimit && count<3000);
		count++)
		{
		printf("(%04x) \r",count); // this must be here for the
					   // timing to be right.

		// see if this location is erased.

		do 
			{
			*here = HERASEV|LERASEV; 
			timedwait(6);
			}
			while ( ((tempdata = *here++) == 0xFFFF) 
			  && (here<hilimit));

		if (here<hilimit)
			{
			// need to do another erase.. 
			// probably should just erase the byte that needs it,
			// but this shouldn't hurt.
			--here; 	// we always bump it up in the loop
			*here = HERASE|LERASE;  //setup
			*here = HERASE|LERASE;  //do it
			timedwait(5000);  // let the smoke clear.
			// the printf at the top of the loop takes some of 
			// the required time as well.
			}
		} // while we still need to erase..

	printf("(%04x)  \n",count);

	if (count >= 3000)
		{
		printf("erase count exceeded.\n");
		return(4);
		}

	--here; // back to the top of memory..
	*here = 0; // back into read mode.
	return(0); // done.
}	


void putc(unsigned charin)
{
	while((inp(UART+5)&0x40) == 0)
		;
	outp(UART,charin);
	if (charin == '\n')
		putc('\r');
}

void putstr(char *str)
{
	while (*str != '\0')
		{
		putc(*str++);
		}
}

void timedwait(unsigned long int time)
{
	// wait for about <count> microseconds. 

	register unsigned long int count;

	// it takes us about 6us to get called, and about 2 to return.
	// be safe, and figure it takes 6us of overhead..

	if (time<=6)
		return;

	// now adjust the timer value..
	time -= 6;

	count = (time*2)/5;	//loop calibration

	while (count-- > 0)
		inp(GPIO);
}

unsigned char kgetc()
{
	while ((inp(UART_LSR)&1) == 0)
		;
	return(inp(UART));
}

void kflush()
{
	while ((inp(UART_LSR)&1) != 0)
		;
}


// probably won't need this here forever..
/* simple putchar routine; does not deal with flow control. */
#define COM_LSR	0x2fd
#define COM_LSR_TEMT	0x40
#define COM_THR	0x2f8
void PutChar(c)
char c;
{
	unsigned char stat;
	/* check the transmit ready bit.. */
	stat = inp(COM_LSR);	
	while ((stat&&COM_LSR_TEMT) == 0)/* Transmitter Empty */
	    stat = inp(COM_LSR);

	outp(COM_THR, c);

	/* we have no operating system to do carriage control, */
	/* so we have to push a return after a newline.. */
	if (c == '\n')
		PutChar('\r');

}

/* this printf needs a strlen.. */
int strlen(str)
char *str;
{
	int i;
	for (i=0;str[i]!='\0';i++)
		;
	return(i);
}

/* printf routine pirated from Larry Stewart.. */
/* printf.c
   L. Stewart
   Sun Feb 10 20:18:22 1985
 */

#define FALSE 0
#define TRUE 1

/* The string s is terminated by a '\0' */
void PutString(char *s)
{
  while (*s) PutChar(*s++);
}

/* print c count times */
static void PutRepChar(char c, int count)
{
  while (count--) PutChar(c);
}

/* put string reverse */
static void PutStringReverse(char *s, int index)
{
  while ((index--) > 0) PutChar(s[index]);
}

/* prints value in radix, in a field width width, with fill
   character fill
   if radix is negative, print as signed quantity
   if width is negative, left justify
   if width is 0, use whatever is needed
   if fill is 0, use ' '
 */
static void PutNumber(long int value, int radix, int width, char fill)
{
  char buffer[40];
  int bufferindex = 0;
  long unsigned uvalue;
  short int digit;
  short int left = FALSE;
  short int negative = FALSE;

  if (fill == 0) fill = ' ';

  if (width < 0) {
    width = -width;
    left = TRUE;
    }
  if (width < 0 || width > 80) width = 0;

  if (radix < 0) {
    radix = -radix;
    if (value < 0) {
      negative = TRUE;
      value = -value;
      }
    }
  switch (radix) {
    case 8:
    case 10:
    case 16: break;
    default: {
      PutString("****");
      return;
      }
    }
  uvalue = value;
  do {
    if (radix != 16)
    {
      digit = uvalue % radix;
      uvalue /= radix;
    }
    else
    {
      digit = uvalue & 0xf;
      uvalue = uvalue >> 4;
    }
    buffer[bufferindex] = digit + ((digit <= 9) ? '0' : ('A' - 10));
    bufferindex += 1;
    } while (uvalue != 0);
  /* fill # ' ' and negative cannot happen at once */
  if (negative) {
    buffer[bufferindex] = '-';
    bufferindex += 1;
    }
  if (width <= bufferindex) PutStringReverse(buffer, bufferindex);
  else {
    width -= bufferindex;
    if (!left) PutRepChar(fill, width);
    PutStringReverse(buffer, bufferindex);
    if (left) PutRepChar(fill, width);
    }
}

static char *FormatItem(char *f, long int a)
{
  char c;
  int fieldwidth = 0;
  int leftjust = FALSE;
  int radix = 0;
  char fill = ' ';
  if (*f == '0') fill = '0';
  while (c = *f++) {
    if (c >= '0' && c <= '9') {
      fieldwidth = (fieldwidth * 10) + (c - '0');
      }
    else switch (c) {
      case '\000': return(--f);
      case '%': PutChar('%');
        return(f);
      case '-': leftjust = TRUE;
        break;
      case 'c': {
        if (leftjust) PutChar(a & 0x7f);
        if (fieldwidth > 0) PutRepChar(fill, fieldwidth - 1);
        if (!leftjust) PutChar(a & 0x7f);
        return(f);
        }
      case 's': {
        if (leftjust) PutString((char *) a);
        if (fieldwidth > strlen((char *) a))
          PutRepChar(fill, fieldwidth - strlen((char *)a));
        if (!leftjust) PutString((char *) a);
        return(f);
        }
      case 'd': radix = -10;
        break;
      case 'u': radix = 10;
        break;
      case 'x': radix = 16;
        break;
      case 'o': radix = 8;
        break;
      default:   /* unknown switch! */
        radix = 3;
        break;
      }
    if (radix) break;
    }
  if (leftjust) fieldwidth = -fieldwidth;
  PutNumber(a, radix, fieldwidth, fill);
  return(f);
}

void printf(char *f, ...)
{
  va_list	parminfo;

  int argindex = 0;
  
  va_start(parminfo,f);

  while (*f) {
    if (*f == '%') f = FormatItem(f + 1, va_arg(parminfo,long int));
    else PutChar(*f++);
    }
  va_end(parminfo);
}




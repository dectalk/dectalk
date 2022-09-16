/* load quickly.*/
#include "pd.h"
#include <conio.h>
#include <stdarg.h>

#define LCR (UART+3)

unsigned short htoi(unsigned char inchar);


unsigned short state;
#define IDLE			0
#define COMMENT		1
#define BRACKET		2
#define DATA_1			3
#define DATA_2			4
#define ADDRESS_1		5
#define ADDRESS_2		6
#define CSUM_1			7
#define CSUM_2			8
#define CHECK_LINE_SUM_1	9
#define CHECK_LINE_SUM_2	10
#define DONE			11

void printf(char *format, ...);
unsigned char kgetc();
void kflush();
void far mymain();

void far aamain()
{
	mymain();
}

void far mymain()
{
	unsigned long	check_sum,i;
	unsigned char 	inch;
	unsigned long	temp, temp2, sum, base, csum, r_csum;
	unsigned short	sindex,qindex,length;

	// start reading in characters and figuring out what to do.
	
	state=IDLE;

	printf("\n>");

	while (1)
		{
		inch = kgetc();
		if ((state != CHECK_LINE_SUM_1)
		     && (state != CHECK_LINE_SUM_2))
			sum += inch;	// this gets initialized as needed.

		switch (state)
			{
			case IDLE:
				switch (inch)
					{
					case 'X':
						return;
					case '[':
						state = BRACKET;
						sum=inch; //start the line sum
						break;
					case ';':
						state = COMMENT;
						break;
					default:
						break;
					}// switch inch
				break;
			case COMMENT:
				switch (inch)
					{
					case '\r':
					case '\n':
						printf("\n>");
						state=IDLE;
						break;
					default:
						break;

					}// switch inch
				break;
			case BRACKET:
				switch (inch)
					{
					case 'D':
						state=DATA_1;
						break;
					case 'A':
						state=ADDRESS_1;
						break;
					case 'C':
						state=CSUM_1;
						break;
					default:
						printf("?bad type");
						state=COMMENT; // dump the line
						break;

					}// switch inch
				break;
			case ADDRESS_1:
				base=0;		// init address value
				csum=0;		// init checksum
				sindex=0;
				state=ADDRESS_2;
				// fall through
			case ADDRESS_2:
				temp = htoi(inch);	// get the byte..
				if (temp>0xF)
					{
					printf("?bad addr");
					state=COMMENT;
					break;
					}
				base <<= 4;
				base |= temp&0xF;
				sindex++;
				if (sindex == 6)
					state = CHECK_LINE_SUM_1;
				break;
			case DATA_1:
				sindex=0; 
				qindex=0; //init char-in-quad count
				if ((inch<0x80) || (inch>0xB0))
					{
					printf("?bad length");
					state=COMMENT;
					break;
					}
				length=inch&0x3F;
				state=DATA_2;
				temp=0; // init the place to put the data.
				break;
			case DATA_2:
				if ((inch<0x80) || (inch>0xBF))
					{
					printf("?bad data");
					state=COMMENT;
					break;
					}
				
				if (qindex==0)
					temp=0;	// init data holder
				temp |= (long)(inch&0x3f) << (6*qindex);
				qindex++;
				// see if we're done with the quad..
				if (qindex == 4)
					{
					// write the data
					for (i=0;i<3;i++)
						{
						// don't write the bytes
						// off the end of a partial
						// record.
						if (length != 0)
							{
							csum += (long)(temp&0xff);
							put((int)temp&0xFF,base);
							temp = temp>>8;
							base++;
							length--;
							}
						}
					qindex=0;
					}
				if (length == 0)
					state=CHECK_LINE_SUM_1;
				break;  // state DATA_2
			case CHECK_LINE_SUM_1:
				temp=0;
				temp2 = htoi(inch);
				if (temp2>0xF)
					{
					printf("?bad csum");
					state=COMMENT;
					break;
					}
				temp = (temp2&0xF)<<4; 
				state=CHECK_LINE_SUM_2;
				break;
			case CHECK_LINE_SUM_2:
				temp2 = htoi(inch);
				if (temp2>0xF)
					{
					printf("?bad csum");
					state=COMMENT;
					break;
					}
				temp |= temp2&0xF;
				// time to verify the sum..
				if ((temp&0xFF) != (sum&0xFF))
					{
					printf("?csum fail");
					state=COMMENT;
					break;
					}
				state=DONE;
				break;
			case DONE:
				// this must be the end-of-line!
				switch (inch)
					{
					case '\r':
					case '\n':
						printf("\n>");
						state=IDLE;
						break;
					default:
						printf("?too long");
						state=COMMENT;
						break;
					}
				break;
			case CSUM_1:
				// this is a overall-checksum record.
				sindex=0;
				state=CSUM_2;
				r_csum=0;
				// fall through
			case CSUM_2:
				temp = htoi(inch);	// get the byte..
				if (temp>0xF)
					{
					printf("?bad csum");
					state=COMMENT;
					break;
					}
				r_csum = r_csum<<4;
				r_csum |= temp&0xF;
				sindex++;
				if (sindex == 8)
					{
					// we cheat here. The checksum record
					// is itself checksummed, but we 
					// ignore that.
					// we'll always ignore the rest
					// of the line, in fact..
					state=COMMENT;
					if (r_csum != csum)
						{
						printf("? csum fail");
						break;
						}
					break;
					}
				break;

			}// switch state


		}// while not feof()


} // mymain

unsigned short htoi(unsigned char achar)
{

	unsigned char inchar;
	inchar = achar;

	if (inchar>0x60)
		inchar -= 0x40;	// uppercase

	// returns FFFF if the conversion fails.
	if (inchar<'0')
		return(0xFFFF);
	if (inchar>'F')
		return(0xFFFF);
	if (inchar>'9' && inchar<'A')
		return(0xFFFF);
	if (inchar <= '9')
		return((inchar-'0') & 0xF);
	  else
		return(0xA + ((inchar-'A') & 0xF));

}

void put(unsigned char inbyte, unsigned long addr)
{
	unsigned char *iaddr;
	iaddr = (unsigned char *)(addr);
	*iaddr = inbyte;
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


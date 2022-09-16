#include "pd.h"
#include <conio.h>
#include <stdarg.h>

/* quick diagnostic for the PD prototype */

struct digitized_packet *pkt; /* this has to be in the same aligned 64K*/
/* we didn't allocate space for that; we'll just slam it in memory. */

#define PKT_BASE 0xA000

#define SINE

#ifdef SINE
unsigned short int sintable[NUMSAMPLES] = {
0xfff,0x1789,0x1d4b,0x1fea,0x1ec6,0x1a25,0x131e,0xb5a,
0x4af,0xb0,0x4e,0x3a1,0x9df,0x118f,0x18e1,0x1e1a,
0x1ffd,0x1e1a,0x18e2,0x1191,0x9e1,0x3a2,0x4e,0xaf,
0x4ae,0xb58,0x131c,0x1a23,0x1ec5,0x1fea,0x1d4c,0x178a,
0x1000,0x876,0x2b3,0x13,0x136,0x5d7,0xcdd,0x14a1,
0x1b4c,0x1f4c,0x1faf,0x1c5e,0x1620,0xe70,0x71e,0x1e4,
0x0,0x1e2,0x719,0xe6a,0x161b,0x1c5a,0x1fae,0x1f4e,
0x1b50,0x14a6,0xce3,0x5db,0x139,0x13,0x2b0,0x871
} ;

#else
unsigned short int sintable[NUMSAMPLES] = {
0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 0, 0, 0,
0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 0, 0, 0,
0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 0, 0, 0,
0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 0, 0, 0
} ;

#endif



#define DATAROM_0	(0xd00000L)
#define DATAROM_1	(0xE00000L)
#define CODEROM	(0xc00000L)



int DMApacket(unsigned int length,void near *packet);
void DMAinit(void);
unsigned int DSPtest(void);
void writeDMAreg(unsigned int addr, unsigned int data);
unsigned int readDMAreg(unsigned int addr);
unsigned int inportb(unsigned int addr);
void outportb(unsigned int addr, unsigned int data);
void printf(char *format, ...);


unsigned int memtest(unsigned int length);
void printmemerr(unsigned long, unsigned long);
/* memtest needs to keep its state across invocations, so we define */
/* some global variables and initialize them here */

#define MEMTEST_START (0x10100) /* just above 64K */
#define MEMTEST_END   (0xafff0) /* just below 720K, for no good reason */

unsigned long *curmemloc = MEMTEST_START;
unsigned int curmemmode = 0;	/* so we can run different patterns */
unsigned long int passes;
unsigned long int errors;
unsigned short int loops;


void far mymain()
{
	/* first, try to read/write the FLASH parts, then drop into a */
	/* continuous loop outputting DSP data.. */
	unsigned char *cp;
	unsigned short int *ip;
	unsigned char char1, char2;
	unsigned short int sint1, sint2;
	unsigned int i;


	passes = 0; errors = 0;
	printf("\ntest starting.. \n");

	while (passes++<20)
		{

		/* first, try the smaller parts.. */
		cp = (unsigned char *)(DATAROM_0);
		*(cp+0x5555) = 0xaa;
		*(cp+0x2aaa) = 0x55;
		*(cp+0x5555) = 0x90;
		char1 = *cp++;
		char2 = *cp--;
		/* read mode reset.. */
		*(cp+0x5555) = 0xaa;
		*(cp+0x2aaa) = 0x55;
		*(cp+0x5555) = 0xF0;
	        if ((char1 != 0x01) || (char2 != 0x20))
                        {
	      	        printf("dr 0 id=%02x%02x ?? \n",char2,char1);
		        errors++;
                        }
	
	
		
		cp = (unsigned char *)(DATAROM_1);
		*(cp+0x5555) = 0xaa;
		*(cp+0x2aaa) = 0x55;
		*(cp+0x5555) = 0x90;
		char1 = *cp++;
		char2 = *cp--;
		/* read mode reset.. */
		*(cp+0x5555) = 0xaa;
		*(cp+0x2aaa) = 0x55;
		*(cp+0x5555) = 0xF0;
	        if ((char1 != 0x01) || (char2 != 0x20))
                        {
	      	        printf("dr 1 id=%02x%02x ??\n",char2,char1);
		        errors++;
                        }
	
	
	
		/* now, the code ROM.. */
		/* we need to bring up Vpp.. */
		outp(0x2e0,0x05);	/* vpp up, dsp off.. */
		/* hang out for a bit while it comes up.. */
		if (memtest(2000) != 0)
			{
			errors++;
			curmemloc = (unsigned long *)MEMTEST_START;
			}
		ip = (unsigned short int *)(CODEROM);
		/* write the ID request */
		*ip = 0x9090;	/* both bytes at once.. */
		/* read the IDs.. */
		sint1 = *ip++;
		sint2 = *ip--;
		/* set the chip back to read.. */
		*ip = 0x00;
		/* bring Vpp back down.. */
		outp(0x2e0,0x3);	/* vpp off, dsp off.. */
	        if ((sint1 != 0x08989) || (sint2 != 0xbdbd))
                        {
	      	        printf("dr 1 id=%04x%04x ??\n",sint2,sint1);
		        errors++;
                        }
	


		if (DSPtest()!= 0)
			{
			errors++;
			}

		} /* end while 1.. */
	if (errors==0)
		{
		printf("\rEnd pass; no errors.\n[ok]\n");
		return;
		}
	    else
		{
		printf(" **** pass ended with %d errors ****\n",errors);
		return;
		}
		
}


unsigned int DSPtest()
{
	int i,j,last;
	double rads, result;

	last=0;


	/* we have to wake the dsp up.. */
	/*printf("DSP reset");*/
	outp(0x2e0,1);
	/*printf(" .. ");*/
	outp(0x2e0,0);
	/*printf("done\n");*/

	/* and set the sample clock.. */
	outp(0x61,0x3);		/* enable the gates */
	outp(0x43,0xb4);	/* select the timer */
	outp(0x42,0x68);	/* divisor low */
	outp(0x42,0x00);	/* divisor hi */

        /* init the DMa channel for later use.. */

        DMAinit();
	
	loops=0;
	passes++;

	/*printf("DMA start, pass %d\n",passes); */
	while(loops++<100)
	{
	/* first, generate the table of samples.. */
	pkt = (struct digitized_packet *) PKT_BASE;

	pkt->type = DIGITIZED_PKT;

	for (i=0;i<NUMSAMPLES;i++)
		{
		/* digitized data always goes into the high 12 bits, */
		/* for dubious historical reasons.. */
		/* the data in the sine table is really x2..*/
		pkt->samples[i] = (sintable[i]^0x1000)<<3; 
		}

	if (DMApacket(NUMSAMPLES, pkt) != 0)
		return(1);	/* fault of some sort.. */

	/* wait a bit for the DMA to complete.. */
	for (i=0;i<10;i++)
		{
		j = inp(0x2e0);
		if (j&0x8)
			break;
		}
	if (j&0x8 == 0)
		{
		printf("? DMADONE didn't set? \n");
		return(2);
		}
	if (inp(0x20)&0x80 == 0)
		{
		printf("? DMA irq didn't set? \n");
		return(3);
		}

	if ((inp(0x2e0)&0x80) != 0)
		{
		printf(" !! 2: DSP fault. Pass=%d!!\n",passes);
		return(1);
		}
	last += NUMSAMPLES;
	if (last>(4095-NUMSAMPLES))
		last=0;
	}; /* while */
        return(0);


}

int DMApacket(unsigned int length,void near *packet)
{
/* set up the DMA channel to send out a packet of length 'length'.. */
/* assumes we own the channel.. */
/* this only works for channel 7.. */
	unsigned char   page, hiaddr, loaddr, hicount, locount;
	unsigned int    addr_reg, count_reg, page_reg, base_addr;
        unsigned long   int addr_tmp;   /* for effective address.. */
                                        /* long must be 24bits or larger */
        unsigned int    itmp, itmp2, dmatimer;

	/* set up the register addresses.. */
			addr_reg = DMA_ADDR_REG;
			count_reg = DMA_COUNT_REG;
			page_reg = DMA_PAGE7;


	/* assume the packet lives in the low 64KB of memory. */

	/* but these are word addresses.. */
	base_addr = (((unsigned int)(packet))>>1)&0xFFFF;


        page = (unsigned char)(0);
        

        /* we assume that the DMAinit() code set the count register */
        /* for this channel to FFFF before the first call. We always*/
        /* check that the count contains this before loading anything */
	 dmatimer = 0;
	 itmp = readDMAreg(count_reg);
        if (itmp != 0xFFFF)
                {
                while ((itmp=readDMAreg(count_reg)) != 0xFFFF)
                        {
			 /* wait around a bit.. */
			 if (memtest(0x1000) != 0)
				{
				errors++;
				curmemloc = (unsigned long *)MEMTEST_START;
				}
			 itmp2 = inp(0x2e0);
			 if ((itmp2&0x80) != 0)
				{
				printf(" !! DSP fault !! Pass=%d ",passes);
				printf(" [current DMA count=0x%x]\n",
				  itmp);
				return(-2);

				return(-1);
				}
			 if (dmatimer++ > 30) /* more than a frame.. */
				{
				printf(" !! DMA wait timed out !! Pass=%d ",
					passes);
				printf("[current DMA count=0x%x]\n",
				  itmp);
				return(-2);
				}
                        }
                }

        /* mask the channel */
        outp(DMA_SINGLE_MASK,
                0x7);
        /* start loading the registers.. */
        outp(page_reg,page);
        writeDMAreg(addr_reg,base_addr);
        writeDMAreg(count_reg, length);
        /* set the mode.. */
        outp(DMA_MODE,
                3 |
                DMA_READ |
                DMA_BLOCK);

	/* clear the dmadone bit.. */
	itmp = inp(0x2e0);
	itmp |= 0x8;
	outp(0x2e0, itmp);

	/* check that there is no interrupt request set */
	itmp = inp(0x20);
	if (itmp&0x80)
		{
		printf("? DMA irq not cleared? \n");
		errors++;
		}

        /* and finally, unmask the channel.. */
        outp(DMA_SINGLE_MASK,3);    /* Poof! */
	return(0);
}


void DMAinit()
{
        /* masks the DMA channel and sets the count to FFFF, so that */
        /* we're in a consitent state for later DMA.. */

	int	i;

	/* we mask all channels before we start.. */

	for (i=0;i<4;i++)
		{
		outp(LOW_DMA_MODE,i);
		outp(DMA_MODE, i);
		}

	/* set the channel 7 count to FFFF so that the rest of */
	/* the code knows we're ready.. */
	outp(DMA_CLRPTR, 0); /* clear FF*/
	outp(DMA_COUNT_REG, 0xFF);
	outp(DMA_COUNT_REG, 0xFF);


}


unsigned int readDMAreg(addr)
unsigned int addr;
{
	unsigned int temp;
	temp = 0;
	outp(DMA_CLRPTR, 0); /* clear FF*/
	temp = inp(addr);
	temp |= inp(addr)<<8;

	return(temp);
}


void writeDMAreg(addr,data)
unsigned int addr, data;
{
	outp(DMA_CLRPTR, 0); /* clear FF*/
	outp(addr, data&0xFF);
	outp(addr, (data>>8)&0xFF);

}

unsigned int inportb(addr)
unsigned int addr;
{
	return(inp(addr));
}

void outportb(addr,data)
unsigned int addr, data;
{
	outp(addr,data);
}

unsigned int memtest(length)
unsigned int length;
{
	unsigned int i;
	unsigned long read_data;
	for (i=0;i<length;i++)
		{
		/* decide what to do */
		switch (curmemmode)
			{
			case 0:
				/* this is an initialization pass. */
				*curmemloc = (unsigned long)(curmemloc);
				curmemloc++;
				if ((unsigned long)curmemloc > MEMTEST_END)
					{
					curmemloc =
						(unsigned long *)MEMTEST_START;
					curmemmode++;
					}
				break;
			case 1:
				/* read the old address data, write inverse. */
				read_data = *curmemloc;
				if (read_data != (unsigned long)curmemloc)
					{
					printmemerr(
						(unsigned long)curmemloc,
						read_data);
					return(1);
					}
				/* write the new data */
				*curmemloc = ~(*curmemloc);
				curmemloc++;
				if ((unsigned long)curmemloc > MEMTEST_END)
					{
					curmemloc =
						(unsigned long *)MEMTEST_START;
					curmemmode++;
					}
				break;
			case 2:
				/* read the ~address, write a pattern */
				read_data = *curmemloc;
				if (read_data != ~((unsigned long)curmemloc))
					{
					printmemerr(
						~((unsigned long)curmemloc),
						read_data);
					return(1);
					}
				/* write the new data */
				*curmemloc = 0xAAAAAAAAL;
				curmemloc++;
				if ((unsigned long)curmemloc > MEMTEST_END)
					{
					curmemloc =
						(unsigned long *)MEMTEST_START;
					curmemmode++;
					}
				break;
			case 3:
				/* check the pattern, write ~pattern */
				read_data = *curmemloc;
				if (read_data != 0xAAAAAAAAL)
					{
					printmemerr(
						0xAAAAAAAAL,
						read_data);
					return(1);
					}
				/* write the new data */
				*curmemloc = ~(*curmemloc);
				curmemloc++;
				if ((unsigned long)curmemloc > MEMTEST_END)
					{
					curmemloc =
						(unsigned long *)MEMTEST_START;
					curmemmode++;
					}
				break;
			case 4:
				/* check the pattern, but don't write anything */
				read_data = *curmemloc;
				if (read_data != 0x55555555L)
					{
					printmemerr(
						0x55555555L,
						read_data);
					return(1);
					}
				curmemloc++;
				if ((unsigned long)curmemloc > MEMTEST_END)
					{
					curmemloc =
						(unsigned long *)MEMTEST_START;
					curmemmode = 0;
					}
				break;




			}


		}
	return(0);	/* pass */
}

void printmemerr(exp,rec)
unsigned long exp, rec;
{
	printf("Memory error: expected=%08x, received=%08x, addr=%08x\n",
		exp, rec, (unsigned long)curmemloc);
}

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




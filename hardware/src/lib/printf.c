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
 *    File Name:	printf.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Kernel printf support ...
 *      The following printf commands are supported:
 *
 *      %s      Print variable length string.  String is null terminated.
 *      %f      Print variable length far string.  String is null terminated.
 *      %c      Print character.
 *      %b      print unsigned number in binary. 
 *      %d      Print signed number in decimal.
 *      %u      print unsigned decimal number.
 *      %x      Print hex number with a default of 4 digits of precision.  As
 *              many bytes will be converted as necessary to satisfy the
 *              precision specifier.  Print out any alpha characters in
 *              the same case as X.
 *      %o      Print number in octal notation.
 *
 * [width]  only is specified here ... a leading zero means conversion
 * will be zero padded to make the field always be with.
 *
 *   defaults widths are ....
 * 
 *      b               16
 *      o               6
 *      h               4
 *      d,u     5
 *
 * Escaped characters
 * ------- ----------
 *
 *      \n      print carriage return linefeed
 *      \t      print tab
 * \f form feed
 * \b bell
 * \r return only
 *
 ***********************************************************************
 *    Revision History:
 * 0001 15-SEP-95 cjl Changed escaped character case to '\' for ansi c.
 * 0002 20-SEP-95 jdb fixed handling of escape-code chars
 */
 
#include "defs.h"
#include "esc.h"
#include "cmd.h"
#include "kernel.h"
#include "dectalk.h"
#define _WINDLL /*make varagrs work OK? ...tek 12may95 */
#include <stdarg.h>


/*
 *  the following structure is used to control the formatting routines
 */


typedef struct printf_context {

	unsigned                        flags;                          /* conversion flags */
	short int               width;                          /* the width of the field */
	short int               radix;                          /* binary, octal, hex, etc ... */
	char  _far              *fs;                                    /* pointer to format string */
/*      int     _far            * arg;                                  */ /* pointer to argments */
	int                             arg;                                    /* argment value */
	} PF_CONTEXT;


#define FLAG_leading_zero               0x0001
#define FLAG_upper_case         0x0002
#define FLAG_signed                             0x0004

#define FS                      (*ptx.fs)
#define POP_FS  (*ptx.fs++)
#define NEXT_FS (ptx.fs++)
#define POP_INT (*ptx.arg++)

int convert_number(PF_CONTEXT _far *);

int __far printf(char __far *format,...)

/* __far printf(char __far *format,int args)*/
/* char _far *format;  */
/* int args;  */
{

	PF_CONTEXT      ptx;
/*      int     number;*/
	char *str;
	char _far *fstr;
/*      int args; old printf doesn't work with variable args 3/13/95 cjl*/
	va_list vargs;  /*Macro to unwrap variable list of args, defined <stdarg.h>
/*
 *  set up some pointers that we may need later ...
 */


	ptx.fs = format;
/*      ptx.arg = (unsigned int _far *)&args;  removed, 3/13/95 cjl*/
/* 3/13/95 cjl Add new routines to load args using va_start,va_arg,va_end*/
	va_start(vargs,format); /* Points to 1st unnamed arg AFTER format.*/

/* walk the format string */
    
	while (FS) {
	    switch (FS) {

/***************************************************************
 *  handle a format specifier 
 */

	    case '%':

			NEXT_FS;

/*
 *  set up the defaults ...
 */

		ptx.width = 0;
			ptx.flags = 0;
			ptx.radix = 0;

/*
 * field width is specified in format string
 */ 

	     if(FS == '0')
	       {
	       ptx.flags |= FLAG_leading_zero;
	       NEXT_FS;
	       }
		  while ((FS >= '0')  && ( FS <= '9'))
		   {
			ptx.width *= 10;
			ptx.width += POP_FS - '0';
			}


/*
 * test for an upper case conversion
 */

		   if((FS >= 'A') && ( FS <= 'Z'))
				ptx.flags |= FLAG_upper_case;
	      ptx.radix = 0;
		   switch (FS) {

/*
 * single character converison.  The precision determines
 * how many times the character is repeated, but then only
 * if the precision has been explicitly defined.
 */

		    case 'c':
		    case 'C':

/*                         putc(POP_INT); 3/13/95 cjl rewritten.*/
/*                              Sample: printf("This is the character %c\n",'c');*/
				putc(va_arg(vargs,int)); /*Should return 1 char*/
		      break;

		    case 'F':
		    case 'f':
	  
/*               FP_OFF(fstr) = POP_INT; 3/13/95 cjl rewritten.*/
/*               FP_SEG(fstr) = POP_INT; 3/13/95 cjl rewritten.*/
/*                              Sample: printf("This is the float number %f\n",9.0/5.0);*/
		 FP_OFF(fstr) = va_arg(vargs,int); /*Should return 1st part double.*/
		 FP_SEG(fstr) = va_arg(vargs,int); /*Should return 2nd part double.*/

		 while(*fstr)
		   putc((*fstr++));
			   break;


		    case 'S':
		    case 's':

/*               (unsigned int)(str) = POP_INT; 3/13/95 cjl rewritten.*/
/*                              Sample: printf("This is the string %s\n","test");*/
		 str = va_arg(vargs,char*);             /*Should address of string.*/
		 while(*str)
		   putc((*str++));
			   break;

		    case 'X':
		    case 'x':
/*                              Sample: printf("This is the hex number %x\n",A);*/
		 ptx.radix = 16;
		 break;
				 
		    case 'D':
		    case 'd':
/*                              Sample: printf("This is the decimal number %d\n",-10);*/
				ptx.flags |= FLAG_signed;
		ptx.radix = 10;
		 break;

		    case 'U':
		    case 'u':
/*                              Sample: printf("This is the unsigned number %u\n",10);*/
				ptx.radix = 10;
			   break;
	
		    case 'O':
	       case 'o' :
/*                              Sample: printf("This is the octal number %o\n",f);*/
		 ptx.radix = 8;
		 break;

		    case 'B':
		    case 'b':
/*                              Sample: printf("This is the binary number %b\n",1101);*/
		 ptx.radix = 2;
		      break;

		    };
	     if(ptx.radix)
		{
		ptx.arg = va_arg(vargs,int); 
		convert_number(&ptx);
		}
	     NEXT_FS;
		  break;

/**************************************************************
 * handle the escaped characters ...
 */

/* note: we don't handle many of the other escape codes here... */  
		case '\n' :
           putc(0xA);
		    putc(0xD);
		   	NEXT_FS;
			break;

		case '\b' :
           putc(0x7);
		   NEXT_FS;
		   break;

		case '\f' :
           putc(0xc);
		   NEXT_FS;
		   break;

		case '\r' :
           putc(0xd);
		   NEXT_FS;
		   break;

/*
 *  finally, if no formatting, just send out the character ...
 */

	    default:
		   putc(POP_FS);
		   break;

	   };    /* end switch(FS) */
	 }               /* end while(FS) */
	 return(1);
}

/*
 * Common routine for unsigned numeric conversions
 */

#define RADIX                   ((*ptx).radix)
#define FLAGS                   ((*ptx).flags)
#define WIDTH                   ((*ptx).width)
/*#define       ARG_VALUE       ((int)(*(*ptx).arg)) */
#define ARG_VALUE       ((int)(*ptx).arg)


int convert_number(PF_CONTEXT _far *ptx)
/*PF_CONTEXT    _far *ptx;*/
{

	char            db[17];
	char            adj;

	int             slen;
	unsigned int            quo,rem,temp;     

/*
 * convert to ascii.  The following loop has the desired side
 * effect of suppressing leading zeros, except if the number
 * is 0, in which case, a single '0' appears in the output.
 */
#ifdef DEBUG
/* Debug printf problem; what value get's here? 3/15/95 cjl */
	putc(((int)(*ptx).arg));
#endif

	if((FLAGS & FLAG_signed) && (ARG_VALUE < 0))
	   {
	   putc('-');
	   quo = 0 - ARG_VALUE;
	   }
	else
	   quo = ARG_VALUE;

/*      (*ptx).arg++; removed in the rewrite 3/13/95 cjl*/
	adj = (FLAGS & FLAG_upper_case) ? 'A'- 10 : 'a'- 10;

	slen = 0;
	do {
	  temp = quo/RADIX;
	  rem = quo - (temp*RADIX);
	  quo = temp;
	  db[slen++] = (rem > 9) ? (char)rem+adj : (char)rem+'0';
	  } while (quo);

/*
 *  print leading zero's ...
 */

	if((FLAGS & FLAG_leading_zero) && (slen < WIDTH))
	  for(;slen<WIDTH;slen++)
	    db[slen] = '0';     
	
/*
 * Send out the converted number in the reverse order it was built
 * in.
 */

	while(slen)
	  {
	  slen -= 1;
	  putc(db[slen]);
	  }        
	  return(1);
}

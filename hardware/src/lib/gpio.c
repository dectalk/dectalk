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
 *    File Name:	gpio.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * this file contains the code that twiddles the GPIO regs on at DTPC2;
 * it does nothing on a DTPC1 (yet)
 *
 ***********************************************************************
 *    Revision History:
 * 14jul95	...tek		Initial
 * 30oct95	...tek		added port_out_186, port_in_186
 * 13nov95  ...cjl temporarily commented out port_out/in_186 (process bug)
 * 15nov95  ...cjl duplicate calls in old sevrs.asm. New one checked out.
 * 11dec95	...tek		merge with DTEX (use DTEX define)
 */

#include	"kernel.h"
#include "pcport.h"
#include	"186.h" 
#include "hardw.h"
#include "defs.h"
#include <conio.h>	/* for inp, outp */
#pragma intrinsic(_inp, _inpw, _outp, _outpw)                          
                        
int port_out_186(unsigned port, unsigned value)
{
	return(_outpw(port, value));
}
int port_in_186(unsigned port)
{
	return(_inpw(port));
}
                          
#ifdef DTPC2
void set_gpio0(unsigned short int bits)
{
 	unsigned short int image,flags;
 	flags = kernel_disable(); /* can't have someone else run.. */
 	image = KS.gpio0_image;
 	image |= bits;
 	KS.gpio0_image = image;
 	_outpw(GPIO0,image);
 	kernel_enable(flags);
}  
void set_gpio2(unsigned short int bits)
{
 	unsigned short int image,flags;
 	flags = kernel_disable(); /* can't have someone else run.. */
 	image = KS.gpio2_image;
 	image |= bits;
 	KS.gpio2_image = image;
 	_outpw(GPIO2,image);
 	kernel_enable(flags);
}             

void clr_gpio0(unsigned short int bits)
{
 	unsigned short int image,flags;
 	flags = kernel_disable(); /* can't have someone else run.. */
 	image = KS.gpio0_image;
 	image &= ~bits;
 	KS.gpio0_image = image;
 	_outpw(GPIO0,image);
 	kernel_enable(flags);
}  

void clr_gpio2(unsigned short int bits)
{
 	unsigned short int image,flags;
 	flags = kernel_disable(); /* can't have someone else run.. */
 	image = KS.gpio2_image;
 	image &= ~bits;
 	KS.gpio2_image = image;
 	_outpw(GPIO2,image);
 	kernel_enable(flags);
}             
#endif /* DTPC2 */

#ifdef DTEX	/* ...tek 11dec95 */

unsigned char set_gpio(bits)
unsigned char bits;
{
	/* careful, there's a write-one-to-clear bit in there.. */
	if (bits&DSPDMADONE)
		_outp(GPIO, _inp(GPIO) | bits);
	  else
		_outp(GPIO,
		  (_inp(GPIO) | bits) & ~DSPDMADONE);
	return (_inp(GPIO));
}

unsigned char read_gpio()
{
	return(_inp(GPIO));
}

unsigned char clear_gpio(bits)
unsigned char bits;
{
	int mask;
	mask = ~bits;
	mask &= ~DSPDMADONE;
	_outp(GPIO, _inp(GPIO) & mask);
	return (_inp(GPIO));
}
#endif /*DTEX*/

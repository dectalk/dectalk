#ifndef NO_CMD
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
 *    File Name:	cmd_get.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *
 ***********************************************************************
 *    Revision History:
 *
 * ...tek       30may95    	remove flush interlock. 
 * ...tek       30may95     fix sleep in sync_char  
 * ...tek		03jan96		merge with dtex. remove the eab 8/94
 *							^k -> [:sync] hack(s).
 *
 */

#include <stdio.h>
#include        "cmd_def.h"
#include "pcport.h"
#include "kernel.h"
/*
 *  getseq() is used to parse incoming strings from the host, the
 *  sequences are either old type escape sequences or new type command
 *  sequences.  A sequence structure is returned to the main command
 *  parser, with either a valid escape sequence, a character, or a
 *  command introducer.  A bad sequence now stays here until a valid
 *  sequence is entered.
 */

#ifdef DTEX    
/* what we use to do a power beep.. */
unsigned char pwrbeep[]="\013 [:tone 500 500] \013";
#endif /*DTEX*/

#ifdef SINGLE_THREADED
unsigned int getseq(unsigned char inchar)
#else
unsigned int getseq()
#endif
{
	register int    c,ac;
//	int     pipe_value;

#ifndef SINGLE_THREADED
	while(true)
#endif
	{
		ac=inchar;
		if (KS.halting)
			{
			// tek 6/16/94:
			// in a heavy-handed way. just blow everything
			// away if we're doing a command-register flush.
			reset_command(STATE_NORMAL);
#ifdef ESCAPE_SEQUENCES
			SP.type=0;
#endif
			return(0xb);
			}
//#ifndef FULL_LANGUAGE_SUPPORT
		c = ac;
//#else
//		c = KS.code_page[ac];
//#endif

		/* GL 10/22/1996, force xb to perform the exact same function like [:sync] */
                /* the next if statement will force 0xb to act like [:sync] */
                /* 
		if (c == 0xb)
		{
		    cmd_sync();
		    continue;
		}
                */

		/* ...tek 1/3/96 There was a lot of stuff in here from ~8/94
		 * having to do with munging around with ^k syncs. As far as 
		 * I can tell, that is no longer needed because cmd_pars should
		 * do the right thing if you just pass the ^k (0xb) back - that's
		 * the way dtex implements sync. Most of this was already commented
		 * out anyway, so I deleted it.
		 */


		if(c != 0xb || c !=' ')/*eab 8/94 don't arm on internal stuff*/
			{
			 KS.input_timeout = timeout;/*got a character so arm timeout*/
				}

		if(KS.cmd_flush)
			{
			if(KS.cmd_flush == CMD_flush_toss)
				{      
				// always pass a sync on through!
				if (ac == 0xb)  //VT
					return(ac);				
#ifdef SINGLE_THREADED
				return(0);
#else
				continue;
#endif
				}
			else if(KS.cmd_flush == CMD_flush_sync)
				{
				if(ac == CMD_sync_out)
					{
					/* this is the flush_char path, which isn't 
					 * used anymore but exists for backward
					 * compatibility .. Hm, DTEX may still use
					 * this path.. tek 1/3/95 */
					ac = getc(stdin) & 0xff;
					c = KS.code_page[ac]; 

					type_out(c);
#if  defined(DTEX) || defined(SIMULATOR)
					//block(NULL_FP); /* that's enough */
#else /* not dtex*/
					sleep(0); /* let it flow through. */
#endif /*dtex*/
					}
				else if(ac != CMD_sync_char)
#ifdef SINGLE_THREADED
				return(0);
#else
					continue;
#endif
			}
			flush_done();
			while(KS.spc_flush_reset != 0)
				{
#ifdef	SIMULATOR
				//block(NULL_FP);
#else
				sleep(0);
#endif
				}
			//reset_command(STATE_NORMAL);
			status_clear_update(STAT_flushing);
			/* ...tek 30may95 get rid of this FLUSH_DONE  */
			/* status_set_update(FLUSH_DONE); xxx eab needed to full interlock flush */
//			SP.type = 0;    
#ifdef DTEX
			/* this probably only makes sense on a serial line.. */
			putc(XON);                                             
#endif /*dtex*/
			
#ifdef SINGLE_THREADED
				return(0);
#else
			continue;
#endif
		}
/*
 *  first, look for escape codes ... note that these do no nest if you
 *  screw up an escape sequence it just gets tossed ...
 */
#ifdef ESCAPE_SEQUENCES
		if (c==ESC || c==DCS || c==CSI || c==OSC || c==PM || c==APC)
			{
			if(c != ESC)
				KS.eight_bit = true;
			SP.type   = c;
			SP.pintro = 0;
			SP.ninter = 0;
			SP.nparam = 0;
			SP.badf   = false;
			continue;
			}
#endif
/*
 *  if we are not in an escaped sequence just pass this along ...
 */
#ifdef ESCAPE_SEQUENCES
		if (SP.type == 0)
#endif
		{
#ifdef PRINT_OUTPUT
			if(KS.logflag & LOG_TEXT)
				{
				putc(ac,stdout);
				}
#endif
			return (c);
			}
/*
 *  if we are make sure this is valid for later processing ... if not
 *  toss everything and pass this along ...
 */
#ifdef ESCAPE_SEQUENCES
		if ((c>=0x80 && c<=0x9F) || c==CAN || c==SUB)
			{
			SP.type = 0;
			if(KS.logflag & LOG_TEXT)
				putc(ac,stdout);
			return (c);
			}
#endif
/*
 *  Imbedded C0 controls ...  these are passed on to the parser then we
 *  resume escape processing from here...
 */
		if (c<0x20 || c==DEL || c==RDEL)
			{
#ifdef PRINT_OUTPUT
			if(KS.logflag & LOG_TEXT)
				putc(ac,stdout);
#endif
			return (c);
			}

#ifdef ESCAPE_SEQUENCES
		if (c>=0x20 && c<=0x2F)
			{
			if (SP.ninter < NUM_INTER)
				SP.inter[SP.ninter++] = c;
			else
				SP.badf = true;
			continue;
			}
#endif
/*
 *  the following loop reads parameters into the sequence fields ...
 */

#ifdef ESCAPE_SEQUENCES
		if (SP.type!=ESC && c>=0x30 && c<=0x3F)
			{
			if (SP.ninter != 0)
				SP.badf = true;
			switch (c)      {

/*
 *  Build a decimal number in the param array ...
 */
				case    0x30    :
				case    0x31    :
				case    0x32    :
				case    0x33    :
				case    0x34    :
				case    0x35    :
				case    0x36    :
				case    0x37    :
				case    0x38    :
				case    0x39    :
					if(SP.nparam == 0)
						{
						SP.param[0] = 0;
						SP.nparam += 1;
						}
					SP.dflag[SP.nparam-1] = false;
					SP.param[SP.nparam-1] *= 10;
					SP.param[SP.nparam-1] += c - 0x30;
					break;
/*
 *  semi-colons seperate the arguments ...
 */
				case    0x3a    :

					SP.badf = true;

				case    0x3b    :

					if(SP.nparam < NUM_PARAM)
						{
						SP.dflag[SP.nparam] = true;
						SP.param[SP.nparam] = 0;
						SP.nparam += 1;
						}
					else
						SP.badf = true;
					break;

				case    0x3c    :
				case    0x3d    :
					SP.badf = true;
					break;

				case    0x3e    :
				case    0x3f    :
					if(SP.pintro || SP.nparam)
						SP.badf = true;
					SP.pintro = c;
					break;
				};
			continue;
			}
/*
 *  escape processing ... escapes are turned into DCS (ESC P),
 *  CSI (ESC [), OSC(ESC ]), PM(ESC ^) or APC (ESC _) all others
 *  include ST (ESC \) are converted and returned ...
 */

		if(SP.type == ESC && SP.ninter == 0 && c>= 0x40 && c<= 0x5f)
			{
			c += 0x40;
			if (c!=DCS && c!=CSI && c!=OSC && c!=PM && c!=APC)
				{
				KS.eight_bit = false;
				SP.type = 0;
				if(KS.logflag & LOG_TEXT)
					putc(ac,stdout);
				return (c);
				}
			SP.type   = c;          /* Begin new sequence   */
			SP.pintro = 0;
			SP.ninter = 0;
			SP.nparam = 0;
			SP.badf   = false;
			continue;
			}

		SP.final = c;                   /* Final                */
		c  = SP.type;
		SP.type  = 0;
		if(SP.badf)
			continue;
#endif
		return (c);
		}
}


#endif
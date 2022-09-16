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
 *    File Name:	tsr_mult.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC I/O support ... this module contains all the interface
 *  code that knows how to talk to a DECtalk module ... when dos
 *  applications need to communicate characters or control to the module
 *  it is all threaded through here ...
 *
 ***********************************************************************
 *    Revision History:
 * 28JUN95  ...CJL    Add in SEND_BUFF; TSR_MAX_SEND_BUFF (=64)
 *                                           & TSR_MAX_BUFF_SIZE (=256).
 * 06nov95	...tek		change flush_char to use only the command/data
 *						regs rather than command/DMA to avoid a race.
 * 14feb96	...tek		merge DECtalk Express..
 * 07may96	...tek		correct action of FLUSH_CHAR on dtexp, coalesce
 *								some of the express flush code into a routine.
 * 07may96  ...cjl		touched with latest 4-8 board fix.
 * 10Apr97  ...tek      for BATS#348 fix the hanging problem.
 *                      will not activate this code at this point.
 */



#include "tsr.h"
#include "esc.h"
#include	"tsrp.h" 
#ifdef DTEX
#include "ser_tsr.h"
#endif /*dtex*/
#include <time.h>

void (__interrupt _far *old_int2f)();		/* multiplex thread */
void (__interrupt _far *old_int1c)();		/* timer thread */

unsigned int exit_bp;
void _far *psp_ptr;
union INT_REGS	_far *dosframe;
unsigned int ret_data;

#ifdef DTEX
unsigned long int last_int_tick, dt_ticks;
// where we build strings to send. It's bigger than we need, so that 
// we can do more than one thing at a time..
unsigned char dleoutbuf[10] = {0x10,0,0,0,0,0,0,0,0,0};
#endif /*DTEX*/

#define	DF			(*dosframe)
#define	DFB		(*dosframe).byte_regs
#define	DFW		(*dosframe).word_regs

/* hack: try to debug the hang 10apr97 tek*/
/* #define DEBUG_041097 */
/*
   this problem is documented in BATS#348.  it only hang on some special
   hardware.  We will not activate this change at this point.
   GL 04/23/1997
*/
/* make sure all writes get out to the bus.*/
#ifdef DEBUG_041097
#include <conio.h>
#pragma intrinsic(_inp, _outp)
#define outp(x,y) {_outp(x,y);_inp(DT_DI_LOW);}
#endif /*DEBUG_041097*/


/*
 *  Multi-plex handler ... takes care of id requests, termination, status,
 */


void interrupt _far multi_plex_int(int_frame)
union INT_REGS	int_frame;
{

	unsigned char _far *ppb;					/* paramter pointer block */
	unsigned char huge *cb;						/* string copy buffer */
	struct 	dectalk_load_pb _far *lpb;
	struct	dectalk_char_buff _far *cpb;
	int	i,j,max_count,can_do_command;
#ifdef DTEX
	int	command;
#endif /*dtex*/
	_disable();
	if((IFB.ah == DECTALK_ID) && (DTC.tsr_busy == false))
    	{
		DTC.tsr_busy = true;
#ifdef DTEX
		global_busy = true;	// this flag tells us we should
					// check to make sure the UART
					// hasn't gotten stuck behind
					// another interrupt.
#endif /*DTEX*/
/*
 *  enter critical section ...
 */
		if(in_windows)
			{
			_asm 	mov	ax,0x1681
			_asm	int	0x2f
			}

/*
 *  switch stacks to the tsr stack ...	dosstack saves the dos stack pointer,
 *  dos frame, points at the call frame, and tsr stack become the new stack
 *  adjusted by the same amount the 'c' compiler does for local variables
 *  referenced via bp ... note that no local variables can be used before
 *  this point.
 */

		_asm	mov word ptr dosstack[0],sp
		_asm	mov word ptr dosstack[2],ss
		_asm	mov word ptr dosframe[0],bp
		_asm	mov word ptr dosframe[2],ss
		_asm	mov ax,bp
		_asm	sub ax,sp
		_asm	mov sp, word ptr tsrstack[0]
		_asm  mov ss, word ptr tsrstack[2]
		_asm	mov bp,sp
		_asm	sub sp,ax
		_asm	mov ax,ds
		_asm	mov es,ax
		_enable();


/*
 *  See which module we want to talk to ...
 */

		can_do_command = true;
		module_index = 0;
		if(num_modules > 1)
			{
			if(DFW.si >= num_modules)
				{
				can_do_command = false;
				DTC.error_status = ERROR_no_module;				
				DFW.ax = TSR_FAILURE;
				}
			else
				module_index = DFW.si;
			}

/*
 *  update the status ...
 */

		set_status(dtc[module_index]);

/*
 *  Check to see if we have switched out of boot mode yet, if not then
 *  make sure we can do this command.
 */

		if(DTC.id == ID_boot)
			{
			switch(DFB.al)
				{
				case	INSTALL_CHECK	:
				case	DECTALK_TEST	:
				case	DECTALK_EXIT	:
				case	DECTALK_RESET	:
				case	GET_STATUS		:
				case	GET_ID			:
				case	GET_WIN_BUFF	:
				case	GET_DTC			:
				case	KERNEL_SYNC		:
					break;
				default					:
					DTC.error_status = ERROR_bad_mode;
					DFW.ax = TSR_FAILURE;
					can_do_command = false;
					break;
				};
			}

/*
 *  now, do whatever the command says ...
 */

		if(can_do_command)
			{
			switch(DFB.al)
				{
				case	INSTALL_CHECK	:
					DFB.al = INSTALLED;
					DFW.si = num_modules;
               break;

				case	VOLUME_UP	:
					DFW.ax = do_immd(CMD_control+CTRL_vol_up,DFB.bl);
					break;

				case	VOLUME_DOWN	:
					DFW.ax = do_immd(CMD_control+CTRL_vol_down,DFB.bl);
					break;

				case	VOLUME_SET	:
					DFW.ax = do_immd(CMD_control+CTRL_vol_set,DFB.bl);
					break;

				case	PAUSE_OUTPUT	:
					DFW.ax = do_immd(CMD_control+CTRL_pause,0);
					break;

				case	RESUME_OUTPUT	:
					DFW.ax = do_immd(CMD_control+CTRL_resume,0);
					break;

				case	FLUSH_TEXT	:
#ifdef DTEX /* express-only code */
					DFW.ax = do_a_flush();	/* put into a routine 7may96 */
#else /* non-express only code */
					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					if((DFW.ax = do_immd(CMD_control+CTRL_flush,0)) == TSR_FAILURE)
						break;
					outp(DT_DMA,DMA_sync);
					outp(DT_DMA,0);
					DFW.ax = wait_flush();
#endif /*DTEX*/
					break;

				case	FLUSH_CHAR	:

#ifdef DTEX /* the express does this quite differently.. */
				  	DFW.ax = do_a_flush();
					if (DFW.ax == TSR_FAILURE)
						break;

					// send the character to speak..
					dleoutbuf[0]=DLE;
					dleoutbuf[1]='q';
					dleoutbuf[2]=((DFB.bl&0xF0)>>4)+'`';
					dleoutbuf[3]=(DFB.bl&0xF)+'`';
					dleoutbuf[4]=VT;
					while (p_sendbuf(dleoutbuf,5) == 0)
						check_is_bit();
					DTC.max_ticks=3*DOS_TPS; // 1 sec..?
					do {
					   check_is_bit();
					   }
					  while (DTC.max_ticks && peek_p_outbuf());

					un_xoff(); // clear the serial port XOFF state.


#else /*DTEX*/	/* dtpc code.. */

					if((DFW.ax =
						do_immd(CMD_control+CTRL_flush+FLUSH_type_char,DFB.bl)
					    ) == TSR_FAILURE)
						break;
					/* we no longer use the DMA path. */
					/*outp(DT_DMA,DMA_sync_char);*/
					/*outp(DT_DMA,DFB.bl);*/
					DFW.ax = wait_flush();
#endif
					break;


			case	FLUSH_SPEECH	:
				DFW.ax = do_immd(CMD_control+CTRL_flush,1);
				break;

			case	IMMD_VOICE	:

				DFW.ax = do_immd(CMD_control+CTRL_speech+CTRL_SP_voice,DFW.bx);
				break;

			case	IMMD_RATE	:

				DFW.ax = do_immd(CMD_control+CTRL_speech+CTRL_SP_rate,DFW.bx);
				break;

			case	IMMD_RATE_DELTA	:

				DFW.ax = do_immd(CMD_control+CTRL_speech+CTRL_SP_rate_delta,DFW.bx);
				break;


			case	IMMD_PERIOD	:

				DFW.ax = do_immd(CMD_control+CTRL_speech+CTRL_SP_period,DFW.bx);
				break;

			case	IMMD_COMMA	:

				DFW.ax = do_immd(CMD_control+CTRL_speech+CTRL_SP_comma,DFW.bx);
				break;

			case	BUFF_FREE	:
#ifdef DTEX
				// this is a hack. Because of historical bugs,
				// many applications check to see how much is
				// in the output buffer to avoid putting a lot
				// of stuff in it (and having flush problems).
				// unfortunately, they do this by assuming a 4K
				// buffer, and checking to see if there is almost
				// 4K free. Bad bad bad. In our case, the 'free
				// buffer' is the serial output buffer of the 
				// TSR (which is where you put things with 
				// SEND_BUFF..). This is carved out of DOS memory,
				// so having huge buffers will reduce the 
				// available memory under 640K. 
				//
				// So, here's the hack. If the output buffer has
				// less than 256 characters in it, we return 
				// (4096 - count).  If the buffer has at least 256
				// characters in it, we return the actual free 
				// space. Why 256? well, in theory the largest buffer
				// you can send via SEND_BUFF is 256, so if an
				// application says "Do I have enough space to send
				// X bytes", the answer will always be correct for the
				// largest possible value of X.

				DFW.ax = TSR_SUCCESS;
				_disable();
				i = outbuf.count;
				if (i<256)
					{
					DFW.cx = 4095-i;
					}
				  else
					{
					DFW.cx = outbuf.size-i-1;
					}

				// return 0 if we're XOFF'd 
				if (sense_xoff())
					DFW.cx = 0;
				_enable();
#else /* non-express code */
				DFW.ax = do_immd_get(CMD_control+CTRL_buff_free,&ret_data);
				DFW.cx =  ret_data;
#endif /*dtex*/
				break;
			case	LAST_INDEX	:
#ifdef DTEX /* express-only code */
				set_status(dtc[module_index]);
				// need to do an atomic get-a-valid-index ..
				_disable();
				ret_data = get_data();
				if(ret_data != DTC.lastindex && (DTC.module_status & STAT_index_valid))
					{
					DTC.lastindex = ret_data;
					DFW.cx = ret_data; // assume thats it..
					DFW.ax = TSR_SUCCESS;
					}
				_enable();

				if(DTC.module_status & STAT_new_index)
					{
					DFW.ax = do_immd_get(CMD_control+CTRL_last_index,&ret_data);
					if(DFW.ax == TSR_SUCCESS)
						{
						DFW.dx = DTC.module_status;
						ret_data = get_data(); // more hax..
						DFW.cx = ret_data;
						DTC.lastindex = ret_data;
						}
					}
				else
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					}
				
#else /* non-express only code */
				ret_data = get_data();
				if(DTC.module_status & STAT_new_index)
					{
					DFW.ax = do_immd_get(CMD_control+CTRL_last_index,&ret_data);
					if(DFW.ax == TSR_SUCCESS)
						{
						DFW.dx = DTC.module_status;
						DFW.cx = ret_data;
						DTC.lastindex = ret_data;
						}
					}
				else
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					}
#endif /*dtex*/
				break;
			case	BUFF_USED	:
#ifdef DTEX
				DFW.ax =  TSR_SUCCESS;
				DFW.cx =  outbuf.count;
#else /* non-express code */
				DFW.ax = do_immd_get(CMD_control+CTRL_buff_used,&ret_data);
				DFW.cx =  ret_data;
#endif /*DTEX*/
				break;

			case	FREE_MEM	:

				DFW.ax = do_immd_get(CMD_control+CTRL_free_mem,&ret_data);
				DFW.cx =  ret_data;
				break;


			case	IO_PRIORITY	:
			
				DFW.ax = do_immd(CMD_control+CTRL_io_priority,DFW.cx);
				break;

			case	DECTALK_TEST	:

				DFW.ax = TSR_SUCCESS;
				break;

			case	DIGITIZED_MODE	:
#ifdef DTEX
				DFW.ax = TSR_FAILURE;
				DTC.error_status = ERROR_bad_command;
				break;
#else
				DFW.ax = do_immd(CMD_spc_mode+CMD_spc_to_digit,0);
				break;
#endif /*dtex*/

			case	TEXT_MODE	:

				DFW.ax = do_immd(CMD_spc_mode+CMD_spc_to_text,0);
				break;


/*
 *  DECTALK_EXIT causes the multi-threaded driver to restore the
 *  clean up and remove itself from memory ...  call with ...
 *
 *    ah = DECTALK_ID
 *    al = DECTALK_EXIT
 */ 

			case	DECTALK_EXIT	:
					_disable();
					for(i=0;i<4;i++)
						if(DTI.base)
							{
							outp(DTI.base,0xff);
							outp(DTI.base+1,0xff);
							outp(DTI.base+6,0);
							}
					module_index = 0;
#ifdef DTEX					
					serial_close();
#endif /*dtex*/
					_dos_setvect(0x2f,old_int2f);
					_dos_setvect(0x1c,old_int1c);
					if(DTC.trap & TRAP_SERIAL)
						_dos_setvect(0x14,old_int14);
					if(DTC.trap & TRAP_PARALLEL)
						_dos_setvect(0x17,old_int17);

					FP_SEG(psp_ptr) = _psp;
					FP_OFF(psp_ptr) = PSP_PARENT_PSP;
					*(int _far *)psp_ptr = getpsp();
					FP_OFF(psp_ptr) = PSP_TERMINATE;
					*(long _far *)psp_ptr = (long)&multi_exit;

					
					setpsp(_psp);
					_enable();
   				_bdos(DOS_EXIT, 0, 0);
					break;

			case	DECTALK_RESET	:
#ifdef DTEX /* express-only code */
					flush_ring(&outbuf);
					flush_ring(&p_outbuf);
					// module reset.. send enough
					// nulls to get out of any possible 
					// dle sequence, then blast a ^c.
					dleoutbuf[1]=0;
					dleoutbuf[2]=0;
					dleoutbuf[3]=0;
					p_sendbuf(&dleoutbuf[1],3);
					dleoutbuf[1]=0x03; //^C
					p_sendbuf(&dleoutbuf[1],1);
					// jam all 1's in the cmd register.
					put_command(0xffff);

					DTC.module_status = 0;
					DTC.status = 0;
					DTC.id = ID_boot;
					DTC.dma_count = DTC.cmd_count = 0;
					DTC.flushing = 0;
					DTC.max_ticks = (60*DOS_TPS);
					DFW.ax = TSR_FAILURE;
					// Ask for a status update..
					dleoutbuf[1] = 0x05;
					// p_sendbuf will always work, because
					// we just flushed it..
					p_sendbuf(&dleoutbuf[1],1);
					while(DTC.max_ticks)
						{
						if(DTC.module_status != MODULE_self_test)
							{
							DTC.status = MODULE_self_test;
							DTC.max_ticks = (30*DOS_TPS);
							}
						else if(DTC.module_status == MODULE_init)
							{
							DFW.ax = TSR_SUCCESS;
							break;
							}
						}
#else /* non-express code */
					outp(DT_CMD_LOW,0xff);
					outp(DT_CMD_HIGH,0xff);
					outp(DT_INT,0);
					DTC.module_status = 0;
					DTC.status = 0;
					DTC.id = ID_boot;
					DTC.dma_count = DTC.cmd_count = 0;
					DTC.flushing = 0;
					DTC.max_ticks = (60*DOS_TPS);
					DFW.ax = TSR_FAILURE;
					while(DTC.max_ticks)
						{
						if(((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) == MODULE_self_test &&
							  DTC.status != MODULE_self_test)
							{
							DTC.status = MODULE_self_test;
							DTC.max_ticks = (30*DOS_TPS);
							}
						else if(((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) == MODULE_init)
							{
							DFW.ax = TSR_SUCCESS;
							break;
							}
						}
#endif /*dtex*/
					break;

			case	SEND_CHAR	:
#ifdef DTEX /* express-only code */
				// if xoff'd, return immediately.
				if (sense_xoff())
					{
					DFW.ax=TSR_RETRY;
					break;
					}

				// check to see that we don't have a command
				// still outstanding..
				DFW.ax = wait_cstat(2);
				if (DFW.ax != TSR_SUCCESS)
					break;

				dleoutbuf[1]=DFB.bl;	//char to send..

				if (s_sendbuf(&dleoutbuf[1],1) == 0)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				DTC.chars_out++;
				DFW.dx = DTC.module_status;
				DFW.ax = TSR_SUCCESS;
#else /* non-express code */
				if((DTC.module_status & STAT_rr_char) == 0 || check_dstat() == false)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DMA_single_in);
				outp(DT_DMA,DFB.bl);

				DTC.chars_out++;
				DFW.dx = DTC.module_status;
				DFW.ax = TSR_SUCCESS;
#endif /*dtex*/
				break;

			case	GET_CHAR		:
#ifdef DTEX /* express-only code */
				check_is_bit();
				if (s_getbuf(&dleoutbuf[1],1) == 0)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}


				DFB.bl = dleoutbuf[1];
#else /* non-express code */
				if((DTC.module_status & STAT_tr_char) == 0 || check_dstat() == false)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DMA_single_out);
				outp(DT_DMA,0);

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				DFB.bl = inp(DT_DMA);
#endif /*dtex*/
				DTC.chars_in++;
				DFW.dx = DTC.module_status;
				DFW.ax = TSR_SUCCESS;
				break;

			case	GET_STATUS		:
#ifdef DTEX /*express-only code */
				check_is_bit();
				DFW.dx = DTC.module_status;
				DFW.cx = num_modules;
				DFW.ax = TSR_SUCCESS;
				if (DTC.version_status)
					DFW.bx = 420;         /* dectalk version number is 4.20 */
#else /* non-express code */
				DFW.dx = DTC.module_status;
				DFB.cl = num_modules;
				DFW.ax = TSR_SUCCESS;
				DFB.ch = 422;   /* version number */
#endif /*dtex*/
            break;

	/*
 	*  send a buffer at a time to the module ... the buffer is sent
 	*      TSR_MAX_SEND_BUFF bytes at a time and broken up if the overall
 	*      size is greater than that ...
 	*/

			case	SEND_BUFF	:
#ifdef DTEX /* express-only code */
				FP_SEG(cpb) = DFW.dx;
				FP_OFF(cpb) = DFW.bx;
				// check to see that we don't have a command
				// still outstanding..
				DFW.ax = wait_cstat(2);
				if (DFW.ax != TSR_SUCCESS)
					break;

				DFW.ax = TSR_SUCCESS;
				while(true)
					{
					unsigned short int rcount;
					max_count = ((*cpb).count > TSR_MAX_SEND_BUFF) ? TSR_MAX_SEND_BUFF : (*cpb).count;
					if(max_count == 0)
						break;

					rcount = s_sendbuf(cpb->buff,max_count);
					(*cpb).count -= rcount;
					cpb->buff += rcount;
					}
#else /* non-express code */
				if((DTC.module_status & STAT_rr_char) == 0 || check_dstat() == false)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				DFW.ax = TSR_SUCCESS;
				FP_SEG(cpb) = DFW.dx;
				FP_OFF(cpb) = DFW.bx;

				while(true)
					{
					max_count = ((*cpb).count > TSR_MAX_SEND_BUFF) ? TSR_MAX_SEND_BUFF : (*cpb).count;
					if(max_count == 0)
						break;

					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					outp(DT_DMA,DMA_buff_in);
					if(max_count == TSR_MAX_BUFF_SIZE)
						{
						outp(DT_DMA,0);
						}
					else
						{
						outp(DT_DMA,max_count);
						}
					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					for(i=0;i<max_count;i++)
						{
						outp(DT_DMA,*((*cpb).buff++));
						}
					(*cpb).count -= max_count;
					}

#endif /*dtex*/
				break;
/*
 *  get buff is used to read a whole buffer at a time upto count bytes.
 *  The number of bytes actually read is returned in 'count'.
 */

			case	GET_BUFF		:
#ifdef DTEX /* express-only code */
				if(peek_inbuf() == 0)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				DFW.ax = TSR_SUCCESS;
				FP_SEG(cpb) = DFW.dx;
				FP_OFF(cpb) = DFW.bx;
				cpb->count = s_getbuf(cpb->buff,cpb->count);
#else /* non-express code */
				if((DTC.module_status & STAT_tr_char) == 0 || check_dstat() == false)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				DFW.ax = TSR_SUCCESS;
				FP_SEG(cpb) = DFW.dx;
				FP_OFF(cpb) = DFW.bx;

/*
 * get max and assume we return 0 ...
 */
				max_count = (*cpb).count;
				(*cpb).count = 0;

				while(max_count)
					{
/*
 *  wait to dma then request upto 128 bytes of data ...
 */

					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					i = (max_count > 128) ? 128 : max_count;
					outp(DT_DMA,DMA_buff_out);
					outp(DT_DMA,i);
/*
 *  wait until the dma is ready then read the bytes back, first read
 *  the count byte, the upto 128 data bytes ...  if zero, then we've
 *  drained the buffer so exit back to the caller.
 */

					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					j = inp(DT_DMA) & 0xff;
					if(j == 0)
						break;
					(*cpb).count += j;
					max_count -= j;
					i = j;
					while(i--)
						*((*cpb).buff++) = inp(DT_DMA);
					if(j != 128)
						break;
					}
#endif /*dtex*/
				break;

#ifndef DTEX /* a pile of things that the express doesn't do.. */

/*
 *  allocate a memory block on the dectalk module ... call with ...
 *
 *    ah = DECTALK_ID
 *    al = LOAD_MEM
 *    cx = number of paragraphs to allocate
 *
 *  return ...
 *   dx:bx  = seg:off of address on dt module
 */
			case    ALLOC_MEM       :

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DMA_control);
				outp(DT_DMA,DT_MEM_ALLOC);

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DFB.cl);
				outp(DT_DMA,DFB.ch);

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				DFB.bl = inp(DT_DMA);
				DFB.bh = inp(DT_DMA);
				DFB.dl = inp(DT_DMA);
				DFB.dh = inp(DT_DMA);

				DFW.ax = TSR_SUCCESS;
				break;


/*
 *  load a ram buffer on the module ... call with ...
 *
 *    ah = DECTALK_ID
 *    al = LOAD_MEM
 *    dx:bx = far address of load/read param block structure
 */
			case    LOAD_MEM                :

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DMA_control);
				outp(DT_DMA,DT_LOAD_MEM);

				FP_SEG(lpb) = DFW.dx;
				FP_OFF(lpb) = DFW.bx;
				FP_SEG(ppb) = DFW.dx;
				FP_OFF(ppb) = DFW.bx;

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				for(i=0;i<6;i++)
					{
					outp(DT_DMA,*(ppb+i));
					}

				i = (*lpb).count;
				ppb = (*lpb).buff;

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				while(i--)
					{
					outp(DT_DMA,*ppb++);
					}
				DFW.ax = TSR_SUCCESS;
				break;
/*
 *  load a ram buffer on the module ... call with ...
 *
 *    ah = DECTALK_ID
 *    al = READ_MEM
 *    dx:bx = far address of load/read param block structure
 */
			case    READ_MEM                :

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DMA_control);
				outp(DT_DMA,DT_READ_MEM);

				FP_SEG(lpb) = DFW.dx;
				FP_OFF(lpb) = DFW.bx;
				FP_SEG(ppb) = DFW.dx;
				FP_OFF(ppb) = DFW.bx;

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				for(i=0;i<6;i++)
					{
					outp(DT_DMA,*(ppb+i));
					}

				i = (*lpb).count;
				ppb = (*lpb).buff;

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				while(i--)
					{
					*ppb++ = inp(DT_DMA);
					}

				DFW.ax = TSR_SUCCESS;
				break;

/*
 *  enable a loaded dictionary ... call with ...
 *
 *    ah = DECTALK_ID
 *    al = SET_DIC
 *    dx:bx = far address of load/read param block structure
 */
	
			case    SET_DIC                 :

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DMA_control);
				outp(DT_DMA,DT_SET_DIC);

				FP_SEG(ppb) = DFW.dx;
				FP_OFF(ppb) = DFW.bx;
				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				for(i=0;i<sizeof(struct dectalk_load_dic);i++)
					{
					outp(DT_DMA,*(ppb+i));
					}
				DFW.ax = TSR_SUCCESS;
				break;
/*
 *  enable a loaded dictionary ... call with ...
 *
 *    ah = DECTALK_ID
 *    al = START_TASK
 *    dx:bx = address of routine to start on module.
 */
	
			case    START_TASK                      :


				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				
				outp(DT_DMA,DMA_control);
				outp(DT_DMA,DT_START_TASK);

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				outp(DT_DMA,DFB.bl);
				outp(DT_DMA,DFB.bh);
				outp(DT_DMA,DFB.dl);
				outp(DT_DMA,DFB.dh);
				DFW.ax = TSR_SUCCESS;
				break;

			case    GET_ID  :

				DFW.bx = DTC.id;
				DFW.ax = TSR_SUCCESS;
				break;

			case    GET_DTC :

				_asm    mov     ax,ds
				_asm    mov     i,ax
				DFW.dx = i;
				DFW.bx = (unsigned int)dtc[module_index];
				DFW.ax = TSR_SUCCESS;
				break;

/*
 *  kernel sync is only called a load time to sync the com from boot
 *  to the kernel protocols ...  the kernel is first loaded onto the
 *  module via the boot load protocols, started then synced up with
 *  the driver ...
 */
			case    KERNEL_SYNC     :

				DFW.ax = TSR_SUCCESS;
				DTC.max_ticks = (5*DOS_TPS);
				while((((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) & STAT_dma_ready) == 0)
					if(DTC.max_ticks == 0)
						{
						DFW.ax = TSR_FAILURE;
						break;
						}
				if(DFW.ax == TSR_SUCCESS)
					{
					DTC.dma_count = 0;
					DTC.id = ID_kernel;
					}
				break;

/*
 *  send the spc digitized data ...
 */
		case    DIGITIZED_DATA  :
#ifdef DTEX
				DFW.ax = TSR_FAILURE;
				DTC.error_status = ERROR_bad_command;
				break;
#endif /*dtex*/
				if((DTC.module_status & STAT_digitized) == 0)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				FP_SEG(cpb) = DFW.dx;
				FP_OFF(cpb) = DFW.bx;
				if((*cpb).count > SPC_DIGITIZED_MAX)
					{
					DFW.ax = TSR_FAILURE;
					break;
					}

				DFW.ax = TSR_SUCCESS;
				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,DMA_control);
				outp(DT_DMA,DT_DIGITAL_IN);

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;
				outp(DT_DMA,((*cpb).count&0xff));
				outp(DT_DMA,0);

				if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
					break;

				for(i=0;i<(*cpb).count;i++)
					{
					outp(DT_DMA,SPC_DIGITIZED_DATA);
					outp(DT_DMA,0);
					for(j=0;j<128;j++)
						outp(DT_DMA,*((*cpb).buff++));
					}
				DFW.ax = TSR_SUCCESS;
				break;

#endif /*dtex*/

			case    GET_WIN_BUFF    :

				if(win_buff_size)
					{
					DFW.dx = FP_SEG(win_buff);
					DFW.bx = FP_OFF(win_buff);
					DFW.cx = win_buff_size;
					DFW.ax = TSR_SUCCESS;
					}
				else
					DFW.ax = TSR_FAILURE;
				break;

/*
 *  SEND_WSTRING is used to copy a string from the windows string buffer
 *  to the DECtalk PC module ...
 */

			case	SEND_WSTRING	:

				if(win_buff_size == 0)
					{
					DFW.ax = TSR_FAILURE;
					break;
					}
#ifdef DTEX /* express-only code */
				if(peek_outbuf() > outbuf.size/2)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				DFW.ax = TSR_SUCCESS;
				cb = win_buff;

				while(true)
					{
					unsigned short int rcount;
					max_count = (DFW.cx > 256) ? 256 : DFW.cx;
					rcount = s_sendbuf(cb,max_count);
					DFW.cx -= rcount;
					cb += rcount;
					}
#else /* non-express code */
				if((DTC.module_status & STAT_rr_char) == 0)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				DFW.ax = TSR_SUCCESS;
				cb = win_buff;

				while(true)
					{
					max_count = (DFW.cx > TSR_MAX_SEND_BUFF) ? TSR_MAX_SEND_BUFF : DFW.cx;
					if(max_count == 0)
						break;
					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					outp(DT_DMA,DMA_buff_in);
					if(max_count == TSR_MAX_BUFF_SIZE)
						outp(DT_DMA,0);
					else
						outp(DT_DMA,max_count);
					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					for(i=0;i<max_count;i++)
						outp(DT_DMA,(*cb++));
					DFW.cx -= max_count;
					}
#endif /*dtex*/
				break;

/*
 *  GET_WSTRING is like GET_BUFF, but a the max size is passed in cx and
 *  the string is assumed to be the windows buffer ...
 */

			case	GET_WSTRING		:

				if(win_buff_size == 0)
					{
					DFW.ax = TSR_FAILURE;
					break;
					}
#ifdef DTEX /* express-only code */
				if(peek_outbuf() == 0)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}

				max_count = DFW.cx;
				DFW.ax = TSR_SUCCESS;
				cb = win_buff;
				DFW.cx = s_getbuf(cb,max_count);
#else /* non-express code */
				if((DTC.module_status & STAT_tr_char) == 0)
					{
					DFW.dx = DTC.module_status;
					DFW.ax = TSR_RETRY;
					break;
					}
/*
 * set max count and assume we get none, set succes code and init pointer ...
 */
				max_count = DFW.cx;
				DFW.cx = 0;
				DFW.ax = TSR_SUCCESS;
				cb = win_buff;

				while(max_count)
					{
					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					i = (max_count > 128) ? 128 : max_count;
					outp(DT_DMA,DMA_buff_out);
					outp(DT_DMA,i);
					if((DFW.ax = wait_dstat(30)) == TSR_FAILURE)
						break;
					j = inp(DT_DMA) & 0xff;
					if(j == 0)
						break;
					DFW.cx += j;
					max_count -= j;
					for(i=0;i<j;i++)
						(*cb++) = inp(DT_DMA);
					if(j != 128)
						break;
					}
#endif /*dtex*/
				break;
/*
 *  finally, if we don't know what the command is, say so ...
 */

			default:

				DFW.ax = TSR_FAILURE;
				DTC.error_status = ERROR_bad_command;

			}
		}
	
/*
 *  restore the dos stack and pass this back ...
 */
		_disable();
		_asm	mov bp, word ptr dosframe[0]
		_asm	mov sp, word ptr dosstack[0]
		_asm  mov ss, word ptr dosstack[2]
		_enable();
/*
 *  exit the critical section ...
 */

		if(in_windows)
			{
			_asm 	mov	ax,0x1682
			_asm	int	0x2f
			}

		DTC.tsr_busy = false;  
#ifdef DTEX
		global_busy = false;
#endif /*DTEX*/
    	}

/*
 *  if it was for us and we are busy ...
 */

	else if(IFB.ah == DECTALK_ID)
		{
   		IFW.ax = TSR_BUSY;
		IFW.dx = DTC.module_status;
		}
/*
 *  is windows starting or exiting ...
 */

	else if(IFW.ax == 0x1605)
		{
		in_windows = true;
		_chain_intr(old_int2f);
		}
	else if(IFW.ax == 0x1606)
		{
		in_windows = false;
		_chain_intr(old_int2f);
		}
			
/*
 *  if the call was not for us, pass it on ...
 */

	else
		{
   	_chain_intr(old_int2f);
		}

}

/*
 *  this simply cheats the stack back to where it was at the int 2f
 *  entry so that we can go back to the call successfully ...
 */

void _interrupt _far multi_exit()
{
		_disable();
		_asm	mov bp, word ptr dosframe[0]
		_asm	mov sp, word ptr dosstack[0]
		_asm  mov ss, word ptr dosstack[2]
		_enable();
}

/*
 *  do an cstat type command ...
 */

do_immd(cmd,data)
unsigned int cmd,data;
{
	if(wait_cstat(10) == TSR_FAILURE)
		return(TSR_FAILURE);
	put_data(data);
	return(put_command(cmd));
}
/*
 *  do an cstat type command, without changing the data register.
 */
/* this is probably only used on the express..*/
do_immd_nodata(cmd)
unsigned int cmd;
{
	if(wait_cstat(10) == TSR_FAILURE)
		return(TSR_FAILURE);
	return(put_command(cmd));
}

/*
 *  do an cstat type command ...	except return data ...
 */

do_immd_get(cmd,data)
unsigned int cmd;
unsigned int *data;
{
	if(wait_cstat(10) == TSR_FAILURE)
		return(TSR_FAILURE);
	put_data((*data));
	if(put_command(cmd) == TSR_FAILURE)
		return(TSR_FAILURE);
	if(wait_cstat(15) == TSR_FAILURE)
		return(TSR_FAILURE);
	(*data) = get_data();
	return(TSR_SUCCESS);
}

/*
 *  wait for a particular dma status state to be set
 */

wait_dstat(ticks)
unsigned int ticks;
{
#ifdef DTEX
// never fails. 
			return(TSR_SUCCESS);
#else /* not dtex */
	DTC.max_ticks = (ticks*DOS_TPS);
	while(true)
		{
		if(DTC.max_ticks == 0)
			{
			DTC.error_status = ERROR_dma_timeout;
			return(TSR_FAILURE);
			}
		if((((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) & STAT_dma_state) != DTC.dma_count)
			{
			DTC.dma_count = ((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) & STAT_dma_state;
			return(TSR_SUCCESS);
			}
		}
#endif /*dtex*/
}

/*
 *  check to see if a dma will succeed ...
 */

check_dstat()
{
#ifdef DTEX /* express */
	// never fails.
	return(true);
#else /* not express */
	if((((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) & STAT_dma_state) != DTC.dma_count)
		return(true);
	return(false);
#endif /*dtex*/
}


unsigned char cschar;

/*
 *  wait for a particular command status state to be set
 */

wait_cstat(ticks)
int	ticks;
{
#ifdef DTEX
	int old_ticks;
	old_ticks = DTC.max_ticks = (ticks*DOS_TPS);
	cschar = 0x05; //^e
	while(DTC.max_ticks)
		{
		check_is_bit(); //make sure we can process characters
		DTC.module_status = DTC.status;
		if(DTC.module_status & STAT_cmd_ready)
			return(SUCCESS);
		//
		// this is a safety net. If, somehow, we got out of sync
		// and ended up missing a status update, we'll send a 
		// periodic update request while we're waiting. This 
		// should never happen, though, because the interrupt
		// routine is smart enough to request a status update 
		// when it sees an error in a status sequence.
		if (old_ticks > DTC.max_ticks+1) // on every timer tick..
			{
			p_sendbuf(&cschar,1); // force status update.
			old_ticks = DTC.max_ticks;
			}
		}
	DTC.error_status = ERROR_cmd_timeout;
	return(TSR_FAILURE);
#else /* not express */
	DTC.max_ticks = (ticks*DOS_TPS);
	while(DTC.max_ticks)
		if(((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) & STAT_cmd_ready)
			return(SUCCESS);
	DTC.error_status = ERROR_cmd_timeout;
	return(TSR_FAILURE);
#endif /*dtex*/
}

void interrupt _far dectalk_timer(int_frame)
union	INT_REGS	int_frame;
{
#ifdef DTEX /* express-only code .. */
	unsigned short int j;
	unsigned long int k;
	// this is a serious hack. 
	// someone, somewhere, is turning off the Tx interrupt.
	// turn it on here if there are chars in the p-outbuf
	// waiting to go..
	if (p_outbuf.count && ~((j=_inp(UART_IER))&IER_ETBEI))
		_outp(UART_IER,j|IER_ETBEI);

	if(DTC.max_ticks)
		DTC.max_ticks -= 1;
	dt_ticks++;
	
	// keepalive..
	k = dt_ticks-last_int_tick;
	if (k>DOS_TPS) // once per sec..
		{
		if (_inp(UART_LSR)&LSR_THRE)
			{
			_outp(UART_THR,0x005);
			last_int_tick = dt_ticks;
			}
		}
 	// make sure we didn't get stuck waiting for something to happen
	// because we were called from a higher-priority interrupt handler
	check_is_bit();
	_chain_intr(old_int1c);
#else /* non-express code */

	if(DTC.max_ticks)
		DTC.max_ticks -= 1;
	_chain_intr(old_int1c);
#endif /*dtex*/
}

#ifdef DTEX /* express-only */
void sleep(unsigned short int seconds)
{

	clock_t	start, finish, cseconds;
	cseconds = seconds * CLOCKS_PER_SEC;
	start=clock();
	finish=clock();

	while (finish-start < cseconds)
		{
		finish=clock();
		check_is_bit(); // might as well..
		}
}
unsigned int do_a_flush()
{
					flush_ring(&outbuf);
					flush_ring(&inbuf);
					flush_ring(&p_outbuf);
					dleoutbuf[3]=']';  // sync the pipes..
					dleoutbuf[4]=ETX;  
					dleoutbuf[5]=XON;
					clear_ack(); // get ready to wait for an ack
					p_sendbuf(&dleoutbuf[3],3);
					// this is debug stuff..
					// we should see the first of those characters go
					// IMMEDIATELY, because we know there isn't anything
					// waiting to go. Well, within a millisecond, anyway.
					// so, wait a tick (18ms); if the output buffer 
					// isn't empty, fail here.
					DTC.max_ticks=3*DOS_TPS; // 1 sec..?
					do {
					   check_is_bit();
					   }
					  while (DTC.max_ticks && peek_p_outbuf());

					if (peek_p_outbuf() != 0)
						{
						return(TSR_FAILURE);
						}

					// wait for the ^a to come back..
					DTC.max_ticks = (2*DOS_TPS);
					do
						{
						check_is_bit();
						if (get_ack() != 0)
							{
							dleoutbuf[4] = SOH;
							break;
							}
						}
						while(DTC.max_ticks);

					if (dleoutbuf[4] != SOH)
						{
						return(TSR_FAILURE);
						}
					flush_ring(&inbuf);  // clear out anything that was
							     // in transit during the flush..
					
					return(TSR_SUCCESS);
}
#endif /*dtex*/

wait_flush()
{
	DTC.max_ticks = (10*DOS_TPS);
#ifdef DTEX
	while(DTC.max_ticks)
		{
		check_is_bit(); // in case interrupts are blocked
		get_status();
		if((DTC.status & STAT_flushing) == 0)
			return(SUCCESS);
		}
#else /* not dtex */
	while(DTC.max_ticks)
		if((((inp(DT_STAT_HIGH)<<8) + inp(DT_STAT_LOW)) & STAT_flushing) == 0)
			return(SUCCESS);
#endif /*dtex*/
	DTC.error_status = ERROR_flush_timeout;
	return(TSR_FAILURE);
}
void wait_reset()
{
	DTC.max_ticks = (6*DOS_TPS);
	while(DTC.max_ticks);
	
}

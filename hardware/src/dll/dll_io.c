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
 *    File Name:	dll_io.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC Windows DLL ...
 *
 *  The windows DLL is essentially a rewrite of the tsr version of the
 *  code to run as a windows dll.  The dll piece encompases private i/o of
 *  that the DLL does not export.
 *
 *  Note the _dtpcDllEntry() is assumed to have been called prior to the
 *  use of any of these routines.
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "dll.h"
#include	"dll_prot.h"

/***************************************************************
 *     module memory allocation, reading and writing 
 ***************************************************************/

int _dtpcAllocMem(int paras,unsigned long __far *addr)
{
	int	status;

	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	_outp(DT_DMA,DMA_control);
	_outp(DT_DMA,DT_MEM_ALLOC);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	_outp(DT_DMA,(paras&0xff));
	_outp(DT_DMA,((paras>>8)&0xff));
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);

	(*addr) = ((long)_inp(DT_DMA));
	(*addr) += ((long)_inp(DT_DMA))<<8;
	(*addr) += ((long)_inp(DT_DMA))<<4;
	(*addr) += ((long)_inp(DT_DMA))<<12;
	return(DLL_SUCCESS);
}

int _dtpcLoadMem(unsigned long addr,char __far *buff,int count)
{
	int	status;

	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	_outp(DT_DMA,DMA_control);
	_outp(DT_DMA,DT_LOAD_MEM);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);

	_outp(DT_DMA,(unsigned char)(addr&0xff));
	_outp(DT_DMA,(unsigned char)((addr>>8)&0xff));
	_outp(DT_DMA,(unsigned char)((addr>>16)&0xff));
	_outp(DT_DMA,(unsigned char)((addr>>24)&0xff));
	_outp(DT_DMA,(count&0xff));
	_outp(DT_DMA,((count>>8)&0xff));

	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	while(count--)
		_outp(DT_DMA,*buff++);
	return(DLL_SUCCESS);
}

int _dtpcReadMem(unsigned long addr,char __far *buff,int count)
{
	int	status;

	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	_outp(DT_DMA,DMA_control);
	_outp(DT_DMA,DT_READ_MEM);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);

	_outp(DT_DMA,(unsigned char)(addr&0xff));
	_outp(DT_DMA,(unsigned char)((addr>>8)&0xff));
	_outp(DT_DMA,(unsigned char)((addr>>16)&0xff));
	_outp(DT_DMA,(unsigned char)((addr>>24)&0xff));
	_outp(DT_DMA,(count&0xff));
	_outp(DT_DMA,((count>>8)&0xff));

	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	while(count--)
		*buff++ = _inp(DT_DMA);
	return(DLL_SUCCESS);
}

int _dtpcSetDic(unsigned long addr,unsigned long entries,int type)
{
	int	status;

	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	_outp(DT_DMA,DMA_control);
	_outp(DT_DMA,DT_SET_DIC);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);

	_outp(DT_DMA,(unsigned char)(addr&0xf));
	_outp(DT_DMA,0);
	_outp(DT_DMA,(unsigned char)((addr>>4)&0xff));
	_outp(DT_DMA,(unsigned char)((addr>>12)&0xff));
	_outp(DT_DMA,(unsigned char)(entries&0xff));
	_outp(DT_DMA,(unsigned char)((entries>>8)&0xff));
	_outp(DT_DMA,(unsigned char)((entries>>16)&0xff));
	_outp(DT_DMA,(unsigned char)((entries>>24)&0xff));
	_outp(DT_DMA,(type&0xff));
	_outp(DT_DMA,((type>>8)&0xff));

	return(DLL_SUCCESS);
}

int _dtpcStartTask(unsigned int cs,unsigned int ip)
{
	int	status;

	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);
	_outp(DT_DMA,DMA_control);
	_outp(DT_DMA,DT_START_TASK);
	if((status = _dtpcWaitDstat(30)) == DLL_FAILURE)
		return(status);

	_outp(DT_DMA,(ip&0xff));
	_outp(DT_DMA,((ip>>8)&0xff));
	_outp(DT_DMA,(cs&0xff));
	_outp(DT_DMA,((cs>>8)&0xff));
	return(DLL_SUCCESS);
}
/*******************************************************************
 *       common command functions ...
 *******************************************************************/

int _dtpcDoImmd(unsigned int cmd,unsigned int data)
{
	if(_dtpcWaitCstat(5) == DLL_FAILURE)
		return(DLL_FAILURE);
	_dtpcPutData(data);
	return(_dtpcDoCommand(cmd));
}

/*
 *  do an cstat type command ...	except return data ...
 */

_dtpcDoImmdGet(unsigned int cmd,unsigned int _far *data)
{
	if(_dtpcWaitCstat(5) == DLL_FAILURE)
		return(DLL_FAILURE);
	_dtpcPutData((*data));
	if(_dtpcDoCommand(cmd) == DLL_FAILURE)
		return(DLL_FAILURE);
	if(_dtpcWaitCstat(15) == DLL_FAILURE)
		return(DLL_FAILURE);
	(*data) = _dtpcGetData();
	return(DLL_SUCCESS);
}


/*******************************************************************
 *                 command level module i/o
 *******************************************************************/


/*
 *  dtpcSetStatus() is used to read the current status register and set
 *  the module status ...
 */

void _dtpcSetStatus()
{

	DTC.status = (_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW);
	if((DTC.status & MODE_mask) == MODE_status)
		DTC.module_status = DTC.status;
}
	

/*
 *  write a command word to the module ... clear the flag bits in the
 *  status word to allow them to be updated by the isr ...
 */

_dtpcDoCommand(unsigned int cmd)
{

	_dtpcSetStatus();
	_dtpcPutCommand(cmd);
	_outp(DT_INT,0);

	_dtpcSetTimeout(10);
	while(((_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW)) & STAT_cmd_ready)
		if(_dtpcCheckTimeout())
			return(DLL_FAILURE);
	_outp(DT_CMD_LOW,0);
	_outp(DT_CMD_HIGH,0);
	return(DLL_SUCCESS);
}

/******************************************************
 *            status waits and checks
 ******************************************************/


/*
 *  wait for a particular dma status state to be set
 */

_dtpcWaitDstat(unsigned int ticks)
{


	_dtpcSetTimeout(ticks);
	do {
		if((((_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW)) & STAT_dma_state) != (int)DTC.dma_flop)
			{
			DTC.dma_flop = ((_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW)) & STAT_dma_state;
			return(DLL_SUCCESS);
			}
		} while(_dtpcCheckTimeout() == false);

	DTC.error_status = ERROR_dma_timeout;
	return(DLL_FAILURE);
}

/*
 *  check to see if a dma will succeed ...
 */

_dtpcCheckDstat()
{
	if((((_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW)) & STAT_dma_state) != (int)DTC.dma_flop)
		return(true);
	return(false);
}


/*
 *  wait for a particular command status state to be set
 */

_dtpcWaitCstat(int ticks)
 

    {        
	_dtpcSetTimeout(ticks);
	do {
		if(((_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW)) & STAT_cmd_ready)
			return(DLL_SUCCESS);
		}	while(_dtpcCheckTimeout() == false);
	DTC.error_status = ERROR_cmd_timeout;
	return(DLL_FAILURE);
}

/*
 *  wait for a flush to complete ...
 */

_dtpcWaitFlush()
{
	_dtpcSetTimeout(10);
	do	{
		if((((_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW)) & STAT_flushing) == 0)
			return(DLL_SUCCESS);
		} while(_dtpcCheckTimeout() == false);
	DTC.error_status = ERROR_flush_timeout;
	return(DLL_FAILURE);
}

/*
 *  generic bit wait ...
 */

int _dtpcWaitBit(int secs,unsigned int bit)
{
	_dtpcSetTimeout(secs);
	do {
		if(_dtpcGetStatus() & bit)
			return(DLL_SUCCESS);
		}	while(_dtpcCheckTimeout() == false);
	return(DLL_FAILURE);
}

/*
 *  generic pattern wait ...
 */

int _dtpcWaitPattern(int secs,unsigned int pattern)
{
	_dtpcSetTimeout(secs);
	do	{
		if(_dtpcGetStatus() == pattern)
			return(DLL_SUCCESS);
		} while(_dtpcCheckTimeout() == false);
	return(DLL_FAILURE);
}		


/******************************************************
 *            physical module i/o
 ******************************************************/

/*
 *  read the status of the selected base ...
 */

unsigned int _dtpcGetStatus()
{
	return((_inp(DT_STAT_HIGH)<<8) + _inp(DT_STAT_LOW));
}

/*
 *  write a command to the selected module ...
 */

void _dtpcPutCommand(unsigned int cmd)
{
	DTC.command = cmd;
	_outp((DT_CMD_LOW),cmd&0xff);
	_outp((DT_CMD_HIGH),((cmd&0xff00)>>8));
}

/*
 *  read the data registers ...
 */

unsigned int _dtpcGetData()
{
	return((_inp(DT_DI_HIGH)<<8) + _inp(DT_DI_LOW));
}

/*
 *  write the data registers ....
 */

void _dtpcPutData(int data)
{
	_outp(DT_DO_LOW,data&0xff);
	_outp(DT_DO_HIGH,((data&0xff00)>>8));
}

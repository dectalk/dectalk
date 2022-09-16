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
 *    File Name:	dll_file.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk-PC windows load support routines ... this module contains all the
 *  code to load the dictionarys and executable images into the module.
 *
 ***********************************************************************
 *    Revision History:
 */       
 
	  
#include        "dll.h"

/*
 *  local/global stuff ...
 */

int                                                     FileResources;
HFILE                                                   fp;
HGLOBAL                                         hReadBuff;
HGLOBAL                                         hFixUps;
char _huge                                      *read_buff;
struct dos_reloc _huge  *fixups;
struct dos_exe_header   header;

/*
 * dtpcLoadFile() is the single entry point for file loading.  The
 * complete file name/path should be specified and the proper load
 * if type is determined by looking at the file extention.
 */

char *file_types[] = {
	"sys",
	"dic",
	"dtu",
	"dta",
	"exe",
	0
};

#define SYS_TYPE        0
#define DIC_TYPE        1
#define DTU_TYPE        2
#define DTA_TYPE        3
#define EXE_TYPE        4


_dtpcLoadFile(char *fname, char *path)
{
	int     i,j,ext;
	int status;


	strcpy((char *)temp_buff,path);
	strcat((char *)temp_buff,fname);
	_dtpcClearMessWindow();
	_dtpcOutMessWindow(5,1,"Loading file");
	_dtpcOutMessWindow(10,2,(char *)temp_buff);

	if((status = _dtpcFileResources()) != DLL_SUCCESS)
		return(status);

/*
 *
 *  look for the file name extention ...
 */

	for(ext=0;fname[ext];ext++)
		if(fname[ext] == '.')
			break;
	if(fname[ext] != '.')
		return(_dtpcErrorLoad(ERROR_bad_file));
/*
 *  check it against the known types ...
 */
	ext += 1;
	for(i=0;file_types[i];i++)
		{
		for(j=0;file_types[i][j];j++)
			if(file_types[i][j] != fname[ext+j])
				break;
		if(file_types[i][j] == '\0' && fname[ext+j] == 0)
			break;
		}

/*
 *  load up the kernel ...
 */

	if(i == SYS_TYPE)
		{       
		if(DTC.id == ID_boot)
			return(_dtpcKernelLoad());
		else
			return(_dtpcErrorLoad(ERROR_boot_mode));
		}
/*
 * make sure the kernel is running then start others ...
 */

	if(DTC.id != ID_kernel)
		return(_dtpcErrorLoad(ERROR_boot_mode));
	switch(i) {

		case    DIC_TYPE        :
			return(_dtpcLoadDic(PRIMARY_DIC));
			break;
		case    DTU_TYPE        :
			return(_dtpcLoadDic(USER_DIC));
			break;
		case    DTA_TYPE        :
			return(_dtpcLoadDic(ABBREV_DIC));
			break;
		case    EXE_TYPE        :
			return(_dtpcLoadExe());
			break;
		default:
			return(_dtpcErrorLoad(ERROR_bad_file));
		};
}


/*
 *  MS-dos .exe file loader
 */


_dtpcLoadExe()
{

	int     i;
	unsigned int read_size;
	unsigned int total_paras,seg_fix;
	long    image_left,image_done,fix;
	unsigned long load_addr;
	unsigned long *pload;
/*
 *  Now, open up the .exe file and extract all the cgroup data and
 *  write that out to the .abs file ...
 */

	_lread(fp,&header,sizeof(struct dos_exe_header));
	if (header.id != 0x5a4d)
		return(_dtpcErrorLoad(ERROR_file_format));

	if(header.relen > MAX_FIXUPS)
		return(_dtpcErrorLoad(ERROR_too_many_fixups));

	_llseek(fp,(long)header.reloc,0);
	_lread(fp,fixups,sizeof(struct dos_reloc)*header.relen);

/*
 * load in and fix up the image ...
 */

	_llseek(fp,(long)(header.hsize*16),0);
	image_left = ((long)(header.pages-1)*512)+(long)header.rem-((long)header.hsize*16);
	total_paras =(unsigned int)((image_left>>4)+header.hmin+16); 
	image_done = 0;      
	pload=&load_addr;

	if(_dtpcAllocMem(total_paras,pload) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_bad_alloc));
	seg_fix = (unsigned int )(load_addr >> 4) & 0xffff;

   while(image_left>0)
     {
		read_size = (image_left > (long)READ_BUFF_SIZE) ? (int)READ_BUFF_SIZE : (int)image_left;
		if(_lread(fp,read_buff,read_size) != read_size)
			return(_dtpcErrorLoad(ERROR_bad_file_read));
		for(i=0;i<(int)header.relen;i++)
			{
	      fix = ((long)fixups[i].segment<<4)+(long)fixups[i].offset;
			if(fix >= image_done && fix < image_done+read_size)
				(*(unsigned int _huge *)&read_buff[fix-image_done]) += seg_fix;
			}
		_dtpcLoadMem(image_done+load_addr,read_buff,read_size);
		image_left -= read_size;
		image_done += read_size;
		}

	if(_dtpcStartTask(header.csval+seg_fix,header.ipval) == DLL_FAILURE)
		return(_dtpcErrorLoad(DLL_FAILURE));
	_dtpcFreeResources();   
	return(DLL_SUCCESS);
}


/*
 * dtpc dictionary loader ...
 */

long    entries,dic_bytes;

_dtpcLoadDic(int kind)
/*int kind; */
{

	int     i;
	unsigned int read_index,read_size,act_size;
	unsigned int _huge *index_fix;

	unsigned long   index,load_addr,dic_addr,total_done;
	unsigned int total_paras,seg_fix;

/*
 * read in the entry count and the actual entry size excluding the
 * index table (which is entries * 4) ...
 */

	_lread(fp,&entries,4);
	_lread(fp,&dic_bytes,4);

	total_paras =(unsigned int)( ((((long)entries*4)+dic_bytes)>>4)+2);

	if(_dtpcAllocMem(total_paras,&load_addr) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_bad_alloc));

	seg_fix = (unsigned int)(load_addr >> 4) & 0xffff;
	dic_addr = load_addr;

/*
 *  read, reloc and load a bunch of indexes ...
 */

	index = entries;
	total_done = 0;
	index_fix = (unsigned int _huge *)&read_buff[0];
	while(index>0)
		{
		read_index = (index > (unsigned long)(READ_BUFF_SIZE/4)) ? (READ_BUFF_SIZE/4) : (unsigned int)index;
		if((act_size = _lread(fp,read_buff,read_index*4)) != read_index*4)
			return(_dtpcErrorLoad(ERROR_bad_file_read));
		for(i=1;i<(int)read_index*2;i+=2)
			index_fix[i] += seg_fix;
		_dtpcLoadMem(load_addr,read_buff,read_index*4);
		load_addr += read_index*4;
		index = index - (long)read_index;
		total_done += read_index;
		}
/*
 *  now, load up the dictionary bytes ...
 */
	total_done = 0;
   while(dic_bytes>0)
     {
		read_size = (dic_bytes > (long)READ_BUFF_SIZE) ? READ_BUFF_SIZE : (int)dic_bytes;
		if((act_size = _lread(fp,read_buff,read_size)) != read_size)
			return(_dtpcErrorLoad(ERROR_bad_file_read));
		_dtpcLoadMem(load_addr,read_buff,read_size);
		dic_bytes -= read_size;
		load_addr += read_size;
		total_done += read_size;
		}
	if(_dtpcSetDic(dic_addr,entries,kind) == DLL_FAILURE)
		return(_dtpcErrorLoad(DLL_FAILURE));
	_dtpcFreeResources();   
	return(DLL_SUCCESS);
}


/*
 *  DECtalk-PC I/O support ... this module contains all the interface
 *  code that knows how to talk to a DECtalk module in boot mode before
 *  the kernel is loaded ...
 */

int _dtpcKernelLoad()
{

	int     i,read_size,fix_bytes;
	
	long    image_left,fix;

/*
 *  Now, open up the .exe file and extract all the cgroup data and
 *  write that out to the .abs file ...
 */

	_lread(fp,&header,sizeof(struct dos_exe_header));
	if (header.id != 0x5a4d)
		return(_dtpcErrorLoad(ERROR_file_format));
	if(header.relen > MAX_FIXUPS)
		return(_dtpcErrorLoad(ERROR_too_many_fixups));

	_llseek(fp,(long)header.reloc,0);
	fix_bytes = sizeof(struct dos_reloc)*header.relen;
	if(_lread(fp,fixups,fix_bytes) != (UINT)fix_bytes)
		return(_dtpcErrorLoad(ERROR_bad_file_read));

/*
 * load in and fix up the image ...
 */

	_llseek(fp,(long)(header.hsize*16),0);
	image_left = ((long)(header.pages-1)*512)+(long)header.rem-((long)header.hsize*16);

	header.csval += 0x40;
	header.ssval += 0x40;

   if(image_left>READ_BUFF_SIZE)
		return(_dtpcErrorLoad(ERROR_kernel_too_big));
	read_size = (int)image_left;
	if(_lread(fp,read_buff,read_size) != (UINT)read_size)
		return(_dtpcErrorLoad(ERROR_bad_file_read));
	for(i=0;i<(int)header.relen;i++)
		{
	   fix = ((long)fixups[i].segment<<4)+(long)fixups[i].offset;
		(*(unsigned int _huge *)&read_buff[fix]) += 0x40;
		}

/*
 *  load up the image ...
 */

	if(_dtpcWaitInit(5,false) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_no_init));

	_dtpcPutCommand(CMD_dma);
	if(_dtpcWaitBit(5,STAT_dma_ready) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_send_load));
	_outp((DTC.base+4),DMA_control);
	_outp((DTC.base+4),DT_LOAD_MEM);
	_dtpcWaitTicks(5);
	if(_dtpcWaitBit(5,STAT_dma_ready) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_dma_address));
	_outp((DTC.base+4),0x00);
	_outp((DTC.base+4),0x04);
	_outp((DTC.base+4),0x00);
	_outp((DTC.base+4),0x00);
	_outp((DTC.base+4),read_size&0xff);
	_outp((DTC.base+4),(read_size>>8)&0xff);
	_dtpcWaitTicks(5);
	if(_dtpcWaitBit(5,STAT_dma_ready) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_load_image));
	while(read_size--)
		_outp((DTC.base+4),*read_buff++);
	_dtpcPutCommand(CMD_reset);
	if(_dtpcWaitPattern(5,MODE_status) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_no_status));

/*
 *  start the kernel ...
 */

	_dtpcPutCommand(CMD_dma+1);
	if(_dtpcWaitBit(5,STAT_dma_ready) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_no_start));
	_outp((DTC.base+4),DMA_control);
	_outp((DTC.base+4),DT_START_TASK);
	_dtpcWaitTicks(5);
	if(_dtpcWaitBit(5,STAT_dma_ready) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_no_start_address));
	_outp((DTC.base+4),header.ipval&0xff);
	_outp((DTC.base+4),(header.ipval>>8)&0xff);
	_outp((DTC.base+4),header.csval&0xff);
	_outp((DTC.base+4),(header.csval>>8)&0xff);

/*
 *  Wait for the kernel to start ...
 */

	if(_dtpcWaitPattern(20,(MODE_ready )) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_kernel_start));

/*
 *  Send over the sync command ...
 */

	_dtpcPutCommand(CMD_sync);
	if(_dtpcWaitBit(5,STAT_cmd_ready) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_no_cmd_sync));

/*
 *  Now wait for the dma driver on the dectalk to start ...
 */

	if(_dtpcWaitBit(5,STAT_dma_ready) == DLL_FAILURE)
		return(_dtpcErrorLoad(ERROR_no_dma_sync));

	DTC.dma_flop = 0;
	DTC.id = ID_kernel;

	_dtpcFreeResources();
	return(DLL_SUCCESS);
}


/*
 *  wait for module it enter init mode from boot sequence ...  retry is
 *  the number of times to try to init the module, and reset specifys
 *  whether or not to attempt a reset on entry ...
 */

int _dtpcWaitInit(int retry,int reset)
/*int   retry; */
/*int   reset; */
{
	if(retry == 0)
		return(DLL_FAILURE);
	if(reset)
		{
		_dtpcPutCommand(MODULE_reset);
		_dtpcWaitPattern(20,MODULE_init);
		}

	_dtpcPutCommand(CMD_null);
	if(_dtpcGetStatus() == MODULE_self_test)
		if(_dtpcWaitPattern(20,MODULE_init) == DLL_FAILURE)
			return(_dtpcWaitInit(retry-1,true));

	if(_dtpcGetStatus() == MODULE_init)
		{
		_dtpcPutCommand(CMD_reset);
		if(_dtpcWaitPattern(2,MODE_status) == DLL_FAILURE)
			return(_dtpcWaitInit(retry-1,true));
		}

	_dtpcPutCommand(CMD_sync);
	if(_dtpcWaitPattern(2,MODE_error) == DLL_FAILURE)
		return(_dtpcWaitInit(retry-1,true));

	_dtpcPutCommand(CMD_reset);
	if(_dtpcWaitPattern(2,MODE_status) == DLL_FAILURE)
		return(_dtpcWaitInit(retry-1,true));
	return(SUCCESS);
}

/*
 *  allocate resources ...
 */

int _dtpcFileResources()
{

	FileResources = 0;
	if((hReadBuff = GlobalAlloc(GMEM_FIXED,READ_BUFF_SIZE)) == (HGLOBAL)NULL)
		return(_dtpcErrorLoad(ERROR_no_memory));
	read_buff = (char _huge *)GlobalLock(hReadBuff);
	FileResources += 1;

	if((hFixUps = GlobalAlloc(GMEM_FIXED,MAX_FIXUPS*4)) == (HGLOBAL)NULL)
		return(_dtpcErrorLoad(ERROR_no_memory));
	fixups = (struct dos_reloc _huge *)GlobalLock(hFixUps);
	FileResources += 1;

	if ((fp=_lopen(temp_buff,READ)) == (HFILE)NULL)
		return(_dtpcErrorLoad(ERROR_no_file));
	FileResources += 1;

	return(success);
}

/*
 *  return whatever was allocated ...
 */
	
void _dtpcFreeResources()
{
	switch(FileResources)   {
		case    3       :       _lclose(fp);
		case    2       :       GlobalUnlock(hFixUps);
						GlobalFree(hFixUps);
		case    1       :       GlobalUnlock(hReadBuff);
						GlobalFree(hReadBuff);
		};
}

/*
 *  return resources and set an error status ...
 */

BOOL FAR PASCAL _dtpcErrorLoad(int status)
/*int   status; */
{
	_dtpcFreeResources();
	DTC.error_status = status;
	dtpcErrorStatus = status;
	wsprintf(temp_buff,"Load Error: %s",ErrorStrings[status]);
	MessageBox(0,temp_buff,"DECtalk(TM) PC",MB_SYSTEMMODAL|MB_ICONHAND|MB_OK);
	_dtpcKillMessageWindow();
	return(DLL_FAILURE);
}


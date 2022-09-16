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
 *    File Name:	wsr_ind.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  DECtalk PC indexing routines ...
 *
 ***********************************************************************
 *    Revision History:
 * 001 4/17/95 eab removed calls to IO_priority high You don't want
 * 					I/O priority high in this environement.
 */

#include	"wsr.h"

SCREEN_INDEX	sindex[TOTAL_INDEX];
int				si_head,si_tail,si_count;

char		index_out_buff[257];
int		out_index;
int		watch_index;
int		highlight_index;
int		last_index;
int		max_out_index;
BOOL		do_next;
BOOL		IndexFlag;
char		in_bracket;
char		_far *index_format;

char		mark_format_string[]="[:i m %d]";
char		pause_format_string[]="[:i p %d]";

/*
 *  init the indexing functions ...
 */

void wsrStartIndex()
{

	out_index = 0;
	si_head = si_tail = 1;
	si_count = 0;
	IndexFlag = true;
	do_next = true;
	in_bracket = 0;
	highlight_index = NULL_INDEX;
	last_index = NULL_INDEX+1;
	if(UserTextControl != ID_HIGHLIGHT_WORD)
		max_out_index = 10;
	else
		max_out_index = 100;
/* Took out Pause, was slowing window performance.  ADN 7/11/95 */
/*	if(UserPauseControl)
		index_format = (char _far *)&pause_format_string[0];
	else																	 */
	index_format = (char _far *)&mark_format_string[0];
	wsrSetIndex();
}


void wsrResetIndex()
{
	if(highlight_index != NULL_INDEX)
		wsrSetHighLight(highlight_index,FALSE);
	si_head = si_tail = 1;
	si_count = 0;
	highlight_index = NULL_INDEX;
	last_index = NULL_INDEX+1;
	wsrSetIndex();
}


void wsrStopIndex()
{


	if(highlight_index)
		wsrSetHighLight(highlight_index,FALSE);
	IndexFlag = false;
}
	
/*
 *  add an index into the queue ...
 */

void wsrSetIndex()
{
	char	index_string[30];

	wsprintf(index_string,index_format,si_head);
	wsrSendBuff(index_string);
	sindex[si_head].sx = MaxLine;
	sindex[si_head].sy = nCurrPos;
	si_head = (si_head < MAX_INDEX) ? si_head+1 : 0;
	si_count += 1;
}

/*
 *  remove all previous indexes before this one ...
 */

void wsrRemoveIndex(value)
int	value;
{

	while(si_count != 0 && si_tail != value)
		{
		si_tail = (si_tail < MAX_INDEX) ? si_tail+1 : 0;
		si_count -= 1;
		}
}

/*
 *  when the screen scrolls, scroll the indexes ...
 */

void wsrScrollIndex()
{
	int	i;

	i = si_tail;
	while(i != si_head)
		{
		sindex[i].sx -= 1;
		i = (i < MAX_INDEX) ? i+1 : 0;
		}
}

/*
 *  highlight text or return it to its normal state ...
 */

void wsrSetHighLight(value,highlight)
int	value;
BOOL	highlight;
{
	int	j,hx,hy,len;
	LPSTR psBuff;

	hx = sindex[value].sx;
	hy = sindex[value].sy;
	j = (value+1 < MAX_INDEX) ? value+1 : 0;
	while(hx != sindex[j].sx)
		{
  	   psBuff = wsrGetTTYLine(hx) + hy;
		len = lstrlen(psBuff);
		if(len > 0)
			wsrHighLightText(hx,hy,len,highlight);
		hx+=1;
		hy= 0;
		}
	len = (sindex[j].sy - hy);
	if(len > 0)
		wsrHighLightText(hx,hy,len,highlight);

}

/*
 *  send a buffer to the DECtalk and the screen adding index marks as
 *  we go ...
 */

void wsrIndexRead()
{
	char	c;

	while(si_count <= max_out_index)
		{
		if(ByteIndex >= BytesAvail)
			{
			ByteIndex=0;
			BytesAvail=_lread(wsrFile,read_buff,READ_BUFF_SIZE);
			if(BytesAvail == HFILE_ERROR)
				{
				wsrFileError("Error reading File.");
				return;
				}
			if(BytesAvail == 0)
				{
				index_out_buff[out_index]=0;
				wsrSendBuff(index_out_buff);
				last_index = si_head;
				wsrSetIndex();
				ReadFlag = false;
				return;
				}
			}
		c = read_buff[ByteIndex++];
		if(do_next && in_bracket == 0)
			{
			if(IS_WORD(c))
				{
				if(out_index)
					{
					index_out_buff[out_index]=0;
					wsrSendBuff(index_out_buff);
					wsrTextOut(index_out_buff);
					wsrSetIndex();
					out_index = 0;
					}
				do_next = false;
				}
			}

		switch(in_bracket)
			{
			case	'['	:

				if(c == ':')
					in_bracket = c;
				else
					in_bracket = 0; 
				break;

			case	':'	:

				if(c == ']')
					in_bracket = 0;
				break;

			default	:

				if(c == '[')
					in_bracket = c;
				else
					in_bracket = 0;
				break;
			};

		switch(UserTextControl)	{

			case	ID_HIGHLIGHT_LINE		:
				if(c == '\n' || c == '\r')
					do_next = true;
					break;

			case	ID_HIGHLIGHT_WORD		:
				if(IS_WORD(c) == FALSE)
					do_next = true;
				break;

			case	ID_HIGHLIGHT_CLAUSE	:
				if(IS_CLAUSE(c))
					do_next = true;
				break;
			};

		wsrWatchIndex();
		index_out_buff[out_index++] = c;
		if(out_index == sizeof(index_out_buff))
			{
			index_out_buff[out_index] = 0;
			wsrSendBuff(index_out_buff);
			wsrTextOut(index_out_buff);
			out_index = 0;
			}
		}
}

/*
 *  quick read the index marks ...
 */


void wsrWatchIndex()
{

	WORD	status;

	while((status = dtpcLastIndex(ReadModule,&watch_index)) == DLL_SUCCESS)
		{
		if(highlight_index != NULL_INDEX)
			wsrSetHighLight(highlight_index,FALSE);
		if(highlight_index == last_index)
			wsrStopIndex();
		else
			{
			wsrSetHighLight(watch_index,TRUE);
			wsrRemoveIndex(watch_index);
			highlight_index = watch_index;
			}
/* ADN took out Pause, was slowing window performanc  7/11/95*/
/*		if(UserPauseControl)
			{
			MessageBox(wsrWnd,"Paused","DECtalk(TM) Windows Demo",MB_ICONINFORMATION|MB_OK|MB_APPLMODAL);
			do	{
				status = dtpcResumeSpc(ReadModule);
				} while(status != DLL_SUCCESS && status != DLL_FAILURE);
			} */
		}
	if(status == DLL_FAILURE)
		wsrStopIndex();
}

void wsrSendBuff(buff)
char _far *buff;
{
	int	size,status;

	for(size=0;buff[size];size++);
	while(true)
		{
		status = dtpcSendBuff(ReadModule,buff,&size);
		if(status == DLL_SUCCESS)
			break;
		if(status == DLL_FAILURE)
			{
			wsrFileError("Error sending buffer to DECtalk.");
			return;
			}
		}
}	

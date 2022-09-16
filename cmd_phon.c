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
 *    File Name:	cmd_phon.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * translates phonemes to ascky ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */
 
#include	"cmd_def.h"

#define	PFUSA			0x1E		/* American English Phonemes	*/


lookup_ascky(ph)
unsigned int ph;
{
	int	i;
	unsigned char 	_far *ascky;
	int	size;

	ascky  = (char _far *)KS.ascky;
	size = (int)KS.ascky_size;
	for(i=0;i<size;i++)
		if(ph == ascky[i])
			{
			PUSH_PHONE = i;
			return(true);
			}
	return(false);
}


lookup_arpabet(ph1,ph2)
unsigned int ph1,ph2;
{
#ifdef FULL_LANGUAGE_SUPPORT
	int	i,size;
	unsigned char _far *arpa;

	size = (int)KS.arpa_size;
	arpa = ( char _far *)KS.arpabet;
	if(KS.arpa_case == false)
		{
		if(ph1 >= 'A' && ph1 <= 'Z')
			ph1 |= 0x20;
		if(ph2 >= 'A' && ph2 <= 'Z')
			ph2 |= 0x20;
		}

	for(i=0;i<size;i+=2)

		if(ph1 == arpa[i] && ph2 == arpa[i+1])
	  		{

			PUSH_PHONE = i/2;
			return(2);
			}
	for(i=0;i<size;i+=2)

		if(ph1 == arpa[i] && arpa[i+1] == ' ')
			{

			PUSH_PHONE = i/2;
			return(1);
			}
#endif
	return(0);
}

param_check(c)
unsigned int c;
{

/*
 *  if we have just isolated the phoneme, check for the <> string ...
 */

	if(param_index == 1)
		{
		if(c == ']')
			{
			flush_phone();
			reset_command(STATE_NORMAL);
			return(true);
			}
		if(c != '<')
			{
			flush_phone();
			return(false);
			}
		PUSH_PHONE = 0;
		p_count = 0;
		p_flag = false;
		return(true);
		}

	if(c == ']')
		{
		reset_command(STATE_NORMAL);
		return(true);
		}

	p_count += 1;
	if(c == ',')
		{
		if(p_flag)
			CURR_PHONE = -(int)CURR_PHONE;
		if(param_index == 3)
			{
//			command_error(CMD_bad_phoneme);
			new_state(STATE_TOSS);
			return(true);
			}
		else
			{
			PUSH_PHONE = 0;
			p_count = 0;
			p_flag = false;
			}
		}
	else if(c == '>')
		{
		if(p_flag)
			CURR_PHONE = -(int)CURR_PHONE;
		flush_phone();
		}
	else if(c == '-')
		{
		if(p_count == 1)
			p_flag = true;
		else
			{
//			command_error(CMD_bad_phoneme);
			new_state(STATE_TOSS);
			}
		}
	else if(c >= '0' && c<= '9')
		CURR_PHONE = CURR_PHONE*10+c-'0';
	else
		{
//		command_error(CMD_bad_phoneme);
		new_state(STATE_TOSS);
		}
	return(true);
}

flush_phone()
{

	if(param_index && (KS.phoneme_mode & PHONEME_SPEAK))
		{
		params[0] = params[0] | (PFUSA<<PSFONT) | ((param_index-1)<<PSNEXTRA);
#ifdef SINGLE_THREADED
		lts_loop(params);
#else
		write_pipe(KS.lts_pipe,params,param_index);
#endif
	}
	param_index = 0;
	p_flag = 0;
	p_count = 0;               
	return(1);
}

void match_phoneme(c)
unsigned int c;
{

	if(c == CR || c == LF || KS.text_flush)
		return;
	if(param_index && param_check(c))
		return;

	if(q_flag)
		{
		if(c == ']')
			{
			if(lookup_arpabet(q_flag,' ') == 2)
				flush_phone();
			reset_command(STATE_NORMAL);
			}
		else if(c == ':')
			{
			if(lookup_arpabet(q_flag,' ') == 2)
				{
				flush_phone();
				reset_command(STATE_COMMAND);
				}
			else
				{
//				command_error(CMD_bad_phoneme);
				new_state(STATE_TOSS);
				}
			}
		else
			{
			switch(lookup_arpabet(q_flag,c)) {
				
				case	0	:

//					command_error(CMD_bad_phoneme);
					new_state(STATE_TOSS);
					break;

				case	1	:

					if(param_check(c) == false)
						q_flag = c;
					else
						q_flag = 0;
					break;

				case	2	:

					q_flag = 0;
					break;
				};
			if(q_flag)
				flush_phone();
			}
		}
	else
		{
		if(c == ']')
			reset_command(STATE_NORMAL);
		else if(c == ':')
			reset_command(STATE_COMMAND);
		else if(KS.phoneme_mode  & PHONEME_ASCKY)
			{
			if(lookup_ascky(c) == false)
				{
//				command_error(CMD_bad_phoneme);
				new_state(STATE_TOSS);
				}
/*			else
				flush_phone();	*/
			}
		else
			q_flag = c;
		}
}

	
#endif
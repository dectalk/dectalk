/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
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
 *    File Name:	cm_phon.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    translates phonemes to ascky ...
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev	Who		Date		Description
 * ---	-----	-----------	--------------------------------------------
 * 001	SIK		07/08/1996  Cleaning up and maintenance
 * 002	GL		03/19/1997	For BATS#304, 306
 *							remove the extra space in the phoneme code string
 *							also fix the problem to handle last illegal phoneme
 *                          code properly.
 *							This fix will catch illegal "x" in [shx] or [x] 
 */

#include "cm_def.h"

extern unsigned char par_lower[];
 
/*
 *	Function Name: cm_phon_lookup_asc()	
 *
 *	Description: Searches the ascky table for the ascky code passed in argument ph.
 *  			 Returns TRUE if found; FALSE otherwise.
 *
 *	Arguments: LPTTS_HANDLE_T phTTS, 
 *			   unsigned int ph			phoneme code
 *
 *	Return Value: int; TRUE or FALSE
 *
 *	Comments:
 *
 */

static int cm_phon_lookup_asc(LPTTS_HANDLE_T phTTS, unsigned int ph)
{
	int	i;
	unsigned char 	_far *ascky;
	int	size;
    PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	ascky  = (char _far *)pKsd_t->ascky;
	size = (int)pKsd_t->ascky_size;
	for(i=0; i<size; i++) 
	{
		if(ph == ascky[i])
		{
			PUSH_PHONE = i;
			return(TRUE);
		}
	}
	return(FALSE);
}
/*
 *	Function Name: cm_phon_lookup_arpa()	
 *
 *	Description: Searches the arpabet table for the phoneme
 *				 codes passed in ph1 and ph2.
 * 				 Searches for either 1 or 2 character phoneme codes;
 *				 for single char codes, the value passed in for ph2 is a ' '.
 *
 *	Arguments: LPTTS_HANDLE_T phTTS, 
 *			   unsigned int ph1,		Phoneme code #1
 *			   unsigned int ph2         Phoneme code #2
 *
 *	Return Value: 	int; 0, 1 or 2; corresponds to the number of matches. 
 *					0 if none, 1 if ph1 matched and ph2 == ' ', 2 if ph1 and ph2 
 *					match a valid sequence of phoneme codes in the table.
 *
 *	Comments:
 *
 */

static int cm_phon_lookup_arpa(LPTTS_HANDLE_T phTTS, unsigned int ph1, unsigned int ph2)
{
	int	i,size;
	unsigned char _far *arpa;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;

	size = (int)pKsd_t->arpa_size;
	arpa = ( char _far *)pKsd_t->arpabet;
	if(pKsd_t->arpa_case == FALSE)
	{      
		/* Converts ph1 and ph2 to lower case */
		ph1 = par_lower[(int)ph1];
		ph2 = par_lower[(int)ph2];
	}

	for(i=0; i<size; i+=2)
	{
		if(ph1 == arpa[i] && ph2 == arpa[i+1])
	  	{

			PUSH_PHONE = i/2;
			return(2);
		}
	}
	for(i=0; i<size; i+=2)
	{
		if(ph1 == arpa[i] && arpa[i+1] == ' ')
		{

			PUSH_PHONE = i/2;
			return(1);
		}
	}
	return(0);
}

/*
 *	Function Name: cm_phon_param_check()	
 *
 *	Description: Checks the phoneme parameter strings which are fed in
 *				1 char at a time and passed to this function thru c.
 *
 *	Arguments: LPTTS_HANDLE_T phTTS, 
 *			   unsigned int c 			Contains next char in the phoneme
 *										param input stream.																
 *
 *	Return Value: int; 
 *				  TRUE
 *				  FALSE
 *
 *	Comments:
 *
 */

static int cm_phon_param_check(LPTTS_HANDLE_T phTTS, unsigned int c)
{

	/*
	 *  if we have just isolated the phoneme, check for the <> string ...
	 */
    
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	if(pCmd_t->param_index == 1)
	{
		if(c == ']')
		{
			cm_phon_flush(phTTS);
			cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
			return(TRUE);
		}
		if(c != '<')
		{
			cm_phon_flush(phTTS);
			return(FALSE);
		}
		PUSH_PHONE = 0;
		pCmd_t->p_count = 0;
		pCmd_t->p_flag = FALSE;
		return(TRUE);
	}
    
	if(c == ']')
	{
		cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
		return(TRUE);
	}

	pCmd_t->p_count += 1;
	switch(c)
	{
		case ',':
			if(pCmd_t->p_flag)
			{
				CURR_PHONE = -(int)CURR_PHONE;
			}
			if(pCmd_t->param_index == 3)
			{
				cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
				return(TRUE);
			}
			else
			{
				PUSH_PHONE = 0;
				pCmd_t->p_count = 0;
				pCmd_t->p_flag = FALSE;
			}
			break;
		case '>':
			if(pCmd_t->p_flag)
				CURR_PHONE = -(int)CURR_PHONE;
			cm_phon_flush(phTTS);
			break;
		case '-':
			if(pCmd_t->p_count == 1)
				pCmd_t->p_flag = TRUE;
			else
			{
				cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
			}
			break;
		default:
			if (c >= '0' && c<= '9')
	   			CURR_PHONE = CURR_PHONE*10+c-'0';
			else
			{
				cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
			}
			break;
	} /* switch(c) */
	return(TRUE);
}
/*
 *	Function Name: cm_phon_flush()	
 *
 *	Description: Sends phonemes down the LTS pipe
 *
 *	Arguments: LPTTS_HANDLE_T phTTS
 *
 *	Return Value: void
 *
 *	Comments:
 *
 */

static void cm_phon_flush(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData; 
	
#ifndef MSDOS
	int i;
	DT_PIPE_T pipe_values[NPARAM];
#endif
	
	if(pCmd_t->param_index && (pKsd_t->phoneme_mode & PHONEME_SPEAK))
	{
		pCmd_t->params[0] = pCmd_t->params[0] | (PFUSA<<PSFONT) | 
							((pCmd_t->param_index-1)<<PSNEXTRA); 
#ifdef MSDOS
                cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pCmd_t->params,pCmd_t->param_index);
#else
        for ( i = 0; i < (pCmd_t->param_index); i++ )
        {
        	pipe_values[i] = pCmd_t->params[i];
        }
        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_values,pCmd_t->param_index);
#endif
	}
	pCmd_t->param_index = 0;
	pCmd_t->p_flag = 0;
	pCmd_t->p_count = 0;               
}
/*
 *	Function Name: cm_phon_match()	
 *
 *	Description: Looks up phonemes in table and checks their parameters.
 *				 Calls cm_phon_param_check() and  cm_phon_lookup_arpa()
 *               or cm_phon_lookup_asc().
 *
 *	Arguments: LPTTS_HANDLE_T phTTS, unsigned int c
 *
 *	Return Value: void
 *
 *	Comments:
 *
 */

void cm_phon_match(LPTTS_HANDLE_T phTTS, unsigned int c)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	if(c == CR || c == LF || pKsd_t->text_flush)
	{
		return;
	}
	if(pCmd_t->param_index && cm_phon_param_check(phTTS, c))
	{
		return;
	}
	if(pCmd_t->q_flag)
	{
		switch(c)
		{
		case ']':
			/*
			   GL 03/19/1997 BATS#304 handle the final
			   illegal phoneme symbol and trailing space
			 */
			if (pCmd_t->q_flag != ' ')
			{
				switch(cm_phon_lookup_arpa(phTTS, pCmd_t->q_flag,' ')) 
				{
				
					case	0	:
						cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
						cm_pars_new_state(pCmd_t, STATE_NORMAL);
						break;

					case	1	:
					case	2	:
						cm_phon_flush(phTTS);
						break;
				}
			}

			cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
			break;
		case ':':
			if(cm_phon_lookup_arpa(phTTS, pCmd_t->q_flag,' ') == 2)
			{
				cm_phon_flush(phTTS);
				cm_cmd_reset_comm(pCmd_t, STATE_COMMAND);
			}
			else
			{
				cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
			}     
			break;
		default:
#if 0
			/*
			   GL 03/19/1997 BATS#306 process the spaces properly
			   for arpa mode we send q_flag(first character) and c(second character)
			   to the lookup routine.
			   a). strip all the two spaces token
			   b). shift the leading single space, turn the incoming character
			       become first character
			   notes: activate this block if we decide to make this change
			 */                           
			if (pCmd_t->q_flag == ' ' && c == ' ') return;
			if (pCmd_t->q_flag == ' ' && c != ' ')
			{
				pCmd_t->q_flag = c;
				return;
			}
#endif
#ifdef PHEDIT2  /* ET merged from PHEDIT2 */
			if (pCmd_t->q_flag >= '0' && pCmd_t->q_flag <= '9' && c >= '0' && c <= '9') {
				PUSH_PHONE = ( ((pCmd_t->q_flag - '0') * 10) + (c - '0'));
				pCmd_t->q_flag = 0;
			} 
			else {
#endif				
				switch(cm_phon_lookup_arpa(phTTS, pCmd_t->q_flag,c))
				{
					
				case	0	:
					
					cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
					cm_pars_new_state(pCmd_t, STATE_TOSS);
					break;
					
				case	1	:
					
					if(cm_phon_param_check(phTTS, c) == FALSE)
						pCmd_t->q_flag = c;
					else
						pCmd_t->q_flag = 0;
					break;
					
				case	2	:
					
					pCmd_t->q_flag = 0;
					break;
				}
#ifdef PHEDIT2
			} /* else */
#endif
			if(pCmd_t->q_flag)
				cm_phon_flush(phTTS);
		} /* switch(c) */

	} /* if(pCmd_t->q_flag) */
	else
	{
		switch(c)
		{
		case ']':
			cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
			break;
		case ':':
			cm_cmd_reset_comm(pCmd_t, STATE_COMMAND);
			break;
		default:
			if(pKsd_t->phoneme_mode  & PHONEME_ASCKY)
			{
				if(cm_phon_lookup_asc(phTTS, c) == FALSE)
				{
					cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
					cm_pars_new_state(pCmd_t, STATE_TOSS);
				}
			}
			else
				pCmd_t->q_flag = c;
		}
	}
}

	

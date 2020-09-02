/*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2000, 2001 Force Computers, a Solectron Company, 2000. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
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
 * 003	MGS		04/13/2000	Changes for integrated phoneme set 
 * 004  NAL		05/23/2000  Cast variables (warning removal)
 * 005	CHJ		07/20/2000  French added
 * 006	MGS		10/05/2000	Redhat 6.2 and linux warning removal
 * 007	CAB		10/13/2000	Fixed copyright
 * 008	MGS		02/08/2001	Fixed linux compiler/envrionemnt issue
 * 009	MGS		03/30/2001	Added external intonation command for phonemes.
 *							We decided that the "new paragraph" '+' or S3 '=' phonemes could be used
 *							BATS#972
 * 010	CAB		05/14/2001	Updated copyright info.
 * 011	MFG		05/29/2001	Included dectalkf.h 
 * 012	MGS		06/19/2001	Swapped dectalkf.h with cm_def.h
 * 013	MGS		04/03/2002		Single threaded lts
 * 014	MGS		04/11/2002		ARM7 port
 */

#include "dectalkf.h"
#include "cm_def.h"

extern unsigned char par_lower[];
extern unsigned char language_prefixes[];
extern int language_size;
extern unsigned char *arpabet_arrays[];
extern unsigned int arpabet_sizes[];
extern unsigned int arpabet_lang_fonts[];
extern unsigned int arpabet_lang_flags[];
 
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

int cm_phon_lookup_asc(LPTTS_HANDLE_T phTTS, unsigned int ph)
{
	int	i;
	unsigned char 	_far *ascky;
	int	size;
    PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	
	ascky  = (unsigned char _far *)pKsd_t->ascky;
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

int cm_phon_lookup_language(LPTTS_HANDLE_T phTTS,unsigned char ph1, unsigned char ph2)
{
	int	i;
	//PKSD_T pKsd_t = phTTS->pKernelShareData;
	//PCMD_T pCmd_t = phTTS->pCMDThreadData;

	ph1 = par_lower[ph1];
	ph2 = par_lower[ph2];
	i=0;

	for(i=0; i<language_size; i+=2)
	{
		if(ph1 == language_prefixes[i] && ph2 == language_prefixes[i+1])
	  	{
			return(i/2);
		}
	}
	return(-1);
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

int cm_phon_lookup_arpa(LPTTS_HANDLE_T phTTS, unsigned int ph1, unsigned int ph2)
{
	int	i,size;
	unsigned char _far *arpa;
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
#ifndef MSDOS
	if (pCmd_t->international_phon_lang>=0)
	{
		size=arpabet_sizes[pCmd_t->international_phon_lang];
		arpa=arpabet_arrays[pCmd_t->international_phon_lang];
	}
	else
#endif
	{
		size = (int)pKsd_t->arpa_size;
		arpa = ( unsigned char _far *)pKsd_t->arpabet;
	}
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
#ifndef MSDOS
			if (pCmd_t->international_phon_lang>=0)
			{
				PUSH_PHONE = i/2 | ((arpabet_lang_fonts[pCmd_t->international_phon_lang]) <<PSFONT);
				pCmd_t->international_phon_lang=-1;
				pCmd_t->international_flag=-1;
			}
			else
#endif
			{
				PUSH_PHONE = i/2;
			}
			return(2);
		}
	}
	for(i=0; i<size; i += 2)
	{
		if(ph1 == arpa[i] && arpa[i+1] == ' ')
		{
#ifndef MSDOS
			if (pCmd_t->international_phon_lang>=0)
			{
				PUSH_PHONE = i/2 | ((arpabet_lang_fonts[pCmd_t->international_phon_lang]) <<PSFONT);
				pCmd_t->international_phon_lang=-1;
				pCmd_t->international_flag=-1;
			}
			else
#endif
			{
				PUSH_PHONE = i/2;
			}
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

int cm_phon_param_check(LPTTS_HANDLE_T phTTS, unsigned int c)
{

	/*
	 *  if we have just isolated the phoneme, check for the <> string ...
	 */
    
	//PKSD_T pKsd_t = phTTS->pKernelShareData;
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
		pCmd_t->cmd_p_flag = FALSE;
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
			if(pCmd_t->cmd_p_flag)
			{
				CURR_PHONE = -(int)CURR_PHONE;
			}
			if(pCmd_t->param_index == 6)
			{
				cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
				return(TRUE);
			}
			else
			{
				PUSH_PHONE = 0;
				pCmd_t->p_count = 0;
				pCmd_t->cmd_p_flag = FALSE;
			}
			break;
		case '>':
			if(pCmd_t->cmd_p_flag)
				CURR_PHONE = -(int)CURR_PHONE;
			cm_phon_flush(phTTS);
			break;
		case '-':
			if(pCmd_t->p_count == 1)
				pCmd_t->cmd_p_flag = TRUE;
			else
			{
				cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
			}
			break;
		default:
			if (c >= '0' && c<= '9')
	   			CURR_PHONE = CURR_PHONE*10+c-'0';
			else if (c=='%')
				CURR_PHONE+=900;
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

void cm_phon_flush(LPTTS_HANDLE_T phTTS)
{
	PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData; 
	short temp;
	unsigned short temp2;
	

#ifndef MSDOS
	unsigned int i; // NAL warning removal
	DT_PIPE_T pipe_values[NPARAM];
#endif
	
	if(pCmd_t->param_index && (pKsd_t->phoneme_mode & PHONEME_SPEAK))
	{
		if (pCmd_t->param_index >3)
		{
			/* params[1] 4 bits in pipe[1] (type)*/
			/* params[2] 10 bits in pipe[1] (+- value)*/
			/* params[3] 1 bit  in pipe[1] (%)  absolute values greater than 900 are % 
			             10 bits in pipe[2] (+- delay)*/
			/* params[5] 5 bits in pipe[2] (syl-count) */
			/* params[4] 9 bits in pipe[3]  (length)*/ /* this is currently 16 bits for ease */

			/* pipe[1] = TTTT VVVV VVVV VV_D */
			/* pipe[2] = DDDD DDDD DD_S SSSS */
			/* pipe[3] = ____ ___L LLLL LLLL */ /* pipe[3] = LLLL LLLL LLLL LLLL */


			/* type */
			temp=pCmd_t->params[1] & 0x000F;
			temp <<= 10;
			pipe_values[1]=0;
			pipe_values[1]|=temp;

			/* value */
			temp=pCmd_t->params[2];
			temp <<=2;
			temp2 = (temp & 0x0FFC);
			pipe_values[1]|=temp2;

			/* delay */
			pipe_values[2]=0;
			temp=pCmd_t->params[3];
			if (temp >900)
			{
				pipe_values[1]|=0x0001;
				temp-=900;
			}
			if (temp <-900)
			{
				pipe_values[1]|=0x0001;
				temp+=900;
			}
			temp<<=6;
			pipe_values[2]|=temp;

			/* syl_count */
			temp=pCmd_t->params[5];
			temp&=0x003F;
			pipe_values[2]|=temp;

			/* length */
			pipe_values[3]=pCmd_t->params[4];

			pCmd_t->param_index=4;
			pCmd_t->params[1]=pipe_values[1];
			pCmd_t->params[2]=pipe_values[2];
			pCmd_t->params[3]=pipe_values[3];

		}

		if (pCmd_t->params[0]&0xff00)
		{
			pCmd_t->params[0] = pCmd_t->params[0] | ((pCmd_t->param_index-1)<<PSNEXTRA); 
		}
		else
		{
			
			switch (pKsd_t->lang_curr)
			{
			case LANG_english:
				pCmd_t->params[0] = pCmd_t->params[0] | (PFUSA<<PSFONT) | 
					((pCmd_t->param_index-1)<<PSNEXTRA); 
				break;
			case LANG_british:
				pCmd_t->params[0] = pCmd_t->params[0] | (PFUK<<PSFONT) | 
					((pCmd_t->param_index-1)<<PSNEXTRA); 
				break;
			case LANG_german:
				pCmd_t->params[0] = pCmd_t->params[0] | (PFGR<<PSFONT) | 
					((pCmd_t->param_index-1)<<PSNEXTRA); 
				break;
			case LANG_spanish:
				pCmd_t->params[0] = pCmd_t->params[0] | (PFSP<<PSFONT) | 
					((pCmd_t->param_index-1)<<PSNEXTRA); 
				break;
			case LANG_latin_american:
				pCmd_t->params[0] = pCmd_t->params[0] | (PFLA<<PSFONT) | 
					((pCmd_t->param_index-1)<<PSNEXTRA); 
				break;
			case LANG_french:  //chj 7/20/00
				pCmd_t->params[0] = pCmd_t->params[0] | (PFFR<<PSFONT) | 
					((pCmd_t->param_index-1)<<PSNEXTRA); 
				break;
			}
		}
#ifdef MSDOS
                cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pCmd_t->params,pCmd_t->param_index);
#else
        for ( i = 0; i < (pCmd_t->param_index); i++ )
        {
        	pipe_values[i] = pCmd_t->params[i];
        }
#ifdef SINGLE_THREADED
		lts_loop(phTTS,pipe_values);
#else
        cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_values,(short)pCmd_t->param_index); // NAL warning removal
#endif
#endif
	}
	pCmd_t->param_index = 0;
	pCmd_t->cmd_p_flag = 0;
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
	int temp;
	
	if(c == CR || c == LF || pKsd_t->text_flush)
	{
		return;
	}
	if(pCmd_t->param_index && cm_phon_param_check(phTTS, c))
	{
		return;
	}
#ifndef MSDOS
	if (pCmd_t->international_phon_lang<0 && pCmd_t->international_flag>=0)
	{
		if (c=='_')
		{
			pCmd_t->international_temp=0;
			pCmd_t->q_flag=0;
			pCmd_t->international_phon_lang=pCmd_t->international_flag;
			pCmd_t->international_flag=-1;
			return;
		}
		else
		{
			pCmd_t->international_flag=-1;
			pCmd_t->international_phon_lang=-1;
			switch(cm_phon_lookup_arpa(phTTS, pCmd_t->q_flag,pCmd_t->international_temp))
			{
			case	0	:
				cm_cmd_error_comm(phTTS, CMD_bad_phoneme);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
				pCmd_t->international_temp=0;
				pCmd_t->q_flag=0;
				cm_phon_flush(phTTS);
				break;	
			case	1	:
				pCmd_t->q_flag=pCmd_t->international_temp;
				pCmd_t->international_temp=0;
				cm_phon_flush(phTTS);
				break;
			case	2	:
				pCmd_t->q_flag = 0;
				pCmd_t->international_temp=0;
				break;
			}
		}
	}
#endif
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
#ifdef PHEDIT2  /* ET merged from PHEDIT2 */
			if (pCmd_t->q_flag >= '0' && pCmd_t->q_flag <= '9' && c >= '0' && c <= '9') {
				PUSH_PHONE = ( ((pCmd_t->q_flag - '0') * 10) + (c - '0'));
				pCmd_t->q_flag = 0;
			} 
			else {
#endif			
#ifndef MSDOS
				if (pCmd_t->international_phon_lang<0)
					temp=cm_phon_lookup_language(phTTS,(unsigned char)pCmd_t->q_flag,(unsigned char)c); // NAL warning removal
				else
					temp=-1;
				if (pCmd_t->international_flag<0 && temp>=0)
				{
					pCmd_t->international_flag=temp;
					pCmd_t->international_temp=c;
				}
				else
#endif
				{
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
				}
#ifdef PHEDIT2
			} /* else */
#endif
			if(pCmd_t->q_flag && pCmd_t->international_flag<0)
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

	

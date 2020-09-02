 /*
 ***********************************************************************
 *
 *                           Copyright ©
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000, 2001 Force Computers, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *
 ***********************************************************************
 *    File Name:        cm_cmd.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    This file contains all command stubs that are implemented in the
 *    command processor itself ...
 *
 ***********************************************************************
 *    Revision History:
 *
 *  Rev     Who	    Date            Description
 *  ---     -----   -----------     --------------------------------------------
 *  0001    tek     11/06/1995     	Fix CMD_flushing action in cm_cmd_do_comm().
 *  0002    sik     03/22/1996     	Re-structured and merged in the win95 code.
 *  0003	SIK		07/08/1996	   	Cleaning up and maintenance 
 *	0004	MGS		08/06/1996		Added new_indexing stuff 
 *	0005	SIK 	09/09/1996		Fixed printf statement on cm_cmd_error_comm().
 *  0006    GL      11/06/1997      for BATS#345 write to file for [:error text] command
 *  0007	MFG		03/20/1998		BATS#628 fixed command crash when no argumant is passed	
 *  0008	ETT		10/05/1998		added linux code	
 *  0009	ETT		11/04/1998		for BATS#345 open close log.txt in cm_cmd_error_comm
 *									so that we can use [:error text] outside of [:log text on]
 *  0010	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces
 *  0011	MGS		04/13/2000		Changes for integrated phoneme set 
 *  0012	EAB		04/18/2000		Added a comment.
 *  0013	NAL		05/23/2000		typecast some variables (warning removal)
 *  0014	MGS		10/05/2000		Redhat 6.2 and linux warning removal
 *  0015	CAB		10/13/2000		Fixed copyright
 *  0016	MGS		02/08/2001		Fixed linux complier/environment issue
 *  0017	MGS		05/09/2001		Some VxWorks porting BATS#972
 *  0018	CAB		05/14/2001		Updated copyright info and edited comments.
 *  0019	MFG		05/29/2001		Included dectalkf.h
 *  0020	MGS		06/19/2001		Solaris Port BATS#972
 *  0021	MGS		04/03/2002		Single threaded lts
 *  0022	MGS		04/11/2002		ARM7 port
 *	0023	CAB		05/01/2002		Updated copyright info
 *	0023	MFG		07/01/2003		fixed rate bug BTS#10102
 *	0024	MFG		07/17/2003		fixed rate bug BTS#10100
 */

#include "dectalkf.h"
#include "cm_def.h"

#ifdef ARM7
#include "string.h"
#endif

extern unsigned char par_lower[];

#ifdef DEBUGPARS
/* ******************************************************************
 *      Function Name: #ifdef DEBUGPARS print_string()
 *
 *      Description:
 *
 *      Arguments: unsigned char *string
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * ******************************************************************/
void print_string(unsigned char *string)
{
	int i;

	for (i=0;string[i]!=0;i++)
	{
		putc(string[i]);
	}
}

/* ******************************************************************
 *      Function Name: #ifdef DEBUGPARS print_decimal()
 *
 *      Description:
 *
 *      Arguments: int i
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * ******************************************************************/
void print_decimal(int i)
{
	char s[10] = {' ',' ',' ',' ',' ',' ',' ',' ',' ','\0'};
	int j=8;

	if (i==0)
	{
		s[j]='0';
	}
	while (i!=0)
	{          
		s[j]=i%10+'0';
		i/=10;
		j--;
	}
	print_string(s);
}
#endif // DEBUGPARS


/* ******************************************************************
 *      Function Name: cm_cmd_match_comm()      
 *
 *      Description: used to isolate a single matching command that
 *      the user has entered with the command in the command table ... we
 *      either state in the command match state here, start looking for
 *      parameters, execute commands, or start the tossing characters ...
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *					unsigned int c
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void cm_cmd_match_comm(LPTTS_HANDLE_T phTTS, unsigned int c)
{   
	int     i;  
	int		temp;
	int     save_matches, save_index;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	//PKSD_T pKsd_t = phTTS->pKernelShareData;

#ifdef DEBUGPARS
	printf("CMD_PARS: cm_cmd_match_comm:\n");
#endif
	save_matches = pCmd_t->total_matches;
	save_index = pCmd_t->cmd_index;
	pCmd_t->pString[0] = NULL; // mfg initialize to NULL BATS#628

	/*
 	 *  space are either delimitors or are tossed ...
 	 */

	if(c == ' ' || c == '\t' || c == '\r' || c == '\n')
	{
		if(pCmd_t->total_matches == 1)
		{
			/* point 1 for the index command */
			/* if it not an index command, force the buffer clause buffer to be cleared */
			/* by sending a 0x0fff to it*/     
#ifdef NEW_INDEXING
			if (memcmp(CT[pCmd_t->cmd_index].c_name,"index",5)!=0)
			{   
//				printf("not index command 1\n");
			 	temp=pCmd_t->ParseChar; 
			 	pCmd_t->ParseChar=0x0fff;
/*	0010	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
				pCmd_t->letter_mode_flag=1;
			 	cm_pars_proc_char(phTTS,' ');
				pCmd_t->letter_mode_flag=0;
			 	pCmd_t->ParseChar=temp;
			}			 	
#endif
			cm_pars_new_state(pCmd_t, STATE_PARAM);
			cm_cmd_build_param(phTTS, c);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_match_comm: Parse State Switch: STATE_COMMAND->STATE_PARAM\n");
#endif
		}
		else 
		{
			if(pCmd_t->p_count != 0)
			{                       
				/* send 0x0fff to the parser */
#ifdef NEW_INDEXING
//				printf("not index command 2\n");
			 	temp=pCmd_t->ParseChar; 
			 	pCmd_t->ParseChar=0x0fff;
/*	0010	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
				pCmd_t->letter_mode_flag=1;
		 		cm_pars_proc_char(phTTS,' ');
				pCmd_t->letter_mode_flag=0;
			 	pCmd_t->ParseChar=temp;
#endif
				cm_cmd_error_comm(phTTS, CMD_bad_command);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_match_comm: Parse State Switch: STATE_COMMAND->STATE_TOSS\n");
#endif
			}
		}
		return;
	}
	(pCmd_t->p_count) += 1;

	/*
 	 *  is this an exit to command mode ...
 	 */

	if(c == ']')
	{
		/* point 2 for commands single words */
		/* if it not an index command, force the buffer clause buffer to be cleared */
		/* by sending a 0x0fff to it*/
#ifdef NEW_INDEXING
//		printf("not index command 3\n");
	 	temp=pCmd_t->ParseChar;     
	 	pCmd_t->ParseChar=0x0fff;
/*	0010	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
		pCmd_t->letter_mode_flag=1;
		cm_pars_proc_char(phTTS,' ');
		pCmd_t->letter_mode_flag=0;
	 	pCmd_t->ParseChar=temp;
#endif
		cm_cmd_do_command(phTTS, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_match_comm: Parse State Switch: STATE_COMMAND->STATE_NORMAL\n");
#endif
		return;
	}

	/*
	 *  if were trying to match up things here ...
	 */

	for(i = 0; i < total_commands; i++)
	{
		if(*(pCmd_t->cm +i) != -1)                             
		{
            if(CT[i].c_name[*(pCmd_t->cm +i)] == par_lower[c])
			{
				*(pCmd_t->cm +i) += 1;
				pCmd_t->cmd_index = i;
			}
			else
			{
				pCmd_t->total_matches -= 1;
				*(pCmd_t->cm +i) = -1;
			}
		}
	}
	if(pCmd_t->total_matches == 0)
	{
		if(save_matches != 1)
		{
			/* send 0x0fff to the parser */
			
#ifdef NEW_INDEXING
//			printf("not index command 4\n");
		 	temp=pCmd_t->ParseChar; 
		 	pCmd_t->ParseChar=0x0fff;
/*	0010	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
			pCmd_t->letter_mode_flag=1;
	 		cm_pars_proc_char(phTTS,' ');
			pCmd_t->letter_mode_flag=0;
		 	pCmd_t->ParseChar=temp;
#endif
			cm_cmd_error_comm(phTTS, CMD_bad_command);
			cm_pars_new_state(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_match_comm: Parse State Switch: STATE_COMMAND->STATE_TOSS\n");
#endif
		}
		else
		{
			pCmd_t->total_matches = save_matches;
			pCmd_t->cmd_index = save_index;    
			/* point 3 for index commands */
			/* if it not an index command, force the buffer clause buffer to be cleared */
			/* by sending a 0x0fff to it*/
#ifdef NEW_INDEXING
			if (memcmp(CT[pCmd_t->cmd_index].c_name,"index",5)!=0)
			{
//				printf("not index command 5\n");
			 	temp=pCmd_t->ParseChar; 
			 	pCmd_t->ParseChar=0x0fff;
/*	0010	MGS		11/19/1998		BATS #812 fixed say-letter mode extra spaces */
				pCmd_t->letter_mode_flag=1;
		 		cm_pars_proc_char(phTTS,' ');
				pCmd_t->letter_mode_flag=0;
			 	pCmd_t->ParseChar=temp;
			}			 	
#endif
			cm_pars_new_state(pCmd_t, STATE_PARAM);
			cm_cmd_build_param(phTTS, c);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_match_comm: Parse State Switch: STATE_COMMAND->STATE_PARAM\n");
#endif
		}
	}
}

/* ******************************************************************
 *      Function Name: cm_cmd_do_command()      
 *
 *      Description: execute a command ... fill in all the default parameters that were
 *      not supplied by the user ...        execute the command ... reset the parser
 *
 *      Arguments:  LPTTS_HANDLE_T phTTS, 
 *					unsigned int new_state		New parser state
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void cm_cmd_do_command(LPTTS_HANDLE_T phTTS, unsigned int new_state)
{
	int err_value;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	//PKSD_T pKsd_t = phTTS->pKernelShareData;
	
#ifdef DEBUGPARS
	printf("CMD_PARS: cm_cmd_do_command:\n");
#endif
	if(pCmd_t->total_matches == 1)
	{                                   
		err_value  = CT[pCmd_t->cmd_index].c_routine(phTTS);
		if(err_value == CMD_success)
		{
			cm_cmd_reset_comm(pCmd_t, new_state);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_do_command: Parse State Switch: STATE_?->STATE_new?\n");
#endif
			return;
		}
		else 
		{
			if(err_value == CMD_flushing)
			{
				cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_do_command: Parse State Switch: STATE_?->STATE_NORMAL\n");
#endif
#ifdef ESCPAE_SEQ
						pCmd_t->esc_seq->type = 0;
#endif
				/* ...tek 11/6 this needs a return statement. */
				return;
				}
			else
			{
				cm_cmd_error_comm(phTTS, err_value);
				if (pCmd_t->ParseChar == ']')
					cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
				else
					cm_cmd_reset_comm(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_do_command: Parse State Switch: STATE_?->STATE_TOSS\n");
#endif
				return;
			}
		}
	}
	cm_cmd_error_comm(phTTS, CMD_bad_command);
	if (pCmd_t->ParseChar == ']')
		cm_cmd_reset_comm(pCmd_t, STATE_NORMAL);
	else
		cm_cmd_reset_comm(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_do_command: Parse State Switch: STATE_?->STATE_TOSS\n");
#endif
}

/**********************************************************
 *  parameter conversion routines ...
 **********************************************************/
 
/* ******************************************************************
 *      Function Name: cm_cmd_build_param()     
 *
 *      Description: Collects the parameters for the command
 *
 *      Arguments:	LPTTS_HANDLE_T phTTS
 *					unsigned int c
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void cm_cmd_build_param(LPTTS_HANDLE_T phTTS, unsigned int c)
{
#ifdef DEBUGPARS
	int i,j;
#endif
	int temp;

	PCMD_T pCmd_t = phTTS->pCMDThreadData;
	//PKSD_T pKsd_t = phTTS->pKernelShareData;
	/*
	 *  first, if we get here and there are no more parameters needed ...
	 */
#ifdef DEBUGPARS
	/* printf("\nbuild_param;cmd_index=%d params[param_index]=%d",pCmd_t->cmd_index,pCmd_t->params[pCmd_t->param_index]);*/
    /* printf("\nbuild_param;param_index=%d format_index=%d ",pCmd_t->param_index,pCmd_t->format_index);*/
    /* printf(".");*/
#endif
	/*
	 * FORMAT_PARAM contains the string which is found
     * in the "format_index" entry in the command table.
     */
	if (FORMAT_PARAM == 0)
	{
		cm_cmd_do_command(phTTS, STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
		return;
	}

	/*
	 *  allow continuous execution of some commands  ...
	 */
	if(FORMAT_PARAM == '*')
	{
		if(c == ':')
		{
			cm_cmd_do_command(phTTS, STATE_COMMAND);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_COMMAND\n");
#endif
			return;
		}
		if(c == ' ' || c == '\t' || c == '\r' || c == '\n')
		{
			cm_cmd_do_command(phTTS, STATE_KEEP);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_KEEP\n");
#endif
			return;
		}
		if(c == ']')
		{
			cm_cmd_do_command(phTTS, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_NORMAL\n");
#endif
			return;
		}
		(pCmd_t->format_index) = 0;
	}

	/*
 	 *  on the first character for this paramater, init the value, or squeeze
 	 *  out leading spaces or ...
 	 */

	if(pCmd_t->p_count == 0)
	{
		CURR_PARAM = 0;
		CURR_DEFAULT = TRUE;
		
		if(pCmd_t->q_flag == 0 || FORMAT_PARAM != 'a')
		{
			switch(c)       
			{
				case ',':
					(pCmd_t->param_index) += 1;
					(pCmd_t->format_index) += 1;
					return;

				case ' ':
				case '\t':
				case '\r':
				case '\n':
					return;

				case ']':
					cm_cmd_do_command(phTTS, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_NORMAL\n");
#endif
					return;

				case ':':
					cm_cmd_do_command(phTTS, STATE_COMMAND);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_COMMAND\n");
#endif
					return;

				case '.':
					cm_cmd_do_command(phTTS, STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
					return;
				};
			} /* End of if(pCmd_t->q_flag == 0 || FORMAT_PARAM != 'a') */

		if(pCmd_t->q_flag == 0)
		{
			switch(c)       
			{
				case '<':
					pCmd_t->q_flag = '>';
					return;
				case '\"':
					pCmd_t->q_flag = '\"';
					return;
				};
			}
		}
	/*
	 *  now accept the first character and parse it into the param array ...
	 */

	(pCmd_t->p_count) += 1;
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
	CURR_DEFAULT = FALSE;
#else
	CURR_DEFAULT = false;
#endif
	switch (FORMAT_PARAM) 
	{
		/*
		 *  binary conversion ...
		 */
		case 'b':
			if(c == '0' || c == '1')
			{
				CURR_PARAM = CURR_PARAM*2 + c - '0';
				return;
			}
			break;
		/*
		 *  octal conversion ...
		 */
		case 'o':
			if(c >= '0' && c <= '7')
			{
				CURR_PARAM = CURR_PARAM*8 + c - '0';
				return;
			}
			break;
		/*
		 *  signed decimal conversion ...
		 */
		case 'd':
			if(pCmd_t->p_count == 1 && c == '-')
			{   
				/* 
				 * a minus is found; set pCmd_t->cmd_p_flag to TRUE to signal
				 * that the value of the phonemic info. should be negated. 
				 */
				pCmd_t->cmd_p_flag = TRUE;
			}
			else 
			{
				if(c >= '0' &&  c <= '9')
				{
					CURR_PARAM = CURR_PARAM*10 + c - '0';
				}
				else
				{
					break;
				}      
			}
			return;                         
		/*
		 *  hex conversion ...
		 */
		case 'h':
			if(c >= '0' && c <= '9')
			{
				CURR_PARAM = CURR_PARAM*16 + c - '0'; 
			}
			else
			{   
				/* Convert c to lowercase */
                c = par_lower[c];
				if(c >= 'a' && c <= 'f')
				{
					CURR_PARAM = CURR_PARAM*16 + c - 'a' + 10;
				}
				else
				{
					break;
				}
			}
			return;
		/*
		 *  ascii strings ... the param value is an index into the string buffer.
		 *  Delimitors are "" or <> or simple white space if no delimator is needed.
		 */
		case 'a':			
			if (pCmd_t->p_count == 1)
			{
				pCmd_t->pString[pCmd_t->param_index] = &(pCmd_t->string_buff[pCmd_t->next_char]);                               
				pCmd_t->string_buff[pCmd_t->next_char & STRING_MASK] = 0;
			}
			if(pCmd_t->q_flag && c != (unsigned int)pCmd_t->q_flag) // NAL warning removal
			{
				pCmd_t->string_buff[pCmd_t->next_char++ & STRING_MASK] = c;
				pCmd_t->string_buff[pCmd_t->next_char & STRING_MASK] = 0;
				return;
			}
			if ((pCmd_t->q_flag == 0) && (c != ' ') && (c != '\t') && (c != ']') && (c != ','))
			{
				pCmd_t->string_buff[pCmd_t->next_char++ & STRING_MASK] = c;
				pCmd_t->string_buff[pCmd_t->next_char & STRING_MASK] = 0;
				return;
			}
			if(pCmd_t->q_flag)
			{
				pCmd_t->q_flag = 0;
				return;
			}
			if(c != ']')
			{
				c = ' ';
			}
			pCmd_t->next_char += 1;
			break;
	}       /* End switch (FORMAT_PARAM) */

	/*
	 *  now, pCmd_t->cmd_p_flag may be set to cause a negation, if so do it ...
	 */

	if(pCmd_t->cmd_p_flag == TRUE)
	{
	    /* why we assign "sign" to a unsigned int ???  GL 4/3/1996 */
		/* The reason is that although it's declared an unsinged int it is
		really a signed int masquerading as an unsigned int and doind this 
		creates the correct value IF it really had been a signed int
		EAB 3/3/00 */
		CURR_PARAM = -(int)CURR_PARAM; // NAL warning removal
		
    }

	/*
	 *  if we have taken in something, bump the indexes and reset the
	 *  counts ...
	 */

	if(pCmd_t->q_flag && (c == (unsigned int)pCmd_t->q_flag))
	{
		if(pCmd_t->p_count != 1)
		{
			(pCmd_t->param_index) += 1;
		}
		cm_cmd_do_command(phTTS, STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
		return;
	}

	if(pCmd_t->p_count != 1)
	{
		(pCmd_t->format_index) += 1;
		pCmd_t->param_index += 1;
	}
	pCmd_t->p_count = 0;
	pCmd_t->cmd_p_flag = 0;


	/*
	 *  legal seperators are white space and commas ... note that leading
	 *  commas cause the pCmd_t->defaults to be preselected ...  white space is
	 *  allowed to start execution but comma implies another parameter ...
	 */


	switch (c)       
	{
		case ' ':
		case '\t':
        case '\r':
		case '\n':
			if(FORMAT_PARAM == '\0')
			{
				cm_cmd_do_command(phTTS, STATE_BRACKET);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_BRACKET\n");
#endif
			}
			else if(FORMAT_PARAM == '*')
			{
				cm_cmd_do_command(phTTS, STATE_KEEP);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_KEEP\n");
#endif
			}
			break;
		case ',':
			if(FORMAT_PARAM == '\0' || FORMAT_PARAM == '*')
			{
				/* if this is an index command, it must be flushed now */
#ifdef NEW_INDEXING
				if (memcmp(CT[pCmd_t->cmd_index].c_name,"index",5)==0)
				{
				 	temp=pCmd_t->ParseChar; 
				 	pCmd_t->ParseChar=0x0fff;
			 		cm_pars_proc_char(phTTS,' ');
				 	pCmd_t->ParseChar=temp;
				}			 	
#endif
				cm_cmd_error_comm(phTTS, CMD_bad_param);
				cm_pars_new_state(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_TOSS\n");
#endif
			}
			break;

		case ']':
			cm_cmd_do_command(phTTS, STATE_NORMAL);
#ifdef DEBUGPARS
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_NORMAL\n");
#endif
			break;
		default :
#ifdef NEW_INDEXING
			/* if this is an index command, it must be flushed now */
			if (memcmp(CT[pCmd_t->cmd_index].c_name,"index",5)==0)
			{
			 	temp=pCmd_t->ParseChar; 
			 	pCmd_t->ParseChar=0x0fff;
		 		cm_pars_proc_char(phTTS,' ');
			 	pCmd_t->ParseChar=temp;
			}			 	
#endif
			cm_cmd_error_comm(phTTS, CMD_bad_param);
			cm_pars_new_state(pCmd_t, STATE_TOSS);
#ifdef DEBUGPARS                                     
		printf("CMD_PARS: cm_cmd_build_param: Parse State Switch: STATE_PARAM->STATE_TOSS\n");
#endif
			break;
	} /* End switch (c) */
}

/* ******************************************************************
 *      Function Name: cm_cmd_reset_comm()      
 *
 *      Description: resets the command parser so that the next character
 *      can be interpreted as the first, this allows interruption of esc, dcs,
 *      command parsing, and regular text input.
 *
 *      Arguments: PCMD_T pCmd_t, unsigned int state
 *
 *      Return Value:
 *
 *      Comments:
 *
 * *****************************************************************/

void cm_cmd_reset_comm(PCMD_T pCmd_t, unsigned int state)
{
	int     i;

#ifdef DEBUGPARS
	printf("CMD_PARS: cm_cmd_reset_comm:\n");
#endif
	if(state != STATE_KEEP)
	{
		for(i=0;i<NPARAM;i++)
		{
			pCmd_t->defaults[i] = TRUE;
		}
		for(i=0; i<total_commands; i++)
		{
			*((pCmd_t->cm) + i) = 0;
		}
		pCmd_t->total_matches = total_commands;
		cm_pars_new_state(pCmd_t, state);
		(pCmd_t->format_index) = 0;
	}
	pCmd_t->next_char = 0;
	pCmd_t->param_index = 0;
	pCmd_t->cmd_p_flag = 0;
	pCmd_t->q_flag = 0;
	pCmd_t->p_count = 0;
	pCmd_t->international_flag=-1;
	pCmd_t->international_temp=0;
	pCmd_t->international_phon_lang=-1;
}

/* ******************************************************************
 *      Function Name: cm_cmd_error_comm()      
 *
 *      Description: Handles reporting of error messages; 4 different 
 *					 modes: ERROR_ignore, ERROR_text, ERROR_speak and
 *					 ERROR_tone.
 *
 *      Arguments: LPTTS_HANDLE_T phTTS	Text-to-speech handle
 *				   int type		Index in pKsd_t->error_table[] of the error.
 *
 *      Return Value: void
 *
 *      Comments:
 *
 * *****************************************************************/
void cm_cmd_error_comm(LPTTS_HANDLE_T phTTS, int type)
{
	DT_PIPE_T pipe_value[3];
	unsigned char _far *es;
#ifdef MSDOS
	SEQ     seq;
#endif
    PKSD_T pKsd_t = phTTS->pKernelShareData;
	PCMD_T pCmd_t = phTTS->pCMDThreadData;


	es = (unsigned char _far *)pKsd_t->error_table[type];
	switch(pCmd_t->error_mode)
	{
		case ERROR_ignore:
#ifndef MSDOS
			/* ETT 11/04/98 BATS#345 
				if we are not in [:log text on] and 
				the file is still open then close */
			if((pKsd_t->logflag & LOG_TEXT) != LOG_TEXT)
				if(phTTS->dwOutputState == STATE_OUTPUT_LOG_FILE)
					CloseLogFile(phTTS);		
#endif
			break;
		case ERROR_text:
#ifdef MSDOS
			WAIT_PRINT;
			/* 09/09/1996 SIK Changed %s to %Fs */
			/* GL 11/06/1997 for BATS#345 write to file for [:error text] command */
			printf("\n[:error %Fs]",es);
			SIGNAL_PRINT;
#else   
		/* ETT: 11/04/98 BATS#345
			we need to check if we are in [:log text on]
			if we are not then open log file 
			then put output state back to use audio so we can still 
			hear. and don't close log.txt until
			[:log text off] or [:error *]
		*/
#ifndef ARM7
			if((pKsd_t->logflag & LOG_TEXT) != LOG_TEXT){	
				OpenLogFile(phTTS);
				if (( phTTS->dwDeviceOptions & DO_NOT_USE_AUDIO_DEVICE ) == 0 )
					phTTS->dwOutputState = STATE_OUTPUT_AUDIO;
				else
					phTTS->dwOutputState = STATE_OUTPUT_NULL;
			}
			if (fprintf (phTTS->pLogFile,
#if defined __linux__ || defined VXWORKS || defined _SPARC_SOLARIS_
				 "\n[:error %s]", es) < 0)
#else
				 "\n[:error %Fs]", es) < 0)
#endif
			{
				TextToSpeechErrorHandler (phTTS,
										  ERROR_WRITING_FILE,
										  0L);
			} 
#endif // ARM7
#endif //MSDOS
			break;                  
		case    ERROR_speak:
			cm_cmd_sync(phTTS);
			while(*es)
			{
				pipe_value[0] = (PFASCII<<PSFONT) + *es++;
#ifdef SINGLE_THREADED
				lts_loop(phTTS,pipe_value);
#else
				cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,1);
#endif
			}
			pipe_value[0] = (PFASCII<<PSFONT) + 0xb;
#ifdef SINGLE_THREADED
			lts_loop(phTTS,pipe_value);
#else
			cm_util_write_pipe(pKsd_t,pKsd_t->lts_pipe,pipe_value,1);
#endif

#ifndef MSDOS
			/* ETT 11/04/98 BATS#345 
				if we are not in [:log text on] and 
				the file is still open then close */
			if((pKsd_t->logflag & LOG_TEXT) != LOG_TEXT)
				if(phTTS->dwOutputState == STATE_OUTPUT_LOG_FILE)
					CloseLogFile(phTTS);		
#endif
			break;
		case ERROR_tone:
			cm_cmd_sync(phTTS);
			cm_util_dtpc_tones(phTTS,0,697,100);
			cm_util_dtpc_tones_reset(phTTS);
#ifndef MSDOS
			/* ETT 11/04/98 BATS#345 
				if we are not in [:log text on] and 
				the file is still open then close */
			if((pKsd_t->logflag & LOG_TEXT) != LOG_TEXT)
				if(phTTS->dwOutputState == STATE_OUTPUT_LOG_FILE)
					CloseLogFile(phTTS);		
#endif
			break;
	};
}
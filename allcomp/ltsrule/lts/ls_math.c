/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000, 2001 Force Computer, Inc., a Solectron company. All rights reserved. 
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
 *    File Name:	ls_math.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    handle mode math stuff ...
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	MGS		02/27/1996		reformatted code and added function headers
 * 002	MGS		03/18/1996		Finished WIN32 code merge, function headers need updating
 * 003  GL      07/29/1996		use ls_util_write_pipe() to replace write_pipe()
 * 004	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 005	CHJ		07/20/2000		Warning removal
 * 006 	CAB		10/18/2000		Changed copyright info
 * 007	MFG		05/29/2001
 * 016	MGS		06/19/2001		Solaris Port BATS#972
 * 017	CAB		06/20/2001		Updated copyright info
 *
 */

#include "dectalkf.h"
#include "port.h"

#include "ls_math.h"

/* these must come after the structs defined above... */
#include "ls_def.h"
#ifndef NO_INCLUDED_C_FILES
#include "ls_math1.c" 
#endif
 
#ifdef OS_PALM
#pragma pcrelconstdata off
#endif                                      
extern const struct math_symbols math_table[];
extern const ASCKY_TAB ascky_tab[];
extern const int	NATAB;
#ifdef OS_PALM
#pragma pcrelconstdata on
#endif                                          
                                       
/*
 *	Function Name:	
 *		ls_math_do_math
 *
 *	Description:       
 *		this function looks up the ascky phonenes in the table math_table
 *		and if there is a match, it sends the phonenes for the symbol
 *
 *	Arguments:                                                       
 *		unsigned char check_char	The character to lookup
 *
 *	Return Value:                                          
 *		true 	if the symbol was found
 *		false 	otherwise
 *
 *	Comments:
 *
 */
int ls_math_do_math(PKSD_T pKsd_t, unsigned char check_char)
{
	struct math_symbols *ms;

	/*
	 * this must be a single character and mode math must be enabled ...
	 */

	if(pKsd_t->modeflag & MODE_MATH)
	{
		ms = (struct math_symbols *) math_table;
		while((*ms).sym)
		{
			if((*ms).sym == check_char)
			{
				ls_math_flush_ascky(pKsd_t,(*ms).sym_pron);
				return(true);
			}
			else
				ms += 1;
		}
	}
	return(false);
}





/*
 *	Function Name:
 *		ls_math_flush_ascky	
 *
 *	Description:           
 *		this function converts the ascky phonemes to arpabet phonemes and 
 *		sends them to ph
 *
 *	Arguments:          
 *		unsigned char *str	The list of ascky phonemes
 *
 *	Return Value:                                     
 *		None
 *
 *	Comments:
 *
 */
void ls_math_flush_ascky(PKSD_T pKsd_t,unsigned char *str)
{                              
	int	i;	

	while(*str)
	{
		for(i=0;i<NATAB;i++)  
		{
			if(*str == ascky_tab[i].p_graph)
			{
				ls_util_write_pipe(pKsd_t, (short *)&ascky_tab[i].pphone,1);
				break;
			} 
		}
		str += 1;
	}
}


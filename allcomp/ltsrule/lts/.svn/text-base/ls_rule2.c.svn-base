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
 *    File Name:	ls_rule2.c
 *    Author:		JDB                                         
 *    Creation Date:06/19/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    Store language dependent LTS Rule code which is common to
 *    several languages, but still needs to be separate from LTS core.                                                                            
 *                                                                             
 ***********************************************************************       
 *  
 *    Revision History:
 *
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 001	MGS		02/25/2002		Removed unused index code
 *      
 * 
 */

#include "ls_def.h"
/*
 *	Function Name:
 *	ls_rule_add_phone
 *
 *	Description:
 * 	Append a phoneme to the chain.
 * 	Pass the stressed and unstressed
 * 	phoneme values as parameters. The new
 * 	PHONE is allocated using "ls_rule_phone_alloc".
 * 	Set the flags to 0 and the stress to
 * 	unknown. Just NOP if you run out
 * 	of phoneme nodes.
 *
 *	Arguments:            
 *	PLTS_T 	pLts_t
 *	int sph,uph
 *
 *	Return Value:
 *
 *	Comments:
 *
 */

#if defined ENGLISH || defined GERMAN || defined FRENCH
void ls_rule_add_phone(PLTS_T pLts_t,int sph, int uph)
{
	PHONE	*fp;
	PHONE	*pp;
	if ((pp=(PHONE *)ls_rule_phone_alloc(pLts_t)) != NULL) {
		fp = pLts_t->phead.p_fp;		/* Link to front of the	*/
		pLts_t->phead.p_fp = pp;		/* generated PHONE list	*/
		pp->p_fp   = fp;
		fp->p_bp   = pp;
		pp->p_bp   = &pLts_t->phead;
//		pp->p_ip   = NULL;		/* No index chain	*/
		pp->p_flag = 0;
		pp->p_sphone = sph;
		pp->p_uphone = uph;
		pp->p_stress = SNONE;
	}
	/* return (0); */	/* unused return value */
}
#endif

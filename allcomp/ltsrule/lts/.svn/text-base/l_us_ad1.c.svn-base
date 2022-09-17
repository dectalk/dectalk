/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                 
 *    Copyright © 2000-2001 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	l_us_ad1.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    Adjustment code specific to english.                                                                            
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		--------------------------------------
 * 001  MGS     ??				??
 * 002  GL      09/24/1997      BATS#470  Add LDS debug switch 
 * 003	MGS		04/13/2000		Changes for integrated phoneme set 
 * 004 	CAB		10/18/2000		Changed copyright info
 * 005	MGS		03/22/2001		Removed bad allo rule.
 * 006  CAB		03/26/2001		Updated copyright info
 * 007	MGS		04/12/2001		Put allo rule back in
 *      
 * 
 */

#include "ls_def.h"

/*
 *	Function Name:	     
 *		ls_adju_cluster
 *
 *	Description:           
 *		this function checks for initial syllables
 *
 *	Arguments:                   
 *		int f		First phoneme
 *		int s		Second phoneme
 *
 *	Return Value:                                         
 *		OK     	good cluster
 *		TRYS	good cluster ans [s] or [S] could be merged
 *		ILLEGAL	bad cluster
 *
 *	Comments:
 * 	Clustering checks for initial
 * 	ylables. This might be changed to be done
 * 	ith a table, although code group space is a
 * 	little bit cheaper than data group space. The
 * 	"f" and "s" arguments are the first and the
 * 	second phonemes in the cluster. Return 
 * 	OK (good cluster), TRYS (good cluster, and
 * 	n [s] or [S] could be merged into it)
 * 	or ILLEGAL (bad cluster).
 *
 */ 

int ls_adju_cluster(int f, int s)
{
	switch (f) 
	{
		case US_P:
			if (s==US_LL || s==US_R)
				return (TRYS);
			break;
	
		case US_B:
			if (s==US_LL || s==US_R)
				return (DT_OK);
			break;

		case US_F:
			if (s ==US_R)
				return (TRYS);
			if (s ==US_LL)
				return (DT_OK);
			break;
	
		case US_T:
			if (s ==US_R)
				return (TRYS);
			if (s ==US_W)
				return (DT_OK);
			break;

		case US_D:
		case US_TH:
			if (s==US_W || s==US_R)
				return (DT_OK);
			break;
	
		case US_K:
			if (s==US_W || s==US_LL || s==US_R)
				return (TRYS);
			break;
	
		case US_G:
			if (s==US_W || s==US_LL || s==US_R)
				return (DT_OK);
			break;
	
		case US_S:
			if (s==US_W || s==US_LL || s==US_P || s==US_T || s==US_K
			||  s==US_M || s==US_N  || s==US_F)
				return (DT_OK);
			break;

		case US_SH:
			if (s==US_W || s==US_LL || s==US_R || s==US_P || s==US_T
			||  s==US_M || s==US_N)
				return (DT_OK);
	} /* 	switch (f) */
	return (ILLEGAL);
} 


/*
 *	Function Name:
 *		ls_adju_allo2	
 *
 *	Description:
 * 	This allophonic pass runs at
 * 	the very end of everything. It performs
 * 	some well known allophonic rules, to improve
 * 	the phoneme stream. Mostly ad hoc, but the
 * 	rules it implements are well known to those
 * 	familiar with the art.
 *
 *	Arguments: PLTS_T pLts_t
 *	
 *
 *	Return Value: void
 *		
 *
 *	Comments:
 *
 */
void ls_adju_allo2(PLTS_T pLts_t)
{
	 PHONE	*pp1;
	 PHONE	*pp2;
	 PHONE	*pp3;
	 PHONE	*pp4;
	 int	ph1;
	 int	sleft;
	 int	sthis;
	 int	fthis;

	/*
	 * Sweep the phoneme string
	 * left to right, performing the vowel
	 * reductions. This has to be done in a
	 * prepass, to make sure all IX or
	 * AX vowels are correct before the main
	 * body of the allophonic rules are
	 * run. The "bflag" conditionally blocks
	 * this pass on VMS.
	 */
#if defined	(VMS) || defined (LDS_BUILD)
	if (bflag == FALSE) 
	{
#endif

	sthis = SNONE;
	fthis = 0;
	pp1 = pLts_t->phead.p_fp;

	while (pp1 != &pLts_t->phead) 
	{
		if ((pp1->p_flag&PFSYLAB) != 0) 
		{
			sthis = pp1->p_stress;
			fthis = pp1->p_flag;
		}
		if ((fthis&PFBLOCK) == 0
		&& (pp1->p_uphone!=SIL && sthis==SUN)) 
		{

			pp1->p_sphone = pp1->p_uphone;
			pp1->p_uphone = SIL;
		} 
		pp1 = pp1->p_fp;
	}

#if defined	(VMS) || defined (LDS_BUILD)
	}
#endif
	/*
	 * Main allophonic sweep.
	 */

	pp1 = pLts_t->phead.p_fp;

	pLts_t->phead.p_sphone = SIL;			/* Make this look like	*/
	pLts_t->phead.p_uphone = SIL;			/* silence, morpheme	*/
	pLts_t->phead.p_flag = PFMORPH;			/* boundry.		*/
	sthis = SNONE;
	sleft = SNONE;
	pp1 = pLts_t->phead.p_fp;
	while (pp1 != &pLts_t->phead) 
	{
		ph1 = pp1->p_sphone;
		if ((pp1->p_flag&PFSYLAB) != 0) 
		{
			sleft = sthis;
			sthis = pp1->p_stress;
		}
		/*
		 * [x][l] => [L] / - +, [-Stress]
		 * [|][l] => [L] / - +, [-Stress]
		 */
		if (sthis==SUN && (ph1==US_AX || ph1==US_IX)) 
		{
			pp2 = pp1->p_fp;
			if (pp2->p_sphone == US_LL
			&& (pp2->p_flag&PFSYLAB) == 0
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
			{
				ls_adju_del_phone(pLts_t,pp2);
				pp1->p_sphone = US_EL;
				pp1 = pp1->p_fp;
				continue;
			}
		}

		/*
		 * [l] => [L] / [+Obs] - +, [-Stress]
		 * [r] => [R] / [+Obs] - +, [-Stress]
		 */

		if (sthis != SUN
		&& (ph1==US_LL || ph1==US_R)
		&& ls_adju_is_obs(pp1->p_bp) != FALSE
		&& (pp1->p_fp->p_flag&PFMORPH) != 0) 
		{
			pp1->p_sphone = US_RR;
			if (ph1 == US_LL)
				pp1->p_sphone = US_EL;
			pp1 = pp1->p_fp;
			continue;
		}
		/*
		 * [x][r] => [R]		(urge)
		 * [x][r][r] => [R]		(berry)
		 * [x][=][r] => [x][=][r]	(around)
		 * [x][r][=][r] => [x][=][r]	(arrange)
		 */
		if (ph1 == US_AX
		&& (pp2=pp1->p_fp)->p_sphone == US_R
		&& (pp2->p_flag&PFSYLAB) == 0)
		{
			ls_adju_del_phone(pLts_t,pp2);
			if ((pp2=pp1->p_fp)->p_sphone == US_R)
			{
				if ((pp2->p_flag&PFSYLAB) == 0)
				{
					ls_adju_del_phone(pLts_t,pp2);
					pp1->p_sphone = US_RR;
				}

			} 
			else
			{
				pp1->p_sphone = US_RR;
			}
				pp1 = pp1->p_fp;
				continue;
		}

		/*
		 * [n] => [n][y] / - [u][L] +
		 */
		/* 06 Hack.						*/
		if (ph1 == US_N) 
		{
		 	if ((pp2=pp1->p_fp)->p_sphone == US_UW) 
		 	{
		  		if ((pp3=pp2->p_fp)->p_sphone == US_EL) 
		  		{
		   			if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
		   			{
						if (ls_adju_ins_phone(pLts_t,pp2, US_Y, SIL, SNONE) == FALSE)
							return;
						pp1 = pp2;
						continue;
		   			}
		  		}
		 	}
		}
		/*
		 * [n] => [G] / - {[k],[g]}
		 */
		if (ph1 == US_N
		&& ((pp2=pp1->p_fp)->p_sphone==US_K || pp2->p_sphone==US_G)
		&& (pp2->p_flag&PFSYLAB) == 0) 
		{
			pp1->p_sphone = US_NX;
			pp1 = pp1->p_fp;
			continue;	
		}
		/*
		 * More palatalization.
		 * [g] => [J] / - [|][z][x][m] +
		 *	      / - [A][z] +
		 *	      / - [|][s][t] +
		 *	      / - [|][d] +
		 * [k] => [s] / - [|][z][x][m] +
		 *	      / - [A][z] +
		 *	      / - [|][s][t] +
		 *	      / - [|][d] +
		 */
		if (ph1==US_G || ph1==US_K) 
		{
			if (ph1 == US_G)		/* [g] => [J]		*/
				ph1 = US_JH;
			else				/* [k] => [s]		*/
				ph1 = US_S;
			pp2 = pp1->p_fp;
			if (pp2->p_sphone == US_AY
			&& (pp2=pp2->p_fp)->p_sphone == US_Z
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
			{
				pp1->p_sphone = ph1;
				pp1 = pp1->p_fp;
				continue;
			} /*if (pp2->p_sphone == AY */
			else
			{ 
				if (pp2->p_sphone == US_IX) 
				{
					pp2 = pp2->p_fp;
					if (pp2->p_sphone == US_D
					&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
					{
						pp1->p_sphone = ph1;
						pp1 = pp1->p_fp;
						continue;
					}
					/* 06 Hack.				*/
					if (pp2->p_sphone == US_Z) {
				 		if ((pp3=pp2->p_fp)->p_sphone == US_AX) 
				 		{
				  			if ((pp3=pp3->p_fp)->p_sphone == US_M) 
				  			{
				   				if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
				   				{
									pp1->p_sphone = ph1;
									pp1 = pp1->p_fp;
									continue;
				   				}
				  			}
				 		}
					}
					/* 06 Hack.				*/
					if (pp2->p_sphone == US_S) 
					{
				 		if ((pp3=pp2->p_fp)->p_sphone == US_T) 
				 		{
				  			if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
				  			{
								pp1->p_sphone = ph1;
								pp1 = pp1->p_fp;
								continue;
				  			}
				 		}
					}
				}		/*	if (pp2->p_sphone == IX)  */
			}/* if (pp2->p_sphone == AY */
		}/* 		if (ph1==G || ph1==K) */
		/*
		 * D rules.
		 */
		if (ph1 == US_D) 
		{
			/*
			 * [d] => [J] / - [u][l] +
			 * [d] => [J] / - [u][L] +
			 */
			if ((pp2=pp1->p_fp)->p_sphone == US_UW
			&& ((pp2=pp2->p_fp)->p_sphone == US_LL
			|| pp2->p_sphone == US_EL)
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
			{
				pp1->p_sphone = US_JH;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/*
		 * S rules.
		 */
		if (ph1 == US_S) 
		{
			/*
			 * [k][s] => [g][z] / [|] - [+Voc,+Stress]
			 */
			if ((pp2=pp1->p_bp)->p_sphone == US_K
			&& pp2->p_bp->p_sphone == US_IX
			&& sleft == SUN
			&& ls_adju_is_voc(pp1->p_fp) != FALSE
			&& sthis != SUN) 
			{
				pp2->p_sphone = US_G;
				pp1->p_sphone = US_Z;
				continue;
			}
			/*
			 * [s][s] => [S] / - [u] +
			 */
			/* 06 Hack.					*/
			if ((pp2=pp1->p_bp)->p_sphone == US_S) 
			{
			 	if ((pp3=pp1->p_fp)->p_sphone == US_UW) 
			 	{
			  		if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
			  		{
						if ((pp2->p_flag&PFSYLAB) != 0)
							return;
						ls_adju_del_phone(pLts_t,pp2);
						pp1->p_sphone = US_SH;
						pp1 = pp1->p_fp;
						continue;
			  		}
			 	}
			}
			/*
			 * [s][i] => [S] / - [x][s] +
			 */
			/* 06 Hack.					*/
			if ((pp2=pp1->p_fp)->p_sphone == US_IY) 
			{
			 	if ((pp3=pp2->p_fp)->p_sphone == US_AX) 
			 	{
			 		if ((pp4=pp3->p_fp)->p_sphone == US_S) 
			 		{
					   	if ((pp4->p_fp->p_flag&PFMORPH) != 0) 
					   	{
							if ((pp2->p_flag&PFSYLAB) != 0)
								return;
							ls_adju_del_phone(pLts_t,pp2);
							pp1->p_sphone = US_SH;
							pp1 = pp1->p_fp;
							continue;
			 		  	}
			 		}
			 	}
			}
		}/* 		if (ph1 == S) */

		/*
		 * T rules.
		 */
		if (ph1 == US_T) 
		{
			pp2 = pp1->p_fp;
			/*
			 * [t] => [C] / - [u][e][r][i] +
			 * [t] => [C] / - [u][L] +
			 * ; MGS this one is not good
			 * ; [t] => [C] / - [u] +
			 */
			if (pp2->p_sphone == US_UW) 
			{
				pp3 = pp2->p_fp;
				if ((pp3->p_flag&PFMORPH) != 0) 
				{
					pp1->p_sphone = US_CH;
					pp1 = pp1->p_fp;
					continue;
				} 
				/* 06 Hack.				*/
				if (pp3->p_sphone == US_EL) 
				{
				 	if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
				 	{
						pp1->p_sphone = US_CH;
						pp1 = pp1->p_fp;
						continue;
				 	}
				}
				/* 06 Hack.				*/
				if (pp3->p_sphone == US_EY) 
				{
				 	if ((pp4=pp3->p_fp)->p_sphone == US_R) 
				 	{
				  		if ((pp4=pp4->p_fp)->p_sphone == US_IY) 
				  		{
				   			if ((pp4->p_fp->p_flag&PFMORPH) != 0) 
				   			{
								pp1->p_sphone = US_CH;
								pp1 = pp1->p_fp;
								continue;
				   			}
				  		}
				 	}
				}
			/*
			 * [t][i] => [S] / - [x] +
			 * [t] => [S] / - [i][e][t][R] +
			 */
			}	/* if (pp2->p_sphone == UW)*/ 
			else 
			{
				if (pp2->p_sphone == US_IY) 
				{
					pp3 = pp2->p_fp;
					if (pp3->p_sphone == US_AX
					&& (pp3->p_fp->p_flag&PFMORPH) != 0) 
					{
						if ((pp2->p_flag&PFSYLAB) != 0)
							return;
						ls_adju_del_phone(pLts_t,pp2);
						pp1->p_sphone = US_SH;
						pp1 = pp1->p_fp;
						continue;
					}
					/* 06 Hack.				*/
					if (pp3->p_sphone == US_EY) {
				 	if ((pp4=pp3->p_fp)->p_sphone == US_T) {
				  	if ((pp4=pp4->p_fp)->p_sphone == US_RR) {
				   	if ((pp4->p_fp->p_flag&PFMORPH) != 0) {
						pp1->p_sphone = US_SH;
						pp1 = pp1->p_fp;
						continue;
				   	}
				  	}
				 	}
					}
				}/*	if (pp2->p_sphone == IY) */
			}	/* if (pp2->p_sphone == UW)*/ 
		}	/*	if (ph1 == T)*/
		pp1 = pp1->p_fp;
	}/* 	while ((int)pp1 != (int)&pLts_t->phead) */
	
}

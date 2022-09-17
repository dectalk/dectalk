/*
 ***********************************************************************
 *                                                                      
 *                           Copyright ©                              
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	l_uk_ad1.c
 *    Author:		Doug Robinson/Ginger Lin                                    
 *    Creation Date:10/01/1997                                                 
 *                                                                             
 *    Functionality:                                                           
 *    Adjustment code specific to UK english.                                                                            
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		--------------------------------------
 * 001  DR/GL	07/21/1997		Created, Copied from l_us_ad1.c
 * 002  GL      09/24/1997      BATS#470  Add LDS debug switch 
 * 003  GL      11/04/1997      Tune UK allophone R rule 
 * 004	MGS		04/13/2000		Changes for integrated phoneme set 
 * 005 	CAB		10/18/2000		Changed copyright info
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
		case UK_P:
			if (s==UK_LL || s==UK_R)
				return (TRYS);
			break;
	
		case UK_B:
			if (s==UK_LL || s==UK_R)
				return (DT_OK);
			break;

		case UK_F:
			if (s ==UK_R)
				return (TRYS);
			if (s ==UK_LL)
				return (DT_OK);
			break;
	
		case UK_T:
			if (s ==UK_R)
				return (TRYS);
			if (s ==UK_W)
				return (DT_OK);
			break;

		case UK_D:
		case UK_TH:
			if (s==UK_W || s==UK_R)
				return (DT_OK);
			break;
	
		case UK_K:
			if (s==UK_W || s==UK_LL || s==UK_R)
				return (TRYS);
			break;
	
		case UK_G:
			if (s==UK_W || s==UK_LL || s==UK_R)
				return (DT_OK);
			break;
	
		case UK_S:
			if (s==UK_W || s==UK_LL || s==UK_P || s==UK_T || s==UK_K
			||  s==UK_M || s==UK_N  || s==UK_F)
				return (DT_OK);
			break;

		case UK_SH:
			if (s==UK_W || s==UK_LL || s==UK_R || s==UK_P || s==UK_T
			||  s==UK_M || s==UK_N)
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
		if (sthis==SUN && (ph1==UK_AX || ph1==UK_IX)) 
		{
			pp2 = pp1->p_fp;
			if (pp2->p_sphone == UK_LL
			&& (pp2->p_flag&PFSYLAB) == 0
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
			{
				ls_adju_del_phone(pLts_t,pp2);
				pp1->p_sphone = UK_EL;
				pp1 = pp1->p_fp;
				continue;
			}
		}

		/*
		 * [l] => [L] / [+Obs] - +, [-Stress]
		 */

		if (sthis != SUN
		&& (ph1==UK_LL)
		&& ls_adju_is_obs(pp1->p_bp) != FALSE
		&& (pp1->p_fp->p_flag&PFMORPH) != 0) 
		{
			pp1->p_sphone = UK_EL;
			pp1 = pp1->p_fp;
			continue;
		}
		/*
		 * [x][r] => [R]	/ - [+stress]	(urge)(bird)(heard)
		 */
		if (ph1 == UK_AX
		&& (pp2=pp1->p_fp)->p_sphone == UK_R
		&& (pp2->p_flag&PFSYLAB) == 0
		&& sleft == SUN
		&& sthis != SUN) 
		{
			ls_adju_del_phone(pLts_t,pp2);
			pp1->p_sphone = UK_RR;
			pp1 = pp1->p_fp;
			continue;
		}
	
		 /*
		 * [x][r] => [R]		(urge) ** questionable UK rule, GL 11/04/97 restore
		 * [x][r][r] => [r]		(Strawberry)
		 * [x][=][r] => [x][=][r]	(around)
		 * [x][r][=][r] => [x][=][r]	(arrange)
		 */
		if (ph1 == UK_AX
		&& (pp2=pp1->p_fp)->p_sphone == UK_R
		&& (pp2->p_flag&PFSYLAB) == 0)
		{
			ls_adju_del_phone(pLts_t,pp2);
			if ((pp2=pp1->p_fp)->p_sphone == UK_R)
			{
				if ((pp2->p_flag&PFSYLAB) == 0)
				{
					ls_adju_del_phone(pLts_t,pp2);
					pp1->p_sphone = UK_RR;
				}
/*
				if ((pp2->p_flag&PFSYLAB) == 0)
				{
					ls_adju_del_phone(pLts_t,pp2);
					pp1->p_sphone = R;
				}
*/
			} 
			else
			{
				pp1->p_sphone = UK_RR;
			}
				pp1 = pp1->p_fp;
				continue;
		}

		/*
		 * [n] => [n][y] / - [u][L] +
		 */
		/* 06 Hack.						*/
		if (ph1 == UK_N) 
		{
		 	if ((pp2=pp1->p_fp)->p_sphone == UK_UW) 
		 	{
		  		if ((pp3=pp2->p_fp)->p_sphone == UK_EL) 
		  		{
		   			if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
		   			{
						if (ls_adju_ins_phone(pLts_t,pp2, UK_Y, SIL, SNONE) == FALSE)
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
		if (ph1 == UK_N
		&& ((pp2=pp1->p_fp)->p_sphone==UK_K || pp2->p_sphone==UK_G)
		&& (pp2->p_flag&PFSYLAB) == 0) 
		{
			pp1->p_sphone = UK_NX;
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
		if (ph1==UK_G || ph1==UK_K) 
		{
			if (ph1 == UK_G)		/* [g] => [J]		*/
				ph1 = UK_JH;
			else				/* [k] => [s]		*/
				ph1 = UK_S;
			pp2 = pp1->p_fp;
			if (pp2->p_sphone == UK_AY
			&& (pp2=pp2->p_fp)->p_sphone == UK_Z
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
			{
				pp1->p_sphone = ph1;
				pp1 = pp1->p_fp;
				continue;
			} /*if (pp2->p_sphone == AY */
			else
			{ 
				if (pp2->p_sphone == UK_IX) 
				{
					pp2 = pp2->p_fp;
					if (pp2->p_sphone == UK_D
					&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
					{
						pp1->p_sphone = ph1;
						pp1 = pp1->p_fp;
						continue;
					}
					/* 06 Hack.				*/
					if (pp2->p_sphone == UK_Z) {
				 		if ((pp3=pp2->p_fp)->p_sphone == UK_AX) 
				 		{
				  			if ((pp3=pp3->p_fp)->p_sphone == UK_M) 
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
					if (pp2->p_sphone == UK_S) 
					{
				 		if ((pp3=pp2->p_fp)->p_sphone == UK_T) 
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
		if (ph1 == UK_D) 
		{
			/*
			 * [d] => [J] / - [u][l] +
			 * [d] => [J] / - [u][L] +
			 */
			if ((pp2=pp1->p_fp)->p_sphone == UK_UW
			&& ((pp2=pp2->p_fp)->p_sphone == UK_LL
			|| pp2->p_sphone == UK_EL)
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) 
			{
				pp1->p_sphone = UK_JH;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/*
		 * S rules.
		 */
		if (ph1 == UK_S) 
		{
			/*
			 * [k][s] => [g][z] / [|] - [+Voc,+Stress]
			 */
			if ((pp2=pp1->p_bp)->p_sphone == UK_K
			&& pp2->p_bp->p_sphone == UK_IX
			&& sleft == SUN
			&& ls_adju_is_voc(pp1->p_fp) != FALSE
			&& sthis != SUN) 
			{
				pp2->p_sphone = UK_G;
				pp1->p_sphone = UK_Z;
				continue;
			}
			/*
			 * [s][s] => [S] / - [u] +
			 */
			/* 06 Hack.					*/
			if ((pp2=pp1->p_bp)->p_sphone == UK_S) 
			{
			 	if ((pp3=pp1->p_fp)->p_sphone == UK_UW) 
			 	{
			  		if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
			  		{
						if ((pp2->p_flag&PFSYLAB) != 0)
							return;
						ls_adju_del_phone(pLts_t,pp2);
						pp1->p_sphone = UK_SH;
						pp1 = pp1->p_fp;
						continue;
			  		}
			 	}
			}
			/*
			 * [s][i] => [S] / - [x][s] +
			 */
			/* 06 Hack.					*/
			if ((pp2=pp1->p_fp)->p_sphone == UK_IY) 
			{
			 	if ((pp3=pp2->p_fp)->p_sphone == UK_AX) 
			 	{
			 		if ((pp4=pp3->p_fp)->p_sphone == UK_S) 
			 		{
					   	if ((pp4->p_fp->p_flag&PFMORPH) != 0) 
					   	{
							if ((pp2->p_flag&PFSYLAB) != 0)
								return;
							ls_adju_del_phone(pLts_t,pp2);
							pp1->p_sphone = UK_SH;
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
		if (ph1 == UK_T) 
		{
			pp2 = pp1->p_fp;
			/*
			 * [t] => [C] / - [j][r][i] +
			 */
			if (pp2->p_sphone == UK_UR) 
			{
				pp3 = pp2->p_fp;
				if (pp3->p_sphone == UK_R) 
				{
				 	if ((pp4=pp3->p_fp)->p_sphone == UK_IY) 
				 	{
				   		if ((pp4->p_fp->p_flag&PFMORPH) != 0) 
				   		{
								pp1->p_sphone = UK_CH;
								pp1 = pp1->p_fp;
								continue;
				   		}
				 	}
				}
			}
			/*
			 * [t] => [C] / - [u][L] +
			 * [t] => [C] / - [u] +
			 */
			if (pp2->p_sphone == UK_UW) 
			{
				pp3 = pp2->p_fp;
				if ((pp3->p_flag&PFMORPH) != 0) 
				{
					pp1->p_sphone = UK_CH;
					pp1 = pp1->p_fp;
					continue;
				}
				/* 06 Hack.				*/
				if (pp3->p_sphone == UK_EL) 
				{
				 	if ((pp3->p_fp->p_flag&PFMORPH) != 0) 
				 	{
						pp1->p_sphone = UK_CH;
						pp1 = pp1->p_fp;
						continue;
				 	}
				}
			/*
			 * [t][i] => [S] / - [x] +
			 * [t] => [S] / - [i][e][t][x] +
			 */
			}	/* if (pp2->p_sphone == UW)*/ 
			else 
			{
				if (pp2->p_sphone == UK_IY) 
				{
					pp3 = pp2->p_fp;
					if (pp3->p_sphone == UK_AX
					&& (pp3->p_fp->p_flag&PFMORPH) != 0) 
					{
						if ((pp2->p_flag&PFSYLAB) != 0)
							return;
						ls_adju_del_phone(pLts_t,pp2);
						pp1->p_sphone = UK_SH;
						pp1 = pp1->p_fp;
						continue;
					}
					/* 06 Hack.				*/
					if (pp3->p_sphone == UK_EY) {
				 	if ((pp4=pp3->p_fp)->p_sphone == UK_T) {
				  	if ((pp4=pp4->p_fp)->p_sphone == UK_AX) {
				   	if ((pp4->p_fp->p_flag&PFMORPH) != 0) {
						pp1->p_sphone = UK_SH;
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
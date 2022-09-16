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
 *    File Name:	l_gr_ad1.c
 *    Author:       JDB
 *    Creation Date:06/19/96
 *
 *    Functionality:       
 *    German specific cluster code.
 *
 ***********************************************************************
 *    Revision History:
 *
 */

#include "l_gr_ph.h"
#ifdef VMS
   extern int bflag;
#endif


/* A dummy, since German doesn't use allo1 */
void ls_adju_allo1 (PLTS_T pLts_t, PHONE * p1, PHONE * p2) { }


 
/*                      
 *      Function Name: ls_adju_cluster()      
 *
 *  	Description: Clustering checks for initial
 * 		sylables. This might be changed to be done
 * 		with a table, although code group space is a
 * 		little bit cheaper than data group space. The
 * 		"f" and "s" arguments are the first and the
 * 		econd phonemes in the cluster. Return 
 * 		OK (good cluster), TRYS (good cluster, and
 *		an [s] or [S] could be merged into it)
 *		or ILLEGAL (bad cluster).
 *
 *      Arguments: int f, int s
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */
int ls_adju_cluster(int f, int s)
{
	switch (f) {
	case P:
		if (s == L || s == RR || s == R)
			return (TRYS);
		break;

	case B:
		if (s == L || s == RR || s == R)
			return (OK);
		break;

 	case F:
		if (s == RR || s == R || s == L)
			return (OK);
		break;

	case T:
		if (s == RR || s == R)
			return (TRYS);
		break;

	case V:
		if (s == RR || s == R)
			return (OK);
		break;

	case D:
		if (s == RR || s == R)
			return (OK);
		break;

	case K:
		if (s == L || s == RR || s == R)
			return (TRYS);
		break;

	case G:
		if (s == N || s == L || s == RR || s == R)
			return (OK);
		break;

	case S:
		if (s == TS || s == L || s == P || s == T || s == K)
			return (OK);
		break;

	case SH:
		if (s == V || s == L || s == RR || s == R || s == P || s == T
		||  s == M || s == N)
			return (OK);
	}
	return (ILLEGAL);
}



/*
 * These macro are used to generate the allo2() main code
 */

#define  gallo2_3(p1, p2, p3) \
{ \
		if (gisbdgv(ph1)) \
		{ \
		   if ((pp2=pp1->p_fp)->p_sphone == p1) \
		   { \
			if ((pp3=pp2->p_fp)->p_sphone == p2) \
			{ \
			   if ((pp4=pp3->p_fp)->p_sphone == p3) \
			   { \
			      switch (pp1->p_sphone) \
			      { \
		     		case  B : pp1->p_sphone = P; \
					  break; \
		     		case  D : pp1->p_sphone = T; \
					  break; \
				case  G : pp1->p_sphone = K; \
					  break; \
				case  V : pp1->p_sphone = F; \
					  break; \
			      } \
			      pp1 = pp1->p_fp; \
			      continue; \
			   } \
			} \
		   } \
		} \
}

#define  gallo2_4(p1, p2, p3, p4) \
{ \
		if (gisbdgv(ph1)) \
		{ \
		   if ((pp2=pp1->p_fp)->p_sphone == p1) \
		   { \
			if ((pp3=pp2->p_fp)->p_sphone == p2) \
			{ \
			   if ((pp4=pp3->p_fp)->p_sphone == p3) \
			   { \
			      if ((pp5=pp4->p_fp)->p_sphone == p4) \
			      { \
			        switch (pp1-> p_sphone) \
			        { \
		     		  case  B : pp1->p_sphone = P; \
			  		    break; \
		     		  case  D : pp1->p_sphone = T; \
					    break; \
				  case  G : pp1->p_sphone = K; \
					    break; \
				  case  V : pp1->p_sphone = F; \
					    break; \
			        } \
			        pp1 = pp1->p_fp; \
			        continue; \
			     } \
			   } \
			} \
		   } \
		} \
}



  
/*
 *      Function Name: ls_adju_allo2()      
 *
 *  	Description: This allophonic pass runs at
 *  	the very end of everything. It performs
 *  	some well known allophonic rules, to improve
 *  	the phoneme stream. Mostly ad hoc, but the
 *  	rules it implements are well known to those
 *  	amiliar with the art.
 *
 *      Arguments: PLTS_T pLts_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */                                           
void ls_adju_allo2(PLTS_T pLts_t)
{
	 PHONE	*pp1;
	 PHONE	*pp2;
	 PHONE	*pp3;
	 PHONE	*pp4;
	 PHONE	*pp5;
	 int	ph1;
	 int	ph2;
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
#ifdef	VMS
	if (bflag == FALSE) {
#endif

	sthis = SNONE;
	fthis = 0;
	pp1 = pLts_t->phead.p_fp;

	while (pp1 != &(pLts_t->phead)) {
		if ((pp1->p_flag&PFSYLAB) != 0) {
			sthis = pp1->p_stress;
			fthis = pp1->p_flag;
		}
		if ((fthis&PFBLOCK) == 0
		&& (pp1->p_uphone!=SIL && sthis==SUN)) {

			pp1->p_sphone = pp1->p_uphone;
			pp1->p_uphone = SIL;
		} 
		pp1 = pp1->p_fp;
	}

#ifdef	VMS
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
	while (pp1 != &(pLts_t->phead))
	{
		ph1 = pp1->p_sphone;
		if ((pp1->p_flag&PFSYLAB) != 0)
		{
			sleft = sthis;
			sthis = pp1->p_stress;
		}


		/*
		 * [b] > [p] / - {#, =}
		 * [d] > [t] / - {#, =}
		 * [g] > [k] / - {#, =}
		 * [z] > [s] / - {#, =}
		 */
        if ((ph1 == B || ph1 == D || ph1 == G || ph1 == Z) &&
		   ((pp1->p_fp->p_flag&PFMORPH) != 0 ||
		   (pp1->p_fp->p_flag&PFSYLAB) != 0) &&
                   ls_adju_is_voc(pp1->p_fp) == FALSE)
		{
		   switch (pp1->p_sphone)
		   {
		     case  B : pp1->p_sphone = P; break;
		     case  D : pp1->p_sphone = T; break;
		     case  G : pp1->p_sphone = K; break;
		     case  Z : pp1->p_sphone = S; break;
		   }
                    pp1 = pp1->p_fp;
                    continue;
		}


		/*
		 * [r] > [R] / - [+voc]   (this rule is WRONG)
		 *
		 * (new rule from Sonya)
		 * [r] > [R] / [+voc] - [+cons]
		 * [r] > [R] / - {#, +, =}
		 */
        if (ph1 == RR &&
/*         (ls_adju_is_voc(pp1->p_fp) != FALSE || */
           ((pp1->p_fp->p_flag&PFSYLAB) != 0 ||
           (pp1->p_fp->p_flag&PFMORPH) != 0 ))
		{
		    pp1->p_sphone = R;
            pp1 = pp1->p_fp;
            continue;
		}
        if (ph1 == RR &&
            ls_adju_is_voc(pp1->p_bp) != FALSE &&
            ls_adju_is_cons(pp1->p_fp) != FALSE)
        {
        	pp1->p_sphone = R;
            pp1 = pp1->p_fp;
            continue;
        }
        /*
         * (new rule from Sonya)
         * [R] > [r] / {#, =, +} -
         *
         */
        if (ph1 == R &&
            ((pp1->p_flag&PFSYLAB) != 0 ||
            (pp1->p_bp->p_flag&PFBOUND) != 0 ))
        {
        	pp1->p_sphone = RR;
            pp1 = pp1->p_fp;
            continue;
        }

		/*
		 * [x] > [X] / {[+voc][+back]} -
		 */
        if (ph1 == CH
            && (ls_adju_is_voc(pp1->p_bp) != FALSE) &&
               (gisback(pp1->p_bp) != FALSE))
		{
		    pp1->p_sphone = KH;
            pp1 = pp1->p_fp;
            continue;
		}

		/*
		 * [b] > [p] / - [b][a:][r]   (b1r)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(B, AH, RR);

		/*
		 * [b] > [p] / - [x][@][n]    (x@n)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(CH, EX, N);

		/*
		 * [b] > [p] / - [h][a][f][t]  (haft)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_4(H, A, F, T);

		/*
		 * [b] > [p] / - [h][a/][t]  (hAt)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(H, EI, T);

		/*
		 * [b] > [p] / - [l][a/][n]  (lAn)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(L, EI, N);

		/*
		 * [b] > [p] / - [l][I][N]  (iIG)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(L, I, NG);

		/*
		 * [b] > [p] / - [l][I][N][s] (lIGs)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_4(L, I, NG, S);
		/*
		 * [b] > [p] / - [l][o:][s] (l4s)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(L, OH, S);

		/*
		 * [b] > [p] / - [n][I][s]  (nIS)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(N, I, S);

		/*
		 * [b] > [p] / - [z][a:][l]  (z1l)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(Z, AH, L);

		/*
		 * [b] > [p] / - [z][a:][m]  (z1m)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(Z, AH, M);

		/*
		 * [b] > [p] / - [z][@][l]  (z@l)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(Z, EX, L);

		/*
		 * [b] > [p] / - [S][a][f][t] (S1ft)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_4(SH, A, F, T);

		/*
		 * [b] > [p] / - [t][u:][m]   (t5m)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_3(T, UH, M);

		/*
		 * [b] > [p] / - [v][E][R][C/] (vERT)
		 * [d] > [t]
		 * [g] > [k]
		 * [v] > [f]
		 */
		gallo2_4(V, E, R, TS);

		pp1 = pp1->p_fp;
	}

}


 
/*
 *      Function Name: gisback()      
 *
 *  	Description: 
 *
 *      Arguments: PHONE	*pp
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

int gisback( PHONE	*pp)
{
	if ((pfeat[pp->p_sphone]&PBACK) != 0)
		return (TRUE);
	return (FALSE);
}


/*
 * 
 */
 
/*
 *      Function Name: gisbdgv()       
 *
 *  	Description: This routine tests if the phones
 * 					 "p" is [p], [d], [g] and [v]
 *
 *      Arguments: int p
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
int gisbdgv(int p)
{
        if (p==B || p==D || p==G || p==V)
                return (TRUE);
        return (FALSE);
}




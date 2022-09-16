/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
 * Copyright (c) 1985, Digital Equipment Corporation, Maynard, Mass.
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
 *    File Name:	ls6.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * This file contains the
 * functions that perform allophonic
 * transformations. The stress has been
 * set already by the "stress" pass.
 *
 ***********************************************************************
 *    Revision History:
 * 01 21-Feb-85	DGC	Added arguments to "allo1" for compounds.
 *			The "allo2" pass is done full word because
 *			it does not need to be broken up.
 * 02 22-Feb-85 DGC	Made everything that deals with the [M]
 *			phoneme go away.
 * 03 05-Apr-85 DGC	Changed [|z] to [xz] in plurals (allo1).
 *			Changed [|d] to [xd] in plurals (allo1).
 * 04 08-Apr-85 DGC	Added code that blocks reduction if the
 *			PFBLOCK is set at the start of the sylable.
 *			Conditional code in "ls5.c" asks for this
 *			bit to be set.
 * 05 10-May-85 DGC	Undid 03.
 * 06 29-May-85 DGC	Kludge around a bug in the compiler.
 *			If you have a long block of "&&" operators in
 *			an "if", with imbedded assignments, then
 *			the expression gets reordered badly, and the
 *			"=" gets pulled ahead in the "if" to a
 *			wrong place. The fix is to rewrite the chain
 *			as many "if" statements.
 * 07 18-Sep-85 DGC	Stylistic changes suggested by "lint".
 * 08 13-Jul-95 GL      Remove the delete geminate pair code.
 *                      do it now in ls4.c and ls4_acna.c
 *                      search 7/13/95 for inline comment
 * 09 23-Oct-96 GL      remove the unused index mark handling code.
 */

#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include	"lsdef.h"
#include	"lsconst.h"

/*
 * This allophonic pass runs
 * before sylabification and stress. Its
 * most important job is to finish up the code
 * for plurals and the "-ed" suffix. This code
 * must run before the sylables are done as
 * it may add vowels.
 */

void allo1(fpp, lpp)
PHONE	*fpp;
PHONE	*lpp;
{
	 PHONE	*pp1;
	 PHONE	*pp2;
	 int	i;

	pp1 = fpp;				/* Left end.		*/
	while (pp1 != lpp) {			/* Until right end.	*/
		/*
		 * [z] > [|][z] / [+Cons,+Sib] + - #
		 * [z] > [s]    / [+Cons,-Voice] + - #
		 */
		if (pp1->p_sphone == Z		/* Phoneme is "z"	*/
		&& (pp1->p_flag&PFMORPH) != 0	/* at left end of morph	*/
		&& pp1->p_fp == lpp		/* and right is "#"	*/
		&& pp1 != fpp) {		/* and stuff on left.	*/
			pp2 = pp1->p_bp;
			i = pfeat[pp2->p_sphone];
			if ((i&(PCONS|PSIB)) == (PCONS|PSIB)) {
				if (insphone(pp1, IX, SIL, SUN) == FALSE)
					return;
				pp1 = pp1->p_fp;
				continue;
			}
			if ((i&(PCONS|PVOICE)) == PCONS) {
				pp1->p_sphone = S;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/*
		 * [d] > [|][d] / {[t],[d]} + - #
		 * [d] > [t]    / [+Cons,-Voice] + - #
		 */
		if (pp1->p_sphone == D		/* Phoneme is "d"	*/
		&& (pp1->p_flag&PFMORPH) != 0	/* at left end of morph	*/
		&& pp1->p_fp == lpp		/* and right is "#"	*/
		&& pp1 != fpp) {		/* and stuff on left.	*/
			pp2 = pp1->p_bp;
			i = pp2->p_sphone;
			if (i==T || i==D) {
				if (insphone(pp1, IX, SIL, SUN) == FALSE)
					return;
				pp1 = pp1->p_fp;
				continue;
			}
			if ((pfeat[i]&(PCONS|PVOICE)) == PCONS) {
				pp1->p_sphone = T;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		pp1 = pp1->p_fp;
	}
}

/*
 * This allophonic pass runs at
 * the very end of everything. It performs
 * some well known allophonic rules, to improve
 * the phoneme stream. Mostly ad hoc, but the
 * rules it implements are well known to those
 * familiar with the art.
 */
void allo2()
{
	 PHONE	*pp1;
	 PHONE	*pp2;
	 PHONE	*pp3;
	 PHONE	*pp4;
	 int	ph1;
//	 int	ph2;
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
#ifdef	vms
	if (bflag == FALSE) {
#endif

	sthis = SNONE;
	fthis = 0;
	pp1 = phead.p_fp;

	while (pp1 != &phead) {
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

#ifdef	vms
	}
#endif
	/*
	 * Main allophonic sweep.
	 */

	pp1 = phead.p_fp;

	phead.p_sphone = SIL;			/* Make this look like	*/
	phead.p_uphone = SIL;			/* silence, morpheme	*/
	phead.p_flag = PFMORPH;			/* boundry.		*/
	sthis = SNONE;
	sleft = SNONE;
	pp1 = phead.p_fp;
	while (pp1 != &phead) {
		ph1 = pp1->p_sphone;
		if ((pp1->p_flag&PFSYLAB) != 0) {
			sleft = sthis;
			sthis = pp1->p_stress;
		}
		/*
		 * [x][l] => [L] / - +, [-Stress]
		 * [|][l] => [L] / - +, [-Stress]
		 */
		if (sthis==SUN && (ph1==AX || ph1==IX)) {
			pp2 = pp1->p_fp;
			if (pp2->p_sphone == LL
			&& (pp2->p_flag&PFSYLAB) == 0
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) {
				delphone(pp2);
				pp1->p_sphone = EL;
				pp1 = pp1->p_fp;
				continue;
			}
		}

		/*
		 * [l] => [L] / [+Obs] - +, [-Stress]
		 * [r] => [R] / [+Obs] - +, [-Stress]
		 */

		if (sthis != SUN
		&& (ph1==LL || ph1==R)
		&& isobs(pp1->p_bp) != FALSE
		&& (pp1->p_fp->p_flag&PFMORPH) != 0) {
			pp1->p_sphone = RR;
			if (ph1 == LL)
				pp1->p_sphone = EL;
			pp1 = pp1->p_fp;
			continue;
		}
		/*
		 * [x][r] => [R]		(urge)
		 * [x][r][r] => [R]		(berry)
		 * [x][=][r] => [x][=][r]	(around)
		 * [x][r][=][r] => [x][=][r]	(arrange)
		 */
		if (ph1 == AX
		&& (pp2=pp1->p_fp)->p_sphone == R
		&& (pp2->p_flag&PFSYLAB) == 0)
			{
			delphone(pp2);
			if ((pp2=pp1->p_fp)->p_sphone == R)
				{
				if ((pp2->p_flag&PFSYLAB) == 0)
					{
					delphone(pp2);
					pp1->p_sphone = RR;
					}

				} else

					{
					pp1->p_sphone = RR;
					}
				pp1 = pp1->p_fp;
				continue;
			}

		/*
		 * [n] => [n][y] / - [u][L] +
		 */
		/* 06 Hack.						*/
		if (ph1 == N) {
		 if ((pp2=pp1->p_fp)->p_sphone == UW) {
		  if ((pp3=pp2->p_fp)->p_sphone == EL) {
		   if ((pp3->p_fp->p_flag&PFMORPH) != 0) {
			if (insphone(pp2, Y, SIL, SNONE) == FALSE)
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
		if (ph1 == N
		&& ((pp2=pp1->p_fp)->p_sphone==K || pp2->p_sphone==G)
		&& (pp2->p_flag&PFSYLAB) == 0) {
			pp1->p_sphone = NX;
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
		if (ph1==G || ph1==K) {
			if (ph1 == G)		/* [g] => [J]		*/
				ph1 = JH;
			else			/* [k] => [s]		*/
				ph1 = S;
			pp2 = pp1->p_fp;
			if (pp2->p_sphone == AY
			&& (pp2=pp2->p_fp)->p_sphone == Z
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) {
				pp1->p_sphone = ph1;
				pp1 = pp1->p_fp;
				continue;
			} else if (pp2->p_sphone == IX) {
				pp2 = pp2->p_fp;
				if (pp2->p_sphone == D
				&& (pp2->p_fp->p_flag&PFMORPH) != 0) {
					pp1->p_sphone = ph1;
					pp1 = pp1->p_fp;
					continue;
				}
				/* 06 Hack.				*/
				if (pp2->p_sphone == Z) {
				 if ((pp3=pp2->p_fp)->p_sphone == AX) {
				  if ((pp3=pp3->p_fp)->p_sphone == M) {
				   if ((pp3->p_fp->p_flag&PFMORPH) != 0) {
					pp1->p_sphone = ph1;
					pp1 = pp1->p_fp;
					continue;
				   }
				  }
				 }
				}
				/* 06 Hack.				*/
				if (pp2->p_sphone == S) {
				 if ((pp3=pp2->p_fp)->p_sphone == T) {
				  if ((pp3->p_fp->p_flag&PFMORPH) != 0) {
					pp1->p_sphone = ph1;
					pp1 = pp1->p_fp;
					continue;
				  }
				 }
				}
			}
		}
		/*
		 * D rules.
		 */
		if (ph1 == D) {
			/*
			 * [d] => [J] / - [u][l] +
			 * [d] => [J] / - [u][L] +
			 */
			if ((pp2=pp1->p_fp)->p_sphone == UW
			&& ((pp2=pp2->p_fp)->p_sphone == LL
			|| pp2->p_sphone == EL)
			&& (pp2->p_fp->p_flag&PFMORPH) != 0) {
				pp1->p_sphone = JH;
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/*
		 * S rules.
		 */
		if (ph1 == S) {
			/*
			 * [k][s] => [g][z] / [|] - [+Voc,+Stress]
			 */
			if ((pp2=pp1->p_bp)->p_sphone == K
			&& pp2->p_bp->p_sphone == IX
			&& sleft == SUN
			&& isvoc(pp1->p_fp) != FALSE
			&& sthis != SUN) {
				pp2->p_sphone = G;
				pp1->p_sphone = Z;
				continue;
			}
			/*
			 * [s][s] => [S] / - [u] +
			 */
			/* 06 Hack.					*/
			if ((pp2=pp1->p_bp)->p_sphone == S) {
			 if ((pp3=pp1->p_fp)->p_sphone == UW) {
			  if ((pp3->p_fp->p_flag&PFMORPH) != 0) {
				if ((pp2->p_flag&PFSYLAB) != 0)
					return;
				delphone(pp2);
				pp1->p_sphone = SH;
				pp1 = pp1->p_fp;
				continue;
			  }
			 }
			}
			/*
			 * [s][i] => [S] / - [x][s] +
			 */
			/* 06 Hack.					*/
			if ((pp2=pp1->p_fp)->p_sphone == IY) {
			 if ((pp3=pp2->p_fp)->p_sphone == AX) {
			  if ((pp4=pp3->p_fp)->p_sphone == S) {
			   if ((pp4->p_fp->p_flag&PFMORPH) != 0) {
				if ((pp2->p_flag&PFSYLAB) != 0)
					return;
				delphone(pp2);
				pp1->p_sphone = SH;
				pp1 = pp1->p_fp;
				continue;
			   }
			  }
			 }
			}
		}
		/*
		 * T rules.
		 */
		if (ph1 == T) {
			pp2 = pp1->p_fp;
			/*
			 * [t] => [C] / - [u][e][r][i] +
			 * [t] => [C] / - [u][L] +
			 * [t] => [C] / - [u] +
			 */
			if (pp2->p_sphone == UW) {
				pp3 = pp2->p_fp;
				if ((pp3->p_flag&PFMORPH) != 0) {
					pp1->p_sphone = CH;
					pp1 = pp1->p_fp;
					continue;
				}
				/* 06 Hack.				*/
				if (pp3->p_sphone == EL) {
				 if ((pp3->p_fp->p_flag&PFMORPH) != 0) {
					pp1->p_sphone = CH;
					pp1 = pp1->p_fp;
					continue;
				 }
				}
				/* 06 Hack.				*/
				if (pp3->p_sphone == EY) {
				 if ((pp4=pp3->p_fp)->p_sphone == R) {
				  if ((pp4=pp4->p_fp)->p_sphone == IY) {
				   if ((pp4->p_fp->p_flag&PFMORPH) != 0) {
					pp1->p_sphone = CH;
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
			} else if (pp2->p_sphone == IY) {
				pp3 = pp2->p_fp;
				if (pp3->p_sphone == AX
				&& (pp3->p_fp->p_flag&PFMORPH) != 0) {
					if ((pp2->p_flag&PFSYLAB) != 0)
						return;
					delphone(pp2);
					pp1->p_sphone = SH;
					pp1 = pp1->p_fp;
					continue;
				}
				/* 06 Hack.				*/
				if (pp3->p_sphone == EY) {
				 if ((pp4=pp3->p_fp)->p_sphone == T) {
				  if ((pp4=pp4->p_fp)->p_sphone == RR) {
				   if ((pp4->p_fp->p_flag&PFMORPH) != 0) {
					pp1->p_sphone = SH;
					pp1 = pp1->p_fp;
					continue;
				   }
				  }
				 }
				}
			}
		}
		pp1 = pp1->p_fp;
	}

#ifdef DONT_REMOVE
/* 7/13/95 GL. do delete geminate pair in ls4.c between syllable() and stress() */

	/*
	 * Finally, delete geminate
	 * pairs. There are some special pairs
 	 * (like [l] and [L]) that get deleted even if
	 * there is a morpheme boundry between them. This
	 * rule may be backwards; all pairs may delete
	 * across the boundry except stops (mid-day).
	 * The header block has "p_sphone" set to "SIL",
	 * so the first phoneme works fine.
	 */
	pp1 = phead.p_fp;
	while (pp1 != &phead) {
		ph1 = pp1->p_sphone;
		ph2 = pp1->p_bp->p_sphone;
		/* Delete [l][L] and [L][l], preserving the [L].	*/
		if ((ph1==LL && ph2==EL) || (ph1==EL && ph1==LL)) {
			delgemphone(pp1, EL);
			pp1 = pp1->p_fp;
			continue;
		}
		/* Block these rules if cross morpheme mark.		*/
		if ((pp1->p_flag&PFMORPH) == 0) {
			/* Delete [t][T] and [T][t], preserve the [T]	*/
			if ((ph1==T && ph2==TH) || (ph1==TH && ph2==T)) {
				delgemphone(pp1, TH);
				pp1 = pp1->p_fp;
				continue;
			}
			/* Delete [s][S] and [S][s], preserve the [S]	*/
			if ((ph1==S && ph2==SH) || (ph1==SH && ph2==S)) {
				delgemphone(pp1, SH);
				pp1 = pp1->p_fp;
				continue;
			}
			/* Delete plain old pairs of [+Cons] things.	*/
			if (ph1==ph2 && iscons(pp1)!=FALSE) {
				delgemphone(pp1, pp1->p_sphone);
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/* No deletion, just move forward one phoneme		*/
		pp1 = pp1->p_fp;
	}
#endif
}

/*
 * Do all of the dirty work for the
 * deletion of a geminate pair. The "pp" points
 * to the second element of the pair. The "ph" is
 * what the final phoneme will be. Handles all of the
 * details of flag and stress update, then it
 * deletes the first one.
 */
delgemphone(pp, ph)
 PHONE	*pp;
int ph;
{
	 PHONE	*bp;

	bp = pp->p_bp;				/* Point at first.	*/
	pp->p_sphone = ph;			/* Zap phoneme.		*/
	pp->p_flag |= bp->p_flag;		/* Move flags forward.	*/
	if (bp->p_stress > pp->p_stress)	/* Keep strongest.	*/
		pp->p_stress = bp->p_stress;
	delphone(bp);				/* Delete first one.	*/ 
	return (0);
}

isobs(pp)
 PHONE	*pp;
{
	if ((pfeat[pp->p_sphone]&POBS) != 0)
		return (TRUE);
	return (FALSE);
}

/*
 * Insert a new phoneme into the
 * PHONE chain, immediately before the PHONE
 * node pointed to by "fpp". The "sph" and "uph"
 * set the stressed and unstressed phoneme code fields
 * of the node. The flags are moved ahead. The stress
 * is set to "stress". The index chain is cleared.
 * Return TRUE if successful; FALSE if a new node is
 * unavailable.
 */
insphone(fpp, sph, uph, stress)
 PHONE	*fpp;
int sph,uph,stress;
{
	 PHONE	*ipp;
	 PHONE	*bpp;

	if ((ipp=palloc()) == (PHONE *)NULL)		/* Get new node		*/
		return (FALSE);
	bpp = fpp->p_bp;			/* Get previous		*/
	bpp->p_fp = ipp;			/* Link in		*/
	ipp->p_fp = fpp;
	fpp->p_bp = ipp;
	ipp->p_bp = bpp;
#ifndef NO_INDEXES
	ipp->p_ip = NULL;			/* No index chain	*/
#endif
	ipp->p_sphone = sph;			/* Phonemes		*/
	ipp->p_uphone = uph;
	ipp->p_flag = fpp->p_flag;		/* Move flags forward	*/
	fpp->p_flag = 0;
	ipp->p_stress = stress;			/* Set stress		*/
	fpp->p_stress = SNONE;
	return (TRUE);
}

/*
 * Delete the PHONE pointed to
 * by "dpp" from the PHONE chain. Any index
 * marks attached to the deleted phoneme are added
 * to the end of the index chain of the phoneme that
 * preceeds the deleted phoneme; this makes the
 * index marks come out in the right order.
 */
delphone(dpp)
 PHONE	*dpp;
{
	 PHONE	*bpp;
	 PHONE	*fpp;

	bpp = dpp->p_bp;			/* Get previous, next	*/
	fpp = dpp->p_fp;
	bpp->p_fp = fpp;			/* Break links		*/
	fpp->p_bp = bpp;
/* GL 10/23/1996, remove the inused index handling code */
#if 0
	if (dpp->p_ip != NULL) {		/* Update index marks	*/
		while (bpp->p_ip != NULL)
			bpp = bpp->p_ip;
		bpp->p_ip = dpp->p_ip;
	}
#endif
	pfree(dpp);				/* Free the node	*/
	return (0);
}

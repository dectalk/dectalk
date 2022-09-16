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
 *    File Name:	ls5.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Sylabification and
 * stress analysis. The sylabification
 * code runs first; the pointers into the
 * phoneme chain get stored in the "SYL"
 * array. The stress pass runs second, and
 * uses information created by "stress"
 * to make decisions.
 *
 ***********************************************************************
 *    Revision History:
 * 01 21-Feb-85	DGC	Added arguments to "stress" and "sylables"
 *			so you can do compounds.
 * 02 22-Feb-85 DGC	Made everything that dealt with the [M]
 *			phoneme go away.
 * 03 06-Mar-85 DGC	Secondary stresses can now be put onto
 *			stress refusing prefixes. Checking for stress
 *			refusing prefixes broke more words than it
 *			fixed.
 * 04 08-Apr-85 DGC	Added the "#if TONY" stuff, reduction block.
 * 05 16-Apr-85 DGC	Changes to the table of stress refusing
 *			prefixes.
 * 06 19-Apr-85 DGC	Removed "out" and "per" from the table
 *			of prefixes.
 * 07 25-Apr-85 DGC	When [xn] is found as a sylable in word
 *			initial position, change it to [^n]. This makes
 *			negative things sound better.
 * 08 15-May-85 DGC	Additions to above. The [^n] isn't quite right.
 *			Make it primary stressed as well.
 * 09 10-Jun-85 DGC	Made all the "#if TONY" stuff the only choice.
 *			Added the "camera" rule (see notebook); the old
 *			"secondary" routine renamed "finalfixes",
 *			because this is what it was really doing.
 * 10 29-Aug-85 DGC	Try something. Conditionalized on the DGC flag.
 *			We used to kill off reduction blocks on words
 *			like "camera". Allow a trailing [z] too.
 * 11 18-Sep-85 DGC	Sytlistic changes suggested by "lint".
 */

#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include	"lsacna.h"

#include	"lsdef.h"
#include	"lsconst.h"

#define	ILLEGAL	0			/* Illegal cluster		*/
#define	OK			1 			/* Ok cluster			*/
#define	TRYS		2 			/* Try for "s" or "S" on left	*/

#define	DGC		1			/* Try stuff.			*/

/*
 * Global variables.
 * Used by all of the subfunctions
 * in the stress analysys code.
 * Might be overlayable with other data
 * in LTS if space got tight.
 */

PHONE	*sylp[NSYL];			/* Sylable directory.		*/
short	nsyl;						/* # of sylables.		*/
short	rsyl;						/* # of sylables in root form.	*/
short	psyl;						/* Primary stress sylable.	*/

/*
 * Scan the PHONE chain from
 * right to left, marking the positions
 * of the sylables. Drag the stress from an
 * affix to the start of the sylable. No
 * errors are possible.
 */

sylables(fpp, lpp)
PHONE	*fpp;
PHONE	*lpp;
{
	 PHONE	*pp1;
	 PHONE	*pp2;
	 PHONE	*lsp;
	 int	type;
	 int	stype;

	lsp = NULL;				/* Last sylable pointer	*/
	pp1 = fpp;				/* Start of word.	*/
	while (pp1 != lpp) {
		if ((pp1->p_flag&PFSYLAB) != 0) {
			lsp = pp1;
			break;
		}
		pp1 = pp1->p_fp;
	}
	while (pp1 != fpp) {			/* Until start of word.	*/
		stype = SNONE;			/* Not set.		*/
		do {				/* Backup to vowel	*/
			pp2 = pp1->p_bp;
			if (iscons(pp2) == FALSE)
				break;
			pp1 = pp2;
			if (pp1->p_stress != SNONE) {
				stype = pp1->p_stress;
				pp1->p_stress = SNONE;
			}
		} while (pp1 != fpp);
		if (pp1 == fpp) {		/* "gdansk", "gxx"	*/
			if (lsp != NULL) {
				lsp->p_flag &= ~PFSYLAB;
				stype = lsp->p_stress;
				lsp->p_stress = SNONE;
			}
			pp1->p_flag |= PFSYLAB;
			pp1->p_stress = stype;
			break;
		} 
		pp1 = pp1->p_bp;		/* Point at vowel	*/
		pp1->p_flag |= PFLEFTC;		/* In left cluster.	*/
		if (pp1->p_stress != SNONE) {
			stype = pp1->p_stress;
			pp1->p_stress = SNONE;
		}
		if ((pp1->p_flag&PFMORPH) != 0	/* Explicit morpheme	*/
		|| pp1 == fpp			/* or start of word	*/
		|| iscons(pp2=pp1->p_bp) == FALSE)
			goto out;
		pp1 = pp2;			/* One consonant	*/

		pp1->p_flag |= PFLEFTC;		/* In left cluster.	*/
		if (pp1->p_stress != SNONE) {
			stype = pp1->p_stress;
			pp1->p_stress = SNONE;
		}
		if ((pp1->p_flag&PFMORPH) != 0	/* Explicit morpheme	*/
		|| pp1 == fpp			/* or start of word.	*/
		|| iscons(pp2=pp1->p_bp) == FALSE)
			goto out;
		type = cluster(pp2->p_sphone, pp1->p_sphone);
		if (type == ILLEGAL)		/* Not allowed		*/
			{
			goto out;
			}
		pp1 = pp2;			/* Two consonants	*/

		pp1->p_flag |= PFLEFTC;		/* In left cluster.	*/
		if (pp1->p_stress != SNONE) {
			stype = pp1->p_stress;
			pp1->p_stress = SNONE;
		}
		if (type == TRYS		/* If "s" or "S" good	*/
		&& (pp1->p_flag&PFMORPH) == 0	/* check for it.	*/
		&& pp1 != fpp
		&& ((pp2=pp1->p_bp)->p_sphone==S || pp2->p_sphone==SH)) {
			pp1 = pp2;		/* Include it.		*/
			pp1->p_flag |= PFLEFTC;
			if (pp1->p_stress != SNONE) {
				stype = pp1->p_stress;
				pp1->p_stress = SNONE;
			}
		}
	out:

		pp1->p_flag |= PFSYLAB;		/* Mark sylable		*/
		pp1->p_stress = stype;		/* (may set stress)	*/
		lsp = pp1;			/* Remember last one	*/
	}
	return (0);
}

iscons(pp)
 PHONE	*pp;
{
	if ((pfeat[pp->p_sphone]&PCONS) != 0)
		return (TRUE);
	return (FALSE);
}

isvoc(pp)
 PHONE	*pp;
{
	if ((pfeat[pp->p_sphone]&PVOC) != 0)
		return (TRUE);
	return (FALSE);
}

/*
 * Clustering checks for initial
 * sylables. This might be changed to be done
 * with a table, although code group space is a
 * little bit cheaper than data group space. The
 * "f" and "s" arguments are the first and the
 * second phonemes in the cluster. Return 
 * OK (good cluster), TRYS (good cluster, and
 * an [s] or [S] could be merged into it)
 * or ILLEGAL (bad cluster).
 */
cluster(f, s)
 int	f;
 int	s;
{
	switch (f) {
	case P:
		if (s==LL || s==R)
			return (TRYS);
		break;

	case B:
		if (s==LL || s==R)
			return (OK);
		break;

	case F:
		if (s ==R)
			return (TRYS);
		if (s ==LL)
			return (OK);
		break;

	case T:
		if (s ==R)
			return (TRYS);
		if (s ==W)
			return (OK);
		break;

	case D:
	case TH:
		if (s==W || s==R)
			return (OK);
		break;

	case K:
		if (s==W || s==LL || s==R)
			return (TRYS);
		break;

	case G:
		if (s==W || s==LL || s==R)
			return (OK);
		break;

	case S:
		if (s==W || s==LL || s==P || s==T || s==K
		||  s==M || s==N  || s==F)
			return (OK);
		break;

	case SH:
		if (s==W || s==LL || s==R || s==P || s==T
		||  s==M || s==N)
			return (OK);
	}
	return (ILLEGAL);
}

/*
 * This is the driving function of
 * stress analysis. What it does is described in
 * gory detail in the DECtalk III development notebooks.
 * You probably should not even try to change anything until
 * you have read that stuff, and you understand it all.
 * This level is mostly just a lot of calls to the
 * subfunctions that do the work.
 */

void stress(fpp, lpp, pstype, sel_lang)
PHONE	*fpp;
PHONE	*lpp;
int pstype;
{
	 int	csyl;
	 int	type;
	 int	isreduced;

	if (suffixscan(fpp, lpp) == FALSE) 		return;
	if (prefixscan(fpp, lpp, sel_lang) == FALSE) 		return;

	/*
	 * PRG	23-NOV-1988
	 * BEGINNING OF MODIFICATION - this code segment looks at the
	 * language tag associated with the word being analyzed and
	 * dispatches the word out to different analysis routines for
	 * languages other than English.  English words are processed
	 * as words always have been.
	 */

	if (sel_lang != NAME_ENGLISH && sel_lang != NAME_IRISH)
	   {
	   /*
	    * Stress placed on the word by English rules (which are the
	    * default rules) must be removed.
	    */


	   for (csyl=0; csyl<nsyl; csyl++)
	      sylp[csyl]->p_stress = SUN;

	   /*
	    * Execute language specific analysis.
	    */

	   switch (sel_lang)
	      {
	      case NAME_FRENCH :
		 		stress_fr (fpp, lpp, pstype);
		 		return;

	      case NAME_GERMANIC :
		 		stress_ge (fpp, lpp, pstype);
		 		return;

	      case NAME_ITALIAN :
		 		stress_it (fpp, lpp, pstype);
		 		return;

	      case NAME_JAPANESE :
			 	stress_ja (fpp, lpp, pstype);
		 		return;

	      case NAME_SPANISH :
				stress_sp (fpp, lpp, pstype);
		 		return;

	      case NAME_SLAVIC :
				stress_sl (fpp, lpp, pstype);
		 		return;
	      };
	   }

	/*
	 * END OF MODIFICATION.
	 */


	/* Suffix is providing primary stress placement information.	*/
	/* Place it. Shift left if impossible. Let prefix flags and bad	*/
	/* vowels push it back toward the suffix.			*/

	if (psyl >= 0) {
		type = sylp[psyl]->p_stress;
		if (type==S1LEFT || type==S2LEFT) {
			if (psyl != 0) {
				sylp[psyl]->p_stress = SUN;
				--psyl;
				if (type==S2LEFT && psyl!=0) {
					sylp[psyl]->p_stress = SUN;
					--psyl;
				}
			}
		}
		while (psyl!=0 && unstressed(psyl)!=FALSE) {
			--psyl;
		}
		while (psyl<nsyl-1 && (sylp[psyl]->p_flag&PFRFUSE)!=0) {
			++psyl;
		}
		while (psyl<nsyl-1 && unstressed(psyl)!=FALSE) {
			++psyl;
		}
		sylp[psyl]->p_stress = pstype;
		csyl = psyl+1;
		isreduced = TRUE;
		while (csyl < nsyl) {
			if (isreduced == FALSE) {
				if (sylp[csyl]->p_stress == SNONE)
					sylp[csyl]->p_flag |= PFBLOCK;
				isreduced = TRUE;
			} else
				isreduced = FALSE;
			if (sylp[csyl]->p_stress == SNONE)
				sylp[csyl]->p_stress = SUN;
			++csyl;
		}
		finalfixes();
		return;
	}
	/* No suffix, but prefix is refusing the stress.		*/
	if ((sylp[0]->p_flag&PFRFUSE) != 0) {
		psyl = 0;
#ifdef	vms
		if (rflag != FALSE)
			printf("Begin at sylable 1\n");
#endif
		while (psyl<nsyl-1 && (sylp[psyl]->p_flag&PFRFUSE)!=0) {
			++psyl;
#ifdef	vms
			if (rflag != FALSE)
				printf("Prefix, shift right\n");
#endif
		}
		while (psyl<nsyl-1 && unstressed(psyl)!=FALSE) {
			++psyl;
#ifdef	vms
			if (rflag != FALSE)
				printf("Impossible, shift right\n");
#endif
		}
#ifdef	vms
		if (rflag != FALSE)
			printf("Primary on sylable %d\n", psyl+1);
#endif
		sylp[psyl]->p_stress = pstype;
		csyl = psyl+1;
		isreduced = TRUE;
		while (csyl < nsyl) {
			if (isreduced == FALSE) {
				if (sylp[csyl]->p_stress == SNONE)
					sylp[csyl]->p_flag |= PFBLOCK;
				isreduced = TRUE;
			} else
				isreduced = FALSE;
			if (sylp[csyl]->p_stress == SNONE)
				sylp[csyl]->p_stress = SUN;
			++csyl;
		}
		finalfixes();
		return;
	}
	/* Revert to default rules. No or all refusing suffix.		*/
	bestdefault();
#ifdef	vms
	if (rflag != FALSE)
		printf("Best default on sylable %d\n", psyl+1);
#endif
	sylp[psyl]->p_stress = pstype;
	csyl = psyl+1;
	isreduced = TRUE;
	while (csyl < nsyl) {
		if (isreduced == FALSE) {
			if (sylp[csyl]->p_stress == SNONE)
				sylp[csyl]->p_flag |= PFBLOCK;
			isreduced = TRUE;
		} else
			isreduced = FALSE;
		if (sylp[csyl]->p_stress == SNONE)
			sylp[csyl]->p_stress = SUN;
		++csyl;
	}
	finalfixes();
}


/*
 * Return TRUE if sylable "n"
 * cannot possibly take primary stress.
 * We only know about [L].
 */
unstressed(n)
 int	n;
{
	 PHONE	*pp;
	 int	sphone;

	pp = sylp[n];
	while (iscons(pp) != FALSE)
		pp = pp->p_fp;
	sphone = pp->p_sphone;
	if (sphone ==EL)
		return (TRUE);
	return (FALSE);
}

/*
 * Scan the word left to right.
 * Count the number of sylables ("nsyl") and store
 * pointers to the starts of the sylables in the "sylp"
 * array. Count the number of sylables in the root form
 * ("rsyl") and note the sylable that forces the
 * primary stress ("psyl"). Return TRUE on success and
 * FALSE if there are too many sylables.
 */
suffixscan(fpp, lpp)
PHONE	*fpp;
PHONE	*lpp;
{
	 PHONE	*pp;

	nsyl =  0;
	rsyl = -1;
	psyl = -1;
	pp = fpp;
	while (pp != lpp) {
		if ((pp->p_flag&PFSYLAB) != 0) {
			if (nsyl >= NSYL)
				return (FALSE);
			if (pp->p_stress != SNONE) {
				if (rsyl < 0)
					rsyl = nsyl;
				if (psyl<0 && pp->p_stress>=SPRI)
					psyl = nsyl;
			}
			sylp[nsyl++] = pp;
		}
		pp = pp->p_fp;
	}
	if (rsyl < 0)
		rsyl = nsyl;
	return (TRUE);
}

#ifdef ACNA
/*
 * PRG	23-NOV-1988
 * MODIFICATION has been made to the following table of stress-refusing
 * prefixes.  I stole a bit from what used to be the length field (since
 * there are no prefixes more than 7 phonemes long, so far).  This bit
 * is set if the prefix is an Irish-specific stress-refusing prefix.
 * See prefixscan() for other half of modification.
 *
 * NOTE:  Tony might decide in the near future to back all these modifications
 * out of this code.
 *
 * PRG	15-DEC-1988
 * MODIFICATION has been made to the following table of stress-refusing
 * prefixes.  I returned the bit that I stole earlier for identifying
 * IRISH names.  Instead I am going to add a byte after the prefix list
 * to identify the language group which the prefix is supposed to refuse
 * -1 is reserved for English words which aren't names.
 */

#define	PLENGTH	0x0F			/* Length, in phonemes.		*/
#define	PCONT	0x10			/* Continue.			*/
#define	PRCON	0x20			/* Require a consonant.		*/
#define	PRVOC	0x40			/* Require a vowel.		*/
#define	P2SYL	0x80			/* Destress two sylables.	*/


const char	preftab[] = {
	-1,		2,		AA,	B,
	-1,		4+PCONT+P2SYL,	AH,	N,	D,	RR,
	-1,		2+PCONT,	AX,	N,
	-1,		3,		B,	AY,	D,
	-1,		3,		B,	AY,	F,
	-1,		3,		B,	AY,	K,
	-1,		3,		B,	AY,	LL,
	-1,		3,		B,	AY,	N,
	-1,		3,		B,	AY,	P,
	-1,		3,		B,	AY,	R,
	-1,		3,		B,	AY,	S,
	-1,		2+PRCON,	B,	EH,
	-1,		2+PRCON,	B,	IY,
	-1,		2+PRCON,	D,	EH,
	-1,		3+PCONT,	D,	IH,	S,
	-1,		2+PRCON,	D,	IH,
	-1,		4,		D,	IX,	M,	EH,
	-1,		4,		D,	IX,	M,	IH,
	-1,		3,		D,	IX,	P,
	-1,		3,		D,	IX,	R,
	-1,		3,		D,	IX,	V,
	-1,		2+PRCON,	D,	IY,	
	-1,		2,		EH,	K,
	-1,		2,		EH,	M,
	-1,		2,		EH,	N,
	-1,		2,		EH,	R,
	-1,		3,		F,	AO,	R,
	NAME_IRISH,	4,		F,	IH,	T,	S,
	-1,		3,		K,	AA,	LL,
	-1,		3,		K,	AA,	M,
	-1,		3,		K,	AA,	N,
	-1,		3,		K,	AO,	R,
	-1,		4+PCONT+P2SYL,	IH,	N,	T,	RR,
	-1,		2+PCONT,	IH,	N,
	NAME_IRISH,	3,		M,	IX,	K,
	-1,		3+PCONT,	M,	IH,	S,
	-1,		3+PCONT,	N,	AA,	N,
	NAME_IRISH,	1,		OW,
	-1,		3+PCONT+P2SYL,	OW,	V,	RR,
	-1,		3,		P,	R,	AA,
	-1,		3,		P,	R,	IY,
	-1,		2+PCONT+PRCON,	R,	EH,
	-1,		3,		S,	AH,	P,
	-1,		3,		S,	AH,	S,
	-1,		5,		T,	R,	AE,	N,	S,
	-1,		3,		W,	IH,	TH,
	-1,		0
};
#endif

/*
 * Scan the word left to right,
 * setting the "PFRFUSE" flags in sylables
 * that are stress refusing prefixes. Return TRUE
 * if all works out well; FALSE on errors. The
 * "P2SYL" flag in the table determines if 1 or
 * 2 sylables are hacked.
 */

int prefixscan(struct PHONE_T *fpp,struct PHONE_T *lpp,short lang_tag)
{

	 PHONE	*pp1;
	 PHONE	*pp2;
	 int	i;
	 int	len;
	 int	csyl;
	char	*ptp;

	pp1  = fpp;				/* Start of the word.	*/
	csyl = 0;				/* Sylable count.	*/
loop:
	if (csyl >= nsyl-1)			/* No sylables.		*/
		return (TRUE);
	ptp = &preftab[0];
	while ((len = ptp[1]&PLENGTH) != 0) {
#ifdef ACNA
		/*
		 * PRG	23-NOV-1988
		 * BEGINNING OF MODIFICATION - skip the prefix if it is
		 * marked IRISH and the scan is not being done for an
		 * IRISH word (i.e. the IRISH flag is not set).
		 *
		 * PRG	15-DEC-1988
		 * Modified the following to handle arbitrary names, not
		 * just IRISH ones.
		 */
	if (ptp[0]!=-1)
	{
		if (ptp[0] != lang_tag)
		   {
		   ptp += len+2;
		   continue;
		   }
	}

		/*
		 * END OF MODIFICATION.
		 */
#endif
		pp2 = pp1;
		for (i=0; i<len; ++i) {		/* Compare loop.	*/
			if (pp2==lpp || pp2->p_sphone!=ptp[i+2])
				break;
			pp2 = pp2->p_fp;
		}
		if (i != len) {			/* Failed.		*/
			ptp += len+2;
			continue;
		}
		/* The "pp2" is pointing beyond the match. You cannot	*/
		/* bite off a prefix and create an illegal cluster at	*/
		/* the start of the sylable. An example of a word that	*/
		/* is blocked by this rule is "rectilinear".		*/
		if (pp2!=lpp && (pp2->p_flag&PFLEFTC)==0) {
			ptp += len+2;
			continue;
		}
		if ((ptp[1]&PRCON)!=0 && (pp2==lpp || iscons(pp2)==FALSE)) {
			ptp += len+2;
			continue;
		}
		if ((ptp[1]&PRVOC)!=0 && (pp2==lpp ||  isvoc(pp2)==FALSE)) {
			ptp += len+2;
			continue;
		}
		sylp[csyl]->p_flag |= PFRFUSE;	/* Mark refuse.		*/
		++csyl;
		if ((ptp[1]&P2SYL) != 0		/* If 2 syl. prefix and	*/
		&& csyl < nsyl-1) {		/* some root remains.	*/
			sylp[csyl]->p_flag |= PFRFUSE;
			++csyl;
		}
		if ((ptp[1]&PCONT) == 0)	/* Stop the scan.	*/
			return (TRUE);
		pp1 = pp2;			/* Advance.		*/
		goto loop;		
	}
	if (csyl >= nsyl-1)			/* No sylables.		*/
		return (TRUE);
	if (pp1 != lpp				/* V-C1-C2 case.	*/
	&& isvoc(pp1) != FALSE
	&& (pp1=pp1->p_fp) != lpp
	&& iscons(pp1) != FALSE
	&& (pp2=pp1->p_fp) != lpp
	&& (pp2->p_flag&PFSYLAB) != 0
	&& pp1->p_sphone == pp2->p_sphone)	
		sylp[csyl]->p_flag |= PFRFUSE;
	return (TRUE);
}

/*
 * Given the number of sylables in the root
 * form ("rsyl") set "psyl" to the sylable number for the
 * best default stress position. One sylable words are trivial.
 * Two sylable words are usually stressed on the first sylable,
 * but there are some exceptions. Three sylable words are
 * handled using the Nessly rule. Long words get penultimate
 * stress.
 */
bestdefault()
{
	switch (rsyl) {
	case 0:					/* Crap.		*/
	case 1:					/* 1 sylables.		*/
		psyl = 0;
		break;

	case 2:					/* 2 sylables.		*/
		best2syl();
		break;

	case 3:					/* 3 sylables.		*/
		psyl = 0;
		if (iscons(sylp[2]->p_bp) != FALSE)
			psyl = 1;
		break;

	default:				/* 4 or more sylables.	*/
		psyl = rsyl-2;
		break;
	}
	return (0);
}

/*
 * Place best default stress for two sylable
 * words. The pointers to the two sylables are always
 * in "sylp[0]" and "sylp[1]". The return value is returned
 * (origin 0) in "psyl".
 */
void best2syl()
{
	 PHONE	*pp;
	 int	ph;

	pp = sylp[0];
	ph = pp->p_sphone;
	/* Never stress [@] if initial sylable, like "abridge".		*/
	if (ph==AE && (pp->p_fp->p_flag&PFSYLAB)!=0) {
		psyl = 1;
		return;
	}
	/* Never stress [@], [E], [I], [^] in initial VCC sylable.	*/
	if (isvoc(pp) != FALSE
	&& iscons(pp->p_fp) != FALSE
	&& iscons(pp->p_fp->p_fp) != FALSE) {
		if (ph==AE || ph==EH || ph==IH || ph==AH) {
			psyl = 1;
			return;
		}		
	}
	/* Best default is stress first sylable.			*/
	psyl = 0;
}

/*
 * The primary stress has been placed. 
 * Now is the time to perform a number of final
 * fixups on the word. Reduction blocks are placed on
 * alternating sylables, starting at the primary stress point
 * and sweeping toward the start of the word. Next [xn] in
 * word initial position is zapped to [^n] and primary stressed.
 * Lastly, if a 3 sylable word ends in [ax], cancel any
 * reduction block on the sylable.
 */
finalfixes()
{
	 PHONE	*pp;
	 int	last;

	last = SPRI;
	while (psyl!=0 && sylp[psyl-1]->p_stress!=SNONE) {
		--psyl;
		last = sylp[psyl]->p_stress;
	}
	while (psyl != 0) {
		--psyl;
		if (last == SUN) {		/* Block reduction.	*/
			if (sylp[psyl]->p_stress == SNONE)
				sylp[psyl]->p_flag |= PFBLOCK;
			last = SSEC;
		} else
			last = SUN;
		if (sylp[psyl]->p_stress == SNONE)
			sylp[psyl]->p_stress = SUN;
	}
	pp = phead.p_fp;			/* [xn] => [^n].	*/
	if (pp->p_sphone ==AX
	&& (pp=pp->p_fp) != &phead
	&&  pp->p_sphone ==N
	&& (pp=pp->p_fp) != &phead
	&& (pp->p_flag&PFSYLAB) != 0) {
		pp = phead.p_fp;
		pp->p_sphone = AH;
		pp->p_uphone = SIL;
		pp->p_stress = SPRI;
	}
	if (nsyl == 3) {			/* "camera" rule.	*/
		pp = phead.p_bp;

#ifdef DGC
		if (pp->p_sphone ==Z)		/* "cameras".		*/
			pp = pp->p_bp;
		if (pp!=&phead && pp->p_sphone==AA && pp->p_uphone==AX)
			sylp[2]->p_flag &= ~PFBLOCK;
#else
		if (pp->p_sphone==AA && pp->p_uphone==AX)
			sylp[2]->p_flag &= ~PFBLOCK;
#endif
	}          
	return (0);
}

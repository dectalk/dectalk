/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1995. All rights reserved.
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
 *    File Name:	ls5_anca.c
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
 *	4-5-1988 	Alpha Field Test Release
 *	6-jul-1988	tml	beta release
 */

#include	"lsacna.h"

#define	ILLEGAL	0			/* Illegal cluster		*/
#define	OK			1					/* Ok cluster			*/
#define	TRYS		2				/* Try for "s" or "S" on left	*/

/*
 * Global variables.
 * Used by all of the subfunctions
 * in the stress analysys code.
 */

extern PHONE	*sylp[NSYL];			/* Sylable directory.		*/
extern short	nsyl;				/* # of sylables.		*/
extern short	rsyl;				/* # of sylables in root form.	*/
extern short	psyl;				/* Primary stress sylable.	*/

/*
 * This is the driving function of
 * stress analysis. What it does is described in
 * gory detail in the DECtalk III development notebooks.
 * You probably should not even try to change anything until
 * you have read that stuff, and you understand it all.
 * This level is mostly just a lot of calls to the
 * subfunctions that do the work.
 *
 * PRG	23-NOV-1988
 * Modified this routine to handle language specific stress analysis. 
 * This includes this routine accepting one more parameter, which is
 * the language tag of the word being analyzed.
 */

void acna_stress(fpp, lpp, pstype, sel_lang)
PHONE	*fpp;
PHONE	*lpp;
int	pstype;
int sel_lang;
{
	int	csyl;
	int	type;
	int	isreduced;

	if (suffixscan (fpp, lpp) == FALSE) return;
	if (acna_prefixscan (fpp, lpp, sel_lang) == FALSE) return;	       

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
#ifdef	vms
		if (rflag != FALSE)
			printf("Suffix forces sylable %d\n", psyl+1);
#endif
		while (psyl!=0 && unstressed(psyl)!=FALSE) {
			--psyl;
#ifdef	vms
			if (rflag != FALSE)
				printf("Impossible, shift left\n");
#endif
		}
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

char	acna_preftab[] = {
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

/*
 * Scan the word left to right,
 * setting the "PFRFUSE" flags in sylables
 * that are stress refusing prefixes. Return TRUE
 * if all works out well; FALSE on errors. The
 * "P2SYL" flag in the table determines if 1 or
 * 2 sylables are hacked.
 *
 * PRG	23-NOV-1988
 * This routine was modified to handle Irish words as well as English
 * ones.  If the IRISH flag is set coming into the routine, then those
 * prefixes marked IRISH are scanned also.
 *
 * PRG	15-DEC-1988
 * This routine was modified to handle names as well as words (not just
 * IRISH names as had been 23-NOV-1988).
 */
acna_prefixscan(fpp, lpp, lang_tag)
PHONE	*fpp;
PHONE	*lpp;
short lang_tag;
{
	register PHONE	*pp1;
	register PHONE	*pp2;
	register char	*ptp;
	register int	i;
	register int	len;
	register int	csyl;

	pp1  = fpp;				/* Start of the word.	*/
	csyl = 0;				/* Sylable count.	*/
loop:
	if (csyl >= nsyl-1)			/* No sylables.		*/
		return (TRUE);
	ptp = &acna_preftab[0];
	while ((len = ptp[1]&PLENGTH) != 0) {
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

		if (ptp[0] != lang_tag)
		   {
		   ptp += len+2;
		   continue;
		   }

		/*
		 * END OF MODIFICATION.
		 */

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


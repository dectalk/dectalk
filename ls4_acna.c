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
 *    File Name:	ls4_anca.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * The functions in this file
 * make up the heart of the letter to
 * sound system. They handle all of
 * the rule matching.
 *
 ***********************************************************************
 *    Revision History:
 *	4-5-1988 		Alpha Field Test Release
 *	6-jul-1988	tml	beta release
 *	18-NOV-1988	PRG	ACNA support modifications
 *	13-Jul-1995	GL	fix ACNA problem found by customer
 *				search 7/13/95 for inline comment
 *  22-Oct-96   GL  remove unused index mark handling code.
 *  01-Nov-96 	GL	add ls_fold[] character folding to handle the multi-national
 *					character.  This implementation need to remove once we have
 *					add rule to handle these characters.	
 *  06-Nov-96	GL	Use IS_ALPHA() to check for the alphabet
 */

#include	"lsacna.h"

/*
 * Each entry in the rule dictionary
 * is (at least) 4 words long. Entry 0 is the
 * index to the grapheme part. Entry 1 is the
 * index to the replacement. Entry 2 is the left
 * environment. Entry 3 is the right environment. If
 * this code is running on the VAX, then there are
 * two extra words. Entry 4 is the line number in
 * the rule file of the rule. Entry 5 is the count
 * of rule usage. The table builder (lsmktab)
 * puts out the words if asked to generate MACRO,
 * which is a good hint this is the VAX.
 */

#define	ACNA_LSBUMP	5					/* 6 word entries		*/
extern char	far acna_lsbtab[];			/* Tables			*/
extern short far acna_lswtab[];

#define	wtab(n)		(acna_lswtab[(n)]&0xFFFF)
#define	btabb(n)	(acna_lsbtab[(n)]&0xFF)
#define	btabw(n)	(((acna_lsbtab[(n)+1]&0xFF)<<8)|(acna_lsbtab[(n)]&0xFF))


typedef	struct	GRAPH_struct {
	short	g_graph;		/* Grapheme code		*/
	short	g_feats;		/* Set of features		*/
	PHONE	*g_ip;			/* List of index nodes		*/
}	GRAPH;


extern	P_PIPE	kinp;			/* Pipe to Klatt synthesizer	*/

extern short	rpart;									/* Rule: replacement		*/
extern short	rline;									/* Rule: line			*/
extern PHONE	*pflp;									/* Free list of "PHONE" nodes	*/
extern GRAPH	graph[NGWORD];							/* Array of encoded graphemes	*/
extern	GRAPH	*acna_rulematch();		/* Match a rule			*/
extern	GRAPH	*acna_envmatch();			/* Match an environment		*/


/*
 * This is the main driving routine
 * for Tony's letter to sound. It is called
 * by "ls1d.c" with two pointers; these bracket the
 * text to be spoken. This routine makes a private copy
 * of the text, with the ASCII characters converted to
 * G-codes and the index lists. The index lists are
 * kept in normal order. A private array is
 * used, so that the caller does not have to deal
 * with the fact that the word might expand, and walk
 * over the right punctuation.
 *
 * PRG	18-NOV-1988
 * Modified routine to accept default and selected languages to be used
 * in determining which rules will be matched against from the LTS-rule
 * set.
 */

acna_lts(llp, rlp, def_lang, sel_lang)
LETTER	*llp;
LETTER	*rlp;
int def_lang;
int sel_lang;
{
	GRAPH	*gp1;
	GRAPH	*gp2;
	int	lch;
	int	g;
	PHONE	*pp1;
	PHONE	*pp2;
	PHONE	*pp3;
	int	ssflag;
	int	rsflag;
	int	pstype;
	int tmp;

	gp1 = &graph[0];
	while (llp < rlp) {
		/*
		   GL  11/01/1996, add folding table conversion to handle multi-national
		   character
		 */
		/*lch = llp->l_ch;*/		/* Convert to G-code	*/
		lch = ls_fold[llp->l_ch];

		gp2 = gp1;
		/* GL 11/06/1996, use IS_ALPHA(c) to check for alphabet */
		if (IS_ALPHA(lch)) {
		/* if (lch>='a' && lch<='z') {*/
			if (addgraph(gp1, lch-'a'+GA) != FALSE)
				++gp1;
		} else if (lch == '\'') {
			if (addgraph(gp1, GQUOTE) != FALSE)
				++gp1;
		}
/* GL 10/23/1996, remove unused index handling code */
#if 0
		pp1 = llp->l_ip;		/* Append index list	*/
		if (pp1 != NULL) {
			pp2 = gp2->g_ip;
			if (pp2 == NULL)
				gp2->g_ip = pp1;
			else {
				while (pp2->p_ip != NULL)
					pp2 = pp2->p_ip;
				pp2->p_ip = pp1;
			}
		}
#endif
		++llp;
	}
	gp1->g_graph = GEOS;			/* End mark		*/
	gp1->g_feats = feats[GEOS];
	gp1->g_ip    = NULL;
	phead.p_fp = &phead;			/* Empty list		*/
	phead.p_bp = &phead;
#ifndef NO_INDEXES
	phead.p_ip = NULL;			/* No index chain	*/
#endif
	ssflag = FALSE;
	while (gp1 != &graph[0]) {
		gp2 = acna_rulematch(gp1, def_lang, sel_lang);

		/*
		 * Collect up all index marks in the
		 * graphemes consumed by the rule that just
		 * matched, and put them in a big left-to-right
		 * list, for future use.
		 */

		pp1 = NULL;
		while (gp1 != gp2) {
			--gp1;
/* GL 10/23/1996, remove unused index handling code */
#if 0
			if ((pp2=gp1->g_ip) != NULL) {
				pp3 = pp2;
				while (pp3->p_ip != NULL)
					pp3 = pp3->p_ip;
				pp3->p_ip = pp1;
				pp1 = pp2;
			}
#endif
		}

		/*btabb stuff here an ugly kludge to solve prob until acna rules recompiled with
			new phoneme definitions all btabb(rpart  replaced with
			bklug(rpart*/
		/* 7/13/95 GL.  we don't need to do this any more.  back to btabb */
		/* (g=bklug(rpart++) != GEOS) is a bug, should be ((g=bklug(rpart++)) != GEOS) */

		if (rpart != 0) {
		   if (btabb(rpart) != GEOS) {
				while ((g=btabb(rpart++)) != GEOS) {
/*
			if ( bklug(rpart) != GEOS) {

				while (g=bklug(rpart++) != GEOS) {
*/

					if (gp1 < &graph[NGWORD-1]
					&& addgraph(gp1, g) != FALSE)
						++gp1;
				}
				gp1->g_graph = GEOS;
				gp1->g_feats = feats[GEOS];
				gp1->g_ip    = NULL;
			} else
				++rpart;
			rsflag = FALSE;		/* Rep. sets stress.	*/

			while ((g=btabb(rpart++)) != SIL) {

				/*
				 * [-], [*], [#] clear out
				 * the "don't screw with the stress
				 * flags". The [+] and [=] do not.
				 */

				if (g == DASH) {
					if ((pp2=phead.p_fp) != &phead)
						pp2->p_flag |= PFDASH;
					ssflag = FALSE;
					rsflag = FALSE;
				} else if (g == STAR) {
					if ((pp2=phead.p_fp) != &phead)
						pp2->p_flag |= PFSTAR;
					ssflag = FALSE;
					rsflag = FALSE;
				} else if (g == HASH) {
					if ((pp2=phead.p_fp) != &phead)
						pp2->p_flag |= PFHASH;
					ssflag = FALSE;
					rsflag = FALSE;
				} else if (g == PLUS) {
					if ((pp2=phead.p_fp) != &phead)
						pp2->p_flag |= PFPLUS;
				} else if (g == EQUAL) {
					if (ssflag == FALSE
					&& (pp2=phead.p_fp) != &phead)
						pp2->p_flag |= PFSYLAB;
				} else if (g>=SNONE && g<=S2LEFT) {
					if (g != SUN)
						rsflag = TRUE;
					if (ssflag == FALSE
					&& (pp2=phead.p_fp) != &phead)
						pp2->p_stress = g;
				} else if ((g&TWOPH) != 0)
					{
					tmp=g&MSKPH;

					addphone(g&MSKPH, btabb(rpart++));
					}
				else
					{
					addphone(g, SIL);
					}
/* GL 10/23/1996, remove unused index handling code */
#if 0
				if (pp1 != NULL) {
					phead.p_fp->p_ip = pp1;
					pp1 = NULL;
				}
#endif
			}
			if (rsflag != FALSE)
				ssflag = TRUE;
		}

		/*
		 * This code handles the unusual case
		 * of index marks on graphemes that have no
		 * corresponding phonemes (like the silent
		 * "e" on the end of a word).
		 */
/* GL 10/23/1996, remove unused index handling code */
#if 0
		if (pp1 != NULL) {
			pp2 = phead.p_fp;
			pp3 = pp2->p_ip;
			pp2->p_ip = pp1;
			while (pp1->p_ip != NULL)
				pp1 = pp1->p_ip;
			pp1->p_ip = pp3;
		}
#endif
	}

        pp1 = phead.p_fp;
	while (pp1 != &phead) {
		pp2 = pp1;
		pp3 = pp2->p_fp;
		while (pp3!=&phead && (pp3->p_flag&PFBOUND)==0)
			pp3 = pp3->p_fp;
		allo1(pp2, pp3);
		sylables(pp2, pp3);
		pp1 = pp3;
	}

	delete_geminate_pairs ();
	pstype = SPRI;				/* Use primary stress.	*/
	pp1 = phead.p_fp;
	while (pp1 != &phead) {
		pp2 = pp1;			/* Find end of chunk.	*/
		pp3 = pp2->p_fp;
		while (pp3!=&phead && (pp3->p_flag&PFBOUND)==0)
			pp3 = pp3->p_fp;
		acna_stress(pp2, pp3, pstype, sel_lang);	/* Mark stress.	*/
		pstype = SSEC;
		pp1 = pp3;
	}
	allo2();				/* Allophonics, part 2	*/

	return(0);
}


/*
 * Look for a rule that matches
 * the largest block of characters to the
 * left of (no including) the grapheme pointed
 * to by "gp1". This always succeeds, although the
 * default is just "eat a byte". The offset in the
 * "lsbtab" array of the replacement part (or 0)
 * is stored in the external "rpart" as a side
 * effect.
 *
 * PRG	18-NOV-1988
 * Modified the routine to accept two new parameters, the default language
 * group and the selected language group.
 *
 * PRG	18-NOV-1988
 * Modified routine to support new rule format which includes a language
 * tag for each rule.  This tag is for ACNA support.
 */
GRAPH	*
acna_rulematch(gp1, def_lang, sel_lang)
register GRAPH	*gp1;
register int def_lang;
register int sel_lang;
{
	register unsigned int	rulep;
	register unsigned int	xrule;
	register GRAPH	*gp2;
	register unsigned int	nrule;
	register unsigned int	g;
   register int	lang;
	register int	specific;

	g = (--gp1)->g_graph;
	rulep = wtab(2*g + 0);			/* Offset to rule	*/
	nrule = wtab(2*g + 1);			/* Number of rules	*/
	rpart = 0;				/* Assume we failed	*/
	while (nrule--) {
		gp2 = gp1;

		/*
		 * PRG	18-NOV-1988
		 * BEGINNING OF MODIFICATION - check to see if the rule's
		 * language tag is equal to either the default or selected
		 * language group.  If so continue the normal process of
		 * matching.  Otherwise, go on to the next rule.
		 */

		lang = wtab (rulep+0);
		specific = lang & M_R_SPECIFIC;
	        lang &= M_R_LANG;
		if (specific && lang != sel_lang)
		   goto fail;
		else if (!specific && lang != def_lang && lang != sel_lang)
		   goto fail;

		/*
		 * END OF MODIFICATION.
		 */

		if ((xrule=wtab(rulep+1)) != 0) {
			while ((g=btabb(xrule++)) != GEOS) {
				if (gp2==&graph[0] || (--gp2)->g_graph!=g)
					goto fail;
			}
		}
		if ((xrule=wtab(rulep+4)) != 0	/* Right environment	*/
		&& acna_envmatch(xrule, gp1, FORW) == NULL)
			goto fail;
		if ((xrule=wtab(rulep+3)) != 0	/* Left environment	*/
		&& acna_envmatch(xrule, gp2, BACK) == NULL)
			goto fail;
#ifdef	vms
		rline = lswtab[rulep+5];	/* Line number of rule.	*/
		++lswtab[rulep+6];		/* Usage count of rule.	*/
#endif
		gp1 = gp2;			/* Move over the match	*/
		rpart = wtab(rulep+2);		/* Replacement		*/
		break;
	fail:
		rulep += ACNA_LSBUMP;
	}

/* 7/13/95 GL.  we don't need to do this any more*/
/*
	if(gp1->g_graph < 55)
		return(gp1);
	else
		gp1->g_graph=gp1->g_graph+45;
*/
	return(gp1);
}

/*
 * Match the nasty strings
 * used for environments. The "ep1" is
 * the "lsbtab" offset of a precompiled rule.
 * The "gp" points to the left (or right) grapheme
 * of the already matched block. The "d" is FORW (L-to-R)
 * or BACK (R-to-L). Return the updated GRAPH pointer,
 * or NULL if the match fails.
 */
GRAPH	*
acna_envmatch(ep1, gp, d)
register int	ep1;
register GRAPH	*gp;
register int	d;
{
	register unsigned int	ep2;
	register unsigned int	type;
	register unsigned int	npat;
	register unsigned int	mask;
	register unsigned int	test;
	register unsigned int	llim;
	register unsigned int	hlim;
	register GRAPH	*gp1;
	register unsigned int	ep3;

	npat = btabb(ep1++);
	ep2  = ep1 + npat;
	while (ep1 != ep2) {
		type = btabb(ep1++);
		if (type == GRANGE) {		/* Range of matches	*/
			llim = btabb(ep1++);	/* Low limit		*/
			hlim = btabb(ep1++);	/* High limit		*/
			while (llim--) {	/* Must match part	*/
				gp1 = acna_envmatch(ep1, gp, d);
				if (gp1 == NULL)
					return (NULL);
				gp = gp1;
			}
			while (hlim--) {	/* Optional matches	*/
				gp1 = acna_envmatch(ep1, gp, d);
				if (gp1 == NULL)
					break;
				gp = gp1;
			}
			npat = btabb(ep1++);	/* Skip over pattern	*/
			ep1 += npat;
		} else if (type == GDISJ) {	/* Disjunction		*/
			npat = btabb(ep1++);
			ep3  = ep1 + npat;	/* End of disjunction	*/
			for (;;) {
				if (ep1 == ep3)
					return (NULL);
				gp1 = acna_envmatch(ep1, gp, d);
				if (gp1 != NULL)
					break;
				npat = btabb(ep1++);
				ep1 += npat;
			}
			gp  = gp1;		/* Skip graphemes	*/
			ep1 = ep3;		/* Skip to end of rule	*/
		} else if (type == GFEAT) {	/* Feature set test	*/
			mask = btabw(ep1);
			ep1 += 2;
			test = btabw(ep1);
			ep1 += 2;
			if (d == FORW) {
				if (gp->g_graph == GEOS)
					return (NULL);
				++gp;
			} else {
				if (gp == &graph[0])
					return (NULL);
				--gp;
			}
			if ((gp->g_feats&mask) != test)
				return (NULL);	
		} else if (type == GMBOUND) {	/* Morpheme mark	*/
			if (d == FORW) {
				if (gp->g_graph == GEOS)
					return (NULL);
				if ((gp+1)->g_graph == GMBOUND)
					++gp;
				else if ((gp+1)->g_graph != 0)
					return (NULL);
			} else if (gp != &graph[0]) {
				--gp;
				if (gp->g_graph != GMBOUND)
					return (NULL);
			}
		} else if (type == GWBOUND) {	/* Word mark		*/
			if (d == FORW) {
				if (gp->g_graph == GEOS
				|| (gp+1)->g_graph != GEOS)
					return (NULL);
			} else {
				if (gp != &graph[0])
					return (NULL);
			}
		} else {			/* Random grapheme	*/
			if (d == FORW) {
				if (gp->g_graph == GEOS)
					return (NULL);
				++gp;
			} else {
				if (gp == &graph[0])
					return (NULL);
				--gp;
			}
			if (gp->g_graph != type)
				return (NULL);
		}
	}
	return (gp);
}

int bklug(short trpart)
{

	int tmp;
	tmp=btabb(trpart);
	if(tmp >56 && tmp <100)
		tmp=tmp+45;
	return(tmp);
}


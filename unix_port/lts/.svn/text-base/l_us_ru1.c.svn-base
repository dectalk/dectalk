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
 *    File Name:	l_us_ru1.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    Language dependent LTS Rule code                                                                             
 *                                                                             
 ***********************************************************************       
 *                                                                             
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 01   GL      07/29/1996  	use ls_util_write_pipe() to replace write_pipe()
 * 02	GL		10/23/1996      remove unused index mark handling code.
 * 03   GL		11/01/1996		use ls_fold[] to handle multi-national characters
 *								need to remove this change once we have the rule to
 *                              handle these characters in rule file. 
 * 04	GL		04/21/1997		BATS#360  remove spaces before "#define" or "#if" 
 * 05   NS		05/02/1997		Removed form-feed characters.  Needed for stripper to work properly.
 * 06   GL      09/24/1997      BATS#470  Add LDS debug switch 
 *                              also remove the duplicated rule table definition
 * 
 */

 /*
 *	Function Name:
 *		ls_rule_lts	
 *
 *	Description:      
 * 	This is the main driving routine
 * 	for Tony's letter to sound. It is called
 * 	by "ls1d.c" with two pointers; these bracket the
 * 	text to be spoken. This routine makes a private copy
 * 	of the text, with the ASCII characters converted to
 * 	G-codes and the index lists. The index lists are
 * 	kept in normal order. A private array is
 * 	used, so that the caller does not have to deal
 * 	with the fact that the word might expand, and walk
 * 	over the right punctuation.
 *
 *	Arguments:            
 *	LPTTS_HANDLE_T phTTS
 *	LETTER *lp2 	The left bounding ppinter to the word
 *	LETTER *lp1	The right boundiong pointer to the word
 *	int def_lang
 *	int sel_lang
 *
 *	Return Value:
 *		None
 *
 *	Comments:
 *
 */
void ls_rule_lts(LPTTS_HANDLE_T phTTS,LETTER *llp, LETTER *rlp,int def_lang, int sel_lang)
{
	 GRAPH  *gp1;
	 GRAPH  *gp2;
	 S16	lch;
	 int	g;
	 PHONE	*pp1;
	 PHONE	*pp2;
	 PHONE	*pp3;
	 int	ssflag;
	 int	rsflag;
	 int	pstype; 
	 PLTS_T pLts_t;
	 pLts_t=phTTS->pLTSThreadData;

	gp1 = &(pLts_t->graph[0]);


	while (llp < rlp) 
	{
		/* GL 11/01/96, use ls_fold[] to handle multi-national character */
		/* lch = llp->l_ch;*/		/* Convert to G-code	*/
		lch = ls_fold[llp->l_ch];		/* Convert to G-code	*/

		gp2 = gp1;
		if (lch>='a' && lch<='z')
		 {
			if (ls_rule_add_graph(pLts_t,gp1, lch-'a'+GA) != FALSE)
				++gp1;
		} 
		else 
		{
			if (lch == '\'') 
			{
				if (ls_rule_add_graph(pLts_t,gp1, GQUOTE) != FALSE)
					++gp1;
			}
		}
/*		tgp1 = &graph[0]; */	/* unused */

/* GL 10/23/1996, remove unused index handling code */
#if 0
		pp1 = llp->l_ip;		/* Append index list	*/
		if (pp1 != NULL) 
		{
			pp2 = gp2->g_ip;
			if (pp2 == NULL)
				gp2->g_ip = pp1;
			else 
			{
				while (pp2->p_ip != NULL)
					pp2 = pp2->p_ip;
				pp2->p_ip = pp1;
			}
		}
#endif
		++llp;
	}

	gp1->g_graph = GEOS;					/* End mark		*/
	gp1->g_feats = feats[GEOS];
	gp1->g_ip    = NULL;
	pLts_t->phead.p_fp = &(pLts_t->phead);	/* Empty list		*/
	pLts_t->phead.p_bp = &(pLts_t->phead);
	pLts_t->phead.p_ip = NULL;				/* No index chain	*/
	ssflag = FALSE;
	while (gp1 != &(pLts_t->graph[0]))
	{
		gp2 = ls_rule_rule_match(phTTS,gp1, def_lang, sel_lang);


		/*
		 * Collect up all index marks in the
		 * graphemes consumed by the rule that just
		 * matched, and put them in a big left-to-right
		 * list, for future use.
		 */

		pp1 = NULL;
		while (gp1 != gp2) 
		{
			--gp1;
/* GL 10/23/1996, remove unused index handling code */
#if 0
			if ((pp2=gp1->g_ip) != NULL) 
			{
				pp3 = pp2;
				while (pp3->p_ip != NULL)
					pp3 = pp3->p_ip;
				pp3->p_ip = pp1;
				pp1 = pp2;
			}
#endif
		}
		if (pLts_t->rpart != 0) 
		{
			if (btabb(pLts_t->rpart) != GEOS) 
			{
				while ((g=btabb(pLts_t->rpart++)) != GEOS) 
				{
					if (gp1 < &(pLts_t->graph[NGWORD-1])
					&& ls_rule_add_graph(pLts_t,gp1, g) != FALSE)
						++gp1;
				}
				gp1->g_graph = GEOS;
				gp1->g_feats = feats[GEOS];
				gp1->g_ip    = NULL;
			} 
			else
			{
				++pLts_t->rpart;
			}
			rsflag = FALSE;		/* Rep. sets stress.	*/
			while ((g=btabb(pLts_t->rpart++)) != SIL) 
			{
				/*
				 * [-], [*], [#] clear out
				 * the "don't screw with the stress
				 * flags". The [+] and [=] do not.
				 */
				switch (g)
				{
					case DASH:
				 		if ((pp2=pLts_t->phead.p_fp) != &(pLts_t->phead))
							pp2->p_flag |= PFDASH;
						ssflag = FALSE;
						rsflag = FALSE;										
						break;
					case STAR:
						if ((pp2=pLts_t->phead.p_fp) != &(pLts_t->phead))
							pp2->p_flag |= PFSTAR;
						ssflag = FALSE;
						rsflag = FALSE;
						break;
					case HASH:
						if ((pp2=pLts_t->phead.p_fp) != &pLts_t->phead)
							pp2->p_flag |= PFHASH;
						ssflag = FALSE;
						rsflag = FALSE;
						break;
					case PLUS:
						if ((pp2=pLts_t->phead.p_fp) != &pLts_t->phead)
							pp2->p_flag |= PFPLUS;
						break;
					case EQUAL:
						if (ssflag == FALSE
						&& (pp2=pLts_t->phead.p_fp) != &pLts_t->phead)
						{
							pp2->p_flag |= PFSYLAB;
						}
						break;
					default:
						if (g>=SNONE && g<=S2LEFT) 
						{
							if (g != SUN)
								rsflag = TRUE;
							if (ssflag == FALSE
							&& (pp2=pLts_t->phead.p_fp) != &pLts_t->phead)
								pp2->p_stress = g;
		
						} 
						else
						{ 
							if ((g&TWOPH) != 0)
							{
								ls_rule_add_phone(pLts_t,g&MSKPH, btabb(pLts_t->rpart++));
							}
							else
							{
								ls_rule_add_phone(pLts_t,g, SIL);
							}
						}
						break;
				} /* switch (g) */
					
/* GL 10/23/1996, remove unused index handling code */
#if 0
				if (pp1 != NULL) 
				{
					pLts_t->phead.p_fp->p_ip = pp1;
					pp1 = NULL;
				}
#endif
			}	/*	while ((g=btabb(pLts_t->rpart++)) != SIL)  */

			if (rsflag != FALSE)
				ssflag = TRUE;
#if defined (VMS) || defined (LDS_BUILD)
			if (tflag != FALSE) 
			{
				gp2 = &pLts_t->graph[0];
				printf("%5d ",rline);
				while (gp2 != gp1) 
				{
					putchar(gname[gp2->g_graph]);
					++gp2;
				}
				putchar('_');
				while (gp2->g_graph != GEOS) 
				{
					putchar(gname[gp2->g_graph]);
					++gp2;
				}
				if (xflag == TRUE)
					printf("%s",get_rule_data(rline));
				else
				    putchar('\n');
			}
#endif
		}	/*	if (pLts_t->rpart != 0)  */


		/*
		 * This code handles the unusual case
		 * of index marks on graphemes that have no
		 * corresponding phonemes (like the silent
		 * "e" on the end of a word).
		 */

/* GL 10/23/1996, remove unused index handling code */
#if 0
		if (pp1 != NULL) 
		{
			pp2 = pLts_t->phead.p_fp;
			pp3 = pp2->p_ip;
			pp2->p_ip = pp1;
			while (pp1->p_ip != NULL)
				pp1 = pp1->p_ip;
			pp1->p_ip = pp3;
		}
#endif
	}	/*	while (gp1 != &pLts_t->graph[0]) */
	ls_rule_show_phone(pLts_t->phead.p_fp, &pLts_t->phead, "lts");

    /*
    ** change 7/13/95 by GL. To make it same as acna code
    ** changes:
    ** 1). break ls_adju_stress() to a separate loop.
    ** 2). add ls_rule_delete_geminate_pairs ()
    **     between ls_adju_allo1()/sylable() and ls_adju_stress() loop.
    **     The orignal ls_rule_delete_geminate_pairs code in
    **     ls_adju_allo2() has been removed
    */
    pp1 = pLts_t->phead.p_fp;
    while (pp1 != &pLts_t->phead) 
    {
        pp2 = pp1;
        pp3 = pp2->p_fp;
        while (pp3!=&pLts_t->phead && (pp3->p_flag&PFBOUND)==0)
	        pp3 = pp3->p_fp;
        ls_adju_allo1(pLts_t,pp2, pp3);
        ls_rule_show_phone(pp2, pp3, "allo1");
        ls_adju_sylables(pp2, pp3);
        ls_rule_show_phone(pp2, pp3, "sylables");

        pp1 = pp3;
	}

    ls_rule_delete_geminate_pairs(pLts_t);
    pstype = SPRI;                          /* Use primary stress.  */
    pp1 = pLts_t->phead.p_fp;
    while (pp1 != &pLts_t->phead) 
    {
    	pp2 = pp1;                      	/* Find end of chunk.   */
        pp3 = pp2->p_fp;
        while (pp3!=&pLts_t->phead && (pp3->p_flag&PFBOUND)==0)
        	pp3 = pp3->p_fp;

        ls_adju_stress(phTTS,pp2, pp3, pstype,0);        /* Mark stress. */
        ls_rule_show_phone(pp2, pp3, "stress");

        pstype = SSEC;
        pp1 = pp3;
    }
    ls_adju_allo2(pLts_t);                                /* Allophonics, part 2  */
    ls_rule_show_phone(pLts_t->phead.p_fp, &pLts_t->phead, "allo2");

}
/*
 *	Function Name:
 *	ls_rule_lts_out
 *
 *	Description:
 * 	This is the output routine for the
 * 	letter to sound process. It is called after letter to
 * 	sound has processed its word, to write the generated phonemes
 * 	out to the synthesizer task. After a phoneme is written out,
 * 	any index marks in the index chain are written out. It is not
 * 	obvious why the "pLts_t->phead" can have an index chain. This happens
 * 	any time a block of grapemes, containing an index, in word
 * 	final position, generate no phonemes. All PHONE nodes are
 * 	returned to the free list via calls to "pfree".
 * 	This routine is not used on VMS.
 *
 *	Arguments:            
 *	LPTTS_HANDLE_T phTTS
 *
 *	Return Value: void
 *
 *	Comments:
 *
 */

void ls_rule_lts_out(LPTTS_HANDLE_T phTTS)
{
#ifndef	LDS_BUILD
	PHONE	*pp1;
	PHONE	*pp2;
	PHONE	*pp3;
	int	s;
	short		buf[3];
	PLTS_T pLts_t;
	PKSD_T pKsd_t;
	
	pKsd_t = phTTS->pKernelShareData;
	pLts_t = phTTS->pLTSThreadData;

	pp1 = pLts_t->phead.p_fp;
	while (pp1 != &pLts_t->phead) 
	{
		if ((pp1->p_flag&PFDASH) != 0)	/* [+] is just a mark	*/
			ls_util_send_phone(phTTS,SBOUND);	/* for internal use.	*/
		if ((pp1->p_flag&PFSTAR) != 0)	/* Unlike other kinds	*/
			ls_util_send_phone(phTTS,MBOUND);	/* of boundry symbols,	*/
		if ((pp1->p_flag&PFHASH) != 0)	/* it does not get	*/
			ls_util_send_phone(phTTS,HYPHEN);	/* written out.		*/
		if ((pp1->p_flag&PFSYLAB) != 0)
		{
			s = pp1->p_stress;
		}
		if (s!=SUN && ls_adju_is_cons(pp1)==FALSE) 
		{
			if (s == SPRI)
			{
				ls_util_send_phone(phTTS,S1);
			}
			else if (s == SSEC)
				ls_util_send_phone(phTTS,S2);
			s = SUN;
		}
		ls_util_send_phone(phTTS,pp1->p_sphone);
/* GL 10/23/1996, remove unused index handling code */
#if 0
		pp2 = pp1->p_ip;
		while (pp2 != NULL) 
		{
			buf[0] = (2<<PSNEXTRA) + pp2->p_itype;
			buf[1] = pp2->p_value;
			buf[2] = pp2->p_iret;
			ls_util_write_pipe(pKsd_t,&buf[0], 3);
			pp3 = pp2->p_ip;
			ls_rule_phone_free(pLts_t,pp2);
			pp2 = pp3;
		}
#endif
		pp1 = pp1->p_fp;
	}

/* GL 10/23/1996, remove unused index handling code */
#if 0
	pp1 = pLts_t->phead.p_ip;
	while (pp1 != NULL) 
	{
		buf[0] = (2<<PSNEXTRA) + pp1->p_itype;
		buf[1] = pp1->p_value;
		buf[2] = pp1->p_iret;
		ls_util_write_pipe(pKsd_t,&buf[0], 3);
		pp2 = pp1->p_ip;
		ls_rule_phone_free(pLts_t,pp1);
		pp1 = pp2;
	}
#endif
	pp1 = pLts_t->phead.p_fp;
	while (pp1 != &pLts_t->phead) 
	{
		pp2 = pp1->p_fp;
		ls_rule_phone_free(pLts_t,pp1);
		pp1 = pp2;
	}
#endif /* ifndef LDS_BUILD */
}


/*
 * NOTE:  This code was segregated from ls_adju_allo2(pLts_t).  TJV has determined
 * the it would be better to do geminate delete between syllabification
 * and stress analysis.
 */
/*
 *	Function Name:
 *	ls_rule_delete_geminate_pairs
 *
 *	Description:
 * 	Delete geminate
 * 	pairs. There are some special pairs
 * 	(like [l] and [L]) that get deleted even if
 * 	there is a morpheme boundry between them. This
 * 	rule may be backwards; all pairs may delete
 * 	across the boundry except stops (mid-day).
 * 	The header block has "p_sphone" set to "SIL",
 * 	so the first phoneme works fine.
 *
 *	Arguments:            
 *		PLTS_T 	pLts_t
 *
 *	Return Value: void
 *	
 *
 *	Comments:
 *
 */
void ls_rule_delete_geminate_pairs(PLTS_T pLts_t)
{
	register PHONE	*pp1;
	register int	ph1;
	register int	ph2;

	pp1 = pLts_t->phead.p_fp;
	while (pp1 != &pLts_t->phead) 
	{
		ph1 = pp1->p_sphone;
		ph2 = pp1->p_bp->p_sphone;
		/* Delete [l][L] and [L][l], preserving the [L].	*/
		if ((ph1==LL && ph2==EL) || (ph1==EL && ph1==LL)) 
		{
			ls_adju_delgemphone(pLts_t,pp1, EL);
			pp1 = pp1->p_fp;
			continue;
		}
		/* Block these rules if cross morpheme mark.		*/
		if ((pp1->p_flag&PFMORPH) == 0) {
			/* Delete [t][T] and [T][t], preserve the [T]	*/
			if ((ph1==T && ph2==TH) || (ph1==TH && ph2==T)) 
			{
				ls_adju_delgemphone(pLts_t,pp1, TH);
				pp1 = pp1->p_fp;
				continue;
			}
			/* Delete [s][S] and [S][s], preserve the [S]	*/
			if ((ph1==S && ph2==SH) || (ph1==SH && ph2==S)) 
			{
				ls_adju_delgemphone(pLts_t,pp1, SH);
				pp1 = pp1->p_fp;
				continue;
			}
			/* Delete plain old pairs of [+Cons] things.	*/
			if (ph1==ph2 && ls_adju_is_cons(pp1)!=FALSE) 
			{
				ls_adju_delgemphone(pLts_t,pp1, pp1->p_sphone);
				pp1 = pp1->p_fp;
				continue;
			}
		}
		/* No deletion, just move forward one phoneme		*/
		pp1 = pp1->p_fp;
	}
}


/*
 *	Function Name:
 *	ls_rule_add_graph
 *
 *	Description:
 * 	This routine is called to add a grapheme
 * 	to the graph array. There are two major cases.
 * 	Normally the new grapheme gets jammed into the slot
 * 	pointed to by "gp"; in this case the routine returns
 * 	TRUE, indicating that the caller should move its
 * 	cursor one grapheme to the right. However, if the new
 * 	grapheme is a vowel, and the two graphemes to the left
 * 	are "gu" or "qu", then the "gu" or "qu" are merged
 * 	into a new consonant graphme, and the new grapheme is
 * 	stored overtop of where the "u" used to be. The routine
 * 	returns FALSE in this case, to tell the caller that
 * 	the cursor does not move. Any index marks attached to
 * 	the "u" have to be appended to the index marks on
 * 	the "g". You are not expected to understand all
 * 	of this.
 *
 *	Arguments:            
 *	PLTS_T 	pLts_t
 *	GRAPH *gp
 *	int g
 *
 *	Return Value: int
 *
 *	Comments:
 *
 */                             
 
int ls_rule_add_graph(PLTS_T pLts_t,GRAPH *gp, int g)
{
	int	g1;
	PHONE	far *pp;
	int	value;

	if (ls_util_is_vowel(g) != FALSE	/* If a vowel			*/
	&& gp > &pLts_t->graph[1]			/* and 2 graphs to left	*/
	&&  (gp-1)->g_graph == GU			/* and first is "U"		*/
	&& ((gp-2)->g_graph == GG			/* and it's "GU"		*/
	||  (gp-2)->g_graph == GQ)) 		/* or "QU"				*/
	{		
		--gp;
		if ((gp-1)->g_graph == GG)
			(gp-1)->g_graph = GGU;
		else
			(gp-1)->g_graph = GQU;
/* GL 10/23/1996, remove unused index handling code */
#if 0
		if (gp->g_ip != NULL) 
		{
			if ((pp=(gp-1)->g_ip) == NULL)
				(gp-1)->g_ip = gp->g_ip;
			else 
			{
				while (pp->p_ip != NULL)
					pp = pp->p_ip;
				pp->p_ip = gp->g_ip;
			}
		}
#endif
		value = FALSE;
	}
	else
	{
		value = TRUE;
	}
	gp->g_graph = g;
	gp->g_ip = NULL;
	/*
	 * Gather graphemic features.
	 * Most come from the feature table.
	 * "H" is [+SIB] if "SH" or "CH"
	 * "G" is [+SIB] if "DG"
	 * "J" is [+SIB] if "DJ"
	 * Set [+GEM] on 2nd grapheme of pair.
	 * "Y" is [+CONS] if word initial, else [+VOC].
	 * [+SYL] sets as soon as a sylable is
	 * detected; a sylable exists when a vowel
	 * exits. Special stuff for "Y".
	 */
	gp->g_feats = feats[g];			/* Base set		*/
	if (g == GY) 
	{
		if (gp == &pLts_t->graph[0])		/* "Y" in word initial	*/
			gp->g_feats |= FCONS;	/* position is [+CONS]	*/
		else 
		{
			gp->g_feats |= FVOC;	/* Rest are vowels	*/
			gp->g_feats |= FSYL;	/* and create sylables	*/
		}
	}
	if (gp != &pLts_t->graph[0]) 
	{			/* If not word initial	*/
		g1 = (gp-1)->g_graph;		
		if ((g1==GS || g1==GC) && g==GH)
		{
			gp->g_feats |= FSIB;
		}
		else 
		{
			if (g1==GD && (g==GG || g==GJ))
			{
				gp->g_feats |= FSIB;
			}
		}
		if ((gp->g_feats&FCONS)!=0 && g1==g)
		{
			gp->g_feats |= FGEM;
		}
		if (((gp-1)->g_feats&FSYL) != 0)
		{
			gp->g_feats |= FSYL;
		}
	}
	return (value);
}

                               
/*
 *	Function Name:
 *	ls_rule_rule_match
 *
 *	Description:
 *	Look for a rule that matches
 * 	the largest block of characters to the
 * 	left of (no including) the grapheme pointed
 * 	to by "gp1". This always succeeds, although the
 * 	default is just "eat a byte". The offset in the
 * 	"lsbtab" array of the replacement part (or 0)
 * 	is stored in the external "pLts_t->rpart" as a side
 * 	effect.
 *
 *	Arguments:            
 *	PLTS_T 	pLts_t
 * 	GRAPH	*gp1
 *	int def_lang
 *	int sel_lang
 *
 *	Return Value: GRAPH *
 *
 *	Comments:
 *
 */
GRAPH *ls_rule_rule_match(LPTTS_HANDLE_T phTTS,GRAPH *gp1,int def_lang,int sel_lang)
{
	unsigned int	rulep;
	unsigned int	xrule;
	GRAPH	*gp2;
	unsigned int	nrule;
	unsigned int	g;
  	register int	lang;
	register int	specific;
	PLTS_T pLts_t;
	PKSD_T pKsd_t;
	pLts_t=phTTS->pLTSThreadData;
	pKsd_t=phTTS->pKernelShareData;


	g = (--gp1)->g_graph;
	rulep = wtab(2*g + 0);			/* Offset to rule	*/
	nrule = wtab(2*g + 1);			/* Number of rules	*/
	pLts_t->rpart = 0;				/* Assume we failed	*/
	while (nrule--) 
	{
		gp2 = gp1;
#ifdef ACNA
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
			{
		   	goto fail;
			}
			else
			{
				if (!specific && lang != def_lang && lang != sel_lang)
				{
			   		goto fail;
		   		}
			}
	
		/*
		 * END OF MODIFICATION.
		 */ 
		if ((xrule=wtab(rulep+1)) != 0) 
		{
			while ((g=btabb(xrule++)) != GEOS) 
			{
				if (gp2==(&pLts_t->graph[0]) || (--gp2)->g_graph!=g)
					goto fail;
			}
		}
		if ((xrule=wtab(rulep+4)) != 0	/* Right environment	*/
		&& ls_rule_env_match(pLts_t,xrule, gp1, FORW) == NULL)
		{
			goto fail;
		}
		if ((xrule=wtab(rulep+3)) != 0	/* Left environment	*/
		&& ls_rule_env_match(pLts_t,xrule, gp2, BACK) == NULL)
		{
			goto fail;
		}
			
#if defined (VMS) || defined (LDS_BUILD)
		rline = lswtab[rulep+5];	/* Line number of rule.	*/
		++lswtab[rulep+6];			/* Usage count of rule.	*/
#endif
		gp1 = gp2;							/* Move over the match	*/
		pLts_t->rpart = wtab(rulep+2);		/* Replacement		*/
		break;
#else         /* #ifdef ACNA */
		if ((xrule=wtab(rulep+0)) != 0) 
		{
			while ((g=btabb(xrule++)) != GEOS) 
			{

				if (gp2==&pLts_t->graph[0] || (--gp2)->g_graph!=(signed int)g)
					goto fail;
			}
		}
		if ((xrule=wtab(rulep+3)) != 0	/* Right environment	*/		
		&& ls_rule_env_match(pLts_t,xrule, gp1, FORW) == NULL)
		{
			goto fail;
		}
		if ((xrule=wtab(rulep+2)) != 0	/* Left environment	*/
		&& ls_rule_env_match(pLts_t,xrule, gp2, BACK) == NULL)
		{
			goto fail;
		}
#if defined (VMS) || defined (LDS_BUILD)
		rline = lswtab[rulep+4];		/* Line number of rule.	*/
		++lswtab[rulep+5];				/* Usage count of rule.	*/
#endif
		gp1 = gp2;						/* Move over the match	*/
		pLts_t->rpart = wtab(rulep+1);	/* Replacement		*/
		break;
#endif /* #ifdef ACNA */
	fail:
		rulep += LSBUMP;
	}

	return (gp1);
}

/*
 *	Function Name:
 *	ls_rule_env_match
 *
 *	Description:
 * 	Match the nasty strings
 *	used for environments. The "ep1" is
 * 	the "lsbtab" offset of a precompiled rule.
 * 	The "gp" points to the left (or right) grapheme
 * 	of the already matched block. The "d" is FORW (L-to-R)
 * 	or BACK (R-to-L). Return the updated GRAPH pointer,
 * 	or NULL if the match fails.
 *
 *	Arguments:            
 *		PLTS_T 	pLts_t
 * 		signed int	ep1
 * 		GRAPH	*gp
 * 		int	d
 *
 *	Return Value:
 *
 *	Comments:
 *
 */
GRAPH	*ls_rule_env_match(PLTS_T pLts_t,signed int ep1, GRAPH *gp, int d)
{
	unsigned int	ep2;
	unsigned int	type;
	unsigned int	npat;
	unsigned int	mask;
	unsigned int	test;
	unsigned int	llim;
	unsigned int	hlim;
	GRAPH  *gp1;
	unsigned int	ep3;

	npat = btabb(ep1++);
	ep2  = ep1 + npat;
	while (ep1 != (signed int)ep2) 
	{
		type = btabb(ep1++);
		switch (type)
		{
			case GRANGE:
										/* Range of matches	*/
				llim = btabb(ep1++);	/* Low limit		*/
				hlim = btabb(ep1++);	/* High limit		*/
				while (llim--) 
				{					/* Must match part	*/
					gp1 = ls_rule_env_match(pLts_t,ep1, gp, d);
					if (gp1 == NULL)
						return (NULL);
					gp = gp1;
				}
				while (hlim--) 
				{	/* Optional matches	*/
					gp1 = ls_rule_env_match(pLts_t,ep1, gp, d);
					if (gp1 == NULL)
						break;
					gp = gp1;
				}
				npat = btabb(ep1++);	/* Skip over pattern	*/
				ep1 += npat;
				break;
			case GDISJ:		
				npat = btabb(ep1++);	/* Disjunction			*/
				ep3  = ep1 + npat;		/* End of disjunction	*/
				for (;;) 
				{
					if (ep1 == (signed int)ep3)
						return (NULL);
					gp1 = ls_rule_env_match(pLts_t,ep1, gp, d);
					if (gp1 != NULL)
						break;
					npat = btabb(ep1++);
					ep1 += npat;
				}
				gp  = gp1;			/* Skip graphemes	*/
				ep1 = ep3;			/* Skip to end of rule	*/
				break;
			case GFEAT:
				mask = btabw(ep1);  /* Feature set test	*/
				ep1 += 2;
				test = btabw(ep1);
				ep1 += 2;
				if (d == FORW) 
				{
					if (gp->g_graph == GEOS)
						return (NULL);
					++gp;
				} 
				else 
				{
					if (gp == &pLts_t->graph[0])
						return (NULL);
					--gp;   	
				}   	
				if ((gp->g_feats&mask) != test)
					return (NULL);	
                break;
			case GMBOUND:
				if (d == FORW) /* Morpheme mark	*/
				{
					if (gp->g_graph == GEOS)
					{
						return (NULL);
					}
					if ((gp+1)->g_graph == GMBOUND)
					{
						++gp;
					}
					else 
					{
						if ((gp+1)->g_graph != 0)
						{
							return (NULL);
						}
					}
				} 
				else 
				{
					if (gp != &pLts_t->graph[0]) 
					{
						--gp;
						if (gp->g_graph != GMBOUND)
							return (NULL);
					}
				}        
				break;
			case GWBOUND:
				if (d == FORW) /* Word mark		*/
				{
					if (gp->g_graph == GEOS
					|| (gp+1)->g_graph != GEOS)
						return (NULL);
				} 
				else 
				{
					if (gp != &pLts_t->graph[0])
						return (NULL);
				}
				break;
			default:
				if (d == FORW) /* Random grapheme	*/
				{
					if (gp->g_graph == GEOS)
						return (NULL);
					++gp;
				} 
				else 
				{
					if (gp == &pLts_t->graph[0])
						return (NULL);
					--gp;
				}       	
				if (gp->g_graph != (signed int)type)
					return (NULL);
				break;
		}	/* switch (type) */
	}	/* while (ep1 != (signed int)ep2)  */

	return (gp);
}


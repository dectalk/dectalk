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
 *    File Name:    p_sp_sr1.c
 *    Author:       Matthew Schnee
 *    Creation Date:05-Jun-1996
 *
 *    Functionality:
 *		Spanish code from sphsort.c
 *
 ***********************************************************************
 *    Revision History:
 *
 * Rev  Who     Date            Description
 * ---  -----   -----------     --------------------------------------------
 * 001  SIK		07/08/1996  	Cleaning up and maintenance
 */

extern short            featb[];	/* Phonemic feature vector        */

/* 
 * Bits for Spanish allophonics
 */
#define KG      2					   /* [k] -> [gh] context                */
#define VOWEL      8				   /* Vowel (stressed or unstressed)     */
#define   STRESSED   16				   /* Stressed vowel                     */

static char             allo_bits[TOT_ALLOPHONES - E_RR] =
{
	  /* rr     l       ll      m       n       nh                      */
		 0, 	0, 		0, 		KG + 0, KG + 0, 0,
	  /* f      s       j       th      bh      dh                      */
		 KG, 	0, 		0, 		KG, 	0, 		0,
	  /* gh     yh      p       b       t       d                       */
		 0, 	0, 		KG, 	KG, 	KG, 	KG,
	  /* k      g       ch      y       r       q                       */
		 0, 	0, 		KG, 	0, 		0, 		0,
	  /* z      w       nx      sh      v       mx      ph              */
		 KG, 	0, 		0, 		0, 		0, 		0, 		0
};

#if TOT_ALLOPHONES != E_PH + 1
<<error, allo_bits isn 't correct >>
#endif

static short            syllstruc[] =
{
	FMONOSYL,	/* nsyll == 0 (monosyllabic)    */
	FBISYL,		/* nsyll == 1 (bisyllabic)      */
	FTRISYL,	/* nsyll == 2 (trisyllabic)     */
	FMULTISYL	/* nsyll >= 3 (multisyllabic)   */
};

static	spanish_allophonics (LPTTS_HANDLE_T phTTS)
/* 
 * Allophonic manipulation for Spanish.  May insert or delete 
 * symbols.  This is done here so the feature bit calculation 
 * is correct. 
 */
	{
		int                     next;  			/* Next real phoneme       */
		int                     curr;  			/* Current phoneme         */
		int                     n;
		int                     m;
		short                  *pp;	   			/* -> symbols[n]          */
		short                  *mp;	   			/* -> symbols[m]          */
		short                   feat;  			/* Next phoneme's features     */
		short                   last_featb;		/* Last phoneme's featb[] entry     */
		short                   next_featb;		/* Next phoneme's featb[] entry     */
		short                   wbnext;			/* TRUE if boundary next     */
		short                   sbnext;			/* TRUE if syllable boundary */
		short                   truelast;		/* For 'y' test                    */
		short                   last = COMMA;	/* Clause start, see 'y' rule  */
		short                   localoff = 0;
		PDPH_T                  pDph_t=phTTS->pPHThreadData;
	   
		for (n = 0, pp = &pDph_t->symbols[0]; n < pDph_t->nsymbtot; n++, pp++)
		{
			curr = *pp;
			m = n + 1;
			mp = pp + 1;
			if ((m = n + 1) >= pDph_t->nsymbtot)
				next = SIL;
			else
				next = *mp;
			wbnext = FALSE;
			if (next >= MBOUND)
			{
				wbnext = TRUE;
				if (m + 1 < pDph_t->nsymbtot)
				{
					m++;
					mp++;
					next = *mp;
				}
			}
			sbnext = FALSE;
			if (next == SBOUND)
			{
				sbnext = TRUE;
				m++;
				mp++;
				next = *mp;
			}
			if (next == S1)
			{
				feat = (VOWEL | STRESSED);
				m++;
				mp++;
				next = *mp;
			}
			if (((next_featb = featb[next]) & FVOWEL) IS_PLUS)
				feat = VOWEL;
			else if (next >= E_RR && next <= TOT_ALLOPHONES)
				feat = allo_bits[next - E_RR];
			else
				feat = 0;
			last_featb = featb[last];
			/* 
			 * last    last true phoneme processed 
			 * curr    current phoneme 
			 * next    next phoneme (skipping over boundaries and stress) 
			 * feat
			 * features of next phoneme 
			 * sbnext  TRUE if start of a syllable 
			 */
			switch (curr)
			{
			case BLOCK_RULES:		   /* Applies to the word!         */
				return (1);
			case E_R:
				if ((next_featb & FVOWEL) && (last_featb & FCONSON))
				{
					pDph_t->specdur = 25;	   /* eab make duration shorter Latin or both ?? */

					/* was 45 */
					insertphone (phTTS, (n + localoff), next);
					localoff++;
					pp++;
/* printf("%d %d %d %d %d \n",localoff,next_featb & FVOWEL, m ,next,n); */
					pDph_t->specdur = 0;
				}
				break;
#ifdef E_V
			case E_V:				   /* V always == B                */
				curr = E_B;			   /* Nelly Carbonell, 5-Feb-86    */
#endif
			case E_B:
				/* 
				 * OUT 23-Apr-86: 
				 * B, V -> [ph] / ... (#) {p t c k q ch f s z j} 
				 *      || [b]  / {lateral} (#) ...     added ?? 
				 *      || [b]  / {unvoiced} (#) ...    added 2-Feb-86 
				 *      || [b]  / ... {unvoiced}        added 2-Feb-86 
				 *      || [b]  / {nasal or clstart} (#) ... 
				 *      || [bh] 
				 * NEW: 
				 * B,V -> [b] / [# or nasal] (#) ...
				 *      || [bh] 
				 */
#if 0
				if ((feat & LATIN) != 0)
					curr = E_PH;
				else if (((last_featb & (FNASAL | FSONCON)) IS_PLUS)
						 || ((next_featb & FVOICD) IS_MINUS)
						 || ((last_featb & FVOICD) IS_MINUS))
					break;			   /* [N, L] B -> B        */
				else if (last >= WBOUND)	/* # B -> B             */
					break;
				else
				{
					curr = E_BH;
				}
#else
				if (((last_featb & FNASAL) IS_PLUS)
					|| (last == COMMA))
					;
				else
				{
					curr = E_BH;
				}
#endif

				break;
			case E_D:

				/* 
				 *  OUT: 23-Apr-86 
				 * D -> [th] / ... (#) {p t c k q ch f s z j} 
				 *   || [d]  / {unvoiced} ...           added 2-Feb-86 
				 *   || [d]  / {nasal, l, ll, clstart} (#) ... 
				 *   || [dh] 
				 * NEW: 
				 * D -> [d]  / [#, l, or nasal] ... 
				 *   || [dh] 
				 */
#if 0
				if ((feat & LATIN) != 0)
					curr = E_TH;
				else if (((last_featb & (FNASAL | FSONCON)) != 0)
						 || ((last_featb & FVOICD) IS_MINUS)
						 || (last == COMMA))
					;
				else
				{
					curr = E_DH;
				}
#else

				if (((last_featb & FNASAL) IS_PLUS)
					|| (last == E_L)
					|| (last == COMMA))
					;
				else
				{
					curr = E_DH;
				}
#endif
				break;

#ifdef E_V
#if 0
				/* 
				 * * Blocked -- 2-Feb-86 */
			case E_F:
				/* 
				 * * F -> [v] / ... (#) {b, d, g} */
				switch (next)
				{
				case E_B:
				case E_D:
				case E_G:
					curr = E_V;
				}
				break;
#endif
#endif

			case E_G:
				/* 
				 * OUT: 23-Apr-86 
				 * G -> [j] / ... (#) {p t c k q ch f s z j} 
				 *   || [g] / {unvoiced cons}  (#) ... (Added 2-Feb-86) 
				 *   || [g] / {nasal, clstart} (#) ... 
				 *   || [gh] 
				 * NEW: 
				 * G -> [g]  / {# or nasal} ... 
				 *   || [gh] 
				 */
#if 0
				if ((feat & LATIN) != 0)
					curr = E_J;
				else if (((last_featb & FNASAL) IS_PLUS)
						 || ((last_featb & FVOICD) IS_MINUS)
						 || last == COMMA)
					;
				else
				{
					curr = E_GH;
				}
#else
				if (((last_featb & FNASAL) IS_PLUS)
					|| last == COMMA)
					curr = E_G;
				else
				{
					curr = E_GH;
				}
#endif
				break;

#if 0
			case E_K:
				/* 
				 * OUT: 23-Apr-86 
				 * NOTE: changed KG test to exclude non-voiced seg's and word-final 
				 * Changed to keep K post-vocalically. 
				 * K -> [gh] / ... { #, p, t, c, b, d, m, n, ch, f, z } 
				 */
#if 1
				if (!sbnext
					&& (feat & KG) != 0
					&& (next_featb & FVOICD) IS_PLUS)
					curr = E_GH;
#else
				if (wbnext || (feat & KG) != 0)
					curr = E_GH;
#endif
				break;
#endif

#if 0
				/* 
				 * The nasal assimilation rule is mostly in phsettar.c  8-May-86 
				 */
			case E_N:
				/* 
				 * NOTE: needs to be put back in (possibly in phsettar.c) 
				 * N -> [m]  / ... (#) {p, b, v, m} 
				 * NOTE: Spanish informants deny n->m  
				 * NOTE: Spanish informants deny '# p' 
				 *   || [mx] / ... (#) {f} 
				 *   || [nx] / ... (#) {k g j} 
				 */
				switch (next)
				{
#if 0
				case E_P:
#if 1
					if (wbnext)
						break;
#endif
				case E_B:
#ifdef E_V
				case E_V:
#endif
				case E_M:
					curr = E_M;
					break;
#endif

				case E_F:
					curr = E_MX;
					break;
				case E_K:
				case E_G:
				case E_J:
					curr = E_NX;
					break;
				}
				break;
#endif

			case E_N:
				/* 
				 * 12-May-86 
				 * N -> [m]  / ... (#) [m]      "inmovil>immovil" 
				 */
				if (next == E_M)
					curr = E_M;
				break;

#if 0
				/* 
				 * OUT: 23-Apr-86 * Voicing is now done in phsettar.c 
				 */
			case E_S:
				/* 
				 * S -> [z] / ... (#) {b, d, g, r, l, ll, m, n, ~n, w y yh} 
				 */
				if ((next_featb & (FCONSON | FVOICD)) == (FCONSON | FVOICD))
					curr = E_Z;
				break;
#endif
			case E_Y:
				/* 
				 * Y -> [yh]  / {#, nasal, lateral} (#) ...      5-May-86 
				 *   || [y] 
				 * The following rules are for the word 'y' * * 'y' -> [i]
				 * / [-vowel] ... [-vowel] 
				 *     || [yx] 
				 * Note that [yx] will dipthongize by rules in phalloph.c 
				 */
				if (truelast >= MBOUND && wbnext)
				{					   /* the word 'y' */
					if ((last_featb & FVOWEL) IS_MINUS
						&& (next_featb & FVOWEL) IS_MINUS)
						curr = E_I;	   /* Stressed?               */
					else
					{
						curr = E_YX;   /* Dipthongizes                */
					}
				}
				else if (((last_featb & (FNASAL | FSONCON)) != 0)
						 || (last == COMMA))
				{

					curr = E_YH;
				}
				break;

#if 0
				/* 
				 * Blocked 8-May-86.  See changes in lsortho.c also.
				 * Voicing is now done in phsettar.c
				 */
			case E_Z:				   /* From orthographic z               */
				/* 
				 * Z -> [th] / # ...
				 *   || [th] / ... (#) {b, d, g} (blocking next rule)
				 *   || [dh] / ... (#) {b, d, g, r, l, ll, m, n, ~n, y w yh}
				 *   || [th]
				 */
				if (last == COMMA
					|| symbols[n - 1] >= WBOUND
					|| (next_featb & (FPLOSV | FVOICD)) == (FPLOSV | FVOICD))
					curr = E_TH;
				else if ((next_featb & (FCONSON | FVOICD))
						 == (FCONSON | FVOICD))
					curr = E_DH;
				else
				{
					curr = E_TH;
				}
				break;
#endif
			default:
				break;				   /* Do nothing                   */
			}
			*pp = curr;
			if (curr < SBOUND)
				last = curr;
			truelast = curr;		   /* Might be a boundary              */
		}
	}
 
/*
 *      Function Name: get_symbol()      
 *
 *  	Description: Get symbol i if it is inside the clause.
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short i
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

static int get_symbol (PDPH_T pDph_t,short i)
{
	if (i >= pDph_t->nsymbtot)
		return (COMMA);
	else
		return (pDph_t->symbols[i]);
}

 
/*
 *      Function Name: getsyllclass()      
 *
 *  	Description: Return FOPEN_SYL if the syllable is open, else 0.
 *
 *      Arguments: PDPH_T pDph_t,
 *				   short curr
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

static int getsyllclass (PDPH_T pDph_t,short curr)
	   /* Follows nucleus vowel */
{
	int                     phone;

	/* 
	 * Note that next will exceed TOT_ALLOPHONES if a syllable-boundary,
	 * word-boundary, or stress mark follows.
	 * This implies that dipthongs (V1 V2) build closed syllables.
	 */
	do
	{
		phone = get_symbol(pDph_t,curr++);   /* Get phoneme           */
		if (phone >= TOT_ALLOPHONES)   /* Boundary or str. vow    */
			return (FOPEN_SYL);		   /* is open sylable    */
	}
	while ((featb[phone] & (FVOWEL | FSEMIV)) IS_PLUS);
	switch (phone)
	{								   /* V N (-) L is open */
	case E_N:
	case E_S:
	case E_RR:
	case E_T:
		if (get_symbol(pDph_t,curr) == SBOUND)
		{
			curr++;
		}
		if (get_symbol(pDph_t,curr) == E_L)
		{
			return (FOPEN_SYL);
		}
	}
	return (0);						   /* Closed syllable    */
}

 
/*
 *      Function Name: countsyll()      
 *
 *  	Description: Count the number of syllables in this word.
 *
 *      Arguments: PDPH_T pDph_t,int n
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

static int countsyll (PDPH_T pDph_t,int n)
{
	int                     phone;
	int                     count;

	count = 0;
	while ((phone = get_symbol(pDph_t,n++)) < WBOUND)
	{
		if (phone == SBOUND)
			count++;
	}
	if (count > 3)
		count = 3;
	return (syllstruc[count]);
}
 
/*
 *      Function Name: getwordstress()      
 *
 *  	Description: Return FFUNWORD if the word has no stress.
 *
 *      Arguments: PDPH_T pDph_t,int n
 *
 *      Return Value: 
 *
 *      Comments:
 *
 */

static int getwordstress (PDPH_T pDph_t,int n)
{
	int phone;

	if (pDph_t->nphonetot > 0
		&& (pDph_t->sentstruc[pDph_t->nphonetot - 1] & FSTRESS_1) != 0)
		return (0);
	while ((phone = get_symbol(pDph_t,n++)) < WBOUND)
	{
		if (phone >= S2 && phone <= SEMPH)
			return (0);				   /* Normal word  */
	}

#if 0
	/* 
	 * Out 28-Jul-86 to make room in structure for
	 * the FDUMMY_VOWEL bit.
	 */
	return (FFUNWORD);				   /* Unstressed  */
#else
	return (0);
#endif
}

 
/*
 *      Function Name: get_stress_of_conson()      
 *
 *  	Description: Determines the stress in the consonant
 *
 *      Arguments: 	PDPH_T pDph_t,
 *					short msym, 
 *					short compound_destress
 *
 *      Return Value: void
 *
 *      Comments: short compound_destress is unused 
 */

void get_stress_of_conson (PDPH_T pDph_t,short msym, short compound_destress) 
{
	short                   m, stresslevel;
/*	short                  *mp; */

	stresslevel = FNOSTRESS;
	for (m = msym + 1; m < pDph_t->nsymbtot; m++)
	{
		switch (pDph_t->symbols[m])
		{
		case S1:
				add_feature (pDph_t,FSTRESS_1, CURRPHONE);
			return;
		case S2:
				add_feature (pDph_t,FSTRESS_2, CURRPHONE);
			return;
		case SEMPH:
			add_feature (pDph_t,FEMPHASIS, CURRPHONE);
			return;
		default:
			if ((featb[pDph_t->symbols[m]] & FSYLL) IS_PLUS)
			{
				return;			   /* No stress before vowel */
			}
			else if ((pDph_t->symbols[m] >= SBOUND) && (pDph_t->symbols[m] <= EXCLAIM))
			{
				return;			   /* No vowel before syllable ends */
			}
			break;
		}
	}
}
 
/*
 *      Function Name: find_syll_to_stress()      
 *
 *  	Description: Clause contains no primary stresses; raise first secondary stress 
 * 					 encountered to primary; else stress first non-schwa vowel 
 *
 *      Arguments: LPTTS_HANDLE_T phTTS,
 *				   short *n,
 *			  	   short nstartphrase
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */
void find_syll_to_stress (LPTTS_HANDLE_T phTTS,short *n,short nstartphrase)
{
	short                   m;
	int                     scnt = 0;
	int                     saveit = 0;
	PDPH_T                  pDph_t=phTTS->pPHThreadData;

	for (m = *n - 2; m < pDph_t->nsymbtot; m++)
	{
		if ((featb[pDph_t->symbols[m]] & FSYLL) IS_PLUS)
		{
			if (scnt)
			{
				insertphone (phTTS,m, S1);	/* Insert S1 at location m */
				saveit = m;
			}
			scnt++;
			(*n)++;				   /* Move pointer in calling loop */
		}
	}
	if (scnt == 1)
		insertphone (phTTS,saveit, S1);  /* Insert S1 at location m */
	return;
}


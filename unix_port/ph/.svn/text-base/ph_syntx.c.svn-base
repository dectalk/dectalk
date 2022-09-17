/* 
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996,1997 All rights reserved.
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
 *    File Name:    ph_syntx.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *      gphsyntax.c         G.Rigoll
 *  German syntactic analysis
 *
 ***********************************************************************
 *    Revision History:
 * 0001 24-Sep-86 	BNK	Initial creation
 * 0002 30-MAR-95 	CJL	File was phsynatx.c. Is now gphsyntx.c. Changed
 *                      phdefs.h->gphdefs.h
 * 0003	19-Jun-1996 MGS	Changed file name to ph_syntx.c
 * 0004	19-Jun-1996	MGS	Made it multi instance
 *
 */

#include "ph_def.h"
/* Input arrays: */   

#ifdef GERMAN


/* From PHROM.C */
extern short featb[];	   /* Feature assignment to each phonetype */
extern short dbmess[];	   /* Linear conversion           */

int loop2 (PDPH_T pDph_t,short *pjcnt);
int loop1 (PDPH_T pDph_t,short *picnt, short *pninput, short *pipot);

#define CURRPHONE   (pDph_t->nphonetot-1)
#define NEXTPHONE   pDph_t->nphonetot

 
/*
 *      Function Name: german_syntax()     
 *
 *  	Description: 
 *
 *      Arguments: PDPH_T pDph_t
 *
 *      Return Value: void
 *
 *      Comments:
 *
 */

void german_syntax (PDPH_T pDph_t)
{
	short symcur, symlas, ninput;		/* left from kl2 */
	short jcnt, icnt, ipot;	/* used as indices */
	char  w_flag;	   /* flag to indicate WBOUND */
    SENT_PARS *pp;
	/* Scan the input array and write all pointers to word boundaries * and the concerned word classes to the structure. */

	ninput = 0;
	symcur = WBOUND;
	icnt = 1;
	pp = pDph_t->pars;

#ifdef DBGSCN
	fprintf (stderr, "\n(phsyntax)begin of wordclass scan:\n");
#endif

	while ((icnt < pDph_t->nsymbtot) && (pp < &pDph_t->pars[MAXSPA]))
	{
		symlas = symcur;
		symcur = pDph_t->symbols[icnt++];
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		/* treat all high level boundaries as WBOUND          */
		/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
		if ((symcur >= HYPHEN) && (symcur <= EXCLAIM))
		{
			symcur = WBOUND;
		}
		if (symlas == WBOUND)
		{							   /* if we are at a word boundary */
			pp->phopoint = icnt - 2;   /* store the pointer to the word class */
			/* 
			 * scan for word class symbols. If a word boundary after a word class
			 * symbol appears, that means that this is a user defined word class, so
			 * store this. Otherwise take the last word class that is found before
			 * the begin of the alphanumeric string.
			 */
			w_flag = FALSE;
			while (((symcur >= G_FIRST) && (symcur <= G_LAST)) ||
				   (symcur == WBOUND))
			{
				if (symcur == WBOUND)
				{
					w_flag = TRUE;
				}
				if (w_flag == FALSE)
				{
					pp->wordclass = symcur;
				}
				symcur = pDph_t->symbols[icnt++];
			}
			/* while */

#ifdef DBGSCN
			fprintf (stderr,
					 "ninput:%d\twordclass:%d\tw_flag:%d\tsymcur:%d\n",
					 ninput, (pp->wordclass - G_FIRST),
					 w_flag, symcur);
#endif

			pp++;					   /* increase pointer to next array element */
			ninput++;				   /* increase counter for processed words   */
		}
		/* if */
	}
	/* for */
	/* end of scanning loop for collection of word pointers and classes */

	/* try now to insert syntactic boundaries. Begin to scan from the end of the * clause to the begin, if this is last clause in sentence by going
	 * into loop * no. 1. If it is not last clause in sentence, scan from the begin to the * end by jumping into loop no. 2. */

	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	/* dt3 has different order of special markers            */
	/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
	if (pDph_t->symbols[pDph_t->nsymbtot - 1] < PERIOD)
	{
		icnt = ninput;

#ifdef DBGSTX
		fprintf (stderr, "\n(phsyntax)skipping first loop\n");
#endif

		--ninput;
		goto sec_loop;
	}
	for (icnt = --ninput, ipot = 0; icnt > 0; --icnt)
	{
		if (loop1 (pDph_t,&icnt, &ninput, &ipot) != 0)
		{
			break;
		}
	}
	/* for */
	/* end of first parsing loop. Try to insert more boundaries by scanning from * the begin to the end in the second parsing loop. */

#ifdef DBGSTX
	fprintf (stderr, "\n(phsyntax)loop1 end at: icnt:%d, ninput:%d, ipot:%d\n",
			 icnt, ninput, ipot);
#endif

  sec_loop:

	--icnt;

	for (jcnt = 1; jcnt < icnt; jcnt++)
	{								   /* start from second word */
		if (loop2 (pDph_t,&jcnt) != 0)
		{
			break;
		}
	}
	/* for */

#ifdef DBGSTX
	fprintf (stderr, "\n(phsyntax)loop 2 end at:%d, results of syntactical scan\n",
			 jcnt);
	for (icnt = 0; icnt <= ninput; icnt++)
	{
		fprintf (stderr, "pointer:%d, wordclass:%d, flag:%d\n",
				 pars[icnt].phopoint, pars[icnt].wordclass - G_FIRST,
				 pars[icnt].bouflag);
	}
	/* for */
#endif
}
/* syntax */

 
/*
 *      Function Name: consider_boundary()      
 *
 *  	Description: 
 *
 *      Arguments: short  icnt, ipot
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */
int consider_boundary (int  icnt,  int ipot)
{
	if (ipot == 0)
	{
		return (icnt);
	}
	if ((ipot - icnt) < 3)
	{
		return (icnt);
	}
	return (ipot);
}
/* consider_boundary */

 
/*
 *      Function Name: loop1()      
 *
 *  	Description: first parsing loop
 *
 *      Arguments: 	PDPH_T pDph_t,
 *					short *picnt, 
 *					short *pninput, 
 *					short *pipot
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

int loop1 (PDPH_T pDph_t,short *picnt, short *pninput, short *pipot)
{
	switch (pDph_t->pars[*picnt].wordclass)
	{
	case G_NOU:
		switch (pDph_t->pars[*picnt - 1].wordclass)
		{
		case G_VER_ADJ:
		case G_HEL:
		case G_ADV:
			*picnt = consider_boundary (*picnt, *pipot);
			pDph_t->pars[*picnt].bouflag = TRUE;
			return (-1);
		default:
			break;
		}							   /* switch */
		break;
	case G_CON:
		if (*picnt >= *pninput)
		{							   /* only if not last word in clause */
			break;
		}							   /* ~~~~~~~ */

#ifndef ALWAYS
		if ((pDph_t->pars[(*picnt) - 1].wordclass == G_VER_ADJ) ||
			(pDph_t->pars[(*picnt) - 1].wordclass == G_HEL) ||
			(pDph_t->pars[(*picnt) - 1].wordclass == G_ADV) ||
			(pDph_t->pars[(*picnt) - 1].wordclass == G_NOU) ||
			(pDph_t->pars[(*picnt) - 1].wordclass == G_POS) ||
			(pDph_t->pars[(*picnt) - 1].wordclass == G_PRO))
		{
#else
		switch (pDph_t->pars[(*picnt) - 1].wordclass)
		{
		case G_VER_ADJ:
		case G_HEL:
		case G_ADV:
		case G_NOU:
		case G_POS:
		case G_PRO:
#endif
			*picnt = consider_boundary (*picnt, *pipot);
			pDph_t->pars[*picnt].bouflag = TRUE;
			return (-1);
		}							   /* switch */
		break;
	case G_ART:
	case G_PRE:
	case G_PRO:
	case G_ADV:
		if (*picnt < *pninput)
		{							   /* only if not last word in sentence */
			switch (pDph_t->pars[*picnt - 1].wordclass)
			{
			case G_NOU:
				*picnt = consider_boundary (*picnt, *pipot);
				pDph_t->pars[*picnt].bouflag = TRUE;
				return (-1);
			default:
				break;
			}						   /* switch */
		}							   /* if */
		break;
	case G_HEL:
		if (*picnt < *pninput)
		{							   /* only if not last word in clause */
			switch (pDph_t->pars[*picnt - 1].wordclass)
			{
			case G_NOU:
				*picnt = consider_boundary (*picnt, *pipot);
				pDph_t->pars[*picnt].bouflag = TRUE;
				return (-1);
			default:
				break;
			}						   /* switch */
		}							   /* if */
		break;
	case G_VER_ADJ:
		if (*picnt < *pninput)
		{							   /* don't insert, if last word of sent. */
			switch (pDph_t->pars[*picnt - 1].wordclass)
			{
			case G_NOU:
				*picnt = consider_boundary (*picnt, *pipot);
				pDph_t->pars[*picnt].bouflag = TRUE;
				return (-1);
			default:
				break;
			}						   /* switch */
		}
		else
		{							   /* if last word in sentence */
			switch (pDph_t->pars[*picnt - 1].wordclass)
			{
			case G_ADV:
			case G_PRE:
			case G_VER_ADJ:
				*pipot = *picnt;	   /* store potential pointer */
				break;
			}						   /* switch */
		}							   /* else */
		break;
	}								   /* switch */
#ifdef DBGSTX
	fprintf (stderr, "\n(phsyntax)icnt:%d first %d, %d. flag:%d, ipot:%d\n",
			 *picnt, pars[*picnt - 1].wordclass - G_FIRST,
			 pDph_t->pars[*picnt].wordclass - G_FIRST,
			 pDph_t->pars[*picnt].bouflag, *pipot);
#endif
	return (0);
}									   /* loop1 */

 
/*
 *      Function Name: loop2()      
 *
 *  	Description: second parsing loop
 *
 *      Arguments: PDPH_T pDph_t,short *pjcnt
 *
 *      Return Value: int
 *
 *      Comments:
 *
 */

int loop2 (PDPH_T pDph_t,short *pjcnt)
{
	switch (pDph_t->pars[*pjcnt].wordclass)
	{
	case G_NOU:
		switch (pDph_t->pars[*pjcnt + 1].wordclass)
		{
		case G_ART:
		case G_PRO:
		case G_POS:
		case G_PRE:
		case G_CON:
		case G_HEL:
		case G_ADV:
		case G_VER_ADJ:
			pDph_t->pars[*pjcnt + 1].bouflag = TRUE;
			break;
		}							   /* switch */
		break;
	case G_VER_ADJ:
		switch (pDph_t->pars[*pjcnt + 1].wordclass)
		{
		case G_CON:
			pDph_t->pars[*pjcnt + 1].bouflag = TRUE;
			break;
		}							   /* switch */
		break;
	case G_PRO:
		switch (pDph_t->pars[*pjcnt + 1].wordclass)
		{
		case G_CON:
		case G_PRE:
			pDph_t->pars[*pjcnt + 1].bouflag = TRUE;
			break;
		}							   /* switch */
	default:
		switch (pDph_t->pars[*pjcnt + 1].wordclass)
		{
		case G_CON:
			pDph_t->pars[*pjcnt + 1].bouflag = TRUE;
			break;
		}							   /* switch */
	}								   /* switch */

	return (0);
}									   /* loop2 */

#endif


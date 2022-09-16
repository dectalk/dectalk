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
 *    File Name:	ls4.c
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
 * 01 21-Feb-85	DGC	Added some new code to deal with
 *					compound words. Look at the loop in "lts"
 *					that calls "allo1", "stress", "sylables".
 *					See how it breaks on boundries.
 * 02 26-Feb-85 DGC	Fixed a bug in the above new code. When
 *					you do a [*] or something like that, you
 *					have to clear the stress set flag.
 * 03 08-Apr-85 DGC	Display the new reduction block flag.
 * 04 29-May-85 DGC	Added "WATCH" code, to deal with the dreaded
 *					"assume" => [x'Sum] bug.
 * 05 18-Sep-85 DGC	Stylistic changes suggested by "lint".
 * 07 13-Jul-95 GL	change code to be same as ACNA code
 *					search 7/13/95 for inline comment
 *					add  S3 place holder in wpname[]
 * 08 22-Oct-96 GL  remove unused index mark handling code.
 * 09 01-Nov-96 GL	add ls_fold[] character folding to handle the multi-national
 *					character.  This implementation need to remove once we have
 *					add rule to handle these characters.	
 * 10 06-Nov-96	GL	Use IS_ALPHA() to check for the alphabet
 */

#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include	"lsdef.h"
#include "lsconst.h"
#include "lsacna.h"
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
#ifdef DIVIDED_LTS_RULES
short btabb(short n);
#define	wtab(n)		(lswtab[(n)]&0xFFFF)
//#define	btabb(n)	(lsbtab[(n)])
#define	btabw(n)	(((btabb((n)+1)&0xFF)<<8)|(btabb((n))&0xFF))

short btabb(short n)
{
	short ret=0;
	if (n<20000)
	{
		ret=lsbtab1[n];
	}
	else
	{
		n-=20000;
		ret=lsbtab2[n];
	}	
	return(ret);
}
	

#else
#define	wtab(n)		((unsigned short)lswtab[(n)]&0xFFFF)
#define	btabb(n)		((unsigned short)lsbtab[(n)]&0xFF)
#define	btabw(n)		(((unsigned short)lsbtab[(n)+1])<<8) |((unsigned short)(lsbtab[(n)]))
#endif

/* define to enable module debug. */
/*#define	WATCH*/
#ifdef ACNA
#define	LSBUMP	5				/* 4 word entries		*/
#else
#define	LSBUMP	4				/* 4 word entries		*/
#endif
extern	P_PIPE	kinp;			/* Pipe to Klatt synthesizer	*/
#define	showphone(a1,a2,a3)


typedef	struct GRAPH_struct	{
	short	g_graph;		/* Grapheme code		*/
	short	g_feats;		/* Set of features		*/
}	GRAPH;

short	rpart;				/* Rule: replacement		*/
short	rline;				/* Rule: line			*/
PHONE	*pflp;				/* Free list of "PHONE" nodes	*/
GRAPH	graph[NGWORD];			/* Array of encoded graphemes	*/

extern	GRAPH	*rulematch();		/* Match a rule			*/
extern	GRAPH	*envmatch();		/* Match an environment		*/
extern  int delete_geminate_pairs(void);

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
 */
lts(llp, rlp, def_lang, sel_lang)
LETTER	*llp;
LETTER	*rlp;
int def_lang;
int sel_lang;
{
	 GRAPH	*gp1;
	 GRAPH	*tgp1;
	 GRAPH	*gp2;
	 int	lch;
	 int	g;
	 PHONE	*pp1;
	 PHONE	*pp2;
	 PHONE	*pp3;
	 int	ssflag;
	 int	rsflag;
	 int	pstype;
//	int i;

#ifdef WATCH
	wputs("LTS: word = \"");
#endif	
	gp1 = &graph[0];


	while (llp < rlp) {
		/*
		   GL  11/01/1996, add folding table conversion to handle multi-national
		   character
		 */
		/*lch = llp->l_ch;*/		/* Convert to G-code	*/
		lch = ls_fold[llp->l_ch];
				
#ifdef WATCH
		wputc(lch);
#endif
		gp2 = gp1;
		/* GL 11/06/1996, use IS_ALPHA(c) to check for alphabet */
		if (IS_ALPHA(lch)) {
		/* if (lch>='a' && lch<='z') {*/
			if (addgraph(gp1, lch-'a'+GA) != FALSE)
				gp1+=1;
		} else if (lch == '\'') {
			if (addgraph(gp1, GQUOTE) != FALSE)
				gp1+=1;
		}
		tgp1 = &graph[0];
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
		llp+=1;
	}

#ifdef WATCH
	wputc('"');
	wcrlf();
#endif
	gp1->g_graph = GEOS;			/* End mark		*/
	gp1->g_feats = feats[GEOS];
	phead.p_fp = &phead;			/* Empty list		*/
	phead.p_bp = &phead;
	ssflag = FALSE;
	while (gp1 != &graph[0]) {
		gp2 = rulematch(gp1,def_lang,sel_lang);


		/*
		 * Collect up all index marks in the
		 * graphemes consumed by the rule that just
		 * matched, and put them in a big left-to-right
		 * list, for future use.
		 */

		pp1 = NULL;
		while (gp1 != gp2) {
			gp1-=1;
		}
		if (rpart != 0) {
			if (btabb(rpart) != GEOS) {
				while ((g=btabb(rpart++)) != GEOS) {    
					if (gp1 < &graph[NGWORD-1]
					&& addgraph(gp1, g) != FALSE)
						gp1+=1;
				}
				gp1->g_graph = GEOS;
				gp1->g_feats = feats[GEOS];
			} else
				rpart+=1;
			rsflag = FALSE;		/* Rep. sets stress.	*/
			g=btabb(rpart++);
			while ((g) != SIL) { 
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
					addphone(g&MSKPH, btabb(rpart++));
					}
				else
					{
					addphone(g, SIL);
					}
			g=btabb(rpart++);
			}
			if (rsflag != FALSE)
				ssflag = TRUE;
#ifdef	vms
			if (tflag != FALSE) {
				gp2 = &graph[0];
				while (gp2 != gp1) {
					putchar(gname[gp2->g_graph]);
					gp2+=1;
				}
				putchar('_');
				while (gp2->g_graph != GEOS) {
					putchar(gname[gp2->g_graph]);
					gp2+=1;
				}
				putchar('\n');
			}
#endif
		}

		/*
		 * This code handles the unusual case
		 * of index marks on graphemes that have no
		 * corresponding phonemes (like the silent
		 * "e" on the end of a word).
		 */
	}
#ifdef WATCH
	wphone(phead.p_fp, &phead, "lts");
#endif
	showphone(phead.p_fp, &phead, "lts");

        /*
        ** change 7/13/95 by GL. To make it same as acna code
        ** changes:
        ** 1). break stress() to a separate loop.
        ** 2). add delete_geminate_pairs ()
        **     between allo1()/syllable() and stress() loop.
        **     The orignal delete_geminate_pairs code in
        **     allo2() has been removed
        */
        pp1 = phead.p_fp;
        while (pp1 != &phead) {
                pp2 = pp1;
                pp3 = pp2->p_fp;
                while (pp3!=&phead && (pp3->p_flag&PFBOUND)==0)
                        pp3 = pp3->p_fp;

                allo1(pp2, pp3);
#ifdef  WATCH
                wphone(pp2, pp3, "allo1");
#endif
                showphone(pp2, pp3, "allo1");

                sylables(pp2, pp3);
#ifdef WATCH
                wphone(pp2, pp3, "sylables");
#endif
                showphone(pp2, pp3, "sylables");

                pp1 = pp3;
        }

        delete_geminate_pairs ();
        pstype = SPRI;                          /* Use primary stress.  */
        pp1 = phead.p_fp;
        while (pp1 != &phead) {
                pp2 = pp1;                      /* Find end of chunk.   */
                pp3 = pp2->p_fp;
                while (pp3!=&phead && (pp3->p_flag&PFBOUND)==0)
                        pp3 = pp3->p_fp;

                stress(pp2, pp3, pstype, sel_lang);        /* Mark stress. */
#ifdef WATCH
                wphone(pp2, pp3, "stress");
#endif
                showphone(pp2, pp3, "stress");

                pstype = SSEC;
                pp1 = pp3;
        }
        allo2();                                /* Allophonics, part 2  */
#ifdef WATCH
        wphone(phead.p_fp, &phead, "allo2");
#endif
        showphone(phead.p_fp, &phead, "allo2");

        return (0);
}

#ifndef	vms
/*
 * This is the output routine for the
 * letter to sound process. It is called after letter to
 * sound has processed its word, to write the generated phonemes
 * out to the synthesizer task. After a phoneme is written out,
 * any index marks in the index chain are written out. It is not
 * obvious why the "phead" can have an index chain. This happens
 * any time a block of grapemes, containing an index, in word
 * final position, generate no phonemes. All PHONE nodes are
 * returned to the free list via calls to "pfree".
 * This routine is not used on VMS.
 */

ltsout()
{
	 PHONE	*pp1;
	 PHONE	*pp2;
//	 PHONE	*pp3;
	 int	s;
//	short		buf[3];

	pp1 = phead.p_fp;
	while (pp1 != &phead) {
		if ((pp1->p_flag&PFDASH) != 0)	/* [+] is just a mark	*/
			sendphone(SBOUND);	/* for internal use.	*/
		if ((pp1->p_flag&PFSTAR) != 0)	/* Unlike other kinds	*/
			sendphone(MBOUND);	/* of boundry symbols,	*/
		if ((pp1->p_flag&PFHASH) != 0)	/* it does not get	*/
			sendphone(HYPHEN);	/* written out.		*/
		if ((pp1->p_flag&PFSYLAB) != 0)
			{
			s = pp1->p_stress;
			}
		if (s!=SUN && iscons(pp1)==FALSE) {
			if (s == SPRI)
				{
				sendphone(S1);
				}
			else if (s == SSEC)
				sendphone(S2);
			s = SUN;
		}
		sendphone(pp1->p_sphone);

/* GL 10/23/1996, remove unused index handling code */
#if 0
		pp2 = pp1->p_ip;
		while (pp2 != NULL) {
			buf[0] = (2<<PSNEXTRA) + pp2->p_itype;
			buf[1] = pp2->p_value;
			buf[2] = pp2->p_iret;
			write_pipe(kinp,&buf[0], 3);
			pp3 = pp2->p_ip;
			pfree(pp2);
			pp2 = pp3;
		}
#endif
		pp1 = pp1->p_fp;
	}
/* GL 10/23/1996, remove unused index handling code */
#if 0
	pp1 = phead.p_ip;
	while (pp1 != NULL) {
		buf[0] = (2<<PSNEXTRA) + pp1->p_itype;
		buf[1] = pp1->p_value;
		buf[2] = pp1->p_iret;
		write_pipe(kinp,&buf[0], 3);
		pp2 = pp1->p_ip;
		pfree(pp1);
		pp1 = pp2;
	}
#endif
	pp1 = phead.p_fp;
	while (pp1 != &phead) {
		pp2 = pp1->p_fp;
		pfree(pp1);
		pp1 = pp2;
	}
	return (0);
}
#endif

#ifdef	vms
/*
 * Display the phoneme chain,
 * along with a little title and the flags.
 * This is just a big nop if the "dflag" isn't set.
 * The calls to this in the "lts" mainline are just a
 * null body macro on the board.
 */
showphone(pp1, pp2, title)
 PHONE	*pp1;
 PHONE	*pp2;
char		*title;
{
	if (dflag == FALSE)			/* Not debugging.	*/
		return;
	printf("After %s:\n", title);
	while (pp1 != pp2) {			/* For the whole chain.	*/
		printf("%08X ", pp1);
		putchar('"');
		putchar(pname[pp1->p_sphone]);
		putchar(pname[pp1->p_uphone]);	/* pnames[SIL] = " "	*/
		putchar('"');
		if (pp1->p_flag!=0 || pp1->p_stress!=SNONE) {
			putchar(' ');
			if ((pp1->p_flag&PFDASH) != 0)
				putchar('-');
			else
				putchar(' ');
			if ((pp1->p_flag&PFSTAR) != 0)
				putchar('*');
			else
				putchar(' ');
			if ((pp1->p_flag&PFHASH) != 0)
				putchar('#');
			else
				putchar(' ');
			if ((pp1->p_flag&PFPLUS) != 0)
				putchar('+');
			else
				putchar(' ');
			if ((pp1->p_flag&PFSYLAB) != 0)
				putchar('S');
			else
				putchar(' ');
			if ((pp1->p_flag&PFRFUSE) != 0)
				putchar('R');
			else
				putchar(' ');
			if ((pp1->p_flag&PFLEFTC) != 0)
				putchar('L');
			else
				putchar(' ');
			if ((pp1->p_flag&PFBLOCK) != 0)
				putchar('B');
			else
				putchar(' ');
			if (pp1->p_stress == SUN)
				printf(" SUN");
			if (pp1->p_stress == SPRI)
				printf(" SPRI");
			if (pp1->p_stress == SSEC)
				printf(" SSEC");
			if (pp1->p_stress == S1LEFT)
				printf(" S1LEFT");
			if (pp1->p_stress == S2LEFT)
				printf(" S2LEFT");
		}
		putchar('\n');
		pp1 = pp1->p_fp;		/* Follow chain along	*/
	}
}
#endif 

#if	WATCH
/*
 * Debug routines for letter-to-sound on
 * the module. Used to find "assume" => [x'Sum].
 * Hope they fit, and don't make the bug
 * hide.
 */
extern	short	simage;				/* Switches.		*/

readonly					/* This table swiped	*/
char	wpname[] = {				/* from "lsread".	*/
        ' ',                            /* SIL                          */
        'i',                            /* IY                           */
        'I',                            /* IH                           */
        'e',                            /* EY                           */
        'E',                            /* EH                           */
        '@',                            /* AE                           */
        'a',                            /* AA                           */
        'A',                            /* AY                           */
        'W',                            /* AW                           */
        '^',                            /* AH                           */
        'c',                            /* AO                           */
        'o',                            /* OW                           */
        'O',                            /* OY                           */
        'U',                            /* UH                           */
        'u',                            /* UW                           */
        'R',                            /* RR                           */
        'Y',                            /* YU                           */
        'x',                            /* AX                           */
        '|',                            /* IX                           */
        '?',                            /* IR   (No translation)        */
        '?',                            /* ER   (No translation)        */
        '?',                            /* AR   (No translation)        */
        '?',                            /* OR   (No translation)        */
        '?',                            /* UR   (No translation)        */
        'w',                            /* W                            */
        'y',                            /* Y                            */
        'r',                            /* R                            */
        'l',                            /* LL                           */
        'h',                            /* HX                           */
        '?',                            /* RX   (No translation)        */
        '?',                            /* LX   (No translation)        */
        'm',                            /* M                            */
        'n',                            /* N                            */
        'G',                            /* NX                           */
        'L',                            /* EL                           */
        '?',                            /* D_DENTALIZED                 */
        'N',                            /* EN                           */
        'f',                            /* F                            */
        'v',                            /* V                            */
        'T',                            /* TH                           */
        'D',                            /* DH                           */
        's',                            /* S                            */
        'z',                            /* Z                            */
        'S',                            /* SH                           */
        'Z',                            /* ZH                           */
        'p',                            /* P                            */
        'b',                            /* B                            */
        't',                            /* T                            */
        'd',                            /* D                            */
        'k',                            /* K                            */
        'g',                            /* G                            */
        '&',                            /* DX                           */
        'Q',                            /* TX                           */
        'q',                            /* Q                            */
        'C',                            /* CH                           */
        'J',                            /* JH                           */

        '?',                            /* place holder 56 */
        '?',                            /* place holder 57 */
        '?',                            /* place holder 58 */
        '?',                            /* place holder 59 */
        '?',                            /* place holder 60 */
        '?',                            /* place holder 61 */
        '?',                            /* place holder 62 */
        '?',                            /* place holder 63 */
        '?',                            /* place holder 64 */
        '?',                            /* place holder 65 */
        '?',                            /* place holder 66 */
        '?',                            /* place holder 67 */
        '?',                            /* place holder 68 */
        '?',                            /* place holder 69 */
        '?',                            /* place holder 70 */
        '?',                            /* place holder 71 */
        '?',                            /* place holder 72 */
        '?',                            /* place holder 73 */
        '?',                            /* place holder 74 */
        '?',                            /* place holder 75 */
        '?',                            /* place holder 76 */
        '?',                            /* place holder 77 */
        '?',                            /* place holder 78 */
        '?',                            /* place holder 79 */
        '?',                            /* place holder 80 */
        '?',                            /* place holder 81 */
        '?',                            /* place holder 82 */
        '?',                            /* place holder 83 */
        '?',                            /* place holder 84 */
        '?',                            /* place holder 85 */
        '?',                            /* place holder 86 */
        '?',                            /* place holder 87 */
        '?',                            /* place holder 88 */
        '?',                            /* place holder 89 */
        '?',                            /* place holder 90 */
        '?',                            /* place holder 91 */
        '?',                            /* place holder 92 */
        '?',                            /* place holder 93 */
        '?',                            /* place holder 94 */
        '?',                            /* place holder 95 */
        '?',                            /* place holder 96 */
        '?',                            /* place holder 97 */
        '?',                            /* place holder 98 */
        '?',                            /* place holder 99 */
        '~',                            /* BLOCK_RULES                  */
        '?',                            /* S3                           */
        '?',                            /* S2                           */
        '?',                            /* S1                           */
        '?',                            /* SEMPH                        */
        '?',                            /* HAT_RISE                     */
        '?',                            /* HAT_FALL                     */
        '?',                            /* HAT_RF                       */
        '-',                            /* DASH         (SBOUND)        */
        '*',                            /* STAR         (MBOUND)        */
        '#',                            /* HASH         (HYPHEN)        */
        '?',                            /* WBOUND                       */
        '?',                            /* PPSTART                      */
        '?',                            /* VPSTART                      */
        '?',                            /* RELSTART                     */
        '=',                            /* EQUAL        (COMMA)         */
        '+',                            /* PLUS         (PERIOD)        */
        '?',                            /* QUEST                        */
        '?',                            /* EXCLAM                       */
        '?'                             /* NEW_PARAGRAPH                */
};

void wphone(PHONE *pp1, PHONE *pp2, char *title)
/*PHONE	*pp1;*/
/*PHONE	*pp2;*/
/*char		*title;*/
{
	if ((simage&NEX1) != 0)			/* Button up.		*/
		return;
	wputs("After ");			/* Title.		*/
	wputs(title);
	wcrlf();
	while (pp1 != pp2) {			/* For the whole chain.	*/
		wputc('"');
		wputc(wpname[pp1->p_sphone]);
		wputc(wpname[pp1->p_uphone]);	/* wpnames[SIL] = " "	*/
		wputc('"');
		if (pp1->p_flag!=0 || pp1->p_stress!=SNONE) {
			wputc(' ');
			if ((pp1->p_flag&PFDASH) != 0)
				wputc('-');
			else
				wputc(' ');
			if ((pp1->p_flag&PFSTAR) != 0)
				wputc('*');
			else
				wputc(' ');
			if ((pp1->p_flag&PFHASH) != 0)
				wputc('#');
			else
				wputc(' ');
			if ((pp1->p_flag&PFPLUS) != 0)
				wputc('+');
			else
				wputc(' ');
			if ((pp1->p_flag&PFSYLAB) != 0)
				wputc('S');
			else
				wputc(' ');
			if ((pp1->p_flag&PFRFUSE) != 0)
				wputc('R');
			else
				wputc(' ');
			if ((pp1->p_flag&PFLEFTC) != 0)
				wputc('L');
			else
				wputc(' ');
			if ((pp1->p_flag&PFBLOCK) != 0)
				wputc('B');
			else
				wputc(' ');
			if (pp1->p_stress == SUN)
				wputs(" SUN");
			else if (pp1->p_stress == SPRI)
				wputs(" SPRI");
			else if (pp1->p_stress == SSEC)
				wputs(" SSEC");
			else if (pp1->p_stress == S1LEFT)
				wputs(" S1LEFT");
			else if (pp1->p_stress == S2LEFT)
				wputs(" S2LEFT");
		}
		wcrlf();
		pp1 = pp1->p_fp;		/* Follow chain along	*/
	}
}

wcrlf()
{
	wputc('\r');
	wputc('\n');
}

wputs(s)
 char	*s;
{
	 int	c;

	while ((c = *s++) != 0)
		wputc(c);
}

wputc(c)
{
	if ((simage&NEX1) == 0)			/* X1 button down.	*/
		TTYPUTC(c);
}
#endif

/*
 * This routine is called to add a grapheme
 * to the graph array. There are two major cases.
 * Normally the new grapheme gets jammed into the slot
 * pointed to by "gp"; in this case the routine returns
 * TRUE, indicating that the caller should move its
 * cursor one grapheme to the right. However, if the new
 * grapheme is a vowel, and the two graphemes to the left
 * are "gu" or "qu", then the "gu" or "qu" are merged
 * into a new consonant graphme, and the new grapheme is
 * stored overtop of where the "u" used to be. The routine
 * returns FALSE in this case, to tell the caller that
 * the cursor does not move. Any index marks attached to
 * the "u" have to be appended to the index marks on
 * the "g". You are not expected to understand all
 * of this.
 */
addgraph(gp, g)
 GRAPH	*gp;
 int	g;
{
	 int	g1;
//	 PHONE	*pp;
	 int	value;

	if (isvowel(g) != FALSE			/* If a vowel		*/
	&& gp > &graph[1]			/* and 2 graphs to left	*/
	&&  (gp-1)->g_graph == GU		/* and first is "U"	*/
	&& ((gp-2)->g_graph == GG		/* and it's "GU"	*/
	||  (gp-2)->g_graph == GQ)) {		/* or "QU"		*/
		gp-=1;
		if ((gp-1)->g_graph == GG)
			(gp-1)->g_graph = GGU;
		else
			(gp-1)->g_graph = GQU;
/* GL 10/23/1996, remove unused index handling code */
#if 0
		if (gp->g_ip != NULL) {
			if ((pp=(gp-1)->g_ip) == NULL)
				(gp-1)->g_ip = gp->g_ip;
			else {
				while (pp->p_ip != NULL)
					pp = pp->p_ip;
				pp->p_ip = gp->g_ip;
			}
		}
#endif
		value = FALSE;
	} else
		value = TRUE;
	gp->g_graph = g;
#ifndef NO_INDEXES
	gp->g_ip = NULL;
#endif
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
	if (g == GY) {
		if (gp == &graph[0])		/* "Y" in word initial	*/
			gp->g_feats |= FCONS;	/* position is [+CONS]	*/
		else {
			gp->g_feats |= FVOC;	/* Rest are vowels	*/
			gp->g_feats |= FSYL;	/* and create sylables	*/
		}
	}
	if (gp != &graph[0]) {			/* If not word initial	*/
		g1 = (gp-1)->g_graph;		
		if ((g1==GS || g1==GC) && g==GH)
			gp->g_feats |= FSIB;
		else if (g1==GD && (g==GG || g==GJ))
			gp->g_feats |= FSIB;
		if ((gp->g_feats&FCONS)!=0 && g1==g)
			gp->g_feats |= FGEM;
		if (((gp-1)->g_feats&FSYL) != 0)
			gp->g_feats |= FSYL;
	}
	return (value);
}

/*
 * This routine tests if the grapheme
 * "g" is a vowel. The grapheme "y" is always a
 * vowel in this case. Used by the "gu" and "qu"
 * testing in "addgraph" only.
 */
isvowel(g)
 int	g;
{
	if (g==GA || g==GE || g==GI || g==GO || g==GU || g==GY)
		return (TRUE);
	return (FALSE);
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
 */
GRAPH	*
rulematch(gp1, def_lang, sel_lang)
 GRAPH	*gp1;
int def_lang;
int sel_lang;
{
	 unsigned int	rulep;
	 unsigned int	xrule;
	 GRAPH	*gp2;
	 unsigned int	nrule;
	 unsigned int	g;
    int	lang;
	 int	specific;

	gp1-=1;
	g = (gp1)->g_graph;
	rulep = wtab(2*g + 0);			/* Offset to rule	*/
	nrule = wtab(2*g + 1);			/* Number of rules	*/
	rpart = 0;				/* Assume we failed	*/
	while (nrule--) {
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
		   goto fail;
		else if (!specific && lang != def_lang && lang != sel_lang)
		   goto fail;

		/*
		 * END OF MODIFICATION.
		 */

		if ((xrule=wtab(rulep+1)) != 0) {
			while ((g=btabb(xrule++)) != GEOS) {
				if (gp2==&graph[0])
					goto fail;
				gp2-=1;
				if ((gp2)->g_graph!=g)
					goto fail;
			}
		}
		if ((xrule=wtab(rulep+4)) != 0	/* Right environment	*/
		&& envmatch(xrule, gp1, FORW) == NULL)
			goto fail;
		if ((xrule=wtab(rulep+3)) != 0	/* Left environment	*/
		&& envmatch(xrule, gp2, BACK) == NULL)
			goto fail;
#ifdef	vms
		rline = lswtab[rulep+5];	/* Line number of rule.	*/
		++lswtab[rulep+6];		/* Usage count of rule.	*/
#endif
		gp1 = gp2;			/* Move over the match	*/
		rpart = wtab(rulep+2);		/* Replacement		*/
		break;

#else
		if ((xrule=wtab(rulep+0)) != 0) {
			while ((g=btabb(xrule++)) != GEOS) {
				if (gp2==&graph[0] || (--gp2)->g_graph!=(signed short)g)
					goto fail;
			}
		}
		if ((xrule=wtab(rulep+3)) != 0	/* Right environment	*/
		&& envmatch(xrule, gp1, FORW) == NULL)
			goto fail;
		if ((xrule=wtab(rulep+2)) != 0	/* Left environment	*/
		&& envmatch(xrule, gp2, BACK) == NULL)
			goto fail;
#ifdef	vms
		rline = lswtab[rulep+4];	/* Line number of rule.	*/
		++lswtab[rulep+5];		/* Usage count of rule.	*/
#endif
		gp1 = gp2;			/* Move over the match	*/
		rpart = wtab(rulep+1);		/* Replacement		*/
		break;

#endif
	fail:
		rulep += LSBUMP;
	}

	return (gp1);
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
envmatch(ep1, gp, d)
 signed int	ep1;
 GRAPH	*gp;
 int	d;
{
	 unsigned int	ep2;
	 unsigned int	type;
	 unsigned int	npat;
	 unsigned int	mask;
	 unsigned int	test;
	 unsigned int	llim;
	 unsigned int	hlim;
	 GRAPH	*gp1;
	 unsigned int	ep3;

	npat = btabb(ep1++);
	ep2  = ep1 + npat;
	while (ep1 != ep2) {
		type = btabb(ep1++);
		if (type == GRANGE) {		/* Range of matches	*/
			llim = btabb(ep1++);	/* Low limit		*/
			hlim = btabb(ep1++);	/* High limit		*/
			while (llim--) {	/* Must match part	*/
				gp1 = envmatch(ep1, gp, d);
				if (gp1 == NULL)
					return (NULL);
				gp = gp1;
			}
			while (hlim--) {	/* Optional matches	*/
				gp1 = envmatch(ep1, gp, d);
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
				gp1 = envmatch(ep1, gp, d);
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
				gp+=1;
			} else {
				if (gp == &graph[0])
					return (NULL);
				gp-=1;
			}
			if ((gp->g_feats&mask) != test)
				return (NULL);	
		} else if (type == GMBOUND) {	/* Morpheme mark	*/
			if (d == FORW) {
				if (gp->g_graph == GEOS)
					return (NULL);
				if ((gp+1)->g_graph == GMBOUND)
					gp+=1;
				else if ((gp+1)->g_graph != 0)
					return (NULL);
			} else if (gp != &graph[0]) {
				gp-=1;
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
				gp+=1;
			} else {
				if (gp == &graph[0])
					return (NULL);
				gp-=1;
			}
			if (gp->g_graph != type)
				return (NULL);
		}
	}
	return (gp);
}

/*
 * Append a phoneme to the chain.
 * Pass the stressed and unstressed
 * phoneme values as parameters. The new
 * PHONE is allocated using "palloc".
 * Set the flags to 0 and the stress to
 * unknown. Just NOP if you run out
 * of phoneme nodes.
 */
addphone(sph, uph)
int sph,uph;
{
	 PHONE	*fp;
	 PHONE	*pp;
	if ((pp=(PHONE *)palloc()) != NULL) {
		fp = phead.p_fp;		/* Link to front of the	*/
		phead.p_fp = pp;		/* generated PHONE list	*/
		pp->p_fp   = fp;
		fp->p_bp   = pp;
		pp->p_bp   = &phead;
#ifndef NO_INDEXES
		pp->p_ip   = NULL;		/* No index chain	*/
#endif
		pp->p_flag = 0;
		pp->p_sphone = sph;
		pp->p_uphone = uph;
		pp->p_stress = SNONE;
	}
	return (0);
}

/*
 * Allocate a new
 * phoneme from the list of
 * free phoneme nodes. Return a
 * pointer to the new node,
 * or NULL if there are no nodes
 * left in the free list.
 */ 
PHONE *palloc(void)
{
	 PHONE	*pp;

	if ((pp=pflp) != NULL)
		pflp = pp->p_fp;
	return (pp);
}

/*
 * Put a phoneme node back
 * onto the list of free phoneme
 * nodes, for use by "palloc".
 */
pfree(pp)
 PHONE	*pp;
{
	pp->p_fp = pflp;
	pflp = pp;
	return (0);
}
/*
 * NOTE:  This code was segregated from allo2().  TJV has determined
 * the it would be better to do geminate delete between syllabification
 * and stress analysis.
 *
 * Delete geminate
 * pairs. There are some special pairs
 * (like [l] and [L]) that get deleted even if
 * there is a morpheme boundry between them. This
 * rule may be backwards; all pairs may delete
 * across the boundry except stops (mid-day).
 * The header block has "p_sphone" set to "SIL",
 * so the first phoneme works fine.
 */

int delete_geminate_pairs ()
{
	register PHONE	*pp1;
	register int	ph1;
	register int	ph2;

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
	return 0;
}

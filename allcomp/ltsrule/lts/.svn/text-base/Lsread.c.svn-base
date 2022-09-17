/***********************************************************************
**
**  Copyright (c) Digital Equipment Corporation, 1995, 1996
**
**    All Rights Reserved.  Unpublished rights  reserved  under
**    the copyright laws of the United States.
**
**    The software contained on this media  is  proprietary  to
**    and  embodies  the  confidential  technology  of  Digital
**    Equipment Corporation.  Possession, use,  duplication  or
**    dissemination of the software and media is authorized only
**    pursuant to a valid written license from Digital Equipment
**    Corporation.
**
** NAME OF FILE
**    lsread.c
**
** DESCRIPTION
**    The routines in this file
**    read in letter to sound rules, and
**    build the internal structures. They are
**    used by "lts" on the VAX, and by the
**    rule compilation program.
**
**
**
**
** REVISION HISTORY:
**
**  Who            Date            Description of change
**  -------------------------------------------------------------
**  G. Lin         6/26/95         initial code based on old lsread.c
**  G. Lin         9/29/95         add UK_english support
**
**
*/

/*
** Global include header files
*/

/*
** Local include header files
*/

#if VMS
#define far
#define _far
#define __far
#include	"vms_port.h"
#else
#include	"port.h"
#endif

#if defined (VMS) || defined (LDS_BUILD)
#define _ffree free
#define _fmalloc malloc
#define _fstrcmp strcmp
#endif

#include	"lts_util.h"
#include	"lts_rule.h"
#include	"lts_lang.h"

#ifdef ACNA
#include        "vox$acna.h"            /* ACNA header                  */
#endif

#ifdef GERMAN
#include "l_all_ph.h"
#define GEOS GGEOS
#define GWBOUND GGWBOUND
#define GFEAT GGFEAT
#define GDISJ GGDISJ
#define GRANGE GGRANGE
#define NGRAPH GNGRAPH
#endif

/*
**  Global variable declaration
*/

extern unsigned char	lsbtab[NBTAB];		/* Byte array.			*/
extern unsigned char	*lsbp;			/* Work pointer into above.	*/
extern unsigned short	lswtab[NWTAB];		/* Word array.			*/
extern unsigned short 	*lswp;			/* Work pointer into above.	*/
extern unsigned int     lsb_size;
extern unsigned int     lsw_size;
extern unsigned int     line;
extern int     laflag;
extern int     gflag;
extern int     yflag;

/*
 * Grapheme name table.
 * Indexed by grapheme code. Contains
 * the one character name of the
 * grapheme.
 * will be loaded the language Graphem.
 */
char	gname[GNAME_SIZE];
/*
 * Phoneme name table.
 * Indexed by phoneme code. Contains
 * the one character name for the phoneme.
 * will be loaded the language Phoneme
 */
char	pname[PNAME_SIZE];

/* use GNGRAPH instead of NGRAPH since GNGRAPH > NGRAPH */
/* change NGRAPH to a runtime variable declared in lts.c  */
RULE *lsrule[GNGRAPH];
extern unsigned int     ngraph;

/* language tag to support the ACNA */
#ifdef VMS
static readonly char *language_tag[] =
#else
static const char *language_tag[] =
#endif
   {
   "EN", "FR", "GE", "IR", "IT", "JA", "SL", "SP"
   };
#define NO_OF_LANG      (sizeof (language_tag) / sizeof (char *))

/*
**  Function declaration
*/

static void fatal(char *message);


/*
 * Compile rules. Leave the result in the
 * "lswtab" (words) and "lsbtab" (bytes) array.
 * This code is not reusable in the least.
 * If you call it twice, you will die. It also
 * could release the RULE chains, but it doesn't
 * bother to do so.
 */


void lsread()
{
	char	_far	*bp;
	char	_far *cp;
	char	c;
	RULE	_far *rp1;
	RULE	_far *rp2;
	RULE	_far *rp3;
	ENODE	_far	*ep;
	char	gx;
	int	nrule;
	char 	p1;
	char	p2;
	int	i;
	char buf[NBUF];
        int    lang_tag;

#if 0
	lsbtab = (char _far *)_fmalloc(NBTAB);			/* Byte array.			*/
	lswtab = (short _far *)_fmalloc(NWTAB);			/* Word array.			*/
#endif
	/* load the language pname[] and gname[] */
	for (i=0; i<GNAME_SIZE; ++i)
	{
	    if (laflag == LTS_ENGLISH) gname[i] = egname[i];
	    if (laflag == LTS_GERMAN)  gname[i] = ggname[i];
	    if (laflag == LTS_FRENCH)  gname[i] = fgname[i];
	    if (laflag == LTS_SPANISH) gname[i] = sgname[i];
            if (laflag == LTS_ENGLISH_UK) gname[i] = egname[i];
	    if (gname[i] == '#') break;
	}
	for (i=0; i<PNAME_SIZE; ++i)
	{
	    if (laflag == LTS_ENGLISH) pname[i] = epname[i];
	    if (laflag == LTS_GERMAN)  pname[i] = gpname[i];
	    if (laflag == LTS_FRENCH)  pname[i] = fpname[i];
	    if (laflag == LTS_SPANISH) pname[i] = spname[i];
            if (laflag == LTS_ENGLISH_UK) pname[i] = uk_epname[i];
	    if (pname[i] == ' ' && i > 1) break;
	}


	lsb_size = 0;
	lsw_size = 0;
	for(i=0;i<ngraph;i++)
		lsrule[i] = NULL_FP;

	nrule = 0;
	line  = 1;
	lsbtab[0] = 0;				/* Avoid entry "0"	*/
	lsbp = &lsbtab[1];
loop:
	if ((c=getnb(TRUE)) == EOF) {		/* Start of rule	*/
		lspack();			/* and pack the tables.	*/
		return;
	}
	bp = &buf[0];				/* Grapheme part	*/

#ifdef ACNA
	if (gflag == LTS_ACNA || yflag == TRUE)
	{
           /*
            * See if a language tag was specified for the rule.  If not,
            * the tag defaults to EN (American-English;  the original
            * American-English letter-to-sound rules are now considered
            * to be generic rules).
            */

           if (c == ':')
           {
              char *valid_tag;

              /*
               * Language tag has been identified.  Get the rest of the
               * tag, interpret, and validate it.
               */
              p1 = getnb (FALSE);
              p2 = getnb (FALSE);
              for (lang_tag=0; lang_tag<NO_OF_LANG; lang_tag++)
              {
                 valid_tag = language_tag[lang_tag];
                 if (p1 == (int) valid_tag[0] &&  p2 == (int) valid_tag[1])
                 break;
              }

              if (lang_tag == NO_OF_LANG)
                 fatal ("invalid language tag specified for rule");
              c = getnb (FALSE);
              if (c == '+')
              {
                 lang_tag |= M_R_SPECIFIC;
                 c = getnb (FALSE);
              }
           }
           else
           lang_tag = VOX$K_ENGLISH;
	}
#endif /* ACNA */


        /*
         * Grapheme part.
         */

	while (c!=EOF && c!='\n' && c!='>') {
		if (c != '*') {
			gx = 0;
			while (gx<ngraph && gname[gx]!=c)
				++gx;
			if (gx == ngraph)
			{
				printf("-->%c\n",c);
				fatal("illegal grapheme");
			}
			if (bp >= &buf[NBUF-1])
				fatal("grapheme part too long");
			*bp++ = gx;
		}
		c = getnb(FALSE);
	}
	if (c != '>')
		fatal("missing \">\"");
	if (bp == &buf[0])
		fatal("grapheme part empty");
	++nrule;				/* New RULE block	*/
	if ((int)(rp1 = (RULE _far *)_fmalloc(sizeof(RULE))) == (int)NULL_FP)
		fatal("out of space");
	gx = *--bp;
	rp2 = NULL_FP;
	rp3 = lsrule[gx];
	while ((int)rp3 != (int)NULL_FP) {
		rp2 = rp3;
		rp3 = rp3->r_rulep;
	}
	if ((int)rp2 == (int)NULL_FP)
		lsrule[gx] = rp1;
	else
		rp2->r_rulep = rp1;
	rp1->r_rulep  = NULL_FP;		/* Fill in new rule	*/

#ifdef ACNA
	if (gflag == LTS_ACNA || yflag == TRUE)
	{
           rp1->r_lang     = lang_tag;          /* Language tag         */
    }
#endif
	rp1->r_line   = line;			/* Line number		*/
	rp1->r_graphp = NULL_FP;		/* Replacement parts	*/
	rp1->r_phonep = NULL_FP;
	rp1->r_leftp  = NULL_FP;
	rp1->r_rightp = NULL_FP;
	if (bp != &buf[0]) {			/* Grapheme stuff	*/
		rp1->r_graphp = lsbp;
		do {
			savebyte(*--bp);
		} while (bp != &buf[0]);
		savebyte(GEOS);
	}
	bp = &buf[0];				/* Replacement part	*/
	while ((c=getnb(FALSE))!=EOF && c!='\n' && c!='/') {
		if (bp >= &buf[NBUF-1])
			fatal("replacement too long");
		*bp++ = c;
	}
	if (c == EOF)
		fatal("end of file");
	if (bp != &buf[0]) {
		rp1->r_phonep = lsbp;		/* Replacement address	*/
		cp = &buf[0];			/* Grapheme replacement	*/
		while (cp!=bp && *cp!='[') {	/* goes left to right	*/
			gx = 0;
			while (gx<ngraph && gname[gx]!=*cp)
				++gx;
			if (gx == ngraph)
			{
				printf("-->%c\n",*cp);
				fatal("illegal grapheme in replacement");
			}
			savebyte(gx);
			++cp;
		}
		savebyte(GEOS);			/* Mark end of graph.	*/
		while (bp != cp) {		/* Phoneme replacement	*/
			if (*--bp!=']' || bp==cp)
				fatal("botch in ]");
			if ((p1 = *--bp) != '[') {
				if (bp == cp)
					fatal("botch in [ ]");
				if ((p2 = *--bp) != '[') {
					savebyte((char)(ptrans(p2)|TWOPH));
					savebyte(ptrans(p1));
					if (bp==cp || *--bp!='[')
						fatal("botch in [");
				} else
					savebyte(ptrans(p1));
			}
		}
		savebyte(SIL);			/* End of rule		*/
	}
	if (c == '/') {				/* Environment		*/
		ep = ecompile();
		if ((c=getnb(FALSE)) == '-') {
			if ((int)ep != (int)NULL_FP) {
#ifdef	DEBUG_LTS2
				if (dflag != FALSE)
					edump("L", ep, 0);
#endif
				rp1->r_leftp = epack(ep, BACK);
#ifdef	DEBUG_LTS2
				if (dflag != FALSE)
					pdump("L", rp1->r_leftp);
#endif
			}
			ep = ecompile();
			c  = getnb(FALSE);
		}
		if ((int)ep != (int)NULL_FP) {	
#ifdef	DEBUG_LTS2
			if (dflag != FALSE)
				edump("R", ep, 0);
#endif
			rp1->r_rightp = epack(ep, FORW);
#ifdef	DEBUG_LTS2
			if (dflag != FALSE)
				pdump("R", rp1->r_rightp);
#endif
		}
	}
	if (c != '\n')
		fatal("junk on end of line");
	goto loop;
}
/*
 * Compile an environment
 * into a list of "ENODE" structures.
 * These are always forward direction
 * lists; the packer (epack) will put
 * the data out in the right sense;
 * "FORW" or "BACK".
 */

ENODE	_far *ecompile()
{
	char c;
	int	n;
	ENODE	_far *ep1;
	ENODE	_far *ep2;
	ENODE	_far *ep3;
	ENODE	_far *ep4;
	char gx;

	ep1 = NULL_FP;
	for (;;) {
		if ((c=getnb(FALSE)) == '#') {	/* Word boundry		*/
			ep2 = (ENODE _far *)_fmalloc(sizeof(ENODE));
			if ((int)ep2 == (int)NULL_FP)
				fatal("out of space (ecompile)");
			if (laflag == LTS_GERMAN)
			   ep2->e_type = GGWBOUND;
			else
			   ep2->e_type = GWBOUND;
		} else if (c == '[')		/* Feature		*/
			ep2 = efeature();
		else if (c == '{')		/* Disjunction		*/
			ep2 = edisjunc();
		else {				/* Plain grapheme	*/
			gx = 0;
			while (gx<ngraph && gname[gx]!=c)
				++gx;
			if (gx == ngraph) {	/* Unknown		*/
				unget(c);
				return (ep1);
			}
			ep2 = (ENODE _far *)_fmalloc(sizeof(ENODE));
			if ((int)ep2 == (int)NULL_FP)
				fatal("out of space (ecompile)");
			ep2->e_type = gx;
		}
		ep2->e_llim = 0;		/* Default values	*/
		ep2->e_hlim = 0;
		if ((c=getnb(FALSE)) == '<') {	/* If repeat count	*/
			n = 0;
			while ((c=getnb(FALSE))>='0' && c<='9')
				n = 10*n + c - '0';
			ep2->e_llim = n;
			if (c != '-')
				fatal("missing \"-\" in range");
			if ((c=getnb(FALSE))=='n' || c=='N') {
				n = 100;
				c = getnb(FALSE);
			} else {
				n = c-'0';
				while ((c=getnb(FALSE))>='0' && c<='9')
					n = 10*n + c - '0';
			}
			ep2->e_hlim = n;
			if (c != '>')
				fatal("missing \">\" in range");
		} else
			unget(c);
		ep3 = NULL_FP;			/* Append new ENODE	*/
		ep4 = ep1;
		while ((int)ep4 != (int)NULL_FP) {
			ep3 = ep4;
			ep4 = ep4->e_nextp;
		}
		if ((int)ep3 == (int)NULL_FP)
			ep1 = ep2;
		else
			ep3->e_nextp = ep2;
		ep2->e_nextp = NULL_FP;
	}
}
/*
 * Compile a feature match
 * node. Build up the "mask" and
 * "test" bitfields, and stack them
 * in the node. Return a pointer to
 * the node.
 */
ENODE _far *efeature()
{
	char c;
	int	sign;
	ENODE	_far *ep;
	char	_far *cp;
	int	bits;
	int	mask;
	int	test;
	char		fname[NFNAME];

	mask = 0;
	test = 0;
	do {
		if ((sign=getnb(FALSE))!='+' && sign!='-')
			fatal("missing \"+\" or \"-\" in feature");
		cp = &fname[0];
		while (isalpha(c=getnb(FALSE)) != FALSE) {
			if (cp < &fname[NFNAME-1]) {
				if (islower(c) != FALSE)
					c = (char)toupper(c);
				*cp++ = c;
			}
		}
		*cp = '\0';
		bits = featbits(fname);
		mask |= bits;
		if (sign == '+')
			test |= bits;
	} while (c == ',');
	if (c != ']')
		fatal("missing \"]\" in feature");
	ep = (ENODE _far *)_fmalloc(sizeof(ENODE));
	if ((int)ep == (int)NULL_FP)
		fatal("out of space (efeature)");
	if (laflag == LTS_GERMAN)
	  ep->e_type = GGFEAT;
	else
	  ep->e_type = GFEAT;
	ep->e_mask = mask;
	ep->e_test = test;
	return (ep);
}
/*
 * Turn a name into a
 * feature bit set. This should
 * be table driven. It isn't.
 * Fix it someday.
 */

short featbits(s)
char _far	*s;
{
	if (_fstrcmp(s, "SEG") == 0)
		return (FSEG);
	if (_fstrcmp(s, "VOC") == 0)
		return (FVOC);
	if (_fstrcmp(s, "CONS") == 0)
		return (FCONS);
	if (_fstrcmp(s, "HIGH") == 0)
		return (FHIGH);
	if (_fstrcmp(s, "VOICE") == 0)
		return (FVOICE);
	if (_fstrcmp(s, "LIQ") == 0)
		return (FLIQ);
	if (_fstrcmp(s, "SIB") == 0)
		return (FSIB);
	if (_fstrcmp(s, "VELAR") == 0)
		return (FLTSVELAR);
	if (_fstrcmp(s, "NAS") == 0)
		return (FNAS);
	if (_fstrcmp(s, "GEM") == 0)
		return (FGEM);
	if (_fstrcmp(s, "COR") == 0)
		return (FCOR);
	if (_fstrcmp(s, "C") == 0)
		return (FC);
	if (_fstrcmp(s, "L") == 0)
		return (FL);
	if (_fstrcmp(s, "X") == 0)
		return (FX);
	if (_fstrcmp(s, "R") == 0)
		return (FR);
	if (_fstrcmp(s, "SYL") == 0)
		return (FSYL);
	fatal("unknown feature");
}
/*
 * Compile a disjunction.
 * This is just a loop the calls
 * the "ecompile" routine recursively.
 * Pointers to the lists are saved in
 * a big array. The "ENODE" is allocated
 * after you know how many there are.
 */
ENODE	_far *edisjunc()
{
	ENODE	_far *ep;
	ENODE _far *djunc[NDJUNC];

	int	c;
	int	i;
	int	ndjunc;

	ndjunc = 0;
	do {
		if (ndjunc >= NDJUNC)
			fatal("disjunction too large");
		djunc[ndjunc++] = ecompile();
	} while ((c=getnb(FALSE)) == ',');
	if (c != '}')
		fatal("missing \"}\" in disjunction");
	ep = (ENODE _far *)_fmalloc(sizeof(ENODE)+(ndjunc+1)*sizeof(ENODE _far *));
	if ((int)ep == (int)NULL_FP)
		fatal("out of space (edisjunc)");
	if (laflag == LTS_GERMAN)
	  ep->e_type = GGDISJ;
	else
	  ep->e_type = GDISJ;
	for (i=0; i<ndjunc; ++i)
		ep->e_djunc[i] = (short _far *)djunc[i];
	ep->e_djunc[i] = (short _far *)NULL_FP;
	return (ep);
}
/*
 * Pack an ENODE into the
 * memory array. Return a pointer to
 * the length byte at the start. The "d"
 * argument is either "FORW" or "BACK";
 * the list may be compiled backwards.
 * This is used by left context.
 */
char _far 	*epack(ep, d)
ENODE	_far *ep;
short d;
{
	 ENODE _far *ep1;
	 ENODE _far *ep2;
	 unsigned char	_far *lenp;
	 unsigned char	_far *dlenp;
	 int	len;
	 int	i;

	if (d == BACK) {			/* Flip it around	*/
		ep1 = ep->e_nextp;
		ep->e_nextp = NULL_FP;
		while ((int)ep1 != (int)NULL_FP) {
			ep2 = ep1->e_nextp;
			ep1->e_nextp  = ep;
			ep  = ep1;
			ep1 = ep2;
		}
	}
	savebyte(PATCHED);
	lenp = lsbp;
	while ((int)ep != (int)NULL_FP) {
		ep1 = ep->e_nextp;
		if (ep->e_llim!=0 || ep->e_hlim!=0) {
			if (laflag == LTS_GERMAN)
			   savebyte(GGRANGE);
			else
			   savebyte(GRANGE);
			savebyte((char)ep->e_llim);
			savebyte((char)(ep->e_hlim-ep->e_llim));
			ep->e_nextp = NULL_FP;
			ep->e_llim  = 0;
			ep->e_hlim  = 0;
			epack(ep, d);
		} else {
			savebyte((char)ep->e_type);

			if (laflag == LTS_GERMAN)
			{
			  if (ep->e_type == GGFEAT)
			  {
				savebyte((char)ep->e_mask);
				savebyte((char)(ep->e_mask >> 8));
				savebyte((char)ep->e_test);
				savebyte((char)(ep->e_test >> 8));
			  }
			  else if (ep->e_type == GGDISJ) 
			  {
				savebyte(PATCHED);
				dlenp = lsbp;
				for (i=0; (int)(ep2=(ENODE _far *)ep->e_djunc[i])!=(int)NULL_FP; ++i)
					epack(ep2, d);
				if ((len=lsbp-dlenp) > 255)
					fatal("disjunction body too big");
				*--dlenp = (char)len;
			  }
			}
			else
			{
			  if (ep->e_type == GFEAT)
			  {
				savebyte((char)ep->e_mask);
				savebyte((char)(ep->e_mask >> 8));
				savebyte((char)ep->e_test);
				savebyte((char)(ep->e_test >> 8));
			  }
			  else if (ep->e_type == GDISJ) 
			  {
				savebyte(PATCHED);
				dlenp = lsbp;
				for (i=0; (int)(ep2=(ENODE _far *)ep->e_djunc[i])!=(int)NULL_FP; ++i)
					epack(ep2, d);
				if ((len=lsbp-dlenp) > 255)
					fatal("disjunction body too big");
				*--dlenp = (char)len;
			  }
			}

			_ffree(ep);
		}
		ep = ep1;
	}
	if ((len=lsbp-lenp) > 255)
		fatal("environment body too big");
	*--lenp = (char)len;
	return (lenp);
}
/*
 * Display a list of ENODE,
 * for debugging. The top level call
 * has "indent" set to 0. This indent
 * level is to make disjunctions readable
 * by humans.
 */

#ifdef	DEBUG_LTS2

void edump(title, ep, indent)
char _far *title;
ENODE	_far *ep;
short indent;
{
	 ENODE	_far *ep1;
	 int	i;

	if ((int)title != (int)NULL_FP) {
		for (i=0; i<indent; ++i)
			putchar(' ');
		printf("Edump: %s\n", title);
	}
	while ((int)ep != (int)NULL_FP) {
		for (i=0; i<indent; ++i)
			putchar(' ');
		putchar('"');
		/* The "gname" array has extra stuff on the end		*/
		putchar(gname[ep->e_type]);
		putchar('"');
		if (ep->e_llim!=0 || ep->e_hlim!=0)
			printf(" <%d-%d>", ep->e_llim, ep->e_hlim);
		if (laflag == LTS_GERMAN)
		{
		  if (ep->e_type == GGFEAT) 
		  {
			printf(" Mask=%04X", ep->e_mask&0xFFFF);
			printf(" Test=%04X", ep->e_test&0xFFFF);
		  }
		  putchar('\n');
		  if (ep->e_type == GGDISJ) 
		  {
			for (i=0; (int)(ep1=(ENODE _far *)ep->e_djunc[i])!=(int)NULL_FP; ++i)
				edump(NULL_FP, ep1, indent+4);
		  }
		}
		else
		{
		  if (ep->e_type == GFEAT) 
		  {
			printf(" Mask=%04X", ep->e_mask&0xFFFF);
			printf(" Test=%04X", ep->e_test&0xFFFF);
		  }
		  putchar('\n');
		  if (ep->e_type == GDISJ) 
		  {
			for (i=0; (int)(ep1=(ENODE _far *)ep->e_djunc[i])!=(int)NULL_FP; ++i)
				edump(NULL_FP, ep1, indent+4);
		  }
		}
		ep = ep->e_nextp;
	}
	for (i=0; i<indent; ++i)
		putchar(' ');
	putchar('.');
	putchar('\n');
}

#endif

/*
 * Dump a pattern. The "title"
 * is a string. The "patp" points to a
 * pattern body, with a count on the front.
 * Dump the bytes in hex, 16 per line.
 */

#ifdef DEBUG_LTS2

void pdump(title, patp)
char	_far *title;
char	_far *patp;
{
	 int	npat;
	 int	nbol;

	npat = *patp++ & 0xFF;
	printf("Pdump: %s, length=%d\n", title, npat);
	nbol = 0;
	while (npat--) {
		if (nbol == 16) {
			putchar('\n');
			nbol = 0;
		} else if (nbol != 0)
			putchar(' ');
		printf("%02X", *patp++ & 0xFF);
		++nbol;
	}
	if (nbol != 0)
		putchar('\n');
}
#endif
/*
 * The character "p" is a one
 * character phoneme name. Translate this
 * into phoneme code, and return the code. Used to
 * translate the replacement parts of rules.
 */
char ptrans(p)
char p;
{
	char ph;

	/* ['] is SPRI, [0] is SUN */	
	if (laflag == LTS_GERMAN)
	{
	   if (p == '\\')				/* These are not	*/
		return ((char)(SNONE));	/* 0 in US */ /* in the table. point to SUN	*/
	   if (p == '0')				/* These are not	*/
		return ((char)(SUN));	/* 1 in US */ /* in the table. point to SUN	*/
	   if (p == '`')				/* These are not	*/
		return ((char)(SSEC)); /* 2 in US */	/* in the table. point to SSEC	*/
	   if (p == '\'')				/* These are not	*/
		return ((char)(SPRI)); /* 3 in US */	/* in the table. point to SPRI	*/
	   if (p == '{')				/* These are not	*/
		return ((char)(S1LEFT));	/* 4 in US */ /* in the table. point to SUN	*/
	   if (p == '(')				/* These are not	*/
		return ((char)(S2LEFT));	/* 5 in US */ /* in the table. point to SUN	*/
	}
	else
	{
	   if (p>='0' && p<='5')			/* These are not	*/
		return ((char)(p - '0' + SNONE));	/* in the table.	*/
	}
	
	ph = 0;
	while (ph<=NPHONE && pname[ph]!=p)
		++ph;
	if (ph > NPHONE)
	{
		printf("-->%c\n",p);
		fatal("illegal phoneme");
	}
	return (ph);
}
/*
 * Pack the rules into the
 * word array. Called once, at end
 * of file. Make sure that the table
 * holding the bytes is an even number
 * of bytes long.
 */
void lspack()
{
	 RULE	_far *rp;
	 int	i;
	 int	n;

	if (((lsbp-lsbtab)&0x01) != 0)	/* Make even		*/
		savebyte(0);
	lswp = &lswtab[2*ngraph];
	lsw_size = 2*ngraph;
	for (i=0; i<ngraph; ++i)
		{
		if ((int)(rp=lsrule[i]) == (int)NULL_FP)
			lswtab[2*i+0] = 0x0000;
		else
			lswtab[2*i+0] = lswp-lswtab;
		n = 0;
		while ((int)rp != (int)NULL_FP)
			{
			++n;
#ifdef ACNA
			if (gflag == LTS_ACNA || yflag == TRUE)
			{
                           if (lswp >= &lswtab[NWTAB-1])
                              fatal ("out of space in lswtab array");
                           *lswp++ = rp->r_lang;
			}
#endif
			saveword((unsigned char *)rp->r_graphp);
			saveword((unsigned char *)rp->r_phonep);
			saveword((unsigned char *)rp->r_leftp);
			saveword((unsigned char *)rp->r_rightp);
                        /* GL 6/25/1995 add this code to handle the
                           line number and usage count. will be used in
                           lts() of ls4 for test information.
			   If gflag is LTS_ACNA or LTS_NO_ACNA then this routine is called
			   to generate the rule table file dectalk PC.
			   The r_line and r_count should not be in this
			   file.
			*/
			if (gflag == FALSE)
			{
                            if (lswp >= &lswtab[NWTAB-1])
				fatal("out of space in lswtab array");
			    *lswp++ = rp->r_line;
			    *lswp++ = rp->r_count = 0;
			}

			rp = rp->r_rulep;
			}
		lswtab[2*i+1] = n;
		}		
}
/*
 * The "bp" is either NULL,
 * or an addrees into the "lsbtab" array.
 * Store either a 0, or the offset in the
 * "lsbtab" array. Abort if the
 * "lswtab" overflows.
 */

void saveword(bp)
unsigned char 	_far *bp;
{
	if (lsw_size > NWTAB)
		fatal("out of space in lswtab array");
	if ((int)bp == (int)NULL_FP)
		*lswp++ = 0x0000;
	else
		*lswp++ = bp-lsbtab;
	lsw_size+=2;
}

/*
 * Stash a byte in the
 * memory array. Die of there
 * isn't any space.
 */
void savebyte(b)
char b;
{
	if (lsb_size >= NBTAB)
		fatal("out of space in lsbtab array");
	*lsbp++ = b;
	lsb_size++;
}
/*
 * This is like "get",
 * but it eats blanks and tabs.
 * It eats newlines too if the "flag"
 * is true.
 */

char getnb(flag)
int	flag;
{
	char	c;

	while ((c=get())==' ' || c=='\t' || (flag!=FALSE && c=='\n'))
		;
	return (c);
}
/*
 * Get a character.
 * Honour the ";" comment
 * convention. Bump the "line"
 * counter on newlines.
 */
char get(void)
{
	char	c;

	c = (char)getc(ltsFile);
	if (c == ';') {
		while ((c=(char)getc(ltsFile))!=EOF && c!='\n')
			;
	}
	if (c == '\n')
		++line;
	return (c);
}

/*
 * Unget a character.
 * Fix line.
 */
void unget(c)
char c;
{
	ungetc(c, ltsFile);
	if (c == '\n')
		--line;
}
static void fatal(char *message)
{

    printf("**fatal error! %s at line %d . Program aborted\n",message,line);
    exit(1);
}

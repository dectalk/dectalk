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
 *    File Name:	ls2.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 * Heuristic output routines
 * used by letter to sound to speak
 * numbers, part numbers, and other more
 * complex items. Simple stuff tends to be
 * in the "ls1.c" file.
 *
 ***********************************************************************
 *    Revision History:
 * 01 02-May-85	DGC	Added code to float the "and" along
 *			in numbers line "1001".
 * 02 14-Jun-85 DGC	New support for the single word multinational
 *			characters; changes to "dosign" and "donumber".
 * 03 20-Jun-85 DGC	There was a piece of code in the "isfrac"
 *			routine that was commented out; it only allowed
 *			"100" if the denominator was 3 digits. The
 *			comments were removed to make the unit agree
 *			with the manual.
 * 04 18-Sep-85 DGC	Fixed a typo that was found by "lint".
 * ----------------	C5005 V1.0
 * ----------------	C5005 V1.1
 * 05 26-Jun-87	DGC	Changes to the part number rules for the
 *			Kurzweil.
 * 06 15-FEB-96 CJL	Removed all KRM code.
 * 07 16-FEB-96	EAB 	Time never worked correctly xx:00PM failed.
 *						Now fixed.
 * 08 23-MAY-96 GL    	Added support for billion trillion and quadrillion
 * 09 06-Nov-96	GL		Use IS_ALPHA() to check for alphabet.
 */

#ifdef	SIMULATOR
#define	__far
#define	_far
#define far
#endif

#include	"lsdef.h"
#include	"lsconst.h"
/*#define LS2DEBUG 1 */
//extern	short	fchar;			/* "." in USA, "," in Europe.	*/
//extern	short	schar;			/* "," in USA, "." in Europe.	*/

#ifndef CALLER_ID
/*
 * Speak a "sign" like character, followed
 * by a word boundry. The "-" is pronounced "minus"
 * without using the dictionary, just in case some future
 * edit decides that it should be "dash". All the others
 * are just handed to the dictionary code.
 */
dosign(sign)
 int	sign;
{
	LETTER	lbuf[2];

	if (sign == '-')
		{			/* Special case.	*/
		sendlist(pminus);
		sendphone(WBOUND);
		}
	 else	if (sign == '+')
		{			/* Special case.	*/
		sendlist(pplus);
		sendphone(WBOUND);
		}

	 else if (sign != 0)
		{			/* Dictionary case.	*/
		lbuf[0].l_ch = ' ';
#ifndef NO_INDEXES
		lbuf[0].l_ip = NULL;
#endif
		lbuf[1].l_ch = sign;
#ifndef NO_INDEXES
		lbuf[1].l_ip = NULL;
#endif
		if (blook(&lbuf[0], &lbuf[2], FIRST) == MISS)
			sendphone(EY);
		sendphone(WBOUND);
	}
	return (0);
}
#endif

#ifndef CALLER_ID
/*
 * Speak a part number, and any
 * index markers that are imbedded in the
 * string of characters. The code works best if
 * the part number has DECtalk's standard part number
 * syntax, but it won't blow up if it doesn't.
 * I don't really like the way that the three case
 * arms all check if the inter-chunk WBOUND is
 * needed.
 *
 * The Kurzweil spelling rules are a little
 * bit different. The number processing rules never
 * wake up. The "-" and "/" characters are never
 * spoken. I could not decide if there should be a
 * pause on these characters, so I made it an
 * option, controlled by a new bit in the modeflag
 * option word.
 */
dopartnumber(llp, rlp)
LETTER	*llp;
LETTER	*rlp;
/* FRED caused no error here ! */
{
/* FRED caused an error when included here! */
/* The following 'FRED' preprocessor code trips
 * a problem that occures within the boundries
 * of *THIS* routine [dopartnumber]. This code
 * is being left here for now (21-DEC-1994) so
 * that the real #ifs will not cause an error.
 */

	 LETTER	*blp;
	 int	speed;
	 int	nd;

	while (llp != rlp) {
		blp = llp;
		++llp;
		if (blp->l_ch=='-' || blp->l_ch=='/') {
			spell(blp, llp);
			if (llp != rlp)
				sendphone(WBOUND);
		} else if (blp->l_ch>='0' && blp->l_ch<='9') {
			while (llp!=rlp && llp->l_ch>='0' && llp->l_ch<='9')
				++llp;
			if ((nd = llp-blp) == 2)
				do2digits(blp);
			else if (nd == 3)
				do3digits(blp);
			else if (nd == 4)
				do4digits(blp);
			else				
				spell(blp, llp);
			if (llp != rlp)
				sendphone(WBOUND);
		} else {
			while (llp!=rlp && isapart(llp->l_ch)!=FALSE)
				++llp;
			if (llp-blp<3 || lookup(blp, llp, FALSE)==MISS) {
				speed = spellspeed(blp, llp);
				spell(blp, llp);
				if (speed == FAST)
					sendphone(WBOUND);
				else
					sendphone(COMMA);
			} else if (llp != rlp)
				sendphone(WBOUND);
		}
	}
return (0);
}
#endif
/*
 * Return TRUE if the character
 * "c" can be part of a part number alpha
 * string. All characters but digits,
 * the "-" and the "/" are this.
 */
isapart(c)
 int	c;
{
	if (c=='-' || c=='/' || (c>='0' && c<='9'))
		return (FALSE);
	return (TRUE);
}


#ifndef CALLER_ID
/*
 * 0X	spell.
 * 1X	speak X (as a "teen", "10" is a "teen").
 * X0	speak X (as tens).
 * XY	speak X (as tens), speak Y (as units).
 */
do2digits(lp)
 LETTER	*lp;
{
	if (lp->l_ch == '0')
		spell(lp, lp+2);
	else {
		if (lp->l_ch == '1')
			sendlist(pteens[(lp+1)->l_ch-'0']);
		else {
			sendlist(ptens[lp->l_ch-'0']);
			if ((lp+1)->l_ch != '0') {
				sendphone(WBOUND);
				sendlist(punits[(lp+1)->l_ch-'0']);
			}
		}
		/*sendindex(lp, lp+2);*/
	}
	return (0);
}
#endif
#ifndef CALLER_ID
/*
 * 0XX	spell.
 * X00	speak X, "hundred".
 * XYY	speak X, speak YY.
 */
do3digits(lp)
 LETTER	*lp;
{
	if (lp->l_ch == '0')
		spell(lp, lp+3);
	else {
		sendlist(punits[lp->l_ch-'0']);
		/*sendindex(lp, lp+1);*/
		sendphone(WBOUND);
		if ((lp+1)->l_ch=='0' && (lp+2)->l_ch=='0') {
			sendlist(phundred);
			/*sendindex(lp+1, lp+3);*/
		} else
			do2digits(lp+1);
	}
	return (0);
}
#endif
#ifndef CALLER_ID
/*
 * 0XXX	spell.
 * X000 speak X, "thousand".
 * XX00 speak XX, "hundred".
 * XXYY	speak XX, speak YY.
 */
do4digits(lp)
 LETTER	*lp;
{
	if (lp->l_ch == '0')
		spell(lp, lp+4);
	else if ((lp+2)->l_ch=='0' && (lp+3)->l_ch=='0') {
		if ((lp+1)->l_ch == '0') {
			sendlist(punits[lp->l_ch-'0']);
			/*sendindex(lp, lp+1);*/
			sendphone(WBOUND);
			sendlist(pthousand);
			/*sendindex(lp+1, lp+4);*/
		} else {
			do2digits(lp);
			sendphone(WBOUND);
			sendlist(phundred);
			/*sendindex(lp+2, lp+4);*/
		}
	} else {
		do2digits(lp+0);
		sendphone(WBOUND);
		do2digits(lp+2);
	}
	return (0);
}
#endif
#ifdef CALLER_ID
/*
 * Speak a three digit group.
 * The number is in the supplied array of three
 * digits, with leading zeros. The caller must arrange
 * to put out the required index markers. This may be a
 * "bug", because the index marks will happen at the
 * end of the group, not as the digits get
 * spoken.
 */

void dogroup(buf, oflag)
 char	buf[3];
int oflag;
{
	if (oflag == FALSE)
		sendlist(punits[buf[2]-'0']);
	return;
}


#else

void dogroup(buf, oflag)
 char	buf[3];
int oflag;
{
	if (buf[0] != '0') {
		sendlist(punits[buf[0]-'0']);
		sendphone(WBOUND);
		sendlist(phundred);
		if (buf[1]=='0' && buf[2]=='0') {
			if (oflag != FALSE)
				sendphone(TH);
			return;
		}
		sendlist(pand);
	}
	if (buf[1] == '1') {
		sendlist(pteens[buf[2]-'0']);
		if (oflag != FALSE)
			sendphone(TH);
		return;
	}
	if (buf[1] != '0') {
		sendlist(ptens[buf[1]-'0']);
		if (buf[2] == '0') {
			if (oflag != FALSE) {
				sendphone(IX);
				sendphone(TH);
			}
			return;
		}
		sendphone(WBOUND);
	}
	if (oflag != FALSE)
		sendlist(pordin[buf[2]-'0']);
	else
		sendlist(punits[buf[2]-'0']);
}
#endif


#ifdef CALLER_ID 
/* support for telephone numbers only*/
donumber(llp, rlp, oflag)
 LETTER	*llp;
 LETTER	*rlp;
int oflag;
{
	 LETTER	*tlp1;
	 LETTER *tlp2;
	 int	c;

	int	n;
	 int	pflag;
	 int	ndig;
	 int	sflag;
	char		buf[18];
	tlp1  = llp;
	/* This handles integer parts like "1/2".			*/
	pflag = FALSE;				/* Not plural.		*/
	sflag = FALSE;				/* No user "," seen.	*/
	ndig  = 0;

	while (tlp1!=rlp && (digit(tlp1)!=FALSE || tlp1->l_ch==schar)) {
		if (tlp1->l_ch == schar)
			sflag = TRUE;
		else
			++ndig;
		++tlp1;
	}
	

	if (ndig != 0) {
		n = 18;				/* Right justify	*/
		tlp2 = tlp1;
		while (tlp2 != llp) {
			c = (--tlp2)->l_ch;
			if (c != schar)
				buf[--n] = c;
		}
		if (n!=17 || buf[17]!='1')	/* Watch for "1".	*/
			pflag = TRUE;
		while (n != 0)
			buf[--n] = '0';
	}

		dogroup(&buf[15], oflag);	/* Units		*/


	return (pflag);
}
#else
/*
 * This is a general number speaking routine.
 * It understands integers, fractional digits, and powers
 * of 10. Long integers are spoken in groups. Shorter integers
 * are spoken more cleverly. The "oflag" asks to have the number
 * spoken as an ordinal (for dates, etc.); it only works right if
 * the number is a small integer. Return TRUE if the number is
 * plural, and FALSE if it is singular. This function calls
 * itself recursively to speak the exponent of a floating
 * point number; it cannot get stuck, because of the
 * syntax of such numbers.
 */
donumber(llp, rlp, oflag)
 LETTER	*llp;
 LETTER	*rlp;
int oflag;
{
	 LETTER	*tlp1;
	 LETTER *tlp2;
	 int	c;
	 int	n;
	 int	pflag;
	 int	ndig;
	 int	sflag;
	char		buf[18];
	tlp1  = llp;
	/* This handles integer parts like "1/2".			*/
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD)) {
		spell(tlp1, rlp);
		return (FALSE);
	}
	pflag = FALSE;				/* Not plural.		*/
	sflag = FALSE;				/* No user "," seen.	*/
	ndig  = 0;
#ifdef LS2DEBUG
	printf("In donumber\n");

#endif
	while (tlp1!=rlp && (digit(tlp1)!=FALSE || tlp1->l_ch==schar)) {
		if (tlp1->l_ch == schar)
			sflag = TRUE;
		else
			++ndig;
		++tlp1;
	}
	if (ndig>18 && sflag!=FALSE) {		/* Long, commas.	*/
		tlp2 = llp;
		while (tlp2 != tlp1) {		/* Pause where you are	*/
			c = tlp2->l_ch;		/* told to do so.	*/
			++tlp2;
			if (c == schar)
				sendphone(COMMA);
			else {
				sendlist(punits[c-'0']);
				if (tlp2!=tlp1 && tlp2->l_ch!=schar)
					sendphone(WBOUND);
			}
		}
		pflag = TRUE;
	} else if (ndig>18 || (ndig>1 && llp->l_ch=='0')) {
		tlp2 = llp;
		while (ndig >= 6) {		/* At least 1 group.	*/
			n = 0;
			while (n < 3) {
				if ((c=tlp2->l_ch) != schar) {
					if (n != 0)
						sendphone(WBOUND);
					++n;
					sendlist(punits[c-'0']);
				}
				++tlp2;
			}
			sendphone(COMMA);
			ndig -= 3;
		}
		n = 0;				/* Last group.		*/
		while (tlp2 != tlp1) {
			if ((c=tlp2->l_ch) != schar) {
				if (n != 0)
					sendphone(WBOUND);
				++n;
				sendlist(punits[c-'0']);
			}
			++tlp2;
		}
		pflag = TRUE;			/* Long => plural.	*/
	} else if (ndig != 0) {

		n = 18;				/* Right justify	*/

		tlp2 = tlp1;
		while (tlp2 != llp) {
			c = (--tlp2)->l_ch;
			if (c != schar)
				buf[--n] = c;
		}
		if (n!=17 || buf[17]!='1')	/* Watch for "1".	*/
			pflag = TRUE;
		while (n != 0)
			buf[--n] = '0';

		if (nz(&buf[0], 3) != FALSE) {	/* Quadrillions		*/
			dogroup(&buf[0], FALSE);
			sendphone(WBOUND);
			sendlist(pquadrillion);
			if (nz(&buf[3], 15) == FALSE) {
				if (oflag != FALSE)
					sendphone(TH);
				goto out;
			}
			if (nz(&buf[4], 14) == FALSE)
				sendphone(VPSTART);
			else if (nz(&buf[3], 1) == FALSE)
				sendlist(pand);
			else
				sendphone(COMMA);
		}

		if (nz(&buf[3], 3) != FALSE) {	/* Trillions		*/
			dogroup(&buf[3], FALSE);
			sendphone(WBOUND);
			sendlist(ptrillion);
			if (nz(&buf[6], 12) == FALSE) {
				if (oflag != FALSE)
					sendphone(TH);
				goto out;
			}
			if (nz(&buf[7], 11) == FALSE)
				sendphone(VPSTART);
			else if (nz(&buf[6], 1) == FALSE)
				sendlist(pand);
			else
				sendphone(COMMA);
		}

		if (nz(&buf[6], 3) != FALSE) {	/* Billions		*/
			dogroup(&buf[6], FALSE);
			sendphone(WBOUND);
			sendlist(pbillion);
			if (nz(&buf[9], 9) == FALSE) {
				if (oflag != FALSE)
					sendphone(TH);
				goto out;
			}
			if (nz(&buf[10], 8) == FALSE)
				sendphone(VPSTART);
			else if (nz(&buf[9], 1) == FALSE)
				sendlist(pand);
			else
				sendphone(COMMA);
		}

		if (nz(&buf[9], 3) != FALSE) {	/* Millions		*/
			dogroup(&buf[9], FALSE);
			sendphone(WBOUND);
			sendlist(pmillion);
			if (nz(&buf[12], 6) == FALSE) {
				if (oflag != FALSE)
					sendphone(TH);
				goto out;
			}
			if (nz(&buf[13], 5) == FALSE)
				sendphone(VPSTART);
			else if (nz(&buf[12], 1) == FALSE)
				sendlist(pand);
			else
				sendphone(COMMA);
		}

		if (nz(&buf[12], 3) != FALSE) {	/* Thousands		*/

			dogroup(&buf[12], FALSE);
			sendphone(WBOUND);
			sendlist(pthousand);
			if (nz(&buf[15], 3) == FALSE) {
				if (oflag != FALSE)
					sendphone(TH);
				goto out;
			}
			if (nz(&buf[16], 2) == FALSE)
				sendphone(VPSTART);
			else if (nz(&buf[15], 1) == FALSE)
				sendlist(pand);
			else
				sendphone(COMMA);
		}

		dogroup(&buf[15], oflag);	/* Units		*/
	out:	;
	}
	/*sendindex(llp, tlp1);*/
	/* This code handles integer parts like "1 1/2".		*/
	if (tlp1!=rlp && (tlp1->l_ch==0xBC || tlp1->l_ch==0xBD)) {
		sendlist(pand);
		spell(tlp1, tlp1+1);
		++tlp1;
		pflag = TRUE;			/* Always plural.	*/
	}
	if (tlp1!=rlp && tlp1->l_ch==fchar) {	/* Fraction digits.	*/
		if (llp != tlp1)
			sendphone(WBOUND);
		sendlist(ppoint);
		tlp2 = tlp1;
		++tlp1;
		while (tlp1!=rlp && tlp1->l_ch!='e') {
			c = tlp1->l_ch;
			if (c != schar) {
				sendphone(WBOUND);
				sendlist(punits[c-'0']);
			}
			++tlp1;
		}
		/*sendindex(tlp2, tlp1);*/
		pflag = TRUE;			/* 1.01 is plural.	*/
	}
	if (tlp1 != rlp) {			/* Must be an "e".	*/
		sendlist(ptt2tp);		/* " " on end.		*/
		tlp2 = tlp1;
		++tlp1;				/* Skip "e"		*/
		if (tlp1 != rlp) {		/* Handle signs.	*/
			c = tlp1->l_ch;
			if (c=='-' || c=='+') {
				dosign(c);
				++tlp1;
			}
		}
#if 0
		/*sendindex(tlp2, tlp1);		/* Index "e", sign.	*/
#endif
		donumber(tlp1, rlp, FALSE);	/* Cannot recur on "e".	*/
		pflag = TRUE;			/* 1E01 is plural.	*/
	}
	return (pflag);
}
#endif
/*
 * Check to see if the supplied
 * array of characters, with length "n",
 * is non zero. Return TRUE if it is.
 * Return FALSE if all zero.
 */
nz(p, n)
 char	*p;
 int	n;
{
	while (n--) {
		if (*p != '0')
			return (TRUE);
		++p;
	}
	return (FALSE);
}
#ifndef CALLER_ID
istime(llp, rlp)
 LETTER	*llp;
 LETTER	*rlp;
{
	if (digit(llp)==FALSE || ++llp==rlp)	/* First digit.		*/
		return (FALSE);

	if (llp->l_ch != ':') 			/* Optional digit.	*/
		{
		if (digit(llp)==FALSE || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != ':')		/* Must be ":" now!	*/
			return (FALSE);
	}
	
	if (++llp==rlp || digit(llp)==FALSE)	/* Two digits.		*/
		return (FALSE);
	if (++llp==rlp || digit(llp)==FALSE)
		return (FALSE);
	if (++llp == rlp)			/* 00:00		*/
		{
		return (TRUE);
		}
	if (llp->l_ch == ':') {			/* 00:00:00		*/
		if (++llp==rlp || digit(llp)==FALSE)
			return (FALSE);
		if (++llp==rlp || digit(llp)==FALSE)
			return (FALSE);
		++llp;
	}
	if (llp!=rlp && llp->l_ch==fchar) {	/* Fractional digits.	*/
		if (++llp==rlp || digit(llp)==FALSE)
			return (FALSE);
		while (++llp!=rlp && digit(llp)!=FALSE);
	}

/*	if (llp != rlp)				
		return (FALSE);			*/
	return (TRUE);				/* Looks good!		*/
}
#endif
#ifndef CALLER_ID
isampm(llp, rlp)
 LETTER	*llp;
 LETTER *rlp;
{
	if (llp->l_ch!='a' && llp->l_ch!='A'
	&&  llp->l_ch!='p' && llp->l_ch!='P')
		return (FALSE);
	++llp;
	if (llp->l_ch!='m' && llp->l_ch!='M')
		return (FALSE);
	++llp;
	if (llp != rlp)
		return (FALSE);
	return (TRUE);
}
#endif
#ifndef CALLER_ID
dotime(llp, rlp)
 LETTER	*llp;
 LETTER	*rlp;
	{
	if ((llp+1)->l_ch == ':')
		{		/* Initial 1 digit.	*/
		sendlist(punits[llp->l_ch-'0']);
		/*sendindex(llp, llp+2);*/
		llp += 2;
		}
	else
		{				/* Initial 2 digit.	*/
		do2digits(llp);
		/*sendindex(llp+2, llp+3);*/
		llp += 3;
		}
	sendphone(VPSTART);			/* Middle.		*/
	if ( !( llp->l_ch == '0' && (llp+1)->l_ch == '0'))
			 do2digits(llp);
	llp += 2;
	if (llp!=rlp && llp->l_ch==':')
		{	/* End.			*/
		sendphone(VPSTART);
		/*sendindex(llp, llp+1);*/
		do2digits(llp+1);
		llp += 3;
		}
	if (llp != rlp)
		{			/* Final fractions.	*/
		if(llp->l_ch  == '.')
			{
			sendphone(WBOUND);
			sendlist(ppoint);
			while (++llp != rlp)
				{
				sendphone(WBOUND);
				sendlist(punits[llp->l_ch-'0']);
				/*sendindex(llp, llp+1);*/
				}
			}
		else
			{
			spell(llp,rlp);
			}
		}
		return (0);
	}


isdate(llp, rlp)
 LETTER	*llp;
 LETTER	*rlp;
{
	char *cp;
	 int	i;
	char		buf[3];

	if (digit(llp)==FALSE || ++llp==rlp)	/* First digit.		*/
		return (FALSE);
	if (llp->l_ch != '-') {			/* Optional digit.	*/
		if (digit(llp)==FALSE || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != '-')		/* Must be "-" now!	*/
			return (FALSE);
	}
	if (++llp==rlp || alpha(llp)==FALSE)	/* Three alphas.	*/
		return (FALSE);
	buf[0] = llp->l_ch;
	if (++llp==rlp || alpha(llp)==FALSE)
		return (FALSE);
	buf[1] = llp->l_ch;
	if (++llp==rlp || alpha(llp)==FALSE)
		return (FALSE);
	buf[2] = llp->l_ch;
	for (i=0; i<12; ++i) {			/* Validate.		*/
		cp = months[i];
		if (buf[0]==cp[0] && buf[1]==cp[1] && buf[2]==cp[2])
			break;
	}
	if (i == 12)				/* Loss!		*/
		return (FALSE);
	if (++llp == rlp)			/* 23-Aug		*/
		return (TRUE);
	if (llp->l_ch != '-')			/* Must be a year.	*/
		return (FALSE);
	if (++llp==rlp || digit(llp)==FALSE)
		return (FALSE);
	if (++llp==rlp || digit(llp)==FALSE)
		return (FALSE);
	if (++llp == rlp)			/* 23-Aug-84		*/
		return (TRUE);
	if (digit(llp)==FALSE || ++llp==rlp)	/* Need 2 more digits.	*/
		return (FALSE);
	if (digit(llp)==FALSE || ++llp!=rlp)
		return (FALSE);
	return (TRUE);				/* 23-Aug-1984		*/
}

dodate(llp, rlp)
LETTER	*llp;
LETTER	*rlp;
{
	LETTER	*lp1;
	 int	i;
	char *cp;

	lp1 = llp;				/* Find end of day.	*/
	while (lp1->l_ch != '-')
		++lp1;
	for (i=0; i<12; ++i) {			/* Get month.		*/
		cp = months[i];
		if ((lp1+1)->l_ch == cp[0]
		&&  (lp1+2)->l_ch == cp[1]
		&&  (lp1+3)->l_ch == cp[2])
			break;
	}
	sendlist(pmonths[i]);			/* Speak the month	*/
	sendphone(WBOUND);
	if (lp1!=llp+1 && llp->l_ch=='0')	/* Get "01-Jan-84" ok.	*/
		donumber(llp+1, lp1, TRUE);
	else
		donumber(llp, lp1, TRUE);
	lp1 += 4;
	/*sendindex(llp, lp1);*/
	if (lp1 != rlp) {
		sendphone(COMMA);
/*		sendindex(lp1, lp1+1);*/		/* "-"			*/
		if (lp1+3 == rlp) {
			sendlist(pteens[9]);	/* 19XX			*/
			sendphone(WBOUND);
			do2digits(lp1+1);
		} else
			do4digits(lp1+1);	/* YYXX			*/		
	}
	return (0);
}

isfrac(llp, rlp)
 LETTER *llp;
 LETTER *rlp;
{
	 int	n;

	if (digit(llp)==FALSE || llp->l_ch=='0' || ++llp==rlp)
		return (FALSE);			/* Non digit or "0".	*/
	if (llp->l_ch != '/') {			/* Optional digit.	*/
		if (digit(llp)==FALSE || ++llp==rlp)
			return (FALSE);
		if (llp->l_ch != '/')
			return (FALSE);
	}
	n = 0;					/* Count digits.	*/
	while (++llp!=rlp && digit(llp)!=FALSE) {
		if (n==0 && llp->l_ch=='0')	/* Leading "0" is bad.	*/
			return (FALSE);
		++n;
	}
	if (n==0 || n>3)			/* 1 to 3 digits.	*/
		return (FALSE);
	if (n == 3) {				/* Limit is 100.	*/
		if ((llp-1)->l_ch != '0'
		||  (llp-2)->l_ch != '0'
		||  (llp-3)->l_ch != '1')
			return (FALSE);
	}
	if (llp != rlp) {			/* Allow "%".		*/
		if (llp->l_ch!='%' || llp+1!=rlp)
			return (FALSE);
	}
	return (TRUE);
}

dofrac(llp, rlp)
 LETTER	*llp;
 LETTER *rlp;
{
	 LETTER	*tlp1;
	 LETTER	*tlp2;
	 int	pflag;
	 int	ud;

	tlp1 = llp;				/* Scan to "/".		*/
	while (tlp1->l_ch != '/')
		++tlp1;
	pflag = donumber(llp, tlp1, FALSE);	/* Numerator.		*/
	sendphone(WBOUND);			/* Gap.			*/
	/*sendindex(tlp1, tlp1+1);*/		/* Index on the "/".	*/
	++tlp1;					/* Skip "/".		*/
	tlp2 = tlp1;				/* Scan to end or "%".	*/
	while (tlp2!=rlp && tlp2->l_ch!='%')
		++tlp2;
	if (tlp1+1==tlp2 && tlp1->l_ch=='2') {
		sendlist(pflag!=FALSE ? phalves : phalf);
		/*sendindex(tlp1, tlp2);*/
	} else {
		donumber(tlp1, tlp2, TRUE);	/* As an ordinal.	*/
		if (pflag != FALSE) {		/* Make plural.		*/
			ud = (tlp2-1)->l_ch;
			if (tlp2>tlp1+1 && (tlp2-2)->l_ch=='1')
				ud = '0';
			sendphone(ud=='2'||ud=='3' ? Z : S);
		}
	}
	if (tlp2 != rlp) {			/* Must be "%".		*/
		sendlist(ppercent);
		/*sendindex(tlp2, rlp);*/
	}          
	return (0);
}
#endif
alpha(lp)
 LETTER	*lp;
{
	/* GL 11/06/1996, use IS_ALPHA(c) to check for alphabet */
	if (IS_ALPHA(lp->l_ch))
	/* if (lp->l_ch>='a' && lp->l_ch<='z') */
		return (TRUE);
	return (FALSE);
}

digit(lp)
 LETTER	*lp;
{

	if (lp->l_ch>='0' && lp->l_ch<='9')
		{
		return (TRUE);
		}
	return (FALSE);
}

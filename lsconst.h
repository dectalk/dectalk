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
 *    File Name:	lsconst.h
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *    DECtalk-pc include file for constants ...
 *
 ***********************************************************************
 *    Revision History:
 * Rev  Who     Date            Description
 * ---  -----   -------         ---------------------------------------
 * 002  GL      03/06/96		add pbillion[], ptrillion[] and pquadrillion[]
 * 003  GL		11/01/96	    add ls_fold[] declaration
 */

#ifndef LSCONSTH
#define LSCONSTH 1
#define ARRAY_INPUT
//#ifndef CALLER_ID
extern unsigned short lsctype[];
//#endif
//extern unsigned char lscrush[];
extern unsigned char nabtab[];
extern unsigned char nwdtab[];
#ifndef CALLER_ID
extern unsigned char m_jan[];
extern unsigned char m_feb[];
extern unsigned char m_mar[];
extern unsigned char m_apr[];
extern unsigned char m_may[];
extern unsigned char m_jun[];
extern unsigned char m_jul[];
extern unsigned char m_aug[];
extern unsigned char m_sep[];
extern unsigned char m_oct[];
extern unsigned char m_nov[];
extern unsigned char m_dec[];
extern unsigned char *months[];
extern unsigned char pdegree[];
/* extern unsigned char pdash[]; */

extern unsigned char pminus[];
extern unsigned char pplus[];
#endif
extern unsigned char pstreet[];
extern unsigned char psaint[] ;
extern unsigned char pdoctor[];
extern unsigned char pdrive[];
extern unsigned char p0[];
extern unsigned char p1[];
extern unsigned char p2[];
extern unsigned char p3[];
extern unsigned char p4[];
extern unsigned char p5[];
extern unsigned char p6[];
extern unsigned char p7[];
extern unsigned char p8[];
extern unsigned char p9[];
extern unsigned char *punits[];


extern unsigned char pa[];
extern unsigned char pb[];
extern unsigned char pc[];
extern unsigned char pd[];
extern unsigned char pe[];
extern unsigned char pf[];
extern unsigned char pg[];
extern unsigned char ph[];
extern unsigned char pi[];
extern unsigned char pj[];
extern unsigned char pk[];
extern unsigned char pl[];
extern unsigned char pm[];
extern unsigned char pn[];
extern unsigned char po[];
extern unsigned char pp[];
extern unsigned char pq[];
extern unsigned char pr[];
extern unsigned char ps[];
extern unsigned char pt[];
extern unsigned char pu[];
extern unsigned char pv[];
extern unsigned char pw[];
extern unsigned char px[];
extern unsigned char py[];
extern unsigned char pz[];
extern unsigned char *pspell[];


#ifndef CALLER_ID
extern unsigned char phundred[];
extern unsigned char pthousand[];
extern unsigned char pmillion[];
extern unsigned char pbillion[];
extern unsigned char ptrillion[];
extern unsigned char pquadrillion[];
extern unsigned char p10[];
extern unsigned char p11[];
extern unsigned char p12[];
extern unsigned char p13[];
extern unsigned char p14[];
extern unsigned char p15[];
extern unsigned char p16[];
extern unsigned char p17[];
extern unsigned char p18[];
extern unsigned char p19[];
extern unsigned char *pteens[];
extern unsigned char pnone[];
extern unsigned char p20[];
extern unsigned char p30[];
extern unsigned char p40[];
extern unsigned char p50[];
extern unsigned char p60[];
extern unsigned char p70[];
extern unsigned char p80[];
extern unsigned char p90[];

extern unsigned char *ptens[];
extern unsigned char ppence[];
extern unsigned char ppercent[];
extern unsigned char pcent[];

extern unsigned char ppound[];
extern unsigned char pdollar[];
extern unsigned char pand[];
extern unsigned char ppoint[];
extern unsigned char ptt2tp[];
extern unsigned char pjan[];
extern unsigned char pfeb[];
extern unsigned char pmar[];
extern unsigned char papr[];
extern unsigned char pmay[];
extern unsigned char pjun[];
extern unsigned char pjul[];
extern unsigned char	paug[];
extern unsigned char	psep[];
extern unsigned char	poct[];
extern unsigned char	pnov[];
extern unsigned char	pdec[];
extern unsigned char *pmonths[];
extern unsigned char	p0th[];
extern unsigned char	p1st[];
extern unsigned char	p2nd[];
extern unsigned char	p3rd[];
extern unsigned char	p4th[];
extern unsigned char	p5th[];
extern unsigned char	p6th[];
extern unsigned char	p7th[];
extern unsigned char	p8th[];
extern unsigned char	p9th[];
extern unsigned char *pordin[];
extern unsigned char	phalf[];
extern unsigned char	phalves[];
extern unsigned char	phalves[];
#endif
extern unsigned int feats[];
extern unsigned int pfeat[];
#ifdef ACNA
extern const char	preftab[];
#endif
#ifdef DIVIDED_LTS_RULES
extern const unsigned char lsbtab1[];
extern const unsigned char lsbtab2[];
#else
extern const unsigned char lsbtab[];
#endif
extern const unsigned short lswtab[];
extern unsigned char ls_fold[];
extern unsigned char ls_upper[];
extern unsigned char ls_lower[];
extern unsigned char ls_char_feat[];

#ifdef ARRAY_INPUT
extern int cur_input_pos;
extern int cur_read_pos;
#endif

#endif

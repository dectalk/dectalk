/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2002 Fonix Corporation. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.   
 *                                                                     
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.    
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.
 *
 *    This software is proprietary to and embodies the confidential
 *    technology of Fonix Corporation and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Fonix or an
 *    authorized sublicensor.
 *
 *********************************************************************** 
 *    File Name:	ls_cons.h
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    DECtalk-pc include file for constants ...
 *
 ***********************************************************************       
 *                                                                             
 *	Rev	Who		Date			Description                    
 *	---	-----	-------			---------------------------------------
 *	001	MGS		02/07/1996		Moved data from lsconst.h to ls_cons.h
 *  002	MGS		02/22/1996		removed unused table lscrush
 *	003	MGS		03/15/1996		Changed lsctype from unsigned int to U16
 *	004	GL		11/07/1996		Add pcomma[] for Spanish
 *  005 GL		11/14/1996		Add p1_un[] and up1_un[] declaration.
 *	006 GL		11/21/1996		add pminute[] and psecond[] for German
 *								and plural for large number
 *	007	GL		11/22/1996		add p1e[] for German
 *	008	DR		07/21/1997		UK BUILD: Changed ENGLISH_US to ENGLISH
 *	009	GL		10/31/1997		add pthe[] and pof[]
 *  010	GL		04/29/1998		BATS#661 add ptexr[] pstxr[] for German
 *  011 EAB		09/29/1998	 	Added a variable
 *  012	GL		10/21/1998		BATS#770 change pthe[] pof[] for both US and UK
 *  013	GL		11/03/1998		BATS#783 add p1_uno[] for two digits number in date, time
 *	014	MGS		11/23/1998		BATS #329 fixed 02-apr-2001 
 *  015 EAB		02/02/1999 		Fixed BATS 863 which corrected the number before 
								a quatitiy (hudred thousand ect ) from stressed to unstressed
 *  016 GL		05/14/1999		BATS#865 create OHpunits[] for NWS_US 
 *  017 CHJ		07/20/2000		French added
 *  018 CAB		10/18/2000		Changed copyright info
 *  019	MGS		04/11/2002		ARM7 port
 *	020	CAB		04/24/2002		Moved French variables from l_fr_sp1.c
 */

#ifndef LS_CONSH
#define LS_CONSH 1  

extern const U16 lsctype[];
 
extern const unsigned char lscrush[];

extern const unsigned char nabtab[];
extern const unsigned char nwdtab[];

extern const unsigned char m_jan[];
extern const unsigned char m_feb[];
extern const unsigned char m_mar[];
extern const unsigned char m_apr[];
extern const unsigned char m_may[];
extern const unsigned char m_jun[];
extern const unsigned char m_jul[];
extern const unsigned char m_aug[];
extern const unsigned char m_sep[];
extern const unsigned char m_oct[];
extern const unsigned char m_nov[];
extern const unsigned char m_dec[];
extern const unsigned char *months[];
extern const unsigned char pdegree[];
/* extern const unsigned char pdash[]; */
extern const unsigned char pminus[];
extern const unsigned char pplus[];
extern const unsigned char pstreet[];
extern const unsigned char psaint[] ;
extern const unsigned char pdoctor[];
extern const unsigned char pdrive[];
/* 014 MGS 11/23/1998 BATS #329 fixed 02-apr-2001 */
#ifdef ENGLISH_US
extern const unsigned char pOH[];
#endif
extern const unsigned char p0[];
extern const unsigned char p1[];
extern const unsigned char p2[];
extern const unsigned char p3[];
extern const unsigned char p4[];
extern const unsigned char p5[];
extern const unsigned char p6[];
extern const unsigned char p7[];
extern const unsigned char p8[];
extern const unsigned char p9[];
extern const unsigned char *punits[];
//BATS 863
extern const unsigned char *upunits[];
extern const unsigned char phundred[];
extern const unsigned char pthousand[];
extern const unsigned char pmillion[];
#if defined (ENGLISH) || defined (GERMAN)
extern const unsigned char ptrillion[];
extern const unsigned char pquadrillion[];
extern const unsigned char pbillion[];
#endif
extern const unsigned char p10[];
extern const unsigned char p11[];
extern const unsigned char p12[];
extern const unsigned char p13[];
extern const unsigned char p14[];
extern const unsigned char p15[];
extern const unsigned char p16[];
extern const unsigned char p17[];
extern const unsigned char p18[];
extern const unsigned char p19[];
extern const unsigned char *pteens[];
extern const unsigned char pnone[];
extern const unsigned char p20[];
extern const unsigned char p30[];
extern const unsigned char p40[];
extern const unsigned char p50[];
extern const unsigned char p60[];
extern const unsigned char p70[];
extern const unsigned char p80[];
extern const unsigned char p90[];
extern const unsigned char *ptens[];  
extern const unsigned char ppence[];
extern const unsigned char pcent[];
extern const unsigned char peuro[];
extern const unsigned char ppound[];
extern const unsigned char pdollar[];
extern const unsigned char ppercent[];
extern const unsigned char pand[];
extern const unsigned char ppoint[];
extern const unsigned char ptt2tp[];
extern const unsigned char pjan[];
extern const unsigned char pfeb[];
extern const unsigned char pmar[];
extern const unsigned char papr[];
extern const unsigned char pmay[];
extern const unsigned char pjun[];
extern const unsigned char pjul[];
extern const unsigned char paug[];
extern const unsigned char psep[];
extern const unsigned char poct[];
extern const unsigned char pnov[];
extern const unsigned char pdec[];
extern const unsigned char *pmonths[];
extern const unsigned char p0th[];
extern const unsigned char p1st[];
extern const unsigned char p2nd[];
extern const unsigned char p3rd[];
extern const unsigned char p4th[];
extern const unsigned char p5th[];
extern const unsigned char p6th[];
extern const unsigned char p7th[];
extern const unsigned char p8th[];
extern const unsigned char p9th[];
extern const unsigned char *pordin[];
extern const unsigned char phalf[];
extern const unsigned char phalves[];
#ifdef ENGLISH
extern const unsigned char pthe[];
extern const unsigned char pof[];
#endif
#ifdef FRENCH
extern const unsigned char ptiers[];
extern const unsigned char pquart[];
extern const unsigned char une[];
extern const unsigned char francs[];
extern const unsigned char ieme[];
extern const unsigned char dizieme[];
extern const unsigned char *punitsl[];
extern const unsigned char heure[];
extern const unsigned char *categ[];
extern const unsigned char apres_tiret[];
extern const unsigned char premiere[];
extern const unsigned char premier[];
#endif
extern const U16 feats[];
extern const U16 pfeat[];
extern const unsigned char preftab[];
extern const unsigned char whdic[];
extern const unsigned char sdic[];
#ifdef ENGLISH
#ifdef ACNA
extern const char far acna_lsbtab[];
extern const U16 far acna_lswtab[];
#else
extern const unsigned char far lsbtab[];
extern const U16 far lswtab[];
#endif
#endif

extern const unsigned char	 preftab[];
#ifndef LDS_BUILD
extern const unsigned char far lsbtab[];
extern const U16 far lswtab[];
#endif
#ifdef ENGLISH
extern const unsigned char ls_fold[];
#endif

extern const unsigned char ls_upper[];
extern const unsigned char ls_lower[];
extern const unsigned char ls_char_feat[];

#ifdef GERMAN
extern const unsigned char phour[];
extern const unsigned char pminutes[];
extern const unsigned char pseconds[];
extern const unsigned char pminute[];
extern const unsigned char psecond[];
extern const unsigned char pstex[];
extern const unsigned char ptex[];
extern const unsigned char ptexr[];
extern const unsigned char pstexr[];
extern const unsigned char p1a[];
extern const unsigned char p1s[];
extern const unsigned char p1e[];
extern const unsigned char p1b[];
extern const unsigned char pcomma[];  /* "comm" */
extern const unsigned char pmillions[];
extern const unsigned char ptrillions[];
extern const unsigned char pquadrillions[];
extern const unsigned char pbillions[];
#endif

#ifdef SPANISH 
extern const unsigned char p1_uno[];                  
extern const unsigned char p1_un[];                  
extern const unsigned char up1_un[];                  
extern const unsigned char o0[];                  
extern const unsigned char o1[];
extern const unsigned char o2[];
extern const unsigned char o3[];
extern const unsigned char o4[];
extern const unsigned char o5[];
extern const unsigned char o6[];
extern const unsigned char o7[];
extern const unsigned char o8[];
extern const unsigned char o9[];
extern const unsigned char *ounits[];
extern const unsigned char ohundred[];
extern const unsigned char othousand[];
extern const unsigned char omillion[];
extern const unsigned char o10[];
extern const unsigned char o11[];
extern const unsigned char o12[];
extern const unsigned char o13[];
extern const unsigned char *oteens[];
extern const unsigned char onone[];
extern const unsigned char o20[];
extern const unsigned char o30[];
extern const unsigned char o40[];
extern const unsigned char o50[];
extern const unsigned char o60[];
extern const unsigned char o70[];
extern const unsigned char o80[];
extern const unsigned char o90[];
extern const unsigned char *otens[]; 

extern  const unsigned char ph7[];
extern  const unsigned char ph9[];
extern  const unsigned char p20only[];
extern  const unsigned char p21[];
extern  const unsigned char *upunits[];
extern  const unsigned char *pordunits[];
extern  const unsigned char *pordtens[];
extern  const unsigned char *pordteens[];
extern  const unsigned char pordthousand[];
extern  const unsigned char phundredp[];
extern  const unsigned char ponehundred[];
extern  const unsigned char pordonehundred[];
extern  const unsigned char pfivehun[];
extern  const unsigned char ponemillion[];
extern  const unsigned char pmilliones[];
extern  const unsigned char pordonemillion[];
extern  const unsigned char ppoint[];       /* "point"                      */
extern  const unsigned char pcomma[];       /* "comma"                      */
extern  const unsigned char spwhword[];
extern  const unsigned char prewhword[];

/* GL 10/12/1996, to fix the ordinal number error */
extern  const unsigned char pordonehundred_g[];
extern  const unsigned char o200[];
extern  const unsigned char o300[];
extern  const unsigned char o400[];
extern  const unsigned char o500[];
extern  const unsigned char o600[];
extern  const unsigned char o700[];
extern  const unsigned char o800[];
extern  const unsigned char o900[];

#endif 

#endif /* ifndef LS_CONSH */

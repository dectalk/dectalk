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
 */

#ifndef LS_CONSH
#define LS_CONSH 1  

extern U16 lsctype[];
 
extern unsigned char lscrush[];

extern unsigned char nabtab[];
extern unsigned char nwdtab[];

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
extern unsigned char phundred[];
extern unsigned char pthousand[];
extern unsigned char pmillion[];
#if defined (ENGLISH) || defined (GERMAN)
extern unsigned char ptrillion[];
extern unsigned char pquadrillion[];
extern unsigned char pbillion[];
#endif
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
extern unsigned char pcent[];
extern unsigned char ppound[];
extern unsigned char pdollar[];
extern unsigned char ppercent[];
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
extern unsigned char paug[];
extern unsigned char psep[];
extern unsigned char poct[];
extern unsigned char pnov[];
extern unsigned char pdec[];
extern unsigned char *pmonths[];
extern unsigned char p0th[];
extern unsigned char p1st[];
extern unsigned char p2nd[];
extern unsigned char p3rd[];
extern unsigned char p4th[];
extern unsigned char p5th[];
extern unsigned char p6th[];
extern unsigned char p7th[];
extern unsigned char p8th[];
extern unsigned char p9th[];
extern unsigned char *pordin[];
extern unsigned char phalf[];
extern unsigned char phalves[];
#ifdef ENGLISH_UK
extern unsigned char pthe[];
extern unsigned char pof[];
#endif
extern U16 feats[];
extern U16 pfeat[];
extern unsigned char preftab[];
extern unsigned char whdic[];
extern unsigned char sdic[];
#ifdef ENGLISH
#ifdef ACNA
extern char far acna_lsbtab[];
extern U16 far acna_lswtab[];
#else
extern unsigned char far lsbtab[];
extern U16 far lswtab[];
#endif
#endif

extern unsigned char	 preftab[];
extern unsigned char far lsbtab[];
extern U16 far lswtab[];
#ifdef ENGLISH
extern unsigned char ls_fold[];
#endif
extern unsigned char ls_upper[];
extern unsigned char ls_lower[];
extern unsigned char ls_char_feat[];

#ifdef GERMAN
extern unsigned char phour[];
extern unsigned char pminutes[];
extern unsigned char pseconds[];
extern unsigned char pminute[];
extern unsigned char psecond[];
extern unsigned char pstex[];
extern unsigned char ptex[];
extern unsigned char ptexr[];
extern unsigned char pstexr[];
extern unsigned char p1a[];
extern unsigned char p1s[];
extern unsigned char p1e[];
extern unsigned char p1b[];
extern  unsigned char pcomma[];       /* "comma"                      */
extern unsigned char pmillions[];
extern unsigned char ptrillions[];
extern unsigned char pquadrillions[];
extern unsigned char pbillions[];
#endif

#ifdef SPANISH 
extern unsigned char p1_un[];                  
extern unsigned char up1_un[];                  
extern unsigned char o0[];                  
extern unsigned char o1[];
extern unsigned char o2[];
extern unsigned char o3[];
extern unsigned char o4[];
extern unsigned char o5[];
extern unsigned char o6[];
extern unsigned char o7[];
extern unsigned char o8[];
extern unsigned char o9[];
extern unsigned char *ounits[];
extern unsigned char ohundred[];
extern unsigned char othousand[];
extern unsigned char omillion[];
extern unsigned char o10[];
extern unsigned char o11[];
extern unsigned char o12[];
extern unsigned char o13[];
extern unsigned char *oteens[];
extern unsigned char onone[];
extern unsigned char o20[];
extern unsigned char o30[];
extern unsigned char o40[];
extern unsigned char o50[];
extern unsigned char o60[];
extern unsigned char o70[];
extern unsigned char o80[];
extern unsigned char o90[];
extern unsigned char *otens[]; 

extern  unsigned char ph7[];
extern  unsigned char ph9[];
extern  unsigned char p20only[];
extern  unsigned char *upunits[];
extern  unsigned char *pordunits[];
extern  unsigned char *pordtens[];
extern  unsigned char *pordteens[];
extern  unsigned char pordthousand[];
extern  unsigned char phundredp[];
extern  unsigned char ponehundred[];
extern  unsigned char pordonehundred[];
extern  unsigned char pfivehun[];
extern  unsigned char ponemillion[];
extern unsigned char pmilliones[];
extern  unsigned char pordonemillion[];
extern  unsigned char ppoint[];       /* "point"                      */
extern  unsigned char pcomma[];       /* "comma"                      */
extern  unsigned char spwhword[];
extern  unsigned char prewhword[];

/* GL 10/12/1996, to fix the ordinal number error */
extern  unsigned char pordonehundred_g[];
extern  unsigned char o200[];
extern  unsigned char o300[];
extern  unsigned char o400[];
extern  unsigned char o500[];
extern  unsigned char o600[];
extern  unsigned char o700[];
extern  unsigned char o800[];
extern  unsigned char o900[];

#endif 



#endif /* ifndef LS_CONSH */

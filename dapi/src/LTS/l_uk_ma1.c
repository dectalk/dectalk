/*
 **********************************************************************
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
 *    File Name:	l_uk_ma1.c
 *    Author:		Doug Robinson/Ginger Lin                                         
 *    Creation Date:10/01/97                                                   
 *                                                                             
 *    Functionality:                                                           
 *    English math mode stuff                                                                           
 *                                                                             
 ***********************************************************************       
 * 
 *    Revision History:
 *                                                                           
 * Rev	Who		Date			Description                    
 * ---	-----	-----------		---------------------------------------
 * 01	DR/GL	10/1/1997		modified from l_us_ma1.c for UK_english     
 * 
 */

struct math_symbols math_table[] = 
{

	{'+',"pl'^s"},
	{'-',"m'An|s"},
	{'*',"m'^Xt|plAd*bA"},
	{'/',"d|v'Ad|d*bA"},
	{'^',"tU*Dx*p'AR*xv"},
	{'<',"l'Es*D@n"},
	{'>',"gr'etx*D@n"},
	{'=',"'ikwLz"},
	{'%',"pxs'Ent"},
	{'.',"p'Ont"},
	{0,0}
};

ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	(PFUK <<PSFONT)+EY	},
	{ 'a',	(PFUK <<PSFONT)+AA	},
	{ 'i',	(PFUK <<PSFONT)+IY	},
	{ 'E',	(PFUK <<PSFONT)+EH	},
	{ 'A',	(PFUK <<PSFONT)+AY	},
	{ 'I',  (PFUK <<PSFONT)+IH	},
	{ 'O',  (PFUK <<PSFONT)+OY	},
	{ 'o',  (PFUK <<PSFONT)+OW	},
	{ 'u',  (PFUK <<PSFONT)+UW	},
	{ '^',  (PFUK <<PSFONT)+AH	},
	{ 'W',  (PFUK <<PSFONT)+AW	},
	{ 'Y',  (PFUK <<PSFONT)+YU	},
	{ 'R',  (PFUK <<PSFONT)+RR	},
	{ 'c',  (PFUK <<PSFONT)+AO	},
	{ '@',  (PFUK <<PSFONT)+AE	},
	{ 'U',  (PFUK <<PSFONT)+UH	},
	{ '|',  (PFUK <<PSFONT)+IX	},
	{ 'x',  (PFUK <<PSFONT)+AX	},
	{ 'p',  (PFUK <<PSFONT)+P	},
	{ 't',  (PFUK <<PSFONT)+T	},
	{ 'k',  (PFUK <<PSFONT)+K	},
	{ 'f',  (PFUK <<PSFONT)+F	},
	{ 'T',  (PFUK <<PSFONT)+TH	},
	{ 's',  (PFUK <<PSFONT)+S	},
	{ 'S',  (PFUK <<PSFONT)+SH	},
	{ 'C',  (PFUK <<PSFONT)+CH	},
	{ 'w',  (PFUK <<PSFONT)+W	},
	{ 'y',  (PFUK <<PSFONT)+Y	},
	{ 'h',  (PFUK <<PSFONT)+HX	},
	{ 'l',  (PFUK <<PSFONT)+LL	},
	{ 'L',  (PFUK <<PSFONT)+EL	},
	{ 'N',  (PFUK <<PSFONT)+EN	},
	{ 'b',  (PFUK <<PSFONT)+B	},
	{ 'd',  (PFUK <<PSFONT)+D	},
	{ 'g',  (PFUK <<PSFONT)+G	},
	{ 'v',  (PFUK <<PSFONT)+V	},
	{ 'D',  (PFUK <<PSFONT)+DH	},
	{ 'z',  (PFUK <<PSFONT)+Z	},
	{ 'Z',  (PFUK <<PSFONT)+ZH	},
	{ 'J',  (PFUK <<PSFONT)+JH	},
	{ 'm',  (PFUK <<PSFONT)+M	},
	{ 'n',  (PFUK <<PSFONT)+N	},
	{ 'G',  (PFUK <<PSFONT)+NX	},
	{ 'r',  (PFUK <<PSFONT)+R	},
	{ 'q',  (PFUK <<PSFONT)+Q	},
	{ 'Q',  (PFUK <<PSFONT)+TX	},
	{ 'B',	(PFUK <<PSFONT)+OH	},
	{ 'F',	(PFUK <<PSFONT)+IR	},
	{ 'K',	(PFUK <<PSFONT)+ER	},
	{ 'P',	(PFUK <<PSFONT)+AR	},
	{ 'M',	(PFUK <<PSFONT)+OR	},
	{ 'j',	(PFUK <<PSFONT)+UR	},
	{ 'V',	(PFUK <<PSFONT)+YR	},
	{ 'X',	(PFUK <<PSFONT)+LX	},
	{ 'H',	(PFUK <<PSFONT)+DZ	},
	{ ',',  (PFUK <<PSFONT)+COMMA	},
	{ ' ',  (PFUK <<PSFONT)+WBOUND	},
	{ '\t',	(PFUK <<PSFONT)+WBOUND	},
	{ '\'',	(PFUK <<PSFONT)+S1	},
	{ '`',  (PFUK <<PSFONT)+S2	},
	{ '"',  (PFUK <<PSFONT)+SEMPH	},
	{ '#',  (PFUK <<PSFONT)+HYPHEN	},
	{ '(',  (PFUK <<PSFONT)+PPSTART },
	{ ')',  (PFUK <<PSFONT)+VPSTART },
	{ '*',  (PFUK <<PSFONT)+MBOUND	},
	{ '~',  (PFUK <<PSFONT)+BLOCK_RULES },
	{ '-',  (PFUK <<PSFONT)+SBOUND 	}

};

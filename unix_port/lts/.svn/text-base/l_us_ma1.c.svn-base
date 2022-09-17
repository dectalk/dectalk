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
 *    File Name:	l_us_ma1.c
 *    Author:		Matthew Schnee                                         
 *    Creation Date:02/06/96                                                   
 *                                                                             
 *    Functionality:                                                           
 *    English math mode stuff                                                                           
 *                                                                             
 ***********************************************************************       
 * 
 *    Revision History:
 *                                                                           
 * Rev  Who     Date                    Description                    
 * ---	-----	-----------		---------------------------------------
 * 001  GL      10/28/1997              add ir,er,ar,or,ur,df entry
 * 
 */

struct math_symbols math_table[] = 
{

	{'+',"pl'^s"},
	{'-',"m'An|s"},
	{'*',"m'^lt|plAd*bA"},
	{'/',"d|v'Ad|d*bA"},
	{'^',"tU*Dx*p'WR*xv"},
	{'<',"l'Es*DEn"},
	{'>',"gr'etR*DEn"},
	{'=',"'ikwLz"},
	{'%',"pRs'Ent"},
	{'.',"p'Ont"},
	{0,0}
};

ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	(PFUSA <<PSFONT)+EY	},
	{ 'a',	(PFUSA <<PSFONT)+AA	},
	{ 'i',	(PFUSA <<PSFONT)+IY	},
	{ 'E',	(PFUSA <<PSFONT)+EH	},
	{ 'A',	(PFUSA <<PSFONT)+AY	},
	{ 'I',  (PFUSA <<PSFONT)+IH	},
	{ 'O',  (PFUSA <<PSFONT)+OY	},
	{ 'o',  (PFUSA <<PSFONT)+OW	},
	{ 'u',  (PFUSA <<PSFONT)+UW	},
	{ '^',  (PFUSA <<PSFONT)+AH	},
	{ 'W',  (PFUSA <<PSFONT)+AW	},
	{ 'Y',  (PFUSA <<PSFONT)+YU	},
	{ 'R',  (PFUSA <<PSFONT)+RR	},
	{ 'c',  (PFUSA <<PSFONT)+AO	},
	{ '@',  (PFUSA <<PSFONT)+AE	},
	{ 'U',  (PFUSA <<PSFONT)+UH	},
	{ '|',  (PFUSA <<PSFONT)+IX	},
	{ 'x',  (PFUSA <<PSFONT)+AX	},
	{ 'p',  (PFUSA <<PSFONT)+P	},
	{ 't',  (PFUSA <<PSFONT)+T	},
	{ 'k',  (PFUSA <<PSFONT)+K	},
	{ 'f',  (PFUSA <<PSFONT)+F	},
	{ 'T',  (PFUSA <<PSFONT)+TH	},
	{ 's',  (PFUSA <<PSFONT)+S	},
	{ 'S',  (PFUSA <<PSFONT)+SH	},
	{ 'C',  (PFUSA <<PSFONT)+CH	},
	{ 'w',  (PFUSA <<PSFONT)+W	},
	{ 'y',  (PFUSA <<PSFONT)+Y	},
	{ 'h',  (PFUSA <<PSFONT)+HX	},
	{ 'l',  (PFUSA <<PSFONT)+LL	},
	{ 'L',  (PFUSA <<PSFONT)+EL	},
	{ 'N',  (PFUSA <<PSFONT)+EN	},
	{ 'b',  (PFUSA <<PSFONT)+B	},
	{ 'd',  (PFUSA <<PSFONT)+D	},
	{ 'g',  (PFUSA <<PSFONT)+G	},
	{ 'v',  (PFUSA <<PSFONT)+V	},
	{ 'D',  (PFUSA <<PSFONT)+DH	},
	{ 'z',  (PFUSA <<PSFONT)+Z	},
	{ 'Z',  (PFUSA <<PSFONT)+ZH	},
	{ 'J',  (PFUSA <<PSFONT)+JH	},
	{ 'm',  (PFUSA <<PSFONT)+M	},
	{ 'n',  (PFUSA <<PSFONT)+N	},
	{ 'G',  (PFUSA <<PSFONT)+NX	},
	{ 'r',  (PFUSA <<PSFONT)+R	},
	{ 'q',  (PFUSA <<PSFONT)+Q	},
	{ 'Q',  (PFUSA <<PSFONT)+TX	},
	{ '&',  (PFUSA <<PSFONT)+DX	},
        { 'F',  (PFUSA <<PSFONT)+DF     },
        { 'B',  (PFUSA <<PSFONT)+IR     },
        { 'K',  (PFUSA <<PSFONT)+ER     },
        { 'P',  (PFUSA <<PSFONT)+AR     },
        { 'M',  (PFUSA <<PSFONT)+OR     },
        { 'j',  (PFUSA <<PSFONT)+UR     },
	{ ',',  (PFUSA <<PSFONT)+COMMA	},
	{ ' ',  (PFUSA <<PSFONT)+WBOUND	},
	{ '\t',	(PFUSA <<PSFONT)+WBOUND	},
	{ '\'',	(PFUSA <<PSFONT)+S1	},
	{ '`',  (PFUSA <<PSFONT)+S2	},
	{ '"',  (PFUSA <<PSFONT)+SEMPH	},
	{ '#',  (PFUSA <<PSFONT)+HYPHEN	},
	{ '(',  (PFUSA <<PSFONT)+PPSTART },
	{ ')',  (PFUSA <<PSFONT)+VPSTART },
	{ '*',  (PFUSA <<PSFONT)+MBOUND	},
	{ '~',  (PFUSA <<PSFONT)+BLOCK_RULES },
	{ '-',  (PFUSA <<PSFONT)+SBOUND 	}
};

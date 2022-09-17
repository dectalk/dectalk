/*
 **********************************************************************
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.        
 *                                
 *    Restricted Rights: Use, duplication, or disclosure by the U.S.    
 *    Government is subject to restrictions as set forth in subparagraph
 *    (c) (1) (ii) of DFARS 252.227-7013, or in FAR 52.227-19, or in FAR
 *    52.227-14 Alt. III, as applicable.                                
 *                                                                      
 *    This software is proprietary to and embodies the confidential
 *    technology of Force Computers Incorporated and other parties.
 *    Possession, use, or copying of this software and media is authorized
 *    only pursuant to a valid written license from Force or an
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
 * 001  GL      10/28/1997      add ir,er,ar,or,ur,df entry
 * 002	MGS		04/13/2000		Changes for integrated phoneme set 
 * 003 	CAB		10/18/2000		Changed copyright info
 * 
 */

#include "ls_def.h"
#include "ls_math.h"

#ifdef OS_PALM
#pragma pcrelconstdata off
#endif

const struct math_symbols math_table[] = 
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

const ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	(PFUSA <<PSFONT)+US_EY	},
	{ 'a',	(PFUSA <<PSFONT)+US_AA	},
	{ 'i',	(PFUSA <<PSFONT)+US_IY	},
	{ 'E',	(PFUSA <<PSFONT)+US_EH	},
	{ 'A',	(PFUSA <<PSFONT)+US_AY	},
	{ 'I',  (PFUSA <<PSFONT)+US_IH	},
	{ 'O',  (PFUSA <<PSFONT)+US_OY	},
	{ 'o',  (PFUSA <<PSFONT)+US_OW	},
	{ 'u',  (PFUSA <<PSFONT)+US_UW	},
	{ '^',  (PFUSA <<PSFONT)+US_AH	},
	{ 'W',  (PFUSA <<PSFONT)+US_AW	},
	{ 'Y',  (PFUSA <<PSFONT)+US_YU	},
	{ 'R',  (PFUSA <<PSFONT)+US_RR	},
	{ 'c',  (PFUSA <<PSFONT)+US_AO	},
	{ '@',  (PFUSA <<PSFONT)+US_AE	},
	{ 'U',  (PFUSA <<PSFONT)+US_UH	},
	{ '|',  (PFUSA <<PSFONT)+US_IX	},
	{ 'x',  (PFUSA <<PSFONT)+US_AX	},
	{ 'p',  (PFUSA <<PSFONT)+US_P	},
	{ 't',  (PFUSA <<PSFONT)+US_T	},
	{ 'k',  (PFUSA <<PSFONT)+US_K	},
	{ 'f',  (PFUSA <<PSFONT)+US_F	},
	{ 'T',  (PFUSA <<PSFONT)+US_TH	},
	{ 's',  (PFUSA <<PSFONT)+US_S	},
	{ 'S',  (PFUSA <<PSFONT)+US_SH	},
	{ 'C',  (PFUSA <<PSFONT)+US_CH	},
	{ 'w',  (PFUSA <<PSFONT)+US_W	},
	{ 'y',  (PFUSA <<PSFONT)+US_Y	},
	{ 'h',  (PFUSA <<PSFONT)+US_HX	},
	{ 'l',  (PFUSA <<PSFONT)+US_LL	},
	{ 'L',  (PFUSA <<PSFONT)+US_EL	},
	{ 'N',  (PFUSA <<PSFONT)+US_EN	},
	{ 'b',  (PFUSA <<PSFONT)+US_B	},
	{ 'd',  (PFUSA <<PSFONT)+US_D	},
	{ 'g',  (PFUSA <<PSFONT)+US_G	},
	{ 'v',  (PFUSA <<PSFONT)+US_V	},
	{ 'D',  (PFUSA <<PSFONT)+US_DH	},
	{ 'z',  (PFUSA <<PSFONT)+US_Z	},
	{ 'Z',  (PFUSA <<PSFONT)+US_ZH	},
	{ 'J',  (PFUSA <<PSFONT)+US_JH	},
	{ 'm',  (PFUSA <<PSFONT)+US_M	},
	{ 'n',  (PFUSA <<PSFONT)+US_N	},
	{ 'G',  (PFUSA <<PSFONT)+US_NX	},
	{ 'r',  (PFUSA <<PSFONT)+US_R	},
	{ 'q',  (PFUSA <<PSFONT)+US_Q	},
	{ 'Q',  (PFUSA <<PSFONT)+US_TX	},
	{ '&',  (PFUSA <<PSFONT)+US_DX	},
        { 'F',  (PFUSA <<PSFONT)+US_DF     },
        { 'B',  (PFUSA <<PSFONT)+US_IR     },
        { 'K',  (PFUSA <<PSFONT)+US_ER     },
        { 'P',  (PFUSA <<PSFONT)+US_AR     },
        { 'M',  (PFUSA <<PSFONT)+US_OR     },
        { 'j',  (PFUSA <<PSFONT)+US_UR     },
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


const int	NATAB=	(sizeof(ascky_tab)/sizeof(struct ascky_table));

#ifdef OS_PALM
#pragma pcrelconstdata on
#endif

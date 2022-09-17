/*
 **********************************************************************
 *                           Copyright ©                              
 *    Copyright © 2000,2001 Force Computer, Inc., a Solectron company. All rights reserved.
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
 * 001	DR/GL	10/01/1997		modified from l_us_ma1.c for UK_english     
 * 002	MGS		04/13/2000		Changes for integrated phoneme set 
 * 003 	CAB		10/18/2000		Changed copyright info
 * 004	CAB		11/14/2001		Removal of UK_YR produced error in dictionary
 * 
 */
#include "ls_def.h"
#include "ls_math.h"
const struct math_symbols math_table[] = 
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

const ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	(PFUK <<PSFONT)+UK_EY	},
	{ 'a',	(PFUK <<PSFONT)+UK_AA	},
	{ 'i',	(PFUK <<PSFONT)+UK_IY	},
	{ 'E',	(PFUK <<PSFONT)+UK_EH	},
	{ 'A',	(PFUK <<PSFONT)+UK_AY	},
	{ 'I',  (PFUK <<PSFONT)+UK_IH	},
	{ 'O',  (PFUK <<PSFONT)+UK_OY	},
	{ 'o',  (PFUK <<PSFONT)+UK_OW	},
	{ 'u',  (PFUK <<PSFONT)+UK_UW	},
	{ '^',  (PFUK <<PSFONT)+UK_AH	},
	{ 'W',  (PFUK <<PSFONT)+UK_AW	},
	{ 'Y',  (PFUK <<PSFONT)+UK_YU	},
	{ 'R',  (PFUK <<PSFONT)+UK_RR	},
	{ 'c',  (PFUK <<PSFONT)+UK_AO	},
	{ '@',  (PFUK <<PSFONT)+UK_AE	},
	{ 'U',  (PFUK <<PSFONT)+UK_UH	},
	{ '|',  (PFUK <<PSFONT)+UK_IX	},
	{ 'x',  (PFUK <<PSFONT)+UK_AX	},
	{ 'p',  (PFUK <<PSFONT)+UK_P	},
	{ 't',  (PFUK <<PSFONT)+UK_T	},
	{ 'k',  (PFUK <<PSFONT)+UK_K	},
	{ 'f',  (PFUK <<PSFONT)+UK_F	},
	{ 'T',  (PFUK <<PSFONT)+UK_TH	},
	{ 's',  (PFUK <<PSFONT)+UK_S	},
	{ 'S',  (PFUK <<PSFONT)+UK_SH	},
	{ 'C',  (PFUK <<PSFONT)+UK_CH	},
	{ 'w',  (PFUK <<PSFONT)+UK_W	},
	{ 'y',  (PFUK <<PSFONT)+UK_Y	},
	{ 'h',  (PFUK <<PSFONT)+UK_HX	},
	{ 'l',  (PFUK <<PSFONT)+UK_LL	},
	{ 'L',  (PFUK <<PSFONT)+UK_EL	},
	{ 'N',  (PFUK <<PSFONT)+UK_EN	},
	{ 'b',  (PFUK <<PSFONT)+UK_B	},
	{ 'd',  (PFUK <<PSFONT)+UK_D	},
	{ 'g',  (PFUK <<PSFONT)+UK_G	},
	{ 'v',  (PFUK <<PSFONT)+UK_V	},
	{ 'D',  (PFUK <<PSFONT)+UK_DH	},
	{ 'z',  (PFUK <<PSFONT)+UK_Z	},
	{ 'Z',  (PFUK <<PSFONT)+UK_ZH	},
	{ 'J',  (PFUK <<PSFONT)+UK_JH	},
	{ 'm',  (PFUK <<PSFONT)+UK_M	},
	{ 'n',  (PFUK <<PSFONT)+UK_N	},
	{ 'G',  (PFUK <<PSFONT)+UK_NX	},
	{ 'r',  (PFUK <<PSFONT)+UK_R	},
	{ 'q',  (PFUK <<PSFONT)+UK_Q	},
	{ 'Q',  (PFUK <<PSFONT)+UK_TX	},
	{ 'B',	(PFUK <<PSFONT)+UK_OH	},
	{ 'F',	(PFUK <<PSFONT)+UK_IR	},
	{ 'K',	(PFUK <<PSFONT)+UK_ER	},
	{ 'P',	(PFUK <<PSFONT)+UK_AR	},
	{ 'M',	(PFUK <<PSFONT)+UK_OR	},
	{ 'j',	(PFUK <<PSFONT)+UK_UR	},
	{ 'V',	(PFUK <<PSFONT)+UK_YR	},
	{ 'X',	(PFUK <<PSFONT)+UK_LX	},
	{ 'H',	(PFUK <<PSFONT)+UK_DZ	},
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

const int	NATAB=	(sizeof(ascky_tab)/sizeof(struct ascky_table));

/*
 **********************************************************************
 *                           Copyright ©
 *	  Copyright © 2000-2001 Force Computers, Inc., a Solectron Company. All rights reserved.
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
 *    File Name:	l_fr_ma1.c
 *    Author:		                                       
 *    Creation Date:                                                 
 *                                                                             
 *    Functionality:                                                           
 *    French math mode stuff                                                                           
 *                                                                             
 ***********************************************************************       
 * 
 *    Revision History:
 *                                                                           
 * Rev  Who     Date                    Description                    
 * ---	-----	-----------		---------------------------------------
 * 001 	CAB		10/16/2000		Changed copyright info
 * 002  CAB		03/21/2001		Changes for math_table by michel
 */
#include "ls_def.h"
#include "ls_math.h"
const struct math_symbols math_table[] = 
{
	{'+',"plys"},          // y : U
	{'-',"mwè "},           // è : In
	{'*',"myltipliepaç "},  // ç : R
	{'/',"divisepaç "},     // e : é
    {'^',"alapæisâs"},
	{'<',"èféçjìça"},
	{'>',"sypeçjìça"},     // j : Y; ì : O6
	{'=',"egal"},
	{'%',"puçsâ "},
	{'.',"pwè "},
	{0,0}
};

const ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
{ 'a', (PFFR<<PSFONT) + F_A },
{ 0xe0, (PFFR<<PSFONT) + F_A3 },
{ 0xee, (PFFR<<PSFONT) + F_E2 },
{ 0xe5, (PFFR<<PSFONT) + F_AU },
{ 0xe9, (PFFR<<PSFONT) + F_E },
{ 'e', (PFFR<<PSFONT) + F_E1 },
{ 0xed, (PFFR<<PSFONT) + F_EU },
{ 'i', (PFFR<<PSFONT) + F_I },
{ 'o', (PFFR<<PSFONT) + F_O },
{ 0xec, (PFFR<<PSFONT) + F_O6 },
{ 'u', (PFFR<<PSFONT) + F_OU },
{ 'y', (PFFR<<PSFONT) + F_U },
{ 0xe2, (PFFR<<PSFONT) + F_AN },
{ 0xe8, (PFFR<<PSFONT) + F_IN },
{ 0xeb, (PFFR<<PSFONT) + F_ON },
{ 0xea, (PFFR<<PSFONT) + F_UN },
{ 'h', (PFFR<<PSFONT) + F_AP },
{ 'l', (PFFR<<PSFONT) + F_L },
{ 0xe7, (PFFR<<PSFONT) + F_R },
{ 'w', (PFFR<<PSFONT) + F_W },
{ 0xe6, (PFFR<<PSFONT) + F_WU },
{ 'j', (PFFR<<PSFONT) + F_Y },
{ 0xf4, (PFFR<<PSFONT) + F_CH },
{ 'f', (PFFR<<PSFONT) + F_F },
{ 0xe4, (PFFR<<PSFONT) + F_J },
{ 'x', (PFFR<<PSFONT) + F_RX },
{ 's', (PFFR<<PSFONT) + F_S },
{ 'v', (PFFR<<PSFONT) + F_V },
{ 'z', (PFFR<<PSFONT) + F_Z },
{ 'b', (PFFR<<PSFONT) + F_B },
{ 'd', (PFFR<<PSFONT) + F_D },
{ 'g', (PFFR<<PSFONT) + F_G },
{ 'k', (PFFR<<PSFONT) + F_K },
{ 'p', (PFFR<<PSFONT) + F_P },
{ 't', (PFFR<<PSFONT) + F_T },
{ 0xef, (PFFR<<PSFONT) + F_GN },
{ 'm', (PFFR<<PSFONT) + F_M },
{ 'n', (PFFR<<PSFONT) + F_N },
{ 0xe3, (PFFR<<PSFONT) + F_NG },
	{ ',',  (PFFR <<PSFONT)+COMMA	},
	{ ' ',  (PFFR <<PSFONT)+WBOUND	},
	{ '\t',	(PFFR <<PSFONT)+WBOUND	},
	{ '\'',	(PFFR <<PSFONT)+S1	},
	{ '`',  (PFFR <<PSFONT)+S2	},
	{ '"',  (PFFR <<PSFONT)+SEMPH	},
	{ '#',  (PFFR <<PSFONT)+HYPHEN	},
	{ '(',  (PFFR <<PSFONT)+PPSTART },
	{ ')',  (PFFR <<PSFONT)+VPSTART },
	{ '*',  (PFFR <<PSFONT)+MBOUND	},
	{ '~',  (PFFR <<PSFONT)+BLOCK_RULES },
	{ '-',  (PFFR <<PSFONT)+SBOUND 	}
};

const int	NATAB=	(sizeof(ascky_tab)/sizeof(struct ascky_table));

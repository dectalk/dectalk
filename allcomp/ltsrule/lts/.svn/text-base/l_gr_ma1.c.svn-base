/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *	  Copyright © 2002 Fonix Corporation. All rights reserved.
 *	  Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
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
 *    File Name:	l_gr_ma1.c
 *    Author:       JDB
 *    Creation Date:6/19/96
 *
 *    Functionality:
 *    handle mode math stuff ...
 *
 ***********************************************************************
 *    Revision History:
 *                                                                             
 * Rev	Who		Date		Description                    
 * ---	-----	-----------	---------------------------------------
 * 001	MGS		04/13/2000	Changes for integrated phoneme set 
 * 002 	CAB		10/18/2000	Changed copyright info
 * 003	CAB		08/09/2002	Updated Copyright info
 *
 */
#include "ls_def.h"
#include "ls_math.h"
const struct math_symbols math_table[] = 
{
	{'+',"plUs"},
	{'-',"m3nUs"},
	{'*',"StVRn"},
	{'/',"Sr'7k*StrIx"},
	{'^',"T`IRkUmfl'V?"},
	{'<',"klAn*@R"},
	{'>',"gRQs*@R"},
	{'=',"glAx"},
	{'%',"prc*T'Ent"},
	{'.',"p'UGkt"},
	{0,0}
};

const ASCKY_TAB  ascky_tab[]  = {                     /* Phoneme translation table    */
	{ 'a',(PFGR <<PSFONT)+GR_A},
	{ 'E',(PFGR <<PSFONT)+GR_E},
	{ 'V',(PFGR <<PSFONT)+GR_AE},
	{ '@',(PFGR <<PSFONT)+GR_EX},
	{ 'I',(PFGR <<PSFONT)+GR_I},
	{ 'c',(PFGR <<PSFONT)+GR_O},
	{ 'Q',(PFGR <<PSFONT)+GR_OE},
	{ 'U',(PFGR <<PSFONT)+GR_U},
	{ 'Y',(PFGR <<PSFONT)+GR_UE},
	{ '1',(PFGR <<PSFONT)+GR_AH}, 
	{ '2',(PFGR <<PSFONT)+GR_EH},
	{ '7',(PFGR <<PSFONT)+GR_AEH}, 
	{ '3',(PFGR <<PSFONT)+GR_IH},
	{ '4',(PFGR <<PSFONT)+GR_OH},
	{ 'q',(PFGR <<PSFONT)+GR_OEH},
	{ '5',(PFGR <<PSFONT)+GR_UH},
	{ 'y',(PFGR <<PSFONT)+GR_UEH},
	{ 'A',(PFGR <<PSFONT)+GR_EI},
	{ 'W',(PFGR <<PSFONT)+GR_AU},
	{ 'H',(PFGR <<PSFONT)+GR_EU},
	{ '8',(PFGR <<PSFONT)+GR_AN},
	{ '^',(PFGR <<PSFONT)+GR_IM},
	{ '9',(PFGR <<PSFONT)+GR_UM},
	{ '%',(PFGR <<PSFONT)+GR_ON},
	{ 'j',(PFGR <<PSFONT)+GR_J},
	{ 'l',(PFGR <<PSFONT)+GR_L},
	{ 'r',(PFGR <<PSFONT)+GR_RR},
	{ 'R',(PFGR <<PSFONT)+GR_R},
	{ 'h',(PFGR <<PSFONT)+GR_H},
	{ 'm',(PFGR <<PSFONT)+GR_M},
	{ 'n',(PFGR <<PSFONT)+GR_N},
	{ 'G',(PFGR <<PSFONT)+GR_NG},
	{ 'L',(PFGR <<PSFONT)+GR_EL},
	{ 'M',(PFGR <<PSFONT)+GR_EM},
	{ 'N',(PFGR <<PSFONT)+GR_EN},
	{ 'f',(PFGR <<PSFONT)+GR_F},
	{ 'v',(PFGR <<PSFONT)+GR_V},
	{ 's',(PFGR <<PSFONT)+GR_S},
	{ 'z',(PFGR <<PSFONT)+GR_Z},
	{ 'S',(PFGR <<PSFONT)+GR_SH},
	{ 'Z',(PFGR <<PSFONT)+GR_ZH},
	{ 'x',(PFGR <<PSFONT)+GR_CH},
	{ 'X',(PFGR <<PSFONT)+GR_KH},
	{ 'p',(PFGR <<PSFONT)+GR_P},
	{ 'b',(PFGR <<PSFONT)+GR_B},
	{ 'd',(PFGR <<PSFONT)+GR_D},
	{ 't',(PFGR <<PSFONT)+GR_T},
	{ 'k',(PFGR <<PSFONT)+GR_K},
	{ 'g',(PFGR <<PSFONT)+GR_G},
	{ '|',(PFGR <<PSFONT)+GR_Q},
	{ 'P',(PFGR <<PSFONT)+GR_PF},
	{ 'T',(PFGR <<PSFONT)+GR_TS},
	{ 'J',(PFGR <<PSFONT)+GR_DJ},
	{ 'C',(PFGR <<PSFONT)+GR_TJ},
	{ 'K',(PFGR <<PSFONT)+GR_KSX},
	{ ',',  COMMA   },
	{ ' ',  WBOUND  },
	{ '\t', WBOUND  },
	{ '\'', S1      },
	{ '`',  S2      },
	{ '"',  SEMPH   },
	{ '#',  HYPHEN  },
	{ '(',  PPSTART },
	{ ')',  VPSTART },
	{ '*',  MBOUND  },
	{ '~',  BLOCK_RULES },
	{ '-',  SBOUND  }
};
const int	NATAB=	(sizeof(ascky_tab)/sizeof(struct ascky_table));

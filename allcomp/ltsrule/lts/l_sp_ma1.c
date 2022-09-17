/*
 ***********************************************************************
 *
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
 *    File Name:	l_sp_ma1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  handle mode math stuff ...
 *
 ***********************************************************************
 *    Revision History:
 * 001	MGS		04/13/2000		Changes for integrated phoneme set 
 * 002 	CAB		10/18/2000		Changed copyright info
 *
 */
#include "ls_def.h"
#include "ls_math.h"
const struct math_symbols math_table[] = {

	{'+',"ma's "},
	{'-',"m'enos "},
	{'*',"multiplik'ado por "},
	{'/',"dibid'ido por "},
	{'^',"eleb'ado a "},
	{'<',"men'or ke "},
	{'>',"may'or "},
	{'=',"'igu'al "},
	{'%',"p`or Ti'ento "},
	{'.',"k'oma"},
	{0,0}
};


const ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	(PFSP <<PSFONT)+SP_E },
	{ 'a',	(PFSP <<PSFONT)+SP_A },
	{ 'i',	(PFSP <<PSFONT)+SP_I },
	{ 'o',	(PFSP <<PSFONT)+SP_O },
	{ 'u',	(PFSP <<PSFONT)+SP_U },
	{ 'p',	(PFSP <<PSFONT)+SP_P },
	{ 't',	(PFSP <<PSFONT)+SP_T },
	{ 'k',	(PFSP <<PSFONT)+SP_K },
	{ 'j',	(PFSP <<PSFONT)+SP_J },
	{ 'f',	(PFSP <<PSFONT)+SP_F },
	{ 'T',	(PFSP <<PSFONT)+SP_TH },
	{ 's',	(PFSP <<PSFONT)+SP_S },
	{ 'z',	(PFSP <<PSFONT)+SP_Z },
	{ 'C',	(PFSP <<PSFONT)+SP_CH },
	{ '1',	(PFSP <<PSFONT)+SP_NH },
	{ '2',	(PFSP <<PSFONT)+SP_YH },
	{ 'y',	(PFSP <<PSFONT)+SP_Y },
	{ 'w',	(PFSP <<PSFONT)+SP_W },
	{ 'W',	(PFSP <<PSFONT)+SP_WX },
	{ 'l',	(PFSP <<PSFONT)+SP_L	},
	{ 'L',	(PFSP <<PSFONT)+SP_LL	},
	{ '1',	(PFSP <<PSFONT)+SP_NH },
	{ 'N',	(PFSP <<PSFONT)+SP_NX	},
	{ 'd',	(PFSP <<PSFONT)+SP_D	},
	{ 'b',	(PFSP <<PSFONT)+SP_B	},
	{ 'p',	(PFSP <<PSFONT)+SP_P	},
	{ 'B',	(PFSP <<PSFONT)+SP_BH	},
	{ 'g',	(PFSP <<PSFONT)+SP_G	},
	{ 'D',	(PFSP <<PSFONT)+SP_DH},
	{ 'm',	(PFSP <<PSFONT)+SP_M	},
	{ 'n',	(PFSP <<PSFONT)+SP_N	},
	{ 'G',	(PFSP <<PSFONT)+SP_GH	},
	{ 'R',	(PFSP <<PSFONT)+SP_RR },
	{ 'r',	(PFSP <<PSFONT)+SP_R	},
	{ 'q',	(PFSP <<PSFONT)+SP_Q	},
	{ 'V',	(PFSP <<PSFONT)+SP_V	},
	{ 'I',	(PFSP <<PSFONT)+SP_IX	},
	{ 'M',	(PFSP <<PSFONT)+SP_MX	},
	{ 'P',	(PFSP <<PSFONT)+SP_PH	},
	{ ',', 	COMMA	},
	{ ' ',	WBOUND	},
	{ '\t',	WBOUND	},
	{ '\'',	S1	},
	{ '`',	S2	},
	{ '"',	SEMPH	},
	{ '#',	HYPHEN	},
	{ '(',	PPSTART },
	{ ')',	VPSTART },
	{ '*',	MBOUND	},
	{ '~',	BLOCK_RULES },
	{ '-',	SBOUND 	}
};

const int	NATAB=	(sizeof(ascky_tab)/sizeof(struct ascky_table));

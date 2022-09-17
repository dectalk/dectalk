/*
 ***********************************************************************
 *
 *                           Copyright ©
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved. 
 *    © Digital Equipment Corporation 1996, 1997. All rights reserved.
 *
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
 *    File Name:	l_la_ma1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  handle mode math stuff ...
 *
 ***********************************************************************
 *    Revision History:
 *
 *  001	MFG		06/17/1998		Copied from l_la_ma1.c
 *  002	MGS		04/13/2000		Changes for integrated phoneme set 
 *  003 CAB		10/18/2000		Changed copyright info
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
	{ 'e',	(PFLA <<PSFONT)+LA_E },
	{ 'a',	(PFLA <<PSFONT)+LA_A },
	{ 'i',	(PFLA <<PSFONT)+LA_I },
	{ 'o',	(PFLA <<PSFONT)+LA_O },
	{ 'u',	(PFLA <<PSFONT)+LA_U },
	{ 'p',	(PFLA <<PSFONT)+LA_P },
	{ 't',	(PFLA <<PSFONT)+LA_T },
	{ 'k',	(PFLA <<PSFONT)+LA_K },
	{ 'j',	(PFLA <<PSFONT)+LA_J },
	{ 'f',	(PFLA <<PSFONT)+LA_F },
	{ 'T',	(PFLA <<PSFONT)+LA_TH },
	{ 's',	(PFLA <<PSFONT)+LA_S },
	{ 'z',	(PFLA <<PSFONT)+LA_Z },
	{ 'C',	(PFLA <<PSFONT)+LA_CH },
	{ '1',	(PFLA <<PSFONT)+LA_NH },
	{ '2',	(PFLA <<PSFONT)+LA_YH },
	{ 'y',	(PFLA <<PSFONT)+LA_Y },
	{ 'w',	(PFLA <<PSFONT)+LA_W },
	{ 'W',	(PFLA <<PSFONT)+LA_WX },
	{ 'l',	(PFLA <<PSFONT)+LA_L	},
	{ 'L',	(PFLA <<PSFONT)+LA_LL	},
	{ '1',	(PFLA <<PSFONT)+LA_NH },
	{ 'N',	(PFLA <<PSFONT)+LA_NX	},
	{ 'd',	(PFLA <<PSFONT)+LA_D	},
	{ 'b',	(PFLA <<PSFONT)+LA_B	},
	{ 'p',	(PFLA <<PSFONT)+LA_P	},
	{ 'B',	(PFLA <<PSFONT)+LA_BH	},
	{ 'g',	(PFLA <<PSFONT)+LA_G	},
	{ 'D',	(PFLA <<PSFONT)+LA_DH},
	{ 'm',	(PFLA <<PSFONT)+LA_M	},
	{ 'n',	(PFLA <<PSFONT)+LA_N	},
	{ 'G',	(PFLA <<PSFONT)+LA_GH	},
	{ 'R',	(PFLA <<PSFONT)+LA_RR },
	{ 'r',	(PFLA <<PSFONT)+LA_R	},
	{ 'q',	(PFLA <<PSFONT)+LA_Q	},
	{ 'V',	(PFLA <<PSFONT)+LA_V	},
	{ 'I',	(PFLA <<PSFONT)+LA_IX	},
	{ 'M',	(PFLA <<PSFONT)+LA_MX	},
	{ 'P',	(PFLA <<PSFONT)+LA_PH	},
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


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
 *    File Name:	l_sp_ma1.c
 *    Author:
 *    Creation Date:
 *
 *    Functionality:
 *  handle mode math stuff ...
 *
 ***********************************************************************
 *    Revision History:
 *
 */

struct math_symbols math_table[] = {

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


ASCKY_TAB ascky_tab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	E_E },
	{ 'a',	E_A },
	{ 'i',	E_I },
	{ 'o',	E_O },
	{ 'u',	E_U },
	{ 'p',	E_P },
	{ 't',	E_T },
	{ 'k',	E_K },
	{ 'j',	E_J },
	{ 'f',	E_F },
	{ 'T',	E_TH },
	{ 's',	E_S },
	{ 'z',	E_Z },
	{ 'C',	E_CH },
	{ '1',	E_NH },
	{ '2',	E_YH },
	{ 'y',	E_Y },
	{ 'w',	E_W },
	{ 'W',	E_WX },
	{ 'l',	E_L	},
	{ 'L',	E_LL	},
	{ '1',	E_NH },
	{ 'N',	E_NX	},
	{ 'd',	E_D	},
	{ 'b',	E_B	},
	{ 'p',	E_P	},
	{ 'B',	E_BH	},
	{ 'g',	E_G	},
	{ 'D',	E_DH},
	{ 'm',	E_M	},
	{ 'n',	E_N	},
	{ 'G',	E_GH	},
	{ 'R',	E_RR },
	{ 'r',	E_R	},
	{ 'q',	E_Q	},
	{ 'V',	E_V	},
	{ 'I',	E_IX	},
	{ 'M',	E_MX	},
	{ 'P',	E_PH	},
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

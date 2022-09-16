/*
 ***********************************************************************
 *
 *                           Coryright (c)
 *    © Digital Equipment Corporation 1996. All rights reserved.
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
 *    File Name:     dic_sp_c.c
 *    Author:        JDB
 *    Creation Date: 5/24/96
 *
 *    Functionality:
 *    Code specific to dictionary compilation for Spanish langauge
 *    Based on v4.3 SPARDIC.C code
 *
 ***********************************************************************
 *    Revision History:
 */

#include "l_sp_ph.h"

/*
 * general defines ...
 */

typedef	struct PTAB {
	char	p_graph;		/* Graphic code.		*/
	char	p_phone;		/* Phonemic code*/
} PTAB;

PTAB ptab[]	= {			/* Phoneme name table (again)	*/
	{ 'e',	E_E},
	{ 'a',	E_A },
	{ 'i',	E_I },
	{ '2',	E_YH},
	{ 'o',	E_O	},
	{ 'u',	E_U	},
	{ '1',	E_NH	},
	{ 'W',	E_WX	},
	{ 'Y',	E_YX},
	{ 'R',	E_RR	},
	{ 'C',	E_CH	},
	{ 'l',	E_L	},
	{ 'p',	E_P	},
	{ 't',	E_T	},
	{ 'k',	E_K	},
	{ 'f',	E_F	},
	{ 'T',	E_TH	},
	{ 's',	E_S	},
	{ 'y',	E_Y	},
	{ 'L',	E_LL	},
	{ 'b',	E_B	},
	{ 'd',	E_D	},
	{ 'g',	E_G	},
	{ 'D',	E_DH	},
	{ 'z',	E_Z	},
	{ 'm',	E_M	},
	{ 'n',	E_N	},
	{ 'G',	E_GH	},
	{ 'r',	E_R	},
	{ 'q',	E_Q	},
	{ 'v', E_V	},
	{ 'I', E_IX	},
	{ 'M', E_MX	},
	{ 'P', E_PH	},
	{ 'N', E_NX	},
	{ 'w', E_W	},
	{ 'B',E_BH	},
	{ 'j',E_J },
	{ ',',	COMMA	},
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

#define DIC_SP
#include "dic_comm.c"



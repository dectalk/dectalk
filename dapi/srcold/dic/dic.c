/*
 ***********************************************************************
 *
 *                           Copyright (c)
 *    Copyright © 2002 Fonix Corportion. All rights reserved.
 *    Copyright © 2000 Force Computer, Inc., a Solectron company. All rights reserved.
 *    © Digital Equipment Corporation 1996. All rights reserved.
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
 *    File Name:     dic_us_c.c
 *    Author:        JDB
 *    Creation Date: 5/23/96  
 *
 *    Functionality:
 *    Code specific to dictionary compilation for US English
 *
 ***********************************************************************
 *    Revision History:
 *
 *		Date		Who				Description
 *		----		---				-----------
 *	001	01/28/1997	ncs				Made one C file for multilanguages
 *	002	10/23/1997	gl				add ENGLISH_UK support
 *  003 10/28/1997  gl              add ir,er,ar,or,ur.df for US
 *  004 12/04/1997  gl              add LINKRWORD for UK English
 *  005 06/29/1998  gl              BATS#702 add DOUBLCONS for German
 *  006	06/18/1998	mfg				SPANISH_SP & SPANISH_LA support added
 *  007	04/13/2000	MGS 			Changes for integrated phoneme set 
 *	008	04/14/2000	NAL				Changed DOUBLCONS '&' to '>'
 *	009	07/20/2000	CHJ				Added French
 *  007 10/18/2000	CAB				Changed copyright info and formatted comments
 *	008	09/11/2002	CAB				Added missing UK_YR
 *		
 */

#include "l_all_ph.h"
#if 0
#ifdef ENGLISH_US
#include "l_us_ph.h"
#endif

#ifdef ENGLISH_UK
#include "l_uk_ph.h"
#define DIC_UK
#endif

#ifdef SPANISH_SP
#include "l_sp_ph.h"
#define DIC_SP
#endif

#ifdef SPANISH_LA
#include "l_la_ph.h"
#define DIC_LA
#endif

#ifdef GERMAN
#include "l_gr_ph.h"
#define DIC_GR
#endif

#ifdef FRENCH
#include "l_fr_ph.h"
#define DIC_FR
#endif
#endif

/*
 * general defines ...
 */
                                                            
typedef struct PTAB {
	unsigned char p_graph;        /* Graphic code. Now unsigned char */
	char p_phone;                /* Phonemic code */
} PTAB;
                          

/* Phoneme name table (again)   */                          
PTAB ptab[]  = {                     
#ifdef ENGLISH_US
	{ 'e',  US_EY      },
	{ 'a',  US_AA      },
	{ 'i',  US_IY      },
	{ 'E',  US_EH      },
	{ 'A',  US_AY      },
	{ 'I',  US_IH      },
	{ 'O',  US_OY      },
	{ 'o',  US_OW      },
	{ 'u',  US_UW      },
	{ '^',  US_AH      },
	{ 'W',  US_AW      },
	{ 'Y',  US_YU      },
	{ 'R',  US_RR      },
	{ 'c',  US_AO      },
	{ '@',  US_AE      },
	{ 'U',  US_UH      },
	{ '|',  US_IX      },
	{ 'x',  US_AX      },
	{ 'p',  US_P       },
	{ 't',  US_T       },
	{ 'k',  US_K       },
	{ 'f',  US_F       },
	{ 'T',  US_TH      },
	{ 's',  US_S       },
	{ 'S',  US_SH      },
	{ 'C',  US_CH      },
	{ 'w',  US_W       },
	{ 'y',  US_Y       },
	{ 'h',  US_HX      },
	{ 'l',  US_LL      },
	{ 'L',  US_EL      },
	{ 'N',  US_EN      },
	{ 'b',  US_B       },
	{ 'd',  US_D       },
	{ 'g',  US_G       },
	{ 'v',  US_V       },
	{ 'D',  US_DH      },
	{ 'z',  US_Z       },
	{ 'Z',  US_ZH      },
	{ 'J',  US_JH      },
	{ 'm',  US_M       },
	{ 'n',  US_N       },
	{ 'G',  US_NX      },
	{ 'r',  US_R       },
	{ 'q',  US_Q       },
	{ 'Q',  US_TX      },
	{ '&',  US_DX      },
    { 'F',  US_DF      },
    { 'B',  US_IR      },
    { 'K',  US_ER      },
    { 'P',  US_AR      },
    { 'M',  US_OR      },
    { 'j',  US_UR      },
#endif

#ifdef ENGLISH_UK
	{ '_', SIL		},
	{ 'i',	UK_IY		},
	{ 'I',	UK_IH		},
	{ 'e',	UK_EY		},
	{ 'E',	UK_EH		},
	{ '@',	UK_AE		},
	{ 'a',	UK_AA		},
	{ 'A',	UK_AY		},
	{ 'W',	UK_AW		},
	{ '^',	UK_AH		},
	{ 'c',	UK_AO		},
	{ 'o',	UK_OW		},
	{ 'O',	UK_OY		},
	{ 'u',	UK_UW		},
	{ 'R',	UK_RR		},
	{ 'Y',	UK_YU		},
	{ 'U',	UK_UH		},
	{ 'x',	UK_AX		},
	{ '|',	UK_IX		},
	{ 'w',	UK_W		},
	{ 'y',	UK_Y		},
	{ 'r',	UK_R		},
	{ 'l',	UK_LL		},
	{ 'h',	UK_HX		},
	{ 'm',	UK_M		},
	{ 'n',	UK_N		},
	{ 'G',	UK_NX		},
	{ 'L',	UK_EL		},
	{ 'N',	UK_EN		},
	{ 'f',	UK_F		},
	{ 'v',	UK_V		},
	{ 'T',	UK_TH		},
	{ 'D',	UK_DH		},
	{ 's',	UK_S		},
	{ 'z',	UK_Z		},
	{ 'S',	UK_SH		},
	{ 'Z',	UK_ZH		},
	{ 'p',	UK_P		},
	{ 'b',	UK_B		},
	{ 't',	UK_T		},
	{ 'd',	UK_D		},
	{ 'k',	UK_K		},
	{ 'g',	UK_G		},
	{ 'Q',	UK_TX		},
	{ 'q',	UK_Q		},
	{ 'J',	UK_JH		},
	{ 'C',	UK_CH		},
	{ 'F',	UK_IR		},
	{ 'K',	UK_ER		},
	{ 'P',	UK_AR		},
	{ 'M',	UK_OR		},
	{ 'j',	UK_UR		},
	{ 'B',	UK_OH		},
	{ 'V',	UK_YR		},
	{ '&',	LINKRWORD	},
#endif

#ifdef SPANISH_SP
	{ 'e',	SP_E		},
	{ 'a',	SP_A		},
	{ 'i',	SP_I		},
	{ '2',	SP_YH	},
	{ 'o',	SP_O		},
	{ 'u',	SP_U		},
	{ '1',	SP_NH	},
	{ 'W',	SP_WX	},
	{ 'Y',	SP_YX	},
	{ 'R',	SP_RR	},
	{ 'C',	SP_CH	},
	{ 'l',	SP_L		},
	{ 'p',	SP_P		},
	{ 't',	SP_T		},
	{ 'k',	SP_K		},
	{ 'f',	SP_F		},
	{ 'T',	SP_TH	},
	{ 's',	SP_S		},
	{ 'y',	SP_Y		},
	{ 'L',	SP_LL	},
	{ 'b',	SP_B		},
	{ 'd',	SP_D		},
	{ 'g',	SP_G		},
	{ 'D',	SP_DH	},
	{ 'z',	SP_Z		},
	{ 'm',	SP_M		},
	{ 'n',	SP_N		},
	{ 'G',	SP_GH	},
	{ 'r',	SP_R		},
	{ 'q',	SP_Q		},
	{ 'v', SP_V		},
	{ 'I', SP_IX		},
	{ 'M', SP_MX		},
	{ 'P', SP_PH		},
	{ 'N', SP_NX		},
	{ 'w', SP_W		},
	{ 'B',SP_BH		},
	{ 'j',SP_J 		},
#endif

#ifdef SPANISH_LA
	{ 'e',	LA_E		},
	{ 'a',	LA_A		},
	{ 'i',	LA_I		},
	{ '2',	LA_YH	},
	{ 'o',	LA_O		},
	{ 'u',	LA_U		},
	{ '1',	LA_NH	},
	{ 'W',	LA_WX	},
	{ 'Y',	LA_YX	},
	{ 'R',	LA_RR	},
	{ 'C',	LA_CH	},
	{ 'l',	LA_L		},
	{ 'p',	LA_P		},
	{ 't',	LA_T		},
	{ 'k',	LA_K		},
	{ 'f',	LA_F		},
	{ 'T',	LA_TH	},
	{ 's',	LA_S		},
	{ 'y',	LA_Y		},
	{ 'L',	LA_LL	},
	{ 'b',	LA_B		},
	{ 'd',	LA_D		},
	{ 'g',	LA_G		},
	{ 'D',	LA_DH	},
	{ 'z',	LA_Z		},
	{ 'm',	LA_M		},
	{ 'n',	LA_N		},
	{ 'G',	LA_GH	},
	{ 'r',	LA_R		},
	{ 'q',	LA_Q		},
	{ 'v', LA_V		},
	{ 'I', LA_IX		},
	{ 'M', LA_MX		},
	{ 'P', LA_PH		},
	{ 'N', LA_NX		},
	{ 'w', LA_W		},
	{ 'B',LA_BH		},
	{ 'j',LA_J 		},
#endif

#ifdef GERMAN
	{ 'a',GR_A			},
	{ 'E',GR_E			},
	{ 'V',GR_AE		},
	{ '@',GR_EX		},
	{ 'I',GR_I			},
	{ 'c',GR_O			},
	{ 'Q',GR_OE		},
	{ 'U',GR_U			},
	{ 'Y',GR_UE		},
	{ '1',GR_AH		}, 
	{ '2',GR_EH		},
	{ '7',GR_AEH		}, 
	{ '3',GR_IH		},
	{ '4',GR_OH		},
	{ 'q',GR_OEH		},
	{ '5',GR_UH		},
	{ '6',GR_UEH		},
	{ 'A',GR_EI		},
	{ 'W',GR_AU		},
	{ 'H',GR_EU		},
	{ '8',GR_AN		},
	{ '^',GR_IM		},
	{ '9',GR_UM		},
	{ '%',GR_ON		},
	{ 'j',GR_J			},
	{ 'l',GR_L			},
	{ 'r',GR_RR		},
	{ 'R',GR_R			},
	{ 'h',GR_H			},
	{ 'm',GR_M			},
	{ 'n',GR_N			},
	{ 'G',GR_NG		},
	{ 'L',GR_EL		},
	{ 'M',GR_EM		},
	{ 'N',GR_EN		},
	{ 'f',GR_F			},
	{ 'v',GR_V			},
	{ 's',GR_S			},
	{ 'z',GR_Z			},
	{ 'S',GR_SH		},
	{ 'Z',GR_ZH		},
	{ 'x',GR_CH		},
	{ 'X',GR_KH		},
	{ 'p',GR_P			},
	{ 'b',GR_B			},
	{ 'd',GR_D			},
	{ 't',GR_T			},
	{ 'k',GR_K			},
	{ 'g',GR_G			},
	{ '?',GR_Q			},
	{ 'P',GR_PF		},
	{ 'T',GR_TS		},
	{ 'J',GR_DJ		},
	{ 'C',GR_TJ		},
	{ '?',GR_KSX		},
	{ 'i',GR_I1		},
	{ 'e',GR_E1		},
	{ 'o',GR_O1		},
	{ 'u',GR_U1		},
	{ 'y',GR_Y1		},
	{ 'B',GR_ER		},
	{ '>',DOUBLCONS		},
#endif

#ifdef FRENCH
{ 'a',	F_A },
{ 0xe0, F_A3 },
{ 0xee, F_E2 },
{ 0xe5, F_AU },
{ 0xe9, F_E },
{ 'e', F_E1 },
{ 0xed, F_EU },
{ 'i', F_I },
{ 'o', F_O },
{ 0xec, F_O6 },
{ 'u', F_OU },
{ 'y', F_U },
{ 0xe2, F_AN },
{ 0xe8, F_IN },
{ 0xeb, F_ON },
{ 0xea, F_UN },
{ 'h', F_AP },
{ 'l', F_L },
{ 0xe7, F_R },
{ 'w', F_W },
{ 0xe6, F_WU },
{ 'j', F_Y },
{ 0xf4, F_CH },
{ 'f', F_F },
{ 0xe4, F_J },
{ 'x', F_RX },
{ 's', F_S },
{ 'v', F_V },
{ 'z', F_Z },
{ 'b', F_B },
{ 'd', F_D },
{ 'g', F_G },
{ 'k', F_K },
{ 'p', F_P },
{ 't', F_T },
{ 0xef, F_GN },
{ 'm', F_M },
{ 'n', F_N },
{ 0xe3, F_NG },

#endif

	{ ',',  COMMA   },
	{ ' ',  WBOUND  },
	{ '\t', WBOUND  },
	{ '\'', S1      },
	{ '`',  S2      },
	{ '"',	SEMPH	},
	{ '#',  HYPHEN  },
	{ '(',  PPSTART },
	{ ')',  VPSTART },
	{ '*',  MBOUND  },
	{ '~',  BLOCK_RULES },
	{ '-',  SBOUND  }
};

#include "dic_comm.c"


